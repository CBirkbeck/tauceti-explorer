# Independent package review: ArithmeticLocallySymmetricSpaces (revision round 2)

Verdict: **accepted**, with the corrections below applied in place. Job
`REV-PKG-ArithmeticLocallySymmetricSpaces~2`, issue #9201. Reviewer: Claude (Opus 5.5), session
`claude-lbmDqz`, 2026-10-13. The package was written by `codex-4S61wT` (PKG) and rewritten by
`claude-8fRHWi` (PKG~2); the first review was by `codex-jDhOOy`. This reviewer did none of those
jobs.

Inputs: `research/blueprint/packages/ArithmeticLocallySymmetricSpaces/{README.md, Suggested.lean,
metadata.toml}`, the accepted packet `research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json`,
the first review report and `review.json`, the PKG~2 handoff, TauCetiRoadmap main at `0d144d0`,
Tau Ceti at the pin `f790474` and current Tau Ceti `a91d3aaf`.

## The six checks

| Check | Result | Evidence |
| --- | --- | --- |
| 1. Upstream form | Pass | `# Roadmap:` title and `**Summary.**`, a layer table, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers of `### ALS.k.n` prose subsections, each layer ending in Examples and Dependencies, then Downstream consumers and References. No field lists or target numbering. Compared with AdelicAlgebraicGroups and SmoothRepresentationsOfLocalGroups. |
| 2. Fidelity to the plan | Pass after fixes | All 66 packet anchors, 132 API names and 88 test names are present (script). Every definition has at least three Checks; theorems have two or more. The ten new targets of PKG~2 close the interfaces the first review asked for. Supplier claims were corrected where the cited layer does not supply the item (below). |
| 3. Own words, locators | Pass after fixes | A 9-word-shingle scan against eleven extracted sources finds only reference titles and stock phrases. Locators were checked against the sources; three were wrong and are fixed. |
| 4. No process | Pass | No packet names, job ids, review or checkpoint language in README or Lean (scan). |
| 5. Suggested.lean | Pass | `lean-check`: exit 0, 35 warnings, all `declaration uses 'sorry'`. 484 lines. `scripts/check_sorry_data.py` passes. Light real-bodied definitions over pinned carriers, milestones and examples only; no theory developed. All 29 declarations are named in the README. |
| 6. metadata.toml | Pass | `topic = "math.NT"`, a fitting category. |

## The first review's findings

- **F1 (most targets have no Lean declaration).** Superseded by the 2026-10-12 shape rule. A
  statement whose carriers are not at the pins is a README target with its exact hypotheses. The
  closing comment of `Suggested.lean` lists them by missing carrier. The Lean file now holds no
  sorry'd data.
- **F2 (geometric and supported interfaces).** Closed by the PKG~2 targets:
  - ALS.0.2: real points and the Lie-theoretic Cartan datum, with the left-to-right quotient
    conversion;
  - ALS.1.3: refinement independence and free descent;
  - ALS.1.4: the local-coefficient sheaf–singular comparison, with Tau Ceti's cochain variance;
  - ALS.3.2 and ALS.3.4: the Hecke complex as a strict object;
  - ALS.3.7: the Mackey formula.
  I checked each against its sources (NT16 §§2.2–2.3, ACC+ §2.1.2, CN23 §2.1.2).
- **F3 (qualifications).** Kept throughout. ALS.4.5 descends Kostant's theorem to a splitting field.
  Verdier duality (ALS.5a.2) rests on AlgebraicTopology Stage 6 on the Douady–Hérault manifold with
  boundary.
- **F4 (downward moves).**
  - AdditiveCombinatorics: closed by ALS.2.6–2.8. The README no longer cites it.
  - AutomorphicSpectralTheory: the Eisenstein-free part, Borel's moderate-growth comparison, moved
    down as ALS.5b.3. Franke's theorem and the Franke–Schwermer description enter as the explicit
    hypothesis `FrankeInput`.
  - AutomorphicGaloisRepresentationsPartII: the characteristic-zero Galois representations enter as
    `GaloisInput`.

  Both roadmaps sit above this one and are built on it (AutomorphicSpectralTheory at tier 13), so
  moving them down would create cycles. Conditional end theorems are legitimate targets. I accept
  this resolution.

## Corrections made

README:

