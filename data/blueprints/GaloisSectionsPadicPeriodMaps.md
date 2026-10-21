# Anabelian geometry and nonabelian Chabauty, Part II: Galois sections and p-adic period mappings

Betts and Stix prove that for a number field without CM subfield and a curve of genus at least two, the Selmer sections of Grothendieck's fundamental exact sequence have finite image in the v-adic points at every finite place, and so does the finite descent locus. The roadmap builds Selmer sections and the Harari–Stix descent theorem, symplectic pairs of sections, filtered discrete (φ, N, G\_v)-modules, self-conjugate places, the model-free control of D\_pst by p-adic period maps through relative p-adic Hodge theory, the principal trichotomy, and the finiteness of the Lawrence–Venkatesh locus for Kodaira–Parshin families.

## Purpose and scope

This roadmap formalises L. A. Betts and J. Stix, Galois sections and p-adic period mappings (Annals of Mathematics 201 (2025), 79–166; arXiv:2204.13674v1, whose statements and numbering are used throughout; the published revision has not been compared). Its end theorems are Theorem A, the finiteness of loc\_v(Sec^Sel(Y/K)) at every finite place v when K has no CM subfield, and Theorem B, the finiteness of the projections of the finite descent locus; on the way it proves the finiteness of the Lawrence–Venkatesh locus at every self-conjugate place (Theorem 6.5), which also gives the Mordell conjecture, and the general statement that Selmer sections localise into that locus (Theorem 7.1).

It is a Part II of AnabelianGeometryAndNonabelianChabauty, whose Layer 7.1 supplies Galois section classes Sect(X/k), the section map κ\_X, its field-general divisibility criterion for injectivity, its number-field corollary and Grothendieck's section conjecture as a named proposition (atlas nodes NC.6/section-classes, NC.6/section-class-map, NC.6/section-map-injective, NC.6/section-conjecture). This roadmap starts there: it restricts sections to decomposition groups, defines Selmer sections, and builds the Lawrence–Venkatesh obstruction for them. The section conjecture is never assumed.

## What is imported

- AnabelianGeometryAndNonabelianChabauty NC.6: section classes, the section map, injectivity over number fields, the section conjecture.
- InverseGaloisAndArithmeticFundamentalGroups IG.0–IG.1: Q\_p-local systems as π₁-representations and the invariance of geometric π₁ under algebraically closed base extension in characteristic zero.
- ArithmeticGaloisRepresentations R01.1–R01.2, R01.6: decomposition groups, local restriction, Mackey decomposition, good-reduction Frobenius polynomials.
- HeightsRationalPointsAndObstructions RP.2–RP.3: adelic points and the descent sets of torsors.
- MordellLawrenceVenkatesh LV.0–LV.11: abelian-by-finite families, Lagrangian period varieties, full monodromy, Faltings's lemma, the infinity-type factorisation behind friendly places, the Kodaira–Parshin family and its full monodromy, and the group-theoretic counts of LV.0.
- PadicHodgeTheory R06.2, R06.3, R06.5, P8: period functors, filtered (φ, N)-modules with descent data, D\_pst, the p-adic monodromy theorem, de Rham pairs, Scholze's relative comparison with its compatibilities, Shimizu's horizontal periods and relative monodromy theorem.
- CohomologyComparisons CP.6: compatibility of Scholze's c\_dR with cup products, base change, traces, duality, cycle and Chern classes.
- AdicSpacesPartII R1, AlgebraicModuliForArithmeticGeometry R09.1, AbelianSchemesAndArithmeticModuli A6, ComplexComparisonPartII C5, EtaleDualityAndPerverseSheaves EDC.2, ArithmeticGaloisDuality R02.3, WeightsInEtaleCohomology R34.1: rigid analytification, flag varieties, Weil restriction, the Gauss–Manin connection, Poincaré duality on curves, Hermite–Minkowski, purity.
- Tau Ceti: ClassFieldTheory Layers 7 and 11, GlobalNumberFields Layers 2, 7 and 8, LocalFieldsRamification Layers 0, 2 and 4, LocalGaloisGroups Layer 7 (finite generation of the full local Galois group), ReductiveGroups Layers 0 and 3, Chebotarev Layer 10; Mathlib's absolute Galois groups, CM fields, bilinear forms, Dirichlet's theorem and ζ(4).

## Conventions

- K is a number field with a fixed algebraic closure K̄ and G\_K = Gal(K̄/K); at each place u an embedding K̄ → K̄\_u fixes the decomposition group G\_u ≤ G\_K. Y/K is a smooth projective geometrically connected curve of genus g ≥ 2 unless said otherwise.
- Hodge–Tate weights are normalised so that Q\_p(1) has weight −1: the Hodge–Tate weight r of a character is the jump of the filtration of D\_dR. Purity refers to geometric Frobenius; Q\_p(−1) is pure of weight 2. Local Artin maps send uniformisers to arithmetic Frobenius.
- Ind\_{G\_w}^{G\_v}W = Map\_{G\_w}(G\_v, W), with (g·ψ)(h) = ψ(hg). Filtered discrete (φ, N, G\_v)-modules satisfy Nφ = pφN.
- For an algebra A in Galois representations, Σ\_A = Hom\_{Q\_p-alg}(A, Q\_p) is the set of its Q\_p-points, never its Q̄\_p-points.
- c\_dR is always Scholze's comparison isomorphism, constructed through the relative comparison theorem.
- S is suitable for an abelian-by-finite family when it contains the places above p and ∞ and the places of bad reduction. d\_q = (g − 1/2)(q − 1) is the relative dimension of the Kodaira–Parshin family X\_q, and k = (q − 1)/2.
- n\_v is the number of subfields of K̄\_v of degree 2 or 3 over K\_v; size\_v(Σ) is the proportion of points of a finite G\_v-set in orbits of size less than 4.

## Corrections to the source

The extraction PAPER-BETTS-STIX-25 supplies the first eight corrections below. The further Betts–Stix findings E1–E9 and E11 concern arXiv v1; the Annals revision has not been compared. E10 is a clarification of the local-field domain of Stix’s Remark 46, rather than an established erratum. All statements below use these hypotheses and conventions.

| Finding | Locator | Correction used here |
| --- | --- | --- |
| Extraction E1 | Proposition 6.7(c), pp. 46–47 | (c) is stated with #Σ\_A; it equals dim\_{Q\_p}(A) for split A, as in every application. |
| Extraction E2 | Proof of Proposition 2.16(1), p. 12 | The injectivity of Q\_p^nr ⊗ End(D) → End(D) uses Frobenius as well as G\_v. |
| Extraction E3 | Proof of Proposition 3.20(8), p. 28 | Chern-class compatibility is proved among smooth proper varieties, not on the total space of a line bundle. |
| Extraction E4 | Lemma 4.12, p. 38 | The i-th factor is H¹\_dR(X\_{y′\_i}/L\_{w\_i}). |
| Extraction E5 | §6.3, pp. 49, 51 | M^{≤1}(Φ) in place of M¹(Φ) in the type (b) locus. |
| Extraction E6 | Remark 6.23(I), p. 54 | r₀ is also taken larger than every prime ramified in K′. |
| Extraction E7 | Lemma A.2, p. 57; proof of Theorem 3.12(2) | Lemma A.2 for filtrations with F^pA^n = 0 for p ≫ 0; applied to Rπ\_dR,\*E. |
| Extraction E8 | Proof of Theorem 3.22, p. 31; Definition 3.24 | Potential horizontal semistability from Shimizu Lemma 8.9 with Theorem 7.4; the definition is Shimizu Definition 5.6. |
| This roadmap E1 | arXiv v1, proof of Proposition 5.3, (5.1) and the following paragraph, pp. 40–41 | Use the columns of T⁻¹ (the solution of dS = Sω, S(0) = I): Φ\_{y₀}(y) is the pullback (T(y))⁻¹(F^i) of the fixed filtration, not its push-forward. |
| This roadmap E2 | arXiv v1, Lemma 4.7, p. 35 | Assume π smooth and proper (as in every application, where π is an abelian-by-finite family). |
| This roadmap E3 | arXiv v1, Corollary 5.10 and Remark 5.11, p. 43 | Keep Corollary 5.10 as a local statement on a closed disc. For the global finite-disc argument of Remark 5.11 assume Y proper, as in all applications. Properness guarantees compactness; smoothness alone does not. |
| This roadmap E4 | arXiv v1, §3.5, paragraph after the proof of Theorem 3.3, p. 29 | It begins the proof of Theorem 3.22; Theorem 3.3 has just been deduced from it. |
| This roadmap E5 | arXiv v1, §4.2 before Lemma 4.8, p. 36 | P is the Poincaré bundle on X ×\_{Y′} X^∨, as on pp. 33–35. |
| This roadmap E6 | arXiv v1, (4.3), p. 38 | Index the product by the closed points y′\_i, i ∈ I. |
| This roadmap E7 | arXiv v1, proof of Lemma 6.17, p. 50 | For all j. |
| This roadmap E8 | arXiv v1, Remark 6.23(I), p. 54 | Of q − 1. |
| This roadmap E9 | arXiv v1, Example 2.2, p. 7 | Weil I, Theorem 1.6, p. 276, has the smooth projective hypothesis. For smooth proper varieties use Weil II, Corollary 3.3.9, p. 218, which states both integral coefficients independent of ℓ and purity. The abelian varieties used here are already projective. |
| This roadmap E10 (scope clarification) | arXiv:0809.0017v1, Appendix B, Remark 46, p. 22 | For this roadmap take local fields to mean finite extensions of Q\_p. Here A(L) is profinite and has no nonzero point divisible by every positive integer. Compactness without total disconnectedness does not give the assertion over R or C, where the section map sees components. |
| This roadmap E11 | arXiv v1, Remark 2.20, CM case, p. 14 | Insert finite-power descent of the character along N\_{K/E}, using its factored algebraic type and finiteness of ray class groups. Apply the conjugation argument to the resulting character of E, then pull it back by the local norm. |

## How to read the build

SPM.0 and SPM.1 are the global, section-theoretic half and need nothing from p-adic Hodge theory. SPM.2 and SPM.3 are independent local and global preliminaries. SPM.4 and SPM.5 are the model-free comparison, which is the main technical departure from Lawrence–Venkatesh. SPM.6 sets up the loci and the trichotomy; SPM.7 and SPM.8 bound the three types; SPM.9 assembles the theorems. Each layer below states its targets, then each target with its hypotheses, proof sketch and sources; definitions and constructions carry their API and unit tests.

## Layer SPM.0: Selmer sections and the finite descent locus

**Targets.** Restriction res\_u of Galois section classes to decomposition groups at every place, through π₁^ét(Y\_{K\_u}) ≅ π₁^ét(Y) ×\_{G\_K} G\_u (Harari–Stix, Introduction). Injectivity of the section map over p-adic fields (A(L) profinite has no divisible points; Stix, Remark 46). Selmer sections Sec^Sel(Y/K) and the localisation maps loc\_u at finite places (Betts–Stix Definition 1.1), with the archimedean conditions kept. Stoll's modified adelic points Y(A\_K)\_• and finite descent locus Y(A\_K)\_•^{f-cov}, with Stoll's conjecture as a named proposition. The Harari–Stix theorem: an adelic point survives finite étale descent iff its local sections come from one global section; hence the projection of Y(A\_K)\_•^{f-cov} to Y(K\_v) is loc\_v(Sec^Sel). Section classes, the section map and the section conjecture are imported from AnabelianGeometryAndNonabelianChabauty NC.6.

<a id="spm-0-local-section-restriction"></a>

### Restriction of Galois sections to decomposition groups

**Construction** (`SPM.0/local-section-restriction`). Let K be a number field with algebraic closure K̄, X a geometrically connected separated K-scheme of finite type, u a place of K (finite or archimedean) and ι: K̄ → K̄\_u a K-embedding into an algebraic closure of the completion K\_u, with ι^\*: G\_u = Gal(K̄\_u/K\_u) → G\_K the induced injection onto the decomposition group D\_u (R01.2). Fix a geometric point x̄\_u of X\_{K̄\_u} and its image x̄ in X\_{K̄}. Then the natural maps give an isomorphism of profinite extensions of G\_u: π₁^ét(X\_{K\_u}, x̄\_u) ≅ π₁^ét(X, x̄) ×\_{G\_K} G\_u, restricting to the isomorphism π₁^ét(X\_{K̄\_u}, x̄\_u) ≅ π₁^ét(X\_{K̄}, x̄) of IG.1/charzero-base-extension on geometric kernels. Consequently, for a continuous section s: G\_K → π₁^ét(X, x̄) of the fundamental exact sequence, the map σ ↦ (s(ι^\*σ), σ) is a continuous section s|G\_u of 1 → π₁^ét(X\_{K̄\_u}) → π₁^ét(X\_{K\_u}) → G\_u → 1. Conjugating s by an element of the geometric kernel conjugates s|G\_u by its image, so restriction descends to a map res\_u: Sect(X/K) → Sect(X\_{K\_u}/K\_u) of the section classes of NC.6/section-classes. A second embedding ι' changes res\_u by the canonical base-point bijection of NC.6/section-classes, and res\_u ∘ κ\_X = κ\_{X\_{K\_u}} ∘ (X(K) → X(K\_u)) for the section maps κ of NC.6/section-class-map.

**Hypotheses and conventions.**

- K is a number field, so the characteristic is zero and the base-extension theorem IG.1/charzero-base-extension applies to every connected finite-type K-scheme.
- X is geometrically connected, so the fundamental exact sequences over K and over K\_u are exact (IG.1).
- At a complex place G\_u is trivial and res\_u has a one-point target; at a real place G\_u has order two.

**Proof sketch.**

1. Compare the two exact sequences: π₁^ét(X\_{K\_u}) maps to π₁^ét(X) compatibly with ι^\*: G\_u → G\_K, so it maps to the fibre product π₁^ét(X) ×\_{G\_K} G\_u; both are extensions of G\_u, by π₁^ét(X\_{K̄\_u}) and by π₁^ét(X\_{K̄}), and the map on kernels is the isomorphism of IG.1/charzero-base-extension, so the five lemma for profinite groups gives the isomorphism (Harari–Stix, Introduction, p. 2).
2. A section s defines the section σ ↦ (s(ι^\*σ), σ) of the fibre product; transport it through the isomorphism of the first step.
3. If t = δsδ⁻¹ with δ in the geometric kernel, then t|G\_u is the conjugate of s|G\_u by the image of δ in π₁^ét(X\_{K̄\_u}); so res\_u is well defined on classes.
4. For x ∈ X(K), the section s\_x comes from functoriality of π₁ for Spec K → X; composing with Spec K\_u → Spec K gives the section of the image point, by functoriality of π₁ for Spec K\_u → Spec K → X.
5. Changing ι to ι ∘ σ, or to τ ∘ ι with τ ∈ G\_u, changes ι^\* by conjugation (R01.2(iii)); the induced change of base point is an étale path, which acts on classes by the canonical bijection of NC.6/section-classes.

**API.**

- `SectionClasses.restrictPlace` (functoriality): res\_u: Sect(X/K) → Sect(X\_{K\_u}/K\_u), defined from a chosen embedding ι: K̄ → K̄\_u.
- `SectionClasses.restrictPlace_mk` (simp): res\_u[s] = [s|G\_u], where s|G\_u(σ) is the image of (s(ι^\*σ), σ) under π₁^ét(X) ×\_{G\_K} G\_u ≅ π₁^ét(X\_{K\_u}).
- `fundamentalGroup_baseChange_fibreProduct` (characterisation): π₁^ét(X\_{K\_u}, x̄\_u) ≅ π₁^ét(X, x̄) ×\_{G\_K} G\_u as extensions of G\_u, with the IG.1 isomorphism on geometric kernels.
- `SectionClasses.restrictPlace_sectionClassMap` (compatibility): res\_u(κ\_X(x)) = κ\_{X\_{K\_u}}(x) for every x ∈ X(K), viewing x as a K\_u-point.
- `SectionClasses.restrictPlace_map` (functoriality): For a K-morphism f: X → X', res\_u ∘ SectionClasses.map f = SectionClasses.map f\_{K\_u} ∘ res\_u.
- `SectionClasses.restrictPlace_embedding` (equivalence): For two embeddings ι, ι' the two maps res\_u differ by the base-point bijection of NC.6/section-classes; their images are identified.

**Unit tests.**

- `SectionClasses.restrictPlace_spec` (degenerate): For X = Spec K, Sect(X/K) and Sect(X\_{K\_u}/K\_u) are one-point sets and res\_u is the unique map between them.
- `SectionClasses.restrictPlace_gm` (compatibility): For X = G\_{m,K} with the reference sections of the point 1, res\_u corresponds under SectionClasses.equivH1 to restriction H¹(K, Ẑ(1)) → H¹(K\_u, Ẑ(1)); on Kummer classes it sends the class of a ∈ K^× to the class of a ∈ K\_u^×.
- `SectionClasses.restrictPlace_complex` (computation): At a complex place u, G\_u is trivial, Sect(X\_{K\_u}/K\_u) is a single point and res\_u is constant.
- `SectionClasses.restrictPlace_not_on_homomorphisms` (non-example): In the split extension Ẑ(1) ⋊ C₂ with the generator c acting by inversion, the sections sending c to (2,c) and (−2,c) are distinct continuous homomorphisms but are conjugate by the geometric-kernel element (−2,1). Thus raw sections depend on the chosen transport even when their section classes agree; this is the real G\_m local model.

**Uses.**

- Betts–Stix, Definition 1.1: the Selmer condition asks that each res\_u[s] be the class of a K\_u-point
- Harari–Stix, Theorem 2.1: the local sections s\_v of an adelic point are compared with the restrictions of a global section
- this roadmap, SPM.1/sections-restrict-local-systems: restricting the π₁-representation of a local system along s|G\_u computes its fibre at a local point

**Checks.**

- For X = Spec K both section sets are points and res\_u is the unique map.
- For X = G\_{m,K} with reference sections at 1, res\_u is the restriction map H¹(K, Ẑ(1)) → H¹(K\_u, Ẑ(1)), which under Kummer theory is induced by K^× → K\_u^×.

**Sources.**

- L. Alexander Betts and Jakob Stix, Definition 1.1, p. 1. Restricting a section of the fundamental exact sequence (1.1) to a decomposition group G\_u gives a splitting of the local fundamental exact sequence of Y over K\_u.
- David Harari and Jakob Stix, Introduction, p. 2. In characteristic zero the comparison theorem identifies π₁ of the base change to a field extension with the fibre product of π₁ over the absolute Galois group, so a global section induces a section of each local sequence.

**Needs.** `InverseGaloisAndArithmeticFundamentalGroups:IG.1/charzero-base-extension`; `ArithmeticGaloisRepresentations:R01.2/decomposition-group-at-a-place`; `AnabelianGeometryAndNonabelianChabauty:NC.6/section-classes`; `AnabelianGeometryAndNonabelianChabauty:NC.6/section-class-map`; `Field.absoluteGaloisGroup`; `ContinuousMonoidHom`.

<a id="spm-0-local-section-map-injective"></a>

### Injectivity of the section map over p-adic fields

**Theorem** (`SPM.0/local-section-map-injective`). Let L be a finite extension of Q\_p and X a geometrically connected L-variety that admits an immersion into an abelian variety over L (for instance a smooth projective geometrically connected curve of genus g ≥ 1 with X(L) ≠ ∅, through its Abel–Jacobi map). Then the section map κ\_X: X(L) → Sect(X/L) is injective. In particular, for a smooth projective geometrically connected curve Y of genus ≥ 1 over a number field K, a finite place u of K and a class c ∈ Sect(Y\_{K\_u}/K\_u), at most one y ∈ Y(K\_u) has κ(y) = c.

**Hypotheses and conventions.**

- L is a finite extension of Q\_p (a local field of characteristic zero); the statement fails over ℝ, where the torus A(ℝ)⁰ is divisible and κ only sees the connected component of a real point.

**Proof sketch.**

1. Apply the field-general first assertion of NC.6/section-map-injective (Stix, Appendix B, Proposition 44 and Theorem 45), rather than its number-field corollary: it suffices that every abelian variety A/L has no nonzero rational point divisible by every positive integer.
2. A(L) is a compact Hausdorff totally disconnected topological group: it is closed in a projective space over L, which is compact and totally disconnected; so A(L) is a profinite abelian group (Stix, Appendix B, Remark 46, which gives compactness as the reason).
3. For every open subgroup U of A(L), the quotient A(L)/U is finite of some exponent e\_U, so an element divisible by e\_U lies in U; an element divisible by every n therefore lies in every open subgroup, and the open subgroups of a profinite group intersect in 0.
4. For a curve of genus ≥ 1 with an L-point b, the Abel–Jacobi map at b is a closed immersion into the Jacobian (HeightsRationalPointsAndObstructions §6.4, as cited by NC.6/section-map-injective); if X(L) = ∅ there is nothing to prove.

**Checks.**

- For an elliptic curve E over Q\_p with full 2-torsion, the four 2-torsion points have pairwise distinct section classes.
- Over ℝ the analogous map is not injective: two distinct real points on the same connected component of E(ℝ) give the same section class.

**Sources.**

- Jakob Stix, Appendix B, Theorem 45 and Remark 46, p. 22. Injectivity of the section map holds over any field whose abelian varieties have no nonzero divisible rational points; the remark notes that local fields qualify by compactness.
- L. Alexander Betts and Jakob Stix, Definition 1.1, p. 1. The localisation map loc\_u is defined by sending a Selmer section to the unique K\_u-point that gives its restriction; uniqueness is this injectivity.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.6/section-map-injective`; `AnabelianGeometryAndNonabelianChabauty:NC.6/section-class-map`.

<a id="spm-0-selmer-sections"></a>

### Selmer sections and the localisation maps

**Definition** (`SPM.0/selmer-sections`). Planet: Selmer sections. Let K be a number field and X a geometrically connected separated K-scheme of finite type. A section class c ∈ Sect(X/K) is Selmer if, for every place u of K, archimedean places included, res\_u(c) lies in the image of the local section map κ\_{X\_{K\_u}}: X(K\_u) → Sect(X\_{K\_u}/K\_u) (SPM.0/local-section-restriction, NC.6/section-class-map). The Selmer sections form the subset Sec^Sel(X/K) ⊆ Sect(X/K). When κ\_{X\_{K\_u}} is injective at a finite place u (SPM.0/local-section-map-injective: for instance X a smooth projective geometrically connected curve of genus ≥ 1), the localisation map loc\_u: Sec^Sel(X/K) → X(K\_u) sends c to the unique y\_u ∈ X(K\_u) with κ(y\_u) = res\_u(c). The definition and loc\_u do not depend on the embeddings ι chosen at the places.

**Hypotheses and conventions.**

- X is geometrically connected, so Sect(X/K) is defined (NC.6/section-classes).
- The Selmer condition is imposed at every place, the real and complex places included; at a complex place it is automatic when X(ℂ) ≠ ∅.
- loc\_u is defined only at finite places, where the local section map is injective; at a real place a section class determines at most a connected component of X(K\_u).

**Proof sketch.**

1. Define Sec^Sel(X/K) as the intersection over all places u of the preimages res\_u⁻¹(κ\_{X\_{K\_u}}(X(K\_u))).
2. At a finite place, SPM.0/local-section-map-injective makes the point y\_u with κ(y\_u) = res\_u(c) unique, which defines loc\_u.
3. Independence of ι: two embeddings change res\_u by the canonical base-point bijection, which is compatible with κ\_{X\_{K\_u}} (NC.6/section-class-map), so the Selmer condition and y\_u do not change.
4. For x ∈ X(K), res\_u(κ\_X(x)) = κ\_{X\_{K\_u}}(x) by SPM.0/local-section-restriction, so κ\_X(X(K)) ⊆ Sec^Sel(X/K) and loc\_u(κ\_X(x)) = x.

**API.**

- `SelmerSections` (structure): The subset Sec^Sel(X/K) of Sect(X/K) cut out by the Selmer condition at every place.
- `SelmerSections.loc` (data): loc\_u: Sec^Sel(X/K) → X(K\_u) for a finite place u, when κ\_{X\_{K\_u}} is injective.
- `SelmerSections.loc_spec` (characterisation): κ\_{X\_{K\_u}}(loc\_u c) = res\_u(c), and loc\_u c is the only point with this property.
- `SelmerSections.ofPoint` (constructor): κ\_X(x) ∈ Sec^Sel(X/K) for x ∈ X(K), with loc\_u(κ\_X x) = x in X(K\_u).
- `SelmerSections.map` (functoriality): A K-morphism f: X → X′ maps Selmer sections to Selmer sections. At a finite place u where both local section maps are injective, loc\_u ∘ map f = f ∘ loc\_u.
- `SelmerSections.restrict` (functoriality): For a finite extension L/K, restriction of sections to G\_L maps Sec^Sel(X/K) into Sec^Sel(X\_L/L). For finite w | v, when the local section maps over both K\_v and L\_w are injective, loc\_w(c|G\_L) is the image of loc\_v(c) in X(L\_w).
- `SelmerSections.eq_empty_of_no_local_point` (other): If X(K\_u) = ∅ for some place u then Sec^Sel(X/K) = ∅.
- `SelmerSections.eq_range_of_sectionConjecture` (compatibility): If SectionConjecture(Y/K) holds (NC.6/section-conjecture), then Sec^Sel(Y/K) = κ\_Y(Y(K)).

**Unit tests.**

- `SelmerSections.spec_field` (degenerate): For X = Spec K, Sec^Sel(X/K) = Sect(X/K) is one point and each loc\_u takes the value Spec K\_u.
- `SelmerSections.loc_ofPoint` (computation): For Y of genus ≥ 1 and y ∈ Y(K), loc\_u(κ\_Y(y)) is the image of y in Y(K\_u) at every finite place u.
- `SelmerSections.empty_of_no_real_point` (non-example): If Y(ℝ) = ∅ for a real place of K then Sec^Sel(Y/K) = ∅, even when Y(K\_u) ≠ ∅ for every finite u: a definition that imposes the condition only at finite places is wrong.
- `SelmerSections.loc_two_torsion` (characterisation): For an elliptic curve E/Q with full rational 2-torsion and any prime p, the four global 2-torsion points define Selmer classes whose localisations in E(Q\_p) are pairwise distinct, by local injectivity.
- `SelmerSections.sectionConjecture` (compatibility): Under the section conjecture for Y/K, Sec^Sel(Y/K) = Sect(Y/K) and κ\_Y identifies it with Y(K).

**Uses.**

- Betts–Stix, Theorem A: the image of loc\_v on Sec^Sel(Y/K) is the set shown to be finite
- Betts–Stix, Theorem 7.1: the symplectic pair of a Selmer section interpolates its local points
- Harari–Stix, Theorem 2.1: the finite descent locus is the set of adelic points whose local sections come from a global section

**Checks.**

- Every rational point gives a Selmer section; for a curve of genus ≥ 1 it localises to itself at every finite place.
- If X(K\_u) = ∅ for some place u, then Sec^Sel(X/K) = ∅.
- Under Grothendieck's section conjecture (NC.6/section-conjecture), Sec^Sel(Y/K) = Sect(Y/K) = κ\_Y(Y(K)) for a smooth projective curve of genus ≥ 2.

**Sources.**

- L. Alexander Betts and Jakob Stix, Definition 1.1, p. 1. A section is Selmer when its restriction to every decomposition group is the section of a local point; Sec^Sel(Y/K) is the set of such sections and loc\_u sends a Selmer section to that local point at a finite place u.
- L. Alexander Betts and Jakob Stix, §1, Theorem A and the paragraph before it, p. 1. The section conjecture predicts that all sections come from rational points, which the Selmer condition imitates locally.

**Needs.** [Restriction of Galois sections to decomposition groups](#spm-0-local-section-restriction); [Injectivity of the section map over p-adic fields](#spm-0-local-section-map-injective); `AnabelianGeometryAndNonabelianChabauty:NC.6/section-classes`; `AnabelianGeometryAndNonabelianChabauty:NC.6/section-class-map`; `AnabelianGeometryAndNonabelianChabauty:NC.6/section-conjecture`.

<a id="spm-0-modified-finite-descent-locus"></a>

### Modified adelic points and the finite descent locus

**Definition** (`SPM.0/modified-finite-descent-locus`). Planet: Finite descent locus. Let K be a number field and X a smooth projective geometrically connected K-variety, so that X(A\_K) = ∏\_u X(K\_u) (RP.2/adelic-points-general). The modified adelic points are X(A\_K)\_• := ∏\_{u finite} X(K\_u) × ∏\_{u | ∞} π₀(X(K\_u)), with the projection X(A\_K) → X(A\_K)\_• that replaces each archimedean component by its connected component. For a torsor f: Z → X under a finite étale K-group scheme G, a point P ∈ X(A\_K)\_• survives (Z, G) if it is the image of a point of Z^ξ(A\_K)\_• for some twist ξ ∈ H¹(K, G). The finite descent locus X(A\_K)\_•^{f-cov} is the set of P ∈ X(A\_K)\_• surviving every such torsor. It is the image of the finite étale descent set X(A\_K)^{ét} of RP.3/descent-set under the projection, it contains the image of X(K), and Stoll's Main Conjecture 9.1 (every smooth projective curve is 'very good': the abelian finite descent locus is the closure of X(K)) implies that it equals the closure of the image of X(K) for curves; that prediction is a named proposition and is never assumed.

**Hypotheses and conventions.**

- X smooth projective and geometrically connected over a number field.
- Only torsors under finite étale group schemes enter; torsors under connected groups give other descent sets.

**Proof sketch.**

1. Form X(A\_K)\_• as the stated product, with the product topology; the projection from X(A\_K) is surjective.
2. Define survival through the twists of the torsor, as in Stoll, Definition 5.2, and the locus as in Stoll, Definition 5.4(1).
3. Comparison with RP.3/descent-set: a point of X(A\_K) lies in X(A\_K)^{ét} exactly when its image survives every finite étale torsor. At a real place the map Z^ξ(K\_u) → X(K\_u) is a finite covering map, so its image is open and closed and is a union of connected components; hence lifting a component is the same as lifting each of its points.
4. X(K) maps into the locus by the descent theorem: a rational point lies in the image of the rational points of exactly one twist (Stoll, Theorem 5.1).

**API.**

- `ModifiedAdelicPoints` (structure): X(A\_K)\_• = ∏\_{finite} X(K\_u) × ∏\_{archimedean} π₀(X(K\_u)).
- `ModifiedAdelicPoints.ofAdelic` (projection): The surjection X(A\_K) → X(A\_K)\_•, the identity at finite places and the component map at archimedean places.
- `ModifiedAdelicPoints.proj` (projection): The projection X(A\_K)\_• → X(K\_v) at a finite place v.
- `finiteDescentLocus` (data): X(A\_K)\_•^{f-cov}: the points surviving every torsor under a finite étale group scheme.
- `finiteDescentLocus_eq_image` (compatibility): X(A\_K)\_•^{f-cov} is the image of the finite étale descent set X(A\_K)^{ét} of RP.3/descent-set.
- `rationalPoints_subset_finiteDescentLocus` (other): The image of X(K) lies in X(A\_K)\_•^{f-cov}.
- `finiteDescentLocus_map` (functoriality): A morphism X' → X maps X'(A\_K)\_•^{f-cov} into X(A\_K)\_•^{f-cov} (Stoll, Proposition 5.9).
- `StollFiniteDescentConjecture` (other): The named proposition (Stoll, Conjecture 9.1) that every smooth projective geometrically connected curve is very good, so that X(A\_K)\_•^{f-ab}, and hence X(A\_K)\_•^{f-cov}, is the closure of the image of X(K); it is a hypothesis wherever used, never a theorem.

**Unit tests.**

- `finiteDescentLocus_projectiveLine` (computation): For X = P¹\_K, X(A\_K)\_•^{f-cov} = X(A\_K)\_•.
- `modifiedAdelicPoints_spec` (degenerate): For X = Spec K, X(A\_K)\_• is a single point and lies in the locus.
- `modifiedAdelicPoints_real_component` (non-example): For an elliptic curve over Q whose real locus has two components, X(A\_Q) → X(A\_Q)\_• identifies the points of each real component; a definition keeping X(ℝ) at the real place does not have the finite descent locus as the image of RP.3's set.
- `finiteDescentLocus_rationalPoint` (compatibility): For x ∈ X(K), the image of the diagonal point (x)\_u lies in X(A\_K)\_•^{f-cov}.

**Uses.**

- Betts–Stix, Theorem B: its projection to Y(K\_v) is shown to be finite
- Harari–Stix, Theorem 2.1: identifies the locus with the adelic points coming from a global section

**Checks.**

- For X = P¹\_K the locus is all of X(A\_K)\_•, since P¹ is geometrically simply connected (Stoll, Lemma 5.8(1)).
- For a smooth projective curve of genus ≥ 2, the projection of the locus to X(K\_v) at a finite place v is the set studied in Betts–Stix, Theorem B.

**Sources.**

- Michael Stoll, §2, p. 4. Modified adelic points: the archimedean factors are replaced by their sets of connected components, with the surjection from the adelic points.
- Michael Stoll, Definition 5.2 and Definition 5.4(1), pp. 14 and 16. A modified adelic point survives a torsor under a finite étale group scheme when it lifts to some twist; the finite descent locus is the set of points surviving all such torsors.
- Michael Stoll, Lemma 5.8(1), p. 19, and Conjecture 9.1, p. 38. For a geometrically simply connected variety the locus is everything; the Main Conjecture says every curve is very good (closure of the rational points = abelian descent locus), which forces the finite descent locus to be that closure too.
- L. Alexander Betts and Jakob Stix, §1, p. 2. Recalls the modified adelic points, the finite descent locus, its containment of the rational points and Stoll's conjecture that it equals them.

**Needs.** `HeightsRationalPointsAndObstructions:RP.2/adelic-points-general`; `HeightsRationalPointsAndObstructions:RP.3/descent-set`; `ConnectedComponents`.

<a id="spm-0-harari-stix-finite-descent"></a>

### Harari–Stix: finite descent and Galois sections

**Theorem** (`SPM.0/harari-stix-finite-descent`). Planet: Harari–Stix descent theorem. Let K be a number field and X a smooth projective geometrically connected K-variety. (a) An adelic point (P\_u)\_u ∈ X(A\_K) lies in the finite étale descent set X(A\_K)^{ét} (RP.3/descent-set) if and only if there is a section class c ∈ Sect(X/K) with res\_u(c) = κ\_{X\_{K\_u}}(P\_u) for every place u of K. (b) Consequently, if X is a smooth projective geometrically connected curve of genus ≥ 1 and v is a finite place, the projection of X(A\_K)\_•^{f-cov} (SPM.0/modified-finite-descent-locus) to X(K\_v) equals loc\_v(Sec^Sel(X/K)).

**Hypotheses and conventions.**

- X smooth projective geometrically connected over a number field; in (a) every place of K, archimedean ones included, is used (the case S = ∅ of Harari–Stix).
- In (b), loc\_v is defined because the local section map is injective at finite places (SPM.0/local-section-map-injective).

**Proof sketch.**

1. (a) is Harari–Stix, Theorem 2.1, equivalence (i) ⇔ (iii), with S = ∅ and U trivial. A torsor under a finite group scheme G gives an evaluation map on local sections; survival of (P\_u) means the local evaluations come from H¹(K, G). Inverse limits over the finite quotients of π₁, with the nonempty-limit argument of Harari–Stix Proposition 1.1, produce a global section; Chebotarev's density theorem supplies the hypothesis (\*\*) of their Corollary 1.7.
2. (b), ⊆: lift a point of X(A\_K)\_•^{f-cov} to X(A\_K) by choosing real points in the given components; by the component argument of SPM.0/modified-finite-descent-locus the lift lies in X(A\_K)^{ét}. Then (a) gives c with res\_u(c) = κ(P\_u) at every place, so c is Selmer and loc\_v(c) = P\_v.
3. (b), ⊇: for a Selmer class c choose P\_u with κ(P\_u) = res\_u(c) at every place (P\_u = loc\_u(c) at finite places). By (a) the adelic point (P\_u) lies in X(A\_K)^{ét}, and its image lies in X(A\_K)\_•^{f-cov}.

**Checks.**

- Under (b), Theorem A (finiteness of loc\_v(Sec^Sel)) is equivalent to the finiteness of the projection of the finite descent locus to X(K\_v): this is Betts–Stix, Theorem B.
- For X(K) ≠ ∅ the diagonal image of a rational point corresponds to its own section in (a).

**Sources.**

- David Harari and Jakob Stix, Theorem 2.1 and its proof, Remarks (1) and (4), pp. 11–12. For an adelic point with local points everywhere outside a density-zero set, surviving every descent by finite group schemes is equivalent to the local sections coming from one global section; the proof translates Corollary 1.7 using Chebotarev.
- David Harari and Jakob Stix, §1, Propositions 1.1–1.2 and Corollary 1.7, pp. 5–10. The formal criterion: a compatible system of local sections comes from a global section exactly when it survives every finite descent obstruction, given a density hypothesis.
- L. Alexander Betts and Jakob Stix, §1, p. 2. Cites Harari–Stix (as [HS12, Theorem 11]) for the identification of the finite descent locus with the image of the Selmer sections under the total localisation map.

**Needs.** `AnabelianGeometryAndNonabelianChabauty:NC.6/section-classes`; `AnabelianGeometryAndNonabelianChabauty:NC.6/section-class-map`; [Restriction of Galois sections to decomposition groups](#spm-0-local-section-restriction); [Selmer sections and the localisation maps](#spm-0-selmer-sections); [Modified adelic points and the finite descent locus](#spm-0-modified-finite-descent-locus); `HeightsRationalPointsAndObstructions:RP.3/descent-set`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

### Dependencies of SPM.0

Stages used: `AnabelianGeometryAndNonabelianChabauty:NC.6`, `ArithmeticGaloisRepresentations:R01.2`, `HeightsRationalPointsAndObstructions:RP.2`, `HeightsRationalPointsAndObstructions:RP.3`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

## Layer SPM.1: Symplectic pairs attached to Galois sections

**Targets.** Symplectic modules and symplectic pairs (A, V) in a Q\_p-linear tensor category, Σ\_A = Hom\_{Q\_p-alg}(A, Q\_p) and the fibres V\_ψ (Betts–Stix Definitions 4.3–4.4). The pair H^{≤1}\_ét(X\_{y,F̄}, Q\_p) of a fibre of an abelian-by-finite family (Example 4.5). The relative pair R^{≤1}π\_\*Q\_p with the relative étale Chern class of the polarisation (§7.1). The pair (A\_s, V\_s) of a section, independent of conjugacy and base point (§7.2). Restriction of local systems along a section at a local point (Remark 1.5, Proposition 7.2). The adelic Lawrence–Venkatesh locus (Definition 6.1) and Theorem 7.1: Selmer sections localise into it, for every abelian-by-finite family.

<a id="spm-1-symplectic-pair"></a>

### Symplectic modules and symplectic pairs

**Definition** (`SPM.1/symplectic-pair`). Planet: Symplectic pairs. Let C be one of the Q\_p-linear tensor categories below, with its underlying-module realisations: the continuous Q\_p-representations of a profinite group G, the filtered discrete (φ, N, G\_v)-modules of SPM.2/restriction-induction, or the Q\_p-local systems on a scheme. An algebra in C is a commutative unital algebra object A; for G-representations, a finite-dimensional commutative Q\_p-algebra with a continuous G-action by algebra automorphisms. A symplectic A-module in C is a triple (V, L, ω) with V an A-module in C that is finite locally free over A, L an A-module in C free of rank one over A, and ω: ∧²\_A V → L a morphism in C that is A-linear and perfect (it induces V ≅ Hom\_A(V, L)). A symplectic pair is (A, V) with V a symplectic A-module (L and ω understood); a morphism (A, V) → (A′, V′) is a triple of morphisms f\_A: A → A′ of algebras, f\_V: V → V′ and f\_L: L → L′ in C, compatible with the module structures (f\_V(av) = f\_A(a)f\_V(v), and likewise for f\_L) and with the pairings (f\_L ∘ ω = ω′ ∘ ∧²f\_V). SP(C) is the category of symplectic pairs and π₀SP(C) its set of isomorphism classes. For G-representations, Σ\_A := Hom\_{Q\_p-alg}(A, Q\_p) is a finite set with a continuous right G-action; for ψ ∈ Σ\_A with stabiliser G\_ψ, V\_ψ := Q\_p ⊗\_{A,ψ} V is a symplectic representation of G\_ψ with similitude line L\_ψ.

**Hypotheses and conventions.**

- For G-representations, A is a finite-dimensional commutative Q\_p-algebra, possibly non-reduced or non-split, and Σ\_A consists of its Q\_p-points only, not its Q̄\_p-points. In MF(φ,N,G\_v), the corresponding finite algebras are over the realisation fields Q\_p^nr and K\_v.
- V is finite locally free over A, of constant rank 2d when A is connected; L is free of rank one.
- The definition is internal to C; finiteness, local freeness and the rank of the line are checked on its underlying coefficient modules. A Q\_p-valued neutral fibre functor is not assumed for MF(φ, N, G\_v): its de Rham realisation is K\_v-valued and its potentially semistable realisation is Q\_p^nr-valued.

**Proof sketch.**

1. Take ∧²\_A V in C using the symmetric monoidal structure and the A-module structure; perfectness is a condition on the underlying A-modules.
2. Base change along ψ: A → Q\_p preserves perfectness, giving (V\_ψ, L\_ψ, ω\_ψ) with an action of G\_ψ.
3. If A = ∏\_{ψ∈Σ} Q\_p is split and Σ is one G-orbit with base point ψ₀, then V ≅ ∏\_ψ V\_ψ and V = Ind\_{G\_{ψ₀}}^{G} V\_{ψ₀} as symplectic modules over A = Ind\_{G\_{ψ₀}}^G Q\_p (structure of modules over artinian rings, as in the proof of Betts–Stix Proposition 6.7).
4. The tensor functors used here, compatible with the underlying-module realisations (restriction, coefficient extension, and D\_pH), preserve finite locally free modules, rank-one lines and perfect alternating pairings. A fully faithful such functor reflects isomorphism classes of pairs.

**API.**

- `SymplecticModule` (structure): The triple (V, L, ω) over an algebra A in C, with V finite locally free, L free of rank one and ω: ∧²\_A V → L perfect.
- `SymplecticPair` (structure): The pair (A, V) with V a symplectic A-module; morphisms compatible with algebra, module, line and pairing.
- `SymplecticPair.points` (data): Σ\_A = Hom\_{Q\_p-alg}(A, Q\_p) with its right G-action, finite since A is artinian.
- `SymplecticPair.fibre` (functoriality): V\_ψ = Q\_p ⊗\_{A,ψ} V, a symplectic representation of the stabiliser G\_ψ.
- `SymplecticPair.decompose` (characterisation): For split A, V ≅ ∏\_{ψ∈Σ\_A} V\_ψ, and on a transitive orbit V ≅ Ind\_{G\_{ψ₀}}^{G} V\_{ψ₀}.
- `SymplecticPair.restrict` (functoriality): Restriction of a pair of G-representations to a closed subgroup H gives a pair of H-representations.
- `SymplecticPair.mapFunctor` (functoriality): A tensor functor compatible with the underlying-module realisations and preserving finite locally free modules and rank-one lines induces SP(C) → SP(C′), with map\_id and map\_comp.
- `SymplecticModule.IsIsotropic` (data): A submodule W ≤ V with ω(W, W) = 0.
- `SymplecticModule.IsLagrangian` (data): An isotropic W equal to its own orthogonal; over a field with V of dimension 2d, an isotropic subspace of dimension d.
- `SymplecticPair.isoClasses` (data): π₀SP(C), the set of isomorphism classes, the target of the maps of Proposition 4.11.
- `SymplecticPair.toPeriodVariety` (compatibility): Forgetting the G-action, a symplectic module over a finite étale algebra over a field is the datum of MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety, whose Lagrangian submodules form the period domain.
- `SymplecticPair.Hom.ext` (extensionality): Two morphisms of pairs are equal if their algebra, module and line components are equal; a morphism is an isomorphism exactly when all three components are isomorphisms.

**Unit tests.**

- `SymplecticPair.elliptic` (computation): For an elliptic curve E/K, (Q\_p, H¹\_ét(E\_{K̄}, Q\_p)) with the Weil pairing to Q\_p(−1) is a symplectic pair of rank 2 over A = Q\_p; Σ\_A is a single point.
- `SymplecticPair.zero_module` (degenerate): For any A, (A, 0) with L = A is a symplectic pair of rank 0, and its fibre V\_ψ is zero for every ψ.
- `SymplecticPair.induced` (computation): For A = Q\_p × Q\_p with G acting through a quotient Z/2 by swapping the factors, a pair (A, V) is the same as a symplectic representation W of the index-two subgroup H together with V = Ind\_H^G W; Σ\_A has two points exchanged by G.
- `SymplecticPair.non_split_points` (non-example): For A = Q\_{p²} with trivial action, Σ\_A = Hom\_{Q\_p-alg}(Q\_{p²}, Q\_p) = ∅ although A is étale of dimension 2: Σ\_A counts Q\_p-points, not geometric points.
- `SymplecticPair.degenerate_form` (non-example): On V = Q\_p² with A = Q\_p, the alternating form ω = 0 is not perfect, so (Q\_p, V) with ω = 0 is not a symplectic pair.
- `SymplecticPair.wrong_line` (non-example): For A = Q\_p, V = 0 and L = Q\_p² the unique pairing is alternating and induces 0 ≅ Hom\_A(0,L), but it is not a symplectic module because L has rank two. Perfectness alone does not impose the rank-one condition.

**Uses.**

- Betts–Stix, Definition 1.2 and Definition 6.2: S-good pairs are symplectic pairs of G\_K-representations
- Betts–Stix, Proposition 6.7: the trichotomy decomposes V over the points ψ ∈ Σ\_A
- Betts–Stix, Definition 4.10 and Proposition 4.11: D\_pH sends symplectic pairs of de Rham representations to symplectic pairs of filtered (φ, N, G\_v)-modules
- Betts–Stix, §7.2: a Galois section gives a symplectic pair of G\_K-representations

**Checks.**

- An elliptic curve E over K gives (Q\_p, H¹\_ét(E\_{K̄}, Q\_p)) with the Weil pairing to Q\_p(−1).
- A split algebra A = Q\_p × Q\_p with G acting by the swap gives V = Ind V\_ψ as in the proof step.

**Sources.**

- L. Alexander Betts and Jakob Stix, Definitions 4.3–4.4 and Example 4.5, pp. 33–34. A symplectic module over an algebra in a tensor category is a locally free module with a perfect alternating pairing to a rank-one module; symplectic pairs form a category, defined in any tensor category; the cohomology of a fibre of an abelian-by-finite family is the basic example.
- L. Alexander Betts and Jakob Stix, §6.1, pp. 45–46. Σ\_A is the finite set of Q\_p-algebra maps A → Q\_p with its Galois action, and V\_ψ the base change along ψ, a symplectic representation of the stabiliser.
- L. Alexander Betts and Jakob Stix, §2.1, definition before Definition 2.3, p. 7. A symplectic Galois representation is a triple (V, L, ω) with L one-dimensional and ω a perfect equivariant alternating pairing.

**Needs.** `InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-representations`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`; `LinearMap.IsAlt`; `LinearMap.Nondegenerate`; `Matrix.symplecticGroup`.

