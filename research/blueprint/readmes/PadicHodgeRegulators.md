# P-adic regulators and the local K₃ calculation

This roadmap constructs local and semilocal p-adic regulators, fixes their Chern-class and Bloch–Kato normalizations, and compares them with explicit Coleman functions. Its first principal theorem is the isomorphism

\[
D_L:K_3(L;\mathbf Z_p)\xrightarrow{\sim}p^2\mathcal O_L
\]

for p > 3 and every finite unramified étale algebra L over Q_p. The group on the left is derived p-completed K-theory, not the ordinary K-group tensored without justification. Its generators are the completed classes of tame roots of unity whose every component differs from 1. The proof combines integral Bloch–Kato comparison, finite-polylogarithm reduction, residue-space spanning, and the independently imported equal-rank theorem.

The second principal construction is the vector-valued crystalline Iwasawa regulator. It has explicit ramified-character and unramified-character interpolation, with Euler factors, Gauss sums, factorials, inverse-character conventions and growth orders specified. Its Wach coordinates give Coleman maps and their image conditions. Arbitrary crystalline twists first take values in the total fraction algebra of analytic distributions; an analytic-valued assertion requires a proved cancellation range. General de Rham Robba modules have a separate character-domain construction.

For curves the roadmap distinguishes the raw syntomic class, the canonical syntomic coordinate and the Bloch–Kato-normalized regulator. Relative families retain their compactification and vanishing hypotheses. Semistable curves have continuous and discrete regulator components; a formula paired against ker N does not determine both components. Global p-adic regulator injectivity is a conjectural target and is not a consequence of the local theorem.

**Independent review, 19 October 2026: needs changes.** The 132 intended targets have been checked, together with their sources, library baseline, supplier contracts, APIs and tests. This reader renders the intended corrected mathematical view. The current atlas merger reads only `nodes`: it ignores this root packet’s imports, source aliases and 27 correction records. With the two parts present it therefore retains uncorrected declarations for 26 targets, including a dual-exponential formula with reversed pairing arguments. The root packet alone contributes one declaration. A supported assembly or coordinated canonical migration is required before promotion; the parts’ earlier acceptance does not approve this mismatch. See [the independent report](../reviews/REV-PadicHodgeRegulators.md).

The review retains the 21 explicit mathematical/supplier gaps and adds the assembly blocker as a separate gap. All ten stages remain planned, with none closed. The source register now has 25 independently checked entries: 24 confirmed and the higher-weight Gros factorial allegation rejected. Three GSWZ entries were already known from the paper review and are now also recorded in this packet.

## Conventions and the imported library

Write v_r=ε^{⊗r} for the chosen representation vector of Q_p(r), and d_r=t^{-r}⊗v_r for its canonical de Rham/crystalline vector. The source notation e_r denotes d_r in the Bloch–Kato and local-regulator formulas, but denotes v_r inside the étale/Wach module and cocycle formulas. This dictionary is used before composing those formulas. Changing ε changes t and v_r together and preserves d_r.

**hodgeTate**. Hodge–Tate weights in the convention HT(Q_p(1)) = +1: h is a weight when Fil^{−h}D_dR ≠ Fil^{−h+1}D_dR (as in PadicHodgeTheory R06.2, R06.4, the L3–L4 conventions and Lei–Loeffler–Zerbes). Sources with the opposite sign are translated.

**periods**. t = log[ε] for a fixed compatible system ε of p-power roots of unity; e_r = t^{−r} ⊗ ε^{⊗r} is the canonical basis of D_dR(Q_p(r)), independent of ε, with φ(e_r) = p^{−r}e_r; D_dR(Q_p(r)) is identified with K through e_r. In L2 only, the notation e_j inside D(T(j)), N(T(j)) and cocycles denotes the chosen representation basis ε^{⊗j}, not the canonical de Rham vector above; it scales by a^j when ε is replaced by ε^a.

**frobenius**. Arithmetic Frobenius throughout (φ(ζ) = ζ^p on roots of unity of order prime to p); sources using the geometric Frobenius (Huber–Kings 2003) are converted.

**logarithm**. The Iwasawa branch log_p(p) = 0 of ColemanIntegration:L0/iwasawa-logarithm; D_p(z) = Li_2(z) + ½ log_p(z) log_p(1 − z) is Coleman's D for this branch, equal to Besser–de Jeu's L_mod,2.

**regulators**. Soulé's étale regulator uses Chern classes; Besser's syntomic regulator reg_syn = η ∘ c^syn satisfies r^et = exp_BK ∘ reg_syn with no constant; D_p on completed K_3 is ε·log_BK ∘ c_{2,1} with the sign ε fixed by D_p([ζ]) = Li_2(ζ); Gros's normalisation is (1 − σ/p²)·D_p. For good-reduction curves, regP=Θ∘reg_syn=log_BK∘r_et and regSynCan=(1−Φ/q²)regP, with the explicit norm comparison β and transported K-action of D.5. Semistable curves have separate continuous reg^c,π and discrete reg^d coordinates; the symbol pairing is on ker N with a fixed uniformizer/branch. Relative AM Frobenius coordinates use a negative syntomic-coordinate comparison at n=1.

**kTheory**. K_3(L; Z_p) is π_3 of the p-completed K-theory spectrum (KTheoryFiniteLocalFields:L.1/completed-k-theory); for p > 3 and L unramified it is free of rank [L : Q_p] and equals the completion of Suslin's Bloch group.

**cyclotomic**. The LLZ source assumes odd p, uses HT(Q_p(1))=+1 and separates G=Delta times Gamma_1. R=Lambda_E(Gamma_1)=O_E[[X]][1/varpi], X=gamma-1, has bounded coefficients. It is not all of E[[X]]. The generic algebraic statements do not silently assume the source arithmetic hypotheses have been proved.

**evaluation**. Evaluation context: E is a field; R is a nonzero commutative E-algebra which is a domain; d,m are natural numbers; x:Fin m to E is injective; t is in R; ev_j:R to E are E-algebra homomorphisms with ev_j(t)=x_j. Each q_j=t-algebraMap(x_j) is NONZERO, and ev_j(f)=0 iff q_j divides f. J is a finite set of evaluation indices; V_j is an E-subspace of E^d. For the analytic application x_j belongs to the maximal ideal. Distinctness, the domain hypothesis and nonzero q_j are substantive, separate requirements.

**matrices**. Vectors of coefficients are rows; vectors of basis elements are columns. Domain basis n'=Un changes coordinates by U inverse. M maps bounded coordinates to analytic coordinates and changes by U M B inverse when the target basis changes by B. Apply the coefficient homomorphism to U where its ring differs from that of M.

**determinants**. Equality of principal determinant ideals is represented by association of nonzero generators; a basis does not choose a canonical scalar normalization.

**integral**. A nonzero determinant over O is not necessarily a unit. Constant O-integral basis changes preserve lattices. Finite-index integral image is weaker than surjectivity and rational surjectivity is weaker still.

The period rings, continuous Galois cohomology, completed K-theory, local-field structure, distribution algebras and Wach modules are imported from their owners. L0 records conventions and comparison interfaces; it introduces no new period-ring carrier. The integral finite-weight Bloch–Kato image is asserted in the unramified range 2 ≤ r ≤ p−2. The classical divided syntomic small-weight comparison has r ≤ p−2; bounded undivided comparisons and rational semistable exponentials are distinct assertions.

The pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Existing local-field and global-local structure belongs to the upstream **LocalFieldsRamification** and **NumberFieldArithmetic** roadmaps. The Teichmüller section and finite Kummer class at these pins do not supply completed continuous Kummer theory or the regulator engine.

Current upstream **LocalGaloisGroups Layer 7, Steps 1–2** also owns the completed multiplicative carrier A(L)=lim_m L×/(L×)^(p^m), its transition maps, Z_p-action, Galois action and torsion/free-quotient description. The Selmer supplier must reuse that carrier when proving the continuous Kummer comparison. That cohomological comparison and the completed Chern/regulator maps are separate targets. This screen used upstream roadmap commit `0d144d04` and current Tau Ceti commit `a91d3aa`; the pinned baseline remains unchanged.

### Library interfaces

| Declaration | Exact support used |
| --- | --- |
| `mathlib:Algebra.norm` | The norm S →* R of an R-algebra as the determinant of multiplication. |
| `mathlib:Algebra.trace` | The trace S →ₗ[R] R of an R-algebra as the trace of multiplication. |
| `mathlib:FreeAbelianGroup` | The free abelian group on a type, the group of formal symbols [z]. |
| `mathlib:IsArithFrobAt` | Predicate stating the arithmetic residue congruence at an ideal; it does not construct the unramified Frobenius automorphism (imported upstream). |
| `mathlib:Module.Free` | The predicate that a module is free. |
| `mathlib:OrzechProperty` | Commutative rings have the Orzech property: a surjection onto a finitely generated module from a submodule (or through an injection) is injective; used for 'surjective between free modules of equal rank implies injective'. |
| `mathlib:PadicComplex` | ℂ_[p], the completion of the algebraic closure of ℚ_[p]. |
| `mathlib:Polynomial` | Polynomial rings, the carrier of the finite polylogarithm. |
| `mathlib:Submodule.span` | The span of a set in a module. |
| `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot` | Nakayama's lemma: for N' finitely generated and I ≤ jacobson ⊥, N' ≤ N ⊔ I•N' implies N' ≤ N; used to lift spanning modulo p. |
| `mathlib:WittVector` | p-typical Witt vectors W(R). |
| `mathlib:WittVector.frobenius` | Witt-vector Frobenius ring homomorphism; the unramified integer-ring classification and equality with arithmetic Frobenius are imported upstream, not supplied by this declaration alone. |
| `mathlib:ZMod` | ℤ/nℤ, in particular 𝔽_p. |
| `mathlib:bernoulli` | Bernoulli numbers with B_1 = −1/2 (bernoulli n = (−1)^n bernoulli' n). |
| `tauceti:TauCeti.teichmuller` | The Teichmüller lift 𝓀[K]ˣ →* 𝒪[K]ˣ of a nonarchimedean local field. |
| `tauceti:TauCeti.residue_teichmuller` | The Teichmüller lift is a section of reduction. |
| `tauceti:TauCeti.eq_teichmuller` | A (q−1)-torsion unit reducing to α is the Teichmüller lift of α. |
| `tauceti:TauCeti.range_teichmuller` | The image of the Teichmüller lift is μ_{q−1}(𝒪[K]). |
| `tauceti:TauCeti.kummerClassMap` | Finite-coefficient injective Kummer class map Kˣ/(Kˣ)^n→H¹(G_K,μ_n); the continuous p-adic identification and inverse-limit compatibility are supplied by SelmerIwasawaCohomology L0. |
| `mathlib:IsLocalRing.isUnit_one_sub_self_of_mem_nonunits` | For a nonunit a in a local ring, 1-a is a unit. |
| `mathlib:IsLocalRing.maximalIdeal` | Existing maximal ideal as the ideal of nonunits. |
| `mathlib:Module.Basis` | Existing algebraic basis carrier and coordinate equivalence; no new generic basis type. |
| `mathlib:Module.Basis.extend` | Extend a linearly independent subset of an E-vector space to a basis. |
| `mathlib:Module.Basis.constr_apply_fintype` | A linear map is the finite sum of input coordinates times its values on basis vectors. |
| `mathlib:Lagrange.interpolate` | Existing polynomial interpolation operator. |
| `mathlib:Lagrange.eval_interpolate_at_node` | Interpolation evaluates to the prescribed value when the nodal map is injective on the finite index set. |
| `mathlib:Matrix.det_mul` | Multiplicativity of finite matrix determinants over a commutative ring. |
| `mathlib:Matrix.vecMulBilin` | Bilinear row-vector matrix multiplication with the stated scalar compatibility. |
| `mathlib:TensorProduct.map` | Tensor product of semilinear maps; maps pure tensors to their respective image tensors. |
| `mathlib:TensorProduct.rid` | Existing right-unitor linear equivalence H tensor_E E ~= H, sending h tensor e to e smul h. |
| `mathlib:LinearMap.ker` | Existing submodule kernel, defined as comap f bottom; membership iff f x=0. |

### Order of construction

L0 → L1 supplies the Bloch–Kato conventions and maps. D.1 → D.2 → D.3 → D.4 supplies the completed local theorem and its arithmetic exports; K3BlochGroups V.4 enters D.2 explicitly. L2 imports the early phi/Gamma and integral Iwasawa engine, and uses L1 only for finite-level normalization comparisons. L3 constructs the big logarithm, and L4 its Wach-coordinate images and general de Rham extension. D.5 uses the regulator comparisons and imported curve integration.

The finite Soulé Chern classes and product formula have one owner: the early M.7-only prefix of MotivicEtaleKTheory. The generic classical log-syntomic producer belongs to the proposed early CS.0–CS.3 prefix of CohomologyComparisons, Part II. Its proposed IDs are specifications of external inputs, not existing nodes. The rigid good-reduction regulator construction does not depend on that entire generic log-syntomic theory. Generic Selmer conditions belong to SelmerIwasawaCohomology L2; only its Bloch–Kato specialization L4 consumes this roadmap's L1.

<a id="stage-l0"></a>

## L0 — Period conventions and realizations

Import the fundamental exact sequences, with directed boundary maps and explicit twists. The three interfaces pin normalization; they do not reconstruct Fontaine’s rings.

**Planets:** Interfaces displayed with their consuming constructions.

<a id="target-padichodgeregulators-l0-hodge-tate-and-twist-conventions"></a>

### Hodge–Tate, twist and period conventions for the regulator

Target `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions` · declaration `hodge_tate_and_twist_conventions`.

**Hypotheses.** K/Q_p finite with maximal unramified subfield K_0; V a p-adic representation of G_K.

Throughout PadicHodgeRegulators: (i) t = log[ε] ∈ B_dR^+ is the period of Z_p(1) for a fixed compatible system ε = (ζ_{p^n}) of p-power roots of unity; Fil^i B_dR = t^i B_dR^+, g(t) = χ(g)t for the cyclotomic character χ, and φ(t) = pt in B_cris (arithmetic Frobenius). (ii) Hodge–Tate weights: h is a weight of V when Fil^{−h}D_dR(V) ≠ Fil^{−h+1}D_dR(V); with this convention Q_p(1) has weight +1 and V_pA of an abelian variety has weights 0 and 1, matching the L3–L4 conventions, PadicHodgeTheory R06.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 (HT(χ) = +1). (iii) For r ∈ Z, e_r := t^{−r} ⊗ ε^{⊗r} is a basis of D_cris(Q_p(r)) = K_0·e_r and of D_dR(Q_p(r)) = K·e_r, independent of ε, with φ(e_r) = p^{−r}e_r, Fil^{−r} = D_dR and Fil^{−r+1} = 0; hence D_dR(Q_p(r))/Fil^0 = K·e_r for r ≥ 1 and 0 for r ≤ 0. (iv) Twisting: D_cris(V(i)) = D_cris(V)⟨i⟩ via d ↦ d ⊗ e_i, with Fil^j(D⟨i⟩) = Fil^{j+i}D and φ|_{D⟨i⟩} = p^{−i}φ|_D. (v) Crystalline representations have N = 0; the monodromy operator is used only for semistable inputs (D.5's boundary). Sources using the opposite weight sign (Benois: Q_p(1) of weight −1) are translated, never mixed.

**Check.**

- D_dR(Q_p(2)) = K·e_2 with φ(e_2) = p^{−2}e_2 and D_dR(Q_p(2))/Fil^0 = K: the target of the weight-two regulator.
- D_dR(Q_p)/Fil^0 = 0 and D_dR(Q_p(−1))/Fil^0 = 0.
- A source stating 'Q_p(1) has Hodge–Tate weight −1' is translated by h ↦ −h before use.

**Construction or proof route.**

1. (i)–(iii) are properties of the imported period rings and functors (PadicHodgeTheory R06.1/fontaine-element-t, R06.1/bdr-filtration-and-graded, R06.2/ddr-of-tate-twists and R06.2/hodge-tate-weight-convention); this node pins how the regulator layers read them; e_r is G_K-invariant because g acts on t^{−r} by χ(g)^{−r} and on ε^{⊗r} by χ(g)^r.
2. (iv) is Fontaine–Ouyang Definition 9.4 and Lemma 9.5.
3. The weight convention is fixed by comparing with Berger §I.2 and Lei–Loeffler–Zerbes §2.1.

**Dependencies.** [PadicHodgeTheory:R06.2/hodge-tate-weight-convention](PadicHodgeTheory.md), [PadicHodgeTheory:R06.1/fontaine-element-t](PadicHodgeTheory.md), [PadicHodgeTheory:R06.1/bdr-filtration-and-graded](PadicHodgeTheory.md), [PadicHodgeTheory:R06.1/frobenius-on-acris](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/ddr-of-tate-twists](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified](PadicHodgeTheory.md).

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Definition 9.4 and Lemma 9.5, pp. 218–219: The twist convention (iv).; [Berger2003](https://arxiv.org/abs/math/0209283v1), §I.2, p. 6: The sign convention, with Q_p(1) of weight +1 in the conventions used here.; [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), §1.3, p. 646: The canonical basis e_r of (iii).

<a id="target-padichodgeregulators-l0-fundamental-exact-sequences"></a>

### The fundamental exact sequences used by the Bloch–Kato maps

Target `PadicHodgeRegulators:L0/fundamental-exact-sequences` · declaration `fundamental_exact_sequences`.

**Hypotheses.** K/Q_p finite; V any p-adic representation for exactness, de Rham for the identification of invariants.

From PadicHodgeTheory R06.1 (its nodes fundamental-exact-sequence, bcris-twisted-frobenius-sequences and divided-frobenius-exact-sequence), with the conventions of L0/hodge-tate-and-twist-conventions: (a) with B_e := B_cris^{φ=1}, the sequences 0 → Q_p → B_e → B_dR/B_dR^+ → 0 and 0 → Q_p → B_e ⊕ B_dR^+ → B_dR → 0 are exact; (b) 0 → Q_p → B_cris --(φ − 1, mod Fil^0)--> B_cris ⊕ B_dR/B_dR^+ → 0 is exact; (c) for every r ∈ Z, 0 → Q_p(r) → Fil^r B_cris --(p^{−r}φ − 1)--> B_cris → 0 is exact (Fontaine); (d) integrally, 0 → Z_p(r)' → Fil^r A_cr --(p^r − φ)--> A_cr has cokernel killed by p^r, with Z_p(r)' = p^{−a(r)}Z_p(r) for r = (p − 1)a(r) + b(r). Tensoring (a)–(c) with any p-adic representation V gives exact sequences of G_K-modules; for de Rham V, H^0(K, (B_dR/B_dR^+) ⊗ V) = D_dR(V)/Fil^0 and H^0(K, B_e ⊗ V) = D_cris(V)^{φ=1}.

**Check.**

- For V = Q_p(r), r ≥ 1: H^0(K, B_e(r)) = D_cris(Q_p(r))^{φ=1} = 0, so the connecting map of (a) ⊗ V is injective on D_dR/Fil^0.
- For V = Q_p: H^0(K, B_e) = K_0^{φ=1} = Q_p and D_dR(Q_p)/Fil^0 = 0.

**Construction or proof route.**

1. (a) is PadicHodgeTheory:R06.1/fundamental-exact-sequence (Fontaine–Ouyang Theorem 7.28(4) and Remark 7.29); the second form follows by adding B_dR^+.
2. (b) is Fontaine–Ouyang (9.12), obtained from (a); (c) is PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences; (d) is PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence (Colmez–Nizioł §2.4.3, Lemma 2.23).
3. Tensoring over Q_p with V is exact; invariants are computed by the period functors of R06.2.

**Dependencies.** [PadicHodgeTheory:R06.1/fundamental-exact-sequence](PadicHodgeTheory.md), [PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences](PadicHodgeTheory.md), [PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence](PadicHodgeTheory.md), [PadicHodgeTheory:R06.1/period-ring-invariants](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/period-functors](PadicHodgeTheory.md), [PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions](#target-padichodgeregulators-l0-hodge-tate-and-twist-conventions).

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Theorem 7.28(4), p. 170: (a), second form.; [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Remark 7.29, p. 171: (a), first form.; [CN2017](https://arxiv.org/abs/1505.06471v4), §2.4.3, p. 23: (d), with t^{r} = t^{b(r)}(t^{p−1}/p)^{a(r)} spanning Z_p(r)'.

<a id="target-padichodgeregulators-l0-integral-period-interface"></a>

### Integral comparison interface for small weights

Target `PadicHodgeRegulators:L0/integral-period-interface` · declaration `integral_period_interface`.

**Hypotheses.** K unramified over Q_p; weights in [0, p − 2]; p odd.

For K/Q_p finite unramified and a crystalline G_K-stable Z_p-lattice T with Hodge–Tate weights in [0, p − 2] (HT(χ) = +1), the Fontaine–Laffaille correspondence T ↔ M (strongly divisible W(k)-lattice in D_cris(V^∨)) of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 is imported with its normalisation; for T = Z_p(r), 0 ≤ r ≤ p − 2, the lattice is W(k)·e_{−r} in D_cris(Q_p(−r)). The integral Bloch–Kato statement of L1/integral-logarithm-unramified and the integral period map of D.2/fontaine-messing-kato-period-map are formulated against these lattices and the integral sequence L0/fundamental-exact-sequences (d); no further integral period carrier is introduced here.

**Check.**

- T = Z_p(2) with p ≥ 5 lies in the Fontaine–Laffaille range [0, p − 2].
- T = Z_p(p − 1) is outside the range; the integral statements of L1 are not asserted there.

**Construction or proof route.**

1. The lattice correspondence is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence; its small-weight interface (indices translated to HT(χ) = +1) is PadicHodgeTheory R06.4.
2. For a rank-one Tate twist the strongly divisible lattice is W(k)·e_{−r}: p^{−i}Φ(M ∩ Fil^i) = M holds because Φ(e_{−r}) = p^r e_{−r} and Fil^r ∩ M = M.

**Dependencies.** [FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence](FiniteFlatGroupsAndIntegralPadicHodgeTheory.md), [FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/strongly-divisible-lattices](FiniteFlatGroupsAndIntegralPadicHodgeTheory.md), [PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences](PadicHodgeTheory.md), [PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary](PadicHodgeTheory.md), [PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions](#target-padichodgeregulators-l0-hodge-tate-and-twist-conventions).

**Sources.** [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), §1.3, p. 647: The integral lattice O_K·e_m in D_dR(Q_p(m)) against which the integral statements are measured.
<a id="stage-l1"></a>

## L1 — Bloch–Kato maps

Define H_e, H_f and H_g as kernels of the period-cohomology maps. The exponential lands in H_e; its inverse is a logarithm only on the specified quotient or under the stated injectivity hypotheses. The dual exponential has kernel H_g. Direct de Rham duality uses independent dimensions, rather than a claim that crystalline structures descend through arbitrary ramification.

**Planets:** Bloch–Kato local conditions; Bloch–Kato exponential; Kato's dual exponential; Integral Bloch–Kato logarithm.

<a id="target-padichodgeregulators-l1-bloch-kato-subgroups"></a>

### The Bloch–Kato local conditions H¹_e, H¹_f, H¹_g

Target `PadicHodgeRegulators:L1/bloch-kato-subgroups` · declaration `blochKatoF`.

**Hypotheses.** K/Q_p finite (or K/Q_ℓ finite with ℓ ≠ p for the unramified condition); V finite-dimensional continuous.

Let K/Q_p be finite and V a p-adic representation of G_K. Define H^1_e(K, V) := ker(H^1(K, V) → H^1(K, B_e ⊗ V)), H^1_f(K, V) := ker(H^1(K, V) → H^1(K, B_cris ⊗ V)) and H^1_g(K, V) := ker(H^1(K, V) → H^1(K, B_dR ⊗ V)), so H^1_e ⊆ H^1_f ⊆ H^1_g. For a G_K-stable Z_p-lattice T ⊂ V and W = V/T, H^1_f(K, T) is the preimage of H^1_f(K, V) and H^1_f(K, W) the image of H^1_f(K, V); these are the finite local conditions. For ℓ ≠ p (K/Q_ℓ finite) H^1_f := H^1_ur. The singular quotient is H^1_s := H^1/H^1_f.

**Uses.** SelmerIwasawaCohomology:L4/bloch-kato-condition: H^1_f(F_v, V) = ker(H^1 → H^1(B_cris ⊗ V)) and its integral propagation (RJW Definition 13.19(2)); GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class: loc_v κ(P) ∈ H^1_f = H^1_e for abelian varieties with good reduction; HeegnerPointEulerSystems:HE.3: Kummer classes and exact Selmer conditions; GeneralizedHeegnerCycles:GH.2: ring-class trace and local conditions; PadicHodgeRegulators:L3/ramified-interpolation: the finite-part class for which the Bloch–Kato logarithm is used

**API.**

| Name | Contract |
| --- | --- |
| `blochKatoE` | blochKatoE K V : Submodule ℚ_p (H^1(K, V)). |
| `blochKatoF` | blochKatoF K V : Submodule ℚ_p (H^1(K, V)). |
| `blochKatoG` | blochKatoG K V : Submodule ℚ_p (H^1(K, V)). |
| `blochKatoE_le_F` | blochKatoE K V ≤ blochKatoF K V ≤ blochKatoG K V. |
| `blochKatoF_lattice` | blochKatoF K T := preimage under H^1(K, T) → H^1(K, V); blochKatoF K (V/T) := image. |
| `blochKatoF_map` | For a G_K-map V → V', H^1(K, V) → H^1(K, V') maps blochKatoF into blochKatoF (same for e, g). |
| `blochKatoF_res` | For L/K finite, restriction maps blochKatoF K V into blochKatoF L V and corestriction maps back. |
| `blochKatoF_unramified` | For ℓ ≠ p, blochKatoF := H^1_ur. |
| `blochKatoE_extensionality` | Two Bloch–Kato submodules agree iff their membership predicates agree on every class, by Submodule.ext. Each inherits the ambient Q_p-module operations; membership is stable under zero, addition and scalar multiplication. |

**Discriminating tests.**

- `blochKatoF_trivial` (computation): For V = Q_p and K = Q_p, blochKatoF = H^1_ur(Q_p, Q_p) = Hom(Gal(Q_p^ur/Q_p), Q_p), of dimension 1, while H^1(Q_p, Q_p) has dimension 2.
- `blochKatoF_negative_twist` (degenerate): For V = Q_p(−1), H^1_e = H^1_f = H^1_g = 0 although H^1(K, Q_p(−1)) has dimension [K : Q_p].
- `blochKatoF_rubin_compat` (compatibility): For V = Q_p(1), blochKatoF agrees with Rubin's U_{L,v} ⊗ Φ condition (Euler Systems, §I.6.3, (7)) and with the Kummer image of the completed units.
- `blochKatoG_not_all` (non-example): For V = Q_p, H^1_g(K, Q_p) = H^1_f(K, Q_p) ≠ H^1(K, Q_p): the de Rham condition is a proper subspace (the ramified homomorphisms are excluded).

**Check.**

- V = Q_p: H^1_f = H^1_ur (dimension 1) while dim H^1 = [K : Q_p] + 1.
- V = Q_p(1): H^1_f is the image of (O_K^×)^∧ ⊗ Q_p under the Kummer map, of dimension [K : Q_p].

**Construction or proof route.**

1. The maps are induced by V → B_* ⊗ V on continuous cohomology (ArithmeticGaloisDuality R02.1).
2. The inclusions follow from B_e ⊂ B_cris ⊂ B_dR.
3. The integral conditions are the propagated conditions of Rubin, Euler Systems, Definition I.3.4 and Remark I.3.6.

**Dependencies.** [PadicHodgeRegulators:L0/fundamental-exact-sequences](#target-padichodgeregulators-l0-fundamental-exact-sequences), [PadicHodgeTheory:R06.1/crystalline-period-ring](PadicHodgeTheory.md), [PadicHodgeTheory:R06.1/de-rham-period-ring](PadicHodgeTheory.md), [ArithmeticGaloisDuality:R02.1/continuous-section-long-exact](ArithmeticGaloisDuality.md), [ArithmeticGaloisDuality:R02.1/rationalization](ArithmeticGaloisDuality.md), [SelmerIwasawaCohomology:L0/padic-kummer-identification](SelmerIwasawaCohomology.md).

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Definition 9.22, (9.8), p. 232: The definitions, with (9.7) and (9.10) for e and g.; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Remark I.3.6, p. 7: The finite condition at p and its integral propagation (Definition I.3.4).

<a id="target-padichodgeregulators-l1-bloch-kato-exponential"></a>

### The Bloch–Kato exponential

Target `PadicHodgeRegulators:L1/bloch-kato-exponential` · declaration `blochKatoExp`.

**Hypotheses.** K/Q_p finite; V de Rham (for the identification of the source with D_dR(V)/Fil^0).

For K/Q_p finite and V a de Rham representation, exp_{K,V} : D_dR(V)/Fil^0 D_dR(V) → H^1(K, V) is the connecting homomorphism of 0 → V → B_e ⊗ V → (B_dR/B_dR^+) ⊗ V → 0 (L0/fundamental-exact-sequences (a) ⊗ V). There are exact sequences 0 → H^0(K, V) → D_cris(V)^{φ=1} → D_dR(V)/Fil^0 → H^1_e(K, V) → 0 and 0 → H^0(K, V) → D_cris(V) → D_cris(V) ⊕ D_dR(V)/Fil^0 → H^1_f(K, V) → 0 (the first map x ↦ (φx − x, x̄)); in particular im(exp_{K,V}) = H^1_e(K, V) and ker(exp_{K,V}) is the image of D_cris(V)^{φ=1}. Explicitly, exp(x) is the class of g ↦ (g − 1)b for any b ∈ B_e ⊗ V with b − x ∈ B_dR^+ ⊗ V.

**Uses.** PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison: r^et = exp_BK ∘ reg_syn on K_{2n−1}(O_K); PadicHodgeRegulators:D.2/syntomic-exponential: the syntomic exponential composed with the period map is exp_BK; PadicHodgeRegulators:L3/ramified-interpolation: the interpolation formula of the big logarithm at j ≤ −1 uses the Bloch–Kato logarithm; PhiGammaModulesAndIwasawaCohomology:PG.5: the Bloch–Kato normalisation comparison at the end of PG.5 (RS-26 link L1 → PG.5)

**API.**

| Name | Contract |
| --- | --- |
| `blochKatoExp` | blochKatoExp K V : D_dR(V) ⧸ Fil^0 →ₗ[ℚ_p] H^1(K, V). |
| `blochKatoExp_range` | LinearMap.range (blochKatoExp K V) = blochKatoE K V. |
| `blochKatoExp_ker` | ker (blochKatoExp K V) = image of D_cris(V)^{φ=1} in D_dR(V)/Fil^0. |
| `blochKatoExp_injective_iff` | blochKatoExp K V is injective iff D_cris(V)^{φ=1} = H^0(K, V). |
| `blochKatoExp_cocycle` | blochKatoExp K V x is represented by g ↦ (g − 1)b for b ∈ B_e ⊗ V lifting x. |
| `blochKatoExp_map` | Natural in V for G_K-equivariant maps of de Rham representations. |
| `blochKatoExp_f_sequence` | The exact sequence 0 → H^0 → D_cris → D_cris ⊕ D_dR/Fil^0 → H^1_f → 0. |
| `blochKatoExp_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `blochKatoExp_twist_two` (computation): For K = Q_p and V = Q_p(2), blochKatoExp is an isomorphism Q_p·e_2 ≅ H^1(Q_p, Q_p(2)) ≅ Q_p.
- `blochKatoExp_trivial` (degenerate): For V = Q_p, D_dR(Q_p)/Fil^0 = 0, so blochKatoExp = 0 and H^1_e(K, Q_p) = 0.
- `blochKatoExp_kummer` (compatibility): For V = Q_p(1) and u ∈ 1 + p^c O_K (c > 1/(p − 1)), blochKatoExp(log u · e_1) = κ(u), the Kummer class (Bloch–Kato 3.10.1).
- `blochKatoExp_not_onto_f` (non-example): For V = Q_p(1), H^1_e = H^1_f has dimension [K : Q_p] but H^1(K, Q_p(1)) has dimension [K : Q_p] + 1: the exponential does not reach the valuation direction.

**Check.**

- V = Q_p(1): exp agrees with the usual p-adic exponential on a neighbourhood of 0 of K (Bloch–Kato p. 358 as recalled by Huber–Kings).
- V = Q_p(r), r ≥ 2: exp is an isomorphism K·e_r ≅ H^1(K, Q_p(r)).

**Construction or proof route.**

1. Take the long exact cohomology sequence of the tensored fundamental sequence; H^0(K, B_e ⊗ V) = D_cris(V)^{φ=1} and H^0(K, (B_dR/B_dR^+) ⊗ V) = D_dR(V)/Fil^0 for de Rham V.
2. The H^1_f sequence uses L0/fundamental-exact-sequences (b) ⊗ V.
3. The cocycle description is the definition of the connecting map.

**Dependencies.** [PadicHodgeRegulators:L0/fundamental-exact-sequences](#target-padichodgeregulators-l0-fundamental-exact-sequences), [PadicHodgeRegulators:L1/bloch-kato-subgroups](#target-padichodgeregulators-l1-bloch-kato-subgroups), [PadicHodgeTheory:R06.2/period-functors](PadicHodgeTheory.md), [ArithmeticGaloisDuality:R02.1/continuous-section-long-exact](ArithmeticGaloisDuality.md).

**Sources.** [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), (9.11), p. 233: The exponential and its exact sequence.; [Berger2003](https://arxiv.org/abs/math/0209283v1), Introduction, p. 2: The definition.

<a id="target-padichodgeregulators-l1-bloch-kato-logarithm"></a>

### The Bloch–Kato logarithm

Target `PadicHodgeRegulators:L1/bloch-kato-logarithm` · declaration `blochKatoLog`.

**Hypotheses.** D_cris(V)^{φ=1} = H^0(K, V).

Let K/Q_p be finite and V de Rham with D_cris(V)^{φ=1} = H^0(K, V) (so exp_{K,V} is injective). The Bloch–Kato logarithm is log_BK := exp_{K,V}^{−1} : H^1_e(K, V) → D_dR(V)/Fil^0 D_dR(V). For V = Q_p(r), r ≥ 2, H^1_e = H^1(K, Q_p(r)) and log_BK : H^1(K, Q_p(r)) ≅ K·e_r ≅ K; for V = Q_p(1), log_BK ∘ κ = log_p on O_K^× (Iwasawa branch), with κ the Kummer map.

**Uses.** PadicHodgeRegulators:D.3/local-regulator: D_L = ε·log_BK ∘ c_{2,1} on completed K_3; EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: z = log_BK(reg_et(u)) for weight-two elliptic classes; GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class: log_BK ∘ κ = log_A for abelian varieties with good reduction; GeneralizedHeegnerCycles:GH.8/differential-evaluation: naturality of log_BK for the quotient and its formal-group comparison

**API.**

| Name | Contract |
| --- | --- |
| `blochKatoLog` | blochKatoLog K V : blochKatoE K V →ₗ[ℚ_p] D_dR(V) ⧸ Fil^0 (under the injectivity hypothesis). |
| `blochKatoLog_exp` | blochKatoLog (blochKatoExp x) = x. |
| `blochKatoExp_log` | blochKatoExp (blochKatoLog y) = y for y ∈ blochKatoE K V. |
| `blochKatoLog_twist` | For r ≥ 2, blochKatoLog K (ℚ_p(r)) : H^1(K, ℚ_p(r)) ≃ₗ K·e_r. |
| `blochKatoLog_kummer` | For r = 1 and u ∈ 𝒪_Kˣ, blochKatoLog (κ u) = log_p u · e_1. |
| `blochKatoLog_map` | Natural for G_K-maps between representations satisfying the hypothesis. |
| `blochKatoLog_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `blochKatoLog_principal_unit` (computation): For K = Q_p (p odd), blochKatoLog (κ(1 + p)) = log(1 + p)·e_1 = (p − p²/2 + p³/3 − …)·e_1.
- `blochKatoLog_teichmuller` (degenerate): For a Teichmüller unit ω, blochKatoLog (κ ω) = 0 (κ(ω) is torsion in H^1(K, Z_p(1)) and log_p(ω) = 0).
- `blochKatoLog_coleman_compat` (compatibility): blochKatoLog ∘ κ = ColemanIntegration's Iwasawa logarithm on 𝒪_Kˣ (ColemanIntegration:L0/iwasawa-logarithm).
- `blochKatoLog_not_defined_trivial` (non-example): For V = Q_p, D_cris^{φ=1} = Q_p = H^0 but D_dR/Fil^0 = 0 and H^1_e = 0, so blochKatoLog has zero source: H^1_f(K, Q_p) ≠ 0 is not in its domain.

**Check.**

- log_BK(κ(1 + p)) = log(1 + p) for K = Q_p, p odd.
- For V = Q_p(1) the class of p itself is not in H^1_e, so log_BK(κ(p)) is undefined.

**Construction or proof route.**

1. exp is injective under the hypothesis and has image H^1_e (L1/bloch-kato-exponential); define log_BK as its inverse on the image.
2. For Q_p(r), r ≥ 2: D_cris(Q_p(r))^{φ=1} = 0 = H^0, and dim H^1 = [K : Q_p] = dim D_dR/Fil^0 (H^0 = H^2 = 0), so H^1_e = H^1.
3. For Q_p(1): Bloch–Kato's comparison of exp with the usual exponential (Bloch–Kato 3.10.1, recalled by Huber–Kings Remark 1.3.3) gives log_BK ∘ κ = log_p.

**Dependencies.** [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [ColemanIntegration:L0/iwasawa-logarithm](ColemanIntegration.md), `tauceti:TauCeti.kummerClassMap`, [SelmerIwasawaCohomology:L0/padic-kummer-identification](SelmerIwasawaCohomology.md).

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Remark 1.3.3, p. 9: The weight-one case.; [HK2011](https://arxiv.org/abs/math/0612611v1), §1.3, p. 8: The exponential for Q_p(n), an isomorphism for n > 1.

<a id="target-padichodgeregulators-l1-dual-exponential"></a>

### Kato's dual exponential

Target `PadicHodgeRegulators:L1/dual-exponential` · declaration `dualExp`.

**Hypotheses.** K/Q_p finite; V de Rham.

For K/Q_p finite and V de Rham, the dual exponential exp*_{K,V^*(1)} : H^1(K, V) → Fil^0 D_dR(V) is the composite H^1(K, V) → H^1(K, B_dR ⊗ V) ≅ D_dR(V), the isomorphism being x ↦ (g ↦ log χ(g)·x) (Kato); its image lies in Fil^0 D_dR(V) and its kernel is H^1_g(K, V). For W=V*(1), write P_W:H^1(K,W)×H^1(K,W*(1))→Q_p for the ordered cup-product pairing, and Q_W:D_dR(W)×D_dR(W*(1))→Q_p for its de Rham pairing followed by trace. The adjunction is Q_W(x,exp*_{K,W}(y))=P_W(exp_{K,W}(x),y), with x∈D_dR(W)/Fil^0 and y∈H^1(K,V), identifying W*(1)=V. Reversing both pairings requires the corresponding graded-commutativity sign; their order is part of the convention. This is the positive adjunction of LZ2014 §2.4 and the order used in Appendix B.6, not a choice of Iwasawa normalization.

**Uses.** PadicHodgeRegulators:L3/ramified-interpolation: B_j = exp* for j ≥ 0 in the interpolation formula of the big logarithm; PadicHodgeRegulators:L4/derham-interpolation-growth: Rodrigues Jacinto's interpolation uses exp* for j ≥ 0; L3/rubin-coleman-map: Rubin's Coleman map is defined through exp*_{ω_A}; KatoEulerSystems:L3: explicit reciprocity expresses exp* of Kato's classes by modular forms

**API.**

| Name | Contract |
| --- | --- |
| `dualExp` | dualExp K V : H^1(K, V) →ₗ[ℚ_p] Fil^0 D_dR(V). |
| `dualExp_ker` | ker (dualExp K V) = blochKatoG K V. |
| `dualExp_adjoint` | deRhamPairing x (dualExp K V y) = tatePairing (blochKatoExp K V^*(1) x) y. |
| `dualExp_formula` | dualExp K V is H^1(K, V) → H^1(K, B_dR^+ ⊗ V) ≅ Fil^0 D_dR(V) via ∪ log χ. |
| `dualExp_map` | Natural in V; compatible with corestriction and trace (L1/twist-and-change-of-field). |
| `dualExp_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `dualExp_trivial_log_chi` (computation): For K = Q_p and V = Q_p, dualExp (log χ) = 1.
- `dualExp_positive_twist` (degenerate): For V = Q_p(r) with r ≥ 1, dualExp = 0.
- `dualExp_adjoint_compat` (compatibility): For V = Q_p and x ∈ D_dR(Q_p(1))/Fil^0 = K·e_1: [x, dualExp y] = ⟨exp_{Q_p(1)}(x), y⟩, matching the Kummer/local class field theory pairing.
- `dualExp_kernel_not_f` (non-example): For V = Q_p(1), ker dualExp = H^1_g = H^1 ≠ H^1_f: the kernel is H^1_g, not H^1_f.

**Check.**

- For K=Q_p and V=Q_p, write η=a·log χ+b·η_ur; then exp*(η)=a. For general finite K/Q_p, exp* is computed through H^1(K,B_dR)≅K, with kernel the one-dimensional unramified subspace; the two-character expansion is asserted only over Q_p.
- V = Q_p(r), r ≥ 1: exp* vanishes, since Fil^0 D_dR(Q_p(r)) = 0.

**Construction or proof route.**

1. Fontaine–Ouyang Proposition 6.35 computes H^1(K, t^iB_dR^+/t^jB_dR^+) via cup product with log χ; passing to the limit gives the isomorphism H^1(K, B_dR ⊗ V) ≅ D_dR(V) (Berger Proposition II.5).
2. The image lies in Fil^0 because the map factors through H^1(K, B_dR^+ ⊗ V); its kernel is H^1_g by definition.
3. The adjunction uses the rational perfect cup-product pairing of ArithmeticGaloisDuality:D7/duality-after-localization and the explicitly requested R02.4 extension to every finite K/Q_p; SelmerIwasawaCohomology:L1/orthogonal-complement supplies orthogonality formalism. A discrete class-formation Ext pairing is not this rational representation pairing.

**Dependencies.** [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [PadicHodgeRegulators:L1/bloch-kato-subgroups](#target-padichodgeregulators-l1-bloch-kato-subgroups), [SelmerIwasawaCohomology:L1/orthogonal-complement](SelmerIwasawaCohomology.md), [PadicHodgeTheory:R06.1/de-rham-invariants](PadicHodgeTheory.md), [ArithmeticGaloisDuality:D7/duality-after-localization](ArithmeticGaloisDuality.md), [ArithmeticGaloisDuality:R02.4](ArithmeticGaloisDuality.md), [PadicHodgeTheory:R06.1](PadicHodgeTheory.md).

**Sources.** [Berger2003](https://arxiv.org/abs/math/0209283v1), Introduction, p. 2: The definition by duality.; [Berger2003](https://arxiv.org/abs/math/0209283v1), §II, p. 13: Image and kernel.; [LZ2014](https://arxiv.org/pdf/1108.5954v3), §2.4, p.5; Theorem B.6 and proof, pp.39–40: The ordered positive finite-level adjunction and the separate Iwasawa reciprocity factor.

<a id="target-padichodgeregulators-l1-dimension-formulas"></a>

### Dimensions of the Bloch–Kato subspaces

Target `PadicHodgeRegulators:L1/dimension-formulas` · declaration `blochKato_dimension_formulas`.

**Hypotheses.** K/Q_p finite; V de Rham (crystalline for nothing further).

Let K/Q_p be finite and V a de Rham representation. Then dim H^1_f(K, V) = dim_{Q_p} D_dR(V)/Fil^0 + dim H^0(K, V); dim H^1_f/H^1_e = dim D_cris(V)^{φ=1}; dim H^1_g(K, V) = dim H^1_f(K, V) + dim D_cris(V^*(1))^{φ=1}; and dim H^1(K, V) = [K : Q_p]·dim V + dim H^0(K, V) + dim H^0(K, V^*(1)).

**Check.**

- V = Q_p(2), K = Q_p: dim H^1_f = 1 = dim H^1.
- V = Q_p(1): dim H^1_f = [K : Q_p] and dim H^1 = [K : Q_p] + 1.
- V = Q_p: dim H^1_f = 1 and dim H^1_g = 1 + dim D_cris(Q_p(1))^{φ=1} = 1.

**Construction or proof route.**

1. Count dimensions in the exact sequences of L1/bloch-kato-exponential; the two D_cris(V) terms cancel in the H^1_f sequence.
2. The H^1_g formula follows from H^1_g(V) = H^1_e(V^*(1))^⊥ (L1/local-duality-of-conditions) and the H^1_e count for V^*(1).
3. The Euler characteristic formula Σ(−1)^i dim H^i = −[K : Q_p] dim V with H^2(V) dual to H^0(V^*(1)) gives dim H^1.

**Dependencies.** [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [PadicHodgeRegulators:L1/local-duality-of-conditions](#target-padichodgeregulators-l1-local-duality-of-conditions), [ArithmeticGaloisDuality:D7/duality-after-localization](ArithmeticGaloisDuality.md).

**Sources.** [BK1990](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf), Corollary 3.8.4 and equation (3.8.5), pp. 355–356: The finite-part dimension count is established before the duality conclusion.; [Benois2014](https://arxiv.org/abs/1412.7305v1), Proposition 2.8.2(i), p. 44: The H^1_f formula (for (φ,Γ)-modules, which covers V via D†_rig(V)).; [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), (9.16), p. 235: The quotient H^1_f/H^1_e.

<a id="target-padichodgeregulators-l1-local-duality-of-conditions"></a>

### Local duality of the Bloch–Kato conditions

Target `PadicHodgeRegulators:L1/local-duality-of-conditions` · declaration `blochKato_local_duality`.

**Hypotheses.** K/Q_p finite; V de Rham (Bloch–Kato Proposition 3.8; Fontaine–Ouyang state it for semistable V).

Let K/Q_p be finite and V de Rham. Under the perfect cup-product pairing H^1(K, V) × H^1(K, V^*(1)) → H^2(K, Q_p(1)) = Q_p: H^1_f(K, V^*(1)) = H^1_f(K, V)^⊥, H^1_e(K, V^*(1)) = H^1_g(K, V)^⊥ and H^1_g(K, V^*(1)) = H^1_e(K, V)^⊥. For a G_K-stable lattice T, H^1_f(K, T) and H^1_f(K, V^*(1)/T^*(1)) (propagated conditions; V^*(1)/T^*(1) = Hom(T, μ_{p^∞})) are exact annihilators under the induced pairing H^1(K, T) × H^1(K, V^*(1)/T^*(1)) → Q_p/Z_p. For a finite extension K_ℓ/Q_ℓ with ℓ ≠ p and a finite unramified p-primary G_{K_ℓ}-module M, H¹_un(K_ℓ,M) and H¹_un(K_ℓ,M^D) are exact annihilators under finite local Tate duality; no unrestricted ramified torsion-module assertion is made.

**Check.**

- V = Q_p: H^1_f(Q_p) = H^1_ur is the annihilator of H^1_f(Q_p(1)) = Kummer image of units, which is local class field theory's statement that units are the norms killing unramified characters.
- V = Q_p(2), V^*(1) = Q_p(−1): H^1_f(Q_p(2)) = H^1 and H^1_f(Q_p(−1)) = 0 are annihilators.
- Restriction to a ramified field where V becomes semistable is not an equality test for H_f(K,V); the direct proof must work before that restriction.

**Construction or proof route.**

1. Use the direct de Rham argument of BK Proposition 3.8. The fundamental exact sequence with B_cris and B_dR supplies the finite-part connecting map. Cup-product naturality shows that a class killed after extension to B_cris annihilates the finite-part image for the dual twist. This is a connecting-map diagram, not an assertion that all H² with period coefficients vanish.
2. Prove the finite-part dimension count independently of this theorem using BK Lemma 3.8.1 and Corollary 3.8.4: de Rham admissibility implies injectivity of H¹(B_dR⁺⊗V)→H¹(B_dR⊗V); the exact sequence gives dim H_f=dim t_V+dim H⁰(V). Combine the counts for V and V*(1) with the imported rational local Euler characteristic, H²/H⁰ Tate duality and the complementary filtration dimensions. Their sum is dim H¹(V), so finite-part orthogonality is exact. Do not call the downstream L1/dimension-formulas node.
3. For e/g, use the other fundamental exact sequence and its cup-product diagram. BK pp. 357–359 reduce nondegeneracy to the pairing of C_p-cohomology through its boundary into H²(Q_p(1)), with the Hodge–Tate decomposition and the nonzero Kummer boundary. Import the required continuous period-cohomology and filtration-limit facts from PadicHodgeTheory; no ramified descent of H_f is used.
4. Propagate the rational conditions to a lattice and its torsion quotient using the compatible rational/integral local pairings and the image/preimage definitions (Rubin I.4.3, pp. 9–10). Keep the separate finite unramified ℓ≠p assertion at its supplied scope.

**Dependencies.** [PadicHodgeRegulators:L1/bloch-kato-subgroups](#target-padichodgeregulators-l1-bloch-kato-subgroups), [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators](ArithmeticGaloisDuality.md), [SelmerIwasawaCohomology:L1/orthogonal-complement](SelmerIwasawaCohomology.md), [SelmerIwasawaCohomology:L1/lattice-pairing-compatibility](SelmerIwasawaCohomology.md), [ArithmeticGaloisDuality:D7/duality-after-localization](ArithmeticGaloisDuality.md), [ArithmeticGaloisDuality:D7/local-invariant-trivialization](ArithmeticGaloisDuality.md), [ArithmeticGaloisDuality:D7/local-duality-maps](ArithmeticGaloisDuality.md), [ArithmeticGaloisDuality:D7/derived-local-duality](ArithmeticGaloisDuality.md).

**Sources.** [BK1990](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf), Proposition 3.8 and its proof, pp. 354–359; Corollary 3.8.4, p. 355: Direct proof for de Rham representations, with an independent finite-part dimension count.; [FO](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf), Theorem 9.27, p. 235: The statement (citing Bloch–Kato Proposition 3.8).; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Remark I.7.1, p. 17: The same, in Rubin's notation V^* = V^*(1).

<a id="target-padichodgeregulators-l1-twist-and-change-of-field"></a>

### Twists, restriction and corestriction for the Bloch–Kato maps

Target `PadicHodgeRegulators:L1/twist-and-change-of-field` · declaration `blochKato_change_of_field`.

**Hypotheses.** K ⊆ L finite over Q_p; V de Rham.

Let L/K be a finite extension of finite extensions of Q_p and V de Rham over K. (a) Restriction: res_{L/K} ∘ exp_{K,V} = exp_{L,V} ∘ ι, with ι : D_dR,K(V) → L ⊗_K D_dR,K(V) = D_dR,L(V) the inclusion. (b) Corestriction: cor_{L/K} ∘ exp_{L,V} = exp_{K,V} ∘ Tr_{L/K}, and Tr_{L/K} ∘ exp*_L = exp*_K ∘ cor_{L/K}. (c) Twisting: for i ∈ Z, D_cris(V(i)) = D_cris(V) ⊗ e_i and D_dR(V(i)) = D_dR(V) ⊗ e_i with Fil^j shifted by i and φ multiplied by p^{−i}; a chosen basis of Q_p(i) does not induce a canonical finite-level cohomology isomorphism H^1(K, V) ≅ H^1(K, V(i)), and twisting enters the exponentials only through Iwasawa cohomology (L2/local-iwasawa-twist). (d) Shapiro: for V a representation of G_L, H^1(K, Ind_L^K V) ≅ H^1(L, V) carries H^1_f to H^1_f and exp_{K, Ind V} to exp_{L, V} under D_dR,K(Ind V) = D_dR,L(V).

**Check.**

- For L/K unramified of degree f and V = Q_p(2): cor ∘ exp_L = exp_K ∘ Tr, so log_BK on H^1(K, Q_p(2)) of a corestricted class is the trace.
- Although H^1(Q_p,Q_p) and H^1(Q_p,Q_p(1)) both have dimension 2, their geometric subspaces H^1_g have dimensions 1 and 2 respectively. A choice of representation basis does not supply a Galois-equivariant finite-level twisting isomorphism compatible with these conditions.

**Construction or proof route.**

1. (a) Naturality of connecting maps for the restriction of the tensored fundamental sequence; D_dR descends along finite extensions (PadicHodgeTheory:R06.2/de-rham-base-change).
2. (b) Corestriction on H^0 of B_dR ⊗ V is the trace; Berger states the corresponding commutative diagrams (proofs of his Theorems II.2 and II.6).
3. (c) Fontaine–Ouyang Lemma 9.5 and L0/hodge-tate-and-twist-conventions.
4. (d) Shapiro's lemma (Rubin Appendix B, Corollary 5.2) and D_dR of induced representations (PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars); B_* ⊗ Ind V = Ind(B_* ⊗ V) gives the compatibility of H^1_f and exp.

**Dependencies.** [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [PadicHodgeRegulators:L1/dual-exponential](#target-padichodgeregulators-l1-dual-exponential), [PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions](#target-padichodgeregulators-l0-hodge-tate-and-twist-conventions), [PadicHodgeTheory:R06.2/de-rham-base-change](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars](PadicHodgeTheory.md), [ArithmeticGaloisDuality:D7/duality-after-localization](ArithmeticGaloisDuality.md).

**Sources.** [Berger2003](https://arxiv.org/abs/math/0209283v1), Proof of Theorem II.2, p. 11: The corestriction–trace square (bracketed text paraphrases a diagram).; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, Corollary 5.2, p. 157: Shapiro's lemma in the form used for semilocal conditions.

<a id="target-padichodgeregulators-l1-tate-twist-examples"></a>

### The Bloch–Kato conditions for Tate twists

Target `PadicHodgeRegulators:L1/tate-twist-examples` · declaration `blochKato_tate_twists`.

**Hypotheses.** K/Q_p finite.

Let K/Q_p be finite. (i) V = Q_p: H^1_e = 0, H^1_f = H^1_g = H^1_ur (dimension 1). (ii) V = Q_p(1): H^1_e = H^1_f = κ((O_K^×)^∧ ⊗ Q_p) of dimension [K : Q_p], H^1_g = H^1 (dimension [K : Q_p] + 1); exp_BK(log_p u·e_1) = κ(u) for u ∈ O_K^× and log_BK ∘ κ = log_p. (iii) V = Q_p(r), r ≥ 2: H^1_e = H^1_f = H^1_g = H^1(K, Q_p(r)) of dimension [K : Q_p], and exp : K·e_r ≅ H^1(K, Q_p(r)). (iv) V = Q_p(r), r ≤ −1: H^1_e = H^1_f = H^1_g = 0 while dim H^1 = [K : Q_p]. Integrally: H^1_f(K, Z_p(1)) = (O_K^×)^∧ and H^1_f(K, Z_p(r)) = H^1(K, Z_p(r)) for r ≥ 2.

**Check.**

- K = Q_5, r = 2: H^1(Q_5, Q_5(2)) ≅ Q_5 via log_BK.
- K = Q_p, V = Q_p(−1): H^1 ≠ 0 but H^1_g = 0 (a non-split extension 0 → Q_p(−1) → E → Q_p → 0 is never de Rham).

**Construction or proof route.**

1. Compute D_cris and D_dR/Fil^0 of Q_p(r) (L0/hodge-tate-and-twist-conventions) and apply L1/dimension-formulas.
2. (ii) Bloch–Kato p. 358 (quoted by Huber–Kings) identify exp with the classical exponential; the Kummer identification is SelmerIwasawaCohomology:L0/padic-kummer-identification.
3. (iv) H^1_g(Q_p(r)) = H^1_e(Q_p(1 − r))^⊥ = 0 for r ≤ −1 by duality and (iii).

**Dependencies.** [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:L1/dimension-formulas](#target-padichodgeregulators-l1-dimension-formulas), [PadicHodgeRegulators:L1/local-duality-of-conditions](#target-padichodgeregulators-l1-local-duality-of-conditions), [SelmerIwasawaCohomology:L0/padic-kummer-identification](SelmerIwasawaCohomology.md), [SelmerIwasawaCohomology:L0/local-completion](SelmerIwasawaCohomology.md), [ArithmeticGaloisDuality:D7/duality-after-localization](ArithmeticGaloisDuality.md).

**Sources.** [HK2](https://arxiv.org/abs/math/0101071v2), Appendix A, p. 46: Case (ii).; [HK2011](https://arxiv.org/abs/math/0612611v1), §1.3, p. 8: Case (iii): exp_BK : K → H^1(K, Q_p(n)).

<a id="target-padichodgeregulators-l1-abelian-variety-logarithm"></a>

### The Bloch–Kato logarithm of Kummer classes of abelian varieties

Target `PadicHodgeRegulators:L1/abelian-variety-logarithm` · declaration `blochKato_abelian_log`.

**Hypotheses.** A has good reduction over O_K; the sign convention of exp is that of L1/bloch-kato-exponential.

Let K/Q_p be finite and A/K an abelian variety with good reduction, V = V_pA. Then H^1_e(K, V) = H^1_f(K, V) = H^1_g(K, V) = κ(A(K) ⊗ Q_p), with κ the Kummer map; D_dR(V)/Fil^0 ≅ Lie(A) ⊗ K; and log_BK ∘ κ = log_A on A(K) ⊗ Q_p, where log_A : A(K) → Lie(A) is the logarithm of the formal group (extended to A(K) by finite index). For an isogeny or a quotient map π : A → B of abelian varieties with good reduction, log_BK is natural: log_B(π(x)) = dπ(log_A(x)). Pairing with an invariant differential ω ∈ Fil^0 D_dR(V^*(1)) = H^0(A, Ω^1) gives ⟨log_BK κ(P), ω⟩ = log_ω(P).

**Check.**

- For an elliptic curve E/Q_p with good reduction and P ∈ E_1(Q_p) (kernel of reduction), log_BK κ(P) = log_{Ê}(P) ∈ Lie(E) ⊗ Q_p.
- For a quotient π : J_0(N) → E, log_{E,ω_E}(π(x)) = c_π·AJ_dR(x)(ω_f) when π^*ω_E = c_π ω_f (GeneralizedHeegnerCycles:GH.8/differential-evaluation); c_π is not assumed to be 1.

**Construction or proof route.**

1. For the formal group Â of finite height over O_K with Tate module T, Berger states the commutative square exp_G / Kummer δ_G / exp_{K,V} with D_dR(V)/Fil^0 = tan(G(K)) (Bloch–Kato 3.10.1).
2. A(K) ⊗ Q_p = Â(m_K) ⊗ Q_p since A(K)/Â(m_K) is finite, so the square for Â gives log_BK ∘ κ = log_A.
3. H^1_e = H^1_f = H^1_g: D_cris(V)^{φ=1} = 0 = D_cris(V^*(1))^{φ=1} by the Weil bounds on Frobenius eigenvalues (purity), so the dimension formulas coincide.
4. Naturality follows from functoriality of the Kummer map and of the formal logarithm.

**Dependencies.** [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:L1/bloch-kato-subgroups](#target-padichodgeregulators-l1-bloch-kato-subgroups), [PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction](PadicHodgeTheory.md), [PadicHodgeTheory:R06.6/good-reduction-iff-crystalline](PadicHodgeTheory.md), [PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion](PadicHodgeTheory.md).

**Sources.** [Berger2003](https://arxiv.org/abs/math/0209283v1), Introduction, p. 2: The formal-group square (Bloch–Kato 3.10.1).; [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), §I.6.4, (9), p. 16: H^1_f of V_pA is the Kummer image.

<a id="target-padichodgeregulators-l1-integral-logarithm-unramified"></a>

### The integral Bloch–Kato logarithm for unramified fields

Target `PadicHodgeRegulators:L1/integral-logarithm-unramified` · declaration `blochKato_integral_log`.

**Hypotheses.** p odd; L unramified; 2 ≤ r ≤ p − 2 (Fontaine–Laffaille range).

Let p be odd, L/Q_p finite unramified and 2 ≤ r ≤ p − 2. Then H^1(L, Z_p(r)) is torsion-free of rank [L : Q_p], H^1_f(L, Z_p(r)) = H^1(L, Z_p(r)), and log_BK(H^1(L, Z_p(r))) = (r − 1)!·p^r·O_L·e_r = p^r·O_L·e_r. For r = 1, log_BK(H^1_f(L, Z_p(1))/tors) = p·O_L·e_1 (the logarithm of the principal units). Equivalently, Fontaine's map ∂^r : L → H^1(L, Q_p(r)), the connecting map of L0/fundamental-exact-sequences (c), equals ±exp_BK ∘ (1 − p^{−r}σ)^{−1} and maps O_L isomorphically onto H^1(L, Z_p(r)), because (1 − p^{−r}σ)^{−1}O_L = p^r O_L. The statement is not asserted for ramified L, for r ≥ p − 1, or for p = 2.

**Check.**

- L = Q_5, r = 2: log_BK(H^1(Q_5, Z_5(2))) = 25Z_5·e_2; consistent with Li_2(ω(2)) ≡ 25 mod 125.
- Index check: q^r·|(r−1)!|^{−N} equals [O_L : p^r O_L] = q^r for r ≤ p − 2.
- For p = 3 and r = 2 the range 2 ≤ p − 2 fails and H^1(Q_3, Z_3(2)) has torsion Z/3.

**Construction or proof route.**

1. Torsion-freeness: H^1(L, Z_p(r))_tors ≅ H^0(L, Q_p/Z_p(r)), which vanishes because L is unramified and (p − 1) ∤ r (KTheoryFiniteLocalFields:L.6/h0-of-tate-twists and h1-of-tate-twists).
2. Index: Benois–Nguyen Quang Do Lemma 1.3.2 and Theorem 2.1 give (exp(O_L·e_r) : H^1(L, Z_p(r)))·w^{(p)}_{1−r}(L) = q^r·|(r − 1)!|_p^{−[L:Q_p]} for unramified L, with w^{(p)}_{1−r}(L) = 1 here.
3. Exact lattice, not just its index: BNQD §2.3.2 and Proposition 2.2.4 identify H^1(L,Z_p(r)) with (r−1)! exp(Tr_{L(ζ_p)/L} Ξ_{r,1}(R_{L,1})). For unramified L and n=1, R_{L,1} is generated over O_L by 1+X. Their displayed formula gives Ξ_{r,1}(a(1+X)) = p^{r−1}(σ^{-1}(a)ζ_p − (1−p^rσ^{-1})^{-1}σ^{-1}(a)). Since Tr(ζ_p)=−1 and [L(ζ_p):L]=p−1, its trace is −p^r(1−p^{r−1}σ^{-1})(1−p^rσ^{-1})^{-1}σ^{-1}(a). For r≥2 these three factors are Z_p-linear automorphisms of O_L, so the image is exactly p^rO_L. The torsion obstruction H^0(L,Q_p/Z_p(r−1)) vanishes in 2≤r≤p−2. This proves the lattice equality, while the index formula alone would not.
4. Lattice identity: 1 − p^{−r}σ = −p^{−r}σ(1 − p^rσ^{−1}) with 1 − p^rσ^{−1} invertible on O_L, so (1 − p^{−r}σ)^{−1}O_L = p^r O_L; this gives the Fontaine-normalised form.
5. r = 1: Benois–Nguyen Quang Do Lemma 1.3.2 at m = 1 with e = 1, and the Iwasawa logarithm U^1_L ≅ pO_L.

**Dependencies.** [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:L1/tate-twist-examples](#target-padichodgeregulators-l1-tate-twist-examples), [PadicHodgeRegulators:L0/integral-period-interface](#target-padichodgeregulators-l0-integral-period-interface), [PadicHodgeRegulators:L0/fundamental-exact-sequences](#target-padichodgeregulators-l0-fundamental-exact-sequences), [KTheoryFiniteLocalFields:L.6/h1-of-tate-twists](KTheoryFiniteLocalFields.md), [KTheoryFiniteLocalFields:L.6/h0-of-tate-twists](KTheoryFiniteLocalFields.md).

**Sources.** [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), Lemme 1.3.2, p. 647: The index form.; [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), Théorème 2.1, p. 648: The local Tamagawa number, which with Lemme 1.3.2 gives the index; the lattice form is derived in proofSteps (no open source states it in one line).; [FontaineBPR1994](https://www.imo.universite-paris-saclay.fr/~fontaine/bpr.pdf), §2.1, p. 153: Fontaine's map ∂^r.

<a id="target-padichodgeregulators-l1-semilocal-bloch-kato"></a>

### Semilocal Bloch–Kato maps

Target `PadicHodgeRegulators:L1/semilocal-bloch-kato` · declaration `semilocalBlochKatoExp`.

**Hypotheses.** A finite étale over Q_p; V de Rham at each factor. The componentwise logarithm requires the injectivity hypothesis of L1/bloch-kato-logarithm at every factor; the subgroup construction does not.

For a finite étale Q_p-algebra A = ∏_v K_v (for instance F ⊗ Q_p = ∏_{v|p} F_v for a number field F) and a p-adic representation V of G_{Q_p} (or a family V_v of de Rham representations of the G_{K_v}), put H^1(A, V) := ⊕_v H^1(K_v, V), H^1_*(A, V) := ⊕_v H^1_*(K_v, V) for * ∈ {e, f, g}, D_dR(A, V) := ⊕_v D_dR,K_v(V), and define exp_{A,V} and exp*_{A,V} componentwise. Define log_{A,V} on ⊕_v H^1_e(K_v,V_v) only when D_cris,K_v(V_v)^{φ=1} = H^0(K_v,V_v) for every v. Under Shapiro's isomorphism H^1(Q_p, Ind_{K_v}^{Q_p} V) ≅ H^1(K_v, V) these are the Bloch–Kato maps of the induced representation (L1/twist-and-change-of-field (d)). For a number field F the semilocal Kummer map E_F ⊗ Q_p → H^1_f(F ⊗ Q_p, Q_p(1)) composed with log is the unit regulator of D.1/unit-logarithm-kernel.

**Uses.** Rubin, Euler Systems, Chapter II §2: H^1(K_p, ·) = ⊕_{v|p} H^1(K_v, ·), and similarly for H^1_f and H^1_s; SelmerIwasawaCohomology:L4/bloch-kato-condition: the local condition at every place above p of a number field; PadicHodgeRegulators:D.4/global-p-adic-regulator: the regulator to F ⊗ Q_p is the semilocal log_BK of the étale regulator; Huber–Kings 2003, Appendix A: exp_p : O_F ⊗ Q_p → H^1_f(F ⊗ Q_p, Q_p(1)) is an isomorphism

**API.**

| Name | Contract |
| --- | --- |
| `semilocalBlochKatoF` | semilocalBlochKatoF A V : Submodule ℚ_p (⨁ v, H^1(K_v, V)). |
| `semilocalBlochKatoExp` | semilocalBlochKatoExp A V := ⨁ v, blochKatoExp K_v V. |
| `semilocalBlochKatoLog` | The componentwise logarithm on ⨁ v, blochKatoE K_v V. It requires injective exp at every factor, and is its inverse on the direct sum of the images. |
| `semilocal_shapiro` | Under Shapiro's isomorphism, semilocalBlochKatoExp A V = blochKatoExp ℚ_p (Ind_A V). |
| `semilocal_prod` | For A = A' × A'', the semilocal maps are the direct sums of those of A' and A''. |
| `semilocalBlochKatoF_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `semilocal_split_quadratic` (computation): For F = Q(√2), p = 7: dim_{Q_7} semilocalBlochKatoF (F ⊗ Q_7) Q_7(1) = 2.
- `semilocal_zero_algebra` (degenerate): For A = 0 all semilocal groups are 0.
- `semilocal_field_compat` (compatibility): For A = K a field, the semilocal maps are the local maps of L1.
- `semilocal_independent_factors` (non-example): For p odd and A = Q_p × Q_p, let c = κ(1+p) ≠ 0 in H^1_f(Q_p,Q_p(1)). Both (c,0) and (0,c) belong to semilocalBlochKatoF A Q_p(1) and are independent; replacing this group by the one-dimensional diagonal {(x,x)} fails. The two-factor group agrees with H^1_f(Q_p,Q_p(1) ⊕ Q_p(1)).

**Check.**

- For F = Q(√2) and p = 7 (split), H^1_f(F ⊗ Q_7, Q_7(1)) = H^1_f(Q_7, Q_7(1))², and log of the semilocal Kummer class of 1 + √2 is (log_7(1 + √2), log_7(1 − √2)).

**Construction or proof route.**

1. Componentwise definition; the decomposition of A into fields is canonical.
2. Compatibility with Shapiro is L1/twist-and-change-of-field (d) applied to each factor.
3. For F ⊗ Q_p use the semilocal equivalence of NumberFieldArithmetic layer 5.

**Dependencies.** [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:L1/dual-exponential](#target-padichodgeregulators-l1-dual-exponential), [PadicHodgeRegulators:L1/twist-and-change-of-field](#target-padichodgeregulators-l1-twist-and-change-of-field), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Sources.** [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II §2, p. 25: The semilocal convention.; [HK2](https://arxiv.org/abs/math/0101071v2), §2.3.2, p. 21: A semilocal exponential.
<a id="stage-d1"></a>

## D.1 — Analytic functions and normalizations

Import the Iwasawa logarithm and Coleman polylogarithms, and state their regulator-specific normalization, product, trace and scalar-extension comparisons. General local-unit structure is imported from LocalFieldsRamification.

**Planets:** p-adic dilogarithm D_p on étale algebras; Combined p-adic dilogarithm D_p.

<a id="target-padichodgeregulators-d-1-teichmuller-unit-decomposition"></a>

### Teichmüller decomposition of the units of a local field

Target `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition` · declaration `teichmuller_unit_decomposition`.

**Hypotheses.** L is a nonarchimedean local field of residue characteristic p (Mathlib's IsNonarchimedeanLocalField with Tau Ceti's valuative structure). For the logarithm clause, L is identified with a subfield of C_p by a continuous embedding. The logarithm clause is only for mixed characteristic L/Q_p finite. The unit decomposition is imported from LocalFieldsRamification Layer 1, not replanned here.

Let L be a nonarchimedean local field with valuation ring O_L, maximal ideal m_L and residue field F_q, q = p^f. Write ω = TauCeti.teichmuller L : F_q^× → O_L^× for the Teichmüller lift and U^1_L = 1 + m_L for the principal units. Then every u ∈ O_L^× factors uniquely as u = ω(ū)·⟨u⟩ with ū the residue of u and ⟨u⟩ := u·ω(ū)^{-1} ∈ U^1_L, so that O_L^× = μ_{q-1}(O_L) × U^1_L is an internal direct product; u ↦ ⟨u⟩ is a continuous group homomorphism onto U^1_L. The decomposition is natural for continuous field embeddings L → L' of local fields and for automorphisms of L, and, if L is a finite extension of Q_p, for every branch log_a of the p-adic logarithm (ColemanIntegration:L0/log-branch) one has log_a(u) = log(⟨u⟩), the series logarithm of the principal-unit part, because log_a vanishes on roots of unity.

**Check.**

- For L = Q_5 and u = 7: ū = 2, ω(2) is the unique 4th root of unity ≡ 2 mod 5, and ⟨7⟩ = 7·ω(2)^{-1} ≡ 1 mod 5.
- μ_{q-1}(O_L) ∩ U^1_L = {1}: a decomposition with a nontrivial root of unity in the principal-unit factor is rejected.
- For p = 2 and L = Q_2 the first factor is trivial (q − 1 = 1) and −1 lies in U^1_{Q_2}: the factor of order prime to p does not contain the 2-power roots of unity.

**Construction or proof route.**

1. Import the unit filtration and Teichmüller decomposition of LocalFieldsRamification Layer 1. The following steps check its agreement with the pinned Tau Ceti section and with the regulator branch.
2. The residue map O_L^× → F_q^× is a surjective homomorphism with kernel U^1_L; TauCeti.residue_teichmuller says ω is a section, so u·ω(ū)^{-1} has residue 1 and lies in U^1_L.
3. Uniqueness: if ζ·v = ζ'·v' with ζ, ζ' ∈ μ_{q-1} and v, v' ∈ U^1_L, then ζ'^{-1}ζ ∈ μ_{q-1} ∩ U^1_L = {1}, since a (q−1)-torsion principal unit reduces to 1 and TauCeti.eq_teichmuller forces it to be ω(1) = 1. TauCeti.range_teichmuller identifies the first factor with μ_{q-1}(O_L).
4. Naturality: a continuous embedding L → L' maps O_L into O_{L'}, induces F_q → F_{q'} on residues, and sends (q−1)-torsion units to (q'−1)-torsion units; TauCeti.eq_teichmuller in L' identifies the image of ω_L(α) with ω_{L'}(ᾱ).
5. Logarithm: log_a is a homomorphism vanishing at roots of unity (ColemanIntegration:L0/log-branch), so log_a(u) = log_a(ω(ū)) + log_a(⟨u⟩) = log(⟨u⟩), and on U^1_L the branch agrees with the series.

**Dependencies.** `tauceti:TauCeti.teichmuller`, `tauceti:TauCeti.range_teichmuller`, `tauceti:TauCeti.residue_teichmuller`, `tauceti:TauCeti.eq_teichmuller`, [ColemanIntegration:L0/log-branch](ColemanIntegration.md), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Sources.** [TauCetiTeichmuller](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), TauCeti/NumberTheory/LocalField/Teichmuller.lean, module docstring (pinned commit f790474): The library supplies the Teichmüller section; this node states the resulting internal product decomposition that the layer needs.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38: The regulator calculation works with the Teichmüller (order prime to p) roots of unity and principal units separately.

<a id="target-padichodgeregulators-d-1-unramified-frobenius-on-roots"></a>

### Frobenius on the roots of unity of an unramified field

Target `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots` · declaration `unramified_frobenius_on_roots`.

**Hypotheses.** L/Q_p finite unramified (ramification index one); p any prime for the first two assertions, p odd for μ(L) = μ_{q−1}(L).

Let L be a finite unramified extension of Q_p with residue field F_q and let φ_L be its arithmetic Frobenius, the unique field automorphism of L over Q_p whose reduction is x ↦ x^p on F_q (an arithmetic Frobenius in the sense of IsArithFrobAt for the extension O_L/Z_p). Then φ_L(ω(α)) = ω(α^p) for every α ∈ F_q^×, hence φ_L(ζ) = ζ^p for every ζ ∈ μ_{q-1}(L); for p odd μ(L) = μ_{q-1}(L), so φ_L(ζ) = ζ^p for every root of unity of L. For a finite product L = ∏_i L_i of such fields put φ_L := ∏_i φ_{L_i}; then φ_L(ζ) = ζ^p componentwise. This is the rank-one relation φ_p ζ = ζ^p of GSWZ (176).

**Check.**

- L = Q_{25} (p = 5): φ_L has order 2 and fixes exactly μ_4 ⊂ μ_{24}.
- For p = 2 and L = Q_2, −1 ∈ μ(L) is not of order prime to 2; the identity φ(ζ) = ζ^2 fails for ζ = −1, so the odd-p hypothesis is needed for the full μ(L).

**Construction or proof route.**

1. φ_L(ω(α)) is a (q−1)-torsion unit reducing to α^p, so it equals ω(α^p) by TauCeti.eq_teichmuller; and ω(α)^p is also (q−1)-torsion with residue α^p.
2. For p odd an unramified L contains no nontrivial p-power root of unity (Q_p(ζ_p)/Q_p is totally ramified of degree p − 1 > 1), so μ(L) = μ_{q−1}(L).
3. On a finite product, Frobenius and the Teichmüller lift are taken componentwise.

**Dependencies.** [PadicHodgeRegulators:D.1/teichmuller-unit-decomposition](#target-padichodgeregulators-d-1-teichmuller-unit-decomposition), `tauceti:TauCeti.eq_teichmuller`, `mathlib:IsArithFrobAt`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38: The relation stated here, extended to finite products of unramified fields.; [TauCetiTeichmuller](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), TauCeti/NumberTheory/LocalField/Teichmuller.lean, eq_teichmuller: The uniqueness used to identify φ(ω(α)) with ω(α^p).

<a id="target-padichodgeregulators-d-1-etale-algebra-dilogarithm"></a>

### Coleman's p-adic dilogarithm on a finite étale Q_p-algebra

Target `PadicHodgeRegulators:D.1/etale-algebra-dilogarithm` · declaration `etaleDilog`.

**Hypotheses.** A is a finite étale (equivalently finite reduced) commutative Q_p-algebra; p is any prime. The branch of the logarithm is the Iwasawa branch log_p(p) = 0 (ColemanIntegration:L0/iwasawa-logarithm).

Let A be a finite étale Q_p-algebra, with its canonical decomposition A = ∏_{i∈I} A_i into finite field extensions A_i/Q_p (the primitive idempotents). Put A^adm := {z ∈ A : z_i ∉ {0, 1} for every i}. For a finite extension M/Q_p and x ∈ M ∖ {0, 1} define D_M(x) := ι^{-1}(D^0(ι(x))) for any Q_p-embedding ι : M → C_p, where D^0(z) = Li_2(z) + ½·log_p(z)·log_p(1 − z) is Coleman's dilogarithm for the Iwasawa branch log_p(p) = 0 (ColemanIntegration:L2/dilogarithm-identities with a = 0); it lies in M and does not depend on ι. Define D_A : A^adm → A by D_A(z) := (D_{A_i}(z_i))_{i∈I}, and extend it additively to D_A : Z[A^adm] → A on the free abelian group of formal symbols [z]. This is GSWZ's D_p of (174) applied factor by factor.

**Uses.** GSWZ §3.1, paragraph after (174): the functions D_σ for the embeddings σ : K → C_p are combined into one map with values in K_p, factor by factor; PadicHodgeRegulators:D.3/local-regulator: the regulator on completed K_3 of an unramified algebra is compared with D_A on symbols of special units and of roots of unity; HabiroNumberFields:HB.7/pochhammer-sections: the factor exp(−Li_2(ζ)/(m² log q)) of the explicit sections is D_A(ζ) for roots of unity; HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm: the potential specialises to φ_p(D_p(ξ))/p − p·D_p(ξ) with D_p evaluated componentwise

**API.**

| Name | Contract |
| --- | --- |
| `etaleDilog` | etaleDilog A : A → A is a componentwise total extension of the map on A^adm, assigning 0 at 0 and 1 in each field factor. Only its restriction to A^adm has mathematical content; it is not required to be zero as an entire vector whenever one component is inadmissible. |
| `etaleAdmissible` | etaleAdmissible z : every component of z differs from 0 and 1 (the domain A^adm). |
| `etaleDilog_apply_pi` | For A = ∏_i A_i and admissible z, (etaleDilog A z)_i = etaleDilog A_i z_i. |
| `etaleDilog_field` | For a finite field extension M ⊂ C_p of Q_p and x ∈ M ∖ {0,1}, etaleDilog M x = D^0(x), Coleman's D for the Iwasawa branch. |
| `etaleDilog_map` | For a Q_p-algebra homomorphism f : A → B of finite étale algebras with f(A^adm) ⊆ B^adm, etaleDilog B (f z) = f (etaleDilog A z). |
| `etaleDilog_one_sub` | etaleDilog A (1 − z) = −etaleDilog A z for admissible z. |
| `etaleDilog_inv` | etaleDilog A z⁻¹ = −etaleDilog A z for admissible z. |
| `etaleDilog_fiveTerm` | For x, y ∈ A^adm with x − y a unit, D(x) − D(y) + D(y/x) − D((1 − x⁻¹)/(1 − y⁻¹)) + D((1 − x)/(1 − y)) = 0 componentwise (ColemanIntegration:L2/five-term-relation). |
| `etaleDilog_rootOfUnity` | For ζ ∈ A with ζ^m = 1 and all components ≠ 1, etaleDilog A ζ = (Li_2(ζ_i))_i, since log_p vanishes on roots of unity. |
| `etaleDilogHom` | The additive extension FreeAbelianGroup A^adm →+ A, [z] ↦ etaleDilog A z. |
| `etaleDilog_extensionality` | Two dilogarithm values in a finite product agree iff all component values agree. The additive extension is determined by its values on admissible FreeAbelianGroup generators; it preserves zero and addition, whereas D_A on admissible points is not an additive map. |
| `etaleDilogHom_of` | etaleDilogHom D (FreeAbelianGroup.of z) = etaleDilog D z.val for z∈A^adm. |

**Discriminating tests.**

- `etaleDilog_neg_one` (computation): For p odd, etaleDilog Q_p (−1) = 0: the inversion relation gives D(−1) = −D(−1).
- `etaleDilog_teichmuller_two_mod` (computation): For p = 5 and ω = TauCeti.teichmuller Q_5 2 (a primitive 4th root of unity), etaleDilog Q_5 ω ∈ 25·Z_5 and etaleDilog Q_5 ω ≡ 25 mod 125 (by D.3/finite-polylogarithm-reduction, since li_{2,5}(2) = 1 in F_5); this is the Q_5-component of D_5(ζ_24) in GSWZ (273).
- `etaleDilog_zero_algebra` (degenerate): For the zero algebra A = 0 (empty product), A^adm = {0} and etaleDilog A 0 = 0.
- `etaleDilog_diag` (compatibility): For the diagonal Q_p → Q_p × Q_p and x ∉ {0,1}, etaleDilog (Q_p × Q_p) (x, x) = (D^0(x), D^0(x)), agreeing with ColemanIntegration's D^0.
- `etaleDilog_not_branch_one` (non-example): With the branch log_1 (log_1(p) = 1) instead of the Iwasawa branch, D^1(p) − D^0(p) = ½·log_p(1 − p) ≠ 0 (ColemanIntegration:L2/dilogarithm-identities (d)); a definition with an unpinned branch is wrong at z = p ∈ Q_p^adm.

**Check.**

- For A = Q_p × Q_p and z = (x, y), D_A(z) = (D(x), D(y)).
- D_A is defined at z = (−1, 2) ∈ Q_5 × Q_5 but not at (1, 2): admissibility is componentwise.

**Construction or proof route.**

1. Values in M: D^0 maps M ∖ {0,1} into M for every finite M ⊂ C_p (ColemanIntegration:L2/values-in-finite-extensions with a = 0).
2. Independence of ι: two embeddings differ by a continuous automorphism σ of C_p over Q_p, and σ(D^0(z)) = D^0(σ z) because the Iwasawa branch is Galois equivariant (ColemanIntegration:L2/galois-equivariance and L2/dilogarithm-identities (f)).
3. The decomposition of A into fields is canonical, so D_A is well defined; additivity defines it on the free abelian group.

**Dependencies.** [ColemanIntegration:L2/dilogarithm-identities](ColemanIntegration.md), [ColemanIntegration:L0/iwasawa-logarithm](ColemanIntegration.md), [ColemanIntegration:L2/galois-equivariance](ColemanIntegration.md), [ColemanIntegration:L2/values-in-finite-extensions](ColemanIntegration.md), `mathlib:PadicComplex`, `mathlib:FreeAbelianGroup`.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (174), p. 37: The function D^0 used factor by factor.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph after (174), p. 38: The combination into an algebra-valued map; here it is done for any finite étale Q_p-algebra.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, after Remark 1.5 (Galois equivariance), p. 3: Values in the field of the argument, for a branch with log p = 0.

<a id="target-padichodgeregulators-d-1-dilogarithm-scalar-extension"></a>

### Frobenius and extension-of-scalars squares for the p-adic dilogarithm

Target `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension` · declaration `dilogarithm_scalar_extension`.

**Hypotheses.** A, B finite étale Q_p-algebras; the Iwasawa branch throughout. In (b) for Frobenius and in (d), A is a finite product of finite unramified extensions of Q_p.

Let A → B be an injective homomorphism of finite étale Q_p-algebras (for instance K ⊗ Q_p → K' ⊗ Q_p for an extension of number fields K ⊂ K', or the inclusion of a factor-wise extension of local fields). (a) Extension of scalars: for z ∈ A^adm, D_B(ι z) = ι(D_A(z)). (b) Automorphisms: for every Q_p-algebra automorphism τ of A, D_A(τ z) = τ(D_A(z)); in particular, for a finite unramified product A with Frobenius φ_A (D.1/unramified-frobenius-on-roots), D_A(φ_A z) = φ_A(D_A(z)) and D_A(ζ^p) = φ_A(D_A(ζ)) for every root of unity ζ of order prime to p with all components ≠ 1. (c) Trace: if B is free over A, then Tr_{B/A}(D_B(ι z)) = [B : A]·D_A(z) for z ∈ A^adm. (d) Frobenius-modified value: for A unramified and ζ ∈ μ(A) of order prime to p with all components ≠ 1, (1 − p^{-2}φ_A)(D_A(ζ)) = ℓ_2(ζ), the integral modified dilogarithm of ColemanIntegration:L2/integral-modified-polylogarithm, which lies in O_A. (e) Frobenius behaviour on residue discs of special units: for p odd, A unramified and z ∈ O_A with z and 1 − z units in every factor, D_A(z) − p^{−2}D_A(z^p) = Li^{(p)}_2(z) − ½·log_p(z)·Li^{(p)}_1(z) componentwise, and this lies in O_A (Li^{(p)}_k = ℓ_k is bounded by 1 off the residue disc of 1, and log_p(z) ∈ pO_A).

**Check.**

- For A = Q_{25}, p = 5, ζ = ζ_24: D(ζ_24^5) = φ(D(ζ_24)), checked on the expansions of GSWZ (273) as a 5-adic identity in Z_{25}.
- For p>3, (1−p^(−2)φ)D(ζ)=ℓ_2(ζ) exactly and D(ζ)∈p²O_A. When ℓ_2(ζ) is a unit, the two values generate lattices differing by p²; no unit claim is made for every ζ.

**Construction or proof route.**

1. (a) and (b) are etaleDilog_map applied to the injection and to τ; the decomposition of A and B into fields is respected by algebra maps, and on each factor the claim is Galois equivariance of D^0 for the Iwasawa branch.
2. For Frobenius, φ_A(ζ) = ζ^p (D.1/unramified-frobenius-on-roots), so D_A(ζ^p) = D_A(φ_A ζ) = φ_A D_A(ζ).
3. (c) Tr_{B/A}∘ι is multiplication by the rank on ι(A).
4. (d) D(ζ) = Li_2(ζ) since log_p ζ = 0; ColemanIntegration:L2/values-at-tame-roots-of-unity (a) with k = 2 gives Li_2(ζ) − p^{-2}Li_2(ζ^p) = ℓ_2(ζ), and Li_2(ζ^p) = φ_A(Li_2(ζ)) by (b).
5. (e) is ColemanIntegration:L2/dilogarithm-identities (e) on each factor, with ColemanIntegration:L2/frobenius-relation identifying Li^{(p)}_k with the integral function ℓ_k on P¹ ∖ D⁻(1,1) and D.1/unit-logarithm-kernel giving log_p(z) ∈ pO_A.

**Dependencies.** [PadicHodgeRegulators:D.1/etale-algebra-dilogarithm](#target-padichodgeregulators-d-1-etale-algebra-dilogarithm), [PadicHodgeRegulators:D.1/unramified-frobenius-on-roots](#target-padichodgeregulators-d-1-unramified-frobenius-on-roots), [ColemanIntegration:L2/galois-equivariance](ColemanIntegration.md), [ColemanIntegration:L2/values-at-tame-roots-of-unity](ColemanIntegration.md), [ColemanIntegration:L2/integral-modified-polylogarithm](ColemanIntegration.md), [ColemanIntegration:L2/frobenius-relation](ColemanIntegration.md), [PadicHodgeRegulators:D.1/unit-logarithm-kernel](#target-padichodgeregulators-d-1-unit-logarithm-kernel), `mathlib:Algebra.trace`.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38: The Frobenius compatibility on roots of unity.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6: Frobenius equivariance at roots of unity of order prime to p.

<a id="target-padichodgeregulators-d-1-combined-dilogarithm"></a>

### The combined p-adic dilogarithm of a number field

Target `PadicHodgeRegulators:D.1/combined-dilogarithm` · declaration `blochDilog`.

**Hypotheses.** K a number field, p any prime; the integrality statements of D.3–D.4 add p > 3 unramified in K. The Iwasawa branch is used to define D; branch independence is asserted only on B(K).

Let K be a number field, p a prime and K_p := K ⊗_Q Q_p, a finite étale Q_p-algebra identified with ∏_{v|p} K_v by Tau Ceti's semilocal equivalence (NumberFieldArithmetic layer 5). Define D_{K,p} on the free abelian group Z[K^×] by [z] ↦ D_{K_p}(z ⊗ 1) for z ≠ 1 (D.1/etale-algebra-dilogarithm; z ⊗ 1 is admissible) and [1] ↦ 0. Its v-component is D_σ([z]) = D^0(σ_v(z)) for the embedding σ_v : K → K_v ⊂ C_p, as in GSWZ §3.1. D_{K,p} kills the five-term relations, hence factors through the pre-Bloch group P(K) of K3BlochGroups:V.3/pre-bloch-group, and restricts to D_{K,p} : B(K) → K_p on Suslin's Bloch group. On B(K) the map does not depend on the branch of the logarithm used to define D.

**Uses.** GSWZ §1.5, (19) and (22): the regulator D_p(ξ) entering the formal completion f̂ of an invertible section; PadicHodgeRegulators:D.4/special-unit-formula: equals the global p-adic regulator on Bloch elements presented by special units at p; HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm: D_p(ξ) = Σ_j D_p(z_j) for the Nahm-equation solutions z_j; HabiroNumberFields:HB.7/invertible-local-sections: the normalisation of the local sections uses D_p(ξ)

**API.**

| Name | Contract |
| --- | --- |
| `combinedDilog` | combinedDilog K p : FreeAbelianGroup Kˣ →+ K ⊗[ℚ] ℚ_[p], with [1] ↦ 0. |
| `combinedDilog_of` | combinedDilog K p [z] = etaleDilog (K ⊗ ℚ_[p]) (z ⊗ 1). |
| `combinedDilog_component` | Under K ⊗ Q_p ≅ ∏_{v\|p} K_v, the v-component of combinedDilog K p [z] is D^0(σ_v z). |
| `combinedDilog_fiveTerm` | combinedDilog vanishes on the five-term subgroup, giving preBlochDilog K p : P(K) →+ K ⊗ Q_p. |
| `blochDilog` | blochDilog K p : B(K) →+ K ⊗ Q_p, the restriction of preBlochDilog to Suslin's Bloch group. |
| `blochDilog_branch_indep` | For any branch parameter a ∈ Q_p, the Bloch-group map built from D^a equals blochDilog K p. |
| `blochDilog_map` | For a field embedding K → K', blochDilog K' p ∘ B(ι) = (ι ⊗ 1) ∘ blochDilog K p. |
| `blochDilog_galois` | For τ ∈ Aut(K), blochDilog K p ∘ B(τ) = (τ ⊗ 1) ∘ blochDilog K p. |
| `combinedDilog_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `combinedDilog_rat` (compatibility): For K = Q, combinedDilog Q p [z] = D^0(z) ∈ Q_p, the ColemanIntegration value.
- `combinedDilog_zero` (degenerate): combinedDilog K p 0 = 0, and blochDilog vanishes on the subgroup generated by [x] + [x⁻¹] for x ≠ 0, 1.
- `blochDilog_cubic_five` (computation): For K = Q(α), α³ − α² + 1 = 0, ξ = 2[1 − α²] + [1 − α] ∈ B(K) and p = 5, blochDilog K 5 ξ = (3·5² + 5³ + 2·5⁴ + …)α² + (5² + 3·5³ + …)α + (2·5² + 3·5³ + …), GSWZ (271).
- `combinedDilog_not_on_bloch_branch` (non-example): On the pre-Bloch group the map depends on the branch: for p odd the symbol [p] ∈ P(Q) has D^1([p]) − D^0([p]) = ½·log_p(1 − p) ≠ 0, so branch independence is not asserted off B(K) ([p] ∉ B(Q) since p ∧ (1 − p) ≠ 0).

**Check.**

- For K = Q, D_{Q,p}([z]) = D^0(z) ∈ Q_p.
- For K = Q(α), α³ − α² + 1 = 0 and p = 5, D_{K,5}(2[1 − α²] + [1 − α]) is the value printed in GSWZ (271), with K_5 ≅ Q_{25} × Q_5.

**Construction or proof route.**

1. The five-term relation of ColemanIntegration:L2/five-term-relation holds in every factor K_v ⊂ C_p, so the additive extension kills the five-term subgroup and descends to P(K).
2. Branch independence on B(K): by ColemanIntegration:L2/dilogarithm-identities (d), D^a(z) − D^b(z) = ½(a − b)·Φ(z ∧ (1 − z)) with Φ(x ∧ y) = v(x)·log_b(y) − v(y)·log_b(x) an alternating biadditive form; it vanishes on the kernel of the boundary, which is B(K) (for Suslin's antisymmetric target, Φ factors through it since Φ(x ∧ x) = 0).
3. The identification of components with the D_σ is the definition of the semilocal equivalence.

**Dependencies.** [PadicHodgeRegulators:D.1/etale-algebra-dilogarithm](#target-padichodgeregulators-d-1-etale-algebra-dilogarithm), [K3BlochGroups:V.3/pre-bloch-group](K3BlochGroups.md), [K3BlochGroups:V.3/bloch-group](K3BlochGroups.md), [K3BlochGroups:V.3/five-term-relation](K3BlochGroups.md), [ColemanIntegration:L2/five-term-relation](ColemanIntegration.md), [ColemanIntegration:L2/dilogarithm-identities](ColemanIntegration.md), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph after (174), p. 38: The construction; here for all p, with the integrality restricted to unramified p > 3.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Example 4.3, (270)–(271), p. 54: The computation test; z_2 = z_1² − z_1 + 2 = 1 − α and z_3 = z_1.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.15, p. 6: Branch independence on the weight-two cohomology, proved here directly for B(K) from the explicit branch difference.

<a id="target-padichodgeregulators-d-1-regulator-normalisation-dictionary"></a>

### Dictionary of dilogarithm and regulator normalisations

Target `PadicHodgeRegulators:D.1/regulator-normalisation-dictionary` · declaration `regulator_normalisation_dictionary`.

**Hypotheses.** p any prime for (i), (ii) and (v); (iii) and (iv) concern unramified, respectively arbitrary, finite extensions L/Q_p. The p²-integrality clause in (iii) requires p>3.

Fix the Iwasawa branch. On C_p ∖ {0,1}: (i) GSWZ's D_p(z) = Li_2(z) + ½ log(z) log(1 − z) (GSWZ (174)) equals Coleman's D(z) (ColemanIntegration:L2/dilogarithm-identities with a = 0), Besser–de Jeu's L_mod,2(z) = L_2(z) + ½ log(z) L_1(z) = Li_2(z) − ½ log(z) Li_1(z) (BdJ §1, the unique choice for n = 2), and the n = 2 case L^mod_2 = Li_2 + B_1 Li_1 log of ColemanIntegration:L3/padic-regulator-polylogarithm (B_1 = −1/2, Li_1(z) = −log(1 − z)). (ii) Besser–de Jeu's regulator formula carries the factor ±(n − 1)!, which is ±1 for n = 2; the sign is the indeterminacy of BdJ Remark 1.7 and is fixed once in D.3/local-regulator. (iii) Gros's syntomic regulator on an unramified field satisfies reg^Gros = (1 − Frob/p²)·reg^Besser in weight two (BdJ Remark 1.13); on a root of unity ζ of order prime to p it takes the value ℓ_2(ζ) = Li_2(ζ) − p^{-2}Li_2(ζ^p) ∈ O, while for p>3 the Besser value Li_2(ζ) lies in p²O (D.1/dilogarithm-scalar-extension (d)). (iv) Forward comparison, established at D.2/syntomic-etale-regulator-comparison rather than used to prove D.1: the Bloch–Kato normalisation: under D_dR(Q_p(2)) = L·e_2, e_2 = t^{-2}⊗ε^{⊗2}, with t = log[ε] the period of Q_p(1), the regulator of GSWZ is ε·log_BK∘c_{2,1} for one sign ε ∈ {±1} (D.2/syntomic-etale-regulator-comparison). (v) On roots of unity ζ ≠ 1 every branch gives the same value D(ζ) = Li_2(ζ), and on special units (|z| = |1 − z| = 1) D is branch independent.

**Check.**

- L_mod,2 = D on every z ∈ C_p ∖ {0,1}, checked symbolically from the definitions.
- For p = 5 and ζ = ω(2) ∈ Q_5: Li_2(ζ) ≡ 25 mod 125 while ℓ_2(ζ) = (1 − 5^{-2})Li_2(ζ) ≡ −1 mod 5 is a unit.

**Construction or proof route.**

1. (i) Li_1(z) = −log(1 − z) turns L_2 + ½ log·L_1 into Li_2 + ½ log z log(1 − z); with B_0 = 1, B_1 = −1/2 the Bernoulli formula gives the same function.
2. (ii) and (iii) are BdJ Theorem 1.6(2) with n = 2 and BdJ Remark 1.13; (iii) at roots of unity is ColemanIntegration:L2/values-at-tame-roots-of-unity (a) with k = 2.
3. (v) is ColemanIntegration:L2/branch-dependence (i) and (iv) at k = 2, combined with log_a(ζ) = 0.

**Dependencies.** [ColemanIntegration:L2/dilogarithm-identities](ColemanIntegration.md), [ColemanIntegration:L3/padic-regulator-polylogarithm](ColemanIntegration.md), [ColemanIntegration:L2/branch-dependence](ColemanIntegration.md), [PadicHodgeRegulators:D.1/dilogarithm-scalar-extension](#target-padichodgeregulators-d-1-dilogarithm-scalar-extension), `mathlib:bernoulli`.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, after Remark 1.5's preamble, p. 3: Identity (i).; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6: Identity (iii).; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §1.5, (19), p. 9: The normalisation GSWZ adopt; see sourceIssues E101 for the scope of the cited theorem.

<a id="target-padichodgeregulators-d-1-unit-logarithm-kernel"></a>

### Kernel of the logarithm on local units and the p-adic regulator matrix

Target `PadicHodgeRegulators:D.1/unit-logarithm-kernel` · declaration `unit_logarithm_kernel`.

**Hypotheses.** log_p is the Iwasawa branch (log_p(p) = 0); embeddings σ_j : F → C_p are the [F:Q] field embeddings.

(a) Let L/Q_p be finite. The Iwasawa logarithm restricts to a continuous homomorphism log_p : O_L^× → L whose kernel is the finite group μ(L) of all roots of unity in L (including those of p-power order, and ±1 when p = 2) and whose image is an open Z_p-submodule of L; hence log_p induces an isomorphism (O_L^×)^∧_p ⊗_{Z_p} Q_p ≅ L, and for L unramified and p odd it maps U^1_L = 1 + pO_L isomorphically onto pO_L. (b) Let F be a number field, E_F its unit group and ε_1, …, ε_r a basis of E_F modulo torsion. The composite E_F ⊗ Z_p → ∏_{v|p}(O_v^×)^∧_p → ∏_{v|p} F_v = F ⊗ Q_p (completion followed by log_p), after the scalar extension F ⊗ Q_p ⊗_{Q_p} C_p ≅ C_p^{Hom(F, C_p)}, has matrix (log_p σ_j(ε_i))_{i ≤ r, j ≤ [F:Q]}. In particular rr_p(F), the rank of this matrix (Polylogarithms:P.6/padic-regulator), is the Z_p-rank of the image of E_F ⊗ Z_p in ∏_{v|p}(O_v^×)^∧_p, and Leopoldt's conjecture for (F,p) is injectivity of the rational unit logarithm (E_F/μ(F))⊗_Z Q_p → F⊗_Q Q_p. This is equivalent to full rank r of the displayed logarithm matrix; torsion is removed before stating the rank criterion.

**Check.**

- For L = Q_p (p odd), log_p(Z_p^×) = pZ_p and the kernel is μ_{p−1}.
- For p = 2 and L = Q_2 the kernel is {±1}: the torsion kernel must include 2-power roots of unity.
- For F = Q(√2), p = 7 and ε = 1 + √2, the 1 × 2 matrix (log_7(1 + √2), log_7(1 − √2)) has rank 1 because ε is not a root of unity.

**Construction or proof route.**

1. (a) By the Teichmüller decomposition log_p(u) = log(⟨u⟩); on U^1_L the logarithm is a homomorphism whose kernel is the p-power torsion (a principal unit with log 0 is a root of unity: the series log and exp are inverse on 1 + p^c O_L for c > 1/(p − 1)), and it is an isomorphism 1 + p^c O_L ≅ p^c O_L for such c. So the kernel on O_L^× is μ(L) and the image contains p^c O_L, an open lattice.
2. For L unramified and p odd, c = 1 works and U^1_L contains no nontrivial p-power roots of unity.
3. (b) Under the semilocal equivalence the v-component is log_p on F_v; extending scalars to C_p and decomposing by embeddings gives the entries log_p σ_j(ε_i) by ColemanIntegration:L0/log-branch-field-compatibility.

**Dependencies.** [ColemanIntegration:L0/iwasawa-logarithm](ColemanIntegration.md), [ColemanIntegration:L0/log-one-add-convergence](ColemanIntegration.md), [ColemanIntegration:L0/log-branch-field-compatibility](ColemanIntegration.md), [PadicHodgeRegulators:D.1/teichmuller-unit-decomposition](#target-padichodgeregulators-d-1-teichmuller-unit-decomposition), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, p. 37: The branch fixed throughout the layer.

<a id="target-padichodgeregulators-d-1-logarithm-norm-trace"></a>

### The logarithm takes norms to traces

Target `PadicHodgeRegulators:D.1/logarithm-norm-trace` · declaration `logarithm_norm_trace`.

**Hypotheses.** log_p is the Iwasawa branch, applied factor by factor.

Let A → B be a finite free extension of finite étale Q_p-algebras (for instance an extension of finite products of p-adic fields, or K ⊗ Q_p → K' ⊗ Q_p for number fields K ⊂ K'). For every u ∈ B^× with log_p defined componentwise, log_p(N_{B/A}(u)) = Tr_{B/A}(log_p(u)). In particular, for an extension of p-adic fields L'/L, log_p ∘ N_{L'/L} = Tr_{L'/L} ∘ log_p on L'^×, and the same holds on the completed unit groups.

**Check.**

- For L' = Q_{p²}, L = Q_p and u = ω(α) a Teichmüller unit, both sides vanish.
- Field preservation matters: take L=Q_p, L′/L unramified quadratic and a∈L′\Q_p. The C_p-valued branch log_a(p)=a has log_a(N_{L′/L}p)=2a but Tr_{L′/L}(log_a p)=Tr(a)∈Q_p; these differ. Such a branch does not define an L-valued logarithm on L and is outside the theorem’s hypotheses.

**Construction or proof route.**

1. Reduce to fields by decomposing A and B; for L'/L separable, N(u) = ∏_σ σ(u) and Tr(x) = Σ_σ σ(x) over the L-embeddings of L' into C_p.
2. log_p is a homomorphism and commutes with every continuous automorphism of C_p (the Iwasawa branch is Galois equivariant), so log_p(∏_σ σ u) = Σ_σ σ(log_p u).

**Dependencies.** [ColemanIntegration:L0/iwasawa-logarithm](ColemanIntegration.md), [ColemanIntegration:L0/log-branch-field-compatibility](ColemanIntegration.md), `mathlib:Algebra.norm`, `mathlib:Algebra.trace`.

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, after Remark 1.5's preamble, p. 3: Galois equivariance, the input that turns norms into traces.
<a id="stage-d2"></a>

## D.2 — Étale and syntomic regulators

Import Soulé classes and their continuous realization. Construct the smooth rigid syntomic regulator and compare it with Bloch–Kato and special-unit polylogarithms. The four classical log-syntomic interfaces consume the separately owned CS prefix; they do not turn D.2 into a second generic syntomic foundation.

**Planets:** Soulé's étale regulator; Besser's syntomic regulator; Besser–de Jeu dilogarithm formula.

<a id="target-padichodgeregulators-d-2-etale-regulator"></a>

### Soulé's étale regulator to continuous Galois cohomology

Target `PadicHodgeRegulators:D.2/etale-regulator` · declaration `etaleRegulator`.

**Hypotheses.** F of characteristic 0; Chern classes in the normalisation of Soulé (Chern classes, not Chern character components); n ≥ 1.

Let F be a field of characteristic 0 (a number field, a finite extension of Q_p, or a finite product of such), p a prime and n ≥ 1. The étale regulator r^et_n : K_{2n−1}(F) → H^1(F, Z_p(n)) is the composite of the reductions K_{2n−1}(F) → K_{2n−1}(F; Z/p^ν), Soulé's étale Chern classes c_{n,1} : K_{2n−1}(F; Z/p^ν) → H^1(F, μ_{p^ν}^{⊗n}) (compatible in ν), and the inverse limit H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) of continuous cohomology; it factors through the completion K_{2n−1}(F; Z_p) and induces r^et_n ⊗ Q : K_{2n−1}(F) ⊗ Q_p → H^1(F, Q_p(n)). For n = 1 it is the Kummer map F^× → H^1(F, Z_p(1)). For F a finite extension of Q_p and n ≥ 2 the map on completed K-theory is the isomorphism of KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1.

**Uses.** Huber–Kings 2011, §1.3 and Theorem 1.3.2: Soulé's regulator r_p, compared with the Bloch–Kato exponential of the p-adic Borel regulator; PadicHodgeRegulators:D.3/local-regulator: the p-adic regulator on completed K_3 is ε·log_BK∘r^et_2; EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: z = log_BK(reg_et(u)) is the étale side of the elliptic Frobenius factor; KatoEulerSystems:L1: étale Chern classes of symbols on modular curves, imported through D.2

**API.**

| Name | Contract |
| --- | --- |
| `etaleRegulator` | etaleRegulator F p n : K_{2n−1}(F) →+ H^1(F, ℤ_p(n)). |
| `etaleRegulator_completed` | The factorisation through K_{2n−1}(F; ℤ_p), a ℤ_[p]-linear map. |
| `etaleRegulator_one` | For n = 1, etaleRegulator F p 1 is the Kummer map F^× → H^1(F, ℤ_p(1)). |
| `etaleRegulator_map` | For a field embedding F → F', res ∘ etaleRegulator F = etaleRegulator F' ∘ K_{2n−1}(ι). |
| `etaleRegulator_transfer` | For F'/F finite, cor ∘ etaleRegulator F' = etaleRegulator F ∘ N_{F'/F} (transfer). |
| `etaleRegulator_local_equiv` | For F/ℚ_p finite and n ≥ 2, the completed map is the isomorphism of KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1. |
| `etaleRegulator_completion` | For a number field F and v \| p, res_v ∘ etaleRegulator F = etaleRegulator F_v ∘ c_v. |
| `etaleRegulator_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `etaleRegulator_kummer` (compatibility): For F = Q_p, n = 1 and u ∈ Z_p^×, etaleRegulator F p 1 u is the image of u under lim_ν of Tau Ceti's kummerClassMap.
- `etaleRegulator_rank_q5` (computation): For F = Q_5, n = 2, the completed etaleRegulator is a ℤ_5-linear isomorphism between free modules of rank 1.
- `etaleRegulator_torsion_Q` (degenerate): For F = Q and n = 2, K_3(Q) ≅ Z/48 is torsion, so the image of etaleRegulator Q p 2 lies in the torsion of H^1(Q, Z_p(2)) and its rationalisation is 0.
- `etaleRegulator_not_basis_functional` (non-example): For F = Q_{p²} and p > 3, a ℤ_p-isomorphism K_3(F; ℤ_p) ≅ ℤ_p² chosen from bases is not etaleRegulator: etaleRegulator commutes with the Frobenius automorphism of F, while a generic basis isomorphism does not.

**Check.**

- For F = Q_p and n = 1, r^et_1(u) for u ∈ Z_p^× is the Kummer class of u, Tau Ceti's kummerClassMap in the limit.
- For F = Q_5 and n = 2, the completed map K_3(Q_5; Z_5) → H^1(Q_5, Z_5(2)) ≅ Z_5 is an isomorphism.

**Construction or proof route.**

1. Soulé's Chern classes c_{n,1} with Z/p^ν-coefficients are supplied by MotivicEtaleKTheory (request on M.7: the Chern-class part that needs only étale K-theory, as RT-AREA-ktheory-2/18 directs); their compatibility with the coefficient maps ν ↦ ν ± 1 gives the limit.
2. ArithmeticGaloisDuality:R02.1/tate-inverse-limit identifies lim_ν H^1(F, μ_{p^ν}^{⊗n}) with continuous H^1(F, Z_p(n)) (the lim¹ term vanishes since the H^0 are finite).
3. For n = 1, c_{1,1} is the Kummer map (KTheoryFiniteLocalFields:L.7/etale-chern-class-completion, degree one).

**Dependencies.** [MotivicEtaleKTheory:M.7](MotivicEtaleKTheory.md), [MotivicEtaleKTheory:M.1](MotivicEtaleKTheory.md), [KTheoryFiniteLocalFields:L.1/k-theory-mod-m](KTheoryFiniteLocalFields.md), [KTheoryFiniteLocalFields:L.1/completed-k-theory](KTheoryFiniteLocalFields.md), [KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1](KTheoryFiniteLocalFields.md), [KTheoryFiniteLocalFields:L.7/etale-chern-class-completion](KTheoryFiniteLocalFields.md), [ArithmeticGaloisDuality:R02.1/tate-inverse-limit](ArithmeticGaloisDuality.md), `tauceti:TauCeti.kummerClassMap`, [SelmerIwasawaCohomology:L0/padic-kummer-identification](SelmerIwasawaCohomology.md).

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), §1.3, p. 8: Soulé's regulator r_p as Chern classes, the definition used here.; [NN2016](https://arxiv.org/abs/1309.7620v5), §5.2, p. 59: The étale regulator for varieties; for X = Spec F and i = 0 it is the map of this node.

<a id="target-padichodgeregulators-d-2-rigid-syntomic-cohomology"></a>

### Rigid syntomic cohomology of smooth schemes over a p-adic integer ring

Target `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology` · declaration `rigidSyntomicCohomology`.

**Hypotheses.** R a complete DVR, char K = 0, k perfect of characteristic p (finite in the arithmetic applications); X smooth, separated and of finite type over R.

Let R be a complete discrete valuation ring of characteristic 0 with perfect residue field k of characteristic p and fraction field K, R_0 = W(k), K_0 = R_0[1/p], and n ∈ Z. For a smooth R-scheme X with syntomic data (a smooth P_0 over R_0 with a σ-semilinear Frobenius lift Φ, a smooth P over R, X ↪ P and P_0 → P), Besser's rigid syntomic complex is RΓ_syn(X, n) := Cone(Fil^n RΓ_dR(X_K) ⊕ RΓ_rig(X_k/K_0) → RΓ_rig(X_k/K) ⊕ RΓ_rig(X_k/K_0))[−1], (a, b) ↦ (a − b, (1 − Φ*/p^n)b), with RΓ_rig from overconvergent de Rham complexes on the tubes; its cohomology H^i_syn(X, n) is independent of the syntomic data and functorial in X. For X = Spec R and n ≥ 1, H^i_syn(Spec R, n) = 0 for i ≠ 1 and the de Rham component η : H^1_syn(Spec R, n) ≅ K is an isomorphism (1 − σ/p^n being bijective on K_0).

**Uses.** Huber–Kings 2011, Definition 2.2.1 and Example 2.2.4: the target H^1_syn(Spec R, n) = K of the syntomic regulator on K_{2n−1}(R); Besser–de Jeu, §4: the modified syntomic cohomology H̃_ms receives Chern classes and computes the regulator on K_3; PadicHodgeRegulators:D.5/curve-syntomic-regulator: H^2_syn(X, 2) of a smooth proper curve with good reduction is identified with H^1_dR(X_K); ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements: the target K of Besser's regulator in the Coleman formula

**API.**

| Name | Contract |
| --- | --- |
| `rigidSyntomicCohomology` | rigidSyntomicCohomology X n i : the Q_p-vector space H^i_syn(X,n); 1−Φ/p^n is Q_p-linear. At Spec R, η transports the K-module structure if desired. |
| `rigidSyntomicCohomology_map` | A morphism of smooth R-schemes X → Y induces H^i_syn(Y, n) → H^i_syn(X, n), with map_id and map_comp. |
| `rigidSyntomic_long_exact` | For the filtered complex F^nRΓ_dR, the cone gives …→H^{i−1}(F^nRΓ_dR)⊕H^{i−1}_rig(K_0)→H^{i−1}_rig(K)⊕H^{i−1}_rig(K_0)→H^i_syn→H^i(F^nRΓ_dR)⊕H^i_rig(K_0)→… . Do not replace H^i(F^nRΓ_dR) by F^nH^i_dR without a degeneration/strictness theorem; smooth nonproper schemes need not allow this replacement. |
| `rigidSyntomic_spec_eta` | η : H^1_syn(Spec R, n) ≃ K for n ≥ 1. |
| `rigidSyntomic_spec_vanish` | H^i_syn(Spec R, n) = 0 for i ≠ 1 and n ≥ 1. |
| `rigidSyntomic_independent` | Independence of the syntomic data up to canonical isomorphism. |
| `rigidSyntomicCohomology_extensionality` | The cohomology carrier is obtained from the specified Q_p-linear cone. Functorial induced maps are equal when the corresponding chain maps are homotopic; cohomology-map equality is pointwise. A homotopy does not assert equality of raw complexes. |

**Discriminating tests.**

- `rigidSyntomic_zp_two` (computation): For R = Z_p, H^1_syn(Spec Z_p, 2) ≅ Q_p via η, and, with Huber–Kings' cone map (a, b) ↦ (a − b, (1 − Φ/p^n)b), the class of (0, c) with c ∈ Q_p maps to (1 − 1/p²)^{−1}c.
- `rigidSyntomic_weight_zero` (degenerate): For n = 0 and X = Spec R, H^0_syn(Spec R, 0) ≅ Q_p (the kernel of 1 − σ on K_0 is Q_p) and the η-isomorphism of the n ≥ 1 case does not hold.
- `rigidSyntomic_monsky_washnitzer` (compatibility): For X smooth affine, the rigid terms are Monsky–Washnitzer cohomology of the dagger algebra (PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison).
- `rigidSyntomic_not_de_rham` (non-example): H^1_syn(Spec R, n) is not Fil^n H^0_dR(K) (which is 0 for n ≥ 1): the syntomic group sees the cone, not the filtration step.
- `rigidSyntomic_filtration_complex` (non-example): For X_K=A¹_K, H¹(F¹RΓ_dR(X_K))=K[x]dx, whereas F¹H¹_dR(X_K)=0. The long exact sequence must retain the cohomology of the filtered complex.

**Check.**

- H^1_syn(Spec Z_p, 2) ≅ Q_p through η.
- H^0_syn(Spec R, n) = 0 for n ≥ 1 because 1 − σ/p^n has no kernel on K_0.

**Construction or proof route.**

1. The cone is formed in the derived category of Q_p-vector spaces (Φ is σ-semilinear, so 1−Φ/p^n is generally only Q_p-linear) from the rigid cohomology of the special fibre (RD.4, with its Frobenius) and the Hodge filtration on algebraic de Rham cohomology of the generic fibre.
2. Independence of the syntomic data: two choices are dominated by their product, and the Frobenius lifts are homotopic on overconvergent de Rham complexes (PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lifts-induce-homotopic-maps).
3. For Spec R, put A = 1−σ/p^n. The cone differential is b ↦ (−b,Ab), consistent with (a,b) ↦ (a−b,Ab). Its cokernel identifies with K by η[(a,c)] = a + A^{-1}c, since η(−b,Ab)=0. Thus H^1_syn ≅ K and the other groups vanish for n≥1. Transporting the K-vector-space structure along η is possible at this point, not a K_0-linear structure on the general cone.

**Dependencies.** [PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology](PadicDifferentialEquationsAndRigidCohomology.md), [PadicDifferentialEquationsAndRigidCohomology:RD.4/overconvergent-de-rham-complex](PadicDifferentialEquationsAndRigidCohomology.md), [PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology](PadicDifferentialEquationsAndRigidCohomology.md), [PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison](PadicDifferentialEquationsAndRigidCohomology.md), [DerivedDeRhamCohomology:DD.2](DerivedDeRhamCohomology.md), [PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lifts-induce-homotopic-maps](PadicDifferentialEquationsAndRigidCohomology.md).

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Definition 2.2.1, p. 14: The rigid syntomic complex.; [HK2011](https://arxiv.org/abs/math/0612611v1), Example 2.2.4, pp. 14–15: The computation for Spec R.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), §6 and Proposition 8.6(3), author PDF pp. 26–28: The normalized map and the raw modified-model map differ by the factors specified in the target and its proof route.

<a id="target-padichodgeregulators-d-2-syntomic-regulator"></a>

### Besser's syntomic regulator

Target `PadicHodgeRegulators:D.2/syntomic-regulator` · declaration `syntomicRegulator`.

**Hypotheses.** R a complete DVR of characteristic 0 with perfect residue field; for the arithmetic uses the residue field is algebraic over F_p and the branch of log is the Iwasawa branch.

For a smooth R-scheme X (R as in D.2/rigid-syntomic-cohomology) and i, j ≥ 0, the syntomic Chern classes c^syn_{i,j} : K_j(X) → H^{2i−j}_syn(X, i) are obtained by evaluating the universal syntomic Chern classes c_i ∈ H^{2i}_syn(B_•GL_N, i) — characterised by mapping to the de Rham Chern classes in Fil^i H^{2i}_dR — through Gillet's formalism. For X = Spec R and n ≥ 1 the syntomic regulator is reg_syn := η ∘ c^syn_{n,2n−1} : K_{2n−1}(R) → K; for n ≥ 2 it factors through K_{2n−1}(R) ⊗ Q ≅ K_{2n−1}(K) ⊗ Q. It is compatible with finite extensions R → R' (reg_syn,R' ∘ K(ι) = ι ∘ reg_syn,R) and with automorphisms of R, and for n = 1 it is log_p on R^×.

**Uses.** Besser–de Jeu, Theorem 1.6(2): the regulator K^{(n)}_{2n−1}(O) → K^{(n)}_{2n−1}(R) → K computed on special units; ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements: reg_σ([ζ]_n) = ±(n−1)!·L^mod_n(σζ); Gros, Régulateurs syntomiques, as recalled in Besser–de Jeu Remark 1.13: reg^Gros = (1 − Frob/p^n)·reg for unramified fields

**API.**

| Name | Contract |
| --- | --- |
| `syntomicChernClass` | syntomicChernClass X i j : K_j(X) →+ H^{2i−j}_syn(X, i). |
| `syntomicRegulator` | syntomicRegulator R n := η ∘ syntomicChernClass (Spec R) n (2n−1) : K_{2n−1}(R) →+ K. |
| `syntomicRegulator_one` | syntomicRegulator R 1 u = log_p u for u ∈ Rˣ (Iwasawa branch). |
| `syntomicRegulator_baseChange` | For a finite extension R → R' with fraction fields K ⊂ K', syntomicRegulator R' n ∘ K(ι) = ι ∘ syntomicRegulator R n. |
| `syntomicRegulator_aut` | For an automorphism τ of R, syntomicRegulator R n ∘ K(τ) = τ ∘ syntomicRegulator R n. |
| `syntomicChernClass_deRham` | The image of the universal class in Fil^i H^{2i}_dR(B_•GL_N) is the de Rham Chern class. |
| `syntomicChernClass_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `syntomicRegulator_log` (computation): For R = Z_p (p odd) and u = 1 + p, syntomicRegulator Z_p 1 u = log(1 + p) = p − p²/2 + p³/3 − … .
- `syntomicRegulator_teichmuller_one` (degenerate): For n = 1 and u a Teichmüller unit, syntomicRegulator R 1 u = 0.
- `syntomicRegulator_cyclotomic` (compatibility): For R = Z_p[ζ_m] with p ∤ m and ζ ≠ 1, syntomicRegulator R 2 [ζ]_2 = ±Li_2(ζ), the value of ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements at n = 2.
- `syntomicRegulator_not_gros` (non-example): For R = Z_p, the Gros normalisation (1 − Frob/p²)·syntomicRegulator differs from syntomicRegulator by the factor 1 − p^{−2} ≠ 1, so the two are not interchangeable in integrality statements.

**Check.**

- For n = 1 and u ∈ R^×, reg_syn(u) = log_p(u) (Huber–Kings Example 2.5.2).
- For R=Z_p and n=2, reg_syn is additive on algebraic K_3(Z_p). Its continuous completed extension induces a Q_p-linear isomorphism K_3(Z_p;Z_p)⊗Q_p→Q_p via the completed étale Chern class and log_BK. No injectivity on the algebraic tensor K_3(Z_p)⊗Q_p is asserted.

**Construction or proof route.**

1. Syntomic cohomology satisfies the projective bundle formula and homotopy invariance needed by Gillet's construction; the universal classes on B_•GL_N are determined by their de Rham images (Huber–Kings Definition 2.3.3 after Besser Theorem 7.5).
2. Evaluating on BGL_N(R) and composing with the Hurewicz map gives c^syn_{n,2n−1} on K_{2n−1}(R).
3. Base change: Besser 2000, Proposition 8.8, as cited in Besser–de Jeu's proof of Theorem 1.12.

**Dependencies.** [PadicHodgeRegulators:D.2/rigid-syntomic-cohomology](#target-padichodgeregulators-d-2-rigid-syntomic-cohomology), [SchemeKTheoryOperations:S.7/chern-character](SchemeKTheoryOperations.md), [SchemeKTheoryOperations:S.5/projective-bundle-theorem](SchemeKTheoryOperations.md), [KTheoryFiniteLocalFields:L.2/odd-k-ring-of-integers-equals-field](KTheoryFiniteLocalFields.md), [GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring](GeneralAlgebraicKTheory.md).

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Definition 2.3.3, p. 16: The universal syntomic Chern class.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), §1, p. 1: The regulator and its source in Besser's work.; [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 5.6, p. 57: The generic-fibre version used for comparisons.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), §§7,9,10; Proposition 8.8 and Proposition 10.3: The normalized map and the raw modified-model map differ by the factors specified in the target and its proof route.

<a id="target-padichodgeregulators-d-2-syntomic-etale-regulator-comparison"></a>

### The syntomic regulator is the Bloch–Kato logarithm of the étale regulator

Target `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison` · declaration `syntomic_etale_regulator_comparison`.

**Hypotheses.** K/Q_p finite (any ramification); n ≥ 1; Chern-class normalisation for both regulators.

Let R be the integer ring of a finite extension K of Q_p and n ≥ 1. The natural map ρ_syn : H^1_syn(Spec R, n) → H^1(K, Q_p(n)) (compatible with Chern classes) equals exp_BK ∘ η, where exp_BK : K = D_dR(Q_p(n))/Fil^0 → H^1(K, Q_p(n)) is the Bloch–Kato exponential (L1/bloch-kato-exponential, with D_dR(Q_p(n)) = K·e_n (e_n=t^{−n}⊗ε^{⊗n})). Consequently, on K_{2n−1}(R): r^et_n ⊗ Q = exp_BK ∘ reg_syn, with no constant when both regulators use Chern classes. For n ≥ 2, exp_BK is an isomorphism and reg_syn = log_BK ∘ r^et_n; for n = 1 this is ∂ = exp_BK ∘ log_p on R^× (Bloch–Kato 3.10.1). For a smooth variety X over K the same Chern-class compatibility holds for the Nekovář–Nizioł syntomic regulator: ρ_syn ∘ c^syn_{i,j} = c^et_{i,j}, and the syntomic boundary followed by the arithmetic edge map H^q_dR(X)/F^r → H^1(G_K, H^q_et(X_K̄, Q_p(r))) is the Bloch–Kato exponential of H^q_et(X_K̄, Q_p(r)).

**Check.**

- n = 1, K = Q_p, u = 1 + p: exp_BK(log_p(1 + p)) is the Kummer class of 1 + p.
- n = 2, K = Q_5: for ζ = ω(2), log_BK(r^et_2([ζ])) = ±Li_2(ζ), consistent with D.2/weight-two-dilogarithm-comparison.
- The Huber–Kings p-adic Borel regulator satisfies r^et_n = exp_BK ∘ b_p (Huber–Kings Theorem 1.3.2); Tamme's Corollary 5.21 writes this with the factor (−1)^n/(n−1)! when the étale regulator is normalised by the Chern character.

**Construction or proof route.**

1. Besser constructs ρ_syn compatibly with Chern classes and identifies H^1_syn(Spec R, n) → H^1(K, Q_p(n)) with exp_BK ∘ η (Besser 2000, Propositions 9.9–9.11, as recalled in Huber–Kings Propositions 2.2.9 and 2.3.4 and Tamme, proof of Corollary 5.19).
2. The universal syntomic Chern class maps to the universal étale Chern class (Huber–Kings Proposition 2.3.4), hence r^et_n = exp_BK ∘ η ∘ c^syn_n on K_{2n−1}(R).
3. For varieties over K: Nekovář–Nizioł Proposition 5.7 (compatibility of Chern classes, no constant) and Proposition 4.13 (the boundary map is the Bloch–Kato exponential), with the sign convention of their Remark 2.14 fixed once.

**Dependencies.** [PadicHodgeRegulators:D.2/syntomic-regulator](#target-padichodgeregulators-d-2-syntomic-regulator), [PadicHodgeRegulators:D.2/etale-regulator](#target-padichodgeregulators-d-2-etale-regulator), [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:D.2/rigid-syntomic-cohomology](#target-padichodgeregulators-d-2-rigid-syntomic-cohomology), [SelmerIwasawaCohomology:L0/padic-kummer-identification](SelmerIwasawaCohomology.md).

**Sources.** [HK2011](https://arxiv.org/abs/math/0612611v1), Proposition 2.3.4, p. 16: The identification of H^1_syn(R, n) → H^1(K, Q_p(n)) with exp_BK ∘ η.; [Tamme2014](https://arxiv.org/abs/1111.4109v4), Proof of Corollary 5.19, p. 20: The same comparison, for smooth projective R-schemes.; [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 5.7, p. 58: Compatibility of Chern classes on the generic fibre.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Corollary 9.10 and Proposition 9.11, author PDF p. 32: The normalized map and the raw modified-model map differ by the factors specified in the target and its proof route.

<a id="target-padichodgeregulators-d-2-weight-two-dilogarithm-comparison"></a>

### Besser–de Jeu: the weight-two regulator is Coleman's dilogarithm on special units

Target `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison` · declaration `weight_two_dilogarithm_comparison`.

**Hypotheses.** n = 2 (no Beilinson–Soulé hypothesis is needed in weight two). Every x_i is a special unit of O; the comparison of de Jeu's weight-two complex with Suslin's Bloch group (requested from Polylogarithms:P.4) transports the statement to B(F) ⊗ Q.

Let F be a field of characteristic 0, O ⊂ F a discrete valuation ring with residue field κ, and σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R (so κ is algebraic over F_p). Let ξ ∈ K_3(O) ⊗ Q be the image, under de Jeu's map H^1(M̃^{(2)}(O)) → K^{(2)}_3(O), of an element Σ_i n_i [x_i]_2 with n_i ∈ Q, x_i ∈ O^♭ special units (x_i, 1 − x_i ∈ O^×) and Σ_i n_i (1 − x_i) ∧ x_i = 0 in ∧²(O^×) ⊗ Q. Then reg_syn(σ_* ξ) = ±Σ_i n_i D(σ(x_i)), with D = L_mod,2 Coleman's dilogarithm (D.1/regulator-normalisation-dictionary), the sign being the single sign indeterminacy of de Jeu's map. For F a number field and O its localisation at a prime above p the same holds without further hypotheses, and for every root of unity ζ ≠ 1 of F (of any order) the cyclotomic element [ζ]_2 satisfies reg_syn(σ_*[ζ]_2) = ±Li_2(σζ). Combined with D.2/syntomic-etale-regulator-comparison: log_BK(r^et_2(σ_* ξ)) = ±Σ_i n_i D(σ x_i). For arbitrary elements of B(F) ⊗ Q (symbols that are not special units of O) the identity is Besser–de Jeu's Conjecture 1.14 and is not asserted.

**Check.**

- F = Q(ζ_m), p ∤ m, σ an embedding into Q_p(ζ_m): reg_syn([ζ_m]_2) = ±Li_2(σζ_m) ∈ p²Z_p[ζ_m].
- GSWZ Example 4.3: all symbols 1 − α², 1 − α of ξ = 2[1 − α²] + [1 − α] and their complements are global units (norm ±1), so the theorem gives D.2's regulator of ξ at both places above 5 as ±D_5(ξ) of GSWZ (271).
- The symbol [p] ∈ P(Q) is not a special unit at p; no statement is made for presentations containing it.

**Construction or proof route.**

1. Besser–de Jeu construct M̃^{(n)}(O) and a map H^1(M̃^{(n)}(O)) → K^{(n)}_{2n−1}(O) through multi-relative K-theory and localisation (their §3), natural up to sign.
2. The key computation, BdJ Proposition 7.10, evaluates the modified syntomic regulator on [z]_n for special units z as (−1)^n(n−1)!·L_n(z); for n = 2 the combination with the boundary term gives ±L_mod,2 = ±D.
3. Number fields (BdJ Theorem 1.10): no hypothesis is needed; roots of unity of order divisible by p (BdJ Theorem 1.12) follow from the distribution relation over F(μ_r) and the base-change compatibility of the syntomic regulator (Besser 2000, Proposition 8.8).
4. Transport to Suslin's B(F) ⊗ Q uses the weight-two comparison of de Jeu's complex with the Bloch–Suslin complex (request to Polylogarithms:P.4) and K3BlochGroups:V.6/comparison-rational.

**Dependencies.** [PadicHodgeRegulators:D.2/syntomic-regulator](#target-padichodgeregulators-d-2-syntomic-regulator), [PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison](#target-padichodgeregulators-d-2-syntomic-etale-regulator-comparison), [PadicHodgeRegulators:D.1/regulator-normalisation-dictionary](#target-padichodgeregulators-d-1-regulator-normalisation-dictionary), [PadicHodgeRegulators:D.1/combined-dilogarithm](#target-padichodgeregulators-d-1-combined-dilogarithm), [Polylogarithms:P.4](Polylogarithms.md), [K3BlochGroups:V.4/suslin-exact-sequence](K3BlochGroups.md), [K3BlochGroups:V.6/comparison-rational](K3BlochGroups.md).

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.6(2), p. 4: The theorem; n = 2 holds without the Beilinson–Soulé hypothesis.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.12, p. 6: Cyclotomic elements of every order.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Conjecture 1.14, p. 6: The general case, which remains conjectural and is not asserted here.

<a id="target-padichodgeregulators-d-2-higher-weight-polylogarithm-comparison"></a>

### Besser–de Jeu: the syntomic regulator in higher weight

Target `PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison` · declaration `higher_weight_polylogarithm_comparison`.

**Hypotheses.** n ≥ 2; F a number field (no further hypothesis), or the Beilinson–Soulé conjecture for F and κ when n ≥ 3. The comparison of de Jeu's complexes with K-theory in weight n is requested from Polylogarithms:P.4.

Let F be a number field, O the localisation of O_F at a prime above p, σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R, and n ≥ 2. On de Jeu's H^1(M̃^{(n)}(O)) → K^{(n)}_{2n−1}(O) ≅ K^{(n)}_{2n−1}(F), the composite with σ_* and reg_syn maps [x]_n (x a special unit of O) to ±(n − 1)!·L_mod,n(σ(x)), and for every root of unity ζ ≠ 1 of F (of any order) maps the cyclotomic element [ζ]_n to ±(n − 1)!·L_mod,n(σζ) = ±(n − 1)!·Li_n(σζ). For a field F of characteristic 0 and a discrete valuation ring O ⊂ F, the same holds on special units under the Beilinson–Soulé conjecture for F and its residue field (n ≥ 3). L_mod,n is the modified polylogarithm of ColemanIntegration:L3/padic-regulator-polylogarithm. For n = 2 this is D.2/weight-two-dilogarithm-comparison.

**Check.**

- F = Q(ζ_N), n = 3, p ∤ N: reg_syn([ζ_N]_3) = ±2·Li_3(σζ_N).
- The input of ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements is this theorem with F = Q(ζ_N).

**Construction or proof route.**

1. BdJ Proposition 7.10: the modified syntomic regulator of [z]_n for a special unit z is (−1)^n(n − 1)!·L_n(z) in their normalisation; with the boundary terms of the complex this gives ±(n − 1)!·L_mod,n(z).
2. Number fields need no Beilinson–Soulé hypothesis (BdJ Theorem 1.10); roots of unity of order divisible by p follow from the distribution relation over F(μ_r) with r ≡ 1 mod p^s and base change (BdJ Theorem 1.12, Besser 2000 Proposition 8.8).
3. L_mod,n(ζ) = Li_n(ζ) because log_p vanishes on roots of unity.

**Dependencies.** [PadicHodgeRegulators:D.2/syntomic-regulator](#target-padichodgeregulators-d-2-syntomic-regulator), [PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison](#target-padichodgeregulators-d-2-weight-two-dilogarithm-comparison), [ColemanIntegration:L3/padic-regulator-polylogarithm](ColemanIntegration.md), [ColemanIntegration:L2/distribution-relation](ColemanIntegration.md), [Polylogarithms:P.4](Polylogarithms.md).

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.10(2), p. 5: The number-field theorem in weight n.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.12, p. 6: Cyclotomic elements.

<a id="target-padichodgeregulators-d-2-gros-normalisation"></a>

### Gros's normalisation of the syntomic regulator

Target `PadicHodgeRegulators:D.2/gros-normalisation` · declaration `gros_normalisation`.

**Hypotheses.** K/Q_p finite unramified, σ its Frobenius; p ∤ ord(ζ). The de Jeu cyclotomic-symbol formula requires n≥2; the stated weight-two integral lattice comparison uses p>3.

Let K/Q_p be finite unramified with arithmetic Frobenius σ and n≥1. Define the Gros normalization of Besser’s Chern-class regulator by reg^Gros_n=(1−σ/p^n)∘reg_syn. For n≥2 and a cyclotomic class [ζ]_n normalized by the de Jeu map, with ζ≠1 of order prime to p, its value is ε_n(n−1)!·Li_n^(p)(ζ), where Li_n^(p)(ζ)=Li_n(ζ)−p^(−n)Li_n(ζ^p) and ε_n is the sign fixed by that map. This follows from reg_syn([ζ]_n)=ε_n(n−1)!·Li_n(ζ). Agreement with Gros’s own higher-weight symbol convention has not been established. For n=2 and p>3, this is ε_2ℓ_2(ζ)∈O_K, whereas reg_syn([ζ]_2)=ε_2Li_2(ζ)∈p²O_K.

**Check.**

- For K = Q_5 and ζ = ω(2): reg^Gros([ζ]_2) ≡ ∓1 mod 5 is a unit while reg_syn([ζ]_2) ∈ 25Z_5.
- On the same de Jeu symbols the factor ε_n(n−1)! is carried through the operator 1−σ/p^n. A missing factorial in a differently defined symbol formula does not establish a source error; E103 remains rejected. In weight two the factorial is 1.

**Construction or proof route.**

1. BdJ Remark 1.13 records reg^Gros = (1 − Frob/p^n) reg.
2. Galois equivariance gives σ(Li_n(ζ)) = Li_n(ζ^p), so (1 − σ/p^n)Li_n(ζ) = Li^{(p)}_n(ζ), which is ℓ_n(ζ) by ColemanIntegration:L2/values-at-tame-roots-of-unity (a).

**Dependencies.** [PadicHodgeRegulators:D.2/syntomic-regulator](#target-padichodgeregulators-d-2-syntomic-regulator), [PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison](#target-padichodgeregulators-d-2-weight-two-dilogarithm-comparison), [PadicHodgeRegulators:D.1/dilogarithm-scalar-extension](#target-padichodgeregulators-d-1-dilogarithm-scalar-extension), [ColemanIntegration:L2/values-at-tame-roots-of-unity](ColemanIntegration.md), [PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison](#target-padichodgeregulators-d-2-higher-weight-polylogarithm-comparison).

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6: Gros's value at roots of unity.; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Remark 1.13, p. 6: The normalisation change.

<a id="target-padichodgeregulators-d-2-log-syntomic-complex"></a>

### Log-syntomic complexes S_n(r)

Target `PadicHodgeRegulators:D.2/log-syntomic-complex` · declaration `logSyntomicComplex`.

**Hypotheses.** X fs, log-smooth over O_K^×, of Cartier type where comparisons with Hyodo–Kato cohomology are used; O_K need not be unramified. r≥0 and m≥1. Imported contract CohomologyComparisonsPartII:CS.0/classical-divided-and-undivided-syntomic is proposed, not an existing declaration. The source-supported specification below fixes the request; implementation remains external.

For an fs log-smooth X/O_K^× (mixed characteristic, perfect residue field), r≥0 and m≥1, distinguish U_m(r)=Fib(p^r−φ:J_m^[r]→O_cr,m) from D_m(r)=Fib(1−φ_r:J_m^<r>→O_cr,m). Here J_m^<r> is obtained by lifting to level m+s, s≥r, imposing φ(x)∈p^r O_cr,m+s, then reducing modulo p^m; φ_r is the resulting divided Frobenius. For 0≤r≤p−1 the two domain ideals agree, but the two differentials and complexes still differ. There are directed maps ω_r:U_m(r)→D_m(r), with legs (p^r,id), and τ_r:D_m(r)→U_m(r), with legs (id,p^r). Both composites are p^r; their cohomological kernels/cokernels are p^r-torsion. ω preserves products; τ generally does not. Étale sheafification, derived global sections and derived m-limits are imported. CN S_m(r) denotes U_m(r), whereas EN S_m(r) denotes D_m(r) and EN S′_m(r) denotes U_m(r). After rationalization ω and τ/p^r are inverse comparisons; integral equality is not asserted.

**Uses.** Colmez–Nizioł, Theorem 1.1: the source of the period map whose kernel and cokernel are bounded; RT-AREA-iwasawa-2/3: Shared complexes and maps owned by the proposed early CohomologyComparisons Part II prefix; D.2 and semistable D.5 consume them.; PadicHodgeRegulators:D.5/semistable-input-boundary: the additional input for bad or semistable reduction; Nekovář–Nizioł, Theorem A: rational log-syntomic cohomology of varieties over K via h-sheafification

**API.**

| Name | Contract |
| --- | --- |
| `logSyntomicComplex` | logSyntomicComplex X r m is the imported undivided complex U_m(r), not the divided D_m(r). |
| `logSyntomicSheaf` | logSyntomicSheaf X r m is the étale undivided sheaf complex U_m(r); its derived global sections give logSyntomicComplex. |
| `logSyntomicComplex_reduction` | logSyntomicComplex X r n ≃ logSyntomicCompleted X r ⊗^L Z/p^n. |
| `logSyntomicComplex_rational` | logSyntomicCompleted X r ⊗ Q ≃ Cone(1 − φ_r)[−1] on rational log-crystalline cohomology. |
| `logSyntomicComplex_map` | Morphisms of fs log-smooth O_K^×-schemes induce maps, with map_id and map_comp; base change along O_K → O_{K'}. |
| `logSyntomicComplex_product` | Cup products S_n(r) ⊗ S_n(s) → S_n(r + s). |
| `logSyntomicDividedComplex` | The imported D_m(r) with the Frobenius-divisible ideal, distinct from U_m(r). |
| `logSyntomicToDivided` | ω_r:U_m(r)→D_m(r) has legs (p^r,id); τ_r has legs (id,p^r), and both composites equal p^r. Only ω is asserted multiplicative. |

**Discriminating tests.**

- `logSyntomic_point_weight_two` (computation): For X = Spec O_K (log structure of the closed point), r = 2: H^1(logSyntomicCompleted X 2) is p^{N}-isomorphic to O_K and H^2 to 0.
- `logSyntomic_weight_zero` (degenerate): For r = 0, J^{[0]} = O and S_n(0) is the fibre of 1 − φ on A_{cr,n}; on X = Spec O_K its H^0 is Z/p^n.
- `logSyntomic_rigid_compat` (compatibility): For X smooth over O_K with trivial horizontal log structure and K unramified, the rational complex agrees with D.2/rigid-syntomic-cohomology (both compute the fibre of 1 − φ_r against the Hodge filtration).
- `logSyntomic_not_naive_twist` (non-example): At r=p−1 the chosen Euclidean decomposition gives a(r)=1 and Z_p(r)′=p^{-1}Z_p(r), whereas at r=p−2 it gives a(r)=0 and the ordinary twist. Replacing all modified lattices by the ordinary lattice loses this normalization.
- `logSyntomic_division_is_not_iso` (non-example): At m=1 and r≥1, p^r is zero. The identity ωτ=p^r supplies no inverse; for zero Frobenius and identical Z/p domains, Fib(0) and Fib(id) already have different cohomology. This algebraic test detects invalid rescaling.

**Check.**

- For X=Spf O_K with its log structure and r≥2, the rationalized undivided H¹ is K and H⁰ is zero by CN Corollary 3.16, p. 37. No identification of a bounded integral lattice with O_K is inferred from Proposition 3.19’s asserted O_K^(r) lattice.
- At r=1 the rational period comparison and continuous Kummer realization give H¹_syn ≅ (O_K^×)^∧_p⊗Q_p ⊕ Q_p ≅ K⊕Q_p, with the extra line recording valuation.

**Construction or proof route.**

1. Import the absolute log-crystalline PD ideal and Frobenius once from CR.5/CR.6 and the proposed CS.0 producer. The Frobenius-divisible ideal is defined using a higher modulus so division by p^r is well defined after reduction. EN §2.1, pp. 4–5 verifies independence of the lift level.
2. The chain-map equations follow from (1−φ_r)p^r=p^r−φ. Compose the displayed legs to obtain multiplication by p^r. This gives a bounded comparison, not an integral quasi-isomorphism. EN §2.1.2, pp. 5–6 distinguishes product compatibility for ω from its failure for τ.
3. For completion/base change use the derived crystalline reduction contract, not an underived inverse limit. The four D.2 nodes only name the imported interfaces; their CS producer is part of the restructuring request.

**Dependencies.** [CrystallineCohomology:CR.5](CrystallineCohomology.md), [CrystallineCohomology:CR.3](CrystallineCohomology.md), [CrystallineCohomology:CR.0/pd-filtration](CrystallineCohomology.md), [PadicHodgeTheory:R06.1/crystalline-period-ring](PadicHodgeTheory.md), [CohomologyComparisons:CP.4](CohomologyComparisons.md).

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), §5.1.1, pp. 52–53: The definition.; [NN2016](https://arxiv.org/abs/1309.7620v5), Introduction, (1), p. 2: The rational form.; [EN2016](https://arxiv.org/pdf/1603.01705v2), §2.1 and §2.1.2, pp. 4–6: Both integral complexes, the directed ω/τ maps, and their distinct product behavior.

<a id="target-padichodgeregulators-d-2-fontaine-messing-kato-period-map"></a>

### The Fontaine–Messing–Kato period morphism

Target `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map` · declaration `fmkPeriodMap`.

**Hypotheses.** X fs log-smooth over O_K^×; r ≥ 0; the normalisation of Z_p(r)' follows Colmez–Nizioł (Nekovář–Nizioł use (p^a a!)^{−1}Z_p(r), which agrees for r < p(p − 1)). Imported contract CohomologyComparisonsPartII:CS.1/integral-fontaine-messing-period is proposed, not an existing declaration. The source-supported specification below fixes the request; implementation remains external.

Use the imported divided complex D_m(r). Its integral Fontaine–Messing period map α_div:D_m(r)→i*Rj*(Z/p^m(r)′) is a directed morphism. For 0≤r≤p−2 it lands in the ordinary twist. In all weights EN uses Z_p(r)′=(p^a a!)^−1 Z_p(r), r=(p−1)a+b, 0≤b<p−1. On the syntomic–étale site the map goes from D_m(r) to i_se* j_se* j′*G(Z/p^m(r)′), with G the Godement resolution. Exactness of the special-fibre pushforward and the topos comparison induce the stated étale map after derived pushforward. Define α_und=α_div∘ω_r on U_m(r); this is multiplicative and reduction-compatible. This construction inverts no p^r-exact arrow. CN uses p^−a Z_p(r); the lattices coincide when a! is a p-unit, in particular for all weights used by D.2/D.3 here. Any all-weight identification with CN requires its explicit factorial normalization.

**Uses.** Colmez–Nizioł, Theorem 1.1: the period map whose kernel and cokernel are killed by p^N; PadicHodgeRegulators:D.2/small-twist-comparison: Exact divided comparison for 0≤i≤r≤p−2; bounded undivided comparison separately.; PadicHodgeRegulators:D.2/syntomic-exponential: composed with the syntomic exponential it gives the Bloch–Kato exponential

**API.**

| Name | Contract |
| --- | --- |
| `fmkPeriodMap` | fmkPeriodMap X r m := α_div∘ω_r : U_m(r)→i*Rj*(Z/p^m(r)′); the divided map is a separate imported interface. |
| `fmkPeriodMap_local` | The divided map comes from the canonical syntomic–étale-site map to a Godement resolution and derived pushforward. The undivided map is its composition with ω_r; no bounded quasi-isomorphism is inverted. |
| `fmkPeriodMap_mul` | fmkPeriodMap is compatible with cup products S_n(r) ⊗ S_n(s) → S_n(r + s). |
| `fmkPeriodMap_reduction` | Compatible with the reduction maps n → n − 1 and with the completed versions. |
| `fmkPeriodMap_degree_one` | On the divided weight-one unit class α_div equals the Kummer map; on the undivided unit class α_und equals p times Kummer, because ω sends that class to p times the divided one. |
| `fmkDividedPeriodMap` | α_div:D_m(r)→i*Rj*(Z/p^m(r)′), with EN’s (p^a a!)^−1 twist. |

**Discriminating tests.**

- `fmk_kummer` (computation): For a unit u, the divided class maps to κ_m(u); the undivided class maps to p·κ_m(u). At m=1 the latter can vanish despite κ_m(u)≠0. Exactness belongs to the divided map.
- `fmk_weight_zero` (degenerate): For r = 0, α^FM_{0,n} is the identification of S_n(0) with i^*Rj_*Z/p^n in degree 0 (both are Z/p^n on a connected X).
- `fmk_twist_normalisation` (compatibility): For r < p − 1, a(r) = 0 and Z_p(r)' = Z_p(r), so the Colmez–Nizioł and Nekovář–Nizioł normalisations coincide.
- `fmk_untwisted_fails` (non-example): At r=p−1, Z_p(r)′=p^{-1}Z_p(r) and its prescribed period generator has p-adic valuation one less than the ordinary generator; an ordinary generator cannot be silently substituted in the same normalized map.

**Check.**

- Degree one: α_div(c_div(u))=κ_m(u), while α_und(c_und(u))=p·κ_m(u) (EN §2.1.2, §2.2.1, pp. 6–8).
- For general r the integral fundamental sequence is p^r-exact; neither an actual quasi-isomorphism nor the impossibility of any map with an ordinary twist follows from that statement.

**Construction or proof route.**

1. Import the syntomic–étale site and the canonical directed Fontaine–Messing map described in EN §2.2, p. 7. Apply the derived direct image and its special-fibre/base-change identifications to obtain α_div. The underlying integral construction remains the CS.1 supplier obligation, not a new construction by D.2.
2. Compose with ω_r to define α_und. EN §2.2.1, pp. 7–8 supplies product compatibility. The p^r-bounded fundamental sequence does not justify inverting its integral arrow.
3. Track EN’s factorial-modified twist and CN’s twist separately. For r=2, p≥5, both have a=0; no correction factor is hidden in the local regulator.

**Dependencies.** [PadicHodgeRegulators:D.2/log-syntomic-complex](#target-padichodgeregulators-d-2-log-syntomic-complex), [AInfCohomology:AI.4](AInfCohomology.md), [PadicHodgeTheory:R06.1/crystalline-period-ring](PadicHodgeTheory.md), [PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence](PadicHodgeTheory.md), [CrystallineCohomology:CR.2](CrystallineCohomology.md), [PadicHodgeRegulators:L0/fundamental-exact-sequences](#target-padichodgeregulators-l0-fundamental-exact-sequences), [CohomologyComparisons:CP.4](CohomologyComparisons.md).

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), §1, p. 2: The period morphism.; [CN2017](https://arxiv.org/abs/1505.06471v4), §1, p. 2: The twist; see sourceIssues for the range of b(r).; [EN2016](https://arxiv.org/pdf/1603.01705v2), §2.2–§2.2.1, pp. 7–8: Directed divided-period map, derived pushforward and composition with ω.; [EN2016](https://arxiv.org/pdf/1603.01705v2), §2.1.2 and §2.2.1, pp. 6–8: The displayed unit cocycles have ω(c_und(u))=p c_div(u); this scaling prevents an exact undivided Kummer test.

<a id="target-padichodgeregulators-d-2-small-twist-comparison"></a>

### The divided small-weight comparison and the undivided bounded comparison

Target `PadicHodgeRegulators:D.2/small-twist-comparison` · declaration `divided_small_twist_comparison`.

**Hypotheses.** Exact statement: fs log-smooth over O_K^×, 0≤i≤r≤p−2, divided D_m(r). Bounded statement: semistable or semistable base change, 0≤i≤r, undivided U_m(r). Imported contract CohomologyComparisonsPartII:CS.2/divided-small-weight-comparison is proposed, not an existing declaration. The source-supported specification below fixes the request; implementation remains external.

For fs log-smooth X/O_K^× and 0≤i≤r≤p−2, α_div induces H^i(D_m(r))≅i*R^ij*(Z/p^m(r)); equivalently D_m(r)≃τ_≤r i*Rj*(Z/p^m(r)). This is EN Theorem 2.2 (attributed to Tsuji). It is not an exact theorem about CN’s undivided U_m(r). For a semistable X or a semistable base change, α_und on U_m(r) has p^(Nr+c_p)-killed kernel/cokernel when K has enough roots of unity, and a p^N(K,p,r) bound in general, uniformly in m and X (CN Theorem 5.4). Rationalizing yields the geometric comparison in degrees ≤r. No exact r=p−1 endpoint is used or claimed.

**Check.**

- At r=1 and p≥3 the divided map computes H¹(K,Z/p^m(1)); the undivided map remains bounded and must not inherit this exact conclusion.
- At r=2 and p≥5 the divided exact comparison uses the ordinary twist, but U_m(2) and D_m(2) are still different integral complexes.

**Construction or proof route.**

1. Import CS.2’s exact divided statement as specified in EN Theorem 2.2, p. 7; do not move it to U_m(r) by treating ω as an isomorphism.
2. The general undivided bound follows from CN Theorem 5.4, p. 54: the chart-level comparison and Fontaine–Messing identification descend to sheaves. Its proof gives N(K,p,r); do not strengthen that to N(e,p,r).
3. Passing to geometric limits and rationalizing kills the bounded torsion. The exact endpoint outside r≤p−2 is not needed by weight two at p≥5.

**Dependencies.** [PadicHodgeRegulators:D.2/log-syntomic-complex](#target-padichodgeregulators-d-2-log-syntomic-complex), [PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map](#target-padichodgeregulators-d-2-fontaine-messing-kato-period-map), [PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex](PhiGammaModulesAndIwasawaCohomology.md), [CohomologyComparisons:CP.4](CohomologyComparisons.md).

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), §1, (1.3), p. 2: The classical range, with attribution to Kato, Kurihara and Tsuji.; [CN2017](https://arxiv.org/abs/1505.06471v4), Theorem 1.1, p. 2: The general bounded comparison (stated with N(K, p, r) in Theorem 5.4; see sourceIssues).; [EN2016](https://arxiv.org/pdf/1603.01705v2), Theorem 2.2, p. 7; §2.1, pp. 4–5: Exact divided comparison through p−2 and the reason it does not transfer integrally to U.

<a id="target-padichodgeregulators-d-2-syntomic-exponential"></a>

### The syntomic exponential and the Bloch–Kato exponential

Target `PadicHodgeRegulators:D.2/syntomic-exponential` · declaration `syntomic_exponential`.

**Hypotheses.** X quasi-compact formal semistable over O_K; for the Bloch–Kato identification, X proper semistable and 1 ≤ i ≤ r − 1. Imported contract CohomologyComparisonsPartII:CS.3/semistable-syntomic-exponential is proposed, not an existing declaration. The source-supported specification below fixes the request; implementation remains external.

Let X be a quasi-compact formal semistable scheme over O_K and r≥1. Write U for the undivided complex and D for the divided complex of D.2/log-syntomic-complex. Fix the rational comparison ω_Q:U_Q≃D_Q with α_U^FM=α_D^FM∘ω_Q, as in EN §2.2. Let δ_D be the de Rham boundary in the divided rational model, with the Bloch–Kato sign convention of NN Proposition 4.13 and Remark 2.14, and define α^norm_{r,i}:=ω_Q⁻¹∘δ_D:H^{i−1}_dR(X_{K,tr})→H^i(U_Q). It is an isomorphism for i≤r−1 and injective for i=r, by the rational de Rham comparison of CN Corollary 3.16. For X proper semistable and 1≤i≤r−1, the composite α_U^FM∘α^norm_{r,i} is exp_BK of V_{i−1}:=H^{i−1}_et(X_K̄,Q_p(r)), with D_dR(V_{i−1})=H^{i−1}_dR(X_K) and Fil^0=0 in this range. In the explicit rational triple-cone presentation [A→A⊕A/J^{[r]}], ω acts by (p^r,id,p^r); hence the unscaled quotient-coordinate boundary δ_U satisfies ω_Qδ_U=p^rδ_D. In these EN period conventions α^norm=p^(−r)δ_U and α_U^FMδ_U=p^r exp_BK. No inverse to ω is asserted integrally. For X=Spec O_K, r≥2 and i=1 the normalized composite K→H^1(U_Q)→H^1(K,Q_p(r)) is exp_BK.

**Check.**

- For X=Spec O_K, r=2 and i=1, α^norm_{2,1}:K→H^1(U_Q) is an isomorphism and α_U^FMα^norm=exp_BK. At p=5 the unscaled triple-cone boundary instead gives 25·exp_BK; multiplying it by 1/25 restores the square.
- For dim X_K ≥ 1 and i = r the cokernel of α^FM ∘ α_{r,r} can be very large; no surjectivity is asserted there.

**Construction or proof route.**

1. Colmez–Nizioł Lemmas 3.14 and 3.17 identify crystalline cohomology modulo J^{[r]} with log de Rham cohomology modulo F^r; Proposition 3.12(ii) shows the Hyodo–Kato part is p^N-acyclic in degrees ≤ r − 1 (Corollary 3.16).
2. Composition with α^FM and comparison with the Bloch–Kato exponential: Colmez–Nizioł Corollary 1.4 / 5.11, citing Nekovář–Nizioł Proposition 4.13 (with the sign convention of their Remark 2.14).
3. Transport the divided boundary through ω_Q⁻¹. The defining maps of EN §2.1 act by p^r on the quotient coordinate in the rational triple cone, so the raw boundary differs by p^r. NN Proposition 4.13 identifies the divided rational boundary with exp_BK after the period map. This proves the normalized square and its range, without an integral inverse to ω or an identification of differently scaled cocycle coordinates.

**Dependencies.** [PadicHodgeRegulators:D.2/log-syntomic-complex](#target-padichodgeregulators-d-2-log-syntomic-complex), [PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map](#target-padichodgeregulators-d-2-fontaine-messing-kato-period-map), [PadicHodgeRegulators:D.2/small-twist-comparison](#target-padichodgeregulators-d-2-small-twist-comparison), [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [CrystallineCohomology:CR.5](CrystallineCohomology.md), [CohomologyComparisons:CP.4](CohomologyComparisons.md).

**Sources.** [CN2017](https://arxiv.org/abs/1505.06471v4), Corollary 3.16, p. 37: The syntomic exponential.; [CN2017](https://arxiv.org/abs/1505.06471v4), §1, p. 3: The identification with the Bloch–Kato exponential.; [EN2016](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2, pp. 4–8: The maps ω, τ and the definition of the undivided period as the divided period composed with ω fix the rational scaling.; [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 4.13 and its displayed square, pp. 53–54; Remark 2.14, p. 14: The rational de Rham boundary has the Bloch–Kato sign and period normalization.
<a id="stage-d3"></a>

## D.3 — The unramified p > 3 theorem

The source is the third homotopy group of derived p-completed K-theory. The rank computation is imported from KTheoryFiniteLocalFields L.6. Integrality, root reduction and spanning are independent inputs: finite-index spanning alone does not identify the integral lattice. Products are handled by differences of admissible root tuples, without inserting a component equal to 1.

**Planets:** Completed K₃ of an unramified p-adic algebra; p-adic regulator on completed K₃; Unramified K₃ regulator theorem; Roots of unity generate completed K₃.

<a id="target-padichodgeregulators-d-3-unramified-etale-algebra"></a>

### Finite unramified étale Q_p-algebras

Target `PadicHodgeRegulators:D.3/unramified-etale-algebra` · declaration `IsUnramifiedEtaleAlgebra`.

**Hypotheses.** p any prime; I finite (I = ∅ gives the zero algebra). The local-field carrier, unramified classification and Witt identification are imported from LocalFieldsRamification Layer 2; the API below is the required specialized supplier interface. Formal unramifiedness of a characteristic-zero field algebra only detects separability and does not detect arithmetic ramification.

A finite unramified étale Q_p-algebra is a Q_p-algebra L isomorphic to a finite product ∏_{i∈I} L_i of finite unramified field extensions L_i/Q_p; equivalently L ≅ W(k)[1/p] for a finite reduced F_p-algebra k = ∏_i F_{q_i} (Witt vectors of a finite product of finite fields), with k ≅ O_L/pO_L. Its ring of integers is O_L = ∏_i O_{L_i} = W(k), the integral closure of Z_p in L; its rank is [L : Q_p] = Σ_i [L_i : Q_p] = dim_{F_p} k; its Frobenius φ_L = ∏_i φ_{L_i} is the Witt-vector Frobenius W(Frob_k)[1/p]. For a number field F and a prime p unramified in F, F ⊗_Q Q_p ≅ ∏_{v|p} F_v is such an algebra, with O_F ⊗ Z_p = ∏_v O_v.

**Uses.** GSWZ §3.1, paragraph before Theorem 9: K_p ≅ ∏ Q_{p^{s_i}} and K_n(K_p) ≅ ∏ K_n(Q_{p^{s_i}}) for p unramified; PadicHodgeRegulators:D.3/completed-k3-unramified: the class of algebras whose completed K_3 the layer computes; HabiroNahmSeries:HB.9/followup-etale-module-contract: full quadratic étale algebras B_p = R_p[T]/(δT² − 1), including the split case, are of this form

**API.**

| Name | Contract |
| --- | --- |
| `IsUnramifiedEtaleAlgebra` | IsUnramifiedEtaleAlgebra p L : L is a finite product of finite unramified field extensions of ℚ_[p] (data: the factor decomposition up to isomorphism). |
| `unramifiedEtaleAlgebra_equiv_witt` | L ≃ₐ[ℚ_[p]] Localization.Away (p : WittVector p k) for k := O_L ⧸ p, a finite reduced 𝔽_p-algebra. |
| `unramifiedEtaleAlgebra_rank` | Module.finrank ℚ_[p] L = Module.finrank (ZMod p) k. |
| `unramifiedEtaleAlgebra_frobenius` | The Frobenius φ_L : L ≃ₐ[ℚ_[p]] L induced by WittVector.frobenius on W(k); it fixes exactly ℚ_[p]^{#π_0} componentwise. |
| `unramifiedEtaleAlgebra_prod` | Finite products of unramified étale algebras are unramified étale. |
| `unramifiedEtaleAlgebra_tensor_padic` | For a number field F and p unramified in F, F ⊗[ℚ] ℚ_[p] is unramified étale. |

**Discriminating tests.**

- `unramified_rank_cubic` (computation): For F = Q(α), α³ − α² + 1 = 0 and p = 5, F ⊗ Q_5 is unramified étale of rank 3 with factors of residue degrees 2 and 1.
- `unramified_zero` (degenerate): The zero algebra (empty product, k = 0) is unramified étale of rank 0.
- `unramified_witt_compat` (compatibility): For k = F_q, the algebra W(F_q)[1/p] is the unramified extension Q_q of degree log_p q, and its Frobenius is Mathlib's WittVector.frobenius after inverting p.
- `unramified_not_qp_zeta_p` (non-example): For p odd, Q_p(ζ_p) is finite étale but not unramified: its residue field is F_p while its degree is p − 1, so it is not of the form W(k)[1/p].

**Check.**

- K = Q(α), α³ − α² + 1 = 0, p = 5: K ⊗ Q_5 ≅ Q_{25} × Q_5 has rank 3 (GSWZ Example 4.3).
- Q_p(√p) and Q_p(ζ_p) (p odd) are finite étale but not unramified.

**Construction or proof route.**

1. A finite unramified extension of Q_p with residue field F_q is W(F_q)[1/p], and W commutes with finite products.
2. The Witt-vector Frobenius lifts x ↦ x^p, so it is the arithmetic Frobenius of D.1/unramified-frobenius-on-roots on each factor.
3. For p unramified in F, each completion F_v is unramified over Q_p, and the semilocal equivalence of NumberFieldArithmetic layer 5 identifies F ⊗ Q_p with ∏_v F_v.

**Dependencies.** `mathlib:WittVector`, `mathlib:WittVector.frobenius`, [PadicHodgeRegulators:D.1/unramified-frobenius-on-roots](#target-padichodgeregulators-d-1-unramified-frobenius-on-roots), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph before Theorem 9, p. 39: The class of algebras; the K-theory product comparison is D.3/completed-k3-unramified.

<a id="target-padichodgeregulators-d-3-completed-k3-unramified"></a>

### Completed K₃ of a finite unramified étale algebra

Target `PadicHodgeRegulators:D.3/completed-k3-unramified` · declaration `completedK3`.

**Hypotheses.** L finite unramified étale over Q_p (D.3/unramified-etale-algebra); freeness needs p > 3.

For a finite unramified étale Q_p-algebra L = ∏_i L_i put K_3(L; Z_p) := π_3 K(L; Z_p), the p-completed K-theory of KTheoryFiniteLocalFields:L.1/completed-k-theory. The projections induce K_3(L; Z_p) ≅ ∏_i K_3(L_i; Z_p) (finite products commute with K-theory and with derived p-completion), and K_3(O_L; Z_p) → K_3(L; Z_p) is an isomorphism. The étale Chern classes give c_L : K_3(L; Z_p) ≅ H^1(L, Z_p(2)) := ∏_i H^1(L_i, Z_p(2)). For p > 3, K_3(L; Z_p) is a free Z_p-module of rank [L : Q_p]; for p ∈ {2, 3} it has the nonzero torsion Z/w_2^{(p)}(L_i) on each factor.

**Uses.** GSWZ Theorem 9, (183): the source of the isomorphism D_p : K_3(K_p; Z_p) → p²O_{K_p}; PadicHodgeRegulators:D.4/global-p-adic-regulator: the target of the localisation map λ_{F,3} from global K_3; HabiroNumberFields:HB.7/pochhammer-sections: ξ̂ ∈ K_3(K_p) ⊗ Z_p is presented by roots of unity in this group

**API.**

| Name | Contract |
| --- | --- |
| `completedK3` | completedK3 p L := π_3 K(L; ℤ_p), a ℤ_[p]-module. |
| `completedK3_prodEquiv` | completedK3 p (∏ i, L i) ≃ₗ[ℤ_[p]] ∏ i, completedK3 p (L i). |
| `completedK3_integers_equiv` | completedK3 p O_L ≃ₗ[ℤ_[p]] completedK3 p L, induced by O_L → L. |
| `completedK3_chernEquiv` | completedK3 p L ≃ₗ[ℤ_[p]] H^1(L, ℤ_p(2)), componentwise étale Chern class c_{2,1}. |
| `completedK3_free` | For p > 3, Module.Free ℤ_[p] (completedK3 p L) and Module.finrank = [L : ℚ_[p]]. |
| `completedK3_map` | A ℚ_[p]-algebra map f : L → L' induces completedK3 p L → completedK3 p L', with map_id and map_comp; the Frobenius φ_L acts by functoriality. |
| `completedK3_transfer` | For L → L' finite free, a transfer completedK3 p L' → completedK3 p L, corresponding to corestriction under the Chern isomorphisms. |
| `completedK3_extensionality` | The completed module is imported from p-completed K-theory. Equality of induced maps is pointwise, and product maps are determined by all factor projections. Inherit Module and map_zero/map_add/map_smul rather than define a new completion carrier. |

**Discriminating tests.**

- `completedK3_rank_cubic` (computation): For p = 5 and L = Q_{25} × Q_5, completedK3 5 L is free of rank 3.
- `completedK3_zero` (degenerate): completedK3 p 0 = 0 for the zero algebra.
- `completedK3_chern_compat` (compatibility): For L = Q_p the Chern isomorphism agrees with KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1 at i = 2.
- `completedK3_three_torsion` (non-example): For p = 3, completedK3 3 Q_3 has torsion Z/3 (w_2^{(3)}(Q_3) = 3), so it is not free and no injective map to a torsion-free lattice exists.

**Check.**

- For p = 5 and L = Q_{25} × Q_5, K_3(L; Z_5) ≅ Z_5³.
- For p = 3 and L = Q_3, K_3(Q_3; Z_3) ≅ Z_3 ⊕ Z/3: the freeness clause fails at p = 3.

**Construction or proof route.**

1. Product comparison: K_n(R × S) ≅ K_n(R) × K_n(S) (GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring (ii)); mod p^ν coefficients and the homotopy limit defining K(−; Z_p) commute with finite products.
2. On each factor, KTheoryFiniteLocalFields:L.6/completed-k3-of-unramified-fields gives K_3(O_{L_i}; Z_p) ≅ K_3(L_i; Z_p) ≅ H^1(L_i, Z_p(2)) ≅ Z_p^{[L_i:Q_p]} ⊕ Z/w_2^{(p)}(L_i), with w_2^{(p)} = 1 for p ≥ 5.
3. The Chern isomorphism is natural, so it is compatible with the product decomposition.

**Dependencies.** [PadicHodgeRegulators:D.3/unramified-etale-algebra](#target-padichodgeregulators-d-3-unramified-etale-algebra), [KTheoryFiniteLocalFields:L.1/completed-k-theory](KTheoryFiniteLocalFields.md), [GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring](GeneralAlgebraicKTheory.md), [KTheoryFiniteLocalFields:L.6/completed-k3-of-unramified-fields](KTheoryFiniteLocalFields.md), [KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1](KTheoryFiniteLocalFields.md), [KTheoryFiniteLocalFields:L.6/ring-of-integers-versus-field](KTheoryFiniteLocalFields.md).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Theorem 9, p. 39: The structure of the group; r = [K : Q] here.

<a id="target-padichodgeregulators-d-3-completed-k3-bloch-description"></a>

### Completed K₃ of an unramified field is the completed Bloch group

Target `PadicHodgeRegulators:D.3/completed-k3-bloch-description` · declaration `completedK3_bloch_description`.

**Hypotheses.** L/Q_p finite unramified and p odd, so that μ(L) has order prime to p and ζ_p ∉ L.

Let L be a finite unramified extension of Q_p with p ≥ 3. For every ν ≥ 1 the natural maps K_3(L)/p^ν → K_3^ind(L)/p^ν → B(L)/p^ν are isomorphisms (B(L) Suslin's Bloch group), and the completion map identifies K_3(L; Z_p) with lim_ν K_3(L)/p^ν ≅ lim_ν B(L)/p^ν =: B(L)^∧_p. In particular the image of B(L) — more precisely of K_3(L), which surjects onto every B(L)/p^ν — is dense in K_3(L; Z_p), and the kernel of K_3(L) → K_3(L; Z_p) is ⋂_ν p^ν K_3(L). For a finite product L = ∏ L_i the statements hold factorwise.

**Check.**

- For L = Q_5: K_3(Q_5; Z_5) ≅ Z_5 ≅ lim_ν B(Q_5)/5^ν.
- For ramified L=Q_p(ζ_p), retain the term im(μ̃(L)/p→K_3^ind(L)/p) in the kernel of K_3^ind(L)/p→B(L)/p. The argument that this term vanishes for unramified L no longer applies. No nonzero injection of μ̃(L)/p, or ramified isomorphism, is inferred from tensoring Suslin’s exact sequence.

**Construction or proof route.**

1. K_3^M(L) is uniquely divisible (KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields), so K_3(L)/p^ν = K_3^ind(L)/p^ν.
2. Suslin's sequence reduced mod p^ν (K3BlochGroups:V.6/comparison-finite-coefficients): K_3^ind(L)/p^ν → B(L)/p^ν is onto with kernel the image of μ̃(L)/p^ν, which vanishes because μ(L) has order prime to p and the enhancement is 2-primary.
3. The finite-coefficient groups are finite (L.6/finite-coefficient-lichtenbaum-quillen), so L.6/completion-exact-sequence gives 0 → lim_ν K_3(L)/p^ν → K_3(L; Z_p) → T_p K_2(L) → 0; Moore's theorem K_2(L) ≅ μ(L) ⊕ (divisible) with the divisible part uniquely divisible gives T_p K_2(L) = 0.
4. This also supplies the input K_3^M(L)/p^ν = 0 that K3BlochGroups:V.6/regulator-agreement-padic records as missing.

**Dependencies.** [KTheoryFiniteLocalFields:L.6/completion-exact-sequence](KTheoryFiniteLocalFields.md), [KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields](KTheoryFiniteLocalFields.md), [KTheoryFiniteLocalFields:L.3/moore-theorem](KTheoryFiniteLocalFields.md), [KTheoryFiniteLocalFields:L.6/finite-coefficient-lichtenbaum-quillen](KTheoryFiniteLocalFields.md), [K3BlochGroups:V.6/comparison-finite-coefficients](K3BlochGroups.md), [K3BlochGroups:V.4/suslin-exact-sequence](K3BlochGroups.md), [K3BlochGroups:V.2/k3-indecomposable](K3BlochGroups.md).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Theorem 9, p. 39: The comparison of completed K_3 with the Bloch group used in the proof; the containment it claims is D.3/unramified-regulator-theorem (sourceIssues: GSWZ E39).

<a id="target-padichodgeregulators-d-3-finite-polylogarithm"></a>

### Kontsevich's finite polylogarithm

Target `PadicHodgeRegulators:D.3/finite-polylogarithm` · declaration `finitePolylog`.

**Hypotheses.** p prime; n ∈ Z (negative n allowed, k^{−n} = k^{|n|}).

For a prime p and n ∈ Z, the finite polylogarithm is the polynomial li_{n,p}(x) := Σ_{k=1}^{p−1} x^k / k^n ∈ F_p[x] (equivalently its lift with coefficients in Z_(p)). It has degree p − 1 (for p > 2), constant term 0, and satisfies x·li'_{n,p}(x) = li_{n−1,p}(x); li_{n,p}(1) = Σ_{k=1}^{p−1} k^{−n} ≡ 0 mod p exactly when (p − 1) ∤ n. In particular for p > 3: li_{2,p}(1) ≡ 0 and li'_{2,p}(1) = li_{1,p}(1) ≡ 0 mod p, so (x − 1)² divides li_{2,p}(x) in F_p[x].

**Uses.** GSWZ §3.1, (177)–(180): the reduction of p^{−2}D_p at roots of unity is li_{2,p}(ζ)/(ζ − 1)^p, and its fibres are bounded by p − 2; PadicHodgeRegulators:D.3/residue-spanning: the counting argument for the spanning of the residue space; ColemanIntegration:L2/values-at-tame-roots-of-unity: part (c) expresses p^{−k}Li_k(ζ) modulo p through li_{k,p}

**API.**

| Name | Contract |
| --- | --- |
| `finitePolylog` | finitePolylog p n : Polynomial (ZMod p) := Σ_{k=1}^{p−1} C ((k : ZMod p)^n)⁻¹ * X^k. |
| `finitePolylog_eval_zero` | (finitePolylog p n).eval 0 = 0. |
| `finitePolylog_derivative` | X * derivative (finitePolylog p n) = finitePolylog p (n − 1). |
| `finitePolylog_eval_one` | (finitePolylog p n).eval 1 = 0 ↔ ¬ (p − 1 ∣ n). |
| `finitePolylog_two_rootMultiplicity_one` | For 5 ≤ p, (X − 1)² ∣ finitePolylog p 2. |
| `finitePolylog_natDegree` | For 2 < p, (finitePolylog p n).natDegree = p − 1. |
| `finitePolylog_extensionality` | Equality of finite polylogarithm polynomials is determined coefficientwise by Polynomial.ext; coeff k = (k^n)^{-1} for 1≤k<p and 0 otherwise. |

**Discriminating tests.**

- `finitePolylog_five_two` (computation): (finitePolylog 5 2).eval 2 = 1 in ZMod 5.
- `finitePolylog_one_index` (degenerate): finitePolylog p 0 = Σ_{k=1}^{p−1} X^k, the truncated geometric series.
- `finitePolylog_compat_coleman` (compatibility): For ζ ∈ μ(Q_{p^s}) ∖ {1} of order prime to p, the reduction of p^{−2}Li_2(ζ^p) is −li_{2,p}(ζ̄)/(1 − ζ̄)^p, the form of ColemanIntegration:L2/values-at-tame-roots-of-unity (c).
- `finitePolylog_three_non_example` (non-example): (finitePolylog 3 2).eval 1 = 2 ≠ 0 in ZMod 3, so the factorisation li_{2,p} = (x − 1)² g_p fails at p = 3.
- `finitePolylog_five_two_three` (computation): (finitePolylog 5 2).eval 3 = 3 in ZMod 5; hence f_5(3)=3/(3−1)^5=4.
- `finitePolylog_five_two_minus_one` (computation): (finitePolylog 5 2).eval 4 = 0 in ZMod 5, so f_5(−1)=0.

**Check.**

- li_{2,5}(2) = 2 + 1 + 2 + 1 = 1 in F_5.
- li_{2,3}(1) = 1 + 1/4 = 2 ≠ 0 in F_3: the double-root property fails at p = 3.

**Construction or proof route.**

1. The power sums Σ_{k=1}^{p−1} k^m vanish mod p unless (p − 1) | m (sum over the cyclic group F_p^×).
2. x·d/dx(x^k/k^n) = x^k/k^{n−1} gives the differential relation; for n = 2 and p > 3, (p − 1) ∤ 2 and (p − 1) ∤ 1.

**Dependencies.** `mathlib:Polynomial`, `mathlib:ZMod`.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (177), p. 38: The coefficient normalization of the finite polylogarithm, expressed here as a polynomial over F_p.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Proposition 3.3, (180), p. 38: The double root at 1, valid for p > 3.

<a id="target-padichodgeregulators-d-3-finite-polylogarithm-reduction"></a>

### Reduction of the p-adic dilogarithm at roots of unity

Target `PadicHodgeRegulators:D.3/finite-polylogarithm-reduction` · declaration `finite_polylogarithm_reduction`.

**Hypotheses.** p odd, so every ζ ∈ μ(L) has order prime to p (L unramified).

Let p be odd, L an unramified extension of Q_p and ζ ∈ μ(L) ∖ {1}. Then D_L(ζ) = Li_2(ζ) ∈ p²O_L and p^{−2}D_L(ζ^p) ≡ li_{2,p}(ζ̄)/(ζ̄ − 1)^p mod p, where ζ̄ ∈ k_L^× is the residue of ζ. Equivalently, with σ(ζ) the root of unity with σ(ζ)^p = ζ, p^{−2}D_L(ζ) ≡ li_{2,p}(σ(ζ)‾)/(σ(ζ)‾ − 1)^p. Componentwise the same holds for a finite unramified product L and ζ ∈ μ(L) with all components ≠ 1.

**Check.**

- p = 5, ζ = ω(2) ∈ Q_5 (so ζ^5 = ζ): 25^{−1}D(ζ) ≡ li_{2,5}(2) = 1 mod 5, matching the Q_5-component of D_5(ζ_24) in GSWZ (273).
- For p = 2 and ζ = −1, ζ^p = 1 and D(1) is undefined: the printed statement of GSWZ Proposition 3.2 needs ζ^p ≠ 1.

**Construction or proof route.**

1. log_p(ζ) = 0, so D_L(ζ) = Li_2(ζ); ColemanIntegration:L2/values-at-tame-roots-of-unity (b) gives Li_2(ζ) ∈ p²Z_p[ζ] ⊆ p²O_L.
2. Part (c) of the same node: p^{−2}Li_2(ζ^p) ≡ −li_{2,p}(ζ̄)/(1 − ζ̄)^p mod p, and −(1 − ζ̄)^p = (ζ̄ − 1)^p for p odd.

**Dependencies.** [ColemanIntegration:L2/values-at-tame-roots-of-unity](ColemanIntegration.md), [PadicHodgeRegulators:D.1/etale-algebra-dilogarithm](#target-padichodgeregulators-d-1-etale-algebra-dilogarithm), [PadicHodgeRegulators:D.3/finite-polylogarithm](#target-padichodgeregulators-d-3-finite-polylogarithm).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proposition 3.2, (178), p. 38: The statement, for odd p; the extraction records the p = 2 caveat as GSWZ E80.

<a id="target-padichodgeregulators-d-3-dilogarithm-integrality"></a>

### p²-integrality of the dilogarithm on special units

Target `PadicHodgeRegulators:D.3/dilogarithm-integrality` · declaration `dilogarithm_integrality`.

**Hypotheses.** p > 3; L unramified (each factor); z and 1 − z units in every factor.

Let p > 3 and let L be a finite unramified étale Q_p-algebra. If z ∈ O_L satisfies z ∈ O_L^× and 1 − z ∈ O_L^× in every factor (z is a special unit), then D_L(z) ∈ p²O_L. This is GSWZ Lemma 3.1 for R^∧_p = O_{K_p}.

**Check.**

- z = ω(2) ∈ Z_5 (a special unit): D(z) ∈ 25Z_5.
- z = p is not a unit and D^0(p) = Li_2(p) ≡ p mod p², so the unit hypothesis cannot be dropped.
- z = 1 + p has 1 − z = −p not a unit; the lemma does not apply there.

**Construction or proof route.**

1. Write z = ζ·(1 + x) with ζ = ω(z̄) and x ∈ pO_L (D.1/teichmuller-unit-decomposition); z̄ ≠ 1 because 1 − z is a unit, so ζ ≠ 1.
2. Expand D(ζ(1 + x)) in x around ζ (ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity): the constant term Li_2(ζ) lies in p²O; the first-order coefficients involve Li_1(ζ) ∈ pO and log(1 + x) ∈ pO; the higher Taylor coefficients have denominators k with v_p(x^k/k) ≥ k − v_p(k) ≥ 2 for k ≥ 2, using p > 3 and e = 1.
3. Each factor of L is treated separately.

**Dependencies.** [PadicHodgeRegulators:D.3/finite-polylogarithm-reduction](#target-padichodgeregulators-d-3-finite-polylogarithm-reduction), [PadicHodgeRegulators:D.1/teichmuller-unit-decomposition](#target-padichodgeregulators-d-1-teichmuller-unit-decomposition), [ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity](ColemanIntegration.md), [ColemanIntegration:L2/values-at-tame-roots-of-unity](ColemanIntegration.md), [ColemanIntegration:L0/log-one-add-convergence](ColemanIntegration.md).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Lemma 3.1 and proof, (175), p. 38: The statement and the root-of-unity input; the Taylor step is expanded in proofSteps.

<a id="target-padichodgeregulators-d-3-residue-spanning"></a>

### Dilogarithms of roots of unity span the residue space

Target `PadicHodgeRegulators:D.3/residue-spanning` · declaration `residueSpanning_mod_p`.

**Hypotheses.** p > 3 (the argument uses li_{2,p}(1) ≡ li'_{2,p}(1) ≡ 0 mod p). s ≥ 1; L a finite product of unramified extensions of Q_p.

Let p > 3. (a) For every s ≥ 1, Span_{Z_p}{p^{−2}D(ζ) : ζ ∈ μ(Q_{p^s}) ∖ {1}} = Z_{p^s}. (b) For every s ≥ 1 also Span_{Z_p}{p^{−2}(D(ζ) − D(ζ')) : ζ, ζ' ∈ μ(Q_{p^s}) ∖ {1}} = Z_{p^s}. (c) Consequently, for a finite unramified product L = ∏_i Q_{p^{s_i}}, Span_{Z_p}{p^{−2}D_L(ζ) : ζ ∈ μ(L) with every component ≠ 1} = O_L. Statement (a) is GSWZ Proposition 3.3 with ζ = 1 excluded; (b) and (c) are needed for products once components equal to 1 are excluded.

**Check.**

- p=5,s=1: μ_4\{1} has three elements. The residue values f(2)=1,f(3)=4,f(4)=0 generate F_5, and their differences also generate; f(4)=f(−1)=0 handles the s=1 count.
- p = 5 and L = Q_{25} × Q_5: the three values p^{−2}D_L(ζ_24), p^{−2}D_L(ζ_24²), p^{−2}D_L(ζ_24⁶) of GSWZ (273) (second line relabelled, GSWZ E56) form a Z_5-basis of O_L, as (274) presupposes.
- At p = 3 the factorisation of li_{2,3} fails (li_{2,3}(1) = 2), so the fibre bound and the proof do not apply.

**Construction or proof route.**

1. The finite set of admissible tame roots has finitely generated Z_p-span; use the pinned Nakayama theorem with the finite free target O_L. Work modulo p and put f(x)=li_{2,p}(x)/(x−1)^p on F_{p^s}^×\{1}; zero is not a root of unity. Factor li_{2,p}=(x−1)^2g with deg g≤p−3. The equation g(x)−c(x−1)^{p−2}=0 is nonzero (for c=0, g is nonzero), so each fibre has at most p−2 points.
2. For s>1, #image(f)≥(p^s−2)/(p−2)>p^{s−1}. For s=1, f(−1)=0 by the inversion identity. At least one other admissible value is nonzero: otherwise li_{2,p} would have the p−2 admissible points and zero as roots and 1 as a double root, impossible for degree p−1. Thus #image(f)≥2>1 in the base case. Every translate image(f)−c has the same cardinality, so both values and differences span over F_p.
3. The map ζ↦ζ^p permutes the nontrivial tame roots and D(ζ^p)=φD(ζ). The finite-polylogarithm reduction identifies p^{-2}D(ζ^p) with f(ζ̄). Nakayama now gives the integral spans (a),(b). The base-case inversion may equivalently be read from D(−1)=0 and the reduction formula.
4. (c) Fix all components but one and subtract two admissible tuples. Part (b) produces O_{L_i} in that component and zero elsewhere for the scaled values p^{-2}D_L. Taking all factors gives O_L. No tuple with a component equal to 1 is used.

**Dependencies.** [PadicHodgeRegulators:D.3/finite-polylogarithm](#target-padichodgeregulators-d-3-finite-polylogarithm), [PadicHodgeRegulators:D.3/finite-polylogarithm-reduction](#target-padichodgeregulators-d-3-finite-polylogarithm-reduction), [PadicHodgeRegulators:D.1/unramified-frobenius-on-roots](#target-padichodgeregulators-d-1-unramified-frobenius-on-roots), `mathlib:Submodule.span`, `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`, [ColemanIntegration:L2/dilogarithm-identities](ColemanIntegration.md), [PadicHodgeRegulators:D.1/dilogarithm-scalar-extension](#target-padichodgeregulators-d-1-dilogarithm-scalar-extension), [PadicHodgeRegulators:D.3/residue-dilogarithm-function](#target-padichodgeregulators-d-3-residue-dilogarithm-function).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proposition 3.3 and proof, (179)–(182), pp. 38–39: Statement (a); ζ = 1 is excluded (GSWZ E38) and p > 3 is used in the proof.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Proposition 3.3, (182), p. 39: The source count includes x=0; for nonzero admissible roots use the repaired q−2 count for s>1 and the separate s=1 argument in proofSteps.

<a id="target-padichodgeregulators-d-3-root-of-unity-classes"></a>

### Root-of-unity classes in completed K₃

Target `PadicHodgeRegulators:D.3/root-of-unity-classes` · declaration `rootClassK3`.

**Hypotheses.** p odd; L unramified (so ord(ζ) is prime to p); every component of ζ differs from 1 (GSWZ E38).

Let p be odd, L a finite unramified étale Q_p-algebra and ζ ∈ μ(L) a root of unity of order m (prime to p) all of whose components are ≠ 1. Define [ζ]_L ∈ K_3(L; Z_p) as the image, under B(L) ⊗ Z_p → lim_ν B(L)/p^ν ≅ K_3(L; Z_p) (D.3/completed-k3-bloch-description, factorwise), of the Z_p-coefficient class ⟦ζ⟧ = m^{−1} ⊗ m[ζ] of K3BlochGroups:V.6/root-of-unity-class (iii) (componentwise; m[ζ] ∈ B(L) by K3BlochGroups:V.6/integral-root-multiple). This is the class GSWZ denote [ζ]: when ζ ∧ (1 − ζ) = 0 in Suslin's antisymmetric square (always the case after ⊗ Z_p, p odd), [ζ]_L is the image of [ζ] ∈ B(L), and GSWZ's ord(ζ)·D_p(ζ) is the regulator of the integral multiple m[ζ].

**Uses.** GSWZ Theorem 9, (183), and Example 4.3, (275): K_3(K_p; Z_p) is generated by the [ζ]; ξ = c_1[ζ_24] + c_2[ζ_24²] + c_3[ζ_24⁶]; HabiroNumberFields:HB.7/followup-integral-linear-jet: a valid finite presentation ξ̂ = Σ a_ζ[ζ] with a_ζ ∈ Z_p and ζ ≠ 1 of order prime to p; HabiroNumberFields:HB.7/pochhammer-sections: the sections Ψ_{[ζ]} are attached to these classes

**API.**

| Name | Contract |
| --- | --- |
| `rootClassK3` | rootClassK3 L ζ : completedK3 p L, for ζ a root of unity of L with all components ≠ 1. |
| `rootClassK3_eq_bloch` | rootClassK3 L ζ is the image of K3BlochGroups' rootClassPadic ζ under B(L) ⊗ ℤ_p → completedK3 p L. |
| `rootClassK3_prod` | For L = ∏ L_i, rootClassK3 L ζ = (rootClassK3 L_i ζ_i)_i. |
| `rootClassK3_map` | For a ℚ_p-algebra map f : L → L', completedK3 map sends rootClassK3 L ζ to rootClassK3 L' (f ζ); in particular φ_L(rootClassK3 ζ) = rootClassK3 (ζ^p). |
| `rootClassK3_inv` | rootClassK3 L ζ⁻¹ = −rootClassK3 L ζ. |
| `rootClassK3_mul_ord` | ord(ζ) • rootClassK3 L ζ is the image of the integral Bloch element m[ζ]. |
| `rootClassK3_extensionality` | In a finite product, two rootClassK3 values are equal iff all factor projections agree; the construction is invariant under equality of admissible root arguments. It is a function of roots, not asserted to be additive in the multiplicative root argument. |

**Discriminating tests.**

- `rootClassK3_neg_one` (computation): For p > 3, rootClassK3 Q_p (−1) = 0.
- `rootClassK3_order_two_product` (degenerate): For L = Q_p × Q_p and ζ = (−1, −1), rootClassK3 L ζ = 0, the product of two zero classes.
- `rootClassK3_bloch_compat` (compatibility): When ζ ∧ (1 − ζ) = 0 in Suslin's antisymmetric square (K3BlochGroups:V.6/root-of-unity-symbol), rootClassK3 L ζ is the image of [ζ] ∈ B(L).
- `rootClassK3_component_one` (non-example): For p = 5, L = Q_{25} × Q_5 and ζ = ζ_24^4 (Q_5 component 1), the class is not defined: the raw symbol [1] is not a Bloch-group generator and D(1) is undefined (GSWZ E38).

**Check.**

- [−1]_{Q_p} = 0 for p > 3: the integral multiple 2[−1] = ⟨−1⟩ lies in B(Q_p) and is 2-torsion (K3BlochGroups:V.3/angle-bracket-two-torsion), so ⟦−1⟧ = 2^{−1} ⊗ 2[−1] = 0 in B(Q_p) ⊗ Z_p.
- A ζ with a component equal to 1 (for instance ζ_24^4 ∈ Q_{25} × Q_5 at p = 5, whose Q_5 component is 1) is rejected.

**Construction or proof route.**

1. m is a unit in Z_p, so m^{−1} ⊗ m[ζ] is defined in B(L) ⊗ Z_p and is independent of the representative m (K3BlochGroups:V.6/root-of-unity-class).
2. The completion map B(L) ⊗ Z_p → B(L)^∧_p composed with D.3/completed-k3-bloch-description gives the class in K_3(L; Z_p); on a product it is taken factorwise.
3. ζ ∧ (1 − ζ) is 2-torsion in Suslin's antisymmetric square of each factor (the principal-unit part of 1 − ζ is uniquely (q − 1)-divisible), so after ⊗ Z_p the raw symbol [ζ] already lies in B(L) ⊗ Z_p and agrees with ⟦ζ⟧.

**Dependencies.** [K3BlochGroups:V.6/root-of-unity-class](K3BlochGroups.md), [K3BlochGroups:V.6/integral-root-multiple](K3BlochGroups.md), [K3BlochGroups:V.6/root-of-unity-symbol](K3BlochGroups.md), [K3BlochGroups:V.3/angle-bracket-two-torsion](K3BlochGroups.md), [PadicHodgeRegulators:D.3/completed-k3-bloch-description](#target-padichodgeregulators-d-3-completed-k3-bloch-description), [PadicHodgeRegulators:D.3/completed-k3-unramified](#target-padichodgeregulators-d-3-completed-k3-unramified).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9 and proof, p. 39: The classes and the integral multiple ord(ζ)·[ζ]; components equal to 1 are excluded (GSWZ E38).

<a id="target-padichodgeregulators-d-3-local-regulator"></a>

### The p-adic regulator on completed K₃

Target `PadicHodgeRegulators:D.3/local-regulator` · declaration `localRegulator`.

**Hypotheses.** L finite étale over Q_p; integrality and bijectivity statements are D.3/unramified-regulator-theorem (p > 3, L unramified).

For a finite étale Q_p-algebra L = ∏ L_i (any p; L_i/Q_p finite) define D_L : K_3(L; Z_p) → L as the composite of the étale Chern isomorphism K_3(L; Z_p) ≅ H^1(L, Z_p(2)) (componentwise, D.2/etale-regulator), the inclusion into H^1(L, Q_p(2)) and the Bloch–Kato logarithm log_BK : H^1(L, Q_p(2)) ≅ D_dR(Q_p(2)) = L·e_2 ≅ L (L1/bloch-kato-logarithm, e_2 = t^{−2} ⊗ ε^{⊗2}), multiplied by the sign ε ∈ {±1} fixed so that D_L([ζ]_L) = +D_L(ζ) = +Li_2(ζ) on root-of-unity classes. By D.2/syntomic-etale-regulator-comparison, D_L = ε·reg_syn (Besser's normalisation) on the image of K_3(O_L), and by D.2/weight-two-dilogarithm-comparison D_L agrees with the dilogarithm D_L of D.1 on Bloch elements presented by special units of O_L. This is GSWZ's D_p of (19) and (183), defined on the completed group.

**Uses.** GSWZ (19), (22) and Theorem 9: the p-adic regulator D_p entering the formal completion of invertible sections and the local K_3 calculation; PadicHodgeRegulators:D.4/global-p-adic-regulator: applied after the localisation map from global K_3; K3BlochGroups:V.6/regulator-agreement-padic: the p-adic regulator compared with the Bloch-group model modulo p^m

**API.**

| Name | Contract |
| --- | --- |
| `localRegulator` | localRegulator L : completedK3 p L →ₗ[ℤ_[p]] L. |
| `localRegulator_eq_logBK` | localRegulator L = ε • (logBK ∘ chernEquiv) with ε = ±1 the pinned sign. |
| `localRegulator_rootClass` | localRegulator L (rootClassK3 L ζ) = etaleDilog L ζ (= (Li_2(ζ_i))_i). |
| `localRegulator_specialUnits` | On the image of a Bloch element Σ n_i [x_i] with x_i special units of O_L, localRegulator = Σ n_i etaleDilog L x_i. |
| `localRegulator_map` | For a ℚ_p-algebra map f : L → L', localRegulator L' ∘ completedK3.map f = f ∘ localRegulator L; in particular localRegulator commutes with φ_L. |
| `localRegulator_transfer` | For L → L' finite free, localRegulator L ∘ transfer = Tr_{L'/L} ∘ localRegulator L'. |
| `localRegulator_prod` | On L = ∏ L_i, localRegulator is the product of the factor regulators. |
| `localRegulator_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `localRegulator_q5_root` (computation): localRegulator Q_5 (rootClassK3 Q_5 (teichmuller 2)) ≡ 25 mod 125.
- `localRegulator_zero_algebra` (degenerate): localRegulator 0 = 0.
- `localRegulator_syntomic_compat` (compatibility): On the image of K_3(O_L), localRegulator = ε·syntomicRegulator (D.2/syntomic-regulator) with n = 2.
- `localRegulator_not_gros` (non-example): For L = Q_5, the Gros-normalised map (1 − 5^{−2})·localRegulator sends rootClassK3 (teichmuller 2) to a unit, so it is not localRegulator and does not have image 25Z_5.

**Check.**

- L = Q_5: D_L([ω(2)]) ≡ 25 mod 125.
- On the zero algebra D_L = 0.
- D_L is not the Gros-normalised map: (1 − σ/p²)∘D_L has image O_L, not p²O_L, for L unramified and p > 3.

**Construction or proof route.**

1. The Chern isomorphism and log_BK are Z_p-linear and continuous; their composite is defined on the completed group, which repairs the definitional gap recorded as GSWZ E39.
2. For roots of unity of order prime to p, ζ is a special unit, so D.2/weight-two-dilogarithm-comparison gives log_BK(c_{2,1}[ζ]_L) = ±Li_2(ζ); this fixes ε (the sign is the single sign of de Jeu's map).
3. The identification with Besser's syntomic regulator is D.2/syntomic-etale-regulator-comparison at n = 2.

**Dependencies.** [PadicHodgeRegulators:D.3/completed-k3-unramified](#target-padichodgeregulators-d-3-completed-k3-unramified), [PadicHodgeRegulators:D.2/etale-regulator](#target-padichodgeregulators-d-2-etale-regulator), [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison](#target-padichodgeregulators-d-2-syntomic-etale-regulator-comparison), [PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison](#target-padichodgeregulators-d-2-weight-two-dilogarithm-comparison), [PadicHodgeRegulators:D.3/root-of-unity-classes](#target-padichodgeregulators-d-3-root-of-unity-classes), [PadicHodgeRegulators:D.1/regulator-normalisation-dictionary](#target-padichodgeregulators-d-1-regulator-normalisation-dictionary).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §1.5, (19), p. 9: The map; here defined on the completed group as the regulator and compared with the dilogarithm where proved.; [HK2011](https://arxiv.org/abs/math/0612611v1), Theorem 1.3.2 and Proposition 2.3.4, pp. 9 and 16: The identification of Besser's regulator with log_BK of Soulé's regulator.

<a id="target-padichodgeregulators-d-3-unramified-regulator-theorem"></a>

### The unramified p > 3 theorem

Target `PadicHodgeRegulators:D.3/unramified-regulator-theorem` · declaration `unramified_regulator_theorem`.

**Hypotheses.** p > 3; L a finite product of finite unramified extensions of Q_p.

Let p > 3 and let L be a finite unramified étale Q_p-algebra (for instance K_p = K ⊗ Q_p for a number field K in which p is unramified). Then the p-adic regulator is a Z_p-linear isomorphism D_L : K_3(L; Z_p) ≅ p²O_L. The statement is not asserted for p ∈ {2, 3}, for ramified L, or for the uncompleted group K_3(L).

**Check.**

- L = Q_{25} × Q_5 (p = 5, GSWZ Example 4.3): K_3(L; Z_5) ≅ 25·(Z_{25} × Z_5).
- L = Q_5: the generator [ω(2)] maps to an element of valuation exactly 2.
- p = 3, L = Q_3: K_3(Q_3; Z_3) ≅ Z_3 ⊕ Z/3 has torsion, so no injection into 9Z_3 exists; the theorem does not apply.
- L = Q_p(ζ_p), p odd (ramified): K_3(L; Z_p) has torsion Z/p, so the theorem does not apply.

**Construction or proof route.**

1. Structure: K_3(L; Z_p) ≅ H^1(L, Z_p(2)) is free of rank [L : Q_p] (D.3/completed-k3-unramified).
2. Image: log_BK(H^1(L, Z_p(2))) = 1!·p²O_L·e_2 = p²O_L because 2 ≤ p − 2 (L1/integral-logarithm-unramified). Hence D_L(K_3(L; Z_p)) = p²O_L, and D_L is injective on the torsion-free group since log_BK is injective. This supplies the containment and the extension to the completed group that GSWZ's proof asserts without proof (GSWZ E39).
3. Independent check of the image from below: D_L([ζ]_L) = Li_2(ζ) and these span p²O_L (D.3/residue-spanning (c)).
4. Alternatively, from the two inclusions p²O_L ⊆ image ⊆ p²O_L, a surjection between free Z_p-modules of the same finite rank is injective (Orzech property of commutative rings; Lean form unramifiedRegulator_injective_of_surjective).

**Dependencies.** [PadicHodgeRegulators:D.3/local-regulator](#target-padichodgeregulators-d-3-local-regulator), [PadicHodgeRegulators:D.3/completed-k3-unramified](#target-padichodgeregulators-d-3-completed-k3-unramified), [PadicHodgeRegulators:L1/integral-logarithm-unramified](#target-padichodgeregulators-l1-integral-logarithm-unramified), [PadicHodgeRegulators:D.3/residue-spanning](#target-padichodgeregulators-d-3-residue-spanning), [PadicHodgeRegulators:D.3/root-of-unity-classes](#target-padichodgeregulators-d-3-root-of-unity-classes), `mathlib:Module.Free`, `mathlib:OrzechProperty`.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9, (183), p. 39: Part (a); p unramified is implicit (D_p : B(K) → K_p is defined for unramified p).; [BNQD2002](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf), Lemme 1.3.2, p. 647: The index form of the integral Bloch–Kato logarithm used for the image.

<a id="target-padichodgeregulators-d-3-roots-of-unity-generate"></a>

### Completed K₃ is generated by roots of unity

Target `PadicHodgeRegulators:D.3/roots-of-unity-generate` · declaration `root_classes_generate`.

**Hypotheses.** p > 3; L unramified; ζ ranges over roots of unity with all components ≠ 1 (GSWZ E38).

Let p > 3 and L a finite unramified étale Q_p-algebra. Then K_3(L; Z_p) is generated as a Z_p-module by the classes [ζ]_L, ζ ∈ μ(L) with every component ≠ 1; every ξ ∈ K_3(L; Z_p) has a finite presentation ξ = Σ_ζ a_ζ[ζ]_L with a_ζ ∈ Z_p, and for any such presentation D_L(ξ) = Σ_ζ a_ζ Li_2(ζ). Presentations are not unique; D_L(ξ) is.

**Check.**

- p = 5, L = Q_{25} × Q_5: [ζ_24], [ζ_24²], [ζ_24⁶] form a Z_5-basis, as GSWZ (274)–(275) use.
- For L = Q_5 the single class [ω(2)] generates K_3(Q_5; Z_5) ≅ Z_5.

**Construction or proof route.**

1. D_L is an isomorphism onto p²O_L (D.3/unramified-regulator-theorem) and D_L([ζ]_L) = Li_2(ζ) (D.3/local-regulator).
2. The Li_2(ζ) span p²O_L (D.3/residue-spanning (c), which also handles products once components equal to 1 are excluded); pulling back along D_L gives generation.
3. Linearity of D_L gives the value on any presentation.

**Dependencies.** [PadicHodgeRegulators:D.3/unramified-regulator-theorem](#target-padichodgeregulators-d-3-unramified-regulator-theorem), [PadicHodgeRegulators:D.3/residue-spanning](#target-padichodgeregulators-d-3-residue-spanning), [PadicHodgeRegulators:D.3/root-of-unity-classes](#target-padichodgeregulators-d-3-root-of-unity-classes), [PadicHodgeRegulators:D.3/local-regulator](#target-padichodgeregulators-d-3-local-regulator).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9, p. 39: Part (b), with components equal to 1 excluded (GSWZ E38).

<a id="target-padichodgeregulators-d-3-residue-dilogarithm-function"></a>

### Finite residue dilogarithm function

Target `PadicHodgeRegulators:D.3/residue-dilogarithm-function` · declaration `residueDilogValue`.

**Hypotheses.** p prime; F a field over F_p. Root-count and spanning applications require p>3 and F finite.

For p prime and an F_p-algebra field F, define f_p(x)=li_{2,p}(x)/(x-1)^p on F^× minus {1}. Its total algebraic extension uses field inverse 0 inverse = 0, hence f_p(1)=0; this convention supplies no dilogarithm value or regulator class at the excluded root 1. For p>3 write li_{2,p}=(X-1)^2 g_p with deg g_p=p-3; then f_p(x)=g_p(x)/(x-1)^(p-2) for x≠1.

**Uses.** PadicHodgeRegulators:D.3/residue-spanning: Bound each fibre on the q-2 admissible points by p-2, then span by values and differences.; PadicHodgeRegulators:D.3/finite-polylogarithm-reduction: Identify the reduction of p^-2 D(zeta^p) with f_p(zeta bar).

**API.**

| Name | Contract |
| --- | --- |
| `residueDilogValue` | The total field expression li_{2,p}(x)/(x-1)^p, with the admissible domain specified separately. |
| `residueDilogValue_cancel_double_zero` | For p>3 and x≠1, f_p(x)=g_p(x)/(x-1)^(p-2). No cancellation at x=1 is used. |
| `residueDilogValue_map` | For a field embedding over F_p, the image of f_p(x) equals f_p of the image of x; admissible points remain admissible. |
| `residueDilogValue_five_values` | In F_5 the values at 2,3,4 are respectively 1,4,0. |

**Discriminating tests.**

- `residueDilogValue_five_values` (computation): The values (1,4,0) at (2,3,4) span F_5; their differences also span.
- `residueDilogValue_excluded_one` (non-example): The total extension has f_p(1)=0, but 1 is excluded from the regulator and fibre-count domains.
- `residueDilogValue_zero_not_root` (degenerate): The total extension has f_p(0)=0; zero is not a root of unity, so the admissible domain has q-2 elements.
- `residueDilogValue_coleman_reduction` (compatibility): For admissible tame zeta, p^-2 D(zeta^p) mod p equals f_p(zeta bar), with arithmetic Frobenius on the argument.

**Check.**

- At p=5 the admissible values are (1,4,0); their differences span as well.
- The proof counts q-2 admissible inputs, excluding both 0 and 1, regardless of their total-extension values.

**Construction or proof route.**

1. Evaluate the finite polynomial and divide by the indicated power. On the admissible domain its denominator is a unit; cancel the double zero only when p>3 and x≠1.

**Dependencies.** [PadicHodgeRegulators:D.3/finite-polylogarithm](#target-padichodgeregulators-d-3-finite-polylogarithm).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, equations (178)–(182), Propositions 3.2–3.3, pp.38–39: The finite rational function used to span the residue space, with domain restricted here to nonzero points different from 1.
<a id="stage-d4"></a>

## D.4 — Arithmetic localization and Frobenius

Localize the global regulator, compare norm with trace and arithmetic Frobenius, and export the completed local isomorphism to HabiroNumberFields. The explicit formula applies to special-unit presentations. General Bloch presentations and global injectivity retain their separate conjectural hypotheses.

**Planets:** Global p-adic K₃ regulator.

<a id="target-padichodgeregulators-d-4-global-p-adic-regulator"></a>

### The global p-adic K₃ regulator

Target `PadicHodgeRegulators:D.4/global-p-adic-regulator` · declaration `globalPadicRegulator`.

**Hypotheses.** F a number field, p any prime; the integrality clause needs p > 3 unramified in F.

Let F be a number field and p a prime. The global p-adic regulator is D_{F,p} := D_{F⊗Q_p} ∘ λ_{F,p} : K_3(F) → F ⊗_Q Q_p ≅ ∏_{v|p} F_v, where λ_{F,p} : K_3(F) → ∏_{v|p} K_3(F_v; Z_p) = K_3(F ⊗ Q_p; Z_p) is the semilocal completed map of KTheoryFiniteLocalFields:L.7/semilocal-completed-map and D_{F⊗Q_p} is the regulator of D.3/local-regulator. It kills the torsion subgroup of K_3(F) and induces D_{F,p} ⊗ Q : K_3(F) ⊗ Q → F ⊗ Q_p; for p > 3 unramified in F its image lies in p²(O_F ⊗ Z_p).

**Uses.** GSWZ §1.5, Definition 1.3 and (22): the formal completion f̂ with log f̂_m = D_p(ξ)/(m² log q) + log f_m; HabiroNumberFields:HB.7/invertible-local-sections: the K_3-indexed local sections use D_p(ξ) in GSWZ's normalisation; HabiroNahmSeries:HB.9/p-adic-regulator-input: D_p(ξ) of the Nahm class ξ at primes p ∤ Δ; Polylogarithms:P.6/padic-regulator: the weight-one analogue is the p-adic unit regulator of D.1/unit-logarithm-kernel

**API.**

| Name | Contract |
| --- | --- |
| `globalPadicRegulator` | globalPadicRegulator F p : K_3(F) →+ F ⊗[ℚ] ℚ_[p]. |
| `globalPadicRegulator_component` | Its v-component is localRegulator F_v ∘ c_v. |
| `globalPadicRegulator_torsion` | globalPadicRegulator F p x = 0 for every torsion x. |
| `globalPadicRegulator_integral` | For 3 < p unramified in F, its range lies in p² • (𝓞_F ⊗ ℤ_p). |
| `globalPadicRegulator_rat` | The extension K_3(F) ⊗ ℚ →ₗ[ℚ] F ⊗ ℚ_[p]. |
| `globalPadicRegulator_galois` | For τ ∈ Aut(F), globalPadicRegulator F p ∘ K_3(τ) = (τ ⊗ 1) ∘ globalPadicRegulator F p. |
| `globalPadicRegulator_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `globalPadicRegulator_rat_zero` (computation): globalPadicRegulator ℚ p = 0, since K_3(ℚ) ≅ ℤ/48 is finite.
- `globalPadicRegulator_torsion_zero` (degenerate): For F totally real, K_3(F) ⊗ Q = 0 (Borel: rank r_2 = 0), so globalPadicRegulator F p ⊗ Q = 0.
- `globalPadicRegulator_bloch_compat` (compatibility): For ξ ∈ K_3(F) whose Bloch image is presented by special units at p, globalPadicRegulator F p ξ = blochDilog F p (presentation) (D.4/special-unit-formula).
- `globalPadicRegulator_not_injective_claim` (non-example): For F imaginary quadratic and p split, K_3(F) ⊗ Q has rank 1 while F ⊗ Q_p has rank 2; injectivity of globalPadicRegulator ⊗ Q is a separate proposition (D.4/padic-k3-regulator-injectivity), not a consequence of the ranks.

**Check.**

- F = Q: K_3(Q) ≅ Z/48 is torsion, so D_{Q,p} = 0 for every p.
- F = Q(α), α³ − α² + 1 = 0, p = 5: D_{F,5}(ξ) for the class ξ of 5_2 is the value (271) of GSWZ (D.4/example-cubic-field-five-two).

**Construction or proof route.**

1. λ_{F,p} is the product of the completion maps c_v followed by p-completion; under the semilocal equivalence F ⊗ Q_p ≅ ∏_v F_v it is induced by F → F ⊗ Q_p (KTheoryFiniteLocalFields:L.7/semilocal-completed-map).
2. D_{F⊗Q_p} is Z_p-linear with torsion-free target, so torsion classes of K_3(F) map to 0.
3. For p > 3 unramified, D.3/unramified-regulator-theorem gives the integrality.

**Dependencies.** [KTheoryFiniteLocalFields:L.7/semilocal-completed-map](KTheoryFiniteLocalFields.md), [PadicHodgeRegulators:D.3/local-regulator](#target-padichodgeregulators-d-3-local-regulator), [PadicHodgeRegulators:D.3/unramified-regulator-theorem](#target-padichodgeregulators-d-3-unramified-regulator-theorem), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §1.5, (19), p. 9: The map from K_3 of the semilocal algebra; precomposed with localisation from K_3(K).

<a id="target-padichodgeregulators-d-4-special-unit-formula"></a>

### The global regulator on special-unit presentations

Target `PadicHodgeRegulators:D.4/special-unit-formula` · declaration `global_special_unit_formula`.

**Hypotheses.** z_i, 1 − z_i ∈ O_{F,(v)}^× for every v | p; the presentation lies in the image of B(F) ⊗ Q under Suslin's map.

Let F be a number field, p a prime, and let ξ ∈ K_3(F) have image in B(F) ⊗ Q presented as Σ_i n_i[z_i] (n_i ∈ Q) with z_i and 1 − z_i units at every prime of F above p. Then D_{F,p}(ξ) = ±Σ_i n_i D_{F,p}^{dil}([z_i]), where D^{dil}_{F,p} is the combined dilogarithm of D.1/combined-dilogarithm and the sign is the pinned sign of D.3/local-regulator. In particular: (a) for every root of unity ζ ≠ 1 of F, D_{F,p}([ζ]) = Li_2(ζ ⊗ 1) componentwise; (b) for a fixed presentation the hypothesis holds for all but finitely many p; (c) when R = O_F[1/Δ] and all z_i, 1 − z_i ∈ R^×, the formula holds at every p ∤ Δ. For presentations by symbols that are not special units at p the formula is Besser–de Jeu's Conjecture 1.14 (gap).

**Check.**

- F = Q(α), α³ − α² + 1 = 0: ξ = 2[1 − α²] + [1 − α] with 1 − α², α², 1 − α, α global units, so the formula holds at every p (D.4/example-cubic-field-five-two).
- F = Q(ζ_m), p ∤ m: D_{F,p}([ζ_m]) = (Li_2(σ_v ζ_m))_{v|p}.

**Construction or proof route.**

1. At each v | p, the localisation of ξ is presented by special units of O_v; D.2/weight-two-dilogarithm-comparison (BdJ Theorem 1.10 for number fields) gives the v-component.
2. Roots of unity of any order: BdJ Theorem 1.12.
3. (b) is BdJ Remark 1.11: a fixed finite presentation involves finitely many elements, each a unit away from finitely many primes.

**Dependencies.** [PadicHodgeRegulators:D.4/global-p-adic-regulator](#target-padichodgeregulators-d-4-global-p-adic-regulator), [PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison](#target-padichodgeregulators-d-2-weight-two-dilogarithm-comparison), [PadicHodgeRegulators:D.1/combined-dilogarithm](#target-padichodgeregulators-d-1-combined-dilogarithm), [PadicHodgeRegulators:D.3/local-regulator](#target-padichodgeregulators-d-3-local-regulator), [KTheoryFiniteLocalFields:L.7/restriction-completion-square](KTheoryFiniteLocalFields.md).

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Theorem 1.10(2) and Remark 1.11, p. 5: The number-field version and its scope.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Lemma 3.1, p. 38: GSWZ work with special units of R = O_K[1/Δ], which is the range of this theorem.

<a id="target-padichodgeregulators-d-4-norm-trace-compatibility"></a>

### Restriction and transfer for the global regulator

Target `PadicHodgeRegulators:D.4/norm-trace-compatibility` · declaration `global_norm_trace_compatibility`.

**Hypotheses.** E/F finite; Iwasawa branch; Bloch–Kato logarithms of the factors.

Let E/F be a finite extension of number fields and p a prime. (a) Restriction: D_{E,p}(res_{E/F} ξ) = ι(D_{F,p}(ξ)) for ξ ∈ K_3(F), ι : F ⊗ Q_p → E ⊗ Q_p. (b) Transfer: D_{F,p}(N_{E/F} η) = Tr_{E⊗Q_p/F⊗Q_p}(D_{E,p}(η)) for η ∈ K_3(E). (c) Consequently D_{F,p}(N_{E/F} res_{E/F} ξ) = [E : F]·D_{F,p}(ξ). The same holds for the local regulators of D.3 along finite extensions of finite étale Q_p-algebras.

**Check.**

- F = Q, E = Q(ζ_3), p = 7: D_{Q,7}(N[ζ_3]) = Tr(D_{E,7}([ζ_3])) = Li_2(ζ_3) + Li_2(ζ_3^{−1}) = 0, consistent with K_3(Q) being torsion.
- Transfer is not multiplicative on sections: the HabiroNumberFields norm of sections corresponds to this additive trace on degrees, not to a product of regulators.

**Construction or proof route.**

1. λ is compatible with restriction and transfer (KTheoryFiniteLocalFields:L.7/semilocal-completed-map and L.7/transfer-completion-formula).
2. Locally, the étale regulator takes restriction to restriction and transfer to corestriction (D.2/etale-regulator API), and log_BK takes restriction to inclusion and corestriction to trace on D_dR(Q_p(2)) (L1/twist-and-change-of-field).
3. (c) follows from (a), (b) and Tr∘ι = [E : F].

**Dependencies.** [PadicHodgeRegulators:D.4/global-p-adic-regulator](#target-padichodgeregulators-d-4-global-p-adic-regulator), [KTheoryFiniteLocalFields:L.7/semilocal-completed-map](KTheoryFiniteLocalFields.md), [KTheoryFiniteLocalFields:L.7/transfer-completion-formula](KTheoryFiniteLocalFields.md), [PadicHodgeRegulators:D.2/etale-regulator](#target-padichodgeregulators-d-2-etale-regulator), [PadicHodgeRegulators:L1/twist-and-change-of-field](#target-padichodgeregulators-l1-twist-and-change-of-field), [PadicHodgeRegulators:D.1/logarithm-norm-trace](#target-padichodgeregulators-d-1-logarithm-norm-trace).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, paragraph after (174), p. 38: Componentwise definition, which makes the trace compatibility a sum over embeddings.

<a id="target-padichodgeregulators-d-4-frobenius-compatibility"></a>

### Frobenius compatibility of the p-adic regulator

Target `PadicHodgeRegulators:D.4/frobenius-compatibility` · declaration `global_frobenius_compatibility`.

**Hypotheses.** p unramified in F (any p for the functoriality; p > 3 for the integral statements it is combined with).

Let p be unramified in the number field F and let φ_p be the Frobenius of the unramified étale algebra F ⊗ Q_p ≅ ∏_{v|p} F_v (the product of the arithmetic Frobenii). Then φ_p acts on K_3(F ⊗ Q_p; Z_p) by functoriality and D_{F⊗Q_p}(φ_p x) = φ_p(D_{F⊗Q_p}(x)); in particular D_p(φ_p ξ) = φ_p D_p(ξ) for ξ ∈ K_3(F), with φ_p ξ := φ_p λ_{F,p}(ξ). On root-of-unity classes, φ_p[ζ] = [ζ^p] and D(ζ^p) = φ_p D(ζ).

**Check.**

- GSWZ (273): D_5(ζ_24^5) = φ(D_5(ζ_24)) in the Q_{25}-component.
- With the geometric Frobenius in place of the arithmetic one the identity reads D(ζ^{p^{-1}}) = φ^{−1}D(ζ); the convention is pinned to the arithmetic Frobenius (Huber–Kings warn about this choice).

**Construction or proof route.**

1. φ_p is a Q_p-algebra automorphism, so D.3/local-regulator's functoriality (étale Chern classes and log_BK are natural for automorphisms of the field) gives the identity.
2. On roots of unity this is D.1/dilogarithm-scalar-extension (b) with φ(ζ) = ζ^p.

**Dependencies.** [PadicHodgeRegulators:D.3/local-regulator](#target-padichodgeregulators-d-3-local-regulator), [PadicHodgeRegulators:D.3/unramified-etale-algebra](#target-padichodgeregulators-d-3-unramified-etale-algebra), [PadicHodgeRegulators:D.1/dilogarithm-scalar-extension](#target-padichodgeregulators-d-1-dilogarithm-scalar-extension), [PadicHodgeRegulators:D.3/root-of-unity-classes](#target-padichodgeregulators-d-3-root-of-unity-classes).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), §3.1, (176), p. 38: The Frobenius on roots of unity used with D_p(φ_p ξ) = φ_p D_p(ξ).

<a id="target-padichodgeregulators-d-4-torsion-and-denominators"></a>

### Torsion classes and controlled denominators

Target `PadicHodgeRegulators:D.4/torsion-and-denominators` · declaration `global_torsion_and_denominators`.

**Hypotheses.** F a number field; p > 3 unramified in F for (b)–(d). N≠0 in the denominator bound; the root-of-unity notation is a coefficient-localized Bloch class transported rationally, not necessarily the raw integral symbol [ζ].

Let F be a number field and p > 3 unramified in F. (a) Every torsion element of K_3(F) has D_{F,p} = 0. (b) If β ∈ K_3(F) ⊗ Q satisfies Nβ ∈ image(K_3(F)) for a nonzero integer N, then D_{F,p}(β) ∈ p^{2 − v_p(N)}(O_F ⊗ Z_p). (c) For a root of unity ζ ∈ μ(F) ∖ {1} of order m, the coefficient-localised class ⟦ζ⟧ ∈ B(F) ⊗ Z[1/m] of K3BlochGroups:V.6/root-of-unity-class has D_{F,p}(⟦ζ⟧) = Li_2(ζ ⊗ 1), which lies in p²(O_F ⊗ Z_p) when p ∤ m. (d) The image D_{F,p}(K_3(F)) is a finitely generated Z-submodule of rank at most r_2(F) inside p²(O_F ⊗ Z_p); its Z_p-span need not be all of p²(O_F ⊗ Z_p).

**Check.**

- F = Q(√−3), p = 7 (split): D_{F,7} kills the finite torsion subgroup Z/w_2(F); the non-torsion part has rank r_2 = 1 inside a rank-2 target.
- If N=p and pβ is integral, the bound places its regulator in p(O_F⊗Z_p). This is an upper bound on denominators; it does not establish that a global class attains the bound.

**Construction or proof route.**

1. (a) The target is torsion-free.
2. (b) D_{F,p}(Nβ) ∈ p²(O_F ⊗ Z_p) by D.4/global-p-adic-regulator, and division by N costs v_p(N).
3. (c) D.4/special-unit-formula (a) and linearity: D(m^{−1} ⊗ m[ζ]) = m^{−1}·m·Li_2(ζ).
4. (d) K_3(F) is finitely generated of rank r_2 (K3BlochGroups:V.2/k3-rank-borel); the finitely generated global image has Z-rank≤r_2; λ_{F,p}(K_3(F)) spans a Z_p-submodule of K_3(F ⊗ Q_p; Z_p) of rank ≤ r_2 ≤ [F : Q].

**Dependencies.** [PadicHodgeRegulators:D.4/global-p-adic-regulator](#target-padichodgeregulators-d-4-global-p-adic-regulator), [PadicHodgeRegulators:D.4/special-unit-formula](#target-padichodgeregulators-d-4-special-unit-formula), [K3BlochGroups:V.5/k3-number-field](K3BlochGroups.md), [K3BlochGroups:V.2/k3-rank-borel](K3BlochGroups.md), [K3BlochGroups:V.6/root-of-unity-class](K3BlochGroups.md), [K3BlochGroups:V.6/comparison-rational](K3BlochGroups.md).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Proof of Theorem 9, p. 39: Torsion-freeness of the target, which makes torsion classes vanish.

<a id="target-padichodgeregulators-d-4-habiro-regulator-export"></a>

### The regulator exported to Habiro-module gluing

Target `PadicHodgeRegulators:D.4/habiro-regulator-export` · declaration `habiro_regulator_export`.

**Hypotheses.** Δ divisible by disc(K) and 6; p ∤ Δ.

Let K be a number field, Δ a positive integer divisible by disc(K) and by 6, R = O_K[1/Δ], and p ∤ Δ (so p > 3 is unramified in K). The p-adic regulator used to define invertible L_p(ξ)-sections (GSWZ Definition 1.3, (22)) is D_p := D_{K,p} : K_3(K) → p²R^∧_p ⊂ K_p = R^∧_p[1/p] = K ⊗ Q_p, with: (i) the Iwasawa branch and D_p([ζ]) = Li_2(ζ) on roots of unity; (ii) D_p(φ_p ξ) = φ_p D_p(ξ); (iii) D_p(ξ) = Σ n_i D(z_i) for presentations by Δ-special units z_i, 1 − z_i ∈ R^×; (iv) every ξ has a Z_p-presentation λ_{K,p}(ξ) = Σ a_ζ [ζ]_{K_p} by roots of unity of order prime to p with all components ≠ 1, and D_p(ξ) = Σ a_ζ Li_2(ζ); (v) scalar dictionary: D_p = ε·log_BK∘r^et_2 (Bloch–Kato, e_2-basis), D_p = ε·reg_syn for Besser’s Chern-class regulator with the de Jeu sign ε; equality without ε requires aligning the symbol convention first, and the Gros normalisation is (1 − φ_p/p²)·D_p, which maps p²R^∧_p onto R^∧_p. No injectivity of λ_{K,p} ⊗ Q is asserted (D.4/padic-k3-regulator-injectivity).

**Check.**

- GSWZ Example 4.3 at p = 5 (Δ = 6·23): D.4/example-cubic-field-five-two.
- With the Gros normalisation in (22) the integrality condition (21) would change by the factor (1 − φ_p/p²); the export pins Besser's normalisation.

**Construction or proof route.**

1. (i), (ii), (iii) are D.4/global-p-adic-regulator, D.4/frobenius-compatibility and D.4/special-unit-formula (c).
2. (iv) applies D.3/roots-of-unity-generate to λ_{K,p}(ξ) ∈ K_3(K_p; Z_p).
3. (v) collects D.3/local-regulator and D.2/gros-normalisation.

**Dependencies.** [PadicHodgeRegulators:D.4/global-p-adic-regulator](#target-padichodgeregulators-d-4-global-p-adic-regulator), [PadicHodgeRegulators:D.4/special-unit-formula](#target-padichodgeregulators-d-4-special-unit-formula), [PadicHodgeRegulators:D.4/frobenius-compatibility](#target-padichodgeregulators-d-4-frobenius-compatibility), [PadicHodgeRegulators:D.3/roots-of-unity-generate](#target-padichodgeregulators-d-3-roots-of-unity-generate), [PadicHodgeRegulators:D.1/regulator-normalisation-dictionary](#target-padichodgeregulators-d-1-regulator-normalisation-dictionary), [PadicHodgeRegulators:D.2/gros-normalisation](#target-padichodgeregulators-d-2-gros-normalisation).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Definition 1.3, (20)–(22), p. 9: The use of D_p(ξ) that fixes the normalisation.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 1, p. 9: The range of primes for which the export is made.

<a id="target-padichodgeregulators-d-4-padic-k3-regulator-injectivity"></a>

### The p-adic K₃ regulator injectivity proposition

Target `PadicHodgeRegulators:D.4/padic-k3-regulator-injectivity` · declaration `PadicK3RegulatorInjective`.

**Hypotheses.** F a number field, p a prime.

For a number field F and prime p, Inj(F,p) means injectivity of the Q-linear map D_{F,p}⊗Q:K_3(F)⊗Q→F⊗Q_p. Since the source has Q-dimension r_2(F), this is equivalent to Z-rank r_2(F) of the finitely generated integral image. Separately, StrongInj(F,p) means injectivity of the Q_p-linear extension K_3(F)⊗Q_p→F⊗Q_p, equivalently Q_p-dimension r_2(F) of its span, or Z_p-rank r_2(F) of the Z_p-span. StrongInj implies Inj; the converse is not a formal equivalence. Neither assertion for positive r_2 follows from Borel’s rank formula or the local D.3 isomorphism.

**Uses.** PadicHodgeRegulators D.4 stage text: keep the higher p-adic regulator conjecture a distinct proposition; ColemanIntegration:L3/padic-beilinson-conjecture: the weight-two Artin-motive case of the p-adic Beilinson conjecture contains non-vanishing of such regulators

**API.**

| Name | Contract |
| --- | --- |
| `PadicK3RegulatorInjective` | PadicK3RegulatorInjective F p : Prop := Function.Injective (globalPadicRegulator_rat F p). |
| `padicK3RegulatorInjective_of_totallyReal` | If F is totally real, PadicK3RegulatorInjective F p holds. |
| `padicK3RegulatorInjective_iff_rank` | PadicK3RegulatorInjective F p ↔ the integral image has Z-rank r_2(F), equivalently the rational image has Q-dimension r_2(F). This is not a Q_p-span criterion. |
| `padicK3RegulatorInjective_baseChange` | For E/F finite, PadicK3RegulatorInjective E p implies PadicK3RegulatorInjective F p (restriction is injective rationally and compatible with D.4/norm-trace-compatibility). |
| `StrongPadicK3RegulatorInjective` | Function.Injective of the Q_p-linear extension of globalPadicRegulator_rat; equivalent to Q_p-span dimension r_2(F). |
| `strongPadicK3RegulatorInjective_implies` | StrongPadicK3RegulatorInjective F p implies PadicK3RegulatorInjective F p; no converse from linear algebra. |
| `PadicK3RegulatorInjective_extensionality` | The injectivity predicates depend only on the specified Q-linear or Q_p-linear map respectively: pointwise equal maps give equivalent predicates. Proof witnesses are unique by proof irrelevance; scalar extension is not an extensionality equivalence. |

**Discriminating tests.**

- `injective_rat` (computation): PadicK3RegulatorInjective ℚ p holds, since K_3(ℚ) ⊗ ℚ = 0.
- `injective_totally_real` (degenerate): For F totally real (r_2 = 0) the source is zero and the proposition holds.
- `injective_rank_compat` (compatibility): For F imaginary quadratic, the proposition is equivalent to D_{F,p}(ξ_0) ≠ 0 for a generator ξ_0 of K_3(F) modulo torsion.
- `injective_not_from_rank` (non-example): A zero map from a nonzero Q-vector space into a larger Q_p-vector space is not injective. The inequality r_2≤[F:Q] alone supplies no information about the regulator’s kernel.
- `injective_scalar_extension_non_example` (non-example): For α∈Q_p outside Q, (a,b)↦a+αb on Q² is injective, while the Q_p-linear map with the same formula has nonzero kernel (−α,1). Thus rational injectivity alone does not imply full Q_p-span rank.

**Check.**

- Inj(F, p) holds trivially when r_2(F) = 0.
- Inj(F, p) is not asserted for any F with r_2(F) ≥ 1.

**Construction or proof route.**

1. Define the two injectivity predicates over their specified scalar fields. Rationalizing a homomorphism from the finitely generated group gives the Z-rank criterion for Inj; extending scalars to Q_p gives the Q_p-span criterion for StrongInj. A Q-linearly independent set of p-adic vectors need not be Q_p-linearly independent: (a,b)↦a+αb is injective on Q² for α∈Q_p\Q, but its Q_p-linear extension has the nonzero kernel (−α,1). No arithmetic converse is claimed.

**Dependencies.** [PadicHodgeRegulators:D.4/global-p-adic-regulator](#target-padichodgeregulators-d-4-global-p-adic-regulator), [K3BlochGroups:V.2/k3-rank-borel](K3BlochGroups.md), [K3BlochGroups:V.5/k3-number-field](K3BlochGroups.md).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Theorem 9, p. 39: A local statement; it says nothing about the image of global K_3, whence the separate proposition.

<a id="target-padichodgeregulators-d-4-example-cubic-field-five-two"></a>

### GSWZ Example 4.3: the class of 5₂ at p = 5

Target `PadicHodgeRegulators:D.4/example-cubic-field-five-two` · declaration `example_cubic_field_five_two`.

**Hypotheses.** p = 5 ∤ 6·23.

Let K = Q(α), α³ − α² + 1 = 0 (discriminant −23), z_1 = z_3 = 1 − α², z_2 = z_1² − z_1 + 2 = 1 − α, and ξ = [z_1] + [z_2] + [z_3] = 2[1 − α²] + [1 − α] ∈ B(K) (the class of the knot 5_2). All of 1 − α², α², 1 − α and α are units of O_K (norm ±1). At p = 5, K_5 ≅ Q_{25} × Q_5, μ(K_5) ≅ μ_24 × μ_4, and ζ_24 := lim_s α^{5^{2s}} has order 24 with Q_5-component the Teichmüller lift of 2 (order 4). Then D_5(ξ) = c_1D_5(ζ_24) + c_2D_5(ζ_24²) + c_3D_5(ζ_24⁶) with c_1 = 1 + 4·5 + 3·5² + ⋯, c_2 = 3 + 5 + ⋯, c_3 = 1 + 5 + 4·5² + ⋯, hence λ_{K,5}(ξ) = c_1[ζ_24] + c_2[ζ_24²] + c_3[ζ_24⁶] in K_3(K_5; Z_5). The second line of GSWZ (273) is the value D_5(ζ_24²), misprinted there with the label ζ_24^5 (GSWZ E56).

**Check.**

- Recompute D_5(ξ), D_5(ζ_24), D_5(ζ_24²), D_5(ζ_24⁶) to precision 5^{12} with exact arithmetic in Z_5[α] and check (271), (273) (relabelled) and (274).
- The Q_5-component of ζ_24^4 is 1, so ζ_24^4 is not an admissible generator.

**Construction or proof route.**

1. All symbols are special units at 5, so D.4/special-unit-formula identifies D_5(ξ) with the dilogarithm sum (271).
2. Compute the three root values and the two special-unit values independently by the convergent depleted-polylogarithm series and integration within residue discs described in the reader’s worked calculation. Exact arithmetic in (Z/5^16)[alpha]/(alpha^3-alpha^2+1), repeated at precision 20, gives all retained 12 digits of D/25 and of the coefficients. The root matrix determinant is 3 modulo 5. This checks the displayed source digits and corrected exponent 2 without using those digits as input; it is finite-precision evidence, not a Lean proof.
3. Injectivity of D_5 on K_3(K_5; Z_5) (D.3/unramified-regulator-theorem) turns the identity of regulators into the identity of classes.

**Dependencies.** [PadicHodgeRegulators:D.4/habiro-regulator-export](#target-padichodgeregulators-d-4-habiro-regulator-export), [PadicHodgeRegulators:D.4/special-unit-formula](#target-padichodgeregulators-d-4-special-unit-formula), [PadicHodgeRegulators:D.3/roots-of-unity-generate](#target-padichodgeregulators-d-3-roots-of-unity-generate), [PadicHodgeRegulators:D.1/combined-dilogarithm](#target-padichodgeregulators-d-1-combined-dilogarithm).

**Sources.** [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Example 4.3, (270)–(275), p. 54: The example.; [GSWZ2024](https://arxiv.org/abs/2412.04241v2), Example 4.3, (274), p. 54: The decomposition of D_5(ξ) by the root-of-unity values.
<a id="stage-l2"></a>

## L2 — The Iwasawa comparison and its normalization

Import Fontaine equivalence, actual integral psi, the derived inverse-corestriction comparison, finite-flat coefficient change and Wach lattices from PhiGammaModulesAndIwasawaCohomology. This layer owns regulator normalization under changes of generator, roots and Tate vector. Rationalization follows the integral inverse limit. Ordinary character specialization is not substituted for derived specialization without its Tor hypothesis.

**Planets:** Fontaine's ψ-isomorphism; Berger's ψ-invariants theorem.

<a id="target-padichodgeregulators-l2-fontaine-iwasawa-map"></a>

### Fontaine's isomorphism h_Iw : D(T)^{ψ=1} ≅ H¹_Iw

Target `PadicHodgeRegulators:L2/fontaine-iwasawa-map` · declaration `fontaineIwasawaEquiv`.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

Assume H₀. Let D(T) be the étale (φ, Γ)-module of T over O_E ⊗ A_{Q_p} with the operator ψ (PhiGammaModulesAndIwasawaCohomology PG.1, PG.4). Define h_{Iw,T} : D(T)^{ψ=1} → H^1_Iw(Q_p, T) as the H^1-comparison of the ψ-complex [D(T) --(ψ − 1)--> D(T)] with the inverse-corestriction Iwasawa complex (PG.5, SelmerIwasawaCohomology L3). Then: (a) h_{Iw,T} is a Λ-linear bijection; (b) for n ≥ 1, a topological generator γ_n of Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^n})) and ℓ_n(γ_n) := log_p χ(γ_n)/p^n, pr_n(h(y)) is the class of σ ↦ ℓ_n(γ_n)((σ − 1)/(γ_n − 1)·y − (σ − 1)b), where x_n ∈ D(T)^{ψ=0} solves (γ_n − 1)x_n = (φ − 1)y and b ∈ A ⊗ T solves (φ − 1)b = x_n; (c) cor ∘ pr_{n+1} = pr_n and pr_0 = cor_{Q_p(μ_p)/Q_p} ∘ pr_1; (d) h_{Iw,V} := h ⊗ Q is independent of the lattice; (e) the Λ_E-torsion of D(V)^{ψ=1} is V^{H_{Q_p}} and maps onto the torsion of H^1_Iw(Q_p, V); H^1_Iw(Q_p, T) has no Z_p-torsion.

**Uses.** PadicHodgeRegulators:L3/crystalline-regulator: L_V = (Mellin^{−1} ⊗ 1)∘(1 − φ)∘h_Iw^{−1}; PadicHodgeRegulators:L3/explicit-reciprocity: the Iwasawa pairing is transported through h_Iw; PadicHodgeRegulators:L4/signed-local-condition: ker Col_j is exported to H^1_Iw through the proved h_Iw comparison; Berger, Bloch and Kato's exponential map, Theorem II.6: exp*(h^1_{F_n}(y)) = p^{−n}∂_V(φ^{−n}y)

**API.**

| Name | Contract |
| --- | --- |
| `fontaineIwasawaEquiv` | fontaineIwasawaEquiv T : D(T)^{ψ=1} ≃ₗ[Λ] H1Iw T. |
| `fontaineIwasawaEquiv_pr` | pr_n (fontaineIwasawaEquiv T y) is the class of the explicit cocycle of (b). |
| `fontaineIwasawaEquiv_cor` | cor ∘ pr_{n+1} = pr_n; pr_0 = cor ∘ pr_1. |
| `fontaineIwasawaEquiv_rat` | The rationalisation is independent of T ⊂ V. |
| `fontaineIwasawaEquiv_torsion` | Torsion of D(V)^{ψ=1} = V^{H_{Q_p}} ↦ torsion of H1Iw V. |
| `H1Iw_noZpTorsion` | H1Iw T has no ℤ_p-torsion. |
| `fontaineIwasawaEquiv_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `fontaineIwasawa_trivial` (computation): For V = Q_p, the class h(1) is nonzero and fixed by G_∞.
- `fontaineIwasawa_unramified_char` (degenerate): For V = E(μ) with μ unramified nontrivial, H^1_Iw(Q_p, V) is torsion-free (Q_p(μ_{p^∞}) ∩ Q_p^ur = Q_p).
- `fontaineIwasawa_cor_compat` (compatibility): cor_{Q_p(μ_{p^2})/Q_p(μ_p)} ∘ pr_2 ∘ h = pr_1 ∘ h, matching SelmerIwasawaCohomology's inverse system.
- `fontaineIwasawa_not_D_itself` (non-example): h is defined on D(T)^{ψ=1}, not on D(T)^{φ=1}: for V = Q_p(1), (1 + π)/π ⊗ e_1 lies in D^{ψ=1} but not in D^{φ=1}.

**Check.**

- V = Q_p: h(1) is a nonzero G_∞-fixed class spanning the torsion of H^1_Iw(Q_p, Q_p).
- h(σ_{−1}·y) = σ_{−1}·h(y) for σ_{−1} ∈ Δ with χ(σ_{−1}) = −1.

**Construction or proof route.**

1. Import PG.5/integral-iwasawa-comparison, iwasawa-functoriality and finite-character-specialization on the actual integral etale module D(T); use their derived inverse-corestriction and coefficient-change hypotheses before rationalizing.
2. The level-n cocycle is Cherbonnier–Colmez Proposition I.4.1 and Theorem II.1.3(ii); compatibility with corestriction is Berger Lemma I.9. Comparing this cocycle with the chosen positive Kummer map remains the explicit sign-normalization obligation.
3. Torsion: Berger Proposition II.7 identifies V^{H_K} inside D(V)^{psi=1} with its Lambda-torsion.

**Dependencies.** [PhiGammaModulesAndIwasawaCohomology:PG.5](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex-h1](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/psi-zero-splitting](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex](PhiGammaModulesAndIwasawaCohomology.md), [SelmerIwasawaCohomology:L3/iwasawa-cohomology](SelmerIwasawaCohomology.md), [PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings](PadicHodgeTheory.md), [PadicMeasuresIwasawaAlgebras:L1/convolution-algebra](PadicMeasuresIwasawaAlgebras.md), [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [PhiGammaModulesAndIwasawaCohomology:PG.5/integral-iwasawa-comparison](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/iwasawa-functoriality](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/finite-character-specialization](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/fontaine-equivalence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/torsion-rational-compatibility](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/rank-one-dictionary](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Théorème II.1.3, p. 12: The isomorphism.; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Theorem II.8, p. 118: The integral and rational forms.

<a id="target-padichodgeregulators-l2-generator-independence"></a>

### Independence of the generator of Γ

Target `PadicHodgeRegulators:L2/generator-independence` · declaration `fontaine_generator_independence`.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

Assume H₀. For generators γ, γ' = γ^a (a ∈ Z_p^×) of Γ_n, u := (γ − 1)/(γ' − 1) is a unit of Λ, and the cochain map ι_{γ,γ'} := (u, u ⊕ id, id) : C_{φ,γ} → C_{φ,γ'} is an isomorphism with ℓ(γ)[c_{x,y}] = ℓ(γ')[c_{ux,y}] in H^1. Hence the level-n formula of L2/fontaine-iwasawa-map (b) does not depend on γ_n, and replacing γ by γ^a only changes the variable X = γ − 1 of Λ to (1 + X)^a − 1. For γ' = γ^m with p ∤ m, PG.3's generator map equals Q_m·ι_{γ,γ^m} on H^1.

**Check.**

- γ' = γ^{−1}: u = −γ, X ↦ (1 + X)^{−1} − 1.
- The independence statement in Berger's Proposition I.8 is an exercise there; this node supplies it.

**Construction or proof route.**

1. Check that (u, u ⊕ id, id) commutes with the Herr differentials d0 = (φ − 1, γ − 1) (Cherbonnier–Colmez Lemme I.4.2).
2. Λ acts on H^1 of the Herr complex through augmentation, so the integer-power generator map of PG.3 differs from ι by the scalar Q_m.

**Dependencies.** [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PhiGammaModulesAndIwasawaCohomology:PG.3/herr-generator-map](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.3/herr-generator-isomorphism](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Lemme I.4.2, p. 7: The generator change.; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Proposition I.8, p. 110: The independence asserted by Berger.

<a id="target-padichodgeregulators-l2-root-change"></a>

### Changing the compatible system of roots of unity

Target `PadicHodgeRegulators:L2/root-change` · declaration `fontaine_root_change`.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

Assume H₀ and let a ∈ Z_p^×, σ_a ∈ G_∞ with χ(σ_a) = a, ε' = σ_a(ε) = ε^a. (i) The embeddings ι_ε : A_{Q_p} → Ã (π ↦ [ε] − 1) satisfy ι_{ε'} = ι_ε ∘ γ_a on A, A^+ and B^+_rig; D(T), N(T), ψ, the G_∞-action and h_{Iw,T} are unchanged. (ii) t' = a·t, e'_j = a^j e_j, ∂' = a^{−1}∂; the localisation maps ι_n are unchanged as maps (coordinates ζ' = ζ^a). (iii) For the Mellin transform M_ε(λ) = λ·(1 + π_ε): M_{ε'}(λ) = M_ε(λσ_a), so M_{ε'}^{−1} = [σ_a]^{−1}M_ε^{−1}. (iv) Twisting by e'_j is a^j times twisting by e_j. (v) Coleman power series: f^{ε'}_u(π_{ε'}) = f^ε_u(π_ε) in A^+ and Δ(f^{ε'}_u) ⊗ e'_1 = Δ(f^ε_u) ⊗ e_1.

**Check.**

- The regulator distribution changes by [σ_a]^{−1} (Loeffler–Zerbes 2014, Remark 4.16), as L3/naturality-and-lattice records.
- a = −1: t' = −t and e'_1 = −e_1, so ⊗e_1 changes sign while h_Iw does not.

**Construction or proof route.**

1. ε enters only through π = [ε] − 1, t = log[ε], e_j and the Mellin/Coleman coordinates; Cherbonnier–Colmez's cocycle and Berger's h^1 involve γ and b only, so h_Iw is ε-free.
2. Compute each coordinate change from π_{ε'} = (1 + π_ε)^a − 1.

**Dependencies.** [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action](PadicHodgeTheory.md), [PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t](PadicHodgeTheory.md), [PadicHodgeTheory:P7:annulus-foundations/localisation-at-roots-of-unity](PadicHodgeTheory.md), [PadicMeasuresIwasawaAlgebras:L2/amice-dilation](PadicMeasuresIwasawaAlgebras.md), [PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence](PadicMeasuresIwasawaAlgebras.md), [ColemanPowerSeries:L2/coleman-interpolation-equivariance](ColemanPowerSeries.md).

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Remark 4.16, p. 20: The effect of a root change on the regulator; the coordinate dictionary is derived in proofSteps (no source states it as one lemma).

<a id="target-padichodgeregulators-l2-local-iwasawa-twist"></a>

### Twisting local Iwasawa cohomology by characters of G_∞

Target `PadicHodgeRegulators:L2/local-iwasawa-twist` · declaration `iwasawaTwist`.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

Assume H₀. For a continuous character η : G_∞ → O_E^×, choose n(k) ≥ k with η ≡ 1 mod p^k on Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^{n(k)}})); using H^1_Iw(Q_p, T) = lim_k H^1(Q_p(μ_{p^{n(k)}}), T/p^k) define Tw_η := lim_k (x ↦ x ∪ ē_η) with ē_η ∈ H^0(Q_p(μ_{p^{n(k)}}), (O_E/p^k)(η)). Then Tw_η : H^1_Iw(Q_p, T) → H^1_Iw(Q_p, T(η)) is a well-defined O_E-linear bijection, independent of the choices, with Tw_1 = id, Tw_η ∘ Tw_η' = Tw_{ηη'}, and Tw_η(λx) = Tw_η(λ)Tw_η(x) where Tw_η(σ) = η(σ)^{−1}σ on Λ (SelmerIwasawaCohomology's convention Tw_k for η = χ^k). For ω of finite order trivial on G_{Q_p(μ_{p^n})}: pr_n(Tw_ω x) = pr_n(x) ⊗ e_ω.

**Uses.** PadicHodgeRegulators:L3/meromorphic-twist-extension: L_V(z) = (ℓ_{−1}…ℓ_{−m})^{−1} Tw_{χ^m}(L_{V(m)}(z ⊗ e_m)) ⊗ t^m e_{−m}; PadicHodgeRegulators:L3/ramified-interpolation: z_{η,0} is the specialisation of the twisted class; PadicHodgeRegulators:L4/derham-interpolation-growth: twists by finite-order characters of conductor p^n

**API.**

| Name | Contract |
| --- | --- |
| `iwasawaTwist` | iwasawaTwist η : H1Iw T ≃+ H1Iw (T(η)). |
| `iwasawaTwist_smul` | iwasawaTwist η (λ • x) = Tw_η(λ) • iwasawaTwist η x. |
| `iwasawaTwist_one` | iwasawaTwist 1 = id. |
| `iwasawaTwist_mul` | iwasawaTwist η ∘ iwasawaTwist η' = iwasawaTwist (η * η'). |
| `iwasawaTwist_pr_finite` | For ω of finite order trivial on level n, pr_n ∘ iwasawaTwist ω = (· ⊗ e_ω) ∘ pr_n. |
| `iwasawaTwist_eq_shapiro` | For η = χ^j, iwasawaTwist agrees with the Shapiro-lemma twist of SelmerIwasawaCohomology. |
| `iwasawaTwist_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `iwasawaTwist_inverse` (computation): iwasawaTwist η⁻¹ (iwasawaTwist η x) = x.
- `iwasawaTwist_trivial` (degenerate): iwasawaTwist 1 x = x.
- `iwasawaTwist_level_cyclotomic` (compatibility): For η = χ^j and n ≥ 1, pr_n(Tw_{χ^j}x) ≡ pr_n(x) ∪ ε_n^{⊗j} modulo p^n.
- `iwasawaTwist_not_linear` (non-example): iwasawaTwist χ is not Λ-linear: iwasawaTwist χ (σ • x) = χ(σ)^{−1} σ • iwasawaTwist χ x ≠ σ • iwasawaTwist χ x for χ(σ) ≠ 1.

**Check.**

- Tw_η ∘ Tw_{η^{−1}} = id.
- Tw_{χ^j}(σ_{−1}x) = (−1)^j σ_{−1}Tw_{χ^j}(x).

**Construction or proof route.**

1. At finite level the cup product with ē_η is an isomorphism H^1(Q_p(μ_{p^{n(k)}}), T/p^k) ≅ H^1(·, T(η)/p^k), compatible with corestriction because ē_η is restricted from lower levels modulo p^k.
2. Pass to the limit; for η = χ^j compare with Cherbonnier–Colmez Proposition II.1.2 and with the Shapiro twist of SelmerIwasawaCohomology:L3/iwasawa-shapiro.
3. SelmerIwasawaCohomology:L3/iwasawa-twist is stated for the global Q-tower; the local Q_p version is owned here.

**Dependencies.** [SelmerIwasawaCohomology:L3/iwasawa-cohomology](SelmerIwasawaCohomology.md), [SelmerIwasawaCohomology:L3/iwasawa-shapiro](SelmerIwasawaCohomology.md), [SelmerIwasawaCohomology:L3/iwasawa-twist](SelmerIwasawaCohomology.md), [PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom](PadicMeasuresIwasawaAlgebras.md).

**Sources.** [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Proposition II.1.2, p. 12: The twist by χ^k.; [LZ2014](https://arxiv.org/pdf/1108.5954v3), Lemma 2.4, p. 7: Twisting by arbitrary characters of G_∞.

<a id="target-padichodgeregulators-l2-twist-compatibility"></a>

### Compatibility of h_Iw with twists

Target `PadicHodgeRegulators:L2/twist-compatibility` · declaration `fontaine_twist_compatibility`.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

Assume H₀. (i) D(T(η)) = D(T) ⊗ e_η with φ, ψ acting on the first factor and g(x ⊗ e_η) = η(g)g(x) ⊗ e_η, so ⊗e_η : D(T)^{ψ=1} → D(T(η))^{ψ=1} is Tw_η-semilinear. (ii) h_{Iw,T(η)}(y ⊗ e_η) = Tw_η(h_{Iw,T}(y)). (iii) For η = χ^j the level-n cocycle of h(y ⊗ e_j) is σ ↦ ℓ(γ_n)((σ − 1)/(γ_n − 1)·y(j) − (σ − 1)b) with y(j) the image of y in D(V(j))^{ψ=1} (Cherbonnier–Colmez, proof of Theorem IV.2.1). (iv) For crystalline V, N(T(j)) = π^{−j}N(T) ⊗ e_j.

**Check.**

- η = χ: h(y ⊗ e_1) = Tw_χ h(y).
- For V = Q_p, N(Z_p(1)) = π^{−1}N(Z_p) ⊗ e_1 = π^{−1}A^+ ⊗ e_1.

**Construction or proof route.**

1. (i) is the tensor compatibility of the Fontaine equivalence (request to PG.1).
2. (ii) compare the level-k cocycles of L2/fontaine-iwasawa-map (b) with the cup product defining Tw_η; for η of finite order use Loeffler–Zerbes 2014 Lemma 2.4, in general reduce modulo p^k.
3. (iv) Berger's observation N(T(−1)) = πN(T) ⊗ e_{−1}, iterated (Wach modules from PG.6).

**Dependencies.** [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/local-iwasawa-twist](#target-padichodgeregulators-l2-local-iwasawa-twist), [PadicHodgeTheory:P7/robba-realisation-comparison](PadicHodgeTheory.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-module](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-existence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-height](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-dcris](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-reconstruction](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-unramified-base-change](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-iwasawa](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/fontaine-equivalence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/torsion-rational-compatibility](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/rank-one-dictionary](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Proof of Théorème IV.2.1, p. 21: (i) and (iii).; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Appendix A, p. 124: (iv).

<a id="target-padichodgeregulators-l2-wach-psi-fixed-vectors"></a>

### Berger: ψ-fixed vectors lie in the Wach module

Target `PadicHodgeRegulators:L2/wach-psi-fixed-vectors` · declaration `wach_psi_fixed_vectors`.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T). V crystalline with weights in [a; b]; for (iii) a ≥ 0 and no quotient E.

Assume H₀ and let V be E-linear crystalline with Hodge–Tate weights in [a; b], T ⊂ V a G-stable O_E-lattice and N(T) its Wach module (PG.6). (i) D(T)^{ψ=1} ⊂ π^{a−1}N(T). (ii) If V has no quotient isomorphic to E(a), then D(T)^{ψ=1} ⊂ π^a N(T). (iii) In particular, if a ≥ 0 and V has no quotient isomorphic to E (equivalently, as a Q_p-representation, no quotient Q_p), then ψ(N(T)) ⊂ N(T), N(T)^{ψ=1} = D(T)^{ψ=1}, N(V)^{ψ=1} = D(V)^{ψ=1}, and h_Iw restricts to Λ-isomorphisms N(T)^{ψ=1} ≅ H^1_Iw(Q_p, T) and N(V)^{ψ=1} ≅ H^1_Iw(Q_p, V).

**Check.**

- V = E(1) (a = 1): (1 + π)/π ⊗ e_1 ∈ D(V)^{ψ=1} ∩ N(V).
- V = E (a = 0, quotient E): 1/π ∈ D(E)^{ψ=1} ∖ A^+, so the hypothesis of (ii) and the exponent a − 1 in (i) are sharp.

**Construction or proof route.**

1. Twist to weights in [0; b − a] (L2/twist-compatibility (iv)).
2. Berger Lemmas A.4–A.7: ψ(π^{−m}) = π^{−m}(p^{m−1} + πQ_m(π)) and D(T)^{ψ=1} ⊂ π^{−1}N(T) for weights ≥ 0 (where N(T) ⊂ φ^*N(T) gives ψ(N(T)) ⊂ N(T)).
3. If an element of D(T)^{ψ=1} had a pole of order one, its leading coefficient would give a nonzero vector of D_cris(V)^{φ=1} = (N(V)/πN(V))^{φ=1}; for weights ≥ 0 such a vector forces a quotient Q_p (an eigenvalue 1 in D_cris(V^*) with Fil^0 = everything gives (V^*)^{G} ≠ 0 by the fundamental exact sequence) — this is the step Berger states without proof.
4. Combine with L2/fontaine-iwasawa-map.

**Dependencies.** [PhiGammaModulesAndIwasawaCohomology:PG.4](PhiGammaModulesAndIwasawaCohomology.md), [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/twist-compatibility](#target-padichodgeregulators-l2-twist-compatibility), [PadicHodgeTheory:P7/wach-dcris-comparison](PadicHodgeTheory.md), [PadicHodgeTheory:R06.1/fundamental-exact-sequence](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/period-functors](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/hodge-tate-weight-convention](PadicHodgeTheory.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-module](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-existence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-height](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-dcris](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-reconstruction](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-unramified-base-change](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-iwasawa](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-psi](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Theorem A.3, p. 124: The theorem.; [LLZWach](https://arxiv.org/abs/0912.1263v3), §1, p. 4: Form (iii), used by the L3 regulator.

<a id="target-padichodgeregulators-l2-character-specialisation"></a>

### Specialisation of Iwasawa classes at characters

Target `PadicHodgeRegulators:L2/character-specialisation` · declaration `charSpecialization`.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

Assume H₀. For x ∈ H^1_Iw(Q_p, T) and a continuous character η of G_∞, put x_η := Tw_{η^{−1}}(x) ∈ H^1_Iw(Q_p, T(η^{−1})) and x_{η,n} := pr_n(x_η) ∈ H^1(Q_p(μ_{p^n}), T(η^{−1})). (a) (λx)_{η,0} = η(λ)x_{η,0} for λ ∈ Λ. (b) If x = h_Iw(y) and η = χ^jω with ω of conductor p^m, then for n ≥ max(m, 1): x_{η,n} = pr_n(h_{Iw,T(η^{−1})}(y ⊗ e_{−j} ⊗ e_{ω^{−1}})) and x_{η,0} = cor_{Q_p(μ_{p^n})/Q_p}(x_{η,n}), independent of n. (c) With T' = T(η^{−1}): 0 → (H^1_Iw(T')_{Γ_1})^Δ → H^1(Q_p, T') → (H^2_Iw(T')^{Γ_1})^Δ → 0.

**Uses.** PadicHodgeRegulators:L3/ramified-interpolation: z_{η,0} in the interpolation formula at η = χ^jω; PadicHodgeRegulators:L3/unramified-interpolation: z_{χ^j,0} at unramified characters; PadicHodgeRegulators:L4/derham-regulator: specialisation of Iwasawa classes for de Rham modules

**API.**

| Name | Contract |
| --- | --- |
| `charSpecialization` | charSpecialization η : H1Iw T →ₗ[O_E] H^1(ℚ_p, T(η⁻¹)). |
| `charSpecialization_smul` | charSpecialization η (λ • x) = η(λ) • charSpecialization η x. |
| `charSpecialization_fontaine` | charSpecialization η (h y) = cor (pr_n (h (y ⊗ e_{−j} ⊗ e_{ω⁻¹}))) for n ≥ max(m,1). |
| `charSpecialization_descent` | The descent exact sequence (c). |
| `charSpecialization_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `charSpecialization_trivial` (computation): charSpecialization 1 = pr_0.
- `charSpecialization_zero` (degenerate): charSpecialization η 0 = 0.
- `charSpecialization_level_independence` (compatibility): For ω of conductor p, the formula of (b) gives the same class for n = 1 and n = 2.
- `charSpecialization_not_equivariant` (non-example): charSpecialization χ is not Λ-linear into a Λ-module: σ_{−1} acts on the target through χ(σ_{−1}) = −1.

**Check.**

- x_{1,0} = pr_0 x.
- (σ_{−1}x)_{χ,0} = −x_{χ,0}.

**Construction or proof route.**

1. (a) from L2/local-iwasawa-twist's semilinearity and the projection to level 0.
2. (b) from L2/twist-compatibility (ii) and the corestriction compatibility of L2/fontaine-iwasawa-map (c).
3. (c) is SelmerIwasawaCohomology:L3/iwasawa-descent for Γ_1 ≅ Z_p followed by Δ-invariants (|Δ| = p − 1 prime to p).

**Dependencies.** [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/local-iwasawa-twist](#target-padichodgeregulators-l2-local-iwasawa-twist), [PadicHodgeRegulators:L2/twist-compatibility](#target-padichodgeregulators-l2-twist-compatibility), [SelmerIwasawaCohomology:L3/iwasawa-descent](SelmerIwasawaCohomology.md), [PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom](PadicMeasuresIwasawaAlgebras.md).

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Definition 4.14, p. 20: The specialisation.; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), §II, p. 118: The level-n projection through h^1.

<a id="target-padichodgeregulators-l2-lattice-and-coefficient-squares"></a>

### Lattice and coefficient-change squares

Target `PadicHodgeRegulators:L2/lattice-and-coefficient-squares` · declaration `fontaine_lattice_coefficient_squares`.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

Assume H₀. (a) For lattices U ⊂ T ⊂ V: D(U) ⊂ D(T) ⊂ D(V) compatibly with φ, ψ, G_∞ and h_Iw; H^1_Iw(Q_p, T) → H^1_Iw(Q_p, V) is injective with image h(D(V)^{ψ=1} ∩ D(T)); N(U) = N(V) ∩ D(U), and U ↦ N(U) is an inclusion-preserving bijection between G-stable lattices and Wach lattices in N(V); under L2/wach-psi-fixed-vectors (iii), H^1_Iw(Q_p, T) = h(N(T)^{ψ=1}). (b) For E'/E finite, D, N, ψ, H^1_Iw, h, Λ and the Mellin transform commute with O_{E'} ⊗_{O_E} −; restriction of scalars to Z_p changes none of D, ψ, h.

**Check.**

- For T = Z_p(1) ⊂ V: H^1_Iw(Q_p, Z_p(1)) = h(N(Z_p(1))^{ψ=1}).
- Changing T to pT multiplies h(D(T)^{ψ=1}) by p.

**Construction or proof route.**

1. (a) N(T) = N(V) ∩ D(T) and the lattice bijection are Berger, Limites, Lemma II.1.3 and Proposition III.4.2 (requested from PG.6); injectivity on H^1_Iw holds because H^1_Iw(T) has no Z_p-torsion.
2. (b) Each construction is O_E-linear and commutes with finite flat base change; Lei–Loeffler–Zerbes §2.2–2.3 record the E-linear forms.

**Dependencies.** [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/wach-psi-fixed-vectors](#target-padichodgeregulators-l2-wach-psi-fixed-vectors), [PhiGammaModulesAndIwasawaCohomology:PG.5](PhiGammaModulesAndIwasawaCohomology.md), [PadicHodgeTheory:P7/integral-dcris-lattice](PadicHodgeTheory.md), [PadicHodgeTheory:P7:annulus-foundations/coefficient-extension](PadicHodgeTheory.md), [PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice](PadicMeasuresIwasawaAlgebras.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/integral-iwasawa-comparison](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/iwasawa-functoriality](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/finite-character-specialization](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-module](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-existence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-height](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-dcris](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-reconstruction](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-unramified-base-change](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-iwasawa](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/fontaine-equivalence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/torsion-rational-compatibility](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/rank-one-dictionary](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [LLZWach](https://arxiv.org/abs/0912.1263v3), §2.2, p. 8: Lattices of Wach modules.; [Limites2004](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf), Proposition III.4.2, p. 21: The lattice bijection.

<a id="target-padichodgeregulators-l2-kummer-coleman-comparison"></a>

### Kummer classes and Coleman power series

Target `PadicHodgeRegulators:L2/kummer-coleman-comparison` · declaration `kummer_coleman_comparison`.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T). T = Z_p(1).

Assume H₀ with T = Z_p(1). For a norm-compatible system u ∈ U_∞ of principal units of the tower Q_p(μ_{p^n}) with Coleman power series f_u (f_u(ε^{(n)} − 1) = u_n), Δ(f_u) := (1 + π)f_u'/f_u lies in A^{ψ=1}, and h_{Iw,Z_p(1)}(Δ(f_u) ⊗ e_1) = s·κ(u), where κ : U_∞ → H^1_Iw(Q_p, Z_p(1)) is the Kummer map of SelmerIwasawaCohomology (cocycle τ ↦ τ(α)/α) and s ∈ {±1} is a sign whose value remains to be checked against Cherbonnier–Colmez's Proposition V.3.2 iii) and the cocycle of L2/fontaine-iwasawa-map (b). Independently of that sign, Δ(f_u) ⊗ e_1 ∈ N(Z_p(1))^{ψ=1}, and by L2/root-change (v) the element is independent of ε.

**Check.**

- The sign s is the input of L3/tate-coleman-comparison (Col = −Col_0 there).
- For a = 1 + p and the norm-compatible principal units u_n = (ζ_{p^n}^a − 1)/(ζ_{p^n} − 1), f_u(π) = ((1 + π)^a − 1)/π and Δ(f_u) = a(1 + π)^a/((1 + π)^a − 1) − (1 + π)/π is explicit.

**Construction or proof route.**

1. ψ(Δ f_u) = Δ f_u (ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map).
2. Cherbonnier–Colmez V.3.2 iii) identify Exp*(δ(u)) with ι̂(u)^{−1}∇ι̂(u); compare their δ with the Kummer cocycle τ ↦ τ(α)/α: with τ[u_n] = [ε]^{c(τ)}[u_n], (1 − τ)(log[u_n]·t^{−1} ⊗ e_1) = −c(τ)e_1, which suggests a minus sign but does not settle the comparison of CC99’s δ with the supplier’s Kummer convention (recorded gap).
3. Membership in N(Z_p(1)) follows from L2/wach-psi-fixed-vectors (iii) applied to Z_p(1) (weights ≥ 0, no quotient Q_p).

**Dependencies.** [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/root-change](#target-padichodgeregulators-l2-root-change), [PadicHodgeRegulators:L2/wach-psi-fixed-vectors](#target-padichodgeregulators-l2-wach-psi-fixed-vectors), [ColemanPowerSeries:L1/coleman-equivalence](ColemanPowerSeries.md), [ColemanPowerSeries:L2/logarithmic-derivative](ColemanPowerSeries.md), [ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map](ColemanPowerSeries.md), [SelmerIwasawaCohomology:L4/local-units-iwasawa-cohomology](SelmerIwasawaCohomology.md), [SelmerIwasawaCohomology:L0/kummer-limit-map](SelmerIwasawaCohomology.md).

**Sources.** [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), Proposition V.3.2 iii), p. 27: The rank-one comparison.; [CC99](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), §V.3, p. 27: Cherbonnier–Colmez's normalisation of δ_n, whose sign against the Kummer cocycle remains an explicit comparison gap; the calculation in proofSteps is only a lead.
<a id="stage-l3"></a>

## L3 — The big logarithm and interpolation

Construct the intrinsic analytic-valued map in the nonnegative crystalline Wach range with no trivial quotient. Use the meromorphic twist extension outside that range. A singular unramified Euler factor gives a relation and an actual lift condition, not an inverse defined by total field division. Perrin–Riou reciprocity uses the inverse action in the second variable and the factor −σ_{−1}ℓ_0.

**Planets:** Quadratic Euler-operator formula; Perrin–Riou regulator; Perrin–Riou big exponential; Perrin–Riou reciprocity formula; Regulator determinant formula; Scalar regulator projection.

<a id="target-padichodgeregulators-l3-quadratic-frobenius-inverse"></a>

### Quadratic Frobenius inverse

Target `PadicHodgeRegulators:L3/quadratic-frobenius-inverse` · declaration `quadraticFrobeniusInverse`.

**Hypotheses.** E is a field; Phi is a finite square matrix.

Define P(a,b,Phi)=-b^(-1)(Phi+aI) as an explicit matrix expression. It is an inverse only under the separately stated quadratic relation and b nonzero.

**Uses.** LLZ Lemma 5.6: Replace an inverse of Frobenius by a guarded polynomial formula.

**API.**

| Name | Contract |
| --- | --- |
| `quadraticFrobeniusInverse_formula` | P=-b^(-1)(Phi+aI). |
| `quadraticFrobeniusInverse_spec` | Under Phi^2+aPhi+bI=0 and b nonzero, Phi P=I and P Phi=I. |
| `quadraticFrobeniusInverse_map` | A field embedding applied to all entries and scalars commutes with P. |

**Discriminating tests.**

- `frobenius_scalar_two` (computation): For Phi=(2), a=-5, b=6 over Q, P=(1/2).
- `frobenius_scalar_minus_one` (computation): For Phi=(-1), a=0, b=-1 over Q, P=(-1).
- `frobenius_singular_excluded` (non-example): For Phi=(0), a=b=0, P=(0) and Phi P is not I; the nonzero-b hypothesis cannot be omitted.

**Check.**

- Keep the nonzero-b hypothesis in the inverse theorem, not as an implicit convention about total inverses.

**Construction or proof route.**

1. Use scalar multiplication and the existing matrix identity; no matrix inverse is used in the definition.

**Dependencies.** .

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 5A, Lemma 5.6 and proof, pp. 1126-1127: Isolates the first explicit polynomial inverse used in the displayed Euler expression.

<a id="target-padichodgeregulators-l3-quadratic-frobenius-inverse-spec"></a>

### Frobenius inverse identities

Target `PadicHodgeRegulators:L3/quadratic-frobenius-inverse-spec` · declaration `quadraticFrobeniusInverse_spec`.

**Hypotheses.** E is a field; Phi is a d by d matrix; Phi^2+aPhi+bI=0; b is nonzero.

If Phi^2+aPhi+bI=0 and b is nonzero, then Phi P=P Phi=I.

**Check.**

- Prove both sides without assuming commutativity of the full matrix ring.

**Construction or proof route.**

1. Expand Phi P using the quadratic relation to obtain -b^(-1)(-bI)=I.
2. P is a polynomial in Phi, so the expansion on the other side is identical.

**Dependencies.** [PadicHodgeRegulators:L3/quadratic-frobenius-inverse](#target-padichodgeregulators-l3-quadratic-frobenius-inverse).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 5A, Lemma 5.6, proof: The inverse assertion requires the explicit nonzero scalar denominator.

<a id="target-padichodgeregulators-l3-quadratic-euler-inverse"></a>

### Quadratic Euler inverse

Target `PadicHodgeRegulators:L3/quadratic-euler-inverse` · declaration `quadraticEulerInverse`.

**Hypotheses.** E is a field; Phi is a finite square matrix.

Define Q(a,b,Phi)=(1+a+b)^(-1)(Phi+(1+a)I). This is the inverse candidate for I-Phi, not an unqualified inverse at singular Euler factors.

**Uses.** LLZ Lemma 5.6: Make the second excluded denominator explicit in Euler interpolation.

**API.**

| Name | Contract |
| --- | --- |
| `quadraticEulerInverse_formula` | Q=(1+a+b)^(-1)(Phi+(1+a)I). |
| `quadraticEulerInverse_spec` | Under the quadratic relation and 1+a+b nonzero, (I-Phi)Q=Q(I-Phi)=I. |
| `quadraticEulerInverse_map` | A field embedding commutes with Q. |

**Discriminating tests.**

- `euler_scalar_two` (computation): For Phi=(2), a=-5, b=6 over Q, Q=(-1).
- `euler_scalar_zero` (degenerate): For Phi=(0), a=b=0 over Q, Q=I: invertibility of I-Phi does not require invertibility of Phi.
- `euler_singular_excluded` (non-example): For Phi=(1), a=-3, b=2, Q=0 and (I-Phi)Q is not I, since 1+a+b=0.

**Check.**

- Distinguish the denominator 1+a+b from the separate denominator b.

**Construction or proof route.**

1. Form the indicated scalar multiple of a degree-one polynomial in Phi.

**Dependencies.** .

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 5A, Lemma 5.6 and proof, pp. 1126-1127: Isolates the inverse of I-Phi in the source's calculation.

<a id="target-padichodgeregulators-l3-quadratic-euler-inverse-spec"></a>

### Euler inverse identities

Target `PadicHodgeRegulators:L3/quadratic-euler-inverse-spec` · declaration `quadraticEulerInverse_spec`.

**Hypotheses.** E is a field; Phi is square; the quadratic relation holds; 1+a+b is nonzero.

If Phi^2+aPhi+bI=0 and s=1+a+b is nonzero, then (I-Phi)Q=Q(I-Phi)=I.

**Check.**

- Do not infer this statement when 1 is an eigenvalue of Phi.

**Construction or proof route.**

1. Expand (I-Phi)(Phi+(1+a)I) and reduce Phi^2 using the quadratic relation; the answer is sI.
2. Divide only by s nonzero and repeat on the other side.

**Dependencies.** [PadicHodgeRegulators:L3/quadratic-euler-inverse](#target-padichodgeregulators-l3-quadratic-euler-inverse).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 5A, Lemma 5.6, proof: The source calculation becomes a typed two-sided inverse identity with its denominator hypothesis.

<a id="target-padichodgeregulators-l3-quadratic-euler-product"></a>

### Quadratic Euler-operator formula

Target `PadicHodgeRegulators:L3/quadratic-euler-product` · declaration `quadraticEulerProduct`.

**Hypotheses.** E is a field; Phi is a finite square matrix; Phi^2+aPhi+bI=0; p,b,1+a+b are nonzero.

Assume p,b and s=1+a+b are nonzero. With P=Phi^(-1) and Q=(I-Phi)^(-1) certified by the preceding lemmas, Q(I-p^(-1)P) equals [(1+a+pb)Phi+(a(1+a+pb)+b(p-1))I]/[pb(1+a+b)].

**Check.**

- Test Phi=2,a=-5,b=6,p=5, which gives -9/10; exclude Phi=1 and zero Frobenius where appropriate.

**Construction or proof route.**

1. Insert the two explicit polynomial expressions.
2. Reduce the quadratic term by Phi^2=-aPhi-bI, collect the coefficient of Phi and the scalar term, and use the three nonzero denominator hypotheses.
3. This is an algebraic input to interpolation, not an interpolation theorem or a definition on the excluded eigenspaces.

**Dependencies.** [PadicHodgeRegulators:L3/quadratic-frobenius-inverse-spec](#target-padichodgeregulators-l3-quadratic-frobenius-inverse-spec), [PadicHodgeRegulators:L3/quadratic-euler-inverse-spec](#target-padichodgeregulators-l3-quadratic-euler-inverse-spec).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 5A, Lemma 5.6, p. 1126: The displayed operator formula is retained with every denominator made explicit.

<a id="target-padichodgeregulators-l3-gamma-leading-factor"></a>

### Leading Gamma factor

Target `PadicHodgeRegulators:L3/gamma-leading-factor` · declaration `gammaLeadingFactor`.

**Hypotheses.** E has characteristic zero.

For j in Z define Gamma*(1+j)=j! if j>=0 and (-1)^(-j-1)/(-j-1)! if j<=-1, as a nonzero rational number, then map it into E. This is the leading Laurent coefficient of the classical Gamma function; it is not the p-adic Gamma function.

**Uses.** LZ Theorem B.5 and RJ Theorem I.27: Normalize interpolation in both weight ranges.

**API.**

| Name | Contract |
| --- | --- |
| `gammaLeadingFactor_nonneg` | For n in N its value at j=n is n!. |
| `gammaLeadingFactor_neg` | Its value at j=-n-1 is (-1)^n/n!. |
| `gammaLeadingFactor_ne_zero` | It is nonzero for every integral j. |

**Discriminating tests.**

- `gamma_zero` (degenerate): At j=0 the factor is 1.
- `gamma_minus_two` (computation): At j=-2 it is -1.
- `gamma_minus_three` (computation): At j=-3 it is 1/2, not 2.

**Check.**

- At j=-1 the factor is +1, at j=-2 it is -1.

**Construction or proof route.**

1. Define the two integer ranges using factorials; cast the rational factor to E.

**Dependencies.** .

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Appendix B before Proposition B.1, PDF p.37: Fixes both the sign and factorial at negative integers.

<a id="target-padichodgeregulators-l3-logarithmic-factors"></a>

### Logarithmic factors

Target `PadicHodgeRegulators:L3/logarithmic-factors` · declaration `logarithmicFactors`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly.

In each H_E(Gamma_1) component set ell_i=log(1+X)/log(chi(gamma))-i for i in Z, lambda_k=product_(0<=i<k) ell_i for k>=0, and delta_i=ell_i/(X+1-chi(gamma)^i). The apparent pole of delta_i is removable at x_i=chi(gamma)^i-1; its value there is 1/(chi(gamma)^i log(chi(gamma))). Put n_k=log(chi(gamma))^k lambda_k/product_(0<=i<k)(X-x_i).

**Uses.** LLZ Theorems 2.10,4.6,4.16: Record precisely the analytic determinant factors.; LZ Appendix B and general twist extension: Control auxiliary weights and their zeros.

**API.**

| Name | Contract |
| --- | --- |
| `ellFactor_eval_weight` | ell_i(chi^j eta)=j-i for any finite-order eta on Gamma_1. |
| `lambdaFactor_succ` | lambda_(k+1)=lambda_k ell_k, lambda_0=1. |
| `deltaFactor_cleared` | (X-x_i)delta_i=ell_i, including the removable point. |
| `ellFactor_generator` | log(gamma)/log(chi(gamma)) is independent of the chosen topological generator under the group-algebra change of variable. |

**Discriminating tests.**

- `ell_at_zero` (computation): ell_0 at the trivial character is 0, whereas ell_1 there is -1.
- `delta_at_node` (computation): delta_0 at X=0 is 1/log(chi(gamma)), not zero or an undefined inverse.
- `lambda_empty` (degenerate): lambda_0=n_0=1; lambda_2 at chi^3 is 6.

**Check.**

- delta_i(x_i) is a nonzero scalar; ell_i is not a unit because it vanishes at every chi^i finite-order twist.

**Construction or proof route.**

1. Use convergent open-disc logarithms from the analytic supplier. Divide the simple zero at x_i in the analytic algebra, retaining the removable value. The empty products are one.

**Dependencies.** [LocallyAnalyticDistributions:L1](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/unbounded-component-mellin](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/bounded-mellin-characterisation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-character-evaluation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-convolution](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-generator-change](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-weight-derivative](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-twist](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-pushforward](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-coefficient-extension](LocallyAnalyticDistributions.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md), [LocallyAnalyticDistributions:L1/amice-transform](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L1/division-on-units](LocallyAnalyticDistributions.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 1C2, definitions of ell_i, delta_i and n_k and Proposition 1.6, pp.1101-1102; Section 2A, p.1107; Theorem 4.16, p.1124: Reconciles n_k with lambda_k and the normalized delta_i, up to the displayed nonzero constant.

<a id="target-padichodgeregulators-l3-crystalline-regulator"></a>

### Crystalline Perrin–Riou regulator

Target `PadicHodgeRegulators:L3/crystalline-regulator` · declaration `crystallineRegulator`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution.

Define L_V=(Mellin_inverse tensor 1) composed with (1-phi) composed with h_Iw^(-1), from H^1_Iw(Q_p,V) to H_E(G) tensor_E D_cris(V). Here h_Iw:N(V)^(psi=1)~=H^1_Iw is the actual PG/L2 comparison, and the Wach embedding takes (1-phi)x into (B_rig^+)^(psi=0) tensor D_cris(V). This is a Lambda_E-linear continuous map; its analytic scalar extension is H_E-linear.

**Uses.** GeneralizedHeegnerCycles:GH.4 and GH.7; KatoEulerSystems:L3; RankZeroOneBSD:BSD.6a and BSD.7a: The vector map is the local output to pair with a specified period functional.; LLZ Section3: Supply the unbounded side of the bounded decomposition.

**API.**

| Name | Contract |
| --- | --- |
| `crystallineRegulator_apply` | Mellin(L_V(z))=(1-phi)h_Iw^(-1)(z) in the specified period module. |
| `crystallineRegulator_linear` | L_V(a z+b w)=a L_V(z)+b L_V(w) for a,b in Lambda_E, acting by convolution. |
| `crystallineRegulator_ext` | The Mellin identity determines the map uniquely. |
| `crystallineRegulator_coefficient` | The map commutes with finite coefficient extension using the supplier comparison squares. |

**Discriminating tests.**

- `regulator_zero` (degenerate): The zero Iwasawa class has zero regulator.
- `regulator_phi_fixed` (computation): An actual phi-fixed psi-one class is killed by 1-phi; for E(1) this kills the Kummer Tate tower.
- `regulator_composition_order` (computation): In the finite linear-map model h(x)=2x, boundary(x)=3x, Mellin_inverse(x)=5x, L(2)=15; using h instead of h inverse would give 60.

**Check.**

- Do not identify an arbitrary linear map of the same rank with this composite. The no-trivial-quotient assumption is not deleted.

**Construction or proof route.**

1. Berger A.3 places the genuine Iwasawa class in N(V)^(psi=1). LLZ Lemma1.7 gives N(V) subset phi*N(V) in the stated weight range.
2. The left inverse psi phi=id proves psi((1-phi)x)=0. Apply the actual Wach-to-period embedding and the Mellin module equivalence; Mellin respects the G action, rather than ordinary power-series multiplication.

**Dependencies.** [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/wach-psi-fixed-vectors](#target-padichodgeregulators-l2-wach-psi-fixed-vectors), [PhiGammaModulesAndIwasawaCohomology:PG.4/psi-one-to-zero](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-module](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-existence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-height](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-dcris](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-good-basis](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-iwasawa](PhiGammaModulesAndIwasawaCohomology.md), [LocallyAnalyticDistributions:L3/unbounded-component-mellin](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/bounded-mellin-characterisation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-character-evaluation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-convolution](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-generator-change](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-weight-derivative](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-twist](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-pushforward](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-coefficient-extension](LocallyAnalyticDistributions.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/integral-iwasawa-comparison](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/iwasawa-functoriality](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/finite-character-specialization](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/analytic-iwasawa](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 3A, Definition 3.4, pp.1116-1117: The intrinsic map precedes all scalar and basis choices.

<a id="target-padichodgeregulators-l3-big-exponential-obstruction"></a>

### Derivative obstruction module

Target `PadicHodgeRegulators:L3/big-exponential-obstruction` · declaration `bigExponentialObstruction`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is crystalline; h>=1 and Fil^(-h)D_cris(V)=D_cris(V).

For h>=1 with Fil^(-h)D_cris(V)=D_cris(V), define Delta_h on (B_rig^+)^(psi=0) tensor D_cris(V) by the derivative values partial^k f(0) modulo (1-p^k phi)D_cris(V), 0<=k<=h, with their k twists. The admissible source is ker Delta_h. The kernel of 1-phi on the psi-one period module is direct_sum_(0<=k<=h)t^k D_cris(V)^(phi=p^(-k)).

**Uses.** Berger Definition II.12: Use the exact source of the big exponential.; L3 singular specializations: Express the kernel instead of a total inverse.

**API.**

| Name | Contract |
| --- | --- |
| `bigExponentialObstruction_mem` | f is admissible iff partial^k f(0) lies in image(1-p^k phi) for every indicated k. |
| `bigExponentialObstruction_nonsingular` | If all these Euler maps are invertible, Delta_h=0 and its kernel is the whole source. |
| `bigExponentialObstruction_lift` | An admissible f has a psi-one lift y with (1-phi)y=f; any two lifts differ in the displayed kernel. |

**Discriminating tests.**

- `obstruction_phi_one` (non-example): For rank-one phi=1, k=0 forces f(0)=0, so a nonzero constant derivative is inadmissible.
- `obstruction_nonsingular` (characterisation): For phi=2 over Q_5 and h=1, both 1-2 and 1-10 are invertible; no derivative obstruction remains.
- `obstruction_lift_nonunique` (non-example): At phi=1 two lifts differing by a constant have the same boundary; no unique inverse is inferred.

**Check.**

- Derivative values belong to quotients, not chosen complements.

**Construction or proof route.**

1. Form the actual quotient of D_cris by the image of each Euler endomorphism and the finite derivative map. Prove Berger p.120 exact sequence, rather than infer surjectivity of 1-phi from psi phi=id.

**Dependencies.** [PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions](#target-padichodgeregulators-l0-hodge-tate-and-twist-conventions), [PhiGammaModulesAndIwasawaCohomology:PG.4](PhiGammaModulesAndIwasawaCohomology.md), [LocallyAnalyticDistributions:L1](LocallyAnalyticDistributions.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-psi](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md), [LocallyAnalyticDistributions:L1/amice-transform](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L1/division-on-units](LocallyAnalyticDistributions.md).

**Sources.** [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Section II.5, exact sequence and Definition II.12, p.120: Records the obstruction that prevents inverses at singular eigenvalues.

<a id="target-padichodgeregulators-l3-big-exponential"></a>

### Perrin–Riou big exponential

Target `PadicHodgeRegulators:L3/big-exponential` · declaration `bigExponential`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; h>=1 with Fil^(-h) full; the source is ker Delta_h, not an arbitrary period vector.

For admissible f in ker Delta_h choose a psi-one lift y with (1-phi)y=f and define Omega_(V,h)(f)=nabla_(h-1)...nabla_0(y), with nabla_i=t partial-i. Its value is well-defined in D_rig^+(V)^(psi=1)/V^(H_Qp). The eigencondition D_cris(V)^(phi=p^(-h))=0 suffices for an unquotiented value (Definition II.12). More generally, absence of an E(h) subrepresentation suffices by Remark II.14, after using Theorem II.13 to identify the remaining lift ambiguity with invariants. Map to H_E tensor_Lambda H^1_Iw using the established comparison.

**Uses.** Berger TheoremII.10 and II.16: Interpolate and pair the big exponential.; LLZ Theorem4.6: Compare it with the intrinsic regulator.

**API.**

| Name | Contract |
| --- | --- |
| `bigExponential_lift` | Every valid lift gives the stated differential product in the quotient. |
| `bigExponential_linear` | Omega_(V,h) is H_E-linear in the specified Mellin convention. |
| `bigExponential_no_tate` | If no E(h) lies in V, the differential lift is independent in the unquotiented psi-one module. |
| `bigExponential_h_succ` | nabla_h Omega_(V,h)=Omega_(V,h+1) with the natural obstruction-source comparison. |

**Discriminating tests.**

- `bigexp_zero` (degenerate): Omega_(V,h)(0)=0 in the quotient.
- `bigexp_kernel_killed` (computation): For a lift difference t^k v with 0<=k<h, the differential product is zero.
- `bigexp_top_kernel` (non-example): For k=h the product is h! t^h v, nonzero before passing to invariants; the quotient cannot be dropped.

**Check.**

- A chosen inverse of 1-phi is not the definition.

**Construction or proof route.**

1. The kernel of 1-phi consists of the t^k eigenvectors just recorded. nabla_(h-1)...nabla_0 kills those with k<h. The surviving k=h vectors represent E(h) invariants and vanish in the target quotient.
2. Apply Berger TheoremII.13 and its h/gamma-normalized comparison with Iwasawa cohomology.

**Dependencies.** [PadicHodgeRegulators:L3/big-exponential-obstruction](#target-padichodgeregulators-l3-big-exponential-obstruction), [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L3/logarithmic-factors](#target-padichodgeregulators-l3-logarithmic-factors).

**Sources.** [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Definition II.12, Theorem II.13 and Remark II.14, pp.120-121: The invariant quotient is essential in the exceptional case.

<a id="target-padichodgeregulators-l3-auxiliary-h-comparison"></a>

### Auxiliary weight and twist comparison

Target `PadicHodgeRegulators:L3/auxiliary-h-comparison` · declaration `bigExponential_regulator`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked. Choose h>=max(1,r_d); interpret equalities in the analytic scalar extension and its localization.

Under the nonnegative, no-trivial-quotient hypotheses and the nonsingular Euler assumptions of LLZ4.5, over Frac(H_E) one has Omega_(V,h) L_V(z)=lambda_h z after identifying its Mellin source, for any admitted h>=1. Omega_(V,h+1)=ell_h Omega_(V,h); twisting sends Omega_(V,h)(f) tensor e_j to Omega_(V(j),h+j)(partial^(-j)f tensor t^(-j)e_j), on the common domain. Thus the intrinsic L_V is independent of h.

**Check.**

- h=0/r_d=0 is compared using h=1 and localization, never a nonexistent unqualified inverse.

**Construction or proof route.**

1. Unfold Berger differential lift and (1-phi)h_Iw inverse; their composite yields lambda_h. Use RemarkII.15 for h and twist laws. Specializing when ell_h vanishes does not permit division.

**Dependencies.** [PadicHodgeRegulators:L3/big-exponential](#target-padichodgeregulators-l3-big-exponential), [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L3/logarithmic-factors](#target-padichodgeregulators-l3-logarithmic-factors).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Theorem4.6, p.1120: Its inverse notation is interpreted only after analytic localization.; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), RemarkII.15, p.121: Provides the admitted h and twist identities.

<a id="target-padichodgeregulators-l3-meromorphic-twist-extension"></a>

### Crystalline twist extension

Target `PadicHodgeRegulators:L3/meromorphic-twist-extension` · declaration `meromorphicRegulator`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; use an admitted m and the actual twist comparison maps.

For arbitrary E-linear crystalline V choose m>>0 so V(m) has nonnegative weights and no trivial quotient. Define L_V(z)=(ell_-1...ell_-m)^(-1) Tw_(chi^m)(L_(V(m))(z tensor e_m)) tensor t^m e_-m. The value lies in the total fraction algebra of H_E(G), component by component; it is independent of m. No general H_E-valued assertion follows without proving cancellation of these factors.

**Uses.** LZ explicit reciprocity with V*(1): Permit negative dual weights in the exact fractional algebra.; General crystalline weights: Expose the extra cancellation assertion an H-valued extension would require.

**API.**

| Name | Contract |
| --- | --- |
| `meromorphicRegulator_choice` | The value is independent of every admitted twist m. |
| `meromorphicRegulator_cleared` | Multiplication by ell_-1...ell_-m gives the stated twisted positive-range map. |
| `meromorphicRegulator_positive` | For V in the intrinsic range it equals L_V after localization. |

**Discriminating tests.**

- `twist_extension_identity` (degenerate): An admitted m=0 recovers the intrinsic positive-range regulator.
- `twist_extension_one_step` (compatibility): The m=1 and m=2 formulas agree by the one-step ell_-2 relation.
- `twist_extension_pole_control` (non-example): In a scalar analytic model a nonzero numerator at the zero of ell_-1 gives a pole, so localization alone is not an H-valued result.

**Check.**

- Unrestricted negative weights are not silently assigned the positive-range codomain.

**Construction or proof route.**

1. Use LZ4.4 and the one-step twisting relation to compare m with m+1; telescope the denominator factors. Localize at their nonzero-divisors.

**Dependencies.** [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L3/auxiliary-h-comparison](#target-padichodgeregulators-l3-auxiliary-h-comparison), [PadicHodgeRegulators:L3/logarithmic-factors](#target-padichodgeregulators-l3-logarithmic-factors), [PadicHodgeRegulators:L2/local-iwasawa-twist](#target-padichodgeregulators-l2-local-iwasawa-twist), [PadicHodgeRegulators:L2/twist-compatibility](#target-padichodgeregulators-l2-twist-compatibility).

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Section4.4 and AppendixB equation(10), pp.21,39: The printed arbitrary-weight extension explicitly has a fractional target.

<a id="target-padichodgeregulators-l3-ramified-interpolation"></a>

### Ramified character interpolation

Target `PadicHodgeRegulators:L3/ramified-interpolation` · declaration `crystallineRegulator_ramified`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. z lies in the analytic Wach psi-one image (dagger of LZ AppendixB); in particular every z in the stated intrinsic range does. The Gauss sum uses the chosen roots and omega, not omega inverse.

Let eta=chi^j omega, j in Z, omega finite order of conductor p^n, n>=1; extend coefficients to contain omega. Write z_(eta,0) for the actual specialization in H^1(Q_p,V(eta^(-1))). Then L_V(z)(eta)=Gamma*(1+j) tau(omega)^(-1) p^(n(1+j)) phi^n (B_(j)(z_(eta,0)) tensor t^(-j)e_j), with the finite-character de Rham descent understood. B_j=exp*_(Q_p,V(eta^(-1))*(1)) for j>=0 and the Bloch–Kato logarithm on the finite part for j<=-1. The log is the inverse of exp only on its isomorphism range; source condition (dagger) supplies the finite-part class for this formula.

**Check.**

- Check Gamma*(0)=1 and conductor power n(j+1); a formula valid only for j>=0 does not cover the target.

**Construction or proof route.**

1. LZ B.1 expresses the BK maps by p^-n times constant coefficients of phi^-n partial^j x. B.2 applies the unnormalized omega^-1 trace and identifies it with tau(omega)phi^-n times evaluation.
2. Use B.4 descent and the Tate factor phi^n(t^j e_-j)=p^(nj)t^j e_-j. Combine to obtain B.5, retaining (dagger) and the logarithm domain.

**Dependencies.** [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L3/gamma-leading-factor](#target-padichodgeregulators-l3-gamma-leading-factor), [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:L1/dual-exponential](#target-padichodgeregulators-l1-dual-exponential), [PadicHodgeRegulators:L1/twist-and-change-of-field](#target-padichodgeregulators-l1-twist-and-change-of-field), [PadicHodgeRegulators:L2/character-specialisation](#target-padichodgeregulators-l2-character-specialisation).

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), AppendixB PropositionsB.1-B.2, LemmaB.4 and TheoremB.5, pp.36-39: Covers every integral twist for ramified finite characters in the crystalline range.

<a id="target-padichodgeregulators-l3-unramified-interpolation"></a>

### Unramified character interpolation

Target `PadicHodgeRegulators:L3/unramified-interpolation` · declaration `crystallineRegulator_unramified`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The same Wach-image condition (dagger) holds; B_j is bijective; for the negative range retain the actual finite-class logarithm domain.

For eta=chi^j and j in Z put A_j=1-p^j phi and B_j=1-p^(-1-j)phi^(-1) on D_cris(V). If B_j is invertible then L_V(z)(chi^j)=Gamma*(1+j) A_j B_j^(-1) b_j(z_(chi^j,0)), where b_j is the exp*/log value with its Tate descent from the preceding theorem. No invertibility of A_j is required for this direction.

**Check.**

- When phi=1,j=0, A_j=0 while B_j=1-p^-1 is invertible; a vanishing specialization is valid.

**Construction or proof route.**

1. Apply LZ B.1 at n=0 and B.2 at the origin. The commuting Euler polynomials give the stated product; invert B_j only using its explicit bijectivity hypothesis.

**Dependencies.** [PadicHodgeRegulators:L3/ramified-interpolation](#target-padichodgeregulators-l3-ramified-interpolation), [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:L1/dual-exponential](#target-padichodgeregulators-l1-dual-exponential).

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), AppendixB TheoremB.5 and the parenthesis immediately following it, pp.39-40: The excluded operator is B_j; A_j can have a kernel.

<a id="target-padichodgeregulators-l3-singular-euler-specialization"></a>

### Specialization with singular Euler operators

Target `PadicHodgeRegulators:L3/singular-euler-specialization` · declaration `crystallineRegulator_singular`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. Use b_j and the negative-weight log on precisely the domains in ramified-interpolation.

For every integral j under (dagger), with no Euler invertibility assumption, B_j L_V(z)(chi^j)=Gamma*(1+j) A_j b_j(z_(chi^j,0)). More precisely, if u_j is the constant coefficient of partial^j h_Iw^(-1)(z) after Tate descent, the unsimplified identities are L_V(z)(chi^j)=A_j u_j and B_j u_j=Gamma*(1+j)b_j. They determine a relation, including the image of A_j(ker B_j); replacing B_j^(-1) by a total inverse is not a formula. For the big-exponential inverse keep ker Delta_h and the invariant quotient.

**Check.**

- For rank-one phi=p^(-1),j=0, B_j=0 and A_j=1-p^-1; the cleared equality gives no unique output. An exceptional derivative formula requires separate input.

**Construction or proof route.**

1. Retain the constant coefficient before any division in LZ B.1-B.2 at n=0; compose the two commuting Euler maps.
2. If B_j is singular, two lifts differ by ker B_j and the corresponding outputs differ by A_j of that kernel. The authentic period lift fixes this value; BK data alone need not determine it.

**Dependencies.** [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L3/big-exponential-obstruction](#target-padichodgeregulators-l3-big-exponential-obstruction), [PadicHodgeRegulators:L3/big-exponential](#target-padichodgeregulators-l3-big-exponential), [PadicHodgeRegulators:L3/ramified-interpolation](#target-padichodgeregulators-l3-ramified-interpolation).

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), AppendixB PropositionsB.1-B.2, pp.37-38: A denominator-free consequence of the two source equalities, not an invented inverse.; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), SectionII.5 exact sequence, p.120: Keeps the obstruction and invariant data in the general inverse problem.

<a id="target-padichodgeregulators-l3-growth"></a>

### Regulator growth on Frobenius quotients

Target `PadicHodgeRegulators:L3/growth` · declaration `crystallineRegulator_growth`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. W is phi-stable; h is a nonnegative real number and the slope bound holds on Q.

Let W subset D_cris(V) be phi-stable and h>=0. If every phi eigenvalue on Q=D_cris(V)/W has v_p(alpha)>=-h, the projection of L_V(z) to Q belongs to distributions of order h on the cyclotomic group, with the LAD C^h-dual convention. In particular take h=max(0,-min v_p(alpha)). State the seminorm bound on each finite-character component; no universal bounded (order zero) assertion is made.

**Check.**

- A slope -1 gives order 1, not a bounded measure; a scalar projection inherits a slope bound only from its admitted quotient.

**Construction or proof route.**

1. LZ Proposition4.8 reduces to the one-variable growth statement. Prove the coefficient/annulus estimate for the actual Wach inclusion and phi iterates, then transfer it by Mellin to the requested C^h-dual norm. The one-variable estimate must be established, not assumed because LZ calls it well known.

**Dependencies.** [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [LocallyAnalyticDistributions:L2](LocallyAnalyticDistributions.md), [PhiGammaModulesAndIwasawaCohomology:PG.6](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-module](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-existence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-height](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-dcris](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-good-basis](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-iwasawa](PhiGammaModulesAndIwasawaCohomology.md), [LocallyAnalyticDistributions:L2/order-r-distributions](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/amice-velu-vishik](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/locally-algebraic-determination](LocallyAnalyticDistributions.md).

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Proposition4.8 and AppendixC, pp.17,41-43: Specializes the cyclotomic growth bound from the stated Frobenius quotient.

<a id="target-padichodgeregulators-l3-naturality-and-lattice"></a>

### Regulator naturality and integral lattice

Target `PadicHodgeRegulators:L3/naturality-and-lattice` · declaration `crystallineRegulator_naturality`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. For lattice statements use an integral good psi-zero basis; coefficient extension is finite and flat, and all cohomological base-change hypotheses are supplied by L2.

For finite E extensions and equivariant morphisms of crystalline representations in the intrinsic range, L commutes with the actual D_cris and Iwasawa comparison maps. For a G-stable T its image lies in the Mellin inverse of (phi*N(T))^(psi=0) embedded in the analytic period target. It need not lie in Lambda_O tensor an arbitrary D_cris lattice. Changing gamma only changes X by (1+X)^a-1; changing roots zeta to sigma_a zeta multiplies the regulator distribution by [sigma_a]^(-1). These assertions compose and respect identities.

**Check.**

- Test a root change by a, then b, obtaining [sigma_ab]^-1, and distinguish it from multiplying by [sigma_a].

**Construction or proof route.**

1. Check the actual h_Iw, Wach embedding, phi/psi and Mellin squares individually. Integral (1-phi) preserves the phi* lattice. Basis coordinates are integral, while the embedding matrix is analytic.
2. Use LZ Remark4.16 for roots and the chart homomorphism for generators. Do not use PG.7 as blanket base change for arbitrary families.

**Dependencies.** [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L4/good-wach-basis](#target-padichodgeregulators-l4-good-wach-basis), [PadicHodgeRegulators:L2/lattice-and-coefficient-squares](#target-padichodgeregulators-l2-lattice-and-coefficient-squares), [PadicHodgeRegulators:L2/generator-independence](#target-padichodgeregulators-l2-generator-independence), [PadicHodgeRegulators:L2/root-change](#target-padichodgeregulators-l2-root-change), [LocallyAnalyticDistributions:L3/unbounded-component-mellin](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/bounded-mellin-characterisation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-character-evaluation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-convolution](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-generator-change](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-weight-derivative](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-twist](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-pushforward](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-coefficient-extension](LocallyAnalyticDistributions.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section3A, pp.1116-1117: Identifies the precise integral source and target lattice.; [LZ2014](https://arxiv.org/pdf/1108.5954v3), Remark4.16, p.20: Fixes the inverse group element in the root-change law.

<a id="target-padichodgeregulators-l3-explicit-reciprocity"></a>

### Perrin–Riou explicit reciprocity formula

Target `PadicHodgeRegulators:L3/explicit-reciprocity` · declaration `crystallineRegulator_reciprocity`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; x,y are actual Iwasawa classes and the pairings are the L2/L1 local-duality pairings with these normalizations.

With the crystalline pairing extended linearly in the first and via iota(g)=g^-1 in the second variable, [L_V(x),L_(V*(1))(y)]_cris=-sigma_-1 ell_0 <x,y>_Iw in the total fraction algebra of H_E(G). sigma_-1 is the inertia element with chi=-1; the dual regulator uses the admitted meromorphic twist extension. Equivalently Berger II.16 states (-1)^h <Omega_(V,h)(f),[-1]Omega_(V*(1),1-h)(g)>=-[f,iota(g)].

**Check.**

- Changing the second variable by g multiplies the pairing by g^-1.

**Construction or proof route.**

1. Use BergerII.16 with its sign warningII.17, or LZ B.6 proof: specialize at sufficiently large integral j, cancel the factorial and adjoint Euler factors using BK local duality, then use analytic uniqueness from LAD.
2. Extend the dual regulator by LZ equation(10). Semilinearity and sigma_-1 account for the sign; omit neither.

**Dependencies.** [PadicHodgeRegulators:L3/meromorphic-twist-extension](#target-padichodgeregulators-l3-meromorphic-twist-extension), [PadicHodgeRegulators:L3/big-exponential](#target-padichodgeregulators-l3-big-exponential), [PadicHodgeRegulators:L3/logarithmic-factors](#target-padichodgeregulators-l3-logarithmic-factors), [PadicHodgeRegulators:L1/dual-exponential](#target-padichodgeregulators-l1-dual-exponential), [PadicHodgeRegulators:L1/local-duality-of-conditions](#target-padichodgeregulators-l1-local-duality-of-conditions), [PadicHodgeRegulators:L1/twist-and-change-of-field](#target-padichodgeregulators-l1-twist-and-change-of-field), [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/local-iwasawa-twist](#target-padichodgeregulators-l2-local-iwasawa-twist), [PadicHodgeRegulators:L2/character-specialisation](#target-padichodgeregulators-l2-character-specialisation), [PadicHodgeRegulators:L3/unramified-interpolation](#target-padichodgeregulators-l3-unramified-interpolation), [PhiGammaModulesAndIwasawaCohomology:PG.5/iwasawa-pairing](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), AppendixB equation(10) and TheoremB.6, pp.39-40: Provides the exact regulator pairing normalization.; [Berger2003DM](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), TheoremII.16 and RemarkII.17, pp.122-123: Cross-checks the sign against the actual big-exponential pairing.

<a id="target-padichodgeregulators-l3-regulator-determinant"></a>

### Determinant of the crystalline regulator

Target `PadicHodgeRegulators:L3/regulator-determinant` · declaration `crystallineRegulator_determinant`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

Under NC, for each Delta component the determinant ideal of the H_E-linear scalar extension of L_V, with actual rank-d Iwasawa source, is generated up to H_E-unit by product_(i=0..r_d-1) ell_i^(d-n_i), where n_i=dim_E Fil^(-i)D_cris(V)=#{j:r_j<=i}. The determinant is an ideal in the analytic algebra, not a chosen equality of basis determinants.

**Check.**

- Weights (0,2) give ell_0 ell_1, whereas (1,1) give ell_0^2; these cases discriminate a rank-only formula.

**Construction or proof route.**

1. LLZ4.7 derives this from det Omega_(V,r_d)=product ell_i^n_i (Perrin–Riou delta(V) theorem), itself obtained from reciprocity and the determinant comparison of dual cohomology.
2. Record the exact determinant comparison input as a gap; a scalar-valued pairing identity alone is not a proof of its integral determinant normalization.

**Dependencies.** [PadicHodgeRegulators:L3/auxiliary-h-comparison](#target-padichodgeregulators-l3-auxiliary-h-comparison), [PadicHodgeRegulators:L3/explicit-reciprocity](#target-padichodgeregulators-l3-explicit-reciprocity), [PadicHodgeRegulators:L3/logarithmic-factors](#target-padichodgeregulators-l3-logarithmic-factors), [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/lattice-and-coefficient-squares](#target-padichodgeregulators-l2-lattice-and-coefficient-squares), [PadicMeasuresIwasawaAlgebras:L5](PadicMeasuresIwasawaAlgebras.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/iwasawa-pairing](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Corollary4.7 and proof, p.1120: Gives the exponent and identifies the additional determinant theorem used.

<a id="target-padichodgeregulators-l3-scalar-projection"></a>

### Scalar projection of a regulator

Target `PadicHodgeRegulators:L3/scalar-projection` · declaration `scalarRegulator`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. ell is specified, including every period scalar when it is derived from a geometric differential.

Given an explicitly chosen E-linear functional ell:D_cris(V)->E, define scalarRegulator_(V,ell)=(1 tensor ell) L_V. A differential or refinement supplies ell only after its pairing and period normalization are proved. The vector regulator is canonical with its cyclotomic choices; this scalar projection is not chosen from V alone.

**Uses.** GeneralizedHeegnerCycles:GH.7; KatoEulerSystems:L3; RankZeroOneBSD:BSD.7a: Record the extra period/differential data that arithmetic consumers must supply.

**API.**

| Name | Contract |
| --- | --- |
| `scalarRegulator_apply` | The output is (1 tensor ell)(L_V(z)). |
| `scalarRegulator_add_functional` | Projection for ell1+ell2 is the sum of the two projections; scaling ell scales the output. |
| `scalarRegulator_base_change` | Finite coefficient extension commutes after transporting ell. |
| `scalarRegulator_growth` | The vector seminorm bound gives the projected bound times the functional norm; a stronger eigenline bound needs the specified phi-stable quotient. |

**Discriminating tests.**

- `scalar_zero_functional` (degenerate): The zero functional gives the zero map.
- `scalar_ordered_projection` (computation): For vector (2,3), first projection gives 2 and second gives 3.
- `scalar_period_scaling` (computation): Replacing a functional by twice itself doubles every value; it cannot be silently treated as the same normalized scalar regulator.

**Check.**

- Two nonproportional functionals can give different scalar outputs for the same class.

**Construction or proof route.**

1. Apply the actual tensor-product linear map to the vector regulator; coefficient extension transports both the map and the functional.

**Dependencies.** [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), `mathlib:TensorProduct.map`, `mathlib:TensorProduct.rid`.

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section3 equation(2), p.1117; Section1C6 modular bases: Source coordinates become scalar only in an explicitly chosen basis; the functional formulation is the invariant deduction.

<a id="target-padichodgeregulators-l3-tate-coleman-comparison"></a>

### Rank-one Tate and Coleman comparison

Target `PadicHodgeRegulators:L3/tate-coleman-comparison` · declaration `tateRegulator_coleman`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V=E(1), u lies in the actual principal inverse-limit unit module; use the same roots, norm operator, Kummer cocycle and Tate basis.

For V=E(1), d=t^-1 e_1 and principal norm-compatible cyclotomic units u, the actual Kummer map satisfies L_(E(1))(kappa_Iw(u))=ell_0 Col_0(u) tensor d=-ell_0 Col(u) tensor d. Col_0 is exactly the raw ColemanPowerSeries composite and Col=-Col_0. Equivalently Mellin(Col_0(u))=(1-phi/p)log(f_u) and partial of this equals (1-phi)Delta(f_u). On psi-zero partial inverse is multiplication by x^-1 under Amice; no integration constant is chosen. The regulator kills the Tate-root tower and the coefficient-extended fundamental Coleman sequence gives the moment cokernel.

**Check.**

- Test the roots-of-unity kernel and distinguish ell_0 Col_0 from either Col_0 alone or +ell_0 Col.

**Construction or proof route.**

1. Use the commuting Kummer/Coleman diagram of LZ6.4.2. Differentiate its (1-phi/p)log(f_u), use partial phi=p phi partial, and compare it with the exact imported raw map.
2. The Mellin relation t partial corresponds to ell_0, giving the multiplier; the imported sign-adjusted map introduces the minus sign. Match Kummer to h_Iw using the L2 comparison, not a rank argument.

**Dependencies.** [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L3/logarithmic-factors](#target-padichodgeregulators-l3-logarithmic-factors), [PadicHodgeRegulators:L2/kummer-coleman-comparison](#target-padichodgeregulators-l2-kummer-coleman-comparison), [PadicHodgeRegulators:L2/root-change](#target-padichodgeregulators-l2-root-change), [ColemanPowerSeries:L2/raw-coleman-map](ColemanPowerSeries.md), [ColemanPowerSeries:L2/normalized-coleman-map](ColemanPowerSeries.md), [ColemanPowerSeries:L3/principal-coleman-sequence](ColemanPowerSeries.md), [ColemanPowerSeries:L3/finite-flat-coleman-sequence](ColemanPowerSeries.md), [PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence](PadicMeasuresIwasawaAlgebras.md).

**Sources.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Section6.4.2 diagram and text, pp.28-29: States the actual multiplier in the rank-one regulator/Coleman square.

<a id="target-padichodgeregulators-l3-rubin-coleman-map"></a>

### Ordinary and multiplicative Coleman map

Target `PadicHodgeRegulators:L3/rubin-coleman-map` · declaration `rubinColemanMap`.

**Hypotheses.** p is odd; A has the stated reduction; use Rubin cyclotomic Z_p-extension indexing Q_n and compatible p-power roots. omega_A is the specified Neron differential; local finite quotients and integral H^1_s are inherited from L1/Selmer.

For an elliptic curve A/Q with good ordinary or multiplicative reduction at odd p, T=T_p A, let alpha in Z_p^times be the ordinary root and beta=p/alpha. In split multiplicative reduction set (alpha,beta)=(1,p), in nonsplit (-1,-p). On the actual inverse-corestriction singular quotients H^1_(infty,s)(Q_p,T) define Col_infty into Lambda(Z_p-extension) with its injection and Rubin III.5.14 normalization. For nontrivial finite chi of conductor p^k its value is alpha^-k tau(chi) sum_(g in G_n)chi(g)^-1 exp*_(omega_A)(g z_n). At chi=1 it is (1-alpha^-1)(1-beta^-1)^-1 exp*_(omega_A)(z_0).

**Uses.** Rubin III.5.15 and supplied source extraction r3-prop-5.14-b: Provides the construction consumed by the noncrystalline augmentation assertion.

**API.**

| Name | Contract |
| --- | --- |
| `rubinColemanMap_specialization` | Finite-character values are exactly the displayed Gauss-sum/differential formulas. |
| `rubinColemanMap_injective` | Its kernel on the singular inverse-limit module is zero. |
| `rubinColemanMap_linear` | It is Lambda-linear on that actual source. |
| `rubinColemanMap_period` | Rescaling the differential by c rescales its scalar dual-exponential coordinate by c^-1, and hence the map by c^-1. |

**Discriminating tests.**

- `rubin_zero` (degenerate): Col_infty(0)=0.
- `rubin_split_trivial` (computation): At split multiplicative alpha=1 the trivial specialization is zero.
- `rubin_nonsplit_trivial` (computation): At p=5 and alpha=-1,beta=-5 the trivial Euler multiplier is 5/3, so it is not automatically zero.

**Check.**

- The ramified exponent uses the conductor k, not the chosen level n; the unramified denominator 1-beta^-1 is nonzero in the stated cases.

**Construction or proof route.**

1. Construct via the ordinary/multiplicative rank-one local duality and formal-group Coleman series, with integral singular quotient descent. Rubin cites the appendix of Rubin1998 for this explicit construction; that proof input is recorded as a gap, not replaced by interpolation as an axiom.
2. Verify the displayed finite-character identities and injection on the actual singular inverse limit. Characters determine bounded outputs using the correct uniqueness theorem.

**Dependencies.** [PadicHodgeRegulators:L1/bloch-kato-subgroups](#target-padichodgeregulators-l1-bloch-kato-subgroups), [PadicHodgeRegulators:L1/dual-exponential](#target-padichodgeregulators-l1-dual-exponential), [PadicHodgeRegulators:L2/character-specialisation](#target-padichodgeregulators-l2-character-specialisation), [SelmerIwasawaCohomology:L3](SelmerIwasawaCohomology.md), [PadicHodgeRegulators:L3/tate-coleman-comparison](#target-padichodgeregulators-l3-tate-coleman-comparison).

**Sources.** [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), III Section5.8, Proposition5.14, printed p.52: The supplied URL is Rubin’s book, not Kolyvagin1990; it states containment rather than equality in the split case.
<a id="stage-l4"></a>

## L4 — Wach coordinates, images and de Rham extensions

Use good Wach bases imported from PG.6, then define coordinate maps and transport period subspaces into coefficient coordinates. Over the bounded algebra use O_E[[X]][1/ϖ], rather than E[[X]]. Equality after analytic scalar extension does not prove bounded image equality. General de Rham Robba modules retain their admitted conductor-sensitive character domains and their independent exponential comparison.

**Planets:** Coleman coordinate map; Logarithmic matrix; Coleman map image theorem; Integral Coleman image theorem; De Rham character domain; De Rham regulator.

<a id="target-padichodgeregulators-l4-evaluation-constraints"></a>

### Specialization-constraint module

Target `PadicHodgeRegulators:L4/evaluation-constraints` · declaration `evaluationConstraints`.

**Hypotheses.** E is a field and R a commutative E-algebra; ev_j are E-algebra homomorphisms; V_j are E-subspaces. No domain, distinctness or divisibility assumption is needed just to define S.

For a finite set J of evaluation indices, define the R-submodule S_J(V) of R^d by F in S_J(V) iff ev_j(F) is in V_j for every j in J, with componentwise evaluation.

**Uses.** LLZ Proposition 4.2 and Lemma 4.3: The image module with finitely many specialization constraints.; LLZ Proposition 4.11: The module against which the actual Coleman image must be compared.

**API.**

| Name | Contract |
| --- | --- |
| `evaluationConstraints_mem` | F is in S_J(V) iff for every j in J, ev_j(F) is in V_j. |
| `evaluationConstraints_empty` | S_empty(V)=R^d. |
| `evaluationConstraints_antitone` | If J is contained in J' then S_J'(V) is contained in S_J(V). |

**Discriminating tests.**

- `constraints_none` (degenerate): An empty set of conditions gives the full module.
- `constraints_zero_at_zero` (computation): Over E[X], d=1, evaluation at 0 and V=0: 1 is excluded and X is included.
- `constraints_diagonal` (computation): Over Q[X], one condition V={(a,a)} at 0: (1,1) is included and (1,0) is excluded.

**Check.**

- Retain the actual evaluation maps and the finite set of imposed conditions.

**Construction or proof route.**

1. Closure under R-scalar multiplication follows because ev_j(rF)=ev_j(r)ev_j(F) and V_j is an E-subspace. Addition and zero are componentwise.

**Dependencies.** .

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Lemma 4.1 and Proposition 4.2, p. 1118: The source module is expressed as a submodule using the actual evaluation maps.

<a id="target-padichodgeregulators-l4-scalar-multiple-zeros"></a>

### Division by distinct evaluation factors

Target `PadicHodgeRegulators:L4/scalar-multiple-zeros` · declaration `divisibleByEvaluationProduct`.

**Hypotheses.** The evaluation context in conventions.evaluation, including injectivity of x and the evaluation-kernel divisibility hypotheses.

In the evaluation context, ev_j(f)=0 for all j in J iff the product of q_j over J divides f. Repeated points are not allowed.

**Check.**

- A repeated evaluation point does not imply a double zero.

**Construction or proof route.**

1. Induct on J. Divide by the newly extracted q_j using the kernel hypothesis.
2. At another point i, ev_i(q_j)=x_i-x_j is nonzero; hence the quotient still vanishes there. Apply the induction hypothesis.
3. The converse follows by evaluating the product.

**Dependencies.** [PadicHodgeRegulators:L4/evaluation-constraints](#target-padichodgeregulators-l4-evaluation-constraints).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Lemma 4.3, first inclusion, pp. 1118-1119: Makes explicit the distinct-factor divisibility used in the first image inclusion.

<a id="target-padichodgeregulators-l4-single-constraint-basis"></a>

### Single-condition basis

Target `PadicHodgeRegulators:L4/single-constraint-basis` · declaration `singleConstraintBasisExists`.

**Hypotheses.** The evaluation context, including R a domain and q_j nonzero.

For J={j}, S_J(V) has an R-basis with row matrix diag(1,...,1,q_j,...,q_j)C, where C is an E-basis of E^d adapted to V_j and q_j occurs codim(V_j) times. Its determinant is a nonzero E-scalar times q_j^codim(V_j).

**Check.**

- Do not drop the domain or nonzero-factor assumptions; nonzero zero-divisors do not give free principal summands.

**Construction or proof route.**

1. Extend a basis of V_j to a basis of E^d using the existing vector-space basis extension.
2. In these coordinates, precisely the complementary coordinates must have ev_j=0. The kernel hypothesis divides them by q_j.
3. Multiplication by q_j is injective because R is a domain and q_j is nonzero; it identifies each complementary R-coordinate with q_j R.
4. The diagonal determinant and determinant of C give the determinant with its unit factor.

**Dependencies.** [PadicHodgeRegulators:L4/evaluation-constraints](#target-padichodgeregulators-l4-evaluation-constraints), `mathlib:Module.Basis.extend`, `mathlib:Matrix.det_mul`.

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Lemma 4.1, p. 1118: Expands the adapted-basis and division argument of the source.

<a id="target-padichodgeregulators-l4-unused-point-invertibility"></a>

### Invertibility at a new point

Target `PadicHodgeRegulators:L4/unused-point-invertibility` · declaration `constraintBasisEvaluationInvertible`.

**Hypotheses.** The evaluation context; the stated determinant factorization; j not in J.

Let B be a row-basis matrix for previous constraints with det(B)=epsilon times the product over i in J of q_i^n_i, epsilon a unit in R. If j is not in J, ev_j(B) is invertible over E.

**Check.**

- The point must be distinct from all points whose factors occur in the determinant.

**Construction or proof route.**

1. An algebra homomorphism sends epsilon to a unit.
2. Each evaluated q_i is x_j-x_i, nonzero by distinctness. Evaluate the determinant product to obtain a nonzero determinant.
3. Use the adjugate identity over E.

**Dependencies.** `mathlib:Matrix.det_mul`.

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Proposition 4.2, induction step, p. 1118: This is the source's evaluated basis matrix at the new node.

<a id="target-padichodgeregulators-l4-transported-specialization"></a>

### Transported specialization subspace

Target `PadicHodgeRegulators:L4/transported-specialization` · declaration `transportedSpecialization`.

**Hypotheses.** E is a field; C is square. Invertibility is required only for the inverse description and dimension comparison.

For an E-subspace V of E^d and a matrix C over E, define W={c:cC is in V}, a submodule preimage. If C is invertible, W=VC^(-1) in row-vector notation.

**Uses.** LLZ Proposition 4.2: Pull a new condition back through the previous basis matrix.; LLZ Proposition 4.11: Translate regulator-coordinate conditions to Coleman-coordinate conditions with the actual matrix.

**API.**

| Name | Contract |
| --- | --- |
| `transportedSpecialization_mem` | c is in W iff cC is in V. |
| `transportedSpecialization_one` | Transport by I leaves V unchanged. |
| `transportedSpecialization_comp` | Transport first by C and then by D equals transport by DC. |

**Discriminating tests.**

- `transport_identity` (compatibility): For C=I the original subspace is recovered.
- `transport_shear` (computation): For V=Q(1,0) and C=[[1,1],[0,1]], W=Q(1,-1), not V.
- `transport_singular` (non-example): For C=0 and V=0, W=E^d; codimension preservation fails without invertibility.

**Check.**

- Do not silently identify regulator-coordinate constraints with Coleman-coordinate constraints.

**Construction or proof route.**

1. Use the existing linear row-multiplication map and Submodule.comap.

**Dependencies.** .

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Proposition 4.2, definition of S double-prime, p. 1118: The source transports by the inverse of its evaluated matrix.

<a id="target-padichodgeregulators-l4-transport-dimension"></a>

### Dimension under transport

Target `PadicHodgeRegulators:L4/transport-dimension` · declaration `transportedSpecialization_finrank`.

**Hypotheses.** E is a field; C is invertible.

For C in GL_d(E), transportedSpecialization(V,C) is linearly equivalent to V by c maps to cC, and has the same E-dimension.

**Check.**

- Exhibit the equivalence itself, not only the dimension equality.

**Construction or proof route.**

1. Restrict row multiplication to the inverse-image subspace; row multiplication by C inverse is its inverse.

**Dependencies.** [PadicHodgeRegulators:L4/transported-specialization](#target-padichodgeregulators-l4-transported-specialization).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Proposition 4.2, induction step: Justifies preservation of the exponent in the new determinant factor.

<a id="target-padichodgeregulators-l4-constraint-basis"></a>

### Basis for simultaneous constraints

Target `PadicHodgeRegulators:L4/constraint-basis` · declaration `constraintBasis`.

**Hypotheses.** The entire evaluation context, including R a domain, all q_j nonzero, distinct points and the principal evaluation kernels.

Construct an R-basis of S_J(V), indexed by Fin d, by successively imposing each evaluation condition. This extends the one-point construction and does not claim an integral basis for constraints over O_E.

**Uses.** LLZ Proposition 4.2: Prove full R-rank and the determinant of the constrained image module.

**API.**

| Name | Contract |
| --- | --- |
| `constraintBasis_rows_mem` | Every row of the constructed basis belongs to S_J(V). |
| `constraintBasis_expansion` | Each F in S_J(V) has unique R-coordinates in the constructed basis. |
| `constraintBasis_determinant` | The determinant is associated to the product of q_j^codim(V_j). |

**Discriminating tests.**

- `basis_single_zero_condition` (computation): For R=Q[X], d=1, x=0 and V=0, S has the one-element basis X.
- `basis_two_zero_conditions` (computation): For d=1 with V=0 at 0 and 5, S has a basis associated to X(X-5), not X squared.
- `basis_two_coordinates` (computation): For d=2, V_0=span(e1) at 0 and V_1=span(e2) at 5, rows (X-5,0),(0,X) form a basis with determinant X(X-5).

**Check.**

- There is no circular dependency on the final determinant theorem: the induction proves the basis and its determinant invariant together.

**Construction or proof route.**

1. Start with the standard basis when J is empty.
2. At j not in J use constraintBasisEvaluationInvertible and replace V_j by transportedSpecialization(V_j,ev_j(B)).
3. Apply singleConstraintBasisExists to the coefficient module and multiply its row matrix C on the LEFT of B. The resulting rows form a basis of the new S.
4. Carry the determinant product in the same induction; this simultaneously supplies the invariant for the next step.

**Dependencies.** [PadicHodgeRegulators:L4/single-constraint-basis](#target-padichodgeregulators-l4-single-constraint-basis), [PadicHodgeRegulators:L4/unused-point-invertibility](#target-padichodgeregulators-l4-unused-point-invertibility), [PadicHodgeRegulators:L4/transported-specialization](#target-padichodgeregulators-l4-transported-specialization), [PadicHodgeRegulators:L4/transport-dimension](#target-padichodgeregulators-l4-transport-dimension).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Proposition 4.2 and proof, p. 1118: Source induction expanded to declaration granularity, with correct inverse transport and matrix order.

<a id="target-padichodgeregulators-l4-constraint-determinant"></a>

### Determinant ideal of the constraint module

Target `PadicHodgeRegulators:L4/constraint-determinant` · declaration `constraintBasis_determinant`.

**Hypotheses.** The entire evaluation context.

For the constructed basis and for any other R-basis of S_J(V), the determinant of its inclusion into R^d is associated to the product of q_j^(d-dim_E V_j). This is equality of principal determinant ideals, not canonical equality of generators.

**Check.**

- A rescaling of one basis vector by a nontrivial unit must not change the ideal statement.

**Construction or proof route.**

1. The construction of constraintBasis carries the determinant invariant, using codimension equality after transport and Matrix.det_mul.
2. Any two R-bases differ by an invertible R-matrix, whose determinant is a unit.

**Dependencies.** [PadicHodgeRegulators:L4/constraint-basis](#target-padichodgeregulators-l4-constraint-basis), `mathlib:Matrix.det_mul`.

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Proposition 4.2, p. 1118: Pins the meaning of the source's determinant expression to a principal ideal.

<a id="target-padichodgeregulators-l4-projection-generator"></a>

### Coordinate-image generator

Target `PadicHodgeRegulators:L4/projection-generator` · declaration `projectionGenerator`.

**Hypotheses.** E is a field; R is a commutative E-algebra; J finite; V_j subspaces; t and x as in the evaluation context.

For coordinate k define J_k={j in J: every v in V_j has v_k=0}; define g_k as the product over J_k of t-x_j. Empty products are one.

**Uses.** LLZ Lemma 4.3 and Corollary 4.15: Determine which specialization factors divide each Coleman coordinate.

**API.**

| Name | Contract |
| --- | --- |
| `projectionGenerator_formula` | g_k is exactly the product over forced-zero indices. |
| `projectionGenerator_empty` | If no V_j forces coordinate k to vanish, g_k=1. |
| `projectionGenerator_eval` | With distinct points and ev_j(t)=x_j, ev_j(g_k)=0 iff j belongs to J_k, for j in J. |

**Discriminating tests.**

- `projection_no_constraints` (degenerate): With J empty, g_k=1.
- `projection_all_zero` (computation): For d=1 and V_j=0 at 0 and 5, g_0=X(X-5).
- `projection_mixed` (computation): For V_0=span(e1) at 0 and V_1=span(e2) at 5, g_0=X-5 and g_1=X.

**Check.**

- The index set is coordinate-specific, not the complete set of interpolation points.

**Construction or proof route.**

1. Filter the finite index set by the stated coordinate-vanishing condition and form the finite product in R.

**Dependencies.** .

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Lemma 4.3 and proof, pp. 1118-1119: Uses the source's forced-zero set and not just an unspecified subset of factors.

<a id="target-padichodgeregulators-l4-projection-witness"></a>

### Polynomial witness for the image generator

Target `PadicHodgeRegulators:L4/projection-witness` · declaration `projectionWitness`.

**Hypotheses.** The entire evaluation context; k is a coordinate in Fin d.

In the evaluation context construct F in S_J(V) whose k-th coordinate is exactly g_k. Other coordinates can be chosen as polynomials in t with E-coefficients.

**Uses.** LLZ Lemma 4.3: Prove the reverse image inclusion.

**API.**

| Name | Contract |
| --- | --- |
| `projectionWitness_coordinate` | The k-th coordinate is g_k. |
| `projectionWitness_mem` | The resulting vector belongs to S_J(V). |
| `projectionWitness_multiples` | For r in R, rF belongs to S_J(V) and has k-th coordinate rg_k. |

**Discriminating tests.**

- `witness_empty` (degenerate): With no conditions the standard e_k has the required coordinate one.
- `witness_diagonal` (computation): For R=Q[X] and V={(a,a)} at 0, (1,1) witnesses that the first coordinate image contains one.
- `witness_integral_denominators` (non-example): Interpolation of 0 and 1 at 0 and 5 is X/5. No polynomial over Z_5 has those two values, so the E-polynomial argument cannot be asserted integrally.

**Check.**

- This is a generator witness, not merely an inclusion or a dimension count; its coefficients need not be integral.

**Construction or proof route.**

1. At a point in J_k choose zero in V_j. Outside J_k choose v in V_j with v_k nonzero and multiply by ev_j(g_k)/v_k.
2. Interpolate each of the other coordinates with Lagrange.interpolate on J and substitute t. Set the k-th coordinate to g_k itself.
3. Evaluation at every node returns the chosen vector by the E-algebra property and Lagrange.eval_interpolate_at_node.

**Dependencies.** [PadicHodgeRegulators:L4/evaluation-constraints](#target-padichodgeregulators-l4-evaluation-constraints), [PadicHodgeRegulators:L4/projection-generator](#target-padichodgeregulators-l4-projection-generator), `mathlib:Lagrange.interpolate`, `mathlib:Lagrange.eval_interpolate_at_node`.

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Lemma 4.3, interpolation step, p. 1119: Expands the source's interpolating-polynomial construction using the pinned Lagrange API.

<a id="target-padichodgeregulators-l4-coordinate-image"></a>

### Exact coordinate image

Target `PadicHodgeRegulators:L4/coordinate-image` · declaration `coordinateImage_eq`.

**Hypotheses.** The entire evaluation context.

The k-th coordinate image of S_J(V) is exactly g_kR. If each V_j has a nonzero k-coordinate somewhere, this projection is surjective; this does not say the whole inclusion S_J(V) into R^d is surjective.

**Check.**

- The proper submodule F(0)=G(0) has both coordinate images equal to R.

**Construction or proof route.**

1. Each projected element vanishes at the forced-zero nodes. The distinct-factor divisibility lemma gives inclusion in g_kR.
2. The witness gives g_k in the image; R-linearity gives all multiples.

**Dependencies.** [PadicHodgeRegulators:L4/scalar-multiple-zeros](#target-padichodgeregulators-l4-scalar-multiple-zeros), [PadicHodgeRegulators:L4/projection-witness](#target-padichodgeregulators-l4-projection-witness).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 4A, Lemma 4.3, pp. 1118-1119: Both directions of the source image description are explicit.

<a id="target-padichodgeregulators-l4-coleman-coordinates"></a>

### Coleman coordinates

Target `PadicHodgeRegulators:L4/coleman-coordinates` · declaration `colemanCoordinates`.

**Hypotheses.** R is a commutative ring; H,W are R-modules; e is an R-linear equivalence.

For a genuine R-linear map f:H to W and coordinate equivalence e:W to R^d, define Col_e=e composed with f. In LLZ, f is 1-phi on the actual psi=1 module and e is the good psi=0 Wach-basis coordinate map. This generic definition alone does not construct either input.

**Uses.** LLZ section 3, Definition 3.1: Define bounded coordinates after the good Wach basis exists.; ModularIwasawaMainConjectures:L0: Use kernels of actual integral coordinates rather than arbitrary functionals.

**API.**

| Name | Contract |
| --- | --- |
| `colemanCoordinates_apply` | Col_e(z)=e(f(z)). |
| `colemanCoordinates_reconstruct` | e inverse applied to Col_e(z) equals f(z). |
| `colemanCoordinates_precomp` | Col_e(f composed with g)=Col_e(f) composed with g. |

**Discriminating tests.**

- `coleman_zero` (degenerate): f=0 gives the zero coordinate map.
- `coleman_standard` (compatibility): f=id and e=id on R^d give the identity coordinate map.
- `coleman_shear_inverse` (computation): For U=[[1,1],[0,1]] over Q, c=(1,0) changes to cU inverse=(1,-1), not cU=(1,1).

**Check.**

- Do not substitute arbitrary maps of the correct dimensions for the arithmetic inputs.

**Construction or proof route.**

1. Compose the supplied map with the existing linear equivalence. Use standard coordinates, not a new regulator record.

**Dependencies.** [PadicHodgeRegulators:L4/good-wach-basis](#target-padichodgeregulators-l4-good-wach-basis).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 3A, displayed definition Col=J composed with (1-phi), Remark 3.1 and Lemma 3.3, pp.1116-1117: Separates coordinate algebra from construction of the arithmetic source and target.

<a id="target-padichodgeregulators-l4-coleman-reconstruction"></a>

### Reconstruction from Coleman coordinates

Target `PadicHodgeRegulators:L4/coleman-reconstruction` · declaration `colemanCoordinates_reconstruct`.

**Hypotheses.** The actual modules, maps and coordinate equivalence of colemanCoordinates.

For every z, e inverse applied to Col_e(z) equals f(z); thus the coordinate tuple uniquely reconstructs f(z).

**Check.**

- Use the actual coordinate equivalence, not a vector-space dimension comparison.

**Construction or proof route.**

1. Apply the inverse identity for e to the definition.

**Dependencies.** [PadicHodgeRegulators:L4/coleman-coordinates](#target-padichodgeregulators-l4-coleman-coordinates).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 3A, Lemma 3.3 and its proof, p.1117: This reconstruction is the first equality in the source proof.

<a id="target-padichodgeregulators-l4-logarithmic-matrix"></a>

### Logarithmic matrix

Target `PadicHodgeRegulators:L4/logarithmic-matrix` · declaration `logarithmicMatrix`.

**Hypotheses.** A is an R-algebra; Y is an A-module with compatible restricted R-action; d is finite; e and b are linear equivalences over their stated rings.

Let R to A be a homomorphism of commutative rings, e:W to R^d and b:Y to A^d coordinate equivalences, and j:W to Y an R-linear map. Define M_ik=b(j(e inverse(e_i)))_k. This is an A-matrix encoding j, not an R-matrix asserted integral without proof.

**Uses.** LLZ equation (1) and Lemma 3.3: Express the analytic vector regulator in a fixed crystalline basis.

**API.**

| Name | Contract |
| --- | --- |
| `logarithmicMatrix_entry` | M_ik=b(j(e inverse(e_i)))_k. |
| `logarithmicMatrix_expansion` | b(j(w))=algebraMap(e(w)) times M, using row multiplication. |
| `logarithmicMatrix_zero` | For j=0, M=0. |

**Discriminating tests.**

- `matrix_identity` (compatibility): For R=A and all maps identity, M=I.
- `matrix_non_diagonal` (computation): For standard Q-coordinates and j with row matrix [[1,2],[3,4]], M is that matrix, not its transpose.
- `matrix_singular_inclusion` (non-example): For j with row matrix diag(1,0), det M=0; the construction does not imply invertibility.

**Check.**

- Pin row/column orientation and the coefficient embedding.

**Construction or proof route.**

1. Map each standard vector in R^d through e inverse, j and b.
2. In LLZ, Y is the actual analytic scalar extension with its Mellin module comparison proved. No ring-multiplicativity of the ordinary power-series Mellin transform is assumed.

**Dependencies.** .

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 3, equation (1), pp. 1116-1117: Defines the comparison matrix from basis images with the correct coefficient ring.

<a id="target-padichodgeregulators-l4-matrix-expansion"></a>

### Expansion in the logarithmic matrix

Target `PadicHodgeRegulators:L4/matrix-expansion` · declaration `logarithmicMatrix_expansion`.

**Hypotheses.** The rings, coordinate equivalences, map j and scalar tower of logarithmicMatrix.

For w in W, b(j(w))=algebraMap(e(w)) times M. Map the input row from R to A before multiplying.

**Check.**

- The matrix must not be transposed accidentally.

**Construction or proof route.**

1. Expand w in its finite coordinate basis.
2. Apply R-linearity of j, A-linearity of b and the scalar-tower identity. The resulting finite sum is row multiplication.

**Dependencies.** [PadicHodgeRegulators:L4/logarithmic-matrix](#target-padichodgeregulators-l4-logarithmic-matrix), `mathlib:Module.Basis.constr_apply_fintype`, `mathlib:Matrix.vecMulBilin`.

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 3, equation (1) and Lemma 3.3: The finite basis expansion in the source becomes a map-level identity.

<a id="target-padichodgeregulators-l4-regulator-coordinate-decomposition"></a>

### Vector-regulator coordinate decomposition

Target `PadicHodgeRegulators:L4/regulator-coordinate-decomposition` · declaration `regulatorCoordinateDecomposition`.

**Hypotheses.** The full coefficient-extension and actual-map hypotheses of logarithmicMatrix and colemanCoordinates.

For the preceding actual maps, b(j(f(z)))=algebraMap(Col_e(z)) times M. With the independently constructed Iwasawa and Mellin comparison maps this gives LLZ's decomposition of the vector regulator. Without those maps it is only the stated linear algebra theorem.

**Check.**

- No arbitrary scalar projection and no unproved replacement for the Iwasawa comparison.

**Construction or proof route.**

1. Apply logarithmicMatrix_expansion to f(z), then substitute colemanCoordinates.
2. The arithmetic application uses the INVERSE of h_Iw:N(V)^psi=1 to H^1_Iw in LLZ Definition 3.4.

**Dependencies.** [PadicHodgeRegulators:L4/coleman-reconstruction](#target-padichodgeregulators-l4-coleman-reconstruction), [PadicHodgeRegulators:L4/matrix-expansion](#target-padichodgeregulators-l4-matrix-expansion).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 3, Lemma 3.3, Definition 3.4 and equation (2), p. 1117: Separates the coordinate identity from the genuinely arithmetic comparison inputs.

<a id="target-padichodgeregulators-l4-constant-basis-covariance"></a>

### Constant basis covariance

Target `PadicHodgeRegulators:L4/constant-basis-covariance` · declaration `constantBasisCovariance`.

**Hypotheses.** Actual coordinate bases and invertible matrices over their declared rings. Lattice-preserving Wach application: U belongs to GL_d(O_E). A rational matrix only yields a rational comparison.

With column basis vectors n'=Un and nu'=Bnu, U in GL_d(R), B in GL_d(A), the coordinate row changes by c'=cU inverse and the matrix by M'=algebraMap(U) M B inverse. Hence c'M'=cM B inverse, so the vector in Y is unchanged. Fixing the crystalline basis means B=I.

**Check.**

- Check both domain and target basis changes; the inverse on Coleman coordinates is essential.

**Construction or proof route.**

1. Expanding the same vector in the two domain bases gives c'U=c.
2. Apply j to n'=Un and substitute nu=B inverse times nu'.
3. Multiply associatively; do not interchange matrices.
4. For Wach modules invoke only the good-basis theorem and permitted constant integral transformations, not arbitrary power-series basis changes.

**Dependencies.** [PadicHodgeRegulators:L4/coleman-coordinates](#target-padichodgeregulators-l4-coleman-coordinates), [PadicHodgeRegulators:L4/logarithmic-matrix](#target-padichodgeregulators-l4-logarithmic-matrix).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 3, equation (1); section 5C, Remark 5.12, p. 1129: Extends the stated fixed-crystalline-basis transformation to explicit two-basis covariance.

<a id="target-padichodgeregulators-l4-shear-matrix"></a>

### Integral shear matrix

Target `PadicHodgeRegulators:L4/shear-matrix` · declaration `shearMatrix`.

**Hypotheses.** The entries lie in a commutative ring.

Define A(e1,e2)=[[1,e2],[e1,1]], with row action (F,G)A=(F+e1G,G+e2F). Over a commutative ring it is invertible precisely when 1-e1e2 is a unit, not merely nonzero.

**Uses.** LLZ Proposition 5.11: Remove axis specialization lines while preserving the integral lattice.

**API.**

| Name | Contract |
| --- | --- |
| `shearMatrix_action` | (F,G)A=(F+e1G,G+e2F). |
| `shearMatrix_det` | det A=1-e1e2. |
| `shearMatrix_unit` | If 1-e1e2 is a unit, A has a two-sided inverse over the same ring. |

**Discriminating tests.**

- `shear_identity` (degenerate): e1=e2=0 gives I.
- `shear_order` (computation): For e1=2,e2=3 and (F,G)=(7,11), the output is (29,32).
- `shear_nonunit_determinant` (non-example): Over Z_5, e1=1,e2=-4 give nonzero determinant 5 but a matrix not invertible over Z_5.

**Check.**

- Retain the coefficient ring in the invertibility statement.

**Construction or proof route.**

1. Use the existing two by two Matrix carrier and compute the determinant.

**Dependencies.** .

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 5C, Proposition 5.11, proof, p. 1129: The integral ring makes the distinction between nonzero and unit determinant necessary.

<a id="target-padichodgeregulators-l4-shear-specialization-lines"></a>

### Transformation of specialization lines

Target `PadicHodgeRegulators:L4/shear-specialization-lines` · declaration `shearSpecializationLines`.

**Hypotheses.** E is a field and 1-e1e2 is nonzero.

Over a field, assume 1-e1e2 nonzero and (F',G')=(F,G)A. Then F=0 iff F'=e1G'; G=0 iff G'=e2F'; and F=rG iff (1+e2r)F'=(e1+r)G'. If e1+r and 1+e2r are nonzero, the latter line has both coordinate projections nonzero.

**Check.**

- Treat both axes as well as finite nonzero slopes.

**Construction or proof route.**

1. Expand each difference; it equals (1-e1e2) times the original difference.
2. Use the determinant's nonvanishing for both implications. Divide the transformed slope only when its denominator is nonzero.

**Dependencies.** [PadicHodgeRegulators:L4/shear-matrix](#target-padichodgeregulators-l4-shear-matrix).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 5C, Proposition 5.11, proof, p. 1129: Preserves all three cases of the source's change-of-lines argument.

<a id="target-padichodgeregulators-l4-integral-shear-choice"></a>

### Integral shear avoiding finitely many slopes

Target `PadicHodgeRegulators:L4/integral-shear-choice` · declaration `integralShearChoice`.

**Hypotheses.** O is a commutative local domain; E is a field; O to E is injective; maximalIdeal(O) is infinite; the slope set is finite.

Let O embed in a field E, with O a commutative local domain and its maximal ideal infinite. For finitely many nonzero slopes r_i in E, choose nonzero e1,e2 in that maximal ideal such that e1+r_i and 1+e2r_i are nonzero for every i. Then det A is a unit in O. Finite extensions of Q_p satisfy the infinite-ideal hypothesis via distinct positive powers of a uniformizer.

**Check.**

- Uniformizer powers provide infinitely many choices even when the residue field is small.

**Construction or proof route.**

1. Avoid the finite set {0,-r_i} when choosing e1, using the injection O to E.
2. Avoid {0,-r_i inverse} when choosing e2.
3. Since e1e2 is in the maximal ideal, 1-e1e2 is a unit.
4. This repairs the insufficiency of merely requiring a nonzero determinant and does not need a large residue field.

**Dependencies.** [PadicHodgeRegulators:L4/shear-matrix](#target-padichodgeregulators-l4-shear-matrix), `mathlib:IsLocalRing.maximalIdeal`, `mathlib:IsLocalRing.isUnit_one_sub_self_of_mem_nonunits`.

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 5C, Proposition 5.11, p.1129; compare arXiv1006.5163v2 Section 5.3, Proposition 5.11 and Remark 5.12, p.25: The maximal-ideal strengthening is already present in the preprint's integral remark and is used to make the published proof valid.

<a id="target-padichodgeregulators-l4-sheared-coordinate-surjectivity"></a>

### Rational surjectivity after integral basis change

Target `PadicHodgeRegulators:L4/sheared-coordinate-surjectivity` · declaration `shearedCoordinateSurjectivity`.

**Hypotheses.** The entire evaluation context with d=2 and dim_E V_j=1 for every imposed condition; O embeds in E and is as in integralShearChoice.

In the two-dimensional evaluation context, suppose each V_j is a one-dimensional E-subspace of E^2. A constant integral shear chosen as above makes both projections of S_J(V)A equal to R. For R=O_E[[X]][1/varpi] this is rational surjectivity, not an assertion that integral Coleman images equal O_E[[X]].

**Check.**

- The proper ideal (5,X) in Z_5[[X]] becomes the full ring after inverting 5; rational surjectivity does not remove the integral correction.

**Construction or proof route.**

1. Each line is an axis or has a finite nonzero slope. Collect the finitely many slopes.
2. Use integralShearChoice and shearSpecializationLines; every transformed line has both projections nonzero.
3. Evaluation commutes with the constant matrix A, so S(V)A=S(VA). The two forced-zero sets are empty and coordinateImage_eq gives the conclusion.
4. Integral finite-index conclusions still need LLZ Theorem 5.10 and its integral lower inclusion, recorded as remaining work.

**Dependencies.** [PadicHodgeRegulators:L4/integral-shear-choice](#target-padichodgeregulators-l4-integral-shear-choice), [PadicHodgeRegulators:L4/shear-specialization-lines](#target-padichodgeregulators-l4-shear-specialization-lines), [PadicHodgeRegulators:L4/coordinate-image](#target-padichodgeregulators-l4-coordinate-image).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 5C, Proposition 5.11 and Remark 5.12, pp. 1128-1129; section 4A, Lemma 4.3: The algebra proves the rational conclusion; Theorems 5.10 and 5.13 supply additional integral content, not silently assumed here.

<a id="target-padichodgeregulators-l4-good-wach-basis"></a>

### Good Wach basis coordinate interface

Target `PadicHodgeRegulators:L4/good-wach-basis` · declaration `exists_goodWachBasis`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; T stable; for the analytic closure argument use finite free modules with their canonical Frechet topology.

Import rational and analytic good-basis existence from PG.6/wach-good-basis; PG.6 owns this generic theorem. The stronger integral choice n_i congruent n_i^0 modulo pi of LLZWach2010 Theorem 3.5 is an extension requested from PG.6. For the selected good basis identify its bounded coefficient row with Lambda_E(G)^d and its analytic extension with H_E(G)^d, using b_i=(1+pi)phi(n_i). A constant invertible change of the selected Wach basis changes the coefficient row by inverse right multiplication. General power-series basis changes require the hypotheses of L4/basis-change; they do not automatically preserve goodness.

**Check.**

- Changing by a constant GL_d(O_E) matrix preserves goodness. An arbitrary power-series change does not follow from this theorem.

**Construction or proof route.**

1. Use the imported basis and analytic scalar-extension theorems under their weight and topology hypotheses. The stronger integral prescribed-reduction result is LLZWach2010 Theorem 3.5, pp.10–12, and belongs to the PG.6 extension request.
2. Expand uniquely in b_i. Constant basis change acts identically on the column of b_i, so the coefficient row multiplies by its inverse. This is the regulator coordinate interface, not another Wach existence construction.

**Dependencies.** [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-good-basis](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6](PhiGammaModulesAndIwasawaCohomology.md), [LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism](LocallyAnalyticDistributions.md), [PadicMeasuresIwasawaAlgebras:L2](PadicMeasuresIwasawaAlgebras.md).

**Sources.** [LLZWach2010](https://antoniolei.com/wp-content/uploads/2014/09/modularforms.pdf), Theorem3.5, Lemmas3.7-3.10, Proposition3.11, Lemma3.15, pp.10-13: Gives the integral iterative proof and rational basis transport.; [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Proposition2.11, Theorem2.12, Corollary2.13, Remark2.14, pp.1115-1116: Specifies analytic extension and the precise unproved arbitrary-basis claim.

<a id="target-padichodgeregulators-l4-noncritical-refinement"></a>

### Noncritical crystalline refinement

Target `PadicHodgeRegulators:L4/noncritical-refinement` · declaration `noncriticalRefinement`.

**Hypotheses.** V is crystalline, initially with nonpositive weights -s_i. Repeated weights are allowed.

A refinement is a full phi-stable flag 0=Y_0 subset Y_1 subset ... subset Y_d=D_cris(V), dim Y_i=i. It is noncritical if each Y_i has the i smallest filtration weights in LLZ’s positive representation convention (weights -s_1>=...>=-s_d with 0<=s_1<=...<=s_d); Equivalently dim Fil^j(Y_i)=max(0,dim Fil^j(D_cris(V))-d+i), for every j, with multiplicities retained. On W=V(m) nonnegative weights are r_1<=...<=r_d with s_i=m-r_(d+1-i). Existence after finite E extension is a separate hypothesis.

**Uses.** LLZ Theorem2.10: Supplies the saturated flag used to compute elementary divisors.; LLZ Section1D: Prevents treating Frobenius eigenvalues alone as a refinement.

**API.**

| Name | Contract |
| --- | --- |
| `noncriticalRefinement_flag` | Every step is phi-stable and has dimension i. |
| `noncriticalRefinement_weights` | The induced filtration on Y_i has weights -s_1,...,-s_i. |
| `noncriticalRefinement_extension` | Finite field extension transports a noncritical flag and its filtration dimensions. |

**Discriminating tests.**

- `refinement_rank_one` (characterisation): The unique flag of a rank-one filtered phi module is noncritical.
- `refinement_wrong_line` (non-example): For weights 0,-2 with Fil^1 the second eigenline, the flag starting in that line is critical in the LLZ positive convention.
- `refinement_scalar_phi` (characterisation): With scalar phi any flag is stable, but only flags with the required filtration dimensions are noncritical.

**Check.**

- A phi-stable line lying in the wrong filtration step fails noncriticality even if phi has distinct eigenvalues.

**Construction or proof route.**

1. Use the full induced filtered subspace, not only the list of phi eigenvalues. Interpret noncriticality using LLZ Section1C5 and the equivalent dimension equalities of the flag and filtration.

**Dependencies.** [PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions](#target-padichodgeregulators-l0-hodge-tate-and-twist-conventions), [PadicHodgeTheory:R06.2/period-functors](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/filtered-phi-n-modules](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/ddr-exact-strict-tensor](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/coefficient-field-base-change](PadicHodgeTheory.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section1C5, pp.1104-1105; Section2C before Proposition2.7, p.1112: The flag condition is exactly the input to the elementary-divisor proof.

<a id="target-padichodgeregulators-l4-refinement-saturated-flag"></a>

### Saturated Wach flag comparison

Target `PadicHodgeRegulators:L4/refinement-saturated-flag` · declaration `wachFlag_comparison`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. Use the noncritical flag and m>=s_d; all intersections are in the same localized period module.

For a noncritical refinement of a positive V, put mathcalY_i=B_rig^+ tensor Y_i and X_i=N_rig(V) intersect mathcalY_i[(t/pi)^(-1)]. Then X_i is saturated, rank i, and has weights -s_1,...,-s_i. For m>=s_d put A_i=pi^-m X_i e_m and B_i=t^-m mathcalY_i e_m. B_i is the saturation of A_i; A_d/A_(i-1) embeds in B_d/B_(i-1), with quotient annihilated by (t/pi)^(m-s_i). Passing to phi* and psi-zero gives cyclic successive quotients Btilde_i/(Btilde_(i-1)+Atilde_i) with exact annihilator n_(m-s_i); n_(m-s_i) annihilates the remaining quotient.

**Check.**

- In rank one the exact annihilator is n_r, not ell_0...ell_(r-1); its removable weight-node factors have been divided out.

**Construction or proof route.**

1. LLZ2.4 proves saturation by intersecting a phi-stable period subspace and records equality of filtrations in 2.5 using the crystalline reduction theorem2.2. The supplier must give the t/pi comparison elementary divisors of 2.3.
2. Use the dimension count in Lemma2.6 to bound the last quotient. Proposition2.7 converts it to the twisted flag. Lemma2.9 and Proposition1.6 transfer (t/phi(pi)) powers to n_k under Mellin; the rank-one quotient proves exact annihilation.

**Dependencies.** [PadicHodgeRegulators:L4/noncritical-refinement](#target-padichodgeregulators-l4-noncritical-refinement), [PadicHodgeRegulators:L3/logarithmic-factors](#target-padichodgeregulators-l3-logarithmic-factors), [PhiGammaModulesAndIwasawaCohomology:PG.6](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-module](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-existence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-height](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-dcris](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-good-basis](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-iwasawa](PhiGammaModulesAndIwasawaCohomology.md), [LocallyAnalyticDistributions:L3/unbounded-component-mellin](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/bounded-mellin-characterisation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-character-evaluation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-convolution](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-generator-change](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-weight-derivative](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-twist](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-pushforward](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-coefficient-extension](LocallyAnalyticDistributions.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Propositions2.4-2.5, Lemma2.6, Proposition2.7, Lemma2.9, pp.1110-1114: The complete flag chain replaces a bare assertion of a determinant.

<a id="target-padichodgeregulators-l4-logarithmic-elementary-divisors"></a>

### Elementary divisors of the logarithmic matrix

Target `PadicHodgeRegulators:L4/logarithmic-elementary-divisors` · declaration `logarithmicMatrix_elementaryDivisors`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The refinement hypothesis holds after finite extension; work componentwise in H_E, with its actual elementary-divisor theorem.

For W with nonnegative weights r_1<=...<=r_d admitting a noncritical refinement after finite coefficient extension, the H_E(Gamma_1) elementary divisors of (B_rig^+)^(psi=0) tensor D_cris(W)/(phi*N_rig(W))^(psi=0), and hence of the row-oriented logarithmic matrix M, are n_(r_1),...,n_(r_d). Consequently det M is associated to their product. In particular M(x_i) is invertible for x_i=chi(gamma)^i-1, 0<=i<r_d, since n_r has a removable nonzero value there.

**Check.**

- Weights (0,2) give (1,n_2); the matrix has nonzero determinant but is not an analytic isomorphism everywhere.

**Construction or proof route.**

1. Apply the flag cyclic-annihilator criterion LLZ1.12 to the psi-zero filtration of2.9. Descend elementary-divisor ideals by faithful flatness and uniqueness under finite coefficient extension.
2. Corollary3.2 transfers the lattice quotient calculation to the actual chosen basis matrix. Evaluate the removable n_r factors, including i>=r where numerator and denominator have no zero.

**Dependencies.** [PadicHodgeRegulators:L4/refinement-saturated-flag](#target-padichodgeregulators-l4-refinement-saturated-flag), [PadicHodgeRegulators:L4/good-wach-basis](#target-padichodgeregulators-l4-good-wach-basis), [PadicHodgeRegulators:L4/logarithmic-matrix](#target-padichodgeregulators-l4-logarithmic-matrix), [PadicHodgeRegulators:L3/logarithmic-factors](#target-padichodgeregulators-l3-logarithmic-factors), [LocallyAnalyticDistributions:L2](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/order-r-distributions](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/amice-velu-vishik](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/locally-algebraic-determination](LocallyAnalyticDistributions.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Corollary1.12, Theorem2.10 and Corollary3.2, pp.1107,1114,1117: States the actual analytic elementary divisors.

<a id="target-padichodgeregulators-l4-specialization-subspaces"></a>

### Coleman specialization subspaces

Target `PadicHodgeRegulators:L4/specialization-subspaces` · declaration `colemanSpecializationSubspaces`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

Under NC define V_(i,eta) in D_cris(V) as (1-p^i phi)(1-p^(-1-i)phi^-1)^(-1) Fil^(-i) if eta=chi_0^i, and phi Fil^(-i) otherwise, for 0<=i<r_d. Identify D_cris with row coordinates through the chosen ordered nu basis. The constraint on Coleman rows is W_(i,eta)={v in E^d: v M(x_i) belongs to V_(i,eta)}=V_(i,eta) M(x_i)^(-1). It has codimension d-dim Fil^(-i).

**Uses.** LLZ Theorems4.12,4.15: Defines the exact subspaces of the bounded image.; ModularIwasawaMainConjectures:L0: Signed local conditions must use the coordinates in this chosen good basis.

**API.**

| Name | Contract |
| --- | --- |
| `colemanSpecializationSubspaces_mem` | v is in W_(i,eta) iff v M(x_i) is in V_(i,eta). |
| `colemanSpecializationSubspaces_codim` | codim W_(i,eta)=d-dim Fil^(-i). |
| `colemanSpecializationSubspaces_covariance` | If M becomes U M B^-1 then W becomes W U^-1, with the period subspace transported by B^-1. |

**Discriminating tests.**

- `specialization_transport` (computation): For V=span(1,0) and M=[[0,1],[1,0]], W=span(0,1), so the first Coleman coordinate is forced zero.
- `specialization_full_filtration` (characterisation): If Fil^(-i) is full and both Euler maps invertible then W=E^d.
- `specialization_singular_exclusion` (non-example): A phi eigenvalue p^-1 at i=0 violates NC and forbids using the displayed inverse.

**Check.**

- Using the raw period subspace as the Coleman constraint can give the wrong coordinate vanishing.

**Construction or proof route.**

1. LLZ4.8 derives the filtration condition from reciprocity and the fact that the BK exponential vanishes on Fil^0. Corollaries4.9-4.10 identify the isotypical specialization.
2. Transport by the actual evaluated matrix using the row convention. The coefficient-space subspace in Proposition4.11 must be this transported subspace, not the untransported V_(i,eta).

**Dependencies.** [PadicHodgeRegulators:L3/unramified-interpolation](#target-padichodgeregulators-l3-unramified-interpolation), [PadicHodgeRegulators:L3/ramified-interpolation](#target-padichodgeregulators-l3-ramified-interpolation), [PadicHodgeRegulators:L4/logarithmic-elementary-divisors](#target-padichodgeregulators-l4-logarithmic-elementary-divisors), [PadicHodgeRegulators:L4/logarithmic-matrix](#target-padichodgeregulators-l4-logarithmic-matrix), [PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions](#target-padichodgeregulators-l0-hodge-tate-and-twist-conventions).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Proposition4.8, Corollaries4.9-4.10 and Proposition4.11, pp.1120-1123: Identifies the period subspace and then the matrix transport.

<a id="target-padichodgeregulators-l4-actual-coleman-image"></a>

### Image of the Coleman vector map

Target `PadicHodgeRegulators:L4/actual-coleman-image` · declaration `colemanMap_image`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

Under NC, in each eta component the image of the actual Col:N(V)^(psi=1)->Lambda_E(Gamma_1)^d is exactly S={F:F(x_i) belongs to W_(i,eta),0<=i<r_d}. Its determinant ideal is product_i(X-x_i)^(d-n_i). Each coordinate image equals product_(i: W_(i,eta) subset {v:v_j=0})(X-x_i) Lambda_E. The kernel of 1-phi is zero under the excluded Frobenius eigenvalues, giving a bounded Lambda_E exact sequence with quotient direct_sum_i E^d/W_(i,eta), with Gamma action evaluated at x_i. Analytic scalar extension gives the corresponding H_E exact sequence.

**Check.**

- The coordinate ideal must come from transported W_(i,eta). The exact sequence is not a map onto a field with scalar ring forgotten.

**Construction or proof route.**

1. The actual decomposition and filtration condition give containment in S. Compare regulator, logarithmic-matrix and constraint determinants as in LLZ4.12.
2. The printed determinant argument needs the analytic lattice/descent criterion: equal determinants over H_E cannot by itself erase a possible proper bounded quotient. Record this precise input as a gap/request rather than treating equality as a generic determinant theorem over arbitrary rings.
3. Apply the algebraic projection witness to the exact bounded equality. Use the kernel description of 1-phi for injectivity; evaluation and bounded Lagrange interpolation give the quotient. Write bounded and analytically extended sequences on their respective rings.

**Dependencies.** [PadicHodgeRegulators:L4/specialization-subspaces](#target-padichodgeregulators-l4-specialization-subspaces), [PadicHodgeRegulators:L4/constraint-basis](#target-padichodgeregulators-l4-constraint-basis), [PadicHodgeRegulators:L4/constraint-determinant](#target-padichodgeregulators-l4-constraint-determinant), [PadicHodgeRegulators:L4/projection-witness](#target-padichodgeregulators-l4-projection-witness), [PadicHodgeRegulators:L3/regulator-determinant](#target-padichodgeregulators-l3-regulator-determinant), [PadicHodgeRegulators:L4/logarithmic-elementary-divisors](#target-padichodgeregulators-l4-logarithmic-elementary-divisors), [PadicHodgeRegulators:L4/coleman-coordinates](#target-padichodgeregulators-l4-coleman-coordinates), [PadicMeasuresIwasawaAlgebras:L4](PadicMeasuresIwasawaAlgebras.md), [LocallyAnalyticDistributions:L2](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/order-r-distributions](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/amice-velu-vishik](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/locally-algebraic-determination](LocallyAnalyticDistributions.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Theorem4.12, Corollaries4.13-4.15, pp.1123-1124: Target statement and determinant route, with the missing descent interface made explicit.

<a id="target-padichodgeregulators-l4-regulator-elementary-divisors"></a>

### Elementary divisors of the regulator

Target `PadicHodgeRegulators:L4/regulator-elementary-divisors` · declaration `crystallineRegulator_elementaryDivisors`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

Under NC the H_E(G)-module cokernel of the H_E-linear extension of the actual L_V has elementary divisors lambda_(r_1),...,lambda_(r_d). These are analytic cokernel invariants, not bounded Coleman coordinate images. For each component the determinant specializes to the L3 formula.

**Check.**

- Weights (0,2) give (1,ell_0 ell_1), not (1,(X-x_0)(X-x_1)) and not two identical factors.

**Construction or proof route.**

1. Combine the elementary divisors of the image-constraint matrix and M. Their zero divisors are disjoint after the removable weight zeros are removed from n_r. Use the analytic elementary-divisor product criterion of LLZ4.16, with the nested weight multiplicities.

**Dependencies.** [PadicHodgeRegulators:L4/actual-coleman-image](#target-padichodgeregulators-l4-actual-coleman-image), [PadicHodgeRegulators:L4/logarithmic-elementary-divisors](#target-padichodgeregulators-l4-logarithmic-elementary-divisors), [PadicHodgeRegulators:L3/logarithmic-factors](#target-padichodgeregulators-l3-logarithmic-factors), [PadicHodgeRegulators:L4/regulator-coordinate-decomposition](#target-padichodgeregulators-l4-regulator-coordinate-decomposition), [LocallyAnalyticDistributions:L2](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/order-r-distributions](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/amice-velu-vishik](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/locally-algebraic-determination](LocallyAnalyticDistributions.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Theorem4.16 and proof, p.1124: Computes the unbounded vector-regulator cokernel.

<a id="target-padichodgeregulators-l4-modular-specialization"></a>

### Rank-two modular specialization relation

Target `PadicHodgeRegulators:L4/modular-specialization` · declaration `modularColeman_specialization`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. f and V have LLZ1C6 hypotheses; phi has no eigenvalue in p^Z and the refinement input for image equality holds. The period/Frobenius comparison for the modular form is a proved external dependency.

For the nonordinary modular representation V=V_(fbar)(k-1) in LLZ Section1C6 (p odd, weight k>=2, p not dividing N, coefficient E containing eigenvalues, source Frobenius exclusions), use the prescribed ordered bases and M(0)=[[0,p^(k-1)],[-1,a_p]]. Then at the trivial Delta component (1-a_p+p^(k-2)) Col_2(z)(0)=p^(k-2)(p-1) Col_1(z)(0); at nontrivial eta, Col_2(z)^eta(0)=0. For k=2 the quotient functional on the ordered pair (Col_1,Col_2) is rho(g,h)=(p-1)g(0)-(2-a_p)h(0), valued in E. Its kernel is the actual rational image, and it is surjective when the coefficients are not both zero.

**Check.**

- At p=5,k=2,a_p=0 the vector (1,2) satisfies 2 h=4 g and our rho=0, while the printed rho is -6.

**Construction or proof route.**

1. Use the quadratic Euler calculation with the source period basis, as in Lemmas5.6-5.7. Insert M(0) and set the unwanted filtration coordinate to zero.
2. At k=2 compute the annihilator of that line directly. E303 records the printed swapped functional and coefficient field. The quotient sequence follows from the general image theorem in its stated range.

**Dependencies.** [PadicHodgeRegulators:L3/quadratic-euler-product](#target-padichodgeregulators-l3-quadratic-euler-product), [PadicHodgeRegulators:L4/actual-coleman-image](#target-padichodgeregulators-l4-actual-coleman-image), [PadicHodgeRegulators:L4/specialization-subspaces](#target-padichodgeregulators-l4-specialization-subspaces), [AutomorphicGaloisRepresentations:R19.5](AutomorphicGaloisRepresentations.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Lemma5.6, Corollary5.7, text before Proposition5.9 and Proposition5.9, pp.1126-1127: The preceding relation fixes the ordered-coordinate normalization.

<a id="target-padichodgeregulators-l4-integral-image-index"></a>

### Integral Coleman image has finite cokernel

Target `PadicHodgeRegulators:L4/integral-image-index` · declaration `integralColemanImage_finite`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. Use the actual modular lattice and good basis of LLZ Section5; supply the integral lower inclusion for that lattice, including any extra (C),(D) restrictions required by the proof in LLZ2010.

In the modular range of LLZ5.10 let X_j^eta be the rational coordinate generator and X_k=product_(i=0..k-2)(X-chi(gamma)^i+1). For the prescribed integral good basis, X_k Lambda_O subset Im Col_j^eta subset X_j^eta Lambda_O, and X_j^eta Lambda_O/Im Col_j^eta has finite O_E length, hence is pseudo-null over O_E[[X]]. After the integral shear of Proposition5.11 all X_j^eta become 1, so each coordinate cokernel is finite; integral surjectivity is not asserted.

**Check.**

- The proper ideal (varpi,X) becomes the full ring after inverting varpi but is not integrally surjective.

**Construction or proof route.**

1. The lower inclusion is phi(pi)^(k-1)(phi*N(T))^(psi=0) subset (1-phi)N(T)^(psi=1). Its integral convergence proof is a specific unresolved input: LLZ2011 cites the proof of LLZ2010 Proposition4.11, whose stated scope is more restricted.
2. Mellin transports the lower inclusion to X_k. The quotient X_j Lambda_O/X_k Lambda_O is finite free over O_E, and rational equality makes its further quotient torsion. Finite generation gives finite O_E length.
3. Take the shear coefficients in the maximal ideal, avoid the finitely many forbidden ratios, and use inverse coordinate-basis transport. This removes rational zero factors, retaining the finite integral defect.

**Dependencies.** [PadicHodgeRegulators:L4/actual-coleman-image](#target-padichodgeregulators-l4-actual-coleman-image), [PadicHodgeRegulators:L4/integral-shear-choice](#target-padichodgeregulators-l4-integral-shear-choice), [PadicMeasuresIwasawaAlgebras:L4](PadicMeasuresIwasawaAlgebras.md), [PhiGammaModulesAndIwasawaCohomology:PG.6](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-module](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-existence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-height](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-dcris](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-good-basis](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-iwasawa](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Theorems 5.10 and 5.13, Proposition 5.11 and the published basis-change Remark 5.12, pp.1128-1129; the maximal-ideal selection is in arXiv1006.5163v2 Remark 5.12, p.25: Finite cokernel is the integral conclusion.; [LLZWach2010](https://antoniolei.com/wp-content/uploads/2014/09/modularforms.pdf), Proposition4.11 and proof, pp.26-27: Precisely marks the integral proof input still needed beyond its printed scope.; [LLZ2010v2](https://arxiv.org/pdf/1006.5163v2), Section 5.3, Remark 5.12, p.25: The preprint supplies the integral maximal-ideal choice; distinguish it from the published basis-change Remark 5.12.

<a id="target-padichodgeregulators-l4-signed-local-condition"></a>

### Signed local conditions from Coleman maps

Target `PadicHodgeRegulators:L4/signed-local-condition` · declaration `signedColemanLocalCondition`.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The h_Iw lattice comparison and chosen integral good basis are specified; continuity gives the closed kernel.

For a specified actual good integral Wach basis and coordinate j, export the closed Lambda_O-submodule ker Col_j of H^1_Iw(Q_p,T) via the proved h_Iw comparison. Its Tate-orthogonal local condition on the dual torsion representation is owned by ModularIwasawaMainConjectures. Under basis n prime=U n its row maps become Col prime=Col U^-1; the new kernel need not equal the old kernel. A basis or named signed normalization is part of the input.

**Uses.** ModularIwasawaMainConjectures:L0; ModularIwasawaMainConjectures:L4: Local kernels and their exact basis dependence are the regulator-side export.

**API.**

| Name | Contract |
| --- | --- |
| `signedColemanLocalCondition_mem` | A class lies in the condition iff its specified Col_j value is zero. |
| `signedColemanLocalCondition_closed` | The kernel is a closed Lambda_O submodule. |
| `signedColemanLocalCondition_covariance` | Its transported description is {z:(Col(z) U^-1)_j=0}. |

**Discriminating tests.**

- `signed_zero` (degenerate): The zero class lies in every condition.
- `signed_basis_mix` (computation): For Col(z)=(1,0) and U^-1=[[1,1],[0,1]], the second new coordinate is 1, so the second condition changes.
- `signed_scalar_basis` (compatibility): Multiplying a coordinate by an O_E unit leaves its kernel unchanged; a noninvertible operation is not a basis change.

**Check.**

- Equal rational images do not imply equal integral kernels.

**Construction or proof route.**

1. Transport the exact map, then take its genuine kernel. Export its pairing interface; do not reconstruct global Selmer groups here. No arbitrary good coordinate is identified with Pollack plus/minus without a separate source comparison.

**Dependencies.** [PadicHodgeRegulators:L4/coleman-coordinates](#target-padichodgeregulators-l4-coleman-coordinates), [PadicHodgeRegulators:L4/good-wach-basis](#target-padichodgeregulators-l4-good-wach-basis), [PadicHodgeRegulators:L4/constant-basis-covariance](#target-padichodgeregulators-l4-constant-basis-covariance), [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/wach-psi-fixed-vectors](#target-padichodgeregulators-l2-wach-psi-fixed-vectors), [PadicHodgeRegulators:L2/lattice-and-coefficient-squares](#target-padichodgeregulators-l2-lattice-and-coefficient-squares), `mathlib:LinearMap.ker`.

**Sources.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section3A and Section1A applications, pp.1096-1097,1116: The signed consumers require kernels of the actual normalized maps.

<a id="target-padichodgeregulators-l4-derham-character-domain"></a>

### Admitted de Rham character domain

Target `PadicHodgeRegulators:L4/derham-character-domain` · declaration `deRhamCharacterDomain`.

**Hypotheses.** E/Q_p finite; D is de Rham; the locally analytic character space is the actual PMIA weight space. Localization and Robba norms are provided by PHT/PG.

Let D be a de Rham (phi,Gamma)-module over R_E, Delta=N_rig(D) its differential module, and m(Delta) an overconvergence/localization threshold. On a torsion weight component write a character kappa by z_kappa=kappa(exp(q)), q=p for odd p and q=4 for p=2. If the torsion components differ set v_p(z_kappa-z_eta)=-infinity. For a primitive finite character eta of conductor p^c set B(eta,N)={kappa:v_p(z_kappa-z_eta)>p^(N-c)}. Choose the source threshold N(D); put U_D=union_(c>m(Delta)) B(eta,N(D)). Choices give admissible domains with compatible restriction, not a maximal canonical domain or all weight space. N(D) can be bounded in terms of the conductor of an extension where D becomes semistable.

**Uses.** RJ TheoremsI.15 and I.27: The regulator is defined only on this convergence domain.; AutomorphicGaloisRepresentations:R19.5; modular bad-reduction consumers: Do not export a global scalar distribution from an arbitrary de Rham representation.

**API.**

| Name | Contract |
| --- | --- |
| `deRhamCharacterDomain_mem` | Membership is existence of an admitted primitive eta with the stated coordinate valuation inequality. |
| `deRhamCharacterDomain_open` | U_D is an admissible open of character space. |
| `deRhamCharacterDomain_restrict` | Two valid threshold choices define compatible restrictions of the same regulator on their common admitted domain. |

**Discriminating tests.**

- `domain_center` (characterisation): Each admitted eta has infinite valuation difference from itself and lies in its ball.
- `domain_wrong_torsion` (non-example): A character on another torsion component has valuation difference -infinity and lies outside this ball.
- `domain_threshold` (non-example): A character with valuation difference exactly p^(N-c) is excluded by the strict inequality; the trivial character is not supplied by a high-conductor center argument.

**Check.**

- Finite characters of conductor c>m(Delta) lie in U_D; the trivial character is not guaranteed to do so.

**Construction or proof route.**

1. Use RJ0E3 for weight coordinates and IC4/I.17 for convergence. Choose N(D) so its annulus estimate gives convergence on every indicated ball. Threshold dependence is bounded by the potentially semistable localization extension.

**Dependencies.** [PhiGammaModulesAndIwasawaCohomology:PG.2](PhiGammaModulesAndIwasawaCohomology.md), [PadicHodgeTheory:P7](PadicHodgeTheory.md), [PadicMeasuresIwasawaAlgebras:L0a](PadicMeasuresIwasawaAlgebras.md), [LocallyAnalyticDistributions:L1](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L1/amice-transform](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L1/division-on-units](LocallyAnalyticDistributions.md), [PadicHodgeTheory:R06.3/de-rham-differential-equation](PadicHodgeTheory.md), [PadicHodgeTheory:P7/localisation-maps-p-adic-field](PadicHodgeTheory.md), [PadicHodgeTheory:P7/extended-localisation-maps](PadicHodgeTheory.md), [PadicHodgeTheory:P7/nabla-operator-on-robba-ring](PadicHodgeTheory.md).

**Sources.** [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), Section 0E3 and IA, Theorem I.1; Sections IC4-IC5, equation(3), Theorem I.15 and Lemma I.17, pp.896-898,910-915: Records the precise strict inequality and high-conductor union.

<a id="target-padichodgeregulators-l4-analytic-differential-powers"></a>

### Analytic powers of the differential operator

Target `PadicHodgeRegulators:L4/analytic-differential-powers` · declaration `analyticDifferentialPower`.

**Hypotheses.** Delta=N_rig(D) is the genuine differential Robba module; partial=nabla/t and psi/phi satisfy the source relations. Restrict to a weight affinoid and annulus where RJ PropositionI.13 proves convergence.

On Delta^(psi=0), for a sufficiently small weight affinoid and N large define kappa(partial) by the convergent series sum_(i in (Z/p^N)^times) sum_(j>=0) binom(omega_kappa,j) kappa(i) i^-j (1+T)^i p^(Nj) phi^N(partial^j z_i), where z_i=psi^N((1+T)^(-i)z). The value is independent of large N and representatives and is rigid analytic in kappa; for kappa=x^k, k in Z, it equals partial^k on psi-zero (negative powers use its inverse there).

**Uses.** RJ equation(3): Apply it to (1-phi)z before localization.; RJ TheoremsI.15,I.27: Provides analytic interpolation rather than only integer values.

**API.**

| Name | Contract |
| --- | --- |
| `analyticDifferentialPower_integer` | At x^k the operator is partial^k for every integer k. |
| `analyticDifferentialPower_linear` | It is E-linear in z and analytic in kappa on the specified affinoid. |
| `analyticDifferentialPower_choices` | Changing N or residue representatives preserves the value on the common annulus. |

**Discriminating tests.**

- `differential_weight_zero` (degenerate): At k=0 the operator is the identity on psi-zero.
- `differential_weight_one` (computation): At k=1 it is partial, not t partial.
- `differential_inverse` (compatibility): At k=-1, partial composed with the operator is identity on psi-zero; no inverse is asserted on all Delta.

**Check.**

- This construction acts on the imported Delta; no second differential-module carrier is defined here.

**Construction or proof route.**

1. Decompose psi-zero over units modulo p^N. On each piece p^N partial is a small perturbation of the scalar i. Expand its analytic binomial power.
2. RJ I.13 proves convergence by Robba differential bounds and bounded binomial coefficients, then checks refinement of N and representative changes. At algebraic weights finite binomial identities or the psi-zero inverse yield integral powers.

**Dependencies.** [PadicHodgeTheory:P7](PadicHodgeTheory.md), [PhiGammaModulesAndIwasawaCohomology:PG.2](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.4](PhiGammaModulesAndIwasawaCohomology.md), [PadicMeasuresIwasawaAlgebras:L0a](PadicMeasuresIwasawaAlgebras.md), [PadicHodgeRegulators:L4/derham-character-domain](#target-padichodgeregulators-l4-derham-character-domain), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-psi](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md), [PadicHodgeTheory:R06.3/de-rham-differential-equation](PadicHodgeTheory.md), [PadicHodgeTheory:P7/localisation-maps-p-adic-field](PadicHodgeTheory.md), [PadicHodgeTheory:P7/extended-localisation-maps](PadicHodgeTheory.md), [PadicHodgeTheory:P7/nabla-operator-on-robba-ring](PadicHodgeTheory.md).

**Sources.** [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), SectionIC2, PropositionI.13 and proof, pp.911-913: The analytic differential calculus is a substantive construction, not a formal exponent.

<a id="target-padichodgeregulators-l4-derham-regulator"></a>

### Rodrigues Jacinto de Rham regulator

Target `PadicHodgeRegulators:L4/derham-regulator` · declaration `deRhamRegulator`.

**Hypotheses.** D is de Rham; use the actual Delta, localization embeddings, q coordinates and Gauss periods G(eta)=sum eta(a) zeta_(p^c)^a. On each ball retain the threshold needed for its analytic powers. Keep phi^(-m), the residue sum modulo p^m and G(eta) at the same primitive conductor. A larger coefficient field may receive this fixed expression; it does not replace m in the formula.

For z in Delta^(psi=1) and primitive finite eta of conductor exactly p^m with m>m(Delta), define Lambda_(D,z)(eta kappa)=G(eta)^(-1) sum_(a in (Z/p^m)^times) eta(a) sigma_a [phi^(-m) kappa(partial)(1-phi)z]_0, on its admitted high-conductor ball; the exponent m is the conductor exponent of eta, not a freely enlargeable localization index. The constant term is taken in E_m tensor D_dR(D) after localization at that conductor; the sum descends to D_dR(D). These definitions glue to a rigid analytic D_dR(D)-valued function on U_D. For positive-weight D and z in D^(psi=1), use its actual inclusion in Delta; an Iwasawa version is through the proved PG.5/L2 map.

**Uses.** RJ TheoremsI.27,I.29: Supplies bad-reduction interpolation and the crystalline comparison.; Modular and Euler-system consumers via scalar projection: A differential must still be specified to obtain a scalar function.

**API.**

| Name | Contract |
| --- | --- |
| `deRhamRegulator_formula` | Its value on an admitted ball is the displayed localized constant-term Gauss sum. |
| `deRhamRegulator_linear` | It is E-linear in z; the Gamma action induces the source character-equivariance convention. |
| `deRhamRegulator_descent` | The conductor-m expression descends to D_dR(D). Embedding it in a larger coefficient field preserves its value while phi^(-m), the residue modulus and G(eta) remain at cond(eta)=p^m. |
| `deRhamRegulator_restrict` | Two admitted thresholds give equal functions on their common domain. |

**Discriminating tests.**

- `derham_zero` (degenerate): The zero psi-one vector gives the zero analytic function.
- `derham_phi_fixed` (degenerate): A psi-one vector fixed by phi is killed by 1-phi and gives zero.
- `derham_period_normalization` (computation): Replacing G(eta) by G(eta)^-1 would multiply the expression by G(eta)^2; the stated denominator is essential.
- `derham_conductor_level` (non-example): In the Gauss-sum model at p=5, let eta be the quadratic character of conductor 5. For primitive compatible roots zeta_5=zeta_25^5, sum_(a mod 5, 5 not dividing a) eta(a) zeta_5^a=G(eta) is nonzero, whereas sum_(a mod 25, 5 not dividing a) eta(a) zeta_25^a=0. Thus the normalized conductor-5 value is 1 and the imprimitive modulus-25 replacement is 0.

**Check.**

- An arbitrary analytic function with the expected values is not the construction.
- Conductor and localization enlargement are distinct: equation(3) is not invariant under replacing m by m+1 with eta unchanged.

**Construction or proof route.**

1. RJ IC4 equation(3) fixes m by cond(eta)=p^m. I.15 and I.17 establish convergence on that character ball; constant coefficients after localization at m lie in the indicated de Rham realization.
2. Changing residue representatives or embedding the fixed conductor-m expression in a larger coefficient field preserves its value. Compare admitted charts on overlaps using the proved analytic differential identities; use the Gauss-sum transformation under Gamma to prove descent and glue in actual rigid analytic weight space. Do not replace the primitive conductor by a larger imprimitive modulus.

**Dependencies.** [PadicHodgeRegulators:L4/analytic-differential-powers](#target-padichodgeregulators-l4-analytic-differential-powers), [PadicHodgeRegulators:L4/derham-character-domain](#target-padichodgeregulators-l4-derham-character-domain), [PhiGammaModulesAndIwasawaCohomology:PG.2](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5](PhiGammaModulesAndIwasawaCohomology.md), [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeTheory:P7](PadicHodgeTheory.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/integral-iwasawa-comparison](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/iwasawa-functoriality](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/finite-character-specialization](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/analytic-iwasawa](PhiGammaModulesAndIwasawaCohomology.md), [PadicHodgeTheory:R06.3/de-rham-differential-equation](PadicHodgeTheory.md), [PadicHodgeTheory:P7/localisation-maps-p-adic-field](PadicHodgeTheory.md), [PadicHodgeTheory:P7/extended-localisation-maps](PadicHodgeTheory.md), [PadicHodgeTheory:P7/nabla-operator-on-robba-ring](PadicHodgeTheory.md).

**Sources.** [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), Equation(3), TheoremI.15, LemmaI.17 and proofs, pp.914-916: Constructs the vector function and proves its admitted-domain analyticity.

<a id="target-padichodgeregulators-l4-derham-interpolation-growth"></a>

### De Rham interpolation and convergence bound

Target `PadicHodgeRegulators:L4/derham-interpolation-growth` · declaration `deRhamRegulator_interpolation`.

**Hypotheses.** D is de Rham; positivity and z in D^(psi=1) are required for I.27. Negative j belongs to the proved isomorphism range, not every j<0. All characters lie in the admitted open.

For D with nonnegative Hodge–Tate weights, z in D^(psi=1), and eta x^j in U_D with eta primitive of conductor p^n, RJ I.27 gives Lambda_(D,z)(eta x^j)=Gamma*(j+1) p^(n(j+1)) exp*(integral_G eta chi^(-j) mu_z) tensor e_(eta,-j)^(dR,dual) for j>=0, and the analogous exp^(-1) value for j sufficiently negative that the indicated Bloch–Kato exponential is bijective. Gauss bases are e_(eta,j)^dR=G(eta)t^-j e_(eta,j), dual=G(eta)^-1 t^j e_(eta^-1,-j). For general z in Delta use TheoremI.15 after nabla_h, with Gamma*(j-h+1) and j>=h or j sufficiently negative. Its growth statement is the local Robba annulus convergence estimate of LemmaI.17; it is not a global finite-order distribution bound.

**Check.**

- Do not supply an exp inverse at j=-1 merely because the negative Gamma factor exists; verify the finite-class map is bijective.

**Construction or proof route.**

1. RJ I.22-I.26 compute localized differential coefficients and compare the actual cohomological exponential/dual exponential using Nakamura’s comparison, with the source Gauss/Tate bases.
2. I.17 bounds each binomial-series term on an annulus by C+j(v_p(binom(omega_kappa,j))/j+N+C_partial), with the differential bound and domain inequality ensuring its limit tends to infinity. This is the proved local growth control.
3. For general Delta vectors use nabla_h Delta subset D (PropositionI.9) and TheoremI.15. The required Nakamura map comparison is an explicit supplier gap.

**Dependencies.** [PadicHodgeRegulators:L4/derham-regulator](#target-padichodgeregulators-l4-derham-regulator), [PadicHodgeRegulators:L3/gamma-leading-factor](#target-padichodgeregulators-l3-gamma-leading-factor), [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:L1/dual-exponential](#target-padichodgeregulators-l1-dual-exponential), [PadicHodgeRegulators:L2/character-specialisation](#target-padichodgeregulators-l2-character-specialisation), [PadicHodgeTheory:P7](PadicHodgeTheory.md), [LocallyAnalyticDistributions:L1](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L1/amice-transform](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L1/division-on-units](LocallyAnalyticDistributions.md), [PadicHodgeTheory:P7/localisation-maps-p-adic-field](PadicHodgeTheory.md), [PadicHodgeTheory:P7/extended-localisation-maps](PadicHodgeTheory.md), [PadicHodgeTheory:P7/nabla-operator-on-robba-ring](PadicHodgeTheory.md).

**Sources.** [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), LemmaI.17, PropositionsI.22-I.26, TheoremI.27 and footnotes10,25, pp.914-920: Exact integer ranges, period bases and convergence estimates.

<a id="target-padichodgeregulators-l4-crystalline-derham-comparison"></a>

### Crystalline extension of the de Rham regulator

Target `PadicHodgeRegulators:L4/crystalline-derham-comparison` · declaration `deRhamRegulator_crystalline`.

**Hypotheses.** D crystalline de Rham; z in the authentic differential module psi-one source. For the explicit I.28 formula additionally assume strictly negative phi slopes and a genuine eigenbasis, not just that eigenvalues lie in E. For the LLZ/LZ comparison retain their nonnegative/no-trivial-quotient range.

For any crystalline de Rham D and z in N_rig(D)^(psi=1), Rodrigues Jacinto TheoremI.15/CorollaryI.29 assert that Lambda_(D,z) extends from U_D to the entire weight space. In the explicitly computed subcase with strictly negative phi slopes and an eigenbasis after finite coefficient extension, write z=sum A_lambda_i tensor e_i, phi(e_i)=alpha_i e_i and psi(lambda_i)=alpha_i lambda_i. PropositionI.28 identifies its value at ramified eta x^j, j>0, with sum_i alpha_i^-n (integral_Zp^times eta^-1 x^j lambda_i)e_i. This analytic integral expression gives the global extension in that subcase. The broader crystalline extension requires a proof of the reductions beyond that subcase; it is recorded as a gap, rather than deleting the source’s general target. On the common L3 range, the comparison to the LLZ/LZ regulator is a map-level equality after explicitly converting the Amice/Mellin, inverse finite-character and Gauss/Tate period conventions.

**Check.**

- A general de Rham D has no alpha_i eigenbasis in D_dR and does not satisfy this global-extension theorem.

**Construction or proof route.**

1. RJ IC9 identifies N_rig(D) with the crystalline period module; under negative slopes the psi-one vectors lie in the positive Robba part. In an eigenbasis apply PropositionI.28’s Amice integral expression, which is analytic on the whole weight space.
2. The printed CorollaryI.29 asserts the general crystalline case, although this argument was introduced in a strict-slope eigenbasis subcase. Supply an explicit twist/nonsemisimple reduction or alternate proof as the recorded follow-up input.
3. Compare ramified integral characters with LZ B.5, carrying actual alpha powers, coefficient embeddings, and Gauss/Tate dual bases through the Fourier/Mellin square. Prove equality by analytic uniqueness on a justified dense subset of each admitted ball.

**Dependencies.** [PadicHodgeRegulators:L4/derham-regulator](#target-padichodgeregulators-l4-derham-regulator), [PadicHodgeRegulators:L4/derham-interpolation-growth](#target-padichodgeregulators-l4-derham-interpolation-growth), [PadicHodgeRegulators:L3/ramified-interpolation](#target-padichodgeregulators-l3-ramified-interpolation), [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/character-specialisation](#target-padichodgeregulators-l2-character-specialisation), [LocallyAnalyticDistributions:L3/unbounded-component-mellin](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/bounded-mellin-characterisation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-character-evaluation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-convolution](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-generator-change](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-weight-derivative](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-twist](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-pushforward](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-coefficient-extension](LocallyAnalyticDistributions.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md).

**Sources.** [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), TheoremI.15, p.914; SectionIC9, PropositionI.28, CorollaryI.29, p.920: Precisely states the crystalline subrange in which a global extension is proved.

<a id="target-padichodgeregulators-l4-split-multiplicative-augmentation"></a>

### Split multiplicative Coleman augmentation

Target `PadicHodgeRegulators:L4/split-multiplicative-augmentation` · declaration `rubinColemanMap_augmentation`.

**Hypotheses.** Use the source, differential, roots, indexing and lattice of rubinColemanMap. Split multiplicative reduction gives alpha=1,beta=p.

For an elliptic curve A with split multiplicative reduction at odd p, the actual Col_infty:H^1_(infty,s)(Q_p,T_p A)->Lambda is injective and its image is contained in the augmentation ideal ker(Lambda->Z_p). This is containment, not image equality or an exceptional-zero derivative formula.

**Check.**

- Nonsplit alpha=-1 does not force augmentation zero. A derivative or L-invariant theorem needs its own additional input.

**Construction or proof route.**

1. Specialize the authentic formula at chi=1: (1-alpha^-1)=0, while (1-beta^-1)=1-p^-1 is nonzero. The value vanishes; the bounded character value is the augmentation. Injection is the previously constructed map’s theorem.

**Dependencies.** [PadicHodgeRegulators:L3/rubin-coleman-map](#target-padichodgeregulators-l3-rubin-coleman-map), [PadicMeasuresIwasawaAlgebras:L2](PadicMeasuresIwasawaAlgebras.md).

**Sources.** [Rubin2000](https://swc-math.github.io/notes/files/99RubinES.pdf), III Section5.8, Proposition5.14(b), printed p.52: The split-multiplicative augmentation property, with its weaker image assertion.
<a id="stage-d5"></a>

## D.5 — Curve, relative and semistable regulators

For K/Q_p unramified of degree f, set P=φ_p/p², Φ=φ_p^f, q=p^f, A=1−P, B=1−Φ/q² and N_f=Σ_{j=0}^{f−1}P^j. Then B=N_f A. The norm comparison β satisfies βj_p=j_qN_f, and Θ=B^{-1}j_q^{-1}β=A^{-1}j_p^{-1}. The canonical K-linear coordinate is ι=β^{-1}j_q with transported K-action. Thus regSynCan=(1−Φ/q²)regP and log_BK r_et=regP. For f>1 the raw p-Frobenius boundary is not this canonical K-linear coordinate. Relative and semistable targets below retain the additional hypotheses needed for their different complexes.

**Planets:** Weight-two syntomic cohomology of curves; Syntomic regulator on K₂ of curves; Besser's symbol formula; Relative syntomic regulator of curve symbols; Specialization of syntomic regulators; Semistable symbol formula for the continuous regulator.

<a id="target-padichodgeregulators-d-5-curve-weight-two-target"></a>

### The weight-two syntomic target of a curve and its two identifications

Target `PadicHodgeRegulators:D.5/curve-weight-two-target` · declaration `curveSyntomicTarget`.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K).

Let K/Q_p be finite unramified of degree f, q=p^f, and 𝒳/O_K a smooth proper geometrically connected curve, X=𝒳_K. Set H=H¹_dR(X/K)=H¹_rig(𝒳_k/K), Φ=φ_p^f (K-linear), P=φ_p/p² (Q_p-linear), A=1−P, Q=Φ/q²=P^f, B=1−Q, and N_f=Σ_{j=0}^{f−1}P^j, so B=N_f A. The rigid syntomic complex is Besser’s full filtered homotopy fibre product, not a single cone on H. Map its Frobenius-cone component to the fixed-q modified model by (id,N_f), with identity on the other fibre-product legs. This induces β:H²_syn,rig(𝒳,2)→H²_ms,q(𝒳,2). Let j_q:H→H²_ms,q be the raw boundary [(0,ε)], and j_p:H→H²_syn,rig the raw boundary in the collapsed unramified model. Curve weights and Fil²H¹=Fil²H²=0 give isomorphisms β,j_p,j_q,A,B, with βj_p=j_qN_f. The normalized identification is Θ=B⁻¹j_q⁻¹β=A⁻¹j_p⁻¹. Transport the K-module structure on the initially Q_p-linear rigid target through Θ. The fixed-q canonical boundary is ι=β⁻¹j_q, a K-linear equivalence with this transported structure, and Θ=B⁻¹ι⁻¹. For f>1, ι need not equal j_p. The alternating trace pairing on H satisfies B_cup(Φa,Φb)=q B_cup(a,b) and its second-kind residue formula.

**Uses.** Asakura–Miyatani, Theorem 9.1: Tr_C(Θ(reg_syn{f, g}) ∪ [ω]) = (r_p{f, g})(ω); EllipticRegulators:ER.8/good-reduction-elliptic-pairing: the Coleman formula for the weight-two elliptic regulator, which holds for Θ, not for ι^{−1}; EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: the Frobenius factor (1 − p^{−2}Φ) between the canonical and normalised identifications

**API.**

| Name | Contract |
| --- | --- |
| `curveSyntomicTarget` | curveSyntomicTarget 𝒳 := H^2_syn(𝒳, 2). |
| `curveSyntomicCanIso` | ι=β⁻¹j_q:H≃ₗ[K]H²_syn,rig, with K-scalars transported by Θ; it is the fixed-q raw boundary, not necessarily j_p. |
| `curveSyntomicNormIso` | Θ=B⁻¹ι⁻¹=B⁻¹j_q⁻¹β=A⁻¹j_p⁻¹; it is the inverse normalized boundary. |
| `cupTrace` | cupTrace X : LinearMap.BilinForm K (H1dR X), alternating. |
| `cupTrace_frob` | cupTrace (φ a) (φ b) = q • cupTrace a b. |
| `cupTrace_res_sum` | For second-kind forms, cupTrace [dF] [dG] = Σ_x Res_x(F dG). |
| `cupTrace_eigen` | If cupTrace is a q-similitude for φ and φ v = γ v (γ ≠ 0), then cupTrace (φ a) v = (q/γ)·cupTrace a v. |
| `curveSyntomicTarget_extensionality` | The canonical/normalized equivalences are determined by their values on cohomology classes, and cupTrace by its values on pairs. Require the explicit comparison maps before transporting the K-module structure. |
| `curveRigidToModified` | β is induced by (id,N_f) on the Frobenius cone and identity on the other homotopy-fibre-product legs. |
| `curveRigidToModified_raw` | βj_p=j_qN_f; βδ_rig=δ_ms for δ_rig=j_pA and δ_ms=j_qB. |
| `curveSyntomicNormIso_p` | Θ=A⁻¹j_p⁻¹ as a Q_p-linear map; this determines the transported K-module structure. |

**Discriminating tests.**

- `curveTarget_projective_line` (computation): For 𝒳 = P^1_{O_K}, curveSyntomicTarget 𝒳 = 0.
- `curveTarget_weight_one_analogue` (degenerate): In weight one for Spec O_K (i = n = 1), the normalised class of a unit u is log u while the canonical class is (1 − 1/q)·log u.
- `curveTarget_eigen_factor` (compatibility): If φv = γv then B(φa, v) = (q/γ)B(a, v); for p = q = 5 and γ = 2, (1 − 1/(pγ)) = 9/10 is the factor between canonical and normalised pairings.
- `curveTarget_h2_non_example` (non-example): For H^3_syn(𝒳, 1) the operator 1 − φ/q on H^2_rig(𝒳_k) is zero (φ = q there), so no normalised identification exists; Besser–de Jeu Definition 4.6 requires n ≥ i > dim.
- `curveTarget_nontrivial_residue_degree` (compatibility): For f=2, N_f=1+P, B=1−P²=(1+P)A, βj_p=j_q(1+P); substituting j_p for ι omits a norm operator.
- `curveTarget_semilinear_non_example` (non-example): For f>1 and a∈K with σ(a)≠a, P(av)=σ(a)P(v), so A(av) need not equal aA(v); K-linearity is obtained by Θ-transport, not by calling A K-linear.

**Check.**

- 𝒳 = P^1: H^1_dR = 0 and the target is 0.
- For an elliptic curve y² = x³ + ax + b, ω = dx/2y and η = x dx/2y: B(ω, η) = 1 (residue at ∞ with local parameter −x/y).

**Construction or proof route.**

1. In Besser Proposition 8.6(2), pp. 26–27, replace the p-Frobenius cone by the q-Frobenius cone using its norm operator N_f. The equality 1−P^f=N_f(1−P) gives the chain map; its source leg is id and its shifted target leg is N_f. Keep identity on the rigid comparison target of the full homotopy fibre product. This explicitly defines β before identifying cohomology.
2. Proposition 8.6(3), pp. 27–28, supplies the normalized boundary δ_rig; for a proper curve n=i=2 the exceptional degrees i,i−1,i−2 are all different from 2n. Remark 8.7(3), p. 28, identifies δ_rig=j_p A. The modified normalized boundary is δ_ms=j_q B. The cone map makes βδ_rig=δ_ms, hence βj_p=j_qN_f. Weight-one Frobenius eigenvalues on H exclude eigenvalue 1 for P or Q; A,B,N_f are invertible as Q_p-linear maps. Consequently β is an isomorphism in degree two.
3. At a further q-power model the transition norm cancels against its normalized boundary (Besser Proposition 10.1(3), p. 34); thus Θ agrees with the colimit modified-syntomic identification, not just an arbitrary fixed-model inverse. Besser–de Jeu Definition 4.6, p. 24, writes the same B⁻¹ correction on [(0,ε)]. Transport K-scalars through Θ; then ι is K-linear because B is K-linear. Do not describe A as K-linear when f>1.
4. Use the imported rigid trace/Poincaré-duality pairing for the q-similitude, and Ara2003 Lemma 3.3 for its residue realization.

**Dependencies.** [PadicHodgeRegulators:D.2/rigid-syntomic-cohomology](#target-padichodgeregulators-d-2-rigid-syntomic-cohomology), [PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology](PadicDifferentialEquationsAndRigidCohomology.md), [PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology](PadicDifferentialEquationsAndRigidCohomology.md), [PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction](PadicHodgeTheory.md), [ColemanIntegration:L0/annulus-residue](ColemanIntegration.md).

**Sources.** [BdJ2003](https://arxiv.org/abs/math/0110334v2), Definition 4.6, p. 24: The normalised identification.; [Ara2003](https://arxiv.org/abs/math/0301029v1), Lemma 3.3, p. 8: The residue formula for the cup product.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Proposition 8.6(3), Remark 8.7(3) and Proposition 10.1(3), author PDF pp. 26–28,34: The normalized map and the raw modified-model map differ by the factors specified in the target and its proof route.

<a id="target-padichodgeregulators-d-5-open-curve-splitting"></a>

### The Frobenius splitting for an open curve

Target `PadicHodgeRegulators:D.5/open-curve-splitting` · declaration `openCurveSplitting`.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). (𝒳, D) a good-reduction pair; D finite étale over O_K.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let (𝒳, D) be a good-reduction pair (ColemanIntegration:L1/good-reduction-pair) with D finite étale over O_K and Y = 𝒳 ∖ D. Then H̃^2_ms(Y, 2) = Ω^†(Y)/dA^†(Y) = H^1_dR(A^†(Y)), the restriction res : H^1_dR(X) → H^1_dR(Y) is φ-equivariant and injective, and there is a unique φ-equivariant retraction p_D : H^1_dR(Y) → H^1_dR(X) (H^1(X) has Frobenius weight 1 and the cokernel of res, spanned by residues, weight 2). p_D does not depend on the Frobenius lift and is compatible with enlarging D.

**Uses.** PadicHodgeRegulators:D.5/curve-syntomic-regulator: the regulator of a symbol on Y is projected to X by p_D; Besser–de Jeu 2012, (9.13): p is the unique map with (pη) ∪ [ω] = ⟨F_η, F_ω⟩_gl for ω of the second kind holomorphic on U

**API.**

| Name | Contract |
| --- | --- |
| `openCurveSplitting` | openCurveSplitting 𝒳 D : H1dR (Y) →ₗ[K] H1dR X. |
| `openCurveSplitting_comp_res` | openCurveSplitting 𝒳 D ∘ res = id. |
| `openCurveSplitting_frob` | openCurveSplitting commutes with φ and is the unique such retraction. |
| `openCurveSplitting_mono` | For D ⊆ D', openCurveSplitting 𝒳 D' ∘ res_{Y,Y'} = openCurveSplitting 𝒳 D. |
| `openCurveSplitting_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `splitting_p1` (computation): For P^1 and D = {0, ∞}, openCurveSplitting = 0.
- `splitting_empty_boundary` (degenerate): For D = ∅ (Y = X), openCurveSplitting = id.
- `splitting_res_compat` (compatibility): openCurveSplitting 𝒳 D ∘ res = id on H1dR X.
- `splitting_not_residue_free` (non-example): For X=P¹ and D={0,∞}, dlog(t) has nonzero boundary residues and projects to 0, while residue-free cohomology is the image of H¹(X), not a proposed complementary subspace. A rule equating the complementary summand with residue-free cohomology is therefore wrong.

**Check.**

- P^1 with D = {0, ∞}: H^1_dR(Y) = K·dt/t, φ^* = q on it, and p_D = 0.
- For an elliptic curve and D = {O}, p_D is the identity on H^1_dR(Y) = H^1_dR(X).

**Construction or proof route.**

1. The Gysin/residue sequence 0 → H^1(X) → H^1(Y) → K^{D}(−1) → K identifies the cokernel of res with residues, on which φ acts with weight 2.
2. Weights differ, so the φ-stable complement of res(H^1(X)) is unique; p_D is the projection along it (Besser–de Jeu 2012, p. 4, citing Besser's K_2 paper, Proposition 4.8).
3. Independence of the lift: two lifts induce homotopic maps on overconvergent de Rham complexes.

**Dependencies.** [ColemanIntegration:L1/good-reduction-pair](ColemanIntegration.md), [ColemanIntegration:L1/wide-open-neighbourhood](ColemanIntegration.md), [ColemanIntegration:L1/frobenius-lift](ColemanIntegration.md), [PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison](PadicDifferentialEquationsAndRigidCohomology.md), [PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology](PadicDifferentialEquationsAndRigidCohomology.md), [PadicHodgeRegulators:D.5/curve-weight-two-target](#target-padichodgeregulators-d-5-curve-weight-two-target), [PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lifts-induce-homotopic-maps](PadicDifferentialEquationsAndRigidCohomology.md).

**Sources.** [BdJ2012](https://arxiv.org/pdf/1208.0516v1), §1, pp. 4–5: The projection p_D from the open curve, from Besser's K_2 paper.

<a id="target-padichodgeregulators-d-5-curve-syntomic-regulator"></a>

### The degree-two syntomic regulator of a curve

Target `PadicHodgeRegulators:D.5/curve-syntomic-regulator` · declaration `curveSyntomicRegulator`.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). (𝒳, D) a good-reduction pair containing the supports of all f_i, g_i.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). For u ∈ K_2(𝒳)^{(2)} ⊗ Q define reg_syn(u) ∈ H^2_syn(𝒳, 2) by the syntomic Chern class of D.2/syntomic-regulator, and put regSynCan(u) := ι^{−1}(reg_syn(u)) and regP(u) := Θ(reg_syn(u)) = (1 − φ/q²)^{−1}regSynCan(u) in H^1_dR(X/K). If the restriction of u to Y = 𝒳 ∖ D is a finite sum Σ n_i{f_i, g_i} of symbols with f_i, g_i ∈ O(Y)^×, then regSynCan(u) = p_D[Σ_i n_i ε(f_i, g_i)] with ε(f, g) := q^{−2}·log(f_0)·φ^*dlog g − q^{−1}·log(g_0)·dlog f, f_0 := f^q/φ^*f (a class in H̃^2_ms(Y, 2) = H^1_dR(A^†(Y))), and regP(u) = p_D((1 − φ^*/q²)^{−1}[Σ_i n_i ε(f_i, g_i)]). This gives the full 2g-coordinate regulator vector, not only its pairing with holomorphic forms.

**Uses.** EllipticRegulators:ER.8/the-syntomic-comparison: reg_p : K_2(E) ⊗ Q → H^1_dR(E/Q_p) of a curve with good reduction, specialised to ER's classes; EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: reg_syn(u) = (1 − p^{−2}Φ)z with z = log_BK(reg_et(u)); PadicHodgeRegulators:D.5/coleman-symbol-formula: the pairing of regP with holomorphic forms

**API.**

| Name | Contract |
| --- | --- |
| `curveSyntomicRegulator` | curveSyntomicRegulator 𝒳 : K_2(𝒳)^{(2)}_ℚ →ₗ[ℚ] curveSyntomicTarget 𝒳. |
| `regSynCan` | regSynCan := canIso⁻¹ ∘ curveSyntomicRegulator. |
| `regP` | regP := normIso ∘ curveSyntomicRegulator. |
| `regSynCan_eq_frob_regP` | regSynCan u = (1 − q⁻² • φ) (regP u). |
| `regP_symbol` | On a symbol presentation on Y, regP u = openCurveSplitting ((1 − φ^*/q²)⁻¹ [Σ n_i ε(f_i, g_i)]). |
| `regSynCan_pairing_eigen` | For φ v = γ v: cupTrace (x − q^{−2}φ x) v = (1 − 1/(qγ))·cupTrace x v, the pairing form of regSynCan = (1 − φ/q²)·regP. |
| `curveSyntomicRegulator_weight_three` | The weight-three part of K_2(𝒳) ⊗ Q maps to 0 (H^4_syn(𝒳, 3)-target vanishes for a curve). |
| `curveSyntomicRegulator_extensionality` | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Discriminating tests.**

- `regulator_constant_symbol` (computation): For c ∈ μ_{q−1}, regSynCan {f, c} = 0.
- `regulator_diagonal_symbol` (degenerate): regSynCan {f, f} = 0.
- `regulator_eigen_compat` (compatibility): If φv = γv, B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v) for K = Q_p.
- `regulator_canonical_not_coleman` (non-example): Feeding regSynCan instead of regP into the Coleman symbol formula is off by (1 − φ/q²); on an eigen-pairing by the factor (1 − 1/(pγ)).

**Check.**

- For c ∈ μ_{q−1}: c_0 = 1 and dlog c = 0, so regSynCan({f, c}) = 0.
- {f, f}: ε = −q^{−2}·d(½ log(f_0)²) is exact, so the regulator vanishes.

**Construction or proof route.**

1. The syntomic Chern class on K_2 is the cup product of the K_1 classes reg(f) = (dlog f, log(f_0)/q) (Besser–de Jeu 2003 Lemma 4.7, citing Besser 2000 Proposition 10.3).
2. On Y with a Frobenius lift the cup product of two such classes is represented by ε(f, g) in Ω^†(Y)/dA^†(Y) (Besser–de Jeu 2012 (5.1)–(5.2); Asakura–Miyatani Proposition 6.4).
3. Restrict u first from the regular integral model 𝒳 to its generic fibre X. The localization sequence of EllipticKTheory:E.3 applies to this curve over K and gives trivial tame symbols along D_K for the restricted class; it is not a localization theorem for the two-dimensional scheme 𝒳. Under the stated integral good-pair symbol presentation, p_D returns the regulator class to X. The weight-two source on 𝒳 uses SchemeKTheoryOperations:S.6/soule-scheme-operations; EllipticKTheory:E.4 applies only after restriction to X.

**Dependencies.** [PadicHodgeRegulators:D.5/curve-weight-two-target](#target-padichodgeregulators-d-5-curve-weight-two-target), [PadicHodgeRegulators:D.5/open-curve-splitting](#target-padichodgeregulators-d-5-open-curve-splitting), [PadicHodgeRegulators:D.2/syntomic-regulator](#target-padichodgeregulators-d-2-syntomic-regulator), [EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition](EllipticKTheory.md), [EllipticKTheory:E.3/localisation-sequence-for-a-curve](EllipticKTheory.md), [K2SymbolsBrauer:T.3/tame-symbol](K2SymbolsBrauer.md), [SchemeKTheoryOperations:S.6/soule-scheme-operations](SchemeKTheoryOperations.md).

**Sources.** [AM18](https://arxiv.org/abs/1711.08854v2), Proposition 6.4, p. 34: The hypothesis under which H^2 rigid syntomic cohomology is identified with H^1_rig (the sentence continues with the isomorphism).; [BdJ2003](https://arxiv.org/abs/math/0110334v2), Lemma 4.7, p. 24: The K_1 regulator cocycle (f_0 = f^q/φ^*f) whose cup product gives ε(f, g).; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Proposition 10.3, author PDF p. 35: The normalized map and the raw modified-model map differ by the factors specified in the target and its proof route.

<a id="target-padichodgeregulators-d-5-coleman-symbol-formula"></a>

### Besser's Coleman-integral formula for the regulator of a symbol

Target `PadicHodgeRegulators:D.5/coleman-symbol-formula` · declaration `coleman_symbol_formula`.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). All supports in a finite étale D; ω holomorphic.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let u ∈ K_2(𝒳)^{(2)} ⊗ Q restrict on Y = 𝒳 ∖ D to Σ_i n_i{f_i, g_i} with f_i, g_i ∈ O(Y)^× and (𝒳, D) a good-reduction pair containing all supports, and let ω ∈ H^0(X, Ω^1). Then B(regP(u), [ω]) = Σ_i n_i Σ_{x ∈ |D_K|} ord_x(f_i)·Tr_{K(x)/K}(CT_x(∫ log(g_i)·ω)), where ∫ log(g_i)ω is the Coleman integral (ColemanIntegration:L1/coleman-integral) and CT_x the log-free constant term at x in a local parameter (after a finite extension, descending by Galois equivariance). The value is independent of the branch of the logarithm and of the constant of integration. Equivalently Tr_X(Θ(reg_syn{f, g}) ∪ [ω]) = ∫_{(f)} log(g)ω (Coleman–de Shalit's p-adic regulator). The formula holds for Θ = regP, not for the canonical regSynCan.

**Check.**

- The tests of EllipticRegulators:ER.8/good-reduction-elliptic-pairing hold with regP.
- With regSynCan the formula fails by (1 − φ/q²) (EllipticRegulators F1 in the handoff).

**Construction or proof route.**

1. Besser, Syntomic regulators and p-adic integration II, Theorem 3 (as restated by Asakura–Miyatani Theorem 9.1 and Besser–de Jeu 2012 Remark 1.10).
2. Pairing the cocycle ε(f, g) of D.5/curve-syntomic-regulator with ω: the Coleman primitive F_ω and the double index ⟨ , ⟩_gl reduce the cup product to residues at D (Besser, p-adic Arakelov theory, Lemma 3.3), giving Σ ord_x(f)·F_{log g ω}(x).
3. Independence of branch and constant: Weil reciprocity and trivial tame symbols (K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form) kill the ambiguity.

**Dependencies.** [PadicHodgeRegulators:D.5/curve-syntomic-regulator](#target-padichodgeregulators-d-5-curve-syntomic-regulator), [ColemanIntegration:L1/coleman-integral](ColemanIntegration.md), [ColemanIntegration:L1/locally-analytic-log-functions](ColemanIntegration.md), [ColemanIntegration:L1/branch-independence-principle](ColemanIntegration.md), [ColemanIntegration:L0/log-branch-field-compatibility](ColemanIntegration.md), [K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form](K2SymbolsBrauer.md), [EllipticKTheory:E.7/symbol-certificates](EllipticKTheory.md).

**Sources.** [AM18](https://arxiv.org/abs/1711.08854v2), Theorem 9.1, p. 45: The formula (= Besser II Theorem 3, unramified K).; [BdJ2012](https://arxiv.org/pdf/1208.0516v1), Remark 1.10, p. 4: The Coleman–de Shalit form, known to be the syntomic regulator by Besser.

<a id="target-padichodgeregulators-d-5-curve-etale-comparison"></a>

### The curve regulator and the Bloch–Kato logarithm

Target `PadicHodgeRegulators:D.5/curve-etale-comparison` · declaration `curve_etale_comparison`.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). The p-power eigenvector-pairing clause is restricted to K=Q_p. For general unramified K use K-linear Φ and the factor 1−1/(qγ).

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Put V = H^1_et(X_K̄, Q_p(2)), a crystalline representation with D_cris(V) = H^1_dR(X/K) ⊗ e_2 and V^{G_K} = 0. For u ∈ K_2(𝒳)^{(2)} ⊗ Q the étale regulator r^et(u) ∈ H^1(K, V) lies in H^1_f = H^1_e, and regP(u) = log_BK(r^et(u)) under D_dR(V)/Fil^0 = H^1_dR(X/K); equivalently regSynCan(u) = (1 − Φ/q²)·log_BK(r^et(u)) for every such K, where Φ=φ_p^f and regSynCan uses the fixed-q boundary ι=β⁻¹j_q. For K=Q_p this is 1−φ_p/p². For K=Q_p, if φ_p v = γv then B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v).

**Check.**

- For E/Q_p with good reduction and v a φ-eigenvector with eigenvalue γ: Tr(regSynCan(z) ∪ v) = (1 − p^{−1}γ^{−1})Tr(log reg_f(z) ∪ v) (Asakura–Chida footnote 4).
- This resolves the normalisation required by EllipticRegulators:ER.8/elliptic-syntomic-etale-factor.

**Construction or proof route.**

1. Besser Proposition 9.11, author p. 32, identifies the arithmetic étale edge applied to δ_rig(x) with exp_BK(x). The good-reduction comparison D.2 is normalized by this same boundary; it does not identify a raw cone coordinate with the exponential.
2. By the explicit norm-map square of curve-weight-two-target, δ_rig=j_pA=β⁻¹j_qB=ιB. Therefore δ_rig⁻¹=Θ over every finite unramified K. For u this gives r_et(u)=exp_BK(Θreg_syn(u)). Curve weights give D_cris(V)^{φ=1}=0 and V^{G_K}=0, so exp_BK is injective and H_e=H_f; invert it to obtain regP=log_BK r_et.
3. The fixed-q canonical coordinate is B regP. Pairing with a Φ-eigenvector uses the q-similitude, hence factor 1−1/(qγ). The p-specialization in AC20 footnote 4 is a check, not the proof for f>1.

**Dependencies.** [PadicHodgeRegulators:D.5/curve-syntomic-regulator](#target-padichodgeregulators-d-5-curve-syntomic-regulator), [PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison](#target-padichodgeregulators-d-2-syntomic-etale-regulator-comparison), [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:L1/dimension-formulas](#target-padichodgeregulators-l1-dimension-formulas), [PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction](PadicHodgeTheory.md).

**Sources.** [AC20](https://arxiv.org/pdf/2003.08888v2), Footnote 4, p. 43: The canonical form of the comparison.; [NN2016](https://arxiv.org/abs/1309.7620v5), Proposition 1.1, p. 3: The general comparison.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Proposition 9.11, author PDF p. 32: The normalized map and the raw modified-model map differ by the factors specified in the target and its proof route.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Proposition 8.6(2),(3), Remark 8.7(3), Proposition 9.11 and Proposition 10.1(3), author pp. 26–28,32,34: The explicit norm-chain-map square transports the normalized exponential identity to any unramified residue degree.

<a id="target-padichodgeregulators-d-5-curve-regulator-functoriality"></a>

### Pullback, pushforward and base change of the curve regulator

Target `PadicHodgeRegulators:D.5/curve-regulator-functoriality` · declaration `curve_regulator_functoriality`.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). π finite flat between smooth proper curves over O_K.

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let π : 𝒳' → 𝒳 be a finite flat morphism of good-reduction curves. (a) Pullback: regP(π^*u) = π^*regP(u), and B'(π^*a, π^*b) = deg(π)·B(a, b). (b) Pushforward: regP(π_*u') = π_*regP(u') with π_* the de Rham trace, characterised by B(π_*a', b) = B'(a', π^*b); at the level of symbols ∫_{(π^*f)} log(g)·π^*ω = ∫_{(f)} log(N g)·ω. (c) Base change: for K'/K finite unramified, regP(u|_{𝒳_{O_{K'}}}) = regP(u) ⊗ 1, and the transfer N_{K'/K} corresponds to Tr_{K'/K}. These base-change and transfer assertions use the normalized regP. If d=[K′:K], q′=q^d and Φ′=Φ^d on the base-changed cohomology, the raw fixed-Frobenius coordinate instead satisfies regSynCan,K′(u|K′)=N_d·(regSynCan,K(u)⊗1), with N_d=Σ_{j=0}^{d−1}(Φ/q²)^j. This is the identity 1−(Φ/q²)^d=N_d(1−Φ/q²); raw transfer likewise requires normalization. Part (b) at the level of syntomic cohomology is recorded as a gap: no source read proves pushforward compatibility for rigid syntomic regulators; it follows from (a) and the projection formula on the image of pullback, and in general from the étale comparison D.5/curve-etale-comparison and corestriction compatibility of r^et.

**Check.**

- For π multiplication by n on an elliptic curve: regP(π^*u) = π^*regP(u) and π^* acts on H^1_dR by n.
- For a Fermat-curve quotient the symbol identity ∫_{(π^*f)} log(g)π^*ω = ∫_{(f)} log(Ng)ω holds.
- For an unramified quadratic base change, regSynCan,K′=(1+Φ/q²)·regSynCan,K after scalar extension. A proposed raw-coordinate equality without this factor fails on a nonzero Φ-eigenvector unless Φ/q² acts by zero on it.

**Construction or proof route.**

1. (a) Naturality of syntomic Chern classes and of the identification Θ under pullback; the similitude is Besser's p-adic Arakelov theory Lemma 3.6.
2. (b) Adjunction of trace and pullback (p-adic Arakelov theory Lemma 3.7); for the regulator itself, use D.5/curve-etale-comparison: r^et commutes with pushforward (corestriction on H^1(K, H^1_et)) and log_BK commutes with corestriction/trace (L1/twist-and-change-of-field).
3. (c) Base change of rigid cohomology and of Coleman integration (ColemanIntegration:L0/log-branch-field-compatibility). Besser Proposition 8.6(2),(3) and Remark 8.7(3) track the norm map when the Frobenius iterate changes: Θ normalizes it to ordinary base change, while the raw coordinate acquires N_d.

**Dependencies.** [PadicHodgeRegulators:D.5/curve-syntomic-regulator](#target-padichodgeregulators-d-5-curve-syntomic-regulator), [PadicHodgeRegulators:D.5/curve-etale-comparison](#target-padichodgeregulators-d-5-curve-etale-comparison), [SchemeKTheoryOperations:S.2/k-theory-pullback](SchemeKTheoryOperations.md), [SchemeKTheoryOperations:S.2/k-theory-proper-pushforward](SchemeKTheoryOperations.md), [SchemeKTheoryOperations:S.2/projection-formula](SchemeKTheoryOperations.md), [EllipticKTheory:E.3/naturality-for-finite-pullback](EllipticKTheory.md), [EllipticKTheory:E.3/naturality-for-finite-transfer](EllipticKTheory.md), [ColemanIntegration:L1/coleman-pullback](ColemanIntegration.md), [PadicDifferentialEquationsAndRigidCohomology:RD.4/de-rham-trace](PadicDifferentialEquationsAndRigidCohomology.md), [PadicDifferentialEquationsAndRigidCohomology:RD.4/functoriality-of-rigid-cohomology](PadicDifferentialEquationsAndRigidCohomology.md).

**Sources.** [Ara2003](https://arxiv.org/abs/math/0301029v1), Lemmas 3.6–3.7, p. 8: Pullback similitude; Lemma 3.7 gives the trace adjunction.; [Besser2000](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz), Proposition 8.6(2),(3) and Remark 8.7(3), author pp. 26–28: The norm map for changing the Frobenius iterate gives the raw-coordinate factor; the normalized comparison removes it.

<a id="target-padichodgeregulators-d-5-semistable-input-boundary"></a>

### What bad or semistable reduction requires beyond good reduction

Target `PadicHodgeRegulators:D.5/semistable-input-boundary` · declaration `semistable_input_boundary`.

**Hypotheses.** X/K smooth proper with semistable reduction.

For a smooth proper semistable curve X/K, NN Theorems A,B provide rational syntomic cohomology and compatible Chern classes; the arithmetic regulator factors through H¹_st(G_K,H¹_et(X_K̄,Q_p(2))). The semistable comparison imports the Hyodo–Kato (φ,N) structure from CohomologyComparisons CP.4. Besser–Zerbes Theorem 1.1 identifies Vologodsky integration with appropriately corrected/glued Coleman primitives on semistable curves. These two results alone do not give the weight-two symbol formula. The regulator-specific continuous/discrete coordinates and full second-kind pairing are specified by D.5/semistable-continuous-regulator and D.5/semistable-symbol-formula, using Besser2025 and BR2019. Those targets pair the continuous component with ker N and determine its class modulo im N; ker N is a restriction on test forms, not the regulator domain. The generic integration and syntomic producers remain external requests.

**Check.**

- Tate curve: the Coleman integrals become branch dependent, and the Vologodsky integral selects log_q (Besser–Zerbes §3).
- The good-reduction formula of D.5/coleman-symbol-formula is not asserted for any semistable curve.

**Construction or proof route.**

1. Import NN Theorems A,B, with the corrected degree H^i in Theorem 5.9; the factorization is into semistable cohomology, not an immediate H¹_dR identification.
2. Read Besser–Zerbes Theorem 1.1 as an integration comparison supplying glued primitives and harmonic corrections. Keep this input boundary separate from the source-supported regulator coordinates and formula in the two regulator-specific nodes; their integration producers belong to ColemanIntegration Part II.

**Dependencies.** [PadicHodgeRegulators:D.2/log-syntomic-complex](#target-padichodgeregulators-d-2-log-syntomic-complex), [PadicHodgeRegulators:D.2/syntomic-exponential](#target-padichodgeregulators-d-2-syntomic-exponential), [CohomologyComparisons:CP.4](CohomologyComparisons.md), [PadicHodgeRegulators:D.5/coleman-symbol-formula](#target-padichodgeregulators-d-5-coleman-symbol-formula).

**Sources.** [NN2016](https://arxiv.org/abs/1309.7620v5), Theorem B, p. 7: The semistable factorisation.; [BZ2017](https://arxiv.org/abs/1711.06950v1), Theorem 1.1, p. 2: Vologodsky integrals versus glued Coleman integrals.

<a id="target-padichodgeregulators-d-5-relative-curve-syntomic-regulator"></a>

### The relative symbol regulator of a smooth curve family

Target `PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator` · declaration `relativeCurveSyntomicRegulator`.

**Hypotheses.** W=W(k) with k perfect of characteristic p≥3, K=Frac W; S=Spec B smooth affine over W, U=Spec A smooth affine over S. Use AM Theorem 3.7’s projective compactification Y→Q, boundary D∪f⁻¹(T) relative simple normal crossings, log-smooth (Y,M)→(Q,L), and a compatible system σ of p-Frobenius lifts on Q. AM Assumption 2.20: relative overconvergent rigid cohomology is coherent and compares to algebraic relative de Rham cohomology. Fil²H²_dR(U/S)=0; for the comparison, H¹ and H² of the truncated relative log de Rham complex ≥2 vanish modulo every p^m. For the proper refinement use exactly AM §4.1: Q is a smooth affine curve over W, T⊂Q is finite étale over W, S=Q\T, Y is a smooth quasi-projective surface over W, and f:Y→Q is projective and surjective with connected fibres. The deleted divisor D_X⊂X=Y\f⁻¹(T) is finite étale over S; U=X\D_X is affine. The vertical and horizontal boundary has relative simple normal crossings, the family is smooth over S, and every irreducible component of a singular fibre has multiplicity prime to p. The domain is ker ∂⊂K²_M(A), not all proper K₂ classes.

Under the stated compactification, coherence and filtration assumptions, construct [−]_{U/S}:K²_M(A)→Ext¹_{Fil-F-MIC(S,σ)}(O_S,H¹(U/S)(2)). It factors the cup-symbol extension through Milnor bilinearity and Steinberg relations. Its Frobenius coordinate R_σ takes values in B†_K⊗_{B_K}H¹_dR(U/S); its Gauss–Manin coordinate is σ-independent, while R_σ depends on σ. For a smooth proper curve family X/S, classes in K²_M(A)_{∂=0} uniquely lift to extensions by H¹(X/S)(2). With the extra truncated-complex hypotheses, R_σ[ξ] is the NEGATIVE of the relative syntomic-symbol de Rham coordinate (AM Theorems 3.7 at n=1 and 4.5). The generic category of filtered F-isocrystals, connection, Ext, relative de Rham/rigid and relative syntomic carriers are imports, not definitions owned here.

**Uses.** PadicHodgeRegulators:D.5/smooth-family-specialisation: Specialize the relative extension and its syntomic coordinate to a smooth fibre.

**API.**

| Name | Contract |
| --- | --- |
| `relativeCurveSyntomicRegulator` | The symbol-extension homomorphism into imported Ext¹, with proper refinement on ker ∂. |
| `relativeRegulator_frobeniusCoordinate` | R_σ on the extension in B†_K⊗H¹_dR; the Gauss–Manin coordinate is separately σ-independent. |
| `relativeRegulator_steinberg` | [f,1−f]_{U/S}=0 where both functions are units. |
| `relativeRegulator_tameKernel` | The proper extension maps to the open extension and is unique on ker ∂. |
| `relativeRegulator_signedComparison` | R_σ[ξ]=−coord_syn,σ(ξ) under Theorem 4.5’s hypotheses. |
| `relativeRegulator_ext` | Two homomorphisms agree if they agree on every admissible Milnor symbol in their specified domain. |

**Discriminating tests.**

- `relativeRegulator_steinberg_test` (computation): {t,1−t} on Spec W[t,(t−t²)⁻¹] has zero extension.
- `relativeRegulator_zero_symbol` (degenerate): The zero Milnor class gives the split extension and zero Frobenius/connection coordinates.
- `relativeRegulator_absolute_fibre` (compatibility): At S=Spec W the tame-kernel symbol agrees with the absolute syntomic regulator; R_σ carries the negative relative-coordinate convention.
- `relativeRegulator_nonzero_tame` (non-example): A symbol with a nontrivial tame symbol at D_X gives no proper extension via this construction; retaining its open regulator does not justify a proper one.
- `relativeRegulator_sign_test` (non-example): At n=1, replacing (−1)^n with +1 in the syntomic-coordinate square reverses a nonzero Frobenius coordinate.

**Check.**

- ξ={f,1−f} with both units has zero extension and zero coordinate.
- At a σ-compatible W-valued smooth fibre, a tame-trivial ξ gives the absolute rigid syntomic regulator through AM Lemma 4.4; the negative relative Frobenius coordinate must be normalized before comparing with regP.

**Construction or proof route.**

1. Construct successive logarithm extensions from the units representing ξ, apply relative cohomology and the filtration vanishing to form an extension. AM Theorem 2.23 proves additivity and Steinberg descent without assuming a nonexistent general Ext edge projector.
2. For ∂ξ=0, AM Lemma 4.2 and Proposition 4.3 use the residue/Gysin sequence: the open extension has trivial residue extension, and the weight of the boundary excludes Hom(O_S,N(2)), giving a unique proper lift.
3. Take the Frobenius and connection coordinates of the extension (AM §2.7). Compare to the directed relative syntomic cup-symbol; Theorems 3.7 and 4.5 have sign (−1)^1. Relate the absolute fibre to Besser’s regulator by Lemma 4.4/3.10, carrying this sign through the coordinate identification, not redefining Θ.
4. Route missing relative filtered F-MIC/Ext and relative syntomic machinery as external supplier requests. This node owns only the symbol-extension and regulator comparison.

**Dependencies.** [PadicHodgeRegulators:D.2/syntomic-regulator](#target-padichodgeregulators-d-2-syntomic-regulator), [PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map](#target-padichodgeregulators-d-2-fontaine-messing-kato-period-map), [PadicHodgeRegulators:D.5/curve-syntomic-regulator](#target-padichodgeregulators-d-5-curve-syntomic-regulator), [K2SymbolsBrauer:T.3/tame-symbol](K2SymbolsBrauer.md), [PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology](PadicDifferentialEquationsAndRigidCohomology.md).

**Sources.** [AM2022](https://arxiv.org/pdf/2007.14255v2), Theorem 2.23 and §2.7, pp. 18–20; Theorem 3.7, pp. 27–31; Proposition 4.3, Lemma 4.4, Theorem 4.5, pp. 34–36: Relative symbol extensions, Frobenius coordinate and the signed syntomic comparison, including the proper-curve tame-kernel refinement.

<a id="target-padichodgeregulators-d-5-smooth-family-specialisation"></a>

### Specialization of the regulator to a smooth fibre

Target `PadicHodgeRegulators:D.5/smooth-family-specialisation` · declaration `relativeRegulator_specialise`.

**Hypotheses.** W=W(k) with k perfect of characteristic p≥3, K=Frac W; S=Spec B smooth affine over W, U=Spec A smooth affine over S. Use AM Theorem 3.7’s projective compactification Y→Q, boundary D∪f⁻¹(T) relative simple normal crossings, log-smooth (Y,M)→(Q,L), and a compatible system σ of p-Frobenius lifts on Q. AM Assumption 2.20: relative overconvergent rigid cohomology is coherent and compares to algebraic relative de Rham cohomology. Fil²H²_dR(U/S)=0; for the comparison, H¹ and H² of the truncated relative log de Rham complex ≥2 vanish modulo every p^m. For the proper refinement use exactly AM §4.1: Q is a smooth affine curve over W, T⊂Q is finite étale over W, S=Q\T, Y is a smooth quasi-projective surface over W, and f:Y→Q is projective and surjective with connected fibres. The deleted divisor D_X⊂X=Y\f⁻¹(T) is finite étale over S; U=X\D_X is affine. The vertical and horizontal boundary has relative simple normal crossings, the family is smooth over S, and every irreducible component of a singular fibre has multiplicity prime to p. The domain is ker ∂⊂K²_M(A), not all proper K₂ classes. α is Frobenius-compatible with the chosen σ and stays in the smooth locus; the symbol functions and tame-kernel condition specialize. The regP identification of the absolute fibre requires k finite, so K/Q_p is finite unramified. Over an arbitrary perfect k only the relative extension and Frobenius-coordinate specialization are asserted here.

For the preceding relative symbol extension and a W-valued smooth point α:S(W), require ev_α∘σ=F_W∘ev_α at every finite level. Pullback to α sends the Milnor symbol extension to the absolute extension of its specialized symbol ξ_α, and evaluates its R_σ coordinate to the absolute Frobenius coordinate. When k is finite, after the signed syntomic comparison and normalized boundary identification, this yields regP_{X_α}(ξ_α)=the normalized evaluated relative syntomic class in H¹_dR(X_α/K). For the proper refinement require ∂ξ=0 and the boundary remains étale at α. A fixed σ has only its Frobenius-compatible lifts; arbitrary α is handled by a σ adapted to that point where one exists, not by treating every evaluation as a Frobenius morphism.

**Uses.** PadicHodgeRegulators:D.5: Fulfils the smooth-family specialization target and exports it only with the relative extension, sign and Frobenius-compatible evaluation.

**Check.**

- Constant families and pullback symbols specialize to the same absolute regulator.
- Asakura Theorem 4.9, p. 435, at α reducing outside {0,1} supplies an explicit regulator coordinate for its ξ and σ_α; use the published hypergeometric value as source acceptance data, not an independently recomputed numeric test. Its W(F_p-bar) setting is used only for the point-adapted Frobenius coordinate; no finite-base descent or absolute regP identification is inferred.

**Construction or proof route.**

1. AM Lemma 2.8 gives pullback compatibility of cup symbols; the logarithm-extension construction and relative cohomology base change carry this to [−]_{U/S}. The proof of Theorem 3.7, pp. 28–31, evaluates at σ-compatible W-lifts (Lemma 3.8); this is the actual compatibility needed by R_σ.
2. Use the commutative fibre pullback square for the relative syntomic-symbol map. Keep its n=1 sign, use AM Lemma 4.4 for the absolute proper regulator, and then apply Θ to obtain the normalized de Rham statement.
3. For the hypergeometric-family acceptance example, Asakura Theorem 4.9 uses σ_α(t)=F_W(α)α^{−p}t^p, so ev_α is compatible. This illustrates the point-adapted choice; it does not assert a fixed σ works at all α. Asakura’s theorem is over W(F_p-bar); it illustrates the relative-coordinate compatibility. It is not itself an instance of the finite-unramified regP target without additional descent data.

**Dependencies.** [PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator](#target-padichodgeregulators-d-5-relative-curve-syntomic-regulator), [PadicHodgeRegulators:D.5/curve-weight-two-target](#target-padichodgeregulators-d-5-curve-weight-two-target).

**Sources.** [AM2022](https://arxiv.org/pdf/2007.14255v2), Theorem 2.23 and §2.7, pp. 18–20; Theorem 3.7, pp. 27–31; Proposition 4.3, Lemma 4.4, Theorem 4.5, pp. 34–36: Relative symbol extensions, Frobenius coordinate and the signed syntomic comparison, including the proper-curve tame-kernel refinement.; [Asakura2023](https://numdam.org/item/10.5802/jtnb.1250.pdf), Theorem 4.9 and Corollary 4.10, p. 435: Explicit smooth-fibre formula with a Frobenius lift adapted to the chosen α.

<a id="target-padichodgeregulators-d-5-semistable-continuous-regulator"></a>

### Continuous and discrete regulators of semistable curves

Target `PadicHodgeRegulators:D.5/semistable-continuous-regulator` · declaration `semistableContinuousRegulator`.

**Hypotheses.** K/Q_p finite; X/K smooth proper with a regular split semistable model, geometric smooth components and ordinary double points. Fix a uniformizer π and its logarithm branch. As in the read split-model treatment, require distinct components to meet at at most one point; multiedge/self-node generalization is not asserted here. V=H¹_et(X_Kbar,Q_p(2)), D=D_st(V), H=D_dR(V)=H¹_dR(X/K), Fil⁰D_dR(V)=Fil²H=0; import φ,N and I_π. Twisted Frobenius weights are −4,−3,−2, so φ−1 is invertible; N²=0. Domain is the weight-two geometrically trivial motivic/K₂ regulator domain supplied by the syntomic Chern classes; symbol evaluations use a finite presentation on the function field with trivial total tame symbols.

The imported semistable cohomology is H¹ of D→D⊕D⊕H→D with d(w)=((φ−1)w,Nw,−I_πw) and d(x,y,z)=Nx+(1−pφ)y. For a cocycle choose w=(φ−1)⁻¹x and set ρ[(x,y,z)]=y−Nw∈ker(1−pφ), β_π[(x,y,z)]=z+I_πw∈H. Both descend to classes and give a Q_p-linear isomorphism H¹_st(K,V)≃H⊕ker(1−pφ). Define reg^c,π=β_π∘reg_syn and reg^d=ρ∘reg_syn. The discrete carrier is the fixed-eigenvalue kernel ker(1−pφ), contained in twisted weight −2, not automatically the whole weight −2 space. Under a uniformizer change, the branch derivative of the continuous component is −I_π reg^d (Besser Theorem 3.8); for curve N²=0 and λ=log(π′/π), the source period-change law yields reg^c,π′−reg^c,π=−λI_π reg^d−(λ²/2)I_πN reg^d. It reduces to the linear law when N reg^d=0; N²=0 alone does not give this additional vanishing. reg^c alone does not determine the full semistable class.

**Uses.** PadicHodgeRegulators:D.5/semistable-symbol-formula: The Vologodsky formula computes a pairing of reg^c,π, with discrete component and branch held explicit.

**API.**

| Name | Contract |
| --- | --- |
| `semistableContinuousRegulator` | β_π∘reg_syn into H, linear over Q_p on the rationalized motivic domain. |
| `semistableDiscreteRegulator` | ρ∘reg_syn into ker(1−pφ), a Q_p-vector space. |
| `semistableCoordinates` | H¹_st≃H⊕ker(1−pφ), using w=(φ−1)⁻¹x. |
| `semistableCoordinates_boundary` | Adding ((φ−1)a,Na,−I_πa) changes neither coordinate. |
| `semistableRegulator_branchChange` | dβ/dlogπ=−I_πρ; for λ=log(π′/π) and curve N²=0, β_π′−β_π=−λI_πρ−(λ²/2)I_πNρ. The linear formula needs Nρ=0. |
| `semistableRegulator_ext` | Equal continuous AND discrete components imply equality of the H_st regulator class. |

**Discriminating tests.**

- `semistableCoordinates_good_reduction` (computation): N=0 and the smooth-curve twist give ρ=0; β equals the normalized crystalline coordinate.
- `semistableCoordinates_zero` (degenerate): The zero cocycle gives β=ρ=0.
- `semistableCoordinates_boundary_test` (compatibility): Adding d(a) replaces w by w+a, cancelling the changes in y and z.
- `semistableCoordinates_discrete_non_example` (non-example): (0,y,0) for nonzero fixed y has zero continuous coordinate and a nonzero discrete coordinate.
- `semistableCoordinates_weight_non_example` (non-example): For a semilinear weight−2 block without eigenvalue p⁻¹, ker(1−pφ)=0 although the block is nonzero; the weight space cannot replace the fixed kernel.
- `semistableCoordinates_branch_quadratic` (non-example): For N(a,b)=(b,0), ρ=(0,1) and I=id, the coordinate change is (−λ²/2,−λ), not (0,−λ). The condition N²=0 on the curve realization does not kill Nρ.

**Check.**

- For good reduction N=0, the twisted weight-one Frobenius has no eigenvalue p⁻¹, so ρ=0 and the continuous map reduces to the normalized crystalline regulator.
- A cocycle (0,y,0) with nonzero y∈ker(1−pφ) has β=0 but ρ=y; a claimed isomorphism from H_st to H alone would lose it.

**Construction or proof route.**

1. Read the semistable extension complex of Besser §3. The identity Nφ=pφN makes d²=0. In the curve twist φ−1 is invertible by weights; subtract d(w) to normalize x to zero.
2. The remaining cocycle equation is (1−pφ)(y−Nw)=0; there is no remaining boundary with x=0 since φ−1 is injective. This establishes well-definedness, the two components and their inverse represented by (0,ρ,β). The linearity is Q_p-linear because φ is semilinear over K_0.
3. The Frobenius-invariant lift A of 1 in the extension has N′A=ρ; β=B−I_πA. Theorem 3.8 gives dβ/dlogπ=−I_πρ. Apply equation (3.6) to the extension: for λ=log(π′/π), exp(λN′)A=A+λρ+(λ²/2)Nρ since N²=0 on V. Thus β changes by −I_π(λρ+(λ²/2)Nρ). Equivalently integrate the derivative while I_πρ varies through I_π exp(λN)ρ. Keep the quadratic term unless Nρ=0. The generic H_st and period comparison remain owned externally.

**Dependencies.** [PadicHodgeRegulators:D.5/semistable-input-boundary](#target-padichodgeregulators-d-5-semistable-input-boundary), [PadicHodgeRegulators:D.2/etale-regulator](#target-padichodgeregulators-d-2-etale-regulator), [PadicHodgeRegulators:D.2/syntomic-regulator](#target-padichodgeregulators-d-2-syntomic-regulator), [PadicHodgeRegulators:L1/bloch-kato-subgroups](#target-padichodgeregulators-l1-bloch-kato-subgroups), [CohomologyComparisons:CP.4](CohomologyComparisons.md).

**Sources.** [Besser2025](https://arxiv.org/pdf/2502.16738v1), §3, equations (3.5)–(3.11), Proposition 3.3, proof of Proposition 3.5, Remark 3.6, Definition 3.7 and Theorem 3.8, pp. 6–9: Semistable extension complex and continuous/discrete coordinates; the proof explicitly yields ker(1−pφ).

<a id="target-padichodgeregulators-d-5-semistable-symbol-formula"></a>

### The full semistable symbol formula on the monodromy kernel

Target `PadicHodgeRegulators:D.5/semistable-symbol-formula` · declaration `semistableRegulator_symbolFormula`.

**Hypotheses.** K/Q_p finite; X/K smooth proper with a regular split semistable model, geometric smooth components and ordinary double points. Fix a uniformizer π and its logarithm branch. As in the read split-model treatment, require distinct components to meet at at most one point; multiedge/self-node generalization is not asserted here. V=H¹_et(X_Kbar,Q_p(2)), D=D_st(V), H=D_dR(V)=H¹_dR(X/K), Fil⁰D_dR(V)=Fil²H=0; import φ,N and I_π. Twisted Frobenius weights are −4,−3,−2, so φ−1 is invertible; N²=0. Domain is the weight-two geometrically trivial motivic/K₂ regulator domain supplied by the syntomic Chern classes; symbol evaluations use a finite presentation on the function field with trivial total tame symbols. [ω]∈ker N; ω has zero residues. Use double/triple indices and harmonic gluing with the same edge, primitive and logarithm conventions as the cited papers.

Let u have a tame-trivial function-field presentation Σ_i n_i{f_i,g_i}, and let ω be a meromorphic form of the second kind whose de Rham class lies in ker N (N transported by I_π). Choose Z containing the singular supports, a semistable wide-open cover U_v, and the local Coleman primitives F_{ω,v} corrected so their annular differences c_ω(e)=F_{ω,head}−F_{ω,tail} are harmonic, giving the Vologodsky primitive. Then ⟨reg^c,π(u),[ω]⟩=Σ_i n_i(Σ_v ⟨log f_i,F_ω;log g_i⟩_{(U_v−Z)†}−Σ_{e∈E⁺}c_ω(e)⟨log f_i,log g_i⟩_e). Here the first bracket is the GLOBAL triple index on each wide open and the second is the oriented annular double index; E⁺ contains one orientation of each geometric edge. Equivalently the last sum is one half of the sum over both orientations. This formula computes the continuous regulator paired with ker N; by nondegenerate cup pairing and skew-adjointness of N it determines its image in H/(ker N)^⊥=H/im N. It does not compute reg^d or an unrestricted pairing on H. For holomorphic ω∈ker N it simplifies to Σ_i n_i∫^Vol_{(f_i)}log(g_i)ω, with local constant terms and traces. The logarithm branch and uniformizer are fixed throughout; changing them is governed by the preceding node. The totally degenerate toric quotient H/(Fil⁰+T⁰⊗Q_p) in Besser Theorem 7.6 is a separate comparison, not a replacement for this monodromy quotient.

**Uses.** PadicHodgeRegulators:D.5: Fulfils the full semistable-symbol target with its continuous component, ker N test forms and explicit quotient.

**Check.**

- On a smooth good-reduction model the graph has no edges; the holomorphic specialization becomes the established Coleman formula for regP.
- Reversing e changes both c_ω(e) and the double index sign, so the edge product is unchanged; summing both orientations without a factor 1/2 would double the correction.
- For a totally degenerate curve the vertex triple indices vanish (BR Theorem 4.7 proof, citing BdJ2012 Proposition 8.4). The edge expression is the logarithm of the Pál regulator, not a formula for all components of a general semistable class.

**Construction or proof route.**

1. Use the formula restated in Besser2025 §7, p. 28, from the arbitrary-reduction regulator paper’s Theorem 1.2/Proposition 3.7. Besser–Raskind §4, pp. 19–20, independently states the same formula and ker N restriction; its §3, pp. 10–11 fixes graph pairings as sums over unoriented edges. The local contribution is a global triple index, not just the holomorphic integral.
2. The ColemanIntegration Part II supplier must provide harmonic differences/gluing, annular double indices and global triple indices, with reciprocity eliminating changes of primitive and symbol presentation. Besser2025 Theorem 3.10, p. 9, supplies the holomorphic specialization using Vologodsky integration. State this as a source theorem conditional on those imported interfaces, not a consequence of BZ alone.
3. For the quotient, Poincaré duality makes the alternating pairing nondegenerate and N skew-adjoint, so (ker N)^⊥=im N by linear algebra. Thus all these pairings determine precisely the class modulo im N. Keep the discrete component from the extension-complex construction and the fixed branch separately.

**Dependencies.** [PadicHodgeRegulators:D.5/semistable-continuous-regulator](#target-padichodgeregulators-d-5-semistable-continuous-regulator), [PadicHodgeRegulators:D.5/coleman-symbol-formula](#target-padichodgeregulators-d-5-coleman-symbol-formula), [ColemanIntegration:L0/annulus-residue](ColemanIntegration.md), [K2SymbolsBrauer:T.3/tame-symbol](K2SymbolsBrauer.md), [CohomologyComparisons:CP.4](CohomologyComparisons.md).

**Sources.** [Besser2025](https://arxiv.org/pdf/2502.16738v1), Theorem 3.10, p. 9; §4, pp. 11–14; §7, p. 28: Continuous regulator pairing, harmonic edge correction, full second-kind triple-index formula and monodromy restriction.; [BR2019](https://arxiv.org/pdf/1910.06877v1), §3, equations (3.1)–(3.5), pp. 10–11; Theorem 4.7 proof, pp. 19–20: One edge orientation per graph pairing, full symbol formula with ker N, and the totally degenerate specialization.

## Worked acceptance calculation: the cubic field at 5

Use A_N=(Z/5^N)[a]/(a³−a²+1), with coefficient order (1,a,a²). The discriminant −23 is a 5-adic unit, so this is the unramified degree-three product algebra, not a ramified cubic field. Its factors have residue degrees 2 and 1. The two symbol arguments are z=1−a² and 1−a, and both arguments and their complements are units. Set ζ=lim a^{25^s}. Its order is 24; its Q₅ component has order 4. All components of ζ, ζ² and ζ⁶ differ from 1, whereas ζ⁴ is inadmissible.

The following procedure uses no printed regulator digits as input. Define the p-depleted dilogarithm F(z)=Li₂(z)−Li₂(z⁵)/25. On a special-unit residue disc it is computed by the convergent rational-function expansion

\[
F(z)=\sum_{m\ge0}(-1)^m(m+1)5^m
\left(\sum_{i=1}^4\frac{z^i}{i^{m+2}}\right)S_m(z^5),\qquad
S_m(t)=\sum_{j=0}^m\left\{\begin{smallmatrix}m\\j\end{smallmatrix}\right\}
\frac{j!t^j}{(1-t)^{j+1}}.
\]

Here the braces are Stirling numbers of the second kind. To derive the expansion, group the ordinary Li₂ series by n=i+5k and expand (i+5k)^{-2}; the rational formula for Σ k^m t^k gives S_m. The equality first holds on |z|<1 and continues as the depleted Coleman function. On these special-unit discs 1−z⁵ is a unit; the m-th term is divisible by 5^m, so truncation has an explicit integral precision bound.

For a tame root u in this product algebra, u²⁵=u and Frobenius has order dividing 2. Consequently

\[
\frac{D(u)}{25}=\frac{25F(u)+F(u^5)}{624}.
\]

For a symbol argument z, put u=lim z^{25^s}, h=z−u, b=1−u. Compute log(v) as 1/24 times the usual logarithm series of v²⁴. Integrating −log(1−z) dz/z inside the disc gives

\[
D(z)=D(u)-\log(b)\log(z)+
\sum_{k\ge1,\ell\ge0}
\frac{(-1)^\ell h^{k+\ell+1}}
{k(k+\ell+1)b^k u^{\ell+1}}
+\tfrac12\log(z)\log(1-z).
\]

This also fixes the branch: log(u)=0. The logarithms have arguments in 1+5A_N after the 24th power, and h is divisible by 5. Terms with k+ℓ+1=n have valuation at least n−v₅(k)−v₅(n). Thus the tails and the precision lost in division can be bounded before solving the linear system.

Using working modulus 5¹⁶, terms m≤21, logarithm terms k≤23 and integration terms n≤23 gives the entries below modulo 5¹² after dividing D by 25. Repeating with working modulus 5²⁰ leaves every retained digit unchanged. Each bracket lists base-5 digits from low to high; the three rows of a vector are the coefficients of 1,a,a².

| Value divided by 25 | Constant digits | a digits | a² digits |
| --- | --- | --- | --- |
| D(ζ) | 2 1 2 1 4 4 4 4 0 0 0 1 | 4 2 0 0 1 4 2 2 4 0 0 0 | 4 4 0 1 1 0 2 1 2 0 0 3 |
| D(ζ²) | 1 0 3 2 2 4 1 3 1 2 0 4 | 3 3 1 4 0 0 3 2 3 0 0 1 | 2 2 1 3 0 2 0 1 4 3 1 1 |
| D(ζ⁶) | 2 0 4 0 1 1 1 3 0 0 0 3 | 3 2 3 4 3 2 2 3 3 4 4 2 | 3 3 2 3 3 4 4 4 0 2 2 2 |
| D(ξ) | 2 3 0 0 0 4 4 4 3 1 0 3 | 1 3 0 3 3 0 4 1 0 4 4 0 | 3 1 2 1 1 2 1 3 2 0 4 4 |

The root-value matrix modulo 5, with these three values as columns, is

\[
\begin{pmatrix}2&1&2\\4&3&3\\4&2&3\end{pmatrix},\qquad \det=3\pmod5.
\]

It is therefore invertible over Z₅. Solving for D(ξ)=c₁D(ζ)+c₂D(ζ²)+c₃D(ζ⁶) gives:

| Coordinate | Base-5 digits modulo 5¹² |
| --- | --- |
| c1 | 1 4 3 1 3 4 0 2 2 0 3 2 |
| c2 | 3 1 0 4 0 4 2 4 3 0 4 4 |
| c3 | 1 1 4 1 3 0 0 1 1 3 2 4 |

These reproduce the displayed initial digits of GSWZ (271)–(274). The second line of (273) is D(ζ²), rather than the printed D(ζ⁵). Reflection D(z)+D(1−z)=0 and inversion D(z)+D(1/z)=0 hold modulo 5¹⁴ at a and 1−a² in the same computation. The calculation supplies finite-precision acceptance evidence; the exact identities and completed K-theory interpretation still require the stated theorems.

The independent review recomputed these quantities at working precision 20 using exact finite-ring arithmetic. All recorded 12-digit values and coordinates matched, as did the two functional identities modulo 5¹⁴. This independently checks the numerical receipt; it does not prove the arithmetic identifications.

## External contracts and mathematical boundaries

The exact supplier nodes below provide the listed inputs under their own hypotheses. A supplier's recorded proof gap remains an input obligation; an interface is not a formalisation claim.

- [PhiGammaModulesAndIwasawaCohomology:PG.5](PhiGammaModulesAndIwasawaCohomology.md): [PhiGammaModulesAndIwasawaCohomology:PG.5/integral-iwasawa-comparison](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/iwasawa-functoriality](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/finite-character-specialization](PhiGammaModulesAndIwasawaCohomology.md). The integral derived comparison, finite-flat functoriality and inverse-character specialization are supplied by the named PG.5 contracts. What remains is the exact CC99 I.4.1/IV.2.1 cocycle normalization of h_Iw, including ell(gamma_n), its generator and root changes, and the sign of the Kummer comparison. A derived comparison without this normalization does not fix that sign; inherit the supplier’s integral comparison proof gap.
- [PhiGammaModulesAndIwasawaCohomology:PG.6](PhiGammaModulesAndIwasawaCohomology.md): [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-module](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-existence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-height](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-dcris](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-reconstruction](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-unramified-base-change](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-iwasawa](PhiGammaModulesAndIwasawaCohomology.md). Use exactly the source weight, etaleness, finite-flat coefficient and topology hypotheses in these contracts. An imported target is not an implementation or proof of its supplier’s recorded gaps.
- [PhiGammaModulesAndIwasawaCohomology:PG.4](PhiGammaModulesAndIwasawaCohomology.md): [PhiGammaModulesAndIwasawaCohomology:PG.4/period-psi](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md). Import the actual integral/annular psi from PG.4/period-psi and period-module-psi. Add the explicit pole formula psi(pi^-m)=pi^-m(p^(m-1)+pi Q_m(pi)), Q_m integral, used by Berger Lemma A.4 in the Wach psi-fixed-vector estimate; this formula is not one of the named period-psi contracts.
- [PhiGammaModulesAndIwasawaCohomology:PG.1](PhiGammaModulesAndIwasawaCohomology.md): [PhiGammaModulesAndIwasawaCohomology:PG.1/fontaine-equivalence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/torsion-rational-compatibility](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.1/rank-one-dictionary](PhiGammaModulesAndIwasawaCohomology.md). Use exactly the source weight, etaleness, finite-flat coefficient and topology hypotheses in these contracts. An imported target is not an implementation or proof of its supplier’s recorded gaps.
- [PhiGammaModulesAndIwasawaCohomology:PG.6](PhiGammaModulesAndIwasawaCohomology.md): [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-module](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-existence](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-height](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-dcris](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-good-basis](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.6/wach-iwasawa](PhiGammaModulesAndIwasawaCohomology.md). Import actual Wach modules, height, filtered reduction and good-basis existence from the named PG.6 nodes. Supply the precise t/pi comparison elementary-divisor theorem of LLZ2011 §2.3 in the required noncritical refinement range. The stronger integral congruence-preserving basis choice is retained here as a regulator-specific consequence of LLZWach2010 Theorem 3.5, pp.10–12; PG.6 currently exports only existence in its stated integral range.
- [PhiGammaModulesAndIwasawaCohomology:PG.4](PhiGammaModulesAndIwasawaCohomology.md): [PhiGammaModulesAndIwasawaCohomology:PG.4/period-psi](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md). Import continuous integral/annular psi on etale period modules from PG.4. Still needed: the general non-etale differential N_rig(D) psi/partial identities and radius-sensitive localization used by RJ. Etale lattice preservation does not assert Wach-lattice or general Robba differential-module preservation.
- [LocallyAnalyticDistributions:L3](LocallyAnalyticDistributions.md): [LocallyAnalyticDistributions:L3/unbounded-component-mellin](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/bounded-mellin-characterisation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-character-evaluation](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-convolution](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-generator-change](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-weight-derivative](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-twist](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-pushforward](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L3/mellin-coefficient-extension](LocallyAnalyticDistributions.md), [PhiGammaModulesAndIwasawaCohomology:PG.4/period-module-psi](PhiGammaModulesAndIwasawaCohomology.md). Use exactly the source weight, etaleness, finite-flat coefficient and topology hypotheses in these contracts. An imported target is not an implementation or proof of its supplier’s recorded gaps.
- [LocallyAnalyticDistributions:L1](LocallyAnalyticDistributions.md): [LocallyAnalyticDistributions:L1/amice-transform](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L1/division-on-units](LocallyAnalyticDistributions.md). Amice and unit-supported division by x now have exact LAD L1 contracts. Still needed are the particular removable logarithmic quotients, analytic weight affinoids and period-valued constant-term maps used in RJ I.3/I.9/I.13/I.17. A general Mellin isomorphism or division by x on unit-supported distributions does not divide by an arbitrary ell_i.
- [LocallyAnalyticDistributions:L2](LocallyAnalyticDistributions.md): [LocallyAnalyticDistributions:L2/order-r-distributions](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/amice-velu-vishik](LocallyAnalyticDistributions.md), [LocallyAnalyticDistributions:L2/locally-algebraic-determination](LocallyAnalyticDistributions.md). Order-h distributions, seminorm transfer and uniqueness on the locally polynomial character tests under the supplier’s order bound are imported from the exact LAD L2 contracts. Still needed is elementary-divisor/Bezout theory for the actual open-disc Frechet analytic algebra H_E, with the coadmissibility and scalar-extension hypotheses used by LLZ. No unrestricted uniqueness on an arbitrary character set is inferred.
- [PhiGammaModulesAndIwasawaCohomology:PG.5](PhiGammaModulesAndIwasawaCohomology.md): [PhiGammaModulesAndIwasawaCohomology:PG.5/integral-iwasawa-comparison](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/iwasawa-functoriality](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/finite-character-specialization](PhiGammaModulesAndIwasawaCohomology.md), [PhiGammaModulesAndIwasawaCohomology:PG.5/analytic-iwasawa](PhiGammaModulesAndIwasawaCohomology.md). Integral representation Iwasawa comparison and finite-character specialization are supplied by the named PG.5 nodes; rationalization follows the integral inverse limit. Still needed is Nakamura’s comparison/exponential interface for general de Rham Robba modules D and N_rig(D), beyond etale realizations. PG.5/analytic-iwasawa’s generation clause changes to a larger Robba Gamma ring and assumes both psi cokernels vanish; it is not this general exponential theorem.
- [PadicHodgeTheory:R06.2](PadicHodgeTheory.md): [PadicHodgeTheory:R06.2/period-functors](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/filtered-phi-n-modules](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/ddr-exact-strict-tensor](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified](PadicHodgeTheory.md), [PadicHodgeTheory:R06.2/coefficient-field-base-change](PadicHodgeTheory.md). Use exactly the source weight, etaleness, finite-flat coefficient and topology hypotheses in these contracts. An imported target is not an implementation or proof of its supplier’s recorded gaps.
- [PhiGammaModulesAndIwasawaCohomology:PG.2](PhiGammaModulesAndIwasawaCohomology.md): [PadicHodgeTheory:R06.3/de-rham-differential-equation](PadicHodgeTheory.md). The representation-level N_dR(V) and its weight-dependent t-localization are imported from PadicHodgeTheory:R06.3/de-rham-differential-equation. Extend to the general de Rham Robba D of RJ I.3/I.9/I.13, with partial, psi, overconvergence threshold, localization and the inclusion t^-a D⊂N_rig(D)⊂t^-b D. Do not infer etaleness from this requested extension.
- [PadicHodgeTheory:P7](PadicHodgeTheory.md): [PadicHodgeTheory:P7/localisation-maps-p-adic-field](PadicHodgeTheory.md), [PadicHodgeTheory:P7/extended-localisation-maps](PadicHodgeTheory.md), [PadicHodgeTheory:P7/nabla-operator-on-robba-ring](PadicHodgeTheory.md). Import actual localization maps and nabla on Robba rings from the named PHT P7 nodes. Supply the radius/seminorm and constant-term estimates on general N_rig(D) needed by RJ, with the same conductor as the finite character and localization embedding. The existing representation-level comparison does not automatically provide the general module estimates.
- [SelmerIwasawaCohomology:L3](SelmerIwasawaCohomology.md): [PhiGammaModulesAndIwasawaCohomology:PG.5/iwasawa-pairing](PhiGammaModulesAndIwasawaCohomology.md). PG.5/iwasawa-pairing now supplies the rational Robba residue pairing, involution and KPX generator/logarithm comparison constants. The remaining contract is its comparison with the integral inverse-corestriction Galois cup-product pairing normalized exactly as LZ §2.6, pp.6–7, including finite-level specialization and coefficient extension. Keep the -sigma_-1 ell_0 factor of LZ B.6; residue-to-Galois constants are not silently one.

### Inputs requiring extension of an owner

**R1 — [MotivicEtaleKTheory:M.7](MotivicEtaleKTheory.md).** Soulé's étale Chern classes c_{i,k} : K_{2i−k}(R; Z/n) → H^k_et(R, μ_n^{⊗i}) for rings R with n invertible (fields, p-adic integer rings with p ∤ n replaced by their generic fibres, number rings), natural in R, compatible with the coefficient maps n | n', with products and with transfers (corestriction), and Soulé's product formula — planned in the part of MotivicEtaleKTheory that needs only M.7 (étale K-theory), as RT-AREA-ktheory-2/18 directs, so that HabiroNumberFields HB.1/HB.2 and PadicHodgeRegulators D.2 import one construction. Consumers: [PadicHodgeRegulators:D.2/etale-regulator](#target-padichodgeregulators-d-2-etale-regulator).

**R2 — [MotivicEtaleKTheory:M.1](MotivicEtaleKTheory.md).** The continuous realisation K_{2n−1}(F) → H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) obtained from the classes c_{n,1} with p-power coefficients, its agreement with the Kummer map for n = 1, and its compatibility with restriction and transfer. Consumers: [PadicHodgeRegulators:D.2/etale-regulator](#target-padichodgeregulators-d-2-etale-regulator).

**R3 — [Polylogarithms:P.4](Polylogarithms.md).** De Jeu's complexes M̃^{(n)}(F) (n ≥ 2; in weight two M̃^{(2)}(F) → ∧²F^×_Q) of a field of characteristic 0 and its subcomplex M̃^{(2)}(O) for a discrete valuation ring O ⊂ F generated by special units (Besser–de Jeu §3), with the map H^1(M̃^{(2)}(F)) → K_3^{(2)}(F) and its comparison, up to the sign fixed by de Jeu, with Suslin's isomorphism B(F) ⊗ Q ≅ K_3^ind(F) ⊗ Q of K3BlochGroups V.4/V.6; in weight n, the map H^1(M̃^{(n)}(F)) → K^{(n)}_{2n−1}(F) for number fields (an isomorphism for n = 2, 3 and for cyclotomic fields) and the cyclotomic symbols [ζ]_n. Consumers: [PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison](#target-padichodgeregulators-d-2-weight-two-dilogarithm-comparison), [PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison](#target-padichodgeregulators-d-2-higher-weight-polylogarithm-comparison).

**R4 — [CrystallineCohomology:CR.5](CrystallineCohomology.md).** Absolute log-crystalline cohomology RΓ_cr(X, J^{[r]})_n of fs log-schemes X log-smooth over O_K^× (O_K a complete DVR of mixed characteristic with perfect residue field, any ramification), with its divided-power filtration, Frobenius, base change in n and the Cartier-type hypotheses needed for the Hyodo–Kato comparison. Consumers: [PadicHodgeRegulators:D.2/log-syntomic-complex](#target-padichodgeregulators-d-2-log-syntomic-complex).

**R5 — [CrystallineCohomology:CR.3](CrystallineCohomology.md).** Frobenius on absolute crystalline cohomology of smooth O_K-schemes, compatible with the PD filtration, used in the non-log case of the syntomic complex. Consumers: [PadicHodgeRegulators:D.2/log-syntomic-complex](#target-padichodgeregulators-d-2-log-syntomic-complex).

**R6 — [CrystallineCohomology:CR.2](CrystallineCohomology.md).** The crystalline (PD) Poincaré lemma for the relative period rings A_cr(R) of small semistable O_K-algebras (Tsuji, as used by Colmez–Nizioł §4.7), identifying Galois cochains in the PD de Rham complex of the envelope with Galois cochains in [F^r A_cr(R) → A_cr(R)]. Consumers: [PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map](#target-padichodgeregulators-d-2-fontaine-messing-kato-period-map).

**R7 — [AInfCohomology:AI.4](AInfCohomology.md).** The relative period rings A_cr(R) and their filtration and Frobenius for small (semistable, log) O_K-algebras R, with the Galois action of G_R, as used in the local construction of the Fontaine–Messing–Kato period map. Consumers: [PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map](#target-padichodgeregulators-d-2-fontaine-messing-kato-period-map).

**R8 — [DerivedDeRhamCohomology:DD.2](DerivedDeRhamCohomology.md).** Algebraic de Rham cohomology of smooth K-schemes with its Hodge filtration, functorial in X, and the comparison of Fil^n RΓ_dR(X_K) with the de Rham term of rigid syntomic cohomology. Consumers: [PadicHodgeRegulators:D.2/rigid-syntomic-cohomology](#target-padichodgeregulators-d-2-rigid-syntomic-cohomology).

**R9 — [PhiGammaModulesAndIwasawaCohomology:PG.5](PhiGammaModulesAndIwasawaCohomology.md).** The integral derived comparison, finite-flat functoriality and inverse-character specialization are supplied by the named PG.5 contracts. What remains is the exact CC99 I.4.1/IV.2.1 cocycle normalization of h_Iw, including ell(gamma_n), its generator and root changes, and the sign of the Kummer comparison. A derived comparison without this normalization does not fix that sign; inherit the supplier’s integral comparison proof gap. Consumers: [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/lattice-and-coefficient-squares](#target-padichodgeregulators-l2-lattice-and-coefficient-squares).

**R10 — [PhiGammaModulesAndIwasawaCohomology:PG.4](PhiGammaModulesAndIwasawaCohomology.md).** Import the actual integral/annular psi from PG.4/period-psi and period-module-psi. Add the explicit pole formula psi(pi^-m)=pi^-m(p^(m-1)+pi Q_m(pi)), Q_m integral, used by Berger Lemma A.4 in the Wach psi-fixed-vector estimate; this formula is not one of the named period-psi contracts. Consumers: [PadicHodgeRegulators:L2/wach-psi-fixed-vectors](#target-padichodgeregulators-l2-wach-psi-fixed-vectors).

**R11 — [CohomologyComparisons:CP.4](CohomologyComparisons.md).** CP.4 supplies the proper rational Hyodo–Kato comparison. Separately route the early integral/open prefix to the proposed contracts CohomologyComparisonsPartII:CS.0/classical-divided-and-undivided-syntomic; CohomologyComparisonsPartII:CS.1/integral-fontaine-messing-period; CohomologyComparisonsPartII:CS.2/divided-small-weight-comparison; CohomologyComparisonsPartII:CS.3/semistable-syntomic-exponential. Their precise statements are the four retained D.2 consumer interfaces, including ω/τ, divided exactness, directed Godement/topos map and rational exponential. These are proposed stable IDs, not existing CP.4 nodes. The CS.3 boundary must be ω_Q⁻¹δ_D in the EN period convention, rather than the unscaled quotient-coordinate boundary δ_U; the latter has α_U^FMδ_U=p^r exp_BK. No integral inverse to ω is requested. Consumers: [PadicHodgeRegulators:D.5/semistable-input-boundary](#target-padichodgeregulators-d-5-semistable-input-boundary), [PadicHodgeRegulators:D.2/log-syntomic-complex](#target-padichodgeregulators-d-2-log-syntomic-complex), [PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map](#target-padichodgeregulators-d-2-fontaine-messing-kato-period-map), [PadicHodgeRegulators:D.2/small-twist-comparison](#target-padichodgeregulators-d-2-small-twist-comparison), [PadicHodgeRegulators:D.2/syntomic-exponential](#target-padichodgeregulators-d-2-syntomic-exponential).

**R12 — `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.** The named semilocal equivalence F ⊗_Q Q_p ≅ ∏_{v|p} F_v (and O_F ⊗ Z_p ≅ ∏ O_v) with its characteristic property, as planned in that layer; this roadmap uses it as given. Consumers: [PadicHodgeRegulators:D.1/combined-dilogarithm](#target-padichodgeregulators-d-1-combined-dilogarithm), [PadicHodgeRegulators:D.1/unit-logarithm-kernel](#target-padichodgeregulators-d-1-unit-logarithm-kernel), [PadicHodgeRegulators:D.3/unramified-etale-algebra](#target-padichodgeregulators-d-3-unramified-etale-algebra), [PadicHodgeRegulators:D.4/global-p-adic-regulator](#target-padichodgeregulators-d-4-global-p-adic-regulator), [PadicHodgeRegulators:L1/semilocal-bloch-kato](#target-padichodgeregulators-l1-semilocal-bloch-kato).

**R13 — `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.** Import the local unit filtration, canonical Teichmüller splitting and p-adic log/exp isomorphism on sufficiently deep units from upstream Layer 1. For finite L/Q_p, kernel(log on O_L^×)=μ(L); for unramified L and odd p, log:1+pO_L≅pO_L. Check agreement with the pinned TauCeti.teichmuller section and Coleman’s Iwasawa branch, without rebuilding the upstream carrier. Consumers: [PadicHodgeRegulators:D.1/teichmuller-unit-decomposition](#target-padichodgeregulators-d-1-teichmuller-unit-decomposition), [PadicHodgeRegulators:D.1/unit-logarithm-kernel](#target-padichodgeregulators-d-1-unit-logarithm-kernel), [PadicHodgeRegulators:L1/integral-logarithm-unramified](#target-padichodgeregulators-l1-integral-logarithm-unramified).

**R14 — `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.** Import finite unramified extension classification, existence/uniqueness of arithmetic Frobenius and the integer-ring identification O_L≅W(F_q), natural under embeddings and finite products, including the agreement of Frobenius with WittVector.frobenius. IsArithFrobAt only states a residue congruence; FormallyUnramified on the generic characteristic-zero field only states separability. Supply the specialized product interface retained at D.3/unramified-etale-algebra. Consumers: [PadicHodgeRegulators:D.1/unramified-frobenius-on-roots](#target-padichodgeregulators-d-1-unramified-frobenius-on-roots), [PadicHodgeRegulators:D.3/unramified-etale-algebra](#target-padichodgeregulators-d-3-unramified-etale-algebra).

**R15 — [ArithmeticGaloisDuality:R02.4](ArithmeticGaloisDuality.md).** For K/Q_p finite and finite-dimensional continuous Q_p-representation V, provide the perfect cup-product pairings H^i(K,V)×H^{2−i}(K,V*(1))→Q_p, the invariant identification H²(K,Q_p(1))≅Q_p, finite-dimensional H^i(K,V), vanishing above 2 and the local Euler characteristic dim H⁰−dim H¹+dim H²=−[K:Q_p]dim V, obtained by finite coefficients, a stable lattice, inverse limits and rationalization. It must agree with the read D7/local-invariant-trivialization and D7/duality-after-localization pairings; a discrete class-formation Ext theorem alone is not this statement. The result must apply to every finite K/Q_p, without assuming that K is already presented as a completion of a chosen global field. Consumers: [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:L1/dimension-formulas](#target-padichodgeregulators-l1-dimension-formulas), [PadicHodgeRegulators:L1/local-duality-of-conditions](#target-padichodgeregulators-l1-local-duality-of-conditions), [PadicHodgeRegulators:L1/tate-twist-examples](#target-padichodgeregulators-l1-tate-twist-examples), [PadicHodgeRegulators:L1/dual-exponential](#target-padichodgeregulators-l1-dual-exponential).

**R16 — [PadicHodgeTheory:R06.1](PadicHodgeTheory.md).** Continuous cohomology of B_dR⁺→B_dR for de Rham V, Hodge–Tate graded C_p cohomology and its filtration-limit compatibility, with the Kummer boundary used by BK Proposition 3.8, pp. 355–359. Required by the direct e/g proof, not finite ramified descent. Also supply Kato’s cup-with-log χ identification H^1(K,B_dR⊗V)≅D_dR(V) and the corresponding B_dR⁺ identification for de Rham V (FO Proposition 6.35; Berger Proposition II.5), used by the dual exponential. Consumers: [PadicHodgeRegulators:L1/local-duality-of-conditions](#target-padichodgeregulators-l1-local-duality-of-conditions), [PadicHodgeRegulators:L1/dual-exponential](#target-padichodgeregulators-l1-dual-exponential).

**R17 — [CohomologyComparisons:CP.4](CohomologyComparisons.md).** Relative syntomic-symbol and σ-compatible evaluation/base change for the proposed CS prefix, exactly AM2022 Theorem 3.7 and §4.1. CP.4 remains a routing anchor; its existing proper rational theorem does not supply this relative integral contract. Consumers: [PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator](#target-padichodgeregulators-d-5-relative-curve-syntomic-regulator), [PadicHodgeRegulators:D.5/smooth-family-specialisation](#target-padichodgeregulators-d-5-smooth-family-specialisation).

**R18 — [PadicDifferentialEquationsAndRigidCohomology:RD.4](PadicDifferentialEquationsAndRigidCohomology.md).** Route filtered F-MIC(S,σ), Ext¹, logarithm extensions and their σ-compatible pullback to the owner of relative filtered F-isocrystals/connections, alongside relative rigid/de Rham comparison. These are generic carriers imported by the regulator-specific extension of AM2022 §2, not a claim that current RD.4 already implements them. Consumers: [PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator](#target-padichodgeregulators-d-5-relative-curve-syntomic-regulator), [PadicHodgeRegulators:D.5/smooth-family-specialisation](#target-padichodgeregulators-d-5-smooth-family-specialisation).

**R19 — [PadicMeasuresIwasawaAlgebras:L2](PadicMeasuresIwasawaAlgebras.md).** Bounded Lambda_E=O_E[[G]][1/varpi], character-chart evaluation, bounded division by X-x, nonzero factors and integral augmentation; the existing unit-measure Amice equivalence is reused exactly and is not the unbounded Mellin theorem. Consumers: [PadicHodgeRegulators:L4/good-wach-basis](#target-padichodgeregulators-l4-good-wach-basis), [PadicHodgeRegulators:L4/split-multiplicative-augmentation](#target-padichodgeregulators-l4-split-multiplicative-augmentation).

**R20 — [PhiGammaModulesAndIwasawaCohomology:PG.6](PhiGammaModulesAndIwasawaCohomology.md).** Import actual Wach modules, height, filtered reduction and good-basis existence from the named PG.6 nodes. Supply the precise t/pi comparison elementary-divisor theorem of LLZ2011 §2.3 in the required noncritical refinement range. The stronger integral congruence-preserving basis choice is requested from PG.6 as a strengthening of its generic basis theorem of LLZWach2010 Theorem 3.5, pp.10–12; PG.6 currently exports only existence in its stated integral range. Consumers: [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L3/growth](#target-padichodgeregulators-l3-growth), [PadicHodgeRegulators:L4/good-wach-basis](#target-padichodgeregulators-l4-good-wach-basis), [PadicHodgeRegulators:L4/refinement-saturated-flag](#target-padichodgeregulators-l4-refinement-saturated-flag), [PadicHodgeRegulators:L4/integral-image-index](#target-padichodgeregulators-l4-integral-image-index).

**R21 — [PhiGammaModulesAndIwasawaCohomology:PG.4](PhiGammaModulesAndIwasawaCohomology.md).** Import continuous integral/annular psi on etale period modules from PG.4. Still needed: the general non-etale differential N_rig(D) psi/partial identities and radius-sensitive localization used by RJ. Etale lattice preservation does not assert Wach-lattice or general Robba differential-module preservation. Consumers: [PadicHodgeRegulators:L3/big-exponential-obstruction](#target-padichodgeregulators-l3-big-exponential-obstruction), [PadicHodgeRegulators:L4/analytic-differential-powers](#target-padichodgeregulators-l4-analytic-differential-powers).

**R22 — [PadicMeasuresIwasawaAlgebras:L4](PadicMeasuresIwasawaAlgebras.md).** Finite O_E-length and pseudo-null module criteria over O_E[[X]], distinguished polynomial quotients, determinant/lattice comparison and bounded descent required by LLZ4.12. Consumers: [PadicHodgeRegulators:L4/actual-coleman-image](#target-padichodgeregulators-l4-actual-coleman-image), [PadicHodgeRegulators:L4/integral-image-index](#target-padichodgeregulators-l4-integral-image-index).

**R23 — [LocallyAnalyticDistributions:L1](LocallyAnalyticDistributions.md).** Amice and unit-supported division by x now have exact LAD L1 contracts. Still needed are the particular removable logarithmic quotients, analytic weight affinoids and period-valued constant-term maps used in RJ I.3/I.9/I.13/I.17. A general Mellin isomorphism or division by x on unit-supported distributions does not divide by an arbitrary ell_i. Consumers: [PadicHodgeRegulators:L3/logarithmic-factors](#target-padichodgeregulators-l3-logarithmic-factors), [PadicHodgeRegulators:L3/big-exponential-obstruction](#target-padichodgeregulators-l3-big-exponential-obstruction), [PadicHodgeRegulators:L4/derham-character-domain](#target-padichodgeregulators-l4-derham-character-domain), [PadicHodgeRegulators:L4/derham-interpolation-growth](#target-padichodgeregulators-l4-derham-interpolation-growth).

**R24 — [LocallyAnalyticDistributions:L2](LocallyAnalyticDistributions.md).** Order-h distributions, seminorm transfer and uniqueness on the locally polynomial character tests under the supplier’s order bound are imported from the exact LAD L2 contracts. Still needed is elementary-divisor/Bezout theory for the actual open-disc Frechet analytic algebra H_E, with the coadmissibility and scalar-extension hypotheses used by LLZ. No unrestricted uniqueness on an arbitrary character set is inferred. Consumers: [PadicHodgeRegulators:L3/growth](#target-padichodgeregulators-l3-growth), [PadicHodgeRegulators:L4/logarithmic-elementary-divisors](#target-padichodgeregulators-l4-logarithmic-elementary-divisors), [PadicHodgeRegulators:L4/actual-coleman-image](#target-padichodgeregulators-l4-actual-coleman-image), [PadicHodgeRegulators:L4/regulator-elementary-divisors](#target-padichodgeregulators-l4-regulator-elementary-divisors).

**R25 — [PhiGammaModulesAndIwasawaCohomology:PG.5](PhiGammaModulesAndIwasawaCohomology.md).** Integral representation Iwasawa comparison and finite-character specialization are supplied by the named PG.5 nodes; rationalization follows the integral inverse limit. Still needed is Nakamura’s comparison/exponential interface for general de Rham Robba modules D and N_rig(D), beyond etale realizations. PG.5/analytic-iwasawa’s generation clause changes to a larger Robba Gamma ring and assumes both psi cokernels vanish; it is not this general exponential theorem. Consumers: [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L4/derham-regulator](#target-padichodgeregulators-l4-derham-regulator).

**R26 — [PadicMeasuresIwasawaAlgebras:L5](PadicMeasuresIwasawaAlgebras.md).** Determinant lines and duality comparison for the genuine rank-d Iwasawa complex used in delta(V); identify component ideals with the correct H_E scalar extension. Consumers: [PadicHodgeRegulators:L3/regulator-determinant](#target-padichodgeregulators-l3-regulator-determinant).

**R27 — [SelmerIwasawaCohomology:L3](SelmerIwasawaCohomology.md).** Actual inverse-corestriction singular local quotients, source topology and finite-level maps for RubinIII.5.14; integral H_f is the preimage of rational H_f, not a freely selected lattice. Consumers: [PadicHodgeRegulators:L3/rubin-coleman-map](#target-padichodgeregulators-l3-rubin-coleman-map).

**R28 — [AutomorphicGaloisRepresentations:R19.5](AutomorphicGaloisRepresentations.md).** Proved local geometric crystalline/de Rham comparison for the modular representation at the stated prime, identification of the ordered differential/Frobenius basis and periods. Resolve the legacy R11 reference through an actual source-specific supplier; do not treat NeronModels as modular-curve comparison. Consumers: [PadicHodgeRegulators:L4/modular-specialization](#target-padichodgeregulators-l4-modular-specialization).

**R29 — [PhiGammaModulesAndIwasawaCohomology:PG.2](PhiGammaModulesAndIwasawaCohomology.md).** The representation-level N_dR(V) and its weight-dependent t-localization are imported from PadicHodgeTheory:R06.3/de-rham-differential-equation. Extend to the general de Rham Robba D of RJ I.3/I.9/I.13, with partial, psi, overconvergence threshold, localization and the inclusion t^-a D⊂N_rig(D)⊂t^-b D. Do not infer etaleness from this requested extension. Consumers: [PadicHodgeRegulators:L4/derham-character-domain](#target-padichodgeregulators-l4-derham-character-domain), [PadicHodgeRegulators:L4/analytic-differential-powers](#target-padichodgeregulators-l4-analytic-differential-powers), [PadicHodgeRegulators:L4/derham-regulator](#target-padichodgeregulators-l4-derham-regulator).

**R30 — [PadicHodgeTheory:P7](PadicHodgeTheory.md).** Import actual localization maps and nabla on Robba rings from the named PHT P7 nodes. Supply the radius/seminorm and constant-term estimates on general N_rig(D) needed by RJ, with the same conductor as the finite character and localization embedding. The existing representation-level comparison does not automatically provide the general module estimates. Consumers: [PadicHodgeRegulators:L4/derham-character-domain](#target-padichodgeregulators-l4-derham-character-domain), [PadicHodgeRegulators:L4/analytic-differential-powers](#target-padichodgeregulators-l4-analytic-differential-powers), [PadicHodgeRegulators:L4/derham-regulator](#target-padichodgeregulators-l4-derham-regulator), [PadicHodgeRegulators:L4/derham-interpolation-growth](#target-padichodgeregulators-l4-derham-interpolation-growth).

**R31 — [PadicMeasuresIwasawaAlgebras:L0a](PadicMeasuresIwasawaAlgebras.md).** Actual locally analytic character weight space with torsion components, q coordinate, finite conductor indexing and analytic binomial functions; admitted open balls and restriction/gluing interfaces. Consumers: [PadicHodgeRegulators:L4/derham-character-domain](#target-padichodgeregulators-l4-derham-character-domain), [PadicHodgeRegulators:L4/analytic-differential-powers](#target-padichodgeregulators-l4-analytic-differential-powers).

**R32 — [SelmerIwasawaCohomology:L3](SelmerIwasawaCohomology.md).** PG.5/iwasawa-pairing now supplies the rational Robba residue pairing, involution and KPX generator/logarithm comparison constants. The remaining contract is its comparison with the integral inverse-corestriction Galois cup-product pairing normalized exactly as LZ §2.6, pp.6–7, including finite-level specialization and coefficient extension. Keep the -sigma_-1 ell_0 factor of LZ B.6; residue-to-Galois constants are not silently one. Consumers: [PadicHodgeRegulators:L3/explicit-reciprocity](#target-padichodgeregulators-l3-explicit-reciprocity), [PadicHodgeRegulators:L3/regulator-determinant](#target-padichodgeregulators-l3-regulator-determinant).

### Proof and normalization boundaries

**The dilogarithm formula for arbitrary Bloch elements (Besser–de Jeu Conjecture 1.14, n = 2).** That the p-adic regulator of the class of Σ n_i[z_i] ∈ B(F) ⊗ Q equals ±Σ n_i D(σ z_i) is proved only when every z_i is a special unit of the valuation ring at p (BdJ Theorems 1.6(2), 1.10) or a root of unity (Theorem 1.12). For general presentations it is BdJ's Conjecture 1.14, open even for n = 2 in every source read. GSWZ (19) asserts the general identity (sourceIssues E101). Define D_p on completed K_3 as the regulator, so Theorem 9 and the Habiro export do not depend on the conjecture; only the explicit evaluation of D_p by dilogarithms of non-special symbols does. Applies to [PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison](#target-padichodgeregulators-d-2-weight-two-dilogarithm-comparison), [PadicHodgeRegulators:D.4/special-unit-formula](#target-padichodgeregulators-d-4-special-unit-formula).

**Sign of Cherbonnier–Colmez's δ_n against the Kummer cocycle.** With τ[u_n] = [ε]^{c(τ)}[u_n], (1 − τ)(log[u_n]·t^{−1} ⊗ e_1) = −c(τ)e_1, so Cherbonnier–Colmez's δ_n appears to be minus the Kummer map τ ↦ τ(α)/α unless they use α/τ(α). The sign s of L2/kummer-coleman-comparison, and through it L3/tate-coleman-comparison's Col = −Col_0, must be fixed by a careful reading of CC99 §V.3; this discrepancy remains a convention comparison, rather than a confirmed source error. L2/kummer-coleman-comparison supplies h_Iw(Delta(f_u) tensor e_1)=s kappa(u) with s in {+1,-1}, not the normalized equality used by the L3 Tate comparison. CC99 Proposition V.3.2 proof writes its Kummer representative with (1-tau), whereas the declared Selmer Kummer map uses tau(alpha)/alpha. Compare the actual period lift, Tate basis and h_Iw cocycle of I.4.1/IV.2.1 with LZ Section 6.4.2 before transporting the ell_0 Col_0=-ell_0 Col formula to this kappa. The source-normalized target requires this comparison before its sign can be transported. Rubin’s separate source theorem is retained, but comparison through this Tate node inherits the gap. Applies to [PadicHodgeRegulators:L2/kummer-coleman-comparison](#target-padichodgeregulators-l2-kummer-coleman-comparison), [PadicHodgeRegulators:L3/tate-coleman-comparison](#target-padichodgeregulators-l3-tate-coleman-comparison), [PadicHodgeRegulators:L3/rubin-coleman-map](#target-padichodgeregulators-l3-rubin-coleman-map).

**Pushforward compatibility of the curve regulator.** No source read proves that the rigid syntomic regulator on K_2 of curves commutes with finite pushforward. The node gives a route through the étale comparison (D.5/curve-etale-comparison) and corestriction compatibility of the étale regulator; Asakura and Besser–Loeffler–Zerbes use the compatibility without proof in the sources read. Applies to [PadicHodgeRegulators:D.5/curve-regulator-functoriality](#target-padichodgeregulators-d-5-curve-regulator-functoriality).

**Coleman integration with colliding supports and in genus at least one.** ColemanIntegration L1 integrates only on Y = 𝒳 ∖ D with D finite étale (one point of D per residue disc); symbols whose divisors collide modulo p need Coleman integration on general wide opens, which no layer owns. ColemanIntegration's recorded gaps 'Independence of the Frobenius lift and functoriality when Ω+ is not free' and 'Algebraic de Rham comparison for good-reduction affine curves' are inherited for genus ≥ 1. Applies to [PadicHodgeRegulators:D.5/coleman-symbol-formula](#target-padichodgeregulators-d-5-coleman-symbol-formula), [PadicHodgeRegulators:D.5/curve-syntomic-regulator](#target-padichodgeregulators-d-5-curve-syntomic-regulator).

**K_2 integrality for curves of genus at least two.** The identification K_2(𝒳)_Q → K_2(X)_Q ∩ ker(tame symbols) used to feed symbols into the regulator needs Harder-type finiteness; EllipticKTheory supplies it only for elliptic curves (E.5/harder-finiteness). Applies to [PadicHodgeRegulators:D.5/curve-syntomic-regulator](#target-padichodgeregulators-d-5-curve-syntomic-regulator).

**Vologodsky integration has no owner.** The regulator target is now sourced and planned, including the full second-kind formula, continuous/discrete components, ker N restriction and H/im N pairing quotient. ColemanIntegration Part II remains the proposed owner of harmonic gluing, Vologodsky integration and global triple/annular double indices; its producer nodes still need an external design job. Applies to [PadicHodgeRegulators:D.5/semistable-input-boundary](#target-padichodgeregulators-d-5-semistable-input-boundary), [PadicHodgeRegulators:D.5/semistable-symbol-formula](#target-padichodgeregulators-d-5-semistable-symbol-formula).

**Early shared classical log-syntomic producer.** The external CS.0–CS.3 contracts are now named with exact source-supported specifications and directed maps. CohomologyComparisons Part II must be created/planned by its own job; CP.4 is only the routing anchor and has no such producer nodes. Generic objects remain external; no ownership closure is claimed. Applies to [PadicHodgeRegulators:D.2/log-syntomic-complex](#target-padichodgeregulators-d-2-log-syntomic-complex), [PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map](#target-padichodgeregulators-d-2-fontaine-messing-kato-period-map), [PadicHodgeRegulators:D.2/small-twist-comparison](#target-padichodgeregulators-d-2-small-twist-comparison), [PadicHodgeRegulators:D.2/syntomic-exponential](#target-padichodgeregulators-d-2-syntomic-exponential), [PadicHodgeRegulators:D.5/semistable-input-boundary](#target-padichodgeregulators-d-5-semistable-input-boundary).

**Arithmetic carriers absent at the pinned libraries.** The full continuous Galois, completed K-theory, filtered syntomic/period, Wach and differential Robba carriers are README targets imported from their owners. The compact suggested file contains genuine polynomial, submodule, finite-free-module and linear-map statements with all algebraic hypotheses; it does not encode the missing arithmetic geometry with unconstrained type parameters. These missing identifications prevent a native Lean statement of the arithmetic headline theorem at the pins. Applies to [PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions](#target-padichodgeregulators-l0-hodge-tate-and-twist-conventions), [PadicHodgeRegulators:L0/fundamental-exact-sequences](#target-padichodgeregulators-l0-fundamental-exact-sequences), [PadicHodgeRegulators:L0/integral-period-interface](#target-padichodgeregulators-l0-integral-period-interface), [PadicHodgeRegulators:L1/bloch-kato-subgroups](#target-padichodgeregulators-l1-bloch-kato-subgroups), [PadicHodgeRegulators:L1/bloch-kato-exponential](#target-padichodgeregulators-l1-bloch-kato-exponential), [PadicHodgeRegulators:L1/bloch-kato-logarithm](#target-padichodgeregulators-l1-bloch-kato-logarithm), [PadicHodgeRegulators:L1/dual-exponential](#target-padichodgeregulators-l1-dual-exponential), [PadicHodgeRegulators:L1/dimension-formulas](#target-padichodgeregulators-l1-dimension-formulas), [PadicHodgeRegulators:L1/local-duality-of-conditions](#target-padichodgeregulators-l1-local-duality-of-conditions), [PadicHodgeRegulators:L1/twist-and-change-of-field](#target-padichodgeregulators-l1-twist-and-change-of-field), [PadicHodgeRegulators:L1/tate-twist-examples](#target-padichodgeregulators-l1-tate-twist-examples), [PadicHodgeRegulators:L1/abelian-variety-logarithm](#target-padichodgeregulators-l1-abelian-variety-logarithm), [PadicHodgeRegulators:L1/integral-logarithm-unramified](#target-padichodgeregulators-l1-integral-logarithm-unramified), [PadicHodgeRegulators:L1/semilocal-bloch-kato](#target-padichodgeregulators-l1-semilocal-bloch-kato), [PadicHodgeRegulators:L2/fontaine-iwasawa-map](#target-padichodgeregulators-l2-fontaine-iwasawa-map), [PadicHodgeRegulators:L2/generator-independence](#target-padichodgeregulators-l2-generator-independence), [PadicHodgeRegulators:L2/root-change](#target-padichodgeregulators-l2-root-change), [PadicHodgeRegulators:L2/local-iwasawa-twist](#target-padichodgeregulators-l2-local-iwasawa-twist), [PadicHodgeRegulators:L2/twist-compatibility](#target-padichodgeregulators-l2-twist-compatibility), [PadicHodgeRegulators:L2/wach-psi-fixed-vectors](#target-padichodgeregulators-l2-wach-psi-fixed-vectors), [PadicHodgeRegulators:L2/character-specialisation](#target-padichodgeregulators-l2-character-specialisation), [PadicHodgeRegulators:L2/lattice-and-coefficient-squares](#target-padichodgeregulators-l2-lattice-and-coefficient-squares), [PadicHodgeRegulators:L2/kummer-coleman-comparison](#target-padichodgeregulators-l2-kummer-coleman-comparison), [PadicHodgeRegulators:D.1/teichmuller-unit-decomposition](#target-padichodgeregulators-d-1-teichmuller-unit-decomposition), [PadicHodgeRegulators:D.1/unramified-frobenius-on-roots](#target-padichodgeregulators-d-1-unramified-frobenius-on-roots), [PadicHodgeRegulators:D.1/etale-algebra-dilogarithm](#target-padichodgeregulators-d-1-etale-algebra-dilogarithm), [PadicHodgeRegulators:D.1/dilogarithm-scalar-extension](#target-padichodgeregulators-d-1-dilogarithm-scalar-extension), [PadicHodgeRegulators:D.1/combined-dilogarithm](#target-padichodgeregulators-d-1-combined-dilogarithm), [PadicHodgeRegulators:D.1/regulator-normalisation-dictionary](#target-padichodgeregulators-d-1-regulator-normalisation-dictionary), [PadicHodgeRegulators:D.1/unit-logarithm-kernel](#target-padichodgeregulators-d-1-unit-logarithm-kernel), [PadicHodgeRegulators:D.1/logarithm-norm-trace](#target-padichodgeregulators-d-1-logarithm-norm-trace), [PadicHodgeRegulators:D.2/etale-regulator](#target-padichodgeregulators-d-2-etale-regulator), [PadicHodgeRegulators:D.2/rigid-syntomic-cohomology](#target-padichodgeregulators-d-2-rigid-syntomic-cohomology), [PadicHodgeRegulators:D.2/syntomic-regulator](#target-padichodgeregulators-d-2-syntomic-regulator), [PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison](#target-padichodgeregulators-d-2-syntomic-etale-regulator-comparison), [PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison](#target-padichodgeregulators-d-2-weight-two-dilogarithm-comparison), [PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison](#target-padichodgeregulators-d-2-higher-weight-polylogarithm-comparison), [PadicHodgeRegulators:D.2/gros-normalisation](#target-padichodgeregulators-d-2-gros-normalisation), [PadicHodgeRegulators:D.2/log-syntomic-complex](#target-padichodgeregulators-d-2-log-syntomic-complex), [PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map](#target-padichodgeregulators-d-2-fontaine-messing-kato-period-map), [PadicHodgeRegulators:D.2/small-twist-comparison](#target-padichodgeregulators-d-2-small-twist-comparison), [PadicHodgeRegulators:D.2/syntomic-exponential](#target-padichodgeregulators-d-2-syntomic-exponential), [PadicHodgeRegulators:D.3/unramified-etale-algebra](#target-padichodgeregulators-d-3-unramified-etale-algebra), [PadicHodgeRegulators:D.3/completed-k3-unramified](#target-padichodgeregulators-d-3-completed-k3-unramified), [PadicHodgeRegulators:D.3/completed-k3-bloch-description](#target-padichodgeregulators-d-3-completed-k3-bloch-description), [PadicHodgeRegulators:D.3/finite-polylogarithm](#target-padichodgeregulators-d-3-finite-polylogarithm), [PadicHodgeRegulators:D.3/finite-polylogarithm-reduction](#target-padichodgeregulators-d-3-finite-polylogarithm-reduction), [PadicHodgeRegulators:D.3/dilogarithm-integrality](#target-padichodgeregulators-d-3-dilogarithm-integrality), [PadicHodgeRegulators:D.3/residue-spanning](#target-padichodgeregulators-d-3-residue-spanning), [PadicHodgeRegulators:D.3/root-of-unity-classes](#target-padichodgeregulators-d-3-root-of-unity-classes), [PadicHodgeRegulators:D.3/local-regulator](#target-padichodgeregulators-d-3-local-regulator), [PadicHodgeRegulators:D.3/unramified-regulator-theorem](#target-padichodgeregulators-d-3-unramified-regulator-theorem), [PadicHodgeRegulators:D.3/roots-of-unity-generate](#target-padichodgeregulators-d-3-roots-of-unity-generate), [PadicHodgeRegulators:D.4/global-p-adic-regulator](#target-padichodgeregulators-d-4-global-p-adic-regulator), [PadicHodgeRegulators:D.4/special-unit-formula](#target-padichodgeregulators-d-4-special-unit-formula), [PadicHodgeRegulators:D.4/norm-trace-compatibility](#target-padichodgeregulators-d-4-norm-trace-compatibility), [PadicHodgeRegulators:D.4/frobenius-compatibility](#target-padichodgeregulators-d-4-frobenius-compatibility), [PadicHodgeRegulators:D.4/torsion-and-denominators](#target-padichodgeregulators-d-4-torsion-and-denominators), [PadicHodgeRegulators:D.4/habiro-regulator-export](#target-padichodgeregulators-d-4-habiro-regulator-export), [PadicHodgeRegulators:D.4/padic-k3-regulator-injectivity](#target-padichodgeregulators-d-4-padic-k3-regulator-injectivity), [PadicHodgeRegulators:D.4/example-cubic-field-five-two](#target-padichodgeregulators-d-4-example-cubic-field-five-two), [PadicHodgeRegulators:D.5/curve-weight-two-target](#target-padichodgeregulators-d-5-curve-weight-two-target), [PadicHodgeRegulators:D.5/open-curve-splitting](#target-padichodgeregulators-d-5-open-curve-splitting), [PadicHodgeRegulators:D.5/curve-syntomic-regulator](#target-padichodgeregulators-d-5-curve-syntomic-regulator), [PadicHodgeRegulators:D.5/coleman-symbol-formula](#target-padichodgeregulators-d-5-coleman-symbol-formula), [PadicHodgeRegulators:D.5/curve-etale-comparison](#target-padichodgeregulators-d-5-curve-etale-comparison), [PadicHodgeRegulators:D.5/curve-regulator-functoriality](#target-padichodgeregulators-d-5-curve-regulator-functoriality), [PadicHodgeRegulators:D.5/semistable-input-boundary](#target-padichodgeregulators-d-5-semistable-input-boundary), [PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator](#target-padichodgeregulators-d-5-relative-curve-syntomic-regulator), [PadicHodgeRegulators:D.5/smooth-family-specialisation](#target-padichodgeregulators-d-5-smooth-family-specialisation), [PadicHodgeRegulators:D.5/semistable-continuous-regulator](#target-padichodgeregulators-d-5-semistable-continuous-regulator), [PadicHodgeRegulators:D.5/semistable-symbol-formula](#target-padichodgeregulators-d-5-semistable-symbol-formula).

**Relative filtered F-isocrystal and syntomic producers.** The source-supported relative symbol-extension and specialization targets are planned here, but the generic Fil-F-MIC/Ext, relative rigid/de Rham comparison and relative syntomic evaluation producers must be routed externally by their owner. Stage-only supplier IDs are requests, not existing complete contracts. The domain remains the tame-kernel Milnor symbols and Frobenius-compatible smooth points of the read source. Applies to [PadicHodgeRegulators:D.5/relative-curve-syntomic-regulator](#target-padichodgeregulators-d-5-relative-curve-syntomic-regulator), [PadicHodgeRegulators:D.5/smooth-family-specialisation](#target-padichodgeregulators-d-5-smooth-family-specialisation).

**Bounded evaluation, division and image descent.** The authentic O_E[[X]][1/varpi] instance needs bounded division, evaluation kernels and nonzero X-x. The LLZ4.12 determinant argument additionally needs a bounded-to-analytic image equality/descent theorem; equal H_E determinants do not prove equality of arbitrary bounded submodules. Applies to [PadicHodgeRegulators:L4/constraint-basis](#target-padichodgeregulators-l4-constraint-basis), [PadicHodgeRegulators:L4/actual-coleman-image](#target-padichodgeregulators-l4-actual-coleman-image).

**Actual arithmetic carrier signatures.** Native Wach, D_cris/D_dR, H_Iw, distribution and differential Robba carriers are absent at the pinned libraries. The named current supplier contracts have now been read and imported at target level. Elaborating them and their comparison maps remains Tau Ceti implementation work; the suggested file states only the actual algebraic milestones listed in leanCorrespondence. Applies to [PadicHodgeRegulators:L3/crystalline-regulator](#target-padichodgeregulators-l3-crystalline-regulator), [PadicHodgeRegulators:L4/coleman-coordinates](#target-padichodgeregulators-l4-coleman-coordinates), [PadicHodgeRegulators:L4/derham-regulator](#target-padichodgeregulators-l4-derham-regulator).

**Derivative obstruction exactness.** Berger p.120 cites Perrin–Riou1994 Section2.2 for exactness of the derivative-obstruction sequence. The remaining input is solvability and the kernel on authentic period modules, including the top t^h eigenvectors and invariant quotient. Applies to [PadicHodgeRegulators:L3/big-exponential-obstruction](#target-padichodgeregulators-l3-big-exponential-obstruction), [PadicHodgeRegulators:L3/big-exponential](#target-padichodgeregulators-l3-big-exponential).

**Determinant normalization.** LLZ4.7 imports Perrin–Riou delta(V), Proposition3.6.7 and Colmez1998 IX.4.5. Berger/LZ supply the read reciprocity route, but the exact determinant-line normalization and rank-d Iwasawa comparison are still required. Pairing equality alone is not the determinant theorem. Applies to [PadicHodgeRegulators:L3/regulator-determinant](#target-padichodgeregulators-l3-regulator-determinant), [PadicHodgeRegulators:L4/actual-coleman-image](#target-padichodgeregulators-l4-actual-coleman-image).

**Cyclotomic growth estimate.** LZ4.8 reduces its quotient-slope bound to a one-variable statement called well known. Supply the actual Wach coefficient/annulus seminorm estimate and identify its Mellin image with LAD order-h distributions; order-zero boundedness is not automatic. Applies to [PadicHodgeRegulators:L3/growth](#target-padichodgeregulators-l3-growth).

**Integral lower inclusion.** Supply phi(pi)^(k-1)(phi*N(T))^psi0 subset (1-phi)N(T)^psi1 over O_E for the actual modular lattice. LLZ2011 cites the proof of LLZ2010 Prop4.11; the latter’s printed (C),(D) hypotheses and rational one-coordinate proof do not by themselves establish the wider integral assertion. Retain those restrictions until integral convergence and coefficient descent are proved. Applies to [PadicHodgeRegulators:L4/integral-image-index](#target-padichodgeregulators-l4-integral-image-index).

**N_rig and exponential comparison.** PHT/PG must supply the authentic N_rig(D), partial, localization, annulus norms, nabla_h Delta subset D and the Nakamura2014 cohomological exponential comparison cited by RJ I.10/I.22. The downstream formulas require this independent producer comparison. Applies to [PadicHodgeRegulators:L4/analytic-differential-powers](#target-padichodgeregulators-l4-analytic-differential-powers), [PadicHodgeRegulators:L4/derham-interpolation-growth](#target-padichodgeregulators-l4-derham-interpolation-growth).

**Crystalline/de Rham normalization square.** Prove the map-level conversion of RJ Amice lambda_i, inverse finite-character convention, alpha_i^-n and Gauss dual bases to LLZ/LZ Mellin. Also prove the general crystalline extension asserted by RJ I.15/I.29: the displayed IC9 calculation starts in a strict-negative-slope eigenbasis subcase. A finite coefficient extension alone does not diagonalize a nonsemisimple phi. No global extension is inferred for general de Rham D. Applies to [PadicHodgeRegulators:L4/crystalline-derham-comparison](#target-padichodgeregulators-l4-crystalline-derham-comparison).

**Rubin ordinary/multiplicative construction.** The supplied public Rubin book states PropositionIII.5.14 and refers to the appendix of Rubin1998, Euler systems and modular elliptic curves, LMS Lecture Notes254, pp.351–367, for the construction. The required producer input is its integral singular-quotient descent and injectivity, including the ordinary/multiplicative differential normalization. Applies to [PadicHodgeRegulators:L3/rubin-coleman-map](#target-padichodgeregulators-l3-rubin-coleman-map), [PadicHodgeRegulators:L4/split-multiplicative-augmentation](#target-padichodgeregulators-l4-split-multiplicative-augmentation).

**Unrestricted crystalline codomain.** LZ Section4.4 equation(10) constructs the normalized map for arbitrary crystalline weights into Frac(H_E) via logarithmic-factor division. An H_E-valued conclusion requires an additional cancellation theorem in its stated weight range; it does not follow for every V. Applies to [PadicHodgeRegulators:L3/meromorphic-twist-extension](#target-padichodgeregulators-l3-meromorphic-twist-extension).

**Normalized local Iwasawa pairing and dual-exponential adjunction.** PG.5/iwasawa-pairing now supplies the rational Robba residue pairing, involution and KPX generator/logarithm comparison constants. The remaining contract is its comparison with the integral inverse-corestriction Galois cup-product pairing normalized exactly as LZ §2.6, pp.6–7, including finite-level specialization and coefficient extension. Keep the -sigma_-1 ell_0 factor of LZ B.6; residue-to-Galois constants are not silently one. The finite-level adjunction order was checked against LZ §2.4 and B.6 and is now explicit in L1/dual-exponential. That check does not establish the integral Iwasawa pairing normalization. Applies to [PadicHodgeRegulators:L3/explicit-reciprocity](#target-padichodgeregulators-l3-explicit-reciprocity), [PadicHodgeRegulators:L3/regulator-determinant](#target-padichodgeregulators-l3-regulator-determinant).

**Representation-level L2 comparison versus general de Rham Robba modules.** The new precise dependency L2/fontaine-iwasawa-map applies to etale D(T) attached to a representation. L2/character-specialisation likewise specializes representation Iwasawa classes. These nodes support only that specialization of the L4 construction. RJ’s general de Rham D and N_rig(D) need the separately requested PG.5 Nakamura comparison and its localization/exponential interface; no etaleness or representation realization is inferred from the new node reference. Retain the existing N_rig/exponential and crystalline normalization gaps. Applies to [PadicHodgeRegulators:L4/derham-regulator](#target-padichodgeregulators-l4-derham-regulator), [PadicHodgeRegulators:L4/derham-interpolation-growth](#target-padichodgeregulators-l4-derham-interpolation-growth), [PadicHodgeRegulators:L4/crystalline-derham-comparison](#target-padichodgeregulators-l4-crystalline-derham-comparison).

**Unsupported root assembly drops mathematical corrections.** The live merge/promotion path does not apply the root’s imports, source aliases or ordered corrections. The reader and canonical merged declarations therefore disagree. Resolve this through a supported, validated assembler or coordinated canonical-node migration, then recheck all affected targets and planets. This is the independent review’s blocking finding; it is separate from the mathematical boundaries above.

## Suggested-file correspondence

The [suggested file](../suggested/PadicHodgeRegulators.lean) states only light definitions and named milestones whose genuine carriers exist at the pins. Its first theorem is the finite-free Zₚ conclusion needed at the end of the completed local K₃ proof. It explicitly assumes the basis, integral normalized linear map and spanning modulo p; it does not provide any of those arithmetic identifications. The Frobenius norm identity is a Qₚ-linear algebra milestone, with the filtered comparison and transported K-action specified in D.5. The analytic Iwasawa, syntomic and general de Rham headline constructions remain full mathematical targets above because their carriers are absent at these pins.

| Lean declaration | Mathematical correspondence |
| --- | --- |
| `finitePolylog` | [PadicHodgeRegulators:D.3/finite-polylogarithm](#target-padichodgeregulators-d-3-finite-polylogarithm) |
| `residueDilogValue` | [PadicHodgeRegulators:D.3/residue-dilogarithm-function](#target-padichodgeregulators-d-3-residue-dilogarithm-function) |
| `evaluationConstraints` | [PadicHodgeRegulators:L4/evaluation-constraints](#target-padichodgeregulators-l4-evaluation-constraints) |
| `shearMatrix` | [PadicHodgeRegulators:L4/shear-matrix](#target-padichodgeregulators-l4-shear-matrix) |
| `unramified_regulator_algebraic_milestone` | D.3/unramified-regulator-theorem: finite-free Z_p consequence conditional on the integral normalized map and residue spanning; the completed K3 identification remains in README. |
| `curve_frobenius_norm_milestone` | D.5/curve-weight-two-target: exact linear norm polynomial; filtered complexes and transported K-action remain README targets. |
| `finitePolylog_two_double_zero` | D.3/finite-polylogarithm: double zero for p>3. |
| `residueDilogValue_five_values` | D.3/residue-dilogarithm-function: all admissible F5 values. |
| `residueDilogValue_spans` | D.3/residue-spanning: values and differences on the q-2 point domain. |
| `constraint_basis_and_determinant` | L4/constraint-basis and constraint-determinant: explicit evaluation kernels, domain and distinct-point hypotheses. |
| `singular_euler_lift_criterion` | L3/singular-euler-specialization: native range criterion; actual period lift is a README target |
| `coleman_row_covariance` | L4/constant-basis-covariance: native matrices with explicit scalar map |
| `shearMatrix_unit` | L4/integral-shear-choice: unit determinant |

There are two proved examples per kept definition when its discriminating checks fit the native carriers: finitePolylog at (5,2,2) and the p=3 boundary; empty evaluation constraints and the X-versus-1 condition at zero; and integral shear determinants including a nonunit determinant. The residue-value check is the named theorem `residueDilogValue_five_values`, rather than an admitted example. Its remaining checks distinguish the excluded points and Frobenius direction. The complete API and all discriminating mathematical tests remain with each target above.

## Independently checked source issues

The verdicts below concern the exact public versions in the references. Earlier workers’ publication/errata searches remain attributed to them; this review checked the cited mathematical passages and does not claim a new general errata search. The full reasons and historical verdicts are in the packet.

| Issue | Source and locator | Verdict and resolution |
| --- | --- | --- |
| E101 | GSWZ2024, §1.5, after (19), p. 9 (arXiv 2412.04241v2) | confirmed: Unrestricted dilogarithm formula exceeds the proved special-unit domain. |
| E102 | GSWZ2024, Theorem 9 and proof, p. 39 (arXiv 2412.04241v2) | confirmed: Product generation needs difference-spanning to isolate components. |
| E103 | BdJ2003, Remark 1.13, p. 6 (arXiv math/0110334v2) | rejected: No demonstrated error without identifying the higher-weight input-symbol normalizations. |
| E104 | BdJ2003, Proof of Theorem 1.12, p. 41 (arXiv math/0110334v2) | confirmed: Include p-primary exponent one and retain the theorem’s sign/factorial. |
| E105 | BdJ2003, Proof of Lemma 4.10 and (4.4), pp. 24–25 (arXiv math/0110334v2) | confirmed: Correct differential scope and the eta/epsilon variable in the proof. |
| E106 | CN2017, §1, p. 2 and §2.4.3, p. 23 (arXiv 1505.06471v4) | confirmed: Use the strict residue bound b<p−1 for uniqueness. |
| E107 | CN2017, Theorem 1.1(ii), p. 2, against Theorem 5.4(ii), p. 54 (arXiv 1505.06471v4) | confirmed: The proved bound retains N_K; the stronger introduction statement lacks that proof. |
| E108 | NN2016, Remark 4.14, p. 54 (arXiv 1309.7620v5) | confirmed: The stated vanishing range misses the local weight-one exception. |
| E109 | NN2016, Theorem 5.9, p. 59 (arXiv 1309.7620v5) | confirmed: Regulator degree is i, consistent with the preceding construction. |
| E110 | NN2016, Proposition 2.16, p. 15 (arXiv 1309.7620v5) | confirmed: Retain the degree-one weight-zero and degree-two weight-one exceptions. |
| E111 | HK2011, Definition 0.4.5, p. 6 (arXiv math/0612611v1) | confirmed: Permute factors in the antisymmetrized trace. |
| E112 | Berger2003, Lemma II.1, p. 10 (arXiv math/0209283v1) | confirmed: Use the corrected psi=1 and level restrictions of the published lemma. |
| E113 | FO, Proof of Proposition 6.36(1), p. 150 | confirmed: Degree-one local duality pairs with degree one, rather than degree zero. |
| E114 | HK2, Appendix A, Proposition A.3, p. 47 (arXiv math/0101071v2) | confirmed: Replace the local field label K by the statement’s global field F. |
| E115 | Berger2003DM, Proof of Theorem A.3, p. 126 (Documenta version) | confirmed: Correct the weight-sign word under the paper’s declared convention. |
| E116 | LZ2014, §2, p. 7 (arXiv 1108.5954v3) | confirmed: The psi-fixed containment is Berger Theorem A.3, rather than A.2. |
| E117 | AC20, Remark 3.2(1), p. 15 (arXiv 2003.08888v2) | confirmed: AC20 prints Remark 8.6.3; the correct reference is Besser2000 Proposition 8.6(3), author pp.26–27. The prior review’s reading of 8.6.6 was mistaken. |
| E301 | LLZ2011, Published Proposition 5.11, first sentence of proof, p. 1129; compare arXiv:1006.5163v2 Proposition 5.11 and Remark 5.12, p. 25. | confirmed: Integral shear requires a unit determinant; the preprint maximal-ideal choice supplies it. |
| E302 | LLZ2011, Published Proposition 4.2 proof, p. 1118, after the definition of S double-prime. | confirmed: The newly constrained module is contained in the prior module. |
| E303 | LLZ2011, Published Proposition5.9, p.1127, displayed ordered-pair quotient functional; compared arXiv1006.5163v2. | confirmed: Use the ordered functional (p−1)g(0)−(2−a_p)h(0). |
| E304 | LLZ2011, Published Corollary4.13, p.1124; scalar ring of the displayed sequence. | confirmed: Keep the bounded source over Lambda_E, or extend the entire sequence. |
| E305 | LLZ2011, Published Proposition4.11, p.1123, identification of the Coleman coefficient-space subspaces. | confirmed: Transport the period subspace by M(x) inverse in row coordinates. |
| E118 | GSWZ2024, Example 4.3, equation (273), p.54 | confirmed: Equation (273)’s second root exponent is 2. Already recorded as paper issue E56. |
| E119 | GSWZ2024, Proposition 3.3, equation (179), p.38, and Theorem 9, p.39 | confirmed: Exclude the identity in every root component. Already recorded as paper issue E38. |
| E120 | GSWZ2024, Theorem 9 and proof, p.39, compared with Lemma 3.1, p.38 | confirmed: Prove completed integral containment independently of root generation. Already recorded as paper issue E39. |

## References

The locators attached to each target identify the exact version and mathematical statement used. The source identities below distinguish Berger's preprint from its published numbering and distinguish the supplied Rubin text from the Kolyvagin title attached to its original routing record. Mathematical statements are paraphrased; no source passage is reproduced.

- **GSWZ2024**. Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier. The Habiro ring of a number field. [Source](https://arxiv.org/abs/2412.04241v2).
- **BdJ2003**. Amnon Besser, Rob de Jeu. The syntomic regulator for the K-theory of fields. [Source](https://arxiv.org/abs/math/0110334v2).
- **HK2011**. Annette Huber, Guido Kings. A p-adic analogue of the Borel regulator and the Bloch–Kato exponential map. [Source](https://arxiv.org/abs/math/0612611v1).
- **Tamme2014**. Georg Tamme. Karoubi's relative Chern character, the rigid syntomic regulator, and the Bloch–Kato exponential map. [Source](https://arxiv.org/abs/1111.4109v4).
- **NN2016**. Jan Nekovář, Wiesława Nizioł (appendix by Laurent Berger). Syntomic cohomology and p-adic regulators for varieties over p-adic fields. [Source](https://arxiv.org/abs/1309.7620v5).
- **CN2017**. Pierre Colmez, Wiesława Nizioł. Syntomic complexes and p-adic nearby cycles. [Source](https://arxiv.org/abs/1505.06471v4).
- **Berger2003**. Laurent Berger. Bloch and Kato's exponential map: three explicit formulas. [Source](https://arxiv.org/abs/math/0209283v1).
- **Berger2003DM**. Laurent Berger. Bloch and Kato's exponential map: three explicit formulas. [Source](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf).
- **CC99**. Frédéric Cherbonnier, Pierre Colmez. Théorie d'Iwasawa des représentations p-adiques d'un corps local. [Source](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf).
- **Limites2004**. Laurent Berger. Limites de représentations cristallines. [Source](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf).
- **LLZWach**. Antonio Lei, David Loeffler, Sarah Livia Zerbes. Wach modules and Iwasawa theory for modular forms. [Source](https://arxiv.org/abs/0912.1263v3).
- **LZ2014**. David Loeffler, Sarah Livia Zerbes. Iwasawa theory and p-adic L-functions over Z_p^2-extensions. [Source](https://arxiv.org/pdf/1108.5954v3).
- **FO**. Jean-Marc Fontaine, Yi Ouyang. Theory of p-adic Galois representations. [Source](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf).
- **Rubin2000**. Karl Rubin. Euler Systems. [Source](https://swc-math.github.io/notes/files/99RubinES.pdf).
- **HK2**. Annette Huber, Guido Kings. Bloch–Kato conjecture and main conjecture of Iwasawa theory for Dirichlet characters. [Source](https://arxiv.org/abs/math/0101071v2).
- **BNQD2002**. Denis Benois, Thong Nguyen Quang Do. Les nombres de Tamagawa locaux et la conjecture de Bloch et Kato pour les motifs Q(m) sur un corps abélien. [Source](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf).
- **FontaineBPR1994**. Jean-Marc Fontaine. Appendice: Sur un théorème de Bloch et Kato (lettre à B. Perrin-Riou). [Source](https://www.imo.universite-paris-saclay.fr/~fontaine/bpr.pdf).
- **Benois2014**. Denis Benois. p-adic heights and p-adic Hodge theory. [Source](https://arxiv.org/abs/1412.7305v1).
- **AM18**. Masanori Asakura, Kei Miyatani. F-isocrystal and syntomic regulators via hypergeometric functions. [Source](https://arxiv.org/abs/1711.08854v2).
- **AC20**. Masanori Asakura, Masataka Chida (Appendix B by François Brunault). A numerical approach toward the p-adic Beilinson conjecture for elliptic curves over Q. [Source](https://arxiv.org/pdf/2003.08888v2).
- **BdJ2012**. Amnon Besser, Rob de Jeu. The syntomic regulator for K4 of curves. [Source](https://arxiv.org/pdf/1208.0516v1).
- **Ara2003**. Amnon Besser. p-adic Arakelov theory. [Source](https://arxiv.org/abs/math/0301029v1).
- **BZ2017**. Amnon Besser, Sarah Livia Zerbes. Vologodsky integration on curves with semi-stable reduction. [Source](https://arxiv.org/abs/1711.06950v1).
- **TauCetiTeichmuller**. The Tau Ceti contributors. TauCeti/NumberTheory/LocalField/Teichmuller.lean. [Source](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369).
- **Besser2000**. Amnon Besser. Syntomic regulators and p-adic integration I: rigid syntomic regulators. [Source](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz).
- **BK1990**. Spencer Bloch and Kazuya Kato. L-functions and Tamagawa numbers of motives. [Source](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf).
- **EN2016**. Veronika Ertl and Wiesława Nizioł. Syntomic cohomology and p-adic motivic cohomology. [Source](https://arxiv.org/pdf/1603.01705v2).
- **AM2022**. Masanori Asakura and Kazuaki Miyatani. Milnor K-theory, F-isocrystals and syntomic regulators. [Source](https://arxiv.org/pdf/2007.14255v2).
- **Asakura2023**. Masanori Asakura. New p-adic hypergeometric functions and syntomic regulators. [Source](https://numdam.org/item/10.5802/jtnb.1250.pdf).
- **Besser2025**. Amnon Besser. Regulators and derivatives of Vologodsky functions with respect to log(p). [Source](https://arxiv.org/pdf/2502.16738v1).
- **BR2019**. Amnon Besser and Wayne Raskind. Toric regulators. [Source](https://arxiv.org/pdf/1910.06877v1).
- **LLZ2011**. Antonio Lei, David Loeffler, Sarah Livia Zerbes. Coleman maps and the p-adic regulator. [Source](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf).
- **LLZ2010v2**. Antonio Lei, David Loeffler, Sarah Livia Zerbes. Coleman maps and the p-adic regulator. [Source](https://arxiv.org/pdf/1006.5163v2).
- **LLZWach2010**. Antonio Lei, David Loeffler, Sarah Livia Zerbes. Wach modules and Iwasawa theory for modular forms. [Source](https://antoniolei.com/wp-content/uploads/2014/09/modularforms.pdf).
- **RJ2018**. Joaquín Rodrigues Jacinto. (phi,Gamma)-modules de de Rham et fonctions L p-adiques. [Source](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf).
