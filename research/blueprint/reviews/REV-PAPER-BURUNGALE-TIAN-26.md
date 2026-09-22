# REV-PAPER-BURUNGALE-TIAN-26 — independent review of the Burungale–Tian extraction

**Verdict: accept, with corrections made in place.** Reviewer: Claude Code, session `cc-fb70e5`, 22 September 2026. The extraction is by Codex (`codex-a71f92`); this reviewer did no part of it.

**Paper.** Ashay A. Burungale and Ye Tian, *A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin*, Annals of Mathematics 203 (2026), 1–13, DOI 10.4007/annals.2026.203.1.1. The author version arXiv 2506.03465v2 (11 October 2025), as the extraction records, was fetched on 22 September 2026; its SHA-256 matches (`cbb8284a…4664`). All seven pages were read.

**Sources checked at the places the extraction cites**, all with matching SHA-256:

- **Kato, Astérisque 295 (2004).** SHA-256 `3c6e14b1…c605d`. §§6.3, 8.2–8.3, 12.1–12.10, 14.8–14.15 and 15.1–15.17 were checked. The OCR text is unreliable, so every quoted display was read from the page images.
- **Johnson-Leung–Kings, arXiv 0804.2828v2.** SHA-256 `2af28fc5…f543`, with its TeX source. §§1–7 were checked for hypotheses on p; §4.2, §5, §7.1–7.3 and Lemma 7.7 in detail.
- **Bhargava–Klagsbrun–Lemke Oliver–Shnidman, author version.** SHA-256 `af4e5ab9…8880`. §2 (height, Theorems 2.1–2.7), §9.2 and §11 were checked.
- **Smith I, arXiv 2207.05674v2.** SHA-256 `4ea83c0d…126c`. The introduction through Theorem 1.2 and Assumption 1.1 were checked.

