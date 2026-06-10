# Template body for WISPS prerun script.
# Variables injected as a header by the Python executor before this body:
#   AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION, S3_PATH, D

module load singularity
module load nextflow

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_REGION
export RCLONE_S3_PROVIDER=AWS
export RCLONE_S3_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
export RCLONE_S3_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"
export RCLONE_S3_REGION="$AWS_REGION"

rclone copyto ":s3:${S3_PATH}" /tmp/w.fa

mkdir -p "$D"

awk -v o="$D" '/^>/{if(f)close(f);match($0,/^>([^ \t]+)/,a);f=o"/"a[1]".fasta"}{print>f}' /tmp/w.fa
