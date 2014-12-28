
(* Proof0: 任意の命題Aに対して"Aならば" *)

(* (A <- (1 - 1 = 0)) => "1 - 1 = 0 ならば 1 - 1 = 0" *)
(* ∀A, A ⇒ A *)
(* forall (A : Prop), A -> A *)
    (* Prop = 命題を表す型 *)
    (* Prop => Type型 *)
        (* (forall (A : Prop), A -> B) => AならばA->B *)

Definition proof0 : forall (A : Prop), A -> A :=
    fun A x => x.

(* Could you see "proof0 is defined" ?
 * Oh!! That's great!
 * これにて命題の証明は完了です！
 *)
