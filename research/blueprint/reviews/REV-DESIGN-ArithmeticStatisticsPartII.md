# Independent review: REV-DESIGN-ArithmeticStatisticsPartII

Issue: #3499. Reviewer: Codex, session `codex-3P4Aw8`, 2026-10-18. The original design was by Claude, session `claude-hzGakF`; this reviewer did none of that work.

**Verdict: accepted after corrections, at target level.** The packet is a complete planning pass, with seven planned stages and no closed stage. Its general complement-conjugacy gap and precise supplier requests remain visible. Acceptance does not assert implementation, prove the arithmetic conjecture, or certify the final published text of a paper that was not read.

| Item | Before | After |
| --- | ---: | ---: |
| Nodes | 42 | 42 |
| Definitions / constructions / theorems / lemmas / comparisons | 8 / 8 / 24 / 1 / 1 | 8 / 8 / 24 / 1 / 1 |
| API items | 132 | 132 |
| Definition and construction tests | 67 | 68 |
| Planets | 29 | 29 |
| Baseline citations | 30 | 28 |
| Supplier requests | 11 | 12 |
| Recorded gaps | 1 | 1 |
| Source issues | 15 | 15 |
| Restructuring proposals | 2 | 2 |

Every node has an individual verdict below and in `packet.review.checked`: 14 verified, 28 corrected, no added or unverifiable nodes. The target-level granularity is appropriate; proof steps were repaired within their owning targets rather than expanded into a lemma-level development. Every definition and construction retains at least three discriminating tests. No `excerpt` field is present.

## Mathematical corrections

