# FIX-PKG-ExcursionOperatorsAndSpectralAction~adv

Checkpoint for #11148 by Codex, session `codex-MHecX1`, 2026-10-19.
Branch: `codex-MHecX1-fix-excursion-spectral`.
Base: `e4e0d369d4d418b55cbe42cd560c005993ebbf37`.

**Verdict: needs_changes.** R1 now has named, sourced interfaces and a local
delivery order, but its owning-packet requests and upstream tier routing are
not supplied. R2 now specifies the classical two-tower map and several action
conversions, but the equal-characteristic basic-framed Hecke comparison is not
established. This checkpoint does not certify dependency closure or readiness
for upstream submission.

The expected `REV-PKG-ExcursionOperatorsAndSpectralAction~adv.md` does not
exist in this checkout. The findings used are the complete existing
[package review](../reviews/REV-PKG-ExcursionOperatorsAndSpectralAction.md)
from #11083 and the package's previous `review.json`. That review was by a
different session, `codex-BtZbVX`, on work by `claude-eaapd2`.

## Finding dispositions

The previous review had already repaired findings 1–9. These repairs remain:

| Finding | Disposition in this checkpoint |
| --- | --- |
| 1. Global product functions | Retained the canonical ring map, without the false ordinary tensor-product isomorphism. The infinite diagonal boundary target remains. |
| 2. Selector Haar normalization | Retained `e_K = 1_K / vol(K)` and the volume-sensitive projector Check. |
| 3. Noncompact Schur objects | Retained the global ES0 operators and the underlying abstract Weil group, with condensed continuity. |
| 4. Coefficient transport | Retained unrestricted derived transport of operators, separate from the hypotheses on spectral centres. Named the remaining categorical coefficient comparisons explicitly. |
| 5. Wild cutoffs | Retained normality in the full Weil group. The new supplier Checks also require a common tensor-generator-and-dual cutoff. |
| 6. Universal integral range | Retained the canonical relatively discrete enrichment and the general-category factorization argument of ES3.7. No extra enrichment hypothesis was added. |
| 7. Nonsmooth centres | Retained closed-cocompact induction, detection by functions supported on `HK`, all preimage strata and the Levi square. Named the missing rational-image and geometric-square interfaces. |
| 8. Boyer input | Retained the precise Boyer locators and the inverse division-algebra central character. Added explicit Genestier–Lafforgue coordinates, descent, and the Dat duality conversion; R2 remains below. |
| 9. Supplier accounting | Retained the existing LP2c reconstruction and Scholze–Weinstein locators. Removed duplicate requests for BunG's all-field torus and basic-adjoint assertions; they are already §§1.36 and 1.44. |
| R1. Supplier closure and order | Partially repaired. Exact names, hypotheses, source locators, proof routes, consumers and Checks now replace generic extensions of SR, LP3 and WC. Additional LP/HS/VS/E5/BunG/RFF/RG2 contracts have names too. README order A–E is a local interface order, not an assigned upstream tier or bundle. Owning-packet requests and tier decisions remain outside this issue's permitted files. |
| R2. Equal-characteristic realization | Partially repaired. ES7:equal-characteristic.22 gives the completed infinite-level tower map and its group/descent equations, the required normalized operations, the Hom/contracted-tensor distinction and the Poincaré pairing. `basic_frame_coordinate_descent`, including inverse gluing and both framings, remains unproved; no action-preserving Hecke-fibre comparison is claimed. |

Only README, review metadata and this handoff change. Suggested.lean and
metadata.toml are unchanged. All fifteen layers and 112 numbered target
subsections remain. No theorem was restricted to a good prime, `GL₂`, or
characteristic zero to evade an integral or modular obligation.

## R1: exact routing needed to resume

The README's **Exact supplier contracts** contains the statements and Checks.
The following routing list identifies the required owning changes; it does
not assert that a supplier already contains these targets.

