use utf8;
package TestDB::Result::Test;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TestDB::Result::Test

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::TimePiecePlus>

=back

=cut

__PACKAGE__->load_components("InflateColumn::TimePiecePlus");

=head1 TABLE: C<test>

=cut

__PACKAGE__->table("test");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 created_at

  data_type: 'datetime'
  is_nullable: 1

=head2 created_on

  data_type: 'date'
  is_nullable: 1

=head2 updated_at

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "created_at",
  { data_type => "datetime", is_nullable => 1 },
  "created_on",
  { data_type => "date", is_nullable => 1 },
  "updated_at",
  { data_type => "timestamp", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-11 23:53:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:L58WRdb1dC+QGx8hN6hgXw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
