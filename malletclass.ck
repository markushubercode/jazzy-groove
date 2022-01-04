public class Bar
{
    ModalBar mod => Delay dly =>  NRev rev => Gain master => dac;
    dly => dly;
    0.8::second => dly.max;
    600::ms => dly.delay;
    0.5 => dly.gain;
    
    9 => mod.preset;
      
    fun void freq (float f)
    {
        f => mod.freq;
    }
    fun void rmix (float r)
    {
        r => rev.mix;
    }
    fun void noteOn (float vol)
    {
        vol => mod.noteOn;     
    }
    fun void strikePosition (float num)
    {
        num => mod.strikePosition;
    }
}