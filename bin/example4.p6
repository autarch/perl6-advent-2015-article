use v6;

=begin pod

=NAME example4.p6

=head2 This is a heading

And this is a paragraph

=head2 Here's another heading

And another paragraph.

=end pod

sub MAIN {
    $=NAME.contents.say;
    .contents.say for $=head2;
}
