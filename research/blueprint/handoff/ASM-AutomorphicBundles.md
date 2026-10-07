# Handoff: ASM-AutomorphicBundles (issue #215)

This job assembles the roadmap *Automorphic bundles and classical automorphic forms* (`AutomorphicBundles`) from its two reviewed parts:

- layers B0, B1, B1.general, B2, B2.general, B3, B3.general and B4 (68 nodes), written by BP-AutomorphicBundles--B0 and accepted by REV-AutomorphicBundles--B0 on 6 October 2026;
- layer B5 (28 nodes), written by BP-AutomorphicBundles--B5 and accepted by REV-AutomorphicBundles--B5 on 6 October 2026.

Worker: Claude, session claude-PEaOCR. I took no part in either part or in either review. This is a finished assembly, not a checkpoint.

## Files

- `research/blueprint/readmes/AutomorphicBundles.md`: the full roadmap document (about 57,000 words). It replaces the two part documents.
- `research/blueprint/suggested/AutomorphicBundles.lean`: the two parts’ suggested files joined into one.
- `research/blueprint/handoff/ASM-AutomorphicBundles.md`: this note.

The part packets are not deliverables of this job in the queue (its outputs are the three files above), so they are unchanged: editing them would put non-deliverable paths in the pull request and change reviewed files. The same choice was made by ASM-HabiroRings and ASM-HabiroCyclotomicCompletions. The edits the packets need are listed below, with a machine-readable patch, for a job that owns them. No reviewed node’s mathematics was changed.

## What was done

**The document** is generated from the two packets as their reviews left them, so it agrees with them node for node, and hand-written prose is added around the generated entries.

- All 96 nodes are there with their statements, hypotheses, construction or proof steps, API items (154), unit tests (102), acceptance checks, uses, dependencies, library targets and sources. A scripted check finds every node id, title, statement, proof step, API name and statement, test name and statement, acceptance item, use, prerequisite, planet (33), library name, gap (24), request (50), source issue (14), baseline declaration (42), coverage item, structural proposal, source id and URL in the document, and all 150 source excerpts verbatim.
- Both reviews asked that the reader be brought in line with the corrected packet at assembly. Generating the node text from the packets does this: B0’s corrected sources, APIs, tests and prerequisites (the review changed fields of 48 nodes), and B5’s degree-(ℓ+1) correspondence, the Higher Koecher preprint locators (pp. 11–13), the three constructors `FourierJacobi.localExpansion`, `FourierJacobi.expansion` and `VectorFourierJacobi.expansion`, and the exact imports `ShimuraCompactifications:C0/relative-face-open` and `ShimuraCompactifications:C5/neat-strata-detect-geometric-components`. No part document’s node text is reused.
- **New sections.** Purpose and scope; boundaries (every supplier the packets import, the consumers in the atlas, the RS-02, RS-14 and RS-32 links and owners, the Part II roadmap `AutomorphicBundlesPartII` for higher integral coherent cohomology, the proposed HigherHidaAndColemanTheory and LieHighestWeightPartIICompletedCategoryO inputs, Tau Ceti ModularForms Layer 10C, and the LieGroups Layer 8 overlap); conventions reconciled across the parts; sources with aliases, editions, hashes and sections read; the versions read; the 42 pinned declarations; a layer overview with planets and coverage; an introduction for every layer and for the five B5 groups; and closing sections for cross-part prerequisites, requests filed with this roadmap by other packets, mistakes in the sources, gaps, requests, structural proposals, notes on other roadmaps, routed paper items, layer dependencies and non-claims.
- **Kept from the B5 part document**, checked against the corrected packet and stripped of process wording: the cone counterexample and the common-completion contract (after `B5/cone-compatibility`), the two coefficient rows (before `B5/coefficient-naturality`), and the residue-fibre detection argument with the finite-thickening comparison (after `B5/fj-injectivity-cyclic`), now presented as the proof route of the imported C5 node and its prerequisite chain.
- **Layer order.** Printed in dependency order B0, B1, B1.general, B2, B2.general, B3, B3.general, B4, B5, because `B4/classical-forms` uses B3.general nodes and B5 cites B3.general. B5 is shown in five groups in packet order, refining its packet’s four proposed sub-layers; for the atlas the packet’s four stand.

