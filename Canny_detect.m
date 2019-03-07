 clear all;
I=imread('C:\Users\jcli\Desktop\毕设文献资料\磁环照片\磁环照片\1工控机\1\1号内环缺陷2.bmp');
% I=rgb2gray(I);
subplot(1,3,1);imshow(I);
xlabel('(a)原始图像');
%以自动阈值选择法对图像进行Canny算子检测
[BW,thresh]=edge(I,'canny');
%返回当前Canny算子边缘检测的阈值
disp('Canny算子自动选择的阈值为：')
disp(thresh)
subplot(1,3,2);imshow(BW);
xlabel('(b)自动阈值的Canny算子边缘检测');
%以阈值为[0.1 0.5]对图像进行Canny算子检测
BW1=edge(I,'Prewitt',[0.1 0.5]);
subplot(1,3,3);imshow(BW1);
xlabel('(c)阈值为[0.1 0.5]的Canny算子');
