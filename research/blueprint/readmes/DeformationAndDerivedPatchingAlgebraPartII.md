# Commutative algebra for deformation theory and patching, Part II

This roadmap constructs Cohen–Macaulay blowing-ups of finite modules using ordered CM-secant sequences. Given a Noetherian local ring (R,m), a finite module M and a CM-secant sequence r₁,…,r_t, its final target is that the module blowing-up along I_t=∏_{i=1}^t(r₁,…,r_i) is Cohen–Macaulay on the actual scheme Bl_{I_t}(Spec R). The sequence calculus and the two local-cohomology claims explain why this carefully chosen centre works. A CM base alone does not make arbitrary blowing-ups CM; an explicit counterexample below supplies that distinction.

This is a completed planning pass, with 67 targets/API lemmas, 31 API items on six definitions or constructions, 26 discriminating tests and 19 planets. Every named item has a typed suggested form, elaborated at the pinned libraries with `sorry` as the only warning. This checks types, not proofs. K1 is closed as a plan; the other layers are planned with five source/interface gaps and four supplier requests. In particular two duality prototypes intentionally omit an unavailable supplier hypothesis, and two geometric comparisons are chartwise. The mathematical statements below retain their full hypotheses.

## Conventions and ownership

Sequence results use a commutative Noetherian local ring and a finite module, unless a statement explicitly works over an arbitrary commutative ring. Write Q(rs)=M/(rs)M and Q_i=M/(r₁,…,r_{i−1})M. Support dimension means the Krull dimension of the actual support, not of the entire base. The zero module has empty support and bottom dimension; its depth is infinite and its CM condition is vacuous. CM of a sheaf is checked at nonzero stalks. All parameter sequences lie in m. The d-sequence predicate requires injectivity, without properness or a nonzero quotient.

The local-cohomology functor, quotient modules, support dimension, polynomial modules and Rees algebras are native at Mathlib 082e2d3 / Tau Ceti f790474. Generic secant, depth/CM and local-cohomology calculus belong to DeformationAndDerivedPatchingAlgebra R03.3. Normalized ordinary-ring dualizing complexes belong to AnalyticStacks AS.1 under the accepted routing decision; the brief’s older R03.3 assignment is superseded. Scheme blowups, Proj and their charts belong to existing StableReduction Layers 2 and 4. Generic affine module sheaves and pullback/tensor constructions are already in AlgebraicVectorBundles. Generic module strict transforms are requested from AdicCoefficientsAndComparisons L5, with its current narrower scope explicitly recorded in the packet. None of these generic objects is a new target here.

The read-only current Tau Ceti library additionally has `reesAlgebra.grade`, `reesAlgebra.gradedAlgebra`, `Ideal.affineBlowup` and `TauCeti.AlgebraicGeometry.affineBlowupι`, with a chart cover and base compatibility. They postdate the pin. The suggested adapters reproduce their mathematical carriers solely to type this continuation; they are not proposals to rebuild the existing geometry. All nine upstream roadmaps newer than the atlas snapshot were screened for overlap.

The source is Česnavičius’s arXiv v2, deposited 3 September 2020, rather than an unread Duke version of record. The inherited independently confirmed corrections E4–E8 are applied: support-restricted CM, later-index torsion in the colon formula, the last auxiliary parameter in clause (iii), varying prefix factors in I_s, and the relation r_bT−r_a in the chart cohomology sequence. No new paper review is claimed.

## Layer overview

| Layer | Mathematical role | Coverage |
|---|---|---|
| K0 | Annihilator products, CM-secant sequences and duality loci | Planned; torsion-proof and ordinary-duality interfaces remain |
| K1 | d-sequences and the two power-intersection identities | Closed as a plan |
| K2 | Prefix products and the three Kawasaki clauses | Planned; corrected primary induction remains |
| K3 | Graded module blowing-ups, chart comparisons and support dimension | Planned; whole-sheaf supplier gluing remains |
| K4 | Regular-element reduction, closed-point depth induction and CM blowing-ups | Planned; inherits K2, cohomology and gluing interfaces |

## K0: CM-secant sequences and annihilators

The annihilator product records the obstruction to extending a parameter sequence through non-CM quotients. CM-secantness asks for that control at every step and CM only at the end. Duality is used to interpret its zero locus, not as an added assumption in the torsion estimate or final blowing-up theorem.

### Local-cohomology annihilator product

Target `annihilator-product`. For a commutative R, ideal J and R-module M, define a_J(M,d) = product over 0 ≤ j < d of Ann_R H^j_J(M). This is a finite product of ideals in R, not an intersection or the preimage of a product in R/Ann M. For the paper’s a(M), take J=m and d=dim Supp M when M≠0; the zero module uses the empty product, the unit ideal. The explicit finite cutoff avoids converting infinite or bottom dimension to a natural number.

Its API is:

- `annihilator_product_zero` (simp): a_J(M,0) is the unit ideal, including when M=0.
- `annihilator_product_succ` (simp): a_J(M,d+1)=a_J(M,d)·Ann_R H^d_J(M).
- `annihilator_product_le_factor` (relation): For j<d the product is contained in Ann_R H^j_J(M).
- `annihilator_product_eq_top_of_vanishing` (characterisation): If every H^j_J(M) for j<d is zero, then the product is the unit ideal.

The definition must pass these tests:

- `ann_product_empty`: For every J and M, a_J(M,0)=1.
- `ann_product_single`: The cutoff-one product is exactly Ann_R H^0_J(M), not its radical.
- `ann_product_zero_module`: All local cohomology of the zero module vanishes; every finite-cutoff product is 1.
- `ann_product_not_intersection`: Write A=Ann H⁰_J(M), B=Ann H¹_J(M). If AB differs from A∩B, then a_J(M,2) differs from A∩B. A concrete local example is M=k⊕R/(y), R=k[[x,y]]: A=(x,y), B=(y), so the product is (xy,y²), whereas the intersection is (y).

Proof plan. Use the existing localCohomology J j functor on ModuleCat.of R M. Take the finite ideal product; a dimension witness is supplied only when interpreting the paper’s notation.

Source match. CES21, Definition 3.1(ii), Remark 3.3 and Lemma 3.6 (pp. 9–12 of arXiv v2): Own formulation of local-cohomology annihilator product, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `mathlib:localCohomology`, `mathlib:Module.annihilator`.

### CM-secant sequences

Target `is-cm-secant`. For finite M over Noetherian local (R,m), an ordered list rs is CM-secant iff every term lies in m; every successive prefix quotient strictly lowers support dimension; the final quotient is Cohen–Macaulay; and for each index i the element rs_i belongs to a_m(M/(rs before i)M,dim Supp(M/(rs before i)M)). Empty rs is allowed and is CM-secant exactly when M is CM. The zero module admits only the empty list. Terminal CM is required only for the final quotient, so prefixes are not asserted CM-secant.

Its API is:

- `cm_sect_mem_maximal` (projection): Every element of a CM-secant sequence belongs to m.
- `cm_sect_dimension_drop` (projection): Every step strictly decreases the dimension of the actual support of its prefix quotient.
- `cm_sect_terminal_vanishing` (projection): The terminal quotient has zero local cohomology below its support dimension. Comparison with R03.3 identifies this with terminal CM.
- `cm_sect_ann_membership` (projection): At every step there is a finite support-dimension witness d and the next term belongs to the product of local-cohomology annihilators on that prefix quotient.
- `cm_sect_empty_iff` (characterisation): The empty list is CM-secant iff H^j_m(M)=0 for every j<dim Supp M, with zero M included.

The definition must pass these tests:

- `cm_sect_field_empty`: The empty list is CM-secant on the one-dimensional vector space over Q; its support has dimension zero.
- `cm_sect_field_zero_not`: [0] is not CM-secant on Q: the support dimension does not decrease.
- `cm_sect_zero_empty`: The empty list is CM-secant on the zero module.
- `cm_sect_zero_nonempty_not`: A nonempty list is never CM-secant on the zero module.
- `cm_sect_dvr_parameter`: For R=M=Q[[X]], the singleton [X] is CM-secant: support dimension drops from one to zero and H^0_m(R)=0.
- `cm_sect_dvr_square`: The singleton [X²] is also CM-secant on Q[[X]]; secancy is not restricted to a chosen uniformizer.

