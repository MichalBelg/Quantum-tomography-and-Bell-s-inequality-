v= VideoReader('hamishim.mp4');
numFrames = v.NumFrames;  % Get the total number of frames in the video
D2 = zeros(1, numFrames); % Initialize the array to store results
%numFrames = 1000
%Before running the loop, run these two commented lines below to locate the coordinates for the cameras

%pcolor(frame(:,:,1))
%shading flat

for i = 1:numFrames
    disp("How many frames left:" + (numFrames - i));
    frame = read(v, i);
    %%%%%Alice H
    %D2(i)=sum(sum(frame(400:651,458:790,1)));
    %%%%%
    %%%%%Alice V
    D2(i)=sum(sum(frame(400:650,896:1229,1)));
    %%%%%
    %%%%%Bob H
    %D2(i)=sum(sum(frame(48:298,458:790,1)));
    %%%%%
    %%%%%Bob V
    %D2(i)=sum(sum(frame(82:298,896:1229,1)));
    %%%%%
end



figure;
plot(D2);
xlabel('Frame Number');
ylabel('Sum of Pixel Values');
title('Intensity in Each frame');
