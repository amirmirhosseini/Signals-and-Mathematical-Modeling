clear all;
clc;
%%
T = 0.5;
t_total = 8*4*T;
t_total = t_total + 43*0.025;
fs = 8000;

D=587.33; 
E=659.25;
Fsharp = 739.99;
G=783.99;

dlytime = 0.025;

%%%%%%%%%
t = 0:1/fs:t_total - 1/fs;
y = ones(size(t));




current_end_time =T/2;
y(1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(G,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
%%%%% dashi male man nist donyaye pore bot pore tandis afsane mishe yerooz
%%%%% hata changiz
fprintf('%d %d %d' , current_end_time , current_begin_time , length(delay()));
y( current_begin_time*fs+1:current_end_time*fs+1 )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%

current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;

%%%

current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%

current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%

current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%


%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T/2;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(E,T/2);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%
current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%

current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(Fsharp,T);
current_begin_time = current_end_time;

current_end_time=current_end_time+dlytime;
y( current_begin_time*fs+1:current_end_time*fs )= delay();
current_begin_time=current_end_time;
%%%

current_end_time = current_end_time+T;
y( current_begin_time*fs+1:current_end_time*fs ) = piano_note(D,T);
current_begin_time = current_end_time;


%%%

sound(y, fs);
%%%%%%%
%%
yol = length(y);
notes = [ (D)  (E)  (Fsharp)  (G)];
times = [0 0 0 0];
begin_time=1;
end_time=0;
flag=0;
for i = 2:yol-1
   % fprintf("%d\n",i);
    if i==yol-1
        flag=1;
    end
    if ((y(i)==0 && y(i-1)~=0 && y(i+1) ==0)||flag==1)
        if flag==1
            i=yol+1;
        end
        end_time = i;
        timeplay = (end_time-begin_time)/8000;
        if flag==1
            end_time = end_time-1;
        end
        z = (y(begin_time:end_time));
        Z = fftshift(fft(z));
        ZS = length(Z);
        half_idx = (floor(ZS/2)+2):ZS;
        U = Z; %(half_idx);
        [maxVal , jdx] = max(U);
        fprintf("%d %d\n",timeplay,jdx);
        for k =1:4
            if round(jdx)==round(notes(k))
                times(k)=times(k)+timeplay;
            end
        end
    
%         flag=0;
    end
    if flag==1
        i=i-1;
    end
    if y(i)==0 && y(i+1)~=0  && y(i-1)==0
        
        begin_time = i;
        
    end
    
end
%%

function dly = delay()
    fs=8000;
    t = 0:1/fs:0.025-1/fs ;
    dly = zeros(size(t));
    %%%%
end

function note = piano_note(fc , duration )
    fs=8000;
    t= 0:1/fs:duration-1/fs ;
    x = sin(2*pi*fc*t);
    note = x;

end