<a id="spm-1-fibre-symplectic-pair"></a>

### The symplectic pair of a fibre

**Construction** (`SPM.1/fibre-symplectic-pair`). Let X → Y′ → Y be an abelian-by-finite family (LV.2/abelian-by-finite-family) over a scheme Y of characteristic zero with polarisation λ, F a field and y ∈ Y(F). Then H^{≤1}\_ét(X\_{y,F̄}, Q\_p) := (H⁰\_ét(X\_{y,F̄}, Q\_p), H¹\_ét(X\_{y,F̄}, Q\_p)), with the pairing ω\_λ^ét: ∧² over H⁰\_ét of H¹\_ét → H⁰\_ét(−1) of the polarisation, is a symplectic pair of continuous G\_F-representations (SPM.1/symplectic-pair). Its algebra H⁰\_ét(X\_{y,F̄}, Q\_p) = H⁰\_ét(Y′\_{y,F̄}, Q\_p) = ∏\_{Y′\_y(F̄)} Q\_p is split, with Σ = Y′\_y(F̄) as a G\_F-set, and its fibre at the point ψ given by y′ ∈ Y′\_y(F̄) is H¹\_ét of the abelian variety X\_{y′} over F(y′). Isomorphisms of families over Y induce isomorphisms of pairs, and the construction commutes with field extension F ⊆ F′.

**Hypotheses and conventions.**

- The family has constant relative dimension d > 0 over Y′, so H¹\_ét has constant rank 2d over H⁰\_ét.
- char F = 0, so étale cohomology with Q\_p coefficients behaves as in LV.2 and the decomposition over Y′\_y(F̄) holds.

**Proof sketch.**

1. Decompose X\_y = ⊔\_{y′} X\_{y′} over the closed points of Y′\_y; H^•\_ét(X\_{y,F̄}) = ∏\_{y′} Ind\_{G\_{F(y′)}}^{G\_F} H^•\_ét(X\_{ȳ′}) as algebras (Betts–Stix (4.1)).
2. The polarisation pairing on each H¹\_ét(X\_{ȳ′}) (LV.1/abelian-variety-cohomology-properties(d)) assembles to the H⁰\_ét-linear perfect pairing of Lemma 4.2, requested from LV.2 in the model-free form.
3. Functoriality and base change follow from those of étale cohomology and of the Chern class of the Poincaré bundle.

**API.**

- `fibreSymplecticPair` (constructor): H^{≤1}\_ét(X\_{y,F̄}, Q\_p) as a symplectic pair of G\_F-representations.
- `fibreSymplecticPair.points` (characterisation): Σ of its algebra is Y′\_y(F̄) as a G\_F-set.
- `fibreSymplecticPair.fibre` (characterisation): At the point y′ ∈ Y′\_y(F̄) the fibre V\_ψ is H¹\_ét(X\_{y′, F̄}, Q\_p) with the polarisation pairing of X\_{y′}.
- `fibreSymplecticPair.baseChange` (functoriality): For F ⊆ F′, the pair of y ∈ Y(F′) restricts the pair of y ∈ Y(F) along G\_{F′} → G\_F.
- `fibreSymplecticPair.isSplit` (other): The algebra is split: isomorphic to Q\_p^n with n = #Y′\_y(F̄).

**Unit tests.**

- `fibreSymplecticPair.abelianScheme` (degenerate): When Y′ = Y the pair is (Q\_p, H¹\_ét(X\_{ȳ}, Q\_p)) with Σ a point.
- `fibreSymplecticPair.elliptic` (computation): For the Legendre family over Y = P¹ ∖ {0, 1, ∞} and y ∈ Y(Q), the pair is (Q\_p, H¹\_ét(E\_y, Q\_p)) of rank 2 with the Weil pairing.
- `fibreSymplecticPair.points_card` (computation): #Σ = deg(Y′ → Y) for every y, because Y′ → Y is finite étale.
- `fibreSymplecticPair.not_algebra_iso` (non-example): Two points y, y₁ whose fibres Y′\_y and Y′\_{y₁} are not isomorphic as F-schemes have non-isomorphic algebras H⁰\_ét, so their pairs are not isomorphic even if the H¹\_ét are isomorphic as representations.

**Uses.**

- Betts–Stix, Definition 1.2: the Lawrence–Venkatesh locus compares H^{≤1}\_ét(X\_{y\_v}) with the restriction of a global pair
- Betts–Stix, §7.1: the fibres of the relative symplectic pair are these pairs

**Checks.**

- For Y′ = Y (a polarised abelian scheme) the algebra is Q\_p and the pair is (Q\_p, H¹\_ét(X\_{ȳ}, Q\_p)) with the polarisation pairing.
- Σ = Y′\_y(F̄) is the G\_F-set whose orbits are the closed points of Y′\_y (Betts–Stix Remark 6.6).

**Sources.**

- L. Alexander Betts and Jakob Stix, Example 4.5 and §4.1.1, (4.1) and Lemma 4.2, pp. 32–34. For a point of the base, the étale cohomology of the fibre in degrees ≤ 1 is a symplectic pair: H⁰ is an algebra, H¹ a symplectic module over it through the polarisation, and the cohomology decomposes as a product of inductions over the closed points of Y′\_y.
- L. Alexander Betts and Jakob Stix, Remark 6.6, p. 46. H⁰ of the fibre is the split algebra of functions on the geometric points of Y′\_y, so its Q\_p-points are Y′\_y(F̄).

