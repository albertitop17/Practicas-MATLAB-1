%% Eliminacion gaussiana de una matriz A mediante pivoteo parcial
A = input('Introduce una matriz cuadrada:');
n = length(A);
punt = 1:n;
for k = 1:n
    %Este pivote se calcula de la fila k a la fila n
    [~,pivote] = max(abs(A(k:n,k)));
    %Para trasladarlo al indice de la matriz global, se  suma ( k -1)
    pivote = pivote + k -1 ;
    punt([k,pivote]) = punt([pivote,k]);
    for j = k+1:n
        mult = A(punt(j),k)/A(punt(k),k);
        A(punt(j),k+1:n) = A(punt(j),k+1:n) - mult*A(punt(k),k+1:n);
        A(punt(j),k) = mult;
    end
end
%Aplicamos el metodo de remonte
b = input("introduce tu vector:");
w = zeros(1,n);
u = zeros(1,n);
w(1) = b(punt(1));

for i = 2:n
    suma = 0;
    for j = 1:i-1
        suma  = suma + A(punt(i),j)*w(j);
    end
    w(i) = b(punt(i)) - suma;
end
u(n) = w(n)/A(punt(n),n);
for i = n-1:-1:1
    suma = 0;
    for j = i+1:n
        suma = suma + A(punt(i),j)*u(j);
    end
    u(i) = (w(i) - suma)/A(punt(i),i);
end
%Damos las soluciones
disp('La matriz A es: ')
disp(A)
disp('El puntero es:')
disp(punt)
disp('Los vectores w y u calculados por remonte son:')
disp('w =')
disp(w)
disp('u =')
disp(u)



