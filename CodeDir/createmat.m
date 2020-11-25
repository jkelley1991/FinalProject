addpath data_directory
addpath code_directory
addpath training_directory


myFolder = 'C:\Users\Josh\Documents\FinalProject\TrainingData\training_test_data\test_cropped_faces';
if ~isfolder(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, '*.bmp');
bmpFiles = dir(filePattern);
result = zeros(100,100,length(bmpFiles));
for k = 1:length(bmpFiles)
    
  baseFileName = bmpFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  trainingfaces = imread(fullFileName);
  result(:,:,k) = trainingfaces;
  %imshow(imageArray);  % Display image.
  drawnow; % Force display to update immediately.
  
end

save C:\Users\Josh\Documents\FinalProject\training_faces770.mat result