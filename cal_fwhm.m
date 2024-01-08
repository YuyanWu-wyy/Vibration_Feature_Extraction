function fwhm = cal_fwhm(x,y)
    thre = 0.5*(max(y)-min(y))+min(y);
    t = (y(1:(end-1))-thre).*(y(2:end)-thre);
    idx_t = find(t<0);
%     figure;plot(x,y);
%     disp(size(idx_t));
    start_loc = idx_t(1);
    stop_loc = idx_t(end);
    start_fwhm = x(start_loc+1) - (y(start_loc+1)-thre)*(x(start_loc+1)-x(start_loc))/(y(start_loc+1)-y(start_loc));
    stop_fwhm = x(stop_loc+1) - (y(stop_loc+1)-thre)*(x(stop_loc+1)-x(stop_loc))/(y(stop_loc+1)-y(stop_loc));
   % figure;plot(loc_ampli,pks_ampli);
    fwhm = stop_fwhm - start_fwhm;
end