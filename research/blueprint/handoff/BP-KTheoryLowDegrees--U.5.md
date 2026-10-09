# BP-KTheoryLowDegrees--U.5 handoff

Worker: Codex, session `codex-XBFh8y`. Issue: #7561. This is a complete bounded planning pass, not a checkpoint or a claim of implementation. Scope is exactly `KTheoryLowDegrees:U.5`; coverage is **planned**, with three explicit gaps and three supplier requests. All implementation statuses are `unchecked`.

## Completed specification

The packet has **32 nodes**: 3 constructions, 18 lemmas, 1 theorem and 10 comparisons. It has **18 API items**, **13 defining unit tests**, and **9 exact-pin Mathlib baseline citations**. It adds **0 planets**, retaining the parent's six U.5 planets. The packet, reader and suggested file share a named declaration/omission inventory.

The fine-node proof decomposition refines the existing parent `KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison`, which also realizes U.5. Keep that milestone id at assembly and use these prerequisites for its proof; do not introduce a second milestone or a second relative-group carrier. The parent definitions, degree-one and degree-zero exact sequences, transfers, norms, projection formulas and DVR valuation boundary are referenced by their existing ids.

The specified map is built from BGL(A,I)→fib(BGL(q))→fib(BGL(q)⁺). The acyclic plus fibres have Steinberg fundamental groups by UCE uniqueness. Iterated-fibre interchange and Steinberg reduction imply that the map is surjective with kernel E(A,I). The quotient isomorphism is therefore the descent of this actual map. The direct proof precedes the degree-one double-fibre consequence and makes no general K-theory excision assumption.

The degree-two boundary is the **inverse** lifted Steinberg word for the pinned β=(κ∘∂j)⁻¹ and paths f(x)→base. The square homotopy goes from the upper-then-right composite to the left-then-lower composite; the opposite fibre map uses its reversal. A signed prism contract and an integer sign test keep this convention explicit. Degree zero imports K.5's actual projective-triple and patching maps, with (pr,add) coordinates and row gluing pr(x)=add(y)a. Both connecting squares and the map to absolute K1 are specified.

## Remaining dependencies and where to resume

1. **R-St-quotient — K2SymbolsBrauer:T.1:classical.** Extend the existing stable Steinberg presentation API: surjectivity of St(q), its normal root kernel, the quotient equivalence and naturality. The packet gives the root-presentation proof. Its elementary image is then E(A,I).
2. **R-fibre-interchange — StableHomotopyKTheory:H.2.** Supply the natural equivalence of the two iterated fibres, its projection formulas and the signed reversed-prefix prism identity. The packet gives the path-square construction and a degree +1 S¹/ΩS² sign test. Existing homotopy-pullback/pasting nodes do not explicitly expose this contract.
3. **R-ring-model — GeneralAlgebraicKTheory:K.2:plus.** Strengthen the early plus/Q comparison to a coherent natural based weak equivalence on zero components, with the π1 fibre and π2 connecting-map interfaces. Objectwise products and a natural π0/π1 comparison do not suffice.

The current fine T.1 K2-definition has only stabilization as its prerequisite, so the parent's coarse stage-cycle warning is not treated as an unavoidable fine-node cycle. The proof imports classical T.1 UCE and early K.2:plus; it does not consume its own relative comparison or T.6's unproved relative-K2 homotopy comparison. Supplier and parent gaps remain owned by those packets, and this job does not certify their closure. The three new requests are proposals within existing directions under PROTOCOL §15; no supplier file was edited.

## Lean limits

**Not compiled.** No existing build with both Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` was found. Existing shared checkouts had a different Tau revision, or unverified Tau provenance. WORKERS.md permits elaboration only in an existing build at the pins; no project, build, dependency update, cache download or language server was created. No `lean-check` run is claimed.

The suggested file uses individual Mathlib imports and actual homomorphism/subgroup/quotient types. It prototypes **11 of 32 node signatures**, **11 of 18 API items**, and **1 of 13 defining tests**. It explicitly omits the other **21 node signatures**, **7 API items**, and **12 tests** because the required stable ring-group and plus/fibre K-space carriers are absent at the pin. Missing conditions are not replaced by proposition-valued fields. Three supplemental quotient examples compare the prototype with existing Mathlib descent and equivalence; they are not counted as the ring tests. Complete the omitted signatures/tests when the supplier types are available, then use `lean-check` in an eligible existing build. The abstract integer sign diagram is expressly not a ring Steinberg example.

## Source and audit provenance

Read the binding protocols, current roadmap, reviewed AUDIT-29, accepted parent and its latest review, all six link records touching this roadmap, relevant stage edges and exact supplier node statements. Read `content/tau-ceti/AlgebraicTopology/README.md` and `content/tau-ceti/GrothendieckEulerForms/README.md` in full. No private reference source was needed.

Read Weibel's combined author manuscript dated 29 August 2013, <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf>, on 9 October 2026. SHA-256: `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. The packet's `readSections` is the exact source-reading ledger: III.2.2–2.3 and Exercises 2.3–2.7; III.5.1–5.5.1, 5.7–5.8 and Exercises 5.1–5.2,5.10; IV.1.1–1.2,1.4–1.7.1,1.11–1.11.1 and Exercises 1.15–1.16; II.2.9–2.10 and Exercises 2.3–2.4,2.17. Locators throughout use printed pages, with physical PDF page = printed page +8.

Two author-copy misprints are recorded as E116 and E117: the triangular direction in Exercise III.5.2 and the coefficient group in III.5.3's central-extension classification. The subsequent discussion uses the correct coefficient. The author's linked errata returned HTTP 404 on both attempted Rutgers hostnames; no separate published correction was verified. The published edition was not read and is not accused of those misprints. Parent E113/E114 and supplier E2 are retained by reference. No source passage, source file or extracted source text is included in the repository.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--U.5.json`: **0 errors, 0 warnings**, with the shared pinned declaration index.
- Exact mathematical statement/API/test/name agreement between packet and reader was checked. Typed/omitted name inventory in the Lean file was checked; this is a textual consistency check, not elaboration.
- All new prerequisite chains end in exact-pin group APIs, existing supplier nodes, the three explicit requests or their recorded gaps. Imports and preserved target ids were checked against the parent.
- Only the four authorized deliverables are changed. No baseline, source, supplier packet, application, atlas or queue file is changed.

No source mathematics is unassigned within this planning pass. The follow-up work is exactly the three supplier contracts and the unexpressible Lean signatures/tests, with inherited implementation dependencies kept visible. No second issue was claimed.