**Notation reconciled** (Conventions section of the document): V(J), V(J)^can_Σ, V(J)^sub_Σ (B0) against E(V), Ecan(W), Esub(W), ω_tor^k (B5); M(J,K;L), S(J,K;L) over fields (B0) against AF(k,M) and Diamond’s M_{(k,m)}(U;R) (B5); Diamond 2021’s arithmetic weights (k,w), m_τ = (w − k_τ)/2 (B4) as the parallel case of Diamond 2022’s pairs (k,m) (B5); BCGP’s κ_j (B0’s request) = λ_j (B5); the Hodge and opposite Hodge–Tate parabolics; the two library roots (see below). The node text keeps each packet’s notation.

**Sources reconciled.** `milne` (B0) and `MILNE-2018` (B5) are one file (same SHA-256 `f4a36ecc…`): Milne’s *Canonical models of (mixed) Shimura varieties and automorphic vector bundles*, author revision 11 March 2018. The B5 packet gives it the title of the different 1988 paper *Automorphic vector bundles on connected Shimura varieties* (`milne-connected`). I downloaded the file and confirmed its title page and that Chapter VII (Fourier–Jacobi series) starts on p. 100. `lan`/`LAN-INTRO` and `bcgp`/`BCGP-2025` are each one file. `diamond` (arXiv:2011.14128v2) and `DIAMOND-2022` (arXiv:2211.06922v1) are different papers.

**Cross-part prerequisites.** The B0 packet never cites B5. The B5 packet cites the stages B1, B2, B3, B3.general and B4 of its own roadmap 35 times, backed by five requests to its own roadmap. Each citation is matched with the B0-packet nodes that answer it, in an Assembly note on the node and in a table:

- 19 citations are fully answered (*replace*, 18; *redundant*, 1: `B5/fj-coefficient-module` uses no B4 result);
- 16 are answered on the characteristic-zero overlap only (*partial*), with a residual R1, R2, R5 or R6 (below).

Adding the node ids keeps the graph acyclic: I checked that no B0-packet node reaches any B5-packet node through any packet in the repository, and that there are no node-level cycles through this roadmap’s nodes.

**Findings of the assembly** (each is an Assembly note in the document; none changes a packet):

1. **A target no node plans: the integral section modules.** The roadmap’s completion condition asks for classical forms over the specified integral PEL and Hilbert models, and B5 uses them throughout. The B0 packet plans B2–B4 over characteristic-zero fields (three B3 nodes have a good-prime clause through C5). The document records a new gap, *Integral coefficient interfaces that B5 needs from B2–B4*, with four residuals: R1, the integral section functor AF(k,M) = Γ(X, ω_tor^k ⊗_R M) and Γ(X, Ecan(W) ⊗_R M) with cuspidal version, functoriality and colimit compatibility (B4); R2, the coefficient-sensitive refinement and Hecke boundary comparison (B3); R5, finite projective integral Levi coefficients, θ_g and the boundary bundle E0(W) of Lan’s Higher Koecher Proposition 5.6 (B2/B3); R6, Diamond’s ramified (k,m) line over Noetherian O-algebras (B2/B4 with H2/C6). Needed by nine B5 nodes. This needs a follow-up planning job on B2–B4 of this roadmap.
2. **One statement planned twice.** BCGP’s item 4.5-classical (VB⁰(L_κ) = ω^{κ,sm} with the twist κ(μ)) is the statement of `B4/classical-vb-tate-normalization` and the first assertion of `B5/classical-bcgp-equivariance`. B4 should own it (the B0 packet’s routed-item record assigns it there); the B5 node should import it and keep its additions.
3. **A request answered by the other part.** The B0 packet’s request to `AutomorphicBundles:B5` (BCGP Theorem 4.8.2, both displays) is exactly `B5/classical-siegel-ht-comparison` and `B5/cuspidal-siegel-ht-comparison`.
4. **Two library roots.** B0 proposes `TauCeti/NumberTheory/AutomorphicBundles/…`, B5 `TauCeti/Geometry/Shimura/AutomorphicBundles/…`; B5 also uses the root namespaces `FJCoefficient` and `FourierJacobi`. The document recommends one root, `TauCeti/Geometry/Shimura/AutomorphicBundles/` (beside ShimuraVarieties and ShimuraCompactifications), and one root namespace `AutomorphicBundles`, which the Lean file uses.
5. **Requests from other packets.** Six requests that other packets file with B3, B4 and B5 are tabulated with the nodes that answer them. Two are not planned anywhere: AbelianVarietiesIsogenousToNoJacobian asks B5 for multiplicativity of Siegel Fourier expansions and their comparison with the analytic expansion (B5 plans the analytic comparison in rank one only), and OverconvergentAutomorphicForms O0 asks B5 to extend the Hilbert expansions to p-level analytic families (B5 stops at classical prime-to-p level; the document records this as the consumer’s object).

