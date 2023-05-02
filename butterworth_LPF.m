function newImage = butterworth_LPF(oldImage, D0, n)
oldImage = rgb2gray(oldImage);
[M, N] = size(oldImage);
newImage = zeros(M, N);
Fuv =fft2(oldImage);
Fuv =(fftshift(Fuv));
% Set up range of variables.
u = 0:(M - 1);
v = 0:(N - 1);
% Compute the indices for use in meshgrid.
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;
% Compute the meshgrid arrays.
[V, U] = meshgrid(v, u);
% Compute the distances D(U, V).
D1 =D0;
D = sqrt(U.^2 + V.^2);
D = (D/D1).^2*n;
BH = 1./(1+D);
BBH =ifftshift(double(BH));

%Applying the transfer function
g=real(ifft2(BBH .* Fuv));
%Crop to original size.
%g=g(1:size(F_u_v,1),1:size(F_u_v,2));
newImage = uint8(abs(g));
end