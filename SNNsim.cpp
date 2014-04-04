// SNNSim, a one layer feed-forward network with axonal conduction delays and STDP, 
// to be used as a baseline by which to judge experiments run on a SpiNNaker board
// Created by Matthew A. Frazier, April 1, 2014
// Adapted from SPNET, created by Eugene M. Izhikevich, May 17, 2004, San Diego, CA
// Saves spiking data each second in file spikes.dat
// To plot spikes, use MATLAB code: load spikes.dat;plot(spikes(:,1),spikes(:,2),'.');
#include <iostream>
#include <math.h>
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>

using namespace std;

#define getrandom(max1) ((rand()%(int)((max1)))) // random integer between 0 and max-1
												
const	int		Ni = 48;		// input neurons			
const	int		No = 16;		// output neurons				 
const	int		N  = Ni+No;		// total number of neurons	
const	int		M  = 16;		// the number of synapses per input neuron 
const	int		D  = 20;		// maximal axonal conduction delay
		float	sm = 10.0;		// maximal synaptic strength		
int		post[Ni][M];				// indeces of postsynaptic neurons
float	s[Ni][M], sd[Ni][M];		// matrix of synaptic weights and their derivatives
short	delays_length[N][D];	// distribution of delays
short	delays[N][D][M];		// arrangement of delays   
int		N_pre[N], I_pre[N][3*M], D_pre[N][3*M];	// presynaptic information
float	*s_pre[N][3*M], *sd_pre[N][3*M];		// presynaptic weights
float	LTP[N][1001+D], LTD[N];	// STDP functions 
float	a[N], d[N];				// neuronal dynamics parameters
float	v[N], u[N];				// activity variables
int		N_firings;				// the number of fired neurons 
const int N_firings_max=100*N;	// upper limit on the number of fired neurons per sec
int		firings[N_firings_max][2]; // indeces and timings of spikes

void initialize()
{	int i,j,k,jj,dd, exists, r;
	for (i=0;i<N;i++) a[i]=0.02;// All RS type

	for (i=0;i<N;i++) d[i]=6.0; // All RS type (8)

	for (i=0;i<Ni;i++) for (j=0;j<M;j++) for (k=Ni;k<N;k++)
	{	
		post[i][j]=k; //Ni->No mapping
	}
	for (i=0;i<N;i++)	for (j=0;j<M;j++) s[i][j]=(getrandom(12)-5);  // random initial synaptic weights on [-5.0, 6.0]
  	for (i=0;i<N;i++)	for (j=0;j<M;j++) sd[i][j]=0.0; // synaptic derivatives 
  	for (i=0;i<N;i++)
	{
		short ind=0;
		if (i<Ni)
		{
			for (j=0;j<D;j++) 
			{	delays_length[i][j]=M/D;	// uniform distribution of input synaptic delays
				for (k=0;k<delays_length[i][j];k++)
					delays[i][j][k]=ind++;
			}
		}
		else
		{
			for (j=0;j<D;j++) delays_length[i][j]=0;
			delays_length[i][0]=M;			// all output delays are 1 ms
			for (k=0;k<delays_length[i][0];k++)
					delays[i][0][k]=ind++;
		}
	}
	
  	for (i=0;i<N;i++)
	{
		N_pre[i]=0;
		for (j=0;j<Ni;j++)
		for (k=0;k<M;k++)
		if (post[j][k] == i)		// find all presynaptic neurons 
		{
			I_pre[i][N_pre[i]]=j;	// add this neuron to the list
			for (dd=0;dd<D;dd++)	// find the delay
				for (jj=0;jj<delays_length[j][dd];jj++)
					if (post[j][delays[j][dd][jj]]==i) D_pre[i][N_pre[i]]=dd;
			s_pre[i][N_pre[i]]=&s[j][k];	// pointer to the synaptic weight	
			sd_pre[i][N_pre[i]++]=&sd[j][k];// pointer to the derivative
		}
	}

	for (i=0;i<N;i++)	for (j=0;j<1+D;j++) LTP[i][j]=0.0;
	for (i=0;i<N;i++)	LTD[i]=0.0;
	for (i=0;i<N;i++)	v[i]=-65.0;		// initial values for v
	for (i=0;i<N;i++)	u[i]=0.2*v[i];	// initial values for u

	N_firings=1;		// spike timings
	firings[0][0]=-D;	// put a dummy spike at -D for simulation efficiency 
	firings[0][1]=0;	// index of the dummy spike
}

