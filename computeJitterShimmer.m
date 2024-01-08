function [jitter, shimmer] = computeJitterShimmer(signal, Fs)
    % Input: 
    % signal - Input voice signal
    % Fs - Sampling frequency of the signal
    
    % Output:
    % jitter - Jitter value as a percentage
    % shimmer - Shimmer value as a percentage
    
    % Detect peaks to approximate periods
    [peaks, locs] = findpeaks(signal);
    
    % Calculate approximate periods based on peak locations
    periods = diff(locs) / Fs;
    
    % Compute Jitter as the relative difference between consecutive periods
    periodDiffs = diff(periods);
    jitter = 100 * (sum(abs(periodDiffs)) / length(periodDiffs)) / mean(periods);
    
    % Compute Shimmer as the relative difference between consecutive amplitudes
    amplitudeDiffs = diff(peaks);
    shimmer = 100 * (sum(abs(amplitudeDiffs)) / length(amplitudeDiffs)) / mean(peaks);
end
