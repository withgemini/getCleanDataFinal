
trainData <- read.csv("./train/X_train.txt",header=FALSE,sep="")
testData <- read.csv("./test/X_test.txt",header=FALSE,sep="")

columnHeaderRaw <- read.csv("./features.txt",header=FALSE,sep="")
columnHeader <- columnHeaderRaw[[2]]
colnames(trainData) <- columnHeader
colnames(testData) <- columnHeader

trainActivity <- read.csv("./train/y_train.txt",header=FALSE,sep="")
testActivity <- read.csv("./test/y_test.txt",header=FALSE,sep="")
colnames(trainActivity) <- "activityNum"
colnames(testActivity) <- "activityNum"

trainSubject <- read.csv("./train/subject_train.txt",header=FALSE,sep="")
testSubject <- read.csv("./test/subject_test.txt",header=FALSE,sep="")
colnames(trainSubject) <- "subjectNum"
colnames(testSubject) <- "subjectNum"

trainDataNumActivitySubject <- cbind(trainActivity, trainData, trainSubject)
testDataNumActivitySubject <- cbind(testActivity, testData, testSubject)

activityTable <- read.csv("./activity_labels.txt",header=FALSE,sep="")
colnames(activityTable) <- c("activityNum", "activityName")

trainComplete <- merge(activityTable, trainDataNumActivitySubject, by.x="activityNum", by.y="activityNum", all=TRUE)
testComplete <- merge(activityTable, testDataNumActivitySubject, by.x="activityNum", by.y="activityNum", all=TRUE)

allData <- rbind(trainComplete, testComplete)

numColMeanStd <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)
numColMeanStdShifted <- c(2,numColMeanStd + 2, 564)

subsetMeanStr <- subset(allData, select=numColMeanStdShifted)
names(subsetMeanStr)



tidynumCol <- c(1:3, 41:43, 81:83, 121:123, 161:163, 201, 214, 227, 240, 253, 266:268, 345:347, 424:426, 503, 516, 529, 542)
tidynumColShifted <-c(2,tidynumCol + 2, 564)
tidyRaw <- subset(allData, select=tidynumColShifted)
tidyCol <- names(tidyRaw)
tidyVar <- tidyCol[-c(1,35)]

install.packages("reshape2")
library(reshape2)
tidyMelt <- melt(tidyRaw, id=c("activityName", "subjectNum"), measure.vars=tidyVar)

tidyData <- dcast(tidyMelt, activityName + subjectNum ~ variable, mean)
