% This code performs a RBF interpolator using an Eucledian distance as basis function
% Author: Enrico Camporeale

clear all, close all

%load data_lr.txt
data_lr=load('./DATA/dataHR20K.DAT');

max_xc=max(data_lr(:,1:3));

xc=data_lr(:,1:3)./max_xc;
y=data_lr(:,4);

N=size(xc,1);
M=zeros(N,N);

for i=1:N
M(i:end,i) = sqrt(sum((xc(i:end,:)-xc(i,:)).^2,2)); 
end
M=M+tril(M)';

ampl = M\y;


%z=load('./DATA/data60K.DAT');
z=load('./DATA/dataVALIDL_interLR.DAT');
z=z(:,1:3)./max_xc;

clear K
for k=1:length(z)
        K(:,k) = sqrt(sum((z(k,:)-xc).^2,2));    
end

dataVALIDL_interLR = (ampl'*K)';
save('dataVALIDL_interLR.txt','dataVALIDL_interLR','-ascii')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

z=load('./DATA/dataVALID_interHR.DAT');
z=z(:,1:3)./max_xc;

clear K
for k=1:length(z)
        K(:,k) = sqrt(sum((z(k,:)-xc).^2,2));    
end

dataVALID_interHR = (ampl'*K)';
save('dataVALID_interHR.txt','dataVALID_interHR','-ascii')


return



pred_data_60K = (ampl'*K)';
save('pred_data_60_k.txt','pred_data_60K','-ascii')

%%%%%%%%%%%%%%%55
dataL = load('./DATA/dataL_10K.DAT');
z=dataL(:,1:3)./max_xc;

clear K
for k=1:length(z)
        K(:,k) = sqrt(sum((z(k,:)-xc).^2,2));    
end

pred_dataL_10K = (ampl'*K)';
save('pred_dataL_10K.txt','pred_dataL_10K','-ascii')

%%%%%%%%%%%%%%%%%%%%555

dataL = load('./DATA/dataLR1K.DAT');
z=dataL(:,1:3)./max_xc;

clear K
for k=1:length(z)
        K(:,k) = sqrt(sum((z(k,:)-xc).^2,2));    
end

pred_dataLR1K = (ampl'*K)';
save('pred_dataLR1K.txt','pred_dataLR1K','-ascii')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555
return
z=load('./DATA/data60K.DAT');
z1=unique(z(:,1));
u=unique(z(:,2)); z2=u(1:75:end);z2=[z2;u(end)];
u=unique(z(:,3)); z3=u(1:5:end);z3=[z3;u(end)];
[x1 x2 x3]=meshgrid(z1,z2,z3);
x1=x1(:);x2=x2(:);x3=x3(:);
Z=NaN(728,4);
Z(:,1:3)=[x1 x2 x3];
for i=1:728;
f=find(Z(i,1)==z(:,1) & Z(i,2)==z(:,2) & Z(i,3)==z(:,3));
if f
Z(i,4)=z(f,4);
end
end







return
