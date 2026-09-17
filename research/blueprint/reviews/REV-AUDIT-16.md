# Review of AUDIT-16

**Job** REV-AUDIT-16 · **Date** 2026-09-17 · **Verdict `accepted`** · **32 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the four roadmaps of `research/blueprint/audit/AUDIT-16.json`, namely
`tauceti:TauCetiRoadmap/ModularForms`, `AdditiveCombinatorics`,
`tauceti:TauCetiRoadmap/AlgebraicCodingTheory` and `tauceti:TauCetiRoadmap/DenseGraphLimits`. That is 42
layers, 203 targets, 451 declaration citations naming 421 distinct declarations, and 41 duplicate claims.

The audit is accurate about what the libraries contain. Every presence claim holds, and only one of the
145 absent or partial claims changes status. Its errors are of three kinds:

- 11 layers are marked "partly built" although none of their targets is present.
- 10 notes call something missing that the libraries already have, in general form or next door.
- One fit label is wrong.

**The most important finding is the verdicts.** A quarter of the batch was marked `partly built` with
only partial and absent targets. After correction the batch has 20 partly built layers (not 31), 18 not
built (not 7) and 4 built.

## What was checked

**Mechanical.**
- All 42 batch layers are present, in batch order, with no extras.
- Every citation resolves at its stated library, file and line.
- No citation is `private`, an axiom or a bare structure field.
- `grep -n sorry` is clean in every cited file. The only textual hits for `admit` are English words in
  two docstrings.
- Three citations are not in `declarations.tsv` but are in the source exactly as cited: `ModularForm.L`,
  `ModularForm.hasSum_L` and `ModularForm.Λ`. The index skips the `@[expose] public section` of
  `Mathlib/NumberTheory/ModularForms/LFunction.lean`.
- After the corrections the file has 460 citations. All resolve, and every verdict agrees with its
  targets.

**Presence claims.** For all 451 citations I read the statement together with its namespace and
`variable` lines, and compared it with the target. That covers the 58 present targets (4 `mathlib`,
50 `tauceti`, 4 `both`) and the present half of each of the 53 partial targets. All hold. The four built
layers really are built: ModularForms 1 and DenseGraphLimits 1, 3 and 9a. Checks that mattered:

- **DenseGraphLimits 5 (Janson A.9).** Mathlib's `MeasureTheory.Measure.exists_measurable_map_eq`
  carries `[Nonempty Y] [StandardBorelSpace Y]` (continued `variable` line,
  `Probability/Kernel/Representation.lean:41`). So Janson A.9, which the roadmap says to build, is in
  Mathlib, as the audit says.
- **ModularForms 1 (valence formula).** Tau Ceti's finite-index valence formula uses the full index
  `[SL₂(ℤ):Γ]` with interior weights `2·ord/|Stab_Γ P|`. When `−I ∉ Γ` this is the roadmap's projective
  statement multiplied by 2, so the two are equivalent.
- **ModularForms 2 (coefficient formula).** Tau Ceti's general `T_m T_n` coefficient formula evaluates
  `MulChar.ofUnitHom χ`, which vanishes at non-units. The roadmap's `χ(p) = 0` convention at `p ∣ N` is
  therefore built in, and the recurrence target is rightly `tauceti`.
- **ModularForms 3 and 5 (old and new spaces).**
  - `cuspFormsNew` is by definition the Petersson-orthogonal complement of `cuspFormsOld`.
  - `cuspFormsNewEigenspace` is the joint good-Hecke eigenspace intersected with the new space, so
    multiplicity one is stated inside the new space.
- **ModularForms 6 (Fricke).** The normalized Fricke operator squares to `(−1)^k`, which the
  normalization forces. It is an involution exactly in even weight.
- **AC.0 (energy).** Mathlib's `Combinatorics/Additive/Energy.lean` has the lower bound and the
  Cauchy–Schwarz bound, but not `E(A,B) ≤ |A|²|B|`. The note says exactly this.

**Absent and partial claims (all 145).** Every claim was searched again independently, by concept and by
naming convention, in `declarations.tsv` and both whole source trees. Every candidate found was read at
the source. Searches with no result:

- **ModularForms:**
  - the j-function;
  - Eisenstein series with character, generalized Bernoulli numbers and the Eisenstein subspace;
  - Shimura 3.35, and 3.20 beyond n = 2;
  - Hecke adjoints and eigenbases;
  - Atkin–Lehner–Li and bad-prime eigenvalues;
  - newform decomposition, the conductor and cross-level strong multiplicity one;
  - Atkin–Lehner signs and pseudo-eigenvalues;
  - the degree-two Euler product, analytic rank and analytic conductor;
  - modular and Manin symbols, Eichler integrals and Bol's identity;
  - finiteness of the integral Hecke algebra, coefficient and character fields, and Galois-conjugate newforms;
  - Satake parameters, and LMFDB and Conrey labels;
  - X(Γ), with cusp and elliptic counts;
  - analytic Riemann–Roch, Serre duality and H¹-finiteness;
  - dimensions above level one;
  - Hurwitz class numbers, the Eichler–Selberg trace formula and period polynomials.
