clc;
clear;
yuvDir = [pwd '/YUVImage/'];
saveDir = [pwd '/JPGImage/'];
fileList = getAllFiles(yuvDir, '*.yuv', 0); %#0 is false obviously
for i = 1 : size(fileList,1)
    yuv_recolor(yuvDir, fileList{i}, 640, 480, saveDir);
end