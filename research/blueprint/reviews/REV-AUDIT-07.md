# Review of AUDIT-07

**Reviewer:** REV-AUDIT-07 · **Date:** 2026-09-16 · **Verdict:** `accepted` · **Corrections:** 17
(6 to citations or notes, 11 missing duplicates). **No target status or layer verdict changed.**

Batch: `research/blueprint/audit/AUDIT-07.json`. It covers the ArithmeticStatistics,
DiophantineApproximationAndTranscendence, ExponentialSumsAndCircleMethod,
ProbabilisticAndMetricNumberTheory and SieveMethodsAndPrimePatterns roadmaps: 30 layers, 141 targets,
188 citations and 59 duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`. The roadmap
documents match their extracts word for word, so the layer text is the whole specification.

## What was checked

**Citations: all 188.** They name 173 distinct declarations in 126 files, and every one is at the
claimed library, file and line. Full names were recomputed from each file's `namespace`/`section`
structure. One is wrong: `exist_unique_eq_mul_prod` is `NumberField.Units.exist_unique_eq_mul_prod`,
because `end dirichletUnitTheorem` at line 350 leaves `NumberField.Units` open until line 535. Kinds:
93 theorem, 53 def, 17 lemma, 5 structure, 2 abbrev, 2 class, 1 instance. Nothing is an axiom or a
bare structure field. No cited file contains a `sorry` token, and the only eleven `sorry` tokens in
all of Tau Ceti are in docstrings, so nothing cited depends on `sorry`. One citation, `TauCeti.logBranch`,
is a **`private` def** and was replaced (below).

**Presence claims.** The statement of every citation was read against its target, and all 19
present targets were checked at the source. They hold:

- `selmerGroup₂` is the explicit 2-Selmer group. It is the kernel of the norm class, cut by
  `localCondition` at every finite place and at each member of `Loc`, and each local condition is
  the preimage of the local descent image. It is defined over any Dedekind domain for the
  characteristic-≠-2 normal form.
- `fg_point_of_numberField` needs only `[IsElliptic]` over a number field. The weak Mordell–Weil
  theorem carries the normal form and per-factor class-group and unit hypotheses.
- `pow_rank_le_card_of_range_μ_le` takes any finite `S ⊇ im μ`.
- Nothing outside `SelmerGroup.lean` mentions `selmerGroup₂`, so its finiteness is indeed not stated.
- In Mathlib: the `Height` library (`absMulHeight₁` is normalized by `[ℚ(x):ℚ]`, and
  `Rat.mulHeight₁_eq_max` holds), the `Northcott` class and its number-field instance, Legendre's
  criterion, Dirichlet's theorem in both forms, Liouville's inequality, Siegel's lemma over `ℤ` and
  over `𝓞 K`, torus and finite-group orthogonality, `BoundingSieve`/`SelbergSieve`, conductors with
  `changeLevel_primitiveCharacter`, Dirichlet orthogonality and both Borel–Cantelli lemmas.

**Verdicts.** This batch has no `built` or `process` layer. Across all 30 layers, `partly built`
means exactly that at least one target is present.

**Absences: all 122 absent or partial targets were searched again.** Each was searched by concept,
under Mathlib naming conventions and synonyms, in the index and in the Lean sources of both
libraries. Output was written to files and read in full rather than cut off with `head`. Several
searches could have overturned a verdict but did not:

- **The Hasse bound is not proved.** Tau Ceti has `deg(1 − π) = #E(𝔽_q)` and the homogeneity
  `deg(n•f) = n²·deg f`. Its own docstring says the additivity half of the quadratic form "is not
  proved here", and the `t² ≤ 4q` pencil lemma is conditional.
- **Lindemann–Weierstrass:** Mathlib's `Transcendental/Lindemann/` has only `AnalyticalPart.lean`.
  Neither library has transcendence of e or π.
- **There is no p-adic logarithm.** Tau Ceti's `NormedSpace.logOneAdd` series is proved to converge
  only under `[ContinuousSMul ℚ≥0 𝕂]`, which fails for `ℚ_p`.
- **There is no Haar measure on ℤ_p or ℚ_p.** `Mathlib/NumberTheory/Padics/Measure/*` is
  `AbstractMeasure := C(X, R) →L[R] E`, not a measure.
- **There is no pointwise ergodic theorem**, only von Neumann's mean ergodic theorem (Mathlib) and
  L¹ convergence to the conditional expectation (Tau Ceti). The "mixing measures" in Tau Ceti are
  de Finetti mixtures, not dynamical mixing.
- **Selberg sieve fine print:** the file has no Legendre identity, only an inequality for
  upper-Möbius sequences, and nothing uses `SelbergSieve.level` beyond `one_le_y`.
- **None of the following exists in either library:** a divisor bound, a multivariable Hensel lemma,
  Waring or three-squares theorems, Hasse–Minkowski, class numbers of binary quadratic forms, a
  squarefree density, binary quartic invariants, Delone–Faddeev, Cohen–Lenstra, an equidistribution
  notion, Mertens' theorem, Erdős–Kac, Khintchine, the Gauss map, the large sieve, Vaughan's
  identity, Bombieri–Vinogradov, admissible tuples, Chen's theorem, or expanders.

Two notes about what exists were wrong. Both are corrected below.

**Duplicates.** All 59 name live atlas layers, and none belongs to the retired
FoundationsAndLibraryIntegration. Each claimed overlap is supported by the other layer's own
description. The whole atlas (1,962 stage descriptions) was then searched for owners of each
layer's targets, and 11 were missing.

