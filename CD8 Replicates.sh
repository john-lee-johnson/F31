#!/bin/bash
dir0=/mnt/data1/John
#---------------------CREATE TEMP BED FILE------------------------------------------------
##This generates a temp bed file for unionbedg function later
cd ${dir0}/CD8_Replicates
tail -n +2 ${dir0}/Pioneer_Factors_1/Analysis/ATAC_seq/R_output/CD8_unique_all.bedgraph > CD8_A_temp.bed 	
tail -n +2 ${dir0}/Pioneer_Factors_2/Analysis/ATAC_seq/R_output/CD8_unique_all.bedgraph > CD8_1_temp.bed 		##Removes the trackline from bedgraph file
tail -n +2 ${dir0}/Pioneer_Factors_3/Analysis/ATAC_seq/R_output/CD8_unique_all.bedgraph > CD8_2_temp.bed 	
#Intersect between AMIT CD8 and Naive CD8 1
bedtools intersect -wa -a CD8_A_temp.bed -b CD8_1_temp.bed > Intersect_Amit_N1_CD8.bed
#Intersect between AMIT CD8 and Naive CD8 2
bedtools intersect -wa -a CD8_A_temp.bed -b CD8_2_temp.bed > Intersect_Amit_N2_CD8.bed
#Intersect between Naive CD8 1 and Naive CD8 2
bedtools intersect -wa -a CD8_1_temp.bed -b CD8_2_temp.bed > Intersect_N1_N2_CD8.bed
#Intersect between AMIT CD8 and Naive 1 and Naive 2
bedtools intersect -wa -a CD8_A_temp.bed -b CD8_1_temp.bed CD8_2_temp.bed > Intersect_A_N1_N2_CD8.bed