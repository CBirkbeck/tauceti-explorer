# Inverse Galois theory and arithmetic fundamental groups, Part II: Hurwitz homological stability

This continuation develops homological stability for nonsplitting Hurwitz spaces and the resulting uniform etale Betti bound. It starts with the braid-orbit monoid, left Hurwitz action, configuration spaces and four marked/full-monodromy Hurwitz variants of InverseGaloisAndArithmeticFundamentalGroups. The new work is the component algebra and central sum, the graded K-complex with uniform estimates, the truncated based-arc resolution, the spectral sequence, and the homological induction. The endpoint includes full monodromy and center-free unmarked quotients, then a dimension estimate in tame finite characteristic.

General singular/cellular homology, bundles, transfer and connectivity belong to AlgebraicTopology; smooth embeddings and diffeomorphism groups belong to GeometricTopology; generic mapping classes are imported through MappingClassGroupsAndCanonicalRepresentations from LV.5; internally graded noncommutative module and derived-tensor machinery belongs to DGAInfinity. Each required adapter is an explicit request where the supplier text alone does not yet provide it. The arithmetic Hurwitz schemes and fixed-degree mod-L/coefficient-tower comparisons remain in parent IG.5. This roadmap uses the central sum of EVW, with corrected indices, module sides and constants. Its output does not include a Frobenius-equivariant algebraic stabilization or a fixed-q Cohen–Lenstra limit.

## Conventions

- G is a finite group, c is a nonempty single G-conjugacy class, and k is a field with |G| nonzero in k. Nonsplitting includes generation. Topological constructions of the ring and K use only a conjugacy class; their degree theorems impose nonsplitting.
- Hur_n denotes the marked c-valued disc Hurwitz cover, including nongenerating tuples and every boundary product; CHur_n is its full-monodromy subcover. A slash G means the ordinary simultaneous-conjugation quotient. These are the four distinct spaces imported from IG.5. No product-one restriction is imposed.
- Classical braid generators sigma_1,...,sigma_(n-1) correspond to TauCeti.BraidGroup.sigma with indices 0,...,n-2. B_0 and B_1 are trivial. The left Hurwitz move sends (g,h) to (g h g^-1,g); exponent g^h means h^-1 g h.
- All internal gradings are nonnegative, and all modules in the degree estimates are nonnegatively graded (or given a specified common lower bound and shifted first). Internal shift M[q]_n is M_(n-q), with zero below q. Homological degree q is separate. Internal grading introduces no Koszul signs.
- A degree assertion deg V <= b means V_n=0 for every integer n>b. Zero has degree minus infinity and unbounded support has degree plus infinity; displayed bounds with finite degrees are proved on support, with zero cases handled separately. Constants are nonnegative integers.
- d is the common positive order of the elements of c. Fix a combinatorially admissible D>=1 from component stability, a=Dd, U=sum_(g in c) r_g^(Dd). Choose A1>=max(1,a,deg R[U],deg R/UR) uniformly over permitted fields, A2=A1+a, A0=5A1+A2. This enlargement repairs EVW Proposition4.13.
- Tor_i^R(N,M) uses a graded RIGHT R-module N followed by a graded LEFT R-module M. Balanced tensor products over R are noncommutative; ordinary Mathlib TensorProduct is used only over k. The generic graded module, balanced tensor and derived machinery belong to DGAInfinity.
- The arc semisimplicial set has q-simplices only for 0<=q<n. Its augmentation is a point in degree -1. K(M) has all homological degrees q>=0. The spectral sequence is nonaugmented: its zeroth column on E2 is coker(K2->K1), not H1(K).
- U acts on homology as a k-linear sum of gluing operators. It is not asserted to come from one map of spaces or an algebraic stabilization morphism. The etale output is a dimension bound using fixed-degree comparisons and an auxiliary prime L, without Frobenius-equivariant stabilization.

## Inputs and ownership

The parent inputs are exact node imports, not replacement definitions: IG.3/hurwitz-braid-action, IG.3/braid-orbit-monoid and IG.3/eventual-class-element-extraction; IG.5/configuration-spaces, configuration-braid-group, topological-hurwitz-covers and forget-hurwitz-marking; and IG.5/fixed-degree-mod-l-comparison and coefficient-tower-comparison. The parent deals with all tuples before imposing generation; marked boundary products are literal group elements. Its extraction lemma suffices for component stability, so no stable Nielsen-class classification or withdrawn sequel is an input.

The pinned native algebraic braid group is reused throughout. General graded Tor is imported through the zero-differential DG-module specialization of DGAInfinity, retaining a separate internal grading. CategoryTheory.Tor is an abstract monoidal-category derived functor; it does not identify arbitrary right and left R-modules as one tensor category. TensorProduct over the coefficient field is native, while tensor over R is the balanced supplier construction. Similarly the native spectral-sequence carrier represents pages but supplies no convergence by itself.

The supplier requests below distinguish owned general interfaces from the specialized constructions in these six layers. The specialized marked-disc adapter does not add an upward mapping-class prerequisite to the parent configuration theorem.

## Source register

