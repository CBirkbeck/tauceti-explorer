# REV-PKG-InductionRestrictionPartII

Independent review of the roadmap package `research/blueprint/packages/InductionRestrictionPartII/`
(README.md, Suggested.lean, metadata.toml), written by Claude session `claude-RZTzXj` (PR #9631),
against its accepted plan `research/blueprint/packets/InductionRestrictionPartII.json`. Reviewer:
Claude (Opus 5.5), session `claude-si5gx0`, 14 October 2026. The reviewer wrote none of the package,
the plan or its earlier reviews.

**Verdict: `needs_changes`.** The package re-plans 43 targets that the accepted
InverseGaloisAndArithmeticFundamentalGroups package owns in its Layers IG.3.4–IG.3.5. That package is
already TauCetiRoadmap pull request #850, whose README is authoritative. Its handoff asked this roadmap
to import those targets and drop its own. Resolving this changes the roadmap's scope: layers RS.2 and
RS.5 disappear, RS.1 and RS.3 shrink, and parts of RS.0 overlap. That is a package revision, not a
correction a review can make in place. Everything else the review found has been corrected in place
(list below), and the rest of the package is in good shape. The mathematics checked out in every
layer, every Table 2 value matches the source, the Lean elaborates, and no target duplicates
TauCetiRoadmap main or the current Tau Ceti library.

## Scope and method

- I read the whole README (3026 lines) and the whole Suggested.lean (896 lines) myself. I worked
  every proof sketch and every Check through by hand: the factor-set cocycle identity against
  Mathlib's `IsCocycle₂`, the commutator sign, the degree-three chain identity of RS.1.4, the
  correction cocycle of RS.3.4, the fixed-fiber equation of RS.4.3, and all the computed values (the
  adversarial table below).
- I fetched all eight public sources into scratch. The five that the plan pins have the plan's
  SHA-256 hashes. Löh, Hatcher and Conrad were new: Löh `d4f2d819…`, Hatcher `bebb3032…`, Conrad
  `7294dabc…`, all accessed 2026-10-14. I located every cited label on the per-page text with three
  Haiku retrieval agents, then read the quoted lines myself for a sample of more than fifteen labels:
  - Wood 2019: §2.3 p. 387, Definition 3.1 p. 388, Lemmas 3.3–3.4 p. 390, §4.1 pp. 398–401, Table 2
    p. 419 and the Appendix p. 420;
  - Wood 2021: §2.1 p. 2, Lemmas 2.1–2.4 and Theorem 2.5 pp. 2–4, equations (2) and (4) and
    Remark 4.1 pp. 6–8;
  - Liu–Wood–Zureick-Brown: §12, arXiv v2 pp. 47–48 and published pp. 104–105, and Lemma 12.10 with
    the proof of Theorem 10.4;
  - Ellenberg–Venkatesh–Westerland: §7.3 p. 34, §§7.4–7.5 pp. 34–37 and Example 9.3.2 p. 57;
  - Löh: Theorems 1.7.15 and 3.2.12, Corollaries 1.6.13, 3.2.20 and 3.2.23;
  - Hatcher: Lemma 3.1 and Theorem 3.2;
  - Conrad: Remark 5.
- Three Sonnet agents did the mechanical checks, and I read their results:
  - packet-to-README fidelity, node by node: all 109 nodes, 124 API names and 96 test names present;
  - Lean declarations against the README;
  - a duplication and supplier sweep over current TauCetiRoadmap main, current Tau Ceti a91d3aaf, the
    pinned Tau Ceti f790474 and the pinned Mathlib, and over the other atlas packages.
- I fetched the README of TauCetiRoadmap pull request #850 (branch
  `roadmap/inverse-galois-and-arithmetic-fundamental-groups`, updated 2026-10-14) and compared its
  IG.3.4–IG.3.5 with the atlas copy.

## The defect that remains: duplication with InverseGaloisAndArithmeticFundamentalGroups

