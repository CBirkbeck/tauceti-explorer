# Excursion operators and the spectral action — ES5 and ES6

This revision retains the 21 declaration-sized targets and every accepted node id. ES5, ES6 and ES6:duality are planned with explicit owner requests. ES6:functoriality and the packet remain **partial** because an unconditional arbitrary-local-field disconnected-centre comparison has not been established. The p-adic construction and the conditional comparison below do not fulfill that all-field target. Every implementation status is unchecked.

## Conventions and ownership

Let E be a nonarchimedean local field with residue field F_q of characteristic p, ell different from p, and Lambda an eligible Z_ell[sqrt(q)]-algebra interpreted with the supplier’s relative-discrete convention. L is an algebraically closed such field. Parameters are semisimple conjugacy classes with the prescribed Weil projection. Continuity is a map of condensed sets into relatively discrete coefficients, supplied by LP0/LP2; an abstract discrete-group parameter has no additional continuity assertion.

The spectral-centre map is imported from ES1:spectral-center and requires |pi_0 Z(G)| invertible in Lambda for every group in a centre diagram. Without that hypothesis use excursion operators; the scalar parameter assignment remains valid. No categorical good-prime restriction is inserted into this scalar theorem. Qbar_ell is uncountable; Fbar_ell is countable. The modular admissibility theorem is requested upstream at SR.3b after SR.2, independently of downstream SR.6. Vignéras II.2.8 has not been read in this run and is not asserted as a closed source proof.

Art_arith sends a uniformizer to arithmetic Frobenius. Define rec_geom(x)=Art_arith(x^-1); it sends a uniformizer to geometric Frobenius. This is precomposition with inversion. The inverse function rec_geom^-1 is used only after this definition. Physical line-bundle degree d is opposite to the Kottwitz label (FS III.2, p. 91). The torus proof fixes the Hecke source frame and associated-representation descent before determining its Weil action.

| Owner | Interface consumed |
| --- | --- |
| ES0 and ES1 | Integral excursion action, compact finite-wild factorization, and the conditional spectral-to-geometric centre map. |
| LP0 and LP2 | Cocycle stacks, prescribed projection, closed orbits, excursion presentation and reconstruction. The abstract action is already group-agnostic; its arbitrary-discrete-group classifier extension remains requested. |
| GS4 | Normalized Satake, Chevalley, and adjoint-isomorphism/product/Weil naturality. |
| HS0, HS1 and HS4 | First-bundle relative position, condensed relative-homology Hecke kernels, creation/annihilation, and current pre-evaluation isogeny/product/Weil diagrams. |
| VS4 and VS5 | Current stratum equivalence, lisse left adjoint, compact generation, lisse Kunneth and compact lisse BZ duality. Their remaining condensed enrichment and domain refinements are requested precisely. |
| SR.0–SR.2 and proposed SR.3b | Smooth carriers, abelian Bernstein centre, induction/dual conventions and all-coefficient irreducible admissibility. |
| BG0/BG1 and RG2.5/proposed RG2.6 | Bundle geometry, torus components, dual/root data and requested induced-torus resolutions/surjective z-extensions. Injective z-embeddings retain their separate application here. |
| RF3 and Relative Fargues–Fontaine Part II | Line-bundle signs and the requested coefficient-free Lubin–Tate cover with Frobenius action. |
| Upstream ClassFieldTheory layer 9 and Part II | Arithmetic normalization/topological Weil abelianization in the proven mixed-characteristic range; full equal-characteristic wild reciprocity needs the extension. |
| ES7:parabolic | The late return used for general smooth duals. It imports ES6:functoriality; no reverse edge to it from that child is introduced. |

Mathlib supplies condensed sheaves, algebra homomorphisms, ordinary category centres, representations/intertwiners, actual group algebras and regular actions, and free-subgroup/finite-generation facts. Abelian Shapiro is retained only as a contrast; it does not prove the nonabelian cocycle-stack comparison.

## ES5

### Schur irreducibility in condensed algebras

**Node:** `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`. **Suggested name:** `IsSchurIrreducible`. **Kind:** definition.

Fix a nonarchimedean local field E of residue cardinality q and residue characteristic p, a prime ell different from p, a connected reductive E-group G, and an algebraically closed Z_ell[sqrt(q)]-field L. Give L its relatively discrete condensed Z_ell-algebra structure. For A in D_lis(Bun_G,L), write End(A) for the degree-zero algebra in its condensed mapping object. A is Schur-irreducible precisely when the scalar unit L to End(A) is an isomorphism of condensed L-algebras. An abstract scalar endomorphism ring alone is insufficient to establish this definition.

**Hypotheses and conventions.**

- End means degree zero, not the whole derived mapping complex.
- The condensed enhancement and its scalar unit are those of HS1/IX.1. Compact-source Hom is relatively discrete by IX.1.2; arbitrary A is handled by the induced enhancement.

**Proof or construction.**

1. Import the enhanced category and unit; take invertibility of that specific unit, using the existing category of condensed algebras.
2. Invert the unit to recover unique scalar sections over every profinite test object, compatibly with restriction.
3. Use the unit-preserving endomorphism isomorphism under a sheaf isomorphism or shift; no t-structure or compactness hypothesis enters this invariance.

**Direct prerequisites.**

- `mathlib:Condensed`
- `mathlib:AlgCat`
- `mathlib:CategoryTheory.IsIso`
- `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`

**Uses informing the API.**

- IX.4.1: Turn an excursion endomorphism into a scalar while retaining its condensed dependence on Weil elements.
- ES5 representation assignment: Prove the definition for the transported representation, rather than replace it by abstract Schur’s lemma.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsSchurIrreducible.scalarIso` | constructor | Invert the scalar unit to obtain its canonical condensed algebra isomorphism. |
| `IsSchurIrreducible.scalar_unique` | characterisation | For every test object S and endomorphism section e there is exactly one scalar section a whose unit image is e. |
| `IsSchurIrreducible.sections_bijective` | structure | The scalar unit is bijective on sections over every S. |
| `IsSchurIrreducible.iso_invariant` | functoriality | A scalar-unit-preserving isomorphism of endomorphism algebras preserves and reflects Schur irreducibility. |
| `IsSchurIrreducible.shift` | functoriality | The canonical endomorphism isomorphism for a shift, which preserves the unit, carries Schur irreducibility to the shifted object. |

**Discriminating planned tests.**

| Name | Kind | Expected result |
| --- | --- | --- |
| `schur_scalar_identity` | computation | The identity unit on the relatively discrete scalar algebra is Schur. |
| `schur_rejects_zero` | degenerate | If a scalar section ring is nonzero and the target section ring has zero equal to one, its scalar unit is not Schur. |
| `schur_requires_all_sections` | non-example | Failure of bijectivity on any condensed test object excludes Schur irreducibility, even if a global-section comparison is known. |

**Acceptance checks.**

- The zero object fails: its identity is zero whereas L is nonzero.
- Check all condensed sections, not only global sections.
- A shift of a Schur object remains Schur.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.4.1, p. 327: The printed Schur condition; the scalar-unit formulation fixes its canonical algebra structure.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.1.2, pp. 320–321: Specifies the compact-source enhancement; it does not say every irreducible representation is compact.

**Planet:** Condensed Schur irreducibility.

### The condensed Schur refinement for smooth representations

**Node:** `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`. **Suggested name:** `condensedSchurOfAdmissible`. **Kind:** theorem.

Let pi be an irreducible admissible smooth L-representation of G_b(E). The scalar map L to End_{G_b(E)}(pi) is an isomorphism of abstract L-algebras and, using the relatively discrete representation/sheaf dictionary with its enriched mapping objects, an isomorphism of condensed algebras. Its image under the fully faithful enriched stratum embedding is therefore Schur-irreducible. For all irreducible smooth pi the admissibility input is supplied by the proposed foundational SR.3b; this node owns only the condensed refinement, not Vignéras’ theorem.

**Hypotheses and conventions.**

- L is algebraically closed of characteristic different from p.
- Use the actual smooth representation category and its scalar unit.
- Do not assume pi is compact in its derived category.

**Proof or construction.**

1. Choose a nonzero K-fixed vector for an open pro-p K; admissibility makes pi^K finite dimensional and irreducibility makes its G-orbit generate pi.
2. An equivariant endomorphism acts on pi^K and has an eigenvalue over L. Its difference from this scalar has a nonzero invariant kernel, hence vanishes on pi.
3. For a condensed family, evaluate on that vector in the finite-dimensional relatively discrete pi^K and extract a scalar by a linear coordinate. The supplier’s enriched evaluation comparison shows this is a morphism of condensed algebras inverse to the unit.
4. Transport through the enriched fully faithful adjunction, whose unit preserves scalars. The missing enriched fixed-vector comparison and modular admissibility are recorded as supplier gaps.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`
- `mathlib:Representation.IntertwiningMap`
- `tauceti:TauCeti.IsSmoothDiscrete`
- `tauceti:TauCeti.SmoothDiscreteTopRep`
- `SmoothRepresentationsOfLocalGroups:SR.0`
- `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `VStackSheavesAndLisseCategories:VS4`
- `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`
- `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`
- `VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint`

**Acceptance checks.**

- This argument works for the countable field Fbar_ell, where an uncountability shortcut is unavailable.
- A characteristic-zero Z_ell-field contains Q_ell and is uncountable; Qbar_ell is not countable.
- Test the trivial one-dimensional representation without asserting that arbitrary irreducibles are compact.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.4.1 and IX.7.1, pp. 327, 334: Motivates application to representations; the fixed-vector proof is a refinement outlined here, with the foundational admissibility theorem requested separately.

### The scalar excursion character

**Node:** `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`. **Suggested name:** `excursionCharacter`. **Kind:** construction.

For Schur A, evaluate the ES0 excursion action and apply the inverse scalar unit, giving chi_A: Exc(W,Ghat) tensor L to L and the associated family Theta_n: Inv_n to Map(W_E^n,L), n at least one. Here Inv_n is O((Ghat semidirect Q)^n // Ghat), with O(Q^n)-linearity determined by W_E to Q. For g:[m] to [n], the reindexing square commutes. The second square uses ordered fibre multiplication mu_g:H^m to H^n and m_g:W_E^m to W_E^n, and reads Theta_m(mu_g^* f)(gamma)=Theta_n(f)(m_g gamma). Empty fibres contribute the identity. The family is condensed.

**Hypotheses and conventions.**

- The pinned Weil action factors through Q.
- Use the universal integral excursion algebra; its flat torsion-free universal property is not applicable to a characteristic-ell field.
- For abstract characters restrict to a suitable discretization; the condensed family itself is expressed on W_E.

**Proof or construction.**

1. Import ES0’s operators and LP2’s presentation, including the coefficient attached to a matrix coefficient.
2. Compose evaluation with the inverse condensed scalar unit, which preserves algebra operations and O(Q^n)-linearity.
3. Apply the two operator relations before scalar extraction; their naturality is unchanged by this composition.
4. Check condensed continuity using the actual inverse unit and the condensed Hecke action, rather than assert continuity from a character of a discrete group.
5. Use the integral relations for characteristic ell. Inversion follows by inserting an inverse pair and multiplying it to the identity; the torsion-free quotient is only used with flat targets.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`
- `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`
- `ExcursionOperatorsAndSpectralAction:ES0/continuity-of-excursion-evaluations`
- `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`
- `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`
- `mathlib:AlgHom`

**Uses informing the API.**

