# Arithmetic Galois representations: continuous representations and integral models

This is the R01.1 part of **Arithmetic Galois representations and conductors**. It plans the passage from algebraic representation carriers to continuous arithmetic representations, integral lattices and residual semisimplifications. The principal carriers and their IDs remain those of the [reviewed parent packet](../packets/ArithmeticGaloisRepresentations.json). The [refinement packet](../packets/ArithmeticGaloisRepresentations--R01.1.json) supplies separate reusable operations, their APIs, tests and the characteristic-polynomial bridge to determinant reconstruction. The [suggested file](../suggested/ArithmeticGaloisRepresentations--R01.1.lean) proposes signatures against the pinned libraries; it is not an implementation.

The scope is exactly `ArithmeticGaloisRepresentations:R01.1`. Its coverage is **planned**, with two explicit supplier/source gaps for general reductive groups. The linear-representation chain is specified through the library and supplier contracts below. The packet is a complete planning pass, and every implementation status remains unchecked. A construction chosen using a basis, a composition series, a coefficient field or a lattice has a canonical **isomorphism class**; equality of separately chosen representatives is not an acceptance condition.

## Conventions and objects

Write Γ for a profinite group, and allow arbitrary topological groups where a construction does not need compactness. For a field F, G_F means its absolute Galois group with the Krull topology. The profinite instances are transported through Tau Ceti's `absoluteGaloisGroupRestrictEquiv` to the Galois group of the separable closure. When F is imperfect, finite Galois quotients and fixed fields use the separable closure. The fixed field inside an algebraic closure cannot be identified with F without a perfectness hypothesis.

A is a commutative topological ring with continuous ring operations. A representation over A consists of a finite projective A-module M, its module topology, an algebraic action, and continuity of the map Γ × M → M. An equivariant A-linear map is a morphism; the module topology makes it continuous. This is the retained `continuous-representation` carrier. The following coefficient cases are part of its contract:

1. A finite extension E of Q_ℓ, with its valuation topology and finite-dimensional modules.
2. A finite field, or an algebraic closure of F_p, with the discrete topology.
3. A complete noetherian local ring with finite residue field and its maximal-ideal-adic topology; finite projective modules are free here.
4. Ω = Q̄_ℓ, represented by `PadicAlgCl ℓ`, with its valuation topology.
5. C with its ordinary topology, giving complex Artin representations of profinite groups.

Ω is the algebraic closure, not its completion. Compactness of Γ supplies the Baire argument for finite coefficient descent; completeness of Ω is neither available nor required. A finite-dimensional module is given the module topology of its actual coefficient field. Every coefficient homomorphism used in a continuous scalar extension must be continuous.

A **framed representation** is a continuous homomorphism to GL_n(A), including n = 0. The units topology records both a matrix and its inverse. A finite basis identifies this with the action on A^n; conjugation and change of frame take place over A. Extending A to a larger ring can identify conjugacy classes that were distinct over A.

For E nonarchimedean local, put O = O_E, choose a uniformizer ϖ, and let k_E be its finite residue field. An **integral model** of an E-representation V is a Γ-stable, finitely generated O-submodule Λ spanning V over E. It is finite free, inherits its module topology, and O → E identifies its generic fibre with V. The current Tau Ceti `GaloisLattice.Basic` carrier concerns finite free integral Galois modules over Z; it is not this O_E-lattice in a specified E-representation.

Algebraic statements about stable subspaces, composition factors, semisimplification and absolute irreducibility are stated first for finite-dimensional representations of an arbitrary **monoid** Δ over a field k. They impose no finite-image condition and put no topology on an algebraic closure of k. Their continuous versions use the subspace, quotient and module-topology comparisons of this part. For a finite-dimensional space over a Hausdorff topological field, a linear complement gives continuous coordinate projections, so the topology on a subspace and on the vector-space quotient is the corresponding module topology. The pinned `Submodule.closed_of_finiteDimensional` theorem is a complete normed-field specialization; the more general topological-field claim uses coordinates, rather than silently dropping that theorem's hypotheses.

## Mathematical route and acceptance

### Continuity, operations and induction

Mathlib `Representation` supplies the algebraic action. `ContRepresentation` requires each operator to be continuous; it does not require continuity in g. The new continuity comparison uses finite generators: orbit maps for a generating family determine joint continuity on a finite free presentation, and the open quotient presentation passes it to M. Over a finite frame this is continuity of matrix coefficients. A discontinuous group character acting on a discrete coefficient module distinguishes the two carriers even when every individual operator is continuous.

Restriction, direct sums, tensor products, duals, internal Hom and character twists are separate constructions. Their carriers, inverse-action conventions and pure-generator equations are stated below. For finite projective M the determinant is defined through a finite free complement. On a constant-rank module it is the action on the invertible top exterior power; current **AlgebraicVectorBundles L0C** supplies that exterior-power theory, and **IHG.0 finite-projective-determinant** supplies its constant-rank determinant polynomial law. The reviewed parent complement determinant supplies the varying-rank extension. This part adds the continuous unit-valued character and imports those algebraic inputs. Applying the free-module `LinearMap.det` directly to an arbitrary nonfree projective module does not supply the required determinant. Rank zero has determinant one.

For H open in Γ, use equivariant functions f on Γ satisfying f(hx) = σ(h)f(x), with right translation (g·f)(x) = f(xg). A finite right transversal identifies this module with a finite product of U. Every such function is continuous; evaluation is a homeomorphism for the compact-open topology. This gives the topological arithmetic upgrade of Mathlib's finite-index induction/coinduction comparison. The current **RepresentationTheory/InductionRestriction** roadmap owns the algebraic induction-in-stages, projection formula and Mackey maps. This part imports them and proves continuity in finite transversal coordinates. It also retains the determinant-of-induction formula, including the sign character; no new algebraic induction programme is introduced.

The required checks include the identity subgroup, induction of a trivial line across an index-two subgroup, and agreement with the existing induction/coinduction carrier. The nonnormal Mackey convention is H\Γ/D in this right-translation model. Normal-subgroup Clifford restriction works in every characteristic. Converse semisimplicity, nonnormal restriction and induction retain their respective invertible-index hypotheses; they are not unrestricted modular Maschke statements.

### Finite coefficients, finite descent and stable lattices

With discrete A and Γ profinite, stabilizers of a finite generating family have open intersection. Thus joint continuity is equivalent to an open kernel, and the image is finite even if A is infinite. For algebraic finite-field coefficients, finitely many matrices generate a finite coefficient field. This is descent of a selected framed model. The smallest possible field after changing basis is the different R01.5 realisability target.

A continuous complex representation of Γ has finite image by the no-small-subgroups property of GL_n(C): pull back a sufficiently small neighborhood, put an open subgroup of Γ inside it, and its image is trivial. This argument does not assert that arbitrary compact subgroups of GL_n(C) are finite.

For Ω-valued continuous matrices, countably many closed finite coefficient fields cover Ω. The closed subgroups on which all matrix entries belong to a fixed coefficient field cover Γ. Baire's theorem makes one of these subgroups open. Finitely many coset representatives add finitely many algebraic coefficients, yielding a finite extension containing the whole image. The same construction descends finitely many representations and equivariant maps at once. All comparisons use a common enlargement of coefficient fields.

Over E, compact image preserves an O-lattice. One may take the O-span of the translates of a standard lattice; boundedness puts it inside a scaled standard lattice, and noetherianity makes it finitely generated. A full O-lattice is compact open, and its stabilizer is compact open. Two full lattices are commensurable. Homotheties, sums, intersections, saturated stable subspaces, quotient lattices and integral-valued duals preserve the required full-lattice properties. The actual finite-dimensional generic fibre, not just an abstract free O-module, is retained as data.

### Composition factors and the determinant reconstruction bridge

Use the group or monoid algebra only as an algebraic dictionary for stable subspaces. Its image in End_k(V) is finite-dimensional; the group algebra itself need not be finite-dimensional. Composition series have finite length by the dimension bound. Mathlib's Jordan–Hölder theorem and Tau Ceti's multiplicities supply independence of the factors. Semisimplification is the direct sum of **all** factors with multiplicity. For an exact sequence, characteristic polynomials multiply; semisimplification preserves them. Over an arbitrary field extension, both sides of the scalar-extension comparison are semisimplified. If k is perfect, the finite semisimple image algebra is separable, and scalar extension of an already semisimple representation is semisimple.

Absolute irreducibility means irreducibility after algebraic base change to an algebraic closure. Burnside/density identifies it with nonzero carrier and full operator span. The endomorphism criterion includes irreducibility as well as scalar commuting endomorphisms. A zero representation is excluded, and a rational order-four rotation tests irreducibility without absolute irreducibility.

The finite-residue-field Brauer–Nesbitt theorem requires an explicit dependency on **IntegralHeckeAndGaloisDeterminants IHG.1**. Here is the chain used for confirmed finding `RT-AREA-langlands-1/17`:

1. Compare all characteristic polynomials, not merely traces or determinants.
2. Extend from a perfect field to its algebraic closure; the two semisimple representations stay semisimple.
3. Import **IHG.0 Amitsur's formula** to recover the determinant polynomial law on arbitrary linear combinations of monoid words from their characteristic polynomials. This is equality of the whole law, including its scalar-extension evaluations.
4. Import **IHG.1 algebraically closed reconstruction uniqueness** to obtain an equivariant isomorphism. Its theorem requires no invertibility of a dimension factorial. Dimension zero is treated separately.
5. Descend the isomorphism by Noether–Deuring, applied to the finite-dimensional simultaneous image algebra acting on V ⊕ W. The theorem is not applied to an assumed finite group algebra.

Chenevier's §1.10, Lemma 1.12(ii) and Corollary 1.14, pp.12–14, provide the polynomial-law passage; Theorem 2.12 and Corollary 2.13, pp.28–30, provide reconstruction and uniqueness. Benson–Reichstein Theorem 2.2, p.4, gives Noether–Deuring for finite-dimensional associative algebras. The new arithmetic bridge imports these owners and combines them with perfect-field extension; it does not duplicate their general determinant or reconstruction targets. Trace congruences retain the parent's factorial restrictions and are never substituted for this characteristic-polynomial theorem.

### Chosen reduction, residual class and coefficient automorphisms

General local-ring reduction is scalar extension along A → k_A when the maximal ideal is open. It requires neither a DVR nor completeness. For a stable full O_E-lattice, reduction is Λ/ϖΛ, equivalently k_E ⊗_O Λ. The finite image and open kernel follow from finite discrete coefficients. Its characteristic polynomials reduce from the integral action matrices, and their generic fibres equal those of V.

Different lattices can give different raw reductions. In the unipotent action with matrices [[1,a],[0,1]], the standard lattice gives a nontrivial residual extension, while Oe₁ ⊕ ϖOe₂ gives a split reduction. Their characteristic polynomials coincide. The perfect-field Brauer–Nesbitt bridge therefore gives isomorphic **semisimplified** reductions. Extending to the fixed algebraic residue field κ ≅ F̄_ℓ gives the residual representation of an Ω-representation. A common coefficient descent and a descended comparison isomorphism remove the dependence on the finite field, the descent and the lattice. The residual carrier is a selected representative of this canonical isomorphism class.

A coefficient automorphism σ acts by A ⊗_(A,σ) M; in a frame it applies σ to matrix entries. The underlying old module has no canonical A-linear identity with its twist. Composition has order (M^τ)^σ ≅ M^(σ∘τ). On a perfect field of characteristic p, coefficient Frobenius raises every entry to p. It is trivial on F_p but can change a character over F_(p²). Precomposing a character by conjugation in Γ leaves it unchanged and consequently fails to describe this operation.

For the coefficient Galois group G_(Q_ℓ), the residue-square identity red∘γ = γ̄∘red gives residual(V^γ) ≅ residual(V)^γ̄. Coefficient inertia has trivial residue action; an **arithmetic** Frobenius lift acts as x ↦ x^ℓ on the residue field. The exact valuation/residue action and its kernel are contracts of **LocalFieldsRamification Layers 2 and 4**. This is an action on coefficients, distinct from restricting Γ to a decomposition group or evaluating a base-field Frobenius element.

Tau Ceti already implements the finite-field Teichmüller section. This part composes it with a continuous residual character, proves continuity through its finite image, and adds coefficient-change comparisons. For an F̄_ℓ-valued character, descend the finite image to a finite field, lift in a coefficient field and embed in Ω. Reduction is injective on prime-to-ℓ roots of unity, so the lift is independent of choices for a fixed residue identification. Uniqueness is among prime-to-ℓ torsion-valued lifts. For p odd, the mod-p cyclotomic character gives ω and χ_p = ω⟨χ_p⟩ with ⟨χ_p⟩ valued in 1+pZ_p. An odd-prime logarithm convention is not assigned at p=2.

### Pairings, Ribet lattices and general reductive groups

The retained homothety theorem assumes that the residual representation over k_E is irreducible. This suffices; absolute irreducibility is not required. A perfect symmetric or alternating pairing with continuous similitude multiplier has unit-valued multiplier under the retained compact-image hypotheses. The dual lattice is stable, and homothety uniqueness permits a stable lattice self-dual for a scaling c of the pairing with c in {1,ϖ}. In the alternating case, a symplectic O-basis of that lattice supplies an integral symplectic model. The comparison to a specified symplectic frame uses GSp-conjugacy.

Ribet's Proposition 2.1, pp.154–155, constructs a stable rank-two lattice with a nonsplit residual extension in either prescribed orientation when the generic representation is irreducible and the residual semisimplification is a sum of two characters. Its successive integral conjugations and their convergent upper entries work also when the two characters coincide. Current IHG.1 already owns **Classical Ribet lattice**, but its named export assumes distinct residual characters. Import that export in its exact scope; the full repeated-character specialization is a request to the same owner. The parent ID is retained as the arithmetic application, and a second Ribet target is not planned here.

For a split connected reductive group Ĝ over Z, the parent targets assert conjugacy of a continuous Ω-valued representation into Ĝ(O_E), and independence of the Ĝ-completely reducible residual conjugacy class. These targets use all invariant functions on tuples, not only the characteristic polynomial in one faithful representation. BHKT §3.1, Definitions 3.3 and 3.5 and Proposition 3.6, pp.8–9, supply complete reducibility and parabolic-to-Levi semisimplification. Definition 4.1, p.13, and Theorem 4.5, pp.14–16, supply the full pseudocharacter and reconstruction theorem. The integral and residual arithmetic applications are Theorem 4.8 and Definition 4.9, pp.16–17; Lemma 4.4(i), p.14, is coefficient change.

Two boundaries stay explicit. Current **ReductiveGroupsPartII RG2.3** already owns `compact-elements-in-hyperspecial-subgroups` (2), including compact-subgroup containment after extension, but records a rational-fixed-point/ramification-rescaling source gap. BHKT Theorem 4.8(ii), p.17, invokes Larsen's Lemma 2.4 for the required totally ramified passage when the group is already split. That proof was not obtainable from an authorized primary source in this pass. Import the existing RG2.3 target and resolve that supplier's gap. Second, current IHG has full invariant-tuple carriers and a GL reconstruction export, while the atlas IHG.1 general reductive reconstruction contract still needs the corresponding general export. Neither boundary affects the ordinary GL_n stable-lattice construction. For GL_n, complete reducibility is ordinary semisimplicity and the two residual constructions agree.

## The target-level interface catalogue

The entries below are the refinement packet's mathematical contracts. Each lists its exact hypotheses, API, tests, derivation and prerequisite exports. A suffix such as `refined-dual` always means `ArithmeticGaloisRepresentations:R01.1/refined-dual`; parent suffixes retain that same stage prefix. Small evaluation and functoriality clauses are API items under the current target-level policy in `detail.json`.

### Joint continuity and the algebraic carrier

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-continuity-interface`. Refines `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

For a representation on a finite projective module with the module topology, joint continuity is equivalent to continuity of all orbit maps, and to continuity on a finite generating family. For a finite basis it is equivalent to continuity of every matrix coefficient. ContinuousRep maps injectively to Mathlib ContRepresentation; its image consists exactly of jointly continuous actions. ContRepresentation alone imposes continuity on each operator, not on the group variable.

**Hypotheses.** Γ a topological group; A a commutative topological ring with continuous ring operations. M a finite projective A-module with its module topology; ρ an algebraic representation. Joint continuity is the property being characterized.

**Derivation.** Use a finite generating presentation A^m → M. The module topology is the final topology for this map. On A^m write the action as a finite sum of continuous scalar multiples of the generator orbit maps; descend joint continuity along the open quotient presentation. Restrict a jointly continuous action to each orbit; for a basis use its continuous coordinate maps. Linear operators are continuous by IsModuleTopology.continuous_of_linearMap.

**Needs.** `continuous-representation`, `mathlib:ContRepresentation`, `mathlib:IsModuleTopology`, `mathlib:IsModuleTopology.continuous_of_linearMap`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Determinant character of a finite projective representation

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-determinant`. Refines `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

The action on a finite projective A-module has a continuous determinant character Γ → Aˣ. On a module of constant rank r it is the scalar action on the invertible top exterior power. Equivalently choose M ⊕ Q ≅ A^n and take the determinant of ρ(g) ⊕ id_Q; the result is independent of the complement. On a free module it is LinearMap.det. No basis on M and no rank-two restriction is imposed.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous.

**API.**

- `TauCeti.ContinuousRep.det` (constructor): The complement-independent character Γ → Aˣ.
- `TauCeti.ContinuousRep.continuous_det` (projection): The determinant character is continuous for the units topology.
- `TauCeti.ContinuousRep.det_eq_linearMap_det` (compatibility): For free M, its value coerces to LinearMap.det (ρ g).
- `TauCeti.ContinuousRep.det_ofCharacter` (simp): The determinant of A(χ) is χ.
- `TauCeti.ContinuousRep.det_trivial` (simp): The trivial action has determinant one, including rank zero.

**Unit tests.**

- `R011Tests.det_line` (computation): det A(χ) = χ, including the cyclotomic character.
- `R011Tests.det_zero` (degenerate): The zero representation has determinant one.
- `R011Tests.det_free` (compatibility): In a finite frame its determinant equals Matrix.det of the representing matrix.
- `R011Tests.det_projective_corner` (non-example): For A=F₃×F₃ and the nonfree finite projective ideal P=(1,0)A, the generator of C₂ acting as −id has determinant (−1,1), while LinearMap.det returns 1 because P has no finite basis.

**Derivation.** Import exterior-power finiteness, projectivity and the invertible top exterior power from AlgebraicVectorBundles L0C. Import the reviewed parent complement determinant for varying rank, and IHG.0 finite-projective-determinant for its constant-rank polynomial-law specialization. Apply their multiplicativity and inverse formulas to get unit values; only joint-continuity and character packaging are added here. In a finite free cover the entries depend continuously on g. Determinants are polynomial in these entries; continuity of the inverse follows from g ↦ g⁻¹.

**Needs.** `continuous-representation`, `determinant-through-a-complement`, `exterior-powers-of-finite-projective-modules`, `rank-one-projective-modules-are-invertible`, `IntegralHeckeAndGaloisDeterminants:IHG.0/finite-projective-determinant`, `mathlib:LinearMap.det`.

**Consumer.** GaloisDeformationTheory:GT.0: Determinant characters specify fixed-determinant deformation problems; sums and twists supply their formulas.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Framing and change of basis

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-framing`. Refines `ArithmeticGaloisRepresentations:R01.1/framed-representation`.

A continuous homomorphism Γ → GL_n(A), with the units topology induced by the matrix and its inverse, gives a ContinuousRep on A^n. A finite basis of M gives the inverse construction. Changing the basis b to b′ conjugates the matrix action by P = b.toMatrix b′, with frame_b′ = P⁻¹ frame_b P. Isomorphic free representations correspond exactly to GL_n(A)-conjugate framed actions, over A itself.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous.

**API.**

- `TauCeti.ContinuousRep.ofFramed` (constructor): The action on A^n associated to a continuous GL_n(A)-valued homomorphism.
- `TauCeti.ContinuousRep.frame` (constructor): The continuous GL_n(A)-valued action in a specified basis.
- `TauCeti.ContinuousRep.frameIso` (equivalence): ofFramed (frame b ρ) is equivariantly isomorphic to ρ.
- `TauCeti.ContinuousRep.Framed.continuous_iff_coe` (characterisation): A homomorphism into GL_n(A) is continuous iff its matrix coercion is continuous.
- `TauCeti.ContinuousRep.frame_basis_change` (relation): The change-of-basis matrix gives P⁻¹ frame_b P.
- `TauCeti.ContinuousRep.ofFramed_iso_iff` (characterisation): Isomorphism over A is equivalent to conjugacy over A, not over its fraction field.

**Unit tests.**

- `R011Tests.frame_one` (computation): The 1×1 matrix character yields A(χ).
- `R011Tests.frame_zero` (degenerate): The rank-zero frame gives the zero action.
- `R011Tests.frame_ring` (non-example): The Z_ℓ-actions (1 a;0 1) and (1 ℓa;0 1) are conjugate over Q_ℓ, but not over Z_ℓ.

**Derivation.** Use the finite basis to transport operators and their joint continuity. For a homomorphism continuity of matrix entries gives continuity of inverse entries by evaluation at g⁻¹. An intertwining linear equivalence is an invertible matrix over A; solve its intertwining equation for conjugacy.

**Needs.** `framed-representation`, `refined-continuity-interface`, `mathlib:Matrix.GeneralLinearGroup`.

**Consumer.** GaloisDeformationTheory:GT.0: Framed deformations retain the integral basis and conjugation over the actual coefficient ring.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Scalar extension with its coefficient topology

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-scalar-extension-interface`. Refines `ArithmeticGaloisRepresentations:R01.1/coefficient-extension`.

For a continuous homomorphism A → B of topological commutative rings, B ⊗_A M has the B-module topology and the jointly continuous action id_B ⊗ ρ. Its underlying algebraic representation is exactly Representation.baseChange. Identity and composite scalar extensions have the tensor-product unitor and associator as equivariant continuous equivalences. Determinants commute with scalar extension; for free modules characteristic polynomials do so too. The hypothesis that A → B is continuous is necessary.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous.

**Derivation.** Import Representation.baseChange and its action on pure tensors, finite/projective tensor base change, and the parent scalar-extension construction. Use finite generating presentations to prove joint continuity. Verify the canonical tensor unitor and associator on pure tensors. Use LinearMap.charpoly_baseChange and LinearMap.det_baseChange in a finite free complement.

