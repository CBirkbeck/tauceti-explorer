# P-adic regulators: local conditions, local K₃ and curve symbols

Revision of eight target-level layers: local Bloch–Kato/Iwasawa regulator comparisons, the smooth unramified syntomic/étale regulator, completed local K₃ and its global/Habiro exports, and weight-two curve regulators. The original 68 IDs and four new D.5 IDs are retained. Direct de Rham local duality, divided versus undivided integral period maps, and the rigid-to-modified norm comparison are specified from public primary sources. D.5 now includes relative curve-symbol construction and smooth-fibre specialization, plus the semistable continuous/discrete construction and full second-kind symbol formula on ker N. Eight stages are planned at target granularity; external producer gaps and the global injectivity conjecture remain explicit. The independent round-2 review accepts this completed planning pass after the corrections recorded below; implementation remains unchecked.

## Independent round-2 review

[REV-PadicHodgeRegulators--D.1~2](../reviews/REV-PadicHodgeRegulators--D.1~2.md) accepts all 72 targets: 54 verified, 18 corrected, none added or unverifiable. All 19 pinned declarations and 17 source findings were checked, with 16 findings confirmed and E103 rejected. The main additional repairs are the filtered-complex long exact sequence, explicit rational syntomic boundary normalization, factorial/sign conventions, the raw curve base-change norm factor, and the full relative proper-family hypotheses. The report gives every individual verdict and records the remaining nine gaps and twenty external requests. The suggested Lean file elaborated at the pinned Mathlib with only `sorry` warnings; it is an interface sketch with explicitly omitted supplier hypotheses and unproved obligations.

## Scope, ownership and construction order

This part covers L0–L2 and D.1–D.5. L3–L4 are the big-logarithm part and consume these interfaces. The accepted RS-26 boundary assigns regulator comparisons to this roadmap, while general period, cohomology, K-theory and integration constructions remain with their suppliers. Read the stages in the order L0, L1, L2, D.1, D.2, D.3, D.4, D.5; dependencies within a stage are given with every target. The four new curve targets complete the target-level scope without splitting routine proof steps into additional nodes.

L0 is a conventions interface. L1 owns the Bloch–Kato subgroups and maps and their regulator applications. L2 owns the generator, root, twist, lattice and Kummer–Coleman comparisons around imported Fontaine/Iwasawa complexes; it does not duplicate the generic ψ-complex, Wach or Iwasawa-cohomology packages. D.1 owns the finite-étale and semilocal dilogarithm interfaces, importing the local-unit substrate and Coleman functions. D.2 owns the smooth rigid-syntomic and étale regulator and their comparison. D.3 owns the unramified p>3 regulator isomorphism and generation theorem, importing completed K₃ and its rank. D.4 owns global/semilocal regulator exports, leaving global injectivity open. D.5 owns curve-regulator constructions and comparison formulas, including relative symbol extensions and semistable continuous regulators; generic relative filtered F-isocrystals, Ext, connections and integration remain imports.

The early classical integral/open log-syntomic prefix belongs to **CohomologyComparisons, Part II**, after CrystallineCohomology CR.5/CR.6. Its CS.0–CS.3 producer IDs below are stable proposed contracts, not existing atlas nodes. Current CP.4 is a routing anchor for the proper rational comparison, and does not already supply the integral, open or relative prefix. The smooth rigid good-reduction construction has its own path and does not require the whole generic log-syntomic prefix. The previously rejected Colmez–Nizioł and alternative-source detours remain rejected.

The red-team boundaries are retained: Selmer L4 consumes L1 local conditions, while a reverse dependency into Selmer L2 is absent; K₃ and D.1 feed D.2 rather than duplicating its regulator; Soulé’s Chern-class producer is the early M.7-only prefix, not the downstream M.8 package. Local-unit decomposition and the unramified/Witt/Frobenius substrate are imported from the upstream LocalFieldsRamification roadmap. The upstream HodgeStructures roadmap supplies its structural theory, and is not replanned as a relative filtered F-isocrystal category.

## Notation and normalization

**hodgeTate.** Hodge–Tate weights in the convention HT(Q_p(1)) = +1: h is a weight when Fil^{−h}D_dR ≠ Fil^{−h+1}D_dR (as in PadicHodgeTheory R06.2, R06.4, the L3–L4 packet and Lei–Loeffler–Zerbes). Sources with the opposite sign are translated.

**periods.** t = log[ε] for a fixed compatible system ε of p-power roots of unity; e_r = t^{−r} ⊗ ε^{⊗r} is the canonical basis of D_dR(Q_p(r)), independent of ε, with φ(e_r) = p^{−r}e_r; D_dR(Q_p(r)) is identified with K through e_r. In L2 only, the notation e_j inside D(T(j)), N(T(j)) and cocycles denotes the chosen representation basis ε^{⊗j}, not the canonical de Rham vector above; it scales by a^j when ε is replaced by ε^a.

**frobenius.** Arithmetic Frobenius throughout (φ(ζ) = ζ^p on roots of unity of order prime to p); sources using the geometric Frobenius (Huber–Kings 2003) are converted.

**logarithm.** The Iwasawa branch log_p(p) = 0 of ColemanIntegration:L0/iwasawa-logarithm; D_p(z) = Li_2(z) + ½ log_p(z) log_p(1 − z) is Coleman's D for this branch, equal to Besser–de Jeu's L_mod,2.

**regulators.** Soulé's étale regulator uses Chern classes; Besser's syntomic regulator reg_syn = η ∘ c^syn satisfies r^et = exp_BK ∘ reg_syn with no constant; D_p on completed K_3 is ε·log_BK ∘ c_{2,1} with the sign ε fixed by D_p([ζ]) = Li_2(ζ); Gros's normalisation is (1 − σ/p²)·D_p. For good-reduction curves, regP=Θ∘reg_syn=log_BK∘r_et and regSynCan=(1−Φ/q²)regP, with the explicit norm comparison β and transported K-action of D.5. Semistable curves have separate continuous reg^c,π and discrete reg^d coordinates; the symbol pairing is on ker N with a fixed uniformizer/branch. Relative AM Frobenius coordinates use a negative syntomic-coordinate comparison at n=1.

**kTheory.** K_3(L; Z_p) is π_3 of the p-completed K-theory spectrum (KTheoryFiniteLocalFields:L.1/completed-k-theory); for p > 3 and L unramified it is free of rank [L : Q_p] and equals the completion of Suslin's Bloch group.

For the integral syntomic comparison use U for the undivided complex and D for the divided one. CN’s S is U; Ertl–Nizioł’s S is D and S′ is U. Exact small-weight comparison is a theorem about D. The map from U uses ω and keeps its p-power scaling. For curve cohomology write Φ=φ_p^f for the K-linear q-Frobenius; P=φ_p/p² is only Q_p-linear. The cup trace is denoted B_cup when B=1−Φ/q² also occurs.

The explicit curve normalization uses β induced by the norm operator N_f, the raw boundaries j_p and j_q, and Θ=B⁻¹j_q⁻¹β=A⁻¹j_p⁻¹. The K-action on rigid syntomic H² is transported through Θ. These choices are required for the equality with log_BK, and prevent a raw Frobenius-cone coordinate from silently acquiring the normalized meaning. The relative AM coordinate square has sign −1 in curve degree. A semistable formula holds for a fixed uniformizer/logarithm branch and pairs the continuous component with ker N.

## Baseline and suppliers

The reviewed library audit was read before revising the plan. Baseline statements were reread at the full recorded pins. None of the period/cohomology/K-theory carriers absent from those pins is treated as a formalized result. Tau Ceti’s finite-coefficient Kummer map is a near miss for continuous p-adic Kummer realization, which is requested from Selmer L0. IsArithFrobAt specifies a residue congruence; it does not manufacture an arithmetic Frobenius automorphism. The baseline supports polynomial calculations, finite fields, free modules, linear algebra, and the specified upstream substrates.

- `mathlib:Algebra.norm`: The norm S →* R of an R-algebra as the determinant of multiplication. Statement read at the pinned commit on 2026-10-06 (line 61). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:Algebra.trace`: The trace S →ₗ[R] R of an R-algebra as the trace of multiplication. Statement read at the pinned commit on 2026-10-06 (line 71). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:FreeAbelianGroup`: The free abelian group on a type, the group of formal symbols [z]. Statement read at the pinned commit on 2026-10-06 (line 96). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:IsArithFrobAt`: Predicate stating the arithmetic residue congruence at an ideal; it does not construct the unramified Frobenius automorphism (imported upstream). Statement read at the pinned commit on 2026-10-06 (line 183). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:Module.Free`: The predicate that a module is free. Statement read at the pinned commit on 2026-10-06 (line 43). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:OrzechProperty`: Commutative rings have the Orzech property: a surjection onto a finitely generated module from a submodule (or through an injection) is injective; used for 'surjective between free modules of equal rank implies injective'. Statement read at the pinned commit on 2026-10-06 (line 63). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:PadicComplex`: ℂ_[p], the completion of the algebraic closure of ℚ_[p]. Statement read at the pinned commit on 2026-10-06 (line 137). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:Polynomial`: Polynomial rings, the carrier of the finite polylogarithm. Statement read at the pinned commit on 2026-10-06 (line 73). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:Submodule.span`: The span of a set in a module. Statement read at the pinned commit on 2026-10-06 (line 46). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`: Nakayama's lemma: for N' finitely generated and I ≤ jacobson ⊥, N' ≤ N ⊔ I•N' implies N' ≤ N; used to lift spanning modulo p. Statement read at the pinned commit on 2026-10-06 (line 146). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:WittVector`: p-typical Witt vectors W(R). Statement read at the pinned commit on 2026-10-06 (line 52). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:WittVector.frobenius`: Witt-vector Frobenius ring homomorphism; the unramified integer-ring classification and equality with arithmetic Frobenius are imported upstream, not supplied by this declaration alone. Statement read at the pinned commit on 2026-10-06 (line 221). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:ZMod`: ℤ/nℤ, in particular 𝔽_p. Statement read at the pinned commit on 2026-10-06 (line 142). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `mathlib:bernoulli`: Bernoulli numbers with B_1 = −1/2 (bernoulli n = (−1)^n bernoulli' n). Statement read at the pinned commit on 2026-10-06 (line 195). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `tauceti:TauCeti.teichmuller`: The Teichmüller lift 𝓀[K]ˣ →* 𝒪[K]ˣ of a nonarchimedean local field. Statement read at the pinned commit on 2026-10-06 (line 100). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `tauceti:TauCeti.residue_teichmuller`: The Teichmüller lift is a section of reduction. Statement read at the pinned commit on 2026-10-06 (line 132). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `tauceti:TauCeti.eq_teichmuller`: A (q−1)-torsion unit reducing to α is the Teichmüller lift of α. Statement read at the pinned commit on 2026-10-06 (line 158). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `tauceti:TauCeti.range_teichmuller`: The image of the Teichmüller lift is μ_{q−1}(𝒪[K]). Statement read at the pinned commit on 2026-10-06 (line 175). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.
- `tauceti:TauCeti.kummerClassMap`: Finite-coefficient injective Kummer class map Kˣ/(Kˣ)^n→H¹(G_K,μ_n); the continuous p-adic identification and inverse-limit compatibility are supplied by SelmerIwasawaCohomology L0. Statement read at the pinned commit on 2026-10-06 (line 279). Independently reread at the full pinned commit by REV-PadicHodgeRegulators--D.1. Statement reread at the full pin in this revision on 2026-10-08; support limits retained. Independent round-2 review REV-PadicHodgeRegulators--D.1~2 read the full declaration statement at the full pin on 2026-10-08 and confirmed the stated support limits.

## Target plan

### L0. Period and twist conventions

#### Hodge–Tate, twist and period conventions for the regulator

`PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions` — comparison.

Throughout PadicHodgeRegulators: (i) t = log[ε] ∈ B_dR^+ is the period of Z_p(1) for a fixed compatible system ε = (ζ_{p^n}) of p-power roots of unity; Fil^i B_dR = t^i B_dR^+, g(t) = χ(g)t for the cyclotomic character χ, and φ(t) = pt in B_cris (arithmetic Frobenius). (ii) Hodge–Tate weights: h is a weight of V when Fil^{−h}D_dR(V) ≠ Fil^{−h+1}D_dR(V); with this convention Q_p(1) has weight +1 and V_pA of an abelian variety has weights 0 and 1, matching the L3–L4 packet, PadicHodgeTheory R06.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 (HT(χ) = +1). (iii) For r ∈ Z, e_r := t^{−r} ⊗ ε^{⊗r} is a basis of D_cris(Q_p(r)) = K_0·e_r and of D_dR(Q_p(r)) = K·e_r, independent of ε, with φ(e_r) = p^{−r}e_r, Fil^{−r} = D_dR and Fil^{−r+1} = 0; hence D_dR(Q_p(r))/Fil^0 = K·e_r for r ≥ 1 and 0 for r ≤ 0. (iv) Twisting: D_cris(V(i)) = D_cris(V)⟨i⟩ via d ↦ d ⊗ e_i, with Fil^j(D⟨i⟩) = Fil^{j+i}D and φ|_{D⟨i⟩} = p^{−i}φ|_D. (v) Crystalline representations have N = 0; the monodromy operator is used only for semistable inputs (D.5's boundary). Sources using the opposite weight sign (Benois: Q_p(1) of weight −1) are translated, never mixed.

**Hypotheses.** K/Q_p finite with maximal unramified subfield K_0; V a p-adic representation of G_K.

**Suggested declaration.** `hodge_tate_and_twist_conventions`.

**Direct prerequisites.** `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.1/bdr-filtration-and-graded`, `PadicHodgeTheory:R06.1/frobenius-on-acris`, `PadicHodgeTheory:R06.2/ddr-of-tate-twists`, `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`.

**Proof or construction.**

1. (i)–(iii) are properties of the imported period rings and functors (PadicHodgeTheory R06.1/fontaine-element-t, R06.1/bdr-filtration-and-graded, R06.2/ddr-of-tate-twists and R06.2/hodge-tate-weight-convention); this node pins how the regulator layers read them; e_r is G_K-invariant because g acts on t^{−r} by χ(g)^{−r} and on ε^{⊗r} by χ(g)^r.
2. (iv) is Fontaine–Ouyang Definition 9.4 and Lemma 9.5.
3. The weight convention is fixed by comparing with Berger §I.2 and Lei–Loeffler–Zerbes §2.1.

**Acceptance.**

- D_dR(Q_p(2)) = K·e_2 with φ(e_2) = p^{−2}e_2 and D_dR(Q_p(2))/Fil^0 = K: the target of the weight-two regulator.
- D_dR(Q_p)/Fil^0 = 0 and D_dR(Q_p(−1))/Fil^0 = 0.
- A source stating 'Q_p(1) has Hodge–Tate weight −1' is translated by h ↦ −h before use.

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Definition 9.4 and Lemma 9.5, pp. 218–219 — The twist convention (iv).; [Berger2003](https://arxiv.org/abs/math/0209283v1), §I.2, p. 6 — The sign convention, with Q_p(1) of weight +1 in the conventions used here.; [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), §1.3, p. 646 — The canonical basis e_r of (iii)..

#### The fundamental exact sequences used by the Bloch–Kato maps

`PadicHodgeRegulators:L0/fundamental-exact-sequences` — comparison.

From PadicHodgeTheory R06.1 (its nodes fundamental-exact-sequence, bcris-twisted-frobenius-sequences and divided-frobenius-exact-sequence), with the conventions of L0/hodge-tate-and-twist-conventions: (a) with B_e := B_cris^{φ=1}, the sequences 0 → Q_p → B_e → B_dR/B_dR^+ → 0 and 0 → Q_p → B_e ⊕ B_dR^+ → B_dR → 0 are exact; (b) 0 → Q_p → B_cris --(φ − 1, mod Fil^0)--> B_cris ⊕ B_dR/B_dR^+ → 0 is exact; (c) for every r ∈ Z, 0 → Q_p(r) → Fil^r B_cris --(p^{−r}φ − 1)--> B_cris → 0 is exact (Fontaine); (d) integrally, 0 → Z_p(r)' → Fil^r A_cr --(p^r − φ)--> A_cr has cokernel killed by p^r, with Z_p(r)' = p^{−a(r)}Z_p(r) for r = (p − 1)a(r) + b(r). Tensoring (a)–(c) with any p-adic representation V gives exact sequences of G_K-modules; for de Rham V, H^0(K, (B_dR/B_dR^+) ⊗ V) = D_dR(V)/Fil^0 and H^0(K, B_e ⊗ V) = D_cris(V)^{φ=1}.

**Hypotheses.** K/Q_p finite; V any p-adic representation for exactness, de Rham for the identification of invariants.

**Suggested declaration.** `fundamental_exact_sequences`.

**Direct prerequisites.** `PadicHodgeTheory:R06.1/fundamental-exact-sequence`, `PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences`, `PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence`, `PadicHodgeTheory:R06.1/period-ring-invariants`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`.

**Proof or construction.**

1. (a) is PadicHodgeTheory:R06.1/fundamental-exact-sequence (Fontaine–Ouyang Theorem 7.28(4) and Remark 7.29); the second form follows by adding B_dR^+.
2. (b) is Fontaine–Ouyang (9.12), obtained from (a); (c) is PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences; (d) is PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence (Colmez–Nizioł §2.4.3, Lemma 2.23).
3. Tensoring over Q_p with V is exact; invariants are computed by the period functors of R06.2.

**Acceptance.**

- For V = Q_p(r), r ≥ 1: H^0(K, B_e(r)) = D_cris(Q_p(r))^{φ=1} = 0, so the connecting map of (a) ⊗ V is injective on D_dR/Fil^0.
- For V = Q_p: H^0(K, B_e) = K_0^{φ=1} = Q_p and D_dR(Q_p)/Fil^0 = 0.

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Theorem 7.28(4), p. 170 — (a), second form.; [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Remark 7.29, p. 171 — (a), first form.; [CN2017](https://arxiv.org/abs/1505.06471v4), §2.4.3, p. 23 — (d), with t^{r} = t^{b(r)}(t^{p−1}/p)^{a(r)} spanning Z_p(r)'..

#### Integral comparison interface for small weights

`PadicHodgeRegulators:L0/integral-period-interface` — comparison.

For K/Q_p finite unramified and a crystalline G_K-stable Z_p-lattice T with Hodge–Tate weights in [0, p − 2] (HT(χ) = +1), the Fontaine–Laffaille correspondence T ↔ M (strongly divisible W(k)-lattice in D_cris(V^∨)) of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 is imported with its normalisation; for T = Z_p(r), 0 ≤ r ≤ p − 2, the lattice is W(k)·e_{−r} in D_cris(Q_p(−r)). The integral Bloch–Kato statement of L1/integral-logarithm-unramified and the integral period map of D.2/fontaine-messing-kato-period-map are formulated against these lattices and the integral sequence L0/fundamental-exact-sequences (d); no further integral period carrier is introduced here.

**Hypotheses.** K unramified over Q_p; weights in [0, p − 2]; p odd.

**Suggested declaration.** `integral_period_interface`.

**Direct prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/strongly-divisible-lattices`, `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`, `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`.

**Proof or construction.**

1. The lattice correspondence is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence; its small-weight interface (indices translated to HT(χ) = +1) is PadicHodgeTheory R06.4.
2. For a rank-one Tate twist the strongly divisible lattice is W(k)·e_{−r}: p^{−i}Φ(M ∩ Fil^i) = M holds because Φ(e_{−r}) = p^r e_{−r} and Fil^r ∩ M = M.

**Acceptance.**

- T = Z_p(2) with p ≥ 5 lies in the Fontaine–Laffaille range [0, p − 2].
- T = Z_p(p − 1) is outside the range; the integral statements of L1 are not asserted there.

**Sources.** [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), §1.3, p. 647 — The integral lattice O_K·e_m in D_dR(Q_p(m)) against which the integral statements are measured..

### L1. Bloch–Kato local maps

#### The Bloch–Kato local conditions H¹_e, H¹_f, H¹_g

`PadicHodgeRegulators:L1/bloch-kato-subgroups` — definition.

Let K/Q_p be finite and V a p-adic representation of G_K. Define H^1_e(K, V) := ker(H^1(K, V) → H^1(K, B_e ⊗ V)), H^1_f(K, V) := ker(H^1(K, V) → H^1(K, B_cris ⊗ V)) and H^1_g(K, V) := ker(H^1(K, V) → H^1(K, B_dR ⊗ V)), so H^1_e ⊆ H^1_f ⊆ H^1_g. For a G_K-stable Z_p-lattice T ⊂ V and W = V/T, H^1_f(K, T) is the preimage of H^1_f(K, V) and H^1_f(K, W) the image of H^1_f(K, V); these are the finite local conditions. For ℓ ≠ p (K/Q_ℓ finite) H^1_f := H^1_ur. The singular quotient is H^1_s := H^1/H^1_f.

**Hypotheses.** K/Q_p finite (or K/Q_ℓ finite with ℓ ≠ p for the unramified condition); V finite-dimensional continuous.

**Suggested declaration.** `blochKatoF`.

**Direct prerequisites.** `PadicHodgeRegulators:L0/fundamental-exact-sequences`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `ArithmeticGaloisDuality:R02.1/rationalization`, `SelmerIwasawaCohomology:L0/padic-kummer-identification`.

**Proof or construction.**

1. The maps are induced by V → B_* ⊗ V on continuous cohomology (ArithmeticGaloisDuality R02.1).
2. The inclusions follow from B_e ⊂ B_cris ⊂ B_dR.
3. The integral conditions are the propagated conditions of Rubin, Euler Systems, Definition I.3.4 and Remark I.3.6.

**Acceptance.**

- V = Q_p: H^1_f = H^1_ur (dimension 1) while dim H^1 = [K : Q_p] + 1.
- V = Q_p(1): H^1_f is the image of (O_K^×)^∧ ⊗ Q_p under the Kummer map, of dimension [K : Q_p].

**API.**

- `blochKatoE` (data): blochKatoE K V : Submodule ℚ_p (H^1(K, V)).
- `blochKatoF` (data): blochKatoF K V : Submodule ℚ_p (H^1(K, V)).
- `blochKatoG` (data): blochKatoG K V : Submodule ℚ_p (H^1(K, V)).
- `blochKatoE_le_F` (relation): blochKatoE K V ≤ blochKatoF K V ≤ blochKatoG K V.
- `blochKatoF_lattice` (constructor): blochKatoF K T := preimage under H^1(K, T) → H^1(K, V); blochKatoF K (V/T) := image.
- `blochKatoF_map` (functoriality): For a G_K-map V → V', H^1(K, V) → H^1(K, V') maps blochKatoF into blochKatoF (same for e, g).
- `blochKatoF_res` (functoriality): For L/K finite, restriction maps blochKatoF K V into blochKatoF L V and corestriction maps back.
- `blochKatoF_unramified` (compatibility): For ℓ ≠ p, blochKatoF := H^1_ur.
- `blochKatoE_extensionality` (extensionality): Two Bloch–Kato submodules agree iff their membership predicates agree on every class, by Submodule.ext. Each inherits the ambient Q_p-module operations; membership is stable under zero, addition and scalar multiplication.

**Unit tests.**

- `blochKatoF_trivial` (computation): For V = Q_p and K = Q_p, blochKatoF = H^1_ur(Q_p, Q_p) = Hom(Gal(Q_p^ur/Q_p), Q_p), of dimension 1, while H^1(Q_p, Q_p) has dimension 2.
- `blochKatoF_negative_twist` (degenerate): For V = Q_p(−1), H^1_e = H^1_f = H^1_g = 0 although H^1(K, Q_p(−1)) has dimension [K : Q_p].
- `blochKatoF_rubin_compat` (compatibility): For V = Q_p(1), blochKatoF agrees with Rubin's U_{L,v} ⊗ Φ condition (Euler Systems, §I.6.3, (7)) and with the Kummer image of the completed units.
- `blochKatoG_not_all` (non-example): For V = Q_p, H^1_g(K, Q_p) = H^1_f(K, Q_p) ≠ H^1(K, Q_p): the de Rham condition is a proper subspace (the ramified homomorphisms are excluded).

**Used by.** SelmerIwasawaCohomology:L4/bloch-kato-condition: H^1_f(F_v, V) = ker(H^1 → H^1(B_cris ⊗ V)) and its integral propagation (RJW Definition 13.19(2)); GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class: loc_v κ(P) ∈ H^1_f = H^1_e for abelian varieties with good reduction; HeegnerPointEulerSystems:HE.3: Kummer classes and exact Selmer conditions; GeneralizedHeegnerCycles:GH.2: ring-class trace and local conditions; PadicHodgeRegulators:L3/ramified-interpolation: the finite-part class for which the Bloch–Kato logarithm is used.

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Definition 9.22, (9.8), p. 232 — The definitions, with (9.7) and (9.10) for e and g.; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Remark I.3.6, p. 7 — The finite condition at p and its integral propagation (Definition I.3.4)..

**Planet.** Bloch–Kato local conditions.

#### The Bloch–Kato exponential

`PadicHodgeRegulators:L1/bloch-kato-exponential` — construction.

For K/Q_p finite and V a de Rham representation, exp_{K,V} : D_dR(V)/Fil^0 D_dR(V) → H^1(K, V) is the connecting homomorphism of 0 → V → B_e ⊗ V → (B_dR/B_dR^+) ⊗ V → 0 (L0/fundamental-exact-sequences (a) ⊗ V). There are exact sequences 0 → H^0(K, V) → D_cris(V)^{φ=1} → D_dR(V)/Fil^0 → H^1_e(K, V) → 0 and 0 → H^0(K, V) → D_cris(V) → D_cris(V) ⊕ D_dR(V)/Fil^0 → H^1_f(K, V) → 0 (the first map x ↦ (φx − x, x̄)); in particular im(exp_{K,V}) = H^1_e(K, V) and ker(exp_{K,V}) is the image of D_cris(V)^{φ=1}. Explicitly, exp(x) is the class of g ↦ (g − 1)b for any b ∈ B_e ⊗ V with b − x ∈ B_dR^+ ⊗ V.

**Hypotheses.** K/Q_p finite; V de Rham (for the identification of the source with D_dR(V)/Fil^0).

**Suggested declaration.** `blochKatoExp`.

**Direct prerequisites.** `PadicHodgeRegulators:L0/fundamental-exact-sequences`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `PadicHodgeTheory:R06.2/period-functors`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`.

**Proof or construction.**

1. Take the long exact cohomology sequence of the tensored fundamental sequence; H^0(K, B_e ⊗ V) = D_cris(V)^{φ=1} and H^0(K, (B_dR/B_dR^+) ⊗ V) = D_dR(V)/Fil^0 for de Rham V.
2. The H^1_f sequence uses L0/fundamental-exact-sequences (b) ⊗ V.
3. The cocycle description is the definition of the connecting map.

**Acceptance.**

- V = Q_p(1): exp agrees with the usual p-adic exponential on a neighbourhood of 0 of K (Bloch–Kato p. 358 as recalled by Huber–Kings).
- V = Q_p(r), r ≥ 2: exp is an isomorphism K·e_r ≅ H^1(K, Q_p(r)).

**API.**

- `blochKatoExp` (data): blochKatoExp K V : D_dR(V) ⧸ Fil^0 →ₗ[ℚ_p] H^1(K, V).
- `blochKatoExp_range` (characterisation): LinearMap.range (blochKatoExp K V) = blochKatoE K V.
- `blochKatoExp_ker` (characterisation): ker (blochKatoExp K V) = image of D_cris(V)^{φ=1} in D_dR(V)/Fil^0.
- `blochKatoExp_injective_iff` (characterisation): blochKatoExp K V is injective iff D_cris(V)^{φ=1} = H^0(K, V).
- `blochKatoExp_cocycle` (simp): blochKatoExp K V x is represented by g ↦ (g − 1)b for b ∈ B_e ⊗ V lifting x.
- `blochKatoExp_map` (functoriality): Natural in V for G_K-equivariant maps of de Rham representations.
- `blochKatoExp_f_sequence` (relation): The exact sequence 0 → H^0 → D_cris → D_cris ⊕ D_dR/Fil^0 → H^1_f → 0.
- `blochKatoExp_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `blochKatoExp_twist_two` (computation): For K = Q_p and V = Q_p(2), blochKatoExp is an isomorphism Q_p·e_2 ≅ H^1(Q_p, Q_p(2)) ≅ Q_p.
- `blochKatoExp_trivial` (degenerate): For V = Q_p, D_dR(Q_p)/Fil^0 = 0, so blochKatoExp = 0 and H^1_e(K, Q_p) = 0.
- `blochKatoExp_kummer` (compatibility): For V = Q_p(1) and u ∈ 1 + p^c O_K (c > 1/(p − 1)), blochKatoExp(log u · e_1) = κ(u), the Kummer class (Bloch–Kato 3.10.1).
- `blochKatoExp_not_onto_f` (non-example): For V = Q_p(1), H^1_e = H^1_f has dimension [K : Q_p] but H^1(K, Q_p(1)) has dimension [K : Q_p] + 1: the exponential does not reach the valuation direction.

**Used by.** PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison: r^et = exp_BK ∘ reg_syn on K_{2n−1}(O_K); PadicHodgeRegulators:D.2/syntomic-exponential: the syntomic exponential composed with the period map is exp_BK; PadicHodgeRegulators:L3/ramified-interpolation: the interpolation formula of the big logarithm at j ≤ −1 uses the Bloch–Kato logarithm; PhiGammaModulesAndIwasawaCohomology:PG.5: the Bloch–Kato normalisation comparison at the end of PG.5 (RS-26 link L1 → PG.5).

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), (9.11), p. 233 — The exponential and its exact sequence.; [Berger2003](https://arxiv.org/abs/math/0209283v1), Introduction, p. 2 — The definition..

**Planet.** Bloch–Kato exponential.

#### The Bloch–Kato logarithm

`PadicHodgeRegulators:L1/bloch-kato-logarithm` — construction.

Let K/Q_p be finite and V de Rham with D_cris(V)^{φ=1} = H^0(K, V) (so exp_{K,V} is injective). The Bloch–Kato logarithm is log_BK := exp_{K,V}^{−1} : H^1_e(K, V) → D_dR(V)/Fil^0 D_dR(V). For V = Q_p(r), r ≥ 2, H^1_e = H^1(K, Q_p(r)) and log_BK : H^1(K, Q_p(r)) ≅ K·e_r ≅ K; for V = Q_p(1), log_BK ∘ κ = log_p on O_K^× (Iwasawa branch), with κ the Kummer map.

**Hypotheses.** D_cris(V)^{φ=1} = H^0(K, V).

**Suggested declaration.** `blochKatoLog`.

**Direct prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-exponential`, `ColemanIntegration:L0/iwasawa-logarithm`, `tauceti:TauCeti.kummerClassMap`, `SelmerIwasawaCohomology:L0/padic-kummer-identification`.

**Proof or construction.**

1. exp is injective under the hypothesis and has image H^1_e (L1/bloch-kato-exponential); define log_BK as its inverse on the image.
2. For Q_p(r), r ≥ 2: D_cris(Q_p(r))^{φ=1} = 0 = H^0, and dim H^1 = [K : Q_p] = dim D_dR/Fil^0 (H^0 = H^2 = 0), so H^1_e = H^1.
3. For Q_p(1): Bloch–Kato's comparison of exp with the usual exponential (Bloch–Kato 3.10.1, recalled by Huber–Kings Remark 1.3.3) gives log_BK ∘ κ = log_p.

**Acceptance.**

- log_BK(κ(1 + p)) = log(1 + p) for K = Q_p, p odd.
- For V = Q_p(1) the class of p itself is not in H^1_e, so log_BK(κ(p)) is undefined.

**API.**

- `blochKatoLog` (data): blochKatoLog K V : blochKatoE K V →ₗ[ℚ_p] D_dR(V) ⧸ Fil^0 (under the injectivity hypothesis).
- `blochKatoLog_exp` (simp): blochKatoLog (blochKatoExp x) = x.
- `blochKatoExp_log` (simp): blochKatoExp (blochKatoLog y) = y for y ∈ blochKatoE K V.
- `blochKatoLog_twist` (equivalence): For r ≥ 2, blochKatoLog K (ℚ_p(r)) : H^1(K, ℚ_p(r)) ≃ₗ K·e_r.
- `blochKatoLog_kummer` (compatibility): For r = 1 and u ∈ 𝒪_Kˣ, blochKatoLog (κ u) = log_p u · e_1.
- `blochKatoLog_map` (functoriality): Natural for G_K-maps between representations satisfying the hypothesis.
- `blochKatoLog_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `blochKatoLog_principal_unit` (computation): For K = Q_p (p odd), blochKatoLog (κ(1 + p)) = log(1 + p)·e_1 = (p − p²/2 + p³/3 − …)·e_1.
- `blochKatoLog_teichmuller` (degenerate): For a Teichmüller unit ω, blochKatoLog (κ ω) = 0 (κ(ω) is torsion in H^1(K, Z_p(1)) and log_p(ω) = 0).
- `blochKatoLog_coleman_compat` (compatibility): blochKatoLog ∘ κ = ColemanIntegration's Iwasawa logarithm on 𝒪_Kˣ (ColemanIntegration:L0/iwasawa-logarithm).
- `blochKatoLog_not_defined_trivial` (non-example): For V = Q_p, D_cris^{φ=1} = Q_p = H^0 but D_dR/Fil^0 = 0 and H^1_e = 0, so blochKatoLog has zero source: H^1_f(K, Q_p) ≠ 0 is not in its domain.

**Used by.** PadicHodgeRegulators:D.3/local-regulator: D_L = ε·log_BK ∘ c_{2,1} on completed K_3; EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: z = log_BK(reg_et(u)) for weight-two elliptic classes; GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class: log_BK ∘ κ = log_A for abelian varieties with good reduction; GeneralizedHeegnerCycles:GH.8/differential-evaluation: naturality of log_BK for the quotient and its formal-group comparison.

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Remark 1.3.3, p. 9 — The weight-one case.; [HK2011](https://arxiv.org/abs/math/0612611v1), §1.3, p. 8 — The exponential for Q_p(n), an isomorphism for n > 1..

#### Kato's dual exponential

`PadicHodgeRegulators:L1/dual-exponential` — construction.

For K/Q_p finite and V de Rham, the dual exponential exp*_{K,V^*(1)} : H^1(K, V) → Fil^0 D_dR(V) is the composite H^1(K, V) → H^1(K, B_dR ⊗ V) ≅ D_dR(V), the isomorphism being x ↦ (g ↦ log χ(g)·x) (Kato); its image lies in Fil^0 D_dR(V) and its kernel is H^1_g(K, V). It is the transpose of exp_{K,V^*(1)} for the Tate pairing ⟨ , ⟩ : H^1(K, V) × H^1(K, V^*(1)) → H^2(K, Q_p(1)) = Q_p and the de Rham pairing [ , ] : D_dR(V) × D_dR(V^*(1)) → D_dR(Q_p(1)) = K --Tr_{K/Q_p}--> Q_p: [x, exp*(y)] = ⟨exp(x), y⟩ for x ∈ D_dR(V^*(1))/Fil^0, y ∈ H^1(K, V), with the sign convention pinned here (the sources warn that signs vary).

**Hypotheses.** K/Q_p finite; V de Rham.

**Suggested declaration.** `dualExp`.

**Direct prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `SelmerIwasawaCohomology:L1/orthogonal-complement`, `PadicHodgeTheory:R06.1/de-rham-invariants`, `ArithmeticGaloisDuality:D7/duality-after-localization`, `ArithmeticGaloisDuality:R02.4`, `PadicHodgeTheory:R06.1`.

**Proof or construction.**

1. Fontaine–Ouyang Proposition 6.35 computes H^1(K, t^iB_dR^+/t^jB_dR^+) via cup product with log χ; passing to the limit gives the isomorphism H^1(K, B_dR ⊗ V) ≅ D_dR(V) (Berger Proposition II.5).
2. The image lies in Fil^0 because the map factors through H^1(K, B_dR^+ ⊗ V); its kernel is H^1_g by definition.
3. The adjunction uses the rational perfect cup-product pairing of ArithmeticGaloisDuality:D7/duality-after-localization and the explicitly requested R02.4 extension to every finite K/Q_p; SelmerIwasawaCohomology:L1/orthogonal-complement supplies orthogonality formalism. A discrete class-formation Ext pairing is not this rational representation pairing.

**Acceptance.**

- For K=Q_p and V=Q_p, write η=a·log χ+b·η_ur; then exp*(η)=a. For general finite K/Q_p, exp* is computed through H^1(K,B_dR)≅K, with kernel the one-dimensional unramified subspace; the two-character expansion is asserted only over Q_p.
- V = Q_p(r), r ≥ 1: exp* vanishes, since Fil^0 D_dR(Q_p(r)) = 0.

**API.**

- `dualExp` (data): dualExp K V : H^1(K, V) →ₗ[ℚ_p] Fil^0 D_dR(V).
- `dualExp_ker` (characterisation): ker (dualExp K V) = blochKatoG K V.
- `dualExp_adjoint` (characterisation): deRhamPairing x (dualExp K V y) = tatePairing (blochKatoExp K V^*(1) x) y.
- `dualExp_formula` (simp): dualExp K V is H^1(K, V) → H^1(K, B_dR^+ ⊗ V) ≅ Fil^0 D_dR(V) via ∪ log χ.
- `dualExp_map` (functoriality): Natural in V; compatible with corestriction and trace (L1/twist-and-change-of-field).
- `dualExp_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `dualExp_trivial_log_chi` (computation): For K = Q_p and V = Q_p, dualExp (log χ) = 1.
- `dualExp_positive_twist` (degenerate): For V = Q_p(r) with r ≥ 1, dualExp = 0.
- `dualExp_adjoint_compat` (compatibility): For V = Q_p and x ∈ D_dR(Q_p(1))/Fil^0 = K·e_1: [x, dualExp y] = ⟨exp_{Q_p(1)}(x), y⟩, matching the Kummer/local class field theory pairing.
- `dualExp_kernel_not_f` (non-example): For V = Q_p(1), ker dualExp = H^1_g = H^1 ≠ H^1_f: the kernel is H^1_g, not H^1_f.

**Used by.** PadicHodgeRegulators:L3/ramified-interpolation: B_j = exp* for j ≥ 0 in the interpolation formula of the big logarithm; PadicHodgeRegulators:L4/derham-interpolation-growth: Rodrigues Jacinto's interpolation uses exp* for j ≥ 0; L3/rubin-coleman-map: Rubin's Coleman map is defined through exp*_{ω_A}; KatoEulerSystems:L3: explicit reciprocity expresses exp* of Kato's classes by modular forms.

**Sources.** [Berger2003](https://arxiv.org/abs/math/0209283v1), Introduction, p. 2 — The definition by duality.; [Berger2003](https://arxiv.org/abs/math/0209283v1), §II, p. 13 — Image and kernel..

**Planet.** Kato's dual exponential.

#### Dimensions of the Bloch–Kato subspaces

`PadicHodgeRegulators:L1/dimension-formulas` — theorem.

Let K/Q_p be finite and V a de Rham representation. Then dim H^1_f(K, V) = dim_{Q_p} D_dR(V)/Fil^0 + dim H^0(K, V); dim H^1_f/H^1_e = dim D_cris(V)^{φ=1}; dim H^1_g(K, V) = dim H^1_f(K, V) + dim D_cris(V^*(1))^{φ=1}; and dim H^1(K, V) = [K : Q_p]·dim V + dim H^0(K, V) + dim H^0(K, V^*(1)).

**Hypotheses.** K/Q_p finite; V de Rham (crystalline for nothing further).

**Suggested declaration.** `blochKato_dimension_formulas`.

**Direct prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/local-duality-of-conditions`, `ArithmeticGaloisDuality:D7/duality-after-localization`.

**Proof or construction.**

1. Count dimensions in the exact sequences of L1/bloch-kato-exponential; the two D_cris(V) terms cancel in the H^1_f sequence.
2. The H^1_g formula follows from H^1_g(V) = H^1_e(V^*(1))^⊥ (L1/local-duality-of-conditions) and the H^1_e count for V^*(1).
3. The Euler characteristic formula Σ(−1)^i dim H^i = −[K : Q_p] dim V with H^2(V) dual to H^0(V^*(1)) gives dim H^1.

**Acceptance.**

- V = Q_p(2), K = Q_p: dim H^1_f = 1 = dim H^1.
- V = Q_p(1): dim H^1_f = [K : Q_p] and dim H^1 = [K : Q_p] + 1.
- V = Q_p: dim H^1_f = 1 and dim H^1_g = 1 + dim D_cris(Q_p(1))^{φ=1} = 1.

**Sources.** [BK1990](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf), Corollary 3.8.4 and equation (3.8.5), pp. 355–356 — The finite-part dimension count is established before the duality conclusion.; [Benois2014](https://arxiv.org/abs/1412.7305v1), Proposition 2.8.2(i), p. 44 — The H^1_f formula (for (φ,Γ)-modules, which covers V via D†_rig(V)).; [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), (9.16), p. 235 — The quotient H^1_f/H^1_e..

#### Local duality of the Bloch–Kato conditions

`PadicHodgeRegulators:L1/local-duality-of-conditions` — theorem.

Let K/Q_p be finite and V de Rham. Under the perfect cup-product pairing H^1(K, V) × H^1(K, V^*(1)) → H^2(K, Q_p(1)) = Q_p: H^1_f(K, V^*(1)) = H^1_f(K, V)^⊥, H^1_e(K, V^*(1)) = H^1_g(K, V)^⊥ and H^1_g(K, V^*(1)) = H^1_e(K, V)^⊥. For a G_K-stable lattice T, H^1_f(K, T) and H^1_f(K, V^*(1)/T^*(1)) (propagated conditions; V^*(1)/T^*(1) = Hom(T, μ_{p^∞})) are exact annihilators under the induced pairing H^1(K, T) × H^1(K, V^*(1)/T^*(1)) → Q_p/Z_p. For a finite extension K_ℓ/Q_ℓ with ℓ ≠ p and a finite unramified p-primary G_{K_ℓ}-module M, H¹_un(K_ℓ,M) and H¹_un(K_ℓ,M^D) are exact annihilators under finite local Tate duality; no unrestricted ramified torsion-module assertion is made.

**Hypotheses.** K/Q_p finite; V de Rham (Bloch–Kato Proposition 3.8; Fontaine–Ouyang state it for semistable V).

**Suggested declaration.** `blochKato_local_duality`.

**Direct prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `PadicHodgeRegulators:L1/bloch-kato-exponential`, `ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators`, `SelmerIwasawaCohomology:L1/orthogonal-complement`, `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility`, `ArithmeticGaloisDuality:D7/duality-after-localization`, `ArithmeticGaloisDuality:D7/local-invariant-trivialization`, `ArithmeticGaloisDuality:D7/local-duality-maps`, `ArithmeticGaloisDuality:D7/derived-local-duality`.

**Proof or construction.**

1. Use the direct de Rham argument of BK Proposition 3.8. The fundamental exact sequence with B_cris and B_dR supplies the finite-part connecting map. Cup-product naturality shows that a class killed after extension to B_cris annihilates the finite-part image for the dual twist. This is a connecting-map diagram, not an assertion that all H² with period coefficients vanish.
2. Prove the finite-part dimension count independently of this theorem using BK Lemma 3.8.1 and Corollary 3.8.4: de Rham admissibility implies injectivity of H¹(B_dR⁺⊗V)→H¹(B_dR⊗V); the exact sequence gives dim H_f=dim t_V+dim H⁰(V). Combine the counts for V and V*(1) with the imported rational local Euler characteristic, H²/H⁰ Tate duality and the complementary filtration dimensions. Their sum is dim H¹(V), so finite-part orthogonality is exact. Do not call the downstream L1/dimension-formulas node.
3. For e/g, use the other fundamental exact sequence and its cup-product diagram. BK pp. 357–359 reduce nondegeneracy to the pairing of C_p-cohomology through its boundary into H²(Q_p(1)), with the Hodge–Tate decomposition and the nonzero Kummer boundary. Import the required continuous period-cohomology and filtration-limit facts from PadicHodgeTheory; no ramified descent of H_f is used.
4. Propagate the rational conditions to a lattice and its torsion quotient using the compatible rational/integral local pairings and the image/preimage definitions (Rubin I.4.3, pp. 9–10). Keep the separate finite unramified ℓ≠p assertion at its supplied scope.

**Acceptance.**

- V = Q_p: H^1_f(Q_p) = H^1_ur is the annihilator of H^1_f(Q_p(1)) = Kummer image of units, which is local class field theory's statement that units are the norms killing unramified characters.
- V = Q_p(2), V^*(1) = Q_p(−1): H^1_f(Q_p(2)) = H^1 and H^1_f(Q_p(−1)) = 0 are annihilators.
- Restriction to a ramified field where V becomes semistable is not an equality test for H_f(K,V); the direct proof must work before that restriction.

**Sources.** [BK1990](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf), Proposition 3.8 and its proof, pp. 354–359; Corollary 3.8.4, p. 355 — Direct proof for de Rham representations, with an independent finite-part dimension count.; [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Theorem 9.27, p. 235 — The statement (citing Bloch–Kato Proposition 3.8).; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Remark I.7.1, p. 17 — The same, in Rubin's notation V^* = V^*(1)..

#### Twists, restriction and corestriction for the Bloch–Kato maps

`PadicHodgeRegulators:L1/twist-and-change-of-field` — lemma.

Let L/K be a finite extension of finite extensions of Q_p and V de Rham over K. (a) Restriction: res_{L/K} ∘ exp_{K,V} = exp_{L,V} ∘ ι, with ι : D_dR,K(V) → L ⊗_K D_dR,K(V) = D_dR,L(V) the inclusion. (b) Corestriction: cor_{L/K} ∘ exp_{L,V} = exp_{K,V} ∘ Tr_{L/K}, and Tr_{L/K} ∘ exp*_L = exp*_K ∘ cor_{L/K}. (c) Twisting: for i ∈ Z, D_cris(V(i)) = D_cris(V) ⊗ e_i and D_dR(V(i)) = D_dR(V) ⊗ e_i with Fil^j shifted by i and φ multiplied by p^{−i}; a chosen basis of Q_p(i) does not induce a canonical finite-level cohomology isomorphism H^1(K, V) ≅ H^1(K, V(i)), and twisting enters the exponentials only through Iwasawa cohomology (L2/local-iwasawa-twist). (d) Shapiro: for V a representation of G_L, H^1(K, Ind_L^K V) ≅ H^1(L, V) carries H^1_f to H^1_f and exp_{K, Ind V} to exp_{L, V} under D_dR,K(Ind V) = D_dR,L(V).

**Hypotheses.** K ⊆ L finite over Q_p; V de Rham.

**Suggested declaration.** `blochKato_change_of_field`.

**Direct prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/dual-exponential`, `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`, `PadicHodgeTheory:R06.2/de-rham-base-change`, `PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars`, `ArithmeticGaloisDuality:D7/duality-after-localization`.

**Proof or construction.**

1. (a) Naturality of connecting maps for the restriction of the tensored fundamental sequence; D_dR descends along finite extensions (PadicHodgeTheory:R06.2/de-rham-base-change).
2. (b) Corestriction on H^0 of B_dR ⊗ V is the trace; Berger states the corresponding commutative diagrams (proofs of his Theorems II.2 and II.6).
3. (c) Fontaine–Ouyang Lemma 9.5 and L0/hodge-tate-and-twist-conventions.
4. (d) Shapiro's lemma (Rubin Appendix B, Corollary 5.2) and D_dR of induced representations (PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars); B_* ⊗ Ind V = Ind(B_* ⊗ V) gives the compatibility of H^1_f and exp.

**Acceptance.**

- For L/K unramified of degree f and V = Q_p(2): cor ∘ exp_L = exp_K ∘ Tr, so log_BK on H^1(K, Q_p(2)) of a corestricted class is the trace.
- Although H^1(Q_p,Q_p) and H^1(Q_p,Q_p(1)) both have dimension 2, their geometric subspaces H^1_g have dimensions 1 and 2 respectively. A choice of representation basis does not supply a Galois-equivariant finite-level twisting isomorphism compatible with these conditions.

**Sources.** [Berger2003](https://arxiv.org/abs/math/0209283v1), Proof of Theorem II.2, p. 11 — The corestriction–trace square (bracketed text paraphrases a diagram).; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, Corollary 5.2, p. 157 — Shapiro's lemma in the form used for semilocal conditions..

#### The Bloch–Kato conditions for Tate twists

`PadicHodgeRegulators:L1/tate-twist-examples` — theorem.

Let K/Q_p be finite. (i) V = Q_p: H^1_e = 0, H^1_f = H^1_g = H^1_ur (dimension 1). (ii) V = Q_p(1): H^1_e = H^1_f = κ((O_K^×)^∧ ⊗ Q_p) of dimension [K : Q_p], H^1_g = H^1 (dimension [K : Q_p] + 1); exp_BK(log_p u·e_1) = κ(u) for u ∈ O_K^× and log_BK ∘ κ = log_p. (iii) V = Q_p(r), r ≥ 2: H^1_e = H^1_f = H^1_g = H^1(K, Q_p(r)) of dimension [K : Q_p], and exp : K·e_r ≅ H^1(K, Q_p(r)). (iv) V = Q_p(r), r ≤ −1: H^1_e = H^1_f = H^1_g = 0 while dim H^1 = [K : Q_p]. Integrally: H^1_f(K, Z_p(1)) = (O_K^×)^∧ and H^1_f(K, Z_p(r)) = H^1(K, Z_p(r)) for r ≥ 2.

**Hypotheses.** K/Q_p finite.

**Suggested declaration.** `blochKato_tate_twists`.

**Direct prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/dimension-formulas`, `PadicHodgeRegulators:L1/local-duality-of-conditions`, `SelmerIwasawaCohomology:L0/padic-kummer-identification`, `SelmerIwasawaCohomology:L0/local-completion`, `ArithmeticGaloisDuality:D7/duality-after-localization`.

**Proof or construction.**

1. Compute D_cris and D_dR/Fil^0 of Q_p(r) (L0/hodge-tate-and-twist-conventions) and apply L1/dimension-formulas.
2. (ii) Bloch–Kato p. 358 (quoted by Huber–Kings) identify exp with the classical exponential; the Kummer identification is SelmerIwasawaCohomology:L0/padic-kummer-identification.
3. (iv) H^1_g(Q_p(r)) = H^1_e(Q_p(1 − r))^⊥ = 0 for r ≤ −1 by duality and (iii).

**Acceptance.**

- K = Q_5, r = 2: H^1(Q_5, Q_5(2)) ≅ Q_5 via log_BK.
- K = Q_p, V = Q_p(−1): H^1 ≠ 0 but H^1_g = 0 (a non-split extension 0 → Q_p(−1) → E → Q_p → 0 is never de Rham).

**Sources.** [HK2](https://arxiv.org/abs/math/0101071v2), Appendix A, p. 46 — Case (ii).; [HK2011](https://arxiv.org/abs/math/0612611v1), §1.3, p. 8 — Case (iii): exp_BK : K → H^1(K, Q_p(n))..

#### The Bloch–Kato logarithm of Kummer classes of abelian varieties

`PadicHodgeRegulators:L1/abelian-variety-logarithm` — comparison.

Let K/Q_p be finite and A/K an abelian variety with good reduction, V = V_pA. Then H^1_e(K, V) = H^1_f(K, V) = H^1_g(K, V) = κ(A(K) ⊗ Q_p), with κ the Kummer map; D_dR(V)/Fil^0 ≅ Lie(A) ⊗ K; and log_BK ∘ κ = log_A on A(K) ⊗ Q_p, where log_A : A(K) → Lie(A) is the logarithm of the formal group (extended to A(K) by finite index). For an isogeny or a quotient map π : A → B of abelian varieties with good reduction, log_BK is natural: log_B(π(x)) = dπ(log_A(x)). Pairing with an invariant differential ω ∈ Fil^0 D_dR(V^*(1)) = H^0(A, Ω^1) gives ⟨log_BK κ(P), ω⟩ = log_ω(P).

**Hypotheses.** A has good reduction over O_K; the sign convention of exp is that of L1/bloch-kato-exponential.

**Suggested declaration.** `blochKato_abelian_log`.

**Direct prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`.

**Proof or construction.**

1. For the formal group Â of finite height over O_K with Tate module T, Berger states the commutative square exp_G / Kummer δ_G / exp_{K,V} with D_dR(V)/Fil^0 = tan(G(K)) (Bloch–Kato 3.10.1).
2. A(K) ⊗ Q_p = Â(m_K) ⊗ Q_p since A(K)/Â(m_K) is finite, so the square for Â gives log_BK ∘ κ = log_A.
3. H^1_e = H^1_f = H^1_g: D_cris(V)^{φ=1} = 0 = D_cris(V^*(1))^{φ=1} by the Weil bounds on Frobenius eigenvalues (purity), so the dimension formulas coincide.
4. Naturality follows from functoriality of the Kummer map and of the formal logarithm.

**Acceptance.**

- For an elliptic curve E/Q_p with good reduction and P ∈ E_1(Q_p) (kernel of reduction), log_BK κ(P) = log_{Ê}(P) ∈ Lie(E) ⊗ Q_p.
- For a quotient π : J_0(N) → E, log_{E,ω_E}(π(x)) = c_π·AJ_dR(x)(ω_f) when π^*ω_E = c_π ω_f (GeneralizedHeegnerCycles:GH.8/differential-evaluation); c_π is not assumed to be 1.

**Sources.** [Berger2003](https://arxiv.org/abs/math/0209283v1), Introduction, p. 2 — The formal-group square (Bloch–Kato 3.10.1).; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), §I.6.4, (9), p. 16 — H^1_f of V_pA is the Kummer image..

#### The integral Bloch–Kato logarithm for unramified fields

`PadicHodgeRegulators:L1/integral-logarithm-unramified` — theorem.

Let p be odd, L/Q_p finite unramified and 2 ≤ r ≤ p − 2. Then H^1(L, Z_p(r)) is torsion-free of rank [L : Q_p], H^1_f(L, Z_p(r)) = H^1(L, Z_p(r)), and log_BK(H^1(L, Z_p(r))) = (r − 1)!·p^r·O_L·e_r = p^r·O_L·e_r. For r = 1, log_BK(H^1_f(L, Z_p(1))/tors) = p·O_L·e_1 (the logarithm of the principal units). Equivalently, Fontaine's map ∂^r : L → H^1(L, Q_p(r)), the connecting map of L0/fundamental-exact-sequences (c), equals ±exp_BK ∘ (1 − p^{−r}σ)^{−1} and maps O_L isomorphically onto H^1(L, Z_p(r)), because (1 − p^{−r}σ)^{−1}O_L = p^r O_L. The statement is not asserted for ramified L, for r ≥ p − 1, or for p = 2.

**Hypotheses.** p odd; L unramified; 2 ≤ r ≤ p − 2 (Fontaine–Laffaille range).

**Suggested declaration.** `blochKato_integral_log`.

**Direct prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/tate-twist-examples`, `PadicHodgeRegulators:L0/integral-period-interface`, `PadicHodgeRegulators:L0/fundamental-exact-sequences`, `KTheoryFiniteLocalFields:L.6/h1-of-tate-twists`, `KTheoryFiniteLocalFields:L.6/h0-of-tate-twists`.

**Proof or construction.**

1. Torsion-freeness: H^1(L, Z_p(r))_tors ≅ H^0(L, Q_p/Z_p(r)), which vanishes because L is unramified and (p − 1) ∤ r (KTheoryFiniteLocalFields:L.6/h0-of-tate-twists and h1-of-tate-twists).
2. Index: Benois–Nguyen Quang Do Lemma 1.3.2 and Theorem 2.1 give (exp(O_L·e_r) : H^1(L, Z_p(r)))·w^{(p)}_{1−r}(L) = q^r·|(r − 1)!|_p^{−[L:Q_p]} for unramified L, with w^{(p)}_{1−r}(L) = 1 here.
3. Exact lattice, not just its index: BNQD §2.3.2 and Proposition 2.2.4 identify H^1(L,Z_p(r)) with (r−1)! exp(Tr_{L(ζ_p)/L} Ξ_{r,1}(R_{L,1})). For unramified L and n=1, R_{L,1} is generated over O_L by 1+X. Their displayed formula gives Ξ_{r,1}(a(1+X)) = p^{r−1}(σ^{-1}(a)ζ_p − (1−p^rσ^{-1})^{-1}σ^{-1}(a)). Since Tr(ζ_p)=−1 and [L(ζ_p):L]=p−1, its trace is −p^r(1−p^{r−1}σ^{-1})(1−p^rσ^{-1})^{-1}σ^{-1}(a). For r≥2 these three factors are Z_p-linear automorphisms of O_L, so the image is exactly p^rO_L. The torsion obstruction H^0(L,Q_p/Z_p(r−1)) vanishes in 2≤r≤p−2. This proves the lattice equality, while the index formula alone would not.
4. Lattice identity: 1 − p^{−r}σ = −p^{−r}σ(1 − p^rσ^{−1}) with 1 − p^rσ^{−1} invertible on O_L, so (1 − p^{−r}σ)^{−1}O_L = p^r O_L; this gives the Fontaine-normalised form.
5. r = 1: Benois–Nguyen Quang Do Lemma 1.3.2 at m = 1 with e = 1, and the Iwasawa logarithm U^1_L ≅ pO_L.

**Acceptance.**

- L = Q_5, r = 2: log_BK(H^1(Q_5, Z_5(2))) = 25Z_5·e_2; consistent with Li_2(ω(2)) ≡ 25 mod 125.
- Index check: q^r·|(r−1)!|^{−N} equals [O_L : p^r O_L] = q^r for r ≤ p − 2.
- For p = 3 and r = 2 the range 2 ≤ p − 2 fails and H^1(Q_3, Z_3(2)) has torsion Z/3.

**Sources.** [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), Lemme 1.3.2, p. 647 — The index form.; [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), Théorème 2.1, p. 648 — The local Tamagawa number, which with Lemme 1.3.2 gives the index; the lattice form is derived in proofSteps (no open source states it in one line).; [FontaineBPR1994](https://www.imo.universite-paris-saclay.fr/~fontaine/bpr.pdf), §2.1, p. 153 — Fontaine's map ∂^r..

**Planet.** Integral Bloch–Kato logarithm.

#### Semilocal Bloch–Kato maps

`PadicHodgeRegulators:L1/semilocal-bloch-kato` — construction.

For a finite étale Q_p-algebra A = ∏_v K_v (for instance F ⊗ Q_p = ∏_{v|p} F_v for a number field F) and a p-adic representation V of G_{Q_p} (or a family V_v of de Rham representations of the G_{K_v}), put H^1(A, V) := ⊕_v H^1(K_v, V), H^1_*(A, V) := ⊕_v H^1_*(K_v, V) for * ∈ {e, f, g}, D_dR(A, V) := ⊕_v D_dR,K_v(V), and define exp_{A,V} and exp*_{A,V} componentwise. Define log_{A,V} on ⊕_v H^1_e(K_v,V_v) only when D_cris,K_v(V_v)^{φ=1} = H^0(K_v,V_v) for every v. Under Shapiro's isomorphism H^1(Q_p, Ind_{K_v}^{Q_p} V) ≅ H^1(K_v, V) these are the Bloch–Kato maps of the induced representation (L1/twist-and-change-of-field (d)). For a number field F the semilocal Kummer map E_F ⊗ Q_p → H^1_f(F ⊗ Q_p, Q_p(1)) composed with log is the unit regulator of D.1/unit-logarithm-kernel.

**Hypotheses.** A finite étale over Q_p; V de Rham at each factor. The componentwise logarithm requires the injectivity hypothesis of L1/bloch-kato-logarithm at every factor; the subgroup construction does not.

**Suggested declaration.** `semilocalBlochKatoExp`.

**Direct prerequisites.** `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/dual-exponential`, `PadicHodgeRegulators:L1/twist-and-change-of-field`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Proof or construction.**

1. Componentwise definition; the decomposition of A into fields is canonical.
2. Compatibility with Shapiro is L1/twist-and-change-of-field (d) applied to each factor.
3. For F ⊗ Q_p use the semilocal equivalence of NumberFieldArithmetic layer 5.

**Acceptance.**

- For F = Q(√2) and p = 7 (split), H^1_f(F ⊗ Q_7, Q_7(1)) = H^1_f(Q_7, Q_7(1))², and log of the semilocal Kummer class of 1 + √2 is (log_7(1 + √2), log_7(1 − √2)).

**API.**

- `semilocalBlochKatoF` (data): semilocalBlochKatoF A V : Submodule ℚ_p (⨁ v, H^1(K_v, V)).
- `semilocalBlochKatoExp` (constructor): semilocalBlochKatoExp A V := ⨁ v, blochKatoExp K_v V.
- `semilocalBlochKatoLog` (constructor): The componentwise logarithm on ⨁ v, blochKatoE K_v V. It requires injective exp at every factor, and is its inverse on the direct sum of the images.
- `semilocal_shapiro` (compatibility): Under Shapiro's isomorphism, semilocalBlochKatoExp A V = blochKatoExp ℚ_p (Ind_A V).
- `semilocal_prod` (simp): For A = A' × A'', the semilocal maps are the direct sums of those of A' and A''.
- `semilocalBlochKatoF_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `semilocal_split_quadratic` (computation): For F = Q(√2), p = 7: dim_{Q_7} semilocalBlochKatoF (F ⊗ Q_7) Q_7(1) = 2.
- `semilocal_zero_algebra` (degenerate): For A = 0 all semilocal groups are 0.
- `semilocal_field_compat` (compatibility): For A = K a field, the semilocal maps are the local maps of L1.
- `semilocal_independent_factors` (non-example): For p odd and A = Q_p × Q_p, let c = κ(1+p) ≠ 0 in H^1_f(Q_p,Q_p(1)). Both (c,0) and (0,c) belong to semilocalBlochKatoF A Q_p(1) and are independent; replacing this group by the one-dimensional diagonal {(x,x)} fails. The two-factor group agrees with H^1_f(Q_p,Q_p(1) ⊕ Q_p(1)).

**Used by.** Rubin, Euler Systems, Chapter II §2: H^1(K_p, ·) = ⊕_{v|p} H^1(K_v, ·), and similarly for H^1_f and H^1_s; SelmerIwasawaCohomology:L4/bloch-kato-condition: the local condition at every place above p of a number field; PadicHodgeRegulators:D.4/global-p-adic-regulator: the regulator to F ⊗ Q_p is the semilocal log_BK of the étale regulator; Huber–Kings 2003, Appendix A: exp_p : O_F ⊗ Q_p → H^1_f(F ⊗ Q_p, Q_p(1)) is an isomorphism.

**Sources.** [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II §2, p. 25 — The semilocal convention.; [HK2](https://arxiv.org/abs/math/0101071v2), §2.3.2, p. 21 — A semilocal exponential..

### L2. Iwasawa regulator comparisons

#### Fontaine's isomorphism h_Iw : D(T)^{ψ=1} ≅ H¹_Iw

`PadicHodgeRegulators:L2/fontaine-iwasawa-map` — construction.

Assume H₀. Let D(T) be the étale (φ, Γ)-module of T over O_E ⊗ A_{Q_p} with the operator ψ (PhiGammaModulesAndIwasawaCohomology PG.1, PG.4). Define h_{Iw,T} : D(T)^{ψ=1} → H^1_Iw(Q_p, T) as the H^1-comparison of the ψ-complex [D(T) --(ψ − 1)--> D(T)] with the inverse-corestriction Iwasawa complex (PG.5, SelmerIwasawaCohomology L3). Then: (a) h_{Iw,T} is a Λ-linear bijection; (b) for n ≥ 1, a topological generator γ_n of Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^n})) and ℓ_n(γ_n) := log_p χ(γ_n)/p^n, pr_n(h(y)) is the class of σ ↦ ℓ_n(γ_n)((σ − 1)/(γ_n − 1)·y − (σ − 1)b), where x_n ∈ D(T)^{ψ=0} solves (γ_n − 1)x_n = (φ − 1)y and b ∈ A ⊗ T solves (φ − 1)b = x_n; (c) cor ∘ pr_{n+1} = pr_n and pr_0 = cor_{Q_p(μ_p)/Q_p} ∘ pr_1; (d) h_{Iw,V} := h ⊗ Q is independent of the lattice; (e) the Λ_E-torsion of D(V)^{ψ=1} is V^{H_{Q_p}} and maps onto the torsion of H^1_Iw(Q_p, V); H^1_Iw(Q_p, T) has no Z_p-torsion.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Suggested declaration.** `fontaineIwasawaEquiv`.

**Direct prerequisites.** `PhiGammaModulesAndIwasawaCohomology:PG.5`, `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex`, `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex-h1`, `PhiGammaModulesAndIwasawaCohomology:PG.4/psi-zero-splitting`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicMeasuresIwasawaAlgebras:L1/convolution-algebra`, `PadicHodgeRegulators:L1/bloch-kato-exponential`.

**Proof or construction.**

1. The actual comparison of the ψ-complex with Iwasawa cohomology is requested from PG.5 (its packet has the abstract ψ-complex homology only).
2. The level-n cocycle is Cherbonnier–Colmez Proposition I.4.1 and Theorem II.1.3 (ii); compatibility with corestriction is Berger's Lemma I.9.
3. Torsion: Berger Proposition II.7 (V^{H_K} ⊂ D(V)^{ψ=1} is its Λ-torsion).

**Acceptance.**

- V = Q_p: h(1) is a nonzero G_∞-fixed class spanning the torsion of H^1_Iw(Q_p, Q_p).
- h(σ_{−1}·y) = σ_{−1}·h(y) for σ_{−1} ∈ Δ with χ(σ_{−1}) = −1.

**API.**

- `fontaineIwasawaEquiv` (data): fontaineIwasawaEquiv T : D(T)^{ψ=1} ≃ₗ[Λ] H1Iw T.
- `fontaineIwasawaEquiv_pr` (characterisation): pr_n (fontaineIwasawaEquiv T y) is the class of the explicit cocycle of (b).
- `fontaineIwasawaEquiv_cor` (relation): cor ∘ pr_{n+1} = pr_n; pr_0 = cor ∘ pr_1.
- `fontaineIwasawaEquiv_rat` (compatibility): The rationalisation is independent of T ⊂ V.
- `fontaineIwasawaEquiv_torsion` (characterisation): Torsion of D(V)^{ψ=1} = V^{H_{Q_p}} ↦ torsion of H1Iw V.
- `H1Iw_noZpTorsion` (other): H1Iw T has no ℤ_p-torsion.
- `fontaineIwasawaEquiv_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `fontaineIwasawa_trivial` (computation): For V = Q_p, the class h(1) is nonzero and fixed by G_∞.
- `fontaineIwasawa_unramified_char` (degenerate): For V = E(μ) with μ unramified nontrivial, H^1_Iw(Q_p, V) is torsion-free (Q_p(μ_{p^∞}) ∩ Q_p^ur = Q_p).
- `fontaineIwasawa_cor_compat` (compatibility): cor_{Q_p(μ_{p^2})/Q_p(μ_p)} ∘ pr_2 ∘ h = pr_1 ∘ h, matching SelmerIwasawaCohomology's inverse system.
- `fontaineIwasawa_not_D_itself` (non-example): h is defined on D(T)^{ψ=1}, not on D(T)^{φ=1}: for V = Q_p(1), (1 + π)/π ⊗ e_1 lies in D^{ψ=1} but not in D^{φ=1}.

**Used by.** PadicHodgeRegulators:L3/crystalline-regulator: L_V = (Mellin^{−1} ⊗ 1)∘(1 − φ)∘h_Iw^{−1}; PadicHodgeRegulators:L3/explicit-reciprocity: the Iwasawa pairing is transported through h_Iw; PadicHodgeRegulators:L4/signed-local-condition: ker Col_j is exported to H^1_Iw through the proved h_Iw comparison; Berger, Bloch and Kato's exponential map, Theorem II.6: exp*(h^1_{F_n}(y)) = p^{−n}∂_V(φ^{−n}y).

**Sources.** [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Théorème II.1.3, p. 12 — The isomorphism.; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Theorem II.8, p. 118 — The integral and rational forms..

**Planet.** Fontaine's ψ-isomorphism.

#### Independence of the generator of Γ

`PadicHodgeRegulators:L2/generator-independence` — lemma.

Assume H₀. For generators γ, γ' = γ^a (a ∈ Z_p^×) of Γ_n, u := (γ − 1)/(γ' − 1) is a unit of Λ, and the cochain map ι_{γ,γ'} := (u, u ⊕ id, id) : C_{φ,γ} → C_{φ,γ'} is an isomorphism with ℓ(γ)[c_{x,y}] = ℓ(γ')[c_{ux,y}] in H^1. Hence the level-n formula of L2/fontaine-iwasawa-map (b) does not depend on γ_n, and replacing γ by γ^a only changes the variable X = γ − 1 of Λ to (1 + X)^a − 1. For γ' = γ^m with p ∤ m, PG.3's generator map equals Q_m·ι_{γ,γ^m} on H^1.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Suggested declaration.** `fontaine_generator_independence`.

**Direct prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-generator-map`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-generator-isomorphism`.

**Proof or construction.**

1. Check that (u, u ⊕ id, id) commutes with the Herr differentials d0 = (φ − 1, γ − 1) (Cherbonnier–Colmez Lemme I.4.2).
2. Λ acts on H^1 of the Herr complex through augmentation, so the integer-power generator map of PG.3 differs from ι by the scalar Q_m.

**Acceptance.**

- γ' = γ^{−1}: u = −γ, X ↦ (1 + X)^{−1} − 1.
- The independence statement in Berger's Proposition I.8 is an exercise there; this node supplies it.

**Sources.** [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Lemme I.4.2, p. 7 — The generator change.; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Proposition I.8, p. 110 — The independence asserted by Berger..

#### Changing the compatible system of roots of unity

`PadicHodgeRegulators:L2/root-change` — comparison.

Assume H₀ and let a ∈ Z_p^×, σ_a ∈ G_∞ with χ(σ_a) = a, ε' = σ_a(ε) = ε^a. (i) The embeddings ι_ε : A_{Q_p} → Ã (π ↦ [ε] − 1) satisfy ι_{ε'} = ι_ε ∘ γ_a on A, A^+ and B^+_rig; D(T), N(T), ψ, the G_∞-action and h_{Iw,T} are unchanged. (ii) t' = a·t, e'_j = a^j e_j, ∂' = a^{−1}∂; the localisation maps ι_n are unchanged as maps (coordinates ζ' = ζ^a). (iii) For the Mellin transform M_ε(λ) = λ·(1 + π_ε): M_{ε'}(λ) = M_ε(λσ_a), so M_{ε'}^{−1} = [σ_a]^{−1}M_ε^{−1}. (iv) Twisting by e'_j is a^j times twisting by e_j. (v) Coleman power series: f^{ε'}_u(π_{ε'}) = f^ε_u(π_ε) in A^+ and Δ(f^{ε'}_u) ⊗ e'_1 = Δ(f^ε_u) ⊗ e_1.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Suggested declaration.** `fontaine_root_change`.

**Direct prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`, `PadicHodgeTheory:P7:annulus-foundations/localisation-at-roots-of-unity`, `PadicMeasuresIwasawaAlgebras:L2/amice-dilation`, `PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence`, `ColemanPowerSeries:L2/coleman-interpolation-equivariance`.

**Proof or construction.**

1. ε enters only through π = [ε] − 1, t = log[ε], e_j and the Mellin/Coleman coordinates; Cherbonnier–Colmez's cocycle and Berger's h^1 involve γ and b only, so h_Iw is ε-free.
2. Compute each coordinate change from π_{ε'} = (1 + π_ε)^a − 1.

**Acceptance.**

- The regulator distribution changes by [σ_a]^{−1} (Loeffler–Zerbes 2014, Remark 4.16), as L3/naturality-and-lattice records.
- a = −1: t' = −t and e'_1 = −e_1, so ⊗e_1 changes sign while h_Iw does not.

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Remark 4.16, p. 20 — The effect of a root change on the regulator; the coordinate dictionary is derived in proofSteps (no source states it as one lemma)..

#### Twisting local Iwasawa cohomology by characters of G_∞

`PadicHodgeRegulators:L2/local-iwasawa-twist` — construction.

Assume H₀. For a continuous character η : G_∞ → O_E^×, choose n(k) ≥ k with η ≡ 1 mod p^k on Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^{n(k)}})); using H^1_Iw(Q_p, T) = lim_k H^1(Q_p(μ_{p^{n(k)}}), T/p^k) define Tw_η := lim_k (x ↦ x ∪ ē_η) with ē_η ∈ H^0(Q_p(μ_{p^{n(k)}}), (O_E/p^k)(η)). Then Tw_η : H^1_Iw(Q_p, T) → H^1_Iw(Q_p, T(η)) is a well-defined O_E-linear bijection, independent of the choices, with Tw_1 = id, Tw_η ∘ Tw_η' = Tw_{ηη'}, and Tw_η(λx) = Tw_η(λ)Tw_η(x) where Tw_η(σ) = η(σ)^{−1}σ on Λ (SelmerIwasawaCohomology's convention Tw_k for η = χ^k). For ω of finite order trivial on G_{Q_p(μ_{p^n})}: pr_n(Tw_ω x) = pr_n(x) ⊗ e_ω.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Suggested declaration.** `iwasawaTwist`.

**Direct prerequisites.** `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `SelmerIwasawaCohomology:L3/iwasawa-twist`, `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom`.

**Proof or construction.**

1. At finite level the cup product with ē_η is an isomorphism H^1(Q_p(μ_{p^{n(k)}}), T/p^k) ≅ H^1(·, T(η)/p^k), compatible with corestriction because ē_η is restricted from lower levels modulo p^k.
2. Pass to the limit; for η = χ^j compare with Cherbonnier–Colmez Proposition II.1.2 and with the Shapiro twist of SelmerIwasawaCohomology:L3/iwasawa-shapiro.
3. SelmerIwasawaCohomology:L3/iwasawa-twist is stated for the global Q-tower; the local Q_p version is owned here.

**Acceptance.**

- Tw_η ∘ Tw_{η^{−1}} = id.
- Tw_{χ^j}(σ_{−1}x) = (−1)^j σ_{−1}Tw_{χ^j}(x).

**API.**

- `iwasawaTwist` (data): iwasawaTwist η : H1Iw T ≃+ H1Iw (T(η)).
- `iwasawaTwist_smul` (relation): iwasawaTwist η (λ • x) = Tw_η(λ) • iwasawaTwist η x.
- `iwasawaTwist_one` (simp): iwasawaTwist 1 = id.
- `iwasawaTwist_mul` (relation): iwasawaTwist η ∘ iwasawaTwist η' = iwasawaTwist (η * η').
- `iwasawaTwist_pr_finite` (characterisation): For ω of finite order trivial on level n, pr_n ∘ iwasawaTwist ω = (· ⊗ e_ω) ∘ pr_n.
- `iwasawaTwist_eq_shapiro` (compatibility): For η = χ^j, iwasawaTwist agrees with the Shapiro-lemma twist of SelmerIwasawaCohomology.
- `iwasawaTwist_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `iwasawaTwist_inverse` (computation): iwasawaTwist η⁻¹ (iwasawaTwist η x) = x.
- `iwasawaTwist_trivial` (degenerate): iwasawaTwist 1 x = x.
- `iwasawaTwist_level_cyclotomic` (compatibility): For η = χ^j and n ≥ 1, pr_n(Tw_{χ^j}x) ≡ pr_n(x) ∪ ε_n^{⊗j} modulo p^n.
- `iwasawaTwist_not_linear` (non-example): iwasawaTwist χ is not Λ-linear: iwasawaTwist χ (σ • x) = χ(σ)^{−1} σ • iwasawaTwist χ x ≠ σ • iwasawaTwist χ x for χ(σ) ≠ 1.

**Used by.** PadicHodgeRegulators:L3/meromorphic-twist-extension: L_V(z) = (ℓ_{−1}…ℓ_{−m})^{−1} Tw_{χ^m}(L_{V(m)}(z ⊗ e_m)) ⊗ t^m e_{−m}; PadicHodgeRegulators:L3/ramified-interpolation: z_{η,0} is the specialisation of the twisted class; PadicHodgeRegulators:L4/derham-interpolation-growth: twists by finite-order characters of conductor p^n.

**Sources.** [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Proposition II.1.2, p. 12 — The twist by χ^k.; [LZ2014](https://arxiv.org/pdf/1108.5954v3), Lemma 2.4, p. 7 — Twisting by arbitrary characters of G_∞..

#### Compatibility of h_Iw with twists

`PadicHodgeRegulators:L2/twist-compatibility` — comparison.

Assume H₀. (i) D(T(η)) = D(T) ⊗ e_η with φ, ψ acting on the first factor and g(x ⊗ e_η) = η(g)g(x) ⊗ e_η, so ⊗e_η : D(T)^{ψ=1} → D(T(η))^{ψ=1} is Tw_η-semilinear. (ii) h_{Iw,T(η)}(y ⊗ e_η) = Tw_η(h_{Iw,T}(y)). (iii) For η = χ^j the level-n cocycle of h(y ⊗ e_j) is σ ↦ ℓ(γ_n)((σ − 1)/(γ_n − 1)·y(j) − (σ − 1)b) with y(j) the image of y in D(V(j))^{ψ=1} (Cherbonnier–Colmez, proof of Theorem IV.2.1). (iv) For crystalline V, N(T(j)) = π^{−j}N(T) ⊗ e_j.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Suggested declaration.** `fontaine_twist_compatibility`.

**Direct prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/local-iwasawa-twist`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.6`, `PadicHodgeTheory:P7/robba-realisation-comparison`.

**Proof or construction.**

1. (i) is the tensor compatibility of the Fontaine equivalence (request to PG.1).
2. (ii) compare the level-k cocycles of L2/fontaine-iwasawa-map (b) with the cup product defining Tw_η; for η of finite order use Loeffler–Zerbes 2014 Lemma 2.4, in general reduce modulo p^k.
3. (iv) Berger's observation N(T(−1)) = πN(T) ⊗ e_{−1}, iterated (Wach modules from PG.6).

**Acceptance.**

- η = χ: h(y ⊗ e_1) = Tw_χ h(y).
- For V = Q_p, N(Z_p(1)) = π^{−1}N(Z_p) ⊗ e_1 = π^{−1}A^+ ⊗ e_1.

**Sources.** [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Proof of Théorème IV.2.1, p. 21 — (i) and (iii).; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Appendix A, p. 124 — (iv)..

#### Berger: ψ-fixed vectors lie in the Wach module

`PadicHodgeRegulators:L2/wach-psi-fixed-vectors` — theorem.

Assume H₀ and let V be E-linear crystalline with Hodge–Tate weights in [a; b], T ⊂ V a G-stable O_E-lattice and N(T) its Wach module (PG.6). (i) D(T)^{ψ=1} ⊂ π^{a−1}N(T). (ii) If V has no quotient isomorphic to E(a), then D(T)^{ψ=1} ⊂ π^a N(T). (iii) In particular, if a ≥ 0 and V has no quotient isomorphic to E (equivalently, as a Q_p-representation, no quotient Q_p), then ψ(N(T)) ⊂ N(T), N(T)^{ψ=1} = D(T)^{ψ=1}, N(V)^{ψ=1} = D(V)^{ψ=1}, and h_Iw restricts to Λ-isomorphisms N(T)^{ψ=1} ≅ H^1_Iw(Q_p, T) and N(V)^{ψ=1} ≅ H^1_Iw(Q_p, V).

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T). V crystalline with weights in [a; b]; for (iii) a ≥ 0 and no quotient E.

**Suggested declaration.** `wach_psi_fixed_vectors`.

**Direct prerequisites.** `PhiGammaModulesAndIwasawaCohomology:PG.6`, `PhiGammaModulesAndIwasawaCohomology:PG.4`, `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/twist-compatibility`, `PadicHodgeTheory:P7/wach-dcris-comparison`, `PadicHodgeTheory:R06.1/fundamental-exact-sequence`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

**Proof or construction.**

1. Twist to weights in [0; b − a] (L2/twist-compatibility (iv)).
2. Berger Lemmas A.4–A.7: ψ(π^{−m}) = π^{−m}(p^{m−1} + πQ_m(π)) and D(T)^{ψ=1} ⊂ π^{−1}N(T) for weights ≥ 0 (where N(T) ⊂ φ^*N(T) gives ψ(N(T)) ⊂ N(T)).
3. If an element of D(T)^{ψ=1} had a pole of order one, its leading coefficient would give a nonzero vector of D_cris(V)^{φ=1} = (N(V)/πN(V))^{φ=1}; for weights ≥ 0 such a vector forces a quotient Q_p (an eigenvalue 1 in D_cris(V^*) with Fil^0 = everything gives (V^*)^{G} ≠ 0 by the fundamental exact sequence) — this is the step Berger states without proof.
4. Combine with L2/fontaine-iwasawa-map.

**Acceptance.**

- V = E(1) (a = 1): (1 + π)/π ⊗ e_1 ∈ D(V)^{ψ=1} ∩ N(V).
- V = E (a = 0, quotient E): 1/π ∈ D(E)^{ψ=1} ∖ A^+, so the hypothesis of (ii) and the exponent a − 1 in (i) are sharp.

**Sources.** [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Theorem A.3, p. 124 — The theorem.; [LLZWach](https://arxiv.org/abs/0912.1263v3), §1, p. 4 — Form (iii), used by the L3 regulator..

**Planet.** Berger's ψ-invariants theorem.

#### Specialisation of Iwasawa classes at characters

`PadicHodgeRegulators:L2/character-specialisation` — construction.

Assume H₀. For x ∈ H^1_Iw(Q_p, T) and a continuous character η of G_∞, put x_η := Tw_{η^{−1}}(x) ∈ H^1_Iw(Q_p, T(η^{−1})) and x_{η,n} := pr_n(x_η) ∈ H^1(Q_p(μ_{p^n}), T(η^{−1})). (a) (λx)_{η,0} = η(λ)x_{η,0} for λ ∈ Λ. (b) If x = h_Iw(y) and η = χ^jω with ω of conductor p^m, then for n ≥ max(m, 1): x_{η,n} = pr_n(h_{Iw,T(η^{−1})}(y ⊗ e_{−j} ⊗ e_{ω^{−1}})) and x_{η,0} = cor_{Q_p(μ_{p^n})/Q_p}(x_{η,n}), independent of n. (c) With T' = T(η^{−1}): 0 → (H^1_Iw(T')_{Γ_1})^Δ → H^1(Q_p, T') → (H^2_Iw(T')^{Γ_1})^Δ → 0.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Suggested declaration.** `charSpecialization`.

**Direct prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/local-iwasawa-twist`, `PadicHodgeRegulators:L2/twist-compatibility`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom`.

**Proof or construction.**

1. (a) from L2/local-iwasawa-twist's semilinearity and the projection to level 0.
2. (b) from L2/twist-compatibility (ii) and the corestriction compatibility of L2/fontaine-iwasawa-map (c).
3. (c) is SelmerIwasawaCohomology:L3/iwasawa-descent for Γ_1 ≅ Z_p followed by Δ-invariants (|Δ| = p − 1 prime to p).

**Acceptance.**

- x_{1,0} = pr_0 x.
- (σ_{−1}x)_{χ,0} = −x_{χ,0}.

**API.**

- `charSpecialization` (data): charSpecialization η : H1Iw T →ₗ[O_E] H^1(ℚ_p, T(η⁻¹)).
- `charSpecialization_smul` (relation): charSpecialization η (λ • x) = η(λ) • charSpecialization η x.
- `charSpecialization_fontaine` (characterisation): charSpecialization η (h y) = cor (pr_n (h (y ⊗ e_{−j} ⊗ e_{ω⁻¹}))) for n ≥ max(m,1).
- `charSpecialization_descent` (relation): The descent exact sequence (c).
- `charSpecialization_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `charSpecialization_trivial` (computation): charSpecialization 1 = pr_0.
- `charSpecialization_zero` (degenerate): charSpecialization η 0 = 0.
- `charSpecialization_level_independence` (compatibility): For ω of conductor p, the formula of (b) gives the same class for n = 1 and n = 2.
- `charSpecialization_not_equivariant` (non-example): charSpecialization χ is not Λ-linear into a Λ-module: σ_{−1} acts on the target through χ(σ_{−1}) = −1.

**Used by.** PadicHodgeRegulators:L3/ramified-interpolation: z_{η,0} in the interpolation formula at η = χ^jω; PadicHodgeRegulators:L3/unramified-interpolation: z_{χ^j,0} at unramified characters; PadicHodgeRegulators:L4/derham-regulator: specialisation of Iwasawa classes for de Rham modules.

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Definition 4.14, p. 20 — The specialisation.; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), §II, p. 118 — The level-n projection through h^1..

#### Lattice and coefficient-change squares

`PadicHodgeRegulators:L2/lattice-and-coefficient-squares` — comparison.

Assume H₀. (a) For lattices U ⊂ T ⊂ V: D(U) ⊂ D(T) ⊂ D(V) compatibly with φ, ψ, G_∞ and h_Iw; H^1_Iw(Q_p, T) → H^1_Iw(Q_p, V) is injective with image h(D(V)^{ψ=1} ∩ D(T)); N(U) = N(V) ∩ D(U), and U ↦ N(U) is an inclusion-preserving bijection between G-stable lattices and Wach lattices in N(V); under L2/wach-psi-fixed-vectors (iii), H^1_Iw(Q_p, T) = h(N(T)^{ψ=1}). (b) For E'/E finite, D, N, ψ, H^1_Iw, h, Λ and the Mellin transform commute with O_{E'} ⊗_{O_E} −; restriction of scalars to Z_p changes none of D, ψ, h.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Suggested declaration.** `fontaine_lattice_coefficient_squares`.

**Direct prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.5`, `PhiGammaModulesAndIwasawaCohomology:PG.6`, `PadicHodgeTheory:P7/integral-dcris-lattice`, `PadicHodgeTheory:P7:annulus-foundations/coefficient-extension`, `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice`.

**Proof or construction.**

1. (a) N(T) = N(V) ∩ D(T) and the lattice bijection are Berger, Limites, Lemma II.1.3 and Proposition III.4.2 (requested from PG.6); injectivity on H^1_Iw holds because H^1_Iw(T) has no Z_p-torsion.
2. (b) Each construction is O_E-linear and commutes with finite flat base change; Lei–Loeffler–Zerbes §2.2–2.3 record the E-linear forms.

**Acceptance.**

- For T = Z_p(1) ⊂ V: H^1_Iw(Q_p, Z_p(1)) = h(N(Z_p(1))^{ψ=1}).
- Changing T to pT multiplies h(D(T)^{ψ=1}) by p.

**Sources.** [LLZWach](https://arxiv.org/abs/0912.1263v3), §2.2, p. 8 — Lattices of Wach modules.; [Limites2004](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf), Proposition III.4.2, p. 21 — The lattice bijection..

#### Kummer classes and Coleman power series

`PadicHodgeRegulators:L2/kummer-coleman-comparison` — comparison.

Assume H₀ with T = Z_p(1). For a norm-compatible system u ∈ U_∞ of principal units of the tower Q_p(μ_{p^n}) with Coleman power series f_u (f_u(ε^{(n)} − 1) = u_n), Δ(f_u) := (1 + π)f_u'/f_u lies in A^{ψ=1}, and h_{Iw,Z_p(1)}(Δ(f_u) ⊗ e_1) = s·κ(u), where κ : U_∞ → H^1_Iw(Q_p, Z_p(1)) is the Kummer map of SelmerIwasawaCohomology (cocycle τ ↦ τ(α)/α) and s ∈ {±1} is a sign whose value remains to be checked against Cherbonnier–Colmez's Proposition V.3.2 iii) and the cocycle of L2/fontaine-iwasawa-map (b). Independently of that sign, Δ(f_u) ⊗ e_1 ∈ N(Z_p(1))^{ψ=1}, and by L2/root-change (v) the element is independent of ε.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T). T = Z_p(1).

**Suggested declaration.** `kummer_coleman_comparison`.

**Direct prerequisites.** `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/root-change`, `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`, `ColemanPowerSeries:L1/coleman-equivalence`, `ColemanPowerSeries:L2/logarithmic-derivative`, `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map`, `SelmerIwasawaCohomology:L4/local-units-iwasawa-cohomology`, `SelmerIwasawaCohomology:L0/kummer-limit-map`.

**Proof or construction.**

1. ψ(Δ f_u) = Δ f_u (ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map).
2. Cherbonnier–Colmez V.3.2 iii) identify Exp*(δ(u)) with ι̂(u)^{−1}∇ι̂(u); compare their δ with the Kummer cocycle τ ↦ τ(α)/α: with τ[u_n] = [ε]^{c(τ)}[u_n], (1 − τ)(log[u_n]·t^{−1} ⊗ e_1) = −c(τ)e_1, which suggests a minus sign but does not settle the comparison of CC99’s δ with the supplier’s Kummer convention (recorded gap).
3. Membership in N(Z_p(1)) follows from L2/wach-psi-fixed-vectors (iii) applied to Z_p(1) (weights ≥ 0, no quotient Q_p).

**Acceptance.**

- The sign s is the input of L3/tate-coleman-comparison (Col = −Col_0 there).
- For a = 1 + p and the norm-compatible principal units u_n = (ζ_{p^n}^a − 1)/(ζ_{p^n} − 1), f_u(π) = ((1 + π)^a − 1)/π and Δ(f_u) = a(1 + π)^a/((1 + π)^a − 1) − (1 + π)/π is explicit.

**Sources.** [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Proposition V.3.2 iii), p. 27 — The rank-one comparison.; [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), §V.3, p. 27 — Cherbonnier–Colmez's normalisation of δ_n, whose sign against the Kummer cocycle remains an explicit comparison gap; the calculation in proofSteps is only a lead..

### D.1. Dilogarithms on finite étale and global inputs

#### Teichmüller decomposition of the units of a local field

`PadicHodgeRegulators:D.1/teichmuller-unit-decomposition` — comparison.

Let L be a nonarchimedean local field with valuation ring O_L, maximal ideal m_L and residue field F_q, q = p^f. Write ω = TauCeti.teichmuller L : F_q^× → O_L^× for the Teichmüller lift and U^1_L = 1 + m_L for the principal units. Then every u ∈ O_L^× factors uniquely as u = ω(ū)·⟨u⟩ with ū the residue of u and ⟨u⟩ := u·ω(ū)^{-1} ∈ U^1_L, so that O_L^× = μ_{q-1}(O_L) × U^1_L is an internal direct product; u ↦ ⟨u⟩ is a continuous group homomorphism onto U^1_L. The decomposition is natural for continuous field embeddings L → L' of local fields and for automorphisms of L, and, if L is a finite extension of Q_p, for every branch log_a of the p-adic logarithm (ColemanIntegration:L0/log-branch) one has log_a(u) = log(⟨u⟩), the series logarithm of the principal-unit part, because log_a vanishes on roots of unity.

**Hypotheses.** L is a nonarchimedean local field of residue characteristic p (Mathlib's IsNonarchimedeanLocalField with Tau Ceti's valuative structure). For the logarithm clause, L is identified with a subfield of C_p by a continuous embedding. The logarithm clause is only for mixed characteristic L/Q_p finite. The unit decomposition is imported from LocalFieldsRamification Layer 1, not replanned here.

**Suggested declaration.** `teichmuller_unit_decomposition`.

**Direct prerequisites.** `tauceti:TauCeti.teichmuller`, `tauceti:TauCeti.range_teichmuller`, `tauceti:TauCeti.residue_teichmuller`, `tauceti:TauCeti.eq_teichmuller`, `ColemanIntegration:L0/log-branch`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof or construction.**

1. Import the unit filtration and Teichmüller decomposition of LocalFieldsRamification Layer 1. The following steps check its agreement with the pinned Tau Ceti section and with the regulator branch.
2. The residue map O_L^× → F_q^× is a surjective homomorphism with kernel U^1_L; TauCeti.residue_teichmuller says ω is a section, so u·ω(ū)^{-1} has residue 1 and lies in U^1_L.
3. Uniqueness: if ζ·v = ζ'·v' with ζ, ζ' ∈ μ_{q-1} and v, v' ∈ U^1_L, then ζ'^{-1}ζ ∈ μ_{q-1} ∩ U^1_L = {1}, since a (q−1)-torsion principal unit reduces to 1 and TauCeti.eq_teichmuller forces it to be ω(1) = 1. TauCeti.range_teichmuller identifies the first factor with μ_{q-1}(O_L).
4. Naturality: a continuous embedding L → L' maps O_L into O_{L'}, induces F_q → F_{q'} on residues, and sends (q−1)-torsion units to (q'−1)-torsion units; TauCeti.eq_teichmuller in L' identifies the image of ω_L(α) with ω_{L'}(ᾱ).
5. Logarithm: log_a is a homomorphism vanishing at roots of unity (ColemanIntegration:L0/log-branch), so log_a(u) = log_a(ω(ū)) + log_a(⟨u⟩) = log(⟨u⟩), and on U^1_L the branch agrees with the series.

**Acceptance.**

- For L = Q_5 and u = 7: ū = 2, ω(2) is the unique 4th root of unity ≡ 2 mod 5, and ⟨7⟩ = 7·ω(2)^{-1} ≡ 1 mod 5.
- μ_{q-1}(O_L) ∩ U^1_L = {1}: a decomposition with a nontrivial root of unity in the principal-unit factor is rejected.
- For p = 2 and L = Q_2 the first factor is trivial (q − 1 = 1) and −1 lies in U^1_{Q_2}: the factor of order prime to p does not contain the 2-power roots of unity.

**Sources.** [TauCetiTeichmuller](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), TauCeti/NumberTheory/LocalField/Teichmuller.lean, module docstring (pinned commit f790474) — The library supplies the Teichmüller section; this node states the resulting internal product decomposition that the layer needs.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38 — The regulator calculation works with the Teichmüller (order prime to p) roots of unity and principal units separately..

#### Frobenius on the roots of unity of an unramified field

`PadicHodgeRegulators:D.1/unramified-frobenius-on-roots` — lemma.

Let L be a finite unramified extension of Q_p with residue field F_q and let φ_L be its arithmetic Frobenius, the unique field automorphism of L over Q_p whose reduction is x ↦ x^p on F_q (an arithmetic Frobenius in the sense of IsArithFrobAt for the extension O_L/Z_p). Then φ_L(ω(α)) = ω(α^p) for every α ∈ F_q^×, hence φ_L(ζ) = ζ^p for every ζ ∈ μ_{q-1}(L); for p odd μ(L) = μ_{q-1}(L), so φ_L(ζ) = ζ^p for every root of unity of L. For a finite product L = ∏_i L_i of such fields put φ_L := ∏_i φ_{L_i}; then φ_L(ζ) = ζ^p componentwise. This is the rank-one relation φ_p ζ = ζ^p of GSWZ (176).

**Hypotheses.** L/Q_p finite unramified (ramification index one); p any prime for the first two assertions, p odd for μ(L) = μ_{q−1}(L).

**Suggested declaration.** `unramified_frobenius_on_roots`.

**Direct prerequisites.** `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`, `tauceti:TauCeti.eq_teichmuller`, `mathlib:IsArithFrobAt`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Proof or construction.**

1. φ_L(ω(α)) is a (q−1)-torsion unit reducing to α^p, so it equals ω(α^p) by TauCeti.eq_teichmuller; and ω(α)^p is also (q−1)-torsion with residue α^p.
2. For p odd an unramified L contains no nontrivial p-power root of unity (Q_p(ζ_p)/Q_p is totally ramified of degree p − 1 > 1), so μ(L) = μ_{q−1}(L).
3. On a finite product, Frobenius and the Teichmüller lift are taken componentwise.

**Acceptance.**

- L = Q_{25} (p = 5): φ_L has order 2 and fixes exactly μ_4 ⊂ μ_{24}.
- For p = 2 and L = Q_2, −1 ∈ μ(L) is not of order prime to 2; the identity φ(ζ) = ζ^2 fails for ζ = −1, so the odd-p hypothesis is needed for the full μ(L).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38 — The relation stated here, extended to finite products of unramified fields.; [TauCetiTeichmuller](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), TauCeti/NumberTheory/LocalField/Teichmuller.lean, eq_teichmuller — The uniqueness used to identify φ(ω(α)) with ω(α^p)..

#### Coleman's p-adic dilogarithm on a finite étale Q_p-algebra

`PadicHodgeRegulators:D.1/etale-algebra-dilogarithm` — construction.

Let A be a finite étale Q_p-algebra, with its canonical decomposition A = ∏_{i∈I} A_i into finite field extensions A_i/Q_p (the primitive idempotents). Put A^adm := {z ∈ A : z_i ∉ {0, 1} for every i}. For a finite extension M/Q_p and x ∈ M ∖ {0, 1} define D_M(x) := ι^{-1}(D^0(ι(x))) for any Q_p-embedding ι : M → C_p, where D^0(z) = Li_2(z) + ½·log_p(z)·log_p(1 − z) is Coleman's dilogarithm for the Iwasawa branch log_p(p) = 0 (ColemanIntegration:L2/dilogarithm-identities with a = 0); it lies in M and does not depend on ι. Define D_A : A^adm → A by D_A(z) := (D_{A_i}(z_i))_{i∈I}, and extend it additively to D_A : Z[A^adm] → A on the free abelian group of formal symbols [z]. This is GSWZ's D_p of (174) applied factor by factor.

**Hypotheses.** A is a finite étale (equivalently finite reduced) commutative Q_p-algebra; p is any prime. The branch of the logarithm is the Iwasawa branch log_p(p) = 0 (ColemanIntegration:L0/iwasawa-logarithm).

**Suggested declaration.** `etaleDilog`.

**Direct prerequisites.** `ColemanIntegration:L2/dilogarithm-identities`, `ColemanIntegration:L0/iwasawa-logarithm`, `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L2/values-in-finite-extensions`, `mathlib:PadicComplex`, `mathlib:FreeAbelianGroup`.

**Proof or construction.**

1. Values in M: D^0 maps M ∖ {0,1} into M for every finite M ⊂ C_p (ColemanIntegration:L2/values-in-finite-extensions with a = 0).
2. Independence of ι: two embeddings differ by a continuous automorphism σ of C_p over Q_p, and σ(D^0(z)) = D^0(σ z) because the Iwasawa branch is Galois equivariant (ColemanIntegration:L2/galois-equivariance and L2/dilogarithm-identities (f)).
3. The decomposition of A into fields is canonical, so D_A is well defined; additivity defines it on the free abelian group.

**Acceptance.**

- For A = Q_p × Q_p and z = (x, y), D_A(z) = (D(x), D(y)).
- D_A is defined at z = (−1, 2) ∈ Q_5 × Q_5 but not at (1, 2): admissibility is componentwise.

**API.**

- `etaleDilog` (data): etaleDilog A : A → A is a componentwise total extension of the map on A^adm, assigning 0 at 0 and 1 in each field factor. Only its restriction to A^adm has mathematical content; it is not required to be zero as an entire vector whenever one component is inadmissible.
- `etaleAdmissible` (other): etaleAdmissible z : every component of z differs from 0 and 1 (the domain A^adm).
- `etaleDilog_apply_pi` (simp): For A = ∏_i A_i and admissible z, (etaleDilog A z)_i = etaleDilog A_i z_i.
- `etaleDilog_field` (compatibility): For a finite field extension M ⊂ C_p of Q_p and x ∈ M ∖ {0,1}, etaleDilog M x = D^0(x), Coleman's D for the Iwasawa branch.
- `etaleDilog_map` (functoriality): For a Q_p-algebra homomorphism f : A → B of finite étale algebras with f(A^adm) ⊆ B^adm, etaleDilog B (f z) = f (etaleDilog A z).
- `etaleDilog_one_sub` (relation): etaleDilog A (1 − z) = −etaleDilog A z for admissible z.
- `etaleDilog_inv` (relation): etaleDilog A z⁻¹ = −etaleDilog A z for admissible z.
- `etaleDilog_fiveTerm` (relation): For x, y ∈ A^adm with x − y a unit, D(x) − D(y) + D(y/x) − D((1 − x⁻¹)/(1 − y⁻¹)) + D((1 − x)/(1 − y)) = 0 componentwise (ColemanIntegration:L2/five-term-relation).
- `etaleDilog_rootOfUnity` (simp): For ζ ∈ A with ζ^m = 1 and all components ≠ 1, etaleDilog A ζ = (Li_2(ζ_i))_i, since log_p vanishes on roots of unity.
- `etaleDilogHom` (constructor): The additive extension FreeAbelianGroup A^adm →+ A, [z] ↦ etaleDilog A z.
- `etaleDilog_extensionality` (extensionality): Two dilogarithm values in a finite product agree iff all component values agree. The additive extension is determined by its values on admissible FreeAbelianGroup generators; it preserves zero and addition, whereas D_A on admissible points is not an additive map.
- `etaleDilogHom_of` (simp): etaleDilogHom D (FreeAbelianGroup.of z) = etaleDilog D z.val for z∈A^adm.

**Unit tests.**

- `etaleDilog_neg_one` (computation): For p odd, etaleDilog Q_p (−1) = 0: the inversion relation gives D(−1) = −D(−1).
- `etaleDilog_teichmuller_two_mod` (computation): For p = 5 and ω = TauCeti.teichmuller Q_5 2 (a primitive 4th root of unity), etaleDilog Q_5 ω ∈ 25·Z_5 and etaleDilog Q_5 ω ≡ 25 mod 125 (by D.3/finite-polylogarithm-reduction, since li_{2,5}(2) = 1 in F_5); this is the Q_5-component of D_5(ζ_24) in GSWZ (273).
- `etaleDilog_zero_algebra` (degenerate): For the zero algebra A = 0 (empty product), A^adm = {0} and etaleDilog A 0 = 0.
- `etaleDilog_diag` (compatibility): For the diagonal Q_p → Q_p × Q_p and x ∉ {0,1}, etaleDilog (Q_p × Q_p) (x, x) = (D^0(x), D^0(x)), agreeing with ColemanIntegration's D^0.
- `etaleDilog_not_branch_one` (non-example): With the branch log_1 (log_1(p) = 1) instead of the Iwasawa branch, D^1(p) − D^0(p) = ½·log_p(1 − p) ≠ 0 (ColemanIntegration:L2/dilogarithm-identities (d)); a definition with an unpinned branch is wrong at z = p ∈ Q_p^adm.

**Used by.** GSWZ §3.1, paragraph after (174): the functions D_σ for the embeddings σ : K → C_p are combined into one map with values in K_p, factor by factor; PadicHodgeRegulators:D.3/local-regulator: the regulator on completed K_3 of an unramified algebra is compared with D_A on symbols of special units and of roots of unity; HabiroNumberFields:HB.7/pochhammer-sections: the factor exp(−Li_2(ζ)/(m² log q)) of the explicit sections is D_A(ζ) for roots of unity; HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm: the potential specialises to φ_p(D_p(ξ))/p − p·D_p(ξ) with D_p evaluated componentwise.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (174), p. 37 — The function D^0 used factor by factor.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph after (174), p. 38 — The combination into an algebra-valued map; here it is done for any finite étale Q_p-algebra.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, after Remark 1.5 (Galois equivariance), p. 3 — Values in the field of the argument, for a branch with log p = 0..

**Planet.** p-adic dilogarithm D_p on étale algebras.

#### Frobenius and extension-of-scalars squares for the p-adic dilogarithm

`PadicHodgeRegulators:D.1/dilogarithm-scalar-extension` — lemma.

Let A → B be an injective homomorphism of finite étale Q_p-algebras (for instance K ⊗ Q_p → K' ⊗ Q_p for an extension of number fields K ⊂ K', or the inclusion of a factor-wise extension of local fields). (a) Extension of scalars: for z ∈ A^adm, D_B(ι z) = ι(D_A(z)). (b) Automorphisms: for every Q_p-algebra automorphism τ of A, D_A(τ z) = τ(D_A(z)); in particular, for a finite unramified product A with Frobenius φ_A (D.1/unramified-frobenius-on-roots), D_A(φ_A z) = φ_A(D_A(z)) and D_A(ζ^p) = φ_A(D_A(ζ)) for every root of unity ζ of order prime to p with all components ≠ 1. (c) Trace: if B is free over A, then Tr_{B/A}(D_B(ι z)) = [B : A]·D_A(z) for z ∈ A^adm. (d) Frobenius-modified value: for A unramified and ζ ∈ μ(A) of order prime to p with all components ≠ 1, (1 − p^{-2}φ_A)(D_A(ζ)) = ℓ_2(ζ), the integral modified dilogarithm of ColemanIntegration:L2/integral-modified-polylogarithm, which lies in O_A. (e) Frobenius behaviour on residue discs of special units: for p odd, A unramified and z ∈ O_A with z and 1 − z units in every factor, D_A(z) − p^{−2}D_A(z^p) = Li^{(p)}_2(z) − ½·log_p(z)·Li^{(p)}_1(z) componentwise, and this lies in O_A (Li^{(p)}_k = ℓ_k is bounded by 1 off the residue disc of 1, and log_p(z) ∈ pO_A).

**Hypotheses.** A, B finite étale Q_p-algebras; the Iwasawa branch throughout. In (b) for Frobenius and in (d), A is a finite product of finite unramified extensions of Q_p.

**Suggested declaration.** `dilogarithm_scalar_extension`.

**Direct prerequisites.** `PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`, `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`, `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `ColemanIntegration:L2/integral-modified-polylogarithm`, `ColemanIntegration:L2/frobenius-relation`, `PadicHodgeRegulators:D.1/unit-logarithm-kernel`, `mathlib:Algebra.trace`.

**Proof or construction.**

1. (a) and (b) are etaleDilog_map applied to the injection and to τ; the decomposition of A and B into fields is respected by algebra maps, and on each factor the claim is Galois equivariance of D^0 for the Iwasawa branch.
2. For Frobenius, φ_A(ζ) = ζ^p (D.1/unramified-frobenius-on-roots), so D_A(ζ^p) = D_A(φ_A ζ) = φ_A D_A(ζ).
3. (c) Tr_{B/A}∘ι is multiplication by the rank on ι(A).
4. (d) D(ζ) = Li_2(ζ) since log_p ζ = 0; ColemanIntegration:L2/values-at-tame-roots-of-unity (a) with k = 2 gives Li_2(ζ) − p^{-2}Li_2(ζ^p) = ℓ_2(ζ), and Li_2(ζ^p) = φ_A(Li_2(ζ)) by (b).
5. (e) is ColemanIntegration:L2/dilogarithm-identities (e) on each factor, with ColemanIntegration:L2/frobenius-relation identifying Li^{(p)}_k with the integral function ℓ_k on P¹ ∖ D⁻(1,1) and D.1/unit-logarithm-kernel giving log_p(z) ∈ pO_A.

**Acceptance.**

- For A = Q_{25}, p = 5, ζ = ζ_24: D(ζ_24^5) = φ(D(ζ_24)), checked on the expansions of GSWZ (273) as a 5-adic identity in Z_{25}.
- For p>3, (1−p^(−2)φ)D(ζ)=ℓ_2(ζ) exactly and D(ζ)∈p²O_A. When ℓ_2(ζ) is a unit, the two values generate lattices differing by p²; no unit claim is made for every ζ.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38 — The Frobenius compatibility on roots of unity.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6 — Frobenius equivariance at roots of unity of order prime to p..

#### The combined p-adic dilogarithm of a number field

`PadicHodgeRegulators:D.1/combined-dilogarithm` — construction.

Let K be a number field, p a prime and K_p := K ⊗_Q Q_p, a finite étale Q_p-algebra identified with ∏_{v|p} K_v by Tau Ceti's semilocal equivalence (NumberFieldArithmetic layer 5). Define D_{K,p} on the free abelian group Z[K^×] by [z] ↦ D_{K_p}(z ⊗ 1) for z ≠ 1 (D.1/etale-algebra-dilogarithm; z ⊗ 1 is admissible) and [1] ↦ 0. Its v-component is D_σ([z]) = D^0(σ_v(z)) for the embedding σ_v : K → K_v ⊂ C_p, as in GSWZ §3.1. D_{K,p} kills the five-term relations, hence factors through the pre-Bloch group P(K) of K3BlochGroups:V.3/pre-bloch-group, and restricts to D_{K,p} : B(K) → K_p on Suslin's Bloch group. On B(K) the map does not depend on the branch of the logarithm used to define D.

**Hypotheses.** K a number field, p any prime; the integrality statements of D.3–D.4 add p > 3 unramified in K. The Iwasawa branch is used to define D; branch independence is asserted only on B(K).

**Suggested declaration.** `blochDilog`.

**Direct prerequisites.** `PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`, `K3BlochGroups:V.3/pre-bloch-group`, `K3BlochGroups:V.3/bloch-group`, `K3BlochGroups:V.3/five-term-relation`, `ColemanIntegration:L2/five-term-relation`, `ColemanIntegration:L2/dilogarithm-identities`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Proof or construction.**

1. The five-term relation of ColemanIntegration:L2/five-term-relation holds in every factor K_v ⊂ C_p, so the additive extension kills the five-term subgroup and descends to P(K).
2. Branch independence on B(K): by ColemanIntegration:L2/dilogarithm-identities (d), D^a(z) − D^b(z) = ½(a − b)·Φ(z ∧ (1 − z)) with Φ(x ∧ y) = v(x)·log_b(y) − v(y)·log_b(x) an alternating biadditive form; it vanishes on the kernel of the boundary, which is B(K) (for Suslin's antisymmetric target, Φ factors through it since Φ(x ∧ x) = 0).
3. The identification of components with the D_σ is the definition of the semilocal equivalence.

**Acceptance.**

- For K = Q, D_{Q,p}([z]) = D^0(z) ∈ Q_p.
- For K = Q(α), α³ − α² + 1 = 0 and p = 5, D_{K,5}(2[1 − α²] + [1 − α]) is the value printed in GSWZ (271), with K_5 ≅ Q_{25} × Q_5.

**API.**

- `combinedDilog` (data): combinedDilog K p : FreeAbelianGroup Kˣ →+ K ⊗[ℚ] ℚ_[p], with [1] ↦ 0.
- `combinedDilog_of` (simp): combinedDilog K p [z] = etaleDilog (K ⊗ ℚ_[p]) (z ⊗ 1).
- `combinedDilog_component` (projection): Under K ⊗ Q_p ≅ ∏_{v|p} K_v, the v-component of combinedDilog K p [z] is D^0(σ_v z).
- `combinedDilog_fiveTerm` (relation): combinedDilog vanishes on the five-term subgroup, giving preBlochDilog K p : P(K) →+ K ⊗ Q_p.
- `blochDilog` (constructor): blochDilog K p : B(K) →+ K ⊗ Q_p, the restriction of preBlochDilog to Suslin's Bloch group.
- `blochDilog_branch_indep` (characterisation): For any branch parameter a ∈ Q_p, the Bloch-group map built from D^a equals blochDilog K p.
- `blochDilog_map` (functoriality): For a field embedding K → K', blochDilog K' p ∘ B(ι) = (ι ⊗ 1) ∘ blochDilog K p.
- `blochDilog_galois` (functoriality): For τ ∈ Aut(K), blochDilog K p ∘ B(τ) = (τ ⊗ 1) ∘ blochDilog K p.
- `combinedDilog_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `combinedDilog_rat` (compatibility): For K = Q, combinedDilog Q p [z] = D^0(z) ∈ Q_p, the ColemanIntegration value.
- `combinedDilog_zero` (degenerate): combinedDilog K p 0 = 0, and blochDilog vanishes on the subgroup generated by [x] + [x⁻¹] for x ≠ 0, 1.
- `blochDilog_cubic_five` (computation): For K = Q(α), α³ − α² + 1 = 0, ξ = 2[1 − α²] + [1 − α] ∈ B(K) and p = 5, blochDilog K 5 ξ = (3·5² + 5³ + 2·5⁴ + …)α² + (5² + 3·5³ + …)α + (2·5² + 3·5³ + …), GSWZ (271).
- `combinedDilog_not_on_bloch_branch` (non-example): On the pre-Bloch group the map depends on the branch: for p odd the symbol [p] ∈ P(Q) has D^1([p]) − D^0([p]) = ½·log_p(1 − p) ≠ 0, so branch independence is not asserted off B(K) ([p] ∉ B(Q) since p ∧ (1 − p) ≠ 0).

**Used by.** GSWZ §1.5, (19) and (22): the regulator D_p(ξ) entering the formal completion f̂ of an invertible section; PadicHodgeRegulators:D.4/special-unit-formula: equals the global p-adic regulator on Bloch elements presented by special units at p; HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm: D_p(ξ) = Σ_j D_p(z_j) for the Nahm-equation solutions z_j; HabiroNumberFields:HB.7/invertible-local-sections: the normalisation of the local sections uses D_p(ξ).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph after (174), p. 38 — The construction; here for all p, with the integrality restricted to unramified p > 3.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Example 4.3, (270)–(271), p. 54 — The computation test; z_2 = z_1² − z_1 + 2 = 1 − α and z_3 = z_1.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.15, p. 6 — Branch independence on the weight-two cohomology, proved here directly for B(K) from the explicit branch difference..

**Planet.** Combined p-adic dilogarithm D_p.

#### Dictionary of dilogarithm and regulator normalisations

`PadicHodgeRegulators:D.1/regulator-normalisation-dictionary` — comparison.

Fix the Iwasawa branch. On C_p ∖ {0,1}: (i) GSWZ's D_p(z) = Li_2(z) + ½ log(z) log(1 − z) (GSWZ (174)) equals Coleman's D(z) (ColemanIntegration:L2/dilogarithm-identities with a = 0), Besser–de Jeu's L_mod,2(z) = L_2(z) + ½ log(z) L_1(z) = Li_2(z) − ½ log(z) Li_1(z) (BdJ §1, the unique choice for n = 2), and the n = 2 case L^mod_2 = Li_2 + B_1 Li_1 log of ColemanIntegration:L3/padic-regulator-polylogarithm (B_1 = −1/2, Li_1(z) = −log(1 − z)). (ii) Besser–de Jeu's regulator formula carries the factor ±(n − 1)!, which is ±1 for n = 2; the sign is the indeterminacy of BdJ Remark 1.7 and is fixed once in D.3/local-regulator. (iii) Gros's syntomic regulator on an unramified field satisfies reg^Gros = (1 − Frob/p²)·reg^Besser in weight two (BdJ Remark 1.13); on a root of unity ζ of order prime to p it takes the value ℓ_2(ζ) = Li_2(ζ) − p^{-2}Li_2(ζ^p) ∈ O, while for p>3 the Besser value Li_2(ζ) lies in p²O (D.1/dilogarithm-scalar-extension (d)). (iv) Forward comparison, established at D.2/syntomic-etale-regulator-comparison rather than used to prove D.1: the Bloch–Kato normalisation: under D_dR(Q_p(2)) = L·e_2, e_2 = t^{-2}⊗ε^{⊗2}, with t = log[ε] the period of Q_p(1), the regulator of GSWZ is ε·log_BK∘c_{2,1} for one sign ε ∈ {±1} (D.2/syntomic-etale-regulator-comparison). (v) On roots of unity ζ ≠ 1 every branch gives the same value D(ζ) = Li_2(ζ), and on special units (|z| = |1 − z| = 1) D is branch independent.

**Hypotheses.** p any prime for (i), (ii) and (v); (iii) and (iv) concern unramified, respectively arbitrary, finite extensions L/Q_p. The p²-integrality clause in (iii) requires p>3.

**Suggested declaration.** `regulator_normalisation_dictionary`.

**Direct prerequisites.** `ColemanIntegration:L2/dilogarithm-identities`, `ColemanIntegration:L3/padic-regulator-polylogarithm`, `ColemanIntegration:L2/branch-dependence`, `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`, `mathlib:bernoulli`.

**Proof or construction.**

1. (i) Li_1(z) = −log(1 − z) turns L_2 + ½ log·L_1 into Li_2 + ½ log z log(1 − z); with B_0 = 1, B_1 = −1/2 the Bernoulli formula gives the same function.
2. (ii) and (iii) are BdJ Theorem 1.6(2) with n = 2 and BdJ Remark 1.13; (iii) at roots of unity is ColemanIntegration:L2/values-at-tame-roots-of-unity (a) with k = 2.
3. (v) is ColemanIntegration:L2/branch-dependence (i) and (iv) at k = 2, combined with log_a(ζ) = 0.

**Acceptance.**

- L_mod,2 = D on every z ∈ C_p ∖ {0,1}, checked symbolically from the definitions.
- For p = 5 and ζ = ω(2) ∈ Q_5: Li_2(ζ) ≡ 25 mod 125 while ℓ_2(ζ) = (1 − 5^{-2})Li_2(ζ) ≡ −1 mod 5 is a unit.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, after Remark 1.5's preamble, p. 3 — Identity (i).; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6 — Identity (iii).; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §1.5, (19), p. 9 — The normalisation GSWZ adopt; see sourceIssues E101 for the scope of the cited theorem..

#### Kernel of the logarithm on local units and the p-adic regulator matrix

`PadicHodgeRegulators:D.1/unit-logarithm-kernel` — lemma.

(a) Let L/Q_p be finite. The Iwasawa logarithm restricts to a continuous homomorphism log_p : O_L^× → L whose kernel is the finite group μ(L) of all roots of unity in L (including those of p-power order, and ±1 when p = 2) and whose image is an open Z_p-submodule of L; hence log_p induces an isomorphism (O_L^×)^∧_p ⊗_{Z_p} Q_p ≅ L, and for L unramified and p odd it maps U^1_L = 1 + pO_L isomorphically onto pO_L. (b) Let F be a number field, E_F its unit group and ε_1, …, ε_r a basis of E_F modulo torsion. The composite E_F ⊗ Z_p → ∏_{v|p}(O_v^×)^∧_p → ∏_{v|p} F_v = F ⊗ Q_p (completion followed by log_p), after the scalar extension F ⊗ Q_p ⊗_{Q_p} C_p ≅ C_p^{Hom(F, C_p)}, has matrix (log_p σ_j(ε_i))_{i ≤ r, j ≤ [F:Q]}. In particular rr_p(F), the rank of this matrix (Polylogarithms:P.6/padic-regulator), is the Z_p-rank of the image of E_F ⊗ Z_p in ∏_{v|p}(O_v^×)^∧_p, and Leopoldt's conjecture for (F,p) is injectivity of the rational unit logarithm (E_F/μ(F))⊗_Z Q_p → F⊗_Q Q_p. This is equivalent to full rank r of the displayed logarithm matrix; torsion is removed before stating the rank criterion.

**Hypotheses.** log_p is the Iwasawa branch (log_p(p) = 0); embeddings σ_j : F → C_p are the [F:Q] field embeddings.

**Suggested declaration.** `unit_logarithm_kernel`.

**Direct prerequisites.** `ColemanIntegration:L0/iwasawa-logarithm`, `ColemanIntegration:L0/log-one-add-convergence`, `ColemanIntegration:L0/log-branch-field-compatibility`, `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof or construction.**

1. (a) By the Teichmüller decomposition log_p(u) = log(⟨u⟩); on U^1_L the logarithm is a homomorphism whose kernel is the p-power torsion (a principal unit with log 0 is a root of unity: the series log and exp are inverse on 1 + p^c O_L for c > 1/(p − 1)), and it is an isomorphism 1 + p^c O_L ≅ p^c O_L for such c. So the kernel on O_L^× is μ(L) and the image contains p^c O_L, an open lattice.
2. For L unramified and p odd, c = 1 works and U^1_L contains no nontrivial p-power roots of unity.
3. (b) Under the semilocal equivalence the v-component is log_p on F_v; extending scalars to C_p and decomposing by embeddings gives the entries log_p σ_j(ε_i) by ColemanIntegration:L0/log-branch-field-compatibility.

**Acceptance.**

- For L = Q_p (p odd), log_p(Z_p^×) = pZ_p and the kernel is μ_{p−1}.
- For p = 2 and L = Q_2 the kernel is {±1}: the torsion kernel must include 2-power roots of unity.
- For F = Q(√2), p = 7 and ε = 1 + √2, the 1 × 2 matrix (log_7(1 + √2), log_7(1 − √2)) has rank 1 because ε is not a root of unity.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, p. 37 — The branch fixed throughout the layer..

#### The logarithm takes norms to traces

`PadicHodgeRegulators:D.1/logarithm-norm-trace` — lemma.

Let A → B be a finite free extension of finite étale Q_p-algebras (for instance an extension of finite products of p-adic fields, or K ⊗ Q_p → K' ⊗ Q_p for number fields K ⊂ K'). For every u ∈ B^× with log_p defined componentwise, log_p(N_{B/A}(u)) = Tr_{B/A}(log_p(u)). In particular, for an extension of p-adic fields L'/L, log_p ∘ N_{L'/L} = Tr_{L'/L} ∘ log_p on L'^×, and the same holds on the completed unit groups.

**Hypotheses.** log_p is the Iwasawa branch, applied factor by factor.

**Suggested declaration.** `logarithm_norm_trace`.

**Direct prerequisites.** `ColemanIntegration:L0/iwasawa-logarithm`, `ColemanIntegration:L0/log-branch-field-compatibility`, `mathlib:Algebra.norm`, `mathlib:Algebra.trace`.

**Proof or construction.**

1. Reduce to fields by decomposing A and B; for L'/L separable, N(u) = ∏_σ σ(u) and Tr(x) = Σ_σ σ(x) over the L-embeddings of L' into C_p.
2. log_p is a homomorphism and commutes with every continuous automorphism of C_p (the Iwasawa branch is Galois equivariant), so log_p(∏_σ σ u) = Σ_σ σ(log_p u).

**Acceptance.**

- For L' = Q_{p²}, L = Q_p and u = ω(α) a Teichmüller unit, both sides vanish.
- Field preservation matters: take L=Q_p, L′/L unramified quadratic and a∈L′\Q_p. The C_p-valued branch log_a(p)=a has log_a(N_{L′/L}p)=2a but Tr_{L′/L}(log_a p)=Tr(a)∈Q_p; these differ. Such a branch does not define an L-valued logarithm on L and is outside the theorem’s hypotheses.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, after Remark 1.5's preamble, p. 3 — Galois equivariance, the input that turns norms into traces..

### D.2. Étale and syntomic regulators

#### Soulé's étale regulator to continuous Galois cohomology

`PadicHodgeRegulators:D.2/etale-regulator` — construction.

Let F be a field of characteristic 0 (a number field, a finite extension of Q_p, or a finite product of such), p a prime and n ≥ 1. The étale regulator r^et_n : K_{2n−1}(F) → H^1(F, Z_p(n)) is the composite of the reductions K_{2n−1}(F) → K_{2n−1}(F; Z/p^ν), Soulé's étale Chern classes c_{n,1} : K_{2n−1}(F; Z/p^ν) → H^1(F, μ_{p^ν}^{⊗n}) (compatible in ν), and the inverse limit H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) of continuous cohomology; it factors through the completion K_{2n−1}(F; Z_p) and induces r^et_n ⊗ Q : K_{2n−1}(F) ⊗ Q_p → H^1(F, Q_p(n)). For n = 1 it is the Kummer map F^× → H^1(F, Z_p(1)). For F a finite extension of Q_p and n ≥ 2 the map on completed K-theory is the isomorphism of KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1.

**Hypotheses.** F of characteristic 0; Chern classes in the normalisation of Soulé (Chern classes, not Chern character components); n ≥ 1.

**Suggested declaration.** `etaleRegulator`.

**Direct prerequisites.** `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.1`, `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, `KTheoryFiniteLocalFields:L.1/completed-k-theory`, `KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1`, `KTheoryFiniteLocalFields:L.7/etale-chern-class-completion`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `tauceti:TauCeti.kummerClassMap`, `SelmerIwasawaCohomology:L0/padic-kummer-identification`.

**Proof or construction.**

1. Soulé's Chern classes c_{n,1} with Z/p^ν-coefficients are supplied by MotivicEtaleKTheory (request on M.7: the Chern-class part that needs only étale K-theory, as RT-AREA-ktheory-2/18 directs); their compatibility with the coefficient maps ν ↦ ν ± 1 gives the limit.
2. ArithmeticGaloisDuality:R02.1/tate-inverse-limit identifies lim_ν H^1(F, μ_{p^ν}^{⊗n}) with continuous H^1(F, Z_p(n)) (the lim¹ term vanishes since the H^0 are finite).
3. For n = 1, c_{1,1} is the Kummer map (KTheoryFiniteLocalFields:L.7/etale-chern-class-completion, degree one).

**Acceptance.**

- For F = Q_p and n = 1, r^et_1(u) for u ∈ Z_p^× is the Kummer class of u, Tau Ceti's kummerClassMap in the limit.
- For F = Q_5 and n = 2, the completed map K_3(Q_5; Z_5) → H^1(Q_5, Z_5(2)) ≅ Z_5 is an isomorphism.

**API.**

- `etaleRegulator` (data): etaleRegulator F p n : K_{2n−1}(F) →+ H^1(F, ℤ_p(n)).
- `etaleRegulator_completed` (constructor): The factorisation through K_{2n−1}(F; ℤ_p), a ℤ_[p]-linear map.
- `etaleRegulator_one` (compatibility): For n = 1, etaleRegulator F p 1 is the Kummer map F^× → H^1(F, ℤ_p(1)).
- `etaleRegulator_map` (functoriality): For a field embedding F → F', res ∘ etaleRegulator F = etaleRegulator F' ∘ K_{2n−1}(ι).
- `etaleRegulator_transfer` (functoriality): For F'/F finite, cor ∘ etaleRegulator F' = etaleRegulator F ∘ N_{F'/F} (transfer).
- `etaleRegulator_local_equiv` (equivalence): For F/ℚ_p finite and n ≥ 2, the completed map is the isomorphism of KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1.
- `etaleRegulator_completion` (compatibility): For a number field F and v | p, res_v ∘ etaleRegulator F = etaleRegulator F_v ∘ c_v.
- `etaleRegulator_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `etaleRegulator_kummer` (compatibility): For F = Q_p, n = 1 and u ∈ Z_p^×, etaleRegulator F p 1 u is the image of u under lim_ν of Tau Ceti's kummerClassMap.
- `etaleRegulator_rank_q5` (computation): For F = Q_5, n = 2, the completed etaleRegulator is a ℤ_5-linear isomorphism between free modules of rank 1.
- `etaleRegulator_torsion_Q` (degenerate): For F = Q and n = 2, K_3(Q) ≅ Z/48 is torsion, so the image of etaleRegulator Q p 2 lies in the torsion of H^1(Q, Z_p(2)) and its rationalisation is 0.
- `etaleRegulator_not_basis_functional` (non-example): For F = Q_{p²} and p > 3, a ℤ_p-isomorphism K_3(F; ℤ_p) ≅ ℤ_p² chosen from bases is not etaleRegulator: etaleRegulator commutes with the Frobenius automorphism of F, while a generic basis isomorphism does not.

**Used by.** Huber–Kings 2011, §1.3 and Theorem 1.3.2: Soulé's regulator r_p, compared with the Bloch–Kato exponential of the p-adic Borel regulator; PadicHodgeRegulators:D.3/local-regulator: the p-adic regulator on completed K_3 is ε·log_BK∘r^et_2; EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: z = log_BK(reg_et(u)) is the étale side of the elliptic Frobenius factor; KatoEulerSystems:L1: étale Chern classes of symbols on modular curves, imported through D.2.

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), §1.3, p. 8 — Soulé's regulator r_p as Chern classes, the definition used here.; [NN2016](https://arxiv.org/abs/1309.7620v5), §5.2, p. 59 — The étale regulator for varieties; for X = Spec F and i = 0 it is the map of this node..

**Planet.** Soulé's étale regulator.

#### Rigid syntomic cohomology of smooth schemes over a p-adic integer ring

`PadicHodgeRegulators:D.2/rigid-syntomic-cohomology` — definition.

Let R be a complete discrete valuation ring of characteristic 0 with perfect residue field k of characteristic p and fraction field K, R_0 = W(k), K_0 = R_0[1/p], and n ∈ Z. For a smooth R-scheme X with syntomic data (a smooth P_0 over R_0 with a σ-semilinear Frobenius lift Φ, a smooth P over R, X ↪ P and P_0 → P), Besser's rigid syntomic complex is RΓ_syn(X, n) := Cone(Fil^n RΓ_dR(X_K) ⊕ RΓ_rig(X_k/K_0) → RΓ_rig(X_k/K) ⊕ RΓ_rig(X_k/K_0))[−1], (a, b) ↦ (a − b, (1 − Φ*/p^n)b), with RΓ_rig from overconvergent de Rham complexes on the tubes; its cohomology H^i_syn(X, n) is independent of the syntomic data and functorial in X. For X = Spec R and n ≥ 1, H^i_syn(Spec R, n) = 0 for i ≠ 1 and the de Rham component η : H^1_syn(Spec R, n) ≅ K is an isomorphism (1 − σ/p^n being bijective on K_0).

**Hypotheses.** R a complete DVR, char K = 0, k perfect of characteristic p (finite in the arithmetic applications); X smooth, separated and of finite type over R.

**Suggested declaration.** `rigidSyntomicCohomology`.

**Direct prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/overconvergent-de-rham-complex`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison`, `DerivedDeRhamCohomology:DD.2`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lifts-induce-homotopic-maps`.

**Proof or construction.**

1. The cone is formed in the derived category of Q_p-vector spaces (Φ is σ-semilinear, so 1−Φ/p^n is generally only Q_p-linear) from the rigid cohomology of the special fibre (RD.4, with its Frobenius) and the Hodge filtration on algebraic de Rham cohomology of the generic fibre.
2. Independence of the syntomic data: two choices are dominated by their product, and the Frobenius lifts are homotopic on overconvergent de Rham complexes (PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lifts-induce-homotopic-maps).
3. For Spec R, put A = 1−σ/p^n. The cone differential is b ↦ (−b,Ab), consistent with (a,b) ↦ (a−b,Ab). Its cokernel identifies with K by η[(a,c)] = a + A^{-1}c, since η(−b,Ab)=0. Thus H^1_syn ≅ K and the other groups vanish for n≥1. Transporting the K-vector-space structure along η is possible at this point, not a K_0-linear structure on the general cone.

**Acceptance.**

- H^1_syn(Spec Z_p, 2) ≅ Q_p through η.
- H^0_syn(Spec R, n) = 0 for n ≥ 1 because 1 − σ/p^n has no kernel on K_0.

**API.**

- `rigidSyntomicCohomology` (data): rigidSyntomicCohomology X n i : the Q_p-vector space H^i_syn(X,n); 1−Φ/p^n is Q_p-linear. At Spec R, η transports the K-module structure if desired.
- `rigidSyntomicCohomology_map` (functoriality): A morphism of smooth R-schemes X → Y induces H^i_syn(Y, n) → H^i_syn(X, n), with map_id and map_comp.
- `rigidSyntomic_long_exact` (relation): For the filtered complex F^nRΓ_dR, the cone gives …→H^{i−1}(F^nRΓ_dR)⊕H^{i−1}_rig(K_0)→H^{i−1}_rig(K)⊕H^{i−1}_rig(K_0)→H^i_syn→H^i(F^nRΓ_dR)⊕H^i_rig(K_0)→… . Do not replace H^i(F^nRΓ_dR) by F^nH^i_dR without a degeneration/strictness theorem; smooth nonproper schemes need not allow this replacement.
- `rigidSyntomic_spec_eta` (equivalence): η : H^1_syn(Spec R, n) ≃ K for n ≥ 1.
- `rigidSyntomic_spec_vanish` (characterisation): H^i_syn(Spec R, n) = 0 for i ≠ 1 and n ≥ 1.
- `rigidSyntomic_independent` (other): Independence of the syntomic data up to canonical isomorphism.
- `rigidSyntomicCohomology_extensionality` (extensionality): The cohomology carrier is obtained from the specified Q_p-linear cone. Functorial induced maps are equal when the corresponding chain maps are homotopic; cohomology-map equality is pointwise. A homotopy does not assert equality of raw complexes.

**Unit tests.**

- `rigidSyntomic_zp_two` (computation): For R = Z_p, H^1_syn(Spec Z_p, 2) ≅ Q_p via η, and, with Huber–Kings' cone map (a, b) ↦ (a − b, (1 − Φ/p^n)b), the class of (0, c) with c ∈ Q_p maps to (1 − 1/p²)^{−1}c.
- `rigidSyntomic_weight_zero` (degenerate): For n = 0 and X = Spec R, H^0_syn(Spec R, 0) ≅ Q_p (the kernel of 1 − σ on K_0 is Q_p) and the η-isomorphism of the n ≥ 1 case does not hold.
- `rigidSyntomic_monsky_washnitzer` (compatibility): For X smooth affine, the rigid terms are Monsky–Washnitzer cohomology of the dagger algebra (PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison).
- `rigidSyntomic_not_de_rham` (non-example): H^1_syn(Spec R, n) is not Fil^n H^0_dR(K) (which is 0 for n ≥ 1): the syntomic group sees the cone, not the filtration step.

- `rigidSyntomic_filtration_complex` (non-example): For X_K=A¹_K, H¹(F¹RΓ_dR(X_K))=K[x]dx, whereas F¹H¹_dR(X_K)=0. The long exact sequence must retain the cohomology of the filtered complex.

**Used by.** Huber–Kings 2011, Definition 2.2.1 and Example 2.2.4: the target H^1_syn(Spec R, n) = K of the syntomic regulator on K_{2n−1}(R); Besser–de Jeu, §4: the modified syntomic cohomology H̃_ms receives Chern classes and computes the regulator on K_3; PadicHodgeRegulators:D.5/curve-syntomic-regulator: H^2_syn(X, 2) of a smooth proper curve with good reduction is identified with H^1_dR(X_K); ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements: the target K of Besser's regulator in the Coleman formula.

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Definition 2.2.1, p. 14 — The rigid syntomic complex.; [HK2011](https://arxiv.org/abs/math/0612611v1), Example 2.2.4, pp. 14–15 — The computation for Spec R.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), §6 and Proposition 8.6(3), author PDF pp. 26–28 — Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps..

#### Besser's syntomic regulator

`PadicHodgeRegulators:D.2/syntomic-regulator` — construction.

For a smooth R-scheme X (R as in D.2/rigid-syntomic-cohomology) and i, j ≥ 0, the syntomic Chern classes c^syn_{i,j} : K_j(X) → H^{2i−j}_syn(X, i) are obtained by evaluating the universal syntomic Chern classes c_i ∈ H^{2i}_syn(B_•GL_N, i) — characterised by mapping to the de Rham Chern classes in Fil^i H^{2i}_dR — through Gillet's formalism. For X = Spec R and n ≥ 1 the syntomic regulator is reg_syn := η ∘ c^syn_{n,2n−1} : K_{2n−1}(R) → K; for n ≥ 2 it factors through K_{2n−1}(R) ⊗ Q ≅ K_{2n−1}(K) ⊗ Q. It is compatible with finite extensions R → R' (reg_syn,R' ∘ K(ι) = ι ∘ reg_syn,R) and with automorphisms of R, and for n = 1 it is log_p on R^×.

**Hypotheses.** R a complete DVR of characteristic 0 with perfect residue field; for the arithmetic uses the residue field is algebraic over F_p and the branch of log is the Iwasawa branch.

**Suggested declaration.** `syntomicRegulator`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`, `SchemeKTheoryOperations:S.7/chern-character`, `SchemeKTheoryOperations:S.5/projective-bundle-theorem`, `KTheoryFiniteLocalFields:L.2/odd-k-ring-of-integers-equals-field`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`.

**Proof or construction.**

1. Syntomic cohomology satisfies the projective bundle formula and homotopy invariance needed by Gillet's construction; the universal classes on B_•GL_N are determined by their de Rham images (Huber–Kings Definition 2.3.3 after Besser Theorem 7.5).
2. Evaluating on BGL_N(R) and composing with the Hurewicz map gives c^syn_{n,2n−1} on K_{2n−1}(R).
3. Base change: Besser 2000, Proposition 8.8, as cited in Besser–de Jeu's proof of Theorem 1.12.

**Acceptance.**

- For n = 1 and u ∈ R^×, reg_syn(u) = log_p(u) (Huber–Kings Example 2.5.2).
- For R=Z_p and n=2, reg_syn is additive on algebraic K_3(Z_p). Its continuous completed extension induces a Q_p-linear isomorphism K_3(Z_p;Z_p)⊗Q_p→Q_p via the completed étale Chern class and log_BK. No injectivity on the algebraic tensor K_3(Z_p)⊗Q_p is asserted.

**API.**

- `syntomicChernClass` (data): syntomicChernClass X i j : K_j(X) →+ H^{2i−j}_syn(X, i).
- `syntomicRegulator` (constructor): syntomicRegulator R n := η ∘ syntomicChernClass (Spec R) n (2n−1) : K_{2n−1}(R) →+ K.
- `syntomicRegulator_one` (compatibility): syntomicRegulator R 1 u = log_p u for u ∈ Rˣ (Iwasawa branch).
- `syntomicRegulator_baseChange` (functoriality): For a finite extension R → R' with fraction fields K ⊂ K', syntomicRegulator R' n ∘ K(ι) = ι ∘ syntomicRegulator R n.
- `syntomicRegulator_aut` (functoriality): For an automorphism τ of R, syntomicRegulator R n ∘ K(τ) = τ ∘ syntomicRegulator R n.
- `syntomicChernClass_deRham` (characterisation): The image of the universal class in Fil^i H^{2i}_dR(B_•GL_N) is the de Rham Chern class.
- `syntomicChernClass_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `syntomicRegulator_log` (computation): For R = Z_p (p odd) and u = 1 + p, syntomicRegulator Z_p 1 u = log(1 + p) = p − p²/2 + p³/3 − … .
- `syntomicRegulator_teichmuller_one` (degenerate): For n = 1 and u a Teichmüller unit, syntomicRegulator R 1 u = 0.
- `syntomicRegulator_cyclotomic` (compatibility): For R = Z_p[ζ_m] with p ∤ m and ζ ≠ 1, syntomicRegulator R 2 [ζ]_2 = ±Li_2(ζ), the value of ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements at n = 2.
- `syntomicRegulator_not_gros` (non-example): For R = Z_p, the Gros normalisation (1 − Frob/p²)·syntomicRegulator differs from syntomicRegulator by the factor 1 − p^{−2} ≠ 1, so the two are not interchangeable in integrality statements.

**Used by.** Besser–de Jeu, Theorem 1.6(2): the regulator K^{(n)}_{2n−1}(O) → K^{(n)}_{2n−1}(R) → K computed on special units; ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements: reg_σ([ζ]_n) = ±(n−1)!·L^mod_n(σζ); Gros, Régulateurs syntomiques, as recalled in Besser–de Jeu Remark 1.13: reg^Gros = (1 − Frob/p^n)·reg for unramified fields.

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Definition 2.3.3, p. 16 — The universal syntomic Chern class.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, p. 1 — The regulator and its source in Besser's work.; [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 5.6, p. 57 — The generic-fibre version used for comparisons.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), §§7,9,10; Proposition 8.8 and Proposition 10.3 — Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps..

**Planet.** Besser's syntomic regulator.

#### The syntomic regulator is the Bloch–Kato logarithm of the étale regulator

`PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison` — theorem.

Let R be the integer ring of a finite extension K of Q_p and n ≥ 1. The natural map ρ_syn : H^1_syn(Spec R, n) → H^1(K, Q_p(n)) (compatible with Chern classes) equals exp_BK ∘ η, where exp_BK : K = D_dR(Q_p(n))/Fil^0 → H^1(K, Q_p(n)) is the Bloch–Kato exponential (L1/bloch-kato-exponential, with D_dR(Q_p(n)) = K·e_n (e_n=t^{−n}⊗ε^{⊗n})). Consequently, on K_{2n−1}(R): r^et_n ⊗ Q = exp_BK ∘ reg_syn, with no constant when both regulators use Chern classes. For n ≥ 2, exp_BK is an isomorphism and reg_syn = log_BK ∘ r^et_n; for n = 1 this is ∂ = exp_BK ∘ log_p on R^× (Bloch–Kato 3.10.1). For a smooth variety X over K the same Chern-class compatibility holds for the Nekovář–Nizioł syntomic regulator: ρ_syn ∘ c^syn_{i,j} = c^et_{i,j}, and the syntomic boundary followed by the arithmetic edge map H^q_dR(X)/F^r → H^1(G_K, H^q_et(X_K̄, Q_p(r))) is the Bloch–Kato exponential of H^q_et(X_K̄, Q_p(r)).

**Hypotheses.** K/Q_p finite (any ramification); n ≥ 1; Chern-class normalisation for both regulators.

**Suggested declaration.** `syntomic_etale_regulator_comparison`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/etale-regulator`, `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`, `SelmerIwasawaCohomology:L0/padic-kummer-identification`.

**Proof or construction.**

1. Besser constructs ρ_syn compatibly with Chern classes and identifies H^1_syn(Spec R, n) → H^1(K, Q_p(n)) with exp_BK ∘ η (Besser 2000, Propositions 9.9–9.11, as recalled in Huber–Kings Propositions 2.2.9 and 2.3.4 and Tamme, proof of Corollary 5.19).
2. The universal syntomic Chern class maps to the universal étale Chern class (Huber–Kings Proposition 2.3.4), hence r^et_n = exp_BK ∘ η ∘ c^syn_n on K_{2n−1}(R).
3. For varieties over K: Nekovář–Nizioł Proposition 5.7 (compatibility of Chern classes, no constant) and Proposition 4.13 (the boundary map is the Bloch–Kato exponential), with the sign convention of their Remark 2.14 fixed once.

**Acceptance.**

- n = 1, K = Q_p, u = 1 + p: exp_BK(log_p(1 + p)) is the Kummer class of 1 + p.
- n = 2, K = Q_5: for ζ = ω(2), log_BK(r^et_2([ζ])) = ±Li_2(ζ), consistent with D.2/weight-two-dilogarithm-comparison.
- The Huber–Kings p-adic Borel regulator satisfies r^et_n = exp_BK ∘ b_p (Huber–Kings Theorem 1.3.2); Tamme's Corollary 5.21 writes this with the factor (−1)^n/(n−1)! when the étale regulator is normalised by the Chern character.

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Proposition 2.3.4, p. 16 — The identification of H^1_syn(R, n) → H^1(K, Q_p(n)) with exp_BK ∘ η.; [Tamme2014](https://arxiv.org/abs/1111.4109v4), Proof of Corollary 5.19, p. 20 — The same comparison, for smooth projective R-schemes.; [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 5.7, p. 58 — Compatibility of Chern classes on the generic fibre.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Corollary 9.10 and Proposition 9.11, author PDF p. 32 — Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps..

#### Besser–de Jeu: the weight-two regulator is Coleman's dilogarithm on special units

`PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison` — theorem.

Let F be a field of characteristic 0, O ⊂ F a discrete valuation ring with residue field κ, and σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R (so κ is algebraic over F_p). Let ξ ∈ K_3(O) ⊗ Q be the image, under de Jeu's map H^1(M̃^{(2)}(O)) → K^{(2)}_3(O), of an element Σ_i n_i [x_i]_2 with n_i ∈ Q, x_i ∈ O^♭ special units (x_i, 1 − x_i ∈ O^×) and Σ_i n_i (1 − x_i) ∧ x_i = 0 in ∧²(O^×) ⊗ Q. Then reg_syn(σ_* ξ) = ±Σ_i n_i D(σ(x_i)), with D = L_mod,2 Coleman's dilogarithm (D.1/regulator-normalisation-dictionary), the sign being the single sign indeterminacy of de Jeu's map. For F a number field and O its localisation at a prime above p the same holds without further hypotheses, and for every root of unity ζ ≠ 1 of F (of any order) the cyclotomic element [ζ]_2 satisfies reg_syn(σ_*[ζ]_2) = ±Li_2(σζ). Combined with D.2/syntomic-etale-regulator-comparison: log_BK(r^et_2(σ_* ξ)) = ±Σ_i n_i D(σ x_i). For arbitrary elements of B(F) ⊗ Q (symbols that are not special units of O) the identity is Besser–de Jeu's Conjecture 1.14 and is not asserted.

**Hypotheses.** n = 2 (no Beilinson–Soulé hypothesis is needed in weight two). Every x_i is a special unit of O; the comparison of de Jeu's weight-two complex with Suslin's Bloch group (requested from Polylogarithms:P.4) transports the statement to B(F) ⊗ Q.

**Suggested declaration.** `weight_two_dilogarithm_comparison`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`, `PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`, `PadicHodgeRegulators:D.1/combined-dilogarithm`, `Polylogarithms:P.4`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.6/comparison-rational`.

**Proof or construction.**

1. Besser–de Jeu construct M̃^{(n)}(O) and a map H^1(M̃^{(n)}(O)) → K^{(n)}_{2n−1}(O) through multi-relative K-theory and localisation (their §3), natural up to sign.
2. The key computation, BdJ Proposition 7.10, evaluates the modified syntomic regulator on [z]_n for special units z as (−1)^n(n−1)!·L_n(z); for n = 2 the combination with the boundary term gives ±L_mod,2 = ±D.
3. Number fields (BdJ Theorem 1.10): no hypothesis is needed; roots of unity of order divisible by p (BdJ Theorem 1.12) follow from the distribution relation over F(μ_r) and the base-change compatibility of the syntomic regulator (Besser 2000, Proposition 8.8).
4. Transport to Suslin's B(F) ⊗ Q uses the weight-two comparison of de Jeu's complex with the Bloch–Suslin complex (request to Polylogarithms:P.4) and K3BlochGroups:V.6/comparison-rational.

**Acceptance.**

- F = Q(ζ_m), p ∤ m, σ an embedding into Q_p(ζ_m): reg_syn([ζ_m]_2) = ±Li_2(σζ_m) ∈ p²Z_p[ζ_m].
- GSWZ Example 4.3: all symbols 1 − α², 1 − α of ξ = 2[1 − α²] + [1 − α] and their complements are global units (norm ±1), so the theorem gives D.2's regulator of ξ at both places above 5 as ±D_5(ξ) of GSWZ (271).
- The symbol [p] ∈ P(Q) is not a special unit at p; no statement is made for presentations containing it.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.6(2), p. 4 — The theorem; n = 2 holds without the Beilinson–Soulé hypothesis.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.12, p. 6 — Cyclotomic elements of every order.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Conjecture 1.14, p. 6 — The general case, which remains conjectural and is not asserted here..

**Planet.** Besser–de Jeu dilogarithm formula.

#### Besser–de Jeu: the syntomic regulator in higher weight

`PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison` — theorem.

Let F be a number field, O the localisation of O_F at a prime above p, σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R, and n ≥ 2. On de Jeu's H^1(M̃^{(n)}(O)) → K^{(n)}_{2n−1}(O) ≅ K^{(n)}_{2n−1}(F), the composite with σ_* and reg_syn maps [x]_n (x a special unit of O) to ±(n − 1)!·L_mod,n(σ(x)), and for every root of unity ζ ≠ 1 of F (of any order) maps the cyclotomic element [ζ]_n to ±(n − 1)!·L_mod,n(σζ) = ±(n − 1)!·Li_n(σζ). For a field F of characteristic 0 and a discrete valuation ring O ⊂ F, the same holds on special units under the Beilinson–Soulé conjecture for F and its residue field (n ≥ 3). L_mod,n is the modified polylogarithm of ColemanIntegration:L3/padic-regulator-polylogarithm. For n = 2 this is D.2/weight-two-dilogarithm-comparison.

**Hypotheses.** n ≥ 2; F a number field (no further hypothesis), or the Beilinson–Soulé conjecture for F and κ when n ≥ 3. The comparison of de Jeu's complexes with K-theory in weight n is requested from Polylogarithms:P.4.

**Suggested declaration.** `higher_weight_polylogarithm_comparison`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `ColemanIntegration:L3/padic-regulator-polylogarithm`, `ColemanIntegration:L2/distribution-relation`, `Polylogarithms:P.4`.

**Proof or construction.**

1. BdJ Proposition 7.10: the modified syntomic regulator of [z]_n for a special unit z is (−1)^n(n − 1)!·L_n(z) in their normalisation; with the boundary terms of the complex this gives ±(n − 1)!·L_mod,n(z).
2. Number fields need no Beilinson–Soulé hypothesis (BdJ Theorem 1.10); roots of unity of order divisible by p follow from the distribution relation over F(μ_r) with r ≡ 1 mod p^s and base change (BdJ Theorem 1.12, Besser 2000 Proposition 8.8).
3. L_mod,n(ζ) = Li_n(ζ) because log_p vanishes on roots of unity.

**Acceptance.**

- F = Q(ζ_N), n = 3, p ∤ N: reg_syn([ζ_N]_3) = ±2·Li_3(σζ_N).
- The input of ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements is this theorem with F = Q(ζ_N).

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.10(2), p. 5 — The number-field theorem in weight n.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.12, p. 6 — Cyclotomic elements..

#### Gros's normalisation of the syntomic regulator

`PadicHodgeRegulators:D.2/gros-normalisation` — comparison.

Let K/Q_p be finite unramified with arithmetic Frobenius σ and n≥1. Define the Gros normalization of Besser’s Chern-class regulator by reg^Gros_n=(1−σ/p^n)∘reg_syn. For n≥2 and a cyclotomic class [ζ]_n normalized by the de Jeu map, with ζ≠1 of order prime to p, its value is ε_n(n−1)!·Li_n^(p)(ζ), where Li_n^(p)(ζ)=Li_n(ζ)−p^(−n)Li_n(ζ^p) and ε_n is the sign fixed by that map. This follows from reg_syn([ζ]_n)=ε_n(n−1)!·Li_n(ζ). Agreement with Gros’s own higher-weight symbol convention has not been established. For n=2 and p>3, this is ε_2ℓ_2(ζ)∈O_K, whereas reg_syn([ζ]_2)=ε_2Li_2(ζ)∈p²O_K.

**Hypotheses.** K/Q_p finite unramified, σ its Frobenius; p ∤ ord(ζ). The de Jeu cyclotomic-symbol formula requires n≥2; the stated weight-two integral lattice comparison uses p>3.

**Suggested declaration.** `gros_normalisation`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`, `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison`.

**Proof or construction.**

1. BdJ Remark 1.13 records reg^Gros = (1 − Frob/p^n) reg.
2. Galois equivariance gives σ(Li_n(ζ)) = Li_n(ζ^p), so (1 − σ/p^n)Li_n(ζ) = Li^{(p)}_n(ζ), which is ℓ_n(ζ) by ColemanIntegration:L2/values-at-tame-roots-of-unity (a).

**Acceptance.**

- For K = Q_5 and ζ = ω(2): reg^Gros([ζ]_2) ≡ ∓1 mod 5 is a unit while reg_syn([ζ]_2) ∈ 25Z_5.
- On the same de Jeu symbols the factor ε_n(n−1)! is carried through the operator 1−σ/p^n. A missing factorial in a differently defined symbol formula does not establish a source error; E103 remains rejected. In weight two the factorial is 1.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6 — Gros's value at roots of unity.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6 — The normalisation change..

#### Log-syntomic complexes S_n(r)

`PadicHodgeRegulators:D.2/log-syntomic-complex` — comparison.

For an fs log-smooth X/O_K^× (mixed characteristic, perfect residue field), r≥0 and m≥1, distinguish U_m(r)=Fib(p^r−φ:J_m^[r]→O_cr,m) from D_m(r)=Fib(1−φ_r:J_m^<r>→O_cr,m). Here J_m^<r> is obtained by lifting to level m+s, s≥r, imposing φ(x)∈p^r O_cr,m+s, then reducing modulo p^m; φ_r is the resulting divided Frobenius. For 0≤r≤p−1 the two domain ideals agree, but the two differentials and complexes still differ. There are directed maps ω_r:U_m(r)→D_m(r), with legs (p^r,id), and τ_r:D_m(r)→U_m(r), with legs (id,p^r). Both composites are p^r; their cohomological kernels/cokernels are p^r-torsion. ω preserves products; τ generally does not. Étale sheafification, derived global sections and derived m-limits are imported. CN S_m(r) denotes U_m(r), whereas EN S_m(r) denotes D_m(r) and EN S′_m(r) denotes U_m(r). After rationalization ω and τ/p^r are inverse comparisons; integral equality is not asserted.

**Hypotheses.** X fs, log-smooth over O_K^×, of Cartier type where comparisons with Hyodo–Kato cohomology are used; O_K need not be unramified. r≥0 and m≥1. Imported contract CohomologyComparisonsPartII:CS.0/classical-divided-and-undivided-syntomic is proposed, not an existing declaration. The source-supported specification below fixes the request; implementation remains external.

**Suggested declaration.** `logSyntomicComplex`.

**Direct prerequisites.** `CrystallineCohomology:CR.5`, `CrystallineCohomology:CR.3`, `CrystallineCohomology:CR.0/pd-filtration`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `CohomologyComparisons:CP.4`.

**External contract.** `CohomologyComparisonsPartII:CS.0/classical-divided-and-undivided-syntomic` (requested). The anchor supplies the proper rational comparison only; this early integral/open contract is not present in its packet. No new generic syntomic carrier is owned here.

**Proof or construction.**

1. Import the absolute log-crystalline PD ideal and Frobenius once from CR.5/CR.6 and the proposed CS.0 producer. The Frobenius-divisible ideal is defined using a higher modulus so division by p^r is well defined after reduction. EN §2.1, pp. 4–5 verifies independence of the lift level.
2. The chain-map equations follow from (1−φ_r)p^r=p^r−φ. Compose the displayed legs to obtain multiplication by p^r. This gives a bounded comparison, not an integral quasi-isomorphism. EN §2.1.2, pp. 5–6 distinguishes product compatibility for ω from its failure for τ.
3. For completion/base change use the derived crystalline reduction contract, not an underived inverse limit. The four D.2 nodes only name the imported interfaces; their CS producer is part of the restructuring request.

**Acceptance.**

- For X=Spf O_K with its log structure and r≥2, the rationalized undivided H¹ is K and H⁰ is zero by CN Corollary 3.16, p. 37. No identification of a bounded integral lattice with O_K is inferred from Proposition 3.19’s asserted O_K^(r) lattice.
- At r=1 the rational period comparison and continuous Kummer realization give H¹_syn ≅ (O_K^×)^∧_p⊗Q_p ⊕ Q_p ≅ K⊕Q_p, with the extra line recording valuation.

**API.**

- `logSyntomicComplex` (data): logSyntomicComplex X r m is the imported undivided complex U_m(r), not the divided D_m(r).
- `logSyntomicSheaf` (data): logSyntomicSheaf X r m is the étale undivided sheaf complex U_m(r); its derived global sections give logSyntomicComplex.
- `logSyntomicComplex_reduction` (relation): logSyntomicComplex X r n ≃ logSyntomicCompleted X r ⊗^L Z/p^n.
- `logSyntomicComplex_rational` (equivalence): logSyntomicCompleted X r ⊗ Q ≃ Cone(1 − φ_r)[−1] on rational log-crystalline cohomology.
- `logSyntomicComplex_map` (functoriality): Morphisms of fs log-smooth O_K^×-schemes induce maps, with map_id and map_comp; base change along O_K → O_{K'}.
- `logSyntomicComplex_product` (structure): Cup products S_n(r) ⊗ S_n(s) → S_n(r + s).
- `logSyntomicDividedComplex` (data): The imported D_m(r) with the Frobenius-divisible ideal, distinct from U_m(r).
- `logSyntomicToDivided` (relation): ω_r:U_m(r)→D_m(r) has legs (p^r,id); τ_r has legs (id,p^r), and both composites equal p^r. Only ω is asserted multiplicative.

**Unit tests.**

- `logSyntomic_point_weight_two` (computation): For X = Spec O_K (log structure of the closed point), r = 2: H^1(logSyntomicCompleted X 2) is p^{N}-isomorphic to O_K and H^2 to 0.
- `logSyntomic_weight_zero` (degenerate): For r = 0, J^{[0]} = O and S_n(0) is the fibre of 1 − φ on A_{cr,n}; on X = Spec O_K its H^0 is Z/p^n.
- `logSyntomic_rigid_compat` (compatibility): For X smooth over O_K with trivial horizontal log structure and K unramified, the rational complex agrees with D.2/rigid-syntomic-cohomology (both compute the fibre of 1 − φ_r against the Hodge filtration).
- `logSyntomic_not_naive_twist` (non-example): At r=p−1 the chosen Euclidean decomposition gives a(r)=1 and Z_p(r)′=p^{-1}Z_p(r), whereas at r=p−2 it gives a(r)=0 and the ordinary twist. Replacing all modified lattices by the ordinary lattice loses this normalization.
- `logSyntomic_division_is_not_iso` (non-example): At m=1 and r≥1, p^r is zero. The identity ωτ=p^r supplies no inverse; for zero Frobenius and identical Z/p domains, Fib(0) and Fib(id) already have different cohomology. This algebraic test detects invalid rescaling.

**Used by.** Colmez–Nizioł, Theorem 1.1: the source of the period map whose kernel and cokernel are bounded; RT-AREA-iwasawa-2/3: Shared complexes and maps owned by the proposed early CohomologyComparisons Part II prefix; D.2 and semistable D.5 consume them.; PadicHodgeRegulators:D.5/semistable-input-boundary: the additional input for bad or semistable reduction; Nekovář–Nizioł, Theorem A: rational log-syntomic cohomology of varieties over K via h-sheafification.

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), §5.1.1, pp. 52–53 — The definition.; [NN2016](https://arxiv.org/abs/1309.7620v5), Introduction, (1), p. 2 — The rational form.; [EN2016](https://arxiv.org/pdf/1603.01705v2), §2.1 and §2.1.2, pp. 4–6 — Both integral complexes, the directed ω/τ maps, and their distinct product behavior..

#### The Fontaine–Messing–Kato period morphism

`PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map` — comparison.

Use the imported divided complex D_m(r). Its integral Fontaine–Messing period map α_div:D_m(r)→i*Rj*(Z/p^m(r)′) is a directed morphism. For 0≤r≤p−2 it lands in the ordinary twist. In all weights EN uses Z_p(r)′=(p^a a!)^−1 Z_p(r), r=(p−1)a+b, 0≤b<p−1. On the syntomic–étale site the map goes from D_m(r) to i_se* j_se* j′*G(Z/p^m(r)′), with G the Godement resolution. Exactness of the special-fibre pushforward and the topos comparison induce the stated étale map after derived pushforward. Define α_und=α_div∘ω_r on U_m(r); this is multiplicative and reduction-compatible. This construction inverts no p^r-exact arrow. CN uses p^−a Z_p(r); the lattices coincide when a! is a p-unit, in particular for all weights used by D.2/D.3 here. Any all-weight identification with CN requires its explicit factorial normalization.

**Hypotheses.** X fs log-smooth over O_K^×; r ≥ 0; the normalisation of Z_p(r)' follows Colmez–Nizioł (Nekovář–Nizioł use (p^a a!)^{−1}Z_p(r), which agrees for r < p(p − 1)). Imported contract CohomologyComparisonsPartII:CS.1/integral-fontaine-messing-period is proposed, not an existing declaration. The source-supported specification below fixes the request; implementation remains external.

**Suggested declaration.** `fmkPeriodMap`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/log-syntomic-complex`, `AInfCohomology:AI.4`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence`, `CrystallineCohomology:CR.2`, `PadicHodgeRegulators:L0/fundamental-exact-sequences`, `CohomologyComparisons:CP.4`.

**External contract.** `CohomologyComparisonsPartII:CS.1/integral-fontaine-messing-period` (requested). The anchor supplies the proper rational comparison only; this early integral/open contract is not present in its packet. No new generic syntomic carrier is owned here.

**Proof or construction.**

1. Import the syntomic–étale site and the canonical directed Fontaine–Messing map described in EN §2.2, p. 7. Apply the derived direct image and its special-fibre/base-change identifications to obtain α_div. The underlying integral construction remains the CS.1 supplier obligation, not a new construction by D.2.
2. Compose with ω_r to define α_und. EN §2.2.1, pp. 7–8 supplies product compatibility. The p^r-bounded fundamental sequence does not justify inverting its integral arrow.
3. Track EN’s factorial-modified twist and CN’s twist separately. For r=2, p≥5, both have a=0; no correction factor is hidden in the local regulator.

**Acceptance.**

- Degree one: α_div(c_div(u))=κ_m(u), while α_und(c_und(u))=p·κ_m(u) (EN §2.1.2, §2.2.1, pp. 6–8).
- For general r the integral fundamental sequence is p^r-exact; neither an actual quasi-isomorphism nor the impossibility of any map with an ordinary twist follows from that statement.

**API.**

- `fmkPeriodMap` (data): fmkPeriodMap X r m := α_div∘ω_r : U_m(r)→i*Rj*(Z/p^m(r)′); the divided map is a separate imported interface.
- `fmkPeriodMap_local` (characterisation): The divided map comes from the canonical syntomic–étale-site map to a Godement resolution and derived pushforward. The undivided map is its composition with ω_r; no bounded quasi-isomorphism is inverted.
- `fmkPeriodMap_mul` (structure): fmkPeriodMap is compatible with cup products S_n(r) ⊗ S_n(s) → S_n(r + s).
- `fmkPeriodMap_reduction` (relation): Compatible with the reduction maps n → n − 1 and with the completed versions.
- `fmkPeriodMap_degree_one` (example): On the divided weight-one unit class α_div equals the Kummer map; on the undivided unit class α_und equals p times Kummer, because ω sends that class to p times the divided one.
- `fmkDividedPeriodMap` (data): α_div:D_m(r)→i*Rj*(Z/p^m(r)′), with EN’s (p^a a!)^−1 twist.

**Unit tests.**

- `fmk_kummer` (computation): For a unit u, the divided class maps to κ_m(u); the undivided class maps to p·κ_m(u). At m=1 the latter can vanish despite κ_m(u)≠0. Exactness belongs to the divided map.
- `fmk_weight_zero` (degenerate): For r = 0, α^FM_{0,n} is the identification of S_n(0) with i^*Rj_*Z/p^n in degree 0 (both are Z/p^n on a connected X).
- `fmk_twist_normalisation` (compatibility): For r < p − 1, a(r) = 0 and Z_p(r)' = Z_p(r), so the Colmez–Nizioł and Nekovář–Nizioł normalisations coincide.
- `fmk_untwisted_fails` (non-example): At r=p−1, Z_p(r)′=p^{-1}Z_p(r) and its prescribed period generator has p-adic valuation one less than the ordinary generator; an ordinary generator cannot be silently substituted in the same normalized map.

**Used by.** Colmez–Nizioł, Theorem 1.1: the period map whose kernel and cokernel are killed by p^N; PadicHodgeRegulators:D.2/small-twist-comparison: Exact divided comparison for 0≤i≤r≤p−2; bounded undivided comparison separately.; PadicHodgeRegulators:D.2/syntomic-exponential: composed with the syntomic exponential it gives the Bloch–Kato exponential.

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), §1, p. 2 — The period morphism.; [CN2017](https://arxiv.org/abs/1505.06471v4), §1, p. 2 — The twist; see sourceIssues for the range of b(r).; [EN2016](https://arxiv.org/pdf/1603.01705v2), §2.2–§2.2.1, pp. 7–8 — Directed divided-period map, derived pushforward and composition with ω.; [EN2016](https://arxiv.org/pdf/1603.01705v2), §2.1.2 and §2.2.1, pp. 6–8 — The displayed unit cocycles have ω(c_und(u))=p c_div(u); this scaling prevents an exact undivided Kummer test..

#### The divided small-weight comparison and the undivided bounded comparison

`PadicHodgeRegulators:D.2/small-twist-comparison` — comparison.

For fs log-smooth X/O_K^× and 0≤i≤r≤p−2, α_div induces H^i(D_m(r))≅i*R^ij*(Z/p^m(r)); equivalently D_m(r)≃τ_≤r i*Rj*(Z/p^m(r)). This is EN Theorem 2.2 (attributed to Tsuji). It is not an exact theorem about CN’s undivided U_m(r). For a semistable X or a semistable base change, α_und on U_m(r) has p^(Nr+c_p)-killed kernel/cokernel when K has enough roots of unity, and a p^N(K,p,r) bound in general, uniformly in m and X (CN Theorem 5.4). Rationalizing yields the geometric comparison in degrees ≤r. No exact r=p−1 endpoint is used or claimed.

**Hypotheses.** Exact statement: fs log-smooth over O_K^×, 0≤i≤r≤p−2, divided D_m(r). Bounded statement: semistable or semistable base change, 0≤i≤r, undivided U_m(r). Imported contract CohomologyComparisonsPartII:CS.2/divided-small-weight-comparison is proposed, not an existing declaration. The source-supported specification below fixes the request; implementation remains external.

**Suggested declaration.** `divided_small_twist_comparison`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/log-syntomic-complex`, `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex`, `CohomologyComparisons:CP.4`.

**External contract.** `CohomologyComparisonsPartII:CS.2/divided-small-weight-comparison` (requested). The anchor supplies the proper rational comparison only; this early integral/open contract is not present in its packet. No new generic syntomic carrier is owned here.

**Proof or construction.**

1. Import CS.2’s exact divided statement as specified in EN Theorem 2.2, p. 7; do not move it to U_m(r) by treating ω as an isomorphism.
2. The general undivided bound follows from CN Theorem 5.4, p. 54: the chart-level comparison and Fontaine–Messing identification descend to sheaves. Its proof gives N(K,p,r); do not strengthen that to N(e,p,r).
3. Passing to geometric limits and rationalizing kills the bounded torsion. The exact endpoint outside r≤p−2 is not needed by weight two at p≥5.

**Acceptance.**

- At r=1 and p≥3 the divided map computes H¹(K,Z/p^m(1)); the undivided map remains bounded and must not inherit this exact conclusion.
- At r=2 and p≥5 the divided exact comparison uses the ordinary twist, but U_m(2) and D_m(2) are still different integral complexes.

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), §1, (1.3), p. 2 — The classical range, with attribution to Kato, Kurihara and Tsuji.; [CN2017](https://arxiv.org/abs/1505.06471v4), Theorem 1.1, p. 2 — The general bounded comparison (stated with N(K, p, r) in Theorem 5.4; see sourceIssues).; [EN2016](https://arxiv.org/pdf/1603.01705v2), Theorem 2.2, p. 7; §2.1, pp. 4–5 — Exact divided comparison through p−2 and the reason it does not transfer integrally to U..

#### The syntomic exponential and the Bloch–Kato exponential

`PadicHodgeRegulators:D.2/syntomic-exponential` — comparison.

Let X be a quasi-compact formal semistable scheme over O_K and r≥1. Write U for the undivided complex and D for the divided complex of D.2/log-syntomic-complex. Fix the rational comparison ω_Q:U_Q≃D_Q with α_U^FM=α_D^FM∘ω_Q, as in EN §2.2. Let δ_D be the de Rham boundary in the divided rational model, with the Bloch–Kato sign convention of NN Proposition 4.13 and Remark 2.14, and define α^norm_{r,i}:=ω_Q⁻¹∘δ_D:H^{i−1}_dR(X_{K,tr})→H^i(U_Q). It is an isomorphism for i≤r−1 and injective for i=r, by the rational de Rham comparison of CN Corollary 3.16. For X proper semistable and 1≤i≤r−1, the composite α_U^FM∘α^norm_{r,i} is exp_BK of V_{i−1}:=H^{i−1}_et(X_K̄,Q_p(r)), with D_dR(V_{i−1})=H^{i−1}_dR(X_K) and Fil^0=0 in this range. In the explicit rational triple-cone presentation [A→A⊕A/J^{[r]}], ω acts by (p^r,id,p^r); hence the unscaled quotient-coordinate boundary δ_U satisfies ω_Qδ_U=p^rδ_D. In these EN period conventions α^norm=p^(−r)δ_U and α_U^FMδ_U=p^r exp_BK. No inverse to ω is asserted integrally. For X=Spec O_K, r≥2 and i=1 the normalized composite K→H^1(U_Q)→H^1(K,Q_p(r)) is exp_BK.

**Hypotheses.** X quasi-compact formal semistable over O_K; for the Bloch–Kato identification, X proper semistable and 1 ≤ i ≤ r − 1. Imported contract CohomologyComparisonsPartII:CS.3/semistable-syntomic-exponential is proposed, not an existing declaration. The source-supported specification below fixes the request; implementation remains external.

**Suggested declaration.** `syntomic_exponential`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/log-syntomic-complex`, `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`, `PadicHodgeRegulators:D.2/small-twist-comparison`, `PadicHodgeRegulators:L1/bloch-kato-exponential`, `CrystallineCohomology:CR.5`, `CohomologyComparisons:CP.4`.

**External contract.** `CohomologyComparisonsPartII:CS.3/semistable-syntomic-exponential` (requested). The anchor supplies the proper rational comparison only; this early integral/open contract is not present in its packet. No new generic syntomic carrier is owned here.

**Proof or construction.**

1. Colmez–Nizioł Lemmas 3.14 and 3.17 identify crystalline cohomology modulo J^{[r]} with log de Rham cohomology modulo F^r; Proposition 3.12(ii) shows the Hyodo–Kato part is p^N-acyclic in degrees ≤ r − 1 (Corollary 3.16).
2. Composition with α^FM and comparison with the Bloch–Kato exponential: Colmez–Nizioł Corollary 1.4 / 5.11, citing Nekovář–Nizioł Proposition 4.13 (with the sign convention of their Remark 2.14).
3. Transport the divided boundary through ω_Q⁻¹. The defining maps of EN §2.1 act by p^r on the quotient coordinate in the rational triple cone, so the raw boundary differs by p^r. NN Proposition 4.13 identifies the divided rational boundary with exp_BK after the period map. This proves the normalized square and its range, without an integral inverse to ω or an identification of differently scaled cocycle coordinates.

**Acceptance.**

- For X=Spec O_K, r=2 and i=1, α^norm_{2,1}:K→H^1(U_Q) is an isomorphism and α_U^FMα^norm=exp_BK. At p=5 the unscaled triple-cone boundary instead gives 25·exp_BK; multiplying it by 1/25 restores the square.
- For dim X_K ≥ 1 and i = r the cokernel of α^FM ∘ α_{r,r} can be very large; no surjectivity is asserted there.

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), Corollary 3.16, p. 37 — The syntomic exponential.; [CN2017](https://arxiv.org/abs/1505.06471v4), §1, p. 3 — The identification with the Bloch–Kato exponential.. [EN2016](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2, pp. 4–8 — The maps ω, τ and the definition of the undivided period as the divided period composed with ω fix the rational scaling. [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 4.13 and its displayed square, pp. 53–54; Remark 2.14, p. 14 — The rational de Rham boundary has the Bloch–Kato sign and period normalization.

### D.3. The unramified local K₃ theorem

#### Finite unramified étale Q_p-algebras

`PadicHodgeRegulators:D.3/unramified-etale-algebra` — comparison.

A finite unramified étale Q_p-algebra is a Q_p-algebra L isomorphic to a finite product ∏_{i∈I} L_i of finite unramified field extensions L_i/Q_p; equivalently L ≅ W(k)[1/p] for a finite reduced F_p-algebra k = ∏_i F_{q_i} (Witt vectors of a finite product of finite fields), with k ≅ O_L/pO_L. Its ring of integers is O_L = ∏_i O_{L_i} = W(k), the integral closure of Z_p in L; its rank is [L : Q_p] = Σ_i [L_i : Q_p] = dim_{F_p} k; its Frobenius φ_L = ∏_i φ_{L_i} is the Witt-vector Frobenius W(Frob_k)[1/p]. For a number field F and a prime p unramified in F, F ⊗_Q Q_p ≅ ∏_{v|p} F_v is such an algebra, with O_F ⊗ Z_p = ∏_v O_v.

**Hypotheses.** p any prime; I finite (I = ∅ gives the zero algebra). The local-field carrier, unramified classification and Witt identification are imported from LocalFieldsRamification Layer 2; the API below is the required specialized supplier interface. Formal unramifiedness of a characteristic-zero field algebra only detects separability and does not detect arithmetic ramification.

**Suggested declaration.** `IsUnramifiedEtaleAlgebra`.

**Direct prerequisites.** `mathlib:WittVector`, `mathlib:WittVector.frobenius`, `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Proof or construction.**

1. A finite unramified extension of Q_p with residue field F_q is W(F_q)[1/p], and W commutes with finite products.
2. The Witt-vector Frobenius lifts x ↦ x^p, so it is the arithmetic Frobenius of D.1/unramified-frobenius-on-roots on each factor.
3. For p unramified in F, each completion F_v is unramified over Q_p, and the semilocal equivalence of NumberFieldArithmetic layer 5 identifies F ⊗ Q_p with ∏_v F_v.

**Acceptance.**

- K = Q(α), α³ − α² + 1 = 0, p = 5: K ⊗ Q_5 ≅ Q_{25} × Q_5 has rank 3 (GSWZ Example 4.3).
- Q_p(√p) and Q_p(ζ_p) (p odd) are finite étale but not unramified.

**API.**

- `IsUnramifiedEtaleAlgebra` (structure): IsUnramifiedEtaleAlgebra p L : L is a finite product of finite unramified field extensions of ℚ_[p] (data: the factor decomposition up to isomorphism).
- `unramifiedEtaleAlgebra_equiv_witt` (equivalence): L ≃ₐ[ℚ_[p]] Localization.Away (p : WittVector p k) for k := O_L ⧸ p, a finite reduced 𝔽_p-algebra.
- `unramifiedEtaleAlgebra_rank` (characterisation): Module.finrank ℚ_[p] L = Module.finrank (ZMod p) k.
- `unramifiedEtaleAlgebra_frobenius` (data): The Frobenius φ_L : L ≃ₐ[ℚ_[p]] L induced by WittVector.frobenius on W(k); it fixes exactly ℚ_[p]^{#π_0} componentwise.
- `unramifiedEtaleAlgebra_prod` (instance): Finite products of unramified étale algebras are unramified étale.
- `unramifiedEtaleAlgebra_tensor_padic` (example): For a number field F and p unramified in F, F ⊗[ℚ] ℚ_[p] is unramified étale.

**Unit tests.**

- `unramified_rank_cubic` (computation): For F = Q(α), α³ − α² + 1 = 0 and p = 5, F ⊗ Q_5 is unramified étale of rank 3 with factors of residue degrees 2 and 1.
- `unramified_zero` (degenerate): The zero algebra (empty product, k = 0) is unramified étale of rank 0.
- `unramified_witt_compat` (compatibility): For k = F_q, the algebra W(F_q)[1/p] is the unramified extension Q_q of degree log_p q, and its Frobenius is Mathlib's WittVector.frobenius after inverting p.
- `unramified_not_qp_zeta_p` (non-example): For p odd, Q_p(ζ_p) is finite étale but not unramified: its residue field is F_p while its degree is p − 1, so it is not of the form W(k)[1/p].

**Used by.** GSWZ §3.1, paragraph before Theorem 9: K_p ≅ ∏ Q_{p^{s_i}} and K_n(K_p) ≅ ∏ K_n(Q_{p^{s_i}}) for p unramified; PadicHodgeRegulators:D.3/completed-k3-unramified: the class of algebras whose completed K_3 the layer computes; HabiroNahmSeries:HB.9/followup-etale-module-contract: full quadratic étale algebras B_p = R_p[T]/(δT² − 1), including the split case, are of this form.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph before Theorem 9, p. 39 — The class of algebras; the K-theory product comparison is D.3/completed-k3-unramified..

#### Completed K₃ of a finite unramified étale algebra

`PadicHodgeRegulators:D.3/completed-k3-unramified` — construction.

For a finite unramified étale Q_p-algebra L = ∏_i L_i put K_3(L; Z_p) := π_3 K(L; Z_p), the p-completed K-theory of KTheoryFiniteLocalFields:L.1/completed-k-theory. The projections induce K_3(L; Z_p) ≅ ∏_i K_3(L_i; Z_p) (finite products commute with K-theory and with derived p-completion), and K_3(O_L; Z_p) → K_3(L; Z_p) is an isomorphism. The étale Chern classes give c_L : K_3(L; Z_p) ≅ H^1(L, Z_p(2)) := ∏_i H^1(L_i, Z_p(2)). For p > 3, K_3(L; Z_p) is a free Z_p-module of rank [L : Q_p]; for p ∈ {2, 3} it has the nonzero torsion Z/w_2^{(p)}(L_i) on each factor.

**Hypotheses.** L finite unramified étale over Q_p (D.3/unramified-etale-algebra); freeness needs p > 3.

**Suggested declaration.** `completedK3`.

**Direct prerequisites.** `PadicHodgeRegulators:D.3/unramified-etale-algebra`, `KTheoryFiniteLocalFields:L.1/completed-k-theory`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `KTheoryFiniteLocalFields:L.6/completed-k3-of-unramified-fields`, `KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1`, `KTheoryFiniteLocalFields:L.6/ring-of-integers-versus-field`.

**Proof or construction.**

1. Product comparison: K_n(R × S) ≅ K_n(R) × K_n(S) (GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring (ii)); mod p^ν coefficients and the homotopy limit defining K(−; Z_p) commute with finite products.
2. On each factor, KTheoryFiniteLocalFields:L.6/completed-k3-of-unramified-fields gives K_3(O_{L_i}; Z_p) ≅ K_3(L_i; Z_p) ≅ H^1(L_i, Z_p(2)) ≅ Z_p^{[L_i:Q_p]} ⊕ Z/w_2^{(p)}(L_i), with w_2^{(p)} = 1 for p ≥ 5.
3. The Chern isomorphism is natural, so it is compatible with the product decomposition.

**Acceptance.**

- For p = 5 and L = Q_{25} × Q_5, K_3(L; Z_5) ≅ Z_5³.
- For p = 3 and L = Q_3, K_3(Q_3; Z_3) ≅ Z_3 ⊕ Z/3: the freeness clause fails at p = 3.

**API.**

- `completedK3` (data): completedK3 p L := π_3 K(L; ℤ_p), a ℤ_[p]-module.
- `completedK3_prodEquiv` (equivalence): completedK3 p (∏ i, L i) ≃ₗ[ℤ_[p]] ∏ i, completedK3 p (L i).
- `completedK3_integers_equiv` (equivalence): completedK3 p O_L ≃ₗ[ℤ_[p]] completedK3 p L, induced by O_L → L.
- `completedK3_chernEquiv` (equivalence): completedK3 p L ≃ₗ[ℤ_[p]] H^1(L, ℤ_p(2)), componentwise étale Chern class c_{2,1}.
- `completedK3_free` (characterisation): For p > 3, Module.Free ℤ_[p] (completedK3 p L) and Module.finrank = [L : ℚ_[p]].
- `completedK3_map` (functoriality): A ℚ_[p]-algebra map f : L → L' induces completedK3 p L → completedK3 p L', with map_id and map_comp; the Frobenius φ_L acts by functoriality.
- `completedK3_transfer` (functoriality): For L → L' finite free, a transfer completedK3 p L' → completedK3 p L, corresponding to corestriction under the Chern isomorphisms.
- `completedK3_extensionality` (extensionality): The completed module is imported from p-completed K-theory. Equality of induced maps is pointwise, and product maps are determined by all factor projections. Inherit Module and map_zero/map_add/map_smul rather than define a new completion carrier.

**Unit tests.**

- `completedK3_rank_cubic` (computation): For p = 5 and L = Q_{25} × Q_5, completedK3 5 L is free of rank 3.
- `completedK3_zero` (degenerate): completedK3 p 0 = 0 for the zero algebra.
- `completedK3_chern_compat` (compatibility): For L = Q_p the Chern isomorphism agrees with KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1 at i = 2.
- `completedK3_three_torsion` (non-example): For p = 3, completedK3 3 Q_3 has torsion Z/3 (w_2^{(3)}(Q_3) = 3), so it is not free and no injective map to a torsion-free lattice exists.

**Used by.** GSWZ Theorem 9, (183): the source of the isomorphism D_p : K_3(K_p; Z_p) → p²O_{K_p}; PadicHodgeRegulators:D.4/global-p-adic-regulator: the target of the localisation map λ_{F,3} from global K_3; HabiroNumberFields:HB.7/pochhammer-sections: ξ̂ ∈ K_3(K_p) ⊗ Z_p is presented by roots of unity in this group.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Theorem 9, p. 39 — The structure of the group; r = [K : Q] here..

**Planet.** Completed K₃ of an unramified p-adic algebra.

#### Completed K₃ of an unramified field is the completed Bloch group

`PadicHodgeRegulators:D.3/completed-k3-bloch-description` — theorem.

Let L be a finite unramified extension of Q_p with p ≥ 3. For every ν ≥ 1 the natural maps K_3(L)/p^ν → K_3^ind(L)/p^ν → B(L)/p^ν are isomorphisms (B(L) Suslin's Bloch group), and the completion map identifies K_3(L; Z_p) with lim_ν K_3(L)/p^ν ≅ lim_ν B(L)/p^ν =: B(L)^∧_p. In particular the image of B(L) — more precisely of K_3(L), which surjects onto every B(L)/p^ν — is dense in K_3(L; Z_p), and the kernel of K_3(L) → K_3(L; Z_p) is ⋂_ν p^ν K_3(L). For a finite product L = ∏ L_i the statements hold factorwise.

**Hypotheses.** L/Q_p finite unramified and p odd, so that μ(L) has order prime to p and ζ_p ∉ L.

**Suggested declaration.** `completedK3_bloch_description`.

**Direct prerequisites.** `KTheoryFiniteLocalFields:L.6/completion-exact-sequence`, `KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields`, `KTheoryFiniteLocalFields:L.3/moore-theorem`, `KTheoryFiniteLocalFields:L.6/finite-coefficient-lichtenbaum-quillen`, `K3BlochGroups:V.6/comparison-finite-coefficients`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.2/k3-indecomposable`.

**Proof or construction.**

1. K_3^M(L) is uniquely divisible (KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields), so K_3(L)/p^ν = K_3^ind(L)/p^ν.
2. Suslin's sequence reduced mod p^ν (K3BlochGroups:V.6/comparison-finite-coefficients): K_3^ind(L)/p^ν → B(L)/p^ν is onto with kernel the image of μ̃(L)/p^ν, which vanishes because μ(L) has order prime to p and the enhancement is 2-primary.
3. The finite-coefficient groups are finite (L.6/finite-coefficient-lichtenbaum-quillen), so L.6/completion-exact-sequence gives 0 → lim_ν K_3(L)/p^ν → K_3(L; Z_p) → T_p K_2(L) → 0; Moore's theorem K_2(L) ≅ μ(L) ⊕ (divisible) with the divisible part uniquely divisible gives T_p K_2(L) = 0.
4. This also supplies the input K_3^M(L)/p^ν = 0 that K3BlochGroups:V.6/regulator-agreement-padic records as missing.

**Acceptance.**

- For L = Q_5: K_3(Q_5; Z_5) ≅ Z_5 ≅ lim_ν B(Q_5)/5^ν.
- For ramified L=Q_p(ζ_p), retain the term im(μ̃(L)/p→K_3^ind(L)/p) in the kernel of K_3^ind(L)/p→B(L)/p. The argument that this term vanishes for unramified L no longer applies. No nonzero injection of μ̃(L)/p, or ramified isomorphism, is inferred from tensoring Suslin’s exact sequence.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Theorem 9, p. 39 — The comparison of completed K_3 with the Bloch group used in the proof; the containment it claims is D.3/unramified-regulator-theorem (sourceIssues: GSWZ E39)..

#### Kontsevich's finite polylogarithm

`PadicHodgeRegulators:D.3/finite-polylogarithm` — definition.

For a prime p and n ∈ Z, the finite polylogarithm is the polynomial li_{n,p}(x) := Σ_{k=1}^{p−1} x^k / k^n ∈ F_p[x] (equivalently its lift with coefficients in Z_(p)). It has degree p − 1 (for p > 2), constant term 0, and satisfies x·li'_{n,p}(x) = li_{n−1,p}(x); li_{n,p}(1) = Σ_{k=1}^{p−1} k^{−n} ≡ 0 mod p exactly when (p − 1) ∤ n. In particular for p > 3: li_{2,p}(1) ≡ 0 and li'_{2,p}(1) = li_{1,p}(1) ≡ 0 mod p, so (x − 1)² divides li_{2,p}(x) in F_p[x].

**Hypotheses.** p prime; n ∈ Z (negative n allowed, k^{−n} = k^{|n|}).

**Suggested declaration.** `finitePolylog`.

**Direct prerequisites.** `mathlib:Polynomial`, `mathlib:ZMod`.

**Proof or construction.**

1. The power sums Σ_{k=1}^{p−1} k^m vanish mod p unless (p − 1) | m (sum over the cyclic group F_p^×).
2. x·d/dx(x^k/k^n) = x^k/k^{n−1} gives the differential relation; for n = 2 and p > 3, (p − 1) ∤ 2 and (p − 1) ∤ 1.

**Acceptance.**

- li_{2,5}(2) = 2 + 1 + 2 + 1 = 1 in F_5.
- li_{2,3}(1) = 1 + 1/4 = 2 ≠ 0 in F_3: the double-root property fails at p = 3.

**API.**

- `finitePolylog` (data): finitePolylog p n : Polynomial (ZMod p) := Σ_{k=1}^{p−1} C ((k : ZMod p)^n)⁻¹ * X^k.
- `finitePolylog_eval_zero` (simp): (finitePolylog p n).eval 0 = 0.
- `finitePolylog_derivative` (relation): X * derivative (finitePolylog p n) = finitePolylog p (n − 1).
- `finitePolylog_eval_one` (characterisation): (finitePolylog p n).eval 1 = 0 ↔ ¬ (p − 1 ∣ n).
- `finitePolylog_two_rootMultiplicity_one` (relation): For 5 ≤ p, (X − 1)² ∣ finitePolylog p 2.
- `finitePolylog_natDegree` (characterisation): For 2 < p, (finitePolylog p n).natDegree = p − 1.
- `finitePolylog_extensionality` (extensionality): Equality of finite polylogarithm polynomials is determined coefficientwise by Polynomial.ext; coeff k = (k^n)^{-1} for 1≤k<p and 0 otherwise.

**Unit tests.**

- `finitePolylog_five_two` (computation): (finitePolylog 5 2).eval 2 = 1 in ZMod 5.
- `finitePolylog_one_index` (degenerate): finitePolylog p 0 = Σ_{k=1}^{p−1} X^k, the truncated geometric series.
- `finitePolylog_compat_coleman` (compatibility): For ζ ∈ μ(Q_{p^s}) ∖ {1} of order prime to p, the reduction of p^{−2}Li_2(ζ^p) is −li_{2,p}(ζ̄)/(1 − ζ̄)^p, the form of ColemanIntegration:L2/values-at-tame-roots-of-unity (c).
- `finitePolylog_three_non_example` (non-example): (finitePolylog 3 2).eval 1 = 2 ≠ 0 in ZMod 3, so the factorisation li_{2,p} = (x − 1)² g_p fails at p = 3.
- `finitePolylog_five_two_three` (computation): (finitePolylog 5 2).eval 3 = 3 in ZMod 5; hence f_5(3)=3/(3−1)^5=4.
- `finitePolylog_five_two_minus_one` (computation): (finitePolylog 5 2).eval 4 = 0 in ZMod 5, so f_5(−1)=0.

**Used by.** GSWZ §3.1, (177)–(180): the reduction of p^{−2}D_p at roots of unity is li_{2,p}(ζ)/(ζ − 1)^p, and its fibres are bounded by p − 2; PadicHodgeRegulators:D.3/residue-spanning: the counting argument for the spanning of the residue space; ColemanIntegration:L2/values-at-tame-roots-of-unity: part (c) expresses p^{−k}Li_k(ζ) modulo p through li_{k,p}.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (177), p. 38 — The coefficient normalization of the finite polylogarithm, expressed here as a polynomial over F_p.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Proposition 3.3, (180), p. 38 — The double root at 1, valid for p > 3..

#### Reduction of the p-adic dilogarithm at roots of unity

`PadicHodgeRegulators:D.3/finite-polylogarithm-reduction` — lemma.

Let p be odd, L an unramified extension of Q_p and ζ ∈ μ(L) ∖ {1}. Then D_L(ζ) = Li_2(ζ) ∈ p²O_L and p^{−2}D_L(ζ^p) ≡ li_{2,p}(ζ̄)/(ζ̄ − 1)^p mod p, where ζ̄ ∈ k_L^× is the residue of ζ. Equivalently, with σ(ζ) the root of unity with σ(ζ)^p = ζ, p^{−2}D_L(ζ) ≡ li_{2,p}(σ(ζ)‾)/(σ(ζ)‾ − 1)^p. Componentwise the same holds for a finite unramified product L and ζ ∈ μ(L) with all components ≠ 1.

**Hypotheses.** p odd, so every ζ ∈ μ(L) has order prime to p (L unramified).

**Suggested declaration.** `finite_polylogarithm_reduction`.

**Direct prerequisites.** `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`, `PadicHodgeRegulators:D.3/finite-polylogarithm`.

**Proof or construction.**

1. log_p(ζ) = 0, so D_L(ζ) = Li_2(ζ); ColemanIntegration:L2/values-at-tame-roots-of-unity (b) gives Li_2(ζ) ∈ p²Z_p[ζ] ⊆ p²O_L.
2. Part (c) of the same node: p^{−2}Li_2(ζ^p) ≡ −li_{2,p}(ζ̄)/(1 − ζ̄)^p mod p, and −(1 − ζ̄)^p = (ζ̄ − 1)^p for p odd.

**Acceptance.**

- p = 5, ζ = ω(2) ∈ Q_5 (so ζ^5 = ζ): 25^{−1}D(ζ) ≡ li_{2,5}(2) = 1 mod 5, matching the Q_5-component of D_5(ζ_24) in GSWZ (273).
- For p = 2 and ζ = −1, ζ^p = 1 and D(1) is undefined: the printed statement of GSWZ Proposition 3.2 needs ζ^p ≠ 1.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proposition 3.2, (178), p. 38 — The statement, for odd p; the extraction records the p = 2 caveat as GSWZ E80..

#### p²-integrality of the dilogarithm on special units

`PadicHodgeRegulators:D.3/dilogarithm-integrality` — lemma.

Let p > 3 and let L be a finite unramified étale Q_p-algebra. If z ∈ O_L satisfies z ∈ O_L^× and 1 − z ∈ O_L^× in every factor (z is a special unit), then D_L(z) ∈ p²O_L. This is GSWZ Lemma 3.1 for R^∧_p = O_{K_p}.

**Hypotheses.** p > 3; L unramified (each factor); z and 1 − z units in every factor.

**Suggested declaration.** `dilogarithm_integrality`.

**Direct prerequisites.** `PadicHodgeRegulators:D.3/finite-polylogarithm-reduction`, `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`, `ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity`, `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `ColemanIntegration:L0/log-one-add-convergence`.

**Proof or construction.**

1. Write z = ζ·(1 + x) with ζ = ω(z̄) and x ∈ pO_L (D.1/teichmuller-unit-decomposition); z̄ ≠ 1 because 1 − z is a unit, so ζ ≠ 1.
2. Expand D(ζ(1 + x)) in x around ζ (ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity): the constant term Li_2(ζ) lies in p²O; the first-order coefficients involve Li_1(ζ) ∈ pO and log(1 + x) ∈ pO; the higher Taylor coefficients have denominators k with v_p(x^k/k) ≥ k − v_p(k) ≥ 2 for k ≥ 2, using p > 3 and e = 1.
3. Each factor of L is treated separately.

**Acceptance.**

- z = ω(2) ∈ Z_5 (a special unit): D(z) ∈ 25Z_5.
- z = p is not a unit and D^0(p) = Li_2(p) ≡ p mod p², so the unit hypothesis cannot be dropped.
- z = 1 + p has 1 − z = −p not a unit; the lemma does not apply there.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Lemma 3.1 and proof, (175), p. 38 — The statement and the root-of-unity input; the Taylor step is expanded in proofSteps..

#### Dilogarithms of roots of unity span the residue space

`PadicHodgeRegulators:D.3/residue-spanning` — theorem.

Let p > 3. (a) For every s ≥ 1, Span_{Z_p}{p^{−2}D(ζ) : ζ ∈ μ(Q_{p^s}) ∖ {1}} = Z_{p^s}. (b) For every s ≥ 1 also Span_{Z_p}{p^{−2}(D(ζ) − D(ζ')) : ζ, ζ' ∈ μ(Q_{p^s}) ∖ {1}} = Z_{p^s}. (c) Consequently, for a finite unramified product L = ∏_i Q_{p^{s_i}}, Span_{Z_p}{p^{−2}D_L(ζ) : ζ ∈ μ(L) with every component ≠ 1} = O_L. Statement (a) is GSWZ Proposition 3.3 with ζ = 1 excluded; (b) and (c) are needed for products once components equal to 1 are excluded.

**Hypotheses.** p > 3 (the argument uses li_{2,p}(1) ≡ li'_{2,p}(1) ≡ 0 mod p). s ≥ 1; L a finite product of unramified extensions of Q_p.

**Suggested declaration.** `residueSpanning_mod_p`.

**Direct prerequisites.** `PadicHodgeRegulators:D.3/finite-polylogarithm`, `PadicHodgeRegulators:D.3/finite-polylogarithm-reduction`, `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`, `mathlib:Submodule.span`, `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`, `ColemanIntegration:L2/dilogarithm-identities`, `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`.

**Proof or construction.**

1. The finite set of admissible tame roots has finitely generated Z_p-span; use the pinned Nakayama theorem with the finite free target O_L. Work modulo p and put f(x)=li_{2,p}(x)/(x−1)^p on F_{p^s}^×\{1}; zero is not a root of unity. Factor li_{2,p}=(x−1)^2g with deg g≤p−3. The equation g(x)−c(x−1)^{p−2}=0 is nonzero (for c=0, g is nonzero), so each fibre has at most p−2 points.
2. For s>1, #image(f)≥(p^s−2)/(p−2)>p^{s−1}. For s=1, f(−1)=0 by the inversion identity. At least one other admissible value is nonzero: otherwise li_{2,p} would have the p−2 admissible points and zero as roots and 1 as a double root, impossible for degree p−1. Thus #image(f)≥2>1 in the base case. Every translate image(f)−c has the same cardinality, so both values and differences span over F_p.
3. The map ζ↦ζ^p permutes the nontrivial tame roots and D(ζ^p)=φD(ζ). The finite-polylogarithm reduction identifies p^{-2}D(ζ^p) with f(ζ̄). Nakayama now gives the integral spans (a),(b). The base-case inversion may equivalently be read from D(−1)=0 and the reduction formula.
4. (c) Fix all components but one and subtract two admissible tuples. Part (b) produces O_{L_i} in that component and zero elsewhere for the scaled values p^{-2}D_L. Taking all factors gives O_L. No tuple with a component equal to 1 is used.

**Acceptance.**

- p=5,s=1: μ_4\{1} has three elements. The residue values f(2)=1,f(3)=4,f(4)=0 generate F_5, and their differences also generate; f(4)=f(−1)=0 handles the s=1 count.
- p = 5 and L = Q_{25} × Q_5: the three values p^{−2}D_L(ζ_24), p^{−2}D_L(ζ_24²), p^{−2}D_L(ζ_24⁶) of GSWZ (273) (second line relabelled, GSWZ E56) form a Z_5-basis of O_L, as (274) presupposes.
- At p = 3 the factorisation of li_{2,3} fails (li_{2,3}(1) = 2), so the fibre bound and the proof do not apply.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proposition 3.3 and proof, (179)–(182), pp. 38–39 — Statement (a); ζ = 1 is excluded (GSWZ E38) and p > 3 is used in the proof.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Proposition 3.3, (182), p. 39 — The source count includes x=0; for nonzero admissible roots use the repaired q−2 count for s>1 and the separate s=1 argument in proofSteps..

#### Root-of-unity classes in completed K₃

`PadicHodgeRegulators:D.3/root-of-unity-classes` — construction.

Let p be odd, L a finite unramified étale Q_p-algebra and ζ ∈ μ(L) a root of unity of order m (prime to p) all of whose components are ≠ 1. Define [ζ]_L ∈ K_3(L; Z_p) as the image, under B(L) ⊗ Z_p → lim_ν B(L)/p^ν ≅ K_3(L; Z_p) (D.3/completed-k3-bloch-description, factorwise), of the Z_p-coefficient class ⟦ζ⟧ = m^{−1} ⊗ m[ζ] of K3BlochGroups:V.6/root-of-unity-class (iii) (componentwise; m[ζ] ∈ B(L) by K3BlochGroups:V.6/integral-root-multiple). This is the class GSWZ denote [ζ]: when ζ ∧ (1 − ζ) = 0 in Suslin's antisymmetric square (always the case after ⊗ Z_p, p odd), [ζ]_L is the image of [ζ] ∈ B(L), and GSWZ's ord(ζ)·D_p(ζ) is the regulator of the integral multiple m[ζ].

**Hypotheses.** p odd; L unramified (so ord(ζ) is prime to p); every component of ζ differs from 1 (GSWZ E38).

**Suggested declaration.** `rootClassK3`.

**Direct prerequisites.** `K3BlochGroups:V.6/root-of-unity-class`, `K3BlochGroups:V.6/integral-root-multiple`, `K3BlochGroups:V.6/root-of-unity-symbol`, `K3BlochGroups:V.3/angle-bracket-two-torsion`, `PadicHodgeRegulators:D.3/completed-k3-bloch-description`, `PadicHodgeRegulators:D.3/completed-k3-unramified`.

**Proof or construction.**

1. m is a unit in Z_p, so m^{−1} ⊗ m[ζ] is defined in B(L) ⊗ Z_p and is independent of the representative m (K3BlochGroups:V.6/root-of-unity-class).
2. The completion map B(L) ⊗ Z_p → B(L)^∧_p composed with D.3/completed-k3-bloch-description gives the class in K_3(L; Z_p); on a product it is taken factorwise.
3. ζ ∧ (1 − ζ) is 2-torsion in Suslin's antisymmetric square of each factor (the principal-unit part of 1 − ζ is uniquely (q − 1)-divisible), so after ⊗ Z_p the raw symbol [ζ] already lies in B(L) ⊗ Z_p and agrees with ⟦ζ⟧.

**Acceptance.**

- [−1]_{Q_p} = 0 for p > 3: the integral multiple 2[−1] = ⟨−1⟩ lies in B(Q_p) and is 2-torsion (K3BlochGroups:V.3/angle-bracket-two-torsion), so ⟦−1⟧ = 2^{−1} ⊗ 2[−1] = 0 in B(Q_p) ⊗ Z_p.
- A ζ with a component equal to 1 (for instance ζ_24^4 ∈ Q_{25} × Q_5 at p = 5, whose Q_5 component is 1) is rejected.

**API.**

- `rootClassK3` (data): rootClassK3 L ζ : completedK3 p L, for ζ a root of unity of L with all components ≠ 1.
- `rootClassK3_eq_bloch` (compatibility): rootClassK3 L ζ is the image of K3BlochGroups' rootClassPadic ζ under B(L) ⊗ ℤ_p → completedK3 p L.
- `rootClassK3_prod` (simp): For L = ∏ L_i, rootClassK3 L ζ = (rootClassK3 L_i ζ_i)_i.
- `rootClassK3_map` (functoriality): For a ℚ_p-algebra map f : L → L', completedK3 map sends rootClassK3 L ζ to rootClassK3 L' (f ζ); in particular φ_L(rootClassK3 ζ) = rootClassK3 (ζ^p).
- `rootClassK3_inv` (relation): rootClassK3 L ζ⁻¹ = −rootClassK3 L ζ.
- `rootClassK3_mul_ord` (relation): ord(ζ) • rootClassK3 L ζ is the image of the integral Bloch element m[ζ].
- `rootClassK3_extensionality` (extensionality): In a finite product, two rootClassK3 values are equal iff all factor projections agree; the construction is invariant under equality of admissible root arguments. It is a function of roots, not asserted to be additive in the multiplicative root argument.

**Unit tests.**

- `rootClassK3_neg_one` (computation): For p > 3, rootClassK3 Q_p (−1) = 0.
- `rootClassK3_order_two_product` (degenerate): For L = Q_p × Q_p and ζ = (−1, −1), rootClassK3 L ζ = 0, the product of two zero classes.
- `rootClassK3_bloch_compat` (compatibility): When ζ ∧ (1 − ζ) = 0 in Suslin's antisymmetric square (K3BlochGroups:V.6/root-of-unity-symbol), rootClassK3 L ζ is the image of [ζ] ∈ B(L).
- `rootClassK3_component_one` (non-example): For p = 5, L = Q_{25} × Q_5 and ζ = ζ_24^4 (Q_5 component 1), the class is not defined: the raw symbol [1] is not a Bloch-group generator and D(1) is undefined (GSWZ E38).

**Used by.** GSWZ Theorem 9, (183), and Example 4.3, (275): K_3(K_p; Z_p) is generated by the [ζ]; ξ = c_1[ζ_24] + c_2[ζ_24²] + c_3[ζ_24⁶]; HabiroNumberFields:HB.7/followup-integral-linear-jet: a valid finite presentation ξ̂ = Σ a_ζ[ζ] with a_ζ ∈ Z_p and ζ ≠ 1 of order prime to p; HabiroNumberFields:HB.7/pochhammer-sections: the sections Ψ_{[ζ]} are attached to these classes.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9 and proof, p. 39 — The classes and the integral multiple ord(ζ)·[ζ]; components equal to 1 are excluded (GSWZ E38)..

#### The p-adic regulator on completed K₃

`PadicHodgeRegulators:D.3/local-regulator` — construction.

For a finite étale Q_p-algebra L = ∏ L_i (any p; L_i/Q_p finite) define D_L : K_3(L; Z_p) → L as the composite of the étale Chern isomorphism K_3(L; Z_p) ≅ H^1(L, Z_p(2)) (componentwise, D.2/etale-regulator), the inclusion into H^1(L, Q_p(2)) and the Bloch–Kato logarithm log_BK : H^1(L, Q_p(2)) ≅ D_dR(Q_p(2)) = L·e_2 ≅ L (L1/bloch-kato-logarithm, e_2 = t^{−2} ⊗ ε^{⊗2}), multiplied by the sign ε ∈ {±1} fixed so that D_L([ζ]_L) = +D_L(ζ) = +Li_2(ζ) on root-of-unity classes. By D.2/syntomic-etale-regulator-comparison, D_L = ε·reg_syn (Besser's normalisation) on the image of K_3(O_L), and by D.2/weight-two-dilogarithm-comparison D_L agrees with the dilogarithm D_L of D.1 on Bloch elements presented by special units of O_L. This is GSWZ's D_p of (19) and (183), defined on the completed group.

**Hypotheses.** L finite étale over Q_p; integrality and bijectivity statements are D.3/unramified-regulator-theorem (p > 3, L unramified).

**Suggested declaration.** `localRegulator`.

**Direct prerequisites.** `PadicHodgeRegulators:D.3/completed-k3-unramified`, `PadicHodgeRegulators:D.2/etale-regulator`, `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`, `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.3/root-of-unity-classes`, `PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`.

**Proof or construction.**

1. The Chern isomorphism and log_BK are Z_p-linear and continuous; their composite is defined on the completed group, which repairs the definitional gap recorded as GSWZ E39.
2. For roots of unity of order prime to p, ζ is a special unit, so D.2/weight-two-dilogarithm-comparison gives log_BK(c_{2,1}[ζ]_L) = ±Li_2(ζ); this fixes ε (the sign is the single sign of de Jeu's map).
3. The identification with Besser's syntomic regulator is D.2/syntomic-etale-regulator-comparison at n = 2.

**Acceptance.**

- L = Q_5: D_L([ω(2)]) ≡ 25 mod 125.
- On the zero algebra D_L = 0.
- D_L is not the Gros-normalised map: (1 − σ/p²)∘D_L has image O_L, not p²O_L, for L unramified and p > 3.

**API.**

- `localRegulator` (data): localRegulator L : completedK3 p L →ₗ[ℤ_[p]] L.
- `localRegulator_eq_logBK` (characterisation): localRegulator L = ε • (logBK ∘ chernEquiv) with ε = ±1 the pinned sign.
- `localRegulator_rootClass` (simp): localRegulator L (rootClassK3 L ζ) = etaleDilog L ζ (= (Li_2(ζ_i))_i).
- `localRegulator_specialUnits` (compatibility): On the image of a Bloch element Σ n_i [x_i] with x_i special units of O_L, localRegulator = Σ n_i etaleDilog L x_i.
- `localRegulator_map` (functoriality): For a ℚ_p-algebra map f : L → L', localRegulator L' ∘ completedK3.map f = f ∘ localRegulator L; in particular localRegulator commutes with φ_L.
- `localRegulator_transfer` (functoriality): For L → L' finite free, localRegulator L ∘ transfer = Tr_{L'/L} ∘ localRegulator L'.
- `localRegulator_prod` (simp): On L = ∏ L_i, localRegulator is the product of the factor regulators.
- `localRegulator_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `localRegulator_q5_root` (computation): localRegulator Q_5 (rootClassK3 Q_5 (teichmuller 2)) ≡ 25 mod 125.
- `localRegulator_zero_algebra` (degenerate): localRegulator 0 = 0.
- `localRegulator_syntomic_compat` (compatibility): On the image of K_3(O_L), localRegulator = ε·syntomicRegulator (D.2/syntomic-regulator) with n = 2.
- `localRegulator_not_gros` (non-example): For L = Q_5, the Gros-normalised map (1 − 5^{−2})·localRegulator sends rootClassK3 (teichmuller 2) to a unit, so it is not localRegulator and does not have image 25Z_5.

**Used by.** GSWZ (19), (22) and Theorem 9: the p-adic regulator D_p entering the formal completion of invertible sections and the local K_3 calculation; PadicHodgeRegulators:D.4/global-p-adic-regulator: applied after the localisation map from global K_3; K3BlochGroups:V.6/regulator-agreement-padic: the p-adic regulator compared with the Bloch-group model modulo p^m.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §1.5, (19), p. 9 — The map; here defined on the completed group as the regulator and compared with the dilogarithm where proved.; [HK2011](https://arxiv.org/abs/math/0612611v1), Theorem 1.3.2 and Proposition 2.3.4, pp. 9 and 16 — The identification of Besser's regulator with log_BK of Soulé's regulator..

**Planet.** p-adic regulator on completed K₃.

#### The unramified p > 3 theorem

`PadicHodgeRegulators:D.3/unramified-regulator-theorem` — theorem.

Let p > 3 and let L be a finite unramified étale Q_p-algebra (for instance K_p = K ⊗ Q_p for a number field K in which p is unramified). Then the p-adic regulator is a Z_p-linear isomorphism D_L : K_3(L; Z_p) ≅ p²O_L. The statement is not asserted for p ∈ {2, 3}, for ramified L, or for the uncompleted group K_3(L).

**Hypotheses.** p > 3; L a finite product of finite unramified extensions of Q_p.

**Suggested declaration.** `unramified_regulator_theorem`.

**Direct prerequisites.** `PadicHodgeRegulators:D.3/local-regulator`, `PadicHodgeRegulators:D.3/completed-k3-unramified`, `PadicHodgeRegulators:L1/integral-logarithm-unramified`, `PadicHodgeRegulators:D.3/residue-spanning`, `PadicHodgeRegulators:D.3/root-of-unity-classes`, `mathlib:Module.Free`, `mathlib:OrzechProperty`.

**Proof or construction.**

1. Structure: K_3(L; Z_p) ≅ H^1(L, Z_p(2)) is free of rank [L : Q_p] (D.3/completed-k3-unramified).
2. Image: log_BK(H^1(L, Z_p(2))) = 1!·p²O_L·e_2 = p²O_L because 2 ≤ p − 2 (L1/integral-logarithm-unramified). Hence D_L(K_3(L; Z_p)) = p²O_L, and D_L is injective on the torsion-free group since log_BK is injective. This supplies the containment and the extension to the completed group that GSWZ's proof asserts without proof (GSWZ E39).
3. Independent check of the image from below: D_L([ζ]_L) = Li_2(ζ) and these span p²O_L (D.3/residue-spanning (c)).
4. Alternatively, from the two inclusions p²O_L ⊆ image ⊆ p²O_L, a surjection between free Z_p-modules of the same finite rank is injective (Orzech property of commutative rings; Lean form unramifiedRegulator_injective_of_surjective).

**Acceptance.**

- L = Q_{25} × Q_5 (p = 5, GSWZ Example 4.3): K_3(L; Z_5) ≅ 25·(Z_{25} × Z_5).
- L = Q_5: the generator [ω(2)] maps to an element of valuation exactly 2.
- p = 3, L = Q_3: K_3(Q_3; Z_3) ≅ Z_3 ⊕ Z/3 has torsion, so no injection into 9Z_3 exists; the theorem does not apply.
- L = Q_p(ζ_p), p odd (ramified): K_3(L; Z_p) has torsion Z/p, so the theorem does not apply.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9, (183), p. 39 — Part (a); p unramified is implicit (D_p : B(K) → K_p is defined for unramified p).; [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), Lemme 1.3.2, p. 647 — The index form of the integral Bloch–Kato logarithm used for the image..

**Planet.** Unramified K₃ regulator theorem.

#### Completed K₃ is generated by roots of unity

`PadicHodgeRegulators:D.3/roots-of-unity-generate` — theorem.

Let p > 3 and L a finite unramified étale Q_p-algebra. Then K_3(L; Z_p) is generated as a Z_p-module by the classes [ζ]_L, ζ ∈ μ(L) with every component ≠ 1; every ξ ∈ K_3(L; Z_p) has a finite presentation ξ = Σ_ζ a_ζ[ζ]_L with a_ζ ∈ Z_p, and for any such presentation D_L(ξ) = Σ_ζ a_ζ Li_2(ζ). Presentations are not unique; D_L(ξ) is.

**Hypotheses.** p > 3; L unramified; ζ ranges over roots of unity with all components ≠ 1 (GSWZ E38).

**Suggested declaration.** `root_classes_generate`.

**Direct prerequisites.** `PadicHodgeRegulators:D.3/unramified-regulator-theorem`, `PadicHodgeRegulators:D.3/residue-spanning`, `PadicHodgeRegulators:D.3/root-of-unity-classes`, `PadicHodgeRegulators:D.3/local-regulator`.

**Proof or construction.**

1. D_L is an isomorphism onto p²O_L (D.3/unramified-regulator-theorem) and D_L([ζ]_L) = Li_2(ζ) (D.3/local-regulator).
2. The Li_2(ζ) span p²O_L (D.3/residue-spanning (c), which also handles products once components equal to 1 are excluded); pulling back along D_L gives generation.
3. Linearity of D_L gives the value on any presentation.

**Acceptance.**

- p = 5, L = Q_{25} × Q_5: [ζ_24], [ζ_24²], [ζ_24⁶] form a Z_5-basis, as GSWZ (274)–(275) use.
- For L = Q_5 the single class [ω(2)] generates K_3(Q_5; Z_5) ≅ Z_5.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9, p. 39 — Part (b), with components equal to 1 excluded (GSWZ E38)..

**Planet.** Roots of unity generate completed K₃.

### D.4. Global and Habiro exports

#### The global p-adic K₃ regulator

`PadicHodgeRegulators:D.4/global-p-adic-regulator` — construction.

Let F be a number field and p a prime. The global p-adic regulator is D_{F,p} := D_{F⊗Q_p} ∘ λ_{F,p} : K_3(F) → F ⊗_Q Q_p ≅ ∏_{v|p} F_v, where λ_{F,p} : K_3(F) → ∏_{v|p} K_3(F_v; Z_p) = K_3(F ⊗ Q_p; Z_p) is the semilocal completed map of KTheoryFiniteLocalFields:L.7/semilocal-completed-map and D_{F⊗Q_p} is the regulator of D.3/local-regulator. It kills the torsion subgroup of K_3(F) and induces D_{F,p} ⊗ Q : K_3(F) ⊗ Q → F ⊗ Q_p; for p > 3 unramified in F its image lies in p²(O_F ⊗ Z_p).

**Hypotheses.** F a number field, p any prime; the integrality clause needs p > 3 unramified in F.

**Suggested declaration.** `globalPadicRegulator`.

**Direct prerequisites.** `KTheoryFiniteLocalFields:L.7/semilocal-completed-map`, `PadicHodgeRegulators:D.3/local-regulator`, `PadicHodgeRegulators:D.3/unramified-regulator-theorem`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Proof or construction.**

1. λ_{F,p} is the product of the completion maps c_v followed by p-completion; under the semilocal equivalence F ⊗ Q_p ≅ ∏_v F_v it is induced by F → F ⊗ Q_p (KTheoryFiniteLocalFields:L.7/semilocal-completed-map).
2. D_{F⊗Q_p} is Z_p-linear with torsion-free target, so torsion classes of K_3(F) map to 0.
3. For p > 3 unramified, D.3/unramified-regulator-theorem gives the integrality.

**Acceptance.**

- F = Q: K_3(Q) ≅ Z/48 is torsion, so D_{Q,p} = 0 for every p.
- F = Q(α), α³ − α² + 1 = 0, p = 5: D_{F,5}(ξ) for the class ξ of 5_2 is the value (271) of GSWZ (D.4/example-cubic-field-five-two).

**API.**

- `globalPadicRegulator` (data): globalPadicRegulator F p : K_3(F) →+ F ⊗[ℚ] ℚ_[p].
- `globalPadicRegulator_component` (projection): Its v-component is localRegulator F_v ∘ c_v.
- `globalPadicRegulator_torsion` (simp): globalPadicRegulator F p x = 0 for every torsion x.
- `globalPadicRegulator_integral` (characterisation): For 3 < p unramified in F, its range lies in p² • (𝓞_F ⊗ ℤ_p).
- `globalPadicRegulator_rat` (constructor): The extension K_3(F) ⊗ ℚ →ₗ[ℚ] F ⊗ ℚ_[p].
- `globalPadicRegulator_galois` (functoriality): For τ ∈ Aut(F), globalPadicRegulator F p ∘ K_3(τ) = (τ ⊗ 1) ∘ globalPadicRegulator F p.
- `globalPadicRegulator_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `globalPadicRegulator_rat_zero` (computation): globalPadicRegulator ℚ p = 0, since K_3(ℚ) ≅ ℤ/48 is finite.
- `globalPadicRegulator_torsion_zero` (degenerate): For F totally real, K_3(F) ⊗ Q = 0 (Borel: rank r_2 = 0), so globalPadicRegulator F p ⊗ Q = 0.
- `globalPadicRegulator_bloch_compat` (compatibility): For ξ ∈ K_3(F) whose Bloch image is presented by special units at p, globalPadicRegulator F p ξ = blochDilog F p (presentation) (D.4/special-unit-formula).
- `globalPadicRegulator_not_injective_claim` (non-example): For F imaginary quadratic and p split, K_3(F) ⊗ Q has rank 1 while F ⊗ Q_p has rank 2; injectivity of globalPadicRegulator ⊗ Q is a separate proposition (D.4/padic-k3-regulator-injectivity), not a consequence of the ranks.

**Used by.** GSWZ §1.5, Definition 1.3 and (22): the formal completion f̂ with log f̂_m = D_p(ξ)/(m² log q) + log f_m; HabiroNumberFields:HB.7/invertible-local-sections: the K_3-indexed local sections use D_p(ξ) in GSWZ's normalisation; HabiroNahmSeries:HB.9/p-adic-regulator-input: D_p(ξ) of the Nahm class ξ at primes p ∤ Δ; Polylogarithms:P.6/padic-regulator: the weight-one analogue is the p-adic unit regulator of D.1/unit-logarithm-kernel.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §1.5, (19), p. 9 — The map from K_3 of the semilocal algebra; precomposed with localisation from K_3(K)..

**Planet.** Global p-adic K₃ regulator.

#### The global regulator on special-unit presentations

`PadicHodgeRegulators:D.4/special-unit-formula` — theorem.

Let F be a number field, p a prime, and let ξ ∈ K_3(F) have image in B(F) ⊗ Q presented as Σ_i n_i[z_i] (n_i ∈ Q) with z_i and 1 − z_i units at every prime of F above p. Then D_{F,p}(ξ) = ±Σ_i n_i D_{F,p}^{dil}([z_i]), where D^{dil}_{F,p} is the combined dilogarithm of D.1/combined-dilogarithm and the sign is the pinned sign of D.3/local-regulator. In particular: (a) for every root of unity ζ ≠ 1 of F, D_{F,p}([ζ]) = Li_2(ζ ⊗ 1) componentwise; (b) for a fixed presentation the hypothesis holds for all but finitely many p; (c) when R = O_F[1/Δ] and all z_i, 1 − z_i ∈ R^×, the formula holds at every p ∤ Δ. For presentations by symbols that are not special units at p the formula is Besser–de Jeu's Conjecture 1.14 (gap).

**Hypotheses.** z_i, 1 − z_i ∈ O_{F,(v)}^× for every v | p; the presentation lies in the image of B(F) ⊗ Q under Suslin's map.

**Suggested declaration.** `global_special_unit_formula`.

**Direct prerequisites.** `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.1/combined-dilogarithm`, `PadicHodgeRegulators:D.3/local-regulator`, `KTheoryFiniteLocalFields:L.7/restriction-completion-square`.

**Proof or construction.**

1. At each v | p, the localisation of ξ is presented by special units of O_v; D.2/weight-two-dilogarithm-comparison (BdJ Theorem 1.10 for number fields) gives the v-component.
2. Roots of unity of any order: BdJ Theorem 1.12.
3. (b) is BdJ Remark 1.11: a fixed finite presentation involves finitely many elements, each a unit away from finitely many primes.

**Acceptance.**

- F = Q(α), α³ − α² + 1 = 0: ξ = 2[1 − α²] + [1 − α] with 1 − α², α², 1 − α, α global units, so the formula holds at every p (D.4/example-cubic-field-five-two).
- F = Q(ζ_m), p ∤ m: D_{F,p}([ζ_m]) = (Li_2(σ_v ζ_m))_{v|p}.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.10(2) and Remark 1.11, p. 5 — The number-field version and its scope.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Lemma 3.1, p. 38 — GSWZ work with special units of R = O_K[1/Δ], which is the range of this theorem..

#### Restriction and transfer for the global regulator

`PadicHodgeRegulators:D.4/norm-trace-compatibility` — theorem.

Let E/F be a finite extension of number fields and p a prime. (a) Restriction: D_{E,p}(res_{E/F} ξ) = ι(D_{F,p}(ξ)) for ξ ∈ K_3(F), ι : F ⊗ Q_p → E ⊗ Q_p. (b) Transfer: D_{F,p}(N_{E/F} η) = Tr_{E⊗Q_p/F⊗Q_p}(D_{E,p}(η)) for η ∈ K_3(E). (c) Consequently D_{F,p}(N_{E/F} res_{E/F} ξ) = [E : F]·D_{F,p}(ξ). The same holds for the local regulators of D.3 along finite extensions of finite étale Q_p-algebras.

**Hypotheses.** E/F finite; Iwasawa branch; Bloch–Kato logarithms of the factors.

**Suggested declaration.** `global_norm_trace_compatibility`.

**Direct prerequisites.** `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `KTheoryFiniteLocalFields:L.7/semilocal-completed-map`, `KTheoryFiniteLocalFields:L.7/transfer-completion-formula`, `PadicHodgeRegulators:D.2/etale-regulator`, `PadicHodgeRegulators:L1/twist-and-change-of-field`, `PadicHodgeRegulators:D.1/logarithm-norm-trace`.

**Proof or construction.**

1. λ is compatible with restriction and transfer (KTheoryFiniteLocalFields:L.7/semilocal-completed-map and L.7/transfer-completion-formula).
2. Locally, the étale regulator takes restriction to restriction and transfer to corestriction (D.2/etale-regulator API), and log_BK takes restriction to inclusion and corestriction to trace on D_dR(Q_p(2)) (L1/twist-and-change-of-field).
3. (c) follows from (a), (b) and Tr∘ι = [E : F].

**Acceptance.**

- F = Q, E = Q(ζ_3), p = 7: D_{Q,7}(N[ζ_3]) = Tr(D_{E,7}([ζ_3])) = Li_2(ζ_3) + Li_2(ζ_3^{−1}) = 0, consistent with K_3(Q) being torsion.
- Transfer is not multiplicative on sections: the HabiroNumberFields norm of sections corresponds to this additive trace on degrees, not to a product of regulators.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph after (174), p. 38 — Componentwise definition, which makes the trace compatibility a sum over embeddings..

#### Frobenius compatibility of the p-adic regulator

`PadicHodgeRegulators:D.4/frobenius-compatibility` — theorem.

Let p be unramified in the number field F and let φ_p be the Frobenius of the unramified étale algebra F ⊗ Q_p ≅ ∏_{v|p} F_v (the product of the arithmetic Frobenii). Then φ_p acts on K_3(F ⊗ Q_p; Z_p) by functoriality and D_{F⊗Q_p}(φ_p x) = φ_p(D_{F⊗Q_p}(x)); in particular D_p(φ_p ξ) = φ_p D_p(ξ) for ξ ∈ K_3(F), with φ_p ξ := φ_p λ_{F,p}(ξ). On root-of-unity classes, φ_p[ζ] = [ζ^p] and D(ζ^p) = φ_p D(ζ).

**Hypotheses.** p unramified in F (any p for the functoriality; p > 3 for the integral statements it is combined with).

**Suggested declaration.** `global_frobenius_compatibility`.

**Direct prerequisites.** `PadicHodgeRegulators:D.3/local-regulator`, `PadicHodgeRegulators:D.3/unramified-etale-algebra`, `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`, `PadicHodgeRegulators:D.3/root-of-unity-classes`.

**Proof or construction.**

1. φ_p is a Q_p-algebra automorphism, so D.3/local-regulator's functoriality (étale Chern classes and log_BK are natural for automorphisms of the field) gives the identity.
2. On roots of unity this is D.1/dilogarithm-scalar-extension (b) with φ(ζ) = ζ^p.

**Acceptance.**

- GSWZ (273): D_5(ζ_24^5) = φ(D_5(ζ_24)) in the Q_{25}-component.
- With the geometric Frobenius in place of the arithmetic one the identity reads D(ζ^{p^{-1}}) = φ^{−1}D(ζ); the convention is pinned to the arithmetic Frobenius (Huber–Kings warn about this choice).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38 — The Frobenius on roots of unity used with D_p(φ_p ξ) = φ_p D_p(ξ)..

#### Torsion classes and controlled denominators

`PadicHodgeRegulators:D.4/torsion-and-denominators` — theorem.

Let F be a number field and p > 3 unramified in F. (a) Every torsion element of K_3(F) has D_{F,p} = 0. (b) If β ∈ K_3(F) ⊗ Q satisfies Nβ ∈ image(K_3(F)) for a nonzero integer N, then D_{F,p}(β) ∈ p^{2 − v_p(N)}(O_F ⊗ Z_p). (c) For a root of unity ζ ∈ μ(F) ∖ {1} of order m, the coefficient-localised class ⟦ζ⟧ ∈ B(F) ⊗ Z[1/m] of K3BlochGroups:V.6/root-of-unity-class has D_{F,p}(⟦ζ⟧) = Li_2(ζ ⊗ 1), which lies in p²(O_F ⊗ Z_p) when p ∤ m. (d) The image D_{F,p}(K_3(F)) is a finitely generated Z-submodule of rank at most r_2(F) inside p²(O_F ⊗ Z_p); its Z_p-span need not be all of p²(O_F ⊗ Z_p).

**Hypotheses.** F a number field; p > 3 unramified in F for (b)–(d). N≠0 in the denominator bound; the root-of-unity notation is a coefficient-localized Bloch class transported rationally, not necessarily the raw integral symbol [ζ].

**Suggested declaration.** `global_torsion_and_denominators`.

**Direct prerequisites.** `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `PadicHodgeRegulators:D.4/special-unit-formula`, `K3BlochGroups:V.5/k3-number-field`, `K3BlochGroups:V.2/k3-rank-borel`, `K3BlochGroups:V.6/root-of-unity-class`, `K3BlochGroups:V.6/comparison-rational`.

**Proof or construction.**

1. (a) The target is torsion-free.
2. (b) D_{F,p}(Nβ) ∈ p²(O_F ⊗ Z_p) by D.4/global-p-adic-regulator, and division by N costs v_p(N).
3. (c) D.4/special-unit-formula (a) and linearity: D(m^{−1} ⊗ m[ζ]) = m^{−1}·m·Li_2(ζ).
4. (d) K_3(F) is finitely generated of rank r_2 (K3BlochGroups:V.2/k3-rank-borel); the finitely generated global image has Z-rank≤r_2; λ_{F,p}(K_3(F)) spans a Z_p-submodule of K_3(F ⊗ Q_p; Z_p) of rank ≤ r_2 ≤ [F : Q].

**Acceptance.**

- F = Q(√−3), p = 7 (split): D_{F,7} kills the finite torsion subgroup Z/w_2(F); the non-torsion part has rank r_2 = 1 inside a rank-2 target.
- If N=p and pβ is integral, the bound places its regulator in p(O_F⊗Z_p). This is an upper bound on denominators; it does not establish that a global class attains the bound.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Theorem 9, p. 39 — Torsion-freeness of the target, which makes torsion classes vanish..

#### The regulator exported to Habiro-module gluing

`PadicHodgeRegulators:D.4/habiro-regulator-export` — comparison.

Let K be a number field, Δ a positive integer divisible by disc(K) and by 6, R = O_K[1/Δ], and p ∤ Δ (so p > 3 is unramified in K). The p-adic regulator used to define invertible L_p(ξ)-sections (GSWZ Definition 1.3, (22)) is D_p := D_{K,p} : K_3(K) → p²R^∧_p ⊂ K_p = R^∧_p[1/p] = K ⊗ Q_p, with: (i) the Iwasawa branch and D_p([ζ]) = Li_2(ζ) on roots of unity; (ii) D_p(φ_p ξ) = φ_p D_p(ξ); (iii) D_p(ξ) = Σ n_i D(z_i) for presentations by Δ-special units z_i, 1 − z_i ∈ R^×; (iv) every ξ has a Z_p-presentation λ_{K,p}(ξ) = Σ a_ζ [ζ]_{K_p} by roots of unity of order prime to p with all components ≠ 1, and D_p(ξ) = Σ a_ζ Li_2(ζ); (v) scalar dictionary: D_p = ε·log_BK∘r^et_2 (Bloch–Kato, e_2-basis), D_p = ε·reg_syn for Besser’s Chern-class regulator with the de Jeu sign ε; equality without ε requires aligning the symbol convention first, and the Gros normalisation is (1 − φ_p/p²)·D_p, which maps p²R^∧_p onto R^∧_p. No injectivity of λ_{K,p} ⊗ Q is asserted (D.4/padic-k3-regulator-injectivity).

**Hypotheses.** Δ divisible by disc(K) and 6; p ∤ Δ.

**Suggested declaration.** `habiro_regulator_export`.

**Direct prerequisites.** `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `PadicHodgeRegulators:D.4/special-unit-formula`, `PadicHodgeRegulators:D.4/frobenius-compatibility`, `PadicHodgeRegulators:D.3/roots-of-unity-generate`, `PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`, `PadicHodgeRegulators:D.2/gros-normalisation`.

**Proof or construction.**

1. (i), (ii), (iii) are D.4/global-p-adic-regulator, D.4/frobenius-compatibility and D.4/special-unit-formula (c).
2. (iv) applies D.3/roots-of-unity-generate to λ_{K,p}(ξ) ∈ K_3(K_p; Z_p).
3. (v) collects D.3/local-regulator and D.2/gros-normalisation.

**Acceptance.**

- GSWZ Example 4.3 at p = 5 (Δ = 6·23): D.4/example-cubic-field-five-two.
- With the Gros normalisation in (22) the integrality condition (21) would change by the factor (1 − φ_p/p²); the export pins Besser's normalisation.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Definition 1.3, (20)–(22), p. 9 — The use of D_p(ξ) that fixes the normalisation.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 1, p. 9 — The range of primes for which the export is made..

#### The p-adic K₃ regulator injectivity proposition

`PadicHodgeRegulators:D.4/padic-k3-regulator-injectivity` — definition.

For a number field F and prime p, Inj(F,p) means injectivity of the Q-linear map D_{F,p}⊗Q:K_3(F)⊗Q→F⊗Q_p. Since the source has Q-dimension r_2(F), this is equivalent to Z-rank r_2(F) of the finitely generated integral image. Separately, StrongInj(F,p) means injectivity of the Q_p-linear extension K_3(F)⊗Q_p→F⊗Q_p, equivalently Q_p-dimension r_2(F) of its span, or Z_p-rank r_2(F) of the Z_p-span. StrongInj implies Inj; the converse is not a formal equivalence. Neither assertion for positive r_2 follows from Borel’s rank formula or the local D.3 isomorphism.

**Hypotheses.** F a number field, p a prime.

**Suggested declaration.** `PadicK3RegulatorInjective`.

**Direct prerequisites.** `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `K3BlochGroups:V.2/k3-rank-borel`, `K3BlochGroups:V.5/k3-number-field`.

**Proof or construction.**

1. Define the two injectivity predicates over their specified scalar fields. Rationalizing a homomorphism from the finitely generated group gives the Z-rank criterion for Inj; extending scalars to Q_p gives the Q_p-span criterion for StrongInj. A Q-linearly independent set of p-adic vectors need not be Q_p-linearly independent: (a,b)↦a+αb is injective on Q² for α∈Q_p\Q, but its Q_p-linear extension has the nonzero kernel (−α,1). No arithmetic converse is claimed.

**Acceptance.**

- Inj(F, p) holds trivially when r_2(F) = 0.
- Inj(F, p) is not asserted for any F with r_2(F) ≥ 1.

**API.**

- `PadicK3RegulatorInjective` (data): PadicK3RegulatorInjective F p : Prop := Function.Injective (globalPadicRegulator_rat F p).
- `padicK3RegulatorInjective_of_totallyReal` (example): If F is totally real, PadicK3RegulatorInjective F p holds.
- `padicK3RegulatorInjective_iff_rank` (characterisation): PadicK3RegulatorInjective F p ↔ the integral image has Z-rank r_2(F), equivalently the rational image has Q-dimension r_2(F). This is not a Q_p-span criterion.
- `padicK3RegulatorInjective_baseChange` (functoriality): For E/F finite, PadicK3RegulatorInjective E p implies PadicK3RegulatorInjective F p (restriction is injective rationally and compatible with D.4/norm-trace-compatibility).
- `StrongPadicK3RegulatorInjective` (data): Function.Injective of the Q_p-linear extension of globalPadicRegulator_rat; equivalent to Q_p-span dimension r_2(F).
- `strongPadicK3RegulatorInjective_implies` (relation): StrongPadicK3RegulatorInjective F p implies PadicK3RegulatorInjective F p; no converse from linear algebra.
- `PadicK3RegulatorInjective_extensionality` (extensionality): The injectivity predicates depend only on the specified Q-linear or Q_p-linear map respectively: pointwise equal maps give equivalent predicates. Proof witnesses are unique by proof irrelevance; scalar extension is not an extensionality equivalence.

**Unit tests.**

- `injective_rat` (computation): PadicK3RegulatorInjective ℚ p holds, since K_3(ℚ) ⊗ ℚ = 0.
- `injective_totally_real` (degenerate): For F totally real (r_2 = 0) the source is zero and the proposition holds.
- `injective_rank_compat` (compatibility): For F imaginary quadratic, the proposition is equivalent to D_{F,p}(ξ_0) ≠ 0 for a generator ξ_0 of K_3(F) modulo torsion.
- `injective_not_from_rank` (non-example): A zero map from a nonzero Q-vector space into a larger Q_p-vector space is not injective. The inequality r_2≤[F:Q] alone supplies no information about the regulator’s kernel.
- `injective_scalar_extension_non_example` (non-example): For α∈Q_p outside Q, (a,b)↦a+αb on Q² is injective, while the Q_p-linear map with the same formula has nonzero kernel (−α,1). Thus rational injectivity alone does not imply full Q_p-span rank.

**Used by.** PadicHodgeRegulators D.4 stage text: keep the higher p-adic regulator conjecture a distinct proposition; ColemanIntegration:L3/padic-beilinson-conjecture: the weight-two Artin-motive case of the p-adic Beilinson conjecture contains non-vanishing of such regulators.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9, p. 39 — A local statement; it says nothing about the image of global K_3, whence the separate proposition..

#### GSWZ Example 4.3: the class of 5₂ at p = 5

`PadicHodgeRegulators:D.4/example-cubic-field-five-two` — application.

Let K = Q(α), α³ − α² + 1 = 0 (discriminant −23), z_1 = z_3 = 1 − α², z_2 = z_1² − z_1 + 2 = 1 − α, and ξ = [z_1] + [z_2] + [z_3] = 2[1 − α²] + [1 − α] ∈ B(K) (the class of the knot 5_2). All of 1 − α², α², 1 − α and α are units of O_K (norm ±1). At p = 5, K_5 ≅ Q_{25} × Q_5, μ(K_5) ≅ μ_24 × μ_4, and ζ_24 := lim_s α^{5^{2s}} has order 24 with Q_5-component the Teichmüller lift of 2 (order 4). Then D_5(ξ) = c_1D_5(ζ_24) + c_2D_5(ζ_24²) + c_3D_5(ζ_24⁶) with c_1 = 1 + 4·5 + 3·5² + ⋯, c_2 = 3 + 5 + ⋯, c_3 = 1 + 5 + 4·5² + ⋯, hence λ_{K,5}(ξ) = c_1[ζ_24] + c_2[ζ_24²] + c_3[ζ_24⁶] in K_3(K_5; Z_5). The second line of GSWZ (273) is the value D_5(ζ_24²), misprinted there with the label ζ_24^5 (GSWZ E56).

**Hypotheses.** p = 5 ∤ 6·23.

**Suggested declaration.** `example_cubic_field_five_two`.

**Direct prerequisites.** `PadicHodgeRegulators:D.4/habiro-regulator-export`, `PadicHodgeRegulators:D.4/special-unit-formula`, `PadicHodgeRegulators:D.3/roots-of-unity-generate`, `PadicHodgeRegulators:D.1/combined-dilogarithm`.

**Proof or construction.**

1. All symbols are special units at 5, so D.4/special-unit-formula identifies D_5(ξ) with the dilogarithm sum (271).
2. ζ_24, ζ_24², ζ_24⁶ have all components ≠ 1 and their regulators form a Z_5-basis of 25·O_{K_5} (D.3/residue-spanning (c)); solving the linear system gives the c_i, recomputed 5-adically by the GSWZ extraction's reviewer.
3. Injectivity of D_5 on K_3(K_5; Z_5) (D.3/unramified-regulator-theorem) turns the identity of regulators into the identity of classes.

**Acceptance.**

- Recompute D_5(ξ), D_5(ζ_24), D_5(ζ_24²), D_5(ζ_24⁶) to precision 5^{12} with exact arithmetic in Z_5[α] and check (271), (273) (relabelled) and (274).
- The Q_5-component of ζ_24^4 is 1, so ζ_24^4 is not an admissible generator.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Example 4.3, (270)–(275), p. 54 — The example.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Example 4.3, (274), p. 54 — The decomposition of D_5(ξ) by the root-of-unity values..

### D.5. Good-reduction, relative and semistable curve regulators

#### The weight-two syntomic target of a curve and its two identifications

`PadicHodgeRegulators:D.5/curve-weight-two-target` — definition.

Let K/Q_p be finite unramified of degree f, q=p^f, and 𝒳/O_K a smooth proper geometrically connected curve, X=𝒳_K. Set H=H¹_dR(X/K)=H¹_rig(𝒳_k/K), Φ=φ_p^f (K-linear), P=φ_p/p² (Q_p-linear), A=1−P, Q=Φ/q²=P^f, B=1−Q, and N_f=Σ_{j=0}^{f−1}P^j, so B=N_f A. The rigid syntomic complex is Besser’s full filtered homotopy fibre product, not a single cone on H. Map its Frobenius-cone component to the fixed-q modified model by (id,N_f), with identity on the other fibre-product legs. This induces β:H²_syn,rig(𝒳,2)→H²_ms,q(𝒳,2). Let j_q:H→H²_ms,q be the raw boundary [(0,ε)], and j_p:H→H²_syn,rig the raw boundary in the collapsed unramified model. Curve weights and Fil²H¹=Fil²H²=0 give isomorphisms β,j_p,j_q,A,B, with βj_p=j_qN_f. The normalized identification is Θ=B⁻¹j_q⁻¹β=A⁻¹j_p⁻¹. Transport the K-module structure on the initially Q_p-linear rigid target through Θ. The fixed-q canonical boundary is ι=β⁻¹j_q, a K-linear equivalence with this transported structure, and Θ=B⁻¹ι⁻¹. For f>1, ι need not equal j_p. The alternating trace pairing on H satisfies B_cup(Φa,Φb)=q B_cup(a,b) and its second-kind residue formula.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K).

**Suggested declaration.** `curveSyntomicTarget`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `ColemanIntegration:L0/annulus-residue`.

**Proof or construction.**

1. In Besser Proposition 8.6(2), pp. 26–27, replace the p-Frobenius cone by the q-Frobenius cone using its norm operator N_f. The equality 1−P^f=N_f(1−P) gives the chain map; its source leg is id and its shifted target leg is N_f. Keep identity on the rigid comparison target of the full homotopy fibre product. This explicitly defines β before identifying cohomology.
2. Proposition 8.6(3), pp. 27–28, supplies the normalized boundary δ_rig; for a proper curve n=i=2 the exceptional degrees i,i−1,i−2 are all different from 2n. Remark 8.7(3), p. 28, identifies δ_rig=j_p A. The modified normalized boundary is δ_ms=j_q B. The cone map makes βδ_rig=δ_ms, hence βj_p=j_qN_f. Weight-one Frobenius eigenvalues on H exclude eigenvalue 1 for P or Q; A,B,N_f are invertible as Q_p-linear maps. Consequently β is an isomorphism in degree two.
3. At a further q-power model the transition norm cancels against its normalized boundary (Besser Proposition 10.1(3), p. 34); thus Θ agrees with the colimit modified-syntomic identification, not just an arbitrary fixed-model inverse. Besser–de Jeu Definition 4.6, p. 24, writes the same B⁻¹ correction on [(0,ε)]. Transport K-scalars through Θ; then ι is K-linear because B is K-linear. Do not describe A as K-linear when f>1.
4. Use the imported rigid trace/Poincaré-duality pairing for the q-similitude, and Ara2003 Lemma 3.3 for its residue realization.

**Acceptance.**

- 𝒳 = P^1: H^1_dR = 0 and the target is 0.
- For an elliptic curve y² = x³ + ax + b, ω = dx/2y and η = x dx/2y: B(ω, η) = 1 (residue at ∞ with local parameter −x/y).

**API.**

- `curveSyntomicTarget` (data): curveSyntomicTarget 𝒳 := H^2_syn(𝒳, 2).
- `curveSyntomicCanIso` (equivalence): ι=β⁻¹j_q:H≃ₗ[K]H²_syn,rig, with K-scalars transported by Θ; it is the fixed-q raw boundary, not necessarily j_p.
- `curveSyntomicNormIso` (equivalence): Θ=B⁻¹ι⁻¹=B⁻¹j_q⁻¹β=A⁻¹j_p⁻¹; it is the inverse normalized boundary.
- `cupTrace` (structure): cupTrace X : LinearMap.BilinForm K (H1dR X), alternating.
- `cupTrace_frob` (relation): cupTrace (φ a) (φ b) = q • cupTrace a b.
- `cupTrace_res_sum` (characterisation): For second-kind forms, cupTrace [dF] [dG] = Σ_x Res_x(F dG).
- `cupTrace_eigen` (relation): If cupTrace is a q-similitude for φ and φ v = γ v (γ ≠ 0), then cupTrace (φ a) v = (q/γ)·cupTrace a v.
- `curveSyntomicTarget_extensionality` (extensionality): The canonical/normalized equivalences are determined by their values on cohomology classes, and cupTrace by its values on pairs. Require the explicit comparison maps before transporting the K-module structure.
- `curveRigidToModified` (relation): β is induced by (id,N_f) on the Frobenius cone and identity on the other homotopy-fibre-product legs.
- `curveRigidToModified_raw` (relation): βj_p=j_qN_f; βδ_rig=δ_ms for δ_rig=j_pA and δ_ms=j_qB.
- `curveSyntomicNormIso_p` (characterisation): Θ=A⁻¹j_p⁻¹ as a Q_p-linear map; this determines the transported K-module structure.

**Unit tests.**

- `curveTarget_projective_line` (computation): For 𝒳 = P^1_{O_K}, curveSyntomicTarget 𝒳 = 0.
- `curveTarget_weight_one_analogue` (degenerate): In weight one for Spec O_K (i = n = 1), the normalised class of a unit u is log u while the canonical class is (1 − 1/q)·log u.
- `curveTarget_eigen_factor` (compatibility): If φv = γv then B(φa, v) = (q/γ)B(a, v); for p = q = 5 and γ = 2, (1 − 1/(pγ)) = 9/10 is the factor between canonical and normalised pairings.
- `curveTarget_h2_non_example` (non-example): For H^3_syn(𝒳, 1) the operator 1 − φ/q on H^2_rig(𝒳_k) is zero (φ = q there), so no normalised identification exists; Besser–de Jeu Definition 4.6 requires n ≥ i > dim.
- `curveTarget_nontrivial_residue_degree` (compatibility): For f=2, N_f=1+P, B=1−P²=(1+P)A, βj_p=j_q(1+P); substituting j_p for ι omits a norm operator.
- `curveTarget_semilinear_non_example` (non-example): For f>1 and a∈K with σ(a)≠a, P(av)=σ(a)P(v), so A(av) need not equal aA(v); K-linearity is obtained by Θ-transport, not by calling A K-linear.

**Used by.** Asakura–Miyatani, Theorem 9.1: Tr_C(Θ(reg_syn{f, g}) ∪ [ω]) = (r_p{f, g})(ω); EllipticRegulators:ER.8/good-reduction-elliptic-pairing: the Coleman formula for the weight-two elliptic regulator, which holds for Θ, not for ι^{−1}; EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: the Frobenius factor (1 − p^{−2}Φ) between the canonical and normalised identifications.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Definition 4.6, p. 24 — The normalised identification.; [Ara2003](https://arxiv.org/abs/math/0301029v1), Lemma 3.3, p. 8 — The residue formula for the cup product.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Proposition 8.6(3), Remark 8.7(3) and Proposition 10.1(3), author PDF pp. 26–28,34 — Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps..

**Planet.** Weight-two syntomic cohomology of curves.

#### The Frobenius splitting for an open curve

`PadicHodgeRegulators:D.5/open-curve-splitting` — construction.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let (𝒳, D) be a good-reduction pair (ColemanIntegration:L1/good-reduction-pair) with D finite étale over O_K and Y = 𝒳 ∖ D. Then H̃^2_ms(Y, 2) = Ω^†(Y)/dA^†(Y) = H^1_dR(A^†(Y)), the restriction res : H^1_dR(X) → H^1_dR(Y) is φ-equivariant and injective, and there is a unique φ-equivariant retraction p_D : H^1_dR(Y) → H^1_dR(X) (H^1(X) has Frobenius weight 1 and the cokernel of res, spanned by residues, weight 2). p_D does not depend on the Frobenius lift and is compatible with enlarging D.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). (𝒳, D) a good-reduction pair; D finite étale over O_K.

**Suggested declaration.** `openCurveSplitting`.

**Direct prerequisites.** `ColemanIntegration:L1/good-reduction-pair`, `ColemanIntegration:L1/wide-open-neighbourhood`, `ColemanIntegration:L1/frobenius-lift`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology`, `PadicHodgeRegulators:D.5/curve-weight-two-target`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lifts-induce-homotopic-maps`.

**Proof or construction.**

1. The Gysin/residue sequence 0 → H^1(X) → H^1(Y) → K^{D}(−1) → K identifies the cokernel of res with residues, on which φ acts with weight 2.
2. Weights differ, so the φ-stable complement of res(H^1(X)) is unique; p_D is the projection along it (Besser–de Jeu 2012, p. 4, citing Besser's K_2 paper, Proposition 4.8).
3. Independence of the lift: two lifts induce homotopic maps on overconvergent de Rham complexes.

**Acceptance.**

- P^1 with D = {0, ∞}: H^1_dR(Y) = K·dt/t, φ^* = q on it, and p_D = 0.
- For an elliptic curve and D = {O}, p_D is the identity on H^1_dR(Y) = H^1_dR(X).

**API.**

- `openCurveSplitting` (data): openCurveSplitting 𝒳 D : H1dR (Y) →ₗ[K] H1dR X.
- `openCurveSplitting_comp_res` (simp): openCurveSplitting 𝒳 D ∘ res = id.
- `openCurveSplitting_frob` (characterisation): openCurveSplitting commutes with φ and is the unique such retraction.
- `openCurveSplitting_mono` (relation): For D ⊆ D', openCurveSplitting 𝒳 D' ∘ res_{Y,Y'} = openCurveSplitting 𝒳 D.
- `openCurveSplitting_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `splitting_p1` (computation): For P^1 and D = {0, ∞}, openCurveSplitting = 0.
- `splitting_empty_boundary` (degenerate): For D = ∅ (Y = X), openCurveSplitting = id.
- `splitting_res_compat` (compatibility): openCurveSplitting 𝒳 D ∘ res = id on H1dR X.
- `splitting_not_residue_free` (non-example): For X=P¹ and D={0,∞}, dlog(t) has nonzero boundary residues and projects to 0, while residue-free cohomology is the image of H¹(X), not a proposed complementary subspace. A rule equating the complementary summand with residue-free cohomology is therefore wrong.

**Used by.** PadicHodgeRegulators:D.5/curve-syntomic-regulator: the regulator of a symbol on Y is projected to X by p_D; Besser–de Jeu 2012, (9.13): p is the unique map with (pη) ∪ [ω] = ⟨F_η, F_ω⟩_gl for ω of the second kind holomorphic on U.

**Sources.** [BdJ2012](https://arxiv.org/pdf/1208.0516v1), §1, pp. 4–5 — The projection p_D from the open curve, from Besser's K_2 paper..

#### The degree-two syntomic regulator of a curve

`PadicHodgeRegulators:D.5/curve-syntomic-regulator` — construction.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). For u ∈ K_2(𝒳)^{(2)} ⊗ Q define reg_syn(u) ∈ H^2_syn(𝒳, 2) by the syntomic Chern class of D.2/syntomic-regulator, and put regSynCan(u) := ι^{−1}(reg_syn(u)) and regP(u) := Θ(reg_syn(u)) = (1 − φ/q²)^{−1}regSynCan(u) in H^1_dR(X/K). If the restriction of u to Y = 𝒳 ∖ D is a finite sum Σ n_i{f_i, g_i} of symbols with f_i, g_i ∈ O(Y)^×, then regSynCan(u) = p_D[Σ_i n_i ε(f_i, g_i)] with ε(f, g) := q^{−2}·log(f_0)·φ^*dlog g − q^{−1}·log(g_0)·dlog f, f_0 := f^q/φ^*f (a class in H̃^2_ms(Y, 2) = H^1_dR(A^†(Y))), and regP(u) = p_D((1 − φ^*/q²)^{−1}[Σ_i n_i ε(f_i, g_i)]). This gives the full 2g-coordinate regulator vector, not only its pairing with holomorphic forms.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). (𝒳, D) a good-reduction pair containing the supports of all f_i, g_i.

**Suggested declaration.** `curveSyntomicRegulator`.

**Direct prerequisites.** `PadicHodgeRegulators:D.5/curve-weight-two-target`, `PadicHodgeRegulators:D.5/open-curve-splitting`, `PadicHodgeRegulators:D.2/syntomic-regulator`, `EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition`, `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `K2SymbolsBrauer:T.3/tame-symbol`, `SchemeKTheoryOperations:S.6/soule-scheme-operations`.

**Proof or construction.**

1. The syntomic Chern class on K_2 is the cup product of the K_1 classes reg(f) = (dlog f, log(f_0)/q) (Besser–de Jeu 2003 Lemma 4.7, citing Besser 2000 Proposition 10.3).
2. On Y with a Frobenius lift the cup product of two such classes is represented by ε(f, g) in Ω^†(Y)/dA^†(Y) (Besser–de Jeu 2012 (5.1)–(5.2); Asakura–Miyatani Proposition 6.4).
3. Restrict u first from the regular integral model 𝒳 to its generic fibre X. The localization sequence of EllipticKTheory:E.3 applies to this curve over K and gives trivial tame symbols along D_K for the restricted class; it is not a localization theorem for the two-dimensional scheme 𝒳. Under the stated integral good-pair symbol presentation, p_D returns the regulator class to X. The weight-two source on 𝒳 uses SchemeKTheoryOperations:S.6/soule-scheme-operations; EllipticKTheory:E.4 applies only after restriction to X.

**Acceptance.**

- For c ∈ μ_{q−1}: c_0 = 1 and dlog c = 0, so regSynCan({f, c}) = 0.
- {f, f}: ε = −q^{−2}·d(½ log(f_0)²) is exact, so the regulator vanishes.

**API.**

- `curveSyntomicRegulator` (data): curveSyntomicRegulator 𝒳 : K_2(𝒳)^{(2)}_ℚ →ₗ[ℚ] curveSyntomicTarget 𝒳.
- `regSynCan` (projection): regSynCan := canIso⁻¹ ∘ curveSyntomicRegulator.
- `regP` (projection): regP := normIso ∘ curveSyntomicRegulator.
- `regSynCan_eq_frob_regP` (relation): regSynCan u = (1 − q⁻² • φ) (regP u).
- `regP_symbol` (characterisation): On a symbol presentation on Y, regP u = openCurveSplitting ((1 − φ^*/q²)⁻¹ [Σ n_i ε(f_i, g_i)]).
- `regSynCan_pairing_eigen` (relation): For φ v = γ v: cupTrace (x − q^{−2}φ x) v = (1 − 1/(qγ))·cupTrace x v, the pairing form of regSynCan = (1 − φ/q²)·regP.
- `curveSyntomicRegulator_weight_three` (simp): The weight-three part of K_2(𝒳) ⊗ Q maps to 0 (H^4_syn(𝒳, 3)-target vanishes for a curve).
- `curveSyntomicRegulator_extensionality` (extensionality): Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist.

**Unit tests.**

- `regulator_constant_symbol` (computation): For c ∈ μ_{q−1}, regSynCan {f, c} = 0.
- `regulator_diagonal_symbol` (degenerate): regSynCan {f, f} = 0.
- `regulator_eigen_compat` (compatibility): If φv = γv, B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v) for K = Q_p.
- `regulator_canonical_not_coleman` (non-example): Feeding regSynCan instead of regP into the Coleman symbol formula is off by (1 − φ/q²); on an eigen-pairing by the factor (1 − 1/(pγ)).

**Used by.** EllipticRegulators:ER.8/the-syntomic-comparison: reg_p : K_2(E) ⊗ Q → H^1_dR(E/Q_p) of a curve with good reduction, specialised to ER's classes; EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: reg_syn(u) = (1 − p^{−2}Φ)z with z = log_BK(reg_et(u)); PadicHodgeRegulators:D.5/coleman-symbol-formula: the pairing of regP with holomorphic forms.

**Sources.** [AM18](https://arxiv.org/abs/1711.08854v2), Proposition 6.4, p. 34 — The hypothesis under which H^2 rigid syntomic cohomology is identified with H^1_rig (the sentence continues with the isomorphism).; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Lemma 4.7, p. 24 — The K_1 regulator cocycle (f_0 = f^q/φ^*f) whose cup product gives ε(f, g).; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Proposition 10.3, author PDF p. 35 — Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps..

**Planet.** Syntomic regulator on K₂ of curves.

#### Besser's Coleman-integral formula for the regulator of a symbol

`PadicHodgeRegulators:D.5/coleman-symbol-formula` — theorem.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let u ∈ K_2(𝒳)^{(2)} ⊗ Q restrict on Y = 𝒳 ∖ D to Σ_i n_i{f_i, g_i} with f_i, g_i ∈ O(Y)^× and (𝒳, D) a good-reduction pair containing all supports, and let ω ∈ H^0(X, Ω^1). Then B(regP(u), [ω]) = Σ_i n_i Σ_{x ∈ |D_K|} ord_x(f_i)·Tr_{K(x)/K}(CT_x(∫ log(g_i)·ω)), where ∫ log(g_i)ω is the Coleman integral (ColemanIntegration:L1/coleman-integral) and CT_x the log-free constant term at x in a local parameter (after a finite extension, descending by Galois equivariance). The value is independent of the branch of the logarithm and of the constant of integration. Equivalently Tr_X(Θ(reg_syn{f, g}) ∪ [ω]) = ∫_{(f)} log(g)ω (Coleman–de Shalit's p-adic regulator). The formula holds for Θ = regP, not for the canonical regSynCan.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). All supports in a finite étale D; ω holomorphic.

**Suggested declaration.** `coleman_symbol_formula`.

**Direct prerequisites.** `PadicHodgeRegulators:D.5/curve-syntomic-regulator`, `ColemanIntegration:L1/coleman-integral`, `ColemanIntegration:L1/locally-analytic-log-functions`, `ColemanIntegration:L1/branch-independence-principle`, `ColemanIntegration:L0/log-branch-field-compatibility`, `K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form`, `EllipticKTheory:E.7/symbol-certificates`.

**Proof or construction.**

1. Besser, Syntomic regulators and p-adic integration II, Theorem 3 (as restated by Asakura–Miyatani Theorem 9.1 and Besser–de Jeu 2012 Remark 1.10).
2. Pairing the cocycle ε(f, g) of D.5/curve-syntomic-regulator with ω: the Coleman primitive F_ω and the double index ⟨ , ⟩_gl reduce the cup product to residues at D (Besser, p-adic Arakelov theory, Lemma 3.3), giving Σ ord_x(f)·F_{log g ω}(x).
3. Independence of branch and constant: Weil reciprocity and trivial tame symbols (K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form) kill the ambiguity.

**Acceptance.**

- The tests of EllipticRegulators:ER.8/good-reduction-elliptic-pairing hold with regP.
- With regSynCan the formula fails by (1 − φ/q²) (EllipticRegulators F1 in the handoff).

**Sources.** [AM18](https://arxiv.org/abs/1711.08854v2), Theorem 9.1, p. 45 — The formula (= Besser II Theorem 3, unramified K).; [BdJ2012](https://arxiv.org/pdf/1208.0516v1), Remark 1.10, p. 4 — The Coleman–de Shalit form, known to be the syntomic regulator by Besser..

**Planet.** Besser's symbol formula.

#### The curve regulator and the Bloch–Kato logarithm

`PadicHodgeRegulators:D.5/curve-etale-comparison` — comparison.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Put V = H^1_et(X_K̄, Q_p(2)), a crystalline representation with D_cris(V) = H^1_dR(X/K) ⊗ e_2 and V^{G_K} = 0. For u ∈ K_2(𝒳)^{(2)} ⊗ Q the étale regulator r^et(u) ∈ H^1(K, V) lies in H^1_f = H^1_e, and regP(u) = log_BK(r^et(u)) under D_dR(V)/Fil^0 = H^1_dR(X/K); equivalently regSynCan(u) = (1 − Φ/q²)·log_BK(r^et(u)) for every such K, where Φ=φ_p^f and regSynCan uses the fixed-q boundary ι=β⁻¹j_q. For K=Q_p this is 1−φ_p/p². For K=Q_p, if φ_p v = γv then B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v).

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). The p-power eigenvector-pairing clause is restricted to K=Q_p. For general unramified K use K-linear Φ and the factor 1−1/(qγ).

**Suggested declaration.** `curve_etale_comparison`.

**Direct prerequisites.** `PadicHodgeRegulators:D.5/curve-syntomic-regulator`, `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`, `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/dimension-formulas`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`.

**Proof or construction.**

1. Besser Proposition 9.11, author p. 32, identifies the arithmetic étale edge applied to δ_rig(x) with exp_BK(x). The good-reduction comparison D.2 is normalized by this same boundary; it does not identify a raw cone coordinate with the exponential.
2. By the explicit norm-map square of curve-weight-two-target, δ_rig=j_pA=β⁻¹j_qB=ιB. Therefore δ_rig⁻¹=Θ over every finite unramified K. For u this gives r_et(u)=exp_BK(Θreg_syn(u)). Curve weights give D_cris(V)^{φ=1}=0 and V^{G_K}=0, so exp_BK is injective and H_e=H_f; invert it to obtain regP=log_BK r_et.
3. The fixed-q canonical coordinate is B regP. Pairing with a Φ-eigenvector uses the q-similitude, hence factor 1−1/(qγ). The p-specialization in AC20 footnote 4 is a check, not the proof for f>1.

**Acceptance.**

- For E/Q_p with good reduction and v a φ-eigenvector with eigenvalue γ: Tr(regSynCan(z) ∪ v) = (1 − p^{−1}γ^{−1})Tr(log reg_f(z) ∪ v) (Asakura–Chida footnote 4).
- This resolves the normalisation required by EllipticRegulators:ER.8/elliptic-syntomic-etale-factor.

**Sources.** [AC20](https://arxiv.org/pdf/2003.08888v2), Footnote 4, p. 43 — The canonical form of the comparison.; [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 1.1, p. 3 — The general comparison.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Proposition 9.11, author PDF p. 32 — Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Proposition 8.6(2),(3), Remark 8.7(3), Proposition 9.11 and Proposition 10.1(3), author pp. 26–28,32,34 — The explicit norm-chain-map square transports the normalized exponential identity to any unramified residue degree..

#### Pullback, pushforward and base change of the curve regulator

`PadicHodgeRegulators:D.5/curve-regulator-functoriality` — theorem.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let π : 𝒳' → 𝒳 be a finite flat morphism of good-reduction curves. (a) Pullback: regP(π^*u) = π^*regP(u), and B'(π^*a, π^*b) = deg(π)·B(a, b). (b) Pushforward: regP(π_*u') = π_*regP(u') with π_* the de Rham trace, characterised by B(π_*a', b) = B'(a', π^*b); at the level of symbols ∫_{(π^*f)} log(g)·π^*ω = ∫_{(f)} log(N g)·ω. (c) Base change: for K'/K finite unramified, regP(u|_{𝒳_{O_{K'}}}) = regP(u) ⊗ 1, and the transfer N_{K'/K} corresponds to Tr_{K'/K}. These base-change and transfer assertions use the normalized regP. If d=[K′:K], q′=q^d and Φ′=Φ^d on the base-changed cohomology, the raw fixed-Frobenius coordinate instead satisfies regSynCan,K′(u|K′)=N_d·(regSynCan,K(u)⊗1), with N_d=Σ_{j=0}^{d−1}(Φ/q²)^j. This is the identity 1−(Φ/q²)^d=N_d(1−Φ/q²); raw transfer likewise requires normalization. Part (b) at the level of syntomic cohomology is recorded as a gap: no source read proves pushforward compatibility for rigid syntomic regulators; it follows from (a) and the projection formula on the image of pullback, and in general from the étale comparison D.5/curve-etale-comparison and corestriction compatibility of r^et.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). π finite flat between smooth proper curves over O_K.

**Suggested declaration.** `curve_regulator_functoriality`.

**Direct prerequisites.** `PadicHodgeRegulators:D.5/curve-syntomic-regulator`, `PadicHodgeRegulators:D.5/curve-etale-comparison`, `SchemeKTheoryOperations:S.2/k-theory-pullback`, `SchemeKTheoryOperations:S.2/k-theory-proper-pushforward`, `SchemeKTheoryOperations:S.2/projection-formula`, `EllipticKTheory:E.3/naturality-for-finite-pullback`, `EllipticKTheory:E.3/naturality-for-finite-transfer`, `ColemanIntegration:L1/coleman-pullback`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/de-rham-trace`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/functoriality-of-rigid-cohomology`.

**Proof or construction.**

1. (a) Naturality of syntomic Chern classes and of the identification Θ under pullback; the similitude is Besser's p-adic Arakelov theory Lemma 3.6.
2. (b) Adjunction of trace and pullback (p-adic Arakelov theory Lemma 3.7); for the regulator itself, use D.5/curve-etale-comparison: r^et commutes with pushforward (corestriction on H^1(K, H^1_et)) and log_BK commutes with corestriction/trace (L1/twist-and-change-of-field).
3. (c) Base change of rigid cohomology and of Coleman integration (ColemanIntegration:L0/log-branch-field-compatibility). Besser Proposition 8.6(2),(3) and Remark 8.7(3) track the norm map when the Frobenius iterate changes: Θ normalizes it to ordinary base change, while the raw coordinate acquires N_d.

**Acceptance.**

- For π multiplication by n on an elliptic curve: regP(π^*u) = π^*regP(u) and π^* acts on H^1_dR by n.
- For a Fermat-curve quotient the symbol identity ∫_{(π^*f)} log(g)π^*ω = ∫_{(f)} log(Ng)ω holds.

- For an unramified quadratic base change, regSynCan,K′=(1+Φ/q²)·regSynCan,K after scalar extension. A proposed raw-coordinate equality without this factor fails on a nonzero Φ-eigenvector unless Φ/q² acts by zero on it.

**Sources.** [Ara2003](https://arxiv.org/abs/math/0301029v1), Lemmas 3.6–3.7, p. 8 — Pullback similitude; Lemma 3.7 gives the trace adjunction.. [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Proposition 8.6(2),(3) and Remark 8.7(3), author pp. 26–28 — The norm map for changing the Frobenius iterate gives the raw-coordinate factor; the normalized comparison removes it.

#### What bad or semistable reduction requires beyond good reduction

`PadicHodgeRegulators:D.5/semistable-input-boundary` — comparison.

For a smooth proper semistable curve X/K, NN Theorems A,B provide rational syntomic cohomology and compatible Chern classes; the arithmetic regulator factors through H¹_st(G_K,H¹_et(X_K̄,Q_p(2))). The semistable comparison imports the Hyodo–Kato (φ,N) structure from CohomologyComparisons CP.4. Besser–Zerbes Theorem 1.1 identifies Vologodsky integration with appropriately corrected/glued Coleman primitives on semistable curves. These two results alone do not give the weight-two symbol formula. The regulator-specific continuous/discrete coordinates and full second-kind pairing are specified by D.5/semistable-continuous-regulator and D.5/semistable-symbol-formula, using Besser2025 and BR2019. Those targets pair the continuous component with ker N and determine its class modulo im N; ker N is a restriction on test forms, not the regulator domain. The generic integration and syntomic producers remain external requests.

**Hypotheses.** X/K smooth proper with semistable reduction.

**Suggested declaration.** `semistable_input_boundary`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/log-syntomic-complex`, `PadicHodgeRegulators:D.2/syntomic-exponential`, `CohomologyComparisons:CP.4`, `PadicHodgeRegulators:D.5/coleman-symbol-formula`.

**Proof or construction.**

1. Import NN Theorems A,B, with the corrected degree H^i in Theorem 5.9; the factorization is into semistable cohomology, not an immediate H¹_dR identification.
2. Read Besser–Zerbes Theorem 1.1 as an integration comparison supplying glued primitives and harmonic corrections. Keep this input boundary separate from the source-supported regulator coordinates and formula in the two regulator-specific nodes; their integration producers belong to ColemanIntegration Part II.

**Acceptance.**

- Tate curve: the Coleman integrals become branch dependent, and the Vologodsky integral selects log_q (Besser–Zerbes §3).
- The good-reduction formula of D.5/coleman-symbol-formula is not asserted for any semistable curve.

**Sources.** [NN2016](https://arxiv.org/abs/1309.7620v5), Theorem B, p. 7 — The semistable factorisation.; [BZ2017](https://arxiv.org/abs/1711.06950v1), Theorem 1.1, p. 2 — Vologodsky integrals versus glued Coleman integrals..

#### The relative symbol regulator of a smooth curve family

`PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator` — construction.

Under the stated compactification, coherence and filtration assumptions, construct [−]_{U/S}:K²_M(A)→Ext¹_{Fil-F-MIC(S,σ)}(O_S,H¹(U/S)(2)). It factors the cup-symbol extension through Milnor bilinearity and Steinberg relations. Its Frobenius coordinate R_σ takes values in B†_K⊗_{B_K}H¹_dR(U/S); its Gauss–Manin coordinate is σ-independent, while R_σ depends on σ. For a smooth proper curve family X/S, classes in K²_M(A)_{∂=0} uniquely lift to extensions by H¹(X/S)(2). With the extra truncated-complex hypotheses, R_σ[ξ] is the NEGATIVE of the relative syntomic-symbol de Rham coordinate (AM Theorems 3.7 at n=1 and 4.5). The generic category of filtered F-isocrystals, connection, Ext, relative de Rham/rigid and relative syntomic carriers are imports, not definitions owned here.

**Hypotheses.** W=W(k) with k perfect of characteristic p≥3, K=Frac W; S=Spec B smooth affine over W, U=Spec A smooth affine over S. Use AM Theorem 3.7’s projective compactification Y→Q, boundary D∪f⁻¹(T) relative simple normal crossings, log-smooth (Y,M)→(Q,L), and a compatible system σ of p-Frobenius lifts on Q. AM Assumption 2.20: relative overconvergent rigid cohomology is coherent and compares to algebraic relative de Rham cohomology. Fil²H²_dR(U/S)=0; for the comparison, H¹ and H² of the truncated relative log de Rham complex ≥2 vanish modulo every p^m. For the proper refinement use exactly AM §4.1: Q is a smooth affine curve over W, T⊂Q is finite étale over W, S=Q\T, Y is a smooth quasi-projective surface over W, and f:Y→Q is projective and surjective with connected fibres. The deleted divisor D_X⊂X=Y\f⁻¹(T) is finite étale over S; U=X\D_X is affine. The vertical and horizontal boundary has relative simple normal crossings, the family is smooth over S, and every irreducible component of a singular fibre has multiplicity prime to p. The domain is ker ∂⊂K²_M(A), not all proper K₂ classes.

**Suggested declaration.** `relativeCurveSyntomicRegulator`.

**Direct prerequisites.** `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`, `PadicHodgeRegulators:D.5/curve-syntomic-regulator`, `K2SymbolsBrauer:T.3/tame-symbol`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`.

**Proof or construction.**

1. Construct successive logarithm extensions from the units representing ξ, apply relative cohomology and the filtration vanishing to form an extension. AM Theorem 2.23 proves additivity and Steinberg descent without assuming a nonexistent general Ext edge projector.
2. For ∂ξ=0, AM Lemma 4.2 and Proposition 4.3 use the residue/Gysin sequence: the open extension has trivial residue extension, and the weight of the boundary excludes Hom(O_S,N(2)), giving a unique proper lift.
3. Take the Frobenius and connection coordinates of the extension (AM §2.7). Compare to the directed relative syntomic cup-symbol; Theorems 3.7 and 4.5 have sign (−1)^1. Relate the absolute fibre to Besser’s regulator by Lemma 4.4/3.10, carrying this sign through the coordinate identification, not redefining Θ.
4. Route missing relative filtered F-MIC/Ext and relative syntomic machinery as external supplier requests. This node owns only the symbol-extension and regulator comparison.

**Acceptance.**

- ξ={f,1−f} with both units has zero extension and zero coordinate.
- At a σ-compatible W-valued smooth fibre, a tame-trivial ξ gives the absolute rigid syntomic regulator through AM Lemma 4.4; the negative relative Frobenius coordinate must be normalized before comparing with regP.

**API.**

- `relativeCurveSyntomicRegulator` (data): The symbol-extension homomorphism into imported Ext¹, with proper refinement on ker ∂.
- `relativeRegulator_frobeniusCoordinate` (projection): R_σ on the extension in B†_K⊗H¹_dR; the Gauss–Manin coordinate is separately σ-independent.
- `relativeRegulator_steinberg` (simp): [f,1−f]_{U/S}=0 where both functions are units.
- `relativeRegulator_tameKernel` (relation): The proper extension maps to the open extension and is unique on ker ∂.
- `relativeRegulator_signedComparison` (characterisation): R_σ[ξ]=−coord_syn,σ(ξ) under Theorem 4.5’s hypotheses.
- `relativeRegulator_ext` (extensionality): Two homomorphisms agree if they agree on every admissible Milnor symbol in their specified domain.

**Unit tests.**

- `relativeRegulator_steinberg_test` (computation): {t,1−t} on Spec W[t,(t−t²)⁻¹] has zero extension.
- `relativeRegulator_zero_symbol` (degenerate): The zero Milnor class gives the split extension and zero Frobenius/connection coordinates.
- `relativeRegulator_absolute_fibre` (compatibility): At S=Spec W the tame-kernel symbol agrees with the absolute syntomic regulator; R_σ carries the negative relative-coordinate convention.
- `relativeRegulator_nonzero_tame` (non-example): A symbol with a nontrivial tame symbol at D_X gives no proper extension via this construction; retaining its open regulator does not justify a proper one.
- `relativeRegulator_sign_test` (non-example): At n=1, replacing (−1)^n with +1 in the syntomic-coordinate square reverses a nonzero Frobenius coordinate.

**Used by.** PadicHodgeRegulators:D.5/smooth-family-specialisation: Specialize the relative extension and its syntomic coordinate to a smooth fibre..

**Sources.** [AM2022](https://arxiv.org/pdf/2007.14255v2), Theorem 2.23 and §2.7, pp. 18–20; Theorem 3.7, pp. 27–31; Proposition 4.3, Lemma 4.4, Theorem 4.5, pp. 34–36 — Relative symbol extensions, Frobenius coordinate and the signed syntomic comparison, including the proper-curve tame-kernel refinement..

**Planet.** Relative syntomic regulator of curve symbols.

#### Specialization of the regulator to a smooth fibre

`PadicHodgeRegulators:D.5/smooth-family-specialisation` — theorem.

For the preceding relative symbol extension and a W-valued smooth point α:S(W), require ev_α∘σ=F_W∘ev_α at every finite level. Pullback to α sends the Milnor symbol extension to the absolute extension of its specialized symbol ξ_α, and evaluates its R_σ coordinate to the absolute Frobenius coordinate. When k is finite, after the signed syntomic comparison and normalized boundary identification, this yields regP_{X_α}(ξ_α)=the normalized evaluated relative syntomic class in H¹_dR(X_α/K). For the proper refinement require ∂ξ=0 and the boundary remains étale at α. A fixed σ has only its Frobenius-compatible lifts; arbitrary α is handled by a σ adapted to that point where one exists, not by treating every evaluation as a Frobenius morphism.

**Hypotheses.** W=W(k) with k perfect of characteristic p≥3, K=Frac W; S=Spec B smooth affine over W, U=Spec A smooth affine over S. Use AM Theorem 3.7’s projective compactification Y→Q, boundary D∪f⁻¹(T) relative simple normal crossings, log-smooth (Y,M)→(Q,L), and a compatible system σ of p-Frobenius lifts on Q. AM Assumption 2.20: relative overconvergent rigid cohomology is coherent and compares to algebraic relative de Rham cohomology. Fil²H²_dR(U/S)=0; for the comparison, H¹ and H² of the truncated relative log de Rham complex ≥2 vanish modulo every p^m. For the proper refinement use exactly AM §4.1: Q is a smooth affine curve over W, T⊂Q is finite étale over W, S=Q\T, Y is a smooth quasi-projective surface over W, and f:Y→Q is projective and surjective with connected fibres. The deleted divisor D_X⊂X=Y\f⁻¹(T) is finite étale over S; U=X\D_X is affine. The vertical and horizontal boundary has relative simple normal crossings, the family is smooth over S, and every irreducible component of a singular fibre has multiplicity prime to p. The domain is ker ∂⊂K²_M(A), not all proper K₂ classes. α is Frobenius-compatible with the chosen σ and stays in the smooth locus; the symbol functions and tame-kernel condition specialize. The regP identification of the absolute fibre requires k finite, so K/Q_p is finite unramified. Over an arbitrary perfect k only the relative extension and Frobenius-coordinate specialization are asserted here.

**Suggested declaration.** `relativeRegulator_specialise`.

**Direct prerequisites.** `PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator`, `PadicHodgeRegulators:D.5/curve-weight-two-target`.

**Proof or construction.**

1. AM Lemma 2.8 gives pullback compatibility of cup symbols; the logarithm-extension construction and relative cohomology base change carry this to [−]_{U/S}. The proof of Theorem 3.7, pp. 28–31, evaluates at σ-compatible W-lifts (Lemma 3.8); this is the actual compatibility needed by R_σ.
2. Use the commutative fibre pullback square for the relative syntomic-symbol map. Keep its n=1 sign, use AM Lemma 4.4 for the absolute proper regulator, and then apply Θ to obtain the normalized de Rham statement.
3. For the hypergeometric-family acceptance example, Asakura Theorem 4.9 uses σ_α(t)=F_W(α)α^{−p}t^p, so ev_α is compatible. This illustrates the point-adapted choice; it does not assert a fixed σ works at all α. Asakura’s theorem is over W(F_p-bar); it illustrates the relative-coordinate compatibility. It is not itself an instance of the finite-unramified regP target without additional descent data.

**Acceptance.**

- Constant families and pullback symbols specialize to the same absolute regulator.
- Asakura Theorem 4.9, p. 435, at α reducing outside {0,1} supplies an explicit regulator coordinate for its ξ and σ_α; use the published hypergeometric value as source acceptance data, not an independently recomputed numeric test. Its W(F_p-bar) setting is used only for the point-adapted Frobenius coordinate; no finite-base descent or absolute regP identification is inferred.

**Used by.** PadicHodgeRegulators:D.5: Fulfils the smooth-family specialization target and exports it only with the relative extension, sign and Frobenius-compatible evaluation..

**Sources.** [AM2022](https://arxiv.org/pdf/2007.14255v2), Theorem 2.23 and §2.7, pp. 18–20; Theorem 3.7, pp. 27–31; Proposition 4.3, Lemma 4.4, Theorem 4.5, pp. 34–36 — Relative symbol extensions, Frobenius coordinate and the signed syntomic comparison, including the proper-curve tame-kernel refinement.; [Asakura2023](https://numdam.org/item/10.5802/jtnb.1250.pdf), Theorem 4.9 and Corollary 4.10, p. 435 — Explicit smooth-fibre formula with a Frobenius lift adapted to the chosen α..

**Planet.** Specialization of syntomic regulators.

#### Continuous and discrete regulators of semistable curves

`PadicHodgeRegulators:D.5/semistable-continuous-regulator` — construction.

The imported semistable cohomology is H¹ of D→D⊕D⊕H→D with d(w)=((φ−1)w,Nw,−I_πw) and d(x,y,z)=Nx+(1−pφ)y. For a cocycle choose w=(φ−1)⁻¹x and set ρ[(x,y,z)]=y−Nw∈ker(1−pφ), β_π[(x,y,z)]=z+I_πw∈H. Both descend to classes and give a Q_p-linear isomorphism H¹_st(K,V)≃H⊕ker(1−pφ). Define reg^c,π=β_π∘reg_syn and reg^d=ρ∘reg_syn. The discrete carrier is the fixed-eigenvalue kernel ker(1−pφ), contained in twisted weight −2, not automatically the whole weight −2 space. Under a uniformizer change, the branch derivative of the continuous component is −I_π reg^d (Besser Theorem 3.8); for curve N²=0 and λ=log(π′/π), the source period-change law yields reg^c,π′−reg^c,π=−λI_π reg^d−(λ²/2)I_πN reg^d. It reduces to the linear law when N reg^d=0; N²=0 alone does not give this additional vanishing. reg^c alone does not determine the full semistable class.

**Hypotheses.** K/Q_p finite; X/K smooth proper with a regular split semistable model, geometric smooth components and ordinary double points. Fix a uniformizer π and its logarithm branch. As in the read split-model treatment, require distinct components to meet at at most one point; multiedge/self-node generalization is not asserted here. V=H¹_et(X_Kbar,Q_p(2)), D=D_st(V), H=D_dR(V)=H¹_dR(X/K), Fil⁰D_dR(V)=Fil²H=0; import φ,N and I_π. Twisted Frobenius weights are −4,−3,−2, so φ−1 is invertible; N²=0. Domain is the weight-two geometrically trivial motivic/K₂ regulator domain supplied by the syntomic Chern classes; symbol evaluations use a finite presentation on the function field with trivial total tame symbols.

**Suggested declaration.** `semistableContinuousRegulator`.

**Direct prerequisites.** `PadicHodgeRegulators:D.5/semistable-input-boundary`, `PadicHodgeRegulators:D.2/etale-regulator`, `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `CohomologyComparisons:CP.4`.

**Proof or construction.**

1. Read the semistable extension complex of Besser §3. The identity Nφ=pφN makes d²=0. In the curve twist φ−1 is invertible by weights; subtract d(w) to normalize x to zero.
2. The remaining cocycle equation is (1−pφ)(y−Nw)=0; there is no remaining boundary with x=0 since φ−1 is injective. This establishes well-definedness, the two components and their inverse represented by (0,ρ,β). The linearity is Q_p-linear because φ is semilinear over K_0.
3. The Frobenius-invariant lift A of 1 in the extension has N′A=ρ; β=B−I_πA. Theorem 3.8 gives dβ/dlogπ=−I_πρ. Apply equation (3.6) to the extension: for λ=log(π′/π), exp(λN′)A=A+λρ+(λ²/2)Nρ since N²=0 on V. Thus β changes by −I_π(λρ+(λ²/2)Nρ). Equivalently integrate the derivative while I_πρ varies through I_π exp(λN)ρ. Keep the quadratic term unless Nρ=0. The generic H_st and period comparison remain owned externally.

**Acceptance.**

- For good reduction N=0, the twisted weight-one Frobenius has no eigenvalue p⁻¹, so ρ=0 and the continuous map reduces to the normalized crystalline regulator.
- A cocycle (0,y,0) with nonzero y∈ker(1−pφ) has β=0 but ρ=y; a claimed isomorphism from H_st to H alone would lose it.

**API.**

- `semistableContinuousRegulator` (data): β_π∘reg_syn into H, linear over Q_p on the rationalized motivic domain.
- `semistableDiscreteRegulator` (projection): ρ∘reg_syn into ker(1−pφ), a Q_p-vector space.
- `semistableCoordinates` (equivalence): H¹_st≃H⊕ker(1−pφ), using w=(φ−1)⁻¹x.
- `semistableCoordinates_boundary` (simp): Adding ((φ−1)a,Na,−I_πa) changes neither coordinate.
- `semistableRegulator_branchChange` (relation): dβ/dlogπ=−I_πρ; for λ=log(π′/π) and curve N²=0, β_π′−β_π=−λI_πρ−(λ²/2)I_πNρ. The linear formula needs Nρ=0.
- `semistableRegulator_ext` (extensionality): Equal continuous AND discrete components imply equality of the H_st regulator class.

**Unit tests.**

- `semistableCoordinates_good_reduction` (computation): N=0 and the smooth-curve twist give ρ=0; β equals the normalized crystalline coordinate.
- `semistableCoordinates_zero` (degenerate): The zero cocycle gives β=ρ=0.
- `semistableCoordinates_boundary_test` (compatibility): Adding d(a) replaces w by w+a, cancelling the changes in y and z.
- `semistableCoordinates_discrete_non_example` (non-example): (0,y,0) for nonzero fixed y has zero continuous coordinate and a nonzero discrete coordinate.
- `semistableCoordinates_weight_non_example` (non-example): For a semilinear weight−2 block without eigenvalue p⁻¹, ker(1−pφ)=0 although the block is nonzero; the weight space cannot replace the fixed kernel.
- `semistableCoordinates_branch_quadratic` (non-example): For N(a,b)=(b,0), ρ=(0,1) and I=id, the coordinate change is (−λ²/2,−λ), not (0,−λ). The condition N²=0 on the curve realization does not kill Nρ.

**Used by.** PadicHodgeRegulators:D.5/semistable-symbol-formula: The Vologodsky formula computes a pairing of reg^c,π, with discrete component and branch held explicit..

**Sources.** [Besser2025](https://arxiv.org/pdf/2502.16738v1), §3, equations (3.5)–(3.11), Proposition 3.3, proof of Proposition 3.5, Remark 3.6, Definition 3.7 and Theorem 3.8, pp. 6–9 — Semistable extension complex and continuous/discrete coordinates; the proof explicitly yields ker(1−pφ)..

#### The full semistable symbol formula on the monodromy kernel

`PadicHodgeRegulators:D.5/semistable-symbol-formula` — theorem.

Let u have a tame-trivial function-field presentation Σ_i n_i{f_i,g_i}, and let ω be a meromorphic form of the second kind whose de Rham class lies in ker N (N transported by I_π). Choose Z containing the singular supports, a semistable wide-open cover U_v, and the local Coleman primitives F_{ω,v} corrected so their annular differences c_ω(e)=F_{ω,head}−F_{ω,tail} are harmonic, giving the Vologodsky primitive. Then ⟨reg^c,π(u),[ω]⟩=Σ_i n_i(Σ_v ⟨log f_i,F_ω;log g_i⟩_{(U_v−Z)†}−Σ_{e∈E⁺}c_ω(e)⟨log f_i,log g_i⟩_e). Here the first bracket is the GLOBAL triple index on each wide open and the second is the oriented annular double index; E⁺ contains one orientation of each geometric edge. Equivalently the last sum is one half of the sum over both orientations. This formula computes the continuous regulator paired with ker N; by nondegenerate cup pairing and skew-adjointness of N it determines its image in H/(ker N)^⊥=H/im N. It does not compute reg^d or an unrestricted pairing on H. For holomorphic ω∈ker N it simplifies to Σ_i n_i∫^Vol_{(f_i)}log(g_i)ω, with local constant terms and traces. The logarithm branch and uniformizer are fixed throughout; changing them is governed by the preceding node. The totally degenerate toric quotient H/(Fil⁰+T⁰⊗Q_p) in Besser Theorem 7.6 is a separate comparison, not a replacement for this monodromy quotient.

**Hypotheses.** K/Q_p finite; X/K smooth proper with a regular split semistable model, geometric smooth components and ordinary double points. Fix a uniformizer π and its logarithm branch. As in the read split-model treatment, require distinct components to meet at at most one point; multiedge/self-node generalization is not asserted here. V=H¹_et(X_Kbar,Q_p(2)), D=D_st(V), H=D_dR(V)=H¹_dR(X/K), Fil⁰D_dR(V)=Fil²H=0; import φ,N and I_π. Twisted Frobenius weights are −4,−3,−2, so φ−1 is invertible; N²=0. Domain is the weight-two geometrically trivial motivic/K₂ regulator domain supplied by the syntomic Chern classes; symbol evaluations use a finite presentation on the function field with trivial total tame symbols. [ω]∈ker N; ω has zero residues. Use double/triple indices and harmonic gluing with the same edge, primitive and logarithm conventions as the cited papers.

**Suggested declaration.** `semistableRegulator_symbolFormula`.

**Direct prerequisites.** `PadicHodgeRegulators:D.5/semistable-continuous-regulator`, `PadicHodgeRegulators:D.5/coleman-symbol-formula`, `ColemanIntegration:L0/annulus-residue`, `K2SymbolsBrauer:T.3/tame-symbol`, `CohomologyComparisons:CP.4`.

**Proof or construction.**

1. Use the formula restated in Besser2025 §7, p. 28, from the arbitrary-reduction regulator paper’s Theorem 1.2/Proposition 3.7. Besser–Raskind §4, pp. 19–20, independently states the same formula and ker N restriction; its §3, pp. 10–11 fixes graph pairings as sums over unoriented edges. The local contribution is a global triple index, not just the holomorphic integral.
2. The ColemanIntegration Part II supplier must provide harmonic differences/gluing, annular double indices and global triple indices, with reciprocity eliminating changes of primitive and symbol presentation. Besser2025 Theorem 3.10, p. 9, supplies the holomorphic specialization using Vologodsky integration. State this as a source theorem conditional on those imported interfaces, not a consequence of BZ alone.
3. For the quotient, Poincaré duality makes the alternating pairing nondegenerate and N skew-adjoint, so (ker N)^⊥=im N by linear algebra. Thus all these pairings determine precisely the class modulo im N. Keep the discrete component from the extension-complex construction and the fixed branch separately.

**Acceptance.**

- On a smooth good-reduction model the graph has no edges; the holomorphic specialization becomes the established Coleman formula for regP.
- Reversing e changes both c_ω(e) and the double index sign, so the edge product is unchanged; summing both orientations without a factor 1/2 would double the correction.
- For a totally degenerate curve the vertex triple indices vanish (BR Theorem 4.7 proof, citing BdJ2012 Proposition 8.4). The edge expression is the logarithm of the Pál regulator, not a formula for all components of a general semistable class.

**Used by.** PadicHodgeRegulators:D.5: Fulfils the full semistable-symbol target with its continuous component, ker N test forms and explicit quotient..

**Sources.** [Besser2025](https://arxiv.org/pdf/2502.16738v1), Theorem 3.10, p. 9; §4, pp. 11–14; §7, p. 28 — Continuous regulator pairing, harmonic edge correction, full second-kind triple-index formula and monodromy restriction.; [BR2019](https://arxiv.org/pdf/1910.06877v1), §3, equations (3.1)–(3.5), pp. 10–11; Theorem 4.7 proof, pp. 19–20 — One edge orientation per graph pairing, full symbol formula with ker N, and the totally degenerate specialization..

**Planet.** Semistable symbol formula for the continuous regulator.

## External requests and remaining gaps

All eight stages have their targets planned. This describes planning coverage and leaves every external mathematical producer and open conjecture below visible. It does not close suppliers, prove global injectivity, or imply implementation closure.

- **MotivicEtaleKTheory:M.7.** Soulé's étale Chern classes c_{i,k} : K_{2i−k}(R; Z/n) → H^k_et(R, μ_n^{⊗i}) for rings R with n invertible (fields, p-adic integer rings with p ∤ n replaced by their generic fibres, number rings), natural in R, compatible with the coefficient maps n | n', with products and with transfers (corestriction), and Soulé's product formula — planned in the part of MotivicEtaleKTheory that needs only M.7 (étale K-theory), as RT-AREA-ktheory-2/18 directs, so that HabiroNumberFields HB.1/HB.2 and PadicHodgeRegulators D.2 import one construction. Consumers: `PadicHodgeRegulators:D.2/etale-regulator`.
- **MotivicEtaleKTheory:M.1.** The continuous realisation K_{2n−1}(F) → H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) obtained from the classes c_{n,1} with p-power coefficients, its agreement with the Kummer map for n = 1, and its compatibility with restriction and transfer. Consumers: `PadicHodgeRegulators:D.2/etale-regulator`.
- **Polylogarithms:P.4.** De Jeu's complexes M̃^{(n)}(F) (n ≥ 2; in weight two M̃^{(2)}(F) → ∧²F^×_Q) of a field of characteristic 0 and its subcomplex M̃^{(2)}(O) for a discrete valuation ring O ⊂ F generated by special units (Besser–de Jeu §3), with the map H^1(M̃^{(2)}(F)) → K_3^{(2)}(F) and its comparison, up to the sign fixed by de Jeu, with Suslin's isomorphism B(F) ⊗ Q ≅ K_3^ind(F) ⊗ Q of K3BlochGroups V.4/V.6; in weight n, the map H^1(M̃^{(n)}(F)) → K^{(n)}_{2n−1}(F) for number fields (an isomorphism for n = 2, 3 and for cyclotomic fields) and the cyclotomic symbols [ζ]_n. Consumers: `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison`.
- **CrystallineCohomology:CR.5.** Absolute log-crystalline cohomology RΓ_cr(X, J^{[r]})_n of fs log-schemes X log-smooth over O_K^× (O_K a complete DVR of mixed characteristic with perfect residue field, any ramification), with its divided-power filtration, Frobenius, base change in n and the Cartier-type hypotheses needed for the Hyodo–Kato comparison. Consumers: `PadicHodgeRegulators:D.2/log-syntomic-complex`.
- **CrystallineCohomology:CR.3.** Frobenius on absolute crystalline cohomology of smooth O_K-schemes, compatible with the PD filtration, used in the non-log case of the syntomic complex. Consumers: `PadicHodgeRegulators:D.2/log-syntomic-complex`.
- **CrystallineCohomology:CR.2.** The crystalline (PD) Poincaré lemma for the relative period rings A_cr(R) of small semistable O_K-algebras (Tsuji, as used by Colmez–Nizioł §4.7), identifying Galois cochains in the PD de Rham complex of the envelope with Galois cochains in [F^r A_cr(R) → A_cr(R)]. Consumers: `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`.
- **AInfCohomology:AI.4.** The relative period rings A_cr(R) and their filtration and Frobenius for small (semistable, log) O_K-algebras R, with the Galois action of G_R, as used in the local construction of the Fontaine–Messing–Kato period map. Consumers: `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`.
- **DerivedDeRhamCohomology:DD.2.** Algebraic de Rham cohomology of smooth K-schemes with its Hodge filtration, functorial in X, and the comparison of Fil^n RΓ_dR(X_K) with the de Rham term of rigid syntomic cohomology. Consumers: `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`.
- **PhiGammaModulesAndIwasawaCohomology:PG.5.** For p odd, E/Q_p finite and T a free O_E-lattice with continuous G_{Q_p}-action: instantiate PG.5/psi-complex on D(T) over O_E ⊗ A_{Q_p} with the actual ψ of PG.4; construct the quasi-isomorphism to SelmerIwasawaCohomology:L3/iwasawa-cohomology; prove that D(T)^{ψ=1} → lim_cor H^1(Q_p(μ_{p^n}), T) is a Λ_{O_E}(G_∞)-linear bijection whose n-th component (n ≥ 1) is Cherbonnier–Colmez's ℓ(γ_n)ι_{φ,γ_n}(x_n, y) (their Proposition I.4.1 cocycle); H^2_Iw ≅ D(T)/(ψ − 1); compatibility with O_{E'} ⊗ − and with H^1_Iw(V) = H^1_Iw(T) ⊗ Q. Consumers: `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`.
- **PhiGammaModulesAndIwasawaCohomology:PG.6.** Wach modules: for an E-linear crystalline V of G_{Q_p} with Hodge–Tate weights in [a; b] (HT(E(1)) = +1) and a G-stable O_E-lattice T, N(T) is free of rank d over O_E ⊗ A^+_{Q_p}, Γ-trivial modulo π, N(T) = N(V) ∩ D(T), φ(π^b N) ⊆ π^b N with π^b N/φ^*(π^b N) killed by q^{b−a}; N(T(j)) = π^{−j}N(T) ⊗ e_j; N(T) ⊆ φ^*N(T) when a ≥ 0; the inclusion-preserving lattice bijection (Berger, Limites III.4.2); and the φ-module isomorphism N(V)/πN(V) ≅ D_cris(V). Consumers: `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`, `PadicHodgeRegulators:L2/twist-compatibility`, `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`.
- **PhiGammaModulesAndIwasawaCohomology:PG.4.** The actual ψ on O_E ⊗ A_{Q_p} and on D(T): ψφ = id, ψ(φ(λ)x) = λψ(x), Γ-equivariance and integrality; ψ(π^{−1}) = π^{−1} and ψ(π^{−m}) = π^{−m}(p^{m−1} + πQ_m(π)) with Q_m ∈ Z_p[X] (Berger, Lemma A.4). Consumers: `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`.
- **PhiGammaModulesAndIwasawaCohomology:PG.1.** The O_E-linear Fontaine equivalence with D(T(η)) = D(T) ⊗ e_η for continuous characters η of G_∞ (φ and ψ acting on the first factor, g acting by η(g)g), D(O_{E'} ⊗ T) = O_{E'} ⊗ D(T), D(T) free and D(T) ⊂ D(V). Consumers: `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/twist-compatibility`, `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`.
- **CohomologyComparisons:CP.4.** CP.4 supplies the proper rational Hyodo–Kato comparison. Separately route the early integral/open prefix to the proposed contracts CohomologyComparisonsPartII:CS.0/classical-divided-and-undivided-syntomic; CohomologyComparisonsPartII:CS.1/integral-fontaine-messing-period; CohomologyComparisonsPartII:CS.2/divided-small-weight-comparison; CohomologyComparisonsPartII:CS.3/semistable-syntomic-exponential. Their precise statements are the four retained D.2 consumer interfaces, including ω/τ, divided exactness, directed Godement/topos map and rational exponential. These are proposed stable IDs, not existing CP.4 nodes. The CS.3 boundary must be ω_Q⁻¹δ_D in the EN period convention, rather than the unscaled quotient-coordinate boundary δ_U; the latter has α_U^FMδ_U=p^r exp_BK. No integral inverse to ω is requested. Consumers: `PadicHodgeRegulators:D.5/semistable-input-boundary`, `PadicHodgeRegulators:D.2/log-syntomic-complex`, `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`, `PadicHodgeRegulators:D.2/small-twist-comparison`, `PadicHodgeRegulators:D.2/syntomic-exponential`.
- **tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places.** The named semilocal equivalence F ⊗_Q Q_p ≅ ∏_{v|p} F_v (and O_F ⊗ Z_p ≅ ∏ O_v) with its characteristic property, as planned in that layer; this roadmap uses it as given. Consumers: `PadicHodgeRegulators:D.1/combined-dilogarithm`, `PadicHodgeRegulators:D.1/unit-logarithm-kernel`, `PadicHodgeRegulators:D.3/unramified-etale-algebra`, `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `PadicHodgeRegulators:L1/semilocal-bloch-kato`.
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group.** Import the local unit filtration, canonical Teichmüller splitting and p-adic log/exp isomorphism on sufficiently deep units from upstream Layer 1. For finite L/Q_p, kernel(log on O_L^×)=μ(L); for unramified L and odd p, log:1+pO_L≅pO_L. Check agreement with the pinned TauCeti.teichmuller section and Coleman’s Iwasawa branch, without rebuilding the upstream carrier. Consumers: `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`, `PadicHodgeRegulators:D.1/unit-logarithm-kernel`, `PadicHodgeRegulators:L1/integral-logarithm-unramified`.
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius.** Import finite unramified extension classification, existence/uniqueness of arithmetic Frobenius and the integer-ring identification O_L≅W(F_q), natural under embeddings and finite products, including the agreement of Frobenius with WittVector.frobenius. IsArithFrobAt only states a residue congruence; FormallyUnramified on the generic characteristic-zero field only states separability. Supply the specialized product interface retained at D.3/unramified-etale-algebra. Consumers: `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`, `PadicHodgeRegulators:D.3/unramified-etale-algebra`.
- **ArithmeticGaloisDuality:R02.4.** For K/Q_p finite and finite-dimensional continuous Q_p-representation V, provide the perfect cup-product pairings H^i(K,V)×H^{2−i}(K,V*(1))→Q_p, the invariant identification H²(K,Q_p(1))≅Q_p, finite-dimensional H^i(K,V), vanishing above 2 and the local Euler characteristic dim H⁰−dim H¹+dim H²=−[K:Q_p]dim V, obtained by finite coefficients, a stable lattice, inverse limits and rationalization. It must agree with the read D7/local-invariant-trivialization and D7/duality-after-localization pairings; a discrete class-formation Ext theorem alone is not this statement. The result must apply to every finite K/Q_p, without assuming that K is already presented as a completion of a chosen global field. Consumers: `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/dimension-formulas`, `PadicHodgeRegulators:L1/local-duality-of-conditions`, `PadicHodgeRegulators:L1/tate-twist-examples`, `PadicHodgeRegulators:L1/dual-exponential`.
- **PadicHodgeTheory:R06.1.** Continuous cohomology of B_dR⁺→B_dR for de Rham V, Hodge–Tate graded C_p cohomology and its filtration-limit compatibility, with the Kummer boundary used by BK Proposition 3.8, pp. 355–359. Required by the direct e/g proof, not finite ramified descent. Also supply Kato’s cup-with-log χ identification H^1(K,B_dR⊗V)≅D_dR(V) and the corresponding B_dR⁺ identification for de Rham V (FO Proposition 6.35; Berger Proposition II.5), used by the dual exponential. Consumers: `PadicHodgeRegulators:L1/local-duality-of-conditions`, `PadicHodgeRegulators:L1/dual-exponential`.
- **CohomologyComparisons:CP.4.** Relative syntomic-symbol and σ-compatible evaluation/base change for the proposed CS prefix, exactly AM2022 Theorem 3.7 and §4.1. CP.4 remains a routing anchor; its existing proper rational theorem does not supply this relative integral contract. Consumers: `PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator`, `PadicHodgeRegulators:D.5/smooth-family-specialisation`.
- **PadicDifferentialEquationsAndRigidCohomology:RD.4.** Route filtered F-MIC(S,σ), Ext¹, logarithm extensions and their σ-compatible pullback to the owner of relative filtered F-isocrystals/connections, alongside relative rigid/de Rham comparison. These are generic carriers imported by the regulator-specific extension of AM2022 §2, not a claim that current RD.4 already implements them. Consumers: `PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator`, `PadicHodgeRegulators:D.5/smooth-family-specialisation`.

### The dilogarithm formula for arbitrary Bloch elements (Besser–de Jeu Conjecture 1.14, n = 2)

That the p-adic regulator of the class of Σ n_i[z_i] ∈ B(F) ⊗ Q equals ±Σ n_i D(σ z_i) is proved only when every z_i is a special unit of the valuation ring at p (BdJ Theorems 1.6(2), 1.10) or a root of unity (Theorem 1.12). For general presentations it is BdJ's Conjecture 1.14, open even for n = 2 in every source read. GSWZ (19) asserts the general identity (sourceIssues E101). The packet defines D_p on completed K_3 as the regulator, so Theorem 9 and the Habiro export do not depend on the conjecture; only the explicit evaluation of D_p by dilogarithms of non-special symbols does.

Consumers: `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.4/special-unit-formula`.

### Sign of Cherbonnier–Colmez's δ_n against the Kummer cocycle

With τ[u_n] = [ε]^{c(τ)}[u_n], (1 − τ)(log[u_n]·t^{−1} ⊗ e_1) = −c(τ)e_1, so Cherbonnier–Colmez's δ_n appears to be minus the Kummer map τ ↦ τ(α)/α unless they use α/τ(α). The sign s of L2/kummer-coleman-comparison, and through it L3/tate-coleman-comparison's Col = −Col_0, must be fixed by a careful reading of CC99 §V.3; the computation in this job is not a confirmed source error.

Consumers: `PadicHodgeRegulators:L2/kummer-coleman-comparison`.

### Pushforward compatibility of the curve regulator

No source read proves that the rigid syntomic regulator on K_2 of curves commutes with finite pushforward. The node gives a route through the étale comparison (D.5/curve-etale-comparison) and corestriction compatibility of the étale regulator; Asakura and Besser–Loeffler–Zerbes use the compatibility without proof in the sources read.

Consumers: `PadicHodgeRegulators:D.5/curve-regulator-functoriality`.

### Coleman integration with colliding supports and in genus at least one

ColemanIntegration L1 integrates only on Y = 𝒳 ∖ D with D finite étale (one point of D per residue disc); symbols whose divisors collide modulo p need Coleman integration on general wide opens, which no layer owns. ColemanIntegration's recorded gaps 'Independence of the Frobenius lift and functoriality when Ω+ is not free' and 'Algebraic de Rham comparison for good-reduction affine curves' are inherited for genus ≥ 1.

Consumers: `PadicHodgeRegulators:D.5/coleman-symbol-formula`, `PadicHodgeRegulators:D.5/curve-syntomic-regulator`.

### K_2 integrality for curves of genus at least two

The identification K_2(𝒳)_Q → K_2(X)_Q ∩ ker(tame symbols) used to feed symbols into the regulator needs Harder-type finiteness; EllipticKTheory supplies it only for elliptic curves (E.5/harder-finiteness).

Consumers: `PadicHodgeRegulators:D.5/curve-syntomic-regulator`.

### Vologodsky integration has no owner

The regulator target is now sourced and planned, including the full second-kind formula, continuous/discrete components, ker N restriction and H/im N pairing quotient. ColemanIntegration Part II remains the proposed owner of harmonic gluing, Vologodsky integration and global triple/annular double indices; its producer nodes still need an external design job.

Consumers: `PadicHodgeRegulators:D.5/semistable-input-boundary`, `PadicHodgeRegulators:D.5/semistable-symbol-formula`.

### Early shared classical log-syntomic producer

The external CS.0–CS.3 contracts are now named with exact source-supported specifications and directed maps. CohomologyComparisons Part II must be created/planned by its own job; CP.4 is only the routing anchor and has no such producer nodes. Generic objects remain external; no ownership closure is claimed.

Consumers: `PadicHodgeRegulators:D.2/log-syntomic-complex`, `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`, `PadicHodgeRegulators:D.2/small-twist-comparison`, `PadicHodgeRegulators:D.2/syntomic-exponential`, `PadicHodgeRegulators:D.5/semistable-input-boundary`.

### Geometric hypotheses omitted from parameterized Lean prototypes

All packet declaration and API names now have elaborated Lean declarations, and every named test has a typed example. Native polynomial, finite-field, quotient, submodule, cochain-complex and linear-map carriers are used. Continuous cohomology, period realizations, K-theory, filtered F-MIC/Ext and integration are named imported type/map parameters; their source-specific geometry, topology, completion and comparison hypotheses are explicitly omitted under PROTOCOL §13. Several named theorem prototypes expose only representative clauses of their full statements. Successful elaboration validates these types, not their omitted hypotheses, geometric applications, numerical source assertions or proofs. Replace the parameters and restore those conditions when the external suppliers exist; implementation remains unchecked.

Consumers: `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`, `PadicHodgeRegulators:L0/fundamental-exact-sequences`, `PadicHodgeRegulators:L0/integral-period-interface`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `PadicHodgeRegulators:L1/bloch-kato-exponential`, `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L1/dual-exponential`, `PadicHodgeRegulators:L1/dimension-formulas`, `PadicHodgeRegulators:L1/local-duality-of-conditions`, `PadicHodgeRegulators:L1/twist-and-change-of-field`, `PadicHodgeRegulators:L1/tate-twist-examples`, `PadicHodgeRegulators:L1/abelian-variety-logarithm`, `PadicHodgeRegulators:L1/integral-logarithm-unramified`, `PadicHodgeRegulators:L1/semilocal-bloch-kato`, `PadicHodgeRegulators:L2/fontaine-iwasawa-map`, `PadicHodgeRegulators:L2/generator-independence`, `PadicHodgeRegulators:L2/root-change`, `PadicHodgeRegulators:L2/local-iwasawa-twist`, `PadicHodgeRegulators:L2/twist-compatibility`, `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`, `PadicHodgeRegulators:L2/character-specialisation`, `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`, `PadicHodgeRegulators:L2/kummer-coleman-comparison`, `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`, `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`, `PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`, `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`, `PadicHodgeRegulators:D.1/combined-dilogarithm`, `PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`, `PadicHodgeRegulators:D.1/unit-logarithm-kernel`, `PadicHodgeRegulators:D.1/logarithm-norm-trace`, `PadicHodgeRegulators:D.2/etale-regulator`, `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`, `PadicHodgeRegulators:D.2/syntomic-regulator`, `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`, `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`, `PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison`, `PadicHodgeRegulators:D.2/gros-normalisation`, `PadicHodgeRegulators:D.2/log-syntomic-complex`, `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`, `PadicHodgeRegulators:D.2/small-twist-comparison`, `PadicHodgeRegulators:D.2/syntomic-exponential`, `PadicHodgeRegulators:D.3/unramified-etale-algebra`, `PadicHodgeRegulators:D.3/completed-k3-unramified`, `PadicHodgeRegulators:D.3/completed-k3-bloch-description`, `PadicHodgeRegulators:D.3/finite-polylogarithm`, `PadicHodgeRegulators:D.3/finite-polylogarithm-reduction`, `PadicHodgeRegulators:D.3/dilogarithm-integrality`, `PadicHodgeRegulators:D.3/residue-spanning`, `PadicHodgeRegulators:D.3/root-of-unity-classes`, `PadicHodgeRegulators:D.3/local-regulator`, `PadicHodgeRegulators:D.3/unramified-regulator-theorem`, `PadicHodgeRegulators:D.3/roots-of-unity-generate`, `PadicHodgeRegulators:D.4/global-p-adic-regulator`, `PadicHodgeRegulators:D.4/special-unit-formula`, `PadicHodgeRegulators:D.4/norm-trace-compatibility`, `PadicHodgeRegulators:D.4/frobenius-compatibility`, `PadicHodgeRegulators:D.4/torsion-and-denominators`, `PadicHodgeRegulators:D.4/habiro-regulator-export`, `PadicHodgeRegulators:D.4/padic-k3-regulator-injectivity`, `PadicHodgeRegulators:D.4/example-cubic-field-five-two`, `PadicHodgeRegulators:D.5/curve-weight-two-target`, `PadicHodgeRegulators:D.5/open-curve-splitting`, `PadicHodgeRegulators:D.5/curve-syntomic-regulator`, `PadicHodgeRegulators:D.5/coleman-symbol-formula`, `PadicHodgeRegulators:D.5/curve-etale-comparison`, `PadicHodgeRegulators:D.5/curve-regulator-functoriality`, `PadicHodgeRegulators:D.5/semistable-input-boundary`, `PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator`, `PadicHodgeRegulators:D.5/smooth-family-specialisation`, `PadicHodgeRegulators:D.5/semistable-continuous-regulator`, `PadicHodgeRegulators:D.5/semistable-symbol-formula`.

### Relative filtered F-isocrystal and syntomic producers

The source-supported relative symbol-extension and specialization targets are planned here, but the generic Fil-F-MIC/Ext, relative rigid/de Rham comparison and relative syntomic evaluation producers must be routed externally by their owner. Stage-only supplier IDs are requests, not existing complete contracts. The domain remains the tame-kernel Milnor symbols and Frobenius-compatible smooth points of the read source.

Consumers: `PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator`, `PadicHodgeRegulators:D.5/smooth-family-specialisation`.

## Source corrections retained from the independent review

All 17 findings were independently checked again in round 2 on 8 October 2026: 16 are confirmed within the stated version/scope and E103 is rejected. The round-2 review supersedes the first review object; its report retains the previous objections and their resolutions. Mathematical statements use the reviewed corrections, including the weaker proved CN bound N(K,p,r), the safe NN exponential ranges and the distinct curve Frobenius normalizations. E103 remains rejected as an established error: differently normalized higher-weight Gros and de Jeu symbols were not identified merely by comparing factorials. No source passage is reproduced here.

- **PadicHodgeRegulators/E101** (GSWZ2024, §1.5, after (19), p. 9 (arXiv 2412.04241v2)): confirmed. Besser–de Jeu Theorem 1.6(2) (and 1.10, 1.12) shows the coincidence only on classes presented by special units of the valuation ring (and on roots of unity); the identity for arbitrary elements is their Conjecture 1.14. D_p should be defined on K_3(K_p; Z_p) as the regulator, and the dilogarithm formula used only for special-unit presentations at p, which covers GSWZ's uses (Lemma 3.1 concerns special units; the Nahm and knot examples use global units).
- **PadicHodgeRegulators/E102** (GSWZ2024, Theorem 9 and proof, p. 39 (arXiv 2412.04241v2)): confirmed. For K_p = ∏_i Q_{p^{s_i}} with more than one factor and ζ restricted to roots of unity with every component ≠ 1 (GSWZ E38), generation needs Proposition 3.3 in a product form: the Z_p-span of {p^{−2}D(ζ) − p^{−2}D(ζ')} is also Z_{p^s} (D.3/residue-spanning (b), (c)), which follows from the same counting bound. For the nonzero admissible domain use (p^s−2)/(p−2) when s>1; s=1 requires the separate zero/nonzero-value argument, not the original q−1 count.
- **PadicHodgeRegulators/E103** (BdJ2003, Remark 1.13, p. 6 (arXiv math/0110334v2)): rejected. On identical de Jeu symbols, applying (1−σ/p^n) preserves the factor ε_n(n−1)!. Before comparing with Gros’s separate higher-weight formula one must identify its symbol map and Chern-class normalization. That identification has not been established, so no source correction is asserted here; in weight two the factorial is 1.
- **PadicHodgeRegulators/E104** (BdJ2003, Proof of Theorem 1.12, p. 41 (arXiv math/0110334v2)): confirmed. Include s=1 in the distribution argument and carry the factor ±(n−1)! in the special-unit regulator value; the latter is already restored in the published version.
- **PadicHodgeRegulators/E105** (BdJ2003, Proof of Lemma 4.10 and (4.4), pp. 24–25 (arXiv math/0110334v2)): confirmed. (dω, (1 − φ∗/q^n)ω − dε), as the cone differential (4.1) d(a, b) = (da, f(a) − db) requires; and '(ω, η)' should read (ω, ε).
- **PadicHodgeRegulators/E106** (CN2017, §1, p. 2 and §2.4.3, p. 23 (arXiv 1505.06471v4)): confirmed. 0 ≤ b(r) ≤ p − 2 (equivalently a(r) = ⌊r/(p − 1)⌋, as in Nekovář–Nizioł §4.1).
- **PadicHodgeRegulators/E107** (CN2017, Theorem 1.1(ii), p. 2, against Theorem 5.4(ii), p. 54 (arXiv 1505.06471v4)): confirmed. The proof supports the conservative N(K,p,r) of Theorem 5.4(ii). Dependence only on e is not established by the descent argument read here; the stronger introduction claim is not disproved.
- **PadicHodgeRegulators/E108** (NN2016, Remark 4.14, p. 54 (arXiv 1309.7620v5)): confirmed. Assume r ≥ q + 2.
- **PadicHodgeRegulators/E109** (NN2016, Theorem 5.9, p. 59 (arXiv 1309.7620v5)): confirmed. H^i in place of H^{i+1}, as in Theorem B (p. 7).
- **PadicHodgeRegulators/E110** (NN2016, Proposition 2.16, p. 15 (arXiv 1309.7620v5)): confirmed. Exclude the trivial representation: the stated F¹=0 hypothesis is insufficient. The proof’s H²=0 step additionally excludes Q_p(1), for example by requiring F^{-1}D_K=0. No optimal corrected general theorem for F⁰=0 is claimed; use the verified stronger ranges in applications.
- **PadicHodgeRegulators/E111** (HK2011, Definition 0.4.5, p. 6 (arXiv math/0612611v1)): confirmed. Tr(x_{σ(1)} ∘ ⋯ ∘ x_{σ(2n−1)}).
- **PadicHodgeRegulators/E112** (Berger2003, Lemma II.1, p. 10 (arXiv math/0209283v1)): confirmed. The second case is n=0, and the statement requires ψ(y)=y as used by its proof and applications; both defects are corrected in the published lemma.
- **PadicHodgeRegulators/E113** (FO, Proof of Proposition 6.36(1), p. 150): confirmed. Non-vanishing (dimension 1) follows from the Euler characteristic formula, since H^0(Q_p(−1)) = H^2(Q_p(−1)) = 0; Tate duality pairs H^1(Q_p(−1)) with H^1(Q_p(2)), not with H^0.
- **PadicHodgeRegulators/E114** (HK2, Appendix A, Proposition A.3, p. 47 (arXiv math/0101071v2)): confirmed. (O_F^*)^∧.
- **PadicHodgeRegulators/E115** (Berger2003DM, Proof of Theorem A.3, p. 126 (Documenta version)): confirmed. With the paper's convention (positive = Hodge–Tate weights ≤ 0, p. 105) the case treated has weights ≥ 0; 'positive' should read 'with nonnegative Hodge–Tate weights'.
- **PadicHodgeRegulators/E116** (LZ2014, §2, p. 7 (arXiv 1108.5954v3)): confirmed. [Ber03, Theorem A.3] (Theorem A.2 is the characterisation of Wach modules).
- **PadicHodgeRegulators/E117** (AC20, Remark 3.2(1), p. 15 (arXiv 2003.08888v2)): confirmed. [Be1, Proposition 8.6.3], as Besser–de Jeu cite the same item.

## Source versions

The packet records original reading and revision reading separately, with hashes and locators. This document organizes the mathematics by regulator targets; it is not a sequential summary of any source. Public author/preprint or journal copies were used for the revision; no restricted-library file or source passage is part of the deliverables.

- [The Habiro ring of a number field](https://arxiv.org/abs/2412.04241v2), Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier. arXiv:2412.04241v2 (27 August 2025); no journal version
- [The syntomic regulator for the K-theory of fields](https://arxiv.org/abs/math/0110334v2), Amnon Besser, Rob de Jeu. arXiv:math/0110334v2 (15 December 2001); published Ann. Sci. École Norm. Sup. (4) 36 (2003), 867–924
- [A p-adic analogue of the Borel regulator and the Bloch–Kato exponential map](https://arxiv.org/abs/math/0612611v1), Annette Huber, Guido Kings. arXiv:math/0612611v1 (20 December 2006); published J. Inst. Math. Jussieu 10 (2011), 149–190
- [Karoubi's relative Chern character, the rigid syntomic regulator, and the Bloch–Kato exponential map](https://arxiv.org/abs/1111.4109v4), Georg Tamme. arXiv:1111.4109v4 (21 July 2014)
- [Syntomic cohomology and p-adic regulators for varieties over p-adic fields](https://arxiv.org/abs/1309.7620v5), Jan Nekovář, Wiesława Nizioł (appendix by Laurent Berger). arXiv:1309.7620v5 (22 September 2016)
- [Syntomic complexes and p-adic nearby cycles](https://arxiv.org/abs/1505.06471v4), Pierre Colmez, Wiesława Nizioł. arXiv:1505.06471v4 (29 May 2016); published Invent. Math. 208 (2017)
- [Bloch and Kato's exponential map: three explicit formulas](https://arxiv.org/abs/math/0209283v1), Laurent Berger. arXiv:math/0209283v1 (21 September 2002)
- [Bloch and Kato's exponential map: three explicit formulas](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Laurent Berger. Documenta Mathematica, Extra Volume Kato (2003), 99–129
- [Théorie d'Iwasawa des représentations p-adiques d'un corps local](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Frédéric Cherbonnier, Pierre Colmez. J. Amer. Math. Soc. 12 (1999), 241–268; author's recompiled PDF (28 pp.), page numbers of that PDF
- [Limites de représentations cristallines](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf), Laurent Berger. Compos. Math. 140 (2004) 1473–1498; author PDF
- [Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Antonio Lei, David Loeffler, Sarah Livia Zerbes. arXiv:0912.1263v3 (18 October 2010); published Asian J. Math. 14 (2010)
- [Iwasawa theory and p-adic L-functions over Z_p^2-extensions](https://arxiv.org/pdf/1108.5954v3), David Loeffler, Sarah Livia Zerbes. arXiv:1108.5954v3 (22 April 2014); accepted version of Int. J. Number Theory 10(8) (2014)
- [Theory of p-adic Galois representations](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Jean-Marc Fontaine, Yi Ouyang. book draft (author PDF)
- [Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Karl Rubin. Annals of Mathematics Studies 147 (2000); author PDF of 4 August 1999
- [Bloch–Kato conjecture and main conjecture of Iwasawa theory for Dirichlet characters](https://arxiv.org/abs/math/0101071v2), Annette Huber, Guido Kings. arXiv:math/0101071v2; published Duke Math. J. 119 (2003)
- [Les nombres de Tamagawa locaux et la conjecture de Bloch et Kato pour les motifs Q(m) sur un corps abélien](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), Denis Benois, Thong Nguyen Quang Do. Ann. Sci. École Norm. Sup. (4) 35 (2002), 641–672 (numdam)
- [Appendice: Sur un théorème de Bloch et Kato (lettre à B. Perrin-Riou)](https://www.imo.universite-paris-saclay.fr/~fontaine/bpr.pdf), Jean-Marc Fontaine. Invent. Math. 115 (1994), 151–161; author PDF
- [p-adic heights and p-adic Hodge theory](https://arxiv.org/abs/1412.7305v1), Denis Benois. arXiv:1412.7305v1
- [F-isocrystal and syntomic regulators via hypergeometric functions](https://arxiv.org/abs/1711.08854v2), Masanori Asakura, Kei Miyatani. arXiv:1711.08854v2
- [A numerical approach toward the p-adic Beilinson conjecture for elliptic curves over Q](https://arxiv.org/pdf/2003.08888v2), Masanori Asakura, Masataka Chida (Appendix B by François Brunault). arXiv:2003.08888v2 (8 September 2020)
- [The syntomic regulator for K4 of curves](https://arxiv.org/pdf/1208.0516v1), Amnon Besser, Rob de Jeu. arXiv:1208.0516v1 (2 August 2012)
- [p-adic Arakelov theory](https://arxiv.org/abs/math/0301029v1), Amnon Besser. arXiv:math/0301029v1; published J. Number Theory 111 (2005)
- [Vologodsky integration on curves with semi-stable reduction](https://arxiv.org/abs/1711.06950v1), Amnon Besser, Sarah Livia Zerbes. arXiv:1711.06950v1 (19 November 2017)
- [TauCeti/NumberTheory/LocalField/Teichmuller.lean](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), The Tau Ceti contributors. Tau Ceti commit f790474821cf4256814db967cb154e7af3d0c369
- [Syntomic regulators and p-adic integration I: rigid syntomic regulators](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Amnon Besser. Public author PostScript; Israel J. Math. 120 (2000), 291–334
- [L-functions and Tamagawa numbers of motives](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf), Spencer Bloch and Kazuya Kato. Public seminar scan; Grothendieck Festschrift I (1990), 333–400
- [Syntomic cohomology and p-adic motivic cohomology](https://arxiv.org/pdf/1603.01705v2), Veronika Ertl and Wiesława Nizioł. arXiv:1603.01705v2; locators use this version
- [Milnor K-theory, F-isocrystals and syntomic regulators](https://arxiv.org/pdf/2007.14255v2), Masanori Asakura and Kazuaki Miyatani. arXiv:2007.14255v2; published JIMJ 23 (2024), 1357–1415
- [New p-adic hypergeometric functions and syntomic regulators](https://numdam.org/item/10.5802/jtnb.1250.pdf), Masanori Asakura. Journal de Théorie des Nombres de Bordeaux 35 (2023), 393–479; published PDF
- [Regulators and derivatives of Vologodsky functions with respect to log(p)](https://arxiv.org/pdf/2502.16738v1), Amnon Besser. arXiv:2502.16738v1; all locators use this version
- [Toric regulators](https://arxiv.org/pdf/1910.06877v1), Amnon Besser and Wayne Raskind. arXiv:1910.06877v1; locators use this version

## Suggested Lean file

The suggested file is not this roadmap and is not exhaustive. Its declarations suggest names and signatures, with explicitly unproved obligations. Existing polynomial, finite-field and linear-algebra carriers are used directly. Imported representation, period, cohomology, K-theory and integration carriers are supplied as named type and map parameters; absent geometric, continuity, topology or comparison hypotheses are explicitly identified beside those prototypes. Such a parameterized signature is not a construction of its supplier or a proof of its geometric application. The packet remains `implementationStatus: unchecked` throughout.
