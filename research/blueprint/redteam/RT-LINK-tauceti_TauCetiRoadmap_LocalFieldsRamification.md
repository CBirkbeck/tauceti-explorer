# Red team: Local Fields and Ramification link map

Issue #4347; worker Codex — `codex-J6LwjP`; 2026-09-30.
Input revision: `ef592ec`.

**Result: complete; no new finding established.** This attacks the accepted,
repaired `LINK-tauceti_TauCetiRoadmap_LocalFieldsRamification` map. It does
not certify every theorem in the upstream documents or the unfinished
consumer blueprints. The original Claude worker and the independent reviewer
`codex-a71f92` were different sessions from this worker.

## Evidence and scope

Read the complete focal README (1101 lines), its five layers, the five
reviewed AUDIT-04 coverage entries, the original handoff and the independent
review report. Read all 45 distinct external stage descriptions occurring
in current links or overlaps, using additional-roadmap definitions in
preference to older descriptions when the IDs coincide. Checked the
roadmap-level dependency and convention passages used as evidence.

All **171 quotations** are literal substrings of their named stage or
actual roadmap document, including the current LV definitions. All
**47 links** have resolved endpoints and correct prerequisite-to-consumer
direction. The conservative confidence policy remains appropriate:
three mutually named abstract profinite inputs are explicit; all 44
outgoing links are inferred.

The archived removals remain justified: LI.4 is retired; current LV.1's
global friendly-place input is not the old local semilinear contract;
the general excellent henselian-trait theorem in LPV.1 is not supplied
by a finite-residue-field local theorem.

## Disposition of every current link

Indices below are zero-based JSON array indices. LFRn is focal Layer n.
These dispositions retain the scope qualifications already present in the
accepted map; they are not new findings.

| Links | Endpoint/use checked | Disposition |
| --- | --- | --- |
| 0–1 | CFT9 residue-degree scaling; CFT13 restricted-product norm preimages | Correct finite-extension and unramified unit-norm inputs. |
| 2–8 | QFI6A/6B/6C normalized valuations, units, square classes and unramified quadratic norms | Retain; the dyadic sharp-depth signature is not a theorem in odd residue characteristic without the proposed adapter. The defect bound uses nonsquare ramified units with odd `0<d<2e`. |
| 9–11 | PP3 → LFR1; PP2/PP4 → LFR4 | Correct abstract pro-p, Sylow and free/presented profinite inputs. Arithmetic wild-inertia identification remains LFR work. |
| 12–13 | R01.2 tame character; R01.3 ramification/conductor input | Correct; quasi-unipotence, nonabelian conductor integrality and the monodromy term are consumer work. |
| 14 | LP0 inertia and the tame Frobenius relation | Correct with the explicit arithmetic/geometric convention translation. |
| 15–18 | RG2.0/1/3 valuation topology and unramified base change | Correct inputs; valued root groups and parahoric comparison are not supplied by field arithmetic. |
| 19–21 | RF0 local coefficients; RF2:untilts and VB0 unramified coefficient field/Frobenius | Correct; completion to E-breve and continuous Frobenius extension remain necessary. |
| 22–25 | ColemanPowerSeries L0 extension structures, Eisenstein generators, unit splitting, unramified coefficients | Correct; inverse-limit norm compatibility and the principal-unit Z_p action are not finite-level splitting theorems. |
| 26–28 | Dirichlet L3 Teichmuller branches; Iwasawa L1 principal units; measures L0 coefficient structures | Correct. Isometric embeddings use extension of the fixed base norm, not independent residue-cardinality normalizations. |
| 29–30 | Selmer L2 local conditions and L3 inertia terms | Correct; unramified H1 is the kernel of restriction, not an inertia-invariant subspace of H1. Infinite extensions are not locally compact local fields. |
| 31 | K-theory L.3 roots of unity and residue-unit quotient | Correct ingredient; the K2 structure theorem and Hilbert-symbol comparison remain elsewhere. |
| 32–33, 43–45 | LV.2/6/0/4/7 unramified fields and field Frobenius | Correct against current contracts. Preserve global completion/decomposition and crystalline-cohomological comparisons; field Frobenius alone does not supply them. |
| 34–36 | Regulator D.1 local objects/Frobenius and D.3 unramified coefficient domain | Correct; Witt/analytic normalization and the p>3 regulator theorem remain consumer work. |
| 37–38 | R07.6 upper numbering; R25.1 local different/discriminant formulas | Correct finite-residue-field inputs. The generic different inequality is not Fontaine's sharper finite-flat torsion estimate. |
| 39 | FA.3 ramification at finite-field completions | Correct scoped import; the global filtration/completion comparison and inseparable branch remain separate. |
| 40 | ES.1 Frobenius quotient and inertia maps | Correct; the finite–singular and transverse cohomological maps are not local-field theorems. |
| 41 | PG.6 unramified coefficient fields and base change | Correct; no unrestricted ramified integral Wach classification is asserted. |
| 42 | GlobalNumberFields7 principal-unit congruence subgroups | Correct; finite-place completion comparisons and infinite places remain global work. |
| 46 | R07.4 Eisenstein polynomial of the totally ramified step | Correct for finite mixed-characteristic local fields, with coefficient/Witt identification and Kisin classification left to their owners. |