**Needs.** `coefficient-extension`, `tauceti:Representation.baseChange`, `mathlib:LinearMap.charpoly_baseChange`, `mathlib:LinearMap.det_baseChange`, `refined-continuity-interface`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Invariants and intertwining maps under field extension

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-invariants-hom`.

For every field extension k → L and finite-dimensional representations of any monoid Δ, the canonical maps L ⊗_k V^Δ → (L ⊗_k V)^Δ and L ⊗_k Hom_Δ(V,W) → Hom_Δ(L ⊗_k V,L ⊗_k W) are linear equivalences. These statements do not require Δ finite. Between representations defined over a finite extension of Q_ℓ, every intertwiner over Q̄_ℓ is defined over a further finite extension.

**Hypotheses.** k a field, Δ any monoid, V and W finite-dimensional k-vector spaces. Algebraic statements have no topology or finite-image hypothesis; continuous versions use a Hausdorff topological field and module topologies.

**Derivation.** Replace the infinitely many linear fixed-vector or intertwiner equations by a finite subfamily spanning their equations in the finite-dimensional dual space. Express the solutions as a kernel of a map to a finite product. Flat scalar extension commutes with this kernel. The finitely many coefficients of an intertwiner over Q̄_ℓ generate a finite coefficient extension. The pinned Tau Ceti intertwiner-dimension theorem assumes a finite monoid, so it supplies that special case only.

**Needs.** `coefficient-extension`, `tauceti:Representation.baseChange`, `tauceti:Representation.finrank_intertwiningMap_baseChange`, `mathlib:Representation.linHom`.

**Source.** [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation. [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), Proof of Theorem 4.8(i), p.16. Finite coefficient descent is the arithmetic consumer; this Hom-space extension statement is a finite-dimensional kernel derivation, not an additional claim attributed to that proof.

### Restriction along a continuous homomorphism

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-restriction`. Refines `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

Res_φ ρ(h) = ρ(φ(h)) on M for φ : Γ′ → Γ continuous. Identity and composite restrictions agree. Restriction commutes with base change and each module operation.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous.

**API.**

- `TauCeti.ContinuousRep.res` (constructor): Precompose the action by a continuous group homomorphism.
- `TauCeti.ContinuousRep.res_apply` (simp): (Res_φ ρ)(h)m = ρ(φ h)m.
- `TauCeti.ContinuousRep.res_comp` (functoriality): Res_ψ Res_φ = Res_(φ ∘ ψ).
- `TauCeti.ContinuousRep.res_id` (simp): Restriction along the identity equals the original action.
- `TauCeti.ContinuousRep.res_baseChange` (compatibility): Restriction and continuous coefficient extension commute.

**Unit tests.**

- `R011Tests.res_id` (degenerate): Identity restriction gives the original representation.
- `R011Tests.res_trivial_group` (computation): Restriction to the trivial group has the identity action on M.
- `R011Tests.res_algebraic` (compatibility): Forgetting continuity gives algebraic precomposition of Representation.

**Derivation.** Reuse the underlying algebraic action on the displayed carrier. Check the action formula on generators and use the group law; inverse actions are used for duals and Hom. Use finite projective generating presentations and continuous ring operations for joint continuity; the canonical carrier maps give the stated compatibilities.

**Needs.** `continuous-representation`, `restriction-dual-tensor-twist`, `refined-continuity-interface`, `mathlib:IsModuleTopology.continuous_of_linearMap`.

**Consumer.** ArithmeticGaloisRepresentations:R01.2: Local decomposition-group actions are restrictions along the selected continuous embedding.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Finite direct sum

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-sum`. Refines `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

M ⊕ N, represented by M × N for two summands, carries the block action (ρ(g)m, σ(g)n). The inclusions and projections are intertwiners; the determinant is det ρ · det σ.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous.

**API.**

- `TauCeti.ContinuousRep.directSum` (constructor): The componentwise action on M × N.
- `TauCeti.ContinuousRep.directSum_apply` (simp): Evaluation is (ρ(g)m, σ(g)n).
- `TauCeti.ContinuousRep.directSum_charpoly` (compatibility): For free modules the characteristic polynomial is the product of those of the summands.
- `TauCeti.ContinuousRep.det_directSum` (compatibility): Determinants multiply under direct sum.

**Unit tests.**

- `R011Tests.sum_lines` (computation): The action on A(χ) ⊕ A(ψ) is diagonal with entries χ(g), ψ(g).
- `R011Tests.sum_zero` (degenerate): The zero summand contributes the zero coordinate and determinant one.
- `R011Tests.sum_det` (compatibility): The determinant of a two-line sum is χψ; it is not χ+ψ.

**Derivation.** Reuse the underlying algebraic action on the displayed carrier. Check the action formula on generators and use the group law; inverse actions are used for duals and Hom. Use finite projective generating presentations and continuous ring operations for joint continuity; the canonical carrier maps give the stated compatibilities.

**Needs.** `continuous-representation`, `restriction-dual-tensor-twist`, `refined-continuity-interface`, `mathlib:IsModuleTopology.continuous_of_linearMap`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-algebraic-semisimplification: Semisimplification is a finite sum of simple factors and preserves the product of their characteristic polynomials.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Tensor product

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-tensor`. Refines `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

M ⊗_A N carries ρ(g) ⊗ σ(g). The action preserves the tensor relations and is jointly continuous for the module topology. Tensor symmetry and unitors are intertwiners. For constant free ranks m,n the determinant is (det ρ)^n (det σ)^m.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous.

**API.**

- `TauCeti.ContinuousRep.tensor` (constructor): The tensor representation on M ⊗_A N.
- `TauCeti.ContinuousRep.tensor_apply_tmul` (simp): g acts on m ⊗ n as ρ(g)m ⊗ σ(g)n.
- `TauCeti.ContinuousRep.tensor_comm` (equivalence): The tensor swap is an equivariant linear equivalence.
- `TauCeti.ContinuousRep.det_tensor` (compatibility): For free ranks m,n, det(M⊗N) = det(M)^n det(N)^m.

**Unit tests.**

- `R011Tests.tensor_lines` (computation): A(χ) ⊗ A(ψ) has product character χψ under A ⊗ A ≅ A.
- `R011Tests.tensor_zero` (degenerate): Tensoring with the zero module gives rank zero.
- `R011Tests.tensor_mathlib` (compatibility): Forgetting continuity gives Mathlib Representation.tprod.

**Derivation.** Reuse the underlying algebraic action on the displayed carrier. Check the action formula on generators and use the group law; inverse actions are used for duals and Hom. Use finite projective generating presentations and continuous ring operations for joint continuity; the canonical carrier maps give the stated compatibilities.

**Needs.** `continuous-representation`, `restriction-dual-tensor-twist`, `refined-continuity-interface`, `mathlib:IsModuleTopology.continuous_of_linearMap`, `mathlib:Representation.tprod`, `mathlib:IsModuleTopology.continuous_bilinear_of_finite_left`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-lattice-reduction: Tensor lattices and their reductions require the explicit pure-tensor equivariance formula.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Contragredient dual

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-dual`. Refines `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

M∨ = Hom_A(M,A) carries (g·λ)(m) = λ(ρ(g⁻¹)m). The evaluation and coevaluation are equivariant; M ≅ M∨∨ for finite projective M; the determinant is (det ρ)⁻¹. The inverse in the action is essential.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous.

**API.**

- `TauCeti.ContinuousRep.dual` (constructor): The inverse-transpose action on the A-linear dual.
- `TauCeti.ContinuousRep.dual_apply` (simp): (g·λ)(m) = λ(ρ(g⁻¹)m).
- `TauCeti.ContinuousRep.dual_dual` (equivalence): The evaluation map M → M∨∨ is equivariant and an isomorphism.
- `TauCeti.ContinuousRep.det_dual` (compatibility): det M∨ is the inverse character of det M.

**Unit tests.**

- `R011Tests.dual_line` (computation): The dual of A(χ) acts by χ⁻¹.
- `R011Tests.dual_zero` (degenerate): The dual of the zero representation is zero.
- `R011Tests.dual_pairing` (compatibility): Evaluation (g·λ)(g·m) = λ(m); using g instead of g⁻¹ fails for a character of order >2.

**Derivation.** Reuse the underlying algebraic action on the displayed carrier. Check the action formula on generators and use the group law; inverse actions are used for duals and Hom. Use finite projective generating presentations and continuous ring operations for joint continuity; the canonical carrier maps give the stated compatibilities.

**Needs.** `continuous-representation`, `restriction-dual-tensor-twist`, `refined-continuity-interface`, `mathlib:IsModuleTopology.continuous_of_linearMap`, `mathlib:Representation.dual`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-lattice-dual: The dual integral lattice uses the contragredient action and its evaluation pairing.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Internal Hom

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-internal-hom`. Refines `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

Hom_A(M,N) carries g·f = σ(g) ∘ f ∘ ρ(g⁻¹). It is finite projective with the module topology. Its invariants are exactly equivariant linear maps M → N; M∨ ⊗ N ≅ Hom_A(M,N). In the normed finite-dimensional specialization the comparison f ↦ f.toContinuousLinearMap intertwines this action with Tau Ceti ContRepresentation.linHom.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous.

**API.**

- `TauCeti.ContinuousRep.hom` (constructor): The conjugation action on A-linear maps.
- `TauCeti.ContinuousRep.hom_apply` (simp): (g·f)(m) = σ(g)(f(ρ(g⁻¹)m)).
- `TauCeti.ContinuousRep.invariants_hom` (characterisation): Invariants are exactly ContinuousRep.Hom intertwiners.
- `TauCeti.ContinuousRep.homEquivDualTensor` (equivalence): Hom_A(M,N) ≅ M∨ ⊗ N equivariantly.
- `TauCeti.ContinuousRep.hom_toLinHom` (compatibility): The normed finite-dimensional comparison commutes with Tau Ceti linHom on continuous linear maps.

**Unit tests.**

- `R011Tests.hom_lines` (computation): Hom(A(χ),A(ψ)) has character ψχ⁻¹.
- `R011Tests.hom_zero` (degenerate): Hom(0,N) is the zero module.
- `R011Tests.hom_identity` (compatibility): The identity on M is invariant in Hom(M,M).

**Derivation.** Reuse the underlying algebraic action on the displayed carrier. Check the action formula on generators and use the group law; inverse actions are used for duals and Hom. Use finite projective generating presentations and continuous ring operations for joint continuity; the canonical carrier maps give the stated compatibilities.

**Needs.** `continuous-representation`, `restriction-dual-tensor-twist`, `refined-continuity-interface`, `mathlib:IsModuleTopology.continuous_of_linearMap`, `refined-dual`, `refined-tensor`, `mathlib:Representation.linHom`, `tauceti:ContRepresentation.linHom`, `tauceti:ContRepresentation.conj_linHom`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-invariants-hom: Invariants in the conjugation action identify all intertwiners and allow descent of comparison isomorphisms.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Twist by a continuous character

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-character-twist`. Refines `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

For χ : Γ → Aˣ continuous, M(χ) has the same A-module and action χ(g)ρ(g). It agrees with M ⊗ A(χ), twists compose multiplicatively, and det M(χ) = χ^r det M when M is free of rank r.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous.

**API.**

- `TauCeti.ContinuousRep.twist` (constructor): Scale the action by χ(g).
- `TauCeti.ContinuousRep.twist_apply` (simp): The action is χ(g) • ρ(g)m.
- `TauCeti.ContinuousRep.twist_one` (simp): The trivial character leaves the action unchanged.
- `TauCeti.ContinuousRep.twist_twist` (relation): M(χ)(ψ) = M(χψ).
- `TauCeti.ContinuousRep.twistIsoTensor` (equivalence): M(χ) ≅ M ⊗ A(χ).
- `TauCeti.ContinuousRep.det_twist` (compatibility): For free rank r, det M(χ) = χ^r det M.

**Unit tests.**

- `R011Tests.twist_line` (computation): Twisting A(ψ) by χ yields A(χψ).
- `R011Tests.twist_one` (degenerate): Twist by one equals the original representation.
- `R011Tests.twist_det` (compatibility): A trivial rank-two action twisted by χ has determinant χ², not χ.

**Derivation.** Reuse the underlying algebraic action on the displayed carrier. Check the action formula on generators and use the group law; inverse actions are used for duals and Hom. Use finite projective generating presentations and continuous ring operations for joint continuity; the canonical carrier maps give the stated compatibilities.

**Needs.** `continuous-representation`, `restriction-dual-tensor-twist`, `refined-continuity-interface`, `mathlib:IsModuleTopology.continuous_of_linearMap`, `refined-tensor`, `refined-determinant`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-tate-twists: Integral Tate twists are twists by powers of the continuous cyclotomic character.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### The integral cyclotomic line

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-zl-one`. Refines `ArithmeticGaloisRepresentations:R01.1/tate-twist`.

For a field F and prime ℓ different from char F, Z_ℓ(1) is the line Z_ℓ with the continuous action given by Mathlib’s cyclotomic character. Its reduction modulo ℓ^n is equivariantly isomorphic to μ_(ℓ^n)(F̄), using a compatible choice of primitive roots. The inverse limit has its inverse-limit topology. The comparison is equivariant and depends on that choice of generator, whereas the isomorphism class is canonical.

**Hypotheses.** ℓ prime, ℓ nonzero in F, G_F with its Krull topology; Z_ℓ has its valuation topology.

**API.**

- `TauCeti.ContinuousRep.TateTwist.zlOne` (constructor): The cyclotomic action on Z_ℓ.
- `TauCeti.ContinuousRep.TateTwist.zlOne_apply` (simp): g acts by multiplication by χ_ℓ(g).
- `TauCeti.ContinuousRep.TateTwist.zlOneEquivLimRootsOfUnity` (equivalence): An equivariant topological identification with the compatible ℓ-power roots.
- `TauCeti.ContinuousRep.TateTwist.res_zlOne` (functoriality): Restriction along a field embedding is the cyclotomic line over the larger field.

**Unit tests.**

- `R011Tests.zl_one_det` (computation): The determinant of Z_ℓ(1) is χ_ℓ.
- `R011Tests.zl_one_closed` (degenerate): Over an algebraically closed field the cyclotomic action is trivial.
- `R011Tests.zl_one_roots` (compatibility): The inverse-limit comparison is equivariant with the actual Galois action on roots of unity.

**Derivation.** Use cyclotomicCharacter.continuous and the coefficient map into units to obtain the line. Choose compatible primitive ℓ-power roots and apply cyclotomicCharacter.spec at every level. The levelwise equivariant bijections commute with transition maps and induce a topological inverse-limit equivalence.

**Needs.** `tate-twist`, `mathlib:cyclotomicCharacter`, `mathlib:cyclotomicCharacter.continuous`, `mathlib:cyclotomicCharacter.spec`.

**Consumer.** ArithmeticGaloisRepresentations:R01.2: Cyclotomic normalizations of local Frobenius and inertia use the integral line and its roots-of-unity comparison.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### All integral Tate twists

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-tate-twists`. Refines `ArithmeticGaloisRepresentations:R01.1/tate-twist`.

For a continuous coefficient map Z_ℓ → A, define A(n) by χ_ℓ^n for every integer n, and M(n) = M(χ_ℓ^n). Then M(0)=M, M(m)(n)=M(m+n), and M(n)∨ ≅ M∨(−n). Restriction commutes with these twists. In free rank r, det M(n)=det M · χ_ℓ^(nr), with χ_ℓ mapped into Aˣ.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous. Γ = G_F, ℓ prime nonzero in F, A a continuous Z_ℓ-algebra.

**API.**

- `TauCeti.ContinuousRep.TateTwist.tateTwist` (constructor): M(n) for n ∈ Z.
- `TauCeti.ContinuousRep.TateTwist.tateTwist_apply` (simp): g acts by χ_ℓ(g)^n ρ(g).
- `TauCeti.ContinuousRep.TateTwist.tateTwist_zero` (simp): M(0)=M.
- `TauCeti.ContinuousRep.TateTwist.tateTwist_add` (relation): M(m)(n)=M(m+n).
- `TauCeti.ContinuousRep.TateTwist.dual_tateTwist` (compatibility): Duality changes n to −n.

**Unit tests.**

- `R011Tests.tate_minus_one` (computation): The twist −1 of the trivial line has inverse cyclotomic character.
- `R011Tests.tate_zero` (degenerate): Twist zero leaves every action unchanged.
- `R011Tests.tate_add` (compatibility): Twisting by m and n agrees with twisting by m+n, including negative integers.

**Derivation.** Use unit-valued integer powers of the continuous cyclotomic character; negative n uses the inverse character. Apply the character-twist interface and check the exponent laws and the dual action.

**Needs.** `refined-zl-one`, `refined-character-twist`, `refined-dual`.

**Consumer.** PadicHodgeTheory: The coefficient representation is the input to Hodge–Tate twist conventions; no Hodge–Tate comparison is planned here.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Continuous induction and its two adjunctions

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-induction-interface`. Refines `ArithmeticGaloisRepresentations:R01.1/continuous-induction`.

For Γ compact Hausdorff and H open, Ind_H^Γ U is the module of functions f:Γ→U with f(hg)=σ(h)f(g), acted on by (γ·f)(x)=f(xγ). Every such f is continuous; evaluation at a finite transversal of right cosets Hx identifies it topologically and linearly with a finite product of U. Underlying algebraic induction equals coinduction by the finite-index comparison. Hom_Γ(Ind U,M) ≅ Hom_H(U,Res M) and Hom_Γ(M,Ind U) ≅ Hom_H(Res M,U). Induction in stages, the projection formula, invariants, duality, finite sums and scalar extension use their canonical algebraic maps with this module topology. Finite separable extensions L/F give H=G_L ⊂ G_F after an embedding of separable closures.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous. Γ compact Hausdorff; H open, hence of finite index. No index invertibility is assumed.

**Derivation.** Import the parent equivariant-functions continuity and transversal-homeomorphism nodes. Use Mathlib Rep.indCoindIso, indResAdjunction and resCoindAdjunction for both algebraic adjunctions. All intertwiners on finite projective modules are continuous. Import the existing InductionRestriction roadmap’s algebraic transitivity, projection formula and Mackey maps. Verify their continuity through finite transversal coordinates.

**Needs.** `continuous-induction`, `equivariant-functions-are-continuous`, `evaluation-at-a-transversal-is-a-homeomorphism`, `mathlib:Rep.indCoindIso`, `mathlib:Rep.indResAdjunction`, `mathlib:Rep.resCoindAdjunction`, `mathlib:ContRepresentation.coind`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula`.

**Source.** [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation. [Induction, restriction and Clifford theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md), Layers 0–2, transitivity, projection formula and finite-index induction (unpaginated README and Suggested.lean). These algebraic maps are already planned by their owner. Only their finite-projective topological upgrade belongs here.

### Intersection and quotient lattices

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-lattice-saturation`. Refines `ArithmeticGaloisRepresentations:R01.1/integral-model`.

Let O be the valuation ring of a nonarchimedean local coefficient field E, Λ a Γ-stable full O-lattice in V, and W a Γ-stable E-subspace. Λ∩W is a stable full O-lattice in W. The image of Λ in V/W is a stable full O-lattice and equals Λ/(Λ∩W). This quotient is torsion-free because W is an E-subspace, so it is finite free over O.

**Hypotheses.** E nonarchimedean local, O its DVR of integers, Λ finite O-generated and spanning V; W stable. Subspaces and quotients have their E-module topologies.

**API.**

- `TauCeti.GaloisLattice.IntegralModel.saturation` (constructor): The lattice Λ∩W as an O-submodule of W.
- `TauCeti.GaloisLattice.IntegralModel.saturationModel` (constructor): The stable full lattice in the restricted representation.
- `TauCeti.GaloisLattice.IntegralModel.quotientModel` (constructor): The image lattice in V/W.
- `TauCeti.GaloisLattice.IntegralModel.mem_saturation` (simp): w belongs iff its image in V belongs to Λ.
- `TauCeti.GaloisLattice.IntegralModel.quotient_lattice` (compatibility): The quotient lattice is the image under W.mkQ; its kernel is Λ∩W.

**Unit tests.**

- `R011Tests.sat_coordinate` (computation): For Λ=Z_ℓ² and W=Q_ℓ e₁, the intersection is Z_ℓ e₁ and the image is Z_ℓ e₂.
- `R011Tests.sat_zero` (degenerate): Intersection with zero is zero and the quotient lattice is Λ.
- `R011Tests.sat_full` (compatibility): Intersection with V is Λ and the quotient lattice is zero.

**Derivation.** Choose a basis adapted to W and compare Λ with its standard lattice using IntegralModel.exists_pow_le. This proves fullness; O-noetherianity gives finite generation of Λ∩W. The kernel of the quotient map on Λ is Λ∩W. If a nonzero O-scalar sends an element into W, the element was in W. Finite torsion-free O-modules are free over a DVR; restrict the action and take its quotient.

**Needs.** `integral-model`, `lattices-are-compact-open`, `refined-subrepresentation`, `refined-quotient`, `mathlib:Module.free_of_finite_type_torsion_free'`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-lattice-reduction: Stable subobjects and quotients acquire saturated full lattices, so their integral reductions fit exact sequences.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Dual integral model

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-lattice-dual`. Refines `ArithmeticGaloisRepresentations:R01.1/integral-model`.

Λ∨ consists of E-linear functionals λ:V→E taking Λ into O. It is a Γ-stable full O-lattice in V∨ for the inverse action. Pairing identifies Λ∨ with Hom_O(Λ,O); its generic fibre is V∨ and its reduction is the dual of Λ/ϖΛ. Thus (Λ∨)∨=Λ under evaluation. This construction does not presume a self-dual lattice for a given form.

**Hypotheses.** O the DVR of integers of E; Λ stable, finite free and spanning V.

**API.**

- `TauCeti.GaloisLattice.IntegralModel.dual` (constructor): The integral-valued dual lattice.
- `TauCeti.GaloisLattice.IntegralModel.mem_dual` (characterisation): λ ∈ Λ∨ iff λ(x) ∈ O for every x∈Λ.
- `TauCeti.GaloisLattice.IntegralModel.dual_dual_lattice` (equivalence): The bidual lattice is Λ under evaluation.
- `TauCeti.GaloisLattice.IntegralModel.dual_reduction` (compatibility): The reductions of Λ∨ and Λ are perfectly paired over the residue field.

**Unit tests.**

- `R011Tests.dual_lattice_standard` (computation): The dual of the standard lattice O^n is its standard dual lattice.
- `R011Tests.dual_lattice_zero` (degenerate): The dual of the zero lattice is zero.
- `R011Tests.dual_lattice_scaled` (non-example): For c∈Eˣ, (cΛ)∨=c⁻¹Λ∨. On the standard one-dimensional lattice, c equal to a uniformizer distinguishes inverse scaling from direct scaling; units need not distinguish them.

**Derivation.** Choose an O-basis of Λ and its dual basis in V∨. Integral values characterize the O-span of the dual basis. Stability follows by evaluating λ on ρ(g⁻¹)Λ. The perfect evaluation pairing identifies generic fibres and reductions and gives biduality.

**Needs.** `integral-model`, `refined-dual`, `mathlib:Module.free_of_finite_type_torsion_free'`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/self-dual-lattice-for-absolutely-irreducible-residual: Integral perfect pairings and the self-dual-lattice criterion compare the original and dual lattices.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Continuous stable subspace

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-subrepresentation`. Refines `ArithmeticGaloisRepresentations:R01.1/semisimplification`.

For a finite-dimensional ContinuousRep over a Hausdorff topological field k and a Γ-stable k-subspace W, the restricted action gives a ContinuousRep on W with its module topology, equal to the subspace topology. Its inclusion in V is an intertwiner and this construction agrees with Mathlib Subrepresentation.toRepresentation.

**Hypotheses.** k a field, Δ any monoid, V and W finite-dimensional k-vector spaces. Algebraic statements have no topology or finite-image hypothesis; continuous versions use a Hausdorff topological field and module topologies.

**API.**

- `TauCeti.ContinuousRep.submodule_moduleTopology` (compatibility): A finite-dimensional subspace with its subspace topology has the canonical module topology, without an additional instance hypothesis.

- `TauCeti.ContinuousRep.subrep` (constructor): The action on a stable subspace.
- `TauCeti.ContinuousRep.subrep_apply` (simp): Its inclusion carries g·w to ρ(g)w.
- `TauCeti.ContinuousRep.subrep_inclusion` (projection): The inclusion is an equivariant linear map.
- `TauCeti.ContinuousRep.subrep_algebraic` (compatibility): Underlying action equals Subrepresentation.toRepresentation.

**Unit tests.**

- `R011Tests.sub_line` (computation): The first coordinate line of A(χ) ⊕ A(ψ) has character χ.
- `R011Tests.sub_zero` (degenerate): The zero subspace gives rank zero.
- `R011Tests.sub_full` (compatibility): The whole-space subrepresentation agrees with the original action.

**Derivation.** Use Mathlib Subrepresentation for the algebraic carrier. Choose a linear projection splitting the inclusion. The projection is continuous from the canonical module topology, and the inclusion is continuous in the other direction; hence the subspace and module topologies agree. Completeness of the field is unnecessary. Restrict the jointly continuous action.

**Needs.** `continuous-representation`, `mathlib:Subrepresentation`, `mathlib:IsModuleTopology.continuous_of_linearMap`, `refined-continuity-interface`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-composition-factors: Composition series need continuous stable subspaces with the correct module topology.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Continuous quotient representation

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-quotient`. Refines `ArithmeticGaloisRepresentations:R01.1/semisimplification`.

For a Γ-stable finite-dimensional subspace W⊂V over a Hausdorff topological field, V/W with its quotient topology, equal to its module topology, has the action g·[v]=[ρ(g)v]. The quotient map is an intertwiner. No complementary Γ-stable subspace is required.

**Hypotheses.** k a field, Δ any monoid, V and W finite-dimensional k-vector spaces. Algebraic statements have no topology or finite-image hypothesis; continuous versions use a Hausdorff topological field and module topologies.

**API.**

- `TauCeti.ContinuousRep.quotientRep` (constructor): The continuous action on V/W.
- `TauCeti.ContinuousRep.quotientRep_mkQ` (simp): g·W.mkQ(v) = W.mkQ(ρ(g)v).
- `TauCeti.ContinuousRep.quotient_projection` (projection): W.mkQ is an intertwiner onto V/W.
- `TauCeti.ContinuousRep.quotient_algebraic` (compatibility): Forgetting topology gives Representation.quotient.

**Unit tests.**

- `R011Tests.quot_line` (computation): The quotient of χ⊕ψ by its χ-line has character ψ.
- `R011Tests.quot_full` (degenerate): Quotient by V is rank zero.
- `R011Tests.quot_zero` (compatibility): Quotient by zero is equivariantly isomorphic to V.

**Derivation.** Use the algebraic quotient Representation.quotient and module quotient maps. The finite-dimensional vector-space quotient map is open; descend the jointly continuous action. The quotient topology is the module topology; identify the kernel with W.

**Needs.** `continuous-representation`, `refined-subrepresentation`, `mathlib:IsModuleTopology.instQuot`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-composition-factors: The successive stable subquotients supply the simple factors, without a stable complement.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Composition factors of an algebraic representation

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-composition-factors`. Refines `ArithmeticGaloisRepresentations:R01.1/semisimplification`.

For a finite-dimensional representation of any monoid Δ over k, choose a composition series in Submodule k[Δ] V.asModule from zero to V. Its successive factors, transported to representations, form a multiset well defined up to a matching of equivariantly isomorphic factors. Each factor is irreducible; the multiplicity of a simple S is exactly TauCeti.jordanHolderMultiplicity for the group-algebra module V.asModule and factor S.asModule. Continuous versions use the subspace and quotient constructions. The multiset contains every Jordan–Hölder factor, not just the socle.

**Hypotheses.** k a field, Δ any monoid, V and W finite-dimensional k-vector spaces. Algebraic statements have no topology or finite-image hypothesis; continuous versions use a Hausdorff topological field and module topologies.

**API.**

- `TauCeti.AlgRep.compositionSeries` (constructor): A composition series of V.asModule from bottom to top.
- `TauCeti.AlgRep.compositionSeries_endpoints` (projection): Its head is bottom and its last is top.
- `TauCeti.AlgRep.compositionFactors` (constructor): The multiset of representation factors of the selected series.
- `TauCeti.AlgRep.compositionFactors_iso` (relation): Any two such multisets admit an isomorphism matching with multiplicity.
- `TauCeti.AlgRep.factorMultiplicity` (compatibility): Multiplicity is Tau Ceti’s existing Jordan–Hölder multiplicity.

**Unit tests.**

- `R011Tests.factors_simple` (computation): An irreducible representation has just its own isomorphism class as a factor.
- `R011Tests.factors_zero` (degenerate): The zero representation has an empty multiset of factors.
- `R011Tests.factors_unipotent` (non-example): A two-dimensional nontrivial unipotent action has two trivial one-dimensional factors, although its socle has dimension one.

**Derivation.** The image of k[Δ] in End_k(V) is finite-dimensional; strictly increasing stable subspaces have bounded length. Use Mathlib CompositionSeries.jordan_holder and Tau Ceti multiplicities; do not rebuild their count. Transport the finite collection of subquotients through the representation/group-algebra dictionary.

**Needs.** `continuous-representation`, `refined-subrepresentation`, `refined-quotient`, `mathlib:CompositionSeries.jordan_holder`, `tauceti:TauCeti.jordanHolderMultiplicity`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-algebraic-semisimplification: Every factor and its multiplicity enters the direct-sum semisimplification.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Algebraic semisimplification and its continuous refinement

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-algebraic-semisimplification`. Refines `ArithmeticGaloisRepresentations:R01.1/semisimplification`.

For an algebraic finite-dimensional representation V of any monoid, V^ss is the finite direct sum of the composition factors, defined up to equivariant isomorphism. It is semisimple, has the same characteristic polynomials, and V^ss≅V iff V is semisimple. It is additive on exact sequences and idempotent. For any field extension (L⊗V)^ss≅(L⊗V^ss)^ss; the second semisimplification can be removed when k is perfect. For ContinuousRep, every factor and every comparison carries the module topology and is continuous.

**Hypotheses.** k a field, Δ any monoid, V and W finite-dimensional k-vector spaces. Algebraic statements have no topology or finite-image hypothesis; continuous versions use a Hausdorff topological field and module topologies.

**API.**

- `TauCeti.AlgRep.semisimplification` (constructor): The direct sum of all composition factors.
- `TauCeti.AlgRep.isSemisimple_ss` (structure): The resulting algebraic representation is semisimple.
- `TauCeti.AlgRep.charpoly_ss` (compatibility): Every characteristic polynomial agrees with that of V.
- `TauCeti.AlgRep.ss_iso_self_iff` (characterisation): V^ss≅V iff V is semisimple.
- `TauCeti.AlgRep.ss_baseChange` (compatibility): (L⊗V)^ss≅(L⊗V^ss)^ss, for every field extension.
- `TauCeti.AlgRep.ss_exact` (relation): Semisimplification of an extension is the sum of the semisimplifications of its subobject and quotient.

**Unit tests.**

- `R011Tests.ss_zero` (degenerate): The zero representation stays zero.
- `R011Tests.ss_simple` (computation): An irreducible representation is unchanged up to isomorphism.
- `R011Tests.ss_unipotent` (non-example): The two-dimensional unipotent action semisimplifies to two trivial lines, preserving characteristic polynomials and forgetting the extension.

**Derivation.** Use the factors construction and finite direct sums, then Jordan–Hölder matching for independence. Use block upper triangular matrices for characteristic-polynomial preservation and exact-sequence additivity. Flat extension gives a filtration whose factors may further split. Match these factors with those from extending V^ss. For perfect k, import the parent finite image-algebra proof of preservation of semisimplicity; do not assert it for imperfect k.

