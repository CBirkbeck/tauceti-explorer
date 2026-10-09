# Independent review — refined trace methods, third revision

**Verdict: accepted as a complete target-level planning pass.** The three formerly unverifiable trace imports now use actual fine supplier declarations with acyclic prerequisite closures. All 154 nodes have been independently checked, with 125 verified and 29 corrected in place. No node is added or left unverifiable. The remaining source/foundation gaps are explicitly stated, so acceptance does not assert a gap-free implementation or that any proof is formalized.

Reviewer: Codex, session `codex-kiErYr`; job `REV-RefinedTraceMethods--RT.1~3`; issue #7551; date 2026-10-09. This session did none of the three planning rounds.

## Counts and scope

| Check | Result |
|---|---|
| Nodes | 154: 125 verified, 29 corrected, 0 added, 0 unverifiable |
| Definition/construction nodes | 75, each with at least three discriminating tests |
| Planning API / unit tests / planets | 372 / 251 / 29 |
| Pinned baseline declarations | 24 confirmed; none removed or replaced |
| Direct supplier declarations | 90 read with their hypotheses and scope |
| Exact requests / recorded gaps | 42 / 5 |
| Stages | 8 planned, 0 closed |
| Source catalogue / version records | 34 sources / 38 version records |
| Source issues | 24: 23 confirmed, E5 rejected; 8 added |
| Handed red-team findings | All 10 checked against their original findings |

The packet stays complete under Protocol §0: this is one finished pass below the node budget. Every scoped target has a declaration-sized node or is realized by its named substage, with prerequisite chains ending at existing libraries, exact owner interfaces/requests, or an honest gap. All 154 implementation statuses remain unchecked. Target-level granularity is preserved; no proof is split into lemma-level tasks and no other owner’s work is duplicated.

## Prior review and foundation ordering

The entire second-review report, including its 38 in-place correction requests and R1–R16 dispositions, was read. Its corrected shifts, totalizations, Kan-extension scope, coherent mapping paths, point-set restrictions, varying-base calculus, locally varying bundle ranks, solid-module handedness and arithmetic gluing inputs are retained. The earlier R6/R7/R12/R15 conditional supplier/source boundaries remain explicit. Its only three unverifiable nodes were the cyclotomic trace, multiplicative uniqueness, and coefficient categorical trace. Their repair is now checked at the actual supplier statements rather than accepted from a proposed stage title.

RT.5/localizing-motives has a fine prerequisite closure of 454 declaration IDs and RT.5/dualizable-categories has one of 28. Both closures were traversed, have no cycle, and contain no RT.1–RT.4 target. Their broad external stage leaves remain owner contracts; this check does not certify every future declaration in those stages. Small finitary cyclotomic THH factors through motives before mapping from the unit produces TC; TC itself is not claimed finitary. The module trace uses Mod_A≃Ind(Perf(A)) and the exact H.5 comparison request, not dualizability of Perf(A) for arbitrary A. The new planning-round node RT.3/finitary-invariant-tensor-units gives the direct BGT unit argument with an exact generic EDS Day/localization request and no import of the κ-finitary relative tensor audit. Dennis trace now directly imports that unit theorem as well.

Every one of the 90 direct supplier declarations was read with its prerequisites and statement, including the eight fine RT.5 inputs and the early RT.6 motivic declarations. All 42 requests were checked for an actual mathematical interface, conventions and consumers. A broad stage does not silently provide an absent fine theorem. The rational KU request was corrected from the polynomial ℚ[β] model to the Laurent ℚ[β±1] model. The library audit is respected: existing Hochschild, light condensed abelian, Witt, exterior-power and basic quasicategory objects are reused; their coherent/spectral refinements are owner requests.

## Every correction made in this review

**RT.1/hochschild-homology.** Exclude the zero ground ring from the singular nonvanishing/non-surjectivity test, matching the existing Lean Nontrivial hypothesis.

**RT.1/morita-invariance.** The matrix Morita test requires positive size.

**RT.1/hkr-map.** Exclude the zero ground ring from the singular nonvanishing/non-surjectivity test, matching the existing Lean Nontrivial hypothesis.

**RT.1/hkr-theorem.** Exclude the zero base in the singular detection example.

**RT.1/hkr-filtration.** Distinguish canonical functorial splitting from coordinate-dependent integral splittings.

**RT.2/trivial-cyclotomic-adjunction.** NS IV.4 pp. 364–365 states the TP target directly; no extra completion is imposed.

**RT.2/hz-module-circle-tate.** Remove the invented finiteness disclaimer and unnecessary bounded-below restriction from the prototype of NS IV.4.12.

**RT.2/geometric-fixed-points.** Replace the unrelated AMMN erratum reference by the actual NS index slip.

**RT.2/genuine-cyclotomic-spectrum.** Use the existing Bökstedt construction ID. Remove the unsupported allegation against NS II.3.4; the coalgebra route suffices. Replace the unproved fibre-product nonexample by a Borel-completion counterexample checked by Tate Hℤ. Add direct proof inputs: RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane.

**RT.2/orthogonal-cyclotomic-spectra.** Use the existing Bökstedt construction ID.

**RT.3/dennis-trace.** Add direct proof inputs: RefinedTraceMethods:RT.3/finitary-invariant-tensor-units. State the generator/sign conversion used by the degree-one API and tests. Make the cited sign explicit in the source match.

**RT.3/relative-trace.** Align the relative criterion with its nonconnective fibre, keeping the connective criterion separate.

**RT.3/hesselholt-nikolaus-assembly.** Add direct proof inputs: RefinedTraceMethods:RT.2/tate-orbit-lemma, RefinedTraceMethods:RT.2/thh-symmetric-monoidal. Remove the unsupported injective-image reading of the assembly map. Expose the connectivity and residual-circle steps of the assembly proof.

**RT.3b/trivial-vs-thh-fp.** Add direct proof inputs: RefinedTraceMethods:RT.2/bokstedt-construction.

**RT.3b/crystalline-trace-map.** Add direct proof inputs: RefinedTraceMethods:RT.3b/reduction-quasi-isogeny. Use consistent rational coefficients on the ordinary-reduction example.

**RT.3b/reduction-quasi-isogeny.** Replace the self-citation by the actual graded/TR, square-zero, Čech and Postnikov route; expose its missing cyclotomic foundation. Add direct proof inputs: RefinedTraceMethods:RT.2/tr-and-genuine-tc, RefinedTraceMethods:RT.3/square-zero-extensions, RefinedTraceMethods:RT.2/bounded-below-cyclotomic-equivalence. Give locators for every substantive step of the quasi-isogeny proof.

**RT.4:topological/reduced-and-graded-k.** Correct the relative-K long exact sequence section.

**RT.4:topological/splitting-principle.** Correct the K-theoretic Leray–Hirsch locator. Replace the nonexistent subsection/page combination by the splitting and Leray–Hirsch proof.

**RT.4:q-Hodge/spherical-lift.** Correct the gluing prototype documentation: its existing compatible-lift record already carries the rational compatibility, reductions and lifted Čech maps.

**RT.4:q-Hodge/nuclear-objects.** Retain the compact-tensor hypothesis of Wagner 2.11(d). State the extra hypothesis at the node boundary. Expose the compact-tensor hypothesis in Nuclear.homCompact. Exclude the zero ring in the compact non-nuclear example. Include the proposition supplying the Hom comparison and its hypotheses. Keep the source’s ambient compact-tensor quantifier over every compact module, and its stable compact generation/compact-unit assumptions; correct Theorem 2.11’s label.

**RT.4:q-Hodge/even-circle-fixed-points.** Match the API to the already-correct prototype truncation bounds. Make the comparison proof conditional on the actual bounds.

**RT.4:q-Hodge/solid-thh-even-filtration.** Retain the local conditions of Wagner 3.1–3.2 in the solid THH prototype. Retain Corollary 3.17’s p-torsion-free hypothesis on the target coefficient ring l in both statement and prototype.

**RT.4:q-Hodge/q-hodge-comparison-map.** Restrict the two-term polynomial formula to positive filtration indices. Restrict the mod-beta comparison prototype to the complete local input and the proved odd-prime or E₁-at-2 range.

