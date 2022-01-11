function bits_recuperes = demodulateur_bande_base(slot_utile,T,Fe,Ts)
Ns=floor(Ts/(1/Fe));

signal_filtre=filter(ones(1,Ns),1,slot_utile) ;
signal_echantillonne=signal_filtre(Ns :Ns :end) ;
bits_recuperes=(sign(signal_echantillonne)+1)/2 ;

end