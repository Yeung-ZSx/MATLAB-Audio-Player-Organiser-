function varargout = Music_Player(varargin)
% MUSIC_PLAYER MATLAB code for Music_Player.fig
%      MUSIC_PLAYER, by itself, creates a new MUSIC_PLAYER or raises the existing
%      singleton*.
%
%      H = MUSIC_PLAYER returns the handle to a new MUSIC_PLAYER or the handle to
%      the existing singleton*.
%
%      MUSIC_PLAYER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MUSIC_PLAYER.M with the given input arguments.
%
%      MUSIC_PLAYER('Property','Value',...) creates a new MUSIC_PLAYER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Music_Player_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Music_Player_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Music_Player

<<<<<<< HEAD
% Last Modified by GUIDE v2.5 01-May-2017 00:16:47
=======
% Last Modified by GUIDE v2.5 30-Apr-2017 18:27:12
>>>>>>> origin/master

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Music_Player_OpeningFcn, ...
                   'gui_OutputFcn',  @Music_Player_OutputFcn, ...
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

% --- Executes just before Music_Player is made visible.
function Music_Player_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Music_Player (see VARARGIN)

% Choose default command line output for Music_Player
handles.output = hObject;

% Update handles structure
cellMaster = {};
Songs = {};
PlayList = {}; 
cellMaster{1} = Songs;
cellMaster{2} = PlayList;
handles.data = cellMaster;
guidata(hObject, handles);


% UIWAIT makes Music_Player wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Music_Player_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function Add_Callback(hObject, eventdata, handles)
% hObject    handle to Add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FilterSpec = {'*.wav'; '*.aiff'; '*.mp3'; '*.mp4'; '*.acc'; '*.ogg'};
[FileName,PathName,FilterIndex] = uigetfile(FilterSpec, 'Select the Music files', 'MultiSelect', 'on')
%call list object
lst_Music = findobj('Tag', 'lst_Music');
set(lst_Music,'String',FileName)%display the filename as a string in the Listbox

Songs = handles.data{1};
if (iscell(FileName ))
    for i = 1:max(size(FileName))
        Songs{i,1} = FileName(i);
        Songs{i,2} = PathName;
    end
else
   Songs{1,1} = {FileName};
   Songs{1,2} = PathName;
end

Songs

handles.data{1} = Songs;
guidata(hObject,handles);

% --- Executes on selection change in lst_Music.
function lst_Music_Callback(hObject, eventdata, handles)
% hObject    handle to lst_Music (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lst_Music contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lst_Music


% --- Executes during object creation, after setting all properties.
function lst_Music_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lst_NewPlaylist.
function lst_NewPlaylist_Callback(hObject, eventdata, handles)
% hObject    handle to lst_NewPlaylist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lst_NewPlaylist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lst_NewPlaylist


% --- Executes during object creation, after setting all properties.
function lst_NewPlaylist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lst_NewPlaylist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in btn_Add.
function btn_Add_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
list_entry = cellstr(get(handles.lst_Music,'String'));
index_selected = get(handles.lst_Music,'Value');  %changed line
choice_lst_Music = list_entry(index_selected);
update_lst_NewPlaylist = cellstr(get(handles.lst_NewPlaylist, 'String'));
newmenu = [update_lst_NewPlaylist;choice_lst_Music];
set(handles.lst_NewPlaylist,'String', newmenu);


% --- Executes on button press in btn_Save.
function btn_Save_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PlayList = handles.data{2};

edtxtNewPlayList = findobj('Tag', 'txt_Name');%'findobj' to get the whole object
listName = get(edtxtNewPlayList,'String');%get the data from the object
lbNewPlaylist = findobj('Tag', 'lst_NewPlaylist');
listSong = get(lbNewPlaylist, 'String');

ind = size(PlayList,1) + 1;

PlayList{ind,1} = listName;
PlayList{ind,2} = listSong;

handles.data{2} = PlayList; %update handles.data storage
guidata(hObject,handles); % put the handles back to master

PlayList

%Copy Names of playlist into Listbox
names = PlayList(:,1); %Gets all the first colum data on the cell array Playlist
list_listNames = findobj('Tag', 'Playlist');%'findobj' to get the whole object
set(list_listNames,'String',names);%Display Playlist names in the Listbox



function txt_Name_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Name as text
%        str2double(get(hObject,'String')) returns contents of txt_Name as a double


% --- Executes during object creation, after setting all properties.
function txt_Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Playlist.
function Playlist_Callback(hObject, eventdata, handles)
% hObject    handle to Playlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Playlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Playlist


% --- Executes during object creation, after setting all properties.
function Playlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Playlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_Remove.
function btn_Remove_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rmvList = handles.lst_NewPlaylist;
rmvindexed = get(rmvList,'value');
newPlace = rmvindexed(1)-1;
if (newPlace <=0) newPlace = 1; end
rmvnames = get(rmvList,'String');
if ~isempty(rmvnames)
rmvnames(rmvindexed) = [];
set(rmvList,'String',rmvnames,'value', newPlace);
end 


% --- Executes on button press in btnPlay.
function btnPlay_Callback(hObject, eventdata, handles)
% hObject    handle to btnPlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% allstrings = cellstr( get(handles.lst_Music, 'String') );
% curvalue = get(handles.lst_Music, 'Value');
% thisstring = allstrings{curvalue};
% [q, Fs] = audioread(thisstring);

SongList = findobj('Tag', 'lst_Music');%'findobj' to get the whole object
SongIndex = get(SongList,'Value');%get the data from the object

Songs = handles.data{1};

name = Songs{SongIndex,1};
path = Songs{SongIndex,2};

pathname = char(strcat(path,name));
handles.pathname = pathname;
guidata(hObject,handles)
pathname

[y,Fs] = audioread(pathname);
% sound(y,Fs);
global y_matrix;
y_matrix = y;
global Fs_matrix;
Fs_matrix = Fs;


global audio;
audio = audioplayer (y_matrix, Fs_matrix);
cla reset
plotting(y, Fs, 'b', handles);

handles.pathname = 0;
guidata(hObject,handles)
play(audio);


% --- Executes on button press in btnStop.
function btnStop_Callback(hObject, eventdata, handles)
% hObject    handle to btnStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global audio;
stop(audio)
handles.pathname = 0;
guidata(hObject,handles)


% --- Executes on button press in btnPause.
function btnPause_Callback(hObject, eventdata, handles)
% hObject    handle to btnPause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global audio;
if handles.pathname == 0;
    pause(audio);
else
    handles.pathname == 1;

end
handles.pathname = 1;
guidata(hObject,handles)


% --- Executes on button press in btnResume.
function btnResume_Callback(hObject, eventdata, handles)
% hObject    handle to btnResume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global audio;
if handles.pathname == 1
    resume(audio);
end
handles.pathname = 0;
guidata(hObject,handles)


% --- Executes on slider movement.
function sliderVolume_Callback(hObject, eventdata, handles)
% hObject    handle to sliderVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global y_matrix;
global Fs_matrix;
global audio;

slider = get(hObject,'value');
if slider == 25
    x = y_matrix; % Same volume
    audio = audioplayer(x, Fs_matrix);
<<<<<<< HEAD
    play(audio,[(get(audio, 'SampleRate')*1)]);
else
    x = y_matrix*slider; % Max volume
    audio = audioplayer(x, Fs_matrix);
    play(audio,[(get(audio,'SampleRate')*1)]);
end
guidata(hObject,handles)
=======
    play(audio,[(get(audio,'SampleRate')*1)]);
elseif slider == 0
    x = y_matrix/5; % Decrease volume
    audio = audioplayer(x, Fs_matrix);
    play(audio,[(get(audio, 'SampleRate')*1)]);
% elseif slider == 0
%     x = y_matrix*0; % Mute volume
%     audio = audioplayer(x, Fs_matrix);
%     play(audio,[1 (get(audio, 'SampleRate')*3)]);
guidata(hObject,handles)
end
>>>>>>> origin/master

% --- Executes during object creation, after setting all properties.
function sliderVolume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'min', 0);
set(hObject, 'max', 50);
set(hObject, 'value', 1);
    
   
<<<<<<< HEAD



