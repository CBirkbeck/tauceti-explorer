# Commutative algebra for deformation theory and patching, Part II: Kawasaki’s Cohen–Macaulay blowing-ups

This continuation starts after the finite-module depth, support and Cohen–Macaulay theory of DeformationAndDerivedPatchingAlgebra R03.3. It develops ordered CM-secant and Huneke d-sequences, Kawasaki’s product-of-prefix-ideals calculus and blowing-ups of modules. The final target is a Cohen–Macaulay module blowing-up along the ideal determined by a CM-secant sequence, with the actual local-cohomology claims and dimension bound needed by the proof.

This is a partial checkpoint, not a finished planning pass or an implementation. The target inventory covers all fifteen accepted extraction items. Stage K1 is planned; K0, K2, K3 and K4 have the exact remaining obligations below. The concrete suggested portion elaborates against the pinned Mathlib; the boundary register is mathematical text, not checked Lean signatures.

## Conventions and ownership

For sequence results, R is a Noetherian local commutative ring with maximal ideal m and M is a finite R-module. d-sequences and Rees modules need only a commutative ring and an arbitrary module unless stated otherwise. Support dimension of the zero module is bottom, not zero.

The empty sequence is CM-secant precisely when the module is CM. A d-sequence instead tests injectivity only on the ideal-generated image inside the prefix quotient and admits [0] on a nonzero field. The native regular-sequence predicate additionally requires a nonzero terminal quotient, so [1] on a field is d-sequence but not regular. The order tests [2,0] and [0,2] on Z prevent accidental permutation invariance. CM-secant prefixes do not automatically have CM terminal quotients.

Accepted route.reason overrides the stale brief sentence assigning dualizing complexes to R03.3. Requests are recorded in the packet, rather than sent to owners. The AS.1 and R03.3 visible descriptions do not themselves provide the entire accepted ordinary-ring duality and local-cohomology package; the exact scope discrepancy is recorded, so no stage link is treated as an already verified theorem.

The annihilator cutoff is a natural number supplied with an actual support-dimension witness. It is never obtained by converting bottom or infinity to zero. The zero-module product is the unit ideal. All CM-locus assertions use the support-restricted convention E4; none assert depth zero-module equals dimension empty-support.

## Sources and validation boundaries

The entire §3 of Česnavičius’s arXiv v2 has been read through the ar5iv conversion, preserving TeX formulas, alongside the accepted extraction and reviewed sourceIssues. The conversion’s generated 2026 date is not an author revision. The Duke version of record, Schenzel’s primary proofs, Kaw00/Kaw02 and HIO88 have not been read here. Every dependency on those unread passages is a gap, not a claim of closure. The two upstream style documents JacobianChallenge and Multiquadratic were read in full earlier in this worker loop; StableReduction’s introduction and Layer 4 were also read for the actual supplier boundary.

The pinned declarations are read and listed in the packet. Generic local cohomology is already defined, but its source file explicitly marks Čech equivalence, derived-functor comparison and long exact sequences as future work. Those missing results are requested from R03.3, not silently inferred from the existence of the colimit functor. Native derived categories and the Rees algebra are not replanned.

## K0. CM-secant sequences and annihilators

Define the local-cohomology annihilator product and CM-secant sequences; compare with imported secant and CM conditions, including empty support. Prove Schenzel’s torsion bound, extension to parameters, reversed p-standard comparison, the normalized-duality annihilator identity, the CM-locus equality for equidimensional support and the general defect-set formula.

Dependencies: DeformationAndDerivedPatchingAlgebra:R03.3, AnalyticStacks:AS.1.

### Local-cohomology annihilator product

Declaration: TauCeti.Kawasaki.annihilator_product. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product.

For a commutative R, ideal J and R-module M, define a_J(M,d) = product over 0 ≤ j < d of Ann_R H^j_J(M). This is a finite product of ideals in R, not an intersection or the preimage of a product in R/Ann M. For the paper’s a(M), take J=m and d=dim Supp M when M≠0; the zero module uses the empty product, the unit ideal. The explicit finite cutoff avoids converting infinite or bottom dimension to a natural number.

Use the existing localCohomology J j functor on ModuleCat.of R M. Take the finite ideal product; a dimension witness is supplied only when interpreting the paper’s notation. Source: Definition 3.1(ii), Remark 3.3 and Lemma 3.6.

Acceptance: For every J and M, a_J(M,0)=1. The cutoff-one product is exactly Ann_R H^0_J(M), not its radical. All local cohomology of the zero module vanishes; every finite-cutoff product is 1.

Uses: Definition 3.1(ii): Membership controls the next element on the actual prefix quotient. Lemma 3.6(b): Equidimensional support turns its zero locus into the non-CM locus.

API:

- TauCeti.Kawasaki.annihilator_product_zero (simp): a_J(M,0) is the unit ideal, including when M=0.
- TauCeti.Kawasaki.annihilator_product_succ (simp): a_J(M,d+1)=a_J(M,d)·Ann_R H^d_J(M).
- TauCeti.Kawasaki.annihilator_product_le_factor (relation): For j<d the product is contained in Ann_R H^j_J(M).
- TauCeti.Kawasaki.annihilator_product_eq_top_of_vanishing (characterisation): If every H^j_J(M) for j<d is zero, then the product is the unit ideal.

Unit tests:

- TauCeti.Kawasaki.ann_product_empty (degenerate): For every J and M, a_J(M,0)=1.
- TauCeti.Kawasaki.ann_product_single (computation): The cutoff-one product is exactly Ann_R H^0_J(M), not its radical.
- TauCeti.Kawasaki.ann_product_zero_module (degenerate): All local cohomology of the zero module vanishes; every finite-cutoff product is 1.

### annihilator_product_zero

Declaration: TauCeti.Kawasaki.annihilator_product_zero. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product-zero.

a_J(M,0) is the unit ideal, including when M=0.

Apply the defining formula and the indicated prerequisites; a_J(M,0) is the unit ideal, including when M=0. Source: Definition 3.1(ii), Remark 3.3 and Lemma 3.6.

Acceptance: a_J(M,0) is the unit ideal, including when M=0.

### annihilator_product_succ

Declaration: TauCeti.Kawasaki.annihilator_product_succ. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product-succ.

a_J(M,d+1)=a_J(M,d)·Ann_R H^d_J(M).

Apply the defining formula and the indicated prerequisites; a_J(M,d+1)=a_J(M,d)·Ann_R H^d_J(M). Source: Definition 3.1(ii), Remark 3.3 and Lemma 3.6.

Acceptance: a_J(M,d+1)=a_J(M,d)·Ann_R H^d_J(M).

### annihilator_product_le_factor

Declaration: TauCeti.Kawasaki.annihilator_product_le_factor. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product-le-factor.

For j<d the product is contained in Ann_R H^j_J(M).

Apply the defining formula and the indicated prerequisites; For j<d the product is contained in Ann_R H^j_J(M). Source: Definition 3.1(ii), Remark 3.3 and Lemma 3.6.

Acceptance: For j<d the product is contained in Ann_R H^j_J(M).

### annihilator_product_eq_top_of_vanishing

Declaration: TauCeti.Kawasaki.annihilator_product_eq_top_of_vanishing. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product-eq-top-of-vanishing.

If every H^j_J(M) for j<d is zero, then the product is the unit ideal.

Apply the defining formula and the indicated prerequisites; If every H^j_J(M) for j<d is zero, then the product is the unit ideal. Source: Definition 3.1(ii), Remark 3.3 and Lemma 3.6.

Acceptance: If every H^j_J(M) for j<d is zero, then the product is the unit ideal.

### CM-secant sequences

Declaration: TauCeti.Kawasaki.is_cm_secant. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/is-cm-secant.

For finite M over Noetherian local (R,m), an ordered list rs is CM-secant iff every term lies in m; every successive prefix quotient strictly lowers support dimension; the final quotient is Cohen–Macaulay; and for each index i the element rs_i belongs to a_m(M/(rs before i)M,dim Supp(M/(rs before i)M)). Empty rs is allowed and is CM-secant exactly when M is CM. The zero module admits only the empty list. Terminal CM is required only for the final quotient, so prefixes are not asserted CM-secant.

Expand the requested R03.3 secant predicate on native quotients by Ideal.ofList prefixes. Express terminal CM by the requested Grothendieck vanishing criterion in terms of the native localCohomology functor; this is an expanded condition, not a competing generic CM definition. Each nonempty prefix before a step has a finite natural support-dimension witness by Noetherian locality and Nakayama; record that finiteness comparison as a supplier need. Source: Definition 3.1(ii).

Acceptance: The empty list is CM-secant on the one-dimensional vector space over Q; its support has dimension zero. [0] is not CM-secant on Q: the support dimension does not decrease. The empty list is CM-secant on the zero module. A nonempty list is never CM-secant on the zero module. For R=M=Q[[X]], the singleton [X] is CM-secant: support dimension drops from one to zero and H^0_m(R)=0. The singleton [X²] is also CM-secant on Q[[X]]; secancy is not restricted to a chosen uniformizer.

