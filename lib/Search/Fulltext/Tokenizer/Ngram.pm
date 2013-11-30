package Search::Fulltext::Tokenizer::Ngram;

# ABSTRACT: N-gram tokenizer for Search::Fulltext

use strict;
use warnings;
use Carp ();
use Scalar::Util qw/looks_like_number/;

our $VERSION = 0.01;

sub new {
  my ($class, $token_length) = @_;

  unless (looks_like_number $token_length and $token_length > 0) {
    Carp::croak('Token length must be 1+.');
  }

  bless +{ token_length => $token_length } => $class;
}

sub create_token_iterator {
  my ($self, $text) = @_;

  my $token_index = -1;
  my $n = $self->token_length;
  return sub {
  GET_NEXT_TOKEN:
    {
      ++$token_index;
      return if $token_index + $n > length($text);
      my $token = substr $text, $token_index, $n;
      redo GET_NEXT_TOKEN if $token =~ /\s/;
      return ($token, $n, $token_index, $token_index + $n, $token_index);
    }
  };
}

sub token_length { $_[0]->{token_length} }

1;
