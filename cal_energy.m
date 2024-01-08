function [energy,smoothed_energy, log_energy] = cal_energy(win_size,signal,span)
    energy = [];
    for i = 1:(length(signal)-win_size+1)
        en = sum((signal(i:(i+win_size-1))).^2);
        energy = [energy;en];
    end
    smoothed_energy = smooth(energy,span);
    log_energy = log(energy);
end