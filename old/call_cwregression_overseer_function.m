% a la fieldtrip.
% this is where the real workflow start/happens.
% it uses a helper function to do the fitting and stuff, but this
% controls/checks where the fits apply.

function [data,cfg] = do_sliding_bcg_correction(data,cfg)


% probably can be removed..
cfg.cwregression.srate = 1000;              %srate=1000;
cfg.cwregression.windowduration = 1.3;      %windowduration=2.0;
cfg.cwregression.delay = 0.050;             %delay=0.050;
cfg.cwregression.taperingfactor = 2;        %taperingfactor=1;
cfg.cwregression.taperingfunction = @hann;  %taperingfunction=@hann;
cfg.cwregression.regressorinds = 33:40;     %regressorinds=1:30;
cfg.cwregression.channelinds = 1:31;        %channelinds=33:40;
cfg.cwregression.method='taperedhann';     % What method are we using??
% 'everything','none','slidingwindow' are the other options for method.




% as input we have the data matrix, and the regressor matrix.
% we have sampling rate
% we have the length of the window in sec
% we have the amount of temporal delay in sec


if strcmp(cfg.cwregression.method,'taperedhann')
    [data,cfg] = m_do_taperedhann(data,cfg);
elseif strcmp(cfg.cwregression.method,'slidingwindow')
    [data,cfg] = m_do_slidingwindow(data,cfg);
elseif strcmp(cfg.cwregression.method,'everything')
    [data,cfg] = m_do_everything(data,cfg);
elseif strcmp(cfg.cwregression.method,'none')
    disp('no correction will be performed!');
else
    error('some error occurred!');
end

