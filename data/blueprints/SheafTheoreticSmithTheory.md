# Sheaf-theoretic Smith theory, parity sheaves and Satake base change

This roadmap builds cyclic base change on the modular equal-characteristic affine Grassmannian. Start with an odd prime p, H connected reductive over a separably closed field F of characteristic different from p, G=H^p, and cyclic rotation σ. For p good for the dual root system, the endpoint is a **natural** isomorphism

Sat_H ∘ BC ≅ Res_Δ ∘ Sat_G

on normalized k-parity sheaves, identified with rational tilting representations of the split dual groups. Here Δ:Ĥ→Ĥ^p and k=overline(F_p). The functor BC first takes a cyclic convolution norm, then Smith restriction to a Tate quotient, then a normalized parity lift, and finally cancels the norm’s Frobenius action on scalars by inverse Frobenius on the source. The general algebra Tate diagonal is another output, used by the global and local base change roadmaps.

The plan is complete at target level: all 63 items routed here from PAPER-FENG-24 have dispositions in the packet. All nine layers are **planned**, with five explicit proof obligations; none is closed or claimed implemented. In particular, character equality establishes an objectwise tilting comparison, while the natural Ĥ-equivariant comparison remains G5. The stronger integral comparison needed by the global Tate-cohomology application remains G4. This distinction is part of the theorem’s plan, not an assumption hidden in its proof.

The definitive mathematical targets are in this document. The suggested Lean file contains only light definitions and milestone statements over carriers actually present at the pins. Enhanced sheaf categories, Tate Verdier quotients and parity/Satake categories are targets here rather than artificial Lean carriers. Their complete API outlines and discriminating tests remain below, as required by the current roadmap shape.

## Conventions

**C0. Geometric and coefficient fields.** Fix an odd prime p, a separably closed field F of characteristic different from p, k=overline(F_p) and O=W(k). The default sheaf coefficients are k or O. O/p^m occurs only in explicitly compatible finite-level systems. W(k) is not the ring of integers of a finite extension of Q_p: the requested adic extension in G1 is essential. A good prime is required from ST.4 parity–tilting onward; the general Smith layers do not require a reductive group.

**C1. Boundedness and equivariance.** Schemes are separated, locally of finite type over F and have admissible C_p-actions. Work on finite-dimensional finite-type pieces, with a uniform cohomological/Tor interval on each piece. All fixed restrictions use these bounds. Ind-schemes are exhausted by invariant closed finite-dimensional pieces. D_σ means enhanced equivariant étale sheaves on [Y/C_p]. Only a trivial geometric action permits its identification with group-ring sheaves. D^b_ind is the uniformly cohomologically bounded filtered-colimit enlargement of constructible sheaves; outputs are ind-constructible unless the additional constructibility hypotheses hold.

**C2. Derived coefficients and grading.** All tensor products, inverse limits, internal Hom and six operations are derived unless a flatness hypothesis makes an ordinary operation valid. Integral coefficients mean normalized compatible adic systems with a common support stratification and finite-level Tor/degree bounds. Λ[C_p] uses the chosen generator. T\* denotes a Verdier quotient projection, whereas T^j denotes a cohomology sheaf. The Tate periodicity generator is fixed once. Cohomological [n] is the standard derived shift; an O-free trivial module has T^even=L/pL and T^odd=0.

**C3. Strata, morphisms and normalization.** A finite smooth connected stratification S has a pariversity †:S→Z/2. The JMW condition is finite free even Hom cohomology for finite free local systems, as stated in ST.4. Normalized parity generators restrict to L[dim Y_λ] on their dense stratum, with no arbitrary shifts adjoined. Parentheses (L^+H) denote orbit constructibility after forgetting equivariance; L^+H without parentheses denotes actual equivariance. Ordinary parity morphisms, C_p-equivariant morphisms, and norm-generated C_p-morphisms are distinct. No fullness of integral reduction on all C_p-equivariant objects is used.

**C4. Satake and the comparison target.** H is connected reductive over F, G=H^p, and σ sends factor i to i+1. Choose compatible Borels and maximal tori. The dual groups Ĥ and Ĝ=Ĥ^p are integral pinned split reductive groups from RG2.5. Sat_H denotes the sheaf-to-representation equivalence, and Res_Δ restriction along Δ:Ĥ→Ĥ^p. The target is a natural isomorphism Sat_H BC≅Res_Δ Sat_G on normalized k-parity objects/tilting modules, not a conclusion about a tensor structure on BC. Normalized CT at ν is RΓ\_c(S_ν,−)[⟨2ρ,ν⟩]. A Frobenius linearization uses a specified F_p-form and inverse Frobenius on the source.

## What is imported, and what this roadmap owns

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. An existing module Tate-cohomology group or cyclic periodicity isomorphism does not construct an étale sheaf quotient or its six operations. Conversely, those existing groups must not be planned again.

The current read-only Tau Ceti library and TauCetiRoadmap main were also checked, at commits recorded in the packet’s ownership audit. The newer upstream roadmaps supply no replacement for these sheaf-level targets. ReductiveGroups and ModularInduction were read as nearby models; their representation and torus carriers remain imports. This route lies outside the Caraiani–Newton 94-roadmap tier schedule; no tier transfer is proposed.

| Supplier | Exact reusable input | Boundary |
| --- | --- | --- |
| Mathlib and Tau Ceti | DerivedCategory, WittVector, Frobenius, finite flat/local modules, all-degree module Tate cohomology, H⁰ norm quotient and cyclic periodicity | No equivariant étale enhancement, sheaf Tate quotient or multiplicative algebra diagonal is inferred from them. |
| EnhancedDerivedSheaves E1/E3 | Enhanced derived categories, K-flat resolutions, tensor/coefficient change, colimits, mates and coherences | Used as the actual derived infrastructure; never reconstructed as a stub. |
| EtaleDualityAndPerverseSheaves EDC.0/1/3/5/6 | Torsion constructible finite-Tor complexes, six operations, recollement, smooth-pair purity, perverse inequalities and finite-DVR normalized adic systems | Its finite-DVR adic result does not cover W(overline(F_p)); G1 states the extension. |
| SchemeAndStackFoundations SF.1 | Admissible finite quotients and quotient stacks | Geometric action on a free locus remains distinct from a coefficient action. |
| GlobalShtukasAndFunctionFieldLanglands GS.1 | Equal-characteristic Grassmannians, Schubert bounds, Hecke correspondences and fusion geometry | Needed over an arbitrary separably closed F of characteristic different from p, not only over the global curve. Its rational-coefficient Satake does not supply the modular equivalence planned in ST.3. |
| ReductiveGroupsPartII RG2.0a/RG2.5 and upstream ReductiveGroups | Weil restriction, integral dual root data, product compatibility, Galois action, rational representations and tori | New modular geometric identification is owned here; root-data constructions are imported. |
| Tau Ceti ReductiveGroups Layer 9, extended by DESIGN-ReductiveGroupsPartIII | Integral highest-weight theory requested of the candidate ReductiveGroupsIntegralRepresentationsPartII: Weyl and induced modules, finite highest-weight ideals with Δ/∇ Ext vanishing, good filtrations and the Donkin–Wang–Mathieu tensor theorem | Not yet designed. LanglandsParameterStacks LP3 imports the same inputs from this owner and does not plan them. Tilting modules, their tensor closure and derived generation are targets here, which that design imports. |

GeometricSatakeAndFusion supplies a useful B_dR^+ model, but its setting is not the scheme-theoretic equal-characteristic Grassmannian with k/W(k) étale coefficients. GlobalShtukasAndFunctionFieldLanglands GS.1 plans classical Satake with rational coefficients only. The modular Satake and normalized CT branch therefore belongs here, as the accepted Feng routing requires, and ST.3 is its single owner: the Part II on Tate cohomology of shtukas (PAPER-FENG-24 route 2) imports it. Likewise, the characteristic-zero Springer correspondence does not supply MR18’s modular exotic/Soergel engine. Its missing foundation is G3.

