function varargout = GUI_compresie(varargin)
% GUI_COMPRESIE MATLAB code for GUI_compresie.fig
%      GUI_COMPRESIE, by itself, creates a new GUI_COMPRESIE or raises the existing
%      singleton*.
%
%      H = GUI_COMPRESIE returns the handle to a new GUI_COMPRESIE or the handle to
%      the existing singleton*.
%
%      GUI_COMPRESIE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_COMPRESIE.M with the given input arguments.
%
%      GUI_COMPRESIE('Property','Value',...) creates a new GUI_COMPRESIE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_compresie_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_compresie_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_compresie

% Last Modified by GUIDE v2.5 30-Dec-2016 18:08:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_compresie_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_compresie_OutputFcn, ...
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


% --- Executes just before GUI_compresie is made visible.
function GUI_compresie_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_compresie (see VARARGIN)

clc
imagine=rgb2gray(imread('ha.jpg'));
imagine = im2double(imresize(imagine, 0.5));
[m,n]=size(imagine);
handles.m=m;
handles.n=n;


[U,S,V]=svd(imagine);
sigmas=diag(S);

axes(handles.axes2); %set the current axes to axes2
plot(log(sigmas))
title(['Valori singulare'])

axes(handles.axes3); %set the current axes to axes3
plot(cumsum(sigmas)/sum(sigmas))
title(['Procentul din total'])

axes(handles.axes4); %set the current axes to axes4
imshow(imagine)
title(['Imagine originala'])

axes(handles.axes5); %set the current axes to axes5
imshow(imagine)

handles.imagine=imagine;
    



% Choose default command line output for GUI_compresie
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_compresie wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_compresie_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.

switch str{val};
case '1000' % User selects 1000.
    ranks = 1000;
    
case '500' % User selects 500.
   ranks = 500;    
case '200' % User selects 200.
    ranks = 200;
    
case '100' % User selects 100.
   ranks = 100;
    
case '50' % User selects 50.
    ranks=50;
    
    case '30' % User selects 30.
    ranks = 30;
    
    case '20' % User selects 20.
    ranks = 20;
    
    case '10' % User selects 10.
    ranks = 10;
    
    case '5' % User selects 5.
    ranks = 5;
    
end
handles.ranks=ranks;

% Save the handles structure.
guidata(hObject,handles)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagine=handles.imagine;
ranks=handles.ranks;

    [U,S,V]=svd(imagine);
    sigmas=diag(S);
    SN = zeros(ranks,ranks);
    for j=1:ranks
    SN(j,j)=S(j,j);
    end
    Usmaller = U(:,1:ranks);
    Vsmaller = V(:,1:ranks);
    aprox_imag=Usmaller*SN*(Vsmaller');
    axes(handles.axes5); %set the current axes to axes5
    imshow(aprox_imag)
    title(['Compresie cu k=' num2str(ranks)])
    handles.aprox_imag=aprox_imag;
    guidata(hObject,handles)
    

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
aprox_imag=handles.aprox_imag;
imwrite(aprox_imag,'newImage.jpg','jpg','Comment','My JPEG file')
dir_original   = dir('ha.jpg');
bytes_original   = dir_original(1).bytes;
dir_compr   = dir('newImage.jpg');
bytes_compr   = dir_compr(1).bytes;
%cr = bytes_compr/bytes_original*100;
m=handles.m;
n=handles.n;
k=handles.ranks;
cr=(m*n)/(k*(m+n+1));
mymessage = sprintf('%s%s%s','Rata de compresie: ',num2str(cr), '%');

set(handles.edit1,'String',num2str(mymessage))


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
set(hObject,'String', 'Rata de compresie')

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String', 'Rata de compresie')

% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4
