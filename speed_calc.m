function walk_frequency = speed_calc(signal,fs)
%     [startstep,endstep,intensity]= myfindstart2(velo_trace,fs);
    % figure;plot((1:length(velo_trace))/fs,velo_trace);
    % for i = 1:length(startstep)
    %     hold on;plot([startstep(i),startstep(i)]/fs,[-2.5,2.5],'r');
    %     hold on;plot([endstep(i),endstep(i)]/fs,[-2.5,2.5],'r');
    %     hold on;plot([startstep(i),endstep(i)]/fs,[-2.5,-2.5],'r');
    %     hold on;plot([startstep(i),endstep(i)]/fs,[2.5,2.5],'r');
    % end
    [wt,f] = cwt(signal,fs);
    idx = find(f>30 & f < 70);
    s = sum(abs(wt(idx,:)));
%     figure;plot((1:length(s))/fs,s);
    [pks_cwt, loc_cwt] = findpeaks(s,(1:length(s))/fs,'MinPeakDistance',0.35,'MinPeakHeight',min(0.25*max(s),1.5));
%     hold on;scatter(loc_cwt,pks_cwt,'filled');
    d = diff(loc_cwt); 
    wlk_time = median(d);
    walk_frequency = 1/wlk_time;
end