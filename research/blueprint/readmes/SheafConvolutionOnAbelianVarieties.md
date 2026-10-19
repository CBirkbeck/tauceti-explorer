# Sheaf convolution on abelian varieties and convolution monodromy

This roadmap develops the quotient convolution category, its cohomological fibre functors, and the geometric and arithmetic groups acting on smooth ample hypersurface cohomology. Microlocal cycles and a finite exterior-power counting problem lead to classical connected derived monodromy. Generic simultaneous twists, Frobenius transport and period detection supply the geometric inputs to the Lawrence–Venkatesh method. The final arithmetic finiteness argument belongs to MordellLawrenceVenkateshPartII.

The complete reader is [research/blueprint/readmes/SheafConvolutionOnAbelianVarieties.md](../readmes/SheafConvolutionOnAbelianVarieties.md). The planning pass covers every target in SC.0–SC.9. It is complete at target level, with named supplier requests and two proof gaps; it is neither a closed plan nor a formalisation claim. The surface period assertion has a separate Torelli route; its polarized comparison and relative universal property are precise supplier contracts.

## Conventions and the build boundary

Work in characteristic zero, with geometric fundamental groups based at the identity of an abelian variety A. The coefficient field is F=Q̄_ℓ; in the Hodge–Tate calculation the cohomological prime is p and coefficients are enlarged inside Q̄_p. The prime controlling the **order of a finite character** is independent of the cohomological prime. In SC.8 it is chosen different from the residue characteristic of the good-reduction place.

Write n=dim A and dim H=n−1. A smooth ample H is geometrically connected. Set d=[H]^n/n!=χ(A,O_A(H))>0 and N=n!d. The topological Euler characteristic is (−1)^(n−1)N; the distinguished representation dimension is N. A(n,q) is the existing descent-indexed Eulerian number from CA.2, extended by zero to integral q outside 0≤q<n when n≥1. A(0,0) follows its supplier convention. Native Hodge–Tate weight is −q when the paper labels a summand by q.

The subcategory D_N is defined by all perverse cohomology objects, not by vanishing of the total Euler characteristic. P/N is the abelian Serre quotient. Its inclusion into the derived Verdier quotient has the image of the perverse heart as essential image; the whole Verdier quotient is not identified with an abelian category. The geometric arithmetic-comparison category consists of direct summands of arithmetic pullbacks.

The connected derived image is denoted G*=(G°)^der. “Simple” in the family theorems means noncommutative connected simple algebraic group up to its finite centre. The faithful represented group, its simply connected cover, and the image of an exterior-power representation are distinguished. Changing a good fibre character compares groups only up to inner conjugacy.

The definitive specifications below are mathematical targets. All implementation statuses are unchecked. The [suggested Lean file](../suggested/SheafConvolutionOnAbelianVarieties.lean) contains only three light definitions on existing carriers, twelve theorem signatures and ten examples. It does not introduce substitute perverse-sheaf or Tannakian carriers. All heavier objects, their APIs and checks are stated in this reader.

## Library audit and ownership

The pinned Mathlib commit is `082e2d37e8b0463410cdb532e111cd43d5a66174`; the pinned Tau Ceti commit is `f790474821cf4256814db967cb154e7af3d0c369`. Every entry below was checked by reading its source declaration and hypotheses, in addition to the reviewed `data/library-coverage.json` entries for the supplier layers.

| Existing declaration | Exact contribution |
| --- | --- |
| [Finset.powersetCard](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Finset/Powerset.lean) | The finite set of k-element subsets of an actual finite set; no exterior-weight counting theory is supplied. |
| [Finset.card_powersetCard](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Finset/Powerset.lean) | Its cardinality is Nat.choose of the cardinality of the original set and k. |
| [Nat.choose](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Choose/Basic.lean) | The binomial coefficient with choose(n,0)=1, choose(0,k+1)=0 and Pascal recursion; in particular choose(n,n)=1. |
| [DerivedCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | Derived category of an abelian category equipped with HasDerivedCategory; this does not construct the adic constructible category or six operations. |
| [TauCeti.AlgebraicGeometry.AbelianVariety](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean) | A proper geometrically integral group scheme over a field, with commutativity, smoothness and base-change interface. These objects are imported, never rebuilt here. |
| [TauCeti.Tannaka.tensorAutFunctor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean) | Tensor automorphism group functor on commutative value algebras for scalar extension of finite comodules over a bialgebra; it is not abstract neutral Tannaka reconstruction. |
| [TauCeti.Tannaka.fgPointTensorIsoEquiv](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean) | For a commutative Hopf algebra over a field, its algebra-valued points are multiplicatively equivalent to the tensor automorphisms of scalar extension on finite comodules; it does not supply exactness criteria for abstract Tannakian sequences. |
| [CategoryTheory.ObjectProperty.SerreClassLocalization.abelian](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean) | An additive localization of an abelian category at isomorphisms modulo a Serre class is abelian; this is the existing generic quotient construction. |
| [CategoryTheory.ObjectProperty.SerreClassLocalization.preservesFiniteLimits](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean) | The additive Serre-class localization preserves finite limits, assuming it is a localization at P.isoModSerre. |
| [CategoryTheory.ObjectProperty.SerreClassLocalization.preservesFiniteColimits](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean) | The same additive localization preserves finite colimits; together these results give exactness. |

The current read-only Tau Ceti library at commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current TauCetiRoadmap main were also checked. In particular ReductiveGroups, RepresentationTheory/LieHighestWeight, RepresentationTheory/SpinRepresentations and the newer OrthogonalSpinGroups were read before choosing the ownership boundary. OrthogonalSpinGroups supplies arithmetic orthogonal/spin structure and imports the spin-representation roadmap; SC.4 repeats neither. Mathlib already supplies the generic Serre localization, which is used directly. Abstract neutral Tannaka reconstruction remains the MC.6 input rather than a consequence of the existing finite-comodule automorphism functor alone.

The common abelian, perverse, six-operation, cycle, Hodge, reductive-group and Eulerian theories keep their existing owners. The requested extensions are specified after the layers. General Appendix C Eulerian statements are CA.2 inputs. This roadmap owns the hypersurface-specific Eulerian specialization, the finite occupancy argument, clean convolution applications and the family monodromy mechanism. It exports SC.8/uniform-orbit-monodromy to the Lawrence–Venkatesh Part II direction and creates no dependency on that consumer.

## Layers and acceptance milestones

| Layer | Milestone | Coverage |
| --- | --- | --- |
| SC.0 | Characters, convolution and negligible objects | planned |
| SC.1 | Twisted fibres and convolution groups | planned |
| SC.2 | Arithmetic and geometric Tannaka groups | planned |
| SC.3 | Hypersurface Euler and Hodge data | planned |
| SC.4 | Microlocal structure and simple groups | planned |
| SC.5 | Exterior-power counts and exceptional degrees | planned |
| SC.6 | Eulerian exclusion and classical monodromy | planned |
| SC.7 | Generic twists in hypersurface families | planned |
| SC.8 | Frobenius and Galois-uniform monodromy | planned |
| SC.9 | Isogeny pullbacks and finite period detection | planned |

“Planned” means that every target has an exact specification and a prerequisite chain ending in the pinned libraries, an imported node, a precise supplier request or a named proof gap. None of these layers is reported closed. G1 affects the universal combinatorial argument and its classical-monodromy consequence; G3 affects the higher-dimensional period route; the surface case uses the separate Torelli argument.

## SC.0 — Characters, convolution and negligible objects

Define Π(A), proper torsion cosets (including coupled-coordinate kernels), and origin-normalized rank-one character sheaves. Construct derived convolution with δ₀ unit and inversion–Verdier dual. Establish generic vanishing before using it to prove the Serre and thick tensor-ideal properties of Euler-negligible objects. Construct the exact perverse convolution quotient through the existing Serre localization and its Verdier comparison. Distinguish arbitrary exceptional translates from geometric-origin torsion translates.

Layer inputs: `AbelianSchemesAndArithmeticModuli:A3`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.5`, `EtaleDualityAndPerverseSheaves:EDC.6`, `EtaleDualityAndPerverseSheaves:EDC.7`.

### character-space — Geometric character space

**Definition.** For an abelian variety A over a characteristic-zero field k, a chosen algebraic closure k̄, and coefficient field F=Q̄_ℓ, put Π(A)=Hom_cont(π₁ᵉᵗ(A_k̄,0),F×). It is an abelian group under multiplication of characters. For a positive-dimensional abelian subvariety B⊂A_k̄, let T_B be the subgroup of characters trivial on the image of π₁ᵉᵗ(B,0). A torsion character has finite image; a torsion coset is τT_B with τ of finite order. On A^c use abelian subvarieties of A^c, including those coupling coordinates. This is a set with group structure; it is not asserted to be an algebraic F-torus.

Hypotheses: char(k)=0; ℓ is a prime; all fundamental groups are geometric and based at the identity.

Direct dependencies: `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `AbelianSchemesAndArithmeticModuli:A3`, `EtaleDualityAndPerverseSheaves:EDC.6`.

Construction or proof route:

1. Import the geometric étale fundamental group, its finite-cover equivalence and the torsion/isogeny description for abelian varieties. Define the subgroup as a restriction kernel.
2. Use π₁(A×A′)=π₁(A)×π₁(A′) to identify product characters. Keep the algebraic Betti-character torus and continuous étale characters distinct.

Uses: LS, Theorem 4.7 — Specify the exceptional locus for simultaneous twists.; LS, Lemmas 4.8–4.9 — Count torsion characters and act on finite-order character pairs..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `characterSpace_mul` | structure | Multiplication, inverse and unit are pointwise; restriction and pullback are group homomorphisms. |
| `characterSpace_product` | equivalence | The product decomposition of geometric π₁ induces Π(A×A′)≅Π(A)×Π(A′). |
| `restrictionKernel_mem` | characterisation | χ belongs to τT_B exactly when χτ⁻¹ restricts trivially to π₁(B). |
| `torsionCharacter_iff` | characterisation | χ is torsion exactly when it factors through A[m] for some m>0; this concerns finite-order characters only. |

Discriminating unit tests:

- `characterSpace_point`: For A of dimension zero the character space has one element and no proper T_B occurs.
- `characterSpace_full_kernel`: For dim A>0, B=A gives T_A={1}; B=0 is excluded because its kernel would be the whole character space.
- `characterSpace_diagonal`: For c=2 the diagonal locus χ₁=χ₂ is an allowed proper restriction kernel on A²; coordinate-only exceptions miss it.

Acceptance checks:

- Π(A^c)≅Π(A)^c, with coordinate restrictions fixed.
- Proper torsion cosets have codimension at least one in the torsion-point counting sense.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), §4, p. 30, definitions preceding Lemma 4.4; pp. 34–36, finite-order character actions. The avoidance loci are defined by restriction to positive-dimensional abelian subvarieties; the source does not supply an algebraic scheme structure on the entire continuous-character set.

Atlas planet: Character space.

Implementation status: unchecked.

### rank-one-local-system — Origin-normalized character sheaf

**Construction.** For χ∈Π(A), construct the rank-one lisse F-sheaf Lχ on A_k̄ with monodromy χ. If χ is fixed by Gal(k̄/k), extend its representation across π₁(A,0)=π₁(A_k̄,0)⋊Gal(k̄/k) by making the identity-section factor act trivially. This is the unique descent with a chosen trivialization at 0 fixed by Galois. Its multiplicative structure a*Lχ≅Lχ⊠Lχ is normalized at (0,0) and coherent.

Hypotheses: Use the identity-section splitting. Descent is asserted only for Galois-invariant χ.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.0/character-space`, `EtaleDualityAndPerverseSheaves:EDC.6`.

Construction or proof route:

1. Apply the lisse sheaf/continuous representation equivalence. The invariant-character condition is precisely the compatibility needed to extend over the semidirect product.
2. Normalize the rank-one tensor isomorphism by the identity fibre, which forces associativity and the unit laws.

Uses: LS, Lemma 2.5 — Supply a tensor structure on twisted global cohomology.; LS, Lemma 2.9 — Provide the actual Galois action on twisted cohomology..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `characterSheaf_monodromy` | characterisation | The geometric monodromy is χ and the origin-normalized arithmetic monodromy is trivial on the identity-section Galois factor. |
| `characterSheaf_mul` | compatibility | Lχ⊗Lψ≅Lχψ, Lχ∨≅Lχ⁻¹ and [−1]*Lχ≅Lχ⁻¹, compatibly with origin trivializations. |
| `characterSheaf_addition` | structure | a*Lχ≅Lχ⊠Lχ has associative and unital coherence. |
| `characterSheaf_baseChange` | functoriality | Base change transports both the representation and its normalized descent; identity and composition comparisons commute. |

Discriminating unit tests:

- `characterSheaf_unit`: The unit character gives the constant sheaf with trivial Galois origin fibre.
- `characterSheaf_no_false_descent`: A character moved by Galois has no descent of the prescribed normalized kind.
- `characterSheaf_arithmetic_twist`: Tensoring a normalized descent by a nontrivial Galois character preserves geometric monodromy but fails the normalization.

Acceptance checks:

- The identity fibre has no unspecified arithmetic rank-one factor.
- Tensoring by Lχ respects convolution via its multiplicative structure.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Definitions 2.3–2.4, p. 15; Lemma 2.5, p. 16. The geometric local system exists without an invariance condition; the distinguished arithmetic descent uses it.

Atlas planet: Character sheaf.

Implementation status: unchecked.

### derived-convolution — Derived sheaf convolution

**Construction.** On Dᵇ_c(A,F), define K*L=Ra_*(K⊠L), where a is addition and ⊠ is the derived external tensor product. With the symmetry inherited from complexes, including Koszul signs, this is a rigid symmetric monoidal structure. Its unit is δ₀ and its dual is K∨=[−1]*D_AK. Evaluation and coevaluation satisfy both triangle identities.

Hypotheses: A is proper over k of characteristic zero; coefficients are F; constructible adic boundedness receipts are imported.

Direct dependencies: `mathlib:DerivedCategory`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`, `EtaleDualityAndPerverseSheaves:EDC.6`.

Construction or proof route:

1. Obtain associativity, unit and symmetry by proper base change, the projection formula and the group law. Use the coherent six-operation comparisons, rather than equality of chosen derived models.
2. Construct evaluation from duality and the antidiagonal, as in Weissauer’s rigidity proposition; verify both triangle identities before passing to a quotient.

Uses: LS, Lemmas 2.2 and 2.5 — Build the quotient tensor structure and the fibre functor.; LS, Lemma 3.11 — Determine the orthogonal or symplectic duality sign..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `convolution_assoc` | structure | The associator and unit/symmetry maps obey the pentagon, triangle and hexagon identities. |
| `convolution_skyscraper` | simp | δₓ*K identifies with translation pushforward tₓ* K. |
| `convolution_dual` | compatibility | The convolution dual agrees with inversion-pullback of Verdier duality, with evaluation and coevaluation. |
| `convolution_characterTwist` | compatibility | (K*L)⊗Lχ≅(K⊗Lχ)*(L⊗Lχ). |

Discriminating unit tests:

- `convolution_points`: Two skyscrapers supported at x and y convolve to one at x+y, not at x−y.
- `convolution_unit`: Convolution with δ₀ preserves an arbitrary complex; convolution with the constant sheaf is not the unit operation.
- `convolution_shift_sign`: Exchanging two copies shifted by one introduces the negative Koszul sign.

Acceptance checks:

- δₓ*δᵧ≅δₓ₊ᵧ and δₓ∨≅δ₋ₓ.
- The symmetry on shifts of constant sheaves retains the sign needed by SC.4.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 2.1, p. 14; Weissauer, rigidity Proposition, pp. 1–2. The source gives the convolution dual via Verdier duality and inversion. The rigidity argument is additional to ordinary symmetric monoidality.

