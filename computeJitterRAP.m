function jitterRAP = computeJitterRAP(signal, Fs)
    % Input: 
    % signal - Input voice signal
    % Fs - Sampling frequency of the signal
    
    % Output:
    % jitterRAP - JitterRAP value as a percentage
    
    % Detect peaks to approximate periods
    [~, locs] = findpeaks(signal);
    
    % Calculate approximate periods based on peak locations
    periods = diff(locs) / Fs;
    
    N = length(periods);
    sumRAP = 0;
    
    for i = 2:N-1
        local_avg = (periods(i-1) + periods(i) + periods(i+1)) / 3;
        sumRAP = sumRAP + abs(periods(i) - local_avg);
    end

    jitterRAP = (100 * sumRAP) / (N-2);
end
