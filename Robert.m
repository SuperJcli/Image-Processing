 clear all;
I=imread('qie.jpg');
I=rgb2gray(I);
%subplot(1,3,1);imshow(I);
imshow(I)
%xlabel('原始图像');
%以自动阈值选择法对图像进行Roberts算子检测
[BW1,thresh1]=edge(I,'roberts');
%返回当前Roberts算子边缘检测的阈值
disp('Roberts算子自动选择的阈值为：')
disp(thresh1)
%subplot(1,3,2);imshow(BW1);
%imshow(BW1);
%xlabel('(b)自动阈值的Roberts算子边缘检测');
%以阈值为0.06对图像进行Roberts算子检测
%BW2=edge(I,'roberts',0.06);
%subplot(1,3,3);imshow(BW2);
%xlabel('(c)阈值为0.06的Roberts算子边缘检测');