function edtWahFs_Callback(hObject, eventdata, handles)
% hObject    handle to edtWahFs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtWahFs as text
%        str2double(get(hObject,'String')) returns contents of edtWahFs as a double


% --- Executes during object creation, after setting all properties.
function edtWahFs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtWahFs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtWahMax_Callback(hObject, eventdata, handles)
% hObject    handle to edtWahMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtWahMax as text
%        str2double(get(hObject,'String')) returns contents of edtWahMax as a double


% --- Executes during object creation, after setting all properties.
function edtWahMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtWahMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtWahMin_Callback(hObject, eventdata, handles)
% hObject    handle to edtWahMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtWahMin as text
%        str2double(get(hObject,'String')) returns contents of edtWahMin as a double


% --- Executes during object creation, after setting all properties.
function edtWahMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtWahMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnWaheffect.
function btnWaheffect_Callback(hObject, eventdata, handles)
% hObject    handle to btnWaheffect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% % % % % global audio;
% % % % % global y_matrix;
% % % % % global Fs_matrix;
% % % % % global newY;
% % % % % %%%%%%
min = get(handles.edtWahMin, 'String')
max = get(handles.edtWahMax, 'String')
Fw = get(handles.edtWahFs, 'String')
global y_matrix;
global Fs_matrix;
global audio;
[yb, input_fs] = wahwah_effect(y_matrix, Fs_matrix, 0.05, str2double(min), str2double(max), str2double(Fw));
y_matrix = yb;
Fs_matrix = input_fs;
audio = audioplayer (y_matrix, Fs_matrix);
play(audio);
plotting(y_matrix, Fs_matrix, 'r', handles);


% --- Executes on slider movement.
function sliderWah_freq_Callback(hObject, eventdata, handles)
% hObject    handle to sliderWah_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderWah_freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderWah_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderWah_max_Callback(hObject, eventdata, handles)
% hObject    handle to sliderWah_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderWah_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderWah_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderWah_min_Callback(hObject, eventdata, handles)
% hObject    handle to sliderWah_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderWah_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderWah_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btnPlayList.
function btnPlayList_Callback(hObject, eventdata, handles)
% hObject    handle to btnPlayList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

SongsPath = handles.data{1}; %song name, path
PlayList = handles.data{2}; %list names
list_listNames = findobj('Tag', 'Playlist');%'findobj' to get the whole object
selectedListIndex = get(list_listNames,'Value');
songs = PlayList{selectedListIndex,2};
newY = [];
%merge all the songs in one song
for i = 1:size(songs,1)
    for j = 1:size(SongsPath(:,1), 1)
        songs(i)
        SongsPath{j, 1}
        strcmp(songs(i),SongsPath{j, 1})
        if strcmp(songs(i),SongsPath{j, 1}) == 1
            name = SongsPath{j,1};
            path = SongsPath{j,2};
            pathname = char(strcat(path,name));
            [y, fs] = audioread(pathname);
            newY = [newY;y];
        end
    end
end


global audio;
global y_matrix;
global Fs_matrix;
y_matrix = newY;
Fs_matrix = fs;
audio = audioplayer (y_matrix, Fs_matrix);
play(audio);
=======
>>>>>>> origin/master
