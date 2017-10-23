function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model, Xval);
temp_lowest_error = mean(double(predictions ~= yval));

values_to_try = [3.*(10.^(-2:1)), (10.^(-2:1))];

for C_temp = values_to_try
    for sigma_temp = values_to_try
        model= svmTrain(X, y, C_temp, @(x1, x2) gaussianKernel(x1, x2, sigma_temp));
        predictions = svmPredict(model, Xval);
        current_error = mean(double(predictions ~= yval));

        if (current_error < temp_lowest_error)
            C = C_temp;
            sigma = sigma_temp;
        endif
    endfor
endfor

% =========================================================================

end
