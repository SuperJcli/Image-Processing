 clear all;
I=imread('C:\Users\jcli\Desktop\������������\�Ż���Ƭ\�Ż���Ƭ\1���ػ�\1\1���ڻ�ȱ��2.bmp');
% I=rgb2gray(I);
subplot(1,3,1);imshow(I);
xlabel('(a)ԭʼͼ��');
%���Զ���ֵѡ�񷨶�ͼ�����Canny���Ӽ��
[BW,thresh]=edge(I,'canny');
%���ص�ǰCanny���ӱ�Ե������ֵ
disp('Canny�����Զ�ѡ�����ֵΪ��')
disp(thresh)
subplot(1,3,2);imshow(BW);
xlabel('(b)�Զ���ֵ��Canny���ӱ�Ե���');
%����ֵΪ[0.1 0.5]��ͼ�����Canny���Ӽ��
BW1=edge(I,'Prewitt',[0.1 0.5]);
subplot(1,3,3);imshow(BW1);
xlabel('(c)��ֵΪ[0.1 0.5]��Canny����');
