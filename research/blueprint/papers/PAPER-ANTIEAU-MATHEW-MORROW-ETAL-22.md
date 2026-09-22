# PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22 — On the Beilinson fiber square

Claude Code — session `cc-7b31c4`; issue #1312; read on 22 September 2026.

Benjamin Antieau, Akhil Mathew, Matthew Morrow and Thomas Nikolaus, *On the Beilinson fiber square*, Duke
Mathematical Journal **171** (2022), no. 18, 3707–3806, `doi:10.1215/00127094-2022-0037`. Read in the authors'
public version, [arXiv:2003.12541v2](https://arxiv.org/abs/2003.12541v2) (29 September 2021, the last preprint
version, whose comment records "many minor updates based on referee reports; new, simplified proof of integral
comparison theorem for syntomic cohomology") — in its **LaTeX source** (`Beilinson-revised-arXivstyle.tex`, 5577
lines, source archive sha256 `289e0749…`), since `pdftotext` was unavailable here.

**On numbering, and on the published version.** Duke is not open access and the published text **could not be
consulted here**, so every locator is a preprint number, and the two source issues below are recorded against the
preprint with no claim about print. The preprint numbers all environments by a single counter per section
(`\newtheorem{definition}{Definition}[section]`), so Definition 2.1, Remark 2.2, Example 2.3, …; the appendices
are A.n and B.n. The lettered statements of the introduction are unnumbered and are recorded at their numbered
counterparts: **A** at Theorem 2.12 with Corollary 3.9, **B** at Theorem 2.20, **C** at Theorem 3.4, **D** at
Theorem 4.9, **E** at Theorem 4.14, **F** at Theorem 6.22, **G** at Theorem 5.1, **H** at Corollary 6.23.

The paper has been extracted into **137 items**: 33 are planned by existing layers, and the remaining 104 are
routed exactly once — **11 to a Part II** of *Hochschild, cyclotomic and refined trace methods*, and **93** as
sources of six existing roadmaps. No item is `library`: at the pinned commits neither library has spectra,
cyclotomic structures, Hochschild or cyclic homology of ring spectra, prisms, or derived de Rham cohomology.

## What the paper proves

Write `Q_p` for p-completion followed by inversion of `p` (not rationalization before completion).

* **Theorem A** (Theorem 2.12 with Corollary 3.9). For any ring `R` the square with rows
  `TC(R;Z_p) → TC(R ⊗_S F_p)` and `HC^-(R;Z_p) → HP(R;Z_p)` becomes cartesian after inverting `p`; its right
  vertical map is a new **p-adic Chern character** `tr_crys : K(R/p;Q_p) → HP(R;Q_p)`. For `R` commutative and
  henselian along `(p)`, Clausen–Mathew–Morrow then gives `K(R,(p);Q_p) ≃ ΣHC(R;Q_p)`.
* **Theorem C** (Theorem 3.4). If `f : A → A′` of connective associative ring spectra is a quasi-isogeny and
  `π_0(f)` is surjective with nilpotent kernel, then `THH(A) → THH(A′)` is a quasi-isogeny **in cyclotomic
  spectra**. This is what replaces the spectral reduction `R ⊗_S F_p` by the ordinary ring `R/p`, and it yields
  **Corollary B**: `K(R,(p);Z_p)` and `ΣHC(R,(p);Z_p)` are quasi-isogenous, and agree after `(2p−5)`-truncation
  when `R` is `p`-torsion free. The denominators are controlled effectively, because `τ_{≤2i−2}THH(F_p)` is
  `S^1`-equivariantly killed by `p^i`.
* **Theorems D and E** (Theorems 4.9 and 4.14). For a proper smooth `p`-adic formal `O_K`-scheme, a class in
  `K_0` of the special fibre lifts to continuous `K`-theory exactly when its crystalline Chern character lands
  in the Hodge filtration — the theorem of Bloch, Esnault and Kerz. For an **arbitrary** qcqs `p`-adic formal
  scheme with bounded `p`-power torsion and any `i`, there is a natural obstruction class
  `c(x) ∈ ⊕_r H^{2r−i}(LΩ_X/LΩ_X^{≥r})_{Q_p}` vanishing exactly when `x ∈ K_i(X_1;Q)` lifts, with a natural
  equivalence `cofib(K^cts(X;Q) → K(X_1;Q)) ≃ ⊕_r (LΩ_X/LΩ_X^{≥r}[2r])_{Q_p}`.
