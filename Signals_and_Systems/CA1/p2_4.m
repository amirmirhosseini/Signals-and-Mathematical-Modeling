

function F = p2_4(params, y, x)


    a = params(1);  
    b = params(2);  
    

    residuals = y - (a * x + b);  

 
    F = residuals;  


end  
