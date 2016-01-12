for m = 2:1:12
    X = importdata(['vector',m,'.txt']);
    [eigvector, eigvalue] = LPP(X');
    M = X * eigvector;
    M = M';
    res = M(1:2,:);
    dlmwrite(['results',m,'.txt'],res');
    clear;
end