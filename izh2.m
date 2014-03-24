%%%%%%%%%%%%%%% (A) tonic spiking %%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,1) 
a=0.02; b=0.2;  c=-65;  d=6; delta = 1000; lamda = 250;
V=-70*delta;  u=b*V;
V_u=-70;
u_u = b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:400;
T1=tspan(end)/10;
for t=tspan
    if (t>T1) 
        I=14;
    else
        I=0;
    end;
    V = V + 10*V_u^2 + 1250*V_u + lamda*140 - lamda*u_u + lamda*I;
    u = u + V_u - 5*u_u;
    if V > (30*delta)
        VV(end+1)=30;
        V = c*delta;
        u = u + d*delta;
    	V_u=mydiv(V,delta);
    	u_u=mydiv(u,delta);
    else
    	V_u=mydiv(V,delta);
    	u_u=mydiv(u,delta);
    	VV(end+1)=V_u;
    end;
    uu(end+1)=u_u;
end;
plot(tspan,VV,[0 T1 T1 max(tspan)],-90+[0 0 10 10]);
axis([0 max(tspan) -90 30])
axis off;
title('(A) tonic spiking');

%%%%%%%%%%%%%%%%%% (B) phasic spiking %%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,2)  
a=0.02; b=0.25; c=-65;  d=6; delta = 800; lamda = 200;
V=-64*delta; u=b*V;
V_u=-64; u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:800;
T1=80; %%Originally 20%%
for t=tspan
    if (t>T1) 
        I=1; %%Originally 0.5%%
    else
        I=0;
    end;
    V = V + 8*V_u^2 + 1000*V_u + lamda*140 - lamda*u_u + I*100;
    u = u + V_u - 4*u_u;
    if V > 24000
        VV(end+1)=30;
        V = c*delta;
        u = u + d*delta;
    	V_u=mydiv(V,delta);
    	u_u=mydiv(u,delta);
    else
        V_u=mydiv(V,delta);
    	u_u=mydiv(u,delta);
    	VV(end+1)=V_u;
    end;
    uu(end+1)=u_u;	
end;
plot(tspan,VV,[0 T1 T1 max(tspan)],-90+[0 0 10 10]);
axis([0 max(tspan) -90 30])
axis off;
title('(B) phasic spiking');

%%%%%%%%%%%%%% (C) tonic bursting %%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,3)  
a=0.02; b=0.2;  c=-50;  d=2; delta = 1000; lamda = 250;
V=-70*delta;  u=b*V;
V_u=-70;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:880;
T1=88; %%Originally 22%%
for t=tspan
    if (t>T1) 
        I=15;
    else
        I=0;
    end;
    V = V + 10*V_u^2 + 1250*V_u + lamda*140 - lamda*u_u + lamda*I;
    u = u + mydiv(V,delta) - 5*mydiv(u,delta);
    if V > (30*delta)
        VV(end+1)=30;
        V = c*delta;
        u = u + d*delta;
    	V_u=mydiv(V,delta);
    	u_u=mydiv(u,delta);
    else
    	V_u=mydiv(V,delta);
    	u_u=mydiv(u,delta);
    	VV(end+1)=V_u;
    end;
    uu(end+1)=u_u;
end;
plot(tspan,VV,[0 T1 T1 max(tspan)],-90+[0 0 10 10]);
axis([0 max(tspan) -90 30])
axis off;
title('(C) tonic bursting');

%%%% Derived Eqs %%%%%
% Delta*V = Delta*V + 0.04*Lamda*V^2 + 5*Lamda*V + 140*Lamda - Lamda*u + Lamda*I;
% Delta*u = Delta*u + Lamda*a*b*V - Lamda*a*u;
% Delta = Lamda / tau;
% Lamda : the LCM of denominators from non-integer coefficients
% tau : time-increment defined for each neural subtype (normalize tau to 1, multiply tpsan(max) by normalizing integer)
% Note - V & u are implicitly multiplied by delta. Their _u variants signify they're unmodified

%%%% LCMs - Lamda %%%%
%1000 - J,
%500 - F, G, K, L, P, T,
%400 - M, N, O,
%250 - A, C, E, H, I, 
%200 - B, D, 
%50 - R, S,
%5 - Q,

%%%% Multiplier - Delta %%%%%
%4000 - J,
%2000 - F, G, K, L, M, N, P,
%1600 - O,
%1250 - I, 
%1000 - A, C, D, E, H, T,
%800 - B,
%100 - R, S, 
%50 - Q,