function R  = Rot(axes , angle , dim_tree_four, deg)

syms x y z
if (deg ==1)
    alpha_x = angle*pi/180; % converterer til radianer
    beta_y  = angle*pi/180;
    gamma_z = angle*pi/180;
else
    alpha_x = angle;
    beta_y  = angle;
    gamma_z = angle;
end


if(dim_tree_four == 4)

    if(axes == x)
      R = [1   ,    0         ,     0         , 0 ;
           0   , cos(alpha_x) , -sin(alpha_x) , 0 ;
           0   , sin(alpha_x) , cos(alpha_x)  , 0 ;
           0   ,    0         ,     0         , 1];
       
    elseif(axes == y)
        
      R = [cos(beta_y)  ,  0  ,  sin(beta_y)  , 0 ;    
           0            ,  1  ,      0        , 0 ;
           -sin(beta_y) ,  0  ,  cos(beta_y)  , 0 ;
           0            ,  0  ,       0       , 1];
    elseif(axes == z)

      R = [cos(gamma_z) , -sin(gamma_z) ,  0  , 0 ;    
           sin(gamma_z) , cos(gamma_z)  ,  0  , 0 ;
               0        ,      0        ,  1  , 0 ;
               0        ,      0        ,  0  , 1]; 
    end
    
elseif (dim_tree_four == 3)   
    
    if(axes == x)
      R = [1   ,    0         ,     0         ;
           0   , cos(alpha_x) , -sin(alpha_x) ;
           0   , sin(alpha_x) , cos(alpha_x) ];
       
    elseif(axes == y)
        
      R = [cos(beta_y)  ,  0  ,  sin(beta_y) ;    
           0            ,  1  ,      0       ;
           -sin(beta_y) ,  0  ,  cos(beta_y)];
       
    elseif(axes == z)

      R = [cos(gamma_z) , -sin(gamma_z) ,  0 ;    
           sin(gamma_z) , cos(gamma_z)  ,  0 ;
               0        ,      0        ,  1]; 
    end    
    
end

end

