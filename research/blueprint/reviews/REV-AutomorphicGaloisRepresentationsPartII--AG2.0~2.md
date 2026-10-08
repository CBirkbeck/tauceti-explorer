# Independent review of the regular-algebraic GL_n Galois roadmap, revision 2

Job `REV-AutomorphicGaloisRepresentationsPartII--AG2.0~2`, issue [#7296](https://github.com/CBirkbeck/tauceti-explorer/issues/7296). Reviewer: Codex, session `codex-9YQObt`, 8 October 2026. This session wrote neither blueprint planning job. The reviewed input is revision 2 of `AutomorphicGaloisRepresentationsPartII--AG2.0` and the prior independent report.

**Verdict: accepted. This review is complete.** The reader now incorporates the preceding review’s mathematical corrections and has been brought into agreement with this review’s further fixes. Acceptance is for a sound target-level planning pass with precise supplier obligations. The seven mathematical stages remain `planned`; AG2.1 remains the `source_decomposed` process aggregate under accepted RS-12. No stage is closed and all implementation statuses remain `unchecked`.

## Counts and changes

| Item | Result |
|---|---:|
| Nodes | 77: 61 verified, 16 corrected, 0 added, 0 unverifiable |
| Definitions / constructions | 5 / 12 |
| Lemmas / theorems / comparisons | 5 / 44 / 11 |
| Planning API items / unit tests | 84 / 58 |
| Planets / baseline declarations | 35 / 4 |
| Supplier requests / recorded gaps | 50 / 13 |
| Node source citations | 100 |
| Source issues | 9 confirmed: 5 rechecked, 4 added |
| Stages in scope / closed | 8 / 0 |

All 17 definitions/constructions retain at least three discriminating tests. No API, test, planet, baseline citation or node was removed; no generic owner was duplicated. The added numerical Lean examples check the corrected slope convention and its zero-Kuga specialization. They are convention fixtures, not formalizations of geometric comparison theorems.

The substantive correction is in `hltt-frobenius-trace-normalization`: multiplying the section trace by `p^(mn[F:Q])` **increases** its slope to the Kuga slope. HLTT Corollary 6.17, p. 217, maps section bound `a` to Kuga bound `a+mn[F:Q]`; the reverse direction subtracts that shift. The submitted statement had the directions reversed. For `n=m=1`, `[F:Q]=2`, section slope 3 gives Kuga slope 5. The coefficient spectral-sequence node, reader and Lean ledger now use the same direction.

Caraiani’s double filtration uses kernel/image indices with a shift. The R01.2 filtration centered at zero uses `r=k−l−1`, giving graded weight `w+r`. The `N=0` check puts its only graded piece in degree zero. This is a normalization clarification, not an allegation that the source’s alternative indexing is invalid.

Locator fixes are Varma §§8–10 rather than a nonexistent §11; Shin’s Mantovan equation (2.1), p. 9, local Propositions 2.2–2.3, pp. 10–11, and Igusa Definition 4.2/Theorem 4.4, pp. 13–15; HLTT Corollary 1.9, p. 41; Caraiani Propositions 5.8/5.10, pp. 64–65, and Corollary 7.3 through p. 84; CH §3.2, pp. 10–12, rather than p. 9; and Liu’s precise pp. 110, 145–146. The Bernstein operator locator is sharpened to Varma pp. 16–17. The published Caraiani proof, pp. 2410–2411, is now an additional citation for tensor-square purity detection beyond TY’s uniqueness and finite-extension statements. The per-node table records every changed node.

## Baseline, targets and ownership

The four declarations were independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared checkout has that exact HEAD. Tau Ceti’s declared pin is `f790474821cf4256814db967cb154e7af3d0c369`; this suggested file imports no Tau Ceti declaration.

| Declaration | Statement checked and use |
|---|---|
| `NumberField.IsCMField` | A characteristic-zero field is totally complex and quadratic over its maximal real subfield; the ambient number-field instances apply. |
| `NumberField.IsCMField.complexConj` | A `K⁺`-algebra equivalence of K with the integral ℚ-algebra instance; number fields provide that instance. |
| `NumberField.IsCMField.complexEmbedding_complexConj` | A complex embedding sends conjugated x to the conjugate of its value; this supplies the embedding involution used for paired weights. |
| `Multiset.prod_X_sub_C_coeff` | For a commutative ring and `k≤s.card`, coefficient k of the root product is `(−1)^(s.card−k)*s.esymm(s.card−k)`. No field or division hypothesis is added. |

The sources are [CMField at the pin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/CMField.lean) and [Vieta at the pin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Vieta.lean). No citation needed replacement.

I read the reviewed library audit for AG2.0–AG2.7, including its target-level decompositions and ownership notes, and the upstream SemisimpleAlgebras and SchurWeyl roadmap models. Each in-scope stage target has a producer, imported contract or named gap. The early normalization dictionary, raw geometry, virtual stabilized comparison, actual constituent extraction, arbitrary-regular definite-family construction, nonselfdual boundary construction and away-prime compatibility are distinct proof steps. The process aggregate has no independent nodes. Generic highest weights, Satake identities, interpolation, smooth Ext, Schur evaluation, WD partitions/purity and polarized-carrier operations remain with their owners. AG2.6/AG2.7 exports are precise obligations outside this packet, not claims of a completed implementation.

All 50 requests and all distinct external prerequisite references were checked against their actual blueprint-node, integrated-node, stage or upstream-layer statements. In particular, the general-number-field R01.5 recognition contract has continuous characteristic-zero coefficient embeddings and semisimplicity; its rational-eigenvalue descent contract requires an element with distinct rational eigenvalues. Arithmetic G7’s generic pairing operations avoid the residual Schur assumptions of the deformation roadmap. AF.4 supplies integral highest weights and definite-unitary analytic forms; L4 and L2a alone supply neither classicality nor density. The raw fixed-point, polarized effectivity, exact ramified Mantovan, characteristic-zero reducible interpolation and Hasse quotient-descent extensions are requested explicitly when the existing supplier is narrower. No request was silently treated as an available theorem.

## Source versions and source mistakes

The 20 primary PDFs were acquired afresh, and every hash matches the packet’s source record. Node locators were checked with surrounding hypotheses and the stated proof route; this is not a claim to have read all pages of all papers. The packet and reader record the freshly read versions and hashes, including the published BLGGT and typeset Caraiani comparisons. No restricted book copy was used. The library index does not make the cited Harris–Taylor passages available, so their explicit proof gaps remain.

| Issue | Independent conclusion |
|---|---|
| E1 | BLGGT’s automorphic definition uses the Galois-side symbol μ where its character is χ, in arXiv v4 and published Annals p. 536. |
| E2 | The multiplier evaluates as `(−1)^(n−1+w)χ_v(−1)`. The CM sign condition needs `(−1)^(n+w)`; the rank-one odd-w case disproves the printed w-independent total-oddness assertion. Published Annals pp. 536–538 retains it. |
| E3 | At q=4 the two rational six-dimensional operators both have maximal rank 4, with power ranks `(4,2,1,0)` and `(4,2,0,0)`. Only the strings of lengths 4 and 2 are centered at zero. Maximal rank alone does not characterize the pure extension. This does not decide the source’s restricted rank-four application. |
| E4 | CH’s author-copy exterior-square map is finite-kernel onto its image; at n=4 dimensions 16 and 36 rule out an isogeny onto GL₆. The plan uses the first proof. |
| E5 | Caraiani’s individual normalized tempered factor has weight n−1, and the tensor square has weight 2n−2. The preprint p. 84 and published author copy p. 2409 retain the doubled factor weight. |
| E6, added | ACC+ p. 922 omits the final odd-rank GL_n sign, a general unitary X power, and doubles the index range without correcting X exponents in the following unitary polynomial. The current preprint p. 26 retains these three display misprints with different equation numbers. The intended characteristic polynomials and the packet’s GL_n formula are unambiguous. |
| E7, added | CH author-copy p. 4 imposes nonnegative coordinates on both conjugate tuples while identifying them by reversed negatives. That would force zero weights; the intended coordinates are dominant integers, including determinant and inverse determinant. |
| E8, added | HLTT author-copy p. 231 selects the zero lower-left block of a block-diagonal Levi matrix for Std. The intended GL_n factor is the invertible lower-right block, as required by its displayed ν×Std isomorphism. |
| E9, added | Varma v1 has stale internal references on pp. 19 and 26–27. Corollary 8.3 supplies the p. 19 trace, Proposition 9.1 supplies the componentwise bound, and Theorem 10.2 precedes final patching; an existence-only theorem does not replace that comparison. |

All nine entries have this review job’s `confirmed` verdict with the specific reason. E1/E2 source-claim descriptions were rewritten in our own words; formulas are retained as mathematics. Each added finding lists the specific versions and correction searches. CH’s publisher PDF returned HTTP 403, so E4/E7 are bounded to the two independently acquired, identical author copies; a search-result snippet of the typeset p. 58 was not treated as a publisher-PDF reading. No claim of an exhaustive errata search is made.

For tensor-square detection, the [published typeset Caraiani author copy](https://www.ma.imperial.ac.uk/~acaraian/papers/lgc1.pdf), pp. 2410–2411, uses primitive monodromy strings and the binomial expansion of `N⊗1+1⊗N`. A too-short string of excessive weight would contradict purity of the square. This supplies the argument that the preprint p. 85 abbreviated and justifies the requested R01.2 theorem; pure extension uniqueness alone would not prove detection.

## Eight handed red-team findings

| Finding | Check and outcome |
|---|---|
| RT-AREA-langlands-1/2 | Nodes 19–27 produce raw compact geometry before ET.5 stabilization/ET.6 comparison. Request 16 and the early-fixed-point gap acknowledge that EDC.8 trace classes alone do not supply the stronger fixed-point equality; a single earlier generic owner must be reconciled. |
| RT-AREA-langlands-1/3 | Node 28 retains alternating smooth Ext, RZ level colimits and dimension twist, with direct IG.1 almost-product. Nodes 29–33 separate stabilization, the virtual constituent, weight separation and actual irreducible multiplicity divisibility; ET.6a is requested in generalized Steinberg/parabolic scope. |
| RT-AREA-langlands-1/4 | Compact one-signature Shin geometry is distinct from quasi-split (n,n) HLTT geometry. The possibly ramified Drinfeld factor and exact IG.1/ET.5/ET.7b contracts remain explicit, rather than substituting an unramified model. |
| RT-AREA-langlands-1/5 | The raw Igusa count requires a polarized O_F-linear effective Kottwitz triple with positivity and α₀=0. The current unpolarized Honda–Tate isogeny classification is expressly insufficient; PEL/IG refinement is recorded. |
| RT-AREA-langlands-1/18 | Arbitrary-regular attached factors come from AG2.3 before their discrete/TC.4 export. Request 48 separates residual unramifiedness, pairwise eigenvalue distinctness and α_i/α_j≠q; no IG.7 torsion concentration feeds early cohomology. |
| RT-AREA-langlands-1/19 | The dedicated GSp₄ route remains a named absent-owner gap with the CG/Pilloni/Sorensen scope preserved. Generic GL_n sign and polarized operations are AG2.3/arithmetic G7; no fabricated GSp₄ stage is imported. |
| RT-AREA-langlands-1/26 | Generic IHG.4 interpolation and infinite-twist separation are independent of TC.2. Nodes 53/55 retain the Hasse surjection versus witness-injection distinction, denominators and continuity; quotient descent is an explicit unclosed supplier contract. |
| RT-AREA-padic-2/32 | RD.4 owns the functorial GK comparison; RD.5 finiteness and RD.6 weight lower bounds are separately required. F1 owns dagger/log/trace carriers, and the stronger intrinsic boundary-pair independence is not claimed. |

## Per-node review

Node numbers follow packet order. The packet’s `review.checked` records all full node identifiers with these same independent notes.

| # | Node | Verdict | Check |
|---:|---|---|---|
| 1 | `the-normalization-dictionary-fixed-by-the-sources` | verified | Geometric Artin and epsilon conventions match HLTT; ET.6 is a late comparison, not an input to the raw construction. |
| 2 | `dominant-weights-and-the-weight-w` | corrected | BLGGT uses weakly decreasing integer coordinates and conjugate reversed indices. Added the determinant-pair acceptance case to exclude CH’s nonnegativity misprint E7. |
| 3 | `regular-algebraic-of-weight` | verified | The infinitesimal character is that of the dual coefficient representation. AF.1/AF.4 provide the archimedean carrier. |
| 4 | `polarized-automorphic-representation` | verified | CM and totally real character conditions are distinguished; the corrected CM parity depends on w. CH Hypothesis 4.1 has the required constant archimedean sign. |
| 5 | `polarized-galois-representation` | verified | The generic arithmetic polarized carrier has the epsilon-twisted dual relation, a genuine pairing and the stated oddness, without residual-deformation assumptions. |
| 6 | `galois-character-of-an-algebraic-hecke-character` | verified | BLGGT Appendix A.2 gives the idele-to-Galois formula, unit compatibility and geometric uniformizer values; upstream arithmetic Artin must be converted. |
| 7 | `sign-of-the-polarization-multiplier` | verified | Recomputed multiplier parity from the algebraic character weight. Published BLGGT retains the odd-w problem E2; Patrikis confirms the corrected sign. |
| 8 | `expected-hodge-tate-multiset` | verified | The shifted coordinates give labelled distinct weights with epsilon weight −1. ACC+ Corollary 7.2.4 checks the dual symmetric-power convention. |
| 9 | `frobenius-polynomial-and-conventions` | corrected | The signed Satake polynomial, norm twist and reciprocal conversion are correct. Marked E6 explicitly in the source match; rank-one and rank-three cases detect its missing sign. |
| 10 | `galois-representation-attached-at-good-places` | verified | Attachment is a continuous semisimple actual representation with one finite bad set. General-number-field arithmetic recognition supplies uniqueness. |
| 11 | `field-of-rationality` | verified | The early automorphic trace-field statement is distinct from a field of realization; its stronger AF.4 rationality operations are precisely requested. |
| 12 | `polarized-construction-inputs-shin-and-chenevier-harris` | verified | CH 3.2.3 supplies polarized existence with the separated Hodge inputs. No pure-WD equality or regular-density theorem is inferred from good polynomials alone. |
| 13 | `hltt-construction-of-nonselfdual-systems` | verified | HLTT 7.13 and 7.14 give the nonselfdual construction with their different good-prime ranges; the boundary and separation nodes produce it. |
| 14 | `varma-semisimplified-comparison-and-monodromy-bound` | corrected | Removed the nonexistent §11 locator. Varma 8.1, 9.1, 10.2 and 10.3 establish semisimple comparison plus dominance, rather than equality of monodromy. |
| 15 | `caraiani-upgrade-away-from-p-and-temperedness` | verified | Caraiani 7.4 upgrades the polarized construction away from the coefficient prime through purity; the nonselfdual Varma route stays separate. |
| 16 | `attachment-twist-dual-and-conjugation` | verified | Twist, dual and conjugation operations follow by good-polynomial recognition with the geometric epsilon values, not by a new general representation theory. |
| 17 | `unitary-similitude-central-character-dictionary` | verified | The GL₁/similitude exponent remains separate from the highest-weight coordinates and determines the Tate correction. |
| 18 | `prescribed-crystalline-twisting-character` | verified | ACC+ 4.5.1 and HSBT 2.2 require compatible unit/infinity prescriptions and allowed auxiliary ramification. The request does not promise arbitrary local characters. |
| 19 | `compact-shin-pel-instance` | verified | Shin 5.1/5.2 use the compact one-signature datum, odd n≥3 and finite quasi-split factors, including the possible ramification of the distinguished local field. |
| 20 | `kuga-sato-coefficient-projector` | verified | TY’s relative-degree selector and graded Young projector are distinguished; the explicit coefficient recipe remains an honest unavailable-source gap. |
| 21 | `coefficient-projector-degree-identity` | verified | Leray and the relative projector give the shifted global degree with its Tate twist; the degree projector is not silently an exact global idempotent. |
| 22 | `finite-level-coefficient-cohomology` | verified | The finite-level cohomology and level colimit retain actual degree, continuous Galois action and characteristic-zero compact invariants. |
| 23 | `hecke-galois-projector-commutation` | verified | Hecke and Galois equivariance of the TY projector are raw geometric assertions and precede local Langlands. |
| 24 | `finite-continuous-geometric-galois-action` | verified | The Kuga summand has geometric weight k+m−2t. Finite-level properness and the geometric suppliers justify continuity before automorphic extraction. |
| 25 | `automorphic-multiplicity-spaces` | verified | The actual compact automorphic/isotypic decomposition uses AF.1 and upstream Schur evaluation separately; the generic algebra is not replanned. |
| 26 | `raw-fixed-point-trace-identity` | corrected | Located the admissible triples at Shin Igusa Definition 4.2 and the raw count at Theorem 4.4. Polarized effectivity and the stronger fixed-point theorem remain explicit gaps. |
| 27 | `raw-nearby-cycle-traces` | verified | Nearby cycles compare raw trace actions on the possibly ramified Drinfeld geometry; they do not presuppose a constructed global parameter. |
| 28 | `compact-global-mantovan-formula` | corrected | Fixed the Mantovan functor locator to §2.2, equation (2.1), p. 9. Ext degrees, level colimits, dimension twist and the direct IG.1 almost-product input are retained. |
| 29 | `shin-st-end-igusa-computation` | verified | The ST/END restrictions, archimedean signs and stable/twisted transfers are precisely the Shin §6.1 cases; no universal packet multiplicity is asserted. |
| 30 | `virtual-weil-constituent-comparison` | corrected | Fixed the local proposition pages to 10–11. Theorem 6.4 is a Weil Grothendieck identity with the correct rank selected by the ST/END sign, not an actual rank division. |
| 31 | `weight-separation-middle-degree` | verified | Middle-degree separation keeps the genuine geometric weights and the unavailable HT cancellation argument as a gap. |
| 32 | `archimedean-packet-multiplicity` | verified | The archimedean cohomological multiplicity calculation has a direct AF.1 request; Corollary 6.5(iv) retains its ST/END assumptions. |
| 33 | `actual-galois-constituent-from-cohomology` | verified | Actual extraction requires divisibility of every irreducible multiplicity. The HT VII.1.8 argument is unavailable and recorded; divisibility of dimension alone is excluded. |
| 34 | `shin-regular-geometric-existence` | verified | Shin’s geometric branch has its stated weight and ST/END range; arbitrary regular even rank is obtained later by the definite-family branch. |
| 35 | `algebraic-character-polarization-twist` | verified | The global algebraic character twist requires unit and parity compatibility. The missing CHT lemma is named; the rank-two Clozel–Thorne check is not a universal square-root theorem. |
| 36 | `discrete-unitary-galois-assembly` | verified | HLTT Proposition 1.2 assembles all discrete blocks with the norm/epsilon shifts. Every block first requires an attached representation, including the later arbitrary-regular output. |
| 37 | `cs-discrete-polarization-normalization` | verified | CS Corollary 5.5.5 uses the selected two-block transfer and parity character, not an arbitrary discrete packet. |
| 38 | `attachment-under-solvable-base-change` | verified | Restriction under solvable base change follows from local Satake powers and semisimple recognition; it is distinct from effective patching back to the base field. |
| 39 | `definite-unitary-eigenvariety-instance` | verified | The CH definite eigenvariety includes all 1.2 hypotheses, even rank, the selected split coefficient place and fixed other weights. AF.4 supplies its Banach/classicality specialization. |
| 40 | `strongly-regular-classical-density` | verified | Slightly regular classical density is the cited CH argument’s nonroutine input. The analytic source gap and AF.4 request are explicit; reduced-affinoid gluing does not prove density. |
| 41 | `definite-family-determinant-interpolation` | verified | The characteristic-zero determinant family has a common ramification set and continuity at possibly reducible specializations; IHG.4 supplies the requested extension. |
| 42 | `finite-slope-regular-target-existence` | verified | CH Theorem 2.3 removes slight regularity inside its even-rank finite-slope setting; its target is not itself asserted to be a geometric constituent. |
| 43 | `s-general-solvable-extension-families` | verified | Prime-degree S-general extension families include disjointness, local prescriptions and cuspidality through exclusion of self twists. Generic global-field existence remains upstream. |
| 44 | `effective-automorphic-galois-patching` | verified | The patching input consists of actual invariant semisimple representations agreeing on composita; mere equality of unrelated traces is insufficient. |
| 45 | `removal-of-geometric-field-hypotheses` | verified | The first paragraph of CH 3.2.3 carries patching to the arbitrary-regular branch, beyond the slightly regular theorem 3.1.2. |
| 46 | `solvable-local-iwahori-reduction` | verified | Classical local parameters provide a solvable extension with Iwahori invariants. This reduction does not use the global local-compatibility conclusion being built. |
| 47 | `solvable-index-induction` | verified | The local solvable-index induction removes the remaining restrictions after the field-hypothesis step; the final assertion has no finite-slope assumption. |
| 48 | `hltt-ordinary-boundary-instance` | corrected | HLTT’s ordinary quasi-split signature (n,n) and mixed Kuga boundary are distinct from Shin’s compact geometry. Marked the Appendix Std lower-right-block correction E8. |
| 49 | `boundary-support-dagger-cohomology` | verified | Boundary-support dagger cohomology uses the fixed pair and transition maps. Stronger intrinsic independence remains explicitly unproved. |
| 50 | `hltt-functorial-dagger-rigid-comparison` | verified | GK 5.1 plus HLTT’s compatible closures and covers give the functorial comparison needed for Frobenius. RD.4 owns comparison; F1 owns the dagger/log carriers. |
| 51 | `hltt-frobenius-trace-normalization` | corrected | Corrected the slope direction: section bound a maps to Kuga bound a+mn[F:Q], and the reverse direction subtracts. Added the section-3/Kuga-5 numerical acceptance case. |
| 52 | `ordinary-cusp-finite-slope-pieces` | verified | Finite-slope dagger sections embed in ordinary formal cusp sections. They are not automatically global classical sections. |
| 53 | `hasse-weight-changing-congruence` | verified | The Hasse argument yields a surjective high-weight congruence comparison with shift j(p−1)p^(M−1), and preserves the common tame bad set. |
| 54 | `classical-cusp-galois-type` | verified | High-weight classical cusp forms have the source rank-2n Galois type via discrete transfer; TC.2 torsion existence is not an input. |
| 55 | `uniform-integral-hecke-congruence-witnesses` | verified | The uniform integral witness request includes denominators and descent of polynomial laws along the Hasse quotient. The current supplier’s injection API is not assumed sufficient. |
| 56 | `ordinary-hecke-determinant-limit` | verified | HLTT 6.5/6.13 first recover an irreducible quotient of an admissible submodule. Later filtration arguments justify the broader subquotient use. |
| 57 | `logarithmic-cusp-section-spectral-sequence` | corrected | Made the coefficient spectral sequence’s two slope bounds explicit to agree with corrected node 51. The finite filtration, not 6.5 alone, supplies its constituents. |
| 58 | `boundary-stratum-weight-zero-sequence` | verified | Rigid finiteness and weights isolate W₀: positive-degree isomorphism and degree-zero surjection are deliberately different. |
| 59 | `boundary-levi-cohomology-realization` | corrected | Corrected Corollary 1.9 to p. 41. The positive-degree boundary injection and Corollary 6.27 retain n>1, large N and the epsilon^(1−2n−2N) second factor. |
| 60 | `hltt-factor-separation-specialization` | verified | HLTT factor separation requires infinitely many twists, a dense Frobenius set, actual semisimple representations and an infinite-order character. Its generic IHG.4 theorem is independent of TC.2. |
| 61 | `good-prime-unramified-polynomial` | verified | Corollary 7.14 allows the extended good rational-prime range only when every place above that prime is spherical; coefficient-prime places remain excluded. |
| 62 | `monodromy-order-interface` | verified | Varma’s order compares all isotypic partitions and monodromy powers. Its Weil/inertia equivalence needs equal semisimple Weil parts. |
| 63 | `varma-integral-bernstein-operators` | corrected | Sharpened the Bernstein-operator pages to 16–17. The finite component union, rational denominators and type idempotent provide the actual uniform integral operator contract. |
| 64 | `varma-local-trace-congruence` | verified | Varma’s trace interpolation uses the local Weil trace operators at split bad places and the polarized classical comparison. E9 records the stale internal number on p. 19. |
| 65 | `varma-monodromy-rank-bound` | verified | All exterior-power trace identities and the semisimple image trace pairing yield the componentwise rank bounds; maximum rank of N is not used as purity. |
| 66 | `caraiani-tensor-square-geometric-instance` | verified | The two-signature compact geometry has dimension 2n−2 and produces the tensor square with its GL₁ correction. The zero-N test distinguishes a square from unequal factors. |
| 67 | `two-chart-nearby-cycle-monodromy` | verified | Product nearby cycles use one trait, characteristic-zero coefficients and total N=N₁⊗1+1⊗N₂. The actual proposition numbers and kernel/image bifiltration are correct. |
| 68 | `caraiani-stratum-concentration` | corrected | Added the exact pp. 64–65 locator. Stratum concentration is the source characteristic-zero packet/trace calculation and does not import torsion concentration IG.7. |
| 69 | `racsdc-temperedness` | verified | Caraiani 5.9 is for n≥2, with the separate rank-one character branch. The tempered factor has weight n−1, as corrected by E5. |
| 70 | `tensor-square-weight-spectral-sequence` | corrected | Completed Corollary 7.3’s locator through p. 84 and made the centered-at-zero monodromy reindexing r=k−l−1 explicit. Degeneration alone does not establish purity. |
| 71 | `pure-weil-deligne-comparison` | corrected | Added the published primitive-string argument on pp. 2410–2411 for tensor-square detection. TY 1.4 supplies pure extension uniqueness and finite-extension invariance; these stronger generic operations are precisely requested from R01.2. |
| 72 | `ch-polarized-local-monodromy-bound` | verified | CH’s polarized Bernstein-family bound precedes Caraiani and Varma in this branch. The unavailable BC §6.5 proof remains a separate source gap. |
| 73 | `published-racsdc-comparison-specializations` | corrected | Added Liu’s exact pages 110 and 145–146. Its higher-rank geometric identification stays conditional; coefficient-prime comparisons go to AG2.6 and the dedicated GSp₄ route is not fabricated. |
| 74 | `automorphic-polarization-and-sign` | verified | Bellaïche–Chenevier’s sign +1 applies to fixed dual-conjugation factors. Arithmetic G7 supplies orthogonal/hyperbolic assembly and the CHT-group equivalence without residual assumptions. |
| 75 | `finite-number-field-of-realization` | verified | CH finite realization uses a larger number field, two auxiliary primes, regular Hodge input and a rational regular-semisimple eigenvalue element. Trace-field rationality alone does not imply descent. |
| 76 | `late-gl2-modular-comparison` | corrected | Corrected the CH §3.2 pages to 10–12 and the totally real theorem to p. 13. R19 is a late comparison with explicit Frobenius/dual conversion and its own local range. |
| 77 | `relevant-automorphic-coefficient-field` | verified | Liu’s field is determined by the finite automorphic part and normalized good-place polynomial fields. It is kept separate from a common strong Galois realization field. |

## Reader, Lean and validation

The reader was checked for exact agreement with every node’s statement, hypotheses, proof steps and acceptance cases, every API/test name and statement, and every source locator/match. Its source corrections, baseline checks, version ledger and acceptance prose were refreshed. The suggested file contains all 77 declaration ledger entries and their packet signatures, all 84 API names and all 58 test names. Nonexpressible automorphic/geometric/arithmetic signatures are individually omitted with their missing carriers; no proposition-shaped substitutes or axioms are introduced. The available weight/polynomial/matrix fragments are expressly limited to those computations.

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.0.json`: zero errors and zero warnings.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: zero problems. Source-version checks also pass.
- The internal 77-node prerequisite graph is acyclic. The proof-order supplier checks above additionally address the potential cross-roadmap cycles that a local graph test cannot detect.
- Independent exact rational matrix arithmetic verifies both E3 Weil relations and both power-rank sequences; the computation uses rational Gaussian elimination rather than floating-point ranks.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentationsPartII--AG2.0.lean`: exit 0 at pinned Mathlib, only the five pre-existing planned-proof warnings. Available memory exceeded the required 20 GB. No language server or library build was started.

## Remaining obligations for the orchestrator

No further correction is needed to accept this revision. Closure still requires the 50 supplier refinements and 13 gaps listed in the packet: in particular the unavailable coefficient/cancellation/divisibility source arguments, earlier geometric fixed-point ownership, polarized effectivity, definite-unitary analytic density, Hasse quotient descent, the conditional Liu realization range and coefficient-field Hodge input. Create the routed dedicated GSp₄ owner and reconcile the upstream global-extension and fixed-point refinements once, rather than duplicating generic mathematics in this roadmap. Acceptance does not certify those requested extensions as already proved.