**RT.4:q-Hodge/p-complete-comparison-odd.** Retain the multiplicative range n≥2 in Remark 4.9. State the range of the multiplicative conclusion. Correct the role of Theorem 4.12 in the comparison proof. Require the complete local hypotheses and identify the chosen lift with its coherent E₁/E₂ branch in the prototype.

**RT.4:q-Hodge/p-complete-comparison-two.** Bind the augmented cover coherence to R and its chosen lift, and retain all local hypotheses in the prototype.

**RT.4:q-Hodge/quasi-regular-quotients.** Use the p-completed relative cotangent bound, rather than imposing the stronger global quasi-lci condition on the identity-cover input.

**RT.4:q-Hodge/raksit-polynomial-example.** Restrict the two-term prototype formula to i≥1; fil⁰ is the full complex separately.

**RT.4:q-Hodge/cyclonic-spectrum.** Distinguish TR restriction from the existing subgroup maps.

**RT.4:q-Hodge/cyclonic-even-filtrations.** Cite the actual KU localization and completeness declarations.

Other edits: replaced all 154 review entries and the review summary with this session’s independent ledger; replaced the 24 baseline check records with fresh statement checks; refreshed the source-read records without changing principal editions; added three separately identified source versions; corrected the 2.63 Construction label in E16; added E17–E24; supplied fresh verdicts for all 24 source issues and ten red-team dispositions; recorded the fifth gap and added it to RT.2/RT.3b remaining work; regenerated the complete reader catalogue from the corrected packet, including every hypothesis, dependency, API, test, planet, gap and source verdict. No node ID, planet, baseline citation or existing request is deleted. No new planning API item, unit test or supplier request is introduced; helper interfaces in Lean make existing hypotheses explicit.

## Baseline declarations

All statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, not inferred from name matches. The additive Grothendieck form is used for bundle direct sum; the bicomplex totalizer provides coproduct totalization; light abelian categories do not provide solid spectra; quasicategory horn filling does not provide the whole coherent-category API. There is no baseline replacement or near-miss node to add.

| Declaration | Pinned file | Verified scope |
|---|---|---|
| `mathlib:Algebra.Etale` | `Mathlib/RingTheory/Etale/Basic.lean` | An R-algebra A is étale if it is formally étale and of finite presentation. |
| `mathlib:Algebra.GrothendieckGroup` | `Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean` | The Grothendieck group of a commutative monoid M, as the localisation of M at the top submonoid; @[to_additive] generates the additive form Algebra.GrothendieckAddGroup, which is the one applied to (Vect_ℂ(X), ⊕). |
| `mathlib:Algebra.Smooth` | `Mathlib/RingTheory/Smooth/Basic.lean` | An R-algebra A is smooth if it is formally smooth and of finite presentation. |
| `mathlib:AlgebraicTopology.alternatingFaceMapComplex` | `Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean` | The alternating face map complex functor SimplicialObject C ⥤ ChainComplex C ℕ of a preadditive category C, with differential Σ(−1)^i d_i. |
| `mathlib:AlgebraicTopology.normalizedMooreComplex` | `Mathlib/AlgebraicTopology/MooreComplex.lean` | The normalized Moore complex functor SimplicialObject C ⥤ ChainComplex C ℕ of an abelian category. |
| `mathlib:CategoryTheory.SimplicialObject` | `Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean` | Simplicial objects SimplexCategoryᵒᵖ ⥤ C in a category C. |
| `mathlib:CategoryTheory.Tor` | `Mathlib/CategoryTheory/Monoidal/Tor.lean` | The left-derived functors Tor_n of the tensor product in a monoidal abelian category with enough projectives. |
| `mathlib:DividedPowerAlgebra` | `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean` | The divided power algebra of an R-module M, as a quotient of the polynomial ring on symbols x^[n] m. |
| `mathlib:ExteriorAlgebra.exteriorPower` | `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean` | The n-th exterior power ⋀[R]^n M as a submodule of the exterior algebra. |
| `mathlib:HomologicalComplex₂.total` | `Mathlib/Algebra/Homology/TotalComplex.lean` | The cited bicomplex totalizer is built from coproducts, giving direct-sum totalization. This declaration does not supply the product or finite-lower-bound Laurent totalizations required by cyclic theory. |
| `mathlib:KaehlerDifferential` | `Mathlib/RingTheory/Kaehler/Basic.lean` | The module of Kähler differentials Ω[S⁄R] of an R-algebra S, as I/I² for the diagonal ideal I. |
| `mathlib:Matrix.trace` | `Mathlib/LinearAlgebra/Matrix/Trace.lean` | The trace of a square matrix. |
| `mathlib:Module.Flat` | `Mathlib/RingTheory/Flat/Basic.lean` | Flatness of a module over a ring. |
| `mathlib:MoritaEquivalence` | `Mathlib/RingTheory/Morita/Basic.lean` | A Morita equivalence between R-algebras A and B: an R-linear equivalence of module categories ModuleCat A ≌ ModuleCat B. |
| `mathlib:VectorBundle` | `Mathlib/Topology/VectorBundle/Basic.lean` | Topological vector bundles over a field with fibre model F: a fibre bundle whose trivialisations are fibrewise linear with continuous coordinate changes. |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | The ring of p-typical Witt vectors 𝕎 R. |
| `mathlib:WittVector.frobenius` | `Mathlib/RingTheory/WittVector/Frobenius.lean` | The Witt vector Frobenius 𝕎 R →+* 𝕎 R. |
| `mathlib:WittVector.verschiebung` | `Mathlib/RingTheory/WittVector/Verschiebung.lean` | The Verschiebung 𝕎 R →+ 𝕎 R. |
| `mathlib:tateCohomology` | `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean` | Tate cohomology Ĥ^n(G, M) ∈ ModuleCat R of a representation M of a finite group G, from the Tate complex built with the norm map. |
| `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoEven` | `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean` | For a finite group G generated by g (hence cyclic), tateCohomology M n for every even n is isomorphic to the homology of the norm/(g − 1) complex of M, independently of n: two-periodicity in even degrees. |
| `mathlib:SSet.Quasicategory` | `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean` | Inner-horn fillers for every 0<i<n; this predicate already exists, whereas the coherent category operations and mapping-space theorems remain imported. |
| `mathlib:LightCondMod` | `Mathlib/Condensed/Light/Module.lean` | Sheaves of ModuleCat R on LightProfinite with the coherent topology, with an Abelian instance; this is the light abelian baseline, not solid spectral modules. |
| `mathlib:LightCondAb` | `Mathlib/Condensed/Light/Module.lean` | LightCondMod Z, with its abelian category instance, used as the target of condensed homotopy sheaves. |
| `mathlib:CategoryTheory.Limits.PreservesFilteredColimits` | `Mathlib/CategoryTheory/Limits/Preserves/Filtered.lean` | Preservation of all colimits indexed by filtered categories small in the source morphism universe; it quantifies over every such J, not just N. |

## Public sources and additional findings

The 34 principal public files were read at every target locator and matched the recorded hashes. The published NS text supplies its source checks; the separately retained NS arXiv receipt is historical. Current Wagner and Raskin author copies and the published 2019 NS correction were separately read for version/correction checks. No uncleared book was needed. The catalogue is organized by the development’s targets, and contains the reviewer’s mathematical paraphrases rather than source passages or a section-by-section source synopsis.

