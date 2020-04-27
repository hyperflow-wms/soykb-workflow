#!/usr/bin/env python2
import argparse
prefix = "http://workflow.isi.edu/SoyKB/sample-inputs-3/"            
fastq_data = [              
    "USB-001_1.fastq", "USB-001_2.fastq", "USB-002_1.fastq", "USB-002_2.fastq", "USB-003_1.fastq", "USB-003_2.fastq", "USB-004_1.fastq", "USB-004_2.fastq", "USB-005_1.fastq", "USB-005_2.fastq", "USB-006_1.fastq", "USB-006_2.fastq", "USB-007_1.fastq", "USB-007_2.fastq", "USB-008_1.fastq", "USB-008_2.fastq", "USB-009_1.fastq", "USB-009_2.fastq", "USB-010_1.fastq", "USB-010_2.fastq", "USB-011_1.fastq", "USB-011_2.fastq", "USB-012_1.fastq", "USB-012_2.fastq", "USB-013_1.fastq", "USB-013_2.fastq", "USB-014_1.fastq", "USB-014_2.fastq", "USB-015_1.fastq", "USB-015_2.fastq", "USB-016_1.fastq", "USB-016_2.fastq", "USB-017_1.fastq", "USB-017_2.fastq", "USB-018_1.fastq", "USB-018_2.fastq", "USB-019_1.fastq", "USB-019_2.fastq", "USB-020_1.fastq", "USB-020_2.fastq", "USB-021_1.fastq", "USB-021_2.fastq", "USB-022_1.fastq", "USB-022_2.fastq", "USB-023_1.fastq", "USB-023_2.fastq", "USB-024_1.fastq", "USB-024_2.fastq", "USB-025_1.fastq", "USB-025_2.fastq"
]

parser = argparse.ArgumentParser()
parser.add_argument('-p', '--path', help='path to inputs-fastq.txt file', default="inputs-fastq.txt")
parser.add_argument('-s', '--size', help='size to fill inputs-fastq.txt with. Should be divisible by 2 for workflow to work. Max available value: {0}'.format(len(fastq_data)), default="2")
args = parser.parse_args()                  


lines = [prefix + fastq_data[i] for i in range(int(args.size))] 

with open(args.path, "w") as file:
    file.writelines('\n'.join(lines))
    file.close()