package App::OGPFetcher::Encode;
use strict;
use warnings;
use Data::Recursive::Encode;

sub decode {
    my ($class, $res) = @_;
    my $content_type = $res->{"headers"}{"content-type"};
    my ($charset) = $content_type =~ m|charset=(.+?)$|i;
    return Data::Recursive::Encode->decode($charset, $res);
}

1;