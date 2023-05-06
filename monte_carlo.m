% close all; clear; clc;
rand('twister',sum(100*clock));
%rand('twister', (2^19937-1));
N = [100,1000,10000];
p=zeros(size(N));
figure;
for i=1:length(N)
    x = rand(N(i),1); 
    y = rand(N(i),1); 
    dobre = (x.^2 + y.^2 <= 1); 
    p(i) = 4*sum(dobre)/N(i); 
        
    subplot(1,3,i);plot(x(dobre), y(dobre), 'r.'); 
    hold on;
    plot(x(~dobre), y(~dobre), 'b.'); 
    xlim([0, 1]);
    ylim([0, 1]);
    xticks(0:0.2:1);
    yticks(0:0.2:1);
    axis square 
    xlabel('X');
    ylabel('Y');
    title(['Losowe X i Y dla N=',num2str(N(i))]);
end
%---------------------------------
figure
Ne = 10000;
Me = 10;
pi_vals_e = zeros(Ne, Me);

for j = 1:Me
    N0e = 0;
    for k = 1:Ne
        x = rand();
        y = rand();
        if x^2 + y^2 <= 1
            N0e = N0e + 1;
        end
        pi_vals_e(k,j) = 4 * N0e / k;
    end
end

plot(pi_vals_e,'b');
hold on;
line([0 Ne], [3.1466 3.1466], 'Color', 'k');
hold off;
ylim([2, 4]);
yticks(2:0.5:4);
xlabel('n');
ylabel('Estymacja Pi');
title('Estymacja liczby PI:3.1466 (po 10000 losowaniach)');

%--------------------------------------
M = 10;
figure;
for i = 1:length(N)
    pi_vals = zeros(N(i), M);
    for j = 1:M
        N0 = 0;
        for k = 1:N(i)
            x = rand();
            y = rand();
            if x^2 + y^2 <= 1
                N0 = N0 + 1;
            end
            pi_vals(k,j) = 4 * N0 / k;
        end
    end
    subplot(1,length(N),i);
    boxplot(pi_vals, 'Symbol', '-');
    ylim([2,4]);
    yticks(2:0.5:4);
    axis square;
    xlabel('Seria');
    ylabel('Estymacja Pi');
    title(['Po ', num2str(N(i)), ' losowaniach']);
    hold on;
    line([0 M+1], [3.14 3.14], 'Color', 'k');
    hold off;
end



