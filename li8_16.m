clear all;
I=imread('5.bmp');
I=rgb2gray(I);
rotI = imrotate(I,35,'crop');        %ͼ����ʱ����ת35��
BW = edge(rotI,'canny');             %��Canny������ȡͼ���еı�Ե
[H,T,R] = hough(BW);                 %��ͼ�����Hough�任
figure;
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
%Ѱ�Ҳ���ƽ���ϵļ�ֵ��
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');
% �ҳ���Ӧ��ֱ�߱�Ե
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   % ���ֱ�߱�Ե��Ӧ�����
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
   % ����ֱ�߱�Ե����
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
%�Ժ�ɫ���ػ����ֱ��Ե
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','r');