1. **Finite levels and arithmetic finiteness (RG.1, RG.6).** Finitely many maps into the generators of a level do not justify a claim about maps into arbitrary quotients of their products. RG.1 now uses the finite group of word functions on the finitely many generating finite groups. A finitely generated group of this level has finite completion. On the arithmetic side, smallness bounds the number of open subgroups at any given index. Liu–Wood Corollary 6.13 bounds chief factors throughout a finite level; a primitive quotient with minimal normal subgroup M has order at most |M||Aut(M)|, since the centralizer of a transitive subgroup is semiregular. Maximal open indices are therefore bounded, the Frattini subgroup is open, the completion is finitely generated, and RG.1 applies. The function-field smallness input is an explicit FA.4 request. This does not assert finite generation of the whole unramified Galois group.
2. **Retracts, abelian extensions and operator actions (RG.1, RG.3).** The abelianization calculation uses the split injection induced by the retract and its augmentation-ideal image. The abelian Property E example uses averaging; an abelian central extension need not split in general. The abelian Y-generation count uses graphs of F⋊Γ-equivariant maps. Extension classes are finite because their order is fixed, independently of the description of the level.
3. **The multiplicity asymptotic (RG.3).** In the abelian case the formula valid without restriction is λ = lim (h^m−1)|Y(G)|^{−n}. Replacing h^m−1 by h^m needs |Y(G)|>1. The assertion m→∞ needs both λ>0 and |Y(G)|>1. For fixed finite H,G, λ remains finite and rational even at an infinite level: only finitely many extensions of order |G||H| occur, and an exhaustion eventually includes all those that occur. Only the support in G may become infinite. The tests now distinguish the BBH sign module from the trivial Γ-module and include the subtracted-one obstruction.
4. **A counterexample at an actually finite level (RG.3–RG.4, E6).** Take Γ=C₂, H=F₃² with inversion, and the finite set consisting of C₉ with inversion and the exponent-three Heisenberg group of order 27 with the two standard generators inverted. At n≥2 the sign multiplicity is n and the trivial multiplicity is one. The sign extensions have weighted count 1/18+4/9, giving λ=1; the Heisenberg extension gives λ=2 for the trivial factor. The exact generation product has a zero factor. The unqualified printed u=0 limit product is approximately 0.002698477835. The full class of groups of 3-class at most two is infinite and is handled by V, not a basic open U; its corresponding full pro-3 formula is Theorem 7.5, not Theorem 7.4. The μ₁ formula (5.13) would give a different positive number, so the u=0 test now cites (4.14). The test label is E6, not E5.
5. **Interchange and countable additivity (RG.4).** The corrected interchange target makes nonnegative finite majorants explicit and retains persistence of positivity. Fatou justifies summability when the threshold depends on H; dominated convergence follows. Persistence holds in both applications by adding one generator and one Y-relation tuple. Countably many algebra sets need not have a common finite level. The corrected proof approximates decreasing sets by finite cylinder unions with summably small loss, then uses finite branching and compatible inverse limits to prove continuity at the empty set. The generation product has value zero by convention when no defining surjection exists; (4.13) is evaluated through its fundamental sequence only when a surjection exists.
6. **Lattices and p-covers (RG.5).** Nakayama is applied over the commutative ring Z_p after restricting scalars, not over the possibly noncommutative group algebra. N* is invariant under automorphisms of the presentation pair, not under arbitrary automorphisms of N. The nucleus is defined from a minimal presentation; redundant presentations contribute a central elementary abelian factor and have the same nucleus for a nontrivial group. The trivial-group test distinguishes minimal rank zero from redundant rank n. The existing lower p-central series and p-class come from ProfiniteProPGroups Layer 8; Frattini and rank theory remain Layer 3. The five-term sequence is imported with Γ-naturality.
7. **BBH support and normalization (RG.5).** Property E gives some Y-presentation, not one with an arbitrary prescribed number of relations. The pro-p support also requires r−d≤u; at exact class c it requires r−ν−d≤u. When the bound fails the product contains the zero index factor. The added acceptance example C₃ at u=−1 has Property E but zero mass. The directly checked BW and BBH probabilities are conditional on generator rank and must be multiplied by the appropriate Cohen–Lenstra rank weight. The unverified BBH (2017) Lemma 2.7 locator is replaced by these checked presentation and counting statements. Wang–Wood's comparison is Proposition 6.6 in arXiv v2, with Theorem 4.1 identifying the totally real weight. Comparisons at finite sets of primes and their compatible global product are distinguished; no all-prime probability distribution on finite groups is asserted for u=0.
8. **Arithmetic hypotheses and imports (RG.6).** Total reality is now explicit. The relation-module proof explains constituent cancellation in the five-term sequence and leaves the precise duality and unit-module injections as supplier requests. The function-field repair uses the complete curve and p-adic completion of its Picard group, including the degree direction; affine units are not constants. Defining the conjecture as a proposition does not depend on first proving its later consistency theorem.
9. **Suggested Lean, sources and synchronization.** `HasPropertyE` includes membership of H in its class and is explicitly a finite-carrier prototype. Restriction to a smaller class assumes membership there. All other proposed carriers remain README targets as required at the pins. Page corrections include Liu–Wood §2.3 (p. 5), §4 (pp. 6–7), Lemma 6.1 (pp. 10–11), Theorem 8.1 (pp. 15–16), Propositions 8.7/8.9 (pp. 17–20), Lemma 11.3 (pp. 28–29), Lemma 12.5 (p. 34), and LWZB §1.5 (pp. 8–9), Lemma 5.10 (pp. 29–30). The reader was rendered again from the corrected nodes and layer overviews; its examples, dependencies, APIs, tests, requests, source issues and references agree with the packet.

## Baseline audit

All 30 original declarations were read with their surrounding variables at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Two citations were removed:

- `Subgroup.exists_smul_eq` is an internal quotient-difference transitivity lemma, not the public statement about conjugacy of complements. The abelian supplier is the actual ArithmeticStatistics ST.5 node; the elementary averaging argument is also stated. The general case remains conditional on (SZ_Γ).
- `CompositionSeries.jordan_holder` compares factors in a Jordan–Hölder lattice. It does not supply invariance of chief factors paired with their conjugation images. The target already owns that result and now explicitly uses the normal-subgroup induction of Liu–Wood Lemma 6.3.

The 28 retained entries provide the following inputs, with their actual hypotheses. The packet retains their exact module paths.

