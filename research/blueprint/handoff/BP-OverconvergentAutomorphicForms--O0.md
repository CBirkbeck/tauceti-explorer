# BP-OverconvergentAutomorphicForms--O0: completed target-level plan

Codex — session `codex-fFIzYb`, 6 October 2026. Refs #1016. **Status: complete planning pass.** All eight scoped stages O0–O7 are `planned`; none is `closed`. The protocol's target-level stopping condition is reached. All implementation statuses remain `unchecked`.

The [packet](../packets/OverconvergentAutomorphicForms--O0.json), [reader](../readmes/OverconvergentAutomorphicForms--O0.md) and [suggested file](../suggested/OverconvergentAutomorphicForms--O0.lean) agree on 73 nodes, 117 API items, 107 unit-test contracts and 32 planets. The thirteen preceding checkpoint identifiers are preserved. There are 13 supplier-stage requests and 11 explicit gaps, including prototype carrier omissions.

## Coverage

| Stage | Result |
| --- | --- |
| O0 | Integral torus, norm, both continuous-character functors and corrected comparison; bounded families and common analytic extension; genuine vector coefficients, tensor/dual and adic induction; algebraic injection; Ding's definite-unitary completed-coefficient/Jacquet application. |
| O1 | Right cocycle, vector equivariance and gauge maps; torsor equalizer sheaves and coefficient operations; analytic line effectivity with Heuer's precise hypotheses. |
| O2 | Admitted canonical domain, automorphy factor, geometric line, level/radius transport and algebraic specialisation. |
| O3 | Integral eigenfunctions, justified rationalisation, qualified pullback, fixed-radius sections and overconvergent colimit; ramified modified differential lattice. |
| O4 | Four covers/groups/equalizers, small/full comparison, representative relations, finite twisted polarisation descent, profinite pairing comparison, component sums and positive p-unit transport. |
| O5 | Independent AIP modified-frame eigenline, integral local-freeness/gluing, geometric and arithmetic comparisons on verified common domains. |
| O6 | Cusp boundary ideal, Koecher distinction, normalized tame/wild/diamond maps, q-expansions, cusp cohomology lift, fixed-radius (Pr), compact restriction, controlling operator and integral renormalization. |
| O7 | Completed formal Igusa functions in the prescribed limit order, weighted equalizers, affine completion comparison, ordinary restriction and coefficient/Hecke/expansion diagrams. |

Ding's published §4.2.2 and Proposition 4.14 are included. Equidimensionality and the Jacquet sheaf's Cohen–Macaulay property form one theorem node; reducedness has a separate classical-density dependency. Full T(K) characters have unramified coordinates: their dimension is n([K:Q_p]+1), while the eigenvariety dimension is n[K:Q_p]. CC.8 supplies only the completed topological adapter, not admissibility or local regularity. L2a's Buzzard engine does not supply this Jacquet construction.

## Evidence and checks

The reviewed library audit was consulted before planning. The 38 baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474`; the prototype imports only Mathlib. Upstream AdicSpaces and ModularForms reader documents were read in full. Exact supplier nodes were screened before using stage requests. The correct supplier names are `HodgeTateAndCanonicalSubgroups` and `HilbertModularVarietiesAndShimuraCurves`.

Read ranges and SHA-256 fingerprints appear in the packet and reader: BHW §§3–4, 6–7 and 9–10, relevant canonical-domain/quotient/pairing statements in §§5 and 8; AIP analytic extension, eigenline, transitions, cusp Banach and Hecke statements; Boxer–Pilloni §§6.2–6.3; Ding's published §4.2.2; and Heuer's published Corollary 1.4 and Proposition 3.8. This is not a claim to have read every page of every paper. AIP CUSP Appendix Proposition 6.4 and Ding's BHS/Emerton proof inputs are identified for missing owners, not asserted as transcribed proof leaves.

- `scripts/check_blueprint.py`: 0 errors, 0 warnings. No declaration index was available: the checker checked baseline-reference form; pinned statements were checked separately in source.
- `research/blueprint/intake.py check-files` on the four authorized files: no problems.
- `git diff --check`: clean.
- Suggested file elaborated with `lean-check` against the existing pinned Mathlib build: 0 errors, 60 warnings, all `declaration uses sorry`. More than 20 GB memory was available. No library build, dependency update, cache download or language server was started.

The elaborated file contains 27 actual examples: 24 weight tests and three cocycle tests. The remaining 80 unique test contracts occur only in the explicit mathematical omission register. That register also states the analytic enhancement of the typed algebraic cocycle. Missing rigid spaces, torsors, sites and completed coefficient modules are not replaced by `Prop` fields or artificial carriers. Elaboration does not prove the geometric contracts; proofs using `sorry` remain unproved.

## Source corrections for independent review

Five findings have locators, reasoning, reach and correction searches. E1 supplies the missing inverse in the weight-space group map. E2 corrects the false all-unit supremum diagnostic, keeping the pro-p diagnostic distinct from AIP universal-coordinate annuli. E3 disproves BHW's analytic-radius formula even after E2: for F=Q, p=3, κ(4)=ζ9 and trivial tame torsion, the formula gives 3^(−7/6); the ball contains 64 with κ(64)=ζ3≠1, yet κ=1 on 4^(9·3^j) accumulating at 1. Analytic identity contradicts the claimed extension. Retain common-radius existence on actual AIP charts. E4 corrects the canonical subgroup order to p^(mg). E5 corrects the AIP projective-Banach reference.

Relevant journal/arXiv page images were compared. Recorded searches found no published correction as of 6 October 2026; no authors were contacted. AIP CUSP's Hattori footnote requires a cofinal **global-Hasse affinoid refinement** inside the partial-radius region; that condition is retained throughout the cusp Banach and compact-restriction plan.

## Follow-up after independent review

The packet's requests and per-stage `remaining` lists specify the contracts. The main ownership gaps are:

1. **PadicFamilies, Part II: Jacquet-module eigenvarieties.** Emerton analytic vectors/Jacquet functor, noncompact torus characters, coherent strong-dual support, definite-unitary admissibility/local regularity, dimension/depth and classical-density reducedness. Obtain Ding's exact BHS/Emerton proof inputs. This is separate from L2a's Buzzard engine and CC.8's topology.
2. **ShimuraCompactifications, Part II: Hilbert cusp cohomology.** Formal fan/unit-quotient calculation, formal-functions adapter and R^qρ_*O(−D)=0 of AIP CUSP Theorem 3.17/Appendix Proposition 6.4. C6 supplies geometry; O6 owns the analytic coefficient lift and (Pr) application.
3. **Verified weight charts and numerical ranges.** Establish universal-coordinate chart/radius comparisons without the disproved formula. Common positive-radius existence is already planned.

The 13 requests specify L0a character spaces, L0 multivariable analytic modules, B4 algebraic comparison, B5 p-level/family expansions, P9 effectivity and affine completion, T4/T5 domains/frames, H1 universal moduli, H3 polarisation components, H4 effective level groups, S5 covers/pairing, C6 geometry and CC.8's adapter. Exact available nodes are imported.

Type the omitted signatures after their actual carriers are supplied. Preserve the right/inverse vector convention, AL_n's p^n radius scaling, integral base-change qualifications, (Pr)'s distinction from finite projectivity, and finite versus profinite quotient groups. O7's coefficient comparison does not imply a Hida control theorem or ordinary projector. No scratch material is needed to continue; sources, contracts, omissions and verification facts are preserved in these deliverables.
