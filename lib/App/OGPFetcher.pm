package App::OGPFetcher;
use 5.008001;
use strict;
use warnings;

use Mojolicious::Lite -signatures;
use HTML::OGP;

use aliased 'App::OGPFetcher::Agent';
use aliased 'App::OGPFetcher::Encode';

our $VERSION = "0.01";

get '/ogp' => sub ($c) {
    my $url = $c->req->param('url');
    
    my $res = Agent->get($url);
    if (!$res->{success}) {
        $c->render(json => {
            success => 0,
            status  => $res->{status},
            message => $res->{reason},
        });
        return $c->rendered(400);
    }

    $res = Encode->decode($res);
    my $ogp = HTML::OGP->parse($res->{content});
    return $c->render(json => {
        success => 1,
        status  => $res->{status},
        message => $res->{reason},
        ogp => $ogp
    });
};

sub run {
    app->start;
}

1;
__END__

=encoding utf-8

=head1 NAME

App::OGPFetcher - It's new $module

=head1 SYNOPSIS

    use App::OGPFetcher;

=head1 DESCRIPTION

App::OGPFetcher is ...

=head1 LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ytnobody E<lt>ytnobody@gmail.comE<gt>

=cut

