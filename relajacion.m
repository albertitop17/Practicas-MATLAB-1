%% Metodo iterativo de relajacion
format long;

A = input("Introduce una matriz A cuadrada de dimension n:");
b = input("Introduce tu vector:");
w = input('Introduce el parámetro de relajación (para w= 1 se ejecutara el metodo de Gauss Seidel):');
maxIter = input("Introduce el número máximo de iteraciones:");
tol = input("Introduce la precision para el test de parada:");

n = length(b);
u = zeros(n, 1);

%Calculamos la matriz Lw
D = diag(diag(A));
E = -(tril(A) - D);
F = -(triu(A) - D);
Lw = inv(D-w*E)*((1-w)*D +w*F);

disp('Matriz Lw:');
disp(Lw);

iter = 0;
while iter < maxIter
    u_anterior = u;
    for i = 1:n
        u(i) = u_anterior(i) + w * ((b(i) - A(i,1:i-1)*u(1:i-1) - A(i,i:n)*u_anterior(i:n)) / A(i, i));
    end
    
    if norm(u -u_anterior,"inf") < tol
        disp('El test de parada se alcanza en la iteración:');
        disp(iter);
        disp('El resultado es:');
        disp(u);
        return;
    end

    iter = iter + 1;
end

disp('Se alcanzó el número máximo de iteraciones sin llegar a la tolerancia.');
disp('El resultado actual es:');
disp(u);