| Owner | Targets to supply or reconcile | Consumers |
| --- | --- | --- |
| SmoothRepresentationsOfLocalGroups, coefficient-general continuation | `irreducible_smooth_admissible_ne_p`, `admissible_irreducible_scalar_end`, `fg_admissible_finite_length_ne_p`, `supercuspidal_support_exists_ne_p`, `admissible_smooth_dual_ne_p`, `closed_cocompact_irreducible_lift_ne_p` | ES5.5–ES5.6, ES6:functoriality.11, ES6:duality.2 |
| LanglandsParameterStacks LP3 | `integral_highest_weight_ext`, `perf_classifying_stable_envelope_DVR`, `perf_classifying_highest_weight_filtration_DVR`; distinguish these from field highest-weight theory and the already owned `F♮` | ES3.2–ES3.4; related ES2 representation-generation inputs |
| WeilConjectures continuation | `constructible_curve_functional_equation`, `curve_epsilon_product` | ES7:equal-characteristic.17 |
| ArithmeticGaloisRepresentations §2.7 | `equal_char_local_epsilon`, with punctual terms, rank-zero induction hypothesis, measure and `j_!`/`j_*` conventions | WC product formula and ES7:equal-characteristic.17 |
| LP0/LP1/LP3/LP4 | `finite_wild_tensor_refinement`, `central_torus_lift_ratio`, `finite_wild_perf_coefficients`, `pro_reductive_representation_generation`, `affine_quotient_ind_modules_char_zero` | ES1, ES2, ES3.9, ES4.3, ES6:functoriality.11 |
| HS1 | `pro_p_equivariant_inflation`, `normalized_hecke_kernel_coefficients`, `admissible_condensed_hom` | Finite ramification, coefficient transport and ES5.5 |
| VS3/VS4/VS5 | `lisse_category_coefficients`, `condensed_stratum_adjunction`, `condensed_BZ_center` | ES3.9, ES5.4–ES5.6, ES4.5 and ES6:duality |
| EnhancedDerivedSheaves E5 | `enhanced_endofunctor_center`, `animated_module_colimits`, `central_telescope_mappings`, `compact_endomorphism_base_change` | ES0, ES2–ES3, ES4.3–ES4.4 |
| BunG, with HS4.3 where indicated | `basic_inner_twist_hecke`, `bounded_hecke_hn_preservation`, `central_pushout_stratum_square` | ES7:parabolic.4–.5 |
| RelativeFarguesFontaine | `rank_one_LT_frame` | ES6:functoriality.6 |
| ReductiveGroupsPartII continuation | `multiplicative_center_pushout`, `closed_cocompact_rational_image`; consume the existing induced-torus resolution | ES6:functoriality.11 |

The three main mismatches have substantive proof routes:

- SR: all-coefficient admissibility and finite length from Vignéras, §§4–5,
  pp. 337–340; scalar endomorphisms from a nonzero finite-dimensional fixed
  space; supercuspidal-support existence by rank induction and finite length;
  exact smooth duality from pro-`p` fixed pairings. A cyclic subobject of
  admissible closed-cocompact induction has finite length and an irreducible
  subobject; right Frobenius reciprocity then supplies the required quotient.
  Do not obtain these early inputs from geometric second adjointness that
  would already use ES. The unitary/Fell-topology Part II is a different scope.
- LP3: integral `Δ`/`∇` Ext and truncated coalgebras (Jantzen II.B.4,
  pp. 412–413; II.B.7–B.9, pp. 414–416), then derived full faithfulness and
  generation of the stable envelope. The weight filtration gives the product
  tensor identity used in Fargues–Scholze X.3.1–X.3.2, pp. 348–349. Reduction
  to a field or a Grothendieck-group calculation is insufficient.
- WC/AGrep: Verdier pairing plus determinant reciprocity gives the
  constructible equation; Laumon 3.1.5.4, p. 186, supplies local constants and
  3.2.1.1, p. 187, the product formula, with the boundary conventions in
  3.1.5.7–3.1.5.8, p. 187. These introduce no Tate-thesis theorem target.

The local order is foundations and elementary coefficient-general SR/AGrep,
then abstract SR6 and LP/weight theory/WC, then FF/BunG/VS and GS/HS, then
the ES operators and parameter properties, and finally the independent
classical realization. Current SR6.1–SR6.3 already supplies abstract finite-wild
cocycles and excursions; it has no need to import ES for that construction.
The generic HS Hecke family does not depend on the final classical comparison.

`upstream/CaraianiNewton.md` does not assign ES, LP, HS, VS or BunG a tier in
its 94-roadmap list. Focus membership supplies no bundle declaration. A
maintainer must reconcile the interface order with upstream tiers and route
the owning changes. This issue explicitly permits only package files and this
handoff, while PROTOCOL §3 requires requests in owning packets. That scope
boundary blocks certification of R1 in this run. No tier or bundle was invented
and no owning packet was edited.

## R2: exact mathematical resumption point

The required two operations are stated for all `F_q((ϖ))`, `d ≥ 1`, `ℓ ≠ p`
and supercuspidal `Q̄_ℓ` representations, with basic bundle `O(−1/d)`, both
framings and independent Weil variables. They are README targets, not Lean
theorems on substitute carriers.

