# Independent review: twisted automorphic descents

**Verdict: accepted as a complete target-level planning pass, after correction.** All eight stages are planned; none is closed or implemented. The eleven proof/source gaps and eleven supplier requests remain explicit. Acceptance certifies the scoped plan and its recorded obligations, not the missing analytic, classification or descent proofs.

Job: `REV-DESIGN-TwistedAutomorphicDescents`, issue #3623. Reviewer: Codex, session `codex-DJsfda`, 19 October 2026. The input design was written by a different session, `codex-xxzA26`, and submitted in #10649. The packet contains an individual verdict and explanation for every node and an independent verdict for every source issue.

## Inventory and checks

| Item | Reviewed result |
| --- | --- |
| Nodes | 49: 12 definitions, 5 constructions, 28 theorems, 4 comparisons |
| Node verdicts | 35 verified, 14 corrected; no added or unverifiable nodes |
| Definition/construction API | 56 items across 17 objects; every object has at least three items |
| Mathematical unit checks | 51; every definition/construction has at least three |
| Atlas planets | 37; no layer exceeds six |
| Pinned declarations | All six confirmed; none removed or replaced |
| Routed coverage | All 60 input items map to targets |
| Open contracts | 11 gaps, 11 requests, 4 restructuring proposals |
| Coverage | 8 planned stages, 0 closed stages |
| Suggested Lean | 92 lines; 2 real-bodied light definitions, 9 proposed theorem statements, 6 executable examples |

`python3 scripts/check_blueprint.py research/blueprint/packets/TwistedAutomorphicDescents.json` passes with **zero errors and zero warnings**. The local prerequisite graph is acyclic. Coverage lists were recomputed after adding direct dependencies and exposing the unitary convention gap in TAD.3.

`lean-check research/blueprint/suggested/TwistedAutomorphicDescents.lean` exits successfully at the pinned shared build, with only nine expected `sorry` warnings. All six examples are proved by computation. No automorphic carrier is imitated by a placeholder, no data definition is admitted, and no additional Lean development was introduced. The available memory check passed before elaboration.

## Source verification and substantive correction

The main source is the [published Jiang–Zhang article](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p02-s.pdf), *Annals of Mathematics* 191 (2020), 739–827, revised 26 November 2019. Its SHA-256 agrees with the design's recorded version. I checked each node's locator, statement and source match, including the routed proofs and the two appendices. References to unread originals remain proof obligations. No passage from a source is reproduced here or added to the inputs.

The principal correction concerns **rendered equations (4.47), p.780, and (5.13), p.787**. Text extraction loses some overbars. The former has the conjugate of π in its tensor numerator; the latter prints π without conjugation. For unitary π, its complex conjugate identifies with its ordinary contragredient. Accordingly:

- The planned ratio ℒ now follows (4.47), with numerator L(s+1/2,τ×φ_π∨).
- The distinct candidate printed in (5.13) is recorded as ℒ¹³, with numerator L(s+1/2,τ×φ_π).
- The full self-pair pole choice is τ=BC(π) for ℒ and τ=BC(π)∨ for ℒ¹³. The normalized-holomorphy and reciprocity targets now state the choice belonging to their actual ratio.
- The definition's API includes dual-argument transport, and its character test distinguishes χ×χ∨ from χ×χ for a nonquadratic U₁ character. Orthogonal standard self-duality does not justify identifying the two unitary formulas.

Rendered (5.6), p.785, and Theorem 5.3, p.786, **already conjugate the second argument inside Hermitian brackets**. Their periods are therefore bilinear in the original forms. I narrowed E4 and G1 accordingly: the defect is not a wholesale absence of conjugation in those periods. The two printed ratios, the induction/central-factor transport in §5.5, p.791, the actual radical representation, and the parameter of the Fourier-image output still require a commuting comparison. Correcting one numerator does not prove unitary recovery. All dependent claims retain G1 explicitly.

