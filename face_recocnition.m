% taking the image input

img = imread('E:\face_detection\sample image\8.JPEG');
figure,imshow(img), title('original image');

% get face detector object
%basically the algorithm for detecting face which is a inbuild function

FaceDetector = vision.CascadeObjectDetector();

%FaceDetector = vision.CascadeObjectDetector('Mouth');

%FaceDetector = vision.CascadeObjectDetector('EyePairSmall');

% FaceDetector.MergeThreshold = 15;

% using face detector on the given image

BBOX = step(FaceDetector, img);

% Annotate these faces on the top of the image

B = insertObjectAnnotation(img, 'rectangle', BBOX, 'face');

%B = insertObjectAnnotation(img, 'rectangle', BBOX, 'Mouth');

%B = insertObjectAnnotation(img, 'rectangle', BBOX, 'Eye');

figure, imshow(B), title('face detected image');


