my $CUTOFF = shift;

my $sum = 0;
my $count = 0;
while (<>) {
  chomp;
  next if ($_>$CUTOFF);

  $sum += $_;
  $count++;
}
print "sum: $sum   count: $count  avg: ", ($sum/$count), "\n";
