# Image-Reconstruction-using-SVD-in-Octave

# Algorithm

1. Store the missing values (missing pixels have nan value)
2. Replace nan values by some initial value, e.g., zero or column mean 
3. Repeat 

a. Do an SVD decomposition of X, X = USV

b. Retain only the k highest eigen values and corresponding eigen vectors and construct Uc and Vc accordingly from the k vectors

c. Estimate Xest = Uc Sc Vc

d. From Xest fill in missing values in X (only the missing values NOT the non-missing values)



Call the given function to corrupt an image and return its grayscale representation:

X = corruptImage(fileName,blockSize,displayImage)
By default the blockSize is 5 and the boolean value to displayImage is set to true.
