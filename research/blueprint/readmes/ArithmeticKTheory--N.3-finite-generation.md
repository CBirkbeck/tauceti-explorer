# Arithmetic K-theory: finite generation

This part plans finite generation of the integral Quillen groups of rings of integers and finite-S integers of number fields. Let F be a number field, A=𝓞_F, and S a finite set of nonzero prime ideals of A. The target is that K_n(A) and K_n(𝓞_{F,S}) are finitely generated abelian groups for every n≥1. The argument also supplies degree zero. Finite generation allows both free summands and torsion; it does not assert that every K-group is finite.

The part continues the accepted `ArithmeticKTheory--N.1` packet. Its nine number-field finite-generation nodes retain their IDs, statements, APIs and tests. This document supplies five fresh key refinements of their proof interfaces, rather than creating another Q-category, rank filtration, building or K-theory carrier. Its packet has status `complete` because the target-level planning pass is finished. Its stage has coverage `planned`: the exact homotopy supplier extensions and the unexpressed arithmetic specializations remain explicit gaps. Every node has implementation status `unchecked`.

The number-field restriction matters. The predecessor also acquired three nodes for function-field Steinberg finiteness and affine/proper curves. Those nodes are retained unchanged in that packet. They are outside this continuation's number-field targets; this part makes no claim to resolve their source or supplier questions. Borel ranks, regulators, special values and torsion orders are handled by their existing stages. The current argument supplies their integral finite-generation input.

## Carriers, conventions and ownership

Use the finite projective A-modules with their split exact structure, as supplied by GeneralAlgebraicKTheory K.1. Their Quillen category is Q(P(A)), not the category of projective modules and all linear maps. Its classifying space BQ is the realization of its nerve, based at the zero projective module. The retained node `ArithmeticKTheory:N.3:finite-generation/rank-filtration` supplies the full subcategory Q_m on modules of rank at most m, the cellular inclusions Q_{m−1}→Q_m for m≥1, and the exhaustive union Q. Q_0 is equivalent to the terminal category; it need not be literally a one-object chosen category.

For a finite projective P, its rank is the dimension over F of P⊗_A F. All projective isomorphism classes of a positive rank occur. A Dedekind domain can have nonfree projectives, even in rank one. The retained LowDegrees nodes `KTheoryLowDegrees:Z.4/steinitz` and `KTheoryLowDegrees:Z.4/projective-classification` identify these classes by rank and determinant ideal class. The Picard/class-group comparison is `KTheoryLowDegrees:Z.4/class-group-pic-mk0`. Thus the positive-rank index set is Pic(A), and its finiteness is an arithmetic input, not a consequence of fixing the rank.

The building and its Steinberg module belong to BorelRegulators R.1. For an m-dimensional F-vector space V with m≥2, the building is the order complex of nonzero proper subspaces of V. Its reduced integral homology in degree m−2 is St(V). For rank one the convention is St(V)=Z with trivial action. This agrees with reduced degree-zero homology of the two-point comma-category model after suspension. No ordinary degree-zero homology of an empty building is substituted for this convention. The Steinberg module itself is usually not finitely generated over Z.

The arithmetic result imported below is the existing node `BorelRegulators:R.1/steinberg-duality-finiteness`: for a projective full lattice P in a number division algebra, every integral H_q(Aut(P);St(P⊗F)) is finitely generated. Its specialization to the commutative number field case covers nonfree P directly. The import does not come through R.1's `quillen-finiteness-interface` or `finite-type-plus-consequences`, which themselves consume the arithmetic theorem and would create a return dependency. The current Borel packet has its orientation correction and explicit integral descent; it remains subject to its independent review. An import of its planning node is not a claim that a library declaration or accepted implementation exists.

Ordinary homology and relative homology throughout use Z coefficients. Relative homology is the homology of the mapping cone of the map of integral chains for BQ_{m−1}→BQ_m. Coefficient actions are retained: H_q(Aut(P);St) is group homology with the indicated representation, not trivial-coefficient homology. Homology degrees such as i−m are integer degrees, with negative degrees defined as zero. Implementers must not use truncated natural subtraction, which would turn a required zero group into a coinvariant group.

