package App::OGPFetcher::Agent;
use strict;
use warnings;
use HTTP::Tiny;

our $AGENT = HTTP::Tiny->new(agent => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.55');
our $AUTOLOAD;

sub AUTOLOAD {
    my ($class, @args) = @_;
    my ($method) = $AUTOLOAD =~ /^$class\:\:(.+)$/;
    $AGENT->$method(@args);    
}

1;