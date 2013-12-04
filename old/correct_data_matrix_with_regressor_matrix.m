% voor eeglab: maak een overkoepelende functie die de pop aanroept.
% hij schrijft in de EEG.history wat ie moet doen...
% hij extraheert alles uit t EEG
% en hij schrijft het daarna weg in n nieuwe dataset.

% de UI doet niks; hij zorgt er alleen voor dat er n variabele in de
% workspace komt (cfg en data??).
% dus... forcibly write the variable to the workspace.
% then close it.
% i don't want to use EEG data struct...

% daarna t echte scriptje aanroepen!!!


DATAMATRIX=rand(40,10000,'single');
% genereer een popup zodat je dit allemaal kan veranderen.
% als dingen al gedefinieerd zijn, staan ze al ingevuld!
% als alles al klaar staat kan je zeggen dat je geen popup wil.

srate=1000; % in Hz
windowduration=2; % in seconds.
delay=0.050; % in seconds.
taperingfactor=1; % more makes it quadratically slower.
taperingfunction=@hann;% function for generating my window!
regressorinds=1:31;% channel indices for data.
channelinds=33:40;% channel indices for regressors.
doui=1;


[corrected metrics] = prepare_sliding_bcg_correction(DATAMATRIX,srate,windowduration,delay,taperingfactor,taperingfunction,regressorinds,channelinds,doui);