## All eleven overlaps

| Index | Decision checked | Scope preserved |
| --- | --- | --- |
| 0 | Uniformizer: rescope | Reuse Mathlib's predicate. LFR supplies the named normalized-valuation comparison; QFI keeps its representatives. |
| 1 | Unified square-depth/count signature: rescope | Retain distinct odd-residue and finite Q2-extension branches and sharpness. |
| 2 | Arithmetic tame characters: rescope | R01.2 imports the tame character and constructs fundamental-character and Weil–Deligne comparisons. |
| 3 | Henselian-trait inertia: rescope | LPV.1 needs greater generality; the proposed local-field comparison does not justify the removed general dependency. |
| 4 | Logarithm: rescope | An early pointwise owner, with analytic annulus continuation elsewhere. For `p=u*pi^e`, the normalized branch requires `log(pi)=-log(u)/e`. |
| 5 | Z2 unit groups: keep | Abstract PP7 remains independent. The raw logarithm lands in 4 Z2; comparison to Z2 requires scaling. Infinite depth is an intersection. |
| 6 | Function-field ramification: rescope | Import local upper numbering at finite-residue completions and global lower numbering/Hurwitz from their owner. |
| 7 | Higher ramification: keep | A named n=1 comparison, without identifying higher-dimensional topology or filtration with the classical one. |
| 8 | Prime-degree conductor: rescope | Total ramification and the unique break are necessary; the unramified conductor is zero. CFT owns its attained-minimum carrier. |
| 9 | Norm subgroup: keep | Formation-indexed and extension-indexed subgroups require a comparison through the fixed-field adapters. |
| 10 | General valued-field inertia: keep | C8 retains its wider scope, with comparison on the common local-field domain and no reverse late-to-early dependency. |

The proposed square/logarithm adapters and comparison theorems are already
recorded work. Their absence from an implementation is not a newly omitted
link-map target.

## Pinned library checks

Fresh source reads on 2026-09-30 used Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

