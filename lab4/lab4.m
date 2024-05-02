image1 = imread('image1.jpg');
image2 = imread('image2.jpg');
F1 = fft2(image1);
F2 = fft2(image2);

S1 = fftshift(log(1 + abs(F1)));
S2 = fftshift(log(1 + abs(F2)));

restored_image1 = ifft2(fftshift(F1));
restored_image2 = ifft2(fftshift(F2));

filter_size = 15;
sigma = 2;
h = fspecial('gaussian', [filter_size, filter_size], sigma);

H = fftshift(fft2(h, size(image1, 1), size(image1, 2)));

filtered_image1 = ifft2(F1 .* H);
filtered_image1_spatial = imfilter(image1, h, 'conv', 'replicate');

% Відображення зображень
subplot(3, 3, 1);
imshow(image1);
title('Зображення 1');

subplot(3, 3, 4);
imshow(image2);
title('Зображення 2');

% Формування та відображення двовимірних спектрів зображень
F1 = fft2(image1);
F2 = fft2(image2);

S1 = fftshift(log(1 + abs(F1)));
S2 = fftshift(log(1 + abs(F2)));

subplot(3, 3, 2);
imshow(S1, []);
title('Спектр зображення 1');

subplot(3, 3, 5);
imshow(S2, []);
title('Спектр зображення 2');

% Відновлення зображень зі спектрів
restored_image1 = ifft2(fftshift(F1));
restored_image2 = ifft2(fftshift(F2));

subplot(3, 3, 3);
imshow(uint8(abs(restored_image1)), []);
title('Відновлене зображення 1');

subplot(3, 3, 6);
imshow(uint8(abs(restored_image2)), []);
title('Відновлене зображення 2');

subplot(3, 3, 7);
imshow(h, []);
title('Двовимірний фільтр');

filtered_image1 = ifft2(F1 .* H);
subplot(3, 3, 8);
imshow(abs(filtered_image1), []);
title('Фільтроване зображення');

subplot(3, 3, 9);
filtered_image1_spatial = imfilter(image1, h, 'conv', 'replicate');
imshow(filtered_image1_spatial, []);
title('Фільтроване зображення в області просторових змінних ');