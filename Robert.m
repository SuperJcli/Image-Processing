 clear all;
I=imread('qie.jpg');
I=rgb2gray(I);
%subplot(1,3,1);imshow(I);
imshow(I)
%xlabel('ԭʼͼ��');
%���Զ���ֵѡ�񷨶�ͼ�����Roberts���Ӽ��
[BW1,thresh1]=edge(I,'roberts');
%���ص�ǰRoberts���ӱ�Ե������ֵ
disp('Roberts�����Զ�ѡ�����ֵΪ��')
disp(thresh1)
%subplot(1,3,2);imshow(BW1);
%imshow(BW1);
%xlabel('(b)�Զ���ֵ��Roberts���ӱ�Ե���');
%����ֵΪ0.06��ͼ�����Roberts���Ӽ��
%BW2=edge(I,'roberts',0.06);
%subplot(1,3,3);imshow(BW2);
%xlabel('(c)��ֵΪ0.06��Roberts���ӱ�Ե���');
