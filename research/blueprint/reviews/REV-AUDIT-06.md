# Review of AUDIT-06

**Job** REV-AUDIT-06 · **Date** 2026-09-16 · **Verdict `accepted`** · **46 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the four roadmaps of `research/blueprint/audit/AUDIT-06.json`: FuchsianOrbifolds,
OneParameterSemigroups, OptimalTransport and AnalyticNumberTheory. That is 50 layers, 351 targets,
679 declaration citations and 41 duplicate records. The audit reads its sources carefully and most
of its claims hold. Its weak point is searching: it looked mainly in the directory the roadmap names,
and missed general-purpose results that live elsewhere in the libraries. Every error could be fixed
in place.

## What was checked

**Every citation, mechanically.** 672 of the 679 citations match `declarations.tsv` at the exact
file and line. In the other seven, the name field was not a declaration name:

- four entries of the form `anonymous instance : …`;
- three entries reading `TauCeti.fourierAtom (public def; absent from declarations.tsv)`.

They now carry real names. For the four instances these are the names Lean generates, read off a
build whose sources are byte-identical to the pin, for example
`TauCeti.instT2SpaceProjectiveSpecialLinearGroupFinOfNatNatReal_tauCeti`. In that build the four
instances and `TauCeti.fourierAtom` are declared exactly at the cited lines 29, 172, 31, 33 and 41.

No cited file (238 after correction) contains a `sorry` token or declares an axiom. The 43
declarations newly cited, renamed or named in corrected notes were checked in Lean against the pinned
Mathlib and that build. All of them exist, and their axioms are only `propext`, `Classical.choice`
and `Quot.sound`.

**Every claim of presence.** The statement of each cited declaration was read against its target.
Two presence claims overstated the library, and both are now `partial`:

- **OptimalTransport 2, strong duality.** Tau Ceti proves Kantorovich duality only on compact
  metrizable spaces. `Duality/LowerSemicontinuous.lean` assumes `CompactSpace` and calls itself "the
  compact exhaustion step used by the Polish lower-semicontinuous regime", and no duality file
  assumes `PolishSpace`. The audit and its summary counted the Polish theorem as built.
- **OptimalTransport 3, the `W_∞` endpoint.** The attainment theorem and the completeness
  instances all assume `p ≠ ∞`. The audit's note said attainment holds for all `p`.

**The built and process verdicts.** Eight of the eleven `built` verdicts hold:

- OneParameterSemigroups: Hille–Yosida, Lumer–Phillips, Bernstein, part C, Bochner and BCR. The
  literal Bernstein statement, with `C^∞` smoothness on `[0,∞)`, is false in the converse
  direction; Tau Ceti proves the correct form, as the audit says.
- AnalyticNumberTheory AN.0 and AN.1.

Three do not, and are now `partly built`:

- **FuchsianOrbifolds 0** and **OptimalTransport 1** each list a `partial` target of their own.
  For FuchsianOrbifolds 0 it is the local-biholomorphism half of item 5: nothing puts a complex
  structure on the free quotient.
- **OptimalTransport 0** lacks one acceptance check: nothing relates `PMF.finiteGluing` to the
  measure-level `Measure.glue`.

OptimalTransport 5 goes from `not built` to `partly built` (see below). The two `process` verdicts
hold: AN.6 is a statement register and export contract, and OptimalTransport 16 is library hygiene.

**The absent and partial claims.** All 213 were searched again, by concept, by Mathlib naming
convention and by keyword, over the index and both source trees. The following were wrong:

