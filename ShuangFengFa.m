clear all;
I=imread('4.bmp');
I=rgb2gray(I);
imhist(I);         %显示原始图像的直方图
%根据上面直方图选择阈值150，划分图像的前景和背景
newI=im2bw(I,150/255);
figure;
subplot(1,2,1);imshow(I);
xlabel('(a)原始图像');
subplot(1,2,2);imshow(newI);
xlabel('(b)双峰法分割图像');