**Needs.** `semisimple-representations-over-perfect-fields`, `refined-composition-factors`, `refined-sum`, `mathlib:Representation.IsSemisimpleRepresentation`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-lattice-independence-by-determinants: Characteristic-polynomial uniqueness compares the semisimplified reductions of different lattices.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Algebraic absolute irreducibility

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-absolute-irreducibility`. Refines `ArithmeticGaloisRepresentations:R01.1/absolutely-irreducible`.

A finite-dimensional algebraic representation over k is absolutely irreducible exactly when its scalar extension to AlgebraicClosure k is irreducible. There is no topology on this algebraic closure in the definition. Equivalently the carrier is nonzero and the k-span of the group or monoid operators is End_k(V). Equivalently it is irreducible with commuting endomorphisms exactly k. Absolute irreducibility is preserved and reflected by every field extension. The zero representation is excluded by irreducibility.

**Hypotheses.** k a field, Δ any monoid, V and W finite-dimensional k-vector spaces. Algebraic statements have no topology or finite-image hypothesis; continuous versions use a Hausdorff topological field and module topologies.

**API.**

- `TauCeti.AlgRep.IsAbsolutelyIrreducible` (constructor): Irreducibility after algebraic scalar extension to an algebraic closure.
- `TauCeti.AlgRep.absIrr_iff_span` (characterisation): Equivalent to nonzero carrier and full operator span.
- `TauCeti.AlgRep.absIrr_baseChange_iff` (compatibility): Preserved and reflected by every field extension.
- `TauCeti.AlgRep.absIrr_iff_irreducible_end` (characterisation): Equivalent to irreducibility together with scalar commuting endomorphisms.
- `TauCeti.AlgRep.absIrr_continuous` (compatibility): The algebraic predicate agrees with ContinuousRep.IsAbsolutelyIrreducible.

**Unit tests.**

- `R011Tests.abs_line` (computation): Every one-dimensional representation is absolutely irreducible.
- `R011Tests.abs_zero` (degenerate): The zero representation is not absolutely irreducible.
- `R011Tests.abs_rotation` (non-example): The rational two-dimensional order-four rotation is irreducible over Q, but splits over Q(i) and is not absolutely irreducible.

**Derivation.** Use algebraic Representation.baseChange to the algebraic closure. Use the two pinned Burnside/density implications over the algebraic closure and descend the span equality. Scalar extension of the finite-dimensional operator span and intertwiner space proves extension invariance; do not infer absolute irreducibility from End=k without irreducibility.

**Needs.** `absolutely-irreducible`, `refined-invariants-hom`, `tauceti:Representation.asAlgebraHom_surjective_of_isIrreducible`, `tauceti:TauCeti.Representation.isIrreducible_of_asAlgebraHom_surjective`, `tauceti:Representation.baseChange`.

**Consumer.** GaloisDeformationTheory:GT.0: Residual absolute irreducibility is an algebraic condition independent of a topology on the algebraic closure.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Reduction at an open maximal ideal

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-local-reduction`. Refines `ArithmeticGaloisRepresentations:R01.1/reduction-and-residual-semisimplification`.

If A is a topological local ring whose maximal ideal is open, its residue field k_A is discrete and M⊗_A k_A is a ContinuousRep with action induced by ρ. The reduction is base change along the continuous residue map. It commutes with restrictions, sums, tensor products, finite-projective duals and character twists. For M finite free, characteristic polynomials reduce coefficientwise; determinants reduce as unit-valued characters. These assertions require neither A a DVR nor completeness.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous. A local and its maximal ideal open; the residue field has its quotient (discrete) topology.

**API.**

- `TauCeti.ContinuousRep.reduceLocal` (constructor): The action on k_A ⊗_A M.
- `TauCeti.ContinuousRep.reduceLocal_apply_tmul` (simp): g sends a⊗m to a⊗ρ(g)m.
- `TauCeti.ContinuousRep.charpoly_reduceLocal` (compatibility): Characteristic polynomials map by the residue homomorphism.
- `TauCeti.ContinuousRep.det_reduceLocal` (compatibility): Determinants map by the induced units homomorphism.

**Unit tests.**

- `R011Tests.reduce_line` (computation): The reduced line A(χ) has character χ modulo the maximal ideal.
- `R011Tests.reduce_zero` (degenerate): The zero module reduces to zero.
- `R011Tests.reduce_charpoly` (compatibility): For a finite free module, LinearMap.charpoly of every action reduces coefficientwise.

**Derivation.** The residue map is continuous because its kernel is open. Apply the parent coefficient-extension construction. Use the tensor associator, finite-projective dual base change and operation formulas for the compatibilities. Apply determinant and characteristic-polynomial base-change lemmas.

**Needs.** `reduction-and-residual-semisimplification`, `coefficient-extension`, `mathlib:IsLocalRing`, `mathlib:LinearMap.charpoly_baseChange`, `refined-dual`.

**Consumer.** GaloisDeformationTheory:GT.0: Reduction of a finite free local-ring representation gives the prescribed residual deformation datum.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Reduction of a chosen integral model

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-lattice-reduction`. Refines `ArithmeticGaloisRepresentations:R01.1/reduction-and-residual-semisimplification`.

For a coefficient field E with integers O, uniformizer ϖ and finite residue field k, a chosen stable full lattice Λ gives the continuous representation Λ/ϖΛ = k⊗_OΛ. Its kernel is open and its image finite. Its characteristic polynomials are the reductions of the integral action polynomials; after mapping to E they are those of V. This raw reduction depends on Λ. Under O→O′ its reduction base-changes along k→k′.

**Hypotheses.** E a nonarchimedean local field, O its integers, Λ a stable full lattice. O and Λ carry valuation and module topologies; k is finite discrete.

**API.**

- `TauCeti.GaloisLattice.IntegralModel.reduction` (constructor): The raw reduction attached to Λ.
- `TauCeti.GaloisLattice.IntegralModel.residualSS` (constructor): Its semisimplification over k.
- `TauCeti.GaloisLattice.IntegralModel.charpoly_reduction` (compatibility): The action polynomials are the residue of the integral polynomials.
- `TauCeti.GaloisLattice.IntegralModel.finite_image_reduction` (structure): The reduced action has open kernel and finite image.
- `TauCeti.GaloisLattice.IntegralModel.reduction_baseChange` (compatibility): Reduction commutes with coefficient extension through the commutative residue square.
- `TauCeti.GaloisLattice.IntegralModel.reduction_tensor` (compatibility): Reduction commutes with tensor lattices through the map a⊗(m⊗n) ↦ (a⊗m)⊗(1⊗n).

**Unit tests.**

- `R011Tests.lattice_reduce_trivial` (computation): The standard trivial rank-n lattice reduces to the trivial k^n action.
- `R011Tests.lattice_reduce_zero` (degenerate): The zero integral model reduces to zero.
- `R011Tests.lattice_reduce_dependence` (non-example): For the unipotent Z_ℓ-action, Λ=Z_ℓ² reduces nonsplit while Λ′=Z_ℓe₁⊕ℓZ_ℓe₂ reduces split; their semisimplifications agree.

**Derivation.** Apply the local-ring reduction to Λ.toContinuousRep and identify the tensor carrier with the quotient. The action has values in a finite discrete group; use the parent finite-quotient theorem for open kernel and finite image. The generic-fibre equivalence and base-change charpoly formula identify integral coefficients.

**Needs.** `integral-model`, `refined-local-reduction`, `finite-coefficients-and-finite-quotients`, `reduction-and-residual-semisimplification`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-lattice-independence-by-determinants: Integral characteristic polynomials determine a lattice-independent semisimplified reduction.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Brauer–Nesbitt through determinant reconstruction

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-perfect-field-brauer-nesbitt`.

Let k be perfect, Δ a group or monoid, and V,W finite-dimensional semisimple k-representations. Equality of the characteristic polynomials of ρ_V(g) and ρ_W(g) for every g implies an equivariant k-linear isomorphism V≅W. There is no restriction on characteristic or dimension. Equality of traces alone is not the hypothesis. For general V,W this detects their semisimplifications.

**Hypotheses.** k a field, Δ any monoid, V and W finite-dimensional k-vector spaces. Algebraic statements have no topology or finite-image hypothesis; continuous versions use a Hausdorff topological field and module topologies. k perfect; compare full characteristic polynomials for every element.

**Derivation.** Extend scalars to an algebraic closure. The parent perfect-field image-algebra theorem preserves semisimplicity. Use IHG.0’s Amitsur identity to recover equality of determinant polynomial laws on k̄[Δ] from the characteristic polynomials on all monoid words; equality only of the top determinant is insufficient. Use IHG.1 algebraically closed reconstruction uniqueness, yielding an equivariant isomorphism over k̄, without dividing by factorials. Apply Noether–Deuring to the finite-dimensional simultaneous image of k[Δ] in End(V⊕W). In the semisimple case the parent semisimplification-detected-after-field-extension node supplies exactly this descent: composition-factor multiplicities before and after extension determine the original semisimple module. For nonsemisimple inputs first apply characteristic-polynomial preservation under semisimplification. Treat dimension zero separately because IHG reconstruction is stated for positive dimension.

**Needs.** `refined-algebraic-semisimplification`, `semisimple-representations-over-perfect-fields`, `semisimplification-detected-after-field-extension`, `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-of-matrix-representation`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`.

**Source.** [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2), Theorem 2.12, pp.28–30; Corollary 2.13, p.29; §1.10 and Lemma 1.12(ii), pp.12–14. The reconstruction and uniqueness theorem is imported from IHG.1; Amitsur supplies the passage from group characteristic polynomials to the determinant law. [Fields of definition for representations of associative algebras](https://www.math.uni-bielefeld.de/lag/man/581.pdf), Theorem 2.2, p.4. Noether–Deuring reflects an isomorphism of finite-dimensional modules after scalar extension; apply it to the simultaneous finite-dimensional image algebra, not to an assumed finite group algebra. [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Proposition 2.6(b), pp.52–54. The arithmetic use compares full characteristic polynomials of reductions; trace comparison has additional restrictions.

### Lattice independence through Brauer–Nesbitt

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-lattice-independence-by-determinants`.

For a continuous representation of a compact profinite Γ on a finite-dimensional vector space over a nonarchimedean local coefficient field E, any two stable full O_E-lattices Λ,Λ′ have equivariantly isomorphic semisimplified reductions over k_E. Under coefficient extension E⊂E′ the class base-changes to k_E′. Raw reductions may be nonisomorphic; equality holds after semisimplification.

**Hypotheses.** E nonarchimedean local with its valuation topology; k_E finite, hence perfect. Λ and Λ′ are actual stable full O_E-lattices in the same V.

**Derivation.** In an O_E-basis of each lattice the action polynomial is integral and maps to the same E-polynomial. Injectivity of O_E→E gives equality already over O_E. Reduce the polynomials and apply characteristic-polynomial preservation by semisimplification. Apply the perfect-field Brauer–Nesbitt bridge, whose graph explicitly includes IHG.1, then use the residue-square scalar-extension comparison.

**Needs.** `refined-lattice-reduction`, `refined-perfect-field-brauer-nesbitt`, `refined-algebraic-semisimplification`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, p.52 and Proposition 2.6(b), pp.52–54. The lattice-independent object is the semisimplification; its proof can use equality of the full reduced characteristic polynomials. [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2), Theorem 2.12, pp.28–30. Uniqueness over the algebraic closure is the reconstruction input; the perfect-field and descent steps are stated separately here.

### Residual representation over the algebraic residue field

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-residual`. Refines `ArithmeticGaloisRepresentations:R01.1/reduction-and-residual-semisimplification`.

For V a ContinuousRep over Q̄_ℓ=PadicAlgCl ℓ, choose a finite coefficient field E, a model V_E and a stable full O_E-lattice Λ. Extend its reduction to F̄_ℓ and semisimplify. The resulting semisimple ContinuousRep has a canonical isomorphism class independent of E, the descent isomorphism and Λ. A selected representative need not be equal for different choices; it is equivariantly isomorphic. Its image is finite and it descends to a finite residue field.

**Hypotheses.** Γ compact Hausdorff profinite; Q̄_ℓ with its valuation topology; F̄_ℓ discrete. The identification of the algebraic residue field with AlgebraicClosure (ZMod ℓ) is fixed as coefficient data.

**API.**

- `TauCeti.ContinuousRep.residual` (constructor): A chosen residual representative, well defined up to equivariant isomorphism.
- `TauCeti.ContinuousRep.residual_isSemisimple` (structure): The residual representation is semisimple.
- `TauCeti.ContinuousRep.residual_choice_independent` (relation): Every descended lattice construction is isomorphic to the selected representative.
- `TauCeti.ContinuousRep.residual_finite_image` (structure): The selected residual action has finite image.
- `TauCeti.ContinuousRep.residual_charpoly` (compatibility): Its polynomials are the reduced polynomials of any chosen integral model.

**Unit tests.**

- `R011Tests.residual_trivial` (computation): The trivial Q̄_ℓ-line reduces to the trivial F̄_ℓ-line.
- `R011Tests.residual_zero` (degenerate): The zero representation has zero residual representation.
- `R011Tests.residual_unipotent` (non-example): Two raw unipotent lattice reductions differ, but both give the same two trivial lines in the residual representation.

**Derivation.** Use the parent Baire descent theorem to obtain a finite coefficient field and the stable-lattice theorem there. Apply chosen-lattice reduction, extend to F̄_ℓ and semisimplify. Given two descents, invariants/Hom base change places a comparison isomorphism over a common finite extension; apply lattice independence there. Use discrete finite-image descent to prove the arithmetic finiteness property of the representative.

**Needs.** `baire-descent-to-a-finite-coefficient-field`, `continuous-representations-have-stable-lattices`, `residue-field-of-the-algebraic-closure-of-q-ell`, `residual-descent-to-a-finite-field`, `refined-invariants-hom`, `refined-lattice-independence-by-determinants`.

**Consumer.** ArithmeticGaloisRepresentations:R01.5: Residual images and irreducibility statements use its finite-field model and canonical isomorphism class.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Basis-free coefficient automorphism twist

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-coefficient-twist`. Refines `ArithmeticGaloisRepresentations:R01.1/coefficient-frobenius-twist`.

For a continuous ring automorphism σ of A, define M^σ = A⊗_(A,σ)M with the base-changed action. A frame identifies it with the entrywise σ-image of the matrices, but there is no canonical A-linear identity map on the old module. Twists by automorphisms compose with order (M^τ)^σ ≅ M^(σ∘τ). Determinants and free characteristic polynomials map coefficientwise.

**Hypotheses.** Γ a topological group, A a commutative topological ring with continuous ring operations. M and N finite projective A-modules with their module topologies; Γ-actions jointly continuous.

**API.**

- `TauCeti.ContinuousRep.coeffTwistModule` (constructor): Scalar extension along a continuous ring automorphism.
- `TauCeti.ContinuousRep.coeffTwistModule_apply_tmul` (simp): g·(a⊗m)=a⊗ρ(g)m for the σ-algebra structure.
- `TauCeti.ContinuousRep.coeffTwistModule_id` (equivalence): Twisting along the identity is the tensor unitor.
- `TauCeti.ContinuousRep.coeffTwistModule_comp` (functoriality): The composite twist corresponds to σ∘τ, with its tensor associator.
- `TauCeti.ContinuousRep.coeffTwistModule_frame` (compatibility): In a frame its matrices are σ applied entrywise.

**Unit tests.**

- `R011Tests.coeff_identity` (degenerate): The identity automorphism leaves the representation isomorphic to itself.
- `R011Tests.coeff_line` (computation): A character line χ twists to σ∘χ.
- `R011Tests.coeff_frame` (compatibility): Its framed characteristic polynomial maps coefficientwise by σ.

**Derivation.** Use the parent continuous scalar extension with algebra structure given by σ. Check the tensor associator along composites; the order is σ after τ. Transport a finite frame and compare with the existing Framed.map formula.

**Needs.** `coefficient-extension`, `coefficient-frobenius-twist`, `refined-scalar-extension-interface`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-galois-coefficient-reduction: Coefficient Galois conjugation is scalar extension along a continuous coefficient automorphism.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Coefficient Frobenius of a residual representation

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-residual-frobenius`. Refines `ArithmeticGaloisRepresentations:R01.1/coefficient-frobenius-twist`.

For a perfect discrete field k of characteristic p, ρ^(p) is coefficient extension along the Frobenius automorphism x↦x^p. For a framed representation every matrix entry is raised to p. On k=F_p the twist is isomorphic to the original representation. On F_(p²), a character of order p²−1 twists to its p-th power, generally different. This operation changes coefficients and is not precomposition by conjugation in Γ.

**Hypotheses.** p prime, k perfect of characteristic p with the discrete topology.

**API.**

- `TauCeti.ContinuousRep.frobTwistModule` (constructor): The basis-free twist by frobeniusEquiv.
- `TauCeti.ContinuousRep.frobTwist` (compatibility): The existing framed twist has entrywise p-th powers.
- `TauCeti.ContinuousRep.frobTwist_apply` (simp): Each framed entry maps to its p-th power.
- `TauCeti.ContinuousRep.frobTwist_primeField` (equivalence): Over F_p the basis-free twist is isomorphic to ρ.

**Unit tests.**

- `R011Tests.frob_character` (computation): For a line over F_(p²), χ^(p)=χ^p.
- `R011Tests.frob_prime` (degenerate): A framed action over F_p is unchanged.
- `R011Tests.frob_not_conjugation` (non-example): A character is invariant under conjugating Γ, while a coefficient Frobenius may change it.

**Derivation.** Use Mathlib frobeniusEquiv for the actual ring automorphism; discrete continuity is automatic. Apply the basis-free coefficient-twist construction and its frame comparison.

**Needs.** `refined-coefficient-twist`, `mathlib:frobeniusEquiv`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-galois-coefficient-reduction: An arithmetic coefficient-Frobenius lift induces the entrywise residue Frobenius twist.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Galois coefficient action and residual reduction

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-galois-coefficient-reduction`. Refines `ArithmeticGaloisRepresentations:R01.1/coefficient-frobenius-twist`.

For γ∈G_(Q_ℓ), V over Q̄_ℓ, and its induced residue-field automorphism γ̄, residual(V^γ) ≅ residual(V)^γ̄. Elements of coefficient inertia have γ̄=id and leave the residual class unchanged. Arithmetic Frobenius lifts have γ̄:x↦x^ℓ and give the residual coefficient Frobenius twist, independently of the lift. The Galois group acting here is the coefficient Galois group, not Γ.

**Hypotheses.** γ preserves the valuation; choose compatible integral and residue embeddings, so red∘γ=γ̄∘red. LocalFieldsRamification supplies the residue action, its inertia kernel and arithmetic-Frobenius convention.

**Derivation.** Transport a finite coefficient model and lattice by γ to γ(E) and γ(Λ). In an integral frame apply the commutative residue square entrywise; the two raw reduced matrices agree after the coefficient twist. Semisimplify, then use the choice-independent residual construction and its coefficient-extension comparisons.

**Needs.** `refined-residual`, `refined-coefficient-twist`, `refined-residual-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), Lemma 4.4(i), p.14; Theorem 4.8 and Definition 4.9, pp.16–17. Invariant coefficients commute with coefficient change; the arithmetic residue square supplies the stated specialization. [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation.

### Teichmüller lift through a finite residue field

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-finite-teichmuller-character`. Refines `ArithmeticGaloisRepresentations:R01.1/teichmuller-lift-of-a-residual-character`.

For a coefficient field E with finite residue field k_E, and a continuous character ψ̄:Γ→k_Eˣ, its Teichmüller lift is the composite of ψ̄ with TauCeti.teichmuller E:k_Eˣ→O_Eˣ. It is continuous, reduces to ψ̄, and is the unique lift with values killed by #k_E−1. Products, inverses and orders are preserved. Scalar extension of coefficient fields preserves the lift by its residue-and-torsion uniqueness.

**Hypotheses.** E nonarchimedean local; k_E finite discrete; ψ̄ continuous.

**API.**