| Declaration | Input confirmed at the pin |
| --- | --- |
| `mathlib:MulDistribMulAction` | Actions of a monoid on a monoid by monoid endomorphisms (here: Γ acting on G by automorphisms). |
| `mathlib:MulDistribMulActionHom` | Equivariant monoid homomorphisms A →*[M] B for MulDistribMulActions. |
| `mathlib:FixedPoints.subgroup` | The subgroup of a group fixed by a MulDistribMulAction, with mem_subgroup characterising membership. |
| `mathlib:SemidirectProduct` | The semidirect product N ⋊[φ] G for φ : G →* MulAut N, with inl, inr and rightHom. |
| `mathlib:OpenNormalSubgroup` | Open normal subgroups of a topological group. |
| `mathlib:Subgroup.topologicalClosure` | The closure of a subgroup of a topological group, a subgroup. |
| `mathlib:ProfiniteGrp` | The category of profinite groups (compact, totally disconnected topological groups). |
| `tauceti:TauCeti.profiniteOrder` | The supernatural order of a topological group: at each prime, the supremum of the valuations of the orders of the quotients by open normal subgroups. |
| `mathlib:Subgroup.exists_right_complement'_of_coprime` | Schur–Zassenhaus existence: a normal subgroup N of a group with Nat.Coprime (Nat.card N) N.index has a complement. |
| `mathlib:Group.IsSolvable` | Solvable groups: the derived series reaches the trivial subgroup. |
| `tauceti:TauCeti.maximalProPQuotient` | The maximal pro-p quotient G ⧸ proPKernel p G of a topological group, with its map and functoriality. |
| `tauceti:TauCeti.IsProP` | A topological group is pro-p when every quotient by an open normal subgroup is a p-group. |
| `mathlib:MeasureTheory.Measure.map` | Pushforward of a measure along a measurable map. |
| `mathlib:MeasureTheory.ProbabilityMeasure` | Probability measures on a measurable space, with the topology of weak convergence. |
| `tauceti:TauCeti.haarProb` | The normalized Haar measure of a compact topological group, an instance of IsProbabilityMeasure (isProbabilityMeasure_haarProb). |
| `tauceti:TauCeti.haarProb_eq_uniformOn_univ` | On a finite discrete group, haarProb G = ProbabilityTheory.uniformOn Set.univ. |
| `mathlib:MeasureTheory.Measure.isHaarMeasure_eq_of_isProbabilityMeasure` | Two Haar probability measures on a locally compact group coincide. |
| `mathlib:IncidenceAlgebra.mu` | The Möbius function of a locally finite order, inverting zeta in the incidence algebra. |
| `mathlib:tendsto_tsum_of_dominated_convergence` | Tannery's theorem: limits commute with sums dominated by a summable bound. |
| `mathlib:IsSimpleGroup` | Simple groups: nontrivial with no normal subgroups other than ⊥ and ⊤. |
| `mathlib:MeasureTheory.AddContent.measure` | Carathéodory extension of a σ-subadditive additive content on a set semiring generating the σ-algebra. |
| `mathlib:MeasureTheory.AddContent.measure_eq` | The Carathéodory extension agrees with the content on the semiring. |
| `mathlib:MeasureTheory.tendsto_of_forall_isOpen_le_liminf` | Portmanteau: if μ(G) ≤ liminf μ_i(G) for all open G (countably generated filter), the probability measures μ_i converge weakly to μ. |
| `mathlib:MeasureTheory.lintegral_liminf_le` | Fatou's lemma for lower Lebesgue integrals. |
| `mathlib:NumberField.finite_of_discr_bdd` | Hermite's theorem: finitely many number fields in a fixed algebraic closure have \|discriminant\| ≤ N. |
| `mathlib:Module.Projective.of_split` | A module that is a retract of a projective module is projective. |
| `mathlib:MonoidAlgebra.Submodule.exists_isCompl` | Maschke's theorem: when the order of G is invertible in k, every k[G]-submodule has a complement. |
| `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot` | Nakayama for submodules over a commutative ring: if N is finitely generated, N ≤ I • N + N′ and I ≤ Ring.jacobson ⊥, then N ≤ N′. Applied after restricting scalars to Z_p, with I = (p); no noncommutative Z_p[Γ] version is assumed. |

The Nakayama entry was sharpened to its commutative-ring hypothesis. The library audit was read, and the current upstream ProfiniteProPGroups and ProfiniteCohomology documents were consulted in detail, together with the relevant ClassFieldTheory and atlas supplier statements. The current library and the roadmaps newer than the atlas snapshot were screened for overlap. Current `freeProC` and the p-central-series infrastructure are imports, not new work proposed here. No upstream file was changed or built.

The actual cross-roadmap statements were checked: IG.4 admissibility, Property E and complements; ArithmeticStatistics ST.5 complements, Cohen–Lenstra law and function-field moments; ArithmeticGaloisDuality's bounded-degree Hermite input; FunctionFieldArithmetic FA.4; and the named Tau Ceti layers. Where the exact required arithmetic module statement is absent, the request says precisely what must be supplied rather than treating the stage title as evidence that it exists.

## Sources and source-issue verdicts

