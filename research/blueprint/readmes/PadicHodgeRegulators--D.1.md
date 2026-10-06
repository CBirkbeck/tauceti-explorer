# P-adic regulators: Bloch–Kato maps, syntomic regulators and the local K₃ calculation

## Scope and ownership

This part of **P-adic regulators and the local K₃ calculation** (`PadicHodgeRegulators`) covers the layers `L0`, `L1`, `L2`, `D.1`, `D.2`, `D.3`, `D.4` and `D.5`. The layers `L3` and `L4` (the big logarithm and its signed and de Rham extensions) form the other part of the roadmap and consume `L0`–`L2`.

The roadmap owns, here:

- the **Bloch–Kato local conditions** `H¹_e ⊆ H¹_f ⊆ H¹_g`, the **Bloch–Kato exponential and logarithm**, **Kato's dual exponential**, their dimension formulas, local duality, twist, restriction, corestriction and Shapiro compatibilities, their semilocal versions, the Tate-twist and abelian-variety cases, and the **integral logarithm** for unramified fields (L1);
- the regulator-specific comparisons around **Fontaine's isomorphism** `D(T)^{ψ=1} ≅ H¹_Iw(Q_p, T)`: generator and root changes, the local Iwasawa twist, twist, lattice and coefficient squares, **Berger's ψ-invariants theorem**, and the Kummer–Coleman comparison (L2);
- the normalisations of **Coleman's p-adic dilogarithm** on finite étale `Q_p`-algebras and number fields (D.1);
- **Soulé's étale regulator**, **Besser's rigid syntomic cohomology and regulator**, their comparison through the Bloch–Kato exponential, **Besser–de Jeu's dilogarithm formula**, Gros's normalisation and the **Fontaine–Messing–Kato log-syntomic package** (D.2);
- the **unramified p > 3 theorem**: the regulator is an isomorphism `K₃(L; Z_p) ≅ p²O_L` and roots of unity generate (D.3);
- the **global p-adic K₃ regulator** with restriction, transfer, Frobenius, torsion and denominator control, and its export to Habiro-module gluing (D.4);
- the **weight-two syntomic regulator of curves** with good reduction, Besser's Coleman-integral formula, its étale comparison and functoriality, and the boundary of what bad reduction needs (D.5).

It imports, and does not plan again:

- Coleman's logarithm branches, polylogarithms, dilogarithm identities, the five-term relation and the values at roots of unity from `ColemanIntegration` (L0–L2);
- period rings, period functors, the fundamental exact sequences, the Hodge–Tate convention and the Fontaine–Laffaille interface from `PadicHodgeTheory` (R06.1, R06.2, R06.4, R06.5) and `FiniteFlatGroupsAndIntegralPadicHodgeTheory` (R07.3);
- Suslin's Bloch group, the pre-Bloch group and Suslin's exact sequence, root-of-unity classes and their comparisons from `K3BlochGroups` (V.2–V.6);
- completed K-theory of local fields, `K_{2i−1}(L; Z_p) ≅ H¹(L, Z_p(i))`, the semilocal completion map `λ_{F,p}` and its restriction and transfer squares from `KTheoryFiniteLocalFields` (L.1, L.2, L.6, L.7);
- Soulé's étale Chern classes with finite coefficients from `MotivicEtaleKTheory` (requested on M.7) and the continuous realisation (M.1);
- the étale `(φ,Γ)`-module, ψ, the Herr complex, the ψ-complex comparison and Wach modules from `PhiGammaModulesAndIwasawaCohomology` (PG.1, PG.3–PG.6), with the Robba and annulus rings from `PadicHodgeTheory` P7;
- Iwasawa cohomology, its Shapiro and descent statements, the Kummer limit map and local units from `SelmerIwasawaCohomology` (L0, L1, L3, L4), and local Tate duality and continuous cohomology from `ArithmeticGaloisDuality` (R02.1, R02.4);
- rigid cohomology with Frobenius from `PadicDifferentialEquationsAndRigidCohomology` (RD.4), log-crystalline cohomology from `CrystallineCohomology` (CR.2, CR.3, CR.5), relative period rings from `AInfCohomology` (AI.4), and Chern classes and K-theory functoriality from `SchemeKTheoryOperations`, `GeneralAlgebraicKTheory`, `EllipticKTheory` and `K2SymbolsBrauer`;
- the semilocal equivalence `F ⊗_Q Q_p ≅ ∏_{v|p} F_v` from Tau Ceti's NumberFieldArithmetic, layer 5.

Its consumers include `HabiroNumberFields` HB.7 and `HabiroNahmSeries` HB.9 (the regulator in Habiro-module gluing), `K3BlochGroups` V.6 (agreement of the p-adic regulator), `ColemanIntegration` L3 (the syntomic regulator of cyclotomic elements), `EllipticRegulators` ER.8 (curves), `SelmerIwasawaCohomology` L4, `GrossZagierAndArithmeticHeights` GZ.9, `GeneralizedHeegnerCycles` GH.2/GH.8, `HeegnerPointEulerSystems` HE.3, `KatoEulerSystems` L1/L3, `MotivicEtaleKTheory` M.8, `Polylogarithms` P.6 and the `L3`–`L4` part of this roadmap.

## Conventions

- **hodgeTate.** Hodge–Tate weights in the convention HT(Q_p(1)) = +1: h is a weight when Fil^{−h}D_dR ≠ Fil^{−h+1}D_dR (as in PadicHodgeTheory R06.2, R06.4, the L3–L4 packet and Lei–Loeffler–Zerbes). Sources with the opposite sign are translated.
- **periods.** t = log[ε] for a fixed compatible system ε of p-power roots of unity; e_r = t^{−r} ⊗ ε^{⊗r} is the canonical basis of D_dR(Q_p(r)), independent of ε, with φ(e_r) = p^{−r}e_r; D_dR(Q_p(r)) is identified with K through e_r.
- **frobenius.** Arithmetic Frobenius throughout (φ(ζ) = ζ^p on roots of unity of order prime to p); sources using the geometric Frobenius (Huber–Kings 2003) are converted.
- **logarithm.** The Iwasawa branch log_p(p) = 0 of ColemanIntegration:L0/iwasawa-logarithm; D_p(z) = Li_2(z) + ½ log_p(z) log_p(1 − z) is Coleman's D for this branch, equal to Besser–de Jeu's L_mod,2.
- **regulators.** Soulé's étale regulator uses Chern classes; Besser's syntomic regulator reg_syn = η ∘ c^syn satisfies r^et = exp_BK ∘ reg_syn with no constant; D_p on completed K_3 is ε·log_BK ∘ c_{2,1} with the sign ε fixed by D_p([ζ]) = Li_2(ζ); Gros's normalisation is (1 − σ/p²)·D_p. For curves, regP = Θ ∘ reg_syn = log_BK ∘ r^et, and regSynCan = (1 − φ/q²)·regP.
- **kTheory.** K_3(L; Z_p) is π_3 of the p-completed K-theory spectrum (KTheoryFiniteLocalFields:L.1/completed-k-theory); for p > 3 and L unramified it is free of rank [L : Q_p] and equals the completion of Suslin's Bloch group.

## Sources

The layers follow these sources; versions, locators and checksums are in the packet.

- Garoufalidis–Scholze–Wheeler–Zagier, *The Habiro ring of a number field*, arXiv:2412.04241v2: §1.5 (19)–(22), §3.1 (Lemma 3.1, Propositions 3.2–3.3, Theorem 9), Example 4.3.
- Besser–de Jeu, *The syntomic regulator for the K-theory of fields*, arXiv:math/0110334v2 (Ann. Sci. ÉNS 2003): Theorems 1.6, 1.10, 1.12, Remark 1.13, Conjecture 1.14, Definition 4.6.
- Huber–Kings, *A p-adic analogue of the Borel regulator and the Bloch–Kato exponential map*, arXiv:math/0612611; Tamme, arXiv:1111.4109v4; Nekovář–Nizioł, arXiv:1309.7620v5; Colmez–Nizioł, arXiv:1505.06471v4.
- Berger, *Bloch and Kato's exponential map: three explicit formulas* (arXiv and Documenta versions); Berger, *Limites de représentations cristallines*; Cherbonnier–Colmez (JAMS 1999); Lei–Loeffler–Zerbes, arXiv:0912.1263v3; Loeffler–Zerbes, arXiv:1108.5954v3.
- Fontaine–Ouyang, *Theory of p-adic Galois representations*; Rubin, *Euler Systems*; Huber–Kings, arXiv:math/0101071; Benois–Nguyen Quang Do (Ann. Sci. ÉNS 2002); Fontaine's appendix to Perrin-Riou (Invent. Math. 1994); Benois, arXiv:1412.7305.
- Asakura–Miyatani, arXiv:1711.08854v2; Asakura–Chida, arXiv:2003.08888v2; Besser–de Jeu, arXiv:1208.0516v1; Besser, *p-adic Arakelov theory*; Besser–Zerbes, arXiv:1711.06950v1.

Bloch–Kato's *L-functions and Tamagawa numbers of motives* and Besser's *Syntomic regulators and p-adic integration I, II* are cited through the sources above, which state the results used.

## L0. Period rings and realizations: conventions

