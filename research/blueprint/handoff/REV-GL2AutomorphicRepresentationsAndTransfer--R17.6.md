# Handoff: independent review of R17.6

Codex (GPT-6), session `codex-oIRXsf`, issue [#9386](https://github.com/CBirkbeck/tauceti-explorer/issues/9386), 14 October 2026. The independent review is complete and accepted as a target-level pass with **planned**, not closed, coverage. The input author was Codex `codex-PrYXzU`, [PR #9561](https://github.com/CBirkbeck/tauceti-explorer/pull/9561). This run claims no second job.

## Completed work and durable evidence

The corrected packet, reader and suggested file, plus [review report](../reviews/REV-GL2AutomorphicRepresentationsAndTransfer--R17.6.md), contain everything needed to resume. All eighteen effective nodes have individual verdicts: fifteen verified and three corrected. All nine source PDF hashes and twelve baseline declaration statements were checked; forty-five supplier node contracts were examined, forty-four retained. The construction now has seven API items and six tests. Six planets remain, with no new target node added by the reviewer.

All three pre-existing local source findings were confirmed, but their identifiers collided with R16.1. For this packet only, **old E12→E20** (Wiese oldform index), **old E13→E21** (Scholl theorem references), **old E14→E22** (Scholl coefficient field). Findings E1–E19 in the other GL₂ packets remain unchanged. The new confirmed Katz proof error is **E23**. The reader and packet use the corrected identifiers. Do not restore the collisions when assembling.

The packet check passes with zero errors and warnings. The source findings pass an errata-only projection check. An effective-import audit verifies the canonical hash, eighteen unique review entries, reader contracts, accepted direct suppliers, six planets and an acyclic graph among the effective R17.6 nodes. `lean-check` exits zero with exactly seventeen `sorry` warnings and no other diagnostics: 139 lines, seven named statements and ten examples. This is elaboration of target signatures, not formalisation.

## Remaining mathematics

- **G1**, owned in the three classical inputs here: establish the higher-weight primitive rational f-component and comparison, including finite full-level GL₂/cyclotomic descent and both good-prime polynomial roots. R14’s weight-two Tate comparison is not this proof.
- **G2**, owned here: establish the Q odd-prime geometric local comparison with correct dual/reciprocity normalization and nonzero monodromy in the special case. The R16 conductor-preserving LLC contract is not the geometric proof. No extraordinary dyadic cubic comparison is included.
- **G3**, newly explicit: replace the false auxiliary-level comparison in Wiese Theorem 9, published pp.130–131; the same failure appears in thesis Chapter I §1.4, proof of Theorem 1.4.1 p.9. The zero-U form at Nℓ₁³ has a_{ℓ₁²}=0; the form at Nℓ₂³ is good at ℓ₁, with a_{ℓ₁}=0 and character 1, and has a_{ℓ₁²}=1. Pullbacks preserving q-expansions cannot identify them. This does not refute the theorem’s statement. A replacement must establish valid auxiliary-level removal while preserving cusps, character and the required full eigenpacket, including T₂ and exceptional dyadic Frobenius. Stabilizing both auxiliary primes only repairs coefficients; it does not prove independence.

Keep the three **R15.2 open supplier requests**: the Katz oldform companion/zero-U comparison with geometric weight-one T₂; conditional independence/unique-pullback descent; and the qualified Γ₁(N), odd N≥5, weight-two cusp base-change/reduction-image statement. The conditional descent theorem does not close G3. The seven other request records are supplied upstream-layer imports, not seven new planning jobs.

The unrestricted characteristic-zero weight-one witness and its E₄ weight-five replacement do not use the failed level-N Katz comparison. Exact RT weight/level assertions retain their linear-dihedral, discriminant and trace conditions. Katz level N names its carrier at N=N(r̄), without a new primitivity/minimality predicate. The broad R15.6 modularity-equivalence prerequisite was removed from that Katz node.

## Assembly and ownership

Canonical input: `research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json`, SHA-256 `2fcb2c938001426f0c1019d99a2bd9ba47cf82ec91ab2ad5305ef7b896301b65`. Apply all fifteen same-id `nodeRefinements` before following dependencies. Retain canonical kind/title/planet, replace the fields specified by `importBasis`, then add this packet’s three classical inputs. The unmodified canonical packet still has obsolete upward references; it must not be imported without these refinements.

Reconcile the recorded ownership moves without editing unrelated workers’ files in this review:

1. `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform` and its related newform projector/realization/congruence targets import the lower `classical-eigencomponent` and `classical-galois-realization` contracts. Generic geometry stays R14; additional compatible-system and local arithmetic targets stay R19.
2. `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical` imports `classical-residual-conductor-bound` for this odd-prime use. No dyadic extraordinary comparison or full later conductor theorem moves down.
3. The R15.6 `residual-modularity-witness` and `modularity-formulations-and-determinant` nodes still have explicit R19 attachment dependencies. Their owner must make the witness constructor consume supplied representation/lattice data and reconcile attachment applications: weight≥2 uses the new lower realization; the already-given induced weight-one Artin representation uses R17.5. Avoid a definition-level R15.6↔R17.6 cycle. The effective eighteen-node acyclicity check does not certify these unchanged transitive suppliers as closed.

Current upstream/library screens used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; pinned elaboration used Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Sources are public and linked in the packet/reader/report. No local scratch file is needed by the next worker. The geometric and Katz targets remain definitive reader targets until their real supplier carriers exist; do not infer them from the compact suggested file.
