function varargout = happyOrSad(varargin)
% HAPPYORSAD MATLAB code for happyOrSad.fig
%      HAPPYORSAD, by itself, creates a new HAPPYORSAD or raises the existing
%      singleton*.
%
%      H = HAPPYORSAD returns the handle to a new HAPPYORSAD or the handle to
%      the existing singleton*.
%
%      HAPPYORSAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HAPPYORSAD.M with the given input arguments.
%
%      HAPPYORSAD('Property','Value',...) creates a new HAPPYORSAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before happyOrSad_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to happyOrSad_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help happyOrSad

% Last Modified by GUIDE v2.5 18-Jan-2022 18:41:31

% Begin initialization code - DO NOT EDIT
global happy
global sad
happy = imread('Images/hap.png');
sad = imread('Images/sad.jpg');
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @happyOrSad_OpeningFcn, ...
                   'gui_OutputFcn',  @happyOrSad_OutputFcn, ...
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


% --- Executes just before happyOrSad is made visible.
function happyOrSad_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to happyOrSad (see VARARGIN)

% Choose default command line output for happyOrSad
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes happyOrSad wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = happyOrSad_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function age_Callback(hObject, eventdata, handles)
% hObject    handle to age (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of age as text
%        str2double(get(hObject,'String')) returns contents of age as a double


% --- Executes during object creation, after setting all properties.
function age_CreateFcn(hObject, eventdata, handles)
% hObject    handle to age (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnImg.
function btnImg_Callback(hObject, eventdata, handles)
% hObject    handle to btnImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global happy
    global sad
    
    axes(handles.img);
    age  = str2double(get(handles.age, 'String'));
    if ~isnan(age)
        set(handles.img, 'visible','on' );
        if age < 60
            imshow(happy);
        else
            imshow(sad);
        end
    end
