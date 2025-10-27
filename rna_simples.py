# rna_simples.py
# Rede neural de uma camada (sem oculta) com ativação sigmoide
# Tarefa: classificação binária (OR lógico)
# Treinamento por 10.000 iterações usando gradiente descendente

import numpy as np

# Sigmoide e derivada
def sigmoid(x):
    return 1 / (1 + np.exp(-x))

def sigmoid_deriv_from_output(y_hat):
    # dado y_hat = sigmoid(z), derivada é y_hat * (1 - y_hat)
    return y_hat * (1 - y_hat)

# Dados de entrada (4 amostras, 3 features com bias na 3a coluna = 1)
# Duas primeiras colunas são bits; terceira coluna é viés (constante 1)
X = np.array([
    [0, 0, 1],
    [1, 1, 1],
    [1, 0, 1],
    [0, 1, 1]
], dtype=float)

# Saída desejada (OR lógico)
y = np.array([[0], [1], [1], [1]], dtype=float)

# Pesos inicializados aleatoriamente
rng = np.random.default_rng(42)
W = rng.uniform(-1, 1, size=(3, 1))

lr = 0.1
epochs = 10000

for i in range(epochs):
    # Forward
    z = X @ W
    y_hat = sigmoid(z)

    # Erro e gradiente
    erro = y - y_hat
    grad = X.T @ (erro * sigmoid_deriv_from_output(y_hat))

    # Atualização dos pesos
    W += lr * grad

    if (i + 1) % 2000 == 0:
        loss = np.mean((erro) ** 2)
        print(f"época {i+1}, loss {loss:.6f}")

print("\nSaída prevista após o treinamento:")
print(np.round(y_hat, 3))
print("\nPesos finais:")
print(np.round(W, 3))