Proof plan. Expand the requested R03.3 secant predicate on native quotients by Ideal.ofList prefixes. Express terminal CM by the requested Grothendieck vanishing criterion in terms of the native localCohomology functor; this is an expanded condition, not a competing generic CM definition. Each nonempty prefix before a step has a finite natural support-dimension witness by Noetherian locality and Nakayama; record that finiteness comparison as a supplier need.

Source match. CES21, Definition 3.1(ii) (p. 9 of arXiv v2): Own formulation of cm-secant sequences, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product`, `mathlib:Ideal.ofList`, `mathlib:Module.supportDim`, `mathlib:IsLocalRing.maximalIdeal`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### Comparison with the imported CM and secant predicates

Target `cm-secant-owner-comparison`. For finite M over Noetherian local R, the native expanded CM-secant condition agrees with Definition 3.1(ii) using the R03.3 secant and CM predicates. Zero M has empty support and vacuous local-cohomology vanishing; the comparison must use E4’s support-restricted CM convention. Every nonzero prefix quotient has finite natural support dimension.

Proof plan. Apply the requested R03.3 local-cohomology criterion for CM and finite dimension of finite modules over a Noetherian local ring. Use Nakayama for proper prefix ideals to rule out a zero quotient when M is nonzero.

Source match. CES21, Definition 3.1 and §1.14, corrected E4 (pp. 4, 9 of arXiv v2): Own formulation of comparison with the imported cm and secant predicates, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K0/is-cm-secant`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `mathlib:Module.supportDim_eq_bot_iff_subsingleton`.

Suggested-file boundary. The typed comparison expands the R03.3 secant and CM conditions on actual quotient modules, using support dimension and vanishing of the native local-cohomology functor. These adapters are not new packet definitions. Agreement with the owner’s eventual named interface is an open supplier request.

### Schenzel’s secant torsion bound

Target `schenzel-torsion-bound`. If r1,…,rs is a nonempty secant sequence for finite M over Noetherian local (R,m), then a_m(M,dim Supp M) kills the rs-torsion of M/(r1,…,r{s−1})M. No terminal-CM or dualizing-complex hypothesis is added.

Proof plan. Use the torsion estimate of Schenzel 2.4.2, as quoted in CES21 Remark 3.3 and also Kawasaki 1996 Lemma 2.4. Both accessible sources give its statement, not a proof sufficient to close this target. The supplier’s torsion carrier is the union of kernels of positive powers of the last parameter on the penultimate quotient. The suggested form says every element in that union is killed by every element of the annihilator product; no terminal-CM assumption is used.

Source match. CES21, Remark 3.3 (p. 10 of arXiv v2): Own formulation of schenzel’s secant torsion bound, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### Extending CM-secant sequences to parameters

Target `cm-secant-extend-parameters`. Every CM-secant sequence for nonzero finite M over Noetherian local R extends to a CM-secant system of parameters. Choose regular parameters of the CM terminal quotient, whose low-degree annihilator product is the unit ideal.

Proof plan. Use imported existence of systems of parameters and CM regular-parameter equivalence. Lift the terminal parameters and use the unit annihilator-product calculation on their successive CM quotients.

Source match. CES21, Remark 3.4 (p. 10 of arXiv v2): Own formulation of extending cm-secant sequences to parameters, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K0/is-cm-secant`, `DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product-eq-top-of-vanishing`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### Reversal and p-standard parameters

Target `p-standard-reversal`. For a nonzero finite M of positive support dimension s and a secant system of parameters r₁,…,r_s, the list is CM-secant iff r_s,…,r₁ is a p-standard system of parameters of type s−1. This is ordered reversal, not permutation invariance. In dimension zero the empty list satisfies the two expanded membership conditions vacuously; no negative type is introduced.

Proof plan. For nonzero M of dimension d, a secant system of parameters has length d and zero-dimensional terminal quotient, which is CM. Set x_j=r_{d+1−j}. Kawasaki 1996 Definition 2.5, type d−1, requires x_d∈a(M) and x_j∈a(M/(x_{j+1},…,x_d)M) for j<d. The latter quotient is exactly the prefix quotient before r_{d+1−j}. Thus reversal matches every annihilator membership in CM-secantness. No permutation invariance is asserted. The suggested form expands this precise condition using reverse/drop on lists; comparison with the owner’s system-of-parameters notion is imported.

Source match. CES21, Remark 3.4 (p. 10 of arXiv v2): Identifies the ordered p-standard reversal.; KAW96, §2, Definition 2.5, p. 42; Theorem 2.6 and Lemma 2.7, pp. 42–43: The primary definition at type d−1 gives the membership equivalence directly. The later lemmas confirm the reversed-tail use; they do not replace the full Kaw00 induction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K0/is-cm-secant`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

Suggested-file boundary. The owner’s parameter predicate is expanded as a secant list with zero-dimensional terminal quotient. The p-standard side is its reversed-tail annihilator formula, not a newly planned generic parameter definition.

### Annihilator preserved by the injective-hull dual

Target `matlis-annihilator`. For finite N over Noetherian local R and E the injective hull of the residue field, Ann_R N = Ann_R Hom_R(N,E).

Proof plan. The residue field is a quotient of every nonzero finite N by Nakayama and is a submodule of E. Thus Hom(-,E) detects zero on finite modules; exactness of Hom(-,E) detects the zero multiplication map for each scalar.

Source match. CES21, Lemma 3.6(a), proof (pp. 11–12 of arXiv v2): Own formulation of annihilator preserved by the injective-hull dual, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `mathlib:Module.annihilator`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### Local-duality annihilator identity

Target `duality-annihilator`. For finite M over Noetherian local R with a normalized dualizing complex ω, and every integer j, Ann_R H^j_m(M)=Ann_R H^{-j}(RHom_R(M,ω)). Negative local-cohomology degrees are zero. The normalization is essential.

Proof plan. Apply imported AS.1 local duality and exactness of Hom into the injective hull. Apply the Matlis annihilator lemma to the finite dual cohomology module.

Source match. CES21, Lemma 3.6(a) (pp. 11–12 of arXiv v2): Own formulation of local-duality annihilator identity, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K0/matlis-annihilator`, `AnalyticStacks:AS.1`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

Suggested-file boundary. The typed consequence takes an actual cochain complex with finite cohomology and a supplied local-duality linear isomorphism into the injective hull. It does not pretend an arbitrary complex is RHom(M,ω). Binding C to normalized dualizing data is requested from AS.1. Only natural local-cohomology degrees are typed; negative degrees of the mathematical target are the supplier’s zero objects.

### The annihilator product and the CM locus

Target `cm-locus-annihilator`. For finite M with equidimensional support over Noetherian local R with normalized dualizing complex, V(a_m(M,dim Supp M)) is exactly the non-CM locus. The empty-support case gives the empty closed subset. Without equidimensionality this assertion is not made.

Proof plan. Replace local cohomology annihilators by finite dual-cohomology annihilators. Localize these finite annihilators; normalize ω at p by shift −dim(R/p). Use catenarity and equidimensional support to identify dim Supp M_p = dim Supp M − dim(R/p). Apply the imported local-cohomology CM criterion.

Source match. CES21, Lemma 3.6(b) (pp. 11–12 of arXiv v2): Own formulation of the annihilator product and the cm locus, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K0/duality-annihilator`, `AnalyticStacks:AS.1`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

Suggested-file boundary. The normalized-dualizing-complex hypothesis is explicitly omitted from the typed prototype, because its supplier signature is missing. Thus the prototype is not valid at its displayed generality. The roadmap statement retains normalization and equidimensionality. Its natural dimension witness types the nonzero-module case; the zero case is the empty locus and is dealt with separately.

### The defect set for arbitrary support

Target `nonequidimensional-defect`. Without equidimensionality, under the hypotheses of Lemma 3.6, V(a_m(M,dim Supp M)) equals {p in Supp M : depth_{R_p} M_p + dim(R/p) < dim Supp M}. It contains every irreducible component of nonmaximal dimension.

Proof plan. Put E⁻ʲ=H⁻ʲ(RHom(M,ω)). Local duality and the Matlis comparison identify each local-cohomology annihilator with Ann E⁻ʲ. Finiteness gives V(a(M))=the union of Supp E⁻ʲ for 0≤j<d. At p, localization of the normalized dualizing complex is normalized after the coheight shift δ(p)=dim(R/p). Stacks 47.17.3 supplies this dimension function and its shift; 47.16.5 identifies the least j with (E⁻ʲ)_p≠0 as depth(M_p)+δ(p). Hence membership in that union is exactly depth(M_p)+dim(R/p)<d. At a minimal support prime of a component of dimension e<d, the nonzero localized module has zero-dimensional support and depth zero, so the strict inequality holds. This argument uses the AS.1 package; it does not assert equidimensionality.

