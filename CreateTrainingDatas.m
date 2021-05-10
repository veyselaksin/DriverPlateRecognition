clc, clear all, close all;

% Simple Text Recognation app.
% author: Veysel AKSIN
% github: @lainnyone
% twitter: @veyselaksinn


%% Let's include the image directory in the matlab environment
directory=dir('TrainingImages');

% We are getting name of files
fileNames={directory.name};

fileNames=fileNames(3:end);

% We are creating cell type areas for images what are 2 row and 62 column.
% Also we could created with matrix but this is too hard would be to us

images=cell(2, length(fileNames));

for i=1:length(fileNames)
    images(1,i)={imread(['TrainingImages','/',cell2mat(fileNames(i))])};
    
    % Create temp variable for getting first char of each files
    temp=cell2mat(fileNames(i));
    
    images(2,i)={temp(1)};
end

% Lastly we are saving all datas in images variable to imagefilldata.mat
save('imagefilldata.mat','images');