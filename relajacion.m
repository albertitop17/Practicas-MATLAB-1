%% Metodo iterativo de relajacion
format long;

A = input("Introduce una matriz A cuadrada de dimension n:");
b = input("Introduce tu vector:");
w = input('Introduce el parámetro de relajación (para w= 1 se ejecutara el metodo de Gauss Seidel):');
maxIter = input("Introduce el número máximo de iteraciones:");
tol = input("Introduce la precision para el test de parada:");

n = length(b);
x = zeros(n, 1);

%Calculamos la matriz L
D = diag(diag(A));
E = -(tril(A) - D);
F = -(triu(A) - D);
L = (((D/w)-E)^(-1))*((((1-w)/w)*D) + F);

disp('Matriz L:');
disp(L);

iter = 0;
while iter < maxIter
    x_viejo = x;
    for i = 1:n
        suma = 0;
        for j = 1:i-1
            suma = suma + A(i, j) * x(j);
        end

        suma2 = 0;
        for p = i:n
            suma2 = suma2 + A(i, p) * x_viejo(p);
        end

        r = b(i) - suma - suma2;
        d = w * (r / A(i, i));
        x(i) = x_viejo(i) + d;
    end

    if norm(x -x_viejo,"inf") < tol
        disp('El test de parada se alcanza en la iteración:');
        disp(iter);
        disp('El resultado es:');
        disp(x);
        return;
    end

    iter = iter + 1;
end

disp('Se alcanzó el número máximo de iteraciones sin llegar a la tolerancia.');
disp('El resultado actual es:');
disp(x);



