# Independent package review: Local Galois deformation rings and their components

Reviewer: Codex, session `codex-1jYfF2`, 8 October 2026. Job `REV-PKG-LocalGaloisDeformationRings`, issue #7485. This session did not write the package being reviewed.

**Verdict: needs_changes.** The independent review is complete. Clear reader, citation and prototype defects have been corrected in place. The remaining problems require a coordinated revision of the Lean interfaces; successful elaboration does not establish their agreement with the accepted plan.

## Review against the six requirements

| Requirement | Result |
| --- | --- |
| Upstream form | Pass. Compared with the ClassFieldTheory and LocalFieldsRamification roadmaps. The introduction, conventions, ownership, construction order, eight layers, target statements, APIs, worked checks, prerequisites and bibliography follow upstream form. Final README is **199,608 bytes**, below 200,000. |
| Fidelity to the accepted plan | Reader passes after the corrections below. Compared all **157 target sections** with the accepted statements and hypotheses. All **247 API names** occur under the stated namespace conventions. The reader retains worked checks, the coefficient conventions, distinct full/inertial types and the inherited qualifications on component and smoothness results. The Lean agreement fails as detailed below. |
| Own words and sources | Pass after adding missing page locators. The reader is a mathematical development in its own words, not a sequence of source excerpts or a paper-by-paper synopsis. Every target has a source entry with numbered results/sections and pages. Public-source checks are described below; no restricted book was used. |
| No programme process | Pass after removing extraction references, packet language, source-job identifiers and review/coverage accounts from the Lean comment inventory. Mathematical caveats and bibliographic version distinctions remain. The standard opening note about suggested forms is retained. |
| Suggested Lean | **Fail on mathematical specifications; pass on elaboration.** Final `lean-check` exits 0, with **0 errors and 120 warnings**, all exactly for `sorry`. Whole interfaces remain comments, several stated hypotheses are absent, and some declarations describe only weaker consequences of their named targets. |
| Metadata | Pass. The entire file is `topic = "math.NT"` followed by a newline. |

All 157 target anchors are unique. All **429 internal prerequisite links** resolve. Ownership agrees with the accepted packet and the RS-08 family owner/link map: generic deformation categories and representability belong to GlobalGaloisDeformations and DeformationAndDerivedPatchingAlgebra; period and integral categories belong to PadicHodgeTheory and FiniteFlatGroupsAndIntegralPadicHodgeTheory; this roadmap applies them to local rings, model spaces and components. General finite-height lattices are constructed once, before their rank-two applications. The determinant-ordinary image and flag-incidence image remain distinct. Polarized inert-place conditions import the polarized group interface rather than borrowing the split-place global local problems.

## Required revisions

### 1. Replace whole-interface comment inventories with typed specifications

The accepted plan has 157 nodes, including 43 definitions/constructions, 247 API entries and 162 tests. Removing Lean comments leaves 60 `def`s, six `abbrev`s, six structures, 85 theorems, 15 instances and 103 examples. These counts alone are not a coverage test: the decisive problem is that many named interfaces occur only in the final block comment.

For example, `HodgeType`, `GaloisType`, `pstRing` and the carrier `heightLatticeFunctor` have no typed definition. The typed `HasHeightLE` and its matrix monotonicity lemma do not construct the lattice functor, its coefficient base change or its moduli scheme. The period comparisons, potentially semistable point criteria, finite-flat model resolutions and several global export statements likewise remain mathematical prose. The API name `heightLatticeFunctor.mono` is present as a theorem, but its type is about matrices over an arbitrary ring rather than elements of that functor.

PROTOCOL sections 13 and 20 require definition signatures, API lemma signatures, named theorem signatures and test examples agreeing with the plan. Section 13 permits omitting a condition whose carrier cannot yet be expressed; it does not make a prose inventory a substitute for whole definitions and their APIs. Revise the supplier adapters and provide actual typed interfaces. Retain every expressible hypothesis and identification. Do not fill the gaps with arbitrary proposition fields or placeholder proposition definitions.

### 2. Give the foundational carriers their actual coefficient and group hypotheses

`LiftingRing` and `liftingRing_represents` quantify over an arbitrary Noetherian local coefficient ring, an arbitrary algebra to a field, an arbitrary topological group and a bare residual group homomorphism. The complete DVR/residue identification, residual continuity and Mazur finiteness hypotheses of README 1.1 are absent. Its Noetherian and completeness instances are consequently asserted at excessive generality. The universal property also needs the actual local, continuous, residue-compatible morphism category.

