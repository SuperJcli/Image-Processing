clear all;
I=imread('5.bmp');
I=rgb2gray(I);
subplot(1,3,1);imshow(I);
xlabel('(a)ԭʼͼ��');
%���Զ���ֵѡ�񷨶�ͼ�����LoG���Ӽ��
[BW,thresh]=edge(I,'log');
%���ص�ǰLoG���ӱ�Ե������ֵ
disp('LoG�����Զ�ѡ�����ֵΪ��')
disp(thresh)
subplot(1,3,2);imshow(BW);
xlabel('(b)�Զ���ֵ��LoG���ӱ�Ե���');
%����ֵΪ0.06ˮƽ�����ͼ�����Prewitt���Ӽ��
BW1=edge(I,'Prewitt',0.006);
subplot(1,3,3);imshow(BW1);
xlabel('(c)��ֵΪ0.006��LoG����');
