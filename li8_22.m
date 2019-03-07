 clear all;
I=imread('4.bmp');
%%I=rgb2gray(I);
subplot(2,3,1);imshow(I);
xlabel('(a)H&Eͼ��');
%��ͼ���ɫ�ʿռ���RGBɫ�ʿռ�ת����L*a*bɫ�ʿռ�
cform = makecform('srgb2lab');          %ɫ�ʿռ�ת��
lab_I= applycform(I,cform); 
%ʹ��k��ֵ�����㷨��a*b�ռ��е�ɫ�ʽ��з���
ab=double(lab_I(:,:,2:3));     %��������ת��
nrow=size(ab,1);               %�����ߴ�
ncol=size(ab,2);               %�����ߴ�
ab=reshape(ab,nrow*ncol,2);    %������״�任
ncolors=3;
%�ظ�����3�Σ��Ա���ֲ���Сֵ
[c_idx,c_center]=kmeans(ab,ncolors,'distance','sqEuclidean','Replicates',3);
%ʹ��k��ֵ�����㷨�õ��Ľ����ͼ����б��
pixel_labels=reshape(c_idx,nrow,ncol);         %������״�ı�
subplot(2,3,2);imshow(pixel_labels,[]);
xlabel('(b)ʹ�ô�������ͼ����м�');
s_image=cell(1,3);                  %Ԫ��������
rgb_label=repmat(pixel_labels,[1 1 3]);      %����ƽ��
for k=1:ncolors
    color=I;
    color(rgb_label~=k)=0;
    s_image{k}=color;
end
subplot(2,3,3);imshow(s_image{1});
xlabel('(c)��1�е�Ŀ��');
subplot(2,3,4);imshow(s_image{2});
xlabel('(d)��2�е�Ŀ��');
subplot(2,3,5);imshow(s_image{3});
xlabel('(e)��3�е�Ŀ��');
%�ָ�ϸ���˵�һ������ͼ��
mean_c_value=mean(c_center,2);
[tmp,idx]=sort(mean_c_value);
b_c_num=idx(1);
L=lab_I(:,:,1);
b_indx=find(pixel_labels==b_c_num);
L_blue=L(b_indx);
i_l_b=im2bw(L_blue,graythresh(L_blue));   %ͼ��ڰ�ת��
%ʹ������ɫ���������ɫϸ���˵�����
n_labels=repmat(uint8(0),[nrow,ncol]);     %����ƽ��
n_labels(b_indx(i_l_b==false))=1;
n_labels=repmat(i_l_b,[1,1,3]);            %����ƽ��
b_n=I;
b_n(n_labels~=1)=1;
subplot(2,3,6);imshow(b_n);
xlabel('(f)ʹ�ô�������ͼ����б��');
