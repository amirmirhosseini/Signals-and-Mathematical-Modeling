a=10;
b=2.5e23;
c=2+3i;
d=exp(i*2*pi/3);
aVec = [3.14,15,9,26];
bVec = [2.71;8;28;182];
cVec = 5:-0.02:-5;
dVec = logspace(0,1,101);
eVec = 'Hello';
aMat = 2*ones(9);
bMat = diag([1,2,3,4,5,4,3,2,1]);
cMat = reshape(1:100,[10,10]);
dMat = nan(3,4);
eMat = [13,-1,5;-22,10,-87];
fMat = floor((-3+(3-(-3))*rand(5,3)));
fMat2 = randi([-3,3],5,3);
x=1/(1+exp(-(a-15)/6));
y=(sqrt(a)+nthroot(b,21))^pi;
z=log(real((c+d)*(c-d))*sin(a*pi/3))/(c*conj(c));
xMat = (aVec*bVec)*(aMat^2);
yMat = (bVec*aVec);
zMat = det(cMat)*transpose(aMat*bMat);
cSum = sum(cMat);
eMean = mean(eMat,2);
eMat(1,:) = [1 1 1];
cSub = cMat(2:9,2:9);
lin = 1:20;
for i = 1:20
    lin(i)=lin(i)*((-1)^(i+1));
end
r = rand(1,5);
%for i=1:5
%    if r(i)<0.5
%        r(i)=0
%    end
%end
rf = find(r<0.5);
for i = rf
    r(i)=0;
end
