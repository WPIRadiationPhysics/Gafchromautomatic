%% GUI
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

% Last Modified by GUIDE v2.5 25-Jun-2019 22:04:34

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


% --- Executes just before gafchromautomatic is made visible.
function gafchromautomatic_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for gafchromautomatic
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = gafchromautomatic_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)


function menu_file_opentiff_Callback(hObject, eventdata, handles)
% Acquire global variables
global Film_Img Film_Area Film_Area_Prev Film_FileName rect;

% Image Single-selection, set as cell array
[Film_FileName, Film_FilePath, Img_Index] = uigetfile('*.tif', ...
    'Choose image file', 'MultiSelect', 'off');

% If successful selection
if ~isempty(Film_FileName)
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


% --------------------------------------------------------------------
function menu_file_save_Callback(hObject, eventdata, handles)
% Acquire vars
global I_r I_avg;
dtheta = 1;
theta=0:dtheta:360;

% Create data point for each angle
I_numpoints = max(theta) - min(theta) + 1; % angular iterations including the zeroth

% Get date and time for filename
dateandtime = datestr(now, 'yyyy-mm-dd_HH-MM-SS');
outputODfilename = strcat('OD_', dateandtime, '.txt');
fileODout = fopen(outputODfilename, 'w');

% Loop through whole angle for output and close file
for i_theta=1:I_numpoints
    % Write theta [deg], I(r,theta) and I_avg(r,theta) [a.u.] to text file
    % for given r +- tol as "i_theta, I_r, I_avg"
    fprintf(fileODout, '%d %3d %3d\n', i_theta, I_r(i_theta), I_avg(i_theta));
end
fclose(fileODout);

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



% --- Executes during object creation, after setting all properties.
function edit_dpi_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_dpi_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_scanBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_scanBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_scanBox_Callback(hObject, eventdata, handles)


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
    
    %{
            Algorithm for finding peak pixel coordinate (y, x, rgb_i)
    
      For R, G, and B channels of 16-bit grayscale, 0 is absolute black
      and 2^16 = 65536 is white.  Irradiated film is dark, thus the peak
      is a minimim value.

      For every possible location of an mxm matrix on the selected region
      (Film_Area), an average value is taken of the m^2 cells.  The (at
      the moment, latest) global minimum of these mxm averages is assumed
      to be the location of the global minimum coordinate, so the (again,
      latest) cell is found with respect to the selected region:
    
                     ( vertex(1, rgb_i), vertex(2, rgb_i) )
    %}
    % Gather/declare vars
    dpi = str2double(get(handles.edit_dpi, 'String'));
    CourseAreaSide = str2num(get(handles.edit_scanBox, 'String'));
    MxRows = length(Film_Area(:,1,1))-(CourseAreaSide-1);
    MxCols = length(Film_Area(1,:,1))-(CourseAreaSide-1);
    Mx = zeros(MxRows, MxCols, 3);
    vertex_area = zeros(3, 3);
    vertex = zeros(3, 3);

    % Main Loop
    hold on
    for channelNum=1:3
        % Construct the values of the new matrix by analyzing each area
        for j = 1:MxRows
          for i = 1:MxCols
            Mx(j, i, channelNum) = sum(sum(Film_Area(j:(j+(CourseAreaSide-1)), ...
           i:(i+(CourseAreaSide-1)), channelNum)))/(CourseAreaSide^2);
          end
        end

      % Course-grain peak location
      vertex_area(3, channelNum) = min(min(Mx(:, :, channelNum)));
      for j = 1:MxRows
        for i = 1:MxCols
          if (Mx(j, i, channelNum) == vertex_area(3, channelNum))
            %if ( ( i>3 || i<MxCols-3 ) && ( j>3 || j<MxRows-3 ) ) % 3 pixel side buffer
              vertex_area(1, channelNum) = j; vertex_area(2,  channelNum) = i;
            %end
          end
        end
      end
  
      % Global peak location at peak of side x side vertex_area
      vertex(3,channelNum) = min(min(Film_Area(vertex_area(1, ...
          channelNum):vertex_area(1, channelNum)+CourseAreaSide-1, ...
          vertex_area(2, channelNum):vertex_area(2, channelNum)+CourseAreaSide-1, ...
          channelNum)));
      for j = 1:CourseAreaSide
        for i = 1:CourseAreaSide
          if (Film_Area(vertex_area(1,channelNum)+j-1, vertex_area(2,channelNum)+i-1, channelNum) == vertex(3,channelNum))
            vertex(1,channelNum) = j + vertex_area(1,channelNum) - 1;
            vertex(2,channelNum) = i + vertex_area(2,channelNum) - 1;
          end
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
sliderStep = [1.0 1.0]/(360.0 - 0.0);
set(handles.slider_angle, 'SliderStep', sliderStep);
set(handles.slider_angle, 'Min', 1);
set(handles.slider_angle, 'Max', 360);
set(handles.slider_angle, 'value', 1);

