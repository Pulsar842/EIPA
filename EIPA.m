close all
clc

set(0,'Defaultfigurewindowstyle','docked')

nx = 50;
ny = 50;

G = sparse(nx*ny,nx*ny);

for i = 1:nx
    for j=1:ny
        m = j + (i-1) * ny;
        if (i == nx || i ==1 || j ==1 || j ==ny)
        G(m,m) = 1;    
        else
            G(m,m-ny) = 1 ; % first value
            G(m,m) = -4;    % middle value
            G(m,m+ny) = 1 ; % last value
            G(m,m-1) = 1;   % left side
            G(m,m+1) = 1;   % right side     
        end
    end
end

figure (1)
spy(G);
[E,D] = eigs(G,9,'SM');
surf(E);
EE = zeros(nx,ny,9);

for M = 1:9
    EE(:,:,M) = reshape(E(:,M),nx,ny);
    subplot(3,3,M)
    surf(EE(:,:,M));
       
end


