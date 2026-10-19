# Independent review: Hermitian K-theory of Poincaré ∞-categories

Accepted after the corrections below. Reviewer: Codex, session `codex-DnbNPl`, job `REV-DESIGN-HermitianKTheoryOfPoincareCategories` (#3545), 19 October 2026. The design was written by Claude Code, session `claude-JQBZPP`; this reviewer did not write it.

This accepts a complete target-level planning pass, not a formalization or a gap-free implementation. All nine stages satisfy PROTOCOL §0's definition of `planned`: each stated target is represented and its prerequisite chains terminate in a library, another roadmap, a requested supplier or a recorded gap. No stage is `closed`. The six recorded gaps remain, with their affected statements explicitly conditional. There is no unresolved contradiction in the corrected plan.

## Scope and counts

All 62 nodes were read, including their hypotheses, proof routes, acceptance checks, source matches and prerequisites. The packet's `review.checked` records an individual verdict and reason for every node: 42 verified and 20 corrected; no nodes added, removed or left unverifiable. Corrections stay at target level rather than introducing proof-lemma nodes.

| Item | Before | After |
| --- | ---: | ---: |
| Nodes | 62 | 62 |
| Definitions / constructions | 6 / 7 | 6 / 7 |
| Theorems / comparisons | 48 / 1 | 48 / 1 |
| API items | 78 | 88 |
| Definition/construction unit tests | 49 | 52 |
| Planets | 26 | 26 |
| Baseline declarations | 16 | 16 |
| Planned / closed stages | 9 / 0 | 9 / 0 |
| Recorded gaps / supplier requests | 6 / 2 | 6 / 2 |
| Source findings independently confirmed | — | 9 |

Every definition/construction has at least three discriminating tests. The 26 planets name central definitions, constructions and theorems; none needed renaming. The suggested file remains a 303-line collection of light definitions, statements and examples over existing carriers. Its seven proof placeholders are honest `sorry`s; it introduces no substitute stable ∞-category or Poincaré carrier.

## Primary sources and editions

I read each node's locator in the following public primary texts. The packet records PDF SHA-256 values and reading dates. Statements and explanations in the deliverables are in our own words, with locators; no source passages are reproduced.

- [Calmès et al. III, arXiv:2009.07225v4](https://arxiv.org/pdf/2009.07225v4), 28 April 2026: Introduction pp. 1–5; Recollection pp. 6–11; §1.1 pp. 12–15; §1.2 pp. 15–27; §1.3 pp. 27–33. These contain the planned results. The start of §2 identifies the boundary with the localisation/dévissage supplier.
- [Calmès et al. I, arXiv:2009.07223v3](https://arxiv.org/pdf/2009.07223v3), 27 December 2021: Example 1.2.15 p. 21; Corollary 1.3.6 p. 23; Definitions/Constructions/Lemmas 2.3.5–2.3.11 pp. 36–38; Corollary 2.4.6 p. 43; Definition 3.1.1 p. 47; §3.2 locators pp. 52–53; §3.5 opening, Lemma 3.5.1 and Proposition 3.5.3 pp. 59–60; Definitions 4.2.2/4.2.4 p. 68; Proposition 4.2.18 pp. 71–72; Proposition 4.2.22 through Definition 4.2.26 and the form-parameter discussion pp. 73–74.
- [Calmès et al. II, arXiv:2009.07224v5](https://arxiv.org/pdf/2009.07224v5), 11 April 2025: Example 1.2.5 p. 20; Remark 3.5.5 through Proposition 3.5.8 p. 87; Definition 4.2.6 through Corollary 4.3.4 pp. 100–101; Theorem 4.4.11 and Corollaries 4.4.13–4.4.14 pp. 106–107.
- [Ranicki, The algebraic theory of surgery I](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/ats1.pdf), author's archive of PLMS (3) 40 (1980), 87–192: the relevant definitions in §1, printed pp. 96–104 (PDF pp. 10–18), Wu classes pp. 112–114 (PDF pp. 26–28), Poincaré pairs/cobordism in §3 pp. 133–139 (PDF pp. 47–53), and Proposition 4.5 p. 153 (PDF p. 67).
- [Lurie, Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), 18 September 2017: §7.2.2, Proposition 7.2.2.18 and Corollary 7.2.2.19, including its proof, pp. 1244–1246.

[Annals metadata](https://annals.math.princeton.edu/2026/204-1/p02) now identifies Paper III as Annals of Mathematics 204(1) (2026), 119–220, DOI 10.4007/annals.2026.204.1.2. I corrected the old “to appear” description. The journal page was readable, but both Project Euclid full-text and PDF endpoints served an Incapsula challenge rather than the article. I therefore did not compare the version of record. All nine source findings are expressly about arXiv v4. No linked correction was found in the arXiv record, journal metadata, [Hebestreit's publications](https://www.math.uni-bielefeld.de/~hebestreit/) or [Calmès's paper page](https://bcalmes.perso.math.cnrs.fr/pro/recherche/publis/hermpoinc-three/index_en.html); this is a record of those searches, not a claim that no correction exists.

## Corrections to the mathematics and interfaces

The node identifiers below are relative to this roadmap. All corrections are mirrored in the reader document; the introductory roadmap definition is updated where its scope, conventions or suppliers change.

1. **HK.0/module-with-involution-operations.** Definition R.1's unit map is between the first-action and second-action modules, not the ordinary endomorphism ring for a single action. With the source's weak anti-involution convention, Example R.2(ii), p. 7 requires `J(x)=ε⁻¹x̄`. The original `εx̄` need not square to the identity or exchange the actions. The proof now verifies both identities and the rank-one unit-map condition. The dual coefficient's involution is induced by transporting duality through the finite-projective Morita duality, before the later transport of Q; raw precomposition with J does not establish R-linearity. Added involution/extensionality API and the noncentral matrix test described under E8.
2. **HK.0/tate-collapse-criterion.** The successive truncation triangle has cofibre `Σ^m Hπ_m`, not fibre. The collapse criterion itself and its Tate-cohomology hypothesis remain valid (Remark R.4, p. 8).
3. **HK.0/opposite-ring-transport.** Added the compatibility of double transport with the evaluation equivalences and `(R^op)^op ≃ R` (Remark R.11, p. 11).
4. **HK.1/forgetful-hyperbolic-sequence.** Distinguished connective K from KII.0's nonconnective K carrier via its connective cover. The hyperbolic Poincaré category is the stable category `C^op × C`; GN's exact-category hyperbolic *space* does not supply that carrier (Paper II, Example 1.2.5, p. 20). Removed that misleading direct prerequisite while retaining GN's stable foundations.
5. **HK.2/opposite-ring-bounds.** A nontrivial line bundle can be self-dual. The counterexample to `L∨=L` now requires `L⊗L` nontrivial and explicitly acknowledges order-two lines. This corrects the test, not Example 1.1.5's comparison bounds (p. 12).
6. **HK.3/lagrangian-surgery.** Added naturality of the surgery construction under Poincaré equivalences, rather than leaving users to reconstruct it from the datum (Construction 1.1.15, pp. 14–15).
7. **HK.3/bounded-l-monoids.** Added the cokernel universal property: maps out of the bounded monoid correspond to monoid maps on objects killing the allowed metabolic boundaries (Definition 1.2.1, p. 15). This works before the group condition `b≥a` is imposed.
8. **HK.4/ranicki-short-complexes.** Replaced broad section references with precise printed/PDF page ranges for complexes, pairs, cobordism and Wu classes. Added the quotient universal property of the short L-group. The standard-resolution versus homotopy-fixed-point comparison remains an explicit refinement.
9. **HK.4/witt-group-computes-L0.** The odd-degree formation statement in Remark 1.2.17, p. 20 is an unplanned extension G5; it is not a consequence proved by this even-degree Witt identification.
10. **HK.5/ring-spectrum-setting.** Applied KII.0's right-module carrier to the opposite ring spectrum to obtain left modules. Fixed the connectivity convention: a k-connective map has k-connective fibre, equivalently (k+1)-connective cofibre. Added the homotopy-group characterization and a test: `Hℤ→H𝔽₂` has 1-connective cofibre but is not a 1-connective map, because π₀ is not an isomorphism.
11. **HK.5/connective-comparison.** Corrected the same fibre/cofibre convention in the hypotheses of Proposition 1.2.29, pp. 24–25. The identity-base-change test compares the stipulated `Q^q→Q` map, without silently replacing both structures by Q.
12. **HK.5/pi0-comparison.** Remark 1.2.34, p. 26 proves optimality of the *linear-part connectivity estimate*. It does not alone prove sharpness of the resulting L-group range. CH.11 supplies ko, while its Tate calculation remains G3. Corrected the statement, proof route, source match, stage description and coverage detail accordingly.
13. **HK.6/coherent-global-dimension.** The finite-generation conclusion needs the target `finitePresentation_finiteProjectiveResolution`, not merely a bare projective-dimension inequality. Retained the weaker suggested Lean theorem, whose body is correctly `hd M`, and changed its documentation so it does not claim to construct a finite resolution. The full resolution remains a README target (§1.3 setting, p. 27).
14. **HK.6/perfect-postnikov-t-structure.** Made the convention adapter explicit: Mathlib's cochain degree i is homological degree −i, so its cohomological ≤0 half gives this roadmap's homological ≥0 half. The ordinary derived t-structure is a homotopy-category shadow; its ∞-enhancement and restriction to perfect objects are separate inputs/targets.
15. **HK.6/t-structure-bounded-l.** Added the quotient universal property in the chosen t-structure and a shifted-duality counterexample to inferring upper concentration from a single lower duality bound. The definition uses connectivity, exactly as on p. 27.
16. **HK.6/symmetric-surgery.** Restored the bounded t-structure hypothesis of Proposition 1.3.1, p. 27. Kept its general connectivity conclusions but restricted the finite-interval consequence to discrete-ring coefficients, using the width criterion as a direct prerequisite. The heart comparison check now requires the duality to exchange both halves, rather than inferring this from `D(C≤0)⊆C≥0`. The shifted-duality counterexample is E9 below.
17. **HK.7/genuine-comparison-theorem.** Added the exact locator for Ranicki's earlier symmetric comparison, Proposition 4.5, printed p. 153/PDF p. 67. Retained the modern source's bounds and the common-duality argument for the GW square.
18. **HK.7/form-parameter-structures.** Stated the unsupplied polynomial-functor equivalence and non-abelian derivation as inputs G4; citing Paper I Definition 4.2.26 alone does not provide the construction. Added compatibility with morphisms of form parameters, conditional on those inputs.
19. **HK.8/classical-gw-fibre-sequence.** Replaced H.4's homology group-completion theorem with GN §6.1.6's symmetric-monoidal-groupoid adapter to GeneralizedCohomology G2.8. H.4 alone does not produce the connective spectrum. The roadmap-level supplier list and GN request now identify the correct interface.
20. **HK.8/quadratic-symmetric-gw-comparison.** Propagated G4 to the arbitrary-form-parameter extension. The quadratic-to-symmetric comparison of Theorem 3 remains independent of that extra construction.

## Source findings

Every original finding E1–E7 has an independent `confirmed` verdict with a reason in the packet. I added E8 and E9 with independent checks. The `printed` fields describe the source claims in our own words rather than transcribing passages.

| Finding | arXiv v4 locator | Verdict and effect |
| --- | --- | --- |
| E1 | Corollary 1.2.12 proof, p. 18 | Confirmed wrong variable in the last injectivity bound; use `n≤2m−3`. |
| E2 | Proposition 1.3.1(i),(ii), p. 27 | Confirmed stale category name; use the quantified general C. |
| E3 | Remark 1.2.28, p. 23 | Confirmed the cited item 1.1.6 is a lemma. |
| E4 | Example 1.3.11, p. 31 | Confirmed the needed vanishing is degree −2 for genuine symmetric theory over 𝔽₂, not all of that theory. |
| E5 | Corollary 1.3.10 proof and before Corollary 1.3.14, p. 31 | Confirmed the square is supplied by Paper II Corollary 4.4.13 with a common K-orbit term, not Paper III Theorem 1. |
| E6 | Remark R.7, p. 9 | Confirmed an omitted Frobenius-action convention on R[2]; this does not invalidate the symplectic conclusion. |
| E7 | Remark 1.3.17, p. 32 | Confirmed coherence and global dimension ≤1 are needed; Krull dimension one alone does not suffice. |
| E8 | Example R.2(ii), p. 7 | New: the noncentral coefficient involution needs ε⁻¹ with the displayed conjugation convention. |
| E9 | Remark 1.3.2, p. 27 | New: the finite concentration intervals do not follow for a general C from the single duality inclusion. |

For E8 take `U=[[1,1],[0,1]]` in Mat₂(ℤ), `x̄=UxᵀU⁻¹` and `ε=U(Uᵀ)⁻¹=[[0,1],[−1,1]]`. Then `x̄̄=εxε⁻¹` and `ε̄=ε⁻¹`. The incorrect map squared sends `E₁₁` to `[[0,1],[0,1]]`; the corrected map squares to the identity and exchanges the two R-actions. The two literal matrix regressions in Suggested.lean are proved by Lean's kernel computation, without `sorry`.

For E9 transport the ordinary symmetric Poincaré structure on Perf(ℚ) through the suspension [1]. Its duality is `D(X)=X∨[2]`. The standard bounded t-structure satisfies `D(C≤0)⊆C≥0`, so `d=0` is allowed; the symmetric structure is r-symmetric for `r=0`. The parameters `n=a=b=0` satisfy Proposition 1.3.1. The transported form ⟨1⟩ on ℚ[1] is an allowed connective Poincaré object but is not concentrated in [0,0]. Its nonzero Witt class also rules out replacing it by a cobordant object in that interval: any degree-zero object self-dual for this D must be zero. Proposition 1.3.1's connectivity result survives; the extra interval assertion needs stronger control, present for the discrete coefficient duality in Lemma 1.1.6.

## Baseline and ownership

All 16 cited declarations exist and were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No baseline citation was removed. Corrected the `provides` descriptions of `DerivedCategory` and `DerivedCategory.TStructure.t` to distinguish ordinary and enhanced categories and their indexing conventions. Also clarified that the Dedekind, semisimple and Noetherian predicates do not themselves supply the new global-dimension/coherence theorems.

| Pinned declaration | What was checked |
| --- | --- |
| `CategoryTheory.Triangulated.TStructure` | Triangulated t-structure carrier; only the ordinary shadow of the required enhanced notion. |
| `CategoryTheory.Triangulated.TStructure.heart` | Intersection of the two zero halves. |
| `DerivedCategory.TStructure.t` | Ordinary cochain derived t-structure; reverse indices for homological connectivity. |
| `DerivedCategory` | Localized cochain category, not the perfect stable ∞-category. |
| `CategoryTheory.HasProjectiveDimensionLE` | Ext-vanishing bound for an object of an abelian category. |
| `Module.Invertible` | Commutative-ring invertible-module predicate, used only for the line-bundle case. |
| `IsDedekindDomain` | Includes fields; used for the ≤1 target, without asserting exact dimension one. |
| `IsSemisimpleRing` | Semisimple-ring predicate used in the dimension-zero characterization. |
| `IsNoetherianRing` | Predicate supplying the Noetherian hypothesis. |
| `Module.FinitePresentation` | Finite-presentation predicate over the stated module carrier. |
| `HomotopyEquiv` | Equivalence of complexes up to homotopy, stronger than a mere quasi-isomorphism. |
| `Module.Projective` | Projectivity for the finite-projective complex representatives. |
| `ChainComplex` | Homological complex carrier with integer indices. |
| `HomologicalComplex.homology` | Homology of those complexes. |
| `Rep.FiniteCyclicGroup.tateCohomologyIsoEven` | Finite cyclic group, generator and even-degree hypothesis; norm/difference homology. |
| `Rep.FiniteCyclicGroup.tateCohomologyIsoOdd` | Same hypotheses with odd parity and reversed maps. |

I read the relevant supplier statements in EnhancedDerivedSheaves E0/E5; GeneralAlgebraicKTheoryPartII KII.0/KII.3; RefinedTraceMethods RT.2; ChromaticHomotopyTheory CH.11; StableHomotopyKTheory H.4; and GN.6. In particular, p-completeness is not Lin's theorem, constructing ko does not compute its Tate spectrum, exact hyperbolic spaces are not stable hyperbolic categories, and homology group completion is not an E∞-space-to-spectrum equivalence. The corrected dependencies preserve those distinctions.

The current read-only TauCetiRoadmap tree was checked at commit `0d144d044dacebca17b654695b6f1ad58f159b27`, with current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read the nearby GrothendieckEulerForms ownership and QuadraticFormInvariants Layer 4 and checked the actual `WittRing` carrier. The latter is imported, never re-planned. Searches of the current library and the reviewed `data/library-coverage.json` did not reveal existing carriers for the new stable Poincaré constructions or a duplicate coherence/global-dimension target.

GN's expanded Poincaré foundations are on [TauCetiRoadmap PR #851](https://github.com/TauCetiProject/TauCetiRoadmap/pull/851), read at head `d63953a26ec1ff4f57cb1d0ee5aab223a4a48108`; that PR was open when checked. I read its §§6.8a and 6.1.6, and the inherited §6.10b boundary. The request cites those supplied interfaces and does not re-plan them. Packaging must respect that upstream dependency.

## Remaining inputs and orchestrator decisions

The six gaps are preserved rather than counted as solved:

- **G1:** Lin's C₂ Tate-sphere theorem, used conditionally in HK.5's sphere example.
- **G2:** Ranicki–Shaneson, Read and Schlichting inputs for HK.7's sharpness examples.
- **G3:** The Tate calculation for ko, used for the linear-part example, not by the comparison proof.
- **G4:** The form-parameter/polynomial-functor equivalence and non-abelian derivation, needed by the arbitrary-parameter construction and its endpoint extension.
- **G5:** Identification of odd genuine L-groups with formation groups, beyond the planned even-degree theorem.
- **G6:** GN §6.10b's inherited multiplicative input for the two-inverted genuine comparison.

No new mathematical owner was invented for these inputs. The orchestrator should retain them for follow-up work and arrange ownership where absent; it should not treat this acceptance as closing them. GN #851 remains an upstream prerequisite for packaging. No additional question blocks acceptance of this pass.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/HermitianKTheoryOfPoincareCategories.json`: **0 errors, 0 warnings**, including prerequisite resolution/cycle checks.
- The shared `source_issues.check_issues` and `check_errata.versions_checked` checks: **pass** for all nine findings and the recorded editions.
- Exhaustive packet review coverage: **62 distinct verdicts for 62 nodes**; all 13 definitions/constructions have at least three tests. Reader statements, hypotheses, proof routes, acceptance checks, APIs and tests checked against the packet after accounting for Markdown escaping.
- `lean-check research/blueprint/suggested/HermitianKTheoryOfPoincareCategories.lean`: **exit 0**, seven `declaration uses sorry` warnings and no other diagnostics. Memory was checked first (86 GB available). The matrix regressions and existing numerical/form/Tate examples elaborate at the pinned build.
- `git diff --check`: **pass**.

The packet's review status is `accepted`, with reviewer `independent-review-REV-DESIGN-HermitianKTheoryOfPoincareCategories`. No promotion or upstream edits were performed.
