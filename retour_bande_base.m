function signal_bande_base = retour_bande_base(signal,ordre_filtrage,frequence,Fe,Affichage)
if frequence==0
    signal_bande_base=signal;
else
    plage_signal=(0:(length(signal)-1))/Fe;
    signal_avant_filtre=cos(2*pi*frequence*plage_signal)'.*signal;
    signal_bande_base=filtrage(signal_avant_filtre,ordre_filtrage,frequence,Fe,"bas",false);

end
if Affichage
    figure('Name',strcat("Signal remi sur leur bande de base pour ",int2str(frequence)," Hz"));
    plage_bande=(0:(length(signal_bande_base)-1))/Fe;
    plot(plage_bande,signal_bande_base)
    title("Signal filtré sur la bande de base");
    xlabel('Temps (s)');
    ylabel('Amplitude');
end
end