% Display Red channel of selected area
imshow(Film_Area(:,:,1), 'Parent', handles.axes_image);
hold on; circleDraw(hObject, handles); hold off;
recalculate_window(hObject, handles);
guidata(hObject, handles);


% --- Executes during x slider creation, after setting all properties.
function slider_vertexX_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on x slider movement.
function slider_vertexX_Callback(hObject, eventdata, handles)
% Acquire vars
global Film_Area vertex;
rgb = 'Red'; %get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end

% Get value from slider and change vertex
[Film_yMax Film_xMax] = size(Film_Area(:, :, 1));
sliderX = get(hObject,'Value');
if ( sliderX <= Film_xMax && sliderX >= 0 ); vertex(2, rgb_i) = sliderX; end
set(handles.edit_vertexX,'String', vertex(2, rgb_i));

% Display R/G/B channel of selected area
imshow(Film_Area(:,:,rgb_i), 'Parent', handles.axes_image);
hold on;
circleDraw(hObject, handles);
hold off;
recalculate_window(hObject, handles);
guidata(hObject, handles);


% --- Executes during x vertex edit creation, after setting all properties.
function edit_vertexX_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_vertexX_Callback(hObject, eventdata, handles)
recalculate_window(hObject, handles);
guidata(hObject, handles);


% --- Executes during y slider creation, after setting all properties.
function slider_vertexY_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on y slider movement.
function slider_vertexY_Callback(hObject, eventdata, handles)
% Acquire vars
global Film_Area vertex;
rgb = 'Red'; %get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end

% Get value from slider and change vertex
[Film_yMax Film_xMax] = size(Film_Area(:, :, 1));
sliderY = get(hObject,'Value');
if ( sliderY <= Film_yMax && sliderY >= 0 ); vertex(1, rgb_i) = Film_yMax - sliderY; end
set(handles.edit_vertexY,'String', Film_yMax - sliderY);

% Display R/G/B channel of selected area
imshow(Film_Area(:,:,rgb_i), 'Parent', handles.axes_image);
hold on;
circleDraw(hObject, handles);
hold off;
recalculate_window(hObject, handles);
guidata(hObject, handles);


