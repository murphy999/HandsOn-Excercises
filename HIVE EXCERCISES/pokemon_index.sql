SELECT AVG(hp) FROM poke WHERE type1 = "Water";

CREATE INDEX Pokedex
ON TABLE poke (hp)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler'
WITH DEFERRED REBUILD;

ALTER INDEX Pokedex on poke REBUILD;

show formatted index on poke;

SELECT AVG(hp) FROM poke WHERE type1 = "Water";

CREATE INDEX Pokedex_bitmap
ON TABLE poke (hp)
AS 'BITMAP'
WITH DEFERRED REBUILD;
ALTER INDEX Pokedex_bitmap on poke REBUILD;

show formatted index on poke;

SELECT AVG(hp) FROM poke WHERE type1 = "Water";

DROP INDEX IF EXISTS Pokedex ON poke;

show formatted index on poke;

SELECT AVG(hp) FROM poke WHERE type1 = "Water";
#---------------------------------------------------

Time taken: 85.632 seconds, Fetched: 1 row(s)
#---------------------------------------------------

idx_name            	tab_name            	col_names           	idx_tab_name        	idx_type            	comment             
	 	 	 	 	 
	 	 	 	 	 
pokedex             	poke                	hp                  	default__poke_pokedex__	compact   
#---------------------------------------------------     

Time taken: 50.53 seconds, Fetched: 1 row(s)
OK
#---------------------------------------------------

idx_name            	tab_name            	col_names           	idx_tab_name        	idx_type            	comment             
	 	 	 	 	 
	 	 	 	 	 
pokedex             	poke                	hp                  	default__poke_pokedex__	compact             	
pokedex_bitmap      	poke                	hp                  	default__poke_pokedex_bitmap__	bitmap       
#---------------------------------------------------

Time taken: 45.508 seconds, Fetched: 1 row(s)
#---------------------------------------------------

idx_name            	tab_name            	col_names           	idx_tab_name        	idx_type            	comment             
	 	 	 	 	 
	 	 	 	 	 
pokedex_bitmap      	poke                	hp                  	default__poke_pokedex_bitmap__	bitmap       
#---------------------------------------------------

Time taken: 52.709 seconds, Fetched: 1 row(s)

  

