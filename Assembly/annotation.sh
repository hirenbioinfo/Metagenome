
#!/bin/bash
#SBATCH --job-name=Prokka assembly 
#SBATCH --nodes= 8
#SBATCH --mem= 65536 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -p long
#SBaTCh --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-user=hig18@dsmz.de
# here starts your actual program call/computation
#
start_time=$(date +%s)
echo "Initial time " $start_time

for F in *.fasta; do 
  N=$(basename $F .fasta) ; 
  prokka --cpus 8 --force --locustag $N --kingdom Bacteria \
  --outdir $N --prefix $N  $F ; 
done

stop_time=$(date +%s)
echo "Final time " $stop_time
execution_time=$(expr $stop_time - $start_time)
echo -e "Execution time " $execution_time " seconds \n "
echo -e "\t \t" $(($execution_time/60)) " minutes \n"
echo -e "\t \t" $(($execution_time/3600)) " hours \n"

#submit the job by using sbatch run_prokka_HPC.sh
#check the job squeue
