clear all;
I=imread('5.bmp');
I=rgb2gray(I);
rotI = imrotate(I,35,'crop');        %图像逆时针旋转35°
BW = edge(rotI,'canny');             %用Canny算子提取图像中的边缘
[H,T,R] = hough(BW);                 %对图像进行Hough变换
figure;
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
%寻找参数平面上的极值点
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');
% 找出对应的直线边缘
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   % 标记直线边缘对应的起点
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
   % 计算直线边缘长度
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
%以红色线重画最长的直边缘
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','r');
