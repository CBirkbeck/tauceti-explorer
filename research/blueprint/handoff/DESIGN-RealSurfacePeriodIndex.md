# DESIGN-RealSurfacePeriodIndex: handoff

Issue [#3470](https://github.com/CBirkbeck/tauceti-explorer/issues/3470). Claude (session `claude-QLJ2Os`), 19 October 2026.
Complete design: roadmap definition, packet (status `complete`), reader document and suggested Lean file.

## How the earlier blocker was resolved

The Codex checkpoints of 11–19 October (PRs #8877, #10498, #10691, #10712 and others) stopped because the incorporated
brief requires the real-function-field tranche, which QuadraticFormInvariantsPartII (accepted) assigned to a proposed
roadmap `QuadraticFormsRealFunctionFields` that has no roadmap, packet or design job. This design owns exactly the
Benoist items of that tranche (/14, /94, /95, /141, /142, /143, /191, /192) in its own first layer **PI.0**, which
imports only Tau Ceti, QuadraticFormInvariantsPartII Q2.5 and SemisimpleAlgebrasPartII and never imports the
applications PI.1–PI.9. A `restructure` entry proposes moving PI.0 unchanged into QuadraticFormsRealFunctionFields if
the maintainer creates it (record this move for the QuadraticFormInvariantsPartII split decision). The conjecture
statements /186–/187 are context in the reader only. The other three supplier designs (SemisimpleAlgebrasPartII,
AlgebraicTopologyPartII, HodgeStructuresPartII H.8) are accepted and are cited node by node.

## What is done

- `research/blueprint/roadmaps/RealSurfacePeriodIndex.json`: area `arithmeticgeometry`, ten stages PI.0–PI.9.
- `research/blueprint/packets/RealSurfacePeriodIndex.json`: 98 nodes (14 definitions, 17 constructions, 67 theorems),
  162 API items, 124 unit tests, 31 planets (≤ 6 per layer), 34 baseline declarations (all read in the pinned trees),
  19 requests, 6 gaps, 22 source issues, `routedItemCoverage` for all 100 routed items plus the 10 real-function-field
  items, 2 restructure entries, 2 upstream notes. `check_blueprint.py`: 0 errors, 0 warnings (with the pinned
  declaration index). Every stage `planned`.
- `research/blueprint/readmes/RealSurfacePeriodIndex.md`: rendered from the packet with a hand-written introduction
  (statements of Theorems 0.3–0.6, 0.10, 0.12, 0.13 and Proposition 0.7, strategy, library status, ownership,
  conventions); about 38,000 words.
- `research/blueprint/suggested/RealSurfacePeriodIndex.lean`: **compiled** with `lean-check` at Mathlib `082e2d3` /
  Tau Ceti `f790474`, `sorry` the only warning. It types PI.0 (orderings, Harrison topology, real closures,
  signatures, Elman–Lam invariant, Witt, Springer for Laurent series, Amer–Brumer, the Elman–Lam bound), the field-level
  period/index statements (class index in a local form of SA.0, de Jong in characteristic 0, the norm bound, Pfister's
  criterion), the field-level main theorems (0.3 as "nonreal f.g. transcendence degree 2", 0.10, 0.12, the two-quadrics
  statement behind 0.13) and the real Puiseux field; the 83 geometric targets with their API and tests are listed at
  the end as README targets (their carriers — scheme Brauer groups, equivariant Betti cohomology, cycle classes,
  variations of Hodge structure — are not at the pins).

## Gaps (all recorded in the packet)

- **G1** Propositions 4.4, 4.5, 6.6 for nonconstant real evaluation on Ψ (the printed proofs need [α̃]₀ = 1 on Ψ;
  extraction E3/E4). The induction uses only the uniform case, which is planned and proved.
- **G2** De Jong's reduction (Lefschetz principle with index base change, de Jong 2004 §7); the unramified complex case is PI.2.
- **G3** Relative pair transport of the Kummer lift in the last step of Proposition 6.6 (extraction E21/G13).
- **G4** Inherited: the signed Jannsen chase is AlgebraicTopologyPartII:AT2.16/double-cover-diagram's own gap (extraction G10).
- **G5** Cited, unreconstructed: Bröcker 1980 Satz a)–b), Mangolte–van Hamel Theorem 4.4, Colliot-Thélène–Parimala Prop. 3.1.2.
- **G6** Classical inputs read only through secondary sources: Albert's theorem, the Elman–Lam analysis of
  u(F(√−1)) ≤ 4 (Becher states it for = 4), the anticanonical model of degree-four del Pezzo surfaces.

## Requests and moves

Requests (import only unless stated): PurityForFlatCohomology PF.6 (one new item: residues under a ramified extension of DVRs, Colliot-Thélène 1995 Prop. 3.3.1); SchemeAndStackFoundations SF.0, SF.1, SF.2 (one new item: the Gersten property
used in Proposition 4.2), SF.4, SF.5, SF.6 (real and complex Kummer/comparison sequences); MotivesAndAlgebraicCycles
MC.2 (cycle classes, Lemma 2.1, topological Brauer sequences, Picard primitivity, Kahn's cl_R(K) = w₁) and MC.7 (real
Lefschetz (1,1)); DeformationAndDerivedPatchingAlgebra R03.3 (Serre's normality criterion);
EnriquesSurfacesAndIntegralNonexistence E0 (characteristic-0 characterisation, H³ torsion); and the Tau Ceti layers
cited. Items /09–/10 routed to SF.2 are realised through PurityForFlatCohomology PF.6 (restructure entry 2).
RealAlgebraicGeometry Layer 1 (`exists_realClosure`) is consumed but is not an atlas stage yet (`upstreamImports`,
`upstreamNotes`).

## Sources

Read in full: Benoist 2019, published Numdam PDF (SHA-256 `8dfc0f22…98d3b`, matches the extraction). Read in part:
Bochnak–Coste–Roy (maintainer-cleared copy: Ex. 7.1.4, Prop. 7.1.7, §10.3, Thm 12.4.11, Ex. 15.2.2), EKM (free:
Thm 17.14, §19, §33, §37), Becher 2005 (free LAG preprint 154). Not freely available and not read: de Jong 2004,
Witt 1937 (GDZ, not fetched; replaced by EKM Cor. 37.8), Springer 1955, Lam 2005, Elman–Lam 1973, Pfister 1982,
Bröcker 1980, Mangolte–van Hamel 1998, Degtyarev–Kharlamov 1996, Colliot-Thélène–Parimala 1990, Jannsen 2000.

## For the reviewer

- A Sonnet cross-check of all 120 node-level supplier citations against the supplier statements was run before
  submission; its two mismatches (index base-change invariance, Enriques q = p_g = 0) and the unused or misattributed
  citations it found were corrected.

- Check that PI.0 does not duplicate upstream QuadraticFormInvariants / RealAlgebraicGeometry (it builds Harrison
  topology, signatures at orderings and the Elman–Lam invariant, which neither has).
- The proof of Pfister's criterion (PI.0/pfister-brauer-criterion) is reconstructed from Becher §3 and Albert's theorem
  rather than read in Pfister 1982; Witt's theorem is proved from EKM Corollary 37.8 and BCR §10.3.
- The packet's source issues reuse the extraction's numbers (E1–E24, without the rejected E16 and E19), each rechecked
  against the published text.
