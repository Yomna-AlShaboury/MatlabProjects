function varargout = calculator(varargin)
% CALCULATOR MATLAB code for calculator.fig
%      CALCULATOR, by itself, creates a new CALCULATOR or raises the existing
%      singleton*.
%
%      H = CALCULATOR returns the handle to a new CALCULATOR or the handle to
%      the existing singleton*.
%
%      CALCULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULATOR.M with the given input arguments.
%
%      CALCULATOR('Property','Value',...) creates a new CALCULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before calculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to calculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help calculator

% Last Modified by GUIDE v2.5 18-Jan-2022 18:40:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calculator_OpeningFcn, ...
                   'gui_OutputFcn',  @calculator_OutputFcn, ...
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


% --- Executes just before calculator is made visible.
function calculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to calculator (see VARARGIN)

% Choose default command line output for calculator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes calculator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = calculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function num1_Callback(hObject, eventdata, handles)
% hObject    handle to num1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num1 as text
%        str2double(get(hObject,'String')) returns contents of num1 as a double


% --- Executes during object creation, after setting all properties.
function num1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function num2_Callback(hObject, eventdata, handles)
% hObject    handle to num2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num2 as text
%        str2double(get(hObject,'String')) returns contents of num2 as a double


% --- Executes during object creation, after setting all properties.
function num2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function res_Callback(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of res as text
%        str2double(get(hObject,'String')) returns contents of res as a double


% --- Executes during object creation, after setting all properties.
function res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ops.
function ops_Callback(hObject, eventdata, handles)
% hObject    handle to ops (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ops contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ops


% initialize res to empty and don't show any console errors
set(handles.res, "String", "");
set(handles.errCon, "Visible", 'off');

% get the value of the listbox to get the operation
op = get(handles.ops, "Value");
switch(op)
    case 1
        set(handles.op, "String", "+");
    case 2
         set(handles.op, "String", "-");
    case 3
         set(handles.op, "String", "*");
    case 4
         set(handles.op, "String", "/");
end


% --- Executes during object creation, after setting all properties.
function ops_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ops (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in equal.
function equal_Callback(hObject, eventdata, handles)
% hObject    handle to equal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% initialize res to empty and don't show any console errors
set(handles.res, "String", "");
set(handles.errCon, "Visible", 'off');

num1 = str2double(get(handles.num1, "String"));     % get number 1
num2 = str2double(get(handles.num2, "String"));     % get number 2

op = get(handles.op, "String");                     % get the operation
res = "";                                           % initialize the result value to empty

if(~isnan(num1)&& ~isnan(num2))                     % if number 1 and number 2 are not empty, do the operations
    switch(op)
        case '+'
            res = num1 +num2;
        case '-'
             res = num1 - num2;
        case '*'
             res = num1 * num2;
        case '/'
             res = num1 / num2;
    end
end

% if number 1 is divided by number 2 (zero) -- > show console error, else,
% dispaly the result
if num2 == 0 && op=='/'
    set(handles.errCon, "Visible", 'on'); 
else
    set(handles.res, "String", num2str(res));    
end



function x_axis_Callback(hObject, eventdata, handles)
% hObject    handle to x_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_plot as text
%        str2double(get(hObject,'String')) returns contents of x_plot as a double


% --- Executes during object creation, after setting all properties.
function x_axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_axis_Callback(hObject, eventdata, handles)
% hObject    handle to y_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_plot as text
%        str2double(get(hObject,'String')) returns contents of y_plot as a double


% --- Executes during object creation, after setting all properties.
function y_axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ops_axis.
function ops_axis_Callback(hObject, eventdata, handles)
% hObject    handle to ops_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ops_axis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ops_axis

% initialize res to empty and don't show any console errors
set(handles.res_axis, "String", "");
set(handles.errCon_axis, "Visible", 'off');

% get the value of the operation from listbox
op = get(handles.ops_axis, "Value");

% set the operation on gui whenever changed
switch(op)
    case 1
        set(handles.op_axis, "String", "+");
    case 2
         set(handles.op_axis, "String", "-");
    case 3
         set(handles.op_axis, "String", "*");
    case 4
         set(handles.op_axis, "String", "/");
end


% --- Executes during object creation, after setting all properties.
function ops_axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ops_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function func_Callback(hObject, eventdata, handles)
% hObject    handle to func (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of func as text
%        str2double(get(hObject,'String')) returns contents of func as a double


% --- Executes during object creation, after setting all properties.
function func_CreateFcn(hObject, eventdata, handles)
% hObject    handle to func (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function res_axis_Callback(hObject, eventdata, handles)
% hObject    handle to res_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of res_axis as text
%        str2double(get(hObject,'String')) returns contents of res_axis as a double


% --- Executes during object creation, after setting all properties.
function res_axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to res_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in equal_axis.
function equal_axis_Callback(hObject, eventdata, handles)
% hObject    handle to equal_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% initialize res to empty and don't show any console errors
set(handles.res_axis, "String", "");
set(handles.errCon_axis, "Visible", 'off');

num1 = str2num(get(handles.x_axis, "String"));  % get the value of x axis
num2 = str2num(get(handles.y_axis, "String"));  % get the value of y axis

if (~all(size(num1)== size(num2)))              % check if x , y axis are of the same length
    set(handles.errCon_axis, "String", "x, y axis must be same length"); 
    set(handles.errCon_axis, "Visible", 'on');
    return
end

op = get(handles.op_axis, "String");            % get the operation for axis
res = "";                                       % initialize the result to be empty

% do the operations
switch(op)
    case '+'
        res = num1 +num2;
    case '-'
         res = num1 - num2;
    case '*'
         res = num1 .* num2;
    case '/'
         res = num1 ./ num2;
end

% check if y axis has zeros when division operation is applied, ---> display
% console error, else --> display the result
if ~all(num2) && op=='/'
    set(handles.errCon_axis, "String", "Can't Divide by 0"); 
    set(handles.errCon_axis, "Visible", 'on'); 
else
    set(handles.res_axis, "String", num2str(res));    
end



% --- Executes on button press in enter.
function enter_Callback(hObject, eventdata, handles)
% hObject    handle to enter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global plot_fig

% initialize by don't show any console errors
set(handles.errCon_axis, "Visible", 'off');

btn = get(handles.uibuttongroup1, "SelectedObject");        % get the selected button form radio group
switch(get(btn, "tag"))                                     % get the tag name of the selected button to plot the required graph
    case 'x_plot'                                           % x - axis plot
        x = str2num(get(handles.x_axis, "String"));         % get the x - axis
        if(isempty(x))                                      % if x - axis is empty --> diplay console error
            set(handles.errCon_axis, "String", "must enter data"); 
            set(handles.errCon_axis, "Visible", 'on');
            return
        end
        plot_fig = plot(x,0,'*r');                          % plot the x - axis on the x direction
        ylim([0 1])                                         % set y - axis limit
        
    case 'y_plot'                                           % y - axis plot
        y = str2num(get(handles.y_axis, "String"));         % get the y - axis
        if(isempty(y))                                      % if y - axis is empty --> diplay console error
            set(handles.errCon_axis, "String", "must enter data"); 
            set(handles.errCon_axis, "Visible", 'on');
            return
        end
        plot_fig = plot(0,y,'*r');                          % plot the y - axis on the y direction
        xlim([0 1])                                         % set x - axis limit
        
    case 'xy_plot'                                          % xy - axis plot
        x = str2num(get(handles.x_axis, "String"));         % get the x - axis
        y = str2num(get(handles.y_axis, "String"));         % get the y - axis
        if(isempty(x)|| isempty(y))                         % if x - axis or y - axis is empty --> diplay console error
            set(handles.errCon_axis, "String", "must enter data"); 
            set(handles.errCon_axis, "Visible", 'on');
            return
        end
        plot_fig = plot(x,y,'*r');                          % plot x vs. y

    case 'resultant_plot'                                   % resultant plot
        res = str2num(get(handles.res_axis, "String"));     % get the resultant axis
        if(isempty(res))                                    % if resultant axis is empty --> diplay console error
            set(handles.errCon_axis, "String", "must enter data"); 
            set(handles.errCon_axis, "Visible", 'on');
            return
        end
        plot_fig = plot(res,0,'*r');                        % plot the resultant axis on the x direction
        ylim([0 1])                                         % set y - axis limit
        
    case 'sin_plot'                                         % plot sin
        x = 0:0.01:360*2;                                   % x values for sin --> 720 degree
        y = sind(x);                                        % y = sin(x) in degrees
        plot_fig = plot(x,y);                               % plot sin graph
        
    case 'cos_plot'                                         % plot cos
        x = 0:0.01:360*2;                                   % x values for cos --> 720 degree
        y = cosd(x);                                        % y = cos(x) in degrees
        plot_fig = plot(x,y);                               % plot cos graph
        
    case 'equation_plot'                                    % plot any equation graph
        equ = str2sym(get(handles.func, "String"));         % get symbolic expression
        if(isempty(equ))                                    % if equation field is empty --> diplay console error
            set(handles.errCon_axis, "String", "must enter data"); 
            set(handles.errCon_axis, "Visible", 'on');
            return
        end
        try
            plot_fig = fplot(equ);                          % function plot user for ex. tan(x)
        catch
            plot_fig = fimplicit(equ);                      % function implicit plot used for ex. y = tan(x)
        end
end


% --- Executes on button press in delete.
function delete_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global plot_fig
delete(plot_fig)                        % deletes the plotted function from the axes


function x_plot_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function y_plot_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function xy_plot_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function resultant_plot_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function sin_plot_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function cos_plot_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function equation_plot_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
