my $CUTOFF = shift;
my $avg = shift;

my $sum = 0;
my $count = 0;
while (<>) {
  chomp;
  next if ($_>$CUTOFF);

  $sum += ($_-$avg) * ($_-$avg);
  $count++;
}
print "sum: $sum   count: $count  avg: ", sqrt($sum/$count), "\n";
