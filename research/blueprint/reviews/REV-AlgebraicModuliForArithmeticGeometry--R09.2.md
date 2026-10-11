# Independent review: Hilbert and Quot representability (R09.2)

**Verdict: accepted after corrections.** Job `REV-AlgebraicModuliForArithmeticGeometry--R09.2`, issue #6291, reviewed by Codex (GPT-6), session `codex-VGjFmc`, on 11 October 2026. The author sessions recorded for the input are different from this reviewer. This accepts the target-level planning pass; it does not certify implementations or discharge supplier requests.

The reviewed artifacts are the [packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.2.json) and [suggested Lean file](../suggested/AlgebraicModuliForArithmeticGeometry--R09.2.lean). The packet's review object contains a verdict for every node. No node remains unverifiable and no unresolved mathematical contradiction was found.

## Counts and scope

| Item | Final count |
| --- | ---: |
| Nodes | 25 |
| Definitions / constructions / comparisons / theorems / applications | 2 / 10 / 2 / 10 / 1 |
| Verified / corrected / added / unverifiable nodes | 14 / 11 / 0 / 0 |
| API items on definitions and constructions | 49 |
| Additional theorem API item | 1 |
| Unit tests | 45 |
| Planets | 6 |
| Pinned baseline declarations | 22 |
| Named supplier requests / recorded gaps | 5 / 0 |
| Stages in scope / planned / closed | 1 / 1 / 0 |
| Confirmed / rejected source issues | 5 / 0 |

The input had 20 baseline citations, 46 definition/construction API items and 44 tests. This review adds two baseline citations, three construction API items, one theorem API item and one test. It strengthens existing tests without multiplying targets. All 25 implementation statuses remain `unchecked`. The packet remains a `complete` planning pass with R09.2 `planned`, not `closed`: five supplier contracts remain open before implementation.

The atlas stage's targets are all represented: quotient families and fixed-polynomial Hilbert/Quot representation; flattening and the bounded Grassmannian construction; graph Hom/Isom and polarized pairs; the distinction between universal-family flatness and parameter-space flatness; Chow modifications and the algebraic coherent-support inputs to proper GAGA. The target-level proof sketches retain intermediate algebra and cohomology arguments within their owning targets. No lemma-level expansion or new node was needed.

## Corrections made in place

1. **Quot equations.** `quot-grassmann-map` now directly depends on `sheaf-isom-representability`, which supplies the universal closed zero locus needed to impose evaluation-factorization equations. Added `sheaf_hom_zero_locus` to that theorem's API and the suggested file. Its proof pulls back the closed zero section of the affine sheaf Hom scheme. The target sheaf must be flat over the base; no flatness of the ambient scheme or source sheaf is added.
2. **Graph openness.** `relative-hom-functor` now directly names `graph-isomorphism-open`. Expanded the latter proof for proper flat finitely presented families, beyond the Noetherian projective-map case of Nitsure 6.5. Near an isomorphic fibre, remove the proper image of the non-quasi-finite locus, making the map finite. Remove the coherent cokernel support of the finite algebra map; then base-flatness makes its kernel sequence fibre-exact, and the kernel support can also be removed. Descent to a Noetherian model handles arbitrary bases. The resulting open represents the condition for every test scheme, including nonreduced tests. Added the two exact pinned Mathlib inputs listed below. Both source and target are proper in this argument.
3. **Hilbert construction and universal family.** Added `HilbertScheme.ofQuot` using the unit-sheaf Quot representation and Hilbert–Quot comparison, plus `HilbertScheme.pullback_universal`. The point test now checks the universal ideal is zero. The analogous Quot point test now checks its universal quotient is an isomorphism; the quotient is identified with the identity by a source-commuting isomorphism, rather than asserting literal equality of differently typed maps.
4. **Direct functor tests.** The relative-flatness examples now exercise `IsFlatOver`, rather than standalone scheme-flatness facts. The Hom nongraph test uses the actual graph map and the whole two-point family; a fourth Hom test counts exactly two points for a point mapping to two points. Isom's component-exchange and nonlinear-map tests now exercise `IsomFunctor` and `toHom`, with a new `toHom_apply` API. All four polarized tests now exercise `PolarizedIsomFunctor.obj`, retaining the actual line-bundle isomorphism.
5. **Chow tests.** The disconnected example quantifies over actual `ChowModification` objects and excludes a map covering only one component. The base-change example uses a modification of the identity X→X: pullback to a residue-field point outside the isomorphism open remains surjective, while its pulled open is empty. It tests the actual pulled map and does not impose density after arbitrary base change.
6. **Source locators and notation.** Stacks 99.9.2 is on PDF p. 25, corrected in the comparison and Hilbert-scheme nodes. Stacks 99.3.10 is on PDF p. 8. Corrected the two-term coherent-source presentation's first term from `E19` to `E1`.
7. **Existing sheaf owner.** The sheaf parameter-space proof explicitly imports current AlgebraicVectorBundles L0A–L0B. Its `importsFromTauCetiRoadmaps` record gives the commit, URL, layers and supplied comparison. That roadmap is absent from the atlas stage index, so this record supplements the indexed graph without inventing a stage id or claiming a pinned library declaration. Only finite locally free sources receive the arbitrary-pullback internal-Hom comparison; finite presentation alone is insufficient for nonflat pullback.
8. **Source-issue review and coverage.** Independently confirmed all five source issues and added their review records. E23 now corrects both generation sentences. Removed the completed independent-review task from `coverage.remaining`; the five supplier integrations and upstream catalogue synchronization remain explicit.

