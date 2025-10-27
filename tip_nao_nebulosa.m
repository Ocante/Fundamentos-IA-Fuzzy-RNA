% tip_nao_nebulosa.m
% Cálculo de gorjeta SEM lógica nebulosa (para comparação)
% Entradas (0 a 10): comida, servico
% Saída: percentual de gorjeta (em %)

function pct = tip_nao_nebulosa(comida, servico)
  assert(comida >= 0 && comida <= 10, 'comida deve estar em [0,10]');
  assert(servico >= 0 && servico <= 10, 'servico deve estar em [0,10]');

  if (min(comida, servico) <= 3)
    pct = 5;       % ruim -> gorjeta pequena ~5%
  elseif (max(comida, servico) >= 8)
    pct = 15;      % surpreendeu positivamente -> ~15%
  else
    % caso intermediário, prioriza a experiência do serviço para ~10%
    pct = 10;      % serviço OK -> ~10%
  end
end

% Exemplo rápido:
% tip = tip_nao_nebulosa(7, 6)
% printf('Gorjeta (%%): %.2f\n', tip);
