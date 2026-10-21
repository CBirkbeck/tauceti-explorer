# P7, Part II: derived coefficients, completed flat models and perfect duality

This document continues the accepted P7 blueprint for commutative algebra for deformation theory and patching. It plans the module-category interfaces between finite free minimal models, coefficient operations, completed flat complexes, inverse coefficient towers and duality. Its scope is exactly **DeformationAndDerivedPatchingAlgebra:P7**. The [packet](../packets/DeformationAndDerivedPatchingAlgebra--P7-2.json) is a completed coverage pass: P7 is **planned**, with ten identified proof refinements and six supplier requests, and is not closed. Every declaration remains unchecked. The [suggested file](../suggested/DeformationAndDerivedPatchingAlgebra--P7-2.lean) records proposed names and native types; it supplies no implementation.

## Conventions and the existing foundation

R is a commutative unital ring, and complexes are integer cochain complexes of R-modules with differential raising degree. D(R) is the pinned native derived category of ModuleCat R, and Q is its localization functor. Tensor totalization uses direct sums. For a cochain complex C, C[n] has term C^(i+n) in degree i and differential multiplied by (−1)^n. Thus shifting by n moves an interval [a,b] to [a−n,b−n]. The total tensor differential on a homogeneous x of degree p is d(x⊗y)=d(x)⊗y+(−1)^p x⊗d(y). The Koszul braid contributes (−1)^(pq). Linear Hom uses product cochains and differential δ(f)=d_target f−(−1)^degree(f) f d_source. These signs are the pinned Mathlib and Tau Ceti conventions.

The accepted [P7 packet](../packets/DeformationAndDerivedPatchingAlgebra--P7.json) owns perfect objects, pseudo-coherent objects, minimal finite free representatives, unit-pivot cancellation, uniqueness of minimal models, residual ranks, residual perfectness and Nakayama, three-term residual splitting and finite free tails. A perfect object has a bounded finite projective representative. A pseudo-coherent object has a bounded above finite free representative, including over a non-Noetherian ring. A minimal local model has every differential image in the maximal ideal times the next term. This follow-up imports those definitions and theorem nodes by their existing ids. In particular, finite residual cohomology of a minimal model is a statement about its terms; it is not an assertion that ordinary cohomological support equals Tor-amplitude.

Mathlib already has derived localization, K-projectivity and its localization comparison, natural-number indexed Tor, native tensor complexes, module contraction, finite-projective biduality and adic module completion. Tau Ceti already has the R-linear Hom complex and Koszul symmetry. The additional declarations here compare and compose that infrastructure. The native Tor functor derives the **second** variable; its alternate Tor′ derives the first. A projective chain resolution indexed by n≥0 must be reindexed to cochain degree −n before comparing native Tor with H^(−n). The pinned native spectral-sequence type contains pages, differentials and next-page homology isomorphisms. It does not supply a filtered construction or an abutment.

## Mathematical route

### Tensor and amplitude

K-flatness quantifies over every acyclic complex, without requiring the K-flat complex itself to be bounded or termwise flat. A flat stalk is K-flat, and signed tensor-cone compatibility proves closure under cones. A bounded above flat complex is the filtered union of its finite brutal truncations; induction on the number of terms and exactness of filtered colimits prove K-flatness. Module tensor preserves these colimits in either variable. Projective terms are flat, giving the bounded above projective case without a finite generation hypothesis.

There are two different representative-independence assertions. Tensor by a fixed K-flat complex preserves arbitrary quasi-isomorphisms. A quasi-isomorphism between two K-flat complexes remains a quasi-isomorphism after tensoring with an arbitrary third complex. The second assertion imports an unbounded K-flat replacement of the third complex from EnhancedDerivedSheaves:E1, then uses a tensor square and two-out-of-three. Neither statement replaces the native derived category by a list of homology modules. Derived tensor and derived extension retain actual morphisms, compositions and coefficient-ring structures.

Tor-amplitude [a,b] means vanishing outside that interval after tensoring with **every** degree-zero module stalk. Taking only the stalk R tests ordinary cohomological bounds and gives a weaker property. Over Z, the stalk Z/2 has cohomology in degree zero but Tor-amplitude [−1,0]. Flatness of the bottom smart-truncation cokernel follows from Tor-one vanishing. For a pseudo-coherent object, that cokernel has a finite free presentation; flat finite presentation makes it projective. This gives a finite projective model in the exact amplitude interval. Over a local ring, the accepted minimal-model residual-rank theorem identifies all-module amplitude, derived-residue cohomological support and strict minimal term support.

Finite-order pseudo-coherence uses an actual map from a bounded finite free complex, with homology isomorphisms above m and an epimorphism at m. Its triangle argument needs a t-structure lift and a strict K-projective representative of that lift. Its all-orders argument attaches finite free generators downwards and takes one compatible degreewise union. Those adapter proofs are explicitly recorded as refinement gaps. Triangle and summand closure for perfect objects then combine finite-order pseudo-coherence with finite Tor-amplitude; they do not assume an idempotent already splits termwise in a chosen model.

### Duality and degree-zero coefficient descriptions

Derived Hom is the module realization of the E1 internal Hom. For a bounded above projective source P, the native R-linear Hom complex into any target computes it. For a bounded finite projective P, the dual has degree n equal to Dual_R(P^(−n)), differential (−1)^(n+1) times the transposed source differential, and support [−b,−a]. The bidual evaluation in source degree n is x↦(f↦(−1)^n f(x)); unsigned evaluation need not be a chain map. Finite-projective contraction and the native Koszul symmetry compare tensor with the dual to derived Hom. The precise homogeneous contraction chain equation is a recorded refinement gap. Arbitrary scalar extension preserves finite projectivity and compares both duals and perfect-source Hom; no flatness of the new coefficient algebra is required.

BCGP21 Lemma 7.8.5 concerns a representative whose **terms** are supported in [0,l]. In this situation H^0 of the dual is the cokernel of (d^0)^*, so ordinary scalar extension commutes with this cokernel. Over a field that cokernel is the dual of the degree-zero kernel in the specialized original complex. Over a complete DVR O, the integral description instead uses the continuous O-linear E/O-dual of H^0 of the E/O coefficient complex. The continuous dual of the kernel of a finite free map tensored with E/O is the cokernel of its O-adjoint. CompletedCohomologyPartII:CC.3 owns the topology and the character or codifferent normalization required to identify this with a Z_p Pontryagin dual. Ordinary Hom_O(H^0(P),O) does not furnish the asserted integral formula.

### Arbitrary rank and completed flat complexes

The accepted CG18 route includes the full Kaplansky theorem: projective modules over arbitrary local rings are free, with no finite-generation hypothesis. The proof separates transfinite countable-support decomposition, a finite free direct summand containing any chosen element, countably generated projective freeness, and the full theorem. The transfinite support closure and local support-minimization arguments remain precisely identified refinements. The nilpotent-ideal spanning argument works for infinite families: if M is generated modulo I by a family, its quotient by the span satisfies N=IN, hence N=I^rN=0 when I^r=0. It does not invoke a finite-module Nakayama theorem.

For a DVR, lifted residue bases span every π-power quotient. π-torsion-freeness gives independence by successively reducing a finite relation and dividing its coefficients by π. Consequently P/π^nP is free over O/π^n even when its rank is infinite. The finite free O-algebra variant applies to finite abelian group algebras without a p-group or local-group-algebra hypothesis. These are the algebraic finite coefficient inputs before a completion or inverse limit.

Pilloni20 additionally uses flat modules that are separated and complete for the maximal-ideal topology. The required topological module basis is the completion of the **free direct sum** on a residue basis. An unrestricted product has the wrong residue basis at infinite rank. PadicMeasuresIwasawaAlgebras:L0 must extend its existing DVR Banach basis direction to this complete Noetherian local setting, with column-null matrices and convergent triangular basis changes. P7 then owns the complex-level splitting: diagonalize an invertible residual block, split off its identity disk, and repeat over a finite strict term interval. The result is a residual-minimal complete flat complex N and chain maps i:N→C and s:C→N, with i followed by s equal to id_N and s followed by i homotopic to id_C.

Finite-dimensional residual homology makes the terms of N finite free and therefore makes Q(C) perfect. Residual acyclicity makes N zero and C contractible. Apply this to a cone to detect quasi-isomorphisms after residue change. Transfer of an endomorphism t is i followed by t followed by s. Transfers compose up to the specified homotopy; the resulting ring homomorphism acts in the homotopy and derived categories. A separately chosen **strict** chain action is needed for the strict coefficient-tower construction below.

### Towers and spectral sequences

The ordinary quotient tower has level n equal to C/I^(n+1)C, with canonical reductions and genuine quotient-ring scalar structures. It is not the derived coefficient tower for an arbitrary C. K-flatness supplies the comparison. A quotient of chain maps and chain homotopies remains compatible with every transition. For finite complexes over complete Noetherian rings, native adic module completion identifies the strict inverse limit with C termwise. CC.2 owns generic derived inverse limits; P7 uses the termwise-surjective comparison to its product one-minus-shift cone model. The R-linear Milnor sequence retains lim¹ H^(j−1) until finite length of every coefficient homology module gives Mittag–Leffler stabilization and vanishing of lim¹. Surjectivity of complex terms does not assert surjectivity of homology transitions.

StrictTowerAction consists of actual unital ring homomorphisms to chain endomorphism rings and commuting equations for every tower arrow. The action is neither assumed central nor commutative. Limit maps and the Milnor sequence respect it by naturality. A limit of homotopies requires every degree-changing component to commute with transitions; unrelated levelwise homotopies are insufficient. ArithmeticHeckeInfrastructure:IHG.2 supplies the Hecke operators when these interfaces are used arithmetically. This packet constructs no Hecke algebra or operator.

For C strictly zero above b and a projective module resolution P strictly zero above zero, the coefficient double complex has D^(p,q)=C^q tensor P^p. On total degree n its potential support satisfies n−b≤p≤0 and n≤q≤b. Hence its diagonals are finite even when neither complex is bounded below. Filtering the total complex gives the coefficient spectral sequence with E₂^(p,q)=Tor_(−p)(H^q(C),B) for p≤0, zero for p>0, and differential of bidegree (r,1−r). Its construction must supply native page objects, next-page homology isomorphisms, comparison lifts and resolution-choice independence; naming a native spectral-sequence object alone proves none of these.

