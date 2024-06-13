#!/usr/bin/perl
use strict;
use warnings;

# 単語帳のファイル名
my $filename = 'wordlist.txt';

# 単語帳を読み込む関数
sub load_wordlist {
    my %wordlist;
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    while (my $line = <$fh>) {
        chomp $line;
        my ($word, $meaning) = split /: /, $line, 2;
        $wordlist{$word} = $meaning;
    }
    close $fh;
    return %wordlist;
}

# メインプログラム
while (1) {
    my %wordlist = load_wordlist();
    if (keys %wordlist == 0) {
        print "Word list is empty. Please add words to the list first.\n";
        last;
    }

    my @words = keys %wordlist;
    my $word = $words[int(rand(@words))];
    my $meaning = $wordlist{$word};

    print "What is the meaning of \"$word\"? (Type 'Q' to quit): ";
    my $answer = <STDIN>;
    chomp $answer;

    if (uc($answer) eq 'Q') {
        last;
    } elsif ($answer eq $meaning) {
        print "Correct!\n";
    } else {
        print "Incorrect. The correct answer is \"$meaning\".\n";
    }
}

print "Goodbye!\n";

