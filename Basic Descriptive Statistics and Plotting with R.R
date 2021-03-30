#Set Directory
setwd("C:/Users/medma/Documents/MBA/Data Mining/rcode")

#Retrieve Data
college <- read.csv("../data/College.csv", na.strings = "-999")

#View Data
View(college)

#Add school names as row names, and remove school names column
rownames(college) <- college[,1]
college <- college[,-1]

#Number of public and private schools
table(college$Private)

#Summary of Variables
summary(college)

#Removal of missing values
college <- na.omit(college) #rows that contain missing values are removed

#Scatterplot Matrix
str(college)
pairs(college[c("Apps", "Accept", "Enroll", "Top10perc", "Top25perc",
                "F.Undergrad", "P.Undergrad", "Outstate", "Room.Board",
                "Books", "Personal", "PhD","Terminal", "S.F.Ratio",
                "perc.alumni", "Expend", "Grad.Rate")])

#Scatterplot of New Students Enrolled vs. Full-Time Undergraduates
plot(x = college$Enroll,
     y = college$F.Undergrad,
     main = "New Students Enrolled vs. Full-Time Undergraduates",
     xlab = "Newly Enrolled",
     ylab = "Full-Time Undergrads")

#Boxplot of Public/Private vs. Out-of-State Tuition
boxplot(college$Outstate~college$Private,
        main = "Out of State Tuition Comparison",
        xlab = "Is private?",
        ylab = "Out of State Tuition ($)")

#Scatterplot of Student/Faculty Ratio vs. Instructional Expenditure per Student
plot(x = college$S.F.Ratio,
     y = college$Expend,
     main = "Student/Faculty Ratio vs Instructional Expendure Per Student",
     xlab = "S.F. Ratio",
     ylab = "Expendure")

#Histogram of Percent of Alumni Who Donate
hist(college$perc.alumni,
     main = "Alumni Donation Percentage",
     xlab = "Percentage",
     breaks = 7)