Genestier–Lafforgue Theorem 1.5.3, p. 10, supplies the completed infinite-level
classical tower isomorphism. Proposition 2.1.1, pp. 11–12, and Remarks 2.2.4,
p. 17, and 2.3.7, pp. 30–31, give the contravariant coordinate equations.
Transposition carries the displayed Drinfeld action and descent to the
Lubin–Tate equations. The usual Drinfeld `GL_d` convention requires inverse
transpose (Remark 1.4.2, p. 7); arbitrary-height and height-zero formulas cannot
be identified unchanged. Dat Lemma 3.5.13, p. 27, gives the ordinary/compact
support duality with `[2d−2](d−1)` and the normalized trace. That duality acts
on every factor, including Weil, not only on the division algebra.

Resume at `basic_frame_coordinate_descent` in ES7:equal-characteristic.22:

1. Construct the family map using `T_X = S_X R_X⁻¹` on punctured-disc charts;
   prove convergence, the Frobenius equation and the single determinant
   divisor. The coordinate realization of the framing is analytic; an
   equality of matrices alone does not establish descent.
2. Recover the local shtuka/formal-module data by inverse gluing. Prove
   naturality on families and compatibility with both framings, including the
   opposite-algebra variance of the contravariant coordinate module.
3. Transport arithmetic descent to the geometric convention and use HS3.8's
   Hom-to-duality conversion to obtain the two displayed Hecke identities.
   Keep the two Weil variables independent and compute the rank-one character
   and rank-two shift witnesses before concluding the trace formula.

HS3.10 already supplies `heckeBetweenStrata.basicTwist` and
`heckeBetweenStrata.homAdjunction`; HS3.8 already supplies the abstract duality
conversion. These are consumed, not requested again. The missing piece is the
classical equal-characteristic identification with that abstract basic-framed
space and its actions.

Hartl–Viehmann Definition 4.9, p. 19, Examples 6.14–6.15, pp. 33–34, and
Theorem 8.1(c), p. 45, are concrete period/modification inputs; that theorem
does not state the FF comparison with Weil descent. Li-Huerta Theorem 4.9,
p. 28, Proposition 4.15, p. 31, Theorem 4.16, p. 32, and Lemma 4.17,
pp. 32–33, concern trivial framing. They cannot simply be substituted for
this nontrivial basic frame. Fargues–Scholze IX.3, pp. 324–325, starts its
classical tower comparison over `Q_p`; `Ri_b*` is not asserted to equal `i_b!`.

## Adversarial pass on touched statements

Results below are mathematical checks of the stated boundaries, not proofs of
the requested interfaces. New heavy targets have no carriers at the pins;
their witnesses stay in README Checks under the 2026-10-19 shape rule. No
unrelated numerical Lean example or admitted data definition was added.

