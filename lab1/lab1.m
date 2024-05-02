% Завантаження зображень
img_path = 'D:\DZ\magistr\s2\image\lab1\'
image1 = imread('image1.png');
image2 = imread('image2.jpg');
image3 = imread('image3.png');

% Відображення зображень
imshow(image1);
title('image1_original');
figure, imshow(image2);
title('image2_original');
figure, imshow(image3);
title('image3_original');
% Завантаження зображення з вказаним шляхом
path = 'D:\DZ\magistr\s2\image\lab1\image4.png';
image4 = imread(path);
imshow(image4);
title('image4_original');

% Розмір зображень
size(image1)
size(image2)
size(image3)
size(image4)

% Тип даних
class(image1)
class(image2)
class(image3)
class(image4)

% Шлях для збереження
save_path = 'D:\DZ\magistr\s2\image\lab1\SavedImages\';

% Збереження зображень

imwrite(image1, [save_path 'image1_saved.jpg']);
imwrite(image2, [save_path 'image2_saved.png']);
imwrite(image3, [save_path 'image3_saved.tif']);
imwrite(image4, [save_path 'image4_saved.jpg']);

% Виведення гістограм
figure, imhist(image1);
title('image1_histo');
figure, imhist(image2);
title('image2_histo');
figure, imhist(image3);
title('image3_histo');
figure, imhist(image4);
title('image4_histo');

% Отримання оптимальних діапазонів контрасту для кожного каналу
low_high1 = stretchlim(image1);
low_high2 = stretchlim(image2);
low_high3 = stretchlim(image3);
low_high4 = stretchlim(image4);

% Контрастування кожного каналу окремо

adjusted_image1 = imadjust(image1, low_high1, []);

adjusted_image2 = imadjust(image2, low_high2, []);

adjusted_image3 = imadjust(image3, low_high3, []);

adjusted_image4 = imadjust(image4, low_high4, []);


% Відображення зображень з підвищеною контрастністю
figure, imshow(adjusted_image1);
title('image1_contrast');
figure, imshow(adjusted_image2);
title('image2_contrast');
figure, imshow(adjusted_image3);
title('image3_contrast');
figure, imshow(adjusted_image4);
title('image4_contrast');

% Отримання негативу
negative_image1 = imcomplement(image1);
negative_image2 = imcomplement(image2);
negative_image3 = imcomplement(image3);
negative_image4 = imcomplement(image4);

% Відображення негативів

figure, imshow(negative_image1);
title('image1_negative');

figure, imshow(negative_image2);
title('image2_negative');

figure, imshow(negative_image3);
title('image3_negative');

figure, imshow(negative_image4);
title('image4_negative');