Uses: Proposition 3.11: Its initial prefixes satisfy three special sequence properties. Theorem 3.14: The full ordered list defines the prefix-product blowing-up ideal.

API:

- TauCeti.Kawasaki.cm_sect_mem_maximal (projection): Every element of a CM-secant sequence belongs to m.
- TauCeti.Kawasaki.cm_sect_dimension_drop (projection): Every step strictly decreases the dimension of the actual support of its prefix quotient.
- TauCeti.Kawasaki.cm_sect_terminal_vanishing (projection): The terminal quotient has zero local cohomology below its support dimension. Comparison with R03.3 identifies this with terminal CM.
- TauCeti.Kawasaki.cm_sect_ann_membership (projection): At every step there is a finite support-dimension witness d and the next term belongs to the product of local-cohomology annihilators on that prefix quotient.
- TauCeti.Kawasaki.cm_sect_empty_iff (characterisation): The empty list is CM-secant iff H^j_m(M)=0 for every j<dim Supp M, with zero M included.

Unit tests:

- TauCeti.Kawasaki.cm_sect_field_empty (computation): The empty list is CM-secant on the one-dimensional vector space over Q; its support has dimension zero.
- TauCeti.Kawasaki.cm_sect_field_zero_not (non-example): [0] is not CM-secant on Q: the support dimension does not decrease.
- TauCeti.Kawasaki.cm_sect_zero_empty (degenerate): The empty list is CM-secant on the zero module.
- TauCeti.Kawasaki.cm_sect_zero_nonempty_not (non-example): A nonempty list is never CM-secant on the zero module.
- TauCeti.Kawasaki.cm_sect_dvr_parameter (computation): For R=M=Q[[X]], the singleton [X] is CM-secant: support dimension drops from one to zero and H^0_m(R)=0.
- TauCeti.Kawasaki.cm_sect_dvr_square (computation): The singleton [X²] is also CM-secant on Q[[X]]; secancy is not restricted to a chosen uniformizer.

### cm_sect_mem_maximal

Declaration: TauCeti.Kawasaki.cm_sect_mem_maximal. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/cm-sect-mem-maximal.

Every element of a CM-secant sequence belongs to m.

Apply the defining formula and the indicated prerequisites; Every element of a CM-secant sequence belongs to m. Source: Definition 3.1(ii).

Acceptance: Every element of a CM-secant sequence belongs to m.

### cm_sect_dimension_drop

Declaration: TauCeti.Kawasaki.cm_sect_dimension_drop. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/cm-sect-dimension-drop.

Every step strictly decreases the dimension of the actual support of its prefix quotient.

Apply the defining formula and the indicated prerequisites; Every step strictly decreases the dimension of the actual support of its prefix quotient. Source: Definition 3.1(ii).

Acceptance: Every step strictly decreases the dimension of the actual support of its prefix quotient.

### cm_sect_terminal_vanishing

Declaration: TauCeti.Kawasaki.cm_sect_terminal_vanishing. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/cm-sect-terminal-vanishing.

The terminal quotient has zero local cohomology below its support dimension. Comparison with R03.3 identifies this with terminal CM.

Apply the defining formula and the indicated prerequisites; The terminal quotient has zero local cohomology below its support dimension. Comparison with R03.3 identifies this with terminal CM. Source: Definition 3.1(ii).

Acceptance: The terminal quotient has zero local cohomology below its support dimension. Comparison with R03.3 identifies this with terminal CM.

### cm_sect_ann_membership

Declaration: TauCeti.Kawasaki.cm_sect_ann_membership. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/cm-sect-ann-membership.

At every step there is a finite support-dimension witness d and the next term belongs to the product of local-cohomology annihilators on that prefix quotient.

Apply the defining formula and the indicated prerequisites; At every step there is a finite support-dimension witness d and the next term belongs to the product of local-cohomology annihilators on that prefix quotient. Source: Definition 3.1(ii).

Acceptance: At every step there is a finite support-dimension witness d and the next term belongs to the product of local-cohomology annihilators on that prefix quotient.

### cm_sect_empty_iff

Declaration: TauCeti.Kawasaki.cm_sect_empty_iff. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/cm-sect-empty-iff.

The empty list is CM-secant iff H^j_m(M)=0 for every j<dim Supp M, with zero M included.

Apply the defining formula and the indicated prerequisites; The empty list is CM-secant iff H^j_m(M)=0 for every j<dim Supp M, with zero M included. Source: Definition 3.1(ii).

Acceptance: The empty list is CM-secant iff H^j_m(M)=0 for every j<dim Supp M, with zero M included.

### Comparison with the imported CM and secant predicates

Declaration: TauCeti.Kawasaki.cm_secant_owner_comparison. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/cm-secant-owner-comparison.

For finite M over Noetherian local R, the native expanded CM-secant condition agrees with Definition 3.1(ii) using the R03.3 secant and CM predicates. Zero M has empty support and vacuous local-cohomology vanishing; the comparison must use E4’s support-restricted CM convention. Every nonzero prefix quotient has finite natural support dimension.

Apply the requested R03.3 local-cohomology criterion for CM and finite dimension of finite modules over a Noetherian local ring. Use Nakayama for proper prefix ideals to rule out a zero quotient when M is nonzero. Source: Definition 3.1 and §1.14, corrected E4.

Acceptance: For finite M over Noetherian local R, the native expanded CM-secant condition agrees with Definition 3.1(ii) using the R03.3 secant and CM predicates. Zero M has empty support and vacuous local-cohomology vanishing; the comparison must use E4’s support-restricted CM convention. Every nonzero prefix quotient has finite natural support dimension.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Schenzel’s secant torsion bound

Declaration: TauCeti.Kawasaki.schenzel_torsion_bound. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/schenzel-torsion-bound.

If r1,…,rs is a nonempty secant sequence for finite M over Noetherian local (R,m), then a_m(M,dim Supp M) kills the rs-torsion of M/(r1,…,r{s−1})M. No terminal-CM or dualizing-complex hypothesis is added.

Use Schenzel 2.4.2, quoted in Remark 3.3. Its proof remains a precise primary-source gap; this checkpoint does not claim that the citation is a one-page proof. Source: Remark 3.3.

Acceptance: For CM M the annihilator product is the unit ideal, so the last secant torsion is zero, recovering regular parameters.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Extending CM-secant sequences to parameters

Declaration: TauCeti.Kawasaki.cm_secant_extend_parameters. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/cm-secant-extend-parameters.

Every CM-secant sequence for nonzero finite M over Noetherian local R extends to a CM-secant system of parameters. Choose regular parameters of the CM terminal quotient, whose low-degree annihilator product is the unit ideal.

Use imported existence of systems of parameters and CM regular-parameter equivalence. Lift the terminal parameters and use the unit annihilator-product calculation on their successive CM quotients. Source: Remark 3.4.

Acceptance: Every CM-secant sequence for nonzero finite M over Noetherian local R extends to a CM-secant system of parameters. Choose regular parameters of the CM terminal quotient, whose low-degree annihilator product is the unit ideal.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Reversal and p-standard parameters

Declaration: TauCeti.Kawasaki.p_standard_reversal. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/p-standard-reversal.

For a system of parameters r1,…,rs of finite M, the list is CM-secant iff rs,…,r1 is a p-standard system of parameters of type s−1 in Kawasaki 2.6. This is an ordered reversal, not a claim of permutation invariance of CM-secant sequences.

Match the annihilator conditions with the primary p-standard definition NTC95 2.4 / Kaw00 2.6. Reading and transcribing that definition is an explicit source gap. Source: Remark 3.4.

Acceptance: Match the type s−1 parameters only after reversing all s terms; the empty-parameter case is governed separately by CM and empty-support conventions.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Annihilator preserved by the injective-hull dual

Declaration: TauCeti.Kawasaki.matlis_annihilator. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/matlis-annihilator.

For finite N over Noetherian local R and E the injective hull of the residue field, Ann_R N = Ann_R Hom_R(N,E).

The residue field is a quotient of every nonzero finite N by Nakayama and is a submodule of E. Thus Hom(-,E) detects zero on finite modules; exactness of Hom(-,E) detects the zero multiplication map for each scalar. Source: Lemma 3.6(a), proof.

Acceptance: For N=k the annihilator on either side is m, and for N=0 it is the unit ideal.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Local-duality annihilator identity

Declaration: TauCeti.Kawasaki.duality_annihilator. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/duality-annihilator.

For finite M over Noetherian local R with a normalized dualizing complex ω, and every integer j, Ann_R H^j_m(M)=Ann_R H^{-j}(RHom_R(M,ω)). Negative local-cohomology degrees are zero. The normalization is essential.

Apply imported AS.1 local duality and exactness of Hom into the injective hull. Apply the Matlis annihilator lemma to the finite dual cohomology module. Source: Lemma 3.6(a).

Acceptance: For a field R=k, normalized ω=k in degree zero and M=k: both degree-zero annihilators are zero and all other-degree annihilators are the unit ideal.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### The annihilator product and the CM locus