Source match. CES21, Remark 3.7 (p. 12 of arXiv v2): States the defect set and lower-dimensional-component consequence.; STACKS-DUAL, §47.16, Lemma 47.16.5 (tag 0A7U); §47.17, Lemma 47.17.3 (tag 0A7Z), unpaginated HTML: Together with local duality and coherent localization, these give an alternative derivation of the defect formula without using Schenzel 2.4.6 as an unread proof..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K0/duality-annihilator`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `AnalyticStacks:AS.1`.

Suggested-file boundary. The typed prototype expresses depth by existence of a nonzero local-cohomology degree. The AS.1 normalized-dualizing-complex hypothesis is explicitly omitted because it has no supplier signature at the pin; the mathematical target retains it. The prototype is not valid at its displayed generality.

## K1: Huneke d-sequences and power intersections

These targets work for arbitrary modules over arbitrary commutative rings. The injectivity definition makes the first intersection identity immediate; a two-direction induction gives the second. The corrected colon equivalence is proved independently by an induction on sequence length, so this layer does not depend on the unread HIO equivalence proof.

### Huneke d-sequences

Target `is-d-sequence`. For any R-module M over any commutative ring, an ordered list rs is a d-sequence iff each rs_i is injective on (Ideal(rs)M)/(Ideal(rs before i)M), viewed as an actual submodule of M/(Ideal(rs before i)M). Equivalently use Ideal(rs) times the top submodule of this actual quotient. There is no properness, localness, finiteness or nonzero-module assumption.

Its API is:

- `dseq_empty` (simp): The empty list is a d-sequence for every module.
- `dseq_zero_module` (example): Every list is a d-sequence on a zero module.
- `dseq_of_weakly_regular` (compatibility): Every native weakly regular sequence is a d-sequence by restriction of injectivity. No properness is required.
- `dseq_singleton_iff` (characterisation): [r] is a d-sequence iff multiplication by r is injective on rM.
- `dseq_linear_equiv` (functoriality): An R-linear equivalence of actual modules preserves the d-sequence predicate.
- `dseq_colon_iff` (characterisation): A list rs is a d-sequence iff for every i≤j, the rs_j-torsion and rs_i·rs_j-torsion in M/(rs before i)M agree. This corrects E5; replacing rs_j by rs_i is false.

The definition must pass these tests:

- `dseq_empty_test`: Every module admits the empty d-sequence.
- `dseq_zero_singleton`: [0] is a d-sequence on nonzero Q, but it is not weakly regular there.
- `dseq_one_singleton`: [1] is a d-sequence on Q, but it is not a native regular sequence because its final quotient is zero.
- `dseq_order_forward`: [2,0] is a d-sequence on Z.
- `dseq_order_reverse_not`: [0,2] is not a d-sequence on Z: zero multiplication on 2Z is not injective.

Proof plan. Use native Ideal.ofList and quotient modules. Restrict scalar multiplication to the ideal-generated submodule of each actual prefix quotient and apply native IsSMulRegular.

Source match. CES21, Definition 3.8 (p. 12 of arXiv v2): Own formulation of huneke d-sequences, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `mathlib:Ideal.ofList`, `mathlib:IsSMulRegular`, `mathlib:Submodule.mkQ`.

### Goto–Yamagishi colon intersection

Target `goto-yamagishi-colon`. For a d-sequence rs on M, let Q_i=(r1,…,r{i−1})M and J=(rs). For n≥1 and 1≤i≤s, (Q_i :_M r_i) ∩ J^nM = Q_i ∩ J^nM.

Proof plan. The n=1 case follows from the d-sequence injectivity on JM/Q_i. For any n≥1, J^nM⊆JM, so the same injectivity proves the equality.

Source match. CES21, Remark 3.10, first equality (p. 12 of arXiv v2): Own formulation of goto–yamagishi colon intersection, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K1/is-d-sequence`, `mathlib:Submodule.comap`.

### Goto–Yamagishi power intersection

Target `goto-yamagishi-intersection`. With the same hypotheses, Q_i ∩ J^nM = (r1,…,r{i−1})J^{n−1}M for n≥1, 1≤i≤s.

Proof plan. Induct increasingly on n and decreasingly on i, with the auxiliary terminal case i=s+1. For i=s+1 use J^nM=J·J^{n−1}M; for n=1 use Q_i⊆JM. Write x∈Q_i∩J^nM as x=y+r_i z with y∈Q_i J^{n−1}M using the descending i induction. Then z belongs to (Q_i:r_i)∩J^{n−1}M; apply the colon equality and the increasing n induction. At n=1 use the base case rather than referring to the n=0 colon identity.

Source match. CES21, Remark 3.10, second equality and proof (p. 12 of arXiv v2): Own formulation of goto–yamagishi power intersection, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K1/goto-yamagishi-colon`, `mathlib:Ideal.ofList`.

## K2: Kawasaki’s prefix-product sequence calculus

The product uses each successive prefix exactly once. The three Kawasaki clauses must be kept separate because the final induction uses reversal, power torsion and auxiliary regularity in different places. Their mathematical statements and signatures are complete; their corrected primary proof remains a source gap.

### Products of successive prefix ideals

Target `prefix-product`. For an ordered list rs define I_s = product_{0≤i<s} Ideal.ofList(rs.take(i+1)). For 0≤s≤length rs this is exactly product_{i=1}^s (r1,…,ri). I_0 is the unit ideal; I_s is not the s-th power of the whole prefix ideal. The definition is total for all natural s but uses with s beyond the length are not part of the theorem.

Its API is:

- `prefix_product_zero` (simp): I_0=1.
- `prefix_product_succ` (relation): I_{s+1}=I_s·(r1,…,r{s+1}).
- `prefix_product_one` (simp): I_1=(r1) for a nonempty list.
- `prefix_product_take` (compatibility): For s≤length rs, computing I_s from rs.take s gives the same ideal.

The definition must pass these tests:

- `prefix_product_empty_test`: The empty-stage product is the unit ideal.
- `prefix_product_two_test`: I_2 for [a,b] equals (a)(a,b).
- `prefix_product_wrong_power`: For R=Z and rs=[2,3], I_2=(2) while (2,3)^2=Z, so these ideals differ.
- `prefix_product_zero_first`: A zero first term makes every positive prefix product zero, even when later terms generate the unit ideal.

Proof plan. Take a finite product of the native prefix ideals; the empty product is top.

Source match. CES21, Proposition 3.11, definition of I_j; proof of Theorem 3.14 corrected E7 (pp. 12–13, 15 of arXiv v2): Own formulation of products of successive prefix ideals, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `mathlib:Ideal.ofList`.

### Reversed prefixes after auxiliary secant quotients

Target `kawasaki-reversed-dseq`. Let r1,…,rt be CM-secant for M and 0≤s≤t. Let a1,…,au∈m be secant for M/(r1,…,rs)M, and set M′=M/(a1,…,au)M. Then rs,…,r1 is a d-sequence for M′. The reversal and the ambient module quotient are essential.

Proof plan. Use CES21 Proposition 3.11(i) with its auxiliary secant sequence on M/(r₁,…,r_s)M. In the quotient by the auxiliary sequence, reverse the selected original prefix. The primary proof depends on Kaw00 Lemmas 2.9, 2.10 and Proposition 3.1, and Kaw02 Corollary 3.6. These proofs remain unread; Kawasaki 1996’s tail d-sequence theorem does not supply the general auxiliary-quotient induction. No claim of primary-proof closure is made.

Source match. CES21, Proposition 3.11(i) (pp. 12–13 of arXiv v2): Own formulation of reversed prefixes after auxiliary secant quotients, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K0/is-cm-secant`, `DeformationAndDerivedPatchingAlgebraPartII:K1/is-d-sequence`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### Torsion in prefix-product-power quotients

Target `kawasaki-torsion`. With r, s, auxiliary a and M′ as above, for s≥2 and m,n>0, the r_s^m-torsion of M′/I_{s−1}^nM′ equals its (r1,…,rs)-torsion. Powers and auxiliary secant hypotheses are retained.

