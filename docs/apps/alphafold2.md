# Alphafold 2

For more general information:
</br>[article](https://www.nature.com/articles/s41586-021-03819-2)
</br>[github](https://github.com/deepmind/alphafold)

On CSB alphafold2 is available as a singularity image in the apps directory:
</br>/home/apps/apps/alphafold/alphafold2.sif

The necessary data and model parameters are available here:
</br>/home/apps/apps/alphafold/data_2021-12-16

## Monomere example

To run alphafold use the following file structure in your run directory:


```bash
.
├── alphafold_monomere.sh
└── sequences
    └── {YOUR_FASTA}.fasta
```


**AF2_monomere.sh** (Slurm batch script)

```bash
#!/bin/bash
#SBATCH -n 1
#SBATCH -J AF2
#SBATCH -p CLUSTER-AMD
#SBATCH -t 3-00:00:00
#SBATCH --cpus-per-task=8

ALPHAFOLD_DATA_PATH=/home/apps/apps/alphafold/data_2021-12-16
ALPHAFOLD_MODELS=/home/apps/apps/alphafold/data_2021-12-16/params
ALPHAFOLD_SIF=/home/apps/apps/alphafold/alphafold2.sif
INPUTFASTA={YOUR_FASTA}.fasta

#Run the command
singularity run --nv \
-B $ALPHAFOLD_DATA_PATH:/data \
-B $ALPHAFOLD_MODELS \
-B $PWD:/output \
-B .:/etc \
--pwd $TMPDIR $ALPHAFOLD_SIF \
--fasta_paths=/output/sequences/$INPUTFASTA  \
--uniref90_database_path=/data/uniref90/uniref90.fasta  \
--data_dir=/data \
--mgnify_database_path=/data/mgnify/mgy_clusters_2018_12.fa   \
--pdb70_database_path=/data/pdb70/pdb70  \
--bfd_database_path=/data/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt \
--uniclust30_database_path=/data/uniclust30/uniclust30_2018_08/uniclust30_2018_08 \
--template_mmcif_dir=/data/pdb_mmcif/mmcif_files  \
--obsolete_pdbs_path=/data/pdb_mmcif/obsolete.dat \
--max_template_date=2021-11-01 \
--output_dir=/output  \
--db_preset=full_dbs \
--model_preset=monomer \
--benchmark=False \
--use_precomputed_msas=False \
--logtostderr \
--is_prokaryote_list=false
```

**AF2_multimere.sh** (Slurm batch script)

```bash
#!/bin/bash
#SBATCH -n 1
#SBATCH -J AF2
#SBATCH -p CLUSTER-AMD
#SBATCH -t 3-00:00:00
#SBATCH --cpus-per-task=8

ALPHAFOLD_DATA_PATH=/home/apps/apps/alphafold/data_2021-12-16
ALPHAFOLD_MODELS=/home/apps/apps/alphafold/data_2021-12-16/params
ALPHAFOLD_SIF=/home/apps/apps/alphafold/alphafold2.sif
INPUTFASTA={YOUR_FASTA}.fasta

#Run the command
singularity run --nv \
-B $ALPHAFOLD_DATA_PATH:/data \
-B $ALPHAFOLD_MODELS \
-B $PWD:/output \
-B .:/etc \
--pwd $TMPDIR $ALPHAFOLD_SIF \
--fasta_paths=/output/sequences/$INPUTFASTA  \
--uniref90_database_path=/data/uniref90/uniref90.fasta  \
--data_dir=/data \
--mgnify_database_path=/data/mgnify/mgy_clusters_2018_12.fa   \
--bfd_database_path=/data/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt \
--uniclust30_database_path=/data/uniclust30/uniclust30_2018_08/uniclust30_2018_08 \
--uniprot_database_path=/data/uniprot/uniprot.fasta \
--pdb_seqres_database_path=/data/pdb_seqres/pdb_seqres.txt \
--template_mmcif_dir=/data/pdb_mmcif/mmcif_files  \
--obsolete_pdbs_path=/data/pdb_mmcif/obsolete.dat \
--max_template_date=2021-11-01 \
--output_dir=/output  \
--db_preset=full_dbs \
--model_preset=multimer \
--benchmark=False \
--use_precomputed_msas=False \
--logtostderr \
--is_prokaryote_list=false
```
