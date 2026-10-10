# Independent package review: ClassicalGroupsPartII

**Verdict: accepted after corrections.** All six requirements of
[#7599](https://github.com/CBirkbeck/tauceti-explorer/issues/7599) hold.
Reviewer: Codex (GPT-6), session `codex-nvl1TU`, 2026-10-10.
This session did none of the package author's work.

Reviewed [README](../packages/ClassicalGroupsPartII/README.md),
[Suggested.lean](../packages/ClassicalGroupsPartII/Suggested.lean) and
[metadata](../packages/ClassicalGroupsPartII/metadata.toml) against the
[accepted plan](../packets/ClassicalGroupsPartII.json). The packet, original
reader document and original suggested file are inputs and were not edited.

## Corrections made in this review

1. Connected `permLaurent` and `flipLaurent` to their explicit lattice maps on
   **every monomial**, including negative exponents. Added the pair-flip
   involution, commutation and permutation-conjugation statements and the
   preservation of central degree. Previously the lattice formulas and algebra
   automorphisms were separate admitted constructions; the reciprocal tests
   only constrained selected generators. The new statements express the
   intended action and its relations directly. The README API now names them.
2. Added the arbitrary-field-extension underlying-module comparison
   `scalarExtendCoordinates`, its equality with the native
   `TauCeti.Comodule.baseChangeCoact` after the coordinate-Hopf comparison,
   and its morphism formula on pure tensors. The canonical Hom comparison is
   pinned by `homBaseChange_tmul`, and `scalarExtend_reflectsIso` states
   reflection of invertibility of a given map. The old Q-extension coordinate
   comparison now specializes the generic one. These make the native
   scalar-extension construction required by the README explicit in the
   prototypes, rather than leaving an arbitrary additive monoidal functor
   and an unrelated Hom-space bijection. Added the corresponding README API.

These are contracts already required by the reviewed targets, not extra
mathematical endpoints. No change to metadata was needed.

## Package requirements

| Requirement | Finding |
| --- | --- |
| Upstream form and density | Four ordered layers, a motivating introduction, standing conventions, exact targets, prerequisites, sources, construction sketches and definition APIs/tests. Read the current ClassicalGroups and ReductiveGroups READMEs in full as comparators. The final README is 105,694 UTF-8 bytes, below 200 KB. |
| Fidelity and ownership | All 26 targets have their own sections. All 76 planned API entries and 58 named tests occur in both README and suggested file. Checked their statements and mathematical meaning, not just occurrence of names. Every one of the 18 definition/construction targets has at least three tests. Supplier contracts remain attached to the owning upstream layers. Two pre-existing package corrections are discussed below. |
| Original prose and source precision | The README develops its own mathematical specification and proof sketches, with section, theorem/equation and printed-page locators. No source passage or source-by-source chapter summary was added or found. The public source versions match the accepted receipts. |
| No process in README | No packet identifiers, job IDs, review/checkpoint history or implementation/coverage statuses. Mathematical uses of “closed” concern immersions and additive closure. |
| Suggested Lean | Standard non-exhaustive header, native imported carriers and substantive proposition signatures. The final `lean-check` completed with exit 0, 198 `sorry` warnings, no errors and no other warnings. Admitted statements remain prototypes. |
| Metadata | Exactly one line, `topic = "math.RT"`, appropriate for algebraic representation theory. |

## Target-by-target checks

All representation-theoretic targets assume positive rank and
characteristic-zero coefficient fields. Field-extension results allow an
arbitrary characteristic-zero K/F; they never require an embedding K→C.
Integral Laurent-algebra assertions keep their separate coefficient scope.

| Layer and target | Mathematical check |
| --- | --- |
| CG.0 coordinate Hopf algebra | Polynomial quotient with invertible multiplier, hJhᵀ=sJ, finite-type Hopf presentation and explicit native GL points; rank-one determinant and multiplier-one Sp fibre agree with native coordinates. |
| CG.0 similitude weight lattice | X=Z×Z^g, scalar degree 2m+Σu_i, dominance only in u, unrestricted integer m, and central-cover pullback (u,2m+Σu_i). |
| CG.0 diagonal torus | diag(z_i,t/z_i), rank g+1, scalar cI coordinates (c²,c,…,c), type-C roots with zero scalar degree and maximal-torus/root-datum registration imported at the correct scope. |
| CG.0 Weyl action | Reciprocal reflection adds u_i to m and negates u_i; permutations use inverse reindexing. Fixedness is under both families, with monomial transport and signed-permutation relations now explicit in Lean. |
| CG.0 central cover | Sp×G_m→GSp has diagonal μ₂ kernel, fppf local square-root lifts and the parity condition. Full-faithful algebraic descent is a scheme-quotient theorem, not surjectivity on Q-points. |
| CG.1 rational representation ring | Existing FGComoduleCat and SplitK0, appropriate essentially-small/monoidal-preadditive glue and dimension homomorphism. Exact-sequence and split relations agree by characteristic-zero semisimplicity. |
| CG.1 standard representation | Right coaction uses matrix columns: δ(e_b)=Σ_a e_a⊗x_ab. Point action, exterior boundaries, tensor degree zero and reciprocal torus weights agree. |
| CG.1 multiplier line | Integer twists use the group-like coefficient s^m; tensor law includes negative twists. The scalar degree of ν is two and ν⁻¹ is absent from nonnegative tensor powers. |
| CG.1 primitive exterior powers | Contraction is ν-valued, with the chosen J pairing and sign. Kernels use the native flat-coalgebra interface; P₀=1, P₁=V. The scalar-action test distinguishes ν from a trivial target. |
| CG.1 primitive exterior decomposition | Lefschetz normalization, surjectivity for 2≤k≤g and splitting give Λ^kV=P_k⊕(ν⊗Λ^(k−2)V). Dimension is binom(2g,k)−binom(2g,k−2), and highest line/dimension identify the fundamental simple module. |
| CG.1 Hom and weight base change | Finite coaction coefficients give a finite linear system; flat extension commutes with its kernel. The infinite-field invertible-locus argument reflects object isomorphisms without classification. The functor does not claim fullness on unextended Hom sets. |
| CG.1 rational irreducible model | The rational tensor highest vector generates a finite coefficient-extraction subcomodule. Complex classification, semisimplicity and the unique top line prove its simplicity; the Cartan step is proved here, not assigned to an upstream layer that does not state it. Hom base change and semisimplicity give absolute simplicity. |
| CG.1 rational highest-weight classification | A finite coaction descends to a finitely generated F/Q inside K, which embeds in C. A simple K-object has a simple F-form; a nonzero descended Hom from a rational model is an isomorphism. Endomorphisms and multiplicities then have the asserted scalar/simple-basis form. |
| CG.1 scalar-extension ring equivalence | The map is induced by the additive strong monoidal functor through native SplitK0 and is bijective on simple classes. No category equivalence is asserted. |
| CG.2 formal torus character | Native internal weight decomposition supplies integral finite support. Biproduct/tensor laws, invariance and evaluation as trace over K-algebras feed the native SplitK0 ring lift. |
| CG.2 character injectivity | In a finite nonzero integer combination of simple characters, choose a maximal highest weight; its coefficient cannot cancel. No finite-group character theorem is substituted. |
| CG.2 fundamental exterior characters | Integer-indexed E_k vanishes outside 0≤k≤2g; F_k=E_k−tE_(k−2). The generating product, F₁, rank-two correction and determinant t^g all agree. |
| CG.2 integral invariant presentation | Reciprocal orbit recurrences give Z[t±1,x_i]; symmetric invariants and the triangular elementary-to-F change of generators work integrally, without Weyl averaging or denominators. |
| CG.2 primitive character identity | The split ν-valued contraction decomposition gives ch(P_k)=F_k, ch(ν)=t and top exterior character t^g. |
| CG.2 rational character isomorphism | Injectivity and the realized polynomial generators t±1,F_k give the canonical full character-ring equivalence and its inverse on representation classes. |
| CG.3 positive Laurent subring | Generator support is exactly m+Σmin(u_i,0)≥0. The normal form uses t^h and positive reciprocal-pair factors; h is superadditive, not additive. Signed coefficients are allowed. |
| CG.3 positive invariant presentation | Nonzero-coordinate flip orbits avoid doubling zero orbits; symmetric invariants and triangular substitution give Z[t,F_1,…,F_g] with independent generators. |
| CG.3 tensor-constituent subring | The subring uses all simple summands of tensor powers, including degree zero, and equals their integer span. It differs from the subring generated only by [V]. |
| CG.3 tensor occurrence criterion | Necessity follows from standard tensor weights: m≥0 and d=2m+Σu_i. Rational Cartan components of primitives and the ν summand supply sufficiency at exactly that degree. |
| CG.3 tensor character isomorphism | Positive support gives containment and primitive/multiplier generators give surjectivity onto positive invariants. The map agrees with the full character equivalence and excludes ν⁻¹. |
| CG.3 integral tensor generation | Primitive classes equal the signed exterior expressions, with negative exterior degree zero. Polynomial independence and inversion of ν recover the full rational ring. |

## Dependencies and pre-existing package corrections

Read the relevant accepted ClassicalGroups link-map contracts. The package
retains the distinctions between algebraic comodules and abstract point-group
representations, between Lie classification and group integrability, and
between root combinatorics and character/dimension theorems. Its eleven
supplier requirements are statements about the existing ClassicalGroups,
ReductiveGroups and LieHighestWeight layers, not new generic theories here.

Two departures from the accepted packet are correct and already documented
by the package author:

- The packet's signed-coefficient test asserts that −(z_i+t/z_i) is invariant
  for arbitrary g. A permutation changes it when g>1. The package instead
  tests −Σ_i(z_i+t/z_i), which is Weyl-invariant and still distinguishes
  exponent positivity from coefficient positivity. Verified this correction
  in the README and actual Lean example.
- The packet imports an arithmetic-statistics matrix-similitude carrier.
  The package represents the same explicit characteristic-zero functor using
  native `Matrix.GeneralLinearGroup` with hJhᵀ=sJ written directly, avoiding
  an unavailable unupstreamed supplier. The coordinate presentation is already
  this roadmap's target. It does not take over general arithmetic-statistics
  matrix-group theory. The packet was left unchanged; future owner/interface
  reconciliation should use this explicit formulation.

The accepted plan records one omission from the suggested file: generic
scheme-level faithfully-flat quotient and representation-descent signatures.
The definitive README specifies the full fppf quotient and full-faithful
pullback/image criterion, with the owning ReductiveGroups layers. The Lean
file explicitly gives only the coordinate map, algebraically closed-field
lift and weight-parity forms. This is the permitted non-exhaustiveness of
prototypes, not an omitted mathematical target or a vacuous Prop surrogate.
No new gap was found and no stage is declared proved.

## Sources and library evidence

Read the public source locations used by the package:

- [Yu, arXiv:1807.04659v5](https://arxiv.org/pdf/1807.04659v5#page=64),
  §7.1, (7.1.1) and Remark 7.1.1, printed p.64: rational algebraic GSp
  characters, the reciprocal Weyl action, exponent support and primitive
  exterior polynomial generators. These are the endpoint assertions, not
  a source for a formalized scheme API.
- [Milne, Algebraic Groups, second edition](https://www.jmilne.org/math/Books/iAG2022.pdf),
  Chapter 22 §a, Theorem 22.2 and complements 22.3–22.6, pp.464–466:
  highest weights, absolute simplicity and scalar extension; 22.12,
  p.466: highest weights under central isogenies. Chapter 22 §c, Lemma 22.39,
  Proposition 22.41 and Theorem 22.42, pp.477–479: semisimplicity and
  characteristic-zero reductivity. The package's finite-equation Hom argument
  and rational-model construction supply their own intervening steps.
- [Sternberg, Lie Algebras, 23 April 2004](https://people.math.harvard.edu/~shlomo/docs/lie_algebras.pdf#page=131),
  §7.9, pp.131–133: the tensor highest component and symplectic fundamental
  modules. Confirmed that the contraction dimension uses j−2 in the second
  binomial coefficient despite the printed 2j−2 slip. The package uses the
  corrected dimension, including dim P₂=5 for g=2.

All three downloaded public PDFs have the exact SHA-256 receipts in the
accepted packet. No restricted-library book or copied source passage was used.

Read all 22 baseline declarations and their hypotheses at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The 13 distinct cited Tau Ceti
source modules in the shared build match their Git blobs at the exact pin;
the Mathlib checkout and manifest match the exact Mathlib pin. In particular,
finite-comodule tensor/braiding universes match, the kernel needs flat
coalgebra/Noetherian-source hypotheses, matrix coefficients require finite
free modules, the exterior character theorem is an abstract GL trace
calculation, and `MvPolynomial.esymmAlgEquiv` is integral. The newly stated
coaction comparison uses the existing native `Comodule.baseChangeCoact`.

Read the reviewed library audit; it contains no direct ClassicalGroupsPartII
entry, so it does not establish this new roadmap's library coverage. Checked
the current roadmap checkout at
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched all 16 suggested files
in the nine named roadmaps added since the atlas snapshot and the current
Tau Ceti library for the GSp/similitude and primitive-exterior targets. No
duplicate of these endpoints was found. The native finite scalar-extension
functor has target SemimoduleCat; it is not the algebraic-representation
base-change functor required here. No build was run in the read-only checkouts.

## Validation

- Final `lean-check research/blueprint/packages/ClassicalGroupsPartII/Suggested.lean`:
  exit 0; 198 admitted-declaration warnings, no errors or other warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalGroupsPartII.json`:
  zero errors and zero warnings. This validates the unchanged input packet.
- Intake `check-files` on the five submitted paths: zero problems. JSON,
  private-path and allowed-file checks pass; `git diff --check` also passes.
- Checked all 26 target anchors, all 76 planned API names and all 58 named
  tests in both package documents; all 18 definition/construction targets
  have at least three mathematical tests. The suggested tests elaborate as
  admitted examples; this is not a claim that their proofs have been completed.
- Independent finite Laurent calculations checked 2,793 weights, ranks 1–3
  and each coordinate −3,…,3, for reflection involution, commutation,
  permutation conjugation, central-degree/cone preservation and the positive
  normal form. Superadditivity was checked on coordinates −1,…,1. Fourteen
  exterior coefficient expansions in ranks 1–4 agree with the displayed
  binomial formula; fundamental invariance, determinant character, rank-two
  primitive dimension, signed-sum correction and wrong-inversion
  counterexample also pass. These finite checks complement the general
  mathematical arguments; they do not prove the arbitrary-rank theorems.

No further correction is required for this package review. The remaining
proof implementation and supplier-interface work is the roadmap's stated
mathematics, not unfinished review work.
