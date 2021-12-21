clear all;
close all;

load('donnees1.mat');
load('donnees2.mat');

T=40*(10^-3);
f1=0;
f2=46000;
Fe=120000;

signal_m1=modulateur_base(bits_utilisateur1,Fe,T);
signal_m2=modulateur_base(bits_utilisateur2,Fe,T);

signal_5_slots_1=creation_signal_slots(signal_m1,2,5,Fe,T);
signal_5_slots_2=creation_signal_slots(signal_m2,5,5,Fe,T);

figure;

subplot(2,2,1);
plage_signal_1=(0:T*5/(length(signal_5_slots_1)-1):T*5);
plot(plage_signal_1,signal_5_slots_1)
title('Signal sur 5 slots utilisateur 1');
xlabel('Temps (s)');
ylabel('Signal');


subplot(2,2,2);
plage_signal_2=(0:T*5/(length(signal_5_slots_2)-1):T*5);
plot(plage_signal_2,signal_5_slots_2)
title('Signal sur 5 slots utilisateur 2');
xlabel('Temps (s)');
ylabel('Signal');

subplot(2,2,3);
signal_porteuse_1=cos(2*pi*f1*(1:T*Fe*5))'.*signal_5_slots_1;
plot(plage_signal_1,signal_porteuse_1)
title('Signal sur 5 slots utilisateur 1 sur porteuse');
xlabel('Temps (s)');
ylabel('Signal');

subplot(2,2,4);
signal_porteuse_2=cos(2*pi*f2*(1:T*Fe*5))'.*signal_5_slots_2;
plot(plage_signal_2,signal_porteuse_2)
title('Signal sur 5 slots utilisateur 2 sur porteuse');
xlabel('Temps (s)');
ylabel('Signal');