Declaration: TauCeti.Kawasaki.cm_locus_annihilator. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/cm-locus-annihilator.

For finite M with equidimensional support over Noetherian local R with normalized dualizing complex, V(a_m(M,dim Supp M)) is exactly the non-CM locus. The empty-support case gives the empty closed subset. Without equidimensionality this assertion is not made.

Replace local cohomology annihilators by finite dual-cohomology annihilators. Localize these finite annihilators; normalize ω at p by shift −dim(R/p). Use catenarity and equidimensional support to identify dim Supp M_p = dim Supp M − dim(R/p). Apply the imported local-cohomology CM criterion. Source: Lemma 3.6(b).

Acceptance: For M=R with R a CM local ring admitting ω, the product is the unit ideal and the non-CM locus is empty; require equidimensional support in the general statement.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### The defect set for arbitrary support

Declaration: TauCeti.Kawasaki.nonequidimensional_defect. Node: DeformationAndDerivedPatchingAlgebraPartII:K0/nonequidimensional-defect.

Without equidimensionality, under the hypotheses of Lemma 3.6, V(a_m(M,dim Supp M)) equals {p in Supp M : depth_{R_p} M_p + dim(R/p) < dim Supp M}. It contains every irreducible component of nonmaximal dimension.

Apply Schenzel 2.4.6 as cited in Remark 3.7; the primary proof is an explicit source gap. At the generic point of a lower-dimensional support component, depth is zero. Source: Remark 3.7.

Acceptance: For R=k[[x,y,z]]/((x)∩(y,z)) and M=R, the generic point (y,z) of the one-dimensional support component satisfies 0+1<2 and belongs to the defect set.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

Coverage: partial. Remaining:

- Read Sche82 2.4.2/2.4.6 and Kaw00 2.6 / NTC95 2.4.
- Bind the R03.3 CM/secant and AS.1 duality comparisons to supplier definitions and elaborate their signatures.

## K1. Huneke d-sequences and power intersections

Define d-sequences on arbitrary modules over commutative rings. Prove the corrected torsion/colon characterization with r_j rather than r_i, native weak-regular compatibility and the two separate Goto–Yamagishi intersection identities. Include zero, unit and order-sensitive tests.

Dependencies: the pinned module, quotient and ideal baseline.

### Huneke d-sequences

Declaration: TauCeti.Kawasaki.is_d_sequence. Node: DeformationAndDerivedPatchingAlgebraPartII:K1/is-d-sequence.

For any R-module M over any commutative ring, an ordered list rs is a d-sequence iff each rs_i is injective on (Ideal(rs)M)/(Ideal(rs before i)M), viewed as an actual submodule of M/(Ideal(rs before i)M). Equivalently use Ideal(rs) times the top submodule of this actual quotient. There is no properness, localness, finiteness or nonzero-module assumption.

Use native Ideal.ofList and quotient modules. Restrict scalar multiplication to the ideal-generated submodule of each actual prefix quotient and apply native IsSMulRegular. Source: Definition 3.8.

Acceptance: Every module admits the empty d-sequence. [0] is a d-sequence on nonzero Q, but it is not weakly regular there. [1] is a d-sequence on Q, but it is not a native regular sequence because its final quotient is zero. [2,0] is a d-sequence on Z. [0,2] is not a d-sequence on Z: zero multiplication on 2Z is not injective.

Uses: Remark 3.10: Its injectivity on the ideal-generated image is the n=1 colon-intersection equality. Proposition 3.11(i): The reversal of every selected CM-secant prefix is a d-sequence after the specified auxiliary quotient.

API:

- TauCeti.Kawasaki.dseq_empty (simp): The empty list is a d-sequence for every module.
- TauCeti.Kawasaki.dseq_zero_module (example): Every list is a d-sequence on a zero module.
- TauCeti.Kawasaki.dseq_of_weakly_regular (compatibility): Every native weakly regular sequence is a d-sequence by restriction of injectivity. No properness is required.
- TauCeti.Kawasaki.dseq_singleton_iff (characterisation): [r] is a d-sequence iff multiplication by r is injective on rM.
- TauCeti.Kawasaki.dseq_linear_equiv (functoriality): An R-linear equivalence of actual modules preserves the d-sequence predicate.
- TauCeti.Kawasaki.dseq_colon_iff (characterisation): A list rs is a d-sequence iff for every i≤j, the rs_j-torsion and rs_i·rs_j-torsion in M/(rs before i)M agree. This corrects E5; replacing rs_j by rs_i is false.

Unit tests:

- TauCeti.Kawasaki.dseq_empty_test (degenerate): Every module admits the empty d-sequence.
- TauCeti.Kawasaki.dseq_zero_singleton (non-example): [0] is a d-sequence on nonzero Q, but it is not weakly regular there.
- TauCeti.Kawasaki.dseq_one_singleton (non-example): [1] is a d-sequence on Q, but it is not a native regular sequence because its final quotient is zero.
- TauCeti.Kawasaki.dseq_order_forward (computation): [2,0] is a d-sequence on Z.
- TauCeti.Kawasaki.dseq_order_reverse_not (non-example): [0,2] is not a d-sequence on Z: zero multiplication on 2Z is not injective.

### dseq_empty

Declaration: TauCeti.Kawasaki.dseq_empty. Node: DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-empty.

The empty list is a d-sequence for every module.

Apply the defining formula and the indicated prerequisites; The empty list is a d-sequence for every module. Source: Definition 3.8.

Acceptance: The empty list is a d-sequence for every module.

### dseq_zero_module

Declaration: TauCeti.Kawasaki.dseq_zero_module. Node: DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-zero-module.

Every list is a d-sequence on a zero module.

Apply the defining formula and the indicated prerequisites; Every list is a d-sequence on a zero module. Source: Definition 3.8.

Acceptance: Every list is a d-sequence on a zero module.

### dseq_of_weakly_regular

Declaration: TauCeti.Kawasaki.dseq_of_weakly_regular. Node: DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-of-weakly-regular.

Every native weakly regular sequence is a d-sequence by restriction of injectivity. No properness is required.

Apply the defining formula and the indicated prerequisites; Every native weakly regular sequence is a d-sequence by restriction of injectivity. No properness is required. Source: Definition 3.8.

Acceptance: Every native weakly regular sequence is a d-sequence by restriction of injectivity. No properness is required.

### dseq_singleton_iff

Declaration: TauCeti.Kawasaki.dseq_singleton_iff. Node: DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-singleton-iff.

[r] is a d-sequence iff multiplication by r is injective on rM.

Apply the defining formula and the indicated prerequisites; [r] is a d-sequence iff multiplication by r is injective on rM. Source: Definition 3.8.

Acceptance: [r] is a d-sequence iff multiplication by r is injective on rM.

### dseq_linear_equiv

Declaration: TauCeti.Kawasaki.dseq_linear_equiv. Node: DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-linear-equiv.

An R-linear equivalence of actual modules preserves the d-sequence predicate.

Apply the defining formula and the indicated prerequisites; An R-linear equivalence of actual modules preserves the d-sequence predicate. Source: Definition 3.8.

Acceptance: An R-linear equivalence of actual modules preserves the d-sequence predicate.

### dseq_colon_iff

Declaration: TauCeti.Kawasaki.dseq_colon_iff. Node: DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-colon-iff.

A list rs is a d-sequence iff for every i≤j, the rs_j-torsion and rs_i·rs_j-torsion in M/(rs before i)M agree. This corrects E5; replacing rs_j by rs_i is false.

Apply the defining formula and the indicated prerequisites; A list rs is a d-sequence iff for every i≤j, the rs_j-torsion and rs_i·rs_j-torsion in M/(rs before i)M agree. This corrects E5; replacing rs_j by rs_i is false. Source: Definition 3.8.

Acceptance: A list rs is a d-sequence iff for every i≤j, the rs_j-torsion and rs_i·rs_j-torsion in M/(rs before i)M agree. This corrects E5; replacing rs_j by rs_i is false.

### Goto–Yamagishi colon intersection

Declaration: TauCeti.Kawasaki.goto_yamagishi_colon. Node: DeformationAndDerivedPatchingAlgebraPartII:K1/goto-yamagishi-colon.

For a d-sequence rs on M, let Q_i=(r1,…,r{i−1})M and J=(rs). For n≥1 and 1≤i≤s, (Q_i :_M r_i) ∩ J^nM = Q_i ∩ J^nM.

The n=1 case follows from the d-sequence injectivity on JM/Q_i. For any n≥1, J^nM⊆JM, so the same injectivity proves the equality. Source: Remark 3.10, first equality.

Acceptance: For a d-sequence rs on M, let Q_i=(r1,…,r{i−1})M and J=(rs). For n≥1 and 1≤i≤s, (Q_i :_M r_i) ∩ J^nM = Q_i ∩ J^nM.

### Goto–Yamagishi power intersection