Proof plan. Apply CES21 Proposition 3.11(ii) in the auxiliary quotient, with s≥2 and strictly positive m,n. Equate the kernel of r_s^m on M′/I_{s−1}^nM′ with the common kernel of all elements in (r₁,…,r_s). The corrected Kaw00 Proposition 3.2 induction is an explicit source gap. The typed target retains the powers and every auxiliary secant hypothesis.

Source match. CES21, Proposition 3.11(ii) (pp. 12–13 of arXiv v2): Own formulation of torsion in prefix-product-power quotients, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product`, `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-reversed-dseq`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### Lifting the last auxiliary regular element

Target `kawasaki-aux-regular`. For a nonempty auxiliary secant list a1,…,au on M/(r1,…,rs)M, put M′=M/(a1,…,a{u−1})M. If a_u is regular on M′/(r1,…,rs)M′, then a_u is regular on M′ and on M′/I_s^nM′ for every n>0. The element is a_u, not r_u (E6).

Proof plan. Use CES21 Proposition 3.11(iii), with a_u the last auxiliary term and M′ the quotient by the preceding auxiliary terms. Its antecedent is injectivity of a_u on M′/(r₁,…,r_s)M′. The conclusion is injectivity on M′ and on every M′/I_s^nM′, n>0. The corrected Kaw00 Proposition 3.3 induction is an explicit source gap; properness is not silently added to injectivity.

Source match. CES21, Proposition 3.11(iii), corrected E6 (pp. 12–13 of arXiv v2): Own formulation of lifting the last auxiliary regular element, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product`, `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-torsion`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `mathlib:IsSMulRegular`.

### Robustness under auxiliary secant quotients

Target `kawasaki-robustness`. For a selected prefix of a CM-secant sequence, conditions (i),(ii),(iii) of Proposition 3.11 continue to hold after quotienting M by an auxiliary secant sequence on its terminal prefix quotient. This preserves the three conditions, not a blanket assertion that every prefix is CM-secant.

Proof plan. Concatenate any further auxiliary secant list with the one already divided out. Apply each of the three preceding clauses to the concatenated list and use canonical quotient-by-sum equivalences from R03.3.

Source match. CES21, Remark 3.12 (p. 13 of arXiv v2): Own formulation of robustness under auxiliary secant quotients, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-reversed-dseq`, `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-torsion`, `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-aux-regular`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

## K3: Rees modules and module blowing-ups

The module construction lives on the existing scheme blowup. Its affine module is the image span in a localization, which removes exceptional torsion. This prevents confusing it with the full tensor pullback. Support is an equality of topological subsets, and the dimension estimate is proved over a general Noetherian base.

### The graded Rees module

Target `rees-module`. For an ideal I and arbitrary R-module M, the Rees module is the native polynomial-module submodule whose coefficient of degree n belongs to I^nM. It is a module over the existing reesAlgebra I by convolution. Its degree n is I^nM, including degree zero M; it is not M tensored with the Rees algebra, which can carry extra torsion.

Its API is:

- `rees_module_mem` (characterisation): Membership is coefficientwise membership in the actual powers I^nM.
- `rees_module_single` (constructor): A degree-n singleton belongs iff its coefficient belongs to I^nM.
- `rees_module_unit` (simp): For I=1 the Rees module is the whole polynomial module.
- `rees_module_zero_ideal` (simp): For I=0 only degree-zero coefficients may be nonzero.

The definition must pass these tests:

- `rees_module_degree_zero`: Every singleton in degree zero belongs, even for I=0.
- `rees_module_zero_ideal_nonexample`: For R=M=Z and I=0, the singleton 1 in degree one does not belong.
- `rees_module_unit_test`: For unit ideal the carrier is the entire polynomial module.
- `rees_module_torsion_test`: For I=(2) in Z and M=Z/2, the degree-one singleton 1 is excluded although tensoring M with the polynomial Rees algebra would retain a degree-one generator.

Proof plan. Use PolynomialModule R M as ambient carrier and restrict scalar action from R[X] to reesAlgebra I. Define coefficientwise membership and prove closure using PolynomialModule.smul_apply, the ideal-power convolution and finite sums.

Source match. CES21, §3.13, the graded module ⊕ I^nM (pp. 13–14 of arXiv v2): Own formulation of the graded rees module, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `mathlib:PolynomialModule`, `mathlib:PolynomialModule.smul_apply`, `mathlib:reesAlgebra`, `mathlib:Submodule.smul_mem_smul`, `mathlib:Submodule.mul_smul`, `mathlib:PolynomialModule.coeff_add`, `mathlib:PolynomialModule.coeff_zero`.

### Blowing up a module

Target `module-blowup`. For finite M over Noetherian R and ideal I, Bl_I(M) is the sheaf on Bl_I(R)=Proj(Rees_R(I)) associated to the graded Rees module ⊕I^nM. On the i-chart for i∈I, its module is the R_(i)-submodule of M[1/i] generated by the image of M, where R_(i)⊂R[1/i] is the imported blow-up chart. It is the image construction, not the full tensor product.

Its API is:

- `module_blowup_chart` (data): On the imported i-chart, sections are the submodule M_(i) of M[1/i] generated by M over R_(i).
- `module_blowup_off_center` (compatibility): Restriction over Spec R minus V(I) is canonically the original sheaf of M.
- `module_blowup_map` (functoriality): Every R-linear map M→N induces Bl_I(M)→Bl_I(N) by its actual maps on the Rees-module coefficients.
- `module_blowup_map_id` (simp): The induced blowing-up map of the identity M→M is the identity sheaf morphism.
- `module_blowup_map_comp` (functoriality): For R-linear maps f:M→N and g:N→P, the blowing-up map of g composed with f equals the composite of their sheaf maps.
- `module_blowup_zero` (simp): Bl_I(0) is the zero sheaf on Bl_I(R).
- `module_blowup_self` (compatibility): Bl_I(R), as a module blowing-up of R itself, is the structure sheaf of the blowup scheme.
- `module_blowup_chart_surjection` (projection): The natural tensor pullback M⊗_R R_(i)→M_(i) is surjective, with kernel supported on the exceptional divisor.

The definition must pass these tests:

- `module_blowup_unit`: For I=R, Bl_I(R)=Spec R and Bl_I(M) is the ordinary affine sheaf associated to M.
- `module_blowup_principal`: For a principal ideal (r), Bl_(r)(M) is the sheaf of M/M⟨r^∞⟩ on the principal blowup scheme; do not assert M is unchanged when r is a zero divisor.
- `module_blowup_zmod_two`: For R=Z, I=(2), M=Z/2, the module blowing-up is zero on Bl_(2)(Z)=Spec Z, while the ordinary pullback of M is nonzero.

Proof plan. Use the native Proj scheme of the Rees grading; current Tau Ceti supplies the grading and affine blowup charts. At the pinned baseline the suggested adapters have these same mathematical carriers, rather than an arbitrary scheme. Generic Proj/gluing belongs to StableReduction. Sheafify ⊕IⁿM using degree-zero homogeneous localizations. On the i-chart, degree-zero fractions of coefficients identify with the chart-ring span of the image of M in M[1/i]. Verify restrictions on chart overlaps and glue. The suggested sheaf has the actual Proj carrier and a typed chart characteristic isomorphism. Its body is admitted. The homogeneous localization/gluing interface is requested from SR4; generic strict-transform gluing is requested from L5.

Source match. CES21, §3.13 (pp. 13–14 of arXiv v2): Own formulation of blowing up a module, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `AdicCoefficientsAndComparisons:L5`, `mathlib:AlgebraicGeometry.«Proj»`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:AlgebraicGeometry.tilde`.

Suggested-file boundary. Actual Proj, Scheme.Modules, pullback and affine tilde objects are typed at the pin. Local helpers adapt the current Tau Ceti grading/chart carriers, absent from the pin; they are not new geometry nodes.

### Comparison with Raynaud–Gruson strict transform

Target `module-strict-transform`. Under the identification of the imported scheme blowup, Bl_I(M) is canonically the Raynaud–Gruson strict transform: quotient of the pullback sheaf by sections supported on the exceptional divisor. On each chart this is the map to the image submodule in M[1/i].

