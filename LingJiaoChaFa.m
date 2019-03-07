clear all;
I=imread('C:\Users\jcli\Desktop\毕设文献资料\磁环图像数据\磁环照片\磁环照片\1工控机\1\1号内环缺陷2.bmp');
% I=rgb2gray(I);
subplot(1,3,1);imshow(I);
xlabel('(a)原始图像');
% 设置高斯滤波器
h=fspecial('gaussian',6);
[BW,thresh]=edge(I,'zerocross',[],h);
%返回当前零交叉检测边缘检测的阈值
disp('零交叉检测自动选择的阈值为：')
disp(thresh)
subplot(1,3,2);imshow(BW);
xlabel('(b)自动阈值的零交叉边缘检测');
%以阈值为0.02对图像进行零交叉边缘检测
BW1=edge(I,'zerocross',0.02,h);
subplot(1,3,3);imshow(BW1);
