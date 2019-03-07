clear all;
I=imread('5.bmp');
I=rgb2gray(I);
subplot(1,3,1);imshow(I);
xlabel('(a)ԭʼͼ��');
%ʹ��graythresh����������ֵ
level = graythresh(I);
%��򷨼���ȫ��ͼ��I����ֵ
BW=im2bw(I,level);
subplot(1,3,2);imshow(BW);
xlabel('(b)graythresh����������ֵ');
disp(strcat('graythresh��������Ҷ���ֵ��',num2str(uint8(level*255))));
%����MATLAB����ʵ�ּ򻯼�����ֵ
IMAX=max(max(I));         %ȡ�����Ҷ�ֵ
IMIN=min(min(I));         %ȡ����С�Ҷ�ֵ
T=double(IMIN:IMAX);
ISIZE=size(I);    %ͼ���С
muxSize=ISIZE(1)*ISIZE(2);
for i=1:length(T)
    %����С�Ҷ�ֵ�����ֵ�ֱ���㷽��
    TK=T(1,i);
    ifground=0;
    ibground=0;
    %����ǰ���ͱ����Ҷ��ܺ�
    FgroundS=0;
    BgroundS=0;
    for j=1:ISIZE(1)
        for k=1:ISIZE(2)
            tmp=I(j,k);
            if(tmp>=TK)
                ifground=ifground+1;
                FgroundS=FgroundS+double(tmp);  %ǰ���Ҷ�ֵ
            else
                %�������ص�ļ���
                ibground=ibground+1;
                BgroundS=BgroundS+double(tmp);
            end
        end
    end
    %����ǰ���ͱ����ı�����ƽ���Ҷ�ֵ
    %�������һ��0��ĸ����������¾��棬����Ӱ����
    w0=ifground/muxSize;
    w1=ibground/muxSize;
    u0=FgroundS/ifground;
    u1=BgroundS/ibground;
    T(2,i)=w0*w1*(u0-u1)*(u0-u1);  %���㷽��
end
%������Ѱ��I�ڶ��е����ֵ
oMax=max(T(2,:));
%�ڶ��з�������ֵ������NaN
idx=find(T(2,:)>=oMax);
%�������ֵ����Ӧ���к�
T=uint8(T(1,idx));
%�ӵ�һ��ȡ���Ҷ�ֵ��Ϊ��ֵ
disp(strcat('�򻯴�򷨼���Ҷ���ֵ��',num2str(T)));
BW=im2bw(I,double(T)/255);  %��ֵ�ָ�
subplot(1,3,3);imshow(BW);
xlabel('(c)�򻯴�򷨼�����ֵ');
