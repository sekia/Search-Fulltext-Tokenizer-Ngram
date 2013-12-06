package Search::Fulltext::Tokenizer::Bigram;

use parent qw/Search::Fulltext::Tokenizer::Ngram/;

sub get_tokenizer {
  sub { __PACKAGE__->new(2)->create_token_iterator(@_) };
}

1;
