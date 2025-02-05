#! /usr/bin/env bash

# Remove old outputs if they exist
touch by_chr
rm -r by_chr

ACT=(ACT1 ACT3_AA ACT3_Asian ACT3_Hispanic ACT3_NHW)
ACT=${ACT[@]}

parallel mkdir -p by_chr/{} ::: $ACT


parallel --dry-run ./query_snps.sh \
    /Users/jaibroome/Data/ACT1_3_topmed/{1}/TOPMEDr2/vcffile/chr{2}.dose.filtered.vcf.gz \
    by_chr/{1}/chr{2}.snps.txt \
    ::: $ACT ::: $(echo {1..22} X)
