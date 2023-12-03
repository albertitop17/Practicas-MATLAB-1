% Método de Jacobi
A = input("Introduce una matriz cuadrada A de dimension n:");
b = input("Introduce el vector b:");
maxIter = input("Introduce el número máximo de iteraciones:");
tol = input("Introduce la precisión para el test de parada:");

[~,n] = size(A);
%n = length(A) ??

%Comprobaciones previas
d = diag(A);
if any(d == 0)
        disp('La matriz A no es valida, debes introducir otra')
        return
end

% Hace falta calcular J?

D = diag(diag(A));
P = inv(D);
J = eye(n) - P * A;

disp('La matriz de Jacobi será:')
disp(J)

radio_espectral = max(abs(eig(J)));

if radio_espectral >= 1
    disp('El método no converge. No da la solución del sistema.')
    return
end

u = zeros(n, 1);

iter = 0;
while iter < maxIter
    u_viejo = u;
    for i = 1:n
        u(i) = u_viejo(i) +  (b(i) - A(i,:)*u_viejo)  / A(i, i) 
    end
    
    % Verificar el test de parada
    if norm(u - u_viejo, "inf") < tol
        disp('El test de parada se alcanza en la iteración:')
        disp(iter)
        disp('El resultado es:')
        disp(u)
        return
    end
    
    iter = iter + 1;
end

disp('Se alcanzó el número máximo de iteraciones sin llegar a la tolerancia.');
disp('El resultado actual es:')
disp(u)
