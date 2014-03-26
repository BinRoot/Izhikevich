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
title('(C) tonic bursting');

%%%%%%%%%%%%%%% (D) phasic bursting %%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,4)   
a=0.02; b=0.25; c=-55;  d=0.05; delta=1000; lamda=200;
V=-64*delta;  u=b*V;
V_u=-64;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1;  tspan = 0:tau:1000;
T1=100;
for t=tspan
    if (t>T1) 
        I=3;
    else
        I=0;
    end;
    V = V + 8*V_u^2 + 1000*V_u + lamda*140 - lamda*u_u + I*40;
    u = u + V_u - 4*u_u;
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
title('(D) phasic bursting');

%%%%%%%%%%%%%%% (E) mixed mode %%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,5) 
a=0.02; b=0.2;  c=-55;  d=4; delta=1000; lamda=250;
V=-70*delta;  u=b*V;
V_u=-70;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:640;
T1=tspan(end)/10;
for t=tspan
    if (t>T1) 
        I=10;
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
title('(E) mixed mode');

%%%%%%%%%%%%%%%% (F) spike freq. adapt %%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,6)  
a=0.01; b=0.2;  c=-65;  d=8; delta=2000; lamda=500;
V=-70*delta;  u=b*V;
V_u=-70;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:340;
T1=tspan(end)/10;
for t=tspan
    if (t>T1) 
        I=30;
    else
        I=0;
    end;    
    V = V + 20*V_u^2 + 2500*V_u + lamda*140 - lamda*u_u + lamda*I;
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
title('(F) spike freq. adapt');

