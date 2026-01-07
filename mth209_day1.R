# Q1
A <- matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3, ncol = 3)
A
B <- matrix(c(1,2,3,1,2,3,1,1,1),nrow = 3, ncol = 3)
B
c <- A %*% B
c
sum <- 0
for (k in 1:3)
{
  sum <- sum + as.matrix(A[,k]) %*% B[k,]
}
sum
all.equal(sum, truth)

# Q2
n <- 1000
A <- matrix(runif(n^2), nrow = n, ncol = n)
time <- system.time(A%*%A)[3]
time

# Q3
times <- numeric(length = 7)
v <- c(1e2, 5e2, 1e3, 2e3, 3e3, 4e3, 5e3) 
for (i in 1:7){
  n <- v[i]
  A <- matrix(runif(v[i]^2), nrow = n, ncol = n)
  times[i] <- system.time(A%*%A)[3]
}

plot(v,times)

# Q4
n <- 1000
A <- matrix(runif(n^2), nrow=n, ncol=n)
A <- t(A) %*% A

## standard
solve.A.inv <- solve(A)
solve.A.inv %*% A
time <- system.time(solve.A.inv)
time

## qr solve
A.inv <- qr.solve(A)
time <- system.time(A.inv)
time

## cholesky
# Cholesky decomposition
R <- chol(A) # A = R^T R
# Inverse via Cholesky
A.inv <- chol2inv(R)

## Singular Value Decomposition
svd_A <- svd(A)

U <- svd_A$u
D <- svd_A$d
V <- svd_A$v

# Inverse via SVD
A.inv <- V %*% diag(1 / D) %*% t(U)
