# RT-AUDIT-05 — red team of library audit AUDIT-05

**Result: 40 findings — 3 high, 9 medium, 28 low.** Every cited declaration exists at the pins.
The three high findings each change a status:

- **ConformalMapping L5.** It is marked conditional, but it is proved.
- **ContourIntegration Layer 1.** Two propositions marked built hold only under a basepoint restriction.
- **QuadraticFormInvariants Layer 3.** A lemma marked absent follows from two Mathlib declarations.

**Red team:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1560).

**Target:** `AUDIT-05`, the library audit of five Tau Ceti roadmaps: PolynomialGaloisGroups, QuadraticFormInvariants, ContourIntegration and
OrthogonalL2Bases (both completed), and ConformalMapping.

**Baseline:** tauceti `f790474` and mathlib `082e2d3`, both read at exactly those commits.

**Eligibility:** `cc-2aeb03` wrote neither `AUDIT-05` nor its review.

## Method

- **Every declaration claim.** All 695 `declarations` entries (239 targets, 49 layers) were
  located at the pins. Mathlib was read at `082e2d3`, and Tau Ceti with `git show f790474:<file>`. All exist at the cited line.
  One of them, `TauCeti.Contour.dixonFunction`, is an `irreducible_def`.
- **What each declaration says.** For every target marked `mathlib`, `tauceti` or `partial`, each cited declaration was read at
  the pin and compared with the target and the note: generality, hypotheses, privacy and the `fit` label.
  - For the two completed roadmaps, every `built` claim was checked in particular.
  - The files a `built` claim rests on were checked for `sorry`.
- **The absence claims.** Every target marked `absent` and every `not built` layer was searched for in both libraries under
  other names.
- **Verdicts, summaries and duplicates.** Each layer verdict was checked against its targets, each roadmap summary against its
  layers, and each `duplicates` entry against the atlas.

## Findings


### tauceti:TauCetiRoadmap/PolynomialGaloisGroups — 12 findings (2 medium, 10 low)

- **RT-AUDIT-05/1** (library-claim, medium). The target is marked library 'tauceti' and cites only Tau Ceti declarations, but the invariant itself is already in Mathlib at 082e2d3: Equiv.Perm.partition, whose parts are by definition exactly fullCycleType.
- **RT-AUDIT-05/2** (library-claim, medium). The target is marked 'absent', with the note 'Mathlib has the scalar CRT the layer cites, but nothing lifts it coefficientwise to monic polynomials of a fixed degree.' That is false for the lifting half.
- **RT-AUDIT-05/3** (other, low). The note correctly says that no existence statement is in the baseline.
- **RT-AUDIT-05/4** (error, low). The note identifies the roadmap's resolvent lemma with the wrong declaration: 'The equivariant-surjection remark for resolvents is not separately stated, but it is the restrictDvd_surjective the layer cites.' The lemma says: a surjection Gal p ↠ Gal q whenever the splitting field of q embeds in that of p. restrictDvd_surjective needs q ∣ p, and a resolvent does not divide f. The Mathlib declaration that gives the lemma is Polynomial.Gal.restrict with restrict_surjective, applied to E = p.SplittingField.
- **RT-AUDIT-05/5** (library-claim, low). The target is marked 'both', and Polynomial.Monic.isSquare_discr_iff_range_le_alternatingGroup is cited with fit 'exact' for the parity invariant.
- **RT-AUDIT-05/6** (library-claim, low). The target is marked 'tauceti' (built), but its note concedes that 'the multiset-of-distinct-degrees restatement is not separately named'. That restatement is the milestone itself: when p ∤ discr f every multiplicity is 1, so factorDegrees f p is the multiset of degrees of the distinct factors.
- **RT-AUDIT-05/7** (other, low). Two notes in this layer claim too much.
- **RT-AUDIT-05/8** (error, low). The note says 'Only the two rows that are alternatingGroup and ⊤ are identified with named groups'. Eight of the fourteen rows are in fact identified with named subgroups by simp lemmas.
- **RT-AUDIT-05/9** (other, low). The note's 'Missing' list leaves out one API item the roadmap names, the example 'WreathProduct (ZMod 2) (Fin 2) is dihedral of order 8, and is the Sylow 2-subgroup of S₄'. WreathProduct.lean has only finOneEquiv, emptyEquiv and subsingletonBaseEquiv as examples.
- **RT-AUDIT-05/10** (library-claim, low). Polynomial.Monic.irreducible_of_irreducible_map is cited with fit 'exact' for 'irreducibility mod 2, which gives irreducibility of f over ℚ'. Its conclusion is Irreducible f in R[X], which here is ℤ[X]. Passing to ℚ needs Gauss's lemma, which neither note cites.
- **RT-AUDIT-05/11** (other, low). The note says 'no declaration in either library identifies f.Gal with the automorphism group of the normal closure', which is correct.
- **RT-AUDIT-05/12** (error, low). Two sentences of the roadmap summary do not match the layers.

