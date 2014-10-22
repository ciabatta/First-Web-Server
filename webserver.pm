#!usr/bin/perl
use strict;
use warnings;
use IO::Socket;
use lib "C:/Users/Calcinatus/Documents/perl_test";
use Exporter qw(import);
#use webclient qw(connect get head chat);
use Gtk2 -init;
use constant TRUE =>1;
use Constant FALSE=>0;

our @EXPORT_OK = qw(server );

sub server {
	my ($port) = @_;
	our $socket = new IO::Socket::INET (
		LocalPort => "$port",
		Type => SOCK_STREAM,
		Reuse => 1,
		Listen => 10,
	); 
	die print "Could not create server.\n";
	print "Listening on port $port.\n";
	my $client;
	while($client = $socket->accept()) {
		$client->autoflush(1);
		our $line = <$client>;
		print $line;
	}
	close $socket;
}


	