L0 introduces no carrier. It fixes how the regulator layers read the period rings and functors of `PadicHodgeTheory`: the period `t = log[ε]`, the Hodge–Tate convention `HT(Q_p(1)) = +1` (shared with `L3`–`L4`, `PadicHodgeTheory` R06.4 and `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.3), the canonical basis `e_r = t^{−r} ⊗ ε^{⊗r}` of `D_dR(Q_p(r))` with `φ(e_r) = p^{−r}e_r`, the twist `D(V(i)) = D(V)⟨i⟩`, the fundamental exact sequences in the forms the Bloch–Kato maps use, and the integral Fontaine–Laffaille interface for weights in `[0, p − 2]`. Every statement is imported from `PadicHodgeTheory` R06.1/R06.2/R06.4 and `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.3 nodes; the nodes record the reading, so that a sign or a normalisation is never changed silently downstream.

**Dependencies.** `PadicHodgeTheory:R06.1`, `R06.2`, `R06.4` (nodes), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3` (nodes).

### Hodge–Tate, twist and period conventions for the regulator

**Node** `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions` (comparison).

Throughout PadicHodgeRegulators: (i) t = log[ε] ∈ B_dR^+ is the period of Z_p(1) for a fixed compatible system ε = (ζ_{p^n}) of p-power roots of unity; Fil^i B_dR = t^i B_dR^+, g(t) = χ(g)t for the cyclotomic character χ, and φ(t) = pt in B_cris (arithmetic Frobenius). (ii) Hodge–Tate weights: h is a weight of V when Fil^{−h}D_dR(V) ≠ Fil^{−h+1}D_dR(V); with this convention Q_p(1) has weight +1 and V_pA of an abelian variety has weights 0 and 1, matching the L3–L4 packet, PadicHodgeTheory R06.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 (HT(χ) = +1). (iii) For r ∈ Z, e_r := t^{−r} ⊗ ε^{⊗r} is a basis of D_cris(Q_p(r)) = K_0·e_r and of D_dR(Q_p(r)) = K·e_r, independent of ε, with φ(e_r) = p^{−r}e_r, Fil^{−r} = D_dR and Fil^{−r+1} = 0; hence D_dR(Q_p(r))/Fil^0 = K·e_r for r ≥ 1 and 0 for r ≤ 0. (iv) Twisting: D_cris(V(i)) = D_cris(V)⟨i⟩ via d ↦ d ⊗ e_i, with Fil^j(D⟨i⟩) = Fil^{j+i}D and φ|_{D⟨i⟩} = p^{−i}φ|_D. (v) Crystalline representations have N = 0; the monodromy operator is used only for semistable inputs (D.5's boundary). Sources using the opposite weight sign (Benois: Q_p(1) of weight −1) are translated, never mixed.

**Hypotheses.** K/Q_p finite with maximal unramified subfield K_0; V a p-adic representation of G_K.

**Prerequisites.** `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.1/bdr-filtration-and-graded`, `PadicHodgeTheory:R06.1/frobenius-on-acris`, `PadicHodgeTheory:R06.2/ddr-of-tate-twists`, `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`

**Proof or construction.**

1. (i)–(iii) are properties of the imported period rings and functors (PadicHodgeTheory R06.1/fontaine-element-t, R06.1/bdr-filtration-and-graded, R06.2/ddr-of-tate-twists and R06.2/hodge-tate-weight-convention); this node pins how the regulator layers read them; e_r is G_K-invariant because g acts on t^{−r} by χ(g)^{−r} and on ε^{⊗r} by χ(g)^r.
2. (iv) is Fontaine–Ouyang Definition 9.4 and Lemma 9.5.
3. The weight convention is fixed by comparing with Berger §I.2 and Lei–Loeffler–Zerbes §2.1.

**Acceptance.** D_dR(Q_p(2)) = K·e_2 with φ(e_2) = p^{−2}e_2 and D_dR(Q_p(2))/Fil^0 = K: the target of the weight-two regulator. D_dR(Q_p)/Fil^0 = 0 and D_dR(Q_p(−1))/Fil^0 = 0. A source stating 'Q_p(1) has Hodge–Tate weight −1' is translated by h ↦ −h before use.

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Definition 9.4 and Lemma 9.5, pp. 218–219; [Berger2003](https://arxiv.org/abs/math/0209283v1), §I.2, p. 6; [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), §1.3, p. 646.

### The fundamental exact sequences used by the Bloch–Kato maps

**Node** `PadicHodgeRegulators:L0/fundamental-exact-sequences` (comparison).

From PadicHodgeTheory R06.1 (its nodes fundamental-exact-sequence, bcris-twisted-frobenius-sequences and divided-frobenius-exact-sequence), with the conventions of L0/hodge-tate-and-twist-conventions: (a) with B_e := B_cris^{φ=1}, the sequences 0 → Q_p → B_e → B_dR/B_dR^+ → 0 and 0 → Q_p → B_e ⊕ B_dR^+ → B_dR → 0 are exact; (b) 0 → Q_p → B_cris --(φ − 1, mod Fil^0)--> B_cris ⊕ B_dR/B_dR^+ → 0 is exact; (c) for every r ∈ Z, 0 → Q_p(r) → Fil^r B_cris --(p^{−r}φ − 1)--> B_cris → 0 is exact (Fontaine); (d) integrally, 0 → Z_p(r)' → Fil^r A_cr --(p^r − φ)--> A_cr has cokernel killed by p^r, with Z_p(r)' = p^{−a(r)}Z_p(r) for r = (p − 1)a(r) + b(r). Tensoring (a)–(c) with any p-adic representation V gives exact sequences of G_K-modules; for de Rham V, H^0(K, (B_dR/B_dR^+) ⊗ V) = D_dR(V)/Fil^0 and H^0(K, B_e ⊗ V) = D_cris(V)^{φ=1}.

**Hypotheses.** K/Q_p finite; V any p-adic representation for exactness, de Rham for the identification of invariants.

**Prerequisites.** `PadicHodgeTheory:R06.1/fundamental-exact-sequence`, `PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences`, `PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence`, `PadicHodgeTheory:R06.1/period-ring-invariants`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`

**Proof or construction.**

1. (a) is PadicHodgeTheory:R06.1/fundamental-exact-sequence (Fontaine–Ouyang Theorem 7.28(4) and Remark 7.29); the second form follows by adding B_dR^+.
2. (b) is Fontaine–Ouyang (9.12), obtained from (a); (c) is PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences; (d) is PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence (Colmez–Nizioł §2.4.3, Lemma 2.23).
3. Tensoring over Q_p with V is exact; invariants are computed by the period functors of R06.2.

**Acceptance.** For V = Q_p(r), r ≥ 1: H^0(K, B_e(r)) = D_cris(Q_p(r))^{φ=1} = 0, so the connecting map of (a) ⊗ V is injective on D_dR/Fil^0. For V = Q_p: H^0(K, B_e) = K_0^{φ=1} = Q_p and D_dR(Q_p)/Fil^0 = 0.

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Theorem 7.28(4), p. 170; [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Remark 7.29, p. 171; [CN2017](https://arxiv.org/abs/1505.06471v4), §2.4.3, p. 23.

### Integral comparison interface for small weights

**Node** `PadicHodgeRegulators:L0/integral-period-interface` (comparison).

For K/Q_p finite unramified and a crystalline G_K-stable Z_p-lattice T with Hodge–Tate weights in [0, p − 2] (HT(χ) = +1), the Fontaine–Laffaille correspondence T ↔ M (strongly divisible W(k)-lattice in D_cris(V^∨)) of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 is imported with its normalisation; for T = Z_p(r), 0 ≤ r ≤ p − 2, the lattice is W(k)·e_{−r} in D_cris(Q_p(−r)). The integral Bloch–Kato statement of L1/integral-logarithm-unramified and the integral period map of D.2/fontaine-messing-kato-period-map are formulated against these lattices and the integral sequence L0/fundamental-exact-sequences (d); no further integral period carrier is introduced here.

**Hypotheses.** K unramified over Q_p; weights in [0, p − 2]; p odd.

**Prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/strongly-divisible-lattices`, `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`, `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`

**Proof or construction.**

1. The lattice correspondence is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence; its small-weight interface (indices translated to HT(χ) = +1) is PadicHodgeTheory R06.4.
2. For a rank-one Tate twist the strongly divisible lattice is W(k)·e_{−r}: p^{−i}Φ(M ∩ Fil^i) = M holds because Φ(e_{−r}) = p^r e_{−r} and Fil^r ∩ M = M.

**Acceptance.** T = Z_p(2) with p ≥ 5 lies in the Fontaine–Laffaille range [0, p − 2]. T = Z_p(p − 1) is outside the range; the integral statements of L1 are not asserted there.

**Sources.** [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), §1.3, p. 647.

### Acceptance tests for L0

- `D_dR(Q_p(2))/Fil⁰ = K·e_2` with `φ(e_2) = p^{−2}e_2`.
- The sign convention is translated, never mixed, when a source uses `HT(Q_p(1)) = −1`.

## L1. Bloch–Kato maps

For a finite extension `K/Q_p` and a p-adic representation `V`, L1 constructs the subspaces `H¹_e ⊆ H¹_f ⊆ H¹_g` of `H¹(K, V)` from the fundamental exact sequences, the Bloch–Kato exponential `exp : D_dR(V)/Fil⁰ → H¹(K, V)` (image `H¹_e`, kernel the image of `D_cris(V)^{φ=1}`), the Bloch–Kato logarithm (its inverse when `D_cris(V)^{φ=1} = H⁰(K, V)`), and Kato's dual exponential `exp* : H¹(K, V) → Fil⁰D_dR(V)` (kernel `H¹_g`, adjoint to `exp` of `V^*(1)`). It proves the dimension formulas, the local duality of the conditions (`H¹_f(V^*(1)) = H¹_f(V)^⊥`, `H¹_e ↔ H¹_g`), the integral (propagated) conditions, restriction, corestriction and Shapiro compatibilities, the semilocal versions, the cases `Q_p`, `Q_p(1)` (where `log_BK ∘ κ = log_p`), `Q_p(r)` for `r ≥ 2` and `r ≤ −1`, the abelian-variety case `log_BK ∘ κ = log_A`, and the **integral logarithm**: for `L/Q_p` unramified, `p` odd and `2 ≤ r ≤ p − 2`, `log_BK(H¹(L, Z_p(r))) = p^r O_L e_r`. These proofs supply the local-condition layer that the Selmer roadmaps import; they do not presuppose it.

**Dependencies.** `PadicHodgeRegulators:L0`; `ArithmeticGaloisDuality:R02.1`, `R02.4`; `SelmerIwasawaCohomology:L0`, `L1`; `PadicHodgeTheory:R06.2`, `R06.5`, `R06.6`; `KTheoryFiniteLocalFields:L.6`; `ColemanIntegration:L0`.

### The Bloch–Kato local conditions H¹_e, H¹_f, H¹_g

**Node** `PadicHodgeRegulators:L1/bloch-kato-subgroups` (definition). **Declaration:** `blochKatoF`. **Planet:** Bloch–Kato local conditions.

Let K/Q_p be finite and V a p-adic representation of G_K. Define H^1_e(K, V) := ker(H^1(K, V) → H^1(K, B_e ⊗ V)), H^1_f(K, V) := ker(H^1(K, V) → H^1(K, B_cris ⊗ V)) and H^1_g(K, V) := ker(H^1(K, V) → H^1(K, B_dR ⊗ V)), so H^1_e ⊆ H^1_f ⊆ H^1_g. For a G_K-stable Z_p-lattice T ⊂ V and W = V/T, H^1_f(K, T) is the preimage of H^1_f(K, V) and H^1_f(K, W) the image of H^1_f(K, V); these are the finite local conditions. For ℓ ≠ p (K/Q_ℓ finite) H^1_f := H^1_ur. The singular quotient is H^1_s := H^1/H^1_f.

**Hypotheses.** K/Q_p finite (or K/Q_ℓ finite with ℓ ≠ p for the unramified condition); V finite-dimensional continuous.

**Prerequisites.** `PadicHodgeRegulators:L0/fundamental-exact-sequences`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `ArithmeticGaloisDuality:R02.1/rationalization`, `SelmerIwasawaCohomology:L0/padic-kummer-identification`

**Proof or construction.**

1. The maps are induced by V → B_* ⊗ V on continuous cohomology (ArithmeticGaloisDuality R02.1).
2. The inclusions follow from B_e ⊂ B_cris ⊂ B_dR.
3. The integral conditions are the propagated conditions of Rubin, Euler Systems, Definition I.3.4 and Remark I.3.6.

**API.**

- `blochKatoE` (data): blochKatoE K V : Submodule ℚ_p (H^1(K, V)).
- `blochKatoF` (data): blochKatoF K V : Submodule ℚ_p (H^1(K, V)).
- `blochKatoG` (data): blochKatoG K V : Submodule ℚ_p (H^1(K, V)).
- `blochKatoE_le_F` (relation): blochKatoE K V ≤ blochKatoF K V ≤ blochKatoG K V.
- `blochKatoF_lattice` (constructor): blochKatoF K T := preimage under H^1(K, T) → H^1(K, V); blochKatoF K (V/T) := image.
- `blochKatoF_map` (functoriality): For a G_K-map V → V', H^1(K, V) → H^1(K, V') maps blochKatoF into blochKatoF (same for e, g).
- `blochKatoF_res` (functoriality): For L/K finite, restriction maps blochKatoF K V into blochKatoF L V and corestriction maps back.
- `blochKatoF_unramified` (compatibility): For ℓ ≠ p, blochKatoF := H^1_ur.

**Uses.** SelmerIwasawaCohomology:L4/bloch-kato-condition: H^1_f(F_v, V) = ker(H^1 → H^1(B_cris ⊗ V)) and its integral propagation (RJW Definition 13.19(2)). GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class: loc_v κ(P) ∈ H^1_f = H^1_e for abelian varieties with good reduction. HeegnerPointEulerSystems:HE.3: Kummer classes and exact Selmer conditions. GeneralizedHeegnerCycles:GH.2: ring-class trace and local conditions. PadicHodgeRegulators:L3/ramified-interpolation: the finite-part class for which the Bloch–Kato logarithm is used.

**Unit tests.**

- `blochKatoF_trivial` (computation): For V = Q_p and K = Q_p, blochKatoF = H^1_ur(Q_p, Q_p) = Hom(Gal(Q_p^ur/Q_p), Q_p), of dimension 1, while H^1(Q_p, Q_p) has dimension 2.
- `blochKatoF_negative_twist` (degenerate): For V = Q_p(−1), H^1_e = H^1_f = H^1_g = 0 although H^1(K, Q_p(−1)) has dimension [K : Q_p].
- `blochKatoF_rubin_compat` (compatibility): For V = Q_p(1), blochKatoF agrees with Rubin's U_{L,v} ⊗ Φ condition (Euler Systems, §I.6.3, (7)) and with the Kummer image of the completed units.
- `blochKatoG_not_all` (non-example): For V = Q_p, H^1_g(K, Q_p) = H^1_f(K, Q_p) ≠ H^1(K, Q_p): the de Rham condition is a proper subspace (the ramified homomorphisms are excluded).

**Acceptance.** V = Q_p: H^1_f = H^1_ur (dimension 1) while dim H^1 = [K : Q_p] + 1. V = Q_p(1): H^1_f is the image of (O_K^×)^∧ ⊗ Q_p under the Kummer map, of dimension [K : Q_p].

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Definition 9.22, (9.8), p. 232; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Remark I.3.6, p. 7.

### The Bloch–Kato exponential

**Node** `PadicHodgeRegulators:L1/bloch-kato-exponential` (construction). **Declaration:** `blochKatoExp`. **Planet:** Bloch–Kato exponential.

For K/Q_p finite and V a de Rham representation, exp_{K,V} : D_dR(V)/Fil^0 D_dR(V) → H^1(K, V) is the connecting homomorphism of 0 → V → B_e ⊗ V → (B_dR/B_dR^+) ⊗ V → 0 (L0/fundamental-exact-sequences (a) ⊗ V). There are exact sequences 0 → H^0(K, V) → D_cris(V)^{φ=1} → D_dR(V)/Fil^0 → H^1_e(K, V) → 0 and 0 → H^0(K, V) → D_cris(V) → D_cris(V) ⊕ D_dR(V)/Fil^0 → H^1_f(K, V) → 0 (the first map x ↦ (φx − x, x̄)); in particular im(exp_{K,V}) = H^1_e(K, V) and ker(exp_{K,V}) is the image of D_cris(V)^{φ=1}. Explicitly, exp(x) is the class of g ↦ (g − 1)b for any b ∈ B_e ⊗ V with b − x ∈ B_dR^+ ⊗ V.

**Hypotheses.** K/Q_p finite; V de Rham (for the identification of the source with D_dR(V)/Fil^0).

**Prerequisites.** `PadicHodgeRegulators:L0/fundamental-exact-sequences`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `PadicHodgeTheory:R06.2/period-functors`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`

**Proof or construction.**

1. Take the long exact cohomology sequence of the tensored fundamental sequence; H^0(K, B_e ⊗ V) = D_cris(V)^{φ=1} and H^0(K, (B_dR/B_dR^+) ⊗ V) = D_dR(V)/Fil^0 for de Rham V.
2. The H^1_f sequence uses L0/fundamental-exact-sequences (b) ⊗ V.
3. The cocycle description is the definition of the connecting map.

**API.**

- `blochKatoExp` (data): blochKatoExp K V : D_dR(V) ⧸ Fil^0 →ₗ[ℚ_p] H^1(K, V).
- `blochKatoExp_range` (characterisation): LinearMap.range (blochKatoExp K V) = blochKatoE K V.
- `blochKatoExp_ker` (characterisation): ker (blochKatoExp K V) = image of D_cris(V)^{φ=1} in D_dR(V)/Fil^0.
- `blochKatoExp_injective_iff` (characterisation): blochKatoExp K V is injective iff D_cris(V)^{φ=1} = H^0(K, V).
- `blochKatoExp_cocycle` (simp): blochKatoExp K V x is represented by g ↦ (g − 1)b for b ∈ B_e ⊗ V lifting x.
- `blochKatoExp_map` (functoriality): Natural in V for G_K-equivariant maps of de Rham representations.
- `blochKatoExp_f_sequence` (relation): The exact sequence 0 → H^0 → D_cris → D_cris ⊕ D_dR/Fil^0 → H^1_f → 0.

**Uses.** PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison: r^et = exp_BK ∘ reg_syn on K_{2n−1}(O_K). PadicHodgeRegulators:D.2/syntomic-exponential: the syntomic exponential composed with the period map is exp_BK. PadicHodgeRegulators:L3/ramified-interpolation: the interpolation formula of the big logarithm at j ≤ −1 uses the Bloch–Kato logarithm. PhiGammaModulesAndIwasawaCohomology:PG.5: the Bloch–Kato normalisation comparison at the end of PG.5 (RS-26 link L1 → PG.5).

**Unit tests.**

- `blochKatoExp_twist_two` (computation): For K = Q_p and V = Q_p(2), blochKatoExp is an isomorphism Q_p·e_2 ≅ H^1(Q_p, Q_p(2)) ≅ Q_p.
- `blochKatoExp_trivial` (degenerate): For V = Q_p, D_dR(Q_p)/Fil^0 = 0, so blochKatoExp = 0 and H^1_e(K, Q_p) = 0.
- `blochKatoExp_kummer` (compatibility): For V = Q_p(1) and u ∈ 1 + p^c O_K (c > 1/(p − 1)), blochKatoExp(log u · e_1) = κ(u), the Kummer class (Bloch–Kato 3.10.1).
- `blochKatoExp_not_onto_f` (non-example): For V = Q_p(1), H^1_e = H^1_f has dimension [K : Q_p] but H^1(K, Q_p(1)) has dimension [K : Q_p] + 1: the exponential does not reach the valuation direction.

**Acceptance.** V = Q_p(1): exp agrees with the usual p-adic exponential on a neighbourhood of 0 of K (Bloch–Kato p. 358 as recalled by Huber–Kings). V = Q_p(r), r ≥ 2: exp is an isomorphism K·e_r ≅ H^1(K, Q_p(r)).

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), (9.11), p. 233; [Berger2003](https://arxiv.org/abs/math/0209283v1), Introduction, p. 2.

### The Bloch–Kato logarithm

**Node** `PadicHodgeRegulators:L1/bloch-kato-logarithm` (construction). **Declaration:** `blochKatoLog`.

Let K/Q_p be finite and V de Rham with D_cris(V)^{φ=1} = H^0(K, V) (so exp_{K,V} is injective). The Bloch–Kato logarithm is log_BK := exp_{K,V}^{−1} : H^1_e(K, V) → D_dR(V)/Fil^0 D_dR(V). For V = Q_p(r), r ≥ 2, H^1_e = H^1(K, Q_p(r)) and log_BK : H^1(K, Q_p(r)) ≅ K·e_r ≅ K; for V = Q_p(1), log_BK ∘ κ = log_p on O_K^× (Iwasawa branch), with κ the Kummer map.

**Hypotheses.** D_cris(V)^{φ=1} = H^0(K, V).

**Prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-exponential`, `ColemanIntegration:L0/iwasawa-logarithm`, `tauceti:TauCeti.kummerClassMap`

**Proof or construction.**

1. exp is injective under the hypothesis and has image H^1_e (L1/bloch-kato-exponential); define log_BK as its inverse on the image.
2. For Q_p(r), r ≥ 2: D_cris(Q_p(r))^{φ=1} = 0 = H^0, and dim H^1 = [K : Q_p] = dim D_dR/Fil^0 (H^0 = H^2 = 0), so H^1_e = H^1.
3. For Q_p(1): Bloch–Kato's comparison of exp with the usual exponential (Bloch–Kato 3.10.1, recalled by Huber–Kings Remark 1.3.3) gives log_BK ∘ κ = log_p.

**API.**

- `blochKatoLog` (data): blochKatoLog K V : blochKatoE K V →ₗ[ℚ_p] D_dR(V) ⧸ Fil^0 (under the injectivity hypothesis).
- `blochKatoLog_exp` (simp): blochKatoLog (blochKatoExp x) = x.
- `blochKatoExp_log` (simp): blochKatoExp (blochKatoLog y) = y for y ∈ blochKatoE K V.
- `blochKatoLog_twist` (equivalence): For r ≥ 2, blochKatoLog K (ℚ_p(r)) : H^1(K, ℚ_p(r)) ≃ₗ K·e_r.
- `blochKatoLog_kummer` (compatibility): For r = 1 and u ∈ 𝒪_Kˣ, blochKatoLog (κ u) = log_p u · e_1.
- `blochKatoLog_map` (functoriality): Natural for G_K-maps between representations satisfying the hypothesis.

**Uses.** PadicHodgeRegulators:D.3/local-regulator: D_L = ε·log_BK ∘ c_{2,1} on completed K_3. EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: z = log_BK(reg_et(u)) for weight-two elliptic classes. GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class: log_BK ∘ κ = log_A for abelian varieties with good reduction. GeneralizedHeegnerCycles:GH.8/differential-evaluation: naturality of log_BK for the quotient and its formal-group comparison.

**Unit tests.**

- `blochKatoLog_principal_unit` (computation): For K = Q_p (p odd), blochKatoLog (κ(1 + p)) = log(1 + p)·e_1 = (p − p²/2 + p³/3 − …)·e_1.
- `blochKatoLog_teichmuller` (degenerate): For a Teichmüller unit ω, blochKatoLog (κ ω) = 0 (κ(ω) is torsion in H^1(K, Z_p(1)) and log_p(ω) = 0).
- `blochKatoLog_coleman_compat` (compatibility): blochKatoLog ∘ κ = ColemanIntegration's Iwasawa logarithm on 𝒪_Kˣ (ColemanIntegration:L0/iwasawa-logarithm).
- `blochKatoLog_not_defined_trivial` (non-example): For V = Q_p, D_cris^{φ=1} = Q_p = H^0 but D_dR/Fil^0 = 0 and H^1_e = 0, so blochKatoLog has zero source: H^1_f(K, Q_p) ≠ 0 is not in its domain.

**Acceptance.** log_BK(κ(1 + p)) = log(1 + p) for K = Q_p, p odd. For V = Q_p(1) the class of p itself is not in H^1_e, so log_BK(κ(p)) is undefined.

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Remark 1.3.3, p. 9; [HK2011](https://arxiv.org/abs/math/0612611v1), §1.3, p. 8.

### Kato's dual exponential

**Node** `PadicHodgeRegulators:L1/dual-exponential` (construction). **Declaration:** `dualExp`. **Planet:** Kato's dual exponential.

For K/Q_p finite and V de Rham, the dual exponential exp*_{K,V^*(1)} : H^1(K, V) → Fil^0 D_dR(V) is the composite H^1(K, V) → H^1(K, B_dR ⊗ V) ≅ D_dR(V), the isomorphism being x ↦ (g ↦ log χ(g)·x) (Kato); its image lies in Fil^0 D_dR(V) and its kernel is H^1_g(K, V). It is the transpose of exp_{K,V^*(1)} for the Tate pairing ⟨ , ⟩ : H^1(K, V) × H^1(K, V^*(1)) → H^2(K, Q_p(1)) = Q_p and the de Rham pairing [ , ] : D_dR(V) × D_dR(V^*(1)) → D_dR(Q_p(1)) = K --Tr_{K/Q_p}--> Q_p: [x, exp*(y)] = ⟨exp(x), y⟩ for x ∈ D_dR(V^*(1))/Fil^0, y ∈ H^1(K, V), with the sign convention pinned here (the sources warn that signs vary).

**Hypotheses.** K/Q_p finite; V de Rham.

**Prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `SelmerIwasawaCohomology:L1/orthogonal-complement`, `ArithmeticGaloisDuality:R02.4/class-formation-ext-duality`, `PadicHodgeTheory:R06.1/de-rham-invariants`

**Proof or construction.**

1. Fontaine–Ouyang Proposition 6.35 computes H^1(K, t^iB_dR^+/t^jB_dR^+) via cup product with log χ; passing to the limit gives the isomorphism H^1(K, B_dR ⊗ V) ≅ D_dR(V) (Berger Proposition II.5).
2. The image lies in Fil^0 because the map factors through H^1(K, B_dR^+ ⊗ V); its kernel is H^1_g by definition.
3. The adjunction is the definition via the perfect Tate pairing (local Tate duality from ArithmeticGaloisDuality:R02.4/class-formation-ext-duality, orthogonality formalism from SelmerIwasawaCohomology:L1/orthogonal-complement).

**API.**

- `dualExp` (data): dualExp K V : H^1(K, V) →ₗ[ℚ_p] Fil^0 D_dR(V).
- `dualExp_ker` (characterisation): ker (dualExp K V) = blochKatoG K V.
- `dualExp_adjoint` (characterisation): deRhamPairing x (dualExp K V y) = tatePairing (blochKatoExp K V^*(1) x) y.
- `dualExp_formula` (simp): dualExp K V is H^1(K, V) → H^1(K, B_dR^+ ⊗ V) ≅ Fil^0 D_dR(V) via ∪ log χ.
- `dualExp_map` (functoriality): Natural in V; compatible with corestriction and trace (L1/twist-and-change-of-field).

**Uses.** PadicHodgeRegulators:L3/ramified-interpolation: B_j = exp* for j ≥ 0 in the interpolation formula of the big logarithm. PadicHodgeRegulators:L4/derham-interpolation-growth: Rodrigues Jacinto's interpolation uses exp* for j ≥ 0. L3/rubin-coleman-map: Rubin's Coleman map is defined through exp*_{ω_A}. KatoEulerSystems:L3: explicit reciprocity expresses exp* of Kato's classes by modular forms.

**Unit tests.**

- `dualExp_trivial_log_chi` (computation): For K = Q_p and V = Q_p, dualExp (log χ) = 1.
- `dualExp_positive_twist` (degenerate): For V = Q_p(r) with r ≥ 1, dualExp = 0.
- `dualExp_adjoint_compat` (compatibility): For V = Q_p and x ∈ D_dR(Q_p(1))/Fil^0 = K·e_1: [x, dualExp y] = ⟨exp_{Q_p(1)}(x), y⟩, matching the Kummer/local class field theory pairing.
- `dualExp_kernel_not_f` (non-example): For V = Q_p(1), ker dualExp = H^1_g = H^1 ≠ H^1_f: the kernel is H^1_g, not H^1_f.

**Acceptance.** V = Q_p: exp*(η) for η ∈ H^1(K, Q_p) = Hom(G_K, Q_p) is the coefficient of log χ in η (η = a·log χ + unramified part gives exp*(η) = a). V = Q_p(r), r ≥ 1: exp* vanishes, since Fil^0 D_dR(Q_p(r)) = 0.

**Sources.** [Berger2003](https://arxiv.org/abs/math/0209283v1), Introduction, p. 2; [Berger2003](https://arxiv.org/abs/math/0209283v1), §II, p. 13.

### Dimensions of the Bloch–Kato subspaces

**Node** `PadicHodgeRegulators:L1/dimension-formulas` (theorem).

Let K/Q_p be finite and V a de Rham representation. Then dim H^1_f(K, V) = dim_{Q_p} D_dR(V)/Fil^0 + dim H^0(K, V); dim H^1_f/H^1_e = dim D_cris(V)^{φ=1}; dim H^1_g(K, V) = dim H^1_f(K, V) + dim D_cris(V^*(1))^{φ=1}; and dim H^1(K, V) = [K : Q_p]·dim V + dim H^0(K, V) + dim H^0(K, V^*(1)).

**Hypotheses.** K/Q_p finite; V de Rham (crystalline for nothing further).

**Prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/local-duality-of-conditions`, `ArithmeticGaloisDuality:R02.4/class-formation-ext-duality`

**Proof or construction.**

1. Count dimensions in the exact sequences of L1/bloch-kato-exponential; the two D_cris(V) terms cancel in the H^1_f sequence.
2. The H^1_g formula follows from H^1_g(V) = H^1_e(V^*(1))^⊥ (L1/local-duality-of-conditions) and the H^1_e count for V^*(1).
3. The Euler characteristic formula Σ(−1)^i dim H^i = −[K : Q_p] dim V with H^2(V) dual to H^0(V^*(1)) gives dim H^1.

**Acceptance.** V = Q_p(2), K = Q_p: dim H^1_f = 1 = dim H^1. V = Q_p(1): dim H^1_f = [K : Q_p] and dim H^1 = [K : Q_p] + 1. V = Q_p: dim H^1_f = 1 and dim H^1_g = 1 + dim D_cris(Q_p(1))^{φ=1} = 1.

**Sources.** [Benois2014](https://arxiv.org/abs/1412.7305v1), Proposition 2.8.2(i), p. 44; [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), (9.16), p. 235.

### Local duality of the Bloch–Kato conditions

**Node** `PadicHodgeRegulators:L1/local-duality-of-conditions` (theorem).

Let K/Q_p be finite and V de Rham. Under the perfect cup-product pairing H^1(K, V) × H^1(K, V^*(1)) → H^2(K, Q_p(1)) = Q_p: H^1_f(K, V^*(1)) = H^1_f(K, V)^⊥, H^1_e(K, V^*(1)) = H^1_g(K, V)^⊥ and H^1_g(K, V^*(1)) = H^1_e(K, V)^⊥. For a G_K-stable lattice T, H^1_f(K, T) and H^1_f(K, V^*(1)/T^*(1)) (propagated conditions; V^*(1)/T^*(1) = Hom(T, μ_{p^∞})) are exact annihilators under the induced pairing H^1(K, T) × H^1(K, V^*(1)/T^*(1)) → Q_p/Z_p. For ℓ ≠ p, the unramified conditions are exact annihilators.

**Hypotheses.** K/Q_p finite; V de Rham (Bloch–Kato Proposition 3.8; Fontaine–Ouyang state it for semistable V).

**Prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `PadicHodgeRegulators:L1/bloch-kato-exponential`, `ArithmeticGaloisDuality:R02.4/class-formation-ext-duality`, `ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators`, `SelmerIwasawaCohomology:L1/orthogonal-complement`, `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility`

**Proof or construction.**

1. Orthogonality: the cup product of H^1_f(V) and H^1_f(V^*(1)) factors through H^2(K, B_cris ⊗ Q_p(1)) computations which vanish (Bloch–Kato Proposition 3.8, quoted in Fontaine–Ouyang Theorem 9.27).
2. Exactness follows from the dimension count of L1/dimension-formulas: dim H^1_f(V) + dim H^1_f(V^*(1)) = dim H^1(V).
3. Integral version: Rubin Proposition I.4.3, using the lattice compatibility of the pairings (SelmerIwasawaCohomology:L1/lattice-pairing-compatibility).

**Acceptance.** V = Q_p: H^1_f(Q_p) = H^1_ur is the annihilator of H^1_f(Q_p(1)) = Kummer image of units, which is local class field theory's statement that units are the norms killing unramified characters. V = Q_p(2), V^*(1) = Q_p(−1): H^1_f(Q_p(2)) = H^1 and H^1_f(Q_p(−1)) = 0 are annihilators.

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Theorem 9.27, p. 235; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Remark I.7.1, p. 17.

### Twists, restriction and corestriction for the Bloch–Kato maps

**Node** `PadicHodgeRegulators:L1/twist-and-change-of-field` (lemma).

Let L/K be a finite extension of finite extensions of Q_p and V de Rham over K. (a) Restriction: res_{L/K} ∘ exp_{K,V} = exp_{L,V} ∘ ι, with ι : D_dR,K(V) → L ⊗_K D_dR,K(V) = D_dR,L(V) the inclusion. (b) Corestriction: cor_{L/K} ∘ exp_{L,V} = exp_{K,V} ∘ Tr_{L/K}, and Tr_{L/K} ∘ exp*_L = exp*_K ∘ cor_{L/K}. (c) Twisting: for i ∈ Z, D_cris(V(i)) = D_cris(V) ⊗ e_i and D_dR(V(i)) = D_dR(V) ⊗ e_i with Fil^j shifted by i and φ multiplied by p^{−i}; there is no finite-level map H^1(K, V) → H^1(K, V(i)), and twisting enters the exponentials only through Iwasawa cohomology (L2/local-iwasawa-twist). (d) Shapiro: for V a representation of G_L, H^1(K, Ind_L^K V) ≅ H^1(L, V) carries H^1_f to H^1_f and exp_{K, Ind V} to exp_{L, V} under D_dR,K(Ind V) = D_dR,L(V).

**Hypotheses.** K ⊆ L finite over Q_p; V de Rham.

**Prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/dual-exponential`, `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`, `PadicHodgeTheory:R06.2/de-rham-base-change`, `PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars`

**Proof or construction.**

1. (a) Naturality of connecting maps for the restriction of the tensored fundamental sequence; D_dR descends along finite extensions (PadicHodgeTheory:R06.2/de-rham-base-change).
2. (b) Corestriction on H^0 of B_dR ⊗ V is the trace; Berger states the corresponding commutative diagrams (proofs of his Theorems II.2 and II.6).
3. (c) Fontaine–Ouyang Lemma 9.5 and L0/hodge-tate-and-twist-conventions.
4. (d) Shapiro's lemma (Rubin Appendix B, Corollary 5.2) and D_dR of induced representations (PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars); B_* ⊗ Ind V = Ind(B_* ⊗ V) gives the compatibility of H^1_f and exp.

**Acceptance.** For L/K unramified of degree f and V = Q_p(2): cor ∘ exp_L = exp_K ∘ Tr, so log_BK on H^1(K, Q_p(2)) of a corestricted class is the trace. Twisting is not a finite-level map: H^1(Q_p, Q_p) and H^1(Q_p, Q_p(1)) have different dimensions over the same field.

**Sources.** [Berger2003](https://arxiv.org/abs/math/0209283v1), Proof of Theorem II.2, p. 11; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, Corollary 5.2, p. 157.

### The Bloch–Kato conditions for Tate twists

**Node** `PadicHodgeRegulators:L1/tate-twist-examples` (theorem).

Let K/Q_p be finite. (i) V = Q_p: H^1_e = 0, H^1_f = H^1_g = H^1_ur (dimension 1). (ii) V = Q_p(1): H^1_e = H^1_f = κ((O_K^×)^∧ ⊗ Q_p) of dimension [K : Q_p], H^1_g = H^1 (dimension [K : Q_p] + 1); exp_BK(log_p u·e_1) = κ(u) for u ∈ O_K^× and log_BK ∘ κ = log_p. (iii) V = Q_p(r), r ≥ 2: H^1_e = H^1_f = H^1_g = H^1(K, Q_p(r)) of dimension [K : Q_p], and exp : K·e_r ≅ H^1(K, Q_p(r)). (iv) V = Q_p(r), r ≤ −1: H^1_e = H^1_f = H^1_g = 0 while dim H^1 = [K : Q_p]. Integrally: H^1_f(K, Z_p(1)) = (O_K^×)^∧ and H^1_f(K, Z_p(r)) = H^1(K, Z_p(r)) for r ≥ 2.

**Hypotheses.** K/Q_p finite.

**Prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/dimension-formulas`, `PadicHodgeRegulators:L1/local-duality-of-conditions`, `SelmerIwasawaCohomology:L0/padic-kummer-identification`, `SelmerIwasawaCohomology:L0/local-completion`

**Proof or construction.**

1. Compute D_cris and D_dR/Fil^0 of Q_p(r) (L0/hodge-tate-and-twist-conventions) and apply L1/dimension-formulas.
2. (ii) Bloch–Kato p. 358 (quoted by Huber–Kings) identify exp with the classical exponential; the Kummer identification is SelmerIwasawaCohomology:L0/padic-kummer-identification.
3. (iv) H^1_g(Q_p(r)) = H^1_e(Q_p(1 − r))^⊥ = 0 for r ≤ −1 by duality and (iii).

**Acceptance.** K = Q_5, r = 2: H^1(Q_5, Q_5(2)) ≅ Q_5 via log_BK. K = Q_p, V = Q_p(−1): H^1 ≠ 0 but H^1_g = 0 (a non-split extension 0 → Q_p(−1) → E → Q_p → 0 is never de Rham).

**Sources.** [HK2](https://arxiv.org/abs/math/0101071v2), Appendix A, p. 46; [HK2011](https://arxiv.org/abs/math/0612611v1), §1.3, p. 8.

### The Bloch–Kato logarithm of Kummer classes of abelian varieties

**Node** `PadicHodgeRegulators:L1/abelian-variety-logarithm` (comparison).

Let K/Q_p be finite and A/K an abelian variety with good reduction, V = V_pA. Then H^1_e(K, V) = H^1_f(K, V) = H^1_g(K, V) = κ(A(K) ⊗ Q_p), with κ the Kummer map; D_dR(V)/Fil^0 ≅ Lie(A) ⊗ K; and log_BK ∘ κ = log_A on A(K) ⊗ Q_p, where log_A : A(K) → Lie(A) is the logarithm of the formal group (extended to A(K) by finite index). For an isogeny or a quotient map π : A → B of abelian varieties with good reduction, log_BK is natural: log_B(π(x)) = dπ(log_A(x)). Pairing with an invariant differential ω ∈ Fil^0 D_dR(V^*(1)) = H^0(A, Ω^1) gives ⟨log_BK κ(P), ω⟩ = log_ω(P).

**Hypotheses.** A has good reduction over O_K; the sign convention of exp is that of L1/bloch-kato-exponential.

**Prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`

**Proof or construction.**

1. For the formal group Â of finite height over O_K with Tate module T, Berger states the commutative square exp_G / Kummer δ_G / exp_{K,V} with D_dR(V)/Fil^0 = tan(G(K)) (Bloch–Kato 3.10.1).
2. A(K) ⊗ Q_p = Â(m_K) ⊗ Q_p since A(K)/Â(m_K) is finite, so the square for Â gives log_BK ∘ κ = log_A.
3. H^1_e = H^1_f = H^1_g: D_cris(V)^{φ=1} = 0 = D_cris(V^*(1))^{φ=1} by the Weil bounds on Frobenius eigenvalues (purity), so the dimension formulas coincide.
4. Naturality follows from functoriality of the Kummer map and of the formal logarithm.

**Acceptance.** For an elliptic curve E/Q_p with good reduction and P ∈ E_1(Q_p) (kernel of reduction), log_BK κ(P) = log_{Ê}(P) ∈ Lie(E) ⊗ Q_p. For a quotient π : J_0(N) → E, log_{E,ω_E}(π(x)) = c_π·AJ_dR(x)(ω_f) when π^*ω_E = c_π ω_f (GeneralizedHeegnerCycles:GH.8/differential-evaluation); c_π is not assumed to be 1.

**Sources.** [Berger2003](https://arxiv.org/abs/math/0209283v1), Introduction, p. 2; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), §I.6.4, (9), p. 16.

### The integral Bloch–Kato logarithm for unramified fields

**Node** `PadicHodgeRegulators:L1/integral-logarithm-unramified` (theorem). **Planet:** Integral Bloch–Kato logarithm.

Let p be odd, L/Q_p finite unramified and 2 ≤ r ≤ p − 2. Then H^1(L, Z_p(r)) is torsion-free of rank [L : Q_p], H^1_f(L, Z_p(r)) = H^1(L, Z_p(r)), and log_BK(H^1(L, Z_p(r))) = (r − 1)!·p^r·O_L·e_r = p^r·O_L·e_r. For r = 1, log_BK(H^1_f(L, Z_p(1))/tors) = p·O_L·e_1 (the logarithm of the principal units). Equivalently, Fontaine's map ∂^r : L → H^1(L, Q_p(r)), the connecting map of L0/fundamental-exact-sequences (c), equals ±exp_BK ∘ (1 − p^{−r}σ)^{−1} and maps O_L isomorphically onto H^1(L, Z_p(r)), because (1 − p^{−r}σ)^{−1}O_L = p^r O_L. The statement is not asserted for ramified L, for r ≥ p − 1, or for p = 2.

**Hypotheses.** p odd; L unramified; 2 ≤ r ≤ p − 2 (Fontaine–Laffaille range).

**Prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/tate-twist-examples`, `PadicHodgeRegulators:L0/integral-period-interface`, `PadicHodgeRegulators:L0/fundamental-exact-sequences`, `KTheoryFiniteLocalFields:L.6/h1-of-tate-twists`, `KTheoryFiniteLocalFields:L.6/h0-of-tate-twists`

**Proof or construction.**

1. Torsion-freeness: H^1(L, Z_p(r))_tors ≅ H^0(L, Q_p/Z_p(r)), which vanishes because L is unramified and (p − 1) ∤ r (KTheoryFiniteLocalFields:L.6/h0-of-tate-twists and h1-of-tate-twists).
2. Index: Benois–Nguyen Quang Do Lemma 1.3.2 and Theorem 2.1 give (exp(O_L·e_r) : H^1(L, Z_p(r)))·w^{(p)}_{1−r}(L) = q^r·|(r − 1)!|_p^{−[L:Q_p]} for unramified L, with w^{(p)}_{1−r}(L) = 1 here.
3. Lattice: the commutative diagram of Benois–Nguyen Quang Do §2.3.2 with injective vertical maps identifies H^1(L, Z_p(r)) with (r − 1)!·exp(𝓛_{L,r}), and the explicit evaluation of their lattice 𝓛_{L,r} = Tr Ξ_{r,1}(R) gives 𝓛_{L,r} ⊇ p^r O_L with index q^{−r} (their Proposition 2.2.4), hence equality.
4. Lattice identity: 1 − p^{−r}σ = −p^{−r}σ(1 − p^rσ^{−1}) with 1 − p^rσ^{−1} invertible on O_L, so (1 − p^{−r}σ)^{−1}O_L = p^r O_L; this gives the Fontaine-normalised form.
5. r = 1: Benois–Nguyen Quang Do Lemma 1.3.2 at m = 1 with e = 1, and the Iwasawa logarithm U^1_L ≅ pO_L.

**Acceptance.** L = Q_5, r = 2: log_BK(H^1(Q_5, Z_5(2))) = 25Z_5·e_2; consistent with Li_2(ω(2)) ≡ 25 mod 125. Index check: q^r·|(r−1)!|^{−N} equals [O_L : p^r O_L] = q^r for r ≤ p − 2. For p = 3 and r = 2 the range 2 ≤ p − 2 fails and H^1(Q_3, Z_3(2)) has torsion Z/3.

**Sources.** [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), Lemme 1.3.2, p. 647; [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), Théorème 2.1, p. 648; [FontaineBPR1994](https://www.imo.universite-paris-saclay.fr/~fontaine/bpr.pdf), §2.1, p. 153.

### Semilocal Bloch–Kato maps

**Node** `PadicHodgeRegulators:L1/semilocal-bloch-kato` (construction). **Declaration:** `semilocalBlochKatoExp`.

For a finite étale Q_p-algebra A = ∏_v K_v (for instance F ⊗ Q_p = ∏_{v|p} F_v for a number field F) and a p-adic representation V of G_{Q_p} (or a family V_v of de Rham representations of the G_{K_v}), put H^1(A, V) := ⊕_v H^1(K_v, V), H^1_*(A, V) := ⊕_v H^1_*(K_v, V) for * ∈ {e, f, g}, D_dR(A, V) := ⊕_v D_dR,K_v(V), and define exp_{A,V}, log_{A,V} and exp*_{A,V} componentwise. Under Shapiro's isomorphism H^1(Q_p, Ind_{K_v}^{Q_p} V) ≅ H^1(K_v, V) these are the Bloch–Kato maps of the induced representation (L1/twist-and-change-of-field (d)). For a number field F the semilocal Kummer map E_F ⊗ Q_p → H^1_f(F ⊗ Q_p, Q_p(1)) composed with log is the unit regulator of D.1/unit-logarithm-kernel.

**Hypotheses.** A finite étale over Q_p; V de Rham at each factor.

**Prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/dual-exponential`, `PadicHodgeRegulators:L1/twist-and-change-of-field`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`

**Proof or construction.**

1. Componentwise definition; the decomposition of A into fields is canonical.
2. Compatibility with Shapiro is L1/twist-and-change-of-field (d) applied to each factor.
3. For F ⊗ Q_p use the semilocal equivalence of NumberFieldArithmetic layer 5.

**API.**

- `semilocalBlochKatoF` (data): semilocalBlochKatoF A V : Submodule ℚ_p (⨁ v, H^1(K_v, V)).
- `semilocalBlochKatoExp` (constructor): semilocalBlochKatoExp A V := ⨁ v, blochKatoExp K_v V.
- `semilocalBlochKatoLog` (constructor): The componentwise logarithm on ⨁ v, blochKatoE K_v V.
- `semilocal_shapiro` (compatibility): Under Shapiro's isomorphism, semilocalBlochKatoExp A V = blochKatoExp ℚ_p (Ind_A V).
- `semilocal_prod` (simp): For A = A' × A'', the semilocal maps are the direct sums of those of A' and A''.

**Uses.** Rubin, Euler Systems, Chapter II §2: H^1(K_p, ·) = ⊕_{v|p} H^1(K_v, ·), and similarly for H^1_f and H^1_s. SelmerIwasawaCohomology:L4/bloch-kato-condition: the local condition at every place above p of a number field. PadicHodgeRegulators:D.4/global-p-adic-regulator: the regulator to F ⊗ Q_p is the semilocal log_BK of the étale regulator. Huber–Kings 2003, Appendix A: exp_p : O_F ⊗ Q_p → H^1_f(F ⊗ Q_p, Q_p(1)) is an isomorphism.

**Unit tests.**

- `semilocal_split_quadratic` (computation): For F = Q(√2), p = 7: dim_{Q_7} semilocalBlochKatoF (F ⊗ Q_7) Q_7(1) = 2.
- `semilocal_zero_algebra` (degenerate): For A = 0 all semilocal groups are 0.
- `semilocal_field_compat` (compatibility): For A = K a field, the semilocal maps are the local maps of L1.
- `semilocal_not_product_conditions` (non-example): The semilocal H^1_f of Q_p(1) for A = Q_p × Q_p is not H^1_f(Q_p, Q_p(1) ⊕ Q_p(1)) computed with the diagonal Galois action of a single factor: the summands are indexed by the factors of A.

**Acceptance.** For F = Q(√2) and p = 7 (split), H^1_f(F ⊗ Q_7, Q_7(1)) = H^1_f(Q_7, Q_7(1))², and log of the semilocal Kummer class of 1 + √2 is (log_7(1 + √2), log_7(1 − √2)).

**Sources.** [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II §2, p. 25; [HK2](https://arxiv.org/abs/math/0101071v2), Appendix A, p. 21.

### Acceptance tests for L1

- `log_BK(κ(1 + p)) = log(1 + p)` for `K = Q_p`.
- `H¹_f(Q_p, Q_p) = H¹_ur` has dimension 1 while `H¹(Q_p, Q_p)` has dimension 2.
- `log_BK(H¹(Q_5, Z_5(2))) = 25Z_5·e_2`.
- `H¹_g(K, Q_p(−1)) = 0` although `H¹(K, Q_p(−1)) ≠ 0`.

## L2. (φ,Γ)-modules and Iwasawa cohomology: regulator-specific comparisons

The comparison engine — the étale `(φ,Γ)`-module `D(T)`, ψ, the Herr complex, the identification of the ψ-complex with the inverse-corestriction Iwasawa complex, Wach modules — is `PhiGammaModulesAndIwasawaCohomology` (PG.1, PG.3–PG.6), with the analytic coefficient rings of `PadicHodgeTheory` P7. L2 proves what the regulator needs on top of it: the explicit level-n cocycle of Fontaine's isomorphism `h_Iw : D(T)^{ψ=1} ≅ H¹_Iw(Q_p, T)` and its corestriction compatibility, independence of the generator of Γ, the dictionary for a change of the roots of unity `ε ↦ ε^a`, the local Iwasawa twist by characters of `G_∞` and the compatibility `h(y ⊗ e_η) = Tw_η h(y)`, **Berger's theorem** `D(T)^{ψ=1} ⊆ π^{a−1}N(T)` (and `N(T)^{ψ=1} = D(T)^{ψ=1}` for weights ≥ 0 without quotient `Q_p`), specialisation at characters, lattice and coefficient-change squares, and the Kummer–Coleman comparison for `Z_p(1)`. The local Iwasawa twist over `Q_p` is owned here; `SelmerIwasawaCohomology` L3 states its twist for the global tower.

**Dependencies.** `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PG.3`, `PG.4`, `PG.5`, `PG.6` (requests for PG.1, PG.4, PG.5, PG.6); `SelmerIwasawaCohomology:L3`, `L4`; `PadicHodgeTheory:P7`; `PadicMeasuresIwasawaAlgebras:L1`, `L2`; `ColemanPowerSeries:L1`, `L2`; `PadicHodgeRegulators:L1`.

### Fontaine's isomorphism h_Iw : D(T)^{ψ=1} ≅ H¹_Iw

**Node** `PadicHodgeRegulators:L2/fontaine-iwasawa-map` (construction). **Declaration:** `fontaineIwasawaEquiv`. **Planet:** Fontaine's ψ-isomorphism.

Assume H₀. Let D(T) be the étale (φ, Γ)-module of T over O_E ⊗ A_{Q_p} with the operator ψ (PhiGammaModulesAndIwasawaCohomology PG.1, PG.4). Define h_{Iw,T} : D(T)^{ψ=1} → H^1_Iw(Q_p, T) as the H^1-comparison of the ψ-complex [D(T) --(ψ − 1)--> D(T)] with the inverse-corestriction Iwasawa complex (PG.5, SelmerIwasawaCohomology L3). Then: (a) h_{Iw,T} is a Λ-linear bijection; (b) for n ≥ 1, a topological generator γ_n of Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^n})) and ℓ_n(γ_n) := log_p χ(γ_n)/p^n, pr_n(h(y)) is the class of σ ↦ ℓ_n(γ_n)((σ − 1)/(γ_n − 1)·y − (σ − 1)b), where x_n ∈ D(T)^{ψ=0} solves (γ_n − 1)x_n = (φ − 1)y and b ∈ A ⊗ T solves (φ − 1)b = x_n; (c) cor ∘ pr_{n+1} = pr_n and pr_0 = cor_{Q_p(μ_p)/Q_p} ∘ pr_1; (d) h_{Iw,V} := h ⊗ Q is independent of the lattice; (e) the Λ_E-torsion of D(V)^{ψ=1} is V^{H_{Q_p}} and maps onto the torsion of H^1_Iw(Q_p, V); H^1_Iw(Q_p, T) has no Z_p-torsion.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** `PhiGammaModulesAndIwasawaCohomology:PG.5`, `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex`, `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex-h1`, `PhiGammaModulesAndIwasawaCohomology:PG.4/psi-zero-splitting`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicMeasuresIwasawaAlgebras:L1/convolution-algebra`, `PadicHodgeRegulators:L1/bloch-kato-exponential`

**Proof or construction.**

1. The actual comparison of the ψ-complex with Iwasawa cohomology is requested from PG.5 (its packet has the abstract ψ-complex homology only).
2. The level-n cocycle is Cherbonnier–Colmez Proposition I.4.1 and Theorem II.1.3 (ii); compatibility with corestriction is Berger's Lemma I.9.
3. Torsion: Berger Proposition II.7 (V^{H_K} ⊂ D(V)^{ψ=1} is its Λ-torsion).

**API.**

- `fontaineIwasawaEquiv` (data): fontaineIwasawaEquiv T : D(T)^{ψ=1} ≃ₗ[Λ] H1Iw T.
- `fontaineIwasawaEquiv_pr` (characterisation): pr_n (fontaineIwasawaEquiv T y) is the class of the explicit cocycle of (b).
- `fontaineIwasawaEquiv_cor` (relation): cor ∘ pr_{n+1} = pr_n; pr_0 = cor ∘ pr_1.
- `fontaineIwasawaEquiv_rat` (compatibility): The rationalisation is independent of T ⊂ V.
- `fontaineIwasawaEquiv_torsion` (characterisation): Torsion of D(V)^{ψ=1} = V^{H_{Q_p}} ↦ torsion of H1Iw V.
- `H1Iw_noZpTorsion` (other): H1Iw T has no ℤ_p-torsion.

**Uses.** PadicHodgeRegulators:L3/crystalline-regulator: L_V = (Mellin^{−1} ⊗ 1)∘(1 − φ)∘h_Iw^{−1}. PadicHodgeRegulators:L3/explicit-reciprocity: the Iwasawa pairing is transported through h_Iw. PadicHodgeRegulators:L4/signed-local-condition: ker Col_j is exported to H^1_Iw through the proved h_Iw comparison. Berger, Bloch and Kato's exponential map, Theorem II.6: exp*(h^1_{F_n}(y)) = p^{−n}∂_V(φ^{−n}y).

**Unit tests.**

- `fontaineIwasawa_trivial` (computation): For V = Q_p, the class h(1) is nonzero and fixed by G_∞.
- `fontaineIwasawa_unramified_char` (degenerate): For V = E(μ) with μ unramified nontrivial, H^1_Iw(Q_p, V) is torsion-free (Q_p(μ_{p^∞}) ∩ Q_p^ur = Q_p).
- `fontaineIwasawa_cor_compat` (compatibility): cor_{Q_p(μ_{p^2})/Q_p(μ_p)} ∘ pr_2 ∘ h = pr_1 ∘ h, matching SelmerIwasawaCohomology's inverse system.
- `fontaineIwasawa_not_D_itself` (non-example): h is defined on D(T)^{ψ=1}, not on D(T)^{φ=1}: for V = Q_p(1), (1 + π)/π ⊗ e_1 lies in D^{ψ=1} but not in D^{φ=1}.

**Acceptance.** V = Q_p: h(1) is a nonzero G_∞-fixed class spanning the torsion of H^1_Iw(Q_p, Q_p). h(σ_{−1}·y) = σ_{−1}·h(y) for σ_{−1} ∈ Δ with χ(σ_{−1}) = −1.

**Sources.** CC99, Théorème II.1.3, p. 12; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Theorem II.8, p. 118.

### Independence of the generator of Γ

**Node** `PadicHodgeRegulators:L2/generator-independence` (lemma).

Assume H₀. For generators γ, γ' = γ^a (a ∈ Z_p^×) of Γ_n, u := (γ − 1)/(γ' − 1) is a unit of Λ, and the cochain map ι_{γ,γ'} := (u, u ⊕ id, id) : C_{φ,γ} → C_{φ,γ'} is an isomorphism with ℓ(γ)[c_{x,y}] = ℓ(γ')[c_{ux,y}] in H^1. Hence the level-n formula of L2/fontaine-iwasawa-map (b) does not depend on γ_n, and replacing γ by γ^a only changes the variable X = γ − 1 of Λ to (1 + X)^a − 1. For γ' = γ^m with p ∤ m, PG.3's generator map equals Q_m·ι_{γ,γ^m} on H^1.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-generator-map`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-generator-isomorphism`

**Proof or construction.**

1. Check that (u, u ⊕ id, id) commutes with the Herr differentials d0 = (φ − 1, γ − 1) (Cherbonnier–Colmez Lemme I.4.2).
2. Λ acts on H^1 of the Herr complex through augmentation, so the integer-power generator map of PG.3 differs from ι by the scalar Q_m.

**Acceptance.** γ' = γ^{−1}: u = −γ, X ↦ (1 + X)^{−1} − 1. The independence statement in Berger's Proposition I.8 is an exercise there; this node supplies it.

**Sources.** CC99, Lemme I.4.2, p. 7; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Proposition I.8, p. 110.

### Changing the compatible system of roots of unity

**Node** `PadicHodgeRegulators:L2/root-change` (comparison).

Assume H₀ and let a ∈ Z_p^×, σ_a ∈ G_∞ with χ(σ_a) = a, ε' = σ_a(ε) = ε^a. (i) The embeddings ι_ε : A_{Q_p} → Ã (π ↦ [ε] − 1) satisfy ι_{ε'} = ι_ε ∘ γ_a on A, A^+ and B^+_rig; D(T), N(T), ψ, the G_∞-action and h_{Iw,T} are unchanged. (ii) t' = a·t, e'_j = a^j e_j, ∂' = a^{−1}∂; the localisation maps ι_n are unchanged as maps (coordinates ζ' = ζ^a). (iii) For the Mellin transform M_ε(λ) = λ·(1 + π_ε): M_{ε'}(λ) = M_ε(λσ_a), so M_{ε'}^{−1} = [σ_a]^{−1}M_ε^{−1}. (iv) Twisting by e'_j is a^j times twisting by e_j. (v) Coleman power series: f^{ε'}_u(π_{ε'}) = f^ε_u(π_ε) in A^+ and Δ(f^{ε'}_u) ⊗ e'_1 = Δ(f^ε_u) ⊗ e_1.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`, `PadicHodgeTheory:P7:annulus-foundations/localisation-at-roots-of-unity`, `PadicMeasuresIwasawaAlgebras:L2/amice-dilation`, `PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence`, `ColemanPowerSeries:L2/coleman-interpolation-equivariance`

**Proof or construction.**

1. ε enters only through π = [ε] − 1, t = log[ε], e_j and the Mellin/Coleman coordinates; Cherbonnier–Colmez's cocycle and Berger's h^1 involve γ and b only, so h_Iw is ε-free.
2. Compute each coordinate change from π_{ε'} = (1 + π_ε)^a − 1.

**Acceptance.** The regulator distribution changes by [σ_a]^{−1} (Loeffler–Zerbes 2014, Remark 4.16), as L3/naturality-and-lattice records. a = −1: t' = −t and e'_1 = −e_1, so ⊗e_1 changes sign while h_Iw does not.

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Remark 4.16, p. 20.

### Twisting local Iwasawa cohomology by characters of G_∞

**Node** `PadicHodgeRegulators:L2/local-iwasawa-twist` (construction). **Declaration:** `iwasawaTwist`.

Assume H₀. For a continuous character η : G_∞ → O_E^×, choose n(k) ≥ k with η ≡ 1 mod p^k on Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^{n(k)}})); using H^1_Iw(Q_p, T) = lim_k H^1(Q_p(μ_{p^{n(k)}}), T/p^k) define Tw_η := lim_k (x ↦ x ∪ ē_η) with ē_η ∈ H^0(Q_p(μ_{p^{n(k)}}), (O_E/p^k)(η)). Then Tw_η : H^1_Iw(Q_p, T) → H^1_Iw(Q_p, T(η)) is a well-defined O_E-linear bijection, independent of the choices, with Tw_1 = id, Tw_η ∘ Tw_η' = Tw_{ηη'}, and Tw_η(λx) = Tw_η(λ)Tw_η(x) where Tw_η(σ) = η(σ)^{−1}σ on Λ (SelmerIwasawaCohomology's convention Tw_k for η = χ^k). For ω of finite order trivial on G_{Q_p(μ_{p^n})}: pr_n(Tw_ω x) = pr_n(x) ⊗ e_ω.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `SelmerIwasawaCohomology:L3/iwasawa-twist`, `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom`

**Proof or construction.**

1. At finite level the cup product with ē_η is an isomorphism H^1(Q_p(μ_{p^{n(k)}}), T/p^k) ≅ H^1(·, T(η)/p^k), compatible with corestriction because ē_η is restricted from lower levels modulo p^k.
2. Pass to the limit; for η = χ^j compare with Cherbonnier–Colmez Proposition II.1.2 and with the Shapiro twist of SelmerIwasawaCohomology:L3/iwasawa-shapiro.
3. SelmerIwasawaCohomology:L3/iwasawa-twist is stated for the global Q-tower; the local Q_p version is owned here.

**API.**

- `iwasawaTwist` (data): iwasawaTwist η : H1Iw T ≃+ H1Iw (T(η)).
- `iwasawaTwist_smul` (relation): iwasawaTwist η (λ • x) = Tw_η(λ) • iwasawaTwist η x.
- `iwasawaTwist_one` (simp): iwasawaTwist 1 = id.
- `iwasawaTwist_mul` (relation): iwasawaTwist η ∘ iwasawaTwist η' = iwasawaTwist (η * η').
- `iwasawaTwist_pr_finite` (characterisation): For ω of finite order trivial on level n, pr_n ∘ iwasawaTwist ω = (· ⊗ e_ω) ∘ pr_n.
- `iwasawaTwist_eq_shapiro` (compatibility): For η = χ^j, iwasawaTwist agrees with the Shapiro-lemma twist of SelmerIwasawaCohomology.

**Uses.** PadicHodgeRegulators:L3/meromorphic-twist-extension: L_V(z) = (ℓ_{−1}…ℓ_{−m})^{−1} Tw_{χ^m}(L_{V(m)}(z ⊗ e_m)) ⊗ t^m e_{−m}. PadicHodgeRegulators:L3/ramified-interpolation: z_{η,0} is the specialisation of the twisted class. PadicHodgeRegulators:L4/derham-interpolation-growth: twists by finite-order characters of conductor p^n.

**Unit tests.**

- `iwasawaTwist_inverse` (computation): iwasawaTwist η⁻¹ (iwasawaTwist η x) = x.
- `iwasawaTwist_trivial` (degenerate): iwasawaTwist 1 x = x.
- `iwasawaTwist_level_cyclotomic` (compatibility): For η = χ^j and n ≥ 1, pr_n(Tw_{χ^j}x) ≡ pr_n(x) ∪ ε_n^{⊗j} modulo p^n.
- `iwasawaTwist_not_linear` (non-example): iwasawaTwist χ is not Λ-linear: iwasawaTwist χ (σ • x) = χ(σ)^{−1} σ • iwasawaTwist χ x ≠ σ • iwasawaTwist χ x for χ(σ) ≠ 1.

**Acceptance.** Tw_η ∘ Tw_{η^{−1}} = id. Tw_{χ^j}(σ_{−1}x) = (−1)^j σ_{−1}Tw_{χ^j}(x).

**Sources.** CC99, Proposition II.1.2, p. 12; [LZ2014](https://arxiv.org/pdf/1108.5954v3), Lemma 2.4, p. 7.

### Compatibility of h_Iw with twists

**Node** `PadicHodgeRegulators:L2/twist-compatibility` (comparison).

Assume H₀. (i) D(T(η)) = D(T) ⊗ e_η with φ, ψ acting on the first factor and g(x ⊗ e_η) = η(g)g(x) ⊗ e_η, so ⊗e_η : D(T)^{ψ=1} → D(T(η))^{ψ=1} is Tw_η-semilinear. (ii) h_{Iw,T(η)}(y ⊗ e_η) = Tw_η(h_{Iw,T}(y)). (iii) For η = χ^j the level-n cocycle of h(y ⊗ e_j) is σ ↦ ℓ(γ_n)((σ − 1)/(γ_n − 1)·y(j) − (σ − 1)b) with y(j) the image of y in D(V(j))^{ψ=1} (Cherbonnier–Colmez, proof of Theorem IV.2.1). (iv) For crystalline V, N(T(j)) = π^{−j}N(T) ⊗ e_j.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/local-iwasawa-twist`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.6`, `PadicHodgeTheory:P7/robba-realisation-comparison`

**Proof or construction.**

1. (i) is the tensor compatibility of the Fontaine equivalence (request to PG.1).
2. (ii) compare the level-k cocycles of L2/fontaine-iwasawa-map (b) with the cup product defining Tw_η; for η of finite order use Loeffler–Zerbes 2014 Lemma 2.4, in general reduce modulo p^k.
3. (iv) Berger's observation N(T(−1)) = πN(T) ⊗ e_{−1}, iterated (Wach modules from PG.6).

**Acceptance.** η = χ: h(y ⊗ e_1) = Tw_χ h(y). For V = Q_p, N(Z_p(1)) = π^{−1}N(Z_p) ⊗ e_1 = π^{−1}A^+ ⊗ e_1.

**Sources.** CC99, Proof of Théorème IV.2.1, p. 21; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Appendix A, p. 124.

### Berger: ψ-fixed vectors lie in the Wach module

**Node** `PadicHodgeRegulators:L2/wach-psi-fixed-vectors` (theorem). **Planet:** Berger's ψ-invariants theorem.

Assume H₀ and let V be E-linear crystalline with Hodge–Tate weights in [a; b], T ⊂ V a G-stable O_E-lattice and N(T) its Wach module (PG.6). (i) D(T)^{ψ=1} ⊂ π^{a−1}N(T). (ii) If V has no quotient isomorphic to E(a), then D(T)^{ψ=1} ⊂ π^a N(T). (iii) In particular, if a ≥ 0 and V has no quotient isomorphic to E (equivalently, as a Q_p-representation, no quotient Q_p), then ψ(N(T)) ⊂ N(T), N(T)^{ψ=1} = D(T)^{ψ=1}, N(V)^{ψ=1} = D(V)^{ψ=1}, and h_Iw restricts to Λ-isomorphisms N(T)^{ψ=1} ≅ H^1_Iw(Q_p, T) and N(V)^{ψ=1} ≅ H^1_Iw(Q_p, V).

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T). V crystalline with weights in [a; b]; for (iii) a ≥ 0 and no quotient E.

**Prerequisites.** `PhiGammaModulesAndIwasawaCohomology:PG.6`, `PhiGammaModulesAndIwasawaCohomology:PG.4`, `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/twist-compatibility`, `PadicHodgeTheory:P7/wach-dcris-comparison`, `PadicHodgeTheory:R06.1/fundamental-exact-sequence`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`

**Proof or construction.**

1. Twist to weights in [0; b − a] (L2/twist-compatibility (iv)).
2. Berger Lemmas A.4–A.7: ψ(π^{−m}) = π^{−m}(p^{m−1} + πQ_m(π)) and D(T)^{ψ=1} ⊂ π^{−1}N(T) for weights ≥ 0 (where N(T) ⊂ φ^*N(T) gives ψ(N(T)) ⊂ N(T)).
3. If an element of D(T)^{ψ=1} had a pole of order one, its leading coefficient would give a nonzero vector of D_cris(V)^{φ=1} = (N(V)/πN(V))^{φ=1}; for weights ≥ 0 such a vector forces a quotient Q_p (an eigenvalue 1 in D_cris(V^*) with Fil^0 = everything gives (V^*)^{G} ≠ 0 by the fundamental exact sequence) — this is the step Berger states without proof.
4. Combine with L2/fontaine-iwasawa-map.

**Acceptance.** V = E(1) (a = 1): (1 + π)/π ⊗ e_1 ∈ D(V)^{ψ=1} ∩ N(V). V = E (a = 0, quotient E): 1/π ∈ D(E)^{ψ=1} ∖ A^+, so the hypothesis of (ii) and the exponent a − 1 in (i) are sharp.

**Sources.** [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Theorem A.3, p. 124; [LLZWach](https://arxiv.org/abs/0912.1263v3), §1, p. 4.

### Specialisation of Iwasawa classes at characters

**Node** `PadicHodgeRegulators:L2/character-specialisation` (construction). **Declaration:** `charSpecialization`.

Assume H₀. For x ∈ H^1_Iw(Q_p, T) and a continuous character η of G_∞, put x_η := Tw_{η^{−1}}(x) ∈ H^1_Iw(Q_p, T(η^{−1})) and x_{η,n} := pr_n(x_η) ∈ H^1(Q_p(μ_{p^n}), T(η^{−1})). (a) (λx)_{η,0} = η(λ)x_{η,0} for λ ∈ Λ. (b) If x = h_Iw(y) and η = χ^jω with ω of conductor p^m, then for n ≥ max(m, 1): x_{η,n} = pr_n(h_{Iw,T(η^{−1})}(y ⊗ e_{−j} ⊗ e_{ω^{−1}})) and x_{η,0} = cor_{Q_p(μ_{p^n})/Q_p}(x_{η,n}), independent of n. (c) With T' = T(η^{−1}): 0 → (H^1_Iw(T')_{Γ_1})^Δ → H^1(Q_p, T') → (H^2_Iw(T')^{Γ_1})^Δ → 0.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/local-iwasawa-twist`, `PadicHodgeRegulators:L2/twist-compatibility`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom`

**Proof or construction.**

1. (a) from L2/local-iwasawa-twist's semilinearity and the projection to level 0.
2. (b) from L2/twist-compatibility (ii) and the corestriction compatibility of L2/fontaine-iwasawa-map (c).
3. (c) is SelmerIwasawaCohomology:L3/iwasawa-descent for Γ_1 ≅ Z_p followed by Δ-invariants (|Δ| = p − 1 prime to p).

**API.**

- `charSpecialization` (data): charSpecialization η : H1Iw T →ₗ[O_E] H^1(ℚ_p, T(η⁻¹)).
- `charSpecialization_smul` (relation): charSpecialization η (λ • x) = η(λ) • charSpecialization η x.
- `charSpecialization_fontaine` (characterisation): charSpecialization η (h y) = cor (pr_n (h (y ⊗ e_{−j} ⊗ e_{ω⁻¹}))) for n ≥ max(m,1).
- `charSpecialization_descent` (relation): The descent exact sequence (c).

**Uses.** PadicHodgeRegulators:L3/ramified-interpolation: z_{η,0} in the interpolation formula at η = χ^jω. PadicHodgeRegulators:L3/unramified-interpolation: z_{χ^j,0} at unramified characters. PadicHodgeRegulators:L4/derham-regulator: specialisation of Iwasawa classes for de Rham modules.

**Unit tests.**

- `charSpecialization_trivial` (computation): charSpecialization 1 = pr_0.
- `charSpecialization_zero` (degenerate): charSpecialization η 0 = 0.
- `charSpecialization_level_independence` (compatibility): For ω of conductor p, the formula of (b) gives the same class for n = 1 and n = 2.
- `charSpecialization_not_equivariant` (non-example): charSpecialization χ is not Λ-linear into a Λ-module: σ_{−1} acts on the target through χ(σ_{−1}) = −1.

**Acceptance.** x_{1,0} = pr_0 x. (σ_{−1}x)_{χ,0} = −x_{χ,0}.

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Definition 4.14, p. 20; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), §II, p. 118.

### Lattice and coefficient-change squares

**Node** `PadicHodgeRegulators:L2/lattice-and-coefficient-squares` (comparison).

Assume H₀. (a) For lattices U ⊂ T ⊂ V: D(U) ⊂ D(T) ⊂ D(V) compatibly with φ, ψ, G_∞ and h_Iw; H^1_Iw(Q_p, T) → H^1_Iw(Q_p, V) is injective with image h(D(V)^{ψ=1} ∩ D(T)); N(U) = N(V) ∩ D(U), and U ↦ N(U) is an inclusion-preserving bijection between G-stable lattices and Wach lattices in N(V); under L2/wach-psi-fixed-vectors (iii), H^1_Iw(Q_p, T) = h(N(T)^{ψ=1}). (b) For E'/E finite, D, N, ψ, H^1_Iw, h, Λ and the Mellin transform commute with O_{E'} ⊗_{O_E} −; restriction of scalars to Z_p changes none of D, ψ, h.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.5`, `PhiGammaModulesAndIwasawaCohomology:PG.6`, `PadicHodgeTheory:P7/integral-dcris-lattice`, `PadicHodgeTheory:P7:annulus-foundations/coefficient-extension`, `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice`

**Proof or construction.**

1. (a) N(T) = N(V) ∩ D(T) and the lattice bijection are Berger, Limites, Lemma II.1.3 and Proposition III.4.2 (requested from PG.6); injectivity on H^1_Iw holds because H^1_Iw(T) has no Z_p-torsion.
2. (b) Each construction is O_E-linear and commutes with finite flat base change; Lei–Loeffler–Zerbes §2.2–2.3 record the E-linear forms.

**Acceptance.** For T = Z_p(1) ⊂ V: H^1_Iw(Q_p, Z_p(1)) = h(N(Z_p(1))^{ψ=1}). Changing T to pT multiplies h(D(T)^{ψ=1}) by p.

**Sources.** [LLZWach](https://arxiv.org/abs/0912.1263v3), §2.2, p. 8; [Limites2004](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf), Proposition III.4.2, p. 21.

### Kummer classes and Coleman power series

**Node** `PadicHodgeRegulators:L2/kummer-coleman-comparison` (comparison).

Assume H₀ with T = Z_p(1). For a norm-compatible system u ∈ U_∞ of principal units of the tower Q_p(μ_{p^n}) with Coleman power series f_u (f_u(ε^{(n)} − 1) = u_n), Δ(f_u) := (1 + π)f_u'/f_u lies in A^{ψ=1}, and h_{Iw,Z_p(1)}(Δ(f_u) ⊗ e_1) = s·κ(u), where κ : U_∞ → H^1_Iw(Q_p, Z_p(1)) is the Kummer map of SelmerIwasawaCohomology (cocycle τ ↦ τ(α)/α) and s ∈ {±1} is the sign computed here from Cherbonnier–Colmez's Proposition V.3.2 iii) and the cocycle of L2/fontaine-iwasawa-map (b). Hence Δ(f_u) ⊗ e_1 ∈ N(Z_p(1))^{ψ=1}, and by L2/root-change (v) the element is independent of ε.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T). T = Z_p(1).

**Prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/root-change`, `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`, `ColemanPowerSeries:L1/coleman-equivalence`, `ColemanPowerSeries:L2/logarithmic-derivative`, `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map`, `SelmerIwasawaCohomology:L4/local-units-iwasawa-cohomology`, `SelmerIwasawaCohomology:L0/kummer-limit-map`

**Proof or construction.**

1. ψ(Δ f_u) = Δ f_u (ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map).
2. Cherbonnier–Colmez V.3.2 iii) identify Exp*(δ(u)) with ι̂(u)^{−1}∇ι̂(u); compare their δ with the Kummer cocycle τ ↦ τ(α)/α: with τ[u_n] = [ε]^{c(τ)}[u_n], (1 − τ)(log[u_n]·t^{−1} ⊗ e_1) = −c(τ)e_1, which fixes s.
3. Membership in N(Z_p(1)) follows from L2/wach-psi-fixed-vectors (iii) applied to Z_p(1) (weights ≥ 0, no quotient Q_p).

**Acceptance.** The sign s is the input of L3/tate-coleman-comparison (Col = −Col_0 there). For a = 1 + p and the norm-compatible principal units u_n = (ζ_{p^n}^a − 1)/(ζ_{p^n} − 1), f_u(π) = ((1 + π)^a − 1)/π and Δ(f_u) = a(1 + π)^a/((1 + π)^a − 1) − (1 + π)/π is explicit.

**Sources.** CC99, Proposition V.3.2 iii), p. 27; CC99, §V.3, p. 27.

### Acceptance tests for L2

- `(1 + π)/π ⊗ e_1 ∈ D(Q_p(1))^{ψ=1} ∩ N(Q_p(1))`, while `1/π ∈ D(Q_p)^{ψ=1} ∖ A⁺` (Berger's exponent is sharp).
- The regulator distribution changes by `[σ_a]^{−1}` under `ε ↦ ε^a`.

## D.1. p-adic analytic functions with normalisations

The functions are `ColemanIntegration`'s: the branches `log_a`, the Iwasawa logarithm, Coleman's `Li_k`, Coleman's `D^a(z) = Li^a_2(z) + ½ log_a(z) log_a(1 − z)`, the five-term relation, and the values at roots of unity. D.1 fixes how the regulator uses them. Teichmüller representatives are Tau Ceti's `TauCeti.teichmuller`; the Teichmüller decomposition `O_L^× = μ_{q−1} × U¹_L` and `φ(ζ) = ζ^p` on unramified fields are the existing objects, not new ones. The **étale dilogarithm** `D_A` of a finite étale `Q_p`-algebra applies the Iwasawa-branch `D` factor by factor; the **combined dilogarithm** `D_{K,p} : B(K) → K ⊗ Q_p` of a number field is GSWZ's `D_p` on Bloch elements, branch independent on `B(K)`. D.1 proves the extension-of-scalars, automorphism, Frobenius and trace squares, the normalisation dictionary (`D_p = L_mod,2 = L^mod_2 = Coleman's D`; Besser's factor `±(n − 1)! = ±1`; Gros's `(1 − Frob/p²)`; the Bloch–Kato sign), the kernel of `log_p` on local units with the embedding-wise unit regulator matrix, and `log_p ∘ N = Tr ∘ log_p`. A branch is never left implicit: on the pre-Bloch group the map depends on it.

**Dependencies.** `ColemanIntegration:L0`, `L2`, `L3`; `K3BlochGroups:V.3`; Tau Ceti `TauCeti.teichmuller`; NumberFieldArithmetic layer 5.

### Teichmüller decomposition of the units of a local field

**Node** `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition` (lemma).

Let L be a nonarchimedean local field with valuation ring O_L, maximal ideal m_L and residue field F_q, q = p^f. Write ω = TauCeti.teichmuller L : F_q^× → O_L^× for the Teichmüller lift and U^1_L = 1 + m_L for the principal units. Then every u ∈ O_L^× factors uniquely as u = ω(ū)·⟨u⟩ with ū the residue of u and ⟨u⟩ := u·ω(ū)^{-1} ∈ U^1_L, so that O_L^× = μ_{q-1}(O_L) × U^1_L is an internal direct product; u ↦ ⟨u⟩ is a continuous group homomorphism onto U^1_L. The decomposition is natural for continuous field embeddings L → L' of local fields and for automorphisms of L, and for every branch log_a of the p-adic logarithm (ColemanIntegration:L0/log-branch) one has log_a(u) = log(⟨u⟩), the series logarithm of the principal-unit part, because log_a vanishes on roots of unity.

**Hypotheses.** L is a nonarchimedean local field of residue characteristic p (Mathlib's IsNonarchimedeanLocalField with Tau Ceti's valuative structure). For the logarithm clause, L is identified with a subfield of C_p by a continuous embedding.

**Prerequisites.** `tauceti:TauCeti.teichmuller`, `tauceti:TauCeti.range_teichmuller`, `tauceti:TauCeti.residue_teichmuller`, `tauceti:TauCeti.eq_teichmuller`, `ColemanIntegration:L0/log-branch`

**Proof or construction.**

1. The residue map O_L^× → F_q^× is a surjective homomorphism with kernel U^1_L; TauCeti.residue_teichmuller says ω is a section, so u·ω(ū)^{-1} has residue 1 and lies in U^1_L.
2. Uniqueness: if ζ·v = ζ'·v' with ζ, ζ' ∈ μ_{q-1} and v, v' ∈ U^1_L, then ζ'^{-1}ζ ∈ μ_{q-1} ∩ U^1_L = {1}, since a (q−1)-torsion principal unit reduces to 1 and TauCeti.eq_teichmuller forces it to be ω(1) = 1. TauCeti.range_teichmuller identifies the first factor with μ_{q-1}(O_L).
3. Naturality: a continuous embedding L → L' maps O_L into O_{L'}, induces F_q → F_{q'} on residues, and sends (q−1)-torsion units to (q'−1)-torsion units; TauCeti.eq_teichmuller in L' identifies the image of ω_L(α) with ω_{L'}(ᾱ).
4. Logarithm: log_a is a homomorphism vanishing at roots of unity (ColemanIntegration:L0/log-branch), so log_a(u) = log_a(ω(ū)) + log_a(⟨u⟩) = log(⟨u⟩), and on U^1_L the branch agrees with the series.

