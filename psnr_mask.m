function p=psnr_mask(x,y,m)

e=x-y;
mse=mean(e(find(m)).^2);
if mse>0
p=10*log10(255*255/mse);
else
    p=99.99;
end