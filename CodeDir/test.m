addpath(data_directory);
addpath(code_directory);
addpath(training_directory);
addpath C:\Users\Josh\Documents\FinalProject\TrainingData\training_test_data\test_face_photos

% load a photograph
photo = read_gray('Obama8.jpg');

result = boosted_detector_demo(photo, 1, boosted_classifier, weak_classifiers, [100 100],1);
figure(2); imshow(result, []);

% load a photograph
photo = read_gray('DSC04546.jpg');

result = boosted_detector_demo(photo, .5, boosted_classifier, weak_classifiers, [100 100],1);
figure(3); imshow(result, []);


% load a photograph
photo = read_gray('IMG_3793.jpg');

result = boosted_detector_demo(photo, 1, boosted_classifier, weak_classifiers, [100 100],4);
figure(4); imshow(result, []);