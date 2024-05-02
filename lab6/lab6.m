% Крок 1: Завантаження зображень
image1 = imread('image1.png');
image2 = imread('image2.png');
image3 = imread('image3.png');

% Крок 2: Перетворення кольорових зображень в чорно-білі
gray_image1 = rgb2gray(image1);
gray_image2 = rgb2gray(image2);
gray_image3 = rgb2gray(image3);

% Вивід оригінальних зображень
figure;
subplot(3, 2, 1);
imshow(image1);
title('Оригінальне зображення 1');
subplot(3, 2, 2);
imshow(image2);
title('Оригінальне зображення 2');
subplot(3, 2, 3);
imshow(image3);
title('Оригінальне зображення 3');

% Крок 3: Поблочне дискретне косинусне перетворення (ДКП)
N = 8; % Розмір блоку
T = dctmtx(N); % Матриця ДКП
dct_func = @(block_struct) T * block_struct.data * T';
dct_image1 = blockproc(double(gray_image1), [N N], dct_func);
dct_image2 = blockproc(double(gray_image2), [N N], dct_func);
dct_image3 = blockproc(double(gray_image3), [N N], dct_func);

% Крок 4: Відображення ДКП з використанням логарифмічного масштабу
figure;
subplot(3, 2, 1);
imshow(log(abs(dct_image1) + 1), []);
title('Логарифмічний ДКП-спектр 1');
subplot(3, 2, 2);
imshow(log(abs(dct_image2) + 1), []);
title('Логарифмічний ДКП-спектр 2');
subplot(3, 2, 3);
imshow(log(abs(dct_image3) + 1), []);
title('Логарифмічний ДКП-спектр 3');

% Крок 5: Відновлення зображення з ДКП-спектром
inv_dct_func = @(block_struct) T' * block_struct.data * T;
restored_image1 = blockproc(dct_image1, [N N], inv_dct_func);
restored_image2 = blockproc(dct_image2, [N N], inv_dct_func);
restored_image3 = blockproc(dct_image3, [N N], inv_dct_func);

% Вивід відновлених зображень
figure;
subplot(3, 2, 1);
imshow(restored_image1, []);
title('Відновлене зображення 1');
subplot(3, 2, 2);
imshow(restored_image2, []);
title('Відновлене зображення 2');
subplot(3, 2, 3);
imshow(restored_image3, []);
title('Відновлене зображення 3');

% Крок 6: Квантування результатів ДКП
quantized_image1 = N * round(dct_image1 / N);
quantized_image2 = N * round(dct_image2 / N);
quantized_image3 = N * round(dct_image3 / N);

% Вивід квантованих ДКП-спектрів
figure;
subplot(3, 2, 1);
imshow(log(abs(quantized_image1) + 1), []);
title('Квантований ДКП-спектр 1');
subplot(3, 2, 2);
imshow(log(abs(quantized_image2) + 1), []);
title('Квантований ДКП-спектр 2');
subplot(3, 2, 3);
imshow(log(abs(quantized_image3) + 1), []);
title('Квантований ДКП-спектр 3');

% Крок 7: Відновлення зображення за квантованим ДКП-спектром
restored_quantized_image1 = blockproc(quantized_image1, [N N], inv_dct_func);
restored_quantized_image2 = blockproc(quantized_image2, [N N], inv_dct_func);
restored_quantized_image3 = blockproc(quantized_image3, [N N], inv_dct_func);

% Вивід відновлених зображень з квантованим ДКП-спектром
figure;
subplot(3, 2, 1);
imshow(restored_quantized_image1, []);
title('Відновлене зображення з квант. ДКП-спектром 1');
subplot(3, 2, 2);
imshow(restored_quantized_image2, []);
title('Відновлене зображення з квант. ДКП-спектром 2');
subplot(3, 2, 3);
imshow(restored_quantized_image3, []);
title('Відновлене зображення з квант. ДКП-спектром 3');
