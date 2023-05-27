library(tidyverse)

books <- read_csv("books.csv")

glimpse(books)
dim(books)

summary(books$average_rating)
summary(books$text_reviews_count)



colSums(is.na(books))

colnames(books)

ggplot(books, aes(x = average_rating)) +
  geom_histogram(binwidth = 0.5, fill = "steelblue", color = "white") +
  labs(x = "Rating", y = "Count", title = "Distribution of Book Ratings")



# Identify and handle missing values
# For example, impute missing values using mean, median, or other suitable methods:
books$review_count <- ifelse(is.na(books$review_count), mean(books$review_count, na.rm = TRUE), books$review_count)

