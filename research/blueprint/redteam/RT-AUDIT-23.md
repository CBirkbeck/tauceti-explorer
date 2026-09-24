# RT-AUDIT-23

Red team against the accepted library audit `AUDIT-23`, which covers five roadmaps —
Continuous cohomology of profinite groups; Stable, periodic and curved homological
algebra; Automorphic congruences and reverse main-conjecture divisibilities; Ray-class
distributions and general automorphic constructions; Coleman integration and noncritical
Dirichlet L-values — in 45 layer entries, with 304 targets and 696 declaration citations
against Mathlib `082e2d3` and Tau Ceti `f790474`.

The audit is accurate. One finding, of low severity, about a stage it does not cover.

## Finding

**RT-AUDIT-23/1 — missing, low.** The five roadmaps have 46 stages between them and the
audit has 45 entries. `AutomorphicPadicLFunctions:KU-hilberteisenstein` has none.

The roadmap extract lists nine stages for `AutomorphicPadicLFunctions` — L0, L1, L2, L3,
L3h, L4, L4e, L5 and KU-hilberteisenstein — and the audit's `layers` dictionary for that
roadmap holds the first eight. The stage is covered by no other audit: grepping
`research/blueprint/audit/` for the id returns no file, AUDIT-23 is the only audit whose
roadmaps include `AutomorphicPadicLFunctions`, and the id does not occur in the
integrated `data/library-coverage.json`. So its library coverage is unrecorded, and a
worker sent to plan it — told to read the reviewed library audit before planning
anything — finds nothing for it.

The severity is low because the stage constructs nothing of its own. Its description
calls it "a readiness checkpoint … an aggregation of those owners, not a new proof
construction", aggregating `AutomorphicPadicLFunctions:L3` and `IntegralIwasawaTheory:I.3`,
and L3 *is* audited, with a target "Hilbert Eisenstein series, the integral q-expansion
principle and the constant-term argument" marked `partial`: the F = ℚ pieces cited
(`ModularForm.eisensteinSeriesMF`, `EisensteinSeries.E_qExpansion_coeff`,
`ModularForm.qExpansion_injective`) and Hilbert modular forms recorded as absent. It is
not zero, though, because the same description says the checkpoint "Owns any missing
modular-form and q-expansion prerequisites; no weight-two shortcut", which is mathematics
an audit has something to say about.

The fix is one entry with verdict `process`. That verdict exists for exactly this kind of
stage and is already house practice — the integrated coverage file carries 31 `process`
entries, and AUDIT-01, AUDIT-03, AUDIT-06, AUDIT-08 and AUDIT-15 all use it, with targets
and notes like any other entry.

One caveat, recorded because it bears on whose gap this is: both the audit and
`REV-AUDIT-23` describe the scope as "45 batch layers" — the review's notes read "Checked
all 303 targets of the 45 batch layers" and "Mechanically, all 45 batch layers are
present". The stage may therefore have been outside the batch the queue handed the
auditor, rather than dropped by them. Either way the coverage record has the hole, and
nothing in the audit says the stage was skipped or why.

## What held

A clean surface is evidence, so this is reported in full.

**Every citation resolves.** All 696 declaration citations, across all 304 targets, exist
at the pinned commits, each in the file it is cited from and within twelve lines of the
line it is cited at, with no target's citation tagged to the wrong library. The single
apparent exception is not one: `ModularForm.L`, cited at
`Mathlib/NumberTheory/ModularForms/LFunction.lean` line 134, is exactly there, inside
`namespace ModularForm`; the declarations index drops the namespace for several
declarations in that file. `REV-AUDIT-23` records the same observation independently.

**Nothing cited is unusable.** None of the 696 is `private`, and none of the 272 distinct
cited files contains a `sorry` anywhere in the body of a cited declaration. All 272 files
were opened.

**The file is internally consistent.** No target whose `library` field is mathlib, tauceti
or both cites declarations from a different library; no layer with verdict `not built`
contains a target marked built; no target marked `absent` carries an `exact`-fit citation.

**The discrete/continuous distinction is respected** — the one the ProfiniteCohomology
roadmap turns on. Every `exact`-fit Mathlib citation behind a target mentioning
continuity, profiniteness, open or closed subgroups, or all degrees, is right, and the
notes name the hypotheses that matter: `Pi.discreteTopology` needs `[Finite ι]`;
`ContinuousMap.uncurry` and `Homeomorph.curry` need local compactness, which profinite G
satisfies; `TopRep` is a definition with an equivalence to `Action (TopModuleCat R) G`
rather than an abbreviation for it.