- VIII.3.8: Provides exactly its third datum, with both relations and condensed continuity.
- IX.6: Prove operator squares before evaluating chi_A, so constituent statements follow from scalar naturality.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `excursionCharacter.apply` | simp | On an excursion coefficient x, chi_A(x) is the inverse scalar-unit image of its operator. |
| `excursionCharacter.scalar_linear` | structure | The map fixes L-scalars; the invariant-ring family is linear over O(Q^n) with its prescribed evaluation. |
| `excursionCharacter.family` | data | Postcompose universal invariant-ring evaluation with chi_A to obtain Theta_n. |
| `excursionCharacter.pullback` | relation | Theta_n(g^* f)(gamma) equals Theta_m(f)(gamma composed with g). |
| `excursionCharacter.multiplication` | relation | Theta_m(mu_g^* f)(gamma) equals Theta_n(f)(ordered fibre products of gamma). |
| `excursionCharacter.condensed` | structure | An operator family in a condensed endomorphism algebra has exactly one scalar family whose composition with the scalar unit is that family. |
| `excursionCharacter.ext` | extensionality | Agreement on all excursion coefficients generating the algebra implies equality of characters. |

**Discriminating planned tests.**

| Name | Kind | Expected result |
| --- | --- | --- |
| `character_unit` | computation | The unit excursion coefficient has scalar value one. |
| `character_inverse_pair` | compatibility | The inverse-pair coefficient identified with the identity coefficient by the universal relations has the same scalar value. |
| `character_detects_order` | non-example | If the evaluated operators for two ordered-word coefficients differ, their scalar values differ; a scalar extraction that discards order fails this test. |

**Acceptance checks.**

- Theta sends one to one and evaluates base O(Q^n) functions by the prescribed projection.
- Repeated variables, empty multiplication fibres and an inverse pair satisfy the specified relations.
- Ordering is preserved; not every coefficient distinguishes a reversed word, but those which do retain the distinction.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VIII.3.7, pp. 288–289: The ordered multiplication relation.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VIII.3.8 proof, p. 290: The continuity required by the reconstruction theorem, supplied here by the Schur inverse.

**Planet:** Scalar excursion character.

### The abstract scalar-parameter consequence

**Node:** `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`. **Suggested name:** `abstractSemisimpleParameter`. **Kind:** theorem.

Let W be discrete and let an L-linear category C carry the finite-set functorial Rep(Q^I)-linear monoidal Weil-equivariant functors of VIII.4. For X with scalar unit L to End(X) an isomorphism of abstract algebras, there is a unique Ghat(L)-conjugacy class of semisimple sections W to Ghat(L) semidirect W. For every excursion datum its scalar is beta composed with V(phi_X(gamma_i)) composed with alpha. This is the objectwise consequence of the imported excursion action and character classification, not a new construction of those theories.

**Hypotheses and conventions.**

- The group W in this statement is discrete.
- Uniqueness is of a conjugacy class, not a preferred representative.
- The current LP2 abstract action node is group-agnostic and includes the ordinary-category version. Its discrete-W classifier extension, with prescribed Q-projection and closed-orbit uniqueness, is still requested separately from the local-Weil classifier.

**Proof or construction.**

1. Evaluate the current LP2 abstract VIII.4.1 excursion-algebra action at X, using its ordinary L-linear categorical version and the coherent finite-set data; do not substitute the compact Bun_G specialization.
2. Apply the requested arbitrary-discrete-W, algebraically closed coefficient version of LP2 character classification to the scalar character; this extension remains a recorded supplier gap.
3. Evaluate its matrix-coefficient character to obtain the displayed identity; uniqueness follows because those coefficients determine the closed orbit.

**Direct prerequisites.**

- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`
- `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`
- `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`
- `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`

**Acceptance checks.**

- No claim of continuity on W_E follows from this discrete statement alone.
- The identity applies to every finite set and matrix coefficient, not merely traces of individual elements.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VIII.4.3, pp. 292–293: The scalar matrix-coefficient characterization in the discrete categorical setting.

**Planet:** Abstract semisimple parameter.

### The continuous parameter of a Schur sheaf

**Node:** `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`. **Suggested name:** `parameterOfSchurSheaf`. **Kind:** theorem.

For Schur A in D_lis(Bun_G,L), there is exactly one Ghat(L)-conjugacy class of continuous semisimple L-parameters phi_A:W_E to Ghat(L) semidirect Q lifting the fixed W_E to Q. For every datum (I,V,alpha,beta,gamma), the creation–Weil–annihilation endomorphism equals the scalar beta V(phi_A(gamma_i)) alpha. Continuity means a map of condensed sets into the relatively discrete coefficient object; semisimplicity is the LP2 closed-orbit/G-complete-reducibility convention, not elementwise semisimplicity.

**Hypotheses and conventions.**

- L is an arbitrary algebraically closed Z_ell[sqrt(q)]-field.
- No good-prime or centre-component invertibility assumption.
- A is Schur in the condensed sense, without an additional compactness restriction.

**Proof or construction.**

1. Use the scalar excursion family with its exact two relations and prescribed projection.
2. Invoke all three clauses of LP2’s VIII.3.8: semisimple conjugacy classes, coarse-space points, and condensed character families are in bijection.
3. Continuity is the finite-anchor conclusion in VIII.3.8’s proof; LP2 owns its general-coefficient proof. Lafforgue 11.7/11.10 explains the anchor argument in characteristic zero.
4. Read each excursion coefficient via the resulting coarse point, then use the injectivity of classification to obtain uniqueness.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`
- `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`
- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`
- `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`

**Acceptance checks.**

- Reconstruction uses simultaneous tuple invariants; individual traces do not replace the theorem.
- Positive-characteristic continuity must not be justified using characteristic-zero Reynolds exactness.
- The output supplies no nilpotent monodromy operator or full local Langlands packet.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.4.1, p. 327: Its complete one-line proof, expanded through the existing supplier.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VIII.3.8 proof, p. 290: The finite-anchor continuity input; the full proposition was recovered and read.
- [Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), Proposition 11.7 and Lemma 11.10, pp. 143–147: Characteristic-zero source for the finite-anchor continuity argument, not a blanket proof in characteristic ell.

**Planet:** Continuous semisimple parameter.

### The parameter of an irreducible smooth representation

**Node:** `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`. **Suggested name:** `parameterOfRepresentation`. **Kind:** construction.

For b in B(G) and irreducible smooth pi of G_b(E), use the VS4 equivalence D(G_b(E),L) with D_lis(Bun_G^b,L) and the fully faithful left adjoint L_b=pi_b-sharp q_b^* to i_b^*. Its unit i_b^* L_b is the identity. The enriched condensed Schur theorem makes L_b(pi) Schur, and define phi_(G,b,pi)=phi_{L_b(pi)} as a conjugacy class. At b=1, L_b is j_! and write phi_pi. The common restricted excursion-centre action makes this independent of eligible embeddings.

**Hypotheses and conventions.**

- The sharp symbol denotes relative homology, not ordinary pushforward or a general i_b! functor.
- Admissibility for all irreducible smooth pi needs SR.3b; SR.3/SR.3a are complex-only and SR.6 is downstream of excursions.
- An eligible embedding is an enriched full-faithful stratum extension with the scalar-preserving retraction/comparison described in the next theorem; no claim is made for arbitrary embeddings.

**Proof or construction.**

1. Import VII.7.1–7.2 with their enrichment and invertible adjunction unit from VS4.
2. Apply the condensed Schur refinement on the actual representation category and transport its unit.
3. Apply the Schur-sheaf theorem and characterize the parameter by the restricted excursion character.
4. Use centre independence to compare extensions; the b=1 notation is the j_! special case.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`
- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`
- `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`
- `VStackSheavesAndLisseCategories:VS4`
- `mathlib:Representation.IntertwiningMap`
- `SmoothRepresentationsOfLocalGroups:SR.0`
- `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`
- `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`
- `VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint`

**Uses informing the API.**

- IX.7.1–IX.7.3: Provides phi_(G,b,pi) for comparing strata and parabolic induction.
- ES6 duality and characters: Apply the geometric parameter comparisons to the actual smooth representation.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `parameterOfRepresentation.eval` | characterisation | The parameter’s invariant character equals the scalar excursion character of pi. |
| `parameterOfRepresentation.defining_identity` | simp | The operator of a coefficient x on pi is scalar multiplication by its excursion character. |
| `parameterOfRepresentation.embedding_independent` | compatibility | Equal restricted excursion actions for eligible embeddings yield the same parameter class. |
| `parameterOfRepresentation.iso_invariant` | functoriality | A scalar-preserving equivariant representation isomorphism conjugates operators and hence preserves their scalar character and parameter class. |
| `parameterOfRepresentation.at_basepoint` | data | At b=1 this is classification of the excursion character evaluated through j_!. |

**Discriminating planned tests.**

| Name | Kind | Expected result |
| --- | --- | --- |
| `representation_basepoint` | compatibility | At the neutral stratum the parameter is reconstruction of the j_!-restricted excursion character. |
| `representation_same_centre` | characterisation | Two eligible extensions with the same restricted excursion action give the same parameter class. |
| `representation_trivial_group` | degenerate | For the trivial group with Q=1 and its one-dimensional irreducible L, the reconstructed parameter has value one at every Weil element, the unique section to the trivial dual group. |

**Acceptance checks.**

- For a trivial one-dimensional representation the construction still uses its equivariant endomorphism algebra.
- Compare two eligible extensions by equality of their restricted central action.
- All coefficient characteristics different from p are allowed, subject to the recorded supplier inputs.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VII.7.2, pp. 272–273: The source’s relative-homology left adjoint and unit; not an ordinary shriek pushforward.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.7.1, p. 334: The representation parameter is obtained by this stratum extension.

**Planet:** Parameter of a smooth representation.

### Centre independence of eligible stratum extensions

**Node:** `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`. **Suggested name:** `stratumCentreEmbeddingIndependence`. **Kind:** theorem.

Let R=i_b^* and let L and J be enriched fully faithful left and right stratum extensions with L adjoint to R adjoint to J and unit/counit retractions RL=RJ=id. The canonical comparison tau:L to J restricts to the identity. For any natural endomorphism z of the identity on D_lis(Bun_G,L), naturality along tau gives R(z_L)=R(z_J). The same argument compares extensions carrying such a retraction comparison. Thus all these eligible choices give the same degree-zero centre map, and hence the same excursion character and parameter.

**Hypotheses and conventions.**

- The common restriction of tau must be the specified invertible retraction; full faithfulness alone of unrelated functors is insufficient.
- Use the enriched comparison to retain condensed scalar information.
- The existence and lisse preservation of the eligible right extension are VS4 obligations, recorded explicitly.

**Proof or construction.**

1. Construct tau via the left/right adjunctions: L to JR L, identified with J using RL=id.
2. Apply naturality of z to tau and then R.
3. Identify R tau with the identity using the triangle identities; cancel it to identify restricted actions.
4. Apply scalar extraction and LP2 uniqueness to the excursion subalgebra.

**Direct prerequisites.**

- `mathlib:CategoryTheory.CatCenter`
- `mathlib:CategoryTheory.Adjunction`
- `VStackSheavesAndLisseCategories:VS4`
- `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`
- `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`
- `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`
- `VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint`

**Acceptance checks.**

- For an open neutral stratum compare j_! and its eligible right extension.
- Do not claim general pullback to a nonbasic stratum intertwines all Hecke functors.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.7.1, p. 334: The assertion is expanded as a formal adjunction/naturality argument; supplier existence is kept separate.

### Isomorphism invariance and conditional coefficient transport

**Node:** `ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`. **Suggested name:** `invarianceAndCoefficientTransport`. **Kind:** theorem.

Isomorphic Schur sheaves, or isomorphic irreducible smooth representations, have the same semisimple parameter class. If L to Lprime is an extension of eligible algebraically closed coefficient fields, the Hecke/operator base-change comparison holds, and A_Lprime remains Schur-irreducible, then phi_(A_Lprime) is the scalar extension of phi_A. For representations impose the same Schur/irreducibility hypotheses after extension. This proves a comparison conditional on those hypotheses; it does not assert their preservation.

**Hypotheses and conventions.**

- Coefficient structures and Q-actions are transported along the specified coefficient map.
- The relatively discrete scalar comparison must commute with the canonical units.

**Proof or construction.**

1. Use naturality to conjugate excursion endomorphisms under an isomorphism and recover equal scalar characters.
2. For coefficient extension use ES1’s operator comparison and HS coefficient-compatible kernels.
3. Use the retained Schur condition and LP0 coefficient functoriality to compare character evaluations, then LP2 uniqueness.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`
- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`
- `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`
- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/center-change-of-data`
- `LanglandsParameterStacks:LP0/functoriality-of-cocycles`

