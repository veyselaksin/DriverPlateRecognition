clc, clear all, close all;

% Simple Text Recognation app.
% author: Veysel AKSIN
% github: @lainnyone
% twitter: @veyselaksinn

% Before going into code you should create training dataset. 
% Go CreateTrainigDatas.m file and run once


%% File selection process to users but before we must load imagefilldata
load imagefilldata

[file, filePath]=uigetfile({'*.png; *.jpeg; *.tif; *.bmp; *.jpg'}, 'Choose a image');

file=[filePath,file]; % getting image path

image=imread(file); % get image

[~, width]=size(image); % get image size

image=imresize(image, [300,500]); % the image we receive is resized

% we will gray to image if image is rgb
if size(image, 3)== 3 
    image=rgb2gray(image);
end

figure, imshow(image), title('Original Image');

%% determine greyness level of image

treshold=graythresh(image);
image=imbinarize(image, treshold);
figure, imshow(image), title('Black and White Image'); 

imageReverse=~image;
figure, imshow(imageReverse), title('Black and White Reversed Image');

%% noise removable
% Remove noise with bwareaopen function of matlab, We are using this function,
% because, we don't need non-chracter object
if width> 2000
    imageTemp=bwareaopen(imageReverse,3500);
else
    imageTemp=bwareaopen(imageReverse, 3000);
end
%% Figure Cleaned Image and Extracted Image 
% Show cleaned and extracted image for understand to better what we doing
figure, imshow(imageTemp),title('Cleaned Image'); %Cleaned Image

imageTemp2=imageReverse-imageTemp;
imageTemp2=bwareaopen(imageTemp2,250);
figure, imshow(imageTemp2), title('Extracted Image from Cleaned Image'); % Extracted image

%% Tag letters with object tag
% We are tagging each object with reionprops function
[labels, objects]=bwlabel(imageTemp2);
objectFeatures=regionprops(labels,'BoundingBox');

hold on 

pause(1);

for n=1:size(objectFeatures,1)
    rectangle('Position',objectFeatures(n).BoundingBox, 'EdgeColor','y','LineWidth',2);
end

hold off
%% Finally operation
% Now all driver plate values to keep in final array
final=[];
% t array is holds the correlation value of each object
t=[];

for n=1:objects
    [r,c]=find(labels==n)
    character=imageReverse(min(r):max(r), min(c):max(c)); % keep to image max and min values for readed all char
    character=imresize(character,[42,24]);
    figure, imshow(character), title('Character'); % we are showing keeped all character
    
    pause(0.5); % show characters every 0.5 second
    
    x=[];
    % Find number of chracter
     characterNumber=size(images,2);
     % We make comparisons and obtain correlation values.
      for k=1: characterNumber
        y=corr2(images{1,k},character)
        x=[x y]
      end  
     t=[t max(x)];
     % We delete characters with correlation values below 0.4
     if max(x)>0.4
        % We look at which character it matches and print that character
        maxIndex=find(x==max(x));
        %We are printing all character as a string
        finalChar=cell2mat(images(2,maxIndex))
        final=[final, finalChar]
     end
end
