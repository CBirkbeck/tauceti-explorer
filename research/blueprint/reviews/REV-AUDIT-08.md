# Review of AUDIT-08

**Job** REV-AUDIT-08 · **Date** 2026-09-16 · **Verdict `accepted`** · **50 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-08.json`: ArithmeticDirichletSeries,
AbelianSchemesAndArithmeticModuli, AnabelianGeometryAndNonabelianChabauty,
ArakelovGeometryAndAbelianHeights and ArithmeticDynamics. That is 38 layers, 147 targets, 258
declaration citations (238 distinct declarations in 70 files) and 58 duplicate claims.

The ArithmeticDirichletSeries entry is careful and almost entirely right. The other four roadmaps
are mostly unbuilt, and their audits rest on "zero occurrences" string searches. That was the weak
point: several such claims were literally false, and one whole Tau Ceti library relevant to three
of the roadmaps was never searched. Every error could be fixed in place.

## What was checked

**Every citation, mechanically and in Lean.** All 258 citations resolve in `declarations.tsv` at
the claimed library, file and line. No cited file contains a `sorry` token; at this pin Tau Ceti
has `sorry` and `axiom` only inside comments. Nothing cited is an axiom.

After the corrections there are 281 citations of 261 distinct declarations. The 242 declarations
from the 86 files built in a Tau Ceti checkout pinned to the same Mathlib were checked with
`#print axioms`; that checkout's source is byte-identical to the baseline for every one of those
files. Two names failed, and all others resolve with axioms only among `propext`,
`Classical.choice` and `Quot.sound`. The other three files (`NaturalDensity`, `Prime/Psi` and
`ResidueDegree`) were checked at source; their namespaces are unambiguous.

- **Two wrong names (4 citations).** The index records
  `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` and `.cartierDualDualIso` without their
  `TauCeti.` namespace, and the audit copied them. Lean reports both as unknown constants and
  accepts the prefixed names, which are now cited.
- **Three deprecated aliases (4 citations).** `Ideal.finite_setOf_absNorm_eq`,
  `NumberField.finite_setOf_mulHeight_nat_le` and `NumberField.finite_setOf_logHeight₁_le` were all
  deprecated on 2026-07-09. They are replaced by the `finite_setOfPred_*` theorems.

**Statements.** Every cited declaration was read against its target. The five `built` verdicts
(ArithmeticDirichletSeries Layers 0–4) hold target by target: the carriers and rejection tests,
`regroupByNorm` with its converse, ideal convolution and Möbius inversion, the analytic Euler
product and its holomorphic logarithm, and the counting carriers. Both `process` verdicts match
their layer text: A0 is "an import boundary, not a second construction", and NC.6 is an export and
bookkeeping layer.

**Absences.** Essentially every absent or partial claim was searched again. The searches ran by
concept and by Mathlib naming convention, over the index and both source trees. The load-bearing
absences hold:

- there is no abelian scheme, Picard functor, dual abelian variety, Weil pairing or Tate module;
- there is no étale fundamental group, nonabelian `H¹`, Selmer variety, Coleman integral or
  `p`-adic height;
- nothing Arakelov-theoretic or Faltings exists;
- there is no Berkovich space, dynatomic polynomial, equidistribution, arboreal representation or
  dynamical Mordell–Lang;
- Wiener–Ikehara itself is not proved, and neither are `PrimeBoundaryRemainder`, the
  Dirichlet-density calculus or `HasCancellation`.

**Duplicates.** All 58 resolve to live atlas stages, and none is in the retired
`FoundationsAndLibraryIntegration`. Each is borne out by the target stage's own text. NC.2 → R06.5
and NC.3 → R02.6 are declared-supplier links rather than overlaps, and their notes say so.

## Corrections

The 50 corrections are the 7 name fixes above, 3 status changes, 9 corrected overclaims, 7 reworded
"zero occurrences" claims, 12 completed citations and 12 duplicate changes. A tenth overclaim, at
R35.6, is recorded together with that entry's alias fix.

**Status changes.**

| Entry | Audit said | Now |
|---|---|---|
| AbelianSchemes A3 · `[n]` of rank `n^(2g)`, étale iff `n` invertible | absent | **partial.** Tau Ceti proves `deg [n] = n²` (`degree_mulByIntIsogenyOfNeZero`), `[n]` separable iff `(n : F) ≠ 0` (`isSeparable_mulByIntIsogeny_iff`) and `#ker [n] = n²` over an algebraically closed field (`card_ker_mulByIntIsogeny`). This is the g = 1, field-base case, in its function-field model of elliptic curves |
| AbelianSchemes A3 · layer verdict | not built | **partly built**, the same kind of field-case coverage as A1 |
| ArithmeticDynamics DY.0 · periodic and preperiodic points, orbit maps | wholly in Mathlib | **partial.** Preperiodic points are defined in neither library (the word never occurs), and no forward-orbit map of a self-map exists |

**Overclaims corrected.**

- **ArithmeticDirichletSeries Layer 9.** The entry and the summary said the Chebyshev growth bound
  is derived. Only `∑_{n≤t} a n = O(t log t)` is (`isBigO_sum_Icc_norm_of_boundary`), and
  BoundaryGrowth.lean itself calls this one logarithm short of Chebyshev's `O(t)`. The smoothed
  asymptotic is re-labelled `related`: it is a consequence of the target, not a special case of it.
- **Arakelov R35.6.** "Northcott is done in the generality needed, including tuples" is wrong.
  Mathlib has it for elements only, and `Height/Northcott.lean` lists the projective instance as a
  TODO. The cited `…mulHeight_nat_le` lemma is a stepping stone for `![a, n]`.