Declaration: TauCeti.Kawasaki.goto_yamagishi_intersection. Node: DeformationAndDerivedPatchingAlgebraPartII:K1/goto-yamagishi-intersection.

With the same hypotheses, Q_i ∩ J^nM = (r1,…,r{i−1})J^{n−1}M for n≥1, 1≤i≤s.

Induct increasingly on n and decreasingly on i, with the auxiliary terminal case i=s+1. For i=s+1 use J^nM=J·J^{n−1}M; for n=1 use Q_i⊆JM. Write x∈Q_i∩J^nM as x=y+r_i z with y∈Q_i J^{n−1}M using the descending i induction. Then z belongs to (Q_i:r_i)∩J^{n−1}M; apply the colon equality and the increasing n induction. At n=1 use the base case rather than referring to the n=0 colon identity. Source: Remark 3.10, second equality and proof.

Acceptance: With the same hypotheses, Q_i ∩ J^nM = (r1,…,r{i−1})J^{n−1}M for n≥1, 1≤i≤s.

Coverage: planned. Remaining:

- Split the two inductions of the Goto–Yamagishi intersection proof into separately typed leaves if their implementation exceeds the source-size bound; typed statements and corrected colon condition are present.

## K2. Kawasaki’s prefix-product sequence calculus

Define products of successive prefix ideals and the unit/successor/prefix formulas. Prove Proposition 3.11 in its three separate clauses: reversed d-sequences after auxiliary secant quotients, power-torsion equality, and regularity lifting for the last auxiliary parameter. Prove robustness under those quotients.

Dependencies: DeformationAndDerivedPatchingAlgebraPartII:K0, DeformationAndDerivedPatchingAlgebraPartII:K1, DeformationAndDerivedPatchingAlgebra:R03.3.

### Products of successive prefix ideals

Declaration: TauCeti.Kawasaki.prefix_product. Node: DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product.

For an ordered list rs define I_s = product_{0≤i<s} Ideal.ofList(rs.take(i+1)). For 0≤s≤length rs this is exactly product_{i=1}^s (r1,…,ri). I_0 is the unit ideal; I_s is not the s-th power of the whole prefix ideal. The definition is total for all natural s but uses with s beyond the length are not part of the theorem.

Take a finite product of the native prefix ideals; the empty product is top. Source: Proposition 3.11, definition of I_j; proof of Theorem 3.14 corrected E7.

Acceptance: The empty-stage product is the unit ideal. I_2 for [a,b] equals (a)(a,b). For R=Z and rs=[2,3], I_2=(2) while (2,3)^2=Z, so these ideals differ. A zero first term makes every positive prefix product zero, even when later terms generate the unit ideal.

Uses: Proposition 3.11(ii),(iii): The actual product powers govern torsion and regularity. Theorem 3.14: The recurrence supplies the iterated blowing-up centre.

API:

- TauCeti.Kawasaki.prefix_product_zero (simp): I_0=1.
- TauCeti.Kawasaki.prefix_product_succ (relation): I_{s+1}=I_s·(r1,…,r{s+1}).
- TauCeti.Kawasaki.prefix_product_one (simp): I_1=(r1) for a nonempty list.
- TauCeti.Kawasaki.prefix_product_take (compatibility): For s≤length rs, computing I_s from rs.take s gives the same ideal.

Unit tests:

- TauCeti.Kawasaki.prefix_product_empty_test (degenerate): The empty-stage product is the unit ideal.
- TauCeti.Kawasaki.prefix_product_two_test (computation): I_2 for [a,b] equals (a)(a,b).
- TauCeti.Kawasaki.prefix_product_wrong_power (non-example): For R=Z and rs=[2,3], I_2=(2) while (2,3)^2=Z, so these ideals differ.
- TauCeti.Kawasaki.prefix_product_zero_first (computation): A zero first term makes every positive prefix product zero, even when later terms generate the unit ideal.

### prefix_product_zero

Declaration: TauCeti.Kawasaki.prefix_product_zero. Node: DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product-zero.

I_0=1.

Apply the defining formula and the indicated prerequisites; I_0=1. Source: Proposition 3.11, definition of I_j; proof of Theorem 3.14 corrected E7.

Acceptance: I_0=1.

### prefix_product_succ

Declaration: TauCeti.Kawasaki.prefix_product_succ. Node: DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product-succ.

I_{s+1}=I_s·(r1,…,r{s+1}).

Apply the defining formula and the indicated prerequisites; I_{s+1}=I_s·(r1,…,r{s+1}). Source: Proposition 3.11, definition of I_j; proof of Theorem 3.14 corrected E7.

Acceptance: I_{s+1}=I_s·(r1,…,r{s+1}).

### prefix_product_one

Declaration: TauCeti.Kawasaki.prefix_product_one. Node: DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product-one.

I_1=(r1) for a nonempty list.

Apply the defining formula and the indicated prerequisites; I_1=(r1) for a nonempty list. Source: Proposition 3.11, definition of I_j; proof of Theorem 3.14 corrected E7.

Acceptance: I_1=(r1) for a nonempty list.

### prefix_product_take

Declaration: TauCeti.Kawasaki.prefix_product_take. Node: DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product-take.

For s≤length rs, computing I_s from rs.take s gives the same ideal.

Apply the defining formula and the indicated prerequisites; For s≤length rs, computing I_s from rs.take s gives the same ideal. Source: Proposition 3.11, definition of I_j; proof of Theorem 3.14 corrected E7.

Acceptance: For s≤length rs, computing I_s from rs.take s gives the same ideal.

### Reversed prefixes after auxiliary secant quotients

Declaration: TauCeti.Kawasaki.kawasaki_reversed_dseq. Node: DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-reversed-dseq.

Let r1,…,rt be CM-secant for M and 0≤s≤t. Let a1,…,au∈m be secant for M/(r1,…,rs)M, and set M′=M/(a1,…,au)M. Then rs,…,r1 is a d-sequence for M′. The reversal and the ambient module quotient are essential.

Apply the corrected module form of Kawasaki Proposition 3.11(i). The reduction through Kaw00 2.9, 2.10, 3.1 and Kaw02 3.6 is a source gap, not an opaque baseline fact. Source: Proposition 3.11(i).

Acceptance: With no auxiliary parameters, the theorem still produces the reversed selected prefix on the original M; it does not assert unreversed d-regularity.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Torsion in prefix-product-power quotients

Declaration: TauCeti.Kawasaki.kawasaki_torsion. Node: DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-torsion.

With r, s, auxiliary a and M′ as above, for s≥2 and m,n>0, the r_s^m-torsion of M′/I_{s−1}^nM′ equals its (r1,…,rs)-torsion. Powers and auxiliary secant hypotheses are retained.

Apply Proposition 3.11(ii); its cited primary induction remains a source gap. Source: Proposition 3.11(ii).

Acceptance: The test of the clause retains s≥2 and both m,n positive; its torsion ideal is the full selected prefix, not only the previous prefix.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Lifting the last auxiliary regular element

Declaration: TauCeti.Kawasaki.kawasaki_aux_regular. Node: DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-aux-regular.

For a nonempty auxiliary secant list a1,…,au on M/(r1,…,rs)M, put M′=M/(a1,…,a{u−1})M. If a_u is regular on M′/(r1,…,rs)M′, then a_u is regular on M′ and on M′/I_s^nM′ for every n>0. The element is a_u, not r_u (E6).

Apply the corrected Proposition 3.11(iii) and the injectivity, not properness, part of regularity. Track the auxiliary quotient before its last term; do not replace it by the quotient by all a terms. Source: Proposition 3.11(iii), corrected E6.

Acceptance: For a one-term auxiliary list [a], the conclusion concerns regularity of a on M and the product-power quotients, not the first original parameter.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Robustness under auxiliary secant quotients

Declaration: TauCeti.Kawasaki.kawasaki_robustness. Node: DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-robustness.

For a selected prefix of a CM-secant sequence, conditions (i),(ii),(iii) of Proposition 3.11 continue to hold after quotienting M by an auxiliary secant sequence on its terminal prefix quotient. This preserves the three conditions, not a blanket assertion that every prefix is CM-secant.

Concatenate any further auxiliary secant list with the one already divided out. Apply each of the three preceding clauses to the concatenated list and use canonical quotient-by-sum equivalences from R03.3. Source: Remark 3.12.

Acceptance: For a selected prefix of a CM-secant sequence, conditions (i),(ii),(iii) of Proposition 3.11 continue to hold after quotienting M by an auxiliary secant sequence on its terminal prefix quotient. This preserves the three conditions, not a blanket assertion that every prefix is CM-secant.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

Coverage: partial. Remaining:

- Read and split the corrected Kaw00/Kaw02 induction; type auxiliary secant quantifiers and Proposition 3.11(i)–(iii) and robustness against the owner’s secant predicate.

## K3. Rees modules and module blowing-ups

Construct the graded Rees module over the native Rees algebra and sheafify it on the imported scheme blowup. Prove chart image and exceptional-kernel formulas, agreement with the imported module strict transform, two-ideal module comparison, support identification and the Rees/Proj dimension bound. Do not rebuild scheme blowups.

