# Handoff: REV-AutomorphicGaloisRepresentations

Codex session `codex-BsbIeh`, issue #360, 2026-10-07. **The independent review is complete; verdict `needs_changes`.** This is a complete review submission, not a checkpoint. The reviewer did not author the input (`c43ce3ad`, PR #6790). Do not resume this session by claiming another job.

## What is done

All61 target-level nodes, all13 pinned baseline declarations, the source anchors/versions/three source issues, all15 definition/construction APIs and tests, planets, reviewed library audit and all ten assigned red-team IDs (including both IHG suppliers) were independently checked. The report records every node verdict and the clear corrections:27 verified,28 corrected,6 unverifiable; no nodes added or removed. The packet has43 supplier requests,13 explicit gaps,86 API specifications,63 tests and25 planets. All implementation statuses remain `unchecked`.

The packet and suggested file were corrected in place. The suggested file uses genuine available algebraic carriers, adds finite-group API/fibre and characteristic-two recognition tests, and reproduces all61 corrected specifications. The packet checker passes; Lean elaborates at the pinned Mathlib with only21 `sorry` warnings. Exact pins and verification limits are in the review report. The reader was assessed but left unchanged because issue360 does not authorize editing it. Its original catalogue mechanically matched the original packet, so a revision must propagate every correction.

## Where the revision should start

Read `research/blueprint/reviews/REV-AutomorphicGaloisRepresentations.md`, the packet’s `review.checked`, `coverage.remaining`, `gaps` and supplier `requests`. Six targets are still unverifiable:

- R19.2/all-cohomological-hilbert-representation
- R19.2/hilbert-uniqueness-determinant-oddness-irreducibility
- R19.3/fixed-eigenform-compatible-family
- R19.4/all-hilbert-local-global-compatibility
- R19.5/kisin-hilbert-coefficient-prime
- R19.5/skinner-full-hilbert-coefficient-prime

Specify one global Hilbert representation and prove the source adapters. For the same localπ, Carayol uses σ_C=Rec(π⊗|·|^(1/2))∨, while Skinner uses ρ_S=Rec(π⊗|·|^(−1/2))=σ_C∨⊗|·|^(−1). A dual alone is insufficient. Check infinity/central characters, coefficient embeddings, inverse versus positive uniformizers, Hecke operators, dual coefficient sheaves and Poincaré duality. Carayol0.4–0.5/§3, Saito pp.9/14/18, Kisin§4.3 and Skinner equation(1) give the exact places to resume. Recompute determinant, Hodge degrees, conductor and local factors under the chosen dictionary. The local source theorems themselves are not being rejected; the packet’s identification of their objects is unverified.

Saito Theorem2 only supplies geometric purity for g>1, w≥kτ≥2 with matching parity and a finite discrete-series place in even degree. The broader fixed-family target needs additional classical/all-Hilbert purity. R34.6’s restricted Hilbert export is reviewed `needs_changes` and imports a retired R06.6 modular application; resolve ownership without a circular R19 dependency. Its generic arithmetic-realization transport is already an exact edge.

## Remaining source and family inputs

1. Classical all-weight absolute irreducibility: DFG Lemma5.7 is rank/pairing; DDT3.1(c) is weight two. Obtain an independent all-weight theorem/proof, avoiding the later-Hilbert construction cycle.
2. Classical all-weight/small-prime p-adic comparison: the g>1 Hilbert Saito paper cites older classical work; restricted integral Fontaine–Laffaille comparison plus λ-adic existence is insufficient. Obtain the exact classical comparison input.
3. Non-normal-cubic transfer: the accepted R17.4 node is weak almost-all Satake compatibility. Carayol12.2.2 needs a chosen-place local assertion. Both the exact weak node and stronger request are recorded.
4. Skinner remaining coefficient-prime branch: R17.4/adjoint-lift is now exact. Identify GL3 PEL Galois/comparison (AG2.1b/AG2.6), Wintenberger lifting, Buzzard’s group-specific overconvergent family, Kisin Frobenius-period continuation and the eigenline argument. Generic comparison or family gluing alone does not supply these.
5. Integral quaternionic family line: KW Lemma7.2 gives triangular eigenform specializations, not a finite-projective integral family flag. The unsupported family conclusion was removed from node36; prove the full functor condition in node60, including nilpotent/finite quotients. An O-flat ideal descends only after vanishing on the whole generic algebra, not just field points.
6. Remaining Taylor auxiliary-new, bad-reduction/Picard–Lefschetz, Momose and higher-weight/Hilbert generic rank-two-module source refinements are listed precisely in the gaps.

Upstream ModularForms layer8 already includes sublayer8W for the Deligne–Serre2.7 weight-one integral-all-cusps lattice, independently of the Artin construction. Layer8G owns conjugate eigensystems. These have exact import edges and are not to be replanned in R15.2; the k≥2 modular-symbol route is a different branch.

## Reader synchronization and source corrections

Propagate corrected statements/hypotheses/API/tests and direct edges for the28 corrected nodes, plus node51’s imports/proof gap; synchronize partial coverage, all43 requests, all13 gaps and source-issue qualifications. In particular retain rational λ-adic factors at every λ, torsion-qualified integral lattices, characteristic-polynomial residual recognition, KW compact-mod-centre/p=2 and coefficient/central-action hypotheses, Scholl k≥3 versus Jacobian k=2, and rationalized Wach comparison `(N(T)/π)[1/p] ≅ D_cris(T[1/p])`.

Correct locators: Carayol0.8 p.411; Chenevier2.22(i) p.34; NT26 Lemma5.7 p.41; NT21b Theorem3.1 proof p.26. The unrelated NT21 Ribet citation was removed. E1–E3 are confirmed with precise version limits; the DFG2004 publication differs structurally from arXivv2, and the published KW bibliography was not inspected.

No scratch file or private path is needed to resume: public URLs, hashes, source read-depth limits, verdicts and actionable requests are preserved in the packet and report. Revision should receive a fresh independent review after these tasks are finished. R19.1 and R19.6 remain planned; R19.2–R19.5 and the packet are partial because of unverified targets, not because ordinary honest proof refinements are forbidden.
