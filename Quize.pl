#!/usr/bin/perl
use strict;
use warnings;
use utf8; # UTF-8を扱うためのモジュール
use open ':std', ':encoding(UTF-8)'; # 標準入出力とファイルをUTF-8で扱う

# クイズデータ
my @quizzes;

# words.csv ファイルから問題を読み込む
my $filename = 'words.csv';
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename': $!";

while (my $line = <$fh>) {
    chomp $line; # 行末の改行を削除
    # CSV形式の行をカンマで分割
    my ($question, $answer) = split(/,/, $line, 2); # 2は分割数を制限して、答えにカンマがあっても対応できるようにする

    # 質問と答えの前後の空白をトリム
    $question =~ s/^\s+|\s+$//g;
    $answer =~ s/^\s+|\s+$//g;

    # データが有効な場合のみ追加
    if (defined $question && defined $answer && $question ne '' && $answer ne '') {
        push @quizzes, { question => $question, answer => $answer };
    }
}
close $fh;

my $score = 0;
my $total_questions = @quizzes;

if ($total_questions == 0) {
    print "エラー: 'words.csv' ファイルに問題が見つかりませんでした。ファイルが正しい形式で存在するか確認してください。\n";
    exit;
}

print "--- Perl クイズゲームへようこそ！ ---\n";
print "全部で $total_questions 問あります。\n\n";

foreach my $q_data (@quizzes) {
    print "質問: " . $q_data->{question} . "\n";
    print "あなたの答え: ";
    my $user_answer = <STDIN>; # ユーザー入力を受け取る

    # ここがポイント: chomp関数で末尾の改行文字を削除
    chomp $user_answer;

    # さらに、入力の先頭と末尾にある余分な空白（スペース、タブなど）も削除し、
    # 比較をより堅牢にします。（ユーザーが誤ってスペースを入れても対応）
    $user_answer =~ s/^\s+|\s+$//g;

    # 正しい答えも、念のため前後の空白を削除して比較に備えます。
    my $normalized_correct_answer = $q_data->{answer};
    # 正しい答えは既にファイル読み込み時にトリムされているので、ここでは不要ですが、
    # 念のため残すこともできます。今回はファイル読み込み時に対応済みとします。

    if ($user_answer eq $normalized_correct_answer) {
        print "正解！\n\n";
        $score++;
    } else {
        print "不正解！ 正しい答えは「" . $q_data->{answer} . "」です。\n\n";
    }
}

print "--- ゲーム終了！ ---\n";
print "あなたのスコア: $score / $total_questions\n";

if ($score == $total_questions) {
    print "素晴らしい！全問正解です！\n";
} elsif ($score >= $total_questions / 2) {
    print "よくできました！\n";
} else {
    print "また挑戦してくださいね！\n";
}

print "-----------------------\n";