Four suppliers have since gone to TauCetiRoadmap, whose README is now authoritative for the contract: EnhancedDerivedSheaves (pull request #908), EtaleDualityAndPerverseSheaves (#1040), ReductiveGroupsPartII (#785) and SchemeAndStackFoundations (merged, #779). Each request records where its item sits upstream. EtaleDualityAndPerverseSheaves takes torsion coefficients to be any Noetherian ring killed by an integer invertible on the base, which covers k, W_n(k) and their cyclic group rings; its adic statements are for rings of integers of finite extensions of Q_p, which is why G1 is needed.

The packet lists the exact node or stage for each supplier and each consumer. The requests are contracts, not claims that the supplying roadmap is already formalized. The W(k)-adic extension is proposed as EtaleDualityAndPerverseSheaves, Part II; Smith-specific quotient comparisons remain here.

## Construction order

| Layer | Output | Main earlier local inputs |
| --- | --- | --- |
| ST.0 | Geometric actions, coefficient categories, uniform Tor criterion | Pinned module/ring carriers and enhanced sheaves |
| ST.1 | Tate quotients, periodic cohomology, integral stratification | ST.0 |
| ST.2 | Smith, six operations and localization | ST.0–1 |
| ST.3 | Modular Satake and tilting representation interface | ST.0 and imported Grassmannian/dual geometry |
| ST.4 | Parity, Tate parity, graded Hom and lifting | ST.1–3 |
| ST.5 | Cyclic norm, categorical Tate diagonal and linear BC | ST.2–4 |
| ST.6 | CT comparisons, torus calculation and natural diagonal-restriction target | ST.3–5 |
| ST.7 | Exactness, Galois descent and integral comparison | ST.2–6 |
| ST.8 | Algebra Tate diagonal, character extension, Frobenius twists of vector spaces and algebras | ST.0 and the twist interface of ST.5 |

The ST.3 construction of weight functors is part of the modular Satake proof. ST.6 exposes their normalized CT API and proves their compatibility with BC; ST.3 does not depend on a base change theorem from ST.6. The algebraic diagonal is a parallel endpoint and is not used circularly to prove the categorical diagonal.

## Worked checks

**A cyclic group ring and two coefficient theories.** For p=3, put u=σ−1. Then k[C₃]=k[u]/u³ and N=u². The regular module is free; k=A/(u) is not flat. On the trivial k-module the alternating differentials 1−σ and N both vanish, so its even and odd Tate groups are k. On the trivial O-module the maps are 0 and p, giving even Tate group k and odd Tate group zero. Thus the integral Tate unit is even, whereas the mod-p Tate unit is not Tate-even. An infinite direct sum of regular modules checks the arbitrary-module flat/free theorem rather than only the finite library statement.

**A nearby complex is perfect without flat cohomology.** Let C_p rotate A¹ by x↦ζx, and let j:G_m→A¹. With geometrically equivariant constant k-coefficients the fixed-origin stalk of Rj\* has a two-term regular-module model [A→^{1−σ}A] in degrees 0 and 1. Both its cohomology modules are trivial k-modules and hence nonflat, but the complex has finite Tor amplitude and vanishes in the Tate quotient. This checks the intended complex-level kernel and the distinction between geometric equivariance and an unrelated trivial coefficient action. It also explains why Rj\* needs an ambient local cohomological bound, even though j has relative dimension zero.

**The integral comparison fails on an actual map.** For H=GL₂ and minuscule λ=(1,0), the closed Schubert variety is P¹. Let E=O_{P¹}[1]. Its integral Tate endomorphisms contain k in index zero and H²(P¹;k) in index one. The lifting functor L keeps index zero. A nonzero index-one class is therefore killed by L, but its reduction to the mod-p Tate category is nonzero. An objectwise comparison between the two outputs cannot be a natural comparison on every Tate endomorphism. ST.7 asks only for the valid ordinary inflated maps and, as G4, the separately controlled norm-generated maps.

**The torus calculation sees scalar orientation.** For H=G_m, p=3 and a point sheaf at coweight (2,−1,4) of Gr_{H³}, Nm gives the diagonal weight 5. Smith and normalized lifting leave a point sheaf at 5. A scalar a first becomes a³; inverse Frobenius on the source turns a into a^(1/3) before that step, so BC acts by a. Over F₉, choosing a outside F₃ detects omission of this linearization. Direct sums and all matrices must satisfy the same formula, giving the natural torus comparison.

**An algebra diagonal with and without a character.** With trivial σ on k[x], the transfer is p·a=0 and the diagonal sends a to a^p. With the F_p[x] form, its linearization fixes scalars and sends x to x^p. For the product algebra B^p with factor rotation, invariants are the diagonal B and transfer onto them is surjective. The Tate quotient is the zero ring. Consequently there is no unital transfer-annihilating character from the fixed ring to a nonzero field; the extension theorem does not assert one exists. This tests both its hypotheses and the ambient ring of the transfer ideal.

## ST.0. Actions, coefficients and finite Tor dimension

Specify the odd-prime coefficient datum, admissible geometric cyclic actions, fixed schemes and enhanced quotient-stack equivariance. Distinguish geometric equivariance from group-ring coefficients on a trivial action. Prove arbitrary flat modules over the cyclic group ring in characteristic p are free, and state the uniform stalkwise Tor-amplitude/flat-resolution criterion. Reuse the existing Witt-vector, derived-category and enhanced sheaf carriers.

**Atlas planets:** Cyclic coefficients and good primes; Admissible cyclic actions; Equivariant derived sheaves; Flat cyclic modules are free; Flat complexes.

### Coefficient and cyclic-action conventions (`coefficients`)

A coefficient datum consists of an odd prime p, a separably closed geometric field F with p invertible, k=an algebraic closure of F_p, O=W(k), and C_p with specified generator σ. Use Λ=k, O/p^m or O, as individually stated. Write A_Λ=Λ[C_p] and N=Σ\_{i=0}^{p−1}σ^i. Ordinary coefficient actions are Λ-linear; arithmetic semilinear actions are separately marked. Goodness means p does not divide any coefficient of a highest root in each irreducible dual root system. Type A has no excluded primes, B/C/D exclude 2, G₂/F₄/E₆/E₇ exclude 2,3, and E₈ excludes 2,3,5.

**Inputs:** `mathlib:WittVector`, `ReductiveGroupsPartII:RG2.5/langlands-dual-group`.

**Construction/proof.** Use the existing Witt ring and dual-root-datum carriers. Prove the good-prime predicate is invariant under duality of root systems and products. Coefficients are discrete at torsion level; O is an adic coefficient system, not a discrete torsion ring.

**Source:** Feng24, §1.5 (Notation), p.7; §4.6.1, pp.23–24. The notation section fixes k as an algebraic closure of F_p with the discrete topology, geometry over fields of characteristic different from p with p-adically complete coefficients, σ as a chosen generator of a cyclic group of order p, and N as the sum of its powers. Section 4.6.1 sets up G=H^p with cyclic rotation and, after Lemma 4.11, assumes p odd and good for the dual group. Goodness is used there without being defined; the highest-root definition and its type table recorded in this node are the standard ones.

**API.**

- `coefficients.groupRing` (coercion): Use the existing monoid algebra with its Λ-algebra action.
- `coefficients.good_product` (characterisation): Goodness for a product is goodness for each irreducible factor.
- `coefficients.norm_relations` (simp): (σ−1)N=N(σ−1)=0; N acts as p on trivial modules.

**Uses.**

- Feng24 §§3–4: Keep geometric characteristic, coefficient characteristic, integral Tate parity and the final good-prime theorem distinct.

**Unit tests.**

1. `coefficients.test_1` (computation): p=3 is odd and good for GL₂, but not good for G₂.
2. `coefficients.test_2` (computation): On a trivial O-module N is multiplication by p; on a regular orbit N is the orbit sum, not zero.
3. `coefficients.test_3` (compatibility): O/p identifies with k, whereas O itself has characteristic zero.

### Admissible geometric actions (`actions`)

For a separated locally finite type F-scheme Y, an admissible C_p-action is an action for which every orbit is contained in an invariant affine open; equivalently use an invariant affine open cover in the cases considered. Define Y^σ as the scheme-theoretic equalizer of σ and identity, and Y/C_p as the glued affine invariant quotient. The complement of Y^σ is a free C_p-space because p is prime; in characteristic different from p its quotient is a finite étale C_p-torsor. For ind-schemes require an invariant closed filtration by finite-type pieces.

**Inputs:** `SheafTheoreticSmithTheory:coefficients`, `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`.

**Construction/proof.** Import finite-quotient representability and its universal property; check the prime-order stabilizer dichotomy and étaleness of the free quotient. Specify compatible bounded pieces before using an ind-scheme.

**Source:** Feng24, §3.2, p.14; Lemma 3.6, p.15. Section 3.2 works with a separated locally finite type scheme carrying a σ-action that is admissible in the sense of SGA 1, Exposé V, Definition 1.7, and notes (after Riche–Williamson) that this holds when the scheme is exhausted by quasi-projective pieces. Lemma 3.6 uses admissibility to form the quotient by a free action as a map of schemes. The node adds the fixed-point and free-complement facts these statements use.

**API.**

- `actions.fixed_iff` (characterisation): Maps T→Y^σ are exactly maps T→Y fixed by σ.
- `actions.quotient_desc` (universal-property): An invariant map Y→Z factors uniquely through Y/C_p.
- `actions.free_complement` (structure): The complement quotient is finite étale of degree p.
- `actions.fixed_closed` (structure): For separated Y, the fixed locus Y^σ is a closed subscheme; its open complement carries a free action and is invariant.

**Uses.**

- Feng24 Lemmas 3.6–3.8: The regular representation comes from geometric equivariant descent on this torsor.

**Unit tests.**

1. `actions.test_1` (computation): Cyclic rotation on X^p fixes the diagonal scheme X, including nilpotent test rings.
2. `actions.test_2` (computation): The scalar action x↦ζx on A¹ has fixed locus {0} and is a torsor away from zero.
3. `actions.test_3` (degenerate): The trivial action has Y^σ=Y and its free complement is empty.

### Equivariant and ind-constructible derived categories (`equivariant-derived`)

Set D_σ(Y;Λ)=D([Y/C_p];Λ) in the imported enhanced étale sheaf theory. Its bounded constructible subcategory has bounded constructible cohomology on Y; ind-constructible means the filtered-colimit enlargement with a uniform cohomological bound on the bounded part. If the geometric action is trivial, identify this with the derived category of sheaves of A_Λ-modules. For a nontrivial action keep the quotient-stack category: a coefficient C_p-action alone is different. Extra L^+G-equivariance means equivariant derived sheaves before passage to the constructible homotopy category; parentheses around L^+G mean constructibility for its orbits after forgetting this extra equivariance.

**Inputs:** `SheafTheoreticSmithTheory:actions`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`, `EnhancedDerivedSheaves:E3/exact-coproducts-colimits`.

**Construction/proof.** Use enhanced descent on the action groupoid. Form the bounded and constructible full subcategories, then the designated ind enlargement. Keep the comparison for a trivial geometric action and the forgetful functor to orbit-constructible sheaves explicit.

**Sources.**

- Feng24, §1.5 (Notation), p.7; §3.2, p.15, display (3.2). The notation section defines bounded constructible and bounded ind-constructible derived categories of a locally finite type stack and their equivariant versions. Section 3.2 introduces the σ-equivariant categories D^b_σ and D^b_{c,σ}. Display (3.2) identifies them on the fixed locus, where σ acts trivially, with sheaves of Λ[σ]-modules; the node keeps this identification only for a trivial geometric action.
- Feng24, §4.2, p.20. The subscript convention for orbit stratifications (a group in parentheses) is introduced at the end of Definition 4.2; the node fixes the matching convention for genuine versus orbit-constructible equivariance.

**API.**

- `equivariant_derived.trivialActionEquivalence` (equivalence): For trivial action identify equivariant derived sheaves with A_Λ-sheaves, compatibly with tensor and restriction.
- `equivariant_derived.forget` (functoriality): Forget geometric equivariance to D(Y;Λ), keeping its action-groupoid descent data available.
- `equivariant_derived.boundedInd` (characterisation): A bounded ind object has a uniform cohomological interval and locally ind-constructible cohomology.

**Uses.**

- Feng24 Lemmas 3.6, 3.11: Distinguish descent along a free geometric action from an independent group-ring action.
- Feng24 Lemma 4.16 and Appendix A: Forget auxiliary equivariance before applying the valid reduction equivalence.

**Unit tests.**

1. `equivariant_derived.test_1` (compatibility): On a point this category is derived A_Λ-modules, so nontrivial C_p-representations remain visible.
2. `equivariant_derived.test_2` (non-example): On a free orbit equivariant sheaves descend to a point; a constant sheaf with trivial independent coefficient action does not replace the geometric regular representation after quotient pushforward.
3. `equivariant_derived.test_3` (non-example): The family ⊕\_{n≥0}Λ[2n] is not bounded even though each finite subsum is bounded.

### Arbitrary flat cyclic group-ring modules (`cyclic-flat-free`)

For any field k of characteristic p, k[C_p]≅k[u]/(u^p) by σ↦1+u. It is a commutative Artinian local ring with maximal ideal (u) and residue field k. Every flat module over it is free, without a finite-generation hypothesis. More generally a flat module over a commutative local ring with nilpotent maximal ideal is free.

**Inputs:** `SheafTheoreticSmithTheory:coefficients`, `mathlib:Module.free_of_flat_of_isLocalRing`, `mathlib:MonoidAlgebra`.

**Construction/proof.** Choose a basis of M/mM and lift it. Nilpotence proves generation without finite Nakayama; flatness annihilates the kernel after reduction and nilpotence annihilates that kernel. For the group algebra use the binomial identity in characteristic p and compare bases. The pinned finite-flat theorem checks the finitely generated special case but is insufficient for arbitrary stalks.

**Sources.**

- Stacks, Tag 051E: Lemmas 10.101.1–10.101.3 (online). Lemma 10.101.2 shows that over a local ring with nilpotent maximal ideal the flat, free and projective modules coincide, with no finiteness hypothesis. Lemma 10.101.1 gives the basis-lifting criterion behind it, and Lemma 10.101.3 the version for a nilpotent ideal of an arbitrary ring.
- Feng24, §3.4.1, p.18; proof of Lemma 3.2, p.14. Feng cites this tag to say that a k[σ]-module is flat exactly when it is free, so that Tate cohomology of complexes descends to the Tate category. The proof of Lemma 3.2 uses the same fact for the Artinian ring k[σ].

**Check.** For p=3 the algebra is k[u]/u³; its regular module is flat/free, while the residue module k is not flat. An infinite direct sum of regular modules is also covered; the finite-flat library theorem alone does not prove this case.

### Flat and perfect equivariant complexes (`flat-complexes`)

For trivial geometric action on Y, Flat^b(Y;A_Λ) is the full thick subcategory of complexes locally represented by bounded complexes of flat A_Λ-sheaves with finite Tor amplitude locally on Y; the globally bounded variant requires a uniform bound on the chosen bounded-dimensional piece. Perf_c is its intersection with D^b_c. On a point with finite modules, perfect means a bounded complex of finite projectives. For a nontrivial geometric action retain D_σ(Y;Λ); the group-ring flat kernel is imposed only on a trivially acted-on base or on the fixed locus, rather than identifying the source with group-ring sheaves.

**Inputs:** `SheafTheoreticSmithTheory:equivariant-derived`, `EnhancedDerivedSheaves:E1/k-flat-replacement`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `SheafTheoreticSmithTheory:cyclic-flat-free`.

**Construction/proof.** Specify the local versus uniform bounds separately. Use K-flat replacements rather than termwise tensoring an arbitrary representative; form the full stable subcategory.

**Source:** Feng24, Definition 3.1 and Lemma 3.2, pp.13–14. Definition 3.1 defines Flat^b as the bounded complexes whose geometric stalks are represented by bounded complexes of flat, not necessarily finite, Λ[σ]-modules. Lemma 3.2 identifies Flat^b, for Λ=k, with the objects of locally finite Tor amplitude. The converse direction rests on showing that a stalkwise finite Tor amplitude is uniformly bounded.

**API.**

- `flat_complexes.tensor_test` (characterisation): Tor amplitude [a,b] means K⊗^L M has cohomology in [a,b] for every A_Λ-module sheaf M in degree zero.
- `flat_complexes.thick` (structure): The subcategory is closed under shifts, cones and direct summands.
- `flat_complexes.stalk` (compatibility): At a geometric point the condition agrees with the corresponding group-ring Tor condition; a common bound is recorded separately.

**Uses.**

- Feng24 Definition 3.3: Specify the correct Verdier-quotient kernel.
- Feng24 Lemmas 3.7–3.9: Use stalkwise finite Tor dimension with a justified bound.

**Unit tests.**

1. `flat_complexes.test_1` (computation): A free regular module and all its shifts lie in the kernel; the trivial k[C_p]-module k does not.
2. `flat_complexes.test_2` (characterisation): The cone of any morphism between flat bounded complexes remains in the thick kernel.
3. `flat_complexes.test_3` (non-example): Finite Tor dimension must be over A_Λ: k is Λ-flat when Λ=k, but is not A_k-flat.

### Flat resolutions and stalkwise Tor detection (`tor-detection`)

For A_Λ-sheaves on an étale topos, Tor amplitude [a,b] is detected on geometric stalks with the same interval and is equivalent to a flat representative with that amplitude in the bounded setting. Over the Artinian rings k[C_p] and (O/p^m)[C_p], a bounded finite-Tor complex has a bounded flat representative. A finite-rank module over these rings of finite projective dimension is projective; the arbitrary-module version uses the nilpotent-local-ring flat criterion, not an appeal to finite generation. Integral O-complexes use finite Tor dimension directly and a separately justified adic passage.

**Inputs:** `SheafTheoreticSmithTheory:flat-complexes`, `EnhancedDerivedSheaves:E1/k-flat-replacement`, `SheafTheoreticSmithTheory:cyclic-flat-free`.

**Construction/proof.** Use the imported K-flat resolution and the exactness/conservativity of geometric stalks to compare derived tensors. Truncate using the Tor-vanishing syzygy criterion. For Artinian rings apply dimension shifting and the nilpotent maximal-ideal criterion to the last syzygy. Do not infer an integral uniform estimate merely from an Artinian finite-level calculation.

**Sources.**

- Stacks, Tag 08G1 (Lemma 21.46.3); Tag 0DJJ (Lemma 21.46.10); Tag 0A5M (Definition 15.70.1); Tag 051E (Lemma 10.101.3). Lemma 21.46.3 says that on a ringed site Tor amplitude in [a,b] is equivalent to a representative by flat modules in degrees [a,b]. Lemma 21.46.10 passes the same interval to stalks, and back when the site has enough points. Definition 15.70.1 defines projective amplitude, and Lemma 10.101.3 is the freeness criterion for a nilpotent ideal.
- Feng24, proof of Lemma 3.2, pp.13–14. The proof combines these statements with the vanishing finitistic dimension of k[σ]: a complex in degrees [a,b] whose stalks have finite Tor amplitude has amplitude [a,b] at every stalk, hence globally.

**Check.** For the two-term regular complex [A→^{u}A] over A=k[u]/u^p, finite Tor amplitude holds although its nonzero cohomology modules are not flat. Keep a common interval at every stalk; individually finite intervals on a disjoint union do not give a bounded global one.

**Layer status:** planned.

- The exact supplier contracts in requests remain imports to be discharged; no implementation is claimed.

## ST.1. Tate categories and relative Tate cohomology

Construct the bounded constructible and uniformly bounded ind-constructible cyclic Tate Verdier quotients on a trivially acted-on space. Prove categorical two-periodicity and define sheaf-valued periodic Tate cohomology, its long exact sequence and the trivial k/O-action formulas. Specify the stratified integral quotient and inflation. Distinguish categorical periodicity from the existing module-level Tate isomorphism; the W(k)-adic conservative comparison requires G1.

**Atlas planets:** Tate categories; Two-periodicity; Relative Tate cohomology.

### Constructible and bounded ind Tate categories (`tate-categories`)

For trivial geometric action and Λ=k or O, define Perf(Y;TΛ)=D^b_c(Y;A_Λ)/Perf_c(Y;A_Λ) and Shv(Y;TΛ)=D^b_ind(Y;A_Λ)/Flat^b(Y;A_Λ) as stable Verdier localizations, then take their homotopy categories. Write T\* for the quotient projections. The word Perf in Perf(Y;TΛ) denotes the constructible quotient, not the subcategory being killed. Its map to Shv(Y;TΛ) is conservative under the stalkwise finite-Tor criterion. At O-level the conservative comparison is conditional on the uniform adic finite-Tor criterion G1.

**Inputs:** `SheafTheoreticSmithTheory:flat-complexes`, `SheafTheoreticSmithTheory:tor-detection`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Construction/proof.** Use the universal property of localization at maps with flat/perfect cones. Compare the kernels on constructible objects; prove conservativity, without claiming full faithfulness merely from this kernel calculation.

**Source:** Feng24, Definition 3.3 and display (3.1), p.14. Definition 3.3 defines the constructible Tate category as D^b_c(Y;Λ[σ]) modulo the complexes with perfect stalks, and the bounded ind-constructible one as D^b(Y;Λ[σ]) modulo Flat^b. T\* denotes both projections. Display (3.1) is the induced functor from the first to the second, conservative because of Lemma 3.2.

**API.**

- `tate_categories.quotient` (constructor): Projection is exact and annihilates exactly the thick kernel.
- `tate_categories.desc` (universal-property): Exact functors annihilating the kernel factor with the localization coherence.
- `tate_categories.constructibleToInd` (functoriality): The quotient comparison is conservative on constructible objects under the stated Tor criterion.
- `tate_categories.tensorIdeal` (structure): Flat^b and the perfect kernel are tensor ideals for ⊗^L_Λ with diagonal C_p-action, so the quotients inherit a tensor product and T\* is monoidal; this is what the projection formula in tate-six-operations uses.

**Uses.**

- Feng24 §§3.2–3.4: Common target of Smith restriction and compact-support localization.
- Feng24 §4.2: Integral coefficients give the even Tate unit needed for parity.

**Unit tests.**

1. `tate_categories.test_1` (computation): At a point the regular A_Λ-module becomes zero; the trivial O-module has nonzero even Tate cohomology k.
2. `tate_categories.test_2` (characterisation): A map becomes invertible exactly when its cone is in the designated kernel.
3. `tate_categories.test_3` (non-example): The trivial k-module survives: this quotient is not obtained by killing all Λ-perfect objects.

**Open proof obligation:** G1.

### Two-periodicity of the Tate quotient (`tate-periodicity`)

For Λ=k or O, there is a natural isomorphism [2]≅Id on these Tate categories, compatible with restriction. It comes from the class Λ→Λ[2] of the periodic C_p-resolution. The cone has a bounded induced A_Λ-resolution; tensoring with a bounded input over Λ remains in Flat^b because Λ has finite global dimension. This is a categorical statement, stronger than the existing isomorphism of Tate groups.

**Inputs:** `SheafTheoreticSmithTheory:tate-categories`, `tauceti:Rep.FiniteCyclicGroup.periodicIso`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Construction/proof.** Construct the periodicity class using N and σ−1 in the existing group cohomology model. Its cone is Λ-perfect and induced over A_Λ. Tensor and check the flat bound, then use the quotient universal property. Normalize the generator so the comparison with the pinned all-degree Tate API has the same norm sign.

**Source:** Feng24, Example 3.4, p.14; display (3.5), p.17. Example 3.4, after Treumann, shows that on the Tate category of a point the shift by two is isomorphic to the identity. It uses the four-term exact sequence built from 1−σ and the norm, whose middle terms are induced. Display (3.5) records the resulting class Λ→Λ[2] in D^b(Λ[σ]). Example 3.4 calls that sequence nullhomotopic, which it is not over the group ring (finding E18).

**Check.** At a point the trivial k-module survives the quotient and becomes two-periodic; the regular representation becomes zero. The periodicity cone must have induced terms, not a claimed contracting homotopy of the resolution.

### Tate cohomology of complexes and sheaves (`tate-cohomology`)

For a bounded A_Λ-complex K on a trivially acted-on étale space S, put T^j(K)=colim_n H^{j+2n}(RHom_{A_Λ}(Λ,K)), with transition induced by Λ→Λ[2]. This is an étale sheaf (internal Hom followed by cohomology), not the set of global morphisms. Its coefficient ring is T^0Λ and its index is naturally modulo two. On a point compare this construction with hypercohomology of the existing complete cyclic resolution. For Λ=k or O it annihilates Flat^b and descends to Shv(S;TΛ); the O-adic construction and its uniform comparisons require G1.

**Inputs:** `SheafTheoreticSmithTheory:tate-periodicity`, `mathlib:tateCohomology`, `SheafTheoreticSmithTheory:cyclic-flat-free`, `EnhancedDerivedSheaves:E3/exact-coproducts-colimits`.

**Construction/proof.** Use the norm splice already present for modules; extend to bounded complexes by totalization and sheafification. Exact filtered colimits give the sheaf and independence of resolutions. Check vanishing on bounded flat complexes before descending.

**Source:** Feng24, §§3.4.1–3.4.2 and Remark 3.13, pp.17–18. Section 3.4.1 defines the Tate cohomology of a bounded-below Λ[σ]-complex as the colimit of Hom(Λ,C[i+2n]) along (3.5). It notes two-periodicity and descent to the derived category, and for Λ=k to the Tate category. Remark 3.13 compares this with Hom in the Tate category. Section 3.4.2 defines Tate cohomology sheaves on a trivially acted-on S by the same colimit of sheaf Hom, as sheaves of T^0Λ-modules.

**API.**

- `tate_cohomology.stalk` (compatibility): Geometric stalks commute with the finite-bound Tate construction.
- `tate_cohomology.periodic` (simp): T^{j+2}(K)≅T^j(K), compatibly with the chosen periodicity class.
- `tate_cohomology.moduleComparison` (compatibility): On a point in degree zero this is the pinned finite-group Tate cohomology.

**Uses.**

- Feng24 §3.4.5: Extract ordinary groups from the Smith localization isomorphism.
- Feng24 Proposition 4.15: Test parity at every fixed-point stalk.

**Unit tests.**

1. `tate_cohomology.test_1` (computation): For a trivial k-module M, T^0(M)=T^1(M)=M; for a free A_k-module both vanish.
2. `tate_cohomology.test_2` (computation): For a trivial O-free module M, T^{2i}(M)=M/pM and T^{2i+1}(M)=0.
3. `tate_cohomology.test_3` (non-example): Internal Tate sheaves on a disconnected S have independent local sections; replacing internal Hom by global Hom gives the wrong sheaf.

**Open proof obligation:** G1.

### The two-periodic long exact sequence (`tate-exact-sequence`)

A distinguished triangle K′→K→K″→K′[1] of bounded equivariant complexes produces a functorial long exact sequence of Tate cohomology sheaves, with the connecting map T^jK″→T^{j+1}K′ and period two. After a bounded Rf! the same sequence is the relative Tate sequence.

**Inputs:** `SheafTheoreticSmithTheory:tate-cohomology`, `EnhancedDerivedSheaves:E3/exact-coproducts-colimits`.

**Construction/proof.** Apply RHom(Λ,−), take the long exact cohomology sequence and pass to exact filtered colimits. Relative statements additionally require the bounded compact-support theorem of ST.2; this node supplies only the Tate exact-sequence operation.

**Source:** Feng24, §3.4.4, p.18. Section 3.4.4 states that a distinguished triangle in D^b_σ(Y;k) gives a periodic long exact sequence of the relative Tate cohomology sheaves T^iRf!.

**Check.** For a short exact sequence of cyclic modules, recover the pinned module Tate connecting map at a point. For a split sequence, its connecting map is zero and the quotient-level statement is additive.

### Trivial-action and integral-unit formulas (`trivial-action-tate`)

For C∈D^b(k) inflated to k[C_p], T^\*(C)≅H^\*(C)⊗\_k T^\*(k), with the total grading modulo two. For an O-free module L with trivial action, T^even(L)=L/pL and T^odd(L)=0. On a stratum the latter formula applies to O-free local systems stalkwise, giving the even Tate unit. No claim that every constructible sheaf complex is globally formal is used.

**Inputs:** `SheafTheoreticSmithTheory:tate-cohomology`, `tauceti:TauCeti.TateCohomology.H0IsoNormQuotient`.

**Construction/proof.** Use the existing cyclic two-periodic resolution. For a trivial action its differentials are 0 and p. Over k both vanish; over O, p is injective on L. For complexes of vector spaces the derived-category splitting supplies the formula, and naturality is checked at the cohomology functor level.

**Source:** Feng24, Lemma 3.14, p.18; display (4.1), p.20. Lemma 3.14 says that for a complex inflated from D^b(k) the Tate cohomology is its ordinary cohomology tensored with T^\*(k). Display (4.1), quoting LL21 Proposition 4.6.1, says the graded endomorphisms of T\*O in the integral Tate category are k in each even degree and zero in odd degrees.

**Check.** For p=3 and L=O, check T⁰=k and T¹=0 from the alternating maps 0 and p. For the trivial k-module both groups equal k; for an induced regular module both vanish.

### The stratified integral Tate category (`integral-tate-stratification`)

For a finite stratification S of a finite-type Y, Perf_S(Y;TO) is the essential stable image of D^b_S(Y;O[C_p]) in the constructible Tate quotient; equivalently use its quotient by S-constructible perfect complexes after verifying the restriction functors preserve that kernel. Inflation ε\* assigns the trivial coefficient C_p-action to an O-complex. The pariversity is a function S→Z/2, independent of coefficient C_p-actions.

**Inputs:** `SheafTheoreticSmithTheory:tate-categories`, `SheafTheoreticSmithTheory:equivariant-derived`.

**Construction/proof.** Check the stratified localization comparison by restriction to strata and induction across recollement; define inflation via augmentation, with its enhancement.

**Sources.**

- Feng24, §4.2, pp.20–21. Section 4.2 defines Perf_S(Y;T_O) as the full subcategory generated by images of S-constructible O[σ]-complexes, and quotes its identification with the S-constructible quotient. It introduces inflation ε\* along the augmentation O[σ]→O before Definition 4.4.
- LL21, Corollary 4.5.2, p.14; opening of §5, p.19. Corollary 4.5.2 proves that the S-constructible derived category of O[σ]-sheaves modulo its S-constructible perfect complexes is equivalent to the S-constructible integral Tate category. The opening of §5 fixes the trivial action and the simply connected strata assumed in the Tate-parity theory.

**API.**

- `integral_tate_stratification.inflate` (functoriality): ε\*:D^b_S(Y;O)→D^b_S(Y;O[C_p]) preserves restrictions and derived duality in the stated finite-Tor category.
- `integral_tate_stratification.stratumRestriction` (functoriality): Both i_λ\* and i_λ! descend to the corresponding stratum Tate category.
- `integral_tate_stratification.quotientComparison` (equivalence): The S-constructible quotient identifies with the essential stratified image, with a proof of this localization statement.

**Uses.**

- Feng24 Definitions 4.2–4.7: Defines Tate parity, normalized objects and the lifting functor in a fixed stratification.

**Unit tests.**

1. `integral_tate_stratification.test_1` (degenerate): For one point, inflated O is the even Tate unit and its shift by one is odd.
2. `integral_tate_stratification.test_2` (compatibility): Inflating a rank-two free local system preserves both its rank after reduction and its monodromy.
3. `integral_tate_stratification.test_3` (non-example): A complex constructible only for a refinement does not automatically belong to the coarser S-constructible source.

**Layer status:** planned.

- Open: G1, Uniform integral Smith theory over W(k).
- The exact supplier contracts in requests remain imports to be discharged; no implementation is claimed.

## ST.2. Smith operations and localization

Prove the separate uniform finite-Tor bounds for Rf! and ambient Rj\*, extend compact support to bounded-dimensional locally finite-type maps, and use free geometric quotients to compare fixed ! and \* restrictions. Construct Psm=T\*i\* with its ! presentation, descended six operations on their specified domains, compact-pushforward compatibility and relative Tate localization. Keep the adic extension G1 visible and check every construction on bounded pieces.

**Atlas planets:** Finite Tor bounds; Locally finite type compact supports; Fixed restriction comparison; Smith operation; Smith localization theorem.

### Separate Tor bounds for compact support and open direct image (`finite-tor-pushforward`)

Let A=k[C_p] or (O/p^m)[C_p], and let f:Y→S be separated of finite type, with geometric fibres of dimension ≤d, under the torsion étale projection formula and the bound cd_c(f)≤2d. If K has A-Tor amplitude [a,b], then Rf!K has amplitude [a,b+2d]. For a quasi-compact open immersion j:U→X into a finite-dimensional noetherian scheme, Rj\* preserves finite A-Tor dimension when the relevant ambient local étale cohomological dimension is uniformly bounded. Its bound is that ambient bound, not 2 times the relative dimension of j. At adic O-level require one compatible finite-level system, a uniform bound and the derived-limit/projection-formula comparisons.

**Inputs:** `SheafTheoreticSmithTheory:tor-detection`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system`.

**Construction/proof.** Tensor with an arbitrary A-module, apply projection formula, then use the compact-support cohomological bound. For j use stalks as cohomology of punctured strict henselian neighborhoods and an ambient bound. The adic comparison is G1, not a formal consequence of these torsion estimates.

**Source:** Feng24, Lemma 3.9, p.16; proof of Lemma 3.7, pp.15–16. Lemma 3.9 asserts that Rf! preserves Flat^b for a separated locally finite type equivariant morphism of bounded dimension. Its proof reduces by filtered colimits to finite type and cites Stacks 0F10 with SGA 4, XVII 5.2.10. The proof of Lemma 3.7 uses that Rj\* preserves finite Tor amplitude, citing SGA 4, XVII 5.2.11. The node keeps the corrected separate contracts for the two functors that the PAPER-FENG-24 route brief records from FIX-RT-PAPER-FENG-24.

**Check.** For A=k[C_p] on A¹, RΓ\_c(A¹,A)=A(−1)[−2] attains degree 2. For G_m→A¹, use the Kummer example below to reject a relative-dimension-zero bound on Rj\*.

**Open proof obligation:** G1.

### Compact supports in locally finite type (`lft-compact-support`)

For a separated equivariant f:Y→S locally of finite type of bounded geometric fibre dimension, construct Rf! from the directed system of quasi-compact opens of Y over finite-type opens of S, using extension by zero and the imported enhanced compact-support functors. A bounded input with a uniform degree interval has a bounded ind-constructible output under a common 2d bound. Constructibility of the output requires the additional usual finite-type and constructible-input hypotheses.

**Inputs:** `SheafTheoreticSmithTheory:finite-tor-pushforward`, `EnhancedDerivedSheaves:E3/exact-coproducts-colimits`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Construction/proof.** Construct the diagram with the enhancement and its extension-by-zero transition maps; prove independence by cofinality. Uniform support/fibre bounds keep the colimit bounded. Compare on each finite-type open of S.

**Source:** Feng24, §3.3, pp.16–17; proof of Lemma 3.9 and Remark 3.10, p.16; Proposition 3.12, p.17. Section 3.3 works with σ-equivariant locally finite type morphisms of bounded dimension and descends Rf! to the ind-constructible Tate categories. The proof of Lemma 3.9 writes Rf! of a locally finite type source as a filtered colimit over its finite-type opens. Remark 3.10 explains that perfect complexes are not preserved, which is why the ind-constructible enlargement is used.

**API.**

- `lft_compact_support.qcComparison` (compatibility): On finite-type pieces recover the imported Rf!.
- `lft_compact_support.composition` (functoriality): R(gf)!≅Rg!Rf! with coherent associativity whenever uniform bounds apply.
- `lft_compact_support.baseChange` (compatibility): Geometric base change and projection formula pass through the colimit with the stated tensor/limit hypotheses.

**Uses.**

- Feng24 Proposition 3.12: The fixed-locus localization theorem permits nonproper and non-quasi-compact morphisms, subject to bounds.

**Unit tests.**

1. `lft_compact_support.test_1` (computation): For an infinite disjoint union of points over a point, compact support is the direct sum, not the product.
2. `lft_compact_support.test_2` (computation): For A¹→pt, RΓ\_c(k)=k(−1)[−2], so an input in degree zero can have output in degree two.
3. `lft_compact_support.test_3` (non-example): The family ⊔\_n A^n has no common dimension bound and is excluded from the bounded output assertion.

### A free geometric quotient produces flat complexes (`free-quotient-flat`)

If C_p acts freely and admissibly on Y, q:Y→Y/C_p is its finite étale quotient and E∈D^b_σ(Y;Λ) has finite Λ-Tor dimension, then q_\*E, with its quotient C_p-action, has locally a bounded induced A_Λ-resolution and is flat over A_Λ. For Λ=k the coefficient Tor hypothesis is automatic. The hypothesis is geometric equivariance, not a second independent C_p-action on an arbitrary sheaf.

**Inputs:** `SheafTheoreticSmithTheory:actions`, `SheafTheoreticSmithTheory:equivariant-derived`, `SheafTheoreticSmithTheory:tor-detection`.

**Construction/proof.** Étale locally trivialize the torsor; descent identifies E with identical coefficient complexes on p sheets. Pushforward is induction from Λ to A_Λ. Tensor a Λ-flat resolution with the regular representation.

**Source:** Feng24, Lemma 3.6, p.15. Lemma 3.6 says that for a free σ-action with quotient q the pushforward q_\*F is flat over Λ[σ]. The reason is that its stalk is a stalk of F tensored with Λ[σ]. That stalk formula presupposes geometric equivariance (finding E16).

**Check.** For p disjoint points permuted cyclically and an equivariant constant Λ-sheaf, q_\* gives the regular Λ[C_p]-module. Giving p constant summands an unrelated trivial coefficient action fails this test.

### The nearby free complement has flat fixed stalks (`near-fixed-flat`)

Let i:Y^σ→Y and j:U=Y\Y^σ→Y, with Y separated finite-dimensional of finite type and admissible C_p-action. For E∈D^b_σ(U;Λ) with the stated finite coefficient Tor bounds, the fixed stalks of i\*Rj\*E have finite A_Λ-Tor dimension with a uniform ambient bound. In the O-adic case this uses G1.

**Inputs:** `SheafTheoreticSmithTheory:free-quotient-flat`, `SheafTheoreticSmithTheory:finite-tor-pushforward`, `SheafTheoreticSmithTheory:actions`.

**Construction/proof.** Factor the open complement through its free finite quotient, apply the regular-module calculation there, and compute Rj\* on strict local neighborhoods. Apply the ambient local cohomological bound, not a relative-dimension-zero bound.

**Source:** Feng24, Lemma 3.7, pp.15–16. Lemma 3.7 says that, for U the complement of the fixed locus, the stalks of Rj\*F at fixed geometric points have finite Tor amplitude over Λ[σ]. The proof uses total ramification of Y→Y/σ at fixed points, the free-quotient lemma, and preservation of finite Tor amplitude by Rj\*.

**Check.** For scalar rotation on A¹ the fixed-origin nearby stalk is [k[C_p]→^{1−σ}k[C_p]], a perfect complex with two nonflat cohomology modules. This tests the complex criterion rather than a false cohomology-wise freeness claim.

**Open proof obligation:** G1.

### Extraordinary and ordinary fixed restriction agree in the quotient (`fixed-restrictions`)

For a bounded-dimensional Y as in the previous node and E∈D^b_σ(Y;Λ), with the indicated coefficient finite-Tor/adic assumptions, the cone of the natural map i!E→i\*E lies in Flat^b(Y^σ;A_Λ). Thus T\*i!E≅T\*i\*E naturally. On finite-type constructible objects the cone is perfect and the comparison is in Perf(Y^σ;TΛ).

**Inputs:** `SheafTheoreticSmithTheory:near-fixed-flat`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`, `SheafTheoreticSmithTheory:tate-categories`.

**Construction/proof.** Restrict the open–closed localization triangle to Y^σ. Its error term is i\*Rj\*j\*E, treated by the previous node. The dimension bound is required for this term to be globally bounded.

**Source:** Feng24, Lemma 3.8, p.16. Lemma 3.8 says that the cone of i^!F→i^\*F lies in Flat^b(Y^σ;Λ[σ]). The proof restricts the triangle i_\*i^!F→F→j_\*j^\*F to the fixed locus and applies Lemma 3.7. Finding E17 adds the bounded-dimension hypothesis without which the cone need not be bounded.

**Check.** For trivial action i=id the comparison is identity. For scalar rotation on A¹ its cone is the perfect nearby complex. The disjoint union of A^n tests why a uniform dimension hypothesis is required.

**Open proof obligation:** G1.

### The Smith operation (`smith`)

For i:Y^σ→Y define Psm(E)=T\*i\*E from D^b_σ(Y;Λ) to Shv(Y^σ;TΛ), and from the constructible source to Perf(Y^σ;TΛ). The fixed locus has trivial geometric action, so the target group-ring category is available. Under the hypotheses of fixed-restrictions there is also the natural presentation T\*i!E.

**Inputs:** `SheafTheoreticSmithTheory:fixed-restrictions`, `SheafTheoreticSmithTheory:tate-categories`.

**Construction/proof.** Compose ordinary fixed-locus pullback with localization. Keep its alternative !-presentation as a theorem with bounds, not an unconditional part of the definition.

**Source:** Feng24, §3.2, displays (3.2)–(3.4) and Remark 3.5, p.15. Displays (3.3) and (3.4) define the Smith operation Psm as T\* composed with restriction to the fixed locus, from constructible and ind-constructible equivariant sheaves to the corresponding Tate categories. They use (3.2) to view sheaves on Y^σ as Λ[σ]-sheaves. Remark 3.5 checks that the two versions agree.

**API.**

- `smith.restrict` (characterisation): Psm is T\* composed with fixed-locus pullback.
- `smith.extraordinary` (compatibility): Identify with T\*i! only under the finite-dimension and coefficient assumptions.
- `smith.pullback` (functoriality): Equivariant pullback commutes with Psm and restriction to fixed loci.
- `smith.coefficientChange` (compatibility): For Λ=O, Psm commutes with derived reduction k⊗^L_O−, from equivariant O-sheaves to the k-Tate category, naturally on the constructible bounded domain (used for the bottom face of Feng Lemma 4.24).

**Uses.**

- Feng24 Proposition 3.12: Comparison with compact-support pushforward.
- Feng24 Definition 4.18: Apply to Nm before lifting back to parity sheaves.

**Unit tests.**

1. `smith.test_1` (degenerate): For trivial geometric action, Psm is the quotient projection and does not kill the trivial coefficient module.
2. `smith.test_2` (degenerate): For a free geometric action the fixed locus is empty, hence Psm is zero.
3. `smith.test_3` (computation): On A¹ with x↦ζx and constant k, Psm has the nonzero trivial Tate unit at 0.

### Flat kernels survive compact-support pushforward (`flat-pushforward`)

For f between trivially C_p-acted-on schemes and finite-Tor bounds as in finite-tor-pushforward, Rf! carries Flat^b(Y;A_Λ) to Flat^b(S;A_Λ). For a free admissible geometric action on Y and a C_p-equivariant map f:Y→S with trivial action on S, Rf!E is flat over A_Λ for any bounded equivariant E with the needed coefficient bounds. For nontrivial S the statement is instead applied to the base change over S^σ.

**Inputs:** `SheafTheoreticSmithTheory:lft-compact-support`, `SheafTheoreticSmithTheory:free-quotient-flat`, `SheafTheoreticSmithTheory:finite-tor-pushforward`.

**Construction/proof.** The first assertion is the projection formula/Tor bound. For a free source factor through q and apply the first assertion to q\*E. The base of a flat quotient assertion is S^σ, not Y.

**Source:** Feng24, Lemma 3.9 and Corollary 3.11, p.16. Lemma 3.9 says compact-support pushforward preserves Flat^b. Corollary 3.11 says that if σ acts trivially on S and freely on Y, then Rf! of any equivariant complex is flat, by factoring through the free quotient. Its printed target should be on S, not Y (finding E15).

**Check.** For a free p-point orbit mapping to a point, compact pushforward is regular and vanishes in the quotient. For identity on a trivially acted-on point it preserves the flat kernel without killing the trivial nonflat module.

**Open proof obligation:** G1.

### Operations on Tate categories (`tate-six-operations`)

Between trivially acted-on finite-dimensional spaces, descend pullback, bounded compact-support pushforward, tensor and the compatible constructible duality to the designated Tate quotients. With finite-Tor constructible coefficients, define f! and Rf\* by the dual formulas and identify them with the descent of the ordinary operations where that descent is established. Internal Hom descends in a variable when the other is Λ-perfect. These are functors on their specified bounded domains; arbitrary unbounded Rf\* is not asserted.

**Inputs:** `SheafTheoreticSmithTheory:flat-pushforward`, `SheafTheoreticSmithTheory:fixed-restrictions`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Construction/proof.** Check that each operation annihilates the quotient kernel before descending. For duality use finite coefficient Tor dimension and the imported biduality theorem. Derive !-pullback and \*-pushforward compatibilities by duality; keep all boundedness hypotheses in the functor signatures.

**Source:** Feng24, §§3.3.1–3.3.2, pp.16–17; Appendix A.1, pp.56–57. Sections 3.3.1–3.3.2 descend pullback and compact-support pushforward to the Tate categories. Appendix A.1 recalls, from Treumann and Riche–Williamson, that pullback, proper pushforward and Verdier duality descend to the constructible Tate categories. It defines f^! and Rf_\* by conjugating with duality, and lists the compatibilities of Psm with all four operations in A.1.1–A.1.2.

**API.**

- `tate_six_operations.descend` (universal-property): Supply the natural factorization through T\* with coherent composition.
- `tate_six_operations.projectionFormula` (compatibility): Rf!(K⊗f\*L)≅Rf!K⊗L on the specified finite-Tor domains.
- `tate_six_operations.duality` (compatibility): D exchanges f\* with f! and Rf! with Rf\*, under constructible biduality hypotheses.

**Uses.**

- Feng24 Appendix A.1–A.4: Constant term is built from pullback and compact-support pushforward and must commute with Smith.

**Unit tests.**

1. `tate_six_operations.test_1` (degenerate): Pullback along an identity and the descended identity agree as functors.
2. `tate_six_operations.test_2` (characterisation): Projection formula with the Tate unit recovers the original object, whereas tensor with a regular A_Λ-module becomes zero.
3. `tate_six_operations.test_3` (non-example): For a proper f the ! and \* pushforwards agree; for a nonproper f they retain their distinct compact-support meanings.

### Smith commutes with compact supports (`smith-pushforward`)

Let f:Y→S be a separated admissibly C_p-equivariant locally finite type morphism between bounded-dimensional schemes, with the uniform cohomological and coefficient Tor hypotheses above. There is a natural equivalence Psm_S Rf!≅R(f^σ)! Psm_Y. For finite-type constructible inputs this is in the constructible Tate category. Proper pushforward is a special case; properness is not needed for the !-version.

**Inputs:** `SheafTheoreticSmithTheory:smith`, `SheafTheoreticSmithTheory:flat-pushforward`, `SheafTheoreticSmithTheory:tate-six-operations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

**Construction/proof.** Base change first to S^σ. In that fibre, remove Y^σ using open–closed localization. The complement has a free C_p-action; its compact-support image is flat and vanishes in the quotient. The resulting natural transformation is invertible; verify coherence with composition.

**Source:** Feng24, Proposition 3.12, p.17; §3.4.5, p.19. Proposition 3.12 says Psm commutes with compact-support pushforward along an equivariant locally finite type morphism of bounded dimension. Its proof replaces S by S^σ and kills the free complement using Corollary 3.11. Section 3.4.5 restates the result as Psm(Rf!F)≅R(f|\_{Y^σ})!Psm(F).

**Check.** For the structure map of the free p-point orbit both sides are zero. For the identity map the comparison is the identity natural transformation, including on a nonzero scalar morphism.

**Open proof obligation:** G1.

### Equivariant localization of cohomology (`smith-localization`)

For S=Spec(F) with trivial action, the previous equivalence gives T\*RΓ\_c(Y,E)≅RΓ\_c(Y^σ,Psm(E)) in Shv(pt;TΛ). Applying T^j gives the two-periodic localization on cohomology. This is a quotient-level natural isomorphism before extracting groups, and requires all the boundedness hypotheses of smith-pushforward.

**Inputs:** `SheafTheoreticSmithTheory:smith-pushforward`, `SheafTheoreticSmithTheory:tate-cohomology`.

**Construction/proof.** Specialize f to the structure map and use the trivial-action identification of Smith at a point. Pass to relative Tate cohomology; do not identify it with an ordinary non-equivariant cohomology group without the trivial-action formula.

**Source:** Feng24, §3.4.5, display (3.6), p.19. Display (3.6) specializes Proposition 3.12 to the structure map to a separably closed point with trivial action, giving T\*RΓ\_c(Y;F)≅RΓ\_c(Y^σ;Psm F). Feng presents this as the sheaf form of the classical localization theorems of Smith theory.

**Check.** For Y the disjoint union of one fixed point and one free orbit, equivariant constant k-coefficients localize to precisely the fixed point. Compare both parity indices with module Tate cohomology.

**Layer status:** planned.

- Open: G1, Uniform integral Smith theory over W(k).
- The exact supplier contracts in requests remain imports to be discharged; no implementation is claimed.

## ST.3. The modular equal-characteristic Satake branch

Construct the missing equal-characteristic modular geometric Satake equivalence with fusion symmetry, k/O-flat coefficient change and the standard/costandard comparison. Reuse integral dual groups and rational representation carriers. Define rational tilting representations from the Weyl and induced modules requested from the integral highest-weight extension of Tau Ceti ReductiveGroups Layer 9, prove tensor closure and bounded derived generation via finite highest-weight ideals. This is the modular scheme-theoretic branch, not a duplicate of the B_dR^+ Satake roadmap.

**Atlas planets:** Modular geometric Satake; Tilting representations; Derived tilting equivalence.

### Modular equal-characteristic geometric Satake (`modular-satake`)

For a connected reductive H over separably closed F of characteristic different from p, the spherical perverse category P_{L^+H}(Gr_H;k) with fusion commutativity is tensor-equivalent to finite-dimensional rational Rep_k(Ĥ), where Ĥ is the pinned integral dual group base changed to k. The O-flat perverse subcategory has the corresponding tensor equivalence with finite free O-representations of Ĥ\_O. The geometry is the scheme-theoretic equal-characteristic affine Grassmannian, not the B_dR^+ Grassmannian. The fibre functor is total cohomology with the usual parity sign correction to symmetry.

**Inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/bounded-strata-and-schubert-bounds`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/global-hecke-stacks-and-convolution`, `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `ReductiveGroupsPartII:RG2.5/langlands-dual-group`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action`.

**Construction/proof.** Reuse the existing BD Grassmannian, bounded Schubert geometry and fusion correspondences. Prove weight-functor exactness and tensor compatibility with torsion/integral coefficients by the semi-infinite dimension estimates and Künneth formula. Reconstruct the integral Hopf algebra using projective generators on finite Schubert unions, prove base change, and identify its root datum with the already owned dual group. MV07 Theorem 14.1 gives the étale variant; explicitly supply the O-adic extension using compatible finite levels, and separably closed to algebraically closed invariance. G2 records these coefficient/transport obligations.

**Sources.**

- MV07, Proposition 11.1, p.31; Theorem 12.1, p.33; Theorem 14.1, p.40. For a Noetherian coefficient ring of finite global dimension, Proposition 11.1 builds a flat affine group scheme whose representations, finitely generated over the coefficients, form the spherical perverse category, compatibly with base change from Z. Theorem 12.1 identifies the Z-form with the split reductive group of dual root datum. Theorem 14.1 gives the étale variant for coefficients obtained by base change from Z_ℓ.
- Feng24, opening of §4, p.19; §4.5, p.23; Remark A.1, p.58. Feng uses the Geometric Satake equivalence with k-coefficients for the scheme-theoretic Grassmannian over F throughout §4. Remark A.1 says this modular equal-characteristic setting is not completely documented and that the complex and B_dR^+ proofs carry over; the node makes that transport an explicit obligation (G2).

**Check.** For a split torus, point sheaves indexed by coweights correspond to one-dimensional characters; fusion adds coweights. For H=PGL₂ the IC/parity representation of the dual SL₂ has the expected highest weight, so using the original root datum instead of the dual is detected.

**Open proof obligation:** G2.

### Satake standards and coefficient change (`satake-standard-comparison`)

Fix a Borel and dominant λ. Under modular-satake, the perverse standard ^pj_!Λ[dim Gr^λ] corresponds to the Weyl module Δ(λ), and the perverse costandard ^pj_\*Λ[dim Gr^λ] to ∇(λ), with the canonical highest-weight map matched. On O-flat objects the k-reduction comparison is derived tensor k⊗^L_O, with ordinary representation reduction on the other side. Do not assert that derived reduction of an arbitrary integral perverse object stays in the perverse heart.

**Inputs:** `SheafTheoreticSmithTheory:modular-satake`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action`.

**Construction/proof.** Use the universal properties on each saturated highest-weight ideal, evaluated by the λ-weight functor. Compare standard/costandard maps and integral projective generators before extending scalars. Track derived tensor for torsion objects.

**Sources.**

- MV07, Proposition 13.1 and Corollary 13.2, pp.39–40. Proposition 13.1 says that under the integral Satake equivalence the map from the standard to the costandard sheaf of λ corresponds to the map from the Weyl module to the induced module. Both are characterized by universal properties in the subcategory with weights at most λ. Corollary 13.2 identifies the ν-weight spaces of both modules with the span of the irreducible components of Gr^λ∩S_ν.
- Feng24, §4.5, p.23. Feng recalls tilting modules as the objects of Rep_k(Ĝ) with both a standard and a costandard filtration, which on the sheaf side requires this standard/costandard comparison.

**Check.** At λ=0 both standard and costandard are the unit. For dual SL₂ in characteristic 3, distinguish Δ(3) from ∇(3); do not identify them by semisimplicity or an integral arbitrary-object reduction argument.

**Open proof obligation:** G2.

### The category of rational tilting representations (`tilting-category`)

Using the Weyl and dual-Weyl modules and highest-weight filtrations requested from the integral highest-weight extension of Tau Ceti ReductiveGroups Layer 9, Tilt_Λ(Ĥ) is the full additive subcategory of finite free rational Ĥ\_Λ-modules admitting both a finite Δ-filtration and a finite ∇-filtration. For Λ=k, finite free means finite-dimensional. Its exact structure is inherited from rational representations; it is closed under direct summands, not under all kernels and cokernels. Use the integral reductive group representation carrier, not arbitrary representations of the discrete group of k-points.

**Inputs:** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `ReductiveGroupsPartII:RG2.5/langlands-dual-group`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

**Construction/proof.** Import the highest-weight predicates, and define their intersection as a full subcategory. API must preserve the algebraic comodule structure on every morphism.

**Sources.**

- JMW16, §1.1 and Theorem 1.1, p.1. Section 1.1 recalls tilting modules for a reductive group over an algebraically closed field of characteristic p as modules with Weyl and good filtrations. Theorem 1.1 classifies the indecomposable ones as T(λ) by highest weight.
- Feng24, §4.5, p.23. Feng defines Tilt_k(Ĝ) as the full subcategory of Rep_k(Ĝ) of modules with both a standard and a costandard filtration, closed under direct sums and, by a nontrivial theorem, tensor products.

**API.**

- `tilting_category.mem_iff` (characterisation): Tilting is the conjunction of Δ-filtered and ∇-filtered on the actual rational representation.
- `tilting_category.indecomposable` (structure): T(λ) is the unique indecomposable tilting of highest weight λ with its normalized highest-weight line.
- `tilting_category.retract` (instance): Finite sums, duals and direct summands preserve tilting.

**Uses.**

- Feng24 Theorem 4.8: Identify normalized parity sheaves via Satake.
- Feng24 Theorem 4.20: Diagonal restriction is tensor product of factor representations.

**Unit tests.**

1. `tilting_category.test_1` (degenerate): The trivial representation is tilting, with both filtrations of length one.
2. `tilting_category.test_2` (computation): For a split torus every finite-dimensional rational representation is tilting, with its finite character decomposition.
3. `tilting_category.test_3` (non-example): For SL₂ in characteristic 3, the Weyl module Δ(3) has an exact sequence 0→L(1)→Δ(3)→L(3)→0 of two-dimensional simple factors; ∇(3) has the reversed Loewy layers. Thus Δ(3) is not tilting, while T(3) has character ch Δ(3)+ch Δ(1) and dimension 6.

### Tensor closure and character determination (`tilting-tensor`)

Tensor products of finite-dimensional rational tilting modules for a split connected reductive group over k are tilting. For a product group, external tensor products of indecomposable tiltings give its indecomposable tiltings. The characters ch T(λ) are triangular with leading dominant weight λ of multiplicity one, so equal characters imply isomorphism for finite direct sums of tiltings. Restriction to a maximal torus is faithful, but it is generally not full.

**Inputs:** `SheafTheoreticSmithTheory:tilting-category`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.

**Construction/proof.** Request the precise good-filtration tensor theorem (Donkin, Wang, Mathieu) and its dual from the integral highest-weight extension of ReductiveGroups Layer 9; no parameter-stack hypothesis is imposed on this generic representation theorem. Krull–Schmidt and the triangular highest-weight characters determine multiplicities recursively. Restriction forgets structure and is faithful; no inference of fullness is allowed.

**Sources.**

- JMW16, Theorem 1.2, p.1; Theorems 5.1 and 5.3, p.16. Theorem 1.2 states that tensor products of tilting modules are tilting. In the appendix, Theorem 5.3 shows this is equivalent to Theorem 5.1, the theorem of Donkin, Wang and Mathieu that tensor products of modules with good filtrations have good filtrations.
- Feng24, footnote 11, p.27; §A.4, p.60. Footnote 11 uses the tensor theorem to see that diagonal restriction preserves tilting. Section A.4 cites Donkin for faithfulness of restriction to the dual torus and for tilting modules being determined by their characters.

**Check.** For dual SL₂ in characteristic 3, the standard two-dimensional tilting module has tensor square T(2)⊕T(0). Torus restriction is faithful but its diagonal weight-space endomorphisms need not be SL₂-intertwiners.

### Tiltings generate bounded rational derived categories (`derived-tilting-generation`)

The canonical functor K^b(Tilt_k(Ĥ))→D^b(Rep_k(Ĥ)) is an equivalence, where Rep denotes finite-dimensional rational representations. Prove this first inside each finite saturated highest-weight ideal and then pass to their filtered union; this does not give a uniform tilting-resolution length for all highest weights.

**Inputs:** `SheafTheoreticSmithTheory:tilting-category`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `mathlib:DerivedCategory`.

**Construction/proof.** Within a finite highest-weight ideal, Ext^n(T,T′)=0 for n>0 by Δ/∇ Ext-vanishing, giving full faithfulness of the homotopy functor. Resolve standards by tiltings inductively on the finite weight poset; standards generate its bounded derived category. Any bounded complex involves finitely many weights and fits in such an ideal. Request the finite-ideal highest-weight theorem from the integral highest-weight extension of ReductiveGroups Layer 9.

**Source:** Feng24, Proposition 4.10, p.23. Proposition 4.10, citing Riche, states that the bounded homotopy category of tilting modules maps by an equivalence onto D^b(Rep_k(Ĝ)), as for any highest-weight category.

**Check.** For a torus the category is semisimple and degree-zero objects already generate by characters. For a nonsemisimple finite highest-weight ideal, check full faithfulness through Ext^{>0}(tilting,tilting)=0 and generation via finite standard/costandard resolutions.

**Layer status:** planned.

- Weyl and induced modules, finite highest-weight ideals and the good-filtration tensor theorem are requested from the integral highest-weight extension of tauceti:TauCetiRoadmap/ReductiveGroups Layer 9 (DESIGN-ReductiveGroupsPartIII, not yet designed).
- Open: G2, Étale modular Satake and parity transport.
- The exact supplier contracts in requests remain imports to be discharged; no implementation is claimed.

## ST.4. Parity, Tate parity and lifting

Give JMW stratifications, ordinary parity, support uniqueness and Grassmannian parity existence/equivariance. Prove good-prime perversity and the parity–tilting equivalence, with the MR exotic/Soergel engine isolated as G3 and étale transport as G2. Construct integral Tate parity, the graded Hom formula with composition and the normalized degree-zero lifting functor. Prove ordinary parity coefficient reduction; exclude the false full C_p-equivariant equivalence.

**Atlas planets:** JMW stratifications; Parity sheaves; Parity–tilting equivalence; Integral Tate Hom formula; Tate-parity sheaves; Parity lifting functor.

### Even stratifications and pariversities (`jmw-stratification`)

A JMW stratification S of Y has finitely many connected smooth locally closed strata, the usual frontier condition, and the following coefficient condition for Λ=k or O: for finite free local systems L,L′ on each stratum, every Ext^n(L,L′) is finite free over Λ and vanishes for odd n. A pariversity † assigns an element of Z/2 to each stratum; the dimension pariversity is dim(Y_λ) mod 2. Simple connectivity is an additional hypothesis used for lifting, not part of the general definition. The class of local systems is part of the data: over a base field of positive characteristic it is taken to be the constant (or group-equivariant) ones, since wild local systems on affine strata can have odd cohomology.

**Inputs:** `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Construction/proof.** Use local-system Ext in the imported constructible derived category. Require freeness and odd vanishing; even nonzero Ext is allowed. Keep all local systems if strata are not simply connected.

**Sources.**

- JMW14, §2.1, conditions (2.1)–(2.2), pp.4–5; Definition 2.3, p.5. Section 2.1 fixes a field or complete discrete valuation ring as coefficients and a stratified variety. It assumes (2.1)–(2.2): Hom between free local systems on a stratum vanishes in odd degrees and is free in all degrees. Definition 2.3, at the start of §2.2, introduces pariversities.
- Feng24, §4.1, pp.19–20. Section 4.1 calls a stratification JMW under the same odd-vanishing and freeness condition, notes that it holds for affine flag varieties (JMW14 §4.1), and fixes the dimension pariversity. Over a base field of positive characteristic the claim for affine flag varieties holds only for constant local systems (finding E38). The sentence after (4.1), in §4.2 on p.20, misstates the parity condition (finding E23).

**API.**

- `jmw_stratification.localExt` (characterisation): Odd Ext groups vanish and even ones are finite free, with no inverted condition.
- `jmw_stratification.dimensionParity` (constructor): Associate dim mod 2 to the chosen smooth strata.
- `jmw_stratification.changePariversity` (compatibility): Shifting † by one exchanges the even and odd conditions.

**Uses.**

- Feng24 Theorems 4.1 and 4.3: Provide the extension/uniqueness and Krull–Schmidt induction.
- Feng24 Proposition 4.15: Compare induced pariversity on the fixed strata.

**Unit tests.**

1. `jmw_stratification.test_1` (computation): An affine space with constant coefficients satisfies the condition; its dimension changes † but not the odd-Ext vanishing.
2. `jmw_stratification.test_2` (non-example): P¹ with its one smooth stratum has nonzero H², which is allowed; a smooth elliptic curve with H¹≠0 fails the condition for the constant local system.
3. `jmw_stratification.test_3` (characterisation): The same stratification can be used with constant †=0 and dimension †; on a one-dimensional stratum these give different even objects.

### Parity complexes and parity sheaves (`parity-complex`)

An object E∈D^b_S(Y;Λ) is \*-even for † if each i_λ\*E has finite free local-system cohomology only in degrees congruent to †(λ); !-even uses i_λ!E. Even means both, odd means E[1] is even, and parity means a direct sum of an even and an odd object. A parity sheaf E(λ,L) is an indecomposable parity object supported on closure(Y_λ) whose restriction to Y_λ is L[dim Y_λ], for an indecomposable finite free local system L. Existence is an independent theorem.

**Inputs:** `SheafTheoreticSmithTheory:jmw-stratification`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`.

**Construction/proof.** Define the four restriction predicates and their conjunction/direct-sum form. Specify the indecomposable normalized extension separately; never define it by choosing an extension that has not been proved to exist.

**Sources.**

- JMW14, Definition 2.4, p.5; Theorem 2.12, p.7; Definition 2.14, p.8. Definition 2.4 defines ∗- and !-even and odd complexes and parity complexes. Theorem 2.12 shows that an indecomposable parity complex has irreducible support, restricts to a shifted local system on the dense stratum, and is determined by that restriction. Definition 2.14 calls the normalized indecomposables parity sheaves.
- Feng24, §4.1, pp.19–20. Feng recalls even, odd and parity complexes for the dimension pariversity and Theorem 4.1, and writes E(λ,L) for the parity sheaf when it exists.

**API.**

- `parity_complex.restriction` (projection): Both stalk and costalk conditions are part of evenness; neither implies the other by definition.
- `parity_complex.shift` (simp): A shift by one exchanges even and odd; a shift by two preserves them.
- `parity_complex.duality` (compatibility): Verdier duality preserves parity under the finite-free local-system and smooth-stratum hypotheses.

**Uses.**

- Feng24 §4.4: Normalization removes arbitrary shifts.
- Feng24 §4.6: Stalk and costalk freeness enters the cyclic norm calculation.

**Unit tests.**

1. `parity_complex.test_1` (computation): On a smooth one-dimensional stratum Λ[1] is even for dimension pariversity and Λ[0] is odd.
2. `parity_complex.test_2` (non-example): On a point O/p in degree zero is not O-parity because its cohomology is not O-free.
3. `parity_complex.test_3` (non-example): A point-supported Λ⊕Λ[1] is parity but neither even nor odd; the condition is not a single parity for all summands.

### Uniqueness and Krull–Schmidt for parity extensions (`parity-indecomposables`)

In the finite JMW setting with complete local coefficient ring Λ, parity objects have Krull–Schmidt decompositions. Every indecomposable parity object has one irreducible support closure(Y_λ), restricts there to one indecomposable local system shifted by an integer, and is determined up to isomorphism by that restriction and support. This proves uniqueness of E(λ,L), not its existence.

**Inputs:** `SheafTheoreticSmithTheory:parity-complex`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`.

**Construction/proof.** Induct over strata using odd-Hom vanishing to extend maps between restrictions. Endomorphism rings of finite-support parity objects are finite over the complete local coefficient ring, so idempotents split and the usual local-ring criterion gives Krull–Schmidt. The dense-stratum inverse lifts modulo the boundary radical.

**Sources.**

- JMW14, Remark 2.1, p.4; Theorem 2.12, p.7. Remark 2.1 notes that the constructible derived category is Krull–Remak–Schmidt for the complete local coefficient rings considered. Theorem 2.12 gives irreducible support and uniqueness of an indecomposable parity complex with a given dense-stratum restriction.
- Feng24, Theorem 4.1, p.20. Theorem 4.1 restates JMW14 Theorem 2.12 and observes that uniqueness does not give existence.

**Check.** On a point over complete local O, the only normalized rank-one extension is O. Uniqueness must not imply existence for an arbitrary stratified singular variety; the Grassmannian existence theorem is an additional input.

### Parity extensions on the equal-characteristic Grassmannian (`grassmannian-parity`)

The L^+H-orbit stratification of every finite Schubert union in Gr_H satisfies the JMW condition for Λ=k,O with constant local systems on the strata, equivalently L^+H-equivariant ones, since the stabilizers are connected; these are the only local systems used. In characteristic 0 the strata are simply connected. Over a field of positive characteristic ℓ the condition fails for arbitrary étale local systems (finding E38), so the orbit-constructible category is taken with constant restrictions to strata. Its normalized parity extensions exist for all dominant coweights and trivial finite free local systems. They admit compatible L^+H-equivariant structures in the precise non-torsion-prime setting of JMW16 Theorem 1.4. Under the odd good-prime hypothesis of Feng24, prove that the orbit-constructible normalized category used below has the required equivariant realization; do not identify the full equivariant derived category with the orbit-constructible one.

**Inputs:** `SheafTheoreticSmithTheory:parity-indecomposables`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/bounded-strata-and-schubert-bounds`, `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action`.

**Construction/proof.** Build Bott–Samelson parity pushforwards on affine flag varieties, then take the appropriate summands on the partial flag/Grassmannian. Check evenness, the local-system condition and integral lifting on each bounded piece. Compare étale and complex proofs, including non-torsion/good-prime equivariance and passage to separably closed F. These proof inputs are the explicit transport contract G2.

**Sources.**

- Feng24, §4.1, p.20; §4.5, pp.22–23. Feng states that parity sheaves exist on Gr_G for the positive-loop orbit stratification and can be made equivariant when p is not a torsion prime, citing JMW16 Theorem 1.4. Section 4.5 notes that the orbit stratification of this Kac–Moody flag variety is JMW, which in positive characteristic needs the constant-local-system convention (finding E38).
- JMW16, Theorem 1.4 and footnote 3, p.2. Theorem 1.4, from JMW14 Theorem 4.6, gives for characteristic not a torsion prime a unique indecomposable equivariant parity complex with support the closure of Gr^λ and constant rank-one restriction there. Every indecomposable parity complex is of this form. Footnote 3 says the torsion restriction can be removed in the non-equivariant setting.

**Checks.**

- For a torus every stratum is a point and its extension is Λ. For a GL₂ minuscule closed Schubert P¹ the normalized extension is Λ[1]. Check ordinary Hom separately from equivariant Hom.
- Over an algebraic closure of F_ℓ, a one-dimensional Schubert cell of the affine flag variety is A¹, and the Artin–Schreier sheaf L_ψ(x^d), for d≥3 prime to ℓ and ψ a nontrivial character of F_ℓ into k^×, has H¹ of dimension d−1. The constant-local-system convention excludes it.

**Open proof obligation:** G2.

### Normalized parity sheaves are tilting Satake objects (`parity-tilting`)

For odd p good for the root system of Ĥ (equivalently H), every normalized k- or O-parity sheaf on Gr_H is perverse. Modular Satake induces Parity^0_{(L^+H)}(Gr_H;k)≅Tilt_k(Ĥ), with the chosen equivariant realization when required. The integral version uses O-flat perverse sheaves. The characteristic assumption is goodness, not the larger bounds in JMW16 Theorem 1.8.

**Inputs:** `SheafTheoreticSmithTheory:grassmannian-parity`, `SheafTheoreticSmithTheory:satake-standard-comparison`, `SheafTheoreticSmithTheory:tilting-category`.

**Construction/proof.** Use MR18 Theorem 1.1: the mixed/parity affine-Grassmannian category is related to the exotic coherent category on the Springer resolution of the dual group, compatibly with grading and tilting generators. Its Corollary 1.6 establishes perversity for every good prime, reducing along central isogenies and products. The exotic/Soergel proof engine and its étale transport are not supplied by the characteristic-zero Springer roadmap; G3 records this exact missing foundation. Once perversity holds, Δ/∇-filtrations characterize the Satake images as tilting.

**Sources.**

- Feng24, Theorem 4.8 and Remark 4.9, p.23. Theorem 4.8 states that for p good the Satake equivalence restricts to an equivalence between normalized parity sheaves and tilting modules. Its proof sketch transports Mautner–Riche to the Grassmannian over F, replacing one loop-group step by Zhu Lemma 5.2.4. Remark 4.9 mentions the JMW16 Theorem 1.8 route, with worse bounds on p.
- MR18, Theorem 1.1, p.3; Corollary 1.6, p.6; §6.5, p.60. Corollary 1.6 states that for p good for the group of the Grassmannian every spherical parity sheaf is perverse. Section 6.5 deduces it from the parity/exotic-tilting equivalence of Theorem 1.1 and a perversity criterion for self-dual objects (Lemma 6.6), after standard reductions to products of simply connected quasi-simple groups not of type A and general linear groups, which satisfy the hypotheses of Theorem 1.1.

**Check.** For the GL₂ minuscule P¹ stratum, k[1] is perverse and maps to the corresponding fundamental tilting representation. Check the hypothesis is odd good p, rather than the larger source-specific sufficient bounds.

**Open proof obligations:** G2, G3.

### External products of normalized Grassmannian parity sheaves (`parity-product`)

For G=H^r, every normalized O-parity object on Gr_G≅(Gr_H)^r is a finite direct sum of E(λ₁)⊠⋯⊠E(λ\_r). The external product is the normalized indecomposable extension on the product stratum. Its stalk and costalk cohomology are the graded tensor products of the corresponding finite free O-modules, including the Koszul symmetry signs.

**Inputs:** `SheafTheoreticSmithTheory:grassmannian-parity`, `SheafTheoreticSmithTheory:parity-tilting`, `SheafTheoreticSmithTheory:tilting-tensor`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Construction/proof.** Use the Künneth theorem for finite free stalks and costalks, and dense-stratum normalization. Indecomposability follows either from the product tilting classification under Satake or from the local endomorphism criterion. This direct-sum decomposition replaces the invalid t-exact filtration argument in the printed proof.

**Source:** Feng24, proof of Lemma 4.14, p.24; Theorem 4.8, p.23. The proof of Lemma 4.14 reduces an integral Satake object on Gr_G≅(Gr_H)^p, by a filtration, to external products F_1⊠⋯⊠F_p. For the normalized parity inputs used later, this node replaces the filtration (finding E26) by a direct-sum decomposition into external products of parity sheaves, using Theorem 4.8 on each factor.

**Check.** The product of the GL₂ minuscule generators is O_{(P¹)^r}[r] and has rank-one dense-stratum restriction. A direct sum of two generators stays a direct sum and is not mislabeled indecomposable.

### The graded Hom formula and its composition law (`integral-tate-hom`)

For bounded constructible O-complexes E,F in the LL integral Tate setting, with trivial coefficient C_p-action and the finite-support coefficient hypotheses, Hom_{Perf(Y;TO)}(T\*ε\*E,T\*ε\*F)≅⊕\_{i∈Z}Hom_{D^b(Y;k)}(k⊗^L E,(k⊗^L F)[2i]). Composition adds the indices using shifts. Require the stratified version with finite Hom groups and nilpotence of the positive-degree endomorphism ideal for normalized parity inputs. The category is Krull–Schmidt under the finite-stratification, complete-local and simply-connected-strata assumptions used by LL.

**Inputs:** `SheafTheoreticSmithTheory:integral-tate-stratification`, `SheafTheoreticSmithTheory:tate-periodicity`, `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action`, `SheafTheoreticSmithTheory:parity-indecomposables`.

**Construction/proof.** Compare the periodic complete resolution with derived reduction, then compute quotient morphisms by stabilized Hom. Check naturality and the index-addition composition formula before projecting any grading. Carry the proof through the étale coefficient setting via G2. Finite support and bounded Hom ensure the nonnegative endomorphism algebra has nilpotent positive ideal in the perverse case.

**Sources.**

- LL21, Proposition 4.6.1, p.14; Proposition 5.5.2, p.22. Proposition 4.6.1 computes Hom in the integral Tate category between images of O-complexes as the direct sum over i of Hom between their mod-p reductions shifted by 2i. Proposition 5.5.2 shows that the Tate-even categories, and hence the Tate-parity complexes, are Krull–Remak–Schmidt.
- Feng24, display (4.2), p.22. Display (4.2) quotes this Hom formula. Feng uses it in the proof of Proposition 4.5 and to define the lifting functor on morphisms.

**Check.** For E=O_{P¹}[1], the Tate endomorphisms have index-zero k and index-one H²(P¹;k). Composition of homogeneous classes adds indices; at a point only index zero remains for degree-zero inputs.

**Open proof obligation:** G2.

### Tate parity and Tate-parity sheaves (`tate-parity`)

In Perf_S(Y;TO), an object K is \*-Tate-even when T^{†(λ)+1}(i_λ\*K)=0 for each λ, and !-Tate-even uses i_λ!K. Tate-even requires both; Tate-odd means a shift by one is even, and Tate-parity means their direct sum. A Tate-parity sheaf is an indecomposable such object whose dense-stratum restriction is T\*ε\*L[dim Y_λ] for an indecomposable O-free local system L. The integral coefficient ring O is essential: the mod-p Tate unit has nonzero odd cohomology.

**Inputs:** `SheafTheoreticSmithTheory:integral-tate-stratification`, `SheafTheoreticSmithTheory:jmw-stratification`, `SheafTheoreticSmithTheory:trivial-action-tate`.

**Construction/proof.** Define vanishing of the opposite parity of Tate cohomology on both restrictions. Normalized dense-stratum data is specified separately from arbitrary shifts and from existence.

**Sources.**

- Feng24, Definitions 4.2 and 4.4, pp.20–21. Definition 4.2 defines ∗- and !-Tate-even objects by vanishing of T^{†(λ)+1} of the stratum restrictions, Tate-odd objects by a shift, and Tate-parity complexes as sums of the two. Definition 4.4 defines a Tate-parity sheaf as an indecomposable Tate-parity complex whose dense-stratum restriction is T\*ε\*L[dim Y_λ].
- LL21, Definition 5.3.1, p.20. Definition 5.3.1 is the original definition, phrased as vanishing of T^1 of the restrictions shifted by the pariversity.

**API.**

- `tate_parity.oppositeVanishes` (characterisation): Evenness is opposite-parity vanishing, not nonvanishing.
- `tate_parity.shift` (simp): Oddness is evenness after a one-shift and two-shifts preserve Tate parity.
- `tate_parity.restriction` (projection): Record both ordinary and extraordinary stratum restrictions in the API.

**Uses.**

- Feng24 Proposition 4.15: Target of the Smith norm operation.
- Feng24 §4.4: Provides the domain for the normalized lifting functor.

**Unit tests.**

1. `tate_parity.test_1` (computation): At a point T\*O is Tate-even and T\*O[1] is Tate-odd.
2. `tate_parity.test_2` (degenerate): A regular O[C_p]-module projects to zero, hence satisfies both even and odd vanishing conditions.
3. `tate_parity.test_3` (non-example): Replacing O by k makes the trivial Tate unit have odd Tate cohomology and fails the intended even-unit test.

### Uniqueness of Tate-parity extensions (`tate-parity-indecomposables`)

In the finite JMW integral Tate setting with simply connected strata and the stated finite-Hom hypotheses, an indecomposable Tate-parity object has support the closure of one stratum and is determined by its restriction to the dense stratum. Existence is separate. If E(λ,L) is an O-parity sheaf with no negative self-Ext, then T\*ε\*E is the corresponding indecomposable Tate-parity sheaf.

**Inputs:** `SheafTheoreticSmithTheory:tate-parity`, `SheafTheoreticSmithTheory:integral-tate-hom`, `SheafTheoreticSmithTheory:parity-indecomposables`.

**Construction/proof.** Repeat support induction with Tate odd-Hom vanishing. For the inflated parity sheaf use the graded Hom formula: its degree-zero endomorphism ring is local, negative degrees vanish and the positive ideal is nilpotent. Thus its full endomorphism ring is local.

**Sources.**

- Feng24, Proposition 4.3, p.21; Proposition 4.5 and its proof, pp.21–22. Proposition 4.3 (LL21 Theorem 5.5.6) gives irreducible support and uniqueness of indecomposable Tate-parity complexes with a given dense restriction. Proposition 4.5 (LL21 5.6.3–5.6.4) shows that T\*ε\* sends even and odd complexes to Tate-even and Tate-odd ones, and a parity sheaf without negative self-Ext to the Tate-parity sheaf. The proof checks locality of the graded endomorphism ring through (4.2) and JMW14 (2.13).
- LL21, Theorem 5.5.6, p.23; Proposition 5.6.3 and Theorem 5.6.4, p.24. These are the original statements, under the trivial-action and simply-connected-strata hypotheses of LL21 §5.

**Check.** At a point the integral Tate unit is the normalized even generator. On P¹ the inflated normalized parity extension is indecomposable because its positive endomorphism ideal is nilpotent, even though that ideal is nonzero.

**Open proof obligation:** G2.

### Modular reduction on the non-equivariant parity category (`parity-reduction`)

For a finite JMW stratification with simply connected strata (in positive characteristic: with the class of constant local systems, for which the same lifting argument applies), suppose all normalized O- and k-parity extensions exist. Then F=k⊗^L_O sends O-parity extensions to the corresponding k-parity extensions; for parity E,F′, Hom_O(E,F′) is finite free and k⊗\_O Hom_O(E,F′)≅Hom_k(FE,FF′). Consequently Parity^0_S(Y;O)⊗\_O k→Parity^0_S(Y;k) is an equivalence of additive categories. This statement is about the non-C_p-equivariant orbit-constructible category. Arbitrary C_p-equivariant reduction is not full.

**Inputs:** `SheafTheoreticSmithTheory:parity-indecomposables`, `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action`.

**Construction/proof.** Use free even local-system Hom and induction across strata for Hom base change. Complete-local idempotent lifting and the existence/uniqueness of all parity extensions give essential surjectivity. For the equivariant non-example, the O[C_p]-augmentation ideal I has I^{C_p}=0, but (I/pI)^{C_p}≠0. This obstruction cannot be removed by forgetting the difference between equivariant and ordinary Hom.

**Sources.**

- JMW14, Remark 2.7, p.7; display (2.13) and Proposition 2.39, p.17. Remark 2.7 records that Hom between parity complexes is free. Display (2.13) shows that for a ∗-parity F and a !-parity G the reduction map from F⊗Hom(F,G) to Hom of the reductions is an isomorphism. Proposition 2.39 shows that reduction sends parity sheaves to parity sheaves.
- Feng24, Lemma 4.16, p.26. Lemma 4.16 asserts the reduction equivalence for σ-equivariant normalized parity categories with simply connected strata, citing these facts. The node keeps only the non-equivariant version, which is all that §4.6.3 uses; the equivariant statement fails (finding E25).

**Check.** At a point ordinary Hom(O,O) reduces to Hom(k,k). The augmentation ideal I has I^{C_p}=0 but (I/pI)^{C_p}≠0; this rejects full equivariant reduction without affecting the ordinary equivalence.

### Normalized parity categories (`normalized-parity`)

Parity^0_S(Y;Λ) is the full additive closure of unshifted normalized parity sheaves E(λ,L). Parity^0_S(Y;TO) is defined similarly using Tate-parity sheaves. For the lifting functor require all parity extensions to exist and the cross-negative-Hom condition Hom(E(λ,L),E(μ,L′)[n])=0 for all pairs and every n<0, together with the same condition after reduction. On Gr_H it follows from perversity, once parity-tilting has been proved.

**Inputs:** `SheafTheoreticSmithTheory:parity-complex`, `SheafTheoreticSmithTheory:tate-parity-indecomposables`, `SheafTheoreticSmithTheory:parity-reduction`.

**Construction/proof.** Take additive closures without adjoining arbitrary shifts. Distinguish negative self-Ext, enough for individual indecomposability, from cross-negative-Hom, needed for a functor on the whole additive category.

**Sources.**

- Feng24, Definition 4.7 and the paragraph after it, p.22. Definition 4.7 defines normalized (Tate-)parity complexes as unshifted sums of (Tate-)parity sheaves. The following paragraph invokes the lifting functor under existence and vanishing negative self-Ext only, which is weaker than the cited theorem needs (finding E37).
- LL21, Theorem 5.6.6, p.25. Theorem 5.6.6 constructs the lifting functor assuming that all parity sheaves exist and that Hom(E(λ),E(λ′)[n]) vanishes for all pairs λ,λ′ and all n<0. This is the cross-negative-Hom condition the node requires.

**API.**

- `normalized_parity.generators` (constructor): Every object is a finite direct sum of the normalized extensions.
- `normalized_parity.fullInclusion` (coercion): Use all ordinary/Tate morphisms between the normalized objects; do not replace Hom by isomorphism classes.
- `normalized_parity.crossNegative` (characterisation): Expose the uniform cross-negative-Hom assumption needed for graded projection.

**Uses.**

- Feng24 §4.4: Makes the degree-zero projection multiplicative under composition.
- Feng24 §4.6.3: Checks Psm Nm has the correct unshifted normalization.

**Unit tests.**

1. `normalized_parity.test_1` (computation): On a point Λ in degree zero is normalized; Λ[1] is not.
2. `normalized_parity.test_2` (non-example): T\*O[2]≅T\*O is normalized in the Tate category, but O[2] is not normalized in the ordinary category.
3. `normalized_parity.test_3` (characterisation): Two perverse parity sheaves have no negative cross-Hom, so the full normalized Grassmannian category satisfies the lifting hypothesis.

### Lifting normalized Tate parity (`parity-lift`)

Under the hypotheses of normalized-parity, construct an additive k-linear functor L:Parity^0_S(Y;TO)→Parity^0_S(Y;k), taking E_T(λ,L₀) to E(λ,L₀/pL₀). On Hom use projection to index zero in integral-tate-hom, extended by matrices over finite sums. There is a natural isomorphism L T\*ε\*≅F on normalized ordinary parity objects and their ordinary morphisms. There is no natural inverse identity T\*ε\*L≅F on all Tate morphisms.

**Inputs:** `SheafTheoreticSmithTheory:normalized-parity`, `SheafTheoreticSmithTheory:integral-tate-hom`, `SheafTheoreticSmithTheory:parity-reduction`.

**Construction/proof.** Use uniqueness/classification of normalized generators and the Hom formula. Cross-negative-Hom leaves only nonnegative indices; index zero of a composite is the composite of index-zero parts. Show independence of choices of decompositions by natural isomorphism.

**Sources.**

- Feng24, §4.4 and diagram (4.3), p.22. Section 4.4 defines L by sending E_T(λ,L) to E(λ,L⊗k) and acting on morphisms by projection to the index-zero summand of (4.2). Diagram (4.3) records that L∘T\*ε\* is modular reduction.
- LL21, Theorem 5.6.6, p.25. Theorem 5.6.6 constructs this functor, with the composite relation to modular reduction, under the cross-negative-Hom hypothesis.

**API.**

- `parity_lift.object` (characterisation): L sends each normalized indecomposable to its k-parity lift.
- `parity_lift.hom` (characterisation): The Hom map is the degree-zero projection in the fixed comparison.
- `parity_lift.inflateReduction` (compatibility): L T\*ε\*≅k⊗^L_O on the ordinary normalized parity category, naturally on its morphisms.

**Uses.**

- Feng24 Definition 4.18: The lift is applied after Smith and the norm.
- Feng24 Lemma 4.24: Its loss of positive-index morphisms limits the integral comparison cube.

**Unit tests.**

1. `parity_lift.test_1` (degenerate): L takes the integral Tate unit at a point to k and preserves its scalar endomorphisms.
2. `parity_lift.test_2` (computation): A nonzero index-one morphism in the Tate Hom sum is sent to zero.
3. `parity_lift.test_3` (compatibility): For ordinary normalized parity morphisms α, L(T\*ε\*α)=Fα; this test does not assert fullness of T\*ε\*.

**Layer status:** planned.

- Open: G1, Uniform integral Smith theory over W(k).
- Open: G2, Étale modular Satake and parity transport.
- Open: G3, The good-prime parity-perversity engine.
- The exact supplier contracts in requests remain imports to be discharged; no implementation is claimed.

## ST.5. The norm and the base change functor

Identify the fixed Grassmannian of H^p with Gr_H, define the cyclic convolution norm and prove its normalized parity stalk/costalk criterion. Show Smith sends this norm to normalized integral Tate parity. Establish additivity and Frobenius semilinearity on morphisms through induced mixed terms. Specify the prime-field form, category twist and inverse-source-Frobenius linearization, then construct the additive k-linear BC functor using only ordinary parity reduction.

**Atlas planets:** The diagonal fixed Grassmannian; Cyclic convolution norm; Smith parity preservation; Categorical Tate diagonal; Frobenius linearization; Satake base change functor.

### The cyclic fixed Grassmannian is diagonal (`fixed-grassmannian`)

For G=H^p with σ rotating factors, Gr_G≅(Gr_H)^p and Gr_G^σ≅Gr_H by the diagonal map, as ind-schemes on test rings. The stratum indexed by (λ₁,…,λ\_p) meets this fixed locus exactly when all λ\_i are equal, in which case the intersection is Gr_H^λ. Its dimension is d_λ on H and p d_λ on G, so the two dimension pariversities agree for odd p.

**Inputs:** `SheafTheoreticSmithTheory:actions`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/bounded-strata-and-schubert-bounds`, `SheafTheoreticSmithTheory:coefficients`.

**Construction/proof.** Apply the product description of loop groups and positive loops to the fppf quotient; test-ring fixed points force all components equal. Use the imported dimension formula d_λ=⟨2ρ,λ⟩. Equality mod two is not equality of the integer shifts.

**Source:** Feng24, Lemma 4.11, p.24; §4.6.3, p.26. Lemma 4.11 identifies Gr_H with the σ-fixed subfunctor of Gr_G≅(Gr_H)^p through the diagonal. Section 4.6.3 shows that a Schubert cell of Gr_G meets Gr_H only for a constant tuple, where the intersection is the corresponding Schubert cell of H. For odd p the two dimension pariversities agree, by dim Gr^λ=⟨2ρ,λ⟩.

**Check.** For H=G_m the fixed coweight tuples are exactly (ν,…,ν). For a minuscule H-stratum of dimension 1, its p-fold source stratum has dimension p, hence equal parity for odd p but a different integer normalization.

### The cyclic convolution norm (`norm-functor`)

On the spherical symmetric monoidal category for G=H^p, define Nm(E)=E\*σE\*⋯\*σ^{p−1}E with σ-linearization given by cyclic rotation through the fusion symmetry. On maps take the corresponding product of the σ-translates of a map. Define it on all k-Satake objects and on O-flat normalized parity objects. It is a plain functor to the σ-equivariant category; it is neither additive nor O-linear before Smith projection.

**Inputs:** `SheafTheoreticSmithTheory:modular-satake`, `SheafTheoreticSmithTheory:parity-tilting`, `SheafTheoreticSmithTheory:fixed-grassmannian`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/global-hecke-stacks-and-convolution`.

**Construction/proof.** Use fusion associativity and the sign-corrected symmetry to construct the cyclic linearization and prove its p-th power is the identity. On normalized parity objects tensor closure under Satake gives closure of the convolution norm.

**Sources.**

- Feng24, Definition 4.12 and display (4.4), p.24. Definition 4.12 defines Nm(F) as the p-fold convolution of the σ-translates of F. Its σ-equivariant structure (4.4) comes from the commutativity constraint, and Feng constructs it in the perverse category before realizing it in the equivariant derived category.
- JMW16, Theorem 1.5, p.2. Theorem 1.5, from JMW14 Theorem 4.8, says convolution of parity complexes on the affine Grassmannian is parity. Section 4.6.3 uses this to see that Nm(F) is parity.

**API.**

- `norm_functor.rotate` (structure): Specify the C_p-equivariant structure and the coherence giving σ^p=1.
- `norm_functor.map` (functoriality): Nm preserves identities and composition with the product-of-maps formula.
- `norm_functor.perverseParity` (compatibility): For normalized O-parity E the norm is again a perverse parity object, with the stated cyclic action.
- `norm_functor.directSum` (relation): Nm(E⊕F)≅Nm(E)⊕Nm(F)⊕M, where M is a finite sum of objects induced from the trivial subgroup along the free cyclic orbits of mixed words (Feng §A.3).

**Uses.**

- Feng24 Lemmas 4.14–4.15: Supply the special cyclic stalk representations needed by Smith.
- Feng24 Appendix A.3: Mixed terms explain additivity only after passage to Tate.

**Unit tests.**

1. `norm_functor.test_1` (degenerate): For the convolution unit, Nm(1)=1 with trivial C_p-action.
2. `norm_functor.test_2` (non-example): Nm(a·id_E)=a^p·id_{Nm(E)}, so ordinary scalar linearity fails for general a∈k.
3. `norm_functor.test_3` (computation): Nm(E⊕F) contains the pure E and pure F terms and mixed cyclic orbits; before quotienting those mixed terms must remain.

### Trivial and free cyclic summands in norm stalks (`norm-stalks`)

For E a normalized O-parity object on Gr_{H^p}, the stalk and costalk cohomology of Nm(E) at every diagonal fixed point has a C_p-stable filtration whose associated graded is a direct sum of trivial O-free modules and free O[C_p]-modules. The statement here is restricted to the normalized Grassmannian parity objects used in BC. It does not assert the printed Lemma 4.14 for every integral Satake object.

**Inputs:** `SheafTheoreticSmithTheory:norm-functor`, `SheafTheoreticSmithTheory:parity-product`, `SheafTheoreticSmithTheory:tilting-tensor`.

**Construction/proof.** Decompose E into finite sums of external products of normalized parity extensions. For one external product, rotation and factorwise convolution give an external p-th power of a single parity object on H, whose finite free stalk and costalk cohomology have a Künneth basis. Cyclic permutation of basis tensors has orbits of size one or p. Koszul signs on a constant p-tuple multiply to +1 for odd p; on a length-p orbit absorb signs into a regular-module basis. Mixed summands from expanding a direct sum form induced cyclic orbits. No perverse filtration is pulled back through i\*, and Nm is never applied to an exact sequence as an additive functor.

**Source:** Feng24, Lemma 4.14 and its proof, pp.24–25. Lemma 4.14 states that, for F with free stalk and costalk cohomology, the fixed-point stalk and costalk cohomology of Nm(F) have σ-stable filtrations with trivial or free graded pieces. The decisive step is the external-product case: the stalk is a tensor induction, and a tensor basis splits into fixed and free σ-orbits. The node keeps that step and drops the filtration reduction (finding E26).

**Check.** For a stalk with O-basis e₀,e₁ and p=3, the eight tensor words form two fixed words and two free orbits. On an odd-degree basis vector the sign of the length-three cycle is +1. Mixed direct-sum summands are induced.

### Smith preserves parity with the cyclic stalk criterion (`smith-preserves-parity`)

Let Y be a finite-dimensional smooth-stratified JMW variety with tame admissible C_p-action preserving each relevant stratum. If E is an equivariant O-parity object and its fixed-point stalk and costalk cohomology have C_p-stable filtrations with trivial O-free or free O[C_p] graded pieces, then Psm(E) is Tate-parity for the induced strata and induced pariversity. Assume the induced fixed stratification is JMW for the classification/lifting applications. Applied to Nm on Gr_{H^p}, this produces normalized Tate parity on Gr_H.

**Inputs:** `SheafTheoreticSmithTheory:smith`, `SheafTheoreticSmithTheory:norm-stalks`, `SheafTheoreticSmithTheory:tate-exact-sequence`, `SheafTheoreticSmithTheory:tate-parity`, `EtaleDualityAndPerverseSheaves:EDC.3`, `SheafTheoreticSmithTheory:fixed-grassmannian`.

**Construction/proof.** For stalks use the trivial/free Tate formulas and the long exact sequence. For costalks use the !-presentation of Smith and the smooth-pair Gysin comparison. A tame finite-order automorphism has smooth fixed subschemes on a smooth stratum: formal lifting obstructions are averaged because p is invertible in F; its tangent is the fixed tangent subspace. The codimension purity shift is even. On the Grassmannian, p d_λ≡d_λ mod 2, while the difference of the two normalization shifts is even and hence disappears only in the Tate quotient.

**Source:** Feng24, Proposition 4.15, p.25; §4.6.3, p.26. Proposition 4.15, a variant of LL21 Theorem 6.1.1, says that Psm of a parity complex with smooth strata, whose fixed-point stalks and costalks have trivial-or-free filtrations, is Tate-parity for the induced stratification and pariversity. Its proof uses (4.1), the long exact sequence, Lemma 3.8 and the Gysin isomorphism for the smooth fixed strata. Section 4.6.3 applies it to Nm(F) on Gr_G.

**Check.** For the norm of a rank-one point sheaf, the fixed stalk is the trivial O-module and becomes the even Tate unit. A free orbit summand becomes zero. Compare the shifted dimension normalization for odd p explicitly.

**Open proof obligations:** G1, G2, G3.

### Additivity and Frobenius semilinearity on morphisms (`categorical-tate-diagonal`)

On the ordinary normalized O-parity category of Gr_G, D=Psm∘Nm takes values in normalized Tate parity and is additive on objects and morphisms: D(f+g)=D(f)+D(g) and D(a f)=ā^p D(f), for a∈O and ā its image in k. Its canonical biproduct identifications are natural in both arguments. In particular D kills p times every Hom group. Only ordinary source parity morphisms are asserted here, with their norm-generated equivariant morphisms in the intermediate category.

**Inputs:** `SheafTheoreticSmithTheory:norm-functor`, `SheafTheoreticSmithTheory:smith-preserves-parity`, `SheafTheoreticSmithTheory:integral-tate-hom`.

**Construction/proof.** Expand the p-fold tensor/convolution product for a biproduct and for (f+g) in the symmetric monoidal category. The two constant words give the pure terms. Since p is prime every other word has an orbit of length p. The mixed sum of morphisms factors through an induced C_p-object; on the fixed locus it is a transfer through a perfect/flat group-ring complex, hence zero after T\*. Verify this factorization on maps and its compatibility with composition, not only a direct-sum decomposition of objects. The scalar identity is the product of p copies of a; the integral Tate Hom formula reduces its action to ā^p. The factorization/coherence is a new proof target with these explicit steps, not a claim that Feng proves it.

**Source:** Feng24, §4.6.3, pp.26–27; §A.3, p.57. Section 4.6.3 factors L∘Psm∘Nm through the reduction equivalence before additivity on morphisms is available. Section A.3 proves additivity of BC on objects by expanding Nm of a sum into the pure terms plus free σ-orbits, which vanish in the Tate category. The morphism-level additivity and semilinearity stated here is the missing step of finding E27, from the PAPER-FENG-24 review.

**Check.** For p=3 check (f+g)^{⊗3}: the six mixed words form two transfers through induced objects. On a scalar a∈O the output scalar is ā³, and a=p gives zero. Perform this calculation on maps, not only objects.

### Frobenius twists and linearization of categories (`frobenius-category`)

For a k-linear category C define C^(p) with the same objects and Hom_C(X,Y)⊗\_{k,Frob}k, composition induced by tensor product. The tautological functor Fr_C is Frobenius-semilinear and has the universal property for such functors into k-linear categories. If a specific F_p-form C₀ and scalar-extension equivalence are given, define Fr_{C₀}:C→C by fixing C₀ and applying Frobenius to scalars. A Frobenius-semilinear functor D:C→E is linearized by D∘Fr_{C₀}^{−1}. The form is data, not an automatic choice for any k-linear category.

**Inputs:** `mathlib:frobeniusEquiv`, `SheafTheoreticSmithTheory:coefficients`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Construction/proof.** Base-change each Hom space and its bilinear composition. Prove the universal property, then use perfectness of k and the supplied form to identify the twist with C. Keep the inverse Frobenius on the source.

**Source:** Feng24, Construction 4.17 and display (4.6), pp.26–27. Construction 4.17 defines the Frobenius twist C^(p) of a k-linear category by twisting its Hom spaces, and proves its universal property for Frobenius-semilinear functors. Given an F_p-form as in (4.6), it defines the semilinear self-equivalence Frob_{F_0}.

**API.**

- `frobenius_category.universal` (universal-property): Frobenius-semilinear functors C→E correspond to k-linear functors C^(p)→E.
- `frobenius_category.formEquivalence` (equivalence): A specified F_p-form gives the semilinear self-equivalence with a specified inverse.
- `frobenius_category.linearize` (compatibility): D∘Fr_{C₀}^{−1} is k-linear and has the same underlying object assignment up to the form identification.

**Uses.**

- Feng24 Definition 4.18: Remove the scalar p-th power created by Nm.
- Feng24 Construction 5.17: The algebra version has the same orientation.

**Unit tests.**

1. `frobenius_category.test_1` (computation): In the one-object category with endomorphism algebra k, the tautological map sends a scalar to its Frobenius image after the form identification.
2. `frobenius_category.test_2` (computation): Over k=F₉ choose a∉F₃; precomposing D(a·id)=a³D(id) with inverse Frobenius makes the result a·id.
3. `frobenius_category.test_3` (non-example): Changing the F_p-form changes the chosen self-equivalence data; without a form only C^(p) is canonical.

### The prime-field form of normalized parity (`satake-prime-field-form`)

The ordinary normalized k-parity category on Gr_G has a specified F_p-form compatible with Satake and the integral split dual group. On each finite Schubert support, scalar extension on Hom and the normalized generators gives the form; the resulting semilinear Frobenius equivalence is compatible with tensor/convolution, pullback by geometric automorphisms and the normalized constant terms. A field-of-definition assertion for all arbitrary étale sheaves is unnecessary.

**Inputs:** `SheafTheoreticSmithTheory:parity-reduction`, `SheafTheoreticSmithTheory:modular-satake`, `ReductiveGroupsPartII:RG2.5/langlands-dual-group`, `SheafTheoreticSmithTheory:frobenius-category`.

**Construction/proof.** Use the F_p-Chevalley dual group and its tilting generators, then transport the form through Satake. Check scalar extension on finite-support Hom and descent of the normalized parity generators. This must agree with the geometric form on the norm/Smith construction and its automorphism actions; the comparison is included in G2.

**Source:** Feng24, display (4.6), p.27; the paragraph after Definition 4.18, p.27. After Definition 4.18, Feng takes the F_p-form F_0 of Parity^0_{L^+G}(Gr_G;k) from D(Gr_G;k)≅D(Gr_G;F_p)⊗k, and defines Frob_p as the associated semilinear equivalence of Construction 4.17.

**Check.** For a torus generator with rank-one endomorphisms, the chosen form acts by a↦a^p on scalars. Over F₉ a scalar outside F₃ checks the form and its inverse; over F_p it is invisible.

**Open proof obligation:** G2.

### The linear base change functor (`base-change-functor`)

For G=H^p and odd p good for Ĥ, define BC^(p):Parity^0_{(L^+G)}(Gr_G;k)→Parity^0_{(L^+H)}(Gr_H;k) by descending L Psm Nm through ordinary reduction. Its Hom map is Frobenius-semilinear. Define BC=BC^(p)∘Fr_{source,F_p}^{−1}; this is k-linear and additive. Use ordinary orbit-constructible morphisms, with the proven equivariant realizations and only norm-generated intermediate C_p-morphisms. The source of descent is not the falsely asserted full C_p-equivariant reduction category.

**Inputs:** `SheafTheoreticSmithTheory:categorical-tate-diagonal`, `SheafTheoreticSmithTheory:parity-lift`, `SheafTheoreticSmithTheory:parity-reduction`, `SheafTheoreticSmithTheory:satake-prime-field-form`.

**Construction/proof.** Additivity and annihilation of p Hom groups let L Psm Nm factor through O-Hom tensor k. The valid non-equivariant reduction equivalence gives the functor, uniquely up to natural isomorphism. Use the selected prime-field form to cancel Frobenius on source maps. Independence of integral lifts follows from full faithfulness of the reduced ordinary Hom functor.

**Source:** Feng24, Definition 4.18 and diagram (4.7), p.27; §A.5, p.60. Definition 4.18 defines BC^(p) as the unique functor filling (4.7) through modular reduction, and BC as BC^(p)∘Frob_p^{-1}. Section A.5 checks the scalar behaviour but prints the composition in the other order (finding E33).

**API.**

- `base_change_functor.descentSquare` (compatibility): BC^(p)F≅L Psm Nm naturally for ordinary integral parity morphisms.
- `base_change_functor.linear` (structure): BC is additive and k-linear with the inverse Frobenius applied on the source.
- `base_change_functor.choiceIndependence` (universal-property): Changing integral lifts yields canonically isomorphic descent functors through the ordinary reduction equivalence.

**Uses.**

- Feng24 Theorem 4.20: The geometric functor to compare with diagonal restriction.
- Feng24 Lemma 4.22: Its universal descent square supplies Galois equivariance.

**Unit tests.**

1. `base_change_functor.test_1` (characterisation): BC preserves zero objects and biproducts with natural inclusions and projections.
2. `base_change_functor.test_2` (computation): BC(a·f)=a·BC(f), including a∈F₉\F₃; before linearization BC^(p)(a·f)=a^pBC^(p)(f).
3. `base_change_functor.test_3` (non-example): Replacing the source by arbitrary C_p-equivariant parity objects fails the augmentation-ideal Hom test and is forbidden.

**Layer status:** planned.

- Open: G1, Uniform integral Smith theory over W(k).
- Open: G2, Étale modular Satake and parity transport.
- Open: G3, The good-prime parity-perversity engine.
- The exact supplier contracts in requests remain imports to be discharged; no implementation is claimed.

## ST.6. Constant terms and diagonal restriction

Construct equal-characteristic monodromic hyperbolic localization and normalized constant terms, including extreme semi-infinite intersections. Prove the CT/Satake, CT/Smith and CT/lifting squares on objects and morphisms. Compute torus BC. Obtain equality of tilting characters and isomorphism classes under diagonal restriction, then state the additional root-group/naturality obligation G5 needed for the natural isomorphism Sat_H BC≅Res_Δ Sat_G of Feng Theorem 4.20.

**Atlas planets:** Hyperbolic constant terms; Satake constant term comparison; Torus base change; Feng base change theorem.

### Hyperbolic localization and equal-characteristic constant terms (`hyperbolic-localization`)

Choose B_H⊃T_H and a regular dominant cocharacter κ:G_m→T_H. On Gr_H the κ-attractors are S_ν with inclusions i_ν:S_ν→Gr_H and retractions p_ν:S_ν→{t^ν}. For bounded-support κ-monodromic étale complexes define CT_H=⊕\_ν Rp_{ν!}i_ν\*, calculated on bounded Schubert supports, and CT_H^norm at ν by [⟨2ρ\_H,ν⟩]. Here monodromic means in the triangulated subcategory generated by objects coming from κ-equivariant derived sheaves; an invariant support alone does not suffice. Define the repelling version as well and prove its natural agreement on this domain. Coefficients are k and O with the compatible adic conditions.

**Inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/bounded-strata-and-schubert-bounds`, `EtaleDualityAndPerverseSheaves:EDC.0`, `SheafTheoreticSmithTheory:lft-compact-support`, `SheafTheoreticSmithTheory:tate-six-operations`.

**Construction/proof.** Use the imported loop/Schubert geometry but construct these equal-characteristic modular functors here. Apply Braden’s natural transformation on equivariant linear/projective ambient models containing each bounded piece; the contraction lemma and open–closed localization prove it invertible on weakly equivariant generators, then on their triangulated closure. Patch bounded supports and finite coefficient levels, using G1/G2 for O. The normalized shift convention is positive [⟨2ρ,ν⟩], so weight cohomology is in degree zero.

**Sources.**

- Feng24, §A.4, display (A.1) and Remark A.1, p.58. Section A.4 fixes a regular σ-invariant cocharacter and defines CT_G as the sum over ν of Rp_ν!i_ν^\* on G_m-monodromic sheaves, with its normalized shift by ⟨2ρ,ν⟩. Display (A.1) says the shifted constant terms are t-exact and correspond to restriction to the dual torus. Remark A.1 says the modular equal-characteristic case is not completely documented.
- MV07, §3: Theorem 3.2, p.9; Theorems 3.5–3.6, pp.10–11. Section 3 constructs the semi-infinite orbits and their intersections with Schubert cells (Theorem 3.2). Theorem 3.5 shows compactly supported cohomology along S_ν is concentrated in degree ⟨2ρ,ν⟩ and agrees with the costalk version along the opposite orbit. Theorem 3.6 assembles these weight functors into the cohomology functor.
- Braden03, Theorem 1, p.2; Lemma 6, p.5. Theorem 1 says that for a normal variety with a G_m-action and a weakly equivariant complex, the natural map between the attracting and repelling hyperbolic localizations is an isomorphism. Lemma 6 is the contraction lemma used in its proof. Page 2 shows by an example on C² with weights (1,−1) that some equivariance hypothesis is needed.

**API.**

- `hyperbolic_localization.weight` (characterisation): The ν-component is RΓ\_c(S_ν,i_ν\*E)[⟨2ρ,ν⟩].
- `hyperbolic_localization.braden` (equivalence): The attracting !\* and repelling \*! descriptions agree naturally on the monodromic domain.
- `hyperbolic_localization.boundedSupport` (compatibility): Definitions agree on nested finite Schubert supports and commute with permitted coefficient change.

**Uses.**

- Feng24 Lemma A.2: Reduce Smith base change to its torus weight functors.
- Feng24 Lemma A.3: Detect a maximal supported Schubert stratum.

**Unit tests.**

1. `hyperbolic_localization.test_1` (degenerate): For a split torus ρ=0 and the attracting loci are points; CT is the identity on its finite-supported sheaf category.
2. `hyperbolic_localization.test_2` (computation): For the spherical unit supported at t^0, CT^norm has just the zero-weight copy of Λ in degree zero.
3. `hyperbolic_localization.test_3` (non-example): A sheaf supported on the non-invariant diagonal in A² with weights (+1,−1) need not have equal attracting and repelling localizations; monodromicity is required.

**Open proof obligations:** G1, G2.

### Semi-infinite intersections at extreme weights (`extreme-orbits`)

For dominant λ and the chosen positive Borel, S_{w₀λ}∩Gr_H^λ is the single point t^{w₀λ}. If S_{w₀λ} meets Gr_H^μ with μ dominant in the same component, then λ≤μ in the dominance order. More generally the weights in Gr_H^μ lie in the Weyl-polytope of μ, and the intersection dimension is ⟨ρ,μ+ν⟩. These are scheme/étale-geometric statements on finite Schubert pieces, not formal consequences of a B_dR^+ Satake result.

**Inputs:** `SheafTheoreticSmithTheory:hyperbolic-localization`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/bounded-strata-and-schubert-bounds`.

**Construction/proof.** Compute the antidominant intersection using loop-unipotent factorization; the opposite positive loops fix its coweight point. Use the Schubert order and torus weight polytope for the support exclusion. Apply the equal-characteristic base-change/étale transport in G2.

**Sources.**

- MV07, Theorem 3.2, display (3.6) and the paragraph after it, p.9. Theorem 3.2 says S_ν∩Gr^λ is nonempty exactly when ν is a weight of the irreducible representation of highest weight λ, and then has pure dimension ⟨ρ,λ+ν⟩. Display (3.6) computes S_ν∩Gr^ν in the dominant and antidominant cases, where it is a single point for antidominant ν. The following paragraph applies this to the extreme weights ν=λ and ν=w_0λ.
- Feng24, proof of Lemma A.3, p.61. The proof of Lemma A.3 uses that S_{w_0λ} meets Gr^λ\_H in the single point t^{w_0λ}, citing Baumann–Riche.

**Check.** For H=GL₂ and λ=(1,0), the antidominant semi-infinite intersection with the minuscule P¹ is one point. Its dimension from ⟨ρ,λ+w₀λ⟩ is zero; a larger Schubert support cannot be excluded without dominance.

**Open proof obligation:** G2.

### Normalized constant term is restriction to the dual torus (`constant-term-satake`)

CT_H^norm is exact on the k-Satake heart and sends O-flat Satake objects to O-free finite-supported weight modules. It is symmetric monoidal and corresponds under modular Satake to Res_{T̂\_H}^{Ĥ}. It preserves normalized parity, where a torus parity object is a finite sum of point-supported coefficient modules in degree zero. Its construction and natural transformations commute with the relevant coefficient extensions.

**Inputs:** `SheafTheoreticSmithTheory:hyperbolic-localization`, `SheafTheoreticSmithTheory:extreme-orbits`, `SheafTheoreticSmithTheory:modular-satake`, `SheafTheoreticSmithTheory:parity-tilting`.

**Construction/proof.** Use the semi-infinite dimension estimate and the perverse stalk/costalk inequalities to concentrate ν-cohomology in degree ⟨2ρ,ν⟩. Braden’s comparison identifies the two bounds. Fusion gives the convolution tensor decomposition of weight spaces, including the symmetry sign correction. During reconstruction of the dual group these weight functors define its torus, giving the claimed natural restriction comparison.

**Sources.**

- MV07, Theorems 3.5–3.6 and Corollary 3.7, pp.10–12; Propositions 6.3–6.4, pp.20–21. Theorems 3.5–3.6 give the weight functors on the spherical perverse category with arbitrary Noetherian coefficients of finite global dimension. Corollary 3.7 shows global cohomology is exact and faithful. Propositions 6.3–6.4 show that total cohomology and its weight grading are tensor functors for convolution.
- Feng24, display (A.1) and Remark A.1, p.58. Remark A.1 explains that the intertwining (A.1) of shifted constant terms with restriction to the dual torus is built into the identification of the Tannakian group. It is documented for the complex and B_dR^+ Grassmannians but not for the equal-characteristic modular one.

**Check.** For the minuscule GL₂ representation, normalized CT gives its two one-dimensional torus weights in degree zero. On the unit only weight zero remains. Tensor convolution gives the usual sum of weights.

**Open proof obligations:** G1, G2, G3.

### Smith commutes with normalized constant term (`constant-term-smith`)

For G=H^p, take the diagonal κ-action commuting with cyclic rotation. On the bounded monodromic equivariant domains there is a natural equivalence CT_H^norm Psm≅Psm CT_G^norm in integral and mod-p Tate categories. Under the diagonal identification a fixed weight is (ν,…,ν); the G-shift p⟨2ρ\_H,ν⟩ differs from the H-shift by the even integer (p−1)⟨2ρ\_H,ν⟩. Use the fixed categorical periodicity isomorphism to compare them.

**Inputs:** `SheafTheoreticSmithTheory:smith-pushforward`, `SheafTheoreticSmithTheory:tate-six-operations`, `SheafTheoreticSmithTheory:hyperbolic-localization`, `SheafTheoreticSmithTheory:fixed-grassmannian`, `SheafTheoreticSmithTheory:tate-periodicity`.

**Construction/proof.** On each attracting correspondence use pullback compatibility and the compact-support Smith theorem. Restrict to fixed weights and track the componentwise normalization shifts through the chosen periodicity class. Check coherence on maps and nested supports; equality of parities by itself is not a natural isomorphism.

**Source:** Feng24, Appendix A.1, pp.56–57; display (A.2), p.58. Using the compatibilities of Psm with pullback and pushforward from A.1.1–A.1.2, Feng states diagram (A.2): Smith intertwines CT_G and CT_H. He adds that this survives the degree shifts by the parity calculation of §4.6.3.

**Check.** At a diagonal weight ν, compute p⟨2ρ,ν⟩−⟨2ρ,ν⟩ explicitly and use the chosen two-periodicity generator. For a torus all shifts vanish. An arbitrary nonfixed weight has no fixed-locus contribution.

**Open proof obligations:** G1, G2.

### Constant terms, lifting and base change (`constant-term-lifting`)

On normalized integral Tate parity objects of Gr_H, CT_H^norm commutes naturally with L after passage to the normalized torus parity category. Consequently CT_H^norm BC≅BC_T CT_G^norm naturally on ordinary normalized k-parity objects. The proof must use the graded Hom formula with composition and coefficient-change compatibility, rather than essential surjectivity of T\*ε\* alone.

**Inputs:** `SheafTheoreticSmithTheory:constant-term-satake`, `SheafTheoreticSmithTheory:constant-term-smith`, `SheafTheoreticSmithTheory:parity-lift`, `SheafTheoreticSmithTheory:integral-tate-hom`, `SheafTheoreticSmithTheory:base-change-functor`.

**Construction/proof.** For inflated ordinary parity objects compare both composites with ordinary reduced CT. Under integral-tate-hom the normalized CT map preserves the integer index, because the construction commutes with coefficients and the periodicity class. Its target is a finite sum of point-supported degree-zero modules, so positive-index ordinary Hom there is zero. Projection to index zero therefore commutes with CT on every Tate morphism. Extend across decompositions by naturality, then use the full ordinary reduction equivalence for BC, tensor compatibility for Nm and the fixed prime-field form. This avoids asserting that inflation is full. G2 includes proving the stated graded comparison in the étale realization.

**Source:** Feng24, Lemma A.2 and its proof, diagrams (A.3)–(A.5), pp.59–60. Lemma A.2 states that four side faces of cube (A.3) commute. Its proof handles the front face through (A.4) and the right square of (A.5). It deduces the latter from the caps (4.3), essential surjectivity of inflation and the morphism formula (4.2), without carrying out the morphism-level check that this node states (finding E35).

**Check.** For normalized torus objects, Hom(E,F[2i]) is zero for i>0 and i<0. Check that the image of the P¹ positive-index Tate class is killed on the torus, using graded CT compatibility; objectwise essential surjectivity cannot replace this test.

**Open proof obligations:** G2, G3.

### Base change for a split torus on objects and maps (`torus-base-change`)

For H a split torus with cocharacter lattice X_\*(H), BC takes the point object at (ν₁,…,ν\_p) on Gr_{H^p} to the point object at ν₁+⋯+ν\_p on Gr_H. On a scalar endomorphism a it acts by a after inverse Frobenius, not a^p. On arbitrary finite sums its action is the corresponding matrix/block map. Under torus Satake this is naturally diagonal restriction.

**Inputs:** `SheafTheoreticSmithTheory:base-change-functor`, `SheafTheoreticSmithTheory:constant-term-satake`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.

**Construction/proof.** The norm sums the p coweights in every factor and fixed restriction is the diagonal point. Compute the norm on scalar maps as a^p, then precompose source inverse Frobenius. Torus rational representations decompose by weights; additivity extends the scalar computation to all matrices and yields naturality.

**Source:** Feng24, §A.5, p.60. Section A.5 reduces to H=G_m. It computes Nm of the constant sheaf at (n_1,…,n_p) as the constant sheaf at the diagonal sum, and its fixed restriction as the point sheaf at n_1+⋯+n_p. It then checks that a scalar λ becomes λ^p before inverse Frobenius restores λ.

**Check.** For H=G_m, p=3 and coweights (2,−1,4), the output is weight 5. A scalar a∈F₉ outside F₃ is unchanged after linearization; without inverse Frobenius it becomes a³.

### Objectwise diagonal restriction (`base-change-characters`)

For every normalized k-parity object E on Gr_{H^p}, Sat_H(BC(E)) and Res_Δ(Sat_G(E)) have naturally identified T̂\_H-restrictions, once constant-term-lifting has been proved. Therefore their characters agree and the two tilting objects are isomorphic. This conclusion alone does not produce an Ĥ-equivariant natural isomorphism of functors.

**Inputs:** `SheafTheoreticSmithTheory:constant-term-lifting`, `SheafTheoreticSmithTheory:torus-base-change`, `SheafTheoreticSmithTheory:tilting-tensor`.

**Construction/proof.** Apply normalized constant terms and the torus functor comparison. Triangular tilting characters then determine the object isomorphism class. State separately which weight comparison is natural; no lifting of weight-space maps is inferred from faithfulness.

**Source:** Feng24, Theorem 4.20, pp.27–28; §§A.4–A.5, pp.58–60. Theorem 4.20 asserts that BC commutes with diagonal restriction under the parity–tilting equivalences. Section A.4 reduces this to the torus case, using Lemma A.2 and Donkin's result that tilting modules are determined by their characters; §A.5 treats the torus. The node keeps the objectwise conclusion that this argument does give.

**Check.** For source external tiltings T(λ₁)⊠⋯⊠T(λ\_p), the output character is the product of the factor characters. This identifies its tilting isomorphism class and its torus weights, while leaving equivariance of the chosen comparison open.

**Open proof obligations:** G2, G3.

### Equivariance of the base change comparison maps (`reductive-comparison-maps`)

Construct, for every tilting V of Ĥ^p, an invertible Ĥ-equivariant map α\_V:Sat_H BC Sat_G^{-1}(V)→Res_Δ V whose restriction to T̂\_H is the natural torus/constant-term comparison and for which α\_W BC(f)=Res_Δ(f) α\_V for every tilting morphism f:V→W. The exact missing assertion is equivariance of the existing weight-space comparison, not equality of tilting characters.

**Inputs:** `SheafTheoreticSmithTheory:base-change-characters`, `SheafTheoreticSmithTheory:constant-term-lifting`, `SheafTheoreticSmithTheory:torus-base-change`, `SheafTheoreticSmithTheory:tilting-category`.

**Construction/proof.** G5: prove that the weight comparison intertwines each simple-root subgroup of Ĥ, for example by constructing compatible rank-one Levi comparisons and their Chevalley generators. Then the torus and root subgroups generate Ĥ, so components are Ĥ-equivariant; their weight-level naturality proves naturality. A complete rank-one compatibility argument is not located in the read source and is not claimed here. Alternatively supply a direct tensor/fibre-functor construction with the same normalized components.

**Source:** Feng24, §A.4, the paragraph after the proof of Lemma A.2, p.60. This paragraph deduces the top face of (A.3) from the bottom face, by faithfulness of restriction to the dual torus and character determination of tilting modules. That step does not produce Ĥ-equivariant comparison maps (finding E34); constructing them is the target here.

**Check.** For dual SL₂, verify the comparison commutes with the upper and lower root subgroup operators as well as the diagonal torus. A diagonal weight-space automorphism with unequal scalar entries supplies a torus-intertwiner that need not pass this test.

**Open proof obligation:** G5.

### Feng’s Satake base change theorem (`feng-base-change`)

For separably closed F of characteristic different from p, H connected reductive, G=H^p with cyclic rotation, k=Fbar_p, and odd p good for Ĥ, the k-linear additive functor BC on normalized Grassmannian parity objects corresponds, under modular Satake and the parity–tilting equivalences, to restriction along the diagonal Ĥ→Ĥ^p. The comparison is an isomorphism of functors, natural in every tilting morphism. The plan for this endpoint depends on the open equivariance target G5.

**Inputs:** `SheafTheoreticSmithTheory:reductive-comparison-maps`, `SheafTheoreticSmithTheory:parity-tilting`, `SheafTheoreticSmithTheory:base-change-functor`, `SheafTheoreticSmithTheory:tilting-tensor`, `ReductiveGroupsPartII:RG2.5/dual-isogenies-and-products`.

**Construction/proof.** After G5 supplies actual equivariant comparison components, use their naturality and invertibility to identify the functors. Diagonal restriction lands in tiltings by tensor closure. The torus and objectwise results are established as separate weaker targets, so this final theorem is not silently substituted by a character identity.

**Source:** Feng24, Theorem 4.20 and footnote 11, pp.27–28; Appendix A, pp.56–61. Theorem 4.20 states that BC corresponds, under the parity–tilting Satake equivalences, to restriction along the diagonal Ĥ→Ĝ; footnote 11 explains why diagonal restriction preserves tilting modules. Appendix A, by Feng and Lonergan, gives the proof.

**Check.** For H a torus, recover the full natural formula already proved in torus-base-change. For dual SL₂ and an external product of standard tiltings, require intertwining of both root subgroups on every component; equality of characters is insufficient.

**Open proof obligations:** G2, G3, G5.

**Layer status:** planned.

- Open: G1, Uniform integral Smith theory over W(k).
- Open: G2, Étale modular Satake and parity transport.
- Open: G3, The good-prime parity-perversity engine.
- Open: G5, A natural dual-group-equivariant comparison.
- The exact supplier contracts in requests remain imports to be discharged; no implementation is claimed.

## ST.7. Exactness, descent and integral comparison

Prove CT conservative on the constructible monodromic k-Tate domain, and the exact-triangle property of Smith composed with norm on short exact Satake sequences. Construct continuous equivariantization and the Galois compatibility of BC, with a genuinely equivariant natural comparison required for L-group descent. Retain the valid objectwise integral comparison and separately require its natural norm-image version G4; do not claim a natural identity on all integral Tate maps.

**Atlas planets:** Conservativity of Tate constant terms; Exactness of the Smith norm; Galois equivariantization; Coefficient comparison cube.

### Conservativity of Tate constant terms (`constant-term-conservative`)

On the κ-monodromic orbit-constructible k-coefficient Tate category of Gr_H with finite Schubert support, CT_H^norm is conservative: CT(K)=0 implies K=0, hence CT detects equivalences. Extend to an ind object only when the support argument or a filtered-piece detection theorem applies; the finite-support result is enough for exactness of a fixed finite-dimensional Satake sequence.

**Inputs:** `SheafTheoreticSmithTheory:hyperbolic-localization`, `SheafTheoreticSmithTheory:extreme-orbits`, `SheafTheoreticSmithTheory:tate-categories`.

**Construction/proof.** Choose a maximal dominant λ among the finitely many strata supporting K. The support exclusion and extreme point calculation identify its lowest-weight constant term with the stalk at t^{w₀λ}; all other supported strata are excluded. Orbit constructibility and homogeneity show this stalk cannot vanish if K is nonzero on that stratum. Apply to a cone to detect isomorphisms.

**Source:** Feng24, Lemma A.3, p.61. Lemma A.3 states that CT on the constructible orbit-stratified k-Tate category of Gr_H is conservative. The proof chooses a maximal supported stratum and evaluates at its antidominant fixed point. The proof is phrased for the ind-constructible category although the statement concerns the constructible one (finding E36).

**Check.** For a nonzero finite-support Tate object choose a maximal supported Schubert stratum and its antidominant point; CT detects that restriction. The zero object is detected as zero. Do not infer conservativity from faithfulness of a representation forgetful functor.

**Open proof obligation:** G2.

### Exactness of the mod-p Smith norm on Satake (`norm-smith-exact`)

For every short exact sequence 0→V′→V→V″→0 in finite-dimensional rational Rep_k(Ĥ^p), the sequence obtained by Fr^{-1}, geometric Satake, Nm and Psm is a distinguished triangle in the constructible k-Tate category, with the comparison from the cone to the third term specified by the enhanced construction. This is an exactness assertion for the composite into the Tate quotient, not exactness of Nm as an additive functor before quotienting.

**Inputs:** `SheafTheoreticSmithTheory:constant-term-conservative`, `SheafTheoreticSmithTheory:constant-term-smith`, `SheafTheoreticSmithTheory:constant-term-satake`, `SheafTheoreticSmithTheory:categorical-tate-diagonal`, `SheafTheoreticSmithTheory:norm-functor`.

**Construction/proof.** Construct the cone comparison using the functorial p-cube associated to the two maps and their canonical zero composite in the perverse heart; this avoids an arbitrary cone comparison. Apply CT, which is symmetric monoidal, commutes with Smith and detects equivalences on the finite support. The representation sequence splits after restriction to a torus. Mixed cyclic terms vanish in the Tate quotient, so the torus case reduces to additive split exactness.

**Source:** Feng24, Lemma 4.21, p.28; §A.6, p.61. Lemma 4.21 states that the composite of inverse Frobenius, Satake, Nm and Psm sends exact sequences of representations to exact triangles in the Tate category. Section A.6 proves it with Lemma A.3, the constant-term compatibility and the splitting of torus representations, reducing to additivity.

**Check.** For a split short exact sequence of torus representations, mixed terms form free cyclic orbits and the image triangle splits. For a nonsplit rational reductive sequence, CT makes it split; conservativity detects the enhanced cone comparison.

**Open proof obligations:** G1, G2.

### Continuous equivariantization of the parity category (`equivariantization`)

For a discrete group Γ acting coherently on an additive category C, define C^{BΓ} by objects with maps u_γ:γE→E satisfying the cocycle law and morphisms commuting with every u_γ. For profinite Γ and the k-parity categories here require continuity on the finite coefficient/support data; formulate O-descent as a compatible adic system. A coherently Γ-equivariant functor induces a functor of these equivariantizations. For enhanced derived sheaves use homotopy-coherent descent before taking the desired parity subcategory: fixed objects of an ordinary derived homotopy category are not asserted to equal the equivariant derived category.

**Inputs:** `SheafTheoreticSmithTheory:equivariant-derived`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

**Construction/proof.** Write the cocycle and intertwining conditions, including coherent structure of the group action. For arithmetic descent work with continuous finite-level Galois descent and its enhancement; then restrict to the parity objects with descent data.

**Source:** Feng24, §4.6.4, p.28. Section 4.6.4 uses equivariantization in the sense of Drinfeld–Gelaki–Nikshych–Ostrik to pass from a Γ-equivariant functor to a functor between categories of Γ-equivariant objects. It stresses that equivariantizing a derived category differs from taking the equivariant derived category.

**API.**

- `equivariantization.forget` (projection): The forgetful functor retains an object of C and exposes each descent map.
- `equivariantization.cocycle` (characterisation): u_{γδ}=u_γ∘γ(u_δ), using the coherence isomorphisms of the action.
- `equivariantization.mapFunctor` (functoriality): A coherently Γ-equivariant functor sends descent data to descent data and intertwining maps to intertwining maps.

**Uses.**

- Feng24 Lemma 4.22 and Corollary 4.23: Pass BC and a genuinely equivariant natural comparison to nonsplit arithmetic forms.

**Unit tests.**

1. `equivariantization.test_1` (degenerate): For Γ trivial, C^{BΓ}≅C.
2. `equivariantization.test_2` (compatibility): For a trivial action on finite-dimensional k-vector spaces and finite Γ, equivariant objects are actual k[Γ]-representations and intertwining maps.
3. `equivariantization.test_3` (non-example): For profinite Γ a discontinuous abstract action on a discrete finite-dimensional space is excluded even if its abstract cocycle equations hold.

### Galois equivariance and descent of base change (`base-change-galois`)

Let H descend to F₀⊂F and G=Res_{E₀/F₀}(H_{E₀}) for a cyclic degree-p extension E₀/F₀. After choosing a geometric splitting G_F≅H_F^p, Γ=Gal(F/F₀) acts compatibly with the cyclic norm construction. BC is coherently Γ-equivariant on normalized k-parity objects with the chosen prime-field form. If the natural Ĥ-comparison of feng-base-change is proved Γ-equivariant as well, its equivariantization identifies the descended BC with restriction along the diagonal map of geometric L-groups, with the same cyclotomic normalization on both sides.

**Inputs:** `SheafTheoreticSmithTheory:equivariantization`, `SheafTheoreticSmithTheory:base-change-functor`, `ReductiveGroupsPartII:RG2.0a/weil-restriction-separable-splitting`, `ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group`, `SheafTheoreticSmithTheory:feng-base-change`.

**Construction/proof.** Reuse separable Weil-restriction splitting and the integral dual Galois action. Norm, fixed restriction, coefficient change and the chosen lifting/Frobenius comparisons commute with Γ. Descend using the full ordinary parity reduction equivalence and check the cocycle, not only a family of object isomorphisms. For the L-group comparison require the components in G5 to respect Γ; character equality is insufficient.

**Source:** Feng24, Lemma 4.22, p.28; Corollary 4.23, p.29. Lemma 4.22 shows BC is Aut(F/F_0)-equivariant for a cyclic Weil-restriction setup, since its constituents are. Corollary 4.23 equivariantizes Theorem 4.20 to identify the descended BC with restriction between tilting categories of geometric L-groups.

**Check.** For trivial Γ recover BC. For a cyclic permutation of geometric Weil-restriction factors, check the descent cocycle around the full orbit. A family of object isomorphisms without a cocycle is not descent.

**Open proof obligations:** G2, G5.

### The valid objectwise integral comparison (`integral-comparison-objects`)

Let F_T:Perf_S(Y;TO)→Perf_S(Y;Tk) be derived coefficient reduction, and I_k=T\*ε\*\_k:D^b_S(Y;k)→Perf_S(Y;Tk). For a normalized integral Tate-parity object K, there is an object isomorphism I_k L(K)≅F_T(K). It is natural on morphisms arising by inflation of ordinary normalized O-parity morphisms. It is not claimed natural on every Tate morphism. Smith commutes naturally with coefficient reduction on its valid domain, without using this stronger false right face.

**Inputs:** `SheafTheoreticSmithTheory:parity-lift`, `SheafTheoreticSmithTheory:integral-tate-hom`, `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action`, `SheafTheoreticSmithTheory:smith`.

**Construction/proof.** Choose the ordinary parity generator for K and use L T\*ε\*≅F; extend to finite sums. Ordinary inflated maps occupy index zero, where the comparison is natural. In the GL₂ minuscule closed Schubert variety P¹ with E=O[1], the class H²(P¹;k) gives an index-one Tate morphism: L kills it, whereas coefficient reduction to the k-Tate category retains it. Thus essential surjectivity cannot promote the object comparison to a natural transformation on all Tate maps.

**Source:** Feng24, Lemma 4.24 and diagrams (4.8)–(4.10), pp.29–30. Lemma 4.24 asserts that the cube (4.8), relating integral and mod-p parity, Tate and derived categories, commutes. The proof of its right face reduces to the image of the left column, which is not full there (finding E29). The node keeps the objectwise statement and naturality for inflated ordinary maps.

**Check.** On the integral Tate unit the comparison is the coefficient quotient O→k. On P¹ with E=O[1], the object comparison holds while a nonzero index-one endomorphism disproves its naturality on every Tate map.

### The integral comparison on norm-generated morphisms (`norm-image-comparison`)

For D=Psm Nm on ordinary normalized O-parity objects, construct coherent object identifications F_T D(E)≅I_k L D(E) that intertwine F_T D(f) with I_k L D(f) for every ordinary parity morphism f, and are compatible with reduction and inverse Frobenius. This gives the natural back-face comparison needed by the global Tate-cohomology consumer. Only the norm-generated maps are in this target; arbitrary integral Tate maps are excluded.

**Inputs:** `SheafTheoreticSmithTheory:integral-comparison-objects`, `SheafTheoreticSmithTheory:categorical-tate-diagonal`, `SheafTheoreticSmithTheory:base-change-functor`.

**Construction/proof.** G4: control the positive-index terms of D(f) in the integral Tate Hom formula relative to coherent choices of the normalized lifts. A sufficient condition is that norm-generated morphisms have only index zero; a weaker sufficient condition is that all remaining terms are killed by F_T. Neither follows from objectwise normalization or from additivity. Supply a proof of one such condition, or a direct comparison natural in f. The P¹ counterexample prevents using the printed full-cube argument.

**Source:** Feng24, Lemma 4.24, pp.29–30; proof of Proposition 5.12(i), p.39. The proof of Proposition 5.12(i) uses the back face of cube (4.8) as a natural isomorphism of functors on tilting modules. That is the norm-image comparison targeted here (gap G4).

**Check.** Use an ordinary source morphism f, expand Psm Nm(f) in the graded Hom formula, and check the proposed square term by term. Arbitrary positive-index Tate endomorphisms are an explicit failing control; proving all norm-generated cases remains G4.

**Open proof obligation:** G4.

**Layer status:** planned.

- Open: G1, Uniform integral Smith theory over W(k).
- Open: G2, Étale modular Satake and parity transport.
- Open: G3, The good-prime parity-perversity engine.
- Open: G4, Naturality of the integral comparison on the norm image.
- Open: G5, A natural dual-group-equivariant comparison.
- The exact supplier contracts in requests remain imports to be discharged; no implementation is claimed.

## ST.8. The Tate diagonal of an algebra

Construct the transfer ideal in the fixed subring of a commutative F_p-algebra and prove that the norm class is the additive/multiplicative Tate diagonal. Reuse module-level H0 and character independence, prove the unique extension of a transfer-annihilating character to a perfect field, and formulate Frobenius twists of vector spaces and algebras and source linearization relative to a specified F_p-form. The Treumann–Venkatesh twist of a vector space and their bijection on σ-fixed characters are the special cases imported by SmithTheoryAndModPFunctoriality. This general algebra input is shared by the global and local consumers.

**Atlas planets:** Tate diagonal homomorphism; Extension of Tate characters; Frobenius twists of modules and algebras.

### The Tate diagonal of a commutative algebra (`algebra-tate-diagonal`)

Let A be a commutative F_p-algebra with an F_p-algebra automorphism σ satisfying σ^p=1. Let A^σ be its fixed subring, Tr(a)=Σ\_iσ^i(a), and Nm(a)=∏\_iσ^i(a). The image Tr(A) is an ideal of A^σ. Define T^0(A)=A^σ/Tr(A), whose underlying additive group is the pinned degree-zero Tate quotient. The rule Δ\_p(a)=[Nm(a)] is a unital F_p-algebra homomorphism A→T^0(A). If A is a k-algebra and σ is k-linear, Δ\_p(λa)=λ^pΔ\_p(a); it is Frobenius-semilinear, not generally k-linear.

**Inputs:** `SheafTheoreticSmithTheory:coefficients`, `tauceti:TauCeti.TateCohomology.H0IsoNormQuotient`.

**Construction/proof.** Prove Tr(A) is additively closed and b Tr(a)=Tr(ba) for fixed b. Expand Nm(a+b); nonconstant binary words form free cyclic orbits, and each orbit sum is a transfer. Multiplicativity and the unit are direct. Match the underlying additive quotient with H0IsoNormQuotient without claiming that existing additive Tate cohomology already supplies this ring homomorphism.

**Source:** Feng24, Definition 5.14, p.42. Definition 5.14 takes a commutative characteristic-p algebra with σ-action. It notes that N·A is an ideal of A^σ, defines the multiplicative norm Nm, and calls its composite with A^σ→A^σ/N·A=T^0(A) the Tate diagonal homomorphism Δ\_p.

**API.**

- `algebra_tate_diagonal.transferIdeal` (constructor): Construct the ideal in the fixed subring and prove its elements are exactly the transfer image.
- `algebra_tate_diagonal.normClass` (characterisation): Δ\_p(a) is the quotient class of the cyclic product, and its additive defect is an explicit transfer.
- `algebra_tate_diagonal.naturality` (functoriality): Equivariant algebra homomorphisms induce T^0 maps commuting with Δ\_p, including the Frobenius scalar law.

**Uses.**

- Feng24 Lemma 5.15: Extend characters from an invariant subring.
- ShtukaTateCohomologyAndGlobalBaseChange and SmithTheoryAndModPFunctoriality: These consumers import this algebra diagonal and its linearization rather than defining it again.

**Unit tests.**

1. `algebra_tate_diagonal.test_1` (degenerate): For trivial σ, Tr=0 in characteristic p and Δ\_p(a)=a^p, so over F₉ it is not the identity on all scalars.
2. `algebra_tate_diagonal.test_2` (computation): For A=B^p with cyclic factor rotation, transfer surjects onto the diagonal invariants and T^0(A)=0, including its unit as the zero ring.
3. `algebra_tate_diagonal.test_3` (computation): For A=k[x₀,…,x_{p−1}] with cyclic permutation, Nm(x₀)=∏x_i and every mixed orbit sum in Nm(a+b) is killed; the transfer ideal is inside A^σ, not the ideal it generates in all of A.

### Unique extension of a Tate character (`tate-character-extension`)

Let A,σ be as above, κ a perfect field of characteristic p, and A′⊂A^σ a unital subring containing Nm(A) and Tr(A). Every unital ring homomorphism χ:A′→κ vanishing on Tr(A) extends uniquely to a unital ring homomorphism χ̃:A→κ. It is given by χ̃(a)=Frob_κ^{-1}(χ(Nm(a))). If A is a k-algebra with k-linear σ, κ=k and χ is k-linear, then χ̃ is k-linear. Taking A′=A^σ, restriction is therefore a bijection from σ-invariant k-algebra characters A→k to k-algebra characters of T^0(A); this is Treumann–Venkatesh (3.4.1).

**Inputs:** `SheafTheoreticSmithTheory:algebra-tate-diagonal`, `mathlib:frobeniusEquiv`, `mathlib:linearIndependent_monoidHom`.

**Construction/proof.** The additive-defect transfer formula and multiplicativity prove the displayed map is a ring homomorphism. For a′∈A′ use Nm(a′)=a′^p to check extension. Any other extension annihilates all transfers, so the sum of its p cyclic translates is zero. If its orbit had length p these would be distinct multiplicative characters, contradicting the existing linear-independence theorem; hence it is σ-invariant. Taking the p-th power then determines its value uniquely by perfectness.

**Sources.**

- Feng24, Lemma 5.15 and display (5.20), p.42. Lemma 5.15 says that a character of a subring A′ of A^σ containing Nm(A) and N·A, vanishing on N·A, extends uniquely to A, by χ̃(a)=χ(Nm a)^{1/p} into a perfect field. Uniqueness comes from linear independence of characters (Stacks 0CKK).
- TV16, §3.4, display (3.4.1), pp.11–12. Display (3.4.1) is the case A′=A^σ and κ=k for a k-algebra: restriction gives a bijection from σ-fixed k-characters of A to characters of T^0A. It is proved by the same norm formula and linear independence. The closing remark extends the argument to values in an integral domain.

**Checks.**

- For trivial σ on A=k[x], A′=A and κ perfect, the formula Frob^{-1}(χ(a^p)) recovers χ(a). For a cyclic product algebra the transfer ideal contains 1, so no unital transfer-annihilating character to a nonzero field exists.
- For A=k^p with cyclic rotation, the p coordinate characters are permuted freely, so no character is σ-invariant, matching T^0(A)=0 having no characters; for trivial σ the bijection is the identity of Hom(A,k).

### Frobenius twist and linearization of algebras (`frobenius-algebra`)

For a k-vector space W, set W^(p)=W⊗\_{k,Frob}k: the same vectors with λ acting as λ^{1/p}, so that the tautological map W→W^(p) is Frobenius-semilinear. For a commutative k-algebra A, A^(p) is this twist of the underlying module with the tensor-product algebra structure. Its tautological map is Frobenius-semilinear and universal for such maps from A to commutative k-algebras. Given a specific F_p-form A₀ and A≅A₀⊗\_{F_p}k, let Fr_{A₀} fix A₀ and send scalar λ to λ^p. Linearize a Frobenius-semilinear map f:A→B as f∘Fr_{A₀}^{−1}. Apply this to Δ\_p to obtain a k-algebra map after choosing a form.

**Inputs:** `SheafTheoreticSmithTheory:frobenius-category`, `SheafTheoreticSmithTheory:algebra-tate-diagonal`, `mathlib:frobeniusEquiv`.

**Construction/proof.** Use the existing tensor-product algebra and Frobenius ring equivalence. Prove the scalar-extension universal property with the correct balancing relation; identify the twist using the given form. No canonical self-linearization is asserted in the absence of the form.

**Sources.**

- Feng24, Construction 5.17, p.43. Construction 5.17 defines the Frobenius twist A^(p)=A⊗\_{k,Frob}k of a k-algebra and its universal property for Frobenius-semilinear homomorphisms. Given an F_p-structure, it defines the semilinear isomorphism Frob_{φ\_0} and the linearization f∘Frob_{φ\_0}^{-1}.
- TV16, §2.1, p.5. Section 2.1 defines the Frobenius twist W^(p)=W⊗\_{(k,Frob)}k of a k-vector space, equivalently the same vectors with scalars acting through λ^{1/p}. Treumann and Venkatesh use it in their linkage definition (Definition 6.2, p.20).

**API.**

- `frobenius_algebra.moduleTwist` (constructor): For a k-vector space W, W^(p)=W⊗\_{k,Frob}k with k acting on the right factor; equivalently W with λ∗w=λ^{1/p}w. It is functorial in k-linear maps, preserves dimension, and is the underlying k-module of A^(p) and of the Hom spaces of C^(p).
- `frobenius_algebra.tensorTwist` (constructor): Use the actual base-changed commutative algebra with its balancing relation.
- `frobenius_algebra.universal` (universal-property): Semilinear maps A→B are equivalent to k-algebra maps A^(p)→B.
- `frobenius_algebra.linearization` (compatibility): Precomposing source inverse Frobenius yields a k-linear map, functorially relative to the chosen form.

**Uses.**

- Feng24 §5.6: Linearize the algebra norm map on an F_p-defined excursion algebra.
- SmithTheoryAndModPFunctoriality: Use this general construction rather than a Hecke-algebra-specific duplicate.
- Treumann–Venkatesh §2.1 and §6.2 (SmithTheoryAndModPFunctoriality): The linkage definition twists a k-vector space by Frobenius; that Part II imports this module case rather than defining it again.

**Unit tests.**

1. `frobenius_algebra.test_1` (computation): For A=k[x] with form F_p[x], Fr fixes x and raises only coefficients to p-th powers.
2. `frobenius_algebra.test_2` (non-example): For trivial σ on A=k[x], linearizing Δ\_p sends x to x^p and scalars to themselves; it is not the identity endomorphism of A.
3. `frobenius_algebra.test_3` (computation): Over F₉ a scalar a outside F₃ is restored to a by source inverse Frobenius followed by the p-semilinear map.
4. `frobenius_algebra.test_4` (compatibility): For W=k, the map a⊗μ↦a^pμ is a k-linear isomorphism k^(p)≅k, under which the tautological map k→k^(p) is a↦a^p; over F₉ it moves every scalar outside F₃.

**Layer status:** planned.

- The exact supplier contracts in requests remain imports to be discharged; no implementation is claimed.

## Open proof obligations and completion criteria

### G1. Uniform integral Smith theory over W(k)

The existing normalized-adic supplier treats the ring of integers of a finite extension of Q_p. Prove the extension to O=W(overline(F_p)) with enhanced limits, finite-level group-ring coefficients, common constructible stratifications and uniform Tor/cohomological intervals. In particular prove the projection-formula and derived-limit comparisons for Rf!, the ambient local Rj\* bound and the conservative constructible-to-ind Tate quotient comparison. Levelwise finite-Tor assertions alone do not give these conclusions. Torsion k-coefficient Smith theory and finite-dimensional pieces do not depend on this extension.

Direct consumers: `tate-categories`, `tate-cohomology`, `finite-tor-pushforward`, `near-fixed-flat`, `fixed-restrictions`, `flat-pushforward`, `smith-pushforward`, `smith-preserves-parity`, `hyperbolic-localization`, `constant-term-satake`, `constant-term-smith`, `norm-smith-exact`. Upper layers inherit these obligations through the dependency graph.

### G2. Étale modular Satake and parity transport

Supply the equal-characteristic scheme-theoretic modular k/O branch over arbitrary separably closed F of characteristic different from p: fusion with signs, weight-functor exactness, integral dual-group reconstruction and the needed finite-Schubert/stratum geometry. Transport the JMW/LL complex-topological parity and integral Tate Hom results, with constant local systems on strata in positive characteristic (finding E38), with their composition grading, equivariant realization, coefficient change and CT compatibility. Check the F_p-form against the geometric one. MV07 Theorem 14.1 gives a model through Z_p and scalar extension, but does not by itself document every W(k)-adic/LL compatibility. The B_dR^+ Satake roadmap is not a theorem covering this case.

Direct consumers: `modular-satake`, `satake-standard-comparison`, `grassmannian-parity`, `parity-tilting`, `integral-tate-hom`, `tate-parity-indecomposables`, `smith-preserves-parity`, `satake-prime-field-form`, `hyperbolic-localization`, `extreme-orbits`, `constant-term-satake`, `constant-term-smith`, `constant-term-lifting`, `base-change-characters`, `feng-base-change`, `constant-term-conservative`, `norm-smith-exact`, `base-change-galois`. Upper layers inherit these obligations through the dependency graph.

### G3. The good-prime parity-perversity engine

MR18 Corollary 1.6 uses its Theorem 1.1, an equivalence from Iwahori-constructible parity sheaves on the complex affine Grassmannian to graded exotic tilting coherent sheaves on the dual Springer resolution, with [1] corresponding to grading shift ⟨−1⟩ and E_λ to T_{−λ}. Its proof requires the modular exotic highest-weight category, Kostant–Whittaker/Soergel description and central-isogeny/product reductions. These inputs are not the characteristic-zero Springer correspondence. Establish this engine or give another proof under the same good-prime hypothesis, then the transport in G2. Do not substitute JMW16’s stronger prime bound for the promised theorem.

Direct consumers: `parity-tilting`, `smith-preserves-parity`, `constant-term-satake`, `constant-term-lifting`, `base-change-characters`, `feng-base-change`. Upper layers inherit these obligations through the dependency graph.

### G4. Naturality of the integral comparison on the norm image

Prove the comparison F_T Psm Nm≅I_k L Psm Nm natural on all ordinary normalized integral parity maps. It suffices to prove that their Smith images have only index-zero components in the integral Tate Hom decomposition, or that every positive component is killed by coefficient reduction, with coherent choices of object identifications. Neither follows from additivity, normalization or the objectwise comparison. On the P¹ minuscule Schubert variety, a positive-index Tate morphism disproves the comparison on all Tate maps. This obligation is needed by the global Tate-cohomology consumer, not by the definition of BC.

Direct consumers: `norm-image-comparison`. Upper layers inherit these obligations through the dependency graph.

### G5. A natural dual-group-equivariant comparison

The CT square and character classification identify the output tilting objects, and the torus case identifies maps after torus restriction. Construct comparison components which intertwine the whole Ĥ-action and are natural in every source morphism. A sufficient route checks compatibility with each simple-root subgroup/rank-one Levi together with the torus, then uses generation of Ĥ. Faithful torus restriction only gives uniqueness of a lift, not its existence. Also check Γ-equivariance of these components for the arithmetic corollary. This is the exact gap between character equality and the natural isomorphism in Feng24 Theorem 4.20.

Direct consumers: `reductive-comparison-maps`, `feng-base-change`, `base-change-galois`. Upper layers inherit these obligations through the dependency graph.

The completed target-level pass goes to an independent review. A follow-up must prove or reassign each G1–G5 foundation, confirm the exact supplier contracts, and then refine the affected proof targets. It must preserve the ordinary/equivariant distinction and the map-level checks. No gap can be discharged by citing a stronger conclusion from the same unproved comparison. Implementation statuses stay unchecked until actual formalization.

## Source corrections

The version of record of Feng24 was read; its hash and the other source versions are in the packet. The findings below are paraphrased, and no source passage is reproduced. E15–E34 keep their PAPER-FENG-24 numbers as provenance. E35 is the design's own finding, and E36–E38 were added by the independent review; these four numbers are this packet's and unrelated to PAPER-FENG-24/E35–E38. Every finding was checked at its locator by the review and confirmed.

- **E15** (misprint; Published version, Corollary 3.11, p.16; affects nothing): The target of compactly supported pushforward is labeled with the source scheme. Correction: The flat output lives on S. Reason: Rf! is a functor to the target category.
- **E16** (misprint; Published version, Lemmas 3.6–3.7, p.15 and Corollary 3.11, p.16; affects the proof): The displayed domains use group-ring sheaves on schemes with nontrivial geometric actions. Correction: Use genuine geometrically equivariant derived sheaves; the group-ring description applies after passing to a trivially acted-on base. Reason: For a free p-point orbit, an arbitrary constant sheaf with trivial coefficient action pushes to a sum of trivial modules. Equivariant descent instead gives the regular representation.
- **E17** (error; Published version, Lemma 3.8, p.16; affects a stated result): The fixed !/\* comparison is made in a globally bounded category without a global dimension hypothesis. Correction: Use bounded-dimensional pieces and a uniform bound, or only a local conclusion. Reason: On the disjoint union of A^n with scalar rotation, the fixed-origin !-restrictions of the constant sheaf have shifts −2n; no global cohomological bound exists.
- **E18** (misprint; Published version, Example 3.4, p.14; affects nothing): The cyclic exact resolution is described as having a contraction. Correction: Use its acyclicity and induced middle terms; replace integral inputs by coefficient-flat complexes. Reason: For the trivial k-module a group-ring-linear retraction of the norm inclusion would send N to 1, although N acts by p=0.
- **E19** (misprint; Published version, §3.3.1, p.16; affects nothing): The pullback source is labeled with k when the argument has coefficients Λ. Correction: Keep Λ on both sides. Reason: The surrounding construction is stated for k and O.
- **E20** (misprint; Published version, Remark 3.5, p.15; affects nothing): The constructible-to-all-derived inclusion is assigned the label of a Tate-quotient functor. Correction: Use the actual constructible equivariant inclusion. Reason: Their source and target categories differ.
- **E21** (misprint; Published version, Remark 3.13, p.18; affects nothing): The description of C omits that it is a complex. Correction: Take a bounded complex of k[C_p]-modules. Reason: The Tate comparison uses cohomological shifts of C.
- **E22** (misprint; Published version, §3.4.5, p.19; affects nothing): The notation for the restricted compact pushforward obscures its domain, and the geometric point description omits its field. Correction: Use R(f|\_{Y^σ})! and a separably closed field with trivial action. Reason: The fixed-locus localization formula is a pushforward from Y^σ.
- **E23** (misprint; Published version, §4.2, p.20; affects nothing): The prose calls for odd Ext to be nonzero. Correction: Require odd Ext to vanish. Reason: The displayed integral Tate calculation and JMW induction use odd vanishing.
- **E24** (misprint; Published version, Remark 4.6(1), p.21; affects nothing): The reduction criterion changes the names of its object and space. Correction: Use the same object on Y throughout. Reason: The comparison is reduction of a single complex.
- **E25** (error; Published version, Lemma 4.16, p.26; affects a stated result): Integral reduction is asserted to be an equivalence after tensoring Hom with k in the full C_p-equivariant parity category. Correction: Use the ordinary parity reduction equivalence, and prove any needed norm-image comparison separately. Reason: For the O[C_p]-augmentation ideal I, Hom_{O[C_p]}(O,I)=0 but Hom_{k[C_p]}(k,I/pI)≠0. Thus fullness fails already on a point.
- **E26** (gap; Published version, Lemma 4.14 proof, pp.24–25; affects the proof): A perverse filtration is used to conclude the desired trivial/free filtration of norm stalk cohomology. Correction: For the normalized parity inputs actually needed, decompose into external-product parity generators and apply cyclic tensor-basis orbit counting. Leave the assertion for all integral Satake objects outside this theorem. Reason: Nm is nonadditive and i\* is not perverse t-exact. A map p:O→O can create nonfree cohomology, so the proposed filtration argument does not control these cohomology groups.
- **E27** (gap; Published version, §4.6.3, pp.26–27; affects the proof): The composite is factored through reduction before additivity and semilinearity on morphisms have been established. Correction: Prove the categorical Tate-diagonal target, including transfer factorization for mixed maps, before descending through ordinary reduction. Reason: An ordinary functor cannot descend through O-Hom tensor k unless it respects sums and identifies maps differing by p times another map.
- **E28** (misprint; Published version, Paragraph before Lemma 4.21, p.28; affects nothing): The cone and exactness discussion changes the Grassmannian and the names of its Tate category. Correction: Use the constructible orbit-stratified Tate category on Gr_H throughout. Reason: The target of Psm is on the fixed Grassmannian H.
- **E29** (error; Published version, Lemma 4.24 proof and cube, pp.29–30; affects a stated result): The right face is treated as a natural identity on every integral Tate-parity map, and reduction is used on the full equivariant category. Correction: Retain the objectwise/right-face comparison on ordinary inflated maps. Prove G4 for norm-generated maps; use only ordinary reduction. Reason: On the GL₂ minuscule Schubert P¹, E=O[1] has an index-one Tate endomorphism from H²(P¹;k). L kills it, whereas reduction to the k-Tate category does not.
- **E30** (misprint; Published version, Diagrams (4.9) and following, pp.29–30; affects nothing): The parity categories for coefficient reduction and inflation are labeled using G rather than H. Correction: Use the H-Grassmannian and its positive-loop group on those corners. Reason: These two functors do not change the underlying geometric space.
- **E31** (misprint; Published version, Diagrams (A.1)–(A.2), p.58; affects nothing): Several constant-term target categories retain group subscripts from the source rows. Correction: Use H and T_H in the H-row, T in its own source row; distinguish the unshifted Smith square from its normalized version. Reason: The targets live on the displayed torus Grassmannians; the normalization square additionally uses even shift differences.
- **E32** (misprint; Published version, Lemma A.2 proof after (A.5), p.59; affects nothing): Essential surjectivity is attributed to the constant-term arrows. Correction: The essentially surjective arrows are the inflation-to-Tate functors on normalized generators. Reason: Torus restriction is not essentially surjective on rational reductive representations: weight characters in its image obey Weyl symmetry.
- **E33** (misprint; Published version, Appendix A.5, p.60; affects nothing): The order of the functors in the torus formula puts inverse Frobenius on the wrong side relative to Definition 4.18. Correction: Precompose the p-semilinear functor by inverse Frobenius on its source. Reason: Source scalar a is first replaced by a^(1/p), then the norm returns a.
- **E34** (gap; Published version, Theorem 4.20, p.28 and Appendix A.4–A.5, pp.58–60; affects the proof): The side-face torus comparison and character classification are used to identify the back face naturally for Ĥ. Correction: Prove the Ĥ-equivariance of coherent comparison components before invoking faithful restriction; this is G5. Reason: A faithful functor need not be full. It detects equality of already constructed Ĥ-maps but cannot produce them from arbitrary torus isomorphisms.
- **E35** (gap; Published version, proof of Lemma A.2 after diagram (A.5), §A.4, p.59; affects the proof): Essential surjectivity on normalized objects is used to promote the lifting/CT object comparison to a natural square. Correction: Prove CT is compatible with the graded Hom formula and its degree-zero projection; normalized torus objects have no positive Hom indices. Reason: Essential surjectivity on objects alone does not control the additional positive-index Tate maps. The graded CT comparison supplies the missing map-level argument.
- **E36** (misprint; Published version, Lemma A.3 and its proof, p.61; affects nothing): The lemma is stated for the constructible orbit-stratified Tate category, while its proof starts from a nonzero object of the ind-constructible Tate category. Correction: Take K in the constructible category Perf_{(L^+H)}(Gr_H;T_k), as in the statement; the argument is unchanged. Reason: The proof uses only finite support and orbit constructibility, which hold in the constructible category. The comparison functor (3.1) is conservative, so nothing is lost.
- **E37** (gap; Published version, §4.4, paragraph after Definition 4.7, p.22; affects nothing): The lifting functor of LL21 Theorem 5.6.6 is invoked under the assumption that all parity sheaves exist and have vanishing negative self-Ext groups. Correction: Assume Hom(E(λ,L),E(μ,L′)[n])=0 for all pairs of parity sheaves and all n<0, which is the hypothesis of LL21 Theorem 5.6.6. On the affine Grassmannian for good p it holds because normalized parity sheaves are perverse. Reason: Projection to the index-zero summand of (4.2) is compatible with composition only if no composite of components of opposite nonzero index lands in index zero. That requires the vanishing of negative Hom between different parity sheaves, not only of negative self-Ext. LL21 Theorem 5.6.6 (preprint p.25) assumes the cross condition.
- **E38** (error; Published version, §4.1, p.19, the sentence after the JMW condition; Lemma 4.16, p.26 (simple connectivity hypothesis); affects nothing): The JMW condition, required for any two finite free local systems on a stratum, is said to hold for Kac–Moody flag varieties, in particular affine flag varieties, over arbitrary separably closed fields, with a reference to JMW14 §4.1, which works over the complex numbers. Correction: Over a separably closed field of positive characteristic ℓ, impose the condition, and the simple connectivity used in Lemma 4.16, only for constant local systems on the strata, equivalently for local systems equivariant under the connected positive-loop or Iwahori stabilizers. The parity sheaves of §4.5 have constant local systems on their strata, so the later arguments are unaffected. Reason: A one-dimensional Bruhat cell of the affine flag variety is A¹. For d≥3 prime to ℓ and a nontrivial character ψ of F_ℓ into k^× (which exists since p≠ℓ), the Artin–Schreier sheaf L_ψ(x^d) is a rank-one local system on A¹ with H¹(A¹,L_ψ(x^d)) of dimension d−1. So Ext¹ between the constant sheaf and a finite free local system on that stratum is nonzero, and A¹ is not simply connected for k-local systems.

## Source register

- **Feng24**: Tony Feng; Appendix A jointly with Gus Lonergan, *Smith theory and cyclic base change functoriality*. Forum of Mathematics, Pi 12 (2024), e1, pp.1–66; DOI 10.1017/fmp.2023.32. [Public source](https://doi.org/10.1017/fmp.2023.32). Read 19 October 2026. §§1.1–1.3, pp.1–3; coefficient conventions, p.7; §§3–4, pp.13–30, including all statements and proofs in these sections; Definition 5.14, Lemma 5.15 and Construction 5.17, pp.42–43; Appendix A, pp.56–61.
- **LL21**: Spencer Leslie and Gus Lonergan, *Parity sheaves and Smith theory*. J. reine angew. Math. 777 (2021); arXiv:1708.08174, downloaded preprint; page locators below refer to the preprint. [Public source](https://arxiv.org/abs/1708.08174). Read 19 October 2026. §§4.5.2–4.6.1, pp.14–15: integral Tate cohomology and the graded Hom formula; §§4.9–5.2.1, pp.19–20: trivial-action passage and stratification assumptions; §§5.5–5.6, pp.21–25: indecomposables and lifting.
- **JMW14**: Daniel Juteau, Carl Mautner and Geordie Williamson, *Parity sheaves*. J. Amer. Math. Soc. 27 (2014), 1169–1212; arXiv:0906.2994; page locators refer to the downloaded preprint. [Public source](https://arxiv.org/abs/0906.2994). Read 19 October 2026. §2.1, pp.4–6: even local-system Hom and parity conventions; Theorem 2.12 and Definition 2.14, pp.7–8; Proposition 2.39 and formula (2.13), pp.17–18.
- **JMW16**: Daniel Juteau, Carl Mautner and Geordie Williamson, *Parity sheaves and tilting modules*. Ann. Sci. ENS 49 (2016), 257–275; arXiv:1403.1647v1 (7 March 2014); preprint pagination. [Public source](https://arxiv.org/abs/1403.1647v1). Read 19 October 2026. §1, pp.1–3: Theorems 1.1–1.6 and prime bounds; Appendix §5, pp.15–16: Theorems 5.1 and 5.3 and relation to good filtrations.
- **MR18**: Carl Mautner and Simon Riche, *Exotic tilting sheaves, parity sheaves on affine Grassmannians, and the Mirković–Vilonen conjecture*. J. Eur. Math. Soc. 20 (2018), 2259–2332; arXiv:1501.07369; preprint pagination. [Public source](https://arxiv.org/abs/1501.07369). Read 19 October 2026. §§1.2–1.4, pp.2–4: the precise Iwahori-parity/exotic-tilting equivalence and its grading; Corollary 1.6, pp.6–7; §6.5, p.60: reduction of Corollary 1.6 to the exotic equivalence of Theorem 1.1.
- **MV07**: Ivan Mirković and Kari Vilonen, *Geometric Langlands duality and representations of algebraic groups over commutative rings*. Ann. of Math. 166 (2007), 95–143; arXiv:math/0401222v5 (13 February 2018), preprint pagination. [Public source](https://arxiv.org/abs/math/0401222v5). Read 19 October 2026. Introduction, p.1; §3, pp.9–13: Theorems 3.2, 3.5, 3.6 and extremal orbit calculation (3.6); §4.1–4.4, pp.13–14: coefficient-sensitive convolution; §6, pp.20–22: tensor structure of weight functors; §11 and beginning of §12, pp.31–34: integral reconstruction and root-datum target; §§12–14, pp.38–40: final reductions, standards/costandards and étale variant Theorem 14.1.
- **Stacks**: The Stacks Project Authors, *The Stacks Project: flatness, Tor amplitude and characters*. Online numbered statements, accessed 19 October 2026; stable tags, no PDF pagination. [Public source](https://stacks.math.columbia.edu/). Read 19 October 2026. Tag 051E, Lemmas 10.101.1–10.101.3: flat modules over nilpotent local rings; Tag 08G1, Lemma 21.46.3: Tor amplitude on ringed topoi; Tag 0DJJ, Lemma 21.46.10: detection at enough points with one common interval; Tag 0A5M, Definition 15.70.1: finite projective amplitude; Tag 0CKK, Lemma 9.13.1: independence of distinct multiplicative characters.
- **Braden03**: Tom Braden, *Hyperbolic localization of intersection cohomology*. Transformation Groups 8 (2003), 209–216; arXiv:math/0202251v5 (29 July 2003), preprint pagination. [Public source](https://arxiv.org/abs/math/0202251v5). Read 19 October 2026. Theorem 1 and coefficient/weak-equivariance hypotheses, pp.1–2; §§2–4, pp.4–6: invariant local models, contraction Lemma 6 and proof of Theorem 1; §6, pp.7–8: proof of the contraction lemma.
- **TV16**: David Treumann and Akshay Venkatesh, *Functoriality, Smith theory, and the Brauer homomorphism*. Ann. of Math. 183 (2016), 177–228; arXiv:1407.2346, downloaded preprint (latest version), preprint pagination. [Public source](https://arxiv.org/abs/1407.2346). Read 19 October 2026. §2.1, p.5: Frobenius twist of a k-vector space; §3.4 and (3.4.1), pp.11–12: Tate cohomology of a commutative algebra and the bijection on characters.

All statements, proof plans and examples above are written for these targets in our own words. The source register names only the passages actually used; the MR exotic proof engine is explicitly unresolved rather than presented as a source that has been reconstructed in full. No restricted book was used.
