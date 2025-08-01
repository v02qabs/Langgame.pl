#!/usr/bin/perl
use strict;
use warnings;
use utf8; # UTF-8を扱うためのモジュール
use open ':std', ':encoding(UTF-8)';

# クイズデータ
# キーが質問、値が答えのハッシュリファレンス
# このバージョンでは、答えは基本的に単一行を想定します。
my @quizzes = (
    { question => "〜を曲がる。", answer => "turn" },
    { question => "世話（名）", answer => "	care" },
    { question => "〜を描写する。", answer => "describe" },
    { question => "（費用が）〜かかる。", answer => "cost" },
    { question => "加わる", answer => "join" },
				{ question => "パン屋" , answer => "bakery"
				"},
);

my $score = 0;
my $total_questions = @quizzes;

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
    $normalized_correct_answer =~ s/^\s+|\s+$//g;

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
