# RT-RS-13 — independent red team of RS-13

Reviewer: Codex — codex-a71f92. Date: 30 September 2026.
Target: accepted RS-13 and REV-RS-13.
Audit snapshot: `d4afbc98a4f6b289d730897edbd18171f5cafb67`.
Neither original job was written or reviewed by this session.

## Result

Complete scoped review: **one low-severity documentation finding**, already
noted by REV-RS-13 and still present. No high/medium error, lost construction,
incorrect owner, new dependency cycle or duplicate between the two members was
established. The finding does not invalidate the executable JSON proposal.

This is an ownership review, not certification that the future analytic or
motivic theories, source extractions, or current partial blueprint are complete.

## RT-RS-13/1 — stale instruction to retain the retired AN.1 dependency

Severity: low. Kind: error.
Location: `research/blueprint/restructure/RS-13.md:109`, “Consumers and exact
replacement links”.

The sentence reads:

> Keep PS.0 → PS.1, AN.1 → PS.1 and PS.1 → PS.7.

The accepted RS-07 result instead declares
`layers["AnalyticNumberTheory:AN.1"].action = "drop"` and supplies PS.1
directly from `UPSTREAM:Mathlib-Riemann-and-Dirichlet-L-functions`.
Its link reason says “Replace retired AN.1 by the actual completed Dirichlet/Tate
formulas with gamma, conductor, parity and finite Euler corrections.”
REV-RS-13's “Questions for the orchestrator”, item 1, identifies this same
stale sentence. It has not been corrected in the reviewed report.

Pinned-library support for that upstream interface was checked directly:
Mathlib `DirichletCharacter.LFunction_changeLevel`,
`LFunction_eq_completed_div_gammaFactor` and
`IsPrimitive.completedLFunction_one_sub` at commit
`082e2d37e8b0463410cdb532e111cd43d5a66174`, in
`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`.
These are actual declarations, with the primitive-character and exceptional
argument restrictions visible, not a name-only inference.

Fix only the report sentence: retain PS.0 → PS.1 and PS.1 → PS.7, and say that
the classical Riemann/Dirichlet input is imported through RS-07's named upstream
supplier. AN.1 may remain identified as historical provenance, but must not be
presented as an active owner or dependency to retain. Do not add an AN.1 edge to
RS-13's JSON.

Why low: this is a stale explanatory instruction, not a new edge in the
proposal. The JSON contains no AN.1 endpoint or supplier and the independent
review already states the correct interpretation. There is no new missing
mathematical producer and no demonstrated runtime graph failure.

## Material read

Read the full family file, accepted result/report, independent review, both
authoritative member READMEs and all 16 member stage contracts. The family has
six directed evidence records representing three pairs and no immutable
anchors. All four explicit layer decisions, three owner entries and seven
link reasons were compared; unlisted layers retain their original scope.

Read all 16 member entries in `data/library-coverage.json`: six AL entries
from AUDIT-14 and ten PS entries from AUDIT-27. Their target-level evidence is
prior audit input, not an exhaustive absence search newly repeated here.

Read all 12 native outside consumer descriptions, plus the three explicitly
relevant AutomorphicPadicLFunctions contracts L1, L2 and L5. Read the relevant
accepted RS-07, RS-14 and RS-21 layer/owner/link entries and review metadata.
In particular, RS-14 has since been accepted and its AN.1 references corrected;
the original RS-13 review's then-pending warning about RS-14 is not a new
unresolved finding against the current RS-14 result.

Read the upstream GlobalNumberFields Layers 9–10 and ModularForms Layer 0
stage descriptions, confirming the character/infinity-type and generalized
Bernoulli/character-Eisenstein boundaries. These are existing roadmap owners,
not claims that every planned declaration already exists.

## Target preservation and duplication attacks

The complete member inventory is preserved as follows.