The K-group convention is K_n(A)=π_{n+1}(BQ(P(A)),0). In particular K_0=π_1 BQ. GeneralAlgebraicKTheory supplies the group structures and functoriality. If a consumer uses the plus model, import `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`: ΩBQ is equivalent to K_0(A)×BGL(A)^+, with component and basepoint choices as specified there. For positive n this identifies K_n with π_n BGL(A)^+. It does not identify BQ itself with BGL(A)^+, and neither space is asserted simply connected here. The arithmetic finite-type consequence for the plus model belongs to Borel's existing consumer node.

## Retained target declarations

The following IDs in the predecessor remain the public planning interface. Their definitions, APIs and discriminating tests are imported in place; there are no new definitions or constructions in this packet.

| Retained suffix in ArithmeticKTheory:N.3:finite-generation | Role in this part |
| --- | --- |
| `rank-filtration` | Q_m, strata, finite-simplex exhaustion and projective-class index |
| `layer-poset` | Proper pairs of subspaces, with the lower coordinate ordered oppositely |
| `comma-category-is-the-layer-poset` | Equivariant identification of the rank-inclusion fibers |
| `layer-poset-is-the-suspended-building` | Integral Steinberg coefficient and rank-one convention |
| `rank-spectral-sequence` | E¹ and its relative exact-sequence comparison |
| `quillen-finiteness-criterion` | Two-hypothesis Dedekind criterion |
| `steinberg-homology-of-automorphism-groups` | Arithmetic input for all projective lattices |
| `quillen-finite-generation-theorem` | All K_n(𝓞_F) finitely generated |
| `finite-generation-of-K-of-S-integers` | Finite-S endpoint |

GeneralAlgebraicKTheory K.1 supplies the Q-construction, the K-group shift and exact direct-sum functoriality. N.1 supplies the localization presentation of S-integers and the degree-one comparison with units. N.2 supplies the exact localization sequence with finite support. KTheoryFiniteLocalFields L.1 supplies the finite-field K-groups. The dependency direction is from those constructions and arithmetic Steinberg finiteness into this part's assembly, then to ranks, regulators and arithmetic applications.

## Relative rank homology

The fresh comparison node is `ArithmeticKTheory:N.3:finite-generation/relative-rank-homology-comparison`, with proposed declaration name **TauCeti.ArithmeticKTheory.rankLayerHomologyEquiv**. For a Dedekind domain A with fraction field F, m≥1 and i≥0, it states

\[
H_i(BQ_m,BQ_{m-1};\mathbb Z)
\cong
\bigoplus_{[P],\ \operatorname{rank}P=m}
H_{i-m}(\operatorname{Aut}_A(P);\operatorname{St}(P\otimes_A F)).
\]

The comparison is compatible with the relative long exact sequence and with replacement of projective representatives by isomorphic ones. It is not an arbitrary abstract isomorphism between the groups. The construction of the comparison uses the existing Q-filtration and coefficient carriers; the node is classified as a comparison theorem rather than a new definition.

Kahn's Corollary 2.3.7 identifies the chain mapping cone for a cellular functor with the chains on its complement, with augmented reduced comma-category coefficients, shifted by one. The complement here is a groupoid: one automorphism group for each rank-m projective isomorphism class. The predecessor identifies the comma-category realization with the suspended building. Its reduced chains have homology only in degree m−1, where the coefficient is St. The group-hyperhomology comparison then moves this concentration past the groupoid chains; together with the mapping-cone shift, the result is i−m.

Kahn 4.3.4 gives the functorial relative comparison for positive-dimensional sphere fibers and explains why its long exact sequence is Quillen's. For m=1 that positive-dimensional hypothesis fails. Use instead the explicit augmented reduced chains of the two incomparable points in Kahn 4.3.2 and Corollary 2.3.7. Their reduced H_0 is Z with trivial action. This deals with rank one without treating the usual empty building as an ordinary space whose H_0 would furnish the coefficient.

Three checks discriminate the intended statement. First, for i<m the relative group is zero; a truncated index would fail this. Second, for m=i=1 the group is a direct sum of copies of Z, one for each class in Pic(A). Third, for m=i=2 the summands are Steinberg coinvariants H_0(Aut(P);St), rather than the ordinary trivial-coefficient H_0 of the group or the free module on lines. These are acceptance conditions for a theorem, not additional definition unit tests.

