function varargout = oscilloscope(varargin)
% OSCILLOSCOPE MATLAB code for oscilloscope.fig
%      OSCILLOSCOPE, by itself, creates a new OSCILLOSCOPE or raises the existing
%      singleton*.
%
%      H = OSCILLOSCOPE returns the handle to a new OSCILLOSCOPE or the handle to
%      the existing singleton*.
%
%      OSCILLOSCOPE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OSCILLOSCOPE.M with the given input arguments.
%
%      OSCILLOSCOPE('Property','Value',...) creates a new OSCILLOSCOPE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before oscilloscope_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to oscilloscope_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help oscilloscope

% Last Modified by GUIDE v2.5 24-Jan-2022 22:56:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @oscilloscope_OpeningFcn, ...
                   'gui_OutputFcn',  @oscilloscope_OutputFcn, ...
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


% --- Executes just before oscilloscope is made visible.
function oscilloscope_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to oscilloscope (see VARARGIN)

% Choose default command line output for oscilloscope
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes oscilloscope wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = oscilloscope_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startBtn.
function startBtn_Callback(hObject, eventdata, handles)
% hObject    handle to startBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global a;
global isStop;
global tim;
global i;
global t
global v

i = 1;
isStop = 0;

set(handles.stopBtn, 'Visible', 'on')
set(handles.startBtn, 'Visible', 'off')


btn = get(handles.OscType, "SelectedObject");        % get the selected button form radio group
timeRes = str2double(get(handles.timeRes, 'String'));
timeMax = str2double(get(handles.timeMax, 'String'));

t = 0:timeRes:timeMax;
v = zeros(size(t));

switch(get(btn, "tag"))
    case 'analog'
        pin = string(a.AvailableAnalogPins(get(handles.pins, 'value')));
        configurePin(a, pin, "AnalogInput");
        OscType = 'analog';
    case 'digital'
        pin = string(a.AvailableDigitalPins(get(handles.pins, 'value')));
        configurePin(a, pin, "DigitalInput");
        OscType = 'digital';
end

tim = timer('Period', timeRes);
tim.TimerFcn = {@timerPlot, OscType, pin, timeRes, handles};
tim.TasksToExecute = inf;
tim.ExecutionMode = 'fixedRate';
start(tim);








function timeRes_Callback(hObject, eventdata, handles)
% hObject    handle to timeRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeRes as text
%        str2double(get(hObject,'String')) returns contents of timeRes as a double
num = str2double(get(handles.timeRes, 'String'));
if isnan(num)|| num <= 0.001
    set(handles.timeRes, 'String', '0.1')
end

% --- Executes during object creation, after setting all properties.
function timeRes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timeMax_Callback(hObject, eventdata, handles)
% hObject    handle to timeMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeMax as text
%        str2double(get(hObject,'String')) returns contents of timeMax as a double
num = str2double(get(handles.timeMax, 'String'));
if isnan(num)
    set(handles.timeMax, 'String', '10')
end

% --- Executes during object creation, after setting all properties.
function timeMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pins.
function pins_Callback(hObject, eventdata, handles)
% hObject    handle to pins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pins contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pins


% --- Executes during object creation, after setting all properties.
function pins_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in analog.
function analog_Callback(hObject, eventdata, handles)
% hObject    handle to analog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
str = a.AvailableAnalogPins;
set(handles.pins, 'String', str)

% Hint: get(hObject,'Value') returns toggle state of analog


% --- Executes on button press in digital.
function digital_Callback(hObject, eventdata, handles)
% hObject    handle to digital (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
str = a.AvailableDigitalPins;
set(handles.pins, 'String', str)

% Hint: get(hObject,'Value') returns toggle state of digital


% --- Executes on button press in connect.
function connect_Callback(hObject, eventdata, handles)
% hObject    handle to connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clear a;
clearvars a;
clearvars -global a;
global a;
global isStop;
isStop = 0;
try
    a = arduino();
catch
    set(handles.err, 'Visible', 'on')
    return;
end
set(handles.err, 'Visible', 'off')
set(handles.OscType, 'Visible', 'on')
set(handles.startBtn, 'Visible', 'on')
set(handles.axes1, 'Visible', 'on')
set(handles.pins, 'Visible', 'on')
btn = get(handles.OscType, "SelectedObject");        % get the selected button form radio group
switch(get(btn, "tag"))
    case 'analog'
        str = a.AvailableAnalogPins;
    case 'digital'
        str = a.AvailableDigitalPins;
end
set(handles.pins, 'String', str)




% --- Executes on button press in stopBtn.
function stopBtn_Callback(hObject, eventdata, handles)
% hObject    handle to stopBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global isStop;
global tim;

stop(tim)
delete(tim);

isStop = 1;
set(handles.stopBtn, 'Visible', 'off')
set(handles.startBtn, 'Visible', 'on')


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global isStop;
global tim;
try
    stop(tim)
    delete(tim);
catch
end
isStop = 1;

% Hint: delete(hObject) closes the figure
delete(hObject);
