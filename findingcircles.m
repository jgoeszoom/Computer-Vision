clear all;
close all;
clc;

for a = 1:5
    %1-32 are the files to used
    filename = ['C:\Users\josep\Desktop\Project\CV_DATA\mono\' num2str(a) '.JPG'];    %Used to loop through all files
    img = imread(filename);
    TEMP = img;
    img = rgb2gray(img);    %Grayscaled version of image

    %============== Finding the circles in the Dice ===========================
    threshold = graythresh(img);                    %Finds optimal threshold for binarization
    BW = imcomplement(imbinarize(img, threshold));  %Thresholds images and inverts it
    BW = bwareaopen(BW, 600);                       %Removes small objects from image
    
    %Connected components
    CC = bwconncomp(BW);                                          
    stats = regionprops('table', CC, 'Centroid', 'Eccentricity', 'MajorAxisLength', 'MinorAxisLength');     

    %Finds the circles of interests
    c = stats.Centroid;
    cnt = 0;
    centers = zeros(length(stats.Centroid), 2);
    diameters = zeros(length(stats.MajorAxisLength), 1);
    for i = 1: length(stats.Eccentricity)
        if (stats.Eccentricity(i,1) <= 0.28)
            centers(i, 1) = c(i, 1);
            centers(i, 2) = c(i, 2);
            diameters(i, 1) = mean([stats.MajorAxisLength(i,1) stats.MinorAxisLength(i,1)],2);
            cnt = cnt + 1;
        end
    end
    radii = diameters/2; 

    %Overlays some information on image
    cnt = num2str(cnt);
    I_ovrlay = insertText(TEMP, [0, 0], cnt, 'FontSize', 200, 'BoxColor', 'red', 'BoxOpacity', 1.0, 'TextColor', 'white'); 
    figure, imshow(I_ovrlay), title('GAMEBOARD');
    hold on
    viscircles(centers,radii);
    hold off
end