## Corrections

1. **DT.2, S-unit equations:** the name `exist_unique_eq_mul_prod` was changed to
   `NumberField.Units.exist_unique_eq_mul_prod`. The note already used the full name.
2. **DT.3, chosen logarithms:** the private `TauCeti.logBranch` was replaced by the public
   `TauCeti.exists_differentiableOn_eqOn_exp_comp` (a holomorphic branch of `log ∘ g` on a simply
   connected open set) and Mathlib's `Complex.exists_continuousOn_eqOn_exp_comp`. The note now also
   says why `logOneAdd` is not a p-adic logarithm.
3. **DT.3, transcendence tools:** the note said "Schwarz-lemma extrapolation" is not in Mathlib.
   Mathlib does have `Complex.dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO` (the Schwarz lemma
   for a map vanishing to order `n`) and Jensen's formula `MeromorphicOn.circleAverage_log_norm`.
   Both were added as related. The note now names what is absent: the multi-point extrapolation,
   auxiliary-function constructions and zero estimates. The target is still partial.
4. **ST.0, weighted counts:** the note said "there is no weighted counting function for infinite
   families ordered by height". That is false. `TauCeti.summatory N w x` (`TauCeti/Order/Northcott.lean:82`)
   sums any weight `w` over the members of height at most `x` of any family with a natural-valued
   Northcott height, and Tau Ceti's prime counts are special cases of it. It was added as related.
   The target is still partial: no stabilizer or automorphism weights are set up for curves or
   forms, and real-valued heights are not covered.
5. **ST.0, densities of subfamilies:** the same declaration was added, with its
   `eventually_summatory_indicator_sub_eq`, as the counting carrier a density would be defined
   from. No such density exists yet.
6. **ES.3, Hensel/positivity:** the remark "declared public lemma, so absent from the declaration
   index" was deleted. The pinned `declarations.tsv` does index
   `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`.

The 11 added duplicates:

| Layer | Added | Why |
| --- | --- | --- |
| ST.0 | EllipticCurves layer 8 | Owns `shortEquationHeight = max(4|a₄|³, 27a₆²)` on the minimal-pair model, `naiveHeight E` with ℚ-isomorphism invariance, and finiteness at bounded height. These are three of ST.0's targets, and none is built. |
| ST.2 | GlobalNumberFields layer 3 | 3A plans `#(c•D ∩ Λ) = vol·cⁿ + O(cⁿ⁻¹)` for Lipschitz-parametrizable boundaries, the Lipschitz-principle counterpart of Davenport's lemma. 3C counts inside a non-compact cone that is a fundamental domain for the unit group. |
| ST.3 | ModularForms layer 11 | Hurwitz class numbers from reduced forms, with weights 1/2 and 1/3, and the correspondence between matrix orbits and binary quadratic forms. These are the summands of the Mertens–Siegel sum. |
| DT.0 | GN.1 | Minkowski's convex-body theorems, which DT.0's sixth target also names. |
| DT.3 | IntegralIwasawaTheory L4 | Baker–Brumer p-adic linear independence of logarithms, with its transcendence argument. |
| DT.3 | DirichletPadicLFunctions L3 | The branch `log_p(p) = 0` on all algebraic extensions. |
| DT.3 | ColemanIntegration L0 | The branch `log_p(p) = 0` on annuli, with the effect of changing branch. |
| DT.3 | LocalFieldsRamification layer 1 | `localLogarithm`/`localExponential` on deep units, the Tau Ceti home of a p-adic logarithm. |
| DT.5 | PS.7 | Keeps the period conjecture as a statement. DT.5's own text says to coordinate period statements with PS. |
| DT.5 | DM.8 | Papanikolas's algebraic independence of Carlitz logarithms. This is the function-field analogue, a parallel rather than a shared result. |
| ES.0 | FF.2 | The Weil and Deligne square-root bounds, the half of ES.0's interface target not already covered by FF.1 and FF.5. |

Considered and not added:

- ML.3 and DY.4: different equidistribution theorems, and ML.3 only consumes a Weyl criterion.
- ED.5: a different kind of sieve (the Mordell–Weil sieve).
- AA.2: builds Tamagawa measures but explicitly excludes computing Tamagawa numbers, such as τ(PGL₂).
- AN.2: proves PNT in a *fixed* progression, not uniformly in the modulus.
- EllipticCurves layer 4.5a: Weierstrass invariants, not binary-quartic ones.
- IG.5: contains no counting.

## Most important finding

**The audit's one factual error about library content is a missed Tau Ceti declaration, and a
concept search finds it where a name search does not.** `TauCeti.summatory` is a weighted count over
an infinite family ordered by height, which is what the ST.0 note said does not exist. It sits in
`TauCeti/Order/Northcott.lean` under a counting-carrier name and is used only by the Dirichlet-series
roadmap, so searches for density, weighted-count or orbit vocabulary miss it. It turns up only when
searching from Mathlib's `Northcott` class outward. No status changes, but the note as written
invites someone to rebuild it.

Two process points for later batches:

- **The pinned index lists about 13,000 `private` declarations as ordinary `def`/`theorem` rows.**
  Only the signature column shows `private`. That is how an unusable `private def` reached a
  citation here, so the signature should be checked before citing.
- **This audit was run against the superseded pre-fix index.** Its bare name for
  `NumberField.Units.exist_unique_eq_mul_prod` and its "absent from the declaration index" remark
  both match `declarations.before-public-fix.tsv`, not the regenerated `declarations.tsv`.

Neither affected a verdict. With the corrections above, every claim checked holds.
