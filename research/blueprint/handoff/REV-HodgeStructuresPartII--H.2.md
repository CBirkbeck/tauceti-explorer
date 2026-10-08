# REV-HodgeStructuresPartII--H.2 handoff

Issue #7026; Codex session codex-6zoSpY; 8 October 2026.
Input planner: Codex session codex-VKQBv5, BP-HodgeStructuresPartII--H.2,
issue #6939. This independent review is complete and accepts the corrected
conditional target-level pass. It claims no implementation.

The deliverables are the packet, reader, suggested file and independent report
for HodgeStructuresPartII--H.2. The packet contains 33 nodes (20 corrected,
11 verified, two added), 57 API items, 45 definition/construction tests,
six planets and 18 actual pinned baseline declarations. Every implementation
is unchecked. The packet is complete and H.2 is planned, with 19 explicit
gaps and 14 supplier requests; it is not closed. No second job was claimed.

## What the review established

All 31 original nodes, their proof boundaries, every original baseline and
all thirteen direct cross-packet supplier contracts were independently read.
All twelve public source PDFs were refetched, their SHA-256 hashes matched,
and the target locators/printed arguments were checked. The reader records
each public URL, exact version, hash and the read/unread boundary. No
non-public book or source passage is needed to resume.

Corrections include source locators and the Pearlstein–Peters 57-page edition;
regular-singular algebraic coefficient hypotheses distinct from analytic
comparison; removal of a constant-coefficient-only comparison dependency;
relative-filtration operations requested from LPV.1; and native rational
Deligne splitting/graded-morphism/basepoint-change APIs. Canonical uniqueness
and connected monodromy under finite covers are promoted consumed API lemmas.
The original names remain unchanged. Realification tests inspect its actual
constructor, positive disc-cover degree is required, and native gradedHom is
reused directly.

The determinant proof now uses bounded-degree algebraic-integral values
and unit-modulus conjugates to bound integer minimal-polynomial coefficients.
It needs neither finite generation of π₁ nor the printed rank-factorial bound.
Source issue E1 is confirmed against the entire April 1971 LNM erratum.
Source issue E2 is confirmed in Deligne, Théorie de Hodge II, p.48:
order at most rank and the rank-factorial exponent are false. The rank-two
order-three integral type-(0,0) example in the packet/reader/report disproves
both numerical claims. Finiteness with some positive common exponent still
follows. Limited locator-specific searches found no applicable published
correction, without any assertion of novelty in the literature.

Mixed monodromy uses saturated integral weight quotients and the explicit
subdirect-product proof: the connected solvable radical of the joint graded
closure projects trivially into each semisimple factor, so faithfulness kills
it. The normal graded kernel is connected unipotent in characteristic zero
and equals the unipotent radical. RG3/RG6 requests supply the precise image,
component and radical interfaces. Generic Mumford–Tate normality is no longer
an input to this proof.

## Where the next refinement starts

1. **G1–G3/G18:** install the global variation/coefficient/algebraic-group
   carriers and the exact LPV.1 tensor/dual/Hom relative-filtration operations.
   D3 and LPV supplier reviews need changes; exact node contracts are planning
   inputs, not implemented results. Native rational MHS, strictness, gradedHom
   and Deligne splitting already exist and must not be planned again.
2. **G4–G8:** read and close pure one-variable degeneration, Kashiwara all-curve
   and finite-cover invariance, the general real-exponent convention, local
   logarithmic comparison and full SNC filtered extension. H.6 consumes H.2;
   do not add a reverse prerequisite to close the pure analytic input.
3. **G9–G11/G15:** route the cohomological pure Hodge, unitary harmonic-form,
   mixed-Hodge-complex and real mixed-Hodge-module engines. Intrinsic Hodge L2
   does not supply cohomological mixed Hodge complexes. Timmerscheidt's cited
   1986 harmonic-form appendix and the Saito/Schnell proof inputs were not
   independently established by this pass.
4. **G12–G14:** supply curve-existence/analytic propagation, the complete
   general complex fixed-part analytic proof and the quasiprojective
   underlying-complex semisimplicity proof. For the rational fixed part, use
   the exact native functorial internal Deligne decomposition now cited;
   supply the real analogue separately.
5. **G16–G17:** verify the exact determinant arithmetic interfaces and the
   requested characteristic-zero subdirect-product radical/component facts.
   Do not restore the false numerical bound or unnecessary generic-MT proof.
6. **G19:** algebraize the finite-index connected-monodromy cover using the
   finite topological/étale Riemann-existence comparison. UniversalCovers
   Stage 2 handles its pointed topological subgroup correspondence. Original
   ComplexComparison PR196 Layers 8–12 own the algebraic comparison direction;
   no exact installed or atlas node was verified. Apply the algebraic-base
   finite-determinant theorem only after this realization.

The packet's requests and remaining list give the exact contracts and consumers.
The independent report contains a verdict and source/proof note for every node.
E2 can be routed to an errata job; the finite-determinant theorem remains valid.

## Validation and limitations

The packet checker with the shared pinned declaration index reports zero
errors and warnings. The reachable exact-node/stage-requires graph has 233
vertices and no cycles. All packet statements, hypotheses, proof steps,
prerequisites, API/tests, requests and gaps agree with the reader. All 131
proposed names are traced to 65 explicitly limited active prototypes/examples
or 66 exact omissions, without overlap.

The corrected exact suggested file was attempted with lean-check with 112 GiB
available. It stopped at the first missing cached object,
TauCeti.AlgebraicTopology.LocalCoefficient, before any type checking. The
full file did not compile; no build, cache fetch or Lean language server was
started. Shared Mathlib is exactly 082e2d37e8b0463410cdb532e111cd43d5a66174.
All 23 transitive Tau imports have identical source bytes at the Tau pin
f790474821cf4256814db967cb154e7af3d0c369 and the shared source HEAD
cf386627e9176a3827c1a5fe804989fd94a4d216. This source agreement is not an
elaboration certificate. The planner's Mathlib-only probe was not repeated
or relied upon by the reviewer. Resume elaboration with the exact suggested
file after the relevant Tau objects are available; keep its global omissions
until their actual supplier interfaces exist.

No scratch file is required by the next worker. The source receipts,
mathematical corrections, exact gaps and validation limitations are all in
the committed deliverables.