**Checks.**

- `python3 scripts/check_blueprint.py` with the pinned declaration index (`$TAUCETI_BASELINE/declarations.tsv`) on both part packets: 0 errors, 0 warnings each (nothing to fix).
- The scripted agreement check described above: 0 problems. The document has no “optional”, “deferred” or “later”, and every Markdown table has consistent columns.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 3 files, 0 problems.
- **Lean.** `lean-check research/blueprint/suggested/AutomorphicBundles.lean` (shared build at Mathlib `082e2d3`): exit 0, no errors, 62 warnings, all `declaration uses 'sorry'` (40 from the B0–B4 part, 22 from the B5 part; the B5 review reported 22 for its Mathlib-only check), and otherwise only the output of the `#check` lines. Tau Ceti was not compiled: the shared build has no objects for the three Tau Ceti modules the B5 part imports (`TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Prime.Basic`, `….Nebentypus.Action`, `TauCeti.AlgebraicGeometry.Modules.TensorProduct`). No declaration depends on them; they served three `#check`s (`HeckeRing.GL2.heckeRingHomCharSpace`, `HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime`, `AlgebraicGeometry.Scheme.Modules.tensorProduct`), which are commented out together with the imports and explained in the header; restoring them in a build at Tau Ceti f790474 changes nothing else.

**The Lean file.** One standard note, one import block (the union of the two parts’ Mathlib imports), and one root namespace `AutomorphicBundles`: B0’s declarations unchanged, its tests moved from `AutomorphicBundlesTest` to `AutomorphicBundles.Test`, B5’s `FourierJacobiPrototype` renamed `AutomorphicBundles.FourierJacobi`, and B5’s `FJCoefficient`, `ClassicalHecke`, `VectorFourierJacobi` and `SiegelHT` nested in the root namespace with their relative names unchanged. The two parts’ prose inventories (B0’s contract inventory and B5’s omission ledger) are replaced by one inventory generated from both packets in layer order. Every node id, proposed declaration name, API name and unit-test name of both packets appears in the file (checked by script). The executable prototypes are exactly the parts’; nothing geometric is fabricated, and no `Prop` placeholder is introduced.

## Fixes the part packets need (not deliverables here)

None of these changes a statement except item 2, which narrows one statement by removing a duplicate assertion and would need a re-review of that node.

1. **B5 packet: cross-part prerequisites.** Add the B0-packet node ids and drop the stage ids that are fully answered, as in the patch below (`add` / `remove` per node). Stage ids that stay (`partial`) stay with their requests, narrowed to the residuals.
2. **B5 packet: `B5/classical-bcgp-equivariance`.** Add `AutomorphicBundles:B4/classical-vb-tate-normalization` (in the patch) and restate the first sentence as importing that identification; keep the cohomological, cuspidal, Hecke and refinement compatibilities and the GSp₄ check.
3. **B5 packet: requests to its own roadmap.** Drop the requests to `AutomorphicBundles:B1` and `AutomorphicBundles:B3.general` (answered); narrow those to `AutomorphicBundles:B2` (to R5 and R6), `AutomorphicBundles:B3` (to R2 and R5) and `AutomorphicBundles:B4` (to R1 and R6). Add the assembly gap (R1, R2, R5, R6) to whichever packet plans its follow-up.
4. **B0 packet: request to `AutomorphicBundles:B5`.** Answered by `B5/classical-siegel-ht-comparison` and `B5/cuspidal-siegel-ht-comparison`; drop it (its `neededBy` is empty). The routed-item records for `4.8.2-usual` and `4.8.2-cusp` can then name those B5 nodes.
5. **B5 packet: source `MILNE-2018`.** Its title should be *Canonical models of (mixed) Shimura varieties and automorphic vector bundles*; it is the same file as B0’s `milne`.
6. **Library homes.** Move both packets to one module root (recommended `TauCeti/Geometry/Shimura/AutomorphicBundles/`) and one root namespace `AutomorphicBundles` (B5’s `library.namespace` values `FJCoefficient` and `FourierJacobi` become `AutomorphicBundles.FJCoefficient` and `AutomorphicBundles.FourierJacobi`).
7. **Wording.** The B5 gap *Common formal chart and coefficient comparison* begins “The preceding checkpoint resolved rendering…”, and the gap *Ramified Hilbert charts and component detection* ends “has not been read in this pass”; these are process notes to remove when the packet is next edited.