## Node-by-node disposition

The ids below have prefix `AlgebraicModuliForArithmeticGeometry:R09.2/`. These are mathematical and planning checks, not proofs inferred from elaboration.

| No. | Node | Verdict | Check |
| --- | --- | --- | --- |
| 1 | `relative-flat-module` | corrected | Affine/stalk flatness and arbitrary pullback are valid. The dual-number negative and closed-point pullback examples now exercise IsFlatOver itself, so a constantly true predicate fails. |
| 2 | `quotient-family` | verified | Native epimorphism, finite presentation, relative flatness, proper scheme-theoretic support and fibre polynomial have the required scopes; E and X need not be base-flat. |
| 3 | `quotient-equivalence` | verified | Native abelian-category cokernel uniqueness identifies source-commuting quotient equivalence with equality of embedded kernels; right exact pullback suffices. |
| 4 | `quot-functor` | verified | Fpqc descent is imported once; arbitrary affine limits retain the separately requested relative-module flatness descent. Empty tests remain singleton even for inadmissible polynomials. |
| 5 | `hilbert-functor` | verified | Native ideals preserve the embedding and nilpotents. Proper flat finite-presentation families and the polynomial agree with Stacks 99.9. |
| 6 | `hilbert-quot-comparison` | corrected | Kernel-ideal and quotient constructions are inverse on arbitrary tests. Corrected the exact Stacks 99.9.2 locator to PDF p. 25. |
| 7 | `flattening-strata` | verified | Nitsure 4.3 supports the universal locally closed, possibly nonreduced strata and finite set of occurring polynomials; arbitrary tests use the precise limit supplement. |
| 8 | `quot-grassmann-map` | corrected | Added the direct sheaf Hom/closed zero-locus prerequisite used for factorization equations. Evaluation reconstructs the actual quotient map, using images rather than falsely exact kernel pullback. |
| 9 | `quot-projectivity` | verified | Bounded Grassmannian immersion, DVR quotient extension and coherent global ambient prove projectivity in the stated coherent-presentation convention; no unconditional finite-free presentation is claimed. |
| 10 | `quot-scheme` | corrected | Yoneda gives the universal quotient and coherent base changes. Strengthened the point example to check the universal quotient is an isomorphism, with the precise identity-quotient wording. |
| 11 | `hilbert-scheme` | corrected | Added construction from the unit-sheaf Quot scheme and the universal pullback API; strengthened the point example to check the zero ideal. Corrected the Stacks comparison page. |
| 12 | `relative-hom-functor` | corrected | Added the direct universal isomorphism-locus dependency. The nongraph example now excludes the whole two-point family through the actual graph map; a fourth test counts the two HomFunctor points. |
| 13 | `graph-isomorphism-open` | corrected | Replaced the terse openness assertion by the finite-map, coherent kernel/cokernel and Nakayama proof, with exact existing Mathlib quasi-finite/finite citations and coherent-support prerequisite. Arbitrary bases and infinitesimal tests are justified. |
| 14 | `hom-representability` | verified | Quasi-projective completion and coherent extension give the support-open Hilbert pieces; graph openness gives separated locally finite-presentation Hom and quasi-compact fixed graph-polynomial pieces. |
| 15 | `relative-isom-functor` | corrected | Tests now use actual IsomFunctor points and exclude the square map from its forgetful image. Added toHom_apply so forgetting retains the specified underlying morphism. |
| 16 | `isom-representability` | verified | Second projection being an isomorphism is a universal open condition in graph Hom. The unrestricted functor is only locally of finite presentation; fixed graph pieces are finite presentation. |
| 17 | `sheaf-isom-representability` | corrected | Projective two-term presentations corepresent coherent-source Hom; pairwise inverse equations give affine finite-presentation Isom. Added the explicit closed zero-locus signature used by Quot, corrected the malformed first presentation term E19 to E1, and narrowed the Stacks Hom locator to p. 8. Explicitly imports current AlgebraicVectorBundles L0A–L0B internal Hom and finite locally free source comparisons; no arbitrary nonflat base-change theorem for a merely finitely presented source is assumed. |
| 18 | `polarized-isom-functor` | corrected | All four Lean tests now evaluate the functor itself, retaining α and its units on disconnected sources; no unconditional G_m fibre is asserted. |
| 19 | `polarized-isom-representability` | verified | The doubled polarization bounds graphs on finitely many base pieces; the affine finite-presentation sheaf-Isom morphism then gives quasi-compact separated finite presentation. |
| 20 | `dual-number-parameter` | verified | Finite flat rank-one families are graphs of sections, so Hilb1=X including its nonreduced structure. The closed-point example correctly separates universal flatness from parameter flatness. |
| 21 | `chow-modification` | corrected | Stacks 30.18.1–2 supplies proper projective surjection and a dense open isomorphism meeting every component. Proper original X implies projective cover, not projective X; density is not claimed after arbitrary base change. The disconnected-source exclusion and density-under-base-change examples now exercise ChowModification and its actual pulled map, rather than standalone native facts. |
| 22 | `support-power-filtration` | verified | Noetherian support implies annihilation by a finite ideal power; finite integral-support filtrations retain rank-one residue-field generic stalks and native subobjects. |
| 23 | `coherent-devissage` | verified | The witness must be supported on each integral closed subscheme, as corrected in E20. Exact classes suffice for rank-one witnesses; the positive-rank version separately assumes summand closure. |
| 24 | `generic-projective-test-sheaves` | verified | Choose the Chow cover birational over the integral support, then a high projective twist with vanishing higher pushforward. Its pushed witness has rank one at the generic point and the required support. |
| 25 | `chow-unit-support` | verified | The actual adjunction unit is an isomorphism on the specified open; proper coherent pushforward makes its kernel and cokernel coherent and supported on the complement, hence killed by finite ideal powers. |