**Acceptance.** For L = Q_5 and u = 7: ū = 2, ω(2) is the unique 4th root of unity ≡ 2 mod 5, and ⟨7⟩ = 7·ω(2)^{-1} ≡ 1 mod 5. μ_{q-1}(O_L) ∩ U^1_L = {1}: a decomposition with a nontrivial root of unity in the principal-unit factor is rejected. For p = 2 and L = Q_2 the first factor is trivial (q − 1 = 1) and −1 lies in U^1_{Q_2}: the factor of order prime to p does not contain the 2-power roots of unity.

**Sources.** [TauCetiTeichmuller](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), TauCeti/NumberTheory/LocalField/Teichmuller.lean, module docstring (pinned commit f790474); [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38.

### Frobenius on the roots of unity of an unramified field

**Node** `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots` (lemma).

Let L be a finite unramified extension of Q_p with residue field F_q and let φ_L be its arithmetic Frobenius, the unique field automorphism of L over Q_p whose reduction is x ↦ x^p on F_q (an arithmetic Frobenius in the sense of IsArithFrobAt for the extension O_L/Z_p). Then φ_L(ω(α)) = ω(α^p) for every α ∈ F_q^×, hence φ_L(ζ) = ζ^p for every ζ ∈ μ_{q-1}(L); for p odd μ(L) = μ_{q-1}(L), so φ_L(ζ) = ζ^p for every root of unity of L. For a finite product L = ∏_i L_i of such fields put φ_L := ∏_i φ_{L_i}; then φ_L(ζ) = ζ^p componentwise. This is the rank-one relation φ_p ζ = ζ^p of GSWZ (176).

**Hypotheses.** L/Q_p finite unramified (ramification index one); p any prime for the first two assertions, p odd for μ(L) = μ_{q−1}(L).

**Prerequisites.** `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`, `tauceti:TauCeti.eq_teichmuller`, `mathlib:IsArithFrobAt`

**Proof or construction.**

1. φ_L(ω(α)) is a (q−1)-torsion unit reducing to α^p, so it equals ω(α^p) by TauCeti.eq_teichmuller; and ω(α)^p is also (q−1)-torsion with residue α^p.
2. For p odd an unramified L contains no nontrivial p-power root of unity (Q_p(ζ_p)/Q_p is totally ramified of degree p − 1 > 1), so μ(L) = μ_{q−1}(L).
3. On a finite product, Frobenius and the Teichmüller lift are taken componentwise.

**Acceptance.** L = Q_{25} (p = 5): φ_L has order 2 and fixes exactly μ_4 ⊂ μ_{24}. For p = 2 and L = Q_2, −1 ∈ μ(L) is not of order prime to 2; the identity φ(ζ) = ζ^2 fails for ζ = −1, so the odd-p hypothesis is needed for the full μ(L).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38; [TauCetiTeichmuller](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), TauCeti/NumberTheory/LocalField/Teichmuller.lean, eq_teichmuller.

### Coleman's p-adic dilogarithm on a finite étale Q_p-algebra

**Node** `PadicHodgeRegulators:D.1/etale-algebra-dilogarithm` (construction). **Declaration:** `etaleDilog`. **Planet:** p-adic dilogarithm D_p on étale algebras.

Let A be a finite étale Q_p-algebra, with its canonical decomposition A = ∏_{i∈I} A_i into finite field extensions A_i/Q_p (the primitive idempotents). Put A^adm := {z ∈ A : z_i ∉ {0, 1} for every i}. For a finite extension M/Q_p and x ∈ M ∖ {0, 1} define D_M(x) := ι^{-1}(D^0(ι(x))) for any Q_p-embedding ι : M → C_p, where D^0(z) = Li_2(z) + ½·log_p(z)·log_p(1 − z) is Coleman's dilogarithm for the Iwasawa branch log_p(p) = 0 (ColemanIntegration:L2/dilogarithm-identities with a = 0); it lies in M and does not depend on ι. Define D_A : A^adm → A by D_A(z) := (D_{A_i}(z_i))_{i∈I}, and extend it additively to D_A : Z[A^adm] → A on the free abelian group of formal symbols [z]. This is GSWZ's D_p of (174) applied factor by factor.

**Hypotheses.** A is a finite étale (equivalently finite reduced) commutative Q_p-algebra; p is any prime. The branch of the logarithm is the Iwasawa branch log_p(p) = 0 (ColemanIntegration:L0/iwasawa-logarithm).

**Prerequisites.** `ColemanIntegration:L2/dilogarithm-identities`, `ColemanIntegration:L0/iwasawa-logarithm`, `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L2/values-in-finite-extensions`, `mathlib:PadicComplex`, `mathlib:FreeAbelianGroup`

**Proof or construction.**

1. Values in M: D^0 maps M ∖ {0,1} into M for every finite M ⊂ C_p (ColemanIntegration:L2/values-in-finite-extensions with a = 0).
2. Independence of ι: two embeddings differ by a continuous automorphism σ of C_p over Q_p, and σ(D^0(z)) = D^0(σ z) because the Iwasawa branch is Galois equivariant (ColemanIntegration:L2/galois-equivariance and L2/dilogarithm-identities (f)).
3. The decomposition of A into fields is canonical, so D_A is well defined; additivity defines it on the free abelian group.

**API.**

- `etaleDilog` (data): etaleDilog A : A → A, defined by the componentwise formula on A^adm and extended by 0 off A^adm (the extension by zero carries no content and every lemma assumes admissibility).
- `etaleAdmissible` (other): etaleAdmissible z : every component of z differs from 0 and 1 (the domain A^adm).
- `etaleDilog_apply_pi` (simp): For A = ∏_i A_i and admissible z, (etaleDilog A z)_i = etaleDilog A_i z_i.
- `etaleDilog_field` (compatibility): For a finite field extension M ⊂ C_p of Q_p and x ∈ M ∖ {0,1}, etaleDilog M x = D^0(x), Coleman's D for the Iwasawa branch.
- `etaleDilog_map` (functoriality): For a Q_p-algebra homomorphism f : A → B of finite étale algebras with f(A^adm) ⊆ B^adm, etaleDilog B (f z) = f (etaleDilog A z).
- `etaleDilog_one_sub` (relation): etaleDilog A (1 − z) = −etaleDilog A z for admissible z.
- `etaleDilog_inv` (relation): etaleDilog A z⁻¹ = −etaleDilog A z for admissible z.
- `etaleDilog_fiveTerm` (relation): For x, y ∈ A^adm with x − y a unit, D(x) − D(y) + D(y/x) − D((1 − x⁻¹)/(1 − y⁻¹)) + D((1 − x)/(1 − y)) = 0 componentwise (ColemanIntegration:L2/five-term-relation).
- `etaleDilog_rootOfUnity` (simp): For ζ ∈ A with ζ^m = 1 and all components ≠ 1, etaleDilog A ζ = (Li_2(ζ_i))_i, since log_p vanishes on roots of unity.
- `etaleDilogHom` (constructor): The additive extension FreeAbelianGroup A^adm →+ A, [z] ↦ etaleDilog A z.

**Uses.** GSWZ §3.1, paragraph after (174): the functions D_σ for the embeddings σ : K → C_p are combined into one map with values in K_p, factor by factor. PadicHodgeRegulators:D.3/local-regulator: the regulator on completed K_3 of an unramified algebra is compared with D_A on symbols of special units and of roots of unity. HabiroNumberFields:HB.7/pochhammer-sections: the factor exp(−Li_2(ζ)/(m² log q)) of the explicit sections is D_A(ζ) for roots of unity. HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm: the potential specialises to φ_p(D_p(ξ))/p − p·D_p(ξ) with D_p evaluated componentwise.

**Unit tests.**

- `etaleDilog_neg_one` (computation): For p odd, etaleDilog Q_p (−1) = 0: the inversion relation gives D(−1) = −D(−1).
- `etaleDilog_teichmuller_two_mod` (computation): For p = 5 and ω = TauCeti.teichmuller Q_5 2 (a primitive 4th root of unity), etaleDilog Q_5 ω ∈ 25·Z_5 and etaleDilog Q_5 ω ≡ 25 mod 125 (by D.3/finite-polylogarithm-reduction, since li_{2,5}(2) = 1 in F_5); this is the Q_5-component of D_5(ζ_24) in GSWZ (273).
- `etaleDilog_zero_algebra` (degenerate): For the zero algebra A = 0 (empty product), A^adm = {0} and etaleDilog A 0 = 0.
- `etaleDilog_diag` (compatibility): For the diagonal Q_p → Q_p × Q_p and x ∉ {0,1}, etaleDilog (Q_p × Q_p) (x, x) = (D^0(x), D^0(x)), agreeing with ColemanIntegration's D^0.
- `etaleDilog_not_branch_one` (non-example): With the branch log_1 (log_1(p) = 1) instead of the Iwasawa branch, D^1(p) − D^0(p) = ½·log_p(1 − p) ≠ 0 (ColemanIntegration:L2/dilogarithm-identities (d)); a definition with an unpinned branch is wrong at z = p ∈ Q_p^adm.

**Acceptance.** For A = Q_p × Q_p and z = (x, y), D_A(z) = (D(x), D(y)). D_A is defined at z = (−1, 2) ∈ Q_5 × Q_5 but not at (1, 2): admissibility is componentwise.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (174), p. 37; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph after (174), p. 38; [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, after Remark 1.5 (Galois equivariance), p. 3.

### Frobenius and extension-of-scalars squares for the p-adic dilogarithm

**Node** `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension` (lemma).

Let A → B be an injective homomorphism of finite étale Q_p-algebras (for instance K ⊗ Q_p → K' ⊗ Q_p for an extension of number fields K ⊂ K', or the inclusion of a factor-wise extension of local fields). (a) Extension of scalars: for z ∈ A^adm, D_B(ι z) = ι(D_A(z)). (b) Automorphisms: for every Q_p-algebra automorphism τ of A, D_A(τ z) = τ(D_A(z)); in particular, for a finite unramified product A with Frobenius φ_A (D.1/unramified-frobenius-on-roots), D_A(φ_A z) = φ_A(D_A(z)) and D_A(ζ^p) = φ_A(D_A(ζ)) for every root of unity ζ of order prime to p with all components ≠ 1. (c) Trace: if B is free over A, then Tr_{B/A}(D_B(ι z)) = [B : A]·D_A(z) for z ∈ A^adm. (d) Frobenius-modified value: for A unramified and ζ ∈ μ(A) of order prime to p with all components ≠ 1, (1 − p^{-2}φ_A)(D_A(ζ)) = ℓ_2(ζ), the integral modified dilogarithm of ColemanIntegration:L2/integral-modified-polylogarithm, which lies in O_A. (e) Frobenius behaviour on residue discs of special units: for p odd, A unramified and z ∈ O_A with z and 1 − z units in every factor, D_A(z) − p^{−2}D_A(z^p) = Li^{(p)}_2(z) − ½·log_p(z)·Li^{(p)}_1(z) componentwise, and this lies in O_A (Li^{(p)}_k = ℓ_k is bounded by 1 off the residue disc of 1, and log_p(z) ∈ pO_A).

**Hypotheses.** A, B finite étale Q_p-algebras; the Iwasawa branch throughout. In (b) for Frobenius and in (d), A is a finite product of finite unramified extensions of Q_p.

**Prerequisites.** `PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`, `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`, `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `ColemanIntegration:L2/integral-modified-polylogarithm`, `ColemanIntegration:L2/frobenius-relation`, `PadicHodgeRegulators:D.1/unit-logarithm-kernel`, `mathlib:Algebra.trace`

**Proof or construction.**

1. (a) and (b) are etaleDilog_map applied to the injection and to τ; the decomposition of A and B into fields is respected by algebra maps, and on each factor the claim is Galois equivariance of D^0 for the Iwasawa branch.
2. For Frobenius, φ_A(ζ) = ζ^p (D.1/unramified-frobenius-on-roots), so D_A(ζ^p) = D_A(φ_A ζ) = φ_A D_A(ζ).
3. (c) Tr_{B/A}∘ι is multiplication by the rank on ι(A).
4. (d) D(ζ) = Li_2(ζ) since log_p ζ = 0; ColemanIntegration:L2/values-at-tame-roots-of-unity (a) with k = 2 gives Li_2(ζ) − p^{-2}Li_2(ζ^p) = ℓ_2(ζ), and Li_2(ζ^p) = φ_A(Li_2(ζ)) by (b).
5. (e) is ColemanIntegration:L2/dilogarithm-identities (e) on each factor, with ColemanIntegration:L2/frobenius-relation identifying Li^{(p)}_k with the integral function ℓ_k on P¹ ∖ D⁻(1,1) and D.1/unit-logarithm-kernel giving log_p(z) ∈ pO_A.

**Acceptance.** For A = Q_{25}, p = 5, ζ = ζ_24: D(ζ_24^5) = φ(D(ζ_24)), checked on the expansions of GSWZ (273) as a 5-adic identity in Z_{25}. (1 − p^{-2}φ)D(ζ) is a unit multiple of ℓ_2(ζ) ∈ O_A, while D(ζ) ∈ p²O_A: the two normalisations differ by a factor of p² in the lattice they generate.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6.

### The combined p-adic dilogarithm of a number field

**Node** `PadicHodgeRegulators:D.1/combined-dilogarithm` (construction). **Declaration:** `blochDilog`. **Planet:** Combined p-adic dilogarithm D_p.

Let K be a number field, p a prime and K_p := K ⊗_Q Q_p, a finite étale Q_p-algebra identified with ∏_{v|p} K_v by Tau Ceti's semilocal equivalence (NumberFieldArithmetic layer 5). Define D_{K,p} on the free abelian group Z[K^×] by [z] ↦ D_{K_p}(z ⊗ 1) for z ≠ 1 (D.1/etale-algebra-dilogarithm; z ⊗ 1 is admissible) and [1] ↦ 0. Its v-component is D_σ([z]) = D^0(σ_v(z)) for the embedding σ_v : K → K_v ⊂ C_p, as in GSWZ §3.1. D_{K,p} kills the five-term relations, hence factors through the pre-Bloch group P(K) of K3BlochGroups:V.3/pre-bloch-group, and restricts to D_{K,p} : B(K) → K_p on Suslin's Bloch group. On B(K) the map does not depend on the branch of the logarithm used to define D.

**Hypotheses.** K a number field, p any prime; the integrality statements of D.3–D.4 add p > 3 unramified in K. The Iwasawa branch is used to define D; branch independence is asserted only on B(K).

**Prerequisites.** `PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`, `K3BlochGroups:V.3/pre-bloch-group`, `K3BlochGroups:V.3/bloch-group`, `K3BlochGroups:V.3/five-term-relation`, `ColemanIntegration:L2/five-term-relation`, `ColemanIntegration:L2/dilogarithm-identities`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`

**Proof or construction.**

1. The five-term relation of ColemanIntegration:L2/five-term-relation holds in every factor K_v ⊂ C_p, so the additive extension kills the five-term subgroup and descends to P(K).
2. Branch independence on B(K): by ColemanIntegration:L2/dilogarithm-identities (d), D^a(z) − D^b(z) = ½(a − b)·Φ(z ∧ (1 − z)) with Φ(x ∧ y) = v(x)·log_b(y) − v(y)·log_b(x) an alternating biadditive form; it vanishes on the kernel of the boundary, which is B(K) (for Suslin's antisymmetric target, Φ factors through it since Φ(x ∧ x) = 0).
3. The identification of components with the D_σ is the definition of the semilocal equivalence.

**API.**

- `combinedDilog` (data): combinedDilog K p : FreeAbelianGroup Kˣ →+ K ⊗[ℚ] ℚ_[p], with [1] ↦ 0.
- `combinedDilog_of` (simp): combinedDilog K p [z] = etaleDilog (K ⊗ ℚ_[p]) (z ⊗ 1).
- `combinedDilog_component` (projection): Under K ⊗ Q_p ≅ ∏_{v|p} K_v, the v-component of combinedDilog K p [z] is D^0(σ_v z).
- `combinedDilog_fiveTerm` (relation): combinedDilog vanishes on the five-term subgroup, giving preBlochDilog K p : P(K) →+ K ⊗ Q_p.
- `blochDilog` (constructor): blochDilog K p : B(K) →+ K ⊗ Q_p, the restriction of preBlochDilog to Suslin's Bloch group.
- `blochDilog_branch_indep` (characterisation): For any branch parameter a ∈ Q_p, the Bloch-group map built from D^a equals blochDilog K p.
- `blochDilog_map` (functoriality): For a field embedding K → K', blochDilog K' p ∘ B(ι) = (ι ⊗ 1) ∘ blochDilog K p.
- `blochDilog_galois` (functoriality): For τ ∈ Aut(K), blochDilog K p ∘ B(τ) = (τ ⊗ 1) ∘ blochDilog K p.

**Uses.** GSWZ §1.5, (19) and (22): the regulator D_p(ξ) entering the formal completion f̂ of an invertible section. PadicHodgeRegulators:D.4/special-unit-formula: equals the global p-adic regulator on Bloch elements presented by special units at p. HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm: D_p(ξ) = Σ_j D_p(z_j) for the Nahm-equation solutions z_j. HabiroNumberFields:HB.7/invertible-local-sections: the normalisation of the local sections uses D_p(ξ).

**Unit tests.**

- `combinedDilog_rat` (compatibility): For K = Q, combinedDilog Q p [z] = D^0(z) ∈ Q_p, the ColemanIntegration value.
- `combinedDilog_zero` (degenerate): combinedDilog K p 0 = 0, and blochDilog vanishes on the subgroup generated by [x] + [x⁻¹] for x ≠ 0, 1.
- `blochDilog_cubic_five` (computation): For K = Q(α), α³ − α² + 1 = 0, ξ = 2[1 − α²] + [1 − α] ∈ B(K) and p = 5, blochDilog K 5 ξ = (3·5² + 5³ + 2·5⁴ + …)α² + (5² + 3·5³ + …)α + (2·5² + 3·5³ + …), GSWZ (271).
- `combinedDilog_not_on_bloch_branch` (non-example): On the pre-Bloch group the map depends on the branch: for p odd the symbol [p] ∈ P(Q) has D^1([p]) − D^0([p]) = ½·log_p(1 − p) ≠ 0, so branch independence is not asserted off B(K) ([p] ∉ B(Q) since p ∧ (1 − p) ≠ 0).

**Acceptance.** For K = Q, D_{Q,p}([z]) = D^0(z) ∈ Q_p. For K = Q(α), α³ − α² + 1 = 0 and p = 5, D_{K,5}(2[1 − α²] + [1 − α]) is the value printed in GSWZ (271), with K_5 ≅ Q_{25} × Q_5.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph after (174), p. 38; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Example 4.3, (270)–(271), p. 54; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.15, p. 6.

### Dictionary of dilogarithm and regulator normalisations

**Node** `PadicHodgeRegulators:D.1/regulator-normalisation-dictionary` (comparison).

Fix the Iwasawa branch. On C_p ∖ {0,1}: (i) GSWZ's D_p(z) = Li_2(z) + ½ log(z) log(1 − z) (GSWZ (174)) equals Coleman's D(z) (ColemanIntegration:L2/dilogarithm-identities with a = 0), Besser–de Jeu's L_mod,2(z) = L_2(z) + ½ log(z) L_1(z) = Li_2(z) − ½ log(z) Li_1(z) (BdJ §1, the unique choice for n = 2), and the n = 2 case L^mod_2 = Li_2 + B_1 Li_1 log of ColemanIntegration:L3/padic-regulator-polylogarithm (B_1 = −1/2, Li_1(z) = −log(1 − z)). (ii) Besser–de Jeu's regulator formula carries the factor ±(n − 1)!, which is ±1 for n = 2; the sign is the indeterminacy of BdJ Remark 1.7 and is fixed once in D.3/local-regulator. (iii) Gros's syntomic regulator on an unramified field satisfies reg^Gros = (1 − Frob/p²)·reg^Besser in weight two (BdJ Remark 1.13); on a root of unity ζ of order prime to p it takes the value ℓ_2(ζ) = Li_2(ζ) − p^{-2}Li_2(ζ^p) ∈ O, while the Besser value Li_2(ζ) lies in p²O (D.1/dilogarithm-scalar-extension (d)). (iv) The Bloch–Kato normalisation: under D_dR(Q_p(2)) = L·t^{-2}, with t = log[ε] the period of Q_p(1), the regulator of GSWZ is ε·log_BK∘c_{2,1} for one sign ε ∈ {±1} (D.2/syntomic-etale-regulator-comparison). (v) On roots of unity ζ ≠ 1 every branch gives the same value D(ζ) = Li_2(ζ), and on special units (|z| = |1 − z| = 1) D is branch independent.

**Hypotheses.** p any prime for (i), (ii) and (v); (iii) and (iv) concern unramified, respectively arbitrary, finite extensions L/Q_p.

**Prerequisites.** `ColemanIntegration:L2/dilogarithm-identities`, `ColemanIntegration:L3/padic-regulator-polylogarithm`, `ColemanIntegration:L2/branch-dependence`, `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`, `mathlib:bernoulli`

**Proof or construction.**

1. (i) Li_1(z) = −log(1 − z) turns L_2 + ½ log·L_1 into Li_2 + ½ log z log(1 − z); with B_0 = 1, B_1 = −1/2 the Bernoulli formula gives the same function.
2. (ii) and (iii) are BdJ Theorem 1.6(2) with n = 2 and BdJ Remark 1.13; (iii) at roots of unity is ColemanIntegration:L2/values-at-tame-roots-of-unity (a) with k = 2.
3. (v) is ColemanIntegration:L2/branch-dependence (i) and (iv) at k = 2, combined with log_a(ζ) = 0.

**Acceptance.** L_mod,2 = D on every z ∈ C_p ∖ {0,1}, checked symbolically from the definitions. For p = 5 and ζ = ω(2) ∈ Q_5: Li_2(ζ) ≡ 25 mod 125 while ℓ_2(ζ) = (1 − 5^{-2})Li_2(ζ) ≡ −1 mod 5 is a unit.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, after Remark 1.5's preamble, p. 3; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §1.5, (19), p. 9.

### Kernel of the logarithm on local units and the p-adic regulator matrix

**Node** `PadicHodgeRegulators:D.1/unit-logarithm-kernel` (lemma).

(a) Let L/Q_p be finite. The Iwasawa logarithm restricts to a continuous homomorphism log_p : O_L^× → L whose kernel is the finite group μ(L) of all roots of unity in L (including those of p-power order, and ±1 when p = 2) and whose image is an open Z_p-submodule of L; hence log_p induces an isomorphism (O_L^×)^∧_p ⊗_{Z_p} Q_p ≅ L, and for L unramified and p odd it maps U^1_L = 1 + pO_L isomorphically onto pO_L. (b) Let F be a number field, E_F its unit group and ε_1, …, ε_r a basis of E_F modulo torsion. The composite E_F ⊗ Z_p → ∏_{v|p}(O_v^×)^∧_p → ∏_{v|p} F_v = F ⊗ Q_p (completion followed by log_p), after the scalar extension F ⊗ Q_p ⊗_{Q_p} C_p ≅ C_p^{Hom(F, C_p)}, has matrix (log_p σ_j(ε_i))_{i ≤ r, j ≤ [F:Q]}. In particular rr_p(F), the rank of this matrix (Polylogarithms:P.6/padic-regulator), is the Z_p-rank of the image of E_F ⊗ Z_p in ∏_{v|p}(O_v^×)^∧_p, and Leopoldt's conjecture for (F, p) is the statement that this map is injective.

**Hypotheses.** log_p is the Iwasawa branch (log_p(p) = 0); embeddings σ_j : F → C_p are the [F:Q] field embeddings.

**Prerequisites.** `ColemanIntegration:L0/iwasawa-logarithm`, `ColemanIntegration:L0/log-one-add-convergence`, `ColemanIntegration:L0/log-branch-field-compatibility`, `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`

**Proof or construction.**

1. (a) By the Teichmüller decomposition log_p(u) = log(⟨u⟩); on U^1_L the logarithm is a homomorphism whose kernel is the p-power torsion (a principal unit with log 0 is a root of unity: the series log and exp are inverse on 1 + p^c O_L for c > 1/(p − 1)), and it is an isomorphism 1 + p^c O_L ≅ p^c O_L for such c. So the kernel on O_L^× is μ(L) and the image contains p^c O_L, an open lattice.
2. For L unramified and p odd, c = 1 works and U^1_L contains no nontrivial p-power roots of unity.
3. (b) Under the semilocal equivalence the v-component is log_p on F_v; extending scalars to C_p and decomposing by embeddings gives the entries log_p σ_j(ε_i) by ColemanIntegration:L0/log-branch-field-compatibility.

**Acceptance.** For L = Q_p (p odd), log_p(Z_p^×) = pZ_p and the kernel is μ_{p−1}. For p = 2 and L = Q_2 the kernel is {±1}: the torsion kernel must include 2-power roots of unity. For F = Q(√2), p = 7 and ε = 1 + √2, the 1 × 2 matrix (log_7(1 + √2), log_7(1 − √2)) has rank 1 because ε is not a root of unity.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, p. 37.

### The logarithm takes norms to traces

**Node** `PadicHodgeRegulators:D.1/logarithm-norm-trace` (lemma).

Let A → B be a finite free extension of finite étale Q_p-algebras (for instance an extension of finite products of p-adic fields, or K ⊗ Q_p → K' ⊗ Q_p for number fields K ⊂ K'). For every u ∈ B^× with log_p defined componentwise, log_p(N_{B/A}(u)) = Tr_{B/A}(log_p(u)). In particular, for an extension of p-adic fields L'/L, log_p ∘ N_{L'/L} = Tr_{L'/L} ∘ log_p on L'^×, and the same holds on the completed unit groups.

**Hypotheses.** log_p is the Iwasawa branch, applied factor by factor.

**Prerequisites.** `ColemanIntegration:L0/iwasawa-logarithm`, `ColemanIntegration:L0/log-branch-field-compatibility`, `mathlib:Algebra.norm`, `mathlib:Algebra.trace`

**Proof or construction.**

1. Reduce to fields by decomposing A and B; for L'/L separable, N(u) = ∏_σ σ(u) and Tr(x) = Σ_σ σ(x) over the L-embeddings of L' into C_p.
2. log_p is a homomorphism and commutes with every continuous automorphism of C_p (the Iwasawa branch is Galois equivariant), so log_p(∏_σ σ u) = Σ_σ σ(log_p u).

**Acceptance.** For L' = Q_{p²}, L = Q_p and u = ω(α) a Teichmüller unit, both sides vanish. With a branch a ∉ Q_p the identity fails at u = p (log_a(p^{[L':L]}) = [L':L]·a while Tr(a) = [L':L]·a only if the branch parameter is fixed by Galois): the Galois-equivariant branch is needed.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, after Remark 1.5's preamble, p. 3.