**Acceptance checks.**

- The identity extension gives the original parameter.
- Two successive eligible extensions give the same comparison as their composite.
- No proof uses commutation of arbitrary base change with all invariant rings.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.4.1, p. 327: The characterization forces these transport consequences when operators and scalar units are compatible.

## ES6

### The coefficient policy for centre and excursion diagrams

**Node:** `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`. **Suggested name:** `coefficientPolicyForFunctorialDiagrams`. **Kind:** comparison.

Every centre diagram below uses the existing map Z_spec(G,Lambda) to Z_geom(G,Lambda) under invertibility of |pi_0 Z(G)|, and imposes the analogous condition for every other group in the diagram. Without it, replace the spectral-centre input by the integral excursion algebra and compare excursion operators. Evaluating these diagrams on Schur objects over L gives all field-valued parameter assertions for every ell different from p. There is no appeal to ES3’s categorical spectral-action good-prime condition.

**Hypotheses and conventions.**

- Lambda is an eligible Z_ell[sqrt(q)]-algebra.
- An excursion variant is stated at the operator level; it is not an unconditional isomorphism of centres.

**Proof or construction.**

1. Import the IX.5.2 map from its exact ES1 node.
2. At each comparison perform the kernel and operator calculation, before converting it to a centre statement.
3. Use the exact ES1 excursion-only node when the invertibility assumption fails; the scalar-parameter theorem still applies.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`
- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`
- `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`

**Acceptance checks.**

- Check a characteristic dividing a centre-component order using operators, without asserting the unavailable centre map.
- No inverse of that component order appears in scalar extraction.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6 introduction, p. 330: The centre hypothesis is distinct from the unrestricted excursion/field conclusion.

## ES6:functoriality

### Compatibility with maps inducing adjoint isomorphisms

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`. **Suggested name:** `isogenies`. **Kind:** theorem.

For f:Gprime to G inducing an adjoint-group isomorphism, write dual f:Ghat to Gprimehat and pi:Bun_Gprime to Bun_G. For every A the centre action of Z_spec(Gprime) on pi^*A equals pullback of the Z_spec(G) action along the function map induced by dual f. Before scalar evaluation compare Hecke kernels via pi_H-sharp Sprime_Vprime = h_1^* pi-sharp Lambda tensor Sprime_V, where V is the dual pullback of Vprime. This gives pi-sharp T_Vprime(pi^*A)=T_V(A tensor pi-sharp Lambda). Any Schur constituent on which the induced excursion action is inherited has parameter dual f composed with phi_A.

**Hypotheses and conventions.**

- For centres use the coefficient policy for both groups; for scalar parameters use its excursion variant.
- Do not require pi^*A itself to be irreducible or Schur.
- A constituent means a subquotient in an eligible heart, or a direct summand with inherited scalar central action; no t-structure is invented on all D_lis.

**Proof or construction.**

1. Import HS4’s Bun/Hecke diagrams and GS4’s exact adjoint-isomorphism Satake naturality.
2. Factor pi_H through Hck_G times Bun_Gprime. Its first relative-homology pushforward sends the Satake kernel to the pulled-back kernel; apply the projection formula to the second map.
3. Compute the displayed functor identity using relative-homology base change. It is over the leg divisor space and natural in Vprime and I.
4. Compare creation, Weil action and annihilation under this identity, giving the algebra square.
5. Restrict the scalar action to the specified constituent and use the parameter characterization.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`
- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`
- `HeckeStacksAndLocalShtukas:HS4/isogeny-product-and-weil-restriction-diagrams`
- `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/adjoint-isomorphism-naturality`
- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`

**Acceptance checks.**

- The identity map gives the identity parameter comparison.
- Central multiplication Z times G to G has an adjoint isomorphism; Z to G alone generally does not.
- Retain the constituent hypothesis and the sharp functors.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.1 proof, pp. 330–331: The relative-homology kernel calculation precedes the equality of excursion operators.

**Planet:** Adjoint-isomorphism compatibility.

### Product compatibility of centres and parameters

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`. **Suggested name:** `products`. **Kind:** theorem.

For G=G_1 times G_2, Bun_G is the product. The tensor product Z_spec(G_1) tensor Z_spec(G_2) identifies with Z_spec(G), and the corrected square with Z_geom(G_1) tensor Z_geom(G_2) commutes. Over the same divisor-leg base, product Hecke kernels for external product representations are external products of the factor kernels. For Schur A_i and a Schur constituent of A_1 external-tensor A_2 with inherited scalar excursion action, its parameter is (phi_A1,phi_A2), with the common Weil projection.

**Hypotheses and conventions.**

- The tensor product of centres need not equal the entire geometric centre.
- Use the coefficient policy for each group.
- Compact exterior generators and their derived Hom comparison are imported from VS5/VII.7.10.

**Proof or construction.**

1. Import the HS4 product diagram and GS4 product naturality over the common leg space.
2. Check external-product kernels and operators on external Satake generators; pass to all representations using their generating operations.
3. Use VII.7.10 for the exterior generators/Hom comparison and LP2 invariant algebra product comparison to identify the spectral source.
4. Apply scalar-character uniqueness on the inherited constituent.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`
- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`
- `mathlib:TensorProduct`
- `HeckeStacksAndLocalShtukas:HS4/product-hecke-diagram`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/product-naturality`
- `VStackSheavesAndLisseCategories:VS5/lisse-kunneth`
- `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`

**Acceptance checks.**

- For G_m times G_m the two factor characters are recovered separately.
- The second top-right centre factor is G_2, not G_1; source finding E2 records the preprint typo.
- The kernel base is the common divisor-leg base, not independently varying leg bases.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.2 proof, p. 331: Expanded through the owned kernel and exterior-Hom interfaces; the display correction is recorded separately.

**Planet:** Product parameters.

### Weil restriction and nonabelian Shapiro comparison

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`. **Suggested name:** `weilRestriction`. **Kind:** theorem.

Let Eprime/E be finite separable, fix an embedding Eprime into a separable closure of E and the resulting W_Eprime inside W_E, and let G=Res_(Eprime/E)Gprime. There are compatible identifications of Bun, nonabelian cocycle quotient stacks and excursion algebras, and their centre-action square commutes. Choose a common W_E-normal open wild subgroup P inside W_Eprime so both quotients are defined; let Wprime be the inverse image of W intersected with W_Eprime/P. The parameter of Gprime is projection to the chosen dual factor after restriction of the parameter of G to W_Eprime; equivalently its Shapiro class is the parameter of G.

**Hypotheses and conventions.**

- Separable, not arbitrary finite, extension.
- Projection depends on the chosen Weil embedding, and another choice gives the corresponding conjugate comparison.
- The nonabelian comparison is not the pinned abelian Shapiro theorem.
- If Eprime has residue field of size q^f, its chosen square root is (sqrt(q))^f. The finite-etale leg map has degree [Eprime:E]; these two degrees are not identified.

**Proof or construction.**

1. Identify the bundles by extension of coefficient field and restriction of scalars, using the owned torsor geometry.
2. Prove the nonabelian Shapiro comparison on cocycles, not by the abelian baseline theorem. For Wprime inside W and Hprime with Wprime-action, use the coinduced group of f with f(hx)=h(f(x)), with W acting by right translation. Evaluation at 1 restricts a W-cocycle to Wprime. Choose left-coset representatives and write x=h_x r_x. From c on Wprime define a(w)(x)=h_x(c(h_x inverse h_(xw))). The cocycle law telescopes; changing representatives gives the usual coboundary. The two constructions are inverse up to conjugacy and commute with coefficient base change. For finite index this is a finite product of algebraic groups. Apply the natural constructions fppf-locally where torsors are trivial and glue by conjugacy, obtaining the quotient-stack comparison.
3. For each finite free group F_n to W, apply this comparison to F_n times_W Wprime. This subgroup has finite index, is free by the pinned subgroupIsFreeOfIsFree instance and is finitely generated by Subgroup.fg_of_index_ne_zero.
4. Use these finite free sources and their common refinements to obtain the cofinal excursion colimit comparison; no Schreier rank formula is needed.
5. Inflate a representation of the chosen Gprimehat semidirect W_Eprime through the dual-factor projection, then induce to Ghat semidirect W_E.
6. Import the closed Hecke immersion over Divprime to Div from HS4; its pushforward realizes the inflate/induce kernel. Compare the operators and reconstruct parameters.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`
- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`
- `mathlib:IsFreeGroup`
- `mathlib:Subgroup.fg_of_index_ne_zero`
- `mathlib:Subgroup`
- `LanglandsParameterStacks:LP0/functoriality-of-cocycles`
- `HeckeStacksAndLocalShtukas:HS4/weil-restriction-hecke-diagram`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-naturality`
- `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`
- `mathlib:subgroupIsFreeOfIsFree`

**Acceptance checks.**

- The degree-one extension gives identity.
- Different coset representatives give canonically equivalent Shapiro data.
- Specify P normal in the ambient Weil group, not merely open in its subgroup.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.3 proof, p. 332: Exactly the baseline input; its rank is irrelevant.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.3 proof, p. 332: The nonabelian finite-free-source excursion-colimit argument.

**Planet:** Weil restriction of parameters.

### The spectral centre of a torus

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`. **Suggested name:** `toriSpectralCenter`. **Kind:** theorem.

For an E-torus T, local reciprocity gives a natural isomorphism Z_spec(T,Lambda) with R_T=lim_K Lambda[T(E)/K], over open subgroups K. These quotient groups are discrete and need not be finite: for T=G_m and K=O_E-times they contain the infinite valuation quotient Z. The geometric category decomposes as the product over b in B(T)=pi_1(T)_Gamma of D(T(E),Lambda), and Z_geom(T,Lambda) is the corresponding product of R_T. The classical abelian-category centre description is imported from SR.1, not the complex Bernstein-block theorem.

**Hypotheses and conventions.**

- Use full local reciprocity, including wild p-primary equal-characteristic characters.
- The inverse limit is the compatible group-algebra completion, not a finite group-algebra approximation to all T(E).
- Induced-torus resolutions and their exactness belong to the proposed RG2.6 extension.
- Compact open pro-p K form a cofinal neighbourhood system, so they suffice in R_T; T(E)/K can still have an infinite valuation factor. The current BG1 classification is p-adic and needs its explicitly requested all-E specialization.

**Proof or construction.**

1. Use the BG torus classification and VS stratum equivalence for the geometric product.
2. Import SR.1’s centre as the inverse limit of idempotent Hecke corners; for the abelian group T(E) these identify with group algebras of quotients.
3. Resolve T by induced tori using the requested reductive-group input, keeping the exact sequence and dual maps.
4. Use product and Weil restriction to reduce to G_m and apply local reciprocity to the continuous cocycle/character functor.
5. Pass to coordinate algebras and the compatible K-completions. The missing full equal-characteristic reciprocity is a recorded gap, not supplied by a prime-to-p statement.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`
- `mathlib:MonoidAlgebra`
- `tauceti:TauCeti.ClassFieldTheory.Formation`
- `SmoothRepresentationsOfLocalGroups:SR.1`
- `BunGAndNewtonStrata:BG1/abelianization-identification`
- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`
- `ReductiveGroupsPartII:RG2.5`

**Acceptance checks.**

- For G_m the unramified quotient contributes Lambda[t,t^-1].
- Check norm compatibility for an induced torus and restriction to open K.
- No definition of the general Bernstein centre is duplicated here.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.4 proof, p. 333: The reduction uses separate reductive-group and reciprocity suppliers.

### The universal-coefficient two-leg torus operator

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`. **Suggested name:** `torusTwoLegCalculation`. **Kind:** theorem.

