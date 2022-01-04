clear all;
%close all;

T=40*(10^-3);
Fe=120000;
ordre_filtre=101;
fc_bas=20000;
fc_haut=36000;

signal_recu=Signal_transmit();

signal_filtre_bas=filtrage_passe_bas(signal_recu,ordre_filtre,fc_bas,Fe,T,true);
signal_filtre_haut=filtrage_passe_haut(signal_recu,ordre_filtre,fc_haut,Fe,T,true);


figure;

subplot(2,1,1);
plage_bas=(0:T*5/(length(signal_filtre_bas)-1):T*5);
plot(plage_bas,signal_filtre_bas)
title('Signal filtré par passe-bas')
xlabel('Temps (s)')
ylabel('Amplitude')

subplot(2,1,2);
plage_haut=(0:T*5/(length(signal_filtre_haut)-1):T*5);
plot(plage_haut,signal_filtre_haut)
title('Signal filtré par passe-haut')
xlabel('Temps (s)')
ylabel('Amplitude')