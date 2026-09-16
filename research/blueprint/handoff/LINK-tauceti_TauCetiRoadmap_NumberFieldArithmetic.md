# Handoff: LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic

## State

**Status: complete.** The catalogue-wide screen is finished. The packet is
`research/blueprint/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json`, and
`python3 scripts/check_links.py` reports 0 errors and 0 warnings on it.

This job continued an earlier partial checkpoint (19 links, 4 overlaps, 6 roadmaps examined).
Every checkpoint link and overlap was re-read against both stage texts and kept. Three link
reasons (NFA 2 → ClassFieldTheory 11, NFA 5 → ClassFieldTheory 11, NFA 5 → ClassFieldTheory 13)
gained further evidence, and the NFA 3 / GlobalNumberFields 11 overlap proposal now names the
landed EffectiveBounds inequality. The checkpoint's worker-specific metadata (claim links, branch
names, blob hashes, the unexecuted validation note) was replaced by a short `provenance` block.
Only the packet and this note were edited. No git command was run.

## What the packet contains

- **60 links**: 28 explicit, 32 inferred.
  - **7 incoming.**
    - LocalFieldsRamification Layer 0 → NFA Layers 5 and 6.
    - LocalFieldsRamification Layer 3 → NFA Layers 5 and 6.
    - LocalFieldsRamification Layer 2 → NFA Layer 5 (new; unramified local Frobenius in 5.6).
    - EffectiveBounds Layer 1 → NFA 3.3 and 8.2 (new).
  - **53 outgoing.**

