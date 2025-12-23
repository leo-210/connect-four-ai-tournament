# Tournoi Puissance 4

Ce repo contient les fichiers du backend d'un tournoi d'IA puissance 4 en OCaml.

## Utilisation

Pour lancer un match entre deux IA dans les fichiers `ia1.ml` et `ia2.ml` :
```
./match.sh ia1.ml ia2.ml
```

Le script va alors déterminer la plus grande profondeur possible pour chaque IA telle 
que son exécution ne dépasse pas un certain seuil (défini dans `match.sh`). Puis il lance
le match avec la profondeur maximale pour chaque IA, avec `ia1.ml` en joueur 1, et `ia2.ml` 
en joueur 2.


## Organisation

Chaque participant doit fournir un fichier OCaml respectant l'interface fournie (cf `run/ia.mli`).
```ocaml
(* Entrée :
    - état courant du jeu
    - joueur dont c'est le tour de jouer
    - profondeur du minmax. On essayera de prendre la plus grande profondeur 
    sans dépasser 5 secondes par tour
Sortie : colonne dans laquelle le joueur doit jouer *)
val ia : Tournoi.etat -> Tournoi.joueur -> int -> int
```
