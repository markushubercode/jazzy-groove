public class BPM 
{
    dur myTime[4];
    static dur qN, eN, sN, tN; // quarter, eighth, sixteenth, 32nd
    
    fun void tempo (float beat)
    {
        60.0/beat => float timer;
        timer::second => qN;
        qN * .5 => eN;
        eN * .5 => sN;
        sN * .5 => tN;
        
        [qN, eN, sN, tN] @=> myTime;
    }
}