% --- Executes during y vertex edit creation, after setting all properties.
function edit_vertexY_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_vertexY_Callback(hObject, eventdata, handles)
recalculate_window(hObject, handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider_radius_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function slider_radius_Callback(hObject, eventdata, handles)
% Acquire vars
global Film_Area;
slider_r = get(hObject,'Value');
rgb = 'Red'; %get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
set(handles.edit_radius,'String', slider_r);

% Display R/G/B channel of selected area
imshow(Film_Area(:,:,rgb_i), 'Parent', handles.axes_image);
hold on;
circleDraw(hObject, handles);
hold off;
recalculate_window(hObject, handles);
guidata(hObject, handles);


% --- Executes during radius edit creation, after setting all properties.
function edit_radius_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
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


% --- Executes during tolerance slider creation, after setting all properties.
function slider_tol_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on tolerance slider movement.
function slider_tol_Callback(hObject, eventdata, handles)
% Acquire vars
global Film_Area
slider_rTol = sprintf('%0.1f', get(hObject, 'Value'));
rgb ='Red'; % get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
set(handles.edit_tol, 'String', slider_rTol);

% Display R/G/B channel of selected area
imshow(Film_Area(:,:,rgb_i), 'Parent', handles.axes_image);
hold on;
circleDraw(hObject, handles);
hold off;
recalculate_window(hObject, handles);
guidata(hObject, handles);


% --- Executes during tolerance edit creation, after setting all properties.
function edit_tol_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit_tol_Callback(hObject, eventdata, handles)
recalculate_window(hObject, handles);
guidata(hObject, handles);

function edit_angle_Callback(hObject, eventdata, handles)
% Acquire global and GUI variables
global thetacrit;
thetacrit = str2num(get(hObject,'String'));
if ( thetacrit >= 0 && thetacrit <= get(handles.slider_angle,'Max') )
    set(handles.slider_angle,'Value', thetacrit);
    guidata(hObject, handles);
else
    set(handles.edit_angle,'String', get(handles.slider_angle,'Value'));
    guidata(hObject, handles);
end
recalculate_window(hObject, handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit_angle_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on angular slider movement.
function slider_angle_Callback(hObject, eventdata, handles)
% Acquire global and GUI variables
global Film_Area thetacrit;
thetacrit = get(hObject, 'Value');
rgb ='Red'; % get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
set(handles.edit_angle, 'String', thetacrit);

% Display R/G/B channel of selected area
imshow(Film_Area(:,:,rgb_i), 'Parent', handles.axes_image);
hold on;
circleDraw(hObject, handles);
hold off;
recalculate_window(hObject, handles);
guidata(hObject, handles);


% --- Executes during angular object creation, after setting all properties.
function slider_angle_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function popupmenu_RGB_CreateFcn(hObject, eventdata, handles)
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in popupmenu_RGB.
function popupmenu_RGB_Callback(hObject, eventdata, handles)


% --- Executes on button press in button_recalculate.
function button_recalculate_Callback(hObject, eventdata, handles)
recalculate_window(hObject, handles);


%% AUXILLIARY
% --- Reanalyzes image at new parameters.
function recalculate_window(hObject, handles)
global Film_Area dpi;
%hdlg = msgbox('Recalculating optical densities, please wait...');

% Acquire state variables
slider_r_max = get(handles.slider_radius, 'Max');
r = str2double(get(handles.edit_radius,'String'));
rTol = str2double(get(handles.edit_tol,'String'));
rgb = 'Red'; %get(handles.text_rgb, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end

% Check for numeric input
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

% Display R/G/B channel of selected area
imshow(Film_Area(:,:,rgb_i), 'Parent', handles.axes_image);
hold on;
circleDraw(hObject, handles);
hold off;

% Construct Optical Density plot
plot_OD(hObject, handles);
guidata(hObject, handles);
%close(hdlg);

% Draw 3 circles: of selected radius, and +/- tolerance
function circleDraw(hObject, handles)
% Acquire global and GUI variables
global vertex dpi Film_Area thetacrit;
r = str2double(get(handles.edit_radius, 'String'));
rTol = str2double(get(handles.edit_tol, 'String'));
r_px = r*dpi/25.4; r_pxTol = rTol*dpi/25.4; % get r +- rTol in px
rgb = 'Red'; %get(handles.edit_RGB, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end

% Create circles with... rectangle(), because MATLAB
rectangle('Position', [vertex(2,1)-r_px vertex(1,1)-r_px 2*r_px 2*r_px], ...
          'Curvature', [1 1], 'Parent', handles.axes_image)
rectangle('Position', [vertex(2,1)-(r_px+r_pxTol) vertex(1,1)-(r_px+r_pxTol) 2*(r_px+r_pxTol) 2*(r_px+r_pxTol)], ...
          'Curvature', [1 1], 'Parent', handles.axes_image)
rectangle('Position', [vertex(2,1)-(r_px-r_pxTol) vertex(1,1)-(r_px-r_pxTol) 2*(r_px-r_pxTol) 2*(r_px-r_pxTol)], ...
          'Curvature', [1 1], 'Parent', handles.axes_image)
rectangle('Position', [vertex(2,1)-0.5 vertex(1,1)-0.5 1 1], ...
          'Curvature', [1 1], 'Parent', handles.axes_image)

% Find critical angle of bias
% [I_peak, theta_c] = max(I_r);
% 
% For each degree, get total value of radial distribution
theta_c = 0; I_px = r*dpi/25.4;
Ir_min = 0;
for theta_deg=1:360
    % Radians
    theta_i = theta_deg*pi/180;
    
    % Loop through weighted angular analyses
    for i=1:I_px
        if (floor(vertex(2,rgb_i)-i*sin(theta_i)) > 0 && floor(vertex(2,rgb_i)-i*sin(theta_i)) < length(Film_Area(:,1,1)))
            if (floor(vertex(1,rgb_i)+i*cos(theta_i)) > 0 && floor(vertex(1,rgb_i)+i*cos(theta_i)) < length(Film_Area(1,:,1)))
                Ir_weighted(i) = Film_Area(floor(vertex(2,rgb_i)-i*sin(theta_i)), floor(vertex(1,rgb_i)+i*cos(theta_i)), rgb_i);
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
        theta_c = theta_deg;
    end
end

% Draw line from vertex to radial edge
thetacrit = theta_c;
set(handles.edit_angle,'String', thetacrit);
radialLine = line([vertex(2,rgb_i) vertex(2,rgb_i) + r_px*cos(theta_c)], [vertex(1,rgb_i) vertex(1,rgb_i)-r_px*sin(theta_c)]);
set(radialLine, 'Parent', handles.axes_image);


function plot_OD(hObject, handles)
% Acquire vars
global Film_Area vertex I_r I_avg dpi thetacrit;
r = str2double(get(handles.edit_radius, 'String'));
rTol = str2double(get(handles.edit_tol, 'String'));
rgb = 'Red'; %get(handles.edit_RGB, 'String');
if ( strcmp(rgb,'Red') ) rgb_i=1; elseif ( strcmp(rgb, 'Green') ) rgb_i=2; else rgb_i=3; end
dtheta = 1;

% Angular range: circle for source...
theta=0:dtheta:360;

% Create data point for each angle
I_numpoints = max(theta) - min(theta) + 1; % angular iterations including the zeroth
I_avg = zeros(I_numpoints); I_r = zeros(I_numpoints);

% 0.01 mm increments from r +/- rTol
rInc = 1e-2; rSteps = 2*rTol/rInc;

% Loop through whole angle;
for i_theta=1:I_numpoints
    % Get angle in radians
    theta_rad = theta(i_theta)*pi/180;
    for rStep_i = 0:rSteps
        try
            % Get r_i in px
            r_pxi = (r - rTol + rStep_i*rInc)*dpi/25.4;
            
            % Find closest pixel, assume value
            if (floor(vertex(2, rgb_i) + r_pxi*cos(theta_rad)) > 0 && floor(vertex(2, rgb_i) + r_pxi*cos(theta_rad)) < length(Film_Area(:,1,1)))
                if (floor(vertex(1, rgb_i) - r_pxi*sin(theta_rad)) > 0 && floor(vertex(1, rgb_i) - r_pxi*sin(theta_rad)) < length(Film_Area(1,:,1)))
                    I_y = floor(vertex(1, rgb_i) - r_pxi*sin(theta_rad));
                    I_x = floor(vertex(2, rgb_i) + r_pxi*cos(theta_rad));
                    I_avg(i_theta) = double(I_avg(i_theta) + Film_Area(I_y, I_x, rgb_i)/(rSteps+1));
                else
                    I_avg(i_theta) = 0;
                end
            else
                I_avg(i_theta) = 0;
            end
        catch
            I_avg(i_theta) = 0;
        end
    end
    r_px = r*dpi/25.4; % get r in px
    try
        if (floor(vertex(2, rgb_i) + r_px*cos(theta_rad)) > 0 && floor(vertex(2, rgb_i) + r_px*cos(theta_rad)) < length(Film_Area(:,1,1)))
            if (floor(vertex(1, rgb_i) - r_px*sin(theta_rad)) > 0 && floor(vertex(1, rgb_i) - r_px*sin(theta_rad)) < length(Film_Area(1,:,1)))
                I_y = floor(vertex(1, rgb_i) - r_px*sin(theta_rad));
                I_x = floor(vertex(2, rgb_i) + r_px*cos(theta_rad));
                I_r(i_theta) = Film_Area(I_y, I_x, rgb_i);
            else
                I_r(i_theta) = 0;
            end
        else
            I_r(i_theta) = 0;
        end
    catch
        I_r(i_theta) = 0;
    end
end
% Plot I(theta) for r=radius (blue) and r=radius +/- tolerance (red)
plot(min(theta):max(theta), I_r, 'b-', 'Parent', handles.axes_angularOD);
hold(handles.axes_angularOD, 'on');
plot(min(theta):max(theta), I_avg, 'r-', 'Parent', handles.axes_angularOD);
hold(handles.axes_angularOD, 'off');
axis(handles.axes_angularOD, [min(theta) max(theta) min(min(I_r(:,1),I_avg(:,1))) max(max(I_r(:,1),I_avg(:,1)))]);
xlabel(handles.axes_angularOD, 'Angle [deg]')
ylabel(handles.axes_angularOD, 'Grayscale [of 2^1^6]')

% Radial range: zero to radius
I_rnumpoints = 200;
dr=r/I_rnumpoints;
arr=0:dr:r;

% Create data point for each radius
I_crit = zeros(I_rnumpoints);

% Loop through whole radius;
for i_r=1:I_rnumpoints
    % Get r_i in px
    r_pxi = i_r*dr*dpi/25.4;
            
    % Find closest pixel, assume value
    try
        if (floor(vertex(2, rgb_i) + r_pxi*cos(thetacrit)) > 0 && floor(vertex(2, rgb_i) + r_pxi*cos(thetacrit)) < length(Film_Area(:,1,1)))
            if (floor(vertex(1, rgb_i) - r_pxi*sin(thetacrit)) > 0 && floor(vertex(1, rgb_i) - r_pxi*sin(thetacrit)) < length(Film_Area(1,:,1)))
                I_y = floor(vertex(1, rgb_i) - r_pxi*sin(thetacrit));
                I_x = floor(vertex(2, rgb_i) + r_pxi*cos(thetacrit));
                I_crit(i_r) = double(Film_Area(I_y, I_x, rgb_i));
            else
               I_crit(i_r) = 0;
            end
        else
            I_crit(i_r) = 0;
        end
    catch
        I_crit(i_r) = 0;
    end
end
% Plot I_crit(arr) along r=radius (blue)
plot(arr(1:end-1), I_crit, 'b-', 'Parent', handles.axes_radialOD);
%axis(handles.axes_radialOD, [min(arr) max(arr) min(min(I_crit(:,1))) max(max(I_crit(:,1)))]);
xlabel(handles.axes_radialOD, 'Radius [mm]')
ylabel(handles.axes_radialOD, 'Grayscale [of 2^1^6]')

% Update vertex grayscale label
set(handles.text_vertexValue, 'String', Film_Area(vertex(1, rgb_i), vertex(2, rgb_i), rgb_i));
