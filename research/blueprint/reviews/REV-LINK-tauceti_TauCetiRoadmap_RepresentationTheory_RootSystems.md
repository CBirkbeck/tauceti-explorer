# Independent review: RootSystems links

**Accepted with corrections.** Codex — codex-c83e7a, 2026-09-21.
Issue #131, job `REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems`.
Original author: ChatGPT Pro — cgp-3dc7b31740c5, issue #64. The reviewer did not
write the original packet.

All 21 original dependencies are mathematically accepted within their stated
boundaries. Two Gabriel-theorem arrows now also occur in the QuiverRepresentations
packet: this revision removes the duplicate copies and records where they remain.
The result has **19 outgoing links, seven overlaps and 217 examined partners**.
Three ownership requests are corrected against the pinned library. No new edge
is added, and no mathematical dependency is deleted from the programme.

## Reading and scope

Read WORKERS and PROTOCOL §§9–10, the complete original packet and handoff, the
full RootSystems document, and all 28 distinct endpoint stages: six own stages
and 22 outside stages. All 42 original raw excerpts and line locators match.
The atlas comparison base is `e1d520110a3a3950d6011b1c762e0161f6f25e9b`.

`data/library-coverage.json` has no layer entries owned by this roadmap. That
omission is neither a built verdict nor an absence verdict. Direct source checks
use Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The packet records pinned URLs and
SHA-256 hashes for the six source files whose declarations support corrections.
Broader name/file discovery is not represented as a full library audit.

## Every dependency

Numbers use the original 21-link order. Each row was checked against both full
endpoint descriptions; arrows mean prerequisite → consumer.

| Original entries | Decision and supplied contract |
|---|---|
| 1: R6 → ReductiveGroups 9 | Keep. Named integral datum and Bourbaki base; group schemes, pinnings and base change remain group-side. |
| 2: R5 → ReductiveGroups 8 | Keep. Finite reduced crystallographic root-factor classification only, not classification of arbitrary reductive schemes or central isogeny forms. |
| 3–4: R1/R5 → QuiverRepresentations 5 | Accept the mathematics; remove duplicate copies. Positive roots and finite ADE Cartan classification already occur in the quiver packet. Sink-admissible BGP descent and Gabriel's theorem remain consumer work. |
| 5–6: R5/R6 → CFSG I0 | Keep. Enumeration/validity/rank and numbered root-length data; no need to wait for the classification summit. |
| 7: R6 → CFSG L0 | Keep. Explicit named integral datum/base, not a root system chosen from an existence theorem. Does not assert that reduction preserves the spanning-root-system predicate. |
| 8: R6 → CFSG L1 | Keep and update availability. Numbered matrix and symmetry checks feed the diagram map. Those checks and the integral-datum lift already exist; group-scheme lifting/Frobenius compatibility remain separate. |
| 9: R6 → CFSG L2 | Keep. Long/short designation fixes exponents. The B2/C2 node adapter preserves lengths; the special isogeny exchanges lengths. Root data alone do not supply the group isogeny. |
| 10: R1 → LieHighestWeight 3 | Keep. Finite positive-root index set for the Kostant partition function and nilradicals. Partition finiteness and PBW/Verma multiplicities remain consumer proofs; general-field PBW does not inherit root-system restrictions. |
| 11: R1 → LieHighestWeight 4 | Keep. Finite Weyl orbit; integrality, a discrete real realization and the convex-hull bound remain necessary to deduce finite weight support. |
| 12–13: R1/R2 → LieHighestWeight 6 | Keep. Simple reflections permute the remaining positive roots and generate the actual Weyl group, supplying the denominator-alternation argument. Character algebra, rho and sign/determinant comparisons remain with highest weights. |
| 14: R4 → LieHighestWeight 7 | Keep and qualify availability. Apply dominant-orbit uniqueness to lambda+rho after the integral/real comparison. The pin supplies closed-chamber uniqueness too; do not schedule another proof. |
| 15–17: R2/R4/R5 → ClassicalGroups 3 | Keep. Type-A permutation Weyl group, chamber inequalities and classical models. GL_n has type A_(n−1) after removing its central direction; central character and isogeny-form lattices are additional data. |
| 18: R1 → LieGroups 6 | Keep. Finite abstract Weyl group and positive roots. N(T)/T comparison, maximal tori, integration and central-torus directions remain consumer work. |
| 19: R2 → LieGroups 8 | Keep. Coxeter length/inversion count for Schubert-cell dimensions; it neither constructs cells nor proves Bruhat decomposition. |
| 20: R6 → IntegralLattices 5 | Keep. Numbered ADE matrices/coordinates for acceptance calculations. The root lattice is the integer span of roots, not the entire weight lattice; discriminant forms and the D8+ isometry remain distinct. |
| 21: R5 → Spin 5 | Keep. Explicit B/D realization for comparison with the bivector Cartan. The numbered-data input from R6 already occurs in the Spin packet. Preserve valid rank ranges and low-rank adapters. |

## Every overlap

1. **General root/weight lattices: retain `rescope`, correct reuse.** The source
   documents still assign the general dictionary to each other. Keep finite-type
   coordinate data with RootSystems and the general highest-weight dictionary
   with LieHighestWeight. Do not define root/coroot lattices again: Mathlib
   `RootPairing.rootSpan` and `corootSpan` are the scalar spans
   (`IsValuedIn.lean:166,169`); `Base.toWeightBasisInt` is a basis of the integer
   root span (`Base.lean:407`). Despite its name, it is not a basis of fundamental
   weights. Remaining weight/coweight/rho and real-realization comparisons need
   individual declaration checks before missing work is assigned.
