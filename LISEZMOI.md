# Programme de hifz – version GitHub

Application de planification de l’apprentissage du Coran (mushaf de Médine en couleur, tajwid).

## Mettre en ligne avec GitHub Pages
1. Créez un dépôt public nommé `hifz`.
2. Déposez tous les fichiers de ce dossier à la racine du dépôt (index.html et les 15 fichiers mushaf_XX.json).
3. Paramètres du dépôt → Pages → Source : « Deploy from a branch », branche `main`, dossier `/ (root)` → Save.
4. Après 1 à 2 minutes, l’application est en ligne à l’adresse : https://VOTRE-NOM.github.io/hifz/

## Vos réglages (WhatsApp et Zoom)
Ouvrez `index.html` sur GitHub, appuyez sur le crayon (Modifier), et remplissez la ligne :
`const PROF={whatsapp:"",zoom:""};`
Exemple : `const PROF={whatsapp:"33612345678",zoom:"https://zoom.us/j/123456789"};`
Puis « Commit changes ».

## Limites de cette version
Chaque élève garde sa progression sur son propre téléphone. Il n’y a pas de suivi des élèves ni de validation par le professeur dans l’application : la validation se fait par WhatsApp et Zoom.

Sources : métadonnées des quarts de hizb d’après Tanzil (tanzil.net, CC BY 3.0) ; polices du mushaf KFGQPC V4 (Complexe du Roi Fahd), à utiliser selon leurs conditions.
