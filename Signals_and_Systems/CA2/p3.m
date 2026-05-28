clear all;
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
temp=[path,file];
picture=imread(temp);
flag_template=imread('.\p3\FLAG_TEMP.png');
picture=imresize(picture,[800 NaN]);
figure;
imshow(picture)
title('عکس ریسایز شده');

[width_flag_template ,height_flag_template] = size(flag_template);

R_corl = normxcorr2(flag_template(:,:,1), picture(:,:,1));
G_corl = normxcorr2(flag_template(:,:,2), picture(:,:,2));
B_corl = normxcorr2(flag_template(:,:,3), picture(:,:,3));

corl = (0.25*R_corl + 0.25*G_corl + 0.5*B_corl);
[max_corl_value, max_corl_index] = max(corl(:));
[max_corl_row, max_corl_col] = ind2sub(size(corl), max_corl_index);
figure;
imshow(picture);
xLEFT_flag_template = max_corl_col;
yDOWN_flag_template = max_corl_row;
rectangle('Position', [xLEFT_flag_template-width_flag_template, yDOWN_flag_template-height_flag_template, width_flag_template, height_flag_template], 'EdgeColor', 'y');
title('پرچم شناسایی شده');



plate_width=800 / 1.9 ;
plate_height=height_flag_template*1.5;
rectangle('Position', [xLEFT_flag_template-width_flag_template+20,yDOWN_flag_template-height_flag_template+13,plate_width,plate_height], 'EdgeColor', 'r');

plate=imcrop(picture,[xLEFT_flag_template-width_flag_template+20,yDOWN_flag_template-height_flag_template+13,plate_width,plate_height]);
imshow(plate)
title(' تصویر پلاک برای شناسایی')
figure

%% استفاده از کد p2

picture=imresize(plate,[200 600]);
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
    
    % Extract the region and resize it  
    Y = pic_back_rem(min(r):max(r), min(c):max(c));    
    Y = imresize(Y, [100, 80]);  % Ensure Y has the same dimensions  
    
    if isempty(Y)  
        continue;   
    end  
    
    ro = zeros(1, totalLetters);  
    

    for k = 1:totalLetters   
        trainingImage = imresize(TRAINF{1, k}, [100, 80]);  % Resize to match Y  
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

