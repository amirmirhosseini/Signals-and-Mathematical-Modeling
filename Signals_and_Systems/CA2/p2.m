clear all;
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
img=[path,file];

picture=imread(img);
picture=imresize(picture,[200 600]);
subplot(3,2,1);
imshow(picture)
title('Resized');

picture=rgb2gray(picture);
subplot(3,2,2)
imshow(picture)
title('Graysclaed');


threshold = graythresh(picture);
picture =~imbinarize(picture,threshold);
subplot(3,2,3)
imshow(picture)
title('Binarized');

picture_removed_trash = bwareaopen(picture,450);
subplot(3,2,4)
imshow(~picture_removed_trash)
title('Cleared');
backgroud=bwareaopen(picture_removed_trash,6000);
subplot(3,2,5)
imshow(backgroud)
title('Background');
pic_back_rem=picture_removed_trash-backgroud;

subplot(3,2,6)
imshow(pic_back_rem)
title('Rectangled');
[L,Ne]=bwlabel(pic_back_rem);
propied=regionprops(L,'BoundingBox');
hold on
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','r','LineWidth',2)
end
hold off

load TRAININGSET2;
totalLetters=size(TRAINF,2);

final_output = [];  
t = [];  
for n = 1:Ne  
    [r, c] = find(L == n);  
    
    Y = pic_back_rem(min(r):max(r), min(c):max(c));    
    Y = imresize(Y, [100, 80]);  % Ensure Y has the same dimensions  
    
    if isempty(Y)  
        continue;   
    end  
    
    ro = zeros(1, totalLetters);  
    

    for k = 1:totalLetters   
        trainingImage = imresize(TRAINF{1, k}, [100, 80]);  
        ro(k) = corr2(trainingImage, Y); 
        disp(ro(k));
    end  
    if abs(ro(3)-ro(4))<0.1
        ro(3)=ro(3)+0.1;
    end
    [MAXRO, pos] = max(ro);  
    if MAXRO > 0.45  
        out = cell2mat(TRAINF(2, pos));       
        final_output = [final_output out];  
    end  
end  

file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);
winopen('number_Plate.txt')

