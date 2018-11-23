test <- function(x) {
  
  for (i in seq_along(x)) {
    print(x[i])
  }
  
}

test1 <- function(x) {
  
  for (i in 1:4) print(x[i])
  
}

test2 <- function(x) {
  
  for (j in seq_len(ncol(x))) {
    for (i in seq_len(nrow(x))) {
      print(x[i,j])
    }
    
  }
}


cube <- function(x, n) {
        x^3
}

f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