## Source verification

Every node's statement, hypotheses, cited locator and proof route were checked against the cited text. Sources and results are recorded in our own words. The seven source hashes match the packet; the edition identifiers and access date are retained there. Page numbers below are printed source pages unless marked PDF.

| Source | Version checked | Cited material read |
| --- | --- | --- |
| [NITSURE](https://arxiv.org/pdf/math/0504590v1) | arXiv:math/0504590v1, 29 April 2005; preprint, not a claim about the FGA Explained version of record | §1, pp. 2–7; §2, pp. 9–13; §3, pp. 13–18; §4, pp. 18–23; §5, pp. 23–28; §6, pp. 29–31 |
| [GROTH221](https://www.numdam.org/item/SB_1960-1961__6__249_0.pdf) | Séminaire Bourbaki 221, 1960/61, volume 6, pp. 249–276 | §3, Theorems 3.1–3.2 and construction; §4(c), graph Hom/Isom and fixed-polynomial pieces |
| [STACKS-COHERENT](https://stacks.math.columbia.edu/download/coherent.pdf) | Chapter 30, version ed88ff78, compiled 14 July 2026 | §30.10, support and ideal powers; §30.12, coherent dévissage; §30.18, Chow lemma |
| [STACKS-QUOT](https://stacks.math.columbia.edu/download/quot.pdf) | Chapter 99, version ed88ff78, compiled 14 July 2026 | §99.3–4, sheaf Hom/Isom; §99.7, flat quotients and limit preservation; §99.9, Hilbert versus Quot; §99.12, graph morphisms |
| [STACKS-MODULI](https://stacks.math.columbia.edu/download/moduli.pdf) | Chapter 108, version ed88ff78, compiled 14 July 2026 | §108.5–7, fixed-polynomial Quot/Hilbert boundedness; §108.10–11, graphs and polarized Isom |
| [EGA-III1](https://www.numdam.org/article/PMIHES_1961__11__5_0.pdf) | Publications Mathématiques IHÉS 11 (1961); printed pp. 115–116 | §3.1, Definition 3.1.1, Theorem 3.1.2, Corollary 3.1.3 and proofs |
| [SGA1-XII](https://arxiv.org/pdf/math/0206203v2) | SMF Documents Mathématiques 3 (2003), arXiv:math/0206203v2 electronic re-edition; printed pp. 247–250, original margin pp. 326–331 | §4.1–4.4: comparison map, proper cohomology comparison and proper GAGA proof |

For exact Stacks locators, the checks included 30.10.2 (PDF p. 25), 30.12.3 (pp. 29–30), 30.12.6 (pp. 31–32), 30.18.1–2 (pp. 47–49), 99.3.10 (p. 8), 99.4.3 (pp. 9–10), 99.7.7 (pp. 19–20), 99.9.2 (p. 25), 99.12.1–2 (pp. 31–32), 108.10.5 (pp. 16–17) and 108.11.1 (pp. 17–18). The online [Stacks 76.49.6, tag 05XD](https://stacks.math.columbia.edu/tag/05XD), cited by 99.12.2, independently supports the universal open isomorphism condition; its flat, finite-presentation and universally closed source hypotheses were read.

The Nitsure preprint was read through its Quot and graph proofs, including the distinct coherent/local-free/free presentation cases in 5.1–5.3. Grothendieck's Bourbaki 221 Theorem 3.2 and construction (pp. 260–267), and §4(c) (pp. 267–268), support the representation and graph targets. The proper-GAGA algebraic inputs were checked against SGA 1 XII 4.2 and 4.4 (pp. 247–250); analytic comparison, full faithfulness and Ext lifting remain downstream inputs.

### Source mistakes checked independently

| Issue | Locator | Verdict and reason |
| --- | --- | --- |
| E19 | Nitsure v1, 3.7(3), p. 17 | Confirmed. Over A=k[ε]/ε², the vector-bundle extension of O by O(-2) on P¹_A with class ε has constant sole-fibre h⁰=h¹=1, but its pushforward is εA, not free. The Quot proof uses valid vanishing/base-change criteria instead. |
| E20 | Published EGA III1, 3.1.2, pp. 115–116 | Confirmed. The witness must have the prescribed closed support. On two disjoint points, the exact class of sheaves with equal component lengths contains a generic rank-one witness on both components together, but excludes a single-component sheaf. Stacks 30.12.6 supplies the support condition used here. |
| E21 | SGA 1 electronic v2, XII proof of 4.4, p. 250, original margin p. 331 | Confirmed for this edition. The displayed degree restriction excludes Ext¹ although the proof must lift an extension. The subsequent spectral-sequence comparison gives the needed nonnegative degrees. No assertion is made about an unchecked original printing. |
| E22 | Nitsure v1, exercise after Remark 2.2, p. 11 | Confirmed. The P¹ sequence O(-2)→O(-1)²→O, with regularity index 1, satisfies the middle/right hypotheses but fails the left H¹ condition. Surjectivity on H⁰ at the preceding twist is the missing assumption. |
| E23 | Nitsure v1, proof of 2.1(c), p. 11 | Confirmed. Both successive generation claims concern the sheaves F(r+p) and F(r), not their spaces of sections. Correcting both leaves the multiplication-map argument intact. |

The packet retains the author's earlier errata-search provenance and adds this independent recheck. Targeted primary searches found no additional erratum. The Nitsure findings are limited to arXiv v1; its publisher chapter was not available. The SGA finding is limited to the electronic re-edition. EGA's published text was read. No source passage was copied into these deliverables.

## Pinned library audit

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.

All original 20 declaration names and statements were confirmed at their cited modules. None was removed or replaced. The two added declarations are the quasi-finite-locus and proper-quasi-finite criteria. Across the 22 references, all 18 distinct cited source files were compared byte for byte with the existing pinned build. Hypotheses and conventions were read, rather than relying on a name search.

| Confirmed declaration and pinned source | Scope used here |
| --- | --- |
| [`AlgebraicGeometry.Scheme.Modules`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean) | The native abelian category of sheaves of O_X-modules, their sections, pullback and pushforward. |
| [`AlgebraicGeometry.Scheme.Hom.appLE`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean) | The ring map on sections over opens V⊆f⁻¹U. |
| [`Module.Flat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean) | Flat modules over a commutative ring. |
| [`AlgebraicGeometry.Flat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Flat.lean) | Flat scheme morphisms, with affine section/stalk criteria and stable base change. |
| [`TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean) | Native finitely presented sheaves, a full subcategory of X.Modules; no separate coherent-sheaf carrier. |
| [`CategoryTheory.Epi`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Category/Basic.lean) | Categorical epimorphisms of sheaves, hence quotient maps. |
| [`AlgebraicGeometry.IsProper`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Proper.lean) | Proper scheme morphisms and their composition/base-change behavior. |
| [`CategoryTheory.Limits.kernel`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Shapes/Kernels.lean) | Native kernels in the abelian category of sheaves of modules. |
| [`CategoryTheory.Subobject`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Subobject/Basic.lean) | Subobjects, retaining the embedding into the source. |
| [`AlgebraicGeometry.Scheme.IdealSheafData`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean) | Native quasi-coherent ideal data, with the closed subscheme and its immersion; preserves nilpotents. |
| [`AlgebraicGeometry.Scheme.Hom.ker`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean) | The kernel ideal of a scheme morphism, agreeing with the ring-map kernel on affine opens for quasi-compact maps. |
| [`AlgebraicGeometry.IsNoetherian`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Noetherian.lean) | Locally Noetherian plus quasi-compact scheme, and its Noetherian topological space. |
| [`CategoryTheory.uliftYoneda`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Yoneda.lean) | Representable functors with an explicit universe lift; no separate moduli representation category. |
| [`CategoryTheory.Over`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Comma/Over/Basic.lean) | Schemes over a fixed base, with commuting triangles as morphisms. |
| [`CategoryTheory.Iso`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Iso.lean) | Actual categorical isomorphisms with an inverse and the two inverse identities. |
| [`CategoryTheory.IsIso`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Iso.lean) | The property that a specified morphism has an inverse. |
| [`TauCeti.AlgebraicGeometry.InvertibleSheaf`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/LineBundle/Basic.lean) | Native invertible sheaves as a full subcategory of X.Modules, with the trivial invertible structure sheaf. |
| [`AlgebraicGeometry.Scheme.Hom.isIso_iff_finrank_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean) | A finite flat locally finitely presented morphism is an isomorphism iff its fibre rank is constantly one. |
| [`AlgebraicGeometry.Surjective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/UnderlyingMap.lean) | Surjectivity of the underlying scheme map, stable under base change. |
| [`AlgebraicGeometry.Scheme.Modules.pullbackPushforwardAdjunction`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean) | The native sheaf-module adjunction; pullback preserves cokernels and pushforward supplies the unit. |
| [`AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean) | The quasi-finite locus of a locally finite-type scheme map is open; no extra separatedness hypothesis is required. |
| [`AlgebraicGeometry.IsFinite.iff_isProper_and_locallyQuasiFinite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean) | A scheme morphism is finite if and only if it is proper and locally quasi-finite. |

The finite-flat rank-one criterion actually requires finite and flat; the packet's locally finitely presented hypothesis is harmless extra strength. `Scheme.Hom.ker` supplies the affine kernel description with the required quasi-compactness. `IsNoetherian` includes quasi-compactness, which is essential for uniform ideal-power exponents. Native `IdealSheafData` retains nilpotents and closed embeddings. A categorical `Epi` alone supplies no base-flatness or proper-support condition; the quotient-family record supplies those separately.

## Closure, existing owners and requests

The accepted A0-extension's R09.3 quasi-coherent pullback and fpqc descent signatures were reread; they permit arbitrary schemes and quasi-coherent modules. The relevant SF.0 support, coherent extension, qcqs pushforward and finite-presentation-limit statements were reread. Its limit target descends flat scheme morphisms but does not itself state relative flatness descent for a finitely presented module, so that precise supplement remains requested.

R09.1's exact Hilbert-polynomial, regularity, Serre, twists, very-ampleness, coherent-Grassmannian and Plücker suppliers were checked. Its current independent review is `needs_changes`; these are planned inputs, not implementations. Its corrected regularity index and coherent global ambient are preserved. R09.2 does not require every coherent ambient sheaf to admit a global finite-free presentation.

Current upstream roadmaps were checked at `070dc2becd74419e76303ede84b465ed4a69461f`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. JacobianChallenge and AlgebraicVectorBundles readers were read in full, and their relevant suggested signatures checked. ModularCurves 0F/0G and StableReduction J-C/Layer 2 reader contracts and suggested interfaces were checked. The nine roadmaps newer than the atlas snapshot were included in the overlap search. No full existing Hilbert/Quot construction was found. The reviewed `data/library-coverage.json` R09.2 entry was checked; no audited implemented target is replanned.

| Request | Required contract and boundary |
| --- | --- |
| R09.1/family-regularity and named siblings | Fixed-ambient quotient bounds and uniform tails on arbitrary tests; coherent global Grassmannian and Plücker embedding. No duplicate regularity or projective-space theory. |
| JacobianChallenge Layer C / StableReduction J-C | Proper coherent pushforward, flat-sheaf cohomology/base change and H⁰ corepresenting modules. The ambient X need not be base-flat. Pushforward coherence must also cover nonflat sheaves. Constant fibre dimensions over a nonreduced base are insufficient. |
| ModularCurves 0G | Relative Grassmannian of finite locally free rank-r quotients, universal native quotient, base change and projectivity. R09.2 adds evaluation and flattening equations. |
| StableReduction Layer 2 and precise R09.1 nodes | Relative Proj, projectivity, quasi-projective completion and proper-immersion closedness. AlgebraicVectorBundles owns sheaf operations/determinants; ModularCurves 0F owns affine finite-source Weil restriction. |
| SF.0 finite-presentation limits supplement | Eventual relative-module flatness and surjectivity descent, with the qcqs scheme version. The request gives the filtered algebra/module statement and cites Stacks 99.7.7 and Algebra 10.168.1. |

The graph construction has no dependency cycle with sheaf parameter spaces. Chow and coherent dévissage stop at algebraic support/coherence statements. ComplexComparisonPartII C3 remains the downstream owner of analytic comparison and proper GAGA; there is no upward C3 prerequisite. The six planets are Quot functor, Flattening stratification, Quot scheme, Hilbert scheme, Polarized isomorphisms and Chow lemma, all mathematical objects or named results.

## Validation and next steps

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.2.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.2.lean`: exit 0 at the recorded pins; 0 errors and 148 warnings, all declaration admissions using `sorry`.
- `python3 research/blueprint/intake.py check-files` on the packet, suggested file, report and handoff: 0 problems.
- `git diff --check`: clean. Only this job's three deliverables and mandatory handoff are changed.

Suggested-file SHA-256 at the successful elaboration: `70b494a215f4a919e1df9d52c376b1a098d55015886a66dfcb78c5ab30d21ce3`. Elaboration verifies that the proposed signatures and fixtures are well typed. The admitted examples are discriminating acceptance goals, not executed mathematical proofs.

No mathematical question blocks this review. For the orchestrator/package worker: integrate the five supplier exports before implementation; register/synchronize current AlgebraicVectorBundles ownership; and synchronize the R09.2 reader with the corrections above during the authorized packaging/assembly job. This issue does not authorize reader edits. Specifically carry the new APIs, direct proof dependencies, universal graph-locus proof, exact source pages, both E23 corrections and strengthened functor/Chow fixtures into that reader. Reuse the corrected suggested file. No second job was claimed.
