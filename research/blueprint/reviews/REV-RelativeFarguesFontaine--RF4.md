# Independent review: Relative Fargues–Fontaine RF4

Job `REV-RelativeFarguesFontaine--RF4`, issue #483. Reviewer: Codex, session `codex-8ZIUh3`, 6 October 2026. The input was produced by the independent session `claude-QXE3hL`.

**Verdict: needs_changes. This review is complete.** Clear defects are corrected in the packet and suggested file. The mathematical contracts still lack some direct suppliers and a full stage target, and the reader contradicts the corrected packet. Compilation also does not establish compliance with the native API/example requirement of PROTOCOL §13: prose contracts are not Lean declarations.

The packet now has partial coverage for RF4 and both children. Its 22-node pass cannot keep `complete` with these unfinished stage targets under the checker’s sub-300-node rule. This describes the blueprint’s state; it does not make this completed independent review a checkpoint. Honest partial coverage alone is not the reason for rejection.

## Counts and scope

There are 22 nodes: 4 definitions, 2 constructions, 15 theorems and 1 comparison; 57 API items; 25 mathematical unit-test contracts; 7 planet candidates; 32 baseline declarations; 2 supplier requests; and 7 gaps (originally 1). No nodes were added or removed by this review. All implementation statuses remain `unchecked`. Three stages were changed from `planned` to `partial` with precise remaining work.

Node verdicts: 3 verified, 13 corrected, 6 unverifiable. An unverifiable verdict identifies a specific missing contract; it does not deny the cited theorem.

Review granularity is target level: no expansion into proof lemmas was attempted. Both upstream roadmap documents, the packet, suggested file, reader, stage targets, reviewed library audit, accepted RS-20 decision, and confirmed RT-AREA-padic-1/19 finding were read. The seven planets remain appropriate key constructions and named results; no source-locator planet was introduced.

## Every node

Suffixes in rows 1–15 belong to `RelativeFarguesFontaine:RF4:vector-bundles/`; rows 16–22 belong to `RelativeFarguesFontaine:RF4:G-torsors/`.