Proof plan. Apply the chart surjection and identify its kernel with sections killed by some power of the exceptional generator. Glue the resulting chart isomorphisms and compare with the L5 module strict-transform definition.

Source match. CES21, §3.13 (pp. 13–14 of arXiv v2): Own formulation of comparison with raynaud–gruson strict transform, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup`, `DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup-chart-surjection`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `AdicCoefficientsAndComparisons:L5`.

Suggested-file boundary. The suggested comparison is chartwise: quotient of the actual tensor pullback by the kernel of its map into M[1/i], linearly isomorphic to its image span. The canonical sheaf comparison and overlap compatibility remain the L5 supplier/interface gap.

### Two-ideal module blowing-up identity

Target `module-two-ideal`. For ideals I,J in Noetherian R, over the imported scheme isomorphism Bl_IJ(R)≅Bl_I(Bl_J(R)), the corresponding module Bl_IJ(M) is canonically the iterated module blowing-up Bl_I(Bl_J(M)). The second centre is the pulled-back ideal, and the isomorphism is tracked on the actual charts.

Proof plan. Import the scheme two-ideal identity from StableReduction Layer 4, not as a new scheme theorem here. Identify the module images after the successive homogeneous localizations with the direct IJ-chart image in M[1/(ij)]. Glue these module identifications over the scheme isomorphism.

Source match. CES21, §3.13, final paragraph (p. 14 of arXiv v2): Module images agree under the product-versus-iterated scheme blowup identity.; STACKS-BLOWUP, §31.33, Lemma 31.33.12 (tag 080A), unpaginated HTML: Provides the scheme identity. On a product chart the fractions from I and J can be recovered from IJ by multiplying the numerators by the chosen other denominator..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `AdicCoefficientsAndComparisons:L5`.

Suggested-file boundary. The suggested comparison is an R-linear equivalence from the actual ij-chart image module to the nested chart image, with I extended to the J-chart. Compatibility with the chart-ring isomorphism and gluing over the supplier’s scheme identity remain open, rather than an assumed arbitrary scheme equivalence.

### Support of a module blowing-up

Target `blowup-support`. For finite M and A=R/Ann_R M, the topological support of Bl_I(M) is the image of the closed blowup Bl_{IA}(Spec A) inside Bl_I(Spec R). On an i-chart it is V(ker(R_(i)→A[1/image(i)])). This is equality of support subsets; it does not identify an independently chosen nilpotent scheme structure on the support.

Proof plan. The image of R_(i) in A[1/image(i)] is the A blowup chart. The induced map to this image is surjective and its kernel defines the closed chart immersion. For finite M, M_(i) is finite over R_(i). Its annihilator is the kernel of R_(i)→A[1/image(i)]: a scalar kills the chart module exactly when it kills the generators from M, equivalently it kills M[1/i]. Finiteness identifies the annihilator after localization with the localization of Ann M. Use finite-module support=V(annihilator), then glue these support subsets using the imported chart overlaps.

Source match. CES21, Theorem 3.14 dimension reduction; accepted extraction item 86 (pp. 14–17 of arXiv v2): Own formulation of support of a module blowing-up, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `AdicCoefficientsAndComparisons:L5`, `mathlib:Module.supportDim_eq_ringKrullDim_quotient_annihilator`, `mathlib:Module.support`, `mathlib:PrimeSpectrum.zeroLocus`.

Suggested-file boundary. The typed statement is the exact affine support equality. The whole-scheme closed immersion uses imported SR4 gluing.

### Dimension of the Rees algebra

Target `rees-dimension-bound`. For every Noetherian commutative ring A and ideal J, dim A[Jt]≤dim A+1 in extended Krull dimension. For finite dim A this is the bound needed here; when dim A is infinite the inequality is automatic. No equality is asserted for J=0.

Proof plan. Noetherianity makes J finitely generated, so A[Jt] is a finite-type A-algebra by the native Rees finite-generation theorem. First let A be a domain. A[Jt]⊂A[t] is a domain with fraction-field transcendence degree over A at most one. For every prime q of the Rees ring, Stacks 10.113.1 bounds ht q by ht(q∩A)+trdeg_A A[Jt]−trdeg_{κ(q∩A)}κ(q), hence by dim A+1. Taking the supremum gives the result; no universal-catenarity assumption is needed for this inequality. For general A, map its Rees algebra surjectively to the Rees algebra over each minimal-prime quotient. The kernels are prime and their finite intersection is the Rees nilradical, since nilpotence is coefficientwise inside A[t]. Every prime contains one such kernel, so a prime chain is bounded by the corresponding domain quotient. Each base quotient has dimension at most dim A. The zero ring and infinite-dimension cases use bottom/infinity conventions. This replaces the unread HIO dimension citation, rather than claiming that book was consulted.

Source match. STACKS-DIM, §10.113, Lemma 10.113.1 (tag 02IJ), unpaginated HTML: The upper height inequality for injective finite-type extensions of Noetherian domains gives the required general-base bound. Its proof was read, including induction on the generators and the polynomial/quotient cases..

Prerequisites. `mathlib:reesAlgebra.fg`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### Appending the irrelevant homogeneous prime

Target `proj-prime-chain`. For S=A[Jt], every chain of homogeneous primes corresponding to points of Proj S can be enlarged by the homogeneous prime (P_last∩A)⊕S_+. Hence dim Proj S≤dim S−1 whenever Proj S is nonempty; for empty Proj use dimension bottom.

Proof plan. A chain of points of Proj(Rees_A(J)) corresponds to a chain of relevant homogeneous primes P₀⊊…⊊P_l. Each P_i is contained in the homogeneous prime P_i,0+S_+ lying over its degree-zero contraction. Relevance makes P_l strictly smaller than P_l,0+S_+. Appending that prime adds one strict inclusion, so l+1≤dim S. Take suprema. Empty Proj has bottom dimension; the assertion is compatible with J=0. The prime-chain comparison is generic Proj infrastructure imported from SR4.

Source match. CES21, Theorem 3.14, initial support-dimension reduction, p. 14 of arXiv v2: The theorem uses a blowup dimension bound at this point. The extra homogeneous-prime argument is our own proof of the generic Proj inequality, imported with SR4 geometry rather than attributed as a separate theorem of this source..

Prerequisites. `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `mathlib:AlgebraicGeometry.«Proj»`, `mathlib:topologicalKrullDim`.

### Dimension bound for the blowing-up support

Target `blowup-support-dimension`. For finite M over Noetherian local R, dim Supp Bl_I(M)≤dim Supp M, including the zero-module empty-support case. Apply the Rees bound to A=R/Ann M and the projective prime-chain bound to the support blowup.

Proof plan. Identify the support subset with the blowup over A=R/Ann M. Combine dim Rees_A(IA)≤dim A+1 and the extra-prime Proj inequality to obtain dim Bl_{IA}(A)≤dim A. For nonzero finite M the native support-dimension theorem identifies dim A with dim Supp M. Zero M has empty support on both sides and bottom dimension, so this case is handled without subtracting natural numbers from bottom.

