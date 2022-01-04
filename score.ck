// score.ck

BPM tempo;
tempo.tempo(150.0);

// call files
me.dir() + "drums.ck" => string drumPath;
me.dir() + "wurley.ck" => string wurleyPath;
me.dir() + "bass.ck" => string bassPath;
me.dir() + "mallet.ck" => string malletPath;


// set up song structure
Machine.add(drumPath) => int drumID;
Machine.add(wurleyPath) => int wurleyID;
Machine.add(bassPath) => int bassID;
Machine.add(malletPath) => int malletID;
16.0 * tempo.qN => now;

Machine.remove(drumID);
16.0 * tempo.qN => now; //take out drums for a bit

Machine.add(drumPath) => drumID; // drums back





