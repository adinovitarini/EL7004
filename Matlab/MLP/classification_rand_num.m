clear all;clc
tic
%define the input using random number between 0 and 1 
p = randi([0 1],6,5);
%define the target class 
tTemp(:,:,1) = [ones(1,5);
    [1 zeros(1,3) 1];
    [1 zeros(1,3) 1];
    [1 zeros(1,3) 1];
    [1 zeros(1,3) 1];
    ones(1,5)];
tTemp(:,:,2) = [[ones(1,3) zeros(1,2)];
      [zeros(1,2) 1 zeros(1,2)];
      [zeros(1,2) 1 zeros(1,2)];
      [zeros(1,2) 1 zeros(1,2)];
      [zeros(1,2) 1 zeros(1,2)];
      ones(1,5)];
tTemp(:,:,3) = [ones(1,5);
    [zeros(1,4) 1];
      [zeros(1,4) 1];
      ones(1,5);
      [1 zeros(1,4)];
      ones(1,5)];
%%  Parse the input data into a series
m_row = size(p,1);
n_col = size(p,2);
inp = zeros((m_row*n_col),1);
t = zeros((m_row*n_col),3);
count = 1;
for i = 1 : m_row 
    for j = 1 : n_col 
        inp(count,1) = p(i,j);
        t(count,:) = tTemp(i,j,:);
        count = count + 1;
    end
end
%%  Forward propagation 
m = size(inp,1);
n = size(inp,2);
nih = 2; %jumlah neuron hidden layer
alfa = .5; %learning rate 
wih = rand(n,nih);
woh = rand(nih,1);
b = ones(m,1);
k = forward(m,wih,inp);
a = forwardOut(m,woh,k)'
for i = 1:3
    e(i) = norm(t(i,:)-a)
end
iter = 0;
%%  Classify based on the smallest norm(error) as the target 
[val,idx] = min(e);
target = t(:,idx)
%%  Backpropagation
Y = target;
X = inp;
while norm(e)>0.01
for i=1:m
%delta output matrix 
a_dot(i) = dpurelin(a(i));
delta_output(i,:) = (Y(i)-a(i)).*a_dot(i);
e = .5*((Y(i)-a(i))'*(Y(i)-a(i)));
%delta of hidden layer 
delta_woh(i,:) = woh*delta_output(i,:);
transfer = dlogsig(wih,logsig(wih));
delta_hidden = [];
delta_hidden(i,:) = delta_woh(i,:)*transfer';
% update weight output  
woh_new = woh + alfa*(k(i,:)'*delta_output(i,:));
woh = woh_new;
% update weight hidden 
wih_new = wih + alfa*X(i,:)*delta_hidden(i,:)';
wih = wih_new;
k_new = forward(m,wih,X);
a_new = forwardOut(m,woh,k_new);
a = a_new;
iter = iter+1;
end
end
time_elapsed = toc;
mse_e = mse(Y,a);
rmse_e = sqrt(mse_e);
fprintf('number of iteration : %d\n',iter);
fprintf('the MSE value : %.2f \n',mse_e);
fprintf('the RMSE value : %.2f \n',rmse_e);
fprintf('Time elapsed : %.2f seconds\n',time_elapsed);
%% Plot
figure(1);clf
plot(inp,'ob','LineWidth',5);grid on 
hold on
plot(target,'om','LineWidth',5);
legend('Input data','Target data')
title('Plot before training phase')
ylim([-1 2])
figure(2);clf
plot(target,'om','LineWidth',5);grid on 
hold on
plot(a,'ok','LineWidth',5);grid on 
legend('target','net output','location','SouthEast')
title('Net output')
ylim([-1 2])
