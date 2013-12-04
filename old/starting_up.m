% make this a function that outputs all the desired metrics, also.

expansion = 10; % expanding 10 in meg and 10 in pos directions...

x=[rand(1,100);sin(1:0.5:50.5)]; % data selection; it can also be windowed.
nx=size(x,1);

cx = zeros(size(x)); % corrected data.

windowfunction = @hanning;
window = windowfunction(size(x,2));


regs=x; % regressors;
nregs = size(regs,1); % number of regressors.
i_reg = 1; % current regressor (!!).


% for an illustration:
% m=[];for d=[0:125:1000];m=[m; sin((d+(1:1000))/1000*2*pi).^2];end;
% m=[];for d=[1:(1000/(2^4)):1000];m=[m; sin((d+(1:1000))/1000*pi).^2];end;




% time-expand regressors
expregs=flipud(delay_embed(regs,(1+2*expansion)));
% window that...
expregs = (window*ones(1,size(expregs,1)).*expregs')';

for i_x=1:nx
    
    % determine this PER channel again & again (saves memory I guess)?
    datavec = x(i_x,:);
    datavec = datavec .* window';
    % window datavec...
    fitted=datavec*pinv(expregs)*expregs;

    % later on subtract that..
    cx(i_x,:) = datavec - fitted;
    
    for i_reg=1:negs
        % now determine my fit parameters... per regressor!
        v=lscov(expregs(i_reg:nregs:end,:)',fitted');
        
        fitscale = v(v==max(v));
        fitdelay = find(v==max(v)) - expansion - 1;
        fitmetric_time = (abs(max(v))-mean(abs(v(v~=max(v)))))/abs(max(v));
        fitmetric_signal = corr(fitted',datavec');
        
    end
    
end


