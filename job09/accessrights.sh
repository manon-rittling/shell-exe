
csvfile="Shell_Userlist.csv"
#lire le fichier csv

while IFS=',' read -r id prenom nom mdp Role; do
Role=$(echo "$Role" | tr -d '\r')
echo "id:$id prenom:$prenom nom:$nom mdp:$mdp role:$Role"
#cree utilisateur dans le systeme
sudo useradd -m -s /bin/bash -c "$id $prenom $nom $Role" -p "$(openssl passwd -1 "$mdp")" "$prenom$nom"
 echo "Utilisateur ($prenom $nom) créé avec succès (id:$id, rôle:$Role)"
 echo "Valeur de la colonne role avant utilisation : $Role"


if ( "$Role" = "Admin" ); then
sudo usermod -aG sudo "$prenom$nom"
echo "Utilisateur $prenom$nom promu en superutilisateur"
fi
done < "$csvfile"
