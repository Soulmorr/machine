% Завантаження тестових зображень з бібліотеки MATLAB
image1 = imread('image2.jpg');
image2 = imread('image3.png');
image3 = imread('image4.png');

% Відображення вихідних зображень з підписами
figure(1)
subplot(3, 3, 1), imshow(image1), title('Вихідне зображення 1');
subplot(3, 3, 2), imshow(image2), title('Вихідне зображення 2');
subplot(3, 3, 3), imshow(image3), title('Вихідне зображення 3');

% Додавання нормального білого шуму
noisy_image1 = imnoise(image1, 'gaussian', 0, 0.01);
noisy_image2 = imnoise(image2, 'gaussian', 0, 0.02);
noisy_image3 = imnoise(image3, 'gaussian', 0, 0.03);
% Відображення зашумлених зображень з підписами
subplot(3, 3, 4), imshow(noisy_image1), title('Зашумлене зображення 1');
subplot(3, 3, 5), imshow(noisy_image2), title('Зашумлене зображення 2');
subplot(3, 3, 6), imshow(noisy_image3), title('Зашумлене зображення 3');
% Додавання імпульсної перешкоди
noisy_image1_impulse = imnoise(image1, 'salt & pepper', 0.05);
noisy_image2_impulse = imnoise(image2, 'salt & pepper', 0.1);
noisy_image3_impulse = imnoise(image3, 'salt & pepper', 0.15);

% Відображення зашумлених зображень з підписами
subplot(3, 3, 7), imshow(noisy_image1_impulse), title('Зашумлене зображення імпульсним методом 1');
subplot(3, 3, 8), imshow(noisy_image2_impulse), title('Зашумлене зображення імпульсним методом 2');
subplot(3, 3, 9), imshow(noisy_image3_impulse), title('Зашумлене зображення імпульсним методом 3');

% Фільтрація за допомогою віконних фільтрів
h_lowpass = fspecial('average', [3 3]); % фільтр низьких частот
h_highpass = fspecial('laplacian', 0);  % фільтр високих частот

% Фільтрація зображень
filtered_image1_lowpass = imfilter(noisy_image1, h_lowpass);
filtered_image2_lowpass = imfilter(noisy_image2, h_lowpass);
filtered_image3_lowpass = imfilter(noisy_image3, h_lowpass);

filtered_image1_highpass = imfilter(noisy_image1, h_highpass);
filtered_image2_highpass = imfilter(noisy_image2, h_highpass);
filtered_image3_highpass = imfilter(noisy_image3, h_highpass);

% Відображення фільтрованих зображень з підписами
figure(2)
subplot(3, 3, 1,'replace'), imshow(filtered_image1_lowpass), title('Фільтроване зображення 1 (Низькі частоти)');
subplot(3, 3, 2,'replace'), imshow(filtered_image2_lowpass), title('Фільтроване зображення 2 (Низькі частоти)');
subplot(3, 3, 3,'replace'), imshow(filtered_image3_lowpass), title('Фільтроване зображення 3 (Низькі частоти)');

% Відображення підписів для фільтрованих зображень з високими частотами
subplot(3, 3, 4,'replace'), imshow(filtered_image1_highpass), title('Фільтроване зображення 1 (Високі частоти)');
subplot(3, 3, 5,'replace'), imshow(filtered_image2_highpass), title('Фільтроване зображення 2 (Високі частоти)');
subplot(3, 3, 6,'replace'), imshow(filtered_image3_highpass), title('Фільтроване зображення 3 (Високі частоти)');

% Фільтрація зображень зашумлених нормальним білим шумом
filtered_image1 = medfilt3(noisy_image1);
filtered_image2 = medfilt3(noisy_image2);
filtered_image3 = medfilt3(noisy_image3);

% Фільтрація зображень зашумлених імпульсною перешкодою
filtered_image1_impulse = medfilt3(noisy_image1_impulse);
filtered_image2_impulse = medfilt3(noisy_image2_impulse);
filtered_image3_impulse = medfilt3(noisy_image3_impulse);


% Конвертація кольорових зображень в відтінки сірого
gray_image1 = rgb2gray(noisy_image1);
gray_image2 = rgb2gray(noisy_image2);
gray_image3 = rgb2gray(noisy_image3);

% Фільтрація адаптивним вінерівським фільтром
filtered_image1_v = wiener2(gray_image1);
filtered_image2_v = wiener2(gray_image2);
filtered_image3_v = wiener2(gray_image3);

