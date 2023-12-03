%% Calculo polinomio de interpolacion
function pol_newton(x, y)
    % x: Vector con las coordenadas x de los puntos
    % y: Vector con las coordenadas y de los puntos
    
    %Calculamos las diferencias divididas
    n = length(x);
    F = zeros(n, n);  %Matriz de diferencias divididas
    F(:, 1) = y'; % Primera columna 
    for j = 2:n
        for i = 1: n-j+1 %Lo hacemos para recorrer las filas como en tabla 6.1
            F(i, j) = (F(i+1, j-1) - F(i, j-1)) / (x(i + j-1) - x(i)); %formula del libro
        end
    end
    coefs = F(1,:); %solo nos interesa la primera fila de la matriz de dif div
    syms t; %Creo una variable fija t 
    P = coefs(1);
    for i = 2:n
        term = 1;
        for j = 1:i-1
            term = term * (t- x(j));
        end
        P = P + term*coefs(i) ;
    end
    
    % Mostrar el polinomio resultante
    disp('Polinomio de Interpolacion de Newton:');
    disp('P(t) = ');
    disp(simplify(P));
    
    % Graficar los puntos y el polinomio 
    figure;
    plot(x, y, 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
    hold on;
    fplot(P, [min(x), max(x)], 'r');
    title('Interpolacion de Newton');
    legend('Puntos dados', 'Polinomio de Interpolacion');
    xlabel('x');
    ylabel('y');
    grid on;
    hold off;


end