- `TauCeti.ContinuousRep.Teichmuller.lift` (constructor): The continuous character obtained by composing the Teichmüller section.
- `TauCeti.ContinuousRep.Teichmuller.residue_lift` (simp): Reduction returns ψ̄.
- `TauCeti.ContinuousRep.Teichmuller.eq_lift` (characterisation): The residue and (#k_E−1)-torsion equations characterize the lift.
- `TauCeti.ContinuousRep.Teichmuller.lift_mul` (functoriality): Lifting preserves products and inverses.
- `TauCeti.ContinuousRep.Teichmuller.orderOf_lift` (compatibility): Pointwise orders of values are preserved.
- `TauCeti.ContinuousRep.Teichmuller.lift_baseChange` (compatibility): The lifts agree after extending the coefficient field.

**Unit tests.**

- `R011Tests.teich_one` (degenerate): The trivial character lifts to one.
- `R011Tests.teich_residue` (computation): Every lifted value reduces to the supplied residual value.
- `R011Tests.teich_not_any_lift` (non-example): Multiplying a lifted value by 1+p preserves reduction but generally violates the (#k_E−1)-torsion condition.

**Derivation.** Import the pinned Teichmüller section of reduction and its uniqueness; do not reconstruct the unit section. A continuous finite-valued character has open kernel. Its finite lift is continuous for O_Eˣ. Check the residue and torsion equations after coefficient extension and apply uniqueness.

**Needs.** `teichmuller-lift-of-a-residual-character`, `tauceti:TauCeti.teichmuller`, `tauceti:TauCeti.residue_teichmuller`, `tauceti:TauCeti.eq_teichmuller`.

**Consumer.** ArithmeticGaloisRepresentations:R01.1/refined-algebraic-teichmuller-character: Finite-image residual characters lift in a coefficient field before passage to the algebraic closure.

**Source.** [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory), RepresentationTheory/Basic, Intertwining, Subrepresentation, Semisimple; module topology and tensor-product declarations at the stated pins (unpaginated Lean sources). Algebraic actions and equivariance are existing carriers. This target adds joint continuity or the stated finite-length construction; it does not rebuild the algebraic operation. [Teichmüller lifts in a nonarchimedean local field](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/Teichmuller.lean), TauCeti/NumberTheory/LocalField/Teichmuller.lean: teichmuller, residue_teichmuller, eq_teichmuller (unpaginated Lean source). The finite multiplicative section is already implemented. This target adds its use on continuous character spaces and coefficient-change compatibility.

### Teichmüller lift of an algebraic residual character

**ID:** `ArithmeticGaloisRepresentations:R01.1/refined-algebraic-teichmuller-character`. Refines `ArithmeticGaloisRepresentations:R01.1/teichmuller-lift-of-a-residual-character`.

A continuous character Γ→F̄_ℓˣ for Γ profinite and F̄_ℓ discrete has finite image. Choose a finite subfield containing the image and a coefficient field whose residue field contains it, lift there, and embed the values in Q̄_ℓˣ. The resulting continuous finite prime-to-ℓ order character is independent of these choices for a fixed residue-field identification. It is the unique prime-to-ℓ torsion-valued lift. For p odd the mod-p cyclotomic character lifts to ω, with χ_p=ω·⟨χ_p⟩ and ⟨χ_p⟩ in 1+pZ_p; p=2 is not assigned the odd-prime logarithm convention.

**Hypotheses.** Γ compact profinite; ℓ prime; F̄_ℓ discrete; a fixed identification with the residue field of Q̄_ℓ.

**API.**

- `TauCeti.ContinuousRep.Teichmuller.liftAlgebraic` (constructor): The character into the units of the valuation ring of Q̄_ℓ through a finite coefficient model.
- `TauCeti.ContinuousRep.Teichmuller.liftAlgebraicField` (compatibility): Its image under the valuation-ring embedding is the character into Q̄_ℓˣ.
- `TauCeti.ContinuousRep.Teichmuller.liftAlgebraic_residue` (simp): Residue is the given F̄_ℓ-valued character.
- `TauCeti.ContinuousRep.Teichmuller.liftAlgebraic_unique` (characterisation): Unique prime-to-ℓ torsion-valued character with this residue.
- `TauCeti.ContinuousRep.Teichmuller.liftAlgebraic_model` (compatibility): It agrees with every finite coefficient-field lift.

**Unit tests.**

- `R011Tests.teich_algebraic_one` (degenerate): The trivial F̄_ℓ-character lifts to the trivial Q̄_ℓ-character.
- `R011Tests.teich_algebraic_order` (computation): The order of each finite residual character value is preserved.
- `R011Tests.teich_algebraic_model` (compatibility): Changing the chosen finite residue field gives the same character after embedding into Q̄_ℓ.

**Derivation.** Use finite-image descent and the exhaustion of F̄_ℓ by residue fields of finite coefficient extensions. Lift through the finite-field character construction. Compare two choices over a common coefficient field using its uniqueness theorem. Reduction is injective on prime-to-ℓ roots of unity, giving the claimed uniqueness and order.

**Needs.** `residual-descent-to-a-finite-field`, `residue-fields-of-coefficient-fields`, `reduction-of-roots-of-unity`, `refined-finite-teichmuller-character`.

**Consumer.** GaloisDeformationTheory:GT.0: Prime-to-ell residual determinant characters have a canonical Teichmüller lift for characteristic-zero determinant data.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, pp.50–54, especially Proposition 2.6. Continuous arithmetic representations, integral lattices and their semisimplified reductions motivate the carrier; the displayed module operations are derived from its definition, not asserted as a separate theorem in this source. [Teichmüller lifts in a nonarchimedean local field](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/Teichmuller.lean), Teichmuller.lean, residue_teichmuller and eq_teichmuller; parent roots-of-unity reduction and residue-field exhaustion nodes. Finite-field sections combine through their uniqueness, using injectivity on prime-to-ℓ roots of unity.

## Retained principal carriers

These are the reviewed parent's principal IDs. Their definitions, morphisms and API names remain in the suggested file. Their split clauses are supplied by the preceding refinements; assembly replaces conservative bundle-consumer edges by the exact corresponding exports. The following catalogue records the principal-carrier tests as well as the new tests, so that the refinement does not silently remove the original coefficient, induction or lattice interfaces. Source locators in this section are retained citations from the reviewed parent, rather than claims that every cited book was read again in this pass. Supplier overrides stated above govern exterior powers and Ribet reconstruction.

### Continuous representations on finite projective modules

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

Let Γ be a profinite group (for a field F, Γ = G_F := Field.absoluteGaloisGroup F with its Krull topology; Mathlib gives this group only its group structure, its topology and the IsTopologicalGroup instance, and its compactness, Hausdorff property and total disconnectedness are transported along the isomorphism of topological groups TauCeti.absoluteGaloisGroupRestrictEquiv : Field.absoluteGaloisGroup F ≃ₜ* Gal(F^sep/F), where Mathlib's instances for the Galois extension F^sep/F apply; for imperfect F the fixed field of G_F in the algebraic closure is the perfect closure of F, so the Galois correspondence between closed subgroups and intermediate fields is the one of Gal(F^sep/F)) and A a commutative topological ring with continuous ring operations (IsTopologicalRing). A continuous representation (ContinuousRep Γ A M) is a pair (M, ρ) where M is a finitely generated projective A-module (Module.Finite A M, Module.Projective A M) carrying the module topology (IsModuleTopology A M) and ρ : Γ →* (M →ₗ[A] M) is a Mathlib Representation A Γ M, such that the action map Γ × M → M, (g, m) ↦ ρ(g)m, is continuous for the product topology (joint continuity). A morphism (M, ρ) → (N, σ) is an A-linear map f with f ∘ ρ(g) = σ(g) ∘ f for all g ∈ Γ; it is automatically continuous. Standard coefficient cases: (i) A = E a finite extension of Q_ℓ with its valuation topology (M a finite-dimensional E-vector space); (ii) A = k a finite field, or F̄_p = AlgebraicClosure (ZMod p), with the discrete topology; (iii) A a complete Noetherian local ring with finite residue field and the m_A-adic topology (M is then finite free, since finite projective modules over a local ring are free); (iv) A = Q̄_ℓ := PadicAlgCl ℓ with the topology of its absolute value; (v) A = ℂ with its usual topology (Artin representations). If M has constant rank r, the determinant det ρ : Γ → A^× is the character through which Γ acts on the rank-one projective module ⋀^r_A M (End_A(⋀^r_A M) = A); it is continuous, and for M free it equals LinearMap.det ∘ ρ. Every continuous representation defines a Mathlib ContRepresentation A Γ M (each ρ(g) is a continuous linear map); the converse fails, so ContRepresentation is a compatibility target, not the carrier.

**Hypotheses.** Γ is profinite: compact, Hausdorff, totally disconnected topological group. A is a commutative topological ring with continuous addition, multiplication and negation; Hausdorffness is not required for the definition but holds in all standard cases (i)–(v). M is finitely generated projective over A and carries the module topology; the condition is JOINT continuity of Γ × M → M, which is strictly stronger than continuity of each operator ρ(g). Frobenius, inertia and decomposition groups are not part of this definition; they are R01.2's. The continuous-operation signatures use a topological group Γ and a topological coefficient ring A (continuous addition and multiplication). These hold for the profinite Galois groups and standard coefficient tiers in the statement.

**API.**

- `TauCeti.ContinuousRep` (structure): The structure (M, ρ, finiteness, projectivity, module topology, joint continuity) over a profinite Γ and topological commutative ring A.
- `TauCeti.ContinuousRep.mk'` (constructor): Build a ContinuousRep from a Representation A Γ M on a finite projective module with the module topology and a proof that g ↦ ρ(g)m is continuous jointly in (g, m).
- `TauCeti.ContinuousRep.continuous_action` (projection): The uncurried action Γ × M → M is continuous.
- `TauCeti.ContinuousRep.toContRepresentation` (compatibility): The underlying Mathlib ContRepresentation A Γ M, with toRepresentation equal to the underlying Representation.
- `TauCeti.ContinuousRep.Hom` (structure): Morphisms: A-linear Γ-equivariant maps; Hom.continuous: every morphism is continuous (module topology). Composition and identity form a category; isomorphisms are A-linear Γ-equivariant bijections.
- `TauCeti.ContinuousRep.ext` (extensionality): Two continuous representations on the same M are equal iff ρ(g)m = ρ'(g)m for all g, m.
- `TauCeti.ContinuousRep.continuous_iff_matrixCoeff` (characterisation): For M with a finite basis b, joint continuity is equivalent to continuity of the matrix-coefficient map Γ → M_n(A).
- `TauCeti.ContinuousRep.ofCharacter` (constructor): A continuous character χ : Γ → A^× gives the rank-one representation A(χ) on A.
- `TauCeti.ContinuousRep.det` (data): For M of constant rank r, det ρ : Γ →* A^× is the action on ⋀^r_A M; continuous; det_eq_linearMap_det: equals LinearMap.det ∘ ρ when M is free.
- `TauCeti.ContinuousRep.trivial` (example): The trivial representation on any finite projective M; det = 1.
- `TauCeti.ContinuousRep.continuous_iff_orbit` (characterisation): For a Representation of Γ on a finite projective M with the module topology, joint continuity of Γ × M → M is equivalent to continuity of the orbit map g ↦ ρ(g)m for every m ∈ M, and to the same for m in a finite generating family.
- `TauCeti.ContinuousRep.absoluteGaloisGroup_profinite` (instance): For a field F, Field.absoluteGaloisGroup F with its Krull topology is compact, Hausdorff and totally disconnected; the three properties are transported along TauCeti.absoluteGaloisGroupRestrictEquiv from Gal(F^sep/F), where Mathlib has them.

**Unit tests.**

- `TauCeti.ContinuousRep.not_of_discrete_padic_character` (non-example): With Γ = Z_ℓ, A = Q_ℓ carrying the discrete topology and ρ(a) = (1 + ℓ)^a on M = A, ρ is a Mathlib ContRepresentation but not a ContinuousRep: the action map is not jointly continuous because the kernel {0} is not open. A definition asking only that each ρ(g) be continuous accepts it.
- `TauCeti.ContinuousRep.det_cyclotomic` (computation): For F = Q and the rank-one representation Z_ℓ(χ_ℓ), det ρ = χ_ℓ, and det ρ(c) = −1 for complex conjugation c.
- `TauCeti.ContinuousRep.zero` (degenerate): For every Γ and A, M = 0 with the trivial action is a ContinuousRep of rank 0 with det ρ = 1.
- `TauCeti.ContinuousRep.toContRepresentation_injective` (compatibility): The map ContinuousRep Γ A M → ContRepresentation A Γ M is injective and its image is exactly the ContRepresentations whose uncurried action is continuous.
- `TauCeti.ContinuousRep.continuous_iff_matrixCoeff` (characterisation): On M = A^n, (A^n, ρ) is a ContinuousRep iff g ↦ ρ(g) ∈ M_n(A) ≅ A^{n²} is continuous.

**Derivation.** Data: the underlying Representation A Γ M, the instances Module.Finite, Module.Projective, IsModuleTopology A M, and a proof that the uncurried action is continuous. Compatibility with Mathlib's ContRepresentation: by mathlib:IsModuleTopology.continuous_of_linearMap every A-linear map M → M is continuous, so ρ(g) lifts to M →L[A] M and ContRepresentation.ofMonoidHom applies. The same lemma makes every morphism of representations continuous. Matrix criterion: choose a surjection s : A^n → M with an A-linear section e : M → A^n (projectivity). Then M is a direct summand of A^n, the module topology of M is the subspace and the quotient topology (mathlib:IsModuleTopology.instPi, mathlib:IsModuleTopology.instQuot), and joint continuity of ρ is equivalent to continuity of g ↦ (matrix of e ∘ ρ(g) ∘ s) into M_n(A) ≅ A^{n²}: evaluation End × A^n → A^n is bilinear on a finite module, hence continuous (mathlib:IsModuleTopology.continuous_bilinear_of_finite_left), and conversely matrix coefficients are evaluations of the action at basis vectors followed by coordinate projections. Determinant: for M of constant rank r, ⋀^r_A M (mathlib:ExteriorAlgebra.exteriorPower) is finite projective of rank one (R01.1/exterior-powers-of-finite-projective-modules) and its endomorphisms are the scalars (R01.1/rank-one-projective-modules-are-invertible), so ⋀^r ρ(g) is multiplication by an element det ρ(g) of A, a unit because ρ(g) is invertible. When M is free, this unit is LinearMap.det(ρ(g)) (mathlib:LinearMap.det, the Mathlib determinant, which is defined to be 1 when no finite basis exists and therefore must NOT be used for non-free projective M). Continuity: with s : A^n → M and e : M → A^n as in the matrix criterion, det ρ(g) = det(e ∘ ρ(g) ∘ s + 1 − e ∘ s) (R01.1/determinant-through-a-complement), a polynomial in the matrix coefficients of the criterion, so g ↦ det ρ(g) ∈ A is continuous, and so is g ↦ det ρ(g)⁻¹ = det ρ(g⁻¹), which is what continuity into A^× with the units topology requires. Rank: over a local ring A (cases (i)–(iv)), M is free by mathlib:Module.free_of_flat_of_isLocalRing (projective implies flat), and rank_A M = n is well defined. The absolute Galois group as a profinite group: Mathlib's Field.absoluteGaloisGroup F (mathlib:Field.absoluteGaloisGroup) is Gal(AlgebraicClosure F / F) with derived Group, TopologicalSpace and IsTopologicalGroup instances and no others; Mathlib's compactness instance for a Krull-topologised Galois group needs a Galois extension, which AlgebraicClosure F / F is not when F is imperfect. The instances are obtained by transport along tauceti:TauCeti.absoluteGaloisGroupRestrictEquiv : Field.absoluteGaloisGroup F ≃ₜ* Gal(SeparableClosure F / F) (restriction to the separable closure), whose target is compact (Galois extension), Hausdorff and totally separated (integral extension) by Mathlib's instances for the Krull topology. Statements that use fixed fields of subgroups are made for Gal(F^sep/F) and transported, because the fixed field of G_F in AlgebraicClosure F is the perfect closure of F.

**Needs.** `mathlib:Representation`, `mathlib:ContRepresentation`, `mathlib:IsModuleTopology`, `mathlib:IsModuleTopology.continuous_of_linearMap`, `mathlib:IsModuleTopology.continuous_bilinear_of_finite_left`, `mathlib:IsModuleTopology.instPi`, `mathlib:IsModuleTopology.instQuot`, `mathlib:Module.Projective`, `mathlib:Module.Finite`, `mathlib:Module.free_of_flat_of_isLocalRing`, `mathlib:Field.absoluteGaloisGroup`, `mathlib:ExteriorAlgebra.exteriorPower`, `mathlib:LinearMap.det`, `mathlib:PadicAlgCl`, `exterior-power-base-change`, `exterior-powers-of-finite-projective-modules`, `exterior-power-rank`, `rank-one-projective-modules-are-invertible`, `determinant-through-a-complement`, `tauceti:TauCeti.absoluteGaloisGroupRestrictEquiv`, `mathlib:cyclotomicCharacter`, `mathlib:cyclotomicCharacter.continuous`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 52 (2007 version). Representations of G_Q with coefficients in a topological field are restricted to continuous homomorphisms; the paragraph also announces coefficients in a ring. [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 Notation, arXiv v2 p. 7. The carrier is a continuous representation of an arbitrary profinite group, with coefficients in Q̄_p (overlines lost in the text layer). [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), §2 conventions, arXiv v2 p. 5. Coefficient fields E ⊂ Q̄_ℓ finite over Q_ℓ, case (i) of the definition.

### Framed continuous representations Γ → GL_n(A)

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/framed-representation`.

For Γ profinite, A a commutative topological ring and n ≥ 0, a framed continuous representation is a continuous group homomorphism ρ : Γ → GL_n(A) = Matrix.GeneralLinearGroup (Fin n) A, where GL_n(A) carries the units topology (the topology induced by g ↦ (g, g⁻¹) into M_n(A) × M_n(A), with M_n(A) ≅ A^{n²}). Because g ↦ ρ(g⁻¹) is continuous whenever g ↦ ρ(g) is, a homomorphism ρ is continuous into GL_n(A) iff its composite with GL_n(A) → M_n(A) is continuous. (a) ofFramed ρ := (A^n, ρ) is a ContinuousRep; (b) a ContinuousRep (M, ρ) with an A-basis b of M gives a framed representation frame_b ρ, and frame_{b'} ρ = P⁻¹ (frame_b ρ) P for the change-of-basis matrix P; (c) ofFramed ρ ≅ ofFramed ρ' as ContinuousReps iff ρ' = g ρ g⁻¹ for some g ∈ GL_n(A). Hence isomorphism classes of ContinuousReps on modules isomorphic to A^n are in bijection with GL_n(A)-conjugacy classes of framed representations Γ → GL_n(A). The bijection depends on A: GL_n(B)-conjugacy for B ⊃ A is coarser.

**Hypotheses.** Γ profinite; A commutative topological ring; n ≥ 0. GL_n(A) has the units topology; continuity into GL_n(A) is equivalent to continuity into M_n(A) for homomorphisms from a topological group. Conjugacy is by GL_n(A), not by GL_n of a larger ring.

**API.**

- `TauCeti.ContinuousRep.ofFramed` (constructor): ofFramed ρ : ContinuousRep Γ A (Fin n → A) for a continuous homomorphism ρ : Γ →* GL_n(A).
- `TauCeti.ContinuousRep.frame` (data): frame b ρ : Γ → GL_n(A) for a ContinuousRep with basis b : Basis (Fin n) A M; ofFramed (frame b ρ) ≅ ρ.
- `TauCeti.ContinuousRep.frame_basis_change` (relation): frame b' ρ = P⁻¹ · frame b ρ · P with P = b.toMatrix b'.
- `TauCeti.ContinuousRep.ofFramed_iso_iff` (characterisation): ofFramed ρ ≅ ofFramed ρ' iff ∃ g ∈ GL_n(A), ∀ h, ρ' h = g ρ(h) g⁻¹.
- `TauCeti.ContinuousRep.Framed.map` (functoriality): For a continuous ring homomorphism f : A → B, f ∘ ρ is framed over B; map_id, map_comp; ofFramed (map f ρ) ≅ baseChange f (ofFramed ρ).
- `TauCeti.ContinuousRep.Framed.continuous_iff_coe` (characterisation): Continuity into GL_n(A) ⇔ continuity into M_n(A).
- `TauCeti.ContinuousRep.det_ofFramed` (compatibility): det (ofFramed ρ) = Matrix.det ∘ ρ as continuous characters.

**Unit tests.**

- `TauCeti.ContinuousRep.Framed.conj_not_integral` (non-example): ρ_1(a) = (1 a; 0 1) and ρ_2(a) = (1 ℓa; 0 1) on Z_ℓ are GL_2(Q_ℓ)-conjugate but not GL_2(Z_ℓ)-conjugate; a definition of isomorphism by conjugacy over the fraction field identifies them wrongly.
- `TauCeti.ContinuousRep.Framed.rank_one` (computation): For n = 1, framed representations Γ → GL_1(A) are the continuous characters Γ → A^×, and ofFramed χ = ofCharacter χ.
- `TauCeti.ContinuousRep.Framed.rank_zero` (degenerate): For n = 0 there is exactly one framed representation, and ofFramed of it is the zero representation.
- `TauCeti.ContinuousRep.Framed.continuous_iff_coe` (characterisation): A homomorphism ρ : Γ → GL_n(A) is continuous for the units topology iff its composite Γ → M_n(A) is continuous.

**Derivation.** (a) is R01.1/continuous-representation's matrix criterion for M = A^n. (b) Matrix coefficients with respect to b are continuous by the same criterion; change of basis conjugates by P = matrix of b' in b. (c) An isomorphism A^n → A^n of representations is an invertible matrix g with g ρ(h) = ρ'(h) g; conversely such g is Γ-equivariant, hence an isomorphism (continuity is automatic). Continuity of the inverse: ρ(h)⁻¹ = ρ(h⁻¹) and inversion on Γ is continuous, so continuity into M_n(A) implies continuity into GL_n(A) with the units topology.

**Needs.** `continuous-representation`, `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Representation`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 52 (2007 version). Representations given as continuous homomorphisms into GL_d of the coefficient field. [A modular construction of unramified p-extensions of Q(µ_p)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0034/LOG_0016.pdf), §2, p. 154 (read on the page image). Framed integral representations correspond to stable lattices with a basis; GL_2(𝒪)-conjugation changes the basis. Transcribed from the page image; symbols as printed.

### Extension of coefficients

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/coefficient-extension`.

Let f : A → B be a continuous homomorphism of commutative topological rings and (M, ρ) a ContinuousRep of Γ over A. The base change M_B := B ⊗_A M with ρ_B(g) := id_B ⊗ ρ(g) is a ContinuousRep of Γ over B (finite projective over B, module topology over B), and m ↦ 1 ⊗ m is a continuous Γ-equivariant f-semilinear map. Properties: (a) base change along id is canonically isomorphic to the identity and (M_B)_C ≅ M_C for A → B → C, compatibly with morphisms; (b) det(ρ_B) = f ∘ det ρ; for M free, charpoly ρ_B(g) = Polynomial.map f (charpoly ρ(g)); (c) base change commutes with finite direct sums of the underlying modules; its compatibility with tensor products, duals, Hom, twists, restriction and induction is stated and proved at R01.1/restriction-dual-tensor-twist and R01.1/continuous-induction, which are built on this node; (d) for every extension of fields E ⊂ E′ (topological fields with continuous inclusion, for instance coefficient fields E ⊂ E′ ⊂ Q̄_ℓ or finite fields k ⊂ k′ ⊂ F̄_p; the statement is algebraic and holds for the underlying Mathlib representations of any monoid over any field extension, with no topology), Hom_Γ(V, W) ⊗_E E′ ≅ Hom_Γ(V_{E′}, W_{E′}) and (V_{E′})^Γ = V^Γ ⊗_E E′; (e) Q̄_ℓ-coefficients: every ContinuousRep over a coefficient field E ⊂ Q̄_ℓ = PadicAlgCl ℓ extends to Q̄_ℓ, and by (d) Hom_Γ(V_{Q̄_ℓ}, W_{Q̄_ℓ}) = Hom_Γ(V, W) ⊗_E Q̄_ℓ, so every morphism (and every isomorphism) over Q̄_ℓ between extensions of representations over E is defined over a coefficient field E′ ⊃ E. That every ContinuousRep over Q̄_ℓ arises in this way is R01.1/baire-descent-to-a-finite-coefficient-field, which is built on this node; together the two statements say that the category over Q̄_ℓ is the 2-colimit of the categories over the coefficient fields. Special cases: O_E → E (generic fibre) and O_E → k_E (reduction, R01.1/reduction-and-residual-semisimplification).

**Hypotheses.** f is continuous; the construction fails for discontinuous ring maps. In (d), E′/E is a field extension; invariants and Hom commute with field extension because they are kernels of finitely many linear maps on finite-dimensional spaces. In (e), Q̄_ℓ carries the topology of its absolute value.

**API.**

- `TauCeti.ContinuousRep.baseChange` (constructor): baseChange f M : ContinuousRep Γ B (B ⊗[A] M) for a continuous ring homomorphism f : A →+* B.
- `TauCeti.ContinuousRep.baseChange_apply_tmul` (simp): ρ_B(g)(b ⊗ m) = b ⊗ ρ(g)m.
- `TauCeti.ContinuousRep.baseChangeComp` (functoriality): baseChange g (baseChange f M) ≅ baseChange (g ∘ f) M, and baseChangeId; natural in morphisms.
- `TauCeti.ContinuousRep.det_baseChange` (compatibility): det (baseChange f M) = Units.map f ∘ det M.
- `TauCeti.ContinuousRep.charpoly_baseChange` (compatibility): For M free: charpoly (ρ_B g) = (charpoly (ρ g)).map f.
- `TauCeti.ContinuousRep.invariants_baseChange` (relation): For coefficient fields E ⊂ E′: (V_{E′})^Γ = E′ ⊗ V^Γ; Hom_Γ commutes with the extension.
- `TauCeti.ContinuousRep.baseChange_toRepresentation` (compatibility): The underlying Mathlib Representation of baseChange f M is Tau Ceti's Representation.baseChange: B ⊗_A M with g ↦ id_B ⊗ ρ(g). That algebraic base change is defined for every monoid Γ and every homomorphism of commutative rings, with no topology, and (b) and (d) hold for it; it is the form used over an algebraic closure k̄ of an arbitrary field k.

**Unit tests.**

- `TauCeti.ContinuousRep.baseChange_cyclotomic` (computation): baseChange (algebraMap Z_ℓ Q_ℓ) Z_ℓ(1) ≅ ofCharacter (χ_ℓ : G_F → Q_ℓ^×).
- `TauCeti.ContinuousRep.baseChange_id` (degenerate): baseChange (RingHom.id A) M ≅ M naturally.
- `TauCeti.ContinuousRep.baseChange_discontinuous` (non-example): Along the identity map from Q_ℓ (ℓ-adic topology) to Q_ℓ with the discrete topology, which is not continuous, the base change of Q_ℓ(1) for F = Q (where χ_ℓ has infinite image) is not a ContinuousRep (its kernel is not open); continuity of f is needed.
- `TauCeti.ContinuousRep.finrank_hom_baseChange` (compatibility): For coefficient fields E ⊂ E′, dim_{E′} Hom_Γ(V_{E′}, W_{E′}) = dim_E Hom_Γ(V, W).

**Derivation.** Module side: the underlying representation is Tau Ceti's tauceti:Representation.baseChange (for commutative semirings R → A and a representation of a monoid on an R-module V, the representation g ↦ baseChange of ρ(g) on A ⊗_R V). What this node adds is: B ⊗_A M is finite projective over B (base change of a direct summand of A^n is a direct summand of B^n) with the module topology over B, and the action is jointly continuous. Continuity: on a free cover A^n, the matrix coefficients of ρ_B are f applied to those of ρ, continuous since f is continuous; apply the matrix criterion of R01.1/continuous-representation. Determinant and characteristic polynomial: ⋀^r(B ⊗ M) = B ⊗ ⋀^r M (R01.1/exterior-powers-of-finite-projective-modules (a)), and Matrix.charpoly commutes with Polynomial.map of a ring homomorphism. Invariants over fields: V^Γ = ∩_{g} ker(ρ(g) − 1) is cut out by finitely many g (finite dimension), and kernels of linear maps commute with the flat extension E → E′; Hom_Γ(V, W) = ∩_g ker(f ↦ ρ_W(g) ∘ f − f ∘ ρ_V(g)) inside Hom_E(V, W) is likewise the common kernel of finitely many linear maps on a finite-dimensional space, and Hom_{E′}(V_{E′}, W_{E′}) = Hom_E(V, W) ⊗_E E′; no inverse of ρ_V(g) is used, so the argument applies to a monoid. For a finite group Γ the equality of dimensions dim_{E′} Hom_Γ(V_{E′}, W_{E′}) = dim_E Hom_Γ(V, W) is Tau Ceti's tauceti:Representation.finrank_intertwiningMap_baseChange; the node needs the statement for an arbitrary monoid Γ and as an isomorphism, which the same kernel argument gives after choosing finitely many g that cut out the invariants. Q̄_ℓ: every finite subset of Q̄_ℓ lies in a coefficient field, so by (d) a morphism over Q̄_ℓ between representations defined over E, written in an E-basis of Hom_Γ(V, W), is defined over a coefficient field E′ ⊃ E; if it is an isomorphism over Q̄_ℓ it is one over E′, its determinant being nonzero.

**Needs.** `continuous-representation`, `mathlib:Module.Projective`, `mathlib:Polynomial.map`, `mathlib:LinearMap.charpoly`, `mathlib:PadicAlgCl`, `tauceti:Representation.baseChange`, `tauceti:Representation.finrank_intertwiningMap_baseChange`, `exterior-power-base-change`, `exterior-powers-of-finite-projective-modules`, `exterior-power-rank`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), §2 conventions, arXiv v2 p. 5. Coefficient fields inside Q̄_ℓ, between which coefficients are extended. [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 Notation, arXiv v2 p. 7. The residual representation is defined after extending coefficients to F̄_p and is well defined up to conjugacy, which requires compatibility of reduction with coefficient extension.

### Induction from open subgroups

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/continuous-induction`.

Let Γ be profinite, H ≤ Γ an open subgroup (so of finite index m = [Γ : H]) and (U, σ) a ContinuousRep of H over A. Define Ind_H^Γ U := {f : Γ → U | f(hx) = σ(h) f(x) for all h ∈ H, x ∈ Γ} with (g·f)(x) := f(xg). Then: (a) Ind_H^Γ U is a ContinuousRep of Γ; for any right transversal g_1, …, g_m (Γ = ⊔ H g_i), f ↦ (f(g_i))_i is an A-linear isomorphism onto U^m, so Ind U is finite projective of rank m·rank U; a change of transversal changes the coordinates by a block-monomial matrix with blocks in σ(H), and the module Ind U itself involves no choice; (b) Frobenius reciprocity: Hom_Γ(M, Ind_H^Γ U) ≅ Hom_H(Res_H M, U) (f ↦ ev_1 ∘ f) and Hom_Γ(Ind_H^Γ U, M) ≅ Hom_H(U, Res_H M), naturally; (c) Shapiro on invariants: (Ind_H^Γ U)^Γ ≅ U^H, f ↦ f(1); (d) transitivity: for K ≤ H ≤ Γ open, Ind_H^Γ Ind_K^H W ≅ Ind_K^Γ W, f ↦ (x ↦ f(x)(1)); (e) projection formula Ind_H^Γ(Res_H M ⊗ U) ≅ M ⊗ Ind_H^Γ U; (f) Ind commutes with duals ((Ind U)^∨ ≅ Ind(U^∨)), direct sums and coefficient extension; (g) the underlying Representation is Mathlib's coinduced representation along H.subtype, isomorphic to Mathlib's Representation.ind (Rep.indCoindIso, finite index); with topologies it is isomorphic, as a ContRepresentation, to Mathlib's ContRepresentation.coind along the inclusion, whose carrier is a submodule of C(Γ, U) with the compact-open topology (R01.1/evaluation-at-a-transversal-is-a-homeomorphism). Galois case: for a finite separable extension L/F inside F̄, G_L ≤ G_F is open and Ind_{G_L}^{G_F} is defined.

**Hypotheses.** H is OPEN in Γ; for closed subgroups of infinite index the induced module is not finitely generated and is not a ContinuousRep. Left-module convention: f(hx) = σ(h)f(x), Γ acting by right translation.

**API.**

- `TauCeti.ContinuousRep.ind` (constructor): ind H U : ContinuousRep Γ A (IndV H U) for H : OpenSubgroup Γ.
- `TauCeti.ContinuousRep.ind_apply` (simp): (g · f)(x) = f(x g).
- `TauCeti.ContinuousRep.indEquivPi` (data): For a right transversal (g_i), f ↦ (f(g_i)) : Ind U ≃ₗ (Fin m → U).
- `TauCeti.ContinuousRep.indResEquiv` (universal-property): Hom_Γ(M, Ind U) ≃ Hom_H(Res M, U) and Hom_Γ(Ind U, M) ≃ Hom_H(U, Res M), natural in M and U.
- `TauCeti.ContinuousRep.invariantsIndEquiv` (characterisation): (Ind U)^Γ ≃ U^H, f ↦ f(1).
- `TauCeti.ContinuousRep.indInd` (functoriality): Ind_H^Γ ∘ Ind_K^H ≅ Ind_K^Γ; ind_map, ind_map_comp on morphisms.
- `TauCeti.ContinuousRep.indTensorRes` (relation): Ind(Res M ⊗ U) ≅ M ⊗ Ind U; ind_dual: (Ind U)^∨ ≅ Ind(U^∨); ind_baseChange.
- `TauCeti.ContinuousRep.ind_toContRepresentation` (compatibility): The underlying ContRepresentation is isomorphic (ContRepresentation.Equiv) to ContRepresentation.coind along H → Γ; the isomorphism is the identity on functions.

**Unit tests.**

- `TauCeti.ContinuousRep.Ind.rank` (computation): rank (Ind_H^Γ U) = [Γ : H] · rank U; Ind_H^Γ 1 is the permutation representation on H\Γ.
- `TauCeti.ContinuousRep.Ind.self` (degenerate): Ind_Γ^Γ U ≅ U.
- `TauCeti.ContinuousRep.Ind.closed_infinite_index` (non-example): For the closed subgroup H = {0} of Γ = Z_ℓ, the module {f : Γ → U} is not finitely generated over A when U ≠ 0; the construction requires H open.
- `TauCeti.ContinuousRep.Ind.invariants` (characterisation): (Ind_H^Γ U)^Γ ≅ U^H via f ↦ f(1) (Shapiro on invariants).
- `TauCeti.ContinuousRep.Ind.compat_coind` (compatibility): The underlying ContRepresentation of Ind_H^Γ U is isomorphic to Mathlib's ContRepresentation.coind along H → Γ, and its Representation is isomorphic to Representation.ind H.subtype by Rep.indCoindIso.

**Derivation.** Algebra: the underlying representation is Mathlib's coinduction mathlib:Representation.coind along H.subtype (functions f : Γ → U with f(hx) = σ(h)f(x), Γ acting by right translation, which is the convention of this node). For a subgroup of finite index, mathlib:Rep.indCoindIso (natural in the representation: mathlib:Rep.indCoindNatIso) identifies it with mathlib:Representation.ind. Both Frobenius reciprocities of (b) exist in Mathlib on underlying representations: mathlib:Rep.resCoindAdjunction (Res ⊣ Coind, any monoid homomorphism), mathlib:Rep.indResAdjunction (Ind ⊣ Res), and for finite index mathlib:Rep.resIndAdjunction (Res ⊣ Ind). Morphisms of ContinuousReps are the equivariant linear maps (automatically continuous), so (b) for ContinuousReps is these adjunctions applied to the carrier of (a); the node adds nothing algebraic to (b). Finiteness: Γ/H is finite (mathlib:Subgroup.quotient_finite_of_isOpen, applied to H, whose left and right coset spaces correspond by inversion), and evaluation at a right transversal is an isomorphism Ind U ≅ U^m. Continuity: let N ⊆ H be an open normal subgroup of Γ (mathlib:ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one). For g ∈ N, g_i g g_i⁻¹ ∈ N ⊆ H, so in the coordinates (f(g_i)) the element g acts block-diagonally by σ(g_i g g_i⁻¹), continuous in g; Γ is a finite union of cosets N x, on each of which g ↦ action is the composite of this continuous family with the fixed block-monomial matrix of x (ρ(nx) = ρ(n)ρ(x)). Joint continuity follows from the matrix criterion of R01.1/continuous-representation. With topologies, the underlying ContRepresentation is isomorphic to mathlib:ContRepresentation.coind along the inclusion H → Γ: R01.1/evaluation-at-a-transversal-is-a-homeomorphism shows that every equivariant function is continuous and that the topology induced on the carrier of coind by the compact-open topology is the module topology. (c) is (b) with M the trivial representation A; (d) and (e) are the standard explicit isomorphisms, checked on transversals; (f) by evaluation at a transversal and R01.1/coefficient-extension.

**Needs.** `continuous-representation`, `restriction-dual-tensor-twist`, `coefficient-extension`, `mathlib:ContRepresentation.coind`, `mathlib:Representation.ind`, `mathlib:Rep.indCoindIso`, `mathlib:Rep.indResAdjunction`, `mathlib:Rep.resCoindAdjunction`, `mathlib:Subgroup.quotient_finite_of_isOpen`, `mathlib:ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`, `equivariant-functions-are-continuous`, `evaluation-at-a-transversal-is-a-homeomorphism`, `induced-module-versus-coind`, `mathlib:Representation.coind`, `mathlib:Rep.indCoindNatIso`, `mathlib:Rep.resIndAdjunction`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), §10, proof of Lemma 10.5 (statement on p. 55), arXiv v2 p. 56. The lemma uses algebraic Frobenius reciprocity to test irreducibility of an induced representation. The open-subgroup continuity upgrade follows from the proof given here. [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1), Lemma 10.2.3, arXiv v1 PDF p. 212. The lemma writes an irreducible potentially abelian ρ as Ind_{G_{K_i}}^{G_F} V_i; induction from open subgroups G_{K_i} ≤ G_F is the operation planned here.

### Integral models: Γ-stable lattices

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/integral-model`.

Let E be a coefficient field (nonarchimedean local field) with O_E, ϖ, k_E = O_E/ϖ, and V a ContinuousRep of a profinite Γ over E of dimension n. An integral model of V is a Γ-stable O_E-lattice Λ ⊂ V (finitely generated, spanning, ρ(g)Λ = Λ for all g); then Λ is free of rank n, (Λ, ρ|_Λ) is a ContinuousRep of Γ over O_E (ϖ-adic topology = subspace topology), and Λ ⊗_{O_E} E ≅ V canonically. The set L(V)^Γ of integral models is nonempty (R01.1/compact-subgroups-stabilise-lattices) and is stable under: homothety Λ ↦ cΛ (c ∈ E^×), sums and intersections, and saturation W ∩ Λ for a Γ-stable subspace W ⊂ V (an integral model of W, with Λ/(W ∩ Λ) torsion-free, an integral model of V/W). Any two lattices satisfy ϖ^aΛ ⊂ Λ′ ⊂ ϖ^{−a}Λ for some a ≥ 0. The dual lattice Λ^∨ := {λ ∈ V^∨ : λ(Λ) ⊂ O_E} is an integral model of V^∨. Homothety classes of integral models are the vertices of the Bruhat–Tits tree/building of GL(V) fixed by ρ(Γ) (ReductiveGroupsPartII RG2.2's GL_n model); this identification is a comparison, not used for existence.

**Hypotheses.** E a nonarchimedean local field; V finite-dimensional with the module topology; Γ profinite. Integral models are not unique, even up to homothety (unless the residual representation is irreducible, R01.1/self-dual-lattice-for-absolutely-irreducible-residual).

**API.**

- `TauCeti.GaloisLattice.IntegralModel` (structure): A Γ-stable O_E-lattice Λ in V.
- `TauCeti.GaloisLattice.IntegralModel.toContinuousRep` (projection): (Λ, ρ|_Λ) as a ContinuousRep over O_E; free of rank dim V.
- `TauCeti.GaloisLattice.IntegralModel.genericFibreEquiv` (compatibility): E ⊗_{O_E} Λ ≅ V as ContinuousReps.
- `TauCeti.GaloisLattice.IntegralModel.smul` (functoriality): Homothety cΛ for c ∈ E^×; smul_smul, one_smul.
- `TauCeti.GaloisLattice.IntegralModel.instLattice` (instance): Sums and intersections of integral models are integral models (a lattice structure on L(V)^Γ).
- `TauCeti.GaloisLattice.IntegralModel.exists` (relation): L(V)^Γ is nonempty (R01.1/compact-subgroups-stabilise-lattices).
- `TauCeti.GaloisLattice.IntegralModel.saturation` (constructor): W ∩ Λ for a Γ-stable subspace W, and the quotient lattice in V/W.
- `TauCeti.GaloisLattice.IntegralModel.dual` (constructor): Λ^∨ = {λ ∈ V^∨ : λ(Λ) ⊂ O_E}, an integral model of V^∨; dual_dual = Λ.
- `TauCeti.GaloisLattice.IntegralModel.exists_pow_le` (relation): ∃ a, ϖ^a Λ ≤ Λ′ ≤ ϖ^{−a} Λ.

**Unit tests.**

- `TauCeti.GaloisLattice.IntegralModel.rank_one_unique` (computation): For V = Q_ℓ(1), every integral model is ℓ^k Z_ℓ(1) for a unique k ∈ Z.
- `TauCeti.GaloisLattice.IntegralModel.zero` (degenerate): For V = 0, the only integral model is 0.
- `TauCeti.GaloisLattice.IntegralModel.not_unique` (non-example): For Z_ℓ acting on Q_ℓ² by (1 a; 0 1), Z_ℓ e_1 ⊕ Z_ℓ e_2 and Z_ℓ e_1 ⊕ ℓZ_ℓ e_2 are non-homothetic integral models; a definition of 'the' integral model as a unique lattice up to scaling is wrong.
- `TauCeti.GaloisLattice.IntegralModel.generic_fibre` (compatibility): Λ ⊗_{O_E} E ≅ V as ContinuousReps (R01.1/coefficient-extension along O_E → E).
- `TauCeti.GaloisLattice.IntegralModel.not_lattice_E` (characterisation): A Γ-stable O_E-submodule is an integral model iff it is compact, open and spans V; V itself (not compact when V ≠ 0) is not one.

**Derivation.** A lattice is finitely generated and torsion-free over the discrete valuation ring O_E, a principal ideal domain, hence free (mathlib:Module.free_of_finite_type_torsion_free'); spanning gives rank n. Continuity over O_E: the module topology of Λ ≅ O_E^n is the ϖ-adic product topology, which is the subspace topology from V; joint continuity is inherited. Closure properties: sums and intersections of finitely many lattices are lattices (finitely generated because O_E is Noetherian; spanning because each contains ϖ^a of the other); saturation W ∩ Λ is a lattice in W and Λ/(W ∩ Λ) embeds in V/W as a lattice. Dual lattice: λ(gx) for λ ∈ Λ^∨ and x ∈ Λ is in O_E, so Λ^∨ is stable for the dual action (R01.1/restriction-dual-tensor-twist).

**Needs.** `lattices-are-compact-open`, `compact-subgroups-stabilise-lattices`, `continuous-representations-have-stable-lattices`, `coefficient-extension`, `restriction-dual-tensor-twist`, `mathlib:IsNonarchimedeanLocalField`, `mathlib:Module.free_of_finite_type_torsion_free'`.

**Source.** [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 6.12, printed p. 523 (read on the page image). Replacing ρ_λ by an isomorphic representation so that it takes values in GL_2 of the completed ring of integers: an integral model. [A modular construction of unramified p-extensions of Q(µ_p)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0034/LOG_0016.pdf), §2, printed p. 153 (read on the page image). Ribet's definition of a lattice, in rank 2.

### Semisimplification over a field

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/semisimplification`.

Let k be a topological field (a coefficient field, a finite or algebraically closed field with the discrete topology, Q̄_ℓ) and V a ContinuousRep of a profinite Γ over k. Every Γ-stable subspace W ⊂ V, with the subspace topology (= its module topology, W being a direct summand of V as a k-vector space), is a ContinuousRep, and so is V/W. V has a composition series 0 = V_0 ⊂ V_1 ⊂ … ⊂ V_r = V of Γ-stable subspaces with irreducible quotients (Mathlib Representation.IsIrreducible). The semisimplification V^ss := ⊕_{i=1}^r V_i/V_{i−1} is a semisimple ContinuousRep (IsSemisimpleRepresentation) whose isomorphism class is independent of the composition series (Jordan–Hölder: the composition factors with multiplicities are well defined). Properties: V^ss ≅ V iff V is semisimple; (V^ss)^ss ≅ V^ss; for an exact sequence 0 → W → V → V/W → 0 of ContinuousReps, V^ss ≅ W^ss ⊕ (V/W)^ss; charpoly ρ_{V^ss}(g) = charpoly ρ_V(g) and det V^ss = det V; for a field extension k ⊂ k′, (V ⊗ k′)^ss ≅ (V^ss ⊗ k′)^ss, and if k is perfect then V^ss ⊗ k′ is already semisimple. The construction and every property listed are statements about the underlying Mathlib Representation: they hold verbatim for a representation of an arbitrary monoid on a finite-dimensional vector space over an arbitrary field, with no topology and with algebraic extension of scalars; for ContinuousReps one adds only that all subquotients and isomorphisms are continuous. The algebraic form is the one used over an algebraic closure k̄ (R01.1/brauer-nesbitt, R01.1/absolutely-irreducible).

**Hypotheses.** k a field; V finite-dimensional, so of finite length. Isomorphism classes, not subspaces: V^ss is defined up to isomorphism, as a choice of composition series is made.

**API.**

- `TauCeti.ContinuousRep.semisimplification` (constructor): V^ss, the direct sum of the factors of a chosen composition series; its isomorphism class is canonical.
- `TauCeti.ContinuousRep.subrep` (constructor): A Γ-stable subspace and the quotient by it are ContinuousReps; inclusion and projection are morphisms.
- `TauCeti.ContinuousRep.compositionFactors` (data): The multiset of isomorphism classes of composition factors; equal for V and V^ss. The multiplicity of a simple S in it is Tau Ceti's jordanHolderMultiplicity of S in the k[Γ]-module V.asModule.
- `TauCeti.ContinuousRep.ss_iso_self_iff` (characterisation): V^ss ≅ V ↔ IsSemisimpleRepresentation V.
- `TauCeti.ContinuousRep.ss_exact` (relation): V^ss ≅ W^ss ⊕ (V/W)^ss.
- `TauCeti.ContinuousRep.charpoly_ss` (simp): charpoly ρ_{V^ss}(g) = charpoly ρ_V(g); det_ss.
- `TauCeti.ContinuousRep.ss_baseChange` (compatibility): (V ⊗ k′)^ss ≅ (V^ss ⊗ k′)^ss; for perfect k, V^ss ⊗ k′ is semisimple.

**Unit tests.**

- `TauCeti.ContinuousRep.ss_unipotent` (computation): For Z_p acting on F_p² by (1 a; 0 1), V^ss ≅ trivial ⊕ trivial and V ≇ V^ss.
- `TauCeti.ContinuousRep.ss_irreducible` (degenerate): If V is irreducible then V^ss ≅ V; 0^ss = 0.
- `TauCeti.ContinuousRep.ss_not_socle_sum` (non-example): For the 3-dimensional unipotent Jordan block of Z_p over F_p (p ≥ 3), soc(V) ⊕ V/soc(V) is not semisimple; defining V^ss as a socle-plus-quotient sum is wrong.
- `TauCeti.ContinuousRep.charpoly_ss` (compatibility): charpoly (ρ_{V^ss} g) = charpoly (ρ_V g) for all g, with LinearMap.charpoly.
- `TauCeti.ContinuousRep.ss_exact` (characterisation): For W ⊂ V Γ-stable, V^ss ≅ W^ss ⊕ (V/W)^ss.

**Derivation.** Subrepresentations and quotients are ContinuousReps: a Γ-stable subspace has a k-linear complement, so V ≅ W × W′ topologically (mathlib:IsModuleTopology.instProd), the action on W is the restriction of a jointly continuous action, and V/W carries the quotient = module topology (mathlib:IsModuleTopology.instQuot). Composition series exist by finite dimension. They are taken in the lattice Submodule k[Γ] V.asModule, which is modular, through the order isomorphism mathlib:Subrepresentation.subrepresentationSubmoduleOrderIso (Mathlib has no modular-lattice or Jordan–Hölder instance on the lattice of subrepresentations itself; mathlib:Subrepresentation gives only the lattice). The number of factors isomorphic to a given simple module does not depend on the series (tauceti:TauCeti.compositionMultiplicity_eq_of_head_eq_of_last_eq, which packages mathlib:CompositionSeries.jordan_holder); it is the Jordan–Hölder multiplicity tauceti:TauCeti.jordanHolderMultiplicity, and it is additive in short exact sequences (tauceti:TauCeti.jordanHolderMultiplicity_eq_add_of_exact), which gives V^ss ≅ W^ss ⊕ (V/W)^ss. The factors are irreducible representations (mathlib:Representation.IsIrreducible). Tau Ceti thus already has the multiplicities and their additivity; what this node adds is the representation V^ss itself, its ContinuousRep structure, and the compatibilities with characteristic polynomials and extension of scalars. Semisimplicity of V^ss: a finite direct sum of irreducibles is semisimple (mathlib:Representation.IsSemisimpleRepresentation, mathlib:IsSemisimpleModule). Characteristic polynomials: in a basis adapted to the composition series ρ(g) is block upper triangular with diagonal blocks the factors (mathlib:LinearMap.charpoly). Field extension: a composition series of V gives a filtration of V ⊗ k′ whose subquotients are V_i/V_{i−1} ⊗ k′; refine. If k is perfect, each simple factor stays semisimple after extension of scalars (R01.1/semisimple-representations-over-perfect-fields), so V^ss ⊗ k′ is semisimple.

**Needs.** `continuous-representation`, `restriction-dual-tensor-twist`, `coefficient-extension`, `mathlib:CompositionSeries.jordan_holder`, `mathlib:Subrepresentation`, `mathlib:Representation.IsIrreducible`, `mathlib:Representation.IsSemisimpleRepresentation`, `mathlib:IsSemisimpleModule`, `mathlib:LinearMap.charpoly`, `mathlib:IsModuleTopology.instProd`, `mathlib:IsModuleTopology.instQuot`, `mathlib:Subrepresentation.subrepresentationSubmoduleOrderIso`, `tauceti:TauCeti.jordanHolderMultiplicity`, `tauceti:TauCeti.compositionMultiplicity_eq_of_head_eq_of_last_eq`, `tauceti:TauCeti.jordanHolderMultiplicity_eq_add_of_exact`, `semisimple-representations-over-perfect-fields`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, p. 54 (2007 version). The semisimplification is the unique semisimple representation with the same Jordan–Hölder factors. [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 6.12, printed p. 523 (read on the page image). The semisimplification φ of the reduction ρ̃_λ.

## Retained theorem contracts

The remaining parent targets below are imported, with their original IDs. They add no new refinement nodes. The new determinant, algebraic semisimplification and lattice-independence entries supply the relevant consumer edges. In particular, the residual well-definedness and properties targets consume `refined-lattice-independence-by-determinants`, and the general reductive integral/residual targets consume the supplier contracts with the recorded gaps. Where a parent's prerequisite bundles several constructions, assembly uses the named operation needed by that proof step.

### The determinant of an endomorphism of a projective module through a complement

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/determinant-through-a-complement`.

Let A be a commutative ring and M finite projective. For a finite free complement M⊕N, define det_M(u)=LinearMap.det(u⊕id_N). This is independent of the free complement and its basis, is multiplicative with det_M(id)=1, commutes with arbitrary base change, and is a unit iff u is bijective. For M of constant rank r, it equals the scalar action of ⋀^r u on the invertible module ⋀^r M; for free M it equals LinearMap.det(u). For a splitting e:M→Aⁿ, s:Aⁿ→M with s∘e=id, det_M(u)=det(e∘u∘s+1−e∘s), a polynomial in the two indicated matrices.

**Hypotheses.** A is commutative and M is finite projective. Constant rank r is required only for the global top-exterior-power comparison. A finite free complement exists by projectivity and finite generation.

**Derivation.** For independence of the complement, localise at each maximal ideal. M and each complement become finite free over the local ring, and det(u⊕id_N)=det(u) there by mathlib:LinearMap.det_prodMap. The same local scalar is obtained for every complement; equality at all maximal localisations gives equality in A. No globally constant rank is needed for this argument. For the top-exterior-power comparison assume constant rank r and use R01.1/exterior-power-base-change. Local case: over the local ring A_p the modules M_p and N_p are free (mathlib:Module.free_of_flat_of_isLocalRing), M_p of its local rank (rank r in the constant-rank comparison). Then LinearMap.det(u × id) = LinearMap.det(u) · LinearMap.det(id) = LinearMap.det(u) (mathlib:LinearMap.det_prodMap). For a free module F with basis b_1, …, b_r, ⋀^r F is free on b_1 ∧ ⋯ ∧ b_r (mathlib:Module.Basis.exteriorPower), and (⋀^r v)(b_1 ∧ ⋯ ∧ b_r) = v(b_1) ∧ ⋯ ∧ v(b_r) = LinearMap.det(v) · b_1 ∧ ⋯ ∧ b_r, because an alternating r-linear map on F is a multiple of the basis determinant, which satisfies mathlib:Module.Basis.det_comp. So the scalar of ⋀^r v is LinearMap.det(v) (mathlib:LinearMap.det). Multiplicativity and det_M(id)=1 follow by applying the finite-free determinant identities to (u⊕id_N)(v⊕id_N). A chosen free complement remains a free complement after any base change, so LinearMap.det_baseChange gives arbitrary base-change compatibility; independence identifies this with any other choice. Take N=ker s and transport u⊕id_N along M⊕ker s≅Aⁿ, (m,x)↦e(m)+x, to obtain e∘u∘s+1−e∘s. Finally u⊕id_N is bijective iff u is, and a finite-free endomorphism is bijective iff its determinant is a unit. These arguments require no globally constant rank. Continuity of the determinant character follows from the splitting matrix formula and continuous ring operations, even when the local rank of M varies. All these assertions are a direct extension of the reviewed complement proof; the library determinant is used only on finite free modules.

**Needs.** `exterior-power-base-change`, `exterior-powers-of-finite-projective-modules`, `exterior-power-rank`, `rank-one-projective-modules-are-invertible`, `mathlib:LinearMap.det`, `mathlib:LinearMap.det_prodMap`, `mathlib:LinearMap.det_baseChange`, `mathlib:Module.Basis.det_comp`, `mathlib:Module.Basis.exteriorPower`, `mathlib:Module.free_of_flat_of_isLocalRing`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 52 (2007 version). Exterior powers of the underlying module of a representation, here over a coefficient ring; the determinant of a representation on a projective module is its top exterior power.

### Equivariant functions on open cosets are continuous

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/equivariant-functions-are-continuous`.

Let Γ be a compact topological group, H an open subgroup, (U,σ) a ContinuousRep over a commutative topological ring A, and (gᵢ)ᵢ∈I a finite right transversal for H in Γ. Write C_H(Γ,U) for continuous functions satisfying f(hx)=σ(h)f(x), with compact-open topology. Every set-theoretic function f:Γ→U with f(hx)=σ(h)f(x) is continuous.

**Hypotheses.** Let Γ be a compact topological group, H an open subgroup, (U,σ) a ContinuousRep over a commutative topological ring A, and (gᵢ)ᵢ∈I a finite right transversal for H in Γ. Write C_H(Γ,U) for continuous functions satisfying f(hx)=σ(h)f(x), with compact-open topology.

**Derivation.** (a): Γ is the disjoint union of the open sets Hg_i (mathlib:Subgroup.quotient_finite_of_isOpen for finiteness), and on Hg_i the function is hg_i ↦ σ(h)f(g_i), continuous in h because the orbit maps of a ContinuousRep are continuous (R01.1/continuous-representation, the orbit criterion) and right translation by g_i⁻¹ is a homeomorphism Hg_i → H.

**Needs.** `continuous-representation`, `mathlib:Subgroup.quotient_finite_of_isOpen`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), §10, proof of Lemma 10.5 (statement on p. 55), arXiv v2 p. 56. Lemma 10.5 uses algebraic induction and Frobenius reciprocity; it does not state a compact-open topology comparison. The topology assertion here is derived from the displayed finite-transversal formulas and the pinned definition of ContRepresentation.coind. This retained topological contract is consumed by the induction refinement.

### Evaluation at a transversal is a linear homeomorphism

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/evaluation-at-a-transversal-is-a-homeomorphism`.

Let Γ be a compact topological group, H an open subgroup, (U,σ) a ContinuousRep over a commutative topological ring A, and (gᵢ)ᵢ∈I a finite right transversal for H in Γ. Write C_H(Γ,U) for continuous functions satisfying f(hx)=σ(h)f(x), with compact-open topology. Evaluation f↦(f(gᵢ))ᵢ is an A-linear homeomorphism C_H(Γ,U) ≃ Uᴵ.

**Hypotheses.** Let Γ be a compact topological group, H an open subgroup, (U,σ) a ContinuousRep over a commutative topological ring A, and (gᵢ)ᵢ∈I a finite right transversal for H in Γ. Write C_H(Γ,U) for continuous functions satisfying f(hx)=σ(h)f(x), with compact-open topology.

**Derivation.** By R01.1/equivariant-functions-are-continuous, the inverse is the function fᵤ(hgᵢ)=σ(h)uᵢ. Evaluation is continuous by mathlib:ContinuousEvalConst. Its inverse is continuous by mathlib:ContinuousMap.continuous_of_continuous_uncurry, since on the open set Uᴵ×Hgᵢ its uncurried map is (u,hgᵢ)↦σ(h)uᵢ and σ is jointly continuous.

**Needs.** `equivariant-functions-are-continuous`, `continuous-representation`, `mathlib:ContinuousEvalConst`, `mathlib:ContinuousMap.continuous_of_continuous_uncurry`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), §10, proof of Lemma 10.5 (statement on p. 55), arXiv v2 p. 56. Lemma 10.5 uses algebraic induction and Frobenius reciprocity; it does not state a compact-open topology comparison. The topology assertion here is derived from the displayed finite-transversal formulas and the pinned definition of ContRepresentation.coind. This retained topological contract is consumed by the induction refinement.

### Continuous induction agrees with continuous coinduction

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/induced-module-versus-coind`.

Let Γ be a compact topological group, H an open subgroup, (U,σ) a ContinuousRep over a commutative topological ring A, and (gᵢ)ᵢ∈I a finite right transversal for H in Γ. Write C_H(Γ,U) for continuous functions satisfying f(hx)=σ(h)f(x), with compact-open topology. The compact-open topology on C_H(Γ,U) is its finite-projective A-module topology, and the identity on equivariant functions identifies the induced ContinuousRep with Mathlib ContRepresentation.coind along H→Γ.

**Hypotheses.** Let Γ be a compact topological group, H an open subgroup, (U,σ) a ContinuousRep over a commutative topological ring A, and (gᵢ)ᵢ∈I a finite right transversal for H in Γ. Write C_H(Γ,U) for continuous functions satisfying f(hx)=σ(h)f(x), with compact-open topology.

**Derivation.** (c): U^m carries the module topology (mathlib:IsModuleTopology.instPi) and ev is a linear homeomorphism, so the induced topology on C_H(Γ, U) is the module topology; ev intertwines the actions by right translation, so the identity on functions is an isomorphism of ContRepresentations with mathlib:ContRepresentation.coind.

**Needs.** `evaluation-at-a-transversal-is-a-homeomorphism`, `mathlib:IsModuleTopology.instPi`, `mathlib:ContRepresentation.coind`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), §10, proof of Lemma 10.5 (statement on p. 55), arXiv v2 p. 56. Lemma 10.5 uses algebraic induction and Frobenius reciprocity; it does not state a compact-open topology comparison. The topology assertion here is derived from the displayed finite-transversal formulas and the pinned definition of ContRepresentation.coind. This retained topological contract is consumed by the induction refinement.

### The Mackey decomposition

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/mackey-decomposition`.

Let Γ be profinite, H ≤ Γ open, D ≤ Γ closed, and (U, σ) a ContinuousRep of H over A. The double coset space H\Γ/D is finite. For s ∈ Γ put D_s := D ∩ s⁻¹Hs, an open subgroup of D, and let U^s be the representation of s⁻¹Hs on U given by y ↦ σ(sys⁻¹). Then for any choice of representatives s of the double cosets HsD there is an isomorphism of ContinuousReps of D, Res^Γ_D Ind_H^Γ U ≅ ⊕_{HsD ∈ H\Γ/D} Ind_{D_s}^D (Res^{s⁻¹Hs}_{D_s} U^s), the summand for s being the functions supported on HsD, sent to d ↦ f(sd). Changing the representative s to hsd changes the summand by a canonical isomorphism, so the isomorphism class of the right side is independent of the choices. (With the left-translation model of induction the index set is D\Γ/H, via s ↦ s⁻¹.) The isomorphism of underlying abstract representations is already in Tau Ceti: Rep.mackeyDecomposition gives Res_K Ind_H^G A ≅ ⊕_{K\G/H} Ind_{K ⊓ sHs⁻¹}^K (Res of the conjugate of A) for arbitrary subgroups H, K of an arbitrary group G over a commutative ring, in Mathlib's coinvariant model Rep.ind. What this node adds is: the finiteness of H\Γ/D, the passage to the function model of R01.1/continuous-induction (finite index), and that both sides are ContinuousReps of D and the isomorphism is a morphism of them.

**Hypotheses.** H open, D closed: D_s is then open in D and the summands are inductions from open subgroups. The isomorphism is stated for a fixed choice of representatives.

**Derivation.** H\Γ is finite (Γ compact, H open: mathlib:Subgroup.quotient_finite_of_isOpen after inversion), so H\Γ/D is a finite quotient of it; double cosets are Mathlib's mathlib:DoubleCoset.Quotient. Algebraic core: apply tauceti:Rep.mackeyDecomposition to the abstract group Γ, the subgroups H and K := D and the underlying representation of U. It is an isomorphism Res_D (Rep.ind H.subtype U) ≅ ⊕ over DoubleCoset.Quotient D H of Ind_{D ⊓ sHs⁻¹}^D of the conjugate representation, with chosen representatives; its statement has the group and the coefficient ring in one universe and the representation in that universe. Function model: H has finite index in Γ, and each D_s = D ∩ s⁻¹Hs is open in the compact group D, so of finite index; mathlib:Rep.indCoindIso identifies Rep.ind with the function model of R01.1/continuous-induction on both sides, and s ↦ s⁻¹ identifies D\Γ/H with H\Γ/D. In the function model the isomorphism is the one of the statement: Ind_H^Γ U = ⊕_{HsD} (functions supported on HsD), each summand D-stable, and for f supported on HsD, φ_s(f)(d) := f(sd) satisfies φ_s(f)(yd) = f(s y s⁻¹ · s d) = σ(sys⁻¹) φ_s(f)(d) for y ∈ D_s, so φ_s(f) ∈ Ind_{D_s}^D U^s; φ_s is D-equivariant and bijective (its inverse extends a function on D to HsD by f(hsd) := σ(h)φ(d), well defined because hsd = h′sd′ forces d′d⁻¹ ∈ D_s). The formula can be verified directly in the function model, which also proves the statement without the comparison of models. Continuity: the summands are ContinuousReps of D by R01.1/continuous-induction (D_s open in D) and R01.1/restriction-dual-tensor-twist; the isomorphism is A-linear between modules with the module topology, hence continuous with continuous inverse.

**Needs.** `continuous-induction`, `restriction-dual-tensor-twist`, `mathlib:DoubleCoset.Quotient`, `mathlib:Subgroup.quotient_finite_of_isOpen`, `tauceti:Rep.mackeyDecomposition`, `mathlib:Rep.indCoindIso`.

**Source.** [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), proof of Lemma 3.7(3), arXiv v2 p. 19. Mackey's formula applied to Galois representations induced from an open subgroup G_L and restricted to another open subgroup.

### The determinant of an induced representation

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/determinant-of-induced-representation`.

Let Γ be profinite, H ≤ Γ open of index m, and U a ContinuousRep of H over A, finite projective of constant rank r. Let sgn_{Γ/H} : Γ → {±1} ⊂ A^× be the sign of the permutation action of Γ on the finite set H\Γ (equivalently on Γ/H; the two permutation actions of g are conjugate up to g ↦ g⁻¹, so have the same sign), and Ver_{Γ→H} the transfer, so that det U ∘ Ver := MonoidHom.transfer (det U) : Γ → A^× (A^× is commutative). Then det(Ind_H^Γ U) = sgn_{Γ/H}^r · (det U ∘ Ver_{Γ→H}) as continuous characters of Γ. In particular det Ind_H^Γ 1 = sgn_{Γ/H}, and for U of rank r with det U = 1 one gets sgn_{Γ/H}^r.

**Hypotheses.** H open in Γ (finite index). U of constant rank r (e.g. free of rank r; over a local ring A always). Sign of the permutation of H\Γ; transfer in Mathlib's normalisation (left transversals, diff of transversals).

**Derivation.** Choose a transversal; by R01.1/continuous-induction, g acts on Ind U ≅ U^m by a block-monomial matrix: the block pattern is the permutation π_g of H\Γ and the nonzero blocks are σ(h_i(g)) with h_i(g) ∈ H determined by the transversal. det of a block-monomial matrix with r × r blocks = sgn(π_g)^r · ∏_i det σ(h_i(g)); this holds over any commutative ring (permute block columns, Laplace) and proves the theorem for U free. For U projective of constant rank r the identity between the two characters Γ → A^× is checked after the algebraic base change to the localisation A_p at each maximal ideal p, where U becomes free: A → ∏_p A_p is injective, the determinant commutes with base change (R01.1/determinant-through-a-complement, R01.1/coefficient-extension (b)) and so does induction (R01.1/continuous-induction (f)). ∏_i h_i(g) taken in H^ab is the transfer Ver(g): this is Mathlib's definition of MonoidHom.transfer through mathlib:MonoidHom.transfer (diff of left transversals), after matching right with left transversals by inversion. Continuity is automatic from R01.1/continuous-representation; the sign is Mathlib's mathlib:Equiv.Perm.sign of the permutation action on the finite quotient. This is Gallagher's theorem as stated in Deligne 1973, Proposition 1.2, there for representations over a field; the block-monomial computation gives it over any commutative ring.

**Needs.** `continuous-induction`, `continuous-representation`, `mathlib:MonoidHom.transfer`, `mathlib:Equiv.Perm.sign`, `mathlib:Subgroup.quotient_finite_of_isOpen`, `determinant-through-a-complement`, `coefficient-extension`.

**Source.** [Les constantes des équations fonctionnelles des fonctions L](https://publications.ias.edu/sites/default/files/Number20.pdf), §1, Proposition 1.2 and the following display, Del-8 = printed p. 508 (read on the page image). Deligne's Proposition 1.2: det(Ind_H^G ρ)(x) = det(ρ)(t(x)) for ρ virtual of dimension 0, t the transfer; and for ρ of any dimension det(Ind_H^G ρ)(x) = ε^{dim ρ} det(ρ)(t(x)) with ε the determinant of the permutation representation of G on G/H (read on the page image).

### Discrete coefficients and the open-kernel criterion

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/finite-coefficients-and-finite-quotients`.

Let Γ be profinite. For a discrete commutative ring A and a finite projective A-module M, a representation ρ is jointly continuous iff all vector stabilisers are open iff ker ρ is open iff it factors through Γ/N for an open normal subgroup N. Its image is then finite even when A is infinite.

**Hypotheses.** Let Γ be profinite.

**Derivation.** (i) ⇒ (ii): the orbit map g ↦ ρ(g)m is continuous into the discrete M, so the stabiliser is open. (ii) ⇒ (iii): tauceti:Representation.isOpen_ker_of_finite (the kernel is the intersection of the stabilisers of a finite generating family). (iii) ⇒ (iv): an open subgroup of the profinite Γ contains an open normal subgroup (mathlib:ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one), and Γ/N is finite (mathlib:Subgroup.quotient_finite_of_isOpen). (iv) ⇒ (i): Γ × M → M factors through the discrete finite Γ/N × M.

**Needs.** `continuous-representation`, `tauceti:Representation.isOpen_ker_of_finite`, `mathlib:ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`, `mathlib:Subgroup.quotient_finite_of_isOpen`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 53 (2007 version). Source context for Discrete coefficients and the open-kernel criterion. Mod ℓ representations (continuous into GL_d(k), k finite) have finite image. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration. [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2), Example 2.34, arXiv v2 p. 39. Source context for Discrete coefficients and the open-kernel criterion. Chenevier's example concerns the semisimple ρ : G → GL_d(k̄) attached to a determinant D (the overline is lost in the text layer): with GL_d(k̄) discrete, ρ is continuous iff D is. Continuity of a representation into a discrete group is the open-kernel condition of this node. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Finite Galois factorisation of discrete representations

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/finite-galois-factorisation`.

Let Γ be profinite. For Γ=G_F and discrete coefficients as above, joint continuity is equivalent to factorisation through Gal(L/F) for a finite Galois extension L/F in Fˢᵉᵖ. For imperfect F take fixed fields in Fˢᵉᵖ rather than in F̄.

**Hypotheses.** Let Γ be profinite.

**Derivation.** Galois form: an open subgroup of G_F contains the fixing subgroup of a finite-dimensional normal subextension E/F (tauceti:Field.absoluteGaloisGroup.exists_finiteDimensional_normal_fixingSubgroup_le); the maximal separable subextension L of E is finite Galois over F and Gal(E/F) = Gal(L/F); the quotient is finite by tauceti:Field.absoluteGaloisGroup.finite_quotient_of_isOpen.

**Needs.** `finite-coefficients-and-finite-quotients`, `continuous-representation`, `tauceti:Field.absoluteGaloisGroup.exists_finiteDimensional_normal_fixingSubgroup_le`, `tauceti:Field.absoluteGaloisGroup.finite_quotient_of_isOpen`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 53 (2007 version). Source context for Finite Galois factorisation of discrete representations. Mod ℓ representations (continuous into GL_d(k), k finite) have finite image. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration. [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2), Example 2.34, arXiv v2 p. 39. Source context for Finite Galois factorisation of discrete representations. Chenevier's example concerns the semisimple ρ : G → GL_d(k̄) attached to a determinant D (the overline is lost in the text layer): with GL_d(k̄) discrete, ρ is continuous iff D is. Continuity of a representation into a discrete group is the open-kernel condition of this node. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Artin representations have finite image

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/artin-representations-have-finite-image`.

Let Γ be profinite. Every continuous homomorphism Γ→GL_n(ℂ), with the usual complex topology, has open kernel and finite image.

**Hypotheses.** Let Γ be profinite.

**Derivation.** Artin complement: let U = {g ∈ GL_n(ℂ) : ‖g − 1‖ < 1/2} for an operator norm on M_n(ℂ), an open neighbourhood of 1. ρ⁻¹(U) is an open neighbourhood of 1 in Γ and contains an open normal subgroup N (mathlib:ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one); ρ(N) is a subgroup contained in U, hence trivial by R01.1/no-small-subgroups-in-a-normed-algebra. So ker ρ ⊇ N is open and the image is finite.

**Needs.** `no-small-subgroups-in-a-normed-algebra`, `mathlib:ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`, `mathlib:Subgroup.quotient_finite_of_isOpen`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 53 (2007 version). Source context for Artin representations have finite image. The Artin complement: continuous complex representations of G_Q have finite image. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### No small subgroups in the unit group of a real normed algebra

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/no-small-subgroups-in-a-normed-algebra`.

Let R be a normed ring that is a normed algebra over ℝ (for instance M_n(ℂ) or M_n(ℝ) with an operator norm), and let G ⊂ R^× be a subgroup with sup_{g ∈ G} ‖g − 1‖ < 1. Then G = {1}. In particular the open neighbourhood {g ∈ GL_n(ℂ) : ‖g − 1‖ < 1/2} of 1 contains no nontrivial subgroup, and every continuous homomorphism from a profinite group to GL_n(ℂ) has open kernel and finite image.

**Hypotheses.** The norm is submultiplicative and ‖2x‖ = 2‖x‖ (real normed algebra); the statement is false for p-adic normed algebras. The bound is on the supremum over the whole subgroup, and it must be < 1.

**Derivation.** Let δ := sup_{g ∈ G} ‖g − 1‖ < 1. For g ∈ G the element g² is in G, and g² − 1 = 2(g − 1) + (g − 1)², so 2‖g − 1‖ = ‖2(g − 1)‖ ≤ ‖g² − 1‖ + ‖g − 1‖² ≤ δ + δ‖g − 1‖, that is (2 − δ)‖g − 1‖ ≤ δ (mathlib:NormedAlgebra for ‖2x‖ = 2‖x‖, submultiplicativity of the norm for ‖(g − 1)²‖ ≤ ‖g − 1‖²). Taking the supremum over g ∈ G gives (2 − δ)δ ≤ δ, so δ(1 − δ) ≤ 0; since 0 ≤ δ < 1, δ = 0 and G = {1}. Consequence for GL_n(ℂ): the set {‖g − 1‖ < 1/2} is open in GL_n(ℂ) (units topology) and a subgroup contained in it has δ ≤ 1/2 < 1. For a continuous homomorphism ρ from a profinite group, the preimage of this set contains an open normal subgroup N (mathlib:ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one), and ρ(N) = 1.

**Needs.** `mathlib:NormedAlgebra`, `mathlib:ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 53 (2007 version). The finiteness of the image of an Artin representation, which rests on GL_d(ℂ) having no small subgroups.

### Descent of residual representations to a finite field

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/residual-descent-to-a-finite-field`.

Let Γ be profinite, p a prime, F̄_p := AlgebraicClosure (ZMod p) with the discrete topology, n ≥ 1 and ρ : Γ → GL_n(F̄_p) a continuous homomorphism. Then ρ(Γ) is finite, and the subfield k ⊂ F̄_p generated over F_p by the matrix entries of the elements of ρ(Γ) is finite, with ρ(Γ) ⊂ GL_n(k). Equivalently, every ContinuousRep V of Γ over F̄_p of dimension n is isomorphic to V_k ⊗_k F̄_p for a ContinuousRep V_k over a finite subfield k; any finite subfield k′ ⊃ k also works, and V_{k′} ≅ V_k ⊗_k k′. For the smallest field over which V can be realised after conjugation (the field generated by the characteristic polynomial coefficients, Serre's trace-field statement), see ArithmeticGaloisRepresentations:R01.5/finite-field-realisability, which is not part of this node.

**Hypotheses.** F̄_p carries the discrete topology; with any non-discrete topology the statement is not implied. The field k here is generated by matrix entries in the given frame; it depends on the frame, the class of realisability fields does not.

**Derivation.** By R01.1/finite-coefficients-and-finite-quotients, ker ρ is open, so ρ(Γ) ≅ Γ/ker ρ is finite. The finitely many matrix entries are algebraic over F_p; the subfield they generate is finite-dimensional over F_p (mathlib:IntermediateField.finiteDimensional_adjoin, for the finite set of matrix entries), hence a finite field k, and ρ(Γ) ⊂ GL_n(k) because the entries lie in k. Module form: choose a basis, apply the framed statement (R01.1/framed-representation), and use R01.1/coefficient-extension for k ⊂ k′ ⊂ F̄_p; continuity over k is automatic since k is discrete and the kernel is unchanged.

**Needs.** `finite-coefficients-and-finite-quotients`, `finite-galois-factorisation`, `artin-representations-have-finite-image`, `framed-representation`, `coefficient-extension`, `mathlib:IntermediateField.finiteDimensional_adjoin`.

**Source.** [Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 1.1 Notations, printed p. 180. A continuous ρ : G_Q → GL(V), V of dimension 2 over F̄_p, has finite image isomorphic to a subgroup of GL_2(F_q) (text layer renders ρ as p). [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 53 (2007 version). Continuous representations with discrete finite coefficients have finite image.

### Baire descent to a finite coefficient field

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field`.

Let ℓ be prime, Q̄_ℓ=PadicAlgCl ℓ with its valuation topology, and Γ a compact Hausdorff group. Every continuous ρ:Γ→GL_n(Q̄_ℓ) has its entries in a coefficient field E⊂Q̄_ℓ finite over Q_ℓ. If a finite extension K/Q_ℓ is prescribed, E may be chosen to contain K.

**Hypotheses.** Let ℓ be prime, Q̄_ℓ=PadicAlgCl ℓ with its valuation topology, and Γ a compact Hausdorff group.

**Derivation.** Countability: the coefficient fields E ⊂ Q̄_ℓ form a countable set, and each is closed in Q̄_ℓ (R01.1/countably-many-coefficient-fields). Each GL_n(E) ∩ ρ(Γ) is a closed subgroup of ρ(Γ): E is closed in Q̄_ℓ (R01.1/countably-many-coefficient-fields), so M_n(E) is closed in M_n(Q̄_ℓ), and GL_n(E) = GL_n(Q̄_ℓ) ∩ M_n(E) because the inverse of a matrix with entries in E has entries in E. ρ(Γ) is compact Hausdorff, so a Baire space (mathlib:BaireSpace; the instance BaireSpace.of_t2Space_locallyCompactSpace in Mathlib/Topology/Baire/LocallyCompactRegular.lean makes locally compact R₁ spaces Baire), and ρ(Γ) = ⋃_E (ρ(Γ) ∩ GL_n(E)) is a countable union of closed sets; by mathlib:nonempty_interior_of_iUnion_of_closed one of them has nonempty interior, so it is an open subgroup of ρ(Γ), hence of finite index (compactness). The finitely many coset representatives have entries in a finite extension; the compositum E′ of E with it satisfies ρ(Γ) ⊂ GL_n(E′).

**Needs.** `countably-many-coefficient-fields`, `mathlib:BaireSpace`, `mathlib:nonempty_interior_of_iUnion_of_closed`, `mathlib:Subgroup.quotient_finite_of_isOpen`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), proof of Theorem 4.8, arXiv v2 p. 17. The Baire-category argument: ρ(Γ) is exhausted by the closed subgroups ρ(Γ) ∩ Ĝ(E) as E varies, so one has finite index. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field. Other clauses are separate nodes; the cited source scope is unchanged. [Modularity lifting for non-regular symplectic representations (published title: Minimal modularity lifting for nonregular symplectic representations)](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), §6.2, proof of Proposition 6.8, published p. 839 (Duke typeset version). The Calegari–Geraghty form: r_f : G_Q → GL_4(K̄) can be defined over a finite extension K′/K. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field. Other clauses are separate nodes; the cited source scope is unchanged.

### Descent of the representation category over Q̄_ℓ

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/descent-of-qlbar-representations`.

Let ℓ be prime, Q̄_ℓ=PadicAlgCl ℓ with its valuation topology, and Γ a compact Hausdorff group. Every finite-dimensional ContinuousRep V over Q̄_ℓ is V_E⊗_E Q̄_ℓ for a ContinuousRep over a coefficient field E. Any finite collection of such objects and equivariant linear maps descends to one coefficient field; two descended morphisms equal over Q̄_ℓ are already equal over a common enlargement. Thus base change identifies the filtered 2-colimit of these categories with ContinuousReps over Q̄_ℓ.

**Hypotheses.** Let ℓ be prime, Q̄_ℓ=PadicAlgCl ℓ with its valuation topology, and Γ a compact Hausdorff group.

**Derivation.** Choose bases and apply R01.1/baire-descent-to-a-finite-coefficient-field to each representation. All entries of finitely many linear maps lie in one finite extension; after adjoining them equivariance descends by injectivity of the coefficient embeddings. Joint continuity descends because E has the subspace topology, using R01.1/framed-representation. Identity and composite base changes are the natural equivalences of R01.1/coefficient-extension.

**Needs.** `baire-descent-to-a-finite-coefficient-field`, `coefficient-extension`, `framed-representation`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), proof of Theorem 4.8, arXiv v2 p. 17. The Baire-category argument: ρ(Γ) is exhausted by the closed subgroups ρ(Γ) ∩ Ĝ(E) as E varies, so one has finite index. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field. Other clauses are separate nodes; the cited source scope is unchanged. [Modularity lifting for non-regular symplectic representations (published title: Minimal modularity lifting for nonregular symplectic representations)](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), §6.2, proof of Proposition 6.8, published p. 839 (Duke typeset version). The Calegari–Geraghty form: r_f : G_Q → GL_4(K̄) can be defined over a finite extension K′/K. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field. Other clauses are separate nodes; the cited source scope is unchanged.

### The finite extensions of Q_ℓ inside Q̄_ℓ are countably many and closed

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/countably-many-coefficient-fields`.

Let ℓ be a prime and Q̄_ℓ = PadicAlgCl ℓ with its norm. The set of intermediate fields Q_ℓ ⊂ E ⊂ Q̄_ℓ with [E : Q_ℓ] finite (the coefficient fields) is countable; more precisely every such E equals Q_ℓ(β) for some β ∈ Q̄_ℓ algebraic over Q. Each such E is a closed subset of Q̄_ℓ, and Q̄_ℓ is the union of these countably many closed subfields.

**Hypotheses.** Q̄_ℓ carries Mathlib's norm (the spectral norm extending the ℓ-adic norm); it is not complete and not locally compact. Countability is of the set of subfields, not of generators or of polynomials over Q_ℓ.

**Derivation.** Krasner's lemma for Q_ℓ ⊂ Q̄_ℓ: PadicAlgCl ℓ is a normed field whose norm extends that of Q_ℓ (mathlib:PadicAlgCl, mathlib:PadicAlgCl.normedField), algebraic over the complete field Q_ℓ, so mathlib:IsKrasner.of_completeSpace gives the Krasner property, and mathlib:IsKrasner.krasner reads: if x is separable over Q_ℓ, y is algebraic and ‖x − y‖ < ‖x − x′‖ for every conjugate x′ ≠ x of x, then x ∈ Q_ℓ(y). Approximation: a coefficient field is E = Q_ℓ(α) (mathlib:Field.exists_primitive_element; E/Q_ℓ is finite, and separable because the characteristic is 0). Let f be the minimal polynomial of α over Q_ℓ, of degree d, and δ the least distance from α to its other conjugates (no condition if d = 1). For a monic g ∈ Q[X] of degree d with coefficients close to those of f (Q is dense in Q_ℓ), ‖g(α)‖ = ‖g(α) − f(α)‖ ≤ max_i ‖g_i − f_i‖ · max(1, ‖α‖)^{d−1} is as small as we wish, and g(α) = ∏_j (α − β_j) over the roots β_j of g in Q̄_ℓ, so some root β has ‖α − β‖ ≤ ‖g(α)‖^{1/d} < δ. Conclusion: Krasner's lemma gives Q_ℓ(α) ⊂ Q_ℓ(β), with equality because [Q_ℓ(β) : Q_ℓ] ≤ d. The elements of Q̄_ℓ algebraic over Q form a countable set (countably many polynomials, finitely many roots each), so choosing such a β for each E injects the set of coefficient fields into a countable set. Closedness: E is a finite-dimensional Q_ℓ-subspace of the normed space Q̄_ℓ over the complete field Q_ℓ, hence closed (mathlib:Submodule.closed_of_finiteDimensional). Every element of Q̄_ℓ is algebraic over Q_ℓ and so lies in a coefficient field.

**Needs.** `mathlib:PadicAlgCl`, `mathlib:PadicAlgCl.normedField`, `mathlib:IsKrasner.krasner`, `mathlib:IsKrasner.of_completeSpace`, `mathlib:Submodule.closed_of_finiteDimensional`, `mathlib:Field.exists_primitive_element`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), proof of Theorem 4.8, arXiv v2 p. 17. The Baire argument runs over all finite extensions E of Q_l inside Q̄_l (text layer of the arXiv file; the stray b is the hat of Ĝ) and needs them to be countably many and closed.

### Lattices and their stabilisers are compact open

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/lattices-are-compact-open`.

Let E be a nonarchimedean local field with valuation ring O_E, and V a finite-dimensional E-space with its module topology. A lattice is a finitely generated O_E-submodule spanning V. Every lattice Λ is compact open in V, and its stabiliser GL(Λ) is a compact open subgroup of GL(V), identified with GL_n(O_E) after a lattice basis choice.

**Hypotheses.** Let E be a nonarchimedean local field with valuation ring O_E, and V a finite-dimensional E-space with its module topology. A lattice is a finitely generated O_E-submodule spanning V.

**Derivation.** (a) Λ ≅ O_E^n is compact since O_E is (mathlib:IsNonarchimedeanLocalField.isCompact_closedBall with radius 1), and open since it contains ϖ^k O_E^n-neighbourhoods; GL(Λ) = {g ∈ M_n(O_E) : det g ∈ O_E^×} in a basis of Λ is open (preimage of the open O_E^× under the continuous det) and compact (closed in M_n(O_E) × M_n(O_E) via g ↦ (g, g⁻¹)).

**Needs.** `mathlib:IsNonarchimedeanLocalField.isCompact_closedBall`, `mathlib:Module.free_of_finite_type_torsion_free'`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, p. 54 (2007 version). An ℓ-adic representation has compact image and can therefore be conjugated into GL_d(O). This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices. Other clauses are separate nodes; the cited source scope is unchanged. [A modular construction of unramified p-extensions of Q(µ_p)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0034/LOG_0016.pdf), §2, printed p. 154 (read on the page image). Ribet's remark that a continuous representation of a compact group leaves some lattice stable. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices. Other clauses are separate nodes; the cited source scope is unchanged. [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), Theorem 4.8(ii), arXiv v2 p. 16. Integral models exist for continuous representations of profinite groups; for Ĝ = GL_n this is the lattice statement. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices. Other clauses are separate nodes; the cited source scope is unchanged.

### Compact closure is equivalent to a stable lattice

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices`.

Let E be a nonarchimedean local field with valuation ring O_E, and V a finite-dimensional E-space with its module topology. A lattice is a finitely generated O_E-submodule spanning V. A subgroup K≤GL(V) stabilises a lattice iff its closure is compact. If its closure is compact and Λ is any lattice, Σ_{k∈K}kΛ is a finite sum of lattice translates and is a K-stable lattice.

**Hypotheses.** Let E be a nonarchimedean local field with valuation ring O_E, and V a finite-dimensional E-space with its module topology. A lattice is a finitely generated O_E-submodule spanning V.

**Derivation.** Use R01.1/lattices-are-compact-open: K̄∩GL(Λ) is open in the compact group K̄ and has finite index by mathlib:Subgroup.quotient_finite_of_isOpen. Hence the orbit of Λ is finite and its sum is finite, spans V and is K-stable. Conversely K⊂GL(Λ′) for a stable lattice Λ′ and GL(Λ′) is compact and closed in GL(V), so K̄ is compact.

**Needs.** `lattices-are-compact-open`, `mathlib:Subgroup.quotient_finite_of_isOpen`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, p. 54 (2007 version). An ℓ-adic representation has compact image and can therefore be conjugated into GL_d(O). This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices. Other clauses are separate nodes; the cited source scope is unchanged. [A modular construction of unramified p-extensions of Q(µ_p)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0034/LOG_0016.pdf), §2, printed p. 154 (read on the page image). Ribet's remark that a continuous representation of a compact group leaves some lattice stable. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices. Other clauses are separate nodes; the cited source scope is unchanged. [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), Theorem 4.8(ii), arXiv v2 p. 16. Integral models exist for continuous representations of profinite groups; for Ĝ = GL_n this is the lattice statement. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices. Other clauses are separate nodes; the cited source scope is unchanged.

### Continuous representations have stable lattices

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/continuous-representations-have-stable-lattices`.

Let E be a nonarchimedean local field with valuation ring O_E, and V a finite-dimensional E-space with its module topology. A lattice is a finitely generated O_E-submodule spanning V. If Γ is profinite and V carries a ContinuousRep of Γ over E, it has a Γ-stable O_E-lattice. In a lattice basis its action is a continuous homomorphism Γ→GL_n(O_E).

**Hypotheses.** Let E be a nonarchimedean local field with valuation ring O_E, and V a finite-dimensional E-space with its module topology. A lattice is a finitely generated O_E-submodule spanning V.

**Derivation.** (c) ρ(Γ) is compact as a continuous image of the compact Γ (R01.1/continuous-representation, framed form R01.1/framed-representation); apply (b). In a basis of the stable lattice the matrix entries of ρ(g) are continuous functions Γ → E with values in O_E, and O_E carries the subspace topology of E, so g ↦ ρ(g) ∈ M_n(O_E) is continuous; with g ↦ ρ(g⁻¹) this is continuity into GL_n(O_E) (R01.1/framed-representation). The ContinuousRep over O_E on the lattice is developed in R01.1/integral-model, which is built on this node.

**Needs.** `compact-subgroups-stabilise-lattices`, `continuous-representation`, `framed-representation`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, p. 54 (2007 version). An ℓ-adic representation has compact image and can therefore be conjugated into GL_d(O). This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices. Other clauses are separate nodes; the cited source scope is unchanged. [A modular construction of unramified p-extensions of Q(µ_p)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0034/LOG_0016.pdf), §2, printed p. 154 (read on the page image). Ribet's remark that a continuous representation of a compact group leaves some lattice stable. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices. Other clauses are separate nodes; the cited source scope is unchanged. [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), Theorem 4.8(ii), arXiv v2 p. 16. Integral models exist for continuous representations of profinite groups; for Ĝ = GL_n this is the lattice statement. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices. Other clauses are separate nodes; the cited source scope is unchanged.

### Semisimple representations over a perfect field stay semisimple after extension of scalars

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/semisimple-representations-over-perfect-fields`.

Let k be a perfect field, k′/k any field extension, Γ a monoid and V a finite-dimensional semisimple representation of Γ over k. Then the algebraic base change V ⊗_k k′ is a semisimple representation over k′. Equivalently, for a finite-dimensional semisimple k-algebra B over a perfect field k, B ⊗_k k′ is semisimple. For imperfect k the statement fails.

**Hypotheses.** k perfect (characteristic 0, finite, or algebraically closed); k′ arbitrary. V finite-dimensional; base change without topology.

**Derivation.** Reduction to algebras: let B be the image of k[Γ] in End_k(V). V is a faithful semisimple B-module of finite dimension, so the Jacobson radical of B annihilates V and is zero: B is a semisimple k-algebra of finite dimension, a finite product of simple algebras B_i (Wedderburn–Artin, mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing). V ⊗ k′ is a module over B ⊗_k k′, so it suffices that each B_i ⊗_k k′ is semisimple (mathlib:IsSemisimpleModule, mathlib:Representation.IsSemisimpleRepresentation). Centres: the centre Z of the simple algebra B_i is a field, finite over the perfect field k (mathlib:PerfectField), hence separable; so Z = k(α) = k[X]/(f) with f the minimal polynomial of a primitive element α, a separable polynomial (mathlib:Field.exists_primitive_element), and Z ⊗_k k′ = k′[X]/(f) is a finite product of fields L_1 × ⋯ × L_t. Central simple algebras: B_i is central simple over Z and B_i ⊗_k k′ = B_i ⊗_Z (Z ⊗_k k′) = ∏_j B_i ⊗_Z L_j. Each B_i ⊗_Z L_j is simple: a nonzero two-sided ideal contains an element Σ b_t ⊗ l_t with the l_t linearly independent over Z and the fewest terms; multiplying by elements of B_i ⊗ 1 on both sides one may take b_1 = 1 (B_i simple), and then commutators with B_i ⊗ 1 have fewer terms, so vanish, forcing all b_t ∈ Z; the element is then 1 ⊗ l with l ≠ 0, a unit. A simple algebra of finite dimension over a field is semisimple. Counterexample for imperfect k: k = F_p(t), V = k[X]/(X^p − t) with Γ = Z acting through X is simple, and V ⊗ k(t^{1/p}) = k′[X]/(X − t^{1/p})^p is not semisimple.

**Needs.** `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`, `mathlib:PerfectField`, `mathlib:IsSemisimpleModule`, `mathlib:Representation.IsSemisimpleRepresentation`, `tauceti:Representation.baseChange`, `mathlib:Field.exists_primitive_element`.

**Source.** [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 Notation, arXiv v2 p. 7. The semisimple residual representation over F̄_p of a representation defined over a finite field: extension of scalars from a finite (perfect) field keeps a semisimple representation semisimple.

### Separating simple representations by the monoid algebra

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/separating-elements-for-simple-modules`.

Let k be algebraically closed, Γ a monoid, and all representations finite-dimensional over k. For pairwise non-isomorphic simple Γ-representations T₁,…,Tᵣ, the action homomorphism k[Γ]→∏ⱼEnd_k(Tⱼ) is surjective.

**Hypotheses.** Let k be algebraically closed, Γ a monoid, and all representations finite-dimensional over k.

**Derivation.** Separating elements: let T_1, …, T_r be the pairwise non-isomorphic simple representations occurring in ρ_1 ⊕ ρ_2 and M := T_1 ⊕ ⋯ ⊕ T_r, a semisimple k[Γ]-module of finite dimension (mathlib:IsSemisimpleModule, mathlib:Representation.IsSemisimpleRepresentation). By Schur's lemma over the algebraically closed k (mathlib:Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed) and the absence of nonzero maps between non-isomorphic simple modules, End_{k[Γ]}(M) = k^r, acting by a scalar on each T_j. The density theorem for a semisimple module finite over its endomorphism ring (mathlib:Module.Finite.toModuleEnd_moduleEnd_surjective) shows that every element of ∏_j End_k(T_j) is the action of an element of k[Γ]; for r = 1 this is Burnside's theorem tauceti:Representation.asAlgebraHom_surjective_of_isIrreducible. Choose x_j ∈ k[Γ] acting on T_j as a projector of rank one and as 0 on T_i for i ≠ j.

**Needs.** `mathlib:Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed`, `mathlib:Module.Finite.toModuleEnd_moduleEnd_surjective`, `tauceti:Representation.asAlgebraHom_surjective_of_isIrreducible`, `mathlib:IsSemisimpleModule`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), proof of Proposition 2.6, p. 54 (2007 version). DDT quote the theorem from Curtis–Reiner (30.16); this node proves the case of an algebraically closed field by the classical argument. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-algebraically-closed. Other clauses are separate nodes; the cited source scope is unchanged. [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2), end of the proof of Theorem 2.12, arXiv v2 p. 31. The statement over an algebraically closed field in the form Chenevier quotes it: a semisimple representation is determined by its characteristic polynomials. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-algebraically-closed. Other clauses are separate nodes; the cited source scope is unchanged.

### Trace congruences detect multiplicities

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/trace-congruence-for-semisimple-representations`.

Let k be algebraically closed, Γ a monoid, and all representations finite-dimensional over k. For semisimple ρ₁,ρ₂ with equal trace functions, each simple T occurs with multiplicities a_T,b_T satisfying (a_T:k)=(b_T:k). In characteristic zero these are equal as natural numbers; in characteristic p>0 they are congruent modulo p.

**Hypotheses.** Let k be algebraically closed, Γ a monoid, and all representations finite-dimensional over k.

**Derivation.** Traces: the trace of the action of x = Σ c_g g on ρ_i is Σ c_g tr ρ_i(g), so under the hypothesis of (i) the two representations have the same trace on every x ∈ k[Γ]. Since ρ_i ≅ ⊕_j T_j^{[ρ_i : T_j]} (the multiplicities are those of tauceti:TauCeti.jordanHolderMultiplicity, and a semisimple module of finite length is determined up to isomorphism by them), tr ρ_i(x_j) = [ρ_i : T_j] · 1 in k. Hence [ρ_1 : T_j] ≡ [ρ_2 : T_j] mod p, which is (i); for p = 0 the multiplicities are equal and ρ_1 ≅ ρ_2.

**Needs.** `separating-elements-for-simple-modules`, `semisimplification`, `tauceti:TauCeti.jordanHolderMultiplicity`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), proof of Proposition 2.6, p. 54 (2007 version). DDT quote the theorem from Curtis–Reiner (30.16); this node proves the case of an algebraically closed field by the classical argument. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-algebraically-closed. Other clauses are separate nodes; the cited source scope is unchanged. [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2), end of the proof of Theorem 2.12, arXiv v2 p. 31. The statement over an algebraically closed field in the form Chenevier quotes it: a semisimple representation is determined by its characteristic polynomials. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-algebraically-closed. Other clauses are separate nodes; the cited source scope is unchanged.

### Semisimplifications are detected after extension of scalars

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/semisimplification-detected-after-field-extension`.

Let k be a field, k′ ⊇ k any field extension (for instance an algebraic closure), Γ a monoid, and V, W finite-dimensional representations of Γ over k. If (V ⊗_k k′)^ss ≅ (W ⊗_k k′)^ss as representations over k′, then V^ss ≅ W^ss over k. Equivalently: if every simple k′[Γ]-module has the same Jordan–Hölder multiplicity in V ⊗ k′ and in W ⊗ k′, then every simple k[Γ]-module has the same multiplicity in V and in W. There is no hypothesis on k (perfect or not) and none on k′/k.

**Hypotheses.** k any field; k′/k any field extension; Γ any monoid. V, W finite-dimensional; base change is the algebraic one (Tau Ceti's Representation.baseChange), with no topology. For S simple over an imperfect k the module S ⊗ k′ need not be semisimple; the proof does not use that it is.

**Derivation.** Write V^ss ≅ ⊕_i S_i^{m_i} and W^ss ≅ ⊕_i S_i^{n_i} with S_1, …, S_r pairwise non-isomorphic simple k[Γ]-modules and m_i, n_i ≥ 0 the Jordan–Hölder multiplicities (R01.1/semisimplification, tauceti:TauCeti.jordanHolderMultiplicity). Separating elements: M := ⊕_i S_i is a semisimple k[Γ]-module, finite-dimensional over k and hence finite over End_{k[Γ]}(M). Every element of End_{k[Γ]}(M) preserves each S_i (there is no nonzero map between non-isomorphic simple modules), so the projector p_i of M onto S_i is End_{k[Γ]}(M)-linear, and by the density theorem (mathlib:Module.Finite.toModuleEnd_moduleEnd_surjective) there is x_i ∈ k[Γ] acting as 1 on S_i and as 0 on S_j for j ≠ i. Disjointness after extension: x_i ⊗ 1 acts as 1 on S_i ⊗ k′ and as 0 on S_j ⊗ k′ (tauceti:Representation.baseChange), hence in the same way on all their subquotients, so no simple k′[Γ]-module is a composition factor of both S_i ⊗ k′ and S_j ⊗ k′ for i ≠ j. Counting: extension of scalars is exact, so a composition series of V gives a filtration of V ⊗ k′ with quotients S_i ⊗ k′ (m_i times each), and by additivity of multiplicities (tauceti:TauCeti.jordanHolderMultiplicity_eq_add_of_exact) [V ⊗ k′ : T] = Σ_i m_i [S_i ⊗ k′ : T] for every simple k′[Γ]-module T; likewise for W with the n_i. Fix i and a composition factor T of S_i ⊗ k′ (one exists because S_i ≠ 0), with c := [S_i ⊗ k′ : T] ≥ 1. By the previous step [S_j ⊗ k′ : T] = 0 for j ≠ i, so [V ⊗ k′ : T] = c·m_i and [W ⊗ k′ : T] = c·n_i. The hypothesis gives c·m_i = c·n_i, so m_i = n_i for all i, and V^ss ≅ W^ss.

**Needs.** `semisimplification`, `coefficient-extension`, `mathlib:Module.Finite.toModuleEnd_moduleEnd_surjective`, `tauceti:TauCeti.jordanHolderMultiplicity`, `tauceti:TauCeti.jordanHolderMultiplicity_eq_add_of_exact`, `tauceti:Representation.baseChange`.

**Source.** [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 Notation, arXiv v2 p. 7. The residual representation is semisimplified after extending scalars to F̄_p; comparing it with semisimplifications over a finite field is this lemma. [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), proof of Lemme 6.13, printed p. 523. Deligne–Serre compare semisimple representations over a finite field k′ through their characteristic polynomials; passing between a field and an extension is the content of the lemma.

### The Brauer–Nesbitt theorem

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt`.

Let k be any field, Γ any group or monoid (no topology needed), and V, W finite-dimensional representations of Γ over k. (a) If charpoly ρ_V(g) = charpoly ρ_W(g) in k[X] for every g ∈ Γ, then V^ss ≅ W^ss (semisimplifications of the underlying Mathlib representations, R01.1/semisimplification in its algebraic form); in particular semisimple V and W with the same characteristic polynomials are isomorphic. (c) If V and W are ContinuousReps, the isomorphism in (a) is an isomorphism of ContinuousReps. The statement with traces in place of characteristic polynomials, valid when (dim V)! is invertible in k, is R01.1/brauer-nesbitt-traces. For the algebraically closed comparison, import the already owned IHG.1 reconstruction theorem and use IHG.0 Amitsur to pass from characteristic polynomials on the monoid to equality of determinant laws. The assembly supplier override replaces the historical local reconstruction route. Chenevier’s printed uniqueness proof cites classical Brauer–Nesbitt; that source dependency does not require a second reconstruction plan here. For an arbitrary imperfect ground field, descend multiplicities by the retained separating-idempotent argument; the perfect-field refinement can instead reflect an actual scalar-extended isomorphism by Noether–Deuring.

**Hypotheses.** k arbitrary (finite residue fields are the main case), perfect or not; Γ an arbitrary group or monoid. Characteristic polynomials of all the elements g ∈ Γ, not merely of the elements of a generating set. The statement has the two parts (a) and (c); the statement with traces is R01.1/brauer-nesbitt-traces.

**Derivation.** Extension to an algebraic closure k̄ of k: for every g ∈ Γ the semisimplifications (V ⊗ k̄)^ss and (W ⊗ k̄)^ss of the algebraic base changes (R01.1/coefficient-extension, R01.1/semisimplification) have the characteristic polynomial of ρ_V(g), respectively ρ_W(g), viewed in k̄[X] (mathlib:LinearMap.charpoly commutes with base change by mathlib:LinearMap.charpoly_baseChange, and is unchanged by semisimplification). Over k̄: the IHG.0 Amitsur identity and IHG.1/algebraically-closed-reconstruction, imported by the assembly override for R01.1/brauer-nesbitt-algebraically-closed, give (V ⊗ k̄)^ss ≅ (W ⊗ k̄)^ss. Descent: R01.1/semisimplification-detected-after-field-extension with k′ = k̄ gives V^ss ≅ W^ss. If V and W are semisimple, V ≅ V^ss ≅ W^ss ≅ W. (c): a k-linear Γ-equivariant isomorphism between ContinuousReps is continuous with continuous inverse (R01.1/continuous-representation), and V^ss, W^ss are ContinuousReps (R01.1/semisimplification).

**Needs.** `separating-elements-for-simple-modules`, `trace-congruence-for-semisimple-representations`, `brauer-nesbitt-algebraically-closed`, `semisimplification-detected-after-field-extension`, `semisimplification`, `coefficient-extension`, `continuous-representation`, `mathlib:LinearMap.charpoly`, `mathlib:LinearMap.charpoly_baseChange`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), proof of Proposition 2.6, p. 54 (2007 version). For semisimple mod ℓ representations the characteristic polynomials determine the representation; DDT quote the theorem from Curtis–Reiner (30.16). [A modular construction of unramified p-extensions of Q(µ_p)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0034/LOG_0016.pdf), §2, printed p. 154 (read on the page image). Ribet quotes the same theorem, Curtis–Reiner (30.16), for the semisimplified reduction. [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), proof of Lemme 6.13, printed p. 523. Semisimple representations over a finite field with the same characteristic polynomials are isomorphic (quoted there from Curtis–Reiner, th. 30.16). [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2), end of the proof of Theorem 2.12, arXiv v2 p. 31. The printed uniqueness proof cites classical Brauer–Nesbitt. This refinement consumes the already owned IHG.1 theorem through the recorded supplier override.

### Brauer–Nesbitt from traces when d! is invertible

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`.

Let k be a field and V,W finite-dimensional semisimple representations of Γ of the same dimension d. If Γ is a monoid, d! is invertible in k, and tr V(g)=tr W(g) for all g, then V≅W. Equivalently for arbitrary V,W under those hypotheses their semisimplifications agree. The conclusion holds for ContinuousReps with a continuous isomorphism.

**Hypotheses.** Let k be a field and V,W finite-dimensional semisimple representations of Γ of the same dimension d.

**Derivation.** Pass to the algebraic closure and semisimplify using R01.1/coefficient-extension and R01.1/semisimplification. R01.1/trace-congruence-for-semisimple-representations gives equality of multiplicities in characteristic zero, or congruences modulo p in characteristic p>d. Multiplicities lie between 0 and d, so the congruences are equalities. Descend by R01.1/semisimplification-detected-after-field-extension; equivariant linear maps are continuous by R01.1/continuous-representation.

**Needs.** `trace-congruence-for-semisimple-representations`, `semisimplification-detected-after-field-extension`, `semisimplification`, `coefficient-extension`, `continuous-representation`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Proposition 2.6(b), p. 53 (2007 version). For semisimple mod ℓ representations of dimension d < ℓ the traces suffice (ℓ is rendered as ` in the text layer); the node proves this over any field with d! invertible and records that the hypothesis cannot be dropped in general. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces. Other clauses are separate nodes; the cited source scope is unchanged.

### Trace recognition in dimension two over F₂

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/traces-over-f2-in-dimension-two`.

Let k be a field and V,W finite-dimensional semisimple representations of Γ of the same dimension d. If Γ is a group, k=F₂ and d=2, equality of trace functions still implies V≅W.

**Hypotheses.** Let k be a field and V,W finite-dimensional semisimple representations of Γ of the same dimension d.

**Derivation.** The case k = F_2, d = 2, Γ a group: the only character Γ → F_2^× is trivial, so a semisimple representation of dimension 2 over F_2 is 1 ⊕ 1 (trace identically 0) or irreducible, with image in GL_2(F_2) ≅ S_3 the subgroup of order 3 or all of S_3; elements of order 3 have trace 1 and all other elements trace 0. If the image has order 3, the kernel is {g : tr = 0} and the representation is the unique irreducible 2-dimensional representation of the quotient of order 3. If the image is S_3, the set {g : tr = 0} is not a subgroup and the representation is absolutely irreducible, hence determined by its trace: the traces determine the kernel of k[Γ] → End_k(V) through the nondegenerate trace form of the matrix algebra (R01.1/absolutely-irreducible (iii)). So the trace function determines the representation in every case.

**Needs.** `absolutely-irreducible`, `semisimplification`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Proposition 2.6(b), p. 53 (2007 version). For semisimple mod ℓ representations of dimension d < ℓ the traces suffice (ℓ is rendered as ` in the text layer); the node proves this over any field with d! invertible and records that the hypothesis cannot be dropped in general. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces. Other clauses are separate nodes; the cited source scope is unchanged.

### Residue field of Q̄_ℓ is an algebraic closure

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/residue-field-of-the-algebraic-closure-of-q-ell`.

Let ℓ be prime, Q̄_ℓ=PadicAlgCl ℓ, O={x:‖x‖≤1}, 𝔪={x:‖x‖<1}, and κ=O/𝔪. The field κ has characteristic ℓ, is algebraic over F_ℓ and is algebraically closed. Consequently κ≅AlgebraicClosure(F_ℓ), noncanonically.

**Hypotheses.** Let ℓ be prime, Q̄_ℓ=PadicAlgCl ℓ, O={x:‖x‖≤1}, 𝔪={x:‖x‖<1}, and κ=O/𝔪.

**Derivation.** O is a valuation ring of the field Q̄_ℓ with maximal ideal 𝔪, because the norm is multiplicative and nonarchimedean (mathlib:PadicAlgCl.normedField, mathlib:PadicAlgCl.isNonarchimedean); so κ is a field, and ‖ℓ‖ = 1/ℓ < 1 (mathlib:PadicAlgCl.valuation_p) gives characteristic ℓ. κ is algebraic over F_ℓ: an element α of O is algebraic over Q_ℓ, and its norm is the spectral value of its minimal polynomial f over Q_ℓ (mathlib:PadicAlgCl.spectralNorm_eq), the maximum of ‖c_i‖^{1/(d−i)} over the coefficients c_i of f; so ‖α‖ ≤ 1 forces f ∈ Z_ℓ[X]. Reducing f(α) = 0 modulo 𝔪 shows that the class of α is a root of the monic polynomial f mod ℓ ∈ F_ℓ[X]. κ is algebraically closed: a monic polynomial over κ lifts to a monic f ∈ O[X]; Q̄_ℓ is algebraically closed (mathlib:PadicAlgCl is an algebraic closure), so f has a root α, which is integral over the valuation ring O and therefore lies in O (valuation rings are integrally closed); its class is a root of the given polynomial.

**Needs.** `mathlib:PadicAlgCl`, `mathlib:PadicAlgCl.normedField`, `mathlib:PadicAlgCl.isNonarchimedean`, `mathlib:PadicAlgCl.valuation_p`, `mathlib:PadicAlgCl.spectralNorm_eq`.

**Source.** [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 Notation, arXiv v2 p. 7. The residual representation has coefficients in F̄_p, the residue field of the valuation ring of Q̄_p; the lemma shows that this residue field is an algebraic closure of F_p (overlines are lost in the text layer). This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/residue-field-of-the-algebraic-closure-of-q-ell. Other clauses are separate nodes; the cited source scope is unchanged.

### Reduction of prime-to-ℓ roots of unity

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/reduction-of-roots-of-unity`.

Let ℓ be prime, Q̄_ℓ=PadicAlgCl ℓ, O={x:‖x‖≤1}, 𝔪={x:‖x‖<1}, and κ=O/𝔪. For m≥1 prime to ℓ, reduction induces a group isomorphism μ_m(Q̄_ℓ)≃μ_m(κ).

**Hypotheses.** Let ℓ be prime, Q̄_ℓ=PadicAlgCl ℓ, O={x:‖x‖≤1}, 𝔪={x:‖x‖<1}, and κ=O/𝔪.

**Derivation.** (b): the roots of X^m − 1 in Q̄_ℓ have norm 1 and lie in O. Reduction is injective on them: if ζ ≠ 1, ζ^m = 1 and ζ ≡ 1 mod 𝔪, then 0 = 1 + ζ + ⋯ + ζ^{m−1} ≡ m mod 𝔪, but m is a unit of O. Both groups have exactly m elements (Q̄_ℓ and κ are algebraically closed and m is invertible in both), so reduction is bijective.

**Needs.** `residue-field-of-the-algebraic-closure-of-q-ell`.

**Source.** [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 Notation, arXiv v2 p. 7. The residual representation has coefficients in F̄_p, the residue field of the valuation ring of Q̄_p; the lemma shows that this residue field is an algebraic closure of F_p (overlines are lost in the text layer). This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/residue-field-of-the-algebraic-closure-of-q-ell. Other clauses are separate nodes; the cited source scope is unchanged.

### Finite residue fields inside the residue of Q̄_ℓ

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/residue-fields-of-coefficient-fields`.

Let ℓ be prime, Q̄_ℓ=PadicAlgCl ℓ, O={x:‖x‖≤1}, 𝔪={x:‖x‖<1}, and κ=O/𝔪. For each coefficient field E⊂Q̄_ℓ reduction embeds k_E into κ; these images cover κ. If q is an ℓ-power, the unique subfield of κ with q elements is contained in k_E for E=Q_ℓ(μ_{q−1}).

**Hypotheses.** Let ℓ be prime, Q̄_ℓ=PadicAlgCl ℓ, O={x:‖x‖≤1}, 𝔪={x:‖x‖<1}, and κ=O/𝔪.

**Derivation.** (c): E ∩ 𝔪 is the maximal ideal of the valuation ring E ∩ O of E, so k_E → κ is an injective homomorphism of fields; every element of O lies in a coefficient field, so κ is the union of the images. A subfield of κ with q elements consists of 0 and the (q−1)-th roots of unity of κ, which by (b) are the reductions of the (q−1)-th roots of unity of Q̄_ℓ, elements of Q_ℓ(μ_{q−1}) ∩ O.

**Needs.** `reduction-of-roots-of-unity`, `residue-field-of-the-algebraic-closure-of-q-ell`.

**Source.** [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 Notation, arXiv v2 p. 7. The residual representation has coefficients in F̄_p, the residue field of the valuation ring of Q̄_p; the lemma shows that this residue field is an algebraic closure of F_p (overlines are lost in the text layer). This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/residue-field-of-the-algebraic-closure-of-q-ell. Other clauses are separate nodes; the cited source scope is unchanged.

### Semisimplified reduction is independent of lattice

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence`.

Let Γ be profinite, E a coefficient field with ring O_E, uniformiser ϖ and residue k_E, and V a finite-dimensional ContinuousRep. For two integral models Λ,Λ′ of V, (Λ/ϖΛ)^ss≅(Λ′/ϖΛ′)^ss over k_E.

**Hypotheses.** Let Γ be profinite, E a coefficient field with ring O_E, uniformiser ϖ and residue k_E, and V a finite-dimensional ContinuousRep.

**Derivation.** Second proof of (b), independent of R01.1/brauer-nesbitt: after a homothety assume Λ′ ⊂ Λ, and take a ≥ 0 with ϖ^aΛ ⊂ Λ′. The lattices Λ_i := Λ′ + ϖ^iΛ (0 ≤ i ≤ a) are Γ-stable, Λ_0 = Λ, Λ_a = Λ′ and ϖΛ_i ⊂ Λ_{i+1} ⊂ Λ_i. For Γ-stable lattices with ϖΛ ⊂ Λ′ ⊂ Λ one has [Λ/ϖΛ] = [Λ/Λ′] + [Λ′/ϖΛ] and [Λ′/ϖΛ′] = [Λ′/ϖΛ] + [ϖΛ/ϖΛ′] in the Grothendieck group of finite-length k_E[Γ]-modules, and ϖΛ/ϖΛ′ ≅ Λ/Λ′ by multiplication by ϖ. So Λ/ϖΛ and Λ′/ϖΛ′ have the same composition factors with multiplicities (additivity of Jordan–Hölder multiplicities in short exact sequences of k_E[Γ]-modules of finite length, tauceti:TauCeti.jordanHolderMultiplicity_eq_add_of_exact), that is, isomorphic semisimplifications. This uses only R01.1/integral-model and R01.1/semisimplification.

**Needs.** `integral-model`, `semisimplification`, `tauceti:TauCeti.jordanHolderMultiplicity_eq_add_of_exact`.

**Source.** [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 6.12, printed p. 523 (read on the page image). Source context for Semisimplified reduction is independent of lattice. Deligne–Serre conjugate ρ_λ into GL_2 of the completed ring of integers, reduce mod λ and semisimplify; the existence of the lattice and the lattice independence are used there without argument. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration. [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, p. 54 (2007 version). Source context for Semisimplified reduction is independent of lattice. The reduction depends on the conjugate (lattice); its semisimplification is determined by ρ. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration. [A modular construction of unramified p-extensions of Q(µ_p)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0034/LOG_0016.pdf), §2, printed p. 154 (read on the page image). Source context for Semisimplified reduction is independent of lattice. Lattice independence of the semisimplified reduction, via Curtis–Reiner (30.16), i.e. Brauer–Nesbitt. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Residual reduction is independent of coefficient descent

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/residual-representation-well-defined`.

Let Γ be profinite, E a coefficient field with ring O_E, uniformiser ϖ and residue k_E, and V a finite-dimensional ContinuousRep. For V over Q̄_ℓ, choose any coefficient descent V_E and integral model Λ. The isomorphism class of ((Λ/ϖΛ)⊗_{k_E}κ)^ss is independent of E, of the descent and of Λ.

**Hypotheses.** Let Γ be profinite, E a coefficient field with ring O_E, uniformiser ϖ and residue k_E, and V a finite-dimensional ContinuousRep.

**Derivation.** Use R01.1/baire-descent-to-a-finite-coefficient-field to descend V. Two descents and their Q̄_ℓ-linear comparison descend to a common coefficient field by R01.1/descent-of-qlbar-representations. Base change an integral model to its integer ring; its reduction is the corresponding residue-field base change by R01.1/reduction-and-residual-semisimplification. The common-field lattices have isomorphic semisimplified reductions by R01.1/continuity-descent-and-lattice-independence, and R01.1/semisimple-representations-over-perfect-fields permits scalar extension of a semisimple representation over the finite residue field.

**Needs.** `baire-descent-to-a-finite-coefficient-field`, `descent-of-qlbar-representations`, `reduction-and-residual-semisimplification`, `continuity-descent-and-lattice-independence`, `semisimple-representations-over-perfect-fields`.

**Source.** [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 6.12, printed p. 523 (read on the page image). Source context for Residual reduction is independent of coefficient descent. Deligne–Serre conjugate ρ_λ into GL_2 of the completed ring of integers, reduce mod λ and semisimplify; the existence of the lattice and the lattice independence are used there without argument. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration. [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 Notation, arXiv v2 p. 7. Source context for Residual reduction is independent of coefficient descent. The semisimple residual representation of a continuous ρ : G → GL_n(Q̄_p), G profinite, is well defined up to conjugacy. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Finite-image and polynomial properties of residual reduction

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/residual-representation-properties`.

Let Γ be profinite, E a coefficient field with ring O_E, uniformiser ϖ and residue k_E, and V a finite-dimensional ContinuousRep. The residual representation over κ is continuous, semisimple, has finite image and is defined over a finite field. For every g its characteristic polynomial is the reduction of that of V; its isomorphism class depends only on these polynomials.

**Hypotheses.** Let Γ be profinite, E a coefficient field with ring O_E, uniformiser ϖ and residue k_E, and V a finite-dimensional ContinuousRep.

**Derivation.** Choose one descent and model, whose finite residue field and jointly continuous reduction give finite image by R01.1/finite-coefficients-and-finite-quotients. R01.1/residual-descent-to-a-finite-field gives the same assertion over κ; semisimplification preserves characteristic polynomials by R01.1/semisimplification. Compare polynomials by R01.1/reduction-and-residual-semisimplification and conclude uniqueness by R01.1/brauer-nesbitt. Choice-independence is R01.1/residual-representation-well-defined.

**Needs.** `residual-representation-well-defined`, `finite-coefficients-and-finite-quotients`, `residual-descent-to-a-finite-field`, `semisimplification`, `reduction-and-residual-semisimplification`, `brauer-nesbitt`.

**Source.** [Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 1.1 Notations, printed p. 180. Source context for Finite-image and polynomial properties of residual reduction. Residual representations over F̄_p have finite image and are defined over a finite field (text-layer rendering of ρ as p). The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration. [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 Notation, arXiv v2 p. 7. Source context for Finite-image and polynomial properties of residual reduction. The semisimple residual representation of a continuous ρ : G → GL_n(Q̄_p), G profinite, is well defined up to conjugacy. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Stable lattices are unique up to homothety

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/stable-lattice-unique-up-to-homothety`.

Let Γ be profinite, E a coefficient field with uniformiser ϖ, and V a ContinuousRep whose residual representation over k_E is irreducible. All integral models of V are ϖ^jΛ₀ for one integral model Λ₀ and integers j.

**Hypotheses.** Let Γ be profinite, E a coefficient field with uniformiser ϖ, and V a ContinuousRep whose residual representation over k_E is irreducible.

**Derivation.** (a) Given integral models Λ, Λ′, rescale Λ′ so that Λ′ ⊂ Λ and Λ′ ⊄ ϖΛ. The image of Λ′ in Λ/ϖΛ is a nonzero Γ-stable subspace, hence everything by residual irreducibility; so Λ′ + ϖΛ = Λ and Λ′ = Λ by Nakayama (R01.1/integral-model).

**Needs.** `integral-model`, `continuous-representations-have-stable-lattices`, `continuity-descent-and-lattice-independence`.

**Source.** [Modularity lifting for non-regular symplectic representations (published title: Minimal modularity lifting for nonregular symplectic representations)](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), §6.3, proof of Theorem 6.13, published p. 843 (Duke typeset version). There r_{f_i} is asserted to take values in GSp_4(O_{K′_i}) with Proposition 6.8 given as the justification, which gives only a GSp_4(K′)-valued representation; this node supplies the integral symplectic model. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/self-dual-lattice-for-absolutely-irreducible-residual. Other clauses are separate nodes; the cited source scope is unchanged. [Modularity lifting for non-regular symplectic representations (published title: Minimal modularity lifting for nonregular symplectic representations)](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), §6.2, proof of Proposition 6.8, published p. 839 (Duke typeset version). The field-valued, symplectic form of the representation to which the integral model is applied. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/self-dual-lattice-for-absolutely-irreducible-residual. Other clauses are separate nodes; the cited source scope is unchanged.

### A self-dual integral model after rescaling the pairing

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/self-dual-lattice-for-absolutely-irreducible-residual`.

Let Γ be profinite, E a coefficient field with uniformiser ϖ, and V a ContinuousRep whose residual representation over k_E is irreducible. For a perfect symmetric or alternating E-pairing with ⟨ρ(g)x,ρ(g)y⟩=μ(g)⟨x,y⟩, where μ:Γ→Eˣ is continuous, μ is O_Eˣ-valued and some stable lattice is self-dual for c⟨,⟩ with c∈{1,ϖ}.

**Hypotheses.** Let Γ be profinite, E a coefficient field with uniformiser ϖ, and V a ContinuousRep whose residual representation over k_E is irreducible.

**Derivation.** (b) µ(Γ) is compact in E^×, hence contained in O_E^× (its valuation is a compact subgroup of Z). For an integral model Λ, the orthogonal Λ^⊥ := {x ∈ V : ⟨x, Λ⟩ ⊂ O_E} is an integral model (the dual lattice transported along the perfect pairing; Γ-stable because µ is unit-valued), so Λ^⊥ = ϖ^mΛ by (a). Replacing Λ by ϖ^jΛ changes m by −2j; if m is odd replace ⟨ , ⟩ by ϖ⟨ , ⟩. Then Λ^⊥ = Λ, i.e. the pairing is perfect on Λ.

**Needs.** `stable-lattice-unique-up-to-homothety`, `integral-model`, `restriction-dual-tensor-twist`, `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`.

**Source.** [Modularity lifting for non-regular symplectic representations (published title: Minimal modularity lifting for nonregular symplectic representations)](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), §6.3, proof of Theorem 6.13, published p. 843 (Duke typeset version). There r_{f_i} is asserted to take values in GSp_4(O_{K′_i}) with Proposition 6.8 given as the justification, which gives only a GSp_4(K′)-valued representation; this node supplies the integral symplectic model. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/self-dual-lattice-for-absolutely-irreducible-residual. Other clauses are separate nodes; the cited source scope is unchanged. [Modularity lifting for non-regular symplectic representations (published title: Minimal modularity lifting for nonregular symplectic representations)](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), §6.2, proof of Proposition 6.8, published p. 839 (Duke typeset version). The field-valued, symplectic form of the representation to which the integral model is applied. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/self-dual-lattice-for-absolutely-irreducible-residual. Other clauses are separate nodes; the cited source scope is unchanged.

### Integral symplectic coordinates

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/integral-symplectic-model`.

Let Γ be profinite, E/Q_ℓ a finite coefficient extension with uniformiser ϖ, and V a ContinuousRep with a nondegenerate alternating E-bilinear form B and a continuous multiplier μ: Γ → E^× satisfying B(ρ(g)x,ρ(g)y)=μ(g)B(x,y). Assume that the residual representation over k_E is irreducible. Then dim_E V=2g. After scaling B by an element of E^×, the stable self-dual lattice supplied by the preceding node has an O_E-symplectic basis. Relative to an initial B-symplectic frame, ρ is GSp_{2g}(E)-conjugate to a continuous GSp_{2g}(O_E)-valued representation with multiplier μ.

**Hypotheses.** Γ is profinite; E/Q_ℓ is finite; B is a nondegenerate alternating form with similitude multiplier μ; the residual representation is irreducible.

**Derivation.** (c) A perfect alternating form on a free module over the local ring O_E has a symplectic basis: choose x with ⟨x, y⟩ ∈ O_E^× for some y (perfectness), split off the hyperbolic plane O_E x ⊕ O_E y and induct on the orthogonal complement; the matrix of ρ(g) in this basis lies in GSp_{2g}(O_E) with multiplier µ(g). This fills the step used without proof by Calegari–Geraghty on p. 843 (recorded as ArithmeticGaloisRepresentations/E101).

**Needs.** `self-dual-lattice-for-absolutely-irreducible-residual`, `integral-model`, `framed-representation`, `ArithmeticGaloisRepresentations:G7/similitude-groups`.

**Source.** [Modularity lifting for non-regular symplectic representations (published title: Minimal modularity lifting for nonregular symplectic representations)](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), §6.3, proof of Theorem 6.13, published p. 843 (Duke typeset version). There r_{f_i} is asserted to take values in GSp_4(O_{K′_i}) with Proposition 6.8 given as the justification, which gives only a GSp_4(K′)-valued representation; this node supplies the integral symplectic model. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/self-dual-lattice-for-absolutely-irreducible-residual. Other clauses are separate nodes; the cited source scope is unchanged. [Modularity lifting for non-regular symplectic representations (published title: Minimal modularity lifting for nonregular symplectic representations)](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), §6.2, proof of Proposition 6.8, published p. 839 (Duke typeset version). The field-valued, symplectic form of the representation to which the integral model is applied. This node extracts only the clause stated here from the reviewed bundle ArithmeticGaloisRepresentations:R01.1/self-dual-lattice-for-absolutely-irreducible-residual. Other clauses are separate nodes; the cited source scope is unchanged.

### Semisimple restriction to a normal subgroup

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/clifford-restriction-semisimple`.

Let k be a field, Γ profinite, H an open subgroup, N its open normal core, and all representations finite-dimensional ContinuousReps over k. If H is normal and V is semisimple over Γ, then Res_H V is semisimple in every characteristic.

**Hypotheses.** Let k be a field, Γ profinite, H an open subgroup, N its open normal core, and all representations finite-dimensional ContinuousReps over k.

**Derivation.** Decompose V as a finite direct sum of irreducibles using R01.1/semisimplification. Each restricts semisimply by tauceti:TauCeti.Representation.isSemisimpleRepresentation_comp_subtype; sum the restricted decompositions. No invertibility hypothesis on [Γ:H] is used.

**Needs.** `semisimplification`, `tauceti:TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`.

**Source.** [Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://www.numdam.org/item/PMIHES_2008__108__1_0/), §2.4.4, before Lemma 2.4.11, printed p. 41. Source context for Semisimple restriction to a normal subgroup. Clifford theory is the standard technique for restricting Galois representations to normal subgroups (cited to Curtis–Reiner §11). The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Clifford isotypic decomposition over an arbitrary field

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/clifford-isotypic-decomposition`.

Let k be a field, Γ profinite, H an open subgroup, N its open normal core, and all representations finite-dimensional ContinuousReps over k. If H is normal and V is irreducible over Γ, then Res_H V≅(W₁⊕⋯⊕Wₜ)^{⊕e}, where the Wᵢ are the distinct Γ-conjugates of any one simple constituent and all multiplicities are equal; t is the index of its open isomorphism-class stabiliser.

**Hypotheses.** Let k be a field, Γ profinite, H an open subgroup, N its open normal core, and all representations finite-dimensional ContinuousReps over k.

**Derivation.** R01.1/clifford-restriction-semisimple supplies semisimplicity. The sum of Γ-translates of any H-constituent is Γ-stable and nonzero, hence all of V. Conjugation permutes the H-isotypic components transitively. Because its maps are linear isomorphisms, the dimensions of the corresponding multiplicity modules over the isomorphic constituent endomorphism division rings agree, so their natural-number multiplicities agree. The stabiliser contains H and is open.

**Needs.** `clifford-restriction-semisimple`, `semisimplification`.

**Source.** [Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://www.numdam.org/item/PMIHES_2008__108__1_0/), §2.4.4, before Lemma 2.4.11, printed p. 41. Source context for Clifford isotypic decomposition over an arbitrary field. Clifford theory is the standard technique for restricting Galois representations to normal subgroups (cited to Curtis–Reiner §11). The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration. [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1), Lemma 10.2.3, arXiv v1 PDF p. 212. Source context for Clifford isotypic decomposition over an arbitrary field. An irreducible representation restricted to the open normal subgroup G_L is a sum of one Galois orbit of characters with common multiplicity a, the conclusion of (a). The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Averaging detects semisimplicity

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/semisimple-if-restriction-semisimple`.

Let k be a field, Γ profinite, H an open subgroup, N its open normal core, and all representations finite-dimensional ContinuousReps over k. If [Γ:H] is invertible in k and Res_H V is semisimple, then V is semisimple.

**Hypotheses.** Let k be a field, Γ profinite, H an open subgroup, N its open normal core, and all representations finite-dimensional ContinuousReps over k.

**Derivation.** (b): given a Γ-stable W ⊂ V, choose an H-equivariant projection p : V → W (Res_H V semisimple) and put p′ := [Γ : H]⁻¹ Σ_{gH ∈ Γ/H} ρ(g) p ρ(g)⁻¹; each summand depends only on the coset gH because p is H-equivariant, and p′ is a Γ-equivariant projection onto W, so W has a Γ-stable complement (mathlib:Representation.IsSemisimpleRepresentation is the complemented-lattice condition).

**Needs.** `mathlib:Representation.IsSemisimpleRepresentation`, `mathlib:Subgroup.quotient_finite_of_isOpen`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 53 (2007 version). Source context for Averaging detects semisimplicity. Averaging over a finite group in characteristic 0 gives semisimplicity, the mechanism of (b). The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Semisimple restriction to an open subgroup

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/restriction-to-open-subgroup-semisimple`.

Let k be a field, Γ profinite, H an open subgroup, N its open normal core, and all representations finite-dimensional ContinuousReps over k. If [H:N] is invertible in k and V is semisimple, then Res_H V is semisimple.

**Hypotheses.** Let k be a field, Γ profinite, H an open subgroup, N its open normal core, and all representations finite-dimensional ContinuousReps over k.

**Derivation.** Restrict first to N using R01.1/clifford-restriction-semisimple, then apply R01.1/semisimple-if-restriction-semisimple to N≤H, whose index is invertible. The underlying action is the restriction of R01.1/restriction-dual-tensor-twist.

**Needs.** `clifford-restriction-semisimple`, `semisimple-if-restriction-semisimple`, `restriction-dual-tensor-twist`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 53 (2007 version). Source context for Semisimple restriction to an open subgroup. Averaging over a finite group in characteristic 0 gives semisimplicity, the mechanism of (b). The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Induction preserves semisimplicity with invertible core index

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/semisimplicity-under-restriction-and-induction`.

Let k be a field, Γ profinite, H an open subgroup, N its open normal core, and all representations finite-dimensional ContinuousReps over k. If [Γ:N] is invertible in k and U is semisimple over H, then Ind_H^Γ U is semisimple.

**Hypotheses.** Let k be a field, Γ profinite, H an open subgroup, N its open normal core, and all representations finite-dimensional ContinuousReps over k.

**Derivation.** By R01.1/mackey-decomposition its restriction to N is a finite sum of conjugates of U restricted to N. Each is semisimple by R01.1/clifford-restriction-semisimple for N normal in the conjugate of H. Apply R01.1/semisimple-if-restriction-semisimple to N≤Γ. The topology is supplied by R01.1/continuous-induction.

**Needs.** `mackey-decomposition`, `clifford-restriction-semisimple`, `semisimple-if-restriction-semisimple`, `continuous-induction`.

**Source.** [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.1, 'Representations', p. 53 (2007 version). Source context for Induction preserves semisimplicity with invertible core index. Averaging over a finite group in characteristic 0 gives semisimplicity, the mechanism of (b). The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Integral models for reductive-group representations

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/reductive-integral-models`.

Let ℓ be prime, Ĝ a split connected reductive group scheme over Z, and Γ profinite. Every continuous ρ:Γ→Ĝ(Q̄_ℓ) is Ĝ(Q̄_ℓ)-conjugate into Ĝ(O_E) for some coefficient field E. No restriction on ℓ is imposed.

**Hypotheses.** Let ℓ be prime, Ĝ a split connected reductive group scheme over Z, and Γ profinite.

**Derivation.** Baire step: fix a closed embedding Ĝ ↪ GL_N over Z; it gives Ĝ(Q̄_ℓ) its topology and Ĝ(Q̄_ℓ) ∩ GL_N(E) = Ĝ(E). ρ(Γ) is compact, and R01.1/baire-descent-to-a-finite-coefficient-field applied to Γ → GL_N(Q̄_ℓ) (closed subgroups ρ(Γ) ∩ Ĝ(E), countably many E) gives ρ(Γ) ⊂ Ĝ(E) for a coefficient field E. Bruhat–Tits step (ReductiveGroupsPartII:RG2.3 compact-elements-in-hyperspecial-subgroups (2), with its recorded source boundary): ρ(Γ) lies in Ĝ(E)^0 (all characters O_E^×-valued, by compactness), acts on the building B(DĜ, E) of the derived group with bounded orbits, hence fixes a point; maximal compact subgroups of Ĝ(E)^0 are stabilisers of centroids of facets, and the hyperspecial point x_0 has stabiliser Ĝ(O_E). Larsen's lemma (Larsen 1995, Lemma 2.4, recorded as a gap): there are a totally ramified E′/E and a ρ(Γ)-stable point x with i_{E,E′}(x) hyperspecial in B(DĜ, E′). Hyperspecial vertices are conjugate under Ĝ^ad(E′); lifting the conjugating element to Ĝ(Q̄_ℓ) gives (i).

**Needs.** `baire-descent-to-a-finite-coefficient-field`, `ReductiveGroupsPartII:RG2.3`, `mathlib:PadicAlgCl`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), Theorem 4.8, arXiv v2 p. 16. Source context for Integral models for reductive-group representations. Integral models of Ĝ-valued representations of a profinite group and their reduction modulo l. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration. [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), proof of Theorem 4.8, arXiv v2 p. 17. Source context for Integral models for reductive-group representations. The proof: Baire descent to Ĝ(E), then Bruhat–Tits theory and [Lar95, Lemma 2.4]. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Choice-independent reductive residual representation

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/reductive-residual-representation`.

Let ℓ be prime, Ĝ a split connected reductive group scheme over Z, and Γ profinite. The Ĝ-completely reducible semisimplification of any integral conjugate reduced into Ĝ(F̄_ℓ) is continuous and independent of all choices up to Ĝ(F̄_ℓ)-conjugacy.

**Hypotheses.** Let ℓ be prime, Ĝ a split connected reductive group scheme over Z, and Γ profinite.

**Derivation.** (ii): reduce modulo ϖ_{E′} and Ĝ-semisimplify; continuity is inherited from ρ′ mod ϖ (open kernel). Independence: for every tuple length m and every simultaneous-conjugation invariant f∈Z[Ĝ^m]^Ĝ, the residual evaluation is the reduction of f evaluated on the original tuple. These full invariant-tuple evaluations depend only on ρ and are unchanged by parabolic-to-Levi semisimplification. BHKT Theorem 4.5 identifies Ĝ-completely reducible conjugacy classes from this entire family. Its general reductive export is requested from the existing IHG.1 owner and remains a recorded gap; an ordinary matrix trace or determinant is insufficient.

**Needs.** `reductive-integral-models`, `finite-coefficients-and-finite-quotients`, `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction` (full invariant-tuple export, requested).

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), Theorem 4.8, arXiv v2 p. 16. Source context for Choice-independent reductive residual representation. Integral models of Ĝ-valued representations of a profinite group and their reduction modulo l. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration. [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), Theorem 4.5, arXiv v2 p. 14. Source context for Choice-independent reductive residual representation. Lafforgue's bijection between Ĝ-completely reducible representations and Ĝ-pseudocharacters, used for independence in (ii). The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

### Reductive integral models specialise to GL_n

**Retained parent ID:** `ArithmeticGaloisRepresentations:R01.1/reductive-integral-models-gln`.

Let ℓ be prime, Ĝ a split connected reductive group scheme over Z, and Γ profinite. For Ĝ=GL_n the integral conjugates are framed stable lattices, complete reducibility is ordinary semisimplicity, and the reductive residual isomorphism class is the residual class from R01.1/residual-representation-well-defined.

**Hypotheses.** Let ℓ be prime, Ĝ a split connected reductive group scheme over Z, and Γ profinite.

**Derivation.** (iii) For Ĝ = GL_n everything is proved in this layer without buildings or pseudocharacters: R01.1/compact-subgroups-stabilise-lattices for (i) and R01.1/brauer-nesbitt with R01.1/continuity-descent-and-lattice-independence for (ii); the stabiliser of a lattice is a vertex stabiliser of the GL_n building (RG2.2's lattice model), which is the comparison between the two proofs.

**Needs.** `continuous-representations-have-stable-lattices`, `framed-representation`, `baire-descent-to-a-finite-coefficient-field`, `residual-representation-well-defined`, `brauer-nesbitt`.

**Source.** [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2), Definition 4.9, arXiv v2 p. 17. Source context for Reductive integral models specialise to GL_n. For Ĝ = GL_n the reduction modulo l is the semisimplified reduction of a stable lattice. The exact extracted statement and any generalisation are justified by this node’s proof plan, not by treating the source’s other bundle clauses as this declaration.

## Prototype contract and assembly

The suggested file elaborates against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, with declaration-placeholder warnings only. Elaboration checks proposed types and names; it proves none of the planned mathematics. The definitive contracts are the statements in this document and the packet.

The refined algebraic objects use `FDRep` and the existing `Representation` dictionary. `TauCeti.AlgRep.fixedSubmodule` is the explicit equalizer of all fixed-vector equations for an arbitrary monoid; the invariant and Hom base-change theorems therefore do not acquire a finite-group hypothesis from the current library's special case. Factors are subquotients of an actual composition series in the module lattice, with endpoints bottom and top. The multiplicity wrapper calls the existing Tau Ceti multiplicity with its actual ring, module and simple-factor arguments.

The root-system comparison is typed as a homeomorphism from compatible roots with the inverse-limit topology to Z_ℓ. Separate signatures state its multiplicative-to-additive relation and Galois equivariance. This makes both the group law and topology visible; a bare set bijection is insufficient. Continuity at finite root levels uses their discrete topology.

The coefficient-Galois comparison is prototyped for compatible integral and residue automorphisms satisfying an actual commuting residue square, followed by its inertia and arithmetic-Frobenius specializations. The identification of the absolute Galois carrier with automorphisms of `PadicAlgCl`, and the exact valuation/residue action, are left to the LocalFieldsRamification supplier. The prototype does not replace those identifications with unconstrained propositions.

For a general split reductive group, the supplier-owned Hopf-algebra, building and complete-reducibility identifications are not restated in this file. Its integral-conjugacy signature covers the GL_n specialization. The general arithmetic statements remain the retained parent contracts with the two named gaps. The broad parent Ribet signature is an arithmetic wrapper whose full scope is assigned to the existing IHG owner; current `Theorems.ribet_lattice` supplies its distinct-character case, with the repeated-character export requested there.

Assembly retains the principal carrier IDs, attaches the new `refined-*` nodes to their `refines` parents, and routes each consumer to its exact construction or named theorem. It imports current AlgebraicVectorBundles L0C rather than creating another exterior-power plan. It imports algebraic induction maps from RepresentationTheory/InductionRestriction and reconstruction from IHG.0/IHG.1. The parent algebraically closed Brauer–Nesbitt and Ribet nodes become arithmetic applications of these supplier exports. No source excerpts or source-section surveys are part of this roadmap.

The assembled layer has six planets: the retained **Continuous representation**, and the refinement planets **Determinant character**, **Tate twist**, **Semisimplification**, **Brauer–Nesbitt theorem** and **Residual semisimplification**. Parent planet flags on other R01.1 nodes are suppressed during assembly to respect the six-planet limit.

## Supplier contracts and open boundaries

- **IntegralHeckeAndGaloisDeterminants:IHG.1**: Existing Classical Ribet lattice, with the full scope of Ribet Proposition 2.1, pp.154–155: two residual characters need not be distinct. Current Theorems.ribet_lattice requires distinctness. Import that export for distinct characters; ask the same owner to export the repeated-character case using the original successive-conjugation proof. This is an extension of its existing target, not a new local Ribet theorem. Consumed by `ribet-nonsplit-lattice`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula**: Canonical algebraic induction-in-stages, projection formula and their formulas on generators; this packet only adds continuity for open finite-index subgroups. Consumed by `refined-induction-interface`.
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius**: For K = Q_ℓ (more generally a nonarchimedean local field) and K̄ = PadicAlgCl ℓ: the action of G_K on the residue field F̄_ℓ of the valuation ring of K̄, i.e. the continuous surjection G_K → Gal(F̄_ℓ/F_ℓ), with arithmetic Frobenius lifts as the preimages of x ↦ x^q. Consumed by `refined-galois-coefficient-reduction`.
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group**: Import the existing inertia/Frobenius contract. Current Tau Ceti a91d3aa, NumberTheory/LocalField/Unramified/Inertia/Basic.lean, already proves ker_restrictMaximalUnramifiedHom and IsArithFrobeniusLift.isArithFrobeniusLift_iff_inv_mul_mem. Via the Layer 2 residue-field identification, these give the kernel and lift-coset assertions used here. No new inertia construction or coset theorem is planned. Consumed by `refined-galois-coefficient-reduction`.
- **ReductiveGroupsPartII:RG2.3**: The exact bounded-action fixed point, equivariant building scalar extension, and after a finite totally ramified extension a fixed point whose image is hyperspecial, as used in BHKT Theorem 4.8(ii), p.17. Import current RG2.3 compact-elements-in-hyperspecial-subgroups (2), which already owns compact-subgroup containment after extension and records its source gap. Verify its totally ramified specialization when the group is already split, and discharge that owner’s rational-fixed-point/ramification-rescaling source boundary; do not re-plan the target here. Consumed by `reductive-integral-models`.
- **IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction**: For a split connected reductive group and algebraically closed residue field, full invariant-tuple pseudocharacters detect completely reducible conjugacy classes; scalar change and parabolic/Levi semisimplification preserve evaluations. The atlas node states general reductive reconstruction, while current upstream Suggested.lean exports only GL reconstruction. Align this existing owner and export the BHKT Theorem 4.5 contract; do not infer it from GL uniqueness. Consumed by `reductive-residual-representation`.

The two mathematical/source gaps are:

- **Totally ramified hyperspecial passage for a fixed compact subgroup**: BHKT Theorem 4.8(ii), p.17, invokes Larsen (1995), Lemma 2.4. The BHKT proof was read, but the Larsen proof was not obtainable from an authorized primary source in this pass. Current ReductiveGroupsPartII RG2.3 already owns compact-elements-in-hyperspecial-subgroups (2), with an explicit reference gap for compact subgroups. Import that target and resolve its source boundary, including the totally ramified specialization for an already split group. The RG2.3 request names this existing contract. The GL_n stable-lattice case does not use this gap.
- **General reductive reconstruction export differs between atlas and current upstream**: The existing IHG.1/reductive-reconstruction atlas node supplies the correct full invariant-tuple statement; current upstream IHG.1.7 and Suggested.lean export GL reconstruction only. General reductive semisimplified residual independence needs BHKT Theorem 4.5 with §3.1 complete reducibility, not the determinant of a chosen faithful matrix representation. This is an owner-alignment gap with an exact supplier request, not a new local pseudocharacter definition.

The stage is planned, not closed. Review must check the stated hypotheses, constructor formulas, all retained and new tests, and the correspondence of packet APIs to the suggested signatures. Owner alignment of the general reductive reconstruction export and the compact-subgroup building source is required to close the general Ĝ targets. The LocalFieldsRamification residue-action contracts and the full-scope IHG Ribet export must also be supplied before assembly can treat those requests as discharged.

## Sources read for this refinement

Public primary sources were read on 9 October 2026. The packet records hashes for downloaded papers. Statements and proof outlines here are written for the mathematical targets rather than as a summary of any source's sections.

- [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf). 2007 revised version from Darmon's McGill page; pages are the PDF's printed page numbers. Read: §2.1, pp.50–54, including Proposition 2.6 and proof.
- [Ĝ-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491v2). arXiv:1609.03491v2; locators are that version's pages. Read: §3.1, Definitions 3.3 and 3.5 and Proposition 3.6, pp.8–9; §4, Definition 4.1, Lemma 4.4, Theorems 4.5 and 4.8 and Definition 4.9, pp.13–17; Lemma 10.5 and proof, pp.55–56 (algebraic induction motivation).
- [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2). arXiv:0809.0415v2. Read: §1.10, Lemma 1.12(ii) and Corollary 1.14, pp.12–14; Theorem 2.12 and Corollary 2.13, pp.28–31; Example 2.34, p.39.
- [A modular construction of unramified p-extensions of Q(µ_p)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0034/LOG_0016.pdf). Invent. Math. 34 (1976), 151–162; GDZ article PDF (PPN356556735_0034, LOG_0016), read on rendered page images (PDF pages 3–6 = printed pp. 152–155). Read: §2, Proposition 2.1 and proof, pp.153–155, read from page images.
- [Fields of definition for representations of associative algebras](https://www.math.uni-bielefeld.de/lag/man/581.pdf). Author manuscript, 24 February 2017. Read: §2, Theorem 2.2 and Lemma 2.3, p.4.
- [Pinned representation and module-topology interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory). Mathlib 082e2d3 and Tau Ceti f790474. Read: The exact declarations in baseline.declarations; finite-projective module topology; tensor, dual, Hom and subquotient actions.
- [Teichmüller lifts in a nonarchimedean local field](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/Teichmuller.lean). Tau Ceti f790474. Read: teichmuller; residue_teichmuller; eq_teichmuller; unitsMap_residue_comp_teichmuller.
- [Induction, restriction and Clifford theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md). TauCetiRoadmap main read 2026-10-09. Read: Complete README; Layers 0–2 and Suggested.lean transitivity and projection formula.

The inherited source catalogue remains in the parent packet. Larsen (1995), Lemma 2.4, DOI `10.1215/S0012-7094-95-08021-1`, is identified through BHKT Theorem 4.8(ii), p.17; its proof was not read from an authorized primary source. This is recorded as a gap rather than an established building theorem.

Independent review also checked the current Tau Ceti scalar-extension continuity API in `Topology/Algebra/Module/BaseChange.lean` and the inertia/Frobenius API in `NumberTheory/LocalField/Unramified/Inertia/Basic.lean` (commit `a91d3aa`). Reuse these existing implementations when updating the package pin; they are not new local targets. The fixed algebraic residue-field comparison remains the explicit Layer 2 supplier request.

Current Tau Ceti also supplies `TauCeti.exteriorPower.equivBaseChange` over arbitrary commutative rings and the finite-basis top-exterior determinant comparison (`LinearAlgebra/ExteriorPower/BaseChange.lean` and `Basic.lean`). Import these pieces alongside the AlgebraicVectorBundles finite-projective and determinant-object contracts.