| Stages | Contract after RS-13 |
| --- | --- |
| AL.0 | Unchanged local/adelic test spaces, Fourier/Poisson, measures and parameter-integral estimates |
| AL.1 | Kept local/global Tate integrals and factors, ramification and trivial-character poles |
| AL.2 | Unchanged Godement–Jacquet finite-place and separate archimedean constructions |
| AL.3 | Unchanged Whittaker/Rankin–Selberg theory and automorphic rational-structure comparisons |
| AL.4 | Kept unramified Satake/L-group polynomial, bounded-convergence product and qualified comparisons |
| AL.5 | Kept scoped complex/formal corrections, algebraicity inputs and zero-factor treatment |
| PS.0 | Unchanged actual realization comparisons and period lines |
| PS.1 | Narrowed only by importing three named analytic/arithmetic packages; all motivic adapters remain |
| PS.2–3 | Unchanged formal-period/torsor and regulator/leading-term assembly |
| PS.4–6 | Unchanged integral fundamental lines, equivariant statements and scoped BSD/Bloch–Kato adapters |
| PS.7 | Unchanged certified computations, exact normalization comparison and conjectural gates |
| PS.8–9 | Unchanged source-selected mirror-family and mixed-Tate/multiple-zeta constructions |

**AL.1 versus PS.1.** The Tate analytic theorem has one analytic owner. PS.1
still builds its admitted motivic completion and identifies the relevant
Betti/de Rham period. It additionally imports L0's Dirichlet arithmetic
comparison, rather than pretending that analytic continuation proves algebraicity.

**AL.5 versus PS.1.** The import is the scoped GL2/Rankin normalization and
correction interface, not a general motivic algebraicity theorem. The actual
map from automorphic rational structures/periods to motivic period lines is
retained explicitly in PS.1. No reverse PS.1 → AL.5 dependency is added.
AutomorphicPadicLFunctions still constructs the evaluation cycles,
overconvergent distributions, control/growth and interpolation theorem; AL.5
does not acquire a generic p-adic existence theorem.

**AL.4 versus PS.1.** A Satake class with an L-group representation and
admitted Galois/Weil–Deligne realization data are distinct inputs. Their
comparison needs an actual compatibility theorem. The proposal correctly
records no merged owner for this evidence pair. It does not identify a
ramified factor or an archimedean Hodge factor with an unramified polynomial,
nor derive general continuation from convergence of a partial Euler product.

**L0 versus existing ModularForms.** The corrected third owner entry is the
algebraic-to-complex Dirichlet special-value comparison. Generalized Bernoulli
quantities themselves are imported according to RS-14 from ModularForms
Layer 0. L0's current narrowed contract still proves its source-specific
Mellin/Bernoulli and embedding comparisons. The link can transport those
quantities without declaring L0 their constructor. This is not duplication.

The remaining member targets are not analytic synonyms: rationality of a
period class is not an exact integral normalization; regulator proportionality
is not a full integral leading-coefficient formula; a numerical enclosure is
not a proof of period algebraicity; and motivic independence is not numerical
period injectivity. None of these distinctions is removed by the one narrowing.

The external descriptions retain their independent work: R16.2 has the GL2
classification/newvector calculation, R16.5 the converse theorem with growth
and twist hypotheses, ET.6 the local correspondence, GZ.4–5 toric distinction
and the actual period formula, Borel R.5 the regulator proportionality, and
BSD.0 the elliptic analytic-rank/twist comparison. They continue to import AL's
analytic constructions. KU-zeta remains an aggregation checkpoint, not an
additional proof owner.

## Fresh primary-source check