## Stability and finite-type homology

The fresh theorem `ArithmeticKTheory:N.3:finite-generation/rank-homology-stability`, proposed name **TauCeti.ArithmeticKTheory.rankHomology_stable**, states that the transition on integral H_i is surjective for n≥i and an isomorphism for n≥i+1. The same bounds hold for the map from BQ_n to BQ. This is Quillen's rank-filtration stability, not a theorem giving a stable range for ordinary H_i(GL_n(A);Z).

At the step adjoining rank n+1, relative H_i vanishes when i<n+1. Relative H_{i+1} vanishes when i+1<n+1. The long exact sequence therefore gives the two distinct bounds. At n=i only surjectivity is asserted; the relative group in the incoming degree i+1 need not vanish. No sharpness example is needed to distinguish the statements: the incoming term itself must be retained in the proof.

To pass to Q, use the finite-simplex exhaustion of the predecessor. Every simplex has finitely many objects, so lies at a finite rank; every finite chain and boundary relation does too. The homology-colimit comparison requested from H.1 then identifies H_i(BQ) with the filtered colimit. Once n≥i+1, all subsequent maps in that fixed degree are isomorphisms. Thus H_i(BQ_n) already computes H_i(BQ). For i=0 the source Q_0 and the full Q-space are connected and H_0 is Z. There is no single fixed n that is asserted to compute every homological degree at once.

The fresh theorem `ArithmeticKTheory:N.3:finite-generation/rank-filtration-homology-finite-type`, proposed name **TauCeti.ArithmeticKTheory.rankHomology_finitelyGenerated**, has two precise hypotheses:

1. Pic(A) is finite.
2. For every positive-rank finite projective P and every q≥0, integral H_q(Aut_A(P);St(P⊗_A F)) is a finitely generated abelian group.

It concludes that every H_i(BQ_n;Z) and every H_i(BQ;Z) is finitely generated. Each fixed-rank relative group is a finite direct sum because the projective isomorphism classes are indexed by Pic(A). Start at Q_0, whose H_0 is Z and higher homology is zero. The relative long exact sequence expresses each next absolute group as an extension of a quotient of the preceding absolute group by a subgroup of the relative group. Over Z, subgroups and quotients of finitely generated abelian groups are finitely generated. The existing Mathlib exact-sequence finiteness theorem supplies the extension step. Induction proves the assertion for all finite stages. For each i, stability identifies the full group with the finite-stage group at n=i+1.

This last stabilization is indispensable. An arbitrary filtered colimit of finitely generated abelian groups need not be finitely generated. Similarly, finite-dimensional rational coefficient homology does not imply integral finite generation. A proof that retains only finitely many rational generators discards possible infinite torsion. The rank spectral sequence in the predecessor gives another presentation of the same argument: E¹_{p,q} is the direct sum of H_q(Aut(P);St) over rank-p classes for p≥1; the rank-zero column has Z at (0,0) and zero elsewhere. There are finitely many columns in each total degree. The relative/stability proof makes the exhaustion and incoming-degree bounds visible.

For A=𝓞_F, finiteness of the class group is in the pinned Mathlib source, and the LowDegrees Pic comparison gives hypothesis (1). Hypothesis (2) is the imported Borel R.1 theorem for the actual lattice P. For a field of class number greater than one, the argument must include the nonfree Steinitz classes. Fixing a basis of P over A would wrongly omit them.

## What the arithmetic supplier must prove

The Borel import is integral and orientation sensitive. For GL_m(𝓞_F), let χ=N_{F/Q}∘det, with values in {±1}. Putman–Studenmund Theorem C gives the virtual dualizing module

\[
D=\operatorname{St}_m(F)\otimes\mathbb Z_\chi^{\otimes(m-1)},
\qquad
\operatorname{vcd}=r_1\frac{m(m+1)}2+r_2m^2-m.
\]

For even m the twist can be nontrivial. One cannot apply untwisted integral duality to all of GL_m(𝓞_F), which also has torsion. The Borel proof selects a normal torsion-free subgroup Γ′ of finite index inside the orientation kernel, handles the reductive norm/central factor, and applies integral duality there. On that subgroup the coefficient identifies with the untwisted Steinberg module, and H_q(Γ′;St) identifies with complementary-degree constant-Z cohomology. Finite CW type gives finite generation of this cohomology, not of arbitrary infinite-rank local-coefficient homology.