Patch for item 1 (and the import of item 2):

```json
{
 "AutomorphicBundles:B5/fj-coefficient-module": {
  "add": [
   "AutomorphicBundles:B3/boundary-coefficient-chart"
  ],
  "remove": [
   "AutomorphicBundles:B3",
   "AutomorphicBundles:B4"
  ]
 },
 "AutomorphicBundles:B5/local-fj-expansion": {
  "add": [
   "AutomorphicBundles:B3/canonical-and-subcanonical-extensions",
   "AutomorphicBundles:B3/boundary-coefficient-chart"
  ],
  "remove": [
   "AutomorphicBundles:B3"
  ]
 },
 "AutomorphicBundles:B5/fj-refinement": {
  "add": [
   "AutomorphicBundles:B3/refinement-canonical-extension",
   "AutomorphicBundles:B3/fan-independent-sections"
  ],
  "remove": []
 },
 "AutomorphicBundles:B5/coefficient-sequence-exact": {
  "add": [
   "AutomorphicBundles:B3/canonical-and-subcanonical-extensions",
   "AutomorphicBundles:B4/classical-forms"
  ],
  "remove": [
   "AutomorphicBundles:B3"
  ]
 },
 "AutomorphicBundles:B5/fj-injectivity": {
  "add": [
   "AutomorphicBundles:B4/classical-forms"
  ],
  "remove": []
 },
 "AutomorphicBundles:B5/cuspidal-boundary-criterion": {
  "add": [
   "AutomorphicBundles:B3/subcanonical-extension",
   "AutomorphicBundles:B4/cusp-forms"
  ],
  "remove": [
   "AutomorphicBundles:B3"
  ]
 },
 "AutomorphicBundles:B5/hecke-section-operator": {
  "add": [
   "AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer",
   "AutomorphicBundles:B2/coefficient-tensor-hecke",
   "AutomorphicBundles:B1/principal-hecke-pullback",
   "AutomorphicBundles:B3/canonical-and-subcanonical-extensions",
   "AutomorphicBundles:B3/subcanonical-extension",
   "AutomorphicBundles:B3/fan-independent-sections",
   "AutomorphicBundles:B3.general/general-boundary-functoriality",
   "AutomorphicBundles:B4/classical-forms",
   "AutomorphicBundles:B4/cusp-forms"
  ],
  "remove": []
 },
 "AutomorphicBundles:B5/vector-fj-expansion": {
  "add": [
   "AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer",
   "AutomorphicBundles:B2/levi-highest-weight-convention",
   "AutomorphicBundles:B3/canonical-and-subcanonical-extensions",
   "AutomorphicBundles:B3/boundary-coefficient-chart",
   "AutomorphicBundles:B3.general/general-canonical-extension",
   "AutomorphicBundles:B4/classical-forms"
  ],
  "remove": [
   "AutomorphicBundles:B3.general"
  ]
 },
 "AutomorphicBundles:B5/vector-expansion-principle": {
  "add": [
   "AutomorphicBundles:B3/canonical-and-subcanonical-extensions",
   "AutomorphicBundles:B3/subcanonical-extension",
   "AutomorphicBundles:B4/classical-forms",
   "AutomorphicBundles:B4/cusp-forms"
  ],
  "remove": []
 },
 "AutomorphicBundles:B5/hilbert-cusp-expansion": {
  "add": [
   "AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer",
   "AutomorphicBundles:B3/canonical-and-subcanonical-extensions",
   "AutomorphicBundles:B3/minimal-coherent-pushforward",
   "AutomorphicBundles:B4/hilbert-arithmetic-weight",
   "AutomorphicBundles:B4/hilbert-coefficient",
   "AutomorphicBundles:B4/unsplit-hilbert-descent",
   "AutomorphicBundles:B4/hilbert-central-descent"
  ],
  "remove": []
 },
 "AutomorphicBundles:B5/hilbert-cuspidal-boundary": {
  "add": [
   "AutomorphicBundles:B3/subcanonical-extension"
  ],
  "remove": []
 },
 "AutomorphicBundles:B5/classical-bcgp-equivariance": {
  "add": [
   "AutomorphicBundles:B1/hodge-canonical-principal-bundle",
   "AutomorphicBundles:B1/principal-hecke-pullback",
   "AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer",
   "AutomorphicBundles:B2/levi-highest-weight-convention",
   "AutomorphicBundles:B3/canonical-and-subcanonical-extensions",
   "AutomorphicBundles:B3/subcanonical-extension",
   "AutomorphicBundles:B3/fan-independent-sections",
   "AutomorphicBundles:B3.general/general-boundary-functoriality",
   "AutomorphicBundles:B4/classical-vb-tate-normalization"
  ],
  "remove": [
   "AutomorphicBundles:B1",
   "AutomorphicBundles:B2",
   "AutomorphicBundles:B3",
   "AutomorphicBundles:B3.general",
   "AutomorphicBundles:B4"
  ]
 },
 "AutomorphicBundles:B5/classical-siegel-ht-comparison": {
  "add": [
   "AutomorphicBundles:B1/hodge-canonical-principal-bundle",
   "AutomorphicBundles:B2/etale-coefficient-local-system",
   "AutomorphicBundles:B2/levi-highest-weight-convention",
   "AutomorphicBundles:B3/canonical-and-subcanonical-extensions",
   "AutomorphicBundles:B4/siegel-coefficient"
  ],
  "remove": [
   "AutomorphicBundles:B1",
   "AutomorphicBundles:B2",
   "AutomorphicBundles:B3",
   "AutomorphicBundles:B4"
  ]
 },
 "AutomorphicBundles:B5/cuspidal-siegel-ht-comparison": {
  "add": [
   "AutomorphicBundles:B1/hodge-canonical-principal-bundle",
   "AutomorphicBundles:B2/etale-coefficient-local-system",
   "AutomorphicBundles:B2/levi-highest-weight-convention",
   "AutomorphicBundles:B3/canonical-and-subcanonical-extensions",
   "AutomorphicBundles:B3/subcanonical-extension",
   "AutomorphicBundles:B4/siegel-coefficient",
   "AutomorphicBundles:B4/cusp-forms"
  ],
  "remove": [
   "AutomorphicBundles:B1",
   "AutomorphicBundles:B2",
   "AutomorphicBundles:B3",
   "AutomorphicBundles:B4"
  ]
 }
}
```

