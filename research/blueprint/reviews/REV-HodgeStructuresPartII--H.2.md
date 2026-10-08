# Independent review: variations, canonical extensions and fixed parts — H.2

**Verdict: accepted conditional target-level planning pass.** Issue #7026;
job REV-HodgeStructuresPartII--H.2. Reviewer: Codex, session codex-6zoSpY,
8 October 2026. The input was BP-HodgeStructuresPartII--H.2, issue #6939,
by Codex session codex-VKQBv5; this reviewer did not author it.

Acceptance concerns the corrected specifications and their honest dependency
boundaries. The packet is a complete pass and H.2 is planned, with every stage
target represented. Nineteen gaps and fourteen requests remain. H.2 is not
closed, every implementation is unchecked, and full-file Lean elaboration was
unavailable because its first imported Tau Ceti object was not cached.

| Measure | Reviewed result |
| --- | --- |
| Nodes | 33: 5 definitions, 8 constructions, 16 theorems, 3 lemmas, 1 comparison |
| Node verdicts | 20 corrected, 11 verified, 2 added, 0 unverifiable |
| API items / definition-construction tests | 57 / 45 |
| Planets | 6, retained |
| Pinned baseline statements | 18 confirmed: 13 original, 5 added |
| Baseline citations removed or renamed | 0 |
| Exact external supplier nodes | 13 contracts independently read |
| Source PDFs | 12 independently refetched; all original hashes matched |
| Source issues | E1 confirmed; E2 added and confirmed |
| Open gaps / requests | 19 / 14 |
| Distinct suggested names | 131: 65 represented prototypes, 66 explicit omissions |
| Reachable exact-node / stage-requires graph | 233 vertices, no cycles |
| Packet checker | 0 errors, 0 warnings, with declaration index |
| Full suggested-file Lean | Stopped at missing first imported cached object before type checking |

## Corrections made in place

1. Corrected source editions and locators. The Pearlstein–Peters public PDF
   has 57 pages and September 2023 metadata, with Appendix A on printed
   pp.51–53. Steenbrink–Zucker Definitions 3.4–3.5 are on p.508;
   (3.13) is a list of properties, and Appendix A.9 is on p.541.
   Its curve fixed part is **Proposition 4.19, p.517**, not a corollary on
   p.518. Deligne's extension exactness is in the unnumbered paragraph
   after II.5.4(i)–(ii), not a nonexistent (c). The unipotent tensor property
   is II.5.2(d), pp.92–93. The Gauss–Manin citations are **Theorem 6.13**
   and **Proposition 6.14**, pp.106–107. Finite determinant is
   **Corollary 4.2.8(iii)(b), pp.47–48**, and geometric connected monodromy
   is **Corollary 4.2.9(a), p.48**. Updated the reader and source receipts.
2. Separated analytic logarithmic comparison from algebraic de Rham
   comparison. Arbitrary finite-rank complex local systems have the
   analytic canonical extension. The algebraic coefficient comparison
   requires a specified regular-singular algebraic realization and
   algebraic logarithmic extension. Made the analytic base explicit in
   relative hypercohomology. Strengthened the C5 request/G7 to include
   coefficient sheaf/singular comparison, relative-SNC local topological
   triviality, coherent hypercohomology and base change.
3. Removed `ComplexComparisonPartII:C5/repair-sheaf-singular-comparison`
   from the nonconstant logarithmic comparison's direct prerequisites.
   Its actual statement is for constant coefficients. The precise
   nonconstant strengthening remains a C5 request, rather than a falsely
   available node. Removed geometric-pure from the abstract connected
   semisimplicity proof and mixed-fixed-part from the corrected mixed
   monodromy proof because those proofs do not use them.
4. Promoted two API facts that subsequent nodes consume: canonical
   extension uniqueness and connected-monodromy invariance under finite
   covers. Both carry addedBy=REV-HodgeStructuresPartII--H.2. Extension
   exactness, residue normalization and unipotent tensors now cite the
   uniqueness node; connected semisimplicity cites the finite-cover node.
   Existing API names are preserved, with their promoted node IDs.
