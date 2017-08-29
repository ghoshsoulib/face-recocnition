clear;
clc;

% creating a detector object

faceDetector = vision.CascadeObjectDetector();

% FaceDetector.MergeThreshold = 15;

% read the input video

obj = imaq.VideoDevice('winvideo',2,'YUY2_320x240');
set(obj,'ReturnedColorSpace','rgb');

% preview object

figure('menubar','none','tag','webcam');

while(true)
    frame = step(obj);
    
    % detect face
    
    bboxes = step( faceDetector, frame);
    
    % annotate detected face
    
    Iface =  insertObjectAnnotation(frame, 'rectangle', bboxes, 'face');
    imshow(Iface, 'border', 'tight');
    f = findobj('tag', 'webcam');
    if(isempty(f))
        close(gcf);
        break
    end
    
    pause(0.05);
end

%close preview

release(obj);

