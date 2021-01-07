#include "Vsynth.h"
#include "verilated.h"
#include <iostream>
#include <string>
#include "wav.h"

int main(int argc, char** argv, char** env) {
	float sampleRate = 44100; 
    float duration = 31;     
	float frameData[1];
	int freq = 10024;

    int nSamples = (int)(duration*sampleRate);
    Wave mySound = makeWave((int)sampleRate,1,16);
    waveSetDuration( &mySound, duration );
	
	
	int clk = 1;
	int clk_t = 0;
	int thingos = 0;
	float runtime = 0;
	std::string k;
	Verilated::commandArgs(argc, argv);
	
	Vsynth* syn = new Vsynth();
	syn->freq = freq;
	while (!Verilated::gotFinish() && thingos++ < 30 * sampleRate * 1) {
		syn->clk = clk;
		syn->eval();		
		clk_t++;
		if (clk_t == 1) {
			clk_t = 0;
			clk ^= 1;
			frameData[0] = ((float)syn->sample - 32768.0) / 65000.0;
			
			runtime += (1.0 / 44100.0);
			
			waveAddSample( &mySound, frameData );
		}
	}
	waveToFile( &mySound, "output.wav");
    waveDestroy( &mySound );
	delete syn;
	exit(0);
}
