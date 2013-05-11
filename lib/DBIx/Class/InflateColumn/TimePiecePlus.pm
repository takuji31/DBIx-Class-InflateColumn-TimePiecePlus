package DBIx::Class::InflateColumn::TimePiecePlus;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use parent qw/DBIx::Class/;

use Time::Piece::Plus ();

__PACKAGE__->load_components(qw/InflateColumn/);

sub register_column {
    my ($self, $column, $info, @rest) = @_;

    $self->next::method($column, $info, @rest);

    return unless $info->{data_type};

    my $data_type = lc($info->{data_type});
    $info = {%$info}; 
    if ($data_type eq 'datetime' || $data_type eq 'timestamp') {
        $self->inflate_column(
            $column,
            {
                inflate => sub {
                    my ($value, $obj) = @_;


                    $info->{__dbic_colname} = $column;

                    local $ENV{TZ} = $info->{timezone} if exists $info->{timezone} && $info->{timezone};

                    my $time = Time::Piece::Plus->parse_mysql_datetime(str => $value, as_localtime => $info->{is_local} // 1);

                    return $time;
                },
                deflate => sub {
                    my ($value, $obj) = @_;

                    return $value->mysql_datetime;
                },
            },
        );
    } elsif ($data_type eq 'date') {
        $self->inflate_column(
            $column,
            {
                inflate => sub {
                    my ($value, $obj) = @_;


                    local $ENV{TZ} = $info->{timezone} if exists $info->{timezone} && $info->{timezone};

                    my $time = Time::Piece::Plus->parse_mysql_date(str => $value, as_localtime => $info->{is_local} // 1);

                    return $time;
                },
                deflate => sub {
                    my ($value, $obj) = @_;

                    return $value->mysql_date;
                },
            },
        );
    }
}


1;
__END__

=encoding utf-8

=head1 NAME

DBIx::Class::InflateColumn::TimePiecePlus - It's new $module

=head1 SYNOPSIS

    use DBIx::Class::InflateColumn::TimePiecePlus;

=head1 DESCRIPTION

DBIx::Class::InflateColumn::TimePiecePlus is ...

=head1 LICENSE

Copyright (C) Nishibayashi Takuji.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Nishibayashi Takuji E<lt>takuji31@gmail.comE<gt>

=cut

