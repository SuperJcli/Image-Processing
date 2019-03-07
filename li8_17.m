clear all;
I=imread('5.bmp');
J=rgb2gray(I);                %ͼ��Ҷ�ת��
I=double(J);                  %ͼ������ת��
s=255;
t=65;
if numel(s)==1
    si=I==s;
    s1=s;
else
    si=bwmorph(s,'shrink',Inf);
    j=find(si);
    s1=I(j);
end
ti=false(size(I));
for k=1:length(s1)
    sv=s1(k);
    s=abs(I-sv)<=t;
    ti=ti|s;
end
[g,nr]=bwlabel(imreconstruct(si,ti));      %ͼ���ʶ
subplot(1,2,1);imshow(J);
xlabel('(a)ԭʼͼ��');
subplot(1,2,2);imshow(g);
xlabel('(b)��������');
display('NO. of regions');
nr