| Source | Principal version read | URL |
|---|---|---|
| `ammn-20` | arXiv:2003.12541v2 (29 Sep 2021); numbering checked against v1 (Corollary 3.9 exists only in v2) | [source](https://arxiv.org/pdf/2003.12541v2) |
| `bgt-13` | arXiv:1001.2282v4 (5 Feb 2013); published Geom. Topol. 17 (2013) 733–838 | [source](https://arxiv.org/abs/1001.2282v4) |
| `bgt-14` | arXiv:1103.3923v3 (1 Jul 2015) | [source](https://arxiv.org/abs/1103.3923v3) |
| `blumberg-mandell-12` | arXiv:0802.3938v4 (24 May 2012); published Geom. Topol. 16 (2012) 1053–1120 | [source](https://arxiv.org/abs/0802.3938v4) |
| `bms2-19` | arXiv:1802.03261v2 (9 Apr 2019); published Publ. Math. IHÉS 129 (2019) 199–310; arXiv pagination used | [source](https://arxiv.org/pdf/1802.03261) |
| `cmm-21` | arXiv:1803.10897v2 (20 Jul 2020); published J. Amer. Math. Soc. 34 (2021) 411–473 | [source](https://arxiv.org/abs/1803.10897v2) |
| `cortinas-06` | arXiv:math/0111096v5 (3 Oct 2005); published Invent. Math. 164 (2006) 143–173 | [source](https://arxiv.org/abs/math/0111096v5) |
| `devalapurkar-raksit-25` | arXiv:2505.02218v2 (20 Jul 2026) | [source](https://arxiv.org/abs/2505.02218) |
| `devalapurkar-thesis` | PhD thesis, Harvard University (PDF from the author's page, version of 4 Sep 2026); printed page numbers | [source](https://sanathdevalapurkar.github.io/files/thesis.pdf) |
| `dundas-97` | Acta Math. 179 (1997) 223–242 (published scan) | [source](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf) |
| `gepner-snaith-09` | arXiv:0712.2817v3 (27 May 2010); published Doc. Math. 14 (2009) 359–396 | [source](https://arxiv.org/pdf/0712.2817) |
| `ginzburg-05` | arXiv:math/0506603v1 (29 Jun 2005) | [source](https://arxiv.org/pdf/math/0506603) |
| `hatcher-vbkt` | Version 2.2 (November 2017); printed page numbers | [source](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf) |
| `hesselholt-nikolaus-19` | arXiv:1905.08984v1 (22 May 2019); Handbook of Homotopy Theory (2020) | [source](https://arxiv.org/abs/1905.08984v1) |
| `hkr-62` | Trans. Amer. Math. Soc. 102 (1962) 383–408 (published scan) | [source](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HKR62.pdf) |
| `hoyois-15` | arXiv:1506.07123v2 (21 Apr 2018) | [source](https://arxiv.org/pdf/1506.07123) |
| `hrw-22` | arXiv:2206.11208v3 (19 Oct 2025) | [source](https://arxiv.org/abs/2206.11208) |
| `land-tamme-19` | arXiv:1808.05559v3 (8 Nov 2019); published Ann. of Math. 190 (2019) 877–930 | [source](https://arxiv.org/abs/1808.05559v3) |
| `lmmt-24` | arXiv:2001.10425v5 (18 Dec 2023); published J. Amer. Math. Soc. (2024) | [source](https://arxiv.org/abs/2001.10425v5) |
| `loday-quillen-84` | Comment. Math. Helv. 59 (1984) 565–591 (published scan) | [source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf) |
| `lurie-ec2` | Version of 26 April 2018 (author's page) | [source](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf) |
| `lurie-ha` | Version of 18 September 2017 (author's page) | [source](https://www.math.ias.edu/~lurie/papers/HA.pdf) |
| `may-concise` | Revised author's PDF of the 1999 University of Chicago Press edition | [source](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf) |
| `mccarthy-97` | Acta Math. 179 (1997) 197–222 (published scan) | [source](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf) |
| `nikolaus-scholze-18` | Acta Math. 221 (2018) 203–409 (published version; printed pages), compared with arXiv:1707.01799v2 | [source](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf) |
| `pstragowski-23` | arXiv:2304.04685v2 (24 Oct 2024) | [source](https://arxiv.org/abs/2304.04685) |
| `raskin-18` | arXiv:1807.06709v1 (17 Jul 2018) | [source](https://arxiv.org/abs/1807.06709v1) |
| `wagner-habiro-25` | arXiv:2510.04782v2 (8 Oct 2025); Corollary 3.13 numbering identical in v1 | [source](https://arxiv.org/abs/2510.04782) |
| `wagner-ku-25` | arXiv:2510.06057v1 (7 Oct 2025) | [source](https://arxiv.org/abs/2510.06057) |
| `weibel-geller-91` | Comment. Math. Helv. 66 (1991) 368–388 (published scan) | [source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf) |
| `antieau-riggenbach-24` | arXiv:2411.19929v1 (29 November 2024) | [source](https://arxiv.org/pdf/2411.19929v1) |
| `keller-cyclic-96` | Author manuscript dated 13 May 1996 | [source](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf) |
| `bauval-cyclic-16` | arXiv:1611.08437v1 (25 November 2016; 1998 manuscript) | [source](https://arxiv.org/pdf/1611.08437v1) |
| `hesselholt-96` | Author’s manuscript, 23 February 1996; published Acta Math. 177 (1996), 1–53 | [source](https://math.mit.edu/~larsh/papers/005/acta.pdf) |

The exact theorem, section and page numbers appear at each reader declaration and in its packet source binding. E1–E16 were all reread and receive fresh reasons: fifteen confirmed and E5 rejected. In particular, a narrower proving scope does not establish the allegation in E5, and 6.23 is a corollary about rational left Kan extension. E14 remains a genuine missing definition/proof input, without claiming that a sufficient even-flat replacement is equivalent to the undefined phrase.

| Added issue | Locator and correction | Version/search limit |
|---|---|---|
| `RefinedTraceMethods/E17` | Published Acta Math. 221 (2018), proof of Lemma II.2.11, p. 252: Use the G-fixed subspace V^G; it is zero for the reduced regular representations used there. | Already recorded as PAPER-NIKOLAUS-SCHOLZE-18/E6 in the atlas, awaiting review; absent from the published 2019 correction. |
| `RefinedTraceMethods/E18` | arXiv:1807.06709v1, Theorem 2.12.2(1), p. 11, against Definition 2.11.2, p. 10, and §4.11, p. 30; same wording in current author PDF: Apply pseudo-extensibility to M ↦ fib(TC(A⊕M)→TC(A)), the reduced functor used in §4.11. | new |
| `RefinedTraceMethods/E19` | Author manuscript dated 23 February 1996, proof of Theorem B, p. 24 (not journal pagination): Its target is the Y-indexed Čech complex associated to the morphism X_r→Y_r introduced immediately before the display. | new |
| `RefinedTraceMethods/E20` | arXiv:2003.12541v2, proof of Proposition 3.1, p. 15, Cartier-module lifting argument: The Verschiebung commutator is Vg(z)−g(Vz). | Already confirmed as PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22/E5 in the atlas; this finding is scoped to the read v2. |
| `RefinedTraceMethods/E21` | arXiv:2510.06057v1, Lemma 3.13, p. 28; current author version dated 4 February 2026, same lemma, p. 29: With the displayed E₂^{r,s} convention the target degree is r+2s. | new |
| `RefinedTraceMethods/E22` | arXiv:2510.06057v1, proof of Corollary 3.17, p. 31; current author version, p. 32: The first case is 3.2(E₁); the second is 3.2(E₂), treated using Proposition 3.11. | new |
| `RefinedTraceMethods/E23` | arXiv:2510.06057v1, proof of Theorem 5.51(c), p. 78; current author version, p. 79; compare Lemmas 5.56–5.57: The required comparison is Lemma 5.57; Lemma 5.56 computes the geometric fixed-point term used inside its proof. | new |
| `RefinedTraceMethods/E24` | Current thesis PDF, Remark 6.4.21, printed p. 243 (PDF p. 252), preceding long exact sequence: The injection lands in π₁G_m, following the vanishing π₂G_m term in the displayed long exact sequence. | new |

E17 and E20 already have atlas findings; their cross-references are recorded. The four-page 2019 NS correction does not include E17. E18 is explicitly a preprint/current-author-copy finding: the reduced TC functor is the intended assertion, and no unread published paper is accused. Wagner’s February 2026 copy retains E21–E23; its altered nuclear-definition numbering is recorded separately and does not change the v1 node locators. E19 is restricted to the February 1996 manuscript pagination. E24 is against the precise hashed thesis file, with the printed/PDF page distinction. Bounded correction searches and all independent reasons are in sourceIssues and the reader.

## Remaining gaps and routing questions

**Barwick–Glasman comparison of orthogonal and genuine cyclotomic spectra.** NS18 Theorem II.3.7 cites Barwick–Glasman for N(CycSp^O)[F-equivalences^{−1}] ≃ CycSp^gen; the proof was not read. The modern comparison TC^gen = TC (RT.2/genuine-tc-agrees) for THH of connective rings uses it only through the classical Bökstedt model.

**Light condensed and solid spectra have no published reference.** Mathlib already has LightCondMod and LightCondAb. The missing supplier is their light solid spectral extension: coherent mapping spectra, relative right-left tensor, filtered compactness, nuclearity and spectral sheafification. Wagner §2.1 relies on unpublished Clausen–Scholze lectures; VS2 must supply a public construction or a verified lecture interface. The baseline abelian definitions are not missing.

**Unproved or sketched steps in Wagner's ku paper.** Wagner arXiv 2510.06057v1: the gluing of per-prime lifts in 4.18 is asserted without proof; Lemma 4.29 and Theorem 4.14 have sketched proofs; the identification of the q-Hodge complex with gr^0 of the KU filtration (§5 introduction) has no proof; fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}(…) in Theorem 5.51 is sketched. These are recorded at the nodes; no step is claimed beyond the source. Theorem 2.20 also uses the undefined phrase solid homologically flat (source issue E14); the plan uses the explicit sufficient solid even-flat hypothesis, without asserting equivalence to the undefined phrase.

**Polynomial left Kan extension for the uncompleted graded Beilinson map.** The exact early RT.6 motivic, cyclic, syntomic, characteristic-p and trace-flat-descent nodes supply the filtration/descent inputs. None supplies the remaining polynomial left Kan extension of syntomic/TC functors and its comparison with uncompleted p-derived de Rham used in AMMN Theorem 5.1(2), p. 25, its proof and Construction 5.33, pp. 34–35, and Construction 6.16 and proof of Theorem 6.17, pp. 44–45. Retain the RT.6 request for that precise residual interface until a supplying declaration is planned. RT.6/ammn-filtered-interface already imports RT.3b/graded-beilinson-square and cannot be its supplier.

**Cyclotomic t-structure and TR detection of quasi-isogenies.** AMMN §3.1, Propositions 3.1–3.3, pp. 15–16, uses Antieau–Nikolaus’s left-complete p-typical cyclotomic t-structure, its derived V-complete Cartier heart, π_*TR detection, the null-Frobenius product formula and convergence along connective cyclotomic towers. RT.2 supplies genuine TR and bounded-below comparison but has no declaration for this t-structure/detection interface. Ordinary spectral Postnikov sections do not fill it. Plan the missing cyclotomic interface in RT.2 after reading the Antieau–Nikolaus construction; generic coherent t-structure machinery remains owned by EDS. The proof sketch above records precisely where that input is used.

The newly recorded fifth gap makes AMMN’s quasi-isogeny route honest: TR detection uses the cyclotomic t-structure and Cartier heart, not just the already requested spectral Postnikov tower. A continuation should plan the specialized interface in RT.2 after reading Antieau–Nikolaus; generic t-structure machinery remains EDS-owned. This review neither invents that proof nor claims that the source’s Theorem 3.4 can prove itself.

The orchestrator should retain all five explicit gaps and 42 exact requests when assigning follow-ups. The early RT.5 display split remains a presentation proposal; fine mathematical imports work without it. The henselian and real/equivariant topological Part II proposals remain unchanged, and aggregate RT.4 should not supply real K-theory. No upstream roadmap or atlas structure was edited. There is no unresolved contradiction requiring the plan to return for another revision.

## API, suggested file and planets

All 75 definition/construction APIs and their 251 tests were checked as mathematical discriminators. The added review fixes retain nonzero/positive-size examples, the correct Borel Hℤ failure, the compact-tensor hypothesis, AR truncation bounds, the full completed local lift/branch inputs and the positive q-Hodge filtration range. The complete suggested file, including its coherent primary interfaces and ordinary shadows, was read. Additional helper witnesses expose the packet’s hypotheses; they do not implement solid spectra, derived objects or comparison proofs. Its 372 planning API names remain represented. All 29 planet labels denote named definitions, constructions or central theorems, respect the length/per-stage bounds and introduce no aggregate duplicate.

## All ten original red-team findings

**RT-AREA-ktheory-2/3 — checked.** Thesis 6.4.1 and DR 6.1.4 keep the two j conventions and the separate odd-prime/2-primary hypotheses; the local prototype now includes the actual completed lift and cover inputs.

**RT-AREA-ktheory-2/30 — checked.** Checked the even-site, even-flat, sheafified homological-evenness, Assumption R and synthetic finite Tate definitions against Pstrągowski, Wagner and AR. Light abelian categories are reused; the solid spectral foundation and source proof sketches remain explicit gaps.

**RT-AREA-ktheory-2/31 — checked.** The exact HR.6 degree-zero identification is imported. The periodic Habiro comparison has its own coherent divisor diagram and requires the independent discriminant and 6-inversion conditions.

**RT-AREA-ktheory-2/32 — checked.** The accepted RS-33 spectra foundation supplies H.5:spectra. THH and KU use its smash/ring/operadic interfaces rather than S-delooping.

**RT-AREA-ktheory-2/33 — checked.** RT.2 owns genuine/modern TC and graded TR/Witt comparison. L.4 imports the general agreement and keeps the local-field specialization; classical THH point-set conditions remain explicit.

**RT-AREA-ktheory-2/35 — checked.** RT.3 exports nilpotent, rational and complete-tower squares. The stronger henselian square is assigned to the proposed Part II; it is not claimed from DGM.

**RT-AREA-ktheory-2/37 — checked.** DD.0/DD.2 supply cotangent, derived exterior-power and de Rham constructions. RT.1 adds the cyclic HKR comparison, respecting normalization and smoothness/derived bounds.

**RT-AREA-ktheory-2/43 — checked.** Snaith localization supplies the operation on KU[1/k] with β↦kβ. Complex λ, Adams, Chern and character targets are covered; real/equivariant/completion and p-adic extensions are assigned to Part II.

**RT-AREA-ktheory-2/44 — checked.** DGAInfinity supplies Hochschild chains and Morita invariance. Keller’s precyclic cone and Bauval’s completed coextension supply the distinct cyclic enhancement; the leading shuffle alone is not B-compatible.

**RT-AREA-ktheory-2/46 — checked.** The exact K.4/K.6 model comparisons remain requests. Fine motives and dualizable-category supplier closures are acyclic and contain no RT.1–RT.4 target; the direct BGT finitary Day-unit node resolves the earlier backward whole-stage dependency.

## Complete independent node ledger

Each entry follows the source/hypothesis, proof-input, API/test and suggested-interface checks. Verification of an explicitly conditional plan does not assert that an owner request or recorded gap is already proved. Exact numbered locators are retained in the packet and reader.

| Node | Verdict | Independent check |
|---|---|---|
| `RT.1/cyclic-category` | verified | The cyclic presentation and factorization in NS Appendix B agree with the unsigned operators. The signed Connes operator is separately tested. |
| `RT.1/cyclic-bar-construction` | verified | Faces, multiplication, unit degeneracies and rotation give the cyclic enhancement of the imported DGA Hochschild construction. |
| `RT.1/hochschild-homology` | corrected | The derived enveloping algebra is used in the Tor description; ordinary chains require the stated flatness. No existing Hochschild construction is replanned. Corrections: Exclude the zero ground ring from the singular nonvanishing/non-surjectivity test, matching the existing Lean Nontrivial hypothesis. |
| `RT.1/connes-operator` | verified | The signed operator and extra degeneracy give bB+Bb=0 and B²=0. The polynomial sign test distinguishes unsigned rotation from the chain operator. |
| `RT.1/mixed-complex` | verified | The carrier is integer graded, with both squares zero and anticommutation. Negative-degree and one-relation counterexamples discriminate the definition. |
| `RT.1/cyclic-homology` | verified | The three totalizations use different sums, products and Laurent bounds. Keller/Hoyois justify their derived invariance with those completions. |
| `RT.1/sbi-sequence` | verified | SBI applies in integer degrees; bottom-degree vanishing is only asserted with the explicit nonnegative hypothesis. |
| `RT.1/morita-invariance` | corrected | Keller’s nonunital corner argument takes place in the derived precyclic model. Matrix Morita equivalence requires positive matrix size. Corrections: The matrix Morita test requires positive size. |
| `RT.1/external-products` | verified | The normalized leading shuffle supplies HH products, and Bauval’s cyclic coextension supplies the completed cyclic products; no strict B-compatibility is assumed. |
| `RT.1/base-change` | verified | Perfect base change commutes with the negative/periodic product totalizations. The flat infinite-product test prevents weakening perfectness to flatness alone. |
| `RT.1/etale-base-change` | verified | Weibel–Geller’s theorem keeps the ground ring fixed and assumes A→B étale. It does not supply arbitrary cyclic base change of the ground ring. |
| `RT.1/hkr-map` | corrected | Projection after antisymmetrization is n!, consistent with the Koszul exterior signs and the two-variable calculation. Corrections: Exclude the zero ground ring from the singular nonvanishing/non-surjectivity test, matching the existing Lean Nontrivial hypothesis. |
| `RT.1/hkr-theorem` | corrected | The smooth chart/Koszul proof is an exact DD request; where n! is invertible the inverse is projection divided by n!. The singular test excludes the zero base. Corrections: Exclude the zero base in the singular detection example. |
| `RT.1/b-equals-d` | verified | Connes B corresponds to the de Rham differential through antisymmetrization; the normalized rational projection uses the preceding factorial convention. |
| `RT.1/hkr-cyclic-char0` | verified | The smooth characteristic-zero comparison uses the Hodge truncations and product completion specified by the mixed model. |
| `RT.1/hkr-filtration` | corrected | BMS gives the derived complete filtration with exterior-power graded pieces. General functorial rational splitting does not rule out integral coordinate splittings. Corrections: Distinguish canonical functorial splitting from coordinate-dependent integral splittings. |
| `RT.1/hh-universal-property` | verified | The tensor S¹⊗A universal property is in commutative algebras. Higher tensors, cotensors and action coherences remain precisely requested from EDS. |
| `RT.1/hh-of-fp` | verified | NS IV.4.3 supplies the divided-power HH calculation. IV.4.7 is a different THH fixed-point extension and is not its proof. |
| `RT.2/spectra-with-action` | verified | The coherent BG functor category, mapping spectra and restriction functors use general Kan extension; no full-inclusion hypothesis is smuggled into BG→*. |
| `RT.2/homotopy-orbits-fixed-points` | verified | Limits/colimits define homotopy fixed points/orbits with the stated adjunctions. The group (co)homology dictionary retains the discrete-group condition. |
| `RT.2/norm-map-tate` | verified | Finite Tate is the cofiber of the unshifted norm with its residual action. The algebraic baseline norm is an ingredient, not the spectral construction. |
| `RT.2/tate-of-eilenberg-maclane` | verified | π_i(HM^{tG}) uses Tate cohomology in degree −i. Trivial cyclic actions give the stated norm and two-periodic examples. |
| `RT.2/tate-vanishing-induced` | verified | Induced Tate vanishing extends through finite cofibers, shifts and retracts. Arbitrary colimit closure is excluded. |
| `RT.2/tate-multiplicativity` | verified | Tate is lax symmetric monoidal with a noninvertible unit comparison in general. The source and tests distinguish lax from strong structure. |
| `RT.2/tate-p-local-properties` | verified | Order-invertible coefficients give vanishing; p-primary/completion conclusions keep their finite-group and stated convergence hypotheses. |
| `RT.2/tate-orbit-lemma` | verified | The residual C_{p²}/C_p action and bounded-below hypothesis are retained. The source’s unbounded test prevents removing that hypothesis. |
| `RT.2/tate-fixpoint-lemma` | verified | The fixed-point lemma uses its finite subgroup tower and bounds; it does not authorize arbitrary interchanges of inverse limits and Tate. |
| `RT.2/parametrised-tate` | verified | The norm for a parametrized action includes its dualizing spectrum. Coherent residual actions and the universal adjunction are explicit supplier interfaces. |
| `RT.2/circle-tate` | verified | The circle norm starts at ΣX_hT. Its shift agrees with the algebraic ΣHC norm sequence rather than the unshifted finite-group norm. |
| `RT.2/tate-cpn-via-cp` | verified | The C_{p∞}/C_p comparison uses bounded-below input and the prescribed p-completion; these are not discarded in the tests. |
| `RT.2/cyclic-realisation` | verified | NS B.5 and B.19 supply cyclic realization with a circle action. Coherent realization and general Kan extension remain owner requests. |
| `RT.2/edgewise-subdivision` | verified | The edgewise functor has the block C_p permutation and quotient-circle identification. The unit subdivision and order tests match its conventions. |
| `RT.2/tate-diagonal` | verified | NS III.1 supplies the natural multiplicative Tate diagonal. Sphere and characteristic-p tests retain the prime-dependent target. |
| `RT.2/thh-e1-ring` | verified | The cyclic E₁ bar defines THH; the degree-zero map is on underlying spectra, whereas the sphere unit is equivariant. |
| `RT.2/cyclotomic-frobenius-thh` | verified | Subdivision followed by the Tate diagonal yields each prime Frobenius, including the residual-circle identification and action compatibility. |
| `RT.2/thh-symmetric-monoidal` | verified | The symmetric monoidal THH construction has its equivariant unit and relative tensor comparison. It is stronger than lax Tate monoidality. |
| `RT.2/relative-thh` | verified | The relative tensor is over a central E∞ base. A Frobenius on relative THH requires the specified cyclotomic structure on that base. |
| `RT.2/thh-over-thhz` | verified | The relative THH(ℤ) base change agrees with derived Hochschild homology with its circle action, using the requested module/derived-category comparison. |
| `RT.2/mixed-complexes-are-circle-modules` | verified | Hoyois’s mixed localization models circle-equivariant Hk-modules. The coherent primary equivalence is distinguished from its ordinary category shadow. |
| `RT.2/norm-sequence-hc` | verified | The ΣHC→HC⁻→HP norm sequence follows the circle comparison; suspension and u-degree conventions agree throughout. |
| `RT.2/thh-spherical-group-rings` | verified | The cyclic bar of the group gives THH(S[G]); the polynomial example avoids a spurious additional coefficient-ring factor. |
| `RT.2/thh-spectral-categories` | verified | The cyclic spectral nerve uses derived smash products. BM’s cyclotomic structure, localization and Morita results provide the substantive theorem inputs. |
| `RT.2/lax-equalizer` | verified | Mapping spaces include the coherent path between the two composites. Presentability/exactness conditions are separate from the ordinary equalizer shadow. |
| `RT.2/cyclotomic-spectrum` | verified | Objects have one Frobenius for each prime into parametrized Tate, with the quotient-circle action. Mapping paths and prime coherence are preserved. |
| `RT.2/tc-minus-and-tp` | verified | TC⁻ is circle fixed points and TP is circle Tate, with the canonical and Frobenius arrows kept distinct and their completion specified. |
| `RT.2/topological-cyclic-homology` | verified | TC is the mapping spectrum from the cyclotomic sphere. Integral and p-typical formulas have distinct index diagrams and universal properties. |
| `RT.2/tc-fibre-sequence` | verified | NS’s fiber/product formula includes the residual action and prime-product map. The p-complete simplification keeps boundedness where used. |
| `RT.2/tc-p-completion` | verified | The source’s p-completion comparison is used in its stated range. Agreement at every prime is not asserted to imply integral agreement automatically. |
| `RT.2/trivial-cyclotomic-adjunction` | corrected | NS IV.4 has the direct TP target. The characteristic-p E₂ clause retains primality and (p=0) in π₀, without an extra completion. Corrections: NS IV.4 pp. 364–365 states the TP target directly; no extra completion is imposed. |
| `RT.2/hz-module-circle-tate` | corrected | NS IV.4.12 compares circle and finite Tate for circle-equivariant Hℤ-modules. The prototype now keeps the unrestricted source range and the corrected base-change direction. Corrections: Remove the invented finiteness disclaimer and unnecessary bounded-below restriction from the prototype of NS IV.4.12. |
| `RT.2/orthogonal-spectra` | verified | The orthogonal indexing category retains its enriched isometry spaces, O(n)-actions and suspension structure. Sphere braiding gives the nontrivial sign test. |
| `RT.2/genuine-g-spectra` | verified | Genuine objects use a complete representation universe; categorical fixed points and Borel homotopy fixed points are separate constructions. |
| `RT.2/geometric-fixed-points` | corrected | Geometric fixed points remove proper isotropy and detect V^G on representation spheres. The source index slip is E17, not the unrelated AMMN E6. Corrections: Replace the unrelated AMMN erratum reference by the actual NS index slip. |
| `RT.2/borel-completion` | verified | Borel completion is a derived genuine functor with the stated adjunction and fixed/Tate comparison, not an arbitrary naive equivariant spectrum. |
| `RT.2/isotropy-separation` | verified | The proper-isotropy family gives the cofiber sequence whose genuine fixed points form the Tate square. |
| `RT.2/geometric-fixed-points-localisation` | verified | The geometric-fixed-point localization uses compact generators and the specified family. It is not pointwise fixed subspaces of a Borel object. |
| `RT.2/genuine-cyclic-and-circle-spectra` | verified | The finite-cyclic and circle genuine categories keep complete universes and compatible restriction/Φ operations; the group-anima interface is explicitly requested. |
| `RT.2/genuine-cyclotomic-spectrum` | corrected | The genuine cyclotomic condition uses geometric fixed points. Coalgebra construction is supported without alleging an unproved error in NS II.3.4; Borel Hℤ fails the condition by its negative Tate homotopy. Corrections: Use the existing Bökstedt construction ID. Remove the unsupported allegation against NS II.3.4; the coalgebra route suffices. Replace the unproved fibre-product nonexample by a Borel-completion counterexample checked by Tate Hℤ. Add direct proof inputs: RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane. |
| `RT.2/orthogonal-cyclotomic-spectra` | corrected | Orthogonal cyclotomic localization uses F-equivalences and the actual Bökstedt model input. The unread Barwick–Glasman proof remains an explicit gap. Corrections: Use the existing Bökstedt construction ID. |
| `RT.2/tr-and-genuine-tc` | verified | TR takes its restriction tower; genuine TC includes Frobenius as well. Integral and p-typical diagrams are not conflated. |
| `RT.2/restriction-pullback` | verified | NS II.4’s restriction pullback retains every fixed, homotopy-fixed and Tate corner needed for genuine TC agreement. |
| `RT.2/genuine-tc-agrees` | verified | Bounded-below genuine TC agrees with modern TC. The classical THH specialization consumes its point-set well-pointed/unit h-cofibration witness. |
| `RT.2/endofunctor-coalgebras` | verified | NS II.5 coalgebras use a coherent structure arrow and mapping paths. Exactness, accessibility and presentability hypotheses are exposed in the primary interface. |
| `RT.2/genuine-cyclotomic-coreflection` | verified | The right adjoint is the inverse tower of iterated inclusion/right-adjoint steps. Its stronger pullback formula has the additional full-faithfulness and pullback-preservation assumptions. |
| `RT.2/bounded-below-cyclotomic-equivalence` | verified | The bounded-below comparison identifies the actual counit on the underlying spectrum. It is not an unrestricted unbounded equivalence. |
| `RT.2/bokstedt-construction` | verified | NS III.4 preserves stable equivalences for the Bökstedt construction without an invented convergence bound. Classical realization keeps its separate point-set conditions and the indexing category is not a poset. |
| `RT.2/thh-models-agree` | verified | NS III.6 compares the models with its stated well-pointed and h-cofibration inputs. The orthogonal/genuine proof boundary is recorded as a gap. |
| `RT.3/localizing-invariants` | verified | Land–Tamme localizing invariants need not preserve filtered colimits; the finitary BGT convention is distinguished. Connective K is additive rather than localizing. |
| `RT.3/dennis-trace` | corrected | The source trace and degree-one sign convention are explicit. Additive corepresentability directly imports the finitary Day-unit node, whose proof does not depend on this trace. Corrections: Add direct proof inputs: RefinedTraceMethods:RT.3/finitary-invariant-tensor-units. State the generator/sign conversion used by the degree-one API and tests. Make the cited sign explicit in the source match. |
| `RT.3/cyclotomic-trace` | verified | Finitary cyclotomic THH factors through the fine motives supplier before mapping from the unit defines TC. TC itself need not be finitary; no whole-stage backward edge is used. |
| `RT.3/finitary-invariant-tensor-units` | verified | BGT’s Day-convolution unit proof is supported by additive/localizing corepresentability and monoidal localization. Its generic Day operations are precisely requested, and no relative κ-finitary tensor comparison is imported. |
| `RT.3/trace-uniqueness-multiplicative` | verified | BGT’s multiplicative trace space is coherently contractible. Finite-stage TC and its inverse tower supply the TC conclusion; fine motives and the direct unit theorem give an acyclic route. |
| `RT.3/relative-trace` | corrected | The nonconnective relative trace criterion uses Kinv. Connective relative K has its separate F_conn fiber criterion; the two are not interchanged. Corrections: Align the relative criterion with its nonconnective fibre, keeping the connective criterion separate. |
| `RT.3/goodwillie-calculus` | verified | Raskin’s continuous exact derivative and connective extension use their universal properties, with presentability and sifted-colimit interfaces requested explicitly. |
| `RT.3/stable-k-theory-thh` | verified | The stable K derivative is ΣTHH(A;M); at the sphere it is ΣM, which also diagnoses the suspension slip recorded in LMMT. |
| `RT.3/stable-tc-thh` | verified | The TC derivative is ΣTHH with the actual trace-induced comparison. The reduced functor is used; the unreduced source wording is recorded in E18. |
| `RT.3/dgm-convergence` | verified | The trace cofiber Ψ satisfies the stated pseudo-extensibility, Postnikov and varying-base infinitesimal-colimit inputs. Its desuspension gives the fiber conclusion. |
| `RT.3/dgm-theorem` | verified | Integral DGM uses connective E₁ rings and a surjection on π₀ with nilpotent kernel. The older finite-coefficient results are not substituted for its integral proof. |
| `RT.3/goodwillie-rational` | verified | The rational nilpotent comparison keeps the negative-cyclic shift and associative hypotheses; Cortiñas/Land–Tamme supply the comparison without an invented derivative proof. |
| `RT.3/kinv-truncating` | verified | DGM applied to A→π₀A gives truncation invariance of the nonconnective K/TC fiber, consuming the exact K.6 model comparison. |
| `RT.3/truncating-excision` | verified | The correction algebra maps to the proper B′ corner. The source’s auxiliary pullbacks and square-zero induction prove excision/nil-invariance; truncation alone does not. |
| `RT.3/tower-square` | verified | Complete filtered towers retain the pro-nilpotence, boundedness and derived-limit/Milnor conditions. The result does not export henselian rigidity. |
| `RT.3/hesselholt-nikolaus-assembly` | corrected | The HN cofiber sequence uses THH symmetric monoidality and the Tate orbit comparison directly. Its first assembly arrow is not asserted injective. Corrections: Add direct proof inputs: RefinedTraceMethods:RT.2/tate-orbit-lemma, RefinedTraceMethods:RT.2/thh-symmetric-monoidal. Remove the unsupported injective-image reading of the assembly map. Expose the connectivity and residual-circle steps of the assembly proof. |
| `RT.3/low-degree-tests` | verified | The Dennis–Stein convention matches the read T.6 supplier. The truncated-polynomial motivation retains its perfect characteristic-p hypothesis. |
| `RT.3b/qp-coefficients` | verified | ℚ_p coefficients mean rationalization after p-completion. Direct tensoring of an arbitrary spectrum with ℚ_p is a different operation. |
| `RT.3b/trivial-vs-thh-fp` | corrected | The trivial cyclotomic comparison with THH(F_p) uses the Bökstedt construction and AMMN’s completion conventions directly. Corrections: Add direct proof inputs: RefinedTraceMethods:RT.2/bokstedt-construction. |
| `RT.3b/crystalline-trace-map` | corrected | The ordinary-reduction β comparison imports the reduction quasi-isogeny. Its test has ℚ_p at both ends and the crystalline trace composes β after tr. Corrections: Add direct proof inputs: RefinedTraceMethods:RT.3b/reduction-quasi-isogeny. Use consistent rational coefficients on the ordinary-reduction example. |
| `RT.3b/beilinson-square-spectral` | verified | AMMN’s spectral reduction is R⊗_S F_p. The horizontal-fiber argument does not claim that each individual TC⁻/TP vertical arrow is a rational equivalence. |
| `RT.3b/reduction-quasi-isogeny` | corrected | The proof now uses graded/TR detection, square-zero and Čech reduction, and Postnikov augmentation. The absent cyclotomic t-structure and TR detection interface is a fifth explicit gap. Corrections: Replace the self-citation by the actual graded/TR, square-zero, Čech and Postnikov route; expose its missing cyclotomic foundation. Add direct proof inputs: RefinedTraceMethods:RT.2/tr-and-genuine-tc, RefinedTraceMethods:RT.3/square-zero-extensions, RefinedTraceMethods:RT.2/bounded-below-cyclotomic-equivalence. Give locators for every substantive step of the quasi-isogeny proof. |
| `RT.3b/beilinson-square-ordinary` | verified | The ordinary R/p square follows from the spectral square and the quasi-isogeny, with completion preceding rationalization and no henselian assumption. |
| `RT.3b/beilinson-fibre-sequence` | verified | Horizontal reduction fibers give the relative ΣHC sequence. AMMN’s low-degree connectivity bounds and the integral/relative shifts are retained. |
| `RT.3b/graded-beilinson-square` | verified | The fine pre-Beilinson RT.6 inputs are acyclic; the downstream AMMN interface is excluded. Polynomial left Kan extension to uncompleted de Rham remains its exact gap/request. |
| `RT.4:topological/complex-k-theory` | verified | Bundle rank may vary on clopen components. The additive Grothendieck group and complement prototype preserve that scope on disconnected compact spaces. |
| `RT.4:topological/reduced-and-graded-k` | corrected | Reduced K keeps the basepoint rank kernel; relative and negative groups have the specified suspension conventions. The LES source is Hatcher §2.2. Corrections: Correct the relative-K long exact sequence section. |
| `RT.4:topological/bott-periodicity` | verified | Hatcher’s Bott class has the fixed sign/orientation and its external product isomorphism. Complex periodicity does not claim real Bott periodicity. |
| `RT.4:topological/bu-representability` | verified | Derived pointed maps into ℤ×BU retain the rank component and nondegenerate basepoint. The S⁰ test rules out using BU alone in general. |
| `RT.4:topological/ku-spectrum` | verified | Periodic complex K is constructed in the H.5 coherent E∞ spectrum interface from representability and Bott periodicity. |
| `RT.4:topological/connective-ku` | verified | ku is the connective cover of KU before Bott inversion. Its negative homotopy vanishing is part of the discriminating interface. |
| `RT.4:topological/homotopy-of-ku` | verified | The coefficient rings are ℤ[β] and ℤ[β±1] with \|β\|=2; negative and odd degrees distinguish connective from periodic K. |
| `RT.4:topological/bott-localisation` | verified | The localization ku[β⁻¹]≃KU uses the coherent ring localization universal property, rather than just a coefficient-ring calculation. |
| `RT.4:topological/splitting-principle` | corrected | Hatcher Theorem 2.25/Example 2.26 give K-theoretic Leray–Hirsch and splitting, pp. 68–71. Proposition 3.3 is its separate cohomological counterpart. Corrections: Correct the K-theoretic Leray–Hirsch locator. Replace the nonexistent subsection/page combination by the splitting and Leray–Hirsch proof. |
| `RT.4:topological/lambda-ring-k` | verified | Geometric splitting proves special λ identities on line bundles before passage to virtual bundles. The proof avoids a circular special-λ supplier. |
| `RT.4:topological/adams-operations` | verified | Newton polynomials give integral unstable Adams operations, with the kth tensor-power formula on line bundles and the prescribed λ compatibility. |
| `RT.4:topological/adams-operations-spectra` | verified | The spectral refinement uses the Snaith power map after inverting k. Sending β to kβ cannot define the stated integral periodic operation when k is not a unit. |
| `RT.4:topological/chern-classes` | verified | Chern generators and Whitney sums use finite convolution in each degree of completed even cohomology, with the splitting principle supplying the construction. |
| `RT.4:topological/chern-character` | verified | The Chern character lands in a completed even product with Cauchy cup multiplication; finite CW inputs recover the bounded direct-sum version. |
| `RT.4:topological/relative-thh-ku` | verified | Absolute rational THH(ku) uses the graded polynomial HKR model with \|σβ\|=3; relative THH and Laurent KU have their distinct models. |
| `RT.4:topological/ku-circle-actions` | verified | The trivial relative coefficient circle action is kept separate from the absolute THH action and its nonzero Connes operation. |
| `RT.4:q-Hodge/spherical-lift` | corrected | Spherical lift means a chosen ring lift with its reduction data. Existence for arbitrary rings is not claimed; compatible local/global choices remain recorded input. Corrections: Correct the gluing prototype documentation: its existing compatible-lift record already carries the rational compatibility, reductions and lifted Čech maps. |
| `RT.4:q-Hodge/solid-spectra` | verified | The light site is second-countable. Existing LightCondMod/LightCondAb are reused, while the solid spectral extension remains the explicit VS2 gap. |
| `RT.4:q-Hodge/nuclear-objects` | corrected | Left-module duals are right modules. The Hom comparison keeps all compact-tensor quantifiers and ambient compact-generation hypotheses; trace-class zero maps need no dualizability. Corrections: Retain the compact-tensor hypothesis of Wagner 2.11(d). State the extra hypothesis at the node boundary. Expose the compact-tensor hypothesis in Nuclear.homCompact. Exclude the zero ring in the compact non-nuclear example. Include the proposition supplying the Hom comparison and its hypotheses. Keep the source’s ambient compact-tensor quantifier over every compact module, and its stable compact generation/compact-unit assumptions; correct Theorem 2.11’s label. |
| `RT.4:q-Hodge/perfect-even-filtration` | verified | Perfect-even objects include retracts. Fixed-base E₁ module descent and varying-ring E₂ algebra descent have different hypotheses and prototypes. |
| `RT.4:q-Hodge/solid-even-filtration` | verified | Solid homological evenness tests condensed sheaf homotopy. Assumption R, nuclearity and fixed-base Čech descent remain distinct from the undefined source flatness phrase E14. |
| `RT.4:q-Hodge/even-circle-fixed-points` | corrected | AR’s circle-filtered operations require the actual τ-bounds before their underlying fixed/Tate comparison. Completeness/exhaustiveness alone do not give that theorem. Corrections: Match the API to the already-correct prototype truncation bounds. Make the comparison proof conditional on the actual bounds. |
| `RT.4:q-Hodge/solid-thh-even-filtration` | corrected | Wagner 3.1–3.2’s chosen complete local lift and its coherent branch are required. The bifiltration uses positive steps and completed solid tensor; coefficient base change keeps p-torsion-freeness of l. Corrections: Retain the local conditions of Wagner 3.1–3.2 in the solid THH prototype. Retain Corollary 3.17’s p-torsion-free hypothesis on the target coefficient ring l in both statement and prototype. |
| `RT.4:q-Hodge/image-of-j` | verified | j is the connective K(1)-local sphere, with the stated principal-unit model and shift at odd p. The thesis j_{p,0} variant is kept separate. |
| `RT.4:q-Hodge/devalapurkar-raksit-thh` | verified | DR’s THH/image-J theorem has its odd-prime scope and separate p=2 clause, using the chosen j rather than a wrong Adams fiber shift. |
| `RT.4:q-Hodge/devalapurkar-comparison` | verified | The thesis comparison preserves its p-completion, cyclotomic base and j_{p,0} convention. The proof is read as a target-level route. |
| `RT.4:q-Hodge/nikolaus-e1-equivalence` | verified | The Nikolaus comparison is E₁ at p=2. The theorem does not assert that every stronger E∞ refinement is impossible. |
| `RT.4:q-Hodge/q-hodge-comparison-map` | corrected | The pullback filtration uses the specified comparison and local hypotheses. Its two-term polynomial formula starts at positive i; fil⁰ is the whole complex, and the mod-β prototype has the proved prime/branch range. Corrections: Restrict the two-term polynomial formula to positive filtration indices. Restrict the mod-beta comparison prototype to the complete local input and the proved odd-prime or E₁-at-2 range. |
| `RT.4:q-Hodge/p-complete-comparison-odd` | corrected | Odd-prime comparison keeps p-completeness, bounded torsion and p-quasi-lci input with the chosen E₁/E₂ lift identification. Multiplicativity requires n≥2; Theorem 4.12 identifies coefficients rather than proving descent. Corrections: Retain the multiplicative range n≥2 in Remark 4.9. State the range of the multiplicative conclusion. Correct the role of Theorem 4.12 in the comparison proof. Require the complete local hypotheses and identify the chosen lift with its coherent E₁/E₂ branch in the prototype. |
| `RT.4:q-Hodge/p-complete-comparison-two` | corrected | The p=2 comparison binds the augmented Čech coherence to R and its chosen lift, keeps torsion-freeness and local inputs, and retains its source proof-sketch gap. Corrections: Bind the augmented cover coherence to R and its chosen lift, and retain all local hypotheses in the prototype. |
| `RT.4:q-Hodge/quasi-regular-quotients` | corrected | The identity-cover witness uses the p-completed cotangent [0,1] condition, with completeness and relative semiperfectness. Torsion-freeness alone does not imply the static result. Corrections: Use the p-completed relative cotangent bound, rather than imposing the stronger global quasi-lci condition on the identity-cover input. |
| `RT.4:q-Hodge/global-even-filtration` | verified | Arithmetic gluing consumes compatible per-prime and rational input, including its paths. The legacy prototype does not silently manufacture that compatibility. |
| `RT.4:q-Hodge/q-hodge-global` | verified | The global q-Hodge comparison consumes the actual gluing input and retains the source’s proof boundary; the chosen global lift is not assumed automatically E₂. |
| `RT.4:q-Hodge/q-hodge-multiplicativity` | verified | The E_(n−1) enhancement depends on the chosen E_n lift. Completeness and graded q-Hodge comparison retain their source hypotheses and sketches. |
| `RT.4:q-Hodge/raksit-polynomial-example` | corrected | The cyclic monoid calculation gives the q-difference differential. The two-term formula requires i≥1, while the global version consumes compatible lift data. Corrections: Restrict the two-term prototype formula to i≥1; fil⁰ is the full complex separately. |
| `RT.4:q-Hodge/cyclonic-spectrum` | corrected | Cyclonic data includes its subgroup and inflation operations. It does not, by itself, supply the canonical TR restriction; Adams maps alone are not the A₂ datum. Corrections: Distinguish TR restriction from the existing subgroup maps. |
| `RT.4:q-Hodge/cyclonic-ku` | verified | The cyclonic ku lift uses the actual E∞ A₂ morphism and Tate-square coherences. KU is localized only after the bounded ku construction. |
| `RT.4:q-Hodge/tc-minus-m` | verified | TC^{−(m)} uses genuine finite fixed points followed by residual-circle fixed points. Positive divisibility maps preserve the subgroup identifications. |
| `RT.4:q-Hodge/cyclonic-even-filtrations` | corrected | The bounded oriented homologically-even ku input precedes KU localization. Paragraph 5.59 and Lemma 5.61, pp. 78–79, supply the localized filtration/completeness interface. Corrections: Cite the actual KU localization and completeness declarations. |
| `RT.4:Habiro-comparison/twisted-q-hodge-comparison` | verified | The positive m-twist imports the precise HQ.3 filtration and (q^m−1)-completion; categorical finite fixed points are not replaced by geometric fixed points. Theorem 5.51’s sketches remain recorded. |
| `RT.4:Habiro-comparison/habiro-comparison-theorem` | verified | Habiro reconstruction uses the coherent divisor diagram, corrected A₂ module, fixed-point/orientation hypotheses and 2 invertible; the source proof boundary remains explicit. |
| `RT.4:Habiro-comparison/etale-einfty-lift` | verified | HA 7.5.0.6 gives étale E∞ lifting over a connective base, with its degree-zero étale algebra and coherent uniqueness hypotheses. |
| `RT.4:Habiro-comparison/number-field-habiro` | verified | The number-field case separately requires 6\|Δ and disc(F)\|Δ. HR.6 supplies degree-zero Habiro identification, while the periodic comparison is supplied here. |
| `RT.1/derived-mixed-complex` | verified | Keller’s dg mixed localization inverts b-quasi-isomorphisms, with unbounded circle-module transport from Hoyois and the precise EDS localization input. |
| `RT.1/precyclic-mixed-cone` | verified | The functorial two-column precyclic cone has its b/B matrices and cyclic comparison. Nonunital corner maps do not acquire invalid unit degeneracies. |
| `RT.3/square-zero-extensions` | verified | Split and nonsplit square-zero extensions keep connective bimodules and derivation/pullback data, with the full varying-base category needed by Raskin. |
| `RT.2/thh-bimodule-coefficients` | verified | The bar is M⊗^L_{A^e}A. Mod_A≃Ind(Perf(A)) has the fine duality supplier and exact module comparison request; small Perf(A) is not asserted dualizable for arbitrary A, and general M has no automatic circle action. |
| `RT.3/pseudo-extensible` | verified | Pseudo-extensibility is the reduced functor’s iterated connectivity condition. It is not replaced by a condition on just its first derivative. |
| `RT.3/postnikov-convergent` | verified | The functor is compared with the actual coherent Postnikov tower limit. This is an independent convergence input rather than a consequence of a derivative equivalence. |
| `RT.3/infinitesimal-sifted-colimits` | verified | The infinitesimal sifted-colimit condition quantifies over varying-base square-zero extensions; preservation for one fixed bimodule category would be too weak. |
| `RT.4:topological/snaith-adams-construction` | verified | ECII’s Snaith localization gives KU from Σ∞_+K(ℤ,2). The kth power map sends β to kβ, and k inversion makes the induced E∞ operation well-defined. |
| `RT.4:topological/graded-laurent-hkr` | verified | The graded polynomial model for ku_Q and Laurent model for KU_Q use \|β\|=2, \|σβ\|=3 and δ=β⁻¹σβ of degree one; Bβ remains nonzero. |
| `RT.4:q-Hodge/perfect-even-site` | verified | The even site has extension/retract closure, specified covers and sheaf topology. Ordinary and solid generators and homotopy sheaves remain distinct. |
| `RT.4:q-Hodge/even-flat-modules` | verified | Even flatness is a filtered-colimit condition on perfect-even modules; its solid version uses condensed homotopy rather than selected injective maps. |
| `RT.4:q-Hodge/homological-evenness` | verified | Homological evenness is odd sheafified mapping-homotopy vanishing. Odd homotopy at a single evaluation point does not characterize it. |
| `RT.4:q-Hodge/faithfully-even-flat` | verified | Pstrągowski’s faithful-even-flat definition keeps both left and right ring/cofiber conditions; Wagner’s solid version carries its additional nuclear hypotheses. |
| `RT.4:q-Hodge/solid-assumption-r` | verified | Assumption R supplies each nuclear/ind-perfect dual witness with its opposite-module structure, making all four quantifiers available to descent. |
| `RT.4:q-Hodge/synthetic-finite-cyclic-tate` | verified | The finite synthetic norm is unshifted and the Tate functor is lax symmetric monoidal. The n=1 zero-Tate test diagnoses the source’s missing qualification. |
| `RT.4:q-Hodge/compatible-spherical-lifts` | verified | Chosen per-prime E₁/E₂ branches include reductions, lifted Čech diagrams and arithmetic paths. A global E₂ conclusion requires compatible E₂ choices at every prime. |
| `RT.4:q-Hodge/cyclonic-base-coherence` | verified | The A₂ morphism is over the identity underlying circle algebra with geometric Adams maps and coherent Tate squares; divisibility and higher paths are required. |
| `RT.2/tr-de-rham-witt-hkr` | verified | Hesselholt B/C and CMM’s ind-smooth extension supply the full graded finite-TR/de Rham–Witt comparison. CR.4 owns the Witt construction, and only the specified ML/pro-zero towers permit passage to limits. |
| `RT.2/tate-verdier-quotient` | verified | The finite-action perfect-module quotient has the Tate endomorphism ring and K-module functor by NS/LMMT. Symmetric monoidality retains the commutative coefficient hypothesis. |

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/RefinedTraceMethods--RT.1.json` reports zero errors and zero warnings. The source-issue schema, all-node review coverage, minimum test counts, reader catalogue correspondence, all 372 exact API names, allowed paths and whitespace were also checked. Each exact API name was checked by Lean in the suggested file; the temporary check commands were removed before submission. Final `lean-check research/blueprint/suggested/RefinedTraceMethods--RT.1.lean` returns exit 0 at the pinned shared build; its only warnings are declarations using `sorry`. The memory precheck satisfied the 20 GB requirement. This validates elaboration, not the mathematical truth of placeholder proofs. Only the four named deliverables and this review’s handoff are submitted.
