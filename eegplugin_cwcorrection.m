

% eegplugin_pca() - pca plugin
function vers = eegplugin_cwcorrection( fig, try_strings, catch_strings)

vers = 'CW Regression Tool 0.01';
% create menu

% submenu = uimenu( toolsmenu, 'label', 'CW Regression Tool');


% fastrcmd = [ try_strings.no_check '[EEG LASTCOM] = pop_fmrib_fastr(EEG);' catch_strings.new_and_hist ];
% pascmd=[ try_strings.no_check '[EEG LASTCOM] = pop_fmrib_pas(EEG);' catch_strings.new_and_hist ];
% qrsdetectcmd=[ try_strings.no_check '[EEG LASTCOM] = pop_fmrib_qrsdetect(EEG);' catch_strings.new_and_hist ];

% add menu
%----------
toolsmenu = findobj(fig, 'tag', 'tools');
cwregressionmenu=uimenu(toolsmenu,'label','CW Regression Tool','separator','on','tag','CW Regression Tools');
commando1 = [ try_strings.no_check '[EEG LASTCOM] = pop_cwregression( EEG );' catch_strings.new_and_hist ];
submenu_cwregression=uimenu(cwregressionmenu,'label','Remove BCG/Hg Artifacts','tag','cwregression menu','callback',commando1);

commando2 = [ try_strings.no_check '[EEG LASTCOM] = pop_diagnostics( EEG );' catch_strings.new_and_hist ];
submenu_diagnostics=uimenu(cwregressionmenu,'label','Diagnostics','separator','on','tag','diagnostics menu','callback',commando2);

% commando3 = [ try_strings.no_check '[EEG LASTCOM] = pop_cwregression_fixed_delay( EEG );' catch_strings.new_and_hist ];
% submenu_diagnostics=uimenu(cwregressionmenu,'label','Subtract with given delay matrix','tag','regression with fixed delay menu','callback',commando3);


% pasmenu=uimenu(cwregressionmenu,'label','Remove pulse artifacts','tag','pas menu','callback',pascmd);


% toolsmenu = findobj(fig, 'tag', 'tools');
% submenu = uimenu( toolsmenu, 'label', 'Bergen EEG-fMRI Toolbox');

% % build command for menu callback
% cmd = [ '[tmp1 EEG.icawinv] = runpca(EEG.data(:,:));' ]; 
% cmd = [ cmd 'EEG.icaweights = pinv(EEG.icawinv);' ]; 
% cmd = [ cmd 'EEG.icasphere = eye(EEG.nbchan);' ]; 
% cmd = [ cmd 'clear tmp1;' ];
% 
% finalcmd = [ try_strings.no_check cmd ]; 
% finalcmd = [ finalcmd 'LASTCOM = ''' cmd ''';' ]; 
% finalcmd = [ finalcmd catch_strings.store_and_hist. ]; 
  
    % add folder to path
    % ------------------
% % % Command line string
% % str_cmd = 'clc'
% % 
% % finalcmd = str_cmd
% % % add new submenu
% % uimenu( submenu, 'label', 'Using fMRI realigment info', 'callback', finalcmd);
% % 
% % 
% [ EEGOUT, output ] = pop_cwregression( EEG )
%fastrcmd 
% keyboard;


% option = uimenu(submenu,'label','Remove BCG/He Artifacts','tag','fastr menu','callback',comando);

% fmribmenu = uimenu(toolsmenu,'label','FMRIB Tools','separator','on','tag','fmrib tools');