## Structural proposals and requests of the parts

The parts’ four structural proposals, with their status:

| Proposal | Part | Status |
|---|---|---|
| Rescope ReductiveGroupsPartII: add an explicitly scoped stage for representable principal algebraic torsors, associated finite locally free bundles and their tensor/dual/pullback/analytification descent; keep compact-dual coefficients, canonical models, realizations and boundary extensions in AutomorphicBundles | B0 | awaiting the maintainer; the first B0 gap depends on it |
| Split ShimuraCompactifications C5 into an early toroidal/model/formal-chart stage (before B3/B5) and a late minimal-compactification endpoint (after `B5/constant-term-restriction`) | B5 | awaiting the maintainer; it removes the latent stage-level cycle |
| Rescope: HigherHidaAndColemanTheory as the higher Coleman/Hida Part II (VB functor), LieHighestWeightPartIICompletedCategoryO for dual BGG/Kostant; B5 keeps only the classical comparisons | B5 | awaiting the designs of those roadmaps; no stage id is invented |
| Split B5 for presentation into four sub-layers (Fourier–Jacobi theory and expansion principle with the vector nodes; Hecke action with `hecke-expansion-compatibility`; modular and Hilbert comparisons; classical cohomological comparisons) | B5 | awaiting the maintainer; the document’s five display groups refine it without changing ids |

The assembly adds two observations: the duplicate statement (finding 2) and the integral gap (finding 1), whose follow-up belongs to this roadmap’s B2–B4.

The parts’ 50 requests, by supplier (packet and number of consuming nodes):