Dependencies: DeformationAndDerivedPatchingAlgebraPartII:K2, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, AdicCoefficientsAndComparisons:L5, DeformationAndDerivedPatchingAlgebra:R03.3.

### The graded Rees module

Declaration: TauCeti.Kawasaki.rees_module. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module.

For an ideal I and arbitrary R-module M, the Rees module is the native polynomial-module submodule whose coefficient of degree n belongs to I^nM. It is a module over the existing reesAlgebra I by convolution. Its degree n is I^nM, including degree zero M; it is not M tensored with the Rees algebra, which can carry extra torsion.

Use PolynomialModule R M as ambient carrier and restrict scalar action from R[X] to reesAlgebra I. Define coefficientwise membership and prove closure using PolynomialModule.smul_apply, the ideal-power convolution and finite sums. Source: §3.13, the graded module ⊕ I^nM.

Acceptance: Every singleton in degree zero belongs, even for I=0. For R=M=Z and I=0, the singleton 1 in degree one does not belong. For unit ideal the carrier is the entire polynomial module. For I=(2) in Z and M=Z/2, the degree-one singleton 1 is excluded although tensoring M with the polynomial Rees algebra would retain a degree-one generator.

Uses: §3.13: Sheafification over Proj gives the module blowing-up. Theorem 3.14, regular-terminal-element reduction: Comparison with the quotient graded module has a degreewise snake-lemma kernel.

API:

- TauCeti.Kawasaki.rees_module_mem (characterisation): Membership is coefficientwise membership in the actual powers I^nM.
- TauCeti.Kawasaki.rees_module_single (constructor): A degree-n singleton belongs iff its coefficient belongs to I^nM.
- TauCeti.Kawasaki.rees_module_unit (simp): For I=1 the Rees module is the whole polynomial module.
- TauCeti.Kawasaki.rees_module_zero_ideal (simp): For I=0 only degree-zero coefficients may be nonzero.

Unit tests:

- TauCeti.Kawasaki.rees_module_degree_zero (computation): Every singleton in degree zero belongs, even for I=0.
- TauCeti.Kawasaki.rees_module_zero_ideal_nonexample (non-example): For R=M=Z and I=0, the singleton 1 in degree one does not belong.
- TauCeti.Kawasaki.rees_module_unit_test (degenerate): For unit ideal the carrier is the entire polynomial module.
- TauCeti.Kawasaki.rees_module_torsion_test (non-example): For I=(2) in Z and M=Z/2, the degree-one singleton 1 is excluded although tensoring M with the polynomial Rees algebra would retain a degree-one generator.

### rees_module_mem

Declaration: TauCeti.Kawasaki.rees_module_mem. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module-mem.

Membership is coefficientwise membership in the actual powers I^nM.

Apply the defining formula and the indicated prerequisites; Membership is coefficientwise membership in the actual powers I^nM. Source: §3.13, the graded module ⊕ I^nM.

Acceptance: Membership is coefficientwise membership in the actual powers I^nM.

### rees_module_single

Declaration: TauCeti.Kawasaki.rees_module_single. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module-single.

A degree-n singleton belongs iff its coefficient belongs to I^nM.

Apply the defining formula and the indicated prerequisites; A degree-n singleton belongs iff its coefficient belongs to I^nM. Source: §3.13, the graded module ⊕ I^nM.

Acceptance: A degree-n singleton belongs iff its coefficient belongs to I^nM.

### rees_module_unit

Declaration: TauCeti.Kawasaki.rees_module_unit. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module-unit.

For I=1 the Rees module is the whole polynomial module.

Apply the defining formula and the indicated prerequisites; For I=1 the Rees module is the whole polynomial module. Source: §3.13, the graded module ⊕ I^nM.

Acceptance: For I=1 the Rees module is the whole polynomial module.

### rees_module_zero_ideal

Declaration: TauCeti.Kawasaki.rees_module_zero_ideal. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module-zero-ideal.

For I=0 only degree-zero coefficients may be nonzero.

Apply the defining formula and the indicated prerequisites; For I=0 only degree-zero coefficients may be nonzero. Source: §3.13, the graded module ⊕ I^nM.

Acceptance: For I=0 only degree-zero coefficients may be nonzero.

### Blowing up a module

Declaration: TauCeti.Kawasaki.module_blowup. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup.

For finite M over Noetherian R and ideal I, Bl_I(M) is the sheaf on Bl_I(R)=Proj(Rees_R(I)) associated to the graded Rees module ⊕I^nM. On the i-chart for i∈I, its module is the R_(i)-submodule of M[1/i] generated by the image of M, where R_(i)⊂R[1/i] is the imported blow-up chart. It is the image construction, not the full tensor product.

Import the actual relative Proj, blowup scheme and affine chart carriers from StableReduction Layer 4. Sheafify the graded Rees module by degree-zero homogeneous localization and glue via the imported Proj chart overlap maps. Identify the localized graded module with the submodule generated by the image of M in M[1/i]. Source: §3.13.

Acceptance: For I=R, Bl_I(R)=Spec R and Bl_I(M) is the ordinary affine sheaf associated to M. For a principal ideal (r), Bl_(r)(M) is the sheaf of M/M⟨r^∞⟩ on the principal blowup scheme; do not assert M is unchanged when r is a zero divisor. For R=Z, I=(2), M=Z/2, the module blowing-up is zero on Bl_(2)(Z)=Spec Z, while the ordinary pullback of M is nonzero.

Uses: Theorem 3.14: The final theorem concerns this actual coherent sheaf. §3.13: The image chart proves the strict-transform comparison and exceptional torsion control.

API:

- TauCeti.Kawasaki.module_blowup_chart (data): On the imported i-chart, sections are the submodule M_(i) of M[1/i] generated by M over R_(i).
- TauCeti.Kawasaki.module_blowup_off_center (compatibility): Restriction over Spec R minus V(I) is canonically the original sheaf of M.
- TauCeti.Kawasaki.module_blowup_map (functoriality): Every R-linear map M→N induces Bl_I(M)→Bl_I(N) by its actual maps on the Rees-module coefficients.
- TauCeti.Kawasaki.module_blowup_map_id (simp): The induced blowing-up map of the identity M→M is the identity sheaf morphism.
- TauCeti.Kawasaki.module_blowup_map_comp (functoriality): For R-linear maps f:M→N and g:N→P, the blowing-up map of g composed with f equals the composite of their sheaf maps.
- TauCeti.Kawasaki.module_blowup_zero (simp): Bl_I(0) is the zero sheaf on Bl_I(R).
- TauCeti.Kawasaki.module_blowup_self (compatibility): Bl_I(R), as a module blowing-up of R itself, is the structure sheaf of the blowup scheme.
- TauCeti.Kawasaki.module_blowup_chart_surjection (projection): The natural tensor pullback M⊗_R R_(i)→M_(i) is surjective, with kernel supported on the exceptional divisor.

Unit tests:

- TauCeti.Kawasaki.module_blowup_unit (degenerate): For I=R, Bl_I(R)=Spec R and Bl_I(M) is the ordinary affine sheaf associated to M.
- TauCeti.Kawasaki.module_blowup_principal (compatibility): For a principal ideal (r), Bl_(r)(M) is the sheaf of M/M⟨r^∞⟩ on the principal blowup scheme; do not assert M is unchanged when r is a zero divisor.
- TauCeti.Kawasaki.module_blowup_zmod_two (non-example): For R=Z, I=(2), M=Z/2, the module blowing-up is zero on Bl_(2)(Z)=Spec Z, while the ordinary pullback of M is nonzero.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### module_blowup_chart

Declaration: TauCeti.Kawasaki.module_blowup_chart. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup-chart.

On the imported i-chart, sections are the submodule M_(i) of M[1/i] generated by M over R_(i).

Apply the defining formula and the indicated prerequisites; On the imported i-chart, sections are the submodule M_(i) of M[1/i] generated by M over R_(i). Source: §3.13.

Acceptance: On the imported i-chart, sections are the submodule M_(i) of M[1/i] generated by M over R_(i).

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### module_blowup_off_center

Declaration: TauCeti.Kawasaki.module_blowup_off_center. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup-off-center.

Restriction over Spec R minus V(I) is canonically the original sheaf of M.

Apply the defining formula and the indicated prerequisites; Restriction over Spec R minus V(I) is canonically the original sheaf of M. Source: §3.13.

Acceptance: Restriction over Spec R minus V(I) is canonically the original sheaf of M.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### module_blowup_map

Declaration: TauCeti.Kawasaki.module_blowup_map. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup-map.

Every R-linear map M→N induces Bl_I(M)→Bl_I(N) by its actual maps on the Rees-module coefficients.

Apply the defining formula and the indicated prerequisites; Every R-linear map M→N induces Bl_I(M)→Bl_I(N) by its actual maps on the Rees-module coefficients. Source: §3.13.

Acceptance: Every R-linear map M→N induces Bl_I(M)→Bl_I(N) by its actual maps on the Rees-module coefficients.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### module_blowup_map_id