Finally the integral finite-quotient homology spectral sequence for Γ/Γ′ gives finite generation for Γ=Aut_A(P). Its fixed-total-degree filtration is finite, and finite-group homology of a finitely generated abelian coefficient is finitely generated. Rational transfer alone would lose finite-quotient torsion and cannot establish the claimed result.

This part requests the geometric inputs from ArithmeticLocallySymmetricSpaces ALS.2 and the **early** ALS.5:finite-level-duality prefix through their Borel consumer. ALS.2 supplies finite-type arithmetic models, including central factors. The early duality prefix supplies the integral orientation system and Poincaré–Lefschetz duality at torsion-free level. The downstream automorphic comparison and completed-cohomology branches are not prerequisites of the finite-generation proof. No Borel–Serre compactification or duality theorem is re-owned here.

## From homology to K-groups

The fresh theorem `ArithmeticKTheory:N.3:finite-generation/quillen-homotopy-finite-type`, proposed name **TauCeti.ArithmeticKTheory.quillenK_finitelyGenerated**, refines the retained two-hypothesis criterion and the number-field endpoint. Under the hypotheses just stated it concludes that K_n(A) is finitely generated for every n≥0. The proof needs both the homology assertion and the H-space structure.

Direct sum is an exact bifunctor on finite projective modules. GeneralAlgebraicKTheory K.1 supplies its induced Q-theory structure. The product and natural-isomorphism comparisons of H.1 realize its unit, associativity and symmetry as homotopies. The zero module is the unit, and BQ is connected. It is therefore a connected, homotopy associative and commutative H-space. Its fundamental group is abelian and acts trivially on higher homotopy groups: BQ is simple. It is generally not simply connected because π_1 BQ=K_0(A) contains the rank summand Z.

Serre's original proof provides a concrete supplier recipe. Chapter IV §3 Proposition 3 says that deck transformations of the universal cover of a connected H-space are homotopic to the identity. Consequently their action on cover homology is trivial. Here π_1=H_1 is finitely generated abelian, so its classifying space has finitely generated integral homology in each degree. Apply Chapter III §1 Proposition 1(b) to the covering fibration over Bπ_1: finite-type homology of its total space and base, with the trivial coefficient system just proved, implies finite-type homology of the simply connected universal cover. Chapter V §2 Proposition 1 then makes the cover's higher homotopy groups finitely generated. Together with π_1 this proves the required homotopy assertion.

The original paper formulates its iterative cover/loop argument under a regularity condition called ULC. Chapter V §1 footnote 6 explicitly permits a formulation on singular complexes removing that restriction. The supplier must establish the compatible CW/simplicial formulation for the nerve realization, rather than silently imposing local conditions on an arbitrary chosen topological model. The simple-space variant is stated after Proposition 1; the stronger deck-transformation fact gives the proof for the H-space case actually used here.

Neither the cellular mapping-cone theorem nor this Serre theorem is currently stated in the full scope of the requested homotopy stages. H.2 names Quillen A/B and bisimplicial comparisons, but that alone is not Kahn's cellular homotopy-pushout theorem. H.6 names spectrum coefficients and convergence, but not finite-type homotopy of simple spaces. The packet records requested scope extensions and proposes **StableHomotopyKTheory, Part II: Cellular filtrations and finite-type homotopy**, building on H.1 and H.2. The orchestrator can assign its outputs to explicit early prefixes; the current H.2/H.6 request destinations are provisional. Assign the Serre theorem to an early homotopy prefix independent of arithmetic K finite generation; no new stage ID is invented by this part. Until that assignment and declaration-level supplier plan exist, coverage remains planned rather than closed.

## Finite-S localization

The fresh theorem `ArithmeticKTheory:N.3:finite-generation/s-localization-finite-defect`, proposed name **TauCeti.ArithmeticKTheory.sLocalization_finiteDefect**, states more precisely how the finite-S endpoint follows. For finite S and n≥2, the map K_n(𝓞_F)→K_n(𝓞_{F,S}) has finite kernel and finite cokernel. It is injective in positive even degrees, and surjective in odd degrees n≥3. Quillen states these finite defects in §1 Remark (2).