This is substantive: with coefficients ℤ_p, residual field 𝔽_p and trivial rank-one representation of the profinite product of countably many copies of C_p, continuous first-order characters include infinitely many independent coordinate characters. The intended functor cannot have a Noetherian representing ring with finite-dimensional cotangent space. Restriction to G_K, or an explicit appropriate finiteness hypothesis, is essential. The reader's local representability input is Gee, §3.1 and Lemma 3.2, p. 12, together with the imported general representability theorem.

The same correction must propagate to `UnframedRing`, `ConditionRing` consumers and the universal coefficient constructions. `ArtinCat.residue` is currently an arbitrary algebra map; it does not require a residue-field isomorphism or identify its kernel with the maximal ideal. Its topology is arbitrary rather than the coefficient-category topology. `CoeffRing` accepts an unrelated `.finite`, `.padic` or `.localCharP` tag for any field without the corresponding characteristic, local-field or residue data. Compare Böckle–Iyengar–Paškūnas, §3.5 and Remark 3.32, pp. 25–26, arXiv v2.

Similarly, `GLift` takes an arbitrary family of subgroups and no base-change compatibility. That type does not specify the closed affine group functor described in its documentation. `GFramedRing` and its multiplier construction need the relevant group-scheme, functoriality and residual-value data before their universal properties can match README 1.17–1.20. These changes require coordinated carriers, not a new unconditional instance.

### 3. State the comparison results, not only their dimension consequences

The following declarations do not have their named target's type:

| Declaration | Missing mathematical conclusion/data |
| --- | --- |
| `liftingRing_krullDim_eq_unframed` | README 1.5's complete local power-series isomorphism and framed-to-unframed map, rather than only equality of dimensions. |
| `liftingRing_baseChange_krullDim` | README 1.12's coefficient/residue compatibility square and completed scalar-extension isomorphism. The arbitrary field homomorphism in its type is not tied to the coefficient extension. |
| `determinantTwisting_krullDim` | README 1.24's character space, power map and twisting isomorphism, including p dividing the rank. The typed theorem only gives a dimension equality under p not dividing the rank and absence of p-torsion roots of unity. |
| `completion_isRegular_of_unobstructed` | README 1.18's identification of the completed local ring with the characteristic-zero lifting ring. Its premise is a cotangent-dimension inequality; neither that lifting functor nor the completion comparison is stated. |
| `LevelRaising.unr_eq_minimal` | README 2.12's equality with the polarized unramified condition. Its conclusion is two ideal containments, with no inert CM extension, polarization, multiplier or distinguished Frobenius block. |

Keep these consequences as additional lemmas if useful, but supply the stated comparisons. In particular, the determinant comparison is relative to the universal determinant ring without an integral scalar-splitting assumption: Böckle–Iyengar–Paškūnas, Proposition 4.3, p. 37, arXiv v2; Paškūnas–Quast, Proposition 3.6, p. 24, arXiv v2. Their central-quotient comparisons in Corollary 3.12 and Proposition 3.13, p. 26, also need actual ring maps and isomorphisms.

### 4. Restore the ordinary and KW parameter data

`detOrdTilde.ideal` is an ideal in the unextended framed ring with characters already valued in that ring. It does not form R̃□=R□⊗_ΛΛ̃ or use its universal full Galois characters. `detOrd` is merely a type with no ring, structural map or image identification. `detOrd_universal` restates factorization through `detOrdTilde.ideal`; it does not express descent through an injection R→S when the ordered characters are defined only over S. `detOrd_char_isRoot` gives a characteristic-polynomial root, not the finite-algebra assertion over the image ring. Compare README 7.2–7.4 and ACC+, §6.2.6, equations (6.2.7)–(6.2.8), Lemma 6.2.9 and Proposition 6.2.10, pp. 138–139, arXiv v2.

`KWCondition.weightTwo` has only a Boolean parameter and cannot record the weight-dependent WD type, dyadic branch or monodromy data. Its low-weight unramified choice is an optional group element, not an unramified character. The ideals and rings have no fixed determinant parameter ψ. Only the odd-case point criterion is typed. Restore the full chosen local data and the point criteria of README 8.2, following KW II, §3 opening and §3.2.2, pp. 18 and 22–24. This is essential for the subsequent assertions that selected quotients are domains.

### 5. Make worked examples test their mathematical objects