Source: [W](https://arxiv.org/pdf/1111.6095), Unnumbered Proposition, pp. 1–2. Constructs duality data and proves the rigidity identities for convolution.

Atlas planet: Sheaf convolution.

Implementation status: unchecked.

### generic-vanishing — Generic vanishing on abelian varieties

**Theorem.** For a perverse F-sheaf K on a complex abelian variety, there is a finite union of translates of proper character subtori outside which H^j(A,K⊗Lχ)=0 for j≠0. The translating characters can be chosen torsion when K is semisimple of geometric origin. The same existence statement for continuous étale characters follows by the comparison and coefficient interfaces. A finite family of perverse sheaves admits one common good character; arbitrary non-geometric sheaves do not acquire torsion exceptional translates by this theorem.

Hypotheses: For the torsion-coset assertion impose geometric origin; use the integral-lattice essential image in analytic/étale comparison.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.0/character-space`, `SheafConvolutionOnAbelianVarieties:SC.0/rank-one-local-system`, `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`, `EtaleDualityAndPerverseSheaves:EDC.7/geometric-origin-class`.

Construction or proof route:

1. Use KW Theorem 1.1 for the cohomological vanishing and Lemma 11.2(c) for torsion translation in the geometric-origin case.
2. For finitely many composition factors take the union of their bad loci. Finite unions remain proper and admit continuous good characters; torsion good characters exist in the geometric-origin case.

Acceptance checks:

- For F[n] with n>0, a generic nontrivial character kills all cohomology.
- Rank-one non-torsion local systems show why arbitrary translates cannot be replaced by torsion translates.

Source: [KW](https://arxiv.org/pdf/1111.4947v6), KW, Theorem 1.1, p. 2; Lemma 11.2(c), p. 25. These two statements have different generality. The torsion conclusion is not part of the arbitrary-perverse version.

Atlas planet: Generic vanishing.

Implementation status: unchecked.

### negligible-perverse — Negligible perverse sheaves

**Definition.** For K perverse on A set χ(A,K)=Σ_j(−1)^j dim_F H^j(A_k̄,K_k̄). Let N be the full subcategory with χ(A,K)=0, and let D_N be the full subcategory of Dᵇ_c whose every perverse cohomology object lies in N. N is a Serre subcategory and D_N is a thick triangulated subcategory stable under convolution with arbitrary constructible complexes. For perverse K,L, pH^j(K*L)∈N when j≠0.

Hypotheses: Geometric Euler characteristic; constructible field coefficients, finite-dimensional cohomology.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.0/derived-convolution`, `SheafConvolutionOnAbelianVarieties:SC.0/generic-vanishing`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`, `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.6`.

Construction or proof route:

1. Prove nonnegativity by generic vanishing. Additivity in perverse short exact sequences then proves the Serre assertion.
2. Use finitely many perverse cohomology objects and a common generic character to prove the convolution ideal and nonzero-degree negligibility, following KW. Generic vanishing is established before the quotient and has no quotient prerequisite.

Uses: LS, Lemma 2.2 — Make a tensor operation on the perverse quotient.; LS, Lemmas 2.5–2.8 — Identify the cohomological kernel and remove negligible summands..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `negligible_iff_euler_zero` | characterisation | For a perverse object, negligibility is exactly vanishing of its geometric Euler characteristic. |
| `negligible_serre` | structure | Subobjects, quotients and extensions of negligible perverse objects remain negligible. |
| `derivedNegligible_iff` | characterisation | A bounded complex is in D_N iff every pH^j is negligible. |
| `negligible_convolution_ideal` | compatibility | D_N is stable under either convolution variable and nonzero perverse degrees of K*L lie in N. |

Discriminating unit tests:

- `negligible_point`: A rank-one skyscraper has Euler characteristic 1 and is not negligible.
- `negligible_constant`: On a positive-dimensional abelian variety the shifted constant perverse sheaf F[n] is negligible.
- `negligible_no_cancellation`: δ₀⊕δ₀[1] has total Euler characteristic zero but is not in D_N because its nonzero perverse cohomology contains δ₀.

Acceptance checks:

- Every perverse Euler characteristic is nonnegative.
- A complex with zero total Euler characteristic need not belong to D_N.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 2.2(1)–(5), p. 15; KW, Proposition 10.1 and Lemma 13.1, pp. 21–22 and 29–30. The thick derived ideal is defined by all perverse cohomology, not by cancellation in the total Euler characteristic.

Atlas planet: Negligible sheaves.

Implementation status: unchecked.

### quotient-convolution — Perverse convolution quotient

**Construction.** Construct the abelian Serre quotient P(A)/N. Its tensor product is represented by pH⁰(K*L); the essential image of P(A) in Dᵇ_c(A,F)/D_N is equivalent to this Serre quotient and is closed under convolution and duality. These comparisons transport the coherent rigid symmetric monoidal structure to the quotient. The quotient functor is exact and kills exactly N.

Hypotheses: The quotient is a Serre quotient, not a naive quotient of every Hom space by negligible factorisations.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.0/negligible-perverse`, `mathlib:CategoryTheory.ObjectProperty.SerreClassLocalization.abelian`, `mathlib:CategoryTheory.ObjectProperty.SerreClassLocalization.preservesFiniteLimits`, `mathlib:CategoryTheory.ObjectProperty.SerreClassLocalization.preservesFiniteColimits`, `EtaleDualityAndPerverseSheaves:EDC.5`.

Construction or proof route:

1. Use Mathlib’s Serre-class localization for the abelian quotient and its exact functor. Apply the requested bounded-heart/Verdier quotient comparison to the perverse heart and its thick ideal.
2. Transport convolution and duality through the equivalence, using negligibility of every other perverse degree.

Uses: LS, Lemma 2.5 — Restrict to the character-admissible neutral subcategory.; LS, Lemma 2.6 — Compute morphisms between geometrically semisimple representatives..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `perverseQuotient_exact` | structure | The quotient functor is exact, F-linear, and universal among exact functors annihilating N. |
| `perverseQuotient_tensor` | compatibility | Q(K)⊗Q(L)≅Q(pH⁰(K*L)) with coherent associator and symmetry. |
| `perverseQuotient_verdier` | equivalence | P/N is equivalent to the essential image of P in Dᵇ_c/D_N. |
| `perverseQuotient_dual` | compatibility | Q([−1]*DK) is the rigid dual of Q(K). |

Discriminating unit tests:

- `quotient_kills_constant`: For dim A>0, the image of F[n] is zero.
- `quotient_keeps_point`: The image of δ₀ is a nonzero tensor unit with endomorphism field F.
- `quotient_extra_degrees`: Negligible higher perverse cohomology of K*L disappears, even if the original convolution was not perverse.

Acceptance checks:

- The tensor unit is the image of δ₀.
- The quotient Hom simplification is used only after geometric semisimplicity in SC.2.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 2.2(6)–(9), p. 15; KW, §§12–13, pp. 26–30. The heart embeds in the Verdier quotient as the tensor-stable Serre quotient; it need not equal the whole Verdier quotient.

Atlas planet: Convolution quotient.

Implementation status: unchecked.

## SC.1 — Twisted fibres and convolution groups

Define character-admissible perverse objects by all geometric subquotients. Construct their exact faithful tensor fibre ωχ=H⁰(A,−⊗Lχ), identify dimension with Euler characteristic, and define the finite-type represented convolution group on one generator. Compare good characters through a tensor-isomorphism torsor up to inner conjugation. Identify Euler-one simple objects with rank-one skyscrapers.

Layer inputs: `EtaleDualityAndPerverseSheaves:EDC.6`, `MotivesAndAlgebraicCycles:MC.3`, `MotivesAndAlgebraicCycles:MC.6`, `SheafConvolutionOnAbelianVarieties:SC.0`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

### admissible-perverse — Character-admissible perverse sheaves

**Definition.** For χ∈Π(A), define Pχ to be the full subcategory of perverse K on A for which H^j(A_k̄,Q⊗Lχ)=0 for every geometric perverse subquotient Q of K_k̄ and every j≠0. Set Nχ=Pχ∩N. Then Pχ is Serre and its essential image in P/N is equivalent to Pχ/Nχ. That image contains δ₀ and is closed under quotient convolution and rigid duals. A fixed χ suffices for a tensor category generated by any K belonging to Pχ.

Hypotheses: χ need not be Galois-invariant for this definition or for a vector-space-valued geometric fibre functor.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.0/quotient-convolution`, `SheafConvolutionOnAbelianVarieties:SC.0/rank-one-local-system`, `SheafConvolutionOnAbelianVarieties:SC.0/generic-vanishing`.

Construction or proof route:

1. Test the vanishing on the finitely many geometric composition factors; extension stability follows from the long cohomology sequence.
2. Use KW’s closure of the good subcategory under convolution and duality in the quotient, together with the Serre quotient comparison.

Uses: LS, Lemma 2.5 — Define an exact fibre functor on the quotient.; LS, Lemma 2.7 — Restrict the arithmetic and geometric semisimple categories..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `admissible_iff_simple_factors` | characterisation | K is in Pχ iff every simple geometric constituent has twisted cohomology only in degree zero. |
| `admissible_serre` | structure | Pχ is stable under subobjects, quotients and extensions. |
| `admissible_quotient` | equivalence | Its quotient by Nχ is the full essential image in P/N. |
| `admissible_tensor_dual` | structure | The quotient contains the unit and is stable under convolution, duals, finite direct sums and subquotients. |

Discriminating unit tests:

- `admissible_skyscraper`: Every skyscraper δₓ is admissible for every character.
- `admissible_bad_constant`: For dim A>0, F[n] is not admissible for χ=1.
- `admissible_good_constant`: For a nontrivial geometric rank-one character on a complex abelian variety, F[n] has zero twisted cohomology and is admissible; it becomes zero in the quotient.

Acceptance checks:

- The definition excludes cancellation-based vanishing criteria.
- Duality changes χ to χ⁻¹ before the Verdier dual, and yields the stated closure for the same fibre functor.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Definition before Lemma 2.5 and Lemma 2.5(1)–(2), p. 16; KW, Theorem 13.2, p. 30. The condition includes all geometric subquotients, not just the whole sheaf.

Atlas planet: Admissible perverse sheaves.

Implementation status: unchecked.

### fibre-functor — Twisted cohomology fibre functor

**Construction.** Define ωχ(K)=H⁰(A_k̄,K_k̄⊗Lχ) on Pχ/Nχ. This is F-linear, faithful, exact and symmetric monoidal with finite-dimensional values, and dim_Fωχ(K)=χ(A,K). Thus (Pχ/Nχ,ωχ) is a neutral Tannakian category in the convention of MC.3. The tensor structure uses the same χ in both factors and the normalized multiplication of Lχ.

Hypotheses: Use the Serre quotient and the ordinary vector-space symmetry induced by degree-zero cohomology.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.1/admissible-perverse`, `MotivesAndAlgebraicCycles:MC.3/tannakian-category`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `EtaleDualityAndPerverseSheaves:EDC.6`.

Construction or proof route:

1. Concentration turns the long exact cohomology sequence into a short exact sequence and makes Künneth identify convolution cohomology with the tensor product.
2. The kernel consists of Nχ by dimension=Euler characteristic. Descend through the exact quotient; faithfulness follows from exactness and the trivial object kernel.

Uses: LS, Lemmas 2.7–2.9 — Construct group schemes and the Galois normalization map.; LS, Lemma 3.7 — Read the distinguished dimension as a geometric Euler characteristic..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `twistedFiber_dim` | compatibility | dim ωχ(K)=χ(A,K) for every admissible K. |
| `twistedFiber_tensor` | structure | ωχ(Q(pH⁰(K*L)))≅ωχ(K)⊗ωχ(L) is coherent with unit, associator and symmetry. |
| `twistedFiber_exact_faithful` | structure | ωχ preserves short exact sequences and detects zero objects and zero morphisms in the quotient. |
| `twistedFiber_dual` | compatibility | ωχ([−1]*DK)≅ωχ(K)∨, compatibly with evaluation. |

Discriminating unit tests:

- `fiber_point`: ωχ(δ₀)=F, with the prescribed unit identification.
- `fiber_nonfaithful_before_quotient`: A negligible admissible shifted constant object has zero fibre, so faithfulness before quotienting is false.
- `fiber_tensor_rank`: The fibre of δₓ*δᵧ has dimension 1, equal to the product of the two fibre dimensions.

Acceptance checks:

- A rank-one skyscraper has one-dimensional fibre.
- A negligible admissible object has zero fibre.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 2.5(3)–(4), p. 16; KW, Theorem 13.2, p. 30. Twisted cohomology neutralizes the good quotient, rather than furnishing a faithful functor on all perverse sheaves.

Atlas planet: Twisted cohomology fibre functor.

Implementation status: unchecked.

### convolution-group — Convolution monodromy group

**Definition.** For K∈Pχ let ⟨K⟩⊗ be the full Tannakian subcategory of Pχ/Nχ generated by Q(K) using tensor products, duals, finite sums and subquotients. Define G(K,χ)=Aut⊗(ωχ|⟨K⟩⊗); it is an affine algebraic subgroup of GL(ωχK), acting faithfully on that space. The total category has a proalgebraic Tannaka group; G(K,χ) is its finite-type image. For geometrically semisimple K over an algebraically closed field, G(K,χ) is reductive.

Hypotheses: The subcategory is essentially small; an object killed by N generates the trivial group with zero distinguished representation.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.1/fibre-functor`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `tauceti:TauCeti.Tannaka.tensorAutFunctor`, `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Construction or proof route:

1. Apply abstract neutral reconstruction from MC.6, whose comodule special case is already in the pinned Tau Ceti library.
2. One tensor generator gives a closed faithful finite-dimensional representation. In characteristic zero, semisimplicity of the geometric generated category gives reductivity.

Uses: LS, Theorem 3.5 — State the classical subgroup theorem.; LS, Theorem 4.7 — Compare the convolution group with usual family monodromy..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `convolutionGroup_faithful` | structure | The action on ωχK is a closed immersion into its general linear group. |
| `convolutionGroup_tensorGenerated` | universal-property | Representations of G(K,χ) identify with the tensor category generated by Q(K), with the given fibre functor. |
| `convolutionGroup_directSum` | functoriality | The group of K⊕L maps as a closed subgroup to G(K)×G(L), surjecting to each factor. |
| `convolutionGroup_reductive` | compatibility | For a geometrically semisimple generator in the geometric category the group is reductive in characteristic zero. |

Discriminating unit tests:

- `group_unit`: The tensor category generated by δ₀ has trivial group.
- `group_negligible`: A negligible generator has zero distinguished fibre and cannot yield a positive-rank monodromy group.
- `group_same_summand`: K⊕K gives a diagonal copy of G(K) in G(K)², rather than automatically the full product.

Acceptance checks:

- For K=δ₀ the group is trivial.
- For a nonzero hypersurface object, the distinguished representation is faithful of positive rank.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), §2, pp. 14 and 16–18; §4, p. 28, definition of G and G*. The image on one object is the convolution monodromy group; it is distinguished from the usually infinite total Tannaka group.

Atlas planet: Convolution monodromy group.

Implementation status: unchecked.

### character-independence — Change of fibre character

**Theorem.** If χ and ψ are good for K, the two tensor-generated geometric categories are the same full subcategory of P/N. The tensor-isomorphism functor Isom⊗(ωχ,ωψ) is a torsor for their Tannaka groups. On the finite-type category generated by K over F=Q̄_ℓ it has an F-point, giving an isomorphism of the two represented groups, well defined up to inner conjugation. No canonical identification of their fibres is asserted.

Hypotheses: Work on a finitely tensor-generated category over the algebraically closed coefficient field.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.1/convolution-group`, `MotivesAndAlgebraicCycles:MC.6`.

Construction or proof route:

1. Identify both generated categories inside the common quotient. Apply the requested tensor-isomorphism torsor theorem.
2. Use finite type and algebraic closedness to obtain a rational torsor point. Changing that point changes the comparison by conjugation.

Acceptance checks:

- Record all group comparisons as noncanonical up to inner conjugacy.
- Do not infer that arbitrary torsors under arbitrary infinite proalgebraic groups have rational points.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), §2, p. 16, paragraph after Lemma 2.5. The source invokes the fibre-functor comparison theorem; the missing abstract torsor result is requested from its owner.

Implementation status: unchecked.

### euler-one-skyscraper — Euler-one perverse sheaves

**Theorem.** A simple perverse sheaf K on a complex abelian variety with χ(A,K)=1 is a rank-one skyscraper δₓ. Consequently every one-dimensional simple object of the semisimple convolution quotient has such a representative. Convolution by it translates supports.

Hypotheses: Algebraically closed characteristic-zero field via the comparison/base-extension interfaces.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.1/fibre-functor`, `SheafConvolutionOnAbelianVarieties:SC.0/derived-convolution`, `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`.

Construction or proof route:

1. Apply KW Proposition 10.1(b), which identifies a simple perverse object of Euler characteristic one.
2. Use dim ω=Euler characteristic and discard negligible direct summands before choosing the simple representative.

Acceptance checks:

- A rank-r skyscraper has Euler characteristic r; rank one is essential.
- A positive-dimensional smooth ample support cannot itself be a one-dimensional fibre object.