Source match. CES21, Theorem 3.14, initial support-dimension reduction, p. 14 of arXiv v2: The blowup support dimension is the input in this reduction. The packet gives an independent Rees/Proj prime-chain derivation using its preceding targets, replacing the unread HIO citation..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K3/blowup-support`, `DeformationAndDerivedPatchingAlgebraPartII:K3/rees-dimension-bound`, `DeformationAndDerivedPatchingAlgebraPartII:K3/proj-prime-chain`, `mathlib:Module.supportDim_eq_ringKrullDim_quotient_annihilator`, `mathlib:topologicalKrullDim`.

## K4: Cohen–Macaulay blowing-ups

The proof first works with the three prefix conditions of K2, quantified over every auxiliary secant list, rather than assuming all prefixes themselves are CM-secant. Reduce a positive-dimensional CM terminal quotient by a regular parameter. For a zero-dimensional terminal quotient, induct on the prefix length at closed points. This closed-point restriction is necessary for the monic residual polynomial argument.

### Regular terminal-element reduction

Target `regular-terminal-quotient`. Assume every initial prefix satisfies Proposition 3.11(i)–(iii). If r′∈m is regular on the terminal quotient, then it is regular on M and on M/I_s^nM for each prefix s and n>0. On the same scheme Bl_{I_s}(Spec R), Bl_{I_s}(M)/r′Bl_{I_s}(M) is canonically Bl_{I_s}(M/r′M). If the terminal quotient is CM of positive dimension, a regular parameter r′ provides the dimension-reduction step. This statement does not change the scheme base to Spec(R/(r′)).

Proof plan. Use the weaker prefix clauses, as in the first reduction of Theorem 3.14, with the one-element regular auxiliary quotient [r′]. Clause (iii) gives regularity on M and every prefix-power quotient. Its secant and quotient identifications use the R03.3 interface; zero M is handled separately. Only CM of the terminal quotient is used to choose r′ when reducing positive terminal dimension. In 0→I_s^nM→M→M/I_s^nM→0 the multiplication-by-r′ snake lemma, with regularity on the last term, identifies I_s^nM/r′I_s^nM with the image I_s^n(M/r′M). The degree-zero comparison is included. Homogeneous localization and sheafification give the quotient comparison on Bl_{I_s}(Spec R); this is a module quotient on a fixed scheme. Robustness preserves the weaker prefix conditions after dividing by r′. At support points containing r′, regular-element CM ascent recovers CM of the original module; the localization induction handles the remaining points.

Source match. CES21, Theorem 3.14, first reduction (pp. 14–15 of arXiv v2): Own formulation of regular terminal-element reduction, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-aux-regular`, `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-robustness`, `DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

Suggested-file boundary. The typed suggestion gives regularity on M and every prefix-power quotient, and the quotient comparison on every actual chart of the same blowup scheme. Whole-sheaf gluing is imported.

### The empty and principal blowing-up stages

Target `principal-stage`. In Theorem 3.14’s dimension-zero-terminal reduction, the s=0 stage has unit ideal and is the original module, and the s=1 stage has Bl_(r1)(M)=M/M⟨r1^∞⟩ with r1 regular on this quotient. These are the base cases for the depth induction.

Proof plan. Use the unit and principal chart comparisons for module blowing-ups. Use the imported local-cohomology depth criterion and principal torsion quotient.

Source match. CES21, Theorem 3.14, s=0 and s=1 cases (pp. 14–15 of arXiv v2): Own formulation of the empty and principal blowing-up stages, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup`, `DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product-zero`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

### The two-generator chart presentation

Target `two-generator-chart`. For s≥2, at a point of the previous prefix-product blowing-up choose a generator r_i of the previous prefix ideal. It is regular on the local chart ring R′ and module M′. For {a,b}={i,s}, the current chart module at a closed point is (M′⊗R′[T])/(r_bT−r_a), divided by r_b-power torsion and localized at (m′,f), where f is a monic lift of the residual closed-point polynomial.

Proof plan. Factor I_s=I_{s−1}(r₁,…,r_s) and use the imported two-ideal scheme comparison plus its module-image counterpart. Locally on the previous blowup choose r_i generating the extended (r₁,…,r_{s−1}); both its ring and module actions are injective. The next ideal is (r_i,r_s). For either denominator r_b, form N=M′[T]/(r_bT−r_a)M′[T] and quotient N by its r_b-power torsion. Evaluation T↦r_a/r_b gives its isomorphism to the chart image in M′[1/r_b]. At a closed point above the closed previous point, the polynomial prime is (m′,f), with f a monic lift of the residual irreducible polynomial. This closed-point restriction is essential. Stacks 10.70.3 and 10.70.6 supply the ring presentation and saturation; the module presentation follows by the same evaluation/localization argument.

Source match. CES21, Theorem 3.14, (3.14.1)–(3.14.8), pp. 15–16 of arXiv v2: Selects the previous-stage generator and the actual closed-point chart.; STACKS-CHART, §10.70, Examples 10.70.2–10.70.3 and Lemma 10.70.6 (tag 052P), unpaginated HTML: Gives the two-generator ring relation and quotient by denominator-power torsion. The stated module presentation is derived by evaluation on the actual localized module..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K3/module-two-ideal`, `DeformationAndDerivedPatchingAlgebraPartII:K3/blowup-support-dimension`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

Suggested-file boundary. The typed target gives the general two-generator module presentation, assuming one of the generators is module-regular, before localization at (m′,f). The closed-point polynomial and localization are recorded in the mathematical proof sketch and belong to the imported scheme chart interface.

### The first local-cohomology claim

Target `claim-annihilation`. In the inductive setup of Theorem 3.14, with local previous-stage chart (R′,M′), r_i and r_s both kill H^1_{(r_i,r_s)}(R′,M′).

Proof plan. Write I=I_{s−1} and use n>0. The reversed d-sequence makes r_s injective on IⁿM, hence on the previous-stage module M′ after homogeneous localization. Thus the two-generator Čech model gives H¹_(r_i,r_s)(M′)=colim_{m>0} H⁰_(r_i)(M′/r_s^mM′), with transition multiplication by r_s. In degree n, the multiplication snake lemma gives 0→K_{m,n}→IⁿM/r_s^mIⁿM→Iⁿ(M/r_s^mM)→0, where K_{m,n}=(IⁿM:r_s^m)/(IⁿM+(0:_M r_s^m)) and the injection sends a class x to r_s^m x. Clause (ii) implies r_i and r_s both kill K_{m,n}. All n,m here are positive. In the target graded module, homogeneous localization followed by degree zero gives the previous-stage blowup module for M/r_s^mM. The selected previous denominator r_i acts injectively on this image module in its localization (the module chart formula of §3.13). Thus its r_i-torsion is zero, and the exact sequence identifies the r_i-torsion of M′/r_s^mM′ with the localized kernel. This argument needs no unproved assertion that every quotient sequence remains CM-secant. Both annihilators pass through the homogeneous localization and the filtered colimit. These are steps of the target proof, not additional roadmap targets.

Source match. CES21, Claim 3.14.5 and (3.14.13) (pp. 16–17 of arXiv v2): Own formulation of the first local-cohomology claim, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-reversed-dseq`, `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-torsion`, `DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### The second local-cohomology claim

Target `claim-vanishing`. In the same setup, H^j_{m′}(R′,H^{j′}_{(r_i,r_s)}(R′,M′))=0 for j<s−2 and every j′. In a natural-degree formulation, only j′=1,2 remain: degree zero vanishes by regularity of r_i and degrees above two vanish by the two-generator Čech model.

Proof plan. At a closed previous-stage point over m, the induction gives depth M′≥s−1. For the two-generator Čech complex, the degree-zero row vanishes because r_i is regular, and rows above two vanish by its length. For row two, regular r_s gives H²_(r_i,r_s)(M′)=colim_{m>0}H¹_(r_i)(M′/r_s^mM′). The comparison to the previous blowup module M′_(m) of M/r_s^mM has r_i-killed kernel by (3.14.15), so principal H¹ does not see this kernel. Robustness permits induction on M/r_s^mM. It gives depth M′_(m)≥s−1; r_i is regular on it, so its quotient by r_i^l has depth at least s−2 for l>0. Local cohomology commutes with both filtered systems. Thus colim_{m>0}colim_{l>0}Hʲ_m′(M′_(m)/r_i^lM′_(m)) vanishes for j<s−2, which kills row two in that range (3.14.16). Use the iterated local-cohomology spectral sequence E₂^{j,j′}=Hʲ_m′(H^{j′}_(r_i,r_s)(M′))⇒H^{j+j′}_m′(M′). Its abutment vanishes below s−1. With rows zero and above two absent and row two already vanishing in the needed range, the only possible incoming differential to row one has zero source; hence row one also vanishes for j<s−2.

Source match. CES21, Claim 3.14.6 and (3.14.14)–(3.14.16) (pp. 16–17 of arXiv v2): Own formulation of the second local-cohomology claim, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K4/claim-annihilation`, `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-robustness`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

Suggested-file boundary. The typed signature uses the actual localized previous chart, all weaker prefix conditions, a zero-dimensional terminal quotient, a maximal chart prime contracting to m, and natural j,j′. The maximal-prime restriction is retained; the depth assertion is not made at arbitrary points of the closed fibre.

### The corrected chart relation kills cohomology

Target `chart-polynomial-annihilation`. After polynomial flat base change in the two-generator chart setup, multiplication by the actual relation r_bT−r_a is zero on H^1_{(r_a,r_b)}(R′[T],M′⊗R′[T]). This is E8’s corrected relation used in the preceding exact sequence, even though the printed swapped relation also kills the module.

