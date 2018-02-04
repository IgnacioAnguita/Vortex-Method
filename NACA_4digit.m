function [y_c,Y_geo_up,Y_geo_low] = NACA_4digit( NACA_num_4_dig ,x_c)
%This function calculates and return the position coordinates of a NACA
%airfoil of 4 digits

if NACA_num_4_dig<=9999
    
NACA_digits = dec2base(NACA_num_4_dig,10) - '0';
t=(NACA_digits(4)+NACA_digits(3)*10)/100; % Thickness in 1 percent 
p=NACA_digits(2)/10;
f=NACA_digits(1)/100;
c=max(x_c);
x=x_c/c;

y_t_up=+(t/0.2)*(0.2969*(x.^0.5)-0.1260*x-0.3516*(x.^2)+0.2843*(x.^3)-0.1015*(x.^4));
y_t_low=-y_t_up;

for i=1:length(x)
    if (x(i)>=0) & (x(i)<=p)
    y_c(i)=(f/(p^2))*(2*p*x(i)-(x(i)^2));
    elseif (x(i)>=p) & (x(i)<=1)
    y_c(i)=(f/((1-p)^2))*(1-2*p+2*p*x(i)-(x(i)^2));
    end  
end
Y_geo_up=(y_c+y_t_up)*c;
Y_geo_low=(y_c+y_t_low)*c;
y_c=y_c*c;

else
    ERROR: NACA_4digit( NACA_num_4_dig ,x)
end


end