| # | Node suffix | Verdict | Finding |
|---|---|---|---|
| 1 | `glueing-datum-over-exact-square` | corrected | Corrected the Zariski-Z test to generator (1,1/3). Native sections are an R-submodule, comparison maps are tensor base-change maps, and the unit is linear. The remaining native morphism/adjunction/test API is explicitly open. |
| 2 | `finite-projective-glueing-over-exact-square` | corrected | KL 1.3.8-1.3.9 hypotheses and conclusion checked. Replaced the native hypothesis on a single datum by universal comparison-surjectivity; the conclusion now concerns the actual sections and both canonical comparisons. |
| 3 | `finite-etale-glueing-over-exact-square` | corrected | KL 1.3.10 checked. Native finite-etale effectivity now includes universal surjectivity, the maximal-ideal condition, and compatibility with the supplied overlap isomorphism. |
| 4 | `glueing-pair` | corrected | Stacks glueing-pair and torsion criteria checked. Separated native iff_exact from the actual iff_torsion_bijective. Concrete unit/noetherian/non-example prototypes remain open. The quotient API now matches general R', and the torsion-iff API explicitly assumes quotient isomorphisms. |
| 5 | `beauville-laszlo-module-gluing` | corrected | Stacks 15.92.16, .18, .19 and KL 1.3.6 checked, including arbitrary-module scope of the finite-projectivity criterion. The native overlap is linear; recovered isomorphisms respect it; flat_exact now states the full exact sequence. |
| 6 | `modification-of-vector-bundles` | corrected | Modification arrows are isomorphisms, extensionality gives isomorphism rather than equality, and bounds are local. The ideal test requires nonempty D. Native bounded local modifications now require finite projectivity. |
| 7 | `meromorphic-modification-at-a-divisor` | unverifiable | The fixed-global-reference lattice case is justified after replacing a single chart containing D by a chart cover. It does not realize arbitrary complement data in the general-E adic stage target; that effectivity contract is still missing. |
| 8 | `gluing-exactness-tensor-and-base-change` | corrected | Exactness reflection is proved in the finite-projective scope by cokernel detection and splittings. Coefficient change uses recovery over the new glueing pair, not unjustified exactness of tensoring the old ring square. |
| 9 | `disjoint-and-colliding-legs` | corrected | For D=mD1, l-bounded at D iff ml-bounded at D1; ceil(k/m) gives only one implication for an arbitrary k-bound. Locally finite families use local bounds, without a uniform global bound. |
| 10 | `untilt-divisor-complement-affine` | verified | KL 8.9.1-8.9.3 hypotheses, affine complement and single-open-neighbourhood condition checked. Restricted unramified coefficient setting is retained. |
| 11 | `relative-period-rings-Be-BdR` | verified | KL 8.9.4 and relative/absolute period-ring conventions checked. Nine API contracts and four tests are sound mathematical specifications; the geometric native prototypes are expressly incomplete. |
| 12 | `B-pair-cohomology` | corrected | KL 8.9.6(a) flat-quasicoherent statement checked. Formal pullback is V(B) tensor_B B-hat, not the adic completion of V(B); infinite flat modules distinguish them. |
| 13 | `vector-bundles-as-relative-B-pairs` | verified | KL 8.9.6(b), CS 3.5.1 and FF 5.3.1-5.3.3 checked. The unramified schematic B-pair equivalence and tensor/exact compatibility are justified. |
| 14 | `lattices-and-modifications-of-trivial-bundles` | unverifiable | Fixed-T relative lattice/modification equivalence is corrected to retain integral T when T varies. SW 12.4.6 additionally requires SW 12.3.4, 12.3.5 and 12.4.1; the foundation owner and direct contracts are absent. RT /19 export remains essential-surjectivity only. |
| 15 | `kedlaya-algebraicity-of-punctured-bundles` | corrected | Kedlaya 2.7, 3.8, 3.9 and 3.14 checked. Replaced the impossible p-adic square of A_inf[1/p] by the A_inf[1/p], W(K), W(K)[1/p] gluing stack. The existing crystalline-end ownership gap remains explicit. |
| 16 | `meromorphic-G-modification` | unverifiable | The meromorphic G-modification definition and four mathematical tests match FS/SW/HK. BG0 does not yet supply the required scheme and integral torsor dictionaries; native G-bundle carriers/API remain absent. |
| 17 | `tannakian-transfer-of-gluing` | unverifiable | Representationwise transfer is justified conditional on linear effectivity and the exact BG0 dictionaries. Current BG0 hypotheses and its reverse RF4 prerequisites do not close this import; no duplicate dictionary was added here. |
| 18 | `faithful-representation-criterion` | corrected | DM 2.20(b), footnote 11, and the pinned faithful-comodule closed-immersion criterion checked. Specified max tensor degree for sums of tensor words of differing degrees; no integral tensor-generator theorem is inferred. |
| 19 | `change-of-structure-group` | corrected | Extension of structure group is precomposition. The subquotient/closed-immersion criterion of DM 2.21(b) is now explicitly over E; it is not asserted over O_E. |
| 20 | `base-change-and-divisor-compatibility` | corrected | Replaced the unsupported inference for arbitrary overlapping sums by composition of a chain, bounded at the sum by max(k,l). Independent product decomposition is only on the disjoint locus; collisions retain intermediate data. |
| 21 | `v-descent-and-local-triviality` | unverifiable | SW 19.5.3 and FS VI.1.7 scopes checked; integral etale-local triviality narrowed to reductive G. The GR 5.4.21 application still needs explicit R,t,I, the torsor scheme and etale-neighbourhood argument; D2 bundle descent is requested separately. |
| 22 | `modification-of-G-bundle-by-lattice` | unverifiable | HK 4.3 lattice modification and GL_n/G_m/tautological/SL_2 tests checked. Construction is conditional on the missing BG0 scheme/integral dictionary and native geometric carriers; loop quotient presentations remain GS0-owned. |

