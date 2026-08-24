# Template body for WISPS prerun script.

module load singularity
module load nextflow

mkdir -p "$D"

awk -v o="$D" '/^>/{if(f)close(f);match($0,/^>([^ \t]+)/,a);f=o"/"a[1]".fasta"}{print>f}' "$F"