Let Lambda be a Z_ell[sqrt(q)]-algebra, ell different from p, and let K be any compact open pro-p subgroup of E-times. Put A_K=E-times/K and M_K=Lambda[A_K] with its left regular smooth E-times action. Define rec_geom(x)=Art_arith(x^-1): E-times to W_E^top-ab, and u(gamma)=rec_geom^-1 of the topological abelianization of gamma. On the sheaf corresponding to M_K in every physical line-bundle degree d, the excursion with two legs, Std external-tensor Std-dual, and tautological creation/evaluation is left translation by u(gamma_1)u(gamma_2)^-1: [x] maps to [u(gamma_1)u(gamma_2)^-1 x]. This equality holds on the module, naturally in Lambda and compatibly with quotient maps for K-refinement. For a smooth character chi over L its scalar specialization is chi(u(gamma_1)u(gamma_2)^-1).

**Hypotheses and conventions.**

- Topological abelianization is the quotient by the closure of the commutator. Geometric reciprocity is arithmetic Artin precomposed with inversion; rec_geom^-1 is its inverse function.
- Physical degree d means the bundle O(d). Its Kottwitz label is the opposite sign, by FS III.2, p. 91; a +1 Hecke position measures the first bundle relative to the second.
- The reusable Lubin–Tate cover and full equal-characteristic reciprocity are requested from their owners. The operator calculation below is an ES6 proof expansion from those interfaces, not an inference from field-valued characters.
- The prototype retains the arbitrary-ring regular representation, basis translation, faithfulness and transition identities. The geometric frame transport remains outside the pinned Lean carriers.

**Proof or construction.**

1. Use HS0 relative position and HS1 h_1-pullback/h_2-relative-homology: at fixed output M=O(d+1) the Std input is M(-D)=O(d+1)(-D), included canonically into M. Its source-frame torsor is P_D=Isom(O(-1),O(-D)), after tensoring by O(d+1). Both source and output automorphism groups are E-times. This is the dual of the O(D)-to-O(1) trivialization torsor (FS VI.1.6–VI.1.9, pp. 193–194; VI.2.2–VI.2.4, pp. 197–198; Fargues Remark 2.17, pp. 10–11).
2. A nonzero f in H0(O(1)) with divisor D defines phi_f:O(D) to O(1), carrying the canonical section to f. The input frame is q_f=phi_f-dual:O(-1) to O(-D); q_(a f)=a q_f. Thus the punctured Lubin–Tate cover BC(O(1)) minus zero is P_D with its scaling right action, not with that action inverted. Associated representation descent uses (q a,v) equivalent to (q,rho(a)v). Transport q to q a therefore acts as rho(a). All relative-position and frame signs are fixed before applying a character.
3. The height-one Lubin–Tate comparison identifies this cover with the universal cover over Div1 (FS II.2.2–II.2.4, pp. 60–61). Fargues Proposition 2.16, pp. 9–10 gives pi times canonical Frobenius descent. Passing to the residue-Frobenius equivariant cover uses its inverse pi^-1 times canonical descent, as in Proposition 3.3 proof, p. 13. Consequently arithmetic Frobenius transports the input frame by pi^-1. Inertia tau transports it by chi_LT(tau), with Art_arith^-1(tau)=chi_LT(tau)^-1. These generator actions determine the continuous abelian transport u=rec_geom^-1. This uses the cover action itself; Fargues’ Q_ell-character corollary is only a sign check.
4. The normalized torus Satake kernel has no dimension shift or half twist, since 2rho=0. Std changes physical degree d to d+1 and carries rho(u(gamma)); Std-dual changes it back and carries the inverse action. The independent-leg fusion and HS4 creation/annihilation triangles identify their two-leg operator with rho(u(gamma_1)u(gamma_2)^-1). The rank-one coevaluation followed by evaluation is identity, so no extra scalar or degree factor occurs.
5. Take rho to be the actual left regular representation on Lambda[E-times/K]. The preceding descent is Lambda-linear on every section and gives the displayed basis translation; extend by finite Lambda-linear sums. This establishes the operator without reducedness or a field hypothesis. Coefficient maps apply to coefficients only, and E-times/Kprime to E-times/K quotient maps carry [x] to [x]; both commute with translation. Specialize through a character only after establishing the regular-module identity.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`
- `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`
- `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`
- `HeckeStacksAndLocalShtukas:HS0/bounded-hecke-substacks`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `HeckeStacksAndLocalShtukas:HS4/creation-annihilation-and-triangles`
- `mathlib:Representation.leftRegular`
- `mathlib:MonoidAlgebra`
- `mathlib:MonoidAlgebra.mapDomainLinearMap`
- `mathlib:MonoidAlgebra.mapRingHom`
- `mathlib:MonoidAlgebra.mapDomainRingHom`

**Acceptance checks.**

- For every Lambda and d the diagonal gamma_1=gamma_2 acts as identity on M_K; reversing legs gives inverse translation.
- For unramified chi with chi(pi)=a, geometric Frobenius at the first leg gives a. Arithmetic Frobenius gives a^-1; a generic nontrivial valuation basis element distinguishes the two signs.
- For Lambda=F_ell[epsilon]/(epsilon^2), epsilon[1] is nonzero and is translated with its coefficient intact, although every homomorphism to a field kills epsilon.
- Check both Kprime-to-K quotient transport and arbitrary coefficient-ring transport. The quotient A_K is allowed to be infinite.
- The frame is Isom(O(-1),O(-D)), and scaling f scales this frame in the same direction; using the opposite frame convention must also invert the associated-representation convention.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.2.2–II.2.4, pp. 60–61; III.2, p. 91; VI.1.6–VI.1.9, pp. 193–194; VI.2.2–VI.2.4, pp. 197–198; IX.6.5 proof, p. 333: The universal cover and first-versus-second bundle convention supply the geometry. The explicit universal-coefficient regular-module derivation above expands the brief torus proof.
- [Simple connexité des fibres d’une application d’Abel-Jacobi et corps de classe local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf), Proposition 2.16, pp. 9–10; Remark 2.17, pp. 10–11; Proposition 3.3 proof, p. 13: The ideal-sheaf frame torsor, pi Frobenius descent and its inverse on the residue-Frobenius cover fix the transport sign. The argument here uses the torsor action before coefficient specialization.

### The diagonal torus centre map

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`. **Suggested name:** `toriDiagonalEmbedding`. **Kind:** theorem.

Under the spectral isomorphism with R_T and the geometric identification Z_geom(T,Lambda)=product_(b in B(T)) R_T, the map Z_spec(T,Lambda) to Z_geom(T,Lambda) sends r to the constant tuple (r)_b. Consequently phi_chi on every torus stratum is the usual torus parameter with the specified reciprocity normalization. This is an equality of the actual centre actions and their coordinates, not merely agreement on one chosen character.

**Hypotheses and conventions.**

- For a torus its centre is connected, so the centre-component hypothesis is automatic.
- The entire B(T) product, not only the neutral stratum, occurs.

**Proof or construction.**

1. Resolve by induced tori using the requested exact resolution and dual maps. Apply the adjoint-isomorphism comparison to descent and the product/Weil-restriction comparisons to reduce to G_m. No disconnected-centre cover is involved.
2. For G_m evaluate the spectral action on the compact generator M_K=Lambda[E-times/K] at physical degree d. The stratum is open and closed, so its extension is compact by VS4. ES1 objectwise finite-wild factorization gives a sufficiently small normal wild P through which this action factors; refine P so its reciprocity image H is contained in K.
3. The torus cocycle coordinate algebra of the finite-wild piece is Lambda[E-times/H], by full reciprocity and the trivial conjugation action. Its unramified valuation factor remains Laurent; the algebra is generated over Lambda by the group elements. The torus has trivial torsion in dual pi_1, so the excursion presentation is an isomorphism here, with no universal-homeomorphism or nilpotent ambiguity.
4. For each gamma the two-leg datum (gamma,1) acts on M_K by left multiplication by [u(gamma)] modulo K, by torus-two-leg-calculation. Surjectivity of reciprocity supplies every group generator; linearity and multiplication identify the entire finite-piece action with the quotient Lambda[E-times/H] to Lambda[E-times/K]. This step uses compact factorization before algebraic generation and does not assume generation of an inverse limit as an ordinary algebra.
5. Under the SR.1 centre-coordinate identification, a centre element r_K acts on the regular module by multiplication by r_K. This action is faithful because r_K times [1]=r_K, including nilpotents. Thus the action just computed determines exactly the K-coordinate of the spectral-centre image in degree d. K-compatibility gives the completed coordinate R_T, and independence of d gives the constant B(T)-tuple. The induced-torus descent returns the asserted equality for every T.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`
- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`
- `BunGAndNewtonStrata:BG1/abelianization-identification`
- `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`
- `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`
- `SmoothRepresentationsOfLocalGroups:SR.1`

**Acceptance checks.**

- For G_m, B(T)=Z, and every degree factor receives the same r.
- Check the full centre action rather than only its evaluation on irreducible characters; characters need not detect all integral nilpotents.
- Use finite-wild compact factorization before generation; no density assertion about generators of the completed ring replaces this step.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.5, p. 333: The diagonal conclusion is derived from the universal-coefficient kernel calculation, compact finite-wild factorization (IX.5.1–IX.5.2, pp. 327–329), and faithful regular quotient coordinates, without testing only field characters.

**Planet:** Diagonal torus centre map.

### Central characters for a connected centre

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`. **Suggested name:** `centralCharacters`. **Kind:** theorem.

If Z=Z(G) is connected, it is a torus. For irreducible smooth pi with central character omega_pi, the composite of phi_pi with the dual map Ghat to Zhat is the usual parameter of omega_pi. The correct adjoint-isomorphism map is multiplication Z times G to G. Pulling pi back along it identifies its scalar central action with omega_pi external-tensor pi; combine this with the product parameter and torus comparison.

**Hypotheses and conventions.**

- Z to G by itself does not induce an adjoint-group isomorphism.
- Use the excursion version if ell divides a relevant centre-component order.
- Smooth central characters and the irreducible scalar action are imported from the representation-theoretic supplier.

**Proof or construction.**

1. Use Schur’s lemma to identify the central action with a smooth character.
2. Construct multiplication and its Weil-equivariant dual map through the reductive-group/Satake supplier.
3. Apply adjoint-isomorphism compatibility to multiplication and product compatibility to the external representation.
4. Identify the Z-coordinate using the diagonal torus theorem and cancel the unchanged G-coordinate.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/adjoint-isomorphism-naturality`
- `ReductiveGroupsPartII:RG2.5`

**Acceptance checks.**

- For G=T the statement is the torus result.
- For a connected-centre group the central dual projection, not restriction of the primal parameter, is used.
- This proof does not depend on the ES7 parabolic theorem.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6 closing paragraph, p. 333: Pins the two actual maps, correcting the checkpoint’s Z to G error.

**Planet:** Central-character compatibility.

### Twisting by characters of the abelianization

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`. **Suggested name:** `twisting`. **Kind:** theorem.

Let a:G to D=G/G_der and chi be a smooth L-times character of D(E). For irreducible smooth pi, phi_(pi tensor chi composed with a) is phi_pi multiplied by the central cocycle dual a composed with phi_chi. In L-group notation multiply only the Ghat-valued cocycle part, retaining the same Weil projection. Equivalently this is composition of the product parameter with the dual of the graph map G to G times D.

**Hypotheses and conventions.**

- The dual torus Dhat maps centrally into Ghat.
- The two cocycles share the prescribed Weil projection and use its action; do not multiply their Weil components.

**Proof or construction.**

1. Apply the product theorem to pi external-tensor chi.
2. Apply the adjoint-isomorphism theorem to g mapped to (g,a(g)).
3. Use the torus normalization to identify the twisting cocycle, and centrality to check its cocycle identity.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`
- `LanglandsParameterStacks:LP0/functoriality-of-cocycles`
- `ReductiveGroupsPartII:RG2.5`

