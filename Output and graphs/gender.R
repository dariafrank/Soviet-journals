data <- read.csv("Soviet Journals.csv")
ls(data)

# Remove 'letters' from the dataset (this includes letters from the readers and from authors)
data <- data %>%
  filter(year >= 1956 & year <= 1990, # years 1956 through 1990
         type != "readers_letters" )        # exclude readers letters

# Remove rows with missing values in gender
data <- data %>%
  filter(!is.na(gender))

# Assign periods to the data
data <- data %>%
  mutate(period = case_when(
    year >= 1956 & year <= 1967 ~ "thaw",
    year >= 1968 & year <= 1980 ~ "stagnation",
    year >= 1981 & year <= 1990 ~ "eighties"
  ))

# levels
data$period <- factor(data$period, levels = c("thaw", "stagnation", "eighties"))

library(dplyr)

# proportion of female authors in each period (total)
female_proportion <- data %>%
  group_by(period) %>%
  summarize(proportion_female = mean(gender == 1), .groups = 'drop')

print(female_proportion)

# Identify unique authors and their gender
unique_authors <- data %>%
  select(author_id, gender) %>%
  distinct()

# number of unique female authors and total unique authors
author_stats <- unique_authors %>%
  summarize(
    total_authors = n(),
    female_authors = sum(gender == 1)
  )

# prop of female authors
author_stats$proportion_female = author_stats$female_authors / author_stats$total_authors

print(author_stats)

#### Fiction female authors #### 
fiction_data <- data %>%
  filter(type %in% c("novel", "novella", "short_fiction"))
# levels
fiction_data$journal <- recode(fiction_data$journal, "NM" = "Novy Mir", "ZN" = "Znamya", "IU" = "Iunost", "OKT" = "Oktyabr", "ZV" = "Zvezda", "NS" = "Nash Sov")
fiction_data$journal <- factor(fiction_data$journal, levels = c("Novy Mir", "Iunost", "Zvezda", "Znamya", "Nash Sov","Oktyabr"))

# proportion of fiction female authors in each period (total)
female_fiction_proportion <- fiction_data %>%
  group_by(period) %>%
  summarize (proportion_fiction_female = mean(gender==1), .groups = 'drop')

print(female_fiction_proportion)

# Unique female authors 
unique_fiction_authors <- fiction_data %>%
  select(author_id, gender) %>%
  distinct()

fiction_author_stats <- unique_fiction_authors %>%
  summarize(
    total_authors = n(),
    female_fiction_authors = sum(gender==1)
  )

fiction_author_stats$proportion_fiction_female = fiction_author_stats$female_fiction_authors / fiction_author_stats$total_authors
print(fiction_author_stats)

# total number of fiction publications by period and journal
total_fiction_counts_by_period_journal <- table(fiction_data$period, fiction_data$journal)

# counts of female-authored works by period and journal
female_fiction_counts_by_period_journal <- table(female_fiction_data$period, female_fiction_data$journal)
female_fiction_data$journal <- factor(female_fiction_data$journal, levels = c("Novy Mir", "Iunost", "Zvezda", "Znamya", "Nash Sov","Oktyabr"))

#  prop of female-authored works by period and journal
proportion_female_fiction_by_period_journal <- female_fiction_counts_by_period_journal / total_fiction_counts_by_period_journal

# dataframe
proportion_female_fiction_df <- data.frame(
  period = rep(rownames(proportion_female_fiction_by_period_journal), each = ncol(proportion_female_fiction_by_period_journal)),
  journal = rep(colnames(proportion_female_fiction_by_period_journal), times = nrow(proportion_female_fiction_by_period_journal)),
  proportion_female_fiction = c(proportion_female_fiction_by_period_journal)
)

print(proportion_female_fiction_df)

# plot
library(ggplot2)

proportion_female_fiction_df$journal <- factor(proportion_female_fiction_df$journal, levels = c("Novy Mir", "Iunost", "Zvezda", "Znamya", "Nash Sov", "Oktyabr"))

ggplot(proportion_female_fiction_df, aes(x = period, y = proportion_female_fiction, fill = journal)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = sprintf("%.2f", proportion_female_fiction)), position = position_dodge(width = 0.9), vjust = -0.5, color = "gray", size = 3) +
  labs(x = "Period", y = "Proportion of Female-Authored Works in Fiction", fill = "Journal") +
  ggtitle("Proportion of Female-Authored Fiction Works by Period and Journal") +
  theme_minimal()


#### Poetry female authors #### 
poetry_data <- data %>%
  filter(type %in% c("poetry"))

# total number of poetry publications by period and journal
total_poetry_counts_by_period_journal <- table(poetry_data$period, poetry_data$journal)

# counts of female-authored works in poetry by period and journal
female_poetry_data <- poetry_data %>%
  filter(gender == 1)
female_poetry_counts_by_period_journal <- table(female_poetry_data$period, female_poetry_data$journal)

# prop of female-authored works in poetry by period and journal
proportion_female_poetry_by_period_journal <- female_poetry_counts_by_period_journal / total_poetry_counts_by_period_journal

# dataframe
proportion_female_poetry_df <- data.frame(
  period = rep(rownames(proportion_female_poetry_by_period_journal), each = ncol(proportion_female_poetry_by_period_journal)),
  journal = rep(colnames(proportion_female_poetry_by_period_journal), times = nrow(proportion_female_poetry_by_period_journal)),
  proportion_female_poetry = c(proportion_female_poetry_by_period_journal)
)

print(proportion_female_poetry_df)

# plot (female poets)
proportion_female_poetry_df$journal <- factor(proportion_female_poetry_df$journal, levels = c("Novy Mir", "Iunost", "Zvezda", "Znamya", "Nash Sov", "Oktyabr"))

ggplot(proportion_female_poetry_df, aes(x = period, y = proportion_female_poetry, fill = journal)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = sprintf("%.2f", proportion_female_poetry)), position = position_dodge(width = 0.9), vjust = -0.5, color = "gray", size = 3) +
  labs(x = "Period", y = "Proportion of Female-Authored Works in Poetry", fill = "Journal") +
  ggtitle("Proportion of Female-Authored Poetry Works by Period and Journal") +
  theme_minimal()








