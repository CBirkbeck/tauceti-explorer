# REV-ArithmeticGaloisDuality — completed independent review

Codex, session `codex-QZZcp0`; issue #349; 10 October 2026. The claim was confirmed by the swarm bot. This review is independent of BP #675 by `codex-dr6Ar4`. Only this job was taken.

## Result

Accepted as a complete target-level planning pass under current WORKERS/PROTOCOL/detail.json. All 125 nodes and 48 pinned baseline declarations were checked. The packet has 139 construction API items, 74 tests, 42 planets, 33 requests and 18 explicit gaps. All eight layers are planned; none is closed or implemented. The packet's `review.checked` and the report record every node verdict and correction. All 24 source findings have independent confirmed verdicts, with publication/access scope retained.

Changed deliverables: the ArithmeticGaloisDuality packet, its suggested Lean file, the independent review report and this handoff. The predecessor reader is outside the review deliverables and remains read-only. No external roadmap or library was edited, and no source passage/private file was retained.

## Validation

`check_blueprint.py` reports zero errors/warnings. Shared source-finding and source-version validators report zero errors. The final `lean-check` exits zero with only `sorry` warnings against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 139 API names and 74 test markers have suggested signatures. These prototypes have the precise limitations recorded below; elaboration is not implementation. No Lean server, lake build/update/cache operation or current-upstream build was started.

Current read-only reuse checks: TauCetiRoadmap main `37769f03c170a7bc3e1082df70522a0ad59c5ffd`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The atlas snapshot is older. Existing continuous extension/H2 classification, discrete cochains/Ext, ordinary Tor, stable subrepresentations and restricted-product topology are cited, not planned again.

## Reader/package reconciliation

Before packaging, reconcile the read-only `research/blueprint/readmes/ArithmeticGaloisDuality.md` with the corrected packet. Use the report's complete node ledger, not the predecessor handoff's superseded counts or claims. In particular:

1. Replace the cochain-lifting hypotheses by an arbitrary source space and discrete surjection; reuse the existing ML predicate and actual homogeneous cochain homology. Keep the prime condition and full Z_p/Z value in the multiplication tower test.
2. Specify general ind-admissible cochains by the filtered finite-type stable-submodule colimit. Derived-invariants comparison beyond degrees zero and one is conditional. Compact HS needs that comparison; finite-index descent instead uses finite-coset continuous transfer.
3. Keep finite restricted-product topology separate from coefficient-unit duality. Restore modular induction's |H_p| multiplicity and the rational decomposition/full-rank argument. Keep the R02.3 parents of legacy finiteness/Euler node ids.
4. Replace the false global H2 injection/cone identification by the degree-three cokernel trace and good truncation. Local trace only gives a homotopy retraction into an injective target until both models are replaced. Distinguish normalized ring duality from Matlis duality, and hyper-Ext into its complex from Ext into a canonical module. Use the filtered R-finite construction after localization.
5. Carry the signed tensor flip and bicomplex-convention transport. State hyper-Tor in a bounded strip with its convergence and all relevant degree-one terms/differentials.
6. Add `R02.4/function-field-poitou-tate`, prime-to-field-characteristic coefficients, nonempty S and FA.2-FA.4 degree/class-formation input. Apply the same branch conditions in local/global derived duality and function-field Selmer formulas. Do not use the number-field finite PT theorem for this case.
7. Keep characteristic-zero hypotheses in the local abelian-variety etale Ext/cofinite branch; preserve the separate isogeny residue-characteristic condition. Retain local Brauer degree killing, avoidance and the separate soluble square-root specialization in character-root base change.
8. Import existing Selmer `L2/selmer-complex` and `L2/selmer-complex-h1` and plan only their arithmetic-carrier comparison. Preserve the H0 cokernel. Use exact lower-tier decomposition-group/Dickson nodes and the characteristic-two matrix-cocycle input. State KW first-order relations conditionally on an actual obstruction injection; use eigenspace multiplicities rather than residue-field trace for archimedean counts.
9. Copy the corrected locators, source versions and source findings from the packet. The BIP commutative-algebra lemmas are not local duality or determinant tangent proofs. PQ local duality is Lemma 3.1, published p. 19; DDT's elementary tangent calculation is Lemma 2.39, p. 75; NSW function-field Greenberg-Wiles is 8.7.9, pp. 512-513.

## Remaining contracts and owners

The packet's 18 gap records and eight coverage.remaining lists are the authoritative worklist. In addition to the predecessor's explicitly missing arithmetic interfaces:

- **Normalized ring duality:** construct the absolute normalized dualizing complex, local cohomology and RHom/Matlis comparison from Nekovar sections 2.5-2.8, pp. 54-61. Matlis alone does not supply this. SF.2 relative flat finite-presentation duality is not the completed-local-ring contract; later AS.1 cannot be a forward prerequisite. The maintainer must resolve owner/tier placement before packaging this branch.
- **Finite function-field PT:** FA.2 supplies S-unit/idele and degree objects, FA.3 the unramified Kummer input, FA.4 prime-to-characteristic local invariants and the completed-degree class formation. Bind their actual place-indexed diagrams to the generic Ext/cochain interfaces.
- **Unrestricted Tate divisibility:** Rubin Appendix B Proposition 2.4 states the theorem, citing Tate 1976 Proposition 2.3. Integrate that separate argument; a general Milnor lim1 group cannot simply be declared to have no divisible elements. ML proves the arithmetic finite-cohomology specialization. Scalar-extension rationalization has its independent bounded-image proof.
- **Contraction prototype:** the suggested file covers jprime=j and j=0. The full target i>jprime>=j>0 with last jprime-j output variables factoring through the quotient still needs its native typed domain/codomain and Leibniz/naturality maps.
- **Maire proof source:** Newton-Thorne Lemma 3.4's class-field closure/tower argument was read. Maire Proposition 19 and its addendum remain an explicit inaccessible proof-source gap.
- **Geometric coefficients:** the etale Ext/gerbe/dual-abelian-variety/rational-point topology contract remains a supplier gap.

Preserve the downward ownership moves in BP #675: D7 owns complex derived tensor and bounded hyper-Tor (reusing ordinary Mathlib Tor), Matlis coefficients, the derived-composite spectral sequence and adic continuous-function flatness; R02.4 owns prescribed-local totally real base change; D8 owns the elementary square-zero cocycle/trace calculation. Higher deformation/patching/potential-modularity roadmaps import these targets. Ring representability and relation-module injections stay with the higher consumers. Reconcile Grunwald-Wang with InverseGalois IG.4; no neighbouring files were changed.

## Source findings and resumption

Original E1-E7 confirmed. Added E8-E24 cover the global H2 localization injection, missing function-field nonempty-S condition, pointwise/Matlis/action finiteness slips, local geometric-coefficient citation gap, archimedean trace and local Selmer dimension errors, and the recorded misprints. E18 is already corrected in Milne's October 2025 addendum; E22 is the published Calegari-Geraghty correction. Nekovar's listed erratum was inaccessible (HTTP 403), so its findings are not labelled new. Rubin E23-E24 are scoped to the author draft because the publisher refused access; their characteristic-p Artin-Schreier and finite-presentation/H2 checks do not depend on a claimed published collation. No author was contacted.

The review itself is finished. Future workers can start from the packet's requests, gaps, checked ledger and this handoff; no scratch files are required. Scratch source texts/logs are deleted after submission. The final PR names this session and uses `Refs #349`.
