package Search::Fulltext::Tokenizer::Trigram;

use parent qw/Search::Fulltext::Tokenizer::Ngram/;

sub create_token_iterator_generator {
  sub { __PACKAGE__->new(3)->create_token_iterator(@_) };
}

1;
