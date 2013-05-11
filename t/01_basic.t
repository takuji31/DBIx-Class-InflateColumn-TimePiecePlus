use strict;
use warnings;
use utf8;
use Test::More;

use lib './t';
use TestDB;

use Time::Piece::Plus;

my $ddl = 'create table test(id INTEGER PRIMARY KEY, created_at DATETIME, created_on DATE, updated_at TIMESTAMP);';

my @dsn = ('dbi:SQLite:test.db', '', '');

my $schema = TestDB->connect(@dsn);

$schema->storage->dbh->do($ddl);

my $now = localtime();

my $row = $schema->resultset('Test')->create(
    {
        created_at => $now,
        created_on => $now,
        updated_at => $now,
    }
);

isa_ok $row->created_at, 'Time::Piece::Plus', 'Insert DATETIME ok';
isa_ok $row->created_on, 'Time::Piece::Plus', 'Insert DATE ok';
isa_ok $row->updated_at, 'Time::Piece::Plus', 'Insert TIMESTAMP ok';

my $row2 = $schema->resultset('Test')->find($row->id);

isa_ok $row2->created_at, 'Time::Piece::Plus', 'Insert DATETIME ok';
isa_ok $row2->created_on, 'Time::Piece::Plus', 'Insert DATE ok';
isa_ok $row2->updated_at, 'Time::Piece::Plus', 'Insert TIMESTAMP ok';
is $row2->created_at => $now, 'Inflate DATETIME ok';
is $row2->created_on => $now->truncate(to => 'day'), 'Inflate DATE ok';
is $row2->updated_at => $now, 'Inflate TIMESTAMP ok';

unlink 'test.db';
done_testing;

