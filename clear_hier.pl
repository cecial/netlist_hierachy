#!/usr/bin/perl -w
use Data::Dumper;
use Getopt::Long;
use strict;

usage() if (@ARGV< 6);

our ($cir,$cell,$level)=();

GetOptions('cell=s'        => \$cell,
           'cir=s'         => \$cir,
           'level=s'       => \$level,
);
$cell=lc($cell);

### check param
###

### process with netlist and create info hash of netlist
my $cir_no_plus=remove_plus($cir);
my $cir_no_param=remove_param($cir_no_plus);
my $cir_info=create_hier_info($cir_no_param);
###

################################################################################

our $level_num=1;
our @sub=($cell);
our @path=("");
our @new_sub=();
our @new_path=();

while($level_num<=$level) {
    @new_sub=@new_path=();
    foreach my $i (0..$#sub) {
        unless (defined($cir_info->{$sub[$i]})) {
            print "ERROR: [$sub[$i]] does not exist in netlist [$cir]\n";
            next;
        }
        foreach my $x (@{$cir_info->{$sub[$i]}{xinst}}) {
            printf "level %2s: %-50s -> %-10s\n", $level_num,"$path[$i]$x",$cir_info->{$sub[$i]}{$x}{name};
            push @new_path,"$path[$i]$x.";
            push @new_sub,$cir_info->{$sub[$i]}{$x}{name};
        }
    }
    @sub=@new_sub;
    @path=@new_path;
    $level_num++;
    print "\n";
}

unlink "$cir_no_plus","$cir_no_param";
    
################################################################################
sub remove_plus {
    my $org_cir=shift;
    my $new_cir="$org_cir.no_plus";

    open (FI,"$org_cir") || die "$org_cir, $!\n";
    open (FO,">$new_cir") || die "$new_cir, $!\n";
    
    while(my $line=<FI>){
        #next if ($line=~/^\s*[\*\$]/ || $line=~/^\s*(\.param|\.option)/i || $line=~/^\s*$/);
        chomp($line);

        if ($line=~s/\s*\+/ /) {
            ### if $line start with "+", then print this line at the end of last line;
            print FO "$line";
        } else {
            ### if $line don't start with "+", then print this line at a new line;
            print FO "\n$line";
        }
    }
    print FO "\n";

    close FI;
    close FO;
    
    return $new_cir;
}

sub remove_param {
    my $org_cir=shift;
    my $new_cir="$org_cir.no_param";

    open (FI,"$org_cir") || die "$org_cir, $!\n";
    open (FO,">$new_cir") || die "$new_cir, $!\n";
    
    while(my $line=<FI>){
        next if ($line=~/^\s*[\*\$]/ || $line=~/^\s*(\.param|\.option)/i || $line=~/^\s*$/);
        chomp($line);

        ### low case netlist
        $line=lc($line);

        ### in case there is "a = b"
        $line=~s/\s*=\s*/=/g;

        ### remove "param=value" in netlist
        $line=~s/\S*=\S*//g;

        ### remove head and end space
        $line=~s/^\s*|\s*$//;

        print FO $line, "\n";
    }

    close FI;
    close FO;

    return $new_cir;
}

sub create_hier_info {
    my $cir=shift;

    my %cir_info=();

    my $is_in_subckt=0;
    my $subckt="";

    open (FI,"$cir") || die "$cir, $!\n";
    while(my $line=<FI>){
        if ($line=~/^\.subckt/i) {
            (undef,$subckt,my @pin)=split(/\s+/,$line);

            ### create subckt info
            $cir_info{$subckt}{xinst}=[];
            
            $is_in_subckt=1;
            next;
        } 

        if ($is_in_subckt==1) {
            if ($line=~/^x/i) {
                my @tmp=split(/\s+/,$line);
                my $x=shift(@tmp);
                my $x_sub=pop(@tmp);
                push @{$cir_info{$subckt}{xinst}},$x;
                $cir_info{$subckt}{$x}{name}=$x_sub;

                ### collect net in subckt
                next;

            } elsif ($line=~/^\.ends/i) {
                $is_in_subckt=0;
            }
        }

    }

    close FI;

    return \%cir_info;

}

sub is_exist_in_array {
    my ($ele,$array_ref)=@_;

    foreach (@$array_ref) {
        return 1 if ($ele eq $_);
    }

    return 0;
}
    
sub usage {
    chomp(my $name=`basename $0`);
    print <<EOF;

    Usage:
      $name 
            -cir   <netlist> 
            -cell  <cell name> 
            -level <net or pin> 
    ---
      -cir      : netlist file name, topcell should not be commented.
      -cell     : cell name in netlist.
      -level    : level num which user wants to go down.
    ---
      This script is used to make hierarchical level clear in netlist.
    ---

EOF
    exit;
}

