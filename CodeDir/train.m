addpath(data_directory);
addpath(code_directory);
addpath(training_directory);


load trainingdata

number = 1000;
face_horizontal = 100;
face_vertical = 100;
face_size = [100 100];
weak_classifiers = cell(1, number);
for i = 1:number
    weak_classifiers{i} = generate_classifier(face_vertical, face_horizontal);
end

face_horizontal = 100;
face_vertical = 100;
face_size = [100 100];

% precompute responses of all training examples on all weak classifiers
example_number = size(trainingFaces, 3) + size(trainingNonFaces, 3);
labels = zeros(example_number, 1);
labels (1:size(trainingFaces, 3)) = 1;
labels((size(trainingFaces, 3)+1):example_number) = -1;
examples = zeros(face_vertical, face_horizontal, example_number);
examples (:, :, 1:size(trainingFaces, 3)) = face_integrals;
examples(:, :, (size(trainingFaces, 3)+1):example_number) = non_face_integrals;

classifier_number = numel(weak_classifiers);

responses =  zeros(classifier_number, example_number);

for example = 1:example_number
    integral = examples(:, :, example);
    for feature = 1:classifier_number
        classifier = weak_classifiers {feature};
        responses(feature, example) = eval_weak_classifier(classifier, integral);
    end
    disp(example)
end

%use AdaBoost for strong classifiers
boosted_classifier = AdaBoost(responses, labels, 25);


