#!/usr/bin/perl
use v5.34;
use strict;
use warnings;

sub latexmk {
	my ($command) = @_;
	my @path = `$command`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		print $tex[$i]; # print current tex file
		system("latexmk -lualatex $tex[$i]"); # latexmk all files
	}
}
sub lualatex {
	my ($command) = @_;
	my @path = `$command`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		print $tex[$i]; # print current tex file
		system("lualatex $tex[$i]"); # latexmk all files
	}
}
sub pdflatex {
	my ($command) = @_;
	my @path = `$command`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		print $tex[$i]; # print current tex file
		system("pdflatex $tex[$i]"); # latexmk all files
	}
}
sub xelatex {
	my ($command) = @_;
	my @path = `$command`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		print $tex[$i]; # print current tex file
		system("xelatex $tex[$i]"); # latexmk all files
	}
}
sub help {
	say "Welcome to the Perlxmk LaTeX compiler helper. It can compile MULTIPLE .tex files with your chosen compilator.";
	say "Usage:\t -d LaTeXm -lualatex";
	say "      \t -l LuaLaTeX";
	say "      \t -x XeLaTeX";
	say "      \t -p pdfLaTeX";
	say "      \t --subfile compile from subfile (as second arg obv)";
	say "      \t -h print this help";
	print "\n";
	say "Completed testing 04/03/2022 1748Z, Rome, Perl People's Programming Republic";
	say "Author, tester and self appointed Supreme Leader of the PPPR:";
	say "-MC";
}

my $arg = $ARGV[0];
my $command = "ls -d \$(pwd)/*";
if( ! length $ARGV[0] ) {
	say "ERROR: no compiler chosen";
	exit 1;
} elsif( length $ARGV[0] && ! length $ARGV[1]) {
	$arg = $ARGV[0];
} elsif( length $ARGV[0] && $ARGV[1] eq "--subfile") {
	$arg = $ARGV[0];
	$command = "ls -d \$(dirname \$(pwd))/*";
} else {
	say "PANIC: what????";
	help();
	exit 1;
}
if($arg eq "-d") {
	latexmk($command);
} elsif($arg eq "-l") {
	lualatex($command);
} elsif($arg eq "-x") {
	xelatex($command);
} elsif($arg eq "-p") {
	pdflatex($command);
} elsif($arg eq "-h") {
	help();
} else {
	say "WARNING: incorrect usage! Check the help here below (it's the same that pops out with -h)";
	help();
}
exit 0;