1. **Neatness convention.** The Conventions paragraph said that AdelicAlgebraicGroups'
   `Neat.IsNeatLevel` is "distinguished from neatness imposed through a faithful representation of
   `G` over `F`". AA §4.3 defines exactly that notion: one faithful `F`-representation, rational
   intersections. It calls it weaker than neatness in `(Res_{F/ℚ} G)(ℚ)`. NT16 §3.1, p. 41, and
   ACC+ §2.1.1, p. 910, use the same `F`-notion.
   - Rewritten to state this correctly.
   - Recorded that neatness does not give orientability. ALS.0.13 (`PGL_2/ℚ`) and the `ℚ(√5)` check
     of ALS.0.12 are counterexamples.
   - So NT16's remark after its definition (p. 41) that neat arithmetic groups preserve orientation
     needs `G(F_∞)` connected.
   - ALS.0.13's locator now says the example qualifies that remark.
2. **Wrong locators.**
   - Milne, Example 1.17(d) (p. 15) was cited in ALS.0.3 for maximal compactness of `K_θ`. It says
     nothing about that, so I removed it; NT16 and BS73 remain.
   - Milne, Example 1.17(b) was cited for the nonorientable `PGL_2` example (ALS.0.13). It is about
     transpose-inverse on `GL(V)`, so I removed it and added Example 1.17(a)–(c) to ALS.0.1, where
     it belongs.
   - CGH20 page ranges: §3.1 is pp. 4–6 and Theorem 3.2 with its proof is pp. 5–6, not 4–7 and 5–7.
3. **Supplier that is not a layer target.** GeometricTopology was cited for "the smooth
   triangulation theorem". That theorem is only item 1 of GeometricTopology's far-horizon
   smoothing-and-triangulation section, not a Layer 11 target.
   - Triangulability of the rounded compact manifold with boundary is now an explicit input. It
     appears under *Inputs taken as hypotheses*, in ALS.2.4's assumptions and in its Needs.
   - The scope paragraph and the supplier contract say this.
4. **Duplication with current upstream and Tau Ceti** (cited instead, with the difference stated):
   - ALS.3.1: the comparison `𝕋(G, U) ≅ H(G, U)` and the action on `V^U` with traces are
     SmoothRepresentationsOfLocalGroups SR.1.2 (`hecke-ring-comparison`,
     `HeckeAlgebraLevel.exists_ringEquiv_heckeRing`, `permutation-hecke-algebra`). SR.1.2 acts on the
     right, so its `[UgU]` is the left action of `[Ug⁻¹U]` here. ALS keeps abstract Hecke pairs,
     monoids and the derived functor.
   - ALS.4.2: the positive-monoid formula `S([UmU]) = |δ_P(m)|⁻¹[U_M m U_M]` is SR.1.4
     `positive-hecke-homomorphism` (3). The general `r_P`, `r_M` of NT16 Lemmas 2.4 and 2.7 are not
     in SR and stay here.
   - ALS.3.10: the smooth set-up's derived invariants are SR.0d.2 `derived-invariants`.
   - ALS.0.10: the Iwahori and pro-`v` Iwahori subgroups are ReductiveGroupsPartII's
     `LevelSubgroups.iwahori` and `proPIwahori` (inside `GL_n(K)`, with index check
     `iwahori_relIndex_two`). ALS keeps them inside `GL_n(O_v)` as the case `I = 𝔪` of its
     congruence subgroups modulo any ideal.
   - ALS.0.6, ALS.0.7 and the Layer ALS.0 Examples: the `GL_1`, `GL_2/ℚ` and definite-quaternion
     computations are AdelicAlgebraicGroups §§5.1–5.3 (`AdelicExamples.GL2.exists_componentHomeomorph`
     and the `O(2)` component count). They are now cited from those Checks and in the supplier
     contract.
   - ALS.0.9: the `K(Γ_i, 1)` clause is Tau Ceti's
     `IsQuotientCoveringMap.isEilenbergMacLaneSpaceOne_realTopologicalVectorSpace`, which is at the
     pin.
   - Current library, newer than the pin:
     - ALS.3.6 (trace at non-neat level): `TauCeti.groupCohomology.corestriction` with
       `map_subtype_id_comp_corestriction`;
     - ALS.6.3 (its key step): `Representation.invariants_ne_bot_of_forall_pow_eq_one`;
     - ALS.3.12 (`twistCoefficients` at the inverse character): `Representation.charTwist`.

   No target needed deletion. In each case the README keeps a variant and states in one clause how
   it differs from the cited item.
