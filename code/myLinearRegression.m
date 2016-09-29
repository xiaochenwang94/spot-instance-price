function [y_predict]=myLinearRegression(X_train,y_train,X_test)
%% in: X_train,y_train,X_test
%  out: y_predict
    

% Normalize X
    muTrain = mean(X_train(:,2));mxTrain = max(X_train(:,2));miTrain = min(X_train(:,2));
    muTest = mean(X_test(:,2));mxTest=max(X_test(:,2));miTest=min(X_test(:,2));
    X_train = (X_train-muTrain)/(mxTrain-miTrain);
    X_test = (X_test-muTest)/(mxTest-miTest);
    
    fprintf('Running gradient descent ...\n');
    
    % Choose some alpha value
    alpha = 0.1;
    num_iters = 400;

    % Init Theta and Run Gradient Descent 
    theta = zeros(size(X_train,2), 1);
    [theta, J_history] = gradientDescentMulti(X_train, y_train, theta, alpha, num_iters);
    
    fprintf('Theta computed from gradient descent: \n');
    fprintf(' %f \n', theta);
    fprintf('\n');
    
    y_predict = X_test * theta;
    
end