### tauceti:TauCetiRoadmap/QuadraticFormInvariants — 11 findings (1 high, 2 medium, 8 low)

- **RT-AUDIT-05/13** (library-claim, high). The target is marked library 'absent' with the note 'nothing produces an AlgEquiv from an isometry of binary forms'. That is false at the pin: Mathlib identifies ℍ[R,c₁,c₂] with the Clifford algebra of the binary form c₁x²+c₂y² and turns any isometry into an algebra equivalence of Clifford algebras, so the lemma is a composition of three Mathlib declarations plus a coordinate isometry, over any commutative ring and with no unit or Invertible 2 hypothesis.
- **RT-AUDIT-05/14** (missing, medium). The roadmap's 6A has a milestone 'The square-class dictionary, consumed': the identification Subgroup.square Kˣ = (powMonoidHom 2).range through which the square-class counts and Layer 7A's Kummer isomorphism are read on square classes (contract name square_eq_range_powMonoidHom). The audit has no target for it, and it is built in Tau Ceti, for every commutative group.
- **RT-AUDIT-05/15** (library-claim, medium). The note says the odd-residue case is proved 'with openness and finite index of the power subgroup'. Finite index is not proved: PowerSubgroup.lean proves openness and closedness of (Kˣ)ⁿ and that a subgroup whose index is a unit of 𝒪[K] is open (index ⇒ openness, the converse direction of what the note states). Its docstring says outright that openness does not come from finiteness of the quotient.
- **RT-AUDIT-05/16** (error, low). The target-3 note says 'Tau Ceti's normalizedValuation_irreducible and normalizedValuation_eq_one_iff connect Irreducible to the normalized valuation'. normalizedValuation_eq_one_iff is the unit equation and says nothing about Irreducible.
- **RT-AUDIT-05/17** (missing, low). The note says universality 'follows from represents_hyperbolicPlane through the splitting', which reads as if it were not stated.
- **RT-AUDIT-05/18** (missing, low). The note lists as missing 'the decomposition of a degenerate form with its radical summand q_t' and says 'No totally isotropic subspace of a quadratic form is defined in either library', without citing what exists.
- **RT-AUDIT-05/19** (error, low). The note calls the missing Gram-determinant description 'Mathlib's discr′ in a basis' and cites no Mathlib declaration for it.
- **RT-AUDIT-05/20** (missing, low). The roadmap's Layer 4 prerequisites name '`Ring.toGrothendieckGroup`-style constructions' from Mathlib, and the note says 'no Grothendieck group is formed'. The generic Grothendieck group of a commutative monoid exists in Mathlib, with injectivity for a cancellative monoid and the universal property.
- **RT-AUDIT-05/21** (missing, low). Two Mathlib declarations that shorten these targets are not cited.
- **RT-AUDIT-05/22** (missing, low). 7A's note says 'No hilbert90 or kummerIso exists in either library' and gives the missing Hilbert 90 for G_K as the reason the Kummer isomorphism is absent.
- **RT-AUDIT-05/23** (error, low). The summary's 'one correction to the roadmap's own framing' says 'Layer 2's centrality input is not entirely missing'. Central simplicity of ℍ[K,a,b] is a Layer 5 milestone; the roadmap's Layer 2 says 'Nothing in this layer needs central simplicity, and no milestone here assumes it'. The audit itself files the instIsCentral citation under Layer 5's target 'Quaternion algebras are central simple'. The summary also lists the binary quaternion lemma among absent material only implicitly,…

### tauceti:Completed/ContourIntegration — 4 findings (1 high, 2 medium, 1 low)

- **RT-AUDIT-05/24** (library-claim, high). Both targets are marked library 'tauceti' and the layer 'built', but neither is proved in the stated generality.
- **RT-AUDIT-05/25** (library-claim, medium). The target is marked library 'tauceti' and the layer 'built'. But every cited Tau Ceti declaration is only a 'special case', and the note itself says 'No FTC for an arbitrary primitive along a piecewise-C¹ curve is packaged'. The three ArcFTC lemmas need γ differentiable at every interior parameter, which rules out a piecewise-C¹ curve with a corner.
- **RT-AUDIT-05/26** (other, medium). The roadmap summary opens 'Everything this completed roadmap asks for is built', which does not hold once findings 1 and 2 are applied.
- **RT-AUDIT-05/27** (duplicate, low). The duplicate entry and the target note say the ModularForms development has the ½ and 1/6 winding values 'for the fundamental-domain boundary'. At the pin its values are −1/6 at ρ and ρ+1 and −1/2 at the arc points (i among them), because fdBoundary runs clockwise.

### tauceti:Completed/OrthogonalL2Bases — 6 findings (1 medium, 5 low)

