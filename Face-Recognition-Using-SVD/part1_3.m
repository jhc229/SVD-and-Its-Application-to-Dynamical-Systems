% load clown;
% A = ind2gray(X, map);
% [mz,nz] = size(A);
% figure
% imshow(A);
% mag = 2;
% truesize(1, [mz*mag, nz*mag]);
clc
clear
clf
format long

% (a) Plot the normalized singular values of A on a logarithmic scale.
load LenaImage.mat;
imshow(A)
image(A)
axis off
[U,S,V] = svd(A,0);
D = diag(S);
% semilogy is the same as PLOT(...), except logarithmic (base 10) scale is used for the Y-axis.
% plot(log1p(D(1:508,:)), 'r')
% plot(log2(D(1:508,:)), 'r')
% plot(log10(D(1:508,:)), 'r')
semilogy(D(1:512,:)/D(1),'r.')
hold on;
title('Normalized Singular Values of LenaImage')


sv = svd(A, 0);
nv = sv / sv(1);


% Source 
% https://www.mathworks.com/help/matlab/ref/svds.html

% (b) Compute the optimal approximants in the 2-norm having a relative error
%     less than 10^-1; 10^-2; and 5 * 10^-3. (Let Ak denote the optimal approximant.
%     Then the relative error, norm(A-Ak,2) / norm(A, 2) must be smaller than 
%     the specified error value for each case.) What are the corresponding error values?

c1 =0;
c2 =0;
c3 =0;
% Running the whole rank isn't necessary since we are give the min rel.err
% of 5*10^-3
 for k = 1:100
       
     Ak = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
     relErr = norm(A-Ak,2)/ norm(A,2);
     if (relErr < 1e-1)
         semilogy(D(k:508,:),'b')
         hold on
         c1 =c1+1;

     end
     if (relErr < 1e-2)
         semilogy(D(k:508,:),'g')
         hold on
%          figure;
%          imshow(Ak)
%          image(Ak)
%          axis off 
         c2 =c2+1;
         
     end

      if (relErr < (5*10^-3))
          semilogy(D(k:508,:),'y')
%           figure;
%           imshow(Ak)
%           image(Ak)
%           axis off 
          c3=c3+1;
      end
 end
 clf
 c1= (k-c1) +1;
 c2= (k-c2) +1;
 c3= (k-c3) +1;
 figure;
 Ak = U(:,1:c1)*S(1:c1,1:c1)*V(:,1:c1)';
 relErr1 = norm(A-Ak,2)/ norm(A,2);
 imshow(Ak)
 image(Ak)
 axis off     
 
 figure;
 Ak = U(:,1:c2)*S(1:c2,1:c2)*V(:,1:c2)';
 relErr2 = norm(A-Ak,2)/ norm(A,2);
 imshow(Ak)
 image(Ak)
 axis off 
 
 figure;
 Ak = U(:,1:c3)*S(1:c3,1:c3)*V(:,1:c3)';
 relErr3 = norm(A-Ak,2)/ norm(A,2);
 imshow(Ak)
 image(Ak)
 axis off
 
k=4;

Ak = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
c4 = norm(A-Ak,2)/ norm(A,2);