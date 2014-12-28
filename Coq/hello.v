
(* Comment *)
Definition plus (n : nat)(m : nat) : nat := n + m.

(* Abbreviation *)
Definition plus' (n m : nat) : nat := n + m.

(* Type Inference *)
Definition plus'' n m := n + m.

(* Unnamed Method *)
Definition plus''' : nat -> nat -> nat := fun n m => n + m.

Eval compute in plus 3 5.


(* *** ***** *** *)


(* id *)
Definition id (A : Type)(x : A) : A := x.

(* 全称量化子 => forall *)
(* (id' : forall (A : Type), A -> A) => "型がTypeである任意の型Aに対して、idの型はA -> Aである" *)
(* (fun A x => x.) => "型Aと型Aである値xを受け取り、xを返す関数" *)
Definition id' : forall (A : Type), A -> A := fun A x => x.

Eval compute in id' nat 1.