5. **False or empty Checks.**
   - ALS.5b.6 claimed that the L-algebraic `π` of a weight-two form has half-integral exponents. It
     has integral exponents; C-algebraic for `n = 2` means exponents in `1/2 + ℤ`. Corrected.
   - ALS.3.9's non-multiplicativity test compared `T_p(1·1)` with `T_p(1)`, which proves nothing. It
     now compares with `T_p(1)²`.
   - ALS.3.8 and the Examples: `T_p² = T_{p²} + (p + 1)S_p` holds with `T_{p²}` the single double
     coset `[K diag(p², 1) K]`. With Shimura's sum over all double cosets of determinant `p²` the
     coefficient is `p`; both are now stated.
   - ALS.4.3: a Check referred to a nonexistent "(ii)". Rewritten as "if `K_{N,S}` acts trivially on
     `B`, take `A = B`".
   - ALS.3.11: "image `O[C]`, not a product of copies of `O`" became "need not be".
   - ALS.0.4: "anisotropic unit group of a definite quaternion algebra" became "anisotropic modulo
     its centre".
   - ALS.5b.5: a residual sentence about Saito–Kurokawa lifts was removed.
6. **ALS.6.3.** "CG20" was a typo. More importantly, CGH20's proof of Theorem 3.2 applies
   Hochschild–Serre to `Y_1(Q) → Y_0(Q)`. By CG18 §9.0.1 the group of that cover is all of
   `Δ_Q = ∏ k_x^×`, not a `p`-group. The lowest-degree argument is therefore valid as written only
   for `Y_Δ(Q)`, the maximal `p`-power quotient; the README now says so explicitly.
7. **Supplier wording.**
   - SchemeAndStackFoundations SF.2: its package has equivariant supports and the non-equivariant
     localization triangle. The equivariant sequence is the derived functor of the equivariant
     open–closed sequence, and the README now says that.
   - IntegralHeckeAndGaloisDeterminants: determinants are Layer 0, and semisimple reconstruction is
     §1.2 of Layer 1.
   - Reference titles were escaped (`\*…\*`) and rendered with literal asterisks. They are now
     italic.

Suggested.lean:

- Added `geodesicActionSL2_vadd`, the commutation with `N_B(ℝ)` that the docstring of
  `geodesicActionSL2_add` promised but did not state; that docstring is corrected.
- Added a pinned `#check` of the `K(G, 1)` lemma, with its import.
- Docstrings of `iwahori`, `iwahoriOne` and `iwahori_index_GL2` now cite ReductiveGroupsPartII;
  `twistCoefficients` cites `charTwist`.

## Adversarial mathematics pass

