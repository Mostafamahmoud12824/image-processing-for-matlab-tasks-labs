function varargout = final_project(varargin)
% FINAL_PROJECT MATLAB code for final_project.fig
%      FINAL_PROJECT, by itself, creates a new FINAL_PROJECT or raises the existing
%      singleton*.
%
%      H = FINAL_PROJECT returns the handle to a new FINAL_PROJECT or the handle to
%      the existing singleton*.
%
%      FINAL_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_PROJECT.M with the given input arguments.
%
%      FINAL_PROJECT('Property','Value',...) creates a new FINAL_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final_project

% Last Modified by GUIDE v2.5 25-May-2022 14:18:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_project_OpeningFcn, ...
                   'gui_OutputFcn',  @final_project_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    %% 
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before final_project is made visible.
function final_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final_project (see VARARGIN)

% Choose default command line output for final_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final_project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=Histogram(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
bar(a_gray);

% --- Executes on button press in Direct_Resize.
function Direct_Resize_Callback(hObject, eventdata, handles)
% hObject    handle to Direct_Resize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter numsize'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=direct_resize(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);



% --- Executes on button press in salt_pepper.
function salt_pepper_Callback(hObject, eventdata, handles)
% hObject    handle to salt_pepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=imnoise(a,'salt & pepper',0.02);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in max_filter.
function max_filter_Callback(hObject, eventdata, handles)
% hObject    handle to max_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter nunmask'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=filter_max(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)



% --- Executes on button press in Min_filter.
function Min_filter_Callback(hObject, eventdata, handles)
% hObject    handle to Min_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter nunmask'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=filter_min(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in Contrast.
function Contrast_Callback(hObject, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'newmin','newmax'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
y=str2num(answer{2});
a_gray=Contrast_Gray(a,x,y);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in Mean_filter.
function Mean_filter_Callback(hObject, eventdata, handles)
% hObject    handle to Mean_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter nunmask'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=filter_mean(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)

% --- Executes on button press in Quantization.
function Quantization_Callback(hObject, eventdata, handles)
% hObject    handle to Quantization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter k'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=Quentzation(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in Mid_point_filter.
function Mid_point_filter_Callback(hObject, eventdata, handles)
% hObject    handle to Mid_point_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=Mid_point_Filter(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in histogram_equalizaition.
function histogram_equalizaition_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_equalizaition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
[a_gray,colr]=HistoEqualization(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in Reverse_Mapping.
function Reverse_Mapping_Callback(hObject, eventdata, handles)
% hObject    handle to Reverse_Mapping (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter multiple of width','enter multiple of heigth'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
y=str2num(answer{2});
a_gray=revers1D(a,x,y);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in power_low.
function power_low_Callback(hObject, eventdata, handles)
% hObject    handle to power_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter gama'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=Power_Law(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in Brightness.
function Brightness_Callback(hObject, eventdata, handles)
% hObject    handle to Brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter offsent'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=Brightness(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);

% --- Executes on button press in Sub_image.
function Sub_image_Callback(hObject, eventdata, handles)
% hObject    handle to Sub_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=getappdata(0,'b');
a_gray=sub_Images(a,b);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);



% --- Executes on button press in sharpening.
function sharpening_Callback(hObject, eventdata, handles)
% hObject    handle to sharpening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=sharp_detect(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in Unsharpening.
function Unsharpening_Callback(hObject, eventdata, handles)
% hObject    handle to Unsharpening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=UnSharpen(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in Histogram_matching.
function Histogram_matching_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram_matching (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=getappdata(0,'b');
[a_gray,col1]=HistoEqualization(a);
[b_gray,col2]=HistoEqualization(b);
a_gray2=HistoMatch(a,col1,col2);
setappdata(0,'filename',a_gray2);
axes(handles.axes3); 
imshow(a_gray2);


% --- Executes on button press in Edge_Detection.
function Edge_Detection_Callback(hObject, eventdata, handles)
% hObject    handle to Edge_Detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=edge_detect(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);



% --- Executes on button press in Median_filter.
function Median_filter_Callback(hObject, eventdata, handles)
% hObject    handle to Median_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter nunmask'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=filter_median(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);

% --- Executes on button press in Ideal_HPF.
function Ideal_HPF_Callback(hObject, eventdata, handles)
% hObject    handle to Ideal_HPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter D0'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=ideal_HPF(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in Ideal_LPF.
function Ideal_LPF_Callback(hObject, eventdata, handles)
% hObject    handle to Ideal_LPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter D0'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=ideal_LPF(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in Gaussian_HPF.
function Gaussian_HPF_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian_HPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter D0'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=gaussian_HPF(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in Gaussian_LPF.
function Gaussian_LPF_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian_LPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter D0'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=gaussian_LPF(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);

% --- Executes on button press in Weighted_gaussian.
function Weighted_gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to Weighted_gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter segma'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=filter_Weighted_Guassian1(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Butterworth_HPF.
function Butterworth_HPF_Callback(hObject, eventdata, handles)
% hObject    handle to Butterworth_HPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter D0','enter n'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
y=str2num(answer{2});
a_gray=butterworth_HPF(a,x,y);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);




% --- Executes on button press in Butterworth_LPF.
function Butterworth_LPF_Callback(hObject, eventdata, handles)
% hObject    handle to Butterworth_LPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter D0','enter n'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
y=str2num(answer{2});
a_gray=butterworth_LPF(a,x,y);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);

% --- Executes on button press in Image_Negative.
function Image_Negative_Callback(hObject, eventdata, handles)
% hObject    handle to Image_Negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=ImageNegative(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in Add_image.
function Add_image_Callback(hObject, eventdata, handles)
% hObject    handle to Add_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=getappdata(0,'b');
a_gray=add_Images(a,b);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in Brows_image1.
function Brows_image1_Callback(hObject, eventdata, handles)
% hObject    handle to Brows_image1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile({'*.jpg','*.png'})
filename=a;
setappdata(0,'filename',filename);
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)
setappdata(0,'filename',a);
plot(handles.axes1,'a')


% --- Executes on button press in Brows_image2.
function Brows_image2_Callback(hObject, eventdata, handles)
% hObject    handle to Brows_image2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b=uigetfile({'*.jpg','*.png'})
filename=b;
setappdata(0,'filename',filename);
b=imread(b);
axes(handles.axes2);
imshow(b);
setappdata(0,'b',b)
setappdata(0,'filename',b);
plot(handles.axes5,'b')


% --- Executes on button press in Gray_scale.
function Gray_scale_Callback(hObject, eventdata, handles)
% hObject    handle to Gray_scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=GrayScaleDes(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(a);




% --- Executes on button press in Exite.
function Exite_Callback(hObject, eventdata, handles)
% hObject    handle to Exite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('thanks for using image processing tool')
pause(1)
close();
close();


% --- Executes on button press in Black_White.
function Black_White_Callback(hObject, eventdata, handles)
% hObject    handle to Black_White (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_bw=im2bw(a,.57);
axes(handles.axes3);
imshow(a_bw)
setappdata(0,'filename',a_bw);


% --- Executes on button press in Gaussian.
function Gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=imnoise(Image,'gaussian',0.07);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


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
imshow(t_sp_a3/255);

% --- Executes on button press in Periodic_noise.
function Periodic_noise_Callback(hObject, eventdata, handles)
% hObject    handle to Periodic_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
s=size(a);
[x,y]=meshgrid(1:s(1),1:s(2));
p=sin(x/3+y/5)+1;
noise=(im2double(a)+p/2)/2;
axes(handles.axes3); 
imshow(noise);


% --- Executes on button press in Flip_filter.
function Flip_filter_Callback(hObject, eventdata, handles)
% hObject    handle to Flip_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=getappdata(0,'a');
i2=flipdim(i,2);
axes(handles.axes3); 
imshow(i2);

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


% --- Executes on button press in average_gray.
function average_gray_Callback(hObject, eventdata, handles)
% hObject    handle to average_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=GrayScaleAvr(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in saturation.
function saturation_Callback(hObject, eventdata, handles)
% hObject    handle to saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=GrayScaleDes(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);
