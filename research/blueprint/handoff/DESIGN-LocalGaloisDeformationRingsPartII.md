# DESIGN-LocalGaloisDeformationRingsPartII

Issue #3432. Worker: Codex, session `codex-Gy9mlR`, 19 October 2026.
The bot confirmed this session's claim before work began. This submission is a
complete target-level design pass, ready for independent review.

## Delivered scope

The roadmap extends `LocalGaloisDeformationRings` in the explicit tame rank-two
direction of Breuil–Herzig–Hu–Morra–Schraen (BHHMS). Its eight layers cover tame
types and weight labels, Kisin gauge charts, monodromy jets, residual
classification and restriction, admissible types, polynomial approximation,
single-type presentations and special fibres, and simultaneous type
presentations with the integral component-intersection relation.

The packet has 40 nodes: 18 definitions/constructions, 4 lemmas, 16 theorems,
1 comparison and 1 application. There are 68 API items, 63 mathematical Checks,
33 planets and 14 baseline declarations. Every definition/construction has an
API, recorded uses and at least three Checks. All 34 incoming BHHMS route items
have explicit owners or an exact import. In particular MP.3 retains ownership
of the tame Serre-weight set.

All eight layers are **planned**, with zero recorded gaps and six open supplier
requests. No layer is marked closed. Each coverage record names the supplier
interfaces reachable from that layer. Every node's implementation status is
unchecked. The reader contains the full target statements, hypotheses, proof
plans, APIs, Checks, prerequisites and source locators. No formalization claim
is made.

## Scope split for the maintainer

The issue explicitly permits planning the first independent direction and
proposing the remaining directions separately. The packet's `restructure`
entry therefore proposes:

1. `LocalGaloisDeformationRingsPartIIComponentsAndNormality`: one continuation
   combining Böckle–Iyengar–Paškūnas (102 routed items) and Paškūnas–Quast
   (65 items). Its original BIP route's id, title, parent, area and brief are
   preserved exactly. The PQ brief is an extension of that same proposal.
2. `WeightZeroCrystallineLiftingRings`: the independent Boxer–Calegari–Gee–
   Newton–Thorne weight-zero/Emerton–Gee direction (29 items), preserving its
   original route identity and brief.

The three item lists are retained exactly, and their preservation was checked
against the extraction JSON. These are scope proposals, not claims that the
other papers' theorem hypotheses have been independently verified in this job.
Their design jobs must do that reading. Neither continuation is an input to
the explicit tame presentation. No existing roadmap is moved or edited here.

## Exact open supplier work

The complete contracts and direct consumers are in the packet and reader.
They must be discharged in their owners' directions:

- Tau Ceti ClassFieldTheory, Layer 7: geometric fundamental-character versus
  arithmetic Artin normalization, arithmetic unramified Frobenius, and
  Teichmüller reduction compatibility.
