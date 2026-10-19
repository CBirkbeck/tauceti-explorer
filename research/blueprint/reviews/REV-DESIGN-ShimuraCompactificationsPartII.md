# Independent review: ShimuraCompactificationsPartII

**Verdict: needs_changes.** This is a completed independent review of DESIGN-ShimuraCompactificationsPartII, not a checkpoint. Reviewer: Codex, session `codex-48EwRG`, on 2026-10-19; issue #3613. The design author was Claude Opus 5.5, session `claude-foXVuD`. All 73 original nodes were checked. Clear corrections are applied to the roadmap, packet, suggested Lean and reader; one source-supported node was added. Two proof contracts remain unverifiable, identified below.

The review is not rejected for its pre-existing Kisin or parahoric-interior inputs. Those remain honestly recorded gaps. The new concerns are non-routine arguments that the original proof sketches did not supply. Their target statements are now conditional and their missing steps explicit. All nine layers have target nodes ending in named contracts or exact gaps, so their coverage is planned under PROTOCOL §0. None is closed; `complete` means a finished planning pass, not proved mathematics.

## Counts and checks

| Item | Before | After |
| --- | ---: | ---: |
| Target nodes | 73 | 74 |
| Definitions / constructions / theorems / comparisons | 8 / 17 / 47 / 1 | 8 / 17 / 48 / 1 |
| API items, all nodes | 125 | 154 |
| Unit tests, all nodes | 82 | 85 |
| Planets | 24 | 25 |
| Baseline declarations | 12 | 12 |
| Requests / exact gaps | 28 / 3 | 29 / 6 |
| Source findings | 8 | 10 |

Node verdicts: 19 verified, 52 corrected, 1 added, 2 unverifiable. The checker counts only definition/construction API and tests, hence its 151 API items and 82 unit tests; the added theorem carries three more of each. Every definition and construction has at least three discriminating tests. The additional API contracts cover extensionality, covariance/contravariance, composition laws, descent uniqueness, base change with its actual hypotheses, and the Fourier–Jacobi product.

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraCompactificationsPartII.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/ShimuraCompactificationsPartII.lean`: exit 0 at the pinned shared build; only the theorem `paramodularLattice_ne_top` emits a `sorry` warning. Available memory was 86 GiB before the check. No language server or build was started.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/ShimuraCompactificationsPartII.lean`: exit 0; all data definitions have real bodies.
- Source-issue schema and `sourceVersions` validation, node/stage dependency-cycle checks, full reader/packet contract consistency, deliverable/path validation and `git diff --check`: passed. The partial-flag covering example was independently enumerated over F₂, F₃ and F₅ for every possible toric rank; its p=2 line counts agree.

## Two unresolved proof contracts