* **Theorem G** (Theorem 5.1) and **rigidity** (Theorem 5.2). `Z_p(i)(R) ∈ D^{≤i+1}(Z_p)` for `R` quasisyntomic,
  and `D^{≤i}` if `R` is `w`-strictly local; `Z_p(i)` and `Fil^{≥i}TC(−;Z_p)` are left Kan extended from
  `p`-complete polynomial algebras, hence defined on all simplicial commutative rings; and for a henselian pair
  of `p`-complete rings, `fib(Z_p(i)(R) → Z_p(i)(R/I)) ∈ D^{≤i}(Z_p)`. The proofs run on a graded refinement of
  the Bhatt–Morrow–Scholze package, on relative `THH` over the cyclotomic base `S[z]`, and on the `I`-adic
  nilpotence of the divided Frobenius modulo `p`.
* **Theorem F** (Theorem 6.22) and **Corollary H** (Corollary 6.23). `Q_p(i)(R) ≃ fib(φ − p^i : LΩ_R^{≥i} →
  LΩ_R)_{Q_p}` for all `i`, and `Z_p(i)(R) ≃ fib(φ/p^i − id)` for `i ≤ p−2`: the graded pieces of the motivic
  filtration on `TC` **are** the syntomic cohomology of Fontaine and Messing. Hence
  `TC(R;Q_p) ≃ ⊕_{i≥0} fib(φ − p^i : LΩ_R^{≥i} → LΩ_R)_{Q_p}` for every simplicial commutative ring.
* **Section 7.** Wagoner's `K_*(F;Q_p)` for a `p`-adic field, reproved; integral `p`-adic `K`-groups of `W(k)`
  and of a ramified `O_F` in the range the effective bounds allow; the syntomic cohomology of a DVR; the
  **fundamental exact sequence** `0 → Q_p(i) → B_crys^{φ=p^i} → B_dR^+/Fil^{≥i} → 0` as a special case of the
  square on graded pieces; and the Colmez–Nizioł and Tsuji comparison for `p`-adic nearby cycles.
* **Appendix A** develops **twisted Tate diagonals**, which is how a graded, filtered or `S[z]`-linear ring
  spectrum gets a cyclotomic structure on its `THH` whose Frobenius multiplies the grading by `p`. **Appendix B**
  supplies the left Kan extension and Frobenius-descent lemmas.

## What the atlas already has

Unusually much — the atlas has a layer that exists *for this paper*.

* **`RefinedTraceMethods:RT.3b`**, "The Beilinson square and the prismatic F-crystal proof bridge", instructs its
  blueprint to prove *Antieau–Mathew–Morrow–Nikolaus, On the Beilinson fiber square, **Theorem 2.12 and Corollary
  3.9***, to supply "the quasi-isogeny comparison of §3", to prove the shift dictionary
  `fib(TC(R;Q_p)→TC(R/p;Q_p)) ≃ ΣHC(R;Q_p)` (and to remember that the rotated third term is `Σ²HC`), and to
  "export the p-torsion-free p-complete specialization and filtered refinement of **AMMN Theorem 6.17**" used by
  `PrismaticCohomology:PR.7` for the prismatic F-crystal/crystalline-lattice equivalence. Those four statements
  are therefore `planned`, and the paper is the layer's source for everything else.
* RT.1 plans Hochschild, cyclic, negative cyclic and periodic cyclic homology with the SBI sequence; RT.2 `THH`,
  the circle action, cyclotomic spectra, `TC`, `TC^-`, `TP`; RT.3 the cyclotomic trace, the relative nilpotent
  comparison (Dundas–Goodwillie–McCarthy) and the henselian comparison (Clausen–Mathew–Morrow); RT.6 the BMS2
  quasisyntomic `THH`/`TC^-`/`TP` computation and the motivic-filtration interface, explicitly "using AMMN's
  filtered refinements".
* `PrismaticCohomology` PR.3 plans the Nygaard filtration, divided Frobenius and Breuil–Kisin twists, and PR.4
  the syntomic/Tate-twist fibres with their truncation, nearby-cycle and logarithmic de Rham–Witt comparisons.
* `DerivedDeRhamCohomology` DD.0–DD.4 plan the cotangent complex, derived completion, derived de Rham cohomology
  with the Hodge filtration, derived Cartier theory and the crystalline comparison; DD.5 the quasisyntomic site.
  `CrystallineCohomology` CR.0 exports `A_cris` by its universal property and CR.4 the de Rham–Witt complexes
  with `dlog` and the logarithmic subring. `PadicHodgeTheory` R06.1 constructs `B_dR^+`, `B_crys` and `B_st`;
  `AInfCohomology` AI.0 normalises `A_inf`, `θ`, `ξ`, `ξ̃` and the twists. `KTheoryFiniteLocalFields` L.5 and L.6
  plan the local-field calculations. `EnhancedDerivedSheaves` E3 and E5:animation plan left Kan extensions and
  animated algebra.

What no layer plans: quasi-isogenies of cyclotomic spectra; the cyclotomic spectrum `Z_{hC_p}`; twisted Tate
diagonals; the connectivity and rigidity theorems for `Z_p(i)`; the comparison with Fontaine–Messing syntomic
cohomology; and the whole `p`-adic deformation theory of Section 4.

