clc
clear
clf
load yale_faces;
imshow(Y{1});

% M_ave = 1/N * sum(M_i) 
N=132;
Mave=zeros(64);
for i = 1:N
%     mAve = mAve + sum(sum(Y{i}));
    Mave = Mave+ Y{i};
    
end
Mave = Mave/N;
imshow(Mave);


% Vectorize vec(M) = m = R^64x64 to R^4096
%%% A = Y{1};
%%% m = reshape(A,[4096,1]);

% Vectorize vec(mAve) = mAve
mave = reshape(Mave,[4096,1]);

% Create cell array for D
% elem = NET.createArray('System.Double[]',132);
% for i = 1:N
%     A = Y{i};
%     m = reshape(A,[4096,1]);
%     elem(i) = (m - mave)/sqrt(N);
%     D = cell(elem);
% end

for i = 1:N
    A = Y{i};
    D(:,i) = (reshape(A,4096,1) - mave)/sqrt(N);
end
[U,S,V] = svd(D,0);


for i= 1:4
    subplot(2,2,i)
    imagesc(reshape(U(:,i), 64, 64)); colormap(gray);
end

% Part C
load 'images_to_reconstruct'

F{1} = F1; 
F{2} = F2; 
F{3} = F3; 
for i=1:3
    % the first step is to vectorize the given image/face and subtract the average from it.
    f{i} = reshape(F{i},64*64,1) - mave;

    fApprox{i} = U*U'*f{i}+mave; 
    % the best approximation to f in our database.
    % the right-singular vectors U, i.e. the eigenfaces, automatically give us the best possible reconstruc- tion of the given face image using our database.
    FApprox{i} = reshape(fApprox{i},64,64);
    
    % Before
    subplot(3,2,2*i-1) 
    imagesc(F{i});colormap(gray) 
    % After
    subplot(3,2,2*i)
    imagesc(FApprox{i});colormap(gray)
end