Source: [KW](https://arxiv.org/pdf/1111.4947v6), KW, Proposition 10.1(b), pp. 21–22; LS, proof of Lemma 4.1, p. 29. This is the support-theoretic interpretation of a one-dimensional tensor factor used by the translation argument.

Implementation status: unchecked.

## SC.2 — Arithmetic and geometric Tannaka groups

Construct the geometrically semisimple arithmetic category and its geometric category of direct summands of arithmetic pullbacks. Establish 1→G_geo→G_ar→Gal_k^alg→1 as a group-scheme exact sequence, with the Galois term the Tannaka envelope of continuous representations. Prove origin-normalized Galois normalization and geometric base-extension comparison for a fixed tensor generator.

Layer inputs: `EtaleDualityAndPerverseSheaves:EDC.6`, `EtaleDualityAndPerverseSheaves:EDC.7`, `MotivesAndAlgebraicCycles:MC.3`, `MotivesAndAlgebraicCycles:MC.6`, `SheafConvolutionOnAbelianVarieties:SC.0`, `SheafConvolutionOnAbelianVarieties:SC.1`.

### arithmetic-geometric-categories — Arithmetic and geometric convolution categories

**Construction.** Fix χ∈Π(A). Let C_ar be the full subcategory of Pχ/Nχ represented by geometrically semisimple perverse sheaves on A. Let C_geo be the full subcategory on A_k̄ consisting of direct summands of pullbacks of these objects. Both, with ωχ, are neutral Tannakian. For geometrically semisimple representatives K,L the quotient Hom is Hom_P(K,L) modulo maps factoring through N. C_geo is deliberately the category generated by arithmetic pullbacks, rather than the entire geometric perverse quotient.

Hypotheses: k has characteristic zero. Geometric semisimplicity is imposed on pullbacks, not on the arithmetic representation at the origin.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.1/admissible-perverse`, `SheafConvolutionOnAbelianVarieties:SC.1/fibre-functor`, `EtaleDualityAndPerverseSheaves:EDC.7`, `MotivesAndAlgebraicCycles:MC.3/tannakian-category`.

Construction or proof route:

1. Split each geometrically semisimple object into its negligible and nonnegligible geometric parts; Galois-stable isotypic projectors descend. This proves the Hom formula without asserting it for arbitrary objects.
2. Use the requested characteristic-zero proper-direct-image semisimplicity theorem for convolution. Semisimplicity then makes kernels, cokernels and geometric subobjects summands of arithmetic pullbacks.

Uses: LS, Lemma 2.8 — Verify each Tannakian exactness criterion.; LS, Lemma 2.9 — Locate Galois action in the arithmetic group..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `arithmeticCategory_pullback` | functoriality | Geometric pullback is exact tensor from C_ar to C_geo and agrees with ωχ on underlying vector spaces. |
| `semisimpleQuotient_hom` | characterisation | For the specified representatives, morphisms are honest perverse morphisms modulo negligible factorizations. |
| `geometricCategory_summand` | characterisation | Every object of C_geo is a direct summand, hence both subobject and quotient, of an arithmetic pullback. |
| `originGalois_embedding` | functoriality | A continuous finite-dimensional F-representation V of Gal(k̄/k) gives δ₀⊗V in C_ar; this embedding is full and exact tensor. |

Discriminating unit tests:

- `arithmetic_origin_extension`: A nonsplit extension of trivial Galois representations at the origin is geometrically semisimple, so arithmetic semisimplicity cannot be substituted.
- `geometric_origin_trivial`: The pullback of δ₀⊗V is a direct sum of dim V copies of the tensor unit.
- `geometric_not_every_object`: No object lacking an arithmetic-pullback summand presentation is admitted merely because it is a geometric perverse sheaf.

Acceptance checks:

- An arbitrary continuous Galois representation supported at 0 belongs to C_ar, even if the arithmetic representation is not semisimple.
- All morphisms used to form geometric summands are taken in the quotient with the stated Hom formula.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemmas 2.6–2.7, pp. 16–17. These are the two categories used in the exact sequence, including the restricted definition of the geometric one.

Atlas planet: Arithmetic convolution category.

Implementation status: unchecked.

### arithmetic-exact-sequence — Arithmetic–geometric exact sequence

**Theorem.** Let G_ar=Aut⊗(ωχ|C_ar), G_geo=Aut⊗(ωχ|C_geo), and Gal_k^alg be the Tannaka group of continuous finite-dimensional F-representations of Gal(k̄/k). There is an exact sequence of affine proalgebraic group schemes 1→G_geo→G_ar→Gal_k^alg→1: the first map is a closed immersion and the second faithfully flat, with scheme-theoretic kernel G_geo. Gal_k^alg is not identified with the profinite Galois group as a constant group scheme.

Hypotheses: Categories and fibre functors are those of SC.2; coefficient field F has characteristic zero.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.2/arithmetic-geometric-categories`, `MotivesAndAlgebraicCycles:MC.6`.

Construction or proof route:

1. Apply EHS Theorem A.1 through the requested MC.6 interface. The origin-supported Galois embedding is full and stable under subquotients, giving faithful flatness.
2. Every geometric object embeds in a pullback. Objects becoming sums of geometric units are precisely origin-supported arithmetic objects modulo N. The maximal geometric unit subobject descends, by its canonical origin-supported projector. These verify kernel exactness, not merely normality on rational points.

Acceptance checks:

- For A=Spec k, the geometric group is trivial and G_ar=Gal_k^alg.
- For k algebraically closed the arithmetic and geometric categories coincide.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 2.8, p. 18; EHS, Theorem A.1, pp. 20–21. The five categorical checks yield group-scheme exactness; the Galois term is explicitly a Tannaka envelope.

Atlas planet: Arithmetic–geometric exact sequence.

Implementation status: unchecked.

### galois-normalization — Galois normalization of geometric monodromy

**Theorem.** Suppose χ is Galois-invariant and K on A is geometrically semisimple and belongs to Pχ. Using the origin-normalized descent Lχ, the continuous Galois action on ωχK normalizes the geometric convolution group G_K and hence (G_K°)^der. These groups are viewed in GL(ωχK) through the same fibre functor; changing χ conjugates the comparison.

Hypotheses: For a geometrically semisimple K it suffices to check concentration on K, since geometric direct summands then inherit it.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.0/rank-one-local-system`, `SheafConvolutionOnAbelianVarieties:SC.2/arithmetic-exact-sequence`, `SheafConvolutionOnAbelianVarieties:SC.1/convolution-group`, `SheafConvolutionOnAbelianVarieties:SC.1/character-independence`.

Construction or proof route:

1. The normalized descent defines tensor automorphisms of the arithmetic fibre functor for each Galois element.
2. Take the image of the normal geometric subgroup in GL(ωχK); identity component and derived subgroup are characteristic and are therefore preserved.

Acceptance checks:

- Without Galois invariance of χ, this particular action on a single twisted fibre is not defined.
- Normalization does not assert that the Galois image contains the geometric group.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 2.9 and its proof, pp. 18–19. The action normalizes the whole geometric image before passing to its connected derived subgroup.

Atlas planet: Galois normalization.

Implementation status: unchecked.

### algebraically-closed-extension — Geometric extension comparison

**Comparison.** For algebraically closed characteristic-zero fields k⊂K, A/k, and a constructible perverse F-sheaf Q defined over k, pullback identifies the tensor-generated convolution categories of Q and Q_K, their negligible quotients, and the represented convolution groups after choosing compatible fibre functors. This comparison is for the categories generated by the given object; it does not claim that every perverse sheaf over K descends to k.

Hypotheses: Continuous adic sheaves with finite stratifications and the coefficient essential-image condition of EDC.6.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.1/convolution-group`, `SheafConvolutionOnAbelianVarieties:SC.0/quotient-convolution`, `EtaleDualityAndPerverseSheaves:EDC.6`.

Construction or proof route:

1. Use the requested fully faithful invariance of constructible Hom and geometric simple objects under algebraically closed extension.
2. Proper base change preserves convolution, cohomology and Euler characteristic. Full faithfulness and preservation of simple constituents identify all subquotients of tensor constructions of Q.

Acceptance checks:

- δₓ with x defined over k remains the same tensor generator after extension.
- New supports defined only over K are not included in this equivalence.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Uses in Lemma 3.14, pp. 25–26, and Lemmas 4.1 and 4.4, pp. 28–31. These comparisons are necessary when moving between a geometric generic fibre, a complex realization and a field of definition; the source uses them without a separate statement.

Implementation status: unchecked.

## SC.3 — Hypersurface Euler and Hodge data

For smooth ample H⊂A of ambient dimension n≥2 compute d=[H]^n/n!>0, N=n!d, χ(H,Ω_H^q)=(−1)^(n−1−q)dA(n,q), and e_top(H)=(−1)^(n−1)N. Define K_H=i_*F[n−1] and its distinguished representation of dimension N. For a good finite-order torsion twist over a p-adic field establish native Hodge–Tate weights −q with multiplicities dA(n,q), without a good-reduction assumption.

Layer inputs: `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `ClassicalArithmeticCompletion:CA.2`, `EtaleDualityAndPerverseSheaves:EDC.5`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.5`, `SchemeAndStackFoundations:SF.5`, `SheafConvolutionOnAbelianVarieties:SC.0`, `SheafConvolutionOnAbelianVarieties:SC.1`.

### hypersurface-euler-characteristics — Euler characteristics of a smooth ample divisor

**Theorem.** Let A be a complex abelian variety of dimension n≥2 and i:H↪A a smooth ample divisor, with L=O_A(H). Put d=[H]^n/n!=χ(A,L)>0 and N=[H]^n=n!d. Then χ(H,O_H)=(−1)^(n−1)d, e_top(H)=(−1)^(n−1)N, and χ(H,Ω_H^q)=(−1)^(n−1−q)d A(n,q) for 0≤q<n. Here A(n,q) counts permutations with q descents; for integral q outside [0,n−1] it is extended by zero. The n=0 convention of CA.2 is not overwritten.

Hypotheses: H is smooth and ample; intersection degree is an integer; n≥2 ensures connectedness.

Direct dependencies: `AbelianSchemesAndArithmeticModuli:A1/relative-invariant-forms`, `AbelianSchemesAndArithmeticModuli:A2/ample-cohomology-and-degree`, `SchemeAndStackFoundations:SF.5`, `ClassicalArithmeticCompletion:CA.2/eulerian-numbers`, `ClassicalArithmeticCompletion:CA.2/eulerian-basic-identities`.

Construction or proof route:

1. Use the imported abelian Riemann–Roch formula and vanishing to identify the positive integer d; the trivial tangent bundle and normal sequence give e_top(H) with the displayed sign.
2. Resolve Ω_H^q using the conormal exact sequence and the exterior powers of the trivial cotangent bundle of A. Apply line-bundle Riemann–Roch to the alternating Euler characteristics, and identify the resulting finite difference with the imported Eulerian formula.

Acceptance checks:

- For n=2 the Euler characteristics of O_H and Ω_H¹ are −d,d and e_top(H)=−2d.
- For n=3 the Ω-row is d,−4d,d and N=6d.
- For n=4 the unsigned row is d,11d,11d,d and N=24d.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemmas 3.1–3.4, pp. 19–21; equation (2), p. 20. This is the hypersurface specialization. General Riemann–Roch and the Eulerian family already have owners and are not new definitions here.

Atlas planet: Hypersurface Euler characteristics.

Implementation status: unchecked.

### distinguished-representation — Distinguished hypersurface representation

**Definition.** For the smooth ample divisor H in SC.3, define K_H=i_*F[n−1] in the perverse category. Its image under a good ωχ is the distinguished representation V_H of G_H=G(K_H). It is irreducible, has dimension N=n!d>0, and identifies with H^(n−1)(H,Lχ|H). The shift is n−1, not n. The subgroup used in monodromy theorems is G_H*=(G_H°)^der.

Hypotheses: Use a good character; H is geometrically connected and smooth.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.3/hypersurface-euler-characteristics`, `SheafConvolutionOnAbelianVarieties:SC.1/convolution-group`, `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`, `EtaleDualityAndPerverseSheaves:EDC.5/shifted-local-systems-perverse`.

Construction or proof route:

1. The rank-one constant local system on the smooth connected support shifted by its dimension is a simple perverse sheaf; finite closed pushforward preserves it.
2. Its fibre dimension is its perverse Euler characteristic, which changes the topological sign to N>0. Identify degree-zero cohomology of the shift with middle unshifted cohomology.

Uses: LS, Theorem 3.5 — Specify the faithful representation containing a classical normal subgroup.; LS, Theorem 4.7 — Identify the standard representation on each twisted middle cohomology summand..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `hypersurfaceObject_perverse_simple` | structure | i_*F[n−1] is a simple perverse object on A. |
| `distinguished_dim` | compatibility | dim V_H=[H]^n=n!d. |
| `distinguished_cohomology` | equivalence | For good χ, V_H≅H^(n−1)(H,Lχ\|H). |
| `hypersurfaceObject_translation` | functoriality | Translating H translates K_H by convolution with δₓ and compares the generated representation by a one-dimensional tensor twist. |

Discriminating unit tests:

- `distinguished_curve`: For n=2 the perverse shift is [1]; the dimension is 2d despite the negative topological Euler characteristic.
- `distinguished_threefold`: For n=3,d=1, dim V_H=6 and the relevant cohomology degree is 2.
- `distinguished_wrong_shift`: i_*F[n] is not in the perverse heart; its degree-zero fibre cannot be substituted for V_H.

Acceptance checks:

- The zero object cannot occur because N>0.
- For n=3,d=1 the representation dimension is 6.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), §3 before Theorem 3.5 and Lemma 3.7, p. 21; §4, p. 28. The distinguished dimension is the positive intersection degree. The shift and sign corrections distinguish it from the topological Euler characteristic.

Atlas planet: Distinguished representation.

Implementation status: unchecked.

### torsion-twist-hodge-tate — Hodge–Tate row of a generic torsion twist

**Theorem.** Let A/k be an n-dimensional abelian variety over a finite extension k/Q_p, let H⊂A be smooth ample, and let χ be a finite-order geometric character for which H^j(H_k̄,Lχ)=0 when j≠n−1. After a finite extension k′ defining χ, its coefficients and normalized descent, V=H^(n−1)(H_k̄,Lχ) is Hodge–Tate. In the R06.2 convention HT(cyclotomic)=+1, weight −q occurs with multiplicity d A(n,q), for 0≤q<n. Thus the nonnegative label q used in LS is the negative of the native Hodge–Tate weight. No good-reduction hypothesis is needed.

Hypotheses: p is the cohomological prime in this node; finite coefficients can be enlarged inside Q̄_p.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.3/hypersurface-euler-characteristics`, `SheafConvolutionOnAbelianVarieties:SC.0/rank-one-local-system`, `PadicHodgeTheory:R06.5/proper-smooth-de-rham-comparison`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.2/hodge-tate-graded-equivalence`, `AbelianSchemesAndArithmeticModuli:A3`.

Construction or proof route:

1. Realize the character-isotypic part of the cohomology of [m]⁻¹H using the finite étale A[m]-cover and its rational idempotent after coefficient extension. The idempotent is valid also when p divides m, since the coefficient field has characteristic zero.
2. Apply proper smooth comparison and its Hodge decomposition to each isotypic part. A torsion line-bundle twist has rational Chern character 1, so Riemann–Roch preserves the Ω-Euler characteristics.
3. Concentration of total cohomology and Hodge–de Rham degeneration isolate H^(n−1−q)(Ω^q⊗L), giving dA(n,q). Translate the source’s labels by h=−q.

Acceptance checks:

- For n=3,d=1 the native weights are 0,−1,−2 with multiplicities 1,4,1.
- Their total dimension is n!d, as required by the distinguished representation.
- An arbitrary non-finite-order character is not covered by the finite-cover proof.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 3.13, p. 25. The source supplies the multiplicities; the sign is adapted to the accepted supplier convention rather than silently changing that convention.

Atlas planet: Twisted Hodge–Tate weights.

Implementation status: unchecked.

## SC.4 — Microlocal structure and simple groups

Construct the clean conormal cycle ring with multiplicities and the clean characteristic-cycle comparison. Use microlocal factorization to prove minuscule connected monodromy and, for n>2, simplicity modulo centre for any smooth ample divisor with trivial stabilizer, including nonsymmetric divisors. Import the full minuscule table and spin dimensions, eliminate the spin and exceptional dimensions using 6|N, and relate inversion to the SL, symplectic and orthogonal alternatives.

Layer inputs: `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A2`, `ComplexComparisonPartII:C5`, `EtaleDualityAndPerverseSheaves:EDC.6`, `SchemeAndStackFoundations:SF.5`, `SheafConvolutionOnAbelianVarieties:SC.0`, `SheafConvolutionOnAbelianVarieties:SC.1`, `SheafConvolutionOnAbelianVarieties:SC.3`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly`, `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-4-the-spin-and-half-spin-representations`.

### clean-cycle-ring — Clean conormal cycle ring

**Construction.** For a complex abelian variety A of dimension n set V=H⁰(A,Ω_A¹) and T*A=A×V. Let L(A) be the free abelian group on irreducible conic Lagrangian n-dimensional subvarieties Λ⊂A×V that dominate V (the clean components). The clean part discards nondominant components. Define degΛ by the generic Gauss-map degree and extend additively. For two generators restrict to a common open U⊂V on which both Gauss maps are finite flat, take their fibre product, push its cycle forward along addition A×A×U→A×U with generic degrees and multiplicities, and take the unique clean closure. Extend bilinearly to obtain ◦. This is a commutative ring with unit Λ_{0}; deg(Λ₁◦Λ₂)=degΛ₁ degΛ₂.

Hypotheses: Cycle pushforward uses lengths and mapping degrees; an image support alone is insufficient.

Direct dependencies: `AbelianSchemesAndArithmeticModuli:A1/relative-invariant-forms`, `SchemeAndStackFoundations:SF.5`, `SheafConvolutionOnAbelianVarieties:SC.0/derived-convolution`.

Construction or proof route:

1. Construct the cycle group and clean projection from the imported algebraic-cycle operations. Shrink the finite flat Gauss open to make cycle intersections and addition pushforward well defined.
2. Show independence by restricting two choices to their common dense open and uniqueness of clean closure. Associativity comes from the triple fibre product; degrees multiply by finite-flat degree.

Uses: LS, Lemma 3.9 — Convert failure of group simplicity into a factorization of the hypersurface conormal.; K2, Proposition 6.1.1 — Interpret tensor factorization at the level of clean cycles..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `cleanPart_idempotent` | simp | Taking the clean part twice has the same result as taking it once. |
| `cleanConvolution_restrict` | characterisation | Restriction of Λ₁◦Λ₂ to a valid common Gauss open is the cycle pushforward of the finite-flat fibre product. |
| `cleanConvolution_ring` | structure | The operation is associative, commutative, bilinear, with unit the conormal to 0. |
| `gaussDegree_mul` | compatibility | Generic Gauss degree is a ring homomorphism to ℤ and is positive on nonzero effective clean cycles. |

Discriminating unit tests:

- `clean_point_product`: Λₓ◦Λᵧ=Λₓ₊ᵧ, with Gauss degree 1.
- `clean_zero_section`: For n>0 the zero section has clean part zero since its image in V is {0}.
- `clean_multiplicity`: (2Λₓ)◦(3Λᵧ)=6Λₓ₊ᵧ; replacing the product by its reduced support fails this test.

Acceptance checks:

- Positive-degree effective clean cycles have nonzero convolution.
- The zero section for a positive-dimensional A is discarded, but the conormal to a point has degree one.

Source: [K2](https://arxiv.org/pdf/1807.01929v2), K2, Definition 1.2.2 and Example 1.3.2, pp. 7–9; LS, proof of Lemma 3.9, p. 22. The clean convolution is a cycle operation; retaining pushforward multiplicities is essential to its degree formula.

Atlas planet: Clean conormal cycles.

Implementation status: unchecked.

### characteristic-cycle — Clean characteristic cycle of a perverse sheaf

**Construction.** Through regular-holonomic Riemann–Hilbert and the constructible comparison, attach to a perverse F-sheaf K on a complex abelian variety its effective characteristic cycle CC(K), and let cc(K) be its clean part. The map on Grothendieck groups is additive, respects convolution, and satisfies deg cc(K)=χ(A,K). For a smooth closed subvariety Z of dimension r with a rank-one constant local system, CC(i_*F[r]) is the conormal Λ_Z with multiplicity one. It respects translation, inversion duality and finite étale isogeny pushforward.

Hypotheses: Choose a coefficient-field identification for the complex microlocal realization and record independence of the resulting integral cycle. General RH belongs to ComplexComparisonPartII.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.4/clean-cycle-ring`, `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`, `ComplexComparisonPartII:C5`.

Construction or proof route:

1. Import the requested regular-holonomic/constructible RH and microlocal index interfaces; use their compatibility with proper direct image to compare convolution.
2. Pass to the clean part. Its Gauss degree gives the index formula; negligible components are exactly those discarded from the Euler-characteristic calculation.

Uses: LS, Lemma 3.8 — Apply the reduced irreducible-cycle criterion for minisculeness.; LS, Lemma 3.9 — Identify the hypersurface cycle in the factorization argument..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `characteristicCycle_add` | compatibility | Characteristic cycles add in perverse short exact sequences. |
| `cleanCharacteristicCycle_convolution` | compatibility | cc(pH⁰(K*L))=cc(K)◦cc(L). |
| `characteristicCycle_smooth` | simp | A rank-r local system shifted by the support dimension on a smooth closed support has cycle rΛ_Z. |
| `cleanCharacteristicCycle_index` | compatibility | deg cc(K)=χ(A,K), compatibly with finite-isogeny pushforward. |

Discriminating unit tests:

- `characteristicCycle_point`: The cycle of δₓ is a reduced conormal of degree 1.
- `characteristicCycle_constant`: For dim A>0, CC(F[n]) is the zero section with multiplicity one, whereas cc(F[n])=0.
- `characteristicCycle_rank`: A rank-two constant sheaf on a smooth support has multiplicity two, rather than a reduced cycle.

Acceptance checks:

- cc(δₓ)=Λₓ and its degree is 1.
- For the smooth ample H, cc(K_H)=Λ_H and degΛ_H=N.

Source: [K2](https://arxiv.org/pdf/1807.01929v2), K2, Definition 2.1.1 and §2, pp. 9–13; LS, proof of Lemma 3.9, p. 22. The application needs actual characteristic cycles and the index theorem, not only the existing regular-singular flat-connection equivalence on a smooth open.

Atlas planet: Characteristic cycle.

Implementation status: unchecked.

### microlocal-factorization — Microlocal tensor factorization

**Theorem.** Let K be a simple perverse object on a complex abelian variety, with positive Euler characteristic and translation stabilizer {0}. If Lie G(K) is not simple modulo its centre, there is an integer m>0 and nonzero effective clean cycles Λ₁,Λ₂, each of Gauss degree greater than 1, such that [m]_*cc(K)=Λ₁◦Λ₂. For a reduced irreducible conormal factor of the product, the addition correspondence supplies the rational support maps of K2 Lemma 5.2.2.

Hypotheses: Use the regular-holonomic realization, where translation stabilizer and the tensor group agree with the perverse realization.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.4/characteristic-cycle`, `SheafConvolutionOnAbelianVarieties:SC.1/convolution-group`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`.

Construction or proof route:

1. Use irreducibility on the identity component after killing translation stabilizers. Pull back to a central product cover of the connected reductive group and split its irreducible representation into two tensor factors.
2. Apply K2 Theorem 2.3.1 and the isogeny-clearing step to obtain integral effective cycles. The degree bounds reflect the nontrivial semisimple factors. Obtain the rational support maps from the reduced component as in Lemma 5.2.2.

Acceptance checks:

- Both factors must have degree >1; the trivial skyscraper factor is excluded.
- No inversion symmetry is assumed.

Source: [K2](https://arxiv.org/pdf/1807.01929v2), K2, Theorem 2.3.1; Lemma 5.2.2, pp. 25–26; Proposition 6.1.1, pp. 29–30. This criterion, rather than the symmetric-divisor theorem 6.2.1, supplies the input for the nonsymmetric hypersurface argument.

Atlas planet: Microlocal tensor factorization.

Implementation status: unchecked.

### minuscule — Minuscule hypersurface representation

**Theorem.** Let H⊂A be smooth ample with no nonzero translation stabilizer. The restriction of V_H to G_H° is irreducible minuscule. Its characteristic cycle is the single reduced irreducible clean conormal Λ_H and is invariant under no nontrivial translation. This assertion applies for n≥2.

Hypotheses: The dimension is N>0; use the faithful represented group, not a guessed simply connected covering group.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.3/distinguished-representation`, `SheafConvolutionOnAbelianVarieties:SC.4/characteristic-cycle`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`.

Construction or proof route:

1. Compute the smooth characteristic cycle with shift [n−1] and use the index to show it is clean.
2. Apply K1 Corollary 1.10 to the irreducible conormal. Its Gauss monodromy is transitive, producing one Weyl orbit of weights; the trivial translation stabilizer removes disconnected-component ambiguity.

Acceptance checks:

- Weights occur in one Weyl orbit with multiplicity one.
- The result does not by itself assert that G_H° has simple derived group.

Source: [K1](https://arxiv.org/pdf/1604.02389v3), K1, Corollary 1.10, p. 12; LS, Lemma 3.8, p. 21. The current K1 locator is Corollary 1.10; the citation “1.0” in LS is corrected. The representation is of the connected group, not of a Lie algebra called H.

Atlas planet: Minuscule representation.

Implementation status: unchecked.

### almost-simple — Simplicity modulo the centre

**Theorem.** If n>2 and H is a smooth ample divisor on A with trivial translation stabilizer, G_H° is simple modulo its centre; equivalently its nonzero derived Lie algebra is simple. This holds whether or not H is a translate of its inverse image under inversion.

Hypotheses: n>2 is needed for the Albanese/Lefschetz step.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.4/microlocal-factorization`, `SheafConvolutionOnAbelianVarieties:SC.4/minuscule`, `AbelianSchemesAndArithmeticModuli:A2`.

Construction or proof route:

1. Assuming failure of simplicity, factor [m]_*Λ_H as two effective clean cycles of degree >1. Trivial stabilizer makes [m]|H generically injective, hence the left side remains reduced and irreducible.
2. Use the rational maps from the support factorization, extend them to maps from H to A, and factor them through Alb(H)=A by weak Lefschetz (dim H≥2). The addition identity becomes an identity of homomorphisms plus translation.
3. Write g₁:A→B₁ for the induced surjective homomorphism and Z₁ for the image of H. If Z₁=B₁ its Gauss degree is zero. Otherwise H is an irreducible component of g₁⁻¹Z₁ by dimension. The connected kernel preserves every such component; a positive-dimensional kernel would preserve the ample divisor, which is impossible. Thus g₁ is an isogeny onto A. Trivial stabilizer makes its restriction H→Z₁ generically one-to-one: outside the intersections with finitely many distinct kernel translates there are no collisions. Isogeny pushforward of conormals therefore preserves the Gauss degree N, forcing the other clean factor to have degree 1. There is no need to infer that g₁ is an isomorphism, a stronger step not justified by the printed full-preimage assertion.

Acceptance checks:

- Record n>2 in every downstream use.
- A symmetric-divisor assumption is not silently added.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 3.9 and its proof, pp. 21–24. The proof adapts microlocal factorization using smoothness and the Albanese isomorphism; n=2 is outside the supplied proof.

Atlas planet: Simplicity of convolution monodromy.

Implementation status: unchecked.

### minuscule-alternatives — Minuscule representation alternatives

**Theorem.** For n>2 under the preceding hypotheses, the image G_H* in GL_N is either a standard classical group SL_N, Sp_N or SO_N, an image of a spin or half-spin representation, or the image of ∧^k of the standard SL_m representation with 1<k<m−1. The exceptional minuscule images of E₆ and E₇ have dimensions 27 and 56 and are excluded because 6 divides N=n!d. Spin dimensions are powers of 2, so the same divisibility excludes them. The ∧²SL₄ image is SO₆ and belongs to the classical case.

Hypotheses: Classify faithful images up to central isogeny; do not identify the image with SL_m when its exterior-power kernel is nontrivial.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.4/almost-simple`, `SheafConvolutionOnAbelianVarieties:SC.4/minuscule`, `SheafConvolutionOnAbelianVarieties:SC.3/hypersurface-euler-characteristics`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly`, `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-4-the-spin-and-half-spin-representations`.

Construction or proof route:

1. Use the complete requested minuscule table, including types A–D and E₆,E₇ and the nonexistence in the remaining exceptional types.
2. Apply Weyl dimensions or the spin supplier. For n≥3, divisibility by 6 rules out powers of 2, 27 and 56. Keep the standard representations and interior exterior powers.

Acceptance checks:

- For n=3,N=6 the ∧²SL₄ representation must not be eliminated as a nonclassical exception.
- No statement for all n=2 follows from this divisibility argument.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemmas 3.10 and 3.12, pp. 24–25. The dimension restriction is a hypersurface application of the imported classification; it is not a second highest-weight roadmap.

Implementation status: unchecked.

### inversion-duality — Inversion symmetry and the classical form

**Theorem.** When G_H* acts by a standard classical representation and N≥6, if H is not a translate of [−1]H, the image is SL_N. If H is such a translate, the resulting pairing on V_H is alternating for even n and symmetric for odd n, so the image is Sp_N or SO_N respectively. The pairing may be valued in a one-dimensional object; translating H to make it symmetric trivializes the geometric tensor factor. The connected derived image remains the stated group.

Hypotheses: Smooth ample H, trivial stabilizer and n>2; conclusions are up to change of basis of V_H.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.4/minuscule-alternatives`, `SheafConvolutionOnAbelianVarieties:SC.1/euler-one-skyscraper`, `SheafConvolutionOnAbelianVarieties:SC.0/derived-convolution`, `SheafConvolutionOnAbelianVarieties:SC.3/distinguished-representation`.

Construction or proof route:

1. A self-duality of the irreducible derived representation gives a one-dimensional tensor factor in the geometric generated category. Identify it with a skyscraper and compare supports to obtain inversion up to translation.
2. For the inverse implication translate by a half-point over the algebraic closure. Use Verdier/Poincaré duality and the shift n−1 to compute the symmetry as (−1)^(n−1). Connected derived subgroups kill the line-valued similitude character.

Acceptance checks:

- Even ambient dimension gives an alternating form and even N.
- Odd ambient dimension gives a symmetric form.
- An unspecified symmetric pairing cannot replace the Koszul calculation.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 3.11, p. 24. The parity is that of the support dimension n−1. The normal subgroup theorem concerns isometry groups, while arithmetic monodromy can lie in their similitude normalizers.

Atlas planet: Inversion and classical duality.

Implementation status: unchecked.

## SC.5 — Exterior-power counts and exceptional degrees

Define finite exterior-power subset multiplicities and the positive Pell-pair recurrence P₀=(1,5), P_(j+1)=(b,4b+1−a), with normalized threefold degree D_j=binom(a+b,a)/6 for j≥1. Derive the integer-weight Hodge constraint with its central shift and complement normalization. Prove the extremal width equation, classify n=2 and n=3 counts, and exclude the row for n=4. The first exceptional degree is 8855 and its representation dimension is 53130.

Layer inputs: `ClassicalArithmeticCompletion:CA.2`, `PadicHodgeTheory:R06.2`, `SheafConvolutionOnAbelianVarieties:SC.2`, `SheafConvolutionOnAbelianVarieties:SC.3`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`.

### wedge-multiplicity — Exterior-power weight multiplicity

**Definition.** For m≥0, an integer weight list w:Fin(m)→Z, k≥0 and t∈Z, define W(w,k,t) to be the number of subsets S⊂Fin(m) with |S|=k and Σ_{i∈S}w_i=t. Equivalently, for the finitely supported histogram h(j)=#{i:w_i=j}, this number is Σ_u Π_j binom(h(j),u(j)), over finitely supported u with 0≤u≤h, Σ_j u(j)=k and Σ_j j u(j)=t. Binomial coefficients use Nat.choose, including binom(a,a)=1; invalid occupancies contribute zero. This counts subsets, not ordered tuples.

Hypotheses: All weights are integers; h has finite support.

Direct dependencies: `mathlib:Finset.powersetCard`, `mathlib:Finset.card_powersetCard`, `mathlib:Nat.choose`.

Construction or proof route:

1. Filter the actual finite set of k-subsets by its integer sum. Group subsets by their histogram to obtain the product of binomial coefficients.
2. For complements use the total weight T=Σ_iw_i. Translate all weights by b to add kb to every k-subset sum.

Uses: LS, Lemma 3.14 — Express the Hodge cocharacter in an exterior-power representation.; LS, Proposition B.1 — Classify weight distributions equal to a multiple of an Eulerian row..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `wedgeMultiplicity_histogram` | equivalence | The subset count equals the finite histogram sum with binomial multiplicities. |
| `wedgeMultiplicity_complement` | compatibility | If k≤m and T=Σ_iw_i, W(w,m−k,t)=W(w,k,T−t). |
| `wedgeMultiplicity_translate` | compatibility | W(w+b,k,t+kb)=W(w,k,t). |
| `wedgeMultiplicity_zero_full` | simp | For k=0 the only weight is 0 with multiplicity one; for k=m the only weight is T with multiplicity one; for k>m all counts vanish. |
| `wedgeMultiplicity_total` | compatibility | Summing the finite support of t↦W(w,k,t) gives binom(m,k). |

Discriminating unit tests:

- `wedge_count_repeated`: For four weights all zero, the multiplicity at k=2,t=0 is 6, not 1 or 12.
- `wedge_count_empty`: For m=0,k=0 there is one empty subset of weight zero; all other weights have multiplicity zero.
- `wedge_count_excess`: For m=2,k=3 every multiplicity vanishes.
- `wedge_count_signed`: For weights −1,0,1 and k=2 the multiplicities at −1,0,1 are all 1.

Acceptance checks:

- For a constant-zero list of length m, W(w,k,0)=binom(m,k).
- Both complement and translation formulas must hold exactly, with their shifts.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 3.14, equation (3), pp. 25–27; Appendix B, equation (10), p. 93. The finite-list model removes the source’s unspoken finite-support condition and has a light real-bodied definition over pinned finite-set carriers.

Atlas planet: Exterior-power weights.

Implementation status: unchecked.

### exceptional-pairs — Exceptional Pell sequence

**Definition.** Define pairs P₀=(1,5), P_{j+1}=(b,4b+1−a) when P_j=(a,b), in natural numbers. All generated subtractions are exact, 0<a<b, and a²−4ab+b²=a+b in Z. This is the source sequence with P_j=(a(j+1),a(j+2)); thus its initial pairs are (1,5),(5,20),(20,76),(76,285). Every positive integer solution a≤b of the displayed equation occurs in exactly one P_j.

Hypotheses: The recurrence uses natural subtraction but the invariant proves 4b+1≥a at every step.

Direct dependencies: `mathlib:Nat.choose`.

Construction or proof route:

1. The real-bodied recursion supplies the pair. Preserve the quadratic identity and strict ordering by direct algebra.
2. For a>1 descend to (4a+1−b,a), whose first coordinate is (a²−a)/b and lies strictly between 0 and a. The a=1 case forces b=5. Strict growth gives uniqueness.

Uses: LS, Lemmas B.6–B.8 — Enumerate the surviving n=3 exterior exponents.; LS, Theorem 3.5 — Specify the exceptional degrees..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `exceptionalPair_zero_succ` | simp | P₀=(1,5) and P_{j+1}=(P_j.2,4P_j.2+1−P_j.1). |
| `exceptionalPair_positive` | structure | Both coordinates are positive and strictly increasing; the successor subtraction is exact. |
| `exceptionalPair_equation` | compatibility | Each pair solves a²−4ab+b²=a+b in Z. |
| `pell_classification` | characterisation | Positive a≤b solve the equation iff (a,b)=P_j for a unique j≥0. |

Discriminating unit tests:

- `pell_initial`: P₀=(1,5).
- `pell_second`: P₁=(5,20), not (5,19); the affine +1 term is necessary.
- `pell_third`: P₂=(20,76); swapping the two prior terms changes the answer.

Acceptance checks:

- The first permitted geometric threefold pair is P₁, since interior exterior powers require k>1.
- The defining equation is interpreted in Z to preserve the negative middle term.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma B.7, p. 96; sequence before Theorem 3.5, p. 21. This specialized inhomogeneous Pell recurrence belongs to the exterior-power obstruction, rather than replacing the general linear recurrence API in CA.2.

Atlas planet: Exceptional Pell sequence.

Implementation status: unchecked.

### exceptional-degree — Exceptional threefold degree

**Definition.** For P_j=(a,b), define D_j=binom(a+b,a)/6 in natural numbers. For j≥1 this division is exact, D_j>0, and binom(a+b,a)=6 binom(a+b−2,a−1). Geometric threefold exceptions are the normalized degrees d=D_j for j≥1; their distinguished dimensions are N=6D_j. The index j=0 is excluded by k>1.

Hypotheses: Natural-number division is part of the definition; exactness is a theorem from the Pell invariant.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.5/exceptional-pairs`, `mathlib:Nat.choose`.

Construction or proof route:

1. From the Pell equation derive (a+b)(a+b−1)=6ab. Combine it with the factorial ratio for consecutive binomial coefficients.
2. Use positivity of a,b and a>1 for j≥1. Translate between the zero-based pairs and one-based source indexing.

Uses: LS, Theorem 3.5 — State the precise excluded n=3 degrees.; LS, Proposition 3.15 — Convert subset dimensions to the normalized ample degree..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `exceptionalDegree_exact` | compatibility | For j≥1, 6D_j=binom(P_j.1+P_j.2,P_j.1). |
| `exceptionalDegree_binomial` | characterisation | For j≥1, D_j=binom(P_j.1+P_j.2−2,P_j.1−1). |
| `exceptionalDegree_positive` | structure | D_j>0 for j≥1. |
| `exceptionalDegree_dimension` | compatibility | The representation dimension for the j-th exception is 6D_j, not D_j. |

Discriminating unit tests:

- `exceptional_degree_first`: D₁=binom(25,5)/6=8855.
- `exceptional_dimension_first`: 6D₁=53130; a definition returning 53130 for d fails.
- `exceptional_index_zero`: D₀=1 is computed but is excluded from the geometric exception set because its exponent is 1.

Acceptance checks:

- D₁=8855 and N₁=53130.
- The formal value D₀=1 does not make it an interior exterior-power threefold exception.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Theorem 3.5(2), p. 21; Lemmas B.6–B.8, pp. 95–96. The normalization by 6 is essential: the extraction’s first exceptional degree confused d with N.

Atlas planet: Exceptional threefold degrees.

Implementation status: unchecked.

### hodge-wedge-constraint — Hodge constraint on exterior powers

**Theorem.** If G_H* is the image of SL_m acting on ∧^k of its standard representation, with 1<k<m−1, then there exist integer weights w:Fin(m)→Z and s∈Z such that W(w,k,s+q)=dA(n,q) for every q∈Z. The Eulerian row is zero outside 0≤q<n. Complementing k-subsets and using Eulerian symmetry permits the normalization 2k≤m. Finite support and positive d are part of the assertion.

Hypotheses: Smooth ample H of dimension n−1 over an algebraically closed characteristic-zero field; trivial translation stabilizer; use compatible complex and p-adic realizations.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.2/galois-normalization`, `SheafConvolutionOnAbelianVarieties:SC.2/algebraically-closed-extension`, `SheafConvolutionOnAbelianVarieties:SC.3/torsion-twist-hodge-tate`, `SheafConvolutionOnAbelianVarieties:SC.5/wedge-multiplicity`, `PadicHodgeTheory:R06.2`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ClassicalArithmeticCompletion:CA.2/eulerian-basic-identities`.

Construction or proof route:

1. Choose a finite-order good character and a finitely generated field of definition. Spread the finite normalizer tensor constraints and specialize to a number-field point, retaining the inclusion of the arithmetic image in the exterior-power normalizer.
2. Use the requested Hodge–Tate cocharacter in the Zariski closure of the Galois image. Compare its graded fibre functor with the ordinary fibre functor over C_p; this comparison is required and is not a canonical equality of fibres.
3. The connected cocharacter lands in the connected exterior-power normalizer. After pulling it back by t↦t^k, lift to GL_m. The lifted standard weights are congruent modulo k because their differences are adjoint weights. Remove their common fractional part into an integral central shift s. Reverse signs to match the native weights −q with the source’s q labels.
4. Count k-subsets of the resulting integer weights and apply the Hodge–Tate row. For complementary exponent use W-complement and A(n,q)=A(n,n−1−q).

Acceptance checks:

- Summing the row gives binom(m,k)=n!d.
- Discarding the common fractional part without a shift would give an incorrect constraint.
- No extension-closure assertion for the whole Hodge–Tate category is used.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 3.14, equation (3), pp. 25–27. The normalizer is an image of GL_m with a possible order-two outer component at m=2k. The cocharacter is connected and the central shift is retained.

Atlas planet: Hodge exterior-power constraint.

Implementation status: unchecked.

### extremal-width — Extremal occupancies and weight width

**Theorem.** Assume n≥2,d≥1,1<k<m−1,2k≤m and W(w,k,s+q)=dA(n,q) for every integral q. Let h be the finite weight histogram and u_min,u_max the unique histograms of minimum- and maximum-weight k-subsets (the subsets themselves need not be unique). Let v be the greatest occupied weight of u_min and v′ the least of u_max. Then v≤v′, u_min fills all h below v and none above, u_max fills all h above v′ and none below, and Σ_{i<v}(v−i)h(i)+Σ_{i>v′}(i−v′)h(i)+k(v′−v)=n−1. Every summand is nonnegative.

Hypotheses: Uniqueness concerns occupancies, not choices among repeated equal weights.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.5/wedge-multiplicity`, `ClassicalArithmeticCompletion:CA.2/eulerian-basic-identities`.

Construction or proof route:

1. A weight-reducing exchange fills the lowest available slots, and the analogous highest exchange gives u_max. The bound 2k≤m implies v≤v′.
2. The least and greatest nonzero row indices are s and s+n−1, since A(n,0)=A(n,n−1)=1 and the interior is positive. Subtract the two extremal sums, adding and subtracting kv and kv′.

Acceptance checks:

- Repeated weights may give many subsets with the same extremal histogram.
- For n=2 the width is exactly 1, so one cannot replace the equation by a mere inequality.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemmas B.2–B.3, pp. 93–94. This is the finite width equation that reduces the classification to occupancy patterns.

Atlas planet: Extremal weight width.

Implementation status: unchecked.

### surface-classification — Surface exterior-power classification

**Theorem.** Under the counting hypotheses of extremal-width, if n=2 then m=2k and d=binom(2k−1,k). Up to translating and reflecting all weights, the histogram is (2k−1)[v]+[v+1]. For k=2 this is the classical m=4 case; for k>2 it is the separate surface alternative. Without exponent normalization replace k by min(k,m−k).

Hypotheses: This is a combinatorial surface statement; it does not extend the geometric simplicity theorem to n=2.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.5/extremal-width`, `mathlib:Nat.choose`.

Construction or proof route:

1. The width equation equals 1; since k≥2, its only nonzero term is one singleton at an adjacent weight.
2. Equate the two endpoint binomial coefficients to obtain h(v)=2k−1, then m=2k.

Acceptance checks:

- At k=3,m=6, weights 0 repeated five times and 1 once give d=10.
- At k=2,m=4 the row is 3,3 and d=3.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma B.4, p. 94. The source computes the surface alternative using normalized k; the plan keeps that normalization explicit.

Implementation status: unchecked.

### threefold-classification — Threefold exterior-power classification

**Theorem.** Under the counting hypotheses of extremal-width, if n=3 then either m=4,k=2,d=1, or there is j≥1 with m=P_j.1+P_j.2, k=P_j.1 and d=D_j. Outside the m=4 case the histogram is h(v−1)=h(v+1)=1, h(v)=m−2 and zero elsewhere. These statements concern the necessary alternatives of a weight realization; they do not assert existence of an abelian hypersurface for every pair.

Hypotheses: Use 2k≤m; complementation recovers the unnormalized statement.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.5/extremal-width`, `SheafConvolutionOnAbelianVarieties:SC.5/exceptional-degree`.

Construction or proof route:

1. Enumerate the partitions of width 2. A gap of two excludes one parity of weights; a double endpoint or k(v′−v)=2 forces m=4,k=2.
2. In the remaining three-slot pattern, endpoint coefficient binom(m−2,k−1)=d and the middle coefficient equation imply (m−k)²−4(m−k)k+k²=m.
3. Apply the positive Pell classification with a=k,b=m−k. Since k>1, j≥1. The total dimension gives d=D_j.

Acceptance checks:

- Weights 0,0,1,1 with k=2 give row 1,4,1.
- For j=1 the histogram 1,23,1 with k=5 gives the scaled row 8855,35420,8855.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemmas B.5–B.8, pp. 95–96. The first exceptional d is 8855, not 53130, and the one-based source index i≥2 corresponds to j≥1.

Atlas planet: Threefold exterior-power exceptions.

Implementation status: unchecked.

### fourfold-impossibility — Fourfold exterior-power obstruction

**Theorem.** There is no integer weight list and interior exponent 1<k<m−1 with W(w,k,s+q)=dA(4,q) for every q∈Z and d≥1. In particular the row d(1,11,11,1) has no such realization, including the exterior-square m=4 case.

Hypotheses: Finite list; k may be normalized by complementation.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.5/extremal-width`, `mathlib:Nat.choose`.

Construction or proof route:

1. Use width 3. When v′>v only k=2 or 3 can occur; list the resulting endpoint occupancies and compare the adjacent binomial ratios.
2. When v′=v, distribute the width among the slots v±1,v±2,v±3. Eliminate each pattern by the required row ratios 11 and symmetry; the source’s computations use actual binomial multiplicities.

Acceptance checks:

- The Eulerian row for n=4 is 1,11,11,1; using 1,4,1 would test the wrong dimension.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma B.9, pp. 96–99. The finite occupancy analysis rules out the entire n=4 row.

Implementation status: unchecked.

## SC.6 — Eulerian exclusion and classical monodromy

Establish both adjacent occupancy ratios and all five q=2 terms. Prove the proof-specific Eulerian comparisons using CA.2’s existing Eulerian family and bounds; exact cutoff and small-case certificates are gap G1. Exclude the first large-ratio regime, prove k<n, then exclude the second regime through the final q=6 coefficient contradiction. Deduce the exterior-power classification and classical normal subgroup theorem for n>2, with only the Pell degree exceptions when n=3.

Layer inputs: `ClassicalArithmeticCompletion:CA.2`, `SheafConvolutionOnAbelianVarieties:SC.4`, `SheafConvolutionOnAbelianVarieties:SC.5`.

### ratio-identities — Adjacent occupancy ratios

**Theorem.** Under the normalized counting hypotheses, put h=histogram(w), u₀=u_min, v=max supp u₀, r=u₀(v), t=h(v)−r, and D=Π_i binom(h(i),u₀(i))=d. Define R_a=h(v−1)t/(r+1) and R_b=h(v+1)r/(t+1) as rational numbers. They are the ratios to D of occupancies u₀+[v]−[v−1] and u₀+[v+1]−[v], respectively, with invalid occupancies assigned count zero. Then R_a+R_b=A(n,1), and R_aR_b≤h(v−1)h(v+1), strictly if both adjacent histogram values are positive. At q=2 the sum of the five ratios from u₀+[v]−[v−2], u₀+2[v]−2[v−1], u₀+[v+1]−[v−1], u₀+2[v+1]−2[v], u₀+[v+2]−[v] equals A(n,2).

Hypotheses: r≥1,t≥0. Use rational ratios; do not truncate division in N.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.5/extremal-width`, `mathlib:Nat.choose`.

Construction or proof route:

1. Enumerate modifications increasing the minimum weight by one or two. Divide their binomial products by the positive extremal count.
2. Cancel factorial ratios. The product factor tr/((r+1)(t+1)) is strictly below one; when an adjacent h-value is zero only the non-strict product inequality remains.

Acceptance checks:

- For the surface histogram 5[0]+[1], k=3, R_a=0,R_b=1 and both sides of the product bound are zero.
- The five q=2 terms, including those with zero occupancy count, sum to the full Eulerian coefficient.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Appendix B.2, pp. 99–100, equations (13)–(14), Lemma B.10. The strict inequality printed in B.10 needs a nonzero-adjacent-product condition. The corrected form suffices for every subsequent bound.

Atlas planet: Occupancy ratios.

Implementation status: unchecked.

### eulerian-comparisons — Eulerian comparison certificates

**Theorem.** Write A_j=A(n,j). The bespoke comparisons required in SC.6 are: for n≥5, (n−1)²/2<A₁−1, 28A₂<3(A₁−1)², n+1+(n−1)A₁/2<A₂, 78nA₄<(A₁−1)³, 10A₂<A₁², 341A₅<A₁³, (n−1)A₁/2+4A₃/A₁+1+sqrt(2A₅)+1<A₂, 6nA₄<A₁²A₂, and 100A₆<(A₂−1)². For n≥11 require 2A₁+sqrt(48A₃A₁/11)+1+48A₃/(11A₁)+sqrt(96A₅/(11A₁))+1<A₂. For 6≤n≤19 require 2A₁+sqrt(2n!)+1+2(sqrt(2n!)+1)²/A₁²+sqrt(96A₅/(11A₁))+1<A₂. For 5≤n≤10 require sqrt(36A₃A₁/11)+1+36A₃/(11A₁)+sqrt(72A₅/(11A₁))+1<A₂ and sqrt(48A₃A₁/11)+1+sqrt(96A₅/(11A₁))+1<A₂. The small n=5 variant in B.16 is 2A₁+3+sqrt(96A₅/(11A₁))+1<A₂. Supplement these by the finite n=5,…,10 binomial lower bounds in B.11–B.12 after each allowed r,t,adjacent occupancy is enumerated. All square roots and divisions here are in R with positive denominators.

Hypotheses: These ranges are the consuming ranges, not the source’s sometimes false “all n” wording.

Direct dependencies: `ClassicalArithmeticCompletion:CA.2/eulerian-power-bounds`, `ClassicalArithmeticCompletion:CA.2/eulerian-small-descent-bounds`, `ClassicalArithmeticCompletion:CA.2/eulerian-square-separation`, `ClassicalArithmeticCompletion:CA.2/eulerian-ratio-bound`, `ClassicalArithmeticCompletion:CA.2/eulerian-basic-identities`.

Construction or proof route:

1. Use the imported C.1/C.3 exponential bounds for large n to give an explicit cutoff for each fixed-index comparison; clear positive denominators and bound radicals above by rational squares.
2. Below each cutoff compute Eulerian numbers by the imported recurrence with exact integers. The appendix’s ancillary floating-point program is diagnostic only: it cannot certify exact inequalities or universal ranges.
3. The exact uniform cutoffs and all finite B.11/B.12 occupancy certificates remain gap G1. The target statements and the consuming nodes are fixed; no floating-point output is accepted as a proof.

Acceptance checks:

- Use exact arithmetic for the n=5 and n=11 boundary checks.
- Reject the source’s broader all-n claims when their low-index rows vanish.
- A finite numerical sweep is evidence for a plan, not a proof of the infinite range.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Appendix B, pp. 101–115, comparisons cited in B.11–B.31; Appendix C, pp. 116–118; ancillary eulerian.py. The general Eulerian family and C.1–C.5 are imported from CA.2; this node owns only the specialized comparison certificates needed by this proof.

Implementation status: unchecked.

### first-ratio-exclusion — Exclusion of the first large-ratio regime

**Theorem.** Under the normalized counting hypotheses with n≥5, it is impossible that R_a≥A(n,1)/2. The argument uses this particular ratio; it does not exclude the R_b regime by symmetry.

Hypotheses: R_a,R_b are the rational quantities of ratio-identities.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.6/ratio-identities`, `SheafConvolutionOnAbelianVarieties:SC.6/eulerian-comparisons`, `ClassicalArithmeticCompletion:CA.2/eulerian-ratio-bound`.

Construction or proof route:

1. B.11 and B.12 give h(v−1)=1 and h(v−2)≤2. For j=1,2, B.13–B.14 give h(v+j)(h(v+j)−1)≤(48/11)A(n,2j+1)R_a, improved to 36/11 if r≥2. Keep R_a in this sharper intermediate bound.
2. Bound each of the five q=2 ratios. Their sum is less than A(n,2) for n≥11, so 5≤n≤10. The q=s+3 occupancy in B.16 excludes filled weights below v−1; then B.17 forces r=1.
3. With r=1 the q=2 ratios a,b,d vanish; the remaining c,e estimates contradict the finite comparison in eulerian-comparisons. G1 records the missing exact certificate proofs.

Acceptance checks:

- Do not replace “R_a” by “one of the two ratios”.
- At n=11 the sharper intermediate R_a bounds are needed by the five-term estimate.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemmas B.11–B.18, pp. 101–107. This preserves the distinction lost by the routed extraction and uses the A(n,3),A(n,5) bounds with their actual indices.

Atlas planet: First large-ratio exclusion.

Implementation status: unchecked.

### large-k-exclusion — Exclusion of large exterior exponents

**Theorem.** Under the normalized counting hypotheses with n≥5, k<n. Indeed, if k≥n then the width equation forces v=v′; the adjacent-ratio product bound shows that one ratio is less than 1 and the other greater than A(n,1)−1, and neither possibility can occur.

Hypotheses: The width bound gives h(v−1)+h(v+1)≤n−1 only after v=v′ has been established.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.6/first-ratio-exclusion`, `SheafConvolutionOnAbelianVarieties:SC.6/ratio-identities`, `SheafConvolutionOnAbelianVarieties:SC.6/eulerian-comparisons`.

Construction or proof route:

1. Apply B.19 to the quadratic roots using the corrected non-strict product bound. The R_a-large alternative was already excluded.
2. For R_b>A₁−1, B.20 forces h(v+1)≤1. The five q=2 ratios are respectively <1,<1,≤n−1,0,≤(n−1)A₁/2.
3. Their sum is ≤n+1+(n−1)A₁/2<A₂. Use G1’s exact comparison rather than the ancillary code’s output.

Acceptance checks:

- The conclusion is k≤n−1, not a statement bounding m.
- The surviving R_b case is treated separately from R_a.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemmas B.19–B.21, pp. 108–110. The proof depends on the large-k width collapse; its neighboring multiplicity bounds are not asserted for arbitrary k.

Atlas planet: Large exponent obstruction.

Implementation status: unchecked.

### second-ratio-exclusion — Exclusion of the second large-ratio regime

**Theorem.** Under the normalized counting hypotheses with n≥5 and k≤n−1, it is impossible that R_b≥A(n,1)/2. Combined with R_a+R_b=A(n,1), this excludes every n≥5 weight realization.

Hypotheses: Let r be the least positive integer with h(v−r)>0 after u₀(v)=1 has been proved; r here is a gap length, not the earlier occupancy variable.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.6/large-k-exclusion`, `SheafConvolutionOnAbelianVarieties:SC.6/ratio-identities`, `SheafConvolutionOnAbelianVarieties:SC.6/eulerian-comparisons`, `ClassicalArithmeticCompletion:CA.2/eulerian-square-separation`.

Construction or proof route:

1. B.22–B.25 give h(v+1)≥A₁/(2(n−1))≥4 and u₀(v)=1, treating R_a=0 and R_a>0 separately. For gap length r=1, B.26 gives u₀(v−1)≤1 and B.27 contradicts A₂>(n−1)A₁/2+4A₃/A₁+1+sqrt(2A₅)+1. Use the surviving q=2 terms a,c,e.
2. For r≥2, the q≤r equations give h(v+i)=dA(n,i), 0≤i<r, and h(v+r)=dA(n,r)−d(d−1)h(v−r)/2. The q=3r−2 occupancy implies A(n,3r−2)≥A(n,r−1)(dA(n,r−1)−1)/2.
3. Apply the imported square-separation bound for 3≤r≤n−2; if r=n−1 the right row entry A(n,3r−2) is zero and the contradiction is immediate. Thus r=2 and d<3A₄/A₁². This bound alone is not a contradiction.
4. B.31 uses 6nA₄<A₁²A₂ to get d<A₂/(2n), hence h(v+2)≥3dA₂/4. Its q=6 occupancy gives A₆≥9(A₂−1)²/32, contradicting 100A₆<(A₂−1)². Certificate completion is G1.

Acceptance checks:

- The r=1 and r≥2 branches are both necessary.
- The bound d<3A₄/A₁² can exceed 1 and cannot alone finish the proof.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemmas B.22–B.31, pp. 110–115. The plan includes the final q=6 contradiction, the endpoint omitted by a direct C.4 invocation, and the corrected coefficients in B.27–B.29.

Atlas planet: Second large-ratio exclusion.

Implementation status: unchecked.

### exterior-power-classification — Exterior-power Eulerian classification

**Theorem.** Let n≥2,d≥1 and let a finite integer weight list w of length m, an integer s and 1<k<m−1 satisfy W(w,k,s+q)=dA(n,q) for every q∈Z. Put k₀=min(k,m−k). Then either m=4,k=2; or n=2, k₀>2 and d=binom(2k₀−1,k₀); or n=3 and d=D_j for some j≥1. These are necessary alternatives for a counting solution. No n=4 or n≥5 solution exists.

Hypotheses: Use the integer zero-extension of Eulerian numbers and finite support of weights.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.5/surface-classification`, `SheafConvolutionOnAbelianVarieties:SC.5/threefold-classification`, `SheafConvolutionOnAbelianVarieties:SC.5/fourfold-impossibility`, `SheafConvolutionOnAbelianVarieties:SC.6/first-ratio-exclusion`, `SheafConvolutionOnAbelianVarieties:SC.6/second-ratio-exclusion`.

Construction or proof route:

1. Normalize k using complementation and Eulerian symmetry. Apply the n=2,3,4 results.
2. For n≥5, first-ratio-exclusion gives R_a<A₁/2, so R_b>A₁/2. Use large-k-exclusion and then second-ratio-exclusion.

Acceptance checks:

- The m=4,k=2 case is retained because its image is classical SO₆.
- The first n=3 normalized degree is 8855.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Proposition 3.15, p. 27; Proposition B.1, p. 93, with proof pp. 93–115. The finite-support condition and complement normalization make the source’s infinite occupancy sum an unambiguous finite counting theorem.

Atlas planet: Exterior-power classification.

Implementation status: unchecked.

### classical-monodromy — Classical convolution monodromy

**Theorem.** Let A/C have dimension n>2, and H⊂A be smooth ample with trivial translation stabilizer. Write d=[H]^n/n! and N=n!d. If n=3 assume d≠D_j for every j≥1; for n≥4 impose no additional numerical exception. Then G_H contains as a normal subgroup SL_N when H is not a translate of [−1]H; if it is such a translate, the normal subgroup is Sp_N for even n and SO_N for odd n. Equivalently these are the connected derived images G_H*. The printed n=2,d=28 exception in Theorem 3.5 is vacuous under n>2 and is not used to infer a surface theorem.

Hypotheses: Coefficients F=Q̄_ℓ; group comparisons are up to inner conjugacy; all characteristic-zero extensions use the SC.2 comparison.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.4/minuscule-alternatives`, `SheafConvolutionOnAbelianVarieties:SC.4/inversion-duality`, `SheafConvolutionOnAbelianVarieties:SC.5/hodge-wedge-constraint`, `SheafConvolutionOnAbelianVarieties:SC.6/exterior-power-classification`.

Construction or proof route:

1. Simplicity and minisculeness reduce the representation to the listed alternatives. Divisibility excludes spin and exceptional minuscule dimensions.
2. Apply the Hodge exterior-power constraint and the Eulerian classification; the only interior power surviving outside the stated threefold exception is ∧²SL₄=SO₆.
3. Use inversion duality to select the classical group. It is the connected derived subgroup of a normal geometric image, hence normal in the whole convolution group.

Acceptance checks:

- For n≥4 there is no degree exception.
- At n=3 the theorem excludes d=8855 as a possible nonclassical case, without asserting such a hypersurface exists.
- Nothing here proves an n=2 theorem.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Theorem 3.5, p. 21; proof, p. 27. This is the main geometric output, with positive N, the actual n>2 range, and normalized exceptional degrees.

Atlas planet: Classical convolution monodromy.

Implementation status: unchecked.

## SC.7 — Generic twists in hypersurface families

Prove rigidity of constant tensor constituents for a nonconstant-up-to-translation smooth ample family with trivial generic stabilizer and simple irreducible connected derived group. Establish the full product G^c on coordinate axes, relative generic vanishing with no constant invariant vectors, and a finite representation battery detecting product containment. Deduce generic simultaneous-twist monodromy containing (G*)^c normally in the direct sum of its distinguished actions, with higher direct images vanishing outside middle degree.

Layer inputs: `EtaleDualityAndPerverseSheaves:EDC.5`, `EtaleDualityAndPerverseSheaves:EDC.6`, `EtaleDualityAndPerverseSheaves:EDC.7`, `MordellLawrenceVenkatesh:LV.0`, `SheafConvolutionOnAbelianVarieties:SC.0`, `SheafConvolutionOnAbelianVarieties:SC.1`, `SheafConvolutionOnAbelianVarieties:SC.2`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`.

### constant-part-rigidity — Rigidity of constant tensor constituents

**Theorem.** Let X/C be smooth connected, A/C an abelian variety, and Y⊂X×A a smooth proper family of ample hypersurfaces. On A_η̄ let K=i_*F[n−1], G=G(K), G*=(G°)^der. Assume the geometric generic hypersurface has trivial translation stabilizer, G* is noncommutative connected simple with irreducible distinguished representation, and the family is not generically a translate of a fixed hypersurface by a section of A (equivalently here after spreading the unique translation). If a simple object in ⟨K⟩⊗ has a representative pulled back from A_C, then G* acts trivially on it.

Hypotheses: Simple means simple modulo negligible objects, with a nonnegligible simple representative.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.2/algebraically-closed-extension`, `SheafConvolutionOnAbelianVarieties:SC.1/euler-one-skyscraper`, `SheafConvolutionOnAbelianVarieties:SC.2/arithmetic-geometric-categories`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `MordellLawrenceVenkatesh:LV.0/two-factor-lie-goursat`.

Construction or proof route:

1. Compare two independent geometric generic fibres over X². Goursat gives either independent simple derived factors or a graph relation modulo scalars.
2. In the independent case a constant constituent is pulled back in both ways, so both simple factors act trivially. In the graph case use enough independent points of X^r to kill the finite outer-automorphism ambiguity.
3. The remaining scalar relation gives a one-dimensional factor between the two distinguished objects. Identify it with a skyscraper, hence translation. Trivial stabilizer makes the translating section unique and allows descent, contradicting the nonconstant hypothesis.

Acceptance checks:

- A family obtained by translating a fixed H must be excluded.
- The result concerns constant tensor constituents, not all objects of the generated category.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 4.1, pp. 28–29. The graph alternative is reduced to translation by the Euler-one classification; an arbitrary family of representations would not suffice.

Atlas planet: Constant-part rigidity.

Implementation status: unchecked.

### independent-coordinate-factors — Independent coordinate convolution factors

**Theorem.** For abelian varieties A₁,A₂ over an algebraically closed characteristic-zero field and perverse K_j, the convolution group of z₁*K₁⊕z₂*K₂ on A₁×A₂, where z₁(a)=(a,0),z₂(b)=(0,b), is G(K₁)×G(K₂). Iterating, the axis-supported sum of c copies of K has group G^c. Under constant-part-rigidity, (G*)^c acts trivially on every constant tensor constituent of this axis-supported sum on A^c_η̄.

Hypotheses: c≥1; all good characters and fibre comparisons are chosen compatibly.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.7/constant-part-rigidity`, `SheafConvolutionOnAbelianVarieties:SC.1/convolution-group`, `SheafConvolutionOnAbelianVarieties:SC.0/derived-convolution`, `EtaleDualityAndPerverseSheaves:EDC.6`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Construction or proof route:

1. A common quotient of the two generated groups would give isomorphic objects supported on the two different axes. Their common support is the origin, so the common quotient is trivial.
2. Apply induction on c. For a constant constituent nontrivial on a coordinate G*, twist generically and push to that coordinate. Proper base change preserves constancy, contradicting constant-part-rigidity. The required exact tensor pushforward restriction is included in the EDC.6 request.

Acceptance checks:

- At c=1 the result gives G.
- At c=2 it gives G×G even when K₁ and K₂ are isomorphic as sheaves on their original factors.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 4.2 and Corollary 4.3, p. 30. The ambient group is G^c, not G. Independence follows from different axes, whereas K⊕K on the same A has diagonal group.

Atlas planet: Independent coordinate factors.

Implementation status: unchecked.

### relative-generic-vanishing — Generic twists with no constant invariants

**Theorem.** Let X/C be smooth connected with function field C(X), A/C an abelian variety, and K a geometrically semisimple perverse F-sheaf of geometric origin on A_C(X), defined over C(X), not just its algebraic closure. Suppose no simple geometric constituent is pulled back from A_C. Outside a finite union of torsion cosets in Π(A), H^j(A_C(X)̄,K⊗Lχ)=0 for j≠0 and H⁰(A_C(X)̄,K⊗Lχ)^Gal(C(X)̄/C(X))=0. Characters from A_C have their canonical descent to C(X).

Hypotheses: Geometric origin and semisimplicity are needed for the decomposition/constituent argument; X may be shrunk to spread K.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.0/generic-vanishing`, `SheafConvolutionOnAbelianVarieties:SC.2/algebraically-closed-extension`, `SheafConvolutionOnAbelianVarieties:SC.0/rank-one-local-system`, `EtaleDualityAndPerverseSheaves:EDC.5/fibre-dimension-perverse-amplitude`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.7`.

Construction or proof route:

1. Spread K to K′ on A×X with K′[dim X] perverse. First exclude the bad loci of K and of the finitely many perverse cohomology objects of Rπ_*K′ for π:A×X→A.
2. If a twisted generic fibre has a nonzero invariant, proper decomposition and intermediate extension give a constant summand of its pushforward to X. Its H⁰ is nonzero.
3. Künneth/Leray, the projection formula and generic vanishing then give nonzero pH⁰(Rπ_*K′). The fibre-dimension bound provides its natural map to Rπ_*K′. Adjunction yields a constant perverse constituent of K, a contradiction.

Acceptance checks:

- A nonzero constant constituent violates the hypothesis and can produce invariants.
- The exceptional translates are torsion because the relevant sheaves have geometric origin.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 4.4 and its proof, pp. 30–32. The source combines concentration with the disappearance of invariant vectors. A sheaf only defined over the algebraic closure would not carry the stated Galois action.

Atlas planet: Relative generic vanishing.

Implementation status: unchecked.

### detecting-representations — Finite representations detecting a simple product

**Construction.** Let G* be a noncommutative connected simple algebraic group over an algebraically closed characteristic-zero field acting faithfully and irreducibly on V, and let N=N_GL(V)(G*). For c≥1 construct a finite list T of irreducible representations of N^c with no (G*)^c-invariants such that for every reductive algebraic subgroup B⊂N^c, (G*)^c⊂B iff T^B=0 for every T in the list. Choose a Jordan bound J for subgroups of N finite modulo scalars and an N-representation W of dimension >J restricting irreducibly to G*. Take the irreducible constituents of End(W)/F and End(Lie G*)/F in each coordinate, and the cross-coordinate representations Lie(G*)_i⊗Lie(G*)_j∨ for i<j.

Hypotheses: Reductivity of B and characteristic zero are essential; the normalizer and all tensor constructions use the actual faithful image.

Direct dependencies: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`, `MordellLawrenceVenkatesh:LV.0/lie-algebra-goursat`, `MordellLawrenceVenkatesh:LV.0/two-factor-lie-goursat`.

Construction or proof route:

1. Use the requested Jordan bound and arbitrarily large normalizer-extendible irreducibles. No invariants in the two endomorphism tests makes each coordinate projection act irreducibly on W and on the adjoint module.
2. The projection Lie algebra either contains Lie(G*) or is central. In the second case Jordan’s theorem contradicts irreducibility on W with dimension >J.
3. Pairwise Lie-Goursat detects any remaining graph relation. Such a graph creates an invariant in a cross-coordinate adjoint tensor, so all projections together contain the full connected product.

Uses: LS, Theorem 4.7 — Reduce containment of (G*)^c to finitely many generic-vanishing statements..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `monodromyTests_finite` | data | The construction yields finitely many concrete tensor representations of N^c, with their coordinate action maps. |
| `monodromyTests_no_product_invariants` | compatibility | Every test object has zero invariants under (G*)^c. |
| `monodromyTests_detect` | characterisation | For reductive B⊂N^c, vanishing of all test invariants is equivalent to containing (G*)^c. |
| `monodromyTests_changeBasis` | functoriality | Conjugating the faithful realization transports the list and preserves its detection property. |

Discriminating unit tests:

- `tests_product`: For B=(G*)^c all invariants in the test list vanish.
- `tests_diagonal`: For c=2 and B=diagonal G*, the identity intertwiner gives a nonzero cross-adjoint invariant.
- `tests_trivial`: For B=1 a nonzero test representation has fixed vectors; the trivial subgroup is rejected.

Acceptance checks:

- The full product passes all tests.
- A diagonal G* in two coordinates fails a cross-adjoint test.
- A subgroup finite modulo scalars is detected by the W-test.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 4.5, pp. 32–33. This is the proof-specific finite test battery. Jordan’s theorem, normalizer structure and highest-weight constructions stay with their generic group-theory owners.

Atlas planet: Monodromy test representations.

Implementation status: unchecked.

### generic-big-monodromy — Big monodromy for generic simultaneous twists

**Theorem.** In the family setting of constant-part-rigidity, assume the geometric generic stabilizer is trivial and G* is connected simple with irreducible distinguished representation. For every c≥1 there is a finite union S of torsion cosets in Π(A)^c such that for (χ₁,…,χ_c) outside S, R^j f_*(g*Lχ_i)=0 for j≠n−1 and the geometric monodromy of ⊕_i R^(n−1)f_*(g*Lχ_i) contains (G*)^c as a normal subgroup. On this product it is the direct sum of the c distinguished representations, each supported on its own factor. Here f:Y→X,g:Y→A are the projections. All sheaves are lisse on X by smooth proper base change.

Hypotheses: X is smooth connected over C; f is smooth proper with smooth ample hypersurface fibres; the family is not generically constant up to translation.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.7/independent-coordinate-factors`, `SheafConvolutionOnAbelianVarieties:SC.7/relative-generic-vanishing`, `SheafConvolutionOnAbelianVarieties:SC.7/detecting-representations`, `SheafConvolutionOnAbelianVarieties:SC.2/galois-normalization`, `EtaleDualityAndPerverseSheaves:EDC.7`.

Construction or proof route:

1. First remove concentration failures for the c twists. Arithmetic normalization places the simultaneous monodromy group inside N(G*)^c.
2. Realize the finite detecting tensor representations by geometrically semisimple perverse objects in the arithmetic axis-generated category. Their geometric constituents have no constant part by independent-coordinate-factors.
3. Apply relative-generic-vanishing to all those objects. The requested proper-direct-image semisimplicity gives a reductive monodromy group. The finite test battery forces product containment; the normalizer inclusion makes the contained product normal.

Acceptance checks:

- For c=1 recover one simple normal subgroup.
- The diagonal character tuple must lie in the exceptional set when c>1 and the same monodromy would otherwise act diagonally.
- The theorem has no claim for a constant-up-to-translation family.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Theorem 4.7 and proof, pp. 33–34. This converts big convolution monodromy into usual family monodromy and retains the product and its action. Classicality is an input from SC.6 when the hypersurface degree meets that theorem.

Atlas planet: Generic big monodromy.

Implementation status: unchecked.

## SC.8 — Frobenius and Galois-uniform monodromy

Prove Frobenius avoidance for finite-order characters of order prime to the good-reduction residue characteristic p, using prime-to-p Tate modules and Weil weights. Count ℓ-power characters avoiding every Galois/cyclotomic conjugate of a finite torsion-coset union. Combine these with generic big monodromy for a chosen order prime ℓ≠p to obtain all-conjugate uniform product monodromy; exponent tuples may depend on the conjugate. No all-p-primary avoidance theorem is claimed.

Layer inputs: `AbelianSchemesAndArithmeticModuli:A4`, `DeligneWeightsAndPurity:DWP.0`, `DeligneWeightsAndPurity:DWP.4`, `SheafConvolutionOnAbelianVarieties:SC.0`, `SheafConvolutionOnAbelianVarieties:SC.7`.

### frobenius-avoidance — Prime-to-p Frobenius avoidance

**Theorem.** Let A/K be an abelian variety over a number field with good reduction at a place of residue characteristic p, fix lifts of its Frobenius in the two actions on finite-order character pairs, and choose m>0 whose Frobenius power fixes the Galois closure of K. Given c≥1 and a finite union S of torsion cosets in Π(A)^c, there is a finite union S′ of torsion cosets in Π(A) such that for each finite-order χ of order prime to p outside S′, some e₁,…,e_c∈Z give (Frob_p^(me₁)χ,…,Frob_p^(me_c)χ) outside S. The two actions are geometric transport and cyclotomic transport of character values.

Hypotheses: Only prime-to-p torsion characters are asserted here. Fix a common algebraic closure and compatible embeddings for the transport.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.0/character-space`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `DeligneWeightsAndPurity:DWP.4/integral-cohomological-factors`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`.

Construction or proof route:

1. Let M be the number of cosets in S. The case M=0 is immediate. Replace m by a multiple so the geometric restriction kernels and translating torsion data are stable under σ=Frob^m. On every prime-to-p Tate module the combined geometric/cyclotomic action has Weil eigenvalues of nonzero weight, so no positive power has eigenvalue 1.
2. For a fixed proper coset τT in Π(A)^c, choose a coordinate axis whose inverse image T_r is proper. Write T_r as the restriction kernel for a positive-dimensional B⊂A. For every 0≤e<e′≤M, equality of σ^eχ and σ^e′χ on B forces χ|B into a finite torsion set: the relevant σ^(e′−e)−1 has nonzero determinant. Taking inverse images under restriction gives a finite union of torsion translates of T_r. Collect these collision loci for all cosets and exponent pairs into S′.
3. For χ outside S′, fix all exponents other than e_r in {0,…,M}. At most one e_r can place the tuple in τT; two choices would give an excluded collision on B. Thus at most (M+1)^(c−1) tuples are bad for each coset and at most M(M+1)^(c−1)<(M+1)^c are bad in total. A good tuple exists. Exponents for the original Frobenius step are obtained by the integer scaling used when enlarging m.
4. The determinant argument here concerns prime-to-p torsion only. E6 records the omitted p-primary justification in the source, and E20 corrects the reversed word in its initial finite-box count.

Acceptance checks:

- The Frobenius powers e_i may depend on χ and may be negative.
- Do not apply the proof to arbitrary p-power characters.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 4.8 and proof, pp. 34–35. This is the form justified by the prime-to-p Tate-module argument and sufficient for Corollary 4.10 after choosing ℓ≠p.

Atlas planet: Frobenius avoidance.

Implementation status: unchecked.

### galois-orbit-character — Character generic in every conjugate

**Theorem.** For each embedding ι:K→Q̄ suppose S_ι is a finite union of torsion cosets in Π(A_ι). For any chosen prime ℓ there are an embedding ι and a finite-order ℓ-power character χ on A_ι such that every conjugate (ι′,χ′) under Gal(Q̄/Q)×Gal(Q^cyc/Q) avoids S_ι′. This lemma alone has no ℓ≠p condition; that condition is imposed when combining it with Frobenius avoidance.

Hypotheses: Character values are finite-order roots of unity; the cyclotomic action on values is defined on this torsion character set.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.0/character-space`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`.

Construction or proof route:

1. Take the finite Galois/cyclotomic conjugate closure of the torsion-coset data, using finite fields of definition of abelian subvarieties and translating torsion characters.
2. Among characters of order dividing ℓ^r, the total count is ℓ^(2nr). A restriction kernel from a positive-dimensional abelian subvariety has at most a fixed multiple of ℓ^(2(n−1)r) points. For large r the finite exceptional union cannot exhaust all characters.

Acceptance checks:

- For a simple elliptic curve, each proper torsion coset is a point, while the number of ℓ^r characters grows as ℓ^(2r).
- Choosing a character generic only for one embedding is insufficient.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Lemma 4.9, pp. 35–36. The counting is uniform over every conjugate pair; the exceptional data is finite and the codimension estimate is decisive.

Atlas planet: Galois-generic torsion character.

Implementation status: unchecked.

### uniform-orbit-monodromy — Uniform big monodromy on a character orbit

**Theorem.** Let the family Y⊂X×A and the hypotheses of generic-big-monodromy be defined over a number field K. Fix c≥1, a good-reduction place of residue characteristic p, m>0 as in Frobenius avoidance and a prime ℓ≠p. Then some embedding ι and an ℓ-power finite-order character χ have the following property for every Gal(Q̄/Q)×Gal(Q^cyc/Q)-conjugate (ι′,χ′): R^j f_*(g*Lχ′)=0 for j≠n−1, and there exist e₁,…,e_c∈Z for which the geometric monodromy of the sum twisted by Frob_p^(me_i)χ′ contains (G*)^c normally, with the c distinguished actions. The exponents may depend on the conjugate.

Hypotheses: The Frobenius and cyclotomic lifts are fixed once; ℓ is the order prime of the finite character, and need not equal the cohomological prime.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.7/generic-big-monodromy`, `SheafConvolutionOnAbelianVarieties:SC.8/frobenius-avoidance`, `SheafConvolutionOnAbelianVarieties:SC.8/galois-orbit-character`.

Construction or proof route:

1. Apply the generic simultaneous-twist theorem to the finitely many embedding-conjugate families.
2. Use Frobenius avoidance to turn each c-fold bad set into a one-character bad set, adding the single-character concentration loci.
3. Choose an ℓ-power character whose every conjugate avoids all of these one-character sets. Its order is prime to p, so every conjugate satisfies the corrected avoidance theorem.

Acceptance checks:

- The conclusion is a product (G*)^c with specified action, rather than a single G*.
- The theorem does not choose one exponent tuple valid for every conjugate.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Corollary 4.10 and proof, pp. 36–37. The uniform conclusion survives the correction of Lemma 4.8 by choosing ℓ≠p. This is the arithmetic output consumed by the Lawrence–Venkatesh Part II direction.

Atlas planet: Uniform orbit monodromy.

Implementation status: unchecked.

## SC.9 — Isogeny pullbacks and finite period detection

On the smooth-divisor open of a fixed complete linear system |L|, construct polarized integral period maps for [m]⁻¹H and their deck-character decompositions. Plan the target that some such period map is quasi-finite for n≥2. Import CDK’s bounded-norm finite Hodge-locus theorem; use a separate Torelli/rigid-Hom argument for n=2 and record G3 for the higher-dimensional trace-compatible period relations. Fix Pic(A), not merely the Néron–Severi class, throughout.

Layer inputs: `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A5`, `AbelianSchemesAndArithmeticModuli:A6`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `HodgeStructuresPartII:H.7`, `SheafConvolutionOnAbelianVarieties:SC.3`, `SheafConvolutionOnAbelianVarieties:SC.4`, `SheafConvolutionOnAbelianVarieties:SC.7`, `ShimuraData:D3`, `StableReductionPartII:MC.4`, `StableReductionPartII:MC.6`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`.

### linear-system-period — Period maps of isogeny pullbacks

**Construction.** Fix a complex abelian variety A of dimension n≥2 and an ample line bundle L. Let M be the open subset of the complete linear system P(H⁰(A,L)) parameterizing smooth divisors, using the convention that points are nonzero sections modulo scalar. For m>0 let Y_m→M be the family [m]⁻¹H. The torsion-free integral middle cohomology with its polarization and Hodge filtration defines a period map Φ_m to the appropriate polarized period quotient. Its rational local system splits, after a coefficient extension, into character-isotypic summands H^(n−1)(H,Lχ), for characters of A[m]. The fixed class is in Pic(A), not merely NS(A).

Hypotheses: Use polarizations from the fixed ample geometric data and finite level/markings when a period domain rather than its quotient is used.

Direct dependencies: `AbelianSchemesAndArithmeticModuli:A2/ample-cohomology-and-degree`, `AbelianSchemesAndArithmeticModuli:A3`, `AlgebraicModuliForArithmeticGeometry:R09.2/hilbert-scheme`, `ShimuraData:D3/polarized-integral-variation`, `HodgeStructuresPartII:H.7/tensor-hodge-locus`.

Construction or proof route:

1. Form the smooth-divisor open of the projective section space. Multiplication by m is finite étale in characteristic zero, so the pulled-back universal divisor is smooth proper.
2. Import the polarized integral variation and its period map, keeping the lattice modulo torsion. Decompose the finite abelian deck group after scalar extension; trace and pullback maps compare the variations for m|m′.

Uses: LS, Proposition 4.11 — Detect positive-dimensional period fibres by simultaneous finite monodromy of torsion twists..

Planning API:

| Name | Role | Required statement |
| --- | --- | --- |
| `smoothDivisorSpace_points` | characterisation | M(C) is the set of smooth effective divisors H with O_A(H)≅L, embedded by their section line. |
| `isogenyPeriod_family` | functoriality | The family and polarized variation commute with base change in M. |
| `isogenyPeriod_divisibility` | compatibility | For m\|m′, pullback and trace split the m-variation as a rational direct summand of the m′-variation, compatibly with Hodge structures. |
| `isogenyPeriod_character_decomposition` | equivalence | The rational variation after adjoining deck characters is the direct sum of the corresponding twisted cohomology local systems. |

Discriminating unit tests:

- `period_fixed_picard`: Translation by x preserves M’s line bundle condition only when x lies in the finite kernel of φ_L.
- `period_m_one`: At m=1 the deck decomposition has only the trivial character.
- `period_no_ns_substitution`: Replacing Pic(A) by NS(A) makes all translations preserve the parameter condition and destroys the intended finiteness test.

Acceptance checks:

- For m=1 this is the usual middle-cohomology period map of smooth divisors in |L|.
- The number of translates of one divisor retaining the same L is finite.
- Fixing only a Néron–Severi class allows a positive-dimensional translation orbit and is not this parameter space.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Proposition 4.11 and its proof, pp. 37–38. Fixing an ample Picard class makes translations preserving it finite, which is indispensable to the period argument.

Atlas planet: Isogeny-pullback period maps.

Implementation status: unchecked.

### surface-period-finiteness — Surface period finiteness by Torelli

**Theorem.** When dim A=2, the period map Φ₁ of smooth curves in the fixed complete linear system |L| has finite fibres. Here the polarization on H¹ is the canonical cup-product principal polarization. The genus is g=1+d≥2. No convolution simplicity assertion in dimension two is required.

Hypotheses: A is a complex abelian surface, L is ample, and the parameter space is the smooth-divisor open M⊂|L|; the statement is vacuous when M is empty.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.9/linear-system-period`, `SheafConvolutionOnAbelianVarieties:SC.3/hypersurface-euler-characteristics`, `AbelianSchemesAndArithmeticModuli:A2/ample-cohomology-and-degree`, `AbelianSchemesAndArithmeticModuli:A5/polarized-hodge-equivalence`, `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`, `StableReductionPartII:MC.4/fine-level-scheme`, `StableReductionPartII:MC.6/torelli-finite-fibres`, `StableReductionPartII:MC.6`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`.

Construction or proof route:

1. Use adjunction and the SC.3 Euler calculation to obtain g=1+d. A polarized integral weight-one Hodge structure determines the principally polarized Jacobian. The full-level Torelli theorem gives finite geometric fibres from the moduli of genus-g curves to the moduli of their polarized Jacobians.
2. Show that M→M_g has zero-dimensional geometric fibres. On a reduced connected component of such a fibre, the universal curve becomes a fixed curve C after the finite étale isomorphism cover; finite automorphisms for g≥2 and a fine level N≥3 justify this reduction. Fix c₀∈C. The pointed map C→A uniquely factors through J(C) by Abel–Jacobi, and the relative Hom space is unramified, so its homomorphism component is constant on a connected reduced parameter space.
3. Consequently the embedded images in A on that component differ only by translations. Translating a fixed divisor H₀ preserves O_A(H₀)≅L only for points in ker φ_L. Amplitude makes this kernel finite; hence the component has constant image in M. The fibre of M→M_g is a zero-dimensional finite-type algebraic space, so has finitely many geometric points.
4. Combine these finite fibres with Torelli and the weight-one comparison. Passing to and forgetting a finite level cover preserves fibre finiteness. This gives m=1 for n=2 and repairs the dimension mismatch in the source period proof.

Acceptance checks:

- For d=1 the curve genus is 2, including the hyperelliptic Torelli case.
- A positive-dimensional translation orbit cannot lie in this fixed |L|.
- The Hodge-bundle-only comparison is insufficient; R16 requires the polarized integral H¹ comparison.

Source: [JV](https://www.jmilne.org/math/xnotes/JVs.pdf), Milne, Proposition 6.1, pp. 19–20, and Theorem 12.1, pp. 38–39; application to LS Proposition 4.11, pp. 37–38. The Jacobian universal property and Torelli are imported. The rigidity-plus-fixed-line-bundle argument is a separate deduction for this parameter space, rather than a claimed extension of Lemma 3.9.

Atlas planet: Surface period finiteness.

Implementation status: unchecked.

### finite-period-detection — Quasi-finite isogeny-pullback period map

**Theorem.** For the smooth-divisor space M of an ample line bundle on a complex abelian variety of dimension n≥2, some m>0 makes Φ_m quasi-finite, meaning every fibre is finite. For n=2 take m=1 by surface-period-finiteness. For n>2 the monodromy route passes to the finite generic translation-stabilizer quotient and retains the marked-period compatibility obligation G3. The general assertion is a target with that recorded proof obligation.

Hypotheses: This is a target theorem with recorded proof gaps, not an implementation or a completed proof.

Direct dependencies: `SheafConvolutionOnAbelianVarieties:SC.9/linear-system-period`, `SheafConvolutionOnAbelianVarieties:SC.9/surface-period-finiteness`, `SheafConvolutionOnAbelianVarieties:SC.7/generic-big-monodromy`, `SheafConvolutionOnAbelianVarieties:SC.4/almost-simple`, `HodgeStructuresPartII:H.7`, `AbelianSchemesAndArithmeticModuli:A2`.

Construction or proof route:

1. On M×M use the weight-zero Hom variation and the flat orbit of the diagonal identity tensor. CDK Corollary 1.3 makes its projected Hodge locus Z_m closed algebraic: multiply a rational tensor by a fixed denominator and use its fixed polarization norm to apply the finite bounded-norm theorem. A countable-union Hodge-locus statement alone would not suffice.
2. For m|m′ the trace-compatible identity condition gives Z_m′⊂Z_m. Along divisibility, Noetherianity gives a stabilized closed relation. A positive-dimensional period fibre then supplies an algebraic positive-dimensional family with constant period for every multiple of m. Integral polarizability makes its monodromy finite, and the deck-character decomposition makes every torsion-twist summand have finite monodromy.
3. Fixing L rules out constancy by translations. Quotient by the finite generic translation stabilizer, shrinking the family so that its action is fixed; the resulting ample family has trivial stabilizer. For n>2 apply simplicity and generic-big-monodromy to contradict finite monodromy for a torsion character outside the finite exceptional union.
4. For n=2 apply surface-period-finiteness instead. For n>2, G3 must certify that the chosen identity-orbit relations preserve every pullback/trace summand, are nested under divisibility and detect period fibres with the specified polarized marking conventions. Identity transport respects flat trace idempotents, but this must be reconciled with the quotient used for the period map.

Acceptance checks:

- Quasi-finite is fibre finiteness, not global injectivity or properness.
- Only Picard-fixed parameter spaces are in scope.
- The n=2 proof uses Torelli and rigid Hom spaces, with no appeal to the n>2 simplicity lemma.

Source: [LS](https://arxiv.org/pdf/2004.09046v5), Proposition 4.11, pp. 37–38; CDK, Theorem 1.1 and Corollary 1.3, PDF p. 2. The precise CDK finite theorem supplies the closedness interface. The surface case has a separate Torelli route; the higher-dimensional marked-period argument retains G3.

Atlas planet: Quasi-finite period detection.

Implementation status: unchecked.

## Worked numerical checks

The first rows are A(2,·)=(1,1), A(3,·)=(1,4,1), A(4,·)=(1,11,11,1), A(5,·)=(1,26,66,26,1), and A(6,·)=(1,57,302,302,57,1). Their sums are n!. For n=3 the standard representation has N=6d, so confusing a negative topological sign with dimension, or d with N, fails an immediate rank check.

For the surface counting pattern w=(0,0,0,0,0,1), k=3, the row is (10,10). Its two adjacent ratios are 0 and 1; a universal strict product inequality would read 0<0. For w=(0,0,1,1), k=2, the row is (1,4,1), and the exterior-square image is the classical SO₆. For the first genuine exceptional threefold pattern, use w=(−1,0,…,0,1) with 23 zero entries and k=5. The row is (8855,35420,8855), with total 53130.

Independent exact rational checks verified all displayed fixed-index comparisons in their stated ranges through n=200, using integer Eulerian recurrence and rational upper bounds on the square roots. This comprises 1,981 comparisons, and establishes only that finite range. Twelve successive Pell invariants and the three displayed subset histograms were checked; the first three nontrivial binomial divisibility identities were checked exactly. These checks do not discharge G1’s uniform cutoffs or the B.11/B.12 occupancy certificates. The source ancillary program was read, not executed.

## Exact supplier contracts

These requests describe missing export statements or extensions of existing directions. They do not claim supplier implementation. Exact already-planned nodes, such as the CA.2 Eulerian family, the EDC.5 perverse heart, the A2 ample Riemann–Roch formula and A4 Tate modules, remain direct node imports.

### R1 — EtaleDualityAndPerverseSheaves:EDC.6

For characteristic-zero abelian varieties with F=Q̄_ℓ coefficients: (a) coherent proper base change, projection formula, external Künneth, and π₁-product comparisons on bounded constructible adic objects; (b) lisse rank-one sheaves versus continuous characters, origin-section descent, and multiplicative coherence; (c) algebraically closed base extension is fully faithful on constructible Hom and preserves simple perverse constituents for tensor constructions of a fixed descended object; (d) exact tensor pushforward to a coordinate after restricting to its generic-acyclic good subcategory. Keep the integral-lattice essential image in analytic comparison; do not assert equivalence with all analytic adic objects. These are extensions/receipts of EDC.6, not a new six-operation theory here.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.0/character-space`, `SheafConvolutionOnAbelianVarieties:SC.0/rank-one-local-system`, `SheafConvolutionOnAbelianVarieties:SC.0/derived-convolution`, `SheafConvolutionOnAbelianVarieties:SC.0/negligible-perverse`, `SheafConvolutionOnAbelianVarieties:SC.1/fibre-functor`, `SheafConvolutionOnAbelianVarieties:SC.2/algebraically-closed-extension`, `SheafConvolutionOnAbelianVarieties:SC.7/independent-coordinate-factors`.

### R2 — EtaleDualityAndPerverseSheaves:EDC.5

For a bounded t-structure with heart P and Serre subcategory N, let D_N be the full thick subcategory of objects whose every t-cohomology belongs to N. Prove the induced functor P/N→D/D_N is fully faithful with essential image the image of P; give its t-exact truncation comparisons. Use Mathlib’s existing additive Serre localization for the abelian quotient, rather than re-plan it. Apply the result to the middle-perverse heart.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.0/quotient-convolution`.

### R3 — EtaleDualityAndPerverseSheaves:EDC.7

Supply characteristic-zero geometric semisimplicity of proper direct images of semisimple perverse sheaves (the arbitrary local-system form used in LS Lemma 2.7), and the spreading/complex comparison and intermediate-extension/decomposition compatibility for geometrically semisimple objects of geometric origin used in LS Lemma 4.4 and Theorem 4.7. Existing finite-field pure decomposition nodes alone do not give this. Include reductivity of the smooth-proper monodromy representations after the admitted rank-one twists.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.2/arithmetic-geometric-categories`, `SheafConvolutionOnAbelianVarieties:SC.7/relative-generic-vanishing`, `SheafConvolutionOnAbelianVarieties:SC.7/generic-big-monodromy`.

### R4 — MotivesAndAlgebraicCycles:MC.6

Extend abstract neutral Tannaka reconstruction by the finite-type Isom⊗(ω,ω′) torsor theorem, rational-point trivialization over an algebraically closed coefficient field for a tensor-generated category, and EHS Theorem A.1’s exactness criterion for affine group schemes: faithful flatness from fully faithful subquotient-stable pullback; closed immersion from subquotient generation; kernel exactness from trivial objects, descent of the maximal trivial subobject, and subobject lifting. Keep the total groups proalgebraic and the one-generator images finite type.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.1/character-independence`, `SheafConvolutionOnAbelianVarieties:SC.2/arithmetic-exact-sequence`.

### R5 — AbelianSchemesAndArithmeticModuli:A2

For a smooth ample divisor H in an abelian variety A in characteristic zero with dim A>2, identify Alb(H)→A as an isomorphism by weak Lefschetz; extend rational maps from smooth proper H to an abelian variety to morphisms; prove that an ample divisor has finite translation stabilizer. For an isogeny g and a divisor with trivial stabilizer, g|H is generically injective. For the family period argument, quotient a family by its fixed finite generic translation stabilizer after shrinking, preserving smooth ample descent. These general abelian-geometric facts extend A2; the conormal factorization application is SC.4.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.4/almost-simple`, `SheafConvolutionOnAbelianVarieties:SC.9/finite-period-detection`.

### R6 — AbelianSchemesAndArithmeticModuli:A3

Make explicit the finite étale multiplication-by-m cover in characteristic zero, its deck group A[m], the character idempotent decomposition after coefficient extension, the dual torsion-line-bundle correspondence, and pullback/trace composition for m|m′. The integer m need not be prime to the cohomological prime in characteristic zero. Import the existing relative-isogeny and dual-isogeny nodes rather than rebuild them.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.0/character-space`, `SheafConvolutionOnAbelianVarieties:SC.3/torsion-twist-hodge-tate`, `SheafConvolutionOnAbelianVarieties:SC.9/linear-system-period`.

### R7 — SchemeAndStackFoundations:SF.5

Supply algebraic cycle operations with multiplicities: conormal cycles on a smooth variety, generic degree and finite-flat fibre-product pushforward, and compatibility with isogenies. For SC.3 also supply Hirzebruch–Riemann–Roch for coherent Ω-powers, the conormal exact sequence/exterior-power resolution, and algebraic/topological Chern–Gauss–Bonnet comparison on smooth proper complex varieties. Abelian line-bundle Riemann–Roch is already A2’s input.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.3/hypersurface-euler-characteristics`, `SheafConvolutionOnAbelianVarieties:SC.4/clean-cycle-ring`.

### R8 — ComplexComparisonPartII:C5

Extend the existing regular-singular connection comparison on a smooth open to regular-holonomic D-modules versus perverse constructible sheaves, with characteristic cycles, smooth rank multiplicities, the microlocal index theorem, and proper-direct-image/external-product/isogeny compatibility. Include independence of the integral cycle from a coefficient-field realization. C5 owns this general comparison; SC.4 owns clean convolution and the abelian microlocal applications.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.4/characteristic-cycle`.

### R9 — PadicHodgeTheory:R06.2

For a Hodge–Tate p-adic representation V with Zariski closure B, construct the Hodge–Tate cocharacter in B_Cp, well defined up to conjugacy, by tensor-comparing the graded fibre functor and the ordinary fibre functor over C_p. Use the native convention HT(Q_p(1))=+1, and do not assume all extensions of Hodge–Tate representations are Hodge–Tate. The fixed crystalline-G-torsor interface does not supply this general result.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.5/hodge-wedge-constraint`.

### R10 — tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Supply for the normalizer N_GL(V)(G*) of a connected simple irreducible faithful image: finite outer quotient and scalar connected centralizer, a Jordan bound for subgroups finite modulo scalars, and reductive-group/Lie-algebra containment comparisons. These are generic group inputs to the finite detection battery, not repeated reductive-group foundations.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.1/convolution-group`, `SheafConvolutionOnAbelianVarieties:SC.4/microlocal-factorization`, `SheafConvolutionOnAbelianVarieties:SC.5/hodge-wedge-constraint`, `SheafConvolutionOnAbelianVarieties:SC.7/constant-part-rigidity`, `SheafConvolutionOnAbelianVarieties:SC.7/independent-coordinate-factors`, `SheafConvolutionOnAbelianVarieties:SC.7/detecting-representations`.

### R11 — tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles

Provide the complete minuscule highest-weight table for all simple types (including E₆ and E₇ and the absence for E₈,F₄,G₂), faithful-image/central-isogeny conventions, and arbitrarily large normalizer-extendible irreducible representations as used in LS Lemma 4.5. Use the existing highest-weight classification and current library, with no duplicate classification in this roadmap.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.4/microlocal-factorization`, `SheafConvolutionOnAbelianVarieties:SC.4/minuscule`, `SheafConvolutionOnAbelianVarieties:SC.4/minuscule-alternatives`, `SheafConvolutionOnAbelianVarieties:SC.7/detecting-representations`.

### R12 — tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas

Specialize the existing Weyl character/dimension formula to minuscule exterior powers: weights are sums of distinct standard weights, dimension is binom(m,k), the interior-power normalizer has connected component GL_m/μ_k and at most the duality outer component at m=2k, and cocharacters lift after power pullback with the common central fractional weight retained. Also supply dimensions/unbounded highest-weight families required by the finite detection construction.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.4/minuscule-alternatives`, `SheafConvolutionOnAbelianVarieties:SC.5/hodge-wedge-constraint`, `SheafConvolutionOnAbelianVarieties:SC.7/detecting-representations`.

### R13 — tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly

From the existing exceptional root data and highest-weight theory, identify the two E₆ minuscule dimensions as 27 and the E₇ minuscule dimension as 56, with the relevant image conventions. This is a requested table specialization, not a new exceptional-groups development.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.4/minuscule-alternatives`.

### R14 — tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-4-the-spin-and-half-spin-representations

Expose the already-planned spin/half-spin dimensions as powers of two with precise type/rank ranges and their central-image comparison, so the 6|N hypersurface exclusion can consume them without re-planning Clifford or spin representations.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.4/minuscule-alternatives`.

### R15 — HodgeStructuresPartII:H.7

Strengthen the countable-union Hodge-locus interface by CDK Theorem 1.1: for an integral polarized weight-zero variation and K≥0, the total locus of integral (0,0) classes with polarization norm≤K is algebraic and finite over the base. Deduce Corollary 1.3: the projection of the Hodge locus of a fixed flat-section monodromy orbit is closed algebraic. After clearing one fixed denominator this applies to the identity tensor in the Hom variation on M×M. Do not infer this closedness from a countable union of closed loci.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.9/finite-period-detection`.

### R16 — StableReductionPartII:MC.6

Extend the existing Hodge-bundle comparison to a canonical isomorphism H¹(J(C),Z)≅H¹(C,Z) of polarized integral weight-one variations for smooth proper complex curves, with the principal Jacobian polarization matching cup product and with base-change compatibility. Expose the consequent identification of the genus-g curve period map with the ppav Torelli period map. The existing determinant/Hodge-bundle statement alone does not supply integral lattices or polarization.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.9/surface-period-finiteness`.

### R17 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property

Expose the existing pointed curve Abel–Jacobi universal property in families after trivializing a constant curve: any morphism C×T→A with the chosen C-point sent to zero factors uniquely through J(C)×T by a homomorphism of abelian schemes, compatibly with base change. Use the existing generic Albanese universal-property carrier in the current Tau Ceti library rather than defining a second one.

Consumers: `SheafConvolutionOnAbelianVarieties:SC.9/surface-period-finiteness`.

The Hodge–Tate cocharacter contract R9 is assigned to the lower PadicHodgeTheory:R06.2 owner. A downstream extraction had routed its use through Lawrence–Venkatesh Part II; that dependency must be repointed to R06.2. No upward consumer dependency is present here.

## Explicit proof obligations

### G1 — Exact Eulerian comparison and small-occupancy certificates

Prove explicit uniform large-n cutoffs for each displayed bespoke SC.6 inequality from CA.2’s C.1–C.5 bounds, then give exact finite certificates below the cutoffs and for all B.11/B.12 parameter cases. The ancillary numerical code uses floating arrays, omits one term in one large-n test, and has the wrong n-factor in another. Finite independent exact checks are diagnostic evidence only; they do not close the universal ranges. Until these certificates are supplied the route through Appendix B is a complete target-level plan with an open proof obligation.

Needed by: `SheafConvolutionOnAbelianVarieties:SC.6/eulerian-comparisons`, `SheafConvolutionOnAbelianVarieties:SC.6/first-ratio-exclusion`, `SheafConvolutionOnAbelianVarieties:SC.6/second-ratio-exclusion`, `SheafConvolutionOnAbelianVarieties:SC.6/classical-monodromy`.

### G3 — Trace-compatible stabilized period relations

CDK’s finite bounded-norm theorem supplies the closed orbit-projected identity Hodge loci. Complete the remaining marked-period argument: fix the integral/rational polarizations and trace idempotents, show that a flat identity-orbit isomorphism for the m′-cover with m|m′ preserves the designated m-summand, and prove the resulting closed relations are nested. Explain how their Noetherian stabilization supplies one algebraic positive-dimensional family with finite monodromy for every torsion-character summand. An arbitrary Hodge isomorphism of total cohomology need not preserve a chosen summand, so this compatibility cannot be replaced by an unspecified period isomorphism.

Needed by: `SheafConvolutionOnAbelianVarieties:SC.9/finite-period-detection`.

## Routed-target crosswalk

The 26 route items in `PAPER-LAWRENCE-SAWIN-25` are accounted for below. Source and extraction mistakes are corrected in the target statements above; a route item’s formulation is not treated as an independent theorem.

| Extraction item suffix | Owning target(s) |
| --- | --- |
| 6 | SC.9/linear-system-period; SC.9/finite-period-detection |
| 7 | SC.0/derived-convolution |
| 8 | SC.0/negligible-perverse; SC.0/quotient-convolution |
| 9 | SC.0/rank-one-local-system; SC.1/admissible-perverse |
| 10 | SC.1/fibre-functor; SC.1/convolution-group |
| 11 | SC.2/arithmetic-geometric-categories |
| 12 | SC.2/arithmetic-exact-sequence |
| 13 | SC.2/galois-normalization |
| 14 | A2/ample-cohomology-and-degree (general formula); SC.3/hypersurface-euler-characteristics |
| 15 | SC.6/classical-monodromy |
| 16 | SC.3/distinguished-representation; SC.4/minuscule; SC.4/almost-simple; SC.4/minuscule-alternatives |
| 17 | SC.4/inversion-duality |
| 18 | SC.4/minuscule-alternatives (classification imported) |
| 19 | SC.3/torsion-twist-hodge-tate |
| 20 | SC.5/wedge-multiplicity; SC.5/hodge-wedge-constraint; SC.6/exterior-power-classification |
| 21 | SC.7/constant-part-rigidity; SC.7/independent-coordinate-factors |
| 22 | SC.7/relative-generic-vanishing |
| 23 | SC.7/detecting-representations |
| 24 | SC.7/generic-big-monodromy |
| 25 | SC.8/frobenius-avoidance; SC.8/galois-orbit-character |
| 26 | SC.8/uniform-orbit-monodromy (prime-to-p form) |
| 62 | SC.5/extremal-width; surface-classification; threefold-classification; fourfold-impossibility; exceptional-pairs; exceptional-degree |
| 63 | SC.6/ratio-identities; SC.6/first-ratio-exclusion |
| 64 | SC.6/first-ratio-exclusion |
| 65 | SC.6/large-k-exclusion; SC.6/second-ratio-exclusion |
| 79 | SC.0/character-space (continuous character group, without an invented algebraic torus carrier) |

## Source corrections and version boundary

The following are findings against the identified preprint or its ancillary file. The publisher landing page was read for metadata, but the 144-page version of record was not collated with the 121-page v5 preprint. No finding below is asserted against unexamined published text. The packet gives the search locations and individual impact classifications. The searches found no separately identified published correction; some findings were already leads in the atlas extraction/red-team material, which was rechecked rather than treated as evidence.

### E1 — misprint; Lemmas 3.8–3.9, pp. 21–23 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The smooth hypersurface sheaf is shifted by n in characteristic-cycle calculations; one label names H as a Lie algebra and the K1 citation is numbered 1.0.

Required correction: Use i_*F[n−1], the Lie algebra of G_H, and K1 Corollary 1.10, p. 12. Also read the multiplication morphism in the factorization as multiplication by m.

Reason: The support dimension is n−1; shifting by n is not a perverse object. The verified K1 criterion has number 1.10. Impact: nothing.

### E2 — gap; Lemma 3.10, pp. 23–24 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The lemma omits the n>2 hypothesis while its proof obtains simplicity from Lemma 3.9.

Required correction: Add n>2 when using this proof. Do not export it as a surface theorem.

Reason: Weak Lefschetz in Lemma 3.9 needs dim H≥2. The classification step has no separately supplied n=2 argument. Impact: a stated result.

### E3 — misprint; Hodge–Tate definitions before Lemma 3.13, p. 25 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The displayed invariant spaces do not contain the weight twist; the Hodge–Tate dimension condition adds weights rather than the dimensions of the graded pieces.

Required correction: Insert the appropriate Tate twist in each invariant space and sum the multiplicities. In the supplier convention the resulting weights are −q with multiplicities dA(n,q).

Reason: Without the twist the displayed vector space is independent of q; the standard cyclotomic example also distinguishes a weight from its multiplicity. Impact: nothing.

### E4 — error; §4 opening generic-vanishing discussion, p. 30 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The arbitrary-perverse vanishing statement is described using torsion translates.

Required correction: Use arbitrary character translates in general and torsion translates for the semisimple geometric-origin case, as in KW Lemma 11.2(c).

Reason: For a rank-one character of infinite order, its inverse is the exceptional character of the corresponding shifted rank-one sheaf; this point need not be torsion. Impact: a stated result.

### E5 — gap; Proof of Lemma 3.9, p. 23 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: Containment H⊂g₁⁻¹Z₁ is promoted to equality with the whole inverse image, and the finite map is then declared an isomorphism using trivial stabilizer.

Required correction: Use that H is one irreducible component. Its stabilizer contains the connected kernel, so ampleness forces g₁ to be an isogeny. Trivial stabilizer makes g₁|H generically one-to-one, which suffices to preserve the Gauss degree; an isomorphism of A is unnecessary.

Reason: A maximal irreducible proper subvariety can be just one component of a reducible inverse image. The repaired degree argument gives the same contradiction without that equality. Impact: the proof.

### E6 — gap; Lemma 4.8 and proof, pp. 34–35 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The avoidance assertion ranges over all torsion characters, while the no-root-of-unity Frobenius argument is applied without separating the reduction-characteristic primary part.

Required correction: Restrict the proved avoidance target to finite-order characters of order prime to p, the residue characteristic. In Corollary 4.10 choose order prime ℓ≠p; every conjugate is then covered. No claim for the p-primary part is made here.

Reason: The good-reduction weight argument acts on ℓ-adic Tate modules for ℓ≠p. The proof has not established the required eigenvalue assertion on the p-primary component. Impact: a stated result.

### E7 — misprint; Appendix B opening binomial convention, p. 93 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: A binomial coefficient is made zero at the equal-index boundary as well as above it.

Required correction: Use binom(a,a)=1 and binom(a,b)=0 for b>a or b<0.

Reason: Endpoint occupancies and every extremal weight count require the equal-index coefficient 1. Impact: nothing.

### E8 — error; Lemma B.10, p. 100 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The adjacent-ratio product is asserted strictly smaller than h(v−1)h(v+1) without positivity of those factors.

Required correction: Assert ≤ always, and < when h(v−1)h(v+1)>0.

Reason: Take n=2,k=3,h(0)=5,h(1)=1,d=10. The valid row is (10,10), but R_a=0,R_b=1 and the product comparison has both sides zero. Impact: a stated result.

### E9 — misprint; Proof of Lemma B.23, p. 111 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The initial q=4 occupancy is divided by the first modified occupancy in one displayed ratio.

Required correction: Divide by the minimum occupancy count d. The intended binomial calculation then yields the cubic lower bound for A(n,4).

Reason: A(n,4) is the q=4 coefficient divided by d; replacing the denominator by the q=1 contribution changes the coefficient comparison. Impact: nothing.

### E10 — misprint; Proof of Lemma B.27, p. 113 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The final q=2 sum lists the wrong surviving labels and replaces n−1 by n in its leading estimate.

Required correction: The surviving terms are a,c,e; use (n−1)A(n,1)/2+4A(n,3)/A(n,1)+1+sqrt(2A(n,5))+1<A(n,2).

Reason: At n=5 the weakened n-coefficient gives 71<66, which is false, whereas the required n−1 coefficient gives 58<66. Impact: nothing.

### E11 — misprint; Proof of Lemma B.28, p. 114 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The range for the relative offset q is written using absolute weight indices.

Required correction: Use 0≤q≤r−1 for the initial coefficient equations, with weight arguments v+q.

Reason: A common translation of every weight must leave the offset equations unchanged. Impact: nothing.

### E12 — misprint; Proof of Lemma B.29, p. 114 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: After normalizing the q=3r−2 occupancy by d, one displayed expression retains an extra division by d.

Required correction: The normalized lower bound is A(n,r−1)(dA(n,r−1)−1)h(v−r)/2.

Reason: Expand binom(dA(n,r−1),2)h(v−r)/d; precisely one factor d cancels. Impact: nothing.

### E13 — gap; Lemma B.30, p. 114, use of Lemma C.4 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The square-separation theorem is invoked in a range that can include r=n−1, beyond its stated upper limit.

Required correction: Use C.4 for 3≤r≤n−2. At r=n−1 the coefficient A(n,3r−2) is zero while the lower-bound expression is positive.

Reason: The zero extension of Eulerian numbers treats the omitted endpoint directly. Impact: the proof.

### E14 — misprint; Lemmas B.4–B.5 and B.9, pp. 94–99 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: Several local displays exchange the histogram and occupancy labels, use E in place of the Eulerian A, or repeat the zero-index right-hand side in consecutive coefficient equations.

Required correction: Read the ambient multiplicity as h, the chosen occupancy separately, and each coefficient equation as dA(n,q) at its actual offset q. In the n=4 row these values are d,11d,11d,d.

Reason: The subset-count definition fixes both roles, and the explicitly calculated n=2,3,4 rows distinguish the consecutive coefficients. Impact: nothing.

### E15 — error; Comparisons in B.23–B.24, B.26 and B.31, pp. 111–115 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: Some numerical inequalities are described as valid for every natural n.

Required correction: Restrict the recorded comparisons to n≥5, exactly the consuming range of Appendix B.2–B.4, and prove that range by G1’s certificates.

Reason: For instance at n=1, 78nA(n,4)<(A(n,1)−1)^3 reads 0<−1. Impact: a stated result.

### E16 — gap; Ancillary eulerian.py, verify_bound_m1a_final, large-n branch (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The large-n test combines four estimated q=2 contributions when the proof requires five.

Required correction: Include the fifth contribution, prove all estimates with exact bounds, and replace the floating recurrence by exact integer certificates below an explicit cutoff.

Reason: The missing e-term is positive in the intended bound; positivity means a four-term upper estimate cannot certify the required five-term sum. Impact: the proof.

### E17 — error; Ancillary eulerian.py, verify_bound_m1b_mult1a, large-n branch (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The logarithmic right-hand bound multiplies the cubic A(n,1) term by n, whereas the claimed inequality divides it by n.

Required correction: The logarithmic factor for n must have negative sign. Re-establish the corrected comparison through the G1 certificate plan.

Reason: The tested upper bound differs by a factor n², so passing the looser numerical test does not prove the stated 78nA(n,4) comparison. Impact: the proof.

### E18 — gap; Proposition 4.11 and proof, pp. 37–38 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The period conclusion is stated for n≥2 and the contradiction invokes the simplicity result with its n>2 hypothesis.

Required correction: Restrict the supplied simplicity-based proof to n>2. For n=2 use SC.9/surface-period-finiteness, via Torelli, rigid Hom spaces and the finite translation kernel of L. For n>2 require G3’s marked-period compatibility verification.

Reason: The invoked Lemma 3.9 cannot justify the surface case. The separate Torelli argument repairs that dimension mismatch without changing the n>2 simplicity theorem. Impact: a stated result.

### E19 — misprint; Proof of Lemma 3.14, p. 26 (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The initial concentration condition is phrased in degree zero for the unshifted hypersurface local system.

Required correction: For Lχ on H use degree n−1; degree zero applies to K_H=i_*F[n−1].

Reason: The Hodge–Tate computation and the distinguished fibre both use H^(n−1)(H,Lχ). Impact: nothing.

### E20 — misprint; Proof of Lemma 4.8, p. 35, first finite-box count (arXiv:2004.09046v5, not collated with the version of record)

The source formulation: The initial count assigns an upper bound (|S|+1)^(c−1) to exponent tuples outside a fixed bad coset.

Required correction: The upper bound counts tuples inside that one coset. Subtract the sum of those bad counts from the full box to obtain a positive number of tuples outside the union.

Reason: Fixing the other c−1 exponents leaves at most one bad choice on the selected axis; the final paragraph of the proof already uses this direction. Impact: nothing.

## Sources read

All statements and proof routes above are written for the roadmap in our own words. No source passages, PDFs or downloaded program are included. Precise locators on each target identify the argument used; the list below records versions and access.

- **LS**: Brian Lawrence and Will Sawin, [The Shafarevich conjecture for hypersurfaces in abelian varieties](https://arxiv.org/pdf/2004.09046v5). arXiv:2004.09046v5, 16 October 2025; 121 PDF pages. Published as Annals of Mathematics 202 (2025), no. 3, 857–1000; locators below refer to the preprint, not that pagination.. Read 2026-10-18. Scope: §2, pp. 14–19; §3, pp. 19–27; §4, pp. 28–38; Appendix B, pp. 93–115; Appendix C, pp. 116–118. SHA-256: `5e5f829e2841637de38852bde0d5f0a0b80183e6f9d23b60250cc2be1ee21d97`.
- **KW**: Thomas Krämer and Rainer Weissauer, [Vanishing theorems for constructible sheaves on abelian varieties](https://arxiv.org/pdf/1111.4947v6). arXiv:1111.4947v6, 29 September 2015; Journal of Algebraic Geometry 24 (2015), 531–568. Read 2026-10-18. Scope: Theorem 1.1, p. 2; §10, Proposition 10.1, pp. 21–22; §11, Lemma 11.2, p. 25; §§12–13, pp. 26–30. SHA-256: `badde3e78706286a3ffcf9f74e4da5df208e9a290358eac9328c581162463080`.
- **K1**: Thomas Krämer, [Characteristic cycles and the microlocal geometry of the Gauss map, I](https://arxiv.org/pdf/1604.02389v3). arXiv:1604.02389v3, 7 September 2021; Annales scientifiques de l’École normale supérieure 55 (2022), 1475–1527. Read 2026-10-18. Scope: §1, Theorem 1.7 and Corollary 1.10, pp. 10–12. SHA-256: `908a40d6dc4ccdee9f56ea570eb493b8561c87f3122043a695295768803fda7f`.
- **K2**: Thomas Krämer, [Characteristic cycles and the microlocal geometry of the Gauss map, II](https://arxiv.org/pdf/1807.01929v2). arXiv:1807.01929v2, 4 November 2019; Journal für die reine und angewandte Mathematik 774 (2021), 53–92. Read 2026-10-18. Scope: §1, Definition 1.2.2 and Example 1.3.2, pp. 7–9; §2, Definition 2.1.1 and Theorem 2.3.1; §5, Lemma 5.2.2, pp. 25–26; §6, Proposition 6.1.1 and Theorem 6.2.1, pp. 29–32. SHA-256: `44ae6bdcf9574eee1a0bab6698f3c29e35f3c89286e58fe301c5d2cf7f057d8d`.
- **EHS**: Hélène Esnault, Phùng Hô Hai and Xiaotao Sun, [On Nori’s fundamental group scheme](https://page.mi.fu-berlin.de/esnault/preprints/helene/83nori070514c.pdf). Author PDF dated 14 May 2007; Appendix A, Theorem A.1, pp. 20–21. Read 2026-10-18. Scope: Appendix A, Theorem A.1, pp. 20–21. SHA-256: `c9c8968777a0be26532738b2592cd8763d571b629ef83d1b1ff7c4f21ea7701d`.
- **W**: Rainer Weissauer, [On the rigidity of BN-sheaves](https://arxiv.org/pdf/1111.6095). arXiv:1111.6095v1, 25 November 2011; 2 pp.. Read 2026-10-18. Scope: Unnumbered Proposition and its proof, pp. 1–2. SHA-256: `50ba5cb6a6426aa4b94bd40252a8abd88c21a1db5bfcb4ce80bc98f32d353388`.
- **CDK**: Eduardo Cattani, Pierre Deligne and Aroldo Kaplan, [On the locus of Hodge classes](https://arxiv.org/pdf/alg-geom/9402009v1). arXiv:alg-geom/9402009v1, 10 February 1994; published Journal of the American Mathematical Society 8 (1995), 483–506. Read 2026-10-18. Scope: §1, Theorem 1.1 and Corollaries 1.2–1.4, PDF pp. 1–3. SHA-256: `d81863135f0d107ef193987bd163b8227b5736cc0a6200c2f05ab0caee7c9f01`.
- **JV**: J. S. Milne, [Jacobian Varieties](https://www.jmilne.org/math/xnotes/JVs.pdf). Corrected author notes, 12 June 2021; 50 PDF pages. Read 2026-10-18. Scope: Proposition 6.1 and proof, pp. 19–20; Theorem 12.1 and its statement discussion, pp. 38–39. SHA-256: `36c3f09c7462dbbd4ae1f8b81a02bd9ff84f03c5a346351d7d5d78fc3f173486`.
- **LS-code**: Brian Lawrence and Will Sawin, [Ancillary Eulerian verification program](https://arxiv.org/src/2004.09046v5/anc/eulerian.py). eulerian.py attached to arXiv:2004.09046v5; read as evidence about claimed computations, not executed or used as a certificate. Read 2026-10-18. Scope: Eulerian recurrence and all comparison routines, including verify_bound_m1a_final and verify_bound_m1b_mult1a. SHA-256: `520349962fc08fd5ec96106f97eb87a162a4d2d5001a82a5e7b17930ea1ba70e`.

## Completion and review boundary

All ten layers are planned at target level. There are 51 nodes: 8 definitions, 9 constructions, 33 theorems and 1 comparison; 69 API items, 52 discriminating unit tests, 44 planets and 10 cited baseline declarations. The packet records 17 supplier contracts, two proof gaps and 20 source findings. The suggested file elaborated at the stated pins with only permitted unfinished-proof warnings. Independent review must check the corrected microlocal degree argument, the exact supplier ownership, the two separate occupancy regimes and the period-map gaps. A complete planning pass leaves those obligations visible; it does not mark their proofs or the roadmap closed.
