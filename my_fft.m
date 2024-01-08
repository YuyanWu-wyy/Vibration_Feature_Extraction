function [f, P1] = my_fft(signal,fs)
    Y = fft(signal);
    L = length(signal);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = fs*(0:(L/2))/L;
%     figure;plot(f,(P1));
%     title("Single-Sided Amplitude Spectrum of X(t)")
%     xlabel("f (Hz)");
%     ylabel("|P1(f)|");
end