#!perl -w

use DBI;
use Test::More;
use DBI qw(:sql_types);
#use strict;

use vars qw($db $port $hostname); 

$db=$ARGV[0];
$port=$ARGV[2];
$hostname=$ARGV[1];
my $user="dba";
my $pass="";

my $dsn="dbi:cubrid:database=$db;host=$hostname;port=$port";
my $dbh;
$dbh=DBI->connect($dsn, $user, $pass,{RaiseError => 1}) or die "connect error: $dbh->errstr";
$dbh -> do("drop table if EXISTS tdb;") or die "drop error: $dbh->errstr";
$dbh -> do("create table tdb (dt date, tm time, dtt datetime);") or die "create error: $dbh->errstr";

my @typenames=("CHAR","VARCHAR","BIT","BIT VARYING","NUMERIC","DECIMAL","INTEGER","SMALLINT","REAL","FLOAT","DOUBLE","DATE","TIME","TIMESTAMP","BIGINT","TIMESTAMP","BLOB","CLOB");
my $i=0;
my $type_info=$dbh->type_info(1) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(12) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(-2) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(-3) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(2) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(3) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(4) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(5) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(7) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(6) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(8) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(91) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(92) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(93) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(-5) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(93) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(30) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;

my $type_info=$dbh->type_info(40) or die  $dbh->errstr ."type_info error\n";
is($type_info->{TYPE_NAME},$typenames[$i++],"type_info ok") ;


done_testing();

$dbh->disconnect();





