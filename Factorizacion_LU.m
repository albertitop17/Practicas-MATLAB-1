%% Factorización LU de una matriz A
A = input("Introduce una matriz de tamaño n:");
n = length(A);
L = eye(n);
U = zeros(n);
%Aplicamos las formmulas del libro
for i = 1:n
    % Calcula la parte superior (U) de la factorización LU
    for j = i:n
        suma = 0;
        for k = 1:i-1
            suma = suma + L(i,k) * U(k,j);
        end
        U(i,j) = A(i,j) - suma;
    end
    
    % Calcula la parte inferior (es decir la matriz L) de la factorización LU
    for j = i+1:n
        suma = 0;
        for k = 1:i-1
            suma = suma + L(j,k) * U(k,i);
        end
        L(j,i) = (A(j,i) - suma) / U(i,i);
    end
end
disp('La matriz L (triangular inferior) es :')    
disp(L)
disp('La matriz U (triangular superior) es:')
disp(U)

%Ahora aplicamos los codigos de resolucion de sistemas con matrices
%triangulares superiores e inferiores
b = input("Ahora, introduce un vector de tamaño n:");
w = zeros(n,1);
u = zeros(n,1);
for i = 1:n
    w(i) = b(i) - L(i,1:i-1)*w(1:i-1);
end
for i = n:-1:1
    u(i) = (w(i)-U(i,i+1:n)*u(i+1:n))/U(i,i);
end

%Mostramos las soluciones por pantalla
disp('Los vectores w y v son:')
disp('w =')
disp(w)
disp('u =')
disp(u)