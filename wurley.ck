// wurley.ck

<<<"Markus Huber">>>;

//sound chain
SinOsc chords[4];
Gain master => ADSR env => NRev rev => dac;
0.2 => rev.mix;
0.6 => master.gain;
(0.4::second, 0.5::second, 0.8, 0.5::second) => env.set; //env set

for (0 => int i; i < chords.cap(); i++)
{
    chords[i] => master;
    0.5/chords.cap() => chords[i].gain;
} 

// create chords out of chords array
fun void playChords (int root, string quality, float length)
{
    Std.mtof(root) => chords[0].freq;
    Std.mtof(root + 7) => chords[2].freq;
    
    if (quality == "major")
    {
        Std.mtof (root + 4) => chords[1].freq;
        Std.mtof (root + 11) => chords[3].freq;
    }
    else if (quality == "minor")
    {
        Std.mtof (root + 3) => chords[1].freq;
        Std.mtof (root + 10) => chords[3].freq;        
    }
    length::second => now;    
}

// play chord progression
while (true)
{
    repeat (2)
    {
        1 => env.keyOn;
        playChords(60, "major", .8); 
        1 => env.keyOff;
        playChords(65, "major", .8);   
    }
    
    repeat (2)
    {
        1 => env.keyOn;
        playChords(58, "major", .8); 
        1 => env.keyOff;
        playChords(63, "major", .8);   
    }
    repeat (4)
    {
        1 => env.keyOn;
        playChords(60, "major", .8); 
        1 => env.keyOff;
        playChords(65, "major", .8);   
    }  
    
    1 => env.keyOn;
    playChords(64, "minor", .8); 
    1 => env.keyOff;
    playChords(68, "major", .8); 
    1 => env.keyOff;
    1 => env.keyOn;
    playChords(62, "minor", .8);
    1 => env.keyOff;
    playChords(67, "major", .8);  
    1 => env.keyOff;   
}



