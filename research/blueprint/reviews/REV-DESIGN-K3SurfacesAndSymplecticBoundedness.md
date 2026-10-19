# Independent review of K3 surfaces and symplectic boundedness

Job: REV-DESIGN-K3SurfacesAndSymplecticBoundedness · Issue #3555
Reviewer: Codex, session codex-nN3JL6 · 2026-10-19
Input author: Codex, session codex-x93vaL (DESIGN #3461)

**Verdict: accepted as a complete planning pass.** The packet plans the right targets with explicit unresolved proof and supplier obligations. Acceptance does not close those obligations or certify an implementation. Every node has an individual reason in `review.checked`; no node is left unverifiable. All twelve stages remain `planned`, with nonempty `remaining` lists, and none is `closed`.

| Item | Reviewed result |
| --- | ---: |
| Nodes | 74 |
| Verified / corrected / added / unverifiable | 31 / 43 / 0 / 0 |
| Definitions / constructions | 11 / 8 |
| Theorems / comparisons / applications | 52 / 2 / 1 |
| API items | 83 (10 added) |
| Discriminating tests | 57; three per definition or construction |
| Planets | 50; at most six in any layer |
| Baseline declarations | 4; all confirmed |
| Registered supplier requests | 22 |
| Current upstream lattice import contracts | 3, recorded separately from the older atlas registry |
| Explicit proof/supplier gap groups | 18 |
| Input-coverage links | 102; all preserved |
| Source findings independently adjudicated | 25 confirmed; none rejected |

## Corrections

The reader, roadmap definition and packet agree with these changes.

1. **Use the current lattice owner.** The former GN.2/GN.3 requests mixed missing consumer corollaries with theory already planned by current IntegralLattices. Its README Layers 3A–3H and 5F–5I, and the corresponding Suggested signatures, supply the local/genus and primitive-embedding direction. Those are imports. Charles’s additional congruence-transport theorem (Proposition 2.9, pp.500–502), the local unit/isotropic-quotient/maximal-lattice corollaries, and the bounded-positive-square/finite-order consequences are requested as IntegralLattices, Part II.

   The finite-class branches must stay separate. IntegralLattices owns definite finiteness (2G) and binary genus-class finiteness (4E); its scope and Suggested explicitly assign indefinite rank at least three to **OrthogonalTamagawaAndLatticeMass**. That successor has no current roadmap/packet here. Bounded-determinant finiteness in the required generality consequently remains a gap. Neither a definite reduction theorem nor the binary ideal-class proof supplies it.

   The atlas registry currently contains only Completed/IntegralLattices, not this newer roadmap. The three exact current-layer contracts live in `upstreamImports`, `upstreamNotes`, the reader and coverage obligations. They are not mislabeled as pinned declarations or fabricated registered stage IDs. The affected nodes reuse the actual `TauCeti.IntegralLattice` carrier, with the additional theorem inputs recorded as gaps. The stale GN edges were removed from the roadmap definition.

2. **Reuse the existing period-point carrier.** K3.5/period-datum now cites the pinned `TauCeti.Hodge.PeriodDomain.Point`: finite free integral lattice, specified complexification, weight, Hodge type and fixed polarizing form. Its filtration extensionality is reused. The comparison with the isotropic positive-line domain, sign normalization, topology and actual geometric period map remain IHS targets. No second general Hodge or period carrier is planned.

3. **Complete object-facing APIs.** Added K3 isomorphism transport/proof irrelevance, the numerical-quotient universal property, Mukai coordinate simp/direct-sum rules, Mukai-vector coordinate characterization, normalized BB uniqueness, quasi-universal presentation compatibility for θ, period-point extensionality, admissibility/strong-admissibility constructors and orthogonal-submodule factorization. Witness constructors do not assert equality of different deformation families. The θ item explicitly keeps its non-routine integral normalization proof open.

4. **Make boundedness imports precise.** R09.4 now requests the characteristic-zero Kollár–Matsusaka input used by Charles Lemma 3.5 (pp.507–508) and the uniform fiberwise-big family theorem of Lemma 3.6 (p.508). The latter includes generic bigness, spreading, noetherian strata and one common exponent. The current restricted stack layer does not itself supply these theorems; the general-moduli Part II must.

5. **Correct provenance and locators.** Replaced the nonexistent Charles “§2.4” locator by Theorem 2.4’s proof, pp.494–497. Removed an unread Huybrechts draft wrongly listed under Charles as a direct cohomology source. Direct LMS references now identify the acquired published statements, including Proposition 3.4.2 and Lemma 3.4.3, pp.299–301, and Lemmas 3.5.1–3.5.2, p.302. Indirect Charles citations identify the actual Charles page and keep primary-proof acquisition in the gaps. The low-dimensional Picard-jump node now cites SSTT footnote 1, p.4, without implying that the missing low-rank proofs were acquired.

6. **Keep André’s interface within its statement.** Main Lemma 1.7.1, p.210, gives descent and a generic Galois-equivariant even-Clifford comparison, including integral modules in its stated scope. Removed the unsupported attribution of involution equivariance. Any extra tensor/moduli interpretation is a supplier obligation. Corrected the good-reduction locator to Lemma 9.3.1 and Remark 9.3.2, p.241: the latter needs unramified primitive cohomology. This supports the potential-good-reduction argument without turning the generic lemma into a special-fiber divisor theorem.

7. **Adjudicate source findings.** Every sourceIssue now has this review’s verdict and a mathematical reason. E2 is classified as a **proof gap**, not a disproved existence assertion: the invoked primitive-embedding proof needs a primitive input, and the actual consumer has one. In coordinates `(h,e,f)`, the retraction sends `(x,y,z)` to `(z,y−z)`. The other findings retain their corrections and inherited provenance. In particular, E27 is confirmed by reading André’s scanned statement against SSTT §9.1, p.45: special-fiber divisor algebraicity and normalization need an additional theorem. It is not a counterexample to Picard jumping. The previously rejected paper findings E3 and E15 remain excluded.

8. **Preserve the lightweight Lean shape.** Added source attribution to the suggested file. Its mathematical signatures remain the rational Mukai pairing, positive B-field action, their identities, the rank-two determinant and examples. The two data definitions have real bodies. Heavy geometric carriers stay in the reader; no theorem-proposition stand-in or admitted data construction was introduced.

## Sources and baseline

Independently read the full published [Charles paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §§1–4, pp.487–523, with bibliography pp.523–526. The source audit also read the relevant published [LMS](https://www.numdam.org/item/10.24033/asens.2215.pdf) statements and proofs: §§2.1–2.4 and §§3.1–3.5, pp.287–305; the [SSTT version of record](https://doi.org/10.1017/fmp.2022.14), introduction pp.2–5, orthogonal datum pp.7–8, integral-model/special-endomorphism inputs pp.10–11, and application pp.44–45; André’s [first GDZ segment](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0305/LOG_0026.pdf), pp.205–210, and [second segment](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0305/LOG_0028.pdf), pp.240–244; and [Li–Liedtke arXiv v2](https://arxiv.org/pdf/1012.3777v2), Proposition 3.2/Theorem 3.3 with proof, pp.9–11. The two André segments were inspected as rendered scan pages. Acquired file hashes agree with the packet’s source records. No source passages were copied into the deliverables.

These checks verify planning statements and their use of the acquired sources. They do not claim to have acquired the Huybrechts/erratum, Beauville, Nikulin, Ogus, Artin, Fontaine–Messing, Elsenhans–Jahnel, Yoshioka, Charles 2018 or Shankar–Tang primary proofs. The corresponding exact-proof and supplier gates remain recorded. Published Li–Liedtke numbering and the stronger nonunirational rigidity branch also remain open.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the actual statements were read:

| Confirmed declaration | Module and scope |
| --- | --- |
| `TauCeti.IntegralLattice` | `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`, lines 58–70: integral symmetric full lattice in a rational ambient space; nondegeneracy is separate |
| `TauCeti.Hodge.HodgeStructureOn` | `TauCeti/Geometry/Hodge/Structure.lean`, lines 62–72: decreasing exhaustive opposed pure filtration, with the specified conjugation |
| `LinearMap.BilinForm` | `Mathlib/LinearAlgebra/BilinearMap.lean`, lines 520–528: the native iterated linear-map abbreviation |
| `TauCeti.Hodge.PeriodDomain.Point` | `TauCeti/Geometry/Hodge/PeriodDomain.lean`, lines 71–80: fixed polarized type; extensionality lines 90–95 |

No baseline citation was removed. The fourth was added to make existing period-domain reuse concrete. The reviewed library audit was checked against current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; searches at both current and pinned revisions found no K3/Mukai/geometric-KS carrier under those terms. This is a scoped search, not a claim that abstract symplectic algebra is absent.

Current upstream reading included the full Completed/HodgeStructures and AlgebraicVectorBundles documents, and the relevant IntegralLattices and OrthogonalSpinGroups README/Suggested contracts. The upstream roadmap checkout was `0d144d04`. Its scope distinguishes the bilinear polar form from the quadratic half-norm, consistent with the packet’s explicit `Q_T=−cup/2` convention. No upstream files were changed or built.

## Closure and validation

All 74 target statements, direct prerequisites, proof sketches, 19 object APIs and 57 tests were checked. The 102 inherited input links still resolve. The eight concrete external C5-node citations were checked against the supplier statements; they provide actual proper/relative/Hodge comparisons, while cup/trace and geometric-family compatibility remain precise requests. The other supplier layers were read for scope. Parent-stage requests extending R09/V6/GZ.6 are explicitly additional Part II obligations.

The early MC.7 (1,1)/Tate–Brauer/trace contracts stay separate from the late K3 Tate register. No final Tate conclusion discharges the partner contradiction. The characteristic-two birationality, p=3 comparison endpoint, global auxiliary power-lift, infinitely many nonsuperspecial partners, relative partner ampleness, all-prime special-fiber algebraicity, low-rank Picard-jump sources and global projective-model comparison remain visible. These are exactly why no stage is marked closed.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/K3SurfacesAndSymplecticBoundedness.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/K3SurfacesAndSymplecticBoundedness.lean`: **success**, using the shared pinned Mathlib build; only 15 admitted-proof warnings. Memory availability was above the required threshold. No build or language server was started in the read-only upstream tree.
- Reader/packet target, API, prerequisite and source-locator agreement; unique node/coverage/review IDs; stage target coverage; sourceIssue review coverage; no new implementation claims; deliverable-path and whitespace checks.

## Orchestrator actions

Register the current upstream IntegralLattices layers before packaging the three recorded imports as machine-resolved dependencies. Route its extra consumer corollaries to its Part II and preserve the named indefinite-finiteness successor boundary. The existing stable/twisted-moduli, orthogonal-integral-model and GSpin-height Part II briefs remain necessary; their absence is not repaired by citing the broad parent stage. Subsequent proof work should discharge the recorded gates before mathematical closure. No new blueprint node, invented stage, independent upstream fix or second worker claim is needed from this run.