%%%%%%%%%%%%%%%%% (G) Class 1 exc. %%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,7)  
a=0.02; b=-0.1; c=-55; d=6; delta=2000; lamda=500;
V=-60*delta; u=b*V;
V_u=-60;
u_u=b*V_u;
VV=[]; uu=[];
tau = 1; tspan = 0:tau:1200; %%.25, 300%%
T1=120; %%30%%
for t=tspan
    if (t>T1) 
        I=(0.075*(t-T1)); 
    else
        I=0;
    end;
    V = V + 20*V_u^2 + 2050*V_u + lamda*108 - lamda*u_u + lamda*I;
    u = u - V_u - 5*u_u;
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
plot(tspan,VV,[0 T1 max(tspan) max(tspan)],-90+[0 0 20 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(G) Class 1 excitable');

%%%%%%%%%%%%%%%%%% (H) Class 2 exc. %%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,8)  
a=0.2;  b=0.26; c=-65;  d=0; delta=1000; lamda=250;
V=-64*delta;  u=b*V;
V_u=-64;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:1200; %%.25, 300%%
T1=120; %%30%%
for t=tspan
    if (t>T1) 
        I=-1+(0.03*(t-T1)); %%-0.5+(0.015*(t-T1))%% 
    else
        I=-1;	%%-0.5%%
    end;
    V = V + 10*V_u^2 + 1250*V_u + lamda*140 - lamda*u_u + 125*I;
    u = u + 13*V_u - 50*u_u;
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
plot(tspan,VV,[0 T1 max(tspan) max(tspan)],-90+[0 0 20 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(H) Class 2 excitable');

%%%%%%%%%%%%%%%%% (I) spike latency %%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,9) 
a=0.02; b=0.2;  c=-65;  d=6; delta=1250; lamda=250;
V=-70*delta;  u=b*V;
V_u=-70;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:500; %%.2, 100%%
T1=tspan(end)/10;
for t=tspan
    if t>T1 & t < T1+15 %%3%%
        I=7.04;
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
plot(tspan,VV,[0 T1 T1 T1+3 T1+3 max(tspan)],-90+[0 0 10 10 0 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(I) spike latency');

%%%%%%%%%%%%%%%%% (J) subthresh. osc. %%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,10) 
a=0.05; b=0.26; c=-60;  d=0; delta=4000; lamda=1000;
V=-62*delta;  u=b*V;
V_u=-62;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:800; %%.25, 200%%
T1=tspan(end)/10;
for t=tspan
    if (t>T1) & (t < T1+20) %%5%%
        I=2;
    else
        I=0;
    end;
    V = V + 40*V_u^2 + 5000*V_u + lamda*140 - lamda*u_u + lamda*I;
    u = u + 13*V_u - 50*u_u;
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
plot(tspan,VV,[0 T1 T1 (T1+5) (T1+5) max(tspan)],-90+[0 0 10 10 0 0],...
      tspan(220:end),-10+20*(VV(220:end)-mean(VV)));
axis([0 max(tspan) -90 30])
axis off;
title('(J) subthreshold osc.');

%%%%%%%%%%%%%%%%%% (K) resonator %%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,11) 
a=0.1;  b=0.26; c=-60;  d=-1; delta=2000; lamda=500;
V=-62*delta;  u=b*V;
V_u=-62;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:1600; %%400%
T1=tspan(end)/10;
T2=T1+20;
T3 = 0.7*tspan(end);
T4 = T3+40;
for t=tspan
    if ((t>T1) & (t < T1+16)) | ((t>T2) & (t < T2+16)) | ((t>T3) & (t < T3+16)) | ((t>T4) & (t < T4+16)) %%4%%
        I=0.65;
    else
        I=0;
    end;
    V = V + 20*V_u^2 + 2500*V_u + lamda*140 - lamda*u_u + lamda*I;
    u = u + 13*V_u - 50*u_u;
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
plot(tspan,VV,[0 T1 T1 (T1+8) (T1+8) T2 T2 (T2+8) (T2+8) T3 T3 (T3+8) (T3+8) T4 T4 (T4+8) (T4+8) max(tspan)],-90+[0 0 10 10 0 0 10 10 0 0 10 10 0 0 10 10 0 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(K) resonator');

%%%%%%%%%%%%%%%% (L) integrator %%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,12) 
a=0.02; b=-0.1; c=-55; d=6; delta=2000; lamda=500;
V=-60*delta; u=b*V;
V_u=-60;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:400; %%100%%
T1=tspan(end)/11;
T2=T1+20; %%T1+5%%
T3 = 0.7*tspan(end);
T4 = T3+40; %%T3+10%%
for t=tspan
    if ((t>T1) & (t < T1+8)) | ((t>T2) & (t < T2+8)) | ((t>T3) & (t < T3+8)) | ((t>T4) & (t < T4+8)) %%2%%
        I=9;
    else
        I=0;
    end;
    V = V + 20*V_u^2 + 2050*V_u + lamda*108 - lamda*u_u + lamda*I;
    u = u + V_u - 10*u_u;
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
plot(tspan,VV,[0 T1 T1 (T1+2) (T1+2) T2 T2 (T2+2) (T2+2) T3 T3 (T3+2) (T3+2) T4 T4 (T4+2) (T4+2) max(tspan)],-90+[0 0 10 10 0 0 10 10 0 0 10 10 0 0 10 10 0 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(L) integrator');

%%%%%%%%%%%%%%%%% (M) rebound spike %%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,13)  
a=0.03; b=0.25; c=-60;  d=4; delta=2000; lamda=400;
V=-64*delta;  u=b*V;
V_u=-64;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1;  tspan = 0:tau:1000;
T1=100; %%20%%
for t=tspan
    if (t>T1) & (t < T1+25) %%(t>T1) & (t < T1+5)%%
        I=-15;
    else
        I=0;
    end;
    V = V + 16*V_u^2 + 2000*V_u + lamda*140 - lamda*u_u + lamda*I;
    u = u + 3*V_u - 12*u_u;
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
plot(tspan,VV,[0 T1 T1 (T1+5) (T1+5) max(tspan)],-85+[0 0 -5 -5 0 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(M) rebound spike');

%%%%%%%%%%%%%%%%% (N) rebound burst %%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,14)  
a=0.03; b=0.25; c=-52;  d=0; delta=2000; lamda=400;
V=-64;  u=b*V;
V_u=-64;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1;  tspan = 0:tau:1000; %%200%%
T1=100; %%20%%
for t=tspan
    if (t>T1) & (t < T1+25) %%(t>T1) & (t < T1+5)%%
        I=-15;
    else
        I=0;
    end;
    V = V + 16*V_u^2 + 2000*V_u + lamda*140 - lamda*u_u + lamda*I;
    u = u + 3*V_u - 12*u_u;
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
plot(tspan,VV,[0 T1 T1 (T1+5) (T1+5) max(tspan)],-85+[0 0 -5 -5 0 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(N) rebound burst');

%%%%%%%%%%%%%%%%% (O) thresh. variability %%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,15)  
a=0.03; b=0.25; c=-60;  d=4; delta=1600; lamda=400;
V=-64;  u=b*V;
V_u=-64;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:400;
for t=tspan
   if ((t>40) & (t < 60)) | ((t>320) & (t < 340)) %%10, 15, 80, 85%%
        I=1;
    elseif (t>280) & (t < 300) %%70, 75%%
        I=-6;
    else
        I=0;
    end;
    V = V + 16*V_u^2 + 2000*V_u + lamda*140 - lamda*u_u + lamda*I;
    u = u + 3*V_u - 12*u_u;
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
plot(tspan,VV,[0 10 10 15 15 70 70 75 75 80 80 85 85 max(tspan)],...
          -85+[0 0  5  5  0  0  -5 -5 0  0  5  5  0  0]);
axis([0 max(tspan) -90 30])
axis off;
title('(O) thresh. variability');

%%%%%%%%%%%%%% (P) bistability %%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,16) 
a=0.1;  b=0.26; c=-60;  d=0; delta=2000; lamda=500;
V=-61*delta;  u=b*V;
V_u=-61;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:1200; %%300%%
T1=tspan(end)/8;
T2 = 864; %%216%%
for t=tspan
    if ((t>T1) & (t < T1+20)) | ((t>T2) & (t < T2+20)) %%((t>T1) & (t < T1+5)) | ((t>T2) & (t < T2+5))%%
        I=1.24;
    else
        I=0.24;
    end;
    V = V + 20*V_u^2 + 2500*V_u + lamda*140 - lamda*u_u + lamda*I;
    u = u + 13*V_u - 50*u_u;
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
plot(tspan,VV,[0 T1 T1 (T1+5) (T1+5) T2 T2 (T2+5) (T2+5) max(tspan)],-90+[0 0 10 10 0 0 10 10 0 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(P) bistability');

%%%%%%%%%%%%%% (Q) DAP %%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,17) 
a=1;  b=0.2; c=-60;  d=-21; delta=250; lamda=25;
V=-70*delta;  u=b*V;
V_u=-70;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:500; %%50%%
T1 = 100;
for t=tspan
     if abs(t-T1)<10 %%1%%
        I=20;
    else
        I=0;
    end;
    V = V + V_u^2 + 125*V_u + 140*lamda - lamda*u_u + lamda*I;
    u = u + 5*V_u - 5*u_u;
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
plot(tspan,VV,[0 T1-1 T1-1 T1+1 T1+1 max(tspan)],-90+[0 0 10 10 0 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(Q) DAP         ');

%%%%%%%%%%%%%% (R) accomodation %%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,18) 
a=0.02;  b=1; c=-55;  d=4; delta=100; lamda=50;
V=-65*delta;  u=-16*delta;
V=-65;  u=-16;
VV=[];  uu=[];  II=[];
tau = 1; tspan = 0:tau:800; %%400%%
for t=tspan
    if (t < 400) 			%%200%%
        I=t/25;
    elseif t < 600 			%%300%%
        I=0;
    elseif t < 625 			%%312.5%%
        I=(t-600)/12.5*4;	%%(t-300)/12.5*4%%
    else
        I=0;
    end;
    V = V + 2*V_u^2 + 250*V_u + 140*lamda - u_u*lamda + I*lamda;
    u = u + (V_u+65);
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
    II(end+1)=I;
end;
plot(tspan,VV,tspan,II*1.5-90);
axis([0 max(tspan) -90 30])
axis off;
title('(R) accomodation');

%%%%%%%%%%%%%% (S) inhibition induced spiking %%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,19) 
a=-0.02;  b=-1; c=-60;  d=8; delta=100; lamda=50;
V=-63.8*delta;  u=b*V;
V_u=-63.8;
u_u= b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:700; %%350%%
for t=tspan
       if (t < 100) | (t>500) %%50, 250%%
        I=80;
    else
        I=75;
    end;
    V = V + 2*V_u^2 + 250*V_u + 140*lamda - u_u*lamda + I*lamda;
    u = u - V_u - u_u;
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
plot(tspan,VV,[0 50 50 250 250 max(tspan)],-80+[0 0 -10 -10 0 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(S) inh. induced sp.');

%%%%%%%%%%%%%% (T) inhibition induced bursting %%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,20) 
a=-0.026;  b=-1; c=-45;  d=-2; delta=1000; lamda=500;
V=-63.8*delta;  u=b*V;
V_u=-63.8;
u_u=b*V_u;
VV=[];  uu=[];
tau = 1; tspan = 0:tau:700; %%350%%
for t=tspan
       if (t < 100) | (t>500) %%50, 250%%
        I=80;
    else
        I=75;
    end;
    V = V + 20*V_u^2 + 2500*V_u + lamda*140 - lamda*u_u + lamda*I;
    u = u + 13*V_u + 13*u_u;
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
plot(tspan,VV,[0 50 50 250 250 max(tspan)],-80+[0 0 -10 -10 0 0]);
axis([0 max(tspan) -90 30])
axis off;
title('(T) inh. induced brst.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(gcf,'Units','normalized','Position',[0.3 0.1 0.6 0.8]);

%%%% Derived Eqs %%%%%
% Delta*V = Delta*V + C1*Lamda*V^2 + C2*Lamda*V + C3*Lamda - Lamda*u + Lamda*I;
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