- **Anabelian NC.3.** "No continuous cohomology of a Galois group" is wrong. Mathlib defines
  `continuousCohomology`, and Tau Ceti builds on it up to the Kummer map `Kˣ/(Kˣ)ⁿ ↪ H¹(G_K, μₙ)`.
- **Anabelian NC.0.** The entry cited only the abstract Galois-category API. Mathlib also has
  `CommAlgCat.FiniteEtale` with its fibre functor at a geometric point, which is the affine case.
  The summary's "only instantiation is Tau Ceti's topological one" also ignored Mathlib's finite
  `G`-sets.
- **Isogeny degrees (A3, A6, R35.4).** "No isogeny has a degree" and "no action on invariant
  differentials" are wrong for elliptic curves: `TauCeti.Isogeny.degree` has the tower formula, and
  `pullbackDifferential_invariantDifferential` exists.
- **Quotients (A3).** Tau Ceti builds the fppf quotient sheaf of an affine group scheme by a
  normal subgroup, with its universal property (`fppfQuotientSheaf`, `fppfQuotientHomEquiv`).
- **Heights (R35.1).** `Height.mulHeight` is the unnormalized height relative to the field, not
  the absolute one; Mathlib's absolute height is `NumberField.absMulHeight₁`.
- **ArithmeticDirichletSeries Layer 4.** The Northcott instance rests on
  `Ring.HasFiniteQuotients.finite_absNorm_le`, not on a deprecated alias.

**Literal "zero occurrences" claims reworded.** In each case the substance stands.

- `Siegel` occurs as Siegel's lemma.
- `Chabauty` and `Coleman` occur in Tau Ceti provenance comments.
- `semistable` occurs once, in a comment.
- "no `Pic` of a scheme" overlooks `LineBundleClass X`, which is the Picard monoid (A0, NC.5).
- "no Dieudonné theory" overlooks Mathlib's one-dimensional `WittVector.isocrystal_classification`.

**Citations completed.** Each of these entries omitted a directly relevant declaration.

- **Mathlib's `NumberTheory/Chebyshev.lean` (ArithmeticDirichletSeries 5, 6).** This is the
  `K = ℚ` case of `primeTheta`/`primePsi`, of the higher-prime-power bound (`psi_sub_theta_le`) and
  of the ϑ-to-π identity.
- **ArithmeticDirichletSeries Layer 7.2.** Tau Ceti's divergence and ratio lemmas for the
  logarithmic normalization.
- **ArithmeticDirichletSeries Layer 8.** Mathlib's `LSeries.positive_of_differentiable_of_eqOn` and
  `DirichletCharacter.norm_LSeries_product_ge_one`.
- **DY.1.** Mathlib's `Height.logHeight_eval_le` and `_ge`, which give `h(F x) = N h(x) + O(1)`
  for morphisms of `ℙⁿ`. This is the height-machine input to the canonical height.
- **A5 and R35.2.** Mathlib's `PeriodPair.derivWeierstrassP_sq`, the Weierstrass equation of ℘.
  The note's `Toric.ComplexTorus` line is also corrected, from 62 to 67.
- **NC.2.** `TauCeti.Tannaka.fgPointTensorIsoEquiv`, the reconstruction theorem.
- **NC.3.** The Kummer map.
- **R35.1.** The product formula itself, `NumberField.prod_abs_eq_one`.
- **DY.5.** `Polynomial.Gal.galAction`.

**Duplicates.** Eleven overlaps were added, and one note was corrected:

- ArithmeticDirichletSeries 6 → Chebotarev 5. Chebotarev builds its own cancellation continuation
  `cyclotomicCharacterSeriesC`.
- ArithmeticDirichletSeries 10 → AN.4, the Dedekind analytic interface behind 10.4's boundary input.
- A1 → ModularCurves 1D, the scheme-theoretic elliptic curve "#81".
- A3 → ModularCurves 2A (`[N]` finite locally free of rank `N²` and étale) and EllipticCurves
  Layer 1 (degree and dual isogeny). The ModularCurves 0B note now records that 0B also owns the
  fppf quotient.
- NC.0 and NC.2 → PS.9, the motivic fundamental group of `P¹ ∖ {0,1,∞}` with tangential base
  points.
- NC.2 → MC.6, whose tensor-isomorphism torsors are the path torsors.
- NC.3 → RP.1, Kummer maps and Selmer groups.
- DY.4 and DY.6 → RP.5, Bogomolov small points, Mordell–Lang and Manin–Mumford.

The four roadmap summaries were brought in line with the corrected entries.

## Most important finding

**The audit never searched Tau Ceti's elliptic-curve isogeny library (`EllipticCurve/Isogeny/`,
317 `TauCeti.Isogeny.*` declarations), and three absence claims fell because of it.** That library
proves the dimension-one, field-base case of AbelianSchemes A3's `[n]` target:
`deg [n] = n²`, the separability criterion for `[n]`, and `#ker [n] = n²`. It also supplies the
isogeny degree and the pullback of the invariant differential. The audit declared all of these
nonexistent, and consequently marked A3 `not built`, A6 degree-free and R35.4 without an action on
differentials. The search looked only for group-scheme vocabulary, and Tau Ceti models these
isogenies contravariantly through function fields.

A second, tooling lesson: `declarations.tsv` does not only omit declarations (REV-AUDIT-01) and
keep deprecated aliases. It also records wrong names when a file contains an anonymous
`namespace … end` block, which is how two non-existent names entered four citations here.
Resolving every cited name in Lean, rather than in the index, is what caught them.
