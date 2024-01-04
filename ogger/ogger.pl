#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;
use File::Copy;
use File::Find::Rule;
use File::Spec;
use Cwd qw(getcwd);


my ($i, $j, $ffr, $startdir, $vdir, $cdir);
my (@files, @tmpa);
my %done;

$startdir = getcwd();
$ffr = File::Find::Rule->new;
$ffr->file;
$ffr->name('*.flac');
@files = $ffr->in('.');

if (! -d "/home/scott/vorbis") {
	mkdir("/home/scott/vorbis");
}

foreach $i (@files) {
	@tmpa = File::Spec->splitdir($i);
	$j = @tmpa - 2;

	if (exists($done{$tmpa[$j]})) {
		next;
	}

	$done{$tmpa[$j]} = 1;
	$cdir = dirname($i);
	$vdir = "/home/scott/vorbis/".$cdir;
	mkdir($vdir);
	$vdir .= "/";
	chdir($cdir);
	print("\n-- processing files in ".$cdir." ...\n\n");
	system('oggenc -q 7 *.flac');
	@tmpa = glob("*.ogg");

	foreach $j (@tmpa) {
		move($j, $vdir);
	}

	chdir($startdir);
}

exit(0);
