function [ psnr ] = psnrM( A, Ref )

psnr = 10*log10((255*255)/immse(A,Ref)); 
end

