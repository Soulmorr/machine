% 1. Завантаження зображень
img_color1 = imread('image1.png');
img_color2 = imread('image2.jpg');

% 2. Перетворення кольорових зображень в чорно-білі
img_gray1 = rgb2gray(img_color1);
img_gray2 = rgb2gray(img_color2);

% Відображення результату перетворення
figure(1)
subplot(2,2,1), imshow(img_color1), title('Original Color Image 1');
subplot(2,2,2), imshow(img_gray1), title('Grayscale Image 1');
subplot(2,2,3), imshow(img_color2), title('Original Color Image 2');
subplot(2,2,4), imshow(img_gray2), title('Grayscale Image 2');

% 3. Виконання дискретного косинусного перетворення
dct_img1 = dct2(img_gray1);
dct_img2 = dct2(img_gray2);

% Відображення результату ДКП у вигляді зображення з використанням логарифмічного масштабу
figure(2)
subplot(2,2,1), imshow(log(abs(dct_img1) + 1), []), title('DCT of Image 1');
subplot(2,2,2), imshow(log(abs(dct_img2) + 1), []), title('DCT of Image 2');

% 4. Відновлення зображень за їх ДКП-спектром
restored_img1 = idct2(dct_img1);
restored_img2 = idct2(dct_img2);
subplot(2,2,3), imshow(uint8(restored_img1)), title('Restored Image 1');
subplot(2,2,4), imshow(uint8(restored_img2)), title('Restored Image 2');
% 5. Квантування результатів ДКП
N = 16; % Значення кроку квантування
quantized_dct_img1 = N*round(dct_img1/N);
quantized_dct_img2 = N*round(dct_img2/N);

% 6. Відображення результатів квантування в логарифмічному масштабі
figure(3)
subplot(2,2,1), imshow(log(abs(quantized_dct_img1) + 1), []), title('Quantized DCT of Image 1');
subplot(2,2,2), imshow(log(abs(quantized_dct_img2) + 1), []), title('Quantized DCT of Image 2');

% 7. Відновлення зображень за квантованим ДКП-спектром
restored_quantized_img1 = idct2(quantized_dct_img1);
restored_quantized_img2 = idct2(quantized_dct_img2);

subplot(2,2,3), imshow(uint8(restored_quantized_img1)), title('Restored Image 1');
subplot(2,2,4), imshow(uint8(restored_quantized_img2)), title('Restored Image 2');