InverseGaloisAndArithmeticFundamentalGroups is in the Caraiani–Newton order and goes upstream before
this roadmap, which is outside the order. When it was packaged, the tier rule moved the
reduced-Schur material it needs down into its own Layer IG.3. Its handoff
(`handoff/PKG-InverseGaloisAndArithmeticFundamentalGroups.md`, "Notions moved down into this
roadmap") records the move: "InductionRestrictionPartII should import these from Layer IG.3 and drop
its own RS.1–RS.3 and RS.5 targets."

The upstream README of pull request #850 still states this ownership. Its scope paragraph lists
"reduced Schur multipliers and covers, marked central extensions and the universal marked extension
U(G, c) with its kernel, the action of units and the cyclotomic twist". It also says the comparison
of a Schur cover's kernel with H₂(G, ℤ) is "part of the target *Reduced Schur covers*".

This package keeps all of those targets. Its scope section and its "Downstream consumers" section
name InverseGalois only as a consumer of the marking, lifting and power interfaces. That statement is
wrong, because InverseGalois plans these interfaces itself.

**The 43 targets owned by IG.3.4–IG.3.5.** Each row gives the IRPII target and the IG subsection that
owns it. The count agrees with the "43-node closure" in the IG handoff.

| This package | Owned by (IG subsection) |
| --- | --- |
| RS.1.1 `liftCommutator`, RS.1.2 `commuting_pair_cycle`, RS.1.3 `homologicalCommutator` (with `homologicalCommutator_central_extension`) | IG.3.4 *Commutators of lifts and the class map of a central extension* |
| RS.1.5 `schurRelations`, RS.1.6 `ReducedMultiplier` | IG.3.4 *The reduced Schur multiplier* |
| RS.1.7 `ReducedCover`, RS.1.14 `homology_composite_zero` | IG.3.4 *Reduced Schur covers* |
| RS.1.8 `centralizer_lifts`, RS.1.9 `conjugacy_bijection`, RS.1.10 `classCompatibleMarking` | IG.3.4 *Conjugacy classes lift bijectively* |
| RS.2.1 `MarkedExtension` | IG.3.4 *Marked central extensions* |
| RS.2.2 `UniversalMarked`, RS.2.5 `word_conjugation`, RS.2.6 `universal_central`, RS.2.7 `universal_marked_property` | IG.3.4 *The universal marked extension* |
| RS.2.3 `classDegreeMap`, RS.2.4 `universalDegree` | IG.3.4 *The class degree map* |
| RS.2.8 `presentation_abelianization`, RS.2.9 `markedFiberProduct`, RS.2.10, RS.2.11, RS.2.12 `marked_pullback_split`, RS.2.13 `markingCorrection`, RS.2.14, RS.2.15 `presentation_comparison` | IG.3.4 *The marked fibre product and the computation of U(G, c)* |
| RS.2.16 `universalKernel` | IG.3.4 *The kernel of the universal marked extension* |
| RS.3.1 `finitePower`, RS.3.2 `degreePermutation` | IG.3.5 *Powers by units and the permutation of class degrees* |
| RS.3.3 `centralPowerCorrection`, RS.3.4 `correction_cocycle` | IG.3.5 *Central power corrections* |
| RS.3.5 `discreteAction`, RS.5.11 `compatible_correction` | IG.3.5 *The discrete action of units* |
| RS.3.8 `CyclotomicTwist` | IG.3.5 *The cyclotomic twist of a set* |
| RS.5.1–RS.5.10 (compatible covers, primary kernels, admissible inertia, abelianization, relation surjection, reduced kernel) | IG.3.4 *Coprime semidirect products and admissible inertia*, items 1–3 |

**What IG does not plan, and stays here.**

- RS.1.4 `commutator_order`, the power law ⟨xⁿ, y⟩ = n⟨x, y⟩.
- RS.1.11 `localClassNormalization` and RS.1.12 `local_factors_commute` (Wood 2019, Definition 3.1).
- RS.1.13 `homology_image`, the image equality. IG uses only the zero composite.
- RS.3.6 `kernel_action_aut`, RS.3.7 `finite_level_action`, RS.3.9 `boundedDegreeSlice`,
  RS.3.10 `powerFixedDegree` and RS.3.11 `DegreeOrbitSet`.
- All of Layer RS.4 and all of Layer RS.6.

**Layer RS.0 also overlaps IG.** The package author added RS.0 after IG's package was accepted.

| RS.0 target | What IG already states |
| --- | --- |
| RS.0.1–RS.0.3: evaluation, universal coefficient sequence, class map τ_S with τ⟨x, y⟩ = κ(x, y) | IG.3.4's first target asserts τ_E, its value on ⟨x, y⟩, and the universal coefficient sequence for trivial A (source: Wood 2021, proof of Theorem 2.5). IG does not state the free-abelianization or divisible cases. |
| RS.0.4: five-term exact sequence | IG names τ_E "the connecting map of its five-term homology sequence" and uses the sequence in *Reduced Schur covers*, but it is not a named IG target. |
| RS.0.5: `IsSchurCover`, `isSchurCover_of_stem_card` | IG *Reduced Schur covers*: "is part of this target". Existence is InductionRestriction Layer 7 for both roadmaps. |
| RS.0.6: finiteness and annihilation of positive-degree homology | IG item 1 states finiteness and exponent \| \|G\| in degree two only. |
| RS.0.7: primary decomposition and complement part | IG item 1 states "splits canonically as M_H × M_Γ", and item 2 states the kernel ≅ M_H. The Hall part M(H)_G ≅ M(G)_ϖ is not in IG; RS.6.1 needs it. |
| RS.0.8: conjugacy of cyclic complements | IG.4 *Coprime profinite complements* gives conjugacy whenever the quotient or the kernel is solvable, which covers cyclic quotients. |

**What the revision has to do**, in my judgment:

1. Import the 43 targets above from InverseGaloisAndArithmeticFundamentalGroups, Layers IG.3.4–IG.3.5
   (TauCetiRoadmap pull request #850). List them under a new supplier heading, "From
   TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups", with IG's names (`ReducedSchur.*`).
   Delete their subsections.
2. Re-point every *Needs* of the kept targets to the IG subsections. These are RS.1.4, RS.1.11–1.13,
   RS.3.6–3.11, RS.4 (which uses RS.1.7, RS.2.3 and RS.3.5) and RS.6 (which uses RS.1.1, RS.1.7 and
   RS.1.10).
3. Cut RS.0 down to what IG does not state:
   - the five-term sequence, which RS.1.13 needs;
   - general-degree finiteness and annihilation;
   - the Hall part, which RS.6.1 needs;
   - the free and divisible cases of the universal coefficient sequence, if anything still uses
     them;
   - possibly the evaluation map as a named object.

   Cite IG for the class map, its value on commuting pairs, the finite-group universal coefficient
   sequence, the Schur-cover comparison and complement conjugacy. RS.0.8 has no consumer once RS.5
   goes.
4. Rewrite the title, Summary, layer table, scope, "How to read the build" and "Downstream consumers".
   Decide whether to renumber the remaining layers. Other plans cite the labels: ArithmeticStatistics
   ST.0/ST.3 cite `RS.1/reduced-multiplier`, `RS.1/reduced-cover`, `RS.4/involution-abelianization`,
   `RS.6/order96-type` and `RS.6/reduction-certificate`. The RS.1 citations must then point to IG.
5. Remove from Suggested.lean the declarations of the dropped targets. Statements that still need
   their carriers (reduced multipliers in RS.6.1, RS.6.7, RS.6.8 and the table rows) are of two
   kinds:
   - statements that are light real-bodied definitions over Mathlib carriers, like
     `schurRelations`, may stay as such;
   - otherwise they become README-only, per the 2026-10-12 shape.

Who owns RS.0 between the two roadmaps is a planning decision. If the maintainer prefers this
roadmap to stay the owner of the homological bridge, the upstream IG README has to change instead.
That is outside a package review.

## The six criteria

| Criterion | Status |
| --- | --- |
| 1. Upstream form, ≤ 200 KB | Holds: 166 KB, `# Roadmap:` title, Summary, scope, conventions, supplier contracts, build guide, layers with `### RS.k.n` subsections, Examples and Dependencies per layer, consumers, references. RS.1–RS.5 prose is terser than RS.0 and RS.6 (formulas without spaces), but readable. |
| 2. Fidelity to the plan | Holds, apart from the duplication. All 109 nodes, 124 API names and 96 test names are present. Seven statements differ from the packet wording, each a deliberate correction or a stated generalisation (RS.1.13 proof route, RS.2.6, RS.2.10–2.11 now with the generation hypothesis the proofs need, RS.5.6, RS.6.4, RS.6.7). The 19 abelian Table 2 rows now follow from the RS.6.8 formula, as the handoff explains. |
| 3. Own words, locators | Holds; no passage of a source is reproduced. Locators were corrected where wrong (below). |
| 4. No process language | Holds. Three positional uses of a forbidden word were rephrased. |
| 5. Suggested.lean | Elaborates (below). Declarations match README targets, with the closing list completed. |
| 6. metadata.toml | `topic = "math.GR"`, fitting. |

## Sources

These locator errors were corrected:

- **Liu–Wood–Zureick-Brown, published version.** It was cited by NSF PDF page numbers ("published
  PDF pp. 56–57", "pp. 62–63", "p. 64") as if they were page numbers of the article. Journal page =
  PDF page + 48, so these are now §12 pp. 104–105, Lemma 12.10 and proof pp. 110–111, and the proof
  of Theorem 10.4 p. 112. Fixed in RS.0.7, RS.3.6, RS.3.9, RS.3.11, RS.5.1–RS.5.11 and the
  References.
- **Wood 2019 §4.1.** The References gave "pp. 399–401". §4.1 starts on p. 398, Proposition 4.1
  and equation (5) are on p. 400, and equation (6) and Remark 4.2 are on p. 401. Corrected.
- **Hatcher's evaluation map.** It is defined on p. 191, not pp. 190–191. Corrected in RS.0.1.

All other sampled labels are on the cited pages. Two notes:

- The arXiv citation "§12, pp. 47–48" is right: §12 starts on p. 46, and the cited definitions are
  on pp. 47–48.
- LWZB §12 remarks that the action on K(G, c) "does not respect the group structure". RS.3.6 proves
  the opposite on K, correctly, because the cover coordinate lies in the central abelian kernel. The
  plan records this as source issue E3.

## Gaps and supplier order

- Suppliers are Mathlib, the pinned and current Tau Ceti, and InductionRestriction Layer 7. Every
  supplier declaration exists where the README says.
  - Pinned: `inl_factorSet`, which is exactly `σ g * σ h * (σ (g*h))⁻¹`, and `ElementaryTwoQuotient`
    with its API.
  - Current Tau Ceti only, and so marked: `groupHomology.transfer`,
    `transfer_comp_map_subtype_id`, `ChainComplex.kronecker` and `homCokernelEquivExt`.
- The InductionRestriction Layer 7 contract overstated what that layer says. Layer 7 builds the
  representation group over an algebraically closed field, with kernel its Schur multiplier,
  H²(G, kˣ), inside the commutator subgroup. It states no separate kernel-order theorem. The
  supplier paragraph now says exactly what is used.
- `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` is stated for the extension
  built from a factor set. Applying it to an arbitrary extension S passes through
  `factorSetToGroupExtensionEquiv`. The current Tau Ceti `FactorSet.characterTransgression`, the
  dual of τ_S, is injective exactly for stem extensions over an algebraically closed field. Both are
  for the revision's RS.0 to cite.
- No upward citation, no `FoundationsAndLibraryIntegration` id and no `UPSTREAM:` id.
- No *Needs* line refers forward, though three bodies mention a later subsection (RS.2.3 → RS.2.4,
  RS.4.16 → RS.4.17–18, RS.6.8 → RS.6.9).
- Missing hypothesis (not changed, because the subsection is one of the 43): RS.2.16
  `universalKernel_torsion`, "the torsion subgroup of K is M(G, c)", needs M(G, c) to be torsion,
  that is finite G. Here finiteness is only implicit through the Schur cover. IG's copy has the same
  implicit hypothesis.

## Duplication against current Tau Ceti and TauCetiRoadmap

Nothing in TauCetiRoadmap main or in current Tau Ceti a91d3aaf duplicates a target. Searching by
object found these:

- Current Tau Ceti has cohomological, not homological, versions:
  - inflation–restriction;
  - annihilation of the cohomology of finite groups;
  - `characterTransgression` (partial overlap with RS.0.3–RS.0.5; cite it).
- Mathlib's Schur–Zassenhaus is existence only.
- There is no Hopf formula, five-term homology sequence, commuting-pair class, lifting invariant,
  Ẑ-power action or Cohen–Lenstra material anywhere.

The only duplication is with the atlas package and upstream pull request for InverseGalois,
described above.

## Unit tests

- Every definition kept in the README has at least three Checks.
- Theorem subsections carry one or two acceptance Checks; that is not required, but most are
  computed values.
- One remark-style Check was replaced by a computed one: RS.1.13, the image for C₂ × C₂ with c = ∅
  and with c the three involutions.
- All computed values were verified (table below).

## Lean

- Before the edits, `lean-check` of Suggested.lean exited 0 with 88 warnings, all `declaration uses
  'sorry'`. After the edits it exits 0 with 89, all the same kind; the new warning is the added
  theorem.
- `scripts/check_sorry_data.py` is clean. No data definition has a `sorry` body; the
  proof-obligation lemmas used inside `liftCommutator`, `homologicalCommutator`,
  `universalProjection`, `universalDegree`, `swapAction` and `sumKernelModel` are separate theorems.
- There are no `True` placeholders, `Prop := sorry`, `lemma`, `#eval` or process comments.
- I checked every theorem signature against the README. All are true as stated. Some are weaker than
  their README statement and say so in their docstrings or names:
  - `multiplier_complementPart` gives surjectivity and the kernel, not the isomorphism
    M(G)_ϖ′ ≅ M(Γ);
  - `odd_index_two_reduction` gives odd order and Q_c = 0, not the coinvariant isomorphism;
  - `antidiagonal_reduced_multiplier` gives M(F, c) ≃ M(G), not Λ²G;
  - `involution_abelianization`;
  - `rank_parity_count`.

  The revision may strengthen them where the carriers exist (`Representation.Coinvariants`).
- Edits made:
  - `antidiagonal_marking` had `[Finite G]` and odd order on both conjuncts. Generation holds for
    every abelian G, as the README says, so these hypotheses now sit only on the one-class part.
  - `sumKernelModel_eq_top_of_perfect` was added. It is a README target that `table_row_29` relies
    on.
  - The two `by sorry` proofs of conjugation invariance inside example statements are now
    `by rwa [mul_inv_cancel_comm]`.
  - Three docstrings named the wrong item: a stale alias at `abelianization_map_bijective_of_stem`,
    the label of `liftCommutator_inl`, and the residue statement of `finitePower_residue`. They are
    corrected.
  - The closing list now also names `extensionClassMap_eq_zero_of_splitting`,
    `multiplier_primary_support`, `antidiagonalModel` and `order96Type`.

## Adversarial mathematics pass

| Statement | Instances tried | Result |
| --- | --- | --- |
| Factor-set cocycle (RS.0.3) | σ(g)σ(h)σ(k) expanded both ways | φ(g,h)+φ(gh,k) = g·φ(h,k)+φ(g,hk), Mathlib's convention; holds |
| Commutator sign (RS.0.3, RS.1.1) | φ(x,y)−φ(y,x) for commuting x, y; D₈ (r, s), Q₈ (i, j) | = XYX⁻¹Y⁻¹; [r,s] = r², [i,j] = −1; holds |
| Universal coefficients (RS.0.2) | C₂ with ℤ; C₄ with ℤ/2 (C₈); ℤ²; C₂² and C₆ with ℂˣ | Ext terms C₂, C₂, 0; orders 2, 1; holds |
| Five-term sequence (RS.0.4) | A × G, C₄ → C₂, D₈ → C₂², S₃ (noncentral) | all four Checks hold; Hopf-route kernel identity holds since [F,T] ⊆ R ∩ [F,F] |
| Hall decomposition (RS.0.7) | Γ = 1; (C₃²) ⋊ C₂ by inversion; C₂ × C₂ (not coprime) | M = C₃ (inversion acts trivially on Λ²); the coprime hypothesis is needed; holds |
| Complement conjugacy (RS.0.8) | Sylow-normaliser induction; C₃ ⋊ C₂ orientation; C₂ × C₂ | a⁻¹(1,t)a = (a,t), a(1,t)a⁻¹ = (a²,t); holds |
| Power law (RS.1.4) | d₃T(a,b;y) expanded with Mathlib's d₃₂; n = 0, 1, 2 | = z(a,y)+z(b,y)−z(ab,y); telescoping holds |
| Reduced multiplier (RS.1.5–1.7) | trivial group, cyclic, C₂² with c = ∅ / {x} / all | 0, 0, C₂ / 0 / 0; D₈, Q₈ reduce to C₂²; holds |
| Universal marked extension (RS.2) | relator degree; C₂ (U = ℤ); S₃ with c = ∅ (P = A₃) | degree 0; P^ab ≅ C₃ ≠ L = 0 without generation; holds |
| Marking correction sign (RS.2.13) | φψ⁻¹ vs φψ | φψ⁻¹ correct (IG records that Wood prints φψ) |
| Correction cocycle (RS.3.4) | basis vectors via \widehat(x^β) = x̂^β z(β) | z(αβ) = z(β)^α z_{d^β}(α); holds |
| Finite level (RS.3.7) | exponent of S_c; C₃ with units 2 and 11 | divides \|G\|²; 11 ≡ 2 mod 9; holds |
| Fixed fibers (RS.4.3–4.10) | W_q(e_i) = X_i^{1−q}; C₈ (r = 2, 8), C₄ (q = 3), C₄ × C₈, q = 17 | equation h^{q−1} = b^{−r}; image of A[r] in A/A² is B_{v₂(r)}; thresholds 2, 3; holds |
| Parity linear algebra (RS.4.11–4.19) | S₃; S₆ with two involution classes; N = 2 coset weights | a(e₁+e₂) = 0 in S₆; 1 + X² vs 2X; holds |
| Coprime semidirect products (RS.5) | splitting difference; D Hall in S′; admissible generators | hom H → M_Γ trivial; (h,1)(1,γ)(h,1)⁻¹(1,γ)⁻¹ = (hγ(h)⁻¹, 1); holds |
| Anti-diagonal formula (RS.6.8) | C₃², C₅², C₉ × C₃, C₃³; F(C₂) | C₃, C₅, C₃, C₃³; generation also for even order; holds |
| Table 2 (RS.6.10) | all 31 rows against Wood p. 419; model orders 96, 294, 384, 162, 54, 336, 7200, 56 448 | all values and orders agree |

## Corrections made in place

README:

1. Locators: the Liu–Wood–Zureick-Brown published pages (in 15 places, plus the References), Wood
   2019 §4.1 in the References, and Hatcher p. 191.
2. The InductionRestriction Layer 7 supplier contract now says exactly what that layer states.
3. RS.1.4 is now quantified over natural numbers, matching the proof and the Lean, and its *Needs*
   points to RS.1.3 instead of "RS.1".
4. RS.1.13 has a computed Check instead of a remark.
5. RS.4.13 `paritySquareMap_test_2`: "V = U = F₂" used U before it was defined, and U clashes with
   U(G, c). It is now "V = F₂, Additive(Gᵃᵇ) ≅ F₂".
6. RS.4.17: the undefined "real and imaginary signatures" is now "the cosets for g = 1 and for
   g ∈ c".
7. RS.4 Examples: "the odd-parity obstruction survives exactly for q ≡ 1 mod 16" now says that the
   fiber has fixed points exactly when 16 divides q − 1.
8. RS.6.10 now states that every row's c is a single conjugacy class, which is how Wood's table is
   selected. For the abelian rows this is `antidiagonal_marking`.
9. Three positional uses of a forbidden word were rephrased (RS.0 intro twice, RS.4.7).

Suggested.lean: the five edits listed under Lean.

The README diff is +51/−42 lines and the Suggested.lean diff +26/−13.

## Notes for the maintainer

- The verdict rests only on the IG/IRPII duplication. If the maintainer decides that IRPII, as a
  Part II of InductionRestriction, should own the reduced-Schur theory and IG should import it after
  all, the package is otherwise ready. Upstream pull request #850 would then have to change instead.
  That is a planning decision for the maintainer.
- ArithmeticStatistics, which is in the order, cites IRPII RS.4 and RS.6 targets that no in-order
  roadmap plans: the involution abelianization, `order96Type` and the reduction certificate. When
  ArithmeticStatistics is packaged, those must move down, or this roadmap must enter the order.
- Upstream note for #850 (IG.3.4 *The kernel of the universal marked extension*): "its torsion
  subgroup is M(G, c)" needs finite G, which is only implicit there.