void getInput(char* str)
{
	int n = (int) getrandom(26);
	switch (n)
	{
		case 0:
			strcpy(str, "000000001100010010010010011110010010010010010010A");
			break;
	
		case 1:
			strcpy(str, "000000011100010010010010011100010010010010011100B");
			break;
	
		case 2:
			strcpy(str, "000000011100100010100000100000100000100010011100C");
			break;
	
		case 3:
			strcpy(str, "000000111100010010010010010010010010010010111100D");
			break;
	
		case 4:
			strcpy(str, "000000011110010000010000011100010000010000011110E");
			break;
	
		case 5:
	 		strcpy(str, "111111110000010000010100011100010100010000110000F");
			break;

		case 6:
			strcpy(str, "001010010110110001100000100000100111110010011110G");
			break;
	
		case 7:
			strcpy(str, "000000010010010010010010011110010010010010010010H");
			break;
	
		case 8:
			strcpy(str, "000000011110001100001100001100001100001100011110I");
			break;
	
		case 9:
			strcpy(str, "000000111111000100000100000100100100100100111100J");
			break;
	
		case 10:
			strcpy(str, "000000010010010110010100011000010100010110010010K");
			break;
	
		case 11:
			strcpy(str, "000000110000010000010000010000010000010010111110L");
			break;

		case 12:
			strcpy(str, "000000110011110011111111101101101101100001100001M");
			break;
	
		case 13:
			strcpy(str, "000000100001110001111001101101100111100011100001N");
			break;
	
		case 14:
			strcpy(str, "000000001100010010010010010010010010010010001100O");
			break;
	
		case 15:
			strcpy(str, "000000011100010010010010011100010000010000010000P");
			break;
	
		case 16:
			strcpy(str, "000000001110010001010001010001010101010010001101Q");
			break;
	
		case 17:
			strcpy(str, "000000011100010010010010011100010100010010010010R");
			break;

		case 18:
			strcpy(str, "000000001100010010010000011000000110010010001100S");
			break;
	
		case 19:
			strcpy(str, "000000111111111111001100001100001100001100001100T");
			break;
	
		case 20:
			strcpy(str, "000000010010010010010010010010010010010010001100U");
			break;
	
		case 21:
			strcpy(str, "000000110011110011010010010010010010001100001100V");
			break;
	
		case 22:
			strcpy(str, "000000100001100001100001101101111111110011100001W");
			break;
	
		case 23:
			strcpy(str, "000000110011100001010010001100010010100001110011X");
			break;

		case 24:
			strcpy(str, "000000100001110011011110001100001100001100001100Y");
			break;
	
		case 25:
			strcpy(str, "000000111111100011000110001100011000110001111111Z");
			break;

		default:
			strcpy(str, "0000000000000000000000000000000000000000000000000");
	}
}

int main()
{
	int		i, j, k, sec, t;
	float	I[N];
	FILE	*fs;

	initialize();	// assign connections, weights, etc. 

	for (sec=0; sec<60*60*24; sec++)		// simulation of 1 day
	{
		for (i=0;i<N;i++) I[i] = 0.0;	// reset the input 
		char inVect[49];
		getInput(inVect);
		for (k=0;k<48;k++)
			if (inVect[k]=='1') I[k]=20.0;	// input vector current assignment for the next second
		for (t=0;t<1000;t++)				// simulation of 1 sec
		{
			for (i=0;i<N;i++) 
			if (v[i]>=30)					// did it fire?
			{
				v[i] = -65.0;					// voltage reset
				u[i]+=d[i];					// recovery variable reset
				LTP[i][t+D]= 0.1;		
				LTD[i]=0.12;
				for (j=0;j<N_pre[i];j++) *sd_pre[i][j]+=LTP[I_pre[i][j]][t+D-D_pre[i][j]-1];// this spike was after pre-synaptic spikes
				firings[N_firings  ][0]=t;
				firings[N_firings++][1]=i;
				if (N_firings == N_firings_max) {cout << "Too many spikes at t=" << t << " (ignoring all)";N_firings=1;}
			}
			k=N_firings;
			while (t-firings[--k][0] <D)
			{
				for (j=0; j< delays_length[firings[k][1]][t-firings[k][0]]; j++)
				{
					i=post[firings[k][1]][delays[firings[k][1]][t-firings[k][0]][j]]; 
					I[i]+=s[firings[k][1]][delays[firings[k][1]][t-firings[k][0]][j]];
					if (firings[k][1] < Ni) // this spike is before postsynaptic spikes
						sd[firings[k][1]][delays[firings[k][1]][t-firings[k][0]][j]]-=LTD[i];
				}
			}
			for (i=0;i<N;i++)
			{
				//TODO: Alter this for integer computation?
				v[i]+=0.5*((0.04*v[i]+5)*v[i]+140-u[i]+I[i]); // for numerical stability
				v[i]+=0.5*((0.04*v[i]+5)*v[i]+140-u[i]+I[i]); // time step is 0.5 ms
				u[i]+=a[i]*(0.2*v[i]-u[i]);
				LTP[i][t+D+1]=0.95*LTP[i][t+D];
				LTD[i]*=0.95;
			}
		}
		cout << "sec=" << sec << ", firing rate=" << float(N_firings)/N << "\n";
   		//TODO: print out spike data only from output neurons, rather than from all
   		fs = fopen("spikes.dat","a");
   		fprintf(fs, "Input Letter: %c\n", inVect[48]);
		for (i=1;i<N_firings;i++)
			if (firings[i][0] >=0)
				fprintf(fs, "%d  %d\n", firings[i][0], firings[i][1]);
		fclose(fs);

		for (i=0;i<N;i++)		// prepare for the next sec
			for (j=0;j<D+1;j++)
			LTP[i][j]=LTP[i][1000+j];
		k=N_firings-1;
		while (1000-firings[k][0]<D) k--;
		for (i=1;i<N_firings-k;i++)
		{
			firings[i][0]=firings[k+i][0]-1000;
			firings[i][1]=firings[k+i][1];
		}
		N_firings = N_firings-k;

		for (i=0;i<Ni;i++)	// modify only input connections
		for (j=0;j<M;j++)
		{
			s[i][j]+=0.01+sd[i][j];
			sd[i][j]*=0.9;			
			if (s[i][j]>sm) s[i][j]=sm;
			if (s[i][j]<0) s[i][j]=0.0;
		}
	}
	return 0;
}