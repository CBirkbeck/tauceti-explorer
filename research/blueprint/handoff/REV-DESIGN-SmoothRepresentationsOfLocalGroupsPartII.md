# Handoff: REV-DESIGN-SmoothRepresentationsOfLocalGroupsPartII

Codex session codex-3Rl9BT, issue #3616, 2026-10-18. This is a completed independent review, not a checkpoint. The review accepts the corrected **partial** packet. All 87 nodes have an individual verdict (53 verified, 34 corrected), all 32 baseline declarations are confirmed, and the reader and suggested file are aligned. No nodes were added. The detailed review is in `research/blueprint/reviews/REV-DESIGN-SmoothRepresentationsOfLocalGroupsPartII.md`; each correction and locator is in `review.checked`, and exact declaration scope is in `baseline.declarations`.

The packet has 12 explicit gaps. SRU.0 is planned; SRU.1–SRU.7 are partial. Do not present acceptance as proof closure. The next planning job should address these recorded inputs:

1. Godement's positive-L¹ functional theorem and its integrated-GNS comparison (SRU.1).
2. Type-I product classification and Fell-topology compatibility for the finite-product isolation application (SRU.1).
3. Bernstein's PI C*-algebra admissibility argument (SRU.2; retained gap).
4. Miličić's bounded-trace C*-algebra/global finite-character theorem (SRU.3; retained gap).
5. Finite-level local topology of the tempered dual for discrete-series isolation (SRU.3).
6. Finite Steinberg's Solomon/Coxeter alternating-character identity and Rodier's constituent/exponent combinatorics (SRU.4).
7. Full Howe–Moore contraction/Mautner propagation, in arbitrary local-field characteristic (SRU.4).
8. Hecke signatures, genericity/sign transport, actual companion isogenies and characteristic-independent adapters (SRU.5–SRU.6).
9. The corrected Aubert resolution and its characteristic extension, plus the KL component-group refinements for arbitrary isogeny (SRU.7).
10. Nilpotent-orbit/sl₂-triple/centraliser tables, owned by LieHighestWeightPartII #3373 (SRU.7; retained gap).
11. Equivariant K-theory/Steinberg-variety proof of KL classification (SRU.7; retained gap).
12. Full classification with a noncentral compact Satake part, using the correct compact-part centraliser (SRU.5–SRU.7; retained gap).

The seven newly added entries are 1, 2, 5, 6, 7, 8 and 9. Ownership must not duplicate existing TauCetiRoadmap work. In particular import OperatorTheory/PolarDecomposition Part B PD-B24–B36 from current main; it supplies the polar step missing from the old GNS domination proof. Current additive GNS is abelian only; current finite-dimensional Schur is not Hilbert Schur. Preserve the NQS M0 supplier and the existing kernel/Kolmogorov imports.

Source follow-ups: CH26 findings were verified on arXiv:2311.15300v1, not collated with the published Annals revision. Aubert's full §2–3 and 1996 erratum were inaccessible. Public §1 OCR and Ban02 Theorem 3.1, p. 678, independently support the endpoint, with the erratum listed on p. 692; they do not close the corrected-proof gap. Source URLs, locators and provenance are in the packet. Scratch contains no information needed beyond these deliverables and is removed after submission.

Keep these corrections through packaging: the split companion of PSU(2n+1) is Sp(2n); simplified KL criteria assume split adjoint G; U₀ᵍ describes the real slice, not all real parts with arbitrary compact part; regular nilpotent strata retain central compact twists; positive-characteristic G/G⁺ need not be finite; convergence of Bernstein parameters does not itself prove finite-family control. The existing source issues and all seven referenced extraction findings carry independent verdicts.

Validation: packet checker reports zero errors/warnings; the 454-line suggested file elaborates with only theorem `sorry` warnings using `lean-check`; the sorry-data check passes. No claims of completed proofs are made. The review job needs no second claim or further work once its PR passes the submission check.