| Statement or interface | Instances and computation | Result and change |
| --- | --- | --- |
| `finite_wild_tensor_refinement` | Unit and zero representations; generator plus dual; intersections of normal wild cutoffs | Retained common normal cutoff; compactness remains a geometric input. |
| `central_torus_lift_ratio` | Identical lifts give `1`; trivial action gives a homomorphism; nontrivial action gives `a_uv = a_u u(a_v)` | Only compares existing continuous lifts; no arbitrary lift-existence claim. |
| `finite_wild_perf_coefficients` | Trivial group; `[Λ —ℓ→ Λ]`; ramified DVR with nonreduced `Λ/ℓ`; excluded good prime | Requires derived quotient and generation over the actual coefficient ring, not its reduced field. |
| `pro_reductive_representation_generation` | Trivial group and finite-dimensional representation; distinct representations can use different quotients | Characteristic zero retained; no one-quotient assertion for all representations. |
| `affine_quotient_ind_modules_char_zero` | `G = 1` gives modules over the affine coordinate ring; `X` a point gives the representation category | Representation compact generation and characteristic zero are explicit. |
| `pro_p_equivariant_inflation` | Cyclic group of order `n = 2,4,3,9`: coefficient of each element in the square of the average is again `1/n`; modular coefficients require `p` invertible | Continuous pro-`p` averaging retained. Coefficient characteristic `p` is excluded. |
| `normalized_hecke_kernel_coefficients` | Identity map; two successive maps; torsion two-term complex | Derived comparison includes creation, annihilation and the chosen square root. |
| `admissible_condensed_hom` | Scalar character gives scalar endomorphisms; two copies give matrices; noncompact admissible objects | Unit and condensed mapping comparison required; compactness not silently imposed. |
| `lisse_category_coefficients` | Unit and torsion complex on trivial-group component | Whole-category scalar extension is an additional named request. |
| `condensed_stratum_adjunction` | Identity adjunction; scalar unit; noncompact admissible character | Invertible unit is retained; right extension has its own eligible domain. |
| `condensed_BZ_center` | Torus character `ξ` with `ξ ≠ ξ⁻¹`; object outside a biduality domain | Inversion is visible; biduality not extended to all noncompact objects. |
| `enhanced_endofunctor_center` | Zero category has zero centre; product of two unit categories has two scalar factors | Evaluating on one object does not identify the entire centre. |
| `animated_module_colimits` | Constant diagram; relation diagram | Constant case unchanged; animated relations not replaced by ordinary quotients. |
| `central_telescope_mappings` | `f = 1` gives the object; `f = 0` gives zero; zero object | Vanishing locus is `V(f)` and mappings require a compact source. |
| `compact_endomorphism_base_change` | Unit in `Perf(R)` gives `R → B`; nonflat reduction can change degree-zero homology | Derived comparison separated from flat degree-zero specialization. |
| `irreducible_smooth_admissible_ne_p` | Trivial group, torus character, zero representation, `F̄₂` with odd `p` | Zero is admissible, not irreducible; no good-prime bound. |
| `admissible_irreducible_scalar_end` | Countable `F̄_ℓ`; nonzero finite-dimensional pro-`p` fixed space and an eigenvector | No uncountability assumption; doubled character fails irreducibility. |
| `fg_admissible_finite_length_ne_p` | Zero has length zero; `L[t,t⁻¹]` is cyclic with strict ideals `(t−1)^n` and infinite-dimensional `O_Eˣ` invariants | Admissibility is essential; finite generation alone fails. |
| `supercuspidal_support_exists_ne_p` | Torus, rank zero, modular cuspidal proper-induction subquotient | Only existence is asserted; cuspidal and supercuspidal remain distinct. |
| `admissible_smooth_dual_ne_p` | One-dimensional character, finite sums, finite-dimensional pro-`p` fixed pairings | Exactness and biduality are scoped to admissible representations. |
| `closed_cocompact_irreducible_lift_ne_p` | `H = G(E)` gives `Π = τ`; compact infinite quotient; fixed compact open `K` | Double-coset set finite without finite index; whole induction need not be finitely generated. |
| `integral_highest_weight_ext` | Trivial group; torus weights equal/unequal; `SL₂` with residue characteristic `2` | `Δ`/`∇` pairing retained; no semisimplicity of arbitrary modules asserted. |
| `perf_classifying_stable_envelope_DVR` | `H = 1`; `[R —ϖ→ R]` has nonzero torsion cohomology but vanishes generically | Field generation cannot replace the DVR stable-envelope target. |
| `perf_classifying_highest_weight_filtration_DVR` | Torus finite weight sets; unit group; external product of two weight sets | Finite stages and retract closure explicit; no good-filtration assertion for every representation. |
| `constructible_curve_functional_equation` | Zero: `L = ε = 1`; `P¹`: eigenvalues `1,q`, `χ = 2`, `ε = q⁻¹`; `A¹`: `χ_c = 1`, `ε_c = −q⁻¹`; `G_m`: `χ_c = 0`, `ε_c = q⁻¹` | Inverse alternating determinant and `j_!` versus `Rj_*` fixed. Rational identities also checked at `q = 3, T = 2/5`. |
| `equal_char_local_epsilon` | Rank-zero punctual complex; `j_*V` versus `j_!V`; rank-one reciprocity; `p = 2` permits nontrivial additive character | Punctual determinant and rank-zero induction hypothesis retained; volume-one and self-dual measures distinguished. |
| `curve_epsilon_product` | Zero complex, geometrically connected constant rank one, punctual rank-zero term, change of rational differential | Geometric connectedness and genus factor explicit; boundary terms not erased. |
| Existing BunG §1.36 and §1.44 | Trivial torus gives one class; `G_m` gives `ℤ`; all-field versus p-adic §1.40 | Duplicate requests removed; consumers point at existing all-field targets. |
| `basic_inner_twist_hecke` | Identity twist and its two projections | Requires kernel and descent transport, not only equivalence of bundles. |
| `bounded_hecke_hn_preservation` | Trivial cocharacter/bound; changing the Hecke bound after a fixed `N` | Bound fixed before the threshold; no universal `N` over all bounds. |
| `central_pushout_stratum_square` | Identity pushout; multiple preimage strata; Levi comparison | Every preimage stratum and `2ρ` normalization retained. |
| `rank_one_LT_frame` | Rank one: no Satake shift; uniformizer and non-self-dual character | Frame action must precede associated-representation transport. |
| `multiplicative_center_pushout` and `closed_cocompact_rational_image` | Identity pushout; `SL_p → GL_p` over `F_q((t))`, nonsmooth `μ_p`, infinite compact quotient | No rational-centre surjectivity or finite-index claim; existing induced-torus resolution consumed. |
| Updated ES3.2–ES3.3 and ES3.9 | Trivial group, excluded good prime on the approximation, ramified reduction | Exact named prerequisites; reduction remains conditional on unsupplied comparisons. |
| Updated ES5.5–ES5.6 and ES6:functoriality.11 | Countable modular field, noncompact admissible object, closed cocompact subgroup | No complex-only theorem substituted for the coefficient-general targets. |
| Updated ES6:duality.2 | Torus character inverse and modular cuspidal proper-induction subquotient | Uses named supercuspidal-support and admissible-dual requests. |
| Updated ES7:equal-characteristic.17 | `j_!` open-curve equation versus completed `j_*` equation | Names both WC targets and AGrep local epsilon owner; independence scope not enlarged. |
| Classical tower coordinate/action equations | Transpose of `δTγ⁻¹` is `γ⁻ᵗTᵗδᵗ`; transpose of `PT` is `TᵗPᵗ`; rank one; finite-level stabilizers | Explicit completed infinite-level comparison; no finite-level isomorphism asserted. |
| Poincaré/Hom conversions in ES7:equal-characteristic.22 | `d = 1` has no shift; `d = 2` requires `[2](1)` for duality, while Satake uses `[1](1/2)` | Duality and Satake normalization kept distinct; duality reverses every factor. |
| Required two-operation action and `basic_frame_coordinate_descent` | Rank-one `ξ ≠ ξ⁻¹`; independent eigenvalues `a = 2, b = 3` give `2/3`, not `6`; rank two half twist cancels `q^(1/2)` | Required output pinned, but analytic map, inverse and framing conversion remain a gap. These computations do not certify it. |