**Checks run.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BURUNGALE-TIAN-26.result.json` reports `ok` on the corrected file.
- Library claims were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- Every cited stage was read in `data/atlas.json` against the accepted restructures RS-07, RS-26 and RS-30 and `data/roadmap-retirements.json`. Every `tauceti:` anchor exists as a layer heading of the upstream roadmap documents.
- Every `area` was checked against `data/galaxies.json`, which `check_paper.py` does not do.
- Computations:
  - PARI root numbers of ny² = x³ − x for all squarefree 0 < n < 400;
  - the relative density of squarefree n ≡ 1, 2, 3 mod 8 up to 10⁶ (303,947 of 607,926);
  - the 4-division polynomial of y² = x³ − x, which confirms that Smith's Assumption 1.1 applies.

## 1. Items

The extraction is faithful and unusually careful. It keeps several things straight:

- the rational rather than integral normalization;
- Kato's cohomological representation and j_* convention;
- the half-weight twist and sign;
- the case K ⊂ Q(μ_{p∞}), which the congruent-number application needs (K = Q(i), p = 2);
- lower density versus density one;
- 2∞-corank versus finite 2-Selmer rank.

It also noticed, and refused to copy, the untwisted Selmer display on p. 6.

The following were confirmed on Kato's pages:

- Theorem 12.4(1)–(2) has no hypothesis on p beyond k ≥ 2.
- Theorem 12.5(1) matches `critical-reciprocity` in every detail. The sign relation z_{ι(γ)} = −σ_{−1}z_γ is printed there and derived on p. 230.
- (14.9.3) is exact only up to ×2 at p = 2, and (14.9.5) holds.
- The elliptic units of §15.5 have 𝔞 prime to 6p𝔣.
- (15.6.1) and (15.6.2) hold; the kernel and cokernel of the latter are finitely generated over Z_p, hence pseudo-null.
- The §15.1 facts about h¹, h² and h¹/z hold.
- Lemma 15.13, §15.14 and (15.16.1) hold.

BT's footnote 4 is right: once p is inverted, 2 and #Δ are invertible in the residue field.

Johnson-Leung–Kings do support BT Theorem 2.1 at every prime:

- their Theorem 5.2 is "for all primes p with no exceptions";
- Lemma 4.6 treats inert, ramified and split p;
- §7.2 uses no μ = 0 hypothesis, which enters only in §7.3;
- the p = 2 inputs are Itakura's preprint (Theorem 2.6, Proposition 2.9) and Rubin's Euler-system Theorem 2.3.3, which carries no p > 2 hypothesis.

Two substantive problems were found, both in the CM main-conjecture branch, and both are now corrected.

- **Theorem 2.1 as printed omits Euler factors.**
  - BT's z is Kato's module of the elliptic units of the single modulus p^n f.
  - Its projection to a character χ carries ∏_{𝔩|f,𝔩∤p}(1 − χ(𝔩)Frob_𝔩^{−1}) (Johnson-Leung–Kings Lemma 7.7).
  - JLK accordingly pair it with H² over O_K[1/pf]. BT's h² is the class-group limit, which Kato's (15.6.2) identifies with H² over O_K[1/p].
  - Purity gives 0 → H²(O[1/p]) → H²(O[1/pf]) → ⊕_{𝔩|f,𝔩∤p} Z_p[[G/D_𝔩]] → 0. Each D_𝔩 has Z_p-rank one, so these terms are torsion but not pseudo-null. On the trivial-character component, 1 − Frob_𝔩^{−1} is a non-unit even after inverting p.
  - So ξ(h²_Q) = ξ((h¹/z)_Q) fails whenever f has a prime factor not above p. The correct equality carries the factor ∏ ξ(Z_p[[G/D_𝔩]]_Q).
  - The same imprecision is in Kato's quotation of Rubin (Theorem 15.2(2)). Rubin's elliptic units include all moduli g | f; Kato himself uses only the inequality, which stays true.
  - The paper's later results are unaffected. In the proof of Theorem 2.6, f is the conductor of ψ, and the relevant primes lie on ψ-components ramified at every such 𝔩, where the factors are units.
  - `equivariant-main` and `regular-prime-equality` now state the corrected equality. The new item `h2-euler-comparison` records the comparison.
- **Kato §15 proves only the inequality.**
  - BT's proof of Theorem 2.6 says that Kato §15 shows that the CM case of Conjecture 12.10 follows from the equivariant main conjecture.
  - Kato lists Theorems 12.4–12.6, 14.2 and 14.5 as the results of §15, not Conjecture 12.10. Prop. 15.17 is only an inequality, and on p. 251 he says he does not use Rubin's equality.
  - The equality does follow with one further step. Apply Kato's Lemma 14.15 to both H²_q and H¹_q/A·z. The Ker(a|H²) terms of (15.13.1)–(15.13.2) cancel, and Ker(a|H¹_q/Az) = 0 by a UFD argument.
  - The new item `equality-descent` records this step, and `cm-kato-main` notes the gap.

Smaller corrections made against Kato:

- `cm-descent`: the restriction map is not ψ-twisted.
- `cm-zeta-bridge`: (15.11.3) is the period-compatible comparison, not a realization map.
- `conjugate-dual`: (14.10.1) is over the same F_λ.
- Locators: `cm-newform` now cites Kato 15.10; `modular-representation` now cites 6.3, with its definition as a Hecke quotient of the cohomology of Y₁(N).
- Wording: `units-torsionfree`, `selmer-zero-h2` (two applications of (14.9.3)), `lattice-independence` and `congruent-root-number` (positive n only).

## 2. Statuses

All three library citations hold at the pinned commits, and their recorded SHA-256 values match.

- `cyclotomicCharacter`, `.spec` and `.continuous` apply with L = `AlgebraicClosure ℚ`, and a Mathlib instance supplies the roots of unity.
- `LocalizedModule` is the module localization. `LocalizedModule.AtPrime`, the abbreviation `LocalizedModule P.primeCompl M`, is the item exactly and was added.
- `HeckeRing.GL2.Newform` gives the newform. It carries no weight bound, which is weaker than k ≥ 2 and therefore acceptable.

All 44 planned items cite live stages, and none contradicts its item. Five cited layers were partial, and each now has the missing supplier added:

| Item | Added | Why |
|---|---|---|
| `analytic-rank` | ModularForms Layer 7 | BSD.0 defines analytic rank only for E/Q; E/K needs the newform L-functions |
| `conjugate-dual` | ModularCurvesPartII R14.3, KatoEulerSystems L3 | R19.1 does not state the duality |
| `central-nonvanishing` | PadicHodgeRegulators L1 | the step uses the kernel of exp* and the finite condition |
| `lattice-independence` | SelmerIwasawaCohomology L2 | lattice-change formulas |

The missing items were searched in both pinned trees, in every atlas stage and in the upstream roadmap documents. Four are in fact planned:

- **`ray-tower`.** AutomorphicPadicLFunctions L0 plans "the inverse limit of ray class groups with p-power conductor and fixed tame modulus, its reciprocity interpretation". ClassFieldTheory Layer 13 plans the ray class fields.
- **`ray-group-structure`.** The same layer plans "the dimension formula with the Leopoldt defect", keeping "all torsion factors". For imaginary quadratic K this gives Z_p² × Δ_f.
- **`congruent-curve`.** This is the instance t = n of the quadratic twist, which the item `twist` already takes from EllipticCurves Layer 5.
- **`number-field-twist-height`.** ArithmeticStatistics ST.0 plans height orderings, unweighted counts and bounded-height finiteness, as for `squarefree-density`.

Nothing in the atlas plans elliptic units, the Rubin or Johnson-Leung–Kings imaginary-quadratic main conjecture, or Kato's §15 descent. The HE.7s stage records the Rubin 1987 elliptic-unit route as unresolved.

Counts are now 3 library, 48 planned and 41 missing, out of 92 items. Every missing item is routed exactly once.

## 3. Routes

All eight routes are accepted. The reasons are in the review file; the points that needed action were:

- **Route 5** now carries only `congruent-root-number`, since the family is planned. Its reason names the imports it needs:
  - ModularForms Layer 6 (the sign of the functional equation);
  - GL2 R16.3 (local ε-factors);
  - EllipticCurveModularity R29.6.
- **Route 7 (CMAllPrimeMainConjectures).**
  - The two ray items left the route, and the two new items joined it.
  - The brief now states the corrected Theorem 2.1 and the equality step that Kato lacks.
  - The brief now imports AutomorphicPadicLFunctions L0, GlobalNumberFields Layer 2 and KatoEulerSystems L0 (Siegel units).
- **Route 8 (CMRankZeroConverse).**
  - Its `area`, "diophantine", is not a galaxy id. It is now "iwasawa", the galaxy of RankZeroOneBSD (cluster iwasawa-theory-and-special-values).
  - AutomorphicGaloisRepresentations and PadicHodgeRegulators, which the brief imports, were added to its prerequisites.
  - The brief also imports ModularForms Layer 7 and EllipticCurves Layer 7.
- **Atlas text, not the extraction.** ModularIwasawaMainConjectures L0 says "extension-by-zero" where Kato 8.2 uses j_*. The extraction's j_* is right.

## 4. Overlaps with other work

- **ModularIwasawaMainConjectures already has a Part II from Burungale–Kobayashi–Ota,** InertAnticyclotomicCMMainConjecture (design issue #1690). The same paper's NonordinaryCMSpecialValues (#1689) needs the same Kato §15.5 elliptic-unit tower.
  - The route 7 brief now asks for the elliptic-unit and tower-module foundations to sit in an early layer that does not depend on the rational main conjecture. Whichever design is written first owns it, and the others import it.
  - The brief also says that the integral two-variable equality those designs need is not an output here.
  - The Burungale–Kobayashi–Ota review already suggested merging the two Part IIs, and the maintainer may prefer to.
- **RankZeroOneBSD has a second Part II queued:** Skinner's RankOneConverse (DESIGN-SKINNER, #951), "the p-converse".
  - It is not a better home for Burungale–Tian's CM and density items, because the proofs share no main step.
  - The rank-r p-converse proposition (`p-converse-property`) needs a single owner, and the route 8 brief says so.
  - Renaming Skinner's Part II to "the rank-one p-converse" would avoid confusion.
- Burungale–Tian 2020 (*p-converse …*, Invent. Math.) has no extraction or design.

## 5. Mistakes in the paper

These are for the errata job ERRATA-PAPER-BURUNGALE-TIAN-26 (#1701), which owns this file's `sourceIssues` (PROTOCOL.md §18). They are listed here and not recorded in the file, so that the two jobs do not edit the same list.

1. **Theorem 2.1 and footnote 3, p. 4 (error; affects a stated result).** The equality ξ(h²_Q) = ξ((h¹/z)_Q) omits the Euler factors ∏_{𝔩|f,𝔩∤p} ξ(Z_p[[G/D_𝔩]]_Q) (§1 above). Footnote 3's "identical with the one in [11, §7.2]" is therefore false for h². The main results are unaffected.
2. **Proof of Theorem 2.6, p. 5 (gap; affects the proof).** Kato §15 proves only the inequality (Prop. 15.17), not the equality BT attribute to it. The missing step is supplied by `equality-descent`.
3. **Proof of Theorem 1.1, p. 6 (misprint; affects nothing).**
   - "Sel_{p∞}(E/K)^∨⊗K ≃ H¹_f(Q,V_{Kλ}(f)) ⊕ H¹_f(Q,V_{Kλ}(f̄))" omits the Tate twist (1). In Kato's cohomological convention, which BT adopt through [12, (8.3)], V(f) ≅ V_pE(−1) in weight two.
   - The right-hand side should be H¹_f(Q,V(f)(1)) ⊕ H¹_f(Q,V(f̄)(1)), up to duality, and ⊗K should be ⊗_{Z_p}K_λ.
   - Only the vanishing is used, and Theorem 3.1 at k = 2 concerns V(f)(1).
4. **Theorems 2.3, 2.4 and 2.6 (misprint; affects nothing).** They are stated for f ∈ S_k(Γ₁(N)) with no weight bound. Kato's V_{F_λ}(f) (Sym^{k−2}) needs k ≥ 2, so weight-one CM forms are not covered. Theorem 3.1 is unaffected, since even weight forces k ≥ 2.
5. **Equation (3.1), p. 6 (gap; affects nothing).** "By the exact sequence [12, (14.9.3)]" needs (14.9.3) twice, first for the Tate-dual lattice in V(f*)(k/2), together with (14.9.5), (14.10.1) and Prop. 14.12.
6. **Choice of γ, p. 6 (gap; affects nothing).** Concluding that the image of z_γ, and not just of Z(f)_q, is a basis uses Kato's sign relation z_{ι(γ)} = −σ_{−1}z_γ. The paper does not mention it.
7. **Theorem 3.5, p. 7 (gap; affects nothing).** It is attributed to BKLOS Theorem 2.7, which states only that the Mordell–Weil rank is 0 for at least half the twists. The 3∞-Selmer statement comes from the proof (§9.2 and §11: dim Sel₃ = 0 for at least half, for a maximal order) together with isogeny invariance of corank.
8. **Theorem 3.3, p. 6 (gap; affects nothing).** Smith's Theorem 1.2 counts all nonzero integers |d| ≤ H. BT's density-one statement for positive squarefree n ≡ 1, 2, 3 mod 8 also needs the squarefree restriction and the 2-parity theorem.
9. **Footnote 2, p. 2 (misprint; affects nothing).** "ε(E^(n)) = +1 precisely when n ≡ 1,2,3 mod 8" holds for positive squarefree n only: n = −1 ≡ 7 has root number +1, since E^(−1) ≅ E.
10. **Typographical slips (misprints; affect nothing).**
    - footnote 3: "One may to" should read "One may refer to";
    - §2.2.1: "coefficents";
    - reference [1]: "over number fields" should read "over a number field";
    - reference [15]: "Birkheser" should read "Birkhäuser";
    - reference [5]: "Munster" should read "Münster";
    - the second author's address: "Beijing 10049" is presumably 100049.
11. **For the errata job to assess: Remark 2.2.** "The conjecture is still open for p non-split in K" may be too strong when G_{p∞f} has no p-torsion. JLK alone also leave split p = 2, 3 open, which Oukhaba–Viguié later settled. This review did not settle the point.

Mistakes noticed in the cited sources, recorded for their owners:

- **Kato, Astérisque 295.**
  - Theorem 15.2(2) quotes Rubin's equality with the single-modulus z, with the same Euler-factor imprecision.
  - p. 265: "Lemma 14.12" should read Lemma 14.15.
  - p. 253: "𝔷 ⊂ H¹" should read h¹.
  - p. 265, (15.16.1): "z_{p∞}" should read z_{p∞𝔣}.
  - p. 242, (14.13): the formula omits (2πi)^{r−1} and writes f for f*.
  - p. 221, Theorem 12.4: "lattice T of V_{F_λ}" is missing "(f)".
- **Johnson-Leung–Kings.** The proof of Lemma 5.1 calls Z_p[Δ″][[T,S]] a direct summand of Ω. It is not one when G_f has p-torsion. The point is irrelevant at height-one primes, so §7.2 is unaffected. This was reported by a verification pass and not re-derived by this reviewer.

## Corrections made in place

- `ray-tower`: missing → planned ['AutomorphicPadicLFunctions:L0', 'tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields']. AutomorphicPadicLFunctions L0 constructs "the inverse limit of ray class groups with p-power conductor and fixed tame modulus, its reciprocity interpretation"; ClassFieldTheory Layer 13 plans the ray class fields. Removed from route 7.
- `ray-group-structure`: missing → planned ['AutomorphicPadicLFunctions:L0']. L0 proves "the dimension formula with the Leopoldt defect", keeping "all torsion factors"; for imaginary quadratic K the unit group is finite, so the Z_p-rank is 2 (Kato p.250 states G≃Z_p×Z_p×finite). Removed from route 7.
- `congruent-curve`: missing → planned ['tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5']. It is the instance t=n of the quadratic twist that the item `twist` already takes from EllipticCurves Layer 5; RS-30 narrowed BSD.0 so that it does not reconstruct twists. Removed from route 5.
- `number-field-twist-height`: missing → planned ['ArithmeticStatistics:ST.0']. ST.0 plans "height/discriminant orderings, … weighted versus unweighted counts" and "finiteness at bounded height", as the extraction already used for `squarefree-density`. It stays in route 3 as a source item.
- `analytic-rank`: added ['tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions']. BSD.0 defines analytic rank only for E/Q; ModularForms Layer 7 plans the order of vanishing of the continued newform L-function at the centre, which is what L(s,E/K)=L(s,f)L(s,f̄) needs.
- `conjugate-dual`: added ['ModularCurvesPartII:R14.3', 'KatoEulerSystems:L3']. R19.1 does not state the duality; R14.3 plans Poincaré duality on modular-curve cohomology and KatoEulerSystems L3 requires the V_f versus V_f^*(1) dictionary.
- `central-nonvanishing`: added ['PadicHodgeRegulators:L1']. The step uses the kernel of the dual exponential and the finite local condition, which PadicHodgeRegulators L1 plans ("their domains, kernels, local duality relation … and the finite local condition").
- `lattice-independence`: added ['SelmerIwasawaCohomology:L2']. SelmerIwasawaCohomology L2 plans "lattice-change formulas".
- `module-localization`: added `mathlib:LocalizedModule.AtPrime` (Mathlib/Algebra/Module/LocalizedModule/AtPrime.lean, the abbreviation `LocalizedModule P.primeCompl M`), which is the item exactly.
- `cm-descent`: Kato Lemma 15.13 (p.264) uses the plain restriction surjection, not a ψ-twisted map, and takes f to be the conductor of ψ.
- `cm-zeta-bridge`: (15.11.3) is the period-compatible comparison isomorphism, not a realization map; Kato p.263 says it is never used as the Galois identification.
- `conjugate-dual`: Kato (14.10.1) is over the same F_λ; the clause about transporting coefficients was removed.
- `cm-newform`: the infinity type (1−k,0) is Kato 15.10 (p.260); Remark 12.8 only defines "f has CM".
- `modular-representation`: V_F(f) is defined in Kato 6.3 as a Hecke quotient of the cohomology of Y₁(N) (8.3 supplies the Galois action); the weight-two identification V(f)≅V_pE(−1) is recorded.
- `units-torsionfree`: the parenthetical was Kato's gloss on h² being torsion; the definition of torsion-free is now stated.
- `selmer-zero-h2`: the note now spells out the two applications of Kato (14.9.3) that BT's single citation compresses.
- `lattice-independence`: noted that the compatibilities are additions to Kato 12.2.
- `congruent-root-number`: noted that footnote 2 holds only for positive n (E^(−1)≅E has root number +1). PARI root numbers agree with the item for all squarefree 0<n<400.
- `equivariant-main`: corrected statement. BT Theorem 2.1 as printed is false when f has a prime factor 𝔩∤p; the correct equality includes ∏_{𝔩|f,𝔩∤p}ξ(Z_p[[G/D_𝔩]]_Q), equivalently uses H² over O[1/pf]. The printed form holds on the components Theorem 2.6 uses.
- `regular-prime-equality`: corrected the same way; the all-p claim was confirmed in JLK.
- New item `h2-euler-comparison` (missing, route 7): the localization sequence relating H² over O[1/p] and O[1/pf], whose Euler terms the printed Theorem 2.1 omits.
- New item `equality-descent` (missing, route 7): the step from the equivariant equality to Kato's equality, which Kato §15 does not contain (he proves only the inequality, Prop. 15.17).
- `cm-kato-main`: note records that Kato §15 proves only the inequality.
- Route 5: now carries only `congruent-root-number` (the family is planned); the reason names the local-sign and modularity imports.
- Route 7: `ray-tower` and `ray-group-structure` removed (now planned); `h2-euler-comparison` and `equality-descent` added. The brief states the corrected Theorem 2.1 and the equality step Kato lacks, imports AutomorphicPadicLFunctions L0, GlobalNumberFields Layer 2 and KatoEulerSystems L0, and asks for a single owner of the elliptic-unit foundations shared with the Burungale–Kobayashi–Ota designs (#1689, #1690).
- Route 8: `area` "diophantine" is not a galaxy of data/galaxies.json; set to "iwasawa", the galaxy of the parent RankZeroOneBSD (cluster iwasawa-theory-and-special-values). AutomorphicGaloisRepresentations and PadicHodgeRegulators, which the brief imports, added to its prerequisites; the brief also imports ModularForms Layer 7 and EllipticCurves Layer 7 and asks for a single owner of `p-converse-property` shared with Skinner's RankOneConverse design (#951).