- **EVW16**: Jordan S. Ellenberg, Akshay Venkatesh, Craig Westerland, [Homological stability for Hurwitz spaces and the Cohen-Lenstra conjecture over function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf). Annals of Mathematics 183 (2016), no. 3, 729–786; published version of record. Read2026-10-19: §§2.1–2.6, pp.738–742; §§3.1–3.5, pp.743–746; §§4.1–4.14, pp.747–755; §§5.1–5.6, pp.755–761; §§6.1–6.2, pp.761–764; §§7.1–7.9, pp.764–770. SHA-256: `6c10d770348c625ad9fe80d2c47093cde2a2ba05f39a28d547743f0f4993a7f6`.
- **HW10**: Allen Hatcher, Nathalie Wahl, [Stabilization for mapping class groups of 3-manifolds](https://web.math.ku.dk/~wahl/HatcherWahl.3manifolds.pdf). Author manuscript of Duke Mathematical Journal 155 (2010), 205–269; locators below use manuscript pagination. Read2026-10-19: §3, Definition3.4, manuscript p.16; §7, Lemma7.1 and Proposition7.2 with proofs, manuscript pp.34–35. SHA-256: `cc193c1e56dc458a166979532432942cb1096e8623fc51f03c30553c285c2af6`.
- **CD95**: Ruth Charney, Michael W. Davis, [Finite K(pi,1)'s for Artin groups](https://people.math.osu.edu/davis.12/finitekpi1.pdf). Author manuscript of contribution to Prospects in Topology, Annals of Mathematics Studies138 (1995),110–124; manuscript pagination. Read2026-10-19: Introduction and §§1.1–1.5, manuscript pp.1–7; §§2.1–2.2, Lemma2.2.1 and Corollary2.2.3, manuscript pp.7–9; read rendered PDF pages because text extraction is damaged. SHA-256: `2d218f5a52c323b7d5ff93326ef9517710d31e1183574f8474ef89760a7cabf2`.

All statements, construction choices and worked checks below are written for the targets of this roadmap. Source locators identify mathematical inputs; source text is not reproduced.

## HS.0 — Nonsplitting classes and the central component operator

### Nonsplitting conjugacy classes {#nonsplitting}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/nonsplitting** (definition). For a subset c of a group G, Nonsplitting(c) means: c is one nonempty whole G-conjugacy class, its generated subgroup is G, and for every subgroup H<=G the intersection c∩H is empty or one H-conjugacy class. Equivalently, after the first two conditions, any g,h in c∩H are conjugate by an element of H. The intersection is automatically H-conjugation invariant.

**Dependencies.** `mathlib:IsConj`; `mathlib:Subgroup.closure`.

**Source.** EVW16, Definition3.1 and Lemma3.2, p.743.

**Construction or proof.** Use native conjugacy and subgroup closure. Translate the intersection condition into a pairwise-conjugacy predicate, retaining the ambient whole-class condition. For H with c∩H generating H, transport the same predicate to the subtype H; only such H contribute to exact-monodromy tuples.

**Uses.** EVW Lemma3.5, pp.745–746: Apply extraction uniformly inside all exact-monodromy subgroups; EVW Theorem6.1, pp.761–763: Fix the scope of the stability theorem.

**API.**

- `HurwitzStability.nonsplitting_iff` (characterisation): The pairwise subgroup-conjugacy formulation is equivalent to the empty-or-single-class formulation, assuming c is a whole ambient class.
- `HurwitzStability.nonsplitting_generates` (projection): Nonsplitting(c) implies subgroup closure(c)=top and c is nonempty.
- `HurwitzStability.nonsplitting_subgroup` (compatibility): If H is generated by c∩H and c∩H is nonempty, the induced class in H is nonsplitting.
- `HurwitzStability.nonsplitting_map` (functoriality): A group isomorphism carries a nonsplitting class to a nonsplitting class; transport respects identity and composition.

**Checks and worked examples.**

- `HurwitzStability.nonsplitting_trivial` (example): For the one-element group and c={1}, the predicate holds.
- `HurwitzStability.nonsplitting_s3` (example): In S3 the class {(12),(13),(23)} is nonsplitting and generates S3.
- `HurwitzStability.nonsplitting_not_s4` (counterexample): The S4 transposition class fails: H=< (12),(34) > is abelian and its intersection with c contains two distinct elements.
- `HurwitzStability.nonsplitting_not_generating` (counterexample): In C6 the singleton involution class has the subgroup-conjugacy property but fails generation and therefore fails this predicate.

**Acceptance.** A union of distinct ambient conjugacy classes is rejected even if it generates.

### The involution example {#odd-order-involutions}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/odd-order-involutions** (theorem). If |G|=2s with s odd, the elements of order2 form one conjugacy class c. If c generates G, then c is nonsplitting. In particular the transposition class of S3 satisfies the stability hypotheses.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/nonsplitting`; `mathlib:Sylow.isPretransitive_of_finite`; `mathlib:Sylow.card_eq_multiplicity`; `mathlib:IsPGroup.exists_le_sylow`.

**Source.** EVW16, Lemma3.2, p.743.

**Construction or proof.** Sylow2 subgroups have order2 and are conjugate, so their nonidentity elements form the unique involution class. Every subgroup containing an involution has the same order shape; apply Sylow conjugacy in that subgroup. Then add the stipulated generation.

**Acceptance.** Do not infer generation from |G|=2s: C6 is a counterexample.

### Gluing of marked Hurwitz covers {#gluing}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/gluing** (construction). Use the parent Borel models Hur_n=EB_n×_(B_n)c^n. Block inclusion B_n×B_m->B_(n+m) and concatenation c^n×c^m->c^(n+m) induce gluing Hur_n×Hur_m->Hur_(n+m), associative and unital up to compatible homotopies, equivariant for simultaneous G-conjugation. The external homology cross product followed by gluing yields the graded homology multiplication. It preserves the c-valued condition and sends monodromy subgroups H,K to <H,K>.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroups:IG.3/hurwitz-braid-action`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/topological-hurwitz-covers`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Source.** EVW16, §2.6, p.742 (gluing; extraction item18 labels it §2.4).

**Construction or proof.** Use block inclusions and tuple concatenation on classifying constructions, with the functorial homotopies provided by Borel realization. Apply the singular cross product and its associativity/unit compatibility. Degree-zero multiplication is concatenation of braid orbits.

**Uses.** EVW §3, p.742: Construct the component ring; EVW (5.0.2), p.755: Give higher homology its left component-ring action.

**API.**

- `HurwitzStability.glue` (constructor): The degree-(n,m) gluing map is induced by the block homomorphism and tuple concatenation.
- `HurwitzStability.glue_assoc` (relation): The two three-factor gluings are canonically homotopic, hence give equal maps on homology.
- `HurwitzStability.glue_unit` (simp): The empty degree-zero tuple acts as the homotopy unit.
- `HurwitzStability.glue_conjugate` (compatibility): Conjugating both inputs by g and then gluing agrees with conjugating the output.
- `HurwitzStability.glue_monodromy` (characterisation): The generated subgroup of the glued tuple is the join of the two input generated subgroups.

**Checks and worked examples.**

- `HurwitzStability.glue_empty` (example): Gluing the empty tuple on either side preserves the tuple orbit.
- `HurwitzStability.glue_boundary` (compatibility): The marked boundary product of glue(s,t) is boundary(s)boundary(t), in that order.
- `HurwitzStability.glue_full_monodromy` (example): A full-monodromy input remains full-monodromy after gluing any c-valued tuple.
- `HurwitzStability.glue_not_closed_stratum` (counterexample): Gluing a tuple in a proper subgroup H with an element outside H leaves the exact-H stratum.

**Acceptance.** The module is built from all tuples, including the empty tuple and nongenerating tuples.

### The graded component ring {#component-ring}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/component-ring** (construction). Import S=disjoint_union_n c^n/B_n with concatenation from IG.3, and define R as native MonoidAlgebra k S. Give it the length grading R_n=k[S_n], augmentation R->k projecting to R_0=k, G-action by conjugation, and boundary G-grading. Set r_g=single([g],1). Its presentation is the free associative k-algebra on r_g (g∈c) modulo r_g r_h=r_(g h g^-1) r_g. Gluing identifies R with direct_sum_n H_0(Hur_n;k), as a graded algebra.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroups:IG.3/braid-orbit-monoid`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/hurwitz-braid-action`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/gluing`; `mathlib:MonoidAlgebra`; `mathlib:MonoidAlgebra.single`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure`.

**Source.** EVW16, §3.3, pp.743–744; §2.6, p.742.

**Construction or proof.** Use the native monoid algebra of the imported monoid; length is invariant under its defining Hurwitz relations. The braid generators and their inverses generate precisely the orbit congruence, yielding the presentation; compare degree-zero singular homology of a covering with its components.

**Uses.** EVW §4, pp.747–755: The noncommutative graded algebra over which all module estimates run; EVW Lemma3.5, pp.745–746: Define the central stabilization sum.

**API.**

- `HurwitzStability.componentRing_delta` (constructor): Every tuple orbit defines a homogeneous basis vector, and these vectors form a k-basis.
- `HurwitzStability.componentRing_lift` (universal-property): A family of elements in a k-algebra satisfying the Hurwitz relations extends uniquely to a k-algebra map from R.
- `HurwitzStability.componentRing_relation` (relation): r_g r_h=r_(g h g^-1) r_g; equivalently r_h r_(h^-1 g h)=r_g r_h.
- `HurwitzStability.componentRing_augmentation` (simp): The empty tuple maps to1 and every positive-degree basis vector maps to0.
- `HurwitzStability.componentRing_h0` (equivalence): The basis identification with H0(Hur_n;k) respects degree, products, conjugation and boundary grading.
- `HurwitzStability.componentRing_productOneCentral` (compatibility): The basis vector of any tuple with boundary product1 is central, by the imported monoid centrality API.

**Checks and worked examples.**

- `HurwitzStability.componentRing_zero` (example): R_0=k, represented by the empty tuple; it is present even when full-monodromy Hur_0 is empty.
- `HurwitzStability.componentRing_s3_noncomm` (counterexample): In S3 with transpositions, r_(12)r_(23) and r_(23)r_(12) have different marked boundary products and are unequal.
- `HurwitzStability.componentRing_trivial` (compatibility): For G={1}, c={1}, the graded algebra R is k[t] with deg t=1.
- `HurwitzStability.componentRing_not_product_one` (counterexample): The one-term tuple (g), for g≠1, remains a degree-one basis element; no product-one quotient is taken.

**Acceptance.** R is generally noncommutative and R_0 has one basis vector.

### The central stabilization sum {#central-sum}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/central-sum** (definition). For D>=1 set z_g=r_g^d and U_D=sum_(g∈c) z_g^D. The element U_D has degree a=Dd, is central, is fixed by simultaneous G-conjugation, and has boundary degree1. No normalization scalar is used. On any graded left R-module its action is a homogeneous k-linear map of degree a.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/component-ring`.

**Source.** EVW16, Lemma3.5, pp.745–746.

**Construction or proof.** Each power block has boundary1 and is central by the parent product-one centrality. Conjugation permutes the summands. Record the family for every D>=1; component stability subsequently selects the admissible values.

**Uses.** EVW Lemma3.5: Stabilize the component ring; EVW Theorem6.1 and Corollary6.2: Act on marked homology and pass equivariantly to unmarked homology.

**API.**

- `HurwitzStability.centralSum` (constructor): U_D is the finite sum of the dD-fold constant tuple basis vectors.
- `HurwitzStability.centralSum_central` (relation): U_D commutes with every element of R.
- `HurwitzStability.centralSum_conjugate` (compatibility): The G-action fixes U_D.
- `HurwitzStability.centralSum_degree` (data): U_D is homogeneous of length Dd and boundary product1.
- `HurwitzStability.centralSum_action` (functoriality): A graded left R-linear map intertwines U_D on its source and target; scalar extension carries U_D to the same integral sum in the new coefficients.

**Checks and worked examples.**

- `HurwitzStability.centralSum_c2` (example): For c={s} in C2, U_D=r_s^(2D), which is nonzero.
- `HurwitzStability.centralSum_s3` (example): For S3 transpositions and D=1, U_1=r_(12)^2+r_(13)^2+r_(23)^2 in degree2; the product of the three blocks instead has degree6.
- `HurwitzStability.centralSum_trivial` (example): For the one-element group U_D=t^D in k[t].
- `HurwitzStability.centralSum_not_power_sum` (counterexample): Do not identify U_(2D) with U_D^2: the latter has mixed terms, including for the S3 class over characteristic zero.

**Acceptance.** The degree is Dd, not |c|Dd; U is a sum.

### Stability on components {#component-stability}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/component-stability** (theorem). If c is nonsplitting, there are D>=1 and N>=0 depending only on (G,c), such that U_D:R_n->R_(n+a) is an isomorphism for every n>=N and every coefficient field in which |G| is invertible. Thus R[U_D] and R/U_DR have finite support. D may be chosen simultaneously for all nonempty generating intersections c∩H in subgroups H, and any positive multiple of the resulting permutation exponent is admissible after increasing N.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/nonsplitting`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/component-ring`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/central-sum`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/eventual-class-element-extraction`.

**Source.** EVW16, Lemma3.5, pp.745–746, using Proposition3.4, pp.744–745.

**Construction or proof.** Fix exact-monodromy subsets S_n(H). If nonempty, c∩H generates H and is a single H-class. Repeated parent extraction gives eventual surjectivity of multiplication by each z_g, hence eventual bijectivity and bounded cardinalities on each residue class modulo d. There are finitely many H and residues. Commuting z_g maps identify their ratios with permutations of bounded finite sets. Choose one exponent D killing all those permutations. The diagonal actions z_g^D on each stable S_n(H) then coincide. Filter R by subgroup order at least m. U is triangular; on the exact-H graded piece it is |c∩H| times a bijection. This cardinal divides |H| and is a unit in k. Descend on m. All thresholds and permutation bounds are chosen before coefficients, giving field independence.

**Acceptance.** Use cardinality stabilization, not the assertion that a surjection between two finite sets is automatically a bijection. c∩H may fail to generate H only when every S_n(H) is empty. For trivial G one may take D=1,N=0, although R/U has degree0 and the corrected A1 is still at least1.

**Layer completion obligations.** Resolve AlgebraicTopology cross-product/Borel and DGAInfinity internal-grading/tensor requests used to identify the component ring with H0. The specialized targets and field-independent component argument are fully specified.

## HS.1 — Graded K-complexes and homological degree bounds

### Support degree and internal shift {#graded-conventions}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-conventions** (definition). Specialize the imported graded-module interface to nonnegatively internally graded left and right R-modules, with morphisms of internal degree0. For a family V define SupportedLE(V,b) by V_n=0 for n>b. Use support degree in extended integers with deg0=-infinity. The internal shift M[q] has M[q]_n=M_(n-q), zero if n<q; a homogeneous map of degree a is a degree-zero map M[a]->N. Homological complexes retain a distinct nonnegative chain index. The native GradedObject supplies the family carrier; module structures and shift functors are imported from DGAInfinity.

**Dependencies.** `mathlib:CategoryTheory.GradedObject`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`; `mathlib:ModuleCat`.

**Source.** EVW16, §1.11, p.737; §4.1 and conventions after Theorem4.2, pp.747–749.

**Construction or proof.** Express every numerical inequality as a finite support cutoff before introducing degree notation. Transport the internal shift from the supplier, avoiding its cohomological shift and Koszul sign conventions. Verify exact sequences give the maximum support bound and finite direct sums give the maximum of summand degrees.

**Uses.** EVW §§4.4–4.14: State degree estimates without ambiguous zero or shift conventions; EVW §5.4: Distinguish the K chain index from the number-of-punctures grading.

**API.**

- `HurwitzStability.supportedLE_iff` (characterisation): SupportedLE(V,b) iff every internal piece above b is the zero object.
- `HurwitzStability.internalShift_piece` (simp): For n>=q the nth piece of M[q] is M_(n-q), and it is zero below q.
- `HurwitzStability.internalShift_degree` (compatibility): A nonzero family of finite degree b has shifted degree b+q; zero stays zero.
- `HurwitzStability.support_exact` (relation): In an exact sequence A->B->C, finite bounds on A and C bound B by their maximum.
- `HurwitzStability.internalShift_map` (functoriality): Shift acts on degree-zero morphisms and preserves identities, compositions and exactness.

**Checks and worked examples.**

- `HurwitzStability.support_zero` (example): The zero graded module satisfies SupportedLE(V,b) for every b, including negative cutoffs.
- `HurwitzStability.shift_k` (example): k concentrated in degree0 has k[2] concentrated in internal degree2, independently of its chain degree.
- `HurwitzStability.shift_below` (counterexample): The degree0 piece of k[1] is zero; natural-number subtraction alone would incorrectly make it k.
- `HurwitzStability.support_not_bounded` (counterexample): R=k[t] with deg t=1 has infinite support, so no finite degree bound applies.

**Acceptance.** The zero family is supported below every cutoff; no artificial degree0 is assigned to it.

### Central torsion and stability defects {#stability-defects}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects** (definition). For a graded left R-module M let M[U]=ker(U:M->M), regarded in the source grading, and M/UM the cokernel in the target grading. Put Rbar=R/UR, with its native induced R-bimodule and augmentation, H_i^aug(M)=Tor_i^R(k,M), A(M)=max(deg M[U],deg M/UM), and delta(M)=max(deg Tor_0^R(Rbar,M),deg Tor_1^R(Rbar,M)). Choose A1>=max(1,a,A(R)), A2=A1+a, A0=5A1+A2. Finite support of these defects is the meaning of eventual U-stability, with separate source and target cutoffs.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-conventions`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/central-sum`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/component-stability`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes`; `mathlib:CategoryTheory.Functor.leftDerived`.

**Source.** EVW16, §4.2, pp.748–749; equations(4.5.1)–(4.5.3), p.750, with the positive-slope and homogeneous-shift repairs E5–E6.

**Construction or proof.** Take the homogeneous kernel and cokernel using the imported abelian category of graded modules and the balanced right/left Tor interface. Use component stability to choose a uniform nonnegative A1 at least a and at least1; do not insist on the source equality A1=A(R).

**Uses.** EVW Lemmas4.6–4.9: Relate central stabilization to low augmentation Tor; EVW Theorem4.2: Produce a stable range from low K-homology.

**API.**

- `HurwitzStability.centralQuotient_tensor` (equivalence): Rbar tensor_R M is naturally M/UM, respecting its left Rbar action.
- `HurwitzStability.centralTorsion_piece` (characterisation): M[U]_n is the kernel of U:M_n->M_(n+a).
- `HurwitzStability.augmentationTor_zero` (equivalence): H_0^aug(M)=k tensor_R M=M/R_positive M.
- `HurwitzStability.defect_stability` (characterisation): For finite b>=A(M), U:M_n->M_(n+a) is bijective whenever n>b; the kernel and cokernel conditions can also be tested separately.
- `HurwitzStability.defect_naturality` (functoriality): R-linear maps induce maps on torsion, quotient and Tor, natural in M and in scalar extension by a field.

**Checks and worked examples.**

- `HurwitzStability.defect_polynomial` (example): For R=k[t],U=t, M=R, the kernel is zero and R/UR=k in degree0, so A(R)=0 but A1 is chosen>=1.
- `HurwitzStability.defect_augmentation` (example): For R=k[t],U=t, M=k in degree0, M[U]=M/UM=k while Tor_1^R(k,k)=k[1].
- `HurwitzStability.defect_shift` (compatibility): Replacing M by M[q] shifts both torsion and cokernel supports by q; a remains the degree of U.
- `HurwitzStability.defect_kernel_vs_coker` (counterexample): An injective positive-degree map, such as t:k[t]->k[t], can have a nonzero cokernel; tracking only the kernel does not certify stability.

**Acceptance.** The cokernel cutoff tests degree n+a when stability is tested in source degree n.

### Change of rings for the central quotient {#change-of-rings}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/change-of-rings** (construction). For every nonnegative graded left R-module M there is an internal-degree-preserving first-quadrant spectral sequence E2_(i,j)=Tor_i^Rbar(k,Tor_j^R(Rbar,M)) converging in each total degree to Tor_(i+j)^R(k,M). The inner Tor is a left Rbar-module. Obtain it by specializing the supplier derived-tensor composition comparison to R->Rbar->k; no commutativity of R is assumed.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes`; `mathlib:CategoryTheory.SpectralSequence`.

**Source.** EVW16, §4.3, equation(4.3.1), p.749.

**Construction or proof.** Use graded free resolutions. Rbar tensor_R - takes free R-modules to free Rbar-modules, giving the acyclicity needed for the composite-derived spectral sequence. Filter the resulting first-quadrant double complex. The finite number of bidegrees at each total degree gives the required convergence and subquotient statements.

**Uses.** EVW Lemma4.9: Use the low-degree exact segment; EVW Proposition4.10: Bound augmentation Tor by total-degree pieces.

**API.**

- `HurwitzStability.changeRings_page` (data): The E2 page is the specified iterated Tor, with internal grading retained.
- `HurwitzStability.changeRings_augmentation_edge` (compatibility): The degree-zero edge is the associativity map k tensor_Rbar(Rbar tensor_R M) -> k tensor_R M.
- `HurwitzStability.changeRings_natural` (functoriality): A graded R-linear map in M induces a morphism of spectral sequences and of abutment filtrations.
- `HurwitzStability.changeRings_low_exact` (relation): There is an exact segment Tor_2^Rbar(k,Rbar tensor_R M) -> k tensor_Rbar Tor_1^R(Rbar,M) -> Tor_1^R(k,M).

**Checks and worked examples.**

- `HurwitzStability.changeRings_free` (example): For M=R the inner higher Tor vanishes and the spectral sequence recovers Tor_i^Rbar(k,Rbar)=0 for i>0, and k for i=0.
- `HurwitzStability.changeRings_degree_zero` (compatibility): Its total-degree0 is k tensor_R M, rather than Rbar tensor_R M.
- `HurwitzStability.changeRings_noncomm` (counterexample): For the S3 component ring, replacing the inner expression by Tor^R(M,Rbar) is ill-typed without changing module sides.

**Acceptance.** Each tensor has a right module first and a left module second.

### A balanced tensor support estimate {#tensor-degree}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/tensor-degree** (theorem). For a nonnegative graded right R-module N and left R-module M, deg(N tensor_R M)<=deg N+deg H_0^aug(M), whenever the right side is finite; the zero cases vanish. The same statement holds for the central quotient Rbar.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-conventions`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`.

**Source.** EVW16, Lemma4.4, p.749.

**Construction or proof.** Filter a bounded N by internal degree from the top. Each associated graded is a sum of shifted augmentation modules k, since positive-degree elements raise degree. Use right exactness of the balanced tensor and the support bound in exact sequences. Reduce the nonzero finite-support case to N=k shifted.

**Acceptance.** N=k gives equality with augmentation coinvariants; no flatness of N is assumed.

### Tor support over the finite central quotient {#quotient-tor-degree}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/quotient-tor-degree** (theorem). For a nonnegative graded left Rbar-module V, deg Tor_i^Rbar(k,V)<=i deg Rbar+deg V for every i>=0 when these degrees are finite. It is enough, and is the uniform bound used below, to replace deg Rbar by A1.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/tensor-degree`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes`.

**Source.** EVW16, Lemma4.5, pp.749–750.

**Construction or proof.** Build a graded free right Rbar resolution of k whose ith term has generators of degree at most i deg Rbar. For the induction, the preceding term is supported at most i deg Rbar. Tensor with V and bound homology by the support of the ith tensor term. Use the right-module analogue of the tensor bound.

**Acceptance.** For Rbar=k, all positive Tor groups vanish.

### Bounding central torsion by quotient Tor {#torsion-defect-bound}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/torsion-defect-bound** (theorem). For every nonnegative graded left R-module M, A(M)<=delta(M)+A1. More precisely there is an exact-at-the-middle sequence R[U] tensor_R M -> M[U] -> Tor_1^R(Rbar,M), whose first map has internal degree0 and second map has internal degree a.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/tensor-degree`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes`.

**Source.** EVW16, Lemma4.6, pp.750–751; corrected tensor order in E2.

**Construction or proof.** Factor U:M->M through UR tensor_R M. Tensor the sequences R[U]->R->UR and UR->R->Rbar, keeping their homogeneous degrees. The first kernel is an image of R[U] tensor_R M; the second is Tor_1^R(Rbar,M). Apply the tensor bound and deg H_0^aug(M)<=deg M/UM<=delta(M). The nonnegative degree a allows the conservative bound.

**Acceptance.** Never write M tensor_R R[U] for a merely left module M.

### Higher central-quotient Tor estimates {#higher-quotient-tor}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/higher-quotient-tor** (theorem). For i>=0 and nonnegative graded left R-module M, deg Tor_i^R(Rbar,M)<=delta(M)+A1 i.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/quotient-tor-degree`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes`.

**Source.** EVW16, Lemma4.7, pp.751–752.

**Construction or proof.** R[U] is a right Rbar-module. Resolve it by free right Rbar-modules Q_j with generators in degrees <=(j+1)A1. Splice Q into R[U]->R->R->Rbar, inserting the internal shifts that make the U map degree0. Use the supplier hyperhomology spectral sequence of this homogeneous right R-complex tensored with M. The spliced resolution has P0=R, P1=R[a], and Pj=Q_(j-2)[a] for j>=2. For total degree b>=2, a piece with 0<=u<=b-2 has generator shift <=(b-u-1)A1+a and inner Tor_u^R(Rbar,M). Since a<=A1, induction bounds it by delta(M)+b A1. This makes explicit the shifts suppressed in the source display (E6).

**Acceptance.** i=0,1 are controlled directly by delta; shifts in the two R terms must not be discarded.

### Graded Nakayama with support control {#graded-nakayama}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-nakayama** (theorem). For every nonnegative graded left Rbar-module V with finite degree of k tensor_Rbar V, deg V<=deg(k tensor_Rbar V)+deg Rbar. In particular k tensor_Rbar V=0 implies V=0.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-conventions`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`.

**Source.** EVW16, Lemma4.8, p.752.

**Construction or proof.** Lift a homogeneous k-basis of augmentation coinvariants. The quotient by the module these lifts generate has zero coinvariants. A least nonzero internal degree of that quotient cannot be in its positive-ideal multiple, so the quotient is zero. Bound degrees of the resulting generators using finite support of Rbar.

**Acceptance.** A lower bound on grading is essential; unrestricted integer-graded modules cannot be substituted.

### Low augmentation Tor controls the defect {#low-tor-defect}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/low-tor-defect** (theorem). For every nonnegative graded left R-module M, delta(M)<=max(deg H_0^aug(M),deg H_1^aug(M))+4A1.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/change-of-rings`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/quotient-tor-degree`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-nakayama`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/tensor-degree`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`.

**Source.** EVW16, Lemma4.9 and equations(4.9.1)–(4.9.3), p.752.

**Construction or proof.** The zeroth quotient Tor has degree <=deg H_0^aug(M)+deg Rbar. Use the change-of-rings low exact segment; apply graded Nakayama to Tor_1^R(Rbar,M), then the quotient Tor bound with i=2. This contributes at most four copies of deg Rbar.

**Acceptance.** For R=k[t],M=k, delta=1 and the chosen A1>=1 gives a valid bound.

### A general right-module Tor bound {#general-tor-bound}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/general-tor-bound** (theorem). If N is a nonnegative graded right R-module and M a nonnegative graded left R-module, then deg Tor_i^R(N,M)<=deg N+max(deg H_0^aug(M),deg H_1^aug(M))+A1 i+4A1, for all i>=0 with finite displayed degree bounds.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/change-of-rings`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/higher-quotient-tor`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/quotient-tor-degree`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/low-tor-defect`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-conventions`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes`.

**Source.** EVW16, Proposition4.10, pp.752–753.

**Construction or proof.** Filter finite-support N by top internal degree and use Tor long exact sequences, reducing to shifted sums of k. For N=k, total degree i in change of rings has a+b=i. The inner and outer bounds give a deg Rbar+b A1+delta(M), hence A1 i plus the low-Tor defect estimate.

**Acceptance.** No commutativity or global finite projective dimension of R is asserted.

### The Hurwitz K-complex {#k-complex}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-complex** (construction). For a nonnegative graded left R-module M define a homological complex K(M) with K(M)_q=k[c^q] tensor_k M[q] for every q>=0. On a basis tensor with (q+1)-tuple (g_0,...,g_q), d sends it to sum_i (-1)^i (g_0,...,omit g_i,...,g_q) tensor r_(g_i^(g_(i+1)...g_q)) m. The empty suffix is1. Differential preserves internal grading and lowers chain degree by1. Degree-zero R-linear maps of M induce chain maps. For M=R this is a complex of free graded right R-modules.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/component-ring`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-conventions`; `mathlib:TensorProduct`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`.

**Source.** EVW16, §4.1, equation(4.1.1), pp.747–748.

**Construction or proof.** Construct finite free coefficient modules on c^q over k and use the imported internal shifts; no truncation in q is introduced. Pair the two orders of deletion to prove d squared zero, using r_h r_(h^-1 g h)=r_g r_h. Left multiplication on R commutes with its right regular action.

**Uses.** EVW Theorem4.2: Control higher K-homology from degrees0,1; EVW Proposition5.1: Identify rows of the arc spectral sequence.

**API.**

- `HurwitzStability.kComplex_term` (data): The internal nth piece of chain degree q is k[c^q] tensor_k M_(n-q), zero when n<q.
- `HurwitzStability.kComplex_d` (simp): The differential on basis tuples is the displayed signed suffix-conjugation formula.
- `HurwitzStability.kComplex_d_squared` (relation): Every adjacent deletion pair cancels by the component-ring relation.
- `HurwitzStability.kComplex_map` (functoriality): K takes degree-zero R-linear maps to chain maps, preserving identity and composition.
- `HurwitzStability.kComplex_right` (structure): K(R) carries the right regular R-action on its coefficient factor, with free right R-terms.
- `HurwitzStability.kComplex_tensor` (equivalence): K(M) is naturally K(R) tensor_R M as a homological complex with internal grading.

**Checks and worked examples.**

- `HurwitzStability.kComplex_d1` (example): d((g) tensor m)=r_g m in chain degree0.
- `HurwitzStability.kComplex_d2` (example): d((g,h) tensor m)=(h) tensor r_(h^-1 g h)m - (g) tensor r_h m, so d squared gives (r_h r_(h^-1 g h)-r_g r_h)m=0.
- `HurwitzStability.kComplex_augmentation` (example): For M=k via augmentation, every differential is zero, and H_q K(k)=k[c^q][q] for every q>=0.
- `HurwitzStability.kComplex_truncation` (counterexample): For n<q the internal nth piece is zero even though K(M)_q itself is defined for all q.

**Acceptance.** All suffix conjugations follow g^h=h^-1 g h, rather than the opposite action.

### Right linearity and tensor comparison {#k-right-complex}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-right-complex** (theorem). For every chain degree q, the right action on K(R)_q commutes with d. Evaluation of the balanced tensor induces a natural degreewise isomorphism of complexes K(R) tensor_R M ≅ K(M). It is compatible with internal shift and the k-linear U-action.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-complex`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`.

**Source.** EVW16, §4.1, p.748; Proposition4.13 proof, p.754.

**Construction or proof.** On each basis tuple, d acts by left multiplication by r_g on the R factor, so it commutes with every right multiplication. The free-right-module tensor evaluation sends ((w tensor r) tensor m) to w tensor rm, with inverse on the unit generator; check d on a basis.

**Acceptance.** This does not make the generator chain homotopies right R-linear.

### Null-homotopies for positive generators {#generator-homotopy}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/generator-homotopy** (construction). For g∈c define a k-linear homotopy S_g on the tuple-orbit basis of K(R). For a tuple w of length q and monoid basis element s with boundary b, put S_g(w;s)=(g^((boundary(w)b)^-1),w;s). It raises chain degree and internal degree by1, extends linearly in s, and satisfies d S_g+S_g d = right multiplication by r_g. No right R-linearity of S_g is required or claimed.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-complex`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-right-complex`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/braid-orbit-monoid`.

**Source.** EVW16, Lemma4.11 proof, p.753.

**Construction or proof.** The total boundary is invariant under changing the tuple representative of s, so the prefix is well-defined. Compute the first deletion as the right multiplication term using the Hurwitz relation; match all other deletions against S_g d with opposite signs. Include chain degree0 in this calculation.

**Uses.** EVW Lemma4.11: Kill the positive ideal on regular K-homology.

**API.**

- `HurwitzStability.generatorHomotopy_basis` (simp): On a monoid basis element, S_g prefixes the displayed conjugate of g.
- `HurwitzStability.generatorHomotopy_degree` (data): S_g has homological degree+1 and internal degree+1.
- `HurwitzStability.generatorHomotopy_identity` (relation): d S_g+S_g d equals the k-linear right-r_g chain map.
- `HurwitzStability.generatorHomotopy_homology` (compatibility): Right multiplication by r_g induces the zero map on K(R) homology.

**Checks and worked examples.**

- `HurwitzStability.generatorHomotopy_unit` (example): S_g(empty;1)=((g);1), so dS_g(empty;1)=(empty;r_g).
- `HurwitzStability.generatorHomotopy_suffix` (example): On (empty;s) with boundary b, the prefix is b g b^-1, and r_(b g b^-1)s=s r_g.
- `HurwitzStability.generatorHomotopy_trivial` (example): For G={1}, it simply prefixes1, and the alternating differential identity is multiplication by t in every chain degree.
- `HurwitzStability.generatorHomotopy_not_rlinear` (counterexample): When b does not commute with g, replacing the prefix by a constant g loses the right-multiplication identity; the suffix boundary cannot be ignored.

**Acceptance.** The conjugation uses boundary(w) times boundary(s), in that order, then its inverse in exponent notation.

### The positive ideal kills regular K-homology {#positive-action}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/positive-action** (theorem). For every q>=0, the graded right R-module H_q(K(R)) is annihilated by R_positive. In particular right multiplication by U, and hence its equal left action on coefficients, is zero on homology.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/generator-homotopy`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/central-sum`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-right-complex`.

**Source.** EVW16, Lemma4.11, p.753.

**Construction or proof.** Each r_g acts trivially by its explicit chain homotopy. Since the r_g generate the positive ideal, every positive-degree element acts trivially. U is positive-degree and central, so its left coefficient action is its right action.

**Acceptance.** Annihilation holds on homology, while the coefficient multiplication chain map need not be zero.

### Regular K-homology has linear support {#regular-k-bound}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/regular-k-bound** (theorem). For every q>=0, deg H_q(K(R))<=A2+q. In particular the first two K-homology groups of R have finite degree.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/component-stability`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/positive-action`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-right-complex`.

**Source.** EVW16, Proposition4.12, pp.753–754.

**Construction or proof.** U is an isomorphism on K(R)_q in source internal degrees above A1+q. Use the neighboring terms to obtain the same bound on cycles. Repeatedly divide a cycle by U in the stable degrees to generate its cycle module in degrees <=A1+a+q. The quotient homology is killed by positive R, so generation in that range becomes a support bound.

**Acceptance.** Do not turn the whole K-complex into a bounded complex: q is unbounded.

### Universal coefficients for the K-complex {#k-universal-coefficients}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-universal-coefficients** (construction). For M as above, the right-free complex K(R) gives a first-quadrant spectral sequence E2_(i,j)=Tor_i^R(H_j(K(R)),M) converging to H_(i+j)(K(M)), preserving internal grading. Consequently deg H_q(K(M))<=max(deg H_0^aug(M),deg H_1^aug(M))+A1 q+4A1+A2. This bound uses the chosen A1>=1.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-right-complex`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/regular-k-bound`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/general-tor-bound`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes`; `mathlib:CategoryTheory.SpectralSequence`.

**Source.** EVW16, Proposition4.13, p.754, with the slope correction in E5.

**Construction or proof.** Specialize the supplier hyperhomology comparison to the right-free complex K(R) and a free left resolution of M. The tensor comparison identifies the abutment. At i+j=q apply the general Tor bound and regular K bound. The resulting term j+A1 i is <=A1 q precisely because A1>=1. First-quadrant diagonals are finite even though K is unbounded above.

**Uses.** EVW proof of Theorem4.2, §4.14: Bound all higher K-homology from low augmentation Tor.

**API.**

- `HurwitzStability.kUct_page` (data): The page has Tor of the right R-module H_j K(R) against the left module M.
- `HurwitzStability.kUct_convergence` (compatibility): Its finite total-degree filtration abuts to H_(i+j) K(M).
- `HurwitzStability.kUct_map` (functoriality): R-linear maps M->Mprime induce compatible spectral-sequence and homology maps.
- `HurwitzStability.kUct_support` (relation): Support of each total abutment is bounded by the maximum of the total E2 diagonal supports.

**Checks and worked examples.**

- `HurwitzStability.kUct_regular` (compatibility): For M=R higher Tor vanishes and the page degenerates to H_j K(R).
- `HurwitzStability.kUct_aug` (example): For R=k[t],M=k,U=t, H_q K(k)=k[q]; the corrected A1>=1 permits its support in degree q.
- `HurwitzStability.kUct_bad_slope` (counterexample): With the printed A1=0,A2=1 for this example, max(low augmentation Tor degrees)+A1 q+4A1+A2=2, but H_3 K(k) has degree3.

**Acceptance.** No claimed estimate with A1=0 survives the trivial-group augmentation example.

### Low K-homology controls augmentation Tor {#low-k-tor}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/low-k-tor** (theorem). There is a natural isomorphism H_0^aug(M) ≅ H_0(K(M)), and a natural surjection H_1(K(M)) -> H_1^aug(M), preserving internal grading. Thus deg H_i^aug(M)<=deg H_i(K(M)) for i=0,1.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-complex`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes`.

**Source.** EVW16, §4.14, equation(4.14.1), pp.754–755.

**Construction or proof.** Factor K(M)_1->M as k[c] tensor_k M[1] -> R_positive tensor_R M -> M. The first map sends g tensor m to r_g tensor m and is surjective. The K degree2 boundaries map to zero in R_positive tensor_R M by the ring relation. Tensoring R_positive->R->k identifies the kernel of the second map with Tor_1^R(k,M); surjectivity of the first map gives the quotient.

**Acceptance.** This is a surjection in degree1, not an isomorphism of all K-homology with Tor.

### Higher K-homology from two low degrees {#linear-k-bound}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/linear-k-bound** (theorem). Write h_i=deg H_i(K(M)). If h_0 and h_1 are finite, then for every q>1, h_q<=max(h_0,h_1)+A0 q. In the zero-low-homology case use the support formulation, which also forces the higher groups to vanish.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-universal-coefficients`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/low-k-tor`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`.

**Source.** EVW16, Theorem4.2, equation(4.2.1), p.748; proof §4.14, pp.754–755, with enlarged constants.

**Construction or proof.** Substitute the low-K bounds for the two low augmentation Tor degrees in the corrected universal-coefficient estimate. For q>=2, A1 q+4A1+A2 <=(5A1+A2)q. If both low groups vanish, augmentation coinvariants vanish, and graded Nakayama for the nonnegative R-module M first forces M=0.

**Acceptance.** Only q>1 uses this formula; q=0,1 remain the supplied hypotheses.

### Stabilization from low K-homology {#module-stability}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/module-stability** (theorem). If b>=max(deg H_0(K(M)),deg H_1(K(M))) is a finite nonnegative integer, U:M_n->M_(n+a) is an isomorphism for every n>=b+A0. For M=R such a b exists. All constants depend only on (G,c) and the fixed admissible D, not on the permitted coefficient field.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/torsion-defect-bound`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/low-tor-defect`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/low-k-tor`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/regular-k-bound`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`.

**Source.** EVW16, Theorem4.2, p.748; §4.14, p.754.

**Construction or proof.** The two defect estimates give A(M)<=b+5A1. Since a>=1, A0=5A1+A2>=5A1+1. For n>=b+A0 both source kernel and target cokernel lie beyond their finite support cutoffs. Apply the separate kernel/cokernel criteria.

**Acceptance.** The domain degree is n, not n+a; retain that convention when using this theorem in the induction.

**Layer completion obligations.** Close G1: the concrete noncommutative graded right/left derived-tensor bridge and convergent hyperhomology/change-of-rings interfaces in DGAInfinity Layers0,1,5. The independent review confirms the corrected constants and homogeneous splice (E5,E6); the supplier bridge remains open.

## HS.2 — The truncated arc resolution

### The marked-disc braid adapter {#disc-mapping-class-adapter}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/disc-mapping-class-adapter** (theorem). For the oriented compact smooth disc with n interior marked points, take orientation-preserving diffeomorphisms fixing the boundary pointwise and preserving the marked set setwise. Import their C-infinity topological group from GeometricTopology and their isotopy-class mapping group from the mapping-class supplier. Construct the compatible isomorphisms pi_0 Diff^+(D,P;boundary) ≅ Mod(D,P;boundary) ≅ TauCeti.BraidGroup n ≅ pi_1(Conf_n). A native sigma_i corresponds to the positive half twist interchanging the two adjacent marked points; pure mapping classes and full twists are different.

**Dependencies.** `tauceti:TauCeti.BraidGroup`; `tauceti:TauCeti.BraidGroup.sigma`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/configuration-braid-group`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `tauceti:TauCetiRoadmap/GeometricTopology#layer-3-diffeomorphism-groups-with-the-c-topology`.

**Source.** EVW16, §2.1, p.738; §5.5 and Proposition5.6, pp.758–760.

**Construction or proof.** Use the parent configuration/braid comparison and the supplier disc point-pushing comparison between isotopies of marked diffeomorphisms and loops of unordered configurations. The required smooth/topological relative comparison is an explicit supplier request. Normalize on adjacent half twists and verify compatibility with the parent left Hurwitz action, boundary fixation and block inclusion. Include n=0,1 separately.

**Acceptance.** No mapping-class assertion is inferred from the native algebraic abbreviation alone.

### The based arc complex {#geometric-arcs}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/geometric-arcs** (definition). Fix a boundary basepoint star on D and n distinct interior points P. A vertex is the isotopy class relative to star and P of a smooth embedded arc from star to one marked point, with interior in int(D) minus P and inward non-tangent initial derivative. A q-simplex is a collection of q+1 such classes with representatives disjoint away from star and with distinct marked endpoints and distinct ordered inward tangent rays near star. Order the vertices by their counterclockwise rays at star. Deleting an arc gives its semisimplicial faces. There are no q-simplices for q>=n. Orientation-preserving boundary-fixed marked diffeomorphisms act, and the action descends to B_n through the disc adapter.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/disc-mapping-class-adapter`; `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Source.** EVW16, §5.5, pp.758–759; Hatcher–Wahl Proposition7.2; HW10, Definition3.4, manuscript p.16; Proposition7.2, pp.34–35.

**Construction or proof.** Use the supplier smooth embedding/isotopy carriers and take their relative isotopy quotient. The disjoint-realization condition defines a simplicial complex; ordered tangent rays give the semisimplicial ordering. Show the ordering is isotopy independent for disjoint classes. Distinct endpoints imply the dimension bound; forgetting that condition would give another complex.

**Uses.** EVW Proposition5.6: Provide connectivity and geometric stabilizers for the coset model; EVW Proposition5.1: Supply a highly connected resolution of Hur_n.

**API.**

- `HurwitzStability.arcVertex` (constructor): A permitted embedded arc determines a vertex; relative isotopic arcs give the same vertex.
- `HurwitzStability.arcSimplex_iff` (characterisation): A finite collection spans a simplex exactly when it has simultaneous representatives as stated, with distinct endpoints.
- `HurwitzStability.arcFace` (simp): The ith face deletes the ith counterclockwise ordered arc.
- `HurwitzStability.arcAction` (structure): The native braid group acts simplicially and preserves the local ordering.
- `HurwitzStability.arc_empty_above` (simp): The q-simplex set is empty for q>=n.
- `HurwitzStability.arc_isotopy_transport` (functoriality): A marked orientation-preserving disc diffeomorphism transports the complex, preserving identities and composition.

**Checks and worked examples.**

- `HurwitzStability.arcs_zero` (example): With n=0 there are no vertices and the realization is empty.
- `HurwitzStability.arcs_one` (example): With n=1 there is one vertex up to relative isotopy and no edges.
- `HurwitzStability.arcs_distinct_endpoints` (counterexample): Two arcs ending at the same marked point cannot form an edge, even if their interiors are disjoint.
- `HurwitzStability.arcs_winding` (counterexample): With other punctures present, arcs to a fixed endpoint need not be isotopic; vertices are not merely the finite set P.

**Acceptance.** Require simultaneous representatives, rather than pairwise disjointness asserted without representatives.

### The truncated braid-coset model {#tail-cosets}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/tail-cosets** (definition). For n,q>=0 let L_(n,q) be the subgroup of B_n generated by the classical generators sigma_(q+2),...,sigma_(n-1). Empty generator ranges give the trivial subgroup; for q<n its shifted-strand inclusion identifies it with B_(n-q-1). Define A(n)_q=B_n/L_(n,q) if q<n and the empty set if q>=n. The quotient is by left cosets, with B_n acting by left multiplication. For q>=1 and q<n define s_(q,i)=sigma_(i+1)...sigma_q and face_i(bL_q)=b s_(q,i)L_(q-1), 0<=i<=q; s_(q,q)=1. Add the unique augmentation A(n)_0->point.

**Dependencies.** `tauceti:TauCeti.BraidGroup`; `tauceti:TauCeti.BraidGroup.sigma`; `mathlib:Subgroup.closure`; `mathlib:QuotientGroup.instHasQuotientSubgroup`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/configuration-braid-group`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Source.** EVW16, §5.2, p.756; upper range corrected as in E3.

**Construction or proof.** Generate the native subgroup from exactly the tail indices, converting classical to zero-based indexing. Form native subgroup quotients only in the permitted dimensions. Prove the shifted inclusion is injective using the parent configuration-space braid comparison. Put m=n-q-1 moving points in a smaller disc, and keep the first q+1 points outside it. Lift a nullhomotopy in the unordered n-point configuration space to the finite cover recording which m points form the moving block; forget the other block. This gives a nullhomotopy in the m-point configuration space of the full disc. Inclusion of the smaller disc induces a homotopy equivalence on these configuration spaces, by a shrinking isotopy, so the original m-strand loop was null. For m=0,1 both source braid groups are trivial. Its image is exactly the subgroup generated by the shifted adjacent half twists. Use products in increasing classical index; define faces only when their source exists. The following node proves well-definedness and the semisimplicial laws.

**Uses.** EVW Proposition5.3: Prove the resolution identities by braid relations; EVW Proposition5.6 and §5.4: Identify geometric arcs and compute equivariant homology rows.

**API.**

- `HurwitzStability.tailSubgroup` (constructor): L_(n,q) is the subgroup closure of native sigma_i with i.val>=q+1.
- `HurwitzStability.tailSubgroup_shift` (equivalence): For q<n the shifted braid embedding B_(n-q-1)->B_n is injective and has image L_(n,q).
- `HurwitzStability.arcCosets_piece` (data): The qth term is a transitive B_n-set for q<n and empty above that range.
- `HurwitzStability.arcCosets_face` (simp): Faces are right multiplication by s_(q,i) followed by the larger-tail quotient.
- `HurwitzStability.arcCosets_action` (compatibility): Left multiplication by B_n commutes with all faces and with augmentation.

**Checks and worked examples.**

- `HurwitzStability.cosets_zero` (example): A(0)_q is empty for every q>=0.
- `HurwitzStability.cosets_one` (example): A(1)_0 is a singleton and A(1)_1 is empty, despite B_1 being trivial.
- `HurwitzStability.cosets_top` (example): For n>=1, A(n)_(n-1)=B_n as a left B_n-set, since L_(n,n-1) is trivial.
- `HurwitzStability.cosets_tail_index` (counterexample): For n=3,q=0 the tail is generated by classical sigma_2 (native index1), not sigma_1.

**Acceptance.** Do not extend B_n/L_q to q>=n; its quotient would be nonempty and would spoil the arc model.

### Coset faces satisfy semisimplicial identities {#coset-faces}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/coset-faces** (theorem). The faces in the truncated coset model are independent of the representative and B_n-equivariant. For q>=2 and 0<=i<j<=q, face_i face_j=face_(j-1) face_i. Together with augmentation these make A(n) an augmented semisimplicial B_n-set, of dimension n-1 if n>0. No degeneracy maps are asserted.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/tail-cosets`; `tauceti:TauCeti.BraidGroup.sigma_mul_sigma_comm`; `tauceti:TauCeti.BraidGroup.sigma_braid`.

**Source.** EVW16, Proposition5.3 and the vertex computation, pp.756–757.

**Construction or proof.** L_q commutes with each sigma_j for j<=q, and L_q is included in L_(q-1); this proves well-definedness under b->b l. For j=q cancel the additional sigma_q modulo L_(q-2). For j<q move it through the increasing products using adjacent braid relations, as in Proposition5.3. Empty top terms have unique faces.

**Acceptance.** With q=1 the two faces are b sigma_1 L_0 and bL_0; the order is fixed.

### Arc stabilizers and the coset identification {#arc-stabilizer}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/arc-stabilizer** (theorem). For 0<=q<n, B_n acts transitively on ordered q-simplices of the geometric arc complex. The stabilizer of the standard fan of q+1 straight arcs is exactly L_(n,q). The maps bL_q -> b applied to the standard fan are equivariant bijections compatible with all faces and augmentation, hence identify the geometric and truncated coset semisimplicial sets.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/disc-mapping-class-adapter`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/geometric-arcs`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/tail-cosets`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/coset-faces`; `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`; `tauceti:TauCetiRoadmap/GeometricTopology#layer-3-diffeomorphism-groups-with-the-c-topology`.

**Source.** EVW16, Proposition5.6 and equation(5.6.1), pp.759–761.

**Construction or proof.** Straighten two fans near the boundary and match endpoints by a marked-disc diffeomorphism. Use disjoint tubular neighborhoods and relative isotopy extension to carry one fan to the other. For a diffeomorphism fixing all arc classes, fix representatives successively. In the cut punctured disc, remove intersections of the next arc isotopy with earlier arcs by innermost-circle surgery; the obstruction is pi_2 of the punctured cut disc, zero because it retracts to a graph. Request the needed relative smooth extension/cutting API explicitly. After simultaneous pointwise fixing, isotope to the identity on a regular neighborhood of the fan. The remaining disc has n-q-1 punctures, so its image is the shifted tail subgroup. Conversely those tail braids fix the fan. Compute deletion of the ith standard arc as s_(q,i) applied to the shorter fan, giving exactly the coset faces.

**Acceptance.** A stabilizer of isotopy classes is not immediately a pointwise stabilizer; the simultaneous-straightening step is essential.

### Connectivity of the arc resolution {#arc-connectivity}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/arc-connectivity** (theorem). For n>=1, the geometric arc realization, and hence |A(n)|, is (n-2)-connected. For n=1 the convention means nonempty; for n=2 it means path connected. For n=0 retain the explicitly empty complex. Only this connectivity, not a stronger contractibility assertion, is used.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/geometric-arcs`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/arc-stabilizer`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Source.** EVW16, Proposition5.6, p.759; Hatcher–Wahl Lemma7.1 and Proposition7.2; HW10, Definition3.4, manuscript p.16; Lemma7.1 and Proposition7.2, manuscript pp.34–35.

**Construction or proof.** Use the complex allowing repeated endpoints as a contractible surgery complex (Hatcher–Wahl Lemma7.1). In the disc case, put arcs in general position and push away intersections with a chosen arc via the first intersection surgery; simplicial approximation makes this a finite simplicial null-homotopy. For a sphere of dimension <=n-2 in the distinct-endpoint subcomplex, choose an extension in the larger complex. Remove maximal bad simplices with repeated endpoints. The link is a join of smaller arc complexes in cut discs; induction and the dimension count in Hatcher–Wahl Proposition7.2 give the replacement extension. Use simplicial approximation, the join-connectivity bound, and the relative extension criterion for connectivity from AlgebraicTopology. Record this precise join/simplicial-approximation interface as a supplier gap rather than assuming it is already in the pinned library.

**Acceptance.** Use the source proposition with distinct endpoints; the original n-puncture count controls the bound.

**Layer completion obligations.** Close G3: smooth boundary-relative setwise-marked disc comparison, relative isotopy extension and simultaneous arc fixing. Close the simplicial-approximation/join interfaces of G4 for the read Hatcher–Wahl proof.

## HS.3 — The arc spectral sequence for Hurwitz homology

### Graded Hurwitz homology modules {#hurwitz-homology-module}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/hurwitz-homology-module** (construction). For p>=0 define M_p=direct_sum_(n>=0) H_p(Hur_n;k), internally graded by n. Give it the left R-action induced by the degree-zero part of homology multiplication under gluing. Then M_0=R as a graded left module, and simultaneous G-conjugation is an action on M_p compatible with the R-action and U. In each fixed n its homology is finite dimensional by the finite-cell bound in HS.5; that finiteness is not used to define M_p.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/gluing`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/component-ring`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-conventions`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Source.** EVW16, §5, equation(5.0.2), p.755; §2.6, p.742.

**Construction or proof.** Apply the cross product H0(Hur_m;k) tensor Hp(Hur_n;k)->Hp(Hur_(m+n);k) and the induced gluing map. Associativity and the empty tuple give the module axioms; degree-zero identification gives M0=R.

**Uses.** EVW Proposition5.1: Identify the arc-sequence rows with K(M_p); EVW Theorem6.1: Run the induction on p.

**API.**

- `HurwitzStability.homologyModule_piece` (data): (M_p)_n is H_p(Hur_n;k).
- `HurwitzStability.homologyModule_action` (simp): A component basis element acts by gluing a representative component on the left.
- `HurwitzStability.homologyModule_zero` (equivalence): M_0 identifies with the regular left R-module.
- `HurwitzStability.homologyModule_conjugate` (compatibility): g(r m)=(g r)(g m), so the G-invariant U acts G-equivariantly.
- `HurwitzStability.homologyModule_coefficients` (functoriality): Field extension induces the natural homology comparison, respecting the grading and component action.

**Checks and worked examples.**

- `HurwitzStability.homologyModule_empty` (example): (M_0)_0=k while (M_p)_0=0 for p>0, since Hur_0 is a point.
- `HurwitzStability.homologyModule_regular` (compatibility): In degree0 homology, the action is precisely multiplication of the monoid basis in R.
- `HurwitzStability.homologyModule_subgroups` (counterexample): Taking only full-monodromy tuples does not give the same M_0=R: e.g. for nontrivial G its degree-zero piece is empty.

**Acceptance.** p denotes homology degree, n the number of branch points; never combine them into one grading.

### The Borel arc resolution {#borel-arc-resolution}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/borel-arc-resolution** (construction). For each n form the semisimplicial space X(n)_q=EB_n×_(B_n)(A(n)_q×c^n) and its thick realization X(n). Its augmentation to Hur_n has, in the covering-bundle model, fibre |A(n)|. For n>=2 the augmentation induces an isomorphism H_t(X(n);k)->H_t(Hur_n;k) whenever t<n-2. Its skeletal filtration is bounded by n-1 in the semisimplicial direction.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/arc-connectivity`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/coset-faces`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/topological-hurwitz-covers`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Source.** EVW16, §5.3, p.757.

**Construction or proof.** Realization of the discrete semisimplicial B_n-set commutes with its Borel bundle, giving the associated bundle with fibre |A(n)| over c^n//B_n. Apply connectivity-to-homology and the homology spectral sequence of this actual fibre bundle to obtain the stated safe isomorphism range. Use the finite-dimensional skeletal filtration for the next node.

**Uses.** EVW Proposition5.1: Supply a genuine abutment and a justified comparison range.

**API.**

- `HurwitzStability.arcBorel_term` (constructor): X(n)_q is the indicated homotopy orbit space.
- `HurwitzStability.arcBorel_augmentation` (projection): The augmentation forgets the arc simplex and realizes to X(n)->Hur_n.
- `HurwitzStability.arcBorel_fibre` (equivalence): The fibre over a marked tuple-cover point is the arc realization.
- `HurwitzStability.arcBorel_homology` (compatibility): The augmentation gives homology isomorphisms for t<n-2.
- `HurwitzStability.arcBorel_filtration` (data): The filtration attaches q-simplices only in 0<=q<n; its quotients produce the usual semisimplicial homology sequence.

**Checks and worked examples.**

- `HurwitzStability.arcBorel_top` (example): For q>=n the term is empty; there are no filtration pieces beyond n-1.
- `HurwitzStability.arcBorel_one` (example): For n=1 the arc realization is a point, so the augmentation is a homotopy equivalence, even though the general safe range is vacuous.
- `HurwitzStability.arcBorel_zero` (counterexample): For n=0 the realization is empty while Hur_0 is a point; no unconditional equivalence may be asserted.

**Acceptance.** The final spectral sequence always abuts to X(n); its replacement by Hur_n is restricted by total degree.

### Identification of arc rows with K-terms {#row-identification}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/row-identification** (comparison). For 0<=q<n, X(n)_q is homotopy equivalent to c^n//L_q and then to c^(q+1)×Hur_(n-q-1). This gives H_p(X(n)_q;k) ≅ (K(M_p)_(q+1))_n. Under these identifications the face induced by bL_q->b s_(q,i)L_(q-1) acts on tuples by s_(q,i)^-1; it removes g_i from the first q+1 entries and prefixes g_i^(g_(i+1)...g_q) to the residual tuple. Thus the alternating face differential is exactly K differential.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/borel-arc-resolution`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/tail-cosets`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/arc-stabilizer`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/hurwitz-homology-module`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-complex`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/hurwitz-braid-action`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Source.** EVW16, §§5.3–5.4 and Lemma5.4, pp.757–758.

**Construction or proof.** Use equivariant induction B_n/L_q to identify the Borel term with c^n//L_q. The tail subgroup fixes the first q+1 entries and acts on the remaining entries by the parent Hurwitz action. On EB_n×_(L_q)c^n a face is (e,g)->(e s_(q,i),s_(q,i)^-1 g). The change in the EB_n coordinate is freely homotopic to the identity at this stage; the inverse braid action is essential. Apply the finite discrete-set Kunneth comparison and calculate the successive inverse Hurwitz moves, giving the stated suffix conjugation.

**Acceptance.** At q=0 the term is k[c] tensor H_p(Hur_(n-1)), not H_p(Hur_n).

### The Hurwitz arc spectral sequence {#arc-spectral-sequence}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/arc-spectral-sequence** (construction). The skeletal filtration of X(n) gives a first-quadrant homological spectral sequence E1_(q,p)=H_p(X(n)_q;k)=(K(M_p)_(q+1))_n for p,q>=0, vanishing for q>=n, with d1 the alternating face map and d_r of bidegree(-r,r-1). It converges to H_(p+q)(X(n);k). For p+q<n-2 its abutment identifies with H_(p+q)(Hur_n;k). For q>0, E2_(q,p)=(H_(q+1)K(M_p))_n; E2_(0,p)=coker(K(M_p)_2->K(M_p)_1)_n.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/row-identification`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/borel-arc-resolution`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-complex`; `mathlib:CategoryTheory.SpectralSequence`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Source.** EVW16, Proposition5.1, pp.755–756; construction §§5.3–5.4, pp.757–758.

**Construction or proof.** Specialize the supplier skeletal filtered-chain construction to X(n). Use rows from the comparison and its signed face differential. The filtration has finitely many q for fixed n; prove convergence to X(n) first. Then apply the augmentation only in the valid total-degree range. Taking row homology gives H_(q+1)K for q>0. The missing K0 is accounted for by the edge map below, rather than inserted into the nonaugmented page.

**Uses.** EVW proof of Theorem6.1: Control the low K-homology of M_P by lower homology rows.

**API.**

- `HurwitzStability.arcSequence_page` (data): The E1 page, d1 and higher differential bidegrees are as stated.
- `HurwitzStability.arcSequence_row` (compatibility): For q>0 row homology is H_(q+1)K; the q=0 row homology is the larger cokernel.
- `HurwitzStability.arcSequence_convergence` (compatibility): The filtration abuts to X(n) and agrees with Hur_n homology only in total degrees below n-2.
- `HurwitzStability.arcSequence_edge` (projection): The augmentation gives an edge map e:E2_(0,p)->(M_p)_n induced by K1->K0.
- `HurwitzStability.arcSequence_natural` (functoriality): Maps of the coefficient field and the G-conjugation action commute with pages, differentials, filtrations and augmentation.

**Checks and worked examples.**

- `HurwitzStability.arcSequence_bottom` (example): At q=0 its E1 term is k[c] tensor Hp(Hur_(n-1)); d1 from q=1 has the two K deletion terms.
- `HurwitzStability.arcSequence_missing_term` (counterexample): For R=k[t],M=R and internal n=1, coker(K2->K1)=k whereas H1 K(R) in degree1 is zero; the two zeroth-column formulas differ.
- `HurwitzStability.arcSequence_degree_range` (counterexample): An E2 term with total degree n-2 may still be defined, but the stated augmentation theorem does not identify its abutment with Hur_n homology.
- `HurwitzStability.arcSequence_top_zero` (example): All E1 terms q>=n vanish because K_(q+1) has internal degree at least q+1.

**Acceptance.** Do not silently replace the zeroth-column cokernel by H1(K).

### The low K-homology edge sequence {#edge-low-k}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/edge-low-k** (theorem). For every p,n there is an exact sequence 0->(H_1 K(M_p))_n -> E2_(0,p) -> (M_p)_n -> (H_0 K(M_p))_n ->0, where the middle map is induced by the K differential K1->K0 and equals the augmentation edge. In the range p<n-2 its image and kernel are determined by the abutment filtration and incoming spectral-sequence differentials.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/arc-spectral-sequence`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-complex`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/low-k-tor`.

**Source.** EVW16, Theorem6.1 proof, p.762; implicit row augmentation in Proposition5.1.

**Construction or proof.** Pure chain algebra gives ker(coker(K2->K1)->K0)=H1(K) and cokernel H0(K). Use the explicit gluing identification of K1->K0 in the row comparison to identify this map with the geometric augmentation. There are no outgoing differentials from column0.

**Acceptance.** The middle edge map is not assumed injective or surjective before higher rows are bounded.

**Layer completion obligations.** Close G2: associated Borel realization, skeletal singular-chain filtration, finite-diagonal convergence and the explicit augmentation edge comparison, using AlgebraicTopology Stages4,5,8.

## HS.4 — Linear stability and finite quotients

### Uniform degree bounds for Hurwitz homology {#inductive-degree}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/inductive-degree** (theorem). For every p,q>=0, deg H_q(K(M_p))<=A2+A0(3p+q), with constants chosen independently of k. For p>0 one has the stronger low-degree bounds deg H_0 K(M_p),deg H_1 K(M_p)<=A2+3A0 p.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/regular-k-bound`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/linear-k-bound`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/arc-spectral-sequence`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/edge-low-k`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/hurwitz-homology-module`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`.

**Source.** EVW16, Theorem6.1 proof, pp.761–763.

**Construction or proof.** Induct on p. For p=0, M0=R and the regular K bound applies; A0>=1 absorbs its slope. For p=P>0 and n>A2+3A0 P, the induction hypothesis kills incoming E2_(j,P+1-j) for j>=2: their degrees are <=A2+A0(3P+4-2j). It also kills other total-P filtration pieces E2_(j,P-j) for j>=1: their degrees are <=A2+A0(3P+1-2j). Since A1>=1 gives A2>=2,A0>=7, the same n satisfies P<n-2. Thus E2_(0,P) maps isomorphically onto (M_P)_n. The exact edge sequence kills both low K groups there. Apply the linear K bound for q>1. For q=0,1 the preceding stronger bounds imply the displayed uniform estimate.

**Acceptance.** Incoming differentials start at j=2 after taking E2; treating column0 as H1(K) would invalidate this argument.

### Marked Hurwitz homological stability {#marked-stability}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/marked-stability** (theorem). For finite G and a nonsplitting class c, choose the actual central sum U_D and let a=Dd. There exist nonnegative integers A,B depending only on (G,c), independent of all fields k with |G| invertible, such that U_D:H_p(Hur_n;k)->H_p(Hur_(n+a);k) is an isomorphism whenever n>Ap+B, for every p,n>=0. For the fixed group the proof permits A=3A0 and B=A2+A0+2; these may subsequently be enlarged for the subgroup induction. U_D is the k-linear sum of power-block gluing maps.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/inductive-degree`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/module-stability`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/central-sum`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/hurwitz-homology-module`.

**Source.** EVW16, Theorem6.1, equation(6.1.1), p.761 and proof pp.761–763.

**Construction or proof.** Use b=A2+3A0 p as a common cutoff for the two low K groups. The module stability criterion gives isomorphisms for n>=b+A0. The stated conservative A,B ensure this inequality for every nonnegative p; all data were chosen from finite sets and integral matrices before the coefficient field.

**Acceptance.** No single degree-one branch insertion is asserted to be stable. No positive-characteristic field dividing |G|, and no integral homology coefficient ring, is included.

### Full-monodromy Hurwitz stability {#full-monodromy-stability}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/full-monodromy-stability** (theorem). Choose D simultaneously for all subgroups generated by their intersections with c. After enlarging A,B depending only on (G,c), the same U_D restricts to an isomorphism H_p(CHur_n;k)->H_p(CHur_(n+a);k) for n>Ap+B. The diagonal operator on the exact-H monodromy stratum is U_H=sum_(g∈c∩H) r_g^(Dd), viewed in the component ring for (H,c∩H). There is no factor |c|/|c∩H|.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/marked-stability`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/component-stability`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/nonsplitting`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/gluing`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/topological-hurwitz-covers`.

**Source.** EVW16, Theorem6.1, equation(6.1.2), pp.761–763; correct diagonal normalization of (6.1.6), E4.

**Construction or proof.** Decompose marked Hur_n as the disjoint union of exact-generated-subgroup subcovers. U sends an H-stratum only to supergroups of H. Its diagonal part consists exactly of summands with g in H. Induct on |G|. Proper exact-H diagonal blocks are the full-monodromy stability operators for (H,c∩H); empty or nongenerating intersections contribute zero. Choose a common multiple of all finite permutation exponents and common maxima of their linear ranges, before coefficients. The quotient by the full-G subspace has a finite filtration with these proper diagonal blocks. Their isomorphisms and marked stability imply the full-G kernel isomorphism. Choose final A,B as maxima of the finitely many subgroup ranges.

**Acceptance.** For the one-element group, full monodromy equals all monodromy, including n=0. For nontrivial G the empty tuple is excluded from CHur_0.

### Homology of the simultaneous-conjugation quotient {#finite-quotient-homology}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/finite-quotient-homology** (theorem). For X=Hur_n or CHur_n, with finite G and |G| invertible in k, the comparison X//G->X/G induces a homology isomorphism and H_p(X/G;k) ≅ H_p(X;k)_G. On an exact-H tuple stratum the point stabilizer is C_G(H). On CHur_n it is Z(G), so the G-action on CHur_n is free if G is center-free. There is no claim that the G-action on all Hur_n is free.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroups:IG.5/forget-hurwitz-marking`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/topological-hurwitz-covers`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Source.** EVW16, Corollary6.2 proof, pp.763–764.

**Construction or proof.** Group the exact-H strata into conjugacy orbits. Each block is G×_(N_G(H)) X_H. The centralizer C_G(H) fixes X_H pointwise, and N_G(H)/C_G(H) acts freely, because point stabilizers are exactly the centralizer. For this block the Borel-to-ordinary comparison has acyclic BC_G(H) fibre; finite-group averaging and the Cartan–Leray comparison give the homology isomorphism. Assemble the blocks. This avoids asserting one globally constant fibre bundle when centralizers change between components. The G-homology spectral sequence collapses to coinvariants because |G| is invertible. On full monodromy substitute H=G.

**Acceptance.** Keep the point stabilizer distinct from the normalizer that preserves an entire exact-H stratum.

### Unmarked Hurwitz homological stability {#unmarked-stability}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/unmarked-stability** (theorem). Assume G is center-free and c is nonsplitting. For every permitted coefficient field k, U_D induces isomorphisms H_p(Hur_n/G;k)->H_p(Hur_(n+a)/G;k) and H_p(CHur_n/G;k)->H_p(CHur_(n+a)/G;k) whenever n>Ap+B, with the common field-independent constants above.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/marked-stability`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/full-monodromy-stability`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/finite-quotient-homology`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/central-sum`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/gluing`.

**Source.** EVW16, Corollary6.2, pp.763–764.

**Construction or proof.** G-invariance of the central sum and equivariance of gluing make marked stabilization a morphism of k[G]-modules. Apply coinvariants to the marked isomorphisms and use the finite-quotient comparison. Retain the center-free hypothesis of the exported theorem even though the quotient comparison itself holds more generally.

**Acceptance.** Averaging applies to the G-module homology isomorphism, not to a fictitious algebraic stabilization morphism.

**Layer completion obligations.** Discharge inherited HS.1–HS.3 supplier obligations before claiming either stability theorem closed. Instantiate the existing finite-cover descent/averaging API on the exact-subgroup strata; no global freeness assertion is needed.

## HS.5 — Finite-cell models and uniform etale Betti numbers

### A finite-cell model for Hurwitz covers {#finite-cell-model}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.5/finite-cell-model** (construction). For n>=2 construct the type-A Salvetti model Z_n of Conf_n using W=S_n with adjacent transpositions S={s_1,...,s_(n-1)}. Let P_n consist of (w,T), w∈W,T⊆S. Its strict order is (w,T)<(v,U) when T is a proper subset of U, w^-1 v belongs to the parabolic subgroup W_U, and length(t w^-1 v)>length(w^-1 v) for every t∈T. Define Z_n=|orderComplex(P_n)|/W for the free left W-action. Give it the coarser CW structure with one q-cell for each q-element T⊆S, using the corresponding parabolic permutohedra as characteristic cells. Establish Z_n≃Conf_n. Set Z_0 and Z_1 to a point. Lift this model along each parent finite covering Hur_n, CHur_n and their unmarked quotients of Conf_n; each lifted model has at most (2|G|)^n cells.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroups:IG.5/configuration-spaces`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/configuration-braid-group`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/topological-hurwitz-covers`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/forget-hurwitz-marking`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Source.** EVW16, Proposition2.5, p.742; Charney–Davis Theorem1.4.1 and Corollary2.2.3; CD95, §1.2, manuscript pp.3–4; Theorem1.4.1 and proof, pp.5–7; Lemma2.2.1 and Corollary2.2.3, pp.8–9.

**Construction or proof.** Specialize the Charney–Davis construction to the finite reflection group S_n. Its braid arrangement complement modulo S_n is Conf_n, with a harmless contractible translation coordinate. The invariant good cover and nerve construction in §§1.4–1.5 give the W-equivariant homotopy equivalence to the order-complex model. No general Artin K(pi,1) conjecture is used. For each T the lower interval is the face poset of the corresponding parabolic permutohedron (a product of convex permutohedra for consecutive blocks). Its boundary is a sphere and its cell a ball. This realizes the coarsening and the quotient attaching maps; use the supplier finite-CW and good-cover interfaces explicitly requested below. The quotient has sum_q binomial(n-1,q)=2^(n-1)<=2^n cells. Pull back the parent finite covering along the homotopy equivalence and lift cells. Each fibre has size <=|c|^n<=|G|^n, including connected and unmarked subcovers.

**Uses.** EVW Proposition2.5: Bound every fixed-n field Betti number; EVW Proposition7.8: Reduce the uniform bound to a linearly bounded n.

**API.**

- `HurwitzStability.configurationCellModel` (constructor): Z_n is the specified finite-poset quotient, with point models for n=0,1.
- `HurwitzStability.configurationCellModel_cells` (data): For n>=1 its q-cells are indexed by q-element subsets of {1,...,n-1}.
- `HurwitzStability.configurationCellModel_equiv` (equivalence): The realization is homotopy equivalent to the parent unordered configuration space, with the parent braid fundamental-group identification.
- `HurwitzStability.hurwitzCellModel_cover` (compatibility): Pullback along the equivalence gives homotopy-equivalent finite covers with one lifted cell per sheet over each base cell.
- `HurwitzStability.hurwitzCellModel_bound` (relation): Each of the four Hurwitz variants has a CW model with at most (2|G|)^n cells.

**Checks and worked examples.**

- `HurwitzStability.cellModel_small` (example): Z_0 and Z_1 are points; Z_2 has one vertex and one1-cell and is a circle.
- `HurwitzStability.cellModel_n3` (example): Z_3 has one0-cell, two1-cells and one2-cell, four cells total; its fundamental-group relation is the three-strand braid relation.
- `HurwitzStability.cellModel_empty_cover` (example): For nontrivial G the connected degree-zero Hurwitz subcover is empty, hence its lifted model has zero cells rather than a forced basepoint.
- `HurwitzStability.cellModel_cover_count` (compatibility): A d-sheeted cover lifts each open base cell to d cells; omitting the sheet factor would give the wrong bound.

**Acceptance.** The general Coxeter/Artin Salvetti theory is outside this target: only the explicit finite type-A construction and cover bound are planned.

### A uniform field Betti bound {#uniform-field-betti}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.5/uniform-field-betti** (theorem). Let A,B,a be the common nonnegative integer stability constants for the four spaces, and put K=2|G|, C=K^(A+B+a+1). For center-free finite G and nonsplitting c, every permitted coefficient field k and every i,n>=0 satisfy dim_k H_i(CHur_n/G;k)<=C^(i+1). The same argument bounds the other three variants with the appropriate marked or unmarked stability hypotheses. The constants depend only on (G,c).

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.5/finite-cell-model`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/marked-stability`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/full-monodromy-stability`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/unmarked-stability`.

**Source.** EVW16, Proposition2.5, p.742; Proposition7.8 proof, p.770.

**Construction or proof.** Every fixed-n Betti number is <=K^n by the cellular chain count. If n>Ai+B, repeatedly use inverse stabilization to reach an m in the same residue class modulo a with m<=Ai+B+a; if n is already below the threshold keep m=n. Every forward map inverted has a valid source degree. Then K^m<=K^((A+B+a+1)(i+1))=C^(i+1). This proof only uses field-independent ranges, so C is also independent of coefficients.

**Acceptance.** Respect the residue class modulo a; degree-one stabilization is not available.

### Uniform etale Betti numbers {#uniform-etale-betti}

**Target InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.5/uniform-etale-betti** (theorem). Assume G is finite and center-free, c is a rational nonidentity single generating nonsplitting conjugacy class, q is a prime power with characteristic coprime to |G|, and L is a prime with L>max(|G|,q,n). For the parent arithmetic Hurwitz scheme Hn_(G,n)^c of connected tame G-covers of the affine line, allowing ramification or no ramification at infinity as in IG.5, there is C=C(G,c) such that dim_(Q_L) H_et^i(Hn_(G,n)^c over algebraic_closure(F_q),Q_L)<=C^(i+1) for every i,n>=0. The same bound holds with F_L coefficients. This is a dimension theorem; its proof supplies no Frobenius-equivariant stabilization.

**Dependencies.** `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.5/uniform-field-betti`; `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/unmarked-stability`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/fixed-degree-mod-l-comparison`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5/coefficient-tower-comparison`.

**Source.** EVW16, Proposition7.8, equations(7.8.1)–(7.8.3), pp.769–770; Remark7.9, p.770.

**Construction or proof.** For the fixed original n, use the parent analytic/mod-L comparison to CHur_n/G. Its hypotheses include L>max(|G|,q,n), rational c, and tame characteristic. The arithmetic scheme and comparison are imports, not rebuilt here. Apply the uniform topological field Betti bound with k=F_L. If reduction to smaller m is expanded, all intermediate degrees are <=n and hence the same L suffices; no comparison at n+a is needed for this bound. Use the parent compatible coefficient-tower comparison and the universal-coefficient rank inequality to pass from mod-L dimension to Q_L dimension, with finite generation and inverse limits explicitly inherited. Do not derive a Frobenius-equivariant U or fixed-q limiting Cohen–Lenstra distribution: the imported comparisons are fixed-degree, and U is a sum of nonalgebraic gluing maps.

**Acceptance.** An individual stabilization between n and n+a would require L>max(|G|,q,n+a) if expressed through the fixed-degree comparisons. Do not require the single class to be rational for the purely topological stability theorem.

**Layer completion obligations.** Close G4 for the type-A good-cover/nerve and face-poset CW coarsening and the finite-cover lifting interface. Consume the exact parent fixed-n mod-L and coefficient-tower comparison nodes with their own inherited obligations.

## Supplier interfaces and precise open inputs

Each layer has a complete target specification. The following general interfaces remain obligations of their existing owners; the dependency graph deliberately records them rather than replacing them by unverified library claims.

### tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure

Specialize internal grading to nonnegative branch number, separate from DG cochain degree. Supply internal shifts M[q]_n=M_(n-q) with a genuine zero piece for n<q, direct sums, and compatibility of ordinary graded algebras/modules with zero DG differential. Internal shifts have no Koszul signs.

Consumers: `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/component-ring`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-conventions`.

### tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules

For an arbitrary noncommutative connected nonnegative internally graded k-algebra R, supply categories of graded left/right modules and bimodules, abelian/exact structures, the balanced right-left tensor N tensor_R M with quotient relation nr tensor m=n tensor rm, universal property, tensor evaluation of free modules, and compatibility with ordinary native Module/MonoidAlgebra carriers and opposite rings. This is the zero-DG-differential specialization of the owned DG-module tensor target.

Consumers: `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-conventions`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/tensor-degree`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/graded-nakayama`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-complex`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-right-complex`.

### tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes

Supply nonnegative graded free/projective resolutions, balanced derived tensor, Tor_i^R(N,M) with right N then left M, long exact sequences, shifts, field extension, and comparison with Functor.leftDerived on the existing abelian graded-module categories. Supply the composite-derived/change-of-rings and first-quadrant hyperhomology spectral-sequence interface, including module actions, internal grading and finite-diagonal convergence. HS.1 owns only the EVW applications and support estimates, not a second general Tor theory.

Consumers: `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/stability-defects`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/change-of-rings`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/quotient-tor-degree`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/torsion-defect-bound`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/higher-quotient-tor`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/general-tor-bound`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/k-universal-coefficients`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.1/low-k-tor`.

### tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology

Supply relative and absolute singular chains over a field, H0 as the free vector space on path components, homotopy invariance, the cross product and its natural associative unital homology API for Borel gluing.

Consumers: `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/gluing`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/hurwitz-homology-module`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/finite-quotient-homology`.

### tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations

Supply thick realization of semisimplicial spaces, its skeletal filtration, filtered singular-chain comparison and convergent first-quadrant homology sequence; finite CW chains and dimension bounds; equivariant good-cover/nerve homotopy comparison and the CW coarsening of the type-A finite face poset by permutohedron cells. Generic realization/nerve interfaces are requested here; only the explicit disc/finite-type-A constructions are owned by HS.2–HS.5.

Consumers: `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/geometric-arcs`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/arc-connectivity`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/borel-arc-resolution`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/arc-spectral-sequence`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.5/finite-cell-model`.

### tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent

Supply functorial classifying spaces/Borel constructions for discrete groups, induced-action equivalence (B/L times Y)//B ≃ Y//L, realization of an associated semisimplicial bundle, singular cross product/field Kunneth, homology Serre for a genuine bundle, transfer/Cartan–Leray and finite-group averaging. Supply pullback of finite covers along homotopy equivalences and lifting of finite CW cells. The finite-stabilizer quotient comparison is proved in HS.4 by strata using these inputs. Include homotopy lifting for the finite mixed-configuration cover that records an m-element block of an unordered n-point configuration; forgetting its complementary block is used to detect injectivity of the shifted braid inclusion.

Consumers: `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.0/gluing`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/hurwitz-homology-module`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/borel-arc-resolution`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/row-identification`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/arc-spectral-sequence`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.4/finite-quotient-homology`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.5/finite-cell-model`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/tail-cosets`.

### tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead

Supply the connectivity extension criterion and relative simplicial approximation for sphere and disc maps into simplicial complexes; connectivity of finite joins, including empty/(-1)-connected boundary cases; contractible graph-retract consequences and connectivity-to-homology for the disc arc realization. These are used in the Hatcher–Wahl surgery/bad-simplex argument, without assuming a general Cohen–Macaulay theory.

Consumers: `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/arc-connectivity`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.3/borel-arc-resolution`.

### tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group

Supply relative smooth isotopy extension for a finite system of disjoint properly embedded arcs in a compact disc, disjoint tubular neighborhoods and straightening near the boundary; cutting along a fan and the graph retraction of the punctured cut disc. Include the step replacing isotopies of individual arc classes by simultaneous fixing, with the earlier arcs held fixed.

Consumers: `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/geometric-arcs`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/arc-stabilizer`.

### tauceti:TauCetiRoadmap/GeometricTopology#layer-3-diffeomorphism-groups-with-the-c-topology

Specialize the owned C-infinity diffeomorphism group to a compact oriented disc with boundary pointwise fixed and a finite interior marked set preserved setwise. Supply composition/inversion, action on smooth arcs, quotient by relative isotopy and compatibility with the topological marked-surface group. No new generic Diff carrier is introduced here.

Consumers: `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/disc-mapping-class-adapter`, `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/arc-stabilizer`.

### MappingClassGroupsAndCanonicalRepresentations:C.0

Provide the marked-disc boundary-relative, setwise-puncture specialization of the mapping-class supplier, imported from MordellLawrenceVenkatesh:LV.5/mapping-class-group. The existing C.0 hyperbolic pure-puncture monodromy nodes do not themselves supply the disc theorem. Need the smooth/topological relative comparison and point-pushing map to unordered configurations, normalized by positive adjacent half twists, including n=0,1. HS.2 owns the application/adapter to native braid generators; this request is not evidence that the generic C.0 surface objects already prove that adapter.

Consumers: `InverseGaloisAndArithmeticFundamentalGroupsPartII:HS.2/disc-mapping-class-adapter`.

**InverseGaloisAndArithmeticFundamentalGroupsPartII/G1 — Concrete noncommutative graded derived-tensor bridge.** The pins supply abstract left-derived functors and categorical Tor, but no audited turnkey equivalence with ordinary noncommutative right/left internally graded modules, free resolutions, module-sided Tor and convergent change-of-rings/hyperhomology pages. DGAInfinity Layers0,1,5 own these general constructions; the precise request is open. Read the supplier zero-DG-differential specialization, retain the branch grading separately, and establish the bridges before treating HS.1 estimates as closed.

**InverseGaloisAndArithmeticFundamentalGroupsPartII/G2 — Borel realization and skeletal convergence interfaces.** AlgebraicTopology Stages4,5 own the relevant cellular, bundle and spectral-sequence machinery, but the audited text does not explicitly construct the semisimplicial thick-realization/Borel adapter with the finite-diagonal convergence and augmentation edge used here. Requests specify the exact objects and maps. The native SpectralSequence page carrier alone provides none of this convergence. Needed also for the induced-action and genuine-bundle comparisons.

**InverseGaloisAndArithmeticFundamentalGroupsPartII/G3 — Relative marked-disc topology and smooth adapter.** The parent already identifies configuration pi1 with native B_n. The generic surface mapping-class definition is owned by LV.5 and imported by MappingClass C.0; its hyperbolic pure-surface nodes do not prove the boundary-relative marked-disc smooth comparison. The generic Diff carrier belongs to GeometricTopology Layer3. Their point-pushing/smooth-relative adapter and the simultaneous arc-fixing/isotopy-extension/cut-disc graph-retraction interface in Layer1 remain exact supplier obligations. EVW pp.759–761 is the read proof for this specialization; no inaccessible Hirsch book has been substituted for an unread theorem.

**InverseGaloisAndArithmeticFundamentalGroupsPartII/G4 — Surgery connectivity and finite-cell comparison interfaces.** Hatcher–Wahl Lemma7.1 and Proposition7.2 have been read, and their disc surgery/bad-simplex proof is assigned to HS.2. Charney–Davis Theorem1.4.1 and Corollary2.2.3 have been read and specialized explicitly to type A in HS.5. Generic relative simplicial approximation, join connectivity, equivariant nerve comparison, and face-poset CW coarsening are not supplied by a verified pin declaration or exact supplier node. AlgebraicTopology Stages4,8 must supply the requested interfaces, with boundary cases. HS.2/HS.5 own the specialized arc/poset geometry; general topology is not duplicated.

## Source corrections used by these targets

These findings concern the published first paper at the recorded hash. The earlier extraction E2–E5 supplied leads for the fibre, tensor, truncation and subgroup-scalar corrections; those locators were checked again. No correction specific to the additional locators was found in the publisher record, arXiv version listing or the accessible Venkatesh research page on2026-10-19. The Westerland preprints-page fetch timed out. The earlier preprint PDFs were not collated, so no novelty claim is made. The sequel withdrawal is a separate matter.

### E1 — misprint at Published Annals2016 version, Definition2.2 final paragraph, p.739

The final verbal fibre descriptions interchange the unrestricted generating-tuples and c-valued generating-tuples cases. The nearby assertion that both surjection sets lie in Hom^c has the same restriction problem.

Use c^n for marked c-valued covers, generating tuples in G^n for unrestricted connected covers, and generating tuples in c^n for connected c-valued covers. Sur(pi,G) lies in Hom(pi,G); only Sur^c(pi,G) must lie in Hom^c(pi,G).

An arbitrary surjection need not send each peripheral generator into the specified c. Parent IG.5 supplies the four corrected carriers and this roadmap imports them.

### E2 — misprint at Published Annals2016 version, Lemma4.6 proof, p.750

The sentence before the displayed exact sequence reverses the factors in the tensor involving M and R[U].

Use R[U] tensor_R M, as in the subsequent exact-at-the-middle sequence(4.6.3).

M is only a left module over a possibly noncommutative algebra, whereas R[U] supplies the required right action. The reversed expression has no asserted module-sided meaning.

### E3 — misprint at Published Annals2016 version, §5.2, p.756

The coset formula A_q=B_n/L_q is written without an upper-dimensional restriction.

Use that formula only for 0<=q<n, with A_q empty for q>=n; faces from positive dimensions have the corresponding domain restriction.

A simplex needs q+1 distinct puncture endpoints, and the printed high-dimensional face formulas use generators beyond sigma_(n-1). A(1)_1 must be empty although B_1/L_1 is a singleton.

### E4 — error at Published Annals2016 version, equation(6.1.6) and its subsequent use, p.763

The exact-subgroup diagonal is multiplied by |c|/|c∩H| despite U_H being defined there as an unnormalized sum.

The diagonal is exactly U_H=sum_(g∈c∩H) r_g^(Dd), with coefficient1 on each summand. Remove the extra scalar in both uses.

Summands for g outside H leave the exact-H stratum; each summand inside H survives once. For S3 transpositions and H generated by one transposition, the surviving coefficient is1, while the printed scalar is3. The subgroup induction still proves stability.

### E5 — error at Published Annals2016 version, Proposition4.13 and its proof, p.754; constants(4.5.3), p.750

The stated bound replaces the total-diagonal term q-i+A1 i by A1 q, while allowing A1=A(R)=0; a closing maximum parenthesis is also missing.

Choose A1>=max(1,A(R)) before defining A2,A0, or retain max(1,A1) as the slope in this proposition. This plan also imposes A1>=a for the homogeneous splice in E6. Place the maximum around both low augmentation-Tor degrees.

Take G={1},c={1}, R=k[t],D=1,U=t and M=k by augmentation. Then A(R)=0,A2=1; low augmentation Tor has degrees0 and1. All K(k) differentials vanish, so H_q K(k)=k[q]. At q=3 the printed right side is2 but the actual degree is3. The enlarged positive slope validates the proof and does not invalidate the existence of linear stability constants.

### E6 — gap at Published Annals2016 version, Lemma4.7 resolution display and degree comparison, pp.751–752

The spliced resolution is displayed with both low terms equal to R and Q_j inserted without their homogeneous shifts, although multiplication by U has positive internal degree a.

Make it a homogeneous complex with P0=R, P1=R[a], Pj=Q_(j-2)[a] for j>=2. Choose the conservative A1>=max(1,a,A(R)); then a shifted Q term has generator degree <=(j+1)A1+a and the induction yields the stated delta(M)+A1 i bound.

Without the [a] shifts the U arrow and the splice are not internal-degree-zero arrows, so the support estimate cannot be justified as a graded hyperhomology argument from that display alone. The enlargement a<=A1 absorbs the omitted shift. This finding concerns the graded proof as presented; no counterexample to Lemma4.7 itself is asserted.

### E7 — misprint at Published Annals2016 version, equation(7.8.3) and the line following it, p.770

The stabilization step is written n to n+D, referring to D from Lemma3.5, rather than to the degree of its operator.

The topological operator shifts n by a=Dd=deg U. A comparison between adjacent stabilization degrees needs L>max(|G|,q,n+a). The uniform bound itself can instead compare the original n once and use the topological field estimate.

Lemma3.5 defines U_D as the sum of length D ord(g) power blocks. For involutions its length is2D. Homology multiplication cannot change branch number by D in this notation.

## Assigned-item coverage

The following table accounts for all44 items routed to Hurwitz homological stability. The last item records the precise boundary of the export.

| EVW extraction item | Target | Disposition |
| --- | --- | --- |
| 18 | gluing | planned |
| 19 | finite-cell-model | planned |
| 20 | nonsplitting | planned |
| 21 | odd-order-involutions | planned |
| 23 | component-ring | planned |
| 25 | central-sum | planned |
| 26 | component-stability | planned |
| 27 | graded-conventions | planned |
| 28 | stability-defects | planned |
| 29 | k-complex | planned |
| 30 | k-right-complex | planned |
| 31 | stability-defects | planned |
| 32 | change-of-rings | planned |
| 33 | tensor-degree | planned |
| 34 | quotient-tor-degree | planned |
| 35 | torsion-defect-bound | planned |
| 36 | higher-quotient-tor | planned |
| 37 | graded-nakayama | planned |
| 38 | low-tor-defect | planned |
| 39 | general-tor-bound | planned |
| 40 | generator-homotopy | planned |
| 41 | positive-action | planned |
| 42 | regular-k-bound | planned |
| 43 | k-universal-coefficients | planned |
| 44 | low-k-tor | planned |
| 45 | linear-k-bound | planned |
| 46 | module-stability | planned |
| 47 | hurwitz-homology-module | planned |
| 48 | tail-cosets | planned |
| 49 | coset-faces | planned |
| disc-mapping-class-adapter | disc-mapping-class-adapter | planned |
| 50 | geometric-arcs | planned |
| 51 | arc-connectivity | planned |
| 52 | arc-stabilizer | planned |
| 53 | borel-arc-resolution | planned |
| 54 | row-identification | planned |
| 55 | arc-spectral-sequence | planned |
| 56 | inductive-degree | planned |
| 57 | marked-stability | planned |
| 58 | full-monodromy-stability | planned |
| 59 | finite-quotient-homology | planned |
| 60 | unmarked-stability | planned |
| 69 | uniform-etale-betti | planned |
| 70 | uniform-etale-betti | boundary |

## Suggested signatures at the pins

The companion Suggested.lean states a small set of milestones over existing group, subgroup-quotient and graded ModuleCat carriers. Its definitions of whole conjugacy class, nonsplitting, a support predicate, native braid tail subgroup and the truncated quotient family have real bodies. It includes no data placeholder for Hurwitz spaces, noncommutative graded Tor, K, arc isotopy quotients or arithmetic schemes. The complete definitions, APIs and tests for those targets are the mathematical specifications above; their assembled carriers are not present at the pins. The file does not develop these theories and its proof placeholders assert no implementation status.

## Boundary with the nonlifting continuation

Residual representations that fail to lift modulo p² form an independent continuation of the same parent. The associated split proposal preserves all49 assigned Merkurjev–Scavia items and a precise design brief, including the odd-prime/rank/characteristic conditions, the p-variable witness field, the p=3 argument and the distinction between weak lifting and finite-group splitting. They are outside these six Hurwitz layers. Its paper and the Chu–Kang rationality input have not been read for this Hurwitz design.

## Independent review

Accepted by REV-DESIGN-InverseGaloisAndArithmeticFundamentalGroupsPartII on 2026-10-19 (Codex session codex-0ihffD), after checking all44 targets and17 pinned baseline citations. The shifted-strand inclusion now has its configuration-space injectivity argument and explicit cover-lifting dependency. All seven source corrections have independent confirmed verdicts in the packet. The suggested file elaborates with only24 proof-placeholder warnings. All six stages remain planned, with G1–G4 and ten supplier requests open; acceptance does not assert closure or implementation. The49-item nonlifting continuation remains a split proposal for the orchestrator.
