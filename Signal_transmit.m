function signal_sortie = Signal_transmit

load('donnees1.mat');
load('donnees2.mat');

T=40*(10^-3);
f1=0;
f2=46000;
Fe=120000;
bruit=100;

signal_sortie=awgn(cos(2*pi*f1*(1:T*Fe*5))'.*creation_signal_slots(modulateur_base(bits_utilisateur1,Fe,T),2,5,Fe,T)+cos(2*pi*f2*(1:T*Fe*5))'.*creation_signal_slots(modulateur_base(bits_utilisateur2,Fe,T),5,5,Fe,T),bruit);

end