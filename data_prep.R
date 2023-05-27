library(tidyverse)

books <- read_csv("books.csv")

glimpse(books)
dim(books)

summary(books$average_rating)
summary(books$text_reviews_count)

colSums(is.na(books))

# Check if missing values occur in the same rows across multiple variables
missing_rows <- complete.cases(books$average_rating, books$num_pages)

# Count the number of rows with missing values in the same rows
missing_rows_count <- sum(!missing_rows)

# Print the count of rows with missing values in the same rows
missing_rows_count #all in the same row.

books <- na.omit(books)

colSums(is.na(books))

ggplot(books, aes(x = average_rating)) +
  geom_histogram(binwidth = 0.5, fill = "steelblue", color = "white") +
  labs(x = "Rating", y = "Count", title = "Distribution of Book Ratings")


# Rename the "text_reviews_count" column to "reviews_count"
books <- books %>%
  rename(reviews_count = text_reviews_count)
