# Tutorial to run the MATLAB file 
1. Download the 'MLP' in one folder on your PC
2. Open Matlab 
3. Set your folder direction into the downloaded folder in step (1) 
4. in command window, write >>edit
5. In M-File, you could open file and choose the 'XOR' or 'classification_rand_num' file
6. Run the code
# Simple Explanation
##  XOR Classification 
![image](https://user-images.githubusercontent.com/46149713/188255866-987e93df-4589-49c3-9ee4-6dbeb65bb483.png)
The XOR gate have the logic gate like this : 
![image](https://user-images.githubusercontent.com/46149713/188255878-a3af1a6a-be41-46d2-b3c5-6fcb4e0266d5.png)
After the training process, you would get the plot like this figure :
![image](https://user-images.githubusercontent.com/46149713/188255896-c09a422d-50dc-40d6-b509-3c3aa14a5cf8.png)
The first and second subplot define the input for XOR gate, meanwhile the third subplot define the target. Fourth subplot define the output network after training process. In this phase, you could change the number of neuron in hidden layer and the learning rate. If you would like to change the activation function, you should change the code in forward.m and forwardOut.m files and do not forget to change the derivative in main code. 
##  Number Identifier
First of all, I try to define the target data into (0) and (1) to classify the number of 0, 1, 2 (you could access the full problem statement from the book : Neural Network Design 2nd Edition by Martin T. Hagan et al (2014) on page 203). <br/>
Then, I parse the muldimensional array of input and target into one-dimensional-array, and I use the training scheme in COR problem to classify this problem. First figure is shown below show us about the input and target data in one-dimensional-array
![image](https://user-images.githubusercontent.com/46149713/188256047-04daca94-de31-4361-a7b0-f24ac5c470ce.png)
<br/>
This figure show us the network output after the training phase
![image](https://user-images.githubusercontent.com/46149713/188256055-6b39b5c3-f64e-4ccc-86ac-93b2beb0d7bc.png)
<br/>
All the indicator of training phase will be display in command window
