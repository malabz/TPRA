# A refinement tool for ensembling different multiple sequence alignment results

TPRA is a tool for ensembling and refining from different MSA results. It is based on two pointer. The program is written in C++20 and works on Linux.

## 🔨Installation and Usage

### 1.1 OSX/Linux/WSL(Windows Subsystem for Linux ) - using anaconda
1.Intall WSL for Windows. Instructional video [1](https://www.youtube.com/watch?v=X-DHaQLrBi8&t=5s) or [2](http://lab.malab.cn/%7Etfr/1.mp4) (Copyright belongs to the original work).

2.Download and install Anaconda. Download Anaconda versions for different systems from [here](https://www.anaconda.com/products/distribution#Downloads). Instructional video of anaconda installation [1](https://www.youtube.com/watch?v=AshsPB3KT-E) or [2](http://lab.malab.cn/%7Etfr/Install_anaconda_in_Linux.mp4) (Copyright belongs to the original work).

3.Install TPRA.
```bash
#1 Acvtivate one of you conda environment
conda activate base

#2 Add channels to conda
conda config --add channels malab

#3 Install TPRA
conda install -c malab tpra

#4 Test TPRA
TPRA -h
```

### 2.1 OSX/Linux/WSL(Windows Subsystem for Linux ) - from the source code

1. Download and Compile source code. (Make sure your the version of gcc >= 9.4.0 or clang >= 13.0.0)
```shell
git clone https://github.com/malabz/TPRA.git
cd TPRA
make
```

### 2.2 Usage for the source code
```
./TPRA -r <raw_data> -c <child_msa_alignment> -o <output> 

	-r is the raw data, a FASTA file
	-c is the align result path of child MSAs, a TXT file
	-o is the output file, a FASTA file
	-h print help message
```

### 2.3 Example usage for the source code
1. Download [test data](https://github.com/malabz/TPRA/tree/main/data).
2. Run TPRA.
```shell
# Download data
wget https://github.com/malabz/TPRA/blob/main/data/16s_rRNA.tar.gz

# Unzip data
tar -zxvf 16s_rRNA.tar.gz

# Make a filepath.txt
cd 16s_rRNA/align_result/16s_rRNA_100_1.fasta
pwd # get the PATH
vim filepath.txt
# Save the following to filepath.txt
PATH/16s_rRNA_100_1.fasta_clustalw2.fasta
PATH/16s_rRNA_100_1.fasta_dialignt.fasta
PATH/16s_rRNA_100_1.fasta_mafft.fasta
PATH/16s_rRNA_100_1.fasta_muscle.fasta
PATH/16s_rRNA_100_1.fasta_pcma.fasta
PATH/16s_rRNA_100_1.fasta_poa.fasta
PATH/16s_rRNA_100_1.fasta_tcoffee.fasta

# Run TPRA
./TPRA -r 16s_rRNA/raw_data/16s_rRNA_100_1.fasta -c 16s_rRNA/align_result/16s_rRNA_100_1.fasta/filepath.txt -o 16s_rRNA_100_1_ensemble.fasta 
```
## 💡Reminder
1. Currently TPRA is only available for DNA/RNA. 
2. The premise of applying TPRA is that the sequences' id in the child MSAs are unique.
(E.g. The id length of the sequences in the original data set is too long, ClustalW2 will intercept the id, which may cause the id in the alignment result to be completely consistent, and TPRA cannot process it)
3. TPRA will delete the illegal characters, when they are exsited.

## 🧬Test Dataset and Enviroment
1. Test [Dataset](https://github.com/malabz/TPRA/tree/main/data)

Dataset|Count|Avg Length|Intro
:---:|:---:|:---:|:---:
23s simu|100|about 3900bp|A sets of Mycobacterium 23S rRNA like was simulated using INDELible v1.03 (Fletcher and Yang 2009)
16s rRNA|100|about 1500bp|100 sequences were randomly selected from 16s rRNA small dataset, 8 times
mt1x|30|about 16600bp|There are no illegal characters in the "processed" file
2019nCoV_20200301|156|about 29000bp|COVID-19 sequences with high similarity
SARS_CoV_20200417|100|spotty|100 sequences were randomly selected from [SARS_Cov_2020417](http://lab.malab.cn/~cjt/MSA/data/SARS-CoV-2_20200417.7z), 4 times

2. Test Enviroment

System|GCC version
:---:|:---:
OSX|clang 13.0.0
Linux|GCC 9.4.0
WSL|GCC 9.4.0

## 👋Contacts
If any bugs during you run our code, please email to zhai1xiao@gmail.com
