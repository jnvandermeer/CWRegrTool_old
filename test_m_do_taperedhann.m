% testing it on data consisting of a square wave
% a sawtooth wave
% a sine wave (with different frequencies.
x=[sawtooth((1:100000)/400);sin((1:100000)/1400);square((1:100000)/1000)];

% a phoney regressor consisting of noise
regs=[rand(1,100000) ; circshift(3*sin((1:100000)/1400)',10)'];

data.matrix=[x;regs];



% probably can be removed..
cfg.cwregression.srate = 1000;              %srate=1000;
cfg.cwregression.windowduration = 4;        %windowduration=2.0;
cfg.cwregression.delay = 0.020;             %delay=0.050;
cfg.cwregression.taperingfactor = 2;        %taperingfactor=1;
cfg.cwregression.taperingfunction = @hann;  %taperingfunction=@hann;
cfg.cwregression.regressorinds = [4 5];     %regressorinds=1:30;
cfg.cwregression.channelinds = 1:3;        %channelinds=33:40;
cfg.cwregression.method='taperedhann';




[data,cfg]=m_do_taperedhann(data,cfg);




% diagnostics.
% fitting delay:
reg=1;
collect=[];for i=1:numel([cfg.cwregression.logging{:}]);collect(:,:,i)=cfg.cwregression.logging{i}.fitdelay;end
figure;plot(squeeze(collect(:,reg,:))');
title('fitdelay','interpreter','none'); legend({'1','2','3'});

collect=[];for i=1:numel([cfg.cwregression.logging{:}]);collect(:,:,i)=cfg.cwregression.logging{i}.fitscale;end
figure;plot(squeeze(collect(:,reg,:))');
title('fitscale','interpreter','none'); legend({'1','2','3'});

collect=[];for i=1:numel([cfg.cwregression.logging{:}]);collect(:,:,i)=cfg.cwregression.logging{i}.fitmetric_delay;end
figure;plot(squeeze(collect(:,reg,:))');
title('fitmetric_delay','interpreter','none'); legend({'1','2','3'});

collect=[];for i=1:numel([cfg.cwregression.logging{:}]);collect(:,:,i)=cfg.cwregression.logging{i}.fitmetric_scale;end
figure;plot(squeeze(collect(:,reg,:))');
title('fitmetric_scale','interpreter','none'); legend({'1','2','3'});