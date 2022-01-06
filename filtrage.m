function signal_filtre = filtrage(signal,ordre_de_filtrage,fc,Fe,T,Bande,Affichage)
plage=(-(ordre_de_filtrage-1)/2:(ordre_de_filtrage-1)/2)*(1/Fe);
if Bande == "bas"
    Impulsion=2*fc*sinc(2*fc*plage)/Fe;
elseif Bande == "haut"
    Impulsion=(dirac(plage)==Inf)-2*fc*sinc(2*fc*plage)/Fe;
else
    error('Choix filtrage non supporté, choississez soit "bas" soit "haut"');
end
signal_filtre=filter(Impulsion,[1],signal);

if Affichage
    figure('Name',strcat("Impulsion du filtre passe-",Bande," et signal filtré"));
    
    subplot(3,2,1);
    plot(plage,Impulsion)
    title(strcat("Impulsion temporelle ",Bande));
    xlabel('s');
    ylabel('Amplitude');

    FourrierImp=abs(fftshift(fft(ifftshift(Impulsion))));
    subplot(3,2,2);
    plot(plage*Fe*Fe/ordre_de_filtrage,(FourrierImp))
    title(strcat("Impulsion fréquentielle ",Bande));
    xlabel('Hz');
    ylabel('Module TFD');

    subplot(3,2,[3,4]);
    plot(plage*Fe*Fe/ordre_de_filtrage,(FourrierImp))
    hold on;
    module_signal=abs(fftshift(fft(signal)));
    plage_module=(-Fe/2:Fe/(length(module_signal)-1):Fe/2);
    facteur=max(FourrierImp)/max(module_signal);
    plot(plage_module,module_signal*facteur)
    hold off;
    title(strcat("Module signal et impulsion ",Bande));
    xlabel('Hz');
    ylabel('Module TFD');

    subplot(3,2,[5 6]);    
    plage_bas=(0:T*5/(length(signal_filtre)-1):T*5);
    plot(plage_bas,signal_filtre)
    title(strcat("Signal filtré par passe-",Bande));
    xlabel('Temps (s)');
    ylabel('Amplitude');

end

end