**Acceptance checks.**

- The trivial character leaves the parameter unchanged.
- Successive twists compose by multiplying central cocycles.
- No use of ES7 parabolic induction is needed.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6 closing paragraph, p. 333: The graph map and the central dual twisting cocycle.

### Pseudo-z-embeddings and z-embeddings

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`. **Suggested name:** `ZEmbedding`. **Kind:** definition.

Over a p-adic field F, a pseudo-z-embedding is an injective morphism G to Gz of connected reductive F-groups such that C=Gz/G is a torus, H1(F,C)=1 and H1(F,Z(G)) to H1(F,Z(Gz)) is bijective. It is a z-embedding if Z(Gz) is connected and C is an induced torus. Kaletha constructs it by embedding the diagonalizable centre in a torus T with induced quotient and the same H1, then taking Gz=G times_Z T. The injective z-embedding is distinct from a surjective z-extension with induced-torus kernel and simply connected derived group.

**Hypotheses and conventions.**

- Kaletha’s source is p-adic; a uniform claim for arbitrary equal-characteristic E is not justified by this citation.
- The cohomological bijection is essential: SL_n to GL_n is not a z-embedding in the cited p-adic setting.
- These definitions and their application-level construction belong here; foundational z-extensions and induced-torus resolutions belong to proposed RG2.6.
- In the source’s p-adic range centre cohomology is Galois cohomology. A conditional analogue over arbitrary E would require flat H1 for a nonsmooth centre, the stated bijection, and the rational/open-factorization interfaces; existence in that range is not asserted.

**Proof or construction.**

1. Use the existing reductive/multiplicative-type carriers and the requested finite local cohomology input.
2. Embed Z(G) in T0, split the quotient over F1, and choose a finite extension whose norm kills its finite H1 image using local reciprocity.
3. Take the fibre-product torus T and verify the centre H1 bijection; push out G along Z(G) to T.
4. From injectivity on centre H1 prove Z(Gz)(F) to C(F) surjective, hence Gz(F)=Z(Gz)(F)G(F).
5. Extend a smooth character omega of the closed subgroup Z(G)(E) inside the locally profinite abelian group T(E)=Z(Gz)(E) as follows. Choose compact open U in T(E) with U intersect Z(G)(E) contained in ker(omega). The character descends to the subgroup Z(G)(E)U/U of the discrete abelian group T(E)/U. IsAlgClosed.exists_pow_nat_eq gives divisibility of L-times. After the additive type tag, AddCommGrpCat.injective_of_divisible and CategoryTheory.Injective.factorThru extend the character to that discrete quotient; inflate the extension. This gives a smooth extension for any algebraically closed L, including characteristic ell. Define pi_z(z i(g))=omega_z(z) pi(g); agreement on the intersection makes it well-defined. The p-adic multiplication quotient T(E) times G(E) to Gz(E) is open (its algebraic map is smooth), so the open stabilizers of pi and omega_z give smoothness. Subspaces stable under pi_z are exactly those stable under pi, so irreducibility is preserved.

**Direct prerequisites.**

- `ReductiveGroupsPartII:RG2.5`
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `mathlib:MonoidHom`
- `mathlib:Subgroup`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`
- `mathlib:IsAlgClosed.exists_pow_nat_eq`
- `mathlib:AddCommGrpCat.injective_of_divisible`
- `mathlib:CategoryTheory.Injective.factorThru`

**Uses informing the API.**

- Kaletha Corollary 5.3 and Fact 5.5: Reduce central-character questions over p-adic fields to connected centre while retaining rational-point control.
- ES6 disconnected-centre comparison and ES7 parabolic: Compare the representation extensions and their parameters; no new general local Langlands theory is assumed.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ZEmbedding.ofMaps` | constructor | Bundle the injection and torus quotient with the full scheme and cohomological conditions; the prototype bundles only its rational exactness and central lifting. |
| `ZEmbedding.quotient_inclusion` | simp | The quotient is one on the included G. |
| `ZEmbedding.central_lift` | data | Each c in C(F) has a lift in Z(Gz)(F). |
| `ZEmbedding.rational_factorization` | characterisation | Every x in Gz(F) can be written z times i(g) with central z and g in G(F). |
| `ZEmbedding.extend_representation` | compatibility | A chosen smooth central-character extension agreeing on the intersection gives a smooth representation of Gz(F) restricting to pi; its formula on z i(g) is the central scalar times pi(g). |

**Discriminating planned tests.**

| Name | Kind | Expected result |
| --- | --- | --- |
| `zembedding_identity` | degenerate | For a connected-centre reductive group, its identity with quotient one is a z-embedding; its rational-point inclusion is the identity. |
| `zembedding_product` | computation | For connected-centre G and induced torus C, the inclusion G to G times C and projection to C give a z-embedding and central lifts (1,c). |
| `zembedding_requires_central_lifting` | non-example | A proposed rational quotient not surjective on the centre cannot be the rational-point data of a pseudo-z-embedding. |

**Acceptance checks.**

- Check both quotient/cohomology conditions, not merely connected centre and torus quotient.
- Only pseudo-z-embeddings are asserted to be transitive (Fact 5.4).
- An extension of a central character is a choice whose effect must be compared, not declared canonical.
- The smooth-character extension uses a discrete quotient and divisibility of L-times; extending abstract characters without first choosing U would not prove smoothness. No complex absolute value or characteristic-zero root-of-unity argument is used.

**Source support in own words.**

- [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2), Definition 5.1 and Proposition 5.2, p. 17: The full definition includes all preceding pseudo-z conditions.
- [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2), Fact 5.5, p. 19: Fact 5.5 gives rational central factorization and the subsequent paragraph uses complex characters. The arbitrary-algebraically-closed-L smooth extension is proved separately above through a discrete quotient.

**Planet:** Z-embeddings.

### The disconnected-centre reduction and choice comparison

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`. **Suggested name:** `zEmbeddingCentralCharacterComparison`. **Kind:** theorem.

For any local E for which an injective connected-centre comparison G to Gz is supplied with a torus quotient, centre flat-H1 bijection, rational central factorization and its open quotient topology, extend pi by a smooth L-valued central-character extension as constructed in z-embedding. Its connected-centre parameter projects to phi_pi by the adjoint-isomorphism theorem, and comparison on the included rational centre recovers omega_pi. Two extensions differ by a smooth character of C(E); twisting cancels their difference on G. Common pseudo-z refinements with the same rational and open-factorization properties compare embedding choices. Kaletha proves existence of these data for p-adic E. This conditional comparison does not realize the arbitrary-local-field existence target, which remains partial; no connected-centre surjective cover is asserted.

**Hypotheses and conventions.**

- Smooth extension over any algebraically closed L follows from the preceding discrete-quotient/divisibility proof. Smoothness of the difference on C(E) uses the open quotient T(E) to C(E); common refinements must have the same topology and lifting properties.
- Disconnected Z(G) is not treated as an E-torus with an ordinary torus L-parameter. Central data means its actual scalar character, compared through the injective p-adic z-embedding.
- Do not deduce a global compatibility from a single chosen extension without the twisting/common-refinement argument.
- For the conditional arbitrary-E statement, the connected centre of Gz is required to be a torus; scheme-theoretic connectedness alone need not imply smoothness in characteristic p.

**Proof or construction.**

1. Use the rational central-factorization lemma to extend pi; irreducibility is preserved because the extra factors act centrally.
2. Apply the connected-centre theorem to Gz and the adjoint-isomorphism theorem to G to Gz.
3. The ratio of two extended central characters is trivial on Z(G)(E), hence descends through the surjective open quotient T(E) to C(E). It is smooth on C(E). Apply the twisting theorem for this quotient-torus character and restrict back to G, where the twist is trivial.
4. Over p-adic E, use Kaletha Fact 5.6: the pushout G1 times_Z(G) Z(G2) is a common pseudo-z refinement. Each quotient is the other original quotient torus; Facts 5.4–5.5 give the needed cohomology and central rational surjectivity. Its centre is a torus; extend characters along the closed centre inclusions by the same discrete-quotient argument. Apply both adjoint-isomorphism comparisons and twisting cancellation. For a conditional all-field comparison include these refinement hypotheses explicitly.
5. The unresolved all-field existence cannot be replaced by Kaletha’s finite norm-kernel construction: for E=F_q((t)) and the flat Kummer sequence for mu_p inside G_m, H1_fppf(E,mu_p)=E-times/(E-times)^p is infinite. No open subgroup of E-times is contained in the pth powers, since every principal-unit neighbourhood contains 1+t^n with p not dividing n. A finite separable norm image is open by Conrad Lemma 4.1.2(i), p. 19, so it cannot kill this entire connecting image. More decisively, H1(E,T) is finite for every E-torus T by Conrad Proposition 4.1.7(i), p. 22. Thus no torus T can give the required flat-H1 bijection for a centre with this infinite mu_p cohomology. The centre of SL_(p r), for r greater than one prime to p, also has this nonsmooth mu_p part and a disconnected mu_r part, so this is relevant to the general centre target. Since mu_p(E) is trivial, the obstruction does not itself disprove central-character compatibility; it blocks that transfer of Proposition 5.2 and leaves a different comparison argument to be found. A new valid all-field argument remains required.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`
- `ReductiveGroupsPartII:RG2.5`
- `SmoothRepresentationsOfLocalGroups:SR.2`

**Acceptance checks.**

- For connected centre the identity embedding gives the earlier result.
- A quotient character changes the extended parameter but does not change the descended data.
- No general centre-character parameter for a disconnected finite-type group is silently defined.
- Use the flat Kummer mu_p example to reject a blind p-adic norm-kernel transfer. A remedy must specify the actual rational centre character statement and deal with nonsmooth centres, rather than rename an impossible cover.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6 closing paragraph, p. 333: The cited Kaletha section supplies injective p-adic z-embeddings, not a connected-centre surjective cover. The source terminology is recorded in E5; no all-field conclusion is inferred.
- [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2), Facts 5.4–5.6 and representation-extension paragraph, pp. 19–20: Existence and common-refinement assertions are used only in their p-adic range. The smooth modular character extension and the flat Kummer obstruction are separate arguments, not results attributed to the complex representation paragraph.
- **Conrad-finiteness**, Remark 1.2.1, pp. 3–4; Lemma 4.1.2(i), p. 19; Proposition 4.1.7(i), p. 22: Flat torsor cohomology is the convention for nonsmooth centres. Norms from finite separable extensions have open image, and torus H1 is finite. These inputs distinguish the characteristic-p obstruction from a missing proof of the p-adic construction.

## ES6:duality

### Chevalley compatibility for Bernstein–Zelevinsky duals

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`. **Suggested name:** `bernsteinZelevinskyDuals`. **Kind:** theorem.

The existing spectral-to-geometric centre map intertwines the spectral involution induced by the pinned Chevalley automorphism with the involution induced by Bernstein–Zelevinsky duality. If both A and D_BZ(A) are Schur and the duality is defined in the required category, phi_(D_BZ A)=theta composed with phi_A up to Ghat-conjugacy. More generally a Schur cohomological constituent with inherited scalar central action has that parameter. On irreducible smooth representations use the classical BZ comparison with its shifts, rather than assume the dual complex is a representation in degree zero.

**Hypotheses and conventions.**

- The actual Satake switch is Chevalley up to Ad(rhohat(-1)); the inner automorphism disappears only after conjugacy quotient.
- Use the coefficient policy for the centre square and its excursion variant for unrestricted L.
- Import the compact/reflexive domain and extension of BZ duality on D_lis at the actual coefficients from VS5. Its existing bernstein-zelevinsky-duality node states the étale compact result; the lisse extension and its enriched-centre action are requested separately and remain a gap.

**Proof or construction.**

