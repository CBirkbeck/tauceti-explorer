# REV-PKG-InverseGaloisAndArithmeticFundamentalGroups — fixing review

Reviewer: `independent-review-REV-PKG-InverseGaloisAndArithmeticFundamentalGroups` (Claude, session
`claude-zLY2a3`), 12 October 2026, issue #8896. The package was written by session `claude-fCZROL`
(`research/blueprint/handoff/PKG-InverseGaloisAndArithmeticFundamentalGroups.md`, PR #9288); this
reviewer did none of that job. Method: `research/blueprint/PACKAGE_REVIEW.md` (one fixing review).
Everything fixable was fixed in place in `README.md` and `Suggested.lean`; nothing blocking remains.

Verdict: **accepted** (`review.json`). With the fixes below the package is ready for the draft PR.

## What was checked

1. **Upstream form.** The README has the TauCetiRoadmap shape (compared with `AdicSpaces`,
   `LocalGaloisGroups` and `BelyiMaps` at the current TauCetiRoadmap checkout): opening `**Summary.**`,
   *Scope and ownership*, *Conventions*, *Exact supplier contracts*, *How to read the build*, Layers
   IG.0–IG.6 with `### k.n` prose subsections, `**Checks.**` lists, per-layer *Examples* and
   *Dependencies*, then *Worked examples*, *Downstream consumers* and *References*. No target tables,
   no field lists. `metadata.toml` is the single line `topic = "math.NT"`, which fits.
2. **Fidelity to the plan.** The 137 nodes of `packets/InverseGaloisAndArithmeticFundamentalGroups.json`
   were matched to the README's 146 targets by title and API names. The 33 unmatched titles are
   renamings (checked one by one) or the removals the packager recorded in its handoff (the finite
   étale site, fibre functor, `π₁^ét` and base-point nodes to ConstructibleEtale Layer 3; general
   Riemann existence and the finite-coefficient comparison to ComplexComparison Layers 8 and 10; the
   faithful dessin action to BelyiMaps 13.5). Every definition has at least three Checks (the one
   exception, *Nielsen transitivity questions*, received a third, see below).
3. **Own words.** A 9-word-shingle comparison of the README with the text of 21 of its sources found
   only titles, bibliographic strings and stock phrases ("let `T` be a complete discrete valuation
   ring with uniformizer"). No passage and no section-by-section summary.
4. **Process residue.** None (grep for packet, node ids, job, review, checkpoint, coverage, handoff,
   swarm, `UPSTREAM:`). The heading "From roadmaps of this atlas" became "From other roadmaps".
5. **Suggested.lean.** `lean-check` before the review: exit 0, 71 `declaration uses sorry` warnings,
   nothing else. After the review: exit 0, 71 `sorry` warnings, nothing else; 700 lines, sha256
   `960b7a70ef1089b2…`. Shape: real-bodied light definitions only (`galoisTensorMap`,
   `IsGaloisAlgebra`, `regularSubring`, `evalRegular`, `specialize`, `denominatorProduct`,
   `IsHilbertian`, branch tuples and Nielsen relations, Hurwitz moves through
   `TauCeti.BraidGroup.lift`, `ExteriorEpi`, `TSystem`, `IsRationalClass`, `IsRigid`,
   `HasRegularRealization`, the Schur multiplier and `U(G, c)` as a `PresentedGroup`, `fittingSubgroup`,
   configurations, `LiftedAffineGroup`, realization certificates, the inverse Galois propositions);
   the only `sorry`s inside definitions are proof fields (`iseqv`, `map_add'`, membership proofs),
   as in upstream files. End theorems statable at the pins: Hilbert irreducibility over number
   fields, rational rigidity, Shafarevich, regular ⇒ realization over `ℚ`. Ten signatures were
   checked against the README statements (`IsGaloisAlgebra`, `regularSubring`, `specialization_guard`,
   `IsHilbertian`, `IsRigid`, `hasRegularRealization_of_rigid`, `universalKernel_le_center`,
   `fittingSubgroup.frattini_lt`, `shafarevich`, `LiftedAffineGroup.nonempty_equiv_of_odd`): hypotheses
   present, none vacuous, no `True` or `Prop := sorry`. A script now confirms that every Lean
   declaration is named in the README and every README *Lean:* name is declared.
6. **Libraries.** A namespace-aware scan confirmed every Mathlib and Tau Ceti name the README cites
   at the pins (Mathlib `082e2d37e8`, Tau Ceti `f790474`), except `TopologicalGroup` (fixed to
   `IsTopologicalGroup`) and the names the README marks as current-library only.
7. **Suppliers.** Every layer citation of the TauCetiRoadmap roadmaps and of the seven sub-roadmaps of
   TauCetiRoadmap PR #196 (still open; head `4bd7237`, checked today) was traced to the layer text.
   The PR #196 citations all match. The corrections to the others are listed below. Tier rule: the
   atlas roadmaps cited are SchemeAndStackFoundations, ReductiveGroupsPartII,
   AlgebraicModuliForArithmeticGeometry, EnhancedDerivedSheaves and ComplexComparisonPartII, all
   below tier 6; the only higher names are downstream consumers.

## Fixes made

### Mathematical errors

- **Wang's obstruction, Check** (IG.4.2) and **IG.4 Examples**: the octic subfield `L` of `ℚ(ζ₁₇)`
  was said to have `L ⊗ ℚ₂ ≅ ℚ₂⁸` ("2 splits completely"). False: `2⁴ ≡ −1 (mod 17)`, so the
  decomposition group `⟨2⟩` contains `−1` and its image in `(ℤ/17)^×/{±1}` has order 4; `L ⊗ ℚ₂` is
  two copies of the unramified quartic extension. Corrected in both places (the point of the Check,
  that only the unramified *octic* completion is excluded, survives).
- **Representations and bounded lattice schemes, Check**: "a parametrisation of all submodules of
  `p^{−m}T/p^mT` would have more points" is false in rank one (both counts are `2m + 1`). Replaced by
  a true discriminating test: a parametrisation by free submodules sees only `p^{±m}ℤ_p`.
- **Integral local systems have finite monodromy, Check**: the negative control used a `ℚ_p`-system,
  which does not test the normality hypothesis. Replaced by the unipotent `ℤ²`-system with monodromy
  `[[1, 1], [0, 1]]` on the nodal rational curve (étale locally constant, infinite monodromy).
- **Hilbert pullback through norm maps, Check**: "`ℚ(√T)` splits over `ℚ̄(T)`" is false (`ℚ̄(√T)` is a
  field); now "splits over an algebraic closure of `ℚ(T)`".
- **Frattini detection, Check**: "openness of `Φ(P)` cannot be dropped" was misleading, since
  `J·Φ(P) = P ⇒ J = P` holds for every profinite `P`; reworded to say that openness is what makes the
  detecting quotient finite.
- **Degree preservation, Check** wording ("an irreducible specialization can still lose degree").
- **Central power corrections, Check**: `C₄ → C₂` is not a reduced cover; the Check now says the
  formula is applied in a marked central extension.
- **Hilbert irreducibility over number fields**: the source "Dèbes §§5.3–5.4, pp. 138–153, for the
  number-field proof" was wrong (§5.3 is the regular inverse Galois problem, §5.4 Riemann
  existence, and Dèbes proves Hilbertianity for `ℚ` only). Now Dèbes Proposition 5.2.5 (p. 137) and
  Theorem 5.2.9, the Hilbert–Dörge proof for `ℚ` (§5.2.3, pp. 140–143), plus Serre Corollaries 3.2.2
  and 3.2.4 (pp. 22–23) for the passage to number fields and to `ℙ^r`; the proof sketch says so, and
  the unjustified ClassFieldTheory prerequisite became GlobalNumberFields Layer 0.
- **Specialization with its realization data**: "Dèbes §5.3, pp. 150–153" corrected to §5.2.4,
  Proposition 5.2.14 and Remark 5.2.15, pp. 143–144 (exactly the specialization argument used).
- **Membership by reduced denominator**: the proof sketch ("unfold the definition") did not match
  the definition through the Tau Ceti valuation ring; it now uses
  `TauCeti.Place.valuation_ofIrreducible_le_one_iff` and `Polynomial.dvd_iff_isRoot`.
- **Nielsen transitivity**: Chen's Conjecture 1.1.3 is Garion's conjecture as Chen records it
  ("[Gar08, Conjecture 1]"); "Chen's conjecture" and the Lean name `ChenTransitivity` were renamed
  (`NielsenTransitivity`), and a third Check added (`C₅`, `r = 1 = d(G)`: two `Out(F₁)`-orbits, so
  the bound `r ≥ d(G) + 1` cannot be lowered).
- **`IsHilbertian` generality**: the README defined Hilbertian fields in characteristic zero while the
  Lean predicate is stated for every field; the README now says that the predicate is the separable
  Hilbert-set form, how a nonzero `g` and a finite exceptional set are encoded, and why
  `IsHilbertian.infinite_good` holds for every field satisfying it.

### Duplication against current Tau Ceti (library `a91d3aaf`, TauCetiRoadmap checkout `0d144d0`)

No target is entirely present upstream; four are partly present and now cite the existing work,
stating in one clause what they add:
- *Finite abelian-kernel obstruction and pullback*: the solvability criterion is
  `TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero` (any abelian kernel,
  surjective `π`); the target keeps the non-surjective case, the `H¹`-torsor of lifts and naturality.
- *Symmetric groups as realization certificates*: the isomorphism with `Equiv.Perm (Fin n)` is
  `Polynomial.HasFullSymmetricGaloisGroup.nonempty_mulEquiv`; the target is only the certificate.
- *Cyclic realization examples* and *A degree-eight dihedral realization*: the Galois groups are
  `TauCeti.hasGaloisLabel_X_pow_three_sub_three_mul_X_sub_one` (3T1; same splitting field as
  `Y³ − 3Y + 1`), `TauCeti.hasGaloisLabel_X_pow_four_add_X_pow_three_add_X_sq_add_X_add_one` (4T1),
  `TauCeti.hasGaloisLabel_X_pow_four_sub_two` (4T3) and `TauCeti.natCard_gal_X_pow_four_sub_two`;
  the targets keep the explicit isomorphisms (`DihedralGroup 4`, generators `r`, `s`).
- *Artin neighbourhoods are `K(π, 1)`*: asphericity is stated as `TauCeti.IsAspherical`.
The BelyiMaps statements near ours (12.4 base extension, 10.6 finiteness, 11.x fields of moduli,
12.8–12.12 the arithmetic sequence and branch cycles) are three-point or Belyi-pair statements;
ours are the general ones the packager kept, and they already cite BelyiMaps. Hilbert irreducibility,
thin sets, Lang–Weil, Poitou–Tate for finite modules, Grunwald–Wang, Fitting subgroups,
Shafarevich, Hurwitz spaces, configuration spaces, admissible covers, patching, Abhyankar, Noohi
groups and lifting invariants have no upstream owner (PolynomialGaloisGroups, ClassFieldTheory,
AlgebraicCurves and BelyiMaps exclude them explicitly).

### Supplier contracts and prerequisites

- ReductiveGroups Layer 0 is the functor-of-points layer: semisimple groups are Layer 6, quotients
  `G/H` Layer 3 (scope list, contracts, *Approximation and nonabelian localization*, IG.4 dependencies).
- LocalFieldsRamification Layer 2 has no decomposition groups: *Decomposition and inertia groups of a
  cover* now uses Mathlib's `Ideal.inertia`, `Ideal.Quotient.stabilizerHom_surjective`,
  `Ideal.Quotient.stabilizerQuotientInertiaEquiv`, `Ideal.card_inertia_eq_ramificationIdxIn`
  (added to the Mathlib table); the curve-place dictionary is AlgebraicCurves Layer 12, not 8.
- Places, completions and weak approximation are GlobalNumberFields Layers 0–1 (new supplier row),
  not ClassFieldTheory 10/12; global reciprocity is ClassFieldTheory Layer 11, now cited as 10–12.
- BelyiMaps: the triple–dessin–Belyi pair correspondence is milestones 2.4, 6.3, 8.6 and 9.8, not
  Layer 12; Layers 11–13 are retained dependency specifications whose ownership passes to that
  roadmap's successors (noted). The BelyiMaps triple convention `σinf * σ1 * σ0 = 1` was confirmed.
- ProfiniteProPGroups Layer 5 states the obstruction for elementary abelian `p`-kernels; the general
  abelian case is the current Tau Ceti theorem above.
- RepresentationTheory/InductionRestriction Layer 7 gives the Schur multiplier as `H²(G, k^×)`; the
  comparison `τ_S : M(G) = H₂(G, ℤ) ≅ ker π` for a Schur cover is now explicitly part of *Reduced
  Schur covers* (five-term sequence for a stem extension).
- PR #196: EllAdicRealization Layer 6 was missing from the contract list; "as in TraceFormula" now
  names Layer 11.

### Locators

Checked against the sources (the three items flagged by the packager and more than forty others): SGA 1 V 8.1, IX 6.1/6.4,
X 1.8, 3.6, 3.8/3.9, XII 5.1/5.2, XIII 2.4, 2.8, 2.12; Serre 3.2.2, 3.3.1, 3.3.3/3.3.4, 3.4.1, 3.4.4,
3.5.3, 3.5.7, 3.6.1, 3.6.2; Harbater–Hartmann Notation 4.3 and Theorems 4.9–4.11, 7.1 (**flagged
item resolved**: Theorem 4.9 is stated for arbitrary `U₁, U₂ ⊆ X`, as the README says); Schmidt–Stix
p. 850 (**flagged**: Fried–Jarden 16.11.6 is cited there for Hilbertian `k`); Landesman–Litt Definition
9.1.1, Theorem 9.1.2 and its proof with (9.1)–(9.2) and [And74, Proposition 3] (**flagged**; the README's
caveat on Anderson's hypotheses is appropriate), Lemma 2.3.3, Definition 7.3.1; Wood (lifting) Theorems
2.5, 3.1, 5.2, 6.1 and Remark 5.4 (the README's remark that the correction must be `φψ⁻¹`, not the printed
`φ·ψ`, is right); Wood (moments) Definition 3.1, Lemmas 3.2–3.4, 3.11, Theorems 3.13, 4.5, 4.7,
Proposition 4.4, Conjecture 5.1; Wewers Definition 1.1, Propositions 1.2, 1.5, 1.8, Theorem 1.9,
Example 1.10; McCullough–Wanderley (exceptional `q ∈ {3, 5, 7, 9, 11}`, T-classification conjecture);
Chen Conjecture 1.1.3, Question 1.4.1, Remark 4.2.4, Propositions 2.4.4–2.4.8, Theorem 2.4.9;
HOPS Conjecture 3.2, Theorems 3.6–3.13 and the `x^{−n}` remark on §3.2.1 (correct);
Schmidt–Wingberg Propositions 2, 5–7, 11, 16–17, Theorems 13–15; Liu–Wood–Zureick-Brown §2
(Definition 2.1, Proposition 2.2, Theorem 2.5, Lemmas 2.6–2.7), §§10–12; Harpaz–Wittenberg
(zero-cycles) Théorème B and its corollary, Remarque 7.11, §§4.2, 5.1, 6.1–6.4; Harpaz–Wittenberg
(Massey) Lemmas 7.6–7.7 and [AT09, Chapter Ten, Theorem 1]; Kedlaya–Liu 1.2.3, 1.4.1–1.4.12;
Bhatt–Scholze 7.2.5, 7.3.9, 7.4.1–7.4.10; Merkurjev–Scavia §1.2, 2.1, 3.2;
Demarche–Lucchini Arteche–Neftin §§2.3–2.6; Ellenberg–Venkatesh–Westerland 3.4, 6.2, 7.4, 7.6, 7.7,
(7.8.2), §8.8.

Page corrections: SGA 1 V §2 is pp. 92–96; SGA 1 XIII "Corollary 2.3(c)" is *Remarques* 2.3(a),(c),
pp. 281–282; Chen Remark 4.2.4 is pp. 45–46; Schmidt–Wingberg Theorem 13 starts on p. 14; EVW §2.1
starts on p. 738 (four page ranges fixed); Dèbes §§5.2.1–5.2.2 are pp. 135–137 (fifteen occurrences).
Wrong Mathlib file links (six to `RingTheory/Polynomial/Subring.lean`, two to `Roots.lean`, for
declarations defined elsewhere) were replaced by the declaration names. The unverifiable "rests on
a theorem of Weissauer" (Fried–Jarden is not available) was dropped; "G. Anderson" is M. P.
Anderson; the uncited references Cau and Dèbes–Douai were removed, and the second-hand citations
(Artin–Tate, Wang, Demarche, Dunwoody, Garion, Ekedahl, Ribes–Zalesskii, Wewers 1998) are listed.

### API names

README API names now match the Lean declarations (`HurwitzAction.product_action`,
`generated_action`, `action_sigma`; `schurRelations_empty`; `cyclotomicTwist_eval_bijective`), and
the *Lean:* lines name the helper declarations (`SurjectiveFreeHom`, the `relation` setoids,
`universalRelations`, `classSet`, `classAbelianization`, `NielsenClass.inner_preserves`).

## Adversarial mathematics pass

| Statement | Instances tried | Result |
| --- | --- | --- |
| Galois algebras; tensor criterion | `K^H`, `ℚ(i)`, `K × K`, zero algebra | correct (zero algebra excluded by `A ≠ 0`) |
| Integral local systems finite monodromy | constant `ℤ^r`; unipotent `ℤ²` on nodal curve | normality needed — Check replaced |
| `ℤ_p`-local systems, lattice schemes | rank one, `m = 0, 1`; two `ℙ¹` glued at two points | lattice-count Check was false — fixed |
| Noohi groups, `π₁^proét` | profinite, discrete `ℤ`, nodal curve | correct |
| Arithmetic sequence; Frobenius normalisation | `Spec k`, `𝔾_{m,ℚ}` and Kummer twist, `μ_n` with `n ∣ q − 1` | correct |
| Base-extension invariance | Artin–Schreier `y^p − y = ax`, `a ∉ k` | correct (char `p` excluded) |
| Decomposition/inertia; tame vs prime-to-`p` | `z^n`, Artin–Schreier at `∞`, ordinary elliptic curve in char `p` | correct |
| Specialization (proper; tame with boundary) | ordinary elliptic curve: pro-`p` `ℤ_p²` vs `ℤ_p`; `ℙ¹ ∖ {0,1,∞,λ}` | correct |
| Arithmetic representations | unipotent rep of `ẑ(1)`, conjugate by `diag(χ, 1)` | correct |
| Homogeneous spaces | `H = 1`, `SL₂/±1 = PGL₂`, `𝔾_m` | correct |
| Regular subring, evaluation, specialization laws | `t = 0` poles, `(T²−1)/(T−1)` at 1, `e₃(1/(T−1)) = 1/2`, sums/products at poles | correct |
| Guard and bad set | `TY + 1`, `(T² − T)Y + 1` over `𝔽₂`, `Y² − T` at 4, `p = 0` | correct |
| Hilbertian; HIT | `ℂ`, `ℝ` with `Y² − (T² + 1)`, finite fields (predicate false) | correct; sources fixed |
| Thin sets; integral count | squares (`⌊√N⌋ + 1`), `E = {1..M}`, `N = 1` | correct |
| Lang–Weil | `𝔸^d`, conic `p − (−1/p)`, `x² = 2` | correct |
| Full-group, disjoint fibres | `t = 1, 2, 3, 6, 8`; `ℚ(i)(T)` | correct |
| Frattini detection | `ℤ/4`, `ℤ_p²`, `∏ ℤ/ℓ` | statement correct; Check reworded |
| Weak approximation / local conditions | `t = 17` in `{t > 0} × (1 + 8ℤ₂)` | correct |
| Norm pullback | `z ↦ z²`; projection `𝔾_m² → 𝔾_m` at `x = 2` | Check had a false clause — fixed |
| Normal subgroups of `Γ_k` | `Γ_{ℚ(i)}`, complex conjugation, `ℝ` | correct |
| Branch tuples, Hurwitz move, conventions | `S₃`: `(12)(23) = (123)`, move gives `((13),(12))`, left vs right products | correct |
| Exterior epis, `d(G)` | `C_n`, `C₂²`, `C₂` with `r = 2`, `C₅` with `r = 1` | correct; Check added |
| Riemann–Hurwitz, rigidity, field of moduli | `(a, a⁻¹)`, `S₃` rigid triple, `C₃`, `y³ − 3y` critical values `∓2` | correct |
| Wewers `SL₂(𝔽₅)` example | lifts of `(12)(45)` order 4; `t ≷ 0` | matches the source |
| Schur commutators, `M(G, c)`, reduced covers | `C₂²` with `D₈`/`Q₈`, `c = ∅` vs `{x}` | correct |
| `U(G, c)`, degree, fibre product, kernel | `C₂` (`U = ℤ`, `K = 2ℤ`), `C₂²` (`ℤ³`), `S₃` | correct; `φψ⁻¹` sign verified in Wood |
| Coprime semidirect, admissibility | `S₃ = C₃ ⋊ C₂`, `C₆` | correct |
| Unit action, corrections, cocycle law | `C₃` with `α = 2`, `S₃` with `α = −1`; law `W_{αβ} = W_β^α · W_α(m^β)` derived | correct |
| Abelian-kernel obstruction; twisting | `C₄ → C₂`; `S₃ → C₂` sections `(12)`, `(13)` | correct |
| Poitou–Tate, Sha, real places | `A = 0`, `ℤ/2` at `ℝ`, `(−1, −1)` | correct |
| Grunwald–Wang, Wang | `x⁸ − 16` factorisation, `16` at `T = {2}`; `ℚ(ζ₁₇)` octic | Wang Check false — fixed |
| Two cyclic octic lifts | `p = 17`, `q = 41`; `(ψ, 3ψ)` | correct |
| Free operator shrinking indices | `(1,1) → (2,1) → (2,2) → (3,1)` | correct |
| Induced / split nilpotent / Shafarevich | `ℚ(i)` in no cyclic quartic; `S₃`, `S₄` | correct |
| Fitting | abelian, `S₃`, `S₄`, `S₅`, `p`-groups | correct |
| Auxiliary prescriptions (Jordan) | `C₃`, `S₃` | correct |
| Supersolvable / quaternion Grunwald | `C₈` at 2; `Q₈` subgroups | correct (HW restrict `m`; README `m ≥ 3`) |
| No unramified split-∞ extension | `𝔽_{q²}(t)`, Artin–Schreier `y^p − y = t` | correct |
| Property E | `C_{p²} → C_p`, `C₄ × C₂ → C₂` | correct |
| Configurations, compactification | `n = 0, 1, 2`; `(0, 2)` over `ℤ` | correct |
| Hurwitz counts | `S₃`, transpositions, `n = 2` (9, 6), `n = 4` (27, 24, 4) | correct |
| Mod-`ℓ` comparison, towers, weights | `n = 2, ℓ = 2`; `ℝP²`; `𝔸^n`, `𝔾_m` traces | correct |
| Fixed-fibre formula; semidirect comparison | `q = 2`; `𝔽₃² ⋊ C₂`, `q = 7` (`M(G,c) = ℤ/3`) | correct |
| Lifted affine group | `n` odd `u = d/a^{(n−1)/2}`; `n = 2`; `n = 3` gerbe | correct |
| Abhyankar | `ℤ/p` via `y^p − y = x^m`, `ℤ/ℓ`, `ℙ¹` | correct |
| Realization certificates | `(Y²−2)(Y²−3)`, `ℚ(∛2)`, `Y³ − 3Y + 1` (disc 81), `Y³ − 2`, `Y⁴ − 2` | correct |
| Belyi transport | `χ ≡ 2 mod 5`; triple `((012),(01),(12))` | correct |
| Generic polynomials | `Y² − T`, char 2, `Y² − 2` over `ℚ(T)`, `G = 1` | correct |

## Remaining notes (not blocking)

- The supplier contracts cite TauCetiRoadmap PR #196 (open). Its layer numbers were checked at head
  `4bd7237`; if that PR is restructured before merging, the cited layers must be re-pointed.
- The theorems of Layer IG.4 that need global class field theory are stated over number fields (the
  packager's decision, recorded in its handoff); their function-field cases await a roadmap owning
  function-field class field theory.
- Several unchanged README lines exceed 100 characters (long Lean names and URLs); this does not
  affect rendering.