The actual homology H^n(C tensor^L B) receives a finite decreasing filtration F, with F^p equal to the whole module for p≤n−b and zero for p>0. Its successive quotients identify with stable terms in bidegree (p,n−p). Every such term stabilizes by r≥max(2,b−n+2): an outgoing differential then leaves p≤0, and an incoming differential comes from q>b. [Stacks Lemma 12.25.3](https://stacks.math.columbia.edu/tag/0132) reduces finite-diagonal convergence to finite filtered-complex convergence; the cycles/boundaries argument is in [Lemma 12.24.11](https://stacks.math.columbia.edu/tag/012W). The native filtered-page and abutment comparisons remain recorded refinements. When B is flat, only p=0 remains on page two and the edge gives H^n(C tensor^L B)≅H^n(C) tensor B. Strict chain actions propagate through every page and the finite filtration by the same naturality.

### Finite projective group coefficients

BCGP25 Lemma 7.4.11 applies to finite projective R[G]-modules for any finite group G and subgroup H. The H-invariants are the image of the **unnormalized** norm sum e_H. The sum over representatives of left cosets G/H maps H-invariants onto G-invariants. No inverse of |H| and no normality of H is needed. Base change of invariant modules is proved first on free group modules and then by a finite projective retract; arbitrary tensoring does not generally preserve the image of a map.

For any representation, Dual(M_H)≅Dual(M)^H. Under finite projectivity over R[G], there is also (Dual M)_H≅Dual(M^H). The second formula has **coinvariants** on its source. This subscript was checked in the rendered BCGP25 PDF, since text extraction loses it. Restricting invariant functionals to invariant vectors gives a different and generally false formula in characteristic dividing the group order.

## Target ledger
| Target | Disposition and declarations |
| --- | --- |
| Accepted minimal finite free models, residual ranks, finite-free-tail and uniformly bounded Hom-colimit comparisons | imported: `DeformationAndDerivedPatchingAlgebra:P7/minimal-representative`, `DeformationAndDerivedPatchingAlgebra:P7/minimal-residual-ranks`, `DeformationAndDerivedPatchingAlgebra:P7/residual-perfectness-criterion`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-residual-nakayama`, `DeformationAndDerivedPatchingAlgebra:P7/three-term-residual-splitting`, `DeformationAndDerivedPatchingAlgebra:P7/finite-free-tail-approximation`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-hom-uniform-colimit`.  |
| Actual derived tensor, Hom, representative independence and coefficient extension | planned: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-hom`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-hom-projective-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`.  |
| All-module Tor-amplitude, exact support, triangle/retract closure and Noetherian criteria | planned: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-projective-interval`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-minimal-support-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-triangle`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-retract`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-triangle`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-retract`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-noetherian-perfect-criterion`.  |
| Perfect duals and arbitrary coefficient duality, including BCGP21 degree-zero specializations | planned: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-bidual`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-tensor-hom`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-basechange`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-hom-basechange`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-degree-zero-field`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-degree-zero-dvr`.  |
| CG18 arbitrary rank freeness and Pilloni20 complete-flat minimal/perfect complexes | planned: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-local-projective-free`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dvr-torsionfree-quotient-free`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-group-coefficient-free`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-residual-perfect`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-residual-quasiiso`.  |
| Derived completion and Nakayama with the stated completeness and finiteness hypotheses | planned: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-derived-completion-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-pseudo-derived-nakayama`.  |
| Tor coefficient spectral sequence with actual finite abutment filtration and convergence | planned: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-sequence`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-E2`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-convergence`.  |
| Finite coefficients before limits, lim-one/ML, morphisms, homotopies and chain actions | planned: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-quotient-tower`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-module-tower-milnor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-length-cohomology-ml`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-coefficient-cohomology-limit`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-strict-tower-action`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-strict-action-limit-milnor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-homotopy-system-limit`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-actions`.  |
| BCGP25 finite projective group invariants, trace, duals and base change | planned: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-group-invariants-norm`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-group-coset-trace`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-group-invariants-basechange`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coinvariant-dual-invariant`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-dual-coinvariant`.  |
| Affine geometric perfect complexes and generic coherent exceptional duality | imported: `SchemeKTheoryOperations:S.1/affine-derived-equivalence`, `SchemeKTheoryOperations:S.1/affine-perfect-comparison`, `SchemeAndStackFoundations:SF:key/coherent-duality`. Import only: S.1 owns the affine equivalence; SF:key owns exceptional f!. Ordinary module RHom is not geometric f!. |

## Declaration plan

All names below are in **TauCeti.DerivedCoefficient**. Each entry corresponds to exactly one node. The complete id retains the accepted P7 stage and the fresh p7ii prefix. An API item used as a prerequisite has a separate promoted lemma node. Definitions and constructions each have three discriminating unit tests; comparison objects in the suggested file use isomorphism data rather than unnamed conditions.

### 1. K-flat module complexes

**Definition:** `TauCeti.DerivedCoefficient.IsKFlat`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat`.

For a commutative ring R and an integer cochain complex C of R-modules, IsKFlat(C) means that for every acyclic integer cochain complex E of R-modules the native direct-sum total complex E tensor_R C is acyclic. There is no boundedness or termwise-flatness hypothesis in the predicate.

**Construction or proof.** Use the existing acyclic predicate and the native signed direct-sum tensor complex; quantify over all complexes in one fixed module universe.

**Prerequisites.** `mathlib:HomologicalComplex.Acyclic`, `mathlib:HomologicalComplex.tensorObj`.

**Uses.** Stacks 06XY, Definition 15.60.13: Descend tensor to actual derived categories. P7 residual coefficient tests: Compute derived residue change from bounded above projective models.

**API.**

- `TauCeti.DerivedCoefficient.IsKFlat.of_iso` (compatibility): A chain isomorphism C≅D transports IsKFlat.
- `TauCeti.DerivedCoefficient.IsKFlat.tensor_acyclic` (characterisation): For acyclic E, E tensor C is acyclic precisely as required by the predicate.
- `TauCeti.DerivedCoefficient.IsKFlat.of_homotopyEquiv` (compatibility): A homotopy equivalence transports IsKFlat.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_kflat_zero` (degenerate): The zero complex is K-flat.
- `TauCeti.DerivedCoefficient.test_kflat_free_stalk` (compatibility): A stalk of a free module, with an arbitrary basis index set, is K-flat.
- `TauCeti.DerivedCoefficient.test_kflat_nonflat_stalk` (non-example): The degree-zero stalk Z/2 over Z is not K-flat; tensoring the acyclic complex Z --2→ Z → Z/2 in degrees −1,0,1 gives nonzero homology.

**Acceptance.** An acyclic complex of nonflat terms need not be K-flat.

**Source.** [06XY, Definition 15.60.1](https://stacks.math.columbia.edu/tag/06XY).

### 2. Flat stalks are K-flat

**Lemma:** `TauCeti.DerivedCoefficient.kflat_stalk_flat`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-stalk-flat`.

For every flat R-module M and integer n, the stalk complex M in degree n is K-flat.

**Construction or proof.** Flat tensor preserves each short exact cycles-boundaries sequence of an acyclic complex; the tensor stalk shifts that acyclic complex.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat`.

**Acceptance.** Applies to arbitrary-rank free modules and to non-finitely-generated flat modules.

**Source.** [06XY, Lemma 15.60.7, length-zero case](https://stacks.math.columbia.edu/tag/06XY).

### 3. K-flatness and mapping cones

**Lemma:** `TauCeti.DerivedCoefficient.kflat_cone`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-cone`.

For a chain map f:C→D, if two of C,D,Cone(f) are K-flat then so is the third.

**Construction or proof.** The signed tensor-cone comparison identifies E tensor Cone(f) with the cone of E tensor f. The homology long exact sequence detects acyclicity of the third term.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat`, `mathlib:CochainComplex.mappingCone`, `mathlib:HomologicalComplex.tensorObj`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-cone-comparison`.

**Acceptance.** No assumption that f is injective, or that the terms are flat.

**Source.** [06XY, Lemma 15.60.5](https://stacks.math.columbia.edu/tag/06XY).

### 4. Filtered colimits of K-flat complexes

**Lemma:** `TauCeti.DerivedCoefficient.kflat_filtered_colimit`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-filtered-colimit`.

The degreewise colimit of any small filtered diagram of K-flat R-module cochain complexes is K-flat.

**Construction or proof.** Module tensor and the direct sums in totalization commute with colimits. Exactness of filtered colimits of modules transports vanishing of all homology objects.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat`, `mathlib:HomologicalComplex.tensorObj`, `mathlib:CategoryTheory.HasExactColimitsOfShape.domain_of_functor`.

**Acceptance.** The diagram need not consist of inclusions.

**Source.** [06XY, Lemma 15.60.8](https://stacks.math.columbia.edu/tag/06XY).

### 5. Bounded above flat complexes are K-flat

**Theorem:** `TauCeti.DerivedCoefficient.kflat_bounded_above_flat`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-bounded-above-flat`.

If C is strictly zero above b and every term C^i is a flat R-module, then C is K-flat.

**Construction or proof.** Every finite brutal lower truncation of C is K-flat by induction, using its degreewise split stalk extension and kflat-cone. C is the filtered union of these truncations, so kflat-filtered-colimit applies.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-stalk-flat`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-cone`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-filtered-colimit`.

**Acceptance.** The tensor totalization uses direct sums; replacing it by products invalidates this proof.

**Source.** [06XY, Lemma 15.60.7; alternate proof using Lemma 15.60.8](https://stacks.math.columbia.edu/tag/06XY).

### 6. Bounded above projective representatives compute tensor

**Lemma:** `TauCeti.DerivedCoefficient.kflat_bounded_above_projective`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-bounded-above-projective`.

A bounded above complex of projective R-modules is K-flat. Its K-projectivity is supplied separately by the cited native theorem, with no new K-projective definition.

**Construction or proof.** Projective terms are flat by Module.Flat.of_projective. Apply kflat-bounded-above-flat; the native K-projective theorem is the independent Hom comparison prerequisite.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-bounded-above-flat`, `mathlib:Module.Flat.of_projective`, `mathlib:CochainComplex.isKProjective_of_projective`.

**Acceptance.** Finite generation is unnecessary for this comparison.

**Source.** [06XY, Lemma 15.60.7 and pinned K-projective theorem](https://stacks.math.columbia.edu/tag/06XY).

### 7. Tensor by K-flat preserves quasi-isomorphisms

**Lemma:** `TauCeti.DerivedCoefficient.kflat_preserves_quasiiso`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-preserves-quasiiso`.

For K-flat C and a quasi-isomorphism f:E→F, the native map f tensor id_C is a quasi-isomorphism.

**Construction or proof.** The cone of f is acyclic. Tensor-cone compatibility and K-flatness make the cone of f tensor id acyclic.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-cone`, `mathlib:CochainComplex.mappingCone`, `mathlib:HomologicalComplex.tensorObj`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-cone-comparison`.

**Acceptance.** The second complex may be unbounded.

**Source.** [06XY, Lemma 15.60.2](https://stacks.math.columbia.edu/tag/06XY).

### 8. Quasi-isomorphisms between K-flat complexes tensor with any complex

**Lemma:** `TauCeti.DerivedCoefficient.kflat_quasiiso_arbitrary_factor`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-quasiiso-arbitrary-factor`.

For a quasi-isomorphism f:C→D between K-flat complexes and any complex E, id_E tensor f is a quasi-isomorphism, even when E is not K-flat.

**Construction or proof.** Import an unbounded module K-flat replacement P→E from the requested E1 specialization. In the tensor square both horizontal maps induced by P→E are quasi-isomorphisms, as C and D are K-flat. The remaining vertical map is a quasi-isomorphism by K-flatness of P. Two-out-of-three proves the assertion.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-preserves-quasiiso`, `EnhancedDerivedSheaves:E1`.

**Acceptance.** This is the representative-independence input; K-flatness of E is deliberately absent.

**Source.** [06XY, Lemma 15.60.12](https://stacks.math.columbia.edu/tag/06XY).

### 9. K-flatness survives arbitrary scalar extension

**Lemma:** `TauCeti.DerivedCoefficient.kflat_basechange`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-basechange`.

For any ring homomorphism f:R→S and K-flat C, the termwise complex S tensor_R C is K-flat over S.

**Construction or proof.** For acyclic S-complex E, restrict scalars to R; associativity identifies E tensor_S (S tensor_R C) with E tensor_R C. Restriction preserves and detects acyclicity.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat`, `mathlib:ModuleCat.extendScalars`, `mathlib:HomologicalComplex.tensorObj`.

**Acceptance.** S need not be flat over R.

**Source.** [06XY, Lemma 15.60.3](https://stacks.math.columbia.edu/tag/06XY).

### 10. Tensor of K-flat complexes

**Lemma:** `TauCeti.DerivedCoefficient.kflat_tensor`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-tensor`.

The native direct-sum total tensor of two K-flat R-complexes is K-flat.

**Construction or proof.** For acyclic E, use the native associator to identify E tensor (C tensor D) with (E tensor C) tensor D and apply the two K-flat predicates.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat`, `mathlib:HomologicalComplex.tensorObj`.

**Acceptance.** The complexes can both be unbounded.

**Source.** [06XY, Lemma 15.60.4](https://stacks.math.columbia.edu/tag/06XY).

### 11. Module specialization of the derived tensor bifunctor

**Construction:** `TauCeti.DerivedCoefficient.derivedTensor`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`.

For every commutative ring R, derivedTensor is an additive bifunctor D(R)→(D(R)→D(R)) on the native derived category of ModuleCat R. Its value is Q(P tensor_R T) for unbounded K-flat replacements P of X and T of Y; morphisms descend from the homotopy category localization. The supplier E1 owns the generic enhanced tensor construction; this node is its module-category comparison with the native chain tensor and localization.

**Construction or proof.** Use the requested ModuleCat realization of E1 replacements and enhanced tensor. Compare its tensor on K-flat objects with the native signed chain tensor. The localization universal property and kflat-quasiiso-arbitrary-factor produce a bifunctor and a natural comparison, independent of choices.

**Prerequisites.** `mathlib:DerivedCategory.Q`, `mathlib:HomologicalComplex.tensorObj`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-quasiiso-arbitrary-factor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-tensor`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E1`.

**Uses.** P7 acceptance: derived change to residue fields: Retain negative-degree Tor terms. P8 and CompletedCohomologyAndHecke:CC.4: Transport actual maps and actions through coefficient change.

**API.**

- `TauCeti.DerivedCoefficient.derivedTensor_obj_obj` (data): For K-flat P,T, derivedTensor(QP,QT) is naturally isomorphic to Q(P tensor T).
- `TauCeti.DerivedCoefficient.derivedTensor_map_id` (functoriality): Maps preserve identity in each variable.
- `TauCeti.DerivedCoefficient.derivedTensor_map_comp` (functoriality): Maps preserve composition in each variable.
- `TauCeti.DerivedCoefficient.derivedTensor_unit` (equivalence): Tensor with the degree-zero stalk R is naturally isomorphic to the identity functor.
- `TauCeti.DerivedCoefficient.derivedTensor_braid` (equivalence): The symmetry is induced by the Koszul sign (−1)^(ij) on degree-i and degree-j homogeneous factors.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_tensor_zero` (degenerate): For every X, derivedTensor(X,0) is zero.
- `TauCeti.DerivedCoefficient.test_tensor_unit` (compatibility): derivedTensor(R[0],X) is naturally isomorphic to X.
- `TauCeti.DerivedCoefficient.test_tensor_torsion` (computation): Over Z, derivedTensor((Z/2)[0],(Z/2)[0]) has H^−1≅Z/2 and H^0≅Z/2, and no other homology.

**Acceptance.** The output is an object of the actual D(R), with actual morphisms, rather than a family of homology modules.

**Source.** [06XY, Definition 15.60.13; Lemma 15.60.12](https://stacks.math.columbia.edu/tag/06XY).

### 12. One K-flat factor suffices for the derived tensor comparison

**Comparison:** `TauCeti.DerivedCoefficient.tensor_representative_comparison`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`.

If C is K-flat, then for every complex E there is a natural isomorphism derivedTensor(QE,QC)≅Q(E tensor_R C), compatible with chain maps in both variables.

**Construction or proof.** Replace E by an E1 K-flat complex P. K-flatness of C makes P tensor C→E tensor C a quasi-isomorphism, whose Q-image gives the comparison. Independence follows from kflat-quasiiso-arbitrary-factor.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-preserves-quasiiso`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-quasiiso-arbitrary-factor`, `mathlib:DerivedCategory.Q`, `mathlib:HomologicalComplex.tensorObj`.

**Acceptance.** In particular the accepted minimal finite free representative computes derived residue change.

**Source.** [06XY, Definition 15.60.13 and Lemma 15.60.12](https://stacks.math.columbia.edu/tag/06XY).

### 13. Derived tensor is exact in either variable

**Lemma:** `TauCeti.DerivedCoefficient.tensor_exact`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-exact`.

For any Y in D(R), tensoring with Y maps every distinguished triangle to a distinguished triangle, with the signed natural shift comparison.

**Construction or proof.** Represent a triangle by a mapping cone and Y by a K-flat complex. Native tensor-cone and signed-shift comparisons identify its tensor with a cone triangle. The localization transports distinguishedness.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-cone`, `mathlib:DerivedCategory.Q`, `mathlib:CochainComplex.mappingCone`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-cone-comparison`.

**Acceptance.** No boundedness or perfectness hypothesis is required.

**Source.** [06XY, Definition 15.60.13, exactness assertion](https://stacks.math.columbia.edu/tag/06XY).

### 14. Coherent derived tensor associativity

**Comparison:** `TauCeti.DerivedCoefficient.tensor_coherence`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-coherence`.

The native associator, units and Koszul braiding descend to natural isomorphisms on derivedTensor satisfying the pentagon, triangle, hexagon and symmetry identities.

**Construction or proof.** Compute all objects on K-flat representatives. All coherence diagrams are the Q-images of the native chain diagrams; the comparison from derived-tensor transfers those identities.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-tensor`, `mathlib:HomologicalComplex.tensorObj`.

**Acceptance.** On R in degree 1 tensor R in degree 1, the braiding is multiplication by −1, not +1 when 2≠0.

**Source.** [06XY, Lemmas 15.60.14–15 and native chain coherence](https://stacks.math.columbia.edu/tag/06XY).

### 15. Derived scalar extension on native module derived categories

**Construction:** `TauCeti.DerivedCoefficient.derivedExtension`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`.

For an arbitrary homomorphism f:R→S of commutative rings, derivedExtension(f):D(R)→D(S) is the additive exact functor computed by Q_S(S tensor_R P) for a K-flat representative P of X. The output remembers its S-module structure.

**Construction or proof.** Use termwise native ModuleCat.extendScalars on K-flat representatives. The quasi-isomorphism preservation needed to descend follows from tensor-representative-comparison, with scalar restriction detecting it.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-basechange`, `mathlib:ModuleCat.extendScalars`, `mathlib:DerivedCategory.Q`.

**Uses.** P7 change R→R/I^n and R→κ: Create coefficient objects and maps. BCGP21 Lemma 7.8.5: Specialize perfect duals along arbitrary algebra maps.

**API.**

- `TauCeti.DerivedCoefficient.derivedExtension_model` (compatibility): For K-flat P, derivedExtension(f)(Q_RP)≅Q_S((extendScalars f)P).
- `TauCeti.DerivedCoefficient.derivedExtension_id` (equivalence): Derived extension along id_R is naturally isomorphic to the identity.
- `TauCeti.DerivedCoefficient.derivedExtension_comp` (equivalence): For R→S→T, successive derived extensions are naturally isomorphic to extension along the composite.
- `TauCeti.DerivedCoefficient.derivedExtension_map_comp` (functoriality): The functor transports composition and zero maps.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_extension_identity` (degenerate): Extension along id_R preserves X with its native module structure.
- `TauCeti.DerivedCoefficient.test_extension_flat` (compatibility): For a flat R-algebra S and a module M, extension of M[0] is (S tensor_R M)[0].
- `TauCeti.DerivedCoefficient.test_extension_nonflat` (computation): For Z→Z/2, extension of (Z/2)[0] has nonzero homology in degrees −1 and 0 over Z/2.

**Acceptance.** The functor targets D(S), not merely D(R).

**Source.** [06XY, Definition 15.60.13 and Lemma 15.60.3](https://stacks.math.columbia.edu/tag/06XY).

### 16. Arbitrary extension preserves perfectness

**Lemma:** `TauCeti.DerivedCoefficient.extension_preserves_perfect`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-extension-preserves-perfect`.

If X is perfect over R, then derivedExtension(f)(X) is perfect over S for every commutative ring map f:R→S.

**Construction or proof.** Choose the accepted bounded finite projective representative. Its scalar extension is still finite projective termwise, because each term is a retract of a finite free module; the same finite support and differentials represent the extension.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `mathlib:Module.Flat.of_projective`.

**Acceptance.** No flatness assumption is placed on S.

**Source.** [0656, Lemma 15.76.9](https://stacks.math.columbia.edu/tag/0656).

### 17. Arbitrary extension preserves pseudo-coherence

**Lemma:** `TauCeti.DerivedCoefficient.extension_preserves_pseudo`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-extension-preserves-pseudo`.

If X is pseudo-coherent over R, then derivedExtension(f)(X) is pseudo-coherent over S for every commutative ring map f:R→S.

**Construction or proof.** Choose a bounded above finite free representative supplied by the accepted definition; its termwise extension has the same upper bound and finite free terms. The model comparison identifies it with the derived extension.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-object`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-bounded-above-projective`.

**Acceptance.** Non-Noetherian R and S are permitted.

**Source.** [064N, Lemma 15.66.12 (base change); finite free model argument](https://stacks.math.columbia.edu/tag/064N).

### 18. Compare native Tor with derived tensor homology

**Comparison:** `TauCeti.DerivedCoefficient.tor_stalk_comparison`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-stalk-comparison`.

For R-modules M,N and n≥0 there is a natural module isomorphism Tor_R(n)(M,N)≅H^−n(derivedTensor(M[0],N[0])), where native Tor derives the second variable.

**Construction or proof.** Use the native projective resolution of N, embedded from nonnegative chain degrees into nonpositive cochain degrees. Its tensor with M computes native leftDerived tensor and the derived tensor by tensor-representative-comparison. Degree n in the chain resolution becomes degree −n.

**Prerequisites.** `mathlib:CategoryTheory.Tor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-bounded-above-projective`, `mathlib:DerivedCategory.homologyFunctor`, `mathlib:DerivedCategory.singleFunctor`.

**Acceptance.** Over Z, Tor_1(Z/2,Z/2) identifies with H^−1, not H^1.

**Source.** [061Y, Example 15.63.4, stalk specialization](https://stacks.math.columbia.edu/tag/061Y).

### 19. Compare the two native Tor conventions

**Comparison:** `TauCeti.DerivedCoefficient.tor_balanced`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-balanced`.

For each n≥0 the native bifunctors Tor and Tor′ on R-modules are naturally isomorphic; the comparison agrees with the derived tensor braid under tor-stalk-comparison.

**Construction or proof.** The projective resolution computation in the first variable identifies Tor′ with the same negative-degree derived tensor homology. Compose the two comparisons and use tensor-coherence for naturality and balanced symmetry.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-stalk-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-coherence`, `mathlib:CategoryTheory.Tor'`.

**Acceptance.** Higher native Tor vanishes when either module is projective only after this comparison, not from the second-variable native vanishing theorem alone.

**Source.** [061Y, Examples 15.63.2–4; symmetry of derived tensor](https://stacks.math.columbia.edu/tag/061Y).

### 20. Signed tensor-cone comparison

**Comparison:** `TauCeti.DerivedCoefficient.tensor_cone_comparison`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-cone-comparison`.

For E,C,D and a chain map f:C→D, the native complex E tensor Cone(f) is naturally chain-isomorphic to Cone(id_E tensor f). In degree p of E the shifted C-summand is multiplied by (−1)^p; the D-summand is unchanged.

**Construction or proof.** Expand Cone(f)^n=D^n⊕C^(n+1), with differential (d_D,f;0,−d_C). The sign on the C-summand aligns the E differential on each side. Verify the chain-map equation on each summand and use the same sign for the inverse.

**Prerequisites.** `mathlib:HomologicalComplex.tensorObj`, `mathlib:CochainComplex.mappingCone`.

**Acceptance.** When E is R in odd degree, omitting the sign fails the chain-map equation over Z.

**Source.** [064J, Lemma 15.59.4 via the explicit cone identification](https://stacks.math.columbia.edu/tag/064J).

### 21. All-module Tor-amplitude

**Definition:** `TauCeti.DerivedCoefficient.HasTorAmplitude`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`.

For X in the actual D(R) and integers a,b, HasTorAmplitude(X,a,b) means that for every R-module M and every integer i with i<a or b<i, H^i(derivedTensor(X,M[0])) is zero. No condition a≤b is built into the predicate; when a>b it forces X to be zero. Finite Tor dimension means the existence of such an interval.

**Construction or proof.** Quantify over every object of ModuleCat in a fixed universe, using actual derived tensor and native homology zero objects.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `mathlib:DerivedCategory.homologyFunctor`, `mathlib:DerivedCategory.singleFunctor`.

**Uses.** Stacks 0658: Recover a finite projective representative in the specified interval. P7 minimal residual ranks and P8: Keep term amplitude separate from cohomological bounds.

**API.**

- `TauCeti.DerivedCoefficient.HasTorAmplitude.of_iso` (compatibility): An isomorphism transports the same interval.
- `TauCeti.DerivedCoefficient.HasTorAmplitude.mono` (relation): If a′≤a and b≤b′, amplitude [a,b] implies amplitude [a′,b′].
- `TauCeti.DerivedCoefficient.HasTorAmplitude.shift` (compatibility): X[n] has amplitude [a−n,b−n] when X has amplitude [a,b]. Promoted declaration: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude-shift`.
- `TauCeti.DerivedCoefficient.HasTorAmplitude.cohomology` (characterisation): Taking M=R shows H^i(X)=0 outside [a,b].
- `TauCeti.DerivedCoefficient.HasTorAmplitude.finite` (characterisation): Finite Tor dimension is equivalent to the existence of a bounded flat representative.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_amplitude_zero` (degenerate): The zero object has amplitude [a,b] for all integers, including a>b.
- `TauCeti.DerivedCoefficient.test_amplitude_free_stalk` (computation): For nonzero R, the degree-j stalk R has amplitude [a,b] exactly when a≤j≤b.
- `TauCeti.DerivedCoefficient.test_amplitude_torsion` (non-example): The degree-zero stalk Z/2 over Z has amplitude [−1,0], but does not have amplitude [0,0], although its cohomology is concentrated in degree 0.

**Acceptance.** Checking only M=R measures cohomological range, which is a different predicate.

**Source.** [0651, Definition 15.68.1](https://stacks.math.columbia.edu/tag/0651).

### 22. Flatness from vanishing native Tor one

**Comparison:** `TauCeti.DerivedCoefficient.tor_flat_criterion`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-flat-criterion`.

An R-module M is flat if and only if for every R-module N the native module Tor_1(M,N) is zero.

**Construction or proof.** Flat tensor makes a projective resolution exact in positive chain degrees. Conversely use the tensor long exact sequence of 0→I→R→R/I→0: Tor_1 vanishing makes I tensor M→M injective for every finitely generated ideal I. Apply the native ideal criterion for flatness.

**Prerequisites.** `mathlib:CategoryTheory.Tor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-stalk-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-one-ideal-sequence`, `mathlib:Module.Flat.iff_rTensor_injective`.

**Acceptance.** Vanishing only for N=R holds for every M and does not imply flatness.

**Source.** [00M5, Lemma 10.75.8](https://stacks.math.columbia.edu/tag/00M5).

### 23. Bounded flat support gives Tor-amplitude

**Lemma:** `TauCeti.DerivedCoefficient.amplitude_bounded_flat`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-bounded-flat`.

If a flat-term complex C is strictly zero outside [a,b], then Q(C) has Tor-amplitude [a,b].

**Construction or proof.** K-flatness computes tensor with any stalk M by C tensor M, which retains the same support; its homology is zero outside that support.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-bounded-above-flat`.

**Acceptance.** Finite projective and finite free terms are special cases.

**Source.** [0651, Lemma 15.68.3, reverse implication](https://stacks.math.columbia.edu/tag/0651).

### 24. The bottom cokernel of a flat resolution is flat

**Lemma:** `TauCeti.DerivedCoefficient.amplitude_bottom_syzygy`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-bottom-syzygy`.

If C is bounded above with flat terms and Q(C) has Tor-amplitude [a,b], then coker(d:C^(a−1)→C^a) is flat.

**Construction or proof.** Taking M=R makes the segment ending in C^a→coker(d^(a−1)) a flat resolution below a. Its Tor_1 with any M is the homology of C tensor M at a−1, hence zero by amplitude. Apply tor-flat-criterion. The flat-resolution computation is a separate refinement dependency recorded as a gap.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-flat-criterion`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-bounded-above-flat`.

**Acceptance.** This cokernel, rather than H^a(C), is asserted to be flat.

**Source.** [0651, Lemma 15.68.2](https://stacks.math.columbia.edu/tag/0651).

### 25. Tor-amplitude is bounded flat support

**Theorem:** `TauCeti.DerivedCoefficient.amplitude_flat_representative`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-flat-representative`.

For X in D(R) and a≤b, Tor-amplitude [a,b] is equivalent to existence of a flat-module complex E, strictly zero outside [a,b], with Q(E)≅X.

**Construction or proof.** Use amplitude-bounded-flat in one direction. In the other import a bounded above projective resolution zero above b from the E1 module-realization contract. Smart-truncate at a; amplitude-bottom-syzygy proves the new bottom cokernel flat, and cohomology vanishing below a makes the truncation a quasi-isomorphism.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-bounded-flat`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-bottom-syzygy`, `EnhancedDerivedSheaves:E1`.

**Acceptance.** The flat bottom term need not be projective without finite presentation.

**Source.** [0651, Lemma 15.68.3](https://stacks.math.columbia.edu/tag/0651).

### 26. Tor-amplitude survives arbitrary coefficient extension

**Lemma:** `TauCeti.DerivedCoefficient.amplitude_basechange`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-basechange`.

If X has Tor-amplitude [a,b] over R, derivedExtension(f)(X) has Tor-amplitude [a,b] over S for every f:R→S.

**Construction or proof.** Extend a flat representative supported in [a,b]; its terms remain flat over S and its support is unchanged.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-flat-representative`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-bounded-flat`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-basechange`.

**Acceptance.** No flatness of S over R is required.

**Source.** [0651, Lemma 15.68.13](https://stacks.math.columbia.edu/tag/0651).

### 27. Tor-amplitude is preserved by retracts

**Lemma:** `TauCeti.DerivedCoefficient.amplitude_retract`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-retract`.

If i:X→Y and r:Y→X satisfy i followed by r=id_X and Y has amplitude [a,b], then X has amplitude [a,b].

**Construction or proof.** Tensor and homology preserve the retract identity. Each outside homology module is a retract of a zero module, hence zero.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `mathlib:DerivedCategory.homologyFunctor`.

**Acceptance.** A termwise split representative need not be chosen.

**Source.** [0651, Lemma 15.68.7](https://stacks.math.columbia.edu/tag/0651).

### 28. Tor-amplitude under extensions

**Lemma:** `TauCeti.DerivedCoefficient.amplitude_triangle_middle`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-triangle-middle`.

In a distinguished triangle X→Y→Z→X[1], amplitude [a,b] for both X and Z implies amplitude [a,b] for Y.

**Construction or proof.** Tensor with every stalk module; the homology long exact sequence makes the middle homology zero outside the common interval.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-exact`, `mathlib:DerivedCategory.homologyFunctor`.

**Acceptance.** The common interval does not widen.

**Source.** [0651, Lemma 15.68.5(2)](https://stacks.math.columbia.edu/tag/0651).

### 29. Tor-amplitude of a cone

**Lemma:** `TauCeti.DerivedCoefficient.amplitude_triangle_cone`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-triangle-cone`.

In a distinguished triangle X→Y→Z→X[1], amplitude [a+1,b+1] for X and [a,b] for Y imply [a,b] for Z.

**Construction or proof.** Rotate to Y→Z→X[1] and use the shift rule: X[1] has amplitude [a,b]. Apply amplitude-triangle-middle.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-triangle-middle`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-exact`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude-shift`.

**Acceptance.** For two objects in [a,b] their cone can require degree a−1.

**Source.** [0651, Lemma 15.68.5(1)](https://stacks.math.columbia.edu/tag/0651).

### 30. Finite-order pseudo-coherent approximation

**Definition:** `TauCeti.DerivedCoefficient.IsMPseudoCoherent`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-finite-order`.

For m in Z and X in D(R), IsMPseudoCoherent(X,m) means existence of a bounded finite free complex E and a derived morphism Q(E)→X inducing isomorphisms H^i for i>m and a surjection H^m. This is an approximation by an actual derived morphism, not merely finite generation of a list of cohomology groups.

**Construction or proof.** Use the actual native derived category. The source E is K-projective, so strict chain models for its morphisms are available.

**Prerequisites.** `mathlib:DerivedCategory.Q`, `mathlib:DerivedCategory.homologyFunctor`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-object`.

**Uses.** Stacks 064X: Direct-summand closure uses a finite-order descending argument. Stacks 0658: Choose a finite free model with prescribed upper support.

**API.**

- `TauCeti.DerivedCoefficient.IsMPseudoCoherent.mono` (relation): If n≤m, n-pseudo-coherence implies m-pseudo-coherence.
- `TauCeti.DerivedCoefficient.IsMPseudoCoherent.of_iso` (compatibility): Derived isomorphisms transport the predicate.
- `TauCeti.DerivedCoefficient.IsMPseudoCoherent.of_pseudo` (compatibility): Pseudo-coherence implies m-pseudo-coherence for every m.
- `TauCeti.DerivedCoefficient.IsMPseudoCoherent.shift` (compatibility): X[n] is (m−n)-pseudo-coherent when X is m-pseudo-coherent. Promoted declaration: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-shift`.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_mpseudo_zero` (degenerate): Zero is m-pseudo-coherent for every m.
- `TauCeti.DerivedCoefficient.test_mpseudo_stalk_finite` (characterisation): M[0] is 0-pseudo-coherent exactly when M is finitely generated.
- `TauCeti.DerivedCoefficient.test_mpseudo_stalk_presentation` (characterisation): M[0] is (−1)-pseudo-coherent exactly when M is finitely presented; over a non-Noetherian ring finite generation alone does not suffice.

**Acceptance.** E is bounded even when X is unbounded below.

**Source.** [064Q, Definition 15.66.1](https://stacks.math.columbia.edu/tag/064Q).

### 31. Finite-order pseudo-coherence of a cone

**Lemma:** `TauCeti.DerivedCoefficient.mpseudo_triangle_cone`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-triangle-cone`.

In a distinguished triangle X→Y→Z→X[1], (m+1)-pseudo-coherence of X and m-pseudo-coherence of Y imply m-pseudo-coherence of Z.

**Construction or proof.** Truncate an approximation P→X below m+1. Its terms are in degrees ≥m+1; the cone of an m-approximation E→Y has homology zero in degrees ≥m. T-structure orthogonality lifts Q(P)→Y through Q(E), and K-projectivity makes the lift a chain map. The finite free cone maps to Z; exact cohomology diagrams give the asserted isomorphisms and surjection. The lift and cohomology diagram lemmas are the recorded refinement gap.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-finite-order`, `mathlib:CochainComplex.isKProjective_of_projective`, `mathlib:CochainComplex.IsKProjective.Qh_map_bijective`, `mathlib:CochainComplex.mappingCone`, `mathlib:DerivedCategory.homologyFunctor`.

**Acceptance.** The order on X is m+1.

**Source.** [064N, Lemma 15.66.2(1)](https://stacks.math.columbia.edu/tag/064N).

### 32. Finite-order pseudo-coherence under extensions

**Lemma:** `TauCeti.DerivedCoefficient.mpseudo_triangle_middle`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-triangle-middle`.

In a distinguished triangle X→Y→Z→X[1], m-pseudo-coherence of X and Z implies m-pseudo-coherence of Y.

**Construction or proof.** Rotate backwards to Z[−1]→X→Y; Z[−1] is (m+1)-pseudo-coherent by the shift rule. Apply mpseudo-triangle-cone.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-triangle-cone`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-finite-order`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-shift`.

**Acceptance.** The middle assertion preserves the same order m.

**Source.** [064N, Lemma 15.66.2(2)](https://stacks.math.columbia.edu/tag/064N).

### 33. Finite top cohomology of a finite-order approximation

**Lemma:** `TauCeti.DerivedCoefficient.mpseudo_top_finite`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-top-finite`.

If X is m-pseudo-coherent and H^i(X)=0 for i>m, then H^m(X) is finitely generated.

**Construction or proof.** Split off the top surjective differential of its bounded finite free approximation using projectivity, and repeat until the approximation is zero above m. H^m(X) is then a quotient of its finite degree-m module.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-finite-order`, `mathlib:DerivedCategory.homologyFunctor`.

**Acceptance.** No Noetherian hypothesis is used.

**Source.** [064N, Lemma 15.66.3(1)](https://stacks.math.columbia.edu/tag/064N).

### 34. All finite orders give a finite free model

**Comparison:** `TauCeti.DerivedCoefficient.mpseudo_all_orders_model`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-all-orders-model`.

X is pseudo-coherent if and only if it is m-pseudo-coherent for all m. If H^i(X)=0 above b, its bounded above finite free model can be chosen strictly zero above b.

**Construction or proof.** Brutal truncations of a finite free model give all finite-order approximations. Conversely descend from b: the cone of a partial model has zero homology in degrees ≥n and finitely generated H^(n−1). Lift its finitely many generating cycles and attach a finite free degree-(n−1) term. The compatible descending union gives the quasi-isomorphism. The attachment and union lemmas are recorded refinement gaps.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-finite-order`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-triangle-cone`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-top-finite`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-object`, `mathlib:CochainComplex.mappingCone`.

**Acceptance.** The prescribed upper support is used in finite-projective-interval.

**Source.** [064N, Lemma 15.66.5](https://stacks.math.columbia.edu/tag/064N).

### 35. Pseudo-coherent objects are closed under triangles

**Theorem:** `TauCeti.DerivedCoefficient.pseudo_triangle`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-triangle`.

In a distinguished triangle in D(R), if two objects are pseudo-coherent then the third is pseudo-coherent.

**Construction or proof.** Use the finite-order triangle assertions for every m, rotate for the third case, then apply mpseudo-all-orders-model.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-all-orders-model`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-triangle-cone`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-triangle-middle`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-object`.

**Acceptance.** No Noetherian or finite Tor dimension hypothesis is required.

**Source.** [064V, Lemma 15.66.6](https://stacks.math.columbia.edu/tag/064V).

### 36. Finite-order pseudo-coherence of direct summands

**Lemma:** `TauCeti.DerivedCoefficient.mpseudo_retract`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-retract`.

If X⊕Y is m-pseudo-coherent, each summand is m-pseudo-coherent.

**Construction or proof.** The split triangle (X⊕Y)→(X⊕Y)→Y⊕Y[1] gives m-pseudo-coherence of the latter. Shifting gives this for Y[n]⊕Y[n+1]. Y is bounded above, hence Y[n] has no homology in degrees ≥m for large n and admits the zero approximation. Descend through split triangles to obtain Y, then exchange the summands.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-finite-order`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-triangle-cone`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-triangle-middle`, `mathlib:DerivedCategory.Q`.

**Acceptance.** No termwise idempotent splitting is assumed.

**Source.** [064X, Lemma 15.66.8, finite-order part](https://stacks.math.columbia.edu/tag/064X).

### 37. Pseudo-coherence of direct summands

**Theorem:** `TauCeti.DerivedCoefficient.pseudo_retract`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-retract`.

If X⊕Y is pseudo-coherent, then both summands are pseudo-coherent.

**Construction or proof.** Apply mpseudo-retract for every m and the all-orders comparison.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-retract`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-all-orders-model`.

**Acceptance.** This holds over every commutative ring.

**Source.** [064X, Lemma 15.66.8, pseudo-coherent part](https://stacks.math.columbia.edu/tag/064X).

### 38. Exact finite projective support from Tor-amplitude

**Theorem:** `TauCeti.DerivedCoefficient.finite_projective_interval`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-projective-interval`.

If X is pseudo-coherent and has Tor-amplitude [a,b] with a≤b, it admits a finite projective representative E strictly zero outside [a,b].

**Construction or proof.** Choose a finite free model F zero above b. Smart truncate at a. Its bottom coker(d^(a−1)) is finitely presented from the finite free presentation F^(a−1)→F^a, flat by amplitude-bottom-syzygy, and projective by the native flat finite-presentation criterion. The other terms are finite free.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-all-orders-model`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-bottom-syzygy`, `mathlib:Module.Flat.projective_of_finitePresentation`, `mathlib:Module.finitePresentation_of_surjective`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-object`.

**Acceptance.** Over a general ring the bottom term is projective; it becomes free after a local-ring argument.

**Source.** [0658, Lemma 15.76.2, final assertion](https://stacks.math.columbia.edu/tag/0658).

### 39. Perfectness is pseudo-coherence plus finite Tor dimension

**Theorem:** `TauCeti.DerivedCoefficient.perfect_pseudo_finite_tor`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-pseudo-finite-tor`.

Over any commutative ring, X is perfect if and only if it is pseudo-coherent and has Tor-amplitude [a,b] for some a≤b.

**Construction or proof.** A perfect model gives both properties. Conversely finite-projective-interval gives the required perfect model.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-projective-interval`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-bounded-flat`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-is-pseudo-coherent`, `mathlib:Module.Flat.of_projective`.

**Acceptance.** Finite modules over singular Noetherian rings need not be perfect.

**Source.** [0658, Lemma 15.76.2](https://stacks.math.columbia.edu/tag/0658).

### 40. Perfect objects are closed under triangles

**Theorem:** `TauCeti.DerivedCoefficient.perfect_triangle`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-triangle`.

In a distinguished triangle in D(R), if two objects are perfect then the third is perfect.

**Construction or proof.** Pseudo-coherence follows from pseudo-triangle. Widen the two finite intervals to a common interval with the required shift and apply the corresponding amplitude triangle lemma, then perfect-pseudo-finite-tor.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-pseudo-finite-tor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-triangle`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-triangle-middle`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-triangle-cone`.

**Acceptance.** This is two-out-of-three, including cones.

**Source.** [0656, Lemma 15.76.4](https://stacks.math.columbia.edu/tag/0656).

### 41. Perfect objects are closed under direct summands

**Theorem:** `TauCeti.DerivedCoefficient.perfect_retract`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-retract`.

If X⊕Y is perfect, both summands are perfect.

**Construction or proof.** Each summand is pseudo-coherent and retains a finite amplitude interval. Apply perfect-pseudo-finite-tor.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-pseudo-finite-tor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-retract`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-retract`.

**Acceptance.** No chosen termwise splitting of a model is required.

**Source.** [0656, Lemma 15.76.5](https://stacks.math.columbia.edu/tag/0656).

### 42. Local amplitude equals minimal residual support

**Comparison:** `TauCeti.DerivedCoefficient.minimal_support_amplitude`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-minimal-support-amplitude`.

For a local ring R, pseudo-coherent X and a bounded above minimal finite free model M, these are equivalent for a≤b: Tor-amplitude [a,b] for X; homology of derivedExtension(R→κ)(X) zero outside [a,b]; M^i=0 outside [a,b].

**Construction or proof.** All-module amplitude implies residual vanishing. Accepted minimal residual ranks turn this into zero minimal terms. Those finite free terms imply all-module amplitude by amplitude-bounded-flat.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-bounded-flat`, `DeformationAndDerivedPatchingAlgebra:P7/minimal-representative`, `DeformationAndDerivedPatchingAlgebra:P7/minimal-residual-ranks`, `DeformationAndDerivedPatchingAlgebra:P7/residual-perfectness-criterion`.

**Acceptance.** R --π→ R in degrees −1,0 over a DVR has Tor-amplitude and minimal support [−1,0], though its cohomology lies only in degree 0.

**Source.** [0658, Lemma 15.76.2 and local minimal-model specialization](https://stacks.math.columbia.edu/tag/0658).

### 43. Tor one controls tensor of ideal inclusions

**Lemma:** `TauCeti.DerivedCoefficient.tor_one_ideal_sequence`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-one-ideal-sequence`.

For an ideal I of R and module M there is an exact sequence Tor_1(M,R/I)→M tensor I→M tensor R, natural in M and in compatible ideal maps.

**Construction or proof.** Apply the native stalk functor to 0→I→R→R/I→0, use triangleOfSES_distinguished, tensor with M[0] and take degrees −1 and 0 in the homology long exact sequence. tor-stalk-comparison gives the native Tor term and right-exact tensor gives the degree-zero terms.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-stalk-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-exact`, `mathlib:DerivedCategory.triangleOfSES_distinguished`, `mathlib:DerivedCategory.HomologySequence.exact₂`, `mathlib:DerivedCategory.singleFunctor`.

**Acceptance.** No finiteness of I is required for this sequence.

**Source.** [00M5, Lemma 10.75.8, proof using the short exact ideal sequence](https://stacks.math.columbia.edu/tag/00M5).

### 44. Module realization of enhanced derived Hom

**Construction:** `TauCeti.DerivedCoefficient.derivedHom`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-hom`.

derivedHom is a bifunctor D(R)^op→(D(R)→D(R)) valued in the native module derived category. It is the requested ModuleCat realization of the E1 internal Hom: compute the R-linear product Hom complex from a source complex to an unbounded K-injective target representative. This node supplies the comparison with native localization and R-linearity, while E1 owns replacements and generic internal Hom.

**Construction or proof.** Import the precise E1 module realization and unbounded K-injective replacements. Transfer its internal Hom to native D(ModuleCat R); the forgetful comparison to the native HomComplex pins the differential and R-module structure.

**Prerequisites.** `mathlib:DerivedCategory.Q`, `tauceti:TauCeti.linearHomComplex`, `tauceti:TauCeti.forget₂LinearHomComplexIso`, `EnhancedDerivedSheaves:E1`.

**Uses.** Stacks 0656, Lemma 15.76.15: Define and compute perfect duals. BCGP21 Lemma 7.8.5: Use H^0 of the perfect dual as a coefficient module.

**API.**

- `TauCeti.DerivedCoefficient.derivedHom_cohomology` (characterisation): H^n(derivedHom(X,Y)) identifies with the R-module of morphisms X→Y[n] in D(R).
- `TauCeti.DerivedCoefficient.derivedHom_map_id` (functoriality): Maps preserve identities in the opposite source and covariant target.
- `TauCeti.DerivedCoefficient.derivedHom_map_comp` (functoriality): The source action reverses composition and the target action preserves it.
- `TauCeti.DerivedCoefficient.derivedHom_unit` (compatibility): derivedHom(R[0],Y) is naturally isomorphic to Y.
- `TauCeti.DerivedCoefficient.derivedHom_tensor_adjunction` (universal-property): Morphisms derivedTensor(X,Y)→Z identify naturally with morphisms X→derivedHom(Y,Z).

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_hom_zero` (degenerate): derivedHom(0,Y) is zero.
- `TauCeti.DerivedCoefficient.test_hom_unit` (compatibility): derivedHom(R[0],Y)≅Y.
- `TauCeti.DerivedCoefficient.test_hom_torsion` (computation): Over Z, derivedHom((Z/2)[0],Z[0]) has H^1≅Z/2, H^0=0, and no other homology.

**Acceptance.** Internal Hom is an object in D(R); its H^0 recovers the module of derived morphisms.

**Source.** [0A5W, Definition of derived Hom preceding Lemma 15.75.1](https://stacks.math.columbia.edu/tag/0A5W).

### 45. A bounded above projective source computes derived Hom

**Comparison:** `TauCeti.DerivedCoefficient.hom_projective_comparison`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-hom-projective-comparison`.

For a bounded above complex P of projective R-modules and arbitrary complex E, there is a natural isomorphism derivedHom(QP,QE)≅Q(linearHomComplex R P E).

**Construction or proof.** Choose the imported unbounded K-injective replacement E→J. K-projectivity of P makes linearHomComplex(P,E)→linearHomComplex(P,J) a quasi-isomorphism; native shifted-hom comparisons give each homology isomorphism. Compose with the E1 realization. The linear homotopy-to-homology comparison is recorded as a refinement gap.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-hom`, `tauceti:TauCeti.linearHomComplex`, `tauceti:TauCeti.forget₂LinearHomComplexIso`, `mathlib:CochainComplex.isKProjective_of_projective`, `mathlib:CochainComplex.IsKProjective.Qh_map_bijective`.

**Acceptance.** The target E need not be bounded below.

**Source.** [0A66, Lemma 15.75.2](https://stacks.math.columbia.edu/tag/0A66).

### 46. The dual of a perfect derived module

**Construction:** `TauCeti.DerivedCoefficient.perfectDual`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`.

For a perfect X in D(R), perfectDual(X) is derivedHom(X,R[0]), with the inherited contravariant maps. Its finite projective representative is linearHomComplex(P,R[0]) for a bounded finite projective representative P of X.

**Construction or proof.** Restrict the E1-derived Hom realization in its first variable to perfect objects and fix the target R[0]. Use hom-projective-comparison to specify the native representative.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-hom`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-hom-projective-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `tauceti:TauCeti.linearHomComplex`.

**Uses.** BCGP21 Lemma 7.8.5: H^0 of the dual admits field and E/O coefficient descriptions. P7 completion and specialization: Compare duals before and after coefficient extension.

**API.**

- `TauCeti.DerivedCoefficient.perfectDual_model` (compatibility): The dual is represented by Hom^•(P,R), with degree n equal to Dual(P^−n) and differential (−1)^(n+1)(d_P)^*.  Promoted declaration: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual-model`.
- `TauCeti.DerivedCoefficient.perfectDual_map` (functoriality): A derived map X→Y gives Y^∨→X^∨ by precomposition.
- `TauCeti.DerivedCoefficient.perfectDual_map_comp` (functoriality): Dualization reverses composition.
- `TauCeti.DerivedCoefficient.perfectDual_bidevaluation` (equivalence): The signed evaluation map X→X^∨∨ is an isomorphism. Promoted declaration: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-bidual`.
- `TauCeti.DerivedCoefficient.perfectDual_amplitude` (compatibility): Amplitude [a,b] becomes [−b,−a]. Promoted declaration: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-amplitude`.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_dual_zero` (degenerate): The dual of zero is zero.
- `TauCeti.DerivedCoefficient.test_dual_stalk` (computation): For finite projective M in degree j, its perfect dual is Dual(M) in degree −j.
- `TauCeti.DerivedCoefficient.test_dual_torsion` (non-example): Over Z, the perfect degree-zero stalk Z/2 has dual with H^1≅Z/2 and H^0=0; ordinary module duality would erase it.

**Acceptance.** The dual keeps all cochain degrees; it is not termwise dual of cohomology.

**Source.** [0656, Lemma 15.76.15](https://stacks.math.columbia.edu/tag/0656).

### 47. Finite projective support of the dual

**Lemma:** `TauCeti.DerivedCoefficient.dual_projective_support`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-projective-support`.

If P has finite projective terms and is zero outside [a,b], its native linear Hom complex to R[0] has finite projective terms and is zero outside [−b,−a].

**Construction or proof.** Only the component Hom(P^−n,R) survives in degree n. Apply the native finite-projective dual instances and reverse the support.

**Prerequisites.** `tauceti:TauCeti.linearHomComplex`, `mathlib:Module.dual_projective`, `mathlib:Module.dual_finite`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual-model`.

**Acceptance.** No Noetherian or local hypothesis is needed.

**Source.** [0656, Lemma 15.76.15, first paragraph](https://stacks.math.columbia.edu/tag/0656).

### 48. Perfect duals remain perfect

**Lemma:** `TauCeti.DerivedCoefficient.perfect_dual_perfect`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual-perfect`.

The perfect dual of a perfect object is perfect.

**Construction or proof.** The displayed dual representative is bounded finite projective by dual-projective-support.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-projective-support`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`.

**Acceptance.** This refers to the whole derived dual.

**Source.** [0656, Lemma 15.76.15](https://stacks.math.columbia.edu/tag/0656).

### 49. Signed evaluation on a finite projective complex

**Comparison:** `TauCeti.DerivedCoefficient.chain_bidual_sign`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-chain-bidual-sign`.

For a bounded finite projective P, the degree-n map x↦(f↦(−1)^n f(x)) gives a natural chain isomorphism P≅Hom^•(Hom^•(P,R),R) under the native differential δ=d_target f−(−1)^degree f d_source.

**Construction or proof.** The twice-dual differential is minus the degreewise bidual of d_P. Multiplying evaluation in degree n by (−1)^n makes the differential square commute. Native finite-projective reflexivity makes each component an isomorphism; naturality follows from evaluation.

**Prerequisites.** `tauceti:TauCeti.linearHomComplex`, `mathlib:Module.evalEquiv`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual-model`.

**Acceptance.** Unsigned evaluation fails for a nonzero differential over Z.

**Source.** [0656, Lemma 15.76.15, signed evaluation paragraph](https://stacks.math.columbia.edu/tag/0656).

### 50. Perfect biduality in the actual derived category

**Comparison:** `TauCeti.DerivedCoefficient.perfectDual_bidevaluation`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-bidual`.

For perfect X, signed evaluation gives a natural isomorphism X≅perfectDual(perfectDual(X)), natural contravariantly twice in X.

**Construction or proof.** Compute on a bounded finite projective model, apply Q to chain-bidual-sign and transfer through the representative comparisons.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual-perfect`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-chain-bidual-sign`, `mathlib:DerivedCategory.Q`.

**Acceptance.** The degree-one stalk gives the negative evaluation convention before passing to the derived category.

**Source.** [0656, Lemma 15.76.15](https://stacks.math.columbia.edu/tag/0656).

### 51. Tensor with a finite projective dual computes native linear Hom

**Comparison:** `TauCeti.DerivedCoefficient.chain_tensor_hom`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-chain-tensor-hom`.

For a bounded finite projective P and arbitrary complex E, there is a natural chain isomorphism E tensor Hom^•(P,R)≅Hom^•(P,E), using the native Koszul symmetry and contraction conventions.

**Construction or proof.** There are finitely many P degrees, so degreewise Hom products are finite and match tensor direct sums. The native dualTensorHomEquiv supplies each module contraction. Choose the Koszul signs forced by ordering E before the dual factor and verify the two differential contributions on homogeneous summands. The signed contraction equation is a recorded refinement gap.

**Prerequisites.** `tauceti:TauCeti.linearHomComplex`, `mathlib:HomologicalComplex.tensorObj`, `mathlib:dualTensorHomEquiv`, `tauceti:TauCeti.koszulBraiding`.

**Acceptance.** The statement holds for unbounded E, but requires finite projectivity and boundedness of P.

**Source.** [0656, Lemma 15.76.15, final paragraph](https://stacks.math.columbia.edu/tag/0656).

### 52. Perfect tensor-Hom duality

**Comparison:** `TauCeti.DerivedCoefficient.perfect_tensor_hom`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-tensor-hom`.

For perfect X and arbitrary Y, there is a natural isomorphism derivedTensor(Y,perfectDual(X))≅derivedHom(X,Y).

**Construction or proof.** Represent X by bounded finite projective P and Y by E. The dual representative is K-flat, so the tensor is computed by E tensor Hom(P,R). Apply chain-tensor-hom and the derived Hom comparison.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-hom-projective-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-chain-tensor-hom`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-projective-support`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`.

**Acceptance.** It is unnecessary that Y be perfect.

**Source.** [0656, Lemma 15.76.15](https://stacks.math.columbia.edu/tag/0656).

### 53. Tor-amplitude of the perfect dual

**Lemma:** `TauCeti.DerivedCoefficient.perfectDual_amplitude`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-amplitude`.

For perfect X of Tor-amplitude [a,b] with a≤b, perfectDual(X) has Tor-amplitude [−b,−a].

**Construction or proof.** Choose the exact finite projective interval and dualize its native representative; use amplitude-bounded-flat on the reversed interval.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-projective-interval`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-projective-support`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-bounded-flat`.

**Acceptance.** Cohomological range alone cannot be substituted for Tor-amplitude.

**Source.** [0656, Remark 15.76.16](https://stacks.math.columbia.edu/tag/0656).

### 54. Perfect duality commutes with arbitrary coefficient extension

**Comparison:** `TauCeti.DerivedCoefficient.dual_basechange`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-basechange`.

For perfect X over R and any f:R→S, there is a natural isomorphism derivedExtension(f)(perfectDual_R(X))≅perfectDual_S(derivedExtension(f)(X)).

**Construction or proof.** The canonical coefficient map S tensor Hom(P,R)→Hom(S tensor P,S) is a termwise isomorphism for finite projective P: check finite free terms and their retracts. It respects the signed differential. Descend by the K-flat model comparison.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-extension-preserves-perfect`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-projective-support`, `mathlib:dualTensorHomEquiv`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual-model`.

**Acceptance.** The ring map may be nonflat; dropping perfectness invalidates the isomorphism.

**Source.** [0ATK, Lemma 15.100.3, perfect first factor](https://stacks.math.columbia.edu/tag/0ATK).

### 55. Perfect-source derived Hom base change

**Comparison:** `TauCeti.DerivedCoefficient.perfect_hom_basechange`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-hom-basechange`.

For perfect X, arbitrary Y and f:R→S, the canonical map derivedExtension(f)(derivedHom_R(X,Y))→derivedHom_S(derivedExtension(f)X,derivedExtension(f)Y) is an isomorphism.

**Construction or proof.** Rewrite both sides using perfect-tensor-hom and dual-basechange; the native scalar tensor associativity identifies them.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-tensor-hom`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-basechange`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-coherence`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`.

**Acceptance.** Y may be unbounded; X must be perfect.

**Source.** [0ATK, Lemma 15.100.3, perfect first factor](https://stacks.math.columbia.edu/tag/0ATK).

### 56. Tensor products of perfect objects

**Lemma:** `TauCeti.DerivedCoefficient.perfect_tensor_perfect`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-tensor-perfect`.

If X and Y are perfect over R, their derived tensor is perfect.

**Construction or proof.** The total tensor of their bounded finite projective representatives is bounded. Each term is a finite sum of tensor products of finite projective modules, hence a retract of a finite free module.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `mathlib:HomologicalComplex.tensorObj`.

**Acceptance.** The term interval is the sum of the two model intervals.

**Source.** [0656, Lemma 15.76.11](https://stacks.math.columbia.edu/tag/0656).

### 57. Countable decomposition of projective modules

**Theorem:** `TauCeti.DerivedCoefficient.projective_countable_decomposition`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-countable-decomposition`.

For every projective R-module P, there exist an index type I and countably generated projective R-modules P_i with an R-linear equivalence P≅directSum_i P_i. Neither R nor P is assumed Noetherian or finite.

**Construction or proof.** Realize P as a retract of a free module. Close a countable set of basis indices under the finite supports of its images under the retract idempotent; this gives an invariant countable coordinate summand. Well-order the remaining basis, repeat on successive quotients, and take unions at limits. Split successor factors and identify their direct sum with P. The invariant-support recursion and transfinite direct-sum equivalence require the separately recorded refinement gap.

**Prerequisites.** .

**Acceptance.** Countable generation concerns each summand, not the whole module.

**Source.** [058T, Theorem 10.84.5 via Theorem 10.84.4](https://stacks.math.columbia.edu/tag/058T).

### 58. An element of a local projective module lies in a finite free summand

**Lemma:** `TauCeti.DerivedCoefficient.local_free_summand`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-local-free-summand`.

If R is local, P is projective, and x belongs to P, there is a finite free direct summand N of P containing x.

**Construction or proof.** Embed P as a direct summand of a free module F. Choose a basis of F minimizing the finite support of x. No coefficient of x lies in the ideal generated by the others. The finite matrix of the projection F→P on this support consequently has diagonal entries congruent to 1 and off-diagonal entries in the maximal ideal. Its determinant is a unit. The projected basis vectors therefore span a finite free summand of F, contained in P and containing x; restricting the retraction makes it a summand of P. The support-minimization/basis-change argument is recorded for further lemma refinement.

**Prerequisites.** .

**Acceptance.** The conclusion holds without finite generation of P.

**Source.** [058Z, Lemma 10.85.3 and proof](https://stacks.math.columbia.edu/tag/058Z).

### 59. Countably generated local projective modules are free

**Lemma:** `TauCeti.DerivedCoefficient.countable_local_projective_free`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-countable-local-projective-free`.

A countably generated projective module over a local ring is free.

**Construction or proof.** Enumerate generators. At each step split off a finite free summand containing the residual image of the next generator. The complement is projective, so local-free-summand applies again. The union of the finite partial sums contains every generator. Finite-support independence identifies the module with the direct sum of these finite free summands.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-local-free-summand`.

**Acceptance.** The basis may be countably infinite.

**Source.** [058Z, Lemma 10.85.2, applied using Lemma 10.85.3](https://stacks.math.columbia.edu/tag/058Z).

### 60. Kaplansky freeness over local rings

**Theorem:** `TauCeti.DerivedCoefficient.local_projective_free`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-local-projective-free`.

Every projective module over an arbitrary commutative local ring is free, without a finite-generation hypothesis.

**Construction or proof.** Decompose into countably generated projective summands; choose a free basis on each by countable-local-projective-free. Their disjoint union is a basis of the direct sum.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-countable-decomposition`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-countable-local-projective-free`.

**Acceptance.** Supplies the infinite rank local projective coefficient input in CG18, proof of Lemma 7.7.

**Source.** [058Z, Theorem 10.85.4](https://stacks.math.columbia.edu/tag/058Z).

### 61. Residue generators span across a nilpotent ideal

**Lemma:** `TauCeti.DerivedCoefficient.nilpotent_residue_spanning`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-nilpotent-residue-spanning`.

If I is a nilpotent ideal of R and a family v_i in M spans M/IM over R/I, then the same family spans M over R. The index type and M may be infinite.

**Construction or proof.** For N the span of the family, residue spanning says M=N+IM. Inductively M=N+I^k M. Choose I^k=0 to conclude M=N. Every module element has finite support in a span; no finite-generation form of Nakayama is used.

**Prerequisites.** .

**Acceptance.** This fails for a nonnilpotent maximal ideal: Q_p over Z_p has zero residue and is nonzero.

**Source.** [051G, Lemma 10.101.2, spanning step in the proof](https://stacks.math.columbia.edu/tag/051G).

### 62. Arbitrary residue bases lift over an Artinian local ring

**Theorem:** `TauCeti.DerivedCoefficient.nilpotent_flat_free`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-nilpotent-flat-free`.

Let R be local with nilpotent maximal ideal, and M flat. For any basis of M/mM and any lifts of its basis vectors, those lifts are a basis of M. In particular M is free with the same arbitrary rank.

**Construction or proof.** The native flat-module lemma gives linear independence of the lifts. nilpotent-residue-spanning gives spanning, hence the canonical finite-support linear-combination map is a linear equivalence.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-nilpotent-residue-spanning`, `mathlib:Module.IsLocalRing.linearIndependent_of_flat`.

**Acceptance.** No completeness or finite-generation hypothesis is necessary.

**Source.** [051G, Lemma 10.101.2 and proof](https://stacks.math.columbia.edu/tag/051G).

### 63. Residue lifts span every DVR quotient

**Lemma:** `TauCeti.DerivedCoefficient.dvr_lifts_span_quotients`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dvr-lifts-span-quotients`.

For a DVR O with uniformizer π, any O-module P and lifts x_i of a basis of P/πP, the images x_i span P/π^nP over O/π^n for every n≥1.

**Construction or proof.** Apply nilpotent-residue-spanning to the image of (π) in O/(π^n), whose nth power is zero. Its residue quotient of P/(π^nP) is P/(πP).

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-nilpotent-residue-spanning`.

**Acceptance.** Torsion freeness is not required for spanning.

**Source.** [CG18, Lemma 7.5, spanning induction](https://math.uchicago.edu/~fcale/papers/CG.pdf).

### 64. Torsion-free residue lifts are independent modulo powers

**Lemma:** `TauCeti.DerivedCoefficient.dvr_lifts_independent_quotients`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dvr-lifts-independent-quotients`.

If multiplication by π on P is injective, lifts x_i of a basis of P/πP are linearly independent in P/π^nP over O/π^n for every n≥1.

**Construction or proof.** Induct on n. A finitely supported relation modulo π^(n+1) reduces modulo π to show each coefficient is divisible by π. Write coefficients πs_i and use injectivity of multiplication by π on P to cancel π in the relation. Induction shows all s_i divisible by π^n.

**Prerequisites.** .

**Acceptance.** Finite support of each relation is essential; arbitrary products are not substituted for the free module.

**Source.** [CG18, Lemma 7.5, independence induction](https://math.uchicago.edu/~fcale/papers/CG.pdf).

### 65. Torsion-free modules are free modulo uniformizer powers

**Theorem:** `TauCeti.DerivedCoefficient.dvr_torsionfree_quotient_free`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dvr-torsionfree-quotient-free`.

For a DVR O, π-torsion-free O-module P and n≥1, every lifted residue basis is a basis of P/π^nP over O/π^n. In particular the quotient is free, with no restriction on its rank.

**Construction or proof.** Combine spanning and linear independence of the same lifted family to produce the basis.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dvr-lifts-span-quotients`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dvr-lifts-independent-quotients`.

**Acceptance.** Does not assert P itself is free or complete.

**Source.** [CG18, Lemma 7.5](https://math.uchicago.edu/~fcale/papers/CG.pdf).

### 66. Freeness lifts over a finite free coefficient algebra

**Theorem:** `TauCeti.DerivedCoefficient.finite_algebra_residue_free`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-algebra-residue-free`.

Let O be a DVR, n≥1, and S a finite free O-algebra. Let M be an S-module killed by π^n, free as an O/π^n-module. If M/πM is free over S/πS, lifts of any S/πS-basis form an S/π^nS-basis of M.

**Construction or proof.** Choose an O-basis z_j of S and a residue S/πS-basis y_i of M/πM. The products z_j y_i form an O/π-basis of the residue module. Since M is O/π^n-free, nilpotent-flat-free shows their lifts form an O/π^n-basis of M. Expanding each S/π^n coefficient in the finite basis z_j proves independence and spanning of the y_i over S/π^n.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-nilpotent-flat-free`.

**Acceptance.** S is not required to be local.

**Source.** [CG18, Lemma 7.6 and proof, finite free algebra argument](https://math.uchicago.edu/~fcale/papers/CG.pdf).

### 67. Calegari–Geraghty group-algebra freeness

**Application:** `TauCeti.DerivedCoefficient.finite_group_coefficient_free`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-group-coefficient-free`.

For any finite abelian group Δ and n≥1, let R=O[Δ]. If an R-module M is O/π^n-free and M/πM is k[Δ]-free, then M is (O/π^n)[Δ]-free; any lifted k[Δ]-basis is a basis.

**Construction or proof.** The group elements give the finite O-basis of O[Δ]. Apply finite-algebra-residue-free and the quotient group-algebra identification.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-algebra-residue-free`.

**Acceptance.** No p-group or local-group-algebra hypothesis is inserted; it is needed only in the later arithmetic application.

**Source.** [CG18, Lemma 7.6](https://math.uchicago.edu/~fcale/papers/CG.pdf).

### 68. Finite bounded above cohomology is pseudo-coherent

**Theorem:** `TauCeti.DerivedCoefficient.noetherian_finite_cohomology_pseudo`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-noetherian-finite-cohomology-pseudo`.

Over a Noetherian commutative ring R, an object X of D(R) is pseudo-coherent if and only if H^i(X) is finite for every i and H^i(X)=0 for i sufficiently large.

**Construction or proof.** A bounded above finite free model has finite homology because submodules of finite modules are finite over a Noetherian ring. Conversely descend from the top nonzero cohomology degree, choose finite free generators, and attach them to the partial model. The cone retains finite cohomology by the long exact sequence and Noetherian closure under subquotients. Use the same descending attachment and union contract as mpseudo-all-orders-model.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-all-orders-model`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-top-finite`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-triangle`, `mathlib:Module.finitePresentation_of_finite`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-object`.

**Acceptance.** The Noetherian hypothesis is not removed.

**Source.** [064N, Lemma 15.66.17](https://stacks.math.columbia.edu/tag/064N).

### 69. Noetherian finite-cohomology perfectness criterion

**Comparison:** `TauCeti.DerivedCoefficient.noetherian_perfect_criterion`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-noetherian-perfect-criterion`.

Over a Noetherian ring, X is perfect if and only if it has bounded finite cohomology and finite Tor-amplitude. Over a complete Noetherian local ring, a pseudo-coherent X with bounded residue-derived cohomology is perfect.

**Construction or proof.** Combine finite-cohomology pseudo-coherence with perfect-pseudo-finite-tor. In the local case, minimal-support-amplitude replaces finite all-module Tor-amplitude by bounded derived residue cohomology.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-noetherian-finite-cohomology-pseudo`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-pseudo-finite-tor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-minimal-support-amplitude`.

**Acceptance.** Finite bounded cohomology alone is insufficient over a singular local ring.

**Source.** [0656, Lemma 15.76.3 and local specialization of Lemma 15.76.2](https://stacks.math.columbia.edu/tag/0656).

### 70. Bounded complexes of complete flat modules

**Definition:** `TauCeti.DerivedCoefficient.IsCompleteFlatComplex`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-complex`.

For a complete Noetherian commutative local ring R with maximal ideal m, IsCompleteFlatComplex(C) means C is an integer cochain complex with a finite strict term-support interval, every C^i is flat over R, and every C^i is m-adically separated and complete. Maps are native R-linear chain maps; they are continuous for the adic topologies. Terms may have infinite rank.

**Construction or proof.** Combine native flatness, native IsAdicComplete m, and strict finite term bounds. An R-linear map sends m^nM into m^nN, so is adically continuous.

**Prerequisites.** `mathlib:IsAdicComplete`, `mathlib:DerivedCategory.Q`.

**Uses.** Pilloni20, Propositions 2.2.1 and 2.2.2: Pass from bounded infinite rank complete flat models to perfectness and derived Nakayama. Pilloni20, proof of Proposition 2.3.1: Split contractible summands while retaining complete flat terms.

**API.**

- `TauCeti.DerivedCoefficient.IsCompleteFlatComplex.of_iso` (compatibility): A native chain isomorphism transports complete flatness and boundedness.
- `TauCeti.DerivedCoefficient.IsCompleteFlatComplex.cone` (constructor): The native cone of a map between complete flat complexes is complete flat. Promoted declaration: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-cone`.
- `TauCeti.DerivedCoefficient.IsCompleteFlatComplex.kflat` (compatibility): Every complete flat complex is K-flat, so ordinary termwise tensor computes derived coefficient change. Promoted declaration: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-kflat`.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_complete_flat_zero` (degenerate): The zero complex is complete flat.
- `TauCeti.DerivedCoefficient.test_complete_flat_finite_free` (compatibility): Every bounded finite free R-complex is complete flat.
- `TauCeti.DerivedCoefficient.test_complete_flat_fraction_field` (non-example): Over a complete DVR O, the stalk of its fraction field E is flat but not π-adically separated and complete, hence not complete flat.

**Acceptance.** Ordinary algebraic completion is not a substitute for the derived-completeness predicate of DD.1.

**Source.** [Pilloni20, §2.2, definition of C_flat(R)](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 71. Split a complete flat map into its invertible and residual-zero parts

**Lemma:** `TauCeti.DerivedCoefficient.complete_flat_morphism_splitting`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-morphism-splitting`.

For R as above and an R-linear map f:M→N between flat m-adically complete modules, there exist decompositions M=M_1⊕M_2 and N=N_1⊕N_2 into complete flat summands such that f preserves the summands, f:M_1→N_1 is an isomorphism, and f:M_2→N_2 reduces to zero modulo m.

**Construction or proof.** Choose a residue basis adapted to the kernel and image of the residue map and import the completed-direct-sum lifting theorem requested from PM:L0. Extend the image basis to the target. In topological bases, f has blocks identity,C,0,B, with columns tending to zero. Subtract the convergent C-block columns from the complementary domain basis to obtain identity,0,0,B. B has rows indexed by the target complement and columns by the source complement, with entries in m.

**Prerequisites.** `PadicMeasuresIwasawaAlgebras:L0`, `mathlib:IsAdicComplete`.

**Acceptance.** The completed free module is the completion of a direct sum; it is not the unrestricted product R^I.

**Source.** [Pilloni20, Lemma 2.3.1](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 72. Cancel one complete flat contractible disk

**Lemma:** `TauCeti.DerivedCoefficient.complete_flat_disk_cancellation`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-disk-cancellation`.

If a differential of a bounded complete flat complex C has an invertible block J in degree i→i+1, C is chain isomorphic to a direct sum N⊕Disk(J,i), where Disk has identity differential, N is complete flat, and the degree-i differential of N has residual zero on the retained complement.

**Construction or proof.** After the block diagonal change from complete-flat-morphism-splitting, d²=0 forces adjacent differentials to avoid the invertible block. Projecting it out is a chain map, and the inverse identity block defines the contracting homotopy of the disk. This argument uses the block decomposition directly; the accepted rank-one unit-pivot calculation supplies the sign convention, not an infinite iteration of finite pivots.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-complex`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-morphism-splitting`, `DeformationAndDerivedPatchingAlgebra:P7/unit-pivot-cancellation`.

**Acceptance.** The canceled block may have infinite topological rank.

**Source.** [Pilloni20, Proof of Proposition 2.3.1, cancellation step](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 73. Minimal complete flat representative with a chain deformation retract

**Construction:** `TauCeti.DerivedCoefficient.completeFlatMinimalModel`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model`.

For bounded complete flat C over R, construct noncanonically a complete flat complex N in the same term interval, with every differential zero modulo m, chain maps i:N→C and s:C→N satisfying i followed by s=id_N, and a chain homotopy from s followed by i to id_C. Thus both maps are quasi-isomorphisms. The construction chooses topological residue bases.

**Construction or proof.** Cancel invertible blocks in ascending order through the finite support interval. Later cancellation does not destroy the residual-zero property already achieved: it restricts a residual-zero adjacent differential and conjugates by invertible changes of basis. Compose the finitely many deformation retracts.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-complex`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-disk-cancellation`.

**Uses.** Pilloni20, Proposition 2.2.1: Finite residue cohomology bounds the rank of each minimal term. Pilloni20, Proposition 2.3.1: Transfer an individual represented endomorphism along i,s; multiplication requires the distinct homotopy comparison below.

**API.**

- `TauCeti.DerivedCoefficient.completeFlatMinimalModel.retract` (data): The chosen i,s are chain maps with i followed by s=id_N.
- `TauCeti.DerivedCoefficient.completeFlatMinimalModel.homotopy` (data): The chosen s followed by i is homotopic to id_C.
- `TauCeti.DerivedCoefficient.completeFlatMinimalModel.residue` (characterisation): N^j/mN^j identifies with H^j(C tensor_R κ), since the differential of N tensor κ is zero. Promoted declaration: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-residue`.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_complete_minimal_zero` (degenerate): Zero admits zero as the chosen minimal representative with identity retract.
- `TauCeti.DerivedCoefficient.test_complete_minimal_unit_disk` (computation): A complete flat identity disk contracts to the zero minimal complex.
- `TauCeti.DerivedCoefficient.test_complete_minimal_uniformizer` (computation): Over a complete DVR the finite free complex O --π→ O in degrees −1,0 is already residual-minimal and retains both nonzero terms.

**Acceptance.** No finite-dimensional residue cohomology is required to construct N.

**Source.** [Pilloni20, Proof of Proposition 2.3.1, minimal subcomplex claim](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 74. Finite residue cohomology forces complete flat perfectness

**Theorem:** `TauCeti.DerivedCoefficient.complete_flat_residual_perfect`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-residual-perfect`.

If complete flat C is supported in [a,b] and H^i(C tensor_R κ) is finite-dimensional for all i, Q(C) is perfect and has a finite free representative supported in [a,b].

**Construction or proof.** The minimal representative N has N^i/mN^i≅H^i(C tensor κ). The requested topological-basis theorem identifies each N^i with a completed direct sum indexed by a finite basis. Completeness of R makes this finite completion equal to a finite free R-module. N is therefore the required perfect model with the original bounds.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model`, `PadicMeasuresIwasawaAlgebras:L0`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-bounded-above-flat`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-residue`.

**Acceptance.** Finite-dimensionality is a hypothesis on derived residue cohomology; termwise residue modules may be infinite.

**Source.** [Pilloni20, Proposition 2.2.1](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 75. Residual acyclicity of a complete flat complex

**Lemma:** `TauCeti.DerivedCoefficient.complete_flat_residual_acyclic`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-residual-acyclic`.

If C is complete flat and C tensor_R κ is acyclic, C is contractible and in particular acyclic.

**Construction or proof.** The minimal model has zero residue in every term. Its topological-basis index set is empty, hence every term is zero. Its deformation retract provides a contraction of C.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model`, `PadicMeasuresIwasawaAlgebras:L0`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-residue`.

**Acceptance.** Boundedness and complete flatness are both retained.

**Source.** [Pilloni20, Proposition 2.2.2, cone argument](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 76. Residual quasi-isomorphisms detect complete flat quasi-isomorphisms

**Theorem:** `TauCeti.DerivedCoefficient.complete_flat_residual_quasiiso`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-residual-quasiiso`.

For a chain map f:C→D between complete flat complexes, if f tensor κ is a quasi-isomorphism, f is a quasi-isomorphism.

**Construction or proof.** The cone of f is complete flat. Its residue cone is acyclic by the residual quasi-isomorphism hypothesis; complete-flat-residual-acyclic and the cone criterion imply f is a quasi-isomorphism.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-complex`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-residual-acyclic`, `mathlib:CochainComplex.mappingCone`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-cone`.

**Acceptance.** The residue test is derived because the complete flat models are K-flat.

**Source.** [Pilloni20, Proposition 2.2.2](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 77. Transfer of chain endomorphisms preserves composition up to homotopy

**Lemma:** `TauCeti.DerivedCoefficient.complete_flat_transfer_composition`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-transfer-composition`.

For the chosen deformation retract i:N→C,s:C→N, transfer t to i followed by t followed by s. The transfers of t and u compose homotopically to the transfer of t followed by u. Consequently the maps induced on N in the homotopy and derived categories form a ring homomorphism from End(C).

**Construction or proof.** Insert the homotopy between s followed by i and id_C between t and u and compose it with i,t,u,s. Additivity and the identity follow from linearity and the strict retract equation.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model`.

**Acceptance.** The transferred chain endomorphisms need not give a strict chain ring action.

**Source.** [Pilloni20, Proposition 2.3.1, represented endomorphism transfer](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 78. Degree-zero dual of a nonnegative perfect model

**Comparison:** `TauCeti.DerivedCoefficient.dual_degree_zero_cokernel`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-degree-zero-cokernel`.

For a finite projective complex P supported in [0,l], H^0(perfectDual(QP)) is naturally coker((d^0)^*:Dual(P^1)→Dual(P^0)). For every ring map R→B its ordinary scalar extension identifies with the analogous cokernel of the termwise B-dual of B tensor_R P.

**Construction or proof.** The dual has no positive terms, so its H^0 is its degree-zero cokernel. Tensor is right exact, and finite-projective dual base change identifies the two terms and their differential.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-hom-projective-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-basechange`.

**Acceptance.** A lower bound on cohomology alone does not supply this presentation.

**Source.** [BCGP21, Lemma 7.8.5, proof](https://arxiv.org/pdf/1812.09269).

### 79. Field specialization of degree-zero perfect duals

**Theorem:** `TauCeti.DerivedCoefficient.dual_degree_zero_field`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-degree-zero-field`.

For finite projective P supported in [0,l] and any ring map R→F to a field, H^0(perfectDual(QP)) tensor_R F is naturally Dual_F(H^0(derivedExtension(R→F)(QP))). In particular this supplies the k and E cases of BCGP21 Lemma 7.8.5.

**Construction or proof.** Over a field, dualization is exact; the cokernel of the transposed first differential is the dual of its kernel. Apply dual-degree-zero-cokernel.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-degree-zero-cokernel`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`.

**Acceptance.** Over a complete DVR, replacing F by O in this conclusion is false in general.

**Source.** [BCGP21, Lemma 7.8.5(1)–(2)](https://arxiv.org/pdf/1812.09269).

### 80. Pontryagin duality turns a finite free kernel into an adjoint cokernel

**Comparison:** `TauCeti.DerivedCoefficient.dvr_pontryagin_adjoint`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dvr-pontryagin-adjoint`.

For complete DVR O with fraction field E, finite free O-modules M,N and φ:M→N, the continuous O-linear E/O-dual of φ tensor E/O is its O-linear adjoint Dual_O(N)→Dual_O(M). The continuous E/O-dual of ker(φ tensor E/O) is coker(φ^*). Use CC.3 normalization to compare this with the Z_p Pontryagin dual, including its character or codifferent twist.

**Construction or proof.** Import CC.3 exact duality, End_O(E/O)≅O and finite free evaluation. Compute on a finite basis to identify the dual map with the adjoint; exact contravariant duality identifies the kernel dual with the cokernel.

**Prerequisites.** `CompletedCohomologyPartII:CC.3`.

**Acceptance.** The bare Hom_O(H^0(P),O) is not substituted for the E/O-kernel dual.

**Source.** [BCGP21, Lemma 7.8.6](https://arxiv.org/pdf/1812.09269).

### 81. Integral specialization via E/O coefficient cohomology

**Theorem:** `TauCeti.DerivedCoefficient.dual_degree_zero_dvr`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-degree-zero-dvr`.

Let O be a complete DVR with fraction field E, R an O-algebra and P a finite projective R-complex supported in [0,l]. For an O-algebra map R→O, H^0(perfectDual(QP)) tensor_R O identifies with the continuous O-linear E/O-dual of H^0(P tensor_R E/O), with the CC.3 normalization for a Pontryagin interpretation.

**Construction or proof.** The specialized terms are finite projective over local O and hence finite free. The degree-zero E/O-cohomology is the kernel of its first differential. Apply dvr-pontryagin-adjoint and the cokernel presentation.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dual-degree-zero-cokernel`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dvr-pontryagin-adjoint`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`.

**Acceptance.** For P=[O --π→ O] in degrees 0,1 the left side is O/π; the E/O-kernel dual gives O/π, whereas Dual_O(H^0(P)) is zero.

**Source.** [BCGP21, Lemma 7.8.5(3) and Remark 7.8.7](https://arxiv.org/pdf/1812.09269).

### 82. Finite modules over a complete Noetherian ring are complete

**Comparison:** `TauCeti.DerivedCoefficient.finite_module_complete`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-module-complete`.

For a Noetherian commutative ring R, ideal I, I-adically complete R and finite R-module M, M is I-adically complete and its canonical map to native AdicCompletion I M is a linear equivalence.

**Construction or proof.** The native equivalence identifies completion of M with completion of R tensor M. Completeness of R identifies this with R tensor M≅M. The generator formula for the completion-tensor equivalence makes this equivalence the canonical map; native of_bijective_iff proves completeness.

**Prerequisites.** `mathlib:AdicCompletion.ofLinearEquiv`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `mathlib:IsAdicComplete`, `mathlib:AdicCompletion.of_bijective_iff`.

**Acceptance.** No claim is made that an infinite direct sum of complete modules is complete.

**Source.** [091N, Lemma 15.93.8, finite case; native completion-tensor equivalence](https://stacks.math.columbia.edu/tag/091N).

### 83. The strict finite coefficient quotient tower

**Construction:** `TauCeti.DerivedCoefficient.coefficientQuotientTower`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-quotient-tower`.

For a commutative ring R, ideal I and integer cochain complex C, coefficientQuotientTower(C,I) is the functor N^op→CochainComplex(ModuleCat R,Z) with level n equal to C/I^(n+1)C termwise. The differential is induced by d_C; the transition from m to n for n≤m is the canonical quotient map. Each level retains its R/I^(n+1)-module structure, although the common tower category uses restriction to R.

**Construction or proof.** R-linearity makes the differential preserve I^(n+1)C. Ideal-power inclusion induces transitions. Quotient-map identities give functor laws.

**Prerequisites.** `mathlib:AdicCompletion`, `mathlib:ModuleCat.extendScalars`.

**Uses.** P7 finite coefficients before inverse limits: Retain strict reductions, chain maps and homotopies. BCGP25 §7.2, augmentation/action hypotheses: Provide the coefficient-only specialization of a compatible finite quotient system.

**API.**

- `TauCeti.DerivedCoefficient.coefficientQuotientTower_projection` (data): The projections C→C/I^(n+1)C are chain maps compatible with every transition.
- `TauCeti.DerivedCoefficient.coefficientQuotientTower_transition` (simp): On a class of x, the transition sends the class modulo I^(m+1) to the class modulo I^(n+1).
- `TauCeti.DerivedCoefficient.coefficientQuotientTower_surjective` (characterisation): Every term of every transition is surjective.
- `TauCeti.DerivedCoefficient.coefficientQuotientTower_map` (functoriality): A chain map C→D induces a natural transformation of quotient towers, preserving identity and composition.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_quotient_tower_zero` (degenerate): The quotient tower of the zero complex is the zero diagram.
- `TauCeti.DerivedCoefficient.test_quotient_tower_stalk` (computation): For C=R[0], level n is (R/I^(n+1))[0] with the canonical reductions.
- `TauCeti.DerivedCoefficient.test_quotient_tower_nonflat` (non-example): Over Z and I=(2), the ordinary quotient tower of (Z/2)[0] has no negative homology, whereas its derived coefficient extension to Z/2 has H^−1≅Z/2. The tower alone does not compute arbitrary derived extension.

**Acceptance.** The exponent starts at n+1, avoiding the zero quotient R/I^0.

**Source.** [0922, Proposition 15.96.2, coefficient inverse system](https://stacks.math.columbia.edu/tag/0922).

### 84. K-flat quotient levels compute derived coefficients

**Comparison:** `TauCeti.DerivedCoefficient.quotient_tower_derived_comparison`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-quotient-tower-derived-comparison`.

For K-flat C, level n of coefficientQuotientTower(C,I), viewed as an R/I^(n+1)-complex, represents derivedExtension(R→R/I^(n+1))(Q_R C). The comparisons commute with quotient transitions after scalar restriction to R.

**Construction or proof.** The standard tensor-quotient isomorphism identifies (R/I^(n+1)) tensor C with C/I^(n+1)C. Apply the K-flat representative comparison; its naturality identifies transitions.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-quotient-tower`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`.

**Acceptance.** Apply to a finite projective model, rather than to the cohomology modules of that model.

**Source.** [0922, Proposition 15.96.2, derived coefficient terms](https://stacks.math.columbia.edu/tag/0922).

### 85. Chain homotopies survive every coefficient quotient

**Lemma:** `TauCeti.DerivedCoefficient.quotient_tower_homotopy`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-quotient-tower-homotopy`.

For chain maps f,g:C→D and a native chain homotopy f∼g, quotienting its component maps induces a chain homotopy of the two quotient maps at every level, compatible with all transitions.

**Construction or proof.** Pass each linear homotopy component to its quotient; the homotopy equation passes to classes. For the same class representatives both orders of reduction agree, proving compatibility.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-quotient-tower`.

**Acceptance.** Equalities of cohomology maps are insufficient input for this declaration.

**Source.** [0922, Proposition 15.96.2, functorial coefficient terms](https://stacks.math.columbia.edu/tag/0922).

### 86. A complete finite complex equals the strict quotient limit

**Comparison:** `TauCeti.DerivedCoefficient.coefficient_complex_limit`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-complex-limit`.

For a bounded complex C of finite modules over an I-adically complete Noetherian R, the canonical chain map C→lim_n coefficientQuotientTower(C,I)_n is a chain isomorphism, natural in chain maps.

**Construction or proof.** Limits of module complexes are degreewise. In every degree the limit is the native completion, up to the cofinal omission of exponent zero. finite-module-complete and the coordinate formula give the termwise equivalence; differential naturality makes it a chain isomorphism.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-quotient-tower`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-module-complete`, `mathlib:AdicCompletion.ofLinearEquiv`.

**Acceptance.** The isomorphism is a statement about complexes, before taking cohomology.

**Source.** [0922, Proposition 15.96.2, complete finite-module realization](https://stacks.math.columbia.edu/tag/0922).

### 87. Surjective strict coefficient towers compute derived limits

**Comparison:** `TauCeti.DerivedCoefficient.surjective_tower_derived_limit`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-surjective-tower-derived-limit`.

For an inverse tower C_n of R-module cochain complexes with surjective transitions in every degree, Q_R(lim_n C_n) identifies naturally with the CC.2 derived inverse limit of Q_R(C_n). In particular this applies to coefficientQuotientTower(C,I).

**Construction or proof.** Import the native-module realization of the derived inverse limit from CC.2. Exact module products and degreewise surjectivity make 1−shift on the degreewise product complexes surjective; its kernel is the strict limit. The resulting short exact sequence identifies the kernel complex with the shifted cone defining the supplier derived limit. The R-linear comparison with the R02.1 additive-group model is recorded as a refinement gap.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-quotient-tower`, `CompletedCohomologyPartII:CC.2`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`.

**Acceptance.** Surjectivity on terms does not imply surjectivity on cohomology transitions.

**Source.** [0BKN, Lemma 20.37.1, module specialization and surjective complex comparison](https://stacks.math.columbia.edu/tag/0BKN).

### 88. The R-linear Milnor sequence of a strict surjective tower

**Comparison:** `TauCeti.DerivedCoefficient.module_tower_milnor`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-module-tower-milnor`.

For a termwise-surjective countable tower C_n of R-complexes, there is a natural short exact sequence of R-modules 0→lim^1 H^(j−1)(C_n)→H^j(lim C_n)→lim H^j(C_n)→0. The lim and lim^1 terms use the kernel and cokernel of 1−shift on module products, agreeing after forgetting with R02.1.

**Construction or proof.** Use the supplier Milnor sequence and its product kernel-cokernel construction. Every map is R-linear, so retain the module structure; naturality of the comparison identifies the middle with homology of the strict limit. The module upgrade is the same recorded refinement as surjective-tower-derived-limit.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-surjective-tower-derived-limit`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`, `ArithmeticGaloisDuality:R02.1/lim-one`.

**Acceptance.** The first term is retained unless an independent Mittag–Leffler argument kills it.

**Source.** [0BKN, Lemma 20.37.1 and displayed short exact sequence](https://stacks.math.columbia.edu/tag/0BKN).

### 89. Finite length coefficient cohomology gives Mittag–Leffler

**Lemma:** `TauCeti.DerivedCoefficient.finite_length_cohomology_ml`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-length-cohomology-ml`.

If a tower of R-modules has finite-length terms, then for each level n the images from all later levels stabilize. Thus it is Mittag–Leffler and its lim^1 is zero.

**Construction or proof.** The images into a fixed finite-length term form a descending chain of submodules; the descending chain condition stabilizes them. Apply the imported ML vanishing theorem through its R-linear product model.

**Prerequisites.** `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`, `ArithmeticGaloisDuality:R02.1/lim-one`.

**Acceptance.** No surjectivity of the transition maps is required.

**Source.** [0BKN, Lemma 20.37.1, lim-one vanishing application](https://stacks.math.columbia.edu/tag/0BKN).

### 90. Cohomology commutes with perfect finite local coefficient limits

**Theorem:** `TauCeti.DerivedCoefficient.perfect_coefficient_cohomology_limit`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-coefficient-cohomology-limit`.

Let R be complete Noetherian local with maximal ideal m and C a bounded finite projective R-complex. For every j, H^j(C) identifies naturally with lim_n H^j(C/m^(n+1)C), and lim^1 of the preceding-degree homology tower is zero.

**Construction or proof.** Each quotient term is finite over the Artinian local ring R/m^(n+1), hence its homology has finite length over R. Apply finite-length-cohomology-ml, remove the first term of module-tower-milnor, and use coefficient-complex-limit.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-complex-limit`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-module-tower-milnor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-finite-length-cohomology-ml`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `mathlib:isArtinianRing_iff_isNilpotent_maximalIdeal`, `mathlib:isArtinian_of_fg_of_artinian'`.

**Acceptance.** This conclusion is not asserted for arbitrary completed-cohomology complexes with infinite coefficient terms.

**Source.** [0922, Proposition 15.96.2, complete perfect specialization](https://stacks.math.columbia.edu/tag/0922).

### 91. Native perfect complexes compare with generic derived completion

**Comparison:** `TauCeti.DerivedCoefficient.perfect_derived_completion_comparison`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-derived-completion-comparison`.

For Noetherian R, ideal I and perfect X, the DD.1 derived completion of X is naturally isomorphic to the CC.2 derived limit of its derived coefficient objects X tensor_R^L R/I^(n+1). If R is I-adically complete, the completion unit X→completion_I(X) is an isomorphism.

**Construction or proof.** Import DD.1 Noetherian ideal-power comparison; it owns the Koszul/pro-object proof. Compute all finite coefficient objects on a bounded finite projective model, then use the strict surjective tower comparison. Over complete R, the finite-module completion isomorphism identifies the unit with the identity model map.

**Prerequisites.** `DerivedDeRhamCohomology:DD.1`, `CompletedCohomologyPartII:CC.2`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-quotient-tower-derived-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-surjective-tower-derived-limit`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-complex-limit`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`.

**Acceptance.** The ideal-power formula is restricted to Noetherian R; a merely finitely generated ideal does not justify it.

**Source.** [0922, Proposition 15.96.2](https://stacks.math.columbia.edu/tag/0922).

### 92. Derived Nakayama with its completeness and finiteness boundary

**Comparison:** `TauCeti.DerivedCoefficient.complete_pseudo_derived_nakayama`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-pseudo-derived-nakayama`.

For complete Noetherian local R and pseudo-coherent X, X is derived m-complete and derivedExtension(R→κ)(X)=0 implies X=0. For a map between such objects, an isomorphism after derived residue extension implies the original map is an isomorphism.

**Construction or proof.** Import DD.1 identification of derived completeness by the localization-Hom criterion and closure under triangles. The bounded above finite free model of a pseudo-coherent object over complete R gives completeness as in Lemma 15.93.8. The accepted residual Nakayama theorem proves object detection; apply it to the cone for map detection.

**Prerequisites.** `DerivedDeRhamCohomology:DD.1`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-extension`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-triangle`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-residual-nakayama`.

**Acceptance.** An arbitrary noncomplete object can have zero residue: the fraction field stalk over a DVR is the counterexample.

**Source.** [091N, Lemmas 15.93.8 and 15.93.20, local specialization](https://stacks.math.columbia.edu/tag/091N).

### 93. Compatible strict chain actions on a coefficient tower

**Definition:** `TauCeti.DerivedCoefficient.StrictTowerAction`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-strict-tower-action`.

For a unital ring T and a strict tower C:N^op→CochainComplex(ModuleCat R,Z), StrictTowerAction(T,C) is a family of unital ring homomorphisms T→End(C_n), where End uses actual chain maps, such that every transition commutes with the action of every t. The action need not be central or commutative. No topology on T is part of this algebraic object.

**Construction or proof.** Use the native endomorphism rings in the preadditive complex category. Store the commuting equations at all tower arrows; linearity is already part of each chain endomorphism.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-quotient-tower`.

**Uses.** P7 requirement that Hecke actions survive coefficient limits: Supply strict compatible chain data from arithmetic owners. BCGP25 §7.2 action/augmentation diagrams: Require chain compatibility before taking limits; the Hecke operators themselves remain IHG.2.

**API.**

- `TauCeti.DerivedCoefficient.StrictTowerAction.ext` (extensionality): Actions agree if their chain endomorphisms agree at every level and every t.
- `TauCeti.DerivedCoefficient.StrictTowerAction.restrict` (functoriality): A ring homomorphism U→T restricts a T-action to a U-action.
- `TauCeti.DerivedCoefficient.StrictTowerAction.quotient` (constructor): A strict chain T-action on C induces the compatible action on coefficientQuotientTower(C,I).
- `TauCeti.DerivedCoefficient.StrictTowerAction.limit` (functoriality): The compatible chain maps induce a unital ring action on the strict limit complex. Promoted declaration: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-strict-action-limit`.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_action_zero_complex` (degenerate): The zero tower has its unique unital T-action through its zero endomorphism ring.
- `TauCeti.DerivedCoefficient.test_action_scalar_quotients` (compatibility): Scalar multiplication gives the canonical R-action on every quotient tower and reduces to the usual quotient scalar action.
- `TauCeti.DerivedCoefficient.test_action_incompatible_levels` (non-example): On the constant degree-zero Q-vector-space tower with identity transitions, the two Q[x]-actions x↦0 at level 0 and x↦1 at level 1 fail the required commuting equation.

**Acceptance.** A family of actions on H^*(C_n) alone does not instantiate this definition.

**Source.** [BCGP25, §7.2, compatible finite-quotient ring actions](https://arxiv.org/pdf/2502.20645v1).

### 94. Compatible actions act on the Milnor sequence

**Lemma:** `TauCeti.DerivedCoefficient.strict_action_limit_milnor`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-strict-action-limit-milnor`.

For a termwise-surjective tower with a StrictTowerAction of T, the strict limit carries the induced unital ring action by chain maps, and the R-linear Milnor short exact sequence is T-equivariant in every degree.

**Construction or proof.** The limit universal property defines each chain action. Its uniqueness proves the ring laws. The product 1−shift commutes with the action, so its kernel-cokernel sequence and all homology maps are equivariant.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-strict-tower-action`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-module-tower-milnor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-strict-action-limit`.

**Acceptance.** Continuity and Hecke localization are supplied by CC.2 and IHG.2, respectively.

**Source.** [BCGP25, §7.2 ring action compatibility; Stacks 0BKN Milnor naturality](https://arxiv.org/pdf/2502.20645v1).

### 95. Compatible chain homotopies pass to the strict limit

**Lemma:** `TauCeti.DerivedCoefficient.homotopy_system_limit`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-homotopy-system-limit`.

For maps of strict towers f,g:C→D and degreewise homotopy components h_n from f_n to g_n that commute with every transition, the componentwise limit gives a native chain homotopy lim f∼lim g.

**Construction or proof.** Take limits of the homotopy components and pass the additive homotopy equations through the limit projections. Joint monicity of the projections proves the equation in the limit complex.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-quotient-tower-homotopy`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-complex-limit`.

**Acceptance.** Choosing unrelated homotopies separately at each level is not sufficient.

**Source.** [0922, Proposition 15.96.2, functorial model comparison](https://stacks.math.columbia.edu/tag/0922).

### 96. Finite diagonals in the coefficient double complex

**Lemma:** `TauCeti.DerivedCoefficient.tensor_finite_diagonals`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-finite-diagonals`.

If C is strictly zero above b and P is a projective cochain resolution of a module B, strictly zero above 0, the double complex D^(p,q)=C^q tensor_R P^p has only finitely many potentially nonzero terms on every total-degree diagonal p+q=n: n−b≤p≤0 and n≤q≤b. Its direct-sum total computes derivedTensor(QC,B[0]).

**Construction or proof.** The strict bounds give the indicated finite integer interval. P is K-flat, so tensor-representative-comparison identifies the total with derived tensor; the swap between the p-first filtration and the native C-first tensor uses the signed native braid.

**Prerequisites.** `mathlib:HomologicalComplex.tensorObj`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-representative-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-bounded-above-projective`.

**Acceptance.** This finite-diagonal argument does not apply to two unrestricted unbounded complexes.

**Source.** [061Y, Example 15.63.1 and Example 15.63.4](https://stacks.math.columbia.edu/tag/061Y).

### 97. Native Tor coefficient spectral sequence

**Construction:** `TauCeti.DerivedCoefficient.coefficientSpectralSequence`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-sequence`.

For a complex C strictly zero above b and an R-module B, construct a native E₂ cohomological spectral sequence E with E₂^(p,q)=Tor_(−p)^R(H^q(C),B) for p≤0, zero for p>0, differential d_r:E_r^(p,q)→E_r^(p+r,q−r+1), and naturality for chain maps and module maps. This construction is the filtered coefficient double complex, not a declaration asserting arbitrary pages have an abutment.

**Construction or proof.** Resolve B projectively in nonpositive cochain degrees and filter the signed total of C^q tensor P^p by p. Compute the first vertical homology using flatness of P^p, then horizontal homology using its projective resolution of B. Store the page-homology isomorphisms in the native SpectralSequence structure. Lift B-maps to resolutions and use homotopy independence to obtain natural maps of pages. The filtered-complex page construction and lift-independence adapters are recorded refinement gaps.

**Prerequisites.** `mathlib:CategoryTheory.E₂CohomologicalSpectralSequence`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-finite-diagonals`, `mathlib:CategoryTheory.Tor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-stalk-comparison`.

**Uses.** P7 displayed Tor_i(H^j(C),B) spectral sequence: Make both native pages and actual convergence explicit. P8 coefficient/support calculations: Transport coefficient maps and strict endomorphisms through each page and the abutment filtration.

**API.**

- `TauCeti.DerivedCoefficient.coefficientSpectralSequence_E2` (characterisation): For p≤0, the degree-(p,q) term of page two is naturally isomorphic to native Tor_(-p)(H^q(C),B). Promoted declaration: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-E2`.
- `TauCeti.DerivedCoefficient.coefficientSpectralSequence_map` (functoriality): A chain map and a module map give a morphism of native spectral sequences, compatible with their page homology isomorphisms.
- `TauCeti.DerivedCoefficient.coefficientSpectralSequence_map_id` (functoriality): Identity maps give the identity spectral-sequence morphism.
- `TauCeti.DerivedCoefficient.coefficientSpectralSequence_map_comp` (functoriality): Composition gives composition on every page.

**Unit tests.**

- `TauCeti.DerivedCoefficient.test_spectral_free_stalk` (degenerate): For C=R[0], page two has only E₂^(0,0)=B, and the abutment is B in degree zero.
- `TauCeti.DerivedCoefficient.test_spectral_torsion_stalk` (computation): For C=(Z/2)[0] over Z and B=Z/2, page two has Z/2 in bidegrees (−1,0),(0,0), survives to infinity, and abuts to homology in degrees −1,0.
- `TauCeti.DerivedCoefficient.test_spectral_uniformizer_complex` (compatibility): For C=[Z --2→ Z] in degrees −1,0 and B=Z/2, the same two page-two terms agree with the two nonzero homology groups of the zero-differential residue complex.

**Acceptance.** On Tor_i(H^j(C),B), the total degree is j−i, with p=−i and q=j.

**Source.** [061Y, Examples 15.63.1 and 15.63.4](https://stacks.math.columbia.edu/tag/061Y).

### 98. Finite separated exhaustive coefficient abutment filtration

**Theorem:** `TauCeti.DerivedCoefficient.coefficient_spectral_convergence`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-convergence`.

For coefficientSpectralSequence(C,B,b), every total degree n has a decreasing filtration F^p on the actual module H^n(derivedTensor(QC,B[0])), with F^p=H^n for p≤n−b and F^p=0 for p>0. Its successive quotients F^p/F^(p+1) are naturally isomorphic to the stable page term E_∞^(p,n−p). All terms on that diagonal stabilize by any page r≥max(2,b−n+2). Thus the filtration is finite, separated and exhaustive and the sequence strongly converges.

**Construction or proof.** The filtered total has a finite filtration in degrees n and its adjacent degrees. The cycles/boundaries spectral construction identifies stable page terms with graded pieces of the induced homology filtration. Since p≤0 and q≤b, every incoming or outgoing differential on the fixed diagonal is zero once r≥max(2,b−n+2). The finite-filtration cycles/boundaries identification and naturality are recorded as a precise refinement gap; page data alone do not establish it.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-sequence`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-finite-diagonals`, `mathlib:DerivedCategory.homologyFunctor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-E2`.

**Acceptance.** No infinite-product totalization or conditional convergence is substituted.

**Source.** [061Y, Example 15.63.1 and its reference to Homology Lemma 12.25.3](https://stacks.math.columbia.edu/tag/061Y); [0132, Lemma 12.25.3](https://stacks.math.columbia.edu/tag/0132); [012W, Lemma 12.24.11](https://stacks.math.columbia.edu/tag/012W).

### 99. Flat coefficient degeneration

**Comparison:** `TauCeti.DerivedCoefficient.coefficient_spectral_flat`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-flat`.

If B is flat over R, the coefficient spectral sequence has only p=0 on page two, all higher differentials vanish, and its edge isomorphism is H^n(derivedTensor(QC,B[0]))≅H^n(C) tensor_R B.

**Construction or proof.** Flat tensor makes positive Tor vanish. The finite abutment filtration has a single graded piece, identified with the native degree-zero tensor term, giving the stated edge isomorphism.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-sequence`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-convergence`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-flat-criterion`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-balanced`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-E2`.

**Acceptance.** For nonflat B, the negative p columns are retained.

**Source.** [061Y, Example 15.63.1, flat coefficient case](https://stacks.math.columbia.edu/tag/061Y).

### 100. Strict chain actions respect pages and the abutment filtration

**Lemma:** `TauCeti.DerivedCoefficient.coefficient_spectral_actions`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-actions`.

A unital ring T acting by chain endomorphisms on C acts on every page of coefficientSpectralSequence(C,B,b), commutes with all page differentials, and preserves the finite abutment filtration. For a strict coefficient tower whose maps commute with T, these actions are compatible with the coefficient transition spectral-sequence maps.

**Construction or proof.** Apply spectral-sequence naturality to each chain endomorphism and identity of B. Identity/composition and additivity yield the ring laws. The filtered-total maps give compatibility with the homology filtration; the tower commuting equations give transition compatibility.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-sequence`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-convergence`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-strict-tower-action`.

**Acceptance.** An action specified only on H^*(C) is not a strict chain action for this declaration.

**Source.** [061Y, Example 15.63.1, functorial double-complex construction](https://stacks.math.columbia.edu/tag/061Y).

### 101. Shift rule for Tor-amplitude

**Lemma:** `TauCeti.DerivedCoefficient.HasTorAmplitude.shift`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude-shift`.

If X has Tor-amplitude [a,b], then X[n] has Tor-amplitude [a−n,b−n] for every integer n.

**Construction or proof.** The exact tensor shift comparison and H^i(X[n])=H^(i+n)(X) give the interval after subtraction of n.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-amplitude`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tensor-exact`, `mathlib:DerivedCategory.homologyFunctor`.

**Acceptance.** The shift direction is cohomological.

**Source.** [0651, Definition 15.68.1 and shift convention](https://stacks.math.columbia.edu/tag/0651).

### 102. Shift rule for finite-order pseudo-coherence

**Lemma:** `TauCeti.DerivedCoefficient.IsMPseudoCoherent.shift`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-shift`.

If X is m-pseudo-coherent, X[n] is (m−n)-pseudo-coherent for every integer n.

**Construction or proof.** Shift the bounded finite free approximation and its actual derived map. The same homology comparison gives isomorphisms above m−n and an epimorphism in degree m−n.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-pseudo-finite-order`, `mathlib:DerivedCategory.homologyFunctor`.

**Acceptance.** X[−1] has order m+1.

**Source.** [064Q, Definition 15.66.1](https://stacks.math.columbia.edu/tag/064Q).

### 103. Complete flat complexes are closed under cones

**Lemma:** `TauCeti.DerivedCoefficient.IsCompleteFlatComplex.cone`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-cone`.

The native mapping cone of a chain map between complete flat complexes is complete flat.

**Construction or proof.** Each cone term is a finite direct sum of a target term and a shifted source term. Flatness and adic completeness are preserved by finite direct sums, and the two finite support intervals give a finite support interval for the cone. The finite direct-sum completeness comparison follows by the coordinate-wise completion universal property.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-complex`, `mathlib:CochainComplex.mappingCone`.

**Acceptance.** Finite direct sums are used even when each term has infinite rank.

**Source.** [Pilloni20, §2.2, C_flat(R) and cones in Proposition 2.2.2](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 104. Complete flat complexes compute derived tensor

**Lemma:** `TauCeti.DerivedCoefficient.IsCompleteFlatComplex.kflat`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-kflat`.

Every complete flat complex is K-flat.

**Construction or proof.** Its finite support supplies an upper bound and its terms are flat. Apply kflat-bounded-above-flat.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-complex`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-bounded-above-flat`.

**Acceptance.** Completeness is not needed for K-flatness, but is part of the source object.

**Source.** [Pilloni20, §2.2, C_flat(R) tensor computations](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 105. Residue terms of the complete flat minimal model

**Comparison:** `TauCeti.DerivedCoefficient.completeFlatMinimalModel.residue`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-residue`.

For the complete-flat-minimal-model N of C, there is a natural module isomorphism N^j/mN^j≅H^j(C tensor κ), because N tensor κ has zero differential and its retract maps are homotopy equivalences.

**Construction or proof.** Tensor the displayed chain deformation retract with κ. Its homotopy identities survive scalar extension. The zero-differential homology of N tensor κ is its degree-j term.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-kflat`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-quotient-tower-homotopy`.

**Acceptance.** The isomorphism uses the whole chosen retract; no uniqueness of topological bases is asserted.

**Source.** [Pilloni20, Proposition 2.3.1, residue cohomology identification](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

### 106. The signed representative of a perfect dual

**Comparison:** `TauCeti.DerivedCoefficient.perfectDual_model`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual-model`.

For bounded finite projective P, perfectDual(QP) is represented by the complex with degree n equal to Dual_R(P^−n) and differential (−1)^(n+1)(d_P^(−n−1))^*. This is naturally isomorphic to the native linearHomComplex(P,R[0]).

**Construction or proof.** In the native product Hom complex only maps P^−n→R survive. Its differential is −(−1)^n times precomposition by d_P, giving the stated sign. The component identifications commute with every differential.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`, `tauceti:TauCeti.linearHomComplex`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-hom-projective-comparison`.

**Acceptance.** The differential is not the unsigned termwise transpose.

**Source.** [0656, Lemma 15.76.15, dual complex computation](https://stacks.math.columbia.edu/tag/0656).

### 107. Identify the native coefficient page two

**Comparison:** `TauCeti.DerivedCoefficient.coefficientSpectralSequence_E2`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-E2`.

For p≤0, page two of coefficientSpectralSequence(C,B,b) has a natural module isomorphism E₂^(p,q)≅Tor_(−p)(H^q(C),B), and its terms are zero for p>0 or q>b.

**Construction or proof.** The construction uses a projective resolution of B. Its flat terms commute with vertical cohomology, and the remaining resolution differential computes the native second-variable Tor. The source cohomology vanishes above b; the resolution has no positive cochain terms.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-sequence`, `mathlib:CategoryTheory.Tor`.

**Acceptance.** The native Tor index is the natural number −p.

**Source.** [061Y, Example 15.63.1](https://stacks.math.columbia.edu/tag/061Y).

### 108. The strict limit carries the compatible chain action

**Lemma:** `TauCeti.DerivedCoefficient.StrictTowerAction.limit`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-strict-action-limit`.

For StrictTowerAction(T,C), there is a unique unital ring homomorphism T→End(lim C) whose composition with each limit projection agrees with the chain action at that level.

**Construction or proof.** Each t gives a natural tower endomorphism. The limit universal property gives its chain endomorphism; joint monicity of limit projections proves addition, multiplication and unit laws and uniqueness.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-strict-tower-action`.

**Acceptance.** This is an action on the complex, rather than only on its cohomology.

**Source.** [BCGP25, §7.2, action compatibility diagrams](https://arxiv.org/pdf/2502.20645v1).

### 109. Invariants of a projective group module are the norm image

**Lemma:** `TauCeti.DerivedCoefficient.projective_group_invariants_norm`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-group-invariants-norm`.

Let G be a finite group, H a subgroup, R a commutative ring and M a finite projective left R[G]-module. Then M^H is the image of the unnormalized operator e_H=sum_(h in H) h. No invertibility of |H| in R is assumed.

**Construction or proof.** Realize M as a retract of a finite free R[G]-module. On the regular module, left H-orbits partition the basis; an invariant vector has constant coefficients on each orbit and is exactly a sum of its orbit norms. The description commutes with the split inclusion/retraction and therefore descends to M.

**Prerequisites.** `mathlib:Representation.invariants`, `mathlib:Representation.asModule`.

**Acceptance.** For R=F_p and G=H=C_p, the regular module has a one-dimensional invariant submodule generated by e_G, even though |G|=0.

**Source.** [BCGP25, Lemma 7.4.11(1)](https://arxiv.org/pdf/2502.20645v1).

### 110. Coset trace generates full invariants

**Lemma:** `TauCeti.DerivedCoefficient.projective_group_coset_trace`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-group-coset-trace`.

Under the same hypotheses, the sum of representatives for left cosets G/H sends M^H onto M^G, and the resulting map is independent of the choices of coset representatives.

**Construction or proof.** The coset sum multiplied by e_H is e_G. Apply projective-group-invariants-norm to H and G. Representatives differing by right multiplication by H have the same action on M^H.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-group-invariants-norm`.

**Acceptance.** Normality of H is not required.

**Source.** [BCGP25, Lemma 7.4.11(2)](https://arxiv.org/pdf/2502.20645v1).

### 111. Projective invariants commute with arbitrary base change

**Comparison:** `TauCeti.DerivedCoefficient.projective_group_invariants_basechange`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-group-invariants-basechange`.

For M finite projective over R[G] and any commutative R-algebra S, the canonical map S tensor_R M^H→(S tensor_R M)^H is an isomorphism, natural in projective group-module maps and algebra maps.

**Construction or proof.** For R[G], the invariant submodule has the orbit-norm basis, so coefficient extension preserves it. Finite sums and retracts give the same result for M. This proof handles a nonflat S; tensor does not preserve arbitrary images without the projective retract argument.

**Prerequisites.** `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-group-invariants-norm`, `mathlib:ModuleCat.extendScalars`, `mathlib:Representation.invariants`.

**Acceptance.** For the trivial F_p[C_p]-module F_p, e_G acts as zero although all vectors are invariant; the projective hypothesis is essential.

**Source.** [BCGP25, Lemma 7.4.11(3)](https://arxiv.org/pdf/2502.20645v1).

### 112. Dual coinvariants are invariant duals

**Comparison:** `TauCeti.DerivedCoefficient.coinvariant_dual_invariant`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coinvariant-dual-invariant`.

For an arbitrary R-representation M of H, precomposition with M→M_H gives a natural linear equivalence Dual_R(M_H)≅(Dual_R M)^H, where the dual carries the native contragredient H-action. No projectivity or finiteness is necessary.

**Construction or proof.** A functional on M is invariant precisely when it kills each h·x−x. The native coinvariant lift gives the inverse; its formula and quotient extensionality prove both inverse identities.

**Prerequisites.** `mathlib:Representation.invariants`, `mathlib:Representation.Coinvariants`, `mathlib:Representation.Coinvariants.lift`, `mathlib:Representation.dual`.

**Acceptance.** The dual is invariant under the inverse group action as specified by Representation.dual.

**Source.** [BCGP25, Lemma 7.4.11(4), first isomorphism](https://arxiv.org/pdf/2502.20645v1).

### 113. Coinvariants of a projective dual equal the dual of invariants

**Comparison:** `TauCeti.DerivedCoefficient.projective_dual_coinvariant`. Node: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-dual-coinvariant`.

For M finite projective over R[G], restriction of functionals descends to a natural linear equivalence (Dual_R M)_H≅Dual_R(M^H). The source here is COINVARIANTS of the dual, not invariants of the dual.

**Construction or proof.** On the regular R[H]-module, coefficient-at-identity functionals form a regular dual basis, coinvariants identify all its translates, and evaluation on e_H is 1. For R[G], decompose into finitely many regular R[H]-summands, and descend through finite sums and projective retracts.

**Prerequisites.** `mathlib:Representation.Coinvariants`, `mathlib:Representation.invariants`, `mathlib:Representation.dual`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-group-invariants-norm`.

**Acceptance.** For M=F_p[C_p], restricting an INVARIANT functional to M^G is multiplication by p=0; that wrong source would make the asserted isomorphism false.

**Source.** [BCGP25, Lemma 7.4.11(4), second isomorphism; rendered PDF p. 172](https://arxiv.org/pdf/2502.20645v1).

## Supplier contracts and ownership

These are requirements recorded for the existing owners, not issues opened by this worker. Terminal-site realization bridges enhanced constructions to native module categories; it does not change ownership of enhancement.

### EnhancedDerivedSheaves:E1

Realize the existing unbounded ringed-site replacement and enhancement nodes on the terminal ringed site with ring R, and identify the realization with native DerivedCategory(ModuleCat R) and its explicit localization. Supply unbounded flat-term K-flat replacements P→C, unbounded K-injective replacements C→J, and a bounded above projective representative zero above b whenever H^i(X)=0 for i>b. Include functorial comparisons and universe hypotheses; these are not finite free replacement claims.

Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-kflat-quasiiso-arbitrary-factor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-flat-representative`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-hom`.

### EnhancedDerivedSheaves:E1

Supply the module-realized enhanced derived tensor/internal Hom with their localization comparison, additive maps, signed exactness and tensor-Hom adjunction. Identify its internal Hom with the native R-linear product Hom complex into a K-injective target. The existing generic tensor node supplies the enhanced tensor direction; P7 constructs the native-module adapters only.

Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-tensor`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-derived-hom`.

### PadicMeasuresIwasawaAlgebras:L0

Extend the topological-basis direction to m-adically complete flat modules over complete Noetherian local commutative rings: any residue basis and lifts induce an isomorphism from the m-adic completion of the FREE DIRECT SUM indexed by that basis. Supply continuous maps via column-null matrices and convergent triangular basis changes. Finite residue rank gives ordinary finite free modules. This extension is recorded as a Part II rescope proposal; the current DVR Banach theorem alone does not supply it.

Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-morphism-splitting`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-residual-perfect`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-residual-acyclic`.

### CompletedCohomologyPartII:CC.3

Supply exact continuous O-linear E/O duality for complete DVR O, finite free evaluation, End_O(E/O)≅O, compact/discrete topology and contragredient maps. Identify with the Z_p Pontryagin dual only after specifying the character or codifferent normalization, and retain opposite ring actions.

Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-dvr-pontryagin-adjoint`.

### CompletedCohomologyPartII:CC.2

Supply a functorial countable derived inverse limit in native D(ModuleCat R), with its product 1−shift shifted-cone model, natural tower maps, and comparison to the R02.1 additive-group Milnor model. P7 uses strict termwise-surjective quotient complexes; CC.2 retains all generic topology, completed cohomology, continuous actions and arbitrary tower machinery.

Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-surjective-tower-derived-limit`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-derived-completion-comparison`.

### DerivedDeRhamCohomology:DD.1

Supply derived I-completeness, the reflective completion functor and its unit in the native module realization. In the Noetherian case identify completion with the derived inverse limit of X tensor^L R/I^(n+1), functorially and compatibly with the unit. Supply the localization-Hom criterion and closure under triangles giving completeness of pseudo-coherent objects over complete R. DD.1 owns the generic Koszul/pro-object and derived Nakayama proof; P7 supplies the local perfect-model comparisons.

Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-derived-completion-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-pseudo-derived-nakayama`.

Affine derived equivalence and the geometric meaning of perfect complexes are imported from SchemeKTheoryOperations:S.1/affine-derived-equivalence and S.1/affine-perfect-comparison. Generic coherent exceptional duality belongs to SchemeAndStackFoundations:SF:key/coherent-duality. Exceptional f! is separate from the module internal Hom used here. R02.1 supplies the accepted additive-group lim-one and Milnor nodes; its termwise-surjective hypothesis is retained.

## Refinement work and closure boundary

1. **Flat-resolution Tor computation and native chain reindexing.** Refine the comparison between the native second-variable left-derived tensor on a projective chain resolution and negative-degree cochain homology. Add the flat-resolution dimension-shifting comparison identifying Tor_1 of coker d^(a−1) with H^(a−1)(C tensor M), with naturality. These are native adapter lemmas, not new definitions of Tor. Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-tor-stalk-comparison`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-amplitude-bottom-syzygy`.

2. **Finite-order triangle lifting and cohomology diagrams.** Add the t-structure orthogonality lifting lemma through an m-approximation for a finite free complex zero below m+1, a strict K-projective lift, and the cone cohomology diagram giving isomorphisms above m and an epimorphism at m. Name their precise native comparison maps. Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-triangle-cone`.

3. **Descending finite free attachments and compatible union.** Refine the cycle-generator attachment to a partial model, finite generation of the residual kernel/cokernel at the new degree, and the degreewise stabilization of the descending union giving one bounded above finite free quasi-isomorphic model. The source and corrected indices are identified; the individual adapter declarations are still required. Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-mpseudo-all-orders-model`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-noetherian-finite-cohomology-pseudo`.

4. **Linear Hom homology versus shifted homotopy morphisms.** Add the R-linear equivalence from H^n(linearHomComplex(P,E)) to native homotopy-category maps P→E[n], compatible with the forgetful HomComplex comparison and the K-projective derived localization bijection. Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-hom-projective-comparison`.

5. **Signed finite-projective chain contraction.** Specify the homogeneous contraction sign for E tensor Hom(P,R)→Hom(P,E), verify its two differential contributions, and package the finite-product/direct-sum module isomorphisms. Native module contraction and Koszul symmetry are available; the chain equation is not yet a cited library declaration. Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-chain-tensor-hom`.

6. **Kaplansky transfinite support decomposition.** Refine countable closure of coordinate supports under a retract idempotent, the well-ordered successor/limit recursion, inherited projectivity of successor factors, and the transfinite direct-sum equivalence. The exact full source proof was read in Stacks 058T; no countable-generation assumption is put on the original projective module. Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-projective-countable-decomposition`.

7. **Kaplansky local support-minimization basis change.** Name the finite-support-minimum lemma across all free bases, the elementary basis change eliminating a redundant coefficient, and the local matrix determinant/unit calculation used to split off the finite free summand containing an element. Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-local-free-summand`.

8. **R-linear strict-limit and Milnor realization.** Upgrade the R02.1 additive-group product 1−shift construction and CC.2 realization to R-linear chain maps, prove the termwise-surjective shifted-cone/strict-kernel comparison, and transport the exact sequence as R-modules with tower naturality. Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-surjective-tower-derived-limit`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-module-tower-milnor`.

9. **Native filtered coefficient pages and map independence.** Refine the filtered total complex into native SpectralSequence pages with explicit cycles/boundaries quotients and next-page homology isomorphisms. Add comparison-map lifts between chosen projective B-resolutions and homotopy independence on pages. Do not assume the native page structure already contains the filtered construction. Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-sequence`.

10. **Finite filtered homology convergence.** Name the stable cycles/boundaries to gr^p H^n equivalence, prove finite exhaustiveness/separatedness and naturality of the induced filtration, and verify the uniform stable-page bound max(2,b−n+2). The finite-diagonal estimate is supplied here; the abutment comparison still needs these lemmas. Consumers: `DeformationAndDerivedPatchingAlgebra:P7/p7ii-coefficient-spectral-convergence`.

Closure requires these ten refinements and the six supplier contracts. The completed target pass stops here under the job’s target-coverage rule. P7 remains planned. Full suggested-file elaboration also requires the pinned Tau Ceti Homology artifacts. The Mathlib portion has been checked separately; the handoff records the exact validation receipt.

## Planet budget and proposed structure

The accepted P7 packet already selects six planets for P7. This follow-up adds none, so the aggregate layer stays within its six-planet budget.

**Split.** P7 combines finite local minimal complexes, derived coefficient operations, complete infinite rank complexes and coefficient towers/spectral convergence, while its six planets are already occupied. Assembly should consider sublayers P7a local finite minimal models, P7b derived module tensor/Hom/dual and amplitude, P7c complete flat infinite rank models, and P7d coefficient towers/actions and Tor spectral convergence. Keep the current P7 ids until a maintainer-approved rescope; redistribute the six accepted planets rather than adding planets to P7.

**Rescope.** Pilloni20 requires topological residue bases for complete Noetherian local flat modules, whereas current L0 states a DVR Banach orthonormal-basis theorem. PadicMeasuresIwasawaAlgebras, Part II should supply the complete-local completed-direct-sum and column-null matrix interface requested above. P7 owns the complex-level disk cancellation and derived comparisons, and does not duplicate the topological module construction.

## Source corrections

Corrections below refer only to the public versions actually read. The four Pilloni entries retain the accepted extraction’s E6–E9 observations. No comparison with an inaccessible publisher copy is claimed. Stacks correction comments were read where present.

**DeformationAndDerivedPatchingAlgebra/E-P7II-01 — Pilloni20, Author copy §2.1, Lemma 2.1.2 proof, PDF p. 8.** Printed: m_R^n/m_R^(n−1). Correction: Use m_R^(n−1)/m_R^n in the exact sequence. Reason: The printed quotient has the smaller ideal in the numerator and does not define the required successive layer. Correction status: Previously recorded PAPER-PILLONI-20/E6; the downloaded author copy still prints it..

**DeformationAndDerivedPatchingAlgebra/E-P7II-02 — Pilloni20, Author copy §2.2, Proposition 2.2.2 proof, PDF p. 9.** Printed: M. Correction: The spectral-sequence argument must use the mapping cone C(f), not M. Reason: The claimed vanishing is a property of the cone of f. Correction status: Previously recorded PAPER-PILLONI-20/E7; the downloaded author copy still prints it..

**DeformationAndDerivedPatchingAlgebra/E-P7II-03 — Pilloni20, Author copy §2.3, Lemma 2.3.1 proof, PDF p. 10.** Printed: R^I. Correction: Use the m-adic completion of the direct sum R^(I), not of the unrestricted product R^I. Reason: For I infinite and R a field, the product does not have the standard coordinate vectors as a vector-space basis. Residue lifts canonically act on the free direct sum. Correction status: Previously recorded PAPER-PILLONI-20/E8; scope is the author copy..

**DeformationAndDerivedPatchingAlgebra/E-P7II-04 — Pilloni20, Author copy §2.3, Lemma 2.3.1 proof, PDF p. 10.** Printed: B∈M_(I″,J″)(m_R). Correction: The residual block has rows J″ and columns I″. Reason: Its domain has basis I″ and target has basis J″. Correction status: Previously recorded PAPER-PILLONI-20/E9; the downloaded author copy still prints it..

**DeformationAndDerivedPatchingAlgebra/E-P7II-05 — 064N, Online Stacks Lemma 15.66.5 proof, accessed 5 October 2026.** Printed: Ker(F^n→F^(n−1)). Correction: Use Ker(F^n→F^(n+1)). Reason: The cochain differential leaves degree n for n+1; the new degree-(n−1) term maps into its cycles. Correction status: new.

**DeformationAndDerivedPatchingAlgebra/E-P7II-06 — 064N, Online Stacks Lemma 15.66.7 proof, accessed 5 October 2026.** Printed: τ_≤m K is pseudo-coherent. Correction: Here the proof only needs and proves m-pseudo-coherence. Reason: Finite top cohomology gives the required finite-order approximation, not unrestricted pseudo-coherence below m. Correction status: new.

**DeformationAndDerivedPatchingAlgebra/E-P7II-07 — 0656, Online Stacks Lemma 15.76.3 proof, accessed 5 October 2026.** Printed: E^(d−1)→E^d. Correction: In the displayed bottom cokernel use E^(−d−1)→E^(−d). Reason: The preceding support bound is −d≤i≤d; the smart truncation is at its bottom degree −d. Correction status: new.

**DeformationAndDerivedPatchingAlgebra/E-P7II-08 — 091N, Online Stacks Lemma 15.93.21 proof of (2), accessed 5 October 2026.** Printed: i<r. Correction: Use i<−r for the derived completion of the cone. Reason: The preceding lower bound is −r and the statement itself retains the minus sign; removing it contradicts the test r=1 and a nonzero module in degree zero. Correction status: new.

## Pinned baseline

Mathlib: **082e2d37e8b0463410cdb532e111cd43d5a66174**. Tau Ceti: **f790474821cf4256814db967cb154e7af3d0c369**. All cited full statements were read at those commits. Generated anonymous instance names are avoided in packet baseline references: filtered module colimit exactness cites the named transport lemma, while native ModuleCat AB5 was read and independently synthesized.

- [mathlib:DerivedCategory.Q](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean): Localization of integer cochain complexes of an abelian category at quasi-isomorphisms; HasDerivedCategory is explicitly supplied.
- [mathlib:HomologicalComplex.Acyclic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean): Acyclic means exact at every degree; in an abelian module category this is equivalent to all homology objects being zero.
- [mathlib:HomologicalComplex.tensorObj](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/Monoidal.lean): The direct-sum total tensor complex for a complex shape with tensor signs and the required graded coproducts.
- [mathlib:CochainComplex.mappingCone](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/MappingCone.lean): The cochain mapping cone in a preadditive category with the needed biproducts.
- [mathlib:CochainComplex.isKProjective_of_projective](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean): A complex strictly zero above d with projective objects in every degree is K-projective.
- [mathlib:CochainComplex.IsKProjective.Qh_map_bijective](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean): For a K-projective source, homotopy-category morphisms to any complex map bijectively to derived-category morphisms.
- [mathlib:Module.Flat.of_projective](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean): Every projective module over a commutative ring is flat.
- [mathlib:ModuleCat.extendScalars](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean): For an arbitrary commutative ring homomorphism R→S, sends M to S tensor_R M and maps to scalar extensions.
- [mathlib:CategoryTheory.Tor](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Tor.lean): Natural-number indexed left derived tensor bifunctor, deriving its SECOND module argument; categorical projective resolutions are required.
- [mathlib:CategoryTheory.Tor'](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Tor.lean): The alternate tensor left-derived functor deriving its FIRST argument; the pinned file does not compare it with Tor.
- [mathlib:DerivedCategory.homologyFunctor](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean): Integer-degree homology functor from the actual derived category to its abelian category.
- [mathlib:DerivedCategory.singleFunctor](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean): Places an object of the abelian category in the specified integer cochain degree.
- [mathlib:Module.Flat.projective_of_finitePresentation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/EquationalCriterion.lean): A finitely presented flat module over any commutative ring is projective.
- [mathlib:Module.finitePresentation_of_surjective](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/FinitePresentation.lean): A surjective linear image of a finitely presented module is finitely presented if its kernel is finitely generated.
- [tauceti:TauCeti.linearHomComplex](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Homology/LinearHomComplex/Basic.lean): For cochain complexes in an R-linear preadditive category, the ModuleCat R-valued product Hom complex with signed differential d_G f−(−1)^n f d_F.
- [tauceti:TauCeti.forget₂LinearHomComplexIso](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Homology/LinearHomComplex/Basic.lean): Forgetting R-linearity recovers the native additive-group-valued HomComplex, with identity comparison on each cochain module.
- [tauceti:TauCeti.koszulBraiding](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Homology/Monoidal/Braiding.lean): The chain tensor symmetry multiplies degree-(i,j) summands by (−1)^(ij); inverse swaps the factors.
- [tauceti:TauCeti.koszulSymmetricCategory](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Homology/Monoidal/Braiding.lean): The native integer module cochain tensor is symmetric with its Koszul braiding.
- [mathlib:Module.dual_projective](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Lemmas.lean): The dual of a FINITE projective module is projective; the finite-generation hypothesis is in the surrounding section.
- [mathlib:Module.dual_finite](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Lemmas.lean): The dual of a finite projective module is finite.
- [mathlib:Module.evalEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Defs.lean): Evaluation is a linear equivalence M≃Dual(Dual M) for reflexive M; the finite-projective reflexivity instance is supplied by Dual/Lemmas.
- [mathlib:dualTensorHomEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Contraction.lean): For finite projective M and arbitrary N, Dual M tensor N≃Hom(M,N), with pure tensor f tensor n sent to m↦f(m)n.
- [mathlib:DerivedCategory.triangleOfSES_distinguished](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/ShortExact.lean): A short exact sequence of native integer cochain complexes yields a distinguished triangle after localization.
- [mathlib:DerivedCategory.HomologySequence.exact₂](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean): Homology is exact at the middle object of a distinguished triangle in every integer degree.
- [mathlib:Module.Flat.iff_rTensor_injective](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Tensor.lean): Flatness over a commutative ring is equivalent to injectivity of tensoring every finitely generated ideal inclusion.
- [mathlib:Module.IsLocalRing.linearIndependent_of_flat](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/Module.lean): For an arbitrary index type, lifts to a flat module over a local ring of a linearly independent residue family are linearly independent. No finite-module hypothesis is used.
- [mathlib:Module.finitePresentation_of_finite](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/FinitePresentation.lean): Over a Noetherian ring, every finite module is finitely presented.
- [mathlib:IsAdicComplete](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean): Separatedness and completeness of an R-module for the powers of a fixed ideal I; this is not derived completeness.
- [mathlib:AdicCompletion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean): The native inverse-limit algebraic adic completion of a module, with its quotient coordinates.
- [mathlib:AdicCompletion.ofLinearEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean): For an I-adically complete module M, the canonical map M→AdicCompletion I M is an R-linear equivalence.
- [mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean): For Noetherian R and finite M, AdicCompletion I R tensor_R M≃AdicCompletion I M over the completed ring.
- [mathlib:CategoryTheory.E₂CohomologicalSpectralSequence](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/SpectralSequence/Basic.lean): Native category of integer-bigraded cohomological pages starting at page two, with differential bidegree (r,1−r) and next-page homology isomorphisms; the structure contains no abutment or convergence data.
- [mathlib:Representation.invariants](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Invariants.lean): The submodule of elements fixed by every group element, without invertibility of the group order.
- [mathlib:Representation.Coinvariants](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean): The native quotient by the span of ρ(g)x−x, for a monoid representation.
- [mathlib:Representation.Coinvariants.lift](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean): A linear map constant on the action descends to the native coinvariant quotient, with the generator formula and uniqueness.
- [mathlib:Representation.dual](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean): The contragredient representation on the module dual, g acting by precomposition with ρ(g⁻¹).
- [mathlib:Representation.asModule](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean): The module type synonym associated to a representation, with its group-algebra action and linear equivalence to the original carrier.
- [mathlib:CategoryTheory.HasExactColimitsOfShape.domain_of_functor](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean): For F:C→D preserving and reflecting finite limits and preserving J-colimits, with finite limits and J-colimits in C and exact J-colimits in D, transports exact J-colimits to C. ModuleCat R applies this to forget₂ to AddCommGrpCat; its native AB5 instance was read in ModuleCat/AB.lean and synthesized successfully in the native probe.
- [mathlib:AdicCompletion.of_bijective_iff](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean): The canonical map to adic completion is bijective if and only if the module is IsAdicComplete.
- [mathlib:isArtinianRing_iff_isNilpotent_maximalIdeal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/HopkinsLevitzki.lean): For a Noetherian local commutative ring, Artinianity is equivalent to nilpotence of its maximal ideal.
- [mathlib:isArtinian_of_fg_of_artinian'](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Artinian/Module.lean): Every finite module over an Artinian ring is Artinian.

## Public sources read

**[06XY — The Stacks Project, tag 06XY](https://stacks.math.columbia.edu/tag/06XY).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Definitions 15.60.1, 15.60.13; Lemmas 15.60.2–8, 10, 12, 14–16 and their proofs. SHA-256: `e9abb14ddf43453d25a570d46e21fe758c8860a83c76be2c8c9c94132aa7c32b`.

**[0A5W — The Stacks Project, tag 0A5W](https://stacks.math.columbia.edu/tag/0A5W).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Definition of derived Hom; Lemmas 15.75.1–6 and proofs. SHA-256: `51cd8ce67692264156e097d70187a09de07d037470c41c0b70c7db6a41693b0b`.

**[0A66 — The Stacks Project, tag 0A66](https://stacks.math.columbia.edu/tag/0A66).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemma 15.75.2 and proof. SHA-256: `46414a359b565d9fd4fa5d2a388a6aacd7843dea0e98b5260438b933e92f53ba`.

**[0651 — The Stacks Project, tag 0651](https://stacks.math.columbia.edu/tag/0651).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Definition 15.68.1; Lemmas 15.68.2–18 and relevant proofs. SHA-256: `a02f1de06ccd36197ce67b8aaca2c12ec968c687f36b48380c5ebe69bf4dd2a8`.

**[0656 — The Stacks Project, tag 0656](https://stacks.math.columbia.edu/tag/0656).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Definition 15.76.1; Lemmas 15.76.2–11,15,17 and Remark 15.76.16. SHA-256: `be67cfced27a0bac843e38de758e021df08208e5cae02a1a6979416868703f12`.

**[064N — The Stacks Project, tag 064N](https://stacks.math.columbia.edu/tag/064N).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Definition 15.66.1; Lemmas 15.66.2–12,17 and proofs. SHA-256: `ac5fecdf62e128808008622e84fece915bf463629d35cc5cf8de58e31eea3e29`.

**[064Q — The Stacks Project, tag 064Q](https://stacks.math.columbia.edu/tag/064Q).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Definition 15.66.1. SHA-256: `85289b6e7a0f296db8ea2f79a6bc25d262f9d096f1c52ba461fea8be36cc81ff`.

**[064V — The Stacks Project, tag 064V](https://stacks.math.columbia.edu/tag/064V).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemma 15.66.6. SHA-256: `e85ee70620a13f2d9e5c77cf81a094e3416be32b5c9ce105466aadfe5e3e6bfd`.

**[064X — The Stacks Project, tag 064X](https://stacks.math.columbia.edu/tag/064X).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemma 15.66.8 and proof. SHA-256: `ef96b42a5ca5f8a14e8186e0e2d023a2ef4d9635ade24e1acaa0f70575431636`.

**[061Y — The Stacks Project, tag 061Y](https://stacks.math.columbia.edu/tag/061Y).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Examples 15.63.1–4 and constructions. SHA-256: `ecd6d92dd701f2e17ade7a61b6c1d92d93c43e567b299c40f1716baf1821afb4`.

**[051G — The Stacks Project, tag 051G](https://stacks.math.columbia.edu/tag/051G).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemma 10.101.2 and proof. SHA-256: `0026c4ed9ddf1dcd4087e006810c9be8ef6a6799c2383301a664fdcff715f3b9`.

**[0ATK — The Stacks Project, tag 0ATK](https://stacks.math.columbia.edu/tag/0ATK).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemma 15.100.3 and proof. SHA-256: `1d0820da100fc650861d4aa85fab6192974a85b6314d9cdfb9200e55dff6cc8e`.

**[064J — The Stacks Project, tag 064J](https://stacks.math.columbia.edu/tag/064J).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemma 15.59.4 and proof. SHA-256: `121f9a8db64101a494ee6698e1d824d70ec8fc79dcf85237810ecb9617bb861d`.

**[00M5 — The Stacks Project, tag 00M5](https://stacks.math.columbia.edu/tag/00M5).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemma 10.75.8 and proof. SHA-256: `7a8334b956884ce1abb59f58cda631b4774d4864f7460603ead4dcc5e2b8f038`.

**[0658 — The Stacks Project, tag 0658](https://stacks.math.columbia.edu/tag/0658).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemma 15.76.2 and proof. SHA-256: `342cb802f3d4f4b745a202ffe1b1148b7824984b06004e5271af85ba218489a3`.

**[058Z — The Stacks Project, tag 058Z](https://stacks.math.columbia.edu/tag/058Z).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemmas 10.85.1–3 and Theorem 10.85.4, all proofs. SHA-256: `da9494cf687f89f404edd1bfae78105612eb5926e8de029612458e5c61877a0d`.

**[058T — The Stacks Project, tag 058T](https://stacks.math.columbia.edu/tag/058T).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Definition 10.84.1, Lemmas 10.84.2–3, Theorems 10.84.4–5, all proofs and correction comments. SHA-256: `8e493e62640729330218f7391f0a5058319d164fa912be4929c3963d950e54da`.

**[CG18 — Modularity lifting beyond the Taylor–Wiles method](https://math.uchicago.edu/~fcale/papers/CG.pdf).** Frank Calegari and David Geraghty. Author copy of the published Inventiones Mathematicae article (2018). Read 5 October 2026: §7.2, Lemmas 7.5–7.7 and the coefficient-complex passage. SHA-256: `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5`.

**[BCGP21 — Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269).** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. arXiv:1812.09269v3, 28 November 2021. Read 5 October 2026: §7.8, Lemmas 7.8.5–7.8.6 and Remark 7.8.7. SHA-256: `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`.

**[BCGP25 — Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1).** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. arXiv:2502.20645v1. Read 5 October 2026: §7.2, finite coefficient, action and augmentation hypotheses; §7.3, perfect-complex inputs; Lemma 7.4.11 and proof. SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.

**[BP26 — Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf).** George Boxer and Vincent Pilloni. Author copy dated 5 November 2025; published Inventiones Mathematicae (2026). Read 5 October 2026: §2.3.12, Proposition 2.3.13 and proof; §2.6.5–2.6.8. SHA-256: `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`.

**[Pilloni20 — Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).** Vincent Pilloni. Author copy dated 17 June 2019 of the Forum of Mathematics, Pi article (2020). Read 5 October 2026: §2.1–2.3, complete flat modules, Propositions 2.2.1–2.2.2, Lemma 2.3.1 and Proposition 2.3.1 with proofs. SHA-256: `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`.

**[091N — The Stacks Project, tag 091N](https://stacks.math.columbia.edu/tag/091N).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemmas 15.93.1–25, proofs and correction comments; generic constructions are supplier inputs, not new P7 nodes. SHA-256: `afa702f796124b836e583ce175543b8d5aada4adfc8ca1ec3165bef16d76601d`.

**[0922 — The Stacks Project, tag 0922](https://stacks.math.columbia.edu/tag/0922).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Proposition 15.96.2 and proof. SHA-256: `211fea6b4d842134a5a83af039369163f1793bbecb537eaf2c82f2072e4ea120`.

**[0BKN — The Stacks Project, tag 0BKN](https://stacks.math.columbia.edu/tag/0BKN).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemmas 20.37.1–2 and Remark 20.37.3; terminal ringed-space specialization. SHA-256: `adc1eca73f7e8801385c413d06d43c6e441d5c3b39240b99a1e96363f7d90c17`.

**[0132 — The Stacks Project, tag 0132](https://stacks.math.columbia.edu/tag/0132).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemma 12.25.3 and correction comments. SHA-256: `f3d3786aa36c57130178e447045d4140ad543a73d36455c34d6034057d5f3c58`.

**[012W — The Stacks Project, tag 012W](https://stacks.math.columbia.edu/tag/012W).** The Stacks Project authors. Online version accessed 5 October 2026. Read 5 October 2026: Lemma 12.24.11, full proof and correction comments. SHA-256: `6571c4161ca1594b7fd732620a4a64d7ab5fe60b03cde12cece8cbc424c729d4`.