## Corrections and discriminating examples

The Zariski test formerly gave sections `(3k,k)` and generator `(3,1)`. Its compatibility equation is `a=3b`, with `a` in `Z[1/2]` and `b` in `Z[1/3]`. Multiplication by 3 is a unit on the second piece. Consequently the sections are `(k,k/3)` and `(1,1/3)` is a section excluded by the old answer.

Allowing arbitrary bundle morphisms does not make a modification category a groupoid: for nonempty D the inclusion `O(-D) -> O` is noninvertible while its restriction off D is an isomorphism. The corrected groupoid uses isomorphism arrows; it is equivalent to the discrete set of its isomorphism classes, not literally equal to that set. The ideal-inclusion test needs nonempty D to distinguish bound 1 from bound 0.

At a repeated divisor, `O(-2D1) -> O` is bounded by 1 at `2D1`, but not by 1 at nonempty `D1`. Thus the former assertion identifying every k-bounded locus with the ceil(k/m)-bounded locus was false. The exact equivalence is l at mD1 versus ml at D1. Composition at overlapping divisors is separate from factorization of independent modifications; a chain at D1 then D2 has poles at most `kD1+lD2`, hence at most `max(k,l)(D1+D2)`.

For an infinite free module, tensor with a completed ring is generally smaller than its adic completion. For example the completion of a countable direct sum over `k[t]` contains the convergent sequence with coordinates `t^n`, whereas tensor with `k[[t]]` has finite-support coordinates. The B-pair proof must use extension of scalars; its flat-quasicoherent theorem is not restricted to finite modules.

Completing `A_inf[1/p]` along p gives the zero ring, since p is already a unit. It cannot explain Kedlaya’s punctured-spectrum algebraicity. The corrected proof uses the distinct gluing stack in Definition 2.2 and finite-free sections/recovery in Lemmas 2.6 and 2.3(c).

For the trivial-reference comparison, fixing T gives the usual lattice/modification equivalence. When T varies, it must remain part of the output. Over `E=Q_p`, multiplication by `1/p` is an automorphism of the trivial curve bundle and its `B_dR^+` lattice, but is not an automorphism of the integral lattice `T=Z_p`. Forgetting T therefore cannot give the claimed equivalence on morphisms.

The native signatures now express R-module sections, tensor comparison maps and their pure-tensor computation, a linear unit, the universal finite-projective surjectivity condition, compatible finite-projective/finite-etale recovery, the actual torsion criterion, a linear Beauville–Laszlo overlap, and the full flat-module exact sequence. The local bounded-modification predicate now includes finite projectivity. Full mathematical contracts replace truncated statements; they are explicitly labeled as prose specifications rather than elaborated APIs/tests. Proof placeholders assert no implementation.

## Public sources and exact versions

Each node’s locator and normalized mathematical excerpt was compared with the source text, including surrounding hypotheses and proof where needed. All eleven recorded PDF SHA-256 hashes were independently reproduced. The twelfth source is the online Stacks Project. The following are the public versions actually checked; published numbering not independently checked remains explicitly qualified.

