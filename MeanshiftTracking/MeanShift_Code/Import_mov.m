

% Import a AVI video file from its 'path'.
% The output is the length, size (height,width)
% and the video sequence read by Matlab from
% this AVI file.
%
% [lngth,h,w,mov]=Import_mov(path)

function [lngth,h,w,mov]=Import_mov(path)
infomov = VideoReader(path);
lngth = infomov.NumFrames;
h = infomov.Height;
w = infomov.Width;
mov(1:lngth) = struct('cdata', zeros(h, w, 3, 'uint8'), 'colormap', []);
% Read one frame at a time.
for k = 1 : lngth
    mov(k).cdata = read(infomov, k);
end