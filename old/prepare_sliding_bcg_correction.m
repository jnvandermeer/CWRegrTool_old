% you can call it with all the required variables set.
% it'll translate it to some kind of fieldtrip format
% and then utilize the m_do_ functions to do the actual correction.
% you can also call this without any parameters, but with only a single
% input varable: the data. this must in any case be given.

function varargout = prepare_sliding_bcg_correction(varargin)

% this function exists to enable people to call from the command line, or
% frome some other environment (such as eeglab)

% check the varargs.
% if they are 0, pop-up with all the things.
% if they are complete, assign stuff.
% make it cfg.bcgcorr.srate
% etc etc.

% en d of data.
% this is a simple wrapper function that enables you to 
% give up all the desired parameters.
% this should do the actual correction.
% first determine the window compared to the sampling rate.

% als ui = 1, show the UI.
% keyboard;
if numel(varargin)<8&&numel(varargin)==0
    error('not enough inputs');
elseif numel(varargin)>9
    error('too many arguments!');
end

if numel(varargin)==9||numel(varargin)==8
    
    % roep de uitvoerende functie aan (die overziet hoe het proces verloopt)
    data.matrix=varargin{1}; %DATAMATRIX;

    cfg.cwregression.srate = varargin{2}; %srate=1000;
    cfg.cwregression.windowduration = varargin{3}; %windowduration=2.0;
    cfg.cwregression.delay = varargin{4}; %delay=0.050;
    cfg.cwregression.taperingfactor = varargin{5}; %taperingfactor=1;
    cfg.cwregression.taperingfunction = varargin{6}; %taperingfunction=@hann;
    cfg.cwregression.regressorinds = varargin{7}; %regressorinds=1:30;
    cfg.cwregression.channelinds = varargin{8}; %channelinds=33:40;
    
    if numel(varargin)==9
        doui=varargin{9};
    else
        doui=1;
    end
    
    
elseif numel(varargin)==1
    doui = 1;
    
    data.matrix=varargin{1}; %DATAMATRIX;

    cfg.cwregression.srate = []; %srate=1000;
    cfg.cwregression.windowduration = 2.000; %windowduration=2.0;
    cfg.cwregression.delay = 0.050; %delay=0.050;
    cfg.cwregression.taperingfactor = 1; %taperingfactor=1;
    cfg.cwregression.taperingfunction = @hann; %taperingfunction=@hann;
    cfg.cwregression.regressorinds = []; %regressorinds=1:30;
    cfg.cwregression.channelinds = []; %channelinds=33:40;
    
    
end
   


if doui
    % in order to get a ui in matlab to return a variable is... HELL!
    cfg=bcg_correction_tool_ui(cfg);
end


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
% depending on the method, call the required m_ function!!

%


