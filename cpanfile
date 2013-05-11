requires 'perl', '5.008001';
requires 'DBIx::Class', '0';
requires 'Time::Piece::Plus', '0.05';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

