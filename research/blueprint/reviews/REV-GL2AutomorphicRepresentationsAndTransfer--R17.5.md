# Independent review of R17.5

**Verdict: needs_changes.** Issue [#9385](https://github.com/CBirkbeck/tauceti-explorer/issues/9385), job `REV-GL2AutomorphicRepresentationsAndTransfer--R17.5`. Reviewer: Codex, session `codex-4vHwNC`, 14 October 2026. The original blueprint was written by Claude, session `claude-Y032f1`, for [#9414](https://github.com/CBirkbeck/tauceti-explorer/issues/9414), PR #9545. This reviewer did none of that work.

The review is finished. Clear mathematical and documentation corrections are applied to the [packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.5.json), [reader](../readmes/GL2AutomorphicRepresentationsAndTransfer--R17.5.md) and [suggested file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.5.lean). The packet's coverage and status are now `partial`. This is not a checkpoint of an unfinished review.

Acceptance is unavailable because the octahedral source locator could not be independently verified. Five additional mathematical proof contracts are missing from the claimed dependency closure. They are now exact gaps rather than promises incorrectly attributed to existing suppliers. Partial coverage alone would not require rejection; the issue's requirement that every node be verified, corrected or added and justified fails at the uncollated octahedral source. Neither of R17.3's two gaps is retired.

## Counts

| Item | Original | Reviewed |
|---|---:|---:|
| Nodes | 15 | 15 |
| Theorems / lemmas / constructions / applications | 10 / 2 / 1 / 2 | unchanged |
| Node verdicts: verified / corrected / unverifiable | — | 4 / 10 / 1 |
| Nodes added / removed | — | 0 / 0 |
| API items / unit tests | 10 / 4 | unchanged |
| Baseline declarations | 9 | 9 confirmed; none removed |
| Tau Ceti layer requests | 8 | 8, with corrected scopes |
| Explicit gaps | 0 | 6 |
| Source issues confirmed / rejected | — | 1 / 2 |
| Planets in this part / combined R17.5 | 1 / 6 | unchanged |
| Suggested file lines | 412 | 415 |

## Corrections and closure findings

1. **Local normalisation.** The upgrade mixed the half Tate twist of R16.3 with an unshifted standard L-function and determinant equal to central character. R16.3's actual statement says `recᵀ = rec ⊗ ν⁻¹/²`, shifting the L-variable by −1/2 and the determinant by ν⁻¹. The corrected upgrade uses unitary `rec` and geometric reciprocity, with an unramified determinant/factor check. Its direct half-twist prerequisite is removed. The residual and classical applications apply geometric automorphy to **ρ∨**: geometric Frobenius on the dual has the eigenvalues of arithmetic Frobenius on ρ. Thus Deligne–Serre attaches ρ and gives the stated congruences, rather than its dual. The reader states this convention explicitly.
2. **Conductor zero and isolation.** `1 + 𝔭^0` is not the required multiplicative subgroup. Set U⁰ = O× and Uᵐ = 1 + 𝔭ᵐ for positive m. The Lean witness now requires valuation(u) = 1 as well as the bound on valuation(u−1). The proof explains compactness of the norm-bounded subsets of A before concluding that F×A is closed. A is supported **on** S. JL70's printed weak conductor bound supplies the strict bound by increasing the requested integer by one. GlobalNumberFields supplies ideles, congruences and Hecke characters, but does not supply the closed-subgroup character-extension theorem: **G1**.
3. **Twisted Artin functional equation.** ClassFieldTheory Layer 11 explicitly excludes global Weil groups. The statement now uses local Weil groups, finite-image Galois representations, and twists through local reciprocity. Finite global reciprocity turns the Brauer-induction characters into Hecke characters; no global Weil carrier is needed. Arbitrary quasi-characters are handled by unitary characters and real norm-power shifts. The permutation example now has poles at 0 and 1 for the trivial twist, shifted for a norm power. The original imaginary-power-only test was false for general quasi-characters.
4. **Proof order for ε-factors.** R01.2's local ε existence proof already invokes a global functional equation. The final product-of-local-constants equation cannot supply that input. Deligne §3.12(A)–(C), p. 533, provides the preliminary Brauer/Hecke functional equation with a global constant Ae^{Bs}; local existence comes after it, and the final product identification is §5.11, pp. 551–552. The missing preliminary target and induction-constant product proof are **G2**. R16.5's conductor-normalised completion must also be converted back to the product of raw local factors before cancellation.
5. **Brauer reduction API.** A general domain with maps to k and C need not contain the eigenvalues. The API now explicitly assumes that charpoly(ρ(g)) splits into m-th roots in the domain, agreeing with the existing Lean `hsplit` hypothesis. The reader explains that the real-bodied Lean matrix function is totalised on Γ; the conventional Brauer character is its restriction to p-regular elements. The general modular-system roots comparison is Webb Lemma 10.1.1; the R01.1 p-adic algebraic-closure instance does not by itself supply every domain in this API.
6. **Recognition.** The projective–simple Hom dimension supplied by GrothendieckEulerForms is not the Brauer-character Hom formula. Webb Proposition 10.2.1, pp. 174–176, uses projective lifting and vanishing on p-singular elements. The dual-basis assertion also needs Brauer's class count, Webb Theorem 9.3.6, p. 147. Projective covers cannot be inferred merely from the Cartan-pairing contract. These missing modular prerequisites form **G3**.
7. **Fong–Swan.** InductionRestriction Layer 5 has Maschke hypotheses and does not give modular Clifford correspondence when p divides the group order. Remove that purported prerequisite/request. The induction must retain Isaacs Theorem 5.4's automorphism-equivariant strengthened assertion and its degree condition, not just existence of a p-rational lift. Modular Clifford, coprime-index correspondence and the restriction/extension theorems in Isaacs 3.1, 4.1, 4.2 and 5.1 are **G4**. The theorem statement is not a converse characterisation of p-solvable groups.
8. **Descent over arbitrary k.** Finitely many entries in an arbitrary algebraically closed characteristic-p field can generate an infinite field: conjugate a finite-field representation using a matrix involving a transcendental element. The displayed matrices therefore do not descend entrywise by the cited F̄_p result. Choose a finite splitting field using Webb 9.2.6 and descend the simple module **up to isomorphism** through the split semisimple quotient. This needs an explicit finite-algebra/base-change target, **G5**. Characteristic-zero cyclotomic splitting is already in InductionRestriction Layer 6 and is reused. No corrected characteristic-p version of Webb 9.2.7 is silently assumed.
9. **Octahedral source.** The AMS endpoint for Tunnell (1981) returned HTTP 403, including alternate AMS routes; no replacement primary copy was obtained. Its hash and locators are preserved as the original author's evidence, with explicit independent status `not_collated`. The local archimedean argument is checked against Langlands and the cyclic-base-change supplier, but the p. 174 weak-descent locator is not independently verified: **G6**, and one `unverifiable` node verdict.
10. **Coverage.** Remove both `closesGaps` entries and mark the supersessions as proposed. The target statements remain useful; their unclosed chains are not declared planned. The reader's summaries, source discussions, prerequisites, applications and coverage match the corrected packet.

## Node checks

The packet records one verdict and explanation for every node. Names in this table omit the common `GL2AutomorphicRepresentationsAndTransfer:R17.5/` prefix.

| Node | Verdict | Main evidence or limitation |
|---|---|---|
| gl2-twist-stability | corrected | JL70 3.8, pp. 57–58; threshold also depends on π |
| gl2-local-converse | verified | JL70 2.18–2.19, pp. 37–40; BH06 27.1–27.2, p. 170, 27.8, pp. 175–176 |
| isolating-twist-character | corrected | JL70 12.5, pp. 210–211; U⁰ and G1 |
| artin-twisted-functional-equation | corrected | Deligne 3.12, 4.1, 5.11; G2 |
| artin-all-place-upgrade | corrected | JL70 12.2 proof, pp. 210–212; unitary convention |
| tetrahedral-artin-all-places | verified | Langlands §2, p. 14, §3(i), pp. 16–19; JL70 12.1 |
| octahedral-artin-all-places | unverifiable | Archimedean argument checked; Tunnell collation G6 remains |
| brauer-character | corrected | Webb 10.1.1–10.1.3, pp. 170–171; splitting condition |
| brauer-character-recognition | corrected | Webb 9.4.8, 10.2.1–10.2.3; G3 |
| fong-swan | corrected | Isaacs 1.2, 1.4, 3.1, 4.1, 4.2, 5.1, 5.4; G4 |
| solvable-integral-lift | corrected | Webb 9.2.6, 9.4.6–9.4.12; conjugacy descent G5 |
| involution-oddness-under-reduction | verified | det(A)² = 1 in a domain; characteristic-two counterexample |
| odd-solvable-residual-lift | verified | Conditional finite-image quotient and same-kernel argument; G3–G5 stay visible through its prerequisites |
| solvable-residual-modularity | corrected | BCGP 10.1.3, p. 474; RT83 §1, p. 4; dual convention |
| q-solvable-residual-weight-one | corrected | DP21 1.3, p. 3; DS74 4.1, 4.6, 4.10–4.11; arithmetic factors |

“Verified” in this table checks the stated deduction from its explicit inputs; it does not claim that an input with a recorded gap has been formalised or closed.

## Baseline and supplier audit

All nine declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti baseline is `f790474821cf4256814db967cb154e7af3d0c369`. No baseline citation was removed or renamed.

| Declaration | Pinned module | Provides |
|---|---|---|
| Group.IsSolvable | GroupTheory/Solvable | Derived-series solvability class |
| IsDedekindDomain.HeightOneSpectrum | RingTheory/DedekindDomain/Ideal/Lemmas | Nonzero prime ideals |
| Localization.AtPrime | RingTheory/Localization/AtPrime/Basic | Prime localisation carrier |
| Matrix.GeneralLinearGroup | LinearAlgebra/Matrix/GeneralLinearGroup/Defs | Matrix units |
| Matrix.GeneralLinearGroup.det | same | Determinant homomorphism to units |
| Matrix.GeneralLinearGroup.map | same | Base change along a ring homomorphism |
| Matrix.charpoly | LinearAlgebra/Matrix/Charpoly/Basic | Characteristic polynomial |
| Representation.IsIrreducible | RepresentationTheory/Irreducible | Simple lattice of subrepresentations |
| rootsOfUnity | RingTheory/RootsOfUnity/Basic | Subgroup of units satisfying ζ^m = 1 |

The reviewed library audit contains no existing Brauer-character/Fong–Swan development to duplicate. Current Tau Ceti was also searched at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; similarly named Swan results about projective modules do not supply this theorem. Current TauCetiRoadmap was read at `0d144d044dacebca17b654695b6f1ad58f159b27`, including InductionRestriction and GlobalNumberFields in full, and the relevant ClassFieldTheory and GrothendieckEulerForms contracts. No lake command was run in either read-only checkout.

All **42 distinct external node statements in the original packet** were read, including their hypotheses and proof sketches. The corrected packet uses 40 of them. The two removed dependencies are the half Tate bridge in the unshifted upgrade and the F̄_p-only descent in the arbitrary-k integral-lift proof. The eight current Tau Ceti requests are GlobalNumberFields Layers 1, 6, 7, 9; InductionRestriction Layer 6; ClassFieldTheory Layer 11; GrothendieckEulerForms Layer 4; and ModularForms Layer 4. Their scopes are stated explicitly. The modular extension of Clifford theory is a proposed owner change in G4, not a request pretending that existing Layer 5 supplies it.

## Sources and source issues

The reader and packet give exact locators, public URLs, source versions and hashes. Ten of eleven sources were independently read at the cited locators; the restricted BH06 source was read only in the maintainer-cleared copy. No source passage or file was copied into the repository. For Tunnell the original author's record is distinguished from independent verification.

- **E16 rejected.** The [BCGP proof](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), p. 474, invokes classification together with Tate. The blueprint has not established that their combined standard argument fails. Fong–Swan is a useful formal proof expansion; it is insufficient evidence for the alleged published-source gap.
- **E17 rejected.** [Dieulefait–Pacetti v2](https://arxiv.org/pdf/2108.07577v2), Theorem 1.3 proof, p. 3, asserts a lift of the residual representation itself. It does not claim that an arbitrary projective lift suffices or invoke Tate for this step.
- **E18 confirmed for the prepublication remarks only.** [Webb's author version](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), pp. 144 and 148, omits the prime-to-p qualification on roots after reduction. A cyclic p-group has only the trivial simple in characteristic p and needs no primitive p-th root. The printed Theorem 9.2.7 itself is not contradicted: its full-exponent hypothesis can be vacuous in characteristic p. The published Cambridge edition was not collated. The proof route uses finite splitting-field existence instead of assuming a modified theorem.

The original search records for source errata are retained as author records; they are not represented as fresh independent errata searches. Every source issue has the required independent verdict and reason.

## API, tests, planets and handed findings

The single construction has a real body, ten API items and four tests. Its rank-one lift, F₂/C₃ value −1, rank-p identity value p rather than zero, and sign reduction at p = 3 distinguish the Brauer character from a lifted modular trace. The comparison API's splitting hypothesis is the substantive correction. The suggested file transparently states only narrower milestones where the README's full carriers are missing. It contains no placeholder data definition. The elementary oddness proofs and three examples remain intact.

The added planet is the named Fong–Swan theorem. R17.3 already supplies five R17.5 planets, so the combined six-planet limit is respected.

**RT-AREA-automorphic-1/1:** the new isolation upgrade uses GL₂ local theory, not an additional GL₃ converse theorem. The weak tetrahedral and octahedral inputs still inherit R17.3's R17.4a/AL.3b and JPSS proof work; this review does not discharge it or re-plan current upstream mathematics.

**RT-AREA-automorphic-1/11:** explicit R16.3/R16.4/R16.5/R16.6 → R17.5 links and the direct global-functional-equation/classical-comparison prerequisites remain. The normalisation adapter and conductor-completion conversion are now explicit. Maintainer wiring of same-roadmap stage edges remains necessary.

## Validation and orchestrator actions

- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R17.5.json --index <pinned declarations.tsv>`: **0 errors, 0 warnings**, using the shared pinned declaration index.
- `lean-check research/blueprint/suggested/GL2AutomorphicRepresentationsAndTransfer--R17.5.lean`: **exit 0**, 17 warnings, all `declaration uses sorry`, with no other warnings or errors. Available memory was 106 GiB before compiling. This checks signatures and the small completed examples, not the placeholder proofs.
- Packet/reader field consistency, node verdict coverage, source-issue verdict coverage, allowed paths, and `git diff --check` were checked. The atlas requires/stageEdges graph plus the corrected packet edges has no path from a supplier back to R17.5.

The next revision should discharge G1–G5 as explicit targets with owner-level prerequisite closure and independently collate G6. The orchestrator should assign the character-extension foundation, modular finite-algebra/Clifford owner work, and the R01.2 preliminary functional-equation prefix. It should retain the R17.3 gaps and proposed supersessions until that work is complete. The packet's `upstreamNotes` records findings concerning existing owners without editing their files.
