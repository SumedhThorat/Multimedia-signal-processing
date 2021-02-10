.
% denoising of video signal
clc; clear all; close all;

v= VideoReader('Tiger.mp4')
I= read(v);
frmsize=size(I,4);   % choose only total no of frame vector.
% add noise and playing video signal
for i=1:frmsize
    video(:,:,:,i)= imnoise(I(:,:,:,i),'salt & pepper',0.01);  % adding white gaussian noise
    imshow(video(:,:,:,i));
    drawnow;
end
% remove noise from signal
fil=fspecial('gaussian',[3 3],5);
for i=1:frmsize
   %vid_fil(:,:,:,i)= medfilt2(video(:,:,:,i),[3 3]);
   vid_fil(:,:,:,i)=imfilter(video(:,:,:,i),fil,'same');
   %  imshow(vid_fil(:,:,:,i));
    drawnow;
end

