% 13Week 신호 변환과 스펙트럼
% 2.5 kHz와 10 kHz의 CW 신호, 5-15 kHz의 LFM 신호를 생성하여 합한 후
% time series, pwelch, spectrogram 분석하라.

% 1) time-series
fs = 100e3; % sampling frequency
pl = 0.1; % pulse length (s)
t = (1:pl*fs)/fs; % signal time (s)

fc_1 = 2.5e3; % center frequency
fc_2 = 10e3;
w_1 = 2*pi*fc_1; % angular frequency
w_2 = 2*pi*fc_2;

sig_cw_1 = sin(w_1*t); % CW signal
sig_cw_2 = sin(w_2*t);
sig_lfm = chirp(t,5000,pl,15000); % LFM signal(초기:5, 끝:15)
sig_cw_total = sig_cw_1 + sig_cw_2 + sig_lfm;

figure; set(gcf,'position',[200 100 560 300])
plot(t, sig_cw_total)
g=xlabel('Time (sec)'); set(g,'fontsize',12);
g=ylabel('Amplitude'); set(g,'fontsize',12);
set(gca,'fontsize',12);
xlim([0 0.1])


% 2) pwelch
nfft = fs;
[pxx,f] = pwelch(sig_cw_total,[],[],nfft,fs); % 합친 것

figure; set(gcf,'position',[200 100 560 300])
plot(f,10*log10(pxx))
g=xlabel('Frequency (Hz)'); set(g,'fontsize',12);
set(gca,'fontsize',12);
xlim([0 2e4])


% spectrogram
nfft = fs/100;
[S,F,T] = spectrogram(sig_cw_total,256,[],nfft,fs);

figure; set(gcf,'position',[200 100 560 300])
imagesc(T,F,20*log10(abs(S)))
g=xlabel('Time (sec)'); set(g,'fontsize',12);
g=ylabel('Frequency (Hz)'); set(g,'fontsize',12);
set(gca,'fontsize',12);
ylim([0 2e4]);caxis([-20 40]);axis xy

[S,F,T] = spectrogram(sig_cw_total,512,[],nfft,fs);

figure; set(gcf,'position',[200 100 560 300])
imagesc(T,F,20*log10(abs(S)))
g=xlabel('Time (sec)'); set(g,'fontsize',12);
g=ylabel('Frequency (Hz)'); set(g,'fontsize',12);
set(gca,'fontsize',12);
ylim([0 2e4]);caxis([-20 40]);axis xy


