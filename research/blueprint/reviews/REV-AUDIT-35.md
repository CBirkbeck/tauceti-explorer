# REV-AUDIT-35 — review of AUDIT-35

**Verdict: accepted.** 1 correction, 2 citations added. 212 targets checked.

Batch: `MotivesAndAlgebraicCycles`, `AInfCohomology`, `AdicEtaleGeometry`, `AdicSpacesPartII`,
`CohomologyComparisons` — 38 layers, 212 targets, 226 declaration citations (224 audited, two added
here), 136 duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`. Reviewer: Claude Code, session
`cc-7b31c4`, issue #870; the audit was done by the local lane `claude4/1` (ledger, 2026-09-17), so
this is a different agent.

## What the audit claims

31 layers "not built", 6 "partly built" and one "process"; of 212 targets, 178 absent, 23 partial,
7 present in Mathlib and 4 in Tau Ceti. That picture survived review. The batch is motives and
algebraic cycles, integral A_inf cohomology, the adic-étale geometry that diamonds need, its Part II
and the comparison roadmap that assembles them, and the libraries contain none of that theory — but,
as the audit says and I confirmed, they contain a good deal of its input: Mathlib's Karoubi envelope,
Witt vectors, `Perfection`/`PreTilt`, Fontaine's θ and the two de Rham period rings, the étale and
pro-étale sites of schemes with ℓ-adic cohomology, and Tau Ceti's large Huber/Spa development.

## 1. Every claim that something is in the libraries

**All 224 citations check out** against `declarations.tsv` at the pinned commits, exactly on name,
library, file and line; the 80 distinct files they name all exist and **none contains a `sorry`**.
Layer coverage is exact: the 38 audited layers are the 38 the atlas gives these five roadmaps, none
skipped and none invented, and all 136 duplicate targets resolve to real atlas stages.

I read the source behind all eleven targets claimed present. Ten hold as stated:

* **`AI.0` / `AI.0:integral`, A_inf and θ.** `PreTilt O p` is the tilt of any `p`-adically complete
  `O`, `WittVector p (PreTilt O p)` is A_inf with `frobeniusEquiv`, and `fontaineTheta`,
  `surjective_fontaineTheta` and `fontaineTheta_teichmuller` are as described — "more general than
  the roadmap assumes" is right.
* **`AI.0`, B_dR.** `BDeRhamPlus R p = AdicCompletion (ker (fontaineThetaInvertP R p)) (Localization.Away (p : 𝕎 R♭))`
  is literally the stated construction and `BDeRham` inverts the generators of ker θ. The note's
  claim that only the `CommRing` structure is derived is right, and the file's own TODO list is the
  evidence: extend θ to B_dR^+, prove it a DVR, prove ker θ principal.
* **`A0`, the analytic locus.** `spaAnalytic` is Wedhorn 7.39, with quasi-compactness, equality with
  Spa for a Tate ring, the finite rational cover by generators of an ideal of definition, and
  `isTateRing_completion_locTopology_of_mem_generators` — which is exactly A0's "Tate charts on the
  analytic locus", and applies to non-Tate pairs.
* **`A0`, rings of definition.** `IsPseudoUniformizer`, `PairOfDefinition.completion`, `spa` and
  `spa_integralClosure` are there and are the bookkeeping A0 names.
* **`A1`, the canonical topology on a finite algebra.** The note says Tau Ceti proves Wedhorn
  Proposition 6.18(1) in full, including uniqueness. `FiniteModuleTopology.lean` proves only the
  Hausdorff clause, but its own module docstring shows the claim is right: the other three clauses
  (first countability, nonarchimedeanness, completeness) are proved in
  `TauCeti.Topology.Algebra.Module.Finite` and re-exported there, and "together with
  `IsTateRing.isModuleTopology`, these results give the existence and uniqueness asserted by
  Proposition 6.18(1)". Proved for any finite module, so more general than A1's finite-étale case,
  as the note says.
* **`A2`, closed polydiscs.** `closedPolydisc` is `Spa(A⟨T₁,…,T_k⟩, A⟨T⟩°)` over a nonarchimedean
  ring, with `restrictedMvPowerSeriesCompletion` behind it.
* **`MC.1`, the Karoubi envelope.** `Idempotents.Karoubi` with `toKaroubi` and the finite-biproduct
  structure is as claimed, for an arbitrary category.

The eleventh needed a correction.

## 2. The one correction

**`MC.1`, the universal property of idempotent completion.** The note stated the declaration as
`karoubiUniversal : (Karoubi C ⥤ Karoubi D) ≅ (C ⥤ Karoubi D)`. Two things are wrong with that. The
equivalence with that shape is `karoubiUniversal₁ C D : (C ⥤ Karoubi D) ≌ (Karoubi C ⥤ Karoubi D)`
(an equivalence of categories, not an isomorphism, and in the other direction). And
`karoubiUniversal C D` is a different statement — `(C ⥤ D) ≌ (Karoubi C ⥤ D)` — which, like
`functorExtension : (C ⥤ D) ⥤ (Karoubi C ⥤ D)` and the intermediate
`karoubiUniversal₂ : (C ⥤ D) ≌ (Karoubi C ⥤ Karoubi D)`, is proved only under
`[IsIdempotentComplete D]` (`FunctorExtension.lean`, `section IsIdempotentComplete`, line 198).

The hypothesis is the part that matters for the layer. Without it the universal property is the `₁`
form, whose functors land in `Karoubi D`; with it, functors out of the motive category land in `D`
itself, which is the form a realization functor into an idempotent-complete target will want. The
note now says which statement is which and where the hypothesis sits, and `functorExtension₁` and
`karoubiUniversal₂` are added to the target's declarations. The `mathlib` status of the target and
the `partly built` verdict of MC.1 are unchanged: `karoubiUniversal₁` is unconditional, so the
universal property is present either way.

## 3. Re-searching the absent and partial claims

I re-searched by concept over `declarations.tsv` (246,008 Mathlib and 70,802 Tau Ceti declarations)
and with `grep -rn -i` over both trees. Nothing turned up that the audit missed. Zero
declaration-name hits for: Chow groups, motives, Weil cohomology, numerical equivalence, crystalline
or log-crystalline cohomology, de Rham cohomology, de Rham–Witt, prismatic, A_cris/B_cris/B_st,
Breuil–Kisin twists or modules, `Spf`, formal schemes, analytification, dagger algebras,
overconvergence, `AdicSpace` as an object, completed tensor products, Lη/décalage, and Hyodo–Kato.

The pieces that do exist are cited where they belong, which I checked rather than assumed:

* **Cycles.** `AlgebraicGeometry.AlgebraicCycle` is in Mathlib, and the audit's `partial` for proper
  pushforward is exactly right — `AlgebraicCycle/Basic.lean` has four declarations
  (`AlgebraicCycle`, `mapCoeff`, `map`, `map_id`), proves `map_id` and no `map_comp`, and has no
  projection formula and no equivalence relation.
* **ℓ-adic cohomology.** `Scheme.ellAdicSheaf` and `Scheme.EllAdicCohomology` exist and are pro-étale
  cohomology of ℤ_ℓ **on schemes**; the file's own note says the comparison with classical étale
  cohomology is future work. The audit cites it as `related` in MC.2 and CP.1 with precisely that
  caveat, and does not let it stand for étale cohomology of an adic space.
* **Sites.** Mathlib's `Scheme.etaleTopology`, `smallEtaleTopology` and `proetaleTopology` are cited
  on the two targets that ask for étale and pro-étale sites, with the point that they are sites on
  schemes and not on adic carriers.
* **Kummer map.** `TauCeti.kummerMap : Kˣ →* Multiplicative (H¹(G_K, μₙ))` is there, as the
  `CohomologyComparisons` summary says, built as the degree-zero connecting map of the Kummer
  sequence.
* **`process`.** The one process layer, `AdicSpacesPartII:R4`, carries four absent targets and is an
  explicit re-export: its atlas description calls it "the **early site reexport**, not a completed
  derived-cohomology package", which is the pattern the earlier accepted audits use.

## 4. Duplicates

All 136 resolve, and the ones I checked are borne out by the target layer's description. The batch's
strongest claim is in the `MotivesAndAlgebraicCycles` summary — that the roadmap must be reconciled
with `SchemeAndStackFoundations:SF.5` and `MotivicEtaleKTheory:M.4`/`M.5a`, which promise the same
cycle and correspondence groups — and it is not left as prose: MC.0 records SF.5, M.4, M.5a and
`SchemeKTheoryOperations:S.7`, and MC.1 and MC.4 record M.5a again where the correspondence category
and the sheaves with transfers recur. `GeneralAlgebraicKTheory:K.3` for the idempotent completion of
exact categories, `PeriodsAndSpecialValues:PS.0`/`PS.2` for realizations and the Nori period torsor,
and `GeometricSatakeAndFusion:GS4` for Tannakian reconstruction are all apt. I found nothing to add.

## Most important finding

Nothing substantive was wrong: every verdict, status and citation survives. The correction that
changes what a planner reads is the universal property of the Karoubi envelope — the unconditional
statement lands in `Karoubi D`, and the clean `(C ⥤ D) ≌ (Karoubi C ⥤ D)` form that MC.1 will use
carries `[IsIdempotentComplete D]`. The audit's most useful contribution, which survives review
intact, is the opposite of an absence: Mathlib's period-ring material (A_inf, θ, B_dR^+ and B_dR)
and Tau Ceti's Huber/Spa development are both further along than the roadmap documents assume, and
the audit says so target by target.

## Checks run

- Every citation matched against `declarations.tsv` at the pinned commits (224/224); every cited
  file opened and scanned for `sorry` (80 files, none); every declaration behind a claim of presence
  read in the source.
- Layer coverage compared against `data/atlas.json` (38/38, none extra); every duplicate target
  resolved against the atlas stage list (136/136).
- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-35.result.json`:
  no problems.
- No Lean file was written or compiled, and no claim is made that anything here is formalised.
