Bunch1 = ["-45-22","45+67","-45+67","45-22"];
Bunch2 = ["-45+22","45+112","-45+112","45+22"];
Bunch3 = ["0-22","90+67","0+67","90-22"];
Bunch4 = ["0+22","90+112","0+112","90+22"];
tFactor = 0.6369;
%0.6369 is best
t2 = 0.045; 
% -0.045 is currently best
E_values = [0 0 0 0];
for BunchID = 1:4
    switch BunchID
        case 1
            Bunch=Bunch1;
        case 2
            Bunch = Bunch2;
        case 3
            Bunch = Bunch3;
        case 4
            Bunch = Bunch4;
    end
    N_array = [0 0 0 0];
    for vidID = 1:4
        vidname = Bunch(vidID);
        v= VideoReader(vidname+'.mp4');
        numFrames = v.NumFrames; 
        Dangle1 = zeros(1, numFrames);
        Dangle2 = zeros(1, numFrames);
        for i = 1:numFrames
            frame = read(v, i);
            Dangle1(i)=sum(sum(frame(412:659,905:1234,1)));
            Dangle2(i)=sum(sum(frame(56:303,905:1234,1)));
        end
        thresh1 = (tFactor+t2)*max(Dangle1);
        thresh2 = (tFactor-t2)*max(Dangle2);
        for i = 1:numFrames
            if Dangle1(i) > thresh1
                N_array(vidID) = N_array(vidID)+1;
            end
            if Dangle2(i) > thresh2
                N_array(vidID) = N_array(vidID)+1;
            end
        end
        %Count
        numVid = vidID+(BunchID-1)*4;
        disp("Finished Video "+numVid);
    end
    E_values(BunchID) = (N_array(1)+N_array(2)-N_array(3)-N_array(4))/(sum(N_array));
end
S = E_values(1)-E_values(2)+E_values(3)+E_values(4);
disp("S = "+S+" Threshold is "+tFactor+" and t2 = "+t2+" of the maxima in each angle video")
%v= VideoReader('-45-22.mp4');
%numFrames = v.NumFrames;  % Get the total number of frames in the video
%D2 = zeros(1, numFrames);
%Dangle1 = zeros(1, numFrames);
%Dangle2 = zeros(1, numFrames);% Initialize the array to store results
%%numFrames = 30;
%for i = 1:numFrames
%    disp("How many frames left:" + (numFrames - i));
%    frame = read(v, i);
    %%%%%Alice H
    %D2(i)=sum(sum(frame(400:651,458:790,1)));
    %%%%%
    %%%%%Alice V
    %D2(i)=sum(sum(frame(400:650,896:1229,1)));
    %%%%%
    %%%%%Bob H
    %D2(i)=sum(sum(frame(48:298,458:790,1)));
    %%%%%
    %%%%%Bob V
    %D2(i)=sum(sum(frame(82:298,896:1229,1)));
    %%%%%

    %%%%FOR Part C:
    %%%%%First Angle
    %Dangle1(i)=sum(sum(frame(412:659,905:1234,1)));
    %%%%%
    %%%%%Second Angle
    %Dangle2(i)=sum(sum(frame(56:303,905:1234,1)));
    %%%%%%%%%%%%%%
%end

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
%plot(D2)
%figure;
%plot(Dangle1);
%hold on
%plot(Dangle2)
%hold off
%xlabel('Frame Number');
%ylabel('Sum of Pixel Values');
%title('Intensity in Each frame');
%thresh = 5*(10^5);

