%% Resolucion de sistemas tridiagonales
function x = sist_tridiag(A,d)
    n = length(A);
    b = diag(A);
    c = diag(A,1);
    a = diag(A,-1);
    m = zeros(n,1);
    g = zeros(n,1);
    x = zeros(n,1);
    % Aplicamos las formulas del libro
    m(1) = b(1);
    g(1) = d(1)/m(1);
    for k = 2:n
        m(k) =  b(k) - (c(k-1)/m(k-1))*a(k-1);
    end
    for k = 2:n
        g(k) = (d(k)-g(k-1)*a(k-1))/m(k);
    end
    x(n) = g(n);
    for k = n-1:-1:1
        x(k) = g(k) - (c(k)/m(k))*x(k+1);
    end
end

 