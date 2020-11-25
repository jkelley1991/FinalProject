
addpath(data_directory);
addpath(code_directory);
addpath(training_directory);


myFolder = 'C:\Users\Josh\Documents\FinalProject\TrainingData\training_test_data\training_nonfaces';
if ~isfolder(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, '*.jpg');
bmpFiles = dir(filePattern);

count = 1;
for k = 1:length(bmpFiles)
    
  baseFileName = bmpFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  trainingnonfaces = read_gray(fullFileName);
  for  r = 1:50:(size(trainingnonfaces,1) - 100)
          trainingNonFaces(:,:,count) = trainingnonfaces(r:r+99,1:100);
          %imshow(trainingNonFaces(:,:,count),[]); 
          count = count + 1;   
  end
  
end


myFolder = 'C:\Users\Josh\Documents\FinalProject\TrainingData\training_test_data\test_cropped_faces';
if ~isfolder(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, '*.bmp');
bmpFiles = dir(filePattern);
trainingFaces = zeros(100,100,770);
count = 1;
for k = 1:length(bmpFiles)
    
  baseFileName = bmpFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  trainingfaces = imread(fullFileName);
  trainingFaces(:,:,k) = trainingfaces;
end
% create integral image for faces
for i = 1:770
  face_integrals(:,:,i) = integral_image(trainingFaces(:,:,i));
end

%create integral images for non faces
for i = 1:size(trainingNonFaces,3)
  non_face_integrals(:,:,i) = integral_image(trainingNonFaces(:,:,i));
end


save C:\Users\Josh\Documents\FinalProject\trainingdata.mat trainingNonFaces trainingFaces face_integrals non_face_integrals