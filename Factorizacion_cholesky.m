%% Factorizacion de Cholesky de una matriz A
A = input("Introduce una matriz de dimensión n:");
[~,n] = size(A);
B = zeros(n);
% Aplicamos las formulas del libro
for i = 1:n
    suma = 0;
    for k = 1:i-1
        suma = suma + B(i,k)^2;
    end
    B(i,i) = sqrt(A(i,i)- suma);
    for j = i+1:n
        suma = 0;
        for k = 1:i-1
            suma = suma + B(i,k)*B(j,k);
        end
        B(j,i) = (A(i,j)-suma)/B(i,i);
    end
end
disp('La matriz B es:')
disp(B)

%Aplicamos las formulas de remonte para hallar w y u
b = input('Introduce un vector de dimension n:');
w = zeros (n,1);
u = zeros (n,1);
for i =1:n
    w(i) = (b(i)-B(i,1:i-1)*w(1:i-1))/B(i,i);
end 
disp('El vector w es:')
disp(w)

for i = n:-1:1
    u(i) = (w(i)-Bt(i,i+1:n)*u(i+1:n))/Bt(i,i);
end
disp('El vector u es:')
disp(u)


