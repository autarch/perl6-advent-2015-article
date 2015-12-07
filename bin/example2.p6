use v6;

=begin pod

=head1 NAME

example2.p6 - It's a script to show you how Pod works in Perl 6!

=end pod

sub MAIN {
    say $=pod.elems;
    say $=pod[0].WHAT;
    say $=pod[1].WHAT;
}

=begin pod

=head1 DESCRIPTION

This is where I'd put some more stuff about the script if it did anything.

=end pod
