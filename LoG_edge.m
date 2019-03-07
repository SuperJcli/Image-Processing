clear all;
I=imread('5.bmp');
I=rgb2gray(I);
subplot(1,3,1);imshow(I);
xlabel('(a)原始图像');
%以自动阈值选择法对图像进行LoG算子检测
[BW,thresh]=edge(I,'log');
%返回当前LoG算子边缘检测的阈值
disp('LoG算子自动选择的阈值为：')
disp(thresh)
subplot(1,3,2);imshow(BW);
xlabel('(b)自动阈值的LoG算子边缘检测');
%以阈值为0.06水平方向对图像进行Prewitt算子检测
BW1=edge(I,'Prewitt',0.006);
subplot(1,3,3);imshow(BW1);
xlabel('(c)阈值为0.006的LoG算子');
