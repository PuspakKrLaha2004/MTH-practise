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