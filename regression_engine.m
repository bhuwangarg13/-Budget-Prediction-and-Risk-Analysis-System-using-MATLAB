
function theta = regression_engine(t, y)

n = length(t);

X = [ones(n,1) t];

XtX = X' * X;
Xty = X' * y;

if det(XtX) == 0
error('Matrix is singular');
end

theta = XtX \ Xty;

end
