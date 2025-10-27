% superficie_fuzzy.m - superfície gorjeta fuzzy
clc; clear all; close all;

% grade de pontos
[c_grid, s_grid] = meshgrid(0:0.5:10, 0:0.5:10);
g = zeros(size(c_grid));

for i = 1:size(c_grid,1)
  for j = 1:size(c_grid,2)
    g(i,j) = tip_fuzzy(c_grid(i,j), s_grid(i,j));
  end
end

figure;
surf(c_grid, s_grid, g);
xlabel('Comida (0-10)');
ylabel('Serviço (0-10)');
zlabel('Gorjeta (%)');
title('Superfície da Gorjeta (Lógica Nebulosa)');
grid on;

print -dpng 'superficie_fuzzy.png';  % salva a imagem
disp("Imagem salva: superficie_fuzzy.png");

