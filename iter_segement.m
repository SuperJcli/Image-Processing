clear all;
I=imread('C:\Users\jcli\Desktop\毕设文献资料\程序图像数据\Engine_BSI_crop\Engine_BSI_crop\002\001.png');
I=rgb2gray(I);
ZMAX=max(max(I));         %取出最大灰度值
ZMIN=min(min(I));         %取出最小灰度值
TK=(ZMAX+ZMIN)/2;
bcal=1;
ISIZE=size(I);
%图像大小
while(bcal)
    %定义前景和背景数
    ifground=0;
    ibground=0;
    %定义前景和背景灰度总和
    FgroundS=0;
    BgroundS=0;
    for i=1:ISIZE(1)
        for j=1:ISIZE(2)
            tmp=I(i,j);
            if(tmp>=TK)
                ifground=ifground+1;
                FgroundS=FgroundS+double(tmp);  %前景灰度值
            else
                ibground=ibground+1;
                BgroundS=BgroundS+double(tmp);
            end
        end
    end
    %计算前景和背景的平均值
    ZO=FgroundS/ifground;
    ZB=BgroundS/ibground;
    TKTmp=uint8((ZO+ZB)/2);
    if(TKTmp==TK)
        bcal=0;
    else
        TK=TKTmp;
    end
    %当阈值不再变化的时候，说明迭代结束
end
disp(strcat('迭代后的阈值：',num2str(TK)));
newI=im2bw(I,double(TK)/255);
subplot(1,2,1);imshow(I);
xlabel('(a)原始图像');
subplot(1,2,2);imshow(newI);
xlabel('(b)迭代法分割图像');