The public texts below were read at the locators in the corrected packet. Page numbers are the printed preprint pages. The Ribes–Zalesskii theorem was read in the maintainer-cleared copy under the user's explicit permission; no file or passage was copied. Koch and NSW were not read independently; the exact needed interfaces remain requests.

- [A predicted distribution for Galois groups of maximal unramified extensions](https://arxiv.org/abs/1907.05002v2): Independent review, 2026-10-18: every cited Part I locator and source issue checked in v2, pp. 1–37; pp. 37–41 checked for the supplier interface..
- [The free group on n generators modulo n + u random relations as n goes to infinity](https://arxiv.org/abs/1708.08509v2): Independent review, 2026-10-18: §§2–9 and cited Lemmas 11.3 (pp. 28–29) and 12.5 (p. 34) checked directly in v2..
- [Profinite Groups](https://doi.org/10.1007/978-3-642-01642-4): Theorem 2.3.15 and proof, pp. 40–41, read in the maintainer-cleared copy on 2026-10-18; no text or file reproduced.
- [Nonabelian Cohen–Lenstra Heuristics over Function Fields](https://arxiv.org/abs/1604.03433v2): §3, pp. 5–7; Lemma 4.8 with proof, pp. 10–11, independently read on 2026-10-18.
- [Heuristics for p-class towers of real quadratic fields](https://arxiv.org/abs/1803.04047v1): Definitions 2.1–2.3, p. 2; Lemma 2.8 and definitions of rank-conditioned measures, pp. 4–5; Theorem 2.22 with proof, pp. 9–11; §3, pp. 13–14, independently read on 2026-10-18.
- [Moments and interpretations of the Cohen–Lenstra–Martinet heuristics](https://arxiv.org/abs/1907.11201v2): §3.2–3.3, pp. 6–7; Theorem 4.1, pp. 8–9; Proposition 6.6 with proof, p. 13, independently read on 2026-10-18.

The version records contain hashes of the public PDFs read. The journal LWZB version was not compared; claims that it merely changed references have been removed. Findings are limited to arXiv v2, with no claim of novelty against the final publication.

All 15 source issues have independent `confirmed` verdicts with reasons. These verdicts preserve distinctions: E3 is a finite-versus-infinite proof-domain gap; E6 now includes the corrected abelian asymptotic and a finite-level example; E7 identifies a missing justification, not a counterexample to the lemma; E8 describes the stronger operator irreducibility used later, not a false weaker bound; E9 records a justified extension from nonnegative to all integer u rather than calling the printed restricted theorem false; E14 is terminology; E15 corrects the affine-unit assertion and exposes the required complete-curve import. The remaining local misprints and omitted hypotheses were checked at their individual locators. No new source-issue id was needed.

## Node-by-node disposition

The following rows cover every node; IDs are abbreviated after `ArithmeticStatisticsPartII:`.

| Node | Verdict | Check or correction |
| --- | --- | --- |
| `RG.0/gamma-group` | verified | Verified profinite action and morphism conventions, normal Γ-closure, source uses and all four tests against the pinned action and topology APIs. |
| `RG.0/y-map` | verified | Verified the fibre criterion, twisted product identity, naturality and continuity; the non-homomorphism test uses the non-coprime S_3 example only to test Y. |
| `RG.0/coprime-conjugacy-hypothesis` | corrected | Removed the internal quotient-difference lemma as a complement-conjugacy citation; used the actual ST.5 abelian supplier, averaging and Ribes–Zalesskii Theorem 2.3.15. Kept the solvable case separate from the general Feit–Thompson gap. |
| `RG.0/sections-and-y` | verified | Verified sections, exactness of fixed points, Y-fibres and the coprime hypotheses, including the profinite compactness argument. |
| `RG.0/admissible-gamma-groups` | verified | Verified admissibility is imported from IG.4; quotient/product stability, centrality, rigidity and the finite abelian criterion follow as stated. |
| `RG.1/level-completion` | corrected | Replaced the invalid quotient-lifting finiteness shortcut with a finite-word-function proof for a finitely generated group at a finite level, and included it in the API. |
| `RG.1/free-gamma-group` | verified | Verified the free pro-prime-to-\|Γ\| object is imported from ProfiniteProPGroups Layer 4; its Γ-action and universal property have the required prime-to hypotheses. |
| `RG.1/free-admissible-gamma-group` | verified | Verified the admissible retract construction and free basis against Lemma 3.1 and Remark 3.2, with the coprime conjugacy assumption visible. |
| `RG.1/free-admissible-universal-property` | corrected | Corrected abelianization to use the split injection induced by the retract; identified its augmentation ideal image. Used the general finite-level argument from the completion node. |
| `RG.1/property-e-at-level` | verified | Verified restriction, completion and finite testing for Property E. The suggested finite-carrier definition now requires H to belong to the class and its restriction theorem assumes membership in the smaller class. |
| `RG.1/property-e-criterion` | corrected | Corrected the abelian acceptance argument: central abelian extensions may be nonsplit. Averaging splits off the invariant kernel from an extension of an invariant-free quotient; retained the kernel criterion and its repaired infinite-kernel argument. |
| `RG.2/space-of-admissible-gamma-groups` | verified | Verified level-tower injectivity, countability, disjoint refinements and the distinction between finite-level U and arbitrary-level V. |
| `RG.2/random-gamma-groups` | corrected | Clarified that one Y-relation tuple can have several coordinates; checked Haar pushforward, finite-level measurability and Property E support. |
| `RG.3/products-of-irreducible-operator-groups` | corrected | Checked all operator-group structure and generation statements in Liu–Wood; corrected the Theorem 5.1 and Lemma 6.1 page ranges. |
| `RG.3/fundamental-exact-sequence` | corrected | Checked the fundamental sequence, irreducible operator actions and dependence only on the target; corrected the Liu–Wood §4 locator to pp. 6–7. |
| `RG.3/y-generation-probability` | corrected | Corrected the abelian generation count to use graphs of F⋊Γ-equivariant homomorphisms, retaining the operator action in the bad-last-coordinate count. |
| `RG.3/h-extensions` | corrected | Justified finiteness of extension classes using their fixed finite order, rather than a quotient-of-product assertion; corrected the §2.3 locator. |
| `RG.3/counting-extension-maps` | verified | Verified the fibre-product count of lifts and the Möbius inversion formula, including strict-superobject recursion and the finite examples. |
| `RG.3/multiplicities-via-extensions` | corrected | Checked Proposition 4.7, Corollary 4.8 and independence from the chosen surjection; corrected the Liu–Wood pp. 17–20 locator. |
| `RG.3/lambda-invariants` | corrected | Corrected the abelian asymptotic to h^m−1 without a Y-size restriction, and growth only when \|Y\|>1. Proved fixed-kernel λ finite even for infinite levels, added Property E and admissibility dependencies, corrected the BBH sign-action test and added the trivial-action offset test. |
| `RG.3/tail-product-limit` | verified | Verified the truncated-product limit and its zero case against Liu–Wood Lemma 8.11; it is used only with the correct multiplicity asymptotics. |
| `RG.3/finite-level-distribution` | corrected | Distinguished finite G-index support from infinite abelian products, specified the no-surjection case, and supplied a finite two-group counterexample satisfying Theorem 4.12. Added the direct sections/Y prerequisite and corrected the (4.13) page range. |
| `RG.4/chief-factor-pairs` | corrected | Removed CompositionSeries.jordan_holder as a chief-pair theorem. Independence is owned here with the Liu–Wood normal-subgroup induction; retained chief-pair examples and closure. |
| `RG.4/gamma-chief-factor-pairs` | verified | Verified the Γ-chief-pair construction, finiteness and the quotient-to-the-previous-level bound at Definition 5.1, Lemma 5.2 and Corollary 5.3. |
| `RG.4/multiplicity-bounds` | verified | Verified both counts and the fibre-product reconstruction; qualified E8 as the stronger operator irreducibility needed in the application. |
| `RG.4/uniform-positivity` | corrected | Clarified that the generation product is defined from a fundamental sequence when a surjection exists, with value zero otherwise. Checked both positive lower bounds. |
| `RG.4/limit-interchange` | corrected | Made nonnegative finite majorants explicit, retained persistence of positivity, and inserted Fatou before dominated convergence; verified persistence in both applications and added its direct baseline prerequisite. |
| `RG.4/countable-additivity` | corrected | Replaced the false common-level assertion for a countable family by finite-cylinder approximation and a finitely branching inverse-limit proof of continuity at the empty set; corrected the Liu–Wood locator. |
| `RG.4/limit-measure` | corrected | Checked Carathéodory uniqueness and probability normalization; corrected test E5 to E6, its finite U versus infinite V notation, and the u=0 reference from (5.13) to (4.14). |
| `RG.4/weak-convergence` | corrected | Added the direct space/topology prerequisite for the open-set decomposition and made the zero-mass example a finite basic open; infinite classes use V. |
| `RG.4/arbitrary-level-values` | corrected | Checked exhaustion and product monotonicity with the Property E proviso; corrected Liu–Wood Lemma 11.3 to pp. 28–29. |
| `RG.5/finite-n-moments` | verified | Verified the exact finite-n moment count and its limit; the Y-fibre and admissibility assumptions are preserved. |
| `RG.5/moments` | corrected | Verified the locally constant surjection function and the separate uniform-integrability/interchange argument; corrected the §1.5 page range. |
| `RG.5/coprime-lattice-lemma` | corrected | Applied Mathlib Nakayama only after restricting scalars to the commutative ring Z_p; checked projectivity, Maschke and equal-rank injectivity. |
| `RG.5/abelian-specialization` | corrected | Separated finite fundamental sequences from the exhaustion multiplicity, added the Property E prerequisite and checked Wang–Wood directly. Corrected its locator to Proposition 6.6 and specified finite-prime comparisons and the global product interpretation. |
| `RG.5/p-covering-group` | corrected | Corrected pair-invariance of N*, minimal versus redundant presentations, and the trivial-group test. Imported the existing lower p-central series from Layer 8 and added Γ-natural five-term and free-admissible prerequisites. |
| `RG.5/boston-bush-hajir-pro-p` | corrected | Separated Property E from the prescribed relation-count bound, added a negative-u example, and replaced the unverified BBH 2017 locator with directly checked BW/BBH formulas and conditional-rank normalization. |
| `RG.5/boston-bush-hajir-p-class` | corrected | Checked the r−ν correction at exact p-class and the r correction below it; supplied the two-obstruction zero argument and the rank normalization in the BBH comparison. |
| `RG.6/lwzb-conjecture` | corrected | Kept the conjecture a proposition; removed an apparent proof-level dependence on the later consistency theorem from the definition. |
| `RG.6/conjecture-consistency` | corrected | Kept the totally real hypothesis explicit and replaced unsupported arithmetic finite-level finiteness by smallness, bounded chief factors, the primitive-quotient bound and the finite-word-function argument. Added the direct prerequisites and strengthened the function-field request. |
| `RG.6/function-field-moment-comparison` | verified | Verified the ST.5 supplier statement, q coprimality and the limsup/liminf order; the result compares moments and asserts no number-field theorem. |
| `RG.6/p-class-tower-in-model` | corrected | Made total reality explicit and expanded the Γ-module cancellation. Kept exact duality/unit inputs as supplier requests; the function-field repair uses the complete curve and completed Picard degree direction instead of treating affine units as constants. |

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatisticsPartII.json`: 42 nodes, 132 API items, 68 tests, 29 planets, 28 baseline declarations; **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/ArithmeticStatisticsPartII.lean`: elaborated at the pinned shared build, exit 0, with 27 warnings, all `declaration uses sorry`. No other warning or error. The suggested file has 250 lines; it states prototypes and does not implement the roadmap.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/ArithmeticStatisticsPartII.lean`: no sorry'd data definitions.
- Intake `check-files` on the five issue deliverables and the required handoff: no problems.
- JSON parsing, all-node/all-field reader consistency, absence of `excerpt` keys, complete review/source-issue verdict coverage, and `git diff --check`: passed.
- Recomputed the finite-level E6 extension weights exactly and the erroneous product numerically: λ(sign)=1, λ(trivial)=2, product 0.002698477835. This is an arithmetic check of the stated derivation, not a formal proof or a machine enumeration of groups.

## Maintainer decisions and remaining work

The two restructuring proposals are retained for the maintainer. First, keep random Γ-groups separate from random polynomials, Schinzel averages and Smith's method. Second, resolve the collision with the existing integral-orbit package named ArithmeticStatisticsPartII, preferably by naming this roadmap ArithmeticStatisticsPartIIRandomGammaGroups before promotion. No files outside the issue deliverables were renamed and no atlas promotion was attempted.

The one Feit–Thompson gap is still explicit. The twelve requests include the corrected Layer 8 import and the sharpened arithmetic interfaces. The coverage lists identify lemma-level refinements and supplier work; none is hidden behind a closed-stage claim. This review job itself is complete.
