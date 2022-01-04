// modal bar

BPM tempo; //public class for tempo
Bar mallet; // public class for the settings of this instrument

while (true)
{
    Math.random2(1,3) => int factor;//variety factor
    tempo.eN => dur eighth;//tempo
    60-12 => mallet.freq; //frequency
    1 => mallet.strikePosition; 
    0.09 => mallet.rmix; //verb mix
    Math.random2f(0.0, 1) => mallet.noteOn;
    eighth*factor => now; //advance time
}