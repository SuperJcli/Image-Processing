clear all;
I=imread('4.bmp');
I=rgb2gray(I);
imhist(I);         %��ʾԭʼͼ���ֱ��ͼ
%��������ֱ��ͼѡ����ֵ150������ͼ���ǰ���ͱ���
newI=im2bw(I,150/255);
figure;
subplot(1,2,1);imshow(I);
xlabel('(a)ԭʼͼ��');
subplot(1,2,2);imshow(newI);
xlabel('(b)˫�巨�ָ�ͼ��');