**The statements say what the targets claim.** Read at the pin, chosen where a claim could
fail: `explicitCor0_comp_res0`, `explicitCor1_comp_res1` and `explicitCor2_comp_res2` all
read `= U.index • x`, so cor ∘ res is multiplication by the index in each of the three
degrees claimed; `oneObjectHomologicalComplex` takes an object with an endomorphism `d`
and a proof `d ≫ d = 0`, which is its target's differential module;
`LinearMap.IsFrobeniusFunctional.moduleInjective_self` and `moduleInjective_op_self` give
`Module.Injective A A` and `Module.Injective Aᵐᵒᵖ A`, the left and right self-injectivity
claimed; `TauCeti.WreathProduct` is `(ι → D) ⋊ Equiv.Perm ι` with
`PermSubgroupWreathProduct` for a subgroup, as described.

**The partial verdicts that rest on an incomplete degree range are right.** The audit says
Shapiro's lemma and the finite-quotient colimit theorem exist in degrees 0 and 1 but not
2. The index has `explicitShapiro0`, `explicitShapiro1` with their `apply`/`symm_apply`
lemmas and `bijective_explicitShapiroMap1`, and `explicitFiniteQuotientColimit0` and
`explicitFiniteQuotientColimit1` — and nothing in degree 2 in either family.

**Its sharpest technical claim checks out.** The audit says Tau Ceti's `logOneAdd`
specializes to p-adic fields as a definition but that its convergence is proved only under
`[ContinuousSMul ℚ≥0 𝕂]`, which p-adic fields fail. In
`TauCeti/Analysis/Normed/Algebra/LogOneAdd/Basic.lean` the variable block at line 81
carries `[CharZero 𝕂] [ContinuousSMul ℚ≥0 𝕂]` and governs
`one_le_logOneAddSeries_radius` (line 84) and `summable_logOneAdd` (line 107), while the
definition at line 66 sits under a weaker block and does not need it. Exactly right.

**Nothing marked absent is in the libraries under another name.** The 184 absent targets
were searched by concept over the index and then the source trees. Bockstein operators,
the Evens norm, cohomological dimension of profinite groups, Gorenstein-projective
modules, matrix factorizations, Happel's theorem, Positselski's derived categories of the
second kind, p-adic polylogarithms, complete resolutions and stable module categories have
no declaration at the pin. The one case where a library statement does exist is Hilbert
90, and the audit already cites it: `groupCohomology.H1ofAutOnUnitsUnique` as a special
case, the missing statement correctly identified as the profinite one, and the note adding
that Mathlib's own `Hilbert90.lean` lists the infinite case as a TODO.

**The duplication record is right, including where it is empty.** The 39 recorded entries
each name a specific other layer and say what it owns. `StablePeriodicCurved` is the one
roadmap with no recorded duplicates across nine layers, so its mathematics was searched
for in every other roadmap: matrix factorizations, singularity categories, Frobenius exact
categories, totally acyclic complexes, maximal Cohen–Macaulay modules, curved DG algebras,
orbit categories, Verdier quotients, and the names Buchweitz, Orlov, Eisenbud and Happel
occur in no other roadmap's stages. The three near hits were read and are different
mathematics: DGAInfinity layer 11 states the derived/coderived equivalence only within
Koszul duality for augmented DG algebras, EnhancedDerivedSheaves E5 builds stable
∞-categories, RefinedTraceMethods RT.5 builds localizing motives. Zero is the right
answer.

**Each audited layer covers its stage text.** For all 45 entries, the targets were
compared with the milestones of the stage description. Only StablePeriodicCurved layer 8
has materially fewer targets than milestones, three against eight, and that is a
deliberate collapse rather than an omission: its first target names all eight comparison
functors together, and its note says which one exists, in what weaker form
(`HomologicalComplexUpToQuasiIso.Qh`, not a Verdier quotient or a triangle functor), and
that the other seven are absent.

## What I did not do

No Lean was compiled and nothing here is formalised. The declarations were read at the
pinned commits; the mathematics behind a target was checked where the target's claim
turned on it, not everywhere. The deep automorphic targets of `AutomorphicCongruences` and
`AutomorphicPadicLFunctions` are almost all marked absent — 41 of 43 and 33 of 41 — and
for those I checked that they are indeed absent rather than re-deriving the sources they
come from.
