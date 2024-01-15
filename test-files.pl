use strict;
use warnings;

# 引数の処理
my $file = shift;
&Question($file, "question");


#問題のみリストアップ。
sub Question{
	my ($file, $question) = @_;

	unless ($file) {
 	   die "Usage: $0 file"; # 引数がないときは、使用方法を示して終了。
	}

	# csvの各列に対応するキーを作成
	my $headers = [ "question", "Answer"]; 

	# ファイルを解析してcsv形式のデータを配列の配列に変換。
	# ヘッダのキーも引数として渡す。
	my @recs = parse_file($file, $headers);

print "@recs"."\n";

	# 出力( ハッシュの配列なので、forでたどる )
	for( my $itemss=0; $itemss< @$recs; $itemss++ ){
		print "items: ".$itemss."\n";
		print "values: ".$recs[$itemss]."\n";
	  # ハッシュスライスを利用して連結
	 # 	push $items.$recs;
#	 print join(',', @{$items}{$question}) . "\n";
	
	}
}

# ファイル解析用の関数( 今回は単に書き戻すだけだけれど・・ )
sub parse_file {
  my ($file, $headers) = @_;
  
  open(my $fh, "<", $file)
    or die "Cannot open $file for read: $!";
  
  # 複数のレコードを格納する配列へのリファレンスを準備
  my $recs = []; 
    while (my $line = <$fh>) {
      # 改行を取り除く
      chomp $line; 
      
      # データを格納するハッシュへのリファレンスを準備
      # ハッシュスライスを利用してヘッダ
      # に対応するキーに代入
      my $items = {}; 
      @{$items}{@$headers} = split(',', $line);

      # push関数の第1引数は配列なので、@$recsとデリファレンス。
      push @$recs, $items; 
    }
    close $fh;    
    wantarray ? return @$recs : return $recs; 
}