### Acceptance tests for D.1

- `D(−1) = 0` (p odd).
- `D_{Q_5}(ω(2)) ≡ 25 mod 125`, the `Q_5`-component of `D_5(ζ_24)` in GSWZ (273).
- `D^1(p) − D^0(p) = ½ log_p(1 − p) ≠ 0`: the branch is part of the normalisation off `B(K)`.

## D.2. Étale and syntomic regulators

**Soulé's étale regulator** `r^ét_n : K_{2n−1}(F) → H¹(F, Z_p(n))` is the limit of the étale Chern classes with `Z/p^ν` coefficients (imported from `MotivicEtaleKTheory`). **Rigid syntomic cohomology** of a smooth `O_K`-scheme is the cone of `(1 − Φ/p^n)` between rigid cohomology of the special fibre and the Hodge filtration of de Rham cohomology of the generic fibre; for `Spec O_K` and `n ≥ 1`, `η : H¹_syn(O_K, n) ≅ K`. **Besser's syntomic regulator** is the syntomic Chern class, `reg_syn = η ∘ c^syn : K_{2n−1}(O_K) → K`. The comparison theorem is `r^ét_n = exp_BK ∘ reg_syn` with no constant (both normalised by Chern classes), so `reg_syn = log_BK ∘ r^ét_n` for `n ≥ 2`. In weight two, **Besser–de Jeu** evaluate the regulator on Bloch elements presented by special units of the valuation ring, and on cyclotomic elements of number fields of every order, as `±D`; for arbitrary presentations this is their Conjecture 1.14, which this plan does not assume. **Gros's normalisation** is `(1 − σ/p^n)·reg_syn`, integral at roots of unity. The **log-syntomic package** — the complexes `S_n(r)_X` for fs log-smooth `O_K^×`-schemes, the Fontaine–Messing–Kato period morphism to `i^*Rj_*Z/p^n(r)'`, the Kato–Kurihara–Tsuji isomorphism in degrees `i ≤ r ≤ p − 1` with Colmez–Nizioł's bounded version in general, and the syntomic exponential, which is the Bloch–Kato exponential — is the sub-layer `D.2:log-syntomic` proposed in the packet; it is the input that D.5's bad-reduction boundary imports. The prismatic syntomic complexes `Z_p(n)` are `PrismaticCohomology` PR.4's; their comparison with the complexes here is owned downstream of both.

**Dependencies.** `PadicHodgeRegulators:L0`, `L1`, `D.1`; `MotivicEtaleKTheory:M.1`, `M.7`; `KTheoryFiniteLocalFields:L.1`, `L.2`, `L.6`, `L.7`; `K3BlochGroups:V.4`, `V.6`; `Polylogarithms:P.4`; `PadicDifferentialEquationsAndRigidCohomology:RD.4`; `DerivedDeRhamCohomology:DD.2`; `SchemeKTheoryOperations:S.5`, `S.7`; `CrystallineCohomology:CR.0`, `CR.2`, `CR.3`, `CR.5`; `AInfCohomology:AI.4`; `PadicHodgeTheory:R06.1`; `PhiGammaModulesAndIwasawaCohomology:PG.3`.

### Soulé's étale regulator to continuous Galois cohomology

**Node** `PadicHodgeRegulators:D.2/etale-regulator` (construction). **Declaration:** `etaleRegulator`. **Planet:** Soulé's étale regulator.

Let F be a field of characteristic 0 (a number field, a finite extension of Q_p, or a finite product of such), p a prime and n ≥ 1. The étale regulator r^et_n : K_{2n−1}(F) → H^1(F, Z_p(n)) is the composite of the reductions K_{2n−1}(F) → K_{2n−1}(F; Z/p^ν), Soulé's étale Chern classes c_{n,1} : K_{2n−1}(F; Z/p^ν) → H^1(F, μ_{p^ν}^{⊗n}) (compatible in ν), and the inverse limit H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) of continuous cohomology; it factors through the completion K_{2n−1}(F; Z_p) and induces r^et_n ⊗ Q : K_{2n−1}(F) ⊗ Q_p → H^1(F, Q_p(n)). For n = 1 it is the Kummer map F^× → H^1(F, Z_p(1)). For F a finite extension of Q_p and n ≥ 2 the map on completed K-theory is the isomorphism of KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1.

**Hypotheses.** F of characteristic 0; Chern classes in the normalisation of Soulé (Chern classes, not Chern character components); n ≥ 1.

**Prerequisites.** `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.1`, `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, `KTheoryFiniteLocalFields:L.1/completed-k-theory`, `KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1`, `KTheoryFiniteLocalFields:L.7/etale-chern-class-completion`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `tauceti:TauCeti.kummerClassMap`

**Proof or construction.**

1. Soulé's Chern classes c_{n,1} with Z/p^ν-coefficients are supplied by MotivicEtaleKTheory (request on M.7: the Chern-class part that needs only étale K-theory, as RT-AREA-ktheory-2/18 directs); their compatibility with the coefficient maps ν ↦ ν ± 1 gives the limit.
2. ArithmeticGaloisDuality:R02.1/tate-inverse-limit identifies lim_ν H^1(F, μ_{p^ν}^{⊗n}) with continuous H^1(F, Z_p(n)) (the lim¹ term vanishes since the H^0 are finite).
3. For n = 1, c_{1,1} is the Kummer map (KTheoryFiniteLocalFields:L.7/etale-chern-class-completion, degree one).

**API.**