| Supplier | Requests |
|---|---|
| `AbelianSchemesAndArithmeticModuli:A4` | B0 (5) |
| `AdicSpacesPartII:F0` | B5 (4) |
| `AlgebraicModularFormsAndSerreWeights:R15.1` | B0 (1) |
| `AlgebraicModuliForArithmeticGeometry:R09.5` | B0 (1) |
| `AutomorphicBundles:B1` | B5 (3) |
| `AutomorphicBundles:B2` | B5 (6) |
| `AutomorphicBundles:B3` | B5 (13) |
| `AutomorphicBundles:B3.general` | B5 (2) |
| `AutomorphicBundles:B4` | B5 (11) |
| `AutomorphicBundles:B5` | B0 (0) |
| `ComplexComparisonPartII:C0` | B0 (1) |
| `ComplexComparisonPartII:C2` | B0 (1) |
| `HilbertModularVarietiesAndShimuraCurves:H0` | B0 (1) |
| `HilbertModularVarietiesAndShimuraCurves:H1` | B0 (2) |
| `HilbertModularVarietiesAndShimuraCurves:H2` | B0 (3), B5 (2) |
| `HilbertModularVarietiesAndShimuraCurves:H3` | B0 (1), B5 (2) |
| `HilbertModularVarietiesAndShimuraCurves:H4` | B0 (1) |
| `HodgeTateAndCanonicalSubgroups:T6:comparison` | B5 (3) |
| `PELModuli:M0` | B0 (2) |
| `PELModuli:M3` | B0 (3) |
| `PELModuli:M5` | B0 (2) |
| `SchemeAndStackFoundations:SF.0` | B5 (6) |
| `SchemeAndStackFoundations:SF.1` | B5 (7) |
| `SchemeAndStackFoundations:SF.2` | B5 (3) |
| `ShimuraCompactifications:C0` | B5 (4) |
| `ShimuraCompactifications:C1` | B5 (3) |
| `ShimuraCompactifications:C2` | B0 (5) |
| `ShimuraCompactifications:C2.general` | B0 (2) |
| `ShimuraCompactifications:C3` | B0 (2), B5 (4) |
| `ShimuraCompactifications:C3.general` | B0 (1), B5 (2) |
| `ShimuraCompactifications:C4` | B0 (2), B5 (9) |
| `ShimuraCompactifications:C5` | B0 (2), B5 (8) |
| `ShimuraCompactifications:C6` | B0 (1), B5 (4) |
| `ShimuraVarieties:V1` | B0 (2) |
| `ShimuraVarieties:V2` | B0 (1) |
| `ShimuraVarieties:V4` | B0 (2) |
| `ShimuraVarieties:V5` | B0 (1) |
| `ShimuraVarieties:V6` | B0 (1) |
| `ShimuraVarieties:V7` | B0 (5) |
| `ShimuraVarieties:V8` | B0 (4) |
| `ShimuraVarieties:V8.general` | B0 (2) |
| `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-2-the-weyl-construction-via-young-symmetrizers` | B0 (1) |
| `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-3-maximal-torus-weights-and-the-highest-weight-classification` | B0 (1) |

The requests to `AutomorphicBundles:*` are this roadmap’s own (see *Cross-part prerequisites* in the document); all others go to the named suppliers unchanged. Requests to the same supplier from the two parts are compatible (the document’s *Requests* section compares them).

## For the maintainer

- **Follow-up planning on B2–B4.** The integral section modules (R1, R6) are B4 targets by the roadmap’s completion condition, and R2 and R5 are the integral versions of B3’s refinement comparison and B2/B3’s representation realization. A blueprint job on these layers (or a Part II, if the maintainer prefers to keep the B0 packet characteristic-zero) should plan them; the B5 nodes listed under the gap consume them. The higher integral coherent cohomology stays with `AutomorphicBundlesPartII`.
- **Packet edits.** Items 1–7 above, for a job that owns the packets; items 1, 3, 4, 5, 6 and 7 change no statement, item 2 narrows one B5 statement and needs a re-review of that node.
- **Stage texts.** The atlas lists B1.general–B3.general after B5, but B4 and B5 depend on them; the document prints the dependency order.
- **Where to resume.** Nothing remains for this job. The document and the Lean file are generated: rerunning the generation after the packet edits will drop the Assembly notes that the edits make obsolete; the agreement check (every id, name, prerequisite, request, gap, source issue, baseline declaration and excerpt of both packets present in the document, and every node id, declaration, API and test name present in the Lean file) should be repeated then.

Scratch files are deleted at the end of this run; everything the next worker needs is in the three deliverables and this note.