## The routes

### 1. Part II of *Hochschild, cyclotomic and refined trace methods* — 11 items

`RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses`, area `motivic`. It takes Section 4 and the
conjecture it aims at: continuous invariants `F^cts(X) = lim_n F(X_n)` of a `p`-adic formal scheme with their
continuity theorems; the crystalline Chern character; the de Rham cohomology of a smooth formal scheme with its
Hodge filtration; the stacked fibre squares relating `K^cts`, `TC^cts`, `HC^{-,cts}` and `HP^cts`; the HKR
splitting and the `p`-adic Chern character map, with the proof that it depends only on the special fibre and is
the crystalline Chern character up to a scalar `λ^i`; Beilinson's obstruction and its generalisation Theorem E;
and the statement of the **p-adic variational Hodge conjecture**, recorded as a conjecture.

**The alternative parent** is `MotivesAndAlgebraicCycles`, whose MC.7 owns the register of cycle conjectures. The
reason for choosing `RefinedTraceMethods` is that everything here is proved by trace methods, uses RT.1–RT.3b as
its entire machinery, and is the application RT.3b's square was proved for; the only cycle-theoretic statement is
the conjecture itself, which the brief tells the design job to cross-reference to MC.7 rather than restate. This
is flagged in the route's `reason`.

### 2. Source of *Hochschild, cyclotomic and refined trace methods* — RT.1, RT.2, RT.3, RT.3b, RT.6 — 55 items

The proof of the layer's own theorem. From Section 2: `Z_{hC_p}` and the cofibre sequence
`Z_{hC_p} → Z^triv → THH(F_p)`, the Tate vanishing lemma, the cartesian square of cyclotomic spectra and its
`TC^-`/`TP` form, the effective bounds that produce every `2p − c` range in the paper, isogenies and
quasi-isogenies, the integral Theorem A/Corollary B, and the nilpotent-ideal statement. From Section 3: the whole
theory of quasi-isogenies of cyclotomic spectra, including Theorem C and the recovery of Geisser–Hesselholt. From
Section 5: relative `THH` over `S[z]` with its filtration and connectivity bounds, and the **graded** version of
the BMS2 package. From Appendix A: twisted Tate diagonals and their graded, filtered and `S[z]`-linear instances.
The route also names the six `planned` statements (Theorem 2.12, Definition 2.14, Corollary 3.9, Theorem 6.17,
and the BMS2 Definition 5.6 and Theorem 5.9) because this paper is their designated source.

### 3. Source of *Prismatic cohomology* — PR.3, PR.4 — 35 items

Everything Sections 5 and 6 prove about the syntomic complexes: the connectivity bound and its sharpening for
`w`-strictly local rings, the left Kan extension property, rigidity along a henselian pair, and the whole
apparatus of the proofs (bounds on the Nygaard graded pieces and quotients, the `I`-adic filtrations modulo `p`
and the nilpotence of the Frobenius on them, the finite-level description of `F_p(i)`, the left-Kan-extension
criteria, continuity, the graded connectivity lemma, and the identification of `H^{i+1}(F_p(i))` as an
inverse-Cartier cokernel). Then Section 6: the divisibility `φ(LΩ^{≥i}) ⊆ p^iLΩ` for `i ≤ p−1` with the two
`p`-adic valuation estimates behind it, the Fontaine–Messing definition, the image of `χ_i` as a Frobenius
eigenspace, the Frobenius rigidity that pins the comparison down up to a scalar, Theorem F, Corollary H, and the
syntomic cohomology of a DVR.

### 4–7. Four smaller source routes

* **`EnhancedDerivedSheaves` E3, E5:animation — 4 items.** Appendix B: the Frobenius factorisation for a
  simplicial commutative `F_p`-algebra, the descent of a natural transformation along reduction mod `p` at the
  cost of `p^i`, the almost-finitely-presented finiteness classes, and the comparison saying that a
  transformation of functors of formally smooth `O_K`-algebras depending only on the special fibre descends to
  smooth `k`-algebras.
* **`KTheoryFiniteLocalFields` L.5, L.6 — 2 items.** The integral `p`-adic `K`-groups of `W(k)` in the range
  `1 ≤ i ≤ 2p−5`, derived from the integral Beilinson fibre sequence independently of Bökstedt–Madsen and
  Rognes, and the five-term sequences in the ramified case.
* **`PadicHodgeTheory` R06.1 — 2 items.** The fundamental exact sequence, and the argument identifying the
  topologically produced maps with the classical ones through `dlog`, the uniformizer of `B_dR^+` and
  Fargues–Fontaine's degree-one generation.
* **`CohomologyComparisons` CP.2, CP.3 — 1 item.** The Colmez–Nizioł and Tsuji square for `p`-adic nearby
  cycles, which is the geometric statement those two layers' maps assemble into.

