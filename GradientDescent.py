import sys
import numpy as np

def cst(X,Y,teta):
    i = 0
    cost = 0
    m = len(Y)
    tetax = np.matmul(teta,X)

    for i in range(m):
        cost = cost + 1/(2 * m) * (tetax[i] - Y[i])**2
    return cost

# Data
# features:
#
X = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
     [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]]

# Targets:
#
Y = [8, 3, 5, 4, 1, 8, 7, 3, 6, 9, 8, 5]

teta = [0,1]
alpha = .01
m = len(Y)
n = len(teta)

x_mean = sum(Y)/len(Y)
cost_check = [1,0]

try_count = 0

while abs(cost_check[1] - cost_check[0]) > 1e-7:
  
    cost_check[0] = cost_check[1]
    temp = [0]*n

    #teta_x = zeros(1,n);
    teta_x = np.matmul(teta,X)

    for j in range(n):
        for i in range(m):
            temp[j] = temp[j] + (teta_x[i] - Y[i]) * X[j][i]
        temp[j] = teta[j] - alpha/m * temp[j]

    teta = temp.copy()
    cost1 = cst(X,Y,teta)
    cost_check[1] = cost1
    try_count = try_count + 1


print(teta)
print(try_count)