- **AdditiveCombinatorics:**
  - Balog–Szemerédi–Gowers, Freiman, Kneser and PFR;
  - Bohr sets and Chang's lemma;
  - Szemerédi for k ≥ 4, hypergraph removal, the Furstenberg correspondence and Varnavides;
  - Gowers norms and nilsequences;
  - pseudorandom majorants, the dense model theorem and Green–Tao;
  - the prime number theorem (Tau Ceti has only the conditional ϑ → π transfers and a smoothed
    Wiener–Ikehara theorem);
  - linear equations in primes and Möbius sum estimates.
- **AlgebraicCodingTheory:**
  - minimum distance;
  - puncturing, shortening, direct sums and equivalences of codes;
  - Euclidean and Hermitian dual codes;
  - weight enumerators, MacWilliams and Krawtchouk polynomials;
  - doubly-even and Type II codes;
  - the tetracode, hexacode and Golay codes;
  - Construction A and the lattice `mℤ^ι` with form `B_m`.
- **DenseGraphLimits:**
  - `CompactSpace GraphonSpaceI`;
  - realignment, and the mod-null equivalence with `[0,1]`;
  - inverse counting and the convergence equivalence;
  - associativity of gluing;
  - Lovász–Szegedy and its Möbius spine;
  - extremality, infinite exchangeable laws and graphon mixtures;
  - the second sampling lemma and almost-sure sampling convergence.

Two candidates could have overturned a claim, and did not:

- **ModularForms 8, period map.** Mathlib's `CuspForm.Λ_eq_mellin` is the integral of `f(it)t^(s−1)`
  over `t > 0`. At `s = j+1` this is the period of f on the path from 0 to i∞. There is still no pairing
  on the symbol module, and no invariance or descent, so the target stays `absent`. The note, which said
  there are no period integrals, is corrected.
- **DenseGraphLimits 9b, graph/array interface.** Tau Ceti proves a row-level coding theorem for
  separately exchangeable arrays (`Arrays/Coding.lean:172`, `:206`). It is not the jointly exchangeable
  Aldous–Hoover theorem and is not linked to graph laws, so `graphLawArrayLawEquiv` stays `partial`. The
  note, which said "only the easy direction", is corrected.

**Duplicates.** All 41 claims point to live layers of other roadmaps: none is retired and none refers to
its own roadmap. Reading each target description confirms the overlap. I added 8 more.

## Corrections

**Verdicts (11), from `partly built` to `not built`.** No target of these layers is in the libraries:
- ModularForms 8, 9, 10A, 10B, 10C and 11;
- AdditiveCombinatorics AC.1 and AC.4;
- AlgebraicCodingTheory 3 and 7;
- DenseGraphLimits 4.

The audit prompt defines `partly built` as at least one target present and one missing.
REV-AUDIT-03, -09 and -13 read "present" as `mathlib`, `tauceti` or `both`. The partial material stays
recorded in the target notes.

**Target status (1).**

| Layer | Target | Change | Why |
| --- | --- | --- | --- |
| ModularForms 9 | Twists f⊗ψ, primitive associates, inner twists | absent → partial | `TauCeti.exists_mem_cuspFormCharSpace_qExpansion_coeff_eq_ite_coprime` (Miyake 4.6.5) twists f ∈ S_k(Γ₁(N),χ) by the trivial character mod L (all primes of L dividing N), with modularity, level rad(L)·N and nebentypus χ |

**Notes and citations (11).** No status changes.

