%
% 'overseer' function for performing & logging subtraction without
% any kind of windowing.
%
%
% [data,cfg]=m_do_everything(data,cfg)

function [data,cfg]=m_do_everything(data,cfg)



% % probably can be removed..
% cfg.cwregression.srate = 1000;              %srate=1000;
% cfg.cwregression.windowduration = 1.3;      %windowduration=2.0;
% cfg.cwregression.delay = 0.050;             %delay=0.050;
% cfg.cwregression.taperingfactor = 2;        %taperingfactor=1;
% cfg.cwregression.taperingfunction = @hann;  %taperingfunction=@hann;
% cfg.cwregression.regressorinds = 33:40;     %regressorinds=1:30;
% cfg.cwregression.channelinds = 1:31;        %channelinds=33:40;
% cfg.cwregression.method='taperedhann';     % What method are we using??
% % 'everything','none','slidingwindow' are the other options for method.
% 



cwregression=cfg.cwregression;


% taper_factor = cwregression.taperingfactor;
% function_to_calculate_nwindows=@(x) 2*(2^x-1)+1;
% nwindows=function_to_calculate_nwindows(taper_factor);
% do some complicated arithmatics to make sure that the boundaries of the
% tapering windows always falls on a sample (and not between samples, as
% then the sum would no longer hold...
% iteratively add (length) in samples to obtain this result.


% number_of_samples_in_window = floor(cwregression.srate*cwregression.windowduration + 1);
% window=cwregression.taperingfunction(number_of_samples_in_window);
% while rem((number_of_samples_in_window-1)/2^taper_factor,1)>0
%     number_of_samples_in_window = number_of_samples_in_window + 1;
% end
% nsteps = 2^taper_factor;
% step_in_samples = (number_of_samples_in_window - 1) / nsteps;
% division_factor = taper_factor;

% prepare where the window(s) should begin...
% begins_segments = [1];
% for i=1:(nsteps-1)
%     begins_segments(end+1) = begins_segments(end) + step_in_samples;
% end

delay_in_samples = floor(cwregression.srate*cwregression.delay);
% division_factor = 2^(taper_factor-1);

x=data.matrix(cwregression.channelinds,:);
regs=data.matrix(cfg.cwregression.regressorinds,:);

% if there's still enough data...
% for now... just store the subtracted data, so I can view it...
 

% stores logging (fitparameters, etc).
% set the window to 0!;
window=[];

[subtracted_signals logging]=tools.fit_regmat_to_signalmat(x,regs,window,delay_in_samples,[]);

cfg.cwregression.logging = {logging};
data.subtracted_data = subtracted_signals;




% if taper_factor==0
%     disp('no subtraction will occur; taper factor is zero (should be >=1)!');
% end


% reserve memory... for the fitted regs, and their weights...
% matrix_stored_fits = zeros(numel(cwregression.channelinds),number_of_samples_in_window,nwindows,class(regs));
% matrix_weights_fits = zeros(number_of_samples_in_window,nwindows,class(regs));


% sine-and-cosine;
% a taper factor of 0 = no window whatsoever!
% can be also 3, or 4 even.

% decide how many window need to be stored.
% --> nwindows

% determine division factor.
% --> division_factor

% determine the step size... and if that can be done, given the length of
% the window.
% --> step_in_samples

% determine what the points are where a new window should begin/need to be
% corrected or accounted for.
% --> begins_correction = 1:step_in_samples:size(data,2)



% this will initialize the piece of memory for storing where you sum over
% the windows...
% summation=zeros(numel(cwregression.channelinds),step_in_samples+1);

% if you later decide to skip certain bad fits/windows, the division needs
% to be accounted for separately. Since this is a bit more complicated, we
% now divide (see later on) by 2^(taper_factor-1) and leave it at that.
% for this purpose, matrix_weights_fits would exist (see commented code).

% current_sample = 1;
% while current_sample < size(x,2) - number_of_samples_in_window;
%    range = current_sample:current_sample+number_of_samples_in_window-1;
    
    
%    % decide if I can already do subtraction; if so..
%    if current_sample>=number_of_samples_in_window
        
        % determine the signal I must subtract; this is summation.
%        summation(:)=0;
%        for i=1:2^taper_factor
%            sumrange=(number_of_samples_in_window-(i*step_in_samples)) : number_of_samples_in_window-(i-1)*step_in_samples;
%            summation=summation + matrix_stored_fits(:,sumrange,nwindows-i+1);
%        end
%        summation=summation/2^(taper_factor-1);
        
        
        % subtract that signal from the data.
%        subtractrange = (current_sample-step_in_samples+1):current_sample;
        
        % yes, it's 2 and not 1; because otherwise I would doubly correct
        % things. should not matter, though, due to the tapering approach.
%        subtracted_signals(:,sumrange) = summation(:,2:end);
        
%    end
    
    
    % do a new window;
    %xpart = x(range);
    %regspart = regs(range);
    
    % do fifo rule! (% shift the windows backwards)
    %matrix_stored_fits(:,:,1:end-1)=matrix_stored_fits(:,:,2:end);
    %matrix_stored_fits(:,:,end)=fittedregs;
    % matrix_weights_fits(:,1:end-1) = matrix_weights_fits(:,2:end);
    % matrix_weights_fits = window;
    
    % store fitting parameters
    %logging(end+1) = logging;
    
    
    % annotate begin/end
    % annotate all that fitted data...
    
    % I can check which part is complete...
    
    
% end

% this needs to be called for each window.
