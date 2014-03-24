%%%%%%%%%%%%%%%%%% (A) tonic spiking %%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,1)
a=0.02; b=0.2; c=-65; d=6;
V=-70*250; u=b*V;
VV=[]; uu=[];
tau = 1; tspan = 0:tau:100;
T1=tspan(end)/10;
for t=tspan
	if (t>T1)
		I=14;
	else
		I=0;
	end;
	V = V + 10*mydiv(V,250)^2+1250*mydiv(V,250)+35000-250*mydiv(u,250)+250*I;
	u = u + mydiv(V,250) - 5*mydiv(u,250);
	if V > 7500
		VV(end+1)=30;
		V = c*250;
		u = u + 250*d;
	else
		VV(end+1)=mydiv(V,250);
	end;
	uu(end+1)=u;
end;
plot(tspan,VV,[0 T1 T1 max(tspan)],-90+[0 0 10 10]);
axis([0 max(tspan) -90 30])
axis off;
title('(A) tonic spiking');

%%%%%%%%%%%%%%%%%% (B) phasic spiking %%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,2)
a=0.02; b=0.25; c=-65;  d=6;
V=-64*200; u=b*V;
VV=[];  uu=[];
tau = 0.25; tspan = 0:tau:200;
T1=20;
for t=tspan
	if (t>T1) 
		I=1;
	else
		I=0;
	end;
	V = V + 8*mydiv(V,200)^2 + 1000*mydiv(V,200) + 28000 - 200*mydiv(u,200) + 100*I;
	u = u + mydiv(V,200) - 4*mydiv(u,200);
	if V > 6000
		VV(end+1)=30;
		V = c*200;	
		u = u + d*200;
	else
		VV(end+1)=mydiv(V,200);
	end;
	uu(end+1)=u;
end;
plot(tspan,VV,[0 T1 T1 max(tspan)],-90+[0 0 10 10]);
axis([0 max(tspan) -90 30])
axis off;
title('(B) phasic spiking');

%%%%%%%%%%%%%% (C) tonic bursting %%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,3)  
a=0.02; b=0.2;  c=-50;  d=2;
V=-70*250;  u=b*V;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:220;
T1=22;
for t=tspan
    if (t>T1) 
        I=15;
    else
        I=0;
    end;
	V = V + 10*mydiv(V,250)^2+1250*mydiv(V,250)+35000-250*mydiv(u,250)+250*I;
	u = u + mydiv(V,250) - 5*mydiv(u,250);
    if V > 7500
        VV(end+1)=30;
        V = c*250;
        u = u + d*250;
    else
        VV(end+1)=mydiv(V,250);
    end;
    uu(end+1)=u;
end;
plot(tspan,VV,[0 T1 T1 max(tspan)],-90+[0 0 10 10]);
axis([0 max(tspan) -90 30])
axis off;
title('(C) tonic bursting');

%%%%%%%%%%%%%%% (D) phasic bursting %%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,4)   
a=0.02; b=0.25; c=-55;  d=0.05;
V=-64*200;  u=b*V;
VV=[];  uu=[];
tau = 0.1;  tspan = 0:tau:200;
T1=20;
for t=tspan
    if (t>T1) 
        I=3;
    else
        I=0;
    end;
	V = V + 8*mydiv(V,200)^2 + 1000*mydiv(V,200) + 28000 - 200*mydiv(u,200) + 40*I;
	u = u + mydiv(V,200) - 4*mydiv(u,200);
    if V > 6000
        VV(end+1)=30;
        V = c*200;
        u = u + d*200;
    else
        VV(end+1)=mydiv(V,200);
    end;
    uu(end+1)=u;
end;
plot(tspan,VV,[0 T1 T1 max(tspan)],-90+[0 0 10 10]);
axis([0 max(tspan) -90 30])
axis off;
title('(D) phasic bursting');

%%%%%%%%%%%%%%% (E) mixed mode %%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,5) 
a=0.02; b=0.2;  c=-55;  d=4;
V=-70*250;  u=b*V;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:160;
T1=tspan(end)/10;
for t=tspan
    if (t>T1) 
        I=10;
    else
        I=0;
    end;
	V = V + 10*mydiv(V,250)^2+1250*mydiv(V,250)+35000-250*mydiv(u,250)+250*I;
	u = u + mydiv(V,250) - 5*mydiv(u,250);
    if V > 30
        VV(end+1)=30;
        V = c*250;
        u = u + d*250;
    else
        VV(end+1)=mydiv(V,250);
    end;
    uu(end+1)=u;
end;
plot(tspan,VV,[0 T1 T1 max(tspan)],-90+[0 0 10 10]);
axis([0 max(tspan) -90 30])
axis off;
title('(E) mixed mode');

%%%% Derived Eqs %%%%%
% Delta*V = Delta*V + 0.04*Lamda*V^2 + 5*Lamda*V + 140*Lamda - Lamda*u + Lamda*I;
% Delta*u = Delta*u + Lamda*a*b*V - Lamda*a*u;
% Delta = Lamda / tau;
% Lamda : the LCM of denominators from non-integer coefficients
% tau : time-increment defined for each neural subtype (normalize to 1, multiply tpsan(max) by normalizing integer)

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