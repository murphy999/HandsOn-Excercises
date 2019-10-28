# Transform into Vector of Absolute Values (+ve values)
vec <- rep(c(-1,1),7000000) # rep repeats a value/vector of values many times

# -----------------------------------------------------------------------------

# Non-Vectorized Code
abs_loop = function(vec){
  for (i in vec) {
    if(vec[i]<0)
      vec[i] <- -vec[i]
  }
  vec
}

system.time(abs_loop(vec))
# Output (may vary from OS to OS) :
# user  system elapsed (in secs)
# 102.21   55.40  159.94

# -----------------------------------------------------------------------------

# Vectorized Code => logical test, subsetting & element-wise exeution
# uses logical subsetting to manipulate every -ve num in the vector at the same time.
abs_set = function(vec){
  negs <- vec<0                   
  vec[negs] <- vec[negs]*(-1)
  vec  
}

system.time(abs_set(vec)) 

# Output (may vary from OS to OS) :

# user  system elapsed (in secs)
# 0.25    0.04    0.29 

# Input - 70000000
# user  system elapsed 
# 2.10    0.72    2.85 

# -----------------------------------------------------------------------------

# Pre-existing R function are already vectorized and have been optimized to perform quickly
system.time(abs(vec))

# Output (may vary from OS to OS

# Input - 7000000
# user  system elapsed 
# 0       0       0 

# Input - 70000000
# Output (may vary from OS to OS) :
# user  system elapsed 
# 0.36    0.14    0.50 