Write B=𝓞_{F,S}. The retained node **ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group** chooses a nonzero s with B=A[1/s] and the primes containing s exactly S: take the product of generators of positive principal powers of the primes in S, and s=1 for S empty. The retained node **ArithmeticKTheory:N.2/finite-support** then supplies the finite localization sequence and dévissage, giving the exact segment

\[
\bigoplus_{\mathfrak p\in S}K_n(A/\mathfrak p)
\longrightarrow K_n(A)\longrightarrow K_n(B)
\longrightarrow\bigoplus_{\mathfrak p\in S}K_{n-1}(A/\mathfrak p).
\]

This is the sequence for A→A[1/s]. The fraction-field localization sequence cannot supply it merely by discarding primes. Each residue field is finite. The imported node `KTheoryFiniteLocalFields:L.1/quillen-k-groups` gives K_{2j}(𝔽_q)=0 and K_{2j−1}(𝔽_q)≅Z/(q^j−1) for j≥1; its degree-zero group is Z. For n≥2 both outer terms of the displayed segment are finite because S is finite. The kernel is an image of the left term and the cokernel a subgroup of the right term. The left term vanishes when n is positive even, giving injectivity. The right term vanishes when n is odd and at least three, giving surjectivity. These conclusions concern the actual localization map, not only equality of rational ranks.

The image of K_n(A) is finitely generated, and its finite quotient in K_n(B) is finitely generated. The exact-sequence extension theorem therefore proves finite generation of K_n(B). The retained endpoint `finite-generation-of-K-of-S-integers` remains the ID that consumers cite. This fresh theorem refines its proof and records the finite-defect conclusion; it does not replace the endpoint or duplicate finite-field K-theory.

In degree one the right outer term is Z^S, which is finitely generated but not generally finite. Use N.1's retained determinant comparison K_1(B)≅B× and the existing finite-S unit theorem of Tau Ceti. Over the base ring its hypothesis is Monoid.FG A×, supplied by Dirichlet's theorem. For B=Z[1/p], the map from the units {±1} of Z has cokernel Z generated by p. Thus the finite-cokernel statement must start in degree two. In degree zero LowDegrees gives Z plus the finite S-integer class-group quotient, so finite generation follows there as well.

The target assumes finite S. Inverting all rational primes gives Q, and K_1(Q)=Q× has one independent valuation for every prime, so is not finitely generated. Class-group finiteness of S-integers can hold even for infinite S; it must not be confused with the finite-S hypothesis on units and higher localization terms. Also, 𝓞_{F,S} is generally not finite over Z. Apply Quillen's finite-over-Z theorem first to 𝓞_F and then localize, rather than applying that theorem directly to B.

## Baseline audit and suggested signatures

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit marks the higher finite-generation stage unbuilt, while classical arithmetic finiteness is available. The original nine arithmetic and algebra declarations were rechecked by reading their statements at these pins:

| Existing declaration | What is used |
| --- | --- |
| NumberField.RingOfIntegers | Integral closure of Z in F |
| NumberField.RingOfIntegers.instFintypeClassGroup | Finite class group of 𝓞_F |
| Module.Finite.iff_addGroup_fg | Finite Z-module equals finitely generated abelian group |
| Module.Finite.of_exact | Middle-module finiteness in M→N→P→0 |
| Set.integer | The S-integer subalgebra defined by valuations outside S |
| IsDedekindDomain.finite_integer_classGroup | Class-group finiteness transported to S-integers |
| Set.unit_fg_of_units | Finite-S units from finite generation of base units |
| Ring.HasFiniteQuotients | Finite residue fields, using the ring-of-integers instance |
| groupHomology | Existing nonnegative-degree homology of a representation |

None of these defines higher Quillen K-groups or proves arithmetic Steinberg finiteness. Baseline group homology is available, but the particular Steinberg representation and the comparison with relative Q homology need the planned suppliers. The arithmetic Q-category and its rank function, the Steinberg coefficient identification, and the arithmetic K-group comparison remain absent from the pinned libraries.

The revision checks seventeen more existing declarations for concrete prototype carriers, bringing the baseline register to **26**:

| Existing declarations | Prototype use |
| --- | --- |
| CategoryTheory.ObjectProperty.FullSubcategory, ι, ιOfLE | Actual rank full subcategories and canonical inclusions |
| CategoryTheory.isIsomorphicSetoid | Quotient of rank-m objects by isomorphism, with chosen representatives |
| CategoryTheory.nerve, nerveMap | Actual nerves and simplicial maps of the inclusions |
| SSet.chainComplexMap, homology, homologyMap | Integral simplicial complexes, homology objects and induced homology maps |
| HomologicalComplex.homotopyCofiber, homology | Actual relative chain-cone homology |
| SSet.toTop, HomotopyGroup.Pi | Realized nerves and their actual cubical homotopy groups |
| HSpace | Continuous multiplication and relative unit homotopies |
| GenLoop, GenLoop.boundary | Actual cubical representatives and their constant-boundary property |
| Tau Ceti HomotopyGroup.mapHom | Existing induced homomorphism on cubical homotopy groups |

The [suggested Lean file](../suggested/ArithmeticKTheory--N.3-finite-generation.lean) now contains all five proposed names as actual theorem declarations with prototype proofs. Its seven proved baseline examples remain. The local notation only abbreviates full subcategories, isomorphism-class quotients and integral coefficients already in Mathlib; it introduces no opaque Q/Steinberg/K carriers or proposition-valued substitutes. The named signatures elaborate at the Mathlib pin. As PROTOCOL §13 permits, conditions that require unavailable owner identifications are omitted explicitly. These essential omissions are recorded beside each declaration and in each node's `prototype` record; the packet's full mathematical statements remain definitive. The rank declarations are not valid assertions about an arbitrary category and rank function with arbitrary coefficients.

| Named prototype | Typed result and required owner specialization |
| --- | --- |
| TauCeti.ArithmeticKTheory.rankLayerHomologyEquiv | The relative object is the homology of the actual chain cone of the canonical rank inclusion. Above rank, the signature records existence of an integral linear equivalence to the direct sum of actual representation homology; below rank, it states vanishing separately. Natural-number subtraction is used only in the guarded nonnegative branch. The missing conditions identify Q/rank and the Steinberg coefficients, including rank one. H.1/H.2 must supply the natural comparison, realization comparison, LES compatibility and transport of representatives; existence alone does not express those compatibilities. |
| TauCeti.ArithmeticKTheory.rankHomology_stable | All four bounds apply to actual induced homology maps of canonical full-subcategory inclusions. The missing Q/rank identification includes the cellular layer structure and finite-simplex exhaustion. Realization and filtered-union comparisons remain H.1 inputs. No finite-Pic hypothesis is added. |
| TauCeti.ArithmeticKTheory.rankHomology_finitelyGenerated | Finite positive-rank isomorphism-class sets and integral representation homology finite generation are explicit inputs; finite-stage and full nerve homology finite generation are outputs. The class-set hypothesis is the output of finite Pic and LowDegrees' classification. The omitted conditions identify Q/rank and St, identify rank zero with the terminal category, and supply the preceding relative/stability interfaces. Number-field specialization imports the baseline class group and Borel's integral theorem for every lattice. |
| TauCeti.ArithmeticKTheory.quillenK_finitelyGenerated | A path-connected H-space on an actual nerve realization and its finite-type integral simplicial homology lead to finite generation of actual homotopy groups in degree n+1, including the fundamental group at n=0. Mathlib uses a multiplicative group convention. Q(P(A)), the zero basepoint, the direct-sum origin of the H-space and K.1's additive K-group comparison, including degree-zero commutativity, remain owner identifications. H.1 supplies CW type and simplicial/singular comparison; the early Serre extension proves the finite-type implication. The preceding homology result supplies the arithmetic hypotheses. |
| TauCeti.ArithmeticKTheory.sLocalization_finiteDefect | An exact segment through actual homotopy groups in degree d+3, corresponding to K-degree n=d+2≥2, has explicit finite module end groups, their parity vanishing and finite generation of the source. Its conclusions are finite kernel/cokernel, even injectivity, odd surjectivity and target finite generation. An actual functor, its based-point equation and the action on every cubical-loop representative identify the middle map as its induced homotopy map. The omitted conditions identify the categories, zero points, finite S, the functor with scalar extension, the K-group comparison and the residue K-group sums. Exactness and finite/parity inputs are supplied by the corrected N.1/N.2 chain and finite-field owner. The low-degree K₁/unit and K₀/class-group comparisons remain imports outside this degree bound. |