- Tau Ceti LocalFieldsRamification, Layer 4: the tame Kummer-tower restriction
  equivalence, preserving the selected unramified Frobenius, and the normalized
  finite-residue fundamental characters.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`: arbitrary-height,
  complete-Noetherian-coefficient Kisin/étale categories with tame descent;
  contravariant realization; relative analytic monodromy and complete-local
  deformation comparisons; and the Kummer-invariant theorem. Its existing
  finite-coefficient/height-one nodes are exact inputs, with these additional
  interfaces explicitly requested rather than silently attributed to them.
- `LocalGaloisDeformationRings:R08.3`: the tame compact-type/Deligne–Lusztig
  normalization and lattice comparison; the extended-Fontaine–Laffaille
  crystalline seeds and GHLS lifting criterion, including the conversion from
  GHLS's cyclotomic weight −1 to the +1 convention used here. The parent's
  existing reducible Q_p lifting statement does not supply this general seed.
- `ModpRepresentationsOfGL2OverLocalFields:MP.3`: the finite-group
  Deligne–Lusztig reduction formula in its existing translation coordinates.
  This roadmap composes that formula with the requested compact-type
  comparison; it does not redefine the weight lattice or translation map.
- `DeformationAndDerivedPatchingAlgebra:R03.3`: Hamann's local power-series
  cancellation theorem and the finite-residue coefficient-field correction.
  The stable crossing presentation and geometric descent argument are stated
  separately from the resulting noncanonical cancellation isomorphism.

The next review should test the statements and proof closure, especially these
interfaces. Subsequent implementation must supply them before claiming closed
layers. There is no unfinished source-reading task inside the chosen scope.

## Mathematical decisions worth retaining

- The incoming route's Barsotti–Tate title was too narrow for its actual
  targets. The two Hodge profiles are (3,0) and (2,1); the new title says
  small Hodge type. Framing and determinant freedom remain explicit.
- Starting at T.4 the input is normalized, semisimple and N-deep, N≥12.
  The one-unit loss between lowest-alcove presentations is retained; the
  source's 13-generic normalization is not replaced by an assertion about
  arbitrary 12-generic presentations.
- The orientation orders the weighted exponents a′ and uses endpoint
  f′−1−j′. An incoming extraction's alternate endpoint and α′ interpretation
  were corrected from the source; these are extraction repairs, not paper
  errata. No source erratum was established, so `sourceIssues` is empty.
- The small-Hodge union is defined in T.5 before the gauge/Galois comparison
  that uses it. This comparison is separate from the effective polynomial
  argument, preventing circular component counting.
- Polynomial model ideals and actual monodromy ideals are different objects.
  One ambient automorphism transports all factors; the actual tails can
  involve every embedding. The N−8 precision and integer prime p are retained.
- Table index j describes embedding f−1−j. The common charts include the
  extra linear equations c₁₁+pd₁₁=0 and c₂₂+pd₂₂=0 in the outer cases. Dropping
  them would leave an additional parameter.
- Union rings use intersections of whole-type ideals. The final relation uses
  an intersection of the exact Q ideals, then a sum with the actual middle
  (3,0) ideal. It asserts membership of p, not of a coefficient uniformizer.
- Generic reducedness does not imply formal smoothness of the entire special
  fibre. The crossing models give reduced special fibres with formally smooth
  components, and preserve the distinction between stable and cancelled
  presentations.

## Baseline and duplication audit

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The actual statements of
the 14 cited declarations were read, including Weierstrass preparation/division
and the local-ring unit criterion. General completed-ring algebra, weight
coordinates, deformation rings and coefficient categories are imported by
their exact packet nodes where suitable; stage references have explicit
requests where an additional interface is needed.

The reviewed `data/library-coverage.json` has no audit entry for this Part II
or its parent. That absence was not treated as a negative verdict. The related
accepted deformation-algebra and arithmetic-duality audit material was read.
Direct source searches found no existing tame Kisin gauge/monodromy-chart
development supplying these targets.

The current TauCetiRoadmap checkout was also inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library
at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, in addition to the pinned
baseline. The newer roadmaps' Suggested files were searched and the
LocalGaloisGroups/ProfiniteArithmetic boundaries checked. Their foundations
remain existing work, inherited through suppliers. The full AdicSpaces and
current ProfiniteArithmetic reader documents were read as density/style
examples. No build was run in either current upstream checkout.

## Sources and provenance

Every statement is rewritten in our own words. No source passage, excerpt
field, source PDF or private-library file is included. All required sources
were freely readable; no missing or uncleared book was used. Packet and reader
record URLs, access date, edition and SHA-256; all four hashes were rechecked.

- BHHMS, [arXiv:2009.03127v7](https://arxiv.org/pdf/2009.03127v7), 9 June
  2023: §§2–4, printed pp. 10–45, including the five tables and Figure 2;
  Lemma 8.1.2, p. 88; Theorem 8.3.9 proof, equations (78)–(79), pp. 101–102;
  and references, pp. 110–112. Preprint pagination is used throughout.
- Elkik, [1973 paper](https://www.numdam.org/item/10.24033/asens.1258.pdf):
  §0.2 and Lemme 1, pp. 555–557. Only the chart-specific approximation
  consequence is owned here; its Newton/Jacobian proof is given explicitly.
- Gee–Herzig–Liu–Savitt,
  [arXiv:1506.01050v3](https://arxiv.org/pdf/1506.01050v3), 7 February 2017:
  Theorem D, p. 4; §1.2, pp. 5–6; Theorem 3.1.5 and proof, p. 21. Its seed,
  range and convention hypotheses are retained in the R08.3 request.
- Hamann, [On power-invariance](https://msp.org/pjm/1975/61-1/pjm-v61-n1-p17-p.pdf),
  Theorem 4 and proof, pp. 155–156. The requested conclusion is a ring
  isomorphism, with the finite-residue coefficient correction stated separately.

## Suggested Lean and checks

The 202-line companion compiled with `lean-check` in the shared pinned build,
exit status 0, with only expected proof-placeholder warnings. Memory was
checked first. No data definition has a placeholder body, and no surrogate
proposition carrier is used. Its three real-bodied light definitions are
`gaugeChartMatrix`, `middleChartHypersurface` and `exactWeight21Ideal`.

It states finite chart identities, the allowed-shape count, exact-ideal
relations, local-ring p-membership witnesses and a square-free special-fibre
example, with representative computed Checks. The p-membership witnesses work
already at N≥10 under their explicit unit assumptions; the roadmap's global
presentation hypotheses remain N≥12. Heavy Kisin, compact-type and deformation
carriers remain precise reader targets under WORKERS.md's compact-file rule.
Compilation establishes elaboration, not the proofs of these statements.

Validation performed:

- `scripts/check_blueprint.py`: zero errors and zero warnings.
- `scripts/check_sorry_data.py`: passed.
- Intake file checks, JSON parsing and whitespace checks: passed.
- Internal node/stage DAGs, definition API/Checks, unchanged implementation
  status, exact routed-item coverage and preserved split fields/item lists:
  passed.
- Exact arithmetic spot checks of the height-coefficient and Jacobian
  identities passed. These are additional sanity checks, not formal proofs.

The next action is independent review of this complete design. No second job
was claimed in this run.
