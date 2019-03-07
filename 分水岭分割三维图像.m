clear all;
%������ά������ӳ��ͼ�����а��������ص�������
center1 = -10;
center2 = -center1;
dist = sqrt(3*(2*center1)^2);
radius = dist/2 * 1.4;
lims = [floor(center1-1.2*radius) ceil(center2+1.2*radius)];
[x,y,z] = meshgrid(lims(1):lims(2));
bw1 = sqrt((x-center1).^2 + (y-center1).^2 +(z-center1).^2) <= radius;
bw2 = sqrt((x-center2).^2 + (y-center2).^2 +(z-center2).^2) <= radius;
bw = bw1 | bw2;
%����3-D������ӳ��ͼ
figure, isosurface(x,y,z,bw,0.5);
axis equal,
set(gcf,'color','w');
xlim(lims), ylim(lims), zlim(lims)
view(3), camlight;
lighting gouraud
%��ֵ��ľ���任
D = bwdist(~bw);
figure, isosurface(x,y,z,D,radius/2);
axis equal
set(gcf,'color','w');
xlim(lims), ylim(lims), zlim(lims)
view(3), camlight;
lighting gouraud
%���з�ˮ��任
D = -D;
D(~bw) = -Inf;
L = watershed(D);
figure
isosurface(x,y,z,L==2,0.5)
isosurface(x,y,z,L==3,0.5)
axis equal
xlim(lims), ylim(lims), zlim(lims)
view(3), camlight;
lighting gouraud
set(gcf,'color','w');
