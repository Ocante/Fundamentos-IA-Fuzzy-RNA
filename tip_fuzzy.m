% tip_fuzzy.m
% Cálculo de gorjeta USANDO Lógica Nebulosa (Mamdani + centróide)
% Entradas (0 a 10): comida, servico
% Saída: percentual de gorjeta (em %)

% --- Função principal: retorna pct de gorjeta ---
function pct = tip_fuzzy(comida, servico)
  assert(comida >= 0 && comida <= 10, 'comida deve estar em [0,10]');
  assert(servico >= 0 && servico <= 10, 'servico deve estar em [0,10]');

  % Fuzzificação (rótulos triangulares)
  mu_comida_ruim   = tri(comida, 0, 0, 5);
  mu_comida_media  = tri(comida, 0, 5, 10);
  mu_comida_boa    = tri(comida, 5, 10, 10);

  mu_servico_ruim  = tri(servico, 0, 0, 5);
  mu_servico_medio = tri(servico, 0, 5, 10);
  mu_servico_bom   = tri(servico, 5, 10, 10);

  % Regras (Mamdani)
  % R1: comida RUIM OU serviço RUIM -> gorjeta PEQUENA
  % R2: serviço MÉDIO                -> gorjeta MÉDIA
  % R3: comida BOA OU serviço BOM    -> gorjeta GRANDE
  alfa1 = max(mu_comida_ruim, mu_servico_ruim);
  alfa2 = mu_servico_medio;
  alfa3 = max(mu_comida_boa, mu_servico_bom);

  % Conjuntos de saída (triangulares) em [0,20] %
  y = linspace(0, 20, 1001);
  mu_tip_pequena = arrayfun(@(t) tri(t, 0, 5, 10), y);
  mu_tip_media   = arrayfun(@(t) tri(t, 5, 10, 15), y);
  mu_tip_grande  = arrayfun(@(t) tri(t, 10, 15, 20), y);

  % Implicação (min) + Agregação (max)
  agg = max( min(alfa1, mu_tip_pequena), ...
        max( min(alfa2, mu_tip_media), min(alfa3, mu_tip_grande) ) );

  % Defuzzificação por centróide
  numer = sum(y .* agg);
  denom = sum(agg);
  if denom == 0
    pct = 10; % fallback neutro
  else
    pct = numer / denom;
  end
end

% --- Função de pertinência triangular (local) ---
function mu = tri(x, a, b, c)
  if (x <= a) || (x >= c)
    mu = 0;
  elseif (x == b)
    mu = 1;
  elseif (x > a && x < b)
    mu = (x - a) / (b - a);
  else % (x > b && x < c)
    mu = (c - x) / (c - b);
  end
end

