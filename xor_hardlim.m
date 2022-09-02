clear all
clc
clf
tic
X = [0 1;1 0;1 1;0 0];
Y = [1;1;0;0];
m_row = size(X,1);
n_col = size(X,2);
nih = 3; %jumlah neuron hidden layer
alfa = .5; %learning rate 
wih = rand(n_col,nih);
woh = rand(nih,1);
b = ones(m_row,1);
k = forward(m_row,wih,X);
a = forwardOut(m_row,woh,k)';
e = (Y-a)'*(Y-a);
iter = 0;
while norm(e)>0.01
for i=1:m_row
%delta output matrix 
a_dot(i) = dpurelin(a(i));
delta_output(i,:) = (Y(i)-a(i)).*a_dot(i);
e(i) = .5*((Y(i)-a(i))'*(Y(i)-a(i)));
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
k_new = forward(m_row,wih,X);
a_new = forwardOut(m_row,woh,k_new);
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
t = [1:4]';
subplot(221)
plot(t,X(:,1),'ob','LineWidth',2);
grid on
title('input[1]')
subplot(222)
plot(t,X(:,2),'or','LineWidth',2);
grid on
title('input[2]')
subplot(223)
plot(t,Y,'ok','LineWidth',2);
grid on
title('target')
subplot(224)
plot(t,a,'om','LineWidth',2);
grid on
title('net out')