5. Reused five exact native APIs: basepoint-change monodromy intertwining,
   the graded pure map of a rational mixed morphism, and rational Deligne
   splitting, its functoriality and its internal-direct-sum theorem. The
   suggested gradedMap wrapper now directly returns native gradedHom.
   The fixed-part sketch identifies its native rational proof separately
   from the still-requested real analogue. The L2 request expressly reuses
   rational splitting instead of planning it again.
6. Added the LPV.1 request for relative-filtration tensor/dual/Hom and
   functoriality: the two existing LPV nodes give the ordinary filtration
   and relative uniqueness, not these operations. The complete SZ85
   Appendix A.4/A.10 argument is the mathematical source; the generic
   characteristic-zero linear algebra remains with LPV.1.
7. Repaired the finite-determinant proof. The integral lattice gives
   algebraic-integral determinant values, and conjugate constituents in
   the fixed rank-N rational representation give degree at most N.
   Every conjugate value has modulus one. For degree d≤N, the absolute
   value of the j-th minimal-polynomial coefficient is at most
   binomial(d,j), so there are finitely many integer coefficient lists
   and hence finitely many determinant values. A finite multiplicative
   image has some positive common exponent. This uses no finite
   generation of the fundamental group and does not assert the false
   rank-factorial exponent. G16 now names these exact formal interfaces.
8. Replaced the mixed-monodromy proof with the connected subdirect-product
   argument. Rational weight subspaces intersect the preserved integral
   lattice in saturated sublattices, so all graded quotients remain finite
   free integral local systems. If K is the joint graded closure, its
   projections onto each graded closure are surjective; the corresponding
   connected projections are surjective. Its connected solvable radical
   has connected normal solvable image in each semisimple factor, hence
   trivial image in every factor. The faithful product inclusion kills
   that radical, so K° is semisimple. The kernel on all graded pieces is
   normal unipotent and connected in characteristic zero; it equals the
   unipotent radical and the connected solvable radical. RG3/RG6 requests
   now supply the component-image and radical-projection declarations.
   G17 no longer asks for a generic Mumford–Tate normality engine.
9. Recorded the connected-reduction cover carefully. The finite-cover
   lemma compares groups for a supplied topological cover. Applying an
   algebraic-base finite-determinant theorem after restricting to the
   inverse image of G° also requires an algebraic finite étale cover.
   Added UniversalCovers Stage 2 for the pointed topological subgroup
   correspondence and **G19** for the Riemann-existence comparison owned
   by original ComplexComparison PR196 Layers 8–12. No installed exact
   supplier was verified for that algebraic comparison.
10. Added the ComplexPVHS extensionality API and its point signature.
    Strengthened two realification examples to inspect the actual
    constructor's Hodge pieces and filtration. A bare scalar-dimension
    identity would also pass for an incorrectly defined realification.
    Positive degree is now an argument of the necessary-disc-data cover
    signature and its ramification test. These prototypes retain their
    explicitly limited scope; none is called a full global variation.
11. Confirmed source issue E1 against all three pages of Deligne's April
    1971 LNM erratum. Added E2 after visual inspection of the published
    IHÉS p.48 numerical step and an independent counterexample; details
    are below. Both verdicts appear in the packet and reader. No source
    quotation or source-by-section paraphrase was added to the repository.

## Source checks and source issue E2

