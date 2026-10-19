# DESIGN-MetaplecticAutomorphicFormsPartII

Issue #3389. Worker: Codex, session `codex-H6KtQk`, 2026-10-19.
The bot confirmed the claim before work began. This is the complete target-level design pass, submitted for independent review; no mathematics is claimed implemented.

## Deliverables and coverage

The roadmap definition, packet, reader and suggested file all use `MetaplecticAutomorphicFormsPartII`, parent `MetaplecticAutomorphicForms`, area `automorphic`. The historical finite-route alias `FiniteWeilRepresentationsPartII` maps to this id. The issue permits independent directions to be separated: its first, finite branch is blueprinted here, and its theta branch has a concrete companion proposal in the packet and reader.

- 17 nodes: 8 constructions and 9 theorems; 31 named API items; 26 construction tests; 17 planets, at most five in a layer; 21 pinned baseline declarations.
- FW.0, finite symplectic coordinates: closed.
- FW.1, finite Heisenberg representations: closed.
- FW.2, genuine finite Weil actions: planned, with the original-normalization comparison below remaining.
- FW.3, parabolic restriction and isotropic induction: planned, with the original printed-hypothesis comparison below remaining.
- FW.4, fixed vectors and type-theoretic exports: closed for the explicitly specified normalization.
- Packet status: complete. One source-comparison gap; no supplier requests. Every implementation status is unchecked.

All five finite routed items have exact node assignments: Fintzen /27, /27a, /27b and Stevens /75, /170. All 78 independent theta items have unique assignments across SW.0–SW.8 of the proposed companion `MetaplecticAutomorphicFormsPartIIShimuraWaldspurger`: 70 Gan–Ichino, seven Ichino–Prasanna and one Gan–Savin. No item was discarded. The companion proposal preserves the reviewed routing corrections, including the stronger Proposition A.2 descent hypothesis, the nonsplit generic SO input and the Euler-product nonvanishing requirement. Its primary papers were not directly read for this finite-branch job: this is a design assignment for the next designer, not a completed theta blueprint.

## Mathematical choices and ownership

Import the parent's exact MP.0 bilinear-factor-set, half-form commutator/center, polarization-equivalence and isometry-action nodes. Its generic ring statements allow finite odd fields; its smooth characteristic-zero Stone–von Neumann theorem is not used as a finite theorem. The parent's MP.4 finite Weil representation is a discriminant-lattice Mp₂(Z) representation, so its carrier and formulas remain there.

Use native finite-group FDRep, induction, invariants, bilinear-form isometries and projective representation infrastructure. The current InductionRestriction and CharacterTheory roadmaps were read, and the current roadmap/library trees were screened, including the nine directions newer than the atlas snapshot. The current Tau Ceti main `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already contains the rank-one Heisenberg group in `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean`. Its plane coordinates match the parent specialization by `(t,x,y) ↦ (x,y,t+xy/2)`. This current-main comparison is separate from the pinned baseline and is not replanned.

The finite scope includes nonfaithful nontrivial characters over extension fields, cyclic centers of order pᵃ and exponent-p² Heisenberg quotients. It does not infer a standard exponent-p model from a nondegenerate pairing. The genuine symplectic action is constructed by parity determinants, including Sp₂(F₃), rather than by assuming perfectness. Transport requires an explicitly equivariant special isomorphism. The parabolic restriction retains the quadratic determinant twist. The mixed induced model uses representatives `(0,j)` and multiplier ψ(B(j,i)), fixing its sign.

No target moved down from a higher-tier roadmap. `SmoothRepresentationsPartII` is a consumer, not a prerequisite. It must supply its own finite quotients, nondegenerate pairings, equivariant special coordinates, isotropic subgroup lifts and action identifications. The companion proposal imports existing parent MP.3 local theta/similitude results, MP.5 theta integrals and MP.6 doubling/Rallis results instead of planning them again.

## Sources and remaining comparison

The packet records public URLs, exact editions, hashes, access dates and target locators; the reader states results in original prose. No source files, passages or private-library material are included.

Read directly:

- Fintzen, arXiv:1810.04198v2, §7, pp. 30–34, especially Lemmas 7.7, 7.8, 7.10 and p. 33 footnote 3.
- Stevens, arXiv:math/0607622v2, Proposition 3.5, p. 14; Lemma 5.6 and Corollary 5.7, pp. 29–31; Lemma 5.12, pp. 32–33.
- Neuhauser, Journal of Lie Theory 12 (2002), §§2–4, journal pp. 16–24: Lemma 2.1, Theorems 3.3, 4.1, 4.2, 4.3 and Example 4.4.
- Fintzen–Schwein, author manuscript dated April 15, 2025, odd-characteristic portions of §3.1, pp. 8–11; §3.3, pp. 14–16; §3.4, pp. 16–18, including Construction 3.4.2, Remark 3.4.3 and Definitions 3.4.4–3.4.5.

Not obtained: Gérardin, Journal of Algebra 46 (1977), 54–101, DOI 10.1016/0021-8693(77)90394-5; and Yu, JAMS 14 (2001), 579–622, DOI 10.1090/S0894-0347-01-00363-0. Publisher PDF access failed. Neither is represented as directly read. Neuhauser supplies an independent complete linearization argument, and the finite restriction is proved from explicit operators and finite Frobenius reciprocity.

The recorded gap is to compare the parity-determinant normalization with Gérardin's preferred choice in Sp₂(F₃), and to collate the corrected Theorem 2.4(b) formula with its original printed hypotheses. The plan specifies a genuine action and gives its proof without that comparison; literal identification with the original normalization remains unclaimed. An independent reviewer should settle the comparison if an authorized readable original becomes available, otherwise retain this precise gap and the FW.2/FW.3 follow-up scope.

Two source issues are recorded. E1 attributes the missing quadratic determinant twist in Gérardin Theorem 2.4(b) to Fintzen's existing correction, p. 33 footnote 3; it does not claim to have seen the original misprint. E2 records an undefined commutator variable in Fintzen–Schwein equation (3.3.3), p. 14: the second representative must be y. This was visually checked in the dated author PDF and also checked in arXiv:2501.18553v2; its scope is those versions. No separate author correction was located.

## Verification and next action

`lean-check` elaborated the 107-line suggested file at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, exit 0, with only seven placeholder-proof warnings. Its single data definition is real-bodied. It states three endpoints over existing carriers and four examples; the exhaustive heavy-construction statements, APIs and tests remain in the reader, with a per-node omission ledger in the packet. This follows the newer streamlined WORKERS.md requirement.

The blueprint checker reports zero errors and zero warnings against the pinned declaration index. The five-file intake check and the data-placeholder check pass. A scratch consistency audit checked the acyclic local dependency graph, reader/packet parity, all 83 routed item assignments, every construction's API/test counts, planet limits and Markdown table columns. Independent finite complex-matrix computations checked the complete SL₂(F₃) and SL₂(F₅) generator relations, Egorov signs, Fourier normalization, the nontrivial determinant factor and the transverse-intertwiner composite. These computations validate proposed examples, not formal proofs.

Next action is independent review of this complete pass, particularly source normalization and ownership. The maintainer can then apply the companion restructure and commission its design. There is no partial finite-plan worklist to resume. This worker takes no second job.