**Needs.** [Symplectic modules and symplectic pairs](#spm-1-symplectic-pair); `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`; `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`; `MordellLawrenceVenkatesh:LV.2`.

<a id="spm-1-relative-symplectic-pair"></a>

### The relative symplectic pair R^{≤1}π\_\*Q\_p

**Construction** (`SPM.1/relative-symplectic-pair`). Let π: X → Y′ → Y be an abelian-by-finite family over a normal connected scheme Y of characteristic zero, with polarisation λ. Then R^•π\_\*Q\_p ≅ ∧^• over π\_\*Q\_p of R¹π\_\*Q\_p as Q\_p-local systems on Y\_ét. The relative Chern class c₁^ét(λ)/Y := ½ c₁^ét((1, λ)^\*P)/Y ∈ H⁰(Y, R²π\_\*Q\_p(1)) is defined as the image of the class of a line bundle under H¹(X, G\_m) → H⁰(Y, R¹π\_\*G\_m) → H⁰(Y, R²π\_\*Z\_p(1)) → H⁰(Y, R²π\_\*Q\_p(1)) (Leray, then the limit of Kummer boundaries). It induces a perfect pairing ω\_λ: ∧² over π\_\*Q\_p of R¹π\_\*Q\_p → π\_\*Q\_p(−1), so R^{≤1}π\_\*Q\_p := (π\_\*Q\_p, R¹π\_\*Q\_p) is a symplectic pair of Q\_p-local systems on Y\_ét. Its fibre at a geometric point ȳ is the pair H^{≤1}\_ét(X\_ȳ, Q\_p) of SPM.1/fibre-symplectic-pair, compatibly with the Galois action when ȳ lies over a point with values in a field.

**Hypotheses and conventions.**

- Y normal and connected, so Q\_p-local systems are continuous representations of π₁^ét(Y) (IG.0/adic-representations).
- π smooth proper, so the higher direct images are local systems compatible with base change.

**Proof sketch.**

1. The isomorphism ∧^• R¹ → R^• is checked on geometric fibres, where it is the cohomology of abelian varieties.
2. Construct c₁^ét(L)/Y: Leray low-degree terms H¹(X, G\_m) → H⁰(Y, R¹π\_\*G\_m), then the Kummer boundaries R¹π\_\*G\_m → R²π\_\*μ\_{p^n}, compatible in n, then tensor with Q\_p.
3. The fibre of c₁^ét(λ)/Y at ȳ is c₁^ét(λ\_ȳ), by functoriality of the Leray sequence; the induced pairing is perfect on every fibre by the étale part of the LV.2 request, hence perfect.
4. The pair of the fibre is H^{≤1}\_ét(X\_ȳ, Q\_p) by proper base change.

**API.**

- `relativeSymplecticPair` (constructor): (π\_\*Q\_p, R¹π\_\*Q\_p) with ω\_λ, a symplectic pair of Q\_p-local systems on Y\_ét.
- `relativeChernClass` (data): c₁^ét(L)/Y ∈ H⁰(Y, R²π\_\*Q\_p(1)) for a line bundle L on X, from Leray and Kummer.
- `relativeChernClass_fibre` (compatibility): The fibre of c₁^ét(L)/Y at a geometric point ȳ is c₁^ét(L|X\_ȳ).
- `relativeSymplecticPair_fibre` (compatibility): The fibre at ȳ is H^{≤1}\_ét(X\_ȳ, Q\_p), Galois-equivariantly for points over fields.
- `relativeSymplecticPair.pullback` (functoriality): For f: Y₁ → Y, the pair of the pulled-back family is the pullback of the pair.

**Unit tests.**

- `relativeSymplecticPair.point` (degenerate): Over Y = Spec F the construction returns the pair of a single fibre with its G\_F-action.
- `relativeSymplecticPair.legendre` (computation): For the Legendre family E\_λ: y² = x(x − 1)(x − λ) over P¹ ∖ {0, 1, ∞}\_Q, π\_\*Q\_p = Q\_p and R¹π\_\*Q\_p is a rank-2 local system with the Weil pairing to Q\_p(−1); its geometric monodromy is Zariski dense in SL₂.
- `relativeSymplecticPair.chern_fibre` (compatibility): The fibre of c₁^ét(λ)/Y at ȳ equals c₁^ét(λ\_ȳ) ∈ H²\_ét(X\_ȳ, Q\_p(1)).
- `relativeSymplecticPair.not_trivial` (non-example): For the Legendre family the local system R¹π\_\*Q\_p is not constant, so the pair is not the pullback of a pair over Spec Q.

**Uses.**

- Betts–Stix, §7.2: its π₁-representations are restricted along a Galois section

**Checks.**

- For Y′ = Y = Spec F the relative pair is the pair of SPM.1/fibre-symplectic-pair with its G\_F-action.
- The rank of R¹π\_\*Q\_p over π\_\*Q\_p is 2d.

**Sources.**

- L. Alexander Betts and Jakob Stix, §7.1, p. 55. The relative étale cohomology of an abelian-by-finite family is a local system with R^• the exterior algebra on R¹ over π\_\*Q\_p; the relative Chern class of the polarisation, built from the Leray and Kummer sequences, gives a perfect pairing whose fibres are those of the fibres.

**Needs.** [The symplectic pair of a fibre](#spm-1-fibre-symplectic-pair); [Symplectic modules and symplectic pairs](#spm-1-symplectic-pair); `InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-representations`; `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`; `MordellLawrenceVenkatesh:LV.2`.

<a id="spm-1-section-symplectic-pair"></a>

### The symplectic pair attached to a Galois section

**Construction** (`SPM.1/section-symplectic-pair`). Planet: Symplectic pair of a section. Let K be a number field, Y/K a smooth projective geometrically connected curve, X → Y′ → Y an abelian-by-finite family and η̄ a geometric point of Y\_{K̄}. Let (A, V) be the symplectic pair of continuous π₁^ét(Y, η̄)-representations corresponding to R^{≤1}π\_\*Q\_p (SPM.1/relative-symplectic-pair, IG.0/adic-representations). For a continuous section s: G\_K → π₁^ét(Y, η̄), (A\_s, V\_s) is (A, V) with G\_K acting through s: a symplectic pair of G\_K-representations. Conjugating s by γ ∈ π₁^ét(Y\_{K̄}, η̄) gives an isomorphic pair (the action of γ is a G\_K-equivariant isomorphism), and changing η̄ along an étale path gives an isomorphic pair; so the isomorphism class [A\_s, V\_s] ∈ π₀SP(Rep\_{Q\_p}(G\_K)) depends only on the class of s in Sect(Y/K).

**Hypotheses and conventions.**

- Y geometrically connected, so the fundamental exact sequence is exact and sections are defined (NC.6/section-classes).
- The family is fixed; its pair is a pair of π₁^ét(Y)-representations.

**Proof sketch.**

1. Restrict the π₁^ét(Y)-actions on A and V along s; the algebra, module, line and pairing structures are π₁-equivariant, so they remain G\_K-equivariant.
2. For s′ = γsγ⁻¹, the action of γ on A and V intertwines the two restricted actions and preserves all structures.
3. For another base point, an étale path γ conjugates the fundamental exact sequences (Betts–Stix (†) of §7.2); its action identifies the pairs for s and γsγ⁻¹.

**API.**

- `sectionSymplecticPair` (constructor): (A\_s, V\_s): the pair of R^{≤1}π\_\*Q\_p restricted along a section s.
- `sectionSymplecticPair_conj` (extensionality): For s′ = γsγ⁻¹ with γ in the geometric kernel, the action of γ is an isomorphism (A\_s, V\_s) ≅ (A\_{s′}, V\_{s′}).
- `sectionSymplecticPair_basepoint` (equivalence): An étale path between base points identifies the pairs of corresponding sections.
- `sectionSymplecticPair.class` (data): The induced map Sect(Y/K) → π₀SP(Rep\_{Q\_p}(G\_K)).
- `sectionSymplecticPair_point` (compatibility): For y ∈ Y(K), the pair of s\_y is H^{≤1}\_ét(X\_{y,K̄}, Q\_p).

**Unit tests.**

- `sectionSymplecticPair.trivialFamily` (degenerate): For the constant family X = Y × A₀ → Y (Y′ = Y, A₀ an abelian variety over K) the pair of every section is (Q\_p, H¹\_ét(A₀,K̄, Q\_p)), independent of s.
- `sectionSymplecticPair.rationalPoint` (computation): For a rational point y the pair of κ(y) is the pair of the fibre at y.
- `sectionSymplecticPair.class_wellDefined` (characterisation): Conjugate sections give isomorphic pairs, so the class depends only on the section class.
- `sectionSymplecticPair.raw_not_equal` (non-example): For conjugate sections s ≠ γsγ⁻¹ the two restricted actions on the same underlying module are in general different homomorphisms G\_K → GL(V); only their isomorphism classes agree.

**Uses.**

- Betts–Stix, Theorem 7.1: the pair (A\_s, V\_s) of a Selmer section is the interpolating pair of Definition 6.1
- Betts–Stix, Remark 1.5: any v-adic obstruction from a Q\_p-local system is transported to sections the same way

**Checks.**

- For y ∈ Y(K) and its section s\_y, (A\_{s\_y}, V\_{s\_y}) ≅ H^{≤1}\_ét(X\_{y,K̄}, Q\_p) (the case u = global of SPM.1/sections-restrict-local-systems).
- The class map Sect(Y/K) → π₀SP(Rep\_{Q\_p}(G\_K)) is well defined.

**Sources.**

- L. Alexander Betts and Jakob Stix, §7.2, p. 56. A section restricts the π₁-representations of the relative cohomology to G\_K, giving a symplectic pair whose isomorphism class depends only on the conjugacy class of the section and not on the base point.

**Needs.** [The relative symplectic pair R^{≤1}π\_\*Q\_p](#spm-1-relative-symplectic-pair); [Symplectic modules and symplectic pairs](#spm-1-symplectic-pair); `AnabelianGeometryAndNonabelianChabauty:NC.6/section-classes`; `InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-representations`.

<a id="spm-1-sections-restrict-local-systems"></a>

### Local systems restricted along sections at local points

**Theorem** (`SPM.1/sections-restrict-local-systems`). Let K be a number field, Y/K a geometrically connected variety, 𝕃 a Q\_p-local system on Y\_ét with π₁^ét(Y, η̄)-representation ρ, u a place of K and y\_u ∈ Y(K\_u). If c ∈ Sect(Y/K) satisfies res\_u(c) = κ\_{Y\_{K\_u}}(y\_u), then for any representative s of c the G\_u-representation (ρ ∘ s)|G\_u (restriction along ι^\*: G\_u → G\_K) is isomorphic to the fibre 𝕃\_{ȳ\_u} at the geometric point over y\_u with its G\_u-action. The isomorphism is compatible with tensor products, duals and morphisms of local systems; in particular it carries algebra, module and pairing structures to the same structures.

**Hypotheses and conventions.**

- The place u may be archimedean; the statement uses only res\_u(c) = κ(y\_u).
- The isomorphism depends on the choice of a path from η̄ to ȳ\_u, which changes it by an inner automorphism compatible with all structures.

**Proof sketch.**

1. Choose the base point at ȳ\_u by an étale path; this replaces s by a conjugate and ρ by an isomorphic representation (SPM.1/section-symplectic-pair).
2. With this base point, κ(y\_u) is represented by π₁(Spec K\_u) → π₁(Y\_{K\_u}, ȳ\_u) → π₁(Y, ȳ\_u), induced by the morphism of pointed schemes (Spec K\_u, Spec K̄\_u) → (Y\_{K\_u}, ȳ\_u) (SPM.0/local-section-restriction).
3. By the definition of π₁ as the automorphisms of the fibre functor, pulling 𝕃 back along this morphism is the representation of G\_u on the fibre 𝕃\_{ȳ\_u}; so (ρ ∘ s)|G\_u is the fibre (Betts–Stix, proof of Proposition 7.2).
4. All constructions are functorial in 𝕃, so they respect tensor products and morphisms.

**Checks.**

- For u the global field itself (a rational point y and s = s\_y) the statement gives (ρ ∘ s\_y) ≅ 𝕃\_ȳ as G\_K-representations.
- The same argument, applied to a finite étale cover Z → Y (a local system of finite sets, not stated in the source), gives the G\_u-set of geometric points of the fibre Z\_{y\_u}.

**Sources.**

- L. Alexander Betts and Jakob Stix, Remark 1.5, pp. 3–4. Any v-adic obstruction to rational points coming from a Q\_p-local system on Y constrains the image of loc\_v on Selmer sections, by restricting the corresponding π₁-representation along the section.
- L. Alexander Betts and Jakob Stix, Proposition 7.2 and proof, p. 56. If the restriction of a section to G\_u is the section of a local point, the restricted representations of the relative cohomology are the cohomology of the fibre at that point, by choosing the base point there and using the definition of π₁.

**Needs.** [Restriction of Galois sections to decomposition groups](#spm-0-local-section-restriction); `AnabelianGeometryAndNonabelianChabauty:NC.6/section-class-map`; `InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-representations`; `ArithmeticGaloisRepresentations:R01.2/local-restriction`; [The symplectic pair attached to a Galois section](#spm-1-section-symplectic-pair).

<a id="spm-1-selmer-pair-interpolates"></a>

### The pair of a section interpolates its local points

**Theorem** (`SPM.1/selmer-pair-interpolates`). Let K, Y and X → Y′ → Y be as in SPM.1/section-symplectic-pair, s a section and u a place of K. If res\_u[s] = κ(y\_u) for y\_u ∈ Y(K\_u), then (A\_s|G\_u, V\_s|G\_u) ≅ H^{≤1}\_ét(X\_{y\_u,K̄\_u}, Q\_p) as symplectic pairs of G\_u-representations.

**Hypotheses and conventions.**

- As in SPM.1/sections-restrict-local-systems; the pairing structure is carried by the isomorphism because ω\_λ is a morphism of local systems.

**Proof sketch.**

1. Apply SPM.1/sections-restrict-local-systems to π\_\*Q\_p and R¹π\_\*Q\_p and to the pairing ω\_λ.
2. The fibre of R^{≤1}π\_\*Q\_p at ȳ\_u is H^{≤1}\_ét(X\_{y\_u,K̄\_u}, Q\_p) by SPM.1/relative-symplectic-pair.

**Checks.**

- For a Selmer section s, the pair (A\_s, V\_s) has the local restriction H^{≤1}\_ét(X\_{loc\_u(s)}) at every finite place u.

**Sources.**

- L. Alexander Betts and Jakob Stix, Proposition 7.2, p. 56. The restriction of the pair of a section to a decomposition group is the pair of the fibre at the local point whose section is the restricted section.

**Needs.** [Local systems restricted along sections at local points](#spm-1-sections-restrict-local-systems); [The relative symplectic pair R^{≤1}π\_\*Q\_p](#spm-1-relative-symplectic-pair); [The symplectic pair attached to a Galois section](#spm-1-section-symplectic-pair).

<a id="spm-1-adelic-lv-locus"></a>

### The adelic Lawrence–Venkatesh locus

**Definition** (`SPM.1/adelic-lv-locus`). Planet: Adelic Lawrence–Venkatesh locus. Let K be a number field, Y/K a smooth projective geometrically connected curve, X → Y′ → Y an abelian-by-finite family and p a prime. The adelic Lawrence–Venkatesh locus Y(A\_K)^LV\_X ⊆ Y(A\_K) = ∏\_u Y(K\_u) is the set of adelic points (y\_u)\_u for which some symplectic pair (A, V) of continuous Q\_p-representations of G\_K satisfies H^{≤1}\_ét(X\_{y\_u,K̄\_u}, Q\_p) ≅ (A|G\_u, V|G\_u) as symplectic pairs of G\_u-representations for every place u; such (A, V) interpolates (y\_u). For a p-adic place v, Y(K\_v)^LV\_X is the projection of Y(A\_K)^LV\_X to Y(K\_v).

**Hypotheses and conventions.**

- All places of K are used, the archimedean ones included; restriction to G\_u is through the embedding fixed at u (R01.2/local-restriction), and the condition does not depend on it.

**Proof sketch.**

1. Both sides of each condition are pairs of G\_u-representations (SPM.1/fibre-symplectic-pair, R01.2/local-restriction); isomorphism of symplectic pairs is that of SPM.1/symplectic-pair.
2. Changing the embedding at u conjugates the restriction by an element of G\_K, which is an isomorphism of pairs; so the condition is independent of choices.

**API.**

- `adelicLVLocus` (data): Y(A\_K)^LV\_X ⊆ Y(A\_K): the adelic points interpolated by a global symplectic pair.
- `Interpolates` (other): The relation 'the pair (A, V) interpolates (y\_u)\_u'.
- `localLVLocus` (projection): Y(K\_v)^LV\_X, the projection of the adelic locus to a p-adic place v.
- `adelicLVLocus_rational` (other): The diagonal image of Y(K) lies in Y(A\_K)^LV\_X.
- `adelicLVLocus_mono` (other): If X₁ → X is a morphism of abelian-by-finite families over Y inducing an isomorphism on H^{≤1}, the loci agree.

**Unit tests.**

- `adelicLVLocus.rationalPoint` (computation): For y ∈ Y(K), (y)\_u lies in Y(A\_K)^LV\_X, interpolated by H^{≤1}\_ét(X\_{y,K̄}, Q\_p).
- `adelicLVLocus.constantFamily` (degenerate): For the constant family Y × A₀ → Y every adelic point lies in the locus, interpolated by (Q\_p, H¹\_ét(A₀,K̄, Q\_p)): a constant family gives no obstruction.
- `adelicLVLocus.localOnly` (non-example): Assume Y(A\_K) is nonempty. For a Kodaira–Parshin family X\_q with q chosen as in SPM.8/kodaira-parshin-choice at a self-conjugate finite v, the projection of the adelic Lawrence–Venkatesh locus is finite, whereas Y(K\_v) is infinite. Fixing points at all other places and varying y\_v gives adelic points with geometric, hence de Rham, fibre pairs of the correct weights which cannot all admit one globally interpolating pair.
- `adelicLVLocus.projection` (characterisation): y\_v ∈ Y(K\_v)^LV\_X if and only if y\_v is the v-component of some point of Y(A\_K)^LV\_X.

**Uses.**

- Betts–Stix, Theorem 7.1: Selmer sections localise into its projection
- Betts–Stix, Lemma 6.4: its projection lies in the S-good locus Y(K\_v)^LV\_{X,S}

**Checks.**

- The diagonal image of y ∈ Y(K) lies in the locus, interpolated by H^{≤1}\_ét(X\_{y,K̄}, Q\_p).
- If Y(A\_K) = ∅ the locus is empty.

**Sources.**

- L. Alexander Betts and Jakob Stix, Definition 6.1, p. 43. An adelic point lies in the adelic Lawrence–Venkatesh locus when a global symplectic pair of Galois representations restricts at every place to the cohomology of the fibre at the local point; the v-adic locus is its projection.

**Needs.** [Symplectic modules and symplectic pairs](#spm-1-symplectic-pair); [The symplectic pair of a fibre](#spm-1-fibre-symplectic-pair); `ArithmeticGaloisRepresentations:R01.2/local-restriction`; `HeightsRationalPointsAndObstructions:RP.2/adelic-points-general`.

<a id="spm-1-selmer-sections-in-lv-locus"></a>

### Selmer sections localise into the Lawrence–Venkatesh locus

**Theorem** (`SPM.1/selmer-sections-in-lv-locus`). Planet: Selmer sections in the LV locus. Let K be a number field, Y/K a smooth projective geometrically connected curve of genus ≥ 2, v a p-adic place and X → Y′ → Y any abelian-by-finite family. For every Selmer section s ∈ Sec^Sel(Y/K) the adelic point (loc\_u(s))\_u (with any local point giving res\_u[s] at the archimedean places) lies in Y(A\_K)^LV\_X, interpolated by (A\_s, V\_s); hence loc\_v(Sec^Sel(Y/K)) ⊆ Y(K\_v)^LV\_X.

**Hypotheses and conventions.**

- Genus ≥ 2, as in the source; the argument uses only that loc\_u is defined at finite places, which holds in genus ≥ 1 (SPM.0/selmer-sections).

**Proof sketch.**

1. For each place u choose y\_u with κ(y\_u) = res\_u[s], which exists because s is Selmer; at finite places y\_u = loc\_u(s).
2. By SPM.1/selmer-pair-interpolates, (A\_s, V\_s) restricts to H^{≤1}\_ét(X\_{y\_u}) at every place, so it interpolates (y\_u)\_u.
3. Project to the place v.

**Checks.**

- For s = κ(y) with y ∈ Y(K) this recovers Y(K) ⊆ Y(K\_v)^LV\_X.
- Combined with SPM.6/adelic-locus-in-lv-locus it gives loc\_v(Sec^Sel) ⊆ Y(K\_v)^LV\_{X,S} for suitable S.

**Sources.**

- L. Alexander Betts and Jakob Stix, Theorem 7.1 and its proof, pp. 54 and 56. For every abelian-by-finite family the image of the localisation map on Selmer sections lies in the Lawrence–Venkatesh locus, the pair of the section interpolating the adelic point.
- L. Alexander Betts and Jakob Stix, §1.1.1, p. 3. Outline: restricting the relative cohomology along a Selmer section gives an S-good pair witnessing that loc\_v(s) lies in the locus; this half of the argument is the easy one.

**Needs.** [Selmer sections and the localisation maps](#spm-0-selmer-sections); [The symplectic pair attached to a Galois section](#spm-1-section-symplectic-pair); [The pair of a section interpolates its local points](#spm-1-selmer-pair-interpolates); [The adelic Lawrence–Venkatesh locus](#spm-1-adelic-lv-locus).

### Dependencies of SPM.1

Stages used: `AnabelianGeometryAndNonabelianChabauty:NC.6`, `ArithmeticGaloisRepresentations:R01.2`, `GaloisSectionsPadicPeriodMaps:SPM.0`, `HeightsRationalPointsAndObstructions:RP.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `MordellLawrenceVenkatesh:LV.1`, `MordellLawrenceVenkatesh:LV.2`, `MordellLawrenceVenkatesh:LV.3`.

## Layer SPM.2: Filtered discrete (φ, N, G\_v)-modules and their automorphism groups

**Targets.** The category MF(φ, N, G\_v) of triples (D\_pst, D\_dR, c\_BO), its comparison with filtered (φ, N, Gal(L/K\_v))-modules, D\_pH and p-adic Hodge cohomology H^•\_pH with Scholze's c\_dR; restriction to G\_w and induction to G\_v with the adjunction and the base-change isomorphisms (2.1), (2.2) (Betts–Stix §2.2.1–2.2.3). Automorphism groups Aut(D), Aut^GSp(D), their action on the Weil-restricted flag variety and the retwists M(Φ) (Definition 2.13, Remark 2.14). The orbit lemma (Lemma 2.15). The dimension bounds d² and d(2d + 1) + 1, with the proof's injectivity repaired by using φ (Proposition 2.16, extraction E2). The full faithfulness of D\_pH (Theorem 2.9) is requested from PadicHodgeTheory.

<a id="spm-2-restriction-induction"></a>

### Filtered discrete (φ, N, G\_v)-modules: restriction and induction

**Construction** (`SPM.2/restriction-induction`). Planet: Filtered discrete (φ, N, G\_v)-modules. Let K\_v be a finite extension of Q\_p inside a fixed algebraic closure K̄\_v, Q\_p^nr ⊆ K̄\_v the maximal unramified extension of Q\_p and G\_v = Gal(K̄\_v/K\_v). A (φ, N, G\_v)-module is a finite-dimensional Q\_p^nr-space D with a bijective Frobenius-semilinear φ, a Q\_p^nr-linear N with Nφ = pφN, and a semilinear G\_v-action commuting with φ and N; it is discrete when stabilisers of vectors are open. A filtered discrete (φ, N, G\_v)-module is a triple D = (D\_pst, D\_dR, c\_BO) with D\_pst a discrete (φ, N, G\_v)-module, D\_dR a finite-dimensional K\_v-space with an exhaustive separated decreasing filtration F^•, and c\_BO: K̄\_v ⊗\_{Q\_p^nr} D\_pst ≅ K̄\_v ⊗\_{K\_v} D\_dR a G\_v-equivariant isomorphism; with the evident morphisms and tensor products these form the ⊗-category MF(φ, N, G\_v). It is equivalent to the colimit over finite Galois L/K\_v of the filtered (φ, N, Gal(L/K\_v))-modules of R06.2/plan/filtered-phi-n-modules-with-descent-data. For de Rham V, D\_pH(V) := (D\_pst(V), D\_dR(V), c\_BO) (R06.3/plan/potentially-semistable-dieudonne-module), and for a smooth proper K\_v-variety X, H^•\_pH(X/K\_v) := (D\_pst(H^•\_ét(X\_{K̄\_v}, Q\_p)), H^•\_dR(X/K\_v), c\_dR ∘ c\_BO) with Scholze's c\_dR (P8/de-rham-pair-pushforward-compatibilities). For a finite extension L\_w/K\_v in K̄\_v with G\_w ≤ G\_v: restriction D|G\_w := (D\_pst|G\_w, L\_w ⊗\_{K\_v} D\_dR, c\_BO) is a ⊗-functor MF(φ, N, G\_v) → MF(φ, N, G\_w); induction Ind\_{G\_w}^{G\_v} D := (Ind\_{G\_w}^{G\_v} D\_pst, D\_dR viewed over K\_v, c′\_BO), with Ind D\_pst = Map\_{G\_w}(G\_v, D\_pst) carrying the induced φ and N, the Q\_p^nr-structure (λψ)(g) = g(λ)ψ(g), and c′\_BO the composite of Ind(c\_BO) with K̄\_v ⊗ Ind ≅ Ind(K̄\_v ⊗ −) and Ind(K̄\_v ⊗\_{L\_w} D\_dR) ≅ K̄\_v ⊗\_{K\_v} D\_dR (built from the trace-form idempotent of L\_w ⊗\_{K\_v} L\_w), is a lax ⊗-functor right adjoint to restriction. For a smooth proper K\_v-variety X, H^•\_pH(X\_{L\_w}/L\_w) ≅ H^•\_pH(X/K\_v)|G\_w (2.1), and for a smooth proper L\_w-variety X viewed over K\_v, H^•\_pH(X/K\_v) ≅ Ind\_{G\_w}^{G\_v} H^•\_pH(X/L\_w) (2.2).

**Hypotheses and conventions.**

- K\_v/Q\_p finite; all extensions L\_w are taken inside the fixed K̄\_v.
- B\_st is identified with its image in B\_dR independently of a choice of p-adic logarithm, following Shimizu (Betts–Stix footnote 4).
- Induction follows the convention Ind\_{G\_w}^{G\_v} W = Map\_{G\_w}(G\_v, W) with (g·ψ)(h) = ψ(hg).

**Proof sketch.**

1. Define the category and its tensor product componentwise; the comparison c\_BO forces D\_pst to be discrete.
2. The equivalence with descent data: for D\_pst discrete, D\_pst = Q\_p^nr ⊗\_{L\_0} D\_pst^{G\_L} for L large enough, and D\_dR = (L ⊗ D\_pst^{G\_L})^{Gal(L/K\_v)}; this is the colimit description stated in R06.2/plan/filtered-phi-n-modules-with-descent-data.
3. For de Rham V, D\_pst(V) has full dimension by the p-adic monodromy theorem (R06.3/plan/p-adic-monodromy-theorem) and c\_BO is an isomorphism (R06.3/plan/potentially-semistable-dieudonne-module).
4. Restriction: restrict the G\_v-action and extend scalars of D\_dR; c\_BO is unchanged after identifying K̄\_v ⊗\_{K\_v} D\_dR = K̄\_v ⊗\_{L\_w} (L\_w ⊗ D\_dR).
5. Induction: the twisted scalar action makes Ind D\_pst a Q\_p^nr-space; φ and N act pointwise and commute with G\_v; c′\_BO sends 1 ⊗ ψ to Σ\_i (g\_i ⊗ 1)(e·c\_BO(ψ(g\_i⁻¹))) over coset representatives g\_i, with e = Σ\_j x\_j ⊗ y\_j for dual bases of L\_w under the trace form. The adjunction is Frobenius reciprocity, and the lax ⊗-structure is the one induced by the ⊗-structure of restriction.
6. (2.1) follows from H\_ét((X\_{L\_w})\_{K̄\_v}) = H\_ét(X\_{K̄\_v}), L\_w ⊗ H\_dR(X/K\_v) ≅ H\_dR(X\_{L\_w}/L\_w) and base-change compatibility of c\_dR (CohomologyComparisons CP.6/naturality-base-change-and-cup-products); (2.2) follows from Shapiro's identification H\_ét(X\_{K̄\_v}) ≅ Ind H\_ét(X\_{L̄\_w}) and the adjunction.

**API.**

- `PhiNGModule` (structure): A finite-dimensional Q\_p^nr-space with φ, N and a semilinear G\_v-action, Nφ = pφN, all commuting; discrete when stabilisers are open.
- `FilteredPhiNGModule` (structure): The triple (D\_pst, D\_dR, c\_BO): the objects of MF(φ, N, G\_v).
- `FilteredPhiNGModule.equivDescentData` (equivalence): MF(φ, N, G\_v) is equivalent to the colimit over finite Galois L/K\_v of filtered (φ, N, Gal(L/K\_v))-modules (R06.2).
- `FilteredPhiNGModule.restrict` (functoriality): D ↦ D|G\_w, a ⊗-functor MF(φ, N, G\_v) → MF(φ, N, G\_w) with map\_id and map\_comp.
- `FilteredPhiNGModule.induce` (functoriality): D ↦ Ind\_{G\_w}^{G\_v} D, a lax ⊗-functor MF(φ, N, G\_w) → MF(φ, N, G\_v).
- `FilteredPhiNGModule.restrictInduceAdj` (universal-property): Hom(E|G\_w, D) ≅ Hom(E, Ind\_{G\_w}^{G\_v} D), natural in both variables.
- `DpH` (constructor): D\_pH(V) = (D\_pst(V), D\_dR(V), c\_BO) for de Rham V.
- `DpH_restrict` (compatibility): D\_pH(V|G\_w) = D\_pH(V)|G\_w.
- `DpH_induce` (compatibility): D\_pH(Ind\_{G\_w}^{G\_v} V) ≅ Ind\_{G\_w}^{G\_v} D\_pH(V).
- `pHCohomology` (constructor): H^•\_pH(X/K\_v) for a smooth proper K\_v-variety, a graded algebra in MF(φ, N, G\_v), contravariant in X.
- `pHCohomology_baseChange` (compatibility): (2.1): H^•\_pH(X\_{L\_w}/L\_w) ≅ H^•\_pH(X/K\_v)|G\_w.
- `pHCohomology_viewOverBase` (compatibility): (2.2): for a smooth proper L\_w-variety X viewed as a K\_v-scheme by composition with Spec L\_w → Spec K\_v, H^•\_pH(X/K\_v) ≅ Ind\_{G\_w}^{G\_v} H^•\_pH(X/L\_w). This is not the cohomology of the Weil restriction scheme Res\_{L\_w/K\_v} X.

**Unit tests.**

- `FilteredPhiNGModule.unit` (degenerate): The unit 1 = (Q\_p^nr, K\_v, id) with φ the Frobenius of Q\_p^nr, N = 0 and the natural G\_v-action has End(1) = Q\_p and filtration jump 0.
- `DpH.cyclotomic` (computation): D\_pH(Q\_p(1)) is Q\_p^nr·e with φ(e) = p⁻¹e, N = 0 and D\_dR one-dimensional with its single filtration jump at −1.
- `FilteredPhiNGModule.induce_unit_restrict` (computation): For L\_w/K\_v Galois of degree r, (Ind\_{G\_w}^{G\_v} 1)|G\_w ≅ 1^{⊕r}, and Ind\_{G\_w}^{G\_v} 1 = H⁰\_pH(Spec L\_w/K\_v).
- `FilteredPhiNGModule.induce_not_tensor` (non-example): Induction is only lax monoidal: for [L\_w : K\_v] = r ≥ 2, Ind 1 ⊗ Ind 1 has Q\_p^nr-dimension r² while Ind(1 ⊗ 1) has dimension r, so the lax structure map is not an isomorphism.
- `FilteredPhiNGModule.equivDescentData_crystalline` (compatibility): For crystalline V over K\_v, D\_pH(V) corresponds to the filtered φ-module D\_cris(V) with trivial descent data (L = K\_v, N = 0).

**Uses.**

- Betts–Stix, Example 2.12 and Lemma 4.12: decomposes H¹\_pH of a fibre into inductions from the residue fields of Y′\_{y₀}
- Betts–Stix, Proposition 6.9: restriction to G\_{w\_ψ} compares the fibre V\_ψ with a factor M¹\_i(Φ′\_i)
- Betts–Stix, Theorem 3.3: the conclusion is an isomorphism of (φ, N, G\_v)-modules compatible with c\_BO

**Checks.**

- For the unit object 1 = (Q\_p^nr, K\_v, id), Ind\_{G\_w}^{G\_v} 1 = H⁰\_pH(Spec L\_w/K\_v), the algebra of functions on Hom\_{K\_v}(L\_w, K̄\_v).
- D\_pH(V|G\_w) = D\_pH(V)|G\_w and D\_pH(Ind\_{G\_w}^{G\_v} V) ≅ Ind\_{G\_w}^{G\_v} D\_pH(V) for de Rham V.

**Sources.**

- L. Alexander Betts and Jakob Stix, Definitions 2.6–2.7, pp. 8–9. A (φ, N, G\_v)-module is a Q\_p^nr-space with semilinear bijective Frobenius, linear monodromy with Nφ = pφN, and a commuting semilinear G\_v-action; a filtered discrete one adds a filtered K\_v-space and a G\_v-equivariant comparison over K̄\_v; they form a tensor category.
- L. Alexander Betts and Jakob Stix, §2.2.2, Example 2.8 and Theorem 2.9, p. 9. D\_pst(V) is the colimit of the semistable invariants over open subgroups, of full dimension for de Rham V by Berger; with D\_dR and the Berthelot–Ogus-type comparison it gives D\_pH(V), and D\_pH is a fully faithful tensor functor on de Rham representations.
- L. Alexander Betts and Jakob Stix, Example 2.10 and Remark 2.11, pp. 9–10; Remark 3.4, p. 17. p-adic Hodge cohomology of a variety is the triple built from D\_pst of étale cohomology, de Rham cohomology and the composite comparison; Remark 3.4 fixes c\_dR to be Scholze's comparison.
- L. Alexander Betts and Jakob Stix, §2.2.3, Example 2.12 and footnote 5, pp. 10–11. Restriction to G\_w and induction to G\_v of filtered discrete modules, the explicit induced comparison through the trace-form idempotent, the adjunction and lax tensor structure, and the base-change isomorphisms (2.1) and (2.2) of p-adic Hodge cohomology.

**Needs.** `PadicHodgeTheory:R06.2/plan/filtered-phi-n-modules-with-descent-data`; `PadicHodgeTheory:R06.3/plan/potentially-semistable-dieudonne-module`; `PadicHodgeTheory:R06.3/plan/p-adic-monodromy-theorem`; `PadicHodgeTheory:R06.2/plan/admissible-representations`; `PadicHodgeTheory:P8/de-rham-pair-pushforward-compatibilities`; `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`; `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`; `PadicHodgeTheory:R06.3`.

<a id="spm-2-automorphism-group"></a>

### Automorphism groups and retwisted filtrations

**Definition** (`SPM.2/automorphism-group`). Planet: Automorphism groups of (φ, N, G\_v)-modules. Let D be a (φ, N, G\_v)-module (SPM.2/restriction-induction). Its endomorphism algebra End(D) is the Q\_p-algebra of Q\_p^nr-linear maps D → D commuting with φ, N and G\_v, and Aut(D) is the functor on Q\_p-algebras R ↦ the group of R ⊗\_{Q\_p} Q\_p^nr-linear automorphisms of R ⊗\_{Q\_p} D commuting with 1 ⊗ φ, 1 ⊗ N and G\_v, that is R ↦ (R ⊗\_{Q\_p} End(D))^×; it is represented by the unit group scheme of the finite-dimensional algebra End(D). For a symplectic (φ, N, G\_v)-module (D, L, ω) (L of dimension one, ω: ∧²D → L perfect and equivariant), Aut^GSp(D) is the closed subgroup of Aut(D) × G\_m whose R-points are pairs (f,c) satisfying ω(fx,fy) = cω(x,y); the factor c is part of the data even when D = 0. The scalar maps are λ ↦ λ id in Aut(D) and λ ↦ (λ id,λ²) in Aut^GSp(D), and have central image. For a filtered discrete module D = (D\_pst, D\_dR, c\_BO), Aut(D\_pst) acts on Res^{K\_v}\_{Q\_p} GL(D\_dR) by transporting 1 ⊗ ψ through c\_BO and taking G\_v-invariants, hence on Res^{K\_v}\_{Q\_p} G, where G is the flag variety of filtrations of D\_dR with the dimension data of F^•; for Φ ∈ G(K\_v), M(Φ) := (D\_pst, D\_dR with the filtration Φ, c\_BO).

**Hypotheses and conventions.**

- K\_v/Q\_p finite; the similitude factor is recorded so that the degenerate case D = 0 behaves (Betts–Stix footnote 6).

**Proof sketch.**

1. First establish finite-dimensionality of End(D), before constructing the group scheme: the Frobenius descent/trace argument given in the first three proof steps of SPM.2/automorphism-dimension-bound proves that Q\_p^nr ⊗ End(D) → End\_{Q\_p^nr}(D) is injective, using only the φ and G\_v structures. It therefore bounds dim End(D) by (dim D)². Then represent Aut(D) by the unit group of this finite-dimensional algebra (Tau Ceti ReductiveGroups Layers 0 and 3). The later dimension theorem records the estimates for these already constructed groups; algebraicity does not depend on that theorem.
2. Inside Aut(D) × G\_m impose the bilinear equations ω(fx,fy) = cω(x,y). These define a closed subgroup scheme with multiplication (f,c)(g,d) = (fg,cd). The projection to Aut(D) is a closed immersion when D ≠ 0; when D = 0 it is the map G\_m → 1.
3. For ψ ∈ Aut(D\_pst)(R), the R ⊗ K̄\_v-linear map 1 ⊗ ψ on R ⊗ K̄\_v ⊗ D\_pst ≅ R ⊗ K̄\_v ⊗ D\_dR is G\_v-equivariant, so its G\_v-invariants give an R ⊗ K\_v-linear automorphism of R ⊗ D\_dR, not necessarily filtered (Betts–Stix Remark 2.14). This is an action on Res^{K\_v}\_{Q\_p} GL(D\_dR), hence on Res^{K\_v}\_{Q\_p} of the flag variety (AlgebraicModuliForArithmeticGeometry R09.1/flag-bundle, Weil restriction A6).
4. M(Φ) is again a filtered discrete module: only the filtration changed.

**API.**

- `PhiNGModule.End` (data): The Q\_p-algebra End(D) of endomorphisms commuting with φ, N and G\_v.
- `PhiNGModule.Aut` (constructor): The affine Q\_p-group Aut(D), R ↦ (R ⊗\_{Q\_p} End(D))^×.
- `PhiNGModule.AutGSp` (constructor): The closed subgroup of Aut(D) × G\_m of pairs (f,c) with ω(fx,fy) = cω(x,y), with similitude character (f,c) ↦ c.
- `PhiNGModule.scalars` (data): The central scalar maps λ ↦ λ id into Aut(D) and λ ↦ (λ id,λ²) into Aut^GSp(D); forgetting the factor recovers the first map.
- `PhiNGModule.actFlag` (functoriality): The action of Aut(D\_pst) on Res^{K\_v}\_{Q\_p} G through c\_BO, functorial in R.
- `FilteredPhiNGModule.retwist` (constructor): M(Φ) = (D\_pst, (D\_dR, Φ), c\_BO) for Φ ∈ G(K\_v).
- `FilteredPhiNGModule.retwist_self` (simp): M(F^•) = D.
- `PhiNGModule.scalars_act_trivially` (other): Scalar multiplication fixes every filtration, so the flag action factors through the quotient of Aut(D\_pst) by the image of the scalar map. For D\_pst ≠ 0 this image is G\_m; for D\_pst = 0 the flag variety and its action are trivial.
- `PhiNGModule.AutGSp.ext` (extensionality): Two R-points are equal exactly when both their automorphism and similitude components agree. The forgetful map to Aut(D)(R) is injective for D ≠ 0; for D = 0 its kernel is all of G\_m(R).

**Unit tests.**

- `PhiNGModule.End_unit` (computation): For the unit object, End(1) = Q\_p: a Q\_p^nr-linear map Q\_p^nr → Q\_p^nr is multiplication by λ, and commuting with φ forces λ ∈ Q\_p.
- `PhiNGModule.End_without_frobenius` (non-example): For K\_v = Q\_{p²} and D = Q\_p^nr with its natural G\_v-action, the G\_v-equivariant Q\_p^nr-linear endomorphisms are multiplication by Q\_{p²}; only the condition with φ cuts them down to Q\_p. A definition omitting φ gives the wrong group (Betts–Stix proof of Proposition 2.16, see the extraction's E2).
- `PhiNGModule.Aut_zero` (degenerate): For D = 0, Aut(D) is the trivial group, while Aut^GSp(D) is G\_m because the similitude factor is part of the data.
- `PhiNGModule.Aut_ordinary` (computation): For D\_pst(H¹\_ét) of an elliptic curve over Q\_p with good ordinary reduction, D = Q\_p^nr ⊗\_{Q\_p} D\_cris with D\_cris = Q\_p e₁ ⊕ Q\_p e₂, φ = Frob ⊗ diag(α, β) for the roots α, β ∈ Q\_p of X² − a\_pX + p (v\_p(α) = 0, v\_p(β) = 1), N = 0 and G\_{Q\_p} acting on the first factor: End(D) = Q\_p × Q\_p and Aut(D) = Aut^GSp(D) = G\_m², of dimension 2 ≤ d(2d + 1) + 1 = 4 for d = 1.
- `FilteredPhiNGModule.retwist_line` (computation): For D\_dR two-dimensional with jumps {0, 1}, G = P¹ and M(Φ) for Φ a line is the filtered module with F¹ = Φ.

**Uses.**

- Betts–Stix, Lemma 2.15: isomorphism classes of retwisted modules are Aut(D\_pst)(Q\_p)-orbits of filtrations
- Betts–Stix, Lemma 6.13: Aut^GSp of H¹\_pst of a fibre acts on the Lagrangian Grassmannian with orbits of bounded dimension
- Betts–Stix, Definition 4.10: M¹(Φ) is the retwist of H¹\_pH of the base fibre by a Lagrangian Φ

**Checks.**

- For the unit object, End = Q\_p and Aut = G\_m.
- M(F^•) = D for the original filtration F^•.

**Sources.**

- L. Alexander Betts and Jakob Stix, Definition 2.13 and footnote 6, p. 11. Automorphisms of a (φ, N, G\_v)-module, their R-points as a functor on Q\_p-algebras, the similitude group with the multiplier retained as data, and the central scalar maps.
- L. Alexander Betts and Jakob Stix, Remark 2.14 and the construction after it, p. 11. Automorphisms of D\_pst act on de Rham realizations through c\_BO and Galois invariants, hence on the Weil restriction of the flag variety of filtrations; M(Φ) replaces the filtration by Φ.

**Needs.** [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction); `AlgebraicModuliForArithmeticGeometry:R09.1/flag-bundle`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `TauCeti.Symplectic.groupScheme`.

<a id="spm-2-orbit-lemma"></a>

### The orbit lemma for retwisted filtrations

**Theorem** (`SPM.2/orbit-lemma`). Planet: Orbit lemma. Let D = (D\_pst, D\_dR, c\_BO) be a filtered discrete (φ, N, G\_v)-module and G the flag variety of filtrations of D\_dR with the dimension data of its filtration. For Φ₁, Φ₂ ∈ G(K\_v), M(Φ₁) ≅ M(Φ₂) as filtered discrete (φ, N, G\_v)-modules if and only if Φ₁ and Φ₂ lie in one Aut(D\_pst)(Q\_p)-orbit for the action of SPM.2/automorphism-group. Consequently the set of Φ with M(Φ) in a fixed isomorphism class lies in a closed Q\_p-subvariety of Res^{K\_v}\_{Q\_p} G of dimension at most dim\_{Q\_p} Aut(D\_pst), and the same holds for finitely many classes. The symplectic version, with Aut^GSp(D\_pst) acting on the Lagrangian Grassmannian of a symplectic D\_dR, holds with the same proof.

**Hypotheses and conventions.**

- The orbit statement is over Q\_p-points; the dimension bound is for the Zariski closure of an orbit of an algebraic group acting algebraically.

**Proof sketch.**

1. An isomorphism M(Φ₁) → M(Φ₂) is determined by its D\_pst-component, a (φ, N, G\_v)-automorphism ψ of D\_pst, because the D\_dR-component is forced by c\_BO.
2. That this ψ respects the filtrations says exactly that ψ carries Φ₁ to Φ₂ under the action of Remark 2.14.
3. An orbit of an algebraic group H acting algebraically on a variety has Zariski closure of dimension ≤ dim H; finitely many orbits likewise.
4. LV.4/filtered-phi-orbit is the special case of filtered φ-modules over an unramified base; the argument is the same.

**Checks.**

- For K\_v = Q\_p and D\_dR of dimension two with jumps {0, 1} and Aut(D\_pst) = G\_m² acting on P¹ through the eigenbasis, the orbits are the two eigenlines and their complement: three isomorphism classes of retwists.

**Sources.**

- L. Alexander Betts and Jakob Stix, Lemma 2.15 and proof, p. 12. Two retwisted modules are isomorphic exactly when the filtrations are in one orbit of the Q\_p-points of Aut(D\_pst), so a fixed isomorphism class sweeps out a subvariety of dimension at most dim Aut(D\_pst).

**Needs.** [Automorphism groups and retwisted filtrations](#spm-2-automorphism-group); [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction); `MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

<a id="spm-2-automorphism-dimension-bound"></a>

### Dimension bounds for automorphism groups

**Theorem** (`SPM.2/automorphism-dimension-bound`). (1) For a (φ, N, G\_v)-module D of Q\_p^nr-dimension d, End(D) is a finite-dimensional Q\_p-algebra, the natural map Q\_p^nr ⊗\_{Q\_p} End(D) → End\_{Q\_p^nr}(D) is injective, Aut(D) is an affine algebraic group over Q\_p, and dim\_{Q\_p} Aut(D) ≤ d². (2) For a symplectic (φ, N, G\_v)-module (D, L, ω) of rank 2d, Aut^GSp(D) is an affine algebraic group over Q\_p of dimension ≤ d(2d + 1) + 1, the dimension of GSp\_{2d}.

**Hypotheses and conventions.**

- The injectivity uses both the G\_v-action and the Frobenius φ: the G\_v-action alone gives only traces to K\_{v,0} (the extraction's E2).

**Proof sketch.**

1. Let ψ₁, …, ψ\_k ∈ End(D) be Q\_p-linearly independent and λ\_i ∈ Q\_p^nr with Σλ\_iψ\_i = 0 in End\_{Q\_p^nr}(D).
2. G\_v-equivariance of the ψ\_i gives Σσ(αλ\_i)ψ\_i = 0 for α ∈ Q\_p^nr and σ ∈ G\_v; G\_v acts on Q\_p^nr through Gal(Q\_p^nr/K\_{v,0}) only.
3. Since the ψ\_i commute with φ, which is semilinear for the Frobenius of Q\_p^nr, conjugating by φ gives ΣFrob(λ\_i)ψ\_i = 0. Frobenius and the image of G\_v generate a dense subgroup of Gal(Q\_p^nr/Q\_p); averaging over a finite quotient through which the λ\_i and α are fixed gives Σtr(αλ\_i)ψ\_i = 0 for the normalised trace to Q\_p, so λ\_i = 0 by non-degeneracy of the trace form (repair of the printed argument, extraction E2).
4. So End(D) has Q\_p-dimension ≤ d², Aut(D) is its unit group scheme, and the injection induces a closed immersion Aut(D)\_{Q\_p^nr} → GL\_{Q\_p^nr}(D), whence dim Aut(D) ≤ d².
5. (2): after base extension to Q\_p^nr, Aut^GSp(D) embeds in the group of pairs (f,c) in GL(D) × G\_m satisfying ω(fx,fy) = cω(x,y). For d > 0 this is GSp\_{2d}, of dimension d(2d + 1) + 1. For d = 0 it is G\_m, of dimension 1, so the same formula holds with the retained-factor convention.

**Checks.**

- For d = 1 (a rank-one module), dim Aut(D) ≤ 1; equality for D = 1.
- For d = 1 in the symplectic case the bound is 4 = dim GL₂ = dim GSp₂.

**Sources.**

- L. Alexander Betts and Jakob Stix, Proposition 2.16 and proof, p. 12. Automorphism groups of (φ, N, G\_v)-modules are algebraic of dimension at most d², and the symplectic ones at most d(2d + 1) + 1, via an injection of Q\_p^nr ⊗ End(D) into the linear endomorphisms.
- L. Alexander Betts and Jakob Stix, §2.2.4, p. 11. The bounds are what the generalised Lawrence–Venkatesh argument needs on automorphism groups of symplectic (φ, N, G\_v)-modules.

**Needs.** [Automorphism groups and retwisted filtrations](#spm-2-automorphism-group); [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction); `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-finrank`; `Matrix.symplecticGroup`.

### Dependencies of SPM.2

Stages used: `AbelianSchemesAndArithmeticModuli:A6`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `CohomologyComparisons:CP.6`, `MordellLawrenceVenkatesh:LV.0`, `MordellLawrenceVenkatesh:LV.4`, `PadicHodgeTheory:P8`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.3`, `PadicHodgeTheory:R06.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

## Layer SPM.3: Self-conjugate places and average Hodge–Tate weights

**Targets.** Conjugate and self-conjugate places, their description through the maximal CM subfield and their relation to friendly places (Betts–Stix Definition 2.17, Remark 2.18). Proposition 2.19 for Q\_p^×-valued characters: Hodge–Tate weights at conjugate places of a pure de Rham character add up to its weight (false for Q̄\_p^×-values when K has a CM subfield). Remark 2.20: at a self-conjugate place such a character is finite-order times a cyclotomic power. Corollary 2.21: the average Hodge–Tate weight of a pure representation of G\_L at a self-conjugate place of K is half its weight. The infinity-type and largest-CM-subfield inputs are imported from MordellLawrenceVenkatesh LV.1.

<a id="spm-3-self-conjugate-place"></a>

### Conjugate and self-conjugate places

**Definition** (`SPM.3/self-conjugate-place`). Planet: Self-conjugate places. Let K be a number field. Two finite places v, v′ of K are conjugate if, for every CM subfield E ⊆ K, the restrictions v|\_E and v′|\_E are exchanged by the complex conjugation c\_E of E, that is v′|\_E = c\_E(v|\_E); v is self-conjugate if it is conjugate to itself. (1) If K has no CM subfield (for instance K totally real or of odd degree), every finite place is self-conjugate. (2) If K has a CM subfield, it has a largest one E\_K (LV.1/largest-cm-subfield); then v, v′ are conjugate exactly when v′|\_{E\_K} = c\_{E\_K}(v|\_{E\_K}), and v is self-conjugate exactly when c\_{E\_K} fixes v|\_{E\_K}, i.e. the place of the maximal totally real subfield below v is inert or ramified in E\_K. (3) The friendly places of Lawrence–Venkatesh (LV.1/friendly-place) are exactly the self-conjugate places unramified over Q.

**Hypotheses and conventions.**

- K a number field; places are finite places (height-one primes of O\_K).
- Conjugacy is tested on every CM subfield, not only on E\_K; by (2) the two tests agree.

**Proof sketch.**

1. (1) is vacuous: there is no E to test.
2. (2): a compositum of CM subfields of K is CM, so every CM subfield E lies in E\_K and c\_E is the restriction of c\_{E\_K}; restricting places from E\_K to E commutes with conjugation, so the condition at E\_K implies it at every E.
3. For the reformulation, c\_{E\_K} fixes a place of E\_K exactly when that place is the only one above its restriction to E\_K⁺, i.e. the restriction is inert or ramified.
4. (3): compare with LV.1/friendly-place; unramified over Q excludes the ramified case of (2).

**API.**

- `AreConjugate` (relation): v and v′ are conjugate: v′|\_E = c\_E(v|\_E) for every CM subfield E of K.
- `IsSelfConjugate` (data): v is conjugate to itself.
- `isSelfConjugate_of_forall_not_isCMField` (other): If K has no CM subfield, every finite place is self-conjugate.
- `isSelfConjugate_iff_maxCM` (characterisation): With a CM subfield, v is self-conjugate iff c\_{E\_K} fixes v|\_{E\_K}.
- `conjugate_symm` (relation): Conjugacy of places is symmetric.
- `isSelfConjugate_restrict` (functoriality): If v is self-conjugate on K and F ⊆ K, then v|\_F is self-conjugate on F (CM subfields of F are CM subfields of K).
- `friendly_iff` (compatibility): v is friendly in the sense of LV.1/friendly-place iff v is self-conjugate and unramified over Q.
- `infinite_selfConjugate` (other): Every number field has infinitely many self-conjugate places: all places if it has no CM subfield, and otherwise those above primes of E\_K⁺ inert in E\_K (Chebotarev).

**Unit tests.**

- `selfConjugate_rat` (degenerate): Every prime of Q is self-conjugate, since Q has no CM subfield.
- `selfConjugate_gaussian_inert` (computation): In Q(i), the place (3) is self-conjugate: complex conjugation fixes the prime 3Z[i].
- `not_selfConjugate_gaussian_split` (non-example): In Q(i), the places (2 + i) and (2 − i) above 5 are exchanged by complex conjugation: they are conjugate to each other and neither is self-conjugate.
- `selfConjugate_not_friendly` (non-example): In Q(i), the place (1 + i) is self-conjugate (it is the only place above 2) but ramified over Q, so it is not friendly: self-conjugacy is strictly weaker than friendliness.
- `selfConjugate_cubic` (computation): For K = Q(2^{1/3}), which has odd degree and so no CM subfield, every finite place is self-conjugate.

**Uses.**

- Betts–Stix, Proposition 2.19: at conjugate places Hodge–Tate weights of a pure character add up to its weight
- Betts–Stix, Proposition 6.7: the principal trichotomy holds at self-conjugate places
- Betts–Stix, Theorem A: with no CM subfield every finite place is self-conjugate

**Checks.**

- Over Q every place is self-conjugate; over Q(i) the place (3) is self-conjugate and friendly, (1 + i) is self-conjugate but not friendly, and the two places above 5 are conjugate to each other and not self-conjugate.

**Sources.**

- L. Alexander Betts and Jakob Stix, Definition 2.17 and Remark 2.18, p. 13. Places are conjugate when their restrictions to every CM subfield are exchanged by complex conjugation, self-conjugate when conjugate to themselves; without a CM subfield every place is self-conjugate, with one the condition is at the maximal CM subfield, and friendly places are the self-conjugate places unramified over Q.
- L. Alexander Betts and Jakob Stix, §1.1, p. 3. Self-conjugacy is slightly weaker than friendliness; with no CM subfield every finite place is self-conjugate, which is why Theorem A needs that hypothesis.

**Needs.** `MordellLawrenceVenkatesh:LV.1/largest-cm-subfield`; `MordellLawrenceVenkatesh:LV.1/friendly-place`; `NumberField.IsCMField`; `NumberField.IsCMField.ringOfIntegersComplexConj`.

<a id="spm-3-conjugate-places-weights"></a>

### Hodge–Tate weights of pure characters at conjugate places

**Theorem** (`SPM.3/conjugate-places-weights`). Planet: Hodge–Tate weights of pure characters. Let K be a number field, p a prime and χ: G\_K → Q\_p^× a continuous character that is unramified and pure of weight n ∈ Z outside a finite set of places (R34.1/pure-and-integral-galois-representations) and de Rham at every place above p. For a place v | p let r\_v be the Hodge–Tate weight of χ|G\_v, the integer r with (C\_p(r) ⊗ χ|G\_v)^{G\_v} ≠ 0, equivalently the filtration jump of D\_dR(χ|G\_v). If v and v′ above p are conjugate (SPM.3/self-conjugate-place), then r\_v + r\_{v′} = n. In particular, at a self-conjugate place v above p, n is even and r\_v = n/2.

**Hypotheses and conventions.**

- χ takes values in Q\_p^×. With Q̄\_p^×-values the statement is false when K has a CM subfield: for K = Q(i), p ≡ 3 mod 4 and v = (p), the character of G\_K on V\_p of the CM curve y² = x³ − x composed with an embedding Q\_{p²} → Q̄\_p is pure of odd weight 1 and de Rham at v (extraction item /24, red-team finding RT-PAPER-BETTS-STIX-25/2).
- Hodge–Tate weights are normalised so that Q\_p(1) has weight −1.

**Proof sketch.**

1. Fix ι\_p: Q̄ → Q̄\_p and put m(τ) := r\_{v(τ)} for embeddings τ: K → Q̄, where v(τ) is the place above p induced by ι\_p ∘ τ.
2. Global purity gives m(c ∘ τ) + m(τ) = n for every complex conjugation c (LV.1/pure-character-conjugation-relation; Betts–Stix argue instead with class field theory and the Serre torus, using that the algebraic part of the associated Hecke character takes Q\_p^×-values).
3. By LV.1/infinity-type-factorization, m(τ) depends only on τ|\_{E\_K}, and is the constant n/2 if K has no CM subfield.
4. For conjugate v, v′, pick τ with v(τ) = v; adjusting by the decomposition group of ι\_p, pick τ′ with v(τ′) = v′ and τ′|\_{E\_K} = (c ∘ τ)|\_{E\_K}. Then r\_{v′} = m(τ′) = m(c ∘ τ) = n − r\_v.
5. For v self-conjugate take v′ = v.

**Checks.**

- χ = χ\_cyc⁻¹ (the representation Q\_p(−1)) is pure of weight 2 and has Hodge–Tate weight 1 = 2/2 at every place above p.
- A finite-order character has n = 0 and r\_v = 0 everywhere.

**Sources.**

- L. Alexander Betts and Jakob Stix, Proposition 2.19 and proof, pp. 13–14. For a Q\_p^×-valued character unramified and pure of weight n outside a finite set and de Rham above p, Hodge–Tate weights at conjugate places add up to n, so they equal n/2 at self-conjugate places; the proof uses global class field theory and Serre's description of the Serre torus.
- L. Alexander Betts and Jakob Stix, §2.3, footnotes 7–8, p. 13. Conventions: Hodge–Tate weight r means (C\_p(r) ⊗ V)^{G\_v} ≠ 0, and local Artin maps send uniformisers to arithmetic Frobenius.

**Needs.** [Conjugate and self-conjugate places](#spm-3-self-conjugate-place); `MordellLawrenceVenkatesh:LV.1/pure-character-conjugation-relation`; `MordellLawrenceVenkatesh:LV.1/infinity-type-factorization`; `MordellLawrenceVenkatesh:LV.1/de-rham-character-locally-algebraic`; `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`.

<a id="spm-3-self-conjugate-character-restriction"></a>

### Pure characters at self-conjugate places

**Theorem** (`SPM.3/self-conjugate-character-restriction`). Let χ: G\_K → Q\_p^× be as in SPM.3/conjugate-places-weights and v a self-conjugate place above p. Then χ|G\_v = χ₀ · χ\_cyc^{−n/2} with χ₀ a character of G\_v of finite order. If K has no CM subfield, χ · χ\_cyc^{n/2} is itself of finite order on G\_K.

**Hypotheses and conventions.**

- χ is Q\_p^×-valued; for the Q̄\_p^×-valued CM character of SPM.3/conjugate-places-weights, χ|G\_v is a Lubin–Tate character and n is odd.

**Proof sketch.**

1. Replacing χ by χ · χ\_cyc^{n/2} (n is even by SPM.3/conjugate-places-weights), reduce to n = 0.
2. No CM subfield: r\_u = 0 at every u | p, so the associated idele class character is finitely ramified at every place (LV.1/de-rham-character-locally-algebraic); it factors through a ray class group, which is finite, so χ has finite order (GlobalNumberFields Layers 2 and 7, with ClassFieldTheory Layer 11 for the Galois–idele character dictionary).
3. CM case: put E = E\_K. The infinity-type factorisation of LV.1 gives an algebraic character on E whose composite with N\_{K/E} is the algebraic local type of the weight-zero idele character η of K. Realise a positive power of that type by a Q\_p-valued idele class character θ of E: choose a modulus on whose global units the algebraic character is trivial, define the character on principal ideals, and raise to an exponent killing the finite ray class group to extend it to all ideals without extracting roots in Q\_p. Consequently η^m/(θ ∘ N\_{K/E}) has trivial algebraic type at p and finite ramification everywhere, hence finite order by global class field theory. This finite-power norm descent is part of this target’s proof, not an assertion that restriction of η to A\_E isolates one local component.
4. Conjugate infinity types of θ add to zero, so θθ̄ is finitely ramified everywhere and has finite order. At the self-conjugate prime v₀ = v|\_E its local type is zero, so θ\_{v₀} has finite image on units. For a uniformiser π, conjugation sends π to πu for a unit u. Thus θ\_{v₀}(π)² differs from (θθ̄)\_{v₀}(π) by a finite-order unit value, so θ\_{v₀} has finite order on E\_{v₀}^×. The norm descent then makes η\_v^m finite order, hence η\_v and χ|G\_v finite order.

**Checks.**

- For χ = χ\_cyc⁻¹, χ|G\_v = χ\_cyc^{−1} with χ₀ = 1 and n = 2.

**Sources.**

- L. Alexander Betts and Jakob Stix, Remark 2.20, p. 14. At a self-conjugate place a pure de Rham Q\_p^×-valued character is a finite-order character times a power of the cyclotomic character; the argument reduces to weight zero and uses finiteness of ray class groups, with an extra step through the maximal CM subfield.

**Needs.** [Hodge–Tate weights of pure characters at conjugate places](#spm-3-conjugate-places-weights); `MordellLawrenceVenkatesh:LV.1/infinity-type-factorization`; `MordellLawrenceVenkatesh:LV.1/de-rham-character-locally-algebraic`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`.

<a id="spm-3-average-hodge-tate-weight"></a>

### Average Hodge–Tate weight at a self-conjugate place

**Theorem** (`SPM.3/average-hodge-tate-weight`). Planet: Average Hodge–Tate weight. Let L/K be a finite extension of number fields, V a continuous Q\_p-representation of G\_L that is de Rham at every place of L above p and unramified and pure of weight n outside a finite set, and v a self-conjugate place of K above p. Then Σ\_{w | v} [L\_w : K\_v] Σ\_{i∈Z} i·dim\_{L\_w} gr^i\_F D\_dR,w(V) = n·[L : K]·dim\_{Q\_p}(V)/2, where D\_dR,w(V) := D\_dR(V|G\_w). Equivalently, the average Hodge–Tate weight of Ind\_{G\_L}^{G\_K}V at v (the filtration weight of LV.1/filtration-weight) is n/2.

**Hypotheses and conventions.**

- v is self-conjugate on K; no condition is put on the places of L.
- V is a representation over Q\_p, so det Ind V is Q\_p^×-valued and SPM.3/conjugate-places-weights applies.

**Proof sketch.**

1. Put W = Ind\_{G\_L}^{G\_K} V; it is unramified outside a finite set and pure of weight n, since weights can be read on an open subgroup over which W is a sum of conjugates of V.
2. W|G\_v ≅ ⊕\_{w|v} Ind\_{G\_w}^{G\_v} V|G\_w (R01.1/mackey-decomposition) and D\_dR,v(Ind\_{G\_w}^{G\_v} V) ≅ D\_dR,w(V) as filtered K\_v-spaces (LV.1/de-rham-of-induced), so W is de Rham above p and gr^i D\_dR,v(W) has K\_v-dimension Σ\_{w|v}[L\_w : K\_v] dim\_{L\_w} gr^i D\_dR,w(V).
3. The character det W is Q\_p^×-valued, pure of weight n·[L : K]·dim V, de Rham above p, with Hodge–Tate weight at v equal to Σ\_i i·dim\_{K\_v} gr^i D\_dR,v(W).
4. Apply SPM.3/conjugate-places-weights at the self-conjugate place v.

**Checks.**

- For an abelian variety A over L = K of dimension g and V = H¹\_ét(A\_{K̄}, Q\_p), both sides equal g at every self-conjugate v | p.
- Applied to a subrepresentation W₀ with Hodge–Tate weights in {0, 1} of a transitively induced symplectic module, it gives Σ\_w [L\_w : K\_v] dim F¹D\_dR,w(W₀) = ½ dim W₀ · #Σ, as used in the principal trichotomy.

**Sources.**

- L. Alexander Betts and Jakob Stix, Corollary 2.21 and proof, pp. 14–15. The sum over places w above a self-conjugate v of local degrees times Hodge–Tate weights of D\_dR,w(V) is half the weight times [L : K] dim V, proved by applying Proposition 2.19 to the determinant of the induced representation.

**Needs.** [Hodge–Tate weights of pure characters at conjugate places](#spm-3-conjugate-places-weights); `ArithmeticGaloisRepresentations:R01.1/mackey-decomposition`; `MordellLawrenceVenkatesh:LV.1/de-rham-of-induced`; `MordellLawrenceVenkatesh:LV.1/filtration-weight`; `MordellLawrenceVenkatesh:LV.1/hodge-weight-sum-over-places`.

### Dependencies of SPM.3

Stages used: `ArithmeticGaloisRepresentations:R01.1`, `MordellLawrenceVenkatesh:LV.1`, `WeightsInEtaleCohomology:R34.1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`.

## Layer SPM.4: Model-free period maps control D\_pst

**Targets.** Theorem 3.22 of Betts–Stix: on a closed polydisc or spherical polyannulus over any finite K\_v/Q\_p, a de Rham pair whose bundle has a full horizontal basis has canonically identified D\_pst of all fibres, compatibly with parallel transport; first for spherical polyannuli through Shimizu's potentially horizontal semistable representations and the invariants of B\_dR(R\_v), then for polydiscs (Lemma 3.23). Theorem 3.3: for a smooth proper family the D\_pst of H^i\_ét of fibres are constant on a polydisc where H^i\_dR has a full horizontal basis. Proposition 3.5: the v-adic period map determines the filtered (φ, N, G\_v)-module H^i\_pH(X\_y) as M^i(Φ\_{y₀}(y)), hence the local representation. No model or reduction hypothesis; the relative comparison is imported from PadicHodgeTheory P8, the model-free period map is requested from MordellLawrenceVenkatesh LV.3.

<a id="spm-4-horizontal-transport-polyannulus"></a>

### Transport of D\_pst on a spherical polyannulus

**Theorem** (`SPM.4/horizontal-transport-polyannulus`). Let K\_v be a finite extension of Q\_p, R\_v = O\_v⟨t₁^{±1}, …, t\_n^{±1}⟩ and U = Sp(R\_v[1/p]) the spherical polyannulus over K\_v. Let (𝔼, E, c) be a de Rham pair on U (P8/associated-de-rham-pairs) whose filtered flat bundle E has a full basis of horizontal sections. Then for all y₀, y ∈ U(K\_v) there is a unique isomorphism of (φ, N, G\_v)-modules T\_{y₀,y}: D\_pst(𝔼\_{ȳ₀}) → D\_pst(𝔼\_ȳ) such that, after extending scalars to K̄\_v, it corresponds through c\_BO and the fibre comparisons c\_{y₀}: D\_dR(𝔼\_{ȳ₀}) ≅ E\_{y₀} and c\_y to 1 ⊗ T^∇\_{y₀,y}: K̄\_v ⊗ E\_{y₀} → K̄\_v ⊗ E\_y.

**Hypotheses and conventions.**

- U is a spherical polyannulus (inner and outer radii equal), so R\_v satisfies Shimizu's Set-up 3.1 and Condition (BR).
- E has a full basis of horizontal sections over U: (E, ∇) ≅ (O\_U, d)^m.

**Proof sketch.**

1. Write E = H⁰(Ũ, 𝔼) for the G\_{R\_v}-representation of the local system (the polyannulus Galois-category equivalence, requested from P8), and choose lifts ỹ₀, ỹ of y₀, y, giving E\_{ỹ₀} ≅ 𝔼\_{ȳ₀} and E\_ỹ ≅ 𝔼\_ȳ.
2. A full horizontal basis makes E horizontal de Rham, and by Shimizu's relative monodromy theorem E becomes horizontal semistable over a finite extension: E is potentially horizontal semistable (P8/horizontal-and-local-system-monodromy; the extraction's E8 corrects the paper's citation to Shimizu Lemma 8.9 with Theorem 7.4).
3. By Shimizu's Lemma 4.4 (requested from P8) the specialisations ρ\_ỹ: D^∇\_pst(E) → D\_pst(E\_ỹ) are isomorphisms; put T\_{y₀,y} := ρ\_ỹ ∘ ρ\_{ỹ₀}⁻¹.
4. Over B\_dR(R\_v) := H⁰(Ũ, OB\_dR,U) there are G\_{R\_v}-equivariant isomorphisms with connection B\_dR(R\_v) ⊗ D^∇\_pst(E) ≅ B\_dR(R\_v) ⊗ E ≅ B\_dR(R\_v) ⊗ E\_U, the second the sections of c. Specialising along ỹ₀\* gives the commuting diagram (∗∗) of the paper.
5. The rectangle (†) comparing these with 1 ⊗ ρ\_{ỹ₀} and T^∇\_{y₀} commutes up to an element of GL\_n(K\_v), because all its maps are G\_{R\_v}-equivariant horizontal isomorphisms and (B\_dR(R\_v))^{G\_{R\_v}, ∇=0} = K\_v (the invariant base of P8/horizontal-relative-periods; Shimizu Proposition 4.9); it commutes after specialising at ỹ₀, by (∗∗), so it commutes. Specialising (†) along ỹ gives the claim.
6. Uniqueness: c\_BO and the c\_y are isomorphisms, so the K̄\_v-extension of T\_{y₀,y} is determined, hence T\_{y₀,y} is.

**Checks.**

- For a constant de Rham pair (𝔼 constant, E = O\_U ⊗ D\_dR) T\_{y₀,y} is the identity of D\_pst(𝔼\_{ȳ₀}).
- T\_{y,y} = id and T\_{y₁,y₂} ∘ T\_{y₀,y₁} = T\_{y₀,y₂}, by uniqueness.

**Sources.**

- L. Alexander Betts and Jakob Stix, Theorem 3.22, footnote 17, pp. 28–29. For a de Rham pair on a closed polydisc or spherical polyannulus whose bundle has a full basis of horizontal sections, there is a unique isomorphism of the D\_pst of two fibres compatible with parallel transport through the comparison isomorphisms.
- L. Alexander Betts and Jakob Stix, §3.5, Definition 3.24, Lemma 3.25, Corollary 3.26, Lemma 3.27, Remarks 3.28–3.29 and the proof of Theorem 3.22 for polyannuli, pp. 29–32. Shimizu's horizontal semistable period ring, potentially horizontal semistable representations and specialisation isomorphisms; local systems on a polyannulus as representations of its algebraic fundamental group; the comparison through B\_dR(R\_v), whose horizontal Galois invariants are K\_v.

**Needs.** `PadicHodgeTheory:P8/associated-de-rham-pairs`; `PadicHodgeTheory:P8/horizontal-relative-periods`; `PadicHodgeTheory:P8/horizontal-and-local-system-monodromy`; `PadicHodgeTheory:R06.3/plan/potentially-semistable-dieudonne-module`; [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction); `PadicHodgeTheory:P8`.

<a id="spm-4-polydisc-reduction"></a>

### Reduction from closed polydiscs to spherical polyannuli

**Lemma** (`SPM.4/polydisc-reduction`). If the conclusion of SPM.4/horizontal-transport-polyannulus holds for spherical polyannuli over every finite extension of Q\_p, then it holds for every closed polydisc U over K\_v, every de Rham pair on U whose bundle has a full basis of horizontal sections and every y₀, y ∈ U(K\_v).

**Hypotheses and conventions.**

- The residue field of K\_v is arbitrary; the case k\_v = F₂ needs the unramified extensions of degrees 2 and 3.

**Proof sketch.**

1. If k\_v ≠ F₂: in coordinates y₀ = (a\_i) and y = (b\_i) with a\_i, b\_i ∈ O\_v; choose c\_i ∈ O\_v outside the residue classes of a\_i and b\_i (possible since #k\_v ≥ 3); t\_i ↦ t\_i − c\_i embeds a spherical polyannulus U° ⊂ U containing y₀ and y; E|U° still has a full horizontal basis.
2. If k\_v = F₂: for r = 2, 3 the unramified extension L\_{w,r} has residue field with ≥ 4 elements, so the first case over L\_{w,r} gives isomorphisms T\_r of (φ, N, G\_{w,r})-modules; by uniqueness T₂ = T₃ =: T. It commutes with G\_{w,2} and G\_{w,3}, which together generate G\_v (their images in the unramified quotient Ẑ are 2Ẑ and 3Ẑ, and both contain inertia), so T is G\_v-equivariant.

**Checks.**

- Over Q₂ (residue field F₂) the argument passes through Q₄ and Q₈ = Q\_{2³}, unramified of degrees 2 and 3.

**Sources.**

- L. Alexander Betts and Jakob Stix, Lemma 3.23 and proof, p. 29. Theorem 3.22 for polydiscs reduces to polyannuli: embed a polyannulus through both points when the residue field is not F₂, and otherwise use unramified extensions of degrees 2 and 3, whose Galois groups generate G\_v; uniqueness makes the isomorphisms agree.
- L. Alexander Betts and Jakob Stix, §3.5, p. 29. The paragraph introducing the reduction says it begins the proof of Theorem 3.3; it begins the proof of Theorem 3.22 (this packet's E4).

**Needs.** [Transport of D\_pst on a spherical polyannulus](#spm-4-horizontal-transport-polyannulus); `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

<a id="spm-4-horizontal-de-rham-transport"></a>

### Horizontal de Rham transport of D\_pst

**Theorem** (`SPM.4/horizontal-de-rham-transport`). Planet: Horizontal de Rham transport. Let U be a rigid-analytic space over a finite extension K\_v of Q\_p isomorphic to a closed polydisc or a spherical polyannulus, and (𝔼, E, c) a de Rham pair on U whose filtered flat bundle E has a full basis of horizontal sections. Then for all y₀, y ∈ U(K\_v) there is a unique isomorphism of (φ, N, G\_v)-modules T\_{y₀,y}: D\_pst(𝔼\_{ȳ₀}) ≅ D\_pst(𝔼\_ȳ) whose K̄\_v-extension corresponds, through c\_BO and the fibre comparisons c\_{y₀}, c\_y, to 1 ⊗ T^∇\_{y₀,y}. By uniqueness (a consequence not stated in the source), these isomorphisms satisfy T\_{y,y} = id and T\_{y₁,y₂} ∘ T\_{y₀,y₁} = T\_{y₀,y₂}, and are compatible with tensor products and morphisms of de Rham pairs.

**Hypotheses and conventions.**

- U a closed polydisc or a spherical polyannulus over K\_v; E with a full basis of horizontal sections on U.

**Proof sketch.**

1. For polyannuli this is SPM.4/horizontal-transport-polyannulus; for polydiscs apply SPM.4/polydisc-reduction.
2. The cocycle identity and the compatibilities follow from uniqueness, since parallel transport satisfies them.

**Checks.**

- For the pushforward of the unit pair along a smooth proper family this is SPM.4/period-maps-control-dpst.

**Sources.**

- L. Alexander Betts and Jakob Stix, Theorem 3.22, pp. 28–29, proved in §3.5, pp. 29–32. The model-free comparison: on a polydisc or spherical polyannulus where the de Rham bundle has a full horizontal basis, the discrete (φ, N, G\_v)-modules of all fibres are canonically identified compatibly with parallel transport.
- L. Alexander Betts and Jakob Stix, §3.5, p. 28. The same result appears in Betts, Local constancy of pro-unipotent Kummer maps, Theorem 6.1, which the paper re-derives from Shimizu.

**Needs.** [Transport of D\_pst on a spherical polyannulus](#spm-4-horizontal-transport-polyannulus); [Reduction from closed polydiscs to spherical polyannuli](#spm-4-polydisc-reduction).

<a id="spm-4-period-maps-control-dpst"></a>

### Period maps control D\_pst in smooth proper families

**Theorem** (`SPM.4/period-maps-control-dpst`). Planet: Period maps control D\_pst. Let π: X → Y be a smooth proper morphism of smooth varieties over a finite extension K\_v of Q\_p, i ≥ 0, and U ⊆ Y^an an admissible open isomorphic to a closed polydisc over which H^i\_dR(X/Y)^an has a full basis of horizontal sections for the Gauss–Manin connection. Then for all y₀, y ∈ U(K\_v) there is a unique isomorphism of (φ, N, G\_v)-modules T\_{y₀,y}: D\_pst(H^i\_ét(X\_{y₀,K̄\_v}, Q\_p)) ≅ D\_pst(H^i\_ét(X\_{y,K̄\_v}, Q\_p)) whose K̄\_v-extension corresponds, through c\_BO and Scholze's comparison c\_dR: D\_dR(H^i\_ét(X\_{y,K̄\_v}, Q\_p)) ≅ H^i\_dR(X\_y/K\_v) at y₀ and at y, to 1 ⊗ T^∇\_{y₀,y}: H^i\_dR(X\_{y₀}/K\_v) → H^i\_dR(X\_y/K\_v), the parallel transport composed with the base-change isomorphisms. In other words, H^i\_pst(X\_y/Q\_p^nr) is constant on U(K\_v) as a (φ, N, G\_v)-module, and only the Hodge filtration moves.

**Hypotheses and conventions.**

- No reduction hypothesis on π: K\_v is any finite extension of Q\_p, and π need not extend to any model.
- c\_dR is Scholze's comparison isomorphism, constructed from the relative comparison (P8); the statement is for that c\_dR (Betts–Stix Remark 3.4).

**Proof sketch.**

1. Apply the relative comparison to π^an and the unit de Rham pair (Ẑ\_p, O\_{X^an}, 1): (R^iπ^an\_\*Ẑ\_p, R^iπ^an\_dR,\*O, c\_dR) is a de Rham pair on Y^an (P8/de-rham-pair-derived-pushforward).
2. By the analytification comparisons (P8/de-rham-pair-pushforward-compatibilities) these are the analytifications of R^iπ\_ét,\*Z\_p and of H^i\_dR(X/Y) with its Gauss–Manin connection (ComplexComparisonPartII C5/gauss-manin-connection), and the fibre of c\_dR at a K\_v-point is Scholze's c\_dR for the fibre (Betts–Stix (3.8)).
3. Apply SPM.4/horizontal-de-rham-transport to the restriction of this pair to U.

**Checks.**

- For π with good reduction on a residue disk, Lawrence–Venkatesh obtain an analogous transport through crystalline cohomology (LV.4/fibre-filtered-phi-transport); identifying the two needs a comparison of Scholze's c\_dR with the crystalline comparison, which Betts–Stix (Remark 3.4) note is not covered by Nizioł's comparison results, so this roadmap does not use it.
- The isomorphism class of H^i\_pH(X\_y/K\_v) is not constant on U in general; only its (φ, N, G\_v)-module is.

**Sources.**

- L. Alexander Betts and Jakob Stix, Theorem 3.3 and Remark 3.4, pp. 16–17. For a smooth proper family and a polydisc on which relative de Rham cohomology has a full horizontal basis, the D\_pst of the étale cohomology of fibres are identified compatibly with parallel transport; the comparison isomorphism used is Scholze's.
- L. Alexander Betts and Jakob Stix, Proof of Theorem 3.3 from Theorem 3.22, p. 29. Apply Scholze's relative comparison to the unit pair to get a de Rham pair whose components are the analytified relative étale and de Rham cohomology, and use Theorem 3.22.
- L. Alexander Betts and Jakob Stix, §3, pp. 15 and 18. The presentation avoids good reduction and models, replacing crystalline cohomology by relative p-adic Hodge theory of Scholze and Shimizu.

**Needs.** [Horizontal de Rham transport of D\_pst](#spm-4-horizontal-de-rham-transport); `PadicHodgeTheory:P8/de-rham-pair-derived-pushforward`; `PadicHodgeTheory:P8/de-rham-pair-pushforward-compatibilities`; `ComplexComparisonPartII:C5/gauss-manin-connection`; `AdicSpacesPartII:R1/rigid-analytification`; `MordellLawrenceVenkatesh:LV.3`.

<a id="spm-4-period-map-controls-local-representations"></a>

### Period maps control the local Galois representations

**Theorem** (`SPM.4/period-map-controls-local-representations`). Planet: Period maps control local representations. Let π: X → Y, i and U ∋ y₀ be as in SPM.4/period-maps-control-dpst, and Φ\_{y₀}: U → G^an\_{y₀} the v-adic period map of the filtered flat bundle H^i\_dR(X/Y)^an (requested from LV.3 in the model-free form), G\_{y₀} the flag variety of filtrations of H^i\_dR(X\_{y₀}/K\_v) with the dimension data of its Hodge filtration. For a filtration Φ ∈ G\_{y₀}(K\_v) let M^i(Φ) := (H^i\_pst(X\_{y₀}/Q\_p^nr), H^i\_dR(X\_{y₀}/K\_v) filtered by Φ, c\_dR ∘ c\_BO), the retwist of SPM.2/automorphism-group. Then H^i\_pH(X\_y/K\_v) ≅ M^i(Φ\_{y₀}(y)) as filtered discrete (φ, N, G\_v)-modules for every y ∈ U(K\_v). Hence, D\_pH being fully faithful, Φ\_{y₀}(y) determines the isomorphism class of the G\_v-representation H^i\_ét(X\_{y,K̄\_v}, Q\_p), and two points y, y′ ∈ U(K\_v) with Φ\_{y₀}(y), Φ\_{y₀}(y′) in one Aut(H^i\_pst(X\_{y₀}))(Q\_p)-orbit have isomorphic local representations.

**Hypotheses and conventions.**

- As in SPM.4/period-maps-control-dpst; the filtration of the bundle is the Hodge filtration, which is Griffiths transverse, though Definition 3.1 does not need this.

**Proof sketch.**

1. The isomorphism T\_{y₀,y} of SPM.4/period-maps-control-dpst, paired with T^∇\_{y₀,y} on de Rham cohomology, is an isomorphism M^i(Φ\_{y₀}(y)) → H^i\_pH(X\_y/K\_v): by definition of Φ\_{y₀}, T^∇\_{y₀,y} carries the filtration Φ\_{y₀}(y) to the Hodge filtration of X\_y.
2. Full faithfulness of D\_pH (requested from R06.3) turns an isomorphism of p-adic Hodge cohomology into an isomorphism of representations.
3. The orbit statement is SPM.2/orbit-lemma.

**Checks.**

- At y = y₀, Φ\_{y₀}(y₀) is the Hodge filtration and M^i(Φ\_{y₀}(y₀)) = H^i\_pH(X\_{y₀}/K\_v).
- In diagram form: the map y ↦ [H^i\_ét(X\_{y,K̄\_v})] from U(K\_v) to isomorphism classes of de Rham G\_v-representations factors through Φ\_{y₀}, M^i and D\_pH.

**Sources.**

- L. Alexander Betts and Jakob Stix, Proposition 3.5 and the diagram after it, pp. 17–18. For y in the polydisc, the p-adic Hodge cohomology of the fibre at y is the base-point module with its filtration replaced by the period map value; since D\_pH is fully faithful, the period map determines the isomorphism class of the local representation.

**Needs.** [Period maps control D\_pst in smooth proper families](#spm-4-period-maps-control-dpst); [Automorphism groups and retwisted filtrations](#spm-2-automorphism-group); [The orbit lemma for retwisted filtrations](#spm-2-orbit-lemma); [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction); `PadicHodgeTheory:R06.3`; `MordellLawrenceVenkatesh:LV.3`.

### Dependencies of SPM.4

Stages used: `AdicSpacesPartII:R1`, `ComplexComparisonPartII:C5`, `GaloisSectionsPadicPeriodMaps:SPM.2`, `MordellLawrenceVenkatesh:LV.3`, `PadicHodgeTheory:P8`, `PadicHodgeTheory:R06.3`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

## Layer SPM.5: Period maps of abelian-by-finite families

**Targets.** The symplectic pair H^{≤1}\_pH(X\_y/K\_v) in MF(φ, N, G\_v), using the Chern-class compatibility of c\_dR (Betts–Stix §4.1.3; CohomologyComparisons CP.6). The Lagrangian period domain H\_{y₀} and the pairs M^{≤1}(Φ) (Definition 4.10). Proposition 4.11: on a polydisc the period map of an abelian-by-finite family lands in H\_{y₀} and D\_pH of the fibre pair at y is M^{≤1}(Φ\_{y₀}(y)). Lemma 4.12 and (4.3): the decomposition of H\_{y₀} and of M¹(Φ) over the closed points of Y′\_{y₀}.

<a id="spm-5-p-adic-hodge-symplectic-pair"></a>

### The symplectic pair of p-adic Hodge cohomology of a fibre

**Theorem** (`SPM.5/p-adic-hodge-symplectic-pair`). Let X → Y′ → Y be an abelian-by-finite family over a scheme Y of characteristic zero with polarisation λ, K\_v a finite extension of Q\_p and y ∈ Y(K\_v). Then Scholze's comparison c\_dR identifies the étale and de Rham first Chern classes of λ, c₁^ét(λ) ↔ c₁^dR(λ), so that the étale pairing ω\_λ^ét and the de Rham pairing ω\_λ^dR correspond, and H^{≤1}\_pH(X\_y/K\_v) := (H⁰\_pH(X\_y/K\_v), H¹\_pH(X\_y/K\_v)) with pairing ω\_λ^pH: ∧²H¹\_pH → H⁰\_pH⟨−1⟩ (components D\_pst(ω\_λ^ét) and ω\_λ^dR) is a symplectic pair in MF(φ, N, G\_v). It is isomorphic to D\_pH(H^{≤1}\_ét(X\_{y,K̄\_v}, Q\_p)) as a symplectic pair.

**Hypotheses and conventions.**

- ⟨−1⟩ is the Tate twist of filtered modules, D\_dR shifted so that its filtration jump moves by one; the identification of Q\_p(−1) with ⟨−1⟩ uses the isomorphism a: B\_dR(−1) ≅ B\_dR⟨−1⟩ of CohomologyComparisons CP.6/trace-normalized-tate-period.

**Proof sketch.**

1. c\_dR is an isomorphism of graded algebras, natural and compatible with base change (CP.6/naturality-base-change-and-cup-products), so H⁰\_pH is an algebra and H¹\_pH a module over it in MF(φ, N, G\_v).
2. c\_dR ⊗ a⁻¹ carries c₁^ét of the line bundle (1, λ)^\*P to c₁^dR (CP.6/first-chern-class-comparison; the paper's argument through the total space of the line bundle is repaired as in the extraction's E3).
3. Hence the étale and de Rham pairings, each perfect by the model-free Lemmas 4.2 and 4.6 requested from LV.2, match under the comparison, and ω\_λ^pH is a perfect pairing in MF(φ, N, G\_v).
4. The comparison with D\_pH of the étale pair is the definition of H^•\_pH (SPM.2/restriction-induction).

**Checks.**

- For an elliptic curve E over K\_v, H^{≤1}\_pH(E/K\_v) is (1, H¹\_pH(E)) with the pairing into 1⟨−1⟩ given by D\_pst of the Weil pairing and the de Rham cup product.

**Sources.**

- L. Alexander Betts and Jakob Stix, §4.1.3, p. 35. Over K\_v, Scholze's comparison identifies the étale and de Rham Chern classes of the polarisation, so the two pairings correspond and the p-adic Hodge cohomology of a fibre in degrees ≤ 1 is a symplectic pair of filtered discrete (φ, N, G\_v)-modules.
- L. Alexander Betts and Jakob Stix, Proposition 3.20(5)–(8), pp. 27–28. Compatibility of c\_dR with traces, duality, cycle and Chern classes through the isomorphism a.

**Needs.** [Symplectic modules and symplectic pairs](#spm-1-symplectic-pair); [The symplectic pair of a fibre](#spm-1-fibre-symplectic-pair); [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction); `CohomologyComparisons:CP.6/first-chern-class-comparison`; `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`; `CohomologyComparisons:CP.6/trace-normalized-tate-period`; `MordellLawrenceVenkatesh:LV.2`.

<a id="spm-5-lagrangian-period-modules"></a>

### The symplectic pairs M^{≤1}(Φ) of Lagrangian filtrations

**Definition** (`SPM.5/lagrangian-period-modules`). Planet: Lagrangian period modules. Let X → Y′ → Y be an abelian-by-finite family over a smooth K\_v-variety Y and y₀ ∈ Y(K\_v). Let H\_{y₀} be the K\_v-variety of Lagrangian H⁰\_dR(X\_{y₀}/K\_v)-submodules of H¹\_dR(X\_{y₀}/K\_v) (the period variety LV.3/lagrangian-period-variety of the symplectic module H¹\_dR over the finite étale algebra H⁰\_dR(X\_{y₀}/K\_v) = O(Y′\_{y₀})), a closed subvariety of the flag variety G\_{y₀}. For Φ ∈ H\_{y₀}(K\_v), M¹(Φ) := (H¹\_pst(X\_{y₀}/Q\_p^nr), H¹\_dR(X\_{y₀}/K\_v), c\_dR ∘ c\_BO) with the filtration F^i = H¹\_dR for i ≤ 0, F¹ = Φ, F^i = 0 for i ≥ 2, and M⁰ := H⁰\_pH(X\_{y₀}/K\_v). Then M¹(Φ) is a symplectic M⁰-module in MF(φ, N, G\_v) for the pairing ω\_λ^pH, and M^{≤1}(Φ) := (M⁰, M¹(Φ)) is a symplectic pair. The Hodge filtration point Φ₀ = F¹H¹\_dR(X\_{y₀}) gives M^{≤1}(Φ₀) = H^{≤1}\_pH(X\_{y₀}/K\_v).

**Hypotheses and conventions.**

- Φ is Lagrangian for ω\_λ^dR, which is what makes the retwisted pairing a morphism of filtered modules into M⁰⟨−1⟩.

**Proof sketch.**

1. M¹(Φ) is the retwist of SPM.2/automorphism-group of H¹\_pH(X\_{y₀}/K\_v) by the two-step filtration Φ.
2. The pairing ω\_λ^pH: ∧² M¹(Φ) → M⁰⟨−1⟩ respects filtrations exactly when ω\_λ^dR(Φ, Φ) = 0, i.e. Φ isotropic, and it is perfect as a filtered pairing exactly when Φ is Lagrangian (rank d over H⁰\_dR on each factor).
3. The algebra M⁰ is untouched, and at Φ₀ the retwist is the identity.

**API.**

- `lagrangianPeriodDomain` (data): H\_{y₀} ⊆ G\_{y₀}: Lagrangian H⁰\_dR(X\_{y₀})-submodules of H¹\_dR(X\_{y₀}), the period variety of LV.3.
- `M1` (constructor): M¹(Φ) = retwist of H¹\_pH(X\_{y₀}/K\_v) by F¹ = Φ.
- `M0` (data): M⁰ = H⁰\_pH(X\_{y₀}/K\_v), a split algebra in MF(φ, N, G\_v) when Y′\_{y₀} splits over K\_v, and in general Ind of units over the residue fields of Y′\_{y₀}.
- `Mle1` (constructor): M^{≤1}(Φ) = (M⁰, M¹(Φ)), a symplectic pair in MF(φ, N, G\_v).
- `Mle1_hodge` (simp): M^{≤1}(F¹H¹\_dR(X\_{y₀})) = H^{≤1}\_pH(X\_{y₀}/K\_v).
- `Mle1_iso_iff` (characterisation): M^{≤1}(Φ) ≅ M^{≤1}(Φ′) iff Φ and Φ′ lie in one orbit of the Q\_p-points of the automorphism group of the symplectic pair (H⁰\_pst, H¹\_pst) of the base fibre (SPM.2/orbit-lemma).

**Unit tests.**

- `Mle1.hodge_point` (computation): At the Hodge point Φ₀, M^{≤1}(Φ₀) is the p-adic Hodge cohomology of the fibre in degrees ≤ 1.
- `Mle1.elliptic_line` (computation): For a single elliptic curve fibre, H\_{y₀} = P¹ and M¹(Φ) is the rank-two module with F¹ = Φ; two lines give isomorphic M¹ exactly when they are in one orbit of Aut(H¹\_pst)(Q\_p).
- `Mle1.not_isotropic` (non-example): For a non-isotropic two-dimensional Φ in H¹\_dR of an abelian surface, the pairing is not a morphism of filtered modules into M⁰⟨−1⟩: the retwist by a non-Lagrangian filtration is not a symplectic pair.
- `Mle1.split_family` (degenerate): For Y′ = Y, M⁰ = 1 is the unit object and M^{≤1}(Φ) is a symplectic module over the unit.

**Uses.**

- Betts–Stix, Proposition 4.11: the period map composed with M^{≤1} computes D\_pH of the fibre cohomology
- Betts–Stix, Definition 1.7: the period-domain Lawrence–Venkatesh locus is defined by comparing M^{≤1}(Φ) with S-good pairs
- Betts–Stix, Propositions 6.9 and 6.15: non-density of the type (a) and type (b) loci in H\_{y₀}

**Checks.**

- At Φ₀ one recovers H^{≤1}\_pH(X\_{y₀}/K\_v) (SPM.5/p-adic-hodge-symplectic-pair).
- For an elliptic curve (d = 1, Y′ = Y) H\_{y₀} = P¹ and M¹(Φ) is H¹\_pst(E\_{y₀}) with F¹ the line Φ.

**Sources.**

- L. Alexander Betts and Jakob Stix, §4.2, Definition 4.10, p. 37. The Lagrangian period domain H\_{y₀} and, for each Lagrangian Φ, the symplectic pair M^{≤1}(Φ) obtained from the p-adic Hodge cohomology of the base fibre by replacing the Hodge filtration of H¹\_dR with the two-step filtration given by Φ.

**Needs.** [The symplectic pair of p-adic Hodge cohomology of a fibre](#spm-5-p-adic-hodge-symplectic-pair); [Automorphism groups and retwisted filtrations](#spm-2-automorphism-group); `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`; `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian`; `MordellLawrenceVenkatesh:LV.2`.

<a id="spm-5-abelian-by-finite-period-diagram"></a>

### Period maps of abelian-by-finite families

**Theorem** (`SPM.5/abelian-by-finite-period-diagram`). Planet: Period map of an abelian-by-finite family. Let X → Y′ → Y be an abelian-by-finite family over a smooth variety Y over a finite extension K\_v of Q\_p, y₀ ∈ Y(K\_v), and U\_{y₀} ⊆ Y^an an admissible open isomorphic to a closed polydisc over which H⁰\_dR(X/Y)^an and H¹\_dR(X/Y)^an have full bases of horizontal sections. Then the period map Φ\_{y₀} of H¹\_dR(X/Y) takes values in H^an\_{y₀}, and for every y ∈ U\_{y₀}(K\_v), D\_pH(H^{≤1}\_ét(X\_{y,K̄\_v}, Q\_p)) ≅ H^{≤1}\_pH(X\_y/K\_v) ≅ M^{≤1}(Φ\_{y₀}(y)) as symplectic pairs in MF(φ, N, G\_v). That is, the map Y(K\_v) → π₀SP(Rep^dR\_{Q\_p}(G\_v)), y ↦ [H^{≤1}\_ét(X\_{y,K̄\_v}, Q\_p)], restricted to U\_{y₀}(K\_v), equals the composite of Φ\_{y₀}, M^{≤1} and the inverse of D\_pH on isomorphism classes (D\_pH is injective on isomorphism classes by full faithfulness, and M^{≤1}(Φ\_{y₀}(y)) lies in its image).

**Hypotheses and conventions.**

- No model or reduction hypothesis; K\_v any finite extension of Q\_p.

**Proof sketch.**

1. Parallel transport on H⁰\_dR and H¹\_dR respects the algebra, module and pairing structures (model-free Lemma 4.8 requested from LV.2), so Φ\_{y₀}(y) is a Lagrangian submodule and Φ\_{y₀} lands in H^an\_{y₀}.
2. The first isomorphism is SPM.5/p-adic-hodge-symplectic-pair; the second is SPM.4/period-map-controls-local-representations for i = 0, 1, the transport isomorphisms T\_{y₀,y} being compatible with products and the pairing because they are unique (SPM.4/horizontal-de-rham-transport).
3. On H⁰ the period map is constant, since H⁰\_dR has trivial filtration; so the algebra is M⁰ throughout.

**Checks.**

- Consequently two points of U\_{y₀}(K\_v) with the same period value have isomorphic symplectic pairs of local representations.

**Sources.**

- L. Alexander Betts and Jakob Stix, Proposition 4.11 and proof, p. 37. For an abelian-by-finite family and a polydisc on which H⁰\_dR and H¹\_dR have full horizontal bases, D\_pH of the fibre pair at y is M^{≤1} of the period map at y, as symplectic pairs: the diagram (1.2) of the introduction commutes.
- L. Alexander Betts and Jakob Stix, Lemma 4.8, Remark 4.9 and §4.2, pp. 36–37. Parallel transport respects the algebra, module and pairing structures, so the period map of an abelian-by-finite family lands in the Lagrangian period domain.
- L. Alexander Betts and Jakob Stix, §1.1.2, (1.2), p. 4. The diagram expressing that the period map controls the symplectic pairs of local Galois representations.

**Needs.** [Period maps control the local Galois representations](#spm-4-period-map-controls-local-representations); [The symplectic pair of p-adic Hodge cohomology of a fibre](#spm-5-p-adic-hodge-symplectic-pair); [The symplectic pairs M^{≤1}(Φ) of Lagrangian filtrations](#spm-5-lagrangian-period-modules); [Horizontal de Rham transport of D\_pst](#spm-4-horizontal-de-rham-transport); `MordellLawrenceVenkatesh:LV.2`; `MordellLawrenceVenkatesh:LV.3`; `PadicHodgeTheory:R06.3`.

<a id="spm-5-period-domain-decomposition"></a>

### Decomposition of the period domain over the fibre of Y′

**Lemma** (`SPM.5/period-domain-decomposition`). In the setting of SPM.5/lagrangian-period-modules, let (y′\_i)\_{i∈I} be the closed points of Y′\_{y₀}, L\_{w\_i} := K\_v(y′\_i) with a fixed K\_v-embedding into K̄\_v and G\_{w\_i} ≤ G\_v. Then H\_{y₀} = ∏\_i Res^{L\_{w\_i}}\_{K\_v} H\_{y′\_i} with H\_{y′\_i} := LGrass(H¹\_dR(X\_{y′\_i}/L\_{w\_i})) (4.3); every Φ ∈ H\_{y₀}(K\_v) is a product ∏\_i Φ′\_i of Lagrangian L\_{w\_i}-subspaces Φ′\_i of H¹\_dR(X\_{y′\_i}/L\_{w\_i}); and M¹(Φ) = ∏\_i Ind\_{G\_{w\_i}}^{G\_v} M¹\_i(Φ′\_i) in MF(φ, N, G\_v), compatibly with the symplectic structures over M⁰ ≅ ∏\_i Ind\_{G\_{w\_i}}^{G\_v} 1, where M¹\_i(Φ′\_i) := (H¹\_pst(X\_{y′\_i}/Q\_p^nr), H¹\_dR(X\_{y′\_i}/L\_{w\_i}) with F¹ = Φ′\_i, c\_dR ∘ c\_BO) in MF(φ, N, G\_{w\_i}).

**Hypotheses and conventions.**

- The printed lemma writes H¹\_dR(X\_{y′\_0}/L\_{w\_i}) for the i-th factor and indexes the product (4.3) by y′\_0; the correct indices are y′\_i (extraction E4 and this packet's E6).

**Proof sketch.**

1. The decomposition X\_{y₀} = ⊔\_i X\_{y′\_i} gives H¹\_pH(X\_{y₀}/K\_v) = ∏\_i Ind\_{G\_{w\_i}}^{G\_v} H¹\_pH(X\_{y′\_i}/L\_{w\_i}) by (2.2) of SPM.2/restriction-induction, compatibly with the module structure over H⁰\_pH = ∏ Ind 1.
2. A Lagrangian H⁰\_dR = ∏\_i L\_{w\_i}-submodule of ∏\_i H¹\_dR(X\_{y′\_i}/L\_{w\_i}) is a product of Lagrangian L\_{w\_i}-subspaces; this is the factorisation of LV.3/lagrangian-period-variety-splitting, written with Weil restriction (AbelianSchemesAndArithmeticModuli A6).
3. Replacing the Hodge filtrations by Φ and the Φ′\_i respects the decomposition.

**Checks.**

- dim\_{K\_v} H\_{y₀} = Σ\_i [L\_{w\_i} : K\_v]·d(d + 1)/2, where d is the constant relative dimension.

**Sources.**

- L. Alexander Betts and Jakob Stix, §4.2.1, (4.3) and Lemma 4.12 with proof, p. 38. The period domain is the product over the closed points of Y′\_{y₀} of Weil restrictions of Lagrangian Grassmannians, and M¹(Φ) is the product of the inductions of the factor modules, compatibly with the symplectic structure over M⁰.

**Needs.** [The symplectic pairs M^{≤1}(Φ) of Lagrangian filtrations](#spm-5-lagrangian-period-modules); [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction); `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`.

### Dependencies of SPM.5

Stages used: `AbelianSchemesAndArithmeticModuli:A6`, `CohomologyComparisons:CP.6`, `GaloisSectionsPadicPeriodMaps:SPM.1`, `GaloisSectionsPadicPeriodMaps:SPM.2`, `GaloisSectionsPadicPeriodMaps:SPM.4`, `MordellLawrenceVenkatesh:LV.2`, `MordellLawrenceVenkatesh:LV.3`, `PadicHodgeTheory:R06.3`.

## Layer SPM.6: The Lawrence–Venkatesh loci and the principal trichotomy

**Targets.** S-good pairs (Betts–Stix Definitions 1.2, 6.2) and the Lawrence–Venkatesh locus Y(K\_v)^LV\_{X,S} with Remark 6.3; the period-domain locus H\_{y₀}(K\_v)^LV\_{X,S} and the reduction of finiteness to Zariski density of period maps and non-density of this locus (Definition 1.7, §1.1.2). Lemma 6.4 (interpolating pairs are S-good) and Y(K) ⊆ Y(K\_v)^LV\_{X,S}. The non-symplectic locus of Remark 1.4 with the genus-3 numerics. Remark 6.6 on the points of the fibre algebra. The principal trichotomy (Proposition 6.7, with #Σ\_A in (c), corrected after the extraction's E1) and the three loci of Definition 6.8, which cover the Lawrence–Venkatesh locus at a self-conjugate place.

<a id="spm-6-s-good-pair"></a>

### S-good symplectic pairs

**Definition** (`SPM.6/s-good-pair`). Planet: S-good pairs. Let K be a number field, S a finite set of places of K and p a prime. A symplectic pair (A, V) of continuous Q\_p-representations of G\_K (SPM.1/symplectic-pair) is S-good when: (i) A is unramified outside S; (ii) V is unramified, pure and integral of weight 1 outside S (R34.1/pure-and-integral-galois-representations); (iii) V is de Rham at every place above p with Hodge–Tate weights in {0, 1}. It is Artin S-good if moreover A has finite image (A pure and integral of weight 0).

**Hypotheses and conventions.**

- S is arbitrary in the definition; in the loci below it contains the places above p∞ and the places of bad reduction of the family ('suitable').
- Weights are those of geometric Frobenius (q\_u-Weil numbers); Hodge–Tate weights are normalised so that Q\_p(1) has weight −1.

**Proof sketch.**

1. Each condition is a condition on the restrictions to decomposition groups (R01.2/local-restriction), independent of the chosen embeddings.
2. All three conditions pass to isomorphic pairs, so S-goodness is a property of isomorphism classes.

**API.**

- `SymplecticPair.IsSGood` (data): The three conditions (i)–(iii) on (A, V).
- `SymplecticPair.IsSGood.mono` (other): S ⊆ S′ and (A, V) S-good imply (A, V) S′-good.
- `SymplecticPair.IsSGood.iso` (extensionality): S-goodness is invariant under isomorphism of symplectic pairs.
- `SymplecticPair.IsSGood.restrict` (functoriality): For L/K finite, the restriction to G\_L is S\_L-good, S\_L the places above S.
- `SymplecticPair.IsSGood.fibre` (characterisation): For ψ ∈ Σ\_A, the fibre V\_ψ is a symplectic G\_ψ-representation unramified, pure and integral of weight 1 outside the places of L\_ψ above S and de Rham above p with weights in {0, 1}.
- `SymplecticPair.IsArtinSGood` (other): The variant with A of finite image; it defines the same loci (Remark 6.3).

**Unit tests.**

- `SymplecticPair.IsSGood.abelianVariety` (computation): For an abelian variety A₀/K with good reduction outside S ∋ p, ∞, the pair (Q\_p, H¹\_ét(A₀,K̄, Q\_p)) with a polarisation pairing is S-good.
- `SymplecticPair.IsSGood.impure` (non-example): V = Q\_p ⊕ Q\_p(−1) with ω(e₁ ∧ e₂) a generator of L = Q\_p(−1) is a symplectic representation with Hodge–Tate weights {0, 1}, but Q\_p is pure of weight 0, not 1, so (Q\_p, V) is not S-good for any S.
- `SymplecticPair.IsSGood.twist` (non-example): For an elliptic curve E/K, (Q\_p, H¹\_ét(E\_{K̄}, Q\_p)(1)) has weight −1 and Hodge–Tate weights {−1, 0}; it is not S-good.
- `SymplecticPair.IsSGood.zeroRank` (degenerate): The pair (A, 0) is S-good exactly when A is unramified outside S.

**Uses.**

- Betts–Stix, Definition 1.2: defines the Lawrence–Venkatesh locus
- Betts–Stix, Lemma 6.4: an interpolating pair is automatically S-good for suitable S
- Betts–Stix, Definition 6.11 and Lemma 6.12: the GSp-irreducible fibres of S-good pairs of type (a) give finitely many local classes

**Checks.**

- The pair of a fibre H^{≤1}\_ét(X\_{y,K̄}, Q\_p) at y ∈ Y(K) is S-good for suitable S (SPM.6/rational-points-in-lv-locus).
- S-good pairs with A = Q\_p and V GSp-irreducible of rank 2d fall into finitely many isomorphism classes (the symplectic Faltings lemma requested from LV.1).

**Sources.**

- L. Alexander Betts and Jakob Stix, Definition 1.2 and Definition 6.2, pp. 2 and 43–44. A pair of an algebra and a symplectic module in Galois representations is S-good when the algebra is unramified outside S, the module unramified, pure and integral of weight 1 outside S, and de Rham above p with Hodge–Tate weights 0 and 1.
- L. Alexander Betts and Jakob Stix, Remark 6.3, p. 44. Requiring the algebra to be an Artin representation changes none of the loci, since an interpolating algebra is split and has finite automorphism group.

**Needs.** [Symplectic modules and symplectic pairs](#spm-1-symplectic-pair); `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`; `PadicHodgeTheory:R06.2/plan/admissible-representations`; `ArithmeticGaloisRepresentations:R01.2/local-restriction`; `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`.

<a id="spm-6-lawrence-venkatesh-locus"></a>

### The Lawrence–Venkatesh locus

**Definition** (`SPM.6/lawrence-venkatesh-locus`). Planet: Lawrence–Venkatesh locus. Let K be a number field, Y/K a smooth projective geometrically connected curve, X → Y′ → Y an abelian-by-finite family, p a prime, v a place of K above p and S a finite set of places containing the places above p∞ and the places of bad reduction of the family (a place u is of good reduction when the family extends to an abelian-by-finite family over a smooth proper model of Y over O\_u). The Lawrence–Venkatesh locus Y(K\_v)^LV\_{X,S} ⊆ Y(K\_v) is the set of y\_v for which some S-good pair (A, V) (SPM.6/s-good-pair) satisfies H^{≤1}\_ét(X\_{y\_v,K̄\_v}, Q\_p) ≅ (A|G\_v, V|G\_v) as symplectic pairs of G\_v-representations; (A, V) interpolates y\_v. Requiring (A, V) Artin S-good gives the same set.

**Hypotheses and conventions.**

- S suitable: containing the places above p and ∞ and those of bad reduction; enlarging S enlarges the locus.
- Only the single place v is interpolated, unlike the adelic locus of SPM.1/adelic-lv-locus.

**Proof sketch.**

1. The condition compares symplectic pairs of G\_v-representations; it depends on (A, V) only up to isomorphism.
2. Remark 6.3: if (A, V) interpolates y\_v then A|G\_v ≅ H⁰\_ét(X\_{y\_v,K̄\_v}) is split (SPM.6/fibre-algebra-points), so A ≅ Q\_p^n as an algebra and its automorphism group is finite; the G\_K-action on A therefore has finite image and A is Artin.

**API.**

- `lvLocus` (data): Y(K\_v)^LV\_{X,S} ⊆ Y(K\_v).
- `lvLocus.mono` (other): S ⊆ S′ gives Y(K\_v)^LV\_{X,S} ⊆ Y(K\_v)^LV\_{X,S′}.
- `lvLocus_eq_artin` (equivalence): Restricting to Artin S-good interpolating pairs gives the same locus.
- `lvLocus.rationalPoints` (other): Y(K) ⊆ Y(K\_v)^LV\_{X,S}.
- `lvLocus.adelic` (compatibility): Y(K\_v)^LV\_X ⊆ Y(K\_v)^LV\_{X,S} (Lemma 6.4).

**Unit tests.**

- `lvLocus.constantFamily` (degenerate): For X = Y × A₀ (Y′ = Y), the constant S-good pair interpolates every point: Y(K\_v)^LV\_{X,S} = Y(K\_v).
- `lvLocus.rationalPoint` (computation): For y ∈ Y(K), the pair H^{≤1}\_ét(X\_{y,K̄}, Q\_p) interpolates the image of y in Y(K\_v).
- `lvLocus.notAdelic` (characterisation): The locus asks for interpolation only at v: the adelic locus projects into it, and the inclusion uses only that interpolating pairs are S-good (Lemma 6.4).
- `lvLocus.symplectic_matters` (non-example): Dropping the pairing from the definition gives the larger locus of SPM.6/non-symplectic-locus, which the Lawrence–Venkatesh argument can only bound with larger auxiliary families.

**Uses.**

- Betts–Stix, Theorem 6.5: finite for a suitable family at every self-conjugate place
- Betts–Stix, Theorem 7.1 and Lemma 6.4: contains the localisations of Selmer sections

**Checks.**

- Y(K) ⊆ Y(K\_v)^LV\_{X,S} (SPM.6/rational-points-in-lv-locus).
- For the constant family Y × A₀ the locus is all of Y(K\_v).

**Sources.**

- L. Alexander Betts and Jakob Stix, Definition 1.2, p. 2, and Definition 6.2 with footnotes 20–21, pp. 43–44. For a suitable S, the Lawrence–Venkatesh locus is the set of local points whose fibre cohomology in degrees ≤ 1, as a symplectic pair of local representations, is the restriction of an S-good global pair; good reduction means the family extends over a smooth proper model.
- L. Alexander Betts and Jakob Stix, Remark 6.3, p. 44. Adding the Artin condition does not change the locus.

**Needs.** [S-good symplectic pairs](#spm-6-s-good-pair); [The symplectic pair of a fibre](#spm-1-fibre-symplectic-pair); [The adelic Lawrence–Venkatesh locus](#spm-1-adelic-lv-locus); `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`.

<a id="spm-6-period-domain-lv-locus"></a>

### The Lawrence–Venkatesh locus in the period domain

**Definition** (`SPM.6/period-domain-lv-locus`). Planet: LV locus in the period domain. In the setting of SPM.6/lawrence-venkatesh-locus, let y₀ ∈ Y(K\_v) and H\_{y₀} the Lagrangian period domain (SPM.5/lagrangian-period-modules). Then H\_{y₀}(K\_v)^LV\_{X,S} ⊆ H\_{y₀}(K\_v) is the set of Lagrangians Φ for which some S-good pair (A, V) satisfies M^{≤1}(Φ) ≅ (D\_pH(A|G\_v), D\_pH(V|G\_v)) as symplectic pairs in MF(φ, N, G\_v). For a closed polydisc U\_{y₀} ∋ y₀ as in SPM.5/abelian-by-finite-period-diagram, Φ\_{y₀}(U\_{y₀}(K\_v) ∩ Y(K\_v)^LV\_{X,S}) ⊆ H\_{y₀}(K\_v)^LV\_{X,S}. Consequently Y(K\_v)^LV\_{X,S} is finite as soon as, for every y₀ ∈ Y(K\_v), (i) Φ\_{y₀} has Zariski-dense image in H\_{y₀} and (ii) H\_{y₀}(K\_v)^LV\_{X,S} is not Zariski dense in H\_{y₀}.

**Hypotheses and conventions.**

- Y is a smooth projective curve, so Y(K\_v) is compact and covered by finitely many discs U\_{y₀}(K\_v) (the properness needed by Remark 5.11, this packet's E3).

**Proof sketch.**

1. The inclusion is SPM.5/abelian-by-finite-period-diagram: D\_pH of the fibre pair at y is M^{≤1}(Φ\_{y₀}(y)), and D\_pH of an interpolating pair is (D\_pH(A|G\_v), D\_pH(V|G\_v)).
2. If (i) and (ii) hold, U\_{y₀}(K\_v) ∩ Y(K\_v)^LV\_{X,S} lies in the preimage of a proper Zariski-closed subset, which in a disc is the zero set of a non-zero coherent ideal, hence finite (the model-free Corollary 5.10 requested from LV.3).
3. Cover the compact Y(K\_v) by finitely many such discs.

**API.**

- `periodLVLocus` (data): H\_{y₀}(K\_v)^LV\_{X,S} ⊆ H\_{y₀}(K\_v).
- `periodMap_mem_periodLVLocus` (compatibility): Φ\_{y₀}(y) ∈ H\_{y₀}(K\_v)^LV\_{X,S} for y ∈ U\_{y₀}(K\_v) ∩ Y(K\_v)^LV\_{X,S}.
- `lvLocus_finite_of_periodLVLocus` (other): Zariski density of every Φ\_{y₀} and non-density of every H\_{y₀}(K\_v)^LV\_{X,S} imply Y(K\_v)^LV\_{X,S} finite.
- `periodLVLocus.mono` (other): Monotone in S.

**Unit tests.**

- `periodLVLocus.hodgePoint` (computation): If y₀ ∈ Y(K\_v)^LV\_{X,S}, the Hodge point F¹H¹\_dR(X\_{y₀}) lies in H\_{y₀}(K\_v)^LV\_{X,S}.
- `periodLVLocus.constantFamily` (degenerate): For a constant family of positive relative dimension the period domain has positive dimension, the period map is constant and condition (i) fails; the criterion does not apply, consistently with the locus being all of Y(K\_v).
- `periodLVLocus.orbitUnion` (characterisation): H\_{y₀}(K\_v)^LV\_{X,S} is a union of orbits of the automorphism group of the pair (H⁰\_pst, H¹\_pst) of the base fibre (SPM.2/orbit-lemma).
- `periodLVLocus.affine_curve` (non-example): For a non-proper curve the criterion fails: for the Legendre family over P¹ ∖ {0, 1, ∞} over Q\_p, the infinite set {p^{−n}} meets every closed disc in finitely many points (the counterexample behind this packet's E3).

**Uses.**

- Betts–Stix, Propositions 6.9 and 6.15: the type (a) and type (b) parts of it are not Zariski dense
- Betts–Stix, §1.1.2: reduces finiteness of Y(K\_v)^LV\_{X,S} to (i) and (ii)

**Checks.**

- Condition (i) holds under full monodromy (model-free Lemma 5.9, requested from LV.3); (ii) is proved type by type in SPM.7 and SPM.8.

**Sources.**

- L. Alexander Betts and Jakob Stix, Definition 1.7 and the paragraph after it, §1.1.2, p. 5. The period-domain locus is the set of Lagrangians whose retwisted symplectic pair matches D\_pH of an S-good pair; the period map sends the Lawrence–Venkatesh locus into it, so density of the period map and non-density of this set give finiteness.
- L. Alexander Betts and Jakob Stix, Remark 5.11, p. 43. Finiteness of the whole locus follows from finiteness on each disc by compactness of Y(K\_v).

**Needs.** [The Lawrence–Venkatesh locus](#spm-6-lawrence-venkatesh-locus); [S-good symplectic pairs](#spm-6-s-good-pair); [The symplectic pairs M^{≤1}(Φ) of Lagrangian filtrations](#spm-5-lagrangian-period-modules); [Period maps of abelian-by-finite families](#spm-5-abelian-by-finite-period-diagram); [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction); `MordellLawrenceVenkatesh:LV.3`.

<a id="spm-6-adelic-locus-in-lv-locus"></a>

### Interpolating pairs are S-good

**Theorem** (`SPM.6/adelic-locus-in-lv-locus`). Let X → Y′ → Y, p and S be as in SPM.6/lawrence-venkatesh-locus (S suitable). If (A, V) interpolates an adelic point (y\_u)\_u ∈ Y(A\_K)^LV\_X (SPM.1/adelic-lv-locus), then (A, V) is S-good. Hence Y(K\_v)^LV\_X ⊆ Y(K\_v)^LV\_{X,S} for every p-adic place v.

**Hypotheses and conventions.**

- S suitable; (A, V) interpolates at every place, which is what gives the global conditions.

**Proof sketch.**

1. At u ∉ S, y\_u ∈ Y(K\_u) extends to an O\_u-point of the smooth proper model (properness), over which the family extends; so Y′\_{y\_u} is finite étale over O\_u and H⁰\_ét(X\_{y\_u}) ≅ A|G\_u is unramified.
2. At u ∉ S, each X\_{y′} over K\_u(y′) has good reduction, so H¹\_ét(X\_{y\_u}) ≅ V|G\_u is unramified with integral Frobenius polynomial whose roots are q\_u-Weil numbers of weight 1 (ArithmeticGaloisRepresentations R01.6/good-reduction-frobenius-polynomial; LV.1/abelian-variety-cohomology-properties).
3. At u | p, H¹\_ét of each abelian fibre is de Rham with Hodge–Tate weights in {0, 1} (R06.5/proper-smooth-rational-de-rham-comparison), so V|G\_u is.
4. Projecting to v gives the inclusion.

**Checks.**

- For the diagonal image of y ∈ Y(K) this gives the S-goodness of H^{≤1}\_ét(X\_{y,K̄}, Q\_p).

**Sources.**

- L. Alexander Betts and Jakob Stix, Lemma 6.4, footnotes 20–21, and proof, p. 44. An adelic point of the adelic locus is interpolated by an S-good pair for any S containing the places above p∞ and of bad reduction, because the local fibre representations are unramified, pure and integral at good places and de Rham with weights 0 and 1 above p.

**Needs.** [The adelic Lawrence–Venkatesh locus](#spm-1-adelic-lv-locus); [S-good symplectic pairs](#spm-6-s-good-pair); [The Lawrence–Venkatesh locus](#spm-6-lawrence-venkatesh-locus); `ArithmeticGaloisRepresentations:R01.6/good-reduction-frobenius-polynomial`; `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`; `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`; `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`.

<a id="spm-6-rational-points-in-lv-locus"></a>

### Rational points lie in the Lawrence–Venkatesh locus

**Theorem** (`SPM.6/rational-points-in-lv-locus`). For every abelian-by-finite family X → Y′ → Y over a smooth projective geometrically connected curve Y/K, every prime p, every place v | p and every suitable S, the image of Y(K) in Y(K\_v) lies in Y(K\_v)^LV\_{X,S}; each y ∈ Y(K) is interpolated by H^{≤1}\_ét(X\_{y,K̄}, Q\_p) with its G\_K-action.

**Hypotheses and conventions.**

- S suitable for the family.

**Proof sketch.**

1. The diagonal point of y lies in Y(A\_K)^LV\_X, interpolated by H^{≤1}\_ét(X\_{y,K̄}, Q\_p) (SPM.1/adelic-lv-locus); apply SPM.6/adelic-locus-in-lv-locus.

**Checks.**

- This is the 'almost tautological' half of the Lawrence–Venkatesh method in obstruction form ((1°) of Betts–Stix Remark 1.3).

**Sources.**

- L. Alexander Betts and Jakob Stix, §6, after Theorem 6.5, p. 44. Rational points lie in the Lawrence–Venkatesh locus of every abelian-by-finite family, interpolated by the cohomology of their own fibre, which is S-good by Lemma 6.4; so Theorem 6.5 reproves the Mordell conjecture.

**Needs.** [The adelic Lawrence–Venkatesh locus](#spm-1-adelic-lv-locus); [Interpolating pairs are S-good](#spm-6-adelic-locus-in-lv-locus).

<a id="spm-6-non-symplectic-locus"></a>

### The non-symplectic Lawrence–Venkatesh locus

**Definition** (`SPM.6/non-symplectic-locus`). In the setting of SPM.6/lawrence-venkatesh-locus, Y(K\_v)^{LV°}\_{X,S} is defined in the same way with 'symplectic' omitted throughout: pairs (A, V) of a commutative algebra and a finite locally free A-module in Q\_p-representations of G\_K satisfying the conditions of SPM.6/s-good-pair, and isomorphisms of algebra–module pairs H^{≤1}\_ét(X\_{y\_v,K̄\_v}) ≅ (A|G\_v, V|G\_v). Then Y(K\_v)^LV\_{X,S} ⊆ Y(K\_v)^{LV°}\_{X,S}. For the Kodaira–Parshin family X\_q of a curve of genus g, the relative dimension is d\_q = (g − 1/2)(q − 1); for a curve of genus 3 over Q the Lawrence–Venkatesh argument for Y(K\_v)^{LV°} needs q ≥ 23 (d\_q ≥ 55), while the symplectic argument of this roadmap works with q = 11 (d\_q = 25) at a place where q = 11 satisfies the conditions of SPM.8/parameter-comparison (with the good-reduction form of its condition (3)).

**Hypotheses and conventions.**

- The comparison of the two values of q uses the conditions of SPM.8/parameter-comparison (Remark 6.23(III)), the value q = 11 with n\_v replaced by 2 at a place of good reduction.

**Proof sketch.**

1. Forgetting the pairing maps S-good pairs to S-good algebra–module pairs and isomorphisms of symplectic pairs to isomorphisms of algebra–module pairs, which gives the inclusion.
2. d\_q = (2g − 1)(q − 1)/2; for g = 3: q = 23 gives 5·11 = 55 and q = 11 gives 5·5 = 25.

**API.**

- `lvLocusNonSymplectic` (data): Y(K\_v)^{LV°}\_{X,S}: interpolation by algebra–module pairs without pairing.
- `lvLocus_subset_nonSymplectic` (other): Y(K\_v)^LV\_{X,S} ⊆ Y(K\_v)^{LV°}\_{X,S}.
- `kodairaParshinRelDim` (data): d\_q(g) = (2g − 1)(q − 1)/2, the relative dimension of the Kodaira–Parshin family.
- `lvLocusNonSymplectic.rationalPoints` (other): Y(K) ⊆ Y(K\_v)^{LV°}\_{X,S}.

**Unit tests.**

- `kodairaParshinRelDim_genus3_q23` (computation): d\_23(3) = 55.
- `kodairaParshinRelDim_genus3_q11` (computation): d\_11(3) = 25.
- `lvLocusNonSymplectic.elliptic` (degenerate): For a polarised family of elliptic curves (Y′ = Y, d = 1) the two loci coincide, taking L = ∧²V and f\_L = ∧²f\_V.
- `lvLocusNonSymplectic.forget` (compatibility): Forgetting pairings is a functor from symplectic pairs to algebra–module pairs that preserves S-goodness and restriction to G\_v.

**Uses.**

- Betts–Stix, Remark 1.4: measures the gain of keeping track of the pairing

**Checks.**

- For a polarised family of elliptic curves (Y′ = Y, d = 1) the two loci coincide (an observation not made in the source): A = Q\_p, and a rank-two V is a symplectic module with L := ∧²V and ω the identity, any symplectic structure on V being isomorphic to this one through ω; an isomorphism f\_V of modules then gives an isomorphism of pairs with f\_L = ∧²f\_V.

**Sources.**

- L. Alexander Betts and Jakob Stix, Remark 1.4, p. 3. Lawrence and Venkatesh constrain the larger locus without the symplectic condition; the symplectic formulation needs smaller families, e.g. q = 11 (relative dimension 25) instead of q ≥ 23 (relative dimension 55) for a genus-3 curve over Q.
- L. Alexander Betts and Jakob Stix, Remark 6.23(III), p. 54. The smallest q satisfying the original conditions is 23 and the smallest for this paper's conditions is 11, for genus 3.

**Needs.** [The Lawrence–Venkatesh locus](#spm-6-lawrence-venkatesh-locus); [S-good symplectic pairs](#spm-6-s-good-pair); `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family`.

<a id="spm-6-fibre-algebra-points"></a>

### The algebra of a fibre and its points

**Lemma** (`SPM.6/fibre-algebra-points`). For an abelian-by-finite family X → Y′ → Y and y\_v ∈ Y(K\_v), H⁰\_ét(X\_{y\_v,K̄\_v}, Q\_p) = H⁰\_ét(Y′\_{y\_v,K̄\_v}, Q\_p) = ∏\_{Y′\_{y\_v}(K̄\_v)} Q\_p is a split Q\_p-algebra, and there is a canonical G\_v-equivariant bijection between its Q\_p-algebra maps ψ to Q\_p and Y′\_{y\_v}(K̄\_v). Such a ψ is a closed point y′\_v of Y′\_{y\_v} with a K\_v-embedding K\_v(y′\_v) → K̄\_v; its stabiliser G\_{w\_ψ} is the Galois group of K\_v(y′\_v), so [G\_v : G\_{w\_ψ}] = [K\_v(y′\_v) : K\_v], and #Σ = dim\_{Q\_p} H⁰\_ét.

**Hypotheses and conventions.**

- Σ is the set of Q\_p-points of the algebra; here the algebra is split, so #Σ equals its dimension, which fails for a non-split algebra such as Q\_{p²} (extraction E1).

**Proof sketch.**

1. X\_{y\_v} → Y′\_{y\_v} has geometrically connected fibres (abelian varieties), so H⁰\_ét(X\_{y\_v,K̄\_v}) = H⁰\_ét(Y′\_{y\_v,K̄\_v}) = functions on the finite set Y′\_{y\_v}(K̄\_v).
2. Algebra maps from a product of copies of Q\_p to Q\_p are the projections; the G\_v-action on the index set is the Galois action on geometric points.
3. The stabiliser of a geometric point over a closed point y′ is the absolute Galois group of its residue field.

**Checks.**

- If Y′\_{y\_v} is a single point with residue field of degree 4 over K\_v, Σ is one G\_v-orbit of size 4.

**Sources.**

- L. Alexander Betts and Jakob Stix, Remark 6.6, p. 46. H⁰ of the fibre is the product of copies of Q\_p indexed by the geometric points of Y′\_{y\_v}, so algebra maps to Q\_p are those points, and the index condition [G\_v : G\_{w\_ψ}] ≥ 4 means the residue field has degree at least 4.

**Needs.** [The symplectic pair of a fibre](#spm-1-fibre-symplectic-pair); `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`.

<a id="spm-6-principal-trichotomy"></a>

### The principal trichotomy

**Theorem** (`SPM.6/principal-trichotomy`). Planet: Principal trichotomy. Let K be a number field, v a self-conjugate place above p (SPM.3/self-conjugate-place) and (A, V) a symplectic pair of continuous Q\_p-representations of G\_K with V of rank 2d > 0 over A, de Rham at the places above p, with Hodge–Tate weights in {0, 1} at v, and unramified and pure of weight 1 outside a finite set. Let Σ = Σ\_A = Hom\_{Q\_p-alg}(A, Q\_p), and for ψ ∈ Σ let G\_ψ ≤ G\_K be its stabiliser, G\_{w\_ψ} = G\_ψ ∩ G\_v, and V\_ψ = Q\_p ⊗\_{A,ψ} V. Then at least one of the following holds: (a) some ψ ∈ Σ has [G\_v : G\_{w\_ψ}] ≥ 4 and V\_ψ is GSp-irreducible as a symplectic representation of G\_ψ; (b) some ψ ∈ Σ has [G\_v : G\_{w\_ψ}] ≥ 4 and V\_ψ has a non-zero isotropic G\_ψ-subrepresentation W with dim F¹D\_dR,w\_ψ(W) ≥ ½ dim\_{Q\_p} W (average Hodge–Tate weight ≥ 1/2 at w\_ψ); (c) the number of ψ ∈ Σ with [G\_v : G\_{w\_ψ}] < 4 is at least #Σ/(d + 1). When A is split (A ≅ Q\_p^n as a Q\_p-algebra, as for every algebra H⁰\_ét of a fibre), #Σ = dim\_{Q\_p}(A) and (c) reads #{ψ : [G\_v : G\_{w\_ψ}] < 4} ≥ dim\_{Q\_p}(A)/(d + 1).

**Hypotheses and conventions.**

- v self-conjugate. Σ consists of the Q\_p-points of A; with dim\_{Q\_p}(A) in place of #Σ, (c) is false for non-reduced or non-split A (extraction E1: A = Q\_p[ε]/(ε³) or A = Q\_{p²} with an elliptic curve give counterexamples).
- GSp-irreducible is in the sense of the LV.1 request (no non-zero stable isotropic subspace).

**Proof sketch.**

1. Reduction: split Σ into G\_K-orbits Σ\_i and put A\_i = ∏\_{ψ∈Σ\_i} Q\_p, V\_i = A\_i ⊗\_A V. (A, V) satisfies (a) or (b) iff some (A\_i, V\_i) does, and if every (A\_i, V\_i) satisfies (c) then so does (A, V), summing over orbits.
2. For one orbit with base point ψ₀ and L = L\_{ψ₀}, V\_i ≅ Ind\_{G\_{ψ₀}}^{G\_K} V\_{ψ₀} over A\_i = Ind Q\_p (SPM.1/symplectic-pair). Suppose (a) and (b) fail; if no G\_v-orbit in Σ\_i has size ≥ 4, (c) holds; otherwise take ψ₀ with [G\_v : G\_{w\_{ψ₀}}] ≥ 4.
3. Failure of (a) gives a non-zero isotropic G\_{ψ₀}-stable W₀ ≤ V\_{ψ₀}; its conjugates σ⁻¹(W₀) ≤ V\_{ψ₀·σ} are isotropic, de Rham with weights in {0, 1}, and failure of (b) gives dim F¹D\_dR(σ⁻¹W₀) ≤ ½(dim W₀ − 1) whenever ψ₀·σ lies in a G\_v-orbit of size ≥ 4.
4. Summing over coset representatives (each place w of L above v occurring [L\_w : K\_v] times) and using the trivial bound dim F¹ ≤ dim W₀ on the small orbits: Σ\_w [L\_w : K\_v] dim F¹D\_dR,w(W₀) ≤ ½(dim W₀ − 1)(#Σ\_i − #Σ\_{i,<4}) + dim W₀ · #Σ\_{i,<4}.
5. SPM.3/average-hodge-tate-weight gives the left side = ½ dim W₀ · #Σ\_i. Rearranging, (dim W₀ + 1)·#Σ\_{i,<4} ≥ #Σ\_i, and dim W₀ ≤ d (isotropic in a 2d-dimensional symplectic space), which is (c) for the orbit.

**Checks.**

- For A = Q\_p (Σ a single point fixed by G\_v), (c) holds since 1 ≥ 1/(d + 1): the trichotomy says nothing for polarised abelian schemes, which is why the abelian-by-finite structure is needed.
- The Lawrence–Venkatesh division of points (their Lemmas 6.1, 6.2 and the proof of Theorem 5.4) corresponds roughly to types (b), (a) and (c) (Betts–Stix Remark 1.9).

**Sources.**

- L. Alexander Betts and Jakob Stix, Proposition 6.7 and proof, pp. 46–47; Proposition 1.8 and Remark 1.9, pp. 5–6. At a self-conjugate place, every pair of an algebra and a symplectic module of the stated kind is of one of three types: an index-≥4 point with GSp-irreducible fibre, an index-≥4 point with an isotropic subrepresentation of average Hodge–Tate weight at least one half, or many points with small orbits; the proof combines the orbit decomposition with Corollary 2.21.
- L. Alexander Betts and Jakob Stix, §6.1, pp. 45–46. Σ\_A is the set of Q\_p-algebra maps A → Q\_p; the reduction to split transitive algebras.

**Needs.** [Symplectic modules and symplectic pairs](#spm-1-symplectic-pair); [Conjugate and self-conjugate places](#spm-3-self-conjugate-place); [Average Hodge–Tate weight at a self-conjugate place](#spm-3-average-hodge-tate-weight); `PadicHodgeTheory:R06.2/plan/admissible-representations`; `MordellLawrenceVenkatesh:LV.1`.

<a id="spm-6-trichotomy-loci"></a>

### Types (a), (b), (c) and their loci

**Definition** (`SPM.6/trichotomy-loci`). Let S be a finite set of places, p a prime and v a place above p. (a) An S-good pair (A, V) of G\_K-representations is of type (a) if some ψ ∈ Σ\_A has [G\_v : G\_{w\_ψ}] ≥ 4 and V\_ψ is GSp-irreducible as a symplectic representation of G\_ψ. (b) A symplectic pair (A, V) of G\_v-representations is of type (b) if some ψ ∈ Σ\_A has [G\_v : G\_{w\_ψ}] ≥ 4 and V\_ψ has a non-zero isotropic G\_{w\_ψ}-subrepresentation of average Hodge–Tate weight ≥ 1/2. (c) For d > 0, an algebra A in G\_v-representations is of type (c) if #{ψ ∈ Σ\_A : [G\_v : G\_{w\_ψ}] < 4} ≥ dim\_{Q\_p}(A)/(d + 1). For an abelian-by-finite family of constant relative dimension d > 0 and suitable S: Y(K\_v)^LV\_{X,S,(a)} is the set of y\_v interpolated by an S-good pair of type (a); Y(K\_v)^LV\_{X,(b)} the set of y\_v with H^{≤1}\_ét(X\_{y\_v,K̄\_v}) of type (b); Y(K\_v)^LV\_{X,(c)} the set of y\_v with H⁰\_ét(X\_{y\_v,K̄\_v}) of type (c). If v is self-conjugate, Y(K\_v)^LV\_{X,S} ⊆ Y(K\_v)^LV\_{X,S,(a)} ∪ Y(K\_v)^LV\_{X,(b)} ∪ Y(K\_v)^LV\_{X,(c)}.

**Hypotheses and conventions.**

- Type (c) is stated with dim\_{Q\_p}(A), as printed; it is evaluated only on algebras H⁰\_ét of fibres, which are split, where it agrees with the corrected trichotomy (extraction E1).
- Type (b) is local: a global G\_ψ-subrepresentation as in the trichotomy restricts to a G\_{w\_ψ}-subrepresentation.

**Proof sketch.**

1. Each type is invariant under isomorphism of pairs (respectively of algebras) and is local at v except (a).
2. Containment: if (A, V) interpolates y\_v, then A ≅ H⁰\_ét(X\_{y\_v}) as algebras is split (SPM.6/fibre-algebra-points), so the trichotomy (SPM.6/principal-trichotomy) applies with #Σ = dim A. Its case (a) is type (a); its case (b) gives, by restriction and transport through the interpolating isomorphism, type (b) for H^{≤1}\_ét(X\_{y\_v}); its case (c) is type (c) for H⁰\_ét(X\_{y\_v}) ≅ A|G\_v.

**API.**

- `SymplecticPair.IsTypeA` (data): Type (a): an index-≥4 point with GSp-irreducible fibre, for S-good global pairs.
- `SymplecticPair.IsTypeB` (data): Type (b): an index-≥4 point with an isotropic local subrepresentation of average Hodge–Tate weight ≥ 1/2.
- `IsTypeC` (data): Type (c): #{ψ : [G\_v : G\_{w\_ψ}] < 4} ≥ dim A/(d + 1); for the split algebra of functions on a finite G\_v-set Σ this is size\_v(Σ) ≥ 1/(d + 1).
- `lvLocusTypeA` (data): Y(K\_v)^LV\_{X,S,(a)}.
- `lvLocusTypeB` (data): Y(K\_v)^LV\_{X,(b)}.
- `lvLocusTypeC` (data): Y(K\_v)^LV\_{X,(c)}.
- `lvLocus_subset_union` (other): At a self-conjugate v, Y(K\_v)^LV\_{X,S} lies in the union of the three loci.
- `Algebra.isTypeC_iff_size` (characterisation): For split A, type (c) is size\_v(Σ\_A) ≥ 1/(d + 1) (SPM.8/small-orbit-proportion).

**Unit tests.**

- `Algebra.IsTypeC.trivial` (degenerate): A = Q\_p with trivial action is of type (c) for every d: one point in an orbit of size 1 ≥ 1/(d + 1).
- `Algebra.IsTypeC.quintic` (computation): For A = H⁰\_ét((Spec L)\_{K̄\_v}, Q\_p) with L/K\_v of degree 5, Σ\_A is one orbit of size 5, so A is not of type (c) for any d.
- `SymplecticPair.IsTypeA.index` (non-example): A pair with A = Q\_p is never of type (a): the unique point has index 1 < 4.
- `SymplecticPair.IsTypeB.weights` (computation): For V\_ψ = H¹\_ét(E\_{K̄}, Q\_p) of an elliptic curve with good ordinary reduction at w\_ψ (rank two, so every line is isotropic), the unramified line is G\_{w\_ψ}-stable of Hodge–Tate weight 0 and gives nothing; type (b) needs a stable line of weight 1, which exists only when the extension of the weight-1 quotient by the unramified line splits, as for curves with complex multiplication split at w\_ψ.

**Uses.**

- Betts–Stix, Propositions 6.9, 6.15 and 6.20: the three loci are handled separately

**Checks.**

- Points of type (a) are handled by Faltings' lemma and dimension counts, type (b) by the general-position lemma, and type (c) by choosing the family (SPM.7, SPM.8).

**Sources.**

- L. Alexander Betts and Jakob Stix, Definition 6.8 and the containment after it, p. 47. The three types of pairs and algebras, the three loci of points interpolated by pairs of type (a), with fibre pairs of type (b), or with fibre algebras of type (c), and the decomposition of the Lawrence–Venkatesh locus at a self-conjugate place.

**Needs.** [The principal trichotomy](#spm-6-principal-trichotomy); [S-good symplectic pairs](#spm-6-s-good-pair); [The Lawrence–Venkatesh locus](#spm-6-lawrence-venkatesh-locus); [The algebra of a fibre and its points](#spm-6-fibre-algebra-points); [The symplectic pair of a fibre](#spm-1-fibre-symplectic-pair).

### Dependencies of SPM.6

Stages used: `ArithmeticGaloisRepresentations:R01.2`, `ArithmeticGaloisRepresentations:R01.6`, `GaloisSectionsPadicPeriodMaps:SPM.1`, `GaloisSectionsPadicPeriodMaps:SPM.2`, `GaloisSectionsPadicPeriodMaps:SPM.3`, `GaloisSectionsPadicPeriodMaps:SPM.5`, `MordellLawrenceVenkatesh:LV.1`, `MordellLawrenceVenkatesh:LV.2`, `MordellLawrenceVenkatesh:LV.3`, `MordellLawrenceVenkatesh:LV.8`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.5`, `WeightsInEtaleCohomology:R34.1`.

## Layer SPM.7: Finiteness for points of types (a) and (b)

**Targets.** The finite sets T\_i of local classes of GSp-irreducible weight-one representations over bounded extensions (Betts–Stix Definition 6.11, Lemma 6.12, by Hermite–Minkowski and the symplectic Faltings lemma). Non-density after Weil restriction for residue degree ≥ 4: Lemma 6.13 (type (a), dimension count d(2d + 1) < [L : K\_v]d(d + 1)/2) and Lemma 6.17 (type (b), through (6.1) and the isotropic four-Lagrangian Sublemma 6.18). Non-density of the type (a) and (b) period loci (Propositions 6.9, 6.15) and finiteness of the type (a) and (b) loci under full monodromy (Corollaries 6.10, 6.16).

<a id="spm-7-type-a-classes"></a>

### The finite sets T\_i of local classes of type (a)

**Definition** (`SPM.7/type-a-classes`). In the setting of SPM.5/period-domain-decomposition, with S suitable, let d\_i := dim X\_{y′\_i} (the relative dimension) and δ := deg(Y′ → Y). T\_i is the set of isomorphism classes of symplectic modules D of rank 2d\_i over the unit object 1 of MF(φ, N, G\_{w\_i}) for which there exist: a finite extension L/K of degree ≤ δ, unramified outside S; a v-adic place w\_i of L with L\_{w\_i} ≅ K\_v(y′\_i) over K\_v; and a GSp-irreducible symplectic representation V of G\_L, de Rham at the places above p and unramified, pure and integral of weight 1 outside the places above S; with D ≅ D\_pH,w\_i(V|G\_{w\_i}) as symplectic filtered discrete (φ, N, G\_{w\_i})-modules. H\_{y′\_i}(L\_{w\_i})\_(a) ⊆ H\_{y′\_i}(L\_{w\_i}) is the set of Lagrangians Φ′\_i with [M¹\_i(Φ′\_i)] ∈ T\_i.

**Hypotheses and conventions.**

- S suitable; L ranges over extensions of degree at most δ inside a fixed algebraic closure.

**Proof sketch.**

1. T\_i is the image of a set of (L, w\_i, V) under D\_pH,w\_i; finiteness is SPM.7/type-a-classes-finite.

**API.**

- `typeAClasses` (data): T\_i ⊆ π₀(symplectic 1-modules of rank 2d\_i in MF(φ, N, G\_{w\_i})).
- `typeALagrangians` (data): H\_{y′\_i}(L\_{w\_i})\_(a) = {Φ′\_i : [M¹\_i(Φ′\_i)] ∈ T\_i}.
- `typeAClasses_finite` (other): T\_i is finite (SPM.7/type-a-classes-finite).
- `typeALagrangians_orbits` (characterisation): H\_{y′\_i}(L\_{w\_i})\_(a) is a finite union of Aut^GSp(H¹\_pst(X\_{y′\_i}))(Q\_p)-orbits (SPM.2/orbit-lemma).

**Unit tests.**

- `typeAClasses.degreeOne` (degenerate): If δ = 1 (Y′ = Y), only L = K occurs, and T\_i is the set of local classes of GSp-irreducible weight-one representations of G\_K unramified outside S.
- `typeAClasses.ellipticCurve` (computation): For a closed point y′\_i of degree one (K\_v(y′\_i) = K\_v), d\_i = 1 and an elliptic curve E/K with good reduction outside S and no CM, D\_pH,w(H¹\_ét(E\_{K̄}, Q\_p)|G\_w) lies in T\_i, with L = K (H¹ of a non-CM elliptic curve is irreducible, hence GSp-irreducible).
- `typeAClasses.reducible_excluded` (non-example): The class D\_pH,w(Q\_p ⊕ Q\_p(−1)) is not produced by this pair, which is not GSp-irreducible (and not pure of weight 1): only GSp-irreducible representations contribute.
- `typeALagrangians.orbitUnion` (characterisation): Each class in T\_i contributes either no Lagrangians, when its underlying unfiltered symplectic module is not that of the fixed fibre, or exactly one automorphism orbit, by the orbit lemma.

**Uses.**

- Betts–Stix, Lemma 6.13: its Lagrangians are not Zariski dense after Weil restriction
- Betts–Stix, Proposition 6.9: a type (a) Lagrangian has a component in some H\_{y′\_i}(L\_{w\_i})\_(a)

**Checks.**

- If [L\_{w\_i} : K\_v] ≥ 4, H\_{y′\_i}(L\_{w\_i})\_(a) is not Zariski dense in Res^{L\_{w\_i}}\_{K\_v} H\_{y′\_i} (SPM.7/type-a-factor-non-density).

**Sources.**

- L. Alexander Betts and Jakob Stix, Definition 6.11, p. 48. For each closed point of Y′\_{y₀}, the set of isomorphism classes of local symplectic modules arising, through D\_pH at a place of residue field K\_v(y′\_i), from GSp-irreducible global symplectic representations over extensions of bounded degree unramified outside S.

**Needs.** [The symplectic pairs M^{≤1}(Φ) of Lagrangian filtrations](#spm-5-lagrangian-period-modules); [Decomposition of the period domain over the fibre of Y′](#spm-5-period-domain-decomposition); [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction); [S-good symplectic pairs](#spm-6-s-good-pair); `MordellLawrenceVenkatesh:LV.1`; `PadicHodgeTheory:R06.3`.

<a id="spm-7-type-a-classes-finite"></a>

### Finiteness of the sets T\_i

**Theorem** (`SPM.7/type-a-classes-finite`). Each set T\_i of SPM.7/type-a-classes is finite.

**Hypotheses and conventions.**

- S finite; δ fixed.

**Proof sketch.**

1. By Hermite–Minkowski there are finitely many L/K of degree ≤ δ unramified outside S (ArithmeticGaloisDuality R02.3/hermite-unramified-outside-finite).
2. For each L, the symplectic Faltings lemma (requested from LV.1) gives finitely many isomorphism classes of GSp-irreducible symplectic representations of G\_L of rank 2d\_i, unramified, pure and integral of weight 1 outside S.
3. Each L has finitely many places w\_i; each triple gives one class D\_pH,w\_i(V|G\_{w\_i}).

**Checks.**

- GSp-irreducibility is what lets Faltings's finiteness apply: LV.1/faltings-finiteness counts semisimple representations only, and nothing bounds the non-semisimple S-good pairs, which is why types (b) and (c) are handled differently.

**Sources.**

- L. Alexander Betts and Jakob Stix, Lemma 6.12, p. 48. T\_i is finite, by Hermite–Minkowski and the symplectic Faltings lemma.

**Needs.** [The finite sets T\_i of local classes of type (a)](#spm-7-type-a-classes); `ArithmeticGaloisDuality:R02.3/hermite-unramified-outside-finite`; `MordellLawrenceVenkatesh:LV.1`.

<a id="spm-7-type-a-factor-non-density"></a>

### Non-density of type (a) Lagrangians after Weil restriction

**Lemma** (`SPM.7/type-a-factor-non-density`). If [L\_{w\_i} : K\_v] ≥ 4, then H\_{y′\_i}(L\_{w\_i})\_(a) is not Zariski dense in Res^{L\_{w\_i}}\_{K\_v} H\_{y′\_i}. It may be dense in H\_{y′\_i} itself; the Weil restriction to K\_v is essential.

**Hypotheses and conventions.**

- [L\_{w\_i} : K\_v] ≥ 4 and d\_i ≥ 1.

**Proof sketch.**

1. By SPM.7/type-a-classes-finite and SPM.2/orbit-lemma, H\_{y′\_i}(L\_{w\_i})\_(a) is a finite union of orbits of Aut^GSp(H¹\_pst(X\_{y′\_i}/Q\_p^nr))(Q\_p), which acts Q\_p-algebraically on Res^{L\_{w\_i}}\_{Q\_p} H\_{y′\_i}.
2. The scalars act trivially, so by SPM.2/automorphism-dimension-bound the orbits lie in a closed Q\_p-subvariety of dimension ≤ d\_i(2d\_i + 1).
3. By the adjunction between base change and Weil restriction, the set then lies in a closed K\_v-subvariety of Res^{L\_{w\_i}}\_{K\_v} H\_{y′\_i} of K\_v-dimension ≤ d\_i(2d\_i + 1).
4. dim\_{K\_v} Res^{L\_{w\_i}}\_{K\_v} H\_{y′\_i} = [L\_{w\_i} : K\_v]·d\_i(d\_i + 1)/2 ≥ 2d\_i² + 2d\_i > d\_i(2d\_i + 1) (LV.3/lagrangian-grassmannian-geometry gives dim H\_{y′\_i} = d\_i(d\_i + 1)/2).

**Checks.**

- For d\_i = 1 and [L\_{w\_i} : K\_v] = 4: the orbits have dimension ≤ 3 while Res H\_{y′\_i} = Res P¹ has dimension 4.
- For [L\_{w\_i} : K\_v] = 3 and d\_i = 1 the count 3 ≤ 3 gives nothing, which is why index ≥ 4 appears.

**Sources.**

- L. Alexander Betts and Jakob Stix, Lemma 6.13, Remark 6.14 and proof, pp. 48–49. For residue degree at least 4, the Lagrangians with type (a) class are not Zariski dense in the Weil restriction of the Lagrangian Grassmannian, by finiteness of T\_i, the orbit lemma and the dimension bound d(2d + 1) against [L : K\_v]·d(d + 1)/2.

**Needs.** [The finite sets T\_i of local classes of type (a)](#spm-7-type-a-classes); [Finiteness of the sets T\_i](#spm-7-type-a-classes-finite); [The orbit lemma for retwisted filtrations](#spm-2-orbit-lemma); [Dimension bounds for automorphism groups](#spm-2-automorphism-dimension-bound); `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian-geometry`.

<a id="spm-7-type-a-period-non-density"></a>

### Non-density of the type (a) period locus

**Theorem** (`SPM.7/type-a-period-non-density`). Planet: Non-density for type (a). For y₀ ∈ Y(K\_v), let H\_{y₀}(K\_v)^LV\_{X,S,(a)} be the set of Lagrangians Φ ∈ H\_{y₀}(K\_v) for which some S-good pair (A, V) of type (a) satisfies M^{≤1}(Φ) ≅ (D\_pH(A|G\_v), D\_pH(V|G\_v)) as symplectic pairs in MF(φ, N, G\_v). Then H\_{y₀}(K\_v)^LV\_{X,S,(a)} is not Zariski dense in H\_{y₀}.

**Hypotheses and conventions.**

- S suitable; any abelian-by-finite family (no monodromy hypothesis here).

**Proof sketch.**

1. Given Φ in the set with its pair (A, V) and point ψ of type (a): the algebra part of the isomorphism is D\_pH of an isomorphism H⁰\_ét(X\_{y₀}) ≅ A|G\_v (full faithfulness, requested from R06.3), so ψ corresponds to a geometric K̄\_v-point of Y′\_{y₀}, i.e. a closed point y′\_i together with a K\_v-embedding of its residue field into K̄\_v; after moving ψ in its G\_v-orbit, the fixed embedding of L\_{w\_i}.
2. Then [L\_{w\_i} : K\_v] = [G\_v : G\_{w\_ψ}] ≥ 4 and D\_pH,w\_ψ(V\_ψ|G\_{w\_ψ}) ≅ M¹\_i(Φ′\_i) by SPM.5/period-domain-decomposition, and (L\_ψ, w\_ψ, V\_ψ) witnesses [M¹\_i(Φ′\_i)] ∈ T\_i; so Φ′\_i ∈ H\_{y′\_i}(L\_{w\_i})\_(a).
3. So the set lies in ⋃\_{i: [L\_{w\_i}:K\_v] ≥ 4} (pr\_i)⁻¹(closure of H\_{y′\_i}(L\_{w\_i})\_(a)), a finite union of proper closed subsets by SPM.7/type-a-factor-non-density and the product decomposition (4.3).

**Checks.**

- If every closed point of Y′\_{y₀} has residue degree < 4 over K\_v, the set is empty: type (a) needs an index-≥4 point.

**Sources.**

- L. Alexander Betts and Jakob Stix, Proposition 6.9 and proof, pp. 48–49. The type (a) part of the period-domain locus is not Zariski dense: each of its points has a factor with residue degree at least 4 lying in the type (a) Lagrangians of that factor.

**Needs.** [The finite sets T\_i of local classes of type (a)](#spm-7-type-a-classes); [Non-density of type (a) Lagrangians after Weil restriction](#spm-7-type-a-factor-non-density); [Decomposition of the period domain over the fibre of Y′](#spm-5-period-domain-decomposition); [The symplectic pairs M^{≤1}(Φ) of Lagrangian filtrations](#spm-5-lagrangian-period-modules); [Types (a), (b), (c) and their loci](#spm-6-trichotomy-loci); `PadicHodgeTheory:R06.3`.

<a id="spm-7-type-a-locus-finite"></a>

### Finiteness of the type (a) locus under full monodromy

**Theorem** (`SPM.7/type-a-locus-finite`). If X → Y′ → Y has full monodromy (LV.3/algebraic-monodromy-group, for some complex embedding of K\_v), then Y(K\_v)^LV\_{X,S,(a)} is finite.

**Hypotheses and conventions.**

- Y a smooth projective geometrically connected curve; S suitable.

**Proof sketch.**

1. For y₀ ∈ Y(K\_v) choose a closed disc U\_{y₀} on which H⁰\_dR and H¹\_dR have full horizontal bases. By SPM.5/abelian-by-finite-period-diagram, Φ\_{y₀} maps Y(K\_v)^LV\_{X,S,(a)} ∩ U\_{y₀}(K\_v) into H\_{y₀}(K\_v)^LV\_{X,S,(a)}, which is not Zariski dense (SPM.7/type-a-period-non-density).
2. Under full monodromy the model-free Corollary 5.10 (requested from LV.3) makes this intersection finite.
3. Cover the compact Y(K\_v) by finitely many such discs (Y proper).

**Checks.**

- Applies to the Kodaira–Parshin families, which have full monodromy (LV.10/kodaira-parshin-full-monodromy).

**Sources.**

- L. Alexander Betts and Jakob Stix, Corollary 6.10 and proof, p. 48. With full monodromy the type (a) locus is finite, by Proposition 4.11, Corollary 5.10 and compactness.

**Needs.** [Non-density of the type (a) period locus](#spm-7-type-a-period-non-density); [Period maps of abelian-by-finite families](#spm-5-abelian-by-finite-period-diagram); [The Lawrence–Venkatesh locus in the period domain](#spm-6-period-domain-lv-locus); `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`; `MordellLawrenceVenkatesh:LV.3`.

<a id="spm-7-type-b-factor-non-density"></a>

### Non-density of type (b) Lagrangians after Weil restriction

**Lemma** (`SPM.7/type-b-factor-non-density`). If [L\_{w\_i} : K\_v] ≥ 4, then the set H\_{y′\_i}(L\_{w\_i})\_(b) of Lagrangian L\_{w\_i}-subspaces Φ′\_i of H¹\_dR(X\_{y′\_i}/L\_{w\_i}) for which M¹\_i(Φ′\_i) has a non-zero isotropic filtered (φ, N, G\_{w\_i})-submodule D with dim\_{L\_{w\_i}} F¹D\_dR ≥ ½ dim\_{Q\_p^nr} D\_pst is not Zariski dense in Res^{L\_{w\_i}}\_{K\_v} H\_{y′\_i}.

**Hypotheses and conventions.**

- [L\_{w\_i} : K\_v] = r ≥ 4. The submodule D is a sub-object in MF(φ, N, G\_{w\_i}): its D\_pst is φ-stable.

**Proof sketch.**

1. Work over K̄\_v. Enumerate the K\_v-embeddings ι₁, …, ι\_r of L\_{w\_i}, choose σ\_j ∈ G\_v with ι\_j = σ\_j ∘ ι₁ acting on Q\_p^nr as φ^{m\_j}; the composite of σ\_j⁻¹ ⊗ 1, (c\_dR ∘ c\_BO)⁻¹ and σ\_j ⊗ φ^{m\_j} gives (6.1): K̄\_v ⊗\_{K\_v} H¹\_dR(X\_{y′\_i}/L\_{w\_i}) ≅ (K̄\_v ⊗\_{Q\_p^nr} H¹\_pst)^r as symplectic modules over K̄\_v^r, so (Res^{L\_{w\_i}}\_{K\_v} H\_{y′\_i})\_{K̄\_v} ≅ LGrass(K̄\_v ⊗ H¹\_pst)^r.
2. Under (6.1), K̄\_v ⊗ Φ′\_i becomes an r-tuple (Φ′\_{ij})\_j with Φ′\_{ij} = (σ\_j ⊗ φ^{m\_j})(Φ′\_{i1}) for all j (the printed text says 'for all i', this packet's E7).
3. If D witnesses Φ′\_i ∈ H\_{y′\_i}(L\_{w\_i})\_(b), then W := K̄\_v ⊗ D\_pst is isotropic with dim(W ∩ Φ′\_{i1}) ≥ ½ dim W; since D\_pst is φ-stable and σ\_j ⊗ φ^{m\_j} preserves W, the same holds for every j.
4. The isotropic general-position lemma for r ≥ 4 Lagrangians (requested from LV.7) puts these tuples in a proper Zariski-closed subset.

**Checks.**

- The atlas node for the Lawrence–Venkatesh version, LV.7/frobenius-stable-lagrangian-avoidance (their Lemma 6.3), is stated for a cyclic extension of degree ≥ 5 with a semilinear Frobenius; Betts–Stix Remark 6.19 notes that Lawrence–Venkatesh need r ≥ 5 but no isotropy, while here r ≥ 4 suffices because W is isotropic.

**Sources.**

- L. Alexander Betts and Jakob Stix, Lemma 6.17, (6.1) and proof, pp. 50–51. For residue degree at least 4 the Lagrangians admitting an isotropic sub-object of average Hodge–Tate weight at least one half are not Zariski dense in the Weil restriction: over K̄\_v the Weil restriction is a product of copies of the Lagrangian Grassmannian of H¹\_pst, the sub-object gives a common isotropic subspace, and Sublemma 6.18 applies.
- L. Alexander Betts and Jakob Stix, Sublemma 6.18 and Remark 6.19, p. 51. Four Lagrangians in general position admit no non-zero isotropic subspace meeting each in at least half its dimension; Lawrence–Venkatesh need five but no isotropy.

**Needs.** [The symplectic pairs M^{≤1}(Φ) of Lagrangian filtrations](#spm-5-lagrangian-period-modules); [Decomposition of the period domain over the fibre of Y′](#spm-5-period-domain-decomposition); [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction); `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian`; `MordellLawrenceVenkatesh:LV.7/frobenius-stable-lagrangian-avoidance`; `MordellLawrenceVenkatesh:LV.7`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`.

<a id="spm-7-type-b-period-non-density"></a>

### Non-density of the type (b) period locus

**Theorem** (`SPM.7/type-b-period-non-density`). Planet: Non-density for type (b). For y₀ ∈ Y(K\_v), let H\_{y₀}(K\_v)^LV\_{X,(b)} be the set of Φ ∈ H\_{y₀}(K\_v) with M^{≤1}(Φ) ≅ (D\_pH(A), D\_pH(V)) for some symplectic pair (A, V) of de Rham G\_v-representations of type (b). Then H\_{y₀}(K\_v)^LV\_{X,(b)} is not Zariski dense in H\_{y₀}.

**Hypotheses and conventions.**

- The printed definition of H\_{y₀}(K\_v)^LV\_{X,(b)} and the display (∗) in the proof of Proposition 6.15 write M¹(Φ) for the pair M^{≤1}(Φ) (extraction E5); the corrected statement is used.

**Proof sketch.**

1. Given Φ with its pair (A, V) of type (b) and point ψ: as in SPM.7/type-a-period-non-density, ψ corresponds to a closed point y′\_i with the fixed embedding, [L\_{w\_i} : K\_v] ≥ 4, and D\_pH,w\_ψ(V\_ψ|G\_{w\_ψ}) ≅ M¹\_i(Φ′\_i).
2. D\_pH,w\_ψ of the isotropic subrepresentation W of average Hodge–Tate weight ≥ 1/2 is an isotropic sub-object D of M¹\_i(Φ′\_i) with dim F¹D\_dR ≥ ½ dim D\_pst; so Φ′\_i ∈ H\_{y′\_i}(L\_{w\_i})\_(b).
3. Conclude with SPM.7/type-b-factor-non-density and (4.3).

**Checks.**

- No global input is used: type (b) is a condition on local representations, and the argument is explicit linear algebra.

**Sources.**

- L. Alexander Betts and Jakob Stix, §6.3, Proposition 6.15 and proof, pp. 49–52. The type (b) part of the period-domain locus is not Zariski dense: each point has a factor of residue degree at least 4 in the type (b) Lagrangians, by Lemma 6.17.

**Needs.** [Non-density of type (b) Lagrangians after Weil restriction](#spm-7-type-b-factor-non-density); [Decomposition of the period domain over the fibre of Y′](#spm-5-period-domain-decomposition); [The symplectic pairs M^{≤1}(Φ) of Lagrangian filtrations](#spm-5-lagrangian-period-modules); [Types (a), (b), (c) and their loci](#spm-6-trichotomy-loci); `PadicHodgeTheory:R06.3`.

<a id="spm-7-type-b-locus-finite"></a>

### Finiteness of the type (b) locus under full monodromy

**Theorem** (`SPM.7/type-b-locus-finite`). If X → Y′ → Y has full monodromy, then Y(K\_v)^LV\_{X,(b)} is finite.

**Hypotheses and conventions.**

- Y a smooth projective geometrically connected curve.

**Proof sketch.**

1. As in SPM.7/type-a-locus-finite, with SPM.7/type-b-period-non-density in place of the type (a) statement.

**Checks.**

- Applies to the Kodaira–Parshin families.

**Sources.**

- L. Alexander Betts and Jakob Stix, Corollary 6.16, p. 50. With full monodromy the type (b) locus is finite.

**Needs.** [Non-density of the type (b) period locus](#spm-7-type-b-period-non-density); [Period maps of abelian-by-finite families](#spm-5-abelian-by-finite-period-diagram); [The Lawrence–Venkatesh locus in the period domain](#spm-6-period-domain-lv-locus); `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`; `MordellLawrenceVenkatesh:LV.3`.

### Dependencies of SPM.7

Stages used: `AbelianSchemesAndArithmeticModuli:A6`, `ArithmeticGaloisDuality:R02.3`, `GaloisSectionsPadicPeriodMaps:SPM.2`, `GaloisSectionsPadicPeriodMaps:SPM.5`, `GaloisSectionsPadicPeriodMaps:SPM.6`, `MordellLawrenceVenkatesh:LV.1`, `MordellLawrenceVenkatesh:LV.3`, `MordellLawrenceVenkatesh:LV.7`, `PadicHodgeTheory:R06.3`.

## Layer SPM.8: Kodaira–Parshin families and points of type (c)

**Targets.** The proportion size\_v of points in G\_v-orbits of size < 4 and its monotonicity. The count n\_v of quadratic and cubic extensions of K\_v, finite, and equal to 7 for v ∤ 6 (Betts–Stix Remark 6.21). Isotropy of the fixed classes of index-2 and index-3 subgroups on H¹\_ét(Y\_{K̄\_v}, Z/k) and the bound n\_v k^g. Proposition 6.20: for q − 1 not divisible by 4 or by any odd prime factor of q\_v(q\_v + 1)(q\_v³ − 1) and q − 1 ≥ 9n\_v, the Kodaira–Parshin family X\_q has no points of type (c). Corollary 6.22 (choice of q by Dirichlet). Remark 6.23 comparing the pairs (v, q) covered here and by Lawrence–Venkatesh, with (I) corrected (extraction E6).

<a id="spm-8-small-orbit-proportion"></a>

### The proportion of points in small G\_v-orbits

**Definition** (`SPM.8/small-orbit-proportion`). Let K\_v be a finite extension of Q\_p and Σ a non-empty finite set with a continuous action of G\_v. Then size\_v(Σ) := #{x ∈ Σ : the G\_v-orbit of x has fewer than 4 elements}/#Σ ∈ [0, 1]. If f: Σ → Σ′ is G\_v-equivariant and all its fibres have the same cardinality, then size\_v(Σ) ≤ size\_v(Σ′). For a split algebra A in G\_v-representations and d > 0, A is of type (c) (SPM.6/trichotomy-loci) exactly when size\_v(Σ\_A) ≥ 1/(d + 1).

**Hypotheses and conventions.**

- The threshold 4 replaces the threshold 8 of Lawrence–Venkatesh Definition 5.2 (Betts–Stix footnote 22); the atlas node LV.7/size-v states the Lawrence–Venkatesh version for unramified sets and Frobenius orbits, while here Σ is any finite continuous G\_v-set.

**Proof sketch.**

1. The orbit of f(x) has at most as many elements as the orbit of x, so f maps small-orbit points to small-orbit points; with fibres of size c, #small(Σ) ≤ c·#small(Σ′) and #Σ = c·#Σ′.
2. For split A, Σ\_A has dim A elements and index [G\_v : G\_{w\_ψ}] is the orbit size of ψ.

**API.**

- `smallOrbitProportion` (data): size\_v(Σ) = #{x : #(G\_v·x) < 4}/#Σ.
- `smallOrbitProportion_le_one` (other): 0 ≤ size\_v(Σ) ≤ 1.
- `smallOrbitProportion_le_of_equalFibres` (functoriality): size\_v(Σ) ≤ size\_v(Σ′) for an equivariant map with fibres of equal size.
- `isTypeC_iff_smallOrbitProportion` (characterisation): For split A, type (c) iff size\_v(Σ\_A) ≥ 1/(d + 1).
- `smallOrbitProportion_disjointUnion` (relation): size\_v of a disjoint union is the weighted average of the sizes.

**Unit tests.**

- `smallOrbitProportion.trivial` (degenerate): For a trivial action, size\_v(Σ) = 1.
- `smallOrbitProportion.quintic` (computation): For Σ = Hom\_{K\_v}(L, K̄\_v) with [L : K\_v] = 5, size\_v(Σ) = 0.
- `smallOrbitProportion.cubicPlusQuartic` (computation): For Σ = Hom\_{K\_v}(L₃, K̄\_v) ⊔ Hom\_{K\_v}(L₄, K̄\_v) with [L₃ : K\_v] = 3, [L₄ : K\_v] = 4, size\_v(Σ) = 3/7.
- `smallOrbitProportion.unequal_fibres` (non-example): The monotonicity needs equal fibres: for Σ a set of four fixed points mapping to the fixed point of Σ′ = {a fixed point} ⊔ {an orbit of size 4}, size\_v(Σ) = 1 > size\_v(Σ′) = 1/5, the fibres having sizes 4, 0, 0, 0, 0.

**Uses.**

- Betts–Stix, Proposition 6.20: the Kodaira–Parshin fibres have size\_v < 1/(d\_q + 1), so no fibre algebra is of type (c)

**Checks.**

- size\_v of a G\_v-set on which G\_v acts trivially is 1; of Hom\_{K\_v}(L, K̄\_v) for [L : K\_v] ≥ 4 is 0.

**Sources.**

- L. Alexander Betts and Jakob Stix, Proof of Proposition 6.20 and footnote 22, p. 52. size\_v(Σ) is the proportion of points of a finite G\_v-set lying in orbits of size less than 4, as in Lawrence–Venkatesh Definition 5.2 with 4 in place of 8, and it does not increase along equivariant maps with equal fibres.

**Needs.** `MulAction.orbit`; `MordellLawrenceVenkatesh:LV.7/size-v`; [Types (a), (b), (c) and their loci](#spm-6-trichotomy-loci).

<a id="spm-8-small-extension-count"></a>

### Counting the quadratic and cubic extensions of a local field

**Lemma** (`SPM.8/small-extension-count`). For a finite extension K\_v of Q\_p let n\_v be the number of subfields L ⊆ K̄\_v with [L : K\_v] ∈ {2, 3}. Then n\_v is finite and bounded in terms of [K\_v : Q\_p] (so, for places of a number field K, in terms of K). If v ∤ 6 then n\_v = 7: K\_v has three quadratic extensions; if q\_v ≡ 1 mod 3 it has four cubic extensions, all Galois, and if q\_v ≡ 2 mod 3 it has one Galois cubic extension and three conjugate non-Galois ones.

**Hypotheses and conventions.**

- The count is of subfields of a fixed algebraic closure; conjugate non-Galois extensions are counted separately.

**Proof sketch.**

1. Subfields of degree n correspond to open subgroups of index n of G\_v. LocalGaloisGroups Layer 7, isTopologicallyFinitelyGenerated\_absoluteGaloisGroup and rank\_absoluteGaloisGroup, provide [K\_v : Q\_p] + 2 topological generators of the full G\_v. A continuous map to S\_n is determined by their images, so there are at most (n!)^{[K\_v:Q\_p]+2} such maps and finitely many index-n subgroups. This proves the claimed uniform bound for n = 2,3; the maximal pro-p quotient would not suffice.
2. For p ≥ 5 an open subgroup of index 2 or 3 contains the pro-p wild inertia, so it comes from the tame quotient ⟨σ, τ | στσ⁻¹ = τ^{q\_v}⟩ (Tau Ceti LocalFieldsRamification Layer 4).
3. Index 2: the abelianised tame group is Ẑ × Z/(q\_v − 1) with q\_v − 1 even, so Hom(−, Z/2) has four elements: three quadratic extensions.
4. Index 3, normal: Hom(Ẑ × Z/(q\_v − 1), Z/3) has 9 elements if 3 | q\_v − 1 and 3 otherwise, giving 4 or 1 cyclic cubic extensions.
5. Index 3, not normal: a transitive non-abelian image is S₃ with τ a 3-cycle and σ a transposition, which needs τ^{q\_v} = τ⁻¹, i.e. q\_v ≡ 2 mod 3; then the three point stabilisers give three conjugate cubic fields. Total 3 + 4 = 7 in both cases.

**Checks.**

- For K\_v = Q\_5 (q\_v = 5 ≡ 2 mod 3): Q\_5(√2), Q\_5(√5), Q\_5(√10), the unramified cubic and the three fields Q\_5(ζ\_3^j 5^{1/3}).

**Sources.**

- L. Alexander Betts and Jakob Stix, Remark 6.21, p. 53. n\_v is bounded in terms of K, and equals 7 when v does not divide 6: three quadratic extensions and four cubic ones, all Galois when q\_v ≡ 1 mod 3, one Galois and three conjugate non-Galois otherwise.

**Needs.** `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`; `IntermediateField`.

<a id="spm-8-small-orbit-isotropic-count"></a>

### Few torsion classes lie in small G\_v-orbits

**Lemma** (`SPM.8/small-orbit-isotropic-count`). Let Y be a smooth projective geometrically connected curve of genus g over a finite extension K\_v of Q\_p, and k ≥ 1 an odd integer prime to p with gcd(k, q\_v^i − 1) = 1 for i = 1, 2, 3. Let M := H¹\_ét(Y\_{K̄\_v}, Z/k) ≅ (Z/k)^{2g} with its G\_v-equivariant perfect alternating Weil pairing M × M → μ\_k^∨. For every open G\_w ≤ G\_v of index 2 or 3, M^{G\_w} is isotropic, so #M^{G\_w} ≤ k^g; hence at most n\_v·k^g elements of M lie in G\_v-orbits of size less than 4.

**Hypotheses and conventions.**

- p ∤ k, so μ\_k is unramified at v and an element of G\_v acts on it through its image in the Galois group of the residue field.
- No reduction hypothesis on Y at v (contrast LV.11/weil-pairing-frobenius, which uses good reduction).

**Proof sketch.**

1. The image of G\_w in the unramified quotient Gal(k̄\_v/k\_v) ≅ Ẑ is iẐ with i ∈ {1, 2, 3}; choose T ∈ G\_w acting on k̄\_v as the i-th power of arithmetic Frobenius. T acts on μ\_k by ζ ↦ ζ^{q\_v^i} and on μ\_k^∨ by q\_v^{−i}.
2. For m₁, m₂ ∈ M^{G\_w}: ⟨m₁, m₂⟩ = ⟨Tm₁, Tm₂⟩ = q\_v^{−i}⟨m₁, m₂⟩, so (q\_v^i − 1)⟨m₁, m₂⟩ = 0, and gcd(k, q\_v^i − 1) = 1 forces ⟨m₁, m₂⟩ = 0.
3. An isotropic subgroup B of a finite group with a perfect pairing satisfies |B|² ≤ |M| (LV.0/isotropic-subgroup-card), so #M^{G\_w} ≤ k^g.
4. An element in an orbit of size 1, 2 or 3 is fixed by an open subgroup of index 2 or 3 (a G\_v-fixed element is fixed by the unramified index-2 subgroup); there are n\_v such subgroups (SPM.8/small-extension-count).

**Checks.**

- For g = 2, k = 5 and q\_v = 7 (gcd(5, 6) = gcd(5, 48) = gcd(5, 342) = 1, and n\_v = 7 since v ∤ 6): at most 7·25 = 175 of the 625 elements of M lie in small orbits.

**Sources.**

- L. Alexander Betts and Jakob Stix, Proof of Proposition 6.20, p. 53. The G\_w-fixed classes for G\_w of index 2 or 3 are isotropic for the Weil pairing because the cyclotomic action of an element acting as a power of Frobenius is multiplication by q\_v^{−i}, prime to k; so each has at most k^g elements and at most n\_v k^g classes lie in small orbits.

**Needs.** [Counting the quadratic and cubic extensions of a local field](#spm-8-small-extension-count); `MordellLawrenceVenkatesh:LV.0/isotropic-subgroup-card`; `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`; `MulAction.orbit`.

<a id="spm-8-type-c-empty"></a>

### Kodaira–Parshin families have no points of type (c)

**Theorem** (`SPM.8/type-c-empty`). Planet: Kodaira–Parshin families avoid type (c). Let Y be a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K, v a finite place above p, and X\_q → Y′\_q → Y the Kodaira–Parshin family with parameter an odd prime q (LV.8/kodaira-parshin-family), of relative dimension d\_q = (g − 1/2)(q − 1). Suppose (1) q − 1 is divisible neither by 4 nor by any odd prime dividing q\_v(q\_v + 1)(q\_v³ − 1), and (2) q − 1 ≥ 9n\_v. Then Y(K\_v)^LV\_{X\_q,(c)} = ∅; equivalently size\_v(Y′\_{q,y}(K̄\_v)) < 1/(d\_q + 1) for every y ∈ Y(K\_v).

**Hypotheses and conventions.**

- The odd primes dividing q\_v(q\_v + 1)(q\_v³ − 1) are those dividing q\_v·∏\_{i≤3}(q\_v^i − 1); in particular 3 always divides it, so condition (1) excludes 3 | q − 1.
- Put k = (q − 1)/2; condition (1) makes k odd, prime to p, and coprime to q\_v^i − 1 for i ≤ 3.

**Proof sketch.**

1. Y′\_{q,y}(K̄\_v) ≅ Surj^{out,\*}(π₁^ét(Y\_{K̄\_v} ∖ {y}), Aff(q)) G\_v-equivariantly (requested from LV.8 for K\_v-points).
2. Composing with Aff(q) → F\_q^× → Z/k gives G\_v-equivariant maps Surj^{out,\*} → Surj(π₁^ét(Y\_{K̄\_v}), F\_q^×) → Surj(π₁^ét(Y\_{K̄\_v}), Z/k) with fibres of constant size (LV.0/commutator-product-map with the free conjugation action, LV.0/affine-group-centralizer; the second map is the projection Z/2 × Z/k → Z/k); by SPM.8/small-orbit-proportion it suffices that size\_v(Surj(π₁, Z/k)) < 1/(d\_q + 1).
3. #Surj(π₁^ét(Y\_{K̄\_v}), Z/k) = k^{2g}∏\_{r | k}(1 − r^{−2g}) > k^{2g}/ζ(2g) (LV.0/generating-tuples-card), and at most n\_v k^g elements of Hom = M lie in small orbits (SPM.8/small-orbit-isotropic-count).
4. So size\_v < ζ(2g)n\_v/k^g < 9n\_v/(8k^g) ≤ 1/(4k^{g−1}) < 1/((2g − 1)k + 1) = 1/(d\_q + 1), using ζ(2g) ≤ ζ(4) = π⁴/90 < 9/8, k ≥ 9n\_v/2 from (2), and 4k^{g−1} > (2g − 1)k + 1 for g ≥ 2, k ≥ 2.

**Checks.**

- For g = 2 and v ∤ 6 (n\_v = 7), condition (2) asks q − 1 ≥ 63.
- The proof never uses good reduction of Y or of the family at v, nor that v is unramified over Q.

**Sources.**

- L. Alexander Betts and Jakob Stix, §6.4, Proposition 6.20 and proof, footnotes 22–24, pp. 52–53. For q − 1 not divisible by 4 or by any odd prime factor of q\_v(q\_v + 1)(q\_v³ − 1) and at least 9n\_v, no fibre algebra of the Kodaira–Parshin family is of type (c): the fibres map with equal fibres to surjections onto Z/k, of which too few lie in small orbits because fixed classes are isotropic for the Weil pairing.

**Needs.** `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family`; `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map`; `MordellLawrenceVenkatesh:LV.8/singly-ramified-surjections`; `MordellLawrenceVenkatesh:LV.0/commutator-product-map`; `MordellLawrenceVenkatesh:LV.0/affine-group-centralizer`; `MordellLawrenceVenkatesh:LV.0/generating-tuples-card`; [The proportion of points in small G\_v-orbits](#spm-8-small-orbit-proportion); [Few torsion classes lie in small G\_v-orbits](#spm-8-small-orbit-isotropic-count); [Counting the quadratic and cubic extensions of a local field](#spm-8-small-extension-count); [Types (a), (b), (c) and their loci](#spm-6-trichotomy-loci); [The algebra of a fibre and its points](#spm-6-fibre-algebra-points); `MordellLawrenceVenkatesh:LV.8`; `hasSum_zeta_four`.

<a id="spm-8-kodaira-parshin-choice"></a>

### Choosing the Kodaira–Parshin parameter

**Theorem** (`SPM.8/kodaira-parshin-choice`). Planet: Choice of the Kodaira–Parshin parameter. For every finite place v of K there is an odd prime q satisfying the conditions of SPM.8/type-c-empty; for such q the Kodaira–Parshin family X\_q → Y′\_q → Y has constant positive relative dimension, full monodromy, and Y(K\_v)^LV\_{X\_q,(c)} = ∅.

**Hypotheses and conventions.**

- v any finite place of K; the choice of q depends on v through q\_v and n\_v.

**Proof sketch.**

1. Let m be 4 times the product of the odd primes dividing q\_v(q\_v + 1)(q\_v³ − 1). By the Chinese remainder theorem choose a ≡ 3 mod 4 and a ≡ 2 mod r for each such odd r; a is a unit mod m.
2. Dirichlet's theorem (Mathlib Nat.forall\_exists\_prime\_gt\_and\_eq\_mod) gives a prime q ≡ a mod m with q > 9n\_v + 1; then q − 1 ≡ 2 mod 4 and q − 1 ≡ 1 mod r for every odd r | q\_v(q\_v + 1)(q\_v³ − 1).
3. Full monodromy is LV.10/kodaira-parshin-full-monodromy, positivity of d\_q = (g − 1/2)(q − 1) is clear, and type (c) is excluded by SPM.8/type-c-empty.

**Checks.**

- For q\_v = 2 the odd primes of q\_v(q\_v + 1)(q\_v³ − 1) = 42 are 3 and 7, so q = 11 satisfies condition (1) of SPM.8/type-c-empty (10 is divisible by neither 4, 3 nor 7); condition (2) then needs q − 1 ≥ 9n\_v, which at a place above 2 requires a larger q.

**Sources.**

- L. Alexander Betts and Jakob Stix, Corollary 6.22 and proof, p. 53. Dirichlet's theorem gives an odd prime q satisfying the conditions of Proposition 6.20, and the Kodaira–Parshin family with that parameter has full monodromy and no points of type (c).

**Needs.** [Kodaira–Parshin families have no points of type (c)](#spm-8-type-c-empty); `MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy`; [Counting the quadratic and cubic extensions of a local field](#spm-8-small-extension-count); `Nat.forall_exists_prime_gt_and_eq_mod`.

<a id="spm-8-parameter-comparison"></a>

### Which pairs (v, q) the argument covers

**Application** (`SPM.8/parameter-comparison`). Let Y have genus g ≥ 2. The argument of this roadmap proves Y(K\_v)^LV\_{X\_q,S} finite whenever (1) v is self-conjugate, (2) q − 1 is divisible neither by 4 nor by any odd prime dividing q\_v·∏\_{i≤3}(q\_v^i − 1), and (3) n\_v·ζ(2g)·2^g/(q − 1)^g < 1/((g − 1/2)(q − 1) + 1), where n\_v may be replaced by 2 when Y has good reduction at v (then M is unramified and only the two unramified subgroups of index 2 and 3 matter). The original argument of Lawrence–Venkatesh needs (1°) v friendly and v ∤ 2, (2°) the analogue of (2) with i ≤ 7, (3°) the analogue of (3) with 4 in place of n\_v, and (4°) a good model of the Kodaira–Parshin family over O\_v. (I) When K has no CM subfield, for 100% of places (natural density) some q satisfies (1°)–(4°); (II) (1°)–(4°) fail for every q at places ramified over Q, at places above 2 and at places of bad reduction of Y; (III) for g = 3 the least q satisfying (1°)–(4°) at some place is 23, while (1)–(3), with the good-reduction form of (3), allow q = 11.

**Hypotheses and conventions.**

- (I) requires choosing the auxiliary prime r₀ larger than every prime ramified in the Galois closure K′ of K, not only larger than the odd primes dividing [K′ : Q] (extraction E6): otherwise K′ ∩ Q(ζ\_{q−1}) can be a non-trivial abelian field ramified only at primes r | q − 1 with r ≥ r₀ (the red-team finding RT-PAPER-BETTS-STIX-25/7 notes that it need not be quadratic).

**Proof sketch.**

1. Collect the hypotheses of SPM.8/type-c-empty, SPM.7 and SPM.6/principal-trichotomy; in (3), ζ(2g)n\_v·2^g/(q − 1)^g = ζ(2g)n\_v/k^g with k = (q − 1)/2.
2. (III): (2°) excludes q − 1 divisible by 3, 5 or 7 for every q\_v (Fermat), and q − 1 must not be divisible by 4: q = 5, 13, 17 fail by 4 | q − 1, q = 7, 11, 19 by 3 or 5 | q − 1, and q = 3 fails (3°); so q = 23 is the least; for (2) at q\_v = 2 the excluded odd primes are 3 and 7, and q = 11 satisfies (2) and the good-reduction form of (3): 2·ζ(6)·8/1000 < 1/26.
3. (I): choose q ≡ 3 mod 4 and q ≡ 2 modulo every odd prime < r₀ (Linnik bounds log q = O(r₀)), with r₀ ≥ 100 and r₀ exceeding the primes ramified in K′; then K′ and Q(ζ\_{q−1}) are linearly disjoint, q\_v is equidistributed modulo q − 1 (Chebotarev), and the proportion of v satisfying (2°) tends to 1 as r₀ → ∞.

**Checks.**

- For g = 3 and q = 11: d\_q = 25; for q = 23: d\_q = 55 (SPM.6/non-symplectic-locus).

**Sources.**

- L. Alexander Betts and Jakob Stix, Remark 6.23 (I)–(III), pp. 53–54. Comparison of the conditions on (v, q) needed here and in Lawrence–Venkatesh: self-conjugacy, a divisibility condition with i ≤ 3, and a size inequality with n\_v, against friendliness, i ≤ 7, the constant 4 and a good model; the density statement, the places never covered by the original argument, and the genus-3 values 23 and 11.
- L. Alexander Betts and Jakob Stix, §1, Remark 1.3 and footnote 1, p. 3. The original method covers, with bookkeeping, 100% of places when K has no CM subfield, but never ramified places, places above 2 or places of bad reduction.

**Needs.** [Kodaira–Parshin families have no points of type (c)](#spm-8-type-c-empty); [Choosing the Kodaira–Parshin parameter](#spm-8-kodaira-parshin-choice); [Conjugate and self-conjugate places](#spm-3-self-conjugate-place); `MordellLawrenceVenkatesh:LV.1/friendly-place`; `MordellLawrenceVenkatesh:LV.11/admissible-prime`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

### Dependencies of SPM.8

Stages used: `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `GaloisSectionsPadicPeriodMaps:SPM.3`, `GaloisSectionsPadicPeriodMaps:SPM.6`, `MordellLawrenceVenkatesh:LV.0`, `MordellLawrenceVenkatesh:LV.1`, `MordellLawrenceVenkatesh:LV.10`, `MordellLawrenceVenkatesh:LV.11`, `MordellLawrenceVenkatesh:LV.7`, `MordellLawrenceVenkatesh:LV.8`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `tauceti:TauCetiRoadmap/LocalGaloisGroups#layer-7-exact-rank-of-the-full-absolute-galois-group`.

## Layer SPM.9: Finiteness of the Lawrence–Venkatesh locus and Theorems A and B

**Targets.** Theorem 6.5: at a self-conjugate place the Lawrence–Venkatesh locus of a suitable Kodaira–Parshin family is finite. The Mordell conjecture as a corollary. Finiteness of loc\_v(Sec^Sel(Y/K)) at every self-conjugate place of any number field. Theorem A (no CM subfield: every finite place) and Theorem B (finiteness of the projections of the finite descent locus). Remark 1.3: the Lawrence–Venkatesh argument in obstruction form and the places it misses. The section conjecture is not assumed; Theorem A is its unconditional prediction.

<a id="spm-9-lv-locus-finite"></a>

### Finiteness of the Lawrence–Venkatesh locus at self-conjugate places

**Theorem** (`SPM.9/lv-locus-finite`). Planet: Finiteness of the Lawrence–Venkatesh locus. Let K be a number field, Y/K a smooth projective geometrically connected curve of genus ≥ 2 and v a self-conjugate place of K. Then there is an abelian-by-finite family X → Y′ → Y, namely the Kodaira–Parshin family X\_q for any q as in SPM.8/kodaira-parshin-choice, such that Y(K\_v)^LV\_{X,S} is finite for every suitable S.

**Hypotheses and conventions.**

- v self-conjugate (SPM.3/self-conjugate-place); no reduction or ramification condition on v.
- S suitable for X\_q: containing the places above p∞ and the places of bad reduction of the family.

**Proof sketch.**

1. By SPM.6/trichotomy-loci (which rests on the principal trichotomy at the self-conjugate place v), Y(K\_v)^LV\_{X\_q,S} ⊆ Y(K\_v)^LV\_{X\_q,S,(a)} ∪ Y(K\_v)^LV\_{X\_q,(b)} ∪ Y(K\_v)^LV\_{X\_q,(c)}.
2. X\_q has full monodromy (LV.10/kodaira-parshin-full-monodromy), so the first two sets are finite (SPM.7/type-a-locus-finite, SPM.7/type-b-locus-finite).
3. The third is empty by the choice of q (SPM.8/type-c-empty, SPM.8/kodaira-parshin-choice).

**Checks.**

- With the inclusion Y(K) ⊆ Y(K\_v)^LV\_{X\_q,S} it gives the finiteness of Y(K) (SPM.9/mordell-reproved).
- With Theorem 7.1 and Lemma 6.4 it gives the finiteness of loc\_v(Sec^Sel(Y/K)) (SPM.9/selmer-finiteness-self-conjugate).

**Sources.**

- L. Alexander Betts and Jakob Stix, Theorem 6.5, p. 44, proved in §6.5, p. 53. At a self-conjugate place, the Lawrence–Venkatesh locus of a suitable Kodaira–Parshin family is finite: the trichotomy splits it into three loci, the first two finite by full monodromy and the third empty by the choice of q.

**Needs.** [Types (a), (b), (c) and their loci](#spm-6-trichotomy-loci); [Finiteness of the type (a) locus under full monodromy](#spm-7-type-a-locus-finite); [Finiteness of the type (b) locus under full monodromy](#spm-7-type-b-locus-finite); [Kodaira–Parshin families have no points of type (c)](#spm-8-type-c-empty); [Choosing the Kodaira–Parshin parameter](#spm-8-kodaira-parshin-choice); `MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy`; [The Lawrence–Venkatesh locus](#spm-6-lawrence-venkatesh-locus).

<a id="spm-9-mordell-reproved"></a>

### The Mordell conjecture through the Lawrence–Venkatesh locus

**Theorem** (`SPM.9/mordell-reproved`). For every number field K and every smooth projective geometrically connected curve Y/K of genus ≥ 2, Y(K) is finite.

**Hypotheses and conventions.**

- No hypothesis on K: a self-conjugate place always exists (SPM.3/self-conjugate-place, API infinite\_selfConjugate): every place if K has no CM subfield, and otherwise a place above a prime of E\_K⁺ inert in the maximal CM subfield E\_K, which exists by Chebotarev (an argument not spelled out in the source).

**Proof sketch.**

1. Choose a self-conjugate place v of K, and q, X\_q as in SPM.9/lv-locus-finite.
2. Y(K) ⊆ Y(K\_v)^LV\_{X\_q,S} by SPM.6/rational-points-in-lv-locus, and the right side is finite.

**Checks.**

- This recovers Faltings's theorem as proved by Lawrence–Venkatesh (LV.11/faltings-theorem), now at an arbitrary self-conjugate place rather than at a friendly place of good reduction.

**Sources.**

- L. Alexander Betts and Jakob Stix, §6, after Theorem 6.5, p. 44. Since rational points lie in the Lawrence–Venkatesh locus of every family, Theorem 6.5 reproves the Mordell conjecture.

**Needs.** [Finiteness of the Lawrence–Venkatesh locus at self-conjugate places](#spm-9-lv-locus-finite); [Rational points lie in the Lawrence–Venkatesh locus](#spm-6-rational-points-in-lv-locus); [Conjugate and self-conjugate places](#spm-3-self-conjugate-place); `MordellLawrenceVenkatesh:LV.11/faltings-theorem`.

<a id="spm-9-selmer-finiteness-self-conjugate"></a>

### Finiteness of Selmer localisations at self-conjugate places

**Theorem** (`SPM.9/selmer-finiteness-self-conjugate`). Planet: Selmer finiteness at self-conjugate places. Let K be a number field, Y/K a smooth projective geometrically connected curve of genus ≥ 2 and v a finite self-conjugate place of K. Then the image of loc\_v: Sec^Sel(Y/K) → Y(K\_v) is finite.

**Hypotheses and conventions.**

- v self-conjugate; K may contain CM subfields.

**Proof sketch.**

1. For the family X\_q of SPM.9/lv-locus-finite and suitable S: loc\_v(Sec^Sel(Y/K)) ⊆ Y(K\_v)^LV\_{X\_q} (SPM.1/selmer-sections-in-lv-locus) ⊆ Y(K\_v)^LV\_{X\_q,S} (SPM.6/adelic-locus-in-lv-locus), which is finite.

**Checks.**

- If K has a CM subfield, the statement covers exactly the places whose restriction to the maximal CM subfield is fixed by complex conjugation.

**Sources.**

- L. Alexander Betts and Jakob Stix, §1.1, points (1) and (2), p. 3. The proof of Theorem A consists of the containment of the Selmer localisation in the Lawrence–Venkatesh locus for every family and the finiteness of the locus for a Kodaira–Parshin family at every self-conjugate place.

**Needs.** [Selmer sections localise into the Lawrence–Venkatesh locus](#spm-1-selmer-sections-in-lv-locus); [Interpolating pairs are S-good](#spm-6-adelic-locus-in-lv-locus); [Finiteness of the Lawrence–Venkatesh locus at self-conjugate places](#spm-9-lv-locus-finite); [Selmer sections and the localisation maps](#spm-0-selmer-sections).

<a id="spm-9-theorem-a"></a>

### Theorem A: finiteness of the Selmer section image

**Theorem** (`SPM.9/theorem-a`). Planet: Theorem A. Let K be a number field containing no CM subfield and Y/K a smooth projective curve of genus ≥ 2 (geometrically connected). Then for every finite place v of K the image of the localisation map loc\_v: Sec^Sel(Y/K) → Y(K\_v) is finite.

**Hypotheses and conventions.**

- K contains no CM subfield, for instance K totally real or of odd degree; the hypothesis is used only to make every finite place self-conjugate.
- The section conjecture is not assumed; Theorem A is an unconditional prediction of it.

**Proof sketch.**

1. With no CM subfield every finite place is self-conjugate (SPM.3/self-conjugate-place(1)); apply SPM.9/selmer-finiteness-self-conjugate.

**Checks.**

- Under the section conjecture (NC.6/section-conjecture) Sec^Sel(Y/K) = κ\_Y(Y(K)), which is finite by SPM.9/mordell-reproved, so Theorem A is a consequence of the section conjecture; here it is proved without it.
- For K = Q every finite place is covered, including p = 2, places of bad reduction of Y and ramified places of larger totally real fields.

**Sources.**

- L. Alexander Betts and Jakob Stix, Theorem A, p. 1. For a number field without CM subfield and a smooth projective curve of genus at least 2, the image of the Selmer sections in the v-adic points is finite for every finite place v.
- L. Alexander Betts and Jakob Stix, §1.1, p. 3. If K has no CM subfield every finite place is self-conjugate, so the two points of the proof give Theorem A.

**Needs.** [Finiteness of Selmer localisations at self-conjugate places](#spm-9-selmer-finiteness-self-conjugate); [Conjugate and self-conjugate places](#spm-3-self-conjugate-place); [Selmer sections and the localisation maps](#spm-0-selmer-sections); `AnabelianGeometryAndNonabelianChabauty:NC.6/section-conjecture`.

<a id="spm-9-theorem-b"></a>

### Theorem B: finiteness of the projections of the finite descent locus

**Theorem** (`SPM.9/theorem-b`). Planet: Theorem B. Let K be a number field containing no CM subfield and Y/K a smooth projective geometrically connected curve of genus ≥ 2. Then for every finite place v of K the projection of the finite descent locus Y(A\_K)\_•^{f-cov} (SPM.0/modified-finite-descent-locus) to Y(K\_v) is finite.

**Hypotheses and conventions.**

- As in Theorem A; Stoll's conjecture that the locus is the closure of Y(K) (equivalently Y(K), which is finite) is not assumed.

**Proof sketch.**

1. By SPM.0/harari-stix-finite-descent(b) the projection equals loc\_v(Sec^Sel(Y/K)); apply SPM.9/theorem-a.

**Checks.**

- Under Stoll's conjecture the projection is the finite set Y(K); Theorem B is the unconditional shadow of that expected finiteness.

**Sources.**

- L. Alexander Betts and Jakob Stix, Theorem B and the paragraph before it, p. 2. Since the finite descent locus is the image of the Selmer sections under total localisation (Harari–Stix), Theorem A shows that its projection to Y(K\_v) is finite for every finite place.

**Needs.** [Harari–Stix: finite descent and Galois sections](#spm-0-harari-stix-finite-descent); [Theorem A: finiteness of the Selmer section image](#spm-9-theorem-a); [Modified adelic points and the finite descent locus](#spm-0-modified-finite-descent-locus).

<a id="spm-9-obstruction-comparison"></a>

### The Lawrence–Venkatesh argument as an obstruction

**Application** (`SPM.9/obstruction-comparison`). The original argument of Lawrence and Venkatesh proves, in the language of this roadmap: (1°) Y(K) ⊆ Y(K\_v)^LV\_{X,S} for every abelian-by-finite family, suitable S and finite v | p (SPM.6/rational-points-in-lv-locus); and (2°) for some finite place v and odd prime q, Y(K\_v)^LV\_{X\_q,S} is finite for all suitable S, once the residue-disc analysis is extended from K-rational to K\_v-rational centres (footnote 1). Since (1) loc\_v(Sec^Sel) ⊆ Y(K\_v)^LV\_{X,S} holds for every family (SPM.1/selmer-sections-in-lv-locus with SPM.6/adelic-locus-in-lv-locus), (2°) already gives Theorem A at one place, and with bookkeeping at 100% of places when K has no CM subfield (SPM.8/parameter-comparison (I)); the places ramified over Q, above 2 or of bad reduction need the model-free method of SPM.4, the self-conjugate numerics of SPM.3 and the trichotomy of SPM.6.

**Hypotheses and conventions.**

- (2°) as stated needs the K\_v-centred comparison of complex and v-adic period maps requested from LV.3.

**Proof sketch.**

1. Compare the hypotheses: Lawrence–Venkatesh use friendly places of good reduction, crystalline cohomology on residue disks and the Frobenius orbit count with threshold 8 (LV.4, LV.7, LV.11); this roadmap replaces them by self-conjugate places, the relative comparison and Shimizu's theorem, and the G\_v-orbit count with threshold 4.
2. The general principle of SPM.1/sections-restrict-local-systems shows that any v-adic obstruction to rational points defined by a Q\_p-local system on Y also constrains Selmer sections; the abelian-by-finite families are one instance (the Chabauty–Kim case is the subject of work of Betts, Kumpitsch and Lüdtke mentioned in Remark 1.5).

**Checks.**

- For K = Q the original argument covers a set of primes of natural density 1 for each curve, never p = 2 or primes of bad reduction; this roadmap covers every prime (SPM.9/theorem-a).

**Sources.**

- L. Alexander Betts and Jakob Stix, Remark 1.3 and footnote 1, p. 3. In obstruction-theoretic terms the original argument proves the containment of rational points in the locus and the finiteness of the locus at one place; with bookkeeping this gives Theorem A at 100% of places, but ramified places, places above 2 and places of bad reduction need the new methods.
- L. Alexander Betts and Jakob Stix, Remark 1.5, pp. 3–4. Any v-adic obstruction from a Q\_p-local system constrains the localisation of Selmer sections; the Chabauty–Kim case is being worked out separately.

**Needs.** [Rational points lie in the Lawrence–Venkatesh locus](#spm-6-rational-points-in-lv-locus); [Selmer sections localise into the Lawrence–Venkatesh locus](#spm-1-selmer-sections-in-lv-locus); [Interpolating pairs are S-good](#spm-6-adelic-locus-in-lv-locus); [Finiteness of the Lawrence–Venkatesh locus at self-conjugate places](#spm-9-lv-locus-finite); [Which pairs (v, q) the argument covers](#spm-8-parameter-comparison); [Local systems restricted along sections at local points](#spm-1-sections-restrict-local-systems); `MordellLawrenceVenkatesh:LV.11/faltings-theorem`.

### Dependencies of SPM.9

Stages used: `AnabelianGeometryAndNonabelianChabauty:NC.6`, `GaloisSectionsPadicPeriodMaps:SPM.0`, `GaloisSectionsPadicPeriodMaps:SPM.1`, `GaloisSectionsPadicPeriodMaps:SPM.3`, `GaloisSectionsPadicPeriodMaps:SPM.6`, `GaloisSectionsPadicPeriodMaps:SPM.7`, `GaloisSectionsPadicPeriodMaps:SPM.8`, `MordellLawrenceVenkatesh:LV.10`, `MordellLawrenceVenkatesh:LV.11`.

## Requests to other roadmaps

Each request names a statement this roadmap uses and the layer that should state it. Tau Ceti layers are cited as they stand.

- `MordellLawrenceVenkatesh:LV.2`: Model-free cohomology of the fibres of an abelian-by-finite family over a field F of characteristic zero (Betts–Stix §4.1, pp. 32–36; routed to LV.2 by the reviewed extraction PAPER-BETTS-STIX-25, route 3). (1) Étale side, (4.1) and Lemma 4.2: for X → Y′ → Spec F with polarisation λ, H^k\_ét(X\_{F̄}, Q\_p) ≅ ∧^k over H⁰\_ét of H¹\_ét, H^•\_ét = ∏\_{y′} Ind\_{G\_{F(y′)}}^{G\_F} ∧^• H¹\_ét(X\_{ȳ′}, Q\_p), and the class c₁^ét(λ) := ½ c₁^ét((1, λ)^\*P) (P the Poincaré bundle on X ×\_{Y′} X^∨) gives a perfect H⁰\_ét-linear G\_F-equivariant alternating pairing ω\_λ^ét: ∧² over H⁰\_ét of H¹\_ét → H⁰\_ét(−1). (2) De Rham side, (4.2) and Lemma 4.6: the same over H⁰\_dR = O(Y′), with c₁^dR(λ) ∈ F¹H²\_dR giving a perfect pairing ω\_λ^dR: ∧² H¹\_dR → H⁰\_dR⟨−1⟩ for which F¹H¹\_dR is Lagrangian. (3) Lemma 4.7, with π: X → Y smooth and proper (the printed hypothesis 'smooth' does not give base change of H²\_dR; see this packet's E2): the relative de Rham Chern class c₁^dR(L)/Y ∈ F¹H⁰(Y, H²\_dR(X/Y))^{∇=0} with fibres c₁^dR(L|X\_y). (4) Lemma 4.8 and Remark 4.9, for Y smooth over a finite extension K\_v of Q\_p and no model: over a closed polydisc U on which H⁰\_dR(X/Y)^an and H¹\_dR(X/Y)^an have full bases of flat sections, parallel transport for i = 0, 1 respects the algebra, module and pairing structures, and (Y′)^an|U ≅ U × (Y′\_{y₀})^an. LV.2/de-rham-bundle states (2)–(4) only for a good model over O\_S, and LV.1/abelian-variety-cohomology-properties(d) states the pairing for a single abelian variety. Needed by: [The symplectic pair of a fibre](#spm-1-fibre-symplectic-pair), [The relative symplectic pair R^{≤1}π\_\*Q\_p](#spm-1-relative-symplectic-pair), [Period maps of abelian-by-finite families](#spm-5-abelian-by-finite-period-diagram), [The symplectic pairs M^{≤1}(Φ) of Lagrangian filtrations](#spm-5-lagrangian-period-modules), [The symplectic pair of p-adic Hodge cohomology of a fibre](#spm-5-p-adic-hodge-symplectic-pair).
- `PadicHodgeTheory:R06.3`: Part II (PadicHodgeTheoryPartII, not yet designed; PadicHodgeTheory is a TauCetiRoadmap pull request): the full faithfulness of D\_pH. For a finite extension K\_v/Q\_p, the functor V ↦ D\_pH(V) = (D\_pst(V), D\_dR(V), c\_BO) from de Rham Q\_p-representations of G\_v to filtered discrete (φ, N, G\_v)-modules is a fully faithful ⊗-functor (Fontaine, Astérisque 223, Théorème 5.6.7(v), with Berger's p-adic monodromy theorem, as cited by Betts–Stix Theorem 2.9, p. 9). R06.3/plan/potentially-semistable-dieudonne-module constructs D\_pst and R06.2/plan/dst-exact-tensor-fully-faithful proves full faithfulness of D\_st on semistable representations; the descent from a semistabilising extension to the discrete G\_v-action, and the statement on all de Rham representations, are not stated there. Needed by: [Filtered discrete (φ, N, G\_v)-modules: restriction and induction](#spm-2-restriction-induction), [Period maps control the local Galois representations](#spm-4-period-map-controls-local-representations), [Period maps of abelian-by-finite families](#spm-5-abelian-by-finite-period-diagram), [The finite sets T\_i of local classes of type (a)](#spm-7-type-a-classes), [Non-density of the type (a) period locus](#spm-7-type-a-period-non-density), [Non-density of the type (b) period locus](#spm-7-type-b-period-non-density).
- `MordellLawrenceVenkatesh:LV.3`: Model-free v-adic period maps and the complex comparison at K\_v-points (Betts–Stix §3.1 and §5, pp. 15–16 and 39–43; routed to LV.3 by the reviewed extraction PAPER-BETTS-STIX-25, route 4; LV.3 now plans the p-adic period map only on residue disks of a good model with K\_v/Q\_p unramified and p > 2). (1) §3.1: for a vector bundle with flat connection (E, ∇) on Y^an, Y smooth over any finite K\_v/Q\_p, and an admissible open U ∋ y₀ with H⁰\_dR(U/K\_v) = K\_v over which (E, ∇) ≅ (O, d)^m, the unique trivialisation T^∇\_{y₀}: (O ⊗ E\_{y₀}, d) ≅ (E, ∇)|U that is the identity at y₀, its fibres T^∇\_{y₀,y}, and existence of such U around every K\_v-point (Shimizu, Theorem 9.7). (2) Definition 3.1: for a filtered flat bundle (filtration not necessarily Griffiths transverse) the v-adic period map Φ\_{y₀}: U → G^an\_{y₀} to the flag variety of E\_{y₀}, Φ\_{y₀}(y) = (T^∇\_{y₀,y})⁻¹(F^•E\_y). (3) Proposition 3.2: G^an represents filtrations with locally free graded pieces of the given ranks on O\_S ⊗ V. (4) Lemmas 5.1–5.6 and Proposition 5.3 for y₀ ∈ Y(K\_v) and ι: K\_v → C: the Zariski closures of the v-adic and complex period images agree after base change to C; in the proof the period maps are given by the first columns of T⁻¹, where T solves dT = −ωT, T(0) = I (this packet's E1). (5) Lemma 5.9 and Corollary 5.10: under full monodromy (LV.3/algebraic-monodromy-group) Φ\_{y₀} has Zariski-dense image in the Lagrangian period domain H\_{y₀}, and for a curve, a subset of a closed disc whose image is not Zariski dense is finite; Remark 5.11 covers Y(K\_v) by finitely many such discs, which needs Y proper (this packet's E3). Needed by: [Period maps control the local Galois representations](#spm-4-period-map-controls-local-representations), [Period maps control D\_pst in smooth proper families](#spm-4-period-maps-control-dpst), [Period maps of abelian-by-finite families](#spm-5-abelian-by-finite-period-diagram), [The Lawrence–Venkatesh locus in the period domain](#spm-6-period-domain-lv-locus), [Finiteness of the type (a) locus under full monodromy](#spm-7-type-a-locus-finite), [Finiteness of the type (b) locus under full monodromy](#spm-7-type-b-locus-finite).
- `PadicHodgeTheory:P8`: Part II (PadicHodgeTheoryPartII, not yet designed; PadicHodgeTheory is a TauCetiRoadmap pull request): Shimizu's specialisation and the Galois category of a spherical polyannulus, as used in Betts–Stix §3.5, pp. 29–32 (routed to P8 by the reviewed extraction PAPER-BETTS-STIX-25, route 6). (1) Lemma 3.27 and Remarks 3.28–3.29: for R\_v = O\_v⟨t₁^{±1}, …, t\_n^{±1}⟩ and U = Sp(R\_v[1/p]), finite étale coverings of U form a Galois category with fibre functor Hom\_U(Ũ, −), so Ẑ\_p-local systems on U are equivalent to continuous G\_{R\_v}-representations on finitely generated Z\_p-modules, E ↦ H⁰(Ũ, E), with G\_{R\_v} ↠ G\_v; a lift ỹ of a K\_v-point gives a G\_v-equivariant identification H⁰(Ũ, E)\_ỹ ≅ E\_ȳ. ClassicalAdicEtaleCohomology H0/analytic-rational-representation-equivalence gives the rational form for de Jong's analytic fundamental group; the finite étale form with Z\_p-lattices is needed here. (2) Definition 3.24 (Shimizu arXiv v2 Definition 5.6, Corollary 4.10, Lemma 4.12): D^∇\_pst(E) := colim\_w (B^∇\_st(R\_v) ⊗ E)^{G\_{R\_w}}, a discrete (φ, N, G\_v)-module of dimension ≤ rank E, with equality defining potentially horizontal semistable E. (3) Lemma 3.25 and Corollary 3.26 (Shimizu Lemma 4.4): for potentially horizontal semistable E and a lift ỹ of y ∈ U(K\_v), the specialisation ρ\_ỹ: D^∇\_pst(E) → D\_pst(E\_ỹ) is an isomorphism of (φ, N, G\_v)-modules, so T\_{y₀,y} := ρ\_ỹ ∘ ρ\_{ỹ₀}⁻¹ is a canonical isomorphism. P8/horizontal-relative-periods and P8/horizontal-and-local-system-monodromy plan the period rings, the invariants (B^∇\_dR)^{G} = K and the relative monodromy theorem, but not (1)–(3). Needed by: [Transport of D\_pst on a spherical polyannulus](#spm-4-horizontal-transport-polyannulus).
- `MordellLawrenceVenkatesh:LV.1`: Symplectic Faltings lemma and GSp-irreducibility (Betts–Stix Definition 2.3 and Lemma 2.4, pp. 7–8, citing Lawrence–Venkatesh Lemma 2.6; routed to LV.1 by the reviewed extraction PAPER-BETTS-STIX-25, route 2). (1) A non-zero symplectic representation (V, L, ω) of a profinite group is GSp-irreducible if V has no non-zero stable isotropic subspace, equivalently its image lies in no proper parabolic subgroup of GSp(V, ω); this is the case G = GSp\_{2d} of Serre's G-irreducibility, which the extraction PAPER-LAWRENCE-VENKATESH-20 routes to LV.1 in general. (2) For a number field K, a finite set S of places containing those above p∞, n ≥ 0 and d > 0, there are up to isomorphism only finitely many GSp-irreducible symplectic representations of G\_K of rank 2d that are unramified, pure and integral of weight n outside S. LV.1 now plans only the semisimple GL\_n form (LV.1/faltings-finiteness, LV Lemma 2.3); (2) follows from it once GSp-irreducible implies semisimple and isomorphism of symplectic representations is GSp(Q\_p)-conjugacy, with Richardson's finiteness of conjugacy classes (the complete proof the LV extraction asks for). Needed by: [The principal trichotomy](#spm-6-principal-trichotomy), [The finite sets T\_i of local classes of type (a)](#spm-7-type-a-classes), [Finiteness of the sets T\_i](#spm-7-type-a-classes-finite).
- `MordellLawrenceVenkatesh:LV.7`: Isotropic general position for four Lagrangians (Betts–Stix Sublemma 6.18 and Remark 6.19, p. 51; routed to LV.7 by the reviewed extraction PAPER-BETTS-STIX-25, route 5): for a symplectic space (V, ω) over a field F and r ≥ 4, the r-tuples (Φ\_s) of Lagrangians for which some non-zero isotropic W ≤ V has dim(Φ\_j ∩ W) ≥ ½ dim W for all j lie in a proper Zariski-closed subset of LGrass(V, ω)^r. The witness: Φ₁ = ⟨e\_α⟩, Φ₂ = ⟨f\_α⟩ dual Lagrangians, Φ₃, Φ₄ the graphs of e\_α ↦ f\_α and e\_α ↦ λ\_α f\_α with distinct non-zero λ\_α. LV.7/lagrangian-general-position states Lawrence–Venkatesh Lemma 6.4, which needs r ≥ 5 but no isotropy; the isotropic r = 4 version is the one Betts–Stix need for degree-4 residue fields. Needed by: [Non-density of type (b) Lagrangians after Weil restriction](#spm-7-type-b-factor-non-density).
- `MordellLawrenceVenkatesh:LV.8`: Kodaira–Parshin fibres over local points (Betts–Stix §6.4 and footnote 23, p. 52; the extraction PAPER-BETTS-STIX-25 lists the Kodaira–Parshin family /88 as planned in LV.8 and LV.10). LV.8/hurwitz-space and LV.8/kodaira-parshin-family state the description of the fibre π⁻¹(y) only G\_K-equivariantly for y ∈ Y(K). Needed: for every field extension F/K of characteristic zero and y ∈ Y(F), a G\_F-equivariant bijection between Y′\_{q,y}(F̄) and Surj^{out,\*}(π₁^ét(Y\_{F̄} ∖ {y}), Aff(q)), the Aff(q)-conjugacy classes of surjections non-trivial on an inertia generator at y (in particular for F = K\_v and G\_v); and the equal-fibre property of Surj^{out,\*} → Surj(π₁^ét(Y\_{F̄}), F\_q^×) induced by Aff(q) → F\_q^× (Lawrence–Venkatesh Lemma 2.11, LV.0/commutator-product-map, with the quotient by conjugation, which is free because Aff(q) has trivial centre, LV.0/affine-group-centralizer). Needed by: [Kodaira–Parshin families have no points of type (c)](#spm-8-type-c-empty).
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`: Existing Tau Ceti layer, cited as it stands: Chebotarev density, used in the proof of the Harari–Stix theorem (hypothesis (\*\*)) and for the equidistribution of q\_v in Remark 6.23(I). Needed by: [Harari–Stix: finite descent and Galois sections](#spm-0-harari-stix-finite-descent), [Which pairs (v, q) the argument covers](#spm-8-parameter-comparison).
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`: Existing Tau Ceti layer: global Artin reciprocity, the Galois–idele character dictionary and its norm compatibility. Ray-class finiteness and the idele ray-class quotient are imported separately from GlobalNumberFields Layers 2 and 7. Needed by: [Pure characters at self-conjugate places](#spm-3-self-conjugate-character-restriction).
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`: Existing Tau Ceti layer, cited as it stands: the local Artin map and its normalisation (uniformiser to arithmetic Frobenius), used to read Hodge–Tate weights of characters on units. Needed by: [Pure characters at self-conjugate places](#spm-3-self-conjugate-character-restriction).
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`: Existing Tau Ceti layer: the local-field structures and finite-extension carriers used in the quadratic and cubic subfield count. Finiteness of the set of such subfields uses full-G\_v finite generation from existing LocalGaloisGroups Layer 7 (the separate catalogue gap), and the explicit tame count uses LocalFieldsRamification Layer 4. Needed by: [Counting the quadratic and cubic extensions of a local field](#spm-8-small-extension-count).
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`: Existing Tau Ceti layer, cited as it stands: unramified extensions and Frobenius, used in the residue-field-F₂ case of the reduction to polyannuli and in the action of Frobenius on μ\_k. Needed by: [Reduction from closed polydiscs to spherical polyannuli](#spm-4-polydisc-reduction).
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`: Existing Tau Ceti layer, cited as it stands: the tame quotient ⟨σ, τ | στσ⁻¹ = τ^q⟩ of the absolute Galois group, used to count the quadratic and cubic extensions of K\_v for v ∤ 6. Needed by: [Counting the quadratic and cubic extensions of a local field](#spm-8-small-extension-count).
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`: Existing Tau Ceti layer, cited as it stands: functor-of-points description of affine group schemes, used to represent Aut(D) of a (φ, N, G\_v)-module as the unit group scheme of End(D). Needed by: [Automorphism groups and retwisted filtrations](#spm-2-automorphism-group).
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`: Existing Tau Ceti layer supplies closed subgroup schemes and quotient statements, used for Aut^GSp(D). Also needed for the orbit lemma: for a morphism of finite-type varieties f: X → Z, dim closure(f(X)) ≤ dim X, applied to the orbit map after quotienting the central scalar torus. The current Layer 3 does not explicitly state the orbit-dimension consequence; that requested extension is recorded in gaps. Needed by: [Automorphism groups and retwisted filtrations](#spm-2-automorphism-group), [The orbit lemma for retwisted filtrations](#spm-2-orbit-lemma).
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`: Existing Tau Ceti layer: finite\_rayClassGroup for every number-field modulus, used to kill ray-class obstructions and finite-ramification characters. Needed by: [Pure characters at self-conjugate places](#spm-3-self-conjugate-character-restriction).
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`: Existing Tau Ceti layer: the surjective rayClassQuotient with its specified congruence kernel, used to factor a character with finite ramification at every place through a finite ray class group. Needed by: [Pure characters at self-conjugate places](#spm-3-self-conjugate-character-restriction).
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`: Existing Tau Ceti layer: norm maps on ideles and idele classes with their local component formula, used for finite-power descent along N\_{K/E} and its local restriction. Needed by: [Pure characters at self-conjugate places](#spm-3-self-conjugate-character-restriction).

## Open inputs

- **PadicHodgeTheory has no Part II for the inputs of the model-free comparison.** Three inputs routed to PadicHodgeTheory by the reviewed extraction PAPER-BETTS-STIX-25 are not planned there: Shimizu's specialisation isomorphism and D^∇\_pst (Betts–Stix Definition 3.24, Lemma 3.25, Corollary 3.26), the Galois category of a spherical polyannulus (Lemma 3.27), and the full faithfulness of D\_pH on de Rham representations (Theorem 2.9). PadicHodgeTheory is a TauCetiRoadmap pull request, and its Part II (DESIGN-PadicHodgeTheoryPartII) has not been designed; the needs are filed at P8 and R06.3. Re-point the requests when the Part II's stages exist.
- **MordellLawrenceVenkatesh plans only the good-reduction forms of the Lawrence–Venkatesh inputs.** The reviewed routes 2–5 of PAPER-BETTS-STIX-25 make Betts–Stix a source of LV.1, LV.2, LV.3 and LV.7, but the accepted MordellLawrenceVenkatesh packet and package plan the residue-disk, good-model, friendly-place and r ≥ 5 forms only. The model-free statements (symplectic Faltings lemma, fibre symplectic structures over a field, model-free period maps and their complex comparison at K\_v-points, the isotropic four-Lagrangian lemma, Kodaira–Parshin fibres over K\_v-points) are filed as requests at LV.1, LV.2, LV.3, LV.7 and LV.8. They are needed before the targets of SPM.4–SPM.8 can be formalised.
- **Catalogue edge to the existing LocalGaloisGroups roadmap.** The existing TauCetiRoadmap LocalGaloisGroups README, Layer 7 (exact rank of the full absolute Galois group), and Suggested.lean, isTopologicallyFinitelyGenerated\_absoluteGaloisGroup and rank\_absoluteGaloisGroup, supply topological finite generation of the full G\_v with [K\_v:Q\_p]+2 generators. These statements were read in current upstream main; no new theory is planned here. LocalGaloisGroups is one of the roadmaps absent from this atlas snapshot, so its layer id cannot yet be a validated prerequisite. Register that existing layer in the atlas catalogue and replace this recorded graph gap by its exact layer edge; the mathematical dependency is already supplied upstream.
- **Orbit-dimension input beyond the stated ReductiveGroups Layer 3.** The orbit-map proof of Betts–Stix Lemma 2.15, p. 12, needs the finite-type image-dimension bound dim closure(f(X)) ≤ dim X, and hence dim closure(H·x) ≤ dim(H/Z) when a closed central scalar torus Z acts trivially. Existing ReductiveGroups Layer 3 states closed subgroups and quotients but does not state this orbit-dimension result. Import the generic geometric bound from its eventual owner, or have the ReductiveGroups request supply this consequence, before discharging this target; do not treat it as an already supplied theorem.

## Structure

- merge (GaloisSectionsPadicPeriodMaps, AnabelianGeometryAndNonabelianChabautyPartII): The queue still holds the generated job DESIGN-AnabelianGeometryAndNonabelianChabautyPartII (from route 1 of PAPER-BETTS-STIX-25), which would design the same Part II under another id; the red team RT-PAPER-BETTS-STIX-25/1 (confirmed) asks the maintainer to retire it. Retire DESIGN-AnabelianGeometryAndNonabelianChabautyPartII; this roadmap, GaloisSectionsPadicPeriodMaps, is the Part II of AnabelianGeometryAndNonabelianChabauty that the route asks for.
- rescope (GaloisSectionsPadicPeriodMaps, MordellLawrenceVenkatesh): The model-free generalisations of Lawrence–Venkatesh inputs (symplectic Faltings lemma, fibre symplectic structures over a field, period maps on rigid neighbourhoods of K\_v-points and their complex comparison, the isotropic four-Lagrangian lemma, Kodaira–Parshin fibres over K\_v-points) are routed to LV.1–LV.8 by accepted routes, but the accepted MordellLawrenceVenkatesh package plans the good-model forms only. Either revise MordellLawrenceVenkatesh (a fix or Part II job addressing the requests of this packet) or, if that roadmap is frozen, move these statements into a new layer of this roadmap between SPM.3 and SPM.4; the requests here name each statement with its Betts–Stix locator.
- rescope (GaloisSectionsPadicPeriodMaps, HeightsRationalPointsAndObstructions): SPM.0/modified-finite-descent-locus plans Stoll's modified adelic points and finite descent locus, a small extension of RP.3/descent-set; it is needed here only to state Theorem B. If a HeightsRationalPointsAndObstructions Part II is designed, move this definition there and import it.
- rescope (GaloisSectionsPadicPeriodMaps, PadicHodgeTheory): SPM.2 (restriction and induction of filtered discrete (φ, N, G\_v)-modules, their automorphism groups, the orbit lemma and dimension bounds) is general p-adic Hodge theory used here first. When PadicHodgeTheoryPartII is designed, it may own SPM.2, with this roadmap importing it; until then SPM.2 is planned here.

## References

- L. Alexander Betts and Jakob Stix, *Galois sections and p-adic period mappings*, arXiv:2204.13674v1 (28 April 2022, 59 pages); published in Annals of Mathematics 201 (2025), no. 1, 79–166, doi:10.4007/annals.2025.201.1.2, the published revision has not been compared, and all statements and locators here refer to arXiv v1. https://arxiv.org/pdf/2204.13674v1
- David Harari and Jakob Stix, *Descent obstruction and fundamental exact sequence*, arXiv:1005.1302v2 (26 May 2010); published in The Arithmetic of Fundamental Groups (PIA 2010), Contributions in Mathematical and Computational Sciences 2, Springer 2012, 147–166, where Betts–Stix cite it as [HS12, Theorem 11]; locators are the arXiv numbering (Theorem 2.1). https://arxiv.org/pdf/1005.1302v2
- Michael Stoll, *Finite descent obstructions and rational points on curves*, arXiv:math/0606465v3; published in Algebra & Number Theory 1 (2007), 349–391; locators are the arXiv pagination (printed page = PDF page). https://arxiv.org/pdf/math/0606465v3
- Jakob Stix, *On cuspidal sections of algebraic fundamental groups*, arXiv:0809.0017v1 (2008); published in Galois–Teichmüller Theory and Arithmetic Geometry, Adv. Stud. Pure Math. 63 (2012), 519–563; locators use the arXiv v1 pagination. https://arxiv.org/pdf/0809.0017v1
