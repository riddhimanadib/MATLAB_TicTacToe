function []=tictactoe()

%We're trying to create a simple tic-tac-toe game.

S.f=figure('units','pixels',...                 %creating figure
    'position',[500 300 500 400],...
    'menubar','none',...
    'numbertitle','off',...
    'name','ticatactoe',...
    'resize','off');

%button group 1
S.bg1=uibuttongroup('units','pixels',...
    'position',[90 80 320 170],...
    'visible','on',...
    'Tag','1');
S.p1=uicontrol(S.bg1,...
    'style','push',...               %'single player' pushbutton
    'units','pixels',...
    'position',[10 130 300 30],...
    'fontsize',15,...
    'string','Single Player',...
    'callback',{@p1_call,S});
S.p2=uicontrol(S.bg1,...
    'style','push',...               %'double player' pushbutton
    'units','pixels',...
    'position',[10 90 300 30],...
    'fontsize',15,...
    'string','Double Player',...
    'callback',{@p2_call,S});
S.p3=uicontrol(S.bg1,...
    'style','push',...               %'Credits' pushbutton
    'units','pixels',...
    'position',[10 50 300 30],...
    'fontsize',15,...
    'string','Credits',...
    'callback',{@p3_call,S});
S.p4=uicontrol(S.bg1,...
    'style','push',...               %'exit' pushbutton
    'units','pixels',...
    'position',[60 10 200 30],...
    'fontsize',15,...
    'string','Exit',...
    'callback',{@p4_call,S});


%button group 3
S.bg3=uibuttongroup('units','pixels',...
    'position',[60 40 240 240],...
    'visible','off',...
    'Tag','game');
S.pp(1)=uicontrol(S.bg3,...
    'style','push',...              %'pp1' pushbutton
    'units','pixels',...
    'position',[10 160 70 70],...
    'fontsize',15,...
    'callback',{@pp1_call,S});
S.pp(2)=uicontrol(S.bg3,...
    'style','push',...              %'pp2' pushbutton
    'units','pixels',...
    'position',[85 160 70 70],...
    'fontsize',15,...
    'callback',{@pp2_call,S});
S.pp(3)=uicontrol(S.bg3,...
    'style','push',...              %'pp3' pushbutton
    'units','pixels',...
    'position',[160 160 70 70],...
    'fontsize',15,...
    'callback',{@pp3_call,S});
S.pp(4)=uicontrol(S.bg3,...
    'style','push',...              %'pp4' pushbutton
    'units','pixels',...
    'position',[10 85 70 70],...
    'fontsize',15,...
    'callback',{@pp4_call,S});
S.pp(5)=uicontrol(S.bg3,...
    'style','push',...              %'pp5' pushbutton
    'units','pixels',...
    'position',[85 85 70 70],...
    'fontsize',15,...
    'callback',{@pp5_call,S});
S.pp(6)=uicontrol(S.bg3,...
    'style','push',...              %'pp6' pushbutton
    'units','pixels',...
    'position',[160 85 70 70],...
    'fontsize',15,...
    'callback',{@pp6_call,S});
S.pp(7)=uicontrol(S.bg3,...
    'style','push',...              %'pp7' pushbutton
    'units','pixels',...
    'position',[10 10 70 70],...
    'fontsize',15,...
    'callback',{@pp7_call,S});
S.pp(8)=uicontrol(S.bg3,...
    'style','push',...              %'pp8' pushbutton
    'units','pixels',...
    'position',[85 10 70 70],...
    'fontsize',15,...
    'callback',{@pp8_call,S});
S.pp(9)=uicontrol(S.bg3,...
    'style','push',...              %'pp9' pushbutton
    'units','pixels',...
    'position',[160 10 70 70],...
    'fontsize',15,...
    'callback',{@pp9_call,S});
set(S.pp(:),'callback',{@pp_call,S});


%button group 2
S.bg2=uibuttongroup('units','pixels',...
    'position',[140 60 220 200],...
    'visible','off',...
    'Tag','12');
S.rad1=uicontrol(S.bg2,...
    'style','rad',...               %'player1' radiobutton
    'units','pixels',...
    'position',[10 110 200 30],...
    'fontsize',12,...
    'Tag','p1name1',...
    'string','player1');
S.rad2=uicontrol(S.bg2,...
    'style','rad',...               %'Computer' radiobutton
    'units','pixels',...
    'position',[10 70 200 30],...
    'fontsize',12,...
    'Tag','p2name2',...
    'string','computer');
S.p7=uicontrol(S.bg2,...
    'style','push',...              %'ok2:player1' pushbutton
    'units','pixels',...
    'position',[95 10 30 30],...
    'fontsize',15,...
    'string','ok',...
    'callback',{@p7_call,S});
