# Independent review of BP-GeometryOfNumbersAndQuadraticArithmetic--GN.0

**Accepted.** Claude session `claude-OOfyXC`, job `REV-GeometryOfNumbersAndQuadraticArithmetic--GN.0` (issue #9282), 13 October 2026. The part was written by Codex session `codex-iywz6Y` (PR #9370); this session did none of it.

The packet is a complete pass for stage GN.0, which it marks `closed`. Its `review.checked` gives a verdict for every node: **8 verified, 7 corrected, none added, none unverifiable**. No gap was found and no request is needed. Every implementation status stays `unchecked`.

## Counts

| | Before | After |
| --- | --- | --- |
| Nodes (4 definitions, 2 comparisons, 9 theorems) | 15 | 15 |
| API items | 18 | 27 |
| Unit tests | 12 | 13 |
| Baseline declarations | 23 | 26 |
| Planets | 6 | 6 |
| Gaps / requests / source issues | 0 / 0 / 0 | 0 / 0 / 0 |

## What was checked

- **Sources, at every locator.** I fetched both preprints again; their SHA-256 hashes match the packet. In Browning–Le Boudec–Sawin, arXiv:2006.02356v1 (printed page = PDF page), I read (2.3) and (2.7) on p.4, §3.1 on pp.7–8 with (3.1)–(3.4) and Lemma 3.1, and Definition 3.7 and Lemmas 3.8–3.9 with the whole proof of 3.9 on pp.11–12. I rendered pp.7, 8 and 11 as images to confirm the displayed quotients in (3.2), (3.4), Lemma 3.8 and both formulas of Lemma 3.9, which text extraction flattens. In Le Boudec, arXiv:2006.02288v1, I read §2.2 with Lemma 4 and its proof on pp.8–9. Each node's statement keeps the source's hypotheses or states its extension as a worker extension. No excerpt is recorded.
- **Mathematics.** I recomputed every acceptance check and worked example by hand, among them:
  - saturation of ℤ(2,2) and of 2ℤ²;
  - G = 6 for columns 2e₁, 3e₂, and G = 0 for (1,2), (2,4);
  - the kernel covolumes √2 for (1,1) and (2,2);
  - the Schmidt example for L = ℤ(1,1);
  - the triangular form for c = (1,0), d = (1,2);
  - the two-congruence index 18 = 36/2;
  - the mixed covolumes 3 and 3√2.
- **Baseline.** I read all 23 declarations in the pinned Mathlib source (082e2d3) with their section variables. Each exists under its name and provides what its citing nodes use. Three declarations were added (below).
- **Parent and supplier nodes.** I read the statements and hypotheses of every base-packet GN.0 node the part cites as a prerequisite: covolume-square-gram, saturated-adapted-basis, projected-adapted-basis, dual-projection-comap, orthogonal-intersection-basis and primitive-orthogonal-covolume. I also read prescribed-primitive-basis, covolume-projection, covolume-dual and mixed-embedding-normalization, which its imports name. I also read EffectiveBoundsCompactModels CM.0 canonical-measure, canonical-covolume and first-half-minima, with that packet's accepted review of 11 October 2026.
- **Coverage.** The base packet's two `remaining` items for GN.0 are discharged: the BLS consequences are planned here, and the weighted metric is owned by its consumer. All 13 items of PAPER-BROWNING-LEBOUDEC-SAWIN-23 routed to GN.0 are realised. Both ArithmeticStatistics ST.5 requests to GN.0 are served: the two-congruence formula, and the total minor gcd with unimodular invariance, saturation index and the dependent and empty conventions. The stage's own targets are library-built (audit AUDIT-02) or planned in the base packet, so `closed` holds.
- **Duplication.** The library audit marks only the GN.0 carriers as built. I checked these places:
  - TauCetiRoadmap IntegralLattices §5F (primitivity as a torsion-free cokernel);
  - the current Tau Ceti files ZLattice/Covolume.lean (covolume² = Gram determinant) and IntegralLattice/PosDef/Covolume.lean;
  - current Tau Ceti's square Smith normal form;
  - current Tau Ceti's `Submodule.minorsIdeal` (RingTheory/FittingIdeal/Basic.lean).

  None of them supplies the ℤ-content, saturation index or kernel determinants planned here. The last one is now recorded as a compatibility (below).
- **Suggested file.** `lean-check` of the corrected file at the pins exits 0. Its 49 warnings are all `declaration uses sorry`. Every typed signature was reread as a true statement, including the boundary cases N = 0, k = 0, k > N and Q = 0. A script confirmed that every packet API and unit-test name occurs in the file, and that every node id and prerequisite occurs in the reader. The file has 241 lines; its SHA-256 is `90c13544…5517`. As a sanity check in scratch, `maximalMinorGCD_eq_zero_of_lt` and the primitivity tests were actually proved.
- `python3 scripts/check_blueprint.py` on the packet reports 0 errors and 0 warnings.

## Corrections (packet, reader and suggested file)

1. **Closure.** I added three prerequisites where the parent bridges need them:
   - **orthogonal-saturation and Schmidt dual: self-duality of ℤ^N.** The parent orthogonal-intersection-basis assumes Δ* = Δ, and both nodes used ℤ^N as self-dual without a source. Each now has the step "the standard basis is orthonormal, so `dualBasis_eq_iff` makes it its own dual basis and `dualSubmodule_span_of_basis` gives A_N* = A_N". Those two Mathlib declarations were added as prerequisites.
   - **Schmidt dual: the adapted basis.** The parent projected-adapted-basis takes as input an ambient integral basis whose first block is a basis of L. That input is the parent saturated-adapted-basis, now a prerequisite, and step 1 says so.
   - **Two-congruence target: covolume one of the standard lattice.** This step now cites the parent covolume-square-gram (identity Gram matrix) and `ZLattice.covolume_pos`.
2. **Locator.** The Schmidt-dual node cited "Lemma 3.1 and the definitions preceding it, p.8". The quotient lattice Λ/Γ = π(Λ) is defined on p.7, so the locator now reads Lemma 3.1, p.8; quotient lattice, §3.1, p.7; intrinsic dual (3.4), p.8.
3. **API.** Nine items were added, each serving a recorded use:
   - **Saturation.** `saturation_eq_comap_torsion` says that sat(L) is the preimage of Mathlib's `Submodule.torsion` of A_N/L. This is the compatibility with the torsion-free-cokernel form of primitivity. The characterisation node now states and proves it (step 5, prerequisite `Submodule.torsion`).
   - **Exact kernel.** `saturation_exactKernel` and `finrank_exactKernel` (rank N − 1 for c ≠ 0; BLS §3.3 uses this rank).
   - **Congruence kernel.** `smul_mem_congruenceKernel` (QA_N ≤ K_Q(c)) and `finrank_congruenceKernel` (full rank for Q > 0). The two-congruence target uses both.
   - **Minor gcd.** `maximalMinorGCD_single_column` (used by the one-equation covolume), `maximalMinorGCD_square` (G = |det C|, used at k = N) and `maximalMinorGCD_eq_zero_of_lt` (k > N).
   - **Minor gcd and `minorsIdeal`.** `maximalMinorGCD_span_eq_minorsIdeal` says that, for every C, the ideal (G(C)) is the k×k minors ideal of the column lattice in current Tau Ceti's `Submodule.minorsIdeal`. That carrier is not at f790474, so the item is listed in the suggested file's closing "Statements not typed at the pins". An `existingWork` entry records the library declaration and the upstream IntegralHeckeAndGaloisDeterminants use (§6.5 takes its maximal-minor ideal to be `(range f).minorsIdeal m`).
4. **A unit test that a wrong definition fails.** The three minor-gcd tests (G = 6 for 2e₁, 3e₂; G = 1 for the empty matrix; G = 0 for dependent columns) are all also passed by √det(CᵀC), the covolume of the column lattice, which is exactly the confusion the node's acceptance check warns about. I added `maximalMinorGCD_skew_pair`: for columns (1,1,1), (1,−1,1), G = 2, while √det(CᵀC) = 2√2 and the product of the column contents and the gcd of the entries are both 1.
5. **RT-AREA-algebraicnt-1/1 (item 9a).**
   - **The problem.** The packet's `restructure` entry and its reader proposed the red team's original fix: add the four owners to the roadmap-level `prerequisites` and add the roadmap to their `consumers`, with no stage edges. The verifier confirmed the finding only narrowly. It prescribed a different remedy:
     - record quoted supplier-stage → consumer-stage links in the link workflow, with full `tauceti:` identifiers;
     - let assembly derive the reciprocal roadmap relations;
     - never hand-edit roadmap metadata, generated exports or Tau Ceti documents.
   - **The correction.** The entry and the reader now follow the verdict, as the GN.1 part already does. No GN.0 node uses any of the four suppliers, so no link goes into GN.0. The links belong to GN.2 (the QuadraticFormInvariants field-invariant layers, GlobalQuadraticForms Layers 5–6 and Completed IntegralLattices Layers 1–4) and to GN.3 (AdelicAlgebraicGroups AA.2 and AA.3), as those parts record.
6. **Planets.** The base packet already shows three planets on GN.0: Gram–Hadamard inequality, Factor-lattice covolume and Primitive orthogonal covolumes. With the six marked here, the assembled layer would show nine, and a layer shows at most six. The reader had declined a sub-layer. The packet now proposes, as the GN.1, GN.2, GN.3 and GN.5 parts did, two sub-layers, with GN.0a first:
   - GN.0a, "Metric lattices: Gram determinants, projections and duality": the base packet's 17 nodes and 3 planets;
   - GN.0b, "Integral saturation and kernel determinants": the 15 nodes here and their 6 planets.

   The planet choices themselves are kept. They are the key definitions (primitive lattice, gcd of maximal minors) and the source's named results (Lemmas 3.1, 3.8 and 3.9).
7. **Imports.** The weighted-metric import now says that the base packet's gap "Consumer weighted arithmetic metric adapter" is closed at assembly by the accepted consumer-owned CM.0 nodes. EffectiveBoundsCompactModels consumes GN (CM.0/first-half-minima cites GN.1), so no request or link from GN.0 to it is created.

The reader was edited only in the affected node sections and in the ownership and completion paragraphs; every packet change is mirrored there. The suggested file gained the nine API signatures (eight typed, one in the closing note), the new test and the `Mathlib.Algebra.Module.Torsion.Basic` import.

## Baseline citations

None was wrong or removed. The following were added:

- `mathlib:Submodule.torsion` (Algebra/Module/Torsion/Basic.lean);
- `mathlib:LinearMap.BilinForm.dualSubmodule_span_of_basis` (BilinearForm/DualLattice.lean);
- `mathlib:LinearMap.BilinForm.dualBasis_eq_iff` (BilinearForm/Properties.lean).

Each was read at the pin and is in the pinned declaration index.

## Mistakes in the sources (item 6a)

The packet lists none, and the review found none at the locators read. Two remarks:

- BLS justify (3.6) by citing the Smith normal form. The two-sided normal form needs a further column step to reach their one-sided triangular shape, which holds because c is primitive. The node spells this out. This is a terse step, not an error, so it is not recorded.
- BLS (3.2), (3.4), Lemma 3.8 and Lemma 3.9 are quotients on the page, although text extraction prints them as products; this is an extraction artefact, not a misprint.

## Questions for the orchestrator

- **Packet status.** The packet status is `complete`. Since GN.0 is `closed` with no gaps or requests, `closed` would also satisfy the protocol; I followed the prevailing practice of the GN follow-ups.
- **Assembly.** When the parts are assembled:
  - apply the GN.0a/GN.0b division;
  - drop the base packet's weighted-metric gap;
  - repoint ArithmeticStatistics ST.5's two requests to `arithmetic-two-congruence-covolume` and `arithmetic-minor-gcd`;
  - once the Tau Ceti baseline moves past f790474, type `maximalMinorGCD_span_eq_minorsIdeal`, and use `minorsIdeal_comap_equiv` for the ambient unimodular invariance.
- **RT links.** The stage links for RT-AREA-algebraicnt-1/1 belong to the link workflow, not to this part.
