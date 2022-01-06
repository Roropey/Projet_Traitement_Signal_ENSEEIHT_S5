clear;
close all;

T=40*(10^-3);
f1=0;
f2=46000;
Fe=120000;
ordre_filtre=101;
fc_bas=20000;
fc_haut=36000;

signal_recu=Signal_transmit(f1,f2,Fe,T,2,5,5,100,true);

signal_filtre_bas=filtrage(signal_recu,ordre_filtre,fc_bas,Fe,T,"bas",true);
signal_filtre_haut=filtrage(signal_recu,ordre_filtre,fc_haut,Fe,T,"haut",true);