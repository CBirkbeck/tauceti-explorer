# DESIGN-AREA-SymplecticContactGeometry — contact/Reeb foundation

Issue #3071. Agent: ChatGPT Pro (GPT-6 Astra Pro).
Session `gpt-20260926-c4e7b2`; publication date 27 September 2026.
Claim `5850886780`; bot confirmation `5850888115`, both re-read in the live thread.
Branch `gpt-20260926-c4e7b2-3071-contact`.

## Status and deliverables

**Partial new-roadmap design and pointwise proof specification.** No stage is closed and no Lean implementation is claimed. The new roadmap has eight stages, SC.0–SC.7, ending in regular reduction, Hamiltonian torus convexity and Delzant's equivariant symplectic classification. The packet gives declaration-sized nodes for SC.0; every other stage has a precise remaining-work record.

All five allowed issue files are supplied: roadmap definition, packet, reader, suggested Lean file and this handoff. Each path was absent on first inspection, and no integrated decomposition for this ID was found. No data, content, application code, other packet or queue file is modified. This continues the maintainer's request to take newly added number-theory or geometry designs; it is a geometry task, not a return to the older prismatic checkpoint.

## Mathematical content

The prefix uses the existing real vector spaces, duals, kernel submodules, bilinear forms and TauCeti.SymplecticForm. Contact data means a nonzero covector alpha and an alternating beta whose restriction to ker(alpha) is nondegenerate. This is explicitly pointwise: a manifold instantiation must identify beta with the actual exterior derivative of its smooth alpha.

The Reeb vector is constructed, not included among the hypotheses. Choose a transverse vector normalized by alpha, use the existing finite-dimensional BilinForm.toDual on the horizontal kernel to remove its horizontal pairing, and prove uniqueness by nondegeneracy. The generic covector solver is baseline material and is only a reuse example, never a new node. The resulting projection and splitting are actual linear maps and an actual linear equivalence.

For rescaling, the new exterior data are c beta+ell wedge alpha, where in a smooth application c=f(x) and ell=df_x. The new Reeb vector is

    r_prime = c^(-1) r + c^(-2) Z,
    beta(Z,w)=ell(w) on ker(alpha).

The proof checks normalization and annihilation first on the horizontal subspace, then on all vectors by alternation. It does not discard the derivative term. For alpha=dz-p dq and f=exp(q), at the origin the new vector is partial_z-partial_p. The formula r/f alone fails.

The prefix also constructs the pointwise symplectization form on R times V, with pairing beta(v,w)+s alpha(w)-t alpha(v), and proves its nondegeneracy directly. The proof does not need finite-dimensionality or a Reeb vector. Linear-coordinate pullback preserves contact data, and in finite dimension transports the Reeb vector by the inverse equivalence.

The smooth contact-form, Reeb-field and exact symplectization constructions remain SC.1 obligations. Neither a pointwise pair nor the derivative of a constant one-form is treated as a substitute for them.

## Ownership and global target precision

The existing HeegaardFloer F2.1 stage supplies the common symplectic/Darboux–Moser direction; its analytic and exact Floer lanes retain Maslov theory, holomorphic curves and the Floer complexes. GeometricTopology supplies generic smooth and tubular-neighbourhood infrastructure. LieGroups supplies the Lie algebra, exponential and adjoint/coadjoint interfaces. Four precise requests name the exact inspected stage IDs.

Two additional generic gaps are not hidden: a closed-subgroup theorem does not construct the quotient of an arbitrary manifold by a free compact action, and isolated-point Morse theory does not supply the Morse–Bott critical-submanifold handle argument. The restructure note asks for a finer existing supplier or a genuine Part II extension in the owning direction; no new supplier ID or accepted rescoping decision is fabricated.

The contact branch keeps coorientation, nonconstant conformal rescaling and compact/support/completeness hypotheses. Gray stability is not upgraded to strict preservation of contact forms. The Hamiltonian branch fixes contraction i_XH omega=dH and period lattice 2 pi Z^n, including the corresponding negative standard-circle moment. Regular free manifold reduction is distinguished from locally free and singular reduction.

Delzant classification fixes the torus, lattice and moment map. Real support constants are permitted; the vertices are not required to be integral. Translation and integral torus reidentification are explicit data changes. Theorem 2.1 in the original paper first gives the equivariant smooth comparison; its footnote sends the symplectic upgrade to Proposition 4.1. Both proof phases remain required. The roadmap does not stop at a diffeomorphism or count the existence-only discussion in Cannas da Silva as a uniqueness proof.

## Inventory and prototype

The packet contains **20 nodes: 1 definition, 6 constructions, 10 lemmas and 3 theorems; 21 API items; 21 definition/construction tests; 3 planets; 12 baseline references; 8 source records; 4 requests and 4 gap records; 8 stages and 0 closed stages**.

