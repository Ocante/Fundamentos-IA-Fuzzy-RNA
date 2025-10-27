% comparar_gorjeta.m
% Executa vários casos e imprime comparação: não-fuzzy vs fuzzy

casos = [2 2; 5 5; 8 3; 6 9; 3 8; 8 8];
printf("comida servico | nao_fuzzy(%%) fuzzy(%%)\n");
for i=1:size(casos,1)
  c = casos(i,1); s = casos(i,2);
  t1 = tip_nao_nebulosa(c, s);
  t2 = tip_fuzzy(c, s);
  printf("%5.1f %7.1f | %10.2f %8.2f\n", c, s, t1, t2);
end
