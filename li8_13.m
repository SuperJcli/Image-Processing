 clear all;
I=imread('5.bmp');
I=rgb2gray(I);
%%%I=imread('rice.png');
subplot(1,2,1);imshow(I);
xlabel('(a)Ô­Ê¼Í¼Ïñ');
BW = im2bw(I, graythresh(I));
[B,L] = bwboundaries(BW,'noholes');
subplot(1,2,2);imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
xlabel('(b)±ß½ç¸ú×Ù')