## Prerequisites the atlas does not cover

Thirteen, listed with links in the result file: Nikolaus–Scholze (cyclotomic spectra, the Tate diagonal, the
`TC` formula, `THH(F_p)`); Dundas–Goodwillie–McCarthy and Goodwillie (the two relative comparison theorems);
Bloch–Esnault–Kerz and Beilinson (the deformation theorems that Section 4 reproves and generalises); Antieau (the
HKR filtrations on `HP` and `HC^-`); Bhatt (`p`-adic derived de Rham cohomology); Scholze (Hodge-to-de Rham
degeneration for rigid spaces); Berthelot–Ogus (the ramified de Rham/crystalline comparison); Gros (crystalline
Chern classes); Geisser–Hesselholt; Hesselholt–Madsen; and Fargues–Fontaine. Bhatt–Morrow–Scholze I and II,
Bhatt–Scholze's prisms paper, Clausen–Mathew, Clausen–Mathew–Morrow and Colmez–Nizioł are already in the queue
and are not repeated.

## Mistakes found in the source

Two, both in Example 7.3, both `affects: nothing`, and both recorded against **arXiv v2 only** — Duke is
paywalled and the published text could not be consulted, so it is not known whether they were corrected in print.
The `searched` field of each records that, and that the Crossref record lists no erratum.

1. **E1 — two stated ranges are one step too generous.** The example computes
   `π_i HC(k/W(k)) ≅ W(k)/p^{s+1}` for `i = 2s`, claimed "for `i ≤ 2p−1`", and then
   `π_i HC(W(k),(p)/W(k)) ≅ p^{s+1}W(k)`, claimed "in the range `0 ≤ i ≤ 2p−2`". Both are read off from the
   sentence immediately before, that `LΩ_k/LΩ_k^{≥s} ≅ W(k)/p^s` **for `s ≤ p−1`**, applied with `s+1` in place
   of `s`; that needs `i = 2s ≤ 2p−4`. At the first excluded value `i = 2p−2`, i.e. `s = p−1`, the formula would
   give `W(k)/p^p`, but `LΩ_k` here is the `p`-completed divided power envelope of `(p) ⊆ W(k)`, i.e. `W(k)`
   itself, whose `p`-th Hodge (divided power) filtration step is generated by `γ_p(p) = p^p/p!` of valuation
   `p − 1` because `v_p(p!) = 1`; so the correct value is `W(k)/p^{p−1}`, and the relative group is
   `p^{p−1}W(k)`, not `p^pW(k)`. The example's conclusion is unaffected: it is drawn in the range
   `1 ≤ i ≤ 2p−5`, where the odd degrees used have `s ≤ p−3`, comfortably inside the valid range.
2. **E2 — an unmatched parenthesis** in the displayed formula of the same example: `π_i HC((W(k),(p)/W(k))`
   should be `π_i HC(W(k),(p)/W(k))`, as it is written two sentences earlier and in Remark 7.4.

Otherwise the source is clean on the mechanical checks: there are no duplicate labels, and no hand-typed
cross-reference names a statement of the wrong type.

## Judgement calls a reviewer should check

* **The parent of the Part II** — `RefinedTraceMethods` against `MotivesAndAlgebraicCycles`, argued above.
* **Where the boundary between the RT and PR source routes falls.** I put the `THH`, `TC` and filtration
  statements of Section 5 with `RefinedTraceMethods` (RT.6 owns the BMS2 filtration interface) and the `Δ_R`,
  Nygaard and `Z_p(i)` statements with `PrismaticCohomology` (PR.3 and PR.4 own those objects), following RT.6's
  own instruction that "generic `Δ`/Nygaard objects and syntomic Frobenius maps belong to PrismaticCohomology".
  The graded BMS2 package (5.39–5.41) is a borderline case: I routed 5.39 and 5.40 to RT and 5.41 to PR.
* **Appendix A** is routed to RT.2 because its only use here is to make `THH` of a graded or `S[z]`-linear ring
  cyclotomic. It is a general construction in symmetric monoidal `∞`-categories and a reviewer may prefer
  `EnhancedDerivedSheaves` E5 as its owner.
* **Lemma 6.7**, the two `p`-adic valuation estimates, is marked `missing` rather than `library`: Mathlib has
  Legendre's formula as `sub_one_mul_padicValNat_factorial` together with `padicValNat`, from which both follow
  immediately, but neither statement is itself a declaration at the pinned commit.
* **Theorem 7.1 and Example 7.2** are marked `planned` at L.6, which plans the ranks of `K_{2j−1}(L;Z_p)` and
  their Galois-cohomological identification. The paper's contribution there is a new proof, not a new statement;
  a reviewer who reads L.6 more narrowly should move them into the L route as sources.