| Source | Public version and relevant checked locators |
|---|---|
| [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf) | Author PDF dated 27 March 2020: 5.2.8–5.2.9; 12.3.4–12.3.5, 12.4.1 and 12.4.6; 14.1.1–14.3; 19.1.1–19.1.5 and 19.5.1–19.5.3. No-leg results were read to identify the missing prerequisite. |
| [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | Author-hosted version: III.3 (pp. 97–98), VI.1.5–VI.1.9 and preceding ring definitions (pp. 192–194). The approximation reference does not itself instantiate GR. |
| [KL15-foundations](https://arxiv.org/abs/1301.0792v5) | arXiv v5: 1.3.1–1.3.10, 2.7.9, 8.7.1–8.7.9, 8.9.1–8.9.6. The a>=1 unramified normalization and the open neighbourhood of the divisor are retained. |
| [Stacks-BL](https://stacks.math.columbia.edu/tag/0BNI) | Section 15.92 (all statements and relevant proofs), tags 07M7 and 0ALJ. The torsion criterion is essential; 15.92.19 applies to an arbitrary module, even one not known glueable. |
| [CS17-generic](https://arxiv.org/abs/1511.02418v1) | arXiv v1, §3.5, Theorem 3.5.1 and Corollary 3.5.2. Exact tensor gluing is the schematic unramified case. |
| [FF18-courbe](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf) | Author copy dated 16 April 2017: 5.3.1–5.3.3 (pp. 208–209), modification definition in 5.6.4.2 (p. 238), and minuscule lattice paragraph in 8.3.1 (p. 289). Added the last read-section record. |
| [HK-admissible](https://arxiv.org/abs/2308.11064v2) | arXiv v2, §4.3, p. 29: modifications and representationwise lattice construction. |
| [Kedlaya-Ainf](https://arxiv.org/abs/1602.09016v5) | arXiv v5: Hypothesis 2.1, Definition 2.2, Lemmas 2.3/2.6, Theorem 2.7; §3 including 3.8, 3.9 and Example 3.14. Full-Spa extension is a field-case result, not the general assertion. |
| [GR24-prismatic](https://arxiv.org/abs/2203.09490v3) | arXiv v3: Remark 1.5, proof of Theorem 4.15 (pp. 43–44), Convention 9.2, Lemma 9.8 and Proposition 9.9. These trace the Fargues equivalence proof route; they do not supply the absent crystalline chart carrier. |
| [GR02-almost](https://arxiv.org/abs/math/0201175v3) | arXiv v3: Proposition 5.4.21, Claim 5.4.22, Corollary 5.4.42 and Theorem 5.8.14. Regular t and henselian (R,tI) must be instantiated. Springer edition numbering was not verified. |
| [DM82-tannakian](https://www.jmilne.org/math/xnotes/tc2018.pdf) | Author revised 2018 text: Propositions 2.20–2.21 and footnote 11. Both representation-generation and restriction criteria are field statements. |
| [BMS18-integral](https://arxiv.org/abs/1602.03148v3) | arXiv v3: Theorem 4.28 and Remark 4.29 (pp. 42–43). The full-faithfulness argument is algebraic; the curve inputs address essential surjectivity. |

There were no `sourceIssues` entries to adjudicate, and no additional published-source mistake was established at a locator used here. The errors corrected above are blueprint statements or proof sketches. They are not recorded as errata to the papers.

## Baseline verification

Every one of the 32 entries exists under the stated name in the stated module at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their actual declarations, including implicit variables and typeclass hypotheses, were read at those commits. None was removed or renamed. These supply carriers and the explicitly cited lemmas, not a completed Beauville–Laszlo or relative-curve library.

`HenselianRing.provides` was narrowed: adic completeness yields henselianity along its ideal, but does not instantiate GR’s regular t and (R,tI), its approximation theorem, or the etale-neighbourhood conclusion. Formally smooth lifting genuinely lifts an algebra map into S/I when S is I-adically complete. `Module.Invertible` uses bijectivity of the canonical contraction; `Comodule.IsFaithful` is a scheme-theoretic closed immersion, not injectivity on points. The reductive category is over a field; no integral reductive carrier is claimed. Mathlib’s period rings are the p-typical carriers; relative identification is a further comparison contract.

The following exhaustive list links each cited module at its exact pin. Names sharing a module are grouped.

| Library | Declaration names | Module at pin |
|---|---|---|
| mathlib | `AdicCompletion`; `AdicCompletion.of`; `IsAdicComplete` | [Mathlib/RingTheory/AdicCompletion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) |
| mathlib | `IsLocalization.Away` | [Mathlib/RingTheory/Localization/Away/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Away/Basic.lean) |
| mathlib | `Localization.Away` | [Mathlib/GroupTheory/MonoidLocalization/Away.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/MonoidLocalization/Away.lean) |
| mathlib | `nonZeroDivisors` | [Mathlib/Algebra/GroupWithZero/NonZeroDivisors.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/NonZeroDivisors.lean) |
| mathlib | `Module.Projective` | [Mathlib/Algebra/Module/Projective.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Projective.lean) |
| mathlib | `Module.Finite` | [Mathlib/RingTheory/Finiteness/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Defs.lean) |
| mathlib | `Module.FinitePresentation` | [Mathlib/Algebra/Module/FinitePresentation.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/FinitePresentation.lean) |
| mathlib | `Module.Flat` | [Mathlib/RingTheory/Flat/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean) |
| mathlib | `Module.FaithfullyFlat` | [Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean) |
| mathlib | `Module.Free` | [Mathlib/LinearAlgebra/FreeModule/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean) |
| mathlib | `Module.Dual` | [Mathlib/LinearAlgebra/Dual/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Defs.lean) |
| mathlib | `Module.Invertible` | [Mathlib/RingTheory/PicardGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PicardGroup.lean) |
| mathlib | `TensorProduct` | [Mathlib/LinearAlgebra/TensorProduct/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Defs.lean) |
| mathlib | `LinearEquiv` | [Mathlib/Algebra/Module/Equiv/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Equiv/Defs.lean) |
| mathlib | `CommAlgCat.FiniteEtale` | [Mathlib/RingTheory/Etale/Finite.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Finite.lean) |
| mathlib | `Algebra.Etale` | [Mathlib/RingTheory/Etale/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Basic.lean) |
| mathlib | `Algebra.Smooth` | [Mathlib/RingTheory/Smooth/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Smooth/Basic.lean) |
| mathlib | `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` | [Mathlib/RingTheory/Smooth/AdicCompletion.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Smooth/AdicCompletion.lean) |
| mathlib | `HenselianRing` | [Mathlib/RingTheory/Henselian.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean) |
| mathlib | `IsDiscreteValuationRing` | [Mathlib/RingTheory/DiscreteValuationRing/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DiscreteValuationRing/Basic.lean) |
| mathlib | `BDeRhamPlus`; `BDeRham` | [Mathlib/RingTheory/Perfectoid/BDeRham.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean) |
| mathlib | `WittVector` | [Mathlib/RingTheory/WittVector/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean) |
| mathlib | `CategoryTheory.Equivalence` | [Mathlib/CategoryTheory/Equivalence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Equivalence.lean) |
| mathlib | `CategoryTheory.Functor.Monoidal` | [Mathlib/CategoryTheory/Monoidal/Functor.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean) |
| mathlib | `CategoryTheory.MonoidalCategory` | [Mathlib/CategoryTheory/Monoidal/Category.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Category.lean) |
| tauceti | `TauCeti.Comodule.IsFaithful`; `TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom` | [TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean) |
| tauceti | `TauCeti.AffineGroupSchemeCat` | [TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean) |
| tauceti | `TauCeti.ReductiveAffineGroupSchemeCat` | [TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean) |

The reviewed audit contains no RF4-layer result that is replanned as a new node. Existing completion, Witt-vector, period-ring, module and category carriers are cited rather than duplicated. RF0–RF3 and VB suppliers construct the spaces, divisors, completions, vector-bundle categories, affineness/GAGA and cohomology. R3/R5 supplies sheafy finite-projective descent and sousperfectoid stable uniformity. Reading these statements establishes the intended narrow imports; it does not let a sheafy theorem construct the missing crystalline-end charts.

## Closure, ownership and red-team check

All local prerequisites were checked against the target statements. Every external node prerequisite was read in the supplying decomposition or packet, not merely resolved by name. The checker counts repeated prerequisite occurrences: 40 integrated-node and 23 blueprint-node occurrences, alongside 59 baseline, 46 local and 4 stage occurrences. These are not counts of distinct suppliers.

The scheme and integral dictionaries required by RF4 are broader than BG0’s current `g-torsors-three-descriptions`, which is reductive over E on sousperfectoid spaces over E. Moreover that supplier lists the RF4 children as prerequisites. The packet’s exact BG0 request correctly identifies both the required generality and the RS-20 reverse edges to remove. The accepted RS-20 ownership decision is respected: no three-descriptions theorem or loop quotient presentation was recreated in RF4. D2’s function descent/acyclicity nodes do not themselves state bundle descent; the second request specifies that missing theorem. These requests are precise, but are not fulfilled imports.

RT-AREA-padic-1/19 is correctly applied in the packet **and the existing reader**: the two exports for the curve-lattice description and punctured algebraicity support AI.2 essential surjectivity. They are not prerequisites for its algebraic full-faithfulness proof. BMS Remark 4.29 independently confirms the distinction. The phi-module freeness results mentioned in the Guo–Reinecke route remain outside this patching layer. No blanket curve dependency was added to AI.2.

## Required revision and orchestrator questions

1. Complete native algebra morphism, extensionality, adjunction, tensor and base-change signatures and concrete examples. The Zariski computation and glueing-pair unit/noetherian/non-examples must be actual examples where carriers exist. For geometric omissions, identify the exact unavailable carrier per interface. Do not count CONTRACT comments as compiled tests or replace missing conditions by arbitrary propositions.
2. State and justify arbitrary-complement effectivity in general-E adic geometry, or assign its exact supplier. A fixed globally given reference bundle is only the lattice-modification case. An affinoid divisor does not automatically lie in one affinoid chart with a global equation.
3. Resolve BG0’s scheme, smooth integral and representation contracts in the ownership/generalities stated by the existing request, and remove its reverse RF4 prerequisites. RF4 must keep importing the dictionary.
4. Assign a foundation owner for SW 12.3.4, 12.3.5 and 12.4.1. HS2 is downstream of RF4 and cannot close this proof by a circular import. Also retain T in the varying-T modification comparison.
5. Instantiate GR 5.4.21 with actual R,t,I and the torsor scheme; explain the etale neighbourhood on S. Keep the cited reductive scope. A smooth nonreductive extension requires an additional proof. Either verify the published numbering or cite the public arXiv statement already checked.
6. Preserve the original crystalline-end ownership gap and attach its direct prerequisite when RF0 receives that stage. Neither removing V([varpi]) nor the annuli alone constructs the required full punctured-Spa charts.
7. Synchronize `research/blueprint/readmes/RelativeFarguesFontaine--RF4.md` with all corrections and partial coverage. It was read but not edited: issue #483 lists only the packet, suggested file and review report. Its status, old Zariski generator, fixed-reference scope, modification arrows/extensionality, repeated-divisor bounds, flat-module tensor formula, field-case gluing proof, varying-T equivalence, field-only closed-immersion criterion, overlapping sums and local-triviality scope contradict the corrected contract. The revision issue should include this reader among its deliverables.

These tasks are recorded in the packet’s seven gaps and child remaining lists. No outside job’s files, reader, atlas data or upstream roadmap were changed.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontaine--RF4.json` reports 0 errors and 0 warnings. The JSON review covers each of the 22 node IDs exactly once. `lean-check research/blueprint/suggested/RelativeFarguesFontaine--RF4.lean` succeeds with only declaration-uses-sorry warnings at the exact Mathlib pin. The file imports Mathlib only; Tau Ceti citations were checked separately by reading their exact pinned sources, rather than inferred from the later shared Tau Ceti build. Compilation checks the native signatures, not the geometric prose contracts. `git diff --check` passes. No implementation or promotion is claimed.
