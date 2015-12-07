use v6;

=begin pod

=head1 NAME

example1.p6 - It's a script to show you how Pod works in Perl 6!

=end pod

sub MAIN {
    say $=pod.WHAT;
    say $=pod[0].WHAT;
}
