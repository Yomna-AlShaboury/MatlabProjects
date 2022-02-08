function varargout = trafficLightArduino(varargin)
% TRAFFICLIGHTARDUINO MATLAB code for trafficLightArduino.fig
%      TRAFFICLIGHTARDUINO, by itself, creates a new TRAFFICLIGHTARDUINO or raises the existing
%      singleton*.
%
%      H = TRAFFICLIGHTARDUINO returns the handle to a new TRAFFICLIGHTARDUINO or the handle to
%      the existing singleton*.
%
%      TRAFFICLIGHTARDUINO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAFFICLIGHTARDUINO.M with the given input arguments.
%
%      TRAFFICLIGHTARDUINO('Property','Value',...) creates a new TRAFFICLIGHTARDUINO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trafficLightArduino_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trafficLightArduino_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trafficLightArduino

% Last Modified by GUIDE v2.5 08-Feb-2022 10:33:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trafficLightArduino_OpeningFcn, ...
                   'gui_OutputFcn',  @trafficLightArduino_OutputFcn, ...
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


% --- Executes just before trafficLightArduino is made visible.
function trafficLightArduino_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trafficLightArduino (see VARARGIN)

% Choose default command line output for trafficLightArduino
clear -global a
global a
global carImg
global manImg
global count

count = 0;
a = arduino();
configurePin(a,"D8",'DigitalOutput')
configurePin(a,"D9",'DigitalOutput')
configurePin(a,"D10",'DigitalOutput')
configurePin(a,"D11",'DigitalOutput')

carImg = imread("Images/car.jpg");
manImg = imread("Images/man.png");
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trafficLightArduino wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trafficLightArduino_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in MaintenBtn2.
function MaintenBtn2_Callback(hObject, eventdata, handles)
% hObject    handle to MaintenBtn2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
set(handles.uipanel4, "Visible", "off")
set(handles.main, "Visible", "on")
writeDigitalPin(a,"D8",0);
writeDigitalPin(a,"D9",0);
writeDigitalPin(a,"D10",0);

% --- Executes on button press in manuBtn.
function manuBtn_Callback(hObject, eventdata, handles)
% hObject    handle to manuBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
global count
count = count + 1;
if count > 2
    count = 0;
end
switch count
    case 0
        writeDigitalPin(a,"D8",0);
        writeDigitalPin(a,"D9",0);
        writeDigitalPin(a,"D10",1);
    case 1
        writeDigitalPin(a,"D8",0);
        writeDigitalPin(a,"D9",1);
        writeDigitalPin(a,"D10",0);        
    case 2
        writeDigitalPin(a,"D8",1);
        writeDigitalPin(a,"D9",0);
        writeDigitalPin(a,"D10",0);        
end



% --- Executes on button press in maintenBtn1.
function maintenBtn1_Callback(hObject, eventdata, handles)
% hObject    handle to maintenBtn1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global isAuto
global a
isAuto = 0;
set(handles.autoPanel, "Visible", "off")
set(handles.main, "Visible", "on")
writeDigitalPin(a,"D11",0);


% --- Executes on button press in startBtn.
function startBtn_Callback(hObject, eventdata, handles)
% hObject    handle to startBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global carImg
global manImg
global isAuto
global a

switch get(get(handles.mode, "SelectedObject"), "tag")
    case 'auto'
        isAuto = 1;
        % read 2 counters
        carCounter = str2double(get(handles.carCounter, "String"));
        peopleCounter = str2double(get(handles.peopleCounter, "String"));
        % check at least one is NaN --> return
        if isnan(peopleCounter)|| isnan(carCounter)
            set(handles.errMsg, "Visible", "on")
           return
        else
            set(handles.errMsg, "Visible", "off")
        end
        set(handles.autoPanel, "Visible", "on")
        set(handles.main, "Visible", "off")
        while(1)
            if(~isAuto)
                break
            end
            carCounter = str2double(get(handles.carCounter, "String"));
            peopleCounter = str2double(get(handles.peopleCounter, "String"));
            while(carCounter)
                if(~isAuto)
                    break
                end
               imshow(carImg)
               writeDigitalPin(a,"D11",1)
               set(handles.count, "String", num2str(carCounter))
               pause(1)
               carCounter = carCounter -1; 
            end
            while(peopleCounter)
                if(~isAuto)
                    break
                end
               imshow(manImg)
               writeDigitalPin(a,"D11",0)
               set(handles.count, "String", num2str(peopleCounter))
               pause(1)
               peopleCounter = peopleCounter -1; 
            end
        end
        
    case 'manu'
        set(handles.uipanel4, "Visible", "on")
        set(handles.main, "Visible", "off")
        writeDigitalPin(a,"D10",1);
end

% code

function carCounter_Callback(hObject, eventdata, handles)
% hObject    handle to carCounter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carCounter as text
%        str2double(get(hObject,'String')) returns contents of carCounter as a double


% --- Executes during object creation, after setting all properties.
function carCounter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carCounter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function peopleCounter_Callback(hObject, eventdata, handles)
% hObject    handle to peopleCounter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of peopleCounter as text
%        str2double(get(hObject,'String')) returns contents of peopleCounter as a double


% --- Executes during object creation, after setting all properties.
function peopleCounter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to peopleCounter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in auto.
function auto_Callback(hObject, eventdata, handles)
% hObject    handle to auto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of auto
set(handles.counterSet, "Visible", "on")


% --- Executes on button press in manu.
function manu_Callback(hObject, eventdata, handles)
% hObject    handle to manu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of manu
set(handles.counterSet, "Visible", "off")


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
global isAuto
global a
isAuto = 0;

writeDigitalPin(a,"D8",0);
writeDigitalPin(a,"D9",0);
writeDigitalPin(a,"D10",0);
writeDigitalPin(a,"D11",0);

delete(hObject);