The [reader's source records](../readmes/HodgeStructuresPartII--H.2.md)
retain all twelve public URLs, exact editions, hashes, printed locators and
read/unread boundaries. Sources were refetched for this review; their hashes
match the input. The readings were of the statements and printed arguments
needed by H.2, rather than of every page of each document.

- [Landesman–Litt, canonical representations, v4](https://arxiv.org/pdf/2205.15352v4):
  §§4.1–4.2, pp.24–26, and §5 coefficient Gauss–Manin setup, pp.27–29;
  [geometric local systems, v3](https://arxiv.org/pdf/2202.00039v3):
  §4.1, pp.27–29, including the complete printed Proposition 4.1.4 proof.
- [Deligne, LNM 163](https://publications.ias.edu/sites/default/files/Number9.pdf?download=1):
  II.5, pp.91–96, II.6.2 statement p.98, II.6.10 p.105,
  II.6.13–6.18, pp.106–109;
  [April 1971 erratum](https://publications.ias.edu/sites/default/files/Erratum%20to%20SLN%20163.pdf?download=1),
  all three pages. Local II.3.15/6.9 remains G7.
- [Deligne, Théorie de Hodge II](https://www.numdam.org/item/PMIHES_1971__40__5_0.pdf):
  §§4.1–4.2, pp.40–49, including the finite-determinant argument and
  extension monodromy Lemma 4.2.10;
  [Un théorème de finitude](https://publications.ias.edu/sites/default/files/56_Untheoremede.pdf?download=1):
  §§1.11–1.14, printed pp.8–10. The cited analytic bounds and unprinted
  Nori underlying-system semisimplicity proof remain G13/G14.
- [Steenbrink–Zucker](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf):
  §§2.1–2.11 pp.498–502, §§3.1–3.17 pp.507–512,
  §§4.1–4.20 pp.513–518, §5.26 p.534 and Appendix A pp.537–541.
  [Timmerscheidt](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0379/LOG_0011.pdf):
  §§5–7 pp.163–170. Cited pure degeneration, harmonic-form and
  mixed-Hodge-complex engines remain G4/G10/G11.
- [Pearlstein–Peters public preprint](https://www-fourier.univ-grenoble-alpes.fr/~peters/Articles/bisect_AG.pdf):
  Appendix A, printed pp.51–53 of the 57-page PDF;
  [André](https://www.numdam.org/item/CM_1992__82_1_1_0.pdf):
  §§2, 4, 5, pp.3–4, 8–11;
  [Milne's 2017 notes](https://www.jmilne.org/math/xnotes/svi.pdf?download=1):
  §2, pp.28–29, used with the supplier's general local-system contract;
  [Katz](https://web.math.princeton.edu/~nmk/old/algsoln.pdf):
  §§4.3.1.3–4.3.6, printed pp.68–71, including curve propagation.

E2 is confined to the determinant proof's numerical bound. A primitive cube
root has two conjugates and order three. An integral rank-two variation on
C* of type (0,0) can have monodromy
M=[[0,−1],[1,−1]] and invariant positive form
Q=[[2,−1],[−1,2]]. Direct integer calculation gives M³=I, M²≠I and
MᵀQM=Q; the positive principal minors are 2 and 3. Its complex eigenline
has determinant order three, so the rank-factorial exponent 2! fails.
This also disproves the claimed order-at-most-rank inference without any
OCR ambiguity. Bounded-degree polynomial finiteness proves the unchanged
finite-order conclusion. Title/locator-specific searches did not locate
an applicable published correction; this is new to this packet, with no
claim of novelty in the literature. The 1971 LNM erratum is a different source.

## Baseline, audit and ownership

Every actual statement and ambient context below was inspected at Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369 and Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. No citation was inferred from
its name. The two library pins remain unchanged.

| Module | Confirmed declarations and what is consumed |
| --- | --- |
| TauCeti/AlgebraicTopology/LocalCoefficient.lean | LocalCoefficientSystem, constantFunctor, pullback, transport, monodromyRepresentation; added basepointChangeEquiv, which intertwines actual native monodromy under path-based π₁ change |
| TauCeti/Geometry/Hodge/Structure.lean | HodgeStructureOn with supplied conjugation and opposed F^(n+1−p) |
| TauCeti/Geometry/Hodge/Mixed/Basic.lean | MixedHodgeStructure and gradedHodgeStructure: rational W, derived complex graded fibre and abstract base change, with no finite free lattice implicit |
| TauCeti/Geometry/Hodge/Mixed/Morphism.lean | Hom with one rational map and derived complexification; added Hom.gradedHom with the actual induced pure graded Hodge structures |
| TauCeti/Geometry/Hodge/Mixed/Strictness.lean | Hom.range_inf_F_eq_map_F and Hom.range_inf_WQ_eq_map_WQ, actual image/intersection equalities |
| TauCeti/Geometry/Hodge/Mixed/DeligneSplitting.lean | Added deligneSplitting and Hom.map_deligneSplitting_le for the native rational fibre branch |
| TauCeti/Geometry/Hodge/Mixed/Decomposition.lean | Added isInternal_deligneSplittingFamily, actual direct-sum decomposition of the complex native rational MHS fibre |
| Mathlib/RepresentationTheory/Invariants.lean | Representation.invariants and mem_invariants for arbitrary groups; no finite-group hypothesis |

The reviewed library audit has no HodgeStructuresPartII row. The relevant
parent Hodge L0–L3 rows were read in full. Native rational fibres, graded maps,
strictness and Deligne splitting are reused, while real/global generalizations
are stated separately. HodgeStructures, UniversalCovers and the requested
ReductiveGroups Layers 0, 1, 3, 4, 5 and 6 were read. The requests agree with
those upstream scopes, and no upstream document or layer was edited.

The thirteen exact cross-packet contracts inspected were the five H.0
connection/Griffiths/tensor/dual nodes, the three D3 variation/flat-bundle/
integral-polarization nodes, the two LPV monodromy nodes, and the three C3/C5
repair comparison nodes. Their precise statements support only their stated
scope. The constant-coefficient-only repair node was removed from the
nonconstant adapter. D3 and LPV suppliers have needs-changes reviews and C5
is a pending repair plan; they are not installed results. H.0 and the parent
have accepted planning reviews. No consumer H.6→H.2 reverse edge was added.

The dependency check followed exact node IDs recursively and stage requires
for requested-stage leaves, respecting the imported declarations rather than
collapsing their entire owner into a fictitious node. All 233 reachable
vertices are acyclic. This certifies the stated dependency graph, not the
completion of any stronger supplier request.

## Every node checked

All IDs in the table are prefixed by HodgeStructuresPartII:H.2/.
The packet review repeats these individual verdicts with their notes.

| Node | Verdict | Check / correction |
| --- | --- | --- |
| complex-pvhs | corrected | LL22 Definitions 4.1.1–4.1.2 pp.27–28 match smooth type decomposition, Hermitian sign and differential condition without a lattice. Added grading/form extensionality API and its point signature; global analytic carriers remain G1. |
| realification | corrected | Del87 §1.11 p.8 and Timm87 §7.1 pp.169–170 support conjugate doubling. Strengthened rank-one and already-real examples to inspect actual realification pieces/filtrations; arbitrary-real-model comparison remains G2. |
| mixed-variation | corrected | Corrected SZ85 Definitions 3.4–3.5 to p.508. Native rational mixed carrier/Hom require their actual derived complexification; real/global and two-filtration complex boundaries are explicit. |
| graded-variation | corrected | Added exact native Hom.gradedHom prerequisite and replaced its point wrapper placeholder by that existing construction. SZ85 Definition 3.4 p.508 supports the global graded pure variation. |
| graded-polarizable | corrected | Corrected SZ85 Definition 3.5 to p.508 and relabelled the use of Properties (3.13). Polarizations are on graded pieces only; flatness and coefficient positivity are stated. |
| admissible-disc | corrected | Corrected SZ85 Properties (3.13) pp.510–511 and Appendix A.9 p.541. Relative M is not inferred from nilpotence; required positive ramification degree in API/prototype and retained analytic finite-cover invariance as G5. |
| admissible-variation | verified | Peters Appendix A p.51 matches the all-curves test and explicit quasi-unipotent finite-cover convention. General real exponents and compactification/cover invariance remain G5/G6, without importing the H.6 consumer. |
| limit-mhs | verified | SZ85 Appendix A.8–A.9 pp.540–541 supplies the two-condition implication to a limit MHS and N of type (−1,−1), centred at each original weight. Its cited pure Schmid proof remains G4. |
| admissible-operations | corrected | SZ85 Appendix A.4/A.10 pp.537–541 supports tensor/dual/Hom closure. Added LPV.1 prerequisite and precise relative-filtration tensor/dual/functoriality request; neither nilpotence nor intrinsic Hodge tensor alone supplies this linear input. |
| canonical-extension | corrected | Added printed pp.91–96 locators and promoted unique horizontal comparison to its own consumed API lemma. Analytic existence has no quasi-unipotence requirement; algebraic realization retains regularity; general tensor correction is tested. |
| canonical-extension-unique | added | Added consumed API lemma from Del70 II.5.4 pp.94–95: extend identity horizontally in both directions and use unique map extension for inverse composites. Only its rank-one scalar prototype is represented. |
| extension-exact | corrected | Corrected nonexistent II.5.4(c) to the unnumbered functorial/exactness paragraph pp.94–95 and added canonical uniqueness prerequisite. Local generalized-eigenspace/subquotient construction gives exactness without tensor monoidality. |
| residue-monodromy | corrected | Added exact pp.91–95 and promoted uniqueness dependency. Horizontal z^(−A) continuation gives exp(−2πiA); unipotent logarithms are eN after positive ramification, and nonunipotent residues require integer normalization. |
| unipotent-tensor | corrected | Corrected to Del70 II.5.2(d) pp.92–93 and added canonical uniqueness dependency. Commuting tensor nilpotents and dual/Hom residues stay in the strip; residue-3/4 counterexample excludes arbitrary monodromy. |
| filtered-extension | verified | SZ85 Properties (3.13) pp.510–511 and §5.26 p.534 support the unipotent-disc filtration and exactness; quasi-unipotent descent and full SNC gluing are explicitly G5/G8. No arbitrary limiting flag is substituted. |
| log-comparison | corrected | Removed constant-coefficient-only C5 node as a direct supplier. Distinguished analytic logarithmic comparison from regular-singular algebraic comparison and added exact II.6.2/6.9–6.10 locators. Nonconstant sheaf/singular and full local proof remain requested/G7. |
| gauss-manin | corrected | Separated analytic relative logarithmic comparison from algebraic comparison with a supplied regular-singular realization; made base analytification explicit. Corrected Theorem 6.13/Proposition 6.14 pp.106–107; relative-SNC triviality and coherent hypercohomology strengthen C5/G7. |
| geometric-pure | corrected | Corrected Corollary 4.2.9(a) to p.48 while retaining §§4.1.1–4.1.2 pp.40–43. The geometric cohomological Hodge–Riemann/degeneration engine is G9, not falsely supplied by intrinsic fibre polarization. |
| unitary-curve-fiber | verified | Timm87 §§6–7 pp.166–170 matches weights 1/2 and real orthogonal versus arbitrary complex unitary coefficients. The 1986 harmonic-form input and mixed-Hodge-complex engine remain G10/G11. |
| unitary-curve-family | verified | LL24 Theorem 4.1.1 pp.24–25 gives the family log-hypercohomology and real mixed-Hodge-module proof; it is not derived just from the fibre theorem. The packet finite-cover corollary retains explicit quasi-unipotence and G6/G15. |
| unitary-bigrading | verified | LL24 Lemma 4.1.2 equations (4.1)–(4.2) p.25 matches the three Hodge components and comparison between coefficients V and conjugate/dual V. No self-conjugation is imposed on arbitrary V. |
| curve-cohomology-mhs | corrected | Corrected fixed part to SZ85 Proposition 4.19 p.517 and the pp.513–517 locator. The logarithmic weight correction, cohomological shift and boundary Tate terms are explicit; analytic cohomology engine and finite-cover descent remain gaps. |
| mixed-fixed-part | corrected | Corrected SZ85 Proposition 4.19 p.517 in source and proof. LL24 Theorem 4.2.1 p.26/André §5 and Katz §4.3.4.0 p.70 support curve propagation; functorial splitting is needed to propagate the global invariant sub-MHS, not just larger curve-invariant spaces. Added exact native rational Deligne splitting, functoriality and internal-direct-sum prerequisites; the real analogue remains requested. |
| complex-fixed-part | verified | Del87 §1.11 p.8 gives the printed realification/norm argument in the quasiprojective setting. The cited Schmid norm bounds and horizontal-component theorem remain G13; no lattice or quasi-unipotence is invented. |
| complex-semisimple | verified | Del87 §1.12 pp.8–9 explicitly separates Hodge-category and underlying complex-system semisimplicity; LL22 Proposition 4.1.4(1) p.28 gives the curve instance. The unprinted general-base Nori input remains G14. |
| isotypic-hodge | verified | Del87 §§1.13–1.14 pp.9–10 supports matrix-algebra grading lifts, homogeneous projectors and integer shift ambiguity. Exact RG1/RG4 contracts retain G_m→PGL lifting and do not duplicate native Schur theory. |
| irreducible-real-form | verified | LL24 equation (4.3)/Proposition 4.2.2 p.26 gives the real-form/doubled branch. A chosen involutive real structure is distinguished from quaternionic self-conjugacy; canonical doubling does not choose a real form of L itself. |
| irreducible-evaluation | verified | LL24 Proposition 4.2.2 p.26 gives a nonzero fixed-part mixed multiplicity and nonzero evaluation, not purity or surjectivity. The packet additional admissibility assumption on the chosen pure recipient correctly records the narrower finite-cover convention. |
| algebraic-monodromy | corrected | Corrected Del71 Corollary 4.2.9 to p.48; added exact native basepointChangeEquiv for intertwining, and promoted finite-cover API. Characteristic-zero closures/components and field/basepoint conventions are retained. |
| monodromy-finite-cover | added | Added consumed API lemma: supplied finite connected cover gives finite-index monodromy image; finite cosets of its closed subgroup cover the full closure, so geometric identity components agree. Cover classification is requested from UniversalCovers Stage 2; algebraic realization is not asserted here. |
| finite-determinant | corrected | Corrected to Del71 Corollary 4.2.8(iii)(b) pp.47–48. Replaced unnecessary π₁ finite generation and false rank-factorial bound by uniform bounded-degree integer-polynomial finiteness; added order-three rank-two counterexample and confirmed source issue E2. Exact arithmetic interfaces remain G16. |
| connected-semisimple | corrected | Added finite-cover API prerequisite and G19 for finite étale realization before applying finite determinant to connected-group constituents. Removed geometric-pure as an unnecessary input to the abstract theorem. The finite centre/faithful representation argument retains the lattice and G14/G16/G18. |
| mixed-monodromy | corrected | Replaced generic-Mumford–Tate normality with the precise connected subdirect-product radical proof; graded integral lattices are saturated quotients. Added RG3 image/component contract and Del71 Lemma 4.2.10 pp.48–49; removed unused mixed-fixed-part dependency. The graded kernel is normal unipotent and equals R_u in characteristic zero. |

## Validation and orchestration notes

Ran the blueprint checker with the shared pinned declaration index:
zero errors and warnings. Checked that every definition/construction has at
least three tests; all 57 API and 45 test names are present in the reader.
Every statement, hypothesis, proof step and direct prerequisite agrees with
the corrected packet. All 131 distinct proposed declaration/API/test names
are classified and present in the appropriate active or omitted suggested
section. The six planets are central named definitions/constructions/theorems,
within the six-per-stage limit.

Attempted lean-check on the final corrected suggested file with 112 GiB
available and no second local compile. It failed immediately at the missing
cached TauCeti.AlgebraicTopology.LocalCoefficient import. No type checking
occurred, and no library build, cache fetch or language server was started.
All 23 transitive Tau imports, including public imports, have identical source
bytes at the Tau pin and the shared source HEAD. Shared Mathlib is the exact
pin. These source checks do not substitute for full elaboration. The planner's
reported Mathlib-only probe was not independently repeated or used to certify
the corrected file.

For the orchestrator, the continuation needs exact routing of G9/G11/G15
(cohomological pure/mixed Hodge complexes and real mixed Hodge modules),
the complete analytic inputs G4/G10/G13/G14, and the G19 finite-étale
Riemann-existence contract from original ComplexComparison. E2 can supply
an errata job; it does not invalidate the finite-determinant theorem.
The detailed G1–G19 and supplier requests specify the remaining proof work.
This review requires no additional changes to the reviewed H.2 deliverables.