- Mathlib [Valuation/Discrete/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/Discrete/Basic.lean#L199): `IsUniformizer` under rank-one discreteness, `IsUniformizer.is_generator` (387) and `isUniformizer_of_maximalIdeal_eq_span` (409). Also [DiscreteValuationRing/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DiscreteValuationRing/Basic.lean#L93), `irreducible_iff_uniformizer`.
- Mathlib [LocalField/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LocalField/Basic.lean#L45): the local-field class, compact closed balls (68) and compact integer ring (102). Generic point-set consequences already have baseline carriers.
- Tau Ceti [NormalizedValuation.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/NormalizedValuation.lean#L101): the valuation and zero extension (101, 110), minus-log translation (178), surjectivity (246), irreducible value (295), normalized absolute value and its formula (347, 356).
- Tau Ceti [UnitFiltration/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean#L88): definition, congruence and valuation membership, multiplicative depth-zero graded equivalence, antitonicity, intersection, openness, compactness and neighbourhood basis. [Graded.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/UnitFiltration/Graded.lean#L253) separately supplies the positive-depth additive equivalence.
- Tau Ceti [Teichmuller.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/Teichmuller.lean#L100): the section, roots-of-unity equivalence, uniqueness and range.
- Tau Ceti [AbsoluteGaloisGroup.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup.lean#L157): restriction to the separable closure under `Normal F E`, and the absolute specialization (241). This is already a topological group equivalence.

No library-wide nonexistence claim follows from these targeted reads.
The audit's remaining local extension and ramification work is not declared built.

## Catalogue-wide omission screen

Searched 2028 current atlas/additional-definition stages in 221 roadmaps.
The six families produced respectively 106, 26, 150, 18, 14 and 19 stage
hits (248 distinct stages, 94 owners): local fields/normalized valuations/
ramification indices/uniformizers; unit filtration/principal units/
Teichmuller/power classes; unramified fields/Frobenius; Herbrand/Hasse–Arf/
different/Eisenstein/monogenicity; wild inertia/tame character/quotient;
exact roadmap names. Read matching contexts, not merely names. Also
screened whole-document exact-name contexts and blueprint requests.

Read 17 additional complete candidate contracts: AutomorphicCongruences L2,
GeneralizedHeegnerCycles GH.7, FunctionFieldArithmetic FA.2, R07.3,
PadicHodgeTheory R06.1 and P7:annulus-foundations, KTheoryFiniteLocalFields
L.2/L.6, K2SymbolsBrauer T.7, ClassicalArithmeticCompletion CA.7,
DeformationAndDerivedPatchingAlgebra R03.4, ArithmeticGaloisDuality D7,
AnabelianGeometry NC.3, AutomorphicPadicLFunctions L2, EndoscopicTransfer
ET.3, HigherLocalFields HL.0 and ArithmeticStatistics ST.3.

The three roadmaps beyond the original 217-entry examined list are
RiemannianGeometry, SeveralComplexVariablesKahlerGeometry and
SymplecticContactGeometry. Their summaries/stage inventories and search
results contain no exact local-arithmetic supplier/use match.

No new finding was established from these leads:

- Unramified representations, Satake parameters, geometric covers,
  Clifford-theoretic inertia and modular-form Eisenstein polynomials do not
  by vocabulary alone consume the focal arithmetic.
- CFT, K-theory, Heegner/Iwasawa, automorphic and Selmer consumers already
  have supplier routes. A path is not a proof of each downstream lemma;
  it prevents declaring the supplier entirely disconnected.
- FA.2 needs a local-completion construction and global restricted-product
  analysis. Compactness of an already supplied nonarchimedean local field
  is baseline structure. The stage alone does not establish a new use of
  LFR's unfinished finite-extension package. No purported missing theorem
  or mandatory extra edge is inferred from the absence of a graph path.
- P7's general annulus/coefficient-extension theory can be stated over
  complete valued fields, beyond LFR's finite-residue domain. The partial,
  unreviewed P7 packet states its coefficient-extension node with that
  generality and separately requests ramification for Tate–Sen estimates
  in R06.1. Those are useful blueprint leads, not accepted evidence that
  the general analytic theorem is supplied by LFR. The accepted R06.1
  decomposition inspected here concerns perfectoid B_dR construction.
- R03.4's algebraic characteristic-zero point extraction must be separated
  from a topological local-field adapter. Its unreviewed request for that
  adapter does not itself establish a new accepted dependency.
- Requests for finite-residue LFR results over arbitrary perfect or
  algebraically closed residue fields need scope repair before they can
  support edges. No pending request was treated as a verified theorem.

Known limits from the original handoff remain: completion of the maximal
unramified extension, infinite-level upper-numbering interfaces, general
henselian/valued-field inertia, and consumers without atlas stage IDs.
These were already recorded, so this report does not relabel them as new
discoveries. No unread external mathematical source is claimed verified.

## Integration and checks

Read-only assembly produced **2840 stages and 8007 edges**. Of the focal
47 links, **42 are active**. Exactly five, to LV.0/2/4/6/7, occur in
`deferredLinks` awaiting endpoint promotion; they have not disappeared.

All **21 delegated pairs** are accepted and active: 15 in ClassFieldTheory,
five in NumberFieldArithmetic and one in AlgebraicCurves. In addition,
RS-28 already installs LFR0 → HL.0, replacing the original handoff's
obsolete reliance on retired LI.4. No duplicate repair is needed.

A conservative union of the assembled graph, all 36 current research link
packets and declared stage prerequisites contains **8456 edges**. No target
of any focal link reaches its source, including the deferred LV pairs.
Read-only assembly also accepts the current integrated graph.

Validation:

- `scripts/check_links.py`: 47 links, 11 overlaps; zero errors and warnings.
- Strict quotation audit: 171/171 literal matches.
- `scripts/check_redteam.py`: passes.
- `research/blueprint/intake.py check-files`: two authorized deliverables, no problems.
- `git diff --check`: passes.

No blueprint or Lean file is part of this job; no Lean compilation was run.
Only this report and its result JSON are submitted.