- `etaleRegulator` (data): etaleRegulator F p n : K_{2n−1}(F) →+ H^1(F, ℤ_p(n)).
- `etaleRegulator_completed` (constructor): The factorisation through K_{2n−1}(F; ℤ_p), a ℤ_[p]-linear map.
- `etaleRegulator_one` (compatibility): For n = 1, etaleRegulator F p 1 is the Kummer map F^× → H^1(F, ℤ_p(1)).
- `etaleRegulator_map` (functoriality): For a field embedding F → F', res ∘ etaleRegulator F = etaleRegulator F' ∘ K_{2n−1}(ι).
- `etaleRegulator_transfer` (functoriality): For F'/F finite, cor ∘ etaleRegulator F' = etaleRegulator F ∘ N_{F'/F} (transfer).
- `etaleRegulator_local_equiv` (equivalence): For F/ℚ_p finite and n ≥ 2, the completed map is the isomorphism of KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1.
- `etaleRegulator_completion` (compatibility): For a number field F and v | p, res_v ∘ etaleRegulator F = etaleRegulator F_v ∘ c_v.

**Uses.** Huber–Kings 2011, §1.3 and Theorem 1.3.2: Soulé's regulator r_p, compared with the Bloch–Kato exponential of the p-adic Borel regulator. PadicHodgeRegulators:D.3/local-regulator: the p-adic regulator on completed K_3 is ε·log_BK∘r^et_2. EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: z = log_BK(reg_et(u)) is the étale side of the elliptic Frobenius factor. KatoEulerSystems:L1: étale Chern classes of symbols on modular curves, imported through D.2.

**Unit tests.**

- `etaleRegulator_kummer` (compatibility): For F = Q_p, n = 1 and u ∈ Z_p^×, etaleRegulator F p 1 u is the image of u under lim_ν of Tau Ceti's kummerClassMap.
- `etaleRegulator_rank_q5` (computation): For F = Q_5, n = 2, the completed etaleRegulator is a ℤ_5-linear isomorphism between free modules of rank 1.
- `etaleRegulator_torsion_Q` (degenerate): For F = Q and n = 2, K_3(Q) ≅ Z/48 is torsion, so the image of etaleRegulator Q p 2 lies in the torsion of H^1(Q, Z_p(2)) and its rationalisation is 0.
- `etaleRegulator_not_basis_functional` (non-example): For F = Q_{p²} and p > 3, a ℤ_p-isomorphism K_3(F; ℤ_p) ≅ ℤ_p² chosen from bases is not etaleRegulator: etaleRegulator commutes with the Frobenius automorphism of F, while a generic basis isomorphism does not.

**Acceptance.** For F = Q_p and n = 1, r^et_1(u) for u ∈ Z_p^× is the Kummer class of u, Tau Ceti's kummerClassMap in the limit. For F = Q_5 and n = 2, the completed map K_3(Q_5; Z_5) → H^1(Q_5, Z_5(2)) ≅ Z_5 is an isomorphism.

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), §1.3, p. 8; [NN2016](https://arxiv.org/abs/1309.7620v5), §5.2, p. 59.

### Rigid syntomic cohomology of smooth schemes over a p-adic integer ring

**Node** `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology` (definition). **Declaration:** `rigidSyntomicCohomology`.

Let R be a complete discrete valuation ring of characteristic 0 with perfect residue field k of characteristic p and fraction field K, R_0 = W(k), K_0 = R_0[1/p], and n ∈ Z. For a smooth R-scheme X with syntomic data (a smooth P_0 over R_0 with a σ-semilinear Frobenius lift Φ, a smooth P over R, X ↪ P and P_0 → P), Besser's rigid syntomic complex is RΓ_syn(X, n) := Cone(Fil^n RΓ_dR(X_K) ⊕ RΓ_rig(X_k/K_0) → RΓ_rig(X_k/K) ⊕ RΓ_rig(X_k/K_0))[−1], (a, b) ↦ (a − b, (1 − Φ*/p^n)b), with RΓ_rig from overconvergent de Rham complexes on the tubes; its cohomology H^i_syn(X, n) is independent of the syntomic data and functorial in X. For X = Spec R and n ≥ 1, H^i_syn(Spec R, n) = 0 for i ≠ 1 and the de Rham component η : H^1_syn(Spec R, n) ≅ K is an isomorphism (1 − σ/p^n being bijective on K_0).

**Hypotheses.** R a complete DVR, char K = 0, k perfect of characteristic p (finite in the arithmetic applications); X smooth, separated and of finite type over R.

**Prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/overconvergent-de-rham-complex`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison`, `DerivedDeRhamCohomology:DD.2`

**Proof or construction.**

1. The cone is formed in the derived category of K_0-vector spaces from the rigid cohomology of the special fibre (RD.4, with its Frobenius) and the Hodge filtration on algebraic de Rham cohomology of the generic fibre.
2. Independence of the syntomic data: two choices are dominated by their product, and the Frobenius lifts are homotopic on overconvergent de Rham complexes (PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lifts-induce-homotopic-maps).
3. For Spec R the complex is Cone(K_0 → K ⊕ K_0, b ↦ (b, (1 − σ/p^n)b))[−1]; 1 − σ/p^n is bijective on K_0 for n ≥ 1, so the cone is K[−1] through the de Rham component.

**API.**

- `rigidSyntomicCohomology` (data): rigidSyntomicCohomology X n i : the K_0-vector space H^i_syn(X, n).
- `rigidSyntomicCohomology_map` (functoriality): A morphism of smooth R-schemes X → Y induces H^i_syn(Y, n) → H^i_syn(X, n), with map_id and map_comp.
- `rigidSyntomic_long_exact` (relation): The long exact sequence … → H^{i−1}_rig(X_k/K_0) ⊕ Fil^n H^{i−1}_dR → H^{i−1}_rig(X_k/K) ⊕ H^{i−1}_rig(X_k/K_0) → H^i_syn(X, n) → … .
- `rigidSyntomic_spec_eta` (equivalence): η : H^1_syn(Spec R, n) ≃ K for n ≥ 1.
- `rigidSyntomic_spec_vanish` (characterisation): H^i_syn(Spec R, n) = 0 for i ≠ 1 and n ≥ 1.
- `rigidSyntomic_independent` (other): Independence of the syntomic data up to canonical isomorphism.

**Uses.** Huber–Kings 2011, Definition 2.2.1 and Example 2.2.4: the target H^1_syn(Spec R, n) = K of the syntomic regulator on K_{2n−1}(R). Besser–de Jeu, §4: the modified syntomic cohomology H̃_ms receives Chern classes and computes the regulator on K_3. PadicHodgeRegulators:D.5/curve-syntomic-regulator: H^2_syn(X, 2) of a smooth proper curve with good reduction is identified with H^1_dR(X_K). ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements: the target K of Besser's regulator in the Coleman formula.

**Unit tests.**

- `rigidSyntomic_zp_two` (computation): For R = Z_p, H^1_syn(Spec Z_p, 2) ≅ Q_p via η, and, with Huber–Kings' cone map (a, b) ↦ (a − b, (1 − Φ/p^n)b), the class of (0, c) with c ∈ Q_p maps to (1 − 1/p²)^{−1}c.
- `rigidSyntomic_weight_zero` (degenerate): For n = 0 and X = Spec R, H^0_syn(Spec R, 0) ≅ Q_p (the kernel of 1 − σ on K_0 is Q_p) and the η-isomorphism of the n ≥ 1 case does not hold.
- `rigidSyntomic_monsky_washnitzer` (compatibility): For X smooth affine, the rigid terms are Monsky–Washnitzer cohomology of the dagger algebra (PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison).
- `rigidSyntomic_not_de_rham` (non-example): H^1_syn(Spec R, n) is not Fil^n H^0_dR(K) (which is 0 for n ≥ 1): the syntomic group sees the cone, not the filtration step.

**Acceptance.** H^1_syn(Spec Z_p, 2) ≅ Q_p through η. H^0_syn(Spec R, n) = 0 for n ≥ 1 because 1 − σ/p^n has no kernel on K_0.

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Definition 2.2.1, p. 14; [HK2011](https://arxiv.org/abs/math/0612611v1), Example 2.2.4, pp. 14–15.

### Besser's syntomic regulator

**Node** `PadicHodgeRegulators:D.2/syntomic-regulator` (construction). **Declaration:** `syntomicRegulator`. **Planet:** Besser's syntomic regulator.

For a smooth R-scheme X (R as in D.2/rigid-syntomic-cohomology) and i, j ≥ 0, the syntomic Chern classes c^syn_{i,j} : K_j(X) → H^{2i−j}_syn(X, i) are obtained by evaluating the universal syntomic Chern classes c_i ∈ H^{2i}_syn(B_•GL_N, i) — characterised by mapping to the de Rham Chern classes in Fil^i H^{2i}_dR — through Gillet's formalism. For X = Spec R and n ≥ 1 the syntomic regulator is reg_syn := η ∘ c^syn_{n,2n−1} : K_{2n−1}(R) → K; for n ≥ 2 it factors through K_{2n−1}(R) ⊗ Q ≅ K_{2n−1}(K) ⊗ Q. It is compatible with finite extensions R → R' (reg_syn,R' ∘ K(ι) = ι ∘ reg_syn,R) and with automorphisms of R, and for n = 1 it is log_p on R^×.

**Hypotheses.** R a complete DVR of characteristic 0 with perfect residue field; for the arithmetic uses the residue field is algebraic over F_p and the branch of log is the Iwasawa branch.

**Prerequisites.** `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`, `SchemeKTheoryOperations:S.7/chern-character`, `SchemeKTheoryOperations:S.5/projective-bundle-theorem`, `KTheoryFiniteLocalFields:L.2/odd-k-ring-of-integers-equals-field`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`

**Proof or construction.**

1. Syntomic cohomology satisfies the projective bundle formula and homotopy invariance needed by Gillet's construction; the universal classes on B_•GL_N are determined by their de Rham images (Huber–Kings Definition 2.3.3 after Besser Theorem 7.5).
2. Evaluating on BGL_N(R) and composing with the Hurewicz map gives c^syn_{n,2n−1} on K_{2n−1}(R).
3. Base change: Besser 2000, Lemma 8.8, as cited in Besser–de Jeu's proof of Theorem 1.12.

**API.**

- `syntomicChernClass` (data): syntomicChernClass X i j : K_j(X) →+ H^{2i−j}_syn(X, i).
- `syntomicRegulator` (constructor): syntomicRegulator R n := η ∘ syntomicChernClass (Spec R) n (2n−1) : K_{2n−1}(R) →+ K.
- `syntomicRegulator_one` (compatibility): syntomicRegulator R 1 u = log_p u for u ∈ Rˣ (Iwasawa branch).
- `syntomicRegulator_baseChange` (functoriality): For a finite extension R → R' with fraction fields K ⊂ K', syntomicRegulator R' n ∘ K(ι) = ι ∘ syntomicRegulator R n.
- `syntomicRegulator_aut` (functoriality): For an automorphism τ of R, syntomicRegulator R n ∘ K(τ) = τ ∘ syntomicRegulator R n.
- `syntomicChernClass_deRham` (characterisation): The image of the universal class in Fil^i H^{2i}_dR(B_•GL_N) is the de Rham Chern class.

**Uses.** Besser–de Jeu, Theorem 1.6(2): the regulator K^{(n)}_{2n−1}(O) → K^{(n)}_{2n−1}(R) → K computed on special units. ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements: reg_σ([ζ]_n) = ±(n−1)!·L^mod_n(σζ). Gros, Régulateurs syntomiques, as recalled in Besser–de Jeu Remark 1.13: reg^Gros = (1 − Frob/p^n)·reg for unramified fields.

**Unit tests.**

- `syntomicRegulator_log` (computation): For R = Z_p (p odd) and u = 1 + p, syntomicRegulator Z_p 1 u = log(1 + p) = p − p²/2 + p³/3 − … .
- `syntomicRegulator_teichmuller_one` (degenerate): For n = 1 and u a Teichmüller unit, syntomicRegulator R 1 u = 0.
- `syntomicRegulator_cyclotomic` (compatibility): For R = Z_p[ζ_m] with p ∤ m and ζ ≠ 1, syntomicRegulator R 2 [ζ]_2 = ±Li_2(ζ), the value of ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements at n = 2.
- `syntomicRegulator_not_gros` (non-example): For R = Z_p, the Gros normalisation (1 − Frob/p²)·syntomicRegulator differs from syntomicRegulator by the factor 1 − p^{−2} ≠ 1, so the two are not interchangeable in integrality statements.

**Acceptance.** For n = 1 and u ∈ R^×, reg_syn(u) = log_p(u) (Huber–Kings Example 2.5.2). For R = Z_p, n = 2: reg_syn is a Z_p-linear map K_3(Z_p) → Q_p whose rationalisation is injective on K_3(Z_p) ⊗ Q_p (via D.2/syntomic-etale-regulator-comparison).

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Definition 2.3.3, p. 16; [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, p. 1; [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 5.6, p. 57.

### The syntomic regulator is the Bloch–Kato logarithm of the étale regulator

**Node** `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison` (theorem).

Let R be the integer ring of a finite extension K of Q_p and n ≥ 1. The natural map ρ_syn : H^1_syn(Spec R, n) → H^1(K, Q_p(n)) (compatible with Chern classes) equals exp_BK ∘ η, where exp_BK : K = D_dR(Q_p(n))/Fil^0 → H^1(K, Q_p(n)) is the Bloch–Kato exponential (L1/bloch-kato-exponential, with D_dR(Q_p(n)) = K·t^{−n}e_n). Consequently, on K_{2n−1}(R): r^et_n ⊗ Q = exp_BK ∘ reg_syn, with no constant when both regulators use Chern classes. For n ≥ 2, exp_BK is an isomorphism and reg_syn = log_BK ∘ r^et_n; for n = 1 this is ∂ = exp_BK ∘ log_p on R^× (Bloch–Kato 3.10.1). For a smooth variety X over K the same compatibility holds for the Nekovář–Nizioł syntomic regulator: ρ_syn ∘ c^syn_{i,j} = c^et_{i,j}, and the induced map H^q_dR(X)/F^r → H^1(G_K, H^q_et(X_K̄, Q_p(r))) is the Bloch–Kato exponential of H^q_et(X_K̄, Q_p(r)).

**Hypotheses.** K/Q_p finite (any ramification); n ≥ 1; Chern-class normalisation for both regulators.

**Prerequisites.** `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/etale-regulator`, `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`

**Proof or construction.**

1. Besser constructs ρ_syn compatibly with Chern classes and identifies H^1_syn(Spec R, n) → H^1(K, Q_p(n)) with exp_BK ∘ η (Besser 2000, Propositions 9.9–9.11, as recalled in Huber–Kings Propositions 2.2.9 and 2.3.4 and Tamme, proof of Corollary 5.19).
2. The universal syntomic Chern class maps to the universal étale Chern class (Huber–Kings Proposition 2.3.4), hence r^et_n = exp_BK ∘ η ∘ c^syn_n on K_{2n−1}(R).
3. For varieties over K: Nekovář–Nizioł Proposition 5.7 (compatibility of Chern classes, no constant) and Proposition 4.13 (the boundary map is the Bloch–Kato exponential), with the sign convention of their Remark 2.14 fixed once.

**Acceptance.** n = 1, K = Q_p, u = 1 + p: exp_BK(log_p(1 + p)) is the Kummer class of 1 + p. n = 2, K = Q_5: for ζ = ω(2), log_BK(r^et_2([ζ])) = ±Li_2(ζ), consistent with D.2/weight-two-dilogarithm-comparison. The Huber–Kings p-adic Borel regulator satisfies r^et_n = exp_BK ∘ b_p (Huber–Kings Theorem 1.3.2); Tamme's Corollary 5.21 writes this with the factor (−1)^n/(n−1)! when the étale regulator is normalised by the Chern character.

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Proposition 2.3.4, p. 16; [Tamme2014](https://arxiv.org/abs/1111.4109v4), Proof of Corollary 5.19, p. 20; [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 5.7, p. 58.

### Besser–de Jeu: the weight-two regulator is Coleman's dilogarithm on special units

**Node** `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison` (theorem). **Planet:** Besser–de Jeu dilogarithm formula.

Let F be a field of characteristic 0, O ⊂ F a discrete valuation ring with residue field κ, and σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R (so κ is algebraic over F_p). Let ξ ∈ K_3(O) ⊗ Q be the image, under de Jeu's map H^1(M̃^{(2)}(O)) → K^{(2)}_3(O), of an element Σ_i n_i [x_i]_2 with n_i ∈ Q, x_i ∈ O^♭ special units (x_i, 1 − x_i ∈ O^×) and Σ_i n_i (1 − x_i) ∧ x_i = 0 in ∧²(O^×) ⊗ Q. Then reg_syn(σ_* ξ) = ±Σ_i n_i D(σ(x_i)), with D = L_mod,2 Coleman's dilogarithm (D.1/regulator-normalisation-dictionary), the sign being the single sign indeterminacy of de Jeu's map. For F a number field and O its localisation at a prime above p the same holds without further hypotheses, and for every root of unity ζ ≠ 1 of F (of any order) the cyclotomic element [ζ]_2 satisfies reg_syn(σ_*[ζ]_2) = ±Li_2(σζ). Combined with D.2/syntomic-etale-regulator-comparison: log_BK(r^et_2(σ_* ξ)) = ±Σ_i n_i D(σ x_i). For arbitrary elements of B(F) ⊗ Q (symbols that are not special units of O) the identity is Besser–de Jeu's Conjecture 1.14 and is not asserted.

**Hypotheses.** n = 2 (no Beilinson–Soulé hypothesis is needed in weight two). Every x_i is a special unit of O; the comparison of de Jeu's weight-two complex with Suslin's Bloch group (requested from Polylogarithms:P.4) transports the statement to B(F) ⊗ Q.

**Prerequisites.** `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`, `PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`, `PadicHodgeRegulators:D.1/combined-dilogarithm`, `Polylogarithms:P.4`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.6/comparison-rational`

**Proof or construction.**

1. Besser–de Jeu construct M̃^{(n)}(O) and a map H^1(M̃^{(n)}(O)) → K^{(n)}_{2n−1}(O) through multi-relative K-theory and localisation (their §3), natural up to sign.
2. The key computation, BdJ Proposition 7.10, evaluates the modified syntomic regulator on [z]_n for special units z as (−1)^n(n−1)!·L_n(z); for n = 2 the combination with the boundary term gives ±L_mod,2 = ±D.
3. Number fields (BdJ Theorem 1.10): no hypothesis is needed; roots of unity of order divisible by p (BdJ Theorem 1.12) follow from the distribution relation over F(μ_r) and the base-change compatibility of the syntomic regulator (Besser 2000, Lemma 8.8).
4. Transport to Suslin's B(F) ⊗ Q uses the weight-two comparison of de Jeu's complex with the Bloch–Suslin complex (request to Polylogarithms:P.4) and K3BlochGroups:V.6/comparison-rational.

**Acceptance.** F = Q(ζ_m), p ∤ m, σ an embedding into Q_p(ζ_m): reg_syn([ζ_m]_2) = ±Li_2(σζ_m) ∈ p²Z_p[ζ_m]. GSWZ Example 4.3: all symbols 1 − α², 1 − α of ξ = 2[1 − α²] + [1 − α] and their complements are global units (norm ±1), so the theorem gives D.2's regulator of ξ at both places above 5 as ±D_5(ξ) of GSWZ (271). The symbol [p] ∈ P(Q) is not a special unit at p; no statement is made for presentations containing it.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.6(2), p. 4; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.12, p. 6; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Conjecture 1.14, p. 6.

### Besser–de Jeu: the syntomic regulator in higher weight

**Node** `PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison` (theorem).

Let F be a number field, O the localisation of O_F at a prime above p, σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R, and n ≥ 2. On de Jeu's H^1(M̃^{(n)}(O)) → K^{(n)}_{2n−1}(O) ≅ K^{(n)}_{2n−1}(F), the composite with σ_* and reg_syn maps [x]_n (x a special unit of O) to ±(n − 1)!·L_mod,n(σ(x)), and for every root of unity ζ ≠ 1 of F (of any order) maps the cyclotomic element [ζ]_n to ±(n − 1)!·L_mod,n(σζ) = ±(n − 1)!·Li_n(σζ). For a field F of characteristic 0 and a discrete valuation ring O ⊂ F, the same holds on special units under the Beilinson–Soulé conjecture for F and its residue field (n ≥ 3). L_mod,n is the modified polylogarithm of ColemanIntegration:L3/padic-regulator-polylogarithm. For n = 2 this is D.2/weight-two-dilogarithm-comparison.

**Hypotheses.** n ≥ 2; F a number field (no further hypothesis), or the Beilinson–Soulé conjecture for F and κ when n ≥ 3. The comparison of de Jeu's complexes with K-theory in weight n is requested from Polylogarithms:P.4.

**Prerequisites.** `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `ColemanIntegration:L3/padic-regulator-polylogarithm`, `ColemanIntegration:L2/distribution-relation`, `Polylogarithms:P.4`

**Proof or construction.**

1. BdJ Proposition 7.10: the modified syntomic regulator of [z]_n for a special unit z is (−1)^n(n − 1)!·L_n(z) in their normalisation; with the boundary terms of the complex this gives ±(n − 1)!·L_mod,n(z).
2. Number fields need no Beilinson–Soulé hypothesis (BdJ Theorem 1.10); roots of unity of order divisible by p follow from the distribution relation over F(μ_r) with r ≡ 1 mod p^s and base change (BdJ Theorem 1.12, Besser 2000 Lemma 8.8).
3. L_mod,n(ζ) = Li_n(ζ) because log_p vanishes on roots of unity.

**Acceptance.** F = Q(ζ_N), n = 3, p ∤ N: reg_syn([ζ_N]_3) = ±2·Li_3(σζ_N). The input of ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements is this theorem with F = Q(ζ_N).

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.10(2), p. 5; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.12, p. 6.

### Gros's normalisation of the syntomic regulator

**Node** `PadicHodgeRegulators:D.2/gros-normalisation` (comparison).

Let K/Q_p be finite unramified with Frobenius σ and n ≥ 1. Gros's syntomic regulator is reg^Gros_n = (1 − σ/p^n) ∘ reg_syn on K_{2n−1}(O_K), with reg_syn = η ∘ c^syn of D.2/syntomic-regulator. On a cyclotomic element [ζ]_n with ζ a root of unity of order prime to p it takes the value Li^{(p)}_n(ζ) = Li_n(ζ) − p^{−n}Li_n(ζ^p) up to the sign and the factor (n − 1)! of D.2/weight-two-dilogarithm-comparison; for n = 2 this is ±ℓ_2(ζ) ∈ O_K, whereas reg_syn([ζ]_2) = ±Li_2(ζ) ∈ p²O_K. The Gros regulator is defined only for unramified K.

**Hypotheses.** K/Q_p finite unramified, σ its Frobenius; p ∤ ord(ζ).

**Prerequisites.** `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`, `ColemanIntegration:L2/values-at-tame-roots-of-unity`

**Proof or construction.**

1. BdJ Remark 1.13 records reg^Gros = (1 − Frob/p^n) reg.
2. Galois equivariance gives σ(Li_n(ζ)) = Li_n(ζ^p), so (1 − σ/p^n)Li_n(ζ) = Li^{(p)}_n(ζ), which is ℓ_n(ζ) by ColemanIntegration:L2/values-at-tame-roots-of-unity (a).

**Acceptance.** For K = Q_5 and ζ = ω(2): reg^Gros([ζ]_2) ≡ ∓1 mod 5 is a unit while reg_syn([ζ]_2) ∈ 25Z_5. The factor (n − 1)! present in BdJ Theorem 1.12 and absent from Gros's formula is 1 for n = 2; for n ≥ 3 the two normalisations also differ by it (unexplained in BdJ Remark 1.13; see sourceIssues).

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6.

### Log-syntomic complexes S_n(r)

**Node** `PadicHodgeRegulators:D.2/log-syntomic-complex` (definition). **Declaration:** `logSyntomicComplex`. **Planet:** Log-syntomic complexes.

Let O_K be a complete discrete valuation ring of mixed characteristic (0, p) with perfect residue field k, O_F = W(k), and let X be an fs log-scheme, log-smooth over O_K^× (O_K with the log structure of its closed point); X_n := X ⊗ Z/p^n. For r ≥ 0 the mod-p^n log-syntomic complex is RΓ_syn(X, r)_n := [RΓ_cr(X, J^{[r]})_n --(p^r − φ)--> RΓ_cr(X)_n] (homotopy fibre), where RΓ_cr(X, J^{[r]})_n is absolute log-crystalline cohomology of X_n over W_n(k) with coefficients in the r-th divided-power ideal J^{[r]} (J^{[r]} = O for r ≤ 0) and φ is the crystalline Frobenius; its étale sheafification on X_0 is S_n(r)_X ≃ [J^{[r]}_{cr,n} --(p^r − φ)--> A_{cr,n}], with RΓ_syn(X, r)_n = RΓ(X_{0,ét}, S_n(r)_X). The completed version is RΓ_syn(X, r) := holim_n RΓ_syn(X, r)_n, with RΓ_syn(X, r)_n ≃ RΓ_syn(X, r) ⊗^L Z/p^n, and rationally RΓ_syn(X, r)_Q ≃ Cone(RΓ_cr(X, J^{[r]})_Q --(1 − φ_r)--> RΓ_cr(X)_Q)[−1] with φ_r = φ/p^r.

**Hypotheses.** X fs, log-smooth over O_K^×, of Cartier type where comparisons with Hyodo–Kato cohomology are used; O_K need not be unramified. r ≥ 0, n ≥ 1.

**Prerequisites.** `CrystallineCohomology:CR.5`, `CrystallineCohomology:CR.3`, `CrystallineCohomology:CR.0/pd-filtration`, `PadicHodgeTheory:R06.1/crystalline-period-ring`

**Proof or construction.**

1. Absolute log-crystalline cohomology with the divided-power filtration and its Frobenius are imported from CrystallineCohomology CR.3/CR.5 (request: the filtered absolute log-crystalline complexes RΓ_cr(X, J^{[r]})_n of fs log-smooth O_K^×-schemes with Frobenius).
2. The homotopy fibre of p^r − φ is formed in the derived category of Z/p^n-modules; étale localisation gives the sheaf version, and the derived limit gives the completed one.
3. Rationally, p^r − φ = p^r(1 − φ_r) on J^{[r]}, giving the cone form.

**API.**

- `logSyntomicComplex` (data): logSyntomicComplex X r n : the complex RΓ_syn(X, r)_n of Z/p^n-modules.
- `logSyntomicSheaf` (data): S_n(r)_X on X_{0,ét}, with RΓ(X_{0,ét}, S_n(r)_X) ≃ logSyntomicComplex X r n.
- `logSyntomicComplex_reduction` (relation): logSyntomicComplex X r n ≃ logSyntomicCompleted X r ⊗^L Z/p^n.
- `logSyntomicComplex_rational` (equivalence): logSyntomicCompleted X r ⊗ Q ≃ Cone(1 − φ_r)[−1] on rational log-crystalline cohomology.
- `logSyntomicComplex_map` (functoriality): Morphisms of fs log-smooth O_K^×-schemes induce maps, with map_id and map_comp; base change along O_K → O_{K'}.
- `logSyntomicComplex_product` (structure): Cup products S_n(r) ⊗ S_n(s) → S_n(r + s).

**Uses.** Colmez–Nizioł, Theorem 1.1: the source of the period map whose kernel and cokernel are bounded. RT-AREA-iwasawa-2/3: the log-syntomic package (S_n(r), the period morphism, the small-twist isomorphism, the syntomic exponential) owned by this roadmap and imported by D.2 and D.5. PadicHodgeRegulators:D.5/semistable-input-boundary: the additional input for bad or semistable reduction. Nekovář–Nizioł, Theorem A: rational log-syntomic cohomology of varieties over K via h-sheafification.

**Unit tests.**

- `logSyntomic_point_weight_two` (computation): For X = Spec O_K (log structure of the closed point), r = 2: H^1(logSyntomicCompleted X 2) is p^{N}-isomorphic to O_K and H^2 to 0.
- `logSyntomic_weight_zero` (degenerate): For r = 0, J^{[0]} = O and S_n(0) is the fibre of 1 − φ on A_{cr,n}; on X = Spec O_K its H^0 is Z/p^n.
- `logSyntomic_rigid_compat` (compatibility): For X smooth over O_K with trivial horizontal log structure and K unramified, the rational complex agrees with D.2/rigid-syntomic-cohomology (both compute the fibre of 1 − φ_r against the Hodge filtration).
- `logSyntomic_not_naive_twist` (non-example): With the untwisted Z/p^n(r) the period map of D.2/fontaine-messing-kato-period-map does not have bounded kernel uniformly in r; Colmez–Nizioł's comparison needs the twist Z_p(r)' = p^{−a(r)}Z_p(r).

**Acceptance.** X = Spec O_K with its log structure and r ≥ 2: H^1_syn(X, r) is p^N-isomorphic to O_K and H^0 to 0 (Colmez–Nizioł Proposition 3.19, up to p^{N(r,e)}). r = 1: H^1_syn(O_K^×, 1) is p^N-isomorphic to O_K ⊕ Z_p, the extra Z_p accounting for the valuation, matching dim H^1(K, Q_p(1)) = [K:Q_p] + 1.

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), §5.1.1, pp. 52–53; [NN2016](https://arxiv.org/abs/1309.7620v5), Introduction, (1), p. 2.

### The Fontaine–Messing–Kato period morphism

**Node** `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map` (construction) (sub-layer `D.2:log-syntomic`). **Declaration:** `fmkPeriodMap`.

For X as in D.2/log-syntomic-complex, with i : X_0 ↪ X the special fibre and j : X_tr ↪ X the open locus where the log structure is trivial, and for r ≥ 0, the period morphism α^FM_{r,n} : S_n(r)_X → i^* Rj_* Z/p^n(r)'_{X_tr} is defined, where Z_p(r)' := p^{−a(r)}Z_p(r) for r = (p − 1)a(r) + b(r) with 0 ≤ b(r) < p − 1. Locally on X = Spf R it is the composite of the quasi-isomorphisms Syn(R, r)_n → C(G_R, [F^r Ω_{E^PD} → Ω_{E^PD}]) ← C(G_R, [F^r A_cr(R)_n --(p^r − φ)--> A_cr(R)_n]) ← C(G_R, Z/p^n(r)'), the middle one by the crystalline Poincaré lemma and the last one by the fundamental exact sequence 0 → Z_p(r)' → F^r A_cr → A_cr. It is compatible with products and with the maps n → n − 1.

**Hypotheses.** X fs log-smooth over O_K^×; r ≥ 0; the normalisation of Z_p(r)' follows Colmez–Nizioł (Nekovář–Nizioł use (p^a a!)^{−1}Z_p(r), which agrees for r < p(p − 1)).

**Prerequisites.** `PadicHodgeRegulators:D.2/log-syntomic-complex`, `AInfCohomology:AI.4`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence`, `CrystallineCohomology:CR.2`, `PadicHodgeRegulators:L0/fundamental-exact-sequences`

**Proof or construction.**

1. A_cr and its filtration are imported (PadicHodgeTheory:R06.1/crystalline-period-ring; the relative rings A_cr(R) of small algebras are requested from AInfCohomology AI.4); the p^r-exact sequence 0 → Z_p(r)' → F^r A_cr → A_cr → 0 is the integral form of L0/fundamental-exact-sequences.
2. The crystalline Poincaré lemma (CrystallineCohomology CR.2, log version CR.5) identifies Galois cochains with values in the PD de Rham complex of the envelope with the A_cr complex.
3. Gluing the local maps on an étale cover and passing to the étale sheaf i^*Rj_* gives α^FM.

**API.**

- `fmkPeriodMap` (data): fmkPeriodMap X r n : S_n(r)_X ⟶ i^* Rj_* (ℤ/p^n)(r)'_{X_tr} in the derived category of étale sheaves on X_0.
- `fmkPeriodMap_local` (characterisation): On an affine small chart Spf R it is the composite of the Poincaré-lemma and fundamental-sequence quasi-isomorphisms.
- `fmkPeriodMap_mul` (structure): fmkPeriodMap is compatible with cup products S_n(r) ⊗ S_n(s) → S_n(r + s).
- `fmkPeriodMap_reduction` (relation): Compatible with the reduction maps n → n − 1 and with the completed versions.
- `fmkPeriodMap_degree_one` (example): For r = 1 on X = Spec O_K, it sends the syntomic class of u ∈ O_K^× to the Kummer class of u.

**Uses.** Colmez–Nizioł, Theorem 1.1: the period map whose kernel and cokernel are killed by p^N. PadicHodgeRegulators:D.2/small-twist-comparison: the Kato–Kurihara–Tsuji isomorphism in degrees i ≤ r ≤ p − 1. PadicHodgeRegulators:D.2/syntomic-exponential: composed with the syntomic exponential it gives the Bloch–Kato exponential.

**Unit tests.**

- `fmk_kummer` (computation): For X = Spec Z_p, r = 1, n = 1 and u = 1 + p, the image of the syntomic class of u is the Kummer class of 1 + p in H^1(Q_p, μ_p).
- `fmk_weight_zero` (degenerate): For r = 0, α^FM_{0,n} is the identification of S_n(0) with i^*Rj_*Z/p^n in degree 0 (both are Z/p^n on a connected X).
- `fmk_twist_normalisation` (compatibility): For r < p − 1, a(r) = 0 and Z_p(r)' = Z_p(r), so the Colmez–Nizioł and Nekovář–Nizioł normalisations coincide.
- `fmk_untwisted_fails` (non-example): For r = p − 1, the plain sequence 0 → Z_p(r) → F^r A_cr → A_cr → 0 is not exact on the left term's image; Z_p(p−1)' = p^{−1}Z_p(p−1) is needed.

**Acceptance.** For X = Spec O_K and r = 1, α^FM sends the syntomic class of a unit u to its Kummer class in H^1(K, Z/p^n(1)). α^FM is not defined with the plain twist Z_p(r) once r ≥ p − 1 without losing exactness; the twist Z_p(r)' is part of the definition.

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), §1, p. 2; [CN2017](https://arxiv.org/abs/1505.06471v4), §1, p. 2.

### Kato–Kurihara–Tsuji: the period map is an isomorphism for small twists

**Node** `PadicHodgeRegulators:D.2/small-twist-comparison` (theorem) (sub-layer `D.2:log-syntomic`). **Planet:** Kato–Kurihara–Tsuji comparison.

Let X be an fs log-scheme log-smooth over a henselian discrete valuation ring O_K of mixed characteristic (0, p). For integers i ≤ r ≤ p − 1 and n ≥ 1 the period map α^FM_{r,n} : H^i(S_n(r)_X) → i^* R^i j_* Z/p^n(r)_{X_tr} is an isomorphism (for r ≤ p − 2, Z_p(r)' = Z_p(r)). For general r, Colmez–Nizioł prove that the kernel and cokernel of α^FM_{r,n} on H^i, 0 ≤ i ≤ r, are killed by p^{Nr + c_p} if K contains enough roots of unity and by p^{N(e,p,r)} in general, for X semistable over O_K (or a base change of one). Consequently, for X proper and log-smooth over O_K^×, H^j_syn(X_{O_K̄}, r)_Q ≅ H^j_et(X_{tr,K̄}, Q_p(r)) for j ≤ r.

**Hypotheses.** X fs log-smooth over a henselian DVR of mixed characteristic; i ≤ r ≤ p − 1 for the exact statement (Nekovář–Nizioł use r ≤ p − 2, where both formulations agree). For the p^N statements, X semistable (or a base change of a semistable scheme) and 0 ≤ i ≤ r.

**Prerequisites.** `PadicHodgeRegulators:D.2/log-syntomic-complex`, `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex`

**Proof or construction.**

1. Classical range (Kato, Kurihara, Tsuji, as quoted by Colmez–Nizioł): the symbol map and the computation of nearby cycles by Bloch–Kato's filtration identify both sides in degrees i ≤ r ≤ p − 1.
2. General range (Colmez–Nizioł): locally, syntomic cohomology is p^{Nr}-quasi-isomorphic to τ_{≤ r} Galois cohomology through (φ, Γ)-modules (Herr complex, PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex) and a Lazard-type map, which agrees with α^FM up to p^{Nr + c_p}; then descent from K(ζ_{p^i}) and the K(π,1)-lemma.
3. The geometric rational corollary follows by passing to O_K̄ and inverting p.

**Acceptance.** X = Spec O_K (trivial log structure on X_tr = Spec K), i = r = 1 ≤ p − 1: H^1(S_n(1)) ≅ H^1(K, Z/p^n(1)) = K^×/p^n. Outside the small range the isomorphism can fail integrally; the statement is then only up to p^N.

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), §1, (1.3), p. 2; [CN2017](https://arxiv.org/abs/1505.06471v4), Theorem 1.1, p. 2.

### The syntomic exponential and the Bloch–Kato exponential

**Node** `PadicHodgeRegulators:D.2/syntomic-exponential` (theorem) (sub-layer `D.2:log-syntomic`).

Let X be a quasi-compact formal semistable scheme over O_K and r ≥ 1. There is a natural map α_{r,i} : H^{i−1}_dR(X_{K,tr}) → H^i_syn(X, r)_Q (the boundary of the syntomic fibre sequence, through the identification of crystalline cohomology modulo J^{[r]} with log de Rham cohomology modulo F^r), an isomorphism for i ≤ r − 1 and injective for i = r. For X proper semistable and 1 ≤ i ≤ r − 1, the composite α^FM ∘ α_{r,i} : D_dR(V_{i−1}) = H^{i−1}_dR(X_K) → H^1(G_K, V_{i−1}) ⊂ H^i_et(X_K, Q_p(r)), V_{i−1} := H^{i−1}_et(X_K̄, Q_p(r)), is the Bloch–Kato exponential of V_{i−1}. For X = Spec O_K and i = 1 this is the statement H^0_dR(K) = K → H^1_syn → H^1(K, Q_p(r)) equals exp_BK, used in D.2/syntomic-etale-regulator-comparison.

**Hypotheses.** X quasi-compact formal semistable over O_K; for the Bloch–Kato identification, X proper semistable and 1 ≤ i ≤ r − 1.

**Prerequisites.** `PadicHodgeRegulators:D.2/log-syntomic-complex`, `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`, `PadicHodgeRegulators:D.2/small-twist-comparison`, `PadicHodgeRegulators:L1/bloch-kato-exponential`, `CrystallineCohomology:CR.5`

**Proof or construction.**

1. Colmez–Nizioł Lemmas 3.14 and 3.17 identify crystalline cohomology modulo J^{[r]} with log de Rham cohomology modulo F^r; Proposition 3.12(ii) shows the Hyodo–Kato part is p^N-acyclic in degrees ≤ r − 1 (Corollary 3.16).
2. Composition with α^FM and comparison with the Bloch–Kato exponential: Colmez–Nizioł Corollary 1.4 / 5.11, citing Nekovář–Nizioł Proposition 4.13 (with the sign convention of their Remark 2.14).

**Acceptance.** X = Spec O_K, r = 2, i = 1: α_{2,1} : K → H^1_syn(O_K, 2)_Q is an isomorphism and α^FM ∘ α_{2,1} = exp_BK : K → H^1(K, Q_p(2)). For dim X_K ≥ 1 and i = r the cokernel of α^FM ∘ α_{r,r} can be very large; no surjectivity is asserted there.

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), Corollary 3.16, p. 37; [CN2017](https://arxiv.org/abs/1505.06471v4), §1, p. 3.

### Acceptance tests for D.2

- `r^ét_1(u)` is the Kummer class and `reg_syn(u) = log_p(u)` for units `u`.
- `reg_syn([ζ_m]_2) = ±Li₂(ζ_m) ∈ p²Z_p[ζ_m]` for `p ∤ m`, while the Gros value is a unit.
- For `X = Spec O_K`, `r = 2`, `i = 1`: the syntomic exponential composed with the period map is `exp_BK`.

## D.3. The unramified p > 3 theorem

Let `L` be a finite product of finite unramified extensions of `Q_p` and `p > 3`. `K₃(L; Z_p)` is the third homotopy group of the derived p-completion of `K(L)`, the product of the factors' groups, isomorphic to `H¹(L, Z_p(2))` by the étale Chern class, free of rank `[L : Q_p]`, and equal to the p-adic completion of Suslin's Bloch group `B(L)` (Milnor `K₃` of a local field is uniquely divisible, and `μ(L)` has order prime to p). The **p-adic regulator** `D_L := ε·log_BK ∘ c_{2,1}` is defined on the completed group, with the sign fixed by `D_L([ζ]) = Li₂(ζ)`. The **theorem**: `D_L : K₃(L; Z_p) ≅ p²O_L`. The image is exactly `p²O_L` by the integral Bloch–Kato logarithm in weight two (L1), which is where the proof of GSWZ Theorem 9 asserts a containment without argument; injectivity follows because the group is torsion-free. Independently, the values `p^{−2}Li₂(ζ)` at roots of unity of order prime to p span `O_L`: modulo p they are Kontsevich's finite polylogarithm `li_{2,p}(ζ)/(ζ − 1)^p`, whose fibres have at most `p − 2` points. Hence the classes `[ζ]` (all components ≠ 1, constructed through the valid integral multiples of `K3BlochGroups` V.6) generate `K₃(L; Z_p)`, and every class has a finite `Z_p`-presentation by them. The statement is not asserted for `p ∈ {2, 3}`, for ramified `L`, or for the uncompleted group `K₃(L)`.

**Dependencies.** `PadicHodgeRegulators:D.1`, `D.2`, `L1`; `KTheoryFiniteLocalFields:L.1`, `L.3`, `L.6`; `K3BlochGroups:V.2`, `V.3`, `V.4`, `V.6`; `GeneralAlgebraicKTheory:K.2`; `ColemanIntegration:L0`, `L2`.

### Finite unramified étale Q_p-algebras

**Node** `PadicHodgeRegulators:D.3/unramified-etale-algebra` (definition). **Declaration:** `IsUnramifiedEtaleAlgebra`.

A finite unramified étale Q_p-algebra is a Q_p-algebra L isomorphic to a finite product ∏_{i∈I} L_i of finite unramified field extensions L_i/Q_p; equivalently L ≅ W(k)[1/p] for a finite reduced F_p-algebra k = ∏_i F_{q_i} (Witt vectors of a finite product of finite fields), with k ≅ O_L/pO_L. Its ring of integers is O_L = ∏_i O_{L_i} = W(k), the integral closure of Z_p in L; its rank is [L : Q_p] = Σ_i [L_i : Q_p] = dim_{F_p} k; its Frobenius φ_L = ∏_i φ_{L_i} is the Witt-vector Frobenius W(Frob_k)[1/p]. For a number field F and a prime p unramified in F, F ⊗_Q Q_p ≅ ∏_{v|p} F_v is such an algebra, with O_F ⊗ Z_p = ∏_v O_v.

**Hypotheses.** p any prime; I finite (I = ∅ gives the zero algebra).

**Prerequisites.** `mathlib:WittVector`, `mathlib:WittVector.frobenius`, `mathlib:Algebra.FormallyUnramified`, `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`

**Proof or construction.**

1. A finite unramified extension of Q_p with residue field F_q is W(F_q)[1/p], and W commutes with finite products.
2. The Witt-vector Frobenius lifts x ↦ x^p, so it is the arithmetic Frobenius of D.1/unramified-frobenius-on-roots on each factor.
3. For p unramified in F, each completion F_v is unramified over Q_p, and the semilocal equivalence of NumberFieldArithmetic layer 5 identifies F ⊗ Q_p with ∏_v F_v.

**API.**

- `IsUnramifiedEtaleAlgebra` (structure): IsUnramifiedEtaleAlgebra p L : L is a finite product of finite unramified field extensions of ℚ_[p] (data: the factor decomposition up to isomorphism).
- `unramifiedEtaleAlgebra_equiv_witt` (equivalence): L ≃ₐ[ℚ_[p]] Localization.Away (p : WittVector p k) for k := O_L ⧸ p, a finite reduced 𝔽_p-algebra.
- `unramifiedEtaleAlgebra_rank` (characterisation): Module.finrank ℚ_[p] L = Module.finrank (ZMod p) k.
- `unramifiedEtaleAlgebra_frobenius` (data): The Frobenius φ_L : L ≃ₐ[ℚ_[p]] L induced by WittVector.frobenius on W(k); it fixes exactly ℚ_[p]^{#π_0} componentwise.
- `unramifiedEtaleAlgebra_prod` (instance): Finite products of unramified étale algebras are unramified étale.
- `unramifiedEtaleAlgebra_tensor_padic` (example): For a number field F and p unramified in F, F ⊗[ℚ] ℚ_[p] is unramified étale.

**Uses.** GSWZ §3.1, paragraph before Theorem 9: K_p ≅ ∏ Q_{p^{s_i}} and K_n(K_p) ≅ ∏ K_n(Q_{p^{s_i}}) for p unramified. PadicHodgeRegulators:D.3/completed-k3-unramified: the class of algebras whose completed K_3 the layer computes. HabiroNahmSeries:HB.9/followup-etale-module-contract: full quadratic étale algebras B_p = R_p[T]/(δT² − 1), including the split case, are of this form.

**Unit tests.**

- `unramified_rank_cubic` (computation): For F = Q(α), α³ − α² + 1 = 0 and p = 5, F ⊗ Q_5 is unramified étale of rank 3 with factors of residue degrees 2 and 1.
- `unramified_zero` (degenerate): The zero algebra (empty product, k = 0) is unramified étale of rank 0.
- `unramified_witt_compat` (compatibility): For k = F_q, the algebra W(F_q)[1/p] is the unramified extension Q_q of degree log_p q, and its Frobenius is Mathlib's WittVector.frobenius after inverting p.
- `unramified_not_qp_zeta_p` (non-example): For p odd, Q_p(ζ_p) is finite étale but not unramified: its residue field is F_p while its degree is p − 1, so it is not of the form W(k)[1/p].

**Acceptance.** K = Q(α), α³ − α² + 1 = 0, p = 5: K ⊗ Q_5 ≅ Q_{25} × Q_5 has rank 3 (GSWZ Example 4.3). Q_p(√p) and Q_p(ζ_p) (p odd) are finite étale but not unramified.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph before Theorem 9, p. 39.

### Completed K₃ of a finite unramified étale algebra

**Node** `PadicHodgeRegulators:D.3/completed-k3-unramified` (construction). **Declaration:** `completedK3`. **Planet:** Completed K₃ of an unramified p-adic algebra.

For a finite unramified étale Q_p-algebra L = ∏_i L_i put K_3(L; Z_p) := π_3 K(L; Z_p), the p-completed K-theory of KTheoryFiniteLocalFields:L.1/completed-k-theory. The projections induce K_3(L; Z_p) ≅ ∏_i K_3(L_i; Z_p) (finite products commute with K-theory and with derived p-completion), and K_3(O_L; Z_p) → K_3(L; Z_p) is an isomorphism. The étale Chern classes give c_L : K_3(L; Z_p) ≅ H^1(L, Z_p(2)) := ∏_i H^1(L_i, Z_p(2)). For p > 3, K_3(L; Z_p) is a free Z_p-module of rank [L : Q_p]; for p ∈ {2, 3} it has the nonzero torsion Z/w_2^{(p)}(L_i) on each factor.

**Hypotheses.** L finite unramified étale over Q_p (D.3/unramified-etale-algebra); freeness needs p > 3.

**Prerequisites.** `PadicHodgeRegulators:D.3/unramified-etale-algebra`, `KTheoryFiniteLocalFields:L.1/completed-k-theory`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `KTheoryFiniteLocalFields:L.6/completed-k3-of-unramified-fields`, `KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1`, `KTheoryFiniteLocalFields:L.6/ring-of-integers-versus-field`

**Proof or construction.**

1. Product comparison: K_n(R × S) ≅ K_n(R) × K_n(S) (GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring (ii)); mod p^ν coefficients and the homotopy limit defining K(−; Z_p) commute with finite products.
2. On each factor, KTheoryFiniteLocalFields:L.6/completed-k3-of-unramified-fields gives K_3(O_{L_i}; Z_p) ≅ K_3(L_i; Z_p) ≅ H^1(L_i, Z_p(2)) ≅ Z_p^{[L_i:Q_p]} ⊕ Z/w_2^{(p)}(L_i), with w_2^{(p)} = 1 for p ≥ 5.
3. The Chern isomorphism is natural, so it is compatible with the product decomposition.

**API.**

- `completedK3` (data): completedK3 p L := π_3 K(L; ℤ_p), a ℤ_[p]-module.
- `completedK3_prodEquiv` (equivalence): completedK3 p (∏ i, L i) ≃ₗ[ℤ_[p]] ∏ i, completedK3 p (L i).
- `completedK3_integers_equiv` (equivalence): completedK3 p O_L ≃ₗ[ℤ_[p]] completedK3 p L, induced by O_L → L.
- `completedK3_chernEquiv` (equivalence): completedK3 p L ≃ₗ[ℤ_[p]] H^1(L, ℤ_p(2)), componentwise étale Chern class c_{2,1}.
- `completedK3_free` (characterisation): For p > 3, Module.Free ℤ_[p] (completedK3 p L) and Module.finrank = [L : ℚ_[p]].
- `completedK3_map` (functoriality): A ℚ_[p]-algebra map f : L → L' induces completedK3 p L → completedK3 p L', with map_id and map_comp; the Frobenius φ_L acts by functoriality.
- `completedK3_transfer` (functoriality): For L → L' finite free, a transfer completedK3 p L' → completedK3 p L, corresponding to corestriction under the Chern isomorphisms.

**Uses.** GSWZ Theorem 9, (183): the source of the isomorphism D_p : K_3(K_p; Z_p) → p²O_{K_p}. PadicHodgeRegulators:D.4/global-p-adic-regulator: the target of the localisation map λ_{F,3} from global K_3. HabiroNumberFields:HB.7/pochhammer-sections: ξ̂ ∈ K_3(K_p) ⊗ Z_p is presented by roots of unity in this group.

**Unit tests.**

- `completedK3_rank_cubic` (computation): For p = 5 and L = Q_{25} × Q_5, completedK3 5 L is free of rank 3.
- `completedK3_zero` (degenerate): completedK3 p 0 = 0 for the zero algebra.
- `completedK3_chern_compat` (compatibility): For L = Q_p the Chern isomorphism agrees with KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1 at i = 2.
- `completedK3_three_torsion` (non-example): For p = 3, completedK3 3 Q_3 has torsion Z/3 (w_2^{(3)}(Q_3) = 3), so it is not free and no injective map to a torsion-free lattice exists.

**Acceptance.** For p = 5 and L = Q_{25} × Q_5, K_3(L; Z_5) ≅ Z_5³. For p = 3 and L = Q_3, K_3(Q_3; Z_3) ≅ Z_3 ⊕ Z/3: the freeness clause fails at p = 3.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Theorem 9, p. 39.

### Completed K₃ of an unramified field is the completed Bloch group

**Node** `PadicHodgeRegulators:D.3/completed-k3-bloch-description` (theorem).

Let L be a finite unramified extension of Q_p with p ≥ 3. For every ν ≥ 1 the natural maps K_3(L)/p^ν → K_3^ind(L)/p^ν → B(L)/p^ν are isomorphisms (B(L) Suslin's Bloch group), and the completion map identifies K_3(L; Z_p) with lim_ν K_3(L)/p^ν ≅ lim_ν B(L)/p^ν =: B(L)^∧_p. In particular the image of B(L) — more precisely of K_3(L), which surjects onto every B(L)/p^ν — is dense in K_3(L; Z_p), and the kernel of K_3(L) → K_3(L; Z_p) is ⋂_ν p^ν K_3(L). For a finite product L = ∏ L_i the statements hold factorwise.

**Hypotheses.** L/Q_p finite unramified and p odd, so that μ(L) has order prime to p and ζ_p ∉ L.

**Prerequisites.** `KTheoryFiniteLocalFields:L.6/completion-exact-sequence`, `KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields`, `KTheoryFiniteLocalFields:L.3/moore-theorem`, `KTheoryFiniteLocalFields:L.6/finite-coefficient-lichtenbaum-quillen`, `K3BlochGroups:V.6/comparison-finite-coefficients`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.2/k3-indecomposable`

**Proof or construction.**

1. K_3^M(L) is uniquely divisible (KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields), so K_3(L)/p^ν = K_3^ind(L)/p^ν.
2. Suslin's sequence reduced mod p^ν (K3BlochGroups:V.6/comparison-finite-coefficients): K_3^ind(L)/p^ν → B(L)/p^ν is onto with kernel the image of μ̃(L)/p^ν, which vanishes because μ(L) has order prime to p and the enhancement is 2-primary.
3. The finite-coefficient groups are finite (L.6/finite-coefficient-lichtenbaum-quillen), so L.6/completion-exact-sequence gives 0 → lim_ν K_3(L)/p^ν → K_3(L; Z_p) → T_p K_2(L) → 0; Moore's theorem K_2(L) ≅ μ(L) ⊕ (divisible) with the divisible part uniquely divisible gives T_p K_2(L) = 0.
4. This also supplies the input K_3^M(L)/p^ν = 0 that K3BlochGroups:V.6/regulator-agreement-padic records as missing.

**Acceptance.** For L = Q_5: K_3(Q_5; Z_5) ≅ Z_5 ≅ lim_ν B(Q_5)/5^ν. For p odd and L = Q_p(ζ_p) (ramified, μ_p ⊂ L) the first map's kernel contains the image of μ̃(L)/p ≠ 0: the hypothesis ζ_p ∉ L is used.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Theorem 9, p. 39.

### Kontsevich's finite polylogarithm

**Node** `PadicHodgeRegulators:D.3/finite-polylogarithm` (definition). **Declaration:** `finitePolylog`.

For a prime p and n ∈ Z, the finite polylogarithm is the polynomial li_{n,p}(x) := Σ_{k=1}^{p−1} x^k / k^n ∈ F_p[x] (equivalently its lift with coefficients in Z_(p)). It has degree p − 1 (for p > 2), constant term 0, and satisfies x·li'_{n,p}(x) = li_{n−1,p}(x); li_{n,p}(1) = Σ_{k=1}^{p−1} k^{−n} ≡ 0 mod p exactly when (p − 1) ∤ n. In particular for p > 3: li_{2,p}(1) ≡ 0 and li'_{2,p}(1) = li_{1,p}(1) ≡ 0 mod p, so (x − 1)² divides li_{2,p}(x) in F_p[x].

**Hypotheses.** p prime; n ∈ Z (negative n allowed, k^{−n} = k^{|n|}).

**Prerequisites.** `mathlib:Polynomial`, `mathlib:ZMod`

**Proof or construction.**

1. The power sums Σ_{k=1}^{p−1} k^m vanish mod p unless (p − 1) | m (sum over the cyclic group F_p^×).
2. x·d/dx(x^k/k^n) = x^k/k^{n−1} gives the differential relation; for n = 2 and p > 3, (p − 1) ∤ 2 and (p − 1) ∤ 1.

**API.**

- `finitePolylog` (data): finitePolylog p n : Polynomial (ZMod p) := Σ_{k=1}^{p−1} C ((k : ZMod p)^n)⁻¹ * X^k.
- `finitePolylog_eval_zero` (simp): (finitePolylog p n).eval 0 = 0.
- `finitePolylog_derivative` (relation): X * derivative (finitePolylog p n) = finitePolylog p (n − 1).
- `finitePolylog_eval_one` (characterisation): (finitePolylog p n).eval 1 = 0 ↔ ¬ (p − 1 ∣ n).
- `finitePolylog_two_rootMultiplicity_one` (relation): For 5 ≤ p, (X − 1)² ∣ finitePolylog p 2.
- `finitePolylog_natDegree` (characterisation): For 2 < p, (finitePolylog p n).natDegree = p − 1.

**Uses.** GSWZ §3.1, (177)–(180): the reduction of p^{−2}D_p at roots of unity is li_{2,p}(ζ)/(ζ − 1)^p, and its fibres are bounded by p − 2. PadicHodgeRegulators:D.3/residue-spanning: the counting argument for the spanning of the residue space. ColemanIntegration:L2/values-at-tame-roots-of-unity: part (c) expresses p^{−k}Li_k(ζ) modulo p through li_{k,p}.

**Unit tests.**

- `finitePolylog_five_two` (computation): (finitePolylog 5 2).eval 2 = 1 in ZMod 5.
- `finitePolylog_one_index` (degenerate): finitePolylog p 0 = Σ_{k=1}^{p−1} X^k, the truncated geometric series.
- `finitePolylog_compat_coleman` (compatibility): For ζ ∈ μ(Q_{p^s}) ∖ {1} of order prime to p, the reduction of p^{−2}Li_2(ζ^p) is −li_{2,p}(ζ̄)/(1 − ζ̄)^p, the form of ColemanIntegration:L2/values-at-tame-roots-of-unity (c).
- `finitePolylog_three_non_example` (non-example): (finitePolylog 3 2).eval 1 = 2 ≠ 0 in ZMod 3, so the factorisation li_{2,p} = (x − 1)² g_p fails at p = 3.

**Acceptance.** li_{2,5}(2) = 2 + 1 + 2 + 1 = 1 in F_5. li_{2,3}(1) = 1 + 1/4 = 2 ≠ 0 in F_3: the double-root property fails at p = 3.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (177), p. 38; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Proposition 3.3, (180), p. 38.

### Reduction of the p-adic dilogarithm at roots of unity

**Node** `PadicHodgeRegulators:D.3/finite-polylogarithm-reduction` (lemma).

Let p be odd, L an unramified extension of Q_p and ζ ∈ μ(L) ∖ {1}. Then D_L(ζ) = Li_2(ζ) ∈ p²O_L and p^{−2}D_L(ζ^p) ≡ li_{2,p}(ζ̄)/(ζ̄ − 1)^p mod p, where ζ̄ ∈ k_L^× is the residue of ζ. Equivalently, with σ(ζ) the root of unity with σ(ζ)^p = ζ, p^{−2}D_L(ζ) ≡ li_{2,p}(σ(ζ)‾)/(σ(ζ)‾ − 1)^p. Componentwise the same holds for a finite unramified product L and ζ ∈ μ(L) with all components ≠ 1.

**Hypotheses.** p odd, so every ζ ∈ μ(L) has order prime to p (L unramified).

**Prerequisites.** `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`, `PadicHodgeRegulators:D.3/finite-polylogarithm`

**Proof or construction.**

1. log_p(ζ) = 0, so D_L(ζ) = Li_2(ζ); ColemanIntegration:L2/values-at-tame-roots-of-unity (b) gives Li_2(ζ) ∈ p²Z_p[ζ] ⊆ p²O_L.
2. Part (c) of the same node: p^{−2}Li_2(ζ^p) ≡ −li_{2,p}(ζ̄)/(1 − ζ̄)^p mod p, and −(1 − ζ̄)^p = (ζ̄ − 1)^p for p odd.

**Acceptance.** p = 5, ζ = ω(2) ∈ Q_5 (so ζ^5 = ζ): 25^{−1}D(ζ) ≡ li_{2,5}(2) = 1 mod 5, matching the Q_5-component of D_5(ζ_24) in GSWZ (273). For p = 2 and ζ = −1, ζ^p = 1 and D(1) is undefined: the printed statement of GSWZ Proposition 3.2 needs ζ^p ≠ 1.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proposition 3.2, (178), p. 38.

### p²-integrality of the dilogarithm on special units

**Node** `PadicHodgeRegulators:D.3/dilogarithm-integrality` (lemma).

Let p > 3 and let L be a finite unramified étale Q_p-algebra. If z ∈ O_L satisfies z ∈ O_L^× and 1 − z ∈ O_L^× in every factor (z is a special unit), then D_L(z) ∈ p²O_L. This is GSWZ Lemma 3.1 for R^∧_p = O_{K_p}.

**Hypotheses.** p > 3; L unramified (each factor); z and 1 − z units in every factor.

**Prerequisites.** `PadicHodgeRegulators:D.3/finite-polylogarithm-reduction`, `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`, `ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity`, `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `ColemanIntegration:L0/log-one-add-convergence`

**Proof or construction.**

1. Write z = ζ·(1 + x) with ζ = ω(z̄) and x ∈ pO_L (D.1/teichmuller-unit-decomposition); z̄ ≠ 1 because 1 − z is a unit, so ζ ≠ 1.
2. Expand D(ζ(1 + x)) in x around ζ (ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity): the constant term Li_2(ζ) lies in p²O; the first-order coefficients involve Li_1(ζ) ∈ pO and log(1 + x) ∈ pO; the higher Taylor coefficients have denominators k with v_p(x^k/k) ≥ k − v_p(k) ≥ 2 for k ≥ 2, using p > 3 and e = 1.
3. Each factor of L is treated separately.

**Acceptance.** z = ω(2) ∈ Z_5 (a special unit): D(z) ∈ 25Z_5. z = p is not a unit and D^0(p) = Li_2(p) ≡ p mod p², so the unit hypothesis cannot be dropped. z = 1 + p has 1 − z = −p not a unit; the lemma does not apply there.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Lemma 3.1 and proof, (175), p. 38.

### Dilogarithms of roots of unity span the residue space

**Node** `PadicHodgeRegulators:D.3/residue-spanning` (theorem).

Let p > 3. (a) For every s ≥ 1, Span_{Z_p}{p^{−2}D(ζ) : ζ ∈ μ(Q_{p^s}) ∖ {1}} = Z_{p^s}. (b) For every s ≥ 1 also Span_{Z_p}{p^{−2}(D(ζ) − D(ζ')) : ζ, ζ' ∈ μ(Q_{p^s}) ∖ {1}} = Z_{p^s}. (c) Consequently, for a finite unramified product L = ∏_i Q_{p^{s_i}}, Span_{Z_p}{p^{−2}D_L(ζ) : ζ ∈ μ(L) with every component ≠ 1} = O_L. Statement (a) is GSWZ Proposition 3.3 with ζ = 1 excluded; (b) and (c) are needed for products once components equal to 1 are excluded.

**Hypotheses.** p > 3 (the argument uses li_{2,p}(1) ≡ li'_{2,p}(1) ≡ 0 mod p). s ≥ 1; L a finite product of unramified extensions of Q_p.

**Prerequisites.** `PadicHodgeRegulators:D.3/finite-polylogarithm`, `PadicHodgeRegulators:D.3/finite-polylogarithm-reduction`, `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`, `mathlib:Submodule.span`, `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`

**Proof or construction.**

1. By Nakayama it suffices to work modulo p (Lean forms: residueSpanning_mod_p, residueSpanning_differences_mod_p, span_eq_top_of_card_gt, residueDilogReduction_fibre_card). Put f_p(x) = li_{2,p}(x)/(x − 1)^p = g_p(x)/(x − 1)^{p−2} with deg g_p ≤ p − 3 (D.3/finite-polylogarithm); then every fibre of f_p : F_{p^s} ∖ {1} → F_{p^s} has at most p − 2 points.
2. Hence #image(f_p) ≥ (p^s − 1)/(p − 2) > p^{s−1}; a subset of F_{p^s} with more than p^{s−1} elements is not contained in a proper F_p-subspace, so it spans; the same applies to image(f_p) − c for any c ∈ image(f_p), which proves (b).
3. ζ ↦ ζ^p permutes μ(Q_{p^s}) ∖ {1} and D(ζ^p) = φ(D(ζ)) (D.1/dilogarithm-scalar-extension), so the reductions of p^{−2}D(ζ) run over φ-twists of image(f_p); D.3/finite-polylogarithm-reduction identifies them.
4. (c): fixing all components but one and subtracting, (b) produces p²Z_{p^{s_i}} in the i-th factor and 0 elsewhere.

**Acceptance.** p = 5, s = 1: the four values 25^{−1}D(ζ), ζ ∈ μ_4 ∖ {1}, are not all ≡ 0 mod 5 (25^{−1}D(ω(2)) ≡ 1). p = 5 and L = Q_{25} × Q_5: the three values p^{−2}D_L(ζ_24), p^{−2}D_L(ζ_24²), p^{−2}D_L(ζ_24⁶) of GSWZ (273) (second line relabelled, GSWZ E56) form a Z_5-basis of O_L, as (274) presupposes. At p = 3 the factorisation of li_{2,3} fails (li_{2,3}(1) = 2), so the fibre bound and the proof do not apply.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proposition 3.3 and proof, (179)–(182), pp. 38–39; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Proposition 3.3, (182), p. 39.

### Root-of-unity classes in completed K₃

**Node** `PadicHodgeRegulators:D.3/root-of-unity-classes` (construction). **Declaration:** `rootClassK3`.

Let p be odd, L a finite unramified étale Q_p-algebra and ζ ∈ μ(L) a root of unity of order m (prime to p) all of whose components are ≠ 1. Define [ζ]_L ∈ K_3(L; Z_p) as the image, under B(L) ⊗ Z_p → lim_ν B(L)/p^ν ≅ K_3(L; Z_p) (D.3/completed-k3-bloch-description, factorwise), of the Z_p-coefficient class ⟦ζ⟧ = m^{−1} ⊗ m[ζ] of K3BlochGroups:V.6/root-of-unity-class (iii) (componentwise; m[ζ] ∈ B(L) by K3BlochGroups:V.6/integral-root-multiple). This is the class GSWZ denote [ζ]: when ζ ∧ (1 − ζ) = 0 in Suslin's antisymmetric square (always the case after ⊗ Z_p, p odd), [ζ]_L is the image of [ζ] ∈ B(L), and GSWZ's ord(ζ)·D_p(ζ) is the regulator of the integral multiple m[ζ].

**Hypotheses.** p odd; L unramified (so ord(ζ) is prime to p); every component of ζ differs from 1 (GSWZ E38).

**Prerequisites.** `K3BlochGroups:V.6/root-of-unity-class`, `K3BlochGroups:V.6/integral-root-multiple`, `K3BlochGroups:V.6/root-of-unity-symbol`, `K3BlochGroups:V.3/angle-bracket-two-torsion`, `PadicHodgeRegulators:D.3/completed-k3-bloch-description`, `PadicHodgeRegulators:D.3/completed-k3-unramified`

**Proof or construction.**

1. m is a unit in Z_p, so m^{−1} ⊗ m[ζ] is defined in B(L) ⊗ Z_p and is independent of the representative m (K3BlochGroups:V.6/root-of-unity-class).
2. The completion map B(L) ⊗ Z_p → B(L)^∧_p composed with D.3/completed-k3-bloch-description gives the class in K_3(L; Z_p); on a product it is taken factorwise.
3. ζ ∧ (1 − ζ) is 2-torsion in Suslin's antisymmetric square of each factor (the principal-unit part of 1 − ζ is uniquely (q − 1)-divisible), so after ⊗ Z_p the raw symbol [ζ] already lies in B(L) ⊗ Z_p and agrees with ⟦ζ⟧.

**API.**

- `rootClassK3` (data): rootClassK3 L ζ : completedK3 p L, for ζ a root of unity of L with all components ≠ 1.
- `rootClassK3_eq_bloch` (compatibility): rootClassK3 L ζ is the image of K3BlochGroups' rootClassPadic ζ under B(L) ⊗ ℤ_p → completedK3 p L.
- `rootClassK3_prod` (simp): For L = ∏ L_i, rootClassK3 L ζ = (rootClassK3 L_i ζ_i)_i.
- `rootClassK3_map` (functoriality): For a ℚ_p-algebra map f : L → L', completedK3 map sends rootClassK3 L ζ to rootClassK3 L' (f ζ); in particular φ_L(rootClassK3 ζ) = rootClassK3 (ζ^p).
- `rootClassK3_inv` (relation): rootClassK3 L ζ⁻¹ = −rootClassK3 L ζ.
- `rootClassK3_mul_ord` (relation): ord(ζ) • rootClassK3 L ζ is the image of the integral Bloch element m[ζ].

**Uses.** GSWZ Theorem 9, (183), and Example 4.3, (275): K_3(K_p; Z_p) is generated by the [ζ]; ξ = c_1[ζ_24] + c_2[ζ_24²] + c_3[ζ_24⁶]. HabiroNumberFields:HB.7/followup-integral-linear-jet: a valid finite presentation ξ̂ = Σ a_ζ[ζ] with a_ζ ∈ Z_p and ζ ≠ 1 of order prime to p. HabiroNumberFields:HB.7/pochhammer-sections: the sections Ψ_{[ζ]} are attached to these classes.

**Unit tests.**

- `rootClassK3_neg_one` (computation): For p > 3, rootClassK3 Q_p (−1) = 0.
- `rootClassK3_order_two_product` (degenerate): For L = Q_p × Q_p and ζ = (−1, −1), rootClassK3 L ζ = 0, the product of two zero classes.
- `rootClassK3_bloch_compat` (compatibility): When ζ ∧ (1 − ζ) = 0 in Suslin's antisymmetric square (K3BlochGroups:V.6/root-of-unity-symbol), rootClassK3 L ζ is the image of [ζ] ∈ B(L).
- `rootClassK3_component_one` (non-example): For p = 5, L = Q_{25} × Q_5 and ζ = ζ_24^4 (Q_5 component 1), the class is not defined: the raw symbol [1] is not a Bloch-group generator and D(1) is undefined (GSWZ E38).

**Acceptance.** [−1]_{Q_p} = 0 for p > 3: the integral multiple 2[−1] = ⟨−1⟩ lies in B(Q_p) and is 2-torsion (K3BlochGroups:V.3/angle-bracket-two-torsion), so ⟦−1⟧ = 2^{−1} ⊗ 2[−1] = 0 in B(Q_p) ⊗ Z_p. A ζ with a component equal to 1 (for instance ζ_24^4 ∈ Q_{25} × Q_5 at p = 5, whose Q_5 component is 1) is rejected.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9 and proof, p. 39.

### The p-adic regulator on completed K₃

**Node** `PadicHodgeRegulators:D.3/local-regulator` (construction). **Declaration:** `localRegulator`. **Planet:** p-adic regulator on completed K₃.

For a finite étale Q_p-algebra L = ∏ L_i (any p; L_i/Q_p finite) define D_L : K_3(L; Z_p) → L as the composite of the étale Chern isomorphism K_3(L; Z_p) ≅ H^1(L, Z_p(2)) (componentwise, D.2/etale-regulator), the inclusion into H^1(L, Q_p(2)) and the Bloch–Kato logarithm log_BK : H^1(L, Q_p(2)) ≅ D_dR(Q_p(2)) = L·e_2 ≅ L (L1/bloch-kato-logarithm, e_2 = t^{−2} ⊗ ε^{⊗2}), multiplied by the sign ε ∈ {±1} fixed so that D_L([ζ]_L) = +D_L(ζ) = +Li_2(ζ) on root-of-unity classes. By D.2/syntomic-etale-regulator-comparison, D_L = ε·reg_syn (Besser's normalisation) on the image of K_3(O_L), and by D.2/weight-two-dilogarithm-comparison D_L agrees with the dilogarithm D_L of D.1 on Bloch elements presented by special units of O_L. This is GSWZ's D_p of (19) and (183), defined on the completed group.

**Hypotheses.** L finite étale over Q_p; integrality and bijectivity statements are D.3/unramified-regulator-theorem (p > 3, L unramified).

**Prerequisites.** `PadicHodgeRegulators:D.3/completed-k3-unramified`, `PadicHodgeRegulators:D.2/etale-regulator`, `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`, `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.3/root-of-unity-classes`, `PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`

**Proof or construction.**

1. The Chern isomorphism and log_BK are Z_p-linear and continuous; their composite is defined on the completed group, which repairs the definitional gap recorded as GSWZ E39.
2. For roots of unity of order prime to p, ζ is a special unit, so D.2/weight-two-dilogarithm-comparison gives log_BK(c_{2,1}[ζ]_L) = ±Li_2(ζ); this fixes ε (the sign is the single sign of de Jeu's map).
3. The identification with Besser's syntomic regulator is D.2/syntomic-etale-regulator-comparison at n = 2.

**API.**

- `localRegulator` (data): localRegulator L : completedK3 p L →ₗ[ℤ_[p]] L.
- `localRegulator_eq_logBK` (characterisation): localRegulator L = ε • (logBK ∘ chernEquiv) with ε = ±1 the pinned sign.
- `localRegulator_rootClass` (simp): localRegulator L (rootClassK3 L ζ) = etaleDilog L ζ (= (Li_2(ζ_i))_i).
- `localRegulator_specialUnits` (compatibility): On the image of a Bloch element Σ n_i [x_i] with x_i special units of O_L, localRegulator = Σ n_i etaleDilog L x_i.
- `localRegulator_map` (functoriality): For a ℚ_p-algebra map f : L → L', localRegulator L' ∘ completedK3.map f = f ∘ localRegulator L; in particular localRegulator commutes with φ_L.
- `localRegulator_transfer` (functoriality): For L → L' finite free, localRegulator L ∘ transfer = Tr_{L'/L} ∘ localRegulator L'.
- `localRegulator_prod` (simp): On L = ∏ L_i, localRegulator is the product of the factor regulators.

**Uses.** GSWZ (19), (22) and Theorem 9: the p-adic regulator D_p entering the formal completion of invertible sections and the local K_3 calculation. PadicHodgeRegulators:D.4/global-p-adic-regulator: applied after the localisation map from global K_3. K3BlochGroups:V.6/regulator-agreement-padic: the p-adic regulator compared with the Bloch-group model modulo p^m.

**Unit tests.**

- `localRegulator_q5_root` (computation): localRegulator Q_5 (rootClassK3 Q_5 (teichmuller 2)) ≡ 25 mod 125.
- `localRegulator_zero_algebra` (degenerate): localRegulator 0 = 0.
- `localRegulator_syntomic_compat` (compatibility): On the image of K_3(O_L), localRegulator = ε·syntomicRegulator (D.2/syntomic-regulator) with n = 2.
- `localRegulator_not_gros` (non-example): For L = Q_5, the Gros-normalised map (1 − 5^{−2})·localRegulator sends rootClassK3 (teichmuller 2) to a unit, so it is not localRegulator and does not have image 25Z_5.

**Acceptance.** L = Q_5: D_L([ω(2)]) ≡ 25 mod 125. On the zero algebra D_L = 0. D_L is not the Gros-normalised map: (1 − σ/p²)∘D_L has image O_L, not p²O_L, for L unramified and p > 3.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §1.5, (19), p. 9; [HK2011](https://arxiv.org/abs/math/0612611v1), Theorem 1.3.2 and Proposition 2.3.4, pp. 9 and 16.

### The unramified p > 3 theorem

**Node** `PadicHodgeRegulators:D.3/unramified-regulator-theorem` (theorem). **Planet:** Unramified K₃ regulator theorem.

Let p > 3 and let L be a finite unramified étale Q_p-algebra (for instance K_p = K ⊗ Q_p for a number field K in which p is unramified). Then the p-adic regulator is a Z_p-linear isomorphism D_L : K_3(L; Z_p) ≅ p²O_L. The statement is not asserted for p ∈ {2, 3}, for ramified L, or for the uncompleted group K_3(L).

**Hypotheses.** p > 3; L a finite product of finite unramified extensions of Q_p.

**Prerequisites.** `PadicHodgeRegulators:D.3/local-regulator`, `PadicHodgeRegulators:D.3/completed-k3-unramified`, `PadicHodgeRegulators:L1/integral-logarithm-unramified`, `PadicHodgeRegulators:D.3/residue-spanning`, `PadicHodgeRegulators:D.3/root-of-unity-classes`, `mathlib:Module.Free`, `mathlib:OrzechProperty`

**Proof or construction.**

1. Structure: K_3(L; Z_p) ≅ H^1(L, Z_p(2)) is free of rank [L : Q_p] (D.3/completed-k3-unramified).
2. Image: log_BK(H^1(L, Z_p(2))) = 1!·p²O_L·e_2 = p²O_L because 2 ≤ p − 2 (L1/integral-logarithm-unramified). Hence D_L(K_3(L; Z_p)) = p²O_L, and D_L is injective on the torsion-free group since log_BK is injective. This supplies the containment and the extension to the completed group that GSWZ's proof asserts without proof (GSWZ E39).
3. Independent check of the image from below: D_L([ζ]_L) = Li_2(ζ) and these span p²O_L (D.3/residue-spanning (c)).
4. Alternatively, from the two inclusions p²O_L ⊆ image ⊆ p²O_L, a surjection between free Z_p-modules of the same finite rank is injective (Orzech property of commutative rings; Lean form unramifiedRegulator_injective_of_surjective).

**Acceptance.** L = Q_{25} × Q_5 (p = 5, GSWZ Example 4.3): K_3(L; Z_5) ≅ 25·(Z_{25} × Z_5). L = Q_5: the generator [ω(2)] maps to an element of valuation exactly 2. p = 3, L = Q_3: K_3(Q_3; Z_3) ≅ Z_3 ⊕ Z/3 has torsion, so no injection into 9Z_3 exists; the theorem does not apply. L = Q_p(ζ_p), p odd (ramified): K_3(L; Z_p) has torsion Z/p, so the theorem does not apply.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9, (183), p. 39; [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), Lemme 1.3.2, p. 647.

### Completed K₃ is generated by roots of unity

**Node** `PadicHodgeRegulators:D.3/roots-of-unity-generate` (theorem). **Planet:** Roots of unity generate completed K₃.

Let p > 3 and L a finite unramified étale Q_p-algebra. Then K_3(L; Z_p) is generated as a Z_p-module by the classes [ζ]_L, ζ ∈ μ(L) with every component ≠ 1; every ξ ∈ K_3(L; Z_p) has a finite presentation ξ = Σ_ζ a_ζ[ζ]_L with a_ζ ∈ Z_p, and for any such presentation D_L(ξ) = Σ_ζ a_ζ Li_2(ζ). Presentations are not unique; D_L(ξ) is.

**Hypotheses.** p > 3; L unramified; ζ ranges over roots of unity with all components ≠ 1 (GSWZ E38).

**Prerequisites.** `PadicHodgeRegulators:D.3/unramified-regulator-theorem`, `PadicHodgeRegulators:D.3/residue-spanning`, `PadicHodgeRegulators:D.3/root-of-unity-classes`, `PadicHodgeRegulators:D.3/local-regulator`

**Proof or construction.**

1. D_L is an isomorphism onto p²O_L (D.3/unramified-regulator-theorem) and D_L([ζ]_L) = Li_2(ζ) (D.3/local-regulator).
2. The Li_2(ζ) span p²O_L (D.3/residue-spanning (c), which also handles products once components equal to 1 are excluded); pulling back along D_L gives generation.
3. Linearity of D_L gives the value on any presentation.

**Acceptance.** p = 5, L = Q_{25} × Q_5: [ζ_24], [ζ_24²], [ζ_24⁶] form a Z_5-basis, as GSWZ (274)–(275) use. For L = Q_5 the single class [ω(2)] generates K_3(Q_5; Z_5) ≅ Z_5.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9, p. 39.

### Acceptance tests for D.3

- `K₃(Q_{25} × Q_5; Z_5) ≅ 25·(Z_{25} × Z_5)` (GSWZ Example 4.3).
- `li_{2,5}(2) = 1`, so `25^{−1}D(ω(2)) ≡ 1 mod 5`.
- At `p = 3`, `K₃(Q_3; Z_3)` has torsion `Z/3` and `li_{2,3}(1) = 2 ≠ 0`; the theorem does not apply.
- For `L = Q_p(ζ_p)` the group has torsion; the theorem does not apply.

## D.4. Arithmetic localisation and Frobenius

For a number field `F` and a prime `p`, the **global p-adic regulator** is `D_{F,p} := D_{F⊗Q_p} ∘ λ_{F,p} : K₃(F) → F ⊗ Q_p`, with `λ_{F,p}` the semilocal completion map of `KTheoryFiniteLocalFields` L.7. It kills torsion; for `p > 3` unramified its image lies in `p²(O_F ⊗ Z_p)` and every class has a presentation by roots of unity. On classes whose Bloch image is presented by special units at p it is the combined dilogarithm `Σ n_i D_{F,p}([z_i])` (Besser–de Jeu, Theorem 1.10), which for a fixed presentation covers all but finitely many p and, for `R = O_F[1/Δ]`-units, every `p ∤ Δ`. It is compatible with restriction and transfer (trace), with Frobenius (`D_p(φ_p ξ) = φ_p D_p(ξ)`) and with automorphisms of `F`; classes with denominator `N` have regulator in `p^{2−v_p(N)}(O_F ⊗ Z_p)`. The regulator is exported to Habiro-module gluing in exactly the normalisation of GSWZ (19) and (22). Injectivity of `D_{F,p} ⊗ Q` is a separate proposition about `F` and `p`, which nothing here proves and nothing here uses.

**Dependencies.** `PadicHodgeRegulators:D.3`, `D.2`, `D.1`, `L1`; `KTheoryFiniteLocalFields:L.7`; `ArithmeticKTheory:N.5`; `K3BlochGroups:V.2`, `V.5`, `V.6`; NumberFieldArithmetic layer 5.

### The global p-adic K₃ regulator

**Node** `PadicHodgeRegulators:D.4/global-p-adic-regulator` (construction). **Declaration:** `globalPadicRegulator`. **Planet:** Global p-adic K₃ regulator.

Let F be a number field and p a prime. The global p-adic regulator is D_{F,p} := D_{F⊗Q_p} ∘ λ_{F,p} : K_3(F) → F ⊗_Q Q_p ≅ ∏_{v|p} F_v, where λ_{F,p} : K_3(F) → ∏_{v|p} K_3(F_v; Z_p) = K_3(F ⊗ Q_p; Z_p) is the semilocal completed map of KTheoryFiniteLocalFields:L.7/semilocal-completed-map and D_{F⊗Q_p} is the regulator of D.3/local-regulator. It kills the torsion subgroup of K_3(F) and induces D_{F,p} ⊗ Q : K_3(F) ⊗ Q → F ⊗ Q_p; for p > 3 unramified in F its image lies in p²(O_F ⊗ Z_p).

**Hypotheses.** F a number field, p any prime; the integrality clause needs p > 3 unramified in F.

**Prerequisites.** `KTheoryFiniteLocalFields:L.7/semilocal-completed-map`, `PadicHodgeRegulators:D.3/local-regulator`, `PadicHodgeRegulators:D.3/unramified-regulator-theorem`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `ArithmeticKTheory:N.5/totally-imaginary-integral-structure`

**Proof or construction.**

1. λ_{F,p} is the product of the completion maps c_v followed by p-completion; under the semilocal equivalence F ⊗ Q_p ≅ ∏_v F_v it is induced by F → F ⊗ Q_p (KTheoryFiniteLocalFields:L.7/semilocal-completed-map).
2. D_{F⊗Q_p} is Z_p-linear with torsion-free target, so torsion classes of K_3(F) map to 0.
3. For p > 3 unramified, D.3/unramified-regulator-theorem gives the integrality.

**API.**

- `globalPadicRegulator` (data): globalPadicRegulator F p : K_3(F) →+ F ⊗[ℚ] ℚ_[p].
- `globalPadicRegulator_component` (projection): Its v-component is localRegulator F_v ∘ c_v.
- `globalPadicRegulator_torsion` (simp): globalPadicRegulator F p x = 0 for every torsion x.
- `globalPadicRegulator_integral` (characterisation): For 3 < p unramified in F, its range lies in p² • (𝓞_F ⊗ ℤ_p).
- `globalPadicRegulator_rat` (constructor): The extension K_3(F) ⊗ ℚ →ₗ[ℚ] F ⊗ ℚ_[p].
- `globalPadicRegulator_galois` (functoriality): For τ ∈ Aut(F), globalPadicRegulator F p ∘ K_3(τ) = (τ ⊗ 1) ∘ globalPadicRegulator F p.

**Uses.** GSWZ §1.5, Definition 1.3 and (22): the formal completion f̂ with log f̂_m = D_p(ξ)/(m² log q) + log f_m. HabiroNumberFields:HB.7/invertible-local-sections: the K_3-indexed local sections use D_p(ξ) in GSWZ's normalisation. HabiroNahmSeries:HB.9/p-adic-regulator-input: D_p(ξ) of the Nahm class ξ at primes p ∤ Δ. Polylogarithms:P.6/padic-regulator: the weight-one analogue is the p-adic unit regulator of D.1/unit-logarithm-kernel.

**Unit tests.**

- `globalPadicRegulator_rat_zero` (computation): globalPadicRegulator ℚ p = 0, since K_3(ℚ) ≅ ℤ/48 is finite.
- `globalPadicRegulator_torsion_zero` (degenerate): For F totally real, K_3(F) ⊗ Q = 0 (Borel: rank r_2 = 0), so globalPadicRegulator F p ⊗ Q = 0.
- `globalPadicRegulator_bloch_compat` (compatibility): For ξ ∈ K_3(F) whose Bloch image is presented by special units at p, globalPadicRegulator F p ξ = blochDilog F p (presentation) (D.4/special-unit-formula).
- `globalPadicRegulator_not_injective_claim` (non-example): For F imaginary quadratic and p split, K_3(F) ⊗ Q has rank 1 while F ⊗ Q_p has rank 2; injectivity of globalPadicRegulator ⊗ Q is a separate proposition (D.4/padic-k3-regulator-injectivity), not a consequence of the ranks.

**Acceptance.** F = Q: K_3(Q) ≅ Z/48 is torsion, so D_{Q,p} = 0 for every p. F = Q(α), α³ − α² + 1 = 0, p = 5: D_{F,5}(ξ) for the class ξ of 5_2 is the value (271) of GSWZ (D.4/example-cubic-field-five-two).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §1.5, (19), p. 9.

### The global regulator on special-unit presentations

**Node** `PadicHodgeRegulators:D.4/special-unit-formula` (theorem).

Let F be a number field, p a prime, and let ξ ∈ K_3(F) have image in B(F) ⊗ Q presented as Σ_i n_i[z_i] (n_i ∈ Q) with z_i and 1 − z_i units at every prime of F above p. Then D_{F,p}(ξ) = ±Σ_i n_i D_{F,p}^{dil}([z_i]), where D^{dil}_{F,p} is the combined dilogarithm of D.1/combined-dilogarithm and the sign is the pinned sign of D.3/local-regulator. In particular: (a) for every root of unity ζ ≠ 1 of F, D_{F,p}([ζ]) = Li_2(ζ ⊗ 1) componentwise; (b) for a fixed presentation the hypothesis holds for all but finitely many p; (c) when R = O_F[1/Δ] and all z_i, 1 − z_i ∈ R^×, the formula holds at every p ∤ Δ. For presentations by symbols that are not special units at p the formula is Besser–de Jeu's Conjecture 1.14 (gap).

**Hypotheses.** z_i, 1 − z_i ∈ O_{F,(v)}^× for every v | p; the presentation lies in the image of B(F) ⊗ Q under Suslin's map.

**Prerequisites.** `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.1/combined-dilogarithm`, `PadicHodgeRegulators:D.3/local-regulator`, `KTheoryFiniteLocalFields:L.7/restriction-completion-square`

**Proof or construction.**

1. At each v | p, the localisation of ξ is presented by special units of O_v; D.2/weight-two-dilogarithm-comparison (BdJ Theorem 1.10 for number fields) gives the v-component.
2. Roots of unity of any order: BdJ Theorem 1.12.
3. (b) is BdJ Remark 1.11: a fixed finite presentation involves finitely many elements, each a unit away from finitely many primes.

**Acceptance.** F = Q(α), α³ − α² + 1 = 0: ξ = 2[1 − α²] + [1 − α] with 1 − α², α², 1 − α, α global units, so the formula holds at every p (D.4/example-cubic-field-five-two). F = Q(ζ_m), p ∤ m: D_{F,p}([ζ_m]) = (Li_2(σ_v ζ_m))_{v|p}.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.10(2) and Remark 1.11, p. 5; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Lemma 3.1, p. 38.

### Restriction and transfer for the global regulator

**Node** `PadicHodgeRegulators:D.4/norm-trace-compatibility` (theorem).

Let E/F be a finite extension of number fields and p a prime. (a) Restriction: D_{E,p}(res_{E/F} ξ) = ι(D_{F,p}(ξ)) for ξ ∈ K_3(F), ι : F ⊗ Q_p → E ⊗ Q_p. (b) Transfer: D_{F,p}(N_{E/F} η) = Tr_{E⊗Q_p/F⊗Q_p}(D_{E,p}(η)) for η ∈ K_3(E). (c) Consequently D_{F,p}(N_{E/F} res_{E/F} ξ) = [E : F]·D_{F,p}(ξ). The same holds for the local regulators of D.3 along finite extensions of finite étale Q_p-algebras.

**Hypotheses.** E/F finite; Iwasawa branch; Bloch–Kato logarithms of the factors.

**Prerequisites.** `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `KTheoryFiniteLocalFields:L.7/semilocal-completed-map`, `KTheoryFiniteLocalFields:L.7/transfer-completion-formula`, `PadicHodgeRegulators:D.2/etale-regulator`, `PadicHodgeRegulators:L1/twist-and-change-of-field`, `PadicHodgeRegulators:D.1/logarithm-norm-trace`

**Proof or construction.**

1. λ is compatible with restriction and transfer (KTheoryFiniteLocalFields:L.7/semilocal-completed-map and L.7/transfer-completion-formula).
2. Locally, the étale regulator takes restriction to restriction and transfer to corestriction (D.2/etale-regulator API), and log_BK takes restriction to inclusion and corestriction to trace on D_dR(Q_p(2)) (L1/twist-and-change-of-field).
3. (c) follows from (a), (b) and Tr∘ι = [E : F].

**Acceptance.** F = Q, E = Q(ζ_3), p = 7: D_{Q,7}(N[ζ_3]) = Tr(D_{E,7}([ζ_3])) = Li_2(ζ_3) + Li_2(ζ_3^{−1}) = 0, consistent with K_3(Q) being torsion. Transfer is not multiplicative on sections: the HabiroNumberFields norm of sections corresponds to this additive trace on degrees, not to a product of regulators.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph after (174), p. 38.

### Frobenius compatibility of the p-adic regulator

**Node** `PadicHodgeRegulators:D.4/frobenius-compatibility` (theorem).

Let p be unramified in the number field F and let φ_p be the Frobenius of the unramified étale algebra F ⊗ Q_p ≅ ∏_{v|p} F_v (the product of the arithmetic Frobenii). Then φ_p acts on K_3(F ⊗ Q_p; Z_p) by functoriality and D_{F⊗Q_p}(φ_p x) = φ_p(D_{F⊗Q_p}(x)); in particular D_p(φ_p ξ) = φ_p D_p(ξ) for ξ ∈ K_3(F), with φ_p ξ := φ_p λ_{F,p}(ξ). On root-of-unity classes, φ_p[ζ] = [ζ^p] and D(ζ^p) = φ_p D(ζ).

**Hypotheses.** p unramified in F (any p for the functoriality; p > 3 for the integral statements it is combined with).

**Prerequisites.** `PadicHodgeRegulators:D.3/local-regulator`, `PadicHodgeRegulators:D.3/unramified-etale-algebra`, `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`, `PadicHodgeRegulators:D.3/root-of-unity-classes`

**Proof or construction.**

1. φ_p is a Q_p-algebra automorphism, so D.3/local-regulator's functoriality (étale Chern classes and log_BK are natural for automorphisms of the field) gives the identity.
2. On roots of unity this is D.1/dilogarithm-scalar-extension (b) with φ(ζ) = ζ^p.

**Acceptance.** GSWZ (273): D_5(ζ_24^5) = φ(D_5(ζ_24)) in the Q_{25}-component. With the geometric Frobenius in place of the arithmetic one the identity reads D(ζ^{p^{-1}}) = φ^{−1}D(ζ); the convention is pinned to the arithmetic Frobenius (Huber–Kings warn about this choice).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38.

### Torsion classes and controlled denominators

**Node** `PadicHodgeRegulators:D.4/torsion-and-denominators` (theorem).

Let F be a number field and p > 3 unramified in F. (a) Every torsion element of K_3(F) (the group Z/w_2(F) ⊕ (2-primary terms) of ArithmeticKTheory:N.5/totally-imaginary-integral-structure) has D_{F,p} = 0. (b) If β ∈ K_3(F) ⊗ Q satisfies Nβ ∈ image(K_3(F)) for an integer N, then D_{F,p}(β) ∈ p^{2 − v_p(N)}(O_F ⊗ Z_p). (c) For a root of unity ζ ∈ μ(F) ∖ {1} of order m, the coefficient-localised class ⟦ζ⟧ ∈ B(F) ⊗ Z[1/m] of K3BlochGroups:V.6/root-of-unity-class has D_{F,p}(⟦ζ⟧) = Li_2(ζ ⊗ 1), which lies in p²(O_F ⊗ Z_p) when p ∤ m. (d) The image D_{F,p}(K_3(F)) is a finitely generated Z-submodule of rank at most r_2(F) inside p²(O_F ⊗ Z_p); its Z_p-span need not be all of p²(O_F ⊗ Z_p).

**Hypotheses.** F a number field; p > 3 unramified in F for (b)–(d).

**Prerequisites.** `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `PadicHodgeRegulators:D.4/special-unit-formula`, `ArithmeticKTheory:N.5/totally-imaginary-integral-structure`, `K3BlochGroups:V.5/k3-number-field`, `K3BlochGroups:V.2/k3-rank-borel`, `K3BlochGroups:V.6/root-of-unity-class`, `K3BlochGroups:V.6/comparison-rational`

**Proof or construction.**

1. (a) The target is torsion-free.
2. (b) D_{F,p}(Nβ) ∈ p²(O_F ⊗ Z_p) by D.4/global-p-adic-regulator, and division by N costs v_p(N).
3. (c) D.4/special-unit-formula (a) and linearity: D(m^{−1} ⊗ m[ζ]) = m^{−1}·m·Li_2(ζ).
4. (d) K_3(F) is finitely generated of rank r_2 (K3BlochGroups:V.2/k3-rank-borel); λ_{F,p}(K_3(F)) spans a Z_p-submodule of K_3(F ⊗ Q_p; Z_p) of rank ≤ r_2 ≤ [F : Q].

**Acceptance.** F = Q(√−3), p = 7 (split): D_{F,7} kills the finite torsion subgroup Z/w_2(F); the non-torsion part has rank r_2 = 1 inside a rank-2 target. A class with denominator p has regulator only in p·(O_F ⊗ Z_p), so (b) is sharp in general.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Theorem 9, p. 39.

### The regulator exported to Habiro-module gluing

**Node** `PadicHodgeRegulators:D.4/habiro-regulator-export` (comparison).

Let K be a number field, Δ a positive integer divisible by disc(K) and by 6, R = O_K[1/Δ], and p ∤ Δ (so p > 3 is unramified in K). The p-adic regulator used to define invertible L_p(ξ)-sections (GSWZ Definition 1.3, (22)) is D_p := D_{K,p} : K_3(K) → p²R^∧_p ⊂ K_p = R^∧_p[1/p] = K ⊗ Q_p, with: (i) the Iwasawa branch and D_p([ζ]) = Li_2(ζ) on roots of unity; (ii) D_p(φ_p ξ) = φ_p D_p(ξ); (iii) D_p(ξ) = Σ n_i D(z_i) for presentations by Δ-special units z_i, 1 − z_i ∈ R^×; (iv) every ξ has a Z_p-presentation λ_{K,p}(ξ) = Σ a_ζ [ζ]_{K_p} by roots of unity of order prime to p with all components ≠ 1, and D_p(ξ) = Σ a_ζ Li_2(ζ); (v) scalar dictionary: D_p = ε·log_BK∘r^et_2 (Bloch–Kato, e_2-basis), D_p = Besser's syntomic regulator, and the Gros normalisation is (1 − φ_p/p²)·D_p, which maps p²R^∧_p onto R^∧_p. No injectivity of λ_{K,p} ⊗ Q is asserted (D.4/padic-k3-regulator-injectivity).

**Hypotheses.** Δ divisible by disc(K) and 6; p ∤ Δ.

**Prerequisites.** `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `PadicHodgeRegulators:D.4/special-unit-formula`, `PadicHodgeRegulators:D.4/frobenius-compatibility`, `PadicHodgeRegulators:D.3/roots-of-unity-generate`, `PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`, `PadicHodgeRegulators:D.2/gros-normalisation`

**Proof or construction.**

1. (i), (ii), (iii) are D.4/global-p-adic-regulator, D.4/frobenius-compatibility and D.4/special-unit-formula (c).
2. (iv) applies D.3/roots-of-unity-generate to λ_{K,p}(ξ) ∈ K_3(K_p; Z_p).
3. (v) collects D.3/local-regulator and D.2/gros-normalisation.

**Acceptance.** GSWZ Example 4.3 at p = 5 (Δ = 6·23): D.4/example-cubic-field-five-two. With the Gros normalisation in (22) the integrality condition (21) would change by the factor (1 − φ_p/p²); the export pins Besser's normalisation.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Definition 1.3, (20)–(22), p. 9; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 1, p. 9.

### The p-adic K₃ regulator injectivity proposition

**Node** `PadicHodgeRegulators:D.4/padic-k3-regulator-injectivity` (definition). **Declaration:** `PadicK3RegulatorInjective`.

For a number field F and a prime p, the proposition Inj(F, p) states that D_{F,p} ⊗ Q : K_3(F) ⊗ Q → F ⊗ Q_p is injective, equivalently (since K_3(F) ⊗ Q has dimension r_2(F)) that the image of K_3(F) in the target has Z-rank r_2(F) and its Z_p-span has Z_p-rank r_2(F). It is a proposition about F and p, not a consequence of Borel's rank formula or of D.3; GSWZ do not use it.

**Hypotheses.** F a number field, p a prime.

**Prerequisites.** `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `K3BlochGroups:V.2/k3-rank-borel`, `K3BlochGroups:V.5/k3-number-field`

**Proof or construction.**

1. Dimension count: K_3(F) ⊗ Q has dimension r_2 (K3BlochGroups:V.2/k3-rank-borel), the target has dimension [F : Q] over Q_p; injectivity is a statement about the Q_p-span of the image, which no theorem in this layer controls.

**API.**

- `PadicK3RegulatorInjective` (data): PadicK3RegulatorInjective F p : Prop := Function.Injective (globalPadicRegulator_rat F p).
- `padicK3RegulatorInjective_of_totallyReal` (example): If F is totally real, PadicK3RegulatorInjective F p holds.
- `padicK3RegulatorInjective_iff_rank` (characterisation): PadicK3RegulatorInjective F p ↔ the ℚ_p-span of the image has dimension r_2(F).
- `padicK3RegulatorInjective_baseChange` (functoriality): For E/F finite, PadicK3RegulatorInjective E p implies PadicK3RegulatorInjective F p (restriction is injective rationally and compatible with D.4/norm-trace-compatibility).

**Uses.** PadicHodgeRegulators D.4 stage text: keep the higher p-adic regulator conjecture a distinct proposition. ColemanIntegration:L3/padic-beilinson-conjecture: the weight-two Artin-motive case of the p-adic Beilinson conjecture contains non-vanishing of such regulators.

**Unit tests.**

- `injective_rat` (computation): PadicK3RegulatorInjective ℚ p holds, since K_3(ℚ) ⊗ ℚ = 0.
- `injective_totally_real` (degenerate): For F totally real (r_2 = 0) the source is zero and the proposition holds.
- `injective_rank_compat` (compatibility): For F imaginary quadratic, the proposition is equivalent to D_{F,p}(ξ_0) ≠ 0 for a generator ξ_0 of K_3(F) modulo torsion.
- `injective_not_from_rank` (non-example): The rank inequality r_2 ≤ [F : Q] does not imply the proposition: the image could lie in a smaller Q_p-subspace, and nothing in D.3 excludes this.

**Acceptance.** Inj(F, p) holds trivially when r_2(F) = 0. Inj(F, p) is not asserted for any F with r_2(F) ≥ 1.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9, p. 39.

### GSWZ Example 4.3: the class of 5₂ at p = 5

**Node** `PadicHodgeRegulators:D.4/example-cubic-field-five-two` (application).

Let K = Q(α), α³ − α² + 1 = 0 (discriminant −23), z_1 = z_3 = 1 − α², z_2 = z_1² − z_1 + 2 = 1 − α, and ξ = [z_1] + [z_2] + [z_3] = 2[1 − α²] + [1 − α] ∈ B(K) (the class of the knot 5_2). All of 1 − α², α², 1 − α and α are units of O_K (norm ±1). At p = 5, K_5 ≅ Q_{25} × Q_5, μ(K_5) ≅ μ_24 × μ_4, and ζ_24 := lim_s α^{5^{2s}} has order 24 with Q_5-component the Teichmüller lift of 2 (order 4). Then D_5(ξ) = c_1D_5(ζ_24) + c_2D_5(ζ_24²) + c_3D_5(ζ_24⁶) with c_1 = 1 + 4·5 + 3·5² + ⋯, c_2 = 3 + 5 + ⋯, c_3 = 1 + 5 + 4·5² + ⋯, hence λ_{K,5}(ξ) = c_1[ζ_24] + c_2[ζ_24²] + c_3[ζ_24⁶] in K_3(K_5; Z_5). The second line of GSWZ (273) is the value D_5(ζ_24²), misprinted there with the label ζ_24^5 (GSWZ E56).

**Hypotheses.** p = 5 ∤ 6·23.

**Prerequisites.** `PadicHodgeRegulators:D.4/habiro-regulator-export`, `PadicHodgeRegulators:D.4/special-unit-formula`, `PadicHodgeRegulators:D.3/roots-of-unity-generate`, `PadicHodgeRegulators:D.1/combined-dilogarithm`

**Proof or construction.**

1. All symbols are special units at 5, so D.4/special-unit-formula identifies D_5(ξ) with the dilogarithm sum (271).
2. ζ_24, ζ_24², ζ_24⁶ have all components ≠ 1 and their regulators form a Z_5-basis of 25·O_{K_5} (D.3/residue-spanning (c)); solving the linear system gives the c_i, recomputed 5-adically by the GSWZ extraction's reviewer.
3. Injectivity of D_5 on K_3(K_5; Z_5) (D.3/unramified-regulator-theorem) turns the identity of regulators into the identity of classes.

**Acceptance.** Recompute D_5(ξ), D_5(ζ_24), D_5(ζ_24²), D_5(ζ_24⁶) to precision 5^{12} with exact arithmetic in Z_5[α] and check (271), (273) (relabelled) and (274). The Q_5-component of ζ_24^4 is 1, so ζ_24^4 is not an admissible generator.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Example 4.3, (270)–(275), p. 54; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Example 4.3, (274), p. 54.

### Acceptance tests for D.4

- `D_{Q,p} = 0` (`K₃(Q) ≅ Z/48`).
- GSWZ Example 4.3: `D_5(ξ) = c_1D_5(ζ_24) + c_2D_5(ζ_24²) + c_3D_5(ζ_24⁶)`, with the second line of (273) read as `D_5(ζ_24²)`.
- `D_{Q,7}(N[ζ_3]) = Li₂(ζ) + Li₂(ζ^{−1}) = 0`.

## D.5. Elliptic and higher-weight interfaces

For a smooth proper curve `𝒳` over `O_K`, `K/Q_p` unramified, with generic fibre `X`, `H²_syn(𝒳, 2)` is identified with `H¹_dR(X/K)` in two ways: canonically (`ι`) and by Besser's normalisation `Θ = (1 − φ/q²)^{−1} ∘ ι^{−1}`. The **degree-two syntomic regulator** of `u ∈ K₂(𝒳)^{(2)} ⊗ Q` is computed on symbols by an explicit cocycle on the open curve `Y = 𝒳 ∖ D` and the Frobenius-equivariant projection `p_D`, giving the full `2g`-coordinate vector. **Besser's formula** pairs `regP = Θ ∘ reg_syn` with a holomorphic form through Coleman integrals: `B(regP(u), [ω]) = Σ n_i Σ_x ord_x(f_i) Tr CT_x(∫ log(g_i) ω)`. The étale comparison is `regP = log_BK ∘ r^ét` (equivalently `regSynCan = (1 − p^{−2}φ_p) log_BK ∘ r^ét`), so on a Frobenius eigenvector of eigenvalue `γ` the canonical and normalised pairings differ by `1 − 1/(pγ)`: consumers must say which they use. Pullback, pushforward and base change are compatible with the regulator. Bad or semistable reduction needs log-syntomic cohomology (D.2's sub-layer), the Hyodo–Kato structure and Vologodsky integration; that is recorded as a boundary, and the unramified-field calculation of D.3 supplies none of it. This layer is a foundation for p-adic elliptic regulators, not a proof of any p-adic Beilinson conjecture; the real regulator theorems of `EllipticRegulators` do not depend on it.

**Dependencies.** `PadicHodgeRegulators:D.2`, `L1`; `ColemanIntegration:L0`, `L1`; `PadicDifferentialEquationsAndRigidCohomology:RD.4`; `EllipticKTheory:E.3`, `E.4`, `E.7`; `K2SymbolsBrauer:T.3`, `T.4`; `SchemeKTheoryOperations:S.2`; `PadicHodgeTheory:R06.5`; `CohomologyComparisons:CP.4`.

### The weight-two syntomic target of a curve and its two identifications

**Node** `PadicHodgeRegulators:D.5/curve-weight-two-target` (definition). **Declaration:** `curveSyntomicTarget`. **Planet:** Weight-two syntomic cohomology of curves.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let H^2_syn(𝒳, 2) be rigid syntomic cohomology (D.2/rigid-syntomic-cohomology). Since F^2H^1_dR = 0 and F^2H^2_dR = 0, the canonical map ι : H^1_dR(X/K) → H^2_syn(𝒳, 2) is an isomorphism, and Besser's normalised identification is Θ := (1 − φ/q²)^{−1} ∘ ι^{−1} : H^2_syn(𝒳, 2) ≅ H^1_dR(X/K) (1 − φ/q² is invertible because φ has weight 1 on H^1). The cup-product pairing B(a, b) := Tr(a ∪ b) on H^1_dR(X/K) is alternating with B(φa, φb) = q·B(a, b), and for forms of the second kind B([dF], [dG]) = Σ_x Res_x(F dG).

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K).

**Prerequisites.** `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `ColemanIntegration:L0/annulus-residue`

**Proof or construction.**

1. The syntomic long exact sequence (D.2/rigid-syntomic-cohomology API) with F^2 = 0 in degrees 1 and 2 identifies H^2_syn(𝒳, 2) with the cokernel of 1 − φ/q² on H^1_rig, i.e. with H^1_rig; the rigid–de Rham comparison gives H^1_dR(X/K).
2. Besser–de Jeu's Definition 4.6 (for n ≥ i > relative dimension, here n = i = 2 > 1) defines the normalised identification with the factor (1 − φ*/q^n)^{−1}.
3. The trace and the Frobenius similitude come from Poincaré duality for rigid cohomology; the residue formula is Besser's p-adic Arakelov theory, Lemma 3.3.

**API.**

- `curveSyntomicTarget` (data): curveSyntomicTarget 𝒳 := H^2_syn(𝒳, 2).
- `curveSyntomicCanIso` (equivalence): canIso 𝒳 : H1dR X ≃ₗ[K] curveSyntomicTarget 𝒳.
- `curveSyntomicNormIso` (equivalence): normIso 𝒳 : curveSyntomicTarget 𝒳 ≃ₗ[K] H1dR X, equal to (1 − φ/q²)⁻¹ ∘ canIso⁻¹.
- `cupTrace` (structure): cupTrace X : LinearMap.BilinForm K (H1dR X), alternating.
- `cupTrace_frob` (relation): cupTrace (φ a) (φ b) = q • cupTrace a b.
- `cupTrace_res_sum` (characterisation): For second-kind forms, cupTrace [dF] [dG] = Σ_x Res_x(F dG).
- `cupTrace_eigen` (relation): If cupTrace is a q-similitude for φ and φ v = γ v (γ ≠ 0), then cupTrace (φ a) v = (q/γ)·cupTrace a v.

**Uses.** Asakura–Miyatani, Theorem 9.1: Tr_C(Θ(reg_syn{f, g}) ∪ [ω]) = (r_p{f, g})(ω). EllipticRegulators:ER.8/good-reduction-elliptic-pairing: the Coleman formula for the weight-two elliptic regulator, which holds for Θ, not for ι^{−1}. EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: the Frobenius factor (1 − p^{−2}Φ) between the canonical and normalised identifications.

**Unit tests.**

- `curveTarget_projective_line` (computation): For 𝒳 = P^1_{O_K}, curveSyntomicTarget 𝒳 = 0.
- `curveTarget_weight_one_analogue` (degenerate): In weight one for Spec O_K (i = n = 1), the normalised class of a unit u is log u while the canonical class is (1 − 1/q)·log u.
- `curveTarget_eigen_factor` (compatibility): If φv = γv then B(φa, v) = (q/γ)B(a, v); for p = q = 5 and γ = 2, (1 − 1/(pγ)) = 9/10 is the factor between canonical and normalised pairings.
- `curveTarget_h2_non_example` (non-example): For H^3_syn(𝒳, 1) the operator 1 − φ/q on H^2_rig(𝒳_k) is zero (φ = q there), so no normalised identification exists; Besser–de Jeu Definition 4.6 requires n ≥ i > dim.

**Acceptance.** 𝒳 = P^1: H^1_dR = 0 and the target is 0. For an elliptic curve y² = x³ + ax + b, ω = dx/2y and η = x dx/2y: B(ω, η) = 1 (residue at ∞ with local parameter −x/y).

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Definition 4.6, p. 24; [Ara2003](https://arxiv.org/abs/math/0301029v1), Lemma 3.3, p. 8.

### The Frobenius splitting for an open curve

**Node** `PadicHodgeRegulators:D.5/open-curve-splitting` (construction). **Declaration:** `openCurveSplitting`.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let (𝒳, D) be a good-reduction pair (ColemanIntegration:L1/good-reduction-pair) with D finite étale over O_K and Y = 𝒳 ∖ D. Then H̃^2_ms(Y, 2) = Ω^†(Y)/dA^†(Y) = H^1_dR(A^†(Y)), the restriction res : H^1_dR(X) → H^1_dR(Y) is φ-equivariant and injective, and there is a unique φ-equivariant retraction p_D : H^1_dR(Y) → H^1_dR(X) (H^1(X) has Frobenius weight 1 and the cokernel of res, spanned by residues, weight 2). p_D does not depend on the Frobenius lift and is compatible with enlarging D.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). (𝒳, D) a good-reduction pair; D finite étale over O_K.

**Prerequisites.** `ColemanIntegration:L1/good-reduction-pair`, `ColemanIntegration:L1/wide-open-neighbourhood`, `ColemanIntegration:L1/frobenius-lift`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology`, `PadicHodgeRegulators:D.5/curve-weight-two-target`

**Proof or construction.**

1. The Gysin/residue sequence 0 → H^1(X) → H^1(Y) → K^{D}(−1) → K identifies the cokernel of res with residues, on which φ acts with weight 2.
2. Weights differ, so the φ-stable complement of res(H^1(X)) is unique; p_D is the projection along it (Besser–de Jeu 2012, p. 4, citing Besser's K_2 paper, Proposition 4.8).
3. Independence of the lift: two lifts induce homotopic maps on overconvergent de Rham complexes.

**API.**

- `openCurveSplitting` (data): openCurveSplitting 𝒳 D : H1dR (Y) →ₗ[K] H1dR X.
- `openCurveSplitting_comp_res` (simp): openCurveSplitting 𝒳 D ∘ res = id.
- `openCurveSplitting_frob` (characterisation): openCurveSplitting commutes with φ and is the unique such retraction.
- `openCurveSplitting_mono` (relation): For D ⊆ D', openCurveSplitting 𝒳 D' ∘ res_{Y,Y'} = openCurveSplitting 𝒳 D.

**Uses.** PadicHodgeRegulators:D.5/curve-syntomic-regulator: the regulator of a symbol on Y is projected to X by p_D. Besser–de Jeu 2012, (9.13): p is the unique map with (pη) ∪ [ω] = ⟨F_η, F_ω⟩_gl for ω of the second kind holomorphic on U.

**Unit tests.**

- `splitting_p1` (computation): For P^1 and D = {0, ∞}, openCurveSplitting = 0.
- `splitting_empty_boundary` (degenerate): For D = ∅ (Y = X), openCurveSplitting = id.
- `splitting_res_compat` (compatibility): openCurveSplitting 𝒳 D ∘ res = id on H1dR X.
- `splitting_not_residue_free` (non-example): The complement of res(H^1(X)) chosen by 'residue-free forms' without Frobenius is a different splitting in general; only the φ-stable one is canonical.

**Acceptance.** P^1 with D = {0, ∞}: H^1_dR(Y) = K·dt/t, φ^* = q on it, and p_D = 0. For an elliptic curve and D = {O}, p_D is the identity on H^1_dR(Y) = H^1_dR(X).

**Sources.** [BdJ2012](https://arxiv.org/pdf/1208.0516v1), §1, pp. 4–5.

### The degree-two syntomic regulator of a curve

**Node** `PadicHodgeRegulators:D.5/curve-syntomic-regulator` (construction). **Declaration:** `curveSyntomicRegulator`. **Planet:** Syntomic regulator on K₂ of curves.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). For u ∈ K_2(𝒳)^{(2)} ⊗ Q define reg_syn(u) ∈ H^2_syn(𝒳, 2) by the syntomic Chern class of D.2/syntomic-regulator, and put regSynCan(u) := ι^{−1}(reg_syn(u)) and regP(u) := Θ(reg_syn(u)) = (1 − φ/q²)^{−1}regSynCan(u) in H^1_dR(X/K). If the restriction of u to Y = 𝒳 ∖ D is a finite sum Σ n_i{f_i, g_i} of symbols with f_i, g_i ∈ O(Y)^×, then regSynCan(u) = p_D[Σ_i n_i ε(f_i, g_i)] with ε(f, g) := q^{−2}·log(f_0)·φ^*dlog g − q^{−1}·log(g_0)·dlog f, f_0 := f^q/φ^*f (a class in H̃^2_ms(Y, 2) = H^1_dR(A^†(Y))), and regP(u) = p_D((1 − φ^*/q²)^{−1}[Σ_i n_i ε(f_i, g_i)]). This gives the full 2g-coordinate regulator vector, not only its pairing with holomorphic forms.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). (𝒳, D) a good-reduction pair containing the supports of all f_i, g_i.

**Prerequisites.** `PadicHodgeRegulators:D.5/curve-weight-two-target`, `PadicHodgeRegulators:D.5/open-curve-splitting`, `PadicHodgeRegulators:D.2/syntomic-regulator`, `EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition`, `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `K2SymbolsBrauer:T.3/tame-symbol`

**Proof or construction.**

1. The syntomic Chern class on K_2 is the cup product of the K_1 classes reg(f) = (dlog f, log(f_0)/q) (Besser–de Jeu 2003 Lemma 4.7, citing Besser 2000 Proposition 10.3).
2. On Y with a Frobenius lift the cup product of two such classes is represented by ε(f, g) in Ω^†(Y)/dA^†(Y) (Besser–de Jeu 2012 (5.1)–(5.2); Asakura–Miyatani Proposition 6.4).
3. Elements of K_2(𝒳) restrict to symbols on Y with trivial tame symbols along D (EllipticKTheory:E.3/localisation-sequence-for-a-curve); p_D returns the class to X.

**API.**

- `curveSyntomicRegulator` (data): curveSyntomicRegulator 𝒳 : K_2(𝒳)^{(2)}_ℚ →ₗ[ℚ] curveSyntomicTarget 𝒳.
- `regSynCan` (projection): regSynCan := canIso⁻¹ ∘ curveSyntomicRegulator.
- `regP` (projection): regP := normIso ∘ curveSyntomicRegulator.
- `regSynCan_eq_frob_regP` (relation): regSynCan u = (1 − q⁻² • φ) (regP u).
- `regP_symbol` (characterisation): On a symbol presentation on Y, regP u = openCurveSplitting ((1 − φ^*/q²)⁻¹ [Σ n_i ε(f_i, g_i)]).
- `regSynCan_pairing_eigen` (relation): For φ v = γ v: cupTrace (x − q^{−2}φ x) v = (1 − 1/(qγ))·cupTrace x v, the pairing form of regSynCan = (1 − φ/q²)·regP.
- `curveSyntomicRegulator_weight_three` (simp): The weight-three part of K_2(𝒳) ⊗ Q maps to 0 (H^4_syn(𝒳, 3)-target vanishes for a curve).

**Uses.** EllipticRegulators:ER.8/the-syntomic-comparison: reg_p : K_2(E) ⊗ Q → H^1_dR(E/Q_p) of a curve with good reduction, specialised to ER's classes. EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: reg_syn(u) = (1 − p^{−2}Φ)z with z = log_BK(reg_et(u)). PadicHodgeRegulators:D.5/coleman-symbol-formula: the pairing of regP with holomorphic forms.

**Unit tests.**

- `regulator_constant_symbol` (computation): For c ∈ μ_{q−1}, regSynCan {f, c} = 0.
- `regulator_diagonal_symbol` (degenerate): regSynCan {f, f} = 0.
- `regulator_eigen_compat` (compatibility): If φv = γv, B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v) for K = Q_p.
- `regulator_canonical_not_coleman` (non-example): Feeding regSynCan instead of regP into the Coleman symbol formula is off by (1 − φ/q²); on an eigen-pairing by the factor (1 − 1/(pγ)).

**Acceptance.** For c ∈ μ_{q−1}: c_0 = 1 and dlog c = 0, so regSynCan({f, c}) = 0. {f, f}: ε = −q^{−2}·d(½ log(f_0)²) is exact, so the regulator vanishes.

**Sources.** [AM18](https://arxiv.org/abs/1711.08854v2), Proposition 6.4, p. 34; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Lemma 4.7, p. 24.

### Besser's Coleman-integral formula for the regulator of a symbol

**Node** `PadicHodgeRegulators:D.5/coleman-symbol-formula` (theorem). **Planet:** Besser's symbol formula.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let u ∈ K_2(𝒳)^{(2)} ⊗ Q restrict on Y = 𝒳 ∖ D to Σ_i n_i{f_i, g_i} with f_i, g_i ∈ O(Y)^× and (𝒳, D) a good-reduction pair containing all supports, and let ω ∈ H^0(X, Ω^1). Then B(regP(u), [ω]) = Σ_i n_i Σ_{x ∈ |D_K|} ord_x(f_i)·Tr_{K(x)/K}(CT_x(∫ log(g_i)·ω)), where ∫ log(g_i)ω is the Coleman integral (ColemanIntegration:L1/coleman-integral) and CT_x the log-free constant term at x in a local parameter (after a finite extension, descending by Galois equivariance). The value is independent of the branch of the logarithm and of the constant of integration. Equivalently Tr_X(Θ(reg_syn{f, g}) ∪ [ω]) = ∫_{(f)} log(g)ω (Coleman–de Shalit's p-adic regulator). The formula holds for Θ = regP, not for the canonical regSynCan.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). All supports in a finite étale D; ω holomorphic.

**Prerequisites.** `PadicHodgeRegulators:D.5/curve-syntomic-regulator`, `ColemanIntegration:L1/coleman-integral`, `ColemanIntegration:L1/locally-analytic-log-functions`, `ColemanIntegration:L1/branch-independence-principle`, `ColemanIntegration:L0/log-branch-field-compatibility`, `K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form`, `EllipticKTheory:E.7/symbol-certificates`

**Proof or construction.**

1. Besser, Syntomic regulators and p-adic integration II, Theorem 3 (as restated by Asakura–Miyatani Theorem 9.1 and Besser–de Jeu 2012 Remark 1.10).
2. Pairing the cocycle ε(f, g) of D.5/curve-syntomic-regulator with ω: the Coleman primitive F_ω and the double index ⟨ , ⟩_gl reduce the cup product to residues at D (Besser, p-adic Arakelov theory, Lemma 3.3), giving Σ ord_x(f)·F_{log g ω}(x).
3. Independence of branch and constant: Weil reciprocity and trivial tame symbols (K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form) kill the ambiguity.

**Acceptance.** The tests of EllipticRegulators:ER.8/good-reduction-elliptic-pairing hold with regP. With regSynCan the formula fails by (1 − φ/q²) (EllipticRegulators F1 in the handoff).

**Sources.** [AM18](https://arxiv.org/abs/1711.08854v2), Theorem 9.1, p. 45; [BdJ2012](https://arxiv.org/pdf/1208.0516v1), Remark 1.10, p. 4.

### The curve regulator and the Bloch–Kato logarithm

**Node** `PadicHodgeRegulators:D.5/curve-etale-comparison` (comparison).

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). and put V = H^1_et(X_K̄, Q_p(2)), a crystalline representation with D_cris(V) = H^1_dR(X/K) ⊗ e_2 and V^{G_K} = 0. For u ∈ K_2(𝒳)^{(2)} ⊗ Q the étale regulator r^et(u) ∈ H^1(K, V) lies in H^1_f = H^1_e, and regP(u) = log_BK(r^et(u)) under D_dR(V)/Fil^0 = H^1_dR(X/K); equivalently regSynCan(u) = (1 − p^{−2}φ_p)·log_BK(r^et(u)) for K = Q_p (φ_p the p-power Frobenius). If φ_p v = γv then B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v).

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). For the (1 − p^{−2}φ_p) form, K = Q_p (or φ_p the p-semilinear Frobenius on an unramified K).

**Prerequisites.** `PadicHodgeRegulators:D.5/curve-syntomic-regulator`, `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`, `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/dimension-formulas`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`

**Proof or construction.**

1. Besser 2000 Proposition 9.11 (via Nekovář–Nizioł Proposition 1.1 and Asakura–Chida §3.2): the composite H^1_dR/F² → H^2_syn → H^1(G_K, H^1_et(Q_p(2))) is the Bloch–Kato exponential of V.
2. With the canonical identification this gives ι^{−1}reg_syn = (1 − p^{−2}φ)·log_BK∘r^et (Asakura–Chida footnote 4); applying Θ removes the factor.
3. H^1_e = H^1_f: D_cris(V)^{φ=1} = 0 by weights (Frobenius on H^1 has weight 1, twisted by p^{−2}).

**Acceptance.** For E/Q_p with good reduction and v a φ-eigenvector with eigenvalue γ: Tr(regSynCan(z) ∪ v) = (1 − p^{−1}γ^{−1})Tr(log reg_f(z) ∪ v) (Asakura–Chida footnote 4). This resolves the normalisation required by EllipticRegulators:ER.8/elliptic-syntomic-etale-factor.

**Sources.** [AC20](https://arxiv.org/pdf/2003.08888v2), Footnote 4, p. 43; [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 1.1, p. 3.

### Pullback, pushforward and base change of the curve regulator

**Node** `PadicHodgeRegulators:D.5/curve-regulator-functoriality` (theorem).

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let π : 𝒳' → 𝒳 be a finite flat morphism of good-reduction curves. (a) Pullback: regP(π^*u) = π^*regP(u), and B'(π^*a, π^*b) = deg(π)·B(a, b). (b) Pushforward: regP(π_*u') = π_*regP(u') with π_* the de Rham trace, characterised by B(π_*a', b) = B'(a', π^*b); at the level of symbols ∫_{(π^*f)} log(g)·π^*ω = ∫_{(f)} log(N g)·ω. (c) Base change: for K'/K finite unramified, regP(u|_{𝒳_{O_{K'}}}) = regP(u) ⊗ 1, and the transfer N_{K'/K} corresponds to Tr_{K'/K}. The same holds for regSynCan. Part (b) at the level of syntomic cohomology is recorded as a gap: no source read proves pushforward compatibility for rigid syntomic regulators; it follows from (a) and the projection formula on the image of pullback, and in general from the étale comparison D.5/curve-etale-comparison and corestriction compatibility of r^et.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). π finite flat between smooth proper curves over O_K.

**Prerequisites.** `PadicHodgeRegulators:D.5/curve-syntomic-regulator`, `PadicHodgeRegulators:D.5/curve-etale-comparison`, `SchemeKTheoryOperations:S.2/k-theory-pullback`, `SchemeKTheoryOperations:S.2/k-theory-proper-pushforward`, `SchemeKTheoryOperations:S.2/projection-formula`, `EllipticKTheory:E.3/naturality-for-finite-pullback`, `EllipticKTheory:E.3/naturality-for-finite-transfer`, `ColemanIntegration:L1/coleman-pullback`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/de-rham-trace`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/functoriality-of-rigid-cohomology`

**Proof or construction.**

1. (a) Naturality of syntomic Chern classes and of the identification Θ under pullback; the similitude is Besser's p-adic Arakelov theory Lemma 3.6.
2. (b) Adjunction of trace and pullback (p-adic Arakelov theory Lemma 3.7); for the regulator itself, use D.5/curve-etale-comparison: r^et commutes with pushforward (corestriction on H^1(K, H^1_et)) and log_BK commutes with corestriction/trace (L1/twist-and-change-of-field).
3. (c) Base change of rigid cohomology and of Coleman integration (ColemanIntegration:L0/log-branch-field-compatibility).

**Acceptance.** For π multiplication by n on an elliptic curve: regP(π^*u) = π^*regP(u) and π^* acts on H^1_dR by n. For a Fermat-curve quotient the symbol identity ∫_{(π^*f)} log(g)π^*ω = ∫_{(f)} log(Ng)ω holds.

**Sources.** [Ara2003](https://arxiv.org/abs/math/0301029v1), Lemmas 3.6–3.7, p. 8.

### What bad or semistable reduction requires beyond good reduction

**Node** `PadicHodgeRegulators:D.5/semistable-input-boundary` (comparison).

For a smooth proper curve X/K with semistable (not good) reduction, a degree-two regulator into H^1_dR(X/K) with an explicit symbol formula requires inputs not supplied by D.5's good-reduction theory or by D.3: (i) log-syntomic cohomology and its Chern classes (Nekovář–Nizioł Theorem A; the log-syntomic package of D.2), compatible with étale Chern classes and factoring through H^1_st (Nekovář–Nizioł Theorem B); (ii) the Hyodo–Kato (φ, N)-structure on H^1_dR (CohomologyComparisons CP.4); (iii) Vologodsky integration, which replaces Coleman integration, and the formula holds only for [ω] ∈ ker N (Besser–Raskind; Besser–Zerbes compare Vologodsky integrals with glued Coleman integrals); (iv) alternatively Besser–Loeffler–Zerbes' convenient quotient. Vologodsky integration has no owner in the atlas (gap).

**Hypotheses.** X/K smooth proper with semistable reduction.

**Prerequisites.** `PadicHodgeRegulators:D.2/log-syntomic-complex`, `PadicHodgeRegulators:D.2/syntomic-exponential`, `CohomologyComparisons:CP.4`, `PadicHodgeRegulators:D.5/coleman-symbol-formula`

**Proof or construction.**

1. Nekovář–Nizioł construct syntomic cohomology and regulators for arbitrary K-varieties (Theorems A and B).
2. Besser–Raskind (Toric regulators) and Besser–Zerbes (Vologodsky integration on semistable curves) show which part of the good-reduction formula survives: the formula with Vologodsky integrals for ω in the kernel of monodromy.

**Acceptance.** Tate curve: the Coleman integrals become branch dependent, and the Vologodsky integral selects log_q (Besser–Zerbes §3). The good-reduction formula of D.5/coleman-symbol-formula is not asserted for any semistable curve.

**Sources.** [NN2016](https://arxiv.org/abs/1309.7620v5), Theorem B, p. 7; [BZ2017](https://arxiv.org/abs/1711.06950v1), Theorem 1.1, p. 2.

### Acceptance tests for D.5

- `𝒳 = P¹`: the target is 0.
- `B(ω, η) = 1` for `ω = dx/2y`, `η = x dx/2y` on `y² = x³ + ax + b`.
- On an eigenvector with `γ = 2`, `p = 5`, the canonical pairing is `9/10` of the normalised one.
- The good-reduction formula is not asserted for a Tate curve.

## Inputs requested from other roadmaps

- **`MotivicEtaleKTheory:M.7`** (for `PadicHodgeRegulators:D.2/etale-regulator`): Soulé's étale Chern classes c_{i,k} : K_{2i−k}(R; Z/n) → H^k_et(R, μ_n^{⊗i}) for rings R with n invertible (fields, p-adic integer rings with p ∤ n replaced by their generic fibres, number rings), natural in R, compatible with the coefficient maps n | n', with products and with transfers (corestriction), and Soulé's product formula — planned in the part of MotivicEtaleKTheory that needs only M.7 (étale K-theory), as RT-AREA-ktheory-2/18 directs, so that HabiroNumberFields HB.1/HB.2 and PadicHodgeRegulators D.2 import one construction.
- **`MotivicEtaleKTheory:M.1`** (for `PadicHodgeRegulators:D.2/etale-regulator`): The continuous realisation K_{2n−1}(F) → H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) obtained from the classes c_{n,1} with p-power coefficients, its agreement with the Kummer map for n = 1, and its compatibility with restriction and transfer.
- **`Polylogarithms:P.4`** (for `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison`): De Jeu's complexes M̃^{(n)}(F) (n ≥ 2; in weight two M̃^{(2)}(F) → ∧²F^×_Q) of a field of characteristic 0 and its subcomplex M̃^{(2)}(O) for a discrete valuation ring O ⊂ F generated by special units (Besser–de Jeu §3), with the map H^1(M̃^{(2)}(F)) → K_3^{(2)}(F) and its comparison, up to the sign fixed by de Jeu, with Suslin's isomorphism B(F) ⊗ Q ≅ K_3^ind(F) ⊗ Q of K3BlochGroups V.4/V.6; in weight n, the map H^1(M̃^{(n)}(F)) → K^{(n)}_{2n−1}(F) for number fields (an isomorphism for n = 2, 3 and for cyclotomic fields) and the cyclotomic symbols [ζ]_n.
- **`CrystallineCohomology:CR.5`** (for `PadicHodgeRegulators:D.2/log-syntomic-complex`): Absolute log-crystalline cohomology RΓ_cr(X, J^{[r]})_n of fs log-schemes X log-smooth over O_K^× (O_K a complete DVR of mixed characteristic with perfect residue field, any ramification), with its divided-power filtration, Frobenius, base change in n and the Cartier-type hypotheses needed for the Hyodo–Kato comparison.
- **`CrystallineCohomology:CR.3`** (for `PadicHodgeRegulators:D.2/log-syntomic-complex`): Frobenius on absolute crystalline cohomology of smooth O_K-schemes, compatible with the PD filtration, used in the non-log case of the syntomic complex.
- **`CrystallineCohomology:CR.2`** (for `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`): The crystalline (PD) Poincaré lemma for the relative period rings A_cr(R) of small semistable O_K-algebras (Tsuji, as used by Colmez–Nizioł §4.7), identifying Galois cochains in the PD de Rham complex of the envelope with Galois cochains in [F^r A_cr(R) → A_cr(R)].
- **`AInfCohomology:AI.4`** (for `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`): The relative period rings A_cr(R) and their filtration and Frobenius for small (semistable, log) O_K-algebras R, with the Galois action of G_R, as used in the local construction of the Fontaine–Messing–Kato period map.
- **`DerivedDeRhamCohomology:DD.2`** (for `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`): Algebraic de Rham cohomology of smooth K-schemes with its Hodge filtration, functorial in X, and the comparison of Fil^n RΓ_dR(X_K) with the de Rham term of rigid syntomic cohomology.
- **`PhiGammaModulesAndIwasawaCohomology:PG.5`** (for `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`): For p odd, E/Q_p finite and T a free O_E-lattice with continuous G_{Q_p}-action: instantiate PG.5/psi-complex on D(T) over O_E ⊗ A_{Q_p} with the actual ψ of PG.4; construct the quasi-isomorphism to SelmerIwasawaCohomology:L3/iwasawa-cohomology; prove that D(T)^{ψ=1} → lim_cor H^1(Q_p(μ_{p^n}), T) is a Λ_{O_E}(G_∞)-linear bijection whose n-th component (n ≥ 1) is Cherbonnier–Colmez's ℓ(γ_n)ι_{φ,γ_n}(x_n, y) (their Proposition I.4.1 cocycle); H^2_Iw ≅ D(T)/(ψ − 1); compatibility with O_{E'} ⊗ − and with H^1_Iw(V) = H^1_Iw(T) ⊗ Q.
- **`PhiGammaModulesAndIwasawaCohomology:PG.6`** (for `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`, `PadicHodgeRegulators:L2/twist-compatibility`, `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`): Wach modules: for an E-linear crystalline V of G_{Q_p} with Hodge–Tate weights in [a; b] (HT(E(1)) = +1) and a G-stable O_E-lattice T, N(T) is free of rank d over O_E ⊗ A^+_{Q_p}, Γ-trivial modulo π, N(T) = N(V) ∩ D(T), φ(π^b N) ⊆ π^b N with π^b N/φ^*(π^b N) killed by q^{b−a}; N(T(j)) = π^{−j}N(T) ⊗ e_j; N(T) ⊆ φ^*N(T) when a ≥ 0; the inclusion-preserving lattice bijection (Berger, Limites III.4.2); and the φ-module isomorphism N(V)/πN(V) ≅ D_cris(V).
- **`PhiGammaModulesAndIwasawaCohomology:PG.4`** (for `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`): The actual ψ on O_E ⊗ A_{Q_p} and on D(T): ψφ = id, ψ(φ(λ)x) = λψ(x), Γ-equivariance and integrality; ψ(π^{−1}) = π^{−1} and ψ(π^{−m}) = π^{−m}(p^{m−1} + πQ_m(π)) with Q_m ∈ Z_p[X] (Berger, Lemma A.4).
- **`PhiGammaModulesAndIwasawaCohomology:PG.1`** (for `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/twist-compatibility`, `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`): The O_E-linear Fontaine equivalence with D(T(η)) = D(T) ⊗ e_η for continuous characters η of G_∞ (φ and ψ acting on the first factor, g acting by η(g)g), D(O_{E'} ⊗ T) = O_{E'} ⊗ D(T), D(T) free and D(T) ⊂ D(V).
- **`CohomologyComparisons:CP.4`** (for `PadicHodgeRegulators:D.5/semistable-input-boundary`): The Hyodo–Kato (φ, N)-structure on H^1_dR of a curve with semistable reduction over O_K and its comparison with H^1_et(X_K̄, Q_p) (semistable comparison), used to state the bad-reduction regulator input.
- **`tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`** (for `PadicHodgeRegulators:D.1/combined-dilogarithm`, `PadicHodgeRegulators:D.1/unit-logarithm-kernel`, `PadicHodgeRegulators:D.3/unramified-etale-algebra`, `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `PadicHodgeRegulators:L1/semilocal-bloch-kato`): The named semilocal equivalence F ⊗_Q Q_p ≅ ∏_{v|p} F_v (and O_F ⊗ Z_p ≅ ∏ O_v) with its characteristic property, as planned in that layer; this roadmap uses it as given.

## Open inputs

- **The dilogarithm formula for arbitrary Bloch elements (Besser–de Jeu Conjecture 1.14, n = 2)** (needed by `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.4/special-unit-formula`). That the p-adic regulator of the class of Σ n_i[z_i] ∈ B(F) ⊗ Q equals ±Σ n_i D(σ z_i) is proved only when every z_i is a special unit of the valuation ring at p (BdJ Theorems 1.6(2), 1.10) or a root of unity (Theorem 1.12). For general presentations it is BdJ's Conjecture 1.14, open even for n = 2 in every source read. GSWZ (19) asserts the general identity (sourceIssues E101). The packet defines D_p on completed K_3 as the regulator, so Theorem 9 and the Habiro export do not depend on the conjecture; only the explicit evaluation of D_p by dilogarithms of non-special symbols does.
- **Primary source for the rigid syntomic–étale comparison not read** (needed by `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`, `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`, `PadicHodgeRegulators:D.5/curve-weight-two-target`). Besser, 'Syntomic regulators and p-adic integration I' (Israel J. Math. 120 (2000)) is available only as a bitmap-font PostScript file on the author's page, which could not be read. Its Propositions 8.6.3, 9.9–9.11, 10.1.3, 10.3, Corollary 9.10 and Lemma 8.8 are used through Huber–Kings 2011, Besser–de Jeu 2003, Tamme 2014 and Nekovář–Nizioł 2016, which state them. A worker with a readable copy should check the identification η of HK Example 2.2.4 against BdJ Definition 4.6 and the statement of Proposition 9.11.
- **Integral Bloch–Kato lattice not stated verbatim in an open source** (needed by `PadicHodgeRegulators:L1/integral-logarithm-unramified`). The lattice statement log_BK(H^1(L, Z_p(r))) = (r−1)!·p^r·O_L·e_r for unramified L and 2 ≤ r ≤ p − 2 is derived from Benois–Nguyen Quang Do (index form verbatim in their Lemme 1.3.2 and Théorème 2.1; the lattice form from their §2.3.2 diagram and Proposition 2.2.4 by an explicit trace computation recorded in proofSteps). Bloch–Kato §4 (Claim 4.8, p. 368), the classical source, is not freely available and was read only through Huber–Kings' quotation.
- **Upper end of the Kato–Kurihara–Tsuji range** (needed by `PadicHodgeRegulators:D.2/small-twist-comparison`). Colmez–Nizioł quote the exact comparison for i ≤ r ≤ p − 1; Nekovář–Nizioł use r ≤ p − 2. The original statements of Kato, Kurihara and Tsuji were not read. The packet relies only on r ≤ p − 2 (weight two for p ≥ 5).
- **Sign of Cherbonnier–Colmez's δ_n against the Kummer cocycle** (needed by `PadicHodgeRegulators:L2/kummer-coleman-comparison`). With τ[u_n] = [ε]^{c(τ)}[u_n], (1 − τ)(log[u_n]·t^{−1} ⊗ e_1) = −c(τ)e_1, so Cherbonnier–Colmez's δ_n appears to be minus the Kummer map τ ↦ τ(α)/α unless they use α/τ(α). The sign s of L2/kummer-coleman-comparison, and through it L3/tate-coleman-comparison's Col = −Col_0, must be fixed by a careful reading of CC99 §V.3; the computation in this job is not a confirmed source error.
- **Pushforward compatibility of the curve regulator** (needed by `PadicHodgeRegulators:D.5/curve-regulator-functoriality`). No source read proves that the rigid syntomic regulator on K_2 of curves commutes with finite pushforward. The node gives a route through the étale comparison (D.5/curve-etale-comparison) and corestriction compatibility of the étale regulator; Asakura and Besser–Loeffler–Zerbes use the compatibility without proof in the sources read.
- **Coleman integration with colliding supports and in genus at least one** (needed by `PadicHodgeRegulators:D.5/coleman-symbol-formula`, `PadicHodgeRegulators:D.5/curve-syntomic-regulator`). ColemanIntegration L1 integrates only on Y = 𝒳 ∖ D with D finite étale (one point of D per residue disc); symbols whose divisors collide modulo p need Coleman integration on general wide opens, which no layer owns. ColemanIntegration's recorded gaps 'Independence of the Frobenius lift and functoriality when Ω+ is not free' and 'Algebraic de Rham comparison for good-reduction affine curves' are inherited for genus ≥ 1.
- **K_2 integrality for curves of genus at least two** (needed by `PadicHodgeRegulators:D.5/curve-syntomic-regulator`). The identification K_2(𝒳)_Q → K_2(X)_Q ∩ ker(tame symbols) used to feed symbols into the regulator needs Harder-type finiteness; EllipticKTheory supplies it only for elliptic curves (E.5/harder-finiteness).
- **Vologodsky integration has no owner** (needed by `PadicHodgeRegulators:D.5/semistable-input-boundary`). The bad-reduction symbol formula replaces Coleman integration by Vologodsky integration (Besser–Zerbes; Besser 2021). No roadmap of the atlas plans Vologodsky integration; see restructure.
- **Specialisation of curve regulators in families** (needed by `PadicHodgeRegulators:D.5/curve-regulator-functoriality`). Specialisation of the syntomic regulator to fibres of a smooth family (Asakura, Theorem 4.9, via Asakura–Miyatani arXiv:2007.14255) was not read; only base change along finite unramified extensions is planned.

## Mistakes found in the sources

The packet records each with its locator, the printed text, the correction and the search for an existing correction.

- `PadicHodgeRegulators/E101` (gap, GSWZ2024, §1.5, after (19), p. 9 (arXiv 2412.04241v2)): Besser–de Jeu Theorem 1.6(2) (and 1.10, 1.12) shows the coincidence only on classes presented by special units of the valuation ring (and on roots of unity); the identity for arbitrary elements is their Conjecture 1.14. D_p should be defined on K_3(K_p; Z_p) as the regulator, and the dilogarithm formula used only for special-unit presentations at p, which covers GSWZ's uses (Lemma 3.1 concerns special units; the Nahm and knot examples use global units).
- `PadicHodgeRegulators/E102` (gap, GSWZ2024, Theorem 9 and proof, p. 39 (arXiv 2412.04241v2)): For K_p = ∏_i Q_{p^{s_i}} with more than one factor and ζ restricted to roots of unity with every component ≠ 1 (GSWZ E38), generation needs Proposition 3.3 in a product form: the Z_p-span of {p^{−2}D(ζ) − p^{−2}D(ζ')} is also Z_{p^s} (D.3/residue-spanning (b), (c)), which follows from the same counting bound.
- `PadicHodgeRegulators/E103` (gap, BdJ2003, Remark 1.13, p. 6 (arXiv math/0110334v2)): The relation reg^Gros = (1 − Frob/p^n) reg converts Li_n into Li_n^{(p)}, but Theorem 1.12 carries the factor ±(n − 1)! that Gros's formula lacks; the remark should account for it (a normalisation of the Chern classes). For n = 2 the factor is 1.
- `PadicHodgeRegulators/E104` (misprint, BdJ2003, Proof of Theorem 1.12, p. 41 (arXiv math/0110334v2)): s ≥ 1; and 'As reg([x]n) = Lmod,n(x) if x is a special unit' should carry the factor ±(n − 1)!.
- `PadicHodgeRegulators/E105` (misprint, BdJ2003, Proof of Lemma 4.10 and (4.4), p. 25 (arXiv math/0110334v2)): (dω, (1 − φ∗/q^n)ω − dε), as the cone differential (4.1) d(a, b) = (da, f(a) − db) requires; and '(ω, η)' should read (ω, ε).
- `PadicHodgeRegulators/E106` (misprint, CN2017, §1, p. 2 and §2.4.3, p. 23 (arXiv 1505.06471v4)): 0 ≤ b(r) ≤ p − 2 (equivalently a(r) = ⌊r/(p − 1)⌋, as in Nekovář–Nizioł §4.1).
- `PadicHodgeRegulators/E107` (gap, CN2017, Theorem 1.1(ii), p. 2, against Theorem 5.4(ii), p. 54 (arXiv 1505.06471v4)): Theorem 5.4(ii) states N = N(K, p, r); the proof (descent from K(ζ_{p^i}) with i ≥ c(K) + 3, Lemma 5.9) gives dependence on K, not only on e.
- `PadicHodgeRegulators/E108` (error, NN2016, Remark 4.14, p. 54 (arXiv 1309.7620v5)): Assume r ≥ q + 2.
- `PadicHodgeRegulators/E109` (misprint, NN2016, Theorem 5.9, p. 59 (arXiv 1309.7620v5)): H^i in place of H^{i+1}, as in Theorem B (p. 7).
- `PadicHodgeRegulators/E110` (error, NN2016, Proposition 2.16, p. 15 (arXiv 1309.7620v5)): The hypothesis must exclude weight 0 contributions (for instance F^0 D_K = 0 in the twisted form of NN §4); in the applications (terms E_2^{i,j} with i ≥ 1, j ≤ r − i) the stronger hypothesis holds.
- `PadicHodgeRegulators/E111` (misprint, HK2011, Definition 0.4.5, p. 6 (arXiv math/0612611v1)): Tr(x_{σ(1)} ∘ ⋯ ∘ x_{σ(2n−1)}).
- `PadicHodgeRegulators/E112` (misprint, Berger2003, Lemma II.1, p. 10 (arXiv math/0209283v1)): 'if n = 0', and the hypothesis ψ(y) = y, used in the proof and in all applications, should be in the statement.
- `PadicHodgeRegulators/E113` (gap, FO, Proof of Proposition 6.36(1), p. 150): Non-vanishing (dimension 1) follows from the Euler characteristic formula, since H^0(Q_p(−1)) = H^2(Q_p(−1)) = 0; Tate duality pairs H^1(Q_p(−1)) with H^1(Q_p(2)), not with H^0.
- `PadicHodgeRegulators/E114` (misprint, HK2, Appendix A, Proposition A.3, p. 47 (arXiv math/0101071v2)): (O_F^*)^∧.
- `PadicHodgeRegulators/E115` (misprint, Berger2003DM, Proof of Theorem A.3, p. 126 (Documenta version)): With the paper's convention (positive = Hodge–Tate weights ≤ 0, p. 105) the case treated has weights ≥ 0; 'positive' should read 'with nonnegative Hodge–Tate weights'.
- `PadicHodgeRegulators/E116` (misprint, LZ2014, §2, p. 7 (arXiv 1108.5954v3)): [Ber03, Theorem A.3] (Theorem A.2 is the characterisation of Wach modules).
- `PadicHodgeRegulators/E117` (misprint, AC20, Remark 3.2(1), p. 15 (arXiv 2003.08888v2)): [Be1, Proposition 8.6.3], as Besser–de Jeu cite the same item.

## Proposed restructuring

- **split** (PadicHodgeRegulators): RT-AREA-iwasawa-2/3: the Fontaine–Messing–Kato log-syntomic package (S_n(r)_X, the period morphism to p-adic nearby cycles, the Kato–Kurihara–Tsuji small-twist isomorphism, the syntomic exponential) is owned by this roadmap and is a prerequisite of D.2's comparisons and of D.5's bad-reduction boundary. It is planned as sub-structure of D.2 under the parent node D.2/log-syntomic-complex. *Proposal:* Sub-layer 'D.2:log-syntomic — Log-syntomic complexes and the Fontaine–Messing–Kato period map', containing PadicHodgeRegulators:D.2/log-syntomic-complex, D.2/fontaine-messing-kato-period-map, D.2/small-twist-comparison and D.2/syntomic-exponential; edges D.2:log-syntomic → D.2 and D.2:log-syntomic → D.5. The sub-layer owns the classical (log-crystalline) complexes and their period map; the prismatic syntomic complexes are PrismaticCohomology:PR.4/syntomic-complex, and the comparison of the two (Antieau–Mathew–Morrow–Nikolaus) is owned downstream of PR.4, RT.3b and this sub-layer, as the PrismaticCohomology packet proposes (CohomologyComparisons CP.6 or a sub-stage of RefinedTraceMethods RT.3b).
- **rescope** (PadicHodgeRegulators): The library audit classes L0 as a process layer: it introduces no carrier. Its three nodes are convention and interface comparisons (Hodge–Tate sign, twists, the fundamental sequences and the integral small-weight interface) consumed by L1–L4 and D.2. *Proposal:* Merge L0 into L1 as its opening section 'Conventions and imported period-ring interface', keeping the three node ids; L3/L4's L0 prerequisites then point at L1.
- **rescope** (PadicHodgeRegulators, SelmerIwasawaCohomology): RT-AREA-iwasawa-1/19: the stage edge PadicHodgeRegulators:L1 → SelmerIwasawaCohomology:L2 makes the generic Selmer layer depend on p-adic Hodge theory, although L2's unramified, strict, relaxed and Greenberg conditions do not use Bloch–Kato maps. The consumer in this packet's supply list is SelmerIwasawaCohomology:L4/bloch-kato-condition. *Proposal:* Delete the edge PadicHodgeRegulators:L1 → SelmerIwasawaCohomology:L2 and keep PadicHodgeRegulators:L1 → SelmerIwasawaCohomology:L4.
- **split** (MotivicEtaleKTheory, HabiroNumberFields, PadicHodgeRegulators): RT-AREA-ktheory-2/18: Soulé's étale Chern classes with finite coefficients and their product formula are planned in MotivicEtaleKTheory M.8, HabiroNumberFields HB.1/HB.2 and needed by D.2; M.8 itself requires D.2, so D.2 cannot import M.8. *Proposal:* Plan Soulé's classes c_{i,k} : K_{2i−k}(R; Z/n) → H^k_et(R, μ_n^{⊗i}) and the product formula once, in the part of MotivicEtaleKTheory that needs only M.7 (étale K-theory); HB.1, HB.2 and D.2/etale-regulator import it (request recorded on MotivicEtaleKTheory:M.7). HB.1 keeps the K_3 specialisation c_ζ and the χ^{−1}-identification.
- **extend** (ColemanIntegration, PadicHodgeRegulators): The bad-reduction symbol formula for curves needs Vologodsky integration (Besser–Zerbes, Besser–Raskind, Besser 2021), which no roadmap plans. *Proposal:* ColemanIntegration, Part II: Vologodsky integration on curves with semistable reduction (its comparison with glued Coleman integrals and harmonic cochains), imported by PadicHodgeRegulators D.5/semistable-input-boundary and by EllipticRegulators for bad reduction.
