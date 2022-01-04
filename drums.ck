// drums.ck

<<<"Markus Huber">>>;

//sound chain
SndBuf kick => Gain master => dac;
SndBuf snare => master;
SndBuf hihat => master;

me.dir(-1) + "audio/kick_03.wav" => kick.read;
me.dir(-1) + "audio/snare_01.wav" => snare.read;
me.dir(-1) + "audio/hihat_02.wav" => hihat.read;

// patterns of inidivudal instruments
[1,0,0,1,1,0,0,1,0,0,2,1,1,0,0,0] @=> int kickPattern[]; 
[0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0] @=> int snarePattern[];
[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] @=> int hihatPattern[];

kick.samples() => kick.pos; //reset position so no initial sound
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;

BPM tempo; // bpm public class

while (true)
{
    tempo.qN => dur quarter; // set tempo
    // go through the kick pattern
    for (0 => int i; i < kickPattern.cap(); i++)
    {
        if (kickPattern[i] == 1)
        {         
            0.6 => kick.gain;
            0 => kick.pos;    
        }
        //snare pattern
        if (snarePattern[i] == 1)
        {
            0.6 => snare.gain;
            0.9 => snare.rate;
            0 => snare.pos;
        }
       // hihat pattern
        if (hihatPattern[i] == 1)
        {
            1.2 => hihat.rate;
            0.02 => hihat.gain;
            0 => hihat.pos;
        }
       quarter => now;//set tempo
    }
}