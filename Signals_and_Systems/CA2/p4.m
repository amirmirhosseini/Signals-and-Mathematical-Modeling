clear all;  
video = VideoReader("p4_video.mp4");  
frame_numbers = [138, 150]; 
frames = read(video, frame_numbers);   


figure;  
for idx = 1:2  
    subplot(2, 2, idx);  
    imshow(frames(:, :, :, idx));  
end  


template_image=imread('.\p3\FLAG_TEMP.png');




plate_sizes = [26, 40; 12, 15];  
num_sizes = size(plate_sizes, 1);  
correlation_values = zeros(1, num_sizes);  
positions = zeros(1, num_sizes);  

for size_idx = 1:num_sizes  

    resized_template = imresize(template_image, plate_sizes(size_idx, :));   
    corr_map = zeros(1, (1280 - plate_sizes(size_idx, 2) + 1) * (720 - plate_sizes(size_idx, 1) + 1));  
    

    grayscale_template = rgb2gray(resized_template); 
    for i = 1:(720 - plate_sizes(size_idx, 1) + 1)  
        for j = 1:(1280 - plate_sizes(size_idx, 2) + 1)  
            region = frames(i:i + plate_sizes(size_idx, 1) - 1, j:j + plate_sizes(size_idx, 2) - 1, :, 1);
            grayscale_region = rgb2gray(region); 
            corr_map((i - 1) * (1280 - plate_sizes(size_idx, 2) + 1) + j) = corr2(double(grayscale_region), double(grayscale_template));  
        end  
    end  

    [correlation_values(size_idx), positions(size_idx)] = max(corr_map); 
end  

[max_corr_value, best_size_index] = max(correlation_values);  
best_position = positions(best_size_index);  
j = mod(best_position, 1280 - plate_sizes(best_size_index, 2) + 1);  
i = (best_position - j) / (1280 - plate_sizes(best_size_index, 2) + 1);  
license_plate1 = frames(i:i + plate_sizes(best_size_index, 1) - 1, j:j + plate_sizes(best_size_index, 2) - 1, :, 1);  
subplot(2, 2, 3);  
imshow(license_plate1);   
%%% کد اینجا گیر می‌کند

for size_idx = 1:num_sizes  

    resized_template = imresize(template_image, plate_sizes(size_idx, :));   
    corr_map = zeros(1, (1280 - plate_sizes(size_idx, 2) + 1) * (720 - plate_sizes(size_idx, 1) + 1));  
   
    grayscale_template = rgb2gray(resized_template); 
    for i = 1:(720 - plate_sizes(size_idx, 1) + 1)  
        for j = 1:(1280 - plate_sizes(size_idx, 2) + 1)  
            region = frames(i:i + plate_sizes(size_idx, 1) - 1, j:j + plate_sizes(size_idx, 2) - 1, :, 2); 
            corr_map((i - 1) * (1280 - plate_sizes(size_idx, 2) + 1) + j) = corr2(double(grayscale_region), double(grayscale_template));  
        end  
    end  

    [correlation_values(size_idx), positions(size_idx)] = max(corr_map);   
end  

 