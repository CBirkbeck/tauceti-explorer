# Arithmetic statistics, counting fields and Selmer distributions

**Roadmap** `ArithmeticStatistics` · stages ST.0–ST.5 · baseline Mathlib `082e2d3`, Tau Ceti `f790474`.
Restructured by RS-07 (accepted), which this blueprint follows.

## Purpose

This roadmap proves counting theorems for families of arithmetic objects:

- how many number fields of a given degree have discriminant at most X;
- how large the torsion in their class groups is on average;
- how large the 2-Selmer group of an elliptic curve over ℚ is on average, when the curves are ordered by height.

Each theorem is proved from an orbit parametrization of the objects and a count of lattice points in a fundamental domain,
with explicit control of the cusp and of infinitely many local conditions. The model theorems are:

- **Davenport–Heilbronn** (cubic fields, and the mean of the 3-torsion of quadratic class groups), by the route of
  Bhargava–Shankar–Tsimerman;
- **Bhargava–Shankar** (the average size of the 2-Selmer group is 3, so the average rank is at most 3/2).

The roadmap also states the known higher moments and the distribution models:

- the Cohen–Lenstra, Malle and Poonen–Rains predictions, and Bhargava–Kane–Lenstra–Poonen–Rains;
- the two Selmer-distribution theorems Burungale–Tian use: Smith's 2^∞ law and Bhargava–Klagsbrun–Lemke Oliver–Shnidman's
  3^∞ corank consequence.

Conjectural predictions are **definitions of propositions that no theorem assumes**. Every proved statement keeps its
source's family, ordering, weights, local conditions and error terms.

## Scope and structure

| Stage | Title | Content | Status |
|---|---|---|---|
| ST.0 | Families, heights and measures | Families with equivalence, height ordering, weights and local conditions; densities; bounded-height finiteness; the binary-quartic invariants I, J, eligible pairs and height normalisation; Burungale–Tian's squareclass-height twist families | partial |
| ST.1 | Parametrizations by orbits | 2-Selmer elements as locally soluble binary quartics, stabilizers and the comparison with the cohomological Selmer group; pairs of ternary quadratic forms; Delone–Faddeev and Bhargava's quartic parametrization (quintic at statement level) | partial |
| ST.2 | Geometry of numbers and uniformity | The geometric sieve and local densities; fundamental domains, averaging and the cusp for binary quartic and cubic forms; reducible forms; the uniformity estimate for infinitely many congruence conditions | partial |
| ST.3 | Fields and class groups | Davenport–Heilbronn by the Bhargava–Shankar–Tsimerman route; the classical binary quadratic and cubic counts; quartic and quintic counts and class-group moments (stated); Cohen–Lenstra and Malle as hypotheses | partial |
| ST.4 | Selmer groups and rank bounds | Bhargava–Shankar §3: local solubility, the change of measure, local masses, the Tamagawa number of PGL₂, the average 3 and the rank bound 3/2 | partial |
| ST.5 | Beyond first moments | Higher Selmer averages, distribution models, local statistics, function-field results; Burungale–Tian's Smith and BKLOS inputs | partial |

The stage order is RS-07's: ST.0 → ST.1 → ST.4, ST.0 → ST.2 → ST.3, and ST.5 after them. Every open item is listed in the
packet's coverage `remaining` lists and its gaps.

## Conventions

- **Families.** A family is a set of objects taken up to a stated equivalence, with a height, optional local conditions and
  an optional weight, usually the inverse of the order of the automorphism group. Changing any of these gives another
  theorem. ST.0 proves the comparisons between the conventions the sources use, and every counting theorem names its family.
- **Binary quartic forms.** GL₂ acts on binary quartic forms by the twisted action of Bhargava–Shankar. I and J are the
  invariants of relative weights 4 and 6, with the discriminant 4I³ − J² = 27Δ in Bhargava–Shankar's normalisation. The
  height is H(I, J) = max(|I|³, J²/4).
- **Elliptic curves.** E^{A,B}: y² = x³ + Ax + B is ordered by the naive height, imported from Tau Ceti EllipticCurves
  layer 8. ST.0 proves the comparison 27·H_E = 4·H′ with the quartic height.
- **Number fields** are counted up to isomorphism, by absolute discriminant, with their signature. The Galois-group condition
  is stated whenever the source restricts it.
- **Local conditions** are closed subsets with boundary of measure 0 for Haar measure on ℤ_p. Infinitely many conditions
  are imposed only through the uniformity estimates of ST.2.
- **Conjectures** (Cohen–Lenstra, Malle, Poonen–Rains, Bhargava–Kane–Lenstra–Poonen–Rains) are propositions and never
  hypotheses of a theorem of this roadmap.

## Boundaries with other roadmaps

The boundaries are those of RS-07:

- **Tau Ceti EllipticCurves** (layers 1 and 4–8) supplies:
  - per-curve descent, Mordell–Weil and Selmer groups;
  - the minimal-pair height with finiteness at bounded height;
  - local reduction and twists.

  They are recorded as `upstreamPrerequisites`, with requests.
- **GeometryOfNumbersAndQuadraticArithmetic GN.4** owns Davenport's lattice-point estimate for bounded semialgebraic sets.
- **AnalyticNumberTheory** supplies the divisor bound (AN.5), and AN.8 consumes ST.0 and ST.1. ST.3's Dedekind class-number
  residue is Mathlib's.
- **Other Tau Ceti roadmaps** supply number-field inputs through their layers: GlobalQuadraticForms (ternary Hasse–Minkowski),
  PolynomialGaloisGroups, ClassFieldTheory, GlobalNumberFields, NumberFieldArithmetic and LocalFieldsRamification.
- **SelmerIwasawaCohomology** (L1, L2, L4), **ComplexMultiplicationAndExplicitReciprocity** (CM.1, CM.3) and
  **ArithmeticGaloisDuality** supply the corank, parity and CM inputs of ST.5's BKLOS deduction.
- **The accepted Part IIs** own what their names say:
  - ArithmeticStatisticsPartIISmithMethod owns Smith's method, and ST.5 states Smith's theorem as an input without
    depending on it;
  - ArithmeticStatisticsPartIIRandomPolynomials, ArithmeticStatisticsPartIIRandomGammaGroups and
    ArithmeticStatisticsPartIISchinzelAverages.

## Sources

- **Main sources:**
  - M. Bhargava and A. Shankar, *Binary quartic forms having bounded invariants, and the boundedness of the average rank of
    elliptic curves*, Ann. of Math. 181 (2015), read in arXiv:1006.1002v3;
  - M. Bhargava, A. Shankar and J. Tsimerman, *On the Davenport–Heilbronn theorems and second order terms*, Invent. Math.
    193 (2013), arXiv:1005.0672;
  - Bhargava's *Higher composition laws* II–III and the quartic and quintic density papers, where public;
  - the maintainer-added source B. Burungale and Y. Tian, *A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin
    and Rubin*, Ann. of Math. 203 (2026), arXiv:2506.03465v2.
- **Stage-specific sources** are listed in the packet's `sources`, with their URLs and the sections read. They include:
  - Smith and Bhargava–Klagsbrun–Lemke Oliver–Shnidman for ST.5;
  - Ellenberg–Venkatesh–Westerland and the Poonen–Rains paper;
  - the public accounts of the classical results whose original sources are not public (Davenport–Heilbronn 1971,
    Cohen–Lenstra, Cremona's and Birch–Swinnerton-Dyer's descent).
- **Mistakes** found in the sources are in the packet's `sourceIssues`, with corrections, and the nodes use the corrected
  statements. Examples:
  - a factor of 2 in Bhargava–Shankar's Theorem 1.4(a);
  - the missing positivity of the local masses in its Theorem 3.1;
  - a false step in the proof of its Theorem 2.20, with a repair;
  - Gauss's domain counting every orbit twice (the error cancels).

## ST.0 — Families, heights and measures

This layer fixes what every counting theorem of the roadmap counts. An arithmetic statistic is a
statement about a *family* — a set of objects taken up to a stated equivalence, ordered by a
stated height, possibly cut out by local conditions and possibly weighted — and the same
objects under another equivalence, height or weighting give another theorem. ST.0 builds the
general carrier for such families (counting functions, relative densities, stabilizer weights,
local conditions and largeness), proves finiteness at bounded height for the families the
roadmap uses, and proves the comparisons between the family conventions of its sources:
representatives against classes, one height against a rescaled or piecewise-rescaled one,
embedded number fields against isomorphism classes.

It also owns the binary-quartic interface that ST.1–ST.4 and `AnalyticNumberTheory:AN.8` consume:
the invariants `I` and `J` with their `GL₂` weights, the discriminant, the eligible invariant pairs
characterised modulo 27, the height `H(I, J)`, and the normalisation `27·H_E = 4·H′` between the
naive height of an elliptic curve and the quartic height of its invariants. The elliptic curve
itself, its minimal-pair model, its naive height and the finiteness of isomorphism classes of
bounded height are imported from Tau Ceti's EllipticCurves Layer 8 and are not rebuilt here.

Finally it owns the quadratic-twist families of Burungale–Tian: the unweighted family of twists
`E^(t)` indexed by squareclasses `t ∈ F×/F×²` and ordered by the squareclass height, its
bounded-height finiteness, the isomorphism multiplicity of the twist map, the positive squarefree
family over `ℚ` and its even-parity subfamily `n ≡ 1, 2, 3 (mod 8)`, and the density comparison
that turns a density-one statement in that subfamily into "50% of the positive squarefree
integers".

Sources: Bhargava–Shankar, *Binary quartic forms having bounded invariants, and the boundedness of
the average rank of elliptic curves* (arXiv:1006.1002v3; Annals 181 (2015)), §§1–2 and the opening
of §3; Burungale–Tian, *A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin*
(arXiv:2506.03465v2; Annals 203 (2026)), §1.0.2 and §3.2; Bhargava–Klagsbrun–Lemke Oliver–Shnidman,
*Three-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a
number field* (Duke 168 (2019), author version), §§1–2; Nunes, *Squarefree numbers in arithmetic
progressions* (arXiv:1402.0684v2), §1; Bhargava–Shankar–Tsimerman, *On the Davenport–Heilbronn
theorems and second order terms* (arXiv:1005.0672v3), §1 (Theorems 1, 3, 7).

### What Mathlib and Tau Ceti already provide (consume; never restate)

- **Northcott functions.** Mathlib's `Northcott` (a function whose sublevel sets are finite),
  `Northcott.comp_of_finite_fibers` and `Filter.TendstoCofinite` (finite fibres). Tau Ceti's
  `TauCeti.normLE` and `TauCeti.summatory` (the inclusive carrier and summatory function of a
  natural-valued Northcott height, with `coe_normLE` and `eventually_summatory_indicator_sub_eq`).
- **Heights and discriminants of fields.** Mathlib's `Height.mulHeight₁` with Northcott in a number
  field (`NumberField.finite_setOfPred_mulHeight₁_le`); `NumberField.discr` and Hermite's theorem
  `NumberField.finite_of_discr_bdd` (finitely many number fields inside a fixed extension with
  `|disc| ≤ N`), with Tau Ceti's explicit count
  `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`.
- **Group actions.** Mathlib's orbit type `MulAction.orbitRel.Quotient`, `MulAction.stabilizer`,
  conjugation of stabilizers `MulAction.stabilizer_smul_eq_stabilizer_map_conj`, and the class
  formula `MulAction.card_eq_sum_card_group_div_card_stabilizer`.
- **Squareclasses and Selmer groups of number fields.** Tau Ceti's `TauCeti.SquareClassGroup` and
  `TauCeti.squareClass`; Mathlib's `IsDedekindDomain.selmerGroup`, `valuationOfNeZero` and
  `valuationOfNeZeroMod`; Tau Ceti's finiteness `IsDedekindDomain.finite_selmerGroup_of_numberField`
  (class number theorem and Dirichlet's unit theorem), `valuationOfNeZeroMod_mk_eq_one_iff` and
  `finite_setOfPred_valuation_ne_one`; Mathlib's `Ideal.absNorm` with Tau Ceti's Northcott instance
  `TauCeti.instNorthcottAbsNormNonZeroDivisors`.
- **Weierstrass curves and twists.** Mathlib's `WeierstrassCurve.VariableChange` and its action,
  the coefficient formulas `variableChange_a₁` … `variableChange_a₆`, `IsShortNF`,
  `Δ_of_isShortNF`, `exists_variableChange_isShortNF`, `variableChange_j`. Tau Ceti's
  `WeierstrassCurve.shortCurve`, and EllipticCurves Layer 5's quadratic twists
  `WeierstrassCurve.quadraticTwistOf`, `quadraticTwist`, `exists_smul_quadraticTwistOf_eq`,
  `exists_smul_eq_quadraticTwistOf_add_mul`, `exists_smul_quadraticTwist_eq`,
  `not_exists_smul_quadraticTwist_eq`.
- **Polynomials and analytic inputs.** Mathlib's `Polynomial.discr` (with the explicit cubic
  formula `discr_of_degree_eq_three`), `MvPolynomial.IsHomogeneous`, `Matrix.GeneralLinearGroup` and
  its `det`, `PadicInt`, the Möbius function with `moebius_mul_coe_zeta`, `exists_sq_mul_squarefree`,
  `DirichletCharacter.LSeries.mul_mu_eq_one`, `LFunction_eq_LSeries`,
  `LFunctionTrivChar_eq_mul_riemannZeta`, `riemannZeta_two`, and `AlgHom.card`.

### What this layer imports from other roadmaps

- **Tau Ceti EllipticCurves Layer 8** (`tauceti:TauCetiRoadmap/EllipticCurves#layer-8-selected-ℚ-specific-database-adapters`):
  the predicate `IsMinimalPairNF` on integral short equations (no prime `ℓ` with `ℓ⁴ ∣ a₄` and
  `ℓ⁶ ∣ a₆`), `MinimalPairModel` with `exists_minimalPairModel` and `minimalPairModel_unique`,
  `shortEquationHeight = max(4|a₄|³, 27a₆²)`, `naiveHeight` with `naiveHeight_variableChange`, and
  finiteness of minimal-pair equations of bounded height. This is the canonical carrier of "elliptic
  curves over `ℚ` ordered by height"; ST.0 composes it with the invariant map.

Nothing else is imported: in particular ST.0 does not use Minkowski's theorem
(`GeometryOfNumbersAndQuadraticArithmetic:GN.1`); the geometry-of-numbers input of the roadmap,
Davenport's lemma, enters at ST.2 from `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

### Standing conventions

- **Families count classes.** The type of a family's objects already is the quotient by the
  family's equivalence (a `Quotient` or an orbit type). Counting representatives is allowed only
  through `comap`, which records the fibre cardinalities.
- **Heights are real-valued, cutoffs inclusive.** `N_H(S; X) = #{i ∈ S : H(i) ≤ X}`, as in Tau Ceti's
  `normLE`. The sources write `H < X`; the strict count `countLT` exists, and densities do not
  depend on the choice.
- **Densities are relative and named.** `HasDensity S T d` means `N(S ∩ T; X)/N(T; X) → d` along real
  `X → ∞` (with `0/0 = 0`); "density one" always names its reference family `T`, and a lower bound
  on the lower density is never written as a limit.
- **Weights.** The stabilizer weight of an orbit is `1/#Stab_Γ(v)`. When a finite subgroup `Z` acts
  trivially the normalisation `#Z·(1/#Stab_Γ)` is written out: Bhargava–Shankar's weight `1/r` for
  a `GL₂(ℤ)`-stabilizer of order `2r` is `1/#Stab_{PGL₂(ℤ)}`, twice the `GL₂(ℤ)` weight.
- **The `GL₂` action on binary quartic forms** is by the row vector: `γ·f(x, y) = f((x, y)·γ)`, a left
  action; the twisted action is `γ⋆f = (det γ)⁻²·γ·f`. The discriminant `Δ` is the integral
  sixteen-term polynomial, with `27Δ = 4I³ − J²` a theorem.
- **Heights on invariants.** `H(I, J) = max{|I|³, J²/4}`, with the factor `1/4` as in Bhargava–Shankar.
- **Twists** of `y² = x³ + Ax + B` by a squareclass represented by `u` are the class of
  `y² = x³ + u²A x + u³B` (the model `u y² = x³ + Ax + B`), modulo `F`-isomorphism; the trivial
  class is included.
- **Squareclass height.** `H(t) = ∏_{ord_v(t) odd} N v` over finite primes only; over `ℚ`,
  `H([n]) = |n|` for squarefree `n`.

### A. Families, counting functions and densities

**Arithmetic family** (`ArithmeticStatistics.ArithmeticFamily`, node `ST.0/arithmetic-family`). A
structure with a height `ι → ℝ` and a proof that it is Northcott. The counting functions are
`weightedCount F w X = Σ_{H(i) ≤ X} w(i)` (over the finset `heightLE X`), `count F S X` and the
strict `countLT F S X`. Constructors: `ofQuotient` (a class-invariant height on representatives with
Northcott induced height), `comap` along a finite-fibre map, `rescale` by `c > 0`, `ofNat` (a
natural-valued Northcott height; its `heightLE` is `TauCeti.normLE` and its weighted count is
`TauCeti.summatory`), `ofMulHeight` (a number field ordered by `mulHeight₁`).
API: `finite_height_le`, `mem_heightLE`, `count_eq_weightedCount_indicator`, `count_mono_set`,
`count_mono`, `count_union_of_disjoint`, `count_eq_zero_of_lt`, `tendsto_count_atTop` (an
infinite subfamily has unbounded count), `countLT_le_count`, `count_rescale`
(`N_{cH}(S; X) = N_H(S; X/c)`), `count_comap` (isomorphism multiplicity:
`N_{H∘f}(f⁻¹S; X) = Σ_{i ∈ S, H(i) ≤ X} #f⁻¹(i)`), `heightLE_ofNat` (compatibility with Tau Ceti).
Unit tests: `test_count_int` (the integers ordered by `|n|` have 7 members of height `≤ 3`),
`test_count_empty`, `test_not_northcott_abs_rat` (`|x|` on `ℚ` is not Northcott — the rationals
ordered by absolute value are not a family), `test_count_nat` (`ℕ` ordered by `n` has `⌊X⌋₊ + 1`
members of height `≤ X`, the cardinality of `TauCeti.normLE`).

**Relative density** (`ArithmeticFamily.ratio`, `upperDensity`, `lowerDensity`, `HasDensity`,
`ratioLT`; node `ST.0/relative-density`). `r_X(S | T) = N(S ∩ T; X)/N(T; X)`, its `limsup` and
`liminf`, and the limit. API: `ratio_nonneg`, `ratio_le_one`,
`hasDensity_iff_lowerDensity_eq_upperDensity`, `HasDensity.lowerDensity_eq`, `hasDensity_self`
(`T` infinite), `hasDensity_empty`, `HasDensity.diff` (complement, `T` infinite), `HasDensity.union`
(disjoint union), `hasDensity_zero_of_finite`, `HasDensity.congr_finite` (finite modification),
`hasDensity_iff_tendsto_ratioLT` (strict and inclusive cutoffs agree), `hasDensity_rescale_iff`.
Unit tests: `test_density_even` (even numbers, `1/2`), `test_density_finite` (`{0, 1, 2}`, `0`),
`test_density_not_exists` (the blocks `[4^k, 2·4^k)` have lower density `1/3`, upper `2/3`),
`test_density_depends_on_height` (with height `n` on even and `n²` on odd numbers the even numbers
have density `1`).

Three comparison lemmas follow.

- **Towers** (`ArithmeticFamily.HasDensity.trans`, `ST.0/relative-density-is-multiplicative-in-towers`).
  For `S ⊆ T ⊆ U`: density `α` of `S` in `T` and `β` of `T` in `U` give density `αβ` of `S` in `U`;
  the proportions multiply identically.
- **Restriction** (`ArithmeticFamily.HasDensity.inter_of_lowerDensity_pos`,
  `ST.0/density-one-restricts-to-subfamilies-of-positive-lower-density`). If `A` has density one in
  `T` and `U ⊆ T` has positive lower density in `T`, then `A ∩ U` has density one in `U`. Positivity
  is needed: `ℕ` minus the perfect squares has density one and misses the squares.
- **Changing the height.** For a constant factor (`ArithmeticFamily.tendsto_rescale_count_div_rpow`,
  `ST.0/constant-rescaling-of-a-height`): `H′ = cH` has the same densities, and an asymptotic
  `N_H(S; X) ~ C X^κ` becomes `N_{H′}(S; X) ~ C c^(−κ) X^κ`. For constant factors `c_j` on finitely many
  disjoint pieces `T_j` with `N_H(T_j; X) ~ a_j X^κ` (`ArithmeticFamily.hasDensity_piecewise_rescale`,
  `ST.0/piecewise-rescaling-of-a-height`): densities `d_j` of `A` in the pieces give density
  `Σ c_j^(−κ) a_j d_j / Σ c_j^(−κ) a_j` in `⋃ T_j` for `H′`. This is the comparison between ordering
  quadratic twists by the squarefree part `m` and by the fundamental discriminant `|d| ∈ {m, 4m}`.

### B. Weighted counts

**Stabilizer weight** (`ArithmeticStatistics.stabilizerWeight`, `weightedOrbitCount`; node
`ST.0/stabilizer-weighted-orbit-count`). For a group `Γ` acting on `V` and a family on `Γ\V`,
`w(Γv) = 1/#Stab_Γ(v)` and `N^w(S; X) = Σ_{Γv ∈ S, H ≤ X} w(Γv)`. API: `stabilizerWeight_mk`,
`stabilizerWeight_eq_one_iff` (weight one iff trivial stabilizer), `stabilizerWeight_pos`,
`stabilizerWeight_le_one`, `natCard_mul_stabilizerWeight` (a finite trivially-acting `Z`:
`#Z·w(Γv) = 1/#(Stab_Γ(v)/Z)`), `finsum_stabilizerWeight` (mass formula `Σ w = #V/#Γ` for finite
`Γ`, `V`). Unit tests: `test_stabilizerWeight_regular` (weight one in the regular action),
`test_stabilizerWeight_fixed_point` (`{±1}` on `ℤ/3` gives `0` weight `1/2`),
`test_mass_formula_zmod_three` (total `3/2 = #V/#Γ`; reciprocal orbit lengths would give `2`).

**Weighted against unweighted** (`ArithmeticStatistics.count_sub_weightedOrbitCount_le`,
`ST.0/weighted-and-unweighted-orbit-counts`). With finite stabilizers,
`0 ≤ N(S; X) − N^w(S; X) ≤ #{Γv ∈ S : H ≤ X, Stab_Γ(v) ≠ 1}`. For binary quartic forms it is applied
to `PGL₂(ℤ)` (whose orbits on `V_ℤ` are the `GL₂(ℤ)`-orbits), with Bhargava–Shankar's Lemma 2.4 from
ST.2 as the negligibility input; applied to `GL₂(ℤ)` itself every stabilizer contains `±1` and the
bound is trivial.

The orbit family of `GL₂(ℤ)`-classes of irreducible integral binary quartic forms is an input of
these two items: its bounded-height finiteness comes from reduction theory (Bhargava–Shankar
§§2.1–2.2; they cite Borel–Harish-Chandra) and is proved with the fundamental domain at ST.2. Forms
of height zero (all multiples of `x⁴`) are infinitely many classes and are excluded.

### C. Local conditions

**Families defined by local conditions** (`ArithmeticStatistics.LocalConditions`, with `family`,
`FinitelyMany`, `IsRegular`, `localDensity`, `IsLargeRel`; node `ST.0/family-defined-by-local-conditions`).
Localisation maps `loc_v : ι → X_v` and conditions `cond_v ⊆ X_v`; the family is
`{i : loc_v(i) ∈ cond_v for all v}`; finitely many conditions if `cond_v = X_v` for almost all `v`;
regular if each `cond_v` is measurable with boundary of measure zero; local density `μ_v(cond_v)`;
large relative to bad loci `B_v` if for almost all `v` the closure of `loc_v(family)` contains
`X_v ∖ B_v`. Instances: Bhargava–Shankar's elliptic families (`X_p = ℤ_p²`, `loc_p = (I, J)`,
`B_p = {p² ∣ Δ}`); sets of binary quartic forms with `μ_p` the normalised Haar measure on `V_{ℤ_p}`;
BKLOS's squareclass families (`X_v = F_v×/F_v×²`, the preimage measure in `O_{F_v}`, the discrete
measure at infinite places); Burungale–Tian's family `n ≡ 1, 2, 3 (mod 8)` (conditions at `2` and
`∞`); Bhargava–Shankar–Tsimerman's local specifications of cubic rings. API: `mem_family`, `inf`,
`family_inf`, `family_eq_univ`. Unit tests: `test_family_squarefree` (`n ≢ 0 mod p²` for all `p`
cuts out the squarefree integers), `test_not_finitelyMany_squarefree`, `test_family_univ`.

**Weights defined by congruence conditions** (`ArithmeticStatistics.CongruenceWeight`, with `weight`,
`ConvergesTo`, `IsLocallyConstantAE`, `IsAcceptable`; node `ST.0/acceptable-weight-function`).
Local weights `φ_p : X_p → [0, 1]` whose Euler product converges to `φ`, each locally constant off
a closed null set; acceptable if `φ_p = 1` off the bad locus for all large `p`. For binary quartic
forms the bad locus is `{p² ∣ Δ(f)}` and the indicator of squarefree discriminant is acceptable. API:
`weight_mem_Icc`. Unit tests: `test_const_one_acceptable`, `test_indicator_acceptable`,
`test_half_not_acceptable`.

### D. Binary quartic forms, their invariants and eligible pairs

**Binary quartic forms** (`ArithmeticStatistics.BinaryQuartic R`, node `ST.0/binary-quartic-form`).
Five coefficients `a, b, c, d, e` over a commutative ring, `f = ax⁴ + bx³y + cx²y² + dxy³ + ey⁴`;
`eval`, `dehomogenize` (`f(X, 1)`), `toMvPolynomial` (homogeneous of degree 4). `GL₂(R)` acts by
`subst`: for `γ` with rows `(p, q)`, `(r, s)` the new coefficients are `a′ = f(p, q)`, `e′ = f(r, s)` and
the explicit `b′, c′, d′` of the node. The twisted action `twistedSMul γ f = (det γ)⁻²·(γ·f)` is an
action of `PGL₂`; on `det γ = ±1` it equals the untwisted one. API: `eq_iff_coeff`, `eval_smul`,
`scalarGL`, `twistedSMul_mul`, `twistedSMul_scalar`, `twistedSMul_eq_smul_of_det_sq`,
`neg_one_smul`, `map`, `map_smul`, `isHomogeneous_toMvPolynomial`. Unit tests: `test_subst_swap`
(the swap reverses the coefficients), `test_subst_translate` (`x³y ↦ x³y + 3x²y² + 3xy³ + y⁴` under
`x ↦ x + y`), `test_subst_row_convention` (`x⁴` is fixed by `(1 1; 0 1)`; the column convention
fails), `test_one_smul`.

**Invariants** (`BinaryQuartic.invI`, `invJ`, `disc`; node `ST.0/binary-quartic-invariants`).
`I = 12ae − 3bd + c²`, `J = 72ace + 9bcd − 27ad² − 27eb² − 2c³`, and the sixteen-term integral
discriminant `Δ` with `twentySeven_mul_disc : 27Δ = 4I³ − J²`. API: `scale`, `invI_scale`
(`I(rf) = r²I`), `invJ_scale` (`J(rf) = r³J`), `invI_twistedSMul`, `invJ_twistedSMul` (absolute
invariance under the twisted action), `disc_smul` (`Δ(γ·f) = (det γ)¹²Δ(f)`), `map_invI`, `map_invJ`.
Unit tests: `test_invariants_x3y_sub_xy3` (`I = 3`, `J = 0`, `Δ = 4`), `test_disc_x4_sub_y4`
(`I = −12`, `Δ = −256`), `test_nullcone_x4` (`I = J = Δ = 0`), `test_invI_not_invariant_untwisted`
(`2·1 ∈ GL₂(ℚ)` sends `I = 3` to `768`).

- **Relative invariance** (`BinaryQuartic.invariants_smul`, `ST.0/relative-invariance-of-i-and-j`,
  Bhargava–Shankar (5)): `I(γ·f) = (det γ)⁴I(f)` and `J(γ·f) = (det γ)⁶J(f)` for all `γ ∈ GL₂(R)`, a
  polynomial identity over `ℤ`.
- **The discriminant is the polynomial discriminant** (`BinaryQuartic.disc_eq_discr`,
  `ST.0/quartic-discriminant-is-the-polynomial-discriminant`): if `f(X, 1)` has degree 4 then
  `Δ(f) = Polynomial.discr (f(X, 1))`, computed from the `7 × 7` Sylvester matrix as Mathlib does
  in degree 3.

**Height** (`BinaryQuartic.pairHeight`, `height`; node `ST.0/binary-quartic-height`).
`H(I, J) = max{|I|³, J²/4}` and `H(f) = H(I(f), J(f))`. API: `pairHeight_nonneg`, `pairHeight_scale`
(`H(t²I, t³J) = t⁶H(I, J)`, hence `H(2⁴I, 2⁶J) = 2¹²H(I, J)`), `pairHeight_eq_zero_iff`,
`abs_le_of_pairHeight_le` (`|I| ≤ X^(1/3)`, `|J| ≤ 2X^(1/2)`), `four_mul_pairHeight_intCast`
(`4H(I, J) = max{4|I|³, J²} ∈ ℕ`), `northcott_pairHeight`, `height_smul` (`GL₂(ℤ)`-invariance),
`height_scale`. Unit tests: `test_pairHeight_one_two` (`H(1, 2) = 1`), `test_pairHeight_zero`,
`test_pairHeight_not_max_abs` (`H(2, 2) = 8`).

**Eligible pairs** (`BinaryQuartic.IsEligible`, `EligibilityCongruence`; node
`ST.0/eligible-invariant-pairs`). `(I, J)` is eligible if it is `(I(f), J(f))` for an integral `f`.
The congruences: (a) `I ≡ 0 (mod 3)`, `J ≡ 0 (mod 27)`; (b) `I ≡ 1 (mod 9)`, `J ≡ ±2 (mod 27)`;
(c) `I ≡ 4 (mod 9)`, `J ≡ ±16 (mod 27)`; (d) `I ≡ 7 (mod 9)`, `J ≡ ±7 (mod 27)`. API:
`invariants_isEligible`, `isEligible_selmer_scaling` (`(2⁴I, 2⁶J)` stays eligible). Unit tests:
`test_eligible_one_two`, `test_not_eligible_one_zero`, `test_not_eligible_two_mod_three`,
`test_eligible_zero`.

- **Necessity** (`BinaryQuartic.eligibilityCongruence_invariants`,
  `ST.0/eligible-invariant-pairs-satisfy-the-congruences`): a computation on the coefficients. If
  `3 ∣ c` then case (a); otherwise, with `w ≡ ae − bd (mod 3)` and `c = ±1 + 3k`,
  `I ≡ 1 + 3m (mod 9)` and `J ≡ ∓2 ∓ 9m (mod 27)` for `m ≡ w ± 2k`, giving (b)–(d). Bhargava–Shankar
  argue through the cubic resolvent, which belongs to ST.1; the direct route keeps ST.0 below ST.1.
- **Sufficiency** (`BinaryQuartic.isEligible_of_eligibilityCongruence`,
  `ST.0/congruence-pairs-are-eligible`): `x³y + r x²y² + s xy³ + t y⁴` has `I = r² − 3s`,
  `J = −2r³ + 9rs − 27t`; take `r = 0` in case (a), `r = 1` for `J ≡ −2, 16, 7` and `r = −1` for
  `J ≡ 2, −16, −7`.
- **Theorem 1.7** (`BinaryQuartic.isEligible_iff`, `ST.0/eligibility-criterion-modulo-27`): eligible
  if and only if one of (a)–(d) holds.
- **Lemma 2.9** (`BinaryQuartic.exists_eligible_residues`,
  `ST.0/eligible-pairs-are-nine-lattice-translates`): eligibility depends only on
  `(I mod 9, J mod 27)`, with exactly nine eligible residue pairs; the eligible pairs are nine
  translates of `9ℤ × 27ℤ`, of density `1/27`.

### E. Elliptic curves over ℚ and the quartic interface

**Elliptic curves ordered by height** (`ArithmeticStatistics.EllipticFamily.Carrier`, `family`,
`invariants`, `heightPrime`; node `ST.0/elliptic-curves-over-q-ordered-by-height`). The carrier is
Layer 8's minimal-pair integral short equations with `4A³ + 27B² ≠ 0`, in bijection with
`ℚ`-isomorphism classes (`toIsoClass`, `toIsoClass_injective`, `exists_toIsoClass_eq`, from Layer 8's
existence and uniqueness); the height is Layer 8's `max{4|A|³, 27B²}`, Northcott by Layer 8. The
invariant map is `(I, J) = (−3A, −27B)` (`invariants_injective`, `invariants_eligible`),
`H′(E) = H(I, J)`, and `4I³ − J² = −27(4A³ + 27B²)`, so `Δ(I, J) = Δ_E/16`
(`pairDisc_invariants`, `sixteen_mul_pairDisc_invariants`). Unit tests: `test_height_congruent`
(`y² = x³ − x`: `H = 4`, `(3, 0)`, `H′ = 27`), `test_not_minimal_pair` (`(16, 64)`),
`test_singular_excluded` (`(0, 0)`). On bare rational short equations the height is not an
invariant and bounded-height finiteness fails; the minimal-pair carrier is what makes the family
well defined.

**Normalisation** (`EllipticFamily.twentySeven_mul_height`, `ST.0/quartic-to-curve-height-normalisation`).
`27·H(E) = 4·H′(E)`. With the constant-rescaling lemma: the two heights order every set of curves
identically, the count by `H′` at `X` is the count by `H` at `4X/27`, and an `X^(5/6)` constant for
`H` becomes `(4/27)^(5/6)` times itself for `H′`.

**Families defined by congruence conditions** (`EllipticFamily.invLocal`, `IsLarge`, `SignCondition`,
`congruenceFamily`; node `ST.0/elliptic-families-defined-by-congruence-conditions`). Local sets
`Σ_p ⊆ {(I, J) ∈ ℤ_p² : Δ ≠ 0}`, closed there with null boundary, and a sign condition at `∞`;
`Inv_p(S)` is the `p`-adic closure of the invariants minus `Δ = 0`; `S` is large if for almost all
`p`, `Inv_p(S)` contains every pair with `p² ∤ Δ` (for `p ≠ 3`: `p² ∤ 4I³ − J²`). API:
`IsLarge.mono`, `isLarge_semistableAwayFromSix` (the curves with `ℓ ∤ gcd(A, B)` for every prime
`ℓ ≥ 5` — the arithmetic content of Bhargava–Shankar's remark that the semistable family is large).
Every nonempty family defined by finitely many congruence conditions on `(A, B)` is large. Unit
tests: `test_not_large_j1728` (`B = 0` is not large), `test_congruenceFamily_univ`,
`test_large_finite_congruence` (`A ≡ 1 mod 5`).

**All curves** (`EllipticFamily.isLarge_univ`, `ST.0/all-elliptic-curves-form-a-large-family`). The
whole family is large: for `p ≥ 5`, every `(I, J)` with `p² ∤ Δ` is a `p`-adic limit of invariant
pairs of minimal pairs (Chinese remainder theorem and a sieve over the primes `ℓ` for minimality).

**The binary-quartic interface** (`BinaryQuartic.eligibleFamily`, `ofCurve`; node
`ST.0/invariants-height-and-eligible-pairs`). The eligible pairs as a family ordered by `H(I, J)`,
with `ofCurve E = (−3A, −27B)` and `height_ofCurve : 27·H(E) = 4·H(ofCurve E)`. This is the node that
ST.1–ST.4 and AN.8 cite for the invariants, their weights, the discriminant, the height, the
eligibility criterion and the normalisation. API: `eligibleFamily_height`. Unit tests:
`test_eligibleFamily_count_one` (the eligible pairs of height `≤ 1` are `(0, 0)` and `(1, ±2)`, all
with `Δ = 0`), `test_ofCurve_height_congruent`, `test_ofCurve_not_surjective` (`(1, 2)` is not the
pair of a curve).

### F. Squareclasses and quadratic-twist families

**Squareclass height** (`ArithmeticStatistics.squareclassHeight`, `oddSupport`, `unitHeight`,
`supportIdeal`; node `ST.0/squareclass-height`). For a number field `F` and `t ∈ F×/F×²`,
`H(t) = ∏_{ord_v(t) odd} N v = N(𝔞(t))`, `𝔞(t)` the squarefree support ideal. API: `oddSupport_finite`,
`squareclassHeight_mk`, `squareclassHeight_zero` (`H = 1` on the trivial class),
`unitHeight_eq_absNorm_supportIdeal`, `squareclassHeight_add_mul_sq` (`H(s + t)·g² = H(s)H(t)`),
`squareclassHeight_eq_one_iff` (height one exactly on the Selmer group `K(∅, 2)`),
`squareclassHeight_rat` (`H([n]) = |n|` for squarefree `n`). Unit tests:
`test_squareclassHeight_rat_twelve` (`H([12]) = 3`), `test_squareclassHeight_rat_neg_one`
(`H([−1]) = 1`), `test_squareclassHeight_not_disc` (`H([3]) = 3`, not `disc ℚ(√3) = 12`). Over `ℚ(i)`,
`[2] = [i]` is a nontrivial class of height one.

- **Fibres** (`supportIdeal_eq_iff`, `ST.0/squareclass-height-fibres-are-selmer-cosets`): `𝔞(u) = 𝔞(u′)`
  iff every valuation of `u/u′` is even, i.e. the fibres of `t ↦ 𝔞(t)` are the cosets of `K(∅, 2)`.
- **Bounded-height finiteness** (`northcott_squareclassHeight`,
  `ST.0/finiteness-of-squareclasses-of-bounded-height`): `H` is Northcott on `F×/F×²`, with
  `#{H ≤ X} = #K(∅, 2)·#{squarefree 𝔞 : N𝔞 ≤ X, [𝔞] ∈ Cl(F)²}`. Over `ℚ` this is `2·#{n ≤ X squarefree}`.

**The squareclass twist family** (`ArithmeticStatistics.twistModel`, `twistClass`, `twistFamily`;
node `ST.0/quadratic-twist-squareclass-family`). For `E : y² = x³ + Ax + B` over a number field,
`E^(u) : y² = x³ + u²A x + u³B`, its `F`-isomorphism class depends only on the squareclass, and the
family is `(F×/F×², H)` with the twist map, each squareclass counted once. API: `twistModel_one`,
`twistClass_zero`, `exists_smul_twistModel_mul_sq` (`E^(us²) ≅ E^(u)`), `twistModel_Δ`
(`Δ(E^(u)) = u⁶Δ(E)`), `twistModel_j`, `exists_smul_twistModel_eq_quadraticTwistOf` (the value of
Layer 5's `quadraticTwistOf 0 (−u)` is `E^(u)` up to `u_C = 1/2`; for `u ∉ F×²` Layer 5's
`quadraticTwist E F(√u)` is isomorphic to it), `twistModel_rat_congruent` (over `ℚ`, the twist of
`y² = x³ − x` by `n` is `y² = x³ − n²x`). Unit tests: `test_twistFamily_height_zero`,
`test_twistModel_congruent_five` (`y² = x³ − 25x`), `test_twistModel_sq_iso` (the twist by `4` is `E`).

**Isomorphism multiplicity** (`twistClass_injective_or_neg`,
`ST.0/isomorphism-multiplicity-of-the-twist-family`). For `B ≠ 0` (every `j ≠ 1728`, including
`j = 0`) the twist map is injective: `E^(u) ≅ E^(u′)` iff `u′/u ∈ F×²`. For `B = 0` (`j = 1728`),
`E^(−u) = E^(u)` as models and the fibres are `{t, t + [−1]}`, of size two when `−1 ∉ F×²`. The proof
is the shape of changes of variables between short models (`r = s = t = 0`,
`(a₄, a₆) ↦ (u⁻⁴a₄, u⁻⁶a₆)`). For `y² = x³ − x` over `ℚ` this is why Burungale–Tian index twists by
positive squarefree `n`.

**Positive squarefree integers** (`SquarefreeFamily.natFamily`, `posSquarefree`, `evenParityClasses`;
node `ST.0/positive-squarefree-family-over-q`). `P` = positive squarefree `n` ordered by `n` (the
squareclasses of `ℚ` positive at `∞`); `S ⊆ P` = those with `n ≡ 1, 2, 3 (mod 8)` (local condition
`Σ_2 = {[1], [3], [2], [10]}` at `2`). API: `evenParityClasses_subset`, `posSquarefree_mod_eight`,
`posSquarefree_infinite`, `unitHeight_posSquarefree`. Unit tests: `test_evenParity_members`,
`test_count_evenParity_twenty` (seven members up to `20`: `1, 2, 3, 10, 11, 17, 19`),
`test_count_posSquarefree_one` (`[−1]` is not in `P`).

- **Möbius expansion** (`SquarefreeFamily.sum_moebius_sq_dvd`,
  `ST.0/squarefree-indicator-as-a-moebius-sum`): `Σ_{d² ∣ n} μ(d) = [n squarefree]`.
- **Residue classes** (`SquarefreeFamily.squarefree_residue_count`,
  `ST.0/squarefree-integers-in-residue-classes`): for `gcd(a, q) = 1`,
  `#{n ≤ X squarefree, n ≡ a (mod q)} = (6/π²)·q⁻¹·∏_{p ∣ q}(1 − p⁻²)⁻¹·X + O_q(√X)`, with the constant
  from `L(χ₀μ, 2) = 1/L(χ₀, 2)` and `ζ(2) = π²/6` in Mathlib.
- **Half density** (`SquarefreeFamily.hasDensity_evenParityClasses`,
  `ST.0/even-parity-classes-have-half-density`): `S` has density `1/2` in `P` (each of the six
  squarefree classes mod 8 has density `1/6`; the class `2` is `2m` with `m ≡ 1 (mod 4)`).
- **Density comparison** (`SquarefreeFamily.hasDensity_half_of_hasDensity_one`,
  `ST.0/density-one-in-the-even-parity-classes-is-half-of-all-squarefree`): a subset of density one
  in `S` has density `1/2` in `P`. This is how Burungale–Tian's Theorem 1.2 gives the "50% of the
  positive square-free integers" of their abstract; that the other half has nonzero analytic rank
  (root number `−1`) is proved by the consumer (the Part II CMRankZeroConverse with
  `RankZeroOneBSD:BSD.0`).

### G. Number fields ordered by discriminant

**Embedded fields and isomorphism classes** (`ArithmeticStatistics.NumberFieldFamily.embeddedFamily`,
`isoFamily`, `autWeight`; node `ST.0/number-fields-ordered-by-discriminant`). Finite-dimensional
intermediate fields of a characteristic-0 field `A`, ordered by `|disc|` (Northcott by Hermite);
their `ℚ`-isomorphism classes ordered by `|disc|`; the degree and the weight `n/#Aut(K/ℚ)`. API:
`Embedded`, `isoSetoid`, `degree`, `isoDegree`. Unit tests: `test_rat_discr` (`ℚ` has height `1`),
`test_autWeight_galois` (weight one), `test_autWeight_noncyclic_cubic` (weight three).

**Counting embedded fields** (`NumberFieldFamily.count_degree_eq_weightedCount`,
`ST.0/embedded-and-isomorphism-class-counts-of-number-fields`). In an algebraically closed `A`, the
number of embedded degree-`n` fields with `|disc| ≤ X` is the sum over isomorphism classes of
`n/#Aut(K)`: counting subfields of `ℚ̄` weights non-Galois cubic fields by `3` and cyclic ones by `1`.
Counts of fields "up to isomorphism" (Davenport–Heilbronn at ST.3) are counts in `isoFamily`.

### Dependencies

- Tau Ceti EllipticCurves Layer 8 (minimal-pair model, naive height, bounded-height finiteness),
  for `ST.0/elliptic-curves-over-q-ordered-by-height` and everything built on it.
- Mathlib and Tau Ceti declarations listed above (Northcott, Hermite, Selmer groups of number
  fields, square classes, quadratic twists, polynomial discriminants, Dirichlet L-series).
- ST.0 is consumed by ST.1 (binary-quartic interface, height normalisation), ST.2 (heights of
  forms and pairs, weighted orbit counts, local conditions and acceptable weights, eligible pairs),
  ST.3 (number-field families and weights), ST.4 (elliptic families, largeness, normalisation), ST.5
  and the Part II CMRankZeroConverse (squareclass twist families, relative densities, the density
  comparison), and `AnalyticNumberTheory:AN.8` (the binary-quartic interface).

### Acceptance

- **Isomorphism multiplicity is explicit.** Counting classes against representatives goes through
  `count_comap`; the twist family of `y² = x³ − x` over `ℚ` has multiplicity two (`E^(n) = E^(−n)`), and
  embedded cubic fields have multiplicity `3/#Aut(K)`.
- **Stabilizer weights are explicit.** `{±1}` on `ℤ/3` has orbit weights `1/2` and `1`, total `3/2`;
  Bhargava–Shankar's `1/r` is `2 × stabilizerWeight` for `GL₂(ℤ)`.
- **Changing the height changes the theorem until a comparison is proved.** Densities change with
  the height (`test_density_depends_on_height`); `27H = 4H′` is a constant rescaling, so densities
  agree and constants change by `(4/27)^(5/6)`; the ordering of twists by squarefree part and by
  fundamental discriminant differ by the factors `1` and `4` on residue classes and are compared by
  the piecewise-rescaling lemma.
- **Finiteness before densities.** Every family used is Northcott: elliptic curves (Layer 8),
  squareclasses (`northcott_squareclassHeight`), eligible pairs (`northcott_pairHeight`), number fields
  (Hermite).
- **Concrete values.** `I(x³y − xy³) = 3`, `Δ(x⁴ − y⁴) = −256`; `(1, 2)` eligible, `(1, 0)` not; nine
  eligible residues modulo `(9, 27)`; `y² = x³ − x` has `H = 4`, `H′ = 27`; `H([12]) = 3` over `ℚ`; seven
  even-parity squarefree `n ≤ 20`; density `1/2` of the classes `1, 2, 3 (mod 8)`.

### Mistakes in the sources

Recorded in the packet as `ArithmeticStatistics/E101`–`E105` (arXiv versions read; the Annals
versions were not available).

- **E101 (misprint, Bhargava–Shankar p. 22).** "Σ_p a closed subset of `ℤ_p² \ {Δ ≠ 0}`" should be a
  subset of `ℤ_p² \ {Δ = 0}`, closed there: read literally every family would be empty.
- **E102 (misprint, p. 22).** "`H(E_{A,B}) = (4/27) max{I(E)³, J(E)²/4}`" needs `|I(E)|³`; for
  `y² = x³ + x` the printed right side is `0`.
- **E103 (misprint, p. 3).** The space of quartic forms is printed with the term `dx³y` for `dxy³`.
- **E104 (gap, Burungale–Tian Theorem 1.2).** "The even parity Goldfeld conjecture is true …, that
  is, for a density one subset of the positive square-free integers `n ≡ 1, 2, 3 mod 8`": Goldfeld's
  conjecture is stated for fundamental discriminants ordered by `|d|`; the equivalence needs the
  comparison of the two orderings, supplied here by the restriction and piecewise-rescaling lemmas
  (the even classes carry exactly half of the fundamental discriminants).
- **E105 (gap, Burungale–Tian Proposition 1.3 and Theorem 3.5).** "for at least 50% of
  `t ∈ K×/(K×)²`" has no ordering; the intended one is BKLOS's height `H(t)`, as a lower limiting
  proportion.

## ST.1 — Parametrizations by orbits

This layer proves the orbit parametrizations that the counting stages turn into counts. Each one
is an explicit bijection between the orbits of an algebraic group on a lattice of forms and a set
of arithmetic objects. Each comes with a stated inverse, stabilizers identified with automorphism
groups, discriminants matched, and the nonmaximal, reducible and degenerate loci cut out by
explicit conditions on the forms. There are four of them.

- **Cubic rings.** `GL₂(R)`-classes of binary cubic forms under the twisted action correspond to
  cubic `R`-algebras when `R` is a principal ideal domain or a local ring (Delone–Faddeev, in the
  form of Gan–Gross–Savin and Gross–Lucianovic). The layer also proves the following.
  - `Disc R(f) = disc f`.
  - `Aut R(f) ≅ Stab(f)`.
  - Domains correspond to irreducible forms, and étale algebras to forms with `disc ≠ 0`.
  - Davenport–Heilbronn's criterion: `R(f)` is maximal at `p` if and only if `f ∈ U_p`.
  - The index-`p` subrings and overrings of `R(f)` are counted by zeros of `f mod p`.
- **Quartic rings** (Bhargava, *Higher composition laws III*). `GL₃(ℤ) × GL₂(ℤ)`-classes of pairs of
  integral ternary quadratic forms correspond to quartic rings with a cubic resolvent ring. The
  layer also gives the following.
  - An explicit, integral multiplication table.
  - The number of cubic resolvents: `σ(content)`.
  - The maximality conditions at `p`.
  - The étale reduction mod `p`.
- **Quintic rings** (Bhargava, *Higher composition laws IV*). `GL₄(ℤ) × SL₅(ℤ)`-classes of quadruples of
  quinary alternating forms correspond to quintic rings with a sextic resolvent. This part is
  planned at statement level, together with the maximality sets `U_p`.
- **Genus-one models** (Birch–Swinnerton-Dyer and Cremona, as used in Bhargava–Shankar §3).
  - `PGL₂(K)`-classes of `K`-soluble binary quartic forms with invariants `I, J` correspond to
    `E(K)/2E(K)`.
  - The stabilizers are `E(K)[2]`.
  - The locally soluble classes over a number field correspond to Tau Ceti's explicit 2-Selmer
    group.
  - Over `ℚ` every 2-Selmer element of `y² = x³ + Ax + B` has an integral representative with
    invariants `(2⁴I, 2⁶J)` (Bhargava–Shankar Theorem 3.5).

  Bhargava–Shankar quote these proofs. Here they are planned from public sources that contain
  proofs:
  - Cremona–Fisher's cubic invariant `z`, which determines the orbit.
  - Simon's quartic, and a conic together with Hasse–Minkowski, which give the image of `z`.
  - Cremona–Fisher–Stoll's projection of a plane cubic from a rational point, which gives
    integrality.

The layer also owns Bhargava–Shankar's embedding `φ` of binary quartic forms into pairs of ternary
quadratic forms (§2.6): the orbit bijection of Theorem 2.14 and the uniform fibre bound of
Proposition 2.16. ST.2 uses this embedding to move Bhargava's uniformity estimate from pairs to
quartics.

Sources:
- Bhargava–Shankar, *Binary quartic forms having bounded invariants, and the boundedness of the
  average rank of elliptic curves* (arXiv:1006.1002v3; Annals 181 (2015)), §2.6, §2.8 and §3.1.
- Bhargava–Shankar–Tsimerman, *On the Davenport–Heilbronn theorems and second order terms*
  (arXiv:1005.0672v3; Invent. Math. 193 (2013)), §§2–3.
- Gross–Lucianovic, *On cubic rings and quaternion rings* (J. Number Theory 129 (2009)), §§1–3.
- Gan–Gross–Savin, *Fourier coefficients of modular forms on G₂* (Duke 115 (2002)), §§4–5.
- Bhargava, *Higher composition laws III* (Annals 159 (2004)), §§1–4, and *IV* (Annals 167 (2008)),
  read at the level of statements and structure.
- Cremona–Fisher, *On the equivalence of binary quartics* (J. Symbolic Comput. 44 (2009)), the whole
  paper.
- Cremona–Fisher–Stoll, *Minimisation and reduction of 2-, 3- and 4-coverings of elliptic curves*
  (arXiv:0908.1741; Algebra & Number Theory 4 (2010)), §§2–4.1.
- Fisher, *The invariants of a genus one curve* (arXiv:math/0610318; Proc. LMS 97 (2008)), §7.2.
- Fisher, *On binary quartics and the Cassels–Tate pairing* (arXiv:2208.14977).
- Bhargava–Ho, *Coregular spaces and genus one curves* (arXiv:1306.4424), §4.1.
- Wood, *Quartic rings associated to binary quartic forms* (arXiv:1007.5501).
- Stoll, *Descent on elliptic curves* (arXiv:math/0611694), §§1–2.
- Cremona–Fisher–O'Neil–Simon–Stoll, *Explicit n-descent on elliptic curves I* (Crelle 615 (2008)),
  introduction.

### What Mathlib and Tau Ceti already provide (consume; never restate)

- **Forms and discriminants.** Mathlib's `Cubic` and `Cubic.discr`, the explicit cubic discriminant.
  It is valid for every coefficient vector, including `a = 0`. Also `Matrix.det` and
  `Polynomial.modByMonic`.
- **Algebras of finite rank.**
  - Freeness and bases: `Module.Free`, `Module.finrank`, `Module.Basis`, and
    `Module.free_of_finite_type_torsion_free'` (finitely generated torsion-free modules over a PID
    are free).
  - Discriminants and norms: `Algebra.discr` with `Algebra.discr_of_matrix_mulVec` (a change of
    basis multiplies the discriminant by `(det P)²`), and `Algebra.norm`.
  - Étale algebras: `Algebra.Etale`, `traceForm_nondegenerate` and
    `LinearMap.BilinForm.nondegenerate_iff_det_ne_zero`.
  - Presentations and localization: `MvPolynomial`, `Ideal.Quotient.mk`, `AdjoinRoot`,
    `AdjoinRoot.map` and `Localization.Away`.
  - `NumberField.RingOfIntegers`.
- **Groups.**
  - `Matrix.GeneralLinearGroup`, with `det`, `scalar` and `center_eq_range_scalar`.
  - `Matrix.ProjGenLinGroup` (`PGL(n, R)`), with `mk_surjective`.
  - `Matrix.SpecialLinearGroup`, with `toGL`.
  - `IsCoprime.exists_SL2_col`.
  - `MulAction.stabilizer` and `MulAction.orbitRel`.
- **Quadratic forms.** `QuadraticForm`, `LinearMap.BilinMap.toQuadraticMap`,
  `QuadraticMap.Anisotropic` and `QuadraticMap.not_anisotropic_iff_exists`.
- **Completions.**
  - `PadicInt` and `Padic`.
  - `IsDedekindDomain.HeightOneSpectrum.adicCompletion` (the finite completions of a number field).
  - `NumberField.InfinitePlace` and `NumberField.InfinitePlace.Completion`.
- **Elliptic curves.** Mathlib's `WeierstrassCurve.Affine.Point` with its group law, and
  `powMonoidHom`.
- **Tau Ceti's explicit 2-descent** (EllipticCurves Layer 6, built), for a curve `W` in short
  Weierstrass form. The declarations are in `WeierstrassCurve.Affine`.
  - `A` is the étale algebra `K[T]/(f(T))` (an `AdjoinRoot`), and `M` is its group `A×/A×²` of
    square classes (the quotient by the range of `powMonoidHom 2`).
  - `μ` is the `x − T` descent map. `μX_of_eval_f_ne_zero` and `μX_of_eval_f_eq_zero` give its values;
    at a 2-torsion point the value is the corrected representative with `fCofactor`.
  - `ker_μ_eq` states `ker μ = 2E(K)`.
  - `normM` is the norm on square classes, and `range_μ_le_ker_normM` puts the image of `μ` in its
    kernel.
  - `localRes` restricts square classes along a field extension; `localRes_comp_μ` says `μ` commutes
    with it.
  - `localCondition`, `selmerGroup₂` and `mem_selmerGroup₂_iff` define the explicit 2-Selmer group.
  - `card_ker_nsmul_two` states `#E(K)[2] = 1 + #{roots of f in K}`.

### What this layer imports from other stages and roadmaps

- **ST.0.**
  - `ST.0/binary-quartic-form`: the carrier `BinaryQuartic` with `eval`, `map` and the twisted action
    `twistedSMul`.
  - `ST.0/binary-quartic-invariants`: `invI`, `invJ`, `disc`.
  - `ST.0/relative-invariance-of-i-and-j`.
  - `ST.0/quartic-discriminant-is-the-polynomial-discriminant`.
  - `ST.0/invariants-height-and-eligible-pairs`: the invariant map `E_{A,B} ↦ (I, J) = (−3A, −27B)`.
- **Tau Ceti EllipticCurves Layer 6**
  (`tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`). This layer uses
  the built 2-descent listed above. It also makes one request: functoriality of `A`, `M`, `μ`,
  `localRes`, `localCondition` and `selmerGroup₂` under a variable change `x′ = u²x`, `y′ = u³y`. The
  request is needed to move the Selmer group of `E_{2⁴I, 2⁶J}` to `E` in Theorem 3.5, where `u = 6`.
- **Tau Ceti EllipticCurves Layer 7**
  (`tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`). This is requested,
  and only the comparison node uses it. The request covers three things.
  - The identification of `selmerGroup₂` with `Sel₂(E/K) ⊆ H¹(K, E[2])`.
  - `μ` becoming the Kummer map under that identification.
  - The exact sequence `0 → E(K)/2E(K) → Sel₂(E/K) → Ш(E/K)[2] → 0`.
- **Tau Ceti EllipticCurves Layer 8** enters only through ST.0, which uses it for curves ordered by
  height. The parametrization of Theorem 3.5 holds for every integral short model and does not use
  minimality.
- **Tau Ceti GlobalQuadraticForms Layer 5**
  (`tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`). This is requested:
  Hasse–Minkowski for regular ternary forms over a number field, used for the existence half of
  Proposition 3.3.
- **`DiophantineApproximationAndTranscendence:DT.4`.** This is requested: a uniform bound `N` for the
  number of integral solutions of `g(x, y) = 1` over integral binary cubic forms `g` of nonzero
  discriminant. The sources give `N = 12` (Delone–Nagell and Evertse) and `N = 10` (Bennett); any
  uniform `N` suffices.
- **`ClassicalArithmeticCompletion:CA.3`** (the stage edge). No CA.3 node is a prerequisite. The
  discriminants used here come from Mathlib and ST.0. The one normal-form input is completing a
  primitive vector to a matrix in `SL₃` over a PID; it is planned here from Mathlib. Over `ℤ` it also
  follows from `CA.3/smith-normal-form-of-an-integer-matrix`.

### Standing conventions

- **Substitution by the row vector.** `f((x, y)γ)` with `(x, y)γ = (g₀₀x + g₁₀y, g₀₁x + g₁₁y)`.
- **The twisted action on binary cubic forms.** `γ·f = (det γ)⁻¹ f((x, y)γ)`.
  - The action is faithful: the scalar `u` acts as multiplication by `u`.
  - `disc(γ·f) = (det γ)² disc f`.
- **The twisted action on binary quartic forms.** This is ST.0's `γ⋆f = (det γ)⁻² f((x, y)γ)`.
  - The centre acts trivially, so this is an action of `PGL₂`.
  - `I` and `J` are invariants of it.
  - Over `ℤ` the `PGL₂(ℤ)`-orbits are the `GL₂(ℤ)`-orbits under plain substitution.
- **Orientation of index forms (Bhargava–Shankar–Tsimerman).**
  - The index form of a basis `⟨1, b₁, b₂⟩` is defined by `1 ∧ ξ ∧ ξ² = I_b(x, y)·(1 ∧ b₁ ∧ b₂)`
    for `ξ = xb₁ + yb₂`.
  - The normal basis `⟨1, ω, θ⟩` of `R(f)` has the table `ωθ = −ad`, `ω² = −ac − bω + aθ`,
    `θ² = −bd − dω + cθ`, and its index form is `f`.
  - Bhargava's table (2) in HCL III is the table of the basis `⟨1, −ω, −θ⟩`, whose index form is
    `−f`. The two rings are isomorphic through `γ = −1`; only the based data changes sign.
- **Integer-valued ternary quadratic forms.**
  - `Q = Σ_{i≤j} a_ij x_i x_j`. The Gram matrix has `a_ii` on the diagonal and `a_ij/2` off it.
  - `4 Det Q = 4a₁₁a₂₂a₃₃ + a₁₂a₁₃a₂₃ − a₁₁a₂₃² − a₂₂a₁₃² − a₃₃a₁₂²` is integral.
  - `GL₃ × GL₂` acts by `(g₃, g₂)·(A, B) = (rA′ + sB′, tA′ + uB′)`, where `A′ = g₃Ag₃ᵀ`,
    `B′ = g₃Bg₃ᵀ` and `g₂ = (r s; t u)`.
- **The cubic resolvent form of a pair is `4 Det(Ax − By)`.**
  - This corrects the sign of HCL III (26), which prints `Ax + By` (E205).
  - It also restores the factor 4 that Bhargava–Shankar omit on p. 16 (E201).
  - In the orientation above, a based cubic resolvent ring has index form `−4 Det(Ax − By)`.
- **The curve of a pair of invariants.**
  - For invariants `I, J` the curve is `E_{I,J} : y² = x³ − 27Ix − 27J`, with étale algebra
    `A_{I,J} = K[T]/(T³ − 27IT − 27J)` and square classes `M_{I,J}`. These are exactly Tau Ceti's
    `W.A` and `W.M`.
  - Bhargava–Shankar's model `y² = x³ − (I/3)x − J/27` becomes `E_{I,J}` under `x ↦ 9x`, `y ↦ 27y`.
  - For `E_{A,B} : y² = x³ + Ax + B` over `ℤ`, `I = −3A` and `J = −27B`. The curve `E_{2⁴I, 2⁶J}` is
    `y² = x³ + 1296Ax + 46656B`, which is `E_{A,B}` after `x ↦ 36x`, `y ↦ 216y`.
- **Maximality.** A ring `A` that is free of finite rank over `ℤ` is maximal at `p` if no ring `B`
  that is finitely generated over `ℤ` satisfies `A ⊊ B ⊆ A[1/p]`. It is maximal if it is maximal at
  every prime.
- **Solubility.** A form `f` is `K`-soluble if `z² = f(x, y)` has a solution with `(x, y) ≠ (0, 0)`.
  Over a number field, `f` is locally soluble if it is soluble over every completion, finite and
  infinite. An integral form is locally soluble if its rational form is.

### A. Cubic rings

**Binary cubic forms** (`ArithmeticStatistics.BinaryCubicForm R`, node
`ST.1/binary-cubic-forms-and-the-twisted-action`). A form is given by four coefficients `(a, b, c, d)`
and is `f = ax³ + bx²y + cxy² + dy³`.
- Its discriminant is `disc f = b²c² − 4ac³ − 4b³d − 27a²d² + 18abcd`, which is Mathlib's `Cubic.discr`
  of `toCubic f`. For `a = 0` this is `b²(c² − 4bd)`, the discriminant of the binary form and not of a
  quadratic.
- Declarations: `eval`, `scale`, `subst`, the twisted action `instMulAction`, and base change `map`.
- `ofCubic` and `equivCubic` identify the coefficient data with Mathlib's `Cubic R`. They are the
  bridge to the stand-ins of ST.2 and ST.3; the action is not transported to `Cubic`.

API:
- `smul_def`, `eval_smul`, `scalar_smul`.
- `disc_smul` (`disc(γ·f) = (det γ)² disc f`), `disc_scale` (`disc(uf) = u⁴ disc f`).
- `map_smul`, `disc_map`, `disc_eq_discr_toCubic`.

Unit tests:
- `test_disc_xy_x_sub_y`: `disc(x²y − xy²) = 1`.
- `test_scalar_two_twisted`: the scalar 2 sends `f` to `2f`, not `8f`.
- `test_disc_x_cubed`: `disc x³ = 0`.
- `test_swap_action`: `(0 1; 1 0)` sends `(a, b, c, d)` to `(−d, −c, −b, −a)`.

**Cubic rings** (`ArithmeticStatistics.CubicRing`, with `discr`, `IsMaximalAt`, `IsMaximal`; node
`ST.1/cubic-ring`). A cubic `R`-algebra is a commutative `R`-algebra that is free of rank 3; a cubic
ring is a cubic `ℤ`-algebra.
- Its discriminant in a basis is `det(Tr(b_i b_j))`, Mathlib's `Algebra.discr`. It is well defined in
  `R/R×²`, and over `ℤ` it is an integer independent of the basis.
- Maximality is as in the conventions.

API:
- `discr_eq_det_traceMatrix`, `discr_reindex`, `discr_int_eq`.
- `isMaximal_iff_forall_isMaximalAt`, `isMaximal_ringOfIntegers`.

Unit tests:
- `test_discr_pi`: `ℤ³` has discriminant 1.
- `test_discr_cube_root_two`: the power basis of `ℤ[x]/(x³ − 2)` has discriminant `−108`.
- `test_not_isMaximalAt_nilpotent`: `ℤ[x]/(x³)` is not maximal at 2.

- **1 extends to a basis** (`CubicRing.exists_basis_zero_eq_one`,
  `exists_basis_zero_eq_one_of_isLocalRing`; node `ST.1/quotient-by-scalars-is-free`). Over a principal
  ideal domain or a local ring, `A/R·1` is free of rank `n − 1`, so `A` has a basis `⟨1, a₂, …, a_n⟩`.

**The cubic ring of a form** (`BinaryCubicForm.cubicRing`; node
`ST.1/cubic-ring-of-a-binary-cubic-form`).
- `R(f) = R[X₀, X₁]/(X₀X₁ + ad, X₀² + ac + bX₀ − aX₁, X₁² + bd + dX₀ − cX₁)`, with basis `⟨1, ω, θ⟩` and
  the table of the conventions.
- For a normal basis, associativity forces the constants `−ad`, `−ac`, `−bd`.

API:
- The table and basis: `cubicRingIdeal`, `ω`, `θ`, `ω_mul_θ`, `ω_sq`, `θ_sq`, `basis`, `basis_zero`,
  `basis_one`, `basis_two`, `finrank_cubicRing`.
- `cubicRingSmulEquiv`: `R(γ·f) ≅ R(f)`.
- `cubicRingScaleHom` with `cubicRingScaleHom_ω`: `R(nf) ≅ R + nR(f)`.
- `cubicRingMonicEquiv`: for `a = 1`, `R(f) = R[X]/(X³ + bX² + cX + d)`.
- `cubicRingBaseChange`: `S ⊗_R R(f) ≅ R(f_S)`.

Unit tests:
- `test_cubicRing_split`: `R(x²y − xy²) ≅ ℤ³`.
- `test_cubicRing_zero`: for `f = 0` all products of `ω, θ` vanish.
- `test_cubicRing_cube_root`: `R(x³ + 2y³) ≅ ℤ[x]/(x³ + 2)`.
- `test_cubicRing_reducible_zero_divisor`: for `f = y(x² + y²)`, `ωθ = 0` with `ω, θ ≠ 0`.

- **Discriminant** (`BinaryCubicForm.discr_basis`, node `ST.1/discriminant-of-the-cubic-ring-of-a-form`).
  Over every commutative ring, the discriminant of `R(f)` in its normal basis equals `disc f`.

**Index form** (`CubicRing.det3`, `CubicRing.indexForm`; node `ST.1/index-form-of-a-based-cubic-ring`).
- For `b = ⟨1, b₁, b₂⟩`, let `D_b(u, v)` be the determinant of the coordinate vectors of `1, u, v`, and
  set `I_b(x, y) = D_b(ξ, ξ²)`.
- Its coefficients are `(D(b₁, b₁²), D(b₂, b₁²) + 2D(b₁, b₁b₂), 2D(b₂, b₁b₂) + D(b₁, b₂²), D(b₂, b₂²))`.

API:
- `eval_indexForm`.
- `indexForm_translate`: the index form depends only on the images of `b₁, b₂` in `A/R`.
- `indexForm_eq_smul`: changing the basis of `A/R` by `γ` replaces `I_b` by the twisted `γ·I_b`.
- `indexForm_cubicRing_basis`: the normal basis of `R(f)` has index form `f`.
- `index_adjoin_eq_natAbs_indexForm`: `[A : ℤ[mb₁ + nb₂]] = |I_b(m, n)|` when this is nonzero.

Unit tests:
- `test_indexForm_pi`: the basis `⟨1, e₀, e₁⟩` of `ℤ³` has index form `xy² − x²y`.
- `test_indexForm_cube_root`: the normal basis of `R(x³ + 2y³)` has index form `x³ + 2y³`.
- `test_indexForm_negate_basis`: `⟨1, −b₁, −b₂⟩` has index form `−I_b`.

- **Normal bases** (`CubicRing.exists_normal_translate`, `mul_table_of_normal`; node
  `ST.1/normal-bases-of-a-cubic-ring`). There are unique translates `b₁ + r`, `b₂ + s` whose product
  lies in `R`. In such a basis with index form `(a, b, c, d)` the multiplication table is that of
  `R(f)`.

**Delone–Faddeev** (`BinaryCubicForm.deloneFaddeev_exists`, `deloneFaddeev_iso_iff`, and their forms
`_of_isLocalRing`; node `ST.1/delone-faddeev-parametrization-of-cubic-rings`, planet *Delone–Faddeev
correspondence*). Let `R` be a principal ideal domain or a local ring, for example `ℤ`, `ℤ_p`, `ℚ`,
`ℚ_p`, `ℝ` or `𝔽_p`.
- Every cubic `R`-algebra is `R(f)`, where `f` is the index form of any basis `⟨1, b₁, b₂⟩`.
- `R(f) ≅ R(g)` if and only if `g = γ·f` for some `γ ∈ GL₂(R)`.
- Discriminants agree.

The proof follows Gan–Gross–Savin §4 and Gross–Lucianovic Proposition 2.1:
1. 1 extends to a basis.
2. Pass to the normal translate.
3. The table is forced by associativity.
4. Index forms move by the twisted action.

Three consequences are separate nodes.
- **Stabilizers** (`BinaryCubicForm.nonempty_algEquiv_equiv_stabilizer`, node
  `ST.1/automorphisms-of-cubic-rings-are-stabilizers`; BST Proposition 12). `Aut_R R(f) ≅ Stab_{GL₂(R)}(f)`.
- **The reducible locus** (`BinaryCubicForm.isDomain_cubicRing_iff`, `isField_cubicRing_iff`; node
  `ST.1/reducible-forms-and-zero-divisors`; BST Proposition 11).
  - For a nonzero integral `f`, `R(f)` is a domain if and only if `f` has no zero in `ℤ² ∖ {0}`, that
    is, if and only if `f` is irreducible over `ℚ`.
  - Over a field `K`, `R(f)` is a field if and only if `f ≠ 0` and `f` has no zero in `ℙ¹(K)`.
- **The degenerate locus** (`BinaryCubicForm.etale_iff_disc_ne_zero`, node
  `ST.1/nondegenerate-forms-and-etale-cubic-algebras`).
  - Over a field, `R(f)` is étale if and only if `disc f ≠ 0`.
  - Over `ℤ`, `disc f ≠ 0` if and only if `R(f) ⊗ ℚ` is a product of number fields.

**Davenport–Heilbronn sets** (`BinaryCubicForm.U`; node `ST.1/davenport-heilbronn-sets`). `f ∈ U_p` if
both of the following hold:
- `f ≢ 0 (mod p)`;
- no `GL₂(ℤ)`-translate of `f` has `p² ∣ a` and `p ∣ b`.

API:
- `mem_U_iff`.
- `smul_mem_U`: `U_p` is invariant.
- `mem_U_of_modEq`: membership depends only on `f mod p²`.
- `mem_U_of_not_dvd_disc`: `p² ∤ disc f` implies `f ∈ U_p`.

Unit tests:
- `test_U_cube_root_two`: `x³ + 2y³ ∈ U₃`.
- `test_not_mem_U_x3_add_y3`: `x³ + y³ ∉ U₃`, although `3 ∤ f`. After `y ↦ y − x` it becomes
  `3x²y − 3xy² + y³`.
- `test_zero_not_mem_U`.

- **Small overrings** (`BinaryCubicForm.exists_smul_of_not_isMaximalAt`, node
  `ST.1/nonmaximal-cubic-rings-have-small-overrings`; BST Lemma 13). If `R(f)` is not maximal at `p`,
  then either `ℤ + ℤ(ω/p) + ℤθ` or `ℤ + ℤ(ω/p) + ℤ(θ/p)` is a ring for some basis. In terms of the form:
  either `p ∣ f`, or some translate of `f` has `p² ∣ a` and `p ∣ b`.
- **The maximality criterion** (`BinaryCubicForm.isMaximalAt_iff_mem_U`, `isMaximal_iff_forall_mem_U`;
  node `ST.1/davenport-heilbronn-maximality-criterion`, planet *Davenport–Heilbronn maximality
  criterion*; BST Theorem 14). `R(f)` is maximal at `p` if and only if `f ∈ U_p`. ST.3 owns the
  identification of maximal cubic domains with rings of integers
  (`ST.3/maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields`).
- **Index-`p` subrings** (`BinaryCubicForm.numZerosMod`, `ncard_subrings_index_p`; node
  `ST.1/index-p-subrings-of-a-cubic-ring`; BST Proposition 15). Their number is the number of zeros of
  `f mod p` in `ℙ¹(𝔽_p)`, which is `p + 1` if `f ≡ 0`.
- **Index-`p` overrings** (`BinaryCubicForm.numLiftableDoubleZeros`, `ncard_overrings_index_p`; node
  `ST.1/index-p-overrings-of-a-cubic-ring`; BST Proposition 16). The rings `B` with
  `R(f) ⊂ B ⊆ R(f)[1/p]` and `[B : R(f)] = p` correspond to the zeros `α` of `f mod p` such that
  `f(α′) ≡ 0 (mod p²)` for every lift `α′`. These are double zeros.

### B. Quartic rings

**Pairs of ternary quadratic forms** (`ArithmeticStatistics.TernaryQuadraticForm`,
`TernaryQuadraticPair`; node `ST.1/pairs-of-ternary-quadratic-forms`).
- A form has six coefficients `a₁₁, a₂₂, a₃₃, a₁₂, a₁₃, a₂₃`, with `eval`, `det4`, the substitution
  `comp` (`Q ∘ Mᵀ`, Gram matrix `MGMᵀ`) and `lincomb`.
- `toQuadraticForm` (with `toQuadraticForm_apply`) is the bridge to Mathlib's `QuadraticForm`.
- A pair `(A, B)` is an element of `W(R)`. `GL₃(R) × GL₂(R)` acts on pairs by `instMulAction`.
- `resolventForm` is the binary cubic form `4 Det(Ax − By)`, and `disc` is its discriminant.
- `coeffA` and `coeffB` give the coefficients of `A` and `B`.
- `lam` gives the fifteen invariants `λ^{ij}_{kl} = a_ij b_kl − a_kl b_ij`, and `content` is their gcd.
- Transformation law: the resolvent form of `g·(A, B)` is `(det g₃)²` times the resolvent form of
  `(A, B)` substituted by `(r −s; −t u)`.

API:
- `det4_comp`: `4 Det(Q ∘ Mᵀ) = (det M)²·4 Det Q`.
- `resolventForm_A_eq`: the `x³`-coefficient of the resolvent form is `4 Det A`.
- `disc_smul`: `Disc(g·(A, B)) = (det g₃)⁸(det g₂)⁶ Disc(A, B)`.
- `lam_smul_SL2`: the `λ`s are `SL₂`-invariant.
- `lam_eq_zero_iff`: all `λ` vanish if and only if `A, B` span a space of dimension at most 1.

Unit tests:
- `test_resolventForm_veronese`: `(x₁x₃ − x₂², ax₁² + bx₁x₂ + cx₂² + dx₂x₃ + ex₃²)` has resolvent form
  `(1, c, bd − 4ae, ad² + b²e − 4ace)`.
- `test_det4_sum_of_squares`: `4 Det(x₁² + x₂² + x₃²) = 4`.
- `test_disc_proportional`: `(Q, Q)` has discriminant 0.

**Quartic rings and cubic resolvents** (`ArithmeticStatistics.QuarticRing`, with `coords`,
`IsResolventPair`, `HasCubicResolvent`, `ringContent`; node `ST.1/quartic-ring-and-cubic-resolvent`).
- A quartic ring is a commutative ring that is free of rank 4 over `ℤ`.
- A cubic resolvent (HCL III Definitions 19–20) is a cubic ring `C` with an isomorphism
  `∧³(Q/ℤ) → ∧²(C/ℤ)` and a quadratic map `φ : Q/ℤ → C/ℤ` satisfying two identities:
  - (29): `x ∧ y ∧ xy ↦ φ(x) ∧ φ(y)`;
  - (34): `C` corresponds to `Disc(φ)` under Delone–Faddeev.
- In bases, with `φ(Σ tᵢαᵢ) = B(t)ω₁ + A(t)ω₂`, the data is a pair `(A, B)`, and the two conditions
  read:
  - `det(1, x, y, xy) = B(x)A(y) − A(x)B(y)`;
  - the index form of `⟨1, ω₁, ω₂⟩` is `−4 Det(Ax − By)`.
- The content `ct(Q)` is the largest `n` with `Q = ℤ + nQ′`.

API:
- `isResolventPair_smul`: changing bases realizes every translate of the pair.
- `discr_eq_of_isResolventPair`: `Disc Q = Disc C = Disc(A, B)`.

Unit tests:
- `test_split_has_resolvent`: `ℤ⁴` has the cubic resolvent `ℤ³`.
- `test_resolvent_disc_sign`: the index form of a based resolvent is not `+4 Det(Ax − By)` when that
  form is nonzero.
- `test_ringContent_int_pi`: `ℤ⁴` has content 1.

**The quartic ring of a pair** (`TernaryQuadraticPair.structConst`, `quarticRing`, `quarticBasis`,
`cubicResolventRing`; node `ST.1/quartic-ring-of-a-pair`). `Q(A, B)` has basis `⟨1, α₁, α₂, α₃⟩` and
`αᵢαⱼ = c⁰ᵢⱼ + Σ_k c^k_ij α_k`, where the constants are given by HCL III (21)–(23).
- For each permutation `(i, j, k)` of `(1, 2, 3)` with sign `ε`:
  - `c^i_ii = ελ^{ik}_{ij} + C_i` and `c^j_ii = ελ^{ii}_{ik}`;
  - `c^i_ij = ½(ελ^{ik}_{jj} + C_j)` and `c^k_ij = ελ^{jj}_{ii}`;
  - here `C₁ = λ^{23}_{11}`, `C₂ = −λ^{13}_{22}` and `C₃ = λ^{12}_{33}`.
- The constant terms are `c⁰ᵢⱼ = Σ_r (c^r_jk c^k_ri − c^r_ij c^k_rk)` for any `k ≠ i`. The source
  prints `k ≠ j`; see E204.
- All constants are integral polynomials in the coefficients: the halves cancel.
- The basis is normal: `c¹₁₂ = c²₁₂ = c¹₁₃ = 0`.
- The resolvent ring is `R(A, B) = R(−4 Det(Ax − By))`. The triple is a based cubic resolvent, and
  `Disc Q(A, B) = Disc(A, B)`.

API: `quarticRingIdeal`, `quarticBasis_zero`, `mul_quarticBasis`, `structConst_normal`,
`discr_quarticBasis`, `isResolventPair_quarticRing`.

Unit tests:
- `test_structConst_zero_pair`: every constant vanishes for `(0, 0)`.
- `test_quarticRing_disc`: for `(x₁x₃ − x₂², x₁² + x₂x₃)`, `Algebra.discr` of the normal basis equals
  `Disc(A, B)`.
- `test_structConst_integral_c311`: `c¹₁₁ = λ^{13}_{12} + λ^{23}_{11}`.

- **Bhargava's parametrization** (`QuarticRing.exists_isResolventPair`, `isResolventPair_unique`,
  `isResolventPair_iff_smul`; node `ST.1/bhargava-parametrization-of-quartic-rings`, planet
  *Parametrization of quartic rings*; HCL III Theorem 1). There is a canonical bijection between
  `GL₃(ℤ) × GL₂(ℤ)`-orbits on `W(ℤ)` and isomorphism classes of pairs `(Q, R)`, where `Q` is a quartic
  ring and `R` a cubic resolvent of `Q`. It preserves discriminants. In based form:
  - every pair is the resolvent pair of a based quartic ring with a cubic resolvent;
  - that based ring and resolvent are unique up to based isomorphism;
  - changing bases realizes exactly the orbit.
- **Existence and number of resolvents** (`QuarticRing.exists_hasCubicResolvent`,
  `cubicResolvent_unique_of_content_eq_one`; node `ST.1/existence-and-number-of-cubic-resolvents`; HCL
  III Corollaries 4–5).
  - Every quartic ring has a cubic resolvent.
  - The number of resolvents is `σ(ct Q)`.
  - A primitive quartic ring has exactly one resolvent. In particular this holds for every maximal
    quartic ring and every ring of integers of a quartic field.
  - Two pairs give the same quartic ring if and only if they are related by `GL₃(ℤ) × GL₂^{±1}(ℚ)`.
- **Maximality at `p`** (`QuarticRing.exists_smul_of_not_isMaximalAt`, node
  `ST.1/maximality-of-quartic-rings-at-p`; HCL III Lemma 22). If `Q(A, B)` is not maximal at `p`, then
  after a change of basis one of three conditions holds:
  - (i) `λ^{11}_{22}, λ^{11}_{23}, λ^{11}_{33}, λ^{12}_{13} ≡ 0 (mod p)` and
    `λ^{11}_{12}, λ^{11}_{13} ≡ 0 (mod p²)`;
  - (ii) `λ^{11}_{13}, λ^{11}_{23}, λ^{12}_{13}, λ^{12}_{23}, λ^{13}_{22}, λ^{22}_{23} ≡ 0 (mod p)` and
    `λ^{11}_{12}, λ^{11}_{22}, λ^{12}_{22} ≡ 0 (mod p²)`;
  - (iii) all `λ ≡ 0 (mod p)`.

  `U_p` is the set of pairs for which none of these can be achieved; it is defined modulo `p²`.
- **Splitting types** (`QuarticRing.etale_quarticRing_mod_p`, node
  `ST.1/splitting-types-of-pairs-of-ternary-quadratic-forms`; HCL III (36)–(37)).
  - The symbol `((A, B), p)` records the residue degrees and multiplicities of the four intersection
    points of the two conics over `𝔽̄_p`.
  - It determines `Q(A, B)/p`, except that for the symbol `(1⁴)` the quotient can also be one of
    three further algebras (HCL III (37)).
  - `Disc(A, B) ≢ 0 (mod p)` if and only if the conics meet in four distinct points, if and only if
    `Q(A, B)/p` is étale.

### C. Quintic rings (statement level)

**Quadruples of quinary alternating forms** (`ArithmeticStatistics.QuinaryAlternatingQuadruple`; node
`ST.1/quadruples-of-quinary-alternating-forms`).
- `V(R) = R⁴ ⊗ ∧²R⁵` is the space of quadruples of alternating `5 × 5` matrices, stored by their upper
  entries. `toMatrix` and `ofMatrices` convert to and from matrices.
- `GL₄(R) × SL₅(R)` acts by `(g₄, g₅)·A = (Σ_s (g₄)_{rs} g₅A_s g₅ᵀ)_r` (`instMulAction`).
- The sub-Pfaffian covariant `subPfaffian` is `Q_i(X) = (−1)^{i−1} Pf(X without row and column i)`.
- The invariants `{ijklm}` give the multiplication table of the quintic ring `R(A)`. The unique
  invariant of the group is the degree-40 discriminant.

API:
- `toMatrix_transpose`: each matrix is alternating.
- `subPfaffian_smul_scalar`: `Q(cX) = c²Q(X)`.
- `mulVec_subPfaffian`: `X·Q(X) = 0`.

Unit tests:
- `test_toMatrix_diag`: the diagonal is zero.
- `test_ofMatrices_toMatrix`: `ofMatrices (toMatrix A) = A`.
- `test_subPfaffian_standard`: the matrix with `x₁₂ = x₃₄ = 1` (0-indexed) has sub-Pfaffian vector
  `(1, 0, 0, 0, 0)`.

- **Bhargava's parametrization** (node `ST.1/bhargava-parametrization-of-quintic-rings`, planet
  *Parametrization of quintic rings*; HCL IV Theorems 1, 8, 9 and 17, Corollaries 18–19).
  - There is a canonical bijection between `GL₄(ℤ) × SL₅(ℤ)`-orbits on `V(ℤ)` and pairs `(R, S)`, where
    `R` is a quintic ring and `S` a sextic resolvent (HCL IV Definitions 10–11).
  - For nondegenerate pairs, `Disc A = Disc R = Disc(S)^{1/3}/16`.
  - Every quintic ring arises, so every quintic ring has a sextic resolvent.
  - A maximal quintic ring has exactly one sextic resolvent.
  - Cayley's resolvent map is 4 times the sub-Pfaffian covariant.
- **Maximality** (node `ST.1/maximality-of-quintic-rings-at-p`; HCL IV Theorem 21).
  - `R(A)` is maximal if and only if `A ∈ U_p` for every `p`.
  - `U_p` is the union of the seventeen sets `U_p(σ)`, each defined modulo `p²`.
  - `R(A)` is maximal exactly when `A` is a minimal integral model.

The Lean fragment gives no signatures for the last two nodes: their statements need the
multiplication tables of `R(A)` and `S(A)` (HCL IV §§4 and 6), which are specified here in prose.

### D. Binary quartic forms and 2-Selmer elements

**Orbits and stabilizers** (`BinaryQuartic.instPGLAction`, `PGLOrbit`, `PGLOrbit.invariants`; node
`ST.1/pgl2-orbits-and-stabilizers-of-binary-quartic-forms`). ST.0's twisted action induces an action
of `PGL(2, R)`, Mathlib's `Matrix.ProjGenLinGroup`. The map `(I, J)` is constant on orbits. The
stabilizer `Stab_{PGL₂(R)}(f)` is Mathlib's `MulAction.stabilizer`.

API:
- `pgl_smul_mk`, `invI_pgl_smul`, `invJ_pgl_smul`.
- `pgl_orbits_eq_gl_orbits_int`.

Unit tests:
- `test_pgl_scalar_trivial`.
- `test_pgl_diag`: `diag(2, 1)` sends `(a, b, c, d, e)` to `(4a, 2b, c, d/2, e/4)`.
- `test_neg_not_equivalent`: `x³y − y⁴` and its negative have the same `I` but opposite `J = ±27`.

**Solubility** (`BinaryQuartic.IsSoluble`, `IsEverywhereLocallySoluble`, `IsLocallySolubleQ`,
`IsLocallySoluble`, `HasRationalLinearFactor`, `IsIrreducibleOverQ`; node
`ST.1/soluble-binary-quartic-forms`).
- The finite completions are Mathlib's `adicCompletion` at the height-one primes of `𝓞_K`. The
  infinite completions are `InfinitePlace.Completion`.
- The reducible locus consists of the integral forms with a zero in `ℙ¹(ℚ)`.
- These names and definitions coincide with the stand-ins of ST.4.

API:
- `isLocallySoluble_iff`, `isLocallySolubleQ_iff`.
- `isSoluble_pgl_smul`, `IsSoluble.map`.
- `isSoluble_of_eval_eq_zero`, `isSoluble_of_isSquare_a`.

Unit tests:
- `test_negative_definite_insoluble`: `−x⁴ − y⁴` is not `ℝ`-soluble.
- `test_linear_factor_soluble`: `x³y + y⁴` is soluble.
- `test_locally_not_globally`: Lind–Reichardt's `2x⁴ − 34y⁴` is locally soluble but not `ℚ`-soluble.
- `test_hasRationalLinearFactor`.

**Covariants** (`BinaryQuartic.hessian`, `sexticCoeff`, `sextic`; node
`ST.1/covariants-of-a-binary-quartic`).
- `g₄ = (3b² − 8ac)X⁴ + 4(bc − 6ad)X³Y + 2(2c² − 24ae − 3bd)X²Y² + 4(cd − 6be)XY³ + (3d² − 8ce)Y⁴`. Where 3 is
  invertible this is `−⅓` times the Hessian determinant.
- `g₆` is the sextic covariant of Cremona–Fisher, with leading coefficient `b³ + 8a²d − 4abc`. Its
  seven coefficients are written out in the node.

API:
- `hessian_twistedSMul`: equivariance under the twisted action.
- `sextic_twistedSMul`: the factor `(det γ)⁻³`.
- `hessian_eq_neg_third_hessianDet`.

Unit tests:
- `test_hessian_x3y`: `g₄(x³y) = 3x⁴`.
- `test_sextic_x3y`: `g₆(x³y) = x⁶`.
- `test_hessian_resultant`: `g₄ = 48` at the root `(1, 1)` of `x⁴ − y⁴`.

- **Syzygy** (`BinaryQuartic.syzygy`, node `ST.1/syzygy-of-binary-quartic-covariants`).
  `27g₆² = g₄³ − 48Ig²g₄ − 64Jg³` over every commutative ring.

**The cubic invariant** (`BinaryQuartic.cubicInvariant`; node
`ST.1/cubic-invariant-of-a-binary-quartic`). Let `K` be a field of characteristic not 2 or 3, and let
`4I³ − J² ≠ 0`.
- Put `φ = −T/3`, a root of `X³ − 3IX + J` in `A_{I,J}`, and `G(x, y) = (4φg(x, y) + g₄(x, y))/3`.
- `N(G) = g₆²`, and `G(x, y)` is a unit whenever `g₆(x, y) ≠ 0`.
- `z(g) = [G(x, y)] ∈ M_{I,J}` does not depend on the choice of such a point. Such points exist
  unless `K = 𝔽₅`.

Declarations: `curveIJ`, `etaleAlgebra` and `squareClasses`, spelled exactly as Tau Ceti's `W.A` and
`W.M`, together with `curvePoly`, `restrictSquareClasses` and `irrationalCovariant`.

API:
- `cubicInvariant_eq_mk`, `isUnit_irrationalCovariant`, `norm_irrationalCovariant`.
- `exists_sextic_ne_zero`.
- `cubicInvariant_map`: compatibility with restriction, which is Tau Ceti's `localRes`.

Unit tests:
- `test_cubicInvariant_x3y`: `z(x³y − xy³) = 1` in `M_{3,0}`.
- `test_irrationalCovariant_leading`: `G(1, 0) = (3b² − 8ac)/3 − (4a/9)T`.
- `test_norm_square`: `N(G(1, 2)) = g₆(1, 2)²` for `x⁴ − y⁴`.

The following nodes follow Cremona–Fisher §§3–5.
- **Orbit invariance** (`BinaryQuartic.cubicInvariant_pgl_smul`, node
  `ST.1/cubic-invariant-is-an-orbit-invariant`). `z(γ⋆g) = z(g)`.
- **Linear factors** (`BinaryQuartic.linearFactorForm`, `cubicInvariant_eq_one_iff`,
  `exists_pgl_smul_linearFactorForm`; node `ST.1/linear-factor-forms`).
  - `z(g) = 1` if and only if `g` has a zero in `ℙ¹(K)`.
  - Every such `g` is equivalent to `q₀ = X³Y − (I/3)XY³ − (J/27)Y⁴`.
- **Equal invariants give a root** (`BinaryQuartic.exists_root_of_cubicInvariant_eq`, node
  `ST.1/auxiliary-quartic-root-from-equal-cubic-invariants`). If `z(g₁) = z(g₂)`, then the quartic
  `p₁g₂ − a₁h₂` has a zero in `ℙ¹(K)`. Here `a₁ = g₁(1, 0)`, `p₁ = g₁,₄(1, 0)`, and `h₂` is the
  quartic covariant of `g₂`.
- **The root gives the equivalence** (`BinaryQuartic.exists_pgl_smul_of_comparison_root`, node
  `ST.1/linear-factor-of-the-comparison-quartic-gives-equivalence`).
- **The cubic invariant determines the orbit** (`BinaryQuartic.cubicInvariant_eq_iff`, node
  `ST.1/cubic-invariant-determines-the-orbit`; Cremona–Fisher Theorem 11). For `K ≠ 𝔽₅` and forms with
  the same invariants, `z(g₁) = z(g₂)` if and only if `g₁` and `g₂` are `PGL₂(K)`-equivalent.
- **Bilinear factors** (`BinaryQuartic.exists_pgl_smul_iff_bilinear_factor`, node
  `ST.1/bilinear-factor-criterion-for-proper-equivalence`; Cremona–Fisher Theorem 12).
  - Equivalences correspond to the rational bilinear factors of `g₁(X₁, Y₁)h₂(X₂, Y₂) − g₂(X₂, Y₂)h₁(X₁, Y₁)`.
  - For `g₁ = g₂` the three factors besides `X₁Y₂ − Y₁X₂` are indexed by the roots of `X³ − 3IX + J`.

**The quartic of a point** (`BinaryQuartic.quarticOfPoint`; node `ST.1/quartic-of-a-point`).
- `q(O) = q₀`.
- For `P = (ξ, η)`, `q(P) = X⁴ − (ξ/6)X²Y² − (η/27)XY³ + ((36I − ξ²)/432)Y⁴`.
- `q(P)` has invariants `I, J`. It is soluble: it has leading coefficient 1, or the factor `Y`.
- `q(−P) ∼ q(P)`.
- In Bhargava–Shankar's normalization this is their quartic, up to `PGL₂(K)`.

API: `invI_quarticOfPoint`, `invJ_quarticOfPoint`, `isSoluble_quarticOfPoint`, `quarticOfPoint_neg`.

Unit tests:
- `test_quarticOfPoint_zero`.
- `test_quarticOfPoint_invariants`: on `y² = x³ − 27x`, `q((0, 0)) = X⁴ + Y⁴/12`, with `I = 1` and `J = 0`.
- `test_quarticOfPoint_leading_square`.

- **`z ∘ q = μ`** (`BinaryQuartic.cubicInvariant_quarticOfPoint`, node
  `ST.1/cubic-invariant-of-the-quartic-of-a-point`). `z(q(P))` is Tau Ceti's `μ(P)`:
  - the class of `ξ − T` when `η ≠ 0`;
  - the corrected representative at 2-torsion points;
  - `1` at `O`.
- **Theorem 3.2, first half** (`BinaryQuartic.quarticOfPoint_orbit_eq_iff`,
  `exists_quarticOfPoint_of_isSoluble`; node `ST.1/binary-quartic-parametrization-of-e-mod-2e`).
  - `P ↦ PGL₂(K)·q(P)` is a bijection from `E_{I,J}(K)/2E_{I,J}(K)` onto the orbits of `K`-soluble forms
    with invariants `I, J`.
  - The identity corresponds to the forms with a linear factor.
  - The proof uses: `z` determines the orbit, `z ∘ q = μ`, and `ker μ = 2E(K)` (Tau Ceti).
- **Theorem 3.2, second half** (`BinaryQuartic.nonempty_stabilizer_equiv_twoTorsion`,
  `card_stabilizer_real`, `card_stabilizer_real_of_neg`; node
  `ST.1/stabilizer-of-a-binary-quartic-is-two-torsion`).
  - For every `f` with `4I³ − J² ≠ 0`, soluble or not, `Stab_{PGL₂(K)}(f) ≅ E_{I,J}(K)[2]`.
  - This group has order `1 + #{roots of X³ − 3IX + J in K}`.
  - Over `ℝ` the order is 4 if `Δ > 0` and 2 if `Δ < 0`.
- **The image of `z`** (`BinaryQuartic.conicValue`, `exists_cubicInvariant_eq_iff`,
  `invariants_simonQuartic`; node `ST.1/image-of-the-cubic-invariant`; Cremona–Fisher Theorem 13). For
  `m` of square norm the following are equivalent:
  - `m` is a cubic invariant;
  - `m` has a representative `u + vφ` that is linear in `T`;
  - the conic `Q_m(t)` has a nontrivial zero. Here `Q_m(t)` is the `T²`-coefficient of
    `m(t₀ + t₁T + t₂T²)²`, and it is regular.

  Simon's quartic `(1/12v)(X⁴ − 6uX²Y² + 8rXY³ + (12Iv² − 3u²)Y⁴)` with `r² = u³ − 3Iuv² − Jv³` realizes
  `u + vφ`.
- **Proposition 3.3** (`BinaryQuartic.cubicInvariant_injective_locallySoluble`,
  `exists_locallySoluble_of_local`; node `ST.1/locally-soluble-quartics-and-the-two-selmer-group`).
  - Let `K` be a number field. `z` is a bijection from the `PGL₂(K)`-orbits of everywhere locally
    soluble forms with invariants `I, J` onto Tau Ceti's `selmerGroup₂` of `E_{I,J}`. This is taken
    relative to `𝓞_K` and the completions at the infinite places, and the linear-factor orbit maps to
    1.
  - Injectivity is Cremona–Fisher over `K`.
  - Surjectivity combines local solubility at every place with the conic criterion and Hasse–Minkowski
    (GlobalQuadraticForms Layer 5).
  - The Lean fragment states the two halves in Mathlib-only form. The Tau Ceti target is named in the
    docstrings.

**Integral representatives**, following the Cremona–Fisher–Stoll projection argument.
- **Primitive vectors** (`exists_SL3_col_eq`, node `ST.1/primitive-vectors-extend-to-special-linear-matrices`).
  Over a principal ideal domain, a primitive vector is a column of a matrix in `SL₃`.
- **Ternary cubics** (`ArithmeticStatistics.TernaryCubicForm`; node
  `ST.1/ternary-cubic-forms-and-their-invariants`).
  - Ten coefficients `a, b, c, a₂, a₃, b₁, b₃, c₁, c₂, m`, in Fisher's coordinates.
  - `c₄` (25 terms) and `c₆` (103 terms) are normalized by Fisher's Hessian identity.
  - For the Weierstrass cubic `y²z − x³ − Axz² − Bz³` (`weierstrass`), `c₄ = −48A` and `c₆ = −864B`.
  - `1728 ∣ c₄³ − c₆²`.

  API: `eval`, `comp`, `eval_comp`, `c4_weierstrass`, `c6_weierstrass`, `c4_cube_sub_c6_sq`.

  Unit tests:
  - `test_c4_fermat`: `c₄(x³ + y³ + z³) = 0`.
  - `test_c6_fermat`: `c₆(x³ + y³ + z³) = 5832`.
  - `test_c4_weierstrass_value`: `c₄(y²z − x³ + xz²) = 48`, which pins the sign.
- **Invariance** (`TernaryCubicForm.c4_comp`, `c6_comp`; node
  `ST.1/invariance-of-ternary-cubic-invariants`). `c₄(U ∘ M) = (det M)⁴c₄(U)` and
  `c₆(U ∘ M) = (det M)⁶c₆(U)`.
- **Projection from `(0 : 1 : 0)`** (`TernaryCubicForm.projectionQuartic`; node
  `ST.1/projection-of-a-plane-cubic-from-a-rational-point`).
  - For `U = f₁y² − f₂y − f₃` (that is, `b = 0`), `F_U = f₂² + 4f₁f₃`. It is integral when `U` is.
  - `I(F_U) = c₄(U)` and `J(F_U) = 2c₆(U)`.
  - For the Weierstrass cubic, `F = 4(x³z + Axz³ + Bz⁴)`, with invariants `(−48A, −1728B) = (2⁴I, 2⁶J)`.

  API: `invI_projectionQuartic`, `invJ_projectionQuartic`, `projectionQuartic_eval`.

  Unit tests:
  - `test_projection_weierstrass_origin`.
  - `test_projection_invariants_numeric`: for `A = −7` and `B = 10`, `I = 336` and `J = −17280`.
  - `test_projection_integral`.
- **The projected quartic of a point** (`TernaryCubicForm.cubicInvariant_projectionQuartic`, node
  `ST.1/cubic-invariant-of-the-projected-quartic`). If row 1 of `M ∈ SL₃(K)` is `(ξ, η, 1)`, the
  projected quartic of `weierstrass A B ∘ M` has these properties:
  - its invariants are `(−48A, −1728B)`;
  - its cubic invariant is the class of `36ξ − T`, which is `μ` of the image `(36ξ, 216η)` of `P` on
    `E_{−48A, −1728B}`.
- **Local integrality** (`BinaryQuartic.exists_padic_integral_representative`, node
  `ST.1/local-integral-representatives-of-soluble-quartics`). Every `ℚ_p`-soluble form with invariants
  `(−48A, −1728B)`, where `A, B ∈ ℤ_p`, has a `ℤ_p`-integral representative. The proof uses
  Theorem 3.2 over `ℚ_p`, a primitive `P`, and the projected quartic.
- **Local to global** (`BinaryQuartic.exists_integral_of_forall_padic`, node
  `ST.1/integrality-from-local-integrality`). Local integral representatives at every `p` give a
  global integral representative.
- **Lemma 3.4** (`BinaryQuartic.exists_integral_representative`, node
  `ST.1/integral-representatives-of-locally-soluble-quartics`). Let `f` be a locally soluble rational
  form with integral invariants, `2⁴·3 ∣ I`, `2⁶·3³ ∣ J` and `4I³ − J² ≠ 0`. Then `f` is
  `PGL₂(ℚ)`-equivalent to an integral form.

**Theorem 3.5** (`BinaryQuartic.twoSelmer_parametrization`; node
`ST.1/binary-quartic-parametrization-of-two-selmer`, planet *Binary quartic parametrization of
2-Selmer elements*). Let `E = E_{A,B}` with `A, B ∈ ℤ`, `4A³ + 27B² ≠ 0`, and `(I, J) = (−3A, −27B)`.
- The 2-Selmer elements of `E` correspond to the `PGL₂(ℚ)`-classes of locally soluble integral forms
  with invariants `2⁴I = −48A` and `2⁶J = −1728B`.
- The class of `g` maps to `z(g)`, an element of `selmerGroup₂` of `E_{2⁴I, 2⁶J}`. This is transported
  to `E` by the variable change with `u = 6`, which is the Layer 6 request.
- The forms with a rational linear factor form one class, the identity.
- Every stabilizer is `E(ℚ)[2]`.
- The Lean fragment states this in Mathlib-only form: integral representatives exist, and `z` is
  injective on these classes.

**Comparison with the cohomological Selmer group** (node
`ST.1/comparison-with-the-cohomological-two-selmer-group`, comparison).
- Composing Proposition 3.3 with the Layer 7 identification `selmerGroup₂ ≅ Sel₂(E/K)` gives a
  bijection onto `Sel₂(E/K)`.
- Under it `q(P)` maps to the Kummer image `δ(P)` and the linear-factor class maps to 0.
- The `K`-soluble classes are exactly the image of `E(K)/2E(K)`.
- The locally soluble classes without `K`-points map onto `Ш(E/K)[2] ∖ {0}`.
- This node is stated in this document only; the Lean fragment has no signature for it because it
  needs the Layer 7 objects.

### E. The embedding into pairs of ternary quadratic forms

**The embedding** (`BinaryQuartic.veroneseForm`, `embed`, `rho`, `slice`; node
`ST.1/embedding-into-pairs-of-ternary-quadratic-forms`, planet *Embedding into pairs of ternary
quadratic forms*; Bhargava–Shankar (30)–(32)).
- `A₁ = x₁x₃ − x₂²` (Gram matrix `antidiag(½, −1, ½)`) and
  `B_f = ax₁² + bx₁x₂ + cx₂² + dx₂x₃ + ex₃²`. Then `φ(f) = (A₁, B_f)`.
- `φ` is injective, and its image is `{(A₁, B) : B₁₃ = 0}`.
- Let `F_{ℤ,1}` be the lower unitriangular matrices of `GL₂(ℤ)`, acting by `B ↦ B + rA₁`. Every
  `F_{ℤ,1}`-class of the slice meets the image exactly once.
- `4 Det(A₁x − B_f y) = x³ + cx²y + (bd − 4ae)xy² + (ad² + b²e − 4ace)y³` is the monic cubic resolvent,
  with the same `I` and `J`.
- `ρ(γ) ∈ SL₃(ℤ)` preserves `A₁`, and `φ(γ·f) = ρ(γ)·φ(f)` modulo `F_{ℤ,1}`, with `ρ` corrected as in
  E203.

API: `embed_injective`, `mem_range_embed_iff`, `exists_unique_normalized`, `disc_embed`,
`resolventForm_embed`, `rho_det`, `veroneseForm_comp_rho`, `embed_smul`, `unipotentT`.

Unit tests:
- `test_embed_x3y`: `φ(x³y)` has resolvent form `x³`.
- `test_rho_T`: `ρ(1 1; 0 1) = (1 1 1; 0 1 2; 0 0 1)`.
- `test_rho_equivariance_T`: the `x₁²`-coefficient of `ρ(T)·B_{y⁴}` equals that of `B_{(x+y)⁴}`,
  namely 1. The printed order of (31) gives 0.

- **`SO(A₁, ℤ)`** (`BinaryQuartic.range_rho`, node `ST.1/special-orthogonal-group-of-the-veronese-form`).
  An element of `SL₃(ℤ)` preserves `A₁` if and only if it is `ρ(γ)`. The kernel of `ρ` is `{±1}`, so
  `PGL₂(ℤ) ≅ SO(A₁, ℤ)`.
- **Theorem 2.14** (`BinaryQuartic.embed_orbit_iff`, node `ST.1/orbit-bijection-for-the-embedding`).
  `f` and `g` are `GL₂(ℤ)`-equivalent if and only if `B_g = rA₁ + MB_fMᵀ` for some `M ∈ SL₃(ℤ)` that
  preserves `A₁` and some `r ∈ ℤ`.
- **Proposition 2.16** (`BinaryQuartic.card_fibre_embed_le`, node
  `ST.1/fibres-of-the-embedding-are-uniformly-bounded`). Let `N` bound the integral solutions of
  `g(x, y) = 1` over integral binary cubic forms of nonzero discriminant (the DT.4 request). Then a
  `GL₂(ℤ) × SL₃(ℤ)`-class of nonzero discriminant has at most `2N` preimages among the `PGL₂(ℤ)`-classes
  of binary quartic forms. The factor 2 is what the source's argument proves; see E202.

### Dependencies

- **Imports:** ST.0; Tau Ceti EllipticCurves Layers 6 and 7 (Layer 8 through ST.0); GlobalQuadraticForms
  Layer 5; DiophantineApproximationAndTranscendence DT.4; Mathlib. The stage edge from
  ClassicalArithmeticCompletion CA.3 is covered without a CA.3 prerequisite, as described above.
- **ST.2** uses:
  - the embedding, Theorem 2.14 and Proposition 2.16, to transport Bhargava's uniformity estimate
    (`ST.2/uniformity-estimate-for-infinitely-many-congruence-conditions`,
    `ST.2/weakly-divisible-quartic-discriminants-via-ternary-pairs`);
  - the stabilizer theorem, for the weights `1/#Stab` and the negligibility of large stabilizers;
  - `U_p` for cubic forms.
- **ST.3** uses:
  - Delone–Faddeev, the reducible locus and the Davenport–Heilbronn criterion
    (`ST.3/davenport-heilbronn-count-of-cubic-fields`, `ST.3/splitting-symbol-determines-the-reduction-mod-p`,
    `ST.3/maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields`);
  - the quartic parametrization, the uniqueness of resolvents and the maximality conditions
    (`ST.3/bhargava-count-of-quartic-fields`);
  - the quintic parametrization and its maximality sets (`ST.3/bhargava-count-of-quintic-fields`).

  ST.3 owns the `p`-adic densities of all the `U_p`.
- **ST.4** uses:
  - Theorem 3.2 over `𝔽_p`, `ℚ_p` and `ℝ`;
  - the solubility predicates;
  - Theorem 3.5 and the stabilizer theorem (`ST.4/average-size-of-the-2-selmer-group-is-three`).
- **Other consumers:**
  - ST.5 uses the ternary cubic invariants.
  - `AnalyticNumberTheory:AN.8` uses the three prehomogeneous spaces (binary cubic forms, pairs of
    ternary quadratic forms, quadruples of quinary alternating forms), through the RS-07 link.

### Acceptance tests

- **Each bijection has an explicit inverse and a stabilizer statement.**
  - Cubic rings: the index form, and `Aut R(f) ≅ Stab(f)`.
  - Quartic rings: the resolvent map in bases, with the resolvent counted by `σ(content)`.
  - Quartics: `q(P)` with `z ∘ q = μ`, and `Stab ≅ E(K)[2]`, of order 2 or 4 over `ℝ`.
- **Local and maximality restrictions are recorded as conditions on forms.**
  - `U_p` for cubic forms, defined modulo `p²`, containing every form with `p² ∤ disc`.
  - The `λ`-conditions (i)–(iii) for pairs.
  - The seventeen `U_p(σ)` for quintic quadruples.
  - Local solubility at every place for quartics.
- **The reducible and degenerate loci are identified.**
  - Irreducible forms correspond to domains.
  - `disc ≠ 0` corresponds to étale algebras.
  - Quartics with a rational linear factor form the identity Selmer class.
  - `Disc(A, B) ≢ 0 (mod p)` corresponds to étale `Q(A, B)/p`.
- **Conventions are pinned by tests that fail under the alternatives.**
  - The scalar 2 acts on cubic forms as 2, not 8.
  - Negating a basis negates the index form.
  - The based resolvent has index form `−4 Det(Ax − By)`.
  - `c₄(y²z − x³ + xz²) = +48`.
  - `ρ(T)` is `(1 1 1; 0 1 2; 0 0 1)`, not the printed matrix.
  - `x³ + y³ ∉ U₃` although `3 ∤ f`.
- **Concrete values.**
  - `disc(x²y − xy²) = 1`, and `ℤ[∛2]` has discriminant `−108`.
  - `4 Det(A₁x − B_f y)` is monic.
  - `q((0, 0)) = X⁴ + Y⁴/12` on `y² = x³ − 27x`.
  - `z(x³y − xy³) = 1`.
  - The projected quartic of `y² = x³ − 7x + 10` has `(I, J) = (336, −17280)`.
  - `2x⁴ − 34y⁴` is locally but not globally soluble.

### Not planned in this stage, by decision

- The proofs in HCL IV. The multiplication tables of `R(A)` and `S(A)`, the fundamental map and the
  minimal-model lemmas are summarized in the two statement-level quintic nodes.
- HCL III §§3.6–3.8 (Lemmas 16–17, the syzygies (27), Corollary 18) and the case analysis behind the
  `λ`-conditions of §4.2. These are summarized in proof steps, not split into lemma nodes.
- The ring-theoretic reading of the embedding (Bhargava–Shankar Remark 2.15; Wood Theorem 1.1). It is
  not used by ST.2–ST.4.
- The ST.1-routed items of the paper extractions of Bhargava–Gross–Wang (2017), Bhargava–Shankar–Wang
  (2022, 2025) and Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao (2020).
- The `p`-adic densities of the maximality sets, which are ST.3's.
- The Galois-equivariant form of the stabilizer identification (Bhargava–Ho Theorem 4.1). The
  abstract isomorphism `Stab ≅ E(K)[2]` used by ST.2 and ST.4 is planned.

### Mistakes in the sources

These are recorded in the packet as `ArithmeticStatistics/E201`–`E205`. Each correction was checked by
computer algebra.

- **E201 (misprint, Bhargava–Shankar p. 16).** "the binary form `Det(Ax − By)` … is monic" should read
  `4 Det(Ax − By)`, since `det A₁ = 1/4`. The paper itself uses the factor 4 on pp. 17 and 21.
- **E202 (gap, Bhargava–Shankar Proposition 2.16).** The argument bounds the fibre by
  `2·#{g(x, y) = 1} ≤ 24`, not 12. The pairs `(A₁, B)` and `(A₁, −B)`, that is `φ(f)` and `φ(−f)`, lie
  in one `GL₂(ℤ) × SL₃(ℤ)`-class, but `f` and `−f` are inequivalent when `J(f) ≠ 0`. Any uniform bound
  suffices for the uses in ST.2.
- **E203 (misprint, Bhargava–Shankar (31)).** `ρ` is printed with the ternary coordinates in reverse
  order. With (30) and the action `B ↦ g₃Bg₃ᵀ` the equivariant formula is
  `ρ(a b; c d) = (ad − bc)⁻¹(a², ab, b²; 2ac, ad + bc, 2bd; c², cd, d²)`. The test case is `γ = T`,
  `f = y⁴`. `SO(A₁, ℤ)` and Theorem 2.14 are unaffected.
- **E204 (misprint, HCL III (23)).** The constant terms `c⁰ᵢⱼ` need `k ≠ i`, not `k ≠ j`. With the
  printed condition the expression depends on `k` and the table is not associative for random integral
  pairs.
- **E205 (misprint, HCL III (26)).** The identity (25) holds for `4 Det(Ax − By)`, not
  `4 Det(Ax + By)`. The two differ by `y ↦ −y`, so the ring and Theorem 1 are unaffected.

## ST.2 — Geometry of numbers and uniformity

This layer counts integral orbits of `GL₂(ℤ)` on binary quartic forms ordered by height and on binary
cubic forms ordered by discriminant, imposes finitely many and then infinitely many congruence
conditions, and proves the uniform tail estimates that make the passage to infinitely many local
conditions legitimate. Its sources are Bhargava–Shankar, *Binary quartic forms having bounded
invariants* (arXiv:1006.1002v3, Section 2 in full), the first-order counting of binary cubic forms in
Bhargava–Shankar–Tsimerman, *On the Davenport–Heilbronn theorems and second order terms*
(arXiv:1005.0672v3, Sections 5, 5.5 and 8.2–8.4), and Bhargava, *The geometric sieve and the density of
squarefree values of invariant polynomials* (arXiv:1402.0031v1, Section 3), which is Bhargava–Shankar's
reference [6] and the proof of their Theorem 2.17.

The layer is organised in three parts, which read as three sub-layers in the atlas: **ST.2a**, the
geometric sieve and local densities (general polynomials on `ℤⁿ`); **ST.2b**, binary quartic forms
of bounded height (Bhargava–Shankar §2); **ST.2c**, binary cubic forms of bounded discriminant
(Bhargava–Shankar–Tsimerman §5 and §8, stated for forms).

### Boundaries

- **Consumed from other roadmaps.** Davenport's lattice-point lemma for bounded semialgebraic
  multisets is owned by `GeometryOfNumbersAndQuadraticArithmetic:GN.4` and requested from it, with the
  exact contract below. The divisor bound `d(n) ≪_ε n^ε` is requested from
  `AnalyticNumberTheory:AN.5`. Chebyshev's bound `θ(x) ≤ x log 4` is Mathlib's
  `Chebyshev.theta_le_log4_mul_x`; the standard domain of `SL₂(ℤ)` is Mathlib's `ModularGroup.fd`, and
  its measure-theoretic fundamental-domain property for `PSL₂(ℤ)` is Tau Ceti's
  `ModularGroup.isFundamentalDomain_fdo`.
- **Consumed from this roadmap.** `ArithmeticStatistics:ST.0/invariants-height-and-eligible-pairs`
  (the invariants `I`, `J`, the discriminant `Δ = (4I³ − J²)/27`, the height `H`, and Theorem 1.7 on
  eligible pairs); `ArithmeticStatistics:ST.1/binary-quartic-parametrization-of-two-selmer` (the
  stabiliser of a binary quartic with `Δ ≠ 0` in `PGL₂(K)` is `E(K)[2]`);
  `ArithmeticStatistics:ST.1/embedding-into-pairs-of-ternary-quadratic-forms` (Theorem 2.14,
  Proposition 2.16 with its bound of 12 preimages); and
  `ArithmeticStatistics:ST.1/delone-faddeev-parametrization-of-cubic-rings` (the twisted action on
  binary cubic forms). ST.2 never uses the ring-theoretic meaning of a form: maximality, splitting of
  primes and the translation to cubic fields are `ArithmeticStatistics:ST.3`'s.
- **Supplied to this roadmap.** `ArithmeticStatistics:ST.3` takes Davenport's count with error term,
  the counts with congruence conditions uniform in the modulus, the non-maximality uniformity estimate
  and the sieve for acceptable conditions on binary cubic forms; `ArithmeticStatistics:ST.4` takes the
  sieve for binary quartic forms, the count of Theorem 2.1, the covolume `2ζ(2)` and the real
  change-of-measure constant `1/27`.
- **Owned here.** The quantitative Ekedahl geometric sieve (the accepted paper routes
  PAPER-KOYMANS-MILOVIC-21 and PAPER-BHARGAVA-GROSS-WANG-17 place it in this layer), strong and weak
  divisibility, the local density bound for `{p² ∣ f}`, functions defined by congruence conditions,
  and all uniform orbit counts and tail estimates for the two spaces of forms.
- **Not used.** No step uses a large-sieve or bilinear estimate from
  `SieveMethodsAndPrimePatterns:SV.2`; the sieve here is inclusion–exclusion with a uniform tail.

### Pinned conventions

- **Forms.** A binary form of degree `n` over `R` is its coefficient vector `f : Fin (n+1) → R`,
  `f i` the coefficient of `x^{n−i} y^i`: quartics are `ax⁴ + bx³y + cx²y² + dxy³ + ey⁴`, cubics
  `ax³ + bx²y + cxy² + dy³`. Row-vector convention: `γ ∈ GL₂` substitutes `(x, y) ↦ (x, y)γ`.
- **Actions.** On binary quartic forms `GL₂` acts by the standard action `γ·f(x, y) = f((x, y)γ)`,
  which preserves `I` and `J` up to `(det γ)⁴`, `(det γ)⁶`; the twisted action
  `(det γ)^{−2} f((x, y)γ)` is used only for `PGL₂` in the change of measure. On binary cubic forms
  `GL₂` acts by the twisted action `γ·f = (det γ)^{−1} f((x, y)γ)` of the Delone–Faddeev
  correspondence; then `Disc(γ·f) = (det γ)² Disc(f)` and the scalar `λ·1` acts by `f ↦ λf`.
- **Height and discriminants.** `H(f) = max(|I(f)|³, J(f)²/4)` for quartics;
  `Disc = b²c² − 4ac³ − 4b³d − 27a²d² + 18abcd` for cubics.
- **Counting functions.** `N(S; X)` is the number of `GL₂(ℤ)`-classes of irreducible (over `ℚ`)
  elements of `S` with `H < X` (quartics) or `0 < |Disc| < X` (cubics). The averaged counts below
  extend `N` to sets that are not `GL₂(ℤ)`-invariant; for invariant sets they count a class with
  weight `2/#Stab_{GL₂(ℤ)}` (quartics) or `1/#Stab_{GL₂(ℤ)}` (cubics). The weight belongs to the
  class, not to the point.
- **Iwasawa coordinates and Gauss's domain.** `n(u) = [[1, 0], [u, 1]]`, `a(t) = diag(t^{−1}, t)`,
  `k(θ)` the rotation, `λ = λ·1`; Haar measure `dg = t^{−2} du d^×t dk d^×λ` with `dk` of total mass
  1 on `SO₂(ℝ)`. **The domain is strict**: `F = N′(t)A′K₊Λ` with `K₊ = {k(θ) : 0 ≤ θ < π}`, a set of
  representatives of `SO₂(ℝ)/{±1}`. With the full `SO₂(ℝ)`, as printed in both papers, `F` is a union
  of two fundamental domains (sourceIssue `ArithmeticStatistics/E301`). All constants below are for
  the strict domain.
- **Measures.** `ω` on `PGL₂(ℝ)` is the invariant form dual to the `ℤ`-basis `E₁₁, E₁₂, E₂₁` of
  `pgl₂(ℤ)`; `dv` is Lebesgue measure on the coefficients; `μ_p` is the Haar probability measure on
  `ℤ_pⁿ`. The hyperbolic measure on the upper half-plane is Mathlib's.
- **Asymptotics.** Error terms `O(·)` are as `X → ∞` with the stated uniformity; tail estimates are
  stated as `lim_{M→∞} lim sup_{X→∞}`.

### ST.2a — The geometric sieve and local densities

**Chebyshev-type prime sums** (`…/chebyshev-bounds-for-prime-sums`, lemma). `π(x) ≪ x/log x` for
`x ≥ 2`; `Σ_{p > N} p^{−s} ≪_s N^{1−s}/log N` for `s > 1`, `N ≥ 2`; hence
`Σ_{M<p≤r} r^n p^{−k} ≪_k r^n/(M^{k−1} log M)`. Proved from Mathlib's `Chebyshev.theta_le_log4_mul_x`
by splitting at `√x` and a dyadic decomposition. The logarithm matters: without it the error term of
Bhargava–Shankar's Theorem 2.20 would be of the order of the main term.

**Lattice points on a subvariety** (`…/lattice-points-on-a-subvariety-in-a-dilated-region`,
Bhargava's Lemma 3.1). For `B ⊂ ℝⁿ` compact and `Y ⊆ 𝔸ⁿ_ℚ` Zariski-closed of codimension `≥ k ≥ 1`,
`#{a ∈ rB ∩ ℤⁿ : a ∈ Y} ≤ C(B, Y)·r^{n−k}` for all `r ≥ 1`. Proof by induction on `n` after
eliminating `x_n` with resultants (Mathlib's `Polynomial.resultant`,
`Polynomial.exists_mul_add_mul_eq_C_resultant`) and splitting on the vanishing of the leading
coefficient.

**Points modulo `p`** (`…/uniform-bound-for-points-of-a-subscheme-modulo-p`). For a closed subscheme
`Y = Spec ℤ[x]/𝔞 ⊆ 𝔸ⁿ_ℤ` of codimension `≥ k` (Krull dimension of `ℤ[x]/𝔞` at most `n + 1 − k`),
`#Y(𝔽_p) ≤ C·p^{n−k}` for all `p > M₀(Y)`. The codimension is taken in `𝔸ⁿ_ℤ`, so vertical fibres
(codimension 1) are excluded for `k ≥ 2`. The source asserts this and the uniformity of the
codimension modulo large `p` without proof (sourceIssue `E310`); the proof here runs the elimination
over `ℤ` and inducts on the dimension of the generic fibre, with Schwartz–Zippel
(`MvPolynomial.schwartz_zippel_totalDegree`) as the base case.

**The geometric sieve**, in two halves and the theorem. Small primes
(`…/geometric-sieve-small-primes`, display (16)): the pairs `(a, p)` with `a ∈ rB ∩ ℤⁿ`,
`M < p ≤ r`, `a mod p ∈ Y(𝔽_p)` number `O(r^n/(M^{k−1} log M))` for `k ≥ 2` (cover `rB` by cubes of
side `p`). Large primes (`…/geometric-sieve-large-primes`, display (17)): the pairs with `p > r`,
`a ∉ Y(ℤ)`, `a mod p ∈ Y(𝔽_p)` number `O(r^{n−k+1})` (a nonzero integer of size `O(r^d)` has `O(1)`
prime factors above `r`; induction on `n` through the three sets (19)–(21)).

> **Theorem (quantitative Ekedahl sieve; Bhargava, Theorem 3.3; Bhargava–Shankar, Theorem 2.17)**
> (`…/quantitative-ekedahl-geometric-sieve`, planet *Geometric sieve*). Let `B ⊂ ℝⁿ` be compact and
> `Y ⊆ 𝔸ⁿ_ℤ` a closed subscheme of codimension `k ≥ 1`. There is `C = C(B, Y)` with
> `#{a ∈ rB ∩ ℤⁿ : a mod p ∈ Y(𝔽_p) for some prime p > M} ≤ C·(r^n/(M^{k−1} log M) + r^{n−k+1})`
> for all `r ≥ 1`, `M ≥ 2`.

The source says "positive real numbers `r`, `M`"; the bound is false for small `r` and meaningless for
`M ≤ 1` (sourceIssue `E309`).

**Strong and weak multiples** (`…/strongly-and-weakly-divisible-values`, definition). For
`f ∈ ℤ[x₁,…,xₙ]`, `a ∈ ℤⁿ`, `p` prime, `j ≥ 1`: `f` is *strongly a multiple of `p^j` at `a`*
(`StronglyDvdAt`) if `p^j ∣ f(a′)` for every `a′ ≡ a (mod p)`, and *weakly* (`WeaklyDvdAt`) if
`p^j ∣ f(a)` but not strongly. For quartics `W_p(V) = {p² ∣ Δ}`, `W_p^{(1)}(V)` its strongly divisible
part and `W_p^{(2)}(V)` the rest; likewise `W_p(U)`, `W_p^{(1)}(U)`, `W_p^{(2)}(U)` for cubics with
`Disc`.
API: `stronglyDvdAt_two_iff` (strongly a multiple of `p²` iff `p² ∣ f(a)` and `p` divides every
partial derivative at `a`); `stronglyDvdAt_congr` (depends on `a mod p`);
`weaklyDvdAt_of_not_dvd_pderiv`; `stronglyDvdAt_one_iff` (no weak multiples of `p`); `quarticW_smul`
(`GL₂(ℤ)`-invariance of all six sets); `quarticW1_iff_splittingType` (for `p ≥ 3`: `f ∈ W_p^{(1)}(V)`
iff `f ∈ pV_ℤ` or `f mod p` has splitting type `(1³1)`, `(1²1²)`, `(2²)` or `(1⁴)`, i.e.
`f̄ = c·q²` with `q` quadratic or `f̄ = ℓ³m` with `ℓ, m` linear); `cubicW1_iff_tripleRoot` (for
`p ≥ 3`: `f ∈ pU_ℤ` or `f mod p` has a triple root).
Unit tests: `WeaklyDvdAt.quartic_example` — `25x⁴ + x²y² + y⁴` at `p = 5` has `Δ = 3920400`, is
weakly divisible, and yet `5 ∣ ∂Δ/∂e` (a definition by `p ∤ ∂Δ/∂e` fails it);
`StronglyDvdAt.quartic_example` — `x³y + 5y⁴` has `Δ = −675` and lies in `W₅^{(1)}(V)`;
`StronglyDvdAt.one`; `WeaklyDvdAt.cubic_example` — `25x³ + xy² + y³ ∈ W₅^{(2)}(U)` with
`Disc = −25·679`; `quarticW1_iff_splittingType.two` — at `p = 2` the form `x²y² + xy³` is strongly
divisible but of type `(1²11)` (sourceIssue `E308`); `StronglyDvdAt.pVZ` — `pV_ℤ ⊆ W_p^{(1)}(V)`.

**Strong multiples lie on a codimension-two locus** (`…/strong-divisibility-lies-on-a-codimension-two-locus`,
Bhargava's Lemma 3.6). If `f` is strongly a multiple of `p²` at `a` then `a mod p ∈ Y_f(𝔽_p)`,
`Y_f = V(f, ∂f/∂xₙ)`; if `f` is primitive and coprime to `∂f/∂xₙ` in `ℚ[x]`, then `Y_f` has
codimension 2 in `𝔸ⁿ_ℤ`. The converse fails: `25x⁴ + x²y² + y⁴` reduces into `Y_Δ(𝔽₅)` but is weakly
divisible. Consumers therefore bound the larger set of forms reducing into `Y_f`.

**The two discriminant loci** (`…/discriminant-loci-of-codimension-two`). `Δ` is primitive, of degree
3 in `e` (leading coefficient `256a³`) and coprime to `∂Δ/∂e`; `Disc` is primitive, of degree 2 in
`d`, and coprime to `∂Disc/∂d`. So `Y₄ = V(Δ, ∂Δ/∂e) ⊆ 𝔸⁵_ℤ` and `Y₃ = V(Disc, ∂Disc/∂d) ⊆ 𝔸⁴_ℤ` have
codimension 2. The proof specialises the resultants (`(a, b, c, d) = (1, 0, 0, 1)` gives
`Res_e(256e³ − 27, 768e²) ≠ 0`) and checks the content.

**Local density of `{p² ∣ f}`** (`…/local-density-of-values-divisible-by-p-squared`). For `f`
primitive and coprime to `∂f/∂xₙ`, `#{v mod p² : p² ∣ f(v)} ≤ C·p^{2n−2}`, i.e.
`μ_p{p² ∣ f} ≤ C p^{−2}`. This is Bhargava–Shankar's (43), which they cite from Poonen; here it
follows from the codimension-two bound and a Hensel count.

**Functions defined by congruence conditions** (`…/functions-defined-by-congruence-conditions`,
definition). For a primitive `f ∈ ℤ[x₁,…,xₙ]` (the discriminant), a function `φ : ℤⁿ → [0, 1]` is
*defined by congruence conditions* if there are `φ_p : ℤ_pⁿ → [0, 1]` with (1) `∏_p φ_p(v) → φ(v)` for
every `v`, and (2) `φ_p` locally constant outside a closed `μ_p`-null set; it is *acceptable* if
`φ_p(v) = 1` whenever `p > p₀` and `p² ∤ f(v)`. Sets are treated through their characteristic
functions; `μ_p(S)` is the Haar measure of the closure of `S`. Bhargava–Shankar–Tsimerman's acceptable
collections of local specifications (the maximal, not totally ramified cubic rings for large `p`)
give acceptable sets for `Disc`, because for `p ≥ 5` a cubic ring over `ℤ_p` is maximal and not
totally ramified iff `p² ∤ Disc`.
Declarations: the structure `CongruenceConditions` (local factors with their two conditions),
`CongruenceConditions.localMass` (`∫ φ_p dμ_p`), `CongruenceConditions.IsAcceptable`,
`CongruenceConditions.squarefree` (`φ_p = 1_{p² ∤ f}`), `CongruenceConditions.ofResidues` (finitely
many conditions), `CongruenceConditions.localMass_ofResidues` (a union of classes modulo `p^k` has
mass `#(classes)/p^{kn}`), `CongruenceConditions.one_sub_localMass_le` (for acceptable `φ`,
`1 − ∫φ_p ≤ μ_p{p² ∣ f}`), `CongruenceConditions.mul`.
Unit tests: `squarefree_localMass` (`n = 1`, `f = x`: `1 − p^{−2}`, product `6/π²`);
`one_localMass` (the constant presentation); `square_not_acceptable` (the indicator of squares is
defined by congruence conditions but is not acceptable); `ofResidues_prod` (for a set defined modulo
`m = ∏ p^{k_p}` the product of the local masses is `#(S mod m)/mⁿ`).

### ST.2b — Binary quartic forms of bounded height

**Real root types** (`…/real-root-types-of-binary-quartic-forms`, definition). For `Δ(f) ≠ 0`,
`V_ℝ^{(i)}` (`i = 0, 1, 2`) is the set with `4 − 2i` real roots in `ℙ¹(ℝ)` (a root at `[1 : 0]` when
`a = 0` included); `V_ℝ^{(2±)}` are the positive and negative definite forms; the index set is
`T = {0, 1, 2+, 2−}` (`QuarticRealType`), and `V_ℤ^{(i)} = V_ℝ^{(i)} ∩ V_ℤ` (`intQuarticLocus`).
API: `quarticLocus`, `mem_quarticLocus_iff_realRoots`, `disc_pos_of_mem_quarticLocus` (`Δ > 0` on
`V^{(0)}, V^{(2±)}`, `Δ < 0` on `V^{(1)}`), `iUnion_quarticLocus` (a partition of `{Δ ≠ 0}`),
`isOpen_quarticLocus`, `smul_mem_quarticLocus_iff`, `neg_mem_quarticLocus_twoPos_iff`,
`intQuarticLocus`.
Unit tests: `quarticLocus.example_zero` (`x³y − xy³`, `Δ = 4`), `example_one` (`x³y + xy³`,
`Δ = −4`), `example_twoPos` (`±(x⁴ + y⁴)`, `Δ = 256`), `not_sign_disc` (the sign of `Δ` does not
separate `V^{(0)}` from `V^{(2)}`), `degenerate` (`x²y²` is in no locus).

**Real orbits with fixed invariants** (`…/real-orbits-of-binary-quartic-forms-with-fixed-invariants`,
theorem; the source quotes Cremona). If `4I₀³ − J₀² < 0` the forms with invariants `(I₀, J₀)` are one
`SL₂^±(ℝ)`-orbit, in `V_ℝ^{(1)}`; if `> 0` they are three orbits, one in each of `V_ℝ^{(0)}`,
`V_ℝ^{(2+)}`, `V_ℝ^{(2−)}`. Hence two forms in one locus are `GL₂(ℝ)`-equivalent iff
`(I, J)` are proportional with weights `(λ², λ³)`, `λ > 0`. The proof uses normal forms:
`c·xy(x − y)(x − μy)` with `I = c²(μ² − μ + 1)`, `J = c³(μ + 1)(2μ − 1)(μ − 2)`;
`c·xy(x² + pxy + y²)` with `|p| < 2`, `I = c²(p² − 3)`, `J = c³p(9 − 2p²)`; and
`c(x² + y²)(x² + ρ²y²)` with `0 < ρ < 1`, `I = c²(ρ⁴ + 14ρ² + 1)`,
`J = −2c³(1 + ρ²)(ρ² − 6ρ + 1)(ρ² + 6ρ + 1)`.

**Stabilisers (Lemma 2.2)** (`…/stabilizers-of-real-binary-quartic-forms`). For `f ∈ V_ℝ^{(i)}` the
stabiliser in `GL₂(ℝ)` has order 8 (`i = 0, 2±`) or 4 (`i = 1`); `n_i := #Stab/2`, so `n₀ = n_{2±} = 4`,
`n₁ = 2`. Proof: `det γ = ±1`, `#Stab_{GL₂(ℝ)} = 2·#Stab_{PGL₂(ℝ)} = 2·#E(ℝ)[2]`, and
`#E(ℝ)[2] = 4` or `2` according to the sign of the discriminant of `x³ − (I/3)x − J/27`, which is `Δ`.
Bhargava–Shankar's Theorem 1.8 uses `n₂ = 2` for the definite forms lumped together.

**The fundamental sets of Table 1** (`…/fundamental-sets-for-real-binary-quartic-orbits`,
construction). `L^{(0)} = {x³y − ⅓xy³ − (J/27)y⁴ : |J| < 2}`;
`L^{(1)} = {x³y − (I/3)xy³ ± (2/27)y⁴ : −1 ≤ I < 1} ∪ {x³y + ⅓xy³ − (J/27)y⁴ : |J| < 2}`;
`L^{(2+)} = {(1/16)x⁴ − (√(2 − J)/(3√3))x³y + ½x²y² + y⁴ : |J| < 2}`; `L^{(2−)} = −L^{(2+)}`. Every
element has height 1; `(I, J)` maps `L^{(i)}` bijectively onto the height-one pairs with the sign
condition of `i`; each `GL₂(ℝ)`-orbit in `V_ℝ^{(i)}` meets `L^{(i)}` (and every translate `h·L^{(i)}`)
exactly once; all coefficients are at most 1 in absolute value. `R^{(i)} = Λ·L^{(i)}` carries the
section `p^{(i)}_{I,J}` of the invariant map.
API: `quarticFundSet`, `quarticFundSet_subset_locus`, `height_eq_one_of_mem_quarticFundSet`,
`invariants_bijOn_quarticFundSet`, `existsUnique_smul_mem_quarticFundSet`,
`abs_coeff_le_one_of_mem_quarticFundSet`, `quarticSection`, `invariants_quarticSection`.
Unit tests: `quarticFundSet.zero_example` (`x³y − ⅓xy³`, invariants `(1, 0)`), `one_boundary`
(`x³y + ⅓xy³ − (2/27)y⁴` with `(−1, 2)`, in the first family only), `not_boundary` (`(1, 2)`, with
`Δ = 0`, is not attained), `twoNeg` (`L^{(2−)} = −L^{(2+)}`, `(I, J) ↦ (I, −J)`).

**Gauss's domain** (`…/gauss-fundamental-domain-in-iwasawa-coordinates`, construction). Every `g` with
`det g > 0` is uniquely `n(u)a(t)k(θ)λ`; `F = {n(u)a(t)k(θ)λ : |u| ≤ ½, u² + t⁴ ≥ 1, 0 ≤ θ < π,
λ > 0}` is a fundamental domain for the left action of `GL₂(ℤ)` on `GL₂(ℝ)`; `g ↦ −u + it²`
identifies `N′(t)A′` with `ModularGroup.fd`, and `t^{−2} du d^×t = ½·dx dy/y²`.
API: `iwasawaN`, `iwasawaA`, `iwasawaK`, `iwasawa_existsUnique`, `gaussDomain`, `mem_gaussDomain_iff`,
`isFundamentalDomain_gaussDomain`, `gaussDomain_haar`, `neg_mem_gaussDomain_iff`.
Unit tests: `gaussDomain.one_mem`, `neg_one_not_mem` (`−1 ∉ F` although `−1 ∈ GL₂(ℤ)·1` — the test a
domain with the full circle fails), `det_pos`, `nu_full` (for `t ≥ 1` the `u`-range is `[−½, ½]`).

**Volumes.** `…/hyperbolic-area-of-the-modular-fundamental-domain`: `vol(ModularGroup.fd) = π/3`
(refining Tau Ceti's `ModularGroup.volume_fd_lt_top`), by `∫_{−½}^{½}(1 − x²)^{−1/2}dx = π/3`.
`…/covolume-of-pgl2-z`: in the coordinates `[n(u)a(t)k(θ)]`, `|ω| = 2t^{−3} du dt dθ`, and
`Vol_ω(PGL₂(ℤ)\PGL₂(ℝ)) = π²/3 = 2ζ(2)` (Mathlib's `riemannZeta_two`); the strict domain has
`dg`-measure `π/12 = ζ(2)/(2π)` (without `Λ`).

**Orbit multiplicities** (`…/orbit-multiplicities-in-fundamental-multisets`, (8)). In the multiset
`F h·L^{(i)}` the class of `x` is represented `m(x) = #Stab_{GL₂(ℝ)}(x)/#Stab_{GL₂(ℤ)}(x)` times,
`m(x) = n_i` off a null set; so the irreducible integral points of height `< X`, with multiplicity,
number `Σ_{[x]} n_i·2/#Stab_{GL₂(ℤ)}(x)` (sourceIssue `E311` on the source's placement of the weight).
For `x⁴ + y⁴` all eight real stabilisers are integral and `m = 1`.

**The averaged count** (`…/averaged-count-of-binary-quartic-orbits`, definition). Fix a compact
semialgebraic, left `SO₂(ℝ)`-invariant `G₀ ⊂ GL₂(ℝ)` with nonempty interior and `det ≥ 1`. For any
`S ⊆ V_ℤ^{(i)}`: `N(S; X) = (1/(n_i∫_{G₀}dh)) ∫_{G₀} #{x ∈ F h·L^{(i)} ∩ S^{irr} : H(x) < X} dh`; the
regions are `B(n, t, λ, X) = n a(t) λ G₀·L^{(i)} ∩ {H < X}`.
API: `quarticAveragedCount`, `quarticAveragedCount_weighted` (`N_φ`), `quarticRegionB`,
`quarticAveragedCount_eq_sum_classes` (for invariant `S`, `Σ_{[x]} 2/#Stab_{GL₂(ℤ)}(x)`),
`quarticAveragedCount_union`, `quarticAveragedCount_mono`, `quarticAveragedCount_indep`
(independent of `G₀` for invariant `S`), `quarticAveragedCount_reducible`.
Unit tests: `quarticAveragedCount.empty` (also `N(S; X) = 0` for `X ≤ 1`: integral forms with
`Δ ≠ 0` have height `≥ 49/4`, attained at `(I, J) = (−2, ±7)`), `reducible_zero` (forms with `a = 0`
contribute nothing), `not_orbit_count` (on a single point the average lies strictly between 0 and 1),
`invariant`.

> **Theorem 2.5 (averaging formula)** (`…/averaging-formula-for-binary-quartic-forms`, planet
> *Averaging over fundamental domains*). For every `S ⊆ V_ℤ^{(i)}`,
> `N(S; X) = (1/(2n_i∫_{G₀}dh)) ∫_{N′(t)A′Λ} #{x ∈ S^{irr} ∩ B(n, t, λ, X)} t^{−2} du d^×t d^×λ`.

The factor ½ is `∫_{K₊}dk`; with the source's full circle the identity holds without it but the left
side is then twice the class count.

**Cusp and reducible contributions.** Lemma 2.3 (`…/reducible-binary-quartic-forms-in-the-main-body`):
reducible integral forms with `a ≠ 0` in `R_X(h·L^{(i)})` number `O_ε(X^{2/3+ε})` uniformly in `h ∈ G₀`
(divisor bound; sourceIssue `E306` for the misprinted form). Lemma 2.22
(`…/reducible-monic-binary-cubic-forms`): reducible monic cubic forms `x³ + rx²y + sxy² + ty³` of
height `< X` number `O_ε(X^{1/2+ε})` up to unipotent equivalence. Lemma 2.4
(`…/orbits-with-large-stabilizer-are-negligible`): classes with `#Stab_{GL₂(ℚ)} > 2` number
`O_ε(X^{3/4+ε})` — a nontrivial stabiliser gives a rational 2-torsion point, hence a reducible monic
cubic resolvent; per resolvent there are `O(X^{1/4})` classes by Bhargava's proof of Lemma 12 in the
quartic paper (a recorded gap) and Proposition 2.16. Proposition 2.7
(`…/binary-quartic-lattice-points-in-the-cusp`): with `C⁴` bounding the coefficients of `G₀·L`, the
points with `a ≠ 0` of a translate `v₀ + mV_ℤ` in `B(n, t, λ, X)` number 0 if `Cλ < t`, and
`m^{−5}Vol(B) + O(t⁴λ^{16})` otherwise, uniformly in `m` — Davenport's lemma with the projection bound
obtained by dropping the smallest coefficient range.

> **Averaging and cutting off the cusp, (18)–(20)**
> (`…/averaging-over-the-fundamental-domain-and-cutting-the-cusp`). (a)
> `N(V_ℤ^{(i)}; X) = Vol(R_X(L^{(i)}))/n_i + O_ε(X^{3/4+ε})`. (b) Uniformly in `S ⊆ V_ℤ^{(i)}`, the
> part of the averaged integral with `t > T` is at most `c·X^{5/6}/T² + O(X^{3/4})`.

**Change of measure (Proposition 2.8, real case)** (`…/jacobian-change-of-measure-for-binary-quartic-forms`).
For measurable `U ⊆ PGL₂(ℝ)`: `∫_{U·R^{(i)}} φ dv = (1/27)∫∫_U φ(g·p^{(i)}_{I,J}) ω(g) dI dJ`, the
multiset on the left. The constant is the Jacobian at the identity for the section
`x³y − (I/3)xy³ − (J/27)y⁴` (it equals `−1/27` identically), transported by invariance and by the
transitivity of `PGL₂(ℂ)` on forms with fixed invariants. The `p`-adic analogue (Proposition 3.7) is
`ArithmeticStatistics:ST.4`'s.

**Volumes (23)–(26)** (`…/volume-of-the-fundamental-region-for-binary-quartic-forms`).
`Vol(R_X(L^{(i)})) = (2ζ(2)/27)∫_{R^{(i)}(X)} dI dJ` with areas `(8/5)X^{5/6}` (`Δ > 0`) and
`(32/5)X^{5/6}` (`Δ < 0`): `(16/135)ζ(2)X^{5/6}` for `i = 0, 2±` and `(64/135)ζ(2)X^{5/6}` for `i = 1`.

> **Theorem 2.1 (= Theorem 1.6)** (`…/count-of-binary-quartic-forms-of-bounded-height`, planet *Count
> of binary quartic forms by height*). `N(V_ℤ^{(0)}; X) = (4/135)ζ(2)X^{5/6} + O(X^{3/4+ε})`,
> `N(V_ℤ^{(1)}; X) = (32/135)ζ(2)X^{5/6} + O(X^{3/4+ε})`,
> `N(V_ℤ^{(2)}; X) = (8/135)ζ(2)X^{5/6} + O(X^{3/4+ε})`, each definite sign contributing
> `(4/135)ζ(2)X^{5/6}`.

**Eligible pairs and Theorem 1.8.** `…/eligible-invariant-pairs-of-bounded-height`: eligible pairs
are 9 translates of `9ℤ × 27ℤ` (from Theorem 1.7), and their numbers up to height `X` are
`(8/135)X^{5/6} + O(X^{1/2})` (`Δ > 0`) and `(32/135)X^{5/6} + O(X^{1/2})` (`Δ < 0`), by Davenport's
lemma. `…/average-number-of-classes-per-eligible-invariant-pair`: the average number of classes per
eligible pair is `2ζ(2)/n_i` with `n₀ = 4`, `n₁ = n₂ = 2`, i.e. `ζ(2)/2`, `ζ(2)`, `ζ(2)`.

**Finitely many congruence conditions.** `…/binary-quartic-counts-with-finitely-many-congruence-conditions`
(Theorem 2.11 and (27)): for a translate of `mV_ℤ`, `N = Vol(R_X(L^{(i)}))/(n_i m⁵) + O(X^{3/4+ε})`
with the error independent of `m`; for `S` defined modulo finitely many prime powers,
`N(S ∩ V_ℤ^{(i)}; X) = N(V_ℤ^{(i)}; X)∏_p μ_p(S) + O_S(X^{3/4+ε})`.
`…/weighted-binary-quartic-counts-with-finitely-many-congruence-conditions` (Theorem 2.12): the same
for `GL₂(ℤ)`-invariant weights depending on finitely many residues, with the local integrals
`∫φ̃_{p_j}` as density.

**Uniformity.** `…/uniformity-for-strongly-divisible-quartic-discriminants` (Theorem 2.18): for
compact `B₀`, the forms in `X^{1/6}B₀` reducing into `Y₄(𝔽_p)` for some `p > M` number
`O(X^{5/6}/(M log M) + X^{2/3})` (the geometric sieve with `n = 5`, `k = 2`, `r = X^{1/6}`); this
contains `⋃_{p>M} W_p^{(1)}(V)`. `…/weakly-divisible-quartic-discriminants-via-ternary-pairs` ((37)):
`N(W_p^{(2)}(V); X) = O(X/p²)` uniformly in `p`, transporting Bhargava's Proposition 23 for pairs of
ternary quadratic forms (a recorded gap) through `φ` and Proposition 2.16.
`…/uniformity-for-weakly-divisible-quartic-discriminants` (Theorem 2.20, corrected): for
`W′_p = {p² ∣ Δ, p ∤ ∂Δ/∂e} ⊆ W_p^{(2)}(V)`, `#(X^{1/6}B₀ ∩ W′_p) = O(X^{5/6}/p² + X^{2/3})` (at most
three simple roots of `Δ` in `e` modulo `p`, each lifting uniquely modulo `p²`), and the union over
`p > M` of the irreducible points is `O(X^{5/6}/(M log M) + X^{5/6}/log X)`. The source asserts that
every weakly divisible form has `p ∤ ∂Δ/∂e`; that is false (sourceIssue `E302`), and the forms with
`p ∣ ∂Δ/∂e` are covered by the geometric sieve instead, since they reduce into `Y₄`.

> **Theorem 2.13 (uniformity estimate)**
> (`…/uniformity-estimate-for-infinitely-many-congruence-conditions`, planet *Uniformity estimate*).
> With `W_p(V) = {f ∈ V_ℤ : p² ∣ Δ(f)}`: for every `T`,
> `lim sup_{X→∞} N(⋃_{p>M} W_p(V); X)/X^{5/6} ≤ C_T/(M log M) + c/T²`, hence
> `lim_{M→∞} lim sup_{X→∞} N(⋃_{p>M} W_p(V); X)/X^{5/6} = 0`.

The proof splits the averaged integral at `t = T`: the cusp part is `(b)` of (18)–(20); the rest lies
in a fixed compact region dilated by `X^{1/6}`, each point counted with bounded weight, where the
geometric sieve and the corrected Theorem 2.20 apply. The source states the rate `O(1/log M)` with a
constant independent of `M`; its proof does not track the dependence of the constants on the cut-off,
and bounds a single cuspidal region by its volume, which needs the averaging (sourceIssue `E304`). The
sieve needs only the limit form.

> **Theorem 2.21 (squarefree sieve)** (`…/squarefree-sieve-for-binary-quartic-forms`, planet
> *Squarefree sieve for binary quartic forms*). For `φ` acceptable for `Δ`, defined by congruence
> conditions with `GL₂(ℤ)`-invariant local factors,
> `N_φ(V_ℤ^{(i)}; X) = N(V_ℤ^{(i)}; X)·∏_p ∫φ_p df + o(X^{5/6})`, and the product converges.

Proof: approximate `φ_p` from above and below by functions defined modulo `pⁿ`; the upper bound is
Theorem 2.12 in the limit; the lower bound loses only `⋃_{p > Y} W_p(V)`, controlled by Theorem 2.13;
the product converges by the local density bound.

### ST.2c — Binary cubic forms of bounded discriminant

**Real orbits and stabilisers** (`…/real-orbits-and-stabilizers-of-binary-cubic-forms`). `U_ℝ^{(0)} =
{Disc > 0}` and `U_ℝ^{(1)} = {Disc < 0}` are single `GL₂(ℝ)`-orbits (twisted action); stabilisers have
orders `n₀ = 6` (all permutations of three real roots) and `n₁ = 2`. The scalar `−1 ∈ GL₂(ℤ)` sends
`f` to `−f`, which is why `n_i` is the full stabiliser order here. The source's indices `n₁, n₂` stand
for `n₀, n₁` (sourceIssue `E307`).

**Integral stabilisers** (`…/stabilizers-of-irreducible-integral-binary-cubic-forms`): for `f`
irreducible over `ℚ`, `Stab_{GL₂(ℤ)}(f)` is trivial or cyclic of order 3 (the centraliser of the Galois
image in `S₃`), and in the cyclic case `Disc(f)` is a positive square; e.g.
`x³ + x²y − 2xy² − y³` (`Disc = 49`) is fixed exactly by `{1, γ, γ²}`, `γ = [[0, −1], [1, −1]]`.
Lemma 22 (`…/binary-cubic-forms-with-cyclic-stabilizer`): such classes number `O_ε(X^{3/4+ε})`, via
the Hessian covariant and the reduction of positive definite quadratic forms. Lemma 21
(`…/reducible-binary-cubic-forms-in-the-main-body`): reducible forms with `a ≠ 0` in `R_X(v)` number
`O_ε(X^{3/4+ε})`.

**Invariant measure, corrected** (`…/invariant-measure-on-binary-cubic-forms`, Proposition 23). With
`dk` of mass 1 on `SO₂(ℝ)`: `∫_{GL₂(ℝ)} f(g·vᵢ) dg = (1/4π)∫_{GL₂(ℝ)·vᵢ} f |Disc|^{−1} dv =
(n_i/4π)∫_{U_ℝ^{(i)}} f |Disc|^{−1} dv`; on `GL₂⁺(ℝ)`, `dv = 4π|Disc(g·v)| dg`. The source prints
`1/(2π)` together with the covolume `ζ(2)/π`; the product, which is all that enters Davenport's
constant, is unchanged (sourceIssue `E305`).

**The averaged cubic count** (`…/averaged-count-of-binary-cubic-orbits`, definition). With
`B = B(C) = {3a² + b² + c² + 3d² ≤ C, |Disc| ≥ 1}` (three times the Bombieri norm, `SO₂(ℝ)`-invariant):
`N(S; X) = ∫_{B∩U^{(i)}} #{x ∈ F·v ∩ S^{irr} : |Disc x| < X}|Disc v|^{−1}dv / (n_i∫_{B∩U^{(i)}}
|Disc|^{−1}dv)`; regions `B(n, t, λ, X) = n a(t) λ(B ∩ U^{(i)}) ∩ {|Disc| < X}`;
`M_i = (n_i/4π)∫_{B∩U^{(i)}}|Disc|^{−1}`.
API: `cubicAveragedCount`, `cubicRegionB`, `cubicAveragingConstant`,
`cubicAveragedCount_eq_sum_classes` (for invariant `S`, `Σ_{[x]} 1/#Stab_{GL₂(ℤ)}(x)`; sourceIssue
`E312` on the source's weight), `cubicAveragedCount_union`, `cubicAveragedCount_mono`,
`cubicAveragedCount_indep`, `bombieri_smul_rotation`.
Unit tests: `cubicAveragedCount.empty`, `reducible_zero`, `cyclic_weight` (the class of
`x³ + x²y − 2xy² − y³` contributes `1/3` once `X > 49`), `invariant`.

**Averaging formula and cusp.** `…/averaging-formula-for-binary-cubic-forms`:
`N(S; X) = (1/M_i)∫_F #{x ∈ S^{irr} ∩ gB : |Disc x| < X} dg = (1/(2M_i))∫_{N′A′Λ} #{x ∈ S^{irr} ∩
B(n, t, λ, X)} t^{−2} du d^×t d^×λ`. `…/binary-cubic-lattice-points-in-the-cusp` (Lemma 25 and (28)):
for a translate of `mU_ℤ`, the points with `a ≠ 0` in `B(n, t, λ, X)` number 0 if `Cλ/t³ < a′`
(`a′ ≥ 1` the least nonzero `|a|` in the translate) and `m^{−4}Vol(B) + O(C³t³λ³/m³ + C²t⁴λ²/m² +
Ct³λ/m + 1)` otherwise.

> **Theorem 20 (Davenport)** (`…/davenport-count-of-binary-cubic-forms`, planet *Davenport's count of
> binary cubic forms*). `N(U_ℤ^{(0)}; X) = (π²/72)X + O(X^{5/6})` and
> `N(U_ℤ^{(1)}; X) = (π²/24)X + O(X^{5/6})`; for every `v ∈ U_ℝ^{(i)}`, `Vol(R_X(v)) = π²X/12`; and
> the cusp part `t > T` of the averaged integral is at most `cX/T² + O(X^{5/6})`, uniformly in `S`.

The volume: `4π·∫_0^{X^{1/4}}λ⁴d^×λ·(π/12) = π²X/12`. This proves Bhargava–Shankar's Theorem 1.5
(Davenport 1951) with an error term.

**Congruence conditions, uniformly in the modulus** (`…/binary-cubic-counts-with-congruence-conditions`,
Theorem 26 with (29)–(31)). For `1 ≤ m ≤ X^{1/6}` and a translate `L` of `mU_ℤ`:
`N(L ∩ U_ℤ^{(i)}; X) = m^{−4}(π²/(12n_i))X + O(m^{−3}X^{5/6}) − R_L(X)`, the corrections `R_L ≥ 0`
summing to `O(X^{3/4+ε})` over disjoint translates; for `S` a union of `k` translates the error is
`O(km^{−3}X^{5/6}) + O(X^{3/4+ε})`; and `lim N(S ∩ U_ℤ^{(i)}; X)/X = (π²/(12n_i))∏_p μ_p(S)`.

**Index-`p` switching** (`…/index-p-switching-for-binary-cubic-forms`). If `p² ∣ a` and `p ∣ b`, then
`diag(p^{−1}, 1)·f = (a/p², b/p, c, pd)` is integral with discriminant `Disc(f)/p²` and a root at
`[0 : 1]` modulo `p`; conversely every pair (class of `g`, root of `g mod p`) produces such an `f`, well
defined up to `GL₂(ℤ)`; a class `[g]` produces at most 3 classes if `g ≢ 0 (mod p)` and at most
`p + 1` otherwise. This is the form-theoretic content of Bhargava–Shankar–Tsimerman's Lemma 13 and
Propositions 15–16.

**Non-maximality uniformity** (`…/uniformity-estimate-for-nonmaximal-binary-cubic-forms`, Proposition
29). For `W_p^{DH} = {f ∈ pU_ℤ} ∪ {f : some GL₂(ℤ)-translate has p² ∣ a, p ∣ b}`, the classes of
irreducible `f ∈ W_p^{DH}` with `|Disc| < X` number at most `C·X/p²`, uniformly in `p`: they come from
`N(X/p⁴) + 3N(X/p²) + (p + 1)N(X/p⁶)` classes, with `N(Y) ≪ Y` by Theorem 20.

> **Tail estimate for binary cubic forms** (`…/uniformity-estimate-for-binary-cubic-discriminants`).
> With `W_p(U) = {p² ∣ Disc}`: `lim sup_{X→∞} N(⋃_{p>M} W_p(U); X)/X ≤ C_T/(M log M) + c/T²` for
> every `T`, hence `lim_{M→∞} lim sup_X N(⋃_{p>M} W_p(U); X)/X = 0`.

For `p ≥ 3`, a form in `W_p(U)` either reduces into `Y₃(𝔽_p)` (geometric sieve with `n = 4`, `k = 2`,
`r = X^{1/4}`, inside the averaged count split at `t = T`) or has a double root modulo `p` which,
moved to `[1 : 0]`, forces `p² ∣ a` because `Disc ≡ −4ac³ (mod p²)` — so it lies in `W_p^{DH}`. The
totally ramified maximal forms, which Bhargava–Shankar–Tsimerman bound by class field theory, are
covered by the geometric sieve.

**Sieve** (`…/sieve-to-acceptable-functions-for-binary-cubic-forms`). For `φ` acceptable for `Disc`,
defined by congruence conditions with `GL₂(ℤ)`-invariant local factors,
`N_φ(U_ℤ^{(i)}; X) = (π²/(12n_i))∏_p ∫φ_p dμ_p·X + o(X)`. With `φ_p` the indicator of
Davenport–Heilbronn's `U_p`, `∏_p μ_p(U_p) = ∏_p(1 − p^{−2})(1 − p^{−3})` gives the limit
`1/(2n_iζ(3))` of `ArithmeticStatistics:ST.3/davenport-heilbronn-count-of-cubic-fields`.

### Dependencies

Within the roadmap: ST.2 consumes `ArithmeticStatistics:ST.0` (the quartic invariants, height and
Theorem 1.7) and `ArithmeticStatistics:ST.1` (the stabiliser identification, the embedding into pairs of
ternary quadratic forms, the Delone–Faddeev action); `ArithmeticStatistics:ST.3` and
`ArithmeticStatistics:ST.4` consume ST.2 as described under Boundaries. Across roadmaps:
`GeometryOfNumbersAndQuadraticArithmetic:GN.4` (Davenport's lemma, with constants depending only on
dimension, multiplicity and polynomial complexity, and valid for unipotent triangular images and
lattice translates) and `AnalyticNumberTheory:AN.5` (the divisor bound). Mathlib: resultants,
Schwartz–Zippel, Chebyshev's `θ`-bound, the modular fundamental domain and its measure, `ζ(2)`, the
change-of-variables formula, `ℤ_p`. Tau Ceti: `ModularGroup.isFundamentalDomain_fdo`,
`ModularGroup.volume_fd_lt_top`.

Two inputs from Bhargava's *The density of discriminants of quartic rings and fields* (Annals 162,
2005) are recorded as gaps of this layer: Proposition 23 (the uniformity estimate `O(X/p²)` for weakly
divisible discriminants of pairs of ternary quadratic forms, needed by (37)) and the bound `O(X^{1/4})`
from the proof of Lemma 12 (needed by Lemma 2.4). Both belong to the geometry of numbers of
`GL₂(ℤ) × SL₃(ℤ)` acting on pairs of ternary quadratic forms, which is uniform orbit counting and
therefore planned in this layer from that source (or from Bhargava–Shankar–Wang,
arXiv:1512.03035).

### Acceptance tests

- **Interchange of limits.** Every passage from finitely to infinitely many local conditions goes
  through a uniform tail theorem (Theorem 2.13 for quartics, the cubic tail estimate for cubics), with
  the limit in `X` taken before the limit in `M`; no pointwise density statement is used in its place.
- **Constants.** Theorem 2.1's constants `4/135·ζ(2)`, `32/135·ζ(2)`, `8/135·ζ(2)` and Davenport's
  `π²/72`, `π²/24` come out of the strict fundamental domain with the constants `1/27`, `2ζ(2)`, `4π`,
  `ζ(2)/(2π)`; a domain with the full circle, or the printed Jacobian constant `1/(2π)` with the strict
  domain, gives a wrong constant.
- **Cusp.** In the quartic cusp `t > Cλ` every integral point has `a = 0`; in the cubic cusp
  `t³ > Cλ` likewise; points with `a = 0` are reducible.
- **Weak versus strong.** `25x⁴ + x²y² + y⁴` at `p = 5` is weakly divisible with `5 ∣ ∂Δ/∂e`; the
  uniformity proof must place it in the geometric-sieve part.
- **Orders of magnitude.** Error terms `X^{3/4+ε}` (quartic) and `X^{5/6}` (cubic) are below the main
  terms `X^{5/6}` and `X`; the tails are `o(1)` times the main term only as `M → ∞`.
- **Worked values.** `Δ(x³y − xy³) = 4`, `Δ(x³y + xy³) = −4`, `Δ(x⁴ + y⁴) = 256`; the smallest height
  of an integral binary quartic form with `Δ ≠ 0` is `49/4`; `vol(ModularGroup.fd) = π/3`;
  `Vol_ω(PGL₂(ℤ)\PGL₂(ℝ)) = π²/3`.

### Corrections to the sources

The planned statements use corrected forms of the following (details in the packet's
`sourceIssues`): the fundamental domain `F` of both papers is a union of two fundamental domains
(`E301`); the proof of Bhargava–Shankar's Theorem 2.20 asserts `p ∤ ∂Δ/∂e` for weakly divisible
forms, which fails (`E302`), and calls `∂Δ/∂e` cubic in `e` (`E303`); the proof of Theorem 2.13 does
not justify its rate or its cusp bound without averaging (`E304`); Bhargava–Shankar–Tsimerman's
Proposition 23 has the constant `1/(2π)` for `1/(4π)`, compensated by the covolume (`E305`); the
splitting-type description of `W_p^{(1)}(V)` needs `p ≥ 3` (`E308`); the geometric sieve needs
`r ≥ 1`, `M ≥ 2` (`E309`) and uses an unproved uniform point count (`E310`); and three misprints
(`E306`, `E307`, `E311`, `E312`) concern a formula, indices and the placement of weights. None of
them changes a main theorem.

## ST.3 — Fields and class groups

This layer proves selected asymptotic counts of number fields by discriminant and selected moments of class groups over families of fields, and it records the general predictions (Cohen–Lenstra, Malle) as explicit propositions that no theorem assumes. Every count fixes the degree, the signature or sign of the discriminant, the Galois group where it matters, the local conditions, and the automorphism weights. The per-field analytic class number formula is Mathlib's (`NumberField.dedekindZeta_residue` with the right-limit theorem `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`); it is an input, never a substitute for a count over a family.

The central development is the Davenport–Heilbronn theorems in the form proved by Bhargava–Shankar–Tsimerman (arXiv:1005.0672, Sections 2–5 and 8): the count of cubic fields, and the mean size of the 3-torsion of class groups of quadratic fields. The layer takes from earlier layers exactly the following, by stage:

* **ArithmeticStatistics:ST.0** — the arithmetic family carrier (`ST.0/arithmetic-family`), of which the family of degree-`n` number fields ordered by `|Disc|` is an instance.
* **ArithmeticStatistics:ST.1** — the Delone–Faddeev bijection between `GL₂(ℤ)`-classes of integral binary cubic forms (twisted action `(γf)(x, y) = det(γ)⁻¹ f((x, y)γ)`) and cubic rings, with `Disc(f) = Disc(R(f))`, `R(f)` a domain iff `f` is irreducible, `Aut(R(f)) ≅ Stab_{GL₂(ℤ)}(f)`, and the same over `ℤ_p`, `ℝ`, `𝔽_p` (`ST.1/delone-faddeev-parametrization-of-cubic-rings`); and the Davenport–Heilbronn maximality criterion: `R(f)` is maximal at `p` iff `f ∈ U_p`, where `f ∉ U_p` iff `f ≡ 0 (mod p)` or some `GL₂(ℤ)`-translate has `a ≡ 0 (mod p²)` and `b ≡ 0 (mod p)` (BST Lemma 13 and Theorem 14).
* **ArithmeticStatistics:ST.2** — the orbit counts of binary cubic forms: Davenport's count `N(V_ℤ^{(0)}; X) = (π²/72)X + O(X^{5/6})`, `N(V_ℤ^{(1)}; X) = (π²/24)X + O(X^{5/6})` (BST Theorem 20), its version for sets defined by finitely many congruence conditions, `lim N(S ∩ V_ℤ^{(i)}; X)/X = (π²/(12 n_i)) ∏_p μ_p(S)` with `n₀ = 6`, `n₁ = 2` (BST Theorem 26), the `p`-adic density `μ_p` of congruence sets, the count `M₃(X) = O(X)` of orders in cubic fields (BST Theorem 6), and the uniformity estimate for forms non-maximal at `p`, `N(W_p; X) = O(X/p²)` uniformly in `p` (BST Proposition 29, first half).

Other roadmaps supply: the permutation Galois group of a number field and the label predicates (Tau Ceti PolynomialGaloisGroups, Layers 0 and 6); the Hilbert class field, ring class fields of quadratic orders and their Galois groups (Tau Ceti ClassFieldTheory, Layer 13); Picard groups of quadratic orders (Tau Ceti GlobalNumberFields, Layer 11); inertia groups, ramification indices in subfields and tame discriminant exponents (Tau Ceti NumberFieldArithmetic, Layers 1, 4 and 6; LocalFieldsRamification, Layer 3); reduced binary quadratic forms with pinned representatives (Tau Ceti ModularForms, Layer 11); quadratic fields `ℚ(√d)` (Tau Ceti Multiquadratic, Layer 0); and the `p`-adic volume of an orbit of binary cubic forms (AnalyticNumberTheory:AN.8, local densities of prehomogeneous spaces). No selected theorem of this layer needs Hecke `L`-functions from AnalyticNumberTheory:AN.4.

### Conventions

* **Discriminants.** `Disc(K)` is Mathlib's signed `NumberField.discr K ∈ ℤ`; its sign is `(−1)^{r₂(K)}` (`NumberField.sign_discr`). Intervals `(ξ, η)` of discriminants are open at both ends. A quadratic field of discriminant `D` is `ℚ(√D)`, and `D` runs over the fundamental discriminants `D ≠ 1` (Mathlib's `Int.IsFundamentalDiscr`).
* **Counting.** Fields are counted up to `ℚ`-isomorphism, realised as subfields of a fixed algebraic closure `ℚ̄ = AlgebraicClosure ℚ` modulo isomorphism. A non-Galois cubic field has three conjugate subfields and is counted once. Where a source counts subfields (Malle, Klüners) or weights by `1/#Aut` (Bhargava–Shankar–Wang), the conversion factor is recorded.
* **Galois group.** The Galois group of a degree-`n` field `K` is the image of `Gal(ℚ̄/ℚ)` acting by composition on the `n` embeddings `K → ℚ̄`, identified with a transitive subgroup of `Sₙ` up to conjugacy (PolynomialGaloisGroups, Layer 0: the degree-`n` action of `(minpoly ℚ α).Gal` for `K = ℚ(α)`).
* **Class groups.** `Cl(K)` is Mathlib's `ClassGroup (𝓞 K)` (the wide class group). `h_m(K) := #Cl(K)[m]`. Narrow class groups are named explicitly where used (Fouvry–Klüners, and the `p = 2` case of the Cohen–Lenstra–Gerth moments).
* **Binary cubic forms.** `f(x, y) = a x³ + b x²y + c xy² + d y³` with coefficients `(a, b, c, d)` (Mathlib's `Cubic` as the coefficient carrier), discriminant `b²c² − 4ac³ − 4b³d − 27a²d² + 18abcd` (Mathlib's `Cubic.discr`), twisted `GL₂` action as in ST.1. `V_ℤ^{(0)}` and `V_ℤ^{(1)}` are the forms of positive and negative discriminant, with `GL₂(ℝ)`-stabilizers of orders `n₀ = #Aut(ℝ³) = 6` and `n₁ = #Aut(ℝ ⊕ ℂ) = 2`.
* **Conjectures.** A conjecture is a definition of a proposition with full mathematical content (a limit statement). A theorem that uses one takes it as a hypothesis; no conjecture is assumed anywhere in the layer, and no heuristic moment is substituted for a proved limit.

### Objects


#### The counting function of number fields of fixed degree by discriminant, with signature, Galois-group and local restrictions (`ST.3/number-field-counting-function`)

Fix an algebraic closure Q̄ of Q (Mathlib's AlgebraicClosure ℚ). For an integer n ≥ 1, a predicate P on number fields that is invariant under Q-algebra isomorphism, and real numbers ξ < η, let S_n(P; ξ, η) be the set of intermediate fields K of Q̄/Q with [K : Q] = n, ξ < Disc(K) < η and P(K), where Disc(K) = NumberField.discr K ∈ Z is the signed absolute discriminant (its sign is (−1)^{r₂(K)}). S_n(P; ξ, η) is finite by Hermite's theorem. Define N_n(P; ξ, η) as the number of classes of S_n(P; ξ, η) under the relation K ~ K' iff K ≃ₐ[Q] K'; since every number field of degree n embeds into Q̄, N_n(P; ξ, η) is the number of Q-isomorphism classes of degree-n number fields K with ξ < Disc(K) < η and P(K). Abbreviations: N_n^+(P; X) := N_n(P; 0, X), N_n^-(P; X) := N_n(P; −X, 0), and N_n(P; X) := N_n^+(P; X) + N_n^-(P; X) (all fields with 0 < |Disc(K)| < X). The weighted count N_n^{Aut}(P; ξ, η) := Σ_{classes [K]} 1/#Aut(K/Q). The three standard restrictions are pinned as follows. Signature: P(K) is nrComplexPlaces K = r₂. Galois group: for a transitive subgroup Γ ≤ S_n, P(K) says that the image of Gal(Q̄/Q), acting by composition on the n embeddings K → Q̄ (MulAction.toPermHom), is conjugate to Γ under some bijection between the embeddings and {1, …, n}; this is the permutation Galois group of PolynomialGaloisGroups, Layer 0 (the degree-n action of (minpoly ℚ α).Gal for K = Q(α)) with its label predicate of Layer 6. Local specifications: for a collection Σ = (Σ_v) of sets of isomorphism classes of étale algebras of degree n over Q_v (v a prime or ∞), P(K) says K ⊗ Q_v ∈ Σ_v for every v.

Pinned conventions and hypotheses:

* n ≥ 1; for the Galois-group restriction Γ is a transitive subgroup of S_n, identified up to conjugacy
* P must be invariant under Q-algebra isomorphism; otherwise the count depends on the chosen subfield in the class
* The discriminant is Mathlib's signed NumberField.discr; the interval (ξ, η) is open at both ends, matching BST's N₃(ξ, η)
* Fields are counted up to isomorphism, not as subfields of Q̄ (a non-Galois cubic field has three conjugate subfields and is counted once)

Construction:

1. The set S_n(P; ξ, η) is contained in the set of intermediate fields K of Q̄/Q with |discr K| ≤ ⌈max(|ξ|, |η|)⌉, which is finite by NumberField.finite_of_discr_bdd; take Nat.card of the quotient by the isomorphism relation.
2. Invariance of P and of finrank and discr under Q-isomorphism makes the quotient well defined; the embedding of every number field of degree n into Q̄ (its minimal polynomial splits in Q̄) shows that every isomorphism class is represented.
3. The subfield formula: the members of S_n(P; ξ, η) isomorphic to a fixed K are the images of the n embeddings K → Q̄, two embeddings having the same image iff they differ by an automorphism of K, so the class of K has n/#Aut(K/Q) members and N_n(P; ξ, η) = Σ_{K ∈ S_n(P; ξ, η)} #Aut(K/Q)/n.
4. The family of degree-n number fields up to isomorphism, ordered by |Disc|, with weight 1 (or 1/#Aut(K/Q) for the weighted count), is an instance of the arithmetic family of ArithmeticStatistics:ST.0/arithmetic-family; its counting function is N_n(P; X), and its bounded-height finiteness is Hermite's theorem.

Where it is used:

* Bhargava-Shankar-Tsimerman, Theorem 1 and Section 8.3 (ArithmeticStatistics:ST.3/davenport-heilbronn-count-of-cubic-fields): N₃(0, X) and N₃(−X, 0) are the quantities whose asymptotics are proved.
* Bhargava-Shankar-Tsimerman, Section 8.5, (59)-(60) (ArithmeticStatistics:ST.3/count-of-quadratic-fields): the denominators Σ_{0<±Disc(K₂)<X} 1 are N₂^±(X).
* Bhargava-Shankar-Wang, Theorems 1-2 (ArithmeticStatistics:ST.3/bhargava-count-of-quartic-fields and /bhargava-count-of-quintic-fields): N_n restricted to S_n-fields with a signature or archimedean specification.
* Kluners, Conjecture 1.3 (ArithmeticStatistics:ST.3/malle-conjecture): Malle's Z(k, G; x) counts subfields; the subfield formula converts it to N_n for k = Q.

API:

* `numberFieldCount` (constructor): N_n(P; ξ, η) ∈ ℕ, the number of Q-isomorphism classes of degree-n number fields K with ξ < Disc(K) < η and P(K), for an isomorphism-invariant predicate P.
* `finite_numberFieldsInInterval` (other): The set S_n(P; ξ, η) of intermediate fields of Q̄/Q of degree n with ξ < discr < η and P is finite (from NumberField.finite_of_discr_bdd).
* `numberFieldCount_eq_sum_card_aut` (characterisation): N_n(P; ξ, η) = Σ_{K ∈ S_n(P; ξ, η)} #Aut(K/Q)/n (each isomorphism class has n/#Aut(K/Q) conjugate subfields).
* `numberFieldCount_mono` (relation): N_n(P; ξ, η) ≤ N_n(P'; ξ', η') whenever P ⇒ P' and (ξ, η) ⊆ (ξ', η').
* `numberFieldCount_add_of_disjoint` (relation): For disjoint isomorphism-invariant predicates P, P': N_n(P ∨ P'; ξ, η) = N_n(P; ξ, η) + N_n(P'; ξ, η); in particular N_n(P; ξ, η) = Σ_{r₂=0}^{⌊n/2⌋} N_n(P ∧ (r₂(K) = r₂); ξ, η).
* `numberFieldCount_neg_eq_odd_nrComplexPlaces` (compatibility): N_n(P; −X, 0) = N_n(P ∧ (r₂(K) odd); 0, X) with the interval reflected: by NumberField.sign_discr, Disc(K) < 0 iff r₂(K) is odd.
* `numberFieldCount_eq_ncard_of_two` (characterisation): For n = 2 every quadratic field is Galois with exactly one subfield of Q̄ in its class, so N₂(P; ξ, η) = #S₂(P; ξ, η).
* `numberFieldCount_congr` (extensionality): If P and P' agree on all number fields of degree n then N_n(P; ξ, η) = N_n(P'; ξ, η).

Unit tests:

* `numberFieldCount_two_neg_five` (computation): N₂(⊤; −5, 0) = 2.
* `numberFieldCount_three_neg_twentyfour` (computation): N₃(⊤; −24, 0) = 1.
* `numberFieldCount_three_fifty` (computation): N₃(⊤; 0, 50) = 1.
* `numberFieldCount_one` (degenerate): For every X > 1, N₁(⊤; 0, X) = 1, and N₁(⊤; ξ, η) = 0 whenever 1 ∉ (ξ, η).
* `card_subfields_three_neg_twentyfour` (non-example): The set S₃(⊤; −24, 0) of subfields of Q̄ has exactly 3 elements, so counting subfields instead of isomorphism classes gives 3 ≠ 1 = N₃(⊤; −24, 0).


#### The number h_m(K) of m-torsion elements of the class group of a number field (`ST.3/torsion-count-of-class-groups`)

For a number field K and an integer m ≥ 1, h_m(K) := #{c ∈ Cl(K) : c^m = 1} = Nat.card {c : ClassGroup (𝓞 K) // c ^ m = 1}, the order of the m-torsion subgroup Cl(K)[m] of the ideal class group. For a quadratic field K₂ of discriminant D this is BST's h*_3(K₂) = #Cl₃(D) when m = 3. For a prime p, h_p(K) = p^{rk_p Cl(K)} where rk_p A = dim_{F_p} A/pA.

Pinned conventions and hypotheses:

* m ≥ 1; the class group is Mathlib's ClassGroup (𝓞 K) of the ring of integers (the wide class group); narrow class groups, where used, are named explicitly
* Cl(K) is finite (NumberField.classNumber), so h_m(K) is a positive integer dividing the class number

Construction:

1. Define h_m(K) as Nat.card of the subtype {c : ClassGroup (𝓞 K) // c ^ m = 1}; it is the kernel of the m-th power endomorphism of the finite abelian group Cl(K).
2. For a finite abelian group A, #A[m] = #(A/mA) = #Hom(A, Z/mZ) (duality of finite abelian groups), and for m = p prime #A[p] = p^{rk_p A}.
3. For coprime m, m': A[mm'] ≅ A[m] × A[m'], so h_{mm'} = h_m h_{m'}; and h_m(K) divides h(K) = NumberField.classNumber K by Lagrange.

Where it is used:

* Bhargava-Shankar-Tsimerman, Theorem 2 and Section 8.5 (ArithmeticStatistics:ST.3/davenport-heilbronn-mean-of-three-torsion): the mean of h₃ over quadratic fields.
* Bhargava-Shankar-Wang, Theorem 6(b) (ArithmeticStatistics:ST.3/bhargava-mean-of-two-torsion-in-cubic-class-groups): the mean of h₂ over cubic fields.
* Fouvry-Kluners, Theorem 1 (ArithmeticStatistics:ST.3/fouvry-kluners-moments-of-four-ranks): p-ranks and the 4-rank are read off from torsion counts.
* ArithmeticStatistics:ST.3/cohen-lenstra-moment-prediction: the conjectural moments of p^{rk_p}.

API:

* `classGroupTorsionCard` (constructor): h_m(K) = Nat.card {c : ClassGroup (𝓞 K) // c ^ m = 1}.
* `classGroupTorsionCard_pos` (other): 1 ≤ h_m(K) (the trivial class is m-torsion).
* `classGroupTorsionCard_dvd_classNumber` (relation): h_m(K) divides NumberField.classNumber K.
* `classGroupTorsionCard_mul_of_coprime` (relation): For coprime m, m': h_{mm'}(K) = h_m(K) h_{m'}(K).
* `classGroupTorsionCard_prime_eq_pow_rank` (characterisation): For p prime, h_p(K) = #(Cl(K)/Cl(K)^p) = p^{rk_p Cl(K)} with rk_p A = dim_{F_p} A/pA.
* `classGroupTorsionCard_two_eq_card_elementaryTwoQuotient` (compatibility): h₂(K) = Nat.card (TauCeti.ClassGroup.ElementaryTwoQuotient (𝓞 K)) (Tau Ceti's TauCeti.ClassGroup.card_elementaryTwoQuotient_eq_card_twoTorsion).
* `classGroupTorsionCard_congr` (functoriality): A Q-algebra isomorphism K ≃ K' gives h_m(K) = h_m(K').

Unit tests:

* `classGroupTorsionCard_three_sqrt_neg_twentythree` (computation): For K = Q(√−23), h₃(K) = 3.
* `classGroupTorsionCard_two_sqrt_neg_five` (computation): For K = Q(√−5), h₂(K) = 2.
* `classGroupTorsionCard_one` (degenerate): h₁(K) = 1 for every number field K.
* `classGroupTorsionCard_two_compat` (compatibility): h₂(K) equals the order of Tau Ceti's elementary 2-quotient Cl(K)/Cl(K)^2.
* `classGroupTorsionCard_three_sqrt_neg_fortyseven` (non-example): For K = Q(√−47), whose class number is 5, h₃(K) = 1 ≠ 5: h₃ is not the class number.


#### The splitting symbol (f, p) of an integral binary cubic form and the local sets T_p(σ), V_p, Y_p, Z_p (`ST.3/splitting-symbol-and-local-sets-of-binary-cubic-forms`)

Let V_Z be the space of integral binary cubic forms f(x, y) = a x³ + b x² y + c x y² + d y³ (coefficients (a, b, c, d) ∈ Z⁴, the carrier of ArithmeticStatistics:ST.1/delone-faddeev-parametrization-of-cubic-rings) and p a prime. If f ≢ 0 (mod p), f mod p has exactly three zeros in P¹(F̄_p) counted with multiplicity; the splitting symbol (f, p) = (f₁^{e₁} f₂^{e₂} …) lists the degrees f_i over F_p of the fields of definition of the distinct zeros and their multiplicities e_i, and takes one of the five values (111), (12), (3), (1²1), (1³). For each symbol σ, T_p(σ) := {f ∈ V_Z : f ≢ 0 (mod p), (f, p) = σ}. With U_p ⊆ V_Z the set of forms f such that the cubic ring R(f) is maximal at p (the Davenport-Heilbronn set of ArithmeticStatistics:ST.1: f ∉ U_p iff f ≡ 0 (mod p), or some GL₂(Z)-translate of f has a ≡ 0 (mod p²) and b ≡ 0 (mod p)), put U_p(σ) := U_p ∩ T_p(σ), V_p := U_p \ T_p(1³) (maximal at p and not totally ramified at p), Y_p := U_p ∩ T_p(1³) (maximal and totally ramified at p), W_p := V_Z \ U_p and Z_p := V_Z \ V_p = W_p ⊔ Y_p. Over Z_p and F_p the same definitions apply to V_{Z_p} = Z_p⁴ and V_{F_p} = F_p⁴.

Pinned conventions and hypotheses:

* p is prime; the symbol is undefined for f ≡ 0 (mod p), and such f lie in W_p
* All the sets depend only on f mod p² (T_p(σ) only on f mod p), so they are finite unions of translates of p²V_Z and have well-defined p-adic densities
* The symbol is invariant under the twisted GL₂(Z)-action (γf)(x, y) = det(γ)^{-1} f((x, y)γ) of ST.1, since GL₂ permutes the zeros in P¹ preserving degrees and multiplicities
* Z_p is BST's set of forms 'whose discriminants are not fundamental'; W_p and Y_p are its two parts

Construction:

1. Factor f mod p over F_p into irreducible binary forms (homogeneous factorisation in F_p[x, y]); the pairs (degree, multiplicity) of the distinct irreducible factors, as a multiset, is the symbol; the five values are the multisets with Σ f_i e_i = 3.
2. GL₂(F_p) acts on binary forms over F_p by linear substitution and scaling by det^{-1}, which maps irreducible factors to irreducible factors of the same degree with the same multiplicities; reduction mod p commutes with the action, so T_p(σ), U_p and hence V_p, Y_p, W_p, Z_p are GL₂(Z)-invariant.
3. U_p is imported from ST.1 (Davenport-Heilbronn's maximality criterion, BST Theorem 14); the remaining sets are Boolean combinations.

Where it is used:

* Bhargava-Shankar-Tsimerman, Lemmas 17-19 (ArithmeticStatistics:ST.3/densities-of-splitting-types and the two following nodes): the densities of T_p(σ), U_p(σ), U_p and V_p.
* Bhargava-Shankar-Tsimerman, Section 8.2, Proposition 29 (ArithmeticStatistics:ST.3/cubic-fields-totally-ramified-at-large-primes-are-sparse): the uniformity estimate for Z_p = W_p ⊔ Y_p.
* Bhargava-Shankar-Tsimerman, Section 8.5 (ArithmeticStatistics:ST.3/davenport-heilbronn-mean-of-three-torsion): V = ∩_p V_p parametrises nowhere totally ramified cubic fields.

API:

* `cubicSplittingSymbol` (constructor): (f, p) as a multiset of pairs (degree, multiplicity), defined for f ≢ 0 (mod p).
* `splittingTypeSet` (constructor): T_p(σ) = {f ∈ V_Z : f ≢ 0 mod p, (f, p) = σ}.
* `maximalNotTotallyRamifiedSet` (constructor): V_p = U_p \ T_p(1³).
* `maximalTotallyRamifiedSet` (constructor): Y_p = U_p ∩ T_p(1³).
* `notFundamentalSet` (constructor): Z_p = V_Z \ V_p.
* `cubicSplittingSymbol_mem_five` (characterisation): For f ≢ 0 (mod p), (f, p) ∈ {(111), (12), (3), (1²1), (1³)}.
* `cubicSplittingSymbol_smul` (compatibility): (γf, p) = (f, p) for γ ∈ GL₂(Z) (twisted action of ST.1).
* `splittingTypeSet_mod` (other): Membership in T_p(σ) depends only on f mod p; membership in U_p, V_p, Y_p, Z_p only on f mod p².
* `notFundamentalSet_eq_union` (relation): Z_p = W_p ⊔ Y_p, a disjoint union.

Unit tests:

* `cubicSplittingSymbol_xy_xsuby` (computation): (x y (x − y), p) = (111) for every prime p.
* `cubicSplittingSymbol_triple` (computation): (y³ + 2x³, 2) = (1³), and y³ + 2x³ ∈ Y₂.
* `splittingTypeSet_zero` (degenerate): The zero form lies in no T_p(σ) and in W_p for every p.
* `notFundamentalSet_mem_pSq` (non-example): y³ + 4x³ has symbol (1³) at 2 but is not in Y₂ (it lies in W₂, since a ≡ 0 mod 4 and b ≡ 0 mod 2): the symbol alone does not decide maximality.
* `cubicSplittingSymbol_smul_example` (compatibility): For γ = [[0, 1], [1, 0]], γ(x²y) = −xy² and both have symbol (1²1).


#### Local specifications Σ = (Σ_p) ∪ Σ_∞ for cubic orders, acceptable and strongly acceptable collections, and local masses (`ST.3/acceptable-local-specifications-for-cubic-orders`)

A local specification for cubic orders is a collection Σ = (Σ_p)_p ∪ Σ_∞ where, for each prime p, Σ_p is a set of isomorphism classes of nondegenerate cubic rings over Z_p (orders in étale cubic Q_p-algebras; by Delone-Faddeev over Z_p, equivalently a GL₂(Z_p)-invariant set of binary cubic forms over Z_p of nonzero discriminant), and Σ_∞ ⊆ {R³, R ⊕ C}. An order R in a cubic field is a Σ-order if R ⊗ Z_p ∈ Σ_p for all p and R ⊗ R ∈ Σ_∞. Σ is acceptable if for all sufficiently large p, Σ_p contains every maximal cubic Z_p-order that is not totally ramified; it is strongly acceptable if for all sufficiently large p, Σ_p is one of: all nondegenerate cubic Z_p-orders, all maximal ones, or all maximal ones not totally ramified. The local mass of Σ_p is m_p(Σ_p) := Σ_{R ∈ Σ_p} 1/(Disc_p(R) · #Aut(R)), where Disc_p(R) = p^{v_p(Disc R)}; the archimedean mass is m_∞(Σ_∞) := Σ_{R ∈ Σ_∞} 1/#Aut(R) with #Aut(R³) = 6 and #Aut(R ⊕ C) = 2.

Pinned conventions and hypotheses:

* Isomorphism classes over Z_p, not over Q_p: several orders can lie in the same étale algebra
* Nondegenerate means nonzero discriminant; degenerate rings never occur as R ⊗ Z_p for an order R in a cubic field
* The infinite sum m_p over all nondegenerate orders converges (BST (57))

Construction:

1. Represent Σ_p as a GL₂(Z_p)-invariant subset of V_{Z_p} of forms of nonzero discriminant (Delone-Faddeev over Z_p, ST.1) and Σ_∞ as a subset of the two real orbits; the predicates are statements about all but finitely many p.
2. The three standard specifications: 'all orders' (Σ_p = everything, Σ_∞ = both), 'maximal' (Σ_p = the image of U_p, i.e. forms in U_p ⊗ Z_p) and 'maximal and not totally ramified' (Σ_p = the image of V_p); each is strongly acceptable, and strongly acceptable implies acceptable.

Where it is used:

* Bhargava-Shankar-Tsimerman, Theorem 8 and Theorem 31 (ArithmeticStatistics:ST.3/density-of-cubic-orders-with-local-specifications): the density of Σ-orders is (1/2) m_∞(Σ_∞) ∏_p (1 − 1/p) m_p(Σ_p).
* Bhargava-Shankar-Tsimerman, Theorem 7 (ArithmeticStatistics:ST.3/second-order-term-for-cubic-orders-with-local-specifications): strongly acceptable collections admit a second main term.
* Bhargava-Shankar-Wang, Theorem 2 (ArithmeticStatistics:ST.3/bhargava-shankar-wang-counts-over-number-fields): the degree-n analogue of acceptable local specifications.

API:

* `CubicLocalSpecification` (structure): A family Σ_p (p prime) of GL₂(Z_p)-invariant sets of binary cubic forms over Z_p of nonzero discriminant, and a subset Σ_∞ of {R³, R ⊕ C}.
* `CubicLocalSpecification.IsAcceptable` (other): For all sufficiently large p, the forms of V_p ⊗ Z_p (maximal, not totally ramified) lie in Σ_p.
* `CubicLocalSpecification.IsStronglyAcceptable` (other): For all sufficiently large p, Σ_p is all nondegenerate forms, the maximal ones, or the maximal not totally ramified ones.
* `CubicLocalSpecification.IsStronglyAcceptable.isAcceptable` (relation): Strongly acceptable implies acceptable.
* `CubicLocalSpecification.maximal` (constructor): The specification of maximal orders (all real types at ∞).
* `CubicLocalSpecification.nowhereTotallyRamified` (constructor): The specification of maximal orders not totally ramified at any p.
* `CubicLocalSpecification.localMass` (data): m_p(Σ_p) = Σ_{R ∈ Σ_p} 1/(Disc_p(R) #Aut(R)), as an element of [0, ∞].
* `CubicLocalSpecification.archimedeanMass` (data): m_∞(Σ_∞) = Σ_{R ∈ Σ_∞} 1/#Aut(R) ∈ {0, 1/6, 1/2, 2/3}.

Unit tests:

* `CubicLocalSpecification.maximal_isStronglyAcceptable` (characterisation): The maximal specification is strongly acceptable, hence acceptable.
* `CubicLocalSpecification.localMass_maximal` (computation): m_p(all maximal cubic Z_p-orders) = 1 + 1/p + 1/p².
* `CubicLocalSpecification.archimedeanMass_both` (computation): m_∞({R³, R ⊕ C}) = 1/6 + 1/2 = 2/3.
* `CubicLocalSpecification.archimedeanMass_empty` (degenerate): m_∞(∅) = 0, and then there are no Σ-orders.
* `CubicLocalSpecification.not_isAcceptable_totallyRamified` (non-example): The specification with Σ_p = {maximal totally ramified orders} for every p is not acceptable.


### The Davenport–Heilbronn count of cubic fields

Local densities first (BST Section 4), then the passage from maximal orders to fields (BST Section 3), then the sieve (BST Section 8.3). The counts of forms themselves are ST.2's.


#### The splitting symbol determines R(f)/(p), and for f ∈ U_p it is the splitting type of p in R(f) (`ST.3/splitting-symbol-determines-the-reduction-mod-p`)

For an integral binary cubic form f with f ≢ 0 (mod p) and cubic ring R(f) (ArithmeticStatistics:ST.1/delone-faddeev-parametrization-of-cubic-rings): (f, p) = (f₁^{e₁} f₂^{e₂} …) iff R(f)/pR(f) ≅ F_{p^{f₁}}[t₁]/(t₁^{e₁}) ⊕ F_{p^{f₂}}[t₂]/(t₂^{e₂}) ⊕ …. Consequently, if f ∈ U_p (R(f) maximal at p) and f is irreducible with R(f) ⊗ Q = K a cubic field, then (f, p) is the splitting type of p in K: (111) split, (12) one degree-1 and one degree-2 prime, (3) inert, (1²1) partially ramified, (1³) totally ramified.

Hypotheses and scope:

* f ≢ 0 (mod p)
* The comparison with the splitting of p in K needs R(f) ⊗ Z_p maximal, i.e. f ∈ U_p

Proof outline:

1. R(f)/pR(f) = R(f mod p), the cubic F_p-algebra of the reduction (the Delone-Faddeev construction commutes with base change Z → F_p, BST Section 2, last paragraph).
2. Both sides depend only on the GL₂(F_p)-orbit of f mod p; check the five orbits on representatives: xy(x − y) gives F_p³, x·q(x, y) with q irreducible gives F_p ⊕ F_{p²}, an irreducible cubic gives F_{p³}, x²y gives F_p[t]/(t²) ⊕ F_p, x³ gives F_p[t]/(t³); these are pairwise non-isomorphic algebras.
3. If R(f) ⊗ Z_p is the maximal order of K ⊗ Q_p, then R(f)/pR(f) = O_K/pO_K ≅ ⊕_{𝔭 | p} O_K/𝔭^{e(𝔭)}, and O_K/𝔭^{e} ≅ F_{p^{f(𝔭)}}[t]/(t^e) (Dedekind–Kummer; NumberFieldArithmetic Layer 1 splitting dictionary), so the symbol records (f(𝔭), e(𝔭)).

Checks:

* x²y: R/pR ≅ F_p[t]/(t²) ⊕ F_p, symbol (1²1).
* For f = x³ − x y² − y³ (the form of the discriminant −23 field) and p = 23, (f, 23) = (1²1): 23 is partially ramified, consistent with 23 ∥ Disc.
* The second half needs f ∈ U_p: a form p·g has no symbol at all, and f = y³ + 4x³ has (f, 2) = (1³) while R(f) is not maximal at 2 (f ∈ W₂), so R(f)/2R(f) is not O_K/2O_K.


#### Lemma 17: the p-adic densities of the sets T_p(σ) (`ST.3/densities-of-splitting-types`)

Let μ_p be the p-adic density on V_Z (the Haar measure of the p-adic closure in V_{Z_p} = Z_p⁴, total mass 1; for a set defined modulo p it is (number of residue classes mod p)/p⁴). Then μ_p(T_p(111)) = (1/6)(p − 1)² p (p + 1)/p⁴, μ_p(T_p(12)) = (1/2)(p − 1)² p (p + 1)/p⁴, μ_p(T_p(3)) = (1/3)(p − 1)² p (p + 1)/p⁴, μ_p(T_p(1²1)) = (p − 1) p (p + 1)/p⁴ and μ_p(T_p(1³)) = (p − 1)(p + 1)/p⁴.

Hypotheses and scope:

* p prime
* μ_p is the normalised additive Haar measure on Z_p⁴ (the density used in BST Theorem 26, supplied with that theorem by ArithmeticStatistics:ST.2)

Proof outline:

1. Membership in T_p(σ) depends only on f mod p, so μ_p(T_p(σ)) = #{f ∈ F_p⁴ : (f, p) = σ}/p⁴.
2. A nonzero binary cubic form over F_p is determined up to the p − 1 nonzero scalars by its zero divisor in P¹(F̄_p), a Frobenius-stable effective divisor of degree 3.
3. Count the divisors of each shape: unordered triples of distinct points of P¹(F_p): (p + 1)p(p − 1)/6; a point of P¹(F_p) plus a conjugate pair from P¹(F_{p²}) \ P¹(F_p): (p + 1)(p² − p)/2; a conjugate triple from P¹(F_{p³}) \ P¹(F_p): (p³ − p)/3; a double point and a different single point, both rational: (p + 1)p; a rational triple point: p + 1.
4. Multiply each count by p − 1 and divide by p⁴.

Checks:

* The five densities sum to (p⁴ − 1)/p⁴, the density of forms not ≡ 0 mod p: (p − 1)(p + 1)[(p − 1)p + p + 1] = (p² − 1)(p² + 1).
* At p = 2 the counts of forms are 1, 3, 2, 6, 3 (sum 15 = 2⁴ − 1).


#### Lemma 18: the p-adic densities of the sets U_p(σ) (`ST.3/densities-of-splitting-types-of-maximal-forms`)

U_p(111) = T_p(111), U_p(12) = T_p(12), U_p(3) = T_p(3); and μ_p(U_p(1²1)) = (p − 1)²(p + 1)/p⁴, μ_p(U_p(1³)) = (p − 1)²(p + 1)/p⁵. Equivalently, a proportion (p − 1)/p of the forms in T_p(1²1) and in T_p(1³) lie in U_p.

Hypotheses and scope:

* p prime; U_p is the Davenport-Heilbronn set of ST.1 (R(f) maximal at p iff f ∈ U_p)

Proof outline:

1. For σ ∈ {(111), (12), (3)} the discriminant is prime to p (f mod p is squarefree), so R(f) is maximal at p (an overring of index divisible by p would force p² | Disc); hence U_p(σ) = T_p(σ).
2. For σ ∈ {(1²1), (1³)} move the unique multiple zero of f mod p to (1 : 0) by an element of GL₂(Z); then a ≡ b ≡ 0 (mod p), and by the criterion of ST.1 the form fails to be maximal exactly when additionally a ≡ 0 (mod p²).
3. Among the forms of T_p(σ) put in this position, the condition a ≡ 0 (mod p²) cuts out a proportion 1/p (a mod p² is uniformly distributed among the p residues ≡ 0 mod p), and the normalisation is GL₂(Z)-equivariant, so μ_p(U_p(σ)) = ((p − 1)/p) μ_p(T_p(σ)); insert Lemma 17.

Checks:

* μ_p(U_p(1²1)) = ((p − 1)/p) · (p − 1)p(p + 1)/p⁴ = (p − 1)²(p + 1)/p⁴.
* μ_p(U_p(1³)) = ((p − 1)/p) · (p − 1)(p + 1)/p⁴.


#### Lemma 19: μ_p(U_p) = (p³ − 1)(p² − 1)/p⁵ and μ_p(V_p) = (p² − 1)²/p⁴ (`ST.3/densities-of-maximal-and-nowhere-totally-ramified-forms`)

μ_p(U_p) = (p³ − 1)(p² − 1)/p⁵ = (1 − p^{−2})(1 − p^{−3}) and μ_p(V_p) = (p² − 1)²/p⁴ = (1 − p^{−2})².

Hypotheses and scope:

* p prime

Proof outline:

1. U_p is the disjoint union of the U_p(σ) over the five symbols (a form ≡ 0 mod p is not in U_p) and V_p is the union over σ ≠ (1³).
2. Sum the densities of Lemma 18: (p − 1)²(p + 1)[p² + p + 1]/p⁵ = (p² − 1)(p³ − 1)/p⁵, and without the (1³) term (p − 1)²(p + 1)(p² + p)/p⁵ = (p² − 1)²/p⁴.

Checks:

* ∏_p μ_p(U_p) = ∏_p (1 − p^{−2})(1 − p^{−3}) = 1/(ζ(2)ζ(3)) and ∏_p μ_p(V_p) = 1/ζ(2)² = 36/π⁴ (Euler products).
* At p = 2: μ₂(U₂) = 21/32 and μ₂(V₂) = 9/16.


#### Maximal cubic domains are the rings of integers of cubic fields; the orbits in ∩_p U_p count cubic fields (`ST.3/maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields`)

Let f be an irreducible integral binary cubic form, so that R(f) is an order in the cubic field K = R(f) ⊗ Q (ArithmeticStatistics:ST.1/delone-faddeev-parametrization-of-cubic-rings). (a) R(f) is maximal (contained in no strictly larger cubic ring inside K) iff R(f) = O_K, iff R(f) is maximal at every prime p, iff f ∈ U := ∩_p U_p. (b) The map f ↦ R(f) ⊗ Q induces a bijection between GL₂(Z)-orbits of irreducible forms in U and Q-isomorphism classes of cubic fields, with Disc(f) = Disc(R(f)) = Disc(K); hence for every interval, N(U ∩ V_Z^{(i)}; X) (the number of irreducible GL₂(Z)-orbits in U with 0 < (−1)^i Disc < X) equals N₃(⊤; 0, X) for i = 0 and N₃(⊤; −X, 0) for i = 1. (c) For f ∈ U, p is totally ramified in K iff f ∈ T_p(1³); hence the irreducible orbits in V := ∩_p V_p correspond to the cubic fields in which no prime is totally ramified.

Hypotheses and scope:

* f irreducible over Q (equivalently R(f) is a domain, ST.1)
* V_Z^{(0)} and V_Z^{(1)} are the forms of positive and negative discriminant

Proof outline:

1. Every element of an order R ⊆ K is integral over Z (R is a finitely generated Z-module), so R ⊆ O_K; O_K is itself a cubic ring (free of rank 3), so a maximal order equals O_K, and conversely O_K is contained in no larger order.
2. R ⊆ O_K has finite index, and R = O_K iff no prime p divides [O_K : R], iff R ⊗ Z_p = O_K ⊗ Z_p for all p, i.e. R is maximal at every p; by the Davenport-Heilbronn criterion of ST.1 this holds iff f ∈ U_p for all p.
3. By Delone-Faddeev (ST.1), GL₂(Z)-orbits of forms correspond to isomorphism classes of cubic rings with Disc(f) = Disc(R(f)); restricting to orbits with R(f) ≅ O_K for a cubic field K gives a bijection with isomorphism classes of cubic fields (K ≅ K' iff O_K ≅ O_{K'}), and Disc(O_K) = NumberField.discr K.
4. Part (c) is ArithmeticStatistics:ST.3/splitting-symbol-determines-the-reduction-mod-p applied to f ∈ U_p.

Checks:

* The form x³ − x y² − y³ lies in U (its discriminant −23 is squarefree) and corresponds to the cubic field of discriminant −23.
* The form 4x³ + y³ lies in W₂ (a ≡ 0 mod 4, b ≡ 0 mod 2): R(f) = Z[∛4], of index 2 in O_{Q(∛2)} = Z[∛2], with Disc −432 = 2²·(−108); its orbit is not counted by N(U; X).
* The irreducible orbits in U with |Disc| < 50 are exactly four, of discriminants −23, −31, −44 and 49, matching the four cubic fields with |Disc| < 50.


#### The Davenport-Heilbronn theorem: N₃(0, X) ~ X/(12ζ(3)) and N₃(−X, 0) ~ X/(4ζ(3)) (`ST.3/davenport-heilbronn-count-of-cubic-fields`)

Let N₃(ξ, η) = N₃(⊤; ξ, η) be the number of cubic fields K up to isomorphism with ξ < Disc(K) < η (ArithmeticStatistics:ST.3/number-field-counting-function, n = 3, no Galois-group restriction: cyclic cubic fields are included). Then N₃(0, X) = X/(12ζ(3)) + o(X) and N₃(−X, 0) = X/(4ζ(3)) + o(X) as X → ∞. More precisely, for i ∈ {0, 1} with n₀ = 6 = #Aut_R(R³) and n₁ = 2 = #Aut_R(R ⊕ C), lim_{X→∞} N(U ∩ V_Z^{(i)}; X)/X = (π²/(12 n_i)) ∏_p (1 − p^{−2})(1 − p^{−3}) = 1/(2 n_i ζ(3)). The same method gives, for any finite set of primes and prescribed splitting types at them, the count multiplied by the product of the corresponding relative local densities (the finite-condition case of ArithmeticStatistics:ST.3/density-of-cubic-orders-with-local-specifications).

Hypotheses and scope:

* The count is by isomorphism classes of fields, ordered by the signed discriminant; the total is N₃(X) ~ X/(3ζ(3))
* Cyclic cubic fields are included but number O(X^{1/2}) (every ramified prime is totally ramified, so Disc = f² with f the conductor), so the same asymptotic holds for S₃-cubic fields
* The error term is only o(X); power savings are in the second-order node ArithmeticStatistics:ST.3/roberts-second-order-term-for-cubic-fields

Proof outline:

1. By ArithmeticStatistics:ST.3/maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields, N₃(0, X) = N(U ∩ V_Z^{(0)}; X) and N₃(−X, 0) = N(U ∩ V_Z^{(1)}; X), where N(S; X) counts irreducible GL₂(Z)-orbits in S with |Disc| < X and U = ∩_p U_p.
2. Upper bound: for every Y, ∩_{p<Y} U_p is defined by congruence conditions modulo ∏_{p<Y} p², so the congruence-condition count of binary cubic forms (BST Theorem 26, supplied by ArithmeticStatistics:ST.2) gives lim_{X} N(∩_{p<Y} U_p ∩ V_Z^{(i)}; X)/X = (π²/(12 n_i)) ∏_{p<Y} μ_p(U_p); since U ⊆ ∩_{p<Y} U_p, limsup_X N(U ∩ V_Z^{(i)}; X)/X ≤ (π²/(12 n_i)) ∏_{p<Y} (1 − p^{−2})(1 − p^{−3}) (ArithmeticStatistics:ST.3/densities-of-maximal-and-nowhere-totally-ramified-forms); let Y → ∞.
3. Lower bound: ∩_{p<Y} U_p ⊆ U ∪ ∪_{p≥Y} W_p with W_p = V_Z \ U_p, so N(U ∩ V_Z^{(i)}; X) ≥ N(∩_{p<Y} U_p ∩ V_Z^{(i)}; X) − Σ_{p≥Y} N(W_p; X); the uniformity estimate N(W_p; X) = O(X/p²) with a constant independent of p (BST Proposition 29, nonmaximal part, supplied by ArithmeticStatistics:ST.2) bounds the tail by O(X Σ_{p≥Y} p^{−2}) = O(X/Y). Hence liminf ≥ (π²/(12 n_i)) ∏_{p<Y} (1 − p^{−2})(1 − p^{−3}) − O(1/Y); let Y → ∞.
4. Evaluate the constant: ∏_p (1 − p^{−2}) = 1/ζ(2) = 6/π² and ∏_p (1 − p^{−3}) = 1/ζ(3) (Euler product, riemannZeta_eulerProduct_tprod; ζ(2) = π²/6, riemannZeta_two), so (π²/(12 n_i)) · (6/π²)/ζ(3) = 1/(2 n_i ζ(3)); with n₀ = 6, n₁ = 2 this is 1/(12ζ(3)) and 1/(4ζ(3)). The values n₀, n₁ are the orders of the GL₂(R)-stabilizers of forms of positive and negative discriminant (Aut_R(R³) = S₃ and Aut_R(R ⊕ C) = Z/2), supplied with the count of ST.2.

Checks:

* Total: N₃(X) = N₃(0, X) + N₃(−X, 0) ~ (1/(12ζ(3)) + 1/(4ζ(3))) X = X/(3ζ(3)) ≈ 0.2773 X.
* Ratio: asymptotically three times as many complex cubic fields as totally real ones (n₀/n₁ = 3).
* The count is by fields, not orders: the order count of BST Theorem 6 has the larger constants π²/72 and π²/24; the ratio (π²/(12 n_i))/(1/(2n_i ζ(3))) = ζ(2)ζ(3) = ∏_p μ_p(U_p)^{−1}.


### Quadratic fields and the mean of 3-torsion

The class-field-theory correspondence of BST Sections 8.1 and 8.5, the uniformity for totally ramified primes, the count of quadratic fields, and the Davenport–Heilbronn theorem on 3-torsion.


#### A cubic field is nowhere totally ramified iff its Galois closure is unramified over the quadratic resolvent field; then Disc(K₃) = Disc(K₂) (`ST.3/nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent`)

Let K₃ be a cubic field. (a) If K₃ is nowhere totally ramified (no prime p has p O_{K₃} = 𝔭³), then K₃ is not Galois (an S₃-cubic field). (b) For an S₃-cubic field K₃ with Galois closure K₆ and quadratic resolvent K₂ ⊆ K₆ (the fixed field of A₃ = Gal(K₆/K₂); K₂ = Q(√Disc(K₃))), the extension K₆/K₂ is unramified at all finite primes iff K₃ is nowhere totally ramified, and in that case Disc(K₃) = Disc(K₂). (c) Conversely, if K₂ is a quadratic field and L/K₂ is an unramified cyclic cubic extension that is Galois over Q with Gal(L/Q) ≅ S₃, then each of the three conjugate cubic subfields of L is nowhere totally ramified and has discriminant Disc(K₂). (The archimedean places impose no condition: a cubic extension is unramified at infinity.)

Hypotheses and scope:

* 'Unramified' is at finite primes; the degree 3 of K₆/K₂ is odd, so infinite places are automatically unramified
* K₂ is Q(√Disc(K₃)): √Disc(K₃) generates the fixed field of A₃ in K₆
* Disc(K₃) ∈ Disc(K₂)·(Q^×)² always; equality needs the nowhere-totally-ramified hypothesis

Proof outline:

1. (a) A cyclic cubic field has Disc = f² with f its conductor and every ramified prime totally ramified (inertia groups are subgroups of Z/3Z); a field with no ramified prime would be an unramified extension of Q, which does not exist (Minkowski, |Disc| > 1: NumberField.abs_discr_gt_two); so a nowhere totally ramified cubic field is S₃.
2. (b) For a prime 𝔓 of K₆ over p with inertia group I ≤ S₃ acting on the three embeddings of K₃: the ramification indices of the primes of K₃ above p are the orbit lengths of I on {1, 2, 3} (Galois correspondence for inertia groups; NumberFieldArithmetic Layer 6 and LocalFieldsRamification Layer 3). p is totally ramified in K₃ iff I acts transitively iff 3 divides #I iff I ∩ A₃ ≠ 1 iff 𝔓 ∩ K₂ ramifies in K₆/K₂ (the inertia group of K₆/K₂ at 𝔓 is I ∩ A₃).
3. Discriminant equality: at a prime p not totally ramified in K₃, K₃ ⊗ Q_p is either unramified (both discriminants prime to p; in the case (12) p is inert in K₂ but unramified) or Q_p × F with F/Q_p a ramified quadratic extension, and then K₂ ⊗ Q_p ≅ F (the discriminant algebra of Q_p × F is F), so v_p(Disc K₃) = v_p(disc F) = v_p(Disc K₂); the signs agree because Disc(K₃)/Disc(K₂) is a square. Hence Disc(K₃) = Disc(K₂).
4. (c) The three cubic subfields of L are the fixed fields of the three transpositions; they are conjugate, and by (b) applied to L = K₆ they are nowhere totally ramified with discriminant Disc(K₂).

Checks:

* For K₃ the field of x³ − x − 1 (Disc −23): K₂ = Q(√−23), and K₆ is the Hilbert class field of Q(√−23) (class number 3); 23 is partially ramified in K₃.
* The cyclic cubic field of discriminant 49 is totally ramified at 7 and is excluded, consistent with (a).
* Q(∛2) (Disc −108 = −2²·3³) is totally ramified at 2 and 3, K₂ = Q(√−3) with Disc −3 ≠ −108.


#### Hasse's correspondence: the nowhere totally ramified cubic fields with resolvent K₂ number (h₃(K₂) − 1)/2 (`ST.3/three-torsion-of-quadratic-class-groups-counts-cubic-fields`)

For every quadratic field K₂, the number of isomorphism classes of cubic fields K₃ that are nowhere totally ramified and whose quadratic resolvent is K₂ (equivalently, by ArithmeticStatistics:ST.3/nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent, with Disc(K₃) = Disc(K₂)) equals (h₃(K₂) − 1)/2, where h₃(K₂) = #Cl(K₂)[3]. Consequently, for i ∈ {0, 1}, Σ_{0<(−1)^i Disc(K₂)<X} (h₃(K₂) − 1)/2 = N(V ∩ V_Z^{(i)}; X), the number of irreducible GL₂(Z)-orbits in V = ∩_p V_p with 0 < (−1)^i Disc < X.

Hypotheses and scope:

* The count is of fields up to isomorphism; each such field has three conjugate embeddings, all with the same resolvent
* h₃ is the wide class group's 3-torsion (Mathlib ClassGroup); for p = 3 wide and narrow class groups have the same 3-part
* The sign condition matches: Disc(K₃) = Disc(K₂), so real quadratic resolvents correspond to totally real cubic fields (positive discriminant)

Proof outline:

1. Class field theory (ClassFieldTheory Layer 13, gal_hilbertClassField_equiv_classGroup): unramified abelian extensions of K₂ inside a fixed algebraic closure correspond to subgroups of Cl(K₂), and unramified cyclic cubic extensions L/K₂ to subgroups of index 3; a finite abelian group A has (#A[3] − 1)/2 subgroups of index 3 (they correspond to the lines of the F₃-vector space Hom(A, Z/3Z), which has #A[3] elements).
2. Each such L is Galois over Q (its norm subgroup is stable under Gal(K₂/Q), whose generator σ acts on Cl(K₂) by c ↦ c^{−1}, because c·σ(c) is the class of the ideal norm to Q, which is principal), and Gal(L/Q) ≅ Z/3Z ⋊ Z/2Z with σ acting by inversion, i.e. S₃.
3. By the resolvent lemma, the three cubic subfields of such an L form one isomorphism class of nowhere totally ramified cubic fields with resolvent K₂, and conversely the Galois closure of such a K₃ is such an L; distinct L give non-isomorphic cubic fields (L is the Galois closure). Hence the count is (h₃(K₂) − 1)/2.
4. Summing over K₂ with 0 < (−1)^i Disc(K₂) < X and using ArithmeticStatistics:ST.3/maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields (c) (irreducible orbits in V ↔ nowhere totally ramified cubic fields, Disc preserved) gives the displayed identity (BST (59)).

Checks:

* K₂ = Q(√−23): h₃ = 3, so exactly one nowhere totally ramified cubic field has discriminant −23 (the field of x³ − x − 1).
* K₂ = Q(√−3), Q(i): h₃ = 1, so no cubic field has discriminant −3 or −4.
* K₂ = Q(√229) (class number 3): exactly one cubic field of discriminant 229, the totally real field of x³ − 4x + 1.


#### Uniformity for totally ramified primes: the cubic fields with |Disc| < X totally ramified at p number O(X/p²), uniformly in p (`ST.3/cubic-fields-totally-ramified-at-large-primes-are-sparse`)

There is an absolute constant C such that for every prime p and every X ≥ 1, the number of cubic fields K (up to isomorphism) with |Disc(K)| < X in which p is totally ramified is at most C X/p². Equivalently N(Y_p ∩ U; X) ≤ C X/p², where U = ∩_q U_q. This is the part of BST Proposition 29 (N(Z_p; X) = O(X/p²)) concerning totally ramified primes, restricted to maximal forms, which is all the sieve for the mean of 3-torsion uses: ∩_{p<Y} V_p ⊆ V ∪ ∪_{q≥Y} W_q ∪ ∪_{p≥Y} (Y_p ∩ U).

Hypotheses and scope:

* The constant is uniform in p; this is what licenses the sieve over infinitely many primes in the proof of the mean of 3-torsion
* Only the maximal (field) part of Y_p is bounded here; a form in Y_p that is not maximal at another prime q lies in W_q and is covered by the nonmaximal estimate of ST.2

Proof outline:

1. Cyclic cubic fields: Disc(K) = f² with p | f when p is totally ramified, and a cyclic cubic field is determined by its conductor f up to at most 2^{ω(f)} choices, so there are O(X^{1/2+ε}/p) of them with |Disc| < X; this is O(X/p²) for p² ≤ X, and there are none for p² > X.
2. S₃-cubic fields: for K with quadratic resolvent K₂ of discriminant D₂, the Galois closure K₆ is a cyclic cubic extension of K₂ on whose group Gal(K₂/Q) acts by inversion, hence K₆ lies in the ring class field of an order O_f of K₂ (ClassFieldTheory Layer 13, ringClassField and gal_ringClassField_equiv_pic), and Disc(K) = D₂ f² with f the conductor; by the inertia argument of the resolvent lemma a prime p ≥ 5 is totally ramified in K iff p | f.
3. For fixed K₂ and f, the cubic fields with resolvent K₂ and conductor f correspond to some of the index-3 subgroups of Pic(O_f) (quadratic orders and their Picard groups: GlobalNumberFields Layer 11), so there are at most #Pic(O_f)[3]; from the exact sequence 1 → (O_{K₂}/f)^×/((Z/f)^× O_{K₂}^×) → Pic(O_f) → Cl(K₂) → 1, whose kernel has 3-rank at most ω(f) + 2, #Pic(O_f)[3] ≤ 3^{ω(f)+2} h₃(K₂).
4. Σ_{0<|D₂|<Y} h₃(K₂) = O(Y): by ArithmeticStatistics:ST.3/three-torsion-of-quadratic-class-groups-counts-cubic-fields, Σ (h₃(K₂) − 1)/2 counts nowhere totally ramified cubic fields with |Disc| < Y, which is at most the number M₃(Y) = O(Y) of orders in cubic fields (BST Theorem 6, from ST.2), and the number of K₂ is O(Y).
5. Summing over f divisible by p and K₂ with |D₂| < X/f²: the count is O(X Σ_{p|f} 3^{ω(f)} f^{−2}) ≤ O(3X p^{−2} Σ_{g≥1} 3^{ω(g)} g^{−2}) = O(X/p²), the series converging. The primes p = 2, 3 are covered by the trivial bound N₃(X) = O(X) with a fixed constant.

Checks:

* Summed over p ≥ Y the bound is O(X/Y), the tail estimate used in the sieve for V = ∩_p V_p.
* For p = 5 the fields counted include Q(∛5) (Disc −675 = −3³·5², O = Z[∛5]) in which 5 is totally ramified.
* The bound is sharp in order: by the congruence count of ST.2 and Lemma 18, a proportion μ_p(U_p(1³))/μ_p(U_p) ≍ p^{−2} of cubic fields is totally ramified at p.


#### Squarefree integers in each nonzero residue class modulo 4 have density 2/π² (`ST.3/squarefree-integers-in-residue-classes-modulo-four`)

For a ∈ {1, 2, 3} and x ≥ 1, #{1 ≤ n ≤ x : n squarefree, n ≡ a (mod 4)} = (2/π²) x + O(√x), with an absolute implied constant.

Hypotheses and scope:

* The residue class a = 0 contains no squarefree integers
* The error O(√x) is not optimised

Proof outline:

1. Squarefree detection: for n ≥ 1, write n = b² m with m squarefree (Nat.sq_mul_squarefree_of_pos); then d² | n iff d | b, so Σ_{d² | n} μ(d) = Σ_{d | b} μ(d) = [b = 1] = [n squarefree] (ArithmeticFunction.coe_zeta_mul_coe_moebius).
2. For odd a: an n ≡ a (mod 4) is odd, so only odd d contribute, and #{n ≤ x : n ≡ a (4), d² | n} = x/(4d²) + O(1) for odd d (CRT, d² and 4 coprime). Summing over odd d ≤ √x: (x/4) Σ_{d odd} μ(d)/d² + O(√x) + O(x Σ_{d>√x} d^{−2}) = (x/4) ∏_{p>2} (1 − p^{−2}) + O(√x).
3. ∏_{p>2} (1 − p^{−2}) = (1/ζ(2))/(1 − 1/4) = (6/π²)(4/3) = 8/π² (ArithmeticFunction.LSeries_zeta_mul_Lseries_moebius and ArithmeticFunction.LSeries_zeta_eq_riemannZeta at s = 2, riemannZeta_two, and the Euler factor at 2), so the count is (2/π²) x + O(√x).
4. For a = 2: n = 2m with m ≤ x/2 odd squarefree; the odd squarefree m ≤ y number (4/π²) y + O(√y) (sum of the two odd classes), giving (2/π²) x + O(√x).

Checks:

* Sum over a = 1, 2, 3: (6/π²) x + O(√x), the classical density of squarefree integers.
* Numerical check: there are 608 squarefree n ≤ 1000 (200, 204 and 204 in the classes 1, 2 and 3 mod 4), and 6000/π² ≈ 607.9, 2000/π² ≈ 202.6.


#### The number of quadratic fields with 0 < ±Disc < X is 3X/π² + O(√X) (`ST.3/count-of-quadratic-fields`)

N₂(⊤; 0, X) = (3/π²) X + O(√X) and N₂(⊤; −X, 0) = (3/π²) X + O(√X). Equivalently, the number of fundamental discriminants D ≠ 1 (Int.IsFundamentalDiscr) with 0 < D < X, respectively −X < D < 0, is (3/π²) X + O(√X).

Hypotheses and scope:

* Quadratic fields are counted up to isomorphism (each has one subfield of Q̄ and #Aut = 2); the weighted count of BSW is half of this
* D = 1 (the discriminant of Q) is excluded

Proof outline:

1. Quadratic fields up to isomorphism correspond bijectively to fundamental discriminants D ≠ 1 via K ↦ Disc(K): every quadratic field is Q(√d) with d ≠ 1 squarefree, Disc(Q(√d)) = d if d ≡ 1 (mod 4) and 4d otherwise (Tau Ceti NumberField.discr_eq_of_squarefree_of_mod_four_eq_one and NumberField.discr_eq_four_mul_of_mod_four_ne_one), these values are exactly the fundamental discriminants ≠ 1 (Int.isFundamentalDiscr_iff_squarefree), and Q(√d) ≅ Q(√d') iff d = d' for squarefree d, d'.
2. Count positive fundamental discriminants: D = n ≡ 1 (mod 4) squarefree, n < X (n ≠ 1): (2/π²) X + O(√X); D = 4m with m ≡ 2, 3 (mod 4) squarefree, m < X/4: (4/π²)(X/4) + O(√X). Total (3/π²) X + O(√X) (ArithmeticStatistics:ST.3/squarefree-integers-in-residue-classes-modulo-four).
3. Negative: D = −n with n ≡ 3 (mod 4) squarefree, n < X: (2/π²) X; D = −4m with m ≡ 1, 2 (mod 4) squarefree (so −m ≡ 3, 2), m < X/4: (4/π²)(X/4). Total (3/π²) X + O(√X).

Checks:

* Small values: the negative fundamental discriminants in (−25, 0) are −3, −4, −7, −8, −11, −15, −19, −20, −23, −24, i.e. N₂(⊤; −25, 0) = 10, against 3·25/π² ≈ 7.6.
* Both signs together: (6/π²) X, agreeing with Wood's Tauberian count N_{S₂}(X) ~ (6/π²) X.
* This is the denominator of the Davenport-Heilbronn mean of 3-torsion; it is 3/π², not 6/π², per sign (sourceIssue ArithmeticStatistics/E402).


#### The Davenport-Heilbronn theorem on 3-torsion: the mean of #Cl(K)[3] is 4/3 over real and 2 over imaginary quadratic fields (`ST.3/davenport-heilbronn-mean-of-three-torsion`)

Σ_{0<Disc(K)<X} h₃(K) = (4/3) Σ_{0<Disc(K)<X} 1 + o(X) and Σ_{−X<Disc(K)<0} h₃(K) = 2 Σ_{−X<Disc(K)<0} 1 + o(X), the sums over quadratic fields K up to isomorphism ordered by discriminant, h₃(K) = #Cl(K)[3]. Equivalently lim_{X→∞} (Σ_{0<±Disc(K)<X} h₃(K)) / N₂(⊤; 0 < ±Disc < X) = 4/3 (real) and 2 (imaginary).

Hypotheses and scope:

* Quadratic fields are ordered by |Disc| and weighted equally; the averages are over all quadratic fields of the given sign
* The proof sieves to V = ∩_p V_p, defined by infinitely many congruence conditions, and needs the uniform tail bound for Z_p = W_p ⊔ Y_p
* No Cohen-Lenstra hypothesis is used; the theorem is the case p = 3, α = 1 of the moment prediction ArithmeticStatistics:ST.3/cohen-lenstra-moment-prediction, which it confirms

Proof outline:

1. By ArithmeticStatistics:ST.3/three-torsion-of-quadratic-class-groups-counts-cubic-fields, Σ_{0<(−1)^i Disc(K)<X} (h₃(K) − 1)/2 = N(V ∩ V_Z^{(i)}; X).
2. The sieve of the proof of ArithmeticStatistics:ST.3/davenport-heilbronn-count-of-cubic-fields with V_p in place of U_p: the upper bound from the congruence count over ∩_{p<Y} V_p (ST.2) and μ_p(V_p) = (1 − p^{−2})² (ArithmeticStatistics:ST.3/densities-of-maximal-and-nowhere-totally-ramified-forms); the lower bound from ∩_{p<Y} V_p ⊆ V ∪ ∪_{p≥Y} (W_p ∪ Y_p), the nonmaximal bound N(W_p; X) = O(X/p²) (ST.2) and ArithmeticStatistics:ST.3/cubic-fields-totally-ramified-at-large-primes-are-sparse. Hence lim N(V ∩ V_Z^{(i)}; X)/X = (π²/(12 n_i)) ∏_p (1 − p^{−2})² = (π²/(12 n_i))(36/π⁴) = 3/(n_i π²).
3. By ArithmeticStatistics:ST.3/count-of-quadratic-fields, Σ_{0<±Disc<X} 1 ~ 3X/π².
4. Therefore the mean of h₃ is 1 + 2 · (3/(n_i π²))/(3/π²) = 1 + 2/n_i: 1 + 2/6 = 4/3 for i = 0 (positive discriminant, real quadratic) and 1 + 2/2 = 2 for i = 1 (imaginary).

Checks:

* Imaginary: mean h₃ = 2, i.e. the mean number of surjections Cl(K) → Z/3Z (which is h₃ − 1) is 1; real: mean 4/3, i.e. 1/3 surjections on average — the Cohen-Lenstra predictions |A|^0 and |A|^{−1} for A = Z/3Z.
* Small-range sanity check (not a test of the limit): among the 10 imaginary quadratic fields with |Disc| < 25 only Q(√−23) has h₃ = 3, giving an average 6/5.
* The sieve cannot be run with a pointwise density at each prime alone: without the uniform bound for Y_p (totally ramified primes, via class field theory) only the upper bound follows.


### Local specifications

BST Theorem 8 counts orders with prescribed local behaviour at every place; its constant is a product of local masses.


#### Lemma 32: the p-adic density of the forms whose ring lies in Σ_p is #GL₂(F_p)/p⁴ · Σ_{R ∈ Σ_p} 1/(Disc_p(R) #Aut(R)) (`ST.3/p-adic-density-of-a-local-specification`)

For a prime p and a set Σ_p of isomorphism classes of nondegenerate cubic rings over Z_p, the set S_p(Σ_p) := {x ∈ V_{Z_p} : R(x) ∈ Σ_p} has Haar measure μ_p(S_p(Σ_p)) = (#GL₂(F_p)/p⁴) Σ_{R ∈ Σ_p} 1/(Disc_p(R) · #Aut_{Z_p}(R)) = (1 − p^{−2})(1 − p^{−1}) m_p(Σ_p), with μ_p normalised to give V_{Z_p} measure 1.

Hypotheses and scope:

* p prime; Σ_p consists of nondegenerate rings (each GL₂(Z_p)-orbit then has positive measure)
* Aut is the automorphism group of R as a Z_p-algebra, equal to the GL₂(Z_p)-stabilizer of a corresponding form (Delone-Faddeev over Z_p, ST.1)

Proof outline:

1. By Delone-Faddeev over Z_p, S_p(Σ_p) is the disjoint union over R ∈ Σ_p of the GL₂(Z_p)-orbits GL₂(Z_p)·v_R, with Stab(v_R) ≅ Aut(R).
2. |Disc(x)|_p^{−1} dx is a GL₂(Q_p)-invariant measure on V_{Z_p}; with Haar measure dg on GL₂(Z_p) normalised to total mass #GL₂(F_p), the orbit map g ↦ g·v_R is #Aut(R)-to-1 and the Jacobian identity ∫_{GL₂(Z_p)·v_R} dx = c · |Disc(v_R)|_p · #GL₂(F_p)/#Aut(R) holds with c = p^{−4} independent of v_R (a Jacobian computation with an indeterminate v_R). This p-adic change of variables is requested from AnalyticNumberTheory:AN.8.
3. Sum over R ∈ Σ_p; #GL₂(F_p) = (p² − 1)(p² − p) (Matrix.card_GL_field).

Checks:

* Σ_p = all maximal orders: (p² − 1)(p² − p)p^{−4}(1 + 1/p + 1/p²) = (p³ − 1)(p² − 1)/p⁵ = μ_p(U_p), agreeing with Lemma 19.
* Σ_p = all nondegenerate orders: the density is 1, which gives BST (57).
* Σ_p = {Z_p³}: #Aut = 6, Disc_p = 1, density (p² − 1)(p² − p)/(6p⁴) = μ_p(T_p(111)) (Lemma 17).


#### BST Theorem 8: the number of Σ-orders of bounded discriminant for an acceptable Σ (`ST.3/density-of-cubic-orders-with-local-specifications`)

Let Σ = (Σ_p) ∪ Σ_∞ be an acceptable collection of local specifications (ArithmeticStatistics:ST.3/acceptable-local-specifications-for-cubic-orders) and N₃(Σ; X) the number of isomorphism classes of orders R in cubic fields with R ⊗ Z_p ∈ Σ_p for all p, R ⊗ R ∈ Σ_∞ and |Disc(R)| < X. Then N₃(Σ; X) = (1/2)(Σ_{R∈Σ_∞} 1/#Aut(R)) · ∏_p ((p − 1)/p · Σ_{R∈Σ_p} 1/(Disc_p(R) #Aut(R))) · X + o(X). Equivalently (BST Theorem 31), for S(Σ, i) the irreducible forms of V_Z^{(i)} whose ring is a Σ-order, lim_X N(S(Σ, i); X)/X = (1/(2 n_i)) ∏_p (p − 1)/p · m_p(Σ_p).

Hypotheses and scope:

* Σ must be acceptable; the condition at p is on R ⊗ Z_p (the printed Theorem 8 says R ⊗ Q_p, a misprint: sourceIssue ArithmeticStatistics/E406)
* The count is of orders, not fields; fields are the case Σ_p = maximal for all p
* The Euler product converges because Σ is acceptable (the p-factor is 1 + O(p^{−2}) for large p)

Proof outline:

1. For each Y, ∩_{p<Y} S_p(Σ_p) is defined by finitely many congruence conditions (each Σ_p-condition is determined modulo a power of p because orbits of nondegenerate forms are open), so the congruence-condition count of ST.2 (BST Theorem 26) gives the limit (π²/(12 n_i)) ∏_{p<Y} μ_p(S_p(Σ_p)) for the forms satisfying the conditions at p < Y.
2. Acceptability: for p ≥ Y (Y large) the forms violating Σ_p lie in Z_p = W_p ⊔ Y_p, whose count is O(X/p²) uniformly (BST Proposition 29: W_p from ST.2; the maximal part of Y_p from ArithmeticStatistics:ST.3/cubic-fields-totally-ramified-at-large-primes-are-sparse; the remaining non-maximal part of Y_p from the uniform tail estimates of ST.2), so the sieve of the proof of Theorem 1 applies verbatim.
3. Insert Lemma 32: π²/(12 n_i) ∏_p μ_p(S_p(Σ_p)) = π²/(12 n_i) ∏_p (1 − p^{−2})((p − 1)/p) m_p(Σ_p) = (1/(2 n_i)) ∏_p ((p − 1)/p) m_p(Σ_p), using ∏_p (1 − p^{−2}) = 6/π².
4. Sum over i ∈ Σ_∞ with 1/n_i = 1/#Aut(R) for R = R³ (i = 0) or R ⊕ C (i = 1).

Checks:

* Σ_p = all maximal, Σ_∞ = {R³}: (1/12) ∏_p (1 − 1/p)(1 + 1/p + 1/p²) = 1/(12ζ(3)), Theorem 1.
* Σ_p = all nondegenerate orders: (1/(2n_i)) ∏_p (1 − p^{−2})^{−1} = ζ(2)/(2 n_i) = π²/(12 n_i), i.e. π²/72 and π²/24 (BST Theorem 6 main term).
* Σ_p = maximal not totally ramified: (1/(2n_i)) ∏_p (1 − 1/p)(1 + 1/p) = 3/(n_i π²), the count used for Theorem 2.


### Second main terms

The second main terms of Bhargava–Shankar–Tsimerman are targets of this layer, stated with their exact constants; their proofs (BST Sections 6, 7 and 9) consume the second-order count of binary cubic forms under congruence conditions (BST Theorem 27), which sits with ST.2's uniform lattice counts.


#### BST Theorem 3 (Roberts' conjecture): the second main term in the count of cubic fields (`ST.3/roberts-second-order-term-for-cubic-fields`)

N₃(0, X) = X/(12ζ(3)) + (4ζ(1/3)/(5Γ(2/3)³ζ(5/3))) X^{5/6} + O_ε(X^{5/6−1/48+ε}) and N₃(−X, 0) = X/(4ζ(3)) + (√3 · 4ζ(1/3)/(5Γ(2/3)³ζ(5/3))) X^{5/6} + O_ε(X^{5/6−1/48+ε}), for every ε > 0.

Hypotheses and scope:

* The second main term has order X^{5/6}; the error O_ε(X^{5/6−1/48+ε}) is a power saving over it
* The proof (BST Sections 6, 7 and 9: slicing and smoothing in the cusp, second-order p-adic densities, and a refined sieve over three ranges of n) is a target of this layer

Proof outline:

1. Count forms in dyadic ranges of the discriminant with the second-order count of binary cubic forms satisfying finitely many congruence conditions (BST Theorem 27, the congruence version of the Davenport-Shintani count; uniform lattice counts of ST.2).
2. Compute the second-order p-adic densities μ₂(σ, p), μ₂(p), μ₂'(p) (BST Section 7) and the second-order local masses (BST Lemma 37).
3. Sieve with the Möbius identities (61)-(62) over squarefree n, splitting n into three ranges: Theorem 27 with the identities of BST Proposition 33 for small n, the uniformity estimates of Belabas-Bhargava-Pomerance for large n, and an equidistribution argument (BST Section 9.4) for n near X^{1/6}.

Checks:

* The second-term constant is negative (ζ(1/3) < 0), explaining the poor early numerical agreement with Theorem 1 noted in BST Section 1.
* The ratio of the X^{5/6} coefficients (negative : positive discriminant) is √3, while the ratio of main terms is 3.


#### BST Theorem 4: the second main term in the sum of #Cl(K)[3] over quadratic fields (`ST.3/second-order-term-for-the-mean-of-three-torsion`)

Σ_{0<D<X} #Cl₃(D) = (4/3) Σ_{0<D<X} 1 + (8ζ(1/3)/(5Γ(2/3)³)) ∏_p (1 − (p^{1/3} + 1)/(p(p + 1))) X^{5/6} + O_ε(X^{5/6−1/48+ε}) and Σ_{−X<D<0} #Cl₃(D) = 2 Σ_{−X<D<0} 1 + (√3 · 8ζ(1/3)/(5Γ(2/3)³)) ∏_p (1 − (p^{1/3} + 1)/(p(p + 1))) X^{5/6} + O_ε(X^{5/6−1/48+ε}), the sums over fundamental discriminants D of quadratic fields.

Hypotheses and scope:

* The second main term has order X^{5/6}; the error O_ε(X^{5/6−1/48+ε}) is a power saving over it
* The proof (BST Sections 6, 7 and 9: slicing and smoothing in the cusp, second-order p-adic densities, and a refined sieve over three ranges of n) is a target of this layer

Proof outline:

1. Count forms in dyadic ranges of the discriminant with the second-order count of binary cubic forms satisfying finitely many congruence conditions (BST Theorem 27, the congruence version of the Davenport-Shintani count; uniform lattice counts of ST.2).
2. Compute the second-order p-adic densities μ₂(σ, p), μ₂(p), μ₂'(p) (BST Section 7) and the second-order local masses (BST Lemma 37).
3. Sieve with the Möbius identities (61)-(62) over squarefree n, splitting n into three ranges: Theorem 27 with the identities of BST Proposition 33 for small n, the uniformity estimates of Belabas-Bhargava-Pomerance for large n, and an equidistribution argument (BST Section 9.4) for n near X^{1/6}.

Checks:

* The Euler product ∏_p (1 − (p^{1/3} + 1)/(p(p + 1))) converges absolutely (the p-term is 1 + O(p^{−5/3})).
* The main terms are Theorem 2's constants 4/3 and 2 times the quadratic-field counts.


#### BST Theorem 7: two main terms for Σ-orders with a strongly acceptable Σ (`ST.3/second-order-term-for-cubic-orders-with-local-specifications`)

Let Σ = (Σ_p) ∪ Σ_∞ be strongly acceptable. For a free Z_p-module M put M^{Prim} := M \ pM. Then N₃(Σ; X) = (1/2)(Σ_{R∈Σ_∞} 1/#Aut(R)) ∏_p ((p − 1)/p · Σ_{R∈Σ_p} 1/(Disc_p(R) #Aut(R))) X + (1/ζ(2))(Σ_{R∈Σ_∞} c₂(R)) ∏_p ((1 − p^{−1/3}) Σ_{R∈Σ_p} (1/(Disc_p(R) #Aut(R))) ∫_{(R/Z_p)^{Prim}} i(x)^{2/3} dx) X^{5/6} + O_ε(X^{5/6−1/48+ε}), where i(x) is the index of Z_p[x] in R, dx gives (R/Z_p)^{Prim} measure 1, and c₂(R³) = √3 ζ(2/3)Γ(1/3)(2π)^{1/3}/(30Γ(2/3)), c₂(R ⊕ C) = ζ(2/3)Γ(1/3)(2π)^{1/3}/(10Γ(2/3)).

Hypotheses and scope:

* Σ strongly acceptable (not merely acceptable)
* The proof is BST Sections 6, 7 and 9 with Lemma 37; a target of this layer

Proof outline:

1. Theorem 31 for the first term (ArithmeticStatistics:ST.3/density-of-cubic-orders-with-local-specifications).
2. Lemma 37 expresses the second-order local density μ₂(R, p) = (1 − p^{−2})(1 − p^{−1/3}) (1/(Disc_p(R) #Aut(R))) ∫_{(R/Z_p)^{Prim}} i(x)^{2/3} dx, via the slicing count of Section 6 and the change of variables of Lemma 32.
3. The refined sieve of Section 9 (as in the second-order nodes) gives the error term.

Checks:

* All orders: the second term is c₂^{(i)} X^{5/6}, BST Theorem 6 (Shintani's second term).
* All maximal orders: Theorem 3's second term; maximal not totally ramified: Theorem 4's.


### The quadratic and cubic predecessors

The classical counts of binary quadratic and cubic forms that the field counts refine. The imaginary quadratic count is proved elementarily; the printed statement of Bhargava–Shankar Theorem 1.4(a) is corrected (its `h_D` must count positive definite classes only).


#### Mertens: the number of SL₂(Z)-classes of positive definite binary quadratic forms with 0 < −D < X is (π/18) X^{3/2} + O(X log X) (`ST.3/mertens-count-of-positive-definite-binary-quadratic-forms`)

For D < 0 let h⁺(D) be the number of SL₂(Z)-equivalence classes of positive definite integral binary quadratic forms a x² + b x y + c y² (a > 0) of discriminant b² − 4ac = D, all forms counted (primitive or not). Then Σ_{−X<D<0} h⁺(D) = (π/18) X^{3/2} + O(X log X).

Hypotheses and scope:

* Positive definite forms only: counting the negative definite classes as well doubles the sum (sourceIssue ArithmeticStatistics/E401 on the printed statement)
* Non-primitive forms are included (they are irreducible over Q); the primitive count has constant (π/18)/ζ(3)
* Classes, not weighted classes: the forms x² + y² and x² + xy + y² and their multiples are counted with weight 1 (Hurwitz's weights 1/2, 1/3 change only lower-order terms)

Proof outline:

1. Reduction: every positive definite form is SL₂(Z)-equivalent to exactly one reduced form (|b| ≤ a ≤ c, with b ≥ 0 if |b| = a or a = c). Write f = a(x − τy)(x − τ̄y) with τ in the upper half plane; SL₂(Z) acts on τ by Möbius transformations, and f is reduced iff τ lies in the closed fundamental domain ModularGroup.fd with the boundary identified (ModularGroup.exists_smul_mem_fd, ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo). The canonical representatives are those pinned in ModularForms Layer 11.
2. Counting: h⁺ summed over −X < D < 0 is the number of integer triples (a, b, c) with |b| ≤ a ≤ c, 4ac − b² < X and the boundary convention. Slice by a: a ≤ √(X/3), and for each (a, b) the number of c is (X + b²)/(4a) − a + O(1); summing over |b| ≤ a and a ≤ √(X/3) gives the integral V(X) plus O(X log X) (the O(1) terms contribute O(X), the Riemann-sum error in b and a contributes O(X log X)).
3. Volume: in coordinates (a, τ = x + iy), b = −2ax, c = a|τ|², the Jacobian is 4a²y and the discriminant condition is 4a²y² < X, so V(X) = ∫_{fd} ∫_0^{√X/(2y)} 4a²y da dx dy = (X^{3/2}/6) ∫_{fd} dx dy / y² = (X^{3/2}/6)(π/3) = (π/18) X^{3/2}, using the hyperbolic area ∫_{−1/2}^{1/2} ∫_{√(1−x²)}^∞ dy dx / y² = 2 arcsin(1/2) = π/3.

Checks:

* Numerical check: the number of reduced positive definite forms with 4ac − b² < X is 172131, 5494441, 44054144 for X = 10⁴, 10⁵, 4·10⁵, i.e. 0.17213, 0.17375, 0.17414 times X^{3/2}, against π/18 ≈ 0.17453.
* Small values: h⁺(−3) = h⁺(−4) = 1, h⁺(−12) = 2 (x² + 3y² and 2x² + 2xy + 2y²), h⁺(−16) = 2 (x² + 4y² and 2x² + 2y²).
* The constant is (1/6) × area(SL₂(Z)\H) = (1/6)(π/3).


#### Siegel: Σ_{0<D<X} h_D log ε_D ~ (π²/18) X^{3/2} for indefinite binary quadratic forms (`ST.3/siegel-count-of-indefinite-binary-quadratic-forms`)

For D > 0 not a square let h_D be the number of SL₂(Z)-equivalence classes of integral binary quadratic forms of discriminant D (all forms, primitive or not), and ε_D = (t + u√D)/2 with (t, u) the smallest positive solution of t² − D u² = 4. Then Σ_{0<D<X, D non-square} h_D log ε_D = (π²/18) X^{3/2} + o(X^{3/2}).

Hypotheses and scope:

* D ranges over positive non-square discriminants D ≡ 0, 1 (mod 4); for D a square the forms are reducible and excluded
* The weight log ε_D is the regulator of the order of discriminant D computed with the smallest unit of norm +1; the theorem is about h_D log ε_D, not h_D alone

Proof outline:

1. Geometry of numbers: SL₂(Z) acts on indefinite forms with stabilizer (in SL₂(R)) a copy of SO(1, 1) ≅ R^×, and the stabilizer in SL₂(Z) of a form of discriminant D is infinite cyclic, generated by the automorph attached to ε_D; the fundamental domain for this stabilizer in the real orbit has invariant volume proportional to log ε_D, so the averaged count of BST type over V_R^{indef} counts classes with weight log ε_D.
2. Alternatively, for fundamental D the primitive part of h_D log ε_D equals √D · Res_{s=1} ζ_{Q(√D)}(s) (Dirichlet's class number formula; in the library NumberField.dedekindZeta_residue with the right-limit theorem NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT), and Siegel averages these residues.
3. Siegel's proof is in no public source read; its decomposition is a target of this layer.

Checks:

* For fundamental D > 0 and primitive forms: h⁺(D) log ε⁺_D = 2 h(D) R(D) = √D · dedekindZeta_residue(Q(√D)), since the residue is 2² h R/(2√D).
* D = 5: one class (x² + xy − y²), ε₅ = (3 + √5)/2, log ε₅ ≈ 0.9624.


#### The quadratic and cubic predecessors (Mertens/Siegel and Davenport), with the imaginary quadratic count corrected (`ST.3/quoted-classical-counts-for-binary-quadratic-and-cubic-forms`)

(Theorem 1.4, Mertens 1874 / Siegel 1944, corrected) With h⁺(D) the number of SL₂(Z)-classes of positive definite integral binary quadratic forms of discriminant D < 0 and h_D the number of SL₂(Z)-classes of integral binary quadratic forms of non-square discriminant D > 0: Σ_{−X<D<0} h⁺(D) ~ (π/18) X^{3/2}, and Σ_{0<D<X} h_D log ε_D ~ (π²/18) X^{3/2}, where ε_D = (t + u√D)/2 with t, u the smallest positive integral solutions of t² − D u² = 4. (Theorem 1.5, Davenport 1951) With h(D) the number of GL₂(Z)-classes of irreducible integral binary cubic forms of discriminant D: Σ_{−X<D<0} h(D) ~ (π²/24) X and Σ_{0<D<X} h(D) ~ (π²/72) X. Via Delone-Faddeev, classes of irreducible integral binary cubic forms correspond to orders in cubic fields, so Theorem 1.5 counts cubic orders by discriminant.

Hypotheses and scope:

* h⁺(D) counts positive definite classes only: the printed h_D ('irreducible forms of discriminant D') would include the negative definite classes and give (π/9) X^{3/2} (sourceIssue ArithmeticStatistics/E401)
* h_D log ε_D in the real case is a class-number-times-regulator statement, NOT a class-number statement
* The cubic statement is about GL₂(Z)-classes, and irreducibility is required; reducible forms are excluded
* The Delone-Faddeev correspondence is with ORDERS in cubic fields (including non-maximal ones), not with cubic fields

Proof outline:

1. Imaginary quadratic part: ArithmeticStatistics:ST.3/mertens-count-of-positive-definite-binary-quadratic-forms, with error O(X log X).
2. Real quadratic part: ArithmeticStatistics:ST.3/siegel-count-of-indefinite-binary-quadratic-forms (Siegel's proof is in no public source).
3. Cubic part: Davenport's theorem is the main term of BST Theorem 20 / Theorem 5, N(V_Z^{(0)}; X) = (π²/72) X + O(X^{5/6}) and N(V_Z^{(1)}; X) = (π²/24) X + O(X^{5/6}), proved by the averaging method of BST Section 5 and supplied by ArithmeticStatistics:ST.2 (uniform arithmetic lattice/orbit counts); the order interpretation is Delone-Faddeev (ArithmeticStatistics:ST.1/delone-faddeev-parametrization-of-cubic-rings) with irreducible forms ↔ domains (BST Proposition 11).
4. These are the exact low-degree cases with which ST.3's field counts must agree: sieving Davenport's order count to maximal orders gives the Davenport-Heilbronn theorem, and the ratio of the constants is ζ(2)ζ(3).

Checks:

* Consistency check: Theorem 1.6 (quartic) has main term of order X^{5/6} in the height, while Theorems 1.4 and 1.5 have X^{3/2} and X in the discriminant; the orderings are by different invariants and must not be compared directly.
* Weight check: the quadratic count is by SL₂(Z)-classes, the cubic and quartic counts by GL₂(Z)-classes; the group must be recorded.
* Regulator check: in the real quadratic case the sum is weighted by log ε_D, and no unweighted asymptotic for h_D alone is asserted.
* Sign check: numerically, the reduced positive definite forms with 4ac − b² < 4·10⁵ number 0.17414 X^{3/2}, against π/18 ≈ 0.17453; including the negative definite classes would double this.


### Quartic and quintic fields, and 2-torsion in cubic class groups

Bhargava's counts are stated with their constants from the public reproof of Bhargava–Shankar–Wang over every global field; the Dedekind residue enters the global-field constant through Mathlib's `NumberField.dedekindZeta_residue`.


#### Bhargava's count of S₄-quartic fields by discriminant and signature (`ST.3/bhargava-count-of-quartic-fields`)

For r₂ ∈ {0, 1, 2} let N₄^{(r₂)}(X) be the number of isomorphism classes of quartic fields K with Galois group S₄ (the Galois group of the normal closure, as a permutation group on the four embeddings, is S₄), with r₂ pairs of complex embeddings and |Disc(K)| < X, i.e. N₄(S₄ ∧ (r₂(K) = r₂); −X, X) in the notation of ArithmeticStatistics:ST.3/number-field-counting-function. Then N₄^{(0)}(X) ~ (1/48) c₄ X, N₄^{(1)}(X) ~ (1/8) c₄ X and N₄^{(2)}(X) ~ (1/16) c₄ X, where c₄ = ∏_p (1 + p^{−2} − p^{−3} − p^{−4}); in total N₄(S₄; X) ~ (5/24) c₄ X.

Hypotheses and scope:

* The Galois group restriction is essential: D₄-quartic fields also number ≍ X (Cohen-Diaz y Diaz-Olivier) and are not included
* The archimedean constants are 1/(2 #Aut_R(K ⊗ R)): #Aut(R⁴) = 24, #Aut(R² ⊕ C) = 4, #Aut(C²) = 8
* Stated as a quoted theorem; its proof (Bhargava's parametrization of quartic rings by pairs of ternary quadratic forms and the count of their orbits) is a target of this layer

Proof outline:

1. Source route: BSW Theorem 2 with F = Q, n = 4 and Σ_∞ one real algebra (the archimedean mass m_∞ = 1/#Aut), Σ_p all étale quartic Q_p-algebras; the local factor (1 − 1/p) m_p = Σ_{k=0}^{4} (q(k, 4 − k) − q(k − 1, 5 − k)) p^{−k} = 1 + p^{−2} − p^{−3} − p^{−4} (BSW Theorem 1 with q(k, m) the number of partitions of k into at most m parts; mass formula of Bhargava).
2. Proof inputs: the parametrization of quartic rings with cubic resolvent rings by (GL₃(Z) × GL₂(Z))-orbits of pairs of integral ternary quadratic forms (Bhargava, Higher composition laws III; planned by ArithmeticStatistics:ST.1), the orbit count with cusp analysis and the uniformity estimate for nonmaximality at p (ArithmeticStatistics:ST.2), and the sieve to maximal orders and to S₄-fields.

Checks:

* Sum of the signature constants: 1/48 + 1/8 + 1/16 = 10/48 = 5/24 = (1/2)(#S₄[2]/4!) with #S₄[2] = 10 (BSW Theorem 1(a) for F = Q).
* c₄ ≈ 1.06 is an absolutely convergent Euler product (the p-factor is 1 + O(p^{−2})).
* Totally real S₄-fields are the rarest: ratio 1 : 6 : 3 for r₂ = 0 : 1 : 2.


#### Bhargava's count of S₅-quintic fields by discriminant and signature (`ST.3/bhargava-count-of-quintic-fields`)

For r₂ ∈ {0, 1, 2} let N₅^{(r₂)}(X) be the number of isomorphism classes of quintic fields K with Galois group S₅, r₂ pairs of complex embeddings and |Disc(K)| < X. Then N₅^{(0)}(X) ~ (1/240) c₅ X, N₅^{(1)}(X) ~ (1/24) c₅ X and N₅^{(2)}(X) ~ (1/16) c₅ X, where c₅ = ∏_p (1 + p^{−2} − p^{−4} − p^{−5}); in total N₅(S₅; X) ~ (13/120) c₅ X.

Hypotheses and scope:

* The archimedean constants are 1/(2 #Aut_R(K ⊗ R)): #Aut(R⁵) = 120, #Aut(R³ ⊕ C) = 12, #Aut(R ⊕ C²) = 8
* Stated as a quoted theorem; its proof (quintic rings via quadruples of alternating 5 × 5 matrices, Bhargava's Higher composition laws IV) is a target of this layer

Proof outline:

1. Source route: BSW Theorem 2 with F = Q, n = 5, as for the quartic count; the local factor is Σ_{k=0}^{5} (q(k, 5 − k) − q(k − 1, 6 − k)) p^{−k} = 1 + p^{−2} − p^{−4} − p^{−5}.
2. Proof inputs: the parametrization of quintic rings with sextic resolvents (Bhargava, Higher composition laws IV; ArithmeticStatistics:ST.1), the orbit count (ArithmeticStatistics:ST.2), and the sieves.

Checks:

* Sum of the constants: 1/240 + 1/24 + 1/16 = (2 + 20 + 30)/480 = 13/120 = (1/2)(#S₅[2]/5!) with #S₅[2] = 1 + 10 + 15 = 26.
* Local factor at p = 2: 1 + 1/4 − 1/16 − 1/32 = 37/32.


#### Bhargava-Shankar-Wang: the density of S_n-extensions of a number field for n ≤ 5, with the Dedekind residue (`ST.3/bhargava-shankar-wang-counts-over-number-fields`)

Let F be a number field with r₁ real and r₂ complex places, and n ∈ {2, 3, 4, 5}. Let N_n(F, X) be the number of isomorphism classes of degree-n extensions L/F whose normal closure has Galois group S_n, weighted by 1/#Aut(L/F), with N_{F/Q}(Disc(L/F)) ≤ X, where N_{F/Q}(Disc(L/F)) = |Disc(L)|/|Disc(F)|^n. Then lim_{X→∞} N_n(F, X)/X = (1/2) Res_{s=1} ζ_F(s) · (#S_n[2]/n!)^{r₁} (1/n!)^{r₂} ∏_{𝔭} Σ_{k=0}^{n} (q(k, n − k) − q(k − 1, n − k + 1)) N𝔭^{−k}, where Res_{s=1} ζ_F(s) = 2^{r₁}(2π)^{r₂} h_F R_F/(w_F √|Disc F|) is Mathlib's NumberField.dedekindZeta_residue F, #S_n[2] is the number of elements of order dividing 2 in S_n, and q(k, m) is the number of partitions of k into at most m parts.

Hypotheses and scope:

* The weight 1/#Aut(L/F) is 1 for n ≥ 3 and 1/2 for n = 2
* The residue is used only through its value; Mathlib states it as the real right limit of (s − 1)ζ_F(s), which is all this statement needs
* Stated as a quoted theorem (BSW is a public proof over every global field)

Proof outline:

1. For F = Q: Res = 1, r₁ = 1, r₂ = 0, and the formula gives (1/2)(#S_n[2]/n!) ∏_p (…): 3/π² for n = 2 (weighted; 6/π² unweighted quadratic fields), 1/(3ζ(3)) for n = 3 (Davenport-Heilbronn), (5/24) c₄ and (13/120) c₅ for n = 4, 5.
2. The discriminant-norm identity N(Disc(L/F)) = |Disc(L)|/|Disc(F)|^n is the tower formula for discriminants (NumberFieldArithmetic Layer 4, relative discriminant).
3. The proof is BSW's geometry of numbers over global fields, a target of this layer.

Checks:

* F = Q, n = 2: (1/2)(2/2) ∏_p (1 − p^{−2}) = 3/π², the weighted count of quadratic fields, consistent with ArithmeticStatistics:ST.3/count-of-quadratic-fields (both signs, weight 1/2).
* F = Q, n = 3: (1/2)(4/6)(1/ζ(3)) = 1/(3ζ(3)), the Davenport-Heilbronn total (the local factor is 1 − p^{−3}).
* F = Q(i): the residue is 2^0 (2π)^1 R h/(w √4) = 2π/(4·2) = π/4 (h = 1, w = 4, R = 1), the factor by which the n = 2 count over Q(i) is scaled relative to the Euler product.


#### Bhargava: the mean of #Cl(K)[2] over S₃-cubic fields is 5/4 (totally real) and 3/2 (complex) (`ST.3/bhargava-mean-of-two-torsion-in-cubic-class-groups`)

Over S₃-cubic fields K ordered by |Disc(K)|: the average of h₂(K) = #Cl(K)[2] is 5/4 over totally real fields and 3/2 over complex cubic fields; the average of #Cl⁺(K)[2] (narrow class group) is 2 over totally real fields and 3/2 over complex ones. More generally (BSW Theorem 6(b) over a number field F with an acceptable, archimedean-pure Σ): the mean of h₂(L/F) is 1 + 2^{−r₁−2r₂−α₃(Σ)} and of h₂⁺(L/F) is 1 + 2^{−r₁−2r₂+α₃(Σ)}, α₃(Σ) being the number of real places of F at which Σ prescribes R³; for F = Q, r₁ = 1, r₂ = 0 and α₃ = 1 (totally real) or 0 (complex).

Hypotheses and scope:

* The family is S₃-cubic fields (cyclic cubic fields have density zero); the averages are archimedean-pure (fixed signature)
* Stated as a quoted theorem; the proof counts pairs of ternary quadratic forms (the quartic parametrization) and is a target of this layer

Proof outline:

1. Proved in Bhargava's quartic paper ([8] of BSW) by relating 2-torsion in class groups of cubic fields to quartic fields with a given cubic resolvent (class field theory) and counting through the parametrization of quartic rings; reproved over global fields as BSW Theorem 6(b).

Checks:

* Totally real: 1 + 2^{−1−0−1} = 5/4; complex: 1 + 2^{−1} = 3/2; narrow totally real: 1 + 2^{−1+1} = 2.
* It is the (G, p) = (S₃, 2) case of the Cohen-Lenstra-Martinet prediction, as Davenport-Heilbronn is (S₂, 3).


### Moments of class groups and the Cohen–Lenstra prediction


#### Fouvry-Kluners: all moments of 2^{rk₄} of narrow class groups of quadratic fields, and the 4-rank distribution (`ST.3/fouvry-kluners-moments-of-four-ranks`)

Let C_D be the narrow class group of the quadratic field of fundamental discriminant D and rk₄(C_D) = rk₂(C_D²) its 4-rank. For every integer k ≥ 0 and ε > 0, with N(k, 2) the number of F₂-subspaces of F₂^k and R(X, ε, k) = X(log X)^{−2^{−k}+ε}: Σ_{0<−D<X} 2^{k·rk₄(C_D)} = N(k, 2) Σ_{0<−D<X} 1 + O_{ε,k}(R(X, ε, k)) and Σ_{0<D<X} 2^{k·rk₄(C_D)} = 2^{−k}(N(k + 1, 2) − N(k, 2)) Σ_{0<D<X} 1 + O_{ε,k}(R(X, ε, k)) (and the same within each of the classes D ≡ 1 (mod 4), 0 (mod 8), 4 (mod 8)). Equivalently (FK Theorem 1) the moment prediction Conj^±(2, α) holds for every α ≥ 0, and (FK Theorem 3) for every r ≥ 0 the density of negative fundamental discriminants with rk₄(C_D) = r is 2^{−r²} η_∞(2) η_r(2)^{−2} and of positive ones 2^{−r(r+1)} η_∞(2) η_r(2)^{−1} η_{r+1}(2)^{−1}, where η_k(t) = ∏_{j=1}^{k} (1 − t^{−j}).

Hypotheses and scope:

* The narrow class group is used; for D < 0 it equals the class group, and FK's Corollary 1 transfers the statements to the ordinary class group Cl_D
* The error term saves only a power of log X; the theorem is an unconditional limit, not a heuristic
* Stated as a quoted theorem (Rédei matrices, character sums and a combinatorial analysis over the prime factors of D); its proof is a target of this layer

Proof outline:

1. Rédei: rk₄(C_D) is the corank of an explicit F₂-matrix (the Rédei matrix) built from Legendre symbols between the prime factors of D.
2. Expand 2^{k·rk₄} as a sum of products of Jacobi symbols over factorizations of D, and show that only the 'diagonal' terms contribute to the main term (Siegel-Walfisz and large-sieve estimates for the others); FK Theorems 6-11 treat the six families (3).
3. Proposition 1 turns the moments into Conj^±(2, α); FK Theorem 2 (from [5]) turns all moments into the distribution (Theorem 3).

Checks:

* k = 1: M^−(2^{rk₄}) = N(1, 2) = 2 and M^+(2^{rk₄}) = (N(2, 2) − N(1, 2))/2 = (5 − 2)/2 = 3/2 (FK (1)-(2)).
* k = 2: M^−(4^{rk₄}) = N(2, 2) = 5.
* Density of rk₄ = 0 among negative D: η_∞(2) ≈ 0.2888.


#### The Cohen-Lenstra(-Gerth) moment prediction for p-ranks of class groups of quadratic fields, as an explicit conjectural hypothesis (`ST.3/cohen-lenstra-moment-prediction`)

For a prime p and an integer α ≥ 0, the propositions Conj^−(p, α) and Conj^+(p, α) are: M^−(∏_{0≤i<α} (p^{rk_p(C_D²)} − p^i)) = 1 and M^+(∏_{0≤i<α} (p^{rk_p(C_D²)} − p^i)) = p^{−α}, where C_D is the narrow class group of the quadratic field of discriminant D, C_D² its subgroup of squares, and M^±(f) := lim_{X→∞} (Σ_{0<±D<X} f(D))/(Σ_{0<±D<X} 1) over fundamental discriminants D (the limit is asserted to exist). For odd p, rk_p(C_D²) = rk_p(Cl_D) and p^{rk_p} = h_p (ArithmeticStatistics:ST.3/torsion-count-of-class-groups), so the moment is the average of ∏_{i<α}(h_p(K) − p^i), i.e. of the number of injections (Z/pZ)^α → Cl(K)[p]. These are CONJECTURES: every theorem of this packet that uses one takes it as an explicit hypothesis, and none is assumed.

Pinned conventions and hypotheses:

* For odd p this is Cohen-Lenstra's conjecture (C6), (C10); for p = 2 Gerth's modification replaces C_D by C_D² (genus theory fixes rk₂(C_D) = ω(D) − 1)
* The mean over fundamental discriminants of one sign ordered by |D|
* A proposition with content (a limit statement), never a hypothesis-free axiom

Construction:

1. Define M^± as the limit of ratios of finite sums over the finite sets of fundamental discriminants with 0 < ±D < X (ArithmeticStatistics:ST.3/count-of-quadratic-fields gives the denominators ~ 3X/π²).
2. Define the proposition as the statement that this limit equals 1, resp. p^{−α}.

Where it is used:

* Fouvry-Kluners, Theorem 1 (ArithmeticStatistics:ST.3/fouvry-kluners-moments-of-four-ranks): the case p = 2 of the prediction is proved for every α.
* Bhargava-Shankar-Tsimerman, Theorem 2 (ArithmeticStatistics:ST.3/davenport-heilbronn-mean-of-three-torsion): the case p = 3, α = 1 is proved.
* ArithmeticStatistics:ST.5 (Cohen-Lenstra measure and distribution heuristic): the moment prediction is the moment form of the distribution heuristic; ST.5 relates moments and distributions.

API:

* `cohenLenstraMomentPrediction` (constructor): Conj^±(p, α) as a proposition about the limit of the mean of ∏_{i<α}(h_p(K) − p^i) over quadratic fields of one sign (odd p; p = 2 uses C_D²).
* `cohenLenstraMomentPrediction_zero` (example): Conj^±(p, 0) holds (the mean of 1 is 1).
* `cohenLenstraMomentPrediction_three_one` (compatibility): The Davenport-Heilbronn theorem is equivalent to Conj^−(3, 1) ∧ Conj^+(3, 1).
* `cohenLenstraMomentPrediction_iff_mean_torsion` (characterisation): Conj^±(p, 1) iff the mean of h_p(K) is 2 (imaginary), resp. 1 + p^{−1} (real).
* `cohenLenstraMomentPrediction_target` (other): The predicted value is 1 for imaginary and p^{−α} for real fields: the Cohen-Lenstra prediction |A|^{−u} for A = (Z/pZ)^α with u = 0, 1.

Unit tests:

* `cohenLenstraMomentPrediction_zero_holds` (degenerate): For every odd prime p and both signs, the proposition with α = 0 holds.
* `cohenLenstraMomentPrediction_three_one_imag` (compatibility): The imaginary half of the Davenport-Heilbronn theorem (mean of h₃ equals 2) implies Conj^−(3, 1).
* `cohenLenstraMomentPrediction_target_real` (computation): The predicted real moment for p = 5, α = 2 is 5^{−2} = 1/25.
* `cohenLenstraMomentPrediction_not_mean_classNumber` (non-example): Conj^−(3, 1) is not the statement that the mean of the class number is 2: the mean class number of imaginary quadratic fields is unbounded (Siegel), while the prediction concerns h₃.


### Malle's conjecture


#### Malle's invariants ind(g), a(G) and b(k, G) of a transitive permutation group (`ST.3/malle-invariants-of-a-permutation-group`)

Let 1 ≠ G ≤ S_n be transitive on Ω = {1, …, n}. For g ∈ G, ind(g) := n − (number of orbits of ⟨g⟩ on Ω) = Σ over the cycles of g of (length − 1). ind(G) := min{ind(g) : 1 ≠ g ∈ G} and a(G) := ind(G)^{−1}. For a number field k, the absolute Galois group of k acts on the set of conjugacy classes of G through the cyclotomic character: σ sends the class C of g to the class of g^{χ(σ)}, χ(σ) ∈ (Z/eZ)^× the action on e-th roots of unity, e the exponent of G; the orbits are the k-conjugacy classes, and b(k, G) := the number of k-conjugacy classes C with ind(C) = ind(G). Equivalently, with H_k ≤ (Z/eZ)^× the image of Gal(k(ζ_e)/k), b(k, G) is the number of orbits of H_k acting by powering on the conjugacy classes of minimal index.

Pinned conventions and hypotheses:

* G ≠ 1 and transitive
* ind is a class function, so ind(C) is well defined
* b depends on k only through H_k; H_Q = (Z/eZ)^× and H_k = 1 when ζ_e ∈ k

Construction:

1. ind(g) = #support(g) − #cycles(g) (cycle type of the permutation).
2. The powering action of (Z/eZ)^× on conjugacy classes is well defined because g^e = 1, preserves ind (⟨g^u⟩ = ⟨g⟩ for u a unit), and b counts orbits of H_k on the minimal-index classes.

Where it is used:

* Kluners, Conjecture 1.3 (ArithmeticStatistics:ST.3/malle-conjecture): the predicted exponent a(G) and logarithmic power b(k, G) − 1.
* Kluners, Section 2 (ArithmeticStatistics:ST.3/kluners-counterexample-to-malle-conjecture): b(Q, C₃ ≀ C₂) = 1 < b(Q(ζ₃), C₃) = 2 drives the counterexample.
* Wood, Section 10.2: Malle's a(Γ) = min d(y) over y ≠ 1, with d(y) = n − c(y).

API:

* `malleIndex` (constructor): ind(g) = #support(g) − #cycles(g) for g ∈ S_n.
* `malleIndexGroup` (constructor): ind(G) = min over g ∈ G, g ≠ 1, of ind(g).
* `malleA` (constructor): a(G) = 1/ind(G) ∈ Q.
* `malleB` (constructor): b(H, G): the number of orbits of H ≤ (Z/eZ)^× acting by powering on the conjugacy classes of G of minimal index (b(k, G) with H = H_k).
* `malleIndex_conj` (other): ind(h g h^{−1}) = ind(g).
* `malleIndex_pow_of_isUnit` (other): ind(g^u) = ind(g) for u prime to the order of g.
* `malleB_pos` (other): 1 ≤ b(H, G) for G ≠ 1.
* `malleB_anti` (relation): H ≤ H' implies b(H', G) ≤ b(H, G): enlarging k (shrinking H_k) can only increase b.

Unit tests:

* `malleA_perm_top` (computation): For n ≥ 2, a(S_n) = 1 and b(Q, S_n) = 1.
* `malleA_cyclic_regular` (computation): For a prime ℓ and G = C_ℓ in its regular representation, ind(G) = ℓ − 1, so a(G) = 1/(ℓ − 1), and b(Q, G) = 1.
* `malleB_cyclic_three_over_cyclotomic` (computation): For G = C₃ ≤ S₃ and H = 1 (k ∋ ζ₃), b = 2.
* `malleA_two` (degenerate): For G = S₂ = C₂: ind(G) = 1, a(G) = 1, b(Q, G) = 1.
* `malleB_needs_cyclotomic_action` (non-example): Counting ordinary conjugacy classes of minimal index (H = 1) for G = C₃ ≤ S₃ over Q gives 2, not b(Q, C₃) = 1: the cyclotomic action must be included.


#### Malle's conjecture (strong and weak forms), as explicit conjectural hypotheses (`ST.3/malle-conjecture`)

For a number field k and a transitive 1 ≠ G ≤ S_n, let Z(k, G; x) be the number of extensions K/k inside a fixed algebraic closure k̄ of degree n whose Galois group (the normal closure's group acting on the n embeddings over k) is permutation-isomorphic to G, with N_{k/Q}(d_{K/k}) ≤ x. The strong Malle conjecture MalleStrong(k, G) is the proposition: there is c(k, G) > 0 with Z(k, G; x) ~ c(k, G) x^{a(G)} (log x)^{b(k,G)−1} as x → ∞. The weak Malle conjecture MalleWeak(k, G) is: there is c₁ > 0 with Z(k, G; x) ≥ c₁ x^{a(G)} for x large, and for every ε > 0 there is c₂(ε) with Z(k, G; x) ≤ c₂(ε) x^{a(G)+ε}. For k = Q, counting isomorphism classes instead of subfields of Q̄ changes Z by the constant factor n/#Aut(K/Q) (which depends only on G), so the statements are unchanged when Z(Q, G; x) is replaced by N_n(Gal = G; −x, x) of ArithmeticStatistics:ST.3/number-field-counting-function. These are CONJECTURES: MalleStrong is false in general (Kluners), and theorems using either form take it as an explicit hypothesis.

Pinned conventions and hypotheses:

* The invariants a(G) and b(k, G) are those of ArithmeticStatistics:ST.3/malle-invariants-of-a-permutation-group
* Z counts subfields of k̄, not isomorphism classes; the conversion factor is constant for fixed G
* MalleStrong(Q, G) is refuted for G = C₃ ≀ C₂ ≤ S₆; MalleWeak has no known counterexample

Construction:

1. Define Z(k, G; x) as a finite count (Hermite's theorem over k) and the two propositions by the displayed asymptotic statements.
2. Record the known cases as tests: abelian G (Wright), S₃ ≤ S₃ (Davenport-Heilbronn), S₄, S₅ (Bhargava), and the failure for C₃ ≀ C₂.

Where it is used:

* Kluners, Section 2 (ArithmeticStatistics:ST.3/kluners-counterexample-to-malle-conjecture): the negation of MalleStrong(Q, C₃ ≀ C₂) is proved.
* Wood, Section 10.4: the known cases (abelian, S₃, S₄, S₅) are recorded as tests.
* ArithmeticStatistics:ST.3/davenport-heilbronn-count-of-cubic-fields: MalleStrong(Q, S₃) follows.

API:

* `malleStrong` (constructor): MalleStrong(Q, G): ∃ c > 0, N_n(Gal = G; −X, X) ~ c X^{a(G)} (log X)^{b(Q,G)−1}.
* `malleWeak` (constructor): MalleWeak(Q, G): a lower bound ≫ X^{a(G)} and upper bounds ≪_ε X^{a(G)+ε}.
* `malleStrong_imp_malleWeak` (relation): MalleStrong(k, G) implies MalleWeak(k, G).
* `malleStrong_iff_subfield_count` (compatibility): For k = Q, MalleStrong stated with the subfield count Z(Q, G; x) is equivalent to the statement with isomorphism classes.
* `malleStrong_symmetric_two` (example): MalleStrong(Q, S₂) (from the count of quadratic fields).

Unit tests:

* `malleStrong_S2` (compatibility): MalleStrong(Q, S₂) holds, with c = 6/π² for isomorphism classes.
* `malleStrong_S3` (compatibility): The Davenport-Heilbronn theorem implies MalleStrong(Q, S₃), with c = 1/(3ζ(3)) up to the contribution of cyclic cubic fields (o(X)).
* `malleStrong_exponent_cyclic_three` (computation): For G = C₃ ≤ S₃, the predicted exponent is a(G) = 1/2 and b(Q, G) = 1 (Cohn: N(C₃; X) ~ c X^{1/2}).
* `not_malleStrong_C3wrC2` (non-example): MalleStrong(Q, C₃ ≀ C₂) is false.
* `malleWeak_of_malleStrong_S3` (degenerate): MalleWeak(Q, S₃) holds (from MalleStrong(Q, S₃)).


#### Kluners' counterexample: the strong Malle conjecture fails for C₃ ≀ C₂ ≤ S₆ over Q (`ST.3/kluners-counterexample-to-malle-conjecture`)

For G = C₃ ≀ C₂ = C₃² ⋊ C₂ ≤ S₆ (order 18), a(G) = 1/2 and b(Q, G) = 1, but Z(Q, G; x) ≫ x^{1/2} log x; hence MalleStrong(Q, C₃ ≀ C₂) is false. More precisely Z̃(Q, G; x) ≥ Z(Q(ζ₃), C₃; x/27) ~ c(Q(ζ₃), C₃) x^{1/2} log x, where Z̃ counts towers L/K/Q with Gal(L/K) = C₃, [K : Q] = 2, |d_L| ≤ x, and the C₆ and S₃(6) contributions are O(x^{1/3}).

Hypotheses and scope:

* The failure is caused by the cyclotomic intermediate field K = Q(ζ₃): excluding it restores the predicted order x^{1/2}
* The lower bound uses the abelian case of Malle's conjecture (Wright) over K = Q(ζ₃), where b(K, C₃) = 2

Proof outline:

1. Compute a(G) = 1/2 (the elements of order 3 with three fixed points have index 2) and b(Q, G) = 1 (the two classes of such elements are fused by the cyclotomic action over Q), but b(Q(ζ₃), C₃) = 2.
2. Lower bound: every cyclic cubic extension L/K of K = Q(ζ₃) with Galois group of L/Q equal to G gives a sextic field with |d_L| = d_K³ N(d_{L/K}) = 27 N(d_{L/K}); by Wright's theorem Z(K, C₃; y) ~ c y^{1/2} log y (b(K, C₃) = 2).
3. The other groups arising from towers, C₆ and S₃(6), contribute O(x^{1/3}) (abelian case; Davenport-Heilbronn and discriminant comparison), so Z(Q, G; x) ≫ x^{1/2} log x, contradicting x^{1/2} (log x)^{0}.
4. Wright's theorem for abelian groups over number fields is an input whose decomposition is a target of this layer.

Checks:

* Kluners also shows Ẑ (towers avoiding Q(ζ₃)) ~ c x^{1/2}, as Malle predicts, using the Davenport-Heilbronn 3-rank averages.
* The same mechanism gives counterexamples C_ℓ ≀ C_m for primes ℓ > 2 with gcd(m, ℓ − 1) > 1.


### Acceptance tests for the layer

* **Degree, signature, Galois group and weights are fixed.** The cubic count `N₃(0, X) ~ X/(12ζ(3))`, `N₃(−X, 0) ~ X/(4ζ(3))` is a count of isomorphism classes of fields by signed discriminant; the order count of ST.2 has the larger constants `π²/72`, `π²/24`, and the ratio `ζ(2)ζ(3)` is the product of the inverse local densities `μ_p(U_p)⁻¹`. Bhargava's quartic count is of `S₄`-fields only (`D₄`-quartic fields also number `≍ X`).
* **No heuristic replaces a limit.** The Davenport–Heilbronn means `4/3` and `2` of `h₃` are proved by a sieve with a uniform tail estimate at every prime; they confirm, and do not assume, the Cohen–Lenstra moment prediction `Conj^±(3, 1)`. The prediction itself is a proposition that no theorem assumes; the strong Malle conjecture is false for `C₃ ≀ C₂` (Klüners).
* **Uniformity is needed at every prime.** The lower bound in each sieve uses `N(W_p; X) = O(X/p²)` (non-maximal at `p`, from ST.2) and the bound `O(X/p²)` for cubic fields totally ramified at `p` (class field theory), with constants independent of `p`; pointwise densities give only the upper bound.
* **Numerical checks.** The four cubic fields with `|Disc| < 50` have discriminants `−23, −31, −44, 49`; the ten imaginary quadratic fields with `|Disc| < 25` include exactly one (`ℚ(√−23)`) with `h₃ = 3`; the reduced positive definite binary quadratic forms with `4ac − b² < 4·10⁵` number `0.17414 X^{3/2}` against `π/18 ≈ 0.17453`.
* **Local densities.** At `p = 2` the numbers of forms modulo 2 of symbols `(111), (12), (3), (1²1), (1³)` are `1, 3, 2, 6, 3`; `μ₂(U₂) = 21/32` and `μ₂(V₂) = 9/16`; `∏_p μ_p(U_p) = 1/(ζ(2)ζ(3))` and `∏_p μ_p(V_p) = 36/π⁴`.

### Sources

* M. Bhargava, A. Shankar, J. Tsimerman, *On the Davenport–Heilbronn theorems and second order terms*, Invent. Math. 193 (2013); arXiv:1005.0672v3 (Sections 1–5 and 8 in full; Sections 6, 7, 9 for statements).
* M. Bhargava, A. Shankar, *Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves*, Ann. of Math. 181 (2015); arXiv:1006.1002v3 (Theorems 1.4, 1.5).
* M. Bhargava, A. Shankar, X. Wang, *Geometry-of-numbers methods over global fields I: Prehomogeneous vector spaces*, arXiv:1512.03035v2 (Section 1: Theorems 1, 2, 6), the public source for Bhargava's quartic and quintic counts (Ann. of Math. 162 (2005) and 172 (2010)).
* E. Fouvry, J. Klüners, *On the 4-rank of class groups of quadratic number fields*, Invent. Math. 167 (2007) (Section 1), the public statement of the Cohen–Lenstra(–Gerth) moment conjecture.
* J. Klüners, *A counter example to Malle's conjecture on the asymptotics of discriminants*, C. R. Math. 340 (2005); arXiv:math/0411486.
* M. M. Wood, *Asymptotics for number fields and class groups*, in Directions in Number Theory, AWM Series 3 (2016) (Sections 1–3, 5–11).

Mistakes found in these sources are recorded in the packet as `ArithmeticStatistics/E401`–`E407`: the factor 2 in Bhargava–Shankar Theorem 1.4(a); in Wood's survey, the count `(6/π²)X` stated for imaginary quadratic fields (it is `(3/π²)X`), the sign `m = ac` in the Delone–Faddeev associativity equations (it is `m = −ac`), and '2-torsion in class groups of cubic fields' where 3-torsion in class groups of quadratic fields is meant; a denominator over positive instead of negative discriminants in Fouvry–Klüners (2); `R ⊗ ℚ_p` for `R ⊗ ℤ_p` in BST Theorem 8; and the indices `n₁, n₂` for `n₀, n₁` in BST Sections 5.1 and 8.4.

## ST.4 — Selmer groups and rank bounds

This layer proves that the 2-Selmer groups of elliptic curves over ℚ have average size 3 when the curves of any large family are ordered by height (Bhargava–Shankar, Theorem 3.1), and deduces the rank consequences: the average 2-Selmer rank, and hence the average rank, is at most 3/2 (Corollary 1.2), the average of r₂(Ш_E[2]) is at most 3/2, and 0% of curves have rational 2-torsion. It follows §3 of Bhargava–Shankar, *Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves* (arXiv:1006.1002v3; Annals of Math. 181 (2015)), in full.

**Boundary.** Everything about a single curve is imported. Tau Ceti's EllipticCurves roadmap owns the Mordell–Weil theorem and explicit 2-descent (layer 6), the 2-Selmer group Sel₂(E/ℚ), the Shafarevich–Tate group and the descent exact sequence (layer 7), and the minimal-pair model with its height (layer 8). ST.1 owns the parametrization of 2-Selmer elements by locally soluble integral binary quartic forms (Bhargava–Shankar §3.1: Theorems 3.2 and 3.5, Proposition 3.3, Lemma 3.4, including its local form), with the comparison to the canonical Selmer group. ST.0 owns binary quartic forms, the invariants I, J, Δ, heights, families defined by congruence conditions, large families, local densities and acceptable weights. ST.2 owns the orbit counts in fundamental domains, the reducibility and stabilizer estimates, the volume Vol(PGL₂(ℤ)\PGL₂(ℝ)) = 2ζ(2), the uniformity estimate and the sieve to infinitely many congruence conditions (Theorem 2.21). This layer owns the averaging over families: orbit weights, the local–global structure of the weights, local solubility, the change of measure, local masses, the count of curves in a family, the evaluation of the average as a Tamagawa number, and the statistical rank deductions.

### Conventions

- **Forms and action.** V_R is the space of binary quartic forms f = ax⁴ + bx³y + cx²y² + dxy³ + ey⁴ over R (ST.0). PGL₂ acts by the twisted action γ·f(x, y) = (det γ)⁻² f((x, y)·γ), under which I, J and Δ = (4I³ − J²)/27 are invariant and the centre acts trivially. PGL₂(ℤ) and PGL₂(ℤ_p) are the images of GL₂(ℤ) and GL₂(ℤ_p).
- **Solubility.** A form over a field K is K-soluble if z² = f(x, y) has a solution with (x, y) ≠ (0, 0); locally soluble means ℝ-soluble and ℚ_p-soluble for every prime p (ST.1).
- **Curves.** E_{A,B}: y² = x³ + Ax + B with (A, B) a minimal pair (no prime with p⁴ | A and p⁶ | B); I(E) = −3A, J(E) = −27B; H(E) = max{4|A|³, 27B²} and H′(E) = max{|I(E)|³, J(E)²/4} = 27H(E)/4. Over a field K ⊇ ℚ, E^{I,J}: y² = x³ − (I/3)x − J/27. Averages are the same for H and H′.
- **Measures.** On ℤ_p^n the Haar probability measure; on ℝ² Lebesgue measure in (I, J). ω is the left-invariant top-degree form on PGL₂ taking the value 1 on the images of E₁₁, E₁₂, E₂₁ in gl₂/(scalars); it generates the invariant top-degree forms over ℤ. |ω|_p and |ω|_∞ are the attached Haar measures.
- **Averages.** For an arithmetic family F (ST.0) and φ: F → ℝ, N(F; X) = #{E ∈ F : H′(E) < X} and Avg_F(φ; X) = Σ_{H′(E)<X} φ(E)/N(F; X). "φ has average c" means Avg_F(φ; X) → c; the upper average is the limsup. Heights are strict (H′ < X), as in the source.
- **Selmer groups.** S₂(E) is the 2-Selmer group of layer 7, finite, identified by ST.1 with the locally soluble 2-coverings. r₂(G) = dim_{𝔽₂} G for an elementary abelian 2-group G; r(E) is the rank of E(ℚ).

### Objects

**Orbit weights** (`rational-orbit-weight`). For a group G acting on a set V, a subgroup Γ and a Γ-stable Y ⊆ V, the orbit weight is w_{Γ,Y}(v) = #(Γ\G_{v,Y}) with G_{v,Y} = {g ∈ G : g·v ∈ Y}, counted with `Nat.card`; the orbit count is n_{Γ,Y}(v) = #(Γ\(G·v ∩ Y)). The global weight of an integral form is m(f) = w_{PGL₂(ℤ), V_ℤ}(f) for PGL₂(ℚ) acting on V_ℚ; the local weight is m_p(f) = w_{PGL₂(ℤ_p), V_{ℤ_p}}(f). Thus m(f) = #[PGL₂(ℤ)\PGL₂(ℚ)_f] with PGL₂(ℚ)_f = {γ : γ·f ∈ V_ℤ}. The source's definition, the stabilizer sum Σ_{f′∈B(f)} #Aut_ℚ(f)/#Aut_ℤ(f′), is the lemma below.
- API: `orbitWeight`, `orbitCount`; `one_le_orbitWeight` (v ∈ Y and finite coset set give w ≥ 1); `orbitWeight_smul` (w(g·v) = w(v)); `orbitWeight_eq_one_iff` (w(v) = 1 iff G_{v,Y} = Γ, for v ∈ Y); `orbitWeight_of_eq_top` (Γ = G gives w = 1); `orbitCount_le_orbitWeight` (n ≤ w, with equality iff the Γ- and G-stabilizers agree along G·v ∩ Y); `binaryQuarticWeight` (m), `localBinaryQuarticWeight` (m_p), `binaryQuarticWeight_smul` (PGL₂(ℚ)-invariance on V_ℤ, and its local form).
- Unit tests: `orbitWeight_test_perm` (S₃ on Fin 3, Γ = ⊥, Y = {0}: w(0) = 2); `orbitWeight_test_top` (Γ = ⊤, Y = everything: w = 1); `orbitWeight_test_ne_orbitCount` (in the S₃ example n(0) = 1 ≠ 2); `orbitWeight_test_translation` (ℤ/6 on itself, Γ = {0, 3}, Y = {0, 1, 3, 4}: w(0) = n(0) = 2); `localBinaryQuarticWeight_test_unit_disc` (m_p(x⁴ − y⁴) = 1 for odd p).

**Locally soluble forms attached to a family** (`locally-soluble-forms-attached-to-a-family`). For a family F defined by congruence conditions: S(F) is the set of locally soluble f ∈ V_ℤ with (I(f), J(f)) = (2⁴I, 2⁶J) for some (I, J) ∈ Inv(F), weighted by 1/m(f); S_p(F) is the set of ℚ_p-soluble f ∈ V_{ℤ_p} with 2⁴ | I(f), 2⁶ | J(f) and (2⁻⁴I(f), 2⁻⁶J(f)) ∈ Inv_p(F), weighted by 1/m_p(f); S_∞(F) is the set of ℝ-soluble f ∈ V_ℝ with (I(f), J(f)) ∈ Inv_∞(F). The scaling (2⁴, 2⁶) is the one forced by Theorem 3.5. S_p(F) is defined as this local set, not as a closure (the source's closure description is unproved and unused, E508).
- API: `locallySolubleSet`, `localSolubleSet`, `realSolubleSet`; `invariants_of_mem_locallySolubleSet`; `locallySolubleSet_smul` (stability under PGL₂(ℤ), PGL₂(ℤ_p), PGL₂(ℝ), and PGL₂(ℚ_p)-invariance inside V_{ℤ_p}); `disc_ne_zero_of_mem_localSolubleSet`; `mem_locallySolubleSet_iff` (promoted to a lemma below).
- Unit tests: `locallySolubleSet_test_identity_class` (x³y − 16xy³ ∈ S(F) for all curves: the identity class of y² = x³ − x); `realSolubleSet_test_negative_definite` (−x⁴ − y⁴ ∉ S_∞(F)); `locallySolubleSet_test_unscaled` (x³y − xy³, with invariants (3, 0), lies in no S(F)); `localSolubleSet_test_singular` (x⁴ lies in no S_p(F)).

**Local masses** (`local-masses-of-a-family`). M_p(V, F) = ∫_{Inv_p(F)} #(E^{I,J}(ℚ_p)/2E^{I,J}(ℚ_p))/#E^{I,J}(ℚ_p)[2] dIdJ; M_∞(F; X) = ∫_{Inv_∞(F), H<X} dIdJ; M_∞(V, F; X) = ∫_{Inv_∞(F), H<X} #(E^{I,J}(ℝ)/2E^{I,J}(ℝ))/#E^{I,J}(ℝ)[2] dIdJ. The unweighted local mass M_p(F) = ∫_{Inv_p(F)} dIdJ is ST.0's local density of the family.
- API: `localSelmerMass`, `archimedeanMass`, `archimedeanSelmerMass`; `archimedeanMass_homogeneous` (both archimedean masses are X^{5/6} times their value at 1); `archimedeanMass_pos`; `localSelmerMass_nonneg` (0 ≤ M_p(V, F) ≤ 2M_p(F)); `archimedeanMass_of_sign` ((8/5)X^{5/6}, (32/5)X^{5/6}, 8X^{5/6} for Δ > 0, Δ < 0, Δ ≠ 0).
- Unit tests: `archimedeanMass_test_pos_disc`, `archimedeanMass_test_neg_disc` (the two values (8/5)X^{5/6} and (32/5)X^{5/6}); `archimedeanSelmerMass_test_half` (M_∞(V, F; 1) = M_∞(F; 1)/2, not M_∞(F; 1)); `archimedeanMass_test_zero` (0 for X ≤ 0); `localSelmerMass_test_two` (M₂(V, F) = 2(1 − 2⁻¹⁰) for all curves).
- For the family of all curves: M_p(F) = 1 − p⁻¹⁰ (p ≥ 5), M₃(F) = 3⁻⁴(1 − 3⁻¹⁰), M₂(F) = 1 − 2⁻¹⁰, so Π_p M_p(F) = 1/(81ζ(10)).

**Averages over a height-ordered family** (`average-over-a-height-ordered-family`). Avg_F(φ; X), "φ has average c", and the upper average, as in the conventions, built on ST.0's arithmetic family and its counting function.
- API: `familyAverage`, `HasFamilyAverage`, `upperFamilyAverage`; `hasFamilyAverage_const`; `HasFamilyAverage.add`, `HasFamilyAverage.const_mul`; `upperFamilyAverage_mono`; `HasFamilyAverage.upperFamilyAverage_eq`; `hasFamilyAverage_rescale_iff` (rescaling the height changes nothing).
- Unit tests: `familyAverage_test_const` (the constant 1 has average 1 on an infinite family); `familyAverage_test_empty` (Avg = 0 below every height); `familyAverage_test_rescale` (H and H′ give the same averages); `familyAverage_test_not_sum` (the average is a ratio, not a partial sum).

### Weights and the local–global principle

- `orbit-weight-as-a-stabilizer-sum`. If Stab_G(v) is finite, w(v) = Σ_{Γv′ ⊆ G·v ∩ Y} #Stab_G(v′)/#Stab_Γ(v′), all Stab_G(v′) having the order of Stab_G(v); hence n ≤ w ≤ #Stab_G(v)·n, with w = n iff the stabilizers agree. For forms: m(f) = Σ_{f′∈B(f)} #Aut_ℚ(f)/#Aut_ℤ(f′), and inside one PGL₂(ℚ_p)-class Σ_i 1/#Aut_{ℤ_p}(f_i) = m_p(f)/#Aut_{ℚ_p}(f). Proof: fibres of Γ\G_{v,Y} → Γ\(G·v ∩ Y) are Stab_Γ(v′)\Stab_G(v′) (Lagrange).
- `cartan-decomposition-of-pgl2-over-qp`. Every γ ∈ GL₂(ℚ_p) is k₁ diag(p^a, p^b) k₂ with k_i ∈ GL₂(ℤ_p), a ≤ b unique; so PGL₂(ℚ_p) \ PGL₂(ℤ_p) is the union of the double cosets of diag(1, p^k), k ≥ 1, each a union of p^{k−1}(p + 1) right cosets. Proof: Smith normal form over ℤ_p (Mathlib `Submodule.smithNormalForm`).
- `nonintegral-local-translates-force-square-discriminant`. For every prime p and f ∈ V_{ℤ_p} with Δ(f) ≠ 0: if γ·f is integral for some γ ∈ PGL₂(ℚ_p) \ PGL₂(ℤ_p), then p² | Δ(f); more precisely a translate by diag(1, p^k) forces p^{2k} | Δ(f). Hence m_p(f) = 1 when p² ∤ Δ(f), and m_p(f) is always finite. The key identity: every monomial of Δ is divisible by a or by b², since Δ(0, b, c, d, e) = b²·disc(bx³ + cx² + dx + e).
- `class-number-one-for-pgl2-over-q`. The diagonal map PGL₂(ℤ)\PGL₂(ℚ) → ∏′_p PGL₂(ℤ_p)\PGL₂(ℚ_p) (restricted product) is bijective. Proof by lattices: local–global correspondence for lattices in ℚ², and ℚ^× → ⊕_p ℤ surjective with kernel {±1}. The source quotes this from Platonov–Rapinchuk.
- `global-weight-is-product-of-local-weights` (Proposition 3.6). For f ∈ V_ℤ with Δ(f) ≠ 0, m(f) = Π_p m_p(f), a finite product.

### Local solubility

- `count-of-squarefree-monic-polynomials-over-a-finite-field`. Over 𝔽_q there are q^n − q^{n−1} squarefree monic polynomials of degree n ≥ 2 (every monic polynomial is e²d with d squarefree).
- `count-of-nonsingular-binary-quartic-forms-over-a-finite-field`. #{f ∈ V_{𝔽_q} : Δ(f) ≠ 0} = q²(q + 1)(q − 1)² for every finite field (split by a ≠ 0 and a = 0, using that Δ is the polynomial discriminant, ST.0).
- `nonsingular-binary-quartic-forms-over-finite-fields-are-soluble`. For p odd, every f ∈ V_{𝔽_p} with Δ(f) ≠ 0 is 𝔽_p-soluble; for p ≥ 5 and Δ(I, J) ≠ 0, Σ_{orbits} 1/#Aut_{𝔽_p}(f) = 1 (Lemma 3.15, second assertion). Proof for p ≥ 5: by Theorem 3.2 over 𝔽_p and #(G/2G) = #G[2] for the finite group E(𝔽_p), each fibre V(I, J) contains exactly #PGL₂(𝔽_p) soluble forms; summing over the p² − p pairs gives all p²(p + 1)(p − 1)² nonsingular forms. For p = 3: exhaustive check of the 243 forms. The source's proof of Lemma 3.15 omits this solubility (E504); it replaces the appeal to Cremona's book in Proposition 3.18.
- `local-solubility-away-from-square-discriminant`. For p odd and f ∈ V_{ℤ_p} with Δ(f) ≠ 0: if f is not ℚ_p-soluble then p² | Δ(f); in particular f is soluble when p ∤ Δ(f). Proof by splitting type: nonsingular reduction (previous lemma plus Hensel), simple rational roots ((1²11), (1³1)), the explicit (1²2) argument, and p² | Δ for f ≡ c·g² (mod p) and for f ≡ 0 (mod p) (the source omits the last case, E507).
- `bad-forms-have-square-discriminant` (Proposition 3.18). If f is not ℚ_p-soluble or m_p(f) ≠ 1, with p > 2, then p² | Δ(f); the m_p half holds for all p.
- `local-weights-and-solubility-are-locally-constant`. On {Δ ≠ 0}, m_p is constant on f + p^{δ+1}V_{ℤ_p} (δ = v_p(Δ(f))) and ℚ_p-solubility is locally constant; {Δ = 0} is closed and null. Hence 1_{S_p(F)}/m_p takes values in [0, 1] and is locally constant off a closed null set — the hypothesis of the sieve that the source does not check.
- `real-solubility-of-binary-quartic-forms`. A real form with Δ ≠ 0 is ℝ-soluble iff it is not negative definite; so S_∞(F) consists of the components V^{(0)}, V^{(2+)} over Δ > 0 and V^{(1)} over Δ < 0.

### The change of measure

- `jacobian-of-the-orbit-map`. With s_{I,J} = x³y − (I/3)xy³ − (J/27)y⁴ and ψ(g, I, J) = g·s_{I,J}: ψ*(da∧db∧dc∧dd∧de) = −(1/27)·ω ∧ dI ∧ dJ identically, over every ring in which 3 is invertible. The twisted action has determinant 1 on V, so the Jacobian is independent of g; at g = 1 the Jacobian matrix (rows a, …, e; columns E₁₁, E₁₂, E₂₁, ∂_I, ∂_J) is [[0,1,0,0,0],[1,0,0,0,0],[0,−I,3,0,0],[I/3,−4J/27,0,−1/3,0],[2J/27,0,−I/3,0,−1/27]], of determinant −1/27. This is the direct computation the source offers for its Proposition 2.8; it gives |J|_p = 1 (p ≠ 3), |J|₃ = 27 and |J|_∞ = 1/27 at once, so the source's alternative route (Propositions 3.10–3.13, Remark 3.14 and the first assertion of Lemma 3.15) is not planned.
- `volume-of-pgl2-zp`. vol(PGL₂(ℤ_p), |ω|_p) = #PGL₂(𝔽_p)/p³ = 1 − p⁻².
- `p-adic-change-of-measure-for-binary-quartic-forms` (Proposition 3.7). For nonnegative measurable φ on V_{ℤ_p}: ∫ φ df = |1/27|_p ∫_{Δ(I,J)≠0} Σ_{f ∈ PGL₂(ℤ_p)\V_{ℤ_p}(I,J)} (1/#Aut_{ℤ_p}(f)) ∫_{PGL₂(ℤ_p)} φ(g·f) dg dIdJ; for invariant φ the inner integral is (1 − p⁻²)φ(f). The proof needs the p-adic change-of-variables formula for polynomial maps, which no roadmap plans (gap; the source uses it tacitly, E505).
- `weighted-p-adic-change-of-measure` (Corollary 3.8). For PGL₂(ℚ_p)-invariant φ supported on soluble forms with Δ ≠ 0, 2⁴·3 | I, 2⁶·3³ | J: ∫ φ/m_p df = |1/27|_p (1 − p⁻²) ∫ (1/#E^{I,J}(ℚ_p)[2]) Σ_{σ ∈ E(ℚ_p)/2E(ℚ_p)} φ(f_σ) dIdJ.
- `local-mass-formula-for-locally-soluble-forms` (Proposition 3.9). ∫_{S_p(F)} m_p⁻¹ df = |2¹⁰/27|_p (1 − p⁻²) M_p(V, F).

### Local indices and mass ratios

- `two-division-quotient-of-a-group-with-a-finite-index-zp-subgroup`. If an abelian group G has a finite-index subgroup isomorphic to ℤ_p then #(G/2G) = |2|_p⁻¹·#G[2]. Proof: q(M) = #(M/2M)/#M[2] is 1 on finite groups and multiplicative in short exact sequences (snake lemma); q(ℤ_p) = |2|_p⁻¹.
- `local-two-descent-index` (Lemma 3.20). #(E(ℚ_p)/2E(ℚ_p)) = #E(ℚ_p)[2] for p ≠ 2 and 2·#E(ℚ_p)[2] for p = 2, from the finite-index subgroup of E(ℚ_p) isomorphic to ℤ_p supplied by EllipticCurves layers 1 and 4 (formal group, formal logarithm, reduction filtration).
- `archimedean-selmer-ratio-is-one-half`. #(E(ℝ)/2E(ℝ))/#E(ℝ)[2] = 2/4 or 1/2 according to the sign of Δ, and #Stab_{PGL₂(ℝ)}(f) = #E(ℝ)[2] (so n₀ = n_{2±} = 4, n₁ = 2).
- `local-selmer-mass-ratios` ((74)). M_p(V, F) = M_p(F) for odd p, M₂(V, F) = 2M₂(F), M_∞(V, F; X) = M_∞(F; X)/2.

### Counting

- `locally-soluble-set-is-cut-out-by-local-conditions`. For f ∈ V_ℤ: f ∈ S(F) iff f ∈ S_∞(F) and f ∈ S_p(F) for all p; hence 1_{S_∞(F)}(f)·Π_p 1_{S_p(F)}(f)/m_p(f) = 1_{S(F)}(f)/m(f).
- `selmer-count-as-weighted-orbit-count`. Σ_{E∈F, H′(E)<X} (#S₂(E) − 1) = Σ_{PGL₂(ℤ)·f ⊆ S(F), irreducible, H(f) < 2¹²X} 1/m(f) + O_ε(X^{3/4+ε}), from Theorem 3.5 (ST.1), the stabilizer sum, and ST.2's bounds for orbits with nontrivial stabilizer and for products of two quadratic forms.
- `count-of-locally-soluble-orbits-in-a-large-family`. For large F, the weighted count equals N(V_ℤ ∩ S_∞(F); Y)·Π_p ∫_{S_p(F)} m_p⁻¹ + o(Y^{5/6}): ST.2's Theorem 2.21 applied to φ_p = 1_{S_p(F)}/m_p on each real component, whose hypotheses (values in [0, 1], local constancy, product formula, acceptability via Proposition 3.18 and largeness) are the lemmas above.
- `count-of-real-soluble-integral-orbits`. N(V_ℤ ∩ S_∞(F); X) = (1/27)·Vol(PGL₂(ℤ)\PGL₂(ℝ))·M_∞(V, F; X) + O_ε(X^{3/4+ε}).
- `lattice-points-of-bounded-invariant-height`. In a union of k cosets of mℤ², the pairs with H < X and Δ > 0 (resp. < 0) number (k/m²)(8/5)X^{5/6} (resp. (k/m²)(32/5)X^{5/6}) + O_m(X^{1/2}), by counting columns (no appeal to Davenport's lemma is needed in dimension 2).
- `tail-estimate-for-square-divisors-of-the-discriminant`. #{(A, B) : H < X, p² | 4A³ + 27B² ≠ 0 for some p > M} ≤ C(X^{5/6}/M + X^{5/6}/log X), from the multiplicative and additive counts in the proof of Proposition 3.16 summed over p.
- `uniformity-estimate-for-elliptic-curves` (Proposition 3.16). The curves with H′ < X and p² | Δ number O(X^{5/6}/p^{3/2}) uniformly in p. It uses Davenport–Heilbronn's O(X/p²) for integral binary cubic forms with p² | disc (the nonmaximal part from ST.2, the totally ramified maximal part from ST.3's `cubic-fields-totally-ramified-at-large-primes-are-sparse`; their union over all integral forms is a recorded gap) and the Delone–Evertse bound on cubic Thue equations (gap); the theorems below do not depend on it.
- `count-of-curves-in-a-large-family` (Theorem 3.17). For large F: N(F; X) = M_∞(F; X)·Π_p M_p(F) + o(X^{5/6}), the product converging with 1 − M_p(F) = O(p⁻²). The source gives no proof (E506); the node approximates Inv_p(F) by congruence conditions from both sides and uses the tail estimate. For all curves, N(F; X) ~ 8X^{5/6}/(81ζ(10)).

### Main theorems

- `selmer-average-as-product-of-local-masses` (Theorem 3.19). For large F with M_p(F) > 0 for all p: the average of #S₂(E) − 1 is Vol(PGL₂(ℤ)\PGL₂(ℝ))·(M_∞(V, F; X)/M_∞(F; X))·Π_p (1 − p⁻²)M_p(V, F)/M_p(F). The factors (2¹⁰/27) at ∞ and |2¹⁰/27|_p at p cancel by the product formula.
- `tamagawa-number-of-pgl2-is-two`. Vol(PGL₂(ℤ)\PGL₂(ℝ))·Π_p vol(PGL₂(ℤ_p)) = 2ζ(2)·Π_p(1 − p⁻²) = 2 (Euler product for ζ(2), Mathlib).
- `average-size-of-the-2-selmer-group-is-three` (Theorem 3.1). Let F be a large family defined by congruence conditions with M_p(F) > 0 for every p. Ordered by height, the average size of S₂(E) over F is 3. The positivity hypothesis is not in the source; without it the proof does not apply (E501: a large family with a measure-zero condition at 5 has N(F; X) = o(X^{5/6})).
- `families-of-theorems-1-1-and-1-3-have-positive-local-masses`. All curves, every nonempty family cut out by finitely many congruence conditions on (A, B), and all semistable curves are defined by congruence conditions, large (ST.0), and have M_p(F) > 0 for all p. Semistability at 2 and 3 uses the local constancy of reduction types (EllipticCurves layer 4) and Mathlib's reduction predicates.
- `average-selmer-size-over-all-curves-and-congruence-families` (Theorems 1.1 and 1.3). The average size of S₂(E) is 3 over all curves, over every family defined by finitely many congruence conditions, and over the semistable curves.

### Rank consequences

- `two-selmer-rank-identity` ((2)). r₂(S₂(E)) = r(E) + r₂(E(ℚ)[2]) + r₂(Ш_E[2]); in particular 2^{r(E)}·#E(ℚ)[2] ≤ #S₂(E). From layer 7's exact sequence and Tau Ceti's `card_range_μ`, `fg_point_of_numberField`, `pow_rank_le_card_of_range_μ_le`.
- `rational-two-torsion-has-density-zero`. #{(A, B) : H < X, x³ + Ax + B has a rational root} = O(X^{1/2}); so the average of r₂(E(ℚ)[2]) over any large family with positive local masses is 0.
- `rank-bound-from-the-selmer-average` (Corollary 1.2). Over such a family, the upper averages of r₂(S₂(E)) and of r(E) are at most 3/2, through 2k ≤ 2^k (Mathlib `Nat.mul_le_pow`). The rank is bounded, not computed: r(E) and r₂(S₂(E)) differ by r₂(E(ℚ)[2]) + r₂(Ш_E[2]), which nothing here controls. The corollary bounds the limsup; the source's wording "average ... is at most 1.5" is read that way (E510).
- `average-two-rank-of-sha-is-at-most-three-halves`. The upper average of r₂(Ш_E[2]) is at most 3/2 and the average of r₂(E(ℚ)[2]) is 0.
The paper states no positive-proportion result, and none is planned here: a first moment 3 of 2^{r₂} bounds the average 2-Selmer rank by 3/2 but by itself forces no positive proportion of rank 0. The positive-proportion theorems of later papers (Bhargava–Skinner, Bhargava–Gross–Wang) belong to the routes that bring those papers to this roadmap.

**Sharpness.** Theorem 3.1 is an equality. Corollary 1.2 is far from the conjectured average rank 1/2 (Goldfeld; Katz–Sarnak: 50% rank 0, 50% rank 1), and the value 3 agrees with the Poonen–Rains and Delaunay heuristics; those models are stated in ST.5 and are not inputs here. Jensen's inequality would give only log₂3 ≈ 1.585.

### Dependencies

- Within the roadmap: ST.0 (binary-quartic-form, binary-quartic-invariants, relative-invariance-of-i-and-j, quartic-discriminant-is-the-polynomial-discriminant, binary-quartic-height, elliptic-curves-over-q-ordered-by-height, quartic-to-curve-height-normalisation, elliptic-families-defined-by-congruence-conditions, all-elliptic-curves-form-a-large-family, family-defined-by-local-conditions, acceptable-weight-function, arithmetic-family, stabilizer-weighted-orbit-count); ST.1 (binary-quartic-parametrization-of-two-selmer); ST.2 (averaging-over-the-fundamental-domain-and-cutting-the-cusp; uniformity-estimate-for-infinitely-many-congruence-conditions, for Theorem 2.21); ST.2 and ST.3's `cubic-fields-totally-ramified-at-large-primes-are-sparse` (Davenport–Heilbronn's uniformity for binary cubic forms, for Proposition 3.16 only).
- Tau Ceti EllipticCurves: layer 4 (finite-index ℤ_p-subgroup of E(ℚ_p); local constancy of reduction types), layer 6 (Mordell–Weil, explicit 2-descent rank bound), layer 7 (Sel₂, Ш, the descent sequence, finiteness, comparison with the explicit Selmer group), layer 8 (minimal-pair models).
- Mathlib: `Matrix.ProjGenLinGroup`, `QuotientGroup.rightRel`, `Nat.card`, `PadicInt`, `MeasureTheory.Measure.haarMeasure`, `Submodule.smithNormalForm`, `padicValRat`, `exists_sq_mul_squarefree`, `Polynomial.discr`, `Polynomial.resultant_deriv`, `Polynomial.resultant_eq_zero_iff`, `PerfectField.separable_iff_squarefree`, `MulAction.card_orbit_mul_card_stabilizer_eq_card_group`, `Subgroup.card_mul_index`, `Subgroup.index_ker`, `hensels_lemma`, `Matrix.det`, `Matrix.card_GL_field`, `Cubic.discr_eq_prod_three_roots`, `riemannZeta_eulerProduct_tprod`, `riemannZeta_two`, `WeierstrassCurve.HasGoodReduction`, `WeierstrassCurve.HasMultiplicativeReduction`, `WeierstrassCurve.IsMinimal`, `isInteger_of_is_root_of_monic`, `Nat.mul_le_pow`.
- The atlas inputs HeightsRationalPointsAndObstructions:RP.1 and SchemeAndStackFoundations:SF.3 supply nothing that this layer uses beyond what EllipticCurves layers 6–8 supply.
- Unowned inputs, recorded as gaps: the p-adic change-of-variables formula for polynomial maps (with the multivariable Hensel lemma); the Delone–Evertse bound (at most 12 integral solutions of a cubic Thue equation g(x, y) = 1); and the bound O(X/p²) for all integral binary cubic forms with p² | disc (only its two halves are planned, at ST.2 and ST.3).

### Acceptance tests

- Average: over all curves, Σ_{H(E)<X} #S₂(E)/N(X) → 3; the local factors are 1 − p⁻² at odd p, 3/2 at p = 2 and ζ(2) at ∞, with product 2 for #S₂ − 1.
- Local masses: the ratio is 2 at p = 2 and 1 elsewhere; treating p = 2 like the others gives the wrong average 2.
- Tamagawa: 2ζ(2)Π_p(1 − p⁻²) = 2ζ(2)/ζ(2) = 2.
- Jacobian: the 5×5 determinant at the identity is −1/27; |−1/27|_p is 1 for p ≠ 3 and 27 for p = 3, as the source's point counts modulo p and modulo 9 give.
- Finite fields: every binary quartic with nonzero discriminant over 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁ is soluble; the nonsingular forms number 144, 2400, 14112, 145200.
- Local solubility: 2x⁴ + 4x²y² + 3xy³ + 2y⁴ is insoluble over ℚ₃ and 3² | Δ = 28116.
- Largeness: the family {B = 0} is not large; the Cantor-type family of E501 is large with M₅(F) = 0 and fails the hypotheses of Theorem 3.1.
- Ranks: the Selmer rank is never equated with the rank; the 2-torsion term is handled by a density statement; the conclusion is a limsup bound.
- Counting: N(F; X) ~ 8X^{5/6}/(81ζ(10)) for all curves ordered by H′.

### Not planned here, by decision

- Propositions 3.10–3.13, Remark 3.14 and the first assertion of Lemma 3.15 (the source's p-adic point-count derivation of the constant 1/27) are superseded by the direct Jacobian computation and have no consumer.
- The complex case of the change of measure (Proposition 3.10) has no consumer.
- This section specifies the Bhargava–Shankar 2-Selmer theorem and its consequences. The other Selmer averages assigned to this layer (Bhargava–Gross–Wang for hyperelliptic curves, Bhargava for plane cubics, Bhargava–Skinner for a positive proportion of rank one) are not specified in this section; higher moments and Selmer distributions belong to ST.5.

## ST.5 — Beyond first moments

ST.5 goes past the first moments of ST.3 and ST.4: distributions and higher moments of Selmer groups and class groups, the random-group and random-matrix models these are compared with, local statistics in families, and function-field analogues. It keeps established asymptotics and models apart. A model is a probability measure, and ST.5 proves the model's properties as theorems. An arithmetic prediction (Cohen–Lenstra, Cohen–Lenstra–Martinet, Poonen–Rains, Bhargava–Kane–Lenstra–Poonen–Rains, Delaunay, the σ(n) conjecture, the enhanced Cohen–Lenstra heuristic, Lipnowski–Tsimerman's model-ring comparison) is a *named proposition*. It is never asserted, and it enters a theorem only as an explicit hypothesis. A proved asymptotic is stated for exactly the family, ordering, normalisation and convergence mode of its source.

**Scope and boundaries.** RS-07 keeps this layer whole. It owns:
- the Cohen–Lenstra measures and their moments, and cokernels of random p-adic and finite-field matrices;
- the Poonen–Rains, BKLPR and Delaunay models, and random alternating matrices;
- the proved higher-moment and distribution statements for elliptic curves: Bhargava–Shankar's 3-, 4- and 5-Selmer averages, the Bhargava–Shankar–Swaminathan second moment, the Heath-Brown–Swinnerton-Dyer–Kane twist distribution, and Bhargava–Klagsbrun–Lemke Oliver–Shnidman's 3-isogeny Selmer statistics;
- Burungale–Tian's two Selmer-distribution inputs;
- the local statistics of forms of Browning–Le Boudec–Sawin;
- the statistics of abelian varieties over 𝔽_p of Lipnowski–Tsimerman;
- the function-field theorems of Ellenberg–Venkatesh–Westerland, Wood and Liu–Wood–Zureick-Brown.

It imports and does not re-plan:
- the families, heights, local conditions and squareclass twist families of ST.0;
- the orbit parametrisations and geometry-of-numbers counts of ST.1 and ST.2;
- the 2-Selmer average and the Selmer rank bound of ST.4;
- the proven class-group averages of ST.3 (Davenport–Heilbronn, Lemke Oliver–Wang–Wood), which are compared here with their models;
- Selmer groups and twists from Tau Ceti EllipticCurves Layers 1, 4, 5, 6 and 7;
- p^∞-Selmer coranks, isogeny invariance and 2-parity from SelmerIwasawaCohomology L1, L2 and L4;
- complex multiplication from ComplexMultiplicationAndExplicitReciprocity CM.1 and CM.3;
- Hurwitz schemes from InverseGaloisAndArithmeticFundamentalGroups IG.0–IG.5.

L-function moments and random-matrix predictions for L-values belong to AnalyticNumberTheory:AN.5. They use a different sample space and are not planned here. Three accepted Part IIs import ST.5 and own the following:
- *Smith's method* (ArithmeticStatisticsPartIISmithMethod) owns the proof of Smith's 2^∞-Selmer theorem. ST.5 uses that theorem only as a stated input and files no request for it, since a request would create a cycle.
- *Random Γ-groups* (ArithmeticStatisticsPartIIRandomGammaGroups) owns the measure μ_Γ.
- *Homological stability of Hurwitz spaces* (InverseGaloisPartIIHurwitzHomologicalStability) owns Ellenberg–Venkatesh–Westerland's stability theorem, which ST.5 states as an input.

**Conventions.** The following conventions apply throughout.
- Densities and moments are the limsup/liminf functionals of ST.5/height-moments-in-an-arithmetic-family over an ST.0 family. "At least δ of the family" always means a lower density.
- Measures on countable sets are ℝ≥0∞-valued, and probability measures are Mathlib `PMF`s.
- Finite abelian p-groups are recorded by their isomorphism classes, indexed by partitions (ST.5/isomorphism-classes-of-finite-abelian-p-groups).
- |Sur(X, A)| counts surjections.
- Selmer coranks are ℤ_p-coranks of the discrete p^∞-Selmer group.
- Convergence modes are stated each time: pointwise in each class, total variation, moments, liminf lower bounds, or "fixed degree, then q → ∞" over 𝔽_q(t).

**Planets.** The six planets are:
- Cohen–Lenstra measure;
- Poonen–Rains Selmer distribution;
- BKLPR random alternating matrix model;
- Average size of the 3-Selmer group;
- 3^∞-Selmer coranks of CM twists;
- Large-q Cohen–Lenstra theorem over F_q(t).

The layer is presented in four parts:
1. random groups and random matrices;
2. Selmer statistics;
3. local statistics and abelian varieties over finite fields;
4. function-field analogues.

### Random groups, Cohen–Lenstra measures and random-matrix models

This part of ST.5 builds the probability theory of random finite abelian p-groups on which every distribution statement of the stage rests: the Cohen–Lenstra measures, their surjection moments, the theorem that moments determine the measure, the laws of cokernels of random p-adic and finite-field matrices, and the conjectural models (Cohen–Lenstra, Cohen–Lenstra–Martinet, enhanced Cohen–Lenstra) against which proved asymptotics are recorded. Conjectures appear only as named propositions; every theorem that uses one takes it as a hypothesis.

**Conventions.** p and ℓ are primes. A finite abelian p-group is recorded by its isomorphism class, a partition λ of n with |A_λ| = p^n; λ' is the conjugate partition (λ'_1 is the p-rank) and m_i(λ) the multiplicity of the part i. Measures on classes take values in [0, ∞] (Mathlib's `ℝ≥0∞`); probability measures are Mathlib `PMF`s. |Sur(X, A)| counts surjective homomorphisms, never homomorphisms. Class groups are Mathlib's `ClassGroup` of the ring of integers, their p-parts `CommGroup.primaryComponent`, and quadratic fields are ordered by the absolute discriminant `NumberField.discr`.

#### Isomorphism classes, automorphisms and surjections

- **`FinAbPGroupClass`** (ST.5/isomorphism-classes-of-finite-abelian-p-groups, definition). The type Σ n, `Nat.Partition` n; the class (n, λ) is realised by `toGroup` p (n, λ) = ⊕_i ℤ/p^{λ_i}. API: `card_toGroup` (order p^n), `exists_addEquiv_toGroup` (every finite abelian p-group is isomorphic to a representative, from Mathlib's `AddCommGroup.equiv_directSum_zmod_of_finite`), `eq_of_addEquiv` (uniqueness), `conjPart`, `partMult`, `card_torsion_eq_pow_conjPart` (|A[p]| = p^{λ'_1}), `autCard`, `autCard_pos`, `trivial`, `subsingleton_toGroup_trivial`. Unit tests: |Aut ℤ/p| = p − 1; the trivial class has one automorphism; |(ℤ/p)²| = p²; ℤ/p² ≇ (ℤ/p)².
- **Automorphism count** (theorem). |Aut A_λ| = p^{Σ_i (λ'_i)²} ∏_i ∏_{s=1}^{m_i(λ)} (1 − p^{−s}) (Hillar–Rhea, Theorem 4.1; Majumder, Lemma 3), proved from the matrix description of End(A) and Mathlib's `Matrix.card_GL_field`.
- **`surjCard`** (ST.5/surjection-count, definition). |Sur(X, A)|. API: `surjCard_congr`, `surjCard_toGroup_self` (= |Aut A|), `surjCard_le_card_hom`, `surjCard_punit`, `surjCard_eq_zero_of_card_lt`. Unit tests: |Sur(ℤ/p², ℤ/p)| = p − 1; |Sur((ℤ/p)², ℤ/p)| = p² − 1; |Sur(ℤ/5, 0)| = 1; |Sur(ℤ/p, ℤ/p²)| = 0 although |Hom| = p.
- **Exact surjection count** (theorem). With x_i, a_i the conjugate partitions of X and A: |Sur(X, A)| = 0 if some x_i < a_i, and otherwise ∏_i p^{x_i a_{i+1}} ∏_{j=a_{i+1}}^{a_i−1}(p^{x_i} − p^j). Proved layer by layer (a map is onto iff it is onto on each layer p^{i−1}X/p^iX).

#### The Cohen–Lenstra measure

- **`cohenLenstraMeasure` p u** (ST.5/cohen-lenstra-measure, definition, planet "Cohen–Lenstra measure"). For u ≥ 0, c_{p,u} = ∏_{i≥u+1}(1 − p^{−i}) and μ_{p,u}(A) = c_{p,u}/(|A|^u |Aut A|). u = 0 is the imaginary-quadratic distribution of EVW §8.1 and Lipnowski–Tsimerman's CL_ℓ; u = 1 is the real-quadratic one. API: `cohenLenstraConstant`, `cohenLenstraWeight`, `cohenLenstraMeasure_apply`, `cohenLenstraConstant_pos`, `cohenLenstraConstant_lt_one`, `cohenLenstraConstant_eq_mul_succ`, `cohenLenstraWeight_trivial`, `cohenLenstraWeight_mul_card_autCard`, `cohenLenstraMeasure_rank_eq` (the p-rank law p^{−k(k+u)} ∏_{i≤k}(1 − p^{−i})^{−1} ∏_{i≤k+u}(1 − p^{−i})^{−1} ∏_{i≥1}(1 − p^{−i}), Wood Corollary 3.5). Unit tests: μ_{p,0}(0) = c_{p,0}; μ_{p,0}(ℤ/p) = c_{p,0}/(p − 1); μ_{p,1}(ℤ/p) = c_{p,1}/(p(p − 1)); μ_{p,0}(ℤ/p²) = (p² − 1)μ_{p,0}((ℤ/p)²); 0.56 < c_{3,0} < 0.561.
- **Mass formula** (theorem). Σ_A μ_{p,u}(A) = 1, from **the weighted inverse automorphism sum** Σ_A 1/(|A|^u|Aut A|) = ∏_{j≥u+1}(1 − p^{−j})^{−1} (Cohen–Lenstra; Majumder's elementary proof). Its inputs are two partition lemmas: partitions of m with all parts ≥ u + 1 correspond to partitions of i with largest part exactly j, i + uj = m (via Mathlib's `Nat.Partition.hasProd_powerSeriesMk_card_restricted`), and **Hall's identity** f_n(1/p) = Σ_{λ⊢n} 1/|Aut A_λ|, where f_n is the generating function of partitions with largest part n.
- **`cohenLenstraMeasureProd`** (ST.5/cohen-lenstra-measure-over-a-finite-set-of-primes, definition): for a finite set S of primes, CL_{S,u}((A_ℓ)_ℓ) = ∏_{ℓ∈S} μ_{ℓ,u}(A_ℓ). API: `cohenLenstraMeasureProd`, `hasSum_cohenLenstraMeasureProd`, `cohenLenstraMeasureProd_singleton`, `cohenLenstraMeasureProd_empty`. Unit tests: the mass of (ℤ/3, 0) at S = {3, 5} is μ_3(ℤ/3)μ_5(0); S = ∅ gives mass 1; the trivial tuple at S = {3} has mass c_{3,0}.

#### Surjection moments and uniqueness

- **`surjectionMoment`** (ST.5/surjection-moment, definition). ⟨Sur(−, A)⟩_ν = Σ_X ν(X)|Sur(X, A)| ∈ [0, ∞]. API: `surjectionMoment_trivial` (total mass), `surjectionMoment_add`, `surjectionMoment_const_mul`, `surjectionMoment_mono`, `surjectionMoment_single`. Unit tests: the zero measure has moments 0; the Dirac mass at ℤ/p has ℤ/p-moment p − 1; a probability measure has trivial-target moment 1; the Dirac mass at (ℤ/p)² has ℤ/p-moment p² − 1, not p².
- **Moments of μ_{p,u}** (theorem). ⟨Sur(−, A)⟩_{μ_{p,u}} = |A|^{−u} (Wood, Lemma 3.2; EVW §8.1 for u = 0). Proved from the class-count identity Σ_{|B|=p^i}|Sur(B, G)|/|Aut B| = Σ_{|K|=p^{i}/|G|} 1/|Aut K| (Cohen–Lenstra Prop. 4.1(ii)), which in turn follows from the lemma that the groupoid of extensions 0 → K → B → G → 0 of finite abelian groups has cardinality one (classes ↔ ∏ K/n_iK, automorphisms ↔ Hom(G, K), |K/nK| = |K[n]|).
- **EVW Lemma 8.2** (theorem). For ℓ odd, a probability measure on classes all of whose surjection moments equal 1 is μ_{ℓ,0}. The proof iterates the moment identity; it needs **c_ℓ > 1/2** for ℓ ≥ 3 (lemma; false for ℓ = 2, where c_2 ≈ 0.289).
- **Enlargements** (ST.5/enlargement-of-finite-abelian-p-groups, definition). A' is an s-enlargement of A if some surjection A' ↠ A has kernel of order ℓ^s; equivalently |A'| = ℓ^s|A| and the Young diagram of A lies in that of A'. API: `IsEnlargement`, `enlargements`, `isEnlargement_iff_conjPart`, `mem_enlargements`, `card_enlargements_le` (≤ p(m + s)), `IsEnlargement.trans`, `isEnlargement_zero_iff`. Unit tests: ℤ/ℓ enlarges 0; (ℤ/ℓ)² and ℤ/ℓ² enlarge ℤ/ℓ; ℤ/ℓ³ does not 1-enlarge (ℤ/ℓ)²; the surjection f(x, y) = (y, x mod 3) : ℤ/9 × ℤ/3 → (ℤ/3)² has no lift through π(x, y) = (x mod 3, y).
- **Aggregate enlargement inequality** (theorem, EVW (8.4.1)). If X ↠ A and |X| > |A|, some 1-enlargement A' has |Sur(X, A')| ≥ (ℓ − 1)|Sur(X, A)|: raise a_j at the least j with x_j > a_j and compare exact surjection counts. EVW's argument that every surjection lifts through a fixed A' ↠ A is false (ArithmeticStatistics/E620).
- **Partition tail domination** (lemma): p(s + m)(ℓ − 1)^{−s} → 0 for ℓ ≥ 3. **EVW Lemma 8.4** (theorem): for ℓ odd, ε > 0 and A there are c(A) and a finite M with |Sur(X, A)| ≤ ε·(average over M of |Sur(X, A')|) whenever |X| > c(A).
- **EVW Proposition 8.3** (theorem). For ℓ odd, ε_0 > 0 and finite L_0 there are δ > 0 and finite L' such that moments within δ of 1 on L' force |ν(A) − μ(A)| ≤ ε_0 on L_0. Proof by compactness (Mathlib's `CompactSpace.tendsto_subseq`, Tychonoff), Fatou for sums and Lemma 8.4 for the tails.
- **Moment convergence implies distribution convergence** (theorem, ℓ odd): moments → 1 for all A imply ν_n(A) → μ_{ℓ,0}(A). The converse is false without a tail estimate: ν_n = (1 − ℓ^{−n})μ + ℓ^{−n}δ_{(ℤ/ℓ)^n} converges to μ with ℤ/ℓ-moment → 2 (theorem). EVW §8.5 calls the two forms "equivalent" (ArithmeticStatistics/E621).
- **Wood's moment theorem, specialised** (theorem): for every prime p and u ≥ 0, moments → |A|^{−u} imply ν_n → μ_{p,u} pointwise (Wood, Theorem 3.1, from the sandpile paper's Theorem 8.3). This covers p = 2 and u ≥ 1.

#### Random p-adic matrices

- **`cokernelLaw` p n u** (ST.5/cokernel-law-of-haar-random-p-adic-matrices, definition). The law of coker M = ℤ_p^n/Mℤ_p^{n+u} for M Haar-random in M_{n×(n+u)}(ℤ_p) (Borel σ-algebra on ℤ_p, normalised Haar measure of the compact group). API: `padicMatrixHaar`, `padicCokernel`, `cokernelLaw`, `padicMatrixHaar_univ`, `cokernelLaw_le_one`, `tsum_cokernelLaw`, `surjectionMoment_cokernelLaw`, `cokernelLaw_trivial_eq` (P(coker = 0) = |GL_n(F_p)|/p^{n²}), `tendsto_cokernelLaw`. Unit tests: n = 0 gives the trivial group; for n = 1, u = 0, P(coker ≅ ℤ/p) = (1 − 1/p)/p and P(coker = 0) = 1 − 1/p; for a 1 × 2 matrix P(coker = 0) = 1 − 1/p².
- **Exact moments** (lemma): E|Sur(coker M, A)| = |Sur(ℤ_p^n, A)||A|^{−(n+u)} = |A|^{−u}∏_{i<rk A}(1 − p^{i−n}).
- **Friedman–Washington** (theorem): P(coker M ≅ A) → μ_{p,u}(A) as n → ∞, for every p and u (Wood, Theorem 1.3 in the Haar case). **Translation form** (theorem): for Haar F ∈ M_g(ℤ_ℓ), coker(1 − F) has the same law, so it tends to μ_{ℓ,0} (Lipnowski–Tsimerman §5.7.1).

#### Random matrices over finite fields

- **`matrixKernelLaw` F m n j** (definition): the probability that a uniform m × n matrix over the finite field F has kernel of dimension j; Koymans–Pagano's P(m, n, j) is the case F = F_2. API: `sum_matrixKernelLaw`, `matrixKernelLaw_eq_zero_of_lt`, `matrixKernelLaw_zero_eq_card_GL`. Unit tests: P_{F_2}(1, 1, ·) = (1/2, 1/2); P_{F_2}(2, 2, ·) = (6/16, 9/16, 1/16); P_{F_2}(0, 0, 0) = 1.
- **Rank count** (theorem): #{rank r} = ∏_{i<r}(q^m − q^i)(q^n − q^i)/(q^r − q^i) = [m choose r]_q ∏_{i<r}(q^n − q^i), using the Gaussian binomial ST.5/gaussian-binomial-coefficient.
- **`symmetricKernelLaw` F r n** (definition): P_Sym(r, n) over F. API: `sum_symmetricKernelLaw`, `symmetricKernelLaw_self`, `symmetricKernelLaw_eq_zero_of_lt`, `tendsto_symmetricKernelLaw`. Unit tests: P_Sym over F_2 at r = 2 is (4/8, 3/8, 1/8); P_Sym(0, 0) = 1; P_{F_2}(2, 2, 0) < P_Sym(2, 0).
- **MacWilliams' count** (theorem): the number of symmetric s × s matrices of rank k = 2h or 2h + 1 over F_q is ∏_{i=1}^{h} q^{2i}/(q^{2i} − 1)·∏_{i=0}^{k−1}(q^{s−i} − 1).
- **Limit of P_Sym** (theorem): over F_2, P_Sym(r, n) → ∏_{j odd}(1 − 2^{−j})/∏_{i=1}^{n}(2^i − 1), with |P_Sym(r, n) − limit| ≤ 2^{n+1−r} for r ≥ 1; the limits sum to 1, and the n = 0 value α ≈ 0.41942 is the constant of Stevenhagen's conjecture.
- **Koymans–Pagano identity** (theorem): 1/(2^{m+1} − 1) = Σ_{n=0}^{m} (1/(2^{n+1} − 1))·P(m, m, n)/2^m, proved by the probabilistic argument with a random surjection and a random pairing (Koymans–Pagano, Higher Rédei reciprocity, (A.2)).

#### Conjectural models

- **`CohenLenstraHeuristic` p u K** (ST.5/cohen-lenstra-heuristic-for-quadratic-fields, a conjecture recorded as a definition). For odd p, K_d ≅ ℚ(√d) (squarefree d ≠ 1, `IsQuadraticFamily`), and every class B: among squarefree d < 0 (u = 0) or d > 0 (u = 1) with |disc K_d| ≤ X, the proportion with Cl(K_d)_p ≅ B tends to μ_{p,u}(B). API: `CohenLenstraHeuristic`, `IsQuadraticFamily`, `quadraticFamilyUpTo`, `classGroupPrimary`, `quadraticFamilyUpTo_finite`, `cohenLenstraHeuristic_iff_primary_independent`, `cohenLenstraHeuristic_tsum_limits`. Unit tests: the predicted proportion of imaginary fields with trivial 3-part is c_{3,0}; with 3 | h it is 1 − c_{3,0} ≈ 0.440 (EVW §1.1 prints this number for indivisibility, ArithmeticStatistics/E624); the real weight of ℤ/p is c_{p,1}/(p(p − 1)).
- **`CohenLenstraMomentConjecture` p u K** (definition): the average of |Sur(Cl(K_d)_p, A)| tends to |A|^{−u} (EVW (8.5.1)). Unit tests: the ℤ/3-moment prediction 1 (the Davenport–Heilbronn theorem, planned at ST.3); the trivial target holds for every family; the average of |Hom(Cl, ℤ/3)| is predicted to be 2, not 1. **Moment form ⇒ heuristic** (theorem) for p odd, u = 0.
- **`cohenMartinetPredictedMoment` ρ σ** (ST.5/cohen-martinet-predicted-surjection-moment, definition): ∏_v |Z^{σ_v}|^{−1} for a finite F_p[G]-module Z and the complex conjugations σ_v. API: `cohenMartinetPredictedMoment_nil`, `cohenMartinetPredictedMoment_cons`, `cohenMartinetPredictedMoment_eq_pow` (= p^{−Σ dim Z^{σ_v}}), `equivariantSurjCard`. Unit tests: C_2 acting by −1 with σ the generator gives 1 (Cohen–Lenstra u = 0); σ = 1 gives 1/p (u = 1); the sign representation of C_2 over F_3 with σ = [1] gives 1/3 although Z^G = 0.
- **`CohenLenstraMartinetAverage` E p** (definition): Lemke Oliver–Wang–Wood's (1.1), the average of |Cl_K[p]| over the G-extensions of k with Disc ≤ X (p ∤ |G|) tends to a positive constant; the family E_k(G, X) is ST.3's. API: `CohenLenstraMartinetAverage.exists_pos_limit`, `cohenLenstraMartinetAverage_of_eventually_const`, `cohenLenstraMartinetAverage_empty`. Unit tests: a family with |Cl_K[3]| = 3 throughout has limit 3; trivial torsion gives 1; the empty family fails.
- **`CohenMartinetMomentConjecture`** (definition, Wang–Wood form): for Galois G-extensions with fixed decomposition data and V without trivial constituent, the average of |Sur_G(Cl_{K̃/k}, V)| tends to ∏_v|V^{σ_v}|^{−1}. API: `CohenMartinetMomentConjecture.tendsto`, `cohenMartinetMomentConjecture_zero_module`. Unit tests: the C_2-sign case predicts 1; the trivial module is excluded (a family without trivial quotients has average 0); V = 0 holds for every family.
- **Relative 3-torsion as a Hom count** (lemma): for G = C_2 ≀ H with a transposition and V = Ind_{S_F}^G U irreducible, h_3(K/F) = |Hom_G(Cl_{K̃/k}, V)| = 1 + |Sur_G(Cl_{K̃/k}, V)|. **LOWW Proposition 7.1** (theorem, conditional on the moment conjecture): the predicted average of h_3(K/F) is 1 + 3^{−u}, u the relative unit rank, which is the value LOWW prove at ST.3. **LOWW §7.2** (theorem, conditional): the predicted average of h_3(K/k) is (1 + x_V)∏_i Σ_{j≤a_i}[a_i choose j]_{q_i}x_i^j, which is (1 + 3^{−u(K/F)})(1 + 3^{−u(F/k)}) when W' is irreducible; the printed factor 1 + x_i + … + x_i^{a_i} is wrong for a_i ≥ 2 (ArithmeticStatistics/E623). **The D_4 comparison** (comparison): over ℚ the proven averages are (1 + 3^{−u(K/F)}) times a discriminant-weighted average of h_3(F), smaller than the predictions 40/27, 16/9, 8/3, 8/3.

#### Enhanced Cohen–Lenstra laws

- **`enhancedCokernelLaw` ℓ g k n H** (ST.5/enhanced-cohen-lenstra-finite-level-law, definition): Haar_g(F ∈ M_g(ℤ_ℓ) : coker(1 − F^{n_j}) ≅ H_j for all j); `EnhancedCohenLenstraLimitExists` is the proposition that its g → ∞ limits exist and `enhancedCohenLenstra` the limit (Lipnowski–Tsimerman Definition 5.16, whose existence is not proved in the source, ArithmeticStatistics/E622). API: `enhancedCokernelLaw_one`, `enhancedCohenLenstra_one`, `tsum_enhancedCokernelLaw`, `enhancedCokernelLaw_zero_zero`. Unit tests: g = 0 gives mass 1 at (0, 0); the mass of (ℤ/ℓ, 0) for n = (1, 2) is 0 (the components are dependent); n = (1) recovers Friedman–Washington.
- **Zero cokernels** (theorems, Example 5.17): for F uniform in M_g(F_2), P(1 − F² invertible) = ∏_{j=1}^{g}(1 − 2^{−j}); for ℓ odd, P(1 − F² invertible) ≥ 2c_{3,0} − 1 ≈ 0.120 for all g.
- **`EnhancedCohenLenstraConjecture`** (ST.5/enhanced-cohen-lenstra-conjecture, definition): for a family of abelian varieties over F_p sampled by P_g, if CL_S models A(F_p)_S then ∏_{ℓ∈S}CL_{n,ℓ} models the joint law of (A(F_{p^{n_j}})_S)_j (Conjecture 5.18, attached to one family since the source's "geometric family" is undefined). API: `EnhancedCohenLenstraConjecture.apply`, `enhancedCohenLenstraConjecture_single`. Unit tests: n = (1) holds for every family; the (1, 2)-mass of (0, 0) at ℓ = 2 is ∏_{j≤g}(1 − 2^{−j}); a family not modelled by CL_S satisfies the implication vacuously.

**Dependencies.** Within ArithmeticStatistics: the G-extension families E_k(G, X) and the proven class-group averages (Davenport–Heilbronn, LOWW Theorems 1.1, 1.2, 6.1) are ST.3's; the Gaussian binomial coefficient is ST.5/gaussian-binomial-coefficient. Mathlib supplies partitions and their generating functions, the structure theorem for finite abelian groups, `Matrix.card_GL_field`, Haar measure and compactness of ℤ_p, class groups, discriminants and representations. The Part IIs ArithmeticStatisticsPartIISmithMethod (the 2^k-rank Markov chain, which uses P(m, n, j) and P_Sym) and ArithmeticStatisticsPartIIRandomGammaGroups (random Γ-groups, whose abelianisation recovers μ_{p,u} and the Cohen–Martinet predictions) import this part.

**Acceptance.** The measure on the limiting space is explicit (μ_{p,u} on isomorphism classes, CL_S on tuples); convergence is pointwise in each class, with the one-directional relation to moment convergence stated; the rates are explicit where the source gives them (P_Sym within 2^{n+1−r}); no conjecture is used except as a hypothesis; the exceptional prime 2 is handled by Wood's theorem, not by EVW's contraction argument.

### Selmer statistics: models, proved averages and twist families

This part records, for elliptic curves, what is proved beyond the first moment of ST.4 and what is only modelled. Models (Poonen–Rains, BKLPR, Delaunay) are probability measures proved here to have the stated properties; the arithmetic predictions are conjectures stated as named propositions, never used except as explicit hypotheses. Proved averages are stated for the exact family, ordering and normalisation of their source.

**Conventions.** E_{A,B} : y² = x³ + Ax + B with A, B ∈ ℤ, 4A³ + 27B² ≠ 0 and no prime ℓ with ℓ⁴ | A and ℓ⁶ | B, ordered by H(E_{A,B}) = max(4|A|³, 27B²): the family and height of ST.0 (with the elliptic-curve height and finiteness imported by ST.0 from EllipticCurves Layer 8). Bhargava–Shankar–Swaminathan's normalisation E_{I,J}, height (4/27)max(|I|³, J²/4), is compared with it by ST.0/invariants-height-and-eligible-pairs. Sel_n(E) and Sel_φ(E) are the Selmer groups of EllipticCurves Layer 7; Sel_{p^∞}(E/F) and corank_{ℤ_p} are SelmerIwasawaCohomology L2's. Quadratic twists E^s (s ∈ F^×/F^{×2}) are EllipticCurves Layer 5's; over ℚ, E^d for d ∈ ℤ \ {0} is the twist by ℚ(√d), and E^(n) : ny² = x³ − x is isomorphic to y² = x³ − n²x. Densities and moments are the limsup/liminf functionals below; a "proportion at least δ" always means a lower density.

#### Height moments

- **`familyUpperMoment`, `familyLowerMoment`** (ST.5/height-moments-in-an-arithmetic-family, definition). For a family F with finite sets F(X) of members of height < X (ST.0/arithmetic-family) and f : F → [0, ∞], M^±_m(f) = limsup/liminf_{X→∞} Σ_{x∈F(X)} f(x)^m / #F(X). For m = 1 these are ST.4's (upper) family averages, and on indicators ST.0's upper and lower relative densities μ^±(A), which ST.5 does not redefine. API: `familyUpperDensity` and `familyLowerDensity` (compatibility with ST.0), `familyUpperMoment_one_eq_upperFamilyAverage` (compatibility with ST.4), `familyLowerMoment_le_familyUpperMoment`, `familyUpperMoment_mono`, `familyUpperMoment_add_le`, `familyLowerDensity_compl` (μ⁻(F \ A) = 1 − μ⁺(A)), `familyUpperDensity_le_upperMoment_div` (Markov), `familyUpperMoment_const`. Unit tests: the even integers have density 1/2; a finite set has density 0; the set of n with ⌊log₂ n⌋ even and its complement have upper densities summing to more than 1; the moments of an indicator are its density.
- **`gaussBinom`** (ST.5/gaussian-binomial-coefficient, definition): [n k]_t by the q-Pascal recursion [n+1 k+1]_t = [n k]_t + t^{k+1}[n k+1]_t, with the product formula, symmetry, the specialisation t = 1 and the count of k-dimensional subspaces of 𝔽_q^n (from Mathlib's `card_linearIndependent` and `Matrix.card_GL_field`). Unit tests: [4 2]_2 = 35; [n 0] = 1 and [0 k+1] = 0; [5 2]_1 = 10; [3 1]_2 = 7 ≠ 3. **Cauchy's q-binomial theorem** (lemma): ∏_{i<n}(1 + t^i z) = Σ_k t^{k(k−1)/2}[n k]_t z^k.

#### The Poonen–Rains model

- **`IsMaxIsotropic`, `maxIsotropicSubspaces`, `IsWeaklyMetabolic`** (definition). For a quadratic form Q on a finite-dimensional K-space (any characteristic; Mathlib `QuadraticForm`), W is maximal isotropic if Q|_W = 0 and W equals its orthogonal for the polar form; weakly metabolic means nondegenerate polar form with I_V ≠ ∅. The condition Q|_W = 0 is not implied by W^⊥ = W in characteristic 2. API: `IsMaxIsotropic.finrank_eq`, `isMaxIsotropic_iff_finrank`, `IsMaxIsotropic.map_isometryEquiv`, `maxIsotropicSubspaces_hyperbolicPlane`. Unit tests: the hyperbolic plane (𝔽_p², xy) has exactly two maximal isotropic lines; over 𝔽_2 the line 𝔽_2(1, 1) is its own orthogonal but Q(1, 1) = 1; x² + xy + y² over 𝔽_2 is not weakly metabolic; on the zero space ⊥ is the only one.
- **`isotropicReduction`** (construction): for X isotropic, X^⊥/X carries the induced form Q_X (nondegenerate, dimension dim V − 2 dim X) and W ↦ ((W ∩ X^⊥) + X)/X maps I_V to I_{X^⊥/X}. API: `isotropicQuotientForm`, `isotropicQuotientForm_nondegenerate`, `finrank_isotropicQuotient`, `isotropicReduction_of_le`, `isotropicReduction_bot`, `isotropicReduction_comp`. Unit tests: reduction along 0 is the identity; X^⊥/X = 0 for a maximal isotropic line of the hyperbolic plane; dim X^⊥/X = 2n − 2k; the diagonal line of (K², xy) is not isotropic when 2 ≠ 0.
- **Counting** (Poonen–Rains Proposition 2.6, over 𝔽_p, dim V = 2n, V weakly metabolic): every fibre of π_X has ∏_{i=1}^{dim X}(p^{n−i} + 1) elements (lemma); #I_V = ∏_{j<n}(p^j + 1) (theorem); for fixed W ∈ I_V, Σ_{Z∈I_V} z^{dim(Z∩W)} = ∏_{i<n}(z + p^i), i.e. dim(Z ∩ W) for uniform Z is a sum of independent Bernoulli(1/(p^{i−1} + 1)) (theorem); a_{d,n} = ∏_{j<n}(1 + p^{−j})^{−1}∏_{j=1}^{d}p/(p^j − 1)∏_{j<d}(1 − p^{j−n}) (theorem, from Cauchy's q-binomial theorem).
- **`poonenRainsDistribution`** (ST.5/poonen-rains-distribution, definition, planet "Poonen–Rains Selmer distribution"): a_d = c_p∏_{j=1}^{d}p/(p^j − 1), c_p = ∏_{j≥0}(1 + p^{−j})^{−1} = (1/2)∏_{i≥0}(1 − p^{−(2i+1)}). API: `poonenRainsConstant`, `poonenRainsWeight`, `poonenRainsConstant_eq_half_prod`, `poonenRainsWeight_succ`, `poonenRainsWeight_pos`, `poonenRainsDistribution_apply`, `poonenRainsDistribution_even`, `poonenRainsDistribution_eq_alternatingKernelLimit`. Unit tests: a_0 = c_p; a_1 = 2a_0 at p = 2; a_0 at p = 2 (≈ 0.2097) differs from the Cohen–Lenstra probability ∏_{i≥1}(1 − 2^{−i}) ≈ 0.289 of trivial 2-rank; every a_d > 0.
- **Theorems on the model**: a_{d,n} → a_d with Σ a_d = 1 and total-variation convergence; **moments** E[p^{mX}] = ∏_{i=1}^{m}(p^i + 1) (so E[2^X] = 3, E[4^X] = 15 at p = 2); **parity** Prob(X even) = 1/2 with parity-independent moments (Proposition 2.22).
- **`delaunayWeight`** (ST.5/delaunay-sha-p-rank-law, definition): Prob(X_{Ш[p],r} = 2n) = p^{−n(2r+2n−1)}∏_{i>n}(1 − p^{−(2r+2i−1)})/∏_{i≤n}(1 − p^{−2i}), with API `delaunayWeight_zero`, `delaunayWeight_pos`, `hasSum_delaunayWeight`, `delaunayWeight_eq_alternatingCokernel`; unit tests: the trivial mass at r = 0, higher rank makes Ш[p] smaller, odd dimensions get mass 0, a_{2n} = Δ_{0,n}/2. **Poonen–Rains Theorem 5.2** (theorem): the only rank law R with X_{Sel_p} ≍ R + X_{Ш[p],R} is R ∈ {0, 1} with probability 1/2 each.

#### Random alternating matrices and the BKLPR model

- **Invertible alternating matrices** (BKLPR Lemma 3.6, lemma): #GL_{2m}(𝔽_p)^alt/#M_{2m}(𝔽_p)^alt = ∏_{i=1}^{m}(1 − p^{1−2i}); none in odd size.
- **`alternatingKernelLaw`** (ST.5/alternating-matrix-kernel-law, definition): P_p(j | n), the probability that a uniform alternating n × n matrix over 𝔽_p has kernel of dimension j, and the parity-averaged limit P_p(j | ∞); for p = 2 these are Smith's P^Alt, the transition probabilities of the Markov chain of 2^k-Selmer ranks. API: `alternatingKernelLaw_eq_zero_of_parity`, `alternatingKernelLaw_self`, `sum_alternatingKernelLaw`, `alternatingKernelLaw_eq_formula`, `alternatingKernelLimit`, `alternatingKernelLimit_eq_poonenRains`. Unit tests: P_2(0 | 2) = P_2(2 | 2) = 1/2; P_2(2 | 4) = 35/64, P_2(0 | 4) = 28/64; P_p(1 | 2) = 0; P_p(0 | 0) = 1; P_2(1 | 3) = 7/8 whereas a uniform 3 × 3 matrix over 𝔽_2 has a 1-dimensional kernel with probability 147/256.
- **Closed formula** (theorem): for j ≡ n (mod 2), P_p(j | n) = p^{−j(j−1)/2}∏_{k=1}^{j}(1 − p^{−(n−j)−k})/(1 − p^{−k})·∏_{k=1}^{(n−j)/2}(1 − p^{1−2k}), by counting kernels ([n j]_p subspaces, each with #GL_{n−j}^alt forms). Smith II's display prints 1 − 2^{−n−j+k} (ArithmeticStatistics/E601). **Limit** (theorem): P_p(j | j + 2m) → 2a_j, so P_p(j | ∞) = a_j: Smith's starting law is the Poonen–Rains law.
- **`IsSymplecticClass`, `symplecticAutCard`** (ST.5/symplectic-finite-abelian-p-groups, definition): a finite abelian p-group admits a nondegenerate alternating ℚ_p/ℤ_p-pairing iff it is H × H, uniquely up to isomorphism; #Sp(G). API: `isSymplecticClass_iff_exists_pairing`, `symplectic_pairing_unique`, `symplecticAutCard_pos`, `symplecticAutCard_elementary`. Unit tests: #Sp((ℤ/p)²) = p(p² − 1); ℤ/p is not symplectic; the trivial group is; ℤ/p² × ℤ/p × ℤ/p is not, although its order is a square.
- **`alternatingCokernelLaw`** (definition): the law of coker A for A Haar-random in M_n(ℤ_p)^alt, computed modulo p^e once p^{e−1} kills G. API: `alternatingCokernelLaw_eq_of_le`, `alternatingCokernelLaw_trivial`, `alternatingCokernelLaw_eq_zero_of_not_symplectic`, `sum_alternatingCokernelLaw`, `alternatingCokernelLaw_tendsto`. Unit tests: π_2(0) = 1 − p^{−1}; ℤ/p never occurs; n = 0; independence of the level e. **BKLPR Theorems 3.9 and 3.11** (theorem): π_n(G) → A_0(G) = #G/#Sp(G)·∏_{i≥1}(1 − p^{1−2i}), and A_r(G) = (#G)^{1−r}/#Sp(G)·∏_{i≥r+1}(1 − p^{1−2i}) are probability laws, limits of the rank-(n − r) models.
- **`bklprModel`** (ST.5/bklpr-model, definition, planet "BKLPR random alternating matrix model"): Q(r, T) = (1/2)A_r(T) for r ∈ {0, 1} and 0 for r ≥ 2, modelling 0 → E(k) ⊗ ℚ_p/ℤ_p → Sel_{p^∞}E → Ш[p^∞] → 0. API: `bklprModel_apply`, `bklprModel_rank_marginal`, `bklprModel_sha_conditional`, `bklprModel_selmer_p_rank`, `bklprShaLaw`. Unit tests: rank 2 has probability 0; Q(0, 0) = (1/2)∏_{i≥1}(1 − p^{1−2i}); non-symplectic Ш gets 0; total mass 1. **BKLPR Theorem 1.2 with Proposition 5.6 and Theorem 1.10** (theorem): the intersection of two random maximal isotropic direct summands of ℤ_p^{2n} has rank 0 or 1 with probability 1/2, finite split cokernel, and law converging to Q; S[q] ≅ Z/q ∩ W/q. The canonical measure on ℤ_p-points and the orthogonal Grassmannian are recorded as a gap. **BKLPR Lemma 4.8 and Theorem 5.10**: #OGr_n(ℤ/p^e) = q^{n(n−1)/2}∏(1 + p^{i−n}), and the average of I_m(Z ∩ W) tends to q^{m(m+1)/2}.

#### Conjectures, as stated propositions

- **`PoonenRainsSelmerConjecture` p** (definition): over E_{A,B}/ℚ ordered by height, dim_{𝔽_p}Sel_p has density a_d for every d, and the m-th moment of #Sel_p is ∏_{i≤m}(p^i + 1). API: `.density`, `.moment`, `.average`, `poonenRainsSelmerConjecture_of_bklpr`. Unit tests: PR(2) gives average 3 (the ST.4 theorem) and second moment 15; it is about dim Sel_p, not rank; the zeroth moment is 1 for every family.
- **`SelmerAverageConjecture` n** (definition): the average of #Sel_n is σ(n) (Bhargava–Shankar Conjecture 4). API: `.average`, `selmerAverageConjecture_one`, `selmerAverageConjecture_prime_iff`. Unit tests: σ(4) = 7, σ(6) = 12, BS(1) holds, σ(4) = 7 ≠ 15. **Bhargava–Shankar Proposition 5** (theorem): BS(n) along an infinite set of n implies 100% of curves have rank ≤ 1 (Markov with #Sel_n ≥ n² when rank ≥ 2).
- **`BKLPRSelmerConjecture` p** (definition): the density of {rank E(ℚ) = r, Ш[p^∞] ≅ G} is Q(r, G); `BKLPRShaConjecture` is Conjecture 1.7. API: `.density`, `bklprSelmerConjecture_rank`. Unit tests: rank ≥ 2 has density 0; cyclic Ш gets density 0; the rank prediction does not depend on p; the trivial case. **Consequences** (theorem, conditional on BKLPR(p)): 50% rank 0 and 50% rank 1; Ш[p^∞] finite for 100%; PR(p)(a). Its torsion input (lemma): for each prime p, 100% of E_{A,B} have E(ℚ)[p] = 0 (p = 2 is ST.4/rational-two-torsion-has-density-zero; Hilbert irreducibility with counting, IG.2, for odd p).

#### Proved averages and distributions

- **Bhargava–Shankar** (theorems, each for every subfamily of E_{A,B}/ℚ cut out by finitely many congruence conditions): the average of #Sel_3 is 4 (planet "Average size of the 3-Selmer group"), with the corollary that the average 3-Selmer rank and the average rank are at most 7/6 (from 6r − 3 ≤ 3^r); the average of #Sel_4 is 7; the average of #Sel_5 is 6. Their parametrisations (ternary cubic forms under SL_3; pairs of quaternary quadratic forms; quintuples of 5 × 5 alternating matrices) and counts are the ST.1/ST.2 gap recorded below.
- **Bhargava–Shankar–Swaminathan** (theorem): the upper second moment of #Sel_2 over E/ℚ (and over congruence subfamilies) is at most 15, the Poonen–Rains value.
- **Heath-Brown, Swinnerton-Dyer, Kane** (theorem): for E : y² = (x − c_1)(x − c_2)(x − c_3) with no (c_i − c_j)(c_i − c_k) a square, lim_{N} #{0 < |b| ≤ N : dim Sel_2(E_b) = d + 2}/(2N) = a_d at p = 2; also among positive b and squarefree b prime to D.
- **de Jong** (theorem, statement only): over 𝔽_q(t), 3 ∤ q, the upper average of #Sel_3 is at most 4 + ε(q) with ε(q) → 0.

#### Twist families: Smith's input and Burungale–Tian Theorem 3.3

- **`signedTwistCorankCount`, `HasSignedTwistCorankLaw`** (ST.5/p-infinity-selmer-corank-distribution-in-twist-families, definition): N_r(H) = #{0 < |d| ≤ H : corank Sel_{p^∞}(E^d/ℚ) = r} with proportion N_r(H)/(2H) (Smith's signed-integer ordering, every nonzero d counted), and the squareclass ordering Σ(X) = {s : H(s) < X}, H(s) = ∏_{v_𝔭(s) odd}N𝔭 (BKLOS, Burungale–Tian). API: `squareclassTwistCorankCount`, `LowerSquareclassCorankDensity`, `sum_signedTwistCorankCount`, `signedTwistCorankCount_mono`, `hasSignedTwistCorankLaw_tail`. Unit tests: the constant 0 has the point-mass law; d ↦ [d > 0] has the law (1/2, 1/2); d ↦ |d| has all limiting proportions 0 (no tightness); over ℚ the squareclasses of height < X are the squarefree d with |d| < X.
- **`SmithTwistHypothesis`** (ST.5/smith-twist-family-hypothesis, definition): Smith's Assumption 1.1 — (1) A(ℚ)[2] = 0, or (2) A(ℚ)[2] ≅ ℤ/2 with ℚ(A_0[2]) ∉ {ℚ, ℚ(A[2])} for the 2-isogenous A_0, or (3) A(ℚ)[2] ≅ (ℤ/2)² and no cyclic ℚ-isogeny of degree 4 — written for y² = f(x) through the roots of f: (1) no rational root; (2) f(x + e) = x(x² + ax + b) with b and b(a² − 4b) non-squares; (3) three rational roots e_i with no (e_i − e_j)(e_i − e_k) a square. API: `SmithTwistHypothesis.caseThree`, `smithTwistHypothesis_of_irreducible`, `smithTwistHypothesis_caseThree_iff`, `smithTwistHypothesis_twist`. Unit tests: x³ − x satisfies it; x(x − 1)(x − 4) does not ((0 − 1)(0 − 4) = 4); x³ − 2 does; x(x² + 4) does not. **Lemma**: y² = x³ − x satisfies case (3), the products being −1, 2, 2.
- **Smith's theorem is a stated input.** Smith I, Theorem 1.2: if A/ℚ satisfies Assumption 1.1 then lim_{H} #{d ∈ ℤ \ {0} : |d| ≤ H, r_{2^∞}(A^d) = r}/(2H) = 1/2, 1/2, 0 for r = 0, 1, ≥ 2. Its proof is owned by ArithmeticStatisticsPartIISmithMethod, which imports this stage; ST.5 files no request for it.
- **r_{ℓ^∞} = corank** (lemma): Smith's limit of the ranks of (ℤ/ℓ^k)-free parts of Sel_{ℓ^k}/im(E(F)_tors) equals corank_{ℤ_ℓ}Sel_{ℓ^∞}, from 0 → E(F)[ℓ^∞]/ℓ^k → Sel_{ℓ^k} → Sel_{ℓ^∞}[ℓ^k] → 0. **Tightness** (lemma): a limiting law with π_0 + π_1 = 1 forces density zero for corank ≥ 2.
- **Burungale–Tian Theorem 3.3 from Smith's law** (theorem): if the twists of E : y² = x³ − x have Smith's law, then for a density-one subset of the positive squarefree n ≡ 1, 2, 3 (mod 8), corank_{ℤ_2}Sel_{2^∞}(E^(n)/ℚ) = 0. Steps: translate r_{2^∞} and E^(n); corank ≥ 2 has density zero among all d; on n ≡ 1, 2, 3 (mod 8) the corank is even (2-parity with root number +1, requested from SelmerIwasawaCohomology L4); S has relative density 1/2 among positive squarefree integers (ST.0/even-parity-classes-have-half-density), and density one restricts to it (ST.0/density-one-restricts-to-subfamilies-of-positive-lower-density). This conversion is the part of Burungale–Tian's deduction that BT leave implicit (ArithmeticStatistics/E605).

#### Three-isogeny Selmer groups and Burungale–Tian Theorem 3.5

- **`localSelmerRatio`, `globalSelmerRatio`, `selmerRatioClass`** (ST.5/selmer-ratio-of-an-isogeny, definition): c_v(φ) = #coker/#ker of φ on F_v-points, c(φ) = ∏_v c_v(φ), t(φ) = ord_3 c(φ), T_m(φ) = {s : c(φ_s) = 3^m} (BKLOS use T_m both for the signed and for the |t| = m classes, ArithmeticStatistics/E603). API: `logSelmerRatio`, `localSelmerRatio_of_good`, `localSelmerRatio_complex`, `localSelmerRatio_comp`, `globalSelmerRatio_twist_local`. Unit tests: 1/3 at a complex place; 1 or 1/3 at a real place; 1 for an isomorphism; the ratio is a quotient of indices, not #Sel_φ.
- **Lemmas**: Schaefer's formula c_v(φ) = (c(E')/c(E))|φ'(0)|_v^{−1} and the archimedean values; c(E) = c(E') for a 3-isogeny when a quadratic twist has good reduction (BKLOS Lemma 11.1); T_m(φ) ∩ Σ is cut out by finitely many local conditions and has a density; Cassels' formula #Sel_φ(E)/#Sel_φ̂(E') = c(φ)#E(F)[φ]/#E'(F)[φ̂], hence c(φ)c(φ̂) = 1; the Selmer sequence of a composite isogeny; parity dim Sel_3(E) − dim E(F)[3] ≡ m (mod 2) when c(φ) = 3^m (Cassels–Tate input recorded as a gap); only finitely many twists have odd p-torsion; corank_{ℤ_p}Sel_{p^∞} ≤ dim Sel_p − dim E(F)[p].
- **BKLOS Theorem 2.1** (theorem, elliptic case): for a 3-isogeny φ over a number field and Σ defined by finitely many local conditions, the average of #Sel_{φ_s}(E^s) over s ∈ Σ ordered by H(s) is 1 + avg_Σ c(φ_s). The binary-cubic parametrisation and the count over number fields are a gap.
- **BKLOS Theorem 2.5 in Selmer form** (theorems): on Σ ∩ T_0 at least half of the twists have r_3 := dim Sel_3 − dim E^s(F)[3] = 0; on Σ ∩ T_{±1} at least five sixths have r_3 = 1; hence positive proportions in any local subfamily meeting both (the input of Castella–Grossi–Lee–Skinner Corollary 5.2.3).
- **CM Selmer ratio one** (BKLOS Theorem 11.2): a 3-isogeny between curves with End ≅ O_K has c(φ) = 1 — c_v = 1 away from 3 (a twist with good reduction, Rubin 5.22), 1/3 at the complex places and 3^{[F:K]} over 3 (the normalised action of a = λ ∘ φ ∈ O_K).
- **Burungale–Tian Theorem 3.5** (theorem, planet "3^∞-Selmer coranks of CM twists"): for K imaginary quadratic with 3 not inert and E/K with CM by an order of K, the lower density of t ∈ K^×/K^{×2} (ordered by H(t)) with corank_{ℤ_3}Sel_{3^∞}(E^t/K) = 0 is at least 1/2. Maximal order: φ : E → E/E[𝔭] with N𝔭 = 3, every s in T_0, BKLOS 2.5(a), r_3 = 0 forces corank 0. Non-maximal order: a K-isogeny to a curve with CM by O_K (CM.1) and isogeny invariance of the corank (SelmerIwasawaCohomology L2). BT cite BKLOS Theorem 2.7, which is stated for Mordell–Weil rank (ArithmeticStatistics/E606).

#### Dependencies and acceptance

Imports: ST.0 (families, heights, local conditions, squareclass twist families, the squarefree residue-class count), ST.1 and ST.2 (orbit parametrisations and counts), ST.4 (the 2-Selmer average and the Selmer rank bound); EllipticCurves Layers 1, 4, 5, 6, 7 (Tau Ceti); SelmerIwasawaCohomology L1 (Kummer annihilators), L2 (p^∞-Selmer coranks, isogeny invariance), L4 (2-parity for congruent twists); ArithmeticGaloisDuality R02.4 (Greenberg–Wiles); ComplexMultiplicationAndExplicitReciprocity CM.1, CM.3; InverseGaloisAndArithmeticFundamentalGroups IG.2; SieveMethodsAndPrimePatterns SV.2; ClassFieldTheory Layer 7 (Tau Ceti). Exported to ArithmeticStatisticsPartIISmithMethod: the corank carrier, Assumption 1.1, P^Alt and the conversion to Burungale–Tian Theorem 3.3; to CMRankZeroConverse: Theorems 3.3 (through the Part II) and 3.5.

Acceptance: the finite laws are checked on small cases (a_{d,1}, P_2(· | 4), π_2(0)); every conjecture enters only as a hypothesis; the Smith conversion keeps the signed-integer ordering, the squarefree restriction and parity explicit; the BKLOS deduction keeps the isogeny, the Selmer ratio and the torsion correction explicit; every lower bound is a liminf.

### Local statistics of forms, and statistics of abelian varieties over 𝔽_p

This part of ST.5 has two strands. The first is a local statistic in the sense of the stage: the finite-level local densities σ(a; p^r) of degree-d forms, averaged over primitive coefficient vectors, with their first moment, variance, gradient strata and the lower bound on each stratum (Browning–Le Boudec–Sawin, §5.2, with the lifting lemma of Browning–Matthiesen). These are the inputs from which the Part II *Heights, rational points and obstructions, Part II: random Fano hypersurfaces and least-point heights* (HeightsRationalPointsPartIIRandomFano) proves that the non-Archimedean factor is rarely small; that Part II imports this layer. The second strand is the statistics of principally polarized abelian varieties over a prime field (Lipnowski–Tsimerman §5): numerical concentration lemmas, the Kolmogorov distance and eigenangle spacing measures, and three conditional theorems, each stated in the corrected form recorded under the source issues E643–E647. Conjectures are hypotheses of these theorems, never theorems.

#### Conventions

- d ≥ 0, n ≥ 0 are integers; M_{d,n} is the set of exponent vectors m ∈ ℕ^{n+1} with Σ m_i = d, and N = N_{d,n} = #M_{d,n} = binom(n+d, d). Coefficient vectors are indexed by M_{d,n}, so the lexicographic order of the source plays no role.
- The Veronese vector ν_{d,n}(x) = (x^m)_m has unweighted monomials (no multinomial or square-root weights).
- R_m(Q) = {b ∈ (ℤ/Qℤ)^m : gcd(Q, b) = 1} is ST.0's set of primitive residue vectors, with #R_m(p^r) = p^{rm}(1 − p^{−m}).
- The valuation v_p(v) of a vector v ∈ (ℤ/p^rℤ)^I is capped: it is the largest e ∈ {0, …, r} with v ≡ 0 mod p^e.
- G(u, w) is the gcd of the 2×2 minors u_i w_j − u_j w_i.
- For abelian varieties over 𝔽_p: n_A is the number of isomorphism classes of principal polarizations on A (Aut(A)-orbits); A(p, g) = Σ_A n_A is the number of g-dimensional ppav classes and B(p, g) the number of g-dimensional abelian varieties (ST.0); probabilities over ppavs are for the uniform measure on isomorphism classes. B_0 is the simple abelian surface over 𝔽_p with Frobenius polynomial (x² − p)², whose endomorphism algebra is the quaternion algebra D over ℚ(√p) ramified exactly at its two infinite places.

#### Coefficient-vector forms and local densities

**Definition (coefficient-vector form, Veronese vector).** For a commutative ring R and a ∈ R^{M_{d,n}}, f_a = Σ_m a_m X^m ∈ R[X_0, …, X_n] is homogeneous of degree d, and f_a(x) = ⟨a, ν_{d,n}(x)⟩. Declarations `FormDensity.Monomials`, `FormDensity.form`, `FormDensity.veronese`, `FormDensity.minors`, with API: `eval_form` (f_a(x) = Σ a_m ν(x)_m), `form_isHomogeneous`, `coeff_form` (the coefficient of X^m is a_m), `form_add`, `form_smul`, `map_form` (reduction modulo Q), `veronese_smul` (ν(cx) = c^d ν(x)), `card_monomials` (N_{d,n} = binom(n+d, d)). Unit tests: the vector (1, 0) in degree 1 gives X_0; the zero vector gives 0; #M_{2,1} = 3; the all-ones vector in degree 2 and two variables gives X_0² + X_0X_1 + X_1², not (X_0 + X_1)².

**Definition (local density).** For Q ≥ 1, σ(a; Q) = Q^{−n} #{b ∈ R_{n+1}(Q) : f_a(b) ≡ 0 mod Q}. It is a normalized count, not a probability. Declaration `FormDensity.localDensity`, with API: `localDensity_nonneg`, `localDensity_le` (σ ≤ Q), `localDensity_mul` (σ(a; Q_1Q_2) = σ(a; Q_1)σ(a; Q_2) for coprime moduli, (5.11)), `localDensity_pos_iff` (σ > 0 iff f_a has a primitive zero modulo Q), `localDensity_smul_unit`. Unit tests: σ(a; 1) = 1; σ(X_0; 5) = 4/5 in two variables; σ(X_0²; 9) = 2 in two variables (so σ can exceed 1); σ(X_0² + X_1²; 3) = 0.

**Lemma (perturbation congruence).** For f ∈ R[X_i] and x, h ∈ R^σ, f(x + h) − f(x) lies in the ideal (h_i). **Lemma (first-order Taylor congruence).** f(x + h) − f(x) − Σ_i h_i ∂_i f(x) lies in the ideal (h_i h_j); over ℤ, b ≡ x mod p^c gives f(b) ≡ f(x) + ⟨∇f(x), b − x⟩ mod p^{2c}. Both rest on Mathlib's multivariate evaluation, partial derivatives and induction principle; Mathlib's `hensels_lemma` is univariate over ℤ_p and is not used.

**Theorem (first moment; BLS Lemma 5.4).** For d ≥ 1, p prime and r ≥ 1, the average of σ(a; p^r) over a ∈ R_N(p^r) equals (1 − p^{−(n+1)})(1 − p^{−(N−1)})/(1 − p^{−N}); for d ≥ 2, n ≥ 1 it lies in [1 − 2p^{−(n+1)}, 1]. Acceptance: for linear forms in two variables (N = 2, r = 1) the value is 1 − 1/p, matching the direct count.

**Lemma (two-point incidence count, (5.13)).** For d, n ≥ 1 and b_1, b_2 ∈ R_{n+1}(p^r), with p^v = gcd(G(ν(b_1), ν(b_2)), p^r), the number of a ∈ R_N(p^r) with f_a(b_1) ≡ f_a(b_2) ≡ 0 is p^{r(N−2)+v} − p^{(r−1)(N−2)+min(v, r−1)}. This single formula covers the proportional case (v = r) without a case split (E640). It uses GeometryOfNumbersAndQuadraticArithmetic:GN.0 (BLS Lemma 3.9: det(Λ^{(Q)}_c ∩ Λ^{(Q)}_d) = Q²/gcd(G(c, d), Q)).

**Lemma (Veronese minor valuation; BLS Lemma 3.11).** For d ≥ 1 and primitive b_1, b_2 modulo p^r, the capped valuations of the minors of (ν(b_1), ν(b_2)) and of (b_1, b_2) agree; globally G(ν(x), ν(y)) = G(x, y) for independent primitive x, y.

**Lemma (pair sum, (5.14)).** For n ≥ 2: Σ_{b_1, b_2 ∈ R_{n+1}(p^r)} gcd(G(b_1, b_2), p^r) ≤ p^{2r(n+1)}((1 − p^{−(n+1)})² + 2p^{1−n}).

**Lemma (second moment, (5.15)).** For d ≥ 1, n ≥ 2: Σ_{a ∈ R_N(p^r)} σ(a; p^r)² ≤ p^{rN}((1 − p^{−(n+1)})² + 2p^{1−n}).

**Theorem (variance; BLS Lemma 5.5).** For d ≥ 1, n ≥ 2, p prime and r ≥ 1, the average of (σ(a; p^r) − 1)² over a ∈ R_N(p^r) is at most 4p^{1−n}, uniformly in r. Acceptance: for linear forms σ = 1 − p^{−n} identically and the variance is p^{−2n}.

**Definition (gradient strata, (5.17)–(5.18)).** For 0 ≤ e ≤ r, R^{(e)}_N(p^r) is the set of a ∈ R_N(p^r) for which f_a has a zero x ∈ R_{n+1}(p^r) modulo p^r with v_p(∇f_a(x)) = e. The strata over e = 0, …, r cover F^loc(p^r) (the a with a primitive zero modulo p^r, ST.0) and overlap in general. Declarations `FormDensity.vecValuation`, `FormDensity.grad`, `FormDensity.gradientStratum`, with API: `vecValuation_le`, `vecValuation_eq_iff`, `gradientStratum_subset`, `mem_biUnion_gradientStratum_iff` ((5.18)), `gradientStratum_eq_empty_of_lt`, `gradientStratum_smul_unit`. Unit tests: for linear forms R^{(1)} = ∅ and R^{(0)} = R_N(p^r) (n ≥ 1); X_0X_1 in three variables lies in both R^{(0)}(9) and R^{(2)}(9).

**Theorem (high strata are rare; BLS Lemma 5.6).** For d, n ≥ 1 and 1 ≤ e ≤ r: #R^{(e)}_N(p^r) ≤ 2p^{rN−e} (the printed statement omits the cardinality sign, E641).

**Lemma (lifting at a fixed gradient valuation; Browning–Matthiesen Lemma 3.3).** For F ∈ ℤ[t_1, …, t_s], A ∈ ℤ, a ∈ ℤ^s and m ≥ 2δ + 1, δ ≤ m − ℓ, the sets R_δ(p^m, A; p^ℓ) = {t mod p^m : F(t) ≡ A, v_p(∇F(t)) = δ, t ≡ a mod p^ℓ} satisfy #R_δ(p^m, A; p^ℓ)/p^{m(s−1)} = #R_δ(p^{m+1}, A + kp^m; p^ℓ)/p^{(m+1)(s−1)} for every k. Acceptance: δ = 0 is classical Hensel; the hypothesis m ≥ 2δ + 1 fails for F = t², δ = 1, m = 2, and so does the conclusion.

**Theorem (lower bound on a stratum; BLS Lemma 5.7).** For a ∈ R^{(e)}_N(p^r): σ(a; p^r) ≥ p^{−(e+1)n}. Acceptance: at a nonsingular zero σ ≥ p^{−n} for every r.

#### Statistics of principally polarized abelian varieties over 𝔽_p

**Lemma (convex concentration; LT Lemma 5.9).** For 1/2 < ε < 1 and x_i ∈ [0, εg] with Σ x_i = g: Σ x_i² ≤ (ε² + (1 − ε)²)g². The printed proof's box [0, ε]^k and its count k(k + 1) of vertices are misprints for [0, εg]^k and k(k − 1) (E642).

**Lemma (weighted-square concentration).** For every C ≥ 0 there is g_0 with the following property: if g ≥ g_0 and (k_j, n_j) are pairs of positive integers with Σ k_j n_j = g and no j has both k_j = 1 and n_j ≥ 0.99g, then (1/2)Σ k_j n_j² log n_j + Cg² < 0.495 g² log g.

**Theorem (model-ring concentration; LT Proposition 5.10, corrected).** For a fixed prime p there is g_0(p) such that for g ≥ g_0 every model ring R_{L,n} = ∏ M_{n_i}(O_{L_i}) (CM fields L_i from p-Weil numbers, Σ [K_i:ℚ]n_i = g) whose orbit count satisfies log n_{L,n} ≥ 0.495 g² log g has a block with [K_{i_0}:ℚ] = 1 and n_{i_0} ≥ 0.99g. The printed threshold 0.99 g² log g ignores the factor 1/2 in (55) (E643). Imports: GN.2 (model rings) and GN.3 (orbit counts and the corrected bound (55)).

**Theorem (most ppavs have a large elliptic or real-Weil factor; LT Theorem 0.2 / Corollary 5.13, corrected).** Hypotheses: p satisfies the corrected Lemma 5.11 (some E_0/𝔽_p has log n_{E_0^g} ≥ (1/2)g² log g − C_0 g², true for p split in one of the nine imaginary quadratic fields of class number one); (H1) Conjecture 5.2: |log n_A − log n_{L,n}| ≤ C_p g² for every principally polarizable A isogenous to a product of powers of simple varieties with CM endomorphism fields; (H2) the same inequality for A with a factor B_0^m, with the model count multiplied by the number n_D(m) of GL_m(O_D)-orbits on positive definite quaternion-hermitian matrices. Conclusion: the proportion of g-dimensional ppav classes over 𝔽_p whose underlying variety has neither a factor E^h (E elliptic, h ≥ 0.99g) nor a factor B_0^m (2m ≥ 0.99g) is at most exp(−0.005 g² log g + O_p(g²)). The printed version assumes H1 only and concludes an elliptic factor; the B_0 alternative is needed (E644). Inputs: the Part II AbelianSchemesAndArithmeticModuliPartIIFiniteFields (corrected Lemma 5.11, log B(p, g) = O_p(g²), prime-field endomorphism algebras), GN.3 (including the quaternionic mass bound), AbelianSchemesAndArithmeticModuli A2 and A6, and ST.0's ppav counts.

**Definition (Kolmogorov distance).** For probability measures μ, ν on ℝ, d_K(μ, ν) = sup_x |F_μ(x) − F_ν(x)|. Declaration `AbelianVarietyStatistics.kolmogorovDist`, with API: `kolmogorovDist_nonneg`, `kolmogorovDist_comm`, `kolmogorovDist_le_one`, `abs_cdf_sub_le_kolmogorovDist`, `kolmogorovDist_triangle`, `kolmogorovDist_eq_zero_iff`. Unit tests: d_K(μ, μ) = 0; d_K(δ_0, δ_1) = 1; d_K((δ_0 + δ_1)/2, δ_0) = 1/2.

**Definition (normalized eigenangle spacing measure).** For a multiset θ of N angles in [0, 2π) (repetitions kept), sorted θ_1 ≤ ⋯ ≤ θ_N, the cyclic gaps are θ_{i+1} − θ_i and θ_1 + 2π − θ_N, and μ(θ) = (1/N)Σ δ_{(N/2π)·gap}, a probability measure on [0, ∞) of mean 1. The eigenangles of an integral polynomial are the arguments in [0, 2π) of its complex roots, with multiplicity; μ_g averages μ(θ(P_A)) over the g-dimensional ppav classes over 𝔽_p. Declarations `AbelianVarietyStatistics.cyclicGaps`, `spacingMeasure`, `eigenangles`, with API: `length_cyclicGaps`, `cyclicGaps_nonneg`, `sum_cyclicGaps` (the gaps sum to 2π), `spacingMeasure_univ`, `spacingMeasure_Iio_zero`, `card_eigenangles`, `sub_one_div_le_spacingMeasure_zero`. Unit tests: μ({1,1,1,1}){0} = 3/4; μ({0, π}) = δ_1; μ({0,0,π,π}){0} = 1/2 while μ({0,π}){0} = 0; the eigenangles of x² + 5 are π/2 and 3π/2.

**Lemma (zero-gap mass).** Two distinct angles of multiplicity at least h among N force μ(θ){0} ≥ 2(h − 1)/N (the printed mass h/g is too large by 1/g, E645). **Lemma (atom bound).** μ((−∞, x]) − ν((−∞, x]) ≤ d_K(μ, ν); hence d_K(μ, ν) ≥ μ{0} when μ lives on [0, ∞) and ν((−∞, 0]) = 0.

**Theorem (spacing discrepancy; LT Corollary 5.14, corrected).** Under the hypotheses of the previous theorem, μ_g{0} ≥ 0.99 − o(1), and liminf_g d_K(μ_g, ν) ≥ 0.99 for every probability measure ν with ν((−∞, 0]) = 0, in particular for the GUE spacing law (absolutely continuous; its definition is planned nowhere, recorded as a gap).

**Theorem (failure of the enhanced Cohen–Lenstra prediction; LT Corollary 5.20, corrected).** Let p be odd and satisfy the corrected Lemma 5.11, assume H1 and H2, let S be the primes ℓ ≠ p below (p + 1)², and assume the limits CL_{(1,2),ℓ}(0, 0) exist for ℓ ∈ S (E646). Then Prob(A(𝔽_p)[S^∞] = 0 and A(𝔽_{p²})[S^∞] = 0) → 0 over ppav classes, while CL_{(1,2),S}(0, 0) > 0, so the joint law does not converge to the enhanced Cohen–Lenstra law. The case p = 2 is excluded: y² + xy = x³ + x² + 1 has 2 points over 𝔽_2 and 8 over 𝔽_4 (E647). Inputs: the enhanced Cohen–Lenstra law of this stage, the Hasse bound (tauceti EllipticCurves Layer 3), and the Part II's corrected Lemma 5.19 and point-count identities.

#### Dependencies

Within ArithmeticStatistics: ST.0 (primitive residue vectors, locally soluble coefficient sets, ppav and abelian-variety counts) and, within ST.5, the Cohen–Lenstra measure and the enhanced Cohen–Lenstra law and conjecture. Other roadmaps: GeometryOfNumbersAndQuadraticArithmetic GN.0 (congruence-lattice determinants), GN.2 (model rings, including the quaternionic one) and GN.3 (orbit counts, corrected (55), quaternionic mass bound); AbelianSchemesAndArithmeticModuli A2 (principal polarizations) and A6 (Poincaré reducibility); tauceti EllipticCurves Layer 3 (Hasse bound); the proposed Part II AbelianSchemesAndArithmeticModuliPartIIFiniteFields (finite-field classification and counts). The Part II HeightsRationalPointsPartIIRandomFano imports the local densities, the Veronese vector and the Veronese minor lemma from this layer.

#### Acceptance

- The first moment is exact and equals 1 − 1/p for linear forms in two variables at r = 1; the variance bound 4p^{1−n} is uniform in r and holds with equality-type sharpness p^{−2n} for linear forms.
- #R^{(e)}(p^r) ≤ 2p^{rN−e} and σ ≥ p^{−(e+1)n} on R^{(e)}; the lifting lemma fails when m < 2δ + 1 (F = t², δ = 1, m = 2).
- The conditional theorems carry their hypotheses (corrected Lemma 5.11, H1, H2, and for Corollary 5.20 odd p and existence of CL_{(1,2),ℓ}(0,0)) explicitly; no conjecture is used as a proved statement.
- Every corrected statement matches its source issue: E640 (case split), E641 (cardinality sign), E642 (Lemma 5.9 misprints), E643 (threshold 0.495), E644 (B_0 alternative), E645 (zero-gap mass and metric), E646 (existence of the enhanced limit), E647 (p = 2).

### Function-field analogues

This part of ST.5 proves the function-field counterparts of the Cohen–Lenstra and nonabelian Cohen–Lenstra predictions in the regime where the constant field grows: Ellenberg–Venkatesh–Westerland's theorem that the ℓ-parts of class groups of imaginary quadratic extensions of F_q(t) approach the Cohen–Lenstra distribution as q → ∞ (EVW, Annals 183 (2016), Theorem 1.2), Wood's nonabelian moments (Duke 168 (2019), Theorem 1.2) and Liu–Wood–Zureick-Brown's moments of Gal(K^#/K) (Invent. 237 (2024), Theorem 1.4, Corollary 1.5). It owns the families and their counts, the class-group dictionary, the linear algebra of symplectic similitudes, the monodromy statements for the odd-degree hyperelliptic family and the counting arguments. It does not own, and imports: the Cohen–Lenstra measure, surjection moments and finite moment control (the Cohen–Lenstra part of this stage), arithmetic Hurwitz schemes and their point and component counts (InverseGaloisAndArithmeticFundamentalGroups:IG.5, with IG.0, IG.1, IG.4 for Galois categories, fundamental-group sequences and Wood's marked-extension correspondence), function-field class field theory (FunctionFieldArithmetic:FA.4), the trace formula (SchemeAndStackFoundations:SF.2), Poincaré duality (EtaleDualityAndPerverseSheaves:EDC.2), Deligne's weight bound (DeligneWeightsAndPurity:DWP.7), Weil pairings of abelian schemes (AbelianSchemesAndArithmeticModuli:A3) and Jacobians (Tau Ceti JacobianChallenge, Layer D). The homological stability of Hurwitz spaces is owned by the Part II "Inverse Galois theory and arithmetic fundamental groups, Part II: homological stability of Hurwitz spaces"; this stage uses its uniform Betti bound as a stated input.

**Conventions.** q is a prime power and F_q a field with q elements; K = F_q(t) is the rational function field (Mathlib `RatFunc`); ℓ is a prime, always odd in the Cohen–Lenstra statements; a finite abelian ℓ-group is identified with its isomorphism class, indexed by a partition as in the Cohen–Lenstra part of this stage. Degrees are `natDegree`. "Squarefree" is Mathlib's `Squarefree` in F_q[t]. Sur(X, A) is the set of surjective homomorphisms. Limits "as q → ∞" run through the filter A_m of prime powers coprime to a fixed m, and degree densities are taken along odd n before q → ∞. The EVW domain is odd q with ℓ ∤ q(q − 1); the printed "q ≢ 1 (mod ℓ)" also admits q = 2^k and q = ℓ^k, which the proof does not cover.

#### Quadratic families over F_q(t)

**Objects.** For n ≥ 0, P_n is the set of squarefree f ∈ F_q[t] of degree n (`squarefreePolysOfDegree`), P_n^mon its monic subset (`monicSquarefreePolysOfDegree`), and for odd q the family S_n := P_n/(F_q^×)² (`quadraticFamily`, via the setoid `squareClassSetoid`: f ~ u²f). The class [f] stands for L_f = K[y]/(y² − f) (`quadraticPoly`, `quadraticFunctionField`); for n odd this is a field (`irreducible_quadraticPoly`), ramified at ∞, with discriminant of degree n + 1, and L_f ≅ L_{f'} over K iff f' = u²f (`quadraticFamily_mk_eq_iff`). Each class has (q − 1)/2 representatives (`card_quadraticFamily_fiber`), so averages over S_n equal averages over P_n. The family is the function-field instance of ST.0's arithmetic-family carrier. Unit tests: |S_1| = 2q; |S_0| = 2; for even q the parametrisation collapses to monic polynomials (q = 2, n = 3 gives 4, not 8); monic representatives inject into S_n and fill half of it.

**Theorems.**
- Monic squarefree count: 1, q and q^d − q^{d−1} (d ≥ 2) monic squarefree polynomials of degree 0, 1, d, imported from ST.4 (ST.4/count-of-squarefree-monic-polynomials-over-a-finite-field; proof by f = e²s and Σ S_d u^d = (1 − qu²)/(1 − qu)).
- Size of the family (`card_quadraticFamily`): |S_n| = 2(q^n − q^{n−1}) for odd n ≥ 3 and odd q; |S_1| = 2q (EVW (8.7.5) states the first formula for all odd n).
- Slice parametrisations: Wood's imaginary slice IQ_{=q^{2n}} is {F_q(t)(√f) : f monic squarefree of degree 2n − 1} and has q^{2n−1} − q^{2n−2} elements (n ≥ 2); the real slice RQ_{=q^{2n}} is {F_q(t)(√f) : f monic squarefree of degree 2n}, with q^{2n} − q^{2n−1} elements, ∞ contributing nothing to its discriminant. The definitions of IQ and RQ are ST.0's.

#### Class groups, surjection pairs and the dihedral datum

**Generalized dihedral datum** (`generalizedDihedral`, `inversionAction`, `outsideInvolutions`). For A finite abelian of odd order, G_A = A ⋊ Z/2 with inversion and c_A = {aτ}. API: c_A is exactly the involutions (`mem_outsideInvolutions_iff`), a single rational class (`outsideInvolutions_isConj`), generating (`closure_outsideInvolutions`); G_A is centre-free for A ≠ 0 (`center_generalizedDihedral`); (G_A, c_A) is nonsplitting (`outsideInvolutions_nonsplitting`), proved directly from b(aτ)b^{−1} = (a + 2b)τ. Unit tests: |G_{Z/3}| = 6 (G ≅ S_3); G_0 = Z/2 is its own centre; for A = Z/2 two outside involutions are not conjugate; for A = Z/5 every outside element has order 2.

**Class groups and pairs** (`quadraticRingOfIntegers`, `quadraticClassGroup`, `ClassGroupSurjectionPair`, `classGroupMoment`). O_L is the integral closure of F_q[t] in L_f and Cl(O_L) its Mathlib `ClassGroup`. A pair (L, α) has α : Cl(O_L) ↠ A; the automorphism of L/K acts on Cl(O_L) by −1, so (L, α) ≅ (L, β) iff β = ±α (`ClassGroupSurjectionPair.neg`, free for A ≠ 0 of odd order: `ClassGroupSurjectionPair.neg_ne_self`). The moment is m_A(L) = |Sur(Cl(O_L), A)|, with m_0 = 1 (`classGroupMoment_trivial`). Unit tests: m_0(L_f) = 1; the zero map to Z/3 is not a pair; neg is an involution; m_{Z/3}(L_f) is even.

**Theorems.**
- The σ-anti-invariant quotient J_L/(1 + σ)J_L of the Galois group of the maximal abelian unramified pro-ℓ extension of L is Cl(O_L)_ℓ (ℓ odd, ℓ ∤ q, n odd), from the class-field sequence 0 → Cl(O_L)_ℓ → J_L → Ẑ_ℓ → 0 (FA.4) and the snake lemma.
- EVW Proposition 8.7: for n odd, A ≠ 0 a finite abelian ℓ-group, ℓ odd and q odd prime to ℓ, the points X_n(F_q) of the Hurwitz scheme X_n = Hn^{c_A}_{G_A,n} ⊗ F_q (IG.5) correspond to isomorphism classes of pairs (L, α) with L ∈ S_n.
- Factor two: Σ_{L ∈ S_n} m_A(L) = 2|X_n(F_q)| for A ≠ 0.

#### The empirical law and degree densities

**Empirical law** (`empiricalClassGroupLaw`, `classGroupPrimaryIso`). ν_n(A) := #{L ∈ S_n : Cl(O_L)_ℓ ≅ A}/|S_n|, using the ℓ-primary part (Mathlib `CommGroup.primaryComponent`); EVW print Cl(O_L) ≅ A, which does not give a probability measure on ℓ-groups. API: bounds (`empiricalClassGroupLaw_nonneg`), total mass one for odd q and n (`hasSum_empiricalClassGroupLaw`), and the moment identity: the A-moment of ν_n equals the average of m_A over S_n (`empiricalClassGroupLaw_eq_average`). Unit tests: ν_1 is the Dirac mass at the trivial group; ν_n(A) ≤ 1; a class group Z/2 × Z/3 counts toward A = Z/3 when ℓ = 3.

**Degree densities** (`upperOddDensity`, `lowerOddDensity`, `upperClassGroupDensity`, `lowerClassGroupDensity`). δ^±(q, A) are the limsup and liminf of ν_n(A) along odd n; lower ≤ upper for bounded sequences (`lowerOddDensity_le_upperOddDensity`), both equal the limit when it exists (`oddDensities_eq_of_tendsto`). Unit tests: constant sequences; (−1)^{(n−1)/2} has densities 1 and −1; values at even n are irrelevant.

#### Point counts and the Ellenberg–Venkatesh–Westerland theorem

**Stated input (not planned here).** EVW Theorem 6.1: for (G, c) nonsplitting and a field k with |G| invertible there are A, B such that the stabilisation map U : H_p(Hur^c_{G,n}, k) → H_p(Hur^c_{G,n+deg U}, k) is an isomorphism for n > Ap + B, also on the connected loci; Corollary 6.2: the same for the quotients by G when G is centre-free; Proposition 7.8: for (G, c) nonsplitting, G centre-free and c a rational class generating G, dim H^i_ét(Hn^c_{G,n} ⊗ F̄_q, Q_λ) ≤ C(G, c)^{i+1} for all i, n and λ > max(|G|, q, n). These are owned by the homological-stability Part II of Inverse Galois theory; this stage consumes Proposition 7.8 for (G_A, c_A).

**Theorems.**
- Top-degree trace: for X smooth of pure dimension n over F_q, Tr(Frob | H^{2n}_c) = q^n times the number of Frobenius-fixed geometric components (EDC.2, SF.2).
- Uniform trace estimate (numerical core `trace_error_bound`): if dim H^i ≤ C^{i+1} (i ≥ 1), one component is fixed and √q > C, then |q^{−n}|X(F_q)| − 1| ≤ C²/(√q − C) (SF.2, DWP.7, EDC.2).
- EVW Theorem 8.8 (`evw_uniform_moment_estimate`): for ℓ odd and A a finite abelian ℓ-group there is B(A) with |(Σ_{L ∈ S_n} m_A(L))/|S_n| − 1| ≤ B(A)/√q for all odd q with ℓ ∤ q(q − 1), √q > B(A), and odd n > B(A).
- **Large-q Cohen–Lenstra theorem** (EVW Theorem 1.2, `large_q_cohen_lenstra`): for ℓ odd and A a finite abelian ℓ-group, δ^+(q, A) and δ^−(q, A) converge to μ(A) = ∏_{i≥1}(1 − ℓ^{−i})/|Aut A| as q → ∞ through odd q with ℓ ∤ q(q − 1). The proof applies finite moment control (EVW Proposition 8.3, from the Cohen–Lenstra part of this stage) to ν_n with thresholds from Theorem 8.8 uniform in q and n. Nothing is claimed at fixed q.
- Positive proportions (`positive_proportions_class_numbers`): for q large (odd, ℓ ∤ q(q − 1)) positive lower densities of S_n have class number prime to ℓ and divisible by ℓ; the limits are c_ℓ = ∏(1 − ℓ^{−i}) and 1 − c_ℓ (for ℓ = 3: about 0.560 prime to 3 and 0.440 divisible by 3; EVW §1.1 swaps the two words).

#### Monodromy and symplectic linear algebra

**Symplectic similitudes** (`similitudeCoset`, `similitudeGroup`). For a free module with perfect alternating pairing, GSp_m = {h : h J hᵀ = mJ} for units m; GSp_1 is Mathlib's `symplecticGroup` (`similitudeCoset_one`); cosets multiply (`similitudeCoset_mul_mem`) and base change along ring maps (`similitudeCoset_map`). Unit tests over Z_ℓ: diag(I, qI) ∈ GSp_q; −1 ∈ Sp; diag(1, ℓ) is not a similitude (its multiplier is not a unit).

**Theorems.**
- The ℓ^m-torsion of the Jacobians of y² = f(x) over Conf_n (n = 2g + 1) is a locally constant sheaf of free Z/ℓ^m-modules of rank 2g with perfect alternating Weil pairing; Frobenius acts with multiplier q (A3, JacobianChallenge Layer D).
- The geometric generic fibre of X_n → Conf_n is Sur(V_m, A)/{±1}, equivariantly (EVW print Sur(V, A)); as −I ∈ Sp, its Sp-orbits are those of Sur(V_m, A).
- Achter–Pries: the degeneration of labelled hyperelliptic moduli to Δ_{1,1} with the splitting of Pic⁰[ℓ] along clutching; two overlapping symplectic block subgroups generate Sp(V) over a finite field of odd characteristic (by transvections); the mod-ℓ monodromy of H̃_g and H_g is Sp_{2g}(F_ℓ) for ℓ odd, g ≥ 1.
- Integral lift (`symplectic_eq_of_closed_of_surj_mod`): a closed subgroup of Sp_{2g}(Z_ℓ) with full image mod ℓ is everything when g ≥ 2 or ℓ ≥ 5 (Vasiu, Main Theorem 1.3); at (g, ℓ) = (1, 3) this fails (`exists_proper_closed_surj_mod_three`: an order-24 subgroup of SL_2(Z/9) lifts to a proper closed subgroup of index 27). Hence the ℓ-adic hyperelliptic monodromy is Sp_{2g}(Z_ℓ) in that range, and so is the geometric monodromy of y² = ∏(x − a_i) over Conf_n for n ≥ 5 (n = 3 with ℓ ≥ 5), at every finite level.
- Components: geometric components of X_n ⊗ F̄_q are Sp(V)-orbits on Sur(V, A); an orbit is defined over F_q iff the stabiliser of a point meets GSp_q.
- EVW Lemma 8.9 (`unique_similitude_stable_orbit`, with `gl_transitive_on_surjections`): for q and q − 1 units of Z_ℓ and g ≥ dim A/ℓA, the surjections V → A fixed by some h ∈ GSp_q(V) form one nonempty Sp(V)-orbit. Its proof uses the primary decomposition V = V_1 ⊕ V_q ⊕ W of h, the isotropy of V_1 and V_q and a Lagrangian W_− ⊕ V_q ⊂ ker f, symplectic normal forms over Z_ℓ, and GL_g(Z_ℓ)-transitivity on surjections Z_ℓ^g → A (EVW print "i > g" for "k < i ≤ g").
- Consequently exactly one geometric component of X_n is defined over F_q for odd n larger than a bound depending only on A.

#### Nonabelian moments over F_q(t)

**Convergence mode** (`allowedPrimePowers`, `EventualDegreeLargeQLimit`). A_m is the filter of prime powers coprime to m tending to infinity (`allowedPrimePowers_neBot`); E has eventual-degree large-q limit c if E(·, n) → c(n) along A_m for all large n; the target is unique for large n (`EventualDegreeLargeQLimit.unique`) and survives excluding more q (`EventualDegreeLargeQLimit.mono`). Unit tests: constants; n/(n + q) has large-q limit 0 at fixed n but limit 1 in n at fixed q; the defining set belongs to A_m and A_m ≤ atTop.

**Theorems (Wood 2019).** For G finite and G′ ≤ G ≀ S₂ admissible and centre-free, with c its outside involutions and H₂(G′, c) the reduced Schur multiplier:
- Good G′, per component invariant: the rigid average over IQ_{=q^{2n}} (resp. RQ_{=q^{2n}}) of surjections with a fixed Frobenius-fixed component invariant tends to 1 as q → ∞ (Wood Theorem 4.8; imports Proposition 4.4 from IG.4 and Theorems 4.5, 4.7 from IG.5).
- Good G′, normalised: E^−/|H₂(G′, c)[q − 1]| → 1/|Aut_{G′}(G)| and E^+/|H₂(G′, c)[q − 1]| → 1/(|c||Aut_{G′}(G)|) (Wood Theorem 1.2; the count of component invariants is Wood's Proposition 4.1, owned by the reduced-Schur-multiplier Part II of Induction and restriction; the rigid-to-unrigid conversions are ST.3's).
- Bad G′: only liminf_q Ẽ^±/|H₂(G′, c)[q − 1]| ≥ w n^{N_{G′}−1} is proved, and it transfers to E^±; the printed limit is kept as the proposition `PrintedBadTypeLimitAssertion` (API `PrintedBadTypeLimitAssertion.liminf_bound`, `PrintedBadTypeLimitAssertion.of_eventually_const`; unit tests: n^{N−1} satisfies it, 0 does not, an oscillating function satisfies the liminf bound but not the assertion).
- Component profiles (`FixedDegreeComponentData`, `FixedDegreeComponentData.profile`, `stableMultidegrees`, `FixedDegreeComponentData.stableCount`, `FixedDegreeComponentData.boundaryRemainder`): the profile P_n(q) is the number of Frobenius-fixed components over all multidegrees of total degree d divided by |H₂(G′, c)[q − 1]|; it is nonnegative (`FixedDegreeComponentData.profile_nonneg`), finite-valued (`FixedDegreeComponentData.profile_mem_finite`), and splits into stable and boundary parts (`FixedDegreeComponentData.profile_eq_stable_add_boundary`, `FixedDegreeComponentData.boundaryRemainder_nonneg`). The normalised moment differs from P_n(q) by O_n(q^{−1/2}); the ordinary limit exists iff P_n is eventually constant (`tendsto_iff_eventually_const_of_close`); liminf and limsup are the extreme recurrent profile values (`liminf_limsup_eq_recurrent`). Unit tests: zero counts give 0; a single multidegree; the profile counts boundary multidegrees that the stable sum misses; N₀ = 0 leaves no boundary; the three stable multidegrees for N = 2, d = 4, N₀ = 1; (0, 4) is not stable.
- Stable sums (`parityMultidegreeCount`, `stableRangeComponentSum`): the number of multidegrees with prescribed parities, all coordinates ≥ N₀ and total d, is C(L + N − 1, N − 1) with L = (d − Σ a_i)/2 (`parityMultidegreeCount_eq`); at least v d^{N−1} for large d when N ≥ 2 (`many_large_parity_vectors`); the stable-range component count divided by |A[q − 1]| is the sum over surviving parities (`stableRangeComponentSum_empty`, `stableRangeComponentSum_union`), with generating function X^{N N₀} W(X)/(1 − X²)^N (`stableRangeComponentSum_genFun`). Unit tests: the empty parity set; N = 1, d = 4 with even parity gives 1, odd parity gives 0.

#### Unramified extensions of Γ-extensions (Liu–Wood–Zureick-Brown)

**Theorems.**
- Lemma 9.1: continuous surjections G → H ⋊ Γ correspond to tuples (ρ, N, s, φ).
- Complements (`complements_conj_of_coprime_abelian`): complements of a coprime abelian normal subgroup are conjugate, so H ⋊ Γ → Γ has exactly [H : H^Γ] sections when H is abelian and coprime to Γ.
- Lemma 9.3, under the hypothesis (SZ) that sections of H ⋊ Γ → Γ are H-conjugate: Σ_ρ |Sur_Γ(Gal(K_ρ^{un,∞}/K_ρ)^{(|Γ|′)}, H)| = [H : H^Γ]^{−1} N(H, Γ, D, Q), summing over surjections ρ; over isomorphism classes of Γ-extensions the right side acquires |Z(Γ)|/|Γ|.
- Theorem 1.4: for Γ finite, H finite admissible with (SZ), and q with gcd(q, |Γ||H|) = gcd(q − 1, |H|) = 1, lim_b limsup_q R_b(q) = lim_b liminf_q R_b(q) = [H : H^Γ]^{−1}, where R_b(q) averages |Sur_Γ(Gal(K^#/K), H)| over Γ-extensions with radical discriminant norm q^n, n ≤ b; for each b the limit points in q lie within O_G(1/b) of the value (the printed inner lim_q is not proved). The value is the μ_Γ-moment of the random Γ-group model, whose theory belongs to the random Γ-groups Part II of this roadmap and is not used here.
- Corollary 1.5: for H finite abelian with gcd(|H|, |Γ|) = 1 and H^Γ = 1, the same double limit for |Sur_Γ(Cl(O_K), H)| is |H|^{−1}, the Cohen–Lenstra–Martinet moment, fields ordered by radical discriminant.

#### Dependencies

Within this roadmap: ST.0 (the arithmetic-family carrier; Wood's families IQ, RQ, types and averages), ST.3 (Wood's rigid-to-unrigid conversions), and the Cohen–Lenstra part of ST.5 (`isomorphism-classes-of-finite-abelian-p-groups`, `surjection-count`, `surjection-moment`, `cohen-lenstra-measure`, `finite-moment-control-of-masses`). Other roadmaps: InverseGaloisAndArithmeticFundamentalGroups:IG.0, IG.1, IG.4, IG.5; FunctionFieldArithmetic:FA.4; SchemeAndStackFoundations:SF.2; EtaleDualityAndPerverseSheaves:EDC.2; DeligneWeightsAndPurity:DWP.7; AbelianSchemesAndArithmeticModuli:A3; Tau Ceti JacobianChallenge Layer D. Recorded gaps: the EVW stability and Betti bound (owner: the homological-stability Part II), the reduced Schur multiplier counts (owner: the reduced-Schur Part II), the Deligne–Mumford monodromy of M_1 and M_2, moduli of labelled stable hyperelliptic curves with clutching, Vasiu's criterion for Sp_{2g}, generation of Sp(V) by symplectic transvections, and Schur–Zassenhaus conjugacy for nonabelian coprime H (owner: the random Γ-groups Part II, which imports this stage).

#### Acceptance tests

- q = 3: |S_1| = 6 and |S_3| = 36; six monic squarefree quadratics over F_3.
- For ℓ = 3 and A = 0, δ^±(q, 0) → ∏(1 − 3^{−i}) ≈ 0.560 along odd q prime to 3(q − 1); q ≡ 1 (mod 3) is excluded.
- For V = F_3², A = F_3 the unmarked fibre has 4 points, the marked set 8.
- Lemma 8.9 fails without q − 1 invertible: for q = 1, V = Z_ℓ², A = F_ℓ², there are ℓ − 1 Sp-orbits.
- (g, ℓ) = (1, 3): a proper closed subgroup of SL_2(Z_3) with full image mod 3.
- Wood, G = C_3 ⋊ C_2: the imaginary normalised moment is 1/|Aut C_3| = 1/2 in the eventual-degree large-q mode; n/(n + q) separates that mode from the fixed-q limit.
- LWZB: for Γ = S_3 over Q with rDisc 229, the isomorphism-class count is 1 while the surjection count is 6, the factor |Z(Γ)|/|Γ| = 1/6.

### Dependencies and acceptance of ST.5

**Within ArithmeticStatistics.**
- ST.0: arithmetic families and heights, families defined by local conditions, the squareclass twist family, and the squarefree residue-class counts.
- ST.1 and ST.2: orbit parametrisations and counts.
- ST.3: proven class-group averages and the G-extension families.
- ST.4: the 2-Selmer average, the family average, the Selmer rank bound, rational 2-torsion and the count of squarefree monic polynomials over 𝔽_q.

**Other roadmaps, through requests.**
- SelmerIwasawaCohomology L1, L2 and L4.
- ArithmeticGaloisDuality R02.4.
- ComplexMultiplicationAndExplicitReciprocity CM.1 and CM.3.
- InverseGaloisAndArithmeticFundamentalGroups IG.0, IG.1, IG.2, IG.4 and IG.5.
- SieveMethodsAndPrimePatterns SV.2.
- GeometryOfNumbersAndQuadraticArithmetic GN.0, GN.2 and GN.3.
- AbelianSchemesAndArithmeticModuli A2, A3 and A6.
- FunctionFieldArithmetic FA.4.
- SchemeAndStackFoundations SF.2.
- EtaleDualityAndPerverseSheaves EDC.2.
- DeligneWeightsAndPurity DWP.7.

**Tau Ceti layers.**
- EllipticCurves Layers 1, 3, 4, 5, 6 and 7.
- ClassFieldTheory Layer 7.
- JacobianChallenge Layer D.

**Inputs stated here and owned elsewhere.**
- Smith's 2^∞-Selmer theorem: ArithmeticStatisticsPartIISmithMethod.
- The Hurwitz homological stability theorem and the uniform Betti bound: the Inverse Galois Part II.
- The finite-field classification and counts of abelian varieties: the proposed Part II AbelianSchemesAndArithmeticModuliPartIIFiniteFields.

**Exported to.** ArithmeticStatisticsPartIISmithMethod, ArithmeticStatisticsPartIIRandomGammaGroups, HeightsRationalPointsPartIIRandomFano and CMRankZeroConverse.

**Acceptance.** ST.5 is accepted when:
1. every limiting measure is explicit on its space of classes (μ_{p,u}, CL_S, a_d, A_r, Q, Delaunay's law);
2. every convergence statement names its mode and every lower bound is a liminf;
3. every conjecture appears only as a hypothesis;
4. the Burungale–Tian conversions keep Smith's Assumption 1.1, the signed-integer ordering, the squarefree restriction, parity, the BKLOS isogeny and the rational corank step explicit;
5. local exclusions are recorded: p = 2 in EVW's contraction argument, the (g, ℓ) = (1, 3) monodromy exception, EVW's corrected q-domain, and p = 2 in Lipnowski–Tsimerman's Corollary 5.20;
6. the small cases listed in each part check: a_{d,1} = 1/2, P_2(2 | 4) = 35/64, π_2(0) = 1 − 1/p, #Sp((ℤ/p)²) = p(p² − 1), |S_3| = 36 over 𝔽_3, and μ_{3,0}(0) ≈ 0.560.
