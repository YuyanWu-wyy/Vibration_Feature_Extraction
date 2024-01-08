function [peak_loc, peak_height, fwhm] = find_dominant_peak(signal, calc_fwhm)
% FIND_DOMINANT_PEAK finds the dominant peak in a signal, breaking ties
% using the peak that occurs first.
%
% [peak_loc, peak_height] = FIND_DOMINANT_PEAK(signal)
%
% INPUTS:
%   signal - a 1D array representing the signal to analyze.
%
% OUTPUTS:
%   peak_loc - the location of the dominant peak in the signal.
%   peak_height - the height of the dominant peak in the signal.

% Find all peaks in the signal.
[peak_heights, peak_locs] = findpeaks(signal);

% If there are no peaks, return empty outputs.
if isempty(peak_locs)
    [m,idx] = max(signal);
    peak_loc = idx;
    peak_height = m;
    fwhm = Inf;
    return;
end

% Find the highest peak.
[~, idx] = max(peak_heights);
peak_loc = peak_locs(idx);
peak_height = peak_heights(idx);

% Check for other peaks that are similar in height.
similar_heights = abs(peak_heights - peak_height) < 0.1*peak_height;
num_similar = sum(similar_heights);

if num_similar > 1
    % If there are ties, select the peak that occurs first.
    first_peak_idx = find(similar_heights==1);
    peak_height = peak_heights(first_peak_idx(1));
    peak_loc = peak_locs(first_peak_idx(1));
end
if calc_fwhm==1
    half_max = peak_height*0.8;
    left_idx = find(signal(1:peak_loc) <= half_max, 1, 'last');
    right_idx = peak_loc + find(signal(peak_loc:end) <= half_max, 1) - 1;
    fwhm = right_idx - left_idx + 1;
else
    fwhm = 0;
end
end