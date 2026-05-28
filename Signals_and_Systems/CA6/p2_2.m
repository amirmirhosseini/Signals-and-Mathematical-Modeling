clear all;
clc;

T = 0.55;
fs = 8000;
dlytime = 0.025;

C = 523.25;
Cs = 554.37;
D = 587.33;
Ds = 622.25;
E = 659.25;
F = 698.46;
Fs = 739.99;
G = 783.99;
Gs = 830.61;
A = 880;
As = 932.33;
B = 987.77;

melody = [ 
    C T; C T; G T; G T; A T; A T; G 2*T;
    F T; F T; E T; E T; D T; D T; C 2*T;
    G T; G T; F T; F T; E T; E T; D 2*T;
    G T; G T; F T; F T; E T; E T; D 2*T;
    C T; C T; G T; G T; A T; A T; G 2*T;
    F T; F T; E T; E T; D T; D T; C 2*T;
];


y = [];
for i = 1:size(melody, 1)
    freq = melody(i,1);
    dur = melody(i,2);
    y = [y piano_note(freq, dur) delay(dlytime)];
end

sound(y, fs);

filename = 'twinkle_twinkle.wav'; 
audiowrite(filename, y, fs);




function dly = delay(dlytime)
    fs=8000;
    t = 0:1/fs:dlytime-1/fs;
    dly = zeros(size(t));
end

function note = piano_note(fc , duration )
    fs=8000;
    t= 0:1/fs:duration-1/fs ;
    note = sin(2*pi*fc*t);
end