- **RT-AUDIT-05/28** (library-claim, medium). The B2 note says the bridge's coe lemmas mean 'the Hermite and Chebyshev coe_ lemmas are specializations rather than re-derivations, as the layer requires', and the Part C milestone note says nothing about how the basis is assembled.
- **RT-AUDIT-05/29** (library-claim, low). Three fit labels are wrong, in the pattern REV-AUDIT-05 corrected elsewhere (for example 'the operator definitions alone assert nothing'). (a) hermiteOscillatorCLM_apply_hermiteSchwartzMap is labelled 'more general'. It is the same eigen-equation, halved and packaged on 𝒮(ℝ): H = (−d²+x²)/2 with eigenvalue n+1/2. It is not more general.
- **RT-AUDIT-05/30** (other, low). REV-AUDIT-05 removed every private citation, but two notes still present private declarations as available API.
- **RT-AUDIT-05/31** (missing, low). Two targets leave out the declarations that back part of their claim.
- **RT-AUDIT-05/32** (other, low). The absence claim is correct: neither library defines Laguerre or Jacobi polynomials.
- **RT-AUDIT-05/33** (other, low). The summary opens 'Every target of this completed roadmap is in Tau Ceti, sorry-free', but the layer data disagree.

### tauceti:TauCetiRoadmap/ConformalMapping — 7 findings (1 high, 2 medium, 4 low)

- **RT-AUDIT-05/34** (library-claim, high). The target is marked 'partial'. Its note says: 'Missing: injectivity of the continuous extension on the bounding circle ... no theorem in the baseline discharges it for a Jordan domain — so the milestone's "homeomorphism of the closures" is proved only conditionally.' This is false at f790474. Tau Ceti proves boundary injectivity for the Riemann map of a Jordan domain unconditionally, and packages it as the homeomorphism of closures, in TauCeti/Analysis/Complex/Conformal/Jordan/Approach.lean.
- **RT-AUDIT-05/35** (library-claim, medium). The summary says that 'Mathlib still supplies ... plus Complex.exists_injective_not_dense_image_deriv_ne_zero in RiemannMapping.lean'. The L3 note presents the two Mathlib lemmas as holdings Mathlib supplies ('strictly weaker'). At 082e2d3 both are module-private: Mathlib/Analysis/Complex/RiemannMapping.lean is a `module` with no `public section` and no `public` declarations.
- **RT-AUDIT-05/36** (library-claim, medium). The target is marked 'tauceti' (fully provided), and the note says 'Equality anywhere forces the map to be a disc automorphism — the rigidity half the Riemann mapping proof's maximizer argument relies on.' Neither library has the equality case of the derivative form: if ‖f′(z)‖(1−‖z‖²) = 1−‖f z‖² at one z ∈ 𝔻, then f ∈ Aut(𝔻). Tau Ceti has only the inequality, the converse (automorphisms attain equality), and the two-point rigidity from equality of the pseudo-hyperbolic or hyperbolic distance at a pair z ≠ w. Mathlib has only the centre case, through dslope.
- **RT-AUDIT-05/37** (error, low). The citations and the note misdescribe the consumed inputs.
- **RT-AUDIT-05/38** (library-claim, low). Both Mathlib lemmas carry fit 'exact', but they give only continuous branches.
- **RT-AUDIT-05/39** (other, low). The notes understate what Mathlib holds, in three places.
- **RT-AUDIT-05/40** (other, low). The summary misstates two things.


## For the verifier and the fixer

The three high findings were checked at the pins:

- **ConformalMapping L5.** Tau Ceti `f790474` has both theorems at the cited lines:
  - `exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` (`TauCeti/Analysis/Complex/Conformal/Jordan/Approach.lean:213`);
  - `injOn_closedBall_of_isJordanCurve_frontier` (`:198`).

  Neither that file nor the conformal-mapping and Jordan-curve directories contains a `sorry`; the only occurrence of the word
  is in a docstring. The audit relied on an out-of-date docstring in `Caratheodory.lean`.
- **ContourIntegration Layer 1.** Propositions 2.2 and 2.3 carry the hypothesis `γ a ≠ s`. The re-basing lemma that would remove
  it is absent, as the audit's own summary says.
- **QuadraticFormInvariants Layer 3.** Mathlib `082e2d3` has both declarations:
  - `CliffordAlgebraQuaternion.equiv` (`Mathlib/LinearAlgebra/CliffordAlgebra/Equivs.lean:318`), which gives
    `CliffordAlgebra (Q c₁ c₂) ≃ₐ ℍ[R,c₁,0,c₂]`;
  - `CliffordAlgebra.equivOfIsometry` (`Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:382`).

  Chaining them gives an algebra equivalence of quaternion algebras from an isometry of binary forms.

The fixes are to notes, `library`/`fit` labels, cited declarations, the verdicts named in the findings, and the summaries, as
each finding states.
