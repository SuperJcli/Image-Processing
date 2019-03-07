 clear all;
%����һ�����������ص���Բ��ͼ���Ķ�ֵͼ��
center1 = -10;
center2 = -center1;
dist = sqrt(2*(2*center1)^2);
radius = dist/2 * 1.4;
lims = [floor(center1-1.2*radius) ceil(center2+1.2*radius)];
[x,y] = meshgrid(lims(1):lims(2));
bw1 = sqrt((x-center1).^2 + (y-center1).^2) <= radius;
bw2 = sqrt((x-center2).^2 + (y-center2).^2) <= radius;
bw = bw1 | bw2;
subplot(1,3,1), imshow(bw,'InitialMagnification','fit');
xlabel('(a)��ֵͼ��')
%�������б任���õ�һ��������������ء���ͼ��
D = bwdist(~bw);
subplot(1,3,2), imshow(D,[],'InitialMagnification','fit')
xlabel('(b)��������ء���ͼ��')
D = -D;
D(~bw) = -Inf;
L = watershed(D);
rgb = label2rgb(L,'jet',[.5 .5 .5]);
subplot(1,3,3), imshow(rgb,'InitialMagnification','fit')
xlabel('(c)D�ķ�ˮ��');
