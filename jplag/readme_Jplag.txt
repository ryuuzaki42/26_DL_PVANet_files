JPlag - Detecting Software Plagiarism

https://github.com/jplag/jplag
http://www.jplag.de/

$ java -jar jplag-Version -l linguagem -s Pasta

$ java -jar jplag-2.11.9-SNAPSHOT-jar-with-dependencies.jar -l c/c++ -s pra3/

$ java -jar jplag-2.11.9-SNAPSHOT-jar-with-dependencies.jar
JPlag (Version 2.11.9-SNAPSHOT), Copyright (c) 2004-2015 KIT - IPD Tichy, Guido Malpohl, and others.
Usage: JPlag [ options ] <root-dir>
 <root-dir>        The root-directory that contains all submissions

options are:
 -v[qlpd]        (Verbose)
                 q: (Quiet) no output
                 l: (Long) detailed output
                 p: print all (p)arser messages
                 d: print (d)etails about each submission
 -d              (Debug) parser. Non-parsable files will be stored.
 -S <dir>        Look in directories <root-dir>/*/<dir> for programs.
                 (default: <root-dir>/*)
 -s              (Subdirs) Look at files in subdirs too (default: deactivated)

 -p <suffixes>   <suffixes> is a comma-separated list of all filename suffixes
                 that are included. ("-p ?" for defaults)

 -o <file>       (Output) The Parserlog will be saved to <file>
 -x <file>       (eXclude) All files named in <file> will be ignored
 -t <n>          (Token) Tune the sensitivity of the comparison. A smaller
                 <n> increases the sensitivity.
 -m <n>          (Matches) Number of matches that will be saved (default:20)
 -m <p>%         All matches with more than <p>% similarity will be saved.
 -r <dir>        (Result) Name of directory in which the web pages will be
                 stored (default: result)
 -bc <dir>       Name of the directory which contains the basecode (common framework)
 -l <language>   (Language) Supported Languages:
                 java17 (default), java15, java15dm, java12, java11, python3, c/c++, c#-1.2, char, text, scheme
