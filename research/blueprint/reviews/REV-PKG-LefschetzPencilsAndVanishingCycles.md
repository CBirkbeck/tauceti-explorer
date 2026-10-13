# Independent package review: LefschetzPencilsAndVanishingCycles

**Verdict:** accepted after corrections.
**Reviewer:** independent-review-REV-PKG-LefschetzPencilsAndVanishingCycles.
**Agent:** Claude (Claude Code, Opus), session claude-mwTwaI; issue #9223.
**Date:** 2026-10-13.

This review checks the package `research/blueprint/packages/LefschetzPencilsAndVanishingCycles/`
(README.md, Suggested.lean, metadata.toml) against the accepted plan
(`LefschetzPencilsAndVanishingCycles--LPV.0.json`, 89 nodes; `LefschetzPencilsAndVanishingCycles--LPV.7.json`,
36 nodes), PACKAGE_REVIEW.md, PROTOCOL.md §§5, 13 and 20 and UPSTREAM_GUIDE.md. The package was written
by a different worker (Claude session claude-4Kwi73). I read the whole README and Suggested.lean, the
package handoff, and the two packets; retrieval of source passages was delegated to Haiku helpers and
every locator they returned was read by me in the source.

## Required checks

| Check | Result |
| --- | --- |
| 1. Upstream form | Pass. Summary, scope and ownership, conventions, exact supplier contracts, build table, nine layers in prose with `**Checks.**` lists, examples and dependencies per layer, downstream consumers and references. Two supplier headings used programme jargon ("roadmaps of this bundle", "lower-tier roadmaps") and one sentence spoke of "the atlas's interface"; reworded. |
| 2. Fidelity to the plan | Pass. All 125 nodes are placed. A script found every API and unit-test name of both packets in the README except the deliberate, documented changes of the package handoff: the unipotent logarithm (now imported from ArithmeticGaloisRepresentations §2.4) and the six renamed arithmetic-model tests. The moves (middle-degree reduction to 5.5, isolated singularities to 6.6, conditional forms of 7b) are mathematically sound; see the adversarial pass. |
| 3. Own words, locators | Pass. No source passage or section-by-section summary. 24 groups of locators checked in the sources (below); three corrected. |
| 4. No process | Pass after the three rewordings of item 1. No packet names, job ids, reviews or coverage statuses. |
| 5. Suggested.lean | Pass. `lean-check` exit 0 before and after the review (22, then 24 `declaration uses 'sorry'` warnings and the two `#check` outputs, nothing else). 340 lines; only light real-bodied definitions over carriers at the pins, statable theorems and `example`s; `scripts/check_sorry_data.py` reports nothing. Every Lean declaration is named in the README. |
| 6. metadata.toml | Pass. The single line `topic = "math.AG"`. |
| intake | `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems. |

## Sources checked

Public sources were fetched into the scratch directory (Numdam, IAS, author pages, arXiv, Stacks);
Huber 1996, Schneider 2011 and Liu–Tian–Xiao–Zhang–Zhu 2022 were read in the cleared library.

| Locator in README | Result |
| --- | --- |
| Weil I (4.1)–(4.4), pp. 287–289 | correct |
| Weil I (5.1), (5.3)–(5.13), pp. 289–294 | correct |
| Weil I §7.1, p. 299 (finite extension of `𝔽_q`) | correct |
| Weil I (7.1.2)–(7.1.5), p. 300, and the claim that (7.1.5) prints the twist `(n − m)` while the eigenvalue `q^{d/2}` belongs to `ℚ_ℓ(m − n)` | correct (read on the page image) |
| Weil II 1.6.1–1.6.14, 1.7.2, 1.7.8–1.7.10, pp. 165–174 | correct |
| Weil II §3.6 intro p. 212, 3.6.1–3.6.4, pp. 213–215 | correct |
| Weil II 4.2.1–4.2.3 cited as pp. 220–221 (2.7, characteristic two) | **corrected** to pp. 219–220 |
| Weil II 4.2.3–4.2.8, 4.3.6–4.3.10, 4.4.1–4.4.9, 4.5.1–4.5.4, pp. 220–233 | correct |
| Weil II 6.2.3, 6.2.6–6.2.12, pp. 247–250, including the support bound of 6.2.11 | correct; "Théorèmes 6.2.6–6.2.9" reworded to "Proposition 6.2.6 and Théorème 6.2.9" |
| SGA 7 XII 1.1–1.2, pp. 2–3, and the two printing slips the README records (`card(A) = 2`, upper limit `m − 1`) | correct |
| SGA 7 XIII 1.4.3 and (1.4.3.1)–(1.4.3.4), p. 17 | correct |
| SGA 7 XV "Lemme 2.7.8" (= 2.1.8), p. 17, and (2.2.5.9) with `D(σ)`, p. 21 | correct |
| Illusie 1994, 1.1–1.5, pp. 11–13; 4.1–Variante 4.4, pp. 44–47; Corollaires 4.5–4.6, p. 47; the perverse t-structure over a trait, p. 48 | correct |
| Illusie 1994 errata (sign `1 − T`, p. 37) and Illusie 2002 erratum (`|i| > 1`, p. 251, l. 18) | correct |
| Illusie 2021 §1.1 p. 85, §6.1 p. 103, §6.2 p. 104, §6.3 and (6.2)–(6.4) pp. 104–105 | correct; §6.1 describes the algebraic proof through Rapoport–Zink's `N`, and the explicit blow-up model in 2.7 is the package's own derivation, which I checked |
| Illusie 2006 §1.1(b), §§2.1–2.3, (2.2.3), (2.3.4) | correct |
| Haines–Ngô §3.1, Lemma 8, Corollary 9, cited as pp. 127–128 | **corrected** to pp. 126–127 |
| Saito 2003 manuscript: Propositions 1.1.1–1.1.2, Corollary 1.1.3, Lemma 2.2.1, Corollaries 2.2.2 and 2.2.4, Proposition 2.2.3, Lemma 2.2.5, Proposition 2.2.6 | all present with the stated content |
| Riou (ILO XVI), Théorème 3.1.1, Corollaires 3.1.2–3.1.3, §3.7 | correct, including the ample-sheaf hypothesis of 3.1.2 |
| Stacks 09ED, 09EE, 0BU4, 0BU5, 0BU8, 0EYG | correct |
| Stacks 0BU7 for `t_ℓ|_{I'} = e·t'_ℓ` | 0BU7 is the compatibility in towers, not the restriction formula itself; the formula is now derived in the text from the Kummer description (`π = uπ'^e`), with 0BU7 cited for the towers |
| Huber 1996, 3.5.12–3.5.13 p. 207, proof pp. 208–209, Corollaries 3.5.16–3.5.17 p. 210 (flagged by the author) | correct |
| Schneider 2011, 18.10 p. 144, Exercise 26.2 p. 181, Theorem 27.1 p. 192, Proposition 29.2 p. 202, Corollaries 29.4–29.6 p. 205 (flagged by the author) | correct |
| Liu–Tian–Xiao–Zhang–Zhu, Construction 5.9.1 p. 231, Lemma 5.9.3 p. 233 | correct |

Locators the author left at section level (Jouanolou Théorème 6.3; SGA 1 XIII 2.12; SGA 4 VI §5 and VII §5;
Elkik through SGA 7 XV 1.1.4) were not reopened; each is backed by a checked locator in the same place
(SGA 7 XVIII 6.1.6.1 for Bertini, Weil I (5.8) for the tame presentation).

## Adversarial mathematics pass

| Statement | Instances tried | Outcome |
| --- | --- | --- |
| 5.10, finite orthogonal monodromy is a Weyl group: `a = Tr(s_δ s_{δ'}) − dim E + 2 = (δ, δ')²` | `δ' = δ` (trace `dim E`, `(δ,δ)² = 4`); `A₂` pair, `(δ,δ') = −1`, trace `−1`; orthogonal pair | **False as printed.** `Tr(s_δ s_{δ'}) = dim E − 4 + (δ,δ')²`. The README copied a misprint of Weil II p. 230 (checked on the page image), which the packet node `LPV.5/finite-orthogonal-ade` also carries. Corrected to `+ 4` with a derivation, a note on the misprint, a new Check, and a Lean `example` (trace `−1` for the `A₂` pair). |
| 1.2, equivariance `ρ(g)Nρ(g)⁻¹ = χ_ℓ(g)N`, `NF = qFN` for geometric Frobenius; two-block check | Frobenius eigenvalues `a`, `qa` | correct |
| 1.2, change of generator of `ℤ_ℓ(1)` | `ζ ↦ uζ` | direction was ambiguous ("rescales by `u⁻¹`"): the matrix of `N` scales by `u`, the coordinate of `t_ℓ(σ)` by `u⁻¹`. Stated explicitly; the parallel sentence of 7a.5 ("rescales `log T`") corrected |
| 1.3–1.4, kernel–image formula, strictness, primitive decomposition, `𝔰𝔩₂` formula `X(N^a u) = a(j − a + 1)N^{a−1}u` | `N = 0`; blocks of sizes 2 and 3; inclusion of a trivial line into `ker N` | correct |
| 1.5, relative monodromy filtration | weights 0 and 1 (no `M`); weights 0 and 2 (`M = W`) | correct; the second instance added as a third Check |
| 1.7, normalized `var` | odd quadratic point (`can ∘ Var = 0`) | the Check "`T = 1 + U`, `U² = 0`" did not force the polynomial factor to be one; replaced by the exact condition, and a σ-independence Check added |
| 1.9 and 7a.7, graded nearby complex `gr_r = ⊕_{p−q=r} a_{p+q,*}ℚ_ℓ(−p)[−p−q]` | two components | agrees with Saito/Rapoport–Zink after the reindexing `p = r + k`, `q = k` |
| 1.10, semisimple trace | trivial line, unipotent block, quadratic character, shift | correct |
| 2.1, ordinary quadratic forms vs Mathlib's `QuadraticMap.Nondegenerate` (radical zero and polar kernel of rank at most one) | `xy + z²`, `x² + y²` in characteristic two; `x² + sy²` over `𝔽₂(s)` | correct; the definition is the right characteristic-free one |
| 2.1, normal form `f = −Q(f')e + f'` | — | correct |
| 2.2, even Clifford centre | hyperbolic plane (`fe` idempotent), `x² − dy²` (`(e₁e₂)² = d`) | correct |
| 2.3, cohomology of quadrics and affine quadrics; `Tr(δ²) = (−1)^m·2` | `n = 0, 1, 2`; point counts `(1+q)²`, `1+q²` | correct |
| 2.6–2.8, variation in the even case `(−1)^m((ε−1)/2)(a,δ)δ`; Picard–Lefschetz sign table; specialization sequence twists | `n = 0, 1, 2, 3`; nodal curve of genus `g` (separating and nonseparating node) | correct |
| 2.6, uniqueness of `±δ` only for prime-power `k` | `k = 15`, `u = 4`; `19² ≡ 1 mod 60` | correct |
| 2.7, odd Picard–Lefschetz proof model (`t = s²`, blow-up of the vertex) | — | the special fibre is reduced with two smooth components meeting in a smooth quadric of dimension `n − 1`; correct |
| 3.1–3.2, Lefschetz pencils and dual varieties | quadric surface (`χ = 6`), cubic surface (`|S| = 12`, `χ = 12`), Hermitian curve expansion, conic in characteristic two | correct |
| 4.3–4.4, fixed space of local transvections, radical quotient | dot product reflection, symplectic `ℚ⁴` with `E = span(e₀,e₁,e₂)` | correct |
| 5.1, Frattini argument for Bertini | — | correct (`H₂` is characteristic in `H₁`, hence normal in `H`) |
| 5.5, middle-degree reduction (both cases) | — | correct; the long exact sequences give exactly the stated injections and surjections |
| 5.6, `N(δ) = ψ(·,δ)δ` | dimension two; scaling `δ ↦ cδ`; symmetric form | correct; a Check added for the quadratic dependence on `δ` and skew-adjointness |
| 5.8, Kazhdan–Margulis; plane-cubic pencil | — | correct |
| 5.11, integral failure | `ℓη` in place of `η` | Check made precise ("classes killed by `ℓ`") |
| 6.2, perverse t-structure over a trait | `Λ_X[d+1]` vs `Λ_X[d]`; `Λ_S[1]`, `Rj_*Λ_η[1]`; the closed point `πx = 1` of `𝔸¹_S` | correct; the definition had no Checks list, now has one with these three instances |
| 6.6, isolated singularities | `y² = π` | correct |
| 7a.1–7a.6, nodal curves | tree, loop, parallel edges; `I₂` model `y² = x³ + x² + π²` (`v(Δ) = 2`, `c₄ = 16`, split node `uv = π²`); thickness 2 under ramification 3 | correct |
| 7a.8, weight spectral sequence `E₁^{p,q}` | curves | correct |
| 7b.5, spectral separation lemma (Lean `surjective_of_disjoint_spectra`) | the three Checks | correct, and true without any action on `L` |
| 7b.9, support bound `dim Supp ℋ^j(DK[−2n−2]) ≤ n + 1 − j` and its equivalent form | constant sheaf on a smooth `(n+1)`-fold | correct, matches Weil II 6.2.11 |
| 7b.4, upper term `H^{2d−i−1}(X_s)^∨(−d)` and the weight bounds of Weil II 3.6.2–3.6.3 | — | correct |

## Duplication against current Tau Ceti and TauCetiRoadmap

Searched current TauCetiRoadmap main (3d446cf, all roadmaps including the nine newer ones and
`Completed/`) and the current Tau Ceti library (a91d3aaf) by object: nearby and vanishing cycles,
Lefschetz pencils, Picard–Lefschetz, monodromy filtration, quadrics and ordinary quadratic points, the
even Clifford centre, local transvections, semisimple trace, weight spectral sequence, perverse sheaves,
dual varieties, Kazhdan–Margulis, invariant cycles, henselian traits, absolute purity, maximal unipotence,
tame characters. Nothing is duplicated, so no target was removed. Two contacts:
- OrthogonalSpinGroups identifies the centre of the even Clifford algebra in dimensions four and six
  over fields of characteristic not two. 2.2 states it for every even rank over any base, characteristic
  two included; the Scope section now says so in one clause.
- Tau Ceti's `inertiaTameCharacter` and `MixedHodgeStructure` exist at a91d3aaf as the README states; 0.1
  compares with the former and 7b.6 uses the latter.

## Gaps and tiers

Every roadmap the README cites as a prerequisite is in a lower tier of
`research/blueprint/upstream/CaraianiNewton.md` (SchemeAndStackFoundations, EnhancedDerivedSheaves,
AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, InverseGaloisAndArithmeticFundamentalGroups,
AbelianSchemesAndArithmeticModuli, ArithmeticGaloisRepresentations, ArithmeticGaloisDuality,
NeronModelsAndSemistableAbelianVarieties), in its own tier-10 group (EtaleDualityAndPerverseSheaves,
ClassicalAdicEtaleCohomology), or a TauCetiRoadmap roadmap. Higher-tier roadmaps (DeligneWeightsAndPurity,
CohomologyComparisons, IgusaVarietiesAndTorsionConcentration, WeightsInEtaleCohomology and others) occur
only as boundaries or downstream consumers. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` id remains.
Every definition now has at least three discriminating Checks; the empty Checks heading after the
anticommutative boundary lemma of 2.5 was removed.

## Corrections made

README:
1. 5.10: the trace identity `Tr(s_δ s_{δ'}) = dim E − 4 + (δ, δ')²`, with its derivation, the note on the
   Weil II p. 230 misprint, and a new Check (`δ' = δ`; `A₂` pair).
2. 1.2 and 7a.5: the effect of changing the generator of `ℤ_ℓ(1)` stated with its direction.
3. 0.1: `tameCharacter_restrict` derived from the Kummer description; the role of Stacks 0BU7 stated.
4. 1.5, 1.7, 5.6, 6.2: new discriminating Checks (relative filtration in weights 0 and 2; `var` when
   `can ∘ Var = 0` and its independence of `σ`; `N(cδ) = c²N(δ)` and skew-adjointness; a Checks list for the
   perverse t-structure over a trait).
5. Locators: Weil II 4.2.1–4.2.3 pp. 219–220; Haines–Ngô pp. 126–127; Weil II 6.2.6/6.2.9 labels.
6. Small fixes: trait written `Spec R` throughout 0.1 and 0.5; `cl` for `cℓ`; the Hensel check of the
   Tougeron theorem (`N = c = 1`, residue condition modulo `𝔞`); "zero module"; "the simplicity hypothesis";
   a garbled Check in 6.2; the integral-failure Check of 5.11; "State it as" for the fixed-space lemma;
   empty Checks heading in 2.5 removed; supplier headings and one sentence without programme jargon;
   OrthogonalSpinGroups boundary clause in Scope.

Suggested.lean:
7. Added the diagonal case `quadraticSeries (proj 0 0) = X 0 ^ 2` (the docstring claimed it, nothing tested it).
8. Added the `A₂` trace example for `localTransvection`, the Lean witness of item 1.

## For the maintainer and later jobs

- The misprint of Weil II p. 230 (`dim Ev(Y) − 2` for `dim Ev(Y) − 4`) is also in the proof steps of the
  packet node `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`; packets were not edited
  here. It is a candidate for an errata record (PROTOCOL §18) together with the slips already recorded
  in the README (SGA 7 XII 1.1 and 1.2, XV 2.1.8 and 2.2.5.9, Weil I (7.1.5), SGA 7 XV 2.2.6).
- The package handoff's notes for DeligneWeightsAndPurity (E44 should import the conditional theorems
  7b.5, 7b.8, 7b.11), EtaleDualityAndPerverseSheaves (cite 0.10 for absolute purity and 6.2 for the trait
  perversity) and IgusaVarietiesAndTorsionConcentration (instantiate the tower criterion of 6.5) stand.
