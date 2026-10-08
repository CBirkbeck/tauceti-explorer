# Relative Fargues–Fontaine curves, RF4: patching and modifications

This is the reader for revision `BP-RelativeFarguesFontaine--RF4~2`, issue #7006, following the accepted RS-20 ownership decision. The [packet](../packets/RelativeFarguesFontaine--RF4.json) is the machine-readable plan; [the suggested file](../suggested/RelativeFarguesFontaine--RF4.lean) proposes signatures over available carriers. The [revision handoff](../handoff/BP-RelativeFarguesFontaine--RF4~2.md) records the changes and exact remaining contracts. The earlier independent review remains in the packet for replacement by the next reviewer.

**Status: complete, with all three scope stages planned and none closed.** There are 23 nodes: four definitions, two constructions, sixteen theorems and one comparison; 67 API items, 25 mathematical unit tests, seven planets, 37 baseline declarations, five requests and six gaps. Every implementation status is `unchecked`. A completed planning pass includes conditional targets with explicitly assigned missing inputs; it does not establish those targets or discharge their gaps.

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each cited baseline statement was read at its pin. Elaboration uses Mathlib imports only; Tau Ceti citations were verified from their pinned sources independently of the newer shared build.

## Scope, conventions and ownership

`RF4:vector-bundles` owns algebraic Beauville–Laszlo patching and its applications to relative vector bundles. `RF4:G-torsors` transfers that patching representationwise. `RF4` aggregates these two stages; it adds no third construction. BG0 supplies the torsor dictionaries, RF0–RF2 supply curves and divisors, RF3 supplies the schematic presentation, VB2 supplies GAGA and ampleness, and GS0 supplies the loop-group quotient and Grassmannian/Hecke geometry. BG2, HS0 and HS2 consume the resulting lattice modification.

Let E be a nonarchimedean local field, with residue field F_q and uniformizer π. For an affinoid perfectoid F_q-space S=Spa(R,R⁺), with pseudouniformizer ϖ, the imported curves are

- 𝒴_S=Spa(W_{O_E}(R⁺)) minus V([ϖ]);
- Y_S=𝒴_S minus V(π);
- X_S=Y_S/φ^ℤ.

A map S→Divᵈ gives an effective Cartier divisor D with invertible ideal I_D. Use a cover of a neighbourhood of D by sheafy affinoid charts on which I_D has a regular generator ξ. Affineness of D does not supply one chart containing all of D. Its completed ring is B⁺_D(S), and the punctured completed ring is B_D(S), intrinsically obtained by locally inverting the completed Cartier ideal. A lattice is a finite projective B⁺_D-submodule whose localization is the prescribed B_D-module. Replacing ξ by a unit multiple changes no underlying completion or localization.

Write E(kD)=E⊗I_D^(−k). A meromorphic modification is an isomorphism away from D for which both directions have a locally finite pole bound along D. Its groupoid arrows are isomorphisms compatible with the given complement identification. Equality on the complement determines such an arrow uniquely; this gives uniqueness of isomorphisms, rather than literal equality of bundles. For a nonempty divisor, O(−D)→O has bound one and not zero; allowing this noninvertible map as a groupoid arrow would be incorrect.

The gluing theorem for a **fixed global reference bundle** E′ identifies modifications of E′ with lattices in its punctured completion. That theorem is justified chartwise. The stage also asks to glue an **arbitrary bundle supplied only on the complement**. Node `arbitrary-complement-formal-patching` now states that full target, with its exact local comparison assigned to AdicSpacesPartII R3. This is an open mathematical input. In particular, an analytic punctured chart is not identified with Spec(A[1/ξ]), and all its analytic morphisms are not asserted to have bounded poles. The supplier must define the compatible analytic/formal puncture and establish the module models, or substantiate a required scope correction.

The B-pair statements retain Kedlaya–Liu's unramified setting: a≥1, q=pᵃ, perfectoid affinoid untilt over Q_p and coefficient field W(F_q)[1/p]. Their complement is a schematic affine complement. Kedlaya's punctured-Witt algebraicity theorem below is p-typical; no ramified or equal-characteristic extension is inferred.

G-bundles are exact tensor functors from the appropriate representation category to finite-locally-free bundles. Over Spec(B), the target is finite projective B-modules. The current BG0 node covers reductive groups over E on sousperfectoid E-spaces and no longer depends on RF4. The flat-linear scheme and smooth integral adic dictionaries, and broader field representation contracts, are requested from BG0. They are not duplicate constructions in this packet.

## Mathematical route and discriminating cases

An exact ring square allows equalizer sections, but effectivity for every finite projective datum needs the universal comparison-surjectivity and maximal-ideal hypotheses of KL1.3.9. For completion/localization squares, the glueing-pair torsion criterion supplies the nonnoetherian input. Completion alone is not asserted flat. The concrete twisted ℤ example fixes the overlap equation a=3b, with a∈ℤ[1/2], b∈ℤ[1/3]; its sections are (k,k/3), generated by (1,1/3). The infinite polynomial quotient counterexample detects torsion that disappears in completion. These have actual native carriers and signatures.

Fixed-reference chart gluing is an exact tensor equivalence on finite projective objects. Coefficient change is proved by extending a recovered finite projective module and applying recovery over the new glueing pair. It does not require tensoring the old exact square to remain exact. Disjoint supports give product decomposition of completed rings and independent modification data. Repetition D=mD₁ gives the exact bound equivalence l at D versus ml at D₁; a k-bound at D₁ yields a ceiling(k/m)-bound at D, with only the corresponding m·ceiling(k/m) converse. A locally finite infinite family uses bounds on individual charts, without one uniform global bound.

For flat quasicoherent sheaves, formal pullback on a schematic chart is V(B)⊗_B B̂. It is not the adic completion of V(B). For example, completion of the countable direct sum over k[t] permits coordinates tⁿ tending to zero, while tensor with k[[t]] retains finite support. This distinction is required for the full flat-module cohomology theorem.

The comparison involving a trivial bundle keeps its integral lattice T when T varies. Multiplication by 1/p on a rational trivial bundle over Q_p is not an automorphism of T=ℤ_p. The exact VB4 integral-Frobenius node supplies SW12.3.4; VB4 is also assigned SW12.3.5 and the normalized tail recovery of12.4.1. These foundations precede RF4; HS2 is a downstream consumer.

Kedlaya's algebraicity uses the **whole analytic locus** D(p)∪D([ϖ]), including the crystalline end, through the two exact RF0 nodes `whole-analytic-ainf-locus` and `whole-analytic-ainf-sheafiness`. Their open chart/root proof obligations remain RF0-owned. In the field case the algebraic gluing stack uses A_inf[1/p], W(K) and W(K)[1/p]. Completing A_inf[1/p] along p instead gives zero and cannot supply that argument. The two curve exports serve the essential-surjectivity part of Fargues' equivalence; BMS4.29 gives algebraic full faithfulness without these curve inputs.

Representationwise transfer preserves the fixed-reference and conditional arbitrary-input distinction. Faithful testing over E uses the tensor generator V⊕V∨: a tensor word with a copies of V and b copies of V∨ has bound (a+b)k; a finite sum uses the maximum degree. The DM2.21 closed-immersion/subquotient criterion is a field statement, with no integral inference. At overlapping divisors a chain of modifications composes with bound at most max(k,l) at D₁+D₂. An independent product description is asserted only on the disjoint locus; a colliding chain retains its intermediate bundle.

## The approximation input to étale-local triviality

The local-triviality theorem retains the reductive scope of FS VI.1.7. Fix a geometric point s and pointed affinoid étale neighbourhoods T. For A_T=B⁺_D(T)/I_D, choose compatible complete rings of definition R_T and a common topologically nilpotent unit t from [ϖ]. Put R=colim R_T and I=R. Then R[1/t]=colim A_T, multiplication by t is injective, and the henselian pairs (R_T,tR_T) give the henselian pair (R,tI) by filtered colimits. Here I is GR's auxiliary ideal, distinct from I_D.

RF2:integral-divisors is assigned the exact comparison between R̂[1/t], where R̂=lim R/tⁿR, and the reduced-divisor ring over the completed geometric stalk, including nonreduced collisions and transport of smooth affine sections. That comparison is still a gap. Given it, reduce the torsor Q modulo I_D and base change to the smooth affine finite-presentation scheme X=Q₀⊗R[1/t]. Affineness implies quasi-projectivity. The geometric-fiber section gives an R̂[1/t]-point. GR arXiv v3 Proposition5.4.21 and Claim5.4.22, pp.121–122, give a point over R[1/t] by density. Finite presentation descends that section to one étale neighbourhood T. Formal smoothness then lifts it to Q over the I_D-complete B⁺_D(T). This specifies the ring, ideal, scheme and neighbourhood step; henselianity of B⁺_D by itself would not suffice. No unchecked published numbering or smooth nonreductive extension is used.

The algebraic nonemptiness consequence and complete-ring lifting have native suggested signatures. The geometric stalk comparison has no native carrier at the pin and is not replaced by an arbitrary proposition.

## Linear patching

Coverage: **planned**. Sixteen target-level nodes now include the full arbitrary-input target with an exact supplier request and gap, alongside the proved fixed-reference case. All linear stage targets have nodes and prerequisite chains ending at baseline, external nodes or the recorded comparison/recovery gaps. The unramified schematic B-pair and p-typical algebraicity scopes are explicit; no ramified or equal-characteristic algebraicity extension is asserted.

### Exact squares of rings and glueing data over them (Kedlaya-Liu 1.3.7)

Node `RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square`; definition.

An exact square of commutative rings is a commuting square R -> R_1, R -> R_2, R_1 -> R_12, R_2 -> R_12 such that the sequence of R-modules 0 -> R -> R_1 (+) R_2 -> R_12 -> 0, whose last arrow is the difference (r_1, r_2) |-> r_1 - r_2 of the two maps, is exact. A glueing datum over it is a triple of modules M_1, M_2, M_12 over R_1, R_2, R_12 with isomorphisms psi_1 : M_1 (x)_{R_1} R_12 = M_12 and psi_2 : M_2 (x)_{R_2} R_12 = M_12; a morphism of glueing data is a triple of linear maps commuting with psi_1 and psi_2. The datum is finite, resp. finite projective, when M_1, M_2, M_12 are finite, resp. finite projective, over their rings. Its module of sections is M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), with natural R-linear maps M -> M_i adjoint to M (x)_R R_i -> M_i. Every R-module N gives the glueing datum Can(N) = (N (x) R_1, N (x) R_2, N (x) R_12, can, can). No topology is involved.

Additional hypotheses and scope:

- The rings are commutative and the square commutes; nothing is assumed about flatness of R -> R_1 or R -> R_2

- Exactness of 0 -> R -> R_1 (+) R_2 -> R_12 -> 0 is required at all three places; surjectivity on the right is part of the definition

- A glueing datum carries no cocycle over R_1 (x)_R R_1: the square replaces fpqc descent data

Construction or proof route:

1. Kedlaya-Liu Definition 1.3.7 states the definition; the Stacks project's category Glue(R -> R', f) (before Theorem 15.92.16) is the case R_1 = R', R_2 = R_f, R_12 = R'_f.

2. Can is a functor, and the sections functor is right adjoint to it on the level of R-modules: Hom(N, sections(D)) = Hom(Can(N), D).

3. For flat N the sequence 0 -> N -> N (x) R_1 (+) N (x) R_2 -> N (x) R_12 -> 0 is exact (tensor the exact square with N), so sections(Can N) = N.

Uses:

- Kedlaya-Liu Remark 2.7.9: the Beauville-Laszlo square R -> R-hat, R[1/t] -> R-hat[1/t] is an exact square, and Proposition 1.3.6 is derived from Lemma 1.3.9 for it

- Kedlaya-Liu Theorem 8.9.6, proof: vector bundles on Proj(P_R) are glueing data over the square with pieces B_e(A), B^+_dR(A), B_dR(A)

- Scholze-Weinstein Lemma 14.2.3, proof: vector bundles on Spec A_inf minus the closed point are glueing data over A_inf[1/p], A_inf[1/[p-flat]], A_inf[1/p[p-flat]]

- Kedlaya, Some ring-theoretic properties of A_inf, proof of Theorem 3.8: the adic and schematic bundles are compared through fibre products of categories of glueing data over rational coverings

- RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor: the local step of the relative gluing is a glueing datum over the Beauville-Laszlo square of an affinoid chart around D

API:

- `ExactSquare` (data): An exact square: four commutative rings, the four ring maps, commutativity, and exactness of 0 -> R -> R_1 (+) R_2 -> R_12 -> 0.

- `ExactSquare.exact` (characterisation): An element of R_1 (+) R_2 lies in the image of R iff its two images in R_12 agree, R -> R_1 (+) R_2 is injective, and R_1 (+) R_2 -> R_12 is surjective.

- `GlueingDatum` (constructor): A glueing datum (M_1, M_2, M_12, psi_1, psi_2) over an exact square, with morphisms the compatible triples of linear maps.

- `GlueingDatum.sections` (data): The module of sections M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), an R-module, functorial in the datum.

- `GlueingDatum.sectionsCompare` (projection): The natural maps M (x)_R R_i -> M_i (i = 1, 2), compatible with psi_1, psi_2 after base change to R_12.

- `GlueingDatum.can` (functoriality): The functor Can : R-modules -> glueing data, N |-> (N (x) R_1, N (x) R_2, N (x) R_12, can, can), with map_id and map_comp.

- `GlueingDatum.can_sections_adjunction` (universal-property): Hom_R(N, sections(D)) = Hom(Can(N), D) naturally in N and D.

- `GlueingDatum.sections_can_of_flat` (characterisation): For a flat R-module N the unit N -> sections(Can N) is an isomorphism.

