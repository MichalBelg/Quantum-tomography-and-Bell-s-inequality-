v= VideoReader('hamishim.mp4');
numFrames = v.NumFrames;  % Get the total number of frames in the video
D2 = zeros(1, numFrames); % Initialize the array to store results
%numFrames = 1000
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

%GPT:
% Assume D2 is the array you obtained from the previous code
% Replace it with your actual array if the variable name is different

% Define a threshold for extreme points (adjust as needed)
%threshold = 0.33333 * max(D2);

% Find indices of extreme points
%extremePoints = find(abs(D2 - mean(D2)) > threshold);

%merge close points:
%newExtremePoints = [];
%for i = 1:length(extremePoints)
%    if (i == 1) || abs(extremePoints(i) - extremePoints(i-1)) > 10
%        newExtremePoints(end+1) = extremePoints(i);
%    end
%end
%extremePoints = newExtremePoints;
% Display the number of extreme points
%numExtremePoints = length(extremePoints);
%disp(['Number of Extreme Points: ', num2str(numExtremePoints)]);
%
% Plot the array with extreme points marked
%figure;
%plot(D2);
%hold on;
%scatter(extremePoints, D2(extremePoints), 'r', 'filled');
%hold off;
%xlabel('Frame Number');
%ylabel('Sum of Pixel Values');
%title('Extreme Points in D2 Array');
%legend('D2 Array', 'Extreme Points');

%End GPT

%Garry's Code down here:
%%for i=1:1:30
%%frame = read(v,i);
%pcolor(frame(400:633,910:1220,1))
%%shading flat
%plot(frame(200,:,1))
%[M,I] = max(frame(200,:,1));
%x(i)=I;
%shading flat
%pause(0.05)
%colorbar
%%end


%pcolor(frame(:,:,1))
%shading flat

figure;
plot(D2);
xlabel('Frame Number');
ylabel('Sum of Pixel Values');
title('Intensity in Each frame');