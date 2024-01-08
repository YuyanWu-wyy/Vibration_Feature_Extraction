function cwt_sum = sum_cwt(c,f,freq_band)
    cwt_sum = [];
    for i = 1:size(freq_band,1)
        idx = find(f>freq_band(i,1) & f < freq_band(i,2));
        s = sum(abs(c(idx,:)));
        cwt_sum = [cwt_sum;s];
    end
    s = sum(cwt_sum);
    cwt_sum = [cwt_sum;s];
end