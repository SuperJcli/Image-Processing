clear all;
I=imread('5.bmp');
I=rgb2gray(I);
subplot(1,3,1);imshow(I);
xlabel('(a)原始图像');
%使用graythresh函数计算阈值
level = graythresh(I);
%大津法计算全局图像I的阈值
BW=im2bw(I,level);
subplot(1,3,2);imshow(BW);
xlabel('(b)graythresh函数计算阈值');
disp(strcat('graythresh函数计算灰度阈值：',num2str(uint8(level*255))));
%下面MATLAB程序实现简化计算阈值
IMAX=max(max(I));         %取出最大灰度值
IMIN=min(min(I));         %取出最小灰度值
T=double(IMIN:IMAX);
ISIZE=size(I);    %图像大小
muxSize=ISIZE(1)*ISIZE(2);
for i=1:length(T)
    %从最小灰度值到最大值分别计算方差
    TK=T(1,i);
    ifground=0;
    ibground=0;
    %定义前景和背景灰度总和
    FgroundS=0;
    BgroundS=0;
    for j=1:ISIZE(1)
        for k=1:ISIZE(2)
            tmp=I(j,k);
            if(tmp>=TK)
                ifground=ifground+1;
                FgroundS=FgroundS+double(tmp);  %前景灰度值
            else
                %背景像素点的计算
                ibground=ibground+1;
                BgroundS=BgroundS+double(tmp);
            end
        end
    end
    %计算前景和背景的比例、平均灰度值
    %这里存在一个0分母的情况，导致警告，但不影响结果
    w0=ifground/muxSize;
    w1=ibground/muxSize;
    u0=FgroundS/ifground;
    u1=BgroundS/ibground;
    T(2,i)=w0*w1*(u0-u1)*(u0-u1);  %计算方差
end
%遍历后寻找I第二行的最大值
oMax=max(T(2,:));
%第二行方差的最大值，忽略NaN
idx=find(T(2,:)>=oMax);
%方差最大值所对应的列号
T=uint8(T(1,idx));
%从第一行取出灰度值作为赋值
disp(strcat('简化大津法计算灰度阈值：',num2str(T)));
BW=im2bw(I,double(T)/255);  %阈值分割
subplot(1,3,3);imshow(BW);
xlabel('(c)简化大津法计算阈值');
