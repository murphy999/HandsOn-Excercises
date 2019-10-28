# Installation Process
install.packages("sparklyr")
library(sparklyr)
spark_install(version = "2.0")
library(dplyr)
# ------------------------------------------

# Connected to spark "local" mode
sc <-  spark_connect(master = "local")

# To read CSV file into Spark
# spark_read_csv(spark_connection, name to assign to table, path of file)
pokemon_Data <- spark_read_csv(sc,name="PokemonD",path = "C:\\Users\\A734917\\Desktop\\Pokemon_DS.csv")

# Check the data set available in the cluster
src_tbls(sc)

# To View Structure of tibble
str(pokemon_Data)

# To View Structure of data
glimpse(pokemon_Data)
# ------------------------------------------

summary_Poke_Data <- pokemon_Data %>% 
                     group_by(Type_1)%>%
                     summarise(count = n(),speed = mean(speed),hp = mean(hp))%>% 
                     collect
summary_Poke_Data
# ------------------------------------------

# Window Functions of dplyr
# min_rank, dense_rank, cume_dist(), percent_rank, ntile()

# Top 3 Pokemons based on attack and their types - min_rank()
top_Attack_Pokemon <- pokemon_Data %>% group_by(Type_1,Type_2)%>%
                      filter(min_rank(desc(attack))<=3)%>%
                      filter(Type_1 == "Water");top_Attack_Pokemon
# ------------------------------------------

# Created ratio for sp.Atk/attack & sp.Def/defense
mutate(pokemon_Data,atkRatio = Sp_Atk/Attack,defRatio = Sp_Def/Defense)
# ------------------------------------------

# Compared Pokemon Stats - Attack, Defense, HitPoints(HP - Damage it can take)
rowwise(as.data.frame(pokemon_Data)) %>% mutate(maxStats = max(HP,Attack,Defense))
# ------------------------------------------

# SQL
library(DBI)
dbGetQuery(sc,'SELECT * FROM pokemond WHERE Type_1 = "Dark" LIMIT 10')
# ------------------------------------------

# Pokemon Count type wise
pokemon_Data %>% group_by(Type_1) %>% tally() %>% arrange(desc(n)) %>% head(100) %>%
  collect() %>%
  with(wordcloud::wordcloud(
    Type_1, 
    n,
    colors = c("#999999", "#E69F00", "#56B4E9","#56B4E9")))

# ------------------------------------------


















# Partition spark DF into groups(training & test).
partition_pokemon <- sdf_random_split(pokemon_Data,training = 0.6,test = 0.4)

# Create a hive metadata for each partition
# Here we register Spark Data Frame (giving a table name for the Spark SQL context), 
# take returns a tbl_spark.

sdf_register(partition_pokemon,c("trainingDS","testDS"))

# Select col for Analysis
selected_column <- tbl(sc,"trainingDS")%>% select(HP,Attack,Defense,Speed,Type_1)

# Spark ML Decision Tree Model
model_pokemon_1 <- selected_column %>% ml_decision_tree(response = "Type_1",features = c("HP","Attack","Defense","Speed"))

test_pokemon <- tbl(sc,"testDS")

pred_pokemon <- ml_predict(model_pokemon_1,test_pokemon)%>%collect


table(pred_pokemon$Name,pred_pokemon$Type_1, pred_pokemon$prediction)

spark_disconnect(sc)


# NOTE

# 1. The family of functions prefixed with sdf_ generally access the Scala Spark DataFrame 
#    API directly,as opposed to the dplyr interface which uses Spark SQL.




