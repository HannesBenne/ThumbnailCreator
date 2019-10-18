%=================================
%set parameters
img_size = [NaN 600];
thumbnail_size = [NaN 300];
img_format = ".jpg"; %or ".png"
thumbnail_format = ".jpg"; %or ".png"
filename = "LostPlace";
%=================================

photos_jpg = dir('Input\*.jpg');
photos_png = dir('Input\*.png');
photos = [photos_jpg; photos_png];


for i = 1:size(photos)
    file = photos(i);
    path = char(file.folder+"\"+file.name);
    photo = imread(path);

    photo_big = imresize(photo, img_size);
    photo_small = imresize(photo, thumbnail_size);

    filepath = char("Output\"+filename + int2str(i) + img_format);
    imwrite(photo_big, filepath);

    filepath = char("Thumbnails\"+filename + int2str(i) + "-thumb" + thumbnail_format);
    imwrite(photo_small, filepath);
end