2. **GL_n central data: retain `rescope`.** Finite semisimple root types do not
   supply the diagonal torus character lattice Z^n or its central direction.
   ClassicalGroups owns that comparison and restriction to SL_n; connected SO/Sp
   and disconnected O representation problems stay separate.
3. **Quiver reflections: retain `rescope`.** Arbitrary finite acyclic quivers
   need kernel/cokernel reflection functors without finite-type assumptions.
   Finite ADE comparison and sink-admissible descent are separate units;
   arbitrary simple-root lowering is not the latter theorem.
4. **Nonreduced restricted chambers: retain `rescope`, correct availability.**
   A reduced-subsystem comparison preserving hyperplanes, Weyl action and cones
   remains necessary. Closed-chamber uniqueness is already supplied by
   `TauCeti.eq_of_mem_orbit_of_mem_dominantChamber` and
   `existsUnique_mem_orbit_inter_dominantChamber`
   (`FundamentalDomain.lean:206,232`). Preserve the ordered-ring, finite,
   crystallographic and reduced-pairing hypotheses, including the flipped
   pairing; the latter theorem also uses the root-system spanning hypothesis
   for existence. Import it after establishing the nonreduced comparison.
5. **D4 triality: retain `rescope`, replace extraction with imports.**
   `TauCeti.trialityPermD4` is the cycle (0 2 3), with exact order three and
   Cartan preservation (`DiagramPermutations.lean:74,183,284`).
   `DynkinType.diagramAut` lifts a preserving permutation to the named integral
   datum (`SimplyConnectedRootDatum/DiagramAutomorphism.lean:267`). Its weight
   map permutes fundamental-weight coordinates (`:286`);
   `diagramAut_pow_eq_one` supplies the cube relation (`:381`), and
   `diagramAut_eq_one_iff` supplies nontriviality (`:319`). For this nontrivial
   three-cycle those yield exact order three. This is an inference from the
   checked declarations, not a claim of a separately named D4 order theorem.
   Reuse the API. Group-scheme lifting and transport to the Clifford Spin carrier
   remain separate. No duplicate R6 → Spin8 edge is added; other review files
   are not changed.
6. **ADE lattices/E8: retain `keep`.** Primitive coordinates must not depend on
   downstream discriminant/gluing classification. The named integral datum and
   base already exist (`SimplyConnectedRootDatum/Assembly.lean:79,94`). This
   check does not certify the separate discriminant or D8+ calculation.
7. **Euler forms: retain `keep`.** Composition-factor Cartan matrices,
   nonsymmetric Ext-Euler matrices and symmetrized root Gram matrices differ.
   Keep generic categorical descent independent of root classification; the E8
   example must state its transpose and E+E^T conventions.

The source documents are outside this issue's edit scope. The revised packet
avoids new plans for the checked library results. It does not claim that every
remaining consumer interface is absent.

## Completeness and deduplication

All six own stages were spot-checked, exceeding the five-stage request. Searches
covered 218 roadmaps/2,007 stages for root, Weyl, Dynkin, Cartan, Coxeter,
Matsumoto, exchange, chambers, reduced words, braid, Bruhat, lattice and
fundamental-weight terminology. Read eleven additional candidate descriptions:
ReductiveGroups 7; ReductiveGroupsPartII RG2.1/2/4/5; GeometricSatake GS4 and its
integral-dual-group substage; LanglandsParameterStacks LP3; endoscopy ET.3;
MetaplecticAutomorphicForms MP.0; and Spin 9. Read the five summaries added since
the original screen and searched their stages.

No additional exact independent dependency was established. Relative,
multipliable and affine-root comparisons are not automatic finite-root
specializations; integral dual-group reconstruction belongs to ReductiveGroups
and its Part II; the Coxeter-number bound in ET.3 is not a promised RootSystems
output; monoidal braidings and Schwartz–Bruhat functions are unrelated matches.
Spin 9's root-decomposition/rank bookkeeping already consumes LieHighestWeight 1.

The removed Gabriel copies remain in
`links/tauceti_TauCetiRoadmap_RepresentationTheory_QuiverRepresentations.json`.
Existing numbered-data links in the Zigzag and Spin packets remain there. No
other worker's files or atlas edges are edited. Historical `coverage` and
`provenance` describe the original screen; this review has separate fields.

## Validation and intake

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems.json`:
  **0 errors, 0 warnings**; 19 links, seven overlaps, 217 examined partners.
- All 42 original and 38 retained excerpts/locators verified against raw files;
  endpoint IDs and the full partner inventory checked.
- No duplicate edge remains against the atlas or other current link packets.
  Removed pairs are confirmed present in the quiver packet. No new edge means
  this review introduces no new cycle.
- Six cited pinned-source hashes verified. No Lean file is required or compiled;
  this is a dependency review, not an implementation submission.
- Only the authorized link JSON and this report are submitted; valid JSON and no
  private paths. `intake.py check-files` passes for both files.

The full issue requires the JSON review object, while generated queue outputs
list only this Markdown report. Both instructed files are submitted and the
metadata conflict is flagged in the PR. The worker does not edit the queue,
merge, close issues or change labels.
