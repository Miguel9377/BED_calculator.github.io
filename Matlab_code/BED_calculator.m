function varargout = BED_calculator(varargin)
% BED_CALCULATOR MATLAB code for BED_calculator.fig
%      BED_CALCULATOR, by itself, creates a new BED_CALCULATOR or raises the existing
%      singleton*.
%
%      H = BED_CALCULATOR returns the handle to a new BED_CALCULATOR or the handle to
%      the existing singleton*.
%
%      BED_CALCULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BED_CALCULATOR.M with the given input arguments.
%
%      BED_CALCULATOR('Property','Value',...) creates a new BED_CALCULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BED_calculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BED_calculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BED_calculator

% Last Modified by GUIDE v2.5 18-Jan-2018 09:05:03

% Begin initialization code - DO NOT EDIT
clc
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @BED_calculator_OpeningFcn, ...
    'gui_OutputFcn',  @BED_calculator_OutputFcn, ...
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


% --- Executes just before BED_calculator is made visible.
function BED_calculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BED_calculator (see VARARGIN)

% Choose default command line output for BED_calculator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes1)
plot([100 0],[0 100],'--r','linewidth',1)
hold on
plot([0 100],[0 0],'k','linewidth',2)
plot([0 0],[0 100],'k','linewidth',2)
set(gca,'TickDir','out')
set(gca,'XMinorTick','on')
set(gca,'ticklength',2*get(gca,'ticklength'))
hold off
xlabel('$BED_1 (\%)$','Interpreter','LaTex')
ylabel('$BED_2 (\%)$','Interpreter','LaTex')
set(gca,'ticklength',2*get(gca,'ticklength'))
axis equal
axis([0 100 0 100])
% Find all static text UICONTROLS whose 'Tag' starts with latex_
handles.laxis = axes('parent',hObject,'units','normalized','position',[0 0 1 1],'visible','off');
lbls= findobj(hObject,'-regexp','tag','Latex_*');
% lbls(:,2) = findobj(hObject,'-regexp','tag','bar_bed_text');
for i=1:length(lbls)
    l = lbls(i);
    set(l,'units','normalized');
    s = get(l,'string');
    p = get(l,'position');
    t = get(l,'tag');
    delete(l);
    handles.(t) = text(p(1),p(2),s,'interpreter','latex','horizontalalignment','left','fontsize',11);
end

guidata(hObject, handles);

% addpath('C:\Users\Thomas Woolley - Ad\Dropbox\EF')
%export_fig(gcf,'FigureB1.tiff','-r300');


% UIWAIT makes BED_calculator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BED_calculator_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in Show_rodent_data.
function Show_rodent_data_Callback(hObject, eventdata, handles)
% hObject    handle to Show_rodent_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Show_rodent_data
Plotter(handles)



function Probability_level_Callback(hObject, eventdata, handles)
% hObject    handle to Probability_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Probability_level as text
%        str2double(get(hObject,'String')) returns contents of Probability_level as a double


% --- Executes during object creation, after setting all properties.
function Probability_level_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Probability_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Number_of_fractions_Callback(hObject, eventdata, handles)
% hObject    handle to Number_of_fractions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Number_of_fractions as text
%        str2double(get(hObject,'String')) returns contents of Number_of_fractions as a double


% --- Executes during object creation, after setting all properties.
function Number_of_fractions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Number_of_fractions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha_beta_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_beta as text
%        str2double(get(hObject,'String')) returns contents of alpha_beta as a double


% --- Executes during object creation, after setting all properties.
function alpha_beta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Initial_dose_Callback(hObject, eventdata, handles)
% hObject    handle to Initial_dose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Initial_dose as text
%        str2double(get(hObject,'String')) returns contents of Initial_dose as a double


% --- Executes during object creation, after setting all properties.
function Initial_dose_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Initial_dose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calculate_button.
function Calculate_button_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Plotter(handles)





% --- Executes on slider movement.
function Slider_s0_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_s0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.s0_value,'String',num2str(round(100*get(hObject,'Value'))/100));
Plotter(handles)

% --- Executes during object creation, after setting all properties.
function Slider_s0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_s0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Slider_s1_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.s1_value,'String',num2str(round(100*get(hObject,'Value'))/100));
Plotter(handles)

% --- Executes during object creation, after setting all properties.
function Slider_s1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Slider_BED_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_BED (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.BED_value,'String',num2str(round(get(hObject,'Value'))));
Plotter(handles)