The ambient assumptions give `q = p^f ≥ 2`; `q = 1` is not a finite residue
field. The cohomological rank-zero case is the zero complex, not `d = 0` in
the tower, where `O(−1/d)` is undefined. `ℓ = p` is excluded throughout.
Residue coefficient characteristic `2` is permitted when `p` is odd: a
nontrivial root of `x²+x+1` in `F₄` has order three and differs from its
inverse, so the character sign test does not disappear there. No denominator
in a pro-`p` average or rational trace is used without invertibility.

### Ten Lean signatures reread against the README

The file is unchanged, but these signatures were freshly checked against their
`variable` blocks and the related prose. This is signature verification, not
a claim that their admitted theorems have been proved.

| Signature | Boundary computation and correspondence |
| --- | --- |
| `heckeCompatibleCentre_comp` | Identity and empty families; composition carries the component equation in the stated functor order. |
| `IsSchurIrreducible.sections_bijective` | Identity scalar unit and isomorphic transport; `IsIso` yields bijectivity on each test object, with no converse inferred from global sections. |
| `excursionCharacter_spec` | Scalar `x` and zero `x`; algebra equivalence fixes the scalar unit. |
| `stratum_centre_embedding_independence` | Identity extensions; the comparison compatibility makes the restricted comparison invertible, so naturality conjugates the two actions. |
| `restrictCentre_comp` | Identity fully faithful functor; direction is restriction from the largest category through the two functors. |
| `twistedLeviCocycle_isCocycle` | Degree zero and `t = 1`; equivariance, fixedness of `t` and centralization hypotheses are all present. |
| `support_exact_operations` | Zero object, shift zero, split triangle and retract; shift compatibility is an explicit hypothesis. |
| `support_coefficient_change` | Identity flat map and zero object; unit-preserving endomorphism comparison retained separately from flatness. |
| `centralSupport_subset_principal_iff` | `f = 0` permits exponent one for every object; `f = 1` forces zero identity; support is inside `V(f)`. |
| `two_leg_excursion_is_trace` | Dimension zero gives zero; dimension one gives `a/b`; `g = h` gives dimension. Finite-dimensionality and dual inverse action are explicit. |