S.t3=uicontrol(S.bg2,...
    'style','text',...               %'Who plays first' text
    'units','pixels',...
    'position',[10 160 200 30],...
    'fontsize',15,...
    'string','Who plays first?');


%button group 4
S.bg4=uibuttongroup('units','pixels',...
    'position',[60 180 380 50],...
    'visible','off',...
    'Tag','11');
S.e1=uicontrol(S.bg4,...
    'style','edit',...               %'player1 name'
    'units','pixels',...
    'position',[10 10 300 30],...
    'fontsize',15,...
    'string','player 1');
S.p6=uicontrol(S.bg4,...
    'style','push',...               %'ok1:player1' pushbutton
    'units','pixels',...
    'position',[320 10 50 30],...
    'fontsize',15,...
    'string','ok',...
    'callback',{@p6_call,S});

%button group 5
S.bg5=uibuttongroup('units','pixels',...
    'position',[60 140 380 90],...
    'visible','off',...
    'Tag','21');
S.e2=uicontrol(S.bg5,...
    'style','edit',...               %'player1 name'
    'units','pixels',...
    'position',[10 50 300 30],...
    'fontsize',15,...
    'Tag','p1name2',...
    'string','player 1');
S.e3=uicontrol(S.bg5,...
    'style','edit',...               %'player2 name'
    'units','pixels',...
    'position',[10 10 300 30],...
    'fontsize',15,...
    'Tag','p2name2',...
    'string','player 2');
S.p8=uicontrol(S.bg5,...
    'style','push',...               %'ok1:player2' pushbutton
    'units','pixels',...
    'position',[320 30 50 30],...
    'fontsize',15,...
    'string','ok',...
    'callback',{@p8_call,S});



S.t1=uicontrol('style','text',...               %Title of game
    'units','pixels',...
    'position',[50 290 400 80],...
    'fontname','Comic Sans MS',...
    'fontsize',45,...
    'string','Tic-Tac-Toe');
S.t2=uicontrol('style','text',...               %'credits' text
    'units','pixels',...
    'position',[150 100 200 125],...
    'fontsize',15,...
    'string',{'Game prepared by:';'Azim';'Alam';'Adib';'Aditya'},...
    'Tag','3',...
    'visible','off');
S.t5=uicontrol('style','text',...               %'gametext' text
    'units','pixels',...
    'position',[325 140 150 60],...
    'fontsize',15,...
    'Tag','gametext',...
    'visible','off');




S.p5=uicontrol('style','push',...               %'Main menu' pushbutton
    'units','pixels',...
    'position',[335 15 150 40],...
    'fontsize',15,...
    'Tag','mm',...
    'string',{'Main Menu'},...
    'visible','off',...
    'callback',{@p5_call,S});









%function declaration starts from here

function []=p1_call(varargin)                   %'single player' button
set(findobj('Tag','1'),'visible','off')
set(findobj('Tag','mm'),'visible','on')
set(findobj('Tag','11'),'visible','on')
global playermode
playermode=1;

function []=p2_call(varargin)                   %'double player' button
set(findobj('Tag','1'),'visible','off')
set(findobj('Tag','mm'),'visible','on')
set(findobj('Tag','21'),'visible','on')
global playermode
playermode=2;

function []=p3_call(varargin)                   %'credits' button
set(findobj('Tag','1'),'visible','off')
set(findobj('Tag','3'),'visible','on')
set(findobj('Tag','mm'),'visible','on')

function []=p4_call(varargin)                   %'Exit' button
close;

function []=p5_call(varargin)                   %'Main Menu' button
S=varargin{3};
delete(S.f);
clear variables
tictactoe;

function []=p6_call(varargin)                   %'ok1:player1' button
S=varargin{3};
global str
str=get(S.e1,'string');
set(findobj('Tag','p1name1'),'string',str);
set(findobj('Tag','11'),'visible','off')
set(findobj('Tag','12'),'visible','on')

function []=p7_call(varargin)                   %'ok2:player1' button
S=varargin{3};
set(findobj('Tag','12'),'visible','off')
set(findobj('Tag','game'),'visible','on')

global mat player playermode str str1 str2 starter nos
mat=zeros(3);
player=3+get(S.rad1,'val');

if playermode==1
    if player==4
        a=str;
        b='''s turn';
        pname=horzcat(a,b);
        starter=1;
    elseif player==3
        pname='computer''s turn';
        starter=0;
    end
    nos=0;
elseif playermode==2
    if player==3
        a=str2;
    elseif player==4
        a=str1;
    end
    b='''s turn';
    pname=horzcat(a,b);
end

set(findobj('Tag','gametext'),'visible','on');
set(findobj('Tag','gametext'),'string',pname);

if playermode==1 && player==3
    pp_call;
end

