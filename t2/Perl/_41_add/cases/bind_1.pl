#!perl -w 

use DBI;
use Test::More;
use DBI qw(:sql_types);
use vars qw($db $port $hostname); 

$db=$ARGV[0];
$port=$ARGV[2];
$hostname=$ARGV[1];
my $user="dba";
my $pass="";

my $dsn="dbi:cubrid:database=$db;host=$hostname;port=$port";
my $dbh;
$dbh=DBI->connect($dsn, $user, $pass,{RaiseError => 1}) or die "connect err: $dbh->errstr";

$dbh -> do("drop table if EXISTS tdb;") or die "drop error: $dbh->errstr";
$dbh -> do("create table tdb(id int, name char(20));") or die "create error: $dbh->errstr";
$dbh -> do("insert into tdb values(1,'Johny'),(2,'lisi'),(3,'wangwu'),(4,'mazi');") or die "insert error:$dbh->errstr";

my $sth=$dbh->prepare("delete from tdb where id=?;") or die "delete error: $dbh->errstr";

my $bdRs=$sth->bind_param(1,2, SQL_INTEGER) or die "bind_param error: $dbh->errstr";
print "$dbh->errstr\n";
print "Value: $bdRs\n";
$sth->execute() or die "execute error: $dbh->errstr";

$sth->finish();
$dbh -> disconnect();
