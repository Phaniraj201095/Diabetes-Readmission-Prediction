# Diabetes-Readmission-Prediction

Problem Setting- Diabetes is a major concern in this era. People go through rigorous and continuous treatment. But there’s always a fear of readmission. Hence diabetes readmission has become a major problem. In this project we predict the diabetes readmission rate using data mining techniques.

Problem Definition – Predict if a patient with Diabetes will be readmitted to the hospital within 30 days or no readmission/after 30 days.

Data Description - The dataset represents 10 years (1999-2008) of clinical care at 130 US hospitals and integrated delivery networks. It includes over 50 features representing patient and hospital outcomes. Information was extracted from the database for encounters that satisfied the following criteria.
(1) It is an inpatient encounter (a hospital admission).
(2) It is a diabetic encounter, that is, one during which any kind of diabetes was entered to the system as a diagnosis.
(3) The length of stay was at least 1 day and at most 14 days.
(4) Laboratory tests were performed during the encounter.
(5) Medications were administered during the encounter.
The data contains such attributes as patient number, race, gender, age, admission type, time in hospital, medical specialty of admitting physician, number of lab test performed, HbA1c test result, diagnosis, number of medication, diabetic medications, number of outpatient, inpatient, and emergency visits in the year before the hospitalization, etc.

Data Visualization – We are using R programming and Tableau for statistical and visualization exploration of data available for the project. At first we split the data into training and test after converting factors of level.

Data Mining Task – The data mining tasks we consider for this project are data reduction, data transformation, classification and prediction.

Data Mining Techniques – In the beginning we use ROSE (Random Over-Sampling Examples) data balancing technique which helps us to generate data synthetically. The data generated using ROSE is considered to provide better estimate of original data.
Later we are using Random Forest model for the Prediction Task. Random forest builds multiple decision trees and merges them together to get a more accurate and stable prediction. The reason we choose this model is because it is very flexible and ability to classify large amounts of data with accuracy. Using random forests, we analyze the data then report the mean error rate and the confusion matrix.
