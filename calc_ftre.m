function feature_contour = calc_ftre(signal)
    [pks, locs] = findpeaks(signal);
    [vls, vl_locs] = findpeaks(-signal);
    feature_contour = [mean(signal),median(signal),std(signal),max(signal),min(signal),(max(signal)-min(signal)),skewness(signal),kurtosis(signal),length(pks),length(vls)];
end