A later public source was also checked: [Lei Zhang's note on the 2022 RIMS talk](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/2230-10.pdf). Theorem 1.1, PDF pp.2–3, states an unramified formula; Proposition 2.1, p.4, states nonarchimedean analytic properties. The comparison strategy in §§3–5, pp.4–7, uses descent integrals and Whittaker–Shintani functions, but defers notation and calculations. It is now supplementary evidence for the spherical target and a concrete lead for G4. It does not supply the full all-place proof or settle G1. E5 means that the general proof is deferred in the 2020 article, not that no later work can exist.

For E10 I also checked [Cogdell–Kim–Piatetski-Shapiro–Shahidi, *Publ. Math. IHÉS* 99 (2004)](https://www.numdam.org/article/PMIHES_2004__99__163_0.pdf), Theorem 11.1, p.225, against its split-classical scope. Its nonarchimedean, globally generic component theorem does not alone supply every archimedean, unitary and inner-form case required by Appendix B. Nonvanishing of an operator composition also needs more than nonvanishing of its individual factors.

All twelve source issues have qualified **confirmed** verdicts. E1–E3, E6–E8 and E12 were checked by the displayed rank, quadratic-value, central-scalar, dimension, weight-count and matrix-sign calculations. E9 was checked by typed block multiplication on rendered pp.813–814: if C is the upper-right coefficient before g*, the vector-fixing equation contains C E₂=(I−g)E₁+YY′E₂. Eliminating that term on a specified slice remains G5. E5, E10 and E11 are missing-proof or scope obligations; they are not asserted counterexamples to the published final theorems.

## Other corrections

The fourteen corrected nodes are `bessel-partition`, `stabilizer-witt-index`, `bessel-module`, `first-occurrence`, `standard-ratio`, `spherical-calculation`, `tempered-factors`, `local-nonvanishing`, `pairing-dictionary`, `leading-residue`, `normalized-holomorphy`, `reciprocity`, `critical-index`, and `twisted-descent`.

1. The index-zero partition test now says that the **stabilizer's defining space** has dimension two. The algebraic groups SO₂ and U₂ have dimensions one and four respectively.
2. The partition API separates sum and cardinality and uses the proposed Lean names. The critical-index API names likewise match its three represented signatures. The remaining two arithmetic signatures are useful supplementary API, not additional heavy targets.
3. The leading-residue construction now directly imports `AS.0/operator-meromorphic`, whose common-denominator regularization supplies continuous Laurent-coefficient operators. The existing `AS.2/residue-calculus` does not by itself identify an order-r one-variable coefficient with successive residues.
4. Locators now point to (2.13)–(2.14), rather than nonexistent (2.15)–(2.16) in that subsection; to the descent definition (6.9), p.802; to diagram (6.7), p.801; and to Conjecture 6.7, pp.802–803. Proposition A.1's proof extends through p.817. Appendix B is pp.817–820, its (B.5)–(B.7) are on p.819, and reference [43] is on p.823. The recorded appendix/bibliography page ranges were corrected.
5. The suggested file's opening documentation marker and descent locator were corrected. The roadmap adds AS.0 to TAD.4's suppliers and describes the two ratio conventions. The reader carries every mathematical, API, source-issue and coverage correction.

## Baseline, suppliers and ownership

The actual source statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, separately from checking the current library.

| Baseline declaration | Why its use is valid |
| --- | --- |
| `Nat.Partition` | Positive parts and prescribed sum; `ofSums` supports the real-bodied partition with its explicit admissibility bound. |
| `TauCeti.RegularFormClass.wittDecomposition` | A decomposition of the regular quadratic **class**. The coordinate target separately starts from a specified space decomposition and requests the hermitian analogue. |
| `TauCeti.QuadraticMap.specialOrthogonalGroup` | Determinant-one quadratic isometries; the targets use finite-dimensional characteristic-zero spaces. |
| `QuadraticMap.IsometryEquiv.exists_extension` | Extends an isometry of a regular subspace in the finite-dimensional quadratic setting. The anisotropic lines used here satisfy regularity. |
| `TauCeti.QuadraticMap.det_reflection` | Determinant −1 for reflection in an invertible-value vector, fixing its perpendicular; this gives the stated determinant correction. |
| `TauCeti.equivalent_of_equivalent_prod` | Cancels the finite-dimensional regular quadratic summand under the standing field assumptions. |

I read the supplier statements behind the cross-roadmap node references, plus the stage contracts for GN.2, N0/N2 and SR.2–4. GGP supplies relevant pairs, actual Fourier maps and periods, continuous local models, uniqueness and scoped packet propositions. AF supplies representation categories, factorization, constant terms and the **specified central-character** cuspidal carrier. AL's tensor-pole and boundary results require a dual pair; its unramified factor interface does not provide all-place Asai estimates. AS owns intertwiners and residual spectrum; ML's generic classification does not automatically cover the nongeneric residual inner-form parameter. The eleven requests identify those missing generalities rather than treating their suppliers as already proved.

The reviewed library audit, current Tau Ceti and current TauCetiRoadmap were checked separately. The recorded current commits are `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and `0d144d044dacebca17b654695b6f1ad58f159b27`. ReductiveGroups and RepresentationTheory/ClassicalGroups establish the nearby ownership boundaries. OrthogonalSpinGroups already owns its group/reflection and local/adelic direction; Completed/RestrictedProducts already imports its realized Tau Ceti infrastructure. The nine post-snapshot additions and current source searches supplied no existing twisted-descent target to duplicate. These upstream files were read only; no build ran there.

## Handoff and questions for the orchestrator

This review job is finished. No new proof node, baseline replacement or ownership move was needed. The four proposed extensions remain coordination proposals, not edits to other roadmaps.

The next work should use the corrected packet and reader. Resolve G1 against rendered pages before attempting a unitary implementation. G2/G8/G9 require permitted original proofs or reconstructed tower, Jacquet and witness arguments; no uncleared GRS book was read. G3 requires the full relative-cell calculation. G4 should pursue the later public note's references and full normalization calculations. G5 requires the matrix slice and continuous nonvanishing proof. G6 requires an acyclic all-place intertwiner/classification route. G7 requires all-member residual support. G10 requires orbit raising, unitary collapse and dominance. G11 requires an actual central-character/L² comparison, especially for split SO₂; vacuous torus cuspidality is insufficient.

The orchestrator should decide how to schedule the existing AS.2→ML.4→AS.6→AS.2 coarse dependency cycle and whether the four extensions belong in existing Part II/III jobs. The unitary output convention must be settled before those consumers receive an unconditional export. None of these questions blocks acceptance of the honestly conditional target-level plan.
