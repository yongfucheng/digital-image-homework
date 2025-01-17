%读取图像
X=imread('1.png'); 
X=rgb2gray(X);
%读取图像尺寸
[m,n]=size(X); 
%给图像加噪
Xnoised=imnoise(X,'speckle',0.01); 
%输出加噪图像
subplot(121); 
imshow(Xnoised);
title('1')
%DCT变换
Y=dct2(Xnoised); 
I=zeros(m,n);
%高频屏蔽
I(1:m/3,1:n/3)=1; 
Ydct=Y.*I;
%逆DCT变换
Y=uint8(idct2(Ydct)); 
%结果输出
subplot(122);
imshow(Y);
title('2')