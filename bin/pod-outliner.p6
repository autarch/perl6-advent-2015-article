use v6;

sub MAIN {
    for $=pod.kv -> $i, $block {
        say "Block $i";
        recurse-blocks($block);
        print "\n";
    }
}

sub recurse-blocks (Pod::Block $block) {
    given $block {
        when Pod::Block::Named {
            if $block.name eq 'pod' {
                for $block.contents.values -> $b {
                    recurse-blocks($b);
                }
            }
            else {
                my $output = $block.contents[0].contents[0] ~ " ({$block.name})";
                depth-say( 2, $output );
            }
        }
                
        when Pod::Heading {
            depth-say( $block.level, $block.contents[0].contents[0] );
        }
    }
}

sub depth-say (Int $depth, Str $thing) {
    print '  ' x $depth;
    say $thing;
}

=begin pod

=head1 NAME

...

=head1 DESCRIPTION

...

=head1 METHODS

...

=METHOD $obj.foo

...

=METHOD $obj.bar

...

=end pod

=begin pod

=for head1
Another Heading

=end pod
