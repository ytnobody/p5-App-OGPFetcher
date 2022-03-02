requires 'perl', '5.008001';
requires 'Mojolicious::Lite';
requires 'HTTP::Tiny';
requires 'Data::Recursive::Encode';
requires 'aliased';

requires 'HTML::OGP', git => 'https://github.com/ytnobody/p5-HTML-OGP';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