Proof plan. Apply the first claim to show both r_a and r_b act by zero. Use imported flat base change for local cohomology and linearity of multiplication.

Source match. CES21, Theorem 3.14, (3.14.10), corrected E8 (p. 16 of arXiv v2): Own formulation of the corrected chart relation kills cohomology, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K4/claim-annihilation`, `DeformationAndDerivedPatchingAlgebraPartII:K4/two-generator-chart`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### Depth induction on prefix-product charts

Target `chart-depth-induction`. Under the weaker prefix conditions and a zero-dimensional terminal quotient, for every 0≤s≤t the module Bl_{I_s}(M) has depth at least s at closed support points over the closed point. One does not assert this bound at every point of the closed fibre. The support-dimension bound and proper/localization reduction then give the CM conclusion at the final stage.

Proof plan. For s=0 the depth lower bound is vacuous; for s=1 the principal chart is the quotient by r₁-power torsion, with r₁ injective on it. For s≥2 work at a closed point and use the two-generator presentation, P=M′[T] and g=r_bT−r_a. One coefficient is module-regular, so multiplication by g is injective on P. The residual polynomial f is monic, so it is injective on every polynomial base change of a local-cohomology module. Flat polynomial base change carries Claim 3.14.6 to P; then the long exact sequence for support enlarged by f raises the vanishing range to j<s−1. Claim 3.14.5 makes g act by zero on H¹_(r_a,r_b)(P). Put N=P/gP. In N the ideal (r_a,r_b) acts as the principal ideal (r_b), so H²_(r_a,r_b)(N)=0. Write A₁=H¹_(r_a,r_b)(P), A₂=H²_(r_a,r_b)(P), and K=ker(g:A₂→A₂). The relation long exact sequence, with g zero on A₁ and surjective on A₂, gives 0→A₁→H¹_(r_a,r_b)(N)→K→0 and 0→K→A₂→A₂→0. Apply cohomology with support (m′,f) to the second sequence: the two A₂ terms vanish below s−1, so K does also. The first sequence then gives the same vanishing for H¹_(r_a,r_b)(N). Quotienting N by r_b-power torsion leaves its principal H¹ unchanged. That quotient has no principal H⁰. The support spectral sequence now identifies its local cohomology with that of H¹_(r_b)(N), shifted by one, and hence gives vanishing below s. Localize at the actual closed prime (m′,f). At the final stage, the zero-dimensional terminal quotient gives dim Supp M≤t by the height bound for an ideal with t generators. Equality holds for an actual secant system of parameters, but is not needed or asserted for the weaker hypotheses. The blowup support dimension is at most dim Supp M, whereas closed-point depth is at least t. Properness over the local base and localization therefore give CM everywhere on the support; regular-element reduction handles a positive-dimensional terminal quotient.

Source match. CES21, Theorem 3.14, induction and (3.14.1)–(3.14.11) (pp. 14–17 of arXiv v2): Own formulation of depth induction on prefix-product charts, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K4/principal-stage`, `DeformationAndDerivedPatchingAlgebraPartII:K4/two-generator-chart`, `DeformationAndDerivedPatchingAlgebraPartII:K4/claim-annihilation`, `DeformationAndDerivedPatchingAlgebraPartII:K4/claim-vanishing`, `DeformationAndDerivedPatchingAlgebraPartII:K4/chart-polynomial-annihilation`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### CM blowing-ups under the weaker sequence hypotheses

Target `weaker-hypothesis-cm-blowup`. Let finite M over Noetherian local (R,m) and an ordered list r1,…,rt∈m have CM terminal quotient. Suppose every initial subsequence satisfies all three conditions of Proposition 3.11, with their auxiliary secant quantifiers, reversed d-sequence and corrected last auxiliary element. Then Bl_{I_t}(M) is CM on Bl_{I_t}(R), where I_t is the product of successive prefix ideals.

Proof plan. Reduce terminal dimension by regular elements and use the graded quotient comparison. For zero-dimensional terminal quotient apply the chart-depth induction and support-dimension bound. Apply the support-restricted CM convention, including the zero sheaf.

Source match. CES21, Theorem 3.14, proof’s explicitly weaker hypothesis (pp. 14–17 of arXiv v2): Own formulation of cm blowing-ups under the weaker sequence hypotheses, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K4/regular-terminal-quotient`, `DeformationAndDerivedPatchingAlgebraPartII:K4/chart-depth-induction`, `DeformationAndDerivedPatchingAlgebraPartII:K3/blowup-support-dimension`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### Kawasaki’s Cohen–Macaulay blowing-up theorem

Target `kawasaki-cm-blowup`. For a finite module M over a Noetherian local ring (R,m) and CM-secant r1,…,rt∈m, set I=product_{i=1}^t(r1,…,ri). Then Bl_I(M) is a Cohen–Macaulay module on Bl_I(R). This includes the empty sequence, when M itself is CM and I=1; zero M gives the zero sheaf.

Proof plan. Obtain each of the three prefix conditions from Proposition 3.11. Apply the weaker-hypothesis theorem to the actual Rees-module blowing-up, not a sheaf with an assumed CM field.

Source match. CES21, Theorem 3.14 (pp. 14–17 of arXiv v2): Own formulation of kawasaki’s cohen–macaulay blowing-up theorem, with the hypotheses and maps specified in this node; API consequences are derived from that construction..

Prerequisites. `DeformationAndDerivedPatchingAlgebraPartII:K0/is-cm-secant`, `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-reversed-dseq`, `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-torsion`, `DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-aux-regular`, `DeformationAndDerivedPatchingAlgebraPartII:K4/weaker-hypothesis-cm-blowup`.

### A CM ring whose maximal-ideal blowing-up is not CM

Target `arbitrary-blowup-nonexample`. For any field k, let A₀=k[x³,x⁵y³,x¹⁵y²,y⁷] and localize at its positive-generator maximal ideal m. Then A=(A₀)_m is a two-dimensional Noetherian Cohen–Macaulay domain, but Bl_m(Spec A) has a non-CM local ring. The chart at x³, after writing Y=y/x, is the localization of B=k[x³,x⁵Y³,x¹⁴Y²,x⁴Y⁷]; at n=(x³,x⁵Y³,x¹⁴Y²,x⁴Y⁷) its depth is one.

Proof plan. HJLS Example 3.6 gives this construction. Verify A₀ directly: with u=x³,v=x⁵y³,w=x¹⁵y²,z=y⁷, the presentation is k[u,v,w,z]/(v³−wz,w⁷−u³⁵z²). It is free over k[u,z] with basis vⁱwʲ, 0≤i<3, 0≤j<7. Reduction by the two monic relations gives spanning; distinct images are independent because x-exponents modulo 3 distinguish i and y-exponents modulo 7 then distinguish j. Thus u,z is a regular parameter sequence and A is CM of dimension two. On the x³-chart, adjoin v/u,w/u,z/u. The change of variable Y=y/x gives a=x³,b=x⁵Y³,c=x¹⁴Y²,d=x⁴Y⁷, the displayed B. The homogeneous maximal ideal n contracts to m because the original generators become a,ab,ac,ad; hence this local chart survives base localization. The equations b²¹=a²³d⁹ and c²¹=a⁹⁰d⁶ make B finite over k[a,d], so a,d are parameters. B is a domain, hence a is regular. The class of c² in B/(a) is nonzero: (28,4)−(3,0)=(25,4) is not in the exponent semigroup; Y-degree four forces two copies of c and x-degree at least 28. Yet d c²=a b³c. The class remains nonzero after localizing at n: a denominator outside n has a nonzero constant term, whose monomial cannot cancel into the monomial ideal (a). Thus d is a zerodivisor on B_n/(a). A two-dimensional local CM ring would make every parameter sequence regular, so B_n is not CM and has depth one. This independently verifies the source example without using the uncleared HIO book.

Source match. CES21, §3 opening paragraph (p. 9 of arXiv v2): The maximal-ideal blowup warning motivates this counterexample; the cited HIO book is not used as a read source.; HJLS, Example 3.6, p. 13 of the author preprint; context pp. 12–13: Supplies the semigroup ring and chart. The free-basis and parameter-zerodivisor checks in this node independently establish the CM and non-CM assertions..

Prerequisites. `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

Suggested-file boundary. The typed application states existence of a Noetherian local CM ring with a non-CM blowup, using the actual chartwise CM predicate. The concrete semigroup presentation and depth witness are mathematical proof data; they are not claimed to have been formalized.