| NFA layer | Consumers |
|---|---|
| 1 (splitting dictionary) | Chebotarev 1, 7, 8, 10; IntegralIwasawaTheory L1 |
| 2 (Frobenius, Artin symbol, ideal Artin map, cyclotomic Frobenius, complexConjugationAt) | Chebotarev 1, 2, 4, 6, 7, 8, 11, 12, 13; GlobalNumberFields 2, 4, 10; ClassFieldTheory 11; HeegnerPointEulerSystems HE.0; ShimuraVarieties V5; ComplexMultiplicationAndExplicitReciprocity CM.3; AnalyticNumberTheory AN.4; ArithmeticGaloisRepresentations R01.5; MordellLawrenceVenkatesh LV.1, LV.10; ClassicalArithmeticCompletion CA.5; FoundationsAndLibraryIntegration LI.4 |
| 3 (index, Dedekind–Kummer, Dedekind's theorem) | PolynomialGaloisGroups 5; CA.5; ComputationalNumberTheory CN.2 |
| 4 (relative discriminant, ramified support) | Chebotarev 2; ClassFieldTheory 13; CA.5 |
| 5 (completions and the local–global dictionary) | GlobalNumberFields 0, 1, 8; GlobalQuadraticForms 0, 2, 4, 5, 7; ClassFieldTheory 10, 11, 12, 13, 14; EllipticCurves 7; SmallRamificationAndAbelianVarietyBaseCases R25.1; MordellLawrenceVenkatesh LV.1, LV.5, LV.6 |
| 7 (integral bases, units) | CA.5; CN.2 |

Layers 6 and 8 have no outgoing links. Layer 6 is consumed only inside NFA. Layer 8 is an
endpoint, although it receives the EffectiveBounds citation.

**10 overlaps.**

| Stages | Recommendation | Summary |
|---|---|---|
| NFA 4 / Chebotarev 2 | rescope | Make `ramifiedPrimes` the NFA 4.3 `ramifiedSupport` (checkpoint) |
| NFA 7 / PolynomialGaloisGroups 0 | keep | Field-side and polynomial-side normal-closure interfaces (checkpoint) |
| NFA 3 / GlobalNumberFields 11 | keep | One shared change-of-basis discriminant lemma (checkpoint, refined) |
| NFA 2 / Chebotarev 4 | keep | Rational versus general-base cyclotomic Frobenius (checkpoint) |
| NFA 3 / AlgebraicCurves 6 | rescope | Kummer's theorem, Conclusion B, is NFA 3.6 over AKLB |
| NFA 1 / AlgebraicCurves 8 | rescope | Decomposition/inertia residue formulas and composita are NFA 1.3 and 1.5 |
| NFA 4 / AlgebraicCurves 7 | rescope | Localization of trace dual and different is NFA 4.2 |
| NFA 1 + NFA 4 / FunctionFieldArithmetic FA.3 | rescope | Import NFA 1.3 and 4.1–4.3 for rings of S-integers |
| NFA 2 / Multiquadratic 1 | keep | Sign-vector Frobenius law; NFA 2.6 is its n = 1 case; add a comparison lemma |
| NFA 4 / LocalFieldsRamification 3 | rescope | One definition of the discriminant ideal, placed in the Dedekind-generic directory so the LocalFieldsRamification → NFA direction is kept |

The AlgebraicCurves packet already records the overlap between AlgebraicCurves 7–8 and NFA 5–6
(transport of the different), so this packet does not repeat it. No roadmap should be merged.

## How the screen was done

- Read the whole NFA document and wrote the inputs and outputs of each layer.
- Read in full:
  - LocalFieldsRamification, GlobalNumberFields, Chebotarev, ClassFieldTheory, EffectiveBounds,
    Multiquadratic;
  - PolynomialGaloisGroups, except the body of Layer 4, which was keyword-screened;
  - GlobalQuadraticForms contracts and Layers 0–7;
  - AlgebraicCurves Layers 2 and 6–8;
  - EllipticCurves Layers 0, 4, 4.5a, 4.5b, 6 and 7;
  - MordellLawrenceVenkatesh.
- Read every stage of these campaign roadmaps: ClassicalArithmeticCompletion,
  FoundationsAndLibraryIntegration, ComputationalNumberTheory, ArithmeticStatistics,
  GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights,
  ArithmeticGaloisRepresentations, SmallRamificationAndAbelianVarietyBaseCases,
  AnalyticNumberTheory, ComplexMultiplicationAndExplicitReciprocity, FunctionFieldArithmetic,
  ArithmeticGaloisDuality, EffectiveDiophantineMethods, InverseGaloisAndArithmeticFundamentalGroups,
  AutomorphicLFunctionsAndLocalFactors, AdelicAlgebraicGroups, HabiroNumberFields,
  FaltingsFinitenessAndIsogenyTheorems, HeightsRationalPointsAndObstructions and ArithmeticKTheory.
- Also read ShimuraVarieties V5, HeegnerPointEulerSystems HE.0, and IntegralIwasawaTheory L0–L2
  and I.1.
- Screened every other roadmap by its atlas summary, stage titles and a keyword-in-context search
  of stage descriptions and documents for NFA objects and their synonyms. Hits were read in context.
- `examined` lists all 212 other roadmaps with the depth of reading. 19 have links, 3 have only
  overlaps, and 190 have neither.

## Links that need the reviewer's attention

These are inferred links whose reasons carry an explicit scope. Please check each scope.

- **LocalFieldsRamification 2 → NFA 5.** Unramified places only. It resolves the old
  R-FROB-DOMAIN note. NFA 5.6 should state its local-Frobenius comparison with an unramified
  hypothesis.
- **NFA 5 → EllipticCurves 7.** NFA supplies finite-level completions and decomposition groups
  with the conjugation square. EllipticCurves itself computes cohomology as a colimit over finite
  Galois quotients. The profinite embedding K^sep → K_v^sep is not NFA's.
- **NFA 2 → ArithmeticGaloisRepresentations R01.5.** This holds for finite-image, e.g. residual,
  representations. NFA's scope-exclusion section describes exactly this downstream use.
  ℓ-adic Frobenius classes are not NFA's.
- **NFA 5 → ClassFieldTheory 10, 12, 14, and NFA 4 → ClassFieldTheory 13.** These rest on NFA's
  declared export of the local-field instance on `v.adicCompletion K`, the normalization of
  `adicAbv`, and `relDiscr`. The CFT texts name the completions but not NFA.
- **The five MordellLawrenceVenkatesh links.** The new roadmap lists no NFA prerequisite.
  - LV.1 uses place-dependent complex conjugations and the local-degree sum.
  - LV.5 uses the step from an inert place to a nonsquare in K_v.
  - LV.6 uses the splitting E_y ⊗_K K_v.
  - LV.10 uses the cyclotomic Frobenius residue congruence.

  The author of MordellLawrenceVenkatesh should consider adding NFA to its prerequisites.
- **Handoff and certification stages.** CA.5 (four links), CN.2 (two), AN.4, ShimuraVarieties V5,
  CM.3 and SmallRamification R25.1: each consumer names the object ("Frobenius and ideal
  factorization", "an index bound/certificate", "Frobenius conventions", "Frobenius elements",
  "prime-ideal Frobenius action", "global discriminant … from the number-field portfolio") but not
  NFA.
- **Explicit links anchored by document-level naming.**
  - GlobalNumberFields 1: its ordering statement names NFA's finite-completion exports.
  - FoundationsAndLibraryIntegration LI.4: the integration covers all of NFA and is anchored at
    Layer 2.
  - IntegralIwasawaTheory L1: the L-block dependency list names NFA.
  - HeegnerPointEulerSystems HE.0: its dependency line names NFA.

## Considered and not recorded

- **NFA 6 → EllipticCurves 7.** The Hermite–Minkowski route for H¹(G_{K,S}, E[m]) needs discriminant
  bounds from the wild different bound, but the stage does not state that use.
- **NFA 7 → ArithmeticStatistics ST.3.** The Galois group of a counted field has no pinned supplier;
  it could be NFA 7.1 or PolynomialGaloisGroups 0 and 6.
- **ArithmeticGaloisRepresentations R01.2 and R01.3.** These need profinite decomposition groups and
  local Artin/Swan conductors, which are not NFA's finite-level objects. NFA defers the general
  Artin conductor to this subject.
- **HabiroNumberFields HB.6.** Its p-adic completion of O_F[1/Δ] is close to NFA 5.7 but no use is
  stated.
- **ModularForms 9 and InverseGalois IG.2.** These read factorization types, which reach NFA 3.10
  only through PolynomialGaloisGroups 5.
- **ArakelovGeometryAndAbelianHeights.** The campaign declares NFA as a roadmap-level prerequisite,
  but no stage names an NFA output, so the declared edge cannot be refined to a stage link from the
  current texts.
- **Chebotarev consumers.** Stages that only choose auxiliary primes by Chebotarev (Euler systems,
  deformations, modularity lifting) are linked to Chebotarev, not to NFA.

## Source issues for the owning roadmaps

1. **Chebotarev 12.1.** It says deleting finitely many Euler factors keeps the Dedekind-zeta residue.
   In fact the residue is multiplied by ∏(1 − N𝔭⁻¹) over the deleted primes. Only the coefficient 1
   of the logarithmic-derivative pole, which the argument uses, is unchanged.
2. **NFA 5.6.** The statement "an `IsArithFrobAt` element maps to the local Frobenius" needs the
   unramified hypothesis. At a ramified place only a coset modulo inertia is canonical.

## Coordination

- A concurrent LocalFieldsRamification link packet is partial. At the time of this screen it records
  no link incident to NFA. If it later adds LocalFieldsRamification → NFA links, deduplicate them
  against the five incoming links here.
- No link here duplicates a recorded stage edge or a link in another packet. The cycle check against
  all packets passes.

## Validation

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json
{"status": "complete", "links": 60, "overlaps": 10, "examined": 212}
0 error(s), 0 warning(s)
```

The packet is ready for independent review.
