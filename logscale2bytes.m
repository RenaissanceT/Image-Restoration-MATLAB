function g = logscale2bytes(f,a)
%
g  = log10(1+a*abs(double(f)));                     % 
mn = min(min(g));                   % 
mx = max(max(g));                   % 
g  = uint8(255*(g-mn)/(mx-mn));     % 
%                                   
return
