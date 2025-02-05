#! /usr/bin/env bash

# First positional arg: ACT study

ACT=$1

OUTFILE=${ACT}_snps.txt
PREVTEMP=.ids_temp_init_$ACT.txt

touch $PREVTEMP
rm .ids_temp*${ACT}*
touch $PREVTEMP

CHRS=({1..22} "X")

for CHR in "${CHRS[@]}"
do
    INFILE=by_chr/$ACT/chr$CHR.snps.txt
    OUTTEMP=.ids_temp_${ACT}_$CHR.txt

    cat $PREVTEMP by_chr/ACT3_Asian/chr$CHR.snps.txt > $OUTTEMP

    rm $PREVTEMP
    PREVTEMP=$OUTTEMP
done

mv $OUTTEMP out/$OUTFILE
gzip out/$OUTFILE