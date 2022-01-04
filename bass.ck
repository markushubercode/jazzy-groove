// bass.ck
<<<"Markus Huber">>>;
//sound chain
Moog mog => LPF filt => dac;
200 => filt.freq;


[[60, 65, 60, 59],[58, 63, 58, 59],[64,68,62,67]] @=> int bassLine[][]; // bass line notes
[[.8, .4, 1.6,.4],[.8, .4, 1.6, .4 ],[.8, .8, .8, .8]] @=> float ridim[][]; // rhythm of the bass line

while (true) // playing notes according to the chord changes of the song
{ 
    for (0 => int i; i < 4; i++) 
    {
        Std.mtof(bassLine[0][i]-12) => mog.freq;
        Math.random2f(0.5, 1) => mog.noteOn;
        ridim[0][i]::second => now;  
    } 
    for (0 => int i; i < 4; i++)
    {
        Std.mtof(bassLine[1][i]-12) => mog.freq;
        Math.random2f(0.5, 1) => mog.noteOn;
        ridim[1][i]::second => now;  
    } 
    repeat (2)
    {
        for (0 => int i; i < 4; i++)
        {
            Std.mtof(bassLine[0][i]-12) => mog.freq;
            Math.random2f(0.5, 1) => mog.noteOn;
            ridim[0][i]::second => now;  
        } 
    }
    for (0 => int i; i < 4; i++)
    {
        Std.mtof(bassLine[2][i]-12) => mog.freq;
        Math.random2f(0.5, 1) => mog.noteOn;
        ridim[2][i]::second => now;  
    } 
    
}
