clear all;
I=imread('C:\Users\jcli\Desktop\������������\�Ż�ͼ������\�Ż���Ƭ\�Ż���Ƭ\1���ػ�\1\1���ڻ�ȱ��2.bmp');
% I=rgb2gray(I);
subplot(1,3,1);imshow(I);
xlabel('(a)ԭʼͼ��');
% ���ø�˹�˲���
h=fspecial('gaussian',6);
[BW,thresh]=edge(I,'zerocross',[],h);
%���ص�ǰ�㽻�����Ե������ֵ
disp('�㽻�����Զ�ѡ�����ֵΪ��')
disp(thresh)
subplot(1,3,2);imshow(BW);
xlabel('(b)�Զ���ֵ���㽻���Ե���');
%����ֵΪ0.02��ͼ������㽻���Ե���
BW1=edge(I,'zerocross',0.02,h);
subplot(1,3,3);imshow(BW1);
