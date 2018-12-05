use v6;

my $base  = $*PROGRAM-NAME.split(/\./)[0];
my $input = slurp "$base.input";

my @items = $input.split(/\n/);
@items.pop;
say [+] @items;

#say @items[@items.elems - 1];

my %items =  0 => 1;
my Int  $current    = 0;
my Int  $iteration  = 0;
my Bool $goon       = True;
while $goon {
  $iteration++;
  #say "iteration $iteration size of hash " ~ %items.keys.elems;
  for @items -> $item {
    $current += $item; 
    #say "current has $current after adding $item";
    if %items{$current}:exists {
      say "value $current reached twice in iteration $iteration!";
      $goon = False;
      last;
   }
   %items{$current} = 1;
  }
}
