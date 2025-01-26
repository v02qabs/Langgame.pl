#!/usr/bin/perl
use strict;
use warnings;

# 単語帳のファイル名
my $filename = 'wordlist.txt';

# 単語帳に単語を追加する関数
sub add_word {
    my ($word, $meaning) = @_;
    open(my $fh, '>>', $filename) or die "Could not open file '$filename' $!";
    print $fh $word."\n".$meaning."\n"	;
    close $fh;
    print "Added \"$word\" with meaning \"$meaning\" to the word list.\n";
}

# 単語帳を表示する関数
sub display_wordlist {
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    print "Word List:\n";
    while (my $line = <$fh>) {
        print $line;
    }
    close $fh;
}

# メインプログラム
while (1) {
    print "Choose an option:\n";
    print "1. Add a word\n";
    print "2. Display word list\n";
    print "3. Exit\n";
    print "Enter your choice: ";
    
    my $choice = <STDIN>;
    chomp $choice;

    if ($choice == 1) {
        print "Enter the word: ";
        my $word = <STDIN>;
        chomp $word;
        print "Enter the meaning: ";
        my $meaning = <STDIN>;
        chomp $meaning;
        add_word($word, $meaning);
    } elsif ($choice == 2) {
        display_wordlist();
    } elsif ($choice == 3) {
        last;
    } else {
        print "Invalid choice. Please enter 1, 2, or 3.\n";
    }
}

print "Goodbye!\n";