1. **C7/zarhin-self-dual-replacement — `gap/zarhin-finiteness-ampleness`.** The original claim that finite polarized automorphism groups make the moduli map quasi-finite is insufficient. [Lan16 Lemma 4.5, pp. 19–20](https://www.kwlan.org/articles/cpt-ram-flat.pdf) uses Hodge-determinant ampleness after finite étale naive prime-to-p marking, including polarization degrees divisible by p. A6 does not supply that contract. Properness via good reduction of isogeny factors is a separate step. The revision needs the precise all-degree ampleness supplier and then the finite-map proof.
2. **C8/pel-local-properties — `gap/pel-lci-transfer`.** Lan16 Propositions 14.1–14.2, pp. 69–70 prove the listed fibre properties and smooth-fan regularity, but do not state the proposed relative-lci extension. [Stacks Lemma 37.62.20, tag 069P](https://stacks.math.columbia.edu/tag/069P), does supply smooth descent. The missing step is transfer from the punctured completed Shimura chart to its whole torus torsor and base. Merely invoking detection on completions does not prove that. C14 now uses its specific modular-boundary argument, with its exact comparison input, rather than using this unproved general claim in a circle.

**Klingen gluing corrected.** For C14/klingen-subgroup-extension, the two end pieces of the partial flag suffice in Stroh’s argument. In the covariant Tate convention write D for its line and W̄ for the isotropic toric subspace. The two rank-p loci have criteria D⊂W̄^⊥ and D⊄W̄. They cover because W̄⊂W̄^⊥; on their overlap the polarized 1-motive Cartier pairing identifies the two models. Glue the literal first kernel with the Cartier dual of the literal terminal kernel. The intermediate full flag is not used. The chart/interior comparison remains its existing input. [Stroh Lemmas 2.4.2–2.4.3, pp. 25–26](https://webusers.imj-prg.fr/~benoit.stroh/Laumon.pdf) and [Pilloni footnote 27, p. 105](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) are now accompanied by this explicit adaptation.

The third new gap, `gap/higher-level-graded-extension`, protects the interface with HigherHidaAndColemanTheory. A literal rank-dropping quasi-finite boundary kernel cannot be fed into a finite-flat-group divisor construction. At n=1 the new C13/rank-p-finite-extension supplies the separate glued object; at n>1 the finite-flat input or alternative divisor construction is not established here. This downstream input is recorded without asserting a new finite-flat result.

## Main corrections

- **C7 normalization:** a hyperspecial auxiliary level need not give a generic closed immersion; the GL₂ K₀(p) map has degree p+1. Distinguished incoming normal-test lifting from outgoing integral factorization, retained the separate Nagata finiteness input, corrected the diagonal-torus counterexample, allowed ramified cusp fields, and replaced infinite cyclotomic finiteness by integrality. Flatness uses torsion-freeness over a valuation ring, not unproved flat transition maps. PEL auxiliary independence is a later C8 conclusion.
- **C8 PEL models:** corrected Lan’s conjugation convention, retained PEL auxiliary endomorphisms until the forgetful Siegel map, removed the arbitrary-bad-level abelian-torsor assertion, and fixed the one-cone/all-valuation quantifier. The Proj argument uses global minimal-model ampleness, Stein factorization and the projection formula. A proper birational map alone does not identify two compactifications.
- **C9 realizations:** corrected de Rham variance, Lie of the universal vector extension, weight/Hodge indexing and twists. A unit q defines a 1-motive; a Tate elliptic curve needs the analytic degeneration hypotheses. Distinguished a φ-module splitting from a split log connection, used unipotent nearby cycles, restored the comparison-injectivity input, and corrected the source’s W₁ misprint by the quotient formula.
- **C10 boundary theorem:** restored the generic closed-immersion/zero-kernel step in local structure, the full-Siegel-level intersection hypothesis, and the smooth-source condition in relative Weil extension. Distinguished Cartier support from reduced Cartier boundary at nonsmooth fans. Corrected the projectivity dependency and the geometrically reduced special-fibre hypothesis for connected components.
- **C11–C12:** retained the similitude line in tensor stabilizers (Sp is not GSp), imposed equal similitude characters for direct sums, and kept the infinite prime-to-p tower as a pro-object with finite-level assertions. Hartogs extends sections of an already constructed bundle; local tensor frames prove the torsor property. Reordered C12 before C11. Within C12 the Proj core and its complete local rings precede the full stratum theorem. Completions over quotient points use all pure-base lifts. Scalar Fourier coordinates require a torus-only cusp, and the modular Kummer denominator is corrected.
- **C13:** retained the valid n=0 identity-chain case, corrected d_i versus d_i², the dual indices and cyclic flag predecessors, and confined isogeny degrees to the abelian interior. Added the source-supported n=1 finite-flat extension as a distinct object with API, tests and a planet.
- **C14:** corrected boundary dimensions r(2−r), the lattice quotient and character/cocharacter duality, integral modular suppliers, and relative versus total codimension. Kept correspondence projections distinct from their universal semi-abelian homomorphism. Corrected determinant-map direction, direct line descent, the multiplicative-H formal open, and the boundary dimension. A fan-refinement pullback gives ideal inclusion, and equality does not characterize identical fans.
- **C15:** retained Hodge positivity for the Clifford form, restricted the integral input to odd p, corrected real rank min(n,2), the Lorentzian cone sign, and line-factor/unipotent notation. Kept finite covers, arithmetic translations and torsors in the one-dimensional cusp description; there is no canonical zero section.

## Pinned baseline, supplier and duplication audit

All twelve original declaration names exist at the stated exact pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`. No reference was removed. Their `provides` and `checked` records now document statement-level hypotheses and limits, rather than only name existence.

| Declaration | Source line at pin | Checked provision / correction |
| --- | --- | --- |
| `AlgebraicGeometry.IsFinite` | Morphisms/Finite.lean:40 | Affine-local finite module condition. |
| `AlgebraicGeometry.IsOpenImmersion` | OpenImmersion.lean:36 | Scheme morphism property. |
| `Scheme.Hom.normalization` | Normalization.lean:123 | Relative integral closure; quasi-compact and quasi-separated input. |
| `normalization.hom_ext` | Normalization.lean:437 | Outgoing-map uniqueness with affine target over the base and both composite equalities. |
| `Scheme.Hom.normalizationDesc` | Normalization.lean:373 | Outgoing integral factorization, not incoming lifting from a normal test space. |
| `CliffordAlgebra` | CliffordAlgebra/Basic.lean:74 | Existing algebra carrier; no Shimura datum. |
| `IsCyclotomicExtension` | Cyclotomic/Basic.lean:76 | Field-extension predicate; no integral-model flatness result. |
| `Matrix.symplecticGroup` | SymplecticGroup.lean:101 | Sp submonoid for AJAᵀ=J, not GSp or its parahoric model. |
| `QuadraticForm` | QuadraticForm/Basic.lean:164 | Scalar-valued quadratic map. |
| `integralClosure` | IntegralClosure/Algebra/Basic.lean:216 | Subalgebra; geometric gluing and finiteness remain separate. |
| `spinGroup` | CliffordAlgebra/SpinGroup.lean:293 | Even pin elements of norm one, not GSpin. |
| `TauCeti.Hodge.MixedHodgeStructure` | Hodge/Mixed/Basic.lean:78 | Rational weight and complex Hodge filtrations with scalar-extension compatibility; not a 1-motive. |

All original supplier requests were read against their node or package statement. Corrected `SchemeAndStackFoundations:SF.2` to **SF.4** for Stein factorization. Replaced the characteristic-zero **ModularCurvesPartII:R12.3** input by **R13.3** and **R13.4a** for integral Γ₀(p) models and cusp comparisons. Restricted **NeronModelsAndSemistableAbelianVarieties:R11.1** to its DVR theorem; MP19’s relative extension step still requires the smooth source. Confirmed Artin approximation at **AlgebraicModuliForArithmeticGeometry:R09.6**, the existing relative Zarhin contract at **RD.5.116**, the contravariant A4 convention and the actual A6 limit. The other PEL, Hodge-tensor, semistable-comparison, log-crystalline, p-rank, reductive-group and parent boundary contracts are retained with the correct conventions.

Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and TauCeti main `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked read-only, including AlgebraicVectorBundles, AnalyticToricGeometry and the relevant OrthogonalSpinGroups material. The parent’s reviewed library audit and upstream PR #1053 at head `ee6deacb49872a45f86e6a76fd428b03b1e69541` were read. No general bundle, finite-fan, mixed-Hodge-structure, Clifford or Spin theory is re-planned. C5.31’s normalized-blowup input is supplied independently by C8; the packet’s upstream notes record this dependency and the distinction from the parent’s characteristic-zero Klingen correspondence.

## Sources and findings

Ten public primary PDFs were opened at the relevant locators: MP19, Lan16, Lan17, BP26, Pil20, FKW, MST22, Str15, Zem20 and BZ21. The packet and reader give public URLs, hashes, versions, and reviewer reading ranges. The two previously indirect orthogonal sources and Stroh were read directly. Brylinski remains explicitly indirect through MP19 Proposition 3.1.2; Faltings–Chai is imported through the parent C4 contract rather than independently reverified from a book. No source passages or source files are put in the repository.

Madapusi Pera’s [published Numdam PDF](https://www.numdam.org/item/10.24033/asens.2391.pdf), SHA-256 `d7e0dfa1d9ef76f3f85682f1abcc52d3d66de9e9378e92fc9153a3ba5c10a077`, was collated at Proposition 1.3.5, p. 408, Remark 5.2.10, p. 494, and Appendix A.1.8, pp. 499–500. The W₁ misprint persists there. The book-injectivity finding is scoped to the published remark’s reported gap, not an independent claim that an unread book theorem is false.

The Pilloni and Boxer–Pilloni findings are limited to the exact public author manuscripts whose hashes are recorded. Publisher-PDF attempts returned HTML access/preview responses, so this review makes no unsupported claim about those versions of record. The author publication page, available author copies, existing atlas extraction records and the relevant arXiv history were checked for corrections; no separate correction was located in those checks.

| Finding | Verdict | Change |
| --- | --- | --- |
| E1 | confirmed | Away-from-p level, abelian genus and paramodular base labels. |
| E2 | confirmed | Character/cocharacter duality and the named-group condition. |
| E3 | confirmed | Boundary-ideal pullback inclusion; removed unsupported equality converse. |
| E4 | confirmed | Permuted compactification/stratum labels. |
| E5 | confirmed | Codimension is a lower bound in the total integral model. |
| E6 | confirmed in part, rewritten | Degree and cyclic-index corrections only. |
| E7 | confirmed, handling repaired | Separate literal quasi-finite kernels from glued finite-flat extensions. |
| E8 | confirmed with restricted scope | Faithful record of MP19’s published remark; no independent book erratum. |
| E6-n0 | rejected | The alleged error in allowing n=0 does not exist. |
| E9 | confirmed, added | W₁D versus D/W₀D in MP19 Proposition 1.3.5(1). Cartier duality is not an erratum. |

## Node-by-node review

The table records every original node and every addition. Full corrected statements, hypotheses, source locators, API and tests are in the synchronized reader and packet.

| Node | Verdict | Check and correction |
| --- | --- | --- |
| `C7/auxiliary-siegel-datum` | corrected | Corrected the incompatible combination of arbitrary source p-level, hyperspecial auxiliary p-level and a generic closed immersion; the existing degree-(p+1) test disproves it. Added the usable ext API contract. |
| `C7/zarhin-self-dual-replacement` | unverifiable | The construction and finite map are supported by Lan16 Lemmas 4.1 and 4.5; removed an unsupported form restriction. Proof closure remains unverifiable: the supplied finite-automorphism theorem does not supply the all-polarization Hodge-ampleness argument actually used for quasi-finiteness. |
| `C7/induced-cone-decomposition` | corrected | Verified pulled-back admissible fans and the index-two-lattice failure of smoothness; finite-fan theory remains imported from the parent and AnalyticToricGeometry. Added the usable inducedConeDecomposition_ext API contract. |
| `C7/generic-toroidal-finite-map` | verified | Verified MP19 §4.1.2–4 and Lan16 Proposition 5.24: normalization of the finite generic toroidal map, with the induced fan hypothesis. |
| `C7/normalized-toroidal-model` | corrected | Separated incoming normal-test lifting from Mathlib’s outgoing integral-factorization property. Finiteness uses the Nagata input, not the light Lean abbreviation alone; modular moduli comparison is conditional. Added the usable hom_ext API contract. |
| `C7/normalized-interior-model` | verified | Verified restriction of normalization to the open interior; a moduli interpretation at bad level remains a separate input. |
| `C7/normalization-transitivity` | corrected | Verified transitivity under finite auxiliary comparisons; arbitrary auxiliary-choice independence is not claimed. The PEL independence clause uses C8’s separate universal property. Moved the PEL-independence conclusion out of the C7 theorem contract to its later C8 proof. |
| `C7/normalized-boundary-tower` | corrected | Corrected the transcription of MP19’s diagonal-torus example to T U⁻¹=p⁻¹ and allowed ramified modular cusp bases. Added the usable conj_comp API contract. |
| `C7/normalized-stratum-model` | corrected | Replaced the false all-level étaleness test and the positive-codimension criterion for a nonclosed stratum. Added the usable normalizedStratum_independent API contract. |
| `C7/cyclotomic-normalized-model` | corrected | Corrected integral versus finite at infinite cyclotomic level, proved normality by finite equations and flatness by valuation-ring torsion-freeness, and restricted the ramified example to odd p. Added the usable hom_ext API contract. |
| `C8/pel-lattice-collection` | corrected | Corrected Lan’s g_j^{-1}Hg_j convention, positivity of the scaled form, the hyperspecial-level condition and the distinction between auxiliary PEL and Siegel moduli. Added the usable reindex API contract. |
| `C8/pel-normalized-minimal` | corrected | Verified Lan16 Propositions 6.1 and 6.4; corrected good-level scope and made the integral modular identification use R13.4a, rather than generic-fibre equality. Added the usable normalization_lift API contract. |
| `C8/pel-normalized-toroidal` | corrected | Replaced the invalid interior-ampleness/Proj shortcut by proper birational Stein factorization, the projection formula and global minimal-model ampleness. |
| `C8/pel-putative-charts` | corrected | Removed the unsupported abelian-scheme torsor assertion at arbitrary bad level; Lan16 Proposition 8.4 and Lan17 Theorem 6.1(3) give a proper normal model over an intermediate finite cover. The torus-torsor assertion is retained. Added the usable action API contract. |
| `C8/pel-strata-completions` | corrected | Verified Lan16 Theorems 9.13 and 10.13; removed an extraneous stabilizer quotient in the neat formal-completion statement. |
| `C8/pel-degenerating-families` | corrected | Made the quantifiers in Lan16 Theorem 7.14’s cone condition explicit: one cone must serve all valuation tests through the same point. |
| `C8/pel-minimal-strata` | corrected | Verified minimal strata and geometrically connected contraction fibres from Lan16 Theorem 12.16 and Lemma 12.9; added the actual Stein-factorization layer SF.4. |
| `C8/pel-functoriality` | verified | Verified Lan16 §§13.1–13.19, including the proper but potentially nonfinite maps between lattice collections; no finiteness is inferred from the generic level map. |
| `C8/pel-local-properties` | unverifiable | Verified exactly the properties in Lan16 Propositions 14.1–14.2. The extra relative-lci transfer is unverifiable from the supplied sketch; isolated it as a conditional target and recorded the missing chart argument, with the actual smooth-descent lemma. |
| `C8/normalized-blowup-input` | corrected | Verified Lan17 Theorem 6.1 at pp. 22–24 and the parent C5.31 input; corrected the claim that proper birational models are identified by Zariski’s main theorem alone. |
| `C9/one-motive-realizations` | corrected | Corrected the variance, universal vector extension, three graded pieces, Hodge indexing and Tate twists; an arbitrary unit q supplies a 1-motive, not automatically a Tate elliptic curve. Added the usable map API contract. |
| `C9/absolute-hodge-one-motives` | verified | Verified MP19 Proposition 3.1.2 and its use of Brylinski’s absolute-Hodge theorem. Brylinski’s original was not read; the citation remains explicitly indirect. |
| `C9/boundary-tensor-compatibility` | verified | Verified MP19 Proposition 3.1.6 and its analytic/algebraic Mumford comparison of every boundary tensor with the interior tensor. |
| `C9/log-dieudonne-crystal` | corrected | Corrected MP19 Proposition 1.3.5(1)’s W₁ misprint using A.1.8, corrected the totally degenerate X/Y variance, and distinguished Cartier dual from untwisted linear dual. Added the usable baseChange API contract. |
| `C9/semistable-comparison-abelian` | corrected | Restricted the claimed source proof to MP19’s k=F̄_p setup, used unipotent nearby cycles, and supplied the valuation-pairing argument needed for N=0 to imply good reduction. |
| `C9/canonical-log-f-crystal` | corrected | Distinguished φ-module splitting from splitting with log connection, defined M₀ by nearby cycles, and corrected the monodromy locator to §§3.2.15–3.2.16. Added the usable comparison_cocycle API contract. |
| `C9/canonical-tate-tensors` | corrected | Pinned the comparison-injectivity lemmas 3.3.7–3.3.8 needed for the canonical tensor, rather than treating parallel transport alone as a proof. |
| `C9/crystalline-rationality` | verified | Verified Theorem 3.4.3(1) and both dimension bounds in §3.5; this is an integral lattice spanning statement, not merely equality of dimensions over K₀. |
| `C10/torsor-reduction` | verified | Verified Theorem 3.4.3(2) and the reduction-of-structure-group argument in MP19 §3.6, pp. 65–67. |
| `C10/local-structure` | corrected | Restored the generic closed-immersion/zero-kernel step in §3.7; finite dominance and normality alone are insufficient. Allowed ramified coefficient rings at modular cusps. |
| `C10/abelian-torsor-extension` | corrected | Verified the exact full-Siegel-level intersection condition, including n=1, and made the smooth-source requirement in the relative Weil extension step explicit. |
| `C10/boundary-torus-torsor` | verified | Verified Proposition 4.2.8 and Lemma 4.2.11: the level lattice itself is identified, so the result holds at arbitrary K_p; no unsupported middle abelian torsor is used. |
| `C10/stratification` | verified | Verified Propositions 4.2.4–4.2.5, including reduced preimages, fibrewise boundary density and flat normalized strata. |
| `C10/formal-completion` | verified | Verified Proposition 4.2.13 and the finite normal formal-algebra extension lemma A.3.2. |
| `C10/main-theorem` | corrected | Separated a Cartier structure supported on the boundary from the reduced boundary at nonsmooth fans; confined normal-crossings and smooth-cusp claims to their proper base hypotheses. |
| `C10/refinements` | verified | Verified fan independence, refinement maps and the structure-sheaf acyclicity argument of MP19 Remark 4.1.6 and Proposition 5.1.3(2). |
| `C10/functoriality` | verified | Verified Proposition 4.1.13: compatible fans are required and a fixed fan need not carry the whole Hecke action. |
| `C10/projectivity-criterion` | corrected | Verified Corollary 4.1.7 and removed a hidden forward dependency on the minimal compactification from the projectivity proof. |
| `C10/morita-conjecture` | verified | Verified Morita’s potential-good-reduction argument in Theorem 4.1.9; applying it to an isogeny replacement descends potential good reduction to A. |
| `C10/connected-components` | corrected | Corrected the universal neat-level modular example, retained geometric reducedness as a hypothesis and corrected the Stein-factorization supplier to SF.4. |
| `C10/etale-rationality` | verified | Verified Theorem 4 and Remark 4.2.12; independence of ℓ comes from the integral boundary lattice and the tensor-preserving adelic torsor. |
| `C11/p-integral-embedding` | corrected | Corrected the Sp/GSp and U/GU stabilizer tests by retaining the similitude line; direct sums require the same similitude character. Added the usable ext API contract. |
| `C11/smooth-toroidal` | verified | Verified MP19 Theorem 2 conditionally on the explicitly recorded Kisin interior input; smooth cones and hyperspecial p-level are essential. |
| `C11/canonical-boundary-models` | corrected | Corrected the infinite tower’s claimed local finite type and Noetherian regularity to finite-level assertions and a compatible pro-object extension property. Also separated the finite-level smoothness proof to avoid a circular dependence on embedding independence. |
| `C11/de-rham-torsors` | corrected | Corrected the cohomology/homology comparison and the Hartogs argument: sections of the constructed bundle extend, while local tensor frames separately prove the torsor property. |
| `C11/fkw-good-reduction` | corrected | Restored FKW’s maximal-parabolic/zero-dimensional pure-base hypothesis and retained its possibly positive-dimensional abelian boundary base. |
| `C11/canonical-minimal` | verified | Verified MP19 Theorem 5.3.1 conditionally on Kisin. The roadmap must place C12 before C11 so that this canonical minimal-model target has its input. |
| `C12/hodge-bundle` | corrected | Restricted Hodge-line independence to a fixed representation; corrected the zero-dimensional-pure-base inference and the scope of the modular Kodaira–Spencer test. Spelled out the determinant of the toric character lattice instead of an ambiguous unindexed graded symbol. Added the usable hodgeLine_refinement_cocycle API contract. |
| `C12/hodge-sections` | verified | Verified MP19 Proposition 5.1.3: semiampleness, refinement invariance and finite generation follow from the parent Hodge result and structure-sheaf acyclicity. |
| `C12/fourier-jacobi` | corrected | Verified the Fourier–Jacobi sheaves, arithmetic invariance and nonnegative support in MP19 §§5.1.5–5.1.8. Added the usable fourierJacobi_mul API contract. |
| `C12/minimal-compactification` | corrected | Verified Theorem 5.2.11 and made the complete-local-ring input explicit. Corrected the Koecher counterexample to a form of the stated weight; the modular integral comparison imports R13.4a. Added the usable lift_unique API contract. |
| `C12/minimal-complete-local-rings` | corrected | Corrected quotient versus pure-base points and removed the circular prerequisite on the full minimal stratification theorem: first construct the section-ring Proj, compute its completion, then prove the stratum immersion. |
| `C12/minimal-hecke` | verified | Verified MP19 Proposition 5.2.13: minimal Hecke extensions are independent of fan choices and respect finite boundary quotients. |
| `C12/zero-dimensional-cusp-coordinates` | corrected | Added the torus-only hypothesis needed by the scalar Fourier-coordinate formula, and corrected the denominator in the modular Kummer translation test. |
| `C13/polarization-type-loci` | corrected | Verified BP26 §3.4.19’s split-kernel type loci and generic decomposition; corrected a test which implicitly extended the generic classification to all characteristic-p polarizations. Added the usable siegelTypeLocus_baseChange API contract. |
| `C13/deep-level-toroidal-model` | corrected | Verified the deep-level normalization construction of BP26 §§3.4.19–3.4.23; made the genus-one integral moduli comparison an explicit supplier. Added the usable lift API contract. |
| `C13/semiabelian-extension` | corrected | Verified the families and homomorphism extension via Lan16 Theorem 11.2 and parent C4; distinguished the Tate generic fibre from its toric boundary fibre. |
| `C13/iwahori-normalized-model` | corrected | Restored the legitimate n=0 case and retained the corrected squared polarization degrees and dual indices. Extended maps are not asserted to be finite flat isogenies of constant boundary degree. Added the usable chain_unique API contract. |
| `C13/graded-pieces` | corrected | Verified the rank-dropping literal kernels, distinguished them from Stroh’s n=1 finite extensions and recorded the missing higher-level input for divisors instead of exporting a false finite-flat object. |
| `C13/iwahori-level-one` | verified | Verified BP26 Remark 4.1.2 conditionally on the recorded normality/flatness input for lattice-chain interiors; the boundary extension does not itself prove that moduli comparison. |
| `C14/klingen-paramodular-data` | corrected | Verified the paramodular lattice, degree-p² polarization, Klingen intersection and p,p²,p chain. Matrix.symplecticGroup supplies Sp only, not the missing similitude group scheme. Added the usable dual API contract. |
| `C14/one-motive-charts` | corrected | Corrected the middle-base dimension to r(2−r), the lattice quotient and character/cocharacter duality. Removed an unsupported smooth abelian-torsor assertion for bad-level normalizations. Added the usable etaleBaseChange API contract. |
| `C14/klingen-paramodular-compactifications` | corrected | Verified the good-fan compactifications and their charts against Lan17 Theorem 6.1 and Pilloni Theorem 6.1.5.1; made the interior-moduli identification conditional on its existing gap. |
| `C14/normal-lci` | corrected | Removed a circular appeal to the unproved C8 lci extension and used the specific genus-two chart argument conditionally on its exact comparison input. Corrected integral modular suppliers and total-space codimension scope. |
| `C14/klingen-projections` | corrected | Verified the nonfinite projections in Pilloni §7.1, while restricting the isogeny degree labels to the abelian interior; the extended boundary maps are homomorphisms. |
| `C14/tp2-correspondence` | corrected | Corrected the inference from a quasi-finite boundary kernel to a nonfinite correspondence projection; added Pilloni’s formal p-rank≥1 finiteness statement with suitable fans. Added the usable refinement API contract. |
| `C14/genus-two-sheaves` | corrected | Verified the refinement projection-formula argument and strict ideal-inclusion example; removed the unsupported converse that ideal equality forces identical fans. Added the usable pullback API contract. |
| `C14/klingen-paramodular-minimal` | corrected | Corrected the isogeny direction, line descent and its proof, and separated the multiplicative-H formal open from the full p-rank≥1 inverse image. Corrected relative versus total boundary dimension. Added the usable descent_unique API contract. |
| `C14/klingen-subgroup-extension` | corrected | Replaced the invalid normality-based gluing with the two-end-piece adaptation of Stroh: the partial-flag criteria D⊂W̄^⊥ or D⊄W̄ cover since W̄ is isotropic, and the polarized 1-motive Cartier pairing glues the finite-flat models. Full intermediate flags are not needed; the existing interior/chart comparison remains an explicit input. |
| `C15/gspin-datum` | corrected | Verified the Kuga–Satake setup at MST22 §§2.1–2.2, p. 6; made positivity of δ and the odd-prime integral scope explicit, and corrected the definite-space non-example. Added the usable similitude API contract. |
| `C15/gspin-cusps` | corrected | Corrected the real rank at n=1; verified line and plane cusp dimensions, the definite rank-(n−2) quotient and flatness of the integral strata. |
| `C15/gspin-one-dimensional-cusps` | corrected | Verified the unique ray and Hecke extension; preserved finite covers, arithmetic translations and the torsor rather than a canonical product. Corrected the MST22 locator to p. 39. |
| `C15/gspin-zero-dimensional-cusps` | corrected | Fixed the sign of the Lorentzian cone, computed the unipotent group with its correct line factor and removed the collision between the line and Hecke-prime notation. |
| `C13/rank-p-finite-extension` | added | Added the missing order-p finite-flat extension theorem, with Stroh’s explicit two-open gluing; it is different from the literal quasi-finite boundary kernel. |

## Questions and routing for the orchestrator

1. Route the all-polarization Hodge-ampleness input to PELModuli:M6 or the exact earlier theorem it imports. A6’s automorphism finiteness cannot substitute for it.
2. Retain the additional general C8 relative-lci target only with its missing chart argument, or narrow that target to the properties Lan16 actually proves. The genus-two application has its own specific comparison input and does not require the unproved general extension.
3. Preserve the explicit partial-Klingen two-end-piece gluing now supplied by this review, including its covariant lattice convention and Cartier pairing. Do not identify the resulting group with the literal boundary kernel.
4. Point HigherHidaAndColemanTheory’s n=1 finite-group input to C13/rank-p-finite-extension. For n>1 retain the exact graded-extension/divisor gap until a suitable object or alternative construction is justified.
5. Keep the three interior inputs with ShimuraVarietiesPartII and retain the parent C5.31 upstream note. No supplier or upstream file is edited by this review.
