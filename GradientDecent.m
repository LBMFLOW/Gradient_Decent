% Data points
%
% Features:
%
X = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1;
     1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

% Targets:
%
Y = [8, 3, 5, 4, 1, 8, 7, 3, 6, 9, 8, 5];

% Get the dimension of the matrix A where m = rows and n = columns
teta = [0,1];
alpha = .01;
m = length(Y);
n = length(teta);

x_mean = mean(Y);
cost_check = [1,0];

try_count = 0;

while abs(cost_check(2) - cost_check(1)) > 1e-7
  
  cost_check(1) = cost_check(2);
  temp = zeros(1,n);
   
  %teta_x = zeros(1,n);
  teta_x = teta * X;
  
  for j = 1:n
    for i = 1:m
      temp(j) = temp(j) + (teta_x(i) - Y(i)) * X(j,i);
    end
    temp(j) = teta(j) - alpha/m * temp(j);
  end   
  
  teta = temp;
  cost1 = cst(X,Y,teta);
  cost_check(2) = cost1;
  try_count = try_count + 1;
end

teta
try_count

function cost = cst(X,Y,teta)
  i = 0;
  cost = 0;
  m = length(Y);
  tetax = teta * X;

  for i = 1:m
    cost = cost + 1/(2 * m) * (tetax(i) - Y(i))^2;
  end
end
