function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
cost1 = 0;
cost2 = 0;
sum = 0;
for i = 1: m
    h = sigmoid(theta' * X(i, :)');
    cost1 = cost1 +  (-y(i) *log(h) - (1-y(i))*log(1-h));
end

for j = 2: size(theta) 
     cost2 = cost2 + theta(j) * theta(j);
end  
J = (cost1/m) + (lambda * cost2)/(2*m);
  
for i = 1: m
   h = sigmoid(theta' * X(i, :)');  
   for j = 1: size(theta)
      grad(j) = grad(j) + (h-y(i))* X(i, j);    
   end
end
grad(1) = grad(1)/m;

for j = 2: size(theta)    
   grad(j) = grad(j)/m + (lambda * theta(j))/m;
end








% =============================================================

end
