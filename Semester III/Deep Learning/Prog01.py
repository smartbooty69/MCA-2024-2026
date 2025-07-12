import numpy as np

def Adaline(Input, Target, lr=0.2, stop=0.001):
    weight = np.random.random(Input.shape[1])
    bias   = float(np.random.random(1))
   
    
    Error = [stop + 1, stop + 2]
    
    while Error[-1] > stop or abs(Error[-1] - Error[-2]) > 0.0001:
        error = []
        for i in range(Input.shape[0]):
            Y_input = np.dot(weight, Input[i]) + bias
            
            weight += lr * (Target[i] - Y_input) * Input[i]

            bias += lr * (Target[i] - Y_input)
            
            error.append((Target[i] - Y_input) ** 2)
        
        Error.append(sum(error))
        print('Error :', Error[-1])
    return weight, bias

x = np.array([[1.0, 1.0, 1.0],
              [1.0, -1.0, 1.0],
              [-1.0, 1.0, 1.0],
              [-1.0, -1.0, -1.0]])

t = np.array([1, 1, 1, -1])

w, b = Adaline(x, t, lr=0.2, stop=0.001)
print('Weight:', w)
print('Bias:', b) 