## Source and interface follow-up

Every accepted route item (34, 36, 37, 40–50 and 86) is realized by the packet’s target inventory. Smaller proof steps, including the degreewise snake-lemma and filtered-colimit arguments, stay in target proof sketches under the current target-level protocol. They are not artificial unresolved declaration lists. The following real gaps prevent claiming closure:

- **Schenzel torsion estimate: primary proof unavailable.** CES21 Remark 3.3 and KAW96 Lemma 2.4 give the secant-torsion estimate, but neither supplies its proof. Schenzel 1982 is not cleared in the library index and was not read. Obtain a cleared primary proof or give an independent proof of a(M) annihilating the last-parameter power torsion on the penultimate secant quotient, with no CM/duality assumption. The defect-locus formula no longer depends on unread Schenzel 2.4.6.
- **Corrected Kawasaki auxiliary-quotient induction.** KAW96 Definition 2.5 resolves the p-standard definition, but its tail d-sequence theorem does not prove the full auxiliary-quotient clauses. Read Kaw00 Lemmas 2.9, 2.10 and Propositions 3.1–3.3 and Kaw02 Corollary 3.6, or prove their module forms independently. In the A_ij–E_ij induction apply the five corrections identified in CES21 Proposition 3.11, retaining positive powers and the corrected last auxiliary element. These primary proofs were not obtained.
- **R03.3 local-cohomology and depth interface.** The functor localCohomology and module support dimension exist at the pin. The exact Čech, filtered-colimit, flat-base-change, regular-element and iterated-support spectral-sequence interfaces requested from R03.3 do not have identified native/supplier nodes. Bind the expanded suggested predicates to the owner and supply these precise generic results there. They are used explicitly in the proof sketches, not assumed to have been implemented.
- **AS.1 ordinary duality interface and omitted hypotheses.** The ordinary-ring normalized dualizing package is not supplied by the visible AS.1 plan. The annihilator comparison is typed conditionally on an actual finite-cohomology complex and a local-duality isomorphism; binding it to RHom and negative-degree zeros remains open. CM-locus and defect prototypes explicitly omit the unstateable normalized-dualizing-complex hypothesis and are invalid at that generality. The packet retains the correct hypotheses and proofs via coherent localization/coheight normalization. Supply the actual AS.1 interface before treating these signatures as full theorem statements.
- **Whole-sheaf strict-transform and two-ideal gluing.** The actual Proj module sheaf, its chart API and all three tests are now typed. Strict-transform and product-versus-iterated comparisons are typed on the actual image modules of charts. The canonical whole-sheaf maps, compatibility with the supplier’s chart-ring/scheme isomorphisms and overlap gluing still need the SR4/L5 interfaces. Current Tau Ceti provides Rees grading and affine charts, but neither current L5 nor the pin supplies the generic module strict-transform interface. Do not replace this with an arbitrary Scheme or assumed CM field.

The exact requested supplier contracts are:

- `DeformationAndDerivedPatchingAlgebra:R03.3`: Exact R03.3 interfaces for finite-module secant/parameter sequences and depth/CM, nonzero prefix dimension and Nakayama, regular-element depth descent/ascent, injective hulls, and local-cohomology Čech models, long exact sequences, flat base change, filtered-colimit compatibility and the iterated-support spectral sequence. At the pin, localCohomology itself and support dimension are native; the requested calculus and named CM/depth predicates were not found. The full reviewed R03.3 library-audit row and current stage description were read. Suggested adapters expand these conditions on actual modules; they do not take arbitrary proposition arguments.
- `AnalyticStacks:AS.1`: Ordinary Noetherian-local normalized dualizing complexes, finite RHom cohomology, local duality with the essential injective hull of the residue field, localization with coheight normalization shift, and the induced dimension function/catenarity. Accepted route.reason names AS.1 despite the brief’s stale R03.3 assignment. Current AS.1 describes topological/coherent six-functor and Grothendieck–Serre structures, not this ordinary-ring package, and has no packet. Supply the actual typed data and the all-integer-degree zero convention; two prototype hypotheses are explicitly omitted pending this interface.
- `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`: Use StableReduction’s existing Layer 2 Proj and Layer 4 blowup geometry, including overlaps, product-versus-iterated blowup identity, properness, principal/unit centres and homogeneous-prime support comparison. Current Tau Ceti supplies reesAlgebra.grade/gradedAlgebra and affineBlowupι charts, later than the pin. The packet owns only graded module sheafification and its module properties, not scheme blowups; request exact overlap and module-sheaf gluing interfaces. Current AlgebraicVectorBundles supplies generic tilde/tensor/pullback infrastructure and is imported as existing work.
- `AdicCoefficientsAndComparisons:L5`: The accepted route assigns generic Raynaud–Gruson module strict transforms to L5: quotient the actual pullback by exceptional power-torsion sections; provide canonical chart comparisons, overlap compatibility and gluing under the two-ideal scheme identity. The current L5 packet/package instead covers normal-crossing comparison via alterations. Its L2 vector-bundle-extension-cofinal target uses coherent extension (0G41) and Fitting blowup strict transforms (0ESN), but does not state this general finite-module interface. This request records that mismatch; no existing L5 node is falsely cited as supplying it.

## Sources read

- **CES21**: Kęstutis Česnavičius, *Macaulayfication of Noetherian schemes*. arXiv:1810.04493v2, deposited 3 September 2020; not the Duke version of record. [CES21](https://arxiv.org/pdf/1810.04493v2). Read: §3 in full, pp. 9–17, including Theorem 3.14 and both local-cohomology claims; §1.14, p. 4, for conventions.
- **KAW96**: Takesi Kawasaki, *On Macaulayfication of local rings—in the case dim non-CM≤2*. RIMS Kôkyûroku 964 (1996), pp. 40–50. [KAW96](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/0964-3.pdf). Read: §§1–2, pp. 40–43, especially Lemma 2.4, Definition 2.5, Theorem 2.6 and Lemma 2.7.
- **HJLS**: William Heinzer, Bernard Johnston, David Lantz and Kishor Shah, *Coefficient Ideals in and Blowups of a Commutative Noetherian Domain*. Author preprint, Example 3.6 on p. 13. [HJLS](https://www.math.purdue.edu/~heinzer/preprints/rrii53.pdf). Read: Example 3.6, p. 13; surrounding blowup discussion, pp. 12–13.
- **STACKS-DIM**: The Stacks Project Authors, *The Stacks Project: The dimension formula*. Unpaginated HTML, accessed 11 October 2026; lemma/section and stable tag are the locators. [STACKS-DIM](https://stacks.math.columbia.edu/tag/02IJ). Read: §10.113, Lemma 10.113.1 and its complete proof.
- **STACKS-CHART**: The Stacks Project Authors, *The Stacks Project: Blow up algebras*. Unpaginated HTML, accessed 11 October 2026; lemma/section and stable tag are the locators. [STACKS-CHART](https://stacks.math.columbia.edu/tag/052P). Read: §10.70, Definitions/Examples 10.70.1–10.70.3 and Lemma 10.70.6.
- **STACKS-BLOWUP**: The Stacks Project Authors, *The Stacks Project: Product and iterated blowing ups*. Unpaginated HTML, accessed 11 October 2026; lemma/section and stable tag are the locators. [STACKS-BLOWUP](https://stacks.math.columbia.edu/tag/080A). Read: §31.33, Lemma 31.33.12 and its complete proof.
- **STACKS-DUAL**: The Stacks Project Authors, *The Stacks Project: Dualizing complexes over local rings*. Unpaginated HTML, accessed 11 October 2026; lemma/section and stable tag are the locators. [STACKS-DUAL](https://stacks.math.columbia.edu/tag/0A7U). Read: §47.16, Lemma 47.16.5 and proof; §47.17, Lemma 47.17.3 (tag 0A7Z) and proof.

Schenzel 1982 and HIO 1988 are not cleared by the local library index and were not read or copied. No passage from a source is stored here. The p-standard definition is supplied by Kawasaki’s public 1996 primary text; the general defect formula has an alternative coherent-duality argument; the dimension bound uses Stacks 02IJ; and the explicit blowup example is checked from the author’s HJLS preprint. The inaccessible Kawasaki 2000/2002 induction and Schenzel torsion proof remain honestly identified above.
