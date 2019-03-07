 clear all;
BW=imread('5.bmp');
BW=rgb2gray(BW);
subplot(1,2,1);imshow(BW,[]);
xlabel('(a)Ô­Ê¼Í¼Ïñ');
s=size(BW);
for row = 2:55:s(1)
   for col=1:s(2)
      if BW(row,col),
         break;
      end
   end
   contour = bwtraceboundary(BW, [row, col], 'W', 8, 50,...
                                   'counterclockwise');
   if(~isempty(contour))
      hold on;
      subplot(1,2,2);imshow(BW,[]);
      plot(contour(:,2),contour(:,1),'g','LineWidth',2);
      hold on;
      plot(col, row,'gx','LineWidth',2);
   else
      hold on; plot(col, row,'rx','LineWidth',2);
   end
end;
xlabel('(b)Í¼ÏñÇúÏß¸ú×Ù')