## Existing-work and source audit

Read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE, the expansion protocol,
the package and its review, and the PadicMeasuresIwasawaAlgebras exemplar.
The current DGAInfinity and RepresentationTheory/InductionRestriction roadmaps
were also used as style models. Library-coverage entries for ES and the main
suppliers were read before the object audit.

Current TauCetiRoadmap and Completed were read at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine newer roadmaps;
current Tau Ceti was read at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Object searches and declaration reads covered integral representation
generation, finite-wild cocycles, smooth fixed vectors/induction, centres,
cocharacters, bundles and local shtukas. The existing Lie/Schur field-valued
theories and integral lattices do not supply `Perf(BH)` over a DVR. Existing
Mathlib `CatCenter` operations, continuous smooth-category carriers and
cocharacter parabolics/Levis were read at the pins and remain cited.

Open upstream supplier text was read as data at these heads:
LP #1202 `7d61feb9fcef5ca9a955570acd0eee5ebfc5d707`,
VS #1230 `ef65c49d5886de8a573f2710713e06515f511b68`,
WC #1208 `daa389532f2ba03c1563fdb1c3b96696ef54c7cb`.
LP3.18 already owns `F♮`; LP4.2's DVR/algebraically closed residue-field
generation does not itself handle every ramified nonreduced quotient.
VS coefficient preservation does not supply the requested whole-category
scalar-extension equivalence or every noncompact condensed comparison.
WC.2's smooth proper constant-sheaf statement does not supply the new equation.
No instructions from these files were followed.

Primary source locators are in the README references and at the targets.
Public author/journal versions of Fargues–Scholze, Vignéras,
Henniart–Vignéras, Laumon, Boyer, Hausberger, Genestier–Lafforgue,
Hartl–Viehmann, Dat, Li-Huerta and Fargues were read directly. Jantzen's
cleared second edition was read only in the supplied library; no file or
passage was copied. All repository prose is our own statement of the targets,
not a source excerpt or a sequential summary of a paper.

For reproducibility, the downloaded author versions used for the difficult
bridge have these SHA-256 hashes (pagination is the manuscript pagination
specified in the README):

| Source | SHA-256 |
| --- | --- |
| Genestier–Lafforgue | `584edd23c4250dd315e0d3abe2488c1a21a69f3854fc9bd30843d8caa63b092b` |
| Hartl–Viehmann | `9c3af2056819806fd6fde0d269217393d74b7c5ee01d50668dbe9eb19dab1815` |
| Dat, Lubin–Tate | `4973a260e5af4b046652956ad63e95a412fb82873cdecc6bd585c85e1aa4a04d` |
| Li-Huerta | `12642783a1781917bc3beef6752235e0cf0590780885006d86e46f71e616880c` |

No suspicious fetched instructions were encountered. No fetched code was run,
no source passage was committed and no read-only upstream checkout was built.

## Validation

- `lean-check research/blueprint/packages/ExcursionOperatorsAndSpectralAction/Suggested.lean`:
  exit 0 at Mathlib `082e2d3` and Tau Ceti `f790474`; 24 warnings, all
  `declaration uses sorry`; all twelve examples are proved. The unchanged file
  has 492 lines, eight real-bodied definitions and 24 theorem statements.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ExcursionOperatorsAndSpectralAction/Suggested.lean`:
  exit 0.
- `scripts/check_blueprint.py`: ES0, ES5 and ES6 have zero errors and warnings.
  ES7 has six existing unresolved EDC.8 references: correspondence composition,
  correspondence pushforward, correspondence trace, Lefschetz–Verdier formula,
  and two uses of `similitude-reciprocal-charpoly`. The packets are unchanged
  and are not permitted deliverables of this issue. These structural errors
  are recorded separately from R1 and R2.
- Exact rational calculations checked the `P¹`, `A¹`, `G_m` and zero-complex
  functional-equation witnesses, and finite cyclic convolution checked the
  averaging idempotents. Polynomial multiplication in `F₂[x]/(x²+x+1)`
  checked the characteristic-two character witness. These are scalar checks,
  not categorical proofs.
- `python3 research/blueprint/intake.py check-files` on the three changed
  deliverables: `3 file(s), 0 problem(s)`. JSON parses, all 112 numbered
  anchors are unique, the change scope is limited to the authorized paths,
  and `git diff --check` passes.

Resume from the R1 routing table and R2 construction above; none of the
continuation depends on disposable scratch files. Do not mark accepted until
both residues and the upstream ordering have been resolved.