1. Import ES4’s duality/centre square, HS1’s dual Hecke identity and GS4’s exact Chevalley comparison.
2. Reverse creation and annihilation under duality and compare the Weil action through the switch; this pulls back the invariant coefficient by theta.
3. Keep the rhohat(-1) inner correction until passing to conjugacy classes.
4. Use scalar-character uniqueness for the dual object or inherited Schur constituent.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`
- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`
- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`
- `ExcursionOperatorsAndSpectralAction:ES4/duality-and-the-chevalley-involution`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/chevalley-involution`
- `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`
- `VStackSheavesAndLisseCategories:VS5/lisse-bernstein-zelevinsky-duality`
- `VStackSheavesAndLisseCategories:VS5`

**Acceptance checks.**

- For a torus Chevalley is inversion and dual characters invert.
- The compact BZ dual may carry a cohomological shift; it must not be identified with a degree-zero smooth dual without further input.
- The spectral-centre supplier is an explicit prerequisite.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.5.3 proof, p. 330: The centre involutions and parameter consequence.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.12.1 proof, p. 241: The rank-one sign calculation explains the inner rho(-1) correction.

**Planet:** Chevalley duality of parameters.

### Chevalley compatibility for smooth contragredients

**Node:** `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`. **Suggested name:** `smoothDuals`. **Kind:** theorem.

For every irreducible smooth L-representation pi of G(E), its smooth contragredient pi-vee is irreducible and phi_(pi-vee)=theta composed with phi_pi up to Ghat-conjugacy. For supercuspidals this follows from the BZ comparison (with its shift accounted for). In general it is a late return using ES7’s parabolic-induction parameter theorem and SR.2’s contragredient/induction dictionary. The twist of the Levi inclusion and all modulus conventions are retained.

**Hypotheses and conventions.**

- Admissibility is the all-coefficient supplier input, including characteristic ell.
- Use ES7’s unnormalized induction statement with its explicitly twisted Levi inclusion; do not silently replace it by normalized induction.
- This stage is downstream of ES7:parabolic; the early functoriality nodes here never depend on this return.

**Proof or construction.**

1. Apply BZ compatibility in the supercuspidal case, using the supplier’s agreement with the smooth dual up to shift.
2. Use supercuspidal support and realize pi as an irreducible subquotient of an eligible induction.
3. Take smooth duals using the existing induction/duality comparison, tracking the opposite parabolic and modulus factor.
4. Apply ES7’s parameter theorem to both induced sides; use the Chevalley compatibility of the twisted Levi inclusions to identify the two conjugacy classes.

**Direct prerequisites.**

- `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`
- `ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`
- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`
- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`
- `VStackSheavesAndLisseCategories:VS5`
- `VStackSheavesAndLisseCategories:VS5/lisse-bernstein-zelevinsky-duality`

**Acceptance checks.**

- For a character of G_m, phi_(chi^-1)=phi_chi^-1.
- The duality graph remains acyclic by keeping this result downstream of ES7.
- The proof covers irreducible subquotients, not only a socle or cosocle.

**Source support in own words.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.5.3 proof, p. 330: The source explicitly requires the ES7 induction theorem.

**Planet:** Smooth contragredient parameters.

## Pinned baseline and prototype boundaries

The baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The declaration statements were read at those pins; a name index served only to locate them. The scoped reviewed library audit records these stages as not built. Upstream AdicSpaces and InductionRestriction provide the density models; ClassFieldTheory layer 9 fixes the normalization and its actual field range.

