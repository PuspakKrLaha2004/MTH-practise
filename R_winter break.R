# Create a 3×3 matrix filled column-wise
m <- matrix(1:9, nrow = 3, ncol = 3)
m + 10:18

x <- c(1,2,3)
x
x+ c(1,3,5)
x*c(1,1,0)


# ASSIGNMENTS 
# PAGE 12 pdf [ R FOR DATA SCIENCE ]

#Q1
library(ggplot2)
ggplot(data = mpg)


nrow(mtcars)


?mpg
d <- mtcars
d


ggplot(data = mpg)+
  geom_point(mapping=aes(x=cyl , y=cyl))


ggplot(data = mpg)+
  geom_point(mapping=aes(x=class , y=drv))



# PAGE 38 pdf [ R FOR DATA SCIENCE ]

#Q1
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy, color = "blue")
  )


ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy,
                 size = cty))


ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy,
                 color = cty,
                 size  = cty))


ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy),
             shape = 21,
             fill  = "yellow",
             color = "black",
             stroke = 3,
             size = 5)


ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy,
                 color = displ))


# PAGE 41 pdf [ R FOR DATA SCIENCE ]

#Q1

ggplot(data = mpg)+
  geom_point(mapping = aes(x = year, y = displ))+
  facet_grid(drv ~ cyl)


#Q3
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)




# PAGE _ 372 of pdf

library(tibble)
library(ggplot2)

set.seed(123)

sim1 <- tibble(
  x = rep(1:10, each = 3),                # total 30 rows
  y = 1.5 * x + 6 + rnorm(30, sd = 2)     # also 30 values
)

ggplot(sim1, aes(x, y)) +
  geom_point()


models <- tibble(
  a1 = runif(250, -20, 40),
  a2 = runif(250, -5, 5)
)
ggplot(sim1, aes(x, y)) +
  geom_abline(
    aes(intercept = a1, slope = a2),
    data = models, alpha = 1/4
  ) +
  geom_point()


model1 <- function(a, data) {
  a[1] + data$x * a[2]
}
model1(c(7, 1.5), sim1)


# Working with Diamonds dataset

library(ggplot2)

ggplot(diamonds, aes(carat, price)) +
  geom_bin2d(bins=50)

library(dplyr)

diamonds2 <- diamonds %>%
  filter(carat <= 2.5) %>%
  mutate(lprice = log2(price), lcarat = log2(carat))

ggplot(diamonds2, aes(lcarat, lprice)) +
  geom_bin2d(bins = 50)


library(gapminder)
gapminder



# Geometric objetcs exercise

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy, color = drv)
) +
  geom_point() +
  geom_smooth(se = FALSE)



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
  ) +
  geom_smooth(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
  )


#Q6

# 1
ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
  ) +
  geom_smooth(
    data = mpg,
    mapping = aes(x = displ, y = hwy),se = FALSE
  )


# 2
ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
  ) +
  geom_smooth(
    data = mpg,
    mapping = aes(x = displ, y = hwy,group=drv),color='blue', se = FALSE)  # if color is given inside 'aes' then it treats it as just another aesthetic


# 3
ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x = displ, y = hwy,color=drv)
  ) +
  geom_smooth(
    data = mpg,
    mapping = aes(x = displ, y = hwy,color=drv), se = FALSE)

# 4
ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x = displ, y = hwy,color=drv)
  ) +
  geom_smooth(
    data = mpg,
    mapping = aes(x = displ, y = hwy,linetype=drv), se = FALSE)


# 5


# Workflow basics EX

# Q2

library(tidyverse)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))
filter(mpg, 'cyl = 8')
filter(diamonds, carat > 3)


# dplyr package

library(nycflights13)
library(tidyverse)

flights
print(filter(flights, (arr_delay > 120)))
filter(flights, dest %in% c("IAH", "HOU"))

flights %>% 
  summarise(num_missing = sum(is.na(dep_time)))


# arrange exercise

flights %>% 
  arrange(desc(is.na(dep_time)))