| Layer · target | Audit said | In the baseline |
|---|---|---|
| AN.2 · Chebyshev functions | partial; only prime-ideal ψ/θ | Mathlib `NumberTheory/Chebyshev.lean` (from PrimeNumberTheoremAnd): `Chebyshev.psi`, `theta`, Chebyshev bounds, `isBigO_psi_sub_theta_sqrt`, `primeCounting_eq_theta_div_log_add_integral`. Tau Ceti `primeCount_asymptotic_of_primeTheta` (ϑ ∼ δx ⇒ π ∼ δ Li). Now `both` |
| OneParameterSemigroups A · resolvent powers | only private lemmas, no public formula | public `StronglyContinuousSemigroup.resolvent_pow_succ_apply` (`Resolvent/PowerBounds.lean:209`), in the index. Now `tauceti`; summary fixed |
| OT 5 · matrix square root, geometric mean | the Gaussian identities are "not assembled" | Tau Ceti `TauCeti.geometricMean` with its Riccati/uniqueness API, and `Matrix.PosDef.existsUnique_posSemidef_mul_mul`, documented as the Brenier map between Gaussians. Now `both`, so the layer is `partly built` |
| OT 0 · countable chains | the countable projective-family extension "is not visible" | `TauCeti.Measure.exists_isProjectiveLimit_of_countable` (`MeasureTheory/Measure/ProjectiveLimit/Countable.lean:167`); its docstring cites this very roadmap item |
| OT 4 · nonatomic feasibility | positive half absent | Mathlib `Measure.exists_measurable_map_eq` and Tau Ceti `exists_measurePreserving_from_unitInterval`: every standard-Borel law is realized from `(I, volume)`. Only the general nonatomic source is missing |
| OT 11 · KL API | "no `compProd` chain-rule lemma at this pin" | Mathlib `KullbackLeibler/ChainRule.lean` (`klDiv_compProd_eq_add`) and `DataProcessing.lean` (`klDiv_map_le`, `klDiv_comp_right_le`). Still partial: the conditional ∫⁻ form, Pinsker and Donsker–Varadhan are missing |
| OT 8 · Arzelà–Ascoli | absent | Mathlib's general `ArzelaAscoli.isCompact_closure_of_isClosedEmbedding` covers `C([0,T];X)`. Now partial: path-space tightness is missing |
| OT 3 · empirical measures | absent | Tau Ceti `ConditionallyIIDWith.tendsto_empiricalMeasure_ae`, a.s. weak convergence. Now partial: the `W_p` upgrade and the compactness criterion are missing |
| FuchsianOrbifolds 1 · invariant disc | absent | Mathlib `ProperlyDiscontinuousSMul.exists_nhds_disjoint_image` gives the disjoint-translates neighbourhood. Now partial |

Notes were also corrected where they denied existing material, without changing the target's
status:

- Mathlib `AbsolutelyContinuousOnInterval` for metric curves (OT 8).
- Mathlib `Nat.smoothNumbersUpTo_card_le` (AN.5).
- The existing genera: function-field, stable-reduction and permutation-triple (FuchsianOrbifolds
  5).
- A nonexistent lemma name, `MulAction.finite_stabilizer_of_properlyDiscontinuousSMul`
  (FuchsianOrbifolds 0).
- Line numbers 168/186, which should be 172/189.

FuchsianOrbifolds 3 now cites Mathlib's `IsParabolic.smul_eq_self_iff` and `parabolicFixedPoint`
for the unique boundary fixed point, instead of the elliptic `fixedPt`. OT 3 target 2 is now
`partial`: its own note admits that the Borel σ-algebra identification is unproved, and no
`BorelSpace` instance exists. Private declarations cited as `exact` were replaced by public ones
where they exist (AN.0 twice, AN.1, OT 0, OT 5).

The load-bearing absences hold in both libraries. There is:

- no prime number theorem, zero-free region, explicit formula, Hecke or Artin L-function,
  Dedekind-zeta continuation or Chebotarev density statement;
- no Legendre–Fenchel conjugate, Brenier theorem, Monge–Ampère measure or Riemannian exponential
  map;
- no Γ-convergence, EVI, JKO, Sinkhorn, CD/RCD or Gromov–Wasserstein theory;
- no precisely invariant horodisc, complex structure on a Fuchsian quotient, Riemann-surface degree
  theory or `j`-function.

**The duplicates.** All 41 records name existing layers of unretired roadmaps. Two notes were wrong
about ownership. ModularForms **Layer 0**, not Layer 10, owns `ModularForms.LevelOne.JInputs` (the
normalized `j`); Layer 10 consumes FuchsianOrbifolds' `X(1) ≃ ℙ¹`. Twelve records were added:

- BelyiMaps 8 (Riemann surfaces, ramification index, degree, ℙ¹) to FuchsianOrbifolds 5 and 6.
- DenseGraphLimits 1 and 5 (couplings and gluing; unit-interval realization) to OT 0 and 4.
- StandardDistributions 5 to OT 5.
- HopfRinow 1 and 4 to OT 7 and 8.
- SV.3 to AN.3.
- GlobalNumberFields 10 and AL.1 (Hecke characters; Tate continuation) to AN.4.
- PM.5 to AN.5.
- PS.9 (multiple zeta values) to AN.8.

## Result

Verdicts after review: 8 built, 15 partly built, 25 not built, 2 process. There are 702 citations,
each at most five per target, and 53 duplicate records.

## Most important finding

**Absences were decided by searching where the roadmap told the auditor to look.** Five results
that the roadmaps plan to build already exist outside those directories:

- Mathlib's `Chebyshev.lean`;
- Mathlib's KL chain-rule and data-processing files;
- the unit-interval realization of standard-Borel laws;
- Tau Ceti's CFC geometric mean, the Gaussian Brenier map;
- Tau Ceti's countable Kolmogorov extension, which even names OptimalTransport in its docstring.

The same habit also went the other way. The audit read the OT duality directory without checking
its hypotheses, and so recorded a Polish Kantorovich duality theorem that does not exist. Two layers
were marked `built` although their own targets were `partial`, a contradiction a mechanical
consistency check would have caught before publication.
