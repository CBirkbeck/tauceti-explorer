# Independent review: ArithmeticKTheoryPartII

**Verdict: accepted after corrections, as a complete planning pass.** Reviewer: Codex, session `codex-ceIYIG`, job `REV-DESIGN-ArithmeticKTheoryPartII`, issue [#3497](https://github.com/CBirkbeck/tauceti-explorer/issues/3497), 2026-10-19. The design was by the distinct session `codex-2LdeNX` on [#3437](https://github.com/CBirkbeck/tauceti-explorer/issues/3437). This review does not close a proof plan or claim implementation.

The roadmap definition, packet, definitive reader and suggested file were reviewed together and corrected in place. The packet has 42 targets: 29 theorems, nine constructions, three definitions and one comparison. Its checked table records 22 corrected targets and 20 verified targets; all 42 source matches were replaced by specific explanations of support and qualifications. There are no added or unverifiable nodes. All eight baseline citations are confirmed; none was removed. All 19 source findings have individual independent verdicts. The final contracts contain 48 API items, 37 definition/construction tests, 40 planets, 24 open supplier requests and three explicit gaps.

## Sources and independent evidence

Read the whole version of record, including Appendix A: Tony Feng, Søren Galatius and Akshay Venkatesh, *The Galois action on symplectic K-theory*, Inventiones Mathematicae 230 (2022), 225–319, [DOI](https://doi.org/10.1007/s00222-022-01127-8), [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf). The PDF SHA-256 is `5da9a2b28d13b2b22a262a81650188025020d92238ec2b47404d177ef91d7b4d`. Every target was checked at its journal locator. The [arXiv history](https://arxiv.org/abs/2007.15078), publisher information and bounded title/erratum searches were checked on 2026-10-19; no correction was located by those searches. This does not establish novelty or exhaustive absence.

Statements and source-finding reasons are in our own words. No source excerpt was found or added. No restricted book was used. Secondary theorems cited by FGV are imported through their owners' statements and exact requests; this review does not claim to have read all their original proofs.

## Corrections made

1. **CM reciprocity signatures and stable classes.** AK2.5/cm-reciprocity and R12 had restricted the translating line to be positive, contradicting Theorem 6.6 and its conjugation example on pp. 277–278. The corrected line lies in P⁺ and may have negative archimedean signatures. For conjugation it is `(O,−1)`, which changes the type. Positivity instead belongs to the subgroup acting by the Serre tensor construction. Added the indispensable stable Bott-linearity from Theorem 6.6(ii), its proof route and the mod-3 iterated-map qualification. Without that input the later finite-action calculation did not yet follow from the stated reciprocity target. The matching rescope proposal and roadmap description were synchronized.

2. **Local place choice.** AK2.7/local-homology had required a conjugation-fixed prime in Q(p). The source's §7.5 setup, pp. 289–290, chooses compatible fixed primes in H∞, then extends that place arbitrarily to Q(p). The corrected statement requires c in the image D_q, which is enough for the splitting, without asserting c in the selected G_𝔭. The proof and acceptance check now identify precisely where the fixed-prime condition is used.

3. **Native bar differential.** Read the pinned `groupHomology.inhomogeneousChains.d`; its first face uses the inverse action. Made the comparison explicit through degree two: T₀=id, T₁([g]⊗m)=[g⁻¹]⊗m and T₂([g,g′]⊗m)=[g′⁻¹,g⁻¹]⊗m. For example, the native degree-two boundary becomes `[g⁻¹]⊗g′m − [(gg′)⁻¹]⊗m + [g′⁻¹]⊗m`, the image of the FGV boundary. These maps preserve subgroup chains. R13 retains the full natural chain comparison as a supplier obligation. Added a C₃/F₇ test with action by 2 and inverse action by 4; the existing C₂ sign example cannot detect this distinction. The new scalar Lean example is proved.

4. **Nonvacuous continuous reduction.** The old finite-level test assumed both finite-free Z_p coefficients and annihilation by p^n, leaving only the zero module. Replaced it by Γ=C₂, H=1, M=Z_p with sign action. Relative H₁ is Z_p and the universal action is c(m,t)=(−m,t+m). Its reduction has kernel Z/p^n and recovers the sectioned finite category. The API now states exact reduction for finite-free M and identifies the reason the Tor obstruction disappears. Added a proved Lean check of the involution formula modulo 5. The chosen H-section matters: forgetting it changes this test's category.

5. **Tangent versus dual Hodge pairing.** The c_H construction in §3.3 and CM tangent calculation on p. 284 use Lie(A), whereas §8 uses ω=Lie(A)^∨. AK2.8 and R4 now explicitly use ĉh_m(ω)=(−1)^m ch_m(ω)=ch_m(Lie(A)) for the Bott-normalized pairing. For odd m the raw Hodge character has the negative pairing. The family proof absorbs that unit sign; its divisibility theorem is unchanged. This clarifies the design's normalization and is not an additional claim of a false theorem in the source.

6. **Locators, source support and tests.** Corrected Corollary 2.12 to pp. 245–246, the end of CM generation to p. 273, the cocycle equations to (7.12)–(7.19), and the finite universal proof to §7.3, pp. 285–287. Distinguished Remark 7.11 from Lemmas 7.12–7.13. Included the stable polynomial calculation's introductory pages and the tangent identification in the Hodge locators. Replaced all generic source-match sentences by concrete support statements. Reclassified all 36 original tests using PROTOCOL §12's five permitted kinds, changed proposed names to ordinary Lean identifier forms, and sharpened the same-type CM test to an explicit equality/difference formula. The extra bar test brings the count to 37.

7. **p-primary versus principal ideal class.** In AK2.6/finite-action, an automorphism fixing H_q has a translating ideal with trivial p-primary class, rather than necessarily a principal ideal. Its class vanishes modulo q and its CM type is fixed, which suffices for the mod-q detection argument in Lemma 7.7, pp. 282–284. The reader and packet proof sketches now make that distinction.

## Baseline and current ownership

Read the actual statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including hypotheses and surrounding conventions:

| Declaration | What the pinned statement actually supplies |
| --- | --- |
| `Representation`, `Mathlib/RepresentationTheory/Basic.lean` | A monoid hom to linear endomorphisms for semiring, monoid, additive commutative monoid and module carriers. The roadmap's ring/group hypotheses specialize it. |
| `LinearMap`, `Mathlib/Algebra/Module/LinearMap/Defs.lean` | Semilinear maps over a ring hom, with ordinary linear maps obtained using the identity hom. |
| `CommRing.Pic`, `Mathlib/RingTheory/PicardGroup.lean` | Units in the skeleton of the semimodule category, over a commutative semiring. This supplies components, not the higher Picard-to-K construction. |
| `Module.Invertible`, the same module | Bijectivity of dual contraction, with the finite-projective and tensor-equivalence API. No second invertibility carrier is planned. |
| `groupHomology`, `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean` | Homology in a natural-number degree of the absolute native chain complex, for a `Rep` object over a commutative ring and a group. |
| `groupHomology.inhomogeneousChains`, the same module | Direct-sum inhomogeneous chains with inverse action in the first face. It does not itself supply relative or completed homology. |
| `CategoryTheory.Under`, `Mathlib/CategoryTheory/Comma/Over/Basic.lean` | The undercategory with arrows commuting over the fixed source, in the direction required by the universal kernel map. |
| `TauCeti.SymplecticForm.exists_compatible`, `TauCeti/Geometry/Symplectic/ExistsCompatible.lean` | Existence for finite-dimensional real symplectic spaces with positivity ω(v,Jv)>0. It does not give contractibility. For the linear-first source form it is used with −J_H; R4 owns the additional topology. |

The reviewed library-coverage entries and supplier statements were checked, including exact nodes for arithmetic finite generation, Bott descent, polarized Hodge equivalence and Siegel uniformization, CM classification/tensor/reciprocity, Poitou–Tate, graded étale realization, Γ group completion, Moore coefficients and Milnor sequences. Broader stage imports are not treated as if they already supplied stronger theorems: the 24 requests spell out the missing interfaces.

Current readonly TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked. Read the full GrothendieckEulerForms and AlgebraicVectorBundles README/Suggested pairs as current structural models. Searched the actual signatures across all nine post-snapshot roadmap families, including OperatorTheory's subpackages, and the current library for the proposed higher symplectic and relative-extension targets. No duplicate target was located. ProfiniteArithmetic's scope explicitly leaves cohomology and arithmetic Galois objects to their suppliers; it does not own the relative extension theory here. No Lake command was run in that environment.

Generic tensor K-theory remains K.7/S.6; higher skew Hermitian theory remains GN.6; generic spectra and Γ constructions remain H.4–H.6; CM reciprocity remains CM.2; ppav atlases remain PELModuli/A5; completed homology remains R02.1/R02.2. Requests to current ClassFieldTheory, Chebotarev and AlgebraicTopology extend their interfaces without replanning their theories. No mathematics was moved from a higher tier and no other owner's files were edited.

## Target closure and scope

Every target of each of the nine planned stages is realized by a node. The local graph is acyclic. In particular type realization and the character-sum unit argument prove Hodge surjectivity independently; the Betti–Hodge splitting is then available to prove CM generation. The finite action uses the corrected reciprocity and Bott-linearity, the finite universal property uses the explicit relative cocycle, and the p-adic/local statements retain the completed and local-pair contracts. The indecomposable application uses the strict prime inequality and safe even Hurewicz degrees.

All 12 definitions/constructions have uses, four API items and at least three tests. The APIs expose the intended components, functoriality, normalizations and universal properties without needing to unfold carriers. The 40 planet names identify mathematical objects and theorems and remain within the layer budgets. The 36 routed continuation items all point to existing local targets or retained owners.

Acceptance preserves these open obligations:

| Gap | Exact limit of this pass |
| --- | --- |
| G1 | Integrate EH.6/G7 and R22's coherent graded ppav Γ realization, including the Moore construction before completion at p=3, products, automorphisms, reductions and limits. A comparison in a homotopy category alone does not close the spectrum-action proof. |
| G2 | The source's Hurewicz endpoint 2p−2 needs treatment of the possible delooped P¹ extension. The planned positive integral finite-type theorem stops at 2p−3; the even applications use at most 2p−4. |
| G3 | The equality p=max n_j is not justified by factorial integrality. The planned family theorem assumes p>max n_j. No counterexample to the printed endpoint is asserted. |

Every stage remains **planned**, with a precise remaining list; none is closed. Every implementation status remains **unchecked**. The packet's status **complete** means one finished target-level planning pass under the budget. The review accepts what it plans while leaving its explicit gaps and requests open, as the review issue instructs.

## Source findings

All E1–E19 were independently checked and confirmed, with separate reasons in `sourceIssues[*].review`. The qualifications below matter; a source-proof gap is not a verified counterexample.

| Finding | Locator and independent conclusion |
| --- | --- |
| E1 | §4.1, p. 259: faithful H₁ has rank 2g; a CM elliptic square has a matrix endomorphism algebra. State the bound for the chosen commutative CM algebra and its order. |
| E2 | Lemma 4.8, pp. 266–267: real embeddings are those of the real subfield, and ramification is above the rational prime p. |
| E3 | Proposition 6.1, p. 275: CM genus is φ(q)/2. The larger displayed bound is still valid by rational stabilization. |
| E4 | Theorem 6.6, p. 277: the lift product fixes E, giving Gal(H/E) in place of the undeclared K. |
| E5 | Definition 7.3, p. 280: πs=id_M, while sπ is a projector on V. |
| E6 | §7.3, p. 286: the degree forces β^{2k−1}, with the reduced ideal factor as in the adjoining comparison. |
| E7 | Theorem 7.8, p. 289: use the Hilbert-tower group Γ and finite Theorem 7.1. |
| E8 | Remark 7.9, p. 290: uniqueness concerns c-fixed primes; uniqueness in the whole prime torsor requires vanishing of both class-group signs. |
| E9 | §7.7 and footnote 13, p. 294: the splitting theorem is 3.5 and the local even twist is 2k. |
| E10 | Theorem 8.1, p. 296: the equality boundary lacks the stated integral Chern-character step; G3 records the missing proof. |
| E11 | (8.2)–(8.3), pp. 297–298: distinguish the denominator from the quotient and ordinary homology from completed coefficients; use positive integral finite type. |
| E12 | Theorem 8.4 proof, p. 299: the endpoint splitting requires another argument; G2 retains it rather than asserting the conclusion false. |
| E13 | Remark 8.2, p. 297: the volume and Torelli descriptions are interchanged; this has no effect on a target. |
| E14 | A.2 property (iii), p. 305, and A.5, p. 315: apply completion to finite-type connected grades. Proposition A.2 on p. 309 already states finite-type hypotheses; the finding concerns the unqualified use and infinite genus union. |
| E15 | Definition A.1 and examples, pp. 301, 303–304, 314: the selected-factor category at {*} is equivalent to terminal, with contractible nerve; it has multiple ambient objects. |
| E16 | Example A.10, p. 311: smoothness of a map does not force a smooth base, and Čech degree r has r+1 factors. The ppav application uses smooth atlas pieces. |
| E17 | A.4–A.5, pp. 313, 317: the polarization defines Rosati; fixed genus contains many discrete isomorphism-class components. |
| E18 | §3.4–§3.5, pp. 254–256: rank and the printed proof give c_BH=1+ψ⁻¹, twice the identity on the positive factor; divide retraction or inclusion by two. |
| E19 | Definition 2.6 discussion, p. 239: multiplication by 3/2 carries 2Z to 3Z; fraction-field scalars give arrows between ideals, ring units only their automorphisms. |

No additional published-source finding was needed for the design errors corrected in this review.

## Validation and orchestrator handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheoryPartII.json`: zero errors and zero warnings after corrections.
- `lean-check research/blueprint/suggested/ArithmeticKTheoryPartII.lean`: exit zero at the pins; nine `sorry` warnings and no other warnings or errors. Available memory before the check was 82 GiB. The 106-line file has two real-bodied light definitions, three API theorem signatures and eight examples. Both new examples are proved. The missing high-level carriers remain reader targets.
- JSON parsing, allowed paths, local graph acyclicity, planned-stage coverage, 36-item routing, packet/roadmap/reader consistency, test-kind enumeration, source-verdict coverage, local links and whitespace were checked. Compilation validates the suggested native-carrier interface, not the roadmap's arithmetic theorems.

No question blocks acceptance. The orchestrator should retain G1–G3 and the 24 open requests in later packaging; acceptance must not be interpreted as discharging them or as granting an implementation status. Supplier rescope proposals are recorded, not applied by this worker. The mandatory handoff is [REV-DESIGN-ArithmeticKTheoryPartII.md](../handoff/REV-DESIGN-ArithmeticKTheoryPartII.md).
