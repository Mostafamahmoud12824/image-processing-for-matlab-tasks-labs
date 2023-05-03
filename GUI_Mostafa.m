function varargout = GUI_Mostafa(varargin)
% GUI_MOSTAFA MATLAB code for GUI_Mostafa.fig
%      GUI_MOSTAFA, by itself, creates a new GUI_MOSTAFA or raises the existing
%      singleton*.
%
%      H = GUI_MOSTAFA returns the handle to a new GUI_MOSTAFA or the handle to
%      the existing singleton*.
%
%      GUI_MOSTAFA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_MOSTAFA.M with the given input arguments.
%
%      GUI_MOSTAFA('Property','Value',...) creates a new GUI_MOSTAFA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Mostafa_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Mostafa_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Mostafa

% Last Modified by GUIDE v2.5 06-May-2022 00:45:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Mostafa_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Mostafa_OutputFcn, ...
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


% --- Executes just before GUI_Mostafa is made visible.
function GUI_Mostafa_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Mostafa (see VARARGIN)

% Choose default command line output for GUI_Mostafa
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Mostafa wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Mostafa_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in histogram_rgb.
function histogram_rgb_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_rgb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=rgb2gray(input);
axes(handles.axes3)
imhist(input)

% --- Executes on button press in histogram_gray.
function histogram_gray_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
axes(handles.axes3)
imhist(input)

% --- Executes on button press in complement.
function complement_Callback(hObject, eventdata, handles)
% hObject    handle to complement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
IM2=imcomplement(a);
axes(handles.axes3);
imshow(IM2);

% --- Executes on button press in Red.
function Red_Callback(hObject, eventdata, handles)
% hObject    handle to Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
red=a;
red(:,:,2:3)=0;
setappdata(0,'filename',red);
setappdata(0,'imrotation',red);
axes(handles.axes3);
imshow(red)

% --- Executes on button press in Green.
function Green_Callback(hObject, eventdata, handles)
% hObject    handle to Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
green=a;
green(:,:,1)=0;
green(:,:,3)=0;
setappdata(0,'filename',green);
setappdata(0,'imrotation',green);
axes(handles.axes3);
imshow(green)


% --- Executes on button press in Blue.
function Blue_Callback(hObject, eventdata, handles)
% hObject    handle to Blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
blue=a;
blue(:,:,1)=0;
blue(:,:,2)=0;
setappdata(0,'filename',blue);
setappdata(0,'imrotation',blue);
axes(handles.axes3);
imshow(blue)

% --- Executes on button press in Rotate.
function Rotate_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = handles.a;

if isempty(check)
    check = 1; 
    rotate = imrotate(b,90);
else
    check = 2; 
    rotate = imrotate(b,270);
end

axes(handles.axes1);
imshow(rotate);


% --- Executes on button press in Equalaization.
function Equalaization_Callback(hObject, eventdata, handles)
% hObject    handle to Equalaization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
eq=histeq(a);
axes(handles.axes3); 
imshow(eq)


% --- Executes on button press in Resize.
function Resize_Callback(hObject, eventdata, handles)
% hObject    handle to Resize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
rz=imresize(a,0.5);
axes(handles.axes3); 
imshow(rz)


% --- Executes on button press in salt_pepper.
function salt_pepper_Callback(hObject, eventdata, handles)
% hObject    handle to salt_pepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
noise=imnoise(a,'salt & pepper');
axes(handles.axes3); 
imshow(noise)




% --- Executes on button press in LPS_filter.
function LPS_filter_Callback(hObject, eventdata, handles)
% hObject    handle to LPS_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
noise=imnoise(a,'salt & pepper');
a3=fspecial('average',[7,7]);
t_sp_a3=filter2(a3,noise);
axes(handles.axes3); 
imshow(t_sp_a3/255)


% --- Executes on button press in Gaussian.
function Gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
noise=imnoise(a,'gaussian');
axes(handles.axes3); 
imshow(noise)


% --- Executes on button press in periodic_noise.
function periodic_noise_Callback(hObject, eventdata, handles)
% hObject    handle to periodic_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
s=size(a);
[x,y]=meshgrid(1:s(1),1:s(2));
p=sin(x/3+y/5)+1;
noise=(im2double(a)+p/2)/2;
axes(handles.axes3); 
imshow(noise)


% --- Executes on button press in adjust_image.
function adjust_image_Callback(hObject, eventdata, handles)
% hObject    handle to adjust_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
adjust=imadjust(a);
axes(handles.axes3); 
imshow(adjust)


% --- Executes on button press in Flip.
function Flip_Callback(hObject, eventdata, handles)
% hObject    handle to Flip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=getappdata(0,'a');
i2=flipdim(i,2);
axes(handles.axes3); 
imshow(i2)


% --- Executes on button press in Browsimage .
function Browsimage_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile()
filename=a;
setappdata(0,'filename',filename);
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)
setappdata(0,'filename',a);
plot(handles.axes1,'a')

% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=rgb2gray(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in Black&white.
function bw_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_bw=im2bw(a,.57);
axes(handles.axes3);
imshow(a_bw)
setappdata(0,'filename',a_bw);


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(a);


% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('thanks for using image processing tool')
pause(1)
close();
close();
