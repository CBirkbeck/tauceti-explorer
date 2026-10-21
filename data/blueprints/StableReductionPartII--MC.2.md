# Universal curves and the full pointed stable range

This layer identifies the universal stable curve over the stack of ordered stable
`(g,n)`-pointed curves with the stack of `(g,n+1)`-pointed curves. The extra section
before expansion may meet an old marking or a node. The construction inserts a
three-special-point rational tail or bridge in those cases. Together with the
bases `(0,3)`, `(1,1)` and `(g,0)` for `g≥2`, this gives the proper smooth
Deligne–Mumford theorem for every `2g−2+n>0`.

The existing MC.2 polynomial calculations and end targets retain their names.
This continuation supplies the relative algebra, formal comparisons, arbitrary-base
extension and coherent family arguments they need. All statements describe work to
be formalised. An elaborating suggested signature is not a proof of its statement.

## Conventions and existing inputs

Rings are commutative with identity, and ring maps preserve identity. Tensor
products are ordinary algebraic tensor products unless a completion is explicitly
written. Write `M*=Hom_R(M,R)` and use **canonical evaluation** `M→M**`.
Positive Ext means every integer degree `i>0`; in the suggested file it is the
native derived Ext object in `ModuleCat R`, tested by categorical vanishing.

For a coefficient map `A→R`, a fibre at `s∈Spec A` means
`R_s=R⊗_A κ(s)` and `M_s=M⊗_A κ(s)`. In the relative reflexivity definition,
`s` runs over the image of **maximal ideals of R**, which can contain nonclosed
points of `Spec A`. For a local map of local rings, only the closed coefficient
fibre is tested. Finiteness and Noetherianity are hypotheses of the theorems that
use them; they are not smuggled into the absolute predicate.

For a local map `(A,p)→(R,m)`, write `Â` for the `p`-adic completion and `R̂`
for the `m`-adic completion. Their natural continuous map `Â→R̂` is fixed.
Completion of a finite `R`-module means `R̂⊗_R M`, identified with its native
adic completion. The coefficient ideals and chart ideals are distinct.

A stable pointed family is the existing proper flat finitely presented nodal
family with geometrically connected pure one-dimensional fibres, fixed arithmetic
genus, ordered disjoint sections in the relative smooth locus, and relatively ample
log-dualizing line. Morphisms are marking-preserving family isomorphisms, and the
moduli problem is a groupoid-valued pseudofunctor on **all schemes**. The universal
curve groupoid retains one arbitrary additional section. Neither groupoid is
replaced by its set of isomorphism classes.

For a family `C/S`, `D=Σs_i` denotes the old marking divisor and `J=I_Δ`
the ideal of the extra section. The already specified construction is
`K=coker(O_C→J∨⊕O_C(D))`, using the positive diagonal `h↦(h,h)`, and
`C^s=Proj_C Sym K`. The lifted sections come from the two canonical quotient
lines. This uses the Proj representing rank-one **quotients of a coherent sheaf**;
`K` need not be locally free. Import the coherent Grassmannian theorem
`AlgebraicModuliForArithmeticGeometry:R09.1/coherent-grassmannian` rather than a
projective-bundle theorem restricted to finite locally free inputs.

The following are imports, with their original scope.

- Current **StableReduction** Layers 1–3 supply nodal families, geometric graphs,
  duality/degree and relative Proj, polarized descent, ordered pointed stability,
  smooth-section gluing, and the single-marking contraction. Layer 9 supplies
  marking-preserving stabilization and its uniqueness. The locally Noetherian
  cohomology scope is extended here only for the stated finite-presentation family
  constructions, by approximation.
- Current **AlgebraicVectorBundles**, L0A–L0C, supplies internal Hom, quasi-coherent
  modules, invertible sheaves, tensor and symmetric algebras. Its internal-Hom
  pullback comparison is an isomorphism for a finitely presented source and a
  flat pullback, or a finite locally free source and arbitrary pullback. The
  arbitrary-pullback theorem for this non-locally-free section ideal is a new
  relative-reflexivity application, not a consequence of that generic comparison.
- `SchemeAndStackFoundations:SF.0/noetherian-approximation` and
  `/finite-presentation-limits` supply finite-presentation descent and eventual
  preservation of the stated family properties; `/relative-proj-base-change`
  supplies arbitrary relative Proj change. SF.1 owns stacks and their morphism
  properties; SF.4 owns formal completion. R09.6 owns the scheme-point completion
  and versality interfaces. A stack is never assigned a canonical completed local
  ring without a chosen atlas/deformation framing.
- `AlgebraicModuliForArithmeticGeometry:R09.4` supplies the integral one-gon
  Weierstrass presentation, properness and its cusp. These give an independent
  genus-one base. Generalized elliptic curves and their moduli are not rebuilt.
- **StablePeriodicCurved Layer 2** owns the finite-projective totally acyclic
  complex, finitely generated Gorenstein-projective module and ordinary
  complete-resolution comparison. Its current Tau Ceti implementation is
  `TauCeti.Algebra.Homology.TotallyAcyclic`, with
  `CochainComplex.IsTotallyAcyclic` and `TauCeti.IsGorensteinProjective`; that
  module is absent at the programme pin. The absolute Hom/Ext predicate here
  has no finiteness condition, and agrees with the imported predicate for
  finite modules over a Noetherian ring. The new complete-hull target adds
  A-universal exactness and flat cycles to the existing complex. Its
  `coker d^(−1)=Z¹(E)` corresponds to the supplier cycle zero after shifting
  E by one. Ordinary complete resolutions are never rebuilt.
- `DeformationAndDerivedPatchingAlgebra:R03.3` owns the generic local-flatness,
  Gorenstein module duality and coefficient Hom/Ext contracts listed below. The
  complete hull in this layer is doubly infinite; importing a theorem only about
  bounded perfect complexes would not suffice.

The current roadmap checkout inspected is commit
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was also searched at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. AlgebraicVectorBundles is absent
from the atlas snapshot, so it is recorded as a current upstream import rather
than an invented indexed stage or pinned library declaration. The suggested file
uses the programme pins Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`
and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

## Relative algebra and both completions

The nine direct baseline inputs are the native `Module.IsReflexive`,
`Module.bijective_dual_eval`, `Ext`,
`CategoryTheory.ProjectiveResolution.isoExt`,
`isZero_Ext_succ_of_projective`, `Module.Flat`,
`AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`,
`AdicCompletion.flat_of_isNoetherian`, and
`AdicCompletion.residueField_map_bijective`. Their actual statements were read
at the pins. They provide ordinary duality/Ext and one-ring completion; none
already asserts the relative two-base theorem below.

### Stably reflexive module

Target `StableReductionPartII:MC.2/absolute-stable-reflexivity` (definition).

For a commutative ring R and an R-module M, stable reflexivity means that the native evaluation M→M** is bijective and Ext_R^i(M,R)=Ext_R^i(M*,R)=0 for every i>0, where M*=Hom_R(M,R). The predicate itself imposes no finiteness. The finite Noetherian theory below adds those hypotheses explicitly. On finite modules over a Noetherian R this agrees with the existing finitely generated Gorenstein-projective predicate; no second complete-resolution or Gorenstein-projective object is defined here.

**Hypotheses.** R is commutative; M is an R-module.

**API.**

| Name | Required interface |
| --- | --- |
| `isReflexive` | Stable reflexivity implies Mathlib Module.IsReflexive R M, and the induced equivalence is native evaluation. |
| `positiveExt` | Extract each of the two positive-degree Ext vanishings separately. |
| `ofFiniteProjective` | Every finite projective R-module is stably reflexive. |
| `linearEquiv` | An R-linear equivalence M≃N preserves and reflects stable reflexivity, with natural evaluation squares. |
| `dual` | If R is Noetherian and M finite stably reflexive, M* is finite stably reflexive and M** identifies canonically with M. |
| `finiteDirectSum` | For finitely many finite modules over a Noetherian R, their direct sum is stably reflexive exactly when each summand is. |
| `gorensteinProjective_iff` | For a finite module over a commutative Noetherian R, absolute stable reflexivity is equivalent to the existing StablePeriodicCurved Layer 2 Gorenstein-projective predicate. The current Tau Ceti name is TauCeti.IsGorensteinProjective; it is not present at the programme pin. Identify the cycle and cokernel conventions by an explicit degree-one shift. |

**Uses.** `StableReductionPartII:MC.2/relative-stable-reflexivity`: Tests the modules on coefficient fibres. `StableReductionPartII:MC.2/two-base-completion`: Provides the absolute specialization and the dual complete resolution.

**Unit tests.**

- **finite-free-nonreduced.** Over Z/4Z the rank-two free module satisfies the predicate; nilpotents in R do not exclude it.
- **zero.** The zero module is stably reflexive over every commutative ring, including the zero ring.
- **integer-torsion.** Z/2Z as a Z-module is not stably reflexive: its Z-dual is zero, so evaluation to its bidual is not injective.
- **node-nonprojective.** For R=k[x,y]_(x,y)/(xy), the maximal ideal (x,y) is stably reflexive by the parent alternating resolutions and bidual calculation, but is not free or projective: its minimal number of generators is two, while it has rank one on either branch.

**Proof route.**

1. Conjoin the existing reflexivity predicate with categorical vanishing of the two actual positive Ext families.
2. Use native ModuleCat Ext objects; identify their zero objects with vanishing of the underlying module.
3. In the finite Noetherian case, splice the two finite free resolutions to compare with the imported Gorenstein-projective predicate; in the other direction its totally acyclic complex gives the two Ext vanishings and canonical biduality. This is a compatibility theorem, not a new complete-resolution infrastructure.

**Check.** The bidual map must be canonical evaluation. Both positive Ext families, at every degree, are required.

**Inputs.** `mathlib:Module.IsReflexive`, `mathlib:Ext`, `tauceti:TauCetiRoadmap/StablePeriodicCurved#layer-2-self-injective-modules-total-acyclicity-and-singularities`.

