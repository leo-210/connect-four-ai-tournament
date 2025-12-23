(* Entrée :
    - état courant du jeu
    - joueur dont c'est le tour de jouer
    - profondeur du minmax. On essayera de prendre la plus grande profondeur 
    sans dépasser 5 secondes par tour
Sortie : colonne dans laquelle le joueur doit jouer *)
val ia : Tournoi.etat -> Tournoi.joueur -> int -> int
