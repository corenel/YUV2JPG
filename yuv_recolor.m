function [RGB]=yuv_recolor(dirname, filename, width, height, savedir)
% yuv_recolor :Read YUV files, display in RGB way.
% standard storage format; YUYVYUYV...(image data saved in binary)
% standard size of the picture:width=640,height=480
% Input: - filename :string of file name include format;
%        - width,height :size of the photo;
% Output:- RGB.
% Example: [RGB]=yuv_recolor('1407 v=25 h=0.yuv',640,480);

% Generate YT,UT,VT; from YUV to RGB
filepath = [dirname filename];
fid=fopen(filepath,'r');
A_YUV=fread(fid,[width*2,height]);
Y(:,:)=A_YUV(1:2:2*width-1,1:height);
U(:,:)=A_YUV(2:4:2*width-2,1:height);
V(:,:)=A_YUV(4:4:2*width,1:height);
Y=uint8(Y);U=uint8(U);V=uint8(V);
fclose(fid);

YY(:,:)=Y(:,:);
UU(1:2:width-1,:)=U(:,:);
UU(2:2:width,:)=U(:,:);  
VV(1:2:width-1,:)=V(:,:);
VV(2:2:width,:)=V(:,:);
YT=YY';UT=UU';VT=VV';

YUV=cat(3,YT,UT,VT);
RGB=ycbcr2rgb(YUV);
imwrite(RGB,[savedir filename '.rgb.jpg']);

% figure(1),imshow(RGB),hold on;