| Statement | Instance tried | Outcome |
| --- | --- | --- |
| Orientation character `sign(N det)^{m−1}` (ALS.0.12) | `GL_m(ℝ)` acting on `Sym_m/ℝ_{>0}`: determinant `det(g)^{m+1}`; complex places connected; extra `ℝ` factor at a real quadratic field | holds |
| `ℚ(√5)` regression | `u = 682 + 305√5`, `N(u) = −1`; `u ≡ 1` at `(11, √5 − 7)` and `(31, √5 − 6)` | holds; `γ` is F-neat (Pink intersection) but not Res-neat (`uu′ = −1`); `ε(γ) = −1` |
| Nonorientable neat `PGL_2/ℚ` (ALS.0.13) | `(57, 455; 455, 3632)`: det −1, `≡ 57·I mod 65`, `57² ≡ −1`; adjoint eigenvalues `−λ², 1, −λ⁻²` | holds; contradicts NT16 p. 41's orientation remark, now recorded |
| Pro-`3` Iwahori element (ALS.0.11) | `(1,1;−3,−2)`: trace −1, det 1, `≡ (1 1; 0 1) mod 3` | order 3; ACC+ Lemma 6.5.2 matches |
| Iwahori indices; `Γ_p` vs `Γ_1` | `p + 1`; `(q − 1)^n`; `q = 7` and `q = 5` with `p = 3` | 3 and 1 |
| Projective `Γ_1` at `2^c` | `a = 3 mod 8` | `a² ≡ 1`; the `±Γ₁` claim fails, as stated |
| Stabilizer of `i` (Lean) | Mathlib `glAction`: `g•z = σ_g(num/denom)`; det < 0 branch gives `(a, b; b, −a)` | `ℝ_{>0}O(2)`, order 8 in `GL_2(ℤ)` |
| Projected discreteness (ALS.0.5) | `{2^n R_{nα}}` | discrete, meets `A_∞` trivially, image dense in `SO(2)` |
| Components at `K(N)` (ALS.0.7) | `ℚ^×\𝔸_f^×/det K(N)` | `(ℤ/N)^×/±1`, `φ(N)/2`; agrees with AA §5.2 |
| Right translation law (ALS.1.8) | `r_g ∘ r_h = r_{hg}` | holds; `r_h^* r_g^* = r_{hg}^*` |
| `H^*(SL_2(ℤ), ℤ)`; `ℤ[1/6]` | degrees 1, 2, 4 | `0`, `ℤ/12`, `ℤ/12`; trivial over `ℤ[1/6]` |
| Genus and cusps | `Γ_1(5)`: 0 and 4; `Γ(9)`: index 324, 36 cusps, genus 10; `X(7)`: 3 and 24 | `H¹` ranks 3, 55 per component, 29 |
| Stratification spectral sequence (ALS.2.9) | exact couple bidegrees | `d_r: (−r, r + 1)`; reindexing gives `(r, 1 − r)` |
| Satake for `GL_2` (ALS.4.2) | `∫_N 1_{K diag(p,1) K}(tn) dn` with `vol N(ℤ_p) = 1` | `p[diag(p,1)] + [diag(1,p)]`; `δ^{1/2}S = p^{1/2}(…)` |
| Kostant for `GL_2` (ALS.4.5) | `λ = (k, 0)`, `ρ = (½, −½)` | `s·λ = (−1, k + 1)`; matches `H¹` weight `(0, k) + (−1, 1)` |
| Hecke structure constants (ALS.3.2, 3.8) | `S₃ ⊃ ⟨(12)⟩`; `[KgK][Kg⁻¹K]`; `T_p²` | rank 2; coefficient `[K : K ∩ gKg⁻¹]`; coefficients 1 and `p + 1` |
| Hecke adjoint (ALS.5a.4) | `diag(ϖ, 1)⁻¹ = ϖ⁻¹ diag(1, ϖ)` | `T^i ↔ T^{n−i}(T^n)⁻¹`; NT16 Lemma 4.1 proof agrees |
| Galois-type polynomial (ALS.4.10) | constant eigensystem `T¹ = 1 + q`, `T² = 1` | `(X − 1)(X − q)`; NT16 (4.1) agrees |
| Old-form determinant (ALS.3.14) | `αβ ≡ 1` | `T² − (1 + N)² = −(1 − α)(1 − β)(1 + α)(1 + β)`; a unit iff `α ≠ β` (p odd) |
| UCT and duality shifts (ALS.1.7, 5a.2, 5a.5) | DVR; Dedekind; dual triangle | correct shifts; inverse rotation |
| C/L-algebraicity (ALS.5b.6) | weight-two `π_f`, `π_f|·|^{1/2}` | the Check's exponent claim was wrong; fixed |
| `q₀`, `ℓ₀` and the middle degree (ALS.5b.8–5b.9) | `n = 1, 2`; `U(n, n)` | `[1, 2]` for Bianchi; `d = n²[F⁺ : ℚ]`; ACC+ (2) p. 948 agrees |
| Lowest-degree descent (ALS.6.3) | `Δ_Q` with prime-to-`p` part | needs the `p`-part, as stated; CGH20 gap recorded |

## Source checks

All locators below were read in the source text, with printed page numbers from the page headers.

- **NT16**, published, hash matches the packet: Definition 3.1, p. 40; Lemma 3.2 and Corollary 3.3,
  p. 42; Lemmas 2.3, 2.4 and 2.7 with (2.5), pp. 12–17; Lemma 2.17, Proposition 2.18 and Lemma
  2.19, pp. 23–24; Propositions 3.4, 3.7 and 3.8, pp. 44–49; Lemmas 3.10 and 3.12, pp. 51–53;
  Lemma 4.1, Theorem 4.2, Lemmas 4.4–4.6 and Corollary 2.6, at their stated pages.
