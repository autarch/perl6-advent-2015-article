use v6;

=begin pod

=begin head1

NAME

=end head1

This is a paragraph block.

=end pod

sub MAIN {
    say $=pod[0].contents[1].WHAT;
}
