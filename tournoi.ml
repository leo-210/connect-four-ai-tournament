type joueur = J1 | J2

(* L'état donné aux ia sera une copie, le modifier ne servira à rien ! *)
type etat = (joueur option) array array