- `GlueingDatum.tensor` (structure): Tensor product and dual of finite projective glueing data, componentwise, with sections(Can N (x) Can N') compatible with N (x) N' for finite projective N, N'.

- `GlueingDatum.baseChange` (functoriality): For a map of exact squares (R -> R_1, R_2 -> R_12) -> (R' -> R'_1, R'_2 -> R'_12), base change of glueing data, compatible with Can.

- `ExactSquare.ofGlueingSquare` (compatibility): Every glueing square of complete Tate rings (AdicSpacesPartII:R3/glueing-square) is an exact square, its finite glueing data are glueing data here, and its module of sections is the module of sections here.

- `ExactSquare.zariski` (example): For f, g in R generating the unit ideal, R -> R_f, R_g -> R_fg is an exact square.

- `GlueingDatum.Hom` (data): Compatible triples of linear maps, commuting with the two overlap identifications; evaluation on pure tensors determines compatibility.

- `GlueingDatum.Hom.ext` (extensionality): Two compatible triples agree when their three component linear maps agree.

- `GlueingDatum.Hom.id` (constructor): The componentwise identity is a compatible triple.

- `GlueingDatum.Hom.comp` (relation): Compatible triples compose componentwise and satisfy identity and associativity laws.

- `GlueingDatum.sectionsMap` (functoriality): A compatible triple sends a section (x1,x2) to (f1(x1),f2(x2)); it respects identities and composition.

- `GlueingDatum.sections_ext` (extensionality): Equality of both coordinates gives equality in the equalizer submodule.

- `GlueingDatum.canMap` (functoriality): Tensoring a linear map at the three corners defines its canonical datum morphism, with identity and composition laws.

- `GlueingDatum.sectionsTensor` (projection): The canonical map sections(D) tensor_R sections(E) to sections(D tensor E) sends pure tensors to the two component pure tensors. It is an isomorphism for effective finite-projective data, without asserting this for arbitrary data.

- `GlueingDatum.dual` (structure): For finite-projective pieces, form the componentwise dual datum using scalar-extension compatibility of duals; for canonical finite-projective data its sections are the dual of the sections.

- `GlueingDatum.baseChange_can` (compatibility): Extending the pieces of Can_R(N) along a commuting corner map gives the canonical datum with the new corners. Its comparison maps are tensor cancellation on pure tensors. For a map of base rings R to S this agrees with Can_S(S tensor_R N) by associativity.

Mathematical unit tests:

- `GlueingDatum.sections_zariski_Z` (computation): For R = Z, f = 2, g = 3, the glueing datum (Z[1/2], Z[1/3], Z[1/6], id, multiplication by 3) has module of sections {(k, k/3) : k in Z}, free of rank one with generator (1, 1/3).

- `GlueingDatum.sections_identitySquare` (degenerate): For the identity square R = R_1 = R_2 = R_12 and a datum (M, M, M, id, id), the module of sections is the diagonal, isomorphic to M.

- `ExactSquare.zariski_sections_can` (compatibility): For the Zariski square of D(f), D(g) with (f, g) = R and any R-module N, sections(Can N) = N; this is gluing of quasicoherent sheaves on Spec R = D(f) u D(g).

- `ExactSquare.not_exact_double_localization` (non-example): For R = k[x] and R_1 = R_2 = R_12 = k[x, 1/x], the square is not exact: the kernel of the difference is the diagonal k[x, 1/x], and sections(Can R) = k[x, 1/x] is not R.

Acceptance checks:

- The Zariski square of D(f), D(g) for comaximal f, g is exact and its glueing data are quasicoherent gluing data

- Every glueing square of complete Tate rings of AdicSpacesPartII:R3/glueing-square is an exact square in this sense, with the same glueing data and module of sections

- The identity square is exact and its glueing data are modules

Direct prerequisites: `AdicSpacesPartII:R3/glueing-square`, `mathlib:TensorProduct`, `mathlib:LinearEquiv`, `mathlib:Module.Flat`, `mathlib:Module.Finite`, `mathlib:Module.Projective`, `mathlib:IsLocalization.Away.awayToAwayLeft`, `mathlib:IsLocalization.Away.awayToAwayRight`, `mathlib:TensorProduct.AlgebraTensorModule.rid`.

Prototype boundary: Morphisms, extensionality, naturality, identity/composition, tensor/dual and corner-base-change signatures are native. The baseChange_can signature uses restriction to the old base; the new-base form follows by tensor cancellation. The twisted-Z test computes the actual sections (k,k/3).

Available-carrier signatures: `ExactSquare`, `GlueingDatum`, `GlueingDatum.Hom`, `GlueingDatum.sections`, `GlueingDatum.sectionsCompare`, `GlueingDatum.can`, `GlueingDatum.canUnit`, `GlueingDatum.sectionsMap`, `GlueingDatum.canMap`, `GlueingDatum.can_sections_adjunction`, `GlueingDatum.tensor`, `GlueingDatum.sectionsTensor`, `GlueingDatum.dual`, `GlueingDatum.baseChange`, `TwistedZariski.datum`, `TwistedZariski.sections_computation`, `TwistedZariski.sectionsEquiv_one`.

Missing native interfaces `ExactSquare.ofGlueingSquare`: The complete Tate glueing-square carrier is a planned R3 interface, not a declaration at the pin.

Sources: [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Definition 1.3.7, p. 17 — The definition in the stated scope (diagram omitted).; [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Definition 1.3.7, p. 17 — The module of sections and its comparison maps.; [Stacks-BL](https://stacks.math.columbia.edu/tag/0BNI), Section 15.92, before Theorem 15.92.16 (tag 0BP2) — The Beauville-Laszlo instance of the same notion..

### Finite projective glueing data over an exact square are effective (Kedlaya-Liu 1.3.8-1.3.9)

Node `RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square`; theorem.

Let R -> R_1, R_2 -> R_12 be an exact square. (i) For a finite glueing datum with module of sections M such that M (x)_R R_1 -> M_1 is surjective: psi_1 - psi_2 : M_1 (+) M_2 -> M_12 is surjective, M (x)_R R_2 -> M_2 is surjective, and a finitely generated submodule M_0 of M already surjects onto M_1 and M_2. (ii) Suppose M (x)_R R_1 -> M_1 is surjective for every finite projective glueing datum. Then for every finite projective glueing datum M is finitely presented and M (x)_R R_i -> M_i is bijective for i = 1, 2. (iii) If moreover the image of Spec(R_1 (+) R_2) -> Spec(R) contains every maximal ideal, M is finite projective; hence Can is an equivalence from finite projective R-modules to finite projective glueing data, with quasi-inverse the module of sections.

Additional hypotheses and scope:

- The surjectivity hypothesis of (ii) is for EVERY finite projective glueing datum; it is verified separately in each application (density for complete Tate rings, the Beauville-Laszlo argument for completions)

- The maximal-ideal condition of (iii) cannot be dropped: it is what makes the rank of M locally constant and the Fitting ideal Fitt_n(M) equal to R

- No flatness of R -> R_1 or R -> R_2 is assumed

Construction or proof route:

1. (i) The surjection M (x) R_1 -> M_1 gives a surjection M (x) R_12 -> M_12 and hence the surjectivity of psi_1 - psi_2; an element v of M_2 is reached by correcting with a preimage, and finitely many generators give M_0 (KL Lemma 1.3.8).

2. (ii) Choose a finite free F -> M_0 and compare the exact rows 0 -> N -> F -> M, 0 -> N_i -> F_i -> M_i; the kernels N_i are finite projective and form a glueing datum, so (i) applies to it and a diagram chase gives finite generation, then finite presentation, of M, and the five lemma gives bijectivity of M (x) R_i -> M_i (KL Lemma 1.3.9(a)).

3. (iii) Split by the rank idempotents, compute Fitting ideals: Fitt_i(M) = 0 for i < n because R -> R_1 (+) R_2 is injective, and Fitt_n(M) = R because every maximal ideal comes from a point of Spec(R_1 (+) R_2) where the rank is n (KL Lemma 1.3.9(b)).

4. Full faithfulness of Can on finite projective modules is V1's sections_can_of_flat.

Acceptance checks:

- Recover Zariski gluing of finite projective modules from the square R -> R_f, R_g -> R_fg

- Recover AdicSpacesPartII:R3/glueing-square-finite-projective-descent for a glueing square of complete Tate rings, whose density hypothesis gives the surjectivity of (ii)

- Recover finite projective descent for the Beauville-Laszlo square (RF4:vector-bundles/beauville-laszlo-module-gluing)

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square`, `mathlib:Module.FinitePresentation`, `mathlib:Module.Projective`, `mathlib:Module.Finite`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Available-carrier signatures: `finiteProjective_glueing_effective`.

Sources: [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Lemma 1.3.8, p. 17 — Part (i) in the stated scope.; [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Lemma 1.3.9, pp. 18-19 — Part (ii).; [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Lemma 1.3.9(b), pp. 18-19 — Part (iii)..

### Finite etale algebras glue over an exact square (Kedlaya-Liu 1.3.10)

Node `RelativeFarguesFontaine:RF4:vector-bundles/finite-etale-glueing-over-exact-square`; theorem.

Under the hypotheses of RF4:vector-bundles/finite-projective-glueing-over-exact-square (iii), the base change functor FEt(R) -> FEt(R_1) x_{FEt(R_12)} FEt(R_2) from finite etale R-algebras to compatible pairs of finite etale algebras is an equivalence of categories.

Additional hypotheses and scope:

- Same hypotheses as the finite projective glueing theorem: surjectivity for all finite projective glueing data and the maximal-ideal condition

- The algebra structure is glued from the exact sequence 0 -> A -> A_1 (+) A_2 -> A_12 -> 0; etaleness is checked through the trace pairing, not through flat descent

Construction or proof route:

1. View (A_1, A_2, A_12) as a finite projective glueing datum; the module of sections A is finite projective with A (x) R_i = A_i.

2. The multiplications of A_1, A_2, A_12 restrict to A through the exact sequence 0 -> A -> A_1 (+) A_2 -> A_12 -> 0, so A is a finite flat R-algebra.

3. Applying the glueing theorem to the duals gives 0 -> Hom_R(A, R) -> Hom(A_1, R_1) (+) Hom(A_2, R_2) -> Hom(A_12, R_12) -> 0, and the snake lemma shows the trace pairing of A is perfect, so A is finite etale (KL Corollary 1.3.10).

Acceptance checks:

- For the Zariski square this is gluing of finite etale covers

- The trace pairing argument shows that unramifiedness is not checked by a flatness argument

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square`, `mathlib:CommAlgCat.FiniteEtale`, `mathlib:Algebra.Etale`, `mathlib:Module.Dual`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Available-carrier signatures: `finiteEtale_glueing`.

Sources: [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Corollary 1.3.10, p. 19 — The statement in the stated scope.; [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Proof of Corollary 1.3.10, p. 19 — The trace pairing step..

### Glueing pairs and glueable modules (Stacks 15.92)

Node `RelativeFarguesFontaine:RF4:vector-bundles/glueing-pair`; definition.

Let R be a ring, f in R, and R -> R' a ring map inducing isomorphisms R/f^n R = R'/f^n R' for all n >= 1 (for example R' = R-hat = lim R/f^n R). (R -> R', f) is a glueing pair if 0 -> R -> R' (+) R_f -> R'_f -> 0 (last arrow the difference) is exact; equivalently R[f^oo] -> R'[f^oo] is bijective, where M[f^oo] is the f-power torsion. (R, f) is a glueing pair if (R -> R-hat, f) is one. An R-module M is glueable for (R -> R', f) if 0 -> M -> (M (x)_R R') (+) M_f -> M (x)_R R'_f -> 0 is exact, equivalently M[f^oo] -> (M (x)_R R')[f^oo] is bijective. A glueing pair is in particular an exact square R -> R', R_f -> R'_f.

Additional hypotheses and scope:

- R -> R' must induce R/f^n = R'/f^n for EVERY n, not only n = 1

- If f is a nonzerodivisor of R then (R, f) is a glueing pair; no noetherian hypothesis

- Glueability is a condition on the module; flat modules are glueable, and a non-glueable module exists already for a nonzerodivisor f

Construction or proof route:

1. Lemma 15.92.6: the sequence is always exact on the right; exactness on the left and in the middle are injectivity and surjectivity of R[f^oo] -> R'[f^oo].

2. Remark 15.92.7: for f a nonzerodivisor, f is a nonzerodivisor in R-hat (Stacks Algebra Lemma 10.96.4), so both torsion modules vanish.

3. Lemma 15.92.10 and Remark 15.92.11: the same criterion for modules, and flat modules are glueable.

Uses:

- Stacks Theorem 15.92.16: the Beauville-Laszlo equivalence is stated for a glueing pair and glueable modules

- Scholze-Weinstein Lemma 5.2.9: the case R' = R-hat with f a nonzerodivisor

- RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor: (A, xi) for an affinoid chart A around D and a local equation xi of D is a glueing pair because xi is a nonzerodivisor (RF2:untilts/closed-cartier-divisor-norm-estimate)

API:

- `GlueingPair` (data): A ring map R -> R' and f in R with R/f^n = R'/f^n for all n and the exact sequence 0 -> R -> R' (+) R_f -> R'_f -> 0.

- `GlueingPair.iff_torsion_bijective` (characterisation): Assuming the ring map induces R/f^n R = R'/f^n R' for all positive n, (R -> R', f) is a glueing pair iff R[f^oo] -> R'[f^oo] is bijective (Stacks 15.92.6).

- `GlueingPair.of_nonZeroDivisor` (constructor): If f is a nonzerodivisor of R then (R -> R-hat, f) is a glueing pair (Stacks 15.92.7).

- `GlueingPair.of_flat` (constructor): If R -> R-hat is flat (for example R noetherian) then (R, f) is a glueing pair (Stacks 15.92.8).

- `GlueingPair.toExactSquare` (coercion): A glueing pair is an exact square R -> R', R_f -> R'_f (RF4:vector-bundles/glueing-datum-over-exact-square).

- `GlueingPair.quotient_equiv` (simp): For a glueing pair (R -> R',f), the canonical map R/f^n R -> R'/f^n R' is an isomorphism for every n. In the completion case R'=R-hat these quotient isomorphisms hold without assuming the pair condition (Stacks 15.92.1).

- `GlueingPair.spec_surjective` (other): Spec(R') u Spec(R_f) -> Spec(R) is surjective (Stacks 15.92.3), the maximal-ideal condition of the exact-square glueing theorem.

- `Glueable` (data): The predicate: 0 -> M -> (M (x) R') (+) M_f -> M (x) R'_f -> 0 is exact.

- `Glueable.iff_torsion` (characterisation): For a glueing pair, M is glueable iff M[f^oo] -> (M (x) R')[f^oo] is injective (Stacks 15.92.10).

- `Glueable.of_flat` (constructor): Flat R-modules are glueable (Stacks 15.92.11).

Mathematical unit tests:

- `GlueingPair.int_p` (computation): For R = Z and f = p, R-hat = Z_p and 0 -> Z -> Z_p (+) Z[1/p] -> Q_p -> 0 is exact; (Z, p) is a glueing pair.

- `GlueingPair.of_isUnit` (degenerate): If f is a unit then R-hat = 0, R_f = R, the sequence is 0 -> R -> R -> 0 -> 0, every module is glueable and glueing data are R-modules.

- `GlueingPair.noetherian_compat` (compatibility): For R noetherian, Mathlib's AdicCompletion (Ideal.span {f}) R is flat over R, so (R, f) is a glueing pair and every R-module is glueable (Stacks 15.92.8, 15.92.11).

- `GlueingPair.not_stacks_example` (non-example): For R = k[f, T_1, T_2, ...]/(f T_1, f T_2 - T_1, f T_3 - T_2, ...), (R, f) is not a glueing pair: T_1 is f-power torsion and nonzero in R but its image in R-hat is f-divisible, hence zero (Stacks Example 15.92.9).

- `Glueable.not_smooth_germs` (non-example): For R the germs of smooth functions at 0 on the real line and f = x, the module R/phi R with phi = exp(-1/x^2) is not glueable although f is a nonzerodivisor (Stacks Example 15.92.12).

Acceptance checks:

- Check the criterion R[f^oo] -> R'[f^oo] bijective on the two examples of Stacks Example 15.92.9

- Check that a nonzerodivisor gives a glueing pair without any noetherian hypothesis

- Check that the henselization of R along f, which also satisfies R/f^n = R^h/f^n, gives a glueing pair whenever f is a nonzerodivisor of it

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.of`, `mathlib:IsLocalization.Away`, `mathlib:nonZeroDivisors`, `mathlib:Module.Flat`, `mathlib:MvPolynomial`, `mathlib:Ideal.Quotient.mk`.

Prototype boundary: The unit and noetherian examples state both the pair condition and every-module glueability; the noetherian example also states completion flatness. They are prototype assertions, with no claim that noetherian completion flatness is already proved in Mathlib.

Available-carrier signatures: `GlueingPair`, `GlueingPair.iff_torsion_bijective`, `GlueingPair.of_nonZeroDivisor`, `GlueingPair.of_flat`, `GlueingPair.toExactSquare`, `GlueingPair.quotient_equiv`, `GlueingPair.spec_surjective`, `Glueable`, `Glueable.iff_torsion`, `Glueable.of_flat`, `GlueingPair.iff_exact`, `StacksCounterexample.not_glueing_pair`.

Missing native interfaces `Glueable.not_smooth_germs`: No exported carrier for germs of smooth real functions at 0, their flat germ phi and quotient module; the algebraic infinite polynomial quotient counterexample is native.

Sources: [Stacks-BL](https://stacks.math.columbia.edu/tag/0BNI), Section 15.92, Glueing pairs, before Lemma 15.92.6 — The definition.; [Stacks-BL](https://stacks.math.columbia.edu/tag/0BNI), Lemma 15.92.6 (tag 0BNR) and Remark 15.92.7 (tag 0BNS) — The torsion criterion and the nonzerodivisor case.; [Stacks-BL](https://stacks.math.columbia.edu/tag/0BNI), Lemma 15.92.10 (tag 0BNW) — Glueable modules..

### The Beauville-Laszlo theorem for non-noetherian rings

Node `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`; theorem.

Let (R -> R', f) be a glueing pair (for instance R' = R-hat, the f-adic completion, with f a nonzerodivisor of R). (a) The functor Can : M |-> (M (x)_R R', M_f, can) is an equivalence from the category of R-modules glueable for (R -> R', f) to the category of glueing data (M', M_1, alpha_1 : (M')_f = M_1 (x)_R R'), with quasi-inverse the module of sections. In particular (Scholze-Weinstein 5.2.9) for f a nonzerodivisor, R-modules M on which f is a nonzerodivisor are equivalent to triples (M_{R-hat}, M_{R[1/f]}, beta) with f a nonzerodivisor on the R-hat-module M_{R-hat} and beta : M_{R-hat}[1/f] = M_{R[1/f]} (x)_R R-hat. (b) An R-module M is flat, resp. finite projective, iff M (x)_R R' and M_f are flat, resp. finite projective; hence every finite projective glueing datum is Can of a finite projective R-module, unique up to unique isomorphism, and R -> R' x R_f is an effective descent morphism for finite projective modules. (c) For a flat M the sequence 0 -> M -> (M (x)_R R_f) (+) (M (x)_R R-hat) -> M (x)_R R-hat_f -> 0 is exact. The statement is not a case of fpqc descent: R -> R-hat need not be flat when R is not noetherian, and no descent datum over R-hat (x)_R R-hat is part of the data.

Additional hypotheses and scope:

- f is a nonzerodivisor of R, or more generally (R -> R', f) is a glueing pair; no noetherian, flatness or separatedness hypothesis is needed (Kedlaya-Liu's 't-adically separated' in Proposition 1.3.6 is not used by the Stacks proof)

- In (a) the modules must be glueable; for f a nonzerodivisor every module on which f is a nonzerodivisor is glueable

- The finite projectivity criterion of (b) is part of the theorem and is what makes the gluing of vector bundles possible

- Scholze-Weinstein point out that the statement does NOT follow from fpqc descent, for the two reasons in the statement

Construction or proof route:

1. Surjectivity of d : M' (+) M_1 -> (M')_f for any glueing datum, by writing a target element with a common denominator f^n and splitting coefficients of R' as R + f^n R' (Stacks proof of 15.92.16).

2. With M = ker d, the sequence 0 -> M/M[f^oo] -> M_1 -> (M')_f/M' -> 0 is exact; tensoring with the flat R_f gives M_f = M_1.

3. Tor_1^R(R', Coker(M' -> M'_f)) = 0 (Stacks 15.92.13-15.92.15) keeps that sequence exact after tensoring with R', and the five lemma gives M (x) R' = M'; so Can is essentially surjective and H^0 o Can = id on glueable modules gives full faithfulness.

4. Flatness and finite projectivity descend: Stacks 15.92.18 (Tor computation from the exact square) and 15.92.19 (finite generation from 15.92.4, then finite presentation).

5. Alternatively, for f a nonzerodivisor and finite projective data, Kedlaya-Liu Remark 2.7.9 verifies the surjectivity hypothesis of RF4:vector-bundles/finite-projective-glueing-over-exact-square for the square R -> R-hat, R[1/t] -> R-hat[1/t] using the t-adic density of R[1/t] in R-hat[1/t], and concludes from Lemma 1.3.9.

Acceptance checks:

- Run the gluing for R = A_inf[1/p] and f = xi, where R-hat = B^+_dR(C): a B^+_dR-lattice in T (x) B_dR glues with T (x) A_inf[1/p][1/xi] to a finite projective A_inf[1/p]-module (the step used in SW20 Proposition 12.4.6)

- Exhibit, for a non-noetherian R, a module M with f a nonzerodivisor on M whose completion M (x) R-hat is computed by the gluing although R -> R-hat is not flat

- Verify finite projectivity in both directions of (b)

- Check the necessity of glueability with Stacks Example 15.92.12

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/glueing-pair`, `RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square`, `RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square`, `mathlib:AdicCompletion`, `mathlib:IsAdicComplete`, `mathlib:IsLocalization.Away`, `mathlib:nonZeroDivisors`, `mathlib:Module.Projective`, `mathlib:Module.Flat`, `mathlib:Module.FinitePresentation`, `mathlib:Module.FaithfullyFlat`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Available-carrier signatures: `beauvilleLaszlo_effective`, `beauvilleLaszlo_finiteProjective_iff`, `beauvilleLaszlo_flat_iff`, `beauvilleLaszlo_flat_exact`.

Sources: [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Lemma 5.2.9, printed p. 38 — The statement used throughout the atlas; read again in this session.; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), After Lemma 5.2.9, printed p. 38 — The two non-noetherian subtleties the stage asks to retain.; [Stacks-BL](https://stacks.math.columbia.edu/tag/0BNI), Theorem 15.92.16 (tag 0BP2) — Part (a), with a complete non-noetherian proof; this replaces the unread Beauville-Laszlo note.; [Stacks-BL](https://stacks.math.columbia.edu/tag/0BNI), Lemma 15.92.19 — Part (b), finite projective case.; [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Proposition 1.3.6, pp. 16-17 — Parts (b) effective descent and (c)..

### Modifications of vector bundles at a relative Cartier divisor

Node `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles`; definition.

Let X-cal be one of Y-curly_S, Y_S, X_S and D a closed Cartier divisor of X-cal attached to a map S -> Div^d_(-), with ideal sheaf I_D and E(kD) = E (x) I_D^(-k). For vector bundles E, E' on X-cal, a modification of E' at D is a pair (E, beta) with beta : E|_{X-cal minus D} = E'|_{X-cal minus D} an isomorphism of vector bundles on the open complement which is meromorphic along D: locally on S and X-cal there is some k >= 0 such that beta extends to a morphism E -> E'(kD) and beta^(-1) extends to a morphism E' -> E(kD) (through the inclusions E' -> E'(kD), E -> E(kD)). Such a k is a bound of the modification. A morphism (E_1, beta_1) -> (E_2, beta_2) is an isomorphism E_1 -> E_2 whose restriction off D is beta_2^(-1) beta_1; modifications of E' at D form a groupoid Mod_D(E').

Additional hypotheses and scope:

- D must be a closed Cartier divisor (I_D invertible); this is what makes O(kD) defined and what makes restriction to the complement injective on sections

- beta must be an isomorphism on all of X-cal minus D, not only near D

- Both beta and beta^(-1) are required to be meromorphic; Fargues-Scholze require one direction for every representation of G, which for GL_n includes the dual representation and so gives the other direction

- The definition is local on S and on X-cal; for d = 0 (D empty) a modification is an isomorphism

Construction or proof route:

1. The definition is Fargues-Scholze's meromorphic modification at D, specialised to GL_n (FS III.3, printed p. 97), and the datum beta of Scholze-Weinstein Theorem 14.1.1(3).

2. Composition and inverses: if beta_1 is bounded by k and beta_2 by l then beta_2 beta_1 is bounded by k + l, and beta^(-1) is a modification of E at D with the same bound.

3. Because I_D is invertible and locally generated by a nonzerodivisor, a morphism of vector bundles is determined by its restriction off D; so isomorphisms of modifications are unique when they exist. The groupoid Mod_D(E') is therefore equivalent to the discrete set of its isomorphism classes. Allowing arbitrary bundle maps here would give a category with noninvertible arrows, for example O(-D) -> O for nonempty D.

Uses:

- Fargues-Scholze III.3: Gr_G / phi^Z -> Div^1 is the moduli of a modification between the trivial G-bundle and E at D

- Scholze-Weinstein Theorem 14.1.1, (2) <=> (3): the datum (F', beta) is equivalent to a B^+_dR-lattice by Beauville-Laszlo

- Howe-Klevdal, Section 4.3: the modification E_L of E by a lattice L on its G(B_dR)-local system

- RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification: a G-modification is a compatible family of modifications of the vector bundles attached to all representations

- BunGAndNewtonStrata:BG2:uniformization: the Beauville-Laszlo uniformization modifies a G-bundle at an untilt divisor

API:

- `Modification` (data): A modification of E' at D: a vector bundle E with an isomorphism beta : E|_{X minus D} = E'|_{X minus D} meromorphic along D in both directions.

- `Modification.extend` (projection): For a bound k, the unique morphism E -> E'(kD) extending beta, and E' -> E(kD) extending beta^(-1).

- `Modification.refl` (constructor): (E', id) is a modification of E' at D with bound 0.

- `Modification.symm` (constructor): (E', beta^(-1)) is a modification of E at D with the same bound.

- `Modification.trans` (constructor): Modifications bounded by k and l compose to one bounded by k + l.

- `Modification.tensor` (structure): The tensor product of modifications of E'_1 and E'_2 bounded by k and l is a modification of E'_1 (x) E'_2 bounded by k + l; the dual of a modification bounded by k is bounded by k.

- `Modification.pullback` (functoriality): For T -> S, pullback of (E, beta) along X-cal_T -> X-cal_S is a modification at D_T; pullback along the identity is the identity and pullbacks compose.

- `Modification.ext` (extensionality): Two morphisms of modifications are equal iff they agree off D; (E_1, beta_1) and (E_2, beta_2) are isomorphic iff beta_2^(-1) beta_1 extends to an isomorphism E_1 = E_2.

- `Modification.ofSubbundle` (constructor): An injective morphism E -> E' that is an isomorphism off D and whose image contains E'(-kD) defines a modification bounded by k.

Mathematical unit tests:

- `Modification.ideal_inclusion` (computation): For D nonempty, the inclusion I_D = O(-D) -> O_X-cal restricts to an isomorphism off D and is a modification of O at D bounded by 1, not bounded by 0.

- `Modification.empty_divisor` (degenerate): For d = 0 (D empty) a modification of E' at D is an isomorphism E = E', and every bound works.

- `Modification.ff_absolute` (compatibility): For S = Spa(C^flat) a geometric point and D = infinity on X_FF, modifications of E' at D are exactly Fargues-Fontaine's modifications of E' supported at {infinity} (5.6.4.2): bundles E with E|_{X minus infinity} = E'|_{X minus infinity}.

- `Modification.not_iso_off_D` (non-example): For a second degree-one divisor D' disjoint from D, the inclusion O -> O(D') is not a modification of O(D') at D: it is not an isomorphism on X-cal minus D.

Acceptance checks:

- The inclusion I_D = O(-D) -> O is a modification of O at D bounded by 1

- For d = 0 the groupoid is the set of bundles isomorphic to E'

- At a geometric point, modifications of E' at the point infinity of X_FF are Fargues-Fontaine's modifications supported at {infinity}

Direct prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `AdicSpacesPartII:R3/locally-free-sheaf`, `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`, `mathlib:Module.Invertible`, `mathlib:Module.Projective`.

Prototype boundary: Native cores express only the listed algebraic specializations. The mathematical specifications in comments are not native declarations or compiled tests of these objects.

Available-carrier signatures: `localModificationsBoundedBy`, `anonymous ideal-inclusion example (nonunit regular local equation)`.

Missing native interfaces `Modification`, `Modification.extend`, `Modification.refl`, `Modification.symm`, `Modification.trans`, `Modification.tensor`, `Modification.pullback`, `Modification.ext`, `Modification.ofSubbundle`, `Modification.ideal_inclusion`, `Modification.empty_divisor`, `Modification.ff_absolute`, `Modification.not_iso_off_D`: The sheaf-theoretic curve, Cartier ideal, finite-locally-free bundle and restriction-to-open carriers from RF0-RF2 and R3 are not exported at the pinned baseline. The local finite-projective submodule model is native but does not construct this groupoid.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.3, printed p. 97 — The definition for G-bundles; for G = GL_n with the standard and dual representation it is this node.; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 14.1.1(3), printed p. 115 — The modification datum beta at a degree-one divisor of the absolute curve.; [FF18-courbe](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), 5.3, before Proposition 5.3.1, p. 208 — The absolute picture: a bundle off finitely many points, bundles on formal discs and gluing on punctured discs..

### Beauville-Laszlo gluing on the relative curve: modifications are B^+-lattices

Node `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`; theorem.

Let X-cal be Y-curly_S, Y_S or X_S, D the divisor of a map S -> Div^d_(-), assumed affinoid, and E' a vector bundle on X-cal with completion E'-hat_D = Gamma(D, completion of E' along D), a finite projective B^+_D(S)-module. Then (E, beta) |-> Xi(E, beta) := beta(E-hat_D) is an equivalence from the groupoid Mod_D(E') of modifications of E' at D to the set of B^+_D(S)-lattices in E'-hat_D[1/I_D], i.e. finite projective B^+_D(S)-submodules Xi with Xi[1/I_D] = E'-hat_D[1/I_D]. A modification is bounded by k iff I_D^k E'-hat_D is contained in Xi and Xi in I_D^(-k) E'-hat_D. In particular the restriction E'|_{X-cal minus D} of this globally given reference bundle, a vector bundle on the formal neighbourhood (Xi) and an isomorphism on the punctured formal neighbourhood (Xi[1/I_D] = E'-hat_D[1/I_D]) determine a vector bundle on X-cal, and this fixed-reference gluing functor is fully faithful and essentially surjective. This does not assert effectivity for an arbitrary bundle given only off D; that stage target is planned separately by arbitrary-complement-formal-patching, with its precise comparison request and gap. Locally: on each sheafy affinoid chart U = Spa(A, A^+) meeting D on which I_D = xi A, the ring of completion along D intersect U is the xi-adic completion of A and the statement is RF4:vector-bundles/beauville-laszlo-module-gluing for the glueing pair (A, xi) combined with finite projective A-modules = vector bundles on U.

Additional hypotheses and scope:

- D affinoid, which holds locally on S (RF2:integral-divisors/product-equation-and-affineness); the result globalises over S by gluing

- I_D is invertible and locally generated by a nonzerodivisor xi of the chart ring A (RF2:untilts/closed-cartier-divisor-norm-estimate, RF2:integral-divisors/product-equation-and-affineness); this makes (A, xi) a glueing pair

- The charts are sheafy (sousperfectoid) affinoids, so vector bundles on U are finite projective A-modules (AdicSpacesPartII:R3); on X_S the charts come from Y_S through the phi-quotient (RF1)

- The punctured formal neighbourhood is not an open subspace of X-cal; the gluing is formulated through modifications of a given E', which is how Scholze-Weinstein and Fargues-Scholze use it

- The theorem is linear: G-valued and Grassmannian statements are RF4:G-torsors and GeometricSatakeAndFusion:GS0:loop-geometry

Construction or proof route:

1. Use a cover of a neighbourhood of D by sheafy affinoid charts U = Spa(A, A^+) on which I_D|_U = xi A, xi a nonzerodivisor of A; the completion along D intersect U has section ring A-hat (the xi-adic completion) because A/xi^n = O(D_n intersect U) for every n, and this is independent of U (RF2:integral-divisors/completed-rings-B-plus-and-B). On overlaps the canonical constructions agree by full faithfulness. Glue the formal finite projective modules on this cover; for affinoid D their global sections give the lattice over B^+_D(S). Affineness of D alone does not assert a single chart U containing it with a principal ideal.

2. Given a lattice Xi with xi^k E'-hat_D in Xi in xi^(-k) E'-hat_D, let M' = E'(U), a finite projective A-module (AdicSpacesPartII:R3/vector-bundle-global-generation). The glueing datum (M'[1/xi], Xi, can) is finite projective, so the Beauville-Laszlo theorem gives a finite projective A-module M with M[1/xi] = M'[1/xi] and M tensor_A A-hat = Xi|_{D intersect U}; the inclusions xi^k M' in M in xi^(-k) M' hold because they hold after completion and after inverting xi (exactness of 0 -> M -> M[1/xi] (+) M-hat -> M-hat[1/xi] -> 0).

3. The bundle E_U on U attached to M agrees with E' on U minus D through these inclusions (xi is invertible there); glue all E_U with E'|_{X-cal minus D} along their overlaps and U minus D (vector bundles form a sheaf: AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing). The result is a modification bounded by k with Xi(E, beta) = Xi.

4. Conversely a modification bounded by k gives xi^k M' in E(U) in xi^(-k) M' and Xi(E, beta) = E(U)-hat is a lattice; morphisms are determined off D (RF4:vector-bundles/modification-of-vector-bundles), giving full faithfulness.

5. The fixed-reference construction follows the local algebra used in SW Proposition 19.1.2, p. 170, and Theorem 14.1.1, pp. 115-116: recover modules by Beauville-Laszlo and then take their associated affinoid bundles. HK Section 4.3, p. 29, uses this construction representationwise over the perfectoid base.

Acceptance checks:

- For S a geometric point, d = 1 and E' trivial of rank n, recover the classical bijection between rank-n bundles with a trivialisation off infinity and B^+_dR-lattices in B_dR^n

- Minuscule case: modifications bounded by 1 with I_D E'-hat in Xi in E'-hat correspond to finite projective O(D)-module quotients of E'|_D

- Independence of the chart U and of the local generator xi

- The schematic triple description of RF4:vector-bundles/vector-bundles-as-relative-B-pairs agrees with this one under GAGA

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`, `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles`, `RelativeFarguesFontaine:RF4:vector-bundles/glueing-pair`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `AdicSpacesPartII:R3/vector-bundle-global-generation`, `AdicSpacesPartII:R3/locally-free-sheaf`, `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `mathlib:AdicCompletion`, `mathlib:Module.Projective`, `mathlib:Module.Invertible`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proof of Proposition 19.1.2, printed p. 170 — The gluing of bundles off a Cartier divisor with lattices on its completion.; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proof of Theorem 14.1.1, printed p. 116 — Modifications at a degree-one divisor are lattices in the completion.; [HK-admissible](https://arxiv.org/abs/2308.11064v2), Section 4.3, p. 29 — The relative construction over a perfectoid base S, by exactly this proof.; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1, before Definition VI.1.5, printed p. 192 — The completed rings B^+_D(S) of arbitrary degree d..

### Patching arbitrary complement and formal bundle data

Node `RelativeFarguesFontaine:RF4:vector-bundles/arbitrary-complement-formal-patching`; theorem.

Full stage target, conditional on the punctured-formal comparison requested from AdicSpacesPartII:R3: let E be any nonarchimedean local field, S an affinoid perfectoid F_q-space, X-cal one of curly-Y_S,Y_S,X_S, and D the effective Cartier divisor supplied by RF2, affine locally on S. The restriction of a vector bundle on X-cal to X-cal minus D and to its formal completion, with the canonical identification on the punctured formal neighbourhood, is an equivalence onto compatible triples (E_U,F,alpha), where E_U is an arbitrary vector bundle on the complement, F is a finite-locally-free bundle on the formal completion (a finite projective B_D-plus module when D is affinoid), and alpha identifies their realizations on that puncture. Arrows are the pairs of bundle maps compatible with alpha. No globally extended reference E-prime is part of these inputs. The missing supplier must define precisely which analytic/formal puncture is used and justify algebraic models for compatible data; this statement is a planning target, not a claim that every analytic bundle or morphism on a punctured chart comes from A[1/xi].

Additional hypotheses and scope:

- Use the exact general-E curves and Cartier ideals supplied by RF0-RF2; work on a chart cover, with a generator xi on each chart.

- The compatible punctured-formal data category and its chart comparison are an explicit requested prerequisite. An algebraic localization is not assumed to represent the analytic complement.

Construction or proof route:

1. Import the missing chart comparison from AdicSpacesPartII:R3: a compatible complement/formal datum on U=Spa(A,A-plus), with D cut out by regular xi, gives an A[1/xi]-module, an A-hat-module and their A-hat[1/xi] identification; these models and compatible morphisms must commute with restriction and refinement. This is the recorded gap. It is not supplied by the theorem equating bundles on an affinoid with finite projective modules, since U minus D need not be affinoid.

2. Apply the algebraic Beauville-Laszlo equivalence to the model triple to obtain a finite projective A-module. Its associated bundle restricts to the prescribed complement bundle and formal bundle by the supplier comparison.

3. For morphisms, full faithfulness of algebraic gluing gives unique chart maps compatible with the supplied data. Restrict to overlaps and glue using the R3 bundle descent theorem. Uniqueness also makes independence of cover and local generator canonical.

4. In the unramified degree-one schematic setting the comparison is literal scheme restriction, and the result follows from KL Theorem 8.9.6(b)-(c), p. 188, and CS Theorem 3.5.1, p. 33. SW5.2.8-5.2.9, pp. 37-38, and SW19.1.2, p. 170, justify the affinoid algebra and fixed-reference cases; they do not establish the general comparison demanded above.

Acceptance checks:

- Retain arbitrary E_U as input, without replacing it by the restriction of a global E-prime.

- Recover the fixed-reference lattice theorem and the unramified schematic triple theorem as specializations.

- Use a chart cover and a genuine punctured-formal comparison; do not identify the analytic U minus D with Spec(A[1/xi]).

- If the requested comparison requires bounded or algebraizable data, state those hypotheses and establish with evidence whether the current full stage target requires rescoping.

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`, `AdicSpacesPartII:R3`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `AdicSpacesPartII:R3/vector-bundle-global-generation`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`.

Prototype boundary: No full geometric signature: the compatible analytic/formal puncture category and its chart comparison are the explicit R3 request.

Sources: [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 5.2.8 and Lemma 5.2.9, printed pp. 37-38; Proposition 19.1.2, printed p. 170 — Affinoid algebra and the fixed-reference torsor case motivate the chartwise reduction; the missing general comparison is not claimed to follow from these statements.; [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Theorem 8.9.6(b)-(c), printed p. 188 — Establishes arbitrary complement/formal gluing for the unramified degree-one schematic curve, an acceptance specialization rather than a proof of the full adic target..

### The gluing is an exact tensor equivalence and commutes with base change

Node `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`; theorem.

In the setting of RF4:vector-bundles/meromorphic-modification-at-a-divisor: (a) the lattice functor commutes with tensor products, duals and internal Hom: Xi(E_1 (x) E_2) = Xi(E_1) (x) Xi(E_2) inside (E'_1 (x) E'_2)-hat_D[1/I_D] and Xi(E^dual) = Xi(E)^dual; (b) it is exact: a sequence of modifications 0 -> E_1 -> E -> E_2 -> 0 of a short exact sequence 0 -> E'_1 -> E' -> E'_2 -> 0 is exact iff the sequence of lattices 0 -> Xi_1 -> Xi -> Xi_2 -> 0 is exact, and every exact sequence of lattices compatible with the completed sequence of the E' glues to an exact sequence of vector bundles; (c) it commutes with base change: for a map T -> S of affinoid perfectoid spaces with pulled-back divisor D_T, the pullback of (E, beta) corresponds to Xi (x)_{B^+_D(S)} B^+_{D_T}(T), compatibly with composition of base changes; (d) on the algebraic side, for a map of glueing pairs (R, f) -> (R_2, f_2) (a ring map with f |-> f_2 up to a unit), Can and the module of sections commute with base change of finite projective glueing data (coefficient change). The arbitrary-input equivalence of arbitrary-complement-formal-patching, once its comparison prerequisite is supplied, also commutes with tensor products, duals, short exact sequences and pullback: verify this on its chart module triples by the same arguments. This additional clause does not enlarge the proved fixed-reference theorem by assumption.

Additional hypotheses and scope:

- Bundles and lattices are finite projective; exactness is for sequences of finite projective modules

- Base change uses that B^+_{Div^d} and B_{Div^d} are v-sheaves over Div^d (RF2:integral-divisors/completed-rings-B-plus-and-B), so B^+_D(S) -> B^+_{D_T}(T) is defined

- Coefficient change in (d) requires f_2 to be a nonzerodivisor (or (R_2, f_2) a glueing pair); otherwise the base-changed datum need not glue

Construction or proof route:

1. (a) On a chart U with I_D = xi A, the gluing of RF4:vector-bundles/beauville-laszlo-module-gluing commutes with tensor products and duals of finite projective glueing data, because Can is a tensor functor and the module of sections of a finite projective datum is finite projective with M (x) R' = M' (RF4:vector-bundles/finite-projective-glueing-over-exact-square).

2. (b) Exact sequences of finite projective modules are split, so scalar extension preserves them. For reflection, the cokernel vanishes if it vanishes on both pieces (Stacks 15.92.2). Surjectivity onto the right finite projective module then splits; its kernel is finite projective and its scalar extensions are the kernels on the pieces. Apply the same cokernel detection to the map from the left module to that kernel, split again, and detect its remaining kernel by the sections exact sequence. This proves exactness reflection for finite projective sequences without claiming it for arbitrary modules. Caraiani-Scholze 3.5.1 records this compatibility.

3. (c) Pullback of the chart: A -> A_T with xi |-> xi_T a local generator of I_{D_T}, so A-hat (x) ... -> A_T-hat; the gluing of the base change is the base change of the gluing by (d).

4. (d) Let R -> A be the coefficient map of glueing pairs, with compatible maps R' -> A' and their localizations. If M glues the old finite projective datum, M tensor_R A is finite projective; tensor associativity identifies its canonical datum over (A,A') with the datum extended piecewise from the old one. Beauville-Laszlo over the new glueing pair identifies its sections with M tensor_R A. This does not assert that tensoring the original ring exact sequence stays exact, or that R' tensor_R A equals A'.

5. For arbitrary complement input, use the requested chart comparison of arbitrary-complement-formal-patching, whose functoriality and exact-tensor properties are part of the supplier contract. The split finite-projective module arguments above then apply locally, and full faithfulness glues their compatibilities.

Acceptance checks:

- The tensor product of modifications bounded by k and l is bounded by k + l, and the lattice of the determinant is the determinant of the lattice

- Base change to the geometric points of S recovers the fibrewise lattices

- Exactness is asserted only for sequences of lattices, which are finite projective: the sequence 0 -> I_D B^+ -> B^+ -> B^+/I_D -> 0 has a torsion last term and is not the lattice sequence of a short exact sequence of modifications

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`, `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`, `RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `mathlib:TensorProduct`, `mathlib:Module.Dual`, `mathlib:CategoryTheory.Functor.Monoidal`, `RelativeFarguesFontaine:RF4:vector-bundles/arbitrary-complement-formal-patching`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [CS17-generic](https://arxiv.org/abs/1511.02418v1), Theorem 3.5.1, printed p. 33 — The tensor and exactness compatibility of the gluing, stated by Caraiani-Scholze for Kedlaya-Liu's equivalence.; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1, before Definition VI.1.5, printed p. 192 — The completed rings are v-sheaves, so the gluing is compatible with base change in S.; [Stacks-BL](https://stacks.math.columbia.edu/tag/0BNI), Section 15.92, introduction — Coefficient change along maps of glueing pairs..

### Gluing along several disjoint or colliding legs

Node `RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs`; theorem.

Let D_1, D_2 be divisors attached to S -> Div^{d_1}_(-), S -> Div^{d_2}_(-) and D = D_1 + D_2 the divisor attached to their sum in Div^{d_1 + d_2}, so I_D = I_{D_1} I_{D_2}. (a) Disjoint legs: if D_1 and D_2 are disjoint then B^+_D(S) = B^+_{D_1}(S) x B^+_{D_2}(S) and B_D(S) = B_{D_1}(S) x B_{D_2}(S); a lattice at D is a pair of lattices, and modifications of E' at D are equivalent to pairs consisting of a modification (E_1, beta_1) of E' at D_1 and a modification of E_1 at D_2 (iterated gluing, in either order, canonically independent of the order). (b) Colliding legs: if D = m D_1 (all legs equal, m >= 1) then I_D = I_{D_1}^m, B^+_D(S) = B^+_{D_1}(S) and B_D(S) = B_{D_1}(S), and a modification is bounded by l at D iff it is bounded by m*l at D_1. A k-bound at D_1 implies a ceiling(k/m)-bound at D, while that bound at D implies only an m*ceiling(k/m)-bound at D_1. When a least global bound k_min exists, the least bound at D is ceiling(k_min/m). (c) For a locally finite family (D_n) of pairwise disjoint degree-one divisors of Y_S (for instance the Frobenius translates phi^n(D_0), n >= 1, on Y_{[0,oo)}), modifications of E' with locally finite support along the union and meromorphy bounded on each chart (no single global bound imposed) are equivalent to families of lattices (Xi_n) at each D_n.

Additional hypotheses and scope:

- Disjointness in (a) is of the closed subspaces D_1, D_2 of X-cal; then I_{D_1} + I_{D_2} = O and the Chinese remainder theorem applies on affinoid charts

- In (b) the legs may coincide; FS VI.1.2 constructs the degree-d divisor of an ordered tuple by the product equation xi = xi_1 ... xi_d, which is a nonzerodivisor also at coincident legs

- In (c) local finiteness is what lets the gluing be performed chart by chart; the family is infinite in Scholze-Weinstein Proposition 12.4.6

Construction or proof route:

1. (a) Work on an affinoid chart cover near D with I_{D_i} = xi_i A, the ideals xi_1^n A and xi_2^n A are comaximal for every n, so A/(xi_1 xi_2)^n = A/xi_1^n x A/xi_2^n and the completions split; a lattice at D is then a pair, and RF4:vector-bundles/meromorphic-modification-at-a-divisor glues one factor at a time.

2. (b) For D = m D_1 one has I_D = I_{D_1}^m, so the I_D-adic and I_{D_1}-adic filtrations are cofinal and the completions and their localisations coincide; E -> E'(l D) is exactly E -> E'(m*l D_1); the same applies to beta^(-1), so meromorphy along D and along D_1 are the same condition.

3. For a locally finite disjoint family, choose charts meeting only finitely many supports. Apply finite gluing there and use uniqueness on overlaps to glue the resulting bundles and Frobenius maps. This is the iteration in SW Proposition 12.4.6, pp. 106-107; no uniform bound over the entire non-quasicompact space is imposed.

4. Fargues-Fontaine Proposition 5.3.1 is the absolute case: a bundle on X, finitely many points x_i, completions O-hat_{X,x_i}.

Acceptance checks:

- For S a geometric point and finitely many distinct classical points x_1, ..., x_r of X_FF, recover Fargues-Fontaine Proposition 5.3.1

- For two colliding legs at the same untilt, the Beilinson-Drinfeld ring B^+_{Div^2} at the diagonal is B^+_dR, not B^+_dR x B^+_dR

- The iterated gluing at D_1 then D_2 and at D_2 then D_1 give canonically isomorphic modifications

- For m = 2, the modification O(-2D_1) -> O is bounded by 1 at 2D_1 but not by 1 at nonempty D_1. Thus k-bounded and ceiling(k/m)-bounded loci are not identified in general.

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`, `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition VI.1.6 and the remark after it, printed p. 193 — Modifications along degree-d divisors, whose legs may collide.; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proof of Proposition 12.4.6, printed pp. 106-107 — Gluing along an infinite locally finite family of disjoint degree-one divisors.; [FF18-courbe](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Proposition 5.3.1, p. 209 — The absolute gluing at finitely many points..

### The complement of the untilt divisor in Proj(P_R) is affine (Kedlaya-Liu 8.9.3)

Node `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine`; theorem.

Then (a) the open subscheme Proj(P_R) minus Z is affine; (b) the closed subscheme Z is a Cartier divisor contained in an open affine subscheme of Proj(P_R).

Additional hypotheses and scope:

- The base X = Spa(A, A^+) is affinoid perfectoid over Q_p; the source works with phi^a-modules over Q_p, which is the unramified coefficient field E = W(F_q)[1/p]

- (a) uses that Z is the zero locus of a section t_X of the ample line bundle L_X; Kedlaya-Liu state that L_X is pure of slope 1, and the corrected slope is 1/a (PAPER-KEDLAYA-LIU-15/E78), which does not affect ampleness

- (b) uses an element t_L of P_{L,1} over an auxiliary perfect analytic field L whose Newton polygon avoids slope 1

Construction or proof route:

1. (a) Z is the divisor of the section t_X of L_X. By KL Lemma 8.8.19 the phi^a-module of L_X is M(1) with M globally etale, so L_X is globally ample by KL Corollary 8.8.7 (VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness); the nonvanishing locus of a section of a globally ample line bundle is affine (KL Lemma 8.8.8; VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness).

2. (b) Following the proof of KL Proposition 6.2.4 choose t_L in P_{L,1} whose Newton polygon does not have slope 1; then Z is contained in the affine open D_+(t_L), on which Z is cut out by one equation.

Acceptance checks:

- At a geometric point (A = C) recover Fargues-Fontaine: X minus {infinity} = Spec(B_e) with B_e = B[1/t]^{phi = 1} for t in P_1 with V^+(t) = {infinity}

- The open D_+(t_L) of (b) contains Z and is affine, so the completion of Proj(P_R) along Z is an affine formal scheme

Direct prerequisites: `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`, `VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness`, `VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Lemma 8.9.3, p. 187 — The statement in the stated scope.; [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Proof of Lemma 8.9.3, p. 187 — The proof route..

### The relative period rings B_e(A), B^+_dR(A), B_dR(A) (Kedlaya-Liu 8.9.4)

Node `RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR`; construction.

Define R_1 = B_e(A) by Spec(R_1) = Proj(P_R) minus Z (affine by RF4:vector-bundles/untilt-divisor-complement-affine (a)); R_2 = B^+_dR(A) by Spec(R_2) = the completion of Proj(P_R) along Z (affine by (b)); and R_3 = B_dR(A) by Spec(R_3) = Spec(R_1) x_{Proj(P_R)} Spec(R_2). Then R_2 is the ker(theta)-adic completion of R-tilde^{int,1}_R and R_3 = R_2[1/z] for any generator z of ker(theta); R_2 and R_3 are the rings B^+_D(S), B_D(S) of the degree-one untilt divisor D of RF2:untilts, and the triple is a relative version of Fontaine's (B_e, B^+_dR, B_dR).

Additional hypotheses and scope:

- Hypotheses of Kedlaya-Liu 8.9.1 (affinoid perfectoid base over Q_p, unramified coefficients)

- R_1 is the ring of the AFFINE scheme Proj(P_R) minus Z; it is not B[1/t]: the phi-invariance is built into P_R

- R_3 = R_2[1/z] is independent of the generator z of ker(theta) because any two differ by a unit of R_2

Construction or proof route:

1. Lemma 8.9.3 makes all three schemes affine; the fibre product of affine schemes over a separated scheme is affine.

2. The identification of R_2 with the ker(theta)-adic completion of R-tilde^{int,1}_R uses that Z = Spec(A) and the completion along Z only sees the rings A/ker(theta)^n (KL Definition 8.9.4).

3. Compatibility with RF2:untilts: both rings are the completion of the structure sheaf along the same Cartier divisor, transported by GAGA (VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence).

4. In the p-typical case, compare R_2 with Mathlib's BDeRhamPlus A^+ p through PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras, which identifies the theta-kernel-adic completions.

Uses:

- Kedlaya-Liu Theorem 8.9.6: vector bundles on Proj(P_R) are triples over R_1, R_2 with an isomorphism over R_3, and the B-pair complex over these rings computes cohomology

- Caraiani-Scholze Theorem 3.5.1 and Corollary 3.5.2: gluing a B^+_dR,R-lattice in B_dR,R^n to the trivial bundle on X(R-flat) minus Z, giving the map from the affine Grassmannian to G-bundles

- Fargues-Fontaine 8.2.1.1: at a geometric point, X minus {infinity} = Spec(B_e), O-hat_{X,infinity} = B^+_dR, and bundles are pairs (M, N)

- Kedlaya-Liu Definition 9.3.11: the sheafified rings B_{e,X}, B^+_{dR,X}, B_{dR,X} of B-pairs over a general base

API:

- `RelativeBe` (data): R_1 = B_e(A) = O(Proj(P_R) minus Z), a Q_p-algebra functorial in (A, A^+).

- `RelativeBdRPlus` (data): R_2 = B^+_dR(A), the ring of the completion of Proj(P_R) along Z.

- `RelativeBdR` (data): R_3 = B_dR(A) = O(Spec R_1 x_{Proj} Spec R_2).

- `RelativeBdR.eq_localization` (characterisation): R_3 = R_2[1/z] for every generator z of ker(theta), and the localisation does not depend on z.

- `RelativeBdRPlus.equiv_completedRing` (compatibility): R_2 = B^+_D(S) and R_3 = B_D(S) for the degree-one divisor D of the untilt (RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration), compatibly with theta and the I_D-adic filtration.

- `RelativeBdRPlus.equiv_mathlib` (compatibility): In the p-typical case R_2 is canonically isomorphic to Mathlib's BDeRhamPlus A^+ p and R_3 to BDeRham A^+ p, through PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras.

- `RelativeBe.restrict` (projection): The restriction maps R_1 -> R_3 and R_2 -> R_3, and the localisation R_2 -> R_3.

- `RelativeBe.map` (functoriality): A morphism of perfectoid pairs (A, A^+) -> (A', A'^+) induces compatible maps R_i(A) -> R_i(A'), with map_id and map_comp.

- `RelativeBe.atGeometricPoint` (example): For A = C complete algebraically closed, R_1 = B[1/t]^{phi = 1} = B_e for t in P_1 with V^+(t) = {infinity}.

Mathematical unit tests:

- `RelativeBe.fundamental_exact_sequence` (computation): For A = C and a = 1: ker(R_1 (+) R_2 -> R_3) = Q_p and R_1 (+) R_2 -> R_3 is surjective; this is Fontaine's fundamental exact sequence 0 -> Q_p -> B_e -> B_dR/B^+_dR -> 0 (PadicHodgeTheory:R06.1/fundamental-exact-sequence).

- `RelativeBdR.localization_unit_invariant` (degenerate): Replacing the generator z of ker(theta) by uz with u a unit of R_2 gives the same subring R_2[1/z] = R_2[1/(uz)] of R_3.

- `RelativeBdRPlus.mathlib_compat` (compatibility): For (A, A^+) = (C, O_C) with C/Q_p complete algebraically closed, R_2 is isomorphic to BDeRhamPlus O_C p and R_3 to BDeRham O_C p, compatibly with theta.

- `RelativeBe.not_B_invert_t` (non-example): R_1 is not B[1/t]: at A = C the element 1/t of B[1/t] is not phi-invariant (phi(1/t) = p^(-1) t^(-1)), so it does not lie in B_e.

Acceptance checks:

- At A = C: R_1 = B_e = B_crys^{phi = 1}, R_2 = B^+_dR(C), R_3 = B_dR(C), and Fontaine's fundamental exact sequence 0 -> Q_p -> B_e -> B_dR/B^+_dR -> 0 holds

- Changing the generator z of ker(theta) by a unit does not change R_3

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `mathlib:BDeRhamPlus`, `mathlib:BDeRham`, `mathlib:IsLocalization.Away`, `mathlib:AdicCompletion`.

Prototype boundary: Native cores express only the listed algebraic specializations. The mathematical specifications in comments are not native declarations or compiled tests of these objects.

Available-carrier signatures: `generator-invariance localization example`.

Missing native interfaces `RelativeBe`, `RelativeBdRPlus`, `RelativeBdR`, `RelativeBdR.eq_localization`, `RelativeBdRPlus.equiv_completedRing`, `RelativeBdRPlus.equiv_mathlib`, `RelativeBe.restrict`, `RelativeBe.map`, `RelativeBe.atGeometricPoint`, `RelativeBe.fundamental_exact_sequence`, `RelativeBdR.localization_unit_invariant`, `RelativeBdRPlus.mathlib_compat`, `RelativeBe.not_B_invert_t`: The relative Proj(P_R) curve, its untilt section and formal completion comparison are unavailable. Mathlib BDeRhamPlus/BDeRham exist only as the p-typical algebraic carriers; they do not define RelativeBe or identify the geometric relative completion.

Sources: [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Definition 8.9.4, p. 187 — Defines the three affine ring carriers and identifies the formal carrier with its theta-kernel-adic completion.; [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Definition 8.9.4, p. 187 — Defines the three affine ring carriers and identifies the formal carrier with its theta-kernel-adic completion.; [CS17-generic](https://arxiv.org/abs/1511.02418v1), Before Theorem 3.5.1, printed p. 33 — Caraiani-Scholze's naming of R_2, R_3 as B^+_dR,R and B_dR,R..

### B-pair cohomology computes quasicoherent cohomology (Kedlaya-Liu 8.9.6(a))

Node `RelativeFarguesFontaine:RF4:vector-bundles/B-pair-cohomology`; theorem.

With R_1, R_2, R_3 as in RF4:vector-bundles/relative-period-rings-Be-BdR, for every flat quasicoherent sheaf V on Proj(P_R) the cohomology of the complex 0 -> Gamma(Spec R_1, V) (+) Gamma(Spec R_2, V) -> Gamma(Spec R_3, V) -> 0, whose arrow is the difference of the two restriction maps, is naturally identified with H^i(Proj(P_R), V) (so H^i = 0 for i >= 2). At a geometric point (Fargues-Fontaine Proposition 5.3.3) for a vector bundle E with M = Gamma(X minus {infinity}, E) and N = E-hat_infinity: H^0(X, E) = M intersect N and H^1(X, E) = N[1/t]/(M + N).

Additional hypotheses and scope:

- V flat and quasicoherent; for non-flat V the Beauville-Laszlo sequence need not be exact

- Spec(R_2) -> Proj(P_R) is not known to be flat in general (Kedlaya-Liu Remark 8.9.5), so the statement is not obtained by faithfully flat descent

- Same hypotheses as RF4:vector-bundles/untilt-divisor-complement-affine

Construction or proof route:

1. Cover Proj(P_R) by Spec(R_1) and an affine open Spec(B) containing Z on which Z = V(z) (Lemma 8.9.3(b)); Proj(P_R) is separated, so the Cech complex of this cover computes cohomology of quasicoherent sheaves and cohomology vanishes above degree 1 (KL Remark 8.7.6(b); VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension).

2. On Spec(B), Beauville-Laszlo for the glueing pair (B, z) and the flat module V(B) gives the exact sequence 0 -> V(B) -> V(B)[1/z] (+) (V(B) tensor_B B-hat) -> (V(B) tensor_B B-hat)[1/z] -> 0 (RF4:vector-bundles/beauville-laszlo-module-gluing (c)). This is extension of scalars, not the z-adic completion of V(B): those differ for infinite flat modules.

3. Compare the two-affine Cech complex with the flat-module Beauville-Laszlo sequence. The complement of Z inside Spec(B) is Spec(B[1/z]); formal pullback has sections V(B) tensor_B B-hat and localized pullback has its z-localization. The resulting map of complexes induces the desired H0 and H1 identifications (KL Theorem 8.9.6(a), p. 188).

Acceptance checks:

- For V = O and A = C recover H^0(X, O) = Q_p and H^1(X, O) = 0 from Fontaine's fundamental exact sequence

- For V = O(1) at a geometric point recover H^1(X, O(1)) = 0 from B_e^{phi = p}-surjectivity onto B_dR/B^+_dR

- Check that the complex has length two, matching the cohomological dimension one of Proj(P_R)

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR`, `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine`, `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`, `mathlib:Module.Flat`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Theorem 8.9.6(a), p. 188 — The statement in the stated scope.; [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Remark 8.9.5, p. 187 — Why Beauville-Laszlo, not flat descent, is used.; [FF18-courbe](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Proposition 5.3.3, p. 209 — The absolute case at a geometric point..

### Vector bundles on the relative curve are relative B-pairs (Kedlaya-Liu 8.9.6(b),(c))

Node `RelativeFarguesFontaine:RF4:vector-bundles/vector-bundles-as-relative-B-pairs`; theorem.

(b) The morphism Spec(R_1 (+) R_2) -> Proj(P_R) is an effective descent morphism for quasicoherent finite locally free sheaves. (c) The category of vector bundles on Proj(P_R) is equivalent to the category of triples (V_1, V_2, iota) with V_1 a finite projective R_1 = B_e(A)-module, V_2 a finite projective R_2 = B^+_dR(A)-module and iota : V_1 (x)_{R_1} R_3 = V_2 (x)_{R_2} R_3 an isomorphism of R_3 = B_dR(A)-modules; the equivalence is compatible with tensor products and short exact sequences. By GAGA the same holds for vector bundles on the adic relative curve FF_R = X_S (Caraiani-Scholze Theorem 3.5.1). At a geometric point S = Spa(C^flat), where B_e is a principal ideal domain, vector bundles on X_FF are triples of finite free modules (Fargues-Fontaine Corollaire 5.3.2) and isomorphism classes of rank-n bundles are GL_n(B_e) \ GL_n(B_dR) / GL_n(B^+_dR).

Additional hypotheses and scope:

- Hypotheses of Kedlaya-Liu 8.9.1: affinoid perfectoid base over Q_p and unramified coefficients; the general-E relative version is RF4:vector-bundles/meromorphic-modification-at-a-divisor, formulated through modifications

- The triples are of finite projective modules; finite free in the field case only because Pic(Spec B_e) = 0

- The compatibility with short exact sequences is stated by Caraiani-Scholze for this equivalence

Construction or proof route:

1. (b), (c): Kedlaya-Liu deduce both from Proposition 1.3.6: on an affine open Spec(B) containing Z with Z = V(z), the glueing pair (B, z) glues finite projective B[1/z]- and B-hat-modules; glue the result with V_1 on Spec(R_1) along Spec(B[1/z]) (RF4:vector-bundles/beauville-laszlo-module-gluing, RF4:vector-bundles/untilt-divisor-complement-affine).

2. Transport to FF_R by GAGA (KL Theorem 8.7.7; VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence), as Caraiani-Scholze do.

3. Tensor and exactness compatibility as in RF4:vector-bundles/gluing-exactness-tensor-and-base-change.

4. Field case: B_e is a principal ideal domain (Fargues-Fontaine; VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point), so finite projective B_e-modules are free; choosing bases gives the double coset description (FF Corollaire 5.3.2).

Acceptance checks:

- Gluing a B^+_dR(A)-lattice in B_dR(A)^n to the trivial bundle on Proj(P_R) minus Z gives a vector bundle (the 'in particular' of Caraiani-Scholze 3.5.1)

- At a geometric point the trivial lattice gives O^n and the lattice t^(-1) B^+_dR (+) B^+_dR^(n-1) gives O(1) (+) O^(n-1)

- Rank one at a geometric point: GL_1(B_e) \ B_dR^x / (B^+_dR)^x = Z, the degree

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR`, `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine`, `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`, `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`, `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `mathlib:Module.Projective`, `mathlib:Module.Free`, `mathlib:CategoryTheory.Equivalence`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [KL15-foundations](https://arxiv.org/abs/1301.0792v5), Theorem 8.9.6(b),(c), p. 188 — The proof applies the finite-projective Beauville-Laszlo theorem on a schematic affine neighbourhood, then glues to the bundle on the affine complement.; [CS17-generic](https://arxiv.org/abs/1511.02418v1), Theorem 3.5.1, printed p. 33 — The adic curve via GAGA, and the tensor and exactness compatibility.; [FF18-courbe](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Corollaire 5.3.2, p. 209 — The absolute case with the double coset description..

### Lattices (T, Xi) and modifications of trivial bundles (Scholze-Weinstein 12.4.6, 14.1.1)

Node `RelativeFarguesFontaine:RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles`; comparison.

(a) For S affinoid perfectoid with an untilt S^sharp over E, D = S^sharp the degree-one divisor of X_S, fix a finite free O_E-module T and the reference bundle F = T (x)_{O_E} O_{X_S}. The gluing of RF4:vector-bundles/meromorphic-modification-at-a-divisor gives an equivalence between B^+_dR(S^sharp)-lattices Xi in T (x)_{O_E} B_dR(S^sharp) and modifications (F', beta^(-1)) of this fixed F at D, where beta : F|_{X_S minus D} -> F'|_{X_S minus D} is meromorphic along D. If T varies, the output retains T and its identification with the reference bundle; forgetting this integral data does not give an equivalence of categories. (b) For S = Spa(C^flat) and E = Q_p, using the locally finite family of disjoint divisors phi^n(x_C), n >= 1, of Y_{[0,oo)}: the pairs (T, Xi) are equivalent to shtukas over Spa(C^flat) with one leg at phi^(-1)(x_C) (Scholze-Weinstein Proposition 12.4.6), and to quadruples (F, F', beta, T) with F trivial and T a Z_p-lattice in H^0(X_FF, F) (Theorem 14.1.1, (2) <=> (3)). (c) Minuscule case (Fargues-Fontaine 8.3.1): lattices with t Xi_0 in Xi in Xi_0, Xi_0 = T (x) B^+_dR, correspond to C-subspaces of T (x) C, i.e. to modifications whose cokernel is killed by t.

Additional hypotheses and scope:

- E = Q_p and S a geometric point in (b), as in the source; (a) is the relative statement and needs no more than the linear gluing

- The equivalence of 'F trivial with a Z_p-lattice T in H^0(X_FF, F)' and 'T finite free over Z_p' uses H^0(X_FF, O) = Q_p (VectorBundlesAndIsocrystals:VB1/cohomology-of-twists), not the classification of bundles

- This node is the curve input of the ESSENTIAL SURJECTIVITY of Fargues' theorem (BKF modules <-> (T, Xi)); full faithfulness uses no curve input (BMS1 Remark 4.29), so it is exported to the essential-surjectivity part of AInfCohomology AI.2 only (RT-AREA-padic-1/19)

- The one-leg shtuka assertion imports SW12.3.4 from the exact VB4/integral-frobenius-local-systems node and requests SW12.3.5 and12.4.1 from its foundation owner VB4. This route uses Robba/Frobenius foundations, not downstream HS2 or the RF4 lattice comparison itself.

Construction or proof route:

1. (a) Apply RF4:vector-bundles/meromorphic-modification-at-a-divisor with E' = F: F-hat_D = T (x) B^+_dR(S^sharp), so modifications of F at D are lattices in T (x) B_dR.

2. SW Theorem 12.3.4 identifies integral Robba Frobenius modules and W(C-flat) Frobenius modules with finite free Z_p-modules, using scalar extension and fixed vectors (VB4/integral-frobenius-local-systems). The requested VB4 no-leg equivalence, SW Proposition 12.3.5, identifies these with no-leg shtukas on Y[0,infinity). Starting with T tensor O, insert Xi at x_C and then at each phi^n(x_C), n>=1; local finiteness and the linear gluing give a one-leg shtuka. The requested VB4 tail-recovery theorem, SW Corollary 12.4.1, uniquely compares a one-leg shtuka to its no-leg model away from the forward orbit; its completed comparison recovers Xi. This proves the construction and recovery of SW Proposition 12.4.6, pp. 106-107.

3. For SW Theorem 14.1.1(2)-(3), H0(X_FF,O)=Q_p identifies a trivial bundle F with a finite-dimensional Q_p-space. Retaining the Z_p-lattice T in its sections gives the integral reference datum. Linear Beauville-Laszlo identifies F-prime and its meromorphic comparison beta with a B_dR-plus lattice in T tensor B_dR. Thus the varying-T category keeps T, rather than forgetting it; multiplication by 1/p on F is not an automorphism of T=Z_p (SW pp. 115-116).

4. (c) A modification with t Xi_0 in Xi in Xi_0 is determined by Xi / t Xi_0, a C-subspace of Xi_0 / t Xi_0 = T (x) C (Fargues-Fontaine 8.3.1).

Acceptance checks:

- p-divisible group range: T (x) B^+_dR in Xi in xi^(-1)(T (x) B^+_dR) (Scholze-Weinstein Theorem 14.1.1, last sentence; Remark 12.4.7)

- Rank one: Xi = xi^k B^+_dR with k in Z gives F' = O(-k), compatible with the sign convention O(infinity) = O(1)

- The functor (T, Xi) |-> (F, F', beta, T) commutes with tensor products and duals (RF4:vector-bundles/gluing-exactness-tensor-and-base-change)

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`, `RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs`, `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `mathlib:Module.Free`, `VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems`, `VectorBundlesAndIsocrystals:VB4`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proposition 12.4.6, printed p. 106 — Part (b), first equivalence.; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proof of Proposition 12.4.6, printed pp. 106-107 — The gluing step.; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proof of Theorem 14.1.1, printed p. 116 — Part (b), second equivalence.; [BMS18-integral](https://arxiv.org/abs/1602.03148v3), Remark 4.29, p. 43 — Why this node feeds only the essential-surjectivity half of Fargues' theorem.; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 12.3.4 and Proposition 12.3.5, printed p. 104; Corollary 12.4.1, printed p. 105 — These are the no-leg model and uniquely normalized tail comparison used by the one-leg recovery; they are imported or requested from VB4..

### Kedlaya's algebraicity of vector bundles on the punctured Witt spectrum

Node `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles`; theorem.

Let R be a perfect Tate Huber ring of characteristic p, R^+ a ring of integral elements, x in R a topologically nilpotent unit (so x in R^+), and A = W(R^+) (p-typical Witt vectors). Let X-sch = Spec(A) minus V(p, [x]) and Y-ad = Spa(A, A) minus V(p, [x]), the analytic locus. Then pullback along the morphism of locally ringed spaces Y-ad -> X-sch is an equivalence Vec(X-sch) = Vec(Y-ad) (Kedlaya, Theorem 3.8). If moreover R^+ = o_K for a perfectoid field K of characteristic p, then finite free A-modules, vector bundles on Spa(A, A) and vector bundles on Spa(A, A) minus the closed point are equivalent (Kedlaya Theorem 3.9; Scholze-Weinstein Theorem 14.2.1), and so are vector bundles on Spec(A) minus the closed point (Scholze-Weinstein Lemma 14.2.3). For general R^+ a vector bundle on Spec(A) minus {p = [x] = 0} need not extend to Spec(A) (Kedlaya Example 3.14).

Additional hypotheses and scope:

- p-typical: A = W(R^+), coefficient field Q_p, as in the source; the ramified W_{O_E}(R^+) and equal-characteristic versions are proof obligations not covered by a read source

- The adic space Y-ad contains the locus [x] = 0 (the 'crystalline end'), outside Y-curly_S; its rational charts are those of Kedlaya Definition 3.5

- Extension across the remaining closed point is restricted to the field case and uses the hypotheses on the two localizations and their gluing stack in Kedlaya Hypothesis 2.1 and Theorem 2.7, pp. 4-6. It is not asserted for a general R-plus.

Construction or proof route:

1. Cover Y-ad by the rational subsets U = {|[x]| <= |p| != 0} = Spa(B_1) and V = {|p| <= |[x]| != 0} = Spa(B_2) with intersection Spa(B_12), where B_1 = A_1<[x]/p>, B_2 = A_2<p/[x]>, A_1 = A[1/p], A_2 = A[1/[x]], A_12 = A[1/p[x]] (Kedlaya Definition 3.5). These charts are supplied by RF0:integral-Y/whole-analytic-ainf-locus, rather than by the smaller curly-Y open.

2. Import the exact chart sheafiness/stable-uniformity input of RF0:integral-Y/whole-analytic-ainf-sheafiness: A_1,A_12,B_1,B_2,B_12,B_2-prime are stably uniform, whereas A_2 is only asserted uniform (Kedlaya Proposition 3.6). Use the completed coefficient-root extension and continuous module splitting of the R5 supplier. Do not infer stable uniformity of A_2 or treat an underlying-ring isomorphism involving a primed chart as a topological isomorphism.

3. On each sheafy chart, vector bundles are finite projective modules (Kedlaya Proposition 3.2(c); AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing), and the simple Laurent squares are glueing squares (Proposition 3.2(a,b); AdicSpacesPartII:R3/simple-laurent-glueing-square, AdicSpacesPartII:R3/glueing-square-finite-projective-descent).

4. Compare the Zariski cover {Spec A_1, Spec A_2} of X-sch with the adic cover through the exact-square gluing of RF4:vector-bundles/finite-projective-glueing-over-exact-square; in the resulting 2-commutative square every functor but Vec(X-sch) -> Vec(Y-ad) is an equivalence (proof of Kedlaya Theorem 3.8).

5. Field case: Kedlaya Theorem 2.7 (vector bundles on the punctured Spec of A_inf extend uniquely: the gluing stack uses A_inf[1/p] and W(K) over W(K)[1/p], where W(K) is the p-adic completion of A_inf[1/[x]]; Lemma 2.6 proves that its sections are finite free and Lemma 2.3(c) recovers the bundle) combined with Theorem 3.8; Scholze-Weinstein give the same proof (Lemmas 14.2.3, 14.3.1).

Acceptance checks:

- Field case: every vector bundle on Spa(A_inf) minus {x_k} is free, recovering the input of Breuil-Kisin-Fargues module theory

- Kedlaya Example 3.14: for R^+ the (y, z)-adic completion of the perfection of k[[y, z]] and x = yz, the kernel of (a, b, c) |-> a[y] + b[z] + cp is a bundle on Spec W(R^+) minus the closed point that does not extend

- Compatibility with the Beauville-Laszlo square used in the field case

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square`, `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`, `AdicSpacesPartII:R3/simple-laurent-glueing-square`, `AdicSpacesPartII:R3/glueing-square-finite-projective-descent`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `AdicSpacesPartII:R5/sousperfectoid-stably-uniform`, `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`, `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`, `PerfectoidSpaces:P1/witt-vectors-of-perfect-plus-ring`, `mathlib:WittVector`, `mathlib:Module.Projective`, `mathlib:Module.Free`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [Kedlaya-Ainf](https://arxiv.org/abs/1602.09016v5), Theorem 3.8, printed pp. 8-9 — The statement in the stated scope.; [Kedlaya-Ainf](https://arxiv.org/abs/1602.09016v5), Theorem 3.9, printed p. 9 — The field case.; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 14.2.1, printed p. 116 — The field case as used in Fargues' theorem.; [GR24-prismatic](https://arxiv.org/abs/2203.09490v3), Proof of Theorem 4.15, p. 43 — The use routed to this layer by the Guo-Reinecke extraction (item 129)..

## Tannakian transfer

Coverage: **planned**. Seven target-level nodes cover modifications, fixed-reference and arbitrary-input transfer, faithful testing, group/base change, overlapping composition, reductive local triviality and the lattice construction. Required supplier extensions and the approximation comparison are explicit requests/gaps. Quotient presentations and Hecke/Grassmannian geometry remain GS0-owned.

### Modifications of G-bundles at a relative Cartier divisor

Node `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`; definition.

Let X-cal be Y_S or X_S, D the divisor of a map S -> Div^d_(-) and P, P' G-bundles on X-cal. A modification between P and P' at D is an isomorphism beta : P|_{X-cal minus D} = P'|_{X-cal minus D} of exact tensor functors on X-cal minus D such that for every V in Rep_E G the induced isomorphism beta_V : P(V)|_{X-cal minus D} = P'(V)|_{X-cal minus D} is meromorphic along D, i.e. extends to a morphism P(V) -> P'(V)(kD) for k >> 0 (Fargues-Scholze III.3). Applying this to V^dual shows that each beta_V is a modification of vector bundles in the sense of RF4:vector-bundles/modification-of-vector-bundles. Modifications between G-bundles at D form a groupoid, and G-modifications of a fixed P' at D form a groupoid Mod^G_D(P').

Additional hypotheses and scope:

- G linear algebraic over E for X-cal = Y_S, X_S (on Y-curly_S with G over O_E the integral statements are formulated over the completed rings, see RF4:G-torsors/tannakian-transfer-of-gluing (ii))

- Meromorphy is required for EVERY representation; by RF4:G-torsors/faithful-representation-criterion it suffices to test one faithful representation and its dual

- beta is an isomorphism of tensor functors, so the beta_V are compatible with tensor products, duals and morphisms of representations

- The current BG0/g-torsors-three-descriptions node supplies the reductive E/sousperfectoid case and no longer imports RF4. The flat-linear scheme and smooth integral adic versions, and broader field representation contracts, are explicit BG0 requests rather than duplicate RF4 nodes.

Construction or proof route:

1. Fargues-Scholze define the notion in III.3 for D in Div^1; the definition is the same for D of any degree, the meromorphy being along the Cartier divisor D.

2. Scholze-Weinstein Remark 19.1.3: in the Tannakian language a trivialisation off S^sharp is meromorphic iff it is so for the vector bundles of all algebraic representations.

3. Composition, inverse and pullback are inherited representation by representation from the vector-bundle notion.

Uses:

- Fargues-Scholze III.3: Gr_G/phi^Z -> Div^1 is the moduli of D, E in Bun_G(X_S) and a modification between the trivial G-bundle and E at D, giving Gr_G -> Bun_G

- Fargues-Scholze Definition VI.1.6: the local Hecke stack parametrises pairs of G-bundles over B^+_{Div^d} with an isomorphism over B_{Div^d}, the completed form of a modification

- Caraiani-Scholze Corollary 3.5.2: the G-bundle E(x) of a point x of the B^+_dR-affine Grassmannian

- BunGAndNewtonStrata:BG2:uniformization: the Beauville-Laszlo morphism Gr_G -> Bun_G is surjective

- HeckeStacksAndLocalShtukas:HS0: both projections of the Hecke correspondence are G-bundles related by a modification at the legs

API:

- `GModification` (data): A modification between G-bundles P and P' at D: an isomorphism of exact tensor functors off D, meromorphic on every representation.

- `GModification.toModification` (projection): For V in Rep_E G, beta_V is a modification of P'(V) at D (RF4:vector-bundles/modification-of-vector-bundles), natural in V and compatible with tensor products and duals.

- `GModification.ofGL` (equivalence): For G = GL_n, G-modifications are the modifications of the rank-n vector bundles P(std).

- `GModification.refl` (constructor): The identity of P is a modification between P and P.

- `GModification.symm` (constructor): The inverse of a modification is a modification.

- `GModification.trans` (constructor): The composite of modifications at D is a modification at D.

- `GModification.pushforward` (functoriality): For rho : G -> H, rho_* beta (precomposition with Res : Rep H -> Rep G) is a modification between rho_* P and rho_* P'.

- `GModification.pullback` (functoriality): Pullback along T -> S of affinoid perfectoid spaces, with map_id and map_comp.

- `GModification.ext` (extensionality): Two modifications between P and P' are equal iff they agree on one faithful representation (equivalently off D on all representations).

Mathematical unit tests:

- `GModification.gl_eq_modification` (compatibility): For G = GL_n, the map beta |-> beta_std is a bijection from modifications between P and P' at D to modifications of the vector bundles P(std), P'(std) at D.

- `GModification.gm_geometric_point` (computation): For G = G_m, S = Spa(C^flat) and D = infinity, the modifications of the trivial G_m-bundle at D are the line bundles O(-k), k in Z, with the lattice xi^k B^+_dR (xi a uniformiser of B^+_dR).

- `GModification.identity_degenerate` (degenerate): For d = 0 (D empty) a modification between P and P' is an isomorphism of G-bundles P = P'.

- `GModification.not_iso_extension` (non-example): Meromorphy is not extension to an isomorphism over D: for G = G_m the inclusion O(-D) -> O is a modification between O(-D) and O at D, although it does not extend to an isomorphism of G_m-bundles on X-cal.

Acceptance checks:

- For G = GL_n with the standard representation the notion is RF4:vector-bundles/modification-of-vector-bundles

- For G = G_m and S a geometric point, the modifications of the trivial bundle at infinity are the O(-k), k in Z

- Meromorphy is preserved under pushforward along homomorphisms G -> H

Direct prerequisites: `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles`, `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, `tauceti:TauCeti.AffineGroupSchemeCat`, `mathlib:CategoryTheory.Functor.Monoidal`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG0/structure-group-and-tensor-descent`.

Prototype boundary: Native cores express only the listed algebraic specializations. The mathematical specifications in comments are not native declarations or compiled tests of these objects.

Missing native interfaces `GModification`, `GModification.toModification`, `GModification.ofGL`, `GModification.refl`, `GModification.symm`, `GModification.trans`, `GModification.pushforward`, `GModification.pullback`, `GModification.ext`, `GModification.gl_eq_modification`, `GModification.gm_geometric_point`, `GModification.identity_degenerate`, `GModification.not_iso_extension`: The pinned affine group-scheme and faithful-comodule carriers exist, but exact tensor functors into bundles on these adic curves, geometric torsors on them and their punctured-completion restriction do not. An arbitrary predicate would not encode this interface.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.3, printed p. 97 — The definition with the hypotheses and conventions stated here.; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Remark 19.1.3, printed p. 170 — Meromorphy is tested on all representations.; [HK-admissible](https://arxiv.org/abs/2308.11064v2), Section 4.3, p. 29 — The relative Tannakian notion over a perfectoid base..

### Beauville-Laszlo gluing for G-bundles (Tannakian transfer)

Node `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`; theorem.

(i) Let G be a linear algebraic group over E, X-cal = Y_S or X_S, D the affinoid divisor of S -> Div^d_(-), and P' a G-bundle on X-cal with completion P'-hat_D (the exact tensor functor V |-> P'(V)-hat_D to finite projective B^+_D(S)-modules). Then P |-> P-hat_D gives an equivalence between the groupoid of pairs (P, beta), beta a modification between P and P' at D (RF4:G-torsors/meromorphic-G-modification), and the groupoid of pairs (Q, alpha) with Q a G-torsor on Spec B^+_D(S) and alpha : Q|_{Spec B_D(S)} = P'-hat_D|_{Spec B_D(S)}. In particular every such (Q, alpha) is effective. For d = 1, S over Spd E with untilt S^sharp and P' trivial: G-torsors on Spec B^+_dR(R^sharp) with a trivialisation over B_dR(R^sharp) correspond to G-bundles on X_S with a modification of the trivial G-bundle at S^sharp (Fargues-Scholze III.3, Scholze-Weinstein Proposition 19.1.2). (ii) For G smooth affine over O_E and X-cal = Y-curly_S (or an open subset of S x Spa O_E as in Scholze-Weinstein 19.1.2) the same holds, with the O_E-integral Tannakian description of torsors. (iii) Conditional on arbitrary-complement-formal-patching and the requested BG0 dictionaries, an arbitrary G-bundle on the complement, a formal G-torsor and a compatible punctured-formal identification glue uniquely up to isomorphism to a G-bundle on X-cal. Apply the linear equivalence to each representation; this is distinct from the proved fixed-reference case (i).

Additional hypotheses and scope:

- The tensor functors are exact; exactness of the glued functor is what the exactness half of RF4:vector-bundles/gluing-exactness-tensor-and-base-change provides

- Torsors on the affine schemes Spec B^+_D(S), Spec B_D(S) are taken in the Tannakian sense, via the scheme-theoretic three-descriptions theorem (Scholze-Weinstein 19.5.1, Broshi), requested from BG0

- D affinoid, which holds locally on S; the statement globalises by the base-change compatibility

- Clause (ii) consumes the O_E-coefficient extension of the integral BG0 comparison; FS III.1.1, p. 88, records the extension of the Z_p references to O_E.

- The current BG0/g-torsors-three-descriptions node supplies the reductive E/sousperfectoid case and no longer imports RF4. The flat-linear scheme and smooth integral adic versions, and broader field representation contracts, are explicit BG0 requests rather than duplicate RF4 nodes.

Construction or proof route:

1. For each V in Rep_E G apply RF4:vector-bundles/meromorphic-modification-at-a-divisor to E' = P'(V) and the lattice Q(V) in P'(V)-hat_D[1/I_D] given by alpha: this gives a vector bundle P(V) with a modification beta_V.

2. Functoriality in V and compatibility with tensor products, duals and exact sequences (RF4:vector-bundles/gluing-exactness-tensor-and-base-change) make V |-> P(V) an exact tensor functor, i.e. a G-bundle (BunGAndNewtonStrata:BG0/g-torsors-three-descriptions), and beta a modification between G-bundles.

3. Full faithfulness from full faithfulness of the linear gluing representation by representation.

4. SW Proposition 19.1.2, p. 170, and CS Corollary 3.5.2, p. 33, transfer linear gluing by reconstructing the exact tensor functor on representations. The GL_n case is the vector-bundle equivalence; the group case uses the imported torsor dictionary.

5. For arbitrary-input clause (iii), import the full linear target with its exact analytic/formal comparison prerequisite. Glue representationwise; exact-tensor compatibility of the linear functor reconstructs the torsor through BG0. This cannot be inferred merely by applying the fixed-reference lattice theorem to a complement bundle which has no given global extension.

Acceptance checks:

- For G = GL_n recover RF4:vector-bundles/meromorphic-modification-at-a-divisor

- For P' trivial and d = 1, (Q, alpha) is a point of LG/L^+G before sheafification; its image is the Beauville-Laszlo map on S-points

- The construction is independent of the faithful representation used to bound the modification (RF4:G-torsors/faithful-representation-criterion)

Direct prerequisites: `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`, `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`, `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`, `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, `BunGAndNewtonStrata:BG0`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `tauceti:TauCeti.AffineGroupSchemeCat`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.Equivalence`, `RelativeFarguesFontaine:RF4:vector-bundles/arbitrary-complement-formal-patching`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proposition 19.1.2, printed p. 170 — The torsor-modification description of the B^+_dR-affine Grassmannian.; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.3, printed pp. 97-98 — The relative identification over Spd E.; [CS17-generic](https://arxiv.org/abs/1511.02418v1), Corollary 3.5.2 and proof, printed p. 33 — The Tannakian transfer of the linear gluing..

### Meromorphy can be tested on one faithful representation

Node `RelativeFarguesFontaine:RF4:G-torsors/faithful-representation-criterion`; theorem.

Let G be a linear algebraic group over E and V in Rep_E G faithful. (a) An isomorphism beta : P|_{X-cal minus D} = P'|_{X-cal minus D} of G-bundles is a modification at D iff beta_V is a modification of the vector bundles P(V), P'(V) at D (both beta_V and beta_V^(-1) meromorphic). (b) Consequently the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing and its bounds may be computed with any faithful representation: if beta_V is bounded by k then for every tensor construction W = V^(x a) (x) (V^dual)^(x b) and every subquotient of a direct sum of copies of that tensor word, beta_W is bounded by (a + b) k. For a finite sum of tensor words of differing bidegrees (a_i,b_i), the bound is max_i(a_i + b_i) k.

Additional hypotheses and scope:

- V faithful: G -> GL(V) a closed immersion (Tau Ceti's TauCeti.Comodule.IsFaithful); a non-faithful V does not suffice

- Both directions of meromorphy are needed for V; equivalently one direction for V and for V^dual

- The subquotient step uses that P and P' are EXACT tensor functors, so subrepresentations go to local direct summands

- The current BG0/g-torsors-three-descriptions node supplies the reductive E/sousperfectoid case and no longer imports RF4. The flat-linear scheme and smooth integral adic versions, and broader field representation contracts, are explicit BG0 requests rather than duplicate RF4 nodes.

Construction or proof route:

1. Deligne-Milne Proposition 2.20(b): for G algebraic with faithful V, V (+) V^dual is a tensor generator of Rep_E G, i.e. every W is a subquotient of P(V, V^dual) for a polynomial P with natural coefficients. The general faithful-representation independence is BG0's ('faithful-representation independence'); this node adds the meromorphy statement.

2. Meromorphy with bound k is preserved by tensor products (bounds add), duals, and direct sums (RF4:vector-bundles/modification-of-vector-bundles API).

3. Subobjects: if W in W' then P(W) in P(W') and P'(W) in P'(W') are local direct summands; the extension P(W') -> P'(W')(kD) maps P(W) into P'(W)(kD) because it does so off D and P'(W)(kD) is saturated in P'(W')(kD) (sections are determined off D since I_D is invertible). Quotients similarly.

4. Hence meromorphy on V and V^dual gives meromorphy on every W, which is the definition of a G-modification (Fargues-Scholze III.3).

Acceptance checks:

- For G = GL_n and V the standard representation, (a) is the definition

- For a torus T with faithful character lattice generators, meromorphy on finitely many characters suffices

- A non-faithful V (e.g. the trivial representation) does not detect meromorphy

Direct prerequisites: `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`, `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles`, `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`, `BunGAndNewtonStrata:BG0`, `tauceti:TauCeti.Comodule.IsFaithful`, `tauceti:TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom`, `BunGAndNewtonStrata:BG0/structure-group-and-tensor-descent`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [DM82-tannakian](https://www.jmilne.org/math/xnotes/tc2018.pdf), Proposition 2.20(b) and its proof, printed pp. 25-26 — The tensor-generator property of a faithful representation.; [DM82-tannakian](https://www.jmilne.org/math/xnotes/tc2018.pdf), Footnote 11 to Proposition 2.20, printed pp. 25-26 — What 'tensor generator' means.; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.3, printed p. 97 — The definition reduced here to one faithful representation..

### Gluing commutes with change of structure group

Node `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`; theorem.

Let rho : G -> H be a homomorphism of linear algebraic groups over E (resp. of smooth affine group schemes over O_E). (a) Pushforward rho_* (precomposition with the restriction functor Res_rho : Rep H -> Rep G) carries G-modifications at D to H-modifications at D, and commutes with the gluing of RF4:G-torsors/tannakian-transfer-of-gluing: rho_*(glue(Q, alpha)) = glue(rho_* Q, rho_* alpha), compatibly with composition (rho' rho)_* = rho'_* rho_*. (b) Over E, if rho is a closed immersion, an isomorphism of G-bundles off D is meromorphic along D iff its pushforward to H is.

Additional hypotheses and scope:

- (a) needs no hypothesis on rho; (b) needs rho a closed immersion (equivalently every G-representation is a subquotient of restrictions of H-representations)

- Extension of structure group of torsors itself is BG0's; this node is its compatibility with gluing and meromorphy

- Part (b) is over the field E. Deligne-Milne 2.21(b) does not justify the same claim over O_E; the integral extension requires a separate representation theorem and is not asserted here.

- The current BG0/g-torsors-three-descriptions node supplies the reductive E/sousperfectoid case and no longer imports RF4. The flat-linear scheme and smooth integral adic versions, and broader field representation contracts, are explicit BG0 requests rather than duplicate RF4 nodes.

Construction or proof route:

1. (a) For W in Rep H, (rho_* P)(W) = P(Res W); the gluing of RF4:G-torsors/tannakian-transfer-of-gluing is computed representation by representation, so it commutes with precomposition by Res.

2. (b) Deligne-Milne Proposition 2.21(b): rho is a closed immersion iff every object of Rep G is a subquotient of an object Res(W'); meromorphy passes to subquotients as in RF4:G-torsors/faithful-representation-criterion. Equivalently, the restriction of a faithful H-representation is a faithful G-representation.

3. For reductive groups this is the linear-algebra input to Scholze-Weinstein Lemma 19.1.5 (Gr_G -> Gr_H is a closed embedding for a closed embedding G -> H), whose Grassmannian statement is GeometricSatakeAndFusion's.

Acceptance checks:

- G = GL_n -> GL_n x GL_m, g |-> (g, det g): the pushforward of a modification of rank-n bundles is the pair (modification, its determinant)

- For a closed immersion rho the restriction of a faithful H-representation is a faithful G-representation, so (b) also follows from RF4:G-torsors/faithful-representation-criterion

Direct prerequisites: `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`, `RelativeFarguesFontaine:RF4:G-torsors/faithful-representation-criterion`, `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`, `BunGAndNewtonStrata:BG0`, `tauceti:TauCeti.Comodule.IsFaithful`, `BunGAndNewtonStrata:BG0/structure-group-and-tensor-descent`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [DM82-tannakian](https://www.jmilne.org/math/xnotes/tc2018.pdf), Proposition 2.21(b), printed pp. 25-26 — The criterion used for (b).; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Lemma 19.1.5, printed p. 171 — The Grassmannian consumer of the change-of-group compatibility..

### G-gluing commutes with base change and with addition of legs

Node `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility`; theorem.

(a) For a map f : T -> S of affinoid perfectoid spaces over F_q and D the divisor of S -> Div^d_(-), the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing commutes with pullback: f^* glue(Q, alpha) = glue(Q (x)_{B^+_D(S)} B^+_{D_T}(T), alpha_T), compatibly with composition of base changes. (b) For D = D_1 + D_2 with D_1, D_2 disjoint, G-torsors on Spec B^+_D(S) with an isomorphism over B_D(S) are pairs of such data at D_1 and D_2, and the gluing at D is the iterated gluing at D_1 and D_2; for colliding legs D = m D_1 the data at D and at D_1 coincide. (c) For arbitrary D_1, D_2, a chain of modifications at D_1 then D_2 has a composite meromorphic at D_1 + D_2: representationwise the local equations multiply, and the two finite pole bounds give a bound at the sum. This construction commutes with base change. An equivalence with pairs of independent lattice data is asserted only on the disjoint locus; on a collision locus the chain retains extra intermediate data.

Additional hypotheses and scope:

- Base change uses that B^+_{Div^d} and B_{Div^d} are v-sheaves over Div^d (RF2:integral-divisors/completed-rings-B-plus-and-B)

- Disjointness is of the closed subspaces D_1, D_2; the product decomposition of the completed rings is RF4:vector-bundles/disjoint-and-colliding-legs

Construction or proof route:

1. (a) Apply RF4:vector-bundles/gluing-exactness-tensor-and-base-change (c) representation by representation.

2. (b) A G-torsor on Spec(B_1 x B_2) is a pair of torsors; combine with RF4:vector-bundles/disjoint-and-colliding-legs (a), (b) representation by representation.

3. (c) Work representationwise on charts with local equations xi_1, xi_2. If the bounds are k,l, the composite and its inverse have poles at most kD_1+lD_2, hence at most max(k,l)(D_1+D_2). The product equation and pullback of divisors are RF2:integral-divisors/product-equation-and-affineness. Disjoint product decomposition and diagonal cofinality do not prove a factorisation for partially overlapping divisors.

Acceptance checks:

- Pullback to geometric points recovers the fibrewise Beauville-Laszlo modifications of Fargues-Scholze III.3

- On the diagonal of Div^1 x Div^1 the two legs collide and the datum is a single modification at the common leg

Direct prerequisites: `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`, `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`, `RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1, before Definition VI.1.5, printed p. 192 — Base change in S.; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition VI.1.6, printed p. 193 — Data over degree-d divisors with possibly colliding legs..

### v-descent of G-torsors and etale-local triviality over the completed divisor rings

Node `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`; theorem.

(a) For S in Perf over F_q, U an open subset of S x Spa O_E (for example of Y-curly_S) and G smooth affine over O_E, the functor S' |-> {G-torsors on U x_{S x Spa O_E} (S' x Spa O_E)} is a v-stack on Perf_S (Scholze-Weinstein Proposition 19.5.3; Fargues-Scholze's footnote extends it from Z_p to O_E). (b) For S -> Div^d_(-) with D_S affinoid, vector bundles and G-bundles over B^+_{Div^d}(S) (G reductive over O_E, resp. over E) satisfy v-descent in S, and so do isomorphisms between two of them over B_{Div^d}(S). (c) Every G-bundle over B^+_{Div^d_{Y-curly}}(S), G reductive over O_E, is trivial etale-locally on S. The quotient presentations Hck = L^+G \ LG / L^+G and Gr = LG / L^+G that Fargues-Scholze deduce from (b) and (c) are GeometricSatakeAndFusion:GS0:loop-geometry's and are not planned here.

Additional hypotheses and scope:

- G smooth affine for (a); G reductive for (b) and (c), as in Fargues-Scholze VI.1.6-1.7

- (a) uses sousperfectoidness: U x_{Spa Z_p} Spa Z_p[p^(1/p^oo)]^ is perfectoid and U -> it splits as topological modules

- (c) is etale-local on S, not merely v-local; the presentation of Hck is one of ETALE stacks

- The affineness of the target scheme is what makes loop spaces v-sheaves (FS before Definition VI.1.6)

- The current BG0/g-torsors-three-descriptions node supplies the reductive E/sousperfectoid case and no longer imports RF4. The flat-linear scheme and smooth integral adic versions, and broader field representation contracts, are explicit BG0 requests rather than duplicate RF4 nodes.

Construction or proof route:

1. (a) Scholze-Weinstein, proof of 19.5.3: by the Tannakian description reduce to GL_n; base change to the perfectoid U' = U x_{Spa Z_p} Spa Z_p[p^(1/p^oo)]^; vector bundles on perfectoid spaces satisfy v-descent (SW Proposition 17.1.8, requested from DiamondsAndVStacks D2); descend back along A -> A' split as topological A-modules (finite projectivity descends, Stacks 08XD).

2. (b) Fargues-Scholze, proof of VI.1.7: vector bundles over B^+_{Div^d} satisfy v-descent, checked modulo powers of I_S where it is Proposition VI.1.4 (RF2:integral-divisors/v-descent-of-bundles-on-the-divisor); by the Tannakian formalism so do G-bundles; an isomorphism over B_{Div^d}(S) is a section of an affine scheme, which again satisfies v-descent.

3. For (c), first reduce the given torsor Q modulo I_D to a smooth affine finite-presentation torsor Q0 over A_T=B_D-plus(T)/I_D. Over a geometric point, B_D-plus is a finite product of complete discrete valuation rings with algebraically closed residue field; the reductive torsor has a section. Reduction modulo I_D, including the nonreduced Artinian thickening at colliding legs, retains a section by smooth lifting. The assertion here is the reductive case of FS VI.1.7, p. 193; no smooth nonreductive extension is inferred.

4. Fix a geometric point s and take the filtered system of pointed affinoid etale neighbourhoods T of s. Choose compatible closed rings of definition R_T in the Tate rings A_T=B_D-plus(T)/I_D, with a common topologically nilpotent unit t coming from [varpi] (use a fixed power if necessary). Set R=colim_T R_T and I=R, so R[1/t]=colim_T A_T and R-hat=lim_n R/t^n R. Multiplication by t is injective on R because t is a unit on each A_T. Each R_T is t-adically complete, hence (R_T,tR_T) henselian; filtered colimits preserve the henselian pair condition, giving (R,tI)=(R,tR) henselian. The compatibility of this construction and the identification R-hat[1/t] with the reduced-divisor ring over the completed geometric stalk are the exact RF2:integral-divisors request below, not consequences of henselianity alone.

5. Base change Q0 to X=Q0 tensor_{A_T} R[1/t]. It is smooth affine of finite presentation over R[1/t], hence quasi-projective. The geometric-fiber section gives an R-hat[1/t]-point through the requested completed-stalk comparison. GR arXiv v3 Proposition 5.4.21 and its affine Claim 5.4.22, pp. 121-122, imply that X(R[1/t]) is nonempty: the dense image in the nonempty completed point space contains a point. This specializes GR with explicit R,t,I; it does not cite unchecked Springer numbering.

6. Because Q0 is finitely presented, a section over colim_T A_T descends to one pointed affinoid etale neighbourhood T. The section solves the finite defining equations there; thus approximation yields an etale neighbourhood on S, rather than only a v-cover. Lift this section to Q over the I_D-adically complete ring B_D-plus(T) by formal smoothness, using the pinned Mathlib lifting lemma. This proves etale-local triviality once the stated stalk comparison has been supplied. For degree one SW19.1.2, p. 170, instead uses the untilt and successive nilpotent lifting.

Acceptance checks:

- The presentation obtained by trivialising etale-locally is one of etale stacks, not merely v-stacks

- At a geometric point check triviality directly from the product-of-complete-DVRs description

- Without affineness of Z, L^+Z and LZ need not be v-sheaves; the Tannakian reduction to GL_n is where affineness enters

- Instantiate GR with I=R, t regular, R[1/t]=the etale neighbourhood colimit and the requested completed-stalk ring; descend an actual section by finite presentation. Distinguish I in GR from the divisor ideal I_D.

Direct prerequisites: `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, `BunGAndNewtonStrata:BG0`, `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D2/higher-v-acyclicity`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `AdicSpacesPartII:R5/sousperfectoid-adic-space`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `mathlib:Algebra.Smooth`, `mathlib:HenselianRing`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsAdicComplete`, `mathlib:Module.Projective`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `RelativeFarguesFontaine:RF2:integral-divisors`, `DiamondsAndVStacks:D2`.

Prototype boundary: No full geometric signature: the relative curve/divisor/bundle or Frobenius-shtuka categories occurring in this statement are not available at the pinned baseline; algebraic cores above do not supply those carriers.

Available-carrier signatures: `henselian_approximation_affine_section`, `formally-smooth section lifting baseline example`.

Sources: [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proposition 19.5.3 and proof, printed pp. 180-181 — Part (a).; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of Proposition VI.1.7, printed p. 193 — Part (b).; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of Proposition VI.1.7, printed p. 193 — Part (c), geometric points.; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of Proposition VI.1.7, printed p. 193 — Part (c), the general step and its citation.; [GR02-almost](https://arxiv.org/abs/math/0201175v3), Proposition 5.4.21 and Claim 5.4.22, arXiv v3, printed pp. 121-122 — The henselian approximation statement; in the arXiv numbering it is the tool FS's citation needs.; [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proof of Proposition 19.1.2, printed p. 170 — The degree-one argument..

### The modification of a G-bundle by a B^+_dR-lattice

Node `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`; construction.

Let S be a perfectoid space over Spd E (untilt S^sharp over E, D = S^sharp the degree-one divisor of X_S), G a linear algebraic group over E, P a G-bundle on X_S and L a G(B^+_dR)-lattice on the G(B_dR)-torsor P|_{B_dR}: a G-torsor Q on Spec B^+_dR(R^sharp), given etale-locally on S, with alpha : Q|_{B_dR} = P-hat_D|_{B_dR}. The modification P_L of P by L is the G-bundle on X_S glued from (P, Q, alpha) by RF4:G-torsors/tannakian-transfer-of-gluing, with its canonical modification P_L|_{X_S minus D} = P|_{X_S minus D}. It is functorial in (P, L), compatible with pullback in S and with pushforward along homomorphisms of groups. For P trivial it is the map E from G-torsors on Spec B^+_dR trivialised over B_dR to G-bundles on X_S of Caraiani-Scholze Corollary 3.5.2 and Fargues-Scholze III.3; identifying its source with Gr_G(S) is GeometricSatakeAndFusion:GS0:loop-geometry's, and the resulting Beauville-Laszlo morphism Gr_G -> Bun_G is exported to BG2:uniformization, HS0 and HS2.

Additional hypotheses and scope:

- The lattice is a G(B^+_dR)-lattice, i.e. a G-torsor over B^+_dR, not merely a B^+_dR-lattice in one representation

- L is given etale-locally on S; the construction descends by RF4:G-torsors/v-descent-and-local-triviality

- Degree one here; several or colliding legs are RF4:G-torsors/base-change-and-divisor-compatibility

- The current BG0/g-torsors-three-descriptions node supplies the reductive E/sousperfectoid case and no longer imports RF4. The flat-linear scheme and smooth integral adic versions, and broader field representation contracts, are explicit BG0 requests rather than duplicate RF4 nodes.

Construction or proof route:

1. Howe-Klevdal 4.3: completion along I_infinity is an exact tensor functor Vect(FF_S) -> Loc_{B^+_dR}(S); a lattice L on E|_{B_dR} defines E_L by the Tannakian formalism and Beauville-Laszlo gluing.

2. Glue with RF4:G-torsors/tannakian-transfer-of-gluing etale-locally on S where L is a torsor with alpha, and descend by RF4:G-torsors/v-descent-and-local-triviality (a).

3. Functoriality, base change and pushforward from RF4:G-torsors/base-change-and-divisor-compatibility and RF4:G-torsors/change-of-structure-group.

Uses:

- Fargues-Scholze Proposition III.3.1: the Beauville-Laszlo morphism Gr_G -> Bun_G is a surjection of pro-etale stacks (BunGAndNewtonStrata:BG2:uniformization)

- Caraiani-Scholze Corollary 3.5.2 and Proposition 3.5.3: the map b(.) : Gr_G(C, O_C) -> B(G), x |-> b(E(x)), and its compatibility with mu

- Howe-Klevdal, Section 4.3: modifications E_L interpolating the modifications at geometric points

- HeckeStacksAndLocalShtukas:HS2: local shtuka moduli parametrise modifications of G-bundles at the legs

- GeometricSatakeAndFusion:GS0:loop-geometry: the torsor-modification description of the Beilinson-Drinfeld Grassmannian is compared with the loop quotient

API:

- `modify` (constructor): The G-bundle P_L on X_S attached to a G-bundle P and a G(B^+_dR)-lattice L on P|_{B_dR}.

- `modify.modification` (projection): The canonical modification P_L|_{X_S minus D} = P|_{X_S minus D}, meromorphic along D.

- `modify_tautological` (simp): For the tautological lattice L = P-hat_D, P_L = P with the identity modification.

- `modify_comp` (relation): For L a lattice on P|_{B_dR} and L' a lattice on P_L|_{B_dR} = P|_{B_dR}, (P_L)_{L'} = P_{L'}.

- `modify.pullback` (functoriality): For T -> S, (P_L)_T = (P_T)_{L_T}; compatible with composition.

- `modify.pushforward` (functoriality): For rho : G -> H, rho_*(P_L) = (rho_* P)_{rho_* L}.

- `modify_gl` (compatibility): For G = GL_n, P_L is the bundle glued by RF4:vector-bundles/meromorphic-modification-at-a-divisor from P(std) and the lattice L(std).

- `modify.characterisation` (characterisation): P_L is the unique G-bundle with a modification to P at D whose completion at D is L (RF4:G-torsors/tannakian-transfer-of-gluing).

Mathematical unit tests:

- `modify_gl_compat` (compatibility): For G = GL_n and P trivial, P_L is the rank-n vector bundle obtained by gluing the B^+_dR-lattice L in B_dR^n to the trivial bundle off D, as in Caraiani-Scholze 3.5.1.

- `modify_gm_degree` (computation): For G = G_m, S = Spa(C^flat), P trivial and L = xi^k B^+_dR, P_L = O(-k), of degree -k.

- `modify_tautological_eq` (degenerate): For the tautological lattice L = P-hat_D the modification P_L is P, with the identity modification.

- `modify_SL2_nonlattice` (non-example): For G = SL_2 and P trivial, the B^+_dR-lattice xi B^+_dR (+) B^+_dR of B_dR^2 has determinant lattice xi B^+_dR, so it is not an SL_2(B^+_dR)-lattice of the trivial SL_2-torsor and does not define an SL_2-modification, although it defines a GL_2-modification.

Acceptance checks:

- For G = GL_n the construction is RF4:vector-bundles/meromorphic-modification-at-a-divisor

- Sign convention: for G = G_m and the lattice xi^k B^+_dR the modified bundle is O(-k), as fixed by O(infinity) = O(1)

- Modifying first by L and then by L' (a lattice in P_L|_{B_dR} = P|_{B_dR}) is modifying by L'

Direct prerequisites: `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`, `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`, `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility`, `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`, `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`.

Prototype boundary: Native cores express only the listed algebraic specializations. The mathematical specifications in comments are not native declarations or compiled tests of these objects.

Missing native interfaces `modify`, `modify.modification`, `modify_tautological`, `modify_comp`, `modify.pullback`, `modify.pushforward`, `modify_gl`, `modify.characterisation`, `modify_gl_compat`, `modify_gm_degree`, `modify_tautological_eq`, `modify_SL2_nonlattice`: The geometric G-bundle and relative B_D torsor groupoids and the representationwise gluing functor from BG0/RF4 are unavailable. AffineGroupSchemeCat alone is not their carrier.

Sources: [HK-admissible](https://arxiv.org/abs/2308.11064v2), Section 4.3, p. 29 — Representationwise lattice modification with descent of the resulting tensor functor.; [CS17-generic](https://arxiv.org/abs/1511.02418v1), Corollary 3.5.2, printed p. 33 — The trivial-P case.; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.3, printed p. 98 — The Beauville-Laszlo morphism, owned on the Grassmannian side by GS0..

## Suppliers and closure boundaries

### `BunGAndNewtonStrata:BG0`

Supply (1) the scheme torsor dictionary for a flat affine linear group over O_E or E: geometric/fppf torsors on Spec(B) equivalent to exact tensor functors from finite-free representations to finite projective B-modules, with the etale description when the group is smooth (SW19.5.1, pp. 178-179, Z_p version and its stated coefficient extension); (2) the smooth O_E-integral adic dictionary on analytic sousperfectoid spaces, including curly-Y and opens in S dotted-product Spa(O_E), with restriction and base-change compatibility (SW19.5.2, pp. 179-180; FS III.1.1 coefficient extension); (3) for linear algebraic groups over the field E, V plus V-dual a tensor generator when V is faithful (DM2.20(b), footnote11, p.25), and the restriction/subquotient closed-immersion criterion (DM2.21(b), pp.25-26), natural under change of group. These are field statements, with no integral inference. The current exact BG0/g-torsors-three-descriptions and structure-group-and-tensor-descent nodes cover reductive E cases and have no reverse RF4 prerequisites; retain that acyclic ownership.

Consumed by: `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`, `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`, `RelativeFarguesFontaine:RF4:G-torsors/faithful-representation-criterion`, `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`, `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`, `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`.

### `DiamondsAndVStacks:D2`

Vector bundles form a v-stack on perfectoid spaces, with descent of maps and finite-locally-free effectivity (SW17.1.8). Supply the bundle statement in addition to the existing functions and higher-v-acyclicity nodes; it is used after the coefficient-root perfectoid base change in SW19.5.3, pp.180-181.

Consumed by: `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`.

### `AdicSpacesPartII:R3`

Supply the local analytic/complement-to-formal comparison for compatible gluing data: for a sheafy curve chart U=Spa(A,A-plus) and a regular Cartier equation xi, precisely define the compatible-data category using an arbitrary bundle on U minus V(xi), a finite projective A-hat-module and a punctured-formal identification. Construct the A[1/xi]-module model of such compatible data, recover the prescribed analytic bundle from it, and identify compatible morphisms, naturally under chart restriction, refinement, scalar change, tensor products and exact sequences. Do not assert U minus V(xi)=Spec(A[1/xi]), or that all analytic punctured morphisms have bounded poles. State the bounded/algebraizable hypotheses if needed and determine whether those change the full stage target; give a public proof or a counterexample. R3 already owns affinoid finite-projective comparison and bundle gluing; this is an extension of that comparison, not a second owner of Beauville-Laszlo patching.

Consumed by: `RelativeFarguesFontaine:RF4:vector-bundles/arbitrary-complement-formal-patching`, `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`, `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`.

### `VectorBundlesAndIsocrystals:VB4`

Extend the exact integral-frobenius-local-systems contract by SW12.3.5 (p.104): for C algebraically closed complete over Q_p, localization at the crystalline point is an equivalence from no-leg shtukas on Y[0,infinity) to integral Robba phi-modules. Supply SW12.4.1 (p.105): a one-leg shtuka at phi^(-1)(x_C) has its unique normalized phi^(-1)-equivariant meromorphic comparison to the associated no-leg model away from the forward orbit of x_C, with identity at the crystalline point, and its completed comparison determines the one-leg lattice and recovers the shtuka. Build from the existing SW12.3.4 integral model node, independently of RF4 and of downstream HS2, and keep scalar extension and morphisms explicit.

Consumed by: `RelativeFarguesFontaine:RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles`.

### `RelativeFarguesFontaine:RF2:integral-divisors`

For an affinoid divisor D and a geometric point s of S, put A_T=B_D-plus(T)/I_D on pointed affinoid etale neighbourhoods T. Supply compatible t-adically complete closed rings of definition R_T with common regular topologically nilpotent unit t=image[ varpi ] (or a fixed power), R=colim R_T and R[1/t]=colim A_T. Identify (lim_n R/t^n R)[1/t] with A_{s}=B_D-plus(S_s)/I_D over the completed geometric stalk S_s, in a form carrying sections of smooth affine finitely presented schemes. Check colliding/nonreduced divisors and the map from the fibre point; if a different integral model or ideal I is required, state and prove it with regular t and henselian (R,tI). This precise completed-stalk comparison is needed to specialize GR5.4.21; it is not provided by the present completed-rings-B-plus-and-B node.

Consumed by: `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`.

There are six recorded gaps. Each remains an explicit prerequisite boundary, with no implementation claim:

- **General-E arbitrary complement/formal comparison**: The full arbitrary-input target now has its own node and an exact AdicSpacesPartII:R3 prerequisite/request. KL8.9.6 covers the unramified schematic case; fixed-reference chart gluing covers node meromorphic-modification-at-a-divisor. Neither proves the required analytic/formal comparison for arbitrary compatible input. Resolve its puncture, algebraization and morphism hypotheses, or exhibit the necessary scope correction. The target is planned conditionally, not established.

- **BG0 scheme and integral torsor dictionaries**: The former reverse RF4 dependency is absent from the current BG0 packet and is resolved. Remaining needs are the flat-linear scheme dictionary, the smooth O_E-integral adic dictionary and full field tensor-generator/restriction contracts specified in the BG0 request. RF4 transfers these dictionaries and does not recreate them.

- **No-leg and one-leg recovery extension in VB4**: The exact existing VB4/integral-frobenius-local-systems node supplies SW12.3.4. The direct supplier request to the same foundation owner covers SW12.3.5 and12.4.1 with normalized tail recovery and morphisms. Its Robba/Frobenius input chain avoids RF4; HS2 remains a downstream consumer.

- **Completed etale stalk comparison for divisor approximation**: The proof now specifies R=colim R_T, t=image[varpi], I=R, regularity, henselianity, the smooth affine torsor X, GR nonemptiness and finite-presentation descent to an etale neighbourhood. The RF2 request must prove the completed-stalk comparison and compatible integral models, including collisions. GR is cited only at the read arXiv v3 pp.121-122. The reductive local-triviality scope is retained.

- **Vector-bundle v-descent supplier**: D2 has functions and higher-v-acyclicity nodes, but the exact bundle effectivity statement used in SW19.5.3 is still a requested D2 contract. The statement is not inferred from function descent alone.

- **Unavailable native geometric carriers**: The algebra API and concrete available-carrier tests are now native signatures. The prototypeInventory on each node records each remaining omission against the exact missing carrier, including the geometric curves/divisor completion, their finite-locally-free categories, relative period-ring comparison, or geometric torsor category. Comment specifications are not counted as Lean APIs or compiled examples. The smooth-germ counterexample additionally lacks its C-infinity germ-ring carrier.

### Coverage of `RelativeFarguesFontaine:RF4:vector-bundles`

**planned**. Sixteen target-level nodes now include the full arbitrary-input target with an exact supplier request and gap, alongside the proved fixed-reference case. All linear stage targets have nodes and prerequisite chains ending at baseline, external nodes or the recorded comparison/recovery gaps. The unramified schematic B-pair and p-typical algebraicity scopes are explicit; no ramified or equal-characteristic algebraicity extension is asserted.

- Discharge the exact R3 comparison of arbitrary complement/formal data, including its precise puncture and any needed bounded/algebraizable hypotheses.

- Supply the VB4 no-leg and normalized one-leg tail-recovery extensions; SW12.3.4 is already an exact import.

- Refine the native geometric prototypes once RF0-RF2 and the locally-free sheaf carriers are available; keep RF0 root/chart proof gaps at their owner.

### Coverage of `RelativeFarguesFontaine:RF4:G-torsors`

**planned**. Seven target-level nodes cover modifications, fixed-reference and arbitrary-input transfer, faithful testing, group/base change, overlapping composition, reductive local triviality and the lattice construction. Required supplier extensions and the approximation comparison are explicit requests/gaps. Quotient presentations and Hecke/Grassmannian geometry remain GS0-owned.

- Discharge BG0 scheme/integral and broader field representation contracts, preserving its acyclic supplier direction.

- Supply D2 bundle effectivity and the RF2 completed-etale-stalk comparison used in the fully specified reductive approximation proof.

- Consume the R3 arbitrary-input comparison for the general transfer clause; build geometric native carriers from their owners.

### Coverage of `RelativeFarguesFontaine:RF4`

**planned**. Aggregate of the two planned children, with no third gluing construction. The full arbitrary-input target is now realized explicitly. Complete denotes a finished target-level pass; planned does not denote closure or formalization.

- Discharge the precise comparison, dictionary, recovery and descent contracts recorded by both children; the aggregate inherits their gaps.

## Structural decisions and planets

RT-AREA-padic-1/19 (confirmed): the stage edge RF4:vector-bundles -> AInfCohomology:AI.2 serves only the essential surjectivity of Fargues' theorem. Breuil-Kisin-Fargues full faithfulness uses no curve input (BMS1 Remark 4.29, read in this job). In this packet the exports to AI.2 are RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles (Scholze-Weinstein 12.4.6, 14.1.1 (2)<=>(3)) and RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles (Scholze-Weinstein 14.2.1); both are essential-surjectivity inputs. Apply the fix the RT-AREA-padic-1 fix report gives for /19: split AI.2 into AI.2 (BKF category and full faithfulness, no curve input) and a new stage AInfCohomology:AI.2:essential-surjectivity, and retarget the link RF4:vector-bundles -> AI.2 to RF4:vector-bundles -> AI.2:essential-surjectivity, with the reason 'linear Beauville-Laszlo gluing between pairs (T, Xi) and shtukas with one leg, and Kedlaya's algebraicity, in the essential surjectivity of Fargues' theorem'. RS-20's link and its RF4:vector-bundles reason ('linear supplier to AI.2') change accordingly.

RT-AREA-padic-1/18 proposes a crystalline-end child. Its chart targets are now represented by RF0:integral-Y/whole-analytic-ainf-locus and whole-analytic-ainf-sheafiness, and RF4 imports those exact nodes. Kedlaya’s p-typical algebraicity theorem is singly owned by RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles; RF0’s stable punctured-ainf-bundle-algebraicity id is a presentation/import comparison. This division agrees with the Guo-Reinecke route to RF4 for patching, without duplicating the theorem or requiring a nonexistent stage id. Keep the chart construction and sheafiness at the two exact RF0:integral-Y nodes and algebraicity at the exact RF4 theorem node. A separate RF0:crystalline-end child, if adopted, reparents the existing chart nodes and preserves their stable ids; it does not create second chart or algebraicity targets. The φ-module freeness statements of Guo-Reinecke item 129 (Ivanov Theorem 6.1; Kedlaya-Liu Proposition 3.2.13 and Lemma 3.2.6, extraction items PAPER-KEDLAYA-LIU-15/124 and /129) require the owner of Frobenius modules over perfect rings or the Guo-Reinecke Part II owner, with their product-of-valuation-rings hypotheses. RF0’s outward RF4 request remains a routing request for that payload, not a claim that RF4’s patching theorem supplies it.

Overlap note: AdicSpacesPartII:R3/glueing-square, R3/glueing-square-finite-surjectivity and R3/glueing-square-finite-projective-descent plan the topological case (complete Tate rings, strictness and density) of Kedlaya-Liu's glueing formalism; this packet plans the algebraic exact squares of Kedlaya-Liu 1.3.7-1.3.10, which the Kedlaya-Liu extraction routed to RF4:vector-bundles and which the Beauville-Laszlo square, the Zariski square and the B-pair square need (none of them is a square of complete Tate rings). The node RF4:vector-bundles/glueing-datum-over-exact-square carries the compatibility ExactSquare.ofGlueingSquare. Keep the algebraic formalism here as its single owner and the topological glueing squares in AdicSpacesPartII:R3 as the special case the API compares with. If the maintainer prefers the most foundational owner (PROTOCOL section 15), move the three algebraic nodes into AdicSpacesPartII:R3 and let RF4:vector-bundles import them; AdicSpacesPartII is upstream of RF4, so the move creates no cycle.

The full RF4 arbitrary-complement target needs a local analytic/formal comparison beyond the existing R3 affinoid global-section and bundle-gluing nodes. Extend AdicSpacesPartII R3 in its existing Part II direction by the precise compatible-data chart comparison requested here. Keep global Beauville-Laszlo patching and modifications in RF4. Resolve any bounded/algebraizable hypotheses with a source or counterexample before claiming the unrestricted general-E target closed.

The seven planets are key objects or named results, with five in the linear layer and two in the G-layer:

- Beauville–Laszlo lemma — `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`.

- Beauville–Laszlo gluing on the curve — `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`.

- Vector bundles as relative B-pairs — `RelativeFarguesFontaine:RF4:vector-bundles/vector-bundles-as-relative-B-pairs`.

- Kedlaya algebraicity of vector bundles — `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles`.

- Beauville–Laszlo gluing for G-bundles — `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`.

- v-descent and étale-local triviality — `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`.

- Modification of a G-bundle by a lattice — `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`.

## Pinned baseline

All 37 statements were read at the pins on 8 October 2026. These are carriers and supporting declarations; they do not constitute an implemented relative gluing library.

| Reference | Module | What the statement supplies |
|---|---|---|

| `mathlib:AdicCompletion` | [Mathlib/RingTheory/AdicCompletion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | The I-adic completion of a module; with I = (f) it is the ring R-hat of the Beauville-Laszlo lemma and, for I the divisor ideal on an affinoid chart, the ring B^+_D. |

| `mathlib:AdicCompletion.of` | [Mathlib/RingTheory/AdicCompletion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | The canonical map M -> AdicCompletion I M, the first leg of the Beauville-Laszlo square. |

| `mathlib:IsAdicComplete` | [Mathlib/RingTheory/AdicCompletion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | I-adic completeness (Hausdorff and precomplete); B^+_D is I_D-adically complete. |

| `mathlib:IsLocalization.Away` | [Mathlib/RingTheory/Localization/Away/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Away/Basic.lean) | Localization away from one element; the ring R[1/f] of the Beauville-Laszlo square and B_D = B^+_D[1/xi]. |

| `mathlib:Localization.Away` | [Mathlib/GroupTheory/MonoidLocalization/Away.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/MonoidLocalization/Away.lean) | The concrete localization R[1/f]. |

| `mathlib:nonZeroDivisors` | [Mathlib/Algebra/GroupWithZero/NonZeroDivisors.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/NonZeroDivisors.lean) | The submonoid of nonzerodivisors; f in it makes (R, f) a glueing pair. |

| `mathlib:Module.Projective` | [Mathlib/Algebra/Module/Projective.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Projective.lean) | Projective modules; finite projective modules are the vector bundles on affine schemes and sheafy affinoids. |

| `mathlib:Module.Finite` | [Mathlib/RingTheory/Finiteness/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Defs.lean) | Finitely generated modules; finite glueing data. |

| `mathlib:Module.FinitePresentation` | [Mathlib/Algebra/Module/FinitePresentation.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/FinitePresentation.lean) | Finitely presented modules; Kedlaya-Liu Lemma 1.3.9(a) shows the module of sections is finitely presented. |

| `mathlib:Module.Flat` | [Mathlib/RingTheory/Flat/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean) | Flat modules; flat modules are glueable, and flatness is checked on the two pieces (Stacks 15.92.18). |

| `mathlib:Module.FaithfullyFlat` | [Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean) | Faithful flatness; R -> R-hat x R[1/f] need not be flat, which is why Beauville-Laszlo is not fpqc descent. |

| `mathlib:Module.Free` | [Mathlib/LinearAlgebra/FreeModule/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean) | Free modules; trivial bundles and the field case of the B-pair description. |

| `mathlib:Module.Dual` | [Mathlib/LinearAlgebra/Dual/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Defs.lean) | The dual module; duals of glueing data and of modifications. |

| `mathlib:Module.Invertible` | [Mathlib/RingTheory/PicardGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PicardGroup.lean) | Invertible modules (M^dual tensor M = R); the ideal I_D of a closed Cartier divisor is invertible. |

| `mathlib:TensorProduct` | [Mathlib/LinearAlgebra/TensorProduct/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Defs.lean) | Tensor products of modules; base change of glueing data and tensor products of lattices. |

| `mathlib:LinearEquiv` | [Mathlib/Algebra/Module/Equiv/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Equiv/Defs.lean) | Linear isomorphisms; the comparison isomorphisms psi_1, psi_2 and beta of a glueing datum. |

| `mathlib:CommAlgCat.FiniteEtale` | [Mathlib/RingTheory/Etale/Finite.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Finite.lean) | The category of finite etale R-algebras, the FEt(R) of Kedlaya-Liu Corollary 1.3.10. |

| `mathlib:Algebra.Etale` | [Mathlib/RingTheory/Etale/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Basic.lean) | Etale algebras. |

| `mathlib:Algebra.Smooth` | [Mathlib/RingTheory/Smooth/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Smooth/Basic.lean) | Smooth algebras; the coordinate ring of a torsor under a smooth group is smooth over the base. |

| `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` | [Mathlib/RingTheory/Smooth/AdicCompletion.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Smooth/AdicCompletion.lean) | If A is formally smooth over R and S is I-adically complete, every R-algebra map A -> S/I lifts to A -> S. For the smooth affine torsor scheme this lifts a section over the quotient to a section over B-plus (FS VI.1.7, p. 193). |

| `mathlib:HenselianRing` | [Mathlib/RingTheory/Henselian.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean) | Henselian pairs and the instance that an I-adically complete ring is henselian along I. This is a carrier and elementary completeness input; it does not by itself supply the regular element t, henselian pair (R,tI), approximation or etale-neighbourhood conclusion of Gabber-Ramero 5.4.21. |

| `mathlib:IsDiscreteValuationRing` | [Mathlib/RingTheory/DiscreteValuationRing/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DiscreteValuationRing/Basic.lean) | Discrete valuation rings; at a geometric point B^+ is a finite product of complete DVRs with algebraically closed residue field. |

| `mathlib:BDeRhamPlus` | [Mathlib/RingTheory/Perfectoid/BDeRham.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean) | Mathlib's B_dR^+ of an integral perfectoid ring: the ker(theta)-adic completion of W(R-flat)[1/p]; zero if p = 0 in R. The p-typical case of the ring R_2 of Kedlaya-Liu Definition 8.9.4. |

| `mathlib:BDeRham` | [Mathlib/RingTheory/Perfectoid/BDeRham.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean) | Mathlib's B_dR: BDeRhamPlus with the generators of ker(theta) inverted. The p-typical case of R_3. |

| `mathlib:WittVector` | [Mathlib/RingTheory/WittVector/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean) | p-typical Witt vectors; A = W(R^+) in Kedlaya's algebraicity theorem. |

| `mathlib:CategoryTheory.Equivalence` | [Mathlib/CategoryTheory/Equivalence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Equivalence.lean) | Equivalences of categories: the gluing functors. |

| `mathlib:CategoryTheory.Functor.Monoidal` | [Mathlib/CategoryTheory/Monoidal/Functor.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean) | Monoidal functors, the form of the exact tensor functors Rep G -> Bun. |

| `mathlib:CategoryTheory.MonoidalCategory` | [Mathlib/CategoryTheory/Monoidal/Category.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Category.lean) | Monoidal categories. |

| `tauceti:TauCeti.Comodule.IsFaithful` | [TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean) | A comodule (representation) is faithful if its representation morphism to a general linear group is a closed immersion for some finite basis; the faithful V of the meromorphy criterion. |

| `tauceti:TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom` | [TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean) | Faithfulness is independent of the witnessing basis: for any finite basis b, faithful iff the coordinate morphism is a closed immersion. |

| `tauceti:TauCeti.AffineGroupSchemeCat` | [TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean) | Affine group schemes; the structure group G. |

| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | [TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean) | Reductive affine group schemes of finite type over a field: the hypothesis on G over E in FS Definitions VI.1.6 and VI.1.8. The O_E-integral reductive case is not in the pinned library. |

| `mathlib:MvPolynomial` | [Mathlib/Algebra/MvPolynomial/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Basic.lean) | Polynomial ring in an arbitrary index type; Option N indexes the explicit nonnoetherian glueing-pair counterexample. |

| `mathlib:Ideal.Quotient.mk` | [Mathlib/RingTheory/Ideal/Quotient/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Defs.lean) | Canonical ring homomorphism to the quotient by an ideal, used for the counterexample generators. |

| `mathlib:IsLocalization.Away.awayToAwayLeft` | [Mathlib/RingTheory/Localization/Away/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Away/Basic.lean) | Canonical map from a localization at x to one at y*x; fixes the 3-to-6 overlap map. |

| `mathlib:IsLocalization.Away.awayToAwayRight` | [Mathlib/RingTheory/Localization/Away/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Away/Basic.lean) | Canonical map from a localization at x to one at x*y; fixes the 2-to-6 overlap map. |

| `mathlib:TensorProduct.AlgebraTensorModule.rid` | [Mathlib/LinearAlgebra/TensorProduct/Tower.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Tower.lean) | The scalar-linear cancellation M tensor_R R equivalent to M; the twisted datum uses the actual multiplication identifications. |

## Public source record

All sources were accessed on 8 October 2026. The packet retains the SHA-256 for each of the eleven PDF versions and the precise sections read. Stacks uses its online section and stable tags. No source passage is reproduced; the mathematical accounts above are organized around the targets and their dependencies.

- **[SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf)**: Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*. Annals of Mathematics Studies 207; author PDF dated 'March 27, 2020' on every page header.

- **[FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf)**: Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*. Author-hosted 356-page PDF (MPIM Bonn); corresponds to arXiv:2102.13459v4 by contents.

- **[KL15-foundations](https://arxiv.org/abs/1301.0792v5)**: Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory: foundations*. arXiv:1301.0792v5 (9 May 2015, version to appear in Asterisque 371); the published Asterisque text was not read.

- **[Stacks-BL](https://stacks.math.columbia.edu/tag/0BNI)**: The Stacks project authors, *The Stacks project, More on Algebra, Section 15.92 The Beauville-Laszlo theorem (tag 0BNI), with Sections 15.9 and 15.11*. Online version, tags 0BNI, 0BNR, 0BNS, 0BNW, 0BP2, 07M7 and 0ALJ, accessed 2026-10-06.

- **[CS17-generic](https://arxiv.org/abs/1511.02418v1)**: Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. arXiv:1511.02418v1 (8 November 2015); published in Annals of Mathematics 186 (2017), where Theorem 3.5.1 is on p. 687.

- **[FF18-courbe](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf)**: Laurent Fargues, Jean-Marc Fontaine, *Courbes et fibres vectoriels en theorie de Hodge p-adique*. Asterisque 406 (2018); author copy courbe.pdf dated 16 avril 2017.

- **[HK-admissible](https://arxiv.org/abs/2308.11064v2)**: Sean Howe, Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: The bi-analytic Ax-Lindemann theorem*. arXiv:2308.11064v2 (28 February 2025).

- **[Kedlaya-Ainf](https://arxiv.org/abs/1602.09016v5)**: Kiran S. Kedlaya, *Some ring-theoretic properties of A_inf*. arXiv:1602.09016v5 (11 June 2019); published in p-adic Hodge theory, Simons Symposia, Springer 2020 ([Ked20] of Guo-Reinecke; cited by SW20 as [Ked19b, Theorem 3.6], whereas the statements used are Theorems 3.8-3.9 of arXiv v5; the published numbering was not checked).

- **[GR24-prismatic](https://arxiv.org/abs/2203.09490v3)**: Haoyang Guo, Emanuel Reinecke, *A prismatic approach to crystalline local systems*. arXiv:2203.09490v3 (27 October 2023); published in Inventiones Mathematicae 236 (2024).

- **[GR02-almost](https://arxiv.org/abs/math/0201175v3)**: Ofer Gabber, Lorenzo Ramero, *Almost ring theory*. arXiv:math/0201175v3, sixth and final release (2002); Fargues-Scholze cite the Springer LNM 1800 (2003) edition as [GR03], whose numbering was not checked.

- **[DM82-tannakian](https://www.jmilne.org/math/xnotes/tc2018.pdf)**: Pierre Deligne, James S. Milne, *Tannakian categories*. Revised version of LNM 900 (1982), dated November 4, 2018, author-hosted.

- **[BMS18-integral](https://arxiv.org/abs/1602.03148v3)**: Bhargav Bhatt, Matthew Morrow, Peter Scholze, *Integral p-adic Hodge theory*. arXiv:1602.03148v3; published in Publications mathematiques de l'IHES 128 (2018).

No new source erratum is asserted. The corrections concern blueprint statements, supplier scope and proof obligations.
