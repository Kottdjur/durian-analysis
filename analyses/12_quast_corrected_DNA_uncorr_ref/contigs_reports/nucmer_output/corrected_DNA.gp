set terminal canvas jsdir ""
set output "/home/emos8710/durian-analysis/analyses/12_quast_corrected_DNA_uncorr_ref/contigs_reports/nucmer_output/corrected_DNA.html"
set xtics rotate ( \
 "0" 0, \
 "4000000" 4000000, \
 "8000000" 8000000, \
 "12000000" 12000000, \
 "16000000" 16000000, \
 "20000000" 20000000, \
 "24000000" 24000000, \
 "28000000" 28000000, \
 "32000000" 32000000, \
 "" 33643051 \
)
set ytics ( \
 "0" 0, \
 "4000000" 4000000, \
 "8000000" 8000000, \
 "12000000" 12000000, \
 "16000000" 16000000, \
 "20000000" 20000000, \
 "24000000" 24000000, \
 "28000000" 28000000, \
 "32000000" 32000000, \
 "" 33628515 \
)
set size 1,1
set grid
set key outside bottom right
set border 0
set tics scale 0
set xlabel "Reference" noenhanced
set ylabel "Assembly" noenhanced
set format "%.0f"
set xrange [1:33643051]
set yrange [1:33628515]
set linestyle 1  lt 1 lc rgb "red" lw 3 pt 7 ps 0.5
set linestyle 2  lt 3 lc rgb "blue" lw 3 pt 7 ps 0.5
set linestyle 3  lt 2 lc rgb "yellow" lw 3 pt 7 ps 0.5
plot \
 "/home/emos8710/durian-analysis/analyses/12_quast_corrected_DNA_uncorr_ref/contigs_reports/nucmer_output/corrected_DNA.fplot" title "FWD" w lp ls 1, \
 "/home/emos8710/durian-analysis/analyses/12_quast_corrected_DNA_uncorr_ref/contigs_reports/nucmer_output/corrected_DNA.rplot" title "REV" w lp ls 2
