package Search::Fulltext::Tokenizer::Unigram;

use parent qw/Search::Fulltext::Tokenizer::Ngram/;

sub get_tokenizer {
  sub { __PACKAGE__->new(1)->create_token_iterator(@_) };
}

1;
