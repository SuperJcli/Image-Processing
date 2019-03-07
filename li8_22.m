 clear all;
I=imread('4.bmp');
%%I=rgb2gray(I);
subplot(2,3,1);imshow(I);
xlabel('(a)H&E图像');
%将图像的色彩空间由RGB色彩空间转换到L*a*b色彩空间
cform = makecform('srgb2lab');          %色彩空间转换
lab_I= applycform(I,cform); 
%使用k均值聚类算法对a*b空间中的色彩进行分类
ab=double(lab_I(:,:,2:3));     %数据类型转换
nrow=size(ab,1);               %求矩阵尺寸
ncol=size(ab,2);               %求矩阵尺寸
ab=reshape(ab,nrow*ncol,2);    %矩阵形状变换
ncolors=3;
%重复聚类3次，以避免局部最小值
[c_idx,c_center]=kmeans(ab,ncolors,'distance','sqEuclidean','Replicates',3);
%使用k均值聚类算法得到的结果对图像进行标记
pixel_labels=reshape(c_idx,nrow,ncol);         %矩阵形状改变
subplot(2,3,2);imshow(pixel_labels,[]);
xlabel('(b)使用簇索引对图像进行记');
s_image=cell(1,3);                  %元胞型数组
rgb_label=repmat(pixel_labels,[1 1 3]);      %矩阵平铺
for k=1:ncolors
    color=I;
    color(rgb_label~=k)=0;
    s_image{k}=color;
end
subplot(2,3,3);imshow(s_image{1});
xlabel('(c)簇1中的目标');
subplot(2,3,4);imshow(s_image{2});
xlabel('(d)簇2中的目标');
subplot(2,3,5);imshow(s_image{3});
xlabel('(e)簇3中的目标');
%分割细胞核到一个分离图像
mean_c_value=mean(c_center,2);
[tmp,idx]=sort(mean_c_value);
b_c_num=idx(1);
L=lab_I(:,:,1);
b_indx=find(pixel_labels==b_c_num);
L_blue=L(b_indx);
i_l_b=im2bw(L_blue,graythresh(L_blue));   %图像黑白转换
%使用亮蓝色标记属于蓝色细胞核的像素
n_labels=repmat(uint8(0),[nrow,ncol]);     %矩阵平铺
n_labels(b_indx(i_l_b==false))=1;
n_labels=repmat(i_l_b,[1,1,3]);            %矩阵平铺
b_n=I;
b_n(n_labels~=1)=1;
subplot(2,3,6);imshow(b_n);
xlabel('(f)使用簇索引对图像进行标记');
