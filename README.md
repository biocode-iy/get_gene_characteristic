# Get_gene_characteristic
This code was designed by R to extract the characteristics of gene and show as csv file.  
## Preparation step:
You already have fasta file including the group of aa-sequence of genes. Also, the name of species is knownge.

#### Example gene_of_interest.fasta : 

```
>MELO3C005013.2
MKKSEEANTASAVVVMGSTQPCAACKILRR........
>MELO3C035136.2
MKEISGRKQGTSLSPC......
>MELO3C012908.2
MTGSGSPCGACKFLR..........
```
#### Name of species Cucumis_melo as an example.
So you can download cds file sequence: Cucumis_melo.Melonv4.cds.all.fa
```
Put in your mind:
Gene name or gene id should be matched with gene name or gene id in cds file.
```

How to perpare you own cds fasta file:

1- Extract Gene_ID from your file
```
cat gene_of_interest.fasta | grep ">" > id.txt
```
2- Get prepared_cds.fasta by [seqkit](https://anaconda.org/bioconda/seqkit) 
```
seqkit grep -r -f id.txt Cucumis_melo.Melonv4.cds.all.fa -o prepared.cds.all.fa 
```
You need: 
- aa-sequence of genes fasta file ``` gene_of_interest.fasta ```
- Prepared cds fasta file ``` prepared.cds.all.fa ```
