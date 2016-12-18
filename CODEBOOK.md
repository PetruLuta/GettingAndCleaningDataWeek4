Code Book
===========

This is a description of the variables in the tidyData.csv dataset. This dataset was obtained by transforming the original dataset containing measurements from Samsung Galaxy S accelerometers provided by UCI Machine Learning Repository. The following transformations were applied on the original data:

1. The training and test data were merged into one dataset.
2. Only the measurements on the mean and standard deviation were selected.
3. These measurements were aggregated by activity and individual using the mean function.

A more detailed description of each step is provided in the README.md file and run_analysis.R file here https://github.com/PetruLuta/GettingAndCleaningDataWeek4.
The final dataset contains only the averages by activity and by individual of the measurements on the mean and standard deviation from the original dataset.

===========

VARIABLE NAME   VARIABLE TYPE               VARIABLE DESCRIPTION
ACTIVITY        factor, 6 levels            Activity performed by subject (Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying)
SUBJECT         factor, 30 levels           Subject ID [1..30]

Measurement variable names are constructed using the following principle:

VARIABLE                        NAME        DESCRIPTION
Prefix							t			time domain signals
								f			frequency domain signals
Acceleration signal type 		Body		body acceleration signal
								Gravity		gravity acceleration signal
Sensor							Acc			accelerometer sensor
								Gyro		gyroscope sensor
Signal type						Jerk		jerk signal obtained from the body linear acceleration and angular velocity
Signal strength					Mag			magnitude of the signal calculated using the Euclidean norm
Variable estimation	method		mean()		mean value
								std()		standard deviation
Axis							X			X axis
								Z			Z axis
								Y			Y axis