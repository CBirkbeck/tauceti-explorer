# Global Galois deformation rings, Part II: G-valued lifting

This roadmap extends **GlobalGaloisDeformations** after its deformation functors and global obstruction presentations. Its purpose is to lift an actual residual representation of a global Galois group into a possibly disconnected reductive group, including reducible residual image. The endpoint is a finitely ramified characteristic-zero lift with fixed multiplier, prescribed local components and approximation, and image containing the entire derived congruence kernel. The applications retain the residual lattice: modularity of a nonsplit extension means that extension itself occurs, rather than only its semisimplification.

The proof has two different lifting problems. Doubling constructs compatible finite-level lifts with carefully controlled new ramification, but the union of their ramification sets can be infinite. Relative Selmer images then allow a second induction over one finite set of places. Its vanishing criterion concerns the image of a higher-coefficient Selmer group in residual cohomology; replacing it by the full residual Selmer group changes the argument.

**Open mathematical inputs.** All eleven layers have a target-level plan. Six explicit gaps delimit the proposed proof; no layer is closed and every target remains unchecked. In particular, the unconditional all-primes/all-basis auxiliary-field assertion in FKP22 arXiv v5 Lemma 3.7 has the counterexample given under [G1](#g1). The main lifting theorem is an intended endpoint whose proof requires a replacement for that assertion. That counterexample fails one of the main theorem’s additional residual conditions, but the independent review found the same failure under all of them when M* has a repeated constituent; the main theorem is not refuted, and its proof needs the repair. The exact supplier contracts and all source corrections are part of this specification.

## Conventions and ownership

Write F for a global field, p for an odd prime different from its characteristic, E/Q_p for a finite coefficient extension, O for its integers, ϖ for a uniformizer and k for its finite residue field. Put e=v_ϖ(p). The standing group datum is the smooth affine O-group G with split reductive identity component G⁰ and prime-to-p finite étale component group; G^der always means the derived group of **G⁰**. Its adjoint lattice is Lie(G^der), and M is its residual module. The prime bounds include very-good characteristic and the prime-to-p kernel of G^der×Z⁰_{G⁰}→G⁰. Constants denoted by a_G, b or a sufficiently-large-prime condition depend only on the stated root datum or dimensions; none is claimed effective.

The quotient representation μ into G/G^der is fixed. This quotient can be disconnected. For GL_n this is a determinant condition; for a torus it specifies the entire lift. The Tate dual is V*=Hom_k(V,k)(1) for k-coefficients and Hom_O(V,O/ϖ^r)(1) at finite O-level. It includes **one** cyclotomic twist. Prime-field duality uses the canonical trace k→F_p to compare with Hom_Fp(V,F_p)(1). Dimensions in the cyclic-module and auxiliary-class constructions are over F_p. Dimensions of residual Selmer images are over k. Cardinalities over O/ϖ^r are kept as cardinalities until the corresponding coefficient exactness is established.

Let Γ_{F,S} be the actual Galois group unramified outside the finite set of finite places S. In the number-field case S contains the places above p; global duality also includes the archimedean conventions. Set K=F(ρ̄,μ_p), let F̃ be the component-splitting field, and put K∞=K(μ_{p∞}). The integer D_cyc is the largest d with μ_{p^d}⊂K. A trivial prime is outside the given ramification set, splits in K and has residue characteristic different from p. Use arithmetic Frobenius σ and tame pro-p inertia τ, with σ τ σ⁻¹=τ^q. Reciprocity conventions are calibrated explicitly in the local pairing; local Artin maps sending uniformizers to geometric Frobenius are obtained by inversion. For Hodge–Tate weights use HT(κ)=−1.

The four residual conditions are C1: H⁰(Γ_F,M)=0; C2: H⁰(Γ_F,M*)=0; C3: no nonzero F_p[Γ_F]-quotient of M is isomorphic to a subquotient of M*; C4: H¹(Gal(K/F),M*)=0. C3 is not a semisimplicity assumption. Oddness is the equality between the infinite-place adjoint fixed dimension and the flag dimension. In the number-field geometric theorem assume total reality separately, including the torus case where oddness is numerically vacuous.

| Material | Existing owner and precise boundary |
|---|---|
| Continuous H¹, orbit spans, linear images | The six pinned declarations below; arithmetic coefficient and Galois comparisons are supplied by ArithmeticGaloisDuality and ArithmeticGaloisRepresentations. |
| Framed local rings, generic components, potentially semistable and ordinary loci | LocalGaloisDeformationRings R08.1–3 and L7. Their root cocycle lattices and analytic neighborhoods are requested exports, not new rings here. |
| Poitou–Tate, local Tate duality, global cardinality formulas, Selmer kernels | ArithmeticGaloisDuality R02.1–5 and D7. The positive-characteristic extensions are the precise obligation G3. |
| Roots, parabolics, Levi decompositions and classification | Current ReductiveGroups layers 7–8, as stated there. Large-prime exponentials, good-characteristic centralizers, G-semisimplification and finite-field root position are outside that scope and form gap G6. |
| Congruence subgroups, the lattice tree, compact analytic groups and Lazard cohomology | Current ReductiveGroupsPartII RG2.0 and RG2.2, cited as they stand; p-valued subgroups from LocallyAnalyticDistributionsPartII ND.0, Lazard’s resolution and Lie comparison from NoncommutativeAndEquivariantIwasawa NE.0, semisimple Lie-algebra vanishing from AutomorphicFormsOnReductiveGroups AF.1a. |
| Pro-p Frattini generation and Chebotarev | Current ProfiniteProPGroups layer 3; current Chebotarev layer 10 and FunctionFieldArithmetic FA.5. |
| Modular, ordinary lifting, Lafforgue and compatible-system theorems | Their existing automorphic owners, cited at node level where an exact node exists (Skinner–Wiles and Pan, Khare–Wintenberger, Deligne–Serre, Lafforgue, ModularityAndLanglandsExtensions ML.2, PotentialAutomorphyInfrastructurePartII PL.7) and otherwise contract by contract below. This roadmap proves the lifting-specific implications and retains their hypotheses. |

## Pinned baseline and existing upstream work

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Each declaration below was read in that source, including its hypotheses. The relevant shared-build files were compared byte-for-byte with the recorded pinned baseline before compiling the prototype.

- **tauceti:TauCeti.ContCohomology.H1** — The existing explicit continuous degree-one cohomology Z¹/B¹ for a continuous distributive monoid action on a topological additive commutative group. Source module: `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`. Read the declaration and its hypotheses in the pinned source; compared with current library. Used directly by the small Suggested prototype; arithmetic comparisons remain in the cohomology owner.
- **tauceti:TauCeti.ContCohomology.explicitInfRes_exact** — For a closed normal subgroup, the range of explicit inflation equals the kernel of explicit restriction on H¹; quotient and invariant-module continuity hypotheses remain in force. Source module: `TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean`. Read full statement and cocycle-descent proof at the pin; no arithmetic vanishing is inferred from this alone.
- **mathlib:Submodule.map** — The existing image of a submodule under a semilinear map, used for the relative-image core. Source module: `Mathlib/Algebra/Module/Submodule/Map.lean`. Read real-bodied definition and image membership at pinned Mathlib.
- **mathlib:Submodule.span** — Smallest submodule containing a set, defined as an infimum. The cyclic module uses the existing span of the orbit with scalars F_p. Source module: `Mathlib/LinearAlgebra/Span/Defs.lean`. Definition and span_le read at the pin; shared build file compared byte-for-byte with the recorded baseline.
- **mathlib:Representation** — Monoid homomorphisms to the algebra of linear endomorphisms; supplies the real carrier for the generic orbit-span prototype. Source module: `Mathlib/RepresentationTheory/Basic.lean`. Abbreviation and trivial representation read at the pin; file compared with the recorded baseline.
- **mathlib:Subgroup.map** — Existing subgroup image and its to_additive-generated AddSubgroup.map. The latter is the additive image used by the continuous H¹ prototype; the declaration index lists the generating Subgroup.map. Source module: `Mathlib/Algebra/Group/Subgroup/Map.lean`. Real body and additive generation read at the pin; shared file compared byte-for-byte with the baseline.

The reviewed library-coverage audit was read before planning. The current upstream audit is against roadmaps commit `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The ReductiveGroups and Chebotarev reader documents were read in full; the current ReductiveGroupsPartII congruence-quotient and lattice-class-tree targets were then checked directly. Those constructions already have an upstream owner, even though the older atlas packet for that owner is partial. References to RG2.0/RG2.2 here mean the current upstream targets, via their stable owner stage IDs.

- **AlgebraicVectorBundles**: No lifting/cohomology overlap in Suggested.
- **DifferentialGeometry**: No lifting overlap in Suggested.
- **IntegralLattices**: Quadratic lattice congruences and ring-class-field material are not the generic G-valued deformation theorem.
- **LocalGaloisGroups**: Arithmetic local cohomology, tame quotient and cyclotomic orientation are existing work; use through local arithmetic owners. No global Selmer/doubling theorem.
- **OperatorTheory**: All nested Suggested files searched; no arithmetic lifting overlap.
- **OrthogonalSpinGroups**: Gram-form congruences are not the Galois lifting construction.
- **PeripheralActions**: The automorphism congruence occurrence does not provide the lifting theorem.
- **ProfiniteArithmetic**: Read the automorphism Frattini-kernel application. It does not replace the finitely generated pro-p Frattini criterion requested from ProfiniteProPGroups.
- **RealAlgebraicGeometry**: No Galois deformation overlap in Suggested.

ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts are absent as roadmap directories in the supplied current tree; the current library was also searched for relevant arithmetic/deformation exports. No duplicate global lifting target found. Pinned/current continuous H¹ and inflation-restriction read directly. Bounded searches for Galois deformation, Ramakrishna, generic relative Selmer, compact analytic/Lazard and congruence exports did not identify matching arithmetic targets. Elliptic-curve two-descent Selmer and special auxiliary-prime lemmas are not general Selmer or Dirichlet-density Chebotarev results.

The nine-roadmap comparison uses bounded searches followed by reading the relevant hits, rather than a claim to have audited unrelated mathematics. Existing local arithmetic, lattice and automorphism results are imported through their owners. The generic geometric-lifting construction was not found in the searched pinned/current library material. The base and local deformation roadmaps are on the Caraiani–Newton schedule; this new continuation is outside its fixed 94-roadmap list and does not move automorphy theorems into the base tier.

## Build order and acceptance

| Layer | Targets | Planets | Status |
|---|---:|---:|---|
| GG2.0 — Global lifting data and arithmetic interfaces | 7 | 5 | planned |
| GG2.1 — Residual-image criteria | 12 | 6 | planned |
| GG2.2 — Cyclic ramification classes | 9 | 5 | planned |
| GG2.3 — Doubling and controlled finite-level lifts | 6 | 2 | planned |
| GG2.4 — Relative local conditions and Selmer images | 8 | 5 | planned |
| GG2.5 — Auxiliary primes and relative Selmer annihilation | 5 | 4 | planned |
| GG2.6 — Finitely ramified characteristic-zero lifts | 6 | 5 | planned |
| GG2.7 — Levi-valued residual representations | 8 | 5 | planned |
| GG2.8 — Actual reductions of modular forms | 11 | 6 | planned |
| GG2.9 — Automorphy over function fields | 5 | 4 | planned |
| GG2.10 — Symplectic compatible systems and conditional scope | 4 | 3 | planned |

An acceptance check below is a mathematical requirement for the future implementation, not a claim that the stated theorem has been formalized. Every definition and construction has a reusable API and three regression tests. The proof outlines are target-level chains: named supplier results are explicit inputs, and smaller arguments remain within the target that uses them. All source locators use the editions in the bibliography.

## Layer GG2.0: Global lifting data and arithmetic interfaces

Fix the G-valued, fixed-multiplier global problem, the derived adjoint module and its Tate dual; define G-oddness, the four residual-image conditions, trivial primes, cocycle fields and strong linear disjointness. Establish the cyclotomic and abelian-compositum facts used by every auxiliary-prime argument. Import arithmetic duality and local deformation rings from their owners, with the function-field extensions explicit.

<a id="lifting-datum"></a>

### G-valued global lifting datum

**Target:** `GlobalGaloisDeformationsPartII:GG2.0/lifting-datum` (definition). **Planet:** Fixed-multiplier lifting.

A lifting datum consists of a global field F of characteristic different from p, a finite set S of finite places containing all residual ramification and all places above p in characteristic zero, a finite extension E/Q_p with integers O, uniformizer ϖ and residue field k, a smooth affine O-group G with split reductive G⁰ and finite étale component group of order prime to p, a continuous ρ̄:Γ_{F,S}→G(k), and a continuous lift μ:Γ_{F,S}→(G/G^der)(O) of its quotient. Here G^der is the derived group of G⁰. Require p odd and very good and the central isogeny G^der×Z⁰_{G⁰}→G⁰ to have prime-to-p kernel. Write M=Lie(G^der)_k with action Ad∘ρ̄ and M*=Hom_k(M,k)(1); * includes exactly one cyclotomic twist. Lift^μ(A) is the existing fixed-quotient continuous lifting functor, with strict conjugacy by the congruence kernel when passing to deformation classes.

**Hypotheses and conventions.** The finite component action and μ are part of the data; the quotient G/G^der need not be a torus. In characteristic zero μ is de Rham for geometric conclusions.

**Needs:** `LocalGaloisDeformationRings:R08.1/g-valued-framed-ring`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon`; `ArithmeticGaloisRepresentations:R01.1`; `GlobalGaloisDeformations:R04.1`.

**Construction or proof.**

1. Specialize the existing G-valued framed functor, then impose equality of the quotient representation.
2. Use the prime-to-p central isogeny to identify its infinitesimal kernel with Lie(G^der).
3. Use the invariant trace form only under the prime hypotheses to identify M∨ with M; keep its Tate twist visible.

**Source:** FKP22, §2, p.9; §1.2, pp.5–6; FKP19 Assumption 2.1, p.14. These conventions specify the global parameters and the coefficient module for the lifting proof.

**Uses that determine the API.**

- Theorem 5.2, pp.23–25: Fixes the cohomology coefficients, multiplier and allowed coefficient enlargement.
- Proposition 5.4, pp.25–26: Distinguishes prime-field quotients of M from constituents of its Tate dual.

**API.**

- `Lifting.lifting_datum.of_fixed_quotient` (constructor): A continuous lift of the specified quotient determines the fixed-multiplier problem.
- `Lifting.lifting_datum.adjoint_tangent` (compatibility): The fixed-μ tangent representation is Lie(G^der), not Lie(G) or its quotient by all scalars without hypotheses.
- `Lifting.lifting_datum.base_change` (functoriality): Finite coefficient extension transports ρ̄, μ, the tangent representation and its evaluation pairing, and composes with a second extension.

**Unit tests.**

- `Lifting.lifting_datum.gl2_trace_zero` (compatibility): For GL₂ and p odd, fixed multiplier is fixed determinant and M=sl₂(k), of dimension 3.
- `Lifting.lifting_datum.torus_zero` (degenerate): For a torus G, G^der is trivial and M=0; its multiplier still records the entire representation.
- `Lifting.lifting_datum.dual_twist` (non-example): For a trivial one-dimensional coefficient module its Tate dual has cyclotomic action; adding a second twist does not give the specified dual.

**Checks.**

- For GL₂ and p odd, fixed multiplier is fixed determinant and M=sl₂(k), of dimension 3.

<a id="oddness"></a>

### Odd G-valued residual representations

**Target:** `GlobalGaloisDeformationsPartII:GG2.0/oddness` (definition). **Planet:** Odd representations.

For F a number field and p odd, call ρ̄ odd when for every infinite place v the dimension of Lie(G^der)_k fixed by its decomposition group equals dim Flag(G⁰). At a real place this is the fixed space of ρ̄(c_v). For nontrivial semisimple G this condition rules out complex places. For a torus both dimensions are zero, so total reality is a separate hypothesis in the geometric theorem.

**Hypotheses and conventions.** Use the standing good-characteristic conditions and the actual component containing complex conjugation. For a torus the numerical condition alone does not force F totally real; record total reality separately in geometric lifting theorems.

**Needs:** [GG2.0/lifting-datum](#lifting-datum); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. Use involution eigenspaces in the adjoint module and the root decomposition to prove the lower bound.
2. Compare the definition with the matrix determinant test for GL₂.

**Source:** FKP19, Definition 1.2 and discussion, pp.2–3. Oddness is measured on the derived adjoint representation and is the archimedean contribution to balance.

**Uses that determine the API.**

- Theorem 5.2, p.23: Supplies equality in the Greenberg–Wiles balance calculation.
- Corollary 6.6, p.30: Oddness survives adding a p-primary extension class at real places.

**API.**

- `Lifting.oddness.archimedean_fixed_dimension` (projection): At each infinite place the invariant dimension equals the flag dimension; at a real place use the actual conjugation involution.
- `Lifting.oddness.conjugacy_invariant` (compatibility): The condition is unchanged by coefficient extension and G(k̄)-conjugacy.
- `Lifting.oddness.gl2_iff` (characterisation): For GL₂, p odd and F totally real, oddness is equivalent to determinant ρ̄(c_v)=−1 for every real v.

**Unit tests.**

- `Lifting.oddness.gl2_odd` (computation): diag(1,−1) on k² fixes a one-dimensional subspace of sl₂, equal to the flag dimension.
- `Lifting.oddness.gl2_even` (non-example): The identity on k² fixes all three dimensions of sl₂ and fails oddness.
- `Lifting.oddness.torus` (degenerate): The derived adjoint and flag dimensions of a torus are both zero; total reality must still be assumed when required.

**Checks.**

- diag(1,−1) on k² fixes a one-dimensional subspace of sl₂, equal to the flag dimension.

<a id="residual-conditions"></a>

### The four residual-image conditions

**Target:** `GlobalGaloisDeformationsPartII:GG2.0/residual-conditions` (definition). **Planet:** Residual-image conditions.

For a lifting datum put K=F(ρ̄,μ_p), F̃ the extension cut out by the component map, and K∞=K(μ_{p∞}). Define C1 by H⁰(Γ_F,M)=0, C2 by H⁰(Γ_F,M*)=0, C3 by: no nonzero F_p[Γ_F]-quotient of M is isomorphic to an F_p[Γ_F]-subquotient of M*, and C4 by H¹(Gal(K/F),M*)=0. The package C1,C3 is Assumption 4.1; C4 is Assumption 3.1; C2 and the specified local lifts supply Assumption 5.1. Define D_cyc=max{d:μ_{p^d}⊂K}, with d≥1.

**Hypotheses and conventions.** Prime-field modules are used in C3 even when k is larger than F_p. K uses the full residual representation, not merely its adjoint image.

**Needs:** [GG2.0/lifting-datum](#lifting-datum); `ArithmeticGaloisDuality:R02.5`; `ArithmeticGaloisRepresentations:R01.1`.

**Construction or proof.**

1. Reuse the arithmetic invariant and cohomology carriers.
2. State quotient/subquotient nonoverlap as a property of genuine equivariant maps; exclude the zero quotient.
3. Take fixed fields of the finite representations and cyclotomic character.

**Source:** FKP22, Assumptions 3.1, 4.1, 5.1, pp.10,19,23; Appendix A, pp.43–44. The source isolates the four independent hypotheses that replace residual irreducibility.

**Uses that determine the API.**

- Proposition 3.6, pp.12–15: C4 detects dual classes on Γ_K.
- Theorems 4.4 and 5.2, pp.20–25: C1,C3 give disjoint congruence fields, and C2 allows balanced relative theory.

**API.**

- `Lifting.residual_conditions.assumptions_iff` (characterisation): C1–C4 together with the fixed local μ-lifts are exactly the cohomological part of the main hypotheses.
- `Lifting.residual_conditions.nonzero_quotient` (projection): C3 rules out any nonzero equivariant surjection M→W with W a subquotient of M*.
- `Lifting.residual_conditions.semisimple_sufficient` (compatibility): Disjoint prime-field Jordan–Hölder constituents imply C3; C3 itself does not require semisimplicity.

**Unit tests.**

- `Lifting.residual_conditions.zero_module` (degenerate): M=0 satisfies C1–C4; C3 does not fail on W=0.
- `Lifting.residual_conditions.trivial_dual` (non-example): For nonzero trivial M with trivial cyclotomic action, C1,C2,C3 fail.
- `Lifting.residual_conditions.restriction_scalars` (compatibility): A k-trivial line has [k:F_p] prime-field trivial constituents; a k-multiplicity-free decomposition need not be F_p-multiplicity-free.

**Checks.**

- M=0 satisfies C1–C4; C3 does not fail on W=0.

<a id="trivial-prime"></a>

### Trivial primes and chosen local generators

**Target:** `GlobalGaloisDeformationsPartII:GG2.0/trivial-prime` (definition). **Planet:** Trivial primes.

A finite place w outside S is trivial when ρ̄|Γ_{F_w}=1 and q_w≡1 mod p. Fix its decomposition embedding, an arithmetic Frobenius σ_w and a generator τ_w of tame pro-p inertia, with σ_wτ_wσ_w⁻¹=τ_w^{q_w}. At such a place M and M* have trivial residual action; values of H¹ classes on σ_w and τ_w are independent of changing a cocycle by a coboundary.

**Hypotheses and conventions.** The place has residue characteristic different from p. Norm and Frobenius conventions agree in both characteristics.

**Needs:** [GG2.0/residual-conditions](#residual-conditions); `ArithmeticGaloisRepresentations:R01.2`.

**Construction or proof.**

1. Interpret triviality as complete splitting in K.
2. Use the existing local tame-quotient description and the vanishing of coboundaries for trivial action.

**Source:** FKP22, Definition 3.2 and Remark 3.3, p.11; FKP19 Notation 5.1, pp.25–26. Triviality and the decomposition choices make the specified evaluation conditions meaningful.

**Uses that determine the API.**

- Lemma 3.4, p.11: Ramification is measured by the τ_w evaluation.
- Definition 6.6 of FKP19, pp.46–47: Q_N refines residual triviality by finite-level Frobenius conditions.

**API.**

- `Lifting.trivial_prime.split_iff` (characterisation): A place away from the defining ramification is trivial iff it splits completely in K.
- `Lifting.trivial_prime.norm_congruence` (projection): A trivial prime has q_w≡1 mod p^{D_cyc}.
- `Lifting.trivial_prime.evaluation` (data): Chosen σ_w,τ_w define linear evaluations on local H¹, compatible with coefficient maps.

**Unit tests.**

- `Lifting.trivial_prime.cyclotomic_failure` (non-example): A place split in F(ρ̄) with q_w not congruent to 1 mod p is not trivial.
- `Lifting.trivial_prime.residual_failure` (non-example): The congruence q_w≡1 mod p does not suffice if ρ̄(Frob_w) is nonidentity.
- `Lifting.trivial_prime.coboundary` (compatibility): For a trivial local action d⁰m evaluates to zero on both chosen generators.

**Checks.**

- A place split in F(ρ̄) with q_w not congruent to 1 mod p is not trivial.

<a id="cocycle-fields"></a>

### Cocycle fields and strong linear disjointness

**Target:** `GlobalGaloisDeformationsPartII:GG2.0/cocycle-fields` (definition). **Planet:** Cocycle fields.

If the finite Γ_F-module V is trivial over K and z∈H¹(Γ_F,V), define K_z/K by the kernel of the homomorphism z|Γ_K. Its Galois group is the actual additive image z(Γ_K), with Gal(K/F) acting by conjugation. A finite family {L_i/K} is strongly linearly disjoint when the restriction Gal(∏L_i/K)→∏Gal(L_i/K) is an isomorphism; an infinite family has this property for every finite subfamily. Over K, classes and cocycles yield the same field.

**Hypotheses and conventions.** All fields sit in one fixed separable closure and are Galois over F where conjugation is used.

**Needs:** [GG2.0/residual-conditions](#residual-conditions); `tauceti:TauCeti.ContCohomology.H1`; `ArithmeticGaloisRepresentations:R01.1`.

**Construction or proof.**

1. Use the kernel of restriction on the existing continuous cocycle carrier.
2. Compare changing representatives and prove equivariance directly from the cocycle identity.
3. Express strong disjointness by the restriction isomorphism, not just pairwise intersections.

**Source:** FKP22, §1.3, pp.7–8; Lemma 3.7, pp.15–16; FKP19 Notation 5.1, pp.25–26. The proof uses cocycle images and disjointness of entire finite families.

**Uses that determine the API.**

- Lemma 3.7, pp.15–16: Identifies inertia-generated images to establish strong disjointness.
- Proposition 3.8, pp.16–19: Permits simultaneous Frobenius prescriptions in several cocycle fields.

**API.**

- `Lifting.cocycle_fields.gal_equiv_image` (equivalence): Gal(K_z/K) is equivariantly the additive image of z|Γ_K.
- `Lifting.cocycle_fields.class_independent` (compatibility): Adding a coboundary changes no restriction to Γ_K and hence no cocycle field.
- `Lifting.cocycle_fields.finite_subfamily` (characterisation): Strong disjointness of an infinite family is equivalent to its finite-subfamily formulation.

**Unit tests.**

- `Lifting.cocycle_fields.zero` (degenerate): The zero class cuts out K itself.
- `Lifting.cocycle_fields.pairwise_insufficient` (non-example): Three distinct quadratic subextensions of a biquadratic extension are pairwise disjoint but are not strongly disjoint.
- `Lifting.cocycle_fields.cyclic_image` (computation): A surjective homomorphism Γ_K→F_p cuts out a degree-p extension, not a degree-|k| extension unless its image is all of k.

**Checks.**

- The zero class cuts out K itself.

<a id="abelian-compositum"></a>

### Trivial conjugation on an abelian compositum

**Target:** `GlobalGaloisDeformationsPartII:GG2.0/abelian-compositum` (lemma).

For finite Galois L/F and abelian A/F, conjugation by Gal(L/F) on Gal(LA/L), defined by lifting to Gal(LA/F), is trivial.

**Needs:** `ArithmeticGaloisRepresentations:R01.1`.

**Construction or proof.**

1. Restriction embeds Gal(LA/L) into the abelian group Gal(A/F).
2. Every commutator restricts to the identity on A and on L, hence on LA.

**Source:** FKP22, Lemma 2.1, p.10. This elementary field lemma is the input excluding nontrivial residual constituents from cyclotomic intersections.

**Checks.**

- For two distinct quadratic extensions of Q, their biquadratic compositum has trivial conjugation on either relative C₂ factor.

<a id="cyclotomic-intersection"></a>

### The first cyclotomic layer in a cocycle field

**Target:** `GlobalGaloisDeformationsPartII:GG2.0/cyclotomic-intersection` (lemma).

For a finite Galois K/F containing μ_p, D_cyc is finite and Gal(K∞/K)≅Z_p. If V is killed by p and trivial on Γ_K, then K_z∩K∞ is either K or the unique degree-p layer K(μ_{p^{D_cyc+1}}). If its Γ_F/K conjugation action has no nonzero trivial quotient, the intersection is K. These assertions also hold for global function fields with p different from the characteristic.

**Hypotheses and conventions.** p is odd; the roots of unity in K are finite.

**Needs:** [GG2.0/cocycle-fields](#cocycle-fields); [GG2.0/abelian-compositum](#abelian-compositum); `ArithmeticGaloisRepresentations:R01.2`.

**Construction or proof.**

1. Use the structure of the p-adic cyclotomic image; over a function field use its constant-field description.
2. Gal(K_z/K) is killed by p, so any procyclic quotient has order at most p.
3. Apply trivial conjugation in an abelian compositum.

**Source:** FKP22, §3, pp.11,13; FKP19 Notation 5.1, pp.25–26. Only the first degree-p cyclotomic layer can obstruct unrestricted norm prescriptions.

**Checks.**

- If V=F_p with trivial conjugation, its cocycle field may be the first degree-p cyclotomic layer; absence of nontrivial constituents cannot be replaced by absence of submodules.

**Layer acceptance:** G3: audit the positive-characteristic arithmetic duality extension; resolve the fixed-μ G-valued global functor export.

## Layer GG2.1: Residual-image criteria

Prove the cyclic-quotient bound for absolutely G-irreducible images and the reducible parabolic criteria. Construct central p-group factors and the abelian root subgroup used to remove invariants. Define D(s,t,N), including zero exponents. Give corrected GL_n, classical maximal-parabolic, Borel, GSp_4 and equal-block examples; send the polarized GL_n module criterion to its existing owner. Every sufficiently-large-prime constant depends only on the indicated root datum or dimension.

<a id="irreducible-image-input"></a>

### Absolutely irreducible reductive images

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/irreducible-image-input` (theorem).

For a connected split reductive G/k and an absolutely G-irreducible finite subgroup Γ⊂G(k), p>2(dim Lie(G^der)+1) implies semisimplicity of Lie(G^der), absence of a nontrivial normal p-subgroup of Γ, and H¹(Γ,Lie(G^der)⊗χ)=0 for every character χ. For p>5, excluding p∣n+1 in type A_n, H⁰(Γ,Lie(G^der))=0. Absolute G-irreducibility means noncontainment in every proper parabolic after extension to k̄.

**Hypotheses and conventions.** The module and character may be considered after a finite splitting extension of k.

**Needs:** [GG2.0/lifting-datum](#lifting-datum); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ArithmeticGaloisRepresentations:G7`.

**Construction or proof.**

1. Use low-height complete reducibility for the adjoint representation.
2. A normal p-subgroup fixes every simple constituent, hence lies in the prime-to-p center.
3. Apply the requested small-representation H¹ theorem to the adjoint image.
4. For invariants split a fixed Lie element into its semisimple and nilpotent parts and use the proper-parabolic centralizer criteria.

**Source:** FKP19, Appendix A, Lemmas A.1–A.2, pp.60–62. These are the finite-image prerequisites from the earlier paper, including the bounds and centralizer argument.

**Checks.**

- For SL₂ at p≥7 a full SL₂(F_p) image has no fixed vector in sl₂; absolute irreducibility refers to parabolics of SL₂ rather than an arbitrary faithful representation.

<a id="cyclic-quotient-bound"></a>

### Bounded cyclic quotients of irreducible images

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/cyclic-quotient-bound` (theorem). **Planet:** Cyclic quotient bound.

For a fixed split semisimple root datum and sufficiently large p there is a_G such that every absolutely G-irreducible Γ⊂G(k) has no cyclic quotient of order at least a_G. In the adjoint case there is also n_G, depending only on the root datum, such that for each semisimple s some s^n, n∣n_G, has Levi centralizer. The semisimple version follows from the adjoint one with the bounded central kernel accounted for.

**Hypotheses and conventions.** The constants are uniform in finite k of characteristic p; a prime bound is part of the conclusion.

**Needs:** [GG2.1/irreducible-image-input](#irreducible-image-input); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon`; `ArithmeticGaloisRepresentations:G7`.

**Construction or proof.**

1. Use the Larsen–Pink normal series, with its central prime-to-p part when O_p(Γ)=1.
2. A large cyclic quotient forces a large prime-to-p central cyclic subgroup, by averaging for a bounded quotient.
3. Raise a generator to a bounded power so that its centralizer is a proper Levi, contradicting irreducibility.

**Source:** FKP19, FKP19 Lemmas A.3, A.5, A.6, pp.62–63; LP11 Theorem 0.2, p.1106 and §12, p.1156. The earlier paper derives the cyclic-quotient bound from the finite-subgroup theorem and root centralizers.

**Checks.**

- For a torus the semisimple statement does not apply: finite multiplicative subgroups have arbitrarily large cyclic quotients.

<a id="central-factor-series"></a>

### Central Γ-factors of a finite p-group

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/central-factor-series` (definition).

For a finite p-group Σ with Γ acting by automorphisms, a central Γ-series is 1=Σ₀⊲⋯⊲Σ_n=Σ of Γ-stable normal subgroups with Σ_{i+1}/Σ_i central in Σ/Σ_i. A maximal such series has elementary abelian simple F_p[Γ]-factors, indexed 0≤i<n. Define its factor multiset up to equivariant isomorphism.

**Hypotheses and conventions.** Finite Σ; Γ may be arbitrary.

**Needs:** `ArithmeticGaloisRepresentations:G7`.

**Construction or proof.**

1. Refine the ascending central series using Γ-stable subspaces.
2. At a maximal step both commutators and p-th powers vanish, so the factor is an elementary abelian simple module.

**Source:** FKP22, Appendix A before Lemma A.3, p.44. The central factors organize the modular constituents of residual unipotent images.

**Uses that determine the API.**

- Lemma A.4, p.44: Compares the unipotent kernel with an ambient Lie filtration.
- Lemma A.5, p.45: Excludes maps from the residual p-kernel into Tate-dual constituents.

**API.**

- `Lifting.central_factor_series.exists_maximal` (constructor): Every finite p-group with Γ-action admits a maximal central Γ-series.
- `Lifting.central_factor_series.factor_simple` (projection): Each successive factor is a nonzero simple F_p[Γ]-module.
- `Lifting.central_factor_series.factors_equivariant_iso` (functoriality): A Γ-equivariant group isomorphism transports the series and its factor multiset.

**Unit tests.**

- `Lifting.central_factor_series.trivial` (degenerate): Σ=1 has an empty factor multiset.
- `Lifting.central_factor_series.cyclic_p2` (computation): For Σ=C_{p²} and trivial action the multiset contains two copies of the trivial F_p-line.
- `Lifting.central_factor_series.nontrivial_action` (non-example): For Σ=F_{p²} additively with Γ acting by multiplication by a generator of F_{p²}×, the central factor is the simple two-dimensional F_p-module, not two trivial lines.

**Checks.**

- Σ=1 has an empty factor multiset.

<a id="central-jordan-holder"></a>

### Jordan–Hölder for central Γ-series

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/central-jordan-holder` (theorem).

Any two maximal central Γ-series of a finite p-group Σ give the same multiset of simple F_p[Γ]-factors. If Σ⊂U(k) is normalized by a subgroup of P(k), all its central factors are F_p[Γ]-subquotients of Lie U, for p sufficiently large in the root datum.

**Hypotheses and conventions.** P is parabolic with unipotent radical U and the equivariant exponential is available.

**Needs:** [GG2.1/central-factor-series](#central-factor-series); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. Apply Schreier refinement to Γ-stable central series.
2. Filter Σ by Σ∩U_i(k), not by replacing Σ with U(k).
3. The requested P-equivariant exponential identifies U_{i+1}/U_i with the corresponding Lie quotient.

**Source:** FKP22, Lemmas A.3–A.4, p.44; Lemma A.1 and Remark A.2, p.44. The intersection filtration repairs the change-of-group step in the source.

**Checks.**

- For a cyclic group of order p² with trivial Γ-action, both maximal series have exactly two trivial F_p factors.

<a id="cyclotomic-exclusion"></a>

### Cyclotomic exclusion implies C3 and C4

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/cyclotomic-exclusion` (theorem). **Planet:** Cyclotomic exclusion.

For p sufficiently large in G, if μ_p is not contained in F(Ad ρ̄), then M and M* have disjoint prime-field simple constituents, and C3,C4 hold. The assertion is unchanged by replacing ρ̄ with its Levi projection from a minimal residual parabolic after a finite coefficient extension.

**Hypotheses and conventions.** G is connected split reductive; choose a minimal parabolic anew after enlarging k.

**Needs:** [GG2.0/residual-conditions](#residual-conditions); [GG2.1/irreducible-image-input](#irreducible-image-input); [GG2.1/central-jordan-holder](#central-jordan-holder); `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`; `ArithmeticGaloisRepresentations:G7`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. An isomorphism between a constituent of M and a cyclotomic twist of another would force the cyclotomic character to factor through Ad ρ̄.
2. Over the Levi splitting field apply the small-representation H¹ result.
3. Use inflation–restriction and the central factors of the residual p-kernel to rule out equivariant homomorphisms into M*.

**Source:** FKP22, Lemma A.5 and Remark A.6, p.45. The source criterion supplies both nonoverlap and finite-image H¹ vanishing without semisimplicity of M.

**Checks.**

- If μ_p⊂F then this exclusion criterion is unavailable; C3/C4 must instead be verified directly.

<a id="abelian-root-subgroup"></a>

### An abelian root subgroup faithful on the Levi center

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/abelian-root-subgroup` (construction). **Planet:** Abelian root subgroup.

For semisimple G and parabolic P=MU at sufficiently large p, construct an abelian M-normalized subgroup A⊂U which is a product of root subgroups and whose Lie algebra a has faithful action of z(m). Choose a maximal abelian M-submodule of u and exponentiate it; its choice is not canonical.

**Hypotheses and conventions.** The source bound depends only on the root datum; the exponential preserves the required Lie subalgebras.

**Needs:** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon`.

**Construction or proof.**

1. If the kernel z₀⊂z(m) of the action were nonzero, select a nonzero z₀-weight f on u with 2f absent.
2. Nilpotence gives a nonzero M-submodule in u_f commuting with a.
3. Its self-bracket vanishes by the weight choice; adjoining it contradicts maximality.

**Source:** FKP22, Lemma A.7 and Remark A.8, pp.45–46. This supplies the specific abelian unipotent subgroup needed by the Levi-valued lifting argument.

**Uses that determine the API.**

- Lemma 6.3, p.29: Provides coordinates for adding full A(k) to the residual image.
- Lemma 6.5, p.30: Faithfulness removes invariant Levi-center elements.

**API.**

- `Lifting.abelian_root_subgroup.subgroup_inclusion` (projection): The inclusion A→U→P is a closed immersion and A is M-normalized.
- `Lifting.abelian_root_subgroup.commutative_root_coordinates` (data): Its selected root coordinates give an M-stable vector group with abelian multiplication.
- `Lifting.abelian_root_subgroup.center_faithful` (characterisation): An element of z(m) acting trivially on every chosen root direction is zero.

**Unit tests.**

- `Lifting.abelian_root_subgroup.sl2` (computation): For the Borel in SL₂ at p odd, A=U and the toral Lie action is multiplication by 2.
- `Lifting.abelian_root_subgroup.gl_blocks` (compatibility): For the (a,b) maximal parabolic in SL_{a+b}, p∤a+b, A is the abelian a-by-b matrix radical. The one-dimensional Levi center in sl_{a+b} acts by a nonzero scalar; the full GL center would act trivially.
- `Lifting.abelian_root_subgroup.bad_characteristic` (non-example): For SL₂ in characteristic 2 the toral differential on its root line vanishes; this prime cannot satisfy the assertion.

**Checks.**

- For the Borel in SL₂ at p odd, A=U and the toral Lie action is multiplication by 2.

<a id="block-criteria"></a>

### Corrected block criteria for GL_n

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/block-criteria` (theorem). **Planet:** Block criteria.

Let ρ̄ take values in a parabolic of GL_n with Levi blocks r_i of dimensions n_i. Suppose p≫n, each r_i is absolutely irreducible, and r_i≄r_j⊗ψ for i≠j and ψ∈{1,κ̄,κ̄⁻¹}. Set χ_ij=(det r_i)^{n_j}(det r_j)^{−n_i}. Require jointly [F(ζ_p):F(ζ_p)∩F(χ_ij: i≠j)]>b(n). Then C2,C3,C4 hold and Levi projection injects H⁰(Γ_F,M) into z(m)∩sl_n. For a Levi-valued representation the invariants themselves lie there.

**Hypotheses and conventions.** The determinant-field condition concerns the compositum of all character fields, not separate pairwise degrees.

**Needs:** [GG2.0/lifting-datum](#lifting-datum); [GG2.0/residual-conditions](#residual-conditions); [GG2.1/cyclic-quotient-bound](#cyclic-quotient-bound); [GG2.1/cyclotomic-exclusion](#cyclotomic-exclusion); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. Filter the adjoint module by block degree; its semisimplification is built from Hom(r_j,r_i), with the trace relation.
2. The off-diagonal invariant and twisted-invariant terms vanish by the nonisomorphism hypotheses.
3. Use the cyclic-quotient bound to control the adjoint splitting field through the joint determinant ratios, then apply cyclotomic exclusion.

**Source:** FKP22, Lemma A.9, pp.46–47. The joint field condition and the invariant projection are the corrected forms required by the direct-sum application.

**Checks.**

- For three one-dimensional blocks, separate pairwise degree bounds do not imply a bound for the joint determinant field. Retain the joint-field regression in E37.

<a id="maximal-parabolic-criteria"></a>

### Classical maximal-parabolic invariant criteria

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/maximal-parabolic-criteria` (theorem). **Planet:** Maximal parabolic criteria.

Let P=MU be one of the four classical maximal parabolics of Lemma A.11 with abelian U. Assume p is sufficiently large in G, the Levi representation r_M is absolutely M-irreducible, the cyclotomic degree exceeds the root-datum constant, and im ρ̄→im r_M is not injective. Then H⁰(u)=0 implies C1. For GL block, symplectic Siegel and even orthogonal maximal-isotropic cases, H⁰(u(1))=0 implies C2; the opposite piece cannot lift to an invariant across the nontrivial U-kernel. For the orthogonal line stabilizer require also H⁰(u∨(1))=0. For GL blocks the tests are unequal dimensions or r′≄r″, respectively r′≄r″κ̄⁻¹. For GSp Siegel, u=Sym²r⊗δ⁻¹, so the tests exclude nondegenerate symmetric forms of multipliers δ and δκ̄⁻¹. For SO line stabilizer u=std⊗χ, exclude its trivial, κ̄ and κ̄⁻¹ constituents as appropriate; for SO even maximal-isotropic u=Λ²std, use the stated invariant and twisted-invariant tests.

**Hypotheses and conventions.** p≫G and all indicated finite-group and centralizer inputs hold. Retain the noninjective projection hypothesis; a Levi-valued representation is treated by GG2.7.

**Needs:** [GG2.0/residual-conditions](#residual-conditions); [GG2.1/irreducible-image-input](#irreducible-image-input); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ArithmeticGaloisRepresentations:G7`.

**Construction or proof.**

1. Use the adjoint filtration u⊕m⊕u∨ and Levi irreducibility to control the possible invariant blocks.
2. A nonzero residual U-kernel element forces a putative Levi-central invariant to vanish.
3. For a possible opposite block in the GL, GSp and SO even cases, its invariant bilinear form is nondegenerate; the commutator with that kernel element prevents an invariant lift. The SO line case instead requires both twisted invariant vanishings.
4. Compute the matrix actions on u, retaining the GSp similitude and the orthogonal-line character.

**Source:** FKP22, Lemma A.11 and its proof, pp.47–49. The four classical cases yield C1/C2 after correcting the GL block dimensions and symplectic multiplier.

**Checks.**

- The (1,3) GL₄ parabolic meets the unequal-dimension test even though both block dimensions are odd. A split Levi-valued representation fails the noninjective-projection hypothesis.

<a id="property-d"></a>

### Property D(s,t,N)

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/property-d` (definition). **Planet:** Property D.

For a character χ:Γ_F→k× and integers s≥1,t≥1,N≥1, D(s,t,N) means that for every σ∈Aut(k), every finite extension F′/F of degree at most N, and every pair of integers m₁,m₂ with |m_i|≤t, the characters (χ^{m₁})^σ and χ^{m₂}κ̄^s have unequal restrictions to Γ_{F′}. Both exponents may be zero.

**Hypotheses and conventions.** Use actual character equality after restriction, independent of choices of embeddings of F′ into a separable closure.

**Needs:** `ArithmeticGaloisRepresentations:R01.1`; [GG2.0/residual-conditions](#residual-conditions).

**Construction or proof.**

1. Express each comparison in the existing continuous character carrier.
2. Include zero among the bounded powers; restriction and field automorphism act on the indicated sides.

**Source:** FKP22, Definition A.13, p.49; Example A.17, p.50. The bounded character-separation condition supplies C3/C4 when cyclotomic exclusion cannot be checked directly.

**Uses that determine the API.**

- Lemma A.14, pp.49–50: Excludes cyclotomic overlap after bounded-index restriction.
- Examples A.16–A.17, p.50: Produces explicit criteria for symplectic and equal-block cases.

**API.**

- `Lifting.property_d.restrict_test` (projection): Each extension of degree ≤N gives all the stated inequalities.
- `Lifting.property_d.monotone_bounds` (functoriality): D(s,t,N) implies D(s,t′,N′) for t′≤t and N′≤N.
- `Lifting.property_d.zero_exponents` (projection): D(s,t,N) forces κ̄^s to remain nontrivial on every extension of degree ≤N.

**Unit tests.**

- `Lifting.property_d.cyclotomic_zero` (non-example): If κ̄^s=1 on Γ_F then the m₁=m₂=0 test fails.
- `Lifting.property_d.one_zero` (non-example): For s=t=N=1 and χ=κ̄, m₁=1,m₂=0 gives equality and D fails.
- `Lifting.property_d.finite_order` (computation): If χ is F_p-valued, separation reduces to requiring χ^aκ̄^s to have order >N for every integer |a|≤2t; this includes a=0.

**Checks.**

- If κ̄^s=1 on Γ_F then the m₁=m₂=0 test fails.

<a id="maximal-separation"></a>

### Character separation for maximal parabolics

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/maximal-separation` (theorem).

For each maximal parabolic P of a split reductive G there are constants b,s,t,N depending only on its root datum such that, for p≫G and absolutely M-irreducible r_M, C3,C4 follow from either [F(ζ_p):F(ζ_p)∩F(χ)]>b or D(s,t,N) for χ induced by the one-dimensional adjoint-Levi quotient. The latter χ is trivial on Z(G), and the intermediate field used in inflation–restriction is F(Ad r_M,μ_p).

**Hypotheses and conventions.** Use the primitive quotient character of M/Z(G), not an arbitrary determinant coordinate.

**Needs:** [GG2.1/property-d](#property-d); [GG2.1/cyclic-quotient-bound](#cyclic-quotient-bound); [GG2.1/central-jordan-holder](#central-jordan-holder); [GG2.1/irreducible-image-input](#irreducible-image-input); `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`.

**Construction or proof.**

1. Apply the irreducible-image cyclic-quotient bound to a bounded-index subgroup of the adjoint Levi.
2. All weights of the relevant adjoint constituents are bounded powers of χ after that restriction.
3. Use the stipulated character separation, then the p-kernel factor argument and inflation–restriction.

**Source:** FKP22, Lemma A.14, pp.49–50. The two alternative numerical hypotheses replace the general cyclotomic exclusion condition.

**Checks.**

- For two GL blocks of dimensions n₁,n₂ use exponents n₂/d and −n₁/d with d=gcd(n₁,n₂), so the quotient character is primitive.

<a id="explicit-separation"></a>

### GSp₄ and equal-block character examples

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/explicit-separation` (application).

In the GSp₄ Siegel case with Levi (r,δ), use χ=det(r)δ⁻¹ and D(1,1,4). If χ is F_p-valued, this D condition is equivalent to ord(χ^aκ̄)≥5 for every |a|≤2. Here the adjoint central weights are 0,1,−1 and their differences have absolute value at most two. For GL_{2n} with two n-dimensional blocks use χ=det(r₁)/det(r₂) and the full D(n,1,N), including all comparisons with either exponent zero.

**Hypotheses and conventions.** The other hypotheses of maximal separation and the relevant invariant criterion remain required.

**Needs:** [GG2.1/maximal-separation](#maximal-separation); [GG2.1/maximal-parabolic-criteria](#maximal-parabolic-criteria).

**Construction or proof.**

1. Compute the adjoint-Levi quotient character; scalar similitudes must act trivially.
2. Reduce D to orders of characters when σ fixes χ.
3. Keep zero-exponent inequalities in the equal-block specialization.

**Source:** FKP22, Examples A.16–A.17, p.50. These corrected examples keep the similitude and the missing zero-exponent conditions.

**Checks.**

- For GSp₄ scalar Levi points (cI,c²) give χ=1. The uncorrected det r character would instead be c².

<a id="borel-criteria"></a>

### Borel-valued residual criteria

**Target:** `GlobalGaloisDeformationsPartII:GG2.1/borel-criteria` (theorem).

Let ρ̄ take values in B(k)=T(k)U(k), U_ρ̄=im ρ̄∩U(k), and u_ρ̄ the k-span of log(U_ρ̄). Let z_{g^der}(u_ρ̄) carry the torus action via the residual torus character. Absence of 1 among its semisimple constituents gives C1; absence of κ̄⁻¹ gives C2. If for every constituent χ of g^der and σ∈Aut(k), χ^σ does not occur among constituents of g^der(1), then C3,C4 hold.

**Hypotheses and conventions.** p≫G; use all simple prime-field subquotients, not only quotients.

**Needs:** [GG2.0/residual-conditions](#residual-conditions); [GG2.1/central-jordan-holder](#central-jordan-holder); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ArithmeticGaloisRepresentations:G7`.

**Construction or proof.**

1. The equivariant exponential compares invariance under U_ρ̄ with Lie centralization.
2. Filter the Borel action to read off the stated characters.
3. Apply the central-factor argument and small-representation H¹ vanishing.

**Source:** FKP22, Lemma A.18, p.51. This criterion handles nonsemisimple Borel image by centralizers and character constituents.

**Checks.**

- For a torus-valued SL₂ representation with quadratic diagonal character the root is trivial; its full sl₂ invariants must be detected.

**Layer acceptance:** G2: read the exact Guralnick small-representation theorem. G4: resolve the polarized G_n coefficient convention at its owner. G6: obtain an owner for the large-prime exponential, centralizer and G-semisimplification inputs. Confirm corrected classical and character criteria independently.

## Layer GG2.2: Cyclic ramification classes

Kill the full dual Sha group, stabilize Sha for every cyclic prime-field submodule and dual quotient, obtain the one-prime ramification sequence and construct marked auxiliary classes. Prove the inductively quantified spanning and prescribed-vector forms of Proposition 3.6 and the conditional joint-inertia criterion for strong disjointness of the dual cocycle fields; expose the missing replacement for the unconditional claim as gap G1. Keep prime-field dimensions separate from residue-field dimensions.

<a id="cyclic-module"></a>

### Cyclic prime-field submodules

**Target:** `GlobalGaloisDeformationsPartII:GG2.2/cyclic-module` (definition). **Planet:** Cyclic ramification modules.

For a finite F_p[Γ]-module V and x∈V, V_x is the F_p-linear span of {γx:γ∈Γ}, with its induced action. For a k-module this is restriction of scalars followed by the same construction, not necessarily the k-span. Write V_Z for the corresponding span of a finite subset Z.

**Needs:** [GG2.0/lifting-datum](#lifting-datum); `mathlib:Submodule.span`; `mathlib:Representation`.

**Construction or proof.**

1. Take the submodule generated by the orbit in the existing linear representation.
2. Restrict the action and prove the universal property of the span.

**Source:** FKP22, Lemma 3.4 and Proposition 3.6, pp.11–15. The cyclic modules control the images of the new ramification classes.

**Uses that determine the API.**

- Proposition 3.6, pp.12–15: Classes with ramification x can be chosen in the image of H¹(V_x).
- Lemma 3.7, pp.15–16: Inertia generating V_x forces strong field disjointness.

**API.**

- `Lifting.cyclic_module.generator_mem` (projection): x belongs to V_x and every γ preserves V_x.
- `Lifting.cyclic_module.minimal` (characterisation): V_x⊂W for an invariant submodule W iff x∈W.
- `Lifting.cyclic_module.equivariant_map` (functoriality): An equivariant F_p-linear f satisfies f(V_x)=V_{f(x)}.

**Unit tests.**

- `Lifting.cyclic_module.zero` (degenerate): V_0=0.
- `Lifting.cyclic_module.trivial_k` (non-example): If k=F_{p²} acts trivially, V_1=F_p·1, not all k.
- `Lifting.cyclic_module.irreducible` (compatibility): For a simple F_p[Γ]-module and nonzero x, V_x=V, agreeing with the existing submodule span.

**Checks.**

- V_0=0.

<a id="sha-killing"></a>

### Finite-prime annihilation of the dual Sha group

**Target:** `GlobalGaloisDeformationsPartII:GG2.2/sha-killing` (theorem). **Planet:** Dual Sha annihilation.

Under C4 there is a finite set T⊃S of trivial primes such that Sha¹_T(M*)=ker(H¹(Γ_{F,T},M*)→⊕_{v∈T}H¹(Γ_{F_v},M*)) is zero. Each successive nonzero Sha class is detected at a trivial prime outside any prescribed finite excluded set. Consequently Sha²_T(M)=0 by global duality.

**Hypotheses and conventions.** For number fields include the archimedean convention and the places above p in the global duality input.

**Needs:** [GG2.0/residual-conditions](#residual-conditions); [GG2.0/cocycle-fields](#cocycle-fields); `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`; `ArithmeticGaloisDuality:R02.4/poitou-tate`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `FunctionFieldArithmetic:FA.5`; `ArithmeticGaloisDuality:R02.5`; `tauceti:TauCeti.ContCohomology.explicitInfRes_exact`.

**Construction or proof.**

1. Inflation–restriction (the pinned explicitInfRes_exact for the open normal subgroup Γ_K) and C4 inject a nonzero dual class into Hom(Γ_K,M*).
2. Choose a nonzero evaluation and realize it by Frobenius at a prime split in K.
3. Adding that prime decreases the finite-dimensional Sha¹; iterate and invoke Poitou–Tate.

**Source:** FKP22, Opening of §3 and Lemma 3.4 setup, pp.10–11; FKP19 Lemma 5.13, pp.38–39. The argument reduces killing a global obstruction to detecting finitely many dual classes.

**Checks.**

- A nonzero residual dual Sha class restricts nontrivially to Γ_K under C4. Without C4 a class inflated from Gal(K/F) is invisible to primes split in K.

<a id="cyclic-sha-stabilisation"></a>

### Simultaneous Sha stabilization for cyclic modules

**Target:** `GlobalGaloisDeformationsPartII:GG2.2/cyclic-sha-stabilisation` (lemma).

Enlarge T so that Sha¹_T(M_Z*) has minimal dimension among enlargements by trivial primes for every cyclic submodule M_Z⊂M. Also arrange the analogous minimum for Sha¹_T((M_λ)*) for every cyclic submodule M_λ⊂M*. These are dual quotients of two possibly different modules; the dual of a cyclic module need not be cyclic. There are finitely many such modules. Further enlargement by trivial primes preserves the minima.

**Needs:** [GG2.2/cyclic-module](#cyclic-module); [GG2.2/sha-killing](#sha-killing); `ArithmeticGaloisDuality:R02.4/poitou-tate`.

**Construction or proof.**

1. Minimize one of the finitely many nonnegative dimensions at a time.
2. Use restriction on ramification and the local unramified condition to identify the stabilized Sha group under further enlargement.

**Source:** FKP22, Lemma 3.4 and proof of Proposition 3.6, pp.11–13. Minimal Sha for all cyclic modules is needed to lift local ramification classes through submodules.

**Checks.**

- Use a cyclic module whose dual is not cyclic; stabilizing only cyclic submodules of the dual omits the required quotient.

<a id="one-prime-sequence"></a>

### The one-prime ramification exact sequence

**Target:** `GlobalGaloisDeformationsPartII:GG2.2/one-prime-sequence` (theorem).

For T with the stabilized Sha conditions and any trivial prime w∉T, put L_{w,Z}={φ∈H¹(Γ_{F_w},M_Z):φ(τ_w)∈F_p Z}. There is an exact sequence 0→H¹(Γ_{F,T},M_Z)→H¹_{L_{w,Z}}(Γ_{F,T∪{w}},M_Z)→F_p Z→0, whose last map evaluates at τ_w. The same statement holds for the cyclic modules M_λ⊂M*. Thus every vector of F_p Z is realizable, without a remaining obstruction condition.

**Hypotheses and conventions.** The exact local conditions are unramified away from T and unrestricted at T; all dual conditions are their annihilators.

**Needs:** [GG2.2/cyclic-sha-stabilisation](#cyclic-sha-stabilisation); `ArithmeticGaloisDuality:R02.5/selmer-condition-comparison`; `ArithmeticGaloisDuality:R02.5/greenberg-wiles-formula`; `ArithmeticGaloisDuality:R02.4/poitou-tate`; [GG2.0/trivial-prime](#trivial-prime); `ArithmeticGaloisDuality:R02.5`.

**Construction or proof.**

1. Apply the Greenberg–Wiles formula to the unrestricted old local conditions and the new condition L_{w,Z}.
2. Stabilized dual Sha makes the dual terms cancel, so the dimension increases by one when Z≠0.
3. The inertia map has kernel exactly the old unramified classes, hence is surjective; for Z=0 both the increase and target are zero.
4. Repeat for M_λ using its separate dual-quotient stabilization.

**Source:** FKP22, Lemma 3.4, pp.11–12. This is the precise duality input behind the one-prime auxiliary classes.

**Checks.**

- For Z=0 the last term is zero and no new ramification class is promised. For nonzero Z the new inertia line has F_p-dimension one, even when [k:F_p]>1.

<a id="spanning-classes"></a>

### Inductively chosen spanning ramification classes

**Target:** `GlobalGaloisDeformationsPartII:GG2.2/spanning-classes` (theorem). **Planet:** Spanning ramification classes.

Under C4 choose T and marked trivial primes t₀,t_b as in Proposition 3.6. Let r=dim_Fp coker Ψ_T for localization of H¹(Γ_{F,T},M). For every c≥D_cyc+1 and finite Galois L/F containing K, unramified outside T and disjoint over K from K∞ and the fields cut out by all old classes in H¹(Γ_{F,T},M*), there are inductively chosen pairs (T_i,α_i), norm classes q_i≡1 mod p^{D_cyc} but not mod p^{D_cyc+1}, and vectors Y_i in the old local direct sum, 1≤i≤r. After each such choice an arbitrary element g_i∈Gal(L/K) may be specified; the next pair may depend on the preceding g_j. Each resulting set l_i of primes has positive upper density, lies in the Chebotarev set specifying g_i and q_i mod p^c, and admits h^{(w)}∈H¹(Γ_{F,T∪{w}},M) with old restriction Y_i and inertia values h^{(w)}(τ_w),h^{(w)}(τ_{t₀})∈F_p X_{α_i}∖{0}. The class lies in the image for M_{X_{α_i}}, and the Y_i map to an F_p-basis of coker Ψ_T.

**Hypotheses and conventions.** The marked primes and dual basis are chosen once in the preparatory construction. The Frobenius coset must be nonorthogonal to the chosen root vector under the calibrated pairing.

**Needs:** [GG2.2/one-prime-sequence](#one-prime-sequence); [GG2.2/cyclic-module](#cyclic-module); [GG2.0/cocycle-fields](#cocycle-fields); [GG2.0/cyclotomic-intersection](#cyclotomic-intersection); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `FunctionFieldArithmetic:FA.5`.

**Construction or proof.**

1. Choose a dual class detecting a missing cokernel direction.
2. Move a root direction to make its pairing nonzero, and impose the resulting nonorthogonal Frobenius coset.
3. Apply the one-prime sequence to M_X, and use finite pigeonhole to make old local values constant on a positive-upper-density subset.
4. Repeat until the F_p cokernel basis is exhausted, respecting the order of choices.

**Source:** FKP22, Proposition 3.6(1), pp.12–15. The quantifiers are inductive; the source does not give one fixed set of choices valid for all subsequent Frobenius prescriptions.

**Checks.**

- If coker Ψ_T has F_p-dimension zero the spanning family is empty; the prescribed-vector construction can still be nonempty.

<a id="prescribed-vector-classes"></a>

### Ramification classes for a prescribed vector

**Target:** `GlobalGaloisDeformationsPartII:GG2.2/prescribed-vector-classes` (theorem).

With the same preparation, every nonzero Z∈M admits a positive-upper-density set of trivial primes w and classes h_Z^{(w)} from H¹(M_Z), with h_Z^{(w)}(τ_w),h_Z^{(w)}(τ_{t₀})∈F_p Z∖{0} and constant old local restriction. The same norm and disjoint-extension Frobenius prescriptions are available; there is no assertion that this particular old restriction is a cokernel basis vector.

**Needs:** [GG2.2/spanning-classes](#spanning-classes); [GG2.2/cyclic-module](#cyclic-module); [GG2.2/one-prime-sequence](#one-prime-sequence); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. Repeat the stabilized-Sha and finite-pigeonhole argument for M_Z.
2. Use the marked prime t₀ to impose nonzero ramification in the same prime-field line.

**Source:** FKP22, Proposition 3.6(2), pp.12–15. This variant provides root vectors spanning M, independently of the localization cokernel basis.

**Checks.**

- For k=F_{p²} the permitted inertia values are nonzero elements of F_p Z, not arbitrary nonzero k-multiples.

<a id="marked-dual-classes"></a>

### Marked dual auxiliary classes

**Target:** `GlobalGaloisDeformationsPartII:GG2.2/marked-dual-classes` (construction). **Planet:** Marked dual classes.

Choose a k-basis {e_b*} of M*. At each prime w in the prescribed families construct η_b^{(w)}=θ_b+θ_b^{(w)}∈H¹(Γ_{F,T∪{w}},M*), with inertia e_b* at both w and t_b, zero at the other t_{b′}, and unramified at t₀. Here θ_b is unramified outside T with only t_b among the marked primes, while θ_b^{(w)} is unramified at all marked primes and has inertia e_b* at w. Both restrictions to Γ_K have image in the cyclic module generated by e_b*.

**Hypotheses and conventions.** Use the dual quotient stabilization and the marked-prime construction of Proposition 3.6.

**Needs:** [GG2.2/cyclic-sha-stabilisation](#cyclic-sha-stabilisation); [GG2.2/one-prime-sequence](#one-prime-sequence); [GG2.0/cocycle-fields](#cocycle-fields).

**Construction or proof.**

1. Construct θ_b once at its marked prime.
2. Construct θ_b^{(w)} with the complementary ramification pattern and add.
3. Check each inertia value before passing to its cocycle field.

**Source:** FKP22, Construction after Proposition 3.6 and Lemma 3.7, pp.15–16. The two marked inertia locations separate the indices in the strong disjointness argument.

**Uses that determine the API.**

- Lemma 3.7, pp.15–16: The marked inertia separates basis indices at one fixed w; separation as w varies requires the additional joint criterion below.
- Proposition 3.8, pp.16–19: The density application needs a replacement for the unsupported full-family independence assertion.

**API.**

- `Lifting.marked_dual_classes.inertia_new` (projection): η_b^{(w)}(τ_w)=e_b*.
- `Lifting.marked_dual_classes.inertia_marked` (projection): At t_{b′} its value is e_b* if b′=b and zero otherwise; it is unramified at t₀.
- `Lifting.marked_dual_classes.cyclic_image` (compatibility): Each individual restriction has image equal to the cyclic Γ_F-module generated by e_b*. This does not assert that one inertia tuple generates the product over b.

**Unit tests.**

- `Lifting.marked_dual_classes.single_basis` (computation): With a one-element basis there are exactly two marked ramification locations, w and t_b.
- `Lifting.marked_dual_classes.different_basis` (non-example): η_b^{(w)} has zero inertia at t_{b′} for b′≠b; replacing all marked values by one vector fails.
- `Lifting.marked_dual_classes.old_prime` (compatibility): For two isomorphic cyclotomic lines, inertia at w has the diagonal tuple (1,1); its orbit spans a diagonal line, even though each projection generates its cyclic image.

**Checks.**

- With a one-element basis there are exactly two marked ramification locations, w and t_b.

<a id="ramification-disjointness"></a>

### Inertia-generated extensions are disjoint

**Target:** `GlobalGaloisDeformationsPartII:GG2.2/ramification-disjointness` (lemma).

Let L_i/K be finite elementary abelian p-extensions Galois over F, and let v_i be places such that all L_j with j≠i and a fixed base extension B/K are unramified at v_i. If the Γ_F-conjugates of inertia at v_i generate Gal(L_i/K), the L_i are strongly linearly disjoint over K and jointly disjoint from B, provided B is unramified at all v_i. For a product of several extensions at one place, generation must hold in the joint Galois image, not just in every projected factor.

**Hypotheses and conventions.** The base extension B/K is finite and Galois over F. Unramified at v_i means unramified at every K-place over the chosen F-place. Finite cyclotomic layers satisfy this condition.

**Needs:** [GG2.0/cocycle-fields](#cocycle-fields); [GG2.2/cyclic-module](#cyclic-module); `ArithmeticGaloisRepresentations:R01.1`.

**Construction or proof.**

1. A common quotient of L_i with the compositum of the others kills its inertia at v_i.
2. Equivariance then kills the generated module; induct on the finite family.
3. For grouped extensions verify joint inertia generation explicitly before invoking the quotient argument.

**Source:** FKP22, Lemma 3.7, pp.15–16; preceding construction, p.15. Strong disjointness is forced by generated inertia, not by a pairwise intersection test.

**Checks.**

- For L₁,L₂,L₃ the three degree-p subfields of one C_p²-extension, pairwise disjointness holds but the joint inertia-generation hypothesis must fail.

<a id="dual-strong-disjointness"></a>

### Conditional strong disjointness from joint inertia

**Target:** `GlobalGaloisDeformationsPartII:GG2.2/dual-strong-disjointness` (theorem). **Planet:** Strong disjointness.

Fix finitely many new primes w. Put L_w=∏_b K_{η_b^(w)}. For each fixed w the marked t_b inertia proves Gal(L_w/K)=∏_b M*_{e_b*}. Assume in addition that the Γ_F-conjugates of the JOINT inertia subgroup at w generate this entire product, and that a base extension B/K is unramified at every w. Then the fields L_w are strongly linearly disjoint over K and jointly disjoint from B. In particular one may take B to be any finite layer of K∞. The extra generation hypothesis is essential; FKP22 v5 Lemma 3.7 does not establish it and its unconditional all-(w,b) assertion is false under Assumption 3.1 alone.

**Hypotheses and conventions.** The generation condition concerns the whole joint image, not every projection separately. No unconditional mixed h/η disjointness is inferred from individual inertia generators.

**Needs:** [GG2.2/marked-dual-classes](#marked-dual-classes); [GG2.2/ramification-disjointness](#ramification-disjointness); [GG2.0/cyclotomic-intersection](#cyclotomic-intersection); [GG2.2/spanning-classes](#spanning-classes); [GG2.2/prescribed-vector-classes](#prescribed-vector-classes).

**Construction or proof.**

1. At one fixed w use the t_b places to identify the product of the individual cyclic images.
2. For different w apply inertia-generated disjointness to the grouped L_w, using precisely the extra joint-generation assumption.
3. Pass through all finite cyclotomic layers, which are unramified away from p.
4. Record gap G1 for the replacement that the doubling proof actually needs under its main hypotheses; do not apply this conditional result unless its extra assumption is verified.

**Source:** FKP22, Lemma 3.7 and proof, pp.15–16; use in Proposition 3.8, pp.17–19 (arXiv v5). The source gives an unconditional family claim; this plan retains only the valid conditional joint-inertia argument and records the counterexample as E45.

**Checks.**

- Test M*=F_p(κ̄)³ with F=Q and trivial SL₂ residual representation. For two basis indices identify their cyclic lines and put ζ_w=η_1^(w)−η_2^(w). This class is unramified at w and lies in the finite group H¹(Γ_{Q,T},F_p(κ̄)).
- Two distinct new primes w,w′ have ζ_w=ζ_w′. The resulting nonzero relation among four scalar cocycles persists on Γ_K, since H¹(Gal(Q(μ_p)/Q),F_p(κ̄))=0. Their four degree-p fields therefore cannot be strongly disjoint.
- This example satisfies Assumption 3.1 but fails C1. It refutes the lemma in its stated scope, without refuting Theorem 5.2.
- The failure is not confined to C1-failing data. Let k=F_p and suppose M* is semisimple with a simple constituent of multiplicity at least two, as for the F₄-valued residual images of FKP19 Proposition 7.8 (image A₆ or PSL₂(F₁₃), with adjoint multiplicities above one by FKP19 Remark 7.9), which satisfy C1–C4. For every k-basis the F_p[Γ_F]-span of the inertia tuple (e_b*)_b has that constituent with multiplicity at most its dimension, while ∏_b M*_{e_b*} has it with multiplicity at least the number of basis vectors meeting its isotypic part. So the inertia at w generates a proper submodule, L_w has a nontrivial subextension E_w unramified at w, and E_w lies in the finite maximal elementary abelian p-extension of K unramified outside T. Hence E_w=E_w′ for some w≠w′ and L_w∩L_w′≠K.

**Layer acceptance:** G1: repair the all-primes/all-basis marked-field claim, which also fails under C1–C4 when M* has repeated constituents, and establish the quantitative input needed for doubling. G3: positive-characteristic duality exports. G6(iv): finite-field root position.

## Layer GG2.3: Doubling and controlled finite-level lifts

Start from locally liftable residual data, construct the initial mod-uniformizer-squared lift, and use the doubling method with the corrected two inertia coefficients. Prove the density selection, congruence-field disjointness and general-position torus input, then construct compatible finite-level lifts with the local control of Theorem 4.4. The tower need not have a fixed finite ramification set.

<a id="initial-mod-square"></a>

### The initial lift modulo ϖ²

**Target:** `GlobalGaloisDeformationsPartII:GG2.3/initial-mod-square` (theorem).

After choosing T with Sha²_T(M)=0, a residual fixed-μ representation that has the specified local μ-lifts at every v∈T admits a global fixed-μ lift modulo ϖ². The local obstruction classes vanish by those local lifts; global duality kills the remaining Sha² obstruction. Subsequent H¹ modification can impose the specified old local congruences when the localization cokernel has been supplied by the spanning classes.

**Hypotheses and conventions.** The added trivial places admit their chosen local lifts; killing Sha² alone does not prove local liftability.

**Needs:** [GG2.2/sha-killing](#sha-killing); [GG2.2/spanning-classes](#spanning-classes); `GlobalGaloisDeformations:R04.3`; `LocalGaloisDeformationRings:R08.1/g-valued-framed-ring`; `GlobalGaloisDeformations:R04.1`.

**Construction or proof.**

1. Form the actual global fixed-multiplier H² obstruction using the owner’s deformation theory.
2. Restrict to each local μ-lift to show it lies in Sha².
3. Kill it, then adjust the torsor of lifts by H¹.

**Source:** FKP22, Paragraph after Lemma 3.7 and Proposition 3.8, p.16 (v5 has no §3.2). The locally trivial obstruction argument precedes the doubling construction.

**Checks.**

- A local obstruction in H² at an original ramified place is not killed by Sha²=0. Require an actual local fixed-μ lift first.

<a id="density-selection"></a>

### Density selection with independent cocycle fields

**Target:** `GlobalGaloisDeformationsPartII:GG2.3/density-selection` (lemma).

Suppose the finite cocycle fields used to test a Frobenius prescription are strongly disjoint over K, their degrees are bounded, and the norm prescriptions agree on the common cyclotomic subfield. If each unused independent test has conditional success proportion at least ε>0, the density of the set failing all s tests is at most (1−ε)^s. Consequently some test succeeds in any fixed positive-upper-density prime set once s is large enough.

**Hypotheses and conventions.** The positive-upper-density set is the previously selected l_i; one cannot simply intersect an arbitrary such set with a Chebotarev set.

**Needs:** [GG2.2/dual-strong-disjointness](#dual-strong-disjointness); `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `FunctionFieldArithmetic:FA.5`.

**Construction or proof.**

1. Compute finite Chebotarev densities in the product Galois group, conditional on the common field.
2. Bound the failure proportion by the product of the uniform failure bounds.
3. Choose s so that this bound is less than the upper density of l_i.

**Source:** FKP22, Proof of Proposition 3.8, pp.17–19. The quantitative failure estimate replaces an invalid assertion about arbitrary density intersections.

**Checks.**

- With ε=1/2 and s independent tests, failure density is at most 2^{-s}; choose s so this is below the given upper density. No arbitrary intersection-of-positive-density assertion is used.

<a id="trivial-prime-pairing"></a>

### The normalized trivial-prime local pairing

**Target:** `GlobalGaloisDeformationsPartII:GG2.3/trivial-prime-pairing` (theorem).

Let W be a free O/ϖ^r-module with trivial local action, q_w≡1 mod ϖ^r, and W*=Hom_O(W,O/ϖ^r(1)). Choose τ_w compatibly with the chosen p-power root of unity, arithmetic σ_w, and the invariant map normalized by local reciprocity sending a uniformizer to geometric Frobenius. Then inv_w(φ∪ψ)=−⟨φ(σ_w),ψ(τ_w)⟩+⟨φ(τ_w),ψ(σ_w)⟩. In particular the two single-unramified formulas have opposite signs.

**Hypotheses and conventions.** p is odd; the coefficients and tame-generator calibration are part of the assertion.

**Needs:** [GG2.0/trivial-prime](#trivial-prime); `ArithmeticGaloisDuality:R02.1`; `ArithmeticGaloisDuality:D7`; `ArithmeticGaloisRepresentations:R01.2`.

**Construction or proof.**

1. Use the local reciprocity and Kummer identifications supplied by local duality.
2. Evaluate an unramified character on the geometric Frobenius image of a uniformizer.
3. Use graded commutativity for the swapped term.

**Source:** FKP19, FKP19 Lemma 3.9, p.19; FKP22 proof of Proposition 3.8, pp.16–18. The calibrated sign is needed when the primal and dual Frobenius conditions are exchanged.

**Checks.**

- For the unramified and tame basis u,t at a trivial prime, u∪u=t∪t=0 and u∪t=−t∪u. Reversing the Frobenius convention changes the calibrated overall sign.

<a id="doubling"></a>

### Doubling with controlled inertia and Frobenius

**Target:** `GlobalGaloisDeformationsPartII:GG2.3/doubling` (theorem). **Planet:** Doubling method.

Given the initial mod-ϖ² lift and desired old local correction z, choose finitely many pairs of distinct trivial primes (w_i,w_i′) and h= h_old−Σ_i h^{(w_i)}+2Σ_i h^{(w_i′)}. The modification by h agrees with z at old places, has inertia −X_i at w_i and 2X_i at w_i′, and has Frobenius values in the required central torus cosets for the selected roots and norm classes. The root directions may be chosen to span M while their old local restrictions span the localization cokernel.

**Hypotheses and conventions.** p is odd; −X_i and 2X_i must not be identified except at p=3. The actual torus coset includes the prescribed multiplier.

**Needs:** [GG2.3/initial-mod-square](#initial-mod-square); [GG2.2/spanning-classes](#spanning-classes); [GG2.2/prescribed-vector-classes](#prescribed-vector-classes); [GG2.3/density-selection](#density-selection); [GG2.3/trivial-prime-pairing](#trivial-prime-pairing); [GG2.2/marked-dual-classes](#marked-dual-classes); `GlobalGaloisDeformations:R04.1`.

**Construction or proof.**

1. Solve the old localization equation with the spanning classes.
2. Use marked dual fields and the calibrated cup pairing to translate the new-prime constraints into independent Frobenius evaluations.
3. Apply density selection to choose the two families.
4. Evaluate the explicit linear combination at each inertia generator and old place.

**Source:** FKP22, Proposition 3.8, pp.16–19. The doubling formula preserves the old correction but has two different new inertia coefficients.

**Checks.**

- For p=5 the two new inertia coefficients −1 and 2 are distinct and nonzero; demanding equal coefficients is a regression.

<a id="congruence-field-disjointness"></a>

### Disjointness from the higher congruence field

**Target:** `GlobalGaloisDeformationsPartII:GG2.3/congruence-field-disjointness` (lemma).

Under C1,C3, if ρ_{n−1} is a finite-level fixed-μ lift whose image contains the full derived congruence subgroup and L=K(ρ_{n−1}(g^der)), then L is disjoint over K from the compositum of K∞ and all dual cocycle fields used in doubling. The congruence filtration of Gal(L/K) has constituents that are quotients of sums of M; its possible abelian quotients cannot occur in M*, nor in the trivial cyclotomic quotient.

**Hypotheses and conventions.** The field is the adjoint congruence field, with the coefficient level and component splitting field fixed.

**Needs:** [GG2.0/residual-conditions](#residual-conditions); `ReductiveGroupsPartII:RG2.0`; [GG2.0/cocycle-fields](#cocycle-fields); [GG2.0/cyclotomic-intersection](#cyclotomic-intersection).

**Construction or proof.**

1. Use the smooth-group congruence quotients and the Lie action.
2. Pass a hypothetical common quotient down to a simple prime-field constituent.
3. Apply C3 for the dual fields and C1 for the trivial quotient, using the prime-to-p component action.
4. Use the module image of the whole dual compositum; this argument does not require independence among the individual dual fields.

**Source:** FKP22, Lemma 4.3, pp.19–20. This allows new auxiliary primes to satisfy higher-level Frobenius constraints.

**Checks.**

- A common elementary abelian quotient with trivial conjugation is excluded by C1; one with dual constituents is excluded by C3. Neither follows from pairwise field intersections alone.

<a id="controlled-tower"></a>

### Controlled compatible finite-level lifts

**Target:** `GlobalGaloisDeformationsPartII:GG2.3/controlled-tower` (theorem). **Planet:** Controlled lifting tower.

Assume C1,C3,C4 and specified local μ-lifts λ_v for v∈S. For every prescribed finite accuracy and avoidance set there are increasing finite ramification sets T_n and compatible fixed-μ lifts ρ_n:Γ_{F,T_n}→G(O/ϖ^n), n≥2, with ρ_n|Γ_{F_v} strictly conjugate to λ_v modulo ϖ^n at every original v∈S, and full derived congruence image at every level n. At an early auxiliary place the tower follows a fixed smooth O-valued local lift. At a late auxiliary place of norm depth D_cyc and ramification index e=v_ϖ(p), it has the root-type form: ρ_{eD_cyc} is central, α(ρ(σ))=q, and every root β has β(ρ_{eD_cyc+1}(σ))≠1 at its first noncentral level. New primes can be required to avoid any fixed finite set.

**Hypotheses and conventions.** The initial finite accuracy is chosen deep enough for relative theory. The early/late cutoff eD_cyc is fixed by the coefficient ramification index and the roots of unity in K; it is not a free depth parameter. The tower alone makes no assertion of one finite ramification set in its inverse limit.

**Needs:** [GG2.3/doubling](#doubling); [GG2.3/congruence-field-disjointness](#congruence-field-disjointness); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ReductiveGroupsPartII:RG2.0`; `LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p`; `GlobalGaloisDeformations:R04.3`; `GlobalGaloisDeformations:R04.1`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Construction or proof.**

1. Initialize by doubling, choosing root directions spanning M.
2. At each step use congruence-field disjointness to impose the next finite-level Frobenius values.
3. Choose a maximal torus in general position with respect to the required hyperplanes and use the smooth root lifting functor.
4. Apply doubling to remove the old local error, then keep the lifts compatible while enlarging T_n.

**Source:** FKP22, Theorem 4.4 and its proof, pp.20–23. The controlled tower supplies the deep starting representation for relative Selmer annihilation.

**Checks.**

- For e=2,D_cyc=1 the fixed first noncentral level is 3. Increasing the relative depth M does not change that cutoff.

**Layer acceptance:** G1: establish conditional-success estimates in the actual auxiliary-field composita before applying doubling or its controlled tower. G6(iv): general-position toral elements.

## Layer GG2.4: Relative local conditions and Selmer images

Import the root lifting functors and smooth-point analytic neighborhoods from LocalGaloisDeformationRings. Plan their lifting-specific cocycle lattices, coefficient exactness, relative Selmer images, balance, and local conditions at Q_N. Establish the compact p-adic Lie cohomology bound and its reduction-vanishing consequence, exposing the analytic comparison input instead of assuming it.

<a id="relative-selmer-image"></a>

### Relative Selmer images

**Target:** `GlobalGaloisDeformationsPartII:GG2.4/relative-selmer-image` (definition). **Planet:** Relative Selmer groups.

For compatible local conditions L_{r,v}⊂H¹(Γ_{F_v},M_r), 1≤r≤n, define RelSel_r=im(H¹_{L_r}(Γ_{F,S},M_r)→H¹_{L_1}(Γ_{F,S},M_1)) and RelDual_r by the analogous reduction for M_r*=Hom_O(M_r,O/ϖ^r(1)) with annihilator local conditions. These are k-subspaces of the residual Selmer groups. Balanced means equality of the cardinalities of the full primal and dual Selmer groups at every level 1≤r≤n, not an assumed equality of their images.

**Hypotheses and conventions.** M_r is the actual adjoint module of a fixed finite lift, with coefficient reductions; the local conditions are compatible with them.

**Needs:** `ArithmeticGaloisDuality:R02.5`; `ArithmeticGaloisDuality:R02.4/poitou-tate`; `ArithmeticGaloisDuality:R02.1`; `mathlib:Submodule.map`; `mathlib:Subgroup.map`.

**Construction or proof.**

1. Use the existing Selmer kernel and coefficient functoriality.
2. Take its linear image under reduction.
3. Use local duality for the annihilator conditions, without identifying the full residual Selmer group with the reduction image.

**Source:** FKP19, FKP19 Definition 6.2 and Lemma 6.3, pp.44–45. The image, rather than the full residual group, is the object killed by relative deformation theory.

**Uses that determine the API.**

- Theorem 5.4, pp.25–26: Only classes with nonzero relative reduction need a detection prime.
- Theorem 6.9 of FKP19, pp.49–50: Kills both relative images while allowing full level-M Selmer groups to remain nonzero.

**API.**

- `Lifting.relative_selmer_image.image_iff` (characterisation): A residual Selmer class belongs to RelSel_r iff it has a level-r Selmer preimage.
- `Lifting.relative_selmer_image.level_one` (compatibility): RelSel_1 is the full residual Selmer group, since reduction at level one is the identity.
- `Lifting.relative_selmer_image.decreasing` (functoriality): For r≤s, RelSel_s⊂RelSel_r, and likewise for the dual, whenever the indicated reductions preserve local conditions.

**Unit tests.**

- `Lifting.relative_selmer_image.identity` (compatibility): The image of the identity on any Selmer space is that space, agreeing with Submodule.map id.
- `Lifting.relative_selmer_image.zero_reduction` (non-example): For a nonzero source annihilated by the chosen reduction map, its relative image is zero even if the residual target is nonzero.
- `Lifting.relative_selmer_image.strict_image` (computation): The image of k→k², a↦(a,0), is one-dimensional and is not all the residual target.

**Checks.**

- The image of the identity on any Selmer space is that space, agreeing with Submodule.map id.

<a id="coefficient-exactness"></a>

### Exactness for compatible local cocycle lattices

**Target:** `GlobalGaloisDeformationsPartII:GG2.4/coefficient-exactness` (theorem).

Suppose the preimages Z_{r,v} of L_{r,v} contain B¹ and fit into 0→Z_{a,v}→Z_{a+b,v}→Z_{b,v}→0 for all a,b>0 with a+b≤n. Then H¹_{L_a}(M_a)→H¹_{L_{a+b}}(M_{a+b})→H¹_{L_b}(M_b) is exact in the middle, and the first map is injective if H⁰(Γ_F,M_1)=0. The annihilator conditions give 0→Z^⊥_{b,v}→Z^⊥_{a+b,v}→Z^⊥_{a,v}, exact without a final surjectivity assertion, and the corresponding dual Selmer sequence with a,b reversed. The first map in the dual Selmer sequence is injective only under H⁰(Γ_F,M_1*)=0; middle exactness does not require either reduction map to be surjective.

**Needs:** [GG2.4/relative-selmer-image](#relative-selmer-image); `ArithmeticGaloisDuality:R02.5`; `ArithmeticGaloisDuality:R02.1`; `ArithmeticGaloisDuality:D7`.

**Construction or proof.**

1. Lift representatives in the cocycle diagram and use the local short exact sequences.
2. Use absence of residual invariants for uniqueness of the global preimage.
3. Dualize the coefficient maps using local Tate pairings; reverse their order.

**Source:** FKP19, FKP19 Lemma 6.1 and proof, pp.44–45. The proof provides middle exactness, not automatic surjectivity of a Selmer reduction.

**Checks.**

- A coefficient reduction can have a nonzero connecting obstruction. Only middle exactness is asserted; final surjectivity is not automatic.

<a id="relative-balance"></a>

### Balanced local conditions give balanced relative images

**Target:** `GlobalGaloisDeformationsPartII:GG2.4/relative-balance` (theorem). **Planet:** Relative balance.

Under C1,C2 and the cocycle exactness hypotheses, equality |Sel_r|=|DualSel_r| for every 1≤r≤n implies dim_k RelSel_n=dim_k RelDual_n. The local numerical conditions |L_{r,v}|=|H⁰_v(M_r)| away from p and |L_{r,v}|=|H⁰_v(M_r)|·|O/ϖ^r|^{[F_v:Q_p]dim Flag(G⁰)} at p, together with oddness and total reality in characteristic zero, supply the full-level balance by Greenberg–Wiles. In positive characteristic there is no p-adic or archimedean correction.

**Needs:** [GG2.4/coefficient-exactness](#coefficient-exactness); [GG2.4/relative-selmer-image](#relative-selmer-image); [GG2.0/residual-conditions](#residual-conditions); `ArithmeticGaloisDuality:R02.5/greenberg-wiles-formula`; [GG2.0/oddness](#oddness); `ArithmeticGaloisDuality:R02.5`.

**Construction or proof.**

1. Apply the coefficient exactness theorem at (n−1,1).
2. Compute image cardinalities by dividing adjacent full Selmer cardinalities.
3. Use the owner’s global cardinality formula and the stated local cardinalities to obtain equality at all levels.

**Source:** FKP19, FKP19 Lemma 6.3, p.45; FKP22 proof of Theorem 5.2, pp.24–25. Equality at finite levels yields equality for their mod-p images.

**Checks.**

- If full level-r Selmer groups have equal orders at r=n,n−1, the orders of their residual images agree after dividing by the corresponding kernels.

<a id="lie-cohomology-bound"></a>

### Uniform torsion in compact Lie-group cohomology

**Target:** `GlobalGaloisDeformationsPartII:GG2.4/lie-cohomology-bound` (theorem). **Planet:** Uniform cohomology bound.

Let Γ be a compact p-adic analytic group with semisimple Lie algebra and let V be a finite free O-module with continuous O-linear Γ-action. If V⊗Q_p has no Lie(Γ)-invariants, then for every i≥0 a single power of ϖ, depending on i,Γ,V and independent of r, kills H^i(Γ,V/ϖ^r). For i=1 the uniform bound holds without the no-invariants condition, using Whitehead in degrees 1 and 2. These are the continuous cohomology groups for the actual action, including its finite component action.

**Hypotheses and conventions.** Use a sufficiently small open analytic subgroup and transfer across its finite index; a reductive Lie algebra with nonzero center does not meet the stated semisimple hypothesis.

**Needs:** `ArithmeticGaloisDuality:R02.5`; `ArithmeticGaloisDuality:R02.1`; `ReductiveGroupsPartII:RG2.0`; `LocallyAnalyticDistributionsPartII:ND.0`; `NoncommutativeAndEquivariantIwasawa:NE.0`; `AutomorphicFormsOnReductiveGroups:AF.1a`.

**Construction or proof.**

1. Choose an open normal p-valued subgroup of finite index (requested from LocallyAnalyticDistributionsPartII ND.0; for open subgroups of G(O) the deep congruence subgroups of upstream RG2.0.3).
2. On it, use the finite free resolution over the completed group ring and the Ext description of continuous cohomology (requested from NoncommutativeAndEquivariantIwasawa NE.0) to get finite generation of H^i(Γ,V) and a bounded complex computing all H^i(Γ,V/ϖ^r).
3. Identify rational cohomology with Lie-algebra cohomology on that subgroup (Lazard V (2.4.10), requested from NE.0) and apply semisimple Lie-algebra vanishing, with only Whitehead H¹,H² in the degree-one statement (requested from AutomorphicFormsOnReductiveGroups AF.1a).
4. Finite generation and the universal-coefficient sequence of the bounded complex make the torsion exponent independent of r; pass to Γ through finite-index invariants (Hochschild–Serre).

**Source:** FKP19, FKP19 Lemma B.1 and proof, p.64; Lazard V, Theorems 2.2.2.3, 2.2.3.1 and 2.4.10, pp.165–166,178–179. The analytic comparison is an explicit prerequisite of the uniform finite-coefficient bound.
**Source:** Lazard65, III Proposition 3.1.3, pp.91–92; III Theorem 3.1.7.4, p.94; V §§2.2.2–2.2.3, pp.165–166 and Theorem 2.4.10, pp.178–179. Small analytic groups admit the finite completed-group-algebra resolution and rational cohomology comparison; pass to the full group through finite-index invariants.

**Checks.**

- For Γ with Lie algebra sl₂ the Whitehead H¹,H² input yields the degree-one bound even for a trivial rank-one lattice. A Lie algebra with central Q_p factor does not satisfy this semisimple hypothesis.

<a id="deep-reduction-vanishing"></a>

### Vanishing of sufficiently deep H¹ reduction

**Target:** `GlobalGaloisDeformationsPartII:GG2.4/deep-reduction-vanishing` (theorem).

For Γ,V as in the compact Lie bound, assume H⁰(Γ,V/ϖ)=0. For every m≥1 there is N such that for every N′≥N the coefficient reduction H¹(Γ,V/ϖ^{N′})→H¹(Γ,V/ϖ^m) is zero. In the adjoint application use the inverse image in the p-adic adjoint group of the full Γ_F image, including component action; C1 supplies its residual invariant vanishing.

**Needs:** [GG2.4/lie-cohomology-bound](#lie-cohomology-bound); [GG2.0/residual-conditions](#residual-conditions); [GG2.4/coefficient-exactness](#coefficient-exactness); `ArithmeticGaloisDuality:R02.1`; `ReductiveGroupsPartII:RG2.0`.

**Construction or proof.**

1. Use the coefficient exact sequence and H⁰ vanishing to identify the transition image with a high power of ϖ times an H¹ group.
2. Apply the uniform torsion exponent.
3. Apply the bound to the full compact group, not only to its connected component preimage.

**Source:** FKP19, FKP19 Corollary B.2 and proof, p.64; FKP22 §5, pp.23–24. The full Galois image is necessary when disconnected components remove adjoint invariants.

**Checks.**

- The reduction map to level m is zero for every larger level beyond N, not merely along one subsequence.

<a id="auxiliary-prime-set"></a>

### The relative auxiliary-prime set Q_N

**Target:** `GlobalGaloisDeformationsPartII:GG2.4/auxiliary-prime-set` (definition). **Planet:** Relative auxiliary primes.

Fix e|M,N with N≥4M, a fixed-μ lift ρ_N whose image contains the full derived congruence kernel, and F_N=F(ρ̄,Adρ_N), F_N*=F_N(μ_{p^{N/e}}). Q_N consists of trivial primes w unramified for ρ_N with q_w≡1 mod ϖ^M and q_w≢1 mod ϖ^{M+1}, ρ_M|Γ_{F_w} central, and a split maximal torus T and root α such that ρ_N(σ_w)∈T, α(ρ_N(σ_w))=q_w, and β(ρ_{M+1}(σ_w))≠1 for every root β. A member includes the chosen (T,α).

**Hypotheses and conventions.** M and N are positive multiples of e, N≥4M and M>eD_cyc; choose M large enough for deep reduction vanishing. Central at level M is not a requirement of triviality in the full group.

**Needs:** [GG2.0/trivial-prime](#trivial-prime); [GG2.3/controlled-tower](#controlled-tower); [GG2.3/congruence-field-disjointness](#congruence-field-disjointness); [GG2.4/deep-reduction-vanishing](#deep-reduction-vanishing); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. Express all conditions in the finite Galois group of F_N*/F.
2. Use full congruence image and disjointness from the cyclotomic extension to show this is a nonempty Chebotarev condition.

**Source:** FKP19, FKP19 Definition 6.6, pp.46–47. The first noncentral level must avoid every root hyperplane.

**Uses that determine the API.**

- Lemma 6.7 of FKP19, pp.46–47: Gives the stable root lifting fibers and rank-one unramified quotients.
- Theorem 5.4, pp.25–26: Specifies the primes at which both relative classes are detected.

**API.**

- `Lifting.auxiliary_prime_set.central_reduction` (projection): A Q_N prime has central ρ_M and trivial action on M_r for r≤M.
- `Lifting.auxiliary_prime_set.root_norm` (projection): Its chosen α satisfies α(ρ_N(σ_w))=q_w, with exact norm depth M.
- `Lifting.auxiliary_prime_set.positive_density` (constructor): The compatible finite Frobenius condition is nonempty and has positive Chebotarev density.

**Unit tests.**

- `Lifting.auxiliary_prime_set.wrong_depth` (non-example): A trivial prime with q_w≡1 mod ϖ^{M+1} fails membership.
- `Lifting.auxiliary_prime_set.other_root` (non-example): Satisfying the α equation while some other β is 1 at level M+1 fails membership.
- `Lifting.auxiliary_prime_set.adjoint` (compatibility): For adjoint G, central reduction is the identity; for GL_n a scalar need not be the identity.

**Checks.**

- A trivial prime with q_w≡1 mod ϖ^{M+1} fails membership.

<a id="root-local-condition"></a>

### Relative root local conditions

**Target:** `GlobalGaloisDeformationsPartII:GG2.4/root-local-condition` (definition). **Planet:** Relative root condition.

At w∈Q_N let Z^α_{r,w} be the local cocycle lattice of FKP19 Lemma 3.5 for the chosen ρ_N,T,α and let L^α_{r,w} be its image in H¹(M_r), 1≤r≤M. It contains coboundaries and is generated by divided coboundaries, unramified toral directions in ker(dα), and the ramified root direction g_α. Its dual condition is its local Tate annihilator. The root lifting functor is supplied by the local deformation owner; this definition selects its relative cohomological condition.

**Hypotheses and conventions.** N≥4M; use the actual lattice, not merely its dimension or a formal-smoothness assertion.

**Needs:** [GG2.4/auxiliary-prime-set](#auxiliary-prime-set); `LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p`; `ArithmeticGaloisDuality:R02.5`; `ArithmeticGaloisDuality:D7`.

**Construction or proof.**

1. Import the root lifting functor and its explicit cocycle lattice from the local owner.
2. Take its H¹ image and the local annihilator.
3. Use the generator formula to prove coefficient exactness and cardinalities.

**Source:** FKP19, FKP19 Lemmas 3.5 and 6.7, pp.17–18,46–47. The lattice controls finite lifting fibers even when the local residual representation is trivial.

**Uses that determine the API.**

- Lemma 6.3 of FKP19, p.45: Coefficient exactness and cardinality make relative Selmer balance possible.
- Theorem 6.9 of FKP19, pp.49–50: The two rank-one quotients allow primal/dual detection at one prime.

**API.**

- `Lifting.root_local_condition.coefficient_exact` (compatibility): For a+b≤M the lattices fit into 0→Z^α_a→Z^α_{a+b}→Z^α_b→0.
- `Lifting.root_local_condition.fiber_stability` (compatibility): For m≥N−M and r≤M the nonempty fibers of the relative root lifting functor from level m+r to m are stable under Z^α_r.
- `Lifting.root_local_condition.balanced_cardinality` (characterisation): |L^α_r|=|H⁰_w(M_r)| and each primal or dual unramified quotient by its intersection with L^α_r or its annihilator is O/ϖ^r.

**Unit tests.**

- `Lifting.root_local_condition.coroot` (computation): The primal unramified quotient is generated by the σ_w value dα∨(1).
- `Lifting.root_local_condition.dual_root` (computation): The dual quotient is detected by evaluation on g_α and has length r, not one independent of r.
- `Lifting.root_local_condition.missing_generator` (non-example): The unramified ker(dα) directions alone omit the ramified root class and fail the balanced-cardinality and fiber-stability contracts.

**Checks.**

- The primal unramified quotient is generated by the σ_w value dα∨(1).

<a id="smooth-neighborhood-conditions"></a>

### Cocycle conditions near smooth local points

**Target:** `GlobalGaloisDeformationsPartII:GG2.4/smooth-neighborhood-conditions` (theorem).

At each prescribed O-valued local lift lying at a smooth point of the generic local deformation space, there are an analytic neighborhood Y and sufficiently deep integral reductions such that, for every bounded r, the nonempty fibers from level m+r to m in Y are stable under submodules Z_{r,v} containing B¹ and satisfying coefficient short exactness. Away from p their H¹ images have size |H⁰_v(M_r)|; at p on a Hodge–Tate regular de Rham component their size is |H⁰_v(M_r)|·|O/ϖ^r|^{[F_v:Q_p]dim Flag(G⁰)}. One finite coefficient extension provides smooth points in each chosen component arbitrarily close to the specified point, with approximation depth measured by the original ϖ.

**Hypotheses and conventions.** Use the local generic-fiber and potentially semistable-ring suppliers; this does not assert formal smoothness of the entire integral local ring.

**Needs:** `LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p`; `LocalGaloisDeformationRings:R08.3/g-valued-pst-rings`; `ArithmeticGaloisDuality:R02.5`; `ArithmeticGaloisDuality:D7`.

**Construction or proof.**

1. Apply the local smooth-point analytic-neighborhood theorem and choose an integral tangent lattice.
2. Use its divided coboundaries and tangent basis to identify the cocycle lattice and lifting action.
3. Use the local generic dimension formula to obtain the cardinality.
4. Apply the coefficient-extension approximation lemma before choosing the global approximation depth.

**Source:** FKP19, FKP19 Proposition 4.7 and Lemma 4.9, pp.22–25; FKP22 proof of Theorem 5.2, pp.24–25. These local conditions preserve the chosen characteristic-zero components while the global tower changes.

**Checks.**

- For a smooth fixed-determinant GL₂ point away from p the quotient tangent condition has cardinality |H⁰_v(sl₂_r)|. At a p-adic place multiply by |O/ϖ^r|^{[F_v:Q_p]}.

**Layer acceptance:** G3: function-field duality and cocycle comparisons. Obtain the stated local lifting lattices from LocalGaloisDeformationRings, the p-valued subgroups from LocallyAnalyticDistributionsPartII ND.0, Lazard’s resolution and Lie comparison from NoncommutativeAndEquivariantIwasawa NE.0, and semisimple Lie-algebra vanishing from AutomorphicFormsOnReductiveGroups AF.1a.

## Layer GG2.5: Auxiliary primes and relative Selmer annihilation

Prove finite-image cohomology vanishing, the simultaneous root-position lemma and the corrected primal/dual detection prime theorem. Reduce disconnected groups to one orbit of adjoint simple factors, and annihilate relative Selmer images by finitely many Q_N primes. Distinguish the decreasing finite-level cardinality from the mod-p relative dimension.

<a id="finite-image-vanishing"></a>

### Cohomology on the finite splitting field

**Target:** `GlobalGaloisDeformationsPartII:GG2.5/finite-image-vanishing` (theorem). **Planet:** Finite-image vanishing.

Under C1–C4 and the deep choice of M, for the controlled lift ρ_N with N≥4M the map H¹(Gal(F_N*/F),M_M)→H¹(Gal(F_N*/F),M_1) is zero, and H¹(Gal(F_N*/F),M_M*)=0. In particular any level-M primal class with nonzero residual reduction, and any nonzero residual reduction of a dual class, restrict nontrivially to Γ_{F_N*}.

**Needs:** [GG2.0/residual-conditions](#residual-conditions); [GG2.4/deep-reduction-vanishing](#deep-reduction-vanishing); [GG2.0/abelian-compositum](#abelian-compositum); [GG2.3/congruence-field-disjointness](#congruence-field-disjointness); `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`; [GG2.4/auxiliary-prime-set](#auxiliary-prime-set).

**Construction or proof.**

1. Apply inflation–restriction through F_N and the cyclotomic extension; abelian conjugation and C1 kill the extra primal homomorphisms.
2. Use deep Lie cohomology reduction vanishing for the adjoint group with full component action.
3. For the dual use C4 and the fact that the maximal elementary abelian quotient of the congruence-plus-cyclotomic kernel is a quotient of M⊕F_p.
4. C3 and C2 kill its equivariant maps to M*.

**Source:** FKP22, Lemma 5.3, p.25; FKP19 Lemma 6.4, pp.45–46. The primal conclusion is reduction vanishing, whereas the dual conclusion is actual finite-level H¹ vanishing.

**Checks.**

- For a primal finite-image class, only its mod-ϖ image is forced to vanish. Replacing this conclusion by H¹ at level M being zero is too strong.

<a id="simultaneous-root-position"></a>

### A simultaneous root-position lemma

**Target:** `GlobalGaloisDeformationsPartII:GG2.5/simultaneous-root-position` (theorem). **Planet:** Simultaneous root position.

For a split simple group H over finite k and sufficiently large p depending only on its root datum, any nonzero A∈Lie(H) and B∈Lie(H)* admit a split maximal torus T and root α such that A∉ker(dα|t)⊕⊕_β g_β and B does not annihilate g_α. The corresponding finite-ring assertion holds for nonzero A at its first nonzero ϖ-adic layer and residual nonzero B. For H of type A₁ the bound is p≥3.

**Hypotheses and conventions.** The adjoint Lie algebra is simple and the invariant pairing is perfect under the standing prime bound.

**Needs:** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ReductiveGroupsPartII:RG2.0`; [GG2.1/irreducible-image-input](#irreducible-image-input).

**Construction or proof.**

1. Each failure condition is a proper closed subset of the group acting on a fixed root pair.
2. In the big Bruhat cell clear torus denominators to bound the polynomial degrees uniformly in A,B.
3. Count zeros over finite k to find a point outside the two failure loci.
4. Lift through the smooth group and use the congruence Lie action to pass through higher coefficient levels.
5. For sl₂ check the three failure cases by explicit unipotent and Weyl conjugations.

**Source:** FKP19, FKP19 Proposition 6.8 and proof, pp.47–49; FKP22 proof of Corollary 5.5, pp.26–27. The finite-field counting argument is the key Lie-theoretic prerequisite for simultaneous detection.

**Checks.**

- In sl₂ take A=diag(1,−1) and B evaluating the upper-right entry: the standard torus and upper root satisfy both tests for p odd.

<a id="simultaneous-detection"></a>

### One prime detects both relative classes

**Target:** `GlobalGaloisDeformationsPartII:GG2.5/simultaneous-detection` (theorem). **Planet:** Relative detection prime.

Suppose g^der consists of one π₀(G)-orbit of simple factors. For any finite Q⊂Q_N and level-M Selmer classes φ,ψ with nonzero relative reductions, there is w∈Q_N∖Q such that φ|Γ_{F_w}∉L^α_{M,w} and ψ̄|Γ_{F_w}∉(L^α_{1,w})^⊥ for its chosen (T,α). The prime may avoid any prescribed finite set.

**Hypotheses and conventions.** Choose one simple factor on which both restricted class images have nonzero projection; transitivity supplies it. No linear-disjointness assumption on the primal and dual cocycle fields is made.

**Needs:** [GG2.5/finite-image-vanishing](#finite-image-vanishing); [GG2.5/simultaneous-root-position](#simultaneous-root-position); [GG2.4/auxiliary-prime-set](#auxiliary-prime-set); [GG2.4/root-local-condition](#root-local-condition); `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `FunctionFieldArithmetic:FA.5`.

**Construction or proof.**

1. Use finite-image vanishing to restrict nontrivially to Γ_{F_N*}.
2. Choose γ₂ outside the union of the kernels of the two projections to the same simple factor.
3. Apply simultaneous root position to φ(γ₂) and ψ̄(γ₂).
4. Choose γ₁ with the Q_N Frobenius condition by congruence/cyclotomic disjointness.
5. Among γ₂^rγ₁ for r=0,1,2 at most two choices fail the two required evaluations; Chebotarev realizes a successful one.

**Source:** FKP22, Proposition 5.4 and proof, pp.25–26. The same-factor choice repairs the projection step without reintroducing the earlier linear-disjointness hypothesis.

**Checks.**

- If g=g₁⊕g₂ and φ(γ) lies only in g₁ while ψ(γ) lies only in g₂*, this single γ is unsuitable; choose outside both projection kernels before selecting a root.

<a id="relative-selmer-annihilation"></a>

### Finite-prime annihilation of relative Selmer images

**Target:** `GlobalGaloisDeformationsPartII:GG2.5/relative-selmer-annihilation` (theorem). **Planet:** Relative Selmer annihilation.

For balanced compatible local conditions at the finite starting set S′, and one π₀(G)-orbit of simple factors, there is a finite Q⊂Q_N such that both level-M relative Selmer and relative dual Selmer images for S′∪Q vanish, using the root local condition at every w∈Q. While either relative image is nonzero one can add a detection prime that strictly decreases the cardinality of the full level-M Selmer group. The number of primes is not bounded merely by the initial relative dimension.

**Needs:** [GG2.5/simultaneous-detection](#simultaneous-detection); [GG2.4/relative-balance](#relative-balance); [GG2.4/root-local-condition](#root-local-condition); `ArithmeticGaloisDuality:R02.5/selmer-condition-comparison`; `ArithmeticGaloisDuality:R02.5/greenberg-wiles-formula`.

**Construction or proof.**

1. Use relative balance to select a primal and a dual class with nonzero reductions.
2. At a detection prime enlarge the root condition temporarily by the unramified condition; its quotient is O/ϖ^M.
3. The detected dual class generates the full rank-one quotient; two local-condition comparisons show the enlarged global Selmer group equals the old one.
4. The detected primal class fails the root condition, so imposing it strictly decreases the finite full-level cardinality.
5. Iterate; balance then kills both relative images.

**Source:** FKP19, FKP19 Theorem 6.9 and Remark 6.10, pp.49–50; FKP22 proof of Theorem 5.2, pp.24–25. The induction decreases full finite-level cardinality rather than asserting a one-step relative-dimension drop.

**Checks.**

- A relative residual image can remain the same for one step while the full level-M order decreases. The termination measure is the positive integer full order.

<a id="adjoint-orbit-reduction"></a>

### Reduction to adjoint factor orbits

**Target:** `GlobalGaloisDeformationsPartII:GG2.5/adjoint-orbit-reduction` (theorem).

The fixed-multiplier lifting problem reduces, through G/Z⁰_{G⁰}, to its π₀(G)-orbits of simple adjoint factors. Solve each orbit problem with its common finite component quotient and recombine by the corresponding fiber product. The prime-to-p central isogeny and the fixed multiplier recover a lift to the original G, preserving local conjugacy/components and full derived congruence image.

**Hypotheses and conventions.** The component quotient is common to the orbit representations; their products are not unrestricted direct products.

**Needs:** [GG2.0/lifting-datum](#lifting-datum); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon`; `LocalGaloisDeformationRings:R08.1/g-valued-framed-ring`; [GG2.5/relative-selmer-annihilation](#relative-selmer-annihilation).

**Construction or proof.**

1. Decompose the connected adjoint root datum into component orbits.
2. Apply the one-orbit theorem to each finite quotient problem, allowing a common finite ramification set and coefficient extension.
3. Use the fiber-product description to recombine.
4. Use the prime-to-p isogeny on congruence kernels and the fixed quotient to lift back.

**Source:** FKP22, FKP19 Claim 6.13, pp.51–52; FKP22 proof of Theorem 5.2, p.24. The reduction accounts for disconnected groups and the central lifting datum.

**Checks.**

- For two simple factors exchanged by π₀(G), one must work with their orbit and common component quotient. Independent direct products would lose that quotient.

**Layer acceptance:** Inherits G1 through the starting tower and G3 through global comparisons; obtain exact local root lattices and duality exports. G6(ii),(iv) enter the simultaneous root-position theorem.

## Layer GG2.6: Finitely ramified characteristic-zero lifts

Complete the compatible lifting argument after relative dual Selmer vanishing and prove the finite-detection criterion for full congruence image. Assemble Theorem 5.2 with prescribed local approximation and components, its sl_2 small-prime case, the non-geometric Theorem 5.6 without oddness, and the FKP19 irreducible specialization. Preserve the coefficient-extension quantifier: one extension works for every approximation depth.

<a id="compatible-finite-ramification"></a>

### Compatible lifts over one finite ramification set

**Target:** `GlobalGaloisDeformationsPartII:GG2.6/compatible-finite-ramification` (theorem). **Planet:** Finitely ramified lifting.

After level-M relative dual Selmer vanishing, the controlled lift can be extended to compatible fixed-μ lifts τ_n:Γ_{F,S′∪Q}→G(O/ϖ^n) for all n, preserving the selected local neighborhoods and root conditions. In the induction retain an auxiliary lift ρ_{n+M} reducing to τ_n; choose τ_{n+1} from its next reduction, then modify the deeper auxiliary lift. The deeper lifts need not themselves remain compatible beyond the retained level. Their inverse limit is continuous, unramified outside the same finite S′∪Q, and lies on the prescribed local components.

**Needs:** [GG2.5/relative-selmer-annihilation](#relative-selmer-annihilation); [GG2.4/coefficient-exactness](#coefficient-exactness); [GG2.4/smooth-neighborhood-conditions](#smooth-neighborhood-conditions); [GG2.4/root-local-condition](#root-local-condition); `ArithmeticGaloisDuality:R02.4/poitou-tate`; `GlobalGaloisDeformations:R04.3`; `GlobalGaloisDeformations:R04.1`.

**Construction or proof.**

1. Lift the finite global representation with the local conditions, identifying the obstruction by Poitou–Tate.
2. Use the vanishing relative dual image to solve the local discrepancy at the next retained level.
3. Modify by a primal level-M cohomology class while preserving the chosen local lifting fibers.
4. Induct with a moving M-level buffer and take the inverse limit of the τ_n.

**Source:** FKP19, FKP19 Claim 6.14 and proof, pp.53–55; FKP22 proof of Theorem 5.2, pp.24–25. Compatibility is imposed on the retained τ_n, not on every deeper auxiliary lift.

**Checks.**

- At one induction step retain τ_n and a lift to n+M. After alteration only agreement with the retained level is imposed on the buffer; demanding full compatibility of buffers is unnecessary.

<a id="finite-congruence-detection"></a>

### Finite detection of full congruence image

**Target:** `GlobalGaloisDeformationsPartII:GG2.6/finite-congruence-detection` (theorem). **Planet:** Full congruence image.

There is N₁ depending on G and O such that any closed subgroup P⊂Ĝ^der(O) surjecting onto Ĝ^der(O/ϖ^{N₁}) equals Ĝ^der(O). The assertion holds after the fixed finite coefficient extension with its own N₁. Consequently the finite initial image condition in the compatible lifting construction ensures full derived congruence image in its limit.

**Needs:** `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`; `ReductiveGroupsPartII:RG2.0`.

**Construction or proof.**

1. The congruence kernel is a topologically finitely generated pro-p group.
2. Its Frattini subgroup is open, hence contains a sufficiently deep congruence kernel.
3. Surjectivity at that depth gives surjectivity on the Frattini quotient and therefore topological generation.
4. Use closedness to identify the subgroup with the full kernel.

**Source:** FKP19, FKP19 Lemma 6.15, pp.55–56. The fixed finite congruence test replaces indefinitely many new image-generating primes.

**Checks.**

- A closed proper subgroup cannot surject onto the Frattini quotient. Omitting closedness admits a proper dense subgroup of a finitely generated pro-p group.

<a id="main-geometric-lift"></a>

### Geometric lifting with prescribed components

**Target:** `GlobalGaloisDeformationsPartII:GG2.6/main-geometric-lift` (theorem). **Planet:** Geometric lifting theorem.

Let the lifting datum satisfy C1–C4, with p sufficiently large depending only on G. If F is a number field assume F totally real and ρ̄ odd. For each v∈S fix a local μ-lift λ_v, de Rham with regular Hodge–Tate cocharacters when v|p, and an irreducible characteristic-zero local component containing it (of its fixed Hodge/inertial type at p). There is a finite extension O′/O depending only on these local lifts and components such that for every t≥1 and every finite avoidance set S₀ disjoint from S there are a finite S̃⊃S with S̃∩S₀=∅ and a continuous fixed-μ lift ρ:Γ_{F,S̃}→G(O′), whose image contains Ĝ^der(O′). For all v∈S it lies on the chosen component and is congruent modulo the original ϖ^t to a Ĝ(O′)-conjugate of λ_v. In characteristic zero it is geometric; in positive characteristic it is finitely ramified. In particular its Zariski closure contains G^der.

**Hypotheses and conventions.** O′ is chosen before t; S̃ and ρ can depend on t. Full derived image does not imply density in the central multiplier torus.

**Needs:** [GG2.3/controlled-tower](#controlled-tower); [GG2.4/smooth-neighborhood-conditions](#smooth-neighborhood-conditions); [GG2.4/relative-balance](#relative-balance); [GG2.5/adjoint-orbit-reduction](#adjoint-orbit-reduction); [GG2.6/compatible-finite-ramification](#compatible-finite-ramification); [GG2.6/finite-congruence-detection](#finite-congruence-detection); [GG2.0/oddness](#oddness); `LocalGaloisDeformationRings:R08.3/g-valued-pst-rings`.

**Construction or proof.**

1. Approximate the local points by smooth points using one coefficient extension.
2. Construct a sufficiently deep controlled tower segment and balanced cocycle conditions.
3. Reduce to adjoint factor orbits, annihilate relative Selmer, and complete over a finite ramification set.
4. Retain a level above N₁ to force the full congruence image.
5. Track local neighborhoods, coefficient extension, avoidance, and component membership throughout.

**Source:** FKP22, Theorem 5.2 (Theorem E) and proof, pp.23–25; footnotes 6–7, pp.23–24 (v5 has no Remark 5.7). This is the main target; the coefficient field can be fixed independently of the requested approximation depth.

**Checks.**

- For a torus the derived-image conclusion is vacuous, but the chosen multiplier still determines the lift. For GL₂ it is fixed determinant and full principal SL₂-congruence image.

<a id="sl2-prime-bound"></a>

### The sl₂ small-prime refinement

**Target:** `GlobalGaloisDeformationsPartII:GG2.6/sl2-prime-bound` (theorem). **Planet:** The sl₂ refinement.

If g^der=sl₂, the main geometric lifting theorem holds for every p≥3 under the same C1–C4, local-lift and oddness assumptions. No assertion that those residual hypotheses follow automatically from p≥3 is included.

**Needs:** [GG2.6/main-geometric-lift](#main-geometric-lift); [GG2.5/simultaneous-root-position](#simultaneous-root-position); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. Root vectors span sl₂ for p odd.
2. The required torus regularity is the nonvanishing of the single root differential.
3. Use the explicit sl₂ simultaneous-root-position argument.
4. All other large-prime uses in the proof were only for obtaining the residual hypotheses, which are now assumed directly.

**Source:** FKP22, Corollary 5.5, pp.26–27. The proof isolates the exact places where the large-prime hypothesis is needed.

**Checks.**

- At p=3 all factors 2 and −1 in the doubling argument remain nonzero. The SL₂ root-position calculation has no larger-prime counting assumption.

<a id="nongeometric-lift"></a>

### Finitely ramified lifts without oddness

**Target:** `GlobalGaloisDeformationsPartII:GG2.6/nongeometric-lift` (theorem). **Planet:** Lifting without oddness.

For any number field F and a lifting datum satisfying C1–C4, replace oddness and the p-adic regular de Rham hypothesis by local μ-lifts at v|p that are smooth points on generic framed components of dimension (1+[F_v:Q_p])dim(G^der). Keep the other local hypotheses. For every t there are a finite coefficient extension and finite ramification set and a fixed-μ lift with full derived congruence image, approximating the specified local lifts modulo ϖ^t up to strict conjugacy. The conclusion does not assert geometricity.

**Needs:** [GG2.4/smooth-neighborhood-conditions](#smooth-neighborhood-conditions); [GG2.5/relative-selmer-annihilation](#relative-selmer-annihilation); [GG2.6/compatible-finite-ramification](#compatible-finite-ramification); [GG2.6/finite-congruence-detection](#finite-congruence-detection); `ArithmeticGaloisDuality:R02.5/greenberg-wiles-formula`; `LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p`.

**Construction or proof.**

1. Use the unrestricted smooth local component dimensions in the cardinality calculation.
2. Replace equality of Selmer cardinalities by the inequality required for the same annihilation argument, accounting for the actual infinite places.
3. Carry out the finite-ramification construction and full-image argument.

**Source:** FKP22, Theorem 5.6, p.27; FKP19 Theorem 6.21, pp.56–57. The larger local tangent spaces replace the oddness-based balance.

**Checks.**

- At a real place p odd makes all positive-degree cohomology vanish on the order-two decomposition group. Unrestricted local conditions give the required inequality without oddness.

<a id="irreducible-specialisation"></a>

### Recovery of the irreducible lifting theorem

**Target:** `GlobalGaloisDeformationsPartII:GG2.6/irreducible-specialisation` (comparison).

For F totally real, an odd residual representation whose restriction to Γ_{F̃(ζ_p)} is absolutely G⁰-irreducible, with [F̃(ζ_p):F̃]>a_G and the prescribed regular local μ-lifts, satisfies the residual hypotheses of the main theorem for p≫G. It therefore has the finitely ramified geometric lift and local approximation of FKP19 Theorem 6.11. Here F̃ is the component splitting field, not the full residual field.

**Hypotheses and conventions.** This specialization inherits gap G1 through the main geometric lifting theorem: the failure of FKP22 Lemma 3.7 also occurs for some absolutely irreducible residual images (see E45). FKP19 Theorem 6.11 has its own proof, through the field K′ of FKP19 Definition 5.8, p.29, which avoids Lemma 3.7; that route is not planned in this roadmap.

**Needs:** [GG2.1/irreducible-image-input](#irreducible-image-input); [GG2.1/cyclic-quotient-bound](#cyclic-quotient-bound); [GG2.1/cyclotomic-exclusion](#cyclotomic-exclusion); [GG2.6/main-geometric-lift](#main-geometric-lift); `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`.

**Construction or proof.**

1. Apply the absolutely irreducible finite-image and bounded cyclic quotient inputs to verify C1–C4.
2. Use inflation–restriction across the prime-to-p component extension.
3. Apply the main geometric theorem and retain its coefficient/component control.

**Source:** FKP19, FKP19 Theorem 6.11 and Corollary A.7, pp.50–51,63–64; FKP22 §1.2, pp.5–6. The new theorem contains the earlier irreducible result as a verified specialization.

**Checks.**

- Absolute G-irreducibility on Γ_{F(ζ_p)} is retained explicitly. Irreducibility merely on Γ_F is not a substitute.

**Layer acceptance:** Inherits G1/G3; finish the fixed finite-set lifting chain after the relative annihilation and local-neighborhood contracts are supplied.

## Layer GG2.7: Levi-valued residual representations

Use ramified coefficient extension and a lifted cocharacter to change the residual lattice to the Levi projection. Produce arbitrarily many controlled extension classes, an indecomposable parabolic representation with full abelian-root image, explicit local lifts with the required multiplier, and invariant removal. Assemble the corrected Levi-valued corollary with oddness and the maximal-parabolic irreducibility hypothesis; test torus and GSp_4 cases.

<a id="levi-residual-lattice"></a>

### Changing the residual lattice to a Levi projection

**Target:** `GlobalGaloisDeformationsPartII:GG2.7/levi-residual-lattice` (theorem). **Planet:** Levi residual lattice.

Let G be connected reductive and ρ:Γ→G(O) continuous with residual image in a parabolic P=MU. After a finite totally ramified coefficient extension O′/O there is g∈G(Frac O′) such that gρg⁻¹ is O′-valued and its reduction is the Levi projection of ρ̄. If P is minimal containing the residual image this reduction is its G-semisimplification. Conjugation preserves the characteristic-zero Zariski closure up to conjugacy, but need not preserve the full integral congruence kernel.

**Needs:** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon`; `ArithmeticGaloisRepresentations:R01.1`.

**Construction or proof.**

1. Choose a cocharacter with zero weights on M and positive weights on U.
2. Multiply it so it lifts through the relevant central isogeny to an actual cocharacter of G.
3. Choose the ramification index large enough that conjugation by its value on the new uniformizer keeps all negative-root coordinates integral and makes the positive-root coordinates vanish residually.
4. Apply the existing minimal-parabolic semisimplification theorem.

**Source:** FKP22, Lemma 6.1 and proof, pp.27–28. The ramification and cocharacter scaling are necessary to obtain an integral conjugate with the specified reduction.

**Checks.**

- For SL₂ the adjoint cocharacter diag(t,1) need not lift to SL₂ without a square root; multiply the cocharacter or make the specified coefficient extension.

<a id="many-extension-classes"></a>

### Arbitrarily large controlled extension spaces

**Target:** `GlobalGaloisDeformationsPartII:GG2.7/many-extension-classes` (theorem). **Planet:** Controlled extension classes.

Let W≠0 and W′ be finite F_p[Γ_{F,S}]-modules and let 0≠W⁰⊂W be an F_p-subspace. For every integer d there is a finite set T outside S, trivial for both W and W′ and with q_v≡1 mod p, such that dim_Fp H¹_L(Γ_{F,S∪T},W)>d, where L_v=0 at old places and at new places inertia takes values in W⁰. The new sets may avoid any fixed finite set.

**Needs:** `ArithmeticGaloisDuality:R02.5/greenberg-wiles-formula`; `ArithmeticGaloisDuality:R02.5/selmer-condition-comparison`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `FunctionFieldArithmetic:FA.5`; [GG2.0/trivial-prime](#trivial-prime).

**Construction or proof.**

1. Choose completely split primes for both coefficient actions and μ_p.
2. At each new prime the allowed local space exceeds the unramified space by dim W⁰.
3. Apply Greenberg–Wiles and the local-condition comparison formula to obtain an unbounded lower bound.

**Source:** FKP22, Lemma 6.2, pp.28–29. Triviality for W itself is required for the local Hom description.

**Checks.**

- For W=F_p(χ) and any j the construction gives j independent classes after a controlled finite enlargement of T; it does not claim an infinite-dimensional group for one fixed T.

<a id="full-unipotent-extension"></a>

### Parabolic representations with full abelian radical image

**Target:** `GlobalGaloisDeformationsPartII:GG2.7/full-unipotent-extension` (theorem). **Planet:** Full unipotent residual image.

For connected G, P=MU, a Levi-valued residual ρ̄ and an abelian M-normalized product A⊂U of root subgroups, there are finitely many ρ̄-trivial new primes T and ρ̄′:Γ_{F,S∪T}→A⋊M with projection ρ̄, image containing A(k), and local restrictions conjugate to ρ̄ at every old place. At each new place the image lies in A(k) and inertia in a single chosen root subgroup.

**Needs:** [GG2.7/many-extension-classes](#many-extension-classes); [GG2.1/abelian-root-subgroup](#abelian-root-subgroup); `tauceti:TauCeti.ContCohomology.H1`.

**Construction or proof.**

1. Use the split semidirect product to identify lifts of ρ̄ with continuous cocycles in A(k).
2. For every prime-field line in each selected root coordinate use the controlled extension-space theorem to obtain a nontrivially ramified class supported at disjoint new primes.
3. Sum these classes; local inertia supplies generators for all A(k), while zero old local classes give conjugacy there.

**Source:** FKP22, Lemma 6.3, p.29. The full A(k) image permits invariant removal while preserving old local data.

**Checks.**

- For an abelian radical A with two F_p directions, use enough independent classes to make the joint image all of A; separate nonzero projections alone would not suffice.

<a id="unipotent-local-lift"></a>

### Local lifts of abelian-unipotent residual image

**Target:** `GlobalGaloisDeformationsPartII:GG2.7/unipotent-local-lift` (theorem).

Let q_v≡1 mod p, p odd, and let the local residual image lie in an abelian root subgroup A(k), with inertia in U_α(k). It has an O-valued lift after coefficient extension: choose lifts u₁∈A(O),u₂∈U_α(O), put t=α∨(√q_v) with √q_v≡1 mod ϖ, and send σ_v to tu₁ and τ_v to u₂. If a fixed multiplier μ is required, multiply the Frobenius value by a central lift of μ(σ_v) and verify that μ is unramified and residually trivial here.

**Hypotheses and conventions.** The central multiplier lift uses the prime-to-p central isogeny; the uncorrected formula only has trivial multiplier.

**Needs:** [GG2.0/lifting-datum](#lifting-datum); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon`; `ArithmeticGaloisRepresentations:R01.2`; `LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p`.

**Construction or proof.**

1. Use Hensel for the specified square root.
2. The coroot acts on its root group with weight 2 and A is abelian, giving the tame relation.
3. The central correction changes the quotient without changing the tame conjugation relation.

**Source:** FKP22, Lemma 6.4, pp.29–30. The formula gives explicit local liftability at the newly introduced primes; fixed multiplier needs the central adjustment.

**Checks.**

- If μ(σ_w) is a nonidentity pro-p central value, a trivial-multiplier lift fails the local datum. Correct it through the prime-to-p central isogeny.

<a id="remove-invariants"></a>

### Removing adjoint invariants by an extension

**Target:** `GlobalGaloisDeformationsPartII:GG2.7/remove-invariants` (theorem). **Planet:** Removal of invariants.

Assume H⁰(Γ_F,M)=z(m)∩g^der for Levi-valued ρ̄ and the local regular μ-lifts. Choose A as in the faithful-center root subgroup theorem. The parabolic extension ρ̄′ can be chosen with H⁰(Γ_F,Adρ̄′ g^der)=0 and with all required local μ-lifts. If H⁰(Γ_F,M*)=0 then also H⁰(Γ_F,(Adρ̄′ g^der)*)=0. For the latter comparison use the joint images of (ρ̄′,κ̄) and (ρ̄,κ̄), which have the same prime-to-p quotient; invariance vanishing does not follow merely from equality of semisimplifications.

**Needs:** [GG2.1/abelian-root-subgroup](#abelian-root-subgroup); [GG2.7/full-unipotent-extension](#full-unipotent-extension); [GG2.7/unipotent-local-lift](#unipotent-local-lift); [GG2.0/residual-conditions](#residual-conditions); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. The new image contains A(k) and, by the semidirect-product splitting, the original Levi image.
2. Old invariants therefore lie in the Levi center, and faithfulness of its action on a kills them.
3. For the twisted module compare the joint cyclotomic images and their p-kernels.
4. Use the explicit unipotent local lift at new primes and the unchanged old local classes.

**Source:** FKP22, Lemma 6.5 and proof of Corollary 6.6, p.30. The joint-image argument supplies the valid twisted-invariant comparison.

**Checks.**

- Adding a semisimple-equivalent extension need not preserve H⁰. Check actual image containment of A(k) after adjoining μ_p before applying the invariant computation.

<a id="levi-geometric-lift"></a>

### Geometric lifts of Levi-valued residual representations

**Target:** `GlobalGaloisDeformationsPartII:GG2.7/levi-geometric-lift` (theorem). **Planet:** Levi-valued geometric lifting.

Let G be connected, F totally real, and ρ̄ odd with image in a Levi M of P. Assume p≫G, regular geometric local μ-lifts, H⁰(Γ_F,M_ad)=z(m)∩g^der and H⁰(Γ_F,M_ad*)=0. Suppose either μ_p⊄F(Adρ̄), or P is maximal, ρ̄ is absolutely M-irreducible and satisfies the D alternative of maximal separation. Then after finite coefficient extension there is a finitely ramified geometric fixed-μ lift of the original ρ̄ whose Zariski closure contains G^der. The conclusion is derived Zariski density, not necessarily full integral congruence image after changing its residual lattice.

**Needs:** [GG2.7/remove-invariants](#remove-invariants); [GG2.1/cyclotomic-exclusion](#cyclotomic-exclusion); [GG2.1/maximal-separation](#maximal-separation); [GG2.6/main-geometric-lift](#main-geometric-lift); [GG2.7/levi-residual-lattice](#levi-residual-lattice); [GG2.0/oddness](#oddness); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `LocalGaloisDeformationRings:R08.3/g-valued-pst-rings`.

**Construction or proof.**

1. Create the full abelian-root extension and remove invariants.
2. Use cyclotomic exclusion or maximal separation to verify C3,C4 for the extension.
3. Apply the main lifting theorem to that extension.
4. Change the integral lattice to recover the original Levi-valued residual representation; characteristic-zero derived density survives.

**Source:** FKP22, Corollary 6.6 and proof, pp.30–31. Oddness and the absolute-Levi-irreducibility requirement in the second alternative are retained.

**Checks.**

- An even GL₂ diagonal residual representation over Q is outside the geometric conclusion. At real places the added p-primary extension is conjugate to its Levi projection.

<a id="torus-test"></a>

### The corrected torus criterion

**Target:** `GlobalGaloisDeformationsPartII:GG2.7/torus-test` (application).

For ρ̄ valued in a split maximal torus T, the equality H⁰(Γ_F,M)=t∩g^der holds precisely when every root character α∘ρ̄ is nontrivial. The dual invariant condition additionally excludes κ̄⁻¹ from the toral and root constituents. Together with the Borel separation criterion, oddness and the required local lifts, these hypotheses imply the Levi geometric lifting theorem. Merely requiring that the image lie in no proper subtorus is insufficient.

**Needs:** [GG2.1/borel-criteria](#borel-criteria); [GG2.7/levi-geometric-lift](#levi-geometric-lift); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. Decompose g^der into t^der and its root lines.
2. Read the two invariant conditions from the actual characters.
3. Apply the Borel criterion and the Levi theorem.

**Source:** FKP22, Remark 6.7, p.31; Lemma A.18, p.51. Rootwise nontriviality is the correct test for torus invariants.

**Checks.**

- For SL₂ and a nontrivial quadratic χ, diag(χ,χ⁻¹) has trivial root character; its invariant Lie algebra is sl₂, so the purported generic torus case must be excluded.

<a id="siegel-modular-example"></a>

### A corrected GSp₄ Siegel example

**Target:** `GlobalGaloisDeformationsPartII:GG2.7/siegel-modular-example` (application).

Let r be the absolutely irreducible residual representation of a classical newform of weight a≥2, and δ an odd finite residual character. For the GSp₄ Siegel Levi (r,δ), require the invariant and dual-invariant exclusions on both Sym²r⊗δ⁻¹ and Sym²r∨⊗δ: no trivial constituent in either and no κ̄⁻¹ constituent in either. The Levi adjoint part must have no κ̄⁻¹ constituent. Set χ=det(r)/δ and require D(1,1,4), for example ord(χ^bκ̄)≥5 for all |b|≤2 when χ is F_p-valued. Choose a de Rham lift of δ with weight w so that {0,a−1,w,w−a+1} are distinct, equivalently w∉{0,a−1,2a−2}. With p≫G these data give a geometric GSp₄ lift with derived Zariski-dense image.

**Hypotheses and conventions.** All conditions depend on δ; absolute irreducibility of r alone does not imply them.

**Needs:** [GG2.1/explicit-separation](#explicit-separation); [GG2.1/maximal-parabolic-criteria](#maximal-parabolic-criteria); [GG2.7/levi-geometric-lift](#levi-geometric-lift); `AutomorphicGaloisRepresentations:R19.1`; `AutomorphicGaloisRepresentations:R19.5`.

**Construction or proof.**

1. Use the matrix formula for both radical representations and the corrected adjoint quotient character.
2. Use the newform lift and a de Rham lift of δ to obtain regular local lifts of the Levi representation.
3. Apply maximal separation and the Levi geometric lifting theorem.

**Source:** FKP22, Example 6.8, p.31; Example A.16, p.50. The similitude-dependent exclusions and regularity restrictions repair the example.

**Checks.**

- The four Hodge–Tate weights 0,a−1,w,w−a+1 are distinct exactly when w avoids 0,a−1,2a−2 (for a≥2). The character separation depends on δ.

**Layer acceptance:** Inherits the main lifting gaps; check all local multiplier corrections, cocharacter lifts and actual-image invariant arguments. G6(i),(iii): exponential and G-semisimplification inputs.

## Layer GG2.8: Actual reductions of modular forms

Define lattice-sensitive modularity and prove the GL_2 residual criteria. Match determinants in the ordinary and crystalline local cases, then deduce Theorem 7.4 using existing modularity theorems. Prove finiteness of reductions over the algebraic closure at fixed weight and level through the stable-lattice tree, and contrast it with the infinitude of residual extension classes. State the totally real consequence with its modularity input explicit.

<a id="actual-modularity"></a>

### Modularity of an actual residual representation

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/actual-modularity` (definition). **Planet:** Actual residual modularity.

For ρ̄:Γ_Q→GL₂(k), Modular(ρ̄,r,N) means that there are a normalized cuspidal newform f∈S_r(Γ₁(N)), r≥2, an embedding of its coefficient field into Q̄_p, a finite coefficient extension E containing the resulting representation, a Γ_Q-stable O_E-lattice Λ⊂E² and an embedding k_E→k̄ such that Λ/m_EΛ is isomorphic over k̄ to ρ̄. Isomorphism concerns the entire representation, including its extension class; no semisimplification is taken.

**Needs:** `AutomorphicGaloisRepresentations:R19.1`; `ArithmeticGaloisRepresentations:R01.1`.

**Construction or proof.**

1. Use the existing newform Galois representation and stable-lattice carriers.
2. Quantify over coefficient extensions, integral lattices, residual embeddings and a residual intertwining isomorphism.

**Source:** FKP22, §1, p.2; §7 preceding Lemma 7.3, p.35. The lattice-sensitive notion is the conclusion of Theorem 7.4 and the subject of Proposition 7.7.

**Uses that determine the API.**

- Theorem 7.4, pp.35–36: States modularity of the original extension, including the split case.
- Proposition 7.7, p.37: Counts all integral lattice reductions at fixed weight and level.

**API.**

- `Lifting.actual_modularity.witness` (projection): A modularity witness supplies the newform, embedding, lattice and full residual isomorphism.
- `Lifting.actual_modularity.conjugacy_invariant` (functoriality): Isomorphic residual representations and coefficient extensions give the same predicate.
- `Lifting.actual_modularity.irreducible_comparison` (compatibility): For absolutely irreducible residual representations the predicate agrees with the usual modularity predicate, because stable lattices are unique up to homothety.

**Unit tests.**

- `Lifting.actual_modularity.split_vs_nonsplit` (non-example): An isomorphism of semisimplifications of χ⊕1 and a nonsplit extension is not a witness for actual modularity via the same lattice.
- `Lifting.actual_modularity.homothety` (compatibility): Scaling Λ by a nonzero E-scalar leaves its residual representation unchanged up to isomorphism.
- `Lifting.actual_modularity.endpoint` (computation): The two endpoint lattices in the distinct-character stable segment give opposite nonsplit extensions, which remain different actual reductions despite their common semisimplification.

**Checks.**

- An isomorphism of semisimplifications of χ⊕1 and a nonsplit extension is not a witness for actual modularity via the same lattice.

<a id="gl2-residual-criteria"></a>

### Residual hypotheses for nonsplit odd GL₂ extensions

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/gl2-residual-criteria` (theorem). **Planet:** Reducible GL₂ criteria.

Let F be totally real, p≥3, and ρ̄ a nonsplit extension of 1 by χ̄ with χ̄(c_v)=−1 and χ̄≠κ̄⁻¹. Then C1–C4 hold. The exceptional case χ̄=κ̄ is included when it is different from κ̄⁻¹; it requires its own cocycle calculation rather than the distinct-character argument.

**Needs:** [GG2.0/residual-conditions](#residual-conditions); `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`; `ArithmeticGaloisRepresentations:R01.1`.

**Construction or proof.**

1. Compute the unique invariant and quotient lines of the nonsplit trace-zero adjoint representation.
2. Restrict to the elementary abelian p-Sylow of the finite residual splitting group and take prime-to-p quotient invariants.
3. Exclude most character coincidences by oddness.
4. For χ̄=κ̄ compute cocycle values on an F_p-basis of the unipotent p-Sylow and use the boundary map to kill the remaining one-dimensional H¹.
5. Use the unique adjoint quotient line to verify prime-field C3 via scalar-extension twists.

**Source:** FKP22, Lemma 7.1 and proof, pp.32–33. This is the direct residual check that makes the p≥3 lifting theorem applicable.

**Checks.**

- For a split 1⊕κ̄ residual representation C4 may fail; construct a nonsplit extension before invoking the nonsplit criterion.

<a id="global-determinant-match"></a>

### Matching the local and global determinant

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/global-determinant-match` (theorem).

For F=Q, r≥2 and the odd residual extension of 1 by χ̄, set μ=κ^{r−1}[χ̄κ̄^{1−r}]. After coefficient extension, the local ordinary potentially crystalline lift can be chosen with an unramified quotient and determinant μω, where ω has finite p-power order, trivial residual reduction and ω(Art_Qp(p))=1. Local and global Kronecker–Weber extend ω to Γ_Q, unramified away from p. At Serre weight the crystalline ordinary choice can be retained with the compatible determinant. An arbitrary unramified factor in a previously chosen quotient must be removed locally before this global extension step.

**Needs:** `LocalGaloisDeformationRings:R08.2/reducible-lifts-prescribed-determinant`; `LocalGaloisDeformationRings:R08.3`; `LocalGaloisDeformationRings:L7`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`; `AlgebraicModularFormsAndSerreWeights:R15.4`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Construction or proof.**

1. Use the local potentially crystalline/crystalline lift and separate its finite inertial character from its unramified quotient character.
2. Twist by the finite inertial normalization so ω is trivial on the chosen uniformizer.
3. Extend that character through Q_p× and the p-power cyclotomic extension of Q.
4. At the other places use the fixed-determinant local-lifting export.

**Source:** FKP22, Proof of Theorem 7.4, p.36; proof of Lemma 7.2, pp.33–35. The normalized finite character, rather than an arbitrary local unramified character, globalizes.

**Checks.**

- A local finite-order correction with nontrivial value on Art(p) cannot be inflated from a global character unramified outside p. The selected correction has value one there.

<a id="semisimple-modularity"></a>

### Modularity after semisimplification

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/semisimple-modularity` (comparison).

Every continuous odd ρ̄:Γ_Q→GL₂(k) has semisimplification isomorphic to the semisimplification of a reduction of a newform representation of some weight r≥2 and level N. In the irreducible case use Serre modularity; in the reducible case use an Eisenstein eigenform, make it cuspidal modulo p and apply Deligne–Serre lifting. This gives no control of the original extension class or a prescribed weight and level.

**Needs:** `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`; `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`; `AlgebraicModularFormsAndSerreWeights:R15.4`; `AutomorphicGaloisRepresentations:R19.1`.

**Construction or proof.**

1. Invoke the existing Serre theorem in the irreducible case.
2. In the reducible case choose the Eisenstein series with the two specified residual characters.
3. Use an auxiliary prime or a theta iterate to make a cuspidal mod-p eigensystem, then lift it by the existing eigenform-lifting theorem.

**Source:** FKP22, Lemma 7.3 and proof, p.35. This comparison explains the extra content of actual residual modularity.

**Checks.**

- A nonsplit extension and the split sum have identical traces; the determinant or Hecke traces alone do not prove actual residual modularity.

<a id="reducible-modularity"></a>

### Modularity of reducible odd representations

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/reducible-modularity` (theorem). **Planet:** Reducible modularity theorem.

For p≥3 and a continuous residual representation ρ̄:Γ_{Q,S}→GL₂(k) that is an extension of 1 by χ̄ with χ̄(c)=−1 and χ̄≠κ̄⁻¹, the actual representation is modular. For every r≥2 it is modular of weight r at some level; at r=k(ρ̄|Γ_Qp), Serre’s local weight, it is modular at a level prime to p. Split extensions are included.

**Hypotheses and conventions.** The case χ̄|Γ_Qp=1 occurs for every odd p, including p=3 (for example χ̄ the odd quadratic character of Q(√−2), trivial on Γ_Q₃ since 3 splits there, and different from κ̄⁻¹). Pan’s theorem covers it: its only p=3 exclusion is a residual character ratio equal to ω on Γ_Q₃, which does not meet χ̄|Γ_Q₃=1. No p≥5 restriction is needed.

**Needs:** [GG2.8/actual-modularity](#actual-modularity); [GG2.8/gl2-residual-criteria](#gl2-residual-criteria); [GG2.8/global-determinant-match](#global-determinant-match); [GG2.6/sl2-prime-bound](#sl2-prime-bound); [GG2.7/levi-residual-lattice](#levi-residual-lattice); [GG2.7/full-unipotent-extension](#full-unipotent-extension); `AutomorphicGaloisRepresentations:R19.5`; `AlgebraicModularFormsAndSerreWeights:R15.4`; `LocalGaloisDeformationRings:L7`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`; `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`.

**Construction or proof.**

1. For a nonsplit extension verify C1–C4 directly.
2. Choose the ordinary local component with the normalized determinant and desired weights; at Serre weight choose the crystalline component.
3. Apply the sl₂ geometric lifting theorem, ensuring irreducibility by full derived image.
4. Apply the exported Skinner–Wiles theorem over Q (OrdinaryAutomorphicFormsAndModularityLifting R21.5/theorem-a-over-q: χ̄|D_p≠1, ordinary shape (∗ ∗; 0 1) on inertia, determinant ψκ^{r−1} with ψ of finite order) if χ̄|Γ_Qp≠1, and Pan’s theorem (GL2ModularityLifting R32.4/pan-residually-reducible-fontaine-mazur) if χ̄|Γ_Qp=1, for every odd p; local–global compatibility identifies weight and p-level.
5. For a split extension first create a nonsplit residual extension, apply the same construction and change its residual lattice to the split Levi projection.

**Source:** FKP22, Theorem 7.4 (Theorem B) and proof, pp.35–36. The newform matches the full residual representation with the stated weight and level conclusions.
**Source:** Pan22, Introduction, Theorem 1.0.2, p.3 (arXiv:1901.07166v2). The residually reducible Fontaine–Mazur theorem for odd p, with its single p=3 exclusion of a cyclotomic residual ratio at 3; this is the statement of the cited supplier node.

**Checks.**

- For a nonsplit odd extension with χ̄=κ̄⁻¹ the theorem does not apply. At Serre weight the crystalline local component gives the p-prime level conclusion.
- At p=3 with χ̄ the quadratic character of Q(√−2), χ̄ is odd, trivial on Γ_Q₃ and different from κ̄⁻¹, so the theorem applies and uses the Pan case; a p≥5 restriction on that case would wrongly exclude it.

<a id="hamblen-ramakrishna-comparison"></a>

### The Hamblen–Ramakrishna specialization

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/hamblen-ramakrishna-comparison` (comparison).

The reducible modularity theorem implies the earlier Hamblen–Ramakrishna statement for a nonsplit odd extension with χ̄≠κ̄^{±1}, χ̄²≠1, the specified nondegenerate local behavior at p and k generated by χ̄-values. These extra assumptions are unnecessary for this new conclusion. No prime-field multiplicity-freeness assertion is used.

**Needs:** [GG2.8/reducible-modularity](#reducible-modularity).

**Construction or proof.**

1. Check that the older hypotheses imply p≥3, oddness and χ̄≠κ̄⁻¹.
2. Apply the actual modularity theorem and discard its stronger weight/level conclusions.

**Source:** FKP22, Theorem A, pp.2–3; Theorem 7.4, pp.35–36. The earlier statement is a logical consequence, not a second proof plan for its source.

**Checks.**

- A coefficient-field automorphism can repeat prime-field constituents even when the k-module is multiplicity-free; this corollary uses no false restriction-of-scalars criterion.

<a id="totally-real-modularity"></a>

### The totally real conditional consequence

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/totally-real-modularity` (comparison).

Over a totally real F, a nonsplit odd extension of 1 by χ̄≠κ̄⁻¹ with the local ordinary μ-lifts admits the geometric irreducible lift of the sl₂ theorem. Whenever the hypotheses of the exported Skinner–Wiles theorem over F hold for that lift, it is Hilbert modular and its original integral lattice realizes the actual residual representation. This does not assert modularity over every totally real field without the modularity theorem’s extra hypotheses.

**Needs:** [GG2.8/gl2-residual-criteria](#gl2-residual-criteria); [GG2.6/sl2-prime-bound](#sl2-prime-bound); `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`; `AutomorphicGaloisRepresentations:R19.1`.

**Construction or proof.**

1. Apply the direct GL₂ residual criterion and choose the ordinary local components.
2. Construct the lift and check every hypothesis of the imported totally real modularity theorem.
3. Use its automorphic Galois representation comparison to retain the original residual lattice.

**Source:** FKP22, Remark 7.5, p.36. The consequence is conditional on the exact available totally real modularity-lifting input.

**Checks.**

- If the imported totally real modularity theorem has an extra residual or local hypothesis, the implication remains conditional on it.

<a id="infinitely-many-extensions"></a>

### Infinitely many actual extension classes

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/infinitely-many-extensions` (theorem). **Planet:** Infinitely many extensions.

Let Γ be finite, L an infinite field and χ:Γ→L×. If dim_L H¹(Γ,L(χ))>1 or dim_L H¹(Γ,L(χ⁻¹))>1, there are infinitely many pairwise nonisomorphic two-dimensional Γ-representations over L with semisimplification 1⊕χ. For χ≠1 the nonsplit classes in each orientation are projective spaces of the corresponding H¹; for χ=1 identify the two orientation copies.

**Needs:** `tauceti:TauCeti.ContCohomology.H1`; `ArithmeticGaloisRepresentations:R01.1`.

**Construction or proof.**

1. Identify extensions of the two characters with the existing H¹ carrier.
2. An isomorphism between nonsplit extensions rescales the extension class, giving the projective-space quotient.
3. A projective line over an infinite field has infinitely many points; use an injection from it when H¹ has dimension at least two.

**Source:** FKP22, Lemma 7.6, pp.36–37. The infinitude is over an infinite coefficient field, not the finite original k.

**Checks.**

- For Γ=C_p, L of characteristic p and χ=1, dim H¹=1 gives a single nonzero projective class; dimension strictly greater than one is essential.

<a id="stable-lattice-segment"></a>

### The stable-lattice segment and its reductions

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/stable-lattice-segment` (theorem). **Planet:** Stable-lattice segment.

For an irreducible continuous ρ:Γ→GL₂(E) with residual semisimplification χ₁⊕χ₂ and χ₁≠χ₂, the homothety classes of stable O_E-lattices form a finite segment in the existing Bruhat–Tits tree. The endpoint reductions are nonsplit extensions in the two opposite orientations; interior vertices, if present, give the split representation. After any finite extension E′/E the two indecomposable reduction classes are their scalar extensions, and newly subdivided interior vertices contribute only the split class. If the residual representation is absolutely irreducible, use the existing unique-homothety theorem instead.

**Hypotheses and conventions.** A stable lattice exists; the coefficient action is bounded and the characteristic-zero representation is irreducible.

**Needs:** `ReductiveGroupsPartII:RG2.2`; `ArithmeticGaloisRepresentations:R01.1/ribet-nonsplit-lattice`; `ArithmeticGaloisRepresentations:R01.1/stable-lattice-unique-up-to-homothety`.

**Construction or proof.**

1. Identify stable lattices with fixed vertices in the tree.
2. Distinct residual characters exclude branching; a fixed ray would give an invariant E-line, so the fixed segment is bounded and finite.
3. Analyze the neighbor quotient of a lattice to identify the two endpoints and the split interior reductions.
4. Choose g₀ with distinct residual eigenvalues and diagonalize it by Hensel lifting. Its integral eigenprojectors split every stable lattice, so all fixed vertices lie in one apartment. If b_g,c_g are the off-diagonal entries, Λ_s=Oe₁⊕ϖ^sOe₂ is stable precisely when −min_g v(b_g)≤s≤min_g v(c_g). Irreducibility makes both bounds finite. On extending E, the bounds multiply by the ramification index. Endpoint reductions are scalar extensions, and the new strictly interior lattices have both off-diagonal reductions zero.

**Source:** FKP22, Proof of Proposition 7.7, p.37; Bellaïche–Chenevier (2014), Propositions 11 and 32, cited there. This is the lattice-theoretic finiteness statement needed over the algebraic closure, beyond finite-k counting.
**Source:** BC14, Lemma 10 and Proposition 11, pp.9–10; Definitions 29–30 and Proposition 32, pp.16–17 (author preprint pagination). Relates stable neighbors to residual invariant lines and bounds the fixed tree by the congruence of the two residual characters.
**Source:** Ribet10, §1.2, Lemmas 1.3–1.5 and Proposition 1.4, pp.6–7; Exercises 1.5–1.9, p.8. Gives the irreducible two-dimensional stable-segment argument and the two opposite nonsplit endpoints. Coefficient-extension invariance is supplied by the explicit matrix argument here.

**Checks.**

- If residual characters differ, the chosen g₀ has eigenvalue difference a unit and its integral eigenprojectors split every stable lattice. Under ramification index e′ a segment of length d becomes length e′d, with the same two endpoint classes after scalar extension.

<a id="fixed-weight-level-finiteness"></a>

### Finitely many actual reductions at fixed weight and level

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/fixed-weight-level-finiteness` (theorem). **Planet:** Fixed weight and level finiteness.

Fix p odd, N≥1,r≥2 and distinct residual characters 1,χ̄ with χ̄ odd. Only finitely many isomorphism classes over k̄ of residual representations with semisimplification 1⊕χ̄ arise from stable lattices in newform representations of weight r and level N, even allowing arbitrary finite coefficient extensions and all residual embeddings. Thus a finite quotient Γ of Γ_Q with dim H¹(Γ,k̄(χ̄))>1 has infinitely many extensions of this semisimplification, only finitely many of which occur at that fixed weight and level.

**Needs:** [GG2.8/stable-lattice-segment](#stable-lattice-segment); [GG2.8/infinitely-many-extensions](#infinitely-many-extensions); [GG2.8/actual-modularity](#actual-modularity); `AutomorphicGaloisRepresentations:R19.1`; `AlgebraicModularFormsAndSerreWeights:R15.4`.

**Construction or proof.**

1. There are finitely many normalized eigenforms and coefficient embeddings at fixed weight and level.
2. For each use the stable-lattice segment and extension invariance of its indecomposable endpoints.
3. Count the two endpoint classes and possible split class; compare with the infinite projective family.

**Source:** FKP22, Proposition 7.7, p.37. The finite set remains finite after all coefficient extensions.

**Checks.**

- One newform contributes at most its two nonsplit endpoint reductions and the split class, even as its coefficient field is extended.

<a id="minimal-lifting-boundary"></a>

### The boundary of fixed-level lifting methods

**Target:** `GlobalGaloisDeformationsPartII:GG2.8/minimal-lifting-boundary` (comparison).

For a fixed odd χ̄, one can choose a finite quotient of Γ_{Q,S} with dim H¹(Γ,k̄(χ̄))>1. The resulting infinite family with the same semisimplification cannot all be realized by modular lifts at any one fixed weight and level. Therefore a lifting argument that forces one fixed modular weight and ramification level for every member cannot prove the actual reducible modularity theorem. This is a precise obstruction to that method, not a claim that every reducible deformation ring fails a particular finiteness lemma.

**Needs:** [GG2.7/many-extension-classes](#many-extension-classes); [GG2.8/infinitely-many-extensions](#infinitely-many-extensions); [GG2.8/fixed-weight-level-finiteness](#fixed-weight-level-finiteness).

**Construction or proof.**

1. Use controlled extension spaces and factor the finitely many chosen cocycles through one finite quotient.
2. Extend coefficients to k̄ and apply the projective-family infinitude.
3. Apply fixed-weight-and-level finiteness.

**Source:** FKP22, Remark 7.8, p.37. The comparison states exactly the conclusion proved by the finiteness argument.

**Checks.**

- An infinite projective extension family and a finite fixed-level set leave infinitely many classes outside that one level. This is not a claim that one uniform level realizes the family.

**Layer acceptance:** Inherits G1 for the geometric lifting input. Obtain the ordinary/crystalline determinant contracts; the Skinner–Wiles and Pan inputs are the existing supplier nodes, with Pan covering p=3. Verify the corrected stronger weight/level conclusions.

## Layer GG2.9: Automorphy over function fields

Define automorphy of an actual residual representation via an integral irreducible finite-determinant lift. Assemble Theorem 8.1 using equal-characteristic local lifts and Lafforgue. Derive the two-block and direct-sum cases with the corrected joint determinant-field hypothesis, and delimit the irreducible case by its necessary cyclotomic condition.

<a id="actual-function-field-automorphy"></a>

### Actual residual automorphy over function fields

**Target:** `GlobalGaloisDeformationsPartII:GG2.9/actual-function-field-automorphy` (definition). **Planet:** Actual function-field automorphy.

For a global function field F of characteristic ℓ≠p, Automorphic(ρ̄) means that there are a cuspidal automorphic representation π of GL_n(A_F) with finite-order central character, an identification C≅Q̄_p, a finite coefficient field E, a stable O_E-lattice in its Lafforgue representation, and a residual embedding giving an isomorphism of the full lattice reduction with ρ̄ over k̄. Equivalently via the imported Langlands correspondence, ρ̄ has an integral lift that is irreducible, finitely ramified and has finite-order determinant.

**Needs:** `GlobalShtukasAndFunctionFieldLanglands:GS.6/the-global-correspondence-for-gl-r`; `ArithmeticGaloisRepresentations:R01.1`.

**Construction or proof.**

1. Use the automorphic Galois representation and stable-lattice carriers from their owners.
2. Use both directions of the function-field Langlands equivalence, retaining the chosen lattice.

**Source:** FKP22, §8 preceding Theorem 8.1, pp.37–38. The actual reduction notion parallels modularity in §7 and uses finite determinant.

**Uses that determine the API.**

- Theorem 8.1, p.38: Converts a full-image integral lift into a cuspidal automorphic witness.
- Corollaries 8.3–8.4, pp.38–40: The chosen residual extension or direct sum must survive the lattice construction.

**API.**

- `Lifting.actual_function_field_automorphy.langlands_iff` (equivalence): The automorphic lattice witness is equivalent to a finitely ramified irreducible integral lift with finite determinant.
- `Lifting.actual_function_field_automorphy.scalar_extension` (functoriality): Finite residual coefficient extension preserves the predicate.
- `Lifting.actual_function_field_automorphy.semisimple_comparison` (compatibility): For an irreducible residual representation it agrees with the usual automorphic residual predicate; the general definition retains its extension class.

**Unit tests.**

- `Lifting.actual_function_field_automorphy.full_reduction` (non-example): A semisimplification isomorphism alone does not identify a nonsplit residual extension.
- `Lifting.actual_function_field_automorphy.determinant` (characterisation): The determinant of a witness has finite order, including on constant-field Frobenius.
- `Lifting.actual_function_field_automorphy.lattice_change` (compatibility): Homothetic lattices give the same witness, while nonhomothetic lattices may give different actual reductions of one π.

**Checks.**

- A semisimplification isomorphism alone does not identify a nonsplit residual extension.

<a id="function-field-automorphy"></a>

### Automorphy from the lifting hypotheses

**Target:** `GlobalGaloisDeformationsPartII:GG2.9/function-field-automorphy` (theorem). **Planet:** Function-field automorphy theorem.

For F a global function field of characteristic ℓ≠p, p≫n and ρ̄:Γ_{F,S}→GL_n(k) satisfying C1–C4, the actual residual representation is automorphic. Choose the fixed determinant to be the Teichmüller lift of detρ̄, hence finite order. Equal-characteristic local lifts exist, and since p∤n their determinants can be corrected by an n-th root in 1+ϖO.

**Needs:** [GG2.9/actual-function-field-automorphy](#actual-function-field-automorphy); [GG2.6/main-geometric-lift](#main-geometric-lift); `LocalGaloisDeformationRings:R08.2/equal-characteristic-local-lifts`; `GlobalShtukasAndFunctionFieldLanglands:GS.6/the-global-correspondence-for-gl-r`; `ArithmeticGaloisDuality:R02.4/poitou-tate`; `FunctionFieldArithmetic:FA.5`.

**Construction or proof.**

1. Import the equal-characteristic local lifting theorem and normalize the determinant by its unique pro-p n-th root.
2. Apply the global geometric lifting theorem in characteristic ℓ.
3. Full derived congruence image makes the characteristic-zero GL_n representation irreducible.
4. Apply the two-way Lafforgue correspondence and retain the integral lattice.

**Source:** FKP22, Theorem 8.1 and proof, p.38. Automatic local liftability and finite determinant complete the function-field application.

**Checks.**

- The Teichmüller determinant has finite order even on constant-field Frobenius. An arbitrary p-adic determinant would not meet the stated Lafforgue contract.

<a id="function-field-irreducible-boundary"></a>

### The irreducible function-field specialization

**Target:** `GlobalGaloisDeformationsPartII:GG2.9/function-field-irreducible-boundary` (comparison).

The theorem applies to an absolutely GL_n-irreducible residual representation whose restriction to Γ_{F(ζ_p)} remains absolutely irreducible and for which [F(ζ_p):F]>a_GL_n, with p≫n. Absolute irreducibility over F alone does not imply C1–C4 uniformly in F for a bound depending only on n. For fixed F a sufficient prime bound may also depend on its constant field. The stronger unramified-outside-S lifting theorem from de Jong–Gaitsgory is an independent imported result, not a consequence of this method.

**Needs:** [GG2.1/irreducible-image-input](#irreducible-image-input); [GG2.1/cyclic-quotient-bound](#cyclic-quotient-bound); [GG2.1/cyclotomic-exclusion](#cyclotomic-exclusion); [GG2.9/function-field-automorphy](#function-field-automorphy); [GG2.0/residual-conditions](#residual-conditions).

**Construction or proof.**

1. Use the irreducible residual criteria under their actual cyclotomic hypotheses.
2. Apply the function-field automorphy theorem.
3. Check the failed uniform claim by induced two-dimensional examples over constant fields with q≡−1 mod p, where κ̄ occurs in the adjoint module.

**Source:** FKP22, Remark 8.2, p.38; FKP19 Corollary A.7, pp.63–64. The corrected comparison keeps the necessary cyclotomic conditions.

**Checks.**

- For F=F_q(t), q≡−1 mod p, a suitable two-dimensional representation induced from the quadratic constant extension is irreducible but has κ̄ among its adjoint constituents.

<a id="two-block-automorphy"></a>

### Automorphy for two absolutely irreducible blocks

**Target:** `GlobalGaloisDeformationsPartII:GG2.9/two-block-automorphy` (theorem). **Planet:** Two-block automorphy.

Let ρ̄ be an extension of absolutely irreducible r₂ by r₁ of dimensions n₂,n₁ over a global function field, n=n₁+n₂ and p≫n. Require r₁≄r₂ and r₁≄r₂κ̄⁻¹, and for d=gcd(n₁,n₂), χ=(det r₁)^{n₂/d}(det r₂)^{−n₁/d}, require [F(ζ_p):F(ζ_p)∩F(χ)]>b(n₁,n₂). Then ρ̄ is automorphic. For a split sum only r₁≄r₂ is needed in the second condition, since one may choose the orientation after the cyclotomic-degree check.

**Hypotheses and conventions.** For the nonsplit case, noninjectivity of the image projection to the Levi must be proved, using complete reducibility of small finite-group representations.

**Needs:** [GG2.1/maximal-separation](#maximal-separation); [GG2.1/maximal-parabolic-criteria](#maximal-parabolic-criteria); [GG2.7/full-unipotent-extension](#full-unipotent-extension); [GG2.7/levi-residual-lattice](#levi-residual-lattice); [GG2.9/function-field-automorphy](#function-field-automorphy); `ArithmeticGaloisRepresentations:G7`; `GlobalShtukasAndFunctionFieldLanglands:GS.6/the-global-correspondence-for-gl-r`.

**Construction or proof.**

1. Apply maximal separation to the primitive determinant-ratio character to obtain C3,C4.
2. For a nonsplit representation show that an injective image projection would force complete reducibility by the small-representation theorem; then apply the corrected maximal-parabolic criteria and the function-field theorem.
3. For a split sum choose an orientation avoiding the inverse-cyclotomic coincidence; both orientations cannot fail under the degree bound.
4. Create a nonsplit extension, lift it automorphically, and change the residual lattice to the original split sum.

**Source:** FKP22, Corollary 8.3 (Theorem C) and proof, pp.38–39. The determinant character is primitive and the nonsplit image-projection step is explicit.

**Checks.**

- For unequal block dimensions the two Hom invariant tests vanish automatically. The primitive determinant character still has to pass its cyclotomic-degree test.

<a id="direct-sum-automorphy"></a>

### Automorphy of separated direct sums

**Target:** `GlobalGaloisDeformationsPartII:GG2.9/direct-sum-automorphy` (theorem). **Planet:** Direct-sum automorphy.

Let ρ̄=⊕_{i=1}^r r_i with r>1, each r_i absolutely irreducible of dimension n_i, p≫Σn_i, and r_i≄r_jψ for all i≠j and ψ∈{1,κ̄,κ̄⁻¹}. For χ_ij=(det r_i)^{n_j}(det r_j)^{−n_i}, require the joint condition [F(ζ_p):F(ζ_p)∩F(χ_ij:i≠j)]>b(n). Then ρ̄ is automorphic. Separate lower bounds for the pairwise fields do not replace the joint condition.

**Needs:** [GG2.1/block-criteria](#block-criteria); [GG2.7/remove-invariants](#remove-invariants); [GG2.7/levi-residual-lattice](#levi-residual-lattice); [GG2.9/function-field-automorphy](#function-field-automorphy); `GlobalShtukasAndFunctionFieldLanglands:GS.6/the-global-correspondence-for-gl-r`.

**Construction or proof.**

1. Apply the corrected GL_n block criterion to obtain the invariant conditions and cyclotomic exclusion.
2. Apply the Levi lifting argument in positive characteristic with finite determinant; its proof has no oddness or archimedean step there.
3. Use Lafforgue and the residual lattice change to retain the original direct sum.

**Source:** FKP22, Corollary 8.4 and Lemma A.9, pp.39–40,46–47. The proof requires separation from the joint determinant-character field.

**Checks.**

- For three blocks the character fields must be combined before taking their intersection with F(ζ_p); pairwise degrees alone do not prove the hypothesis.

**Layer acceptance:** G3 function-field duality and G2 small-representation splitting, plus inherited G1; Lafforgue is the existing GS.6 node.

## Layer GG2.10: Symplectic compatible systems and conditional scope

Assemble the corrected Proposition 9.1 with constituentwise absolute irreducibility after cyclotomic restriction, ordinary local data, a Steinberg place, potential automorphy, automorphy lifting and descent. Track the connected monodromy argument through the regular-unipotent classification input. Record the precise relation of the proved lifting results to Conjecture D as a conditional implication, preserving the missing automorphy and central-image assumptions.

<a id="ordinary-steinberg-lift"></a>

### Ordinary symplectic lifts with a Steinberg place

**Target:** `GlobalGaloisDeformationsPartII:GG2.10/ordinary-steinberg-lift` (theorem). **Planet:** Ordinary symplectic lifting.

Let F be totally real, p≫n, [F(ζ_p):F]>a_GSp, and ρ̄:Γ_{F,S}→GSp_{2n}(k) be absolutely GSp-irreducible on Γ_{F(ζ_p)}, with similitude κ̄^{1−2n}. Assume at every v|p a fixed-similitude ordinary lift of GL_{2n}-weight ξ_v∈(Z_+^{2n})^{Hom(F_v,Q̄_p)}. Then the lifting theorem produces a geometric lift with similitude κ^{1−2n}, full derived congruence image, those ordinary local components, and two new trivial places v₀,v₁ of distinct residue characteristics where its Weil–Deligne parameters are twists of Steinberg. Its Zariski closure is GSp_{2n}, since the multiplier has infinite image.

**Hypotheses and conventions.** In the convention HT(κ)=−1 the diagonal ordinary characters have weights ξ_{τ,2n−i+1}+i−1.

**Needs:** [GG2.6/irreducible-specialisation](#irreducible-specialisation); [GG2.6/main-geometric-lift](#main-geometric-lift); `LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p`; `LocalGaloisDeformationRings:L7/g-valued-ordinary-condition`; `LocalGaloisDeformationRings:L7/g-valued-ordinary-components`; `AutomorphicGaloisRepresentations:R19.5`; `LocalGaloisDeformationRings:L7`.

**Construction or proof.**

1. Use the existing minimally ramified GSp local lifts away from p.
2. Regularity makes the lower half of the ordinary flag isotropic, giving the GSp Borel condition.
3. Import the ordinary union-of-components theorem with its fixed-similitude dimension formula.
4. Choose smooth Steinberg points at two trivial places v₀,v₁ of distinct residue characteristics and approximate both deeply enough to retain their local monodromy. This is the same finite-set local prescription in Theorem5.2; the second place ensures an away-ℓ Steinberg place for every coefficient prime ℓ.
5. Apply the irreducible specialization of the global lifting theorem.

**Source:** FKP22, Proof of Proposition 9.1, pp.41–42; Appendix B, Definition B.2 and Lemma B.4, pp.52–55. These local choices are supplied by existing owners and feed the global lifting theorem.

**Checks.**

- For n=1 and ξ=(0,0) the ordinary weights are 0,1 under HT(κ)=−1. The similitude κ^{-1} has weight 1 and pairs these weights.

<a id="automorphy-lifting-application"></a>

### The residually reducible automorphy-lifting application

**Target:** `GlobalGaloisDeformationsPartII:GG2.10/automorphy-lifting-application` (theorem). **Planet:** Residually reducible automorphy lifting.

Assume additionally that ρ̄ as a GL_{2n}-representation is not induced from a proper subgroup and that each of its GL-constituents remains absolutely irreducible on Γ_{F(ζ_p)}. Choose a quadratic CM L/F and L′=LF′ disjoint from F(ρ̄,ζ_p). Subject to the exact exported ANT20 Theorem 1.1 hypotheses, the ordinary symplectic lift restricted to Γ_{L′} is RACSDC automorphic. Each residual constituent is polarized individually, and the induced action on its adjoint block is x↦−A xᵗA⁻¹; mere existence of a polarization of the whole direct sum does not suffice.

**Hypotheses and conventions.** The constituentwise cyclotomic absolute irreducibility is an added hypothesis correcting Proposition 9.1. Verify all eight ANT hypotheses through the supplier contract; no replacement by a generic automorphy claim. The supplier node PotentialAutomorphyInfrastructurePartII:PL.7/residually-reducible-automorphy-lifting states ANT20 Theorem 1.1 with strong primitivity (the residual semisimplification is not the semisimplification of any induced representation), which is stronger than the non-inducedness assumed in FKP22 Proposition 9.1. Either verify strong primitivity for ρ̄|Γ_{L′} or obtain the source’s primitive form from that owner.

**Needs:** [GG2.10/ordinary-steinberg-lift](#ordinary-steinberg-lift); [GG2.1/cyclic-quotient-bound](#cyclic-quotient-bound); `ModularityAndLanglandsExtensions:ML.2/potential-automorphy-with-steinberg-place`; `PotentialAutomorphyInfrastructurePartII:PL.7/residually-reducible-automorphy-lifting`; `GlobalGaloisDeformations:G7`.

**Construction or proof.**

1. Use GSp irreducibility to obtain a nondegenerate pairing on every GL constituent, not a pairing that permutes constituents.
2. Use disjointness to preserve the exact finite residual image and cyclotomic constituent conditions.
3. Use the cyclic-quotient bound to exclude a p-quotient and supply the required cyclotomic degree conditions.
4. Combine residual ordinary potential automorphy with Steinberg components above v₀ and v₁ (ModularityAndLanglandsExtensions ML.2/potential-automorphy-with-steinberg-place, with the requested two-place and ι-ordinary strengthening), regularity and noninduction with the ANT20 theorem of PotentialAutomorphyInfrastructurePartII PL.7, checking its eight hypotheses one by one.

**Source:** FKP22, Proof of Proposition 9.1, pp.42–43; cited ANT20 Theorem 1.1. The theorem applied here is automorphy lifting, and the constituent hypothesis is not implied by GSp irreducibility alone.
**Source:** ANT20, Theorem 1.1, pp.1–2 (arXiv v2); notation and ordinarity, pp.3–4. The precise ordinary automorphy-lifting theorem has eight groups of hypotheses, including individual polarizations, cyclotomic constituent conditions, primitive image and no p-quotient.

**Checks.**

- A polarized sum whose complex conjugation permutes two inequivalent constituents does not meet the individually polarized hypothesis. Verify each constituent separately.

<a id="symplectic-compatible-system"></a>

### A strictly pure symplectic compatible system

**Target:** `GlobalGaloisDeformationsPartII:GG2.10/symplectic-compatible-system` (theorem). **Planet:** Symplectic compatible systems.

Under the corrected hypotheses of the preceding symplectic, potential-automorphy and ANT application targets, the geometric lift belongs to a strictly pure compatible system of Γ_F-representations indexed by finite coefficient places and embeddings into Q̄_ℓ. Each member is symplectic with the compatible similitude and has Zariski-dense image in GSp_{2n}, provided the regular-unipotent classification and independence-of-formal-character input in the monodromy contract is established. For n=1 the principal rank-one case already is GSp₂.

**Hypotheses and conventions.** Strict purity and the all-ℓ monodromy conclusion require their own supplier contracts; neither follows from a p-adic lift alone.

**Needs:** [GG2.10/automorphy-lifting-application](#automorphy-lifting-application); `ModularityAndLanglandsExtensions:ML.2/compatible-system-from-potential-automorphy`; `ModularityAndLanglandsExtensions:ML.5`; `AutomorphicGaloisRepresentationsPartII:AG2.6`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon`.

**Construction or proof.**

1. Descend the CM automorphic representation to the totally real field F′, choosing its quadratic twist so the attached representation equals ρ|Γ_{F′}.
2. Apply the existing node ModularityAndLanglandsExtensions ML.2/compatible-system-from-potential-automorphy (the argument of BLGGT14 Theorem 5.5.1, with its soluble-descent and part-of-a-compatible-system inputs) to the descended representation.
3. For every coefficient characteristic ℓ choose one of v₀,v₁ with different residue characteristic. Local–global compatibility there supplies a regular unipotent in that ℓ-adic member.
4. Apply the requested classification with irreducibility and reductivity hypotheses, then independence of formal character/rank to exclude the principal GL₂ alternative for n>1.
5. Use the compatible nonfinite multiplier to recover the full GSp center.

**Source:** FKP22, Proposition 9.1 and its final proof paragraphs, pp.41–43; cited BLGGT14 Theorem 5.5.1. The corrected target exposes the separate all-ℓ monodromy input rather than treating density as automatic.
**Source:** BLGGT14, Theorem 5.5.1 and proof, pp.590–593; Lemma 5.3.1, pp.580–581. The potential-automorphy descent proof uses Brauer induction and compatible automorphic systems. The literal theorem assumes residual irreducibility and potential diagonalizability and cannot be applied directly here; the requested adaptation is separate. Lemma 5.3.1 concerns components and multiplicity, not the full formal-character input.

**Checks.**

- For n=1 the principal GL₂ possibility already has the required GSp₂ derived group. For n>1 it has smaller rank and requires the formal-character input to exclude it.

<a id="conjectural-scope"></a>

### Conditional relation to the L-group lifting conjecture

**Target:** `GlobalGaloisDeformationsPartII:GG2.10/conjectural-scope` (comparison).

For a quasi-split group over a global field with L-group satisfying the lifting-datum hypotheses, the main theorem gives the lifting part of Conjecture D only for the residual and local hypotheses actually verified here. Derived density upgrades to density in G⁰ only if the chosen multiplier has Zariski-dense central image. Automorphy requires the separate L-group correspondence and an automorphy theorem for the constructed lift. The stronger claim of no new ramification for absolutely irreducible residual data is not supplied by this method. In characteristic p=2 the proposed involution-lifting oddness condition is a separate conditional scope, and none of the p-odd results here asserts it.

**Needs:** [GG2.6/main-geometric-lift](#main-geometric-lift); [GG2.8/reducible-modularity](#reducible-modularity); [GG2.9/function-field-automorphy](#function-field-automorphy); [GG2.10/symplectic-compatible-system](#symplectic-compatible-system).

**Construction or proof.**

1. Compare the precise hypotheses and conclusions of the main theorem with the conjecture.
2. Separate finite ramification, derived density, center density and automorphy as distinct obligations.
3. Use the proven GL₂ and function-field applications only in their own stated ranges.

**Source:** FKP22, Conjecture D and discussion, pp.4–5; §§8–9, pp.37–43. This records the conjectural boundary without asserting its unproved parts.

**Checks.**

- A fixed multiplier with finite central image cannot yield Zariski density in a positive-dimensional center merely from derived congruence density.

**Layer acceptance:** G5: regular-unipotent classification and formal-character independence for the density conclusion of ML.2/compatible-system-from-potential-automorphy. The two-Steinberg-place and ι-ordinary strengthening of ML.2/potential-automorphy-with-steinberg-place is requested from its owner; ANT20 comes from PL.7, whose strong-primitivity hypothesis must be checked or relaxed. Inherits G1 and the G4 convention check at the polarized supplier.

## Supplier contracts

Each numbered contract is an explicit input, at the existing owner stage or node. Broader statements than that owner currently exports are additions in its direction; the ownership proposals preserve this separation. Numbering is only for this document; the packet identifies each supplier and consuming target directly.

### Contract 1: GlobalGaloisDeformations:R04.1

Extend the existing GL_n absolutely-irreducible deformation formalism to the fixed-quotient G-valued datum (including prime-to-p components): strict-conjugacy action, the H¹ torsor of lifts across square-zero coefficient kernels, the H² obstruction and its restriction to local problems. Do not assume representability of an unframed reducible functor. FKP22 §2 p.9 and the paragraph before Proposition 3.8, p.16; FKP19 Assumption 2.1, p.14.

**Consumers:** [GG2.0/lifting-datum](#lifting-datum); [GG2.3/initial-mod-square](#initial-mod-square); [GG2.3/doubling](#doubling); [GG2.3/controlled-tower](#controlled-tower); [GG2.6/compatible-finite-ramification](#compatible-finite-ramification).

### Contract 2: GlobalGaloisDeformations:R04.3

Supply the global/local obstruction diagram for fixed-μ lifts, including compatibility under coefficient reduction and passage to one fixed finite ramification set. Only the framed functors and explicit H¹ action are used; a global reducible universal ring is not assumed.

**Consumers:** [GG2.3/initial-mod-square](#initial-mod-square); [GG2.3/controlled-tower](#controlled-tower); [GG2.6/compatible-finite-ramification](#compatible-finite-ramification).

### Contract 3: ArithmeticGaloisDuality:R02.5

Export finite-coefficient Selmer kernels and local annihilators, restriction, change of coefficients, unramified conditions and localization cokernels for arbitrary finite F_p-modules and O/ϖ^r lattices with possibly nonsplit finite action. Include canonical compatibility with the pinned continuous explicit H¹. The existing Selmer carrier is owned here, not defined a second time by this roadmap.

**Consumers:** [GG2.0/residual-conditions](#residual-conditions); [GG2.2/sha-killing](#sha-killing); [GG2.2/one-prime-sequence](#one-prime-sequence); [GG2.4/relative-selmer-image](#relative-selmer-image); [GG2.4/coefficient-exactness](#coefficient-exactness); [GG2.4/relative-balance](#relative-balance); [GG2.4/root-local-condition](#root-local-condition).

### Contract 4: ArithmeticGaloisDuality:R02.1

Export the continuous coefficient long exact sequence and finite inverse-limit/finite-generation comparison for O-lattices and discrete finite quotients, including the H⁰ conditions needed for injectivity of coefficient H¹ maps. In the p-adic analytic application combine it with the separate Lazard contract.

**Consumers:** [GG2.4/relative-selmer-image](#relative-selmer-image); [GG2.4/coefficient-exactness](#coefficient-exactness); [GG2.4/lie-cohomology-bound](#lie-cohomology-bound); [GG2.4/deep-reduction-vanishing](#deep-reduction-vanishing).

### Contract 5: ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence

Use the existing Hochschild–Serre/inflation–restriction formalism for the finite splitting extension K/F, with restriction injection under C4, finite component action, and explicit equivariant Hom descriptions over Γ_K. Require the same operations for global function fields, not only number fields.

**Consumers:** [GG2.1/cyclotomic-exclusion](#cyclotomic-exclusion); [GG2.2/sha-killing](#sha-killing); [GG2.5/finite-image-vanishing](#finite-image-vanishing).

### Contract 6: ArithmeticGaloisDuality:R02.4/poitou-tate

Extend the existing number-field Poitou–Tate node to global function fields of characteristic ℓ≠p with arbitrary p-primary Galois modules, finite ramification sets and the correct dual M∨(1). Export the Sha¹/Sha² perfect duality and exact localization obstruction used in the one-prime and fixed-ramification lifting arguments. This extension remains subject to gap G3 because its primary positive-characteristic source has not been audited.

**Consumers:** [GG2.2/sha-killing](#sha-killing); [GG2.2/cyclic-sha-stabilisation](#cyclic-sha-stabilisation); [GG2.2/one-prime-sequence](#one-prime-sequence); [GG2.6/compatible-finite-ramification](#compatible-finite-ramification); [GG2.9/function-field-automorphy](#function-field-automorphy).

### Contract 7: ArithmeticGaloisDuality:R02.5/greenberg-wiles-formula

Export the exact change-of-local-condition formula, in both global characteristics, for arbitrary finite modules and local cocycle lattices; track orders over O/ϖ^r and dimensions over F_p without confusing them with k-dimensions. Include the archimedean and p-adic corrections used by the balanced and nongeometric arguments. Positive characteristic is gap G3.

**Consumers:** [GG2.2/one-prime-sequence](#one-prime-sequence); [GG2.4/relative-balance](#relative-balance); [GG2.5/relative-selmer-annihilation](#relative-selmer-annihilation); [GG2.6/nongeometric-lift](#nongeometric-lift).

### Contract 8: ArithmeticGaloisDuality:R02.5/selmer-condition-comparison

Export the two nested-local-condition exact comparisons with Tate-annihilator dual conditions, retaining nonsurjectivity at the final map. Extend the number-field formulation to global function fields (gap G3).

**Consumers:** [GG2.2/one-prime-sequence](#one-prime-sequence); [GG2.5/relative-selmer-annihilation](#relative-selmer-annihilation).

### Contract 9: ArithmeticGaloisDuality:D7

Supply perfect local Tate pairings for all finite O/ϖ^r modules at local fields in either characteristic different from p, the unramified-line annihilator, coefficient functoriality and the calibrated tame/unramified cup product. The reviewed node states the number-field version; add positive characteristic through gap G3.

**Consumers:** [GG2.3/trivial-prime-pairing](#trivial-prime-pairing); [GG2.4/coefficient-exactness](#coefficient-exactness); [GG2.4/root-local-condition](#root-local-condition); [GG2.4/smooth-neighborhood-conditions](#smooth-neighborhood-conditions).

### Contract 10: tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Use the upstream layer-7 parabolic subgroups, unipotent radicals, Levi decompositions, root data, root subgroups and Weyl groups of a split reductive group over a field, as that layer states them. The large-prime equivariant exponential, centralizer and adjoint-filtration inputs used with them (FKP22 Lemma A.1 and Remarks A.2/A.8 pp.44–46; FKP19 Lemmas A.1–A.6 pp.60–63) are outside the stated scope of that Tau Ceti layer and are recorded as gap G6; they are not requested from the upstream roadmap.

**Consumers:** [GG2.0/lifting-datum](#lifting-datum); [GG2.1/irreducible-image-input](#irreducible-image-input); [GG2.1/cyclic-quotient-bound](#cyclic-quotient-bound); [GG2.1/central-jordan-holder](#central-jordan-holder); [GG2.1/abelian-root-subgroup](#abelian-root-subgroup); [GG2.1/block-criteria](#block-criteria); [GG2.1/maximal-parabolic-criteria](#maximal-parabolic-criteria); [GG2.1/borel-criteria](#borel-criteria); [GG2.5/simultaneous-root-position](#simultaneous-root-position).

### Contract 11: tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Use the upstream maximal tori, root-space decomposition and root subgroups over finite fields, as layer 7 states them. The uniform finite-field root-position and general-position statements built on them (FKP22 Proposition 3.6 pp.12–15 and Theorem 4.4 pp.20–23; FKP19 Proposition 5.9 p.29 and Lemma 5.13 p.38) are gap G6(iv); the simultaneous root-position theorem of FKP19 Proposition 6.8 is owned by GG2.5.

**Consumers:** [GG2.2/spanning-classes](#spanning-classes); [GG2.2/prescribed-vector-classes](#prescribed-vector-classes); [GG2.3/controlled-tower](#controlled-tower); [GG2.5/simultaneous-root-position](#simultaneous-root-position).

### Contract 12: tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Use the upstream parabolic and Levi structure and the conjugacy of parabolic subgroups. The G-semisimplification of a finite image (Levi projection from a minimal parabolic containing it, uniqueness up to G(k)-conjugacy, behaviour under residue-field extension, and the parabolic adjoint filtration with graded pieces m⊕u⊕u⁻; FKP22 Lemma 6.1 p.28, Lemmas A.5/A.9/A.11 pp.45–48) is gap G6(iii).

**Consumers:** [GG2.1/cyclotomic-exclusion](#cyclotomic-exclusion); [GG2.1/block-criteria](#block-criteria); [GG2.7/levi-residual-lattice](#levi-residual-lattice); [GG2.7/remove-invariants](#remove-invariants); [GG2.7/levi-geometric-lift](#levi-geometric-lift).

### Contract 13: tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon

Use the upstream layer-8 classification of split reductive groups by root data, central isogenies, and the decomposition of the adjoint group into simple factors permuted by the component group. Bounded powers with Levi centralizer (FKP19 Lemma A.5 p.62) are part of the cyclic-quotient-bound target here; the centralizer theorems its proof uses are gap G6(ii). The regular-unipotent classification is gap G5.

**Consumers:** [GG2.1/cyclic-quotient-bound](#cyclic-quotient-bound); [GG2.5/adjoint-orbit-reduction](#adjoint-orbit-reduction); [GG2.7/unipotent-local-lift](#unipotent-local-lift); [GG2.10/symplectic-compatible-system](#symplectic-compatible-system).

### Contract 14: ReductiveGroupsPartII:RG2.0

Use the current upstream RG2.0.3 congruence subgroups 𝒢(O)_n of a smooth affine O-model, their neighbourhood-basis property and the identification of the successive quotients with Lie(𝒢_κ)⊗m^n/m^{n+1}, as stated there. The compact p-adic analytic structure and Lazard’s cohomology inputs are not part of that upstream layer; they are requested from their atlas owners (LocallyAnalyticDistributionsPartII ND.0, NoncommutativeAndEquivariantIwasawa NE.0, AutomorphicFormsOnReductiveGroups AF.1a). The Tau Ceti roadmap is not extended from the atlas.

**Consumers:** [GG2.4/lie-cohomology-bound](#lie-cohomology-bound); [GG2.4/deep-reduction-vanishing](#deep-reduction-vanishing); [GG2.6/finite-congruence-detection](#finite-congruence-detection); [GG2.3/congruence-field-disjointness](#congruence-field-disjointness); [GG2.3/controlled-tower](#controlled-tower).

### Contract 15: ReductiveGroupsPartII:RG2.2

Use the current upstream lattice-class tree, neighbor-line correspondence, PGL₂ action, coefficient-extension subdivision and fixed-point convexity; this roadmap owns only the arithmetic fixed-segment/reduction consequences, with their matrix proof. No second tree definition is planned.

**Consumers:** [GG2.8/stable-lattice-segment](#stable-lattice-segment).

### Contract 16: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation

Use the upstream layer-3 Frattini theory (the closed Frattini subgroup, Frattini-quotient generation criterion and its openness) for a topologically finitely generated pro-p group, as stated there. Apply it to the compact analytic congruence kernel; the newer ProfiniteArithmetic automorphism-kernel theorem is a different result and is not substituted for this criterion.

**Consumers:** [GG2.6/finite-congruence-detection](#finite-congruence-detection).

### Contract 17: ArithmeticGaloisRepresentations:G7

Extend the finite-image owner by Larsen–Pink Theorem 0.2 with the normal series Γ₃⊲Γ₂⊲Γ₁⊲Γ and bounded index, prime-to-p central factors and defining-characteristic simple factors, plus the small-dimension complete-reducibility/H¹ input used in FKP19 Lemma A.1. LP11 §12 p.1156 was read. The exact Guralnick Theorem A primary contract remains gap G2: do not infer the H¹ or splitting conclusions from Larsen–Pink alone.

**Consumers:** [GG2.1/irreducible-image-input](#irreducible-image-input); [GG2.1/cyclic-quotient-bound](#cyclic-quotient-bound); [GG2.1/cyclotomic-exclusion](#cyclotomic-exclusion); [GG2.1/maximal-parabolic-criteria](#maximal-parabolic-criteria); [GG2.9/two-block-automorphy](#two-block-automorphy).

### Contract 18: GlobalGaloisDeformations:G7

Extend the existing polarized module owner by the corrected A.10 criterion: each absolutely irreducible constituent over the CM field must be polarized individually, complex conjugation acts by x↦−A xᵗA⁻¹, and determinant/cyclotomic separation is joint. Resolve whether the coefficient module is Lie ker(multiplier)=gl_n or Lie((G_n⁰)^der)=sl_n before applying the invariant conclusion; this is gap G4. A polarization that permutes constituents is insufficient. FKP22 A.10 p.47, corrected E38; this unused-in-the-body criterion is routed to its owner, not replanned here.

**Consumers:** [GG2.10/automorphy-lifting-application](#automorphy-lifting-application).

### Contract 19: tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

Use the upstream Chebotarev density theorem (Dirichlet density of the primes with a prescribed Frobenius class in a finite Galois extension), applied to the finite Galois composita of cocycle and cyclotomic fields. The uniform product failure estimate for a positive upper-density set is not an upstream target: it is GG2.3/density-selection here. Independence of the auxiliary fields is not supplied by Chebotarev and remains gap G1.

**Consumers:** [GG2.2/sha-killing](#sha-killing); [GG2.2/spanning-classes](#spanning-classes); [GG2.3/density-selection](#density-selection); [GG2.3/controlled-tower](#controlled-tower); [GG2.5/simultaneous-detection](#simultaneous-detection).

### Contract 20: FunctionFieldArithmetic:FA.5

Use the global-function-field Chebotarev theorem with explicit constant-field/degree congruence conditions. Export compatible norm and Frobenius prescriptions and the corresponding positive upper density across allowed degrees; do not assert an unrestricted positive density in every degree.

**Consumers:** [GG2.2/sha-killing](#sha-killing); [GG2.2/spanning-classes](#spanning-classes); [GG2.3/density-selection](#density-selection); [GG2.5/simultaneous-detection](#simultaneous-detection); [GG2.9/function-field-automorphy](#function-field-automorphy).

### Contract 21: LocalGaloisDeformationRings:R08.1/g-valued-framed-ring

Use existing fixed-μ G-valued framed local functors. Export the explicit tangent cocycle action and obstruction restriction diagram; no second construction of these rings is planned.

**Consumers:** [GG2.0/lifting-datum](#lifting-datum); [GG2.3/initial-mod-square](#initial-mod-square); [GG2.5/adjoint-orbit-reduction](#adjoint-orbit-reduction).

### Contract 22: LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p

Export the FKP19 root lifting functor and cocycle lattices of Lemmas 3.5/6.7 (pp.13–16,46–47), with coefficient exactness, divided coboundaries, root inertia, toral norm equation, stability of lifting fibers and the rank-one unramified quotient. Also export smooth generic-point analytic neighborhoods, their stable local cocycle lattices and the coefficient-extension approximation of Prop.4.7/Lemma4.9 pp.22–25. These are extensions of the existing local G-valued ring owner. Include the equal-characteristic version away from p.

**Consumers:** [GG2.3/controlled-tower](#controlled-tower); [GG2.4/root-local-condition](#root-local-condition); [GG2.4/smooth-neighborhood-conditions](#smooth-neighborhood-conditions); [GG2.7/unipotent-local-lift](#unipotent-local-lift).

### Contract 23: LocalGaloisDeformationRings:R08.3/g-valued-pst-rings

Use the existing G-valued potentially semistable framed generic fibers with fixed μ and regular Hodge type; export smooth points on each requested component, local analytic lifting fibers and tangent cardinality |H⁰_v(M_r)| |O/ϖ^r|^{[F_v:Q_p]dim Flag}. Approximate original local lifts after one finite coefficient extension, uniformly for all accuracy t.

**Consumers:** [GG2.4/smooth-neighborhood-conditions](#smooth-neighborhood-conditions); [GG2.6/main-geometric-lift](#main-geometric-lift); [GG2.7/levi-geometric-lift](#levi-geometric-lift).

### Contract 24: LocalGaloisDeformationRings:L7

Use the existing G-valued ordinary condition and its union of generic components, fixing the full torus character in a basis of X*(T), including its center. Export GSp ordinary local lifts and Steinberg smooth points, and the GL₂ ordinary/crystalline local lifts of FKP22 Lemma7.2 pp.33–35 with the exact determinant normalization. Generic ordinarity alone does not specify these weights or finite-order corrections.

**Consumers:** [GG2.8/global-determinant-match](#global-determinant-match); [GG2.8/reducible-modularity](#reducible-modularity); [GG2.10/ordinary-steinberg-lift](#ordinary-steinberg-lift).

### Contract 25: ArithmeticGaloisRepresentations:R01.1

Use stable integral lattices, actual residual reductions, continuous characters, finite ramification and changes of coefficients. Export the Galois cocycle fixed-field operations using the existing arithmetic carriers; the light continuous H¹ baseline does not identify an arithmetic absolute Galois group by itself.

**Consumers:** [GG2.0/lifting-datum](#lifting-datum); [GG2.0/cocycle-fields](#cocycle-fields); [GG2.8/infinitely-many-extensions](#infinitely-many-extensions); [GG2.9/actual-function-field-automorphy](#actual-function-field-automorphy); [GG2.8/actual-modularity](#actual-modularity).

### Contract 26: ArithmeticGaloisRepresentations:R01.2

Use the existing tame local Weil quotient with arithmetic Frobenius σ and σ τ σ⁻¹=τ^q; provide the norm/cyclotomic conventions and finite fields of definition for the residual data in both characteristics.

**Consumers:** [GG2.0/trivial-prime](#trivial-prime); [GG2.0/cyclotomic-intersection](#cyclotomic-intersection); [GG2.3/trivial-prime-pairing](#trivial-prime-pairing).

### Contract 27: AutomorphicGaloisRepresentations:R19.1

Export the newform Galois representations with stable integral lattices, including weight-one Deligne–Serre representations. Actual modularity requires retaining their full lattice reductions. Also supply finite normalized-eigenform sets at fixed weight and level, through the modular-form-space owner.

**Consumers:** [GG2.8/actual-modularity](#actual-modularity); [GG2.8/semisimple-modularity](#semisimple-modularity); [GG2.8/fixed-weight-level-finiteness](#fixed-weight-level-finiteness).

### Contract 28: AutomorphicGaloisRepresentations:R19.5

Export local–global compatibility identifying ordinary weights, crystalline p-prime level conclusions and Steinberg Weil–Deligne monodromy for the chosen local components; include the GSp minimally ramified local input through the local deformation owner.

**Consumers:** [GG2.8/reducible-modularity](#reducible-modularity); [GG2.10/ordinary-steinberg-lift](#ordinary-steinberg-lift).

### Contract 29: AlgebraicModularFormsAndSerreWeights:R15.4

Export the exact Serre weight and ordinary/crystalline local weight dictionary used by FKP22 Theorem7.4, and finite-dimensionality/finiteness of normalized newforms at fixed weight and level.

**Consumers:** [GG2.8/global-determinant-match](#global-determinant-match); [GG2.8/reducible-modularity](#reducible-modularity); [GG2.8/fixed-weight-level-finiteness](#fixed-weight-level-finiteness).

### Contract 30: ModularityAndLanglandsExtensions:ML.2/potential-automorphy-with-steinberg-place

Extend the existing node from one auxiliary place v₀ to a finite set of auxiliary trivial places, here two places v₀,v₁ of distinct residue characteristics, imposing the Moret–Bailly condition v(t(P))<0 at every place of F′ above each (BLGGT14 Proposition 3.1.1 pp.545–546 and Theorem 3.1.2 pp.546–549; BLGHT11 Lemma 5.1(2), pp.34–35). State in the conclusion that Π_{F′} is ι-ordinary of weight 0, as FKP22 records on p.42 and as ANT20 Theorem 1.1(6)(a) requires. The node already assumes the constituentwise self-duality and cyclotomic irreducibility of E32.

**Consumers:** [GG2.10/automorphy-lifting-application](#automorphy-lifting-application).

### Contract 31: ModularityAndLanglandsExtensions:ML.5

Export the quadratic-CM descent of the automorphic witness to the totally real extension, including its possible quadratic twist and its equality with the original Galois restriction.

**Consumers:** [GG2.10/symplectic-compatible-system](#symplectic-compatible-system).

### Contract 32: ModularityAndLanglandsExtensions:ML.2/compatible-system-from-potential-automorphy

Its conclusion that every member of the compatible system has Zariski-dense image in GSp_{2n} needs, for each coefficient characteristic ℓ, a Steinberg place of residue characteristic different from ℓ (the two places v₀,v₁ above), the classification of reductive subgroups containing a regular unipotent element and the ℓ-independence of the formal character (gap G5). BLGGT14 Lemma 5.3.1, pp.580–581, controls components and multiplicities only. Export the density conclusion with these inputs explicit; the strict-purity and descent parts of the node are used as stated.

**Consumers:** [GG2.10/symplectic-compatible-system](#symplectic-compatible-system).

### Contract 33: AutomorphicGaloisRepresentationsPartII:AG2.6

Export local–global compatibility for the descended compatible system at every place over the Steinberg place, including a regular-unipotent tame monodromy element at an away-ℓ place in each member. Use the two prescribed Steinberg places of distinct residue characteristic, so every ℓ has at least one such place.

**Consumers:** [GG2.10/symplectic-compatible-system](#symplectic-compatible-system).

### Contract 34: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

Use the current local reciprocity normalization and explicit cyclotomic symbol over Q_p: the global finite-order p-primary correction must have value one at Art(p). A local unramified factor cannot be inflated to a global character unramified outside p.

**Consumers:** [GG2.8/global-determinant-match](#global-determinant-match).

### Contract 35: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

Use the current Kronecker–Weber/cyclotomic reciprocity comparison over Q to inflate the normalized finite-order local correction to Γ_Q, unramified outside p. Retain the Art(p)=1 requirement and match its residual triviality.

**Consumers:** [GG2.8/global-determinant-match](#global-determinant-match).

### Contract 36: LocalGaloisDeformationRings:R08.3

In the GL₂ determinant target additionally export the crystalline local lift at the specified Serre weight, with a determinant exactly equal to μ after the unramified square-root normalization, and the potentially semistable component used by the geometric theorem.

**Consumers:** [GG2.8/global-determinant-match](#global-determinant-match).

### Contract 37: PotentialAutomorphyInfrastructurePartII:PL.7/residually-reducible-automorphy-lifting

The node states ANT20 Theorem 1.1 (= Theorem 6.1) with strong primitivity of the residual semisimplification instead of the source’s non-inducedness. The FKP22 Proposition 9.1 application verifies only non-inducedness of ρ̄|Γ_{L′} (FKP22 p.43). Either export the theorem under the source’s primitivity hypothesis with its proof, or state the extra hypothesis so that consumers can check it.

**Consumers:** [GG2.10/automorphy-lifting-application](#automorphy-lifting-application).

### Contract 38: NoncommutativeAndEquivariantIwasawa:NE.0

For a uniform (p-valued) pro-p group U and a finite free O-module V with continuous O-linear U-action: Z_p has a finite-length resolution by finite free Z_p[[U]]-modules and H^i(U,V)=Ext^i_{Z_p[[U]]}(Z_p,V), so H^i(U,V) is finitely generated over O and all H^i(U,V/ϖ^r) are computed by one bounded complex of finite sums of V (Lazard V (2.2.2.3) and (2.2.3.1), pp.165–166, as used in FKP19 Lemma B.1, p.64). Also Lazard V Theorem (2.4.10), pp.178–179: for U small enough, H^i(U,V)⊗Q_p is the Lie-algebra cohomology of Lie(U) with coefficients V⊗Q_p, with the Lie action of V (2.4.4). These extend the owner’s completed group rings, global dimension and Lazard cohomology of uniform groups.

**Consumers:** [GG2.4/lie-cohomology-bound](#lie-cohomology-bound).

### Contract 39: LocallyAnalyticDistributionsPartII:ND.0

Every compact p-adic analytic group has an open normal p-valued (uniform) subgroup of finite index (Lazard III (3.1.3) and (3.1.7.4), pp.91–94). For open subgroups of G(O), G smooth affine over O, identify such subgroups with deep congruence subgroups of the upstream RG2.0.3 filtration.

**Consumers:** [GG2.4/lie-cohomology-bound](#lie-cohomology-bound).

### Contract 40: AutomorphicFormsOnReductiveGroups:AF.1a

On the absolute Chevalley–Eilenberg complex owned there: for a semisimple Lie algebra g over a field of characteristic zero and a finite-dimensional g-module W, H^i(g,W)=0 for all i when W has no nonzero g-invariants, and H¹(g,W)=H²(g,W)=0 for every W (Whitehead’s lemmas; the Chevalley–Eilenberg theorems cited by FKP19 Lemma B.1, p.64).

**Consumers:** [GG2.4/lie-cohomology-bound](#lie-cohomology-bound).

## Open mathematical inputs

<a id="g1"></a>

### G1 — replacement for full-family auxiliary-field independence

FKP22 v5 Lemma3.7 pp.15–16 is false under its stated Assumption3.1: for F=Q, trivial SL₂ residual image and k=F_p, p≥5, M*=F_p(κ̄)³. For two basis lines, identify their scalar cocycles and put ζ_w=η_1^(w)−η_2^(w). Their equal inertia at w cancels, so ζ_w lies in the finite group H¹(Γ_{Q,T},F_p(κ̄)). Infinitely many w force ζ_w=ζ_w′ for distinct w,w′. This gives a nontrivial relation among four degree-p cocycle fields, contradicting strong disjointness. Restriction to Γ_K preserves the relation and individual nonvanishing; H¹(Gal(K/Q),F_p(κ̄))=0 as its order is p−1. C4 holds, but C1 fails. To close the main proof, establish the quantitative conditional-success/finite-quotient Chebotarev input actually needed by Proposition3.8 under C1,C3,C4, using a new construction or a proof allowing repeated constituents. Individual cyclic images or pairwise disjointness do not close it. The conditional joint-generation node is valid but its extra hypothesis is not automatic. Theorem5.2 is an intended target, not disproved by this counterexample. Independent review (REV-DESIGN-GlobalGaloisDeformationsPartII) adds that the failure also occurs under C1–C4. With k=F_p, if M* is semisimple with a simple constituent of multiplicity at least two, then for every k-basis the inertia tuple at w generates a proper F_p[Γ_F]-submodule of ∏_b M*_{e_b*}. The resulting subextension of L_w unramified at w lies in the finite maximal elementary abelian p-extension of K unramified outside T, so it repeats for two new primes. This happens for the F₄-valued examples of FKP19 Proposition 7.8 (adjoint multiplicities above one, FKP19 Remark 7.9), which satisfy C1–C4. The same diagonal-generator step recurs on p.18 of FKP22, where the fields K_{h(v)} and K_{η_b^{(v)}} are separated through ramification at t₀. So G1 is a gap in the proof of Theorem 5.2 within its hypotheses; Theorem 5.2 is not refuted, and for irreducible residual images FKP19 Theorem 6.11 has an independent proof.

**Direct consumers:** [GG2.2/dual-strong-disjointness](#dual-strong-disjointness); [GG2.3/density-selection](#density-selection); [GG2.3/doubling](#doubling); [GG2.3/congruence-field-disjointness](#congruence-field-disjointness); [GG2.3/controlled-tower](#controlled-tower); [GG2.6/main-geometric-lift](#main-geometric-lift).

<a id="g2"></a>

### G2 — precise small-dimensional finite-group input

Read Guralnick, Small representations are completely reducible, J.Algebra220(1999), DOI10.1006/jabr.1999.7963, TheoremA in an authorized primary text, and verify the exact hypotheses that supply both the H¹ claim used by FKP19 LemmaA.1 and the noninjective-projection splitting argument of FKP22 Corollary8.3. The primary Larsen–Pink normal-series theorem was read; it does not by itself supply this input. Publisher access did not provide the primary Guralnick text. Keep the requested IMAGE contract open.

**Direct consumers:** [GG2.1/irreducible-image-input](#irreducible-image-input); [GG2.1/cyclotomic-exclusion](#cyclotomic-exclusion); [GG2.9/two-block-automorphy](#two-block-automorphy).

<a id="g3"></a>

### G3 — audited positive-characteristic duality contract

The present ArithmeticGaloisDuality Selmer/PT/Greenberg–Wiles nodes and D7 are stated for number fields or their completions. Read an authorized primary proof of their global/local function-field versions at p different from the characteristic and verify all finite-coefficient, Sha and cardinality comparisons in the requests. The FKP papers invoke these versions but do not prove the entire duality theory; no matching implementation was found at the pinned/current searches. The cited NSW book is not a cleared local source, so no other copy was used.

**Direct consumers:** [GG2.2/sha-killing](#sha-killing); [GG2.2/one-prime-sequence](#one-prime-sequence); [GG2.4/coefficient-exactness](#coefficient-exactness); [GG2.4/relative-balance](#relative-balance); [GG2.6/compatible-finite-ramification](#compatible-finite-ramification); [GG2.9/function-field-automorphy](#function-field-automorphy); [GG2.9/two-block-automorphy](#two-block-automorphy); [GG2.9/direct-sum-automorphy](#direct-sum-automorphy).

<a id="g4"></a>

### G4 — coefficient convention in the polarized G_n criterion

The disconnected polarized group (GL_n×G_m)⋊C₂ has ker(multiplier) with Lie algebra gl_n, whereas Lie((G_n⁰)^der)=sl_n. Resolve the paper’s use of its adjoint module against the fixed-multiplier tangent convention, including the scalar direction and conjugation sign, before accepting the repaired A.10 statement from GlobalGaloisDeformations:G7. Constituentwise self-polarization is necessary, and the complex-conjugation action is x↦−A xᵗA⁻¹. This Appendix-A criterion is not used to establish Theorem5.2 in the body; its route is retained as a supplier obligation.

**Direct consumers:** [GG2.10/automorphy-lifting-application](#automorphy-lifting-application).

<a id="g5"></a>

### G5 — all-coefficient-place monodromy

The accepted supplier node ModularityAndLanglandsExtensions:ML.2/compatible-system-from-potential-automorphy asserts Zariski density of every member; its proof needs the exact reductive-subgroup classification with regular unipotent element and the primary independence-of-formal-character theorem needed in the final paragraph of Proposition9.1. BLGGT14 Lemma5.3.1 controls connected components/multiplicity and is not that theorem. Explain rank/irreducibility and the principal-GL₂ exception, and use the explicit two-Steinberg-place strengthening to cover every coefficient characteristic by an away-ℓ place. The compatible-system target is explicitly conditional on this contract; the original p-adic lift is already dense.

**Direct consumers:** [GG2.10/symplectic-compatible-system](#symplectic-compatible-system).

<a id="g6"></a>

### G6 — large-prime reductive-group inputs outside the upstream ReductiveGroups scope

Several arguments use structure theory of a split reductive group in large characteristic that the current Tau Ceti ReductiveGroups layers 7–8 do not state (those layers own Borel and parabolic subgroups, Levi decompositions, root data, Bruhat decomposition and the classification) and that no atlas roadmap plans. (i) For p≫_G 0, a P-equivariant isomorphism of varieties exp: Lie U→U restricting to the ascending central series and inducing P-equivariant group isomorphisms on its graded pieces, together with the finite adjoint expansion of Ad(exp X) (FKP22 Lemma A.1, Remark A.2, p.44, and proof of Lemma A.18, p.51). (ii) Centralizers in good characteristic: smoothness of centralizers of Lie-algebra elements, containment of the centralizer of a nonzero nilpotent element in a proper parabolic, connectedness and reductivity of centralizers of semisimple elements when p is not a torsion prime, root-subgroup description of a centralizer containing a maximal torus, centralizers of tori being Levi subgroups, and generation of C_G(t) by T, root subgroups and Weyl representatives (FKP19 Lemmas A.2 and A.5, pp.61–63; FKP22 proof of Lemma A.11, pp.48–49). (iii) The G-semisimplification of a finite image: Levi projection from a minimal parabolic containing it, uniqueness up to G(k)-conjugacy, behaviour under residue-field extension, and the parabolic adjoint filtration with graded pieces m⊕u⊕u⁻ (FKP22 Lemma 6.1, p.28, and proof of Lemma A.11, p.48). (iv) Uniform finite-field root position: a root vector outside any proper F_p-subspace of g^der, and toral elements in general position with a prescribed root value (FKP19 Proposition 5.9, p.29, and Lemma 5.13, p.38). These need an owner: an atlas continuation of ReductiveGroups, or lemma nodes here if the maintainer so decides. A Tau Ceti roadmap is not extended from the atlas, so the former requests to its layers 7–8 for these inputs are withdrawn.

**Direct consumers:** [GG2.1/irreducible-image-input](#irreducible-image-input); [GG2.1/cyclic-quotient-bound](#cyclic-quotient-bound); [GG2.1/central-jordan-holder](#central-jordan-holder); [GG2.1/cyclotomic-exclusion](#cyclotomic-exclusion); [GG2.1/abelian-root-subgroup](#abelian-root-subgroup); [GG2.1/block-criteria](#block-criteria); [GG2.1/maximal-parabolic-criteria](#maximal-parabolic-criteria); [GG2.1/borel-criteria](#borel-criteria); [GG2.2/spanning-classes](#spanning-classes); [GG2.2/prescribed-vector-classes](#prescribed-vector-classes); [GG2.3/controlled-tower](#controlled-tower); [GG2.5/simultaneous-root-position](#simultaneous-root-position); [GG2.7/levi-residual-lattice](#levi-residual-lattice); [GG2.7/remove-invariants](#remove-invariants).

The main source-independent check for G1 is worth spelling out. For trivial SL₂ residual image over Q, the three adjoint-dual basis directions are isomorphic cyclotomic lines. Fix two of them and identify each with F_p(κ̄). Both η-classes at w take the value 1 on τ_w. Their difference is therefore unramified at w, and hence is an old class in the finite group H¹(Γ_{Q,T},F_p(κ̄)). There are infinitely many allowed new primes and finitely many such differences. Equality of two differences yields η_1^(w)−η_2^(w)−η_1^(w′)+η_2^(w′)=0. Each of the four restrictions to Γ_K is nonzero by its own inertia value. A product Galois group F_p⁴ would admit no such nonzero linear relation, so the four fields fail strong disjointness. C4 holds by the prime-to-p order of Gal(Q(μ_p)/Q). This is why individual inertia generation cannot justify a product claim. The conditional joint-inertia theorem above records exactly where the missing hypothesis would enter.

The review adds a second, general form of the same failure. Take k=F_p and suppose M* is semisimple with a simple constituent W of multiplicity m≥2, as in the F₄-valued examples of FKP19 Proposition 7.8 (their adjoint multiplicities exceed one by FKP19 Remark 7.9) which satisfy C1–C4. For any k-basis, the t_b-ramification still makes Gal(L_w/K) the full product ∏_b M*_{e_b*}. A cyclic F_p[Γ_F]-module contains W at most dim W times, while that product contains it at least m·dim W times. So the conjugates of inertia at w generate a proper submodule, and L_w contains a nontrivial subextension E_w unramified at w. Each E_w is unramified outside T, hence lies in the finite maximal elementary abelian p-extension of K unramified outside T. Two new primes therefore share E_w, and L_w∩L_w′≠K. The same diagonal-generator step reappears on p.18 of FKP22, where the h-fields are separated from the η-fields by ramification at t₀. G1 is therefore a gap in the proof of Theorem 5.2 under its own hypotheses, although the theorem itself is not refuted and FKP19 Theorem 6.11 proves the irreducible case by another route.

For the stable-lattice target, the coefficient-extension assertion has a direct matrix verification. A group element with distinct residual characters has eigenvalue difference a unit. Its Hensel eigenprojectors are integral polynomials in that element, so every stable lattice splits into two eigenlattices. Normalize it to Λ_s=Oe₁⊕ϖ^sOe₂. Stability for every matrix g is equivalent to v(b_g)+s≥0 and v(c_g)−s≥0. Irreducibility bounds the resulting interval of integers at both ends. A finite coefficient extension multiplies both endpoints by its ramification index. After rescaling, each endpoint reduction is the scalar extension of the old nonsplit class; at every strictly interior vertex both off-diagonal reductions vanish. This supplies the extension argument beyond mere finiteness of a tree over one coefficient field.

For the compatible-system target, prescribe two Steinberg places with distinct residue characteristics. The global lifting theorem permits this finite set of local components, and Moret–Bailly permits the two corresponding finite collections of local opens after extension. Each coefficient prime ℓ then has a Steinberg place away from ℓ. This removes the exceptional-place issue from the local compatibility step; it does not supply the missing regular-unipotent classification or independence-of-formal-character theorem in G5.

## Ownership proposals

- Current upstream ReductiveGroupsPartII owns congruence subgroups and the lattice-class tree; it is a Tau Ceti roadmap and is not extended from the atlas. The compact analytic and Lazard inputs of FKP19 Appendix B have atlas owners in the direction of LocallyAnalyticDistributionsPartII ND.0 (p-valued groups), NoncommutativeAndEquivariantIwasawa NE.0 (completed group rings and Lazard cohomology) and AutomorphicFormsOnReductiveGroups AF.1a (Chevalley–Eilenberg cohomology). Keep GG2.4 only the lifting-specific uniform-bound application. Import upstream RG2.0 and RG2.2 as they stand, and request the Lazard and Lie-algebra inputs from ND.0, NE.0 and AF.1a. The large-prime reductive inputs of gap G6 need an atlas owner chosen by the maintainer, for instance a continuation of ReductiveGroups.
- Generic duality, fixed-μ local rings, ordinary components and square-zero deformation obstruction theory have existing owners; their present nodes need broader coefficient/characteristic or local-cocycle exports. Extend the existing owners by the precise requests. GG2.0–6 retain only the G-valued lifting datum, cyclic classes, doubling, relative images, auxiliary-prime annihilation and assembly; no existing Selmer carrier, local ring or ordinary functor is rebuilt.

## Sources and version discipline

- **FKP22** — Najmuddin Fakhruddin, Chandrashekhar Khare and Stefan Patrikis, *Lifting and automorphy of reducible mod p Galois representations over global fields*. Inventiones Mathematicae 228 (2022), 415–492; author arXiv:2008.12593v5 (15 October 2021). All page locators use the printed 1–58 pagination of v5. [Text read](https://arxiv.org/pdf/2008.12593v5). Accessed 2026-10-19. Read: Introduction and §§2–9; Appendices A–B, read for the proof dependency graph and corrected applications. SHA-256: `6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2`.
- **FKP19** — Najmuddin Fakhruddin, Chandrashekhar Khare and Stefan Patrikis, *Relative deformation theory, relative Selmer groups, and lifting irreducible Galois representations*. Duke Mathematical Journal 170 (2021); arXiv:1904.02374v5 (15 October 2021). Page locators use printed 1–66 pagination of v5. [Text read](https://arxiv.org/pdf/1904.02374v5). Accessed 2026-10-19. Read: Definitions 1.2, 1.4–1.5 and Assumption 2.1; §3; Proposition 4.7 and Lemma 4.9; Notation 5.1 and Lemma 5.13; §6; Appendices A–B. SHA-256: `9ec2865cd2aad92fad7d1f14c018222a52c0d1d6f32b6c2b3c426423e2708efa`.
- **LP11** — Michael Larsen and Richard Pink, *Finite subgroups of algebraic groups*. Journal of the American Mathematical Society 24 (2011), 1105–1158, author offprint. [Text read](https://people.math.ethz.ch/~pinkri/ftp/LP5.pdf). Accessed 2026-10-19. Read: Theorem 0.2, p.1106; proof and construction of the normal series, §12, p.1156. SHA-256: `47562746d32316b878e70a76409008b3a9061ef692c3953d921fec33ce62b967`.
- **Lazard65** — Michel Lazard, *Groupes analytiques p-adiques*. Publications Mathématiques de l’IHÉS 26 (1965), 5–219; published scan. [Text read](https://www.numdam.org/item/PMIHES_1965__26__5_0.pdf). Accessed 2026-10-19. Read: III Proposition 3.1.3 pp.91–92 and Theorem 3.1.7.4 p.94; V §§2.2.2–2.2.3 pp.165–166; V Theorem 2.4.10 and proof setup pp.178–179. SHA-256: `b0b50cf55528fd4abb94f9e1de10b23f0711c0dd804682a9853b70b3b378f380`.
- **BC14** — Joël Bellaïche and Gaëtan Chenevier, *Sous-groupes de GL₂ et arbres*. Journal of Algebra 410 (2014), 501–525; author preprint, printed pp.1–28. [Text read](https://people.brandeis.edu/~jbellaic/preprint/clos2.pdf). Accessed 2026-10-19. Read: Lemma 10 and Proposition 11 pp.9–10; Definitions 29–30 p.16 and Proposition 32 with proof p.17. SHA-256: `c34b98c0bfaafe2a51be4cc301c3a47b96e8dcc7456179b075da70159a0f1e14`.
- **Ribet10** — Kenneth Ribet, *Mod p representations of Galois groups arising from modular forms*. Clay Mathematics Institute summer school, Hawaii 2010; author notes. [Text read](https://people.brandeis.edu/~jbellaic/RibetHawaii3.pdf). Accessed 2026-10-19. Read: §1.2: Lemmas 1.3–1.5 and Proposition 1.4 pp.6–7; Exercises 1.5–1.9 p.8. SHA-256: `5e23444d4d3f4ee9fd06e9254bdee496e648ddf6b359120781d26cebf52beafe`.
- **ANT20** — Patrick B. Allen, James Newton and Jack A. Thorne, *Automorphy lifting for residually reducible l-adic Galois representations, II*. arXiv:1912.11269v2, 13 August 2020; printed pp.1–21. [Text read](https://arxiv.org/pdf/1912.11269v2). Accessed 2026-10-19. Read: Theorem 1.1 pp.1–2, all eight hypotheses; notation and ordinarity pp.3–4. SHA-256: `077a344352c80389ce75d5c61a69fba90413303aca911a616fe46dbeb8514bfa`.
- **BLGGT14** — Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, *Potential automorphy and change of weight*. Annals of Mathematics 179 (2014), 501–609; published PDF. [Text read](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf). Accessed 2026-10-19. Read: Proposition 3.1.1 pp.545–546; Theorem 3.1.2 and proof pp.546–549; Lemma 5.3.1 with proof pp.580–581; Theorem 5.5.1 and proof pp.590–593. SHA-256: `c9d6c7107bcde7fb26f9388abea5209f28457076bae59d70ccb6c34bbe1d621b`.
- **BLGHT11** — Thomas Barnet-Lamb, David Geraghty, Michael Harris and Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*. Publications of the Research Institute for Mathematical Sciences 47 (2011), 29–98; author preprint pagination. [Text read](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf). Accessed 2026-10-19. Read: Lemma 5.1(2), pp.34–35 of the author preprint; its regular-unipotent and Frobenius conclusions. SHA-256: `225cab84210837ca6130c1c76a5eababeffeaa8d1594b6267e853ce0ae8eabb3`.
- **Pan22** — Lue Pan, *The Fontaine–Mazur conjecture in the residually reducible case*. Journal of the American Mathematical Society 35 (2022); arXiv:1901.07166v2 (3 September 2021). [Text read](https://arxiv.org/pdf/1901.07166v2). Accessed 2026-10-19. Read: Introduction, Theorems 1.0.2 and 1.0.4 and the following remarks, pp.2–5; table of contents for §§5–7. SHA-256: `590171129d28a65749cf92b1f6099dbacaa90cc6698828f0a4dfd3da943f4824`.

FKP22 findings below concern **arXiv v5**, not an assertion about uncollated passages of the published version. The publisher landing page and publicly supplied Appendix material were inspected; the full-PDF endpoint supplied an access page and the alternative author-manuscript endpoint timed out. No complete version-of-record collation is claimed. The public version history and correction listings were searched; no newer correction was located. The first 44 findings restate the previously reviewed paper extraction in this roadmap’s words and apply its corrections; E45 and E46 require independent verification. The packet preserves the original finding identifiers as provenance, without treating that earlier review as a review of this plan.

### E1: misprint — Proof of Lemma 7.1, p. 32 (arXiv v5)

**Assertion at issue:** The proof compares a residual character with an unbarred cyclotomic inverse.

**Correction:** Use χ̄≠κ̄⁻¹ throughout the residual calculation.

**Reason:** The two characters being compared must have the same finite characteristic.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.32: the first paragraph of the proof of Lemma 7.1 compares k(χ̄κ̄) with an unbarred κ⁻¹; the hypothesis is χ̄≠κ̄⁻¹.

### E2: misprint — Proof of Lemma 7.1, p. 32 (arXiv v5)

**Assertion at issue:** One inverse character in the complex-conjugation argument is on the wrong factor.

**Correction:** The even characters at issue are χ̄⁻¹κ̄ and χ̄κ̄.

**Reason:** Both have value +1 at complex conjugation, whereas χ̄^σ has value −1.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.32: the list χ̄⁻¹κ̄, κ̄, χ̄κ̄ is followed by a sentence naming χ̄κ̄⁻¹; both are even, so only the label is wrong.

### E3: misprint — Appendix A, before Lemma A.3, p. 44 (arXiv v5)

**Assertion at issue:** The range for successive central-series factors misses the first index and exceeds the last.

**Correction:** Use the factors Σ_{i+1}/Σ_i for 0≤i<n.

**Reason:** There is no Σ_{n+1} in a series ending at Σ_n.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.44: maximal-chain factors are indexed i=1,…,n although the chain is Σ₀⊊⋯⊊Σ_n.

### E4: misprint — Lemma A.10(1), p. 47 (arXiv v5)

**Assertion at issue:** The polarized criterion uses the preceding lemma’s number of blocks.

**Correction:** Index its absolutely irreducible constituents by 1≤i≤s.

**Reason:** This lemma decomposes its module into s constituents.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.47: Lemma A.10(1) runs to r while r̄ decomposes into s constituents and (2),(3) use s.

### E5: misprint — Definition A.13, p. 49, and Example A.17, p. 50 (arXiv v5)

**Assertion at issue:** One side of the character-separation restriction has an undefined Galois-group subscript.

**Correction:** Restrict both sides to Γ_{F′}.

**Reason:** The comparison is on the chosen extension F′/F of degree at most N.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.49 (Definition A.13) and p.50 (Example A.17): the right-hand restriction is written to Γ′_F.

### E6: misprint — Proof of Lemma B.4, p. 55 (arXiv v5)

**Assertion at issue:** An ordinary dimension display changes its H² coefficient from the Borel to the whole group.

**Correction:** Keep H² with coefficients in the Borel Lie algebra in the simplification.

**Reason:** The algebraic cancellation changes the toral dimension term, not the obstruction module.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.55: the last display replaces h²(Γ_{F_v}, r(b₀)) by h²(Γ_{F_v}, r(g₀)) after the cancellation.

### E7: misprint — Proof of Lemma B.4, p. 55 (arXiv v5)

**Assertion at issue:** The ordinary proof locates y in its own completed local spectrum and has mismatched parentheses.

**Correction:** Choose y in the generic-fiber spectrum and then complete the ring at y.

**Reason:** The completion is defined after the point is chosen.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.55: “closed point y ∈ Spec(R^△[1/p])^∧_y)” completes at y before y is chosen, with unbalanced parentheses.

### E8: error — §1.1, discussion of Theorem A, p. 3 (arXiv v5)

**Assertion at issue:** The introductory comparison claims multiplicity freeness after restriction to F_p.

**Correction:** State the valid k-multiplicity statement, without an F_p-multiplicity consequence.

**Reason:** A trivial k-line has [k:F_p] trivial prime-field factors; k=F_25 already contradicts the stronger assertion.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.3: the claim that (1) and (3) of Theorem A make ad(ρ̄) multiplicity free over F_p fails for k≠F_p, since the trivial k-constituent restricts to [k:F_p] trivial F_p-constituents.

### E9: error — §1.1, discussion of Theorem B, p. 3 (arXiv v5)

**Assertion at issue:** The introductory cohomology comparison uses a full adjoint with a second Tate twist and omits nonsplitting.

**Correction:** Use the derived adjoint dual with its single built-in twist, and the nonsplit hypothesis of Lemma7.1.

**Reason:** For a split κ̄⊕1 the derived dual has an invariant line. The split case of Theorem7.4 needs its separate argument.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.3: for split ρ̄=κ̄⊕1 (allowed in Theorem B) the derived dual adjoint contains the trivial character, so χ̄≠κ̄⁻¹ alone does not give the stated vanishing; Lemma 7.1 assumes nonsplitness.

### E10: gap — §3, Proposition 3.6, statement and proof, pp. 12–14 (arXiv v5)

**Assertion at issue:** Proposition3.6 places all root and prime choices before all Frobenius prescriptions.

**Correction:** Use the inductive quantifier order: the i-th root/prime data may depend on the earlier Frobenius prescriptions.

**Reason:** The proof chooses a new detecting dual class after the preceding prescription has already been fixed.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read pp.12–14: the statement chooses all (T_i,α_i,q_i) before the tuple g_{L/K,i}, while the inductive proof chooses ψ_i, hence (T_i,α_i), after v_1,…,v_{i−1}, which depend on the earlier g’s. Theorem 4.4 only needs g_i to depend on (T_i,α_i,q_i), so the inductive order suffices.

### E11: gap — §3, proof of Proposition 3.6, p. 13 and the bullet on p. 14 (arXiv v5)

**Assertion at issue:** The norm-coset argument checks nonzero local dual restriction instead of its stronger nonorthogonality requirement.

**Correction:** Check the coset is not contained in the annihilator of F_p X, for every allowed nontrivial norm class.

**Reason:** If that coset and its difference space were both in the annihilator, the full cocycle image would be there, contrary to the chosen detecting root.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read pp.13–14: when K_{ψ₁}=K(μ_{p^{D+1}}) the norm class fixes ψ₁(σ_v) in a coset of a codimension-one subgroup; the text then asserts ψ₁(σ_v)∉(F_pX)^⊥. A nontrivial coset contained in the subspace (F_pX)^⊥ would force all of ψ₁(Γ_K) into it, so the claim holds after this check.

### E12: gap — §3, before Proposition 3.8, p. 16 (arXiv v5)

**Assertion at issue:** The mod-ϖ² initialization invokes vanishing Sha² without stating local liftability.

**Correction:** Assume actual fixed-μ lifts at the original places, as the main lifting theorem does.

**Reason:** Sha² controls locally trivial obstructions only.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.16: the mod-ϖ² lift is produced from vanishing of Sha² alone; local obstructions at the places of S need the local lifts, which §3 does not assume (they are assumed in Theorems 4.4 and 5.2).

### E13: error — §3, Proposition 3.8, p. 16 (arXiv v5)

**Assertion at issue:** The doubling statement equates the two new inertia coefficients.

**Correction:** The coefficients are −X and 2X after the stated cohomology modification; only nonvanishing is needed.

**Reason:** The modifying class has coefficients −1 and 2 at the two disjoint new primes. They agree only at p=3.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Verified on pp.16–17: with h=h_old−Σh(v_n)+2Σh(v′_n), the inertia values are −X_n at v_n and 2X_n at v′_n after the pigeonhole step, not one common X_n as the statement of Proposition 3.8 says.

### E14: misprint — §3, proof of Proposition 3.8, global duality display, p. 18 (arXiv v5)

**Assertion at issue:** The two new local terms in the reciprocity display have the same sign.

**Correction:** Use opposite signs for tame/unramified cross terms, with the overall sign fixed by the reciprocity convention.

**Reason:** Degree-one cup products anticommute at odd p; the affine dependence used in the proof survives.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.18: the reciprocity display puts the same sign on the two new-prime terms; with FKP19 Lemma 3.9 (p.19) the unramified/tame cross terms have opposite signs, and the affine dependence used survives.

### E15: misprint — §§1–3, pp. 6, 10, 12, 13, 14, 15, 18 (arXiv v5)

**Assertion at issue:** Several cyclic-module and marked-prime phrases have incompatible index or coefficient conventions.

**Correction:** Use T excluding all marked primes in the preparatory lemma, stabilize dual quotients of cyclic modules, and retain the fixed multiplier in the local representing functor.

**Reason:** A dual cyclic module need not be cyclic; the chosen new prime must be outside the set to which the one-prime lemma is applied. Other affected indices are typographical.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Spot-checked pp.12–15: θ_b^{(v)} is constructed for T without all marked primes, and Lemma 3.4(3) stabilizes Sha for duals of cyclic submodules of M*; the remaining items are index slips.

### E16: gap — §5, proof of Theorem 5.2, p. 24 (arXiv v5)

**Assertion at issue:** The disconnected-group argument applies residual invariant vanishing over the component-splitting field.

**Correction:** Apply the analytic bound to the inverse image of the full Γ_F adjoint image and perform inflation over F.

**Reason:** C1 gives Γ_F-invariant vanishing, which need not hold after restriction to the component-splitting field.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.24: FKP19 Corollary B.2 is applied to the preimage of (Ad∘ρ̄)(Γ_{F̃}), whose residual invariants need not vanish; C1 gives vanishing for the full Γ_F image.

### E17: gap — §5, proof of Proposition 5.4, p. 26 (arXiv v5)

**Assertion at issue:** The detection proof chooses arbitrary nonzero primal and dual values before selecting one root.

**Correction:** Choose both values with nonzero projection to the same simple factor, using the union of two proper projection kernels.

**Reason:** A root in one factor cannot detect a primal value in a disjoint factor and a dual value in another.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.26: γ₂ is chosen with φ(γ₂),ψ̄(γ₂) nonzero, and one root is then sought; when g^der has several simple factors permuted by π₀(G) both values must project nontrivially to one factor, which Γ_F-stability of the images and transitivity allow.

### E18: gap — §6, proof of Lemma 6.1, p. 28 (arXiv v5)

**Assertion at issue:** The lattice-change proof evaluates an adjoint cocharacter as though it always lifts to G.

**Correction:** Multiply by a positive integer so the cocharacter lifts, increasing the ramification bound, or extend coefficients to adjoin the needed uniformizer root.

**Reason:** For SL₂ the adjoint element represented by diag(ϖ′,1) requires a square root for an SL₂ lift.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read pp.27–28: η is a cocharacter of the adjoint torus and g=η(ϖ′) is used as an element of G(K′); for SL₂ this needs a square root of ϖ′.

### E19: gap — §6, Lemma 6.4 and proofs of Lemma 6.5 and Corollary 6.6, pp. 29–30 (arXiv v5)

**Assertion at issue:** The trivial-prime local construction initially has trivial multiplier.

**Correction:** Multiply by the unique suitable pro-p central correction and invoke the local lemma also at the newly added places.

**Reason:** The required unramified multiplier need not have Frobenius value one; the prime-to-p central isogeny permits the correction.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read pp.29–30: the lift of Lemma 6.4 lies in the derived group, so its multiplier is trivial, while Lemma 6.5 and Corollary 6.6 need lifts of type μ at the new places.

### E20: gap — §6, proofs of Lemma 6.5 and Corollary 6.6, pp. 29–30 (arXiv v5)

**Assertion at issue:** The invariant-removal argument passes vanishing through semisimplification without proving containment of the new unipotent image.

**Correction:** Show A(k) is still in the image after adjoining μ_p, and compare the actual joint residual/cyclotomic images.

**Reason:** Restriction has prime-to-p index, so it cannot remove the added p-primary subgroup. Equal semisimplifications alone do not determine H⁰.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.30: H⁰(ρ̄′(g^der)*)=0 is deduced from equal semisimplifications. The valid argument is that im(ρ̄′,κ̄) contains A(k) and hence im(ρ̄,κ̄), so the invariants inject.

### E21: error — §6, Corollary 6.6, p. 30 (arXiv v5)

**Assertion at issue:** The Levi-valued geometric corollary omits oddness over number fields.

**Correction:** Assume total reality and oddness in the number-field case.

**Reason:** The geometric theorem needs these conditions. At real places the added p-primary extension is conjugate to its Levi projection since p is odd.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.30: Corollary 6.6 applies Theorem 5.2, which needs F totally real and ρ̄′ odd over number fields, but states neither.

### E22: gap — §6, Corollary 6.6, second alternative, p. 30 (arXiv v5)

**Assertion at issue:** The second Levi-valued alternative uses maximal-parabolic character separation without its Levi irreducibility hypothesis.

**Correction:** Require a maximal parabolic and absolute M-irreducibility for that alternative.

**Reason:** Having only central invariant vectors does not imply Levi irreducibility; upper-triangular GL₂ blocks with distinct characters give counterexamples.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.30: the second alternative invokes Lemma A.14, whose hypotheses include absolute M-irreducibility of ρ̄_M; Corollary 6.6 does not state it.

### E23: error — §6, Remark 6.7, second bullet, p. 31 (arXiv v5)

**Assertion at issue:** The torus example infers absence of trivial root characters from absence of a proper subtorus containing the image.

**Correction:** Require β∘ρ̄≠1 for every root β; the subtorus test suffices only when the roots are primitive.

**Reason:** In SL₂ a quadratic diagonal character has central image {±1} and a trivial root character, despite not lying in a proper subtorus.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Verified p.31: ρ̄=diag(χ,χ⁻¹) in SL₂ with χ quadratic has image {±1}, not in a proper subtorus, but α∘ρ̄=χ²=1, so H⁰(sl₂)=sl₂.

### E24: error — §6, Example 6.8, dihedral case, p. 31 (arXiv v5)

**Assertion at issue:** The dihedral GSp₄ example omits δ-dependent twisted invariant exclusions.

**Correction:** Exclude δ for which Sym²r⊗δ⁻¹κ̄ or its opposite twisted term has invariants.

**Reason:** For dihedral r a symmetric-square character can produce an invariant at the indicated similitude, including odd choices of δ.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.31: the dihedral case bounds δ for the untwisted invariants only; with u⁺=Sym²(ρ̄_f)⊗δ⁻¹ (as the example itself writes) the twisted conditions for C2 also depend on δ.

### E25: error — §6, Example 6.8, p. 31 (inherited from Example A.16, p. 50) (arXiv v5)

**Assertion at issue:** The GSp₄ example drops the similitude from its character-separation condition.

**Correction:** Use χ=κ̄^{r−1}δ⁻¹ and require ord(χ^aκ̄)≥5 for every |a|≤2 in the F_p-valued case.

**Reason:** The adjoint-Levi quotient character is det(r)δ⁻¹ and must be trivial on the GSp center.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.31 and p.50: the condition uses κ̄^{a(r−1)+1}, i.e. χ=det ρ̄_f, while the adjoint-Levi character trivial on the GSp center is det(ρ̄_f)δ⁻¹.

### E26: error — §6, Example 6.8, p. 31 (arXiv v5)

**Assertion at issue:** The GSp₄ example excludes too few weights and conflates alternative separation conditions.

**Correction:** Require w outside {0,r−1,2r−2} and use the property-D alternative to obtain C3,C4.

**Reason:** The weights 0,r−1,w,w−r+1 must be distinct. The two A.14 hypotheses are alternatives, not simultaneous consequences.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.31: “a de Rham character of nonzero weight” allows w=r−1 or w=2r−2, where two of 0,r−1,w,w−r+1 coincide.

### E27: misprint — §§4–6, pp. 19, 23, 24, 26, 27, 28 (arXiv v5)

**Assertion at issue:** Some lifting and detection displays admit a zero quotient or have inconsistent level/module notation.

**Correction:** Exclude zero in C3, test every root at level M+1, use the residual adjoint H¹, preserve μ, and use primes trivial for both coefficient modules in the extension lemma.

**Reason:** A zero quotient would make the exclusion impossible. The other level and coefficient corrections restore the modules actually used in the proofs.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Spot-checked pp.19–28: C3 must exclude W=0, and the extension lemma needs primes trivial for W as well as W′ (Lemma 6.2 identifies H¹(Γ_{F_v},W) with homomorphisms).

### E28: gap — §7, proof of Theorem 7.4, p. 36 (arXiv v5)

**Assertion at issue:** The determinant adjustment is treated as a globally inflatable local character without its normalization.

**Correction:** Choose a finite p-power-order correction with value one on Art(p); normalize crystalline determinants by an unramified square-root twist.

**Reason:** A global character unramified outside p is trivial on this local uniformizer under the cyclotomic quotient. Infinite-order corrections would also spoil the required determinant type.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.36: ω is only potentially unramified with trivial reduction; a character of Γ_Qp inflates to one of Γ_Q unramified outside p only if its value on Art(p) is 1, which an unramified square-root twist of the local lift arranges.

### E29: misprint — §§7–8, pp. 33, 35, 36, 37, 39 (arXiv v5)

**Assertion at issue:** The ordinary/modularity discussion has several domain and residual-character slips and overstates one alternative argument.

**Correction:** Use the local lift in the ordinary definition, the enlarged global ramification set for the modular Galois representation, and κ̄⁻¹ in residual comparisons. The semisimple alternative proves modularity alone.

**Reason:** The local ordinary carrier, Galois domain and weight/level assertions are different data; semisimple modularity does not give the sharper two conclusions.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Spot-checked pp.33–37: the alternative proof of the split case via Lemma 7.3 and Lemma 6.1 gives modularity but not the weight-r and level-prime-to-p refinements.

### E30: error — §8, Remark 8.2, p. 38 (arXiv v5)

**Assertion at issue:** The function-field remark makes the prime bound uniform in the base field from absolute irreducibility alone.

**Correction:** Retain cyclotomic-restriction irreducibility and a cyclotomic-degree lower bound, or allow the bound to depend on F.

**Reason:** Over F_q(t) with q≡−1 mod p an induced irreducible representation can have κ̄ in its adjoint, violating C2 for unbounded p as q varies.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Verified: for F=F_q(t) with q≡−1 mod p, κ̄ is the quadratic constant-field character, and ρ̄=Ind ψ from F_{q²}(t) has κ̄ in ad⁰ρ̄, hence a trivial line in M*; C2 fails for an absolutely irreducible ρ̄, for every p.

### E31: gap — §8, proof of Corollary 8.3, p. 39 (arXiv v5)

**Assertion at issue:** The two-block proof asserts noninjectivity of the Levi-image projection without the needed splitting argument.

**Correction:** If projection were injective, the image has no normal p-subgroup; apply the precise small-representation complete-reducibility theorem to force splitting.

**Reason:** The maximal-parabolic criterion requires noninjectivity, not just nonsplitting stated without a finite-image argument.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.39: noninjectivity of im ρ̄→M(k) is asserted from nonsplitness; an injective projection gives an extension of ρ̄₂ by ρ̄₁ over the Levi image, which splits only via an H¹-vanishing result such as Gur99 (gap G2).

### E32: gap — §9, proof of Proposition 9.1, p. 42 (arXiv v5)

**Assertion at issue:** From GSp_{2n}-irreducibility of ρ̄|Γ_{F(ζ_p)}, the proof infers that every GL_{2n}-constituent of ρ̄ is self-dual and stays absolutely irreducible on Γ_{F(ζ_p)}.

**Correction:** Assume explicitly that every GL constituent stays absolutely irreducible after restriction to Γ_{F(ζ_p)}.

**Reason:** GSp-irreducibility over Γ_{F(ζ_p)} allows a Γ_F-constituent induced from the quadratic subextension of F(ζ_p)/F to split there into two distinct symplectic pieces; ANT20 requires the constituentwise condition. (Description corrected by REV-DESIGN-GlobalGaloisDeformationsPartII; the earlier text attributed the inference to primitivity.)

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.42 (corrected description of the assertion): the source infers that each GL_{2n}-constituent stays absolutely irreducible on Γ_{F(ζ_p)} from GSp_{2n}-irreducibility of ρ̄|Γ_{F(ζ_p)}. A constituent induced from the quadratic subextension of F(ζ_p)/F splits there into two distinct symplectic pieces, keeping ρ̄|Γ_{F(ζ_p)} GSp-irreducible.

### E33: misprint — §9, definition of ξ-ordinary, p. 41, and proof of Proposition 9.1, pp. 41–42 (arXiv v5)

**Assertion at issue:** The ordinary-weight calculation assigns the opposite sign to the algebraic contribution.

**Correction:** With HT(κ)=−1 use ξ_{τ,n−i+1}+i−1, and replace n by 2n in the symplectic case.

**Reason:** The ordinary characters are the corresponding negative powers of κ and these weights increase with i. With weight 0, the printed signs would give similitude κ^{2n−1} instead of κ^{1−2n}.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.41: with HT(κ)=−1 and the weight-0 π used in the proof, the printed weights −(ξ_{τ,n−i+1}+i−1) are 0,−1,…,1−2n, whose symplectic pairing would require similitude κ^{2n−1}, not the κ^{1−2n} of Proposition 9.1.

### E34: misprint — §9, pp. 40–43 (arXiv v5)

**Assertion at issue:** The symplectic proof has mismatched dimension, field and local-place labels, and calls ANT potential automorphy.

**Correction:** Use the 2n-dimensional weight, restriction to Γ_{L′}, BLGGT14 Theorem3.1.2, and Steinberg at every w|v₀; ANT20 is the subsequent automorphy-lifting step.

**Reason:** The potential-automorphy construction and the ordinary lifting theorem play different roles. The BLGGT numbering has now been checked directly.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read pp.40–43: p.40 calls ANT20 a potential automorphy theorem (it is automorphy lifting), p.42 writes “[BLGGT14, Proposition 3.1.2]” for Theorem 3.1.2 and π_{v₀} for the places above v₀.

### E35: gap — Appendix A, proof of Lemma A.4, p. 44 (arXiv v5)

**Assertion at issue:** The p-kernel filtration proof replaces the group whose factors it is trying to control.

**Correction:** Filter the original Σ by its intersections with U_j(k).

**Reason:** The successive intersection factors embed equivariantly in the Lie filtration; replacing Σ by a larger kernel does not establish that claim for the original factors.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.44: the proof replaces Γ by π⁻¹(Γ̄) and Σ by U(k); filtering the original Σ by Σ∩U_i(k) gives a central Γ-series whose factors embed in u_{i+1}/u_i, which with Lemma A.3 proves the claim.

### E36: error — Appendix A.1.1, Lemma A.9, p. 46 (arXiv v5)

**Assertion at issue:** The block lemma places all invariants in a chosen diagonal Levi subspace.

**Correction:** State an injective Levi projection of invariants into the Levi center; literal containment holds for a Levi-valued representation.

**Reason:** Unipotently conjugating a diagonal representation conjugates its invariant matrices out of the fixed diagonal subspace.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Verified: conjugating a Levi-valued ρ̄′ by u∈U(k) keeps hypotheses (1)–(3) of Lemma A.9 but moves H⁰ to u·(z(M)∩g^der)·u⁻¹, outside z(M); only the Levi projection of the invariants lies in z(M).

### E37: error — Appendix A.1.1, Lemma A.9(3) and its proof, p. 47 (arXiv v5)

**Assertion at issue:** The block lemma imposes separate pairwise character-field degree bounds.

**Correction:** Impose the lower bound after intersecting F(ζ_p) with the compositum of all determinant-ratio character fields.

**Reason:** Several separately disjoint character fields can jointly generate the cyclotomic field. A three-character example then has overlapping primal/dual constituents.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Verified by an explicit example: three one-dimensional blocks with χ₁₂=ψ, χ₂₃=κ̄ψ (ψ of order p−1 independent of κ̄) satisfy (1),(2) and the pairwise bounds (3) with degree p−1, yet χ₂₃=κ̄χ₁₂ makes C3 fail.

### E38: error — Appendix A.1.2, proof of Lemma A.10, p. 47 (arXiv v5)

**Assertion at issue:** The polarized lemma ignores the transpose/sign action of conjugation and permits constituents to be paired in different blocks.

**Correction:** Use x↦−A xᵗA⁻¹ and require every irreducible constituent to be polarized individually.

**Reason:** If conjugation swaps two character blocks, the difference of their diagonal scalars can be invariant. The body does not use A.10.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.47: complex conjugation acts on gl_n by x↦−A xᵗA⁻¹ for ρ̄(c)=(A,·)j, and if it pairs two blocks the element c(I_i−I_j) is invariant, so C1 fails.

### E39: misprint — Appendix A.2, Lemma A.11(1)(a), (b), p. 47 (arXiv v5)

**Assertion at issue:** The unequal-block test is written as a parity alternative.

**Correction:** Use unequal dimensions, or the stated untwisted/twisted nonisomorphism if dimensions agree.

**Reason:** Hom between nonisomorphic absolutely irreducible representations vanishes; unequal dimensions already guarantee nonisomorphism, regardless of parity.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.47 and p.39: condition (a) reads “n odd, or n′=n″ and …”, but Corollary 8.3 applies it to all n₁≠n₂ (e.g. (1,3)); unequal dimensions suffice because Hom between absolutely irreducible representations of different dimensions vanishes.

### E40: error — Appendix A.2, Lemma A.11(2) and item (ii) of its proof, pp. 47–48; Example A.16, p. 50 (arXiv v5)

**Assertion at issue:** The symplectic parabolic action omits the similitude factor.

**Correction:** Use u=Sym²(std)⊗δ⁻¹, exclude forms with multipliers δ and δκ̄⁻¹, and use χ=det(r)δ⁻¹ in GSp₄.

**Reason:** A scalar Levi element diag(I,δI) acts on u by δ⁻¹, so the action cannot factor through the GL block alone.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Verified: conjugation by diag(A,νA^{−T}) on the Siegel radical is X↦ν⁻¹AXAᵗ, so u=Sym²(std)⊗ν⁻¹; Example 6.8 itself writes Sym²(ρ̄_f)⊗δ⁻¹.

### E41: error — Appendix A.2, Example A.17, p. 50 (arXiv v5)

**Assertion at issue:** The equal-block property-D example lists only nonzero exponent pairs.

**Correction:** Include all pairs m₁,m₂∈{−1,0,1} and the pure cyclotomic comparison.

**Reason:** Taking n=1 and a cyclotomic block ratio can pass the displayed nonzero comparisons while failing a zero-exponent test and C3.

**Reach:** a stated result. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Verified: n=1, χ=κ̄ (κ̄ of large order) passes the displayed comparisons of Example A.17, fails the m₁=1, m₂=0 test of Definition A.13, and C3 fails since κ̄ occurs in both M and M*.

### E42: gap — Appendix A, proofs of Lemmas A.5, A.14 and A.18, pp. 45, 50, 51 (arXiv v5)

**Assertion at issue:** Several Appendix-A arguments retain a minimal parabolic after field extension, enlarge an intermediate field too far, or test only quotients.

**Correction:** Choose the minimal parabolic again; use F(Ad r_M,μ_p) for the intermediate field; test all relevant subquotients in the Borel argument.

**Reason:** Minimality need not persist under extension, the larger field need not lie in the adjoint splitting field, and the central-series lemma gives subquotients.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read pp.45, 49–51: the minimal parabolic is taken before enlarging k; L′=F(ρ̄_M,μ_p) need not lie in K′=F(ρ̄(g^der),κ̄), so Gal(K′/L′) is undefined; the Borel argument needs subquotients.

### E43: gap — Appendix B, proof of Lemma B.3, p. 53 (arXiv v5)

**Assertion at issue:** The closed ordinary-condition ideal tests roots but leaves the central torus character unconstrained.

**Correction:** Add equations on a basis of X*(T) fixing the full torus character.

**Reason:** Roots see only the adjoint torus. For G_m there are no roots at all, so root equations cannot specify the desired character.

**Reach:** the proof. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Read p.53: the ideal is generated by c_{β,σ}=β(t_σ)−β(χ_λ(σ)) for positive roots only, which does not fix the central part of the torus character (no roots at all for G_m).

### E44: misprint — Appendices A and B and the references, pp. 44–58 (arXiv v5)

**Assertion at issue:** Appendix displays and bibliography have sign, symbol, completion and reference slips.

**Correction:** Use the negative determinant-ratio exponent, cite FKP19 LemmaA.6, and keep the central unipotent subgroup, conjugated torus points and completed local rings consistently named.

**Reason:** The determinant ratio must kill the common scalar center. The remaining corrections follow from the surrounding definitions and the verified FKP19 labels.

**Reach:** nothing. **Correction search:** Prior extraction’s documented Crossref/arXiv/publisher checks, supplemented by the 2026-10-19 check. No published correction located.

**Independent review:** confirmed. Spot-checked: p.47 writes x_i^{n_j}x_j^{n_i} for the ratio map, and pp.49–50 cite “[FKP19, Corollary A.6]”, which is Lemma A.6 there.

### E45: error — FKP22 arXiv:2008.12593v5, Lemma3.7 and proof pp.15–16; use in Proposition3.8 pp.17–19

**Assertion at issue:** The source claims strong linear disjointness for all marked dual fields as both the prime w and basis index b vary, under Assumption3.1.

**Correction:** Replace the unconditional claim by the joint-inertia conditional criterion and prove the weaker quantitative input actually needed for doubling under its full hypotheses; this replacement is gap G1.

**Reason:** FKP22 v5 Lemma3.7 pp.15–16 is false under its stated Assumption3.1: for F=Q, trivial SL₂ residual image and k=F_p, p≥5, M*=F_p(κ̄)³. For two basis lines, identify their scalar cocycles and put ζ_w=η_1^(w)−η_2^(w). Their equal inertia at w cancels, so ζ_w lies in the finite group H¹(Γ_{Q,T},F_p(κ̄)). Infinitely many w force ζ_w=ζ_w′ for distinct w,w′. This gives a nontrivial relation among four degree-p cocycle fields, contradicting strong disjointness. Restriction to Γ_K preserves the relation and individual nonvanishing; H¹(Gal(K/Q),F_p(κ̄))=0 as its order is p−1. C4 holds, but C1 fails. To close the main proof, establish the quantitative conditional-success/finite-quotient Chebotarev input actually needed by Proposition3.8 under C1,C3,C4, using a new construction or a proof allowing repeated constituents. Individual cyclic images or pairwise disjointness do not close it. The conditional joint-generation node is valid but its extra hypothesis is not automatic. Theorem5.2 is an intended target, not disproved by this counterexample. Review addition: the lemma also fails under C1–C4 when M* is semisimple with a repeated simple constituent, for every k-basis (FKP19 Proposition 7.8 and Remark 7.9 give such residual images), so G1 concerns the proof of Theorem 5.2 within its hypotheses.

**Reach:** a stated result. **Correction search:** The arXiv history, publisher article page and public correction searches on 2026-10-19 yielded no correction; findings remain scoped to the preprint.

**Independent review:** confirmed. Verified the counterexample: θ_1^{(w)}−θ_2^{(w)} is unramified at w and lies in the finite H¹(Γ_{Q,T},F_p(κ̄)), and H¹(Gal(Q(μ_p)/Q),F_p(κ̄))=0. The flaw is the second paragraph of the proof: a nonzero quotient of ∏_b Gal(K_{η_b^{(v)}}/K) can kill the diagonal image of τ_v. The failure also occurs under C1–C4 when M* has a repeated simple constituent (FKP19 Proposition 7.8 examples; see G1).

### E46: gap — FKP22 arXiv:2008.12593v5, §2 p.9 and AppendixA.1.2 before LemmaA.10 p.47

**Assertion at issue:** The standing definition takes G^der to be the derived group of G⁰, but AppendixA.1.2 identifies it with the GL_n factor of (GL_n×G_m).

**Correction:** Distinguish the kernel of the polarized multiplier, with tangent gl_n, from the connected derived group with tangent sl_n. State the A.10 module criterion for the intended coefficient module and relate it explicitly to the global datum before importing it.

**Reason:** The derived subgroup of GL_n×G_m is SL_n. Its Lie algebra has dimension n²−1, while the multiplier kernel has dimension n². Their scalar summand and complex-conjugation action require an explicit comparison; changing conventions silently does not supply it. This is the convention obligation G4, not an assertion that the main lifting theorem is false.

**Reach:** the proof. **Correction search:** The arXiv history, publisher article page and public correction searches on 2026-10-19 yielded no correction; findings remain scoped to the preprint.

**Independent review:** confirmed. Read p.9 and p.47: §2 defines G^der as the derived group of G⁰, while A.1.2 calls the GL_n factor of G⁰=GL_n×G_m the derived group; C2 for sl_n does not follow from C2 for gl_n, since (sl_n)* is a quotient of (gl_n)*.

## Catalogue coverage

All 86 items routed by PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22 to the former continuation name GlobalGaloisDeformationsPartIIGValuedLifting are assigned here. This is a dependency-oriented plan; it is not a section-by-section summary of that paper. General input results are assigned to their existing owners. The route numbers are stable catalogue identifiers.

| Catalogue item | Targets | Imported owners |
|---|---|---|
| 1 | GG2.8/actual-modularity |  |
| 2 | GG2.8/stable-lattice-segment |  |
| 3 | GG2.8/hamblen-ramakrishna-comparison |  |
| 4 | GG2.10/conjectural-scope |  |
| 5 | GG2.0/lifting-datum |  |
| 10 | GG2.0/abelian-compositum |  |
| 11 | GG2.0/residual-conditions |  |
| 12 | GG2.0/trivial-prime |  |
| 13 | GG2.2/sha-killing |  |
| 14 | GG2.2/cyclic-sha-stabilisation |  |
| 15 | GG2.2/one-prime-sequence |  |
| 16 | GG2.2/marked-dual-classes |  |
| 17 | GG2.2/spanning-classes |  |
| 18 | GG2.2/prescribed-vector-classes |  |
| 19 | GG2.2/marked-dual-classes |  |
| 20 | GG2.2/dual-strong-disjointness |  |
| 21 | GG2.3/initial-mod-square |  |
| 22 | GG2.3/doubling |  |
| 23 | GG2.0/residual-conditions |  |
| 24 | GG2.3/congruence-field-disjointness |  |
| 25 | GG2.3/controlled-tower |  |
| 26 | GG2.0/residual-conditions; GG2.4/smooth-neighborhood-conditions |  |
| 28 | GG2.6/main-geometric-lift |  |
| 29 | GG2.4/root-local-condition; GG2.4/smooth-neighborhood-conditions | LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p |
| 30 | GG2.4/deep-reduction-vanishing |  |
| 31 | GG2.4/relative-selmer-image; GG2.4/relative-balance |  |
| 32 | GG2.5/finite-image-vanishing |  |
| 33 | GG2.5/simultaneous-detection |  |
| 34 | GG2.6/sl2-prime-bound |  |
| 35 | GG2.6/nongeometric-lift |  |
| 36 | GG2.7/levi-residual-lattice |  |
| 37 | GG2.7/many-extension-classes |  |
| 38 | GG2.7/full-unipotent-extension |  |
| 39 | GG2.7/unipotent-local-lift |  |
| 40 | GG2.7/remove-invariants |  |
| 41 | GG2.7/levi-geometric-lift |  |
| 42 | GG2.7/torus-test |  |
| 43 | GG2.7/siegel-modular-example |  |
| 44 | GG2.8/gl2-residual-criteria |  |
| 49 | GG2.8/semisimple-modularity |  |
| 53 | GG2.8/reducible-modularity |  |
| 54 | GG2.8/totally-real-modularity |  |
| 55 | GG2.8/infinitely-many-extensions |  |
| 56 | GG2.8/stable-lattice-segment |  |
| 57 | GG2.8/fixed-weight-level-finiteness |  |
| 58 | GG2.8/minimal-lifting-boundary |  |
| 60 | GG2.9/actual-function-field-automorphy |  |
| 62 | GG2.9/function-field-automorphy |  |
| 63 | GG2.9/function-field-irreducible-boundary |  |
| 64 | GG2.9/two-block-automorphy |  |
| 65 | GG2.9/direct-sum-automorphy |  |
| 71 | GG2.10/symplectic-compatible-system | tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon |
| 72 | GG2.10/symplectic-compatible-system |  |
| 73 | GG2.0/residual-conditions |  |
| 74 |  | tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory |
| 75 | GG2.1/central-factor-series; GG2.1/central-jordan-holder |  |
| 76 | GG2.1/central-jordan-holder |  |
| 77 | GG2.1/cyclotomic-exclusion |  |
| 78 |  | ArithmeticGaloisRepresentations:G7 |
| 79 | GG2.1/abelian-root-subgroup |  |
| 80 | GG2.1/block-criteria |  |
| 81 |  | GlobalGaloisDeformations:G7 |
| 82 | GG2.1/maximal-parabolic-criteria |  |
| 83 | GG2.1/property-d |  |
| 84 | GG2.1/maximal-separation |  |
| 85 | GG2.1/explicit-separation |  |
| 86 | GG2.1/borel-criteria |  |
| 95 | GG2.0/oddness |  |
| 96 | GG2.0/cocycle-fields; GG2.3/density-selection |  |
| 97 | GG2.2/ramification-disjointness |  |
| 98 |  | tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; gap G6(iv) |
| 99 | GG2.0/cyclotomic-intersection |  |
| 100 | GG2.3/initial-mod-square |  |
| 101 | GG2.3/trivial-prime-pairing |  |
| 102 | GG2.4/auxiliary-prime-set; GG2.4/root-local-condition |  |
| 103 | GG2.5/relative-selmer-annihilation; GG2.6/compatible-finite-ramification |  |
| 104 | GG2.6/finite-congruence-detection |  |
| 105 |  | tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; gap G6(iv) |
| 106 | GG2.5/adjoint-orbit-reduction |  |
| 107 | GG2.5/simultaneous-root-position |  |
| 108 |  | tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; gap G6(iii) |
| 109 | GG2.8/global-determinant-match |  |
| 115 |  | tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; gap G6(i) |
| 116 | GG2.1/block-criteria | tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; gap G6(iii) |
| 117 | GG2.1/irreducible-image-input |  |
| 118 |  | tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; gap G6(ii) |

## Suggested signatures

The compact companion file follows the current roadmap shape. It contains three light real-bodied definitions over carriers at the pins: the linear submodule image, the generic orbit span and an additive image on the actual continuous H¹ carrier. The generic cyclic span is specialized to F_p in the arithmetic construction; it must not be replaced by a k-span. The two image definitions expose the same image operation in linear and continuous-cohomology settings. It also states FKP22 Lemma 2.1 (GG2.0/abelian-compositum) with Mathlib intermediate fields, normality and IsAbelianGalois. Nine API milestones and ten examples exercise zero images, identity, composition, orbit generation and equivariance, and include two non-examples: the image of a ↦ (a,0) is not the whole target, and the prime-field cyclic span of 1 in F_{p²} with trivial action is not all of F_{p²}. They are illustrative forms, not replacements for the full arithmetic objects, APIs or tests specified above. The heavy Galois, local-deformation and automorphic statements remain README targets until their owners supply the required carriers.

The companion file, as revised by the independent review, elaborated with `lean-check` at the pinned shared build on 2026-10-19, with the 19 expected admitted-proof warnings only. All target implementation statuses remain unchecked. This checks the displayed forms against existing carriers; it does not prove the arithmetic theorem.