gray_image1_impulse = rgb2gray(noisy_image1_impulse);
gray_image2_impulse = rgb2gray(noisy_image2_impulse);
gray_image3_impulse = rgb2gray(noisy_image3_impulse);

% Фільтрація адаптивним вінерівським фільтром зображень з імпульсною перешкодою
filtered_image1_impulse_v = wiener2(gray_image1_impulse);
filtered_image2_impulse_v = wiener2(gray_image2_impulse);
filtered_image3_impulse_v = wiener2(gray_image3_impulse);

% Фільтрація медіанним фільтром
filtered_image1_median = medfilt3(noisy_image1);
filtered_image2_median = medfilt3(noisy_image2);
filtered_image3_median = medfilt3(noisy_image3);

% Фільтрація медіанним фільтром зображень з імпульсною перешкодою
filtered_image1_impulse_median = medfilt3(noisy_image1_impulse);
filtered_image2_impulse_median = medfilt3(noisy_image2_impulse);
filtered_image3_impulse_median = medfilt3(noisy_image3_impulse);
% Відображення фільтрованих зображень з підписами.
figure(3)
subplot(3, 3, 1,'replace'), imshow(filtered_image1), title('Фільтроване зображення 1 (Нормальний білий шум)');
subplot(3, 3, 2,'replace'), imshow(filtered_image2), title('Фільтроване зображення 2 (Нормальний білий шум)');
subplot(3, 3, 3,'replace'), imshow(filtered_image3), title('Фільтроване зображення 3 (Нормальний білий шум)');

% Відображення підписів для фільтрованих зображень з імпульсною перешкодою
subplot(3, 3, 4,'replace'), imshow(filtered_image1_impulse), title('Фільтроване зображення 1 (Імпульсна перешкода)');
subplot(3, 3, 5,'replace'), imshow(filtered_image2_impulse), title('Фільтроване зображення 2 (Імпульсна перешкода)');
subplot(3, 3, 6,'replace'), imshow(filtered_image3_impulse), title('Фільтроване зображення 3 (Імпульсна перешкода)');

% Відображення підписів для фільтрованих зображень адаптивним вінерівським фільтром
subplot(3, 3, 7,'replace'), imshow(filtered_image1_v), title('Фільтроване зображення 1 (Адаптивний Вінерівський)');
subplot(3, 3, 8,'replace'), imshow(filtered_image2_v), title('Фільтроване зображення 2 (Адаптивний Вінерівський)');
subplot(3, 3, 9,'replace'), imshow(filtered_image3_v), title('Фільтроване зображення 3 (Адаптивний Вінерівський)');

% Відображення підписів для фільтрованих зображень адаптивним вінерівським фільтром з імпульсною перешкодою
figure(4)
subplot(3, 3, 1,'replace'), imshow(filtered_image1_impulse_v), title('Фільтроване зображення 1 (Адаптивний Вінерівський, Імпульсна перешкода)');
subplot(3, 3, 2,'replace'), imshow(filtered_image2_impulse_v), title('Фільтроване зображення 2 (Адаптивний Вінерівський, Імпульсна перешкода)');
subplot(3, 3, 3,'replace'), imshow(filtered_image3_impulse_v), title('Фільтроване зображення 3 (Адаптивний Вінерівський, Імпульсна перешкода)');

% Відображення підписів для фільтрованих зображень медіанним фільтром
subplot(3, 3, 4,'replace'), imshow(filtered_image1_median), title('Фільтроване зображення 1 (Медіанний)');
subplot(3, 3, 5,'replace'), imshow(filtered_image2_median), title('Фільтроване зображення 2 (Медіанний)');
subplot(3, 3, 6,'replace'), imshow(filtered_image3_median), title('Фільтроване зображення 3 (Медіанний)');

% Відображення підписів для фільтрованих зображень медіанним фільтром з імпульсною перешкодою
subplot(3, 3, 7,'replace'), imshow(filtered_image1_impulse_median), title('Фільтроване зображення 1 (Медіанний, Імпульсна перешкода)');
subplot(3, 3, 8,'replace'), imshow(filtered_image2_impulse_median), title('Фільтроване зображення 2 (Медіанний, Імпульсна перешкода)');
subplot(3, 3, 9,'replace'), imshow(filtered_image3_impulse_median), title('Фільтроване зображення 3 (Медіанний, Імпульсна перешкода)');