Declaration: TauCeti.Kawasaki.module_blowup_map_id. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup-map-id.

The induced blowing-up map of the identity M→M is the identity sheaf morphism.

Apply the defining formula and the indicated prerequisites; The induced blowing-up map of the identity M→M is the identity sheaf morphism. Source: §3.13.

Acceptance: The induced blowing-up map of the identity M→M is the identity sheaf morphism.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### module_blowup_map_comp

Declaration: TauCeti.Kawasaki.module_blowup_map_comp. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup-map-comp.

For R-linear maps f:M→N and g:N→P, the blowing-up map of g composed with f equals the composite of their sheaf maps.

Apply the defining formula and the indicated prerequisites; For R-linear maps f:M→N and g:N→P, the blowing-up map of g composed with f equals the composite of their sheaf maps. Source: §3.13.

Acceptance: For R-linear maps f:M→N and g:N→P, the blowing-up map of g composed with f equals the composite of their sheaf maps.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### module_blowup_zero

Declaration: TauCeti.Kawasaki.module_blowup_zero. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup-zero.

Bl_I(0) is the zero sheaf on Bl_I(R).

Apply the defining formula and the indicated prerequisites; Bl_I(0) is the zero sheaf on Bl_I(R). Source: §3.13.

Acceptance: Bl_I(0) is the zero sheaf on Bl_I(R).

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### module_blowup_self

Declaration: TauCeti.Kawasaki.module_blowup_self. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup-self.

Bl_I(R), as a module blowing-up of R itself, is the structure sheaf of the blowup scheme.

Apply the defining formula and the indicated prerequisites; Bl_I(R), as a module blowing-up of R itself, is the structure sheaf of the blowup scheme. Source: §3.13.

Acceptance: Bl_I(R), as a module blowing-up of R itself, is the structure sheaf of the blowup scheme.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### module_blowup_chart_surjection

Declaration: TauCeti.Kawasaki.module_blowup_chart_surjection. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup-chart-surjection.

The natural tensor pullback M⊗_R R_(i)→M_(i) is surjective, with kernel supported on the exceptional divisor.

Apply the defining formula and the indicated prerequisites; The natural tensor pullback M⊗_R R_(i)→M_(i) is surjective, with kernel supported on the exceptional divisor. Source: §3.13.

Acceptance: The natural tensor pullback M⊗_R R_(i)→M_(i) is surjective, with kernel supported on the exceptional divisor.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Comparison with Raynaud–Gruson strict transform

Declaration: TauCeti.Kawasaki.module_strict_transform. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-strict-transform.

Under the identification of the imported scheme blowup, Bl_I(M) is canonically the Raynaud–Gruson strict transform: quotient of the pullback sheaf by sections supported on the exceptional divisor. On each chart this is the map to the image submodule in M[1/i].

Apply the chart surjection and identify its kernel with sections killed by some power of the exceptional generator. Glue the resulting chart isomorphisms and compare with the L5 module strict-transform definition. Source: §3.13.

Acceptance: For R=Z, I=(2), M=Z/2, both sides are zero while the unreduced pullback is nonzero.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Two-ideal module blowing-up identity

Declaration: TauCeti.Kawasaki.module_two_ideal. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/module-two-ideal.

For ideals I,J in Noetherian R, over the imported scheme isomorphism Bl_IJ(R)≅Bl_I(Bl_J(R)), the corresponding module Bl_IJ(M) is canonically the iterated module blowing-up Bl_I(Bl_J(M)). The second centre is the pulled-back ideal, and the isomorphism is tracked on the actual charts.

Import the scheme two-ideal identity from StableReduction Layer 4, not as a new scheme theorem here. Identify the module images after the successive homogeneous localizations with the direct IJ-chart image in M[1/(ij)]. Glue these module identifications over the scheme isomorphism. Source: §3.13, final paragraph.

Acceptance: For ideals I,J in Noetherian R, over the imported scheme isomorphism Bl_IJ(R)≅Bl_I(Bl_J(R)), the corresponding module Bl_IJ(M) is canonically the iterated module blowing-up Bl_I(Bl_J(M)). The second centre is the pulled-back ideal, and the isomorphism is tracked on the actual charts.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Support of a module blowing-up

Declaration: TauCeti.Kawasaki.blowup_support. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/blowup-support.

For finite M and A=R/Ann_R M, the support of Bl_I(M) is the closed blowup Bl_{IA}(Spec A) inside Bl_I(Spec R). This is the scheme-support comparison required before applying the Rees dimension argument.

Use imported finite-module support and strict-transform support comparison (Stacks 080E as cited by accepted item 86). Check the actual closed immersion and support topology, rather than only an abstract ring quotient. Source: Theorem 3.14 dimension reduction; accepted extraction item 86.

Acceptance: For finite M and A=R/Ann_R M, the support of Bl_I(M) is the closed blowup Bl_{IA}(Spec A) inside Bl_I(Spec R). This is the scheme-support comparison required before applying the Rees dimension argument.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Dimension of the Rees algebra

Declaration: TauCeti.Kawasaki.rees_dimension_bound. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/rees-dimension-bound.

For a finite-dimensional Noetherian ring A and ideal J, dim A[Jt]≤dim A+1. Reduction to minimal primes and a finitely generated domain algebra of transcendence degree at most one gives the inequality. No equality is asserted for J=0.

Read the precise HIO 12.14 statement and supply the dimension inequality for finite-type domain extensions over a general Noetherian base. This is a named missing input; a field-only transcendence-degree theorem is not sufficient. Source: Accepted extraction item 86, HIO88 12.14 cited there.

Acceptance: For J=0 the Rees ring is A itself, and only the inequality is asserted.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Appending the irrelevant homogeneous prime

Declaration: TauCeti.Kawasaki.proj_prime_chain. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/proj-prime-chain.

For S=A[Jt], every chain of homogeneous primes corresponding to points of Proj S can be enlarged by the homogeneous prime (P_last∩A)⊕S_+. Hence dim Proj S≤dim S−1 whenever Proj S is nonempty; for empty Proj use dimension bottom.

Use the imported Proj homogeneous-prime model. The appended prime contains S_+, so it is strictly above the last prime, which does not contain S_+. Source: Accepted extraction item 86.

Acceptance: For a unit centre S=A[t], Proj S=Spec A and the homogeneous-prime chain is extended by its irrelevant prime.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Dimension bound for the blowing-up support

Declaration: TauCeti.Kawasaki.blowup_support_dimension. Node: DeformationAndDerivedPatchingAlgebraPartII:K3/blowup-support-dimension.

For finite M over Noetherian local R, dim Supp Bl_I(M)≤dim Supp M, including the zero-module empty-support case. Apply the Rees bound to A=R/Ann M and the projective prime-chain bound to the support blowup.

Apply support identification with Bl_{IA}(Spec A). Combine dim Proj A[IAt]≤dim A[IAt]−1≤dim A. Use the existing supportDim quotient-annihilator identity; handle empty support separately. Source: Accepted extraction item 86.

Acceptance: For the unit ideal the support-dimension inequality is equality; for the zero module both sides have empty-support dimension bottom.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

Coverage: partial. Remaining:

- Bind module blowing-up, all eight API items and three tests to actual SR4/L5 carriers.
- Read HIO88 12.14; type the support and projective-prime-chain comparisons.

## K4. Cohen–Macaulay blowing-ups

Prove the regular-terminal-element reduction and dimension-zero depth induction, with Claims 3.14.5 and 3.14.6 and the actual chart relation r_bT−r_a. Derive the theorem first under the weaker prefix conditions and then for CM-secant sequences. Exhibit the cited CM-ring/maximal-ideal-blowup nonexample.

Dependencies: DeformationAndDerivedPatchingAlgebraPartII:K0, DeformationAndDerivedPatchingAlgebraPartII:K1, DeformationAndDerivedPatchingAlgebraPartII:K2, DeformationAndDerivedPatchingAlgebraPartII:K3, DeformationAndDerivedPatchingAlgebra:R03.3.

### Regular terminal-element reduction

Declaration: TauCeti.Kawasaki.regular_terminal_quotient. Node: DeformationAndDerivedPatchingAlgebraPartII:K4/regular-terminal-quotient.

Assume the weaker hypothesis of Theorem 3.14: every initial prefix satisfies Proposition 3.11(i)–(iii), and the final quotient is CM. If its dimension is positive, choose r′∈m regular on it. Then r′ is regular on M and on M/I_s^nM for every s and n>0, and Bl_{I_s}(M)/r′ equals Bl_{I_s}(M/r′M) under the imported scheme base-change identification.

Apply corrected Proposition 3.11(iii) with the one-element auxiliary list [r′]. The degreewise comparison I_s^nM/r′I_s^nM→I_s^n(M/r′M) is an isomorphism by the multiplication snake lemma and regularity on M/I_s^nM. Sheafify the actual graded comparison; use robustness for the quotient and descend the induction by a regular element. Source: Theorem 3.14, first reduction.

