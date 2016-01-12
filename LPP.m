function [eigvector, eigvalue] = LPP(X)
% X is the matrix that every row is a sample and every coloum is a feature
%X = importdata('E:\master_work\word2vec\results\NYT2013\1\vector1.txt');  
X = X';
%W = importdata('E:\master_work\word2vec\results\NYT2013\1\distance.txt');
N = size(X,2); %numbers of sample vectors
W = single(zeros(N,N));
D = single(zeros(N,N));
L = single(zeros(N,N));
for i = 1:1:N
    for j = 1:1:N
        a = X(:,i);
        b = X(:,j);
        W(i,j) = dot(a,b) / (norm(a) * norm(b));
        %disp('.....');
    end
end
for i = 1:1:N
    temp = 0;
    for j = 1:1:N
        temp = temp + W(i,j);
    end
    D(i,i) = temp;
end
L = D - W;
A = X * L * X';
B = X * D * X';
[V,lamda] = eig(A,B);
n = size(lamda, 1);
lamda = lamda * ones(n,1); %change lamda to a line vector
valueSet = zeros(n,1);
num = 1;
for i = 1:1:n
    valueSet(i,1) = num;
    num = num + 1;
end
map = containers.Map(lamda, valueSet);
map.sort();
temp = values(map);
v = [];
for i = 1:1:size(temp,2)
    v = [v V(:,temp{i})];
end
eigvector = v;
eigvalue = lamda;

