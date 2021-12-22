%Rashedul Isalm Seum Q4 FH_020_069
clear all
close all
clc
arr=[20 28 19 13;15 30 31 28;40 21 20 17;21 28 26 12];
disp('Cost matrix');
disp(arr);
b = arr;
m = size(arr,1);
% subtracting row minima from in each row wise
for i=1:m
sub = min(arr(i,:));
arr(i,:) = arr(i,:)-sub;
end
% subtracting column minima from in each row wise
for i = 1:size(arr,2)
sub = min(arr(:,i));
arr(:,i) = arr(:,i)-sub;
end
% displaying result after subtracting in row and column wise
disp('After subtracting row minima and column minima');
disp(arr);
while true
temp = arr;
lines = 0;
while true
minZ = inf;
% display("count in row is:")
for i = 1:size(temp,1)
count11 = size(find(temp(i,:)==0),2);
% display("count in row is:")
% disp(count11(1));
if(count11>0 && count11<minZ)
minZ = count11;
d = 1;
y = find(temp(i,:)==0,1);
% display('y1 is:');
% disp(y)
end
end
for i = 1:size(temp,2)
count11 = size(find(temp(:,i)==0),1);
% display('count11 in column is:');
% display(count11)
if(count11>0 && count11<minZ)
minZ = count11;
d = 0;
y = find(temp(:,i)==0,1);
% display('y2 is:');
% display(y)
end
% display('y is:');
% display(y);
end
if minZ==inf
break;
end
if d==1
temp(:,y)=inf;
else
temp(y,:)=inf;
end
lines = lines+1;
%disp = ('lines is:');
%disp(lines);
end
sub = min(min(temp));
if(lines~=4)
for i=1:size(arr,1)
for j=1:size(arr,2)
if(temp(i,j)~=inf)
arr(i,j)=arr(i,j)-sub;
elseif((size(find(temp(i,:)==inf),2)==4)&&(size(find(temp(:,j)==inf),1)==4))
arr(i,j) = arr(i,j)+sub;
end
end
end
end
if(lines==4)
break;
end
end
% Modified cost matrix
display('Modified cost matrix');
display(arr);
totalc = 0;
%Allocation in modified cost matrix
for i = 1:size(arr,1)
for j = 1:size(arr,2)
if(arr(i,j)==0)
totalc = totalc+b(i,j);
for k = j+1:size(arr,2)
if(arr(i,k)==0)
arr(i,k)=inf;
end
end
for k = i+1:size(arr,1)
if(arr(k,j)==0)
arr(k,j)=inf;
end
end
end
end
end
%DISPLAY RESULT
fprintf(' Total cost = %d\n',totalc)