Acceptance: Assume the weaker hypothesis of Theorem 3.14: every initial prefix satisfies Proposition 3.11(i)–(iii), and the final quotient is CM. If its dimension is positive, choose r′∈m regular on it. Then r′ is regular on M and on M/I_s^nM for every s and n>0, and Bl_{I_s}(M)/r′ equals Bl_{I_s}(M/r′M) under the imported scheme base-change identification.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### The empty and principal blowing-up stages

Declaration: TauCeti.Kawasaki.principal_stage. Node: DeformationAndDerivedPatchingAlgebraPartII:K4/principal-stage.

In Theorem 3.14’s dimension-zero-terminal reduction, the s=0 stage has unit ideal and is the original module, and the s=1 stage has Bl_(r1)(M)=M/M⟨r1^∞⟩ with r1 regular on this quotient. These are the base cases for the depth induction.

Use the unit and principal chart comparisons for module blowing-ups. Use the imported local-cohomology depth criterion and principal torsion quotient. Source: Theorem 3.14, s=0 and s=1 cases.

Acceptance: In Theorem 3.14’s dimension-zero-terminal reduction, the s=0 stage has unit ideal and is the original module, and the s=1 stage has Bl_(r1)(M)=M/M⟨r1^∞⟩ with r1 regular on this quotient. These are the base cases for the depth induction.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### The two-generator chart presentation

Declaration: TauCeti.Kawasaki.two_generator_chart. Node: DeformationAndDerivedPatchingAlgebraPartII:K4/two-generator-chart.

For s≥2, at a point of the previous prefix-product blowing-up choose a generator r_i of the previous prefix ideal. It is regular on the local chart ring R′ and module M′. For {a,b}={i,s}, the current chart module at a closed point is (M′⊗R′[T])/(r_bT−r_a), divided by r_b-power torsion and localized at (m′,f), where f is a monic lift of the residual closed-point polynomial.

Use the scheme chart presentation from SR Layer 4 for a two-generated ideal and the corresponding module image chart. Identify the actual polynomial relation r_bT−r_a and track the saturation quotient. Use the support-dimension bound and imported local cohomology to reduce CM to the required chart-depth lower bound. Source: Theorem 3.14, (3.14.1)–(3.14.8).

Acceptance: For s≥2, at a point of the previous prefix-product blowing-up choose a generator r_i of the previous prefix ideal. It is regular on the local chart ring R′ and module M′. For {a,b}={i,s}, the current chart module at a closed point is (M′⊗R′[T])/(r_bT−r_a), divided by r_b-power torsion and localized at (m′,f), where f is a monic lift of the residual closed-point polynomial.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### The first local-cohomology claim

Declaration: TauCeti.Kawasaki.claim_annihilation. Node: DeformationAndDerivedPatchingAlgebraPartII:K4/claim-annihilation.

In the inductive setup of Theorem 3.14, with local previous-stage chart (R′,M′), r_i and r_s both kill H^1_{(r_i,r_s)}(R′,M′).

The reversed d-sequence gives regularity of r_s on the relevant positive-degree localized graded modules. Compute principal local cohomology by the directed system M′/r_s^mM′ with transitions multiplication by r_s. Use the exact degreewise comparison (3.14.13), whose kernel is (I_{s−1}^nM:r_s^m)/(I_{s−1}^nM+(0:r_s^m)); Kawasaki(ii) implies both selected elements kill this kernel. Pass through homogeneous localization and the relevant colimit. The exact comparison and the colimit maps still require separate proof-leaf signatures. Source: Claim 3.14.5 and (3.14.13).

Acceptance: In the inductive setup of Theorem 3.14, with local previous-stage chart (R′,M′), r_i and r_s both kill H^1_{(r_i,r_s)}(R′,M′).

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### The second local-cohomology claim

Declaration: TauCeti.Kawasaki.claim_vanishing. Node: DeformationAndDerivedPatchingAlgebraPartII:K4/claim-vanishing.

In the same setup, H^j_{m′}(R′,H^{j′}_{(r_i,r_s)}(R′,M′))=0 for j<s−2 and every j′. In a natural-degree formulation, only j′=1,2 remain: degree zero vanishes by regularity of r_i and degrees above two vanish by the two-generator Čech model.

Use the imported iterated local-cohomology spectral sequence and the inductive depth bound s−1. For M/r_s^mM apply the robust inductive hypothesis and identify the kernel comparison in (3.14.15). The double directed colimit in (3.14.16) vanishes for j<s−2, giving the two remaining rows. These comparison maps and filtration arguments remain explicit proof-refinement gaps. Source: Claim 3.14.6 and (3.14.14)–(3.14.16).

Acceptance: In the same setup, H^j_{m′}(R′,H^{j′}_{(r_i,r_s)}(R′,M′))=0 for j<s−2 and every j′. In a natural-degree formulation, only j′=1,2 remain: degree zero vanishes by regularity of r_i and degrees above two vanish by the two-generator Čech model.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### The corrected chart relation kills cohomology

Declaration: TauCeti.Kawasaki.chart_polynomial_annihilation. Node: DeformationAndDerivedPatchingAlgebraPartII:K4/chart-polynomial-annihilation.

After polynomial flat base change in the two-generator chart setup, multiplication by the actual relation r_bT−r_a is zero on H^1_{(r_a,r_b)}(R′[T],M′⊗R′[T]). This is E8’s corrected relation used in the preceding exact sequence, even though the printed swapped relation also kills the module.

Apply the first claim to show both r_a and r_b act by zero. Use imported flat base change for local cohomology and linearity of multiplication. Source: Theorem 3.14, (3.14.10), corrected E8.

Acceptance: The map identified as zero is multiplication by r_bT−r_a, exactly the relation in the chart exact sequence.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Depth induction on prefix-product charts

Declaration: TauCeti.Kawasaki.chart_depth_induction. Node: DeformationAndDerivedPatchingAlgebraPartII:K4/chart-depth-induction.

With the weaker hypotheses and a zero-dimensional terminal quotient, for every 0≤s≤t, Bl_{I_s}(M) has depth at least s at its support points over the closed point. Together with the support-dimension bound and the source’s localization reduction, this proves the needed CM assertion.

Use empty/principal base cases and induction on s. For s≥2 use the chart presentation and the two claims; the exact sequences (3.14.7),(3.14.9),(3.14.11) give the vanishing below s after the monic f step. Use the imported local-cohomology depth criterion. The torsion-removal and monic-polynomial regularity arguments need separate proof leaves before closure. Source: Theorem 3.14, induction and (3.14.1)–(3.14.11).

Acceptance: With the weaker hypotheses and a zero-dimensional terminal quotient, for every 0≤s≤t, Bl_{I_s}(M) has depth at least s at its support points over the closed point. Together with the support-dimension bound and the source’s localization reduction, this proves the needed CM assertion.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### CM blowing-ups under the weaker sequence hypotheses

Declaration: TauCeti.Kawasaki.weaker_hypothesis_cm_blowup. Node: DeformationAndDerivedPatchingAlgebraPartII:K4/weaker-hypothesis-cm-blowup.

Let finite M over Noetherian local (R,m) and an ordered list r1,…,rt∈m have CM terminal quotient. Suppose every initial subsequence satisfies all three conditions of Proposition 3.11, with their auxiliary secant quantifiers, reversed d-sequence and corrected last auxiliary element. Then Bl_{I_t}(M) is CM on Bl_{I_t}(R), where I_t is the product of successive prefix ideals.

Reduce terminal dimension by regular elements and use the graded quotient comparison. For zero-dimensional terminal quotient apply the chart-depth induction and support-dimension bound. Apply the support-restricted CM convention, including the zero sheaf. Source: Theorem 3.14, proof’s explicitly weaker hypothesis.

Acceptance: The implication uses all three conditions for every initial prefix, including their auxiliary lists; it does not assume those prefixes are CM-secant.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### Kawasaki’s Cohen–Macaulay blowing-up theorem

Declaration: TauCeti.Kawasaki.kawasaki_cm_blowup. Node: DeformationAndDerivedPatchingAlgebraPartII:K4/kawasaki-cm-blowup.

For a finite module M over a Noetherian local ring (R,m) and CM-secant r1,…,rt∈m, set I=product_{i=1}^t(r1,…,ri). Then Bl_I(M) is a Cohen–Macaulay module on Bl_I(R). This includes the empty sequence, when M itself is CM and I=1; zero M gives the zero sheaf.

Obtain each of the three prefix conditions from Proposition 3.11. Apply the weaker-hypothesis theorem to the actual Rees-module blowing-up, not a sheaf with an assumed CM field. Source: Theorem 3.14.

Acceptance: For R=M=k[[t]] and the one-term CM-secant list [t], the module blowing-up is unchanged and CM; for empty rs the ideal is the unit ideal.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

### A CM ring whose maximal-ideal blowing-up is not CM

Declaration: TauCeti.Kawasaki.arbitrary_blowup_nonexample. Node: DeformationAndDerivedPatchingAlgebraPartII:K4/arbitrary-blowup-nonexample.

