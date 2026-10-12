# REV-PKG-AbelianSchemesAndArithmeticModuli — independent package review

Issue [#8893](https://github.com/CBirkbeck/tauceti-explorer/issues/8893). Reviewer: Claude (Opus 5.5), session
`claude-fiVDgX`, which did no part of `PKG-AbelianSchemesAndArithmeticModuli` (that package was written by session
`claude-nN1YWY`). Date: 2026-10-12. Method: `research/blueprint/PACKAGE_REVIEW.md`. Three Sonnet subagents did the
mechanical cross-checks: upstream roadmap layer ids, library names against the pinned and current checkouts, and atlas
roadmap citations with their tiers. I read the README in full and recomputed every Check and worked example. I checked
the source locators against the public texts myself.

**Verdict: accepted**, with the corrections below applied in place.

## Files

- `research/blueprint/packages/AbelianSchemesAndArithmeticModuli/README.md`: 2,437 lines, 191 KB after the corrections.
- `research/blueprint/packages/AbelianSchemesAndArithmeticModuli/Suggested.lean`: 534 lines.
- `research/blueprint/packages/AbelianSchemesAndArithmeticModuli/metadata.toml`: `topic = "math.AG"`. This is a fitting
  category, so it is unchanged.

## 1. Upstream form

The README has the TauCetiRoadmap shape:
- an opening **Summary**, then *Scope and ownership*, *Conventions* and *Exact supplier contracts*;
- *How to read the build*, then layers A0–A6 with prose subsections;
- an API list and **Checks** for every definition, and *Examples* and *Dependencies* at the end of every layer;
- *Worked examples*, *Downstream consumers* and *References*.

It has no target tables or field lists. Size is not an issue: tier 1–4 roadmaps run larger.

## 2. Fidelity to the plan, boundaries and prerequisites

The package handoff maps all 89 plan nodes to README targets, and I found no dropped target. The supplier citations
were checked against the current upstream and atlas texts:

- **JacobianChallenge.** The layers were mis-assigned. The Abel–Jacobi morphism and the Albanese universal property
  are Layer F, not D or E. Hom, End and products are Tau Ceti library data, not Layer E. The Poincaré rigidification
  is Layer D's. Corrected in Scope, in the supplier contracts, and in A2.2, A6.35 and the A6 Dependencies.
- **AlgebraicVectorBundles.** The vector group `V(F) = Spec Sym(F^∨)` is L2B, not L2A (L2A is `Spec Sym(F)`).
  Corrected in A4.2 and the A4 Dependencies.
- **ModularCurves.** Every cited id exists and covers what is claimed: 0B, 1C, 1D, 2A–2F, 7E (PD-1, PD-2) and
  7F (ST-1). ModularCurves 2D calls `P ↦ O([P] − [0])` the canonical principal polarisation. A0.2(3) already records
  that this is the negative of `φ_{O(0)}`, matching Conrad, *Polarizations*, Example 2.5, p. 7. I made the
  identification with 2D's `λ_E` explicit.
- **Atlas suppliers.** Every AlgebraicModuli, SchemeAndStackFoundations and ComplexComparisonPartII name exists, at the
  section cited. I completed the supplier contracts with the hypotheses the suppliers actually state:
  - `picard_zero_criterion` needs geometric identity components that are smooth of locally constant dimension. For
    an algebraic-space Picard sheaf it uses `spaceSectionComponentCriterion` of AlgebraicModuli §7.9.
  - `homAndIsomSchemes` needs a quasi-projective target. A0.3(4) now assumes `B` quasi-projective.
  - SF.5 intersection products need smooth schemes. Grothendieck–Riemann–Roch needs projective morphisms of smooth
    quasi-projective schemes, with rational coefficients.
- **Tiers.** This roadmap is tier 6. It depends only on Mathlib, Tau Ceti and tiers 2, 4 and 5. Roadmaps of tier 6
  and above appear only as boundaries and downstream consumers. The two move-downs that CaraianiNewton.md records are
  planned here: the FiniteFlat… Barsotti–Tate, divided-power and Grothendieck–Messing interfaces are A4.5–A4.7, and
  the ArithmeticGaloisRepresentations Tate local system is A4.1 and A6.33.

## 3. Sources and locators

I downloaded and checked the following texts: Milne 2008 (SHA-256 matches the packager's) and Milne 2022; Olsson;
Kass; Oort; Conrad's *Polarizations*; the Stanford VIGRE notes; Conrad–Feng; Katz; Boxer–Calegari–Gee–Pilloni v1;
Caro–Pasten v2; Lipnowski–Tsimerman v1; Xie–Yuan v1; Poonen; and Stacks tags 05YF, 05YC, 0D24 and 0BEV. I read
Faltings–Chai I.1.9–1.10 in the maintainer's cleared copy.

Locators confirmed:
- **Milne 2008:** Lemma 10.6, Theorem 10.9, Remark 10.11, Lemma 10.12, Proposition 10.13, Theorem 10.15,
  Proposition 10.20, Lemmas 10.21–10.22, Proposition 10.23, Theorem 11.1, Remark 13.9, Theorem 14.3,
  Proposition 14.4, Lemma 14.5, and §6, p. 30.
- **Milne 2022:** Corollary 12.8, Theorem 13.3, Theorem 15.1, Lemma 15.2, Remark 15.4, Theorem 17.3, Lemma 17.4,
  Proposition 20.1 and Corollary 20.2.
- **Olsson:** §2.1.4, Remark 2.1.6, Lemmas 2.1.8–2.1.9 (fppf representatives, étale when 2 is invertible), and
  Theorem 2.1.11 with its proof.
- **Kass:** Theorem 1, Corollary 1, Theorems 5–8.
- **Oort:** Lemma 2.3.2, pp. 282–284.
- **Conrad, *Polarizations*:** Example 2.2, Lemma 2.3, Remark 2.4, Example 2.5, Definition 3.2, Theorem 3.4.
- **Stanford VIGRE notes:** Theorem 1.8, Definitions 1.13–1.14, Lemma 1.16, Theorems 1.17–1.18, Corollary 1.20.
- **Conrad–Feng:** Lemma 2.2.1, Theorem 3.1.1, Exercise 3.1.4, Theorems 7.6.1 and 7.6.7.
- **Katz:** Lemma 1.1.3, Theorem 1.2.1, Theorem 2.1, Lemma 4.1.2.
- **Boxer–Calegari–Gee–Pilloni:** §1.8.23, Lemma 9.3.4, Remark 9.3.5, Lemma 10.3.1 and Remark 10.3.2.
- **Caro–Pasten:** Lemmas 5.1–5.2 and §5.1.
- **Lipnowski–Tsimerman:** §4.2, Lemma 4.6, Remark 4.8, Propositions 4.9–4.11, Examples 4.12–4.13, §4.5.
- **Xie–Yuan:** Lemma 4.1.
- **Poonen:** Definition 4.6.1, Proposition 4.6.3, Remarks 4.6.5–4.6.6, Example 4.6.8, Exercises 4.7–4.8.
- **Faltings–Chai:** Theorem I.1.9(a)–(b), the affine-neighbourhood property used by A2.1(3) and A6.30, and
  Remark I.1.10(a).

Corrected:

| Where | Was | Now |
|---|---|---|
| A0.1 | Kass, Definition 1 and Theorem 1, pp. 1–3 (Kass has no Definition 1) | §1, the definition on p. 1, and Theorem 1, p. 2 |
| A1.3 | Caro–Pasten §§7.1, 9.3, pp. 25–26, 36–37 (v2 has §7.1 on p. 23 and §9.3 on p. 32, and neither is about this) | §8.1, p. 26, and Lemma 9.7 with its proof, p. 31 (differentials of an abelian scheme over a DVR) |
| A1.5 | Conrad–Feng Theorem 3.1.6, pp. 27–28 | Theorem 3.1.6 and its proof, pp. 26–28 |
| A2.4 | Conrad–Feng §7.5, pp. 69–72 | Theorem 7.2.1, p. 63 (`χ(P) = (−1)^g`), and §7.5, pp. 71–72 |
| A3.2 | Milne 2022 Theorem 20.7, pp. 43–44 | Proposition 20.7, p. 44; §8, Theorem 8.2 and its proof, pp. 13–14 |
| A3.4 | Milne 2022 §12, pp. 22–24, and §19, pp. 40–42 (§19 is the zeta function) | §8, p. 12, and Lemmas 12.2 and 12.6, pp. 20–21 |
| A3.6 | Milne 2022 §13, Theorem 13.3 (no stated use) | Theorem 13.3(a), p. 25, for the order `χ(L)²` of `K(L)` |
| A3.12 | Boxer–Calegari–Gee–Pilloni §8.1.1, pp. 181–182 | §8.1 and equation (8.1.1), p. 180 |
| A4.1 | Milne 2022 §18, pp. 38–40 (§18 is finiteness theorems) | Remark 8.4, p. 14, where `T_ℓ A` is defined |
| A6.5 | Milne 2022 Theorem 12.1, pp. 22–23 | Proposition 12.1, p. 19 |
| A6.14 | Milne 2022 pp. 35–37 | pp. 35–36 |
| A6.32 | Stacks 05YC cited for the jet-space identification (05YC is base change of restriction of scalars) | Poonen Example 4.6.8 only |

## 4. Gaps and supplier ids

No forward references. The packager's script-checked *Needs* were spot-checked and agree. There are no
`FoundationsAndLibraryIntegration` or `UPSTREAM:` ids. Library names that exist only in the current Tau Ceti were
listed as pinned; they are now marked as current library:
- `finrank_tangentSpace_eq_dim` (pinned has `finrank_tangentSpace_eq_finrank_cotangentSpace`);
- `rigidifiedPicardFunctor` and `RigidifiedLineBundle`;
- `GroupScheme/Kernel` in A1.7 and A3.1.

The Rigidity declaration's name is `AbelianVariety.Hom.equivPointed`.

## 5. Duplication against current Tau Ceti (a91d3aaf) and TauCetiRoadmap main

No upstream roadmap plans any of the following beyond the elliptic case:
- abelian schemes, dual abelian schemes, polarizations, the Rosati involution or Néron–Severi;
- theta groups, Serre–Tate, Grothendieck–Messing or Barsotti–Tate groups;
- complex tori or the Siegel space.

The elliptic case is ModularCurves and EllipticCurves, and the README cites both as boundaries. Weil restriction
exists only for affine group schemes, in ReductiveGroupsPartII and AdelicAlgebraicGroups. The current library
contains:

- **Removed and cited: Riemann forms.** The current library has `TauCeti.AlmostComplexStructure.IsRiemannForm`
  (`Geometry/Hodge/WeightOne/RiemannForm`). It is the same object as the planned `RiemannForm`: an alternating
  integral form, `J`-invariant, with positivity `E(Jv, v) > 0` and the same sign. It comes with
  `isRiemannForm_iff_isPolarization` and `latticeHodgeStructureEquiv`.
  - A5.2 now cites it. The roadmap keeps only its additions: the Hermitian form, principality (Mathlib
    `LinearMap.IsPerfPair`), scaling, pullback, and the homological weight `−1` adapter with `C = −J` and `Q = −E`.
    A5.2 says in one clause how that adapter differs from Tau Ceti's weight-one `latticeHodgeStructure`, which has
    Weil operator `J` and form `E`.
  - A5.5 and A5.7 now use those declarations.
  - The `RiemannForm` structure and its examples are deleted from `Suggested.lean`, because the Tau Ceti predicate
    is not at the pinned commit. The kept API is listed in the closing comment.
- **Kept variant: `IsAbelianIsogeny`.** The pinned Tau Ceti has `TauCeti.GroupScheme.IsIsogeny`, which is finite,
  flat and surjective, for group schemes over `Spec R`. The definition now uses exactly that condition, with local
  finite presentation dropped as automatic. A3.1 says that the target is the same condition over an arbitrary base.
- **Kept variant: A5.4(1).** Over a field, Tau Ceti has symplectic bases
  (`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, current). The integral elementary-divisor statement is
  the target, and A5.4 now says so.
- **Already handled by the packager:** `isMonHom_of_one_hom` (A1.2 states that the arbitrary base is the content),
  `TateModule`, `IsAlbanese` and the group-scheme kernel.

## 6. Adversarial mathematics pass

I recomputed every Check and worked example. The table lists the statements where an instance was tried, with the
result.

| Statement | Instances tried | Result |
|---|---|---|
| A1.5 cube formula `[n]^*L ≅ L^{n(n+1)/2} ⊗ ([−1]^*L)^{n(n−1)/2}` | `n = 0, −1, 2`; symmetric and antisymmetric `L`; sum–difference on `A × A` | correct; A1 Example notation fixed (it wrote `L = O(0) ⊠ O(0)` and then `L² ⊠ L²`) |
| A1.7 torsion exponents `n²`, `n`, `2n²` | `[n]` restricted to `A[n]` | correct |
| A1.2(3) zero on one fibre per connected component ⇒ zero | non-locally-Noetherian `S` (clopen locus by noetherian approximation) | correct |
| A2.3–A2.4 `φ_{O(d·0)}`, `deg φ_L = χ²`, `h⁰` on `E²` | `d = 1, 2`; type `(1, 2)` | correct; degree wording fixed (below) |
| A2.5 polarization degree | elliptic `O(2·0)`, `E²` with `2λ₀`, type `(1, 2)` | **convention conflict fixed**: A2.5 called `d` the degree (Olsson), while A2.4, A5, A6.13 and A6.19 used the isogeny degree `d²` (Milne). A2.5 and Conventions now fix: degree `d`, kernel rank `d²`, `deg λ = d²`, with a two-term witness |
| A2.6 representatives, graph bundle rank `d(6r)^g` | `g = 0, 1`, `d = 1, 2`; genus-two worked example `h⁰(M³) = 36` | correct; Olsson 2.1.9 says fppf, and étale when 2 is invertible |
| A3.6 `ThetaGroup` Check "skew vs strongly alternating on `α₂ × α₂`" | every bilinear `α₂² × α₂² → μ₂` is `∏(1 + c_{ij} x_i y_j)`; skew forces `c_{ij} = c_{ji}` and then `e(x, x) = 1` | **false witness**, replaced by `(ℤ/2)²` with `(−1)^{a·b}` over `ℚ`: skew and perfect, with `e((1,0),(1,0)) = −1` |
| A3.7–A3.8 Weil pairing perfection, `|GL₂(𝔽₃)| = 48` | degree prime to `n`; type `(1, 2)` on `A[2]` | correct |
| A3.12 genus-two pairing `(−1)^{|{i,j}∩{k,l}|}` | BCGP (8.1.1) | correct |
| A4.10–A4.11 Serre–Tate symmetry, `q ↦ q^p` | principal and `(1, p)` polarizations; Tate-curve analogue | correct (the `(X, pZ; Z, Y)` pattern is the transpose convention) |
| A4.3 polarization self-pairing | `[p] ∘ λ₀` in characteristic `p` | correct |
| A5.2 sign conventions | `H(Jv, w) = iH(v, w)`, Hermitian symmetry, Gaussian `E(i, 1) = 1`, `Q(Cv, v) = E(Jv, v)` | correct |
| A5.8 Siegel action | `z ↦ (CΩ + D)^{−T} z` maps `Λ_Ω` onto `Λ_{MΩ}` (the change of basis is `Mᵀ`); `E(Ωe_i, e_j) = δ_{ij}` | correct; "full level `N`" renamed **symplectic** level `N` (A3.8's `FullLevel` has no symplectic condition) |
| A6.6, A6.9, A6.10 degree polynomial, Milne 10.21 example, charpoly Checks | `ℤ[i]`; `(X−1)²` vs `(X−1)(X−1−ℓ)`; `P_{[n]}`, `P_0` | correct |
| A6.14 `Tr(α^†α) = 2g (D^{g−1}·α^*D)/(D^g)` | rederived from `deg(n + α^†α)` and `χ(nD + α^*D)²` | correct |
| A6.18(2) level rigidity | supersingular `y² + y = x³` over `𝔽̄₂`, `n = 4` | **fixed**: the group-scheme form holds for every `n ≥ 3` (A3.4 and the eigenvalue argument). The points form needs `n` prime to the characteristic. The example now says so: `deg(α − 1) = 3`, while an endomorphism killing `E[4]` has degree divisible by `16`. It also records that Milne states (2) on points for every `n ≥ 3` |
| A6.19, A6.34, Worked examples | `2λ₀` on `E²`; sum–difference degree `2^{2g}`; positive unimodular binary forms | correct |

## 7. Suggested.lean

- `lean-check` at the pins (Mathlib 082e2d37e8, Tau Ceti f790474) was run before and after the edits. Both runs
  exit 0, with 41 `declaration uses 'sorry'` warnings and no other warnings or errors.
- The file has 534 lines. It has no sorry'd data, no `True` or `Prop := sorry`, no `#eval`, `#print` or `#synth`,
  and no process comments.
- Changes:
  - `RiemannForm` removed (§5).
  - `IsAbelianIsogeny` now has Tau Ceti's condition.
  - Three discriminating `example`s added: `IsAbelianIsogeny (𝟙 _)`, proved with no `sorry`; a zero-dimensional
    abelian variety is not `IsSimple`, proved with no `sorry`; and `[n]` on the identity abelian scheme is an
    isomorphism, a `sorry` statement.
  - Lines wrapped at 100 characters.
  - The closing comment now lists every README target not typed: the Riemann-form API, `fieldAndEllipticBoundary`,
    `relativeProductsAndDimension`, `polarizationType` (2)–(3), `graphBundle_spec` and `AbelianNS.tensorQ`.
- Name alignment (script): every Lean declaration is named in the README, and every closing-comment name is a README
  target. The README now says which Lean declaration states which target (A1.1, A1.2, A3.1, A3.2, A3.4, A5.4, A5.8,
  A6.3, A6.4, A6.9). It also renames two API items to the declared names: `toAbelianVariety_ofAbelianVariety` and
  `deg_dimension_zero`.
- Ten signatures were checked against the README statements: `mulBy_isAbelianIsogeny`, `deg_mulBy` (`0⁰ = 1`),
  `deg_comp`, `exists_charpoly`, both charpoly `example`s, `degree_polynomial`, `eq_one_of_root_of_unity`,
  `alternating_elementaryDivisors` and `siegelAction_mem`. All have their hypotheses and none is vacuous.

## 8. Own words and process

A 9-word shingle comparison of the README against all downloaded source texts finds only titles and stock phrases.
There are no packet names, job ids, review or coverage language, or local paths.
`python3 research/blueprint/intake.py check-files` on the three package files reports 0 problems.

## Notes for the maintainer

These are not defects of this package.

- The AlgebraicModuli package README, in its `picard_zero_criterion` paragraph, says the algebraic-space extension is
  in §7.8. It is in §7.9 (`spaceSectionComponentCriterion`).
- ModularCurves (upstream) names `P ↦ O([P] − [0])` the canonical principal polarisation. Under Mumford's convention
  that map is `−φ_{O(0)}`, which is not a polarization. This roadmap records the sign at A0.2.
