function [startstep,endstep]= step_separation(signal,fs)
    [wt,f] = cwt(signal,fs);

    idx = find(f>30 & f < 70);
    s = sum(abs(wt(idx,:)));

    [pks_cwt, loc_cwt] = findpeaks(s,'MinPeakDistance',0.35*fs,'MinPeakHeight',min(0.25*max(s),1.5));
    if length(loc_cwt)==0
        startstep=[];
        endstep=[];
        return;
    end
    start_end=[];
    for i=1:length(loc_cwt)
        if loc_cwt(i)-0.1*fs<0
            continue;
        end
        if loc_cwt(i)+0.25*fs > length(signal)
            continue;
        end
        start_end=[start_end,max(loc_cwt(i)-0.1*fs,1),min(loc_cwt(i)+0.25*fs,length(signal))];
    end
    start_end=reshape(start_end,[2,length(start_end)/2]);
    start_end=start_end';
    startstep=start_end(:,1)';
    endstep=start_end(:,2)';
end