| Declaration | Module | Supply and limitation |
| --- | --- | --- |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` | A monoid homomorphism G to the algebra of linear endomorphisms of a module; smoothness, admissibility and irreducibility are additional representation-theoretic inputs. |
| `mathlib:Representation.IntertwiningMap` | `Mathlib/RepresentationTheory/Intertwining.lean` | Equivariant linear maps between representations, including the endomorphism algebra used in the global-point prototype. This does not prove Schur’s lemma. |
| `mathlib:MonoidHom` | `Mathlib/Algebra/Group/Hom/Defs.lean` | Bundled group homomorphisms, their composition, products, kernels and ranges. A parameter also needs the prescribed projection, semisimplicity and condensed continuity from LP0/LP2. |
| `mathlib:AlgHom` | `Mathlib/Algebra/Algebra/Hom.lean` | Algebra homomorphisms, for excursion characters and all centre comparison diagrams. |
| `mathlib:Condensed` | `Mathlib/Condensed/Basic.lean` | C-valued sheaves on CompHaus for its coherent topology. This supplies condensed algebras when C is AlgCat; it supplies neither animated enhancement nor D_lis. |
| `mathlib:AlgCat` | `Mathlib/Algebra/Category/AlgCat/Basic.lean` | The category of associative R-algebras and algebra homomorphisms, used as values of the actual condensed scalar and endomorphism algebras. |
| `mathlib:CategoryTheory.IsIso` | `Mathlib/CategoryTheory/Iso.lean` | Invertibility of the scalar unit in the category of condensed algebras; Schur irreducibility is this property of a specified unit, not a chosen abstract algebra equivalence. |
| `mathlib:CategoryTheory.CatCenter` | `Mathlib/CategoryTheory/Center/Basic.lean` | Natural endomorphisms of the identity of an ordinary category. The enhanced degree-zero centre and its comparison are owned by ES0. |
| `mathlib:Module.End` | `Mathlib/Algebra/Module/LinearMap/End.lean` | Linear endomorphism rings. Equivariant endomorphisms, rather than all linear endomorphisms, enter Schur’s lemma for a representation. |
| `mathlib:CategoryTheory.Adjunction` | `Mathlib/CategoryTheory/Adjunction/Basic.lean` | Unit/counit adjunctions; the enriched stratum adjunction and its invertible unit remain a VS4 input. |
| `mathlib:TensorProduct` | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | Algebraic tensor products; this is the algebraic substrate of the product-centre diagram, not an exterior-product theorem for sheaves. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | Group algebras of arbitrary discrete quotient groups T(E)/K; no finiteness of those quotients is assumed. |
| `mathlib:Subgroup` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Subgroups including the finite-index free subgroup in the excursion-colimit comparison. |
| `mathlib:IsFreeGroup` | `Mathlib/GroupTheory/FreeGroup/IsFreeGroup.lean` | A group with a free basis. The subgroup instance is supplied by Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean, read together with this definition. |
| `mathlib:Subgroup.fg_of_index_ne_zero` | `Mathlib/GroupTheory/Schreier.lean` | A finite-index subgroup of a finitely generated group is finitely generated. Together with Nielsen–Schreier this supplies exactly the finite-generation/freeness input of IX.6.3; no rank formula is needed. |
| `mathlib:groupCohomology.coindIso` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean` | Abelian Shapiro cohomology in all degrees. The nonabelian cocycle/quotient-stack comparison in IX.6.3 is stronger and is planned at its use here, not identified with this declaration. Retained as a background contrast only, not a proof prerequisite of nonabelian Shapiro. |
| `tauceti:TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean` | A TopRep object with discrete module topology and open stabilizers. It does not supply admissibility, scalar endomorphisms or a sheaf equivalence. |
| `tauceti:TauCeti.SmoothDiscreteTopRep` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean` | The full subcategory of smooth discrete TopRep objects. Derived enhancement and the arbitrary-coefficient Bernstein centre are imported from their respective owners. |
| `tauceti:TauCeti.ClassFieldTheory.Formation` | `TauCeti/NumberTheory/ClassFieldTheory/Formation/Basic.lean` | The smooth discrete integral coefficient carrier for class formations. This is existing class-field-theory infrastructure, not the local Artin reciprocity isomorphism needed for tori. |
| `mathlib:subgroupIsFreeOfIsFree` | `Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean` | For a subgroup H of a group G with IsFreeGroup G, gives IsFreeGroup H, with no finite-index hypothesis. Combined with Subgroup.fg_of_index_ne_zero it supplies the finite free subgroup used in IX.6.3. |
| `mathlib:Representation.leftRegular` | `Mathlib/RepresentationTheory/Basic.lean` | The actual left regular representation on MonoidAlgebra R A, induced by left multiplication, for a semiring R and monoid A; no finite quotient hypothesis. |
| `mathlib:MonoidAlgebra.mapDomainLinearMap` | `Mathlib/Algebra/MonoidAlgebra/Module.lean` | Pushforward of finitely supported coefficients along a map of index sets. It sends single a r to single (f a) r, so supplies quotient-transition transport for regular modules. |
| `mathlib:MonoidAlgebra.mapRingHom` | `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean` | Coefficient-ring transport R[A] to S[A], sending single a r to single a (f r), for a ring homomorphism f. |
| `mathlib:MonoidAlgebra.mapDomainRingHom` | `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean` | The group-algebra ring homomorphism induced by a monoid homomorphism. It supplies quotient-coordinate transitions; coefficients remain unchanged. |

| `mathlib:IsAlgClosed.exists_pow_nat_eq` | `Mathlib/FieldTheory/IsAlgClosed/Basic.lean` | Over an algebraically closed field every element has an nth root for n greater than zero. For a unit the root is nonzero, giving divisibility of the multiplicative unit group in every characteristic. |
| `mathlib:AddCommGrpCat.injective_of_divisible` | `Mathlib/Algebra/Category/Grp/Injective.lean` | An additive abelian group divisible by the integers is an injective object of AddCommGrpCat. Apply the additive type tag to the multiplicative group of coefficient-field units. |
| `mathlib:CategoryTheory.Injective.factorThru` | `Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean` | Given an injective target, a morphism to it extends along any monomorphism; comp_factorThru states that restriction equals the original morphism. This is the discrete character extension, not a smoothness theorem. |

The suggested file gives planning signatures and examples with placeholder proofs. Its arbitrary-ring regular-action fragment strengthens the earlier character-only torus signature. It explicitly checks basis translation, quotient/coefficient transport and faithful multiplication on a nonzero square-zero coefficient. Compilation checks signatures, not the missing geometry.

| Suggested interface | Precisely what the prototype retains | Conditions left out because their carriers/interfaces are unavailable |
| --- | --- | --- |
| IsSchurIrreducible and its API | Invertibility of a specified morphism of actual condensed L-algebras, sectionwise scalar uniqueness, and invariance under a unit-compatible isomorphism. | The choice of relatively discrete L and the identification of the other condensed algebra with the enhanced degree-zero endomorphisms of a sheaf. The shift API takes its endomorphism isomorphism as input. |
| condensedSchurOfAdmissible | Composition of explicit condensed scalar and endomorphism comparison isomorphisms, with equality to the scalar unit. | The smooth/admissible/irreducible representation, fixed-vector argument, derived stratum category and enriched adjunction producing those isomorphisms. |
| excursionCharacter and its API | Actual algebra homomorphisms, inverse scalar transport, finite-family evaluations and their stated reindexing/multiplication equalities; condensed factorization through the scalar unit; equality on algebra generators. | The integral excursion presentation, Q-linearity and the identification of the algebraic families with geometric excursion operators. The inverse-pair example takes the imported relation as an equality. |
| abstractSemisimpleParameter and parameterOfSchurSheaf | An explicit imported reconstruction/evaluation pair, with existence and conjugacy uniqueness under an explicit separation condition. | Semisimplicity, the specified Weil projection, continuity, invariant quotient-stack carriers and the actual LP2 reconstruction theorem. The prototype does not define any of these by an unnamed predicate. |
| parameterOfRepresentation and its API | A Mathlib Representation, its equivariant endomorphism algebra, excursion action, scalar algebra equivalence and explicit reconstruction map. | Smoothness, admissibility, irreducibility and the geometric stratum equivalence/adjunction. The explicit classifier chooses a representative; the full output is its conjugacy class. The basepoint and trivial-group tests retain only their global algebraic consequences. |
| stratumCentreEmbeddingIndependence | Naturality of an actual category-centre element along a comparison of ordinary functors, with explicit restriction retractions. | The enhanced D_lis categories, construction of these functors by the geometric adjunctions, and identification with the excursion action. |
| invarianceAndCoefficientTransport | An actual coefficient-field extension square of ring homomorphisms and its naturality equation for imported reconstruction maps. | Geometric coefficient base change and preservation of the Schur condition; the prototype does relate different fields. |
| coefficientPolicyForFunctorialDiagrams and isogenies | Evaluation of an explicit commuting square of algebra homomorphisms. | The coefficient component-order condition, Bun/Hecke geometry and the relative-homology kernel theorem which establishes that square. |
| products and weilRestriction | Product of actual group homomorphisms, and restriction followed by a chosen dual-factor projection. | Common Weil projection and semisimplicity, quotient-stack Shapiro, cofinal excursion colimits, product kernel geometry and inflate/induce Satake comparison. |
| toriSpectralCenter and toriDiagonalEmbedding | Conversion of a bijective algebra homomorphism to an algebra equivalence; equality of regular group-algebra actions on basis elements, propagated by linearity and detected on the unit. | The inverse limit of completed group algebras, geometric components and the reciprocity/kernel calculation proving the maps have those properties. |
| torusTwoLegCalculation | Translation by the specified reciprocity inverse on an actual arbitrary-ring left regular representation, its basis formula, inverse-pair identity, and compatibility with quotient and coefficient transport. | Lubin–Tate geometry and the endpoint/associated-sheaf inversions. The proof plan computes that endpoint sign, while its geometric carrier is still omitted from Lean. |
| centralCharacters and twisting | Composition with a central dual map, and multiplication of a group homomorphism by a cocycle with genuinely central image in the untwisted group fragment. | Reductive dual/root data, the Weil semidirect product and its action, the graph/multiplication kernel comparisons, and identification with the representation parameter. |
| ZEmbedding and its API | An exact rational-point sequence with injective inclusion, surjective quotient and surjective restriction of the quotient to the actual group centre. Representation extension uses an actual character and its scalar compatibility on the intersection. | Reductive schemes, connected centre, induced quotient torus, H¹ conditions, topology and smoothness. The identity/product tests are rational-point fragments; connectedness of the algebraic centre is not asserted for an arbitrary abstract group. |
| zEmbeddingCentralCharacterComparison | Cancellation on the included centre of the difference of two extensions by a quotient character. | The connected-centre parameter comparison, common pseudo-z refinement, geometry of centre inclusions, and the general-field z-extension route. |
| bernsteinZelevinskyDuals and smoothDuals | An imported Chevalley pullback equation on characters and its reconstruction naturality. | The actual duality functor, enriched dual kernel, shifts, smooth contragredient, supercuspidal support and ES7's parabolic proof. |

The four definition/construction nodes have 22 API items and 12 unit tests. Every named declaration, API item and test appears in the suggested file. Its examples use actual condensed algebras, algebra homomorphisms, representations or exact group maps where those exist at the pins. None replaces missing geometry by an empty structure or an uninterpreted proposition.

## Sources and version scope

The five public source PDFs below were read and their hashes reproduced on 2026-10-08. Locators use the identified author/preprint pagination. The independent review’s arXiv-v4 collation and public published-sample records are retained with their original 2026-10-07 provenance; this revision does not claim to have read the full published FS volume. No source excerpts are stored.

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Laurent Fargues, Peter Scholze. Author-hosted 356-page preprint; locators below use its printed pages, which equal PDF pages. Separately collated with arXiv:2102.13459v4 (27 November 2024); not the 2026 published pagination. Read 2026-10-08; SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
  - II.2.1, pp. 58–61: the height-one Lubin–Tate universal cover, O(1) sections and the E-times torsor on Div1.
  - III.2, p. 91; VI.1.6–VI.1.9, pp. 193–194 and VI.2.2–VI.2.4, pp. 197–198: degree versus Kottwitz sign, completed lattices, and first-bundle relative position.
  - VI.12.1 and its complete proof, pp. 239–241: switching, Chevalley and the rho(-1) sign.
  - VII.7.1–VII.7.2 and proofs, pp. 271–273; VII.7.9–VII.7.10, pp. 275–276: stratum equivalence, relative-homology left adjoint and exterior Hom comparison.
  - VIII.3.7–VIII.3.8 with all three clauses and both relations, pp. 288–290; VIII.4 and VIII.4.3, pp. 290–293.
  - IX.1–IX.2, pp. 320–323: condensed enhancement and relative-homology Hecke operators.
  - IX.4–IX.6, pp. 327–333, including complete proofs of IX.6.1–IX.6.5. IX.6.2 display visually checked and compared with arXiv v4.
  - IX.7.1, p. 334: centre restriction to strata and assertion of embedding independence; IX.7.3, pp. 337–338: the parabolic input to smooth duality.
- [Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), Vincent Lafforgue. arXiv:1209.5352v10, 10 January 2018; J. Amer. Math. Soc. 31 (2018), 719–891. Locators are preprint pages. Read 2026-10-08; SHA-256 `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295`.
  - Proposition 11.7 and proof, pp. 143–147, including Lemma 11.10: finite anchors, uniqueness, multiplicativity and the characteristic-zero continuity argument. The local general-coefficient character theorem is imported from LP2, not re-planned from the global application.
- [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2), Tasho Kaletha. arXiv:1502.00650v2; published J. Eur. Math. Soc. 20 (2018), 61–101. Locators are preprint pages. Read 2026-10-08; SHA-256 `067aa7999a96980da07ebf90ab5cf7b30819a34235460c0818ad6d96dae2cfb3`.
  - Section 5.1, pp. 16–20: Definition 5.1, Proposition 5.2, Corollary 5.3 and Facts 5.4–5.9, with proofs, common refinements and the complex representation-extension paragraph. The field here is p-adic; the modular extension below is a separate argument.
- [Simple connexité des fibres d’une application d’Abel-Jacobi et corps de classe local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf), Laurent Fargues. Author-hosted preprint cdc.pdf; published Ann. Sci. Éc. Norm. Supér. (4) 53 (2020), 89–124. Proposition numbers and pages below are those of this author copy. Read 2026-10-08; SHA-256 `35c7268fd6ce086f1267a00c18e02900c87ed5da65781d3b8695644d6e8fef73`.
  - Section 2.3, Proposition 2.16 and Remark 2.17, pp. 8–11: universal-cover torsor, ideal-sheaf frames and Frobenius descent.
  - Propositions 3.1 and 3.3 with proof, pp. 12–13: the Weil dictionary and inverse-character/inverse-Artin normalization.
  - Section 5.2, p. 18: geometric reciprocity; Section 6.1, pp. 18–19: explicit equal-characteristic universal-cover geometry. This does not transfer the paper’s Q_ell local-system arguments to arbitrary coefficients.

- [Finiteness theorems for algebraic groups over function fields](https://math.stanford.edu/~conrad/papers/cosetfinite.pdf), Brian Conrad. Author-hosted 84-page manuscript cosetfinite.pdf; locators use its printed pages. Read 2026-10-08; SHA-256 `a1b909e7fdaaf56a21811e0379c9370ae8e9e51e75e047c6f1db927e278fca3c`.
  - Remark 1.2.1, pp. 3–4: the flat cohomology convention. Lemma 4.1.2 and proof, p. 19: openness of smooth surjections on rational points. Proposition 4.1.7 and proof, p. 22: torus H1 finiteness, used to test the all-field comparison interface.

**Retained source issues.** The independent verdicts and source-version limits are unchanged. Each record describes the source in our own words.

- **ExcursionOperatorsAndSpectralAction/E2** (misprint, FS author-hosted 356-page PDF and arXiv:2102.13459v4, Proposition IX.6.2 display, p. 331; not checked in the full 2026 published edition.): Z geom (G1 , Λ) ⊗Λ Z geom (G1 , Λ) Correction: The second factor is the geometric centre for G2. Reason: The product is G1 times G2. The canonical factor map and the very next parameter sentence distinguish the two factors. Visual examination of the author PDF and separate collation with arXiv v4 show this is present in the display, not an extraction artifact. Effect: nothing.
- **ExcursionOperatorsAndSpectralAction/E3** (misprint, FS author-hosted 356-page PDF and arXiv:2102.13459v4, Proposition IX.6.2, parameter consequence, p. 331. Full published passage unavailable.): A1 , A2 ∈ Dlis (BunG , L) Correction: A_i lies in D_lis(Bun_(G_i),L), for i=1,2. Reason: The external product A1 external-tensor A2 is an object on Bun_(G1) times Bun_(G2)=Bun_G. Both factors on Bun_G would give an object on Bun_G times Bun_G and parameters for the wrong groups. The author PDF was visually checked and arXiv v4 collated. Effect: nothing.
- **ExcursionOperatorsAndSpectralAction/E4** (misprint, FS author-hosted 356-page PDF and arXiv:2102.13459v4, proof of IX.6.1, paragraph following the factorization of pi_H, p. 331. Full published passage unavailable.): The source uses a map G → G′ giving isomorphisms between the adjoint groups. Correction: The group morphism has direction Gprime to G; its dual has direction Ghat to Gprimehat. Reason: The theorem starts with Gprime to G. It induces the printed Grassmannian map Gr_Gprime to Gr_G and the pushforward comparison. The prose reverses that morphism while the displayed geometric maps have the correct direction. Visual inspection and arXiv v4 collation confirm the prose. Effect: nothing.
- **ExcursionOperatorsAndSpectralAction/E5** (misprint, IX.6 closing paragraph, author PDF and arXiv v4 p. 333; full published passage not read): The source invokes z-extensions and cites [Kal18, Section 5]. Correction: Use injective z-embeddings as defined in Kaletha §5.1, with its p-adic hypotheses. Reason: Kaletha Definition 5.1 and Corollary 5.3 construct an injection into a group with connected centre. A surjective z-extension with torus kernel and simply connected derived group is a different object and does not guarantee connected centre. The citation and intended application identify the nomenclature slip; extension beyond the p-adic field range is a separate blueprint gap. Effect: nothing.
- **ExcursionOperatorsAndSpectralAction/E6** (misprint, VII.7.10 compact exterior-product clause, author PDF and arXiv v4 p. 276; full published passage not read): A1 ⊠ A2 ∈ D_et(Bun_G,Λ) Correction: The compact exterior product and generators are in D_lis(Bun_G,Λ). Reason: The preceding displayed functor has D_lis source and target and the inputs are arbitrary compact lisse objects. The theorem proves compact generation of this lisse category for general Λ; an étale-torsion target cannot replace it. This is the carryover label from the parallel torsion Proposition V.7.2. Effect: nothing.

## Remaining owner requests and coverage

The former HS4 kernel request, VS5 lisse Kunneth request and LP2 abstract-action request are supplied by current nodes and removed. Compact lisse BZ and the plain lisse left adjoint are now imported directly; only their exact enrichment/domain refinements remain. The torus regular-module calculation and modular smooth-character extension are explicit local proof plans. The all-field disconnected-centre existence target remains the mathematical block.

### Gap 1: All-coefficient admissibility supplier

The current SR.0 defines admissibility and SR.3/SR.3a prove complex results; they do not supply the modular theorem. SR.6 is downstream. Create the proposed independent SR.3b and read Vignéras II.2.8 before treating this input as closed. Qbar_ell is uncountable; the countable-field issue is Fbar_ell.

Needed by: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`.

### Gap 2: Enriched noncompact Schur and stratum adjunction interfaces

Current VS4 explicitly supplies the lisse stratum equivalence and L_b left adjoint with invertible unit. The remaining requested interfaces are scalar-preserving condensed enrichment, the admissible fixed-vector endomorphism comparison and eligible right-extension/retraction comparison, including noncompact representations.

Needed by: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`.

### Gap 3: Foundational induced-torus and z-extension scope extension

No existing RG2.5 node plans induced-torus resolutions or z-extension existence. Confirmed finding 10 calls for a new foundational RG2.6, with BG/ET consumers outside this issue’s allowed paths. The proposal here routes that need and does not make a nonexistent stage into a prerequisite.

Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`.

### Gap 4: Full equal-characteristic reciprocity

