% gerar_tabela.m - salva comparações em CSV para o relatório
casos = [2 2; 5 5; 8 3; 6 9; 3 8; 8 8; 7 6; 2 9; 9 2];

% cabeçalho
fid = fopen('resultados_gorjeta.csv', 'w');
fprintf(fid, "comida,servico,nao_fuzzy,fuzzy\n");

for i=1:size(casos,1)
  c = casos(i,1); s = casos(i,2);
  nf = tip_nao_nebulosa(c, s);
  fz = tip_fuzzy(c, s);
  fprintf(fid, "%.2f,%.2f,%.2f,%.2f\n", c, s, nf, fz);
end

fclose(fid);
disp("Arquivo salvo: resultados_gorjeta.csv");
% gerar_tabela.m - salva comparações em CSV para o relatório
casos = [2 2; 5 5; 8 3; 6 9; 3 8; 8 8; 7 6; 2 9; 9 2];

% cabeçalho
fid = fopen('resultados_gorjeta.csv', 'w');
fprintf(fid, "comida,servico,nao_fuzzy,fuzzy\n");

for i=1:size(casos,1)
  c = casos(i,1); s = casos(i,2);
  nf = tip_nao_nebulosa(c, s);
  fz = tip_fuzzy(c, s);
  fprintf(fid, "%.2f,%.2f,%.2f,%.2f\n", c, s, nf, fz);
end

fclose(fid);
disp("Arquivo salvo: resultados_gorjeta.csv");

