clear all;
I=imread('5.bmp');
I=rgb2gray(I);
BW = edge(imrotate(I,50,'crop'),'canny');
[H,T,R] = hough(BW);
P  = houghpeaks(H,2);
disp('显示Hough变换后平面的峰值为：')
disp(P)
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','m');
