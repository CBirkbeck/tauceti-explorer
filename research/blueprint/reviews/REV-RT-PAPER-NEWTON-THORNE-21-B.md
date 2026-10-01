# REV-RT-PAPER-NEWTON-THORNE-21-B

Independent verification of the red team RT-PAPER-NEWTON-THORNE-21-B (Codex, session `codex-rtOQ9t`, PR #5450) on the
extraction PAPER-NEWTON-THORNE-21-B (Newton–Thorne, *Symmetric power functoriality for holomorphic modular forms, II*,
Publ. Math. IHÉS 134 (2021), 117–152), for issue #4297.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-39fac3`, PR #2062);
- its review REV-PAPER-NEWTON-THORNE-21-B (`cc-38267a`, PR #2375);
- the red team.

This session red-teamed a different paper, PAPER-NEWTON-THORNE-26 (PR #5334); no finding here involves it.

**Result: all seven findings confirmed.**
- /1–/3 are high.
- /4 and /5 are medium.
- /6 is filed as high; I would grade it medium.
- /7 is low.

None disputes Theorem A.

## What I read

- **The paper.** The published open-access PDF (<https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00126-4.pdf>),
  36 pages, SHA-256 prefix `ab399862…`, equal to the extraction's. I read:
  - pp. 117–118 and the Notation on p. 121;
  - Lemma 2.2 (p. 124);
  - the dyadic patching argument (p. 137);
  - pp. 146–147.
- **The cited sources.** BLGGT, Annals 179 (2014), Lemma 1.4.3, from the Annals PDF; and Dummigan–Martin–Watkins, Pure
  Appl. Math. Q. 5 (2009), the definition of Λ(s).
- **Tau Ceti** at f790474: its symmetric-power declarations.
- **The extraction.** Items /16, /41, /45 and /59, and the reader.

## The findings

- **/1 (high): the dyadic case.** For p = 2 the paper proves R^loc[[X]] ≅ R′_∞, with Spec R′_∞ irreducible; R_∞ is only a
  G_m^γ[2]-torsor over R^inv_∞, whose components the torsor group permutes transitively. Item /16's "R_∞ is a domain"
  holds only for p > 2.
- **/2 (high): the weight of a twist.** "Weight k" is defined by W = (Sym^{k−2}ℂ²)^∨, with Hodge–Tate weights {0, k−1}.
  A twist by an algebraic character with nonzero infinity type is not of weight k, but /41 says it is.
- **/3 (high): potential diagonalisability.** BLGGT Lemma 1.4.3 assumes ρ potentially crystalline; /59 drops this. The
  Tate curve is ordinary but never potentially crystalline.
- **/4 (medium): the completed L-function.** DMW define Λ(s) = N_n^{s/2} γ(s) L(Sym^n E, s); /45 omits the conductor
  factor.
- **/5 (medium): symmetric powers.** The algebraic symmetric power is already in Tau Ceti
  (`Representation.symmetricPower`, `SymmetricPower.map`). The irreducibility of Sym^m over SL₂(𝔽_t) for t > m, used on
  p. 146, has no item; Tau Ceti's SU(2) theorem does not give it.
- **/6 (I would grade it medium): the reader's motivation.** "For p ≤ n, Sym^{n−1} of the residual representation is
  reducible" fails at p = n. It is reader prose, not an item or brief.
- **/7 (low): the reader's inventory.** It still describes the pre-review extraction ("37 items"); the accepted JSON has
  61 items and 6 routes.
