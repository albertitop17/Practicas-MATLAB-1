% Método de Jacobi
A = input("Introduce una matriz cuadrada A de dimension n:");
b = input("Introduce el vector b:");
maxIter = input("Introduce el número máximo de iteraciones:");
tol = input("Introduce la precisión para el test de parada:");

[~,n] = size(A);

%Comprobaciones previas
d = diag(A);
for i = 1: n
    if d(i) == 0
        disp('La matriz A no es valida, debes introducir otra')
        return
    end
end

% Hace falta calcular J?

D = diag(diag(A));
P = D^(-1);
J = eye(n) - P * A;
disp('La matriz de Jacobi será:')
disp(J)

radio_espectral = max(abs(eig(J)));

if radio_espectral > 1
    disp('El método no converge. No da la solución del sistema.')
    return
end

x = zeros(n, 1);

iter = 0;
while iter < maxIter
    x_viejo = x;
    for i = 1:n
        suma = 0;
        for j = 1:n
            suma = suma + A(i, j) * x_viejo(j);
        end
        r = b(i) - suma;
        d = r / A(i, i);
        x(i) = x_viejo(i) + d;
    end
    
    % Verificar el test de parada
    if norm(x - x_viejo, "inf") < tol
        disp('El test de parada se alcanza en la iteración:')
        disp(iter)
        disp('El resultado es:')
        disp(x)
        return
    end
    
    iter = iter + 1;
end

disp('Se alcanzó el número máximo de iteraciones sin llegar a la tolerancia.');
disp('El resultado actual es:')
disp(x)
