% Завантаження тестового зображення
original_image = imread('image3.png');

% Відображення вихідного зображення
figure;
imshow(original_image);
title('Вихідне зображення');

% Параметри розмиття
LEN = 21; % Довжина зміщення
THETA = 31; % Кут зміщення в градусах

% Формування фільтра для розмиття
PSF = fspecial('motion', LEN, THETA);

% Розмиття зображення
blurred_image = imfilter(original_image, PSF, 'conv', 'circular');

% Відображення розмитого зображення
figure;
imshow(blurred_image);
title('Розмите зображення');

% Відновлення зображення
% Визначення параметру SNR
SNR = 0; % Відношення сигнал/шум

% Відновлення зображення
restored_image = deconvwnr(blurred_image, PSF, SNR);

% Відображення відновленого зображення
figure;
imshow(restored_image);
title('Відновлене зображення');

%Зашумлення початкового зображення
noisy_original_image = imnoise(original_image, 'gaussian', 0.05);

% Відображення зашумленого зображення
figure;
imshow(noisy_original_image);
title('Зашумлене початкове зображення');

% Параметри розмиття
LEN = 21; % Довжина зміщення
THETA = 0; % Кут зміщення в градусах

% Формування фільтра для розмиття
PSF = fspecial('rotate', LEN, THETA);

% Розмиття зображення
blurred_image = imfilter(noisy_original_image, PSF, 'conv', 'circular');

% Відображення розмитого зображення
figure;
imshow(blurred_image);
title('Розмите зашумлене зображення');

% Відновлення зображення
% Визначення параметру SNR
SNR = 0; % Відношення сигнал/шум

% Відновлення зображення
restored_image = deconvwnr(blurred_image, PSF, SNR);

% Відображення відновленого зображення
figure;
imshow(restored_image);
title('Відновлене зашумлене та розмите зображення');
