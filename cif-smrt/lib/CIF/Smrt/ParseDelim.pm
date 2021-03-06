package CIF::Smrt::ParseDelim;

use strict;
use warnings;

sub parse {
    my $f = shift;
    my $content = shift;
    my $split = shift;

    my @lines = split(/[\r\n]/,$content);
    my @cols = split(',',$f->{'values'});
    my @array;
    
    if(my $l = $f->{'feed_limit'}){
        my ($start,$end);
        if(ref($l) eq 'ARRAY'){
            ($start,$end) = @{$l};
        } else {
            ($start,$end) = (0,$l-1);
        }
        @lines = @lines[$start..$end];
        
        # A feed limit may have already been applied to
        # this data.  If so, don't apply it again.
        if ($#lines > ($end - $start)){
            @lines = @lines[$start..$end];
        }
    }

    shift @array if($f->{'skipfirst'});

    foreach(@lines){
        next if(/^(#|$|<)/);
        my @m = split($split,$_);
        my $h;
        map { $h->{$_} = $f->{$_} } keys %$f;
        foreach (0 ... $#cols){
            $h->{$cols[$_]} = $m[$_];
        }
        push(@array,$h);
    }
    return(\@array);
}

1;