There exists a Noetherian local Cohen–Macaulay ring whose blowing-up at its maximal ideal is not Cohen–Macaulay. The statement is the warning cited at the start of §3; a concrete ring, charts and failing depth witness from HIO88 14.11 are not yet supplied.

Read HIO88 14.11 or a verifiable primary substitute and record its explicit construction. Check the CM ring and exhibit a non-CM blowup chart; neither part is inferred merely from the existence sentence in Česnavičius. Source: §3 opening paragraph, HIO88 14.11.

Acceptance: A valid example must specify a ring, prove it is CM and give a non-CM blowup chart; the source existence sentence alone does not complete the test.

Suggested-file boundary: Mathematical target recorded; typed signature is an explicit unfinished obligation in this checkpoint, not an admitted proposition surrogate.

Coverage: partial. Remaining:

- Split (3.14.13),(3.14.15),(3.14.16), chart-depth and regular-element comparisons into the recorded proof leaves; type them and the final two theorems.
- Read HIO88 14.11 and provide an explicit CM ring/non-CM chart counterexample.

## Source corrections

- DeformationAndDerivedPatchingAlgebraPartII/E4: '… for all x ∈ Supp(𝓜)'. For x ∉ Supp(𝓜) the stalk is 0, whose depth is +∞, while dim(Supp(𝓜_x)) = dim(∅) = −∞ by the convention just recalled; so the equality fails there although '(S_n) for every n' holds. Read literally, only modules with full support could be Cohen–Macaulay, which contradicts Definition 3.1(ii), where M/(r_1,…,r_s)M has proper support, and Remark 1.4, which states Supp(𝓜) = X as a separate hypothesis.
- DeformationAndDerivedPatchingAlgebraPartII/E5: 'the r_{i'}-torsion and the r_ir_{i'}-torsion submodules … agree', i.e. ((r_1,…,r_{i−1})M : r_ir_{i'}) = ((r_1,…,r_{i−1})M : r_{i'}), which is Huneke's condition. The corrected form follows from Definition 3.8: if r_ir_{i'}x = 0 in M̄ := M/(r_1,…,r_{i−1})M then y := r_{i'}x ∈ 𝔯M̄ is r_i-torsion, so y = 0. The printed form fails: over R = k[[t,u]] take M = R/(u) ⊕ R and (r_1, r_2) = (t, u), a d-sequence for M (t is injective on 𝔯M = tk[[t]] ⊕ (t,u)R, and u on 𝔯(M/tM) = 0 ⊕ uk[[u]]); for i = 1, i' = 2 the t-torsion of M is 0 but its tu-torsion is R/(u) ⊕ 0, which is the u-torsion.
- DeformationAndDerivedPatchingAlgebraPartII/E6: 'if r'_{s'} is (M'/(r_1,…,r_s)M')-regular'. s' indexes the auxiliary secant sequence, whose first s' − 1 terms define M'; the next term is r'_{s'}. As printed, for s' ≤ s the element r_{s'} kills M'/(r_1,…,r_s)M', and for s' > s̃ it is undefined. The proof of Theorem 3.14 applies (iii) with s' = 1, M' = M and an M̄-regular r' (TeX l. 1541).
- DeformationAndDerivedPatchingAlgebraPartII/E7: I_s := ∏_{i=1}^s (r_1,…,r_i) Proposition 3.11 defines I_j := ∏_{i=1}^j (r_1,…,r_i) (TeX l. 1421) and the theorem's I is I_{s̃}; the proof needs I_{s̃} = I and uses Bl_{I_s}(R) ≅ Bl_{(r_1,…,r_s)}(Bl_{I_{s−1}}(R)) from §3.13, which needs I_s = (r_1,…,r_s)·I_{s−1}. The printed ideal is (r_1,…,r_s)^s, which satisfies neither.
- DeformationAndDerivedPatchingAlgebraPartII/E8: 'multiplication by r_bT − r_a' The exact sequence (3.14.7) that the argument feeds into is multiplication by r_bT − r_a, and (3.14.11) uses r_bT − r_a. The printed statement is also true (by Claim 3.14.5 and (3.14.8) both r_a and r_b act by zero), so nothing is lost.

## Exact gaps

### Schenzel primary proof leaves

Remark 3.3 quotes Sche82 2.4.2 and Remark 3.7 quotes 2.4.6. The Springer book was located but its text has not been read. Obtain the actual proofs, retain all module hypotheses, and split non-routine steps into declarations.

### Kawasaki primary definition and induction

Kaw00 2.6, 2.9, 2.10, 3.1–3.3 and Kaw02 3.6 are cited by §3.11. The author publications page confirms bibliography but supplies no PDF of Kaw00. Read the A_ij–E_ij induction with the five corrections described in Česnavičius before declaring proof closure. NTC95 2.4 is the other p-standard definition source.

### Ordinary duality supplier scope and typed signatures

AS.1 is the accepted owner, but the currently visible stage description concerns coherent six-functor formalisms and does not provide typed ordinary-ring normalized dualizing complexes. Bind the annihilator and CM-locus comparisons to actual supplier objects; no arbitrary cohomology families or proposition fields stand in for them.

### Module blowing-up signature and its API tests

The actual SR4 blowup carrier and graded sheafification input are not yet available as typed declarations at the baseline. The module-blowup definition, eight promoted API items and three concrete tests remain mathematical statements in the suggested-file boundary section, not elaborated signatures. Implement those bindings once the supplier interface is known; a random Scheme plus an assumed CM field is not acceptable.

### Rees dimension source and explicit CM blowup counterexample

HIO88 12.14 and 14.11 have not been read. The accepted item 86 supplies the dimension outline but not a verified primary-proof decomposition. Read the finite-type dimension inequality over a Noetherian base and construct a concrete CM ring with a non-CM maximal-ideal blowup chart.

### Theorem 3.14 proof-leaf worklist

The entire proof has been read, but Claims 3.14.5 and 3.14.6 still aggregate the degreewise snake-lemma sequence (3.14.13), homogeneous-localization/colimit maps, kernel isomorphism (3.14.15), double-colimit vanishing (3.14.16), monic f regularity and torsion-removal exact sequences. Split and type each leaf, including degrees, shifts, maps and positivity bounds. Until then K4 is partial and no one-page closure claim is made.

### Unfinished supplier-dependent suggested signatures

This checkpoint elaborates only concrete native carrier signatures. Every other named target has its exact mathematical statement and name in the suggested boundary register, but still needs a typed signature and all omitted supplier conditions. This is why the packet is partial despite its target inventory.


## Accepted route accounting

- PAPER-CESNAVICIUS-21/34: DeformationAndDerivedPatchingAlgebraPartII:K0/is-cm-secant
- PAPER-CESNAVICIUS-21/36: DeformationAndDerivedPatchingAlgebraPartII:K0/schenzel-torsion-bound
- PAPER-CESNAVICIUS-21/37: DeformationAndDerivedPatchingAlgebraPartII:K0/p-standard-reversal, DeformationAndDerivedPatchingAlgebraPartII:K0/cm-secant-extend-parameters
- PAPER-CESNAVICIUS-21/40: DeformationAndDerivedPatchingAlgebraPartII:K0/duality-annihilator
- PAPER-CESNAVICIUS-21/41: DeformationAndDerivedPatchingAlgebraPartII:K0/cm-locus-annihilator
- PAPER-CESNAVICIUS-21/42: DeformationAndDerivedPatchingAlgebraPartII:K0/nonequidimensional-defect
- PAPER-CESNAVICIUS-21/43: DeformationAndDerivedPatchingAlgebraPartII:K1/is-d-sequence
- PAPER-CESNAVICIUS-21/44: DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-colon-iff
- PAPER-CESNAVICIUS-21/45: DeformationAndDerivedPatchingAlgebraPartII:K1/goto-yamagishi-colon, DeformationAndDerivedPatchingAlgebraPartII:K1/goto-yamagishi-intersection
- PAPER-CESNAVICIUS-21/46: DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-reversed-dseq, DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-torsion, DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-aux-regular
- PAPER-CESNAVICIUS-21/47: DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-robustness
- PAPER-CESNAVICIUS-21/48: DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup, DeformationAndDerivedPatchingAlgebraPartII:K3/module-strict-transform, DeformationAndDerivedPatchingAlgebraPartII:K3/module-two-ideal
- PAPER-CESNAVICIUS-21/49: DeformationAndDerivedPatchingAlgebraPartII:K4/kawasaki-cm-blowup, DeformationAndDerivedPatchingAlgebraPartII:K4/claim-annihilation, DeformationAndDerivedPatchingAlgebraPartII:K4/claim-vanishing
- PAPER-CESNAVICIUS-21/50: DeformationAndDerivedPatchingAlgebraPartII:K4/arbitrary-blowup-nonexample
- PAPER-CESNAVICIUS-21/86: DeformationAndDerivedPatchingAlgebraPartII:K3/blowup-support-dimension
