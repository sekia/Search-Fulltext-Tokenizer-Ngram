package Search::Fulltext::Tokenizer::Trigram;

use parent qw/Search::Fulltext::Tokenizer::Ngram/;

sub get_tokenizer {
  sub { __PACKAGE__->new(3)->create_token_iterator(@_) };
}

1;
