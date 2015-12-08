use v6;

use Pod::TreeWalker;
use Pod::TreeWalker::Listener;

class Outliner does Pod::TreeWalker::Listener {
    has Pod::TreeWalker $!walker = Pod::TreeWalker.new( :listener(self) );
    has $!seen = 0;

    method walk ($pod) {
        $!walker.walk-pod($pod);
    }

    multi method start (Pod::Block::Named $block) {
        if $block.name eq 'pod' {
            say 'Block ' ~ $!seen++;
            return True;
        }
        else {
            my $output = $!walker.text-contents-of($block) ~ " ({$block.name})";
            self!depth-say( 2, $output );
        }
    }

    multi method end (Pod::Block::Named $block) {
        print "\n" if $block.name eq 'pod';
    }

    multi method start (Pod::Heading $block) {
        self!depth-say( $block.level, $!walker.text-contents-of($block) );
        return True;
    }

    method !depth-say (Int $depth, Str $thing) {
        print '  ' x $depth;
        say $thing;
    }
}

sub MAIN {
    Outliner.new.walk($=pod);
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
