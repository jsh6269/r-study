# factor (no order)
gender_vec <- c("male", "female", "male", "male")
gender_vec <- factor(gender_vec)
gender_vec
class(gender_vec)

# factor (has order)
day_vec <- c("evening", "morning", "midnight", "evening", "midnight")
day_vec <- factor(day_vec, levels=c("morning", "evening", "midnight"), ordered=TRUE)
day_vec

summary(gender_vec)
summary(day_vec)
sort(day_vec)