Read on 30 September 2026:
[Deligne, Valeurs de fonctions L et périodes d'intégrales (1979)](https://publications.ias.edu/sites/default/files/33_Valeursde.pdf).
SHA-256:
`6cfacb0f8742314fb9faeb3585159bdc13c3ff6e93686e3fe0a23ad775e8b574`.
The 34-page PDF is image-only; inspected page images, not empty extracted text.
Printed pages 318–326 are PDF pages 6–14.

Read §§1.1–1.8, §§2.1–2.10 and §3.1–3.2, including the short arguments
for Propositions 1.4 and 2.5. Compatibility of local realizations and analytic
continuation are qualified inputs; criticality checks both infinity factors.
The period is a determinant of the actual comparison map with rational
structures, and coefficient embeddings are not interchangeable choices of
arbitrary complex scalars. The coefficient-valued units formulation in 2.8
includes nonvanishing. The Tate example gives the twist/sign normalization;
§3.2 does not make zero a critical integer merely because zeta(0) is rational.
These checks support the retained PS.1 contract. They do not prove the general
conjecture, the separately sourced modular-form cases, or any unread
Godement–Jacquet/Rankin–Selberg proof.

## Pinned-library signature probes

Used the clean existing baselines at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; no new build or cache.

- Mathlib `Analysis/SpecialFunctions/Gamma/Deligne.lean`, lines 40–80:
  actual `Complex.Gammaℝ` and `Gammaℂ` definitions, including the latter's
  factor of two. These scalar functions are useful existing inputs, not
  local-field zeta integrals or a geometric criticality theorem.
- Mathlib `NumberTheory/LSeries/DirichletContinuation.lean`, lines 90–180
  and 208–310: character-level change, gamma/completed interfaces, root
  number and primitive functional equation. The level-change identity is
  multiplicative and excludes the principal pole; it does not authorize
  division by a vanishing Euler factor. The root-number formula's primitive
  restriction matters. Totalized values at poles must not be interpreted as
  identities of regular analytic functions there.
- Tau Ceti `LinearAlgebra/ExteriorPower.lean`, lines 190–310 with its ambient
  variables/namespace: `exteriorPower.map_top_eq_det_smul`,
  `map_finrank_eq_det_smul`, `topEquiv` and its basis formulas.
  This supplies finite-free determinant linear algebra; it does not produce
  Betti/de Rham realizations or the comparison isomorphism whose determinant
  defines a motivic period.

No absence assertion for the entire pinned libraries is inferred from this
limited set of probes.

## Structural checks and packet boundary

Applied the actual `check_restructure.check` and
`restructure.apply_restructurings` in memory to the snapshot atlas:
seven links resolve, four are new, none skipped. Both roadmap identities and
all 16 member stages survive. Every original edge and stage description
survives; no stage is hidden. Upstream Tau Ceti stage objects are unchanged.

Independently tested every proposed edge for a return path in:
(1) native plus proposal, 3,512 edges from 3,508 native edges;
(2) native/requires plus accepted-link and restructuring union, 7,108 edges;
(3) the same union including endpoints outside the current atlas, 7,255 edges.
None has a return path. These are proposal-relative cycle tests, not a
certification that unrelated parts of the atlas are globally acyclic.
The union includes 25 accepted link files, 31 accepted research restructuring
results and 27 promoted restructuring files. There are no unresolved outgoing
PS.1/PS.7 endpoints in that union.

PS.7 is PS.1's only recorded consumer in both native and accepted unions.
It receives all three required direct supplier links from AL.1, AL.5 and L0.
The original PS.1 → PS.7 link remains for the motivic adapter. All 19 native
outside exports, to 12 stages in eight roadmaps, are retained.

No integrated decomposition for either member is present. The research AL
packet is partial/unreviewed, with 42 unchecked nodes (18 under AL.0 and 24
under AL.1), zero packet links, six coverage entries and eight gaps. Read its
identity/status inventory, all coverage and gap entries, and the one complete
node whose uses references PS.1: AL.1/local-epsilon-gamma-factors. That use is an
AL-to-PS analytic export, not a new PS prerequisite. The other node proofs
were not certified. All 42 parent-stage IDs remain valid and unchanged.

Searched exact PS.1 stage/node-prefix references in packets and integrated
decompositions: that single use was the only hit. There are no reserved member
node IDs. The partial packet's source gaps remain preparation work, not new
evidence that RS-13 has supplied or formalized the missing theorems.

Relevant inputs were unchanged on refreshed main before publication.
Validation: red-team schema check, actual restructuring application, independent
graph/forwarding/identity checks, intake validation of the two deliverables and
clean diff whitespace. No Lean file requested, changed or compiled. No roadmap,
proposal, packet, source or library file is changed by this red-team submission.
