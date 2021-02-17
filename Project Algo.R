
diabetes <- read.csv("C:/Users/Admin/Documents/R Programming/diabetic_data.csv")
diabetes1 <- subset(diabetes,select=-c(encounter_id, patient_nbr, examide,citoglipton,weight, payer_code, medical_specialty)) 
diabetes2 <- diabetes1[diabetes1$race != "?",] # No. of observations drops by 2273
diabetes2 <- diabetes2[diabetes2$diag_1 != "?",] # No of observations drops by 21
diabetes2 <- diabetes2[diabetes2$diag_2 != "?",] # No of observations drops by 358
diabetes2 <- diabetes2[diabetes2$diag_3 != "?",] # No of observations drops by 1453
diabetes2$readmittedbin <- ifelse(diabetes2$readmitted == "<30",1,0) 
diabetes3 <- cbind(diabetes2[c(7:13,17)], lapply(diabetes2[c(1:6,14:16,18:44)],factor))

## install.packages("caret", dependencies = TRUE)
library(caret)
inTrain <- createDataPartition(diabetes3$readmittedbin, p=.2, list=FALSE)
objTrain <-diabetes3[inTrain,]
objTest <- diabetes3[-inTrain,]
table(objTrain$readmittedbin)
library(ROSE)
data.rose <- ROSE(readmittedbin ~ time_in_hospital + num_lab_procedures + num_procedures + num_medications + number_outpatient + number_emergency + number_inpatient + race + age + admission_type_id + discharge_disposition_id + admission_source_id + number_diagnoses + max_glu_serum + A1Cresult + metformin + insulin, data = objTrain,seed=1)$data
table(data.rose$readmittedbin)

library(randomForest)
rf.diabetes_bin <- randomForest(readmittedbin ~ time_in_hospital + num_lab_procedures + num_procedures + num_medications + number_outpatient + number_emergency + number_inpatient + race + age + admission_type_id + discharge_disposition_id + admission_source_id + number_diagnoses + max_glu_serum + A1Cresult + metformin + insulin, data = objTrain,importance=TRUE)
rf.diabetes_bin
rf.predict_bin <- predict(rf.diabetes_bin,newdata =objTest)
rf.predict_bin
write.csv(rf.predict_bin, file = 'test1.csv')

library(e1071)
rf.cm_bin <- confusionMatrix(rf.predict_bin,objTest$readmittedbin)
rf.cm_bin$table

rf.cm_bin$overall[1]*100
