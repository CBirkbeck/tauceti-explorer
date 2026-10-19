# Handoff: independent review of numerical Picard groups and contraction descent

Issue #3490; job `REV-DESIGN-AlgebraicModuliForArithmeticGeometryPartII`; Codex session `codex-91DSZv`; 2026-10-19. This is a finished independent review, not a checkpoint. Exactly one issue was claimed.

The packet is accepted as a complete target-level pass. There are 51 nodes (25 verified, 25 corrected, one added), 103 API items, 71 named tests, 28 planets, 12 pinned declarations, 18 requests and seven explicit gaps. All six layers are planned in the sense of PROTOCOL §0, with gap endpoints recorded; none is closed. The independent review report and each node's `review.checked` entry explain the corrections. The reader and suggested file agree with the corrected packet.

Validation: packet checker zero errors/warnings; `git diff --check` clean; suggested Lean elaborates at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, exit 0, exactly six `sorry` warnings and no other warnings. Suggested file: 282 lines, real data bodies. No library builds or servers were started.

## Work that remains for later jobs

- G1: register an exact supplier for finite H²_et(X, μ_ℓ) for arbitrary proper X over an algebraically closed field, ℓ invertible. The CohomologicalPointCounting reference is not a registered target; a curve-only result does not suffice.
- G2: supply the projective-cover/stratification argument for relative numerical finite-dimensionality, separating reduced geometric components. A single Euler polynomial fails on P¹ ⊔ P¹ with O(1) ⊔ O(−1).
- G3: prove/source the arbitrary proper extension of the nef-and-big numerical criterion. The imported SF.5/Keel case is projective; the specialization theorem only needs that case.
- G4: obtain the proof and exact prerequisites for arbitrary proper Picard representability and its finite-type comparison. Kleiman 4.18.3/4.18.5 states them but refers the deep proof elsewhere. Existing projective/geometrically integral contracts do not prove this.
- G5: extend parent R09.2 from projective Hilbert schemes to the proper Hilbert algebraic space, locally of finite presentation, and tangent Hom(I_C,O_C). Exact sources: Stacks 99.9.4 (0CZX), 99.7.10 (0CZV). The new node depends explicitly on this extension.
- G6: supply high-dimensional vertical negativity and the required cuts in CT20 Lemma 2.17's excellent generality. The surface Zariski matrix theorem does not by itself justify them.
- G7: prove the relative positive-characteristic AHK-rank comparison used by HW23. The checked source theorem here is complex projective; merely having resolutions is insufficient.

## Mathematical corrections to preserve

Negative-curve descent is the new target `NP.4/negative-curve-descent` (`addedBy` is this review). For a reduced integral C on a smooth proper surface over an algebraically closed extension with C²<0, the Hilbert tangent H⁰(C,O_C(C)) vanishes. The Hilbert space is étale at that point, so C is defined over a finite separable extension. Constant Num forces all conjugates equal, because distinct curves have nonnegative mutual intersection while numerical equality would give C²<0. Descent then gives a geometrically integral k-curve. For reducible contraction fibres this also forces the image point to be closed and k-rational. Ordinary ambient Cartier base change proves the edge-label equality; the prior q-versus-q² scaling argument for reduced fibre components was invalid. The irreducible case has no edges. Do not restore that scaling argument.

The exact-lift example is E: y²+y=x³−x²−10x−20, Cremona 11a1 / LMFDB 11.a2 over Z_(7). E(Q)=Z/5, while E(F₇) has ten points (nine affine plus infinity). A degree-zero special class outside the image does not lift exactly, although it has a numerical lift. Every such special class is torsion, so this example does not obstruct every positive power. HW23 v2 pp. 33–34 already uses numerical equivalence: source finding E9 is rejected. Ask its extraction owner to correct the inherited accusation.

Source findings E1–E8 were confirmed, with revised repairs; E10 (Schröer p. 8, reversed Leray edge) and E11 (AHK p. 4, hyperplane-count sign) were added. Ten findings are confirmed and one rejected. No source passage was copied into the deliverables. Public source URLs, hashes and read locators remain in the packet; EGA IV₃ was read in the maintainer-cleared copy, without copying it or its passages.

## Ownership and coordination

Current upstream at `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked separately from the pins. Import curve degree from StableReduction J-A2/JacobianChallenge A and SF.3; current Tau Ceti already has Euler-degree and restricted comparison/additivity declarations. Import the existing matrix inequalities rather than restoring the removed suggested theorems. General relative Spec belongs to AlgebraicVectorBundles L1A–L1B. That roadmap is absent from the atlas stage registry; the packet records its public contract, while SF.4/stein-factorization supplies the registered specific affinization prerequisite. Register the current upstream layers during a refresh.

The stable-surface split (14 routed items) and mixed-characteristic MMP rescope (seven item IDs) are retained proposals only. Their numerical consumers must import this Part II, with its gaps understood. No restructuring or queue state was applied by this review. The source and baseline audit, detailed corrections, counts, and precise orchestrator decisions are durable in the review report; no later worker needs the disposable scratch directory.
