# Q1

rowTelescope <- function(A)
{
  n <- nrow(A)
  r <- numeric(n)
  for(k in 1:ncol(A))
  {
    r[k] <- sum(A[1:k])
  }
  return(r)
}
p2 <- rowTelescope(A)
p2

# Q2

lowerTriSum <- function(A){
  sum = 0
  for (i in 1:(dim(A)[1])){
    for (j in 1:i) {
      sum = sum + A[i,j]
    }
  }
  return(sum)
}

###########################
#u <- c(1:9)
#u
#A <- matrix(u, nrow= 3,  byrow = TRUE)
#p <- lowerTriSum(A)
#print(p)
#A
##############################

# Q3

diagDiff <- function(A){
  output <- numeric(length = nrow(A))
  output <- A[1,1]
  for (k in 2:nrow(A)) {
    output[k] <- A[k,k] - A[k-1,k-1]
  }
  return(output)
}

p1 <- diagDiff(A)
p1


# Q4

library(imager)
dog <- load.image("C:/Users/puspakkmr25/Downloads/dog.jpeg")
plot(dog)
dim(dog)


# Q5

invdiag <- function(A){
  inv <- numeric(length = nrow(A))
  for (i in 1:nrow(A)) {
    inv[i] <- (1/A[i,i])
  }
  p <- diag(inv, nrow = nrow(A))
  return(p)
}

invdiag(C)

C <- diag(c(1,2,3), nrow = 3)
C


# Q6

C.inv1 <- solve(C)
C.inv2 <- qr.solve(C)



# csqrt(Sigma) %*% (x - mu)
###
# finding a matrix Sigma ^ (-1)

# Q8

Sigma <- matrix(c(5,1,2,1,4,2,1,2,5), nrow = 3, ncol = 3)
eigen(Sigma)$values
svd.Sigma <- svd(Sigma)
U <- svd.Sigma$u
D <- svd.Sigma$d
Sigma.inv <- U %*% diag(D^(-0.5)) %*% t(U) 


# Q9 



######### DIAG
diag(c(5, 6), nrow = 3, ncol = 3)


# generating from mvn using package

library(mvtnorm)
mu <- c(1,2,3)
Sigma
draws <- rvnorm(1e3, mean = mu, sigma = Sigma)

# draw samples form mvn with mean vector = 0 and var matrix as I by converting the initial matrix and check ! 