There are useful genuine matrix and ring tests: the ℤ/9 determinant-ordinary counterexample, explicit GL₃ ideals, corrected symplectic nilpotent formulas and the common-minimal-prime relation are retained. However, several comments identify numerical checks with substantially stronger planned tests. The weight-(p+1) ordinary-ring example proves only an equality of natural numbers; `gsp4Flag_filtration_dims` checks that a list is decreasing and bounded by ten, not the dimensions of Lie-algebra filtration subspaces; `exportCompletedTensor_count` gives a dimension sum without the completed tensor product or its ring properties. Supply the corresponding carrier-level examples and named API forms, keeping arithmetic computations as supplementary checks.

## Corrections made in place

1. Corrected the Layer 1 introduction: its ordinary flag scheme is constructed there, with geometric comparisons in Layer 6.
2. Restored the relative determinant presentation, cocycle counts and its absence of a p-not-dividing-rank restriction in README 1.16. Distinguished this from integral scalar splitting in the conventions.
3. Expanded README 1.20 to state the relative Lie-kernel presentation and both central-quotient isomorphisms, with the smoothness, finite étale and torus hypotheses. Restored its fixed-multiplier GSp₄ consequence.
4. Restored README 1.24's torsion determinant character, universal character ring, power map and full twisting isomorphism, including the case p divides the rank.
5. Restored the general-rank unobstructed ring in 2.4, the prime-to-p inertia characterization/tangent space in 2.8, both universal Taylor–Wiles matrices in 2.10 and the Steinberg-to-full-special-type isomorphism in 2.26.
6. Corrected README 2.12: in odd parity the equation x₀(2+x+y)=0 forces mixed **equal to unramified**, not ramified. The ramified subproblem has relative dimension N²−1. This follows directly from the coordinates in the proof of Liu–Tian–Xiao–Zhang–Zhu, Proposition 3.5.2, pp. 27–28, arXiv:2108.06998v1, and is already required by the accepted plan. Restored the three blockwise condition definitions and the precise KW weight/type branches in 8.2.
7. Specialized `coeffRing_finite` to the actual finite residue field of a complete DVR, rather than asserting the coefficient ring is unchanged for every finite field extension. Added the Hausdorff coefficient-space hypothesis to `TameGroup.lift_ext` for its dense-generator uniqueness argument.
8. Removed programme-process references from the Lean inventory while retaining the mathematical qualifications. Added page locators for Shotton Definition 3.5/Proposition 3.6 (p. 12, arXiv v2), BCGP21 §7.4.13 (pp. 193–194, arXiv v3), and Thorne Proposition 3.15 (p. 18) and Proposition 3.17 (p. 20), accepted manuscript. The matching Lean inventory citations were updated too.

## Validation and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocalGaloisDeformationRings.json`: exit 0, **0 errors and 0 warnings**. The accepted packet was not edited; its ten inherited gaps, 22 supplier requests and unchecked implementation statuses remain as they were.
- `lean-check research/blueprint/packages/LocalGaloisDeformationRings/Suggested.lean`: final exit 0, **120 warnings, all for `sorry`**, no errors. Checks were sequential, with 111 GB available before the final run; no language server or Lake build/update/cache command was used.
- Read all nine cited baseline declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: `MvPowerSeries`, `ProfiniteGrp`, `Module.Finite`, `IsAdicComplete`, `IsLocalRing.ResidueField`, `Matrix.symplecticGroup`, the two named Weierstrass results and `TauCeti.ContCohomology.H2`. The last is an additive quotient, not already the coefficient-linear finite-dimensional/local-duality interface. Read the reviewed library audit and family ownership/link map.
- The shared Mathlib checkout is the required pin. The shared Tau Ceti checkout is newer than its pin; this Suggested file imports only individual Mathlib modules, so the elaboration uses no newer Tau Ceti declaration. The Tau Ceti baseline assertion above was checked separately at its exact pin.
- Checked the accepted plan throughout; public PDFs were read for the presentation, central-quotient, parity and added-locator checks. This package review does not re-prove every research theorem or discharge inherited supplier obligations.
- A twelve-word English phrase scan against the six public PDF texts found only bibliography/title overlaps in the README, no mathematical prose overlaps of that length.
- JSON/TOML, reader size, target/API inventory, internal links, source-page presence, process-language scan, intake file checks and whitespace checks pass.

No independent-review work remains. The package needs revision against the five groups of findings above before acceptance. The report, accepted packet and package contain the necessary continuation information; no scratch file is needed.
