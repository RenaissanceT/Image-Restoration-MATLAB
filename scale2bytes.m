function g = scale2bytes(f)
%
g  = double(f);                     % 
mn = min(min(g));                   % 
mx = max(max(g));                   % 
g  = uint8(255*(g-mn)/(mx-mn));     % 
%                                   
return
