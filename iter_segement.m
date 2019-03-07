clear all;
I=imread('C:\Users\jcli\Desktop\������������\����ͼ������\Engine_BSI_crop\Engine_BSI_crop\002\001.png');
I=rgb2gray(I);
ZMAX=max(max(I));         %ȡ�����Ҷ�ֵ
ZMIN=min(min(I));         %ȡ����С�Ҷ�ֵ
TK=(ZMAX+ZMIN)/2;
bcal=1;
ISIZE=size(I);
%ͼ���С
while(bcal)
    %����ǰ���ͱ�����
    ifground=0;
    ibground=0;
    %����ǰ���ͱ����Ҷ��ܺ�
    FgroundS=0;
    BgroundS=0;
    for i=1:ISIZE(1)
        for j=1:ISIZE(2)
            tmp=I(i,j);
            if(tmp>=TK)
                ifground=ifground+1;
                FgroundS=FgroundS+double(tmp);  %ǰ���Ҷ�ֵ
            else
                ibground=ibground+1;
                BgroundS=BgroundS+double(tmp);
            end
        end
    end
    %����ǰ���ͱ�����ƽ��ֵ
    ZO=FgroundS/ifground;
    ZB=BgroundS/ibground;
    TKTmp=uint8((ZO+ZB)/2);
    if(TKTmp==TK)
        bcal=0;
    else
        TK=TKTmp;
    end
    %����ֵ���ٱ仯��ʱ��˵����������
end
disp(strcat('���������ֵ��',num2str(TK)));
newI=im2bw(I,double(TK)/255);
subplot(1,2,1);imshow(I);
xlabel('(a)ԭʼͼ��');
subplot(1,2,2);imshow(newI);
xlabel('(b)�������ָ�ͼ��');
