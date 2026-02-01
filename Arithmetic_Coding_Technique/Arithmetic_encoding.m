

clc;
clear;
close all;

%% Symbol Set and Probabilities
symbols = ["X", "Y", "Z", "W"];
probabilities = [0.1 0.4 0.3 0.2];
message = 'XYZWY';

%% Uncomment for interactive input
% symbols = input("Enter symbol array: ");
% probabilities = input("Enter probability array: ");
% message = input("Enter message string: ", 's');

%% Compute cumulative distribution
cumulativeProb = [0, cumsum(probabilities)];

lowLimit = 0;
highLimit = 1;

fprintf('Initial interval: [%.6f , %.6f)\n\n', lowLimit, highLimit);

%% Encoding Loop
for idx = 1:length(message)

    % Identify symbol position
    pos = find(symbols == message(idx));

    % Current interval width
    intervalSize = highLimit - lowLimit;

    % Update interval bounds
    lowTemp = lowLimit + intervalSize * cumulativeProb(pos);
    highTemp = lowLimit + intervalSize * ...
               (cumulativeProb(pos) + probabilities(pos));

    % Assign updated bounds
    lowLimit = lowTemp;
    highLimit = highTemp;

    fprintf('After %c → [%.6f , %.6f)\n', message(idx), lowLimit, highLimit);
end

%% Encoded Result
fprintf('\nEncoded interval for "%s": [%.6f , %.6f)\n', ...
        message, lowLimit, highLimit);

encodedNumber = (lowLimit + highLimit) / 2;
fprintf('Final encoded value: %.6f\n', encodedNumber);