The generic based homotopy map is already supplied by Tau Ceti's **HomotopyGroup.mapHom**, whose statement was read at the pin. Its source matches the newer shared checkout exactly and imports Mathlib only, but its compiled module is absent from the shared build. The suggested file therefore uses Mathlib imports and states the map's existing quotient-representative characterization as a condition. It defines no new map API. K.1 must identify the functor with arithmetic scalar extension and compare its induced map with the K-group map. The finite end modules are the outputs required from the residue calculation; they are not new K-group definitions. Likewise, the coefficient representation parameters in the rank signatures must be identified with the actual Steinberg representations before use. The Serre conclusion is not assumed as a hypothesis. Checking these working forms proves their type correctness, not the omitted specializations or the planned mathematics.

The packet has one comparison and four theorems, no new definitions or constructions, hence zero new definition API items and unit tests. Acceptance conditions are attached to all five results. Three planets identify its main landmarks: **Quillen rank stability**, **Quillen finite generation**, and **Finite-S localization**. The imported objects retain their original APIs, tests and owner planets. This complete planning pass leaves two recorded gaps and five supplier requests, so its single stage is **planned**, with no stage closed. Assembly must preserve the nine retained IDs, incorporate the supplier contracts and restore the recorded owner conditions in the elaborated signatures. The existing independent review object remains unchanged for the next independent reviewer.

## Sources and locators

Quillen's *Finite generation of the groups K_i of rings of algebraic integers* is in LNM 341 (1973), pp.179–198, with text prepared by Hyman Bass. In the [Rochester proceedings scan](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), printed pp.179–185 are PDF pp.187–193 and scan headers 195–201. This part reads §1 in full: Theorem 1, finite-S Remark (2), Theorem 3, Stability, the arithmetic duality/descent argument, and the final H-space argument. The packet's locators distinguish those page systems.

Kahn's [*Around Quillen's theorem A*, arXiv:1108.2441v3](https://arxiv.org/pdf/1108.2441v3), dated 2 July 2014, supplies the coefficient-complex and cellular-functor treatment: Corollary 2.3.7 and Theorem 2.4.1 on p.12; the Dedekind and suspended-building cases and the relative comparison in §§4.2.7–4.3.4 on pp.17–18. The coefficient preliminaries and §§4.1–4.2 were also read to verify the naturality and pure-submodule hypotheses. In §2.2.3, p.9, the augmentation target prints C∗(C), although the coefficient functor is on D; it must be C∗(D), as in §2.2.2. The same slip remains in the author-hosted January 2014 copy, and no correction was found in the checked arXiv history or author listing. The packet records this harmless misprint as ArithmeticKTheory/E27 and uses the correct base-category augmentation; it changes none of the accepted mathematical statements.

Weibel's [separately hosted Chapter IV of *The K-book*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), PDF p.59, book p.325, gives the two-hypothesis criterion between IV.6.8 and IV.6.9 and the finite-over-Z number-ring case. Its theorem is not used as a finite-over-Z theorem for S-integers.

Putman–Studenmund's [*The dualizing module and top-dimensional cohomology group of GL_n(O)*, arXiv:1909.01217v4](https://arxiv.org/pdf/1909.01217v4), dated 23 April 2021, supplies Theorem C and §2.1's orientation-aware derivation. This part reads the relevant introduction and pp.8–10, rather than adopting the older untwisted informal description of GL duality.

Serre's [*Homologie singulière des espaces fibrés*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Serre-HSEF.pdf), Annals of Mathematics (2) 54 (1951), pp.425–505, supplies III §1 Proposition 1, IV §3 Proposition 3, IV §6 Proposition 9, and V §§1–2 Proposition 1 and its variants. The argument above records exactly how their hypotheses fit the connected H-space. All five public PDFs were downloaded and reread on 7 October 2026; the packet records their SHA-256 hashes. No source text or downloaded PDF belongs in the deliverables.
