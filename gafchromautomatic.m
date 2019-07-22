function varargout = gafchromautomatic(varargin)
%GAFCHROMAUTOMATIC MATLAB code file for gafchromautomatic.fig
%      GAFCHROMAUTOMATIC, by itself, creates a new GAFCHROMAUTOMATIC or raises the existing
%      singleton*.
%
%      H = GAFCHROMAUTOMATIC returns the handle to a new GAFCHROMAUTOMATIC or the handle to
%      the existing singleton*.
%
%      GAFCHROMAUTOMATIC('Property','Value',...) creates a new GAFCHROMAUTOMATIC using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to gafchromautomatic_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GAFCHROMAUTOMATIC('CALLBACK') and GAFCHROMAUTOMATIC('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GAFCHROMAUTOMATIC.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gafchromautomatic

% Last Modified by GUIDE v2.5 22-Jul-2019 11:51:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gafchromautomatic_OpeningFcn, ...
                   'gui_OutputFcn',  @gafchromautomatic_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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



% --- Outputs from this function are returned to the command line.
function varargout = gafchromautomatic_OutputFcn(hObject, eventdata, handles)
% Get default command line output from handles structure
varargout{1} = handles.output;





%% GUI INITIALIZATION %%
% --- Executes just before gafchromautomatic is made visible.
function gafchromautomatic_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for gafchromautomatic
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function edit_dpi_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit_sourceDistance_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function popupmenu_blurType_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit_blurRadius_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit_avgR_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function popupmenu_RGB_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during x slider creation, after setting all properties.
function slider_vertexX_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during x vertex edit creation, after setting all properties.
function edit_vertexX_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during y slider creation, after setting all properties.
function slider_vertexY_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during y vertex edit creation, after setting all properties.
function edit_vertexY_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function slider_radius_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during radius edit creation, after setting all properties.
function edit_radius_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during tolerance slider creation, after setting all properties.
function slider_tol_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during tolerance edit creation, after setting all properties.
function edit_tol_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during angular object creation, after setting all properties.
function slider_angle_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during object creation, after setting all properties.
function edit_angle_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





%% GUI CALLBACKS %%
% --- Executes on "File" click in menu.
function menu_file_Callback(hObject, eventdata, handles)



% --- Executes on "File->Open TIFF" click in menu.
function menu_file_opentiff_Callback(hObject, eventdata, handles)
% Acquire global variables
global Film_Img Film_Area Film_Area_Prev Film_FilePath Film_FileName rect;

% If no return address, begin in code's directory
if isequal(Film_FilePath, 0); Film_FilePath = "./"; end

% Image Single-selection, set as cell array
[Film_FileName, Film_FilePath, Img_Index] = uigetfile('*.tif', ...
    'Choose image file', 'MultiSelect', 'off', Film_FilePath);


% If successful selection
if ~isequal(Film_FileName, 0)
    Film_FileName = strcat(Film_FilePath, Film_FileName);

    % Check filenames for tiff-type extension
    validFile = 1;
    [dirPath, fileBaseName, extType] = fileparts(Film_FileName);
    if (strcmpi(extType, '.tif') == 0)
        % Quit loop
        validFile = 0;
        return
    else
        Film_FileName = strcat(dirPath, '/', fileBaseName, extType);
    end
    
    % If file is tiff
    if ( validFile )
        % Display image on axes 
        Film_Img = imread(Film_FileName); % Or only this one
        imshow(Film_Img, 'Parent', handles.axes_image);
        
        % Preset selection rectangle, selection area as whole original image,
        % and previous image view as whole original image
        rect = 0; Film_Area = Film_Img;
        Film_Area_Prev = Film_Area;
    end
end
guidata(hObject, handles);



% --- Executes on "File->Save isotropy outputs" click in menu.
function menu_file_save_isotropy_Callback(hObject, eventdata, handles)
% Acquire vars
global I_r I_avg;
dphi = 1;
phi=1:dphi:360;

% Create data point for each angle
I_numpoints = max(phi) - min(phi) + 1; % angular iterations including the zeroth

% Get date and time for filename
dateandtime = datestr(now, 'yyyy-mm-dd_HH-MM-SS');
outputODfilename = strcat('iso_', dateandtime, '.csv');
fileODout = fopen(outputODfilename, 'w');

% Loop through whole angle for output and close file
fprintf(fileODout, 'phi I(phi) I_avg(phi)\n');
for i_phi=1:I_numpoints
    % Write phi [deg], I(r,phi) and I_avg(r,phi) [a.u.] to text file
    % for given r +- tol as "i_phi, I_r, I_avg"
    fprintf(fileODout, '%d %3d %3d\n', i_phi, I_r(i_phi), I_avg(i_phi));
end
fclose(fileODout);



% --- Executes on "File->Save anisotropy outputs" click in menu.
function menu_file_save_anisotropy_Callback(hObject, eventdata, handles)
% Acquire vars
global Film_FileName Film_Area theta Xfit;
sourceDistance = str2num(get(handles.edit_sourceDistance, 'String'));
blurList = get(handles.popupmenu_blurType, 'String');
  blurType = blurList{get(handles.popupmenu_blurType, 'Value')};
blurRadius = str2double(get(handles.edit_blurRadius, 'String'));
%rgbList = get(handles.popupmenu_RGB, 'String');
%  rgb = rgbList{get(handles.popupmenu_RGB, 'Value')};
rgb = 'Red';
if ( strcmp(rgb, 'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end

% Filter film ROI
if ( strcmp(blurType, 'None') )
    filtered_Film_Area = Film_Area;
elseif ( strcmp(blurType, 'Gaussian') )
    % Define gaussian blur kernel, apply to ROI and preview
    blurSigma = 0.15*blurRadius + 0.35; % based on openCV.gaussianBlur
    filtered_Film_Area = imgaussfilt(Film_Area, blurSigma);
    %blurKernel = fspecial('gaussian', [blurRadius blurRadius]);
    %filtered_Film_Area = imfilter(Film_Area, blurKernel);
elseif ( strcmp(blurType, 'Mean') )
    % Define mean blur kernel, apply to ROI and preview
    blurKernel = fspecial('average', [1 blurRadius]);
    filtered_Film_Area = imfilter(Film_Area, blurKernel);
end

% Get date and time for filename
dateandtime = datestr(now, 'yyyy-mm-dd_HH-MM-SS');
outputODfilename = strcat(Film_FileName, '_aniso_', dateandtime, '.csv');

% Image Single-selection, set as cell array
[outputODfilename, outputODfilepath] = uiputfile('*.csv', ...
    'Save output file location', outputODfilename);

% Write if non-empty save file name
if ~isequal(outputODfilename, 0)
    outputODfilename = strcat(outputODfilepath, outputODfilename);
    fileODout = fopen(outputODfilename, 'w');

    % Loop through all rows (reversed) for output and close file
    Film_Area_Rows = length(filtered_Film_Area(:, 1, rgb_i));
    fprintf(fileODout, 'R [cm], theta [deg], I [a.u.]\n');
    for y=1:Film_Area_Rows
        fprintf(fileODout, '%d, %2.2f, %3d\n', sourceDistance, theta(y), filtered_Film_Area(y, round(Xfit(y)), rgb_i));
    end
    fclose(fileODout);
end



function edit_dpi_Callback(hObject, eventdata, handles)
global dpi
dpi = str2double(get(handles.edit_dpi, 'String'));



function edit_sourceDistance_Callback(hObject, eventdata, handles)



% --- Executes on selection change in popupmenu_blurType.
function popupmenu_blurType_Callback(hObject, eventdata, handles)



function edit_blurRadius_Callback(hObject, eventdata, handles)



function edit_avgR_Callback(hObject, eventdata, handles)



% --- Executes on selection change in popupmenu_RGB.
function popupmenu_RGB_Callback(hObject, eventdata, handles)



% --- Executes on button press in button_zoom.
function button_zoom_Callback(hObject, eventdata, handles)
% Acquire global variables
global Film_Area_Prev Film_Area Film_FileName rect;

% If filename string is empty, assume no image
if ~isempty(Film_FileName)

    % Drag rectangle across desired area within boundaries of figure
    if ~( rect==0 ) Film_Area_Prev = Film_Area; end % Unzoomed
    
    % Continuously attempt region selection until "good" selection
    try 
        rect = getrect(handles.axes_image);
        xmin = round(rect(1)); ymin = round(rect(2)); width = round(rect(3)); height = round(rect(4));
   
        % Can't be outside image boundaries
        while ( ~( xmin>0 && ymin>0 && xmin+width<=length(Film_Area(1,:,1)) && ymin+height<=length(Film_Area(:,1,1)) ) )
            rect = getrect;
            xmin = round(rect(1)); ymin = round(rect(2)); width = round(rect(3)); height = round(rect(4));
        end
        % Replace image with zoom
        Film_Area = Film_Area_Prev(ymin:ymin+height, xmin:xmin+width,:);
        cla(handles.axes_image, 'reset');
        imshow(Film_Area, 'Parent', handles.axes_image);
    end
end
guidata(hObject, handles);



% --- Executes on button press in button_reset.
function button_reset_Callback(hObject, eventdata, handles)
% Acquire gloabal variables
global Film_Img Film_Area Film_Area_Prev Film_FileName rect;

% Redisplay original file image if one exists  
if ~isempty(Film_FileName)
    if ( rect ~= 0 ) % zoomed
        % reiterate end of button_tifffs_callback
        rect = 0; Film_Area = Film_Img;
        Film_Area_Prev = Film_Area;
        cla(handles.axes_image, 'reset');
        imshow(Film_Img, 'Parent', handles.axes_image);
    end
end
guidata(hObject, handles);



% --- Executes on button press in button_preview.
function button_preview_Callback(hObject, eventdata, handles)
global Film_Area dpi
dpi = str2double(get(handles.edit_dpi, 'String'));
blurList = get(handles.popupmenu_blurType, 'String');
  blurType = blurList{get(handles.popupmenu_blurType, 'Value')};
blurRadius = str2double(get(handles.edit_blurRadius, 'String'));
%rgbList = get(handles.popupmenu_RGB, 'String');
%  rgb = rgbList{get(handles.popupmenu_RGB, 'Value')};
rgb = 'Red';
if ( strcmp(rgb, 'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end

Film_Area_Rows = length(Film_Area(:,1,rgb_i));
Film_Area_Cols = length(Film_Area(1,:,rgb_i));
% Preview analysis matrix in new figure
if ( strcmp(blurType, 'None') )
    filtered_Film_Area = Film_Area;
    figure; % flip rows to correctly plot matrix (y points down) on graph (y points up)
    surf(1:Film_Area_Cols, flip(1:Film_Area_Rows), filtered_Film_Area(:,:,rgb_i));
elseif ( strcmp(blurType, 'Gaussian') )
    % Define gaussian blur kernel, apply to ROI and preview
    blurSigma = 0.15*blurRadius + 0.35; % based on openCV.gaussianBlur
    filtered_Film_Area = imgaussfilt(Film_Area, blurSigma);
    figure; % flip rows to correctly plot matrix (y points down) on graph (y points up)
    surf(1:Film_Area_Cols, flip(1:Film_Area_Rows), filtered_Film_Area(:,:,rgb_i));
elseif ( strcmp(blurType, 'Mean') )
    % Define mean blur kernel, apply to ROI and preview
    blurKernel = fspecial('average', [blurRadius blurRadius]);
    filtered_Film_Area = imfilter(Film_Area, blurKernel);
    figure; % flip rows to correctly plot matrix (y points down) on graph (y points up)
    surf(1:Film_Area_Cols, flip(1:Film_Area_Rows), filtered_Film_Area(:,:,rgb_i));
end


% --- Executes on button press in button_guess.
function button_guess_Callback(hObject, eventdata, handles)
% Acquire vars
global Film_Area vertex Film_FileName rect dpi;

% Check for image in axes
if ~isempty(Film_FileName)
    % Check with user if unzoomed
    choice_confirm = 1;
    if ( rect == 0 )
        % Confirm calculations for unzoomed image
        choice = questdlg('Image unzoomed, proceed?', 'Continue?', 'Yes', 'No', 'No');
        switch choice
            case 'No'
                choice_confirm = 0;
        end
    end
    
    % Immediately quit if user chooses "No"
    if ( ~choice_confirm ) return; end
    
    % GAUSSIAN FILTER
    % Gather/declare vars
    dpi = str2double(get(handles.edit_dpi, 'String'));
    vertex = zeros(3, 3);
    rgb = 'Red'; %get(handles.text_rgb, 'String');
    if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
    
    % Define gaussian blur kernel
    kernelRadiusMM = str2double(get(handles.edit_blurRadius, 'String')); % mm
    kernelRadius = round(kernelRadiusMM*dpi/25.4); % Convert to dots, rounded
    kernelSigma = 0.15*kernelRadius + 0.35; % based on openCV.gaussianBlur
    
    % Apply gaussian blur to ROI, find global minimum of output
    filtered_Film_Area = imgaussfilt(Film_Area, kernelSigma);
    vertex(3, rgb_i) = min(min(filtered_Film_Area(:, :, rgb_i)));
    
    % Match global minimum to coordinate of blurred ROI (better command?)
    Film_Area_Rows = length(Film_Area(:,1,1));
    Film_Area_Cols = length(Film_Area(1,:,1));
    for j = 1:Film_Area_Rows
        for i = 1:Film_Area_Cols
            if (filtered_Film_Area(j, i, rgb_i) == vertex(3, rgb_i))
                vertex(1, rgb_i) = j; vertex(2, rgb_i) = i;
            end
        end
    end
end

% % Vertex xy adjust slider step (0 to Film_xyMax in steps of 1)
[Film_yMax, Film_xMax] = size(Film_Area(:, :, 1));
sliderStepY = [1 1]/(Film_yMax - 0);
set(handles.slider_vertexY, 'SliderStep', sliderStepY);
sliderStepX = [1 1]/(Film_xMax - 0);
set(handles.slider_vertexX, 'SliderStep', sliderStepX);

% Set slider max and vertex values
set(handles.slider_vertexY, 'max', Film_yMax);
set(handles.slider_vertexX, 'max', Film_xMax);
set(handles.slider_vertexY, 'value', Film_yMax - vertex(1,1));
set(handles.slider_vertexX, 'value', vertex(2,1));
set(handles.edit_vertexY, 'String', Film_yMax - vertex(1,1));
set(handles.edit_vertexX, 'String', vertex(2,1));

% Radial slider step (0.1 to 100 in steps of 0.1)
sliderStep = [0.1 0.1]/(100.0 - 1);
set(handles.slider_radius, 'SliderStep', sliderStep);
set(handles.slider_radius, 'Min', 1);
set(handles.slider_radius, 'Max', 100);
set(handles.slider_radius, 'value', 1);

% Precise tolerance slider step (0.1 to 10 in steps of 0.1)
sliderStep = [0.1 0.1]/(10.0 - 0.1);
set(handles.slider_tol, 'SliderStep', sliderStep);
set(handles.slider_tol, 'Min', 0.1);
set(handles.slider_tol, 'Max', 10);
set(handles.slider_tol, 'value', 0.1);

% Angular slider step (1 to 360 in steps of 1)
sliderStep = [1.0 1.0]/(360.0 - 1.0);
set(handles.slider_angle, 'SliderStep', sliderStep);
set(handles.slider_angle, 'Min', 1);
set(handles.slider_angle, 'Max', 360);
set(handles.slider_angle, 'value', 1);

findCritPhi(hObject, handles);

% Display Red channel of selected area
imshow(Film_Area(:,:,1), 'Parent', handles.axes_image);
recalculate_window(hObject, handles);
guidata(hObject, handles);



% --- Executes on x slider movement.
function slider_vertexX_Callback(hObject, eventdata, handles)
% Acquire vars
global Film_Area vertex;
rgb = 'Red'; %get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end

% Get value from slider and change vertex
[Film_yMax Film_xMax] = size(Film_Area(:, :, 1));
sliderX = round(get(hObject,'Value'));
if ( sliderX <= Film_xMax && sliderX >= 0 ); vertex(2, rgb_i) = sliderX; end
set(handles.edit_vertexX,'String', vertex(2, rgb_i));

% Display R/G/B channel of selected area
recalculate_window(hObject, handles);
guidata(hObject, handles);



function edit_vertexX_Callback(hObject, eventdata, handles)
recalculate_window(hObject, handles);
guidata(hObject, handles);



% --- Executes on y slider movement.
function slider_vertexY_Callback(hObject, eventdata, handles)
% Acquire vars
global Film_Area vertex;
rgb = 'Red'; %get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end

% Get value from slider and change vertex
[Film_yMax Film_xMax] = size(Film_Area(:, :, 1));
sliderY = round(get(hObject,'Value'));
if ( sliderY <= Film_yMax && sliderY >= 0 ); vertex(1, rgb_i) = Film_yMax - sliderY; end
set(handles.edit_vertexY, 'String', Film_yMax - sliderY);

% Display R/G/B channel of selected area
recalculate_window(hObject, handles);
guidata(hObject, handles);



function edit_vertexY_Callback(hObject, eventdata, handles)
recalculate_window(hObject, handles);
guidata(hObject, handles);



% --- Executes on slider movement.
function slider_radius_Callback(hObject, eventdata, handles)
% Acquire vars
global Film_Area;
slider_r = get(hObject,'Value');
rgb = 'Red'; %get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
set(handles.edit_radius,'String', slider_r);

% Display R/G/B channel of selected area
recalculate_window(hObject, handles);
guidata(hObject, handles);



function edit_radius_Callback(hObject, eventdata, handles)
r = str2double(get(hObject,'String'));
if ( r >= 0 && r <= get(handles.slider_radius,'Max') )
    set(handles.slider_radius,'Value', r);
    guidata(hObject, handles);
else
    set(handles.edit_radius,'String', get(handles.slider_radius,'Value '));
    guidata(hObject, handles);
end
recalculate_window(hObject, handles);
guidata(hObject, handles);



% --- Executes on tolerance slider movement.
function slider_tol_Callback(hObject, eventdata, handles)
% Acquire vars
global Film_Area
slider_rTol = sprintf('%0.1f', get(hObject, 'Value'));
rgb ='Red'; % get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
set(handles.edit_tol, 'String', slider_rTol);

% Display R/G/B channel of selected area
recalculate_window(hObject, handles);
guidata(hObject, handles);



function edit_tol_Callback(hObject, eventdata, handles)
recalculate_window(hObject, handles);
guidata(hObject, handles);



% --- Executes on angular slider movement.
function slider_angle_Callback(hObject, eventdata, handles)
% Acquire global and GUI variables
global Film_Area phicrit;
phicrit = get(hObject, 'Value');
rgb ='Red'; % get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
set(handles.edit_angle, 'String', phicrit);

% Display R/G/B channel of selected area
recalculate_window(hObject, handles);
guidata(hObject, handles);



function edit_angle_Callback(hObject, eventdata, handles)
% Acquire global and GUI variables
global phicrit;
phicrit = str2num(get(hObject,'String'));
if ( phicrit >= 0 && phicrit <= get(handles.slider_angle,'Max') )
    set(handles.slider_angle,'Value', phicrit);
    guidata(hObject, handles);
else
    set(handles.edit_angle,'String', get(handles.slider_angle,'Value'));
    guidata(hObject, handles);
end
recalculate_window(hObject, handles);
guidata(hObject, handles);



% --- Executes on "analyze vertices vertically" button press
function button_anisotropy_vertical_Callback(hObject, eventdata, handles)
% Acquire global and GUI variables
global Film_Area dpi vertices theta Xfit;
sourceDistance = str2num(get(handles.edit_sourceDistance, 'String'));
%rgbList = get(handles.popupmenu_RGB, 'String');
%  rgb = rgbList{get(handles.popupmenu_RGB, 'Value')};
blurList = get(handles.popupmenu_blurType, 'String');
  blurType = blurList{get(handles.popupmenu_blurType, 'Value')};
blurRadius = str2double(get(handles.edit_blurRadius, 'String'));
%rgbList = get(handles.popupmenu_RGB, 'String');
%  rgb = rgbList{get(handles.popupmenu_RGB, 'Value')};
rgb = 'Red';
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end

% Filter film ROI
if ( strcmp(blurType, 'None') )
    filtered_Film_Area = Film_Area;
elseif ( strcmp(blurType, 'Gaussian') )
    % Define gaussian blur kernel, apply to ROI and preview
    blurSigma = 0.15*blurRadius + 0.35; % based on openCV.gaussianBlur
    filtered_Film_Area = imgaussfilt(Film_Area, blurSigma);
    %blurKernel = fspecial('gaussian', [blurRadius blurRadius]);
    %filtered_Film_Area = imfilter(Film_Area, blurKernel);
elseif ( strcmp(blurType, 'Mean') )
    % Define mean blur kernel, apply to ROI and preview
    blurKernel = fspecial('average', [1 blurRadius]);
    filtered_Film_Area = imfilter(Film_Area, blurKernel);
end

% Scan for local minimum by row
Film_Area_Rows = length(filtered_Film_Area(:, 1, rgb_i));
Film_Area_Cols = length(filtered_Film_Area(1, :, rgb_i));
vertices = zeros(Film_Area_Rows, 2, 3); % y's by [x, value] by RGB
theta = zeros(Film_Area_Rows, 1); Xfit = zeros(Film_Area_Rows, 1);
for j=1:Film_Area_Rows
    
    vertices(j, 2, rgb_i) = min(filtered_Film_Area(j, :, rgb_i)); % minimum "gaussed" value
    %vertices(j, 2, rgb_i) = min(Film_Area(j, :, rgb_i)); % minimum exact value (todo: determine which is applicable)
    for i=1:Film_Area_Cols
        if ( vertices(j, 2, rgb_i) == filtered_Film_Area(j, i, rgb_i) )
            vertices(j, 1, rgb_i) = i; % Corresponding x value
        end
    end
end

% Determine slope "m" of x = m*y + x_0 for [y in 1:Film_Area_Rows]
P = polyfit(1:Film_Area_Rows, vertices(:, 1, rgb_i)', 1); %polyfit(xvalues , yvalues, order);
Xfit = P(1)*(1:Film_Area_Rows) + P(2);
minimumY = 1;
for j=2:Film_Area_Rows
    
    % Find minimum along linear fit line
    if ( filtered_Film_Area(j, round(Xfit(j)), rgb_i) < filtered_Film_Area(minimumY, round(Xfit(minimumY)), rgb_i) )
        minimumY = j;
    end
end
for j=1:Film_Area_Rows
    
    % Assume negligable tilt, convert y to phi
    smagnitude = (minimumY-j)*sec(atan(P(1)));
    theta(j) = 90 - smagnitude*(2.54/(dpi*sourceDistance))*(180/pi);
end

% Plot selected area with markers on vertices
hold on;
plot(handles.axes_image, vertices(:, 1, rgb_i), 1:Film_Area_Rows, 'r+', 'MarkerSize', 2);
plot(handles.axes_image, Xfit, 1:Film_Area_Rows, 'b-', 'MarkerSize', 3);
hold off;

for y=1:Film_Area_Rows
    FilmAlongXFit(y) = filtered_Film_Area(y, round(Xfit(y)), rgb_i);
end

% Plot (theta, intensity) along vertices rift fit
figure; % flip rows to correctly plot matrix (y points down) on graph (y points up)
plot(flip(theta), flip(FilmAlongXFit), '.', 'Markersize', 3);
title('Grayscale around around film along darkest rift');
ylabel('Grayscale [a.u.]');
xlabel('Polar angle around seed \theta [deg]');
%xticklabels(theta);



% --- Executes on "analyze vertices horizontally" button press
function button_anisotropy_horizontal_Callback(hObject, eventdata, handles)
% TODO





%% AUXILLIARY
% --- Reanalyzes image at new parameters.
function recalculate_window(hObject, handles)
% Acquire global and GUI variables
global Film_Area dpi vertex;
%rgbList = get(handles.popupmenu_RGB, 'String');
%  rgb = rgbList{get(handles.popupmenu_RGB, 'Value')};
rgb = 'Red';
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
slider_r_max = get(handles.slider_radius, 'Max');
r = str2double(get(handles.edit_radius, 'String'));
rTol = str2double(get(handles.edit_tol, 'String'));
avgRadius = str2double(get(handles.edit_avgR, 'String'));

% Update vertex grayscale label with encompassing circular avg of available cells
vertex(3, rgb_i) = Film_Area(vertex(1, rgb_i), vertex(2, rgb_i), rgb_i);
%kernelRadius = str2double(get(handles.edit_blurRadius, 'String'));
avgArea = 0; avgAreaValue = 0;
Film_Area_Rows = length(Film_Area(:, 1,rgb_i));
Film_Area_Cols = length(Film_Area(1, :,rgb_i));
for j = 1:Film_Area_Rows
    for i = 1:Film_Area_Cols
        if ( ( j >= 1 && j <= Film_Area_Rows ) && ( i >= 1 && i <= Film_Area_Cols ) )
            if ( (j - vertex(1, rgb_i))^2 + (i - vertex(2, rgb_i))^2 <= avgRadius^2 )
                avgArea = avgArea + 1; % following double() necessary to preserve precision
                avgAreaValue = avgAreaValue + double(Film_Area(j, i, rgb_i));
            end
        end
    end
end
avgValue = avgAreaValue/avgArea;
set(handles.text_vertexValue, 'String', avgValue);

% Update ROI grayscale label with average of available cells
avgROIValue = mean(mean(Film_Area(:, :, rgb_i)));
set(handles.text_ROIValue, 'String', avgROIValue);

% Check for radius numeric input
if ( isnan(r) )
    set(handles.edit_radius,'String', 0);
    errordlg('r must be a number', 'Error');
end
if ( isnan(rTol) )
    set(handles.edit_tol,'String', 1);
    errordlg('Tolerance must be a number', 'Error');
end

% Check r boundary
if ( r < 0 ) set(handles.edit_radius,'String',0);
elseif ( r > slider_r_max ) set(handles.edit_radius,'String',slider_r_max);
end

% Draw resulting circles and crit angle line
hold on; circleDraw(hObject, handles); hold off;

% Construct Optical Density plot
plot_OD(hObject, handles);
guidata(hObject, handles);



% Find critical angle of bias
% [I_peak, phi_c] = max(I_r);
function findCritPhi(hObject, handles)
% Acquire global and GUI variables
global vertex dpi Film_Area phicrit;
r = str2double(get(handles.edit_radius,'String'));
%rgbList = get(handles.popupmenu_RGB, 'String');
%  rgb = rgbList{get(handles.popupmenu_RGB, 'Value')};
rgb = 'Red';
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
    
% For each degree, get total value of radial distribution
phi_c = 0; I_px = r*dpi/25.4;
Ir_min = 0;
for phi_deg=1:360
    % Radians
    phi_i = phi_deg*pi/180;
    
    % Loop through weighted angular analyses
    for i=1:I_px
        if (floor(vertex(2,rgb_i)-i*sin(phi_i)) > 0 && floor(vertex(2,rgb_i)-i*sin(phi_i)) < length(Film_Area(:,1,1)))
            if (floor(vertex(1,rgb_i)+i*cos(phi_i)) > 0 && floor(vertex(1,rgb_i)+i*cos(phi_i)) < length(Film_Area(1,:,1)))
                Ir_weighted(i) = Film_Area(floor(vertex(2,rgb_i)-i*sin(phi_i)), floor(vertex(1,rgb_i)+i*cos(phi_i)), rgb_i);
            else
                Ir_weighted(i) = 65536;
            end
        else
          Ir_weighted(i) = 65536;
        end
        % /((i*25.4/dpi)^2);
    end
    
    % Check for more optimized angle by totally lower grayscale across radius
    if ( Ir_min == 0 )
        Ir_min = sum(Ir_weighted);
    end
    if ( sum(Ir_weighted) <= Ir_min )
        Ir_min = sum(Ir_weighted);
        phi_c = phi_deg;
    end
end
phicrit = phi_c;



% Draw 3 circles: of selected radius, and +/- tolerance
function circleDraw(hObject, handles)
% Acquire global and GUI variables
global Film_Area vertex dpi phicrit;
r = str2double(get(handles.edit_radius, 'String'));
rTol = str2double(get(handles.edit_tol, 'String'));
r_px = r*dpi/25.4; r_pxTol = rTol*dpi/25.4; % get r +- rTol in px
%rgbList = get(handles.popupmenu_RGB, 'String');
%  rgb = rgbList{get(handles.popupmenu_RGB, 'Value')};
rgb = 'Red';
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end

% Display R/G/B channel of selected area
imshow(Film_Area(:,:,rgb_i), 'Parent', handles.axes_image);
hold on;

% Create circles with... rectangle(), because MATLAB
rectangle('Position', [vertex(2,1)-r_px vertex(1,1)-r_px 2*r_px 2*r_px], ...
          'Curvature', [1 1], 'Parent', handles.axes_image)
rectangle('Position', [vertex(2,1)-(r_px+r_pxTol) vertex(1,1)-(r_px+r_pxTol) 2*(r_px+r_pxTol) 2*(r_px+r_pxTol)], ...
          'Curvature', [1 1], 'Parent', handles.axes_image)
rectangle('Position', [vertex(2,1)-(r_px-r_pxTol) vertex(1,1)-(r_px-r_pxTol) 2*(r_px-r_pxTol) 2*(r_px-r_pxTol)], ...
          'Curvature', [1 1], 'Parent', handles.axes_image)
rectangle('Position', [vertex(2,1)-0.5 vertex(1,1)-0.5 1 1], ...
          'Curvature', [1 1], 'Parent', handles.axes_image)

% Draw averaging circle
%kernelRadius = str2double(get(handles.edit_blurRadius, 'String'));
avgRadius = 1;
rectangle('Position', [vertex(2,1)-avgRadius vertex(1,1)-avgRadius 2*avgRadius 2*avgRadius], ...
          'Curvature', [1 1], 'EdgeColor', 'r', 'Parent', handles.axes_image);
      
% Draw line from vertex to radial edge if within Film_Area dimensions
phicritrad = phicrit*pi/180; % Radians
set(handles.edit_angle, 'String', phicrit);
set(handles.slider_angle, 'Value', phicrit);
radialLine = line([vertex(2,rgb_i) vertex(2,rgb_i) + r_px*cos(phicritrad)], [vertex(1, rgb_i) vertex(1, rgb_i)-r_px*sin(phicritrad)]);
try set(radialLine, 'Parent', handles.axes_image); end
hold off;



function plot_OD(hObject, handles)
% Acquire vars
global Film_Area vertex I_r I_avg dpi phicrit;
r = str2double(get(handles.edit_radius, 'String'));
rTol = str2double(get(handles.edit_tol, 'String'));
%rgbList = get(handles.popupmenu_RGB, 'String');
%  rgb = rgbList{get(handles.popupmenu_RGB, 'Value')};
rgb = 'Red';
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
dphi = 1;

% Angular range: circle for source...
phi=1:dphi:360;

% Create data point for each angle
I_numpoints = max(phi) - min(phi) + 1; % angular iterations
I_avg = zeros(I_numpoints, 1); I_r = zeros(I_numpoints, 1);

% 0.01 mm increments from r +/- rTol
rInc = 1e-2; rSteps = 2*rTol/rInc;

% Loop through whole angle;
for i_phi=1:I_numpoints
    % Get angle in radians
    phi_rad = phi(i_phi)*pi/180;
    for rStep_i = 0:rSteps
        % Get r_i in px
        r_pxi = (r - rTol + rStep_i*rInc)*dpi/25.4;

        % Find closest pixel, assume value
        if (floor(vertex(2, rgb_i) + r_pxi*cos(phi_rad)) >= 1 && floor(vertex(2, rgb_i) + r_pxi*cos(phi_rad)) <= length(Film_Area(1,:,1))) ...
            && (floor(vertex(1, rgb_i) - r_pxi*sin(phi_rad)) >= 1 && floor(vertex(1, rgb_i) - r_pxi*sin(phi_rad)) <= length(Film_Area(:,1,1)))
                I_y = floor(vertex(1, rgb_i) - r_pxi*sin(phi_rad));
                I_x = floor(vertex(2, rgb_i) + r_pxi*cos(phi_rad));
                I_avg(i_phi) = double(I_avg(i_phi) + Film_Area(I_y, I_x, rgb_i)/(rSteps+1));
        else
            I_avg(i_phi) = 0;
        end
    end
    r_px = r*dpi/25.4; % get r in px
    if (floor(vertex(2, rgb_i) + r_px*cos(phi_rad)) >= 1 && floor(vertex(2, rgb_i) + r_px*cos(phi_rad)) <= length(Film_Area(1,:,1))) ...
        && (floor(vertex(1, rgb_i) - r_px*sin(phi_rad)) >= 1 && floor(vertex(1, rgb_i) - r_px*sin(phi_rad)) <= length(Film_Area(:,1,1)))
            I_y = floor(vertex(1, rgb_i) - r_px*sin(phi_rad));
            I_x = floor(vertex(2, rgb_i) + r_px*cos(phi_rad));
            I_r(i_phi) = Film_Area(I_y, I_x, rgb_i);
    else
        I_r(i_phi) = 0;
    end
end
% Plot I(phi) for r=radius (blue) and r=radius +/- tolerance (red)
plot(min(phi):max(phi), I_r, 'b-', 'Parent', handles.axes_angularOD);
hold(handles.axes_angularOD, 'on');
plot(min(phi):max(phi), I_avg, 'r-', 'Parent', handles.axes_angularOD);
hold(handles.axes_angularOD, 'off');
axis(handles.axes_angularOD, [min(phi) max(phi) min(min(I_r(:), I_avg(:))) max(max(I_r(:), I_avg(:)))]);
xlabel(handles.axes_angularOD, 'Angle [deg]')
ylabel(handles.axes_angularOD, 'Grayscale [of 2^1^6]')

% Radial range: zero to radius
I_rnumpoints = 200;
dr=r/I_rnumpoints;
arr=0:dr:r;

% Create data point for each radius
I_crit = zeros(I_rnumpoints, 1);

% Loop through whole radius;
for i_r=1:I_rnumpoints
    % Get r_i in px
    r_pxi = i_r*dr*dpi/25.4;
            
    % Find closest pixel, assume value
    if ( floor(vertex(2, rgb_i) + r_pxi*cos(phicrit)) >= 1 && floor(vertex(2, rgb_i) + r_pxi*cos(phicrit)) <= length(Film_Area(1,:,1)) ) ...
        && ( floor(vertex(1, rgb_i) - r_pxi*sin(phicrit)) >= 1 && floor(vertex(1, rgb_i) - r_pxi*sin(phicrit)) <= length(Film_Area(:,1,1)) )
            I_y = floor(vertex(1, rgb_i) - r_pxi*sin(phicrit));
            I_x = floor(vertex(2, rgb_i) + r_pxi*cos(phicrit));
            I_crit(i_r) = double(Film_Area(I_y, I_x, rgb_i));
    else
       I_crit(i_r) = 0;
    end
end
% Plot I_crit(arr) along r=radius (blue)
plot(arr(1:end-1), I_crit, 'b-', 'Parent', handles.axes_radialOD);
try axis(handles.axes_radialOD, [ min(arr) max(arr) min(I_crit(:)) max(I_crit(:)) ]); end
xlabel(handles.axes_radialOD, 'Radius [mm]')
ylabel(handles.axes_radialOD, 'Grayscale [of 2^1^6]')