**Sources.** [Ile-relative](#sources), Definition 3.1 and Remark 3.2, §3, p. 6. Defines absolute stable reflexivity; for finite modules over Noetherian rings it agrees with Gorenstein dimension zero.; [Ile-relative](#sources), Remark 3.2, p. 6; Proposition 4.3, pp. 9–10. The finite Noetherian absolute theory has Gorenstein dimension zero and a complete projective hull; this identifies it with the imported cycle description.

### Relative stable reflexivity

Target `StableReductionPartII:MC.2/relative-stable-reflexivity` (definition).

For a flat commutative ring map A→R and an R-module M, relative stable reflexivity means: M is flat over A and for each s in the image of MaxSpec R→Spec A, M_s=M⊗_A κ(s) is absolutely stably reflexive over R_s=R⊗_A κ(s). The image consists of contractions of maximal ideals of R, not necessarily maximal ideals of A. The predicate imposes no hidden finiteness.

**Hypotheses.** A→R is flat.

**API.**

| Name | Required interface |
| --- | --- |
| `flat` | Extract A-flatness of M. |
| `fibre` | Extract absolute stable reflexivity of M_s for every s hit by a maximal R-ideal. |
| `localClosedFibre` | For a local map of local rings, the predicate is exactly A-flatness together with stable reflexivity of the closed fibre. |
| `universalCoefficients` | For Noetherian A,R and finite M, the predicate is equivalent to the two canonical coefficient Hom isomorphisms and both positive Ext vanishings for every A-module. |
| `baseChange` | Under the finite Noetherian source hypotheses, every A→A′ preserves relative stable reflexivity, with canonical dual and bidual identifications. |
| `dual` | For Noetherian A,R and finite relative stably reflexive M, its R-dual is finite, A-flat and relatively stably reflexive. |
| `identityMap` | For Noetherian R and finite M relative to R→R, this predicate is equivalent to M being finite projective; its absolute specialization relative to a field remains strictly weaker than projectivity over R. |

**Uses.** `StableReductionPartII:MC.2/polynomial-relative-criterion`: Turns the parent tensor-Hom and Ext calculations into the relative section-ideal theorem. `StableReductionPartII:MC.2/two-base-completion`: Distinguishes original-coefficient and completed-coefficient assertions.

**Unit tests.**

- **identity.** For finite M over a Noetherian A with R=A, relative stable reflexivity is finite projectivity: coefficient flatness is essential.
- **missing-flatness.** For A=R=Z_(2), M=A/(2) fails the predicate although every residue-field fibre is a finite-dimensional vector space.
- **node-family.** Over a field k, the ideal (x,y) in k[x,y]_(x,y)/(xy) is relatively stably reflexive and is not projective over the nodal chart.
- **nonclosed-image.** For A=k[t]_(t), R=k(t), the maximal ideal of R contracts to (0); the definition tests its generic coefficient fibre, even though no maximal ideal of A is hit.

**Proof route.**

1. Use native module flatness and actual scalar extension to residue fields.
2. Take all coefficient points hit by maximal chart ideals; the local specialization is the one closed coefficient fibre.

**Check.** Do not test only maximal ideals of A in the nonlocal version. A-flatness of M is part of the definition, not inferred from geometric flatness of R.

**Inputs.** `StableReductionPartII:MC.2/absolute-stable-reflexivity`, `mathlib:Module.Flat`.

**Sources.** [Ile-relative](#sources), Definition 3.4, §3, p. 6. Specifies flatness and the fibres over the image of maximal chart ideals.; [Knudsen-II-1983](#sources), Appendix, Definition 1 and Theorem 2, pp. 191–194. Supplies the equivalent universal-coefficient formulation in the finite Noetherian setting.

### Universally acyclic complete hull

Target `StableReductionPartII:MC.2/universal-complete-hull` (construction).

For Noetherian A,R, a flat map A→R, and finite relatively stably reflexive M, choose the existing StablePeriodicCurved Layer 2 finite-projective complete complex E with augmentation M≃coker(d_E^(-1)) and the additional coefficient-universality property below. Put (E∨)^i=Hom_R(E^(1−i),R) and d_(E∨)^i=(d_E^(−i))*; there is no alternating sign in this shifted-dual convention. Both E⊗_A N and E∨⊗_A N are exact for every A-module N. Every cycle of E and E∨ is finite over R and flat over A. This is an existence theorem with comparison maps, not a preferred resolution functor. Its underlying complex is the imported totally acyclic complex. Because M=coker d^(−1)≃Z¹(E), E shifted by one has the supplier cycle convention M≃Z⁰(E[1]); the shifted dual here is an explicit reindexing of its ordinary dual.

**Hypotheses.** A,R are Noetherian; R is A-flat; M is finite over R and relatively stably reflexive.

**API.**

| Name | Required interface |
| --- | --- |
| `augmentation` | Retain a specified equivalence coker d^(-1)≃M; exactness identifies it with im d^0. |
| `shiftedDual` | The dual has term Hom_R(E^(1−i),R), differential precomposition by d^(−i), and canonical double-dual comparison. |
| `tensorExact` | For every A-module N both tensor complexes are exact; no flatness of N is assumed. |
| `cyclesFlat` | Each cycle in either complex is a finite R-module flat over A. |
| `baseChange` | Finite projectivity identifies E∨⊗_A A′ with (E⊗_A A′)∨ canonically; the tensor hull augments to M⊗_A A′. |
| `comparison` | A module isomorphism lifts to comparison maps of complete projective hulls, unique up to homotopy when the augmentation is fixed; no strict choice-independence of a chosen complex is asserted. |
| `underlyingTotallyAcyclic` | Forgetting coefficient-universality gives the existing total-acyclicity predicate, with finiteness on every term. The augmentation identifies M with Z¹(E), hence with the supplier Z⁰ of E[1]; no alternate Gorenstein-projective type is introduced. |

**Uses.** `StableReductionPartII:MC.2/two-base-completion`: Finite chart cycles let the local Tor criterion change A-flatness to Â-flatness without tensor-limit interchange. `StableReductionPartII:MC.2/completed-coefficient-hom-ext`: Universal tensor exactness proves both Hom exchange maps and positive Ext vanishing with arbitrary completed coefficients.

**Unit tests.**

- **split-hull.** For finite projective M, the two-term identity complex E^0=M→E^1=M, zero elsewhere, is an exact self-dual hull with coker d^(−1)=M.
- **sign-and-index.** For this two-term hull the shifted dual again occupies degrees 0 and 1; an unshifted dual instead occupies degrees −1 and 0 and fails the pinned convention.
- **one-sided-insufficient.** A projective resolution of Z/2Z over Z placed in degrees ≤0 is not a complete hull: it has nonzero degree-zero homology, and its dual detects Ext^1_Z(Z/2Z,Z).
- **nonflat-coefficient.** Tensor the parent nodal alternating hull over a polynomial coefficient A with N=A/(a), for a nonzero nonunit coefficient a; both complexes remain exact even though N need not be A-flat.
- **finite-terms-essential.** Over a field, add an identity disk on an infinite-dimensional vector space in degrees 3 and 4 to the finite two-term hull of k. The degree-zero cokernel stays k and both complexes stay acyclic, but the result is rejected because those two terms are not finite projective.

**Proof route.**

1. Use the imported finite-projective totally acyclic complex and complete-resolution comparison infrastructure. For the relative existence theorem, splice finite free resolutions of M and M* through evaluation; the new content is universal exactness over A and A-flat cycles, not definition of an ordinary complete resolution.
2. Apply the fibre/coefficient criterion to E and its shifted dual. Exactness after every coefficient tensor makes each short exact sequence of cycles universally exact.
3. Flatness of the finite projective terms over A and the Tor exact sequences give A-flatness of all cycles; finite generation follows from Noetherianity.
4. Record the finite-projective dual-tensor isomorphisms before comparing E∨ with the dual of a base-changed complex.

**Check.** Coker degree −1, not a randomly chosen homology group, is M. All coefficient modules and both complexes must be tested.

**Inputs.** `StableReductionPartII:MC.2/relative-stable-reflexivity`, `mathlib:CategoryTheory.ProjectiveResolution.isoExt`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `tauceti:TauCetiRoadmap/StablePeriodicCurved#layer-2-self-injective-modules-total-acyclicity-and-singularities`.

**Sources.** [Ile-relative](#sources), Definition 4.1, Proposition 4.3 and Remark 4.4, §4, pp. 9–10. Splicing the module and dual resolutions gives a complete hull; its tensor and shifted-dual tensor complexes are exact.; [Knudsen-II-1983](#sources), Appendix, Theorem 2(2), pp. 192–194. Uses a doubly infinite finite locally free complex and its dual with universal coefficient acyclicity.

### Universal coefficient criterion

Target `StableReductionPartII:MC.2/relative-universal-criterion` (theorem).

For Noetherian A,R, A→R flat, and M finite over R, relative stable reflexivity is equivalent to the following for every A-module N: α_N:M*⊗_A N→Hom_R(M,R⊗_A N), f⊗n↦(m↦f(m)⊗n), and β_N:M⊗_A N→Hom_R(M*,R⊗_A N), m⊗n↦(f↦f(m)⊗n), are isomorphisms, and Ext_R^i(M,R⊗_A N)=Ext_R^i(M*,R⊗_A N)=0 for every i>0. It is also equivalent to existence of a universally acyclic complete hull. In particular M and M* are A-flat and M→M** is canonical evaluation.

**Hypotheses.** Noetherian A,R; R A-flat; M finite over R.

**Proof route.**

1. For the fibre definition, use the coefficient cohomology/base-change criterion on finite projective presentations and both resolution complexes; filtered colimits extend finite coefficients to every N.
2. Identify β_N with canonical bidual evaluation followed by the first Hom exchange for M*.
3. Conversely the two exchange maps force M* and M to be A-flat by the same coefficient criterion; change-of-rings for their flat fibres gives biduality and both fibre Ext vanishings.
4. The complete-hull characterization is the splicing theorem and the converse obtained by reading Hom cohomology of the two halves.

**Check.** β_N is evaluation, not an arbitrary isomorphism between modules. Prove the converse without assuming flatness of M beforehand. Native Ext agrees with the explicit projective resolutions.

**Inputs.** `StableReductionPartII:MC.2/relative-stable-reflexivity`, `StableReductionPartII:MC.2/universal-complete-hull`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Sources.** [Ile-relative](#sources), Proposition 3.5, Remark 3.6, pp. 6–8; Proposition 4.3 and Remark 4.4, pp. 9–10. Proves the fibre, universal Hom/Ext and complete-hull characterizations with the Noetherian/coherent hypotheses.; [Knudsen-II-1983](#sources), Appendix, Theorem 2, pp. 192–194. Three equivalent relative stable-reflexivity criteria.

### Base change for relative stable reflexivity

Target `StableReductionPartII:MC.2/relative-arbitrary-base-change` (theorem).

Under the finite Noetherian hypotheses of the universal coefficient criterion, let A→A′ be any ring map, R′=R⊗_A A′ and M′=M⊗_A A′. Then M′ and (M′)* are flat over A′, M′ is relatively and absolutely stably reflexive over R′, and M*⊗_A A′≃Hom_(R′)(M′,R′). Both canonical Hom exchange maps and both positive Ext vanishings hold for every A′-module N′. No Noetherianity or coherence is required of A′ or R′.

**Hypotheses.** A,R Noetherian; R A-flat; M finite relative stably reflexive; A′ arbitrary.

**Proof route.**

1. Base change the complete hull term by term; its finite projective terms have canonical dual-tensor identifications.
2. For any A′-module N′, associativity identifies each new tensor complex with the original one tensored over A with N′.
3. Read the two Hom maps and Ext groups from its augmented halves, and apply again with N′ equal to residue fields.

**Check.** Include nonflat A′ and nonflat N′. The dual map sends f⊗a′ to m⊗b′↦f(m)⊗a′b′; identity and composition squares commute.

**Inputs.** `StableReductionPartII:MC.2/relative-universal-criterion`, `StableReductionPartII:MC.2/universal-complete-hull`.

**Sources.** [Ile-relative](#sources), Proposition 3.5(i)–(iii), pp. 6–7; Proposition 4.3(ii)(b), pp. 9–10. Allows arbitrary coefficient-ring and coefficient-module changes from the Noetherian source.; [Knudsen-II-1983](#sources), Appendix, Proposition 4, p. 194. Relative stable reflexivity is preserved by coefficient base change, including its canonical dual comparison.

### Faithfully flat reflection of stable reflexivity

Target `StableReductionPartII:MC.2/ambient-relative-reflection` (theorem).

Let A,R,T be Noetherian, R flat over A, T flat over R, and M finite over R. Relative stable reflexivity of M over A implies relative stable reflexivity of T⊗_R M over A. If R→T is faithfully flat the converse holds. Absolute stable reflexivity has the same preservation/reflection statement for Noetherian R,T and finite M. Canonical duals and all coefficient Hom/Ext comparison maps are obtained by tensoring finite free resolutions, not by assuming Hom commutes with an inverse limit.

**Hypotheses.** Noetherian rings as displayed; M finite over R; faithful flatness required only for reflection.

**Proof route.**

1. Use degreewise finite free resolutions to compare Hom and Ext after the flat chart extension R→T; compare M* and its bidual by finite-presentation flat Hom base change.
2. For each A-module N identify T⊗_R(R⊗_A N) with T⊗_A N.
3. Flat tensor commutes with homology; faithful flat tensor detects the kernel and cokernel of α_N, β_N and each positive Ext module.
4. Apply the coefficient criterion; the absolute case uses the same calculation with target R and its dual.

**Check.** A flat map alone gives no reflection; include R→0 as a failure test. The all-N assertion uses degreewise finite free terms, not a bounded resolution assumption.

**Inputs.** `StableReductionPartII:MC.2/relative-universal-criterion`, `mathlib:CategoryTheory.ProjectiveResolution.isoExt`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Sources.** [Knudsen-II-1983](#sources), Appendix, Proposition 5 and Proposition 6, pp. 194–195. Localizes the relative condition and compares it with completion.; [Ile-relative](#sources), Remark 3.6, pp. 7–8, and Proposition 4.3, pp. 9–10. Universal-coefficient and complete-resolution criteria yield the displayed ambient flat change and reflection.; [Stacks-completion](#sources), Algebra Lemma 10.97.3, tag 00MC. Provides the faithful flatness needed when the ambient extension is maximal-ideal completion.

### Knudsen completion theorem

Target `StableReductionPartII:MC.2/two-base-completion` (theorem).

Let (A,p)→(R,m) be a flat local homomorphism of Noetherian local rings and M a finite R-module. Write Â=lim A/p^n, R̂=lim R/m^n and M̂=R̂⊗_R M, with the continuous local map Â→R̂. Then R̂ is flat over Â, and the following are equivalent: M is relatively stably reflexive over A; M̂ is relatively stably reflexive over A; M̂ is relatively stably reflexive over Â. These statements use all A-modules and all Â-modules in their respective universal criteria. In each case M̂*=R̂⊗_R M* canonically.

**Hypotheses.** A→R flat and local; A,R Noetherian local; M finite over R; both completions are at the displayed maximal ideals.

**Proof route.**

1. Faithfully flat R→R̂ gives equivalence of the first two conditions and identifies the completed dual by finite-presentation flat Hom base change.
2. Flat A→Â has the same residue field k. For any Â-module B, a free A-resolution of k tensored with Â gives Tor_1^Â(k,B)≃Tor_1^A(k,B). Apply the local Tor criterion to the finite R̂-module B=R̂; its A-flatness proves Â-flatness of R̂.
3. For the second condition take an A-universally acyclic finite projective R̂-hull. Its cycles and shifted-dual cycles are finite R̂-modules and A-flat. Apply the same Tor comparison and local Tor criterion to each cycle, proving Â-flatness. Their short exact cycle sequences stay exact after tensor with every Â-module, so the hull is Â-universal.
4. In the reverse direction a hull universal over Â has Â-flat cycles; restricting along the flat A→Â makes its cycles A-flat, hence makes both complexes universal over A.
5. This supplies the needed completion input by a public local-flatness proof. It does not infer any ordinary tensor/limit interchange for arbitrary completed coefficients.

**Check.** The map Â→R̂ must be the continuous extension of A→R. Check the cycle argument for every integer degree and the shifted dual. No finite-projectivity assumption on completed coefficient modules is allowed.

**Inputs.** `StableReductionPartII:MC.2/ambient-relative-reflection`, `StableReductionPartII:MC.2/universal-complete-hull`, `StableReductionPartII:MC.2/relative-universal-criterion`, `SchemeAndStackFoundations:SF.0/henselization-noetherian`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `mathlib:AdicCompletion.residueField_map_bijective`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Sources.** [Knudsen-II-1983](#sources), Appendix, Proposition 6, pp. 194–195. States the three-way equivalence with both coefficient and chart completion; cites Bourbaki rather than supplying this argument.; [Ile-relative](#sources), Proposition 4.3 and Remark 4.4, pp. 9–10. Supplies the universally acyclic hull and its flat cycle characterization used here.; [Stacks-local-flatness](#sources), Algebra Lemma 10.99.7, tag 00MK. The local Tor test applies to a finite module over the Noetherian local target; it applies to every completed chart cycle.

### Infinitesimal stable-reflexivity criterion

Target `StableReductionPartII:MC.2/infinitesimal-relative-criterion` (theorem).

For a flat local map of Noetherian local rings (A,p)→(R,m), finite R-module M and ideal I⊆p, M is relatively stably reflexive over A if and only if M/I^nM is relatively stably reflexive over A/I^n for every n≥1, with chart ring R/I^nR. This is the local scope of Appendix Proposition 7. A global assertion needs the corresponding Jacobson condition on IR, not just I⊆Jac(A).

**Hypotheses.** Local flat Noetherian A→R; M finite; I⊆p.

**Proof route.**

1. The forward direction is arbitrary coefficient base change.
2. For the reverse direction, all quotient modules are A/I^n-flat. The infinitesimal flatness criterion gives A-flatness of M since IR is in the maximal ideal of R.
3. The n=1 relative condition descends further to the closed coefficient fibre and supplies its absolute stable reflexivity; the local fibre definition now applies.

**Check.** Include I=0 and I=p. Prevent the false nonlocal extension: A=k[t]_(t), R=k(t)[x], I=(t), M=R/(x) has all quotient modules zero but is not relatively stably reflexive.

**Inputs.** `StableReductionPartII:MC.2/relative-arbitrary-base-change`, `StableReductionPartII:MC.2/relative-stable-reflexivity`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Sources.** [Knudsen-II-1983](#sources), Appendix, Proposition 7, p. 195, in the local setup following Proposition 6. States the infinitesimal criterion as an exercise.; [Stacks-local-flatness](#sources), Algebra Lemma 10.99.11, tag 0523. Flatness of every infinitesimal quotient detects flatness at target primes above the ideal; local targets satisfy the required support condition.

### Completed-ring Hom and Ext

Target `StableReductionPartII:MC.2/completed-ring-hom-ext-adjunction` (comparison).

For a flat map of commutative rings R→T, any R-module L, and any T-module V, restriction along L→T⊗_R L gives canonical Hom_T(T⊗_R L,V)≃Hom_R(L,V), f↦(l↦f(1⊗l)). The derived comparison gives Ext_T^i(T⊗_R L,V)≃Ext_R^i(L,V) for all i≥0, because a projective R-resolution remains a projective T-resolution. Apply this to T=R̂ and L=J or J*. For the parent finite-projective completed coefficients, composing with its compatible-quotient Hom comparison identifies actual completed-ring Hom with those families. This comparison makes no claim that arbitrary Ext commutes with inverse limits.

**Hypotheses.** R→T flat; L arbitrary R-module; V arbitrary T-module. For T=R̂, R is Noetherian.

**Proof route.**

1. Use scalar extension/restriction adjunction in degree zero, retaining the explicit 1⊗l formula.
2. Extend a projective resolution of L along the flat map; its augmentation remains exact and its terms are projective after extension.
3. Apply the Hom adjunction degreewise and pass to cohomology; identify the degree-zero map with the explicit one.
4. For finite projective Â-coefficients use the parent inverse-limit equivalence after restriction to R. For other coefficients use the completion theorem instead.

**Check.** The source module is T⊗_R L, not L endowed with an invented completed action. Finite projectivity is required only by the parent compatible-family comparison, not by this Hom/Ext adjunction.

**Inputs.** `mathlib:CategoryTheory.ProjectiveResolution.isoExt`, `StableReductionPartII:MC.2/ambient-relative-reflection`, `StableReductionPartII:MC.2/hom-completion-hom-equivalence`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Sources.** [Ile-relative](#sources), Example 2.6 and Corollary 2.7, §2, pp. 4–5; Remark 3.6, pp. 7–8. Uses projective resolutions to compare fibre/change-of-rings Ext; the displayed flat adjunction is the degreewise specialization.; [Knudsen-II-1983](#sources), Appendix, Theorem 2 and Proposition 6, pp. 192–195. The completed criterion concerns actual duals and Ext over the completed chart ring.

### Arbitrary completed-coefficient exchange

Target `StableReductionPartII:MC.2/completed-coefficient-hom-ext` (theorem).

In the two-base completion theorem, suppose M is relatively stably reflexive over A and put D̂=Hom_(R̂)(M̂,R̂)=R̂⊗_R M*. For every Â-module N, with V=R̂⊗_Â N, the actual R̂-linear maps D̂⊗_Â N→Hom_(R̂)(M̂,V) and M̂⊗_Â N→Hom_(R̂)(D̂,V) are the evaluation isomorphisms, and Ext_(R̂)^i(M̂,V)=Ext_(R̂)^i(D̂,V)=0 for all i>0. All maps are natural in N and in compatible local changes, and compose with completed-ring adjunction to actual Hom_R/Ext_R comparisons.

**Hypotheses.** Flat local Noetherian A→R; M finite relatively stably reflexive; N any Â-module.

**Proof route.**

1. Apply the completion theorem to obtain relative stable reflexivity over Â.
2. Apply its universal coefficient criterion with the actual Â-module N.
3. Identify D̂ with the completed original dual by the flat Hom comparison; use evaluation formulas to check naturality.
4. Use flat adjunction for the comparison with original-ring Hom and Ext.

**Check.** Take N=Â/J for arbitrary ideals J, including nonflat coefficients. No term R̂⊗_A N is substituted for R̂⊗_Â N. No finite presentation of N is assumed.

**Inputs.** `StableReductionPartII:MC.2/two-base-completion`, `StableReductionPartII:MC.2/relative-universal-criterion`, `StableReductionPartII:MC.2/completed-ring-hom-ext-adjunction`.

**Sources.** [Knudsen-II-1983](#sources), Appendix, Theorem 2(1), pp. 192–194, and Proposition 6, pp. 194–195. The universal coefficient formulation after both completions supplies these precise actual-ring conclusions.; [Ile-relative](#sources), Proposition 3.5(iii) and Remark 3.6, pp. 7–8. Identifies the two canonical exchanges and the positive Ext vanishings.

### Relative reflexivity of the polynomial section ideal

Target `StableReductionPartII:MC.2/polynomial-relative-criterion` (application).

For the parent monic polynomial nodal model R=A[X,Y]/(q(X,Y)−q(s,t)), J=(x−s,y−t), with A Noetherian, the actual ideal J and its actual dual D are relatively stably reflexive over A. The two canonical coefficient Hom maps are exactly the parent maps, and their native positive Ext groups vanish against R⊗_A N for every A-module N. Flat local chart extensions and both local completions have the corresponding relative conclusions. The parent polynomial identities over arbitrary A, including the zero ring, retain their original non-Noetherian scope.

**Hypotheses.** A Noetherian for the relative criterion; q=X²+γXY+δY² as in the parent; no condition that δ be a unit.

**Proof route.**

1. Read the parent Hom maps on pure tensors and verify that the second is the canonical coefficient-valued evaluation β_N.
2. Read the parent actual augmented finite-free resolutions and native Ext comparisons, retaining arbitrary coefficient N.
3. Apply the relative criterion once; use the flat reflection and completion theorems for their stated local extensions.

**Check.** The ideal and dual are the native submodule and Hom module, not modules defined from a matrix cokernel alone. Keep the polynomial theorem over non-Noetherian A distinct from the finite Noetherian relative criterion.

**Inputs.** `StableReductionPartII:MC.2/relative-universal-criterion`, `StableReductionPartII:MC.2/ambient-relative-reflection`, `StableReductionPartII:MC.2/two-base-completion`, `StableReductionPartII:MC.2/section-ideal-coefficient-flat`, `StableReductionPartII:MC.2/section-dual-coefficient-flat`, `StableReductionPartII:MC.2/section-dual-coefficient-hom-equivalence`, `StableReductionPartII:MC.2/section-ideal-coefficient-hom-equivalence`, `StableReductionPartII:MC.2/section-ideal-derived-ext-vanishing`, `StableReductionPartII:MC.2/section-dual-derived-ext-vanishing`.

**Sources.** [Knudsen-pointed-node](#sources), Proposition 3.1 and Corollary 3.2, §3, pp. 11–13. Computes the actual section ideal and dual and then passes to complete local rings.; [Ile-relative](#sources), Remark 3.6, pp. 7–8. Matches the parent canonical Hom/Ext calculations with relative stable reflexivity.

## Pointed charts, sheaf duals and arbitrary bases

### Pointed hull and completed family chart

Target `StableReductionPartII:MC.2/pointed-formal-chart-comparison` (comparison).

Let C→Spec A be a flat finitely presented nodal curve over a Noetherian local ring, with section Δ through a node of its closed fibre, and x=Δ(p). After the coefficient and formal coordinate choices of the parent pointed-node hull, the completed local pointed algebra is a continuous pullback of R_pd over A_pd: R̂_x≃Â[[u,v]]/(q̃(u,v)−q̃(s,t)), Δ(u)=s, Δ(v)=t. This is the (p,u,v)-adic completion of the parent polynomial model over Â. The isomorphism sends the actual section ideal to (u−s,v−t), and its actual dual and residue quotient to the completed parent ones. Its maps, rather than its coordinate choices, are the data retained in a comparison. At a smooth point the corresponding chart is Â[[z]], Δ(z)=a. No fine representability or canonical hull ring for a stack is asserted.

**Hypotheses.** C/A nodal and finitely presented; A Noetherian local; x on the section; a coefficient-base map into Â and lifts of the nondegenerate binary quadratic form have been chosen.

**Proof route.**

1. Use the parent pointed-node hull and its small-extension lifting property for the compatible Artinian quotients of the completed family.
2. Choose compatible lifts inductively and pass to continuous maps of complete local rings; the completed curve and section identify with the displayed quotient.
3. Identify it with completion of the actual polynomial ring model, not with an ordinary tensor product of two power-series rings.
4. Apply the finite-module dual/residue completion comparisons and the two-base criterion; use the completed-ring Hom adjunction when switching the ring of linearity.

**Check.** The family base need not map flatly to or from the hull base. The section point has the same residue field as the coefficient point; nonsplit nodes use the quadratic form, not an unjustified split xy model. A hull map is a choice, not a representing universal object for the deformation groupoid.

**Inputs.** `StableReductionPartII:MC.2/pointed-node-normal-form`, `StableReductionPartII:MC.2/two-base-completion`, `StableReductionPartII:MC.2/completed-coefficient-hom-ext`, `StableReductionPartII:MC.2/section-dual-completion-equivalence`, `StableReductionPartII:MC.2/section-dual-quotient-completion-equivalence`, `AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison`, `AlgebraicModuliForArithmeticGeometry:R09.6/completion-versality`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Sources.** [Knudsen-pointed-node](#sources), Proposition 2.1, §2, pp. 5–10; Corollary 3.2, pp. 12–13. Supplies the pointed hull with the two section coordinates, and its completed ideal calculation.; [Ile-relative](#sources), §7, pp. 24–26, application of the pointed local calculation to stabilization. Uses formal local comparisons to transfer the polynomial construction to the family.

### Section ideal of a local Gorenstein family

Target `StableReductionPartII:MC.2/section-ideal-local-theorem` (theorem).

Let (A,p)→(R,m) be a flat local map of Noetherian local rings with a retraction R→A whose composite is the identity, and suppose R/pR is a one-dimensional Gorenstein local ring. For J=ker(R→A), J is relatively stably reflexive over A. Multiplication embeds R in J*=Hom_R(J,R), and J*/R is free of rank one over A, supported on the section. Its generator is a choice, not a canonical trivialization. Duals and this exact quotient commute with arbitrary coefficient base change. In particular this applies at every smooth or nodal point of a section of a Noetherian nodal family.

**Hypotheses.** Local flat Noetherian coefficient map with a specified section retraction; one-dimensional Gorenstein closed chart fibre.

**Proof route.**

1. The exact sequence 0→J→R→A→0 makes J A-flat. On the closed fibre its maximal ideal is maximal Cohen–Macaulay over a one-dimensional Gorenstein ring, hence has canonical biduality and both positive dual Ext vanishings.
2. Apply the relative fibre criterion. The Hom long exact sequence identifies J*/R with Ext_R^1(A,R); fibre duality and coefficient exchange make this an A-free rank-one module locally.
3. A fibre regular element in the section ideal lifts to a nonzerodivisor, proving multiplication R→J* injective.
4. Apply the canonical exchanges for arbitrary coefficients and exactness of the A-flat quotient to obtain the base-change exact sequence.

**Check.** Do not claim the family pairing image J·J*=J. In R=A[x,y]/(xy−bc), Δ(x)=b, Δ(y)=c, the section pullback of J* is A⊕A/(b,c), so the rank-two statement holds only on the persistent nodal-section locus.

**Inputs.** `StableReductionPartII:MC.2/relative-universal-criterion`, `StableReductionPartII:MC.2/relative-arbitrary-base-change`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Sources.** [Ile-relative](#sources), Theorem 6.1(i)–(iv), §6, pp. 18–19; Remark 6.4 and Example 6.5, pp. 20–21. Proves the local Gorenstein section-ideal theorem and corrects the pairing statement over moving families.; [Knudsen-pointed-node](#sources), Main Lemma, p. 3, and §4, p. 13. States the three actual section-ideal properties used by stabilization.

### Global section dual and residue line

Target `StableReductionPartII:MC.2/section-dual-sheaf-gluing` (theorem).

For a nodal family C/S over a locally Noetherian scheme, an arbitrary section Δ with ideal sheaf J has a quasi-coherent dual J∨=Hom_O_C(J,O_C) and an exact sequence 0→O_C→J∨→Δ_*L_Δ→0, with L_Δ invertible on S. These are the actual sheaf dual and quotient, and their formation commutes canonically with every base change S′→S, including non-Noetherian S′. The canonical Hom comparisons agree on chart overlaps, satisfy identity and composition laws, and coincide with the parent polynomial generators wherever those coordinates are chosen.

**Hypotheses.** C/S flat, finitely presented, nodal of pure relative dimension one; S locally Noetherian; Δ arbitrary.

**Proof route.**

1. Use the local Gorenstein theorem at each point on Δ and invertibility of J off Δ. Localize the canonical dual exchange maps on affine charts.
2. The quotient is annihilated by J and hence is Δ_* of an O_S-module. The local rank-one identifications make that module invertible; they are not a chosen global trivialization.
3. Glue actual internal Hom modules by their universal property; polynomial formulas give chart comparisons, while uniqueness gives the cocycle.
4. The local universal coefficient theorem identifies the sheaf pullback dual with the dual of the pulled-back ideal for arbitrary S′; exactness of the quotient is preserved by its coefficient flatness.

**Check.** A residue generator changes by a unit on overlaps and must descend as a line. Arbitrary base change is justified by relative reflexivity; the generic flat-base-change theorem for internal Hom alone is insufficient.

**Inputs.** `StableReductionPartII:MC.2/section-ideal-local-theorem`, `StableReductionPartII:MC.2/pointed-formal-chart-comparison`, `StableReductionPartII:MC.2/relative-arbitrary-base-change`, `SchemeAndStackFoundations:SF.0/finite-presentation-limits`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Sources.** [Knudsen-II-1983](#sources), Lemma 2.2, pp. 175–176; Definition 2.3, p. 176. Uses the section dual, its residue line and their base-change compatibility.; [Knudsen-pointed-node](#sources), Main Lemma, p. 3, and §4, p. 13. Supplies the sheaf form of the ideal, dual and residue assertions.; [Ile-relative](#sources), §7, pp. 24–26. Globalizes the local section-ideal theorem for stabilization.

### Collision chart of pointed expansion

Target `StableReductionPartII:MC.2/old-mark-collision-chart` (construction).

In an étale smooth coordinate neighborhood with old marking z=0 and extra section z=a over a commutative ring A, the parent diagonal-cokernel expansion has the actual presentation Proj_(A[z]) A[z][U,V]/((z−a)U+zV), with U,V in degree one. Its U-chart is z(1+v)=a, v=V/U, and its V-chart is z(u+1)=au, u=U/V. The new marking is v=0,z=a, the old one is u=0,z=0. Over a=0 the exceptional P¹ has new mark v=0, old mark v=∞, and attaching point v=−1. The coordinates are local choices; the scheme is the parent intrinsic Proj construction.

**Hypotheses.** A arbitrary commutative ring; the curve is étale locally the smooth coordinate chart; exactly one old mark can meet Δ because old marks are pairwise disjoint.

**API.**

| Name | Required interface |
| --- | --- |
| `symmetricPresentation` | Identify the intrinsic parent Sym K with A[z][U,V]/((z−a)U+zV), retaining the degree-one quotient generators. |
| `affineCharts` | Export both affine chart rings and the gluing u=v^(−1) on U,V nonzero. |
| `liftedSections` | The new section has [U:V]=[1:0], z=a; the old section has [0:1], z=0. |
| `baseChange` | Every A→B sends a to its image and pulls back both charts, lifted sections and the contraction to Spec A[z]. |
| `exceptionalFibre` | At a=0 the exceptional component z=0 is P¹; its attachment to the retained component is [1:−1]. |
| `coordinateIndependence` | The local presentation isomorphisms respect changes of smooth coordinate and of the two invertible generators because they identify the same quotient K and quotient lines. |

**Uses.** `StableReductionPartII:MC.2/collision-chart-flatness`: Gives coefficient-flat affine covers and distinct smooth lifted sections. `StableReductionPartII:MC.2/pointed-boundary-induction`: The collision divisor supplies an additional boundary branch under the universal-curve identification.

**Unit tests.**

- **a-invertible.** If a is a unit, the two sections are disjoint and the Proj contracts isomorphically to the original smooth chart; no exceptional component occurs.
- **a-zero.** Over a field with a=0, z(U+V)=0 is the union of the retained affine line and the exceptional P¹, meeting at [1:−1].
- **characteristic-two.** Over F₂ with a=0 the attachment is v=1, while the two lifted markings are 0 and ∞; all remain distinct.
- **nilpotent-collision.** For A=k[ε]/(ε²), a=ε, the U-chart is A[z,w]/(zw−ε). It is A-flat although a is a zero divisor; the construction must not require a to be regular.

**Proof route.**

1. Trivialize J∨ by 1/(z−a) and O(D) by 1/z; the diagonal map is the column ((z−a),z).
2. Take the symmetric algebra of this actual cokernel, obtaining the displayed linear homogeneous relation.
3. Dehomogenize and read the quotient lines defining the lifted sections.
4. Glue the two charts; changing the generators multiplies the homogeneous coordinates by units, yielding the same intrinsic expansion.

**Check.** The signs must match the parent positive diagonal map. The three special points on the exceptional line remain distinct in characteristic two.

**Inputs.** `StableReductionPartII:MC.2/expansion`, `StableReductionPartII:MC.2/section-dual-sheaf-gluing`, `SchemeAndStackFoundations:SF.0/relative-proj-base-change`, `AlgebraicModuliForArithmeticGeometry:R09.1/coherent-grassmannian`.

**Sources.** [Knudsen-II-1983](#sources), Definition 2.3 and Theorem 2.4, pp. 176–177, smooth/collision case. The diagonal-cokernel Proj inserts a three-special-point rational tail at an old-mark collision.; [Knudsen-pointed-node](#sources), Theorem 5.1 and opening of its proof, pp. 13–14. States stable pointed expansion but leaves the smooth and collision calculations to the reader and refers to the original proof. The displayed signed chart is derived here from the diagonal cokernel in Knudsen II Definition 2.3 and Theorem 2.4, pp. 176–177.

### Flatness at an old-mark collision

Target `StableReductionPartII:MC.2/collision-chart-flatness` (theorem).

The collision Proj is flat and finitely presented over every coefficient ring A. Its geometric fibres are nodal, its two lifted markings are smooth and disjoint, and the collision fibre has the same arithmetic genus as the original curve. For a=0 the inserted rational tail has exactly the old mark, the new mark and its attachment as special points.

**Hypotheses.** The collision chart and its intrinsic gluing are as specified; no flatness or regularity is imposed on a.

**Proof route.**

1. On D_+(U), write w=1+v: the ring A[z,w]/(zw−a) is A-free with the normal-form basis 1,z^i,w^j for i,j≥1.
2. The rest is covered in D_+(V) by u+1 invertible, where z=au/(u+1) and the ring is A[u,(u+1)^(−1)]. These two opens cover because outside U one has u=0.
3. At the new and old sections the relative Jacobian in z is a unit; the sections are disjoint since their homogeneous coordinates differ.
4. Use the fibre union and normalization exact sequence to read nodality and genus, and the three flags to read stability of the tail.

**Check.** The affine cover is displayed and is valid over nonreduced A. The new marking is not the attaching point; its smoothness is a relative assertion.

**Inputs.** `StableReductionPartII:MC.2/old-mark-collision-chart`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

**Sources.** [Knudsen-II-1983](#sources), Theorem 2.4, pp. 176–177. Collision stabilization inserts a rational tail and gives a stable flat family.; [Knudsen-pointed-node](#sources), Theorem 5.1 and opening of its proof, pp. 13–14. Asserts the stable-family result and omits the smooth-point calculation. The explicit coefficient-free affine cover and normal-form flatness proof are deductions here from the preceding collision presentation, rather than calculations printed in this theorem.

### Flatness transfer from the pointed formal chart

Target `StableReductionPartII:MC.2/formal-proj-flatness-transfer` (theorem).

For the Noetherian pointed nodal family, C^s=Proj_C Sym K is flat over the coefficient base near the preimage of a nodal section point. The completed family comparison identifies its formal affine charts with completed base changes of the parent polynomial expansion charts. This is a statement about actual local rings of the intrinsic Proj. It uses neither algebraization of an arbitrary formal scheme nor excellence of the coefficient ring.

**Hypotheses.** Noetherian local coefficient base; finitely presented nodal curve with section; the intrinsic finite-presentation sheaf K and the pointed formal comparison.

**Proof route.**

1. On a distinguished affine H of the actual Proj over the local chart R, the formal ring is lim H/m^kH, where m is the maximal ideal of R at the section point. This is completion along the inverse image of that point. Use Sym/Proj base change and then complete this affine ring; a polynomial algebra over R̂ is not itself presumed complete.
2. The pointed formal comparison identifies these rings with the (p,u,v)-adic completions of the parent polynomial expansion charts over Â. The first polynomial chart has monic leading term vy²; the complementary localization of the second is a polynomial localization. Their explicit parent normal forms give Â-flatness before completion.
3. All these polynomial charts are Noetherian. Their displayed ideal-adic completions are flat over them and hence Â-flat. At a point under test, localize in the compared formal charts and complete once more at its maximal ideal; this yields the same maximal-ideal completion B̂ of the actual Proj local ring B. No ordinary tensor product of power-series rings is used.
4. The resulting B̂ is Â-flat and hence A-flat. Since B→B̂ is faithfully flat, descend A-flatness to B. Away from the exceptional locus the intrinsic Proj is the original curve. This uses only completions of actual Noetherian rings and requires no algebraization of an arbitrary formal scheme.

**Check.** Distinguish completion after coefficient base change from a bare tensor product with R_pd. State the ideals of formal completion on each distinguished affine and then localize at the point under test. Together with the collision calculation, cover every possible location of Δ.

**Inputs.** `StableReductionPartII:MC.2/pointed-formal-chart-comparison`, `StableReductionPartII:MC.2/section-dual-sheaf-gluing`, `StableReductionPartII:MC.2/two-base-completion`, `SchemeAndStackFoundations:SF.0/relative-proj-base-change`, `SchemeAndStackFoundations:SF.0/henselization-noetherian`, `SchemeAndStackFoundations:SF.4/formal-completion`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `StableReductionPartII:MC.2/section-dual-presentation`.

**Sources.** [Knudsen-pointed-node](#sources), Theorem 5.1, especially the flatness argument, pp. 14–16. Transfers the explicit nodal affine-chart calculation through the completed pointed local model.; [Ile-relative](#sources), §7, pp. 24–26. Discusses the formal local reduction of stabilization to these charts.; [Stacks-completion](#sources), Algebra Lemma 10.97.3, tag 00MC. Faithfully flat local completion reflects module flatness.

### Approximation of pointed nodal families

Target `StableReductionPartII:MC.2/arbitrary-base-family-approximation` (theorem).

For every scheme S, a stable pointed family C/S and one arbitrary additional section admit, locally on affine S, a model over a finite-type Z-algebra A₀ with a stable pointed nodal family, its ordered markings and additional section. Any finite collection of family isomorphisms and their equations descends after enlargement of A₀. The actual section ideal, its dual, residue line, diagonal cokernel, symmetric algebra and Proj are canonically the pullbacks of the corresponding Noetherian-model objects. Two models give the same comparisons after a common enlargement. No global qcqs hypothesis is imposed on S.

**Hypotheses.** C/S proper, flat and finitely presented, with pure one-dimensional geometrically connected nodal genus-g fibres; ordered disjoint smooth old markings; log-dual relatively ample; arbitrary Δ.

**Proof route.**

1. On an affine base descend the finitely presented curve, all sections and the invertible log-dual line. Use the limit property theorems for properness, flatness, syntomic nodality and disjoint smooth markings, and the parent fibre/ample criteria for genus and stability.
2. The section ideal pulls back exactly: in 0→J→O_C→Δ_*O_S→0, the quotient is S-flat. Over the Noetherian model J is finitely presented, and its actual dual commutes with every coefficient pullback by the relative theorem.
3. Pull back the residue line and the finite diagonal-cokernel presentation. Sym and Proj commute with coefficient change by their existing universal properties.
4. Descend morphisms and equations by the finite-presentation limit theorem; compare two choices after a common enlargement. Glue over affine covers and their refinements using the canonical comparisons.

**Check.** A finite-presentation module can have a dual that fails arbitrary base change in general; the section-ideal theorem is the essential extra input. Do not replace the infinite graded contraction ring by an unjustified interchange of an infinite limit: use the parent finite Veronese presentation. A non-qcqs base is handled by local affine constructions and descent.

**Inputs.** `SchemeAndStackFoundations:SF.0/noetherian-approximation`, `SchemeAndStackFoundations:SF.0/finite-presentation-limits`, `StableReductionPartII:MC.2/section-dual-sheaf-gluing`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

**Sources.** [Knudsen-II-1983](#sources), §2, pp. 171–179, especially the base-change claims in Definition 2.3 and Corollary 2.6. The geometric constructions are natural over family bases; this theorem supplies their explicit approximation extension.; [Ile-relative](#sources), Proposition 3.5, pp. 6–7, and §7, pp. 24–26. Arbitrary coefficient change of the section dual is the local algebra input; the approximation part is a deduction using the cited foundational suppliers.

### Expansion over arbitrary schemes

Target `StableReductionPartII:MC.2/expansion-over-arbitrary-bases` (theorem).

The existing intrinsic diagonal-cokernel construction defines stable (g,n+1)-pointed expansion over every scheme S for each stable pair (g,n), including old-mark collisions and nodal sections. The result is proper, flat and finitely presented over S, of the same genus, with disjoint smooth lifted markings and positive log-dual degree on every geometric component. Its canonical base-change and pointed-isomorphism comparisons satisfy the identity and composition cocycles. The new section is not required to be smooth or disjoint before expansion.

**Hypotheses.** Stable (g,n)-pointed C/S; 2g−2+n>0; arbitrary extra section Δ.

**Proof route.**

1. Work over a Noetherian model. The complement of Δ is unchanged; the smooth disjoint case is an isomorphism, the collision case is the displayed tail chart, and the node case is the formal-transfer chart.
2. These charts prove flatness, nodality, smoothness/disjointness of lifted marks and the geometric three-flag description. The graph/genus and componentwise degree formulas prove same genus and stability.
3. Pull back to an arbitrary base using the approximation theorem, then glue across affine charts.
4. All comparisons arise from the canonical sheaf dual, cokernel, Sym and Proj maps, so their identity and composition laws follow from those universal properties.

**Check.** Include all three fibre types in a single construction. Retain automorphisms of the original pointed family and naturality on their isomorphisms.

**Inputs.** `StableReductionPartII:MC.2/arbitrary-base-family-approximation`, `StableReductionPartII:MC.2/collision-chart-flatness`, `StableReductionPartII:MC.2/formal-proj-flatness-transfer`, `StableReductionPartII:MC.2/expansion`, `SchemeAndStackFoundations:SF.0/relative-proj-base-change`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

**Sources.** [Knudsen-II-1983](#sources), Definition 2.3 and Theorem 2.4, pp. 176–177. Defines expansion and identifies its stable pointed fibres.; [Knudsen-pointed-node](#sources), Theorems 5.1 and 5.2, pp. 13–16. Verifies flatness and the functorial stable-family construction.

### Recovery of a contracted pointed family

Target `StableReductionPartII:MC.2/contraction-recovery-comparison` (comparison).

Let Y/S be stable (g,n+1)-pointed, and let q:Y→C be the parent contraction after omitting its last marking, with 2g−2+n>0. Let Δ be the image of the omitted mark. There is a unique pointed isomorphism Y≃C^s over C compatible with q, the lifted old markings and the last marking. It is natural in family isomorphisms and every base change. The only contracted component is the rational three-flag tail or bridge rendered unstable by removal of that one marking; no stable component is contracted.

**Hypotheses.** Parent single-mark contraction with its universal structure-sheaf and base-change properties; stable source and stable retained pair.

**Proof route.**

1. Use the parent contraction and componentwise log-dual degrees to classify its exceptional fibre: collision tail, nodal bridge, or none.
2. Write D for the old divisor on C, D_Y for the retained divisor on Y and l for the last section. The fibrewise tail/bridge calculations and cohomology/base change give q_*O_Y(l−D_Y)≃J∨(−D). The evaluation diagram identifies q_*O_Y(l) with K(−D), not K itself, and gives q^*K(−D)→O_Y(l) surjective. Tensor by q^*O_C(D), or use Proj Sym K(−D)≃Proj Sym K, to obtain the map Y→C^s with the specified quotient lines. Keep the signs compatible with the positive diagonal.
3. The map preserves all quotient lines and is an isomorphism on geometric fibres, hence is quasi-finite. It is proper because Y is proper over S and C^s is separated over S, and is therefore finite. For a finite map between S-flat finitely presented curves, fibrewise isomorphism makes its structure-sheaf map an isomorphism by Nakayama and coefficient-flatness.
4. The quotient universal property and the contraction factorization property give uniqueness. Prove over Noetherian models and descend to arbitrary S.

**Check.** Verify the sheaf comparison and the induced evaluation quotient, not only a bijection on geometric points. Include an omitted marking on a rational bridge and one colliding with an old marking. Retain the twist K(−D) in the recovery evaluation diagram; its Proj is canonically the same as that of K.

**Inputs.** `StableReductionPartII:MC.2/expansion-over-arbitrary-bases`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `tauceti:TauCetiRoadmap/StableReduction#layer-9-marked-stabilization-and-stable-pointed-reduction`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `StableReductionPartII:MC.2/forget`, `AlgebraicModuliForArithmeticGeometry:R09.1/coherent-grassmannian`.

**Sources.** [Knudsen-II-1983](#sources), Lemma 2.5 and Corollary 2.6, pp. 178–179. Constructs the unique map from a contraction back to the intrinsic expansion and proves the inverse comparisons.; [Knudsen-pointed-node](#sources), Theorem 5.2, p. 16. States functoriality of stabilization. The inverse comparison comes from Knudsen II Lemma 2.5 and Corollary 2.6, not from this later theorem alone.

### Coherent universal-curve equivalence

Target `StableReductionPartII:MC.2/universal-curve-coherent-equivalence` (comparison).

The imported morphisms s:Z̄_(g,n)→M̄_(g,n+1) and c:M̄_(g,n+1)→Z̄_(g,n) form an equivalence of groupoid-valued pseudofunctors over M̄_(g,n) on all schemes. The natural isomorphisms cs≅id and sc≅id are the pointed recovery maps; they commute with pullback, satisfy both triangle identities, and respect reindexing of retained markings. For a family C/S classified by S→M̄_(g,n), the two-fibre product S×_(M̄_(g,n)) M̄_(g,n+1) is canonically the actual curve C. The structural projection is proper flat nodal, and the n old marking loci are actual sections of this universal curve.

**Hypotheses.** g,n≥0, 2g−2+n>0; imported curve-moduli groupoids and their coherent pullback.

**Proof route.**

1. Apply the recovery comparison to sc; contracting the intrinsic expansion recovers the original family and its arbitrary extra section, giving cs.
2. Uniqueness of pointed recovery over the contraction makes the two unit/counit composites agree, proving triangle identities and all pullback squares.
3. The universal-curve moduli problem represents arbitrary sections of C_T; the equivalence identifies its groupoid with the two-fibre product.
4. Transport the actual proper flat nodal curve morphism and marking sections through this equivalence.

**Check.** Automorphism groups are preserved; do not pass to isomorphism classes. At a fibre node the projection is nodal, not smooth. Iterated forgetting is compared over the final contraction, with permutation and pullback compatibility.

**Inputs.** `StableReductionPartII:MC.2/contraction-recovery-comparison`, `StableReductionPartII:MC.2/expansion-over-arbitrary-bases`, `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.0/pullback-coherence`, `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.0/effective-descent`.

**Sources.** [Knudsen-II-1983](#sources), Corollary 2.6, p. 179. Identifies the two operations as inverse and hence identifies the universal stable curve with the next pointed moduli stack.; [Knudsen-pointed-node](#sources), Theorem 5.2, p. 16. Supplies the functorial stabilization operation. Its coherent inverse is justified here by the original recovery lemma and Corollary 2.6 together with uniqueness, rather than attributed to this theorem.

## Genus one, induction and the rigid triangle

### Stable genus-one curves and one-gons

Target `StableReductionPartII:MC.2/stable-onepointed-onegon-comparison` (comparison).

For every scheme S, forgetting the generalized elliptic action gives an equivalence from the imported one-gon generalized elliptic groupoid E₁(S) to the groupoid of stable one-pointed genus-one curves over S. The inverse uses the unique group law on the relative smooth locus with the mark as identity, and its unique extension action on the cubic. It commutes with arbitrary pullback. Consequently M̄₁,₁ is proper smooth Deligne–Mumford over Z of relative dimension one; its reduced boundary is the smooth Cartier stack B(C₂). This proof is independent of the triangle embedding.

**Hypotheses.** Stable pointed genus-one family; the ordered single mark is relatively smooth.

**Proof route.**

1. The total log-dual degree is 2g−2+n=1. Positivity on each geometric component forces one component: a smooth genus-one curve or an irreducible rational nodal curve.
2. The degree-three marked polarization gives the relative noncuspidal Weierstrass cubic locally on S. Use the existing integral Weierstrass presentation and its coordinate-change group; its generalized elliptic law is uniquely recovered from the pointed cubic.
3. The coordinate comparisons descend and are compatible with all pullbacks, identifying the two groupoids and preserving their automorphisms.
4. Import properness, smoothness, DM and the one-gon cusp from the arithmetic-moduli nodes; no new construction of generalized elliptic curves is made here.

**Check.** Exclude polygons with more than one component: unmarked components have log degree zero and are not stable. The nodal cusp retains the inversion automorphism; it is B(C₂), not Spec Z. The Weierstrass discriminant boundary remains valid in characteristics two and three.

**Inputs.** `StableReductionPartII:key/moduli-curves`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-onegon-weierstrass`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-proper`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-dm-locus`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-cusp`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `StableReductionPartII:MC.2/arbitrary-base-family-approximation`.

**Sources.** [Knudsen-II-1983](#sources), Theorem 2.7 and its genus-one argument, p. 179. Requires the genus-one pointed base; the displayed independent route uses the existing one-gon supplier instead of deriving it from a triangle.; [Ile-relative](#sources), §7, pp. 24–26, use of stable pointed families and section-preserving functoriality. Supports the pointed-family comparison convention; the group-law and properness inputs are precisely the imported arithmetic-moduli nodes.

### Universal-curve induction

Target `StableReductionPartII:MC.2/pointed-stack-induction-step` (theorem).

Suppose for a stable pair (g,n) the imported M̄_(g,n) is smooth proper DM over Z, of relative dimension d=3g−3+n, and its nodal deformations have independent smoothing coordinates with reduced normal-crossings boundary. Then M̄_(g,n+1) has the same properties with dimension d+1. Over a point at an old node, the universal curve replaces its base coordinate t₁ by xy=t₁, so x and y are the two smoothing coordinates of the expanded bridge. Over an old-mark collision its new tail has smoothing coordinate a transverse to the old boundary. This is an induction theorem, not an assertion that the universal projection is smooth.

**Hypotheses.** The stated smooth proper DM and independent-node-coordinate hypotheses for (g,n); 2g−2+n>0.

**Proof route.**

1. Representability of the universal-curve morphism transfers DM algebraicity from the base and gives properness by composition; its relative dimension is one.
2. On a smooth atlas at a point away from an old node, the universal curve is smooth relative dimension one. At an old node its local deformation equation is xy=t₁; eliminating the independent parameter t₁ proves smoothness of the total space over Z.
3. At a collision, the explicit tail chart identifies the new node parameter with the transverse coordinate a; at an old node the bridge chart identifies its two node parameters with x,y. Retain every other old node coordinate.
4. Thus the boundary coordinates remain independent, and the complement of their zero loci is the dense smooth-family open. Use the same atlas and the formal-to-étale coordinate comparison already required by MC.1, rather than infer étale normal crossings from arbitrary formal equations.

**Check.** Dimension increases by one, including g=0 and g=1. The nodal universal projection remains nonsmooth at xy=t₁ with x=y=0. Prove smoothness and the node-coordinate hypothesis together in the induction.

**Inputs.** `StableReductionPartII:MC.2/universal-curve-coherent-equivalence`, `StableReductionPartII:MC.2/collision-chart-flatness`, `StableReductionPartII:MC.2/old-mark-collision-chart`, `StableReductionPartII:MC.2/formal-proj-flatness-transfer`, `StableReductionPartII:MC.1/versal-node-parameters`, `StableReductionPartII:MC.1/normal-crossing-boundary`, `SchemeAndStackFoundations:SF.1`.

**Sources.** [Knudsen-II-1983](#sources), Theorem 2.7, p. 179. Uses universal-curve induction for the full pointed stable range and its boundary.; [Knudsen-pointed-node](#sources), Proposition 2.1 and Theorem 5.1, pp. 5–10 and 13–16. Supplies the local pointed node and bridge calculations needed to track smoothing coordinates.

### Boundary under forgetting a mark

Target `StableReductionPartII:MC.2/pointed-boundary-induction` (comparison).

Under the universal-curve equivalence, the reduced boundary divisors satisfy B_(g,n+1)=π*B_(g,n)+Σ_(i=1)^n s_i(M̄_(g,n)) as relative effective Cartier divisors on the universal curve. The first term records old nodal fibres; the extra n section divisors record new old-mark collision tails. At a universal point on the j-th old node, t_j=xy and a local boundary equation becomes xy∏_(k≠j)t_k; at an old marking a local equation is a∏_k t_k. These are normal crossings étale locally, without asserting globally simple normal crossings.

**Hypotheses.** The induction-step hypotheses, and reduced boundary with independent smoothing coordinates; ordered disjoint old markings.

**Proof route.**

1. A new expanded family is nodal exactly when the old curve was nodal or the extra point meets an old mark.
2. The local smoothing calculations give multiplicity one for every component and identify the Cartier equations.
3. Old markings lie in the smooth locus and are disjoint, so their new divisors are smooth relative to the base and meet only the old boundary branches transversely.
4. Use the independent coordinates on a smooth atlas to descend relative normal crossings.

**Check.** For (g,n)=(0,3), the old boundary is empty but the new boundary has three components. Do not omit the section terms or call the global boundary simple.

**Inputs.** `StableReductionPartII:MC.2/pointed-stack-induction-step`, `StableReductionPartII:MC.2/old-mark-collision-chart`, `StableReductionPartII:MC.2/universal-curve-coherent-equivalence`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Sources.** [Knudsen-II-1983](#sources), Theorem 2.7, p. 179, boundary induction. Describes the next boundary as old-boundary inverse image together with the canonical section loci.

### Recovery of the labelled rational triangle

Target `StableReductionPartII:MC.2/labelled-triangle-family-recovery` (theorem).

Let E/Z be the fixed three-pointed rational triangle of the parent target, and let ι attach its mark P₁ to a stable one-pointed genus-one family F, retaining P₂,P₃. For every scheme S, each isomorphism of the resulting ordered two-pointed genus-two families lifts uniquely to an isomorphism of the original F families and the identity on E_S. Recovery and its comparisons commute with arbitrary base change, including nilpotent thickenings. Hence ι is a representable monomorphism. Using the independent genus-one properness theorem and separatedness of M̄₂,₂, it is a proper monomorphism and therefore a closed immersion.

**Hypotheses.** E is the fixed labelled triangle, not an arbitrary three-pointed genus-one curve; the target retains the ordered P₂,P₃; S arbitrary.

**Proof route.**

1. For a glued family identify the three triangle components by their labelled graph and the two retained markings; the attachment is the unique separating edge adjacent to the unmarked triangle vertex. This graph identification is invariant under every pointed isomorphism.
2. The four persistent nodes are actual sections of the relative singular scheme. For a proper nodal curve this scheme is finite unramified over S. Its open diagonal makes two sections agreeing on all geometric fibres equal even over nilpotent bases. Thus a pointed family isomorphism preserves these four singular sections scheme-theoretically, not just as vertices of fibre graphs.
3. Cut the four selected nodes by the canonical finite algebra End(I), where I is their ideal. On an étale persistent-node chart R=A[x,y]/(xy), I=(x,y), this algebra is A[x]⊕A[y]; its equal-constant subalgebra is R. The completed version is A[[x]]⊕A[[y]]. Away from the selected sections I is the unit ideal, so End(I)=R. These calculations glue and commute with coefficient change, giving a partial normalization only at the selected nodes. Every isomorphism preserving I lifts canonically to this cut; this is not normalization of the whole nonreduced family.
4. Each recovered rational component has three labelled disjoint smooth sections, so the imported genus-zero base identifies it uniquely with P¹; thus its automorphism is the identity. The remaining component with its recovered attachment mark is F.
5. Glue the local recovery maps uniquely by the pushout property and descend from Noetherian models; this proves full faithfulness over arbitrary S, not only on geometric points.
6. A monomorphism of these algebraic stacks is representable. Properness of the source over Z and separatedness of the ambient target make this map proper; a proper representable monomorphism is a closed immersion.

**Check.** Include F nodal: its self-node is not among the four nodes cut out. Include nonreduced bases; fibre graph uniqueness by itself is insufficient. Fixing P₂,P₃ individually excludes reversal of the triangle.

**Inputs.** `StableReductionPartII:MC.2/stable-onepointed-onegon-comparison`, `StableReductionPartII:MC.2/universal-curve-coherent-equivalence`, `StableReductionPartII:MC.2/arbitrary-base-family-approximation`, `StableReductionPartII:MC.2/higher-genus-pointed`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `SchemeAndStackFoundations:SF.1`, `StableReductionPartII:MC.2/genus-zero-base`.

**Sources.** [Knudsen-II-1983](#sources), Theorem 2.7 and Figure 4, p. 179; Theorem 3.4, pp. 181–183. Uses the rigid triangle for the genus-one base and gives the smooth-section pushout used for family recovery.; [Knudsen-II-1983](#sources), Theorem 3.7, pp. 187–190, with the corrected nodal-section pairing scope. Provides the labelled rational-component recovery pattern. The present persistent-node argument does not use its erroneous unrestricted pairing equality.; [Stacks-nodal-singular-scheme](#sources), Algebraic Curves Lemma 53.20.1, tag 0C58. Nodality makes the Fitting singular scheme unramified over the base; properness then makes this closed singular scheme finite.; [Stacks-unramified-diagonal](#sources), Morphisms Lemma 29.36.13, tag 02GE. The open diagonal detects equality of singular sections from their agreement at every geometric point, including over nonreduced bases.

### Four fixed triangle smoothing parameters

Target `StableReductionPartII:MC.2/triangle-smoothing-comparison` (comparison).

At a geometric point in the labelled triangle immersion, choose the independent ambient M̄₂,₂ node-smoothing coordinates. Its formal image is defined by the vanishing of the four coordinates for the three internal triangle nodes and the attachment. The remaining parameter is free. If F is nodal, it is precisely its fifth ambient node-smoothing parameter and cuts out the boundary of M̄₁,₁; if F is smooth it is the one-dimensional smooth deformation coordinate. After the MC.1 formal-to-étale comparison these equations describe the image étale locally. There is no assertion that the fifth parameter vanishes on the whole image.

**Hypotheses.** Geometric pointed triangle point; specified branches of the four persistent nodes; independent ambient node parameters on a smooth atlas.

**Proof route.**

1. The three rational triangle components have three labelled flags each and thus no moduli; retain their four gluing nodes unsmoothed.
2. Cutting those nodes as in the family-recovery theorem identifies their equisingular deformation groupoid with the one-pointed genus-one deformation groupoid.
3. The ambient independent-node deformation ring therefore restricts by setting exactly those four parameters to zero; the source dimension one accounts for the remaining coordinate.
4. At a nodal F its own self-node is left free, so its parameter is the source cusp parameter. Apply the same formal-to-étale supplier as the ambient boundary theorem.

**Check.** The ambient relative dimension is five and the source relative dimension is one. At nodal F count five nodes, of which exactly four are fixed. Compare deformation groupoids with automorphisms, not only their tangent spaces.

**Inputs.** `StableReductionPartII:MC.2/labelled-triangle-family-recovery`, `StableReductionPartII:MC.2/stable-onepointed-onegon-comparison`, `StableReductionPartII:MC.1/versal-node-parameters`, `StableReductionPartII:MC.1/normal-crossing-boundary`, `StableReductionPartII:MC.2/pointed-stack-induction-step`.

**Sources.** [Knudsen-II-1983](#sources), Theorem 2.7, Figure 4 and final local argument, p. 179. The fixed triangle and its attachment give the rigid genus-one locus; the four/five-node count is the explicit graph calculation.

## Imported milestones and worked consequences

The parent target IDs below remain the owners of these results. The new
induction step and comparisons supply their proof routes; they are not duplicate
end-theorem nodes.

| Milestone | Exact result and proof use |
| --- | --- |
| `StableReductionPartII:MC.2/genus-zero-base` | `M₀,₃=M̄₀,₃=Spec Z`; the unique ordered three-pointed rational family is `(P¹;0,1,∞)`. In a genus-zero stable dual tree, `Σ_v(val(v)+marks(v)−2)=1`; positivity forces one vertex, hence no nodal fibre. Three ordered sections canonically trivialize the smooth family. |
| `StableReductionPartII:MC.2/genus-one-base` | Proper smooth DM of relative dimension one, with relative normal-crossings boundary. Use the independent one-gon comparison for these properties and the triangle comparison for the four/five-parameter realization. |
| `StableReductionPartII:MC.2/higher-genus-pointed` | Start with the imported MC.1 unpointed theorem for `g≥2`; iterate the universal-curve induction step. |
| `StableReductionPartII:MC.2/pointed-dm-theorem` | For every `g,n≥0`, `2g−2+n>0`, `M̄_(g,n)/Z` is proper smooth DM, relative dimension `3g−3+n`, with dense smooth-curve open and relative normal-crossings boundary. Start at `(0,3)`, `(1,1)`, or `(g,0)`, respectively. |
| `StableReductionPartII:MC.2/cross-ratio` | The universal curve of `(P¹;0,1,∞)` is the actual `P¹_Z`. The coherent equivalence gives `M̄₀,₄=P¹_Z`, with `M₀,₄=P¹_Z\{0,1,∞}`. The full boundary consists of all three unordered `2+2` partitions. |
| `StableReductionPartII:MC.2/rigid-triangle-embedding` | The fixed labelled triangle gives a closed immersion into `M̄₂,₂`; it is the intersection of four distinguished smoothing branches, leaving the fifth elliptic boundary parameter free when present. No general separating clutching map is declared a closed immersion. |

For the cross-ratio convention, put the first three marks at `0,1,∞` and the
fourth at `λ`. The boundary at `λ=0` has partition `{1,4}|{2,3}`; at `λ=1`
it has `{2,4}|{1,3}`; at `λ=∞` it has `{3,4}|{1,2}`. Each stable fibre consists
of two rational components with two markings and one attaching node on each.
There are no automorphisms fixing their labelled flags. This tests the groupoid
identification over nonreduced bases as well as its geometric points.

For the relative boundary induction, `(0,3)` has empty boundary but `(0,4)` has
three boundary points. This detects the omission of the old-section collision
terms. At a point over an old node the total universal curve can be smooth over
Z because `t=xy` eliminates a base parameter; its projection is still nodal at
`x=y=0`. Smoothness of the total moduli stack never changes that fact.

For the triangle, gluing a smooth one-pointed genus-one curve produces four
nodes: three around the triangle and one attaching it. Gluing the irreducible
nodal genus-one curve produces five. Cutting only the four designated nodes
recovers the original curve in both cases. On a relative five-dimensional
ambient atlas the four zero equations give the one-dimensional source, with
the fifth coordinate cutting its cusp exactly in the second case.

### The parent polynomial calculation

The imported monic model has
`q=X²+γXY+δY²`, `R=A[Y][X]/(q(X,Y)−q(s,t))`, and actual ideal
`J=(u−s,v−t)`. Write `c=u−s`, `d=v−t`, `b=u+s+γt`, and
`a=δv+δt+γu`. The parent alternating matrices, signed cokernel maps and
augmented projective resolutions remain unchanged. Its denominator-free dual
generator satisfies `d ε(j)=b j`; where fractions are used this reads
`ε=(u+s+γt)/(v−t)`. The actual dual is generated by `1,ε`, and its quotient
by multiplication `R→J*` is the coefficient module `A`, represented by ε.
These assertions do not turn the section evaluation projection into an
R-linear map: it is A-linear.

The inputs for relative reflexivity are specifically the parent
`section-dual-coefficient-hom-equivalence`,
`section-ideal-coefficient-hom-equivalence`,
`section-ideal-derived-ext-vanishing` and
`section-dual-derived-ext-vanishing`. The last two retain arbitrary coefficient
modules. The similarly named **absolute** Ext nodes concern target `R` alone
and would not suffice for the universal coefficient criterion. The underlying
polynomial assertions allow every coefficient ring, including the zero ring;
the general relative theorem imposes its stated Noetherian hypotheses.

For the nodal expansion, the parent explicit charts are

`R₀=A[v,y]/(v(y²−γy+δ)+s(2y−γ)+t(−y²+2γy−γ²+δ))`,

`R₁=A[u,x]/(u(δx²−γx+1)+s(δx²−1)+tδ(γx²−2x))`.

The first has the A-basis of monomials `v^i y^j` excluding those with both
`i≥1` and `j≥2`. With `h=δx²−γx+1`, its open together with
`Spec R₁[h⁻¹]` covers, and `R₁[h⁻¹]=A[x,h⁻¹]`. These are the actual
polynomial computations used in the new formal-transfer proof. That proof
does not use the unfinished family-flatness conclusion as its own premise.
The geometry of a node imposes the nondegenerate quadratic-form condition;
the monic polynomial module identities themselves have the broader parent scope.

### The two-base tensor quotient is genuinely a quotient

Keep the imported targets `completion-coefficient-tensor`,
`completion-coefficient-tensor-surjective` and
`completion-coefficient-tensor-kernel`. The map

`R̂⊗_A N → R̂⊗_Â N`

is the quotient imposing the extra Â-balancing relations
`(râ)⊗n=r⊗(ân)`. Its kernel is generated by their differences. The existence
of `Â→R̂` and its scalar tower proves surjectivity, not injectivity.

A counterexample already has a rank-one free completed coefficient module.
Take `A=Q[t]_(t)`, `R=A`, `Â=R̂=Q[[t]]` and `N=Â`. The map is
multiplication `Â⊗_A Â→Â`. Put `K=Q(t)` and `L=Q((t))`. Choose
`α∈Q[[t]]` outside K and a K-linear functional `ℓ:L→K` with
`ℓ(1)=0`, `ℓ(α)=1`, obtained by extending the independent vectors `1,α`
to a basis. In `L⊗_K L`, the element `α⊗1−1⊗α` maps under `ℓ⊗id`
to `1`, so it is nonzero. It is the image of the corresponding element of
`Â⊗_A Â`, which multiplication kills. Thus the original-base quotient is
not injective even for this free N. No transcendence assertion is needed.

This does not contradict the parent finite-projective tensor/limit theorem:
that theorem identifies `R̂⊗_Â N` with its finite-quotient diagram limit;
it never identifies it with `R̂⊗_A N`. The new all-N completed Hom/Ext
argument uses flat cycles in a complete hull, rather than either interchange.

## Dependency boundaries and acceptance

Every family target uses the imported pointed-family groupoids and their actual
morphisms; the new comparison proves their natural inverse structure over
arbitrary schemes. The generic stack algebraicity and unpointed formal-to-étale
normal-crossings inputs remain with MC.0/MC.1 and their suppliers. The new
induction transports those hypotheses, and does not reprove them by a tangent
space count. The generic local-flatness and Hom/Ext comparison inputs stay with
R03.3: its existing flat-fibre-injection/cokernel result does not by itself
provide all the Tor, all-coefficient and Gorenstein-dual contracts required here.

For the completed module argument the required generic algebra is: the local
Tor test for a finite module over a Noetherian local target; flatness from all
infinitesimal quotients when the ideal lies in the target maximal ideal; flat
finite-presentation Hom and finite-free Ext comparison; scalar-extension Ext
adjunction; flat fibre Ext comparison; the coherent coefficient exchange
criterion and its filtered-colimit extension; and one-dimensional Gorenstein
maximal Cohen–Macaulay duality. The supplier is
`DeformationAndDerivedPatchingAlgebra:R03.3`. The new relative predicate,
relative enhancement of the imported complete hull, coefficient criterion and
two-base argument belong to MC.2. Ordinary total acyclicity and the finite
Gorenstein-projective predicate stay with StablePeriodicCurved Layer 2.

The source correction already recorded as `StableReductionPartII/E2` is used:
a moving section through a nodal family does **not** generally satisfy
`J·J*=J`. The fixed-node recovery cuts persistent nodes, where the restricted
pairing assertion applies. No inference is made from fibrewise rank two to a
rank-two bundle over the whole original base. The pointed-hull correction E1
is supplied by Knudsen's closer-look paper; the general-clutching warning E3
is respected by restricting the closed-immersion theorem to the fixed labelled
triangle.

The layer has six atlas landmarks after assembly: the parent's Pointed node
deformation, Pointed expansion, Forgetful morphism, Universal-curve equivalence,
and Deligne–Mumford–Knudsen theorem, together with **Relative stable reflexivity**.
The new part adds only that last planet.

The suggested file contains the real-bodied absolute predicate, its native
reflexivity/evaluation and finite-projective/dual/equivalence signatures, the
absolute finite-Noetherian completion specialization, and three examples. Its
reader-only targets are the relative predicate, augmented complete hull and all
family/sheaf/stack constructions: their full specifications above require the
cited suppliers' carriers and APIs. No admitted data object or replacement
geometric structure is introduced. The file elaborates at the pins with only
admitted-proof warnings.

## Sources

All mathematical descriptions are in our own words. Page references to the
journal use its printed page numbers; references to the arXiv papers use the
numbered PDF pages of the explicit versions.

- **Knudsen-II-1983.** Finn F. Knudsen, [The projectivity of the moduli space of stable curves, II: The stacks M_g,n](https://journals.msp.org/mscand/article/download/1622/1621/1653). Math. Scand. 52 (1983), 161–199; journal scan, DOI 10.7146/math.scand.a-12001. Read 2026-10-18.
- **Knudsen-pointed-node.** Finn F. Knudsen, [A closer look at the stacks of stable pointed curves](https://arxiv.org/pdf/1106.1588v2). arXiv:1106.1588v2 (2012), PDF pp. 1–17. Read 2026-10-18.
- **Ile-relative.** Runar Ile, [Stably reflexive modules and a lemma of Knudsen](https://arxiv.org/pdf/1110.3909v3). arXiv:1110.3909v3, PDF pp. 1–27. Read 2026-10-18.
- **Stacks-local-flatness.** The Stacks Project Authors, [Criteria for flatness](https://stacks.math.columbia.edu/tag/00MD). The Stacks Project, Algebra §10.99, online version read 2026-10-18; tags 00MK and 0523. Read 2026-10-18.
- **Stacks-completion.** The Stacks Project Authors, [Completion for Noetherian rings](https://stacks.math.columbia.edu/tag/00MC). The Stacks Project, Algebra §10.97, online version read 2026-10-18; tag 00MC. Read 2026-10-18.
- **Stacks-nodal-singular-scheme.** The Stacks Project Authors, [Families of nodal curves](https://stacks.math.columbia.edu/tag/0C58). The Stacks Project, Algebraic Curves §53.20, online version read 2026-10-18. Read 2026-10-18.
- **Stacks-unramified-diagonal.** The Stacks Project Authors, [The diagonal of an unramified morphism](https://stacks.math.columbia.edu/tag/02GE). The Stacks Project, Morphisms Lemma 29.36.13, tag 02GE, read 2026-10-18. Read 2026-10-18.

The printed proof of Appendix Proposition 6 points only to Bourbaki,
Chapter III, 5.4.4. The exact Bourbaki statement was not available in a cleared
copy and is not attributed a statement here. The replacement proof uses the
explicitly read Stacks local Tor criterion, with the complete-hull cycles
argument. Direct collation of the original citation is the remaining
bibliographical gap; it is not a premise of that replacement proof.

The inherited source issue IDs E1–E3 retain their original records. This part
asserts no new source erratum.

## Parent target inventory

All entries refer to `research/blueprint/packets/StableReductionPartII.json`;
they are imports, not new definitions or proof claims in this part.

| Existing target | Role |
| --- | --- |
| `StableReductionPartII:MC.0/effective-descent` | Effective descent of pointed stable curves |
| `StableReductionPartII:MC.0/pullback-coherence` | Pullback coherence for pointed moduli |
| `StableReductionPartII:MC.0/universal-curve` | The universal curve with an arbitrary extra section |
| `StableReductionPartII:MC.1/normal-crossing-boundary` | Relative normal-crossings boundary |
| `StableReductionPartII:MC.1/versal-node-parameters` | Independent node-smoothing parameters |
| `StableReductionPartII:MC.2/completion-coefficient-tensor` | Two-base tensor quotient for the nodal chart |
| `StableReductionPartII:MC.2/completion-coefficient-tensor-kernel` | Kernel of the two-base comparison |
| `StableReductionPartII:MC.2/completion-coefficient-tensor-surjective` | The two-base map is surjective |
| `StableReductionPartII:MC.2/cross-ratio` | The cross-ratio compactification |
| `StableReductionPartII:MC.2/expansion` | Expansion at an arbitrary extra section |
| `StableReductionPartII:MC.2/expansion-contraction-inverses` | Expansion and contraction are inverse |
| `StableReductionPartII:MC.2/forget` | Forgetting a marking on the moduli stack |
| `StableReductionPartII:MC.2/genus-one-base` | The one-pointed genus-one base stack |
| `StableReductionPartII:MC.2/genus-zero-base` | The three-pointed rational moduli scheme |
| `StableReductionPartII:MC.2/higher-genus-pointed` | Pointed induction for genus at least two |
| `StableReductionPartII:MC.2/hom-completion-hom-equivalence` | Actual relative Hom and compatible quotient Homs |
| `StableReductionPartII:MC.2/pointed-dm-theorem` | Deligne–Mumford–Knudsen theorem |
| `StableReductionPartII:MC.2/pointed-node-normal-form` | Normal form of a pointed nodal deformation |
| `StableReductionPartII:MC.2/rigid-triangle-embedding` | The rigid triangle locus |
| `StableReductionPartII:MC.2/section-dual-coefficient-flat` | Coefficient flatness of the section dual |
| `StableReductionPartII:MC.2/section-dual-coefficient-hom-equivalence` | Coefficient tensor–Hom equivalence for the dual |
| `StableReductionPartII:MC.2/section-dual-completion-equivalence` | Completion of the polynomial section dual |
| `StableReductionPartII:MC.2/section-dual-derived-ext-vanishing` | Positive derived-functor Ext vanishing for the section dual |
| `StableReductionPartII:MC.2/section-dual-presentation` | The ordered surjection to the section dual |
| `StableReductionPartII:MC.2/section-dual-quotient-completion-equivalence` | Completion of the actual residue quotient |
| `StableReductionPartII:MC.2/section-ideal-coefficient-flat` | Coefficient flatness of the section ideal |
| `StableReductionPartII:MC.2/section-ideal-coefficient-hom-equivalence` | Coefficient-valued bidual equivalence |
| `StableReductionPartII:MC.2/section-ideal-derived-ext-vanishing` | Positive derived-functor Ext vanishing for the section ideal |
| `StableReductionPartII:key/moduli-curves` | Moduli stacks of pointed curves |