function []=p8_call(varargin)                   %'ok1:player2' button
S=varargin{3};
global str1 str2
str1=get(S.e2,'string');
str2=get(S.e3,'string');
if strcmpi(str1,'rajinikanth')==1 && strcmpi(str2,'rajinikanth')==1
    set(findobj('Tag','p1name2'),'string','Two Rajinikanth can''t exist');
    set(findobj('Tag','p2name2'),'string','in one universe !!!!');
else
    set(findobj('Tag','p1name1'),'string',str1);
    set(findobj('Tag','p2name2'),'string',str2);
    set(findobj('Tag','21'),'visible','off');
    set(findobj('Tag','12'),'visible','on');
end

function []=pp_call(varargin)                   %'gameplay' buttons
pos=get(gcbo,'position');
y=ceil(pos(1)/75.0);
x=4.0-ceil(pos(2)/75.0);

global mat player str1 str2 playermode str starter nos

if playermode==2
    if mat(x,y)==0
        mat(x,y)=player;
        
        if player==3
            value='O';
            pname=str1;
            pname2=str2;
        elseif player==4
            value='X';
            pname=str2;
            pname2=str1;
        end
        pturn=[pname '''s turn'];
        set(gcbo,'string',value,...
            'fontsize',35)
        set(findobj('Tag','gametext'),'string',pturn)
        
        flag=0;
        for h=1:3
            check=mat(h,1)+mat(h,2)+mat(h,3);
            if check==(3*player)
                flag=1;
                break;
            end
            check=mat(1,h)+mat(2,h)+mat(3,h);
            if check==(3*player)
                flag=1;
                break;
            end
        end
        check=mat(1,1)+mat(2,2)+mat(3,3);
        if check==(3*player)
            flag=1;
        end
        check=mat(3,1)+mat(2,2)+mat(1,3);
        if check==(3*player)
            flag=1;
        end
        
        if flag==1
            if strcmpi('rajinikanth',pname)==1
                pname=[pname ' never loses!!!'];
            elseif strcmpi('rajinikanth',pname2)==1
                pname=[pname2 ' never loses!!!'];
            else
                pname=[pname2 ' wins'];
            end
            set(findobj('Tag','gametext'),'string',pname,'backg',[1 .6 .6]);
        end
        
        flag2=1;
        for i=1:3
            for j=1:3
                if mat(i,j)==0
                    flag2=0;
                    break;
                end
            end
            if flag2==0
                break;
            end
        end
        
        if flag2==1
            set(findobj('Tag','gametext'),'string','Match is draw','backg',[1 .6 .6]);
        end
        
        if flag==1 || flag2==1
            for i=1:3
                for j=1:3
                    if mat(i,j)==0
                        mat(i,j)=2;
                    end
                end
            end
        end
        
        player=7-player;
    end
elseif playermode==1
    finish=0;
    if mat(x,y)==0
        if starter==1;
            mat(x,y)=player;
            save(1)=x;
            save(2)=y;
            nos=nos+1;
        end
        starter=1;
        
        set(findobj('Tag','gametext'),'string','Computer''s turn');
        set(gcbo,'string','O','fontsize',35);
        
        flaag2=1;
        for i=1:3
            for j=1:3
                if mat(i,j)==0
                    flaag2=0;
                    break;
                end
            end
            if flaag2==0
                break;
            end
        end
        
        if flaag2==1
            if strcmpi('rajinikanth',str)==1
                pname=[str ' never loses!!!'];
                set(findobj('Tag','gametext'),'string',pname,'backg',[1 .6 .6]);
            else
                set(findobj('Tag','gametext'),'string','Match is draw','backg',[1 .6 .6]);
            end
            finish=1;
        end
        
        flag=0;
        for h=1:3
            check=mat(h,1)+mat(h,2)+mat(h,3);
            if check==(3*player)
                flag=1;
                break;
            end
            check=mat(1,h)+mat(2,h)+mat(3,h);
            if check==(3*player)
                flag=1;
                break;
            end
        end
        check=mat(1,1)+mat(2,2)+mat(3,3);
        if check==(3*player)
            flag=1;
        end
        check=mat(3,1)+mat(2,2)+mat(1,3);
        if check==(3*player)
            flag=1;
        end
        
        if flag==1
            if strcmpi('rajinikanth',str)==1
                pname=[str ' never loses!!!'];
            else
                pname=[str ' wins'];
            end
            set(findobj('Tag','gametext'),'string',pname,'backg',[1 .6 .6]);
            
            for i=1:3
                for j=1:3
                    if mat(i,j)==0
                        mat(i,j)=2;
                    end
                end
            end
            finish=1;
        end
        
        player=7-player;
        
        if finish==0
            m=0;
            n=0;
            if nos>0 || nos==0
                if nos >0
                    if nos>1
                        fgf=0;
                        for kl=4:-1:3
                            for h=1:3
                                if mat(h,1)==0 && mat(h,2)+mat(h,3)==2*kl
                                    m=h; n=1; fgf=1;
                                elseif mat(h,2)==0 && mat(h,1)+mat(h,3)==2*kl
                                    m=h; n=2; fgf=1;
                                elseif mat(h,3)==0 && mat(h,2)+mat(h,1)==2*kl
                                    m=h; n=3; fgf=1;
                                elseif mat(1,h)==0 && mat(2,h)+mat(3,h)==2*kl
                                    m=1; n=h; fgf=1;
                                elseif mat(2,h)==0 && mat(1,h)+mat(3,h)==2*kl
                                    m=2; n=h; fgf=1;
                                elseif mat(3,h)==0 && mat(2,h)+mat(1,h)==2*kl
                                    m=3; n=h; fgf=1;
                                end
                            end
                            
                            if mat(1,1)==0 && mat(2,2)+mat(3,3)==2*kl
                                m=1; n=1; fgf=1;
                            elseif mat(2,2)==0 && mat(1,1)+mat(3,3)==2*kl
                                m=2; n=2; fgf=1;
                            elseif mat(3,3)==0 && mat(2,2)+mat(1,1)==2*kl
                                m=3; n=3; fgf=1;
                            elseif mat(3,1)==0 && mat(2,2)+mat(1,3)==2*kl
                                m=3; n=1; fgf=1;
                            elseif mat(2,2)==0 && mat(3,1)+mat(1,3)==2*kl
                                m=2; n=2; fgf=1;
                            elseif mat(1,3)==0 && mat(2,2)+mat(3,1)==2*kl
                                m=1; n=3; fgf=1;
                            end
                            
                            if  fgf==1
                                break;
                            end
                        end
                    end
                    
                    if m==0 && n==0
                        if save(1)+1<4 && save(1)+1>0 && mat(save(1)+1,save(2))==0
                            m=save(1)+1;
                            n=save(2);
                        elseif save(1)-1<4 && save(1)-1>0 && mat(save(1)-1,save(2))==0
                            m=save(1)-1;
                            n=save(2);
                        elseif save(2)-1<4 && save(2)-1>0 && mat(save(1),save(2)-1)==0
                            m=save(1);
                            n=save(2)-1;
                        elseif save(2)+1<4 && save(2)+1>0 && mat(save(1),save(2)+1)==0
                            m=save(1);
                            n=save(2)+1;
                        end
                    end
                end
                if (m==0 && n==0)
                    m=round(1+2*rand());
                    n=round(1+2*rand());
                    
                    comflag=0;
                    while (comflag==0)
                        if mat(m,n)~=0
                            m=round(1+2*rand());
                            n=round(1+2*rand());
                        else
                            comflag=1;
                        end
                    end                    
                end
            end
            
            mat(m,n)=player;
            m_full=75*(n-1)+10;
            n_full=75*(3-m)+10;
            
            pause(1);
            set(findobj('position',[m_full n_full 70 70]),'string','X','fontsize',35);
            pname=[str '''s turn'];
            set(findobj('Tag','gametext'),'string',pname);
            
            flaag2=1;
            for i=1:3
                for j=1:3
                    if mat(i,j)==0
                        flaag2=0;
                        break;
                    end
                end
                if flaag2==0
                    break;
                end
            end
            
            if flaag2==1
                if strcmpi('rajinikanth',str)==1
                    pname=[str ' never loses!!!'];
                    set(findobj('Tag','gametext'),'string',pname,'backg',[1 .6 .6]);
                else
                    set(findobj('Tag','gametext'),'string','Match is draw','backg',[1 .6 .6]);
                end
            end
            
            flag2=0;
            for h=1:3
                check=mat(h,1)+mat(h,2)+mat(h,3);
                if check==3*player
                    flag2=1;
                    break;
                end
                check=mat(1,h)+mat(2,h)+mat(3,h);
                if check==3*player
                    flag2=1;
                    break;
                end
            end
            check=mat(1,1)+mat(2,2)+mat(3,3);
            if check==3*player
                flag2=1;
            end
            check=mat(3,1)+mat(2,2)+mat(1,3);
            if check==3*player
                flag2=1;
            end
            
            if flag2==1
                if strcmpi('rajinikanth',str)==1
                    pname=[str ' never loses!!!'];
                else
                    pname='Computer wins';
                end
                set(findobj('Tag','gametext'),'string',pname,'backg',[1 .6 .6]);
                
                for i=1:3
                    for j=1:3
                        if mat(i,j)==0
                            mat(i,j)=2;
                        end
                    end
                end
            end
            
            player=7-player;
        end
    end
end