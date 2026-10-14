# Independent review of GL₂ transfer, R17.6

**Accepted after corrections as a complete target-level pass, with R17.6 planned and not closed.** Reviewer: Codex (GPT-6), session `codex-oIRXsf`, 14 October 2026, issue [#9386](https://github.com/CBirkbeck/tauceti-explorer/issues/9386). The input was written by Codex session `codex-PrYXzU`, issue [#9415](https://github.com/CBirkbeck/tauceti-explorer/issues/9415), [PR #9561](https://github.com/CBirkbeck/tauceti-explorer/pull/9561), commit `1297ebc7d`. This reviewer did not write that input.

The review covers the R17.6 packet, reader and suggested file, including all fifteen imported canonical targets after applying their same-id refinements. It follows the accepted RS-21 scope, the target granularity in `detail.json`, both protocols and the upstream guide. No source passages were copied into any deliverable. No canonical or supplier packet was edited.

## Counts and verdict

| Item | Reviewed result |
| --- | --- |
| Effective targets | 18: 15 canonical imports and 3 existing additions |
| Kinds | 1 construction, 10 theorems, 4 applications, 3 comparisons |
| Node verdicts | 15 verified, 3 corrected, 0 added, 0 unverifiable |
| Construction API / tests | 7 / 6, increased from 5 / 5 |
| Planets | 6: five retained and one already added |
| Pinned declarations | 12 confirmed; none removed or replaced |
| Public primary sources | 9 PDFs; all packet SHA-256 hashes matched |
| Direct supplier contracts | 45 examined; 44 retained after removing one unnecessary import |
| Open proof gaps | 3: G1, G2 and added G3 |
| Requests | 3 open R15.2 contracts; 7 supplied upstream-layer imports |
| Local source findings | E20–E23, all independently confirmed |
| Suggested Lean | 139 lines, 7 named statements, 10 examples; elaborates |

The issue explicitly permits acceptance of a planned pass with honest open gaps. The corrected proof sketch makes the newly discovered failure explicit, and coverage does not claim closure. G1/G2 remain geometric proof interiors; G3 is a separate auxiliary-level removal argument. All eighteen targets, their direct prerequisite contracts, API and tests are accounted for. The remaining supplier ownership reconciliation is explicit; this review does not certify a closed transitive graph.

## Corrections

**Katz auxiliary-level comparison.** In Wiese’s published proof of Theorem 9, pp.130–131, the two normalized forms at Nℓ₁³ and Nℓ₂³ agree at primes, but their q-expansions differ. At the first auxiliary prime, the zero-U form has a_{ℓ₁²}=0. The other form is good there; its weight-one recurrence gives a_{ℓ₁²}=a_{ℓ₁}²−ε(ℓ₁)=0−1=1 in characteristic two, because the selected residual Frobenius is identity. Proposition 7 pullback preserves q-expansions, so these forms cannot become the same form by that pullback. The same failure is present in the thesis, Chapter I §1.4, proof of Theorem 1.4.1, p.9.

Added confirmed source error E23 and gap G3. This is a false comparison in the proof, not a counterexample to Theorem 9. A replacement must establish auxiliary-level removal and preserve all cusp conditions, character and the required eigenpacket, including scalar and nonsemisimple Frobenius at 2. Stabilizing at both primes fixes that coefficient discrepancy but does not establish independence, so it is not recorded as a completed repair. The conditional Proposition 7/Corollary 8 supplier contract remains valid; it cannot supply its own independence premise.

Replaced the varying-level finite-Hecke-algebra selection argument by the source’s fixed finite monomial-image bound on the finitely many bad-prime coefficients. This justifies prime-coefficient selection only. Removed the unsupported Katz primitivity/minimality wording: level N denotes the carrier at N=N(r̄). Removed the unused broad R15.6 modularity-equivalence prerequisite. Its characteristic-zero witness equivalence is unnecessary for this Katz conclusion.

**Weight-one T₂.** Added the direct R15.3 Frobenius/Verschiebung formula and made the existing R15.2 oldform request explicitly include the geometric weight-one T₂ action at the prime-to-two levels used. A formal U+⟨2⟩V q-expansion formula alone does not construct that action. Existing integral Hecke statements have weight/level restrictions, which are retained rather than silently broadened.

**Eigencomponent API.** Added rational projector/inclusion/projection laws, map extensionality and unique factorization through the projection. Added a splitting test that distinguishes the f-factor from the whole cohomology. The projector is after correct finite-level descent and in the arithmetic dual convention; it makes no integral idempotent assertion. Its higher-weight existence/comparison remains G1.

**Source-finding identifiers.** The input’s E12/E13/E14 collide with existing R16.1 findings. Renamed only this packet’s entries to E20/E21/E22, updated their local references, and registered the new Katz proof finding as E23. Earlier packets retain E1–E19 unchanged.

**Evidence and presentation.** Added Wiese’s proof of Theorem 10, p.131, as the precise determinant square-root/unramifiedness locator, without importing general weight/level lowering. Corrected the reader’s stray comma in the twice-trace square. Updated all twelve baseline reading receipts and completed `sourceVersions` with kind, URL, date and hash. Added the standard definitive-reader note and contributor credit to the suggested file. Added C³=0 and C²≠0 checks for the nilpotent companion matrix; the former nonzero check alone did not express nilpotency index three. Synchronized all changes in the reader.

## Per-target review

The names below are the suffixes of `GL2AutomorphicRepresentationsAndTransfer:R17.6/` identifiers. Each full identifier has a verdict in `review.checked`.

| Target | Verdict and evidence |
| --- | --- |
| `classical-eigencomponent` | **corrected**. Scholl §§1.2.0–1.2.4 and §4.2.0 plus DDT Lemma 1.48 support the rational f-factor/weight-two input. Added projector splitting, map extensionality/factorization and a regression test; higher-weight comparison remains G1. |
| `classical-galois-realization` | **verified**. Deligne §§3.12, 3.18, 4.8–4.9 and Scholl §4.2.2 give the full good polynomial after arithmetic/cohomological duality. R01 supplies stable reduction and full-polynomial recognition; G1 is explicit. |
| `classical-residual-conductor-bound` | **verified**. DDT Theorem 3.1 and Carayol §§0.7–0.8, 11.1–11.4 support the odd-prime characteristic-zero conductor. R01 supplies residual inequality; nonzero special monodromy remains G2. No equality or q=2 local comparison is inferred. |
| `solvable-dihedral` | **verified**. The reviewed R01.4 dyadic solvable-image statement and Wiese introduction apply to finite absolutely irreducible mod-two representations; an odd rotation order and scalar determinant are retained. |
| `determinant-untwist` | **corrected**. Added the precise proof-of-Theorem-10 p.131 locator for the odd-order determinant square root and dyadic unramifiedness. The pinned determinant/scalar/projective maps apply; twisting back records the actual level. |
| `teichmuller-conductor` | **verified**. RT §2 pp.306–307 supplies all four dyadic cases. Odd-prime fixed-space dimensions survive reduction even for a nonidentity unipotent reflection. The excluded discriminant-4 case is retained in the comparison. |
| `rt-technical-lemma` | **verified**. All three RT §1 cases pp.299–306 were read, including both integral twice-trace calculations and the ν=3 level-divisor cases. Character, b(2), b(r), normalization and conductor lower-bound hypotheses match; G1/G2 and actual-module DS lifting remain explicit. |
| `serre-odd-trick` | **verified**. RT §2 pp.308–309 uses the specified real signature, ray class, auxiliary prime and trace-not-one condition. Its modulus and trace condition are distinct from Wiese’s identity-Frobenius selection. |
| `rohrlich-tunnell` | **verified**. RT theorem pp.307–308 is linear-dihedral, with weight two for odd D, weight four for 8|D and no discriminant-4 case. Scalar untwisting is a separate operation with separately recorded level. |
| `wiese-odd-lift` | **verified**. Wiese Lemmas 2–3 pp.125–127 distinguish unrestricted odd lifts from the unramified conductor-controlled Nℓ route. Inherited E6 supplies the conjugate ray modulus needed for both inducing characters. |
| `unramified-katz` | **corrected**. Theorem 9 states the level-N Katz target, but its comparison is false at ℓ₁². Recorded confirmed E23 and G3, corrected prime-only agreement, removed unsupported Katz primitivity wording, and added the R15.3 T₂ formula plus a precise geometric-operator request. Conditional descent is not claimed to prove independence. Removed the unused broad R15.6 modularity equivalence prerequisite; the level-N Katz conclusion needs no characteristic-zero witness equivalence. |
| `qualitative-residual-modularity` | **verified**. Wiese Lemma 3 and the initial weight-one application on p.130 use the already-given odd induced Artin lift, so unrestricted modularity does not depend on the later Katz level-removal failure. |
| `weight-two-witness` | **verified**. DS Theorem 6.7, §§6.8–6.13 and the read R15.5 module-reduction contract justify full-algebra lifting after E₄ weight change. The exact weight-two Katz branch remains conditional on cusp base change and G3; the unconditional weight-five witness remains available. |
| `disjoint-irreducibility` | **verified**. Disjointness from the projective-kernel field gives the same operator image after determinant normalization. Equal invariant subspace lattices then preserve irreducibility; no Maschke or characteristic-zero criterion is used. |
| `quadratic-restriction` | **verified**. The index-two eigenline/Mackey argument works in characteristic two. Distinct inducing characters are the irreducibility criterion; extension-character ambiguity is derived using arbitrary-characteristic Schur. The pinned characteristic-zero induction theorem is only a boundary citation. |
| `compatible-base-change` | **verified**. AC Chapter 3 Definitions 1.1–1.2, Theorem 4.2 and Theorem 5.1 support the supplied cyclic/solvable transfer. Matching uses both roots raised to residue degree and fixed coefficient embeddings; attachment is conditional. |
| `compatible-descent` | **verified**. AC Chapter 3 Theorem 3.1 and Theorem 4.2 give the cyclic invariant descent fiber, through the exact R17.4 supplier nodes. Full compatible polynomials select a single finite twist across λ; determinants alone do not. |
| `potential-modularity-interface` | **verified**. The extending irreducible family, solvable Galois tower, prescribed local transfer and descent-selection conditions are explicit. AC transfer is used conditionally; no potential-modularity existence or nonnormal cubic descent is asserted. |

## Source reading and source findings

The complete source ledger, versions, hashes and per-node locators are retained in the corrected packet and reader. The material needed for every effective target was read at those locators:

- [Rohrlich–Tunnell](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf): §1 pp.299–306, all three technical-lemma cases, both integral trace calculations and the ν=3 level-divisor reductions; §2 pp.307–309, the conductor cases, exact theorem and real-signature construction.
- [Wiese 2004](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf): introduction and Lemmas 2–3 pp.123–127; Proposition 4/Corollary 5 pp.127–128; Definition 6, Proposition 7/Corollary 8 pp.129–130; Theorem 9 pp.130–131; determinant-character argument in Theorem 10’s proof p.131; Lemma 11 p.132 for the boundary. The [thesis](https://math.uni.lu/wiese/thesis/Thesis.pdf), Chapter I pp.1–3, Proposition 1.3.1 pp.5–6 and Theorem 1.4.1 proof p.9, was compared. The one-page [2005 errata](https://math.uni.lu/wiese/thesis/Errata.pdf) and [publication list](https://math.uni.lu/~wiese/pub/index.html) were checked; neither lists E23.
- [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf): §6 pp.520–523, including Theorem 6.7 and the actual reduction-module/lattice comparison in §§6.8–6.13. Lifting an eigensystem does not lift an arbitrary prescribed mod-two vector.
- [Scholl author copy](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf): §§1.0, 1.2.0–1.2.6, author pp.1–3; §1.4.2 p.4 for the reference check; §§4.0–4.2.4 pp.8–9 for the rational f-projector, finite GL₂-level descent and both-root argument. The [correction note](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf_corr.html) was checked. The replacement Chapter 7 and final journal version were not collated, and no claim is made about their wording.
- [Deligne Bourbaki](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf): §3.12 p.155, Proposition 3.18 p.158 and §§4.5–4.9 pp.163–167. Page images of pp.166–167 confirm that the geometric F is inverse arithmetic Frobenius and FV=q^{k−1} after translating the coefficient exponent to weight k.
- [Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf): §§0.1–0.11 pp.409–412, §§11.1–11.10 pp.449–454 and §12.3 pp.458–459. The special-case monodromy proof is not replaced by semisimplified local parameters; extraordinary dyadic cubic comparison remains excluded.
- [Darmon–Diamond–Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf): Lemma 1.48/Theorem 1.50 pp.45–46 and §3.1 pp.84–87, using the author PDF’s internal pagination.
- [Arthur–Clozel](https://www.claymath.org/library/cw/arthur/pdf/30.pdf): Chapter 3 Definitions 1.1–1.2 pp.199–200, Theorem 3.1 p.201, Theorem 4.2 pp.202–203 and Theorem 5.1 pp.212–213. These are the transfer/descent contracts used through R17.4; this is not a claim to have independently reconstructed the full trace-formula proofs.

E20 is confirmed from Wiese’s published p.127 and the thesis comparison: the printed oldform list omits the middle index that the defining map and matrix require. E21 and E22 are confirmed from Scholl’s author-copy page images: the theorem references should be to 1.2.4, and the undefined coefficient field E should be L. Their verdicts remain restricted to that copy. E23 is the prime-square proof error above. All four have explicit reviewer verdicts. Inherited E1/E3/E6/E7 retain their canonical registration and prior reviews; they are not duplicated or relabelled as this worker’s findings.

## Pinned baseline and ownership

The full declaration statements and section hypotheses were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

| Pinned file | Confirmed declarations and use |
| --- | --- |
| Mathlib `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | `Matrix.GeneralLinearGroup`, `det`, `map`, `scalar`, `det_scalar`: existing matrix-unit carriers and determinant/scalar identities, with the commutative-ring assumptions where required |
| Mathlib `LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean` | `Matrix.ProjGenLinGroup`, `mk`: quotient by the center and its homomorphism; over a field the center is scalar |
| Mathlib `RepresentationTheory/Irreducible.lean` | `Representation.IsIrreducible` and `Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed`: invariant-subspace lattice and finite-dimensional algebraically closed Schur, in arbitrary characteristic |
| Mathlib `LinearAlgebra/Matrix/Charpoly/Basic.lean` | `Matrix.charpoly_diagonal`: product of linear factors over a commutative ring |
| Tau Ceti `LinearAlgebra/Matrix/GeneralLinearGroup/Solvable.lean` | `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`: a boundary statement, with the nonzero a and a²≠1 hypothesis; no arithmetic modularity conclusion |
| Tau Ceti `RepresentationTheory/Induction/Mackey/LinearCharacter.lean` | `TauCeti.simple_indFDRep_ofLinearCharacter_iff`: finite group, algebraically closed field and characteristic zero; retained as a boundary citation, never applied to characteristic two |

No baseline citation was removed or replaced. The characteristic-two quadratic-induction signature uses the real pinned induction carrier and the direct eigenline proof target, not the characteristic-zero criterion.

All direct supplier statements were read in the accepted R01, R14, R15 and GL₂ packets. Their weight-two geometric statements do not close G1, and the R16 conductor-preserving LLC does not close G2. No generic cohomology, witness, induction or Katz carrier was duplicated. The reviewed library audit, AUDIT-14 and the accepted RS-21 keeps clause were checked.

Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were read without building there. The ModularForms and InductionRestriction README convention/consumer sections were read, including the arithmetic slash/Fricke normalization and arbitrary-characteristic Mackey boundary. All nine post-snapshot roadmap families and the current library were screened for overlap; relevant LocalGaloisGroups, ProfiniteArithmetic and AlgebraicVectorBundles carriers were inspected. The current modular-function `GaloisProd` module is a product of translates, not an attached representation. Nothing from those existing owners is replanned.

## Validation and handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R17.6.json` reports **0 errors and 0 warnings**. An errata-only scratch projection of `sourceIssues` and `sourceVersions` passes `scripts/check_errata.py`; that checker expects an `errata-v1` document, not a blueprint packet.

An independent scratch check applies all fifteen refinements to the canonical import at its recorded SHA-256, verifies the eighteen unique identifiers and review entries, checks all direct supplier nodes resolve to accepted packets, finds no cycle among the effective R17.6 nodes and no direct R19 prerequisite, matches every statement/hypothesis/proof/check/source locator plus the construction API/tests and all three open requests against the reader, and confirms the six planets and nine source hashes. This does not certify global transitive closure through unchanged suppliers.

`lean-check` exits **0** at the pinned shared build, with exactly seventeen declaration-uses-`sorry` warnings and no other diagnostics. The suggested file has no data definitions and states only targets/examples whose carriers exist at the pins. `git diff --check` passes. Nothing is claimed formalised.

The orchestrator must preserve G1/G2/G3 and the three supplier requests at assembly, apply refinements before inspecting canonical dependencies, and reconcile R19/R15.6 ownership as detailed in the handoff. In particular, R15.6’s witness and modularity-equivalence nodes still carry actual R19 attachment prerequisites. Its witness constructor must consume supplied representation/lattice data; repointing applications must not create a definition-level R15.6↔R17.6 cycle. This is an explicit remaining assembly task, not a reason to duplicate that witness here. There is no question requiring user input for completion of this review.
