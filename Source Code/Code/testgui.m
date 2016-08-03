function varargout = testgui(varargin)
% TESTGUI MATLAB code for testgui.fig
%      TESTGUI, by itself, creates a new TESTGUI or raises the existing
%      singleton*.
%
%      H = TESTGUI returns the handle to a new TESTGUI or the handle to
%      the existing singleton*.
%
%      TESTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTGUI.M with the given input arguments.
%
%      TESTGUI('Property','Value',...) creates a new TESTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before testgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to testgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help testgui

% Last Modified by GUIDE v2.5 17-Nov-2015 19:09:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @testgui_OpeningFcn, ...
                   'gui_OutputFcn',  @testgui_OutputFcn, ...
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


% --- Executes just before testgui is made visible.
function testgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to testgui (see VARARGIN)

% Choose default command line output for testgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes testgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = testgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%Display input image
hello= uigetfile('*.jpg','Select the Braille IMAGE file');
h= waitbar(0,'Please wait...');
steps = 1000;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h) 
A=[1 0 0 0 0 0 ];
B=[1 1 0 0 0 0 ];
C=[1 0 0 1 0 0 ];
D=[1 0 0 1 1 0 ];
E=[1 0 0 0 1 0 ];
F=[1 1 0 1 0 0 ];
G=[1 1 0 1 1 0 ];
H=[1 1 0 0 1 0 ];
I=[0 1 0 1 0 0 ];
J=[0 1 0 1 1 0 ];
K=[1 0 1 0 0 0 ];
L=[1 1 1 0 0 0 ];
M=[1 0 1 1 0 0 ];
N=[1 0 1 1 1 0 ];
O=[1 0 1 0 1 0 ];
P=[1 1 1 1 0 0 ];
Q=[1 1 1 1 1 0 ];
R=[1 1 1 0 1 0 ];
S=[0 1 1 1 0 0 ];
T=[0 1 1 1 1 0 ];
U=[1 0 1 0 0 1 ];
V=[1 1 1 0 0 1 ];
W=[0 1 0 1 1 1 ];
X=[1 0 1 1 0 1 ];
Y=[1 0 1 1 1 1 ];
Z=[1 0 1 0 1 1 ];
space=[0 0 0 0 0 0];

x=[];
f=0;
g=0;
h=0;
i=0;
j=0;
k=-90;
l=1;
b = imread(hello);
figure,imshow(b),title('Original Image'),
%subplot(1,2,1),subimage(b)
%display white dotted image
b1=immultiply(b,1.2);%Increases contrast
figure,imshow(b1),title('Contrast Stretching'),
%Display image with grey background
b2=rgb2gray(b1);
figure,imshow(b2),title('GreyScale Image'),
%display image with black background
b3=imadjust(b2);
figure,imshow(b3),title('Binary Image'),
%display image with black background and reduced noise
level=graythresh(b3);
b4=im2bw(b3,level);
b4=bwareaopen(b4,50);
figure,imshow(b4),title('After Removal of Noise'),
b41=imcomplement(b4);
figure,imshow(b41),title('Complemented Image'),
b5 = imfill(b41,'holes');
figure, imshow(b5),title('Image with Filled Holes'),
t1 = fopen('C:\Users\SANKET\Desktop\MATLAB\text1.txt','w+');
for f = 1:90:851
    j=0;
    k=k+90;
for g = 1:60:629
    l=1;
for h = 1:2
for i = 1:3
b6 = imcrop(b5,[j k 30 30]);
%figure,imshow(b6),
x(l)=bweuler(b6);
l=l+1;                                                                                                                                  
k=k+30;
end
k=k-90;
j=j+30;
end
j=j+18;
%x=[0 0 0 0 0 0];
if(isequal(x,A))
    fprintf('Value is A \n' );
    fprintf(t1,'A' );
elseif(isequal(x,B))
    fprintf('Value is B \n' );
    fprintf(t1,'B' );
elseif(isequal(x,C))
    fprintf('Value is C \n' );
    fprintf(t1,'C' );
elseif(isequal(x,D))
    fprintf('Value is D \n' );
    fprintf(t1,'D' );
elseif(isequal(x,E))
    fprintf('Value is E \n' );
    fprintf(t1,'E' );
elseif(isequal(x,F))
    fprintf('Value is F \n' );
    fprintf(t1,'F' );
elseif(isequal(x,G))
    fprintf('Value is G \n' );
    fprintf(t1,'G' );
elseif(isequal(x,H))
    fprintf('Value is H \n' );
    fprintf(t1,'H' );
elseif(isequal(x,I))
    fprintf('Value is I \n' );
    fprintf(t1,'I' );
elseif(isequal(x,J))
    fprintf('Value is J \n' );
    fprintf(t1,'J' );
elseif(isequal(x,K))
    fprintf('Value is K \n' );
    fprintf(t1,'K' );
elseif(isequal(x,L))
    fprintf('Value is L \n' );
    fprintf(t1,'L' );
elseif(isequal(x,M))
    fprintf('Value is M \n' );
    fprintf(t1,'M' );
elseif(isequal(x,N))
    fprintf('Value is N \n' );
    fprintf(t1,'N' );
elseif(isequal(x,O))
    fprintf('Value is O \n' );
    fprintf(t1,'O' );
elseif(isequal(x,P))
    fprintf('Value is P \n' );
    fprintf(t1,'P' );
elseif(isequal(x,Q))
    fprintf('Value is Q \n' );
    fprintf(t1,'Q' );
elseif(isequal(x,R))
    fprintf('Value is R \n' );
    fprintf(t1,'R' );
elseif(isequal(x,S))
    fprintf('Value is S \n' );
    fprintf(t1,'S' );
elseif(isequal(x,T))
    fprintf('Value is T \n' );
    fprintf(t1,'T' );
elseif(isequal(x,U))
    fprintf('Value is U \n' );
    fprintf(t1,'U' );
elseif(isequal(x,V))
    fprintf('Value is V \n' );
    fprintf(t1,'V' );
elseif(isequal(x,W))
    fprintf('Value is W \n' );
    fprintf(t1,'W' );
elseif(isequal(x,X))
    fprintf('Value is X \n' );
    fprintf(t1,'X' );
elseif(isequal(x,Y))
    fprintf('Value is Y \n' );
    fprintf(t1,'Y' );
elseif(isequal(x,Z))
    fprintf('Value is Z \n' );
    fprintf(t1,'Z' );
elseif(isequal(x,space))
    fprintf('Value is  \n' );
    fprintf(t1,' ' );
end
end
k=k+36;
fprintf('Value is  \n' );
fprintf(t1,'\r\n' );
end
fclose(t1);
data1 = importdata('text1.txt','') %// Import all text as a cell array with each cell for each line
set(handles.edit2, 'Max', 2); %// Enable multi-line string input to the editbox
set(handles.edit2,'String',data1) %//  Put the text from text file into the editbox using `String` property
set(handles.edit2,'HorizontalAlignment','left') %// Align the text left-based, as it looks good maybe, but feel free to change it to center or right
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text1, 'String', input_folder_name) 
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fid = fopen('text1.txt');
tline = fgets(fid);
while ischar(tline)
    tts(tline);
    tline = fgets(fid);
end

fclose(fid);



% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton3.
function pushbutton3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
