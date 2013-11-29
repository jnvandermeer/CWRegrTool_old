function varargout = select_method_ui(varargin)
% SELECT_METHOD_UI MATLAB code for select_method_ui.fig
%      SELECT_METHOD_UI, by itself, creates a new SELECT_METHOD_UI or raises the existing
%      singleton*.
%
%      H = SELECT_METHOD_UI returns the handle to a new SELECT_METHOD_UI or the handle to
%      the existing singleton*.
%
%      SELECT_METHOD_UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_METHOD_UI.M with the given input arguments.
%
%      SELECT_METHOD_UI('Property','Value',...) creates a new SELECT_METHOD_UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_method_ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_method_ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_method_ui

% Last Modified by GUIDE v2.5 19-Sep-2013 12:06:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_method_ui_OpeningFcn, ...
    'gui_OutputFcn',  @select_method_ui_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before select_method_ui is made visible.
function select_method_ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_method_ui (see VARARGIN)

% Choose default command line output for select_method_ui


if numel(varargin)==1
    option=varargin{1};
    if sum(strcmp(option,{'taperedhann','everything','slidingwindow'}))==1
        set(handles.(['radiobutton_' option]),'Value',1);
    elseif strcmp(option,'none');
        % do nothing
    else
        error('wrong option!');
    end
    
end

guidata(hObject, handles);
% UIWAIT makes bcg_correction_tool_ui wait for user response (see UIRESUME)
uiwait(handles.figure1);

% handles.output = hObject;

% Update handles structure
% guidata(hObject, handles);

% UIWAIT makes select_method_ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = select_method_ui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output;

varargout{1} =  handles.userdata.option;

close(handles.figure1);


% --- Executes on button press in radiobutton_everything.
function radiobutton_everything_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_everything (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_everything
if get(hObject,'Value')==1
    set(handles.radiobutton_taperedhann,'Value',0);
    set(handles.radiobutton_slidingwindow,'Value',0);
end


% --- Executes on button press in radiobutton_slidingwindow.
function radiobutton_slidingwindow_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_slidingwindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_slidingwindow
if get(hObject,'Value')==1
    set(handles.radiobutton_taperedhann,'Value',0);
    set(handles.radiobutton_everything,'Value',0);
end



% --- Executes on button press in radiobutton_taperedhann.
function radiobutton_taperedhann_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_taperedhann (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_taperedhann
if get(hObject,'Value')==1
    set(handles.radiobutton_slidingwindow,'Value',0);
    set(handles.radiobutton_everything,'Value',0);
end



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% fields=fieldnames(handles.userdata.cfg.cwregression);
% keyboard;

option = 'none';
if get(handles.radiobutton_taperedhann,'Value')
    option='taperedhann';
elseif get(handles.radiobutton_everything,'Value')
    option='everything';
elseif get(handles.radiobutton_slidingwindow,'Value')
    option='slidingwindow';
end

handles.userdata.option=option;

guidata(hObject,handles);

% keyboard;
% bcg_correction_tool_ui_OutputFcn(hObject, eventdata, handles);
% put cfg into the calling namespace.
% keyboard;
% this will evaluate figure1_CloseRequestFcn.

close(handles.figure1);



% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
if isequal(get(hObject, 'waitstatus'), 'waiting')
    %
    % The GUI is still in UIWAIT, us UIRESUME
    % keyboard;
    uiresume(hObject);
else
    % bcg_correction_tool_ui_OutputFcn(hObject, eventdata, handles)
    % The GUI is no longer waiting, just close it
    delete(hObject);
end

% delete(hObject);
