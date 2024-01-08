function [slope_rise, slope_fall, num_samples_rise, num_samples_fall] = calc_slope_v2(signal)
    x = 1:length(signal);
    [peaks, locs] = findpeaks(signal);
    [m, i] = max(peaks);
    peak = peaks(i);
    loc = locs(i);
%     disp(loc)
    % Find the start of the rise to the current peak
    rise_start_idx = find(signal(1:loc-1) > signal(2:loc), 1, 'last') + 1;
    if isempty(rise_start_idx)
        rise_start_idx = 1;
    end
%     disp(rise_start_idx);
    % Find the start of the fall from the current peak

    fall_end_idx = find(signal(loc:end-1) < signal(locs(i)+1:end), 1, 'first') + locs(i);

    if isempty(fall_end_idx)
        fall_end_idx = length(signal);
    end
%     disp(fall_end_idx);
    % Calculate the slope for rising and falling parts
    slope_rise = (signal(loc) - signal(rise_start_idx)) / (loc - rise_start_idx);
    slope_fall = (signal(fall_end_idx) - signal(loc)) / (fall_end_idx - loc);

    % Count the number of samples for rising and falling
    num_samples_rise = loc - rise_start_idx + 1;
    num_samples_fall = fall_end_idx - loc + 1;
    if isempty(peaks)
        if signal(end)>signal(1)
            slope_rise = (signal(end)-signal(1)) / length(signal);
            slope_fall = 0;
            num_samples_rise = length(signal);
            num_samples_fall = 0;
        else
            slope_rise = 0;
            slope_fall = (signal(1)-signal(end)) / length(signal);
            num_samples_rise = 0;
            num_samples_fall = length(signal);
        end
    end
end