function [slope_up, slope_down, slope_up_sample, slope_down_sample] = calc_slope(y)
    x = 1:length(y);
    thre = 0.4*(max(y)-min(y))+min(y);
    t = (y(1:(end-1))-thre).*(y(2:end)-thre);
    idx_t = find(t<0);
    disp(size(idx_t));
    start_loc = idx_t(1);
    stop_loc = idx_t(2);
    start_fwhm = x(start_loc+1) - (y(start_loc+1)-thre)*(x(start_loc+1)-x(start_loc))/(y(start_loc+1)-y(start_loc));
    stop_fwhm = x(stop_loc+1) - (y(stop_loc+1)-thre)*(x(stop_loc+1)-x(stop_loc))/(y(stop_loc+1)-y(stop_loc));
    [m,l] = max(y);
    slope_up = (m-y(round(start_fwhm)))/(l-round(start_fwhm));
    slope_down = (m-y(round(stop_fwhm)))/(round(stop_fwhm)-l);
    slope_up_sample = l-round(start_fwhm);
    slope_down_sample = round(stop_fwhm)-l;
end