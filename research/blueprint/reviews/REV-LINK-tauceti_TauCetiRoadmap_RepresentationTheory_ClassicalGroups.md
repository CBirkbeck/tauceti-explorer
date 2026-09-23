# Independent review: ClassicalGroups links

- Job: `REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups`; issue #125.
- Reviewer: Codex — codex-a71f92.
- Original author: ChatGPT Pro — cgp-87a9defc4f57 (LINK job #58).
- Date: 2026-09-23.
- Input revision: `7ce45a850ba7cfa28e9ce1340b68bfb34a8ab369`.
- Verdict: **accepted, with one additional ownership overlap**.
- Scope: the link map, not certification of the upstream roadmaps or implementation.

## Reading and evidence boundary

Read all seven ClassicalGroups stage descriptions and their surrounding conventions,
every source stage of the 12 links, the complete overlapping InductionRestriction
Layer 5, the relevant sibling contracts and their existing link/overlap records.
The primary evidence for this job is the repository's roadmap contracts.
No external book theorem or claimed Mathlib inventory was promoted to independently
verified implementation evidence. No Lean source was added or compiled.

Every one of the original 24 evidence passages is an exact, whitespace-preserving
substring of the named source document. Some consumer passages occur in the
roadmap-wide conventions or acceptance checks rather than the stage body; this is
permitted by PROTOCOL §10. They describe the same rational representation,
weight or rank-one interface. The two quotes for the added overlap also pass this
strict test, giving 26 exact checks.

## Every directed link

Numbering follows the packet. RG = ReductiveGroups; LH = LieHighestWeight;
CG = ClassicalGroups. All directions below are prerequisite → consumer.

| # | Link | Independent contract check |
| --- | --- | --- |
| 1 | RG1 → CG0 | The coordinate-Hopf comodule dictionary supplies rational representations. CG must still prove the concrete complex-point/matrix-coefficient comparison and separate polynomiality. It does not classify arbitrary abstract group actions. |
| 2 | RG6 → CG0 | The characteristic-zero equivalence between reductive and linearly reductive supplies complete reducibility. RG's worked examples explicitly include GL and require proving reductivity (lines 296–304); transport uses link 1's rational finite-dimensional comparison. No positive-characteristic assertion is imported. |
| 3 | RG2 → CG3 | Differential of an algebraic homomorphism supplies the differentiated representation. Matrix Lie identification and the connected rational group/Lie invariant-subspace and intertwiner comparisons remain consumer work. |
| 4 | RG4 → CG3 | Algebraic torus character/cocharacter lattices specialize to the diagonal torus. CG owns the integral-coordinate identification and weight decomposition; abstract characters of complex points would be the wrong object. |
| 5 | RG7 → CG3 | Full algebraic-group root data retain character lattices and isogeny form. RootSystems' semisimple root models alone do not recover the GL central direction or SO/Spin descent. |
| 6 | LH4 → CG3 | Finite-dimensional semisimple highest-weight classification is used on the derived Lie algebra. Connected group comparison, integral GL center, SO descent and disconnected O extension remain separate. |
| 7 | LH9 → CG3 | The reductive gl/sl transfer and central scalar supply the missing Lie-theoretic central datum. Rational group integrability imposes integral tuples; the empty-rank case cannot use a last coordinate. |
| 8 | LH6 → CG4 | The representation-theoretic Weyl character identity supplies an actual character, unlike a root-system alternating sum alone. Torus evaluation and determinant/Laurent central twists are still CG's comparison. |
| 9 | LH6 → CG5 | The coroot dimension product supplies the abstract dimension theorem over Q. Hook-content and explicit classical-coordinate identities are additional consumer calculations; integrality precedes N-valued dimensions. |
| 10 | LH0 → CG3 | The explicit rank-one V(m), irreducibility and spectrum supply CG's GL2/SL2 differentiated acceptance test. CG must construct its actual intertwiner. The later general Weyl formula is not imposed as an early prerequisite. |
| 11 | LH3 → CG6 | General-field PBW and ordered-subalgebra comparisons supply the enveloping maps for the upper-left gl tower and injectivity. They do not supply Capelli generators or simultaneous eigenspaces. |
| 12 | LH7 → CG6 | Full semisimple central characters separate dominant weights; combine with LH9's scalar center to distinguish gl rows. A single Casimir would not suffice. The k=1 case, polynomial-center/generator API and simultaneous diagonalization remain explicit obligations. |

All 12 are retained unchanged. Explicit versus inferred labels are consistent
with the packet's conservative two-document attribution policy. No proposed
edge relies only on shared terminology.

## Every overlap

1. **RG1 / CG0 — keep.** The general rational-comodule carrier and the concrete
   complex-point coordinate predicate have different responsibilities. Keep one
   general category and prove the concrete comparison, rather than duplicate it.
2. **InductionRestriction5 / CG3 — rescope.** Finite-group Clifford theory with
   Maschke does not apply directly to infinite O_n(C). A finite-index lemma with
   semisimple restriction and rationality/extension hypotheses, or a dedicated
   index-two algebraic proof, is needed. Correctly no directed edge is asserted.
3. **LH6 / CG4–5 — keep.** LH owns abstract character/dimension theorems; CG owns
   group comparison, coordinates and central twists. RootSystems is only the
   combinatorial supplier.
4. **LH7/9 / CG6 — rescope.** The generic reductive enveloping center and normalized
   Harish–Chandra comparison need one owner. CG owns the tower, GT eigenvalues
   and basis. This is not a claim that LH currently exports normalized full
   polynomial generators.
5. **Added: CG1 / SchurWeyl8 — rescope.** Both construct the diagonal tensor-power
   action, before Young images or classification. The two exact quotes are
   included, marked `addedBy: REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups`.
   Identify the tensor carriers and parameter roles explicitly: CG
   `tensorPowerRep n d` and SW `glAction n d` both mean dimension n and tensor
   degree d, although SW's displayed bound-variable names are d,n.
   Choose one early constructor owner (CG1 is proposed) and reuse it in SW8.
   This differs from the existing CG2/SW8 Young-image overlap. Since ownership
   direction is not fixed in the current contracts, §10 requires an overlap,
   not an invented edge.

## Completeness spot-check: all seven focus stages

Searched the full atlas and current additional roadmap definitions: **2007 stage
records**, deduplicated by stage ID. This supplements a full-text roadmap screen.
The counts below are lexical candidates outside CG, not accepted dependencies
and not proofs that other mathematical needs are absent.

| Focus | Query family | Stage hits / roadmap hits | Disposition after contract checks |
| --- | --- | --- | --- |
| CG0 | rational representations, comodules, linear reductivity | 17 / 11 | RG inputs already present. LieGroups' analytic route needs additional rationality comparison; it is not silently substituted for CG's chosen algebraic route. |
| CG1 | tensor powers, tensorPowerRep, glAction, exterior/symmetric powers | 46 / 32 | New early diagonal-action overlap above. Existing Spin exterior-power consumer retained in its sibling packet; cohomological tensor powers are different carriers. |
| CG2 | Young symmetrizers, Schur functors, mutual commutants | 6 / 3 | SW supplies the symmetric-group side. AG2.1a's algebraic projectors require coefficient/field-of-definition and geometric contracts not supplied by complex CG alone. |
| CG3 | highest weights, character lattices, dominant integral weights | 33 / 18 | Existing LH/RG/RootSystems inputs cover the checked exact interfaces. AF4/B2/B4 need general groups, rational descent and lattices; LP3/PA.1 need integral and mod-p representation theory, not characteristic-zero semisimplicity. |
| CG4 | Schur polynomials, schurPoly, Weyl character, bialternant | 5 / 4 | Existing LH6/SW7 links retained. Bialternant/Pieri/LR contracts remain explicitly incomplete in the sibling overlap; an advertised word is not a supplier theorem. |
| CG5 | Weyl dimension, hook-content | 1 / 1 | LH6 is the exact abstract supplier. No additional directed link established. |
| CG6 | Gelfand–Tsetlin, Capelli, central characters, branching | 41 / 22 | SW7's RSK/Jacobi–Trudi outputs are not the required GT/tableau dictionary. LH3/7 ingredients are present; the reductive-center and normalization gaps remain open. |

Additional candidates read include RG2.0a/RG2.4 (Weil restriction/relative
nonarchimedean decompositions), ShimuraData D1 (real Deligne-torus representations),
LP3 and PA.1 (integral highest-weight/good-filtration theory), and AG2.1a/AG2.6
(geometric projectors and coefficient-prime comparisons). Their stated
generality does not justify a direct complex classical-group edge.

The RootSystems, SchurWeyl and SpinRepresentations packets already record
**nine relevant links and six overlaps**. Checked those records and their
boundaries; did not duplicate them. In particular no reverse CG classification
edge is added before Schur–Weyl duality. No extra directed supplier/consumer was
established in this spot-check beyond what is already recorded.

## Checks and remaining boundaries

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.json`:
  0 errors, 0 warnings; 12 links, 5 overlaps, 217 original examined entries.
- Strict source-document evidence check: all 26 quotes verbatim.
- Supplemental reverse-reachability stress test: combine the 3508 atlas edges,
  729 link-packet entries and 56 additional consecutive-layer order edges
  across CG, RG, LH, RootSystems, SchurWeyl, SpinRepresentations and
  InductionRestriction. None of the 12 retained links has a target-to-source
  return path. This is a stronger local cycle test, not certification of every
  unrelated component of the atlas. Native atlas edges alone omit CG's internal
  layer ordering.
- Intake file validation: 2 files, 0 problems. Intake unit tests: 29 passed.
- Publication refresh: `879a43a59c32230f32e26b93a7af789e7a579aec`; all 570 unchanged guarded inputs match. Two concurrently reviewed sibling packets (SchurWeyl and GrothendieckEulerForms) changed metadata/reasons, but neither changed its directed endpoint set. Read the relevant SchurWeyl link-9 refinement; the GL-span proof remains its own obligation. Re-ran the link checker, exact quotes, augmented reverse-reachability, two-file intake validation and 29 tests on this publication snapshot. No guarded content or roadmap files changed or were added/removed.
- No Lean compilation: this PR contains a link-map review, not a Lean file.

The four original unresolved-interface entries remain intact. In particular,
a contravariant norm cannot choose a GT vector (v and -v have the same norm);
full central generators, negative integer patterns, and type-specific branching
multiplicities remain real tasks. Acceptance means that the qualified
dependencies and ownership proposals faithfully represent their contracts,
not that these gaps have been solved.
