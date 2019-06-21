# DD - Diamonds             7 - Sevens 
# BBB - Triple Bars         BB - Double Bars
# B - Single Bar            C - Cherries
                  # 0 - Zeroes

# Step 4: Play It!!
slot_display <- function(prize_won){
  
  # Extracted the symbols
  symbo <- attr(prize_won,"symbols")
  
  # Collapsed 3 strings in symbo into a single-character string. Seperated by a space.
  symbo <- paste(symbo,collapse = " ")
  
  if(prize_won > 0)
    cat("Congrats!! You Have WON \n")
  
  cat(paste(symbo,prize_won,sep = "\n$"))
}

slot_display(play())



# Step 2: Getting the Results
play <- function(){
  symb <- get_symbols()
  reward <- score(symb)
  attr(reward,"symbols") <- symb
  reward
}

# Step 1: Display Symbol on Slot Machine
get_symbols <- function(){
  wheel <- c("DD","7","BBB","BB","B","C","0")
  sample(wheel, size = 3, replace = TRUE, prob = c(0.05,0.07,0.06,0.1,0.25,0.1,0.4))
}

# Step 3: Score
# Case 1 : All 3 same value => Look up Prize
# Case 2 : All Bars => assign $5
# Case 3 : Count Cherries
# If diamonds present in above 3 scenarios => adjust the scoring prize

score <- function(symb){
  
  # Case 1
  if(all(symb == symb[1])){
    payouts <- c("DD"=100,"7"=80,"BBB"=40,"BB"=25,"B"=10,"C"=10,"0"=0)
    prize <- unname(payouts[symb[1]])
  }
  
  # Case 2 
  else if(all(symb %in% c("BBB","BB","B"))){
    prize <- 5
  }
  
  # Case 3
  else{
    count_cheery <- sum(symb %in% "C") + 1 # +1 because indexing starts at 1
    # sum = 0 => $0, 1 => $2, 2 => $5, 3 => case 1
    prize <- c(0,2,5)[count_cheery]
  }
  
  # adjust for diamonds
  prize * 2 ^ sum( symb == "DD")  
}

# Note 1:
# Code for case 1 and 3, the program contains look up tables rather than if else stmts.
# Reason - 
#   if else stmts require R to run multiple tests as it works down the if tree.
#   it can be difficult to use if tree in vectorized code.
#   Look up tables do not suffer from these issues/ drawbacks.
# 
# Use if tree if each branch of the tree runs different code.   
# Use a look up table if each branch of the tree only assigns a different value.

# Note 2:
#   cat is useful for producing output in user-defined functions. 
#   It converts its arguments to character vectors, concatenates them to a single character vector, 
#   appends the given sep =  string(s) to each element and then outputs them.

#-----------------------------------------------------------------------
