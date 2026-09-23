# Independent review: PAPER-CLAUSEN-MATHEW-21

Verdict: **revise**. This independent review is complete; the extraction remains **partial**.

Reviewer: Codex — codex-a71f92. Issue #1291. Original author: Claude Code — cc-442dc5, issue #1290, merged PR #1990. The reviewer did not author or previously review the input. Claim confirmed by the bot on 23 September 2026, then the full issue was reread.

## Evidence and scope

I read the entire published article, pp.981–1076, including proofs and bibliography; all 195 original extracted items; all six route briefs, 21 prerequisite entries and five original source findings. The published PDF was retrieved from Ravenel's institutional mirror, not inferred from the abstract. Its SHA-256 is in the result JSON. I cross-checked v3 TeX/PDF passages at the corrections. Existing item page references remain v3; new source findings also provide published pages.

Supplementary checks used the actual CMM Theorems A/C and 1.2/1.4, its notation and negative-K warning; CMNN Definition 3.8; MNN's 2015 Theorem A and the 2019 bibliography; and Hesselholt–Madsen's fundamental cofiber sequence, Theorem 1.2, author PDF p.4. These supplementary sources were read at the needed passages, not advertised as entirely re-reviewed.

Public sources:

- [Clausen–Mathew, published article](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/CM21.pdf), [v3 PDF](https://arxiv.org/pdf/1905.06611v3), [v3 source](https://arxiv.org/src/1905.06611v3).
- [CMM, henselian pairs, v2](https://arxiv.org/pdf/1803.10897v2).
- [CMNN, descent in K-theory](https://arxiv.org/abs/1606.03328).
- [MNN, May nilpotence, v3](https://arxiv.org/pdf/1403.2023v3), [derived induction/restriction](https://arxiv.org/abs/1507.06867).
- [Hesselholt–Madsen, finite algebras over Witt vectors](https://web.math.ku.dk/~larsh/papers/004/paper.pdf).

The arXiv history still ends at v3 (18 March 2021). Crossref records no correction relation/update for the DOI. The author's publication page and title/correction searches found no correction. Journal retrieval was unreliable; I do not claim an exhaustive journal errata search or priority for any finding. The JSON records this limitation rather than calling the published text unavailable.

## Library and roadmap audit

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369. Atlas snapshot: 1908f71517a684bc44d00376fa27f1cfe00a6b24.

Read the actual pinned statements:

| Item | Pinned declaration/source | What it supplies |
| --- | --- | --- |
| /052 | Spectral/Basic.lean: `SpectralSpace`; Spectral/Hom.lean: `IsSpectralMap` | Compactness and the spectral topology/map predicates. |
| /053 | Prime/Topology.lean:842, `PrimeSpectrum.instSpectralSpace` | Prime spectra are spectral. |
| /055 | Topology/KrullDimension.lean:40; Prime/Topology.lean:1359 | Irreducible-closed dimension and equality with ring dimension. |
| /199 | Topology/Sober.lean:160; Order/KrullDimension.lean:761,765 | The sober point/closed-subset order isomorphism and dimension transport, including order reversal. |
| /200 | RingTheory/Henselian.lean:94,108,170 | Henselian predicates and the adically complete instance. |

The sober bridge was found during the independent search; it is **library**, not a missing theorem to rebuild. The anonymous prime-spectrum instance is identified in that module's documentation. The henselian definitions are not the henselization construction itself.

I also read `continuousCohomology` in pinned Mathlib and `TauCeti.finiteQuotientSystem` / `finiteQuotientSystemFunctor`. These do not imply the all-degree finite-quotient comparison: /095 remains planned, importing built low-degree/system pieces.

Read the reviewed library-audit entries for EDS, SF, stable homotopy, profinite cohomology, K foundations, finite/local fields, motivic/étale K and trace methods; read every layer cited by the planned statuses. Native contracts inspected in full: EnhancedDerivedSheaves, StableHomotopyKTheory, RefinedTraceMethods, MotivicEtaleKTheory, GeneralAlgebraicKTheory, KTheoryFiniteLocalFields, DiamondsAndVStacks, SchemeAndStackFoundations. Two nearby upstream roadmaps, AlgebraicTopology and StablePeriodicCurved, were read in full for construction and comparison standards. ProfiniteCohomology's relevant all-degree/dimension contracts were inspected directly.

Both pinned trees were searched, including ignored files. The missing stable/spectral theories are supported by the reviewed audits and actual available interfaces, not solely by failed name searches. D0's current native contract explicitly includes Hochster representation, so /054 stays planned; no D0 reviewed-audit entry under that ID was present. The ordinary scheme étale site already has library foundations; the algebraic-space extension is what /061 plans.

## Change ledger

All original item IDs are preserved. Changes to the 27 original items:

| Items | Correction |
| --- | --- |
| /002 | Add connective structure sheaf to the established target; record the unrestricted proof gap E22. |
| /005 | Evaluate henselian values by the filtered-colimit extension, not an undefined presheaf value. |
| /020 | Mapping **spectrum**, graded pieces Hom(U,Σ^qπ_qX), and direction q→−∞. |
| /025 | Countable product is computed in the stabilization. |
| /052,/055 | Explicit quasi-compactness; separate closed-chain definition from sober comparison. |
| /063,/070 | Opposite category of field algebras; algebraic spaces in the common site carrier. |
| /080 | Retain only ordinary torsion-coefficient cd_p under the existing layer contract. |
| /082,/083,/088 | Nullary product condition; contravariant Kan extension; induction is not left exact. |
| /095 | Distinguish the existing carrier/system from the planned all-degree comparison. |
| /117 | Genuine-equivariant supplier mandatory; withdraw the unestablished exponent accusation. |
| /120 | Positive height n≥1; height zero is not a counterexample; affine-scheme Tate module and mod-p dimension conventions explicit. |
| /128 | Ind-level exactness does not make the small categories split exact. |
| /137,/141,/150 | TR orbit index n−1; finite étale **cover** for the K_0 unit; localization kills F⊗X. |
| /156,/158,/162 | CMM and Gabber rigidity use connective K; do not import a false negative-degree extension. |
| /164,/177 | Ordinary-ring continuity separated from E_1 continuity; units are those of π_0A in the spectral reduction. |
| /179 | Entire Selmer field comparison is missing, not already M.7's ordinary finite-coefficient result. |
| /183,/185 | Commutative ring for the multiplicative nilpotence claim; make the already-correct cofiber reading's source typo explicit. |

Added /196 (all-𝒫-local cohomological dimension), /197 (virtual field dimension), /198 (connective E_1-ring continuity), /199 (built sober comparison), /200 (built henselian predicates). Counts: **200 = 5 library + 11 planned + 184 missing**. Every missing item is still routed exactly once, even though partial status alone would not force this in the checker.

The 21 prerequisite entries remain; adding five items does not pretend to close all prerequisite interiors. Metadata, summary, result review marker, route cautions, route 3's prefix order, source findings and human report were updated. Twelve explicit gaps G1–G12 replace the original unsupported completeness claim.

Two tempting but unjustified changes were deliberately not made:

- Integral Dundas–Goodwillie–McCarthy /143 is supported by CMM Theorem 1.2 and footnote 1. The atlas's p-complete/rational proof interfaces must be assembled; they are not evidence that the integral source statement is false.
- D0 really does plan Hochster representation. It is not missing merely because its route is used in a different application.

## Important mathematical checks

### Torsion coefficients are not all local coefficients

For G=Z_p, ordinary cd_p is 1, but the cohomological dimension for all discrete Z_(p)-modules is 2. In the trivial-coefficient sequence

`0 → Z_(p) → Q → Q/Z_(p) → 0`,

positive continuous cohomology of Q vanishes and
`H¹(G,Q/Z_(p)) = Hom_cont(Z_p,Q_p/Z_p) = Q_p/Z_p`.
Thus `H²(G,Z_(p)) ≅ Q_p/Z_p ≠ 0`.

This is why /080 cannot define the hypothesis of Theorem 4.26 using only p-primary torsion coefficients. The upstream strict-dimension interface is relevant, but its precise comparison must be exposed. The required test is already anticipated by ProfiniteCohomology layer 11; its development must not be duplicated inside a sheaf consumer.

### The false fibre bound in Theorem 6.18(2)

Published p.1067 asserts that the residue-field map on K^Sel/p has fibre concentrated in degrees ≤0, including its finite-étale variants (17). This is false.

Take `R = Fbar_p[[t]]` and `k = Fbar_p`. R is a complete regular henselian DVR with separably closed residue field, hence strictly henselian. It satisfies the theorem's finiteness assumptions (the fraction field has finite p-rank too). By the earlier Theorem 6.11,

`K^Sel(R)/p ≃ K_{≥0}(R)/p`, and likewise for k.

Since K_0(R)=K_0(k)=Z, the coefficient exact sequence gives

`π₁(K^Sel(R)/p) = R×/(R×)^p`, whereas `π₁(K^Sel(k)/p)=0`.

The unit 1+t is not a pth power: in characteristic p, the coefficient of t in the pth power of any power series is zero. The fibre's long exact sequence therefore surjects from its π₁ onto a nonzero group. E4's R/R′ typo does not repair this failure.

A replacement argument is available without that bound. For a henselian connective R, finite étale R′, and `k′=π₀R′⊗_{π₀R}k`, use the natural square

```text
K^Sel(R′)/p  ──→  TC(R′)/p
     │                  │
     ▼                  ▼
K^Sel(k′)/p  ──→  TC(k′)/p .
```

This square is Cartesian. Indeed, connective CMM rigidity makes the connective K/TC relative fibres agree modulo p; DGM first reduces a connective ring spectrum to π₀. Apply height-one localization, using the removal of the connective/nonconnective difference explained in Example 6.4. Modulo p, L_1 and K(1)-localization give the same required comparison. The definition of K^Sel identifies the fibre of its map to TC with the localized K/TC fibre, proving the square assertion.

On the finite étale site of R, the top-right corner is a hypersheaf by Theorem 5.16; restriction retains descent for these hypercovers. Finite étale R-algebras and k-algebras are equivalent. The bottom-right corner is a hypersheaf by the same TC theorem and the bottom-left by the field result 6.13. Hypersheaves are closed under limits, so the top-left is a hypersheaf. The source's Nisnevich-plus-Galois reduction and rational gluing then finish the intended argument.

This is a mathematical repair outline checked against the stated inputs, not a Lean proof. G9 requires its maps and comparisons as formalization targets. E21 rejects the printed proof step, **not** the theorem.

### Scope and small counterexamples

Theorem 7.13 cites only the explicitly connective Theorems 7.12 and 6.18 although Definition 5.1 allows nonconnective structure sheaves. E22 records precisely that proof-scope gap. The corrected extracted target has a connective hypothesis; no counterexample to a possible broader theorem is claimed.

Other checks are small and direct: every field contains a cube root −1; C2/1 is not a terminal C2-set; the finite étale projection Q×Q→Q has K_0 class (1,0), not a unit; an induced rational C2 representation is not two trivial representations; and finite type-positive F kills HQ under tensor, while finite chromatic localization preserves HQ. These validate E6, E13, E17, E15 and E18 respectively.

## Source-issue disposition

The JSON records evidence and individual `confirmed` verdicts for every entry. “Confirmed” for a proof gap means the stated gap was verified, not that the theorem is false.

| ID | Published location | Disposition |
| --- | --- | --- |
| E1 | 1009, Prop.3.9 proof | Confirm finite-sheaf superscript slip for G. |
| E2 | 1034, Prop.4.23 proof | Confirm representation, not group, is compactified. |
| E3 | 1041, Cor.4.39 proof | Narrow to F(Y)→F(V); withdraw exponent allegation. |
| E4 | 1067, Thm.6.18 proof | Confirm R′ variable; separate E21. |
| E5 | 988,1054,1075 | Confirm May reference should be MNN 2015. |
| E6 | 989, notation | Cube-root alternative gives a false dimension equality. |
| E7–E10 | 1015–1021, §3 | Finite-map, space carrier, p-Nisnevich and sheaf-variable slips. |
| E11 | 1023, Prop.4.2 | Missing nullary coproduct condition in the displayed criterion. |
| E12 | 1023, Lem.4.3 | Missing opposites in the Kan-extension statement. |
| E13 | 1025, Construction4.7 | Induction is continuous but not a finitary-site morphism as defined. |
| E14–E15 | 1030–1031 | Spectral-sequence index and induced-action slips. |
| E16 | 1049, Thm.5.16 proof | TR fundamental-sequence orbit index. |
| E17 | 1051, Prop.5.23 proof | Unit argument needs faithful finite étale cover. |
| E18 | 1055, Construction5.34 | Wrong localization target. |
| E19 | 1061, Cor.6.12 proof | Use K^Sel for periodicity/negative degrees. |
| E20 | 1065–1066, Lem.6.17 | Cofiber of the map, not the map itself. |
| E21 | 1067, Thm.6.18(2) | False residue-field fibre bound; repair above. |
| E22 | 1072, Thm.7.13 | Unresolved nonconnective scope of the supplied proof. |

All five original findings were addressed; seventeen were added. No author contact, global errata-register edit or modification of another extraction was made.

## Route decisions and closure

Routes 1, 2 and 4 are rejected for now. The EDS and Selmer parents are sensible, but their briefs are not ready to become design instructions. General chromatic/equivariant theory belongs with the stable-homotopy owner; E_2 geometry with the scheme/stack owner; motives and TC with trace methods. A consumer does not become owner of every missing prerequisite.

Route 3 reuses the already-reviewed CMM henselian-pairs proposal. Its corrected prefix order is: RT and CMM rigidity/finiteness inputs plus EDS foundations; then shared TC descent; then the CMM applications that use descent; then Selmer. This resolves the coarse circular reading without assuming Selmer hyperdescent in its own inputs. Routes 5 and 6 fit SF.1 and SF.0. Their source-owner acceptance does not waive the atomicity work.

G1–G12 are actionable blockers to extraction acceptance, not claims that the paper must reprove all cited mathematics. Missing definitions and imported theorems must be explicit items with a unique supplier. The existing bundles and unstated model comparisons do not meet that requirement yet.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CLAUSEN-MATHEW-21.result.json`: passes.
- Relevant repository suites (paper checker/queue, source issues, errata/checker): 26 tests pass.
- Focused scratch regression: 1032 checks pass on the actual revised files, including counts, original-ID preservation, exact-once routing even in partial status, stage IDs, source-issue review markers, scope corrections, and counterexample arithmetic.
- The queue is checked against this actual review: overall `revise` yields no accepted routes for application.
- No Lean file was required, produced or compiled. These checks do not formalize the mathematics.

Resume at G1 and G5: atomize the inventory and replace the rejected route briefs, carrying E21's proof repair and E22's scope limitation. Do not rerun the same extraction as if this review had accepted it.
