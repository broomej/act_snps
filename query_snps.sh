#! /usr/bin/env bash

# 1st positional arg: input .vcf.gz file
# 2nd positional arg: output file

bcftools query -f '%CHROM\t%POS\t%ID\n' $1 > $2
