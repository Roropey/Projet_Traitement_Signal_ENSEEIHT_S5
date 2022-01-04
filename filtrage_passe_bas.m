function signal_filtre_bas = filtrage_passe_bas(signal,ordre_de_filtrage,fc_bas,Fe,T,Affichage)
plage=(-(ordre_de_filtrage-1)/2:(ordre_de_filtrage-1)/2)*(1/Fe);
Impulsion=2*fc_bas*sinc(2*fc_bas*plage)/Fe;
signal_filtre_bas=filter(Impulsion,[1],signal);

if Affichage
    figure;
    subplot(2,2,1)
    plot(plage,Impulsion)
    title('Impulsion temporelle bas')
    xlabel('s')
    ylabel('Filtre passe-haut échantilloné')

    FourrierImp=abs(fftshift(fft(ifftshift(Impulsion))));
    subplot(2,2,2)
    plot(plage*Fe*Fe/ordre_de_filtrage,(FourrierImp))
    title('Impulsion fréquentielle bas')
    xlabel('Hz')
    ylabel('Module TFD')

    subplot(2,2,[3,4]);
    plot(plage*Fe*Fe/ordre_de_filtrage,(FourrierImp))
    hold on;
    module_signal=abs(fftshift(fft(signal)));
    plage_module=(-Fe/2:Fe/(length(module_signal)-1):Fe/2);
    facteur=max(FourrierImp)/max(module_signal);
    plot(plage_module,module_signal*facteur)
    hold off;
    title('Module signal et impulsion bas')
    xlabel('Hz')
    ylabel('Module TFD')

end

end