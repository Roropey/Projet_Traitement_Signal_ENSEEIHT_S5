function Slot_utile = Detection_slot_utile(signal,T,Fe)
    nb_slot=length(signal)/(T*Fe);
    signaux_slots=reshape(signal,[T*Fe nb_slot]); 
    %somme=sum(abs(signaux_slots),1)./length(signaux_slots)
    [~,position_max]=max(sum(abs(signaux_slots),1)./length(signaux_slots));
    Slot_utile=signaux_slots(:,position_max);
end