Five named API items are also node lemmas, so the suggested file has **36 named declarations**. Its **25 examples** comprise the 21 definition tests, three theorem-level regressions and one direct baseline duality-reuse example. Data-bearing definitions give the actual predicate, maps and forms; proof placeholders do not store any desired geometric conclusion as a hypothesis.

**Lean was not compiled.** No Lean/Lake executable or pinned local build was available. The signatures still require elaboration, including the restricted-form dual, product/kernel coercions and proof transport under rescaling and pullback. The exact pointwise statements, rather than opaque manifolds or assumed Reeb fields, are the starting interfaces.

## Source evidence and limits

Pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, confirmed against the current baseline file.

Read the worker, blueprint, expansion, browser and upstream instructions, the complete issue and its confirmed claim, and the neighbouring HeegaardFloer, GeometricTopology and LieGroups descriptions. The oversized aggregate library audit returned empty content; a scoped PDE audit excerpt only supported the shared analytic context and is not treated as an accepted contact audit. Targeted code and open-PR searches are not a fresh exhaustive absence certificate.

The twelve baseline declarations were inspected at the exact pins in four files. Their statements, parameters and proof/construction passages, including the existing inverse-dual equivalence, are recorded with Git blobs in the packet. The separate pinned manifold TwoForm file was also inspected: it supplies fiberwise nondegeneracy and explicitly omits exterior derivative/closedness. No smooth contact API is inferred merely from its filename.

Primary mathematical sources are Cannas da Silva's author-hosted January 2006 revision, Geiges arXiv v2, and Delzant's 1988 paper. The packet records the exact passages read. Cannas da Silva's cover and relevant pp.58,63,64,145 were visually inspected. Other passages were parsed-only where screenshots failed. Geiges and Delzant images were not successfully inspected; the Delzant page-image attempt failed with a cache error. No new PDF-byte hash, publisher-edition comparison or full-book/full-paper certification is claimed.

The pointwise proofs, rescaling correction and exact regression examples are authored deductions from the specified definitions. No novelty claim, source-error allegation, errata record or author communication is made. The neighbourhood proofs, generic quotient, Morse–Bott input, complete toric construction and Delzant Proposition 4.1 still need detailed source decomposition.

## Checks actually performed

Local independent structural checks passed for JSON syntax; unique roadmap, stage, node, baseline and source IDs; the exact eight-stage scope; required fields; all local-node and baseline prerequisite resolutions; the twenty-node DAG and new-roadmap stage DAG; source-reference fields; planet limits; and exact declaration/API/test-name correspondence with the suggested file and reader. They are not the full-repository validator or the global atlas-DAG checker.

The exact rational regression suite uses SymPy with deterministic seed 3071, in dimensions 1, 3, 5 and 7. It passed on 24 rational changes of the transverse-line model and 288 first-order rescalings, including negative and fractional factors. Checks solve the normalized Reeb linear system independently, verify the horizontal kernel, projection/splitting inverse identities, form recovery, rescaled nondegeneracy, rescaling product rule and symplectization sign/nondegeneracy. In 214 tested nonzero horizontal-gradient cases the naive r/c formula is explicitly rejected. The concrete standard-contact sign, one-dimensional and zero-covector/form boundaries also pass. There were 1,831 assertions; these are regression examples, not a proof for every real vector space or a smooth-manifold verification.

Publication condenses the roadmap readme and repeated packet metadata from the locally checked drafts while retaining the stage targets, twenty-node mathematics and declaration/API/test inventory. The reader and prototype uploads were checked against their complete local Git blob hashes. Observed published blobs are:

- roadmap definition: `ad5a26e0cf3c32c1e5fd4cf28f2b34f627845b93`;
- packet: `1a9a85f768c12ad26f50394ff4b7bcae52d6fff0`;
- reader: `53be06b1ca625e5f50f8ea531fc9e92666c130e0` — exact local match;
- suggested Lean: `47d335406d6cbddcc90bb7e67462c68d7f1926b0` — exact local match.

The actual published packet must pass current-head repository submission validation. Its observed result is recorded in the PR conversation, not inferred from local draft checks or any preceding PR. No pinned Lean compilation, full local repository check or full-atlas cycle test is claimed.

## Exact continuation

Elaborate and reconcile the pointwise prefix first. Then close the actual smooth exterior-derivative, kernel-bundle and smooth inverse interfaces with the common symplectic owner, and instantiate them to obtain the smooth Reeb field and exact symplectization. Preserve the distinction between a pointwise pair and a genuine first jet of a contact form.

Source-decompose the contact and Lagrangian neighbourhood proofs with their compact boundaryless and support hypotheses. For the independent Hamiltonian branch, verify the sign/period adapters and assign the genuine smooth quotient and Morse–Bott suppliers before closing reduction and convexity. Complete the toric construction and the separate symplectic uniqueness upgrade. Each of SC.1–SC.7 has its explicit worklist in the packet; none is marked complete by this checkpoint.