- **ACC+**, cleared author copy with Annals pagination: §2.1.1, pp. 909–910; Lemmas 2.1.4 and
  2.1.7, (2.1.3) and (2.1.5)–(2.1.6), pp. 911–912; Lemmas 2.1.10–2.1.14, pp. 913–916; Proposition
  2.2.21 to Corollary 2.2.24, pp. 932–934; Theorems 2.3.2, 2.3.3 and 2.3.8, pp. 935–939; Theorems
  2.4.2, 2.4.10 and 2.4.11, pp. 941–951; Lemma 6.5.2, p. 1062.
- **Scholze**, arXiv v2: Corollary V.4.2 with its proof, pp. 102–103. The twist `|·|^{(n+1)/2}` and
  the `X̃_K` cover match.
- **CG18**, v2: §5.2, §5.2.1 and Definition 5.5 in §5.3; Lemma 5.9, p. 59; §9.0.1, pp. 84–85;
  Lemma 9.6, p. 88.
- **CGH20**, v1, the only version: corrected as above.
- **CN23**, v3: Proposition 2.1.3, pp. 10–11; Lemmas 2.1.4 and 2.1.5, p. 11.
- **HR15**, v2: §4.2.1, (4.2), Proposition 4.3, and §4.2.3 with (4.5), pp. 25–27.
- **Franke**: Theorems 3, 4, 6 and 18, Proposition 2, (16)–(17), and §§2.2, 2.3, 7.4 and 7.6.
- **Sella**: the main theorem, p. 2. **Ji–MacPherson**: §7.3, p. 483; Proposition 7.4, p. 484.
- **Milne**: definition (9), Example 1.15, Theorem 1.16 and Example 1.17, all p. 15. Two citations
  of Example 1.17 were misapplied and are fixed.

BS73 and DH73 (e-periodica images) and NSW (1.5.6) were not re-read. The first review checked BS73
and DH73, and the PKG~2 handoff checked NSW.

## Tier and supplier check

ALS is tier 11, bundled with AutomorphicFormsOnReductiveGroups. Every cited roadmap resolves at the
stated layer. All are TauCetiRoadmap roadmaps or lower-tier atlas roadmaps, or AF of the bundle:

- SchemeAndStackFoundations, tier 2;
- EnhancedDerivedSheaves, tier 4. Its E1 nodes are planned in the accepted E0 packet;
- DeformationAndDerivedPatchingAlgebra, tier 10.

Higher roadmaps appear only as downstream consumers, or as the unnamed dischargers of `FrankeInput`
and `GaloisInput`. All Mathlib and Tau Ceti names in the supplier contracts exist at the pins.
Those marked current-library are absent at the pin, as stated.

## For the maintainer (not blocking)

- **Atlas edges.** `research/blueprint/atlas/roadmaps/ArithmeticLocallySymmetricSpaces.json` still
  lists ALS.5 as requiring AutomorphicSpectralTheory AS.5, and ALS.6 as requiring
  CompletedCohomologyPartII CC.2, CC.4 and CC.7. The package treats those as downstream. The atlas
  edges should be reversed when the follow-ups the PKG~2 handoff lists are done.
- **Source issues for an errata job.**
  - NT16 §3.1, p. 41: neat arithmetic groups need not preserve orientation. Counterexample: the
    `PGL_2/ℚ` level `K(5)K(13)` of ALS.0.13.
  - CGH20, proof of Theorem 3.2, pp. 5–6: Hochschild–Serre descent over `Y_1(Q) → Y_0(Q)`, whose
    group is not a `p`-group. It is valid for the maximal `p`-power quotient.
- **Triangulability.** It is an explicit input until GeometricTopology builds Whitehead's theorem
  (its far-horizon item 1).
- **SF.2 package.** The SchemeAndStackFoundations package README has no equivariant localization
  sequence item. The ALS wording now derives it from what SF.2 supplies.

## Checks run

- `lean-check …/Suggested.lean`: exit 0. Before the edits there were 34 sorry warnings; after them
  there are 35, all `declaration uses 'sorry'`, with no errors and no other warnings.
- `python3 scripts/check_sorry_data.py …/Suggested.lean`: pass.
- `python3 research/blueprint/intake.py check-files` on README, Suggested.lean and metadata.toml:
  0 problems.
- README against packet: 66/66 anchors, 132/132 API, 88/88 tests. All internal links resolve.
- README and Lean name alignment: all 29 declarations are named.
- Process-word scan; 9-word-shingle scan; `git diff --check`.
- Sonnet cross-checks (library names at the pins; supplier citation map with tiers; duplication
  inventory by mathematical object). Each finding was verified by reading the cited file before
  use.
