# Handoff: REV-HeightsRationalPointsAndObstructions

Completed review job #539, session `codex-SJl6ia`, 2026-10-13. Branch `codex-SJl6ia-review-heights`. The review is finished; its mathematical verdict is **needs_changes**. Do not automatically accept or promote the packet.

## Completed and validated

All 144 targets were independently reviewed: 80 corrected, 61 verified, three unverifiable. All 100 baseline declarations were read at the pinned Mathlib/Tau Ceti commits; seven provider descriptions were corrected, none removed. No target node was added. The packet is a complete target-level pass under PROTOCOL §0: all seven stages are planned through libraries, exact requests or recorded gaps; none is closed. It has 38 precise requests, 18 gaps and 11 confirmed source issues (E9–E11 new). The report contains the per-node and per-baseline change inventories.

The suggested file is 926 lines and elaborates with only `sorry` proof warnings through `lean-check` at the pins. It contains real light definitions and no `sorry` data definitions. The packet checker returns zero errors and warnings; the data-definition checker, deliverable intake check, graph/test/review inventories and whitespace check pass. These checks do not discharge theorem proofs.

## Acceptance blockers and where to resume

- `RP.0/local-weil-functions`: proper analytic metrics and admissible families repair the statement; Müller–Stoll §2–3 pp.2–4 verifies only the elliptic normalization. The general Bombieri–Gubler construction was not read from a cleared source. Supply a permitted primary treatment and decompose the metric/normalization obligations, or explicitly defer the target. Do not use bare continuity or claim the product formula annihilates arbitrary constants.
- `RP.1/local-division-index`: Mattuck's open p-adic subgroup theorem is unread. Verify a permitted primary source, specify the formal/Lie-group contract and its normalized absolute value, and retain the real/complex cases and p=2 test. Poonen p.138 is only orientation.
- `RP.1/reduction-torsion-injective`: the Katz appendix is unread. Verify the torsion-free reduction-kernel result with `e_v<p−1`, separately from prime-to-p injectivity. Poonen p.184 supplies Hensel lifting, not this result.

The packet and report do not certify these three nodes. The rest of the gaps are recorded obligations in a completed target-level pass. A subsequent independent reviewer should update only after seeing the needed evidence.

## Reader document synchronization

The issue did not authorize changing `research/blueprint/readmes/HeightsRationalPointsAndObstructions.md`. Before packaging, transfer the corrected packet fields and the report's mathematical corrections to that document. In particular:

| Nodes / section | Required synchronization |
| --- | --- |
| RP.0/generalized-global-field, normalized-height, extension-invariance, weil-height-machine | Additional place/excellent-DVR axioms; relative totalWeight versus absolute heights; correct ordering of line-bundle construction |
| RP.0/neron-tate-kernel-number-field, neron-tate-bilinear-form, local-weil-functions | Northcott-based torsion kernel; factor-two elliptic pairing; analytic metrics and admissibility; conditional general source status |
| RP.0/silverman-tate, family-duplication-estimate, fibrewise-height-model-independence | Segre base-height terms; normal-base generic-trivial bundle descent; arbitrary-dimensional resolution contracts |
| RP.1/local-kummer-image-unramified, lang-neron, function-field-neron-tate-kernel | Connected abelian special fibre; removal of circular Theorem 9.15 route; geometric versus original trace |
| RP.1/two-coverings, w2-odd-factorizations, selmer-set-two-covering | W[2] versus its H¹(J) image; odd unordered factorization; replace irreducible-sextic counterexample with S₆; BGW Theorem 5 locator |
| RP.2/adelic-points-general, scheme-brauer-evaluation, brauer-local-constancy | Integral-model direct limit; global open immersions need not give embeddings; quaternion example on Gm; fixed-class local constancy |
| RP.2/zero-cycle-brauer-pairing, product-norm-assembly, brauer-trivial-complete-intersections | Brauer reciprocity; both invariant-matrix sum conditions; Picard/H²(μ_n) Lefschetz prerequisites |
| RP.2/effective-brauer-manin-test | Finite partitions versus a certified algorithm; planet name “Brauer–Manin test” |
| RP.3/torsor-evaluation, selmer-set-of-torsor, universal-torsor, edge-map-twist-independence, residual-sha-functional | Inverse twist class and σ=−τ translation; adelic-nonempty trivial-torsor condition; type obstruction rather than an undefined shortcut; rational Picard point versus descended line bundle |
| RP.3/genus-one-torsors, descent-worked-example, strong-approximation-failure, insufficiency-examples | Marked/unmarked genus-one classes; correct quartic elliptic labels; proper product-torsor example |
| RP.4/integral-points, de-franchis, kodaira-parshin-construction | S⊆T monotonicity; characteristic zero/separability; full-branch genus 41 at g=2; halving degree bound from Jac(C₁) |
| RP.4/mordell-faltings, RP.5/vojta-bombieri-mordell | Downward independent Bombieri assembly; remove upward Faltings/Lawrence–Venkatesh dependencies and the reverse edge |
| RP.4/siegel-theorem, function-field-mordell | General-number-field systems Subspace Theorem adapter; separate function-field primary-proof gap |
| RP.5/stabilizer, ueno-locus, manin-mumford-positive-characteristic | Scheme stabilizer and characteristic-zero fibres; generating hypothesis for bounded complement; geometric trace in characteristic p |
| RP.5/faltings-subvarieties, mordell-lang, vojta-inequality, mumford-gap | Full coset decomposition versus off-Ueno finiteness; precise high-point count/norm ratio; product/Roth lemma gap and cone doubling |
| RP.5/bogomolov, szpiro-ullmo-zhang-equidistribution, coset-free-hypersurface-sections | Infinite order in quotient; generic sequence/no infinite closed-subset subsequence and field of definition; exclude zero form |
| RP.6/curve-in-jacobian, genus-one-classification, higher-genus-classification, conjecture-register | Abel–Jacobi tangent separation; finite-Sha condition; ι(C)(K̄)∩Γ; separate Vojta rational-point and CT nonemptiness/density locators |
| All stages | Replace 21 nonexistent SF target citations with the explicit requested contracts; all stages planned with remaining refinements, none closed; 18 gaps and three unverifiable nodes visible |

Use the packet's complete per-node diff inventory in the review report for the other local edits, test corrections and exact source locators. Preserve own-word source descriptions. E9/E10 concern Milne printed pp.146–147; E11 concerns the coefficient sign/threshold in Vojta p.172, leaving the r≥3 theorem intact.

## Ownership and routing

SF.1–SF.5 own the missing scheme/torsor/Picard/curve/line-bundle contracts; 21 absent targets are enumerated as precise requests in the packet. `SchemeAndStackFoundations:key/scheme-brauer` retains Azumaya/scheme Brauer ownership. EllipticCurves Layer 7 supplies the planned Selmer infrastructure rather than an invented H¹ carrier. ClassFieldTheory Layers 5, 10 and 13 supply local invariants, global reciprocity and cyclic norms. DT.2 owns the number-field S-adic systems adapter. AbelianSchemesAndArithmeticModuli A2 needs the Lang–Néron Hom/Albanese contract; ArithmeticGaloisDuality R02.3 needs a separately scoped function-field/curve-H¹ finiteness contract. An ArakelovGeometryAndAbelianHeights Part II remains the proposed owner of the higher-dimensional arithmetic intersection/equidistribution input.

General heights and the independent Mordell assembly remain in RP.0/RP.1 and RP.4/RP.5 at the lower tier; higher Faltings/Gross–Zagier consumers import them. This satisfies RT-AREA-iwasawa-1/3. GZ.2's Néron symbol is its own intersection-theoretic object. Do not restore an upward or circular dependency.

Current TauCetiRoadmap was screened at `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine new roadmaps and four Completed roadmaps in WORKERS.md. Current Tau Ceti was screened at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Recheck newer upstream main before adding targets. The baseline for suggested-file elaboration remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

All durable findings, primary URLs/version hashes, exact requests and check results are in the packet, review report and this handoff. No scratch artifact is required to resume. No second issue was claimed in this run.