| Layer | Target | What the note wrongly said | What exists |
| --- | --- | --- | --- |
| AC.0 | Fourier analysis on finite abelian groups | Parseval and convolution of functions are missing | `TauCeti.hasSum_norm_sq_peterWeylCoeff`: Parseval for any compact group; `haarProb_eq_smul_count`: normalized counting measure on finite groups; Mathlib's `DiscreteConvolution.convolution` and `MeasureTheory.convolution`. Still missing: character-indexed transform and convolution identity |
| ModularForms 7 | Completed L-function and functional equation | non-cusp forms get no continuation of L | Mathlib defines `L` for every modular form through `weakFEPair`; `WeakFEPair.differentiableAt_Λ` makes it differentiable off s = 0, k |
| ModularForms 10B | Structure sheaf, O_D, Čech H¹ | no structure sheaf on Riemann surfaces | Mathlib's `smoothSheafCommRing` over ℂ is O_X ("the structure sheaf", with `ChartedSpace.locallyRingedSpace`) |
| Codes 2 | Hamming support, weight and distance | support formulae for sums not stated | `Function.support_add` (from `mulSupport_mul`), `support_const_smul_of_ne_zero`; only the `hammingNorm`–support link is missing |
| ModularForms 8 | S_k = 0 for k ≤ 0 | weight-zero cusp-form vanishing not stated | `CuspForm.rank_eq_zero_of_weight_lt_twelve` at level one; the Γ₁(N) statement is still missing |
| ModularForms 11 | Weight polynomials P_k(t,n) | root-quotient formula and boundary value not stated | at n = 1: `Chebyshev.S_two_mul_complex_cos`, `S_eval_two`, `S_eval_neg_two`; general n and the generating function are absent |
| Codes 1 | Generator and parity-check matrices | deletion of dependent rows missing | generic `exists_linearIndependent'` and `TauCeti.span_rowReduce` |
| Graph limits 9b | Graph/array law interface | Aldous–Hoover has only the easy direction | row coding of separately exchangeable arrays (cited as related) |
| ModularForms 8 | Period map | no period integrals | `CuspForm.Λ_eq_mellin` gives the period on {0, i∞} (related) |
| ModularForms 9 | Dual form f̄, IsSelfDual | (note gave no construction) | `ModularForm.translate f J` is τ ↦ conj f(−τ̄) (related) |
| Codes 6 | Construction A lattice P_m(C) | cited `checkerboardLattice` as a special case | D_n carries the dot product, twice the roadmap's B₂, so the fit is now `related` |

**Summary (1).** The AdditiveCombinatorics summary now credits Tau Ceti's compact-group Parseval. Its
missing item is narrowed to a character-indexed transform and the convolution identity.

**Duplicates added (8).**

| Layer | Added | Overlap |
| --- | --- | --- |
| AC.4 | `AnalyticNumberTheory:AN.2` | zero-free region, PNT and PNT in progressions: AC.4's prime-distribution inputs |
| AC.0 | `…/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem` | convolution operators, Peter–Weyl basis and Parseval for compact groups |
| ModularForms 0 | `DirichletPadicLFunctions:L0` | generalized Bernoulli numbers and primitive Gauss sums for Eisenstein series with character |
| ModularForms 2 | `SmoothRepresentationsOfLocalGroups:SR.1` | p-adic Hecke algebras and double-coset operators of the (a′) hand-off |
| ModularForms 4 | `GL2AutomorphicRepresentationsAndTransfer:R16.2` | local conductor/newvector theorem, the local form of the conductor and bad-prime classification |
| ModularForms 10A | `…/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts` | elliptic charts and the Riemann-surface structure this sublayer consumes |
| ModularForms 10A | `…/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups` | cofiniteness, elliptic cycles and cusp orbits of Fuchsian groups |
| Codes 2 | `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules` | finite bilinear modules with #H·#H^⊥ = #A and double perp, which the coordinate-power alphabet specializes |

## Findings worth repeating

- **AC.0 should consume, not rebuild.**
  - Tau Ceti's compact-group Parseval (`hasSum_norm_sq_peterWeylCoeff`, with `haarProb_eq_smul_count`).
  - Mathlib's discrete convolution.
  - Only the `AddChar`-indexed transform and its convolution identity are new work.
- **ModularForms 10B** should start from Mathlib's `smoothSheafCommRing` over ℂ as O_X. The new work
  begins at O_D, Leray and the ∂̄-lemma.
- **ModularForms 9** has two starting points:
  - Tau Ceti's coprime filter, for the trivial-character twist.
  - Mathlib's `ModularForm.translate f J`, for the conjugate form.
- **ModularForms 7.** Mathlib already continues L(s,f) meromorphically for every modular form. What is
  missing is the level-N Λ_N with the normalized Fricke companion, and the one-form sign.
- **The classical GL₂ newform trunk is largely built in Tau Ceti.** This confirms the audit's own summary:
  - diamond operators and the nebentypus decomposition;
  - the Hecke ring and classical `T_n`;
  - the Petersson product and the old/new decomposition;
  - fixed-level strong multiplicity one and multiplicity one;
  - the Main Lemma per character, and level lowering;
  - normalized Atkin–Lehner and Fricke operators.

  The open core is bad-prime theory: U_p on the new space, Atkin–Lehner–Li, the conductor and signs.
  Next come Hecke adjoints and eigenbases, then everything from modular symbols onward.
