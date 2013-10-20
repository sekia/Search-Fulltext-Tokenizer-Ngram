package Search::Fulltext::Tokenizer::Unigram;

use parent qw/Search::Fulltext::Tokenizer::Ngram/;

sub create_token_iterator_generator {
  sub { __PACKAGE__->new(1)->create_token_iterator(@_) };
}

1;