The upstream ClassFieldTheory document fixes normalization, but its equal-characteristic endpoint excludes wild p-primary norm/existence theory. The torus theorem for all E needs that full reciprocity interface. Request a Part II for the missing range; retain upstream layer 9 only for the interface it actually states.

Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`.

### Gap 5: Reusable Lubin–Tate cover interface

RF3 supplies line-bundle signs only. Its Part II must expose the coefficient-free punctured universal cover, ideal-sheaf frame torsor and Frobenius transport stated in the RF3 Part II request. The local ES6 endpoint/sign and arbitrary-Lambda regular-module proof is now explicit; this gap records the absent owner interface, not an uncomputed sign.

Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`.

### Gap 6: Arbitrary-local-field disconnected-centre comparison

Smooth central-character extension for algebraically closed modular L is now proved through a compact-open discrete quotient. The remaining target is an unconditional all-E comparison with valid nonsmooth-centre flat cohomology and rational/open-factorization data, or another argument proving the same central-character compatibility. Kaletha section 5 supplies only p-adic existence. Over F_q((t)), the connecting image for mu_p inside G_m is E-times/(E-times)^p and cannot be killed by a finite separable norm subgroup. Since torus H1 is finite (Conrad Proposition 4.1.7(i), p. 22), no torus-centre embedding can have the required full flat-H1 bijection in this example. A different argument for the rational central character is required. The conditional comparison does not supply an all-field existence proof; the stage remains partial.

Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`.

### Gap 7: Prototype geometric conditions unavailable at the pins

The suggested file elaborates actual condensed algebra and representation/algebraic interfaces. Animated categories, the geometric kernel identities, semisimplicity, the full prescribed Weil projection, relatively discrete continuity, reductive z-embedding/cohomology conditions and smoothness of extensions are omitted. Its classifier and kernel comparisons are explicit imported maps/equations, not implementations of the full theorems. Replace those fragments with exact owner interfaces when available.

Needed by: `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`, `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`, `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`, `ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`, `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`, `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`, `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`.

### Gap 8: Abstract discrete-group supplier generality

The current LP2 abstract action/presentation is group-agnostic and includes the ordinary-category version; that older request is discharged. The arbitrary-discrete-W classifier with prescribed Q-projection and closed-orbit uniqueness remains requested from LP2; its current classifier is local-Weil.

Needed by: `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`.

### Gap 9: Enriched duality and its domain

Current VS5 supplies compact lisse BZ duality for integral/rational relative-discrete Lambda. Condensed mapping compatibility, its enhanced-centre involution, and the exact extension/domain for noncompact Schur inputs remain requested and must match ES0; the plan does not define BZ duality twice.

Needed by: `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`, `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`.

### Exact supplier requests

1. **`SmoothRepresentationsOfLocalGroups:SR.0`**. The actual arbitrary-coefficient smooth representation category, its irreducible objects, scalar unit and central characters, compatible with the pinned SmoothDiscreteTopRep carrier.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`.
2. **`SmoothRepresentationsOfLocalGroups:SR.2`** (scope extension). Add foundational SR.3b after SR.2: all-coefficient irreducible admissibility and scalar endomorphisms (Vignéras II.2.8 for characteristic ell; uncountability/Dixmier for characteristic-zero Z_ell-fields). Complex SR.3/SR.3a and downstream SR.6 are insufficient. Supply the arbitrary-coefficient duality/induction dictionary. For the central-character application expose the reusable smooth extension lemma for a closed subgroup of a locally profinite abelian group: choose a compact open U killing the restricted character, extend on the discrete quotient using divisibility of L-times, then inflate. Its proof is given in the ES6 application; modular existence is no longer an unresolved mathematical assertion.
   Proposed owner: `SmoothRepresentationsOfLocalGroups:SR.3b`.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`, `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`.
3. **`VStackSheavesAndLisseCategories:VS4`**. Refine the current strata-are-classifying-stacks and lisse-stratum-left-adjoint nodes with condensed enrichment: the existing L_b=pi_b-sharp q_b^* and invertible unit must preserve the scalar unit and identify mapping objects for noncompact representations. Supply eligible right extensions/retraction comparisons where defined. The plain lisse adjunction and compact generation are already supplied and imported directly.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`.
4. **`HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`**. IX.1.2 and the fixed-vector evaluation comparison needed to identify the condensed equivariant endomorphisms of an admissible smooth pi with relatively discrete L, without assuming pi is compact.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`.
5. **`LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`**. Specify the exact two VIII.3.8 relations, prescribed Q-projection and maps of condensed sets for arbitrary algebraically closed Z_ell-fields. Audit the characteristic-ell finite-anchor continuity argument separately from Lafforgue’s characteristic-zero Reynolds step; the local theorem is the unique supplier.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`.
6. **`SmoothRepresentationsOfLocalGroups:SR.1`** (scope extension). Arbitrary-coefficient abelian-category Bernstein centre and its inverse limit of pro-p idempotent Hecke corners, as in confirmed finding 9; for an abelian locally pro-p group identify these with Lambda[T(E)/K]. SR.3’s complex Bernstein blocks are not the supplier.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`.
7. **`ReductiveGroupsPartII:RG2.5`** (scope extension). Proposed foundational RG2.6 after RG2.5: z-extensions with induced-torus kernel and simply connected derived group, induced-torus resolutions, functorial pi_1 and the compatible dual maps. RG2.5 currently supplies only dual/root data. Keep the z-embedding definition in ES6; do not claim RG2.5 already proves any z-extension existence theorem. This foundational surjective z-extension input does not replace the injective connected-centre comparison and is not evidence for an all-field route in ES6.
   Proposed owner: `ReductiveGroupsPartII:RG2.6`.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`.
8. **`BunGAndNewtonStrata:BG1/abelianization-identification`**. The torus specialization B(T)=pi_1(T)_Gamma and all degree components, compatible with the already supplied torsor and stratum equivalences; give the maps used by torus resolutions.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`.
9. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`** (scope extension). Consume the fixed arithmetic Artin and topological Weil abelianization interfaces in their stated field range; supply the consumer conversion rec_geom=Art_arith composed with inversion. Full equal-characteristic wild p-primary reciprocity lies beyond the upstream prime-to-p endpoint and needs a ClassFieldTheory Part II, not a re-plan of upstream layers.
   Proposed owner: `ClassFieldTheoryPartII:full-equal-characteristic-reciprocity`.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`.
10. **`RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`** (scope extension). Extend the relative period-geometry direction with FS II.2.2–II.2.4 (pp. 60–61): the height-one Lubin–Tate universal cover as punctured H0(O(1)), the E-times torsor on Div1 identified with Isom(O(-1),O(-D)), and pi times canonical descent/inverse pi^-1 residue-Frobenius transport (Fargues 2.16/2.17, pp. 9–11; 3.3 proof, p. 13). The ES6 proof computes its Hecke endpoint and regular-module action from these interfaces; RF3 currently supplies only line-bundle signs. The interface must be coefficient-free so its associated-module descent applies to arbitrary Lambda.
   Proposed owner: `RelativeFarguesFontainePartII:Lubin-Tate-torsor`.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`.
11. **`ReductiveGroupsPartII:RG2.5`** (scope extension). For the p-adic injective construction expose diagonalizable centres, central pushouts, finite centre H1 and norm kernels of Kaletha 5.2, including open rational quotient maps and common refinements. The conditional arbitrary-E comparison must use flat H1 for nonsmooth centres and establish its own lifting/refinement interfaces. The mu_p flat Kummer example over F_q((t)) prevents transfer of the finite norm-kernel construction; no all-field existence theorem or connected-centre surjective cover is requested as if already valid.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`.
12. **`LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`**. Supply the discrete arbitrary-W variant used in VIII.4.3: prescribed Q-projection, algebraically closed Z_ell-field coefficients, closed-orbit/complete-reducibility convention and conjugacy uniqueness from all tuple invariants. The current node is a condensed local-Weil statement; its generalization must be stated and proved separately in LP2.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`.
13. **`VStackSheavesAndLisseCategories:VS5`**. Refine the current lisse-bernstein-zelevinsky-duality node with condensed mapping-object compatibility and its induced enhanced-centre involution; state explicitly the domain/extension used for noncompact Schur objects and representation constituents. Compact lisse BZ duality for relative-discrete Lambda is now directly supplied, so no new copy of VII.7.6 is requested. Coordinate this remaining enrichment/domain request with ES0.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`, `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`.

### Coverage

| Stage | Status | Remaining work |
| --- | --- | --- |
| `ExcursionOperatorsAndSpectralAction:ES5` | planned | Close SR.3b admissibility and the enriched fixed-vector/stratum-adjunction supplier requests. Refine the exact LP2 continuity interface and replace omitted geometric prototype conditions. State the exact arbitrary-discrete-W LP2 classifier variant requested by VIII.4.3; its abstract action is already supplied. |
| `ExcursionOperatorsAndSpectralAction:ES6` | planned | Resolve the requested supplier interfaces used by each excursion/centre comparison. |
| `ExcursionOperatorsAndSpectralAction:ES6:functoriality` | partial | Current HS4 pre-evaluation diagrams and VS5 lisse Kunneth are imported directly; implement their supplier plans with their stated coefficient/enrichment conventions. Create the RG2.6 and period-geometry extensions; supply BG1 all-E torus classification and full equal-characteristic reciprocity. Implement the coefficient-free Lubin–Tate owner interface used by the explicit universal-coefficient operator/sign proof. Establish an unconditional arbitrary-local-field disconnected-centre comparison. The conditional comparison and p-adic existence do not realize this target; the nonsmooth flat Kummer obstruction rules out the attempted norm-kernel transfer. |
| `ExcursionOperatorsAndSpectralAction:ES6:duality` | planned | Supply the all-coefficient admissibility and contragredient/induction dictionary, respecting the late ES7 return. Replace the prototype duality character equations by the actual enhanced duality interfaces. Refine the supplied compact lisse BZ theorem with condensed mapping compatibility, the enhanced-centre involution and the precise noncompact domain. |

## Structural and red-team obligations

- **Foundational admissibility before excursion parameters** (new-layer): Implement confirmed RT-AREA-geomlanglands/8 with its verified correction: SR.3b after SR.2 owns Vignéras admissibility for characteristic ell and scalar endomorphisms; ES5 owns the condensed refinement. SR.6 must not be a supplier and Qbar_ell must not be described as countable.
- **Foundational z-extensions and induced-torus resolutions** (new-layer): Implement the verified RT-AREA-geomlanglands/10 division: proposed RG2.6 owns surjective z-extensions, induced-torus resolutions and functorial pi_1; ES6 keeps injective z-embeddings with the correct Kaletha citation. BG1/BG2/ET0 and the routed arithmetic Part II are consumers to update in their own jobs.
- **Exact spectral-centre inputs for both ES6 children** (missing-links): Confirmed RT-AREA-geomlanglands/7 is realized here by explicit prerequisite references to ES1:spectral-center/spectral-to-geometric-center-map for functoriality and duality. The same finding’s ES2/ES4/ES7 stage-edge changes are outside the allowed files.
- **Full equal-characteristic local reciprocity** (part-ii): Upstream ClassFieldTheory layers 8–9 remain unchanged. Their arithmetic normalization is consumed with an inversion adapter. Full equal-characteristic wild reciprocity exceeds the documented upstream endpoint and should be a ClassFieldTheory Part II; it is not a new normalization theory.

RT-AREA-geomlanglands/7 is handled by exact ES1 spectral-map prerequisites in both ES6 children and the coefficient policy; ES2/ES4/ES7 atlas changes belong to their own jobs. Finding /8 routes modular admissibility to independent SR.3b and keeps the condensed refinement here. Finding /10 distinguishes foundational surjective z-extensions/induced resolutions from injective p-adic z-embeddings; a standard z-extension is never claimed to have connected centre. Finding /9 puts the arbitrary-coefficient abelian Bernstein centre in SR.1.

There are 13 planets, at most six per layer. The preserved review is not an acceptance of this revision. The mathematical block is stated in the partial coverage row and the handoff; successful artifact checks do not change that status.
