function [] = computeAndPlotDecisionBoundaryReg(X, y, lambda)
%COMPUTEANDPLOTDECISIONBOUNDARYREG
%

% Initialize some useful values
m = length(y); % number of training examples
initial_theta = zeros(size(X, 2), 1);

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Plot Boundary
plotDecisionBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))

% Labels and Legend
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')

legend('y = 1', 'y = 0', 'Decision boundary')
hold off;

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy (with lambda = %f): %f\n',lambda, mean(double(p == y)) * 100);

end