% --- Executes during object creation, after setting all properties.
function Slider_BED_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_BED (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Number_of_years_Callback(hObject, eventdata, handles)
% hObject    handle to Number_of_years (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.Time_value,'String',num2str(round(10*get(hObject,'Value'))/10));
Plotter(handles)

% --- Executes during object creation, after setting all properties.
function Number_of_years_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Number_of_years (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [BEDs,Dtol,Dtol_human]=BED_calc(D0,d,alpha_beta,p,Conservative_value,options);
Gammas_and_doses
f=@(d,g,d50)1/2*(1+erf(1/sqrt(2)*(g/d50*(d-d50))));
% Shift=fzero(@(C) 0.01-f(54.8+C,gamma0,d500),6,options); %Shift to ensure that when p=0.01, Conservative_value=0 then dose is 54.

Iv=55;
dh=54.8;
dm=fzero(@(d) 0.01-f(d,gamma0,d500),Iv,options);
d1=fzero(@(d) 0.01-f(d,gamma1,d501),Iv,options);
d2=fzero(@(d) 0.01-f(d,gamma2,d502),Iv,options);
d3=fzero(@(d) 0.01-f(d,gamma3,d503),Iv,options);


Iv=6;
Shiftch=fzero(@(C) 0.01-f(C+(1-Conservative_value/100)*dh,gamma0,d500),Iv,options);
Shiftc=fzero(@(C) 0.01-f(C+(1-Conservative_value/100)*dm,gamma0,d500),Iv,options);
Shift1=fzero(@(C) 0.01-f(C+(1-Conservative_value/100)*d1,gamma1,d501),Iv,options);
Shift2=fzero(@(C) 0.01-f(C+(1-Conservative_value/100)*d2,gamma2,d502),Iv,options);
Shift3=fzero(@(C) 0.01-f(C+(1-Conservative_value/100)*d3,gamma3,d503),Iv,options);

Dtol_human = fzero(@(D) p-f(D+Shiftch,gamma0,d500),48.6,options);
2*Dtol_human;
Dtol = fzero(@(D) p-f(D+Shiftc,gamma0,d500),50,options);
2.1*Dtol;
D1 = fzero(@(D) p-f(D+Shift1,gamma1,d501),50,options);
D2 = fzero(@(D) p-f(D+Shift2,gamma2,d502),50,options);
D3 = fzero(@(D) p-f(D+Shift3,gamma3,d503),50,options);

BED1_pc_human=D0*(1+d/alpha_beta)/(Dtol_human*2)*100;
BED1_pc=44/Dtol*100;
BED21_pc=D1/Dtol*100;
BED22_pc=D2/Dtol*100;
BED23_pc=D3/Dtol*100;

BEDs.BED1_pc_human=BED1_pc_human;
BEDs.BED1_pc=BED1_pc;
BEDs.BED21_pc=BED21_pc;
BEDs.BED22_pc=BED22_pc;
BEDs.BED23_pc=BED23_pc;

function p=p_calc(Nom_val,options,Conservative_value)
Gammas_and_doses
f=@(d,g,d50)1/2*(1+erf(1/sqrt(2)*(g/d50*(d-d50))));
% Shift=fzero(@(C) 0.01-f(54.8+C,gamma0,d500),6,options); %Shift to ensure that when p=0.01, Conservative_value=0 then dose is 54.

Iv=55;
dh=54.8;
Iv=6;
Shiftch=fzero(@(C) 0.01-f(C+(1-Conservative_value/100)*dh,gamma0,d500),Iv,options);

p=f(Nom_val/2+Shiftch,gamma0,d500);

function [B1_plot,B2_plot,BED2_hum]=r_calc(BEDs,B_star,s0,s1,td,t,options);
h=@(B1,B_star,r,s0,s1)1/2*(1+tanh(s0*(B1-B_star/(1+s1*r))));
B2=@(B1,B_star,r,s0,s1)100*(1-B1/100).*(1+h(B1,B_star,r,s0,s1).*((1-B1/100).^(-r/(1+r))-1));
flag1=0;flag2=0;flag3=0;
IC1=1;IC2=20;IC3=50;
r1=-1;r2=-1;r3=-1;

while (flag1<1||r1<0)&&IC1<100
    [r1,FV1,flag1]=fzero(@(r)BEDs.BED21_pc-B2(BEDs.BED1_pc,B_star,r,s0,s1),IC1,options);
    IC1=IC1+1;
end

while (flag2<1||r2<0)&&IC2<100
    [r2,FV2,flag2]=fzero(@(r)BEDs.BED22_pc-B2(BEDs.BED1_pc,B_star,r,s0,s1),IC2,options);
    IC2=IC2+1;
end

while (flag3<1||r3<0)&&IC3<100
    [r3,FV3,flag3]=fzero(@(r)BEDs.BED23_pc-B2(BEDs.BED1_pc,B_star,r,s0,s1),IC3,options);
    IC3=IC3+1;
end

a=td*(3*r1*td^2-3*r2*td^2+r3*td^2-15*r1*td+12*r2*td-3*r3*td+18*r1-9*r2+2*r3)/(td^3-6*td^2+11*td-6);
b=-(1/2)*(5*r1*td^3-8*r2*td^3+3*r3*td^3-19*r1*td^2+26*r2*td^2-7*r3*td^2+36*r1-18*r2+4*r3)/(td^3-6*td^2+11*td-6);
c=(1/2)*(r1*td^3-2*r2*td^3+r3*td^3-19*r1*td+26*r2*td-7*r3*td+30*r1-24*r2+6*r3)/(td^3-6*td^2+11*td-6);
d=-(1/2)*(r1*td^2-2*r2*td^2+r3*td^2-5*r1*td+8*r2*td-3*r3*td+6*r1-6*r2+2*r3)/(td^3-6*td^2+11*td-6);

r=@(t)(a+b*t+c*t.^2+d*t.^3).*(t>td);%.*(t<3)+(a+b*3+c*3^2+d*3^3).*(t>=3);

B1_plot=linspace(0,100,1e4);
B2_plot=B2(B1_plot,B_star,r(t),s0,s1);
BED2_hum=B2(BEDs.BED1_pc_human,B_star,r(t),s0,s1);


function Plotter(handles)

options=optimset('Display','off','tolx',1e-16,'tolfun',1e-16);
n=ceil(abs(str2num(get(handles.Number_of_fractions,'String'))));
nr=ceil(abs(str2num(get(handles.Number_of_fractions_retreat,'String'))));
D0=abs(str2num(get(handles.Initial_dose,'String')));
alpha_beta=abs(str2num(get(handles.alpha_beta,'String')));
Prob_or_BED=get(handles.radiobutton4,'Value');
t=str2num(get(handles.Time_value,'String'));

s0=round(100*str2num(get(handles.s0_value,'String')))/100;
s1=round(100*str2num(get(handles.s1_value,'String')))/100;
B_star=round(100*str2num(get(handles.BED_value,'String')))/100;
td=70/365;

Conservative_value=str2num(get(handles.Conservative_value,'String'));

if Prob_or_BED==1
    p=abs(str2num(get(handles.Probability_level,'String')))/100;
else
    Nom_val=abs(str2num(get(handles.Nominal_value,'String')));
    p=p_calc(Nom_val,options,Conservative_value);
end

set(handles.Probability_level,'String',num2str(100*p));
set(handles.Number_of_fractions,'String',num2str(n));
set(handles.Number_of_fractions_retreat,'String',num2str(nr));
set(handles.Initial_dose,'String',num2str(D0));
set(handles.alpha_beta,'String',num2str(alpha_beta));

d=D0/n;

[BEDs,Dtol,Dtol_human]=BED_calc(D0,d,alpha_beta,p,Conservative_value,options);
set(handles.dpf,'String',num2str(round(d*100)/100));

if BEDs.BED1_pc_human>100;
    set(handles.Latex_Warning,'String','WARNING: INITIAL DOSE OVER TOLERANCE');
    set(handles.Latex_p_Warning,'String','');
    
    set(handles.Calculate_BED1,'String','NA');
    set(handles.Calculate_BED2,'String','NA');
    
    set(handles.BED_rescale_1,'String','NA');
    set(handles.BED_rescale_2,'String','NA');
    
    set(handles.Calculate_BED1_fraction,'String','NA');
    set(handles.Calculate_BED2_fraction,'String','NA');
    set(handles.Calculate_dose_per_fraction,'String','NA');
    
elseif p>1
    
    set(handles.Latex_p_Warning,'String','WARNING: RISK GREATER THAN 99.9\%');
    set(handles.Latex_Warning,'String','');
    
    set(handles.Calculate_BED1,'String','NA');
    set(handles.Calculate_BED2,'String','NA');
    
    set(handles.BED_rescale_1,'String','NA');
    set(handles.BED_rescale_2,'String','NA');
    
    set(handles.Calculate_BED1_fraction,'String','NA');
    set(handles.Calculate_BED2_fraction,'String','NA');
    
    set(handles.Calculate_dose_per_fraction,'String','NA');
else
    [B1_plot,B2_plot,BED2_hum]=r_calc(BEDs,B_star,s0,s1,td,t,options);
    
    set(handles.Latex_Warning,'String','');
    set(handles.Latex_p_Warning,'String','');
    
    if Prob_or_BED==1
        set(handles.Probability_level,'String',num2str(100*p));
        set(handles.Nominal_value,'String',num2str(round(Dtol_human*2*100)/100));
    else
        set(handles.Probability_level,'String',num2str(100*round(1e4*p)/1e4));
        set(handles.Nominal_value,'String',num2str(Nom_val));
    end
    
    set(handles.Calculate_BED1,'String',num2str(round(BEDs.BED1_pc_human*Dtol_human*2)/100));
    set(handles.Calculate_BED2,'String',num2str(round(BED2_hum*Dtol_human*2)/100));
    
    set(handles.BED_rescale_1,'String',num2str(round(Dtol_human*2*100)/100));
    set(handles.BED_rescale_2,'String',num2str(round(Dtol_human*2*100)/100));
    
    set(handles.Calculate_BED1_fraction,'String',num2str(round(BEDs.BED1_pc_human*100)/100));
    set(handles.Calculate_BED2_fraction,'String',num2str(round(BED2_hum*100)/100));
    
    set(handles.Calculate_dose_per_fraction,'String',...
        num2str(round(   100*(-nr+sqrt(2*BED2_hum*Dtol_human*2/100*nr+nr^2))/nr  )/100));
    
    axes(handles.axes1)
    plot(B1_plot,B2_plot,'linewidth',1)
    hold on
    plot(BEDs.BED1_pc,BEDs.BED21_pc,'bO','MarkerFaceColor','b','linewidth',1)
    plot(BEDs.BED1_pc,BEDs.BED22_pc,'gO','MarkerFaceColor','g','linewidth',1)
    plot(BEDs.BED1_pc,BEDs.BED23_pc,'rO','MarkerFaceColor','r','linewidth',1)
    
    plot(BEDs.BED1_pc_human,BED2_hum,'kX','linewidth',1)
    plot([BEDs.BED1_pc_human BEDs.BED1_pc_human],[0 BED2_hum],'k','linewidth',1)
    plot([0 BEDs.BED1_pc_human],[BED2_hum BED2_hum],'k','linewidth',1)
    plot([100 0],[0 100],'--r','linewidth',1)
    axis equal
    axis([0 100 0 100])
    
    Toggle=get(handles.Show_rodent_data,'Value');
    if Toggle==1
        Rodent_data_points
        plot([100 0],[0 100],'--r',...
            BED1_morrisxb,BED2_morrisxb,'r*',...
            BED1_morrisbb,BED2_morrisbb,'rs',...
            BED1_wong140,BED2_wong140,'rd',...
            BED1_wong196,BED2_wong196,'r^',...
            BED1_wong93,BED2_wong93,'r+',...
            BED1_vd_Kogel1982,BED2_vd_Kogel1982,'rx',...
            BED1_vd_Kogel1991,BED2_vd_Kogel1991,'rv','linewidth',1);
    end
    
    

hold on
plot([0 100],[0 0],'k','linewidth',2)
plot([0 0],[0 100],'k','linewidth',2)
set(gca,'TickDir','out')
set(gca,'XMinorTick','on')
set(gca,'ticklength',2*get(gca,'ticklength'))
hold off
xlabel('$BED_1 (\%)$','Interpreter','LaTex')
ylabel('$BED_2 (\%)$','Interpreter','LaTex')
set(gca,'ticklength',2*get(gca,'ticklength'))
axis equal
axis([0 100 0 100])
    % set(gcf,'PaperPositionMode','auto')
    % set(gcf,'Color',.8*[1 1 1]);
    % addpath('C:\Users\Thomas Woolley - Ad\Dropbox\EF')
    %export_fig(gcf,'FigureB3.tiff','-r300');
    
end


function Original_tol_Callback(hObject, eventdata, handles)
% hObject    handle to Original_tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Original_tol as text
%        str2double(get(hObject,'String')) returns contents of Original_tol as a double


% --- Executes during object creation, after setting all properties.
function Original_tol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Original_tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Conservative_slider_Callback(hObject, eventdata, handles)
% hObject    handle to Conservative_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.Conservative_value,'String',num2str(round(100*get(hObject,'Value'))/100));
Plotter(handles)

% --- Executes during object creation, after setting all properties.
function Conservative_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Conservative_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Number_of_fractions_retreat_Callback(hObject, eventdata, handles)
% hObject    handle to Number_of_fractions_retreat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Number_of_fractions_retreat as text
%        str2double(get(hObject,'String')) returns contents of Number_of_fractions_retreat as a double


% --- Executes during object creation, after setting all properties.
function Number_of_fractions_retreat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Number_of_fractions_retreat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Nominal_value_Callback(hObject, eventdata, handles)
% hObject    handle to Nominal_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nominal_value as text
%        str2double(get(hObject,'String')) returns contents of Nominal_value as a double


% --- Executes during object creation, after setting all properties.
function Nominal_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nominal_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4

set(handles.radiobutton5,'Value',~get(handles.radiobutton4,'Value'))
set(handles.Probability_level,'String','1')
set(handles.Nominal_value,'String','')

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set(handles.radiobutton4,'Value',~get(handles.radiobutton5,'Value'))
set(handles.Nominal_value,'String','109.6')
set(handles.Probability_level,'String','')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
