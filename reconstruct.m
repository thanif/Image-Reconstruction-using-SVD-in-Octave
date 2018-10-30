
% Reading the image

%X = imread('dino.jpg');

%X = im2double(X);

% Reading and Corrupting the image

X = corruptImage('tc.jpg',5,false);

X = rgb2gray(X);

% Storing mmissing values

missData = isnan(X);

%missData = X==0;

% Initializing missing values with 0

X(missData) = 0;

% Reconstruction using Singular Value Decomposition

error = 1;

while error >= 10^-15

	[U,S,V] = svd(X);

	[r,c] = size(U);

	NS = S(1:10,1:10);

	NU = U(:,1:10);

	NV = V(:,1:10);

	NI = NU*NS*transpose(NV);
	
	temp = X;
	
	X(missData) = NI(missData);
	
	new = X;
	
	error = norm(temp-new)^2/norm(temp)^2;
	
end	

figure;
subplot(1,1,1);
imagesc(X);
title('5 as Block Size with 0 as Initialization Method')