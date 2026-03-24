use warnings;
use strict;
use open ':std', OUT => ':encoding(UTF-8)';

use CommonMark qw(:event :node);

open my $spec, "<", $ARGV[0];
my $doc = CommonMark->parse( file => $spec );
close $spec;

use Data::Dumper;
my $iterator = $doc->iterator;
my %references;
while ( my ( $event_type, $node ) = $iterator->next ) {
    (        $event_type == CommonMark::EVENT_ENTER
          && $node->get_type == CommonMark::NODE_LINK
          && $node->get_url =~ /\A#/ )
      or next;
    # my $label;
    # my $current = $node->first_child;
    # while ($current) {
    #     if ( $current->get_type == CommonMark::NODE_TEXT ) {
    #         $label .= $current->get_literal;
    #     } elsif ( $current->get_type == CommonMark::NODE_SOFTBREAK ) {
    #         $label .= " ";
    #     } else {
    #         die $current->render_xml;
    #     }
    #     $current = $current->next;
    # }
    # $label or die $node->render_xml;
    # if ( $references{$label} ) {
    #     print Dumper $label;
    #     die;
    # }

    # my $ident = $label;
    # $ident =~ s/\A\s*|\s*\Z//g;
    # $ident = lc $ident;
    # $ident =~ s/[^\w]+/ /g;
    # $ident =~ s/[\s]+/-/g;

    # $references{$label} = $ident;
    # my $plural = $label . "s";
    # unless ( $references{$plural} ) {
    #     $references{$plural} = $ident;
    # }
}

1;
