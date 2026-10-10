# Commutative algebra for deformation theory and patching

## R03.2. Representability and obstruction algebra

A deformation problem assigns a set of objects to each Artinian coefficient algebra. A complete local ring is useful for that problem only when its maps into those algebras recover the objects naturally. This layer provides the algebra connecting that requirement to tangent spaces, minimal power-series presentations and obstruction spaces. It also constructs representing rings for fixed-basis matrix problems, including continuous profinite representations under an explicit finiteness hypothesis.

The main relation bound concerns a hull, not just a universal ring. It says that a complete natural obstruction space bounds the number of relations in a tangent-minimal presentation of the hull. The proof uses an actual finite Artinian test extension, so it never evaluates an Artinian-only functor at an infinite complete quotient. A principal-unit orbit example shows why a smooth tangent-bijective hull cannot be treated as a representing object. Fixed-basis matrix functors retain their matrices, while orbit functors retain only equivalence classes; their different pullback behavior is visible in elementary rings.

This is the algebraic layer. GlobalGaloisDeformations:R04.2 and LocalGaloisDeformationRings:R08.1 identify their arithmetic tangents and obstruction spaces and establish their group finiteness conditions. Galois cohomology, arithmetic local conditions, framed/unframed dimension comparisons and patching are supplied by those roadmaps. General Artinian deformation functors, the definitions of hulls and the Schlessinger criterion belong to SchemeAndStackFoundations:SF.4. The present layer transports those objects to the coefficient conventions of R03.1 and builds the additional presentation algebra.

### Coefficients, maps and tangent conventions

Fix a commutative complete Noetherian local ring Λ and a specified surjective residue map ρ:Λ→k, with kernel m_Λ, where k is a field. Completeness means maximal-ideal completeness and separation. The field need not be finite except in the continuous profinite construction. Every coefficient object A is a commutative local Λ-algebra with a specified surjection A→k whose kernel is m_A and whose restriction to Λ is ρ. A morphism is a Λ-algebra homomorphism preserving these maps to the same labelled field k. Changing the identification of a residue field is not part of a morphism.

Artinian objects form the coefficient category C_Λ. Complete objects form its complete Noetherian counterpart. Morphisms between complete objects are continuous for their maximal-ideal topologies, as established in R03.1. A map into an Artinian object factors through a positive maximal-ideal quotient, because the target maximal ideal is nilpotent. Thus the represented functor h_R on C_Λ has h_R(A) equal to the actual labelled Λ-algebra maps R→A. Its covariance in A is composition. This does not introduce a second notion of continuous coefficient map.

For a complete object R define its relative cotangent

m_R / (m_R² + m_Λ R).

The tangent T(h_R) is its k-linear dual, equivalently Der_Λ(R,k), equivalently h_R(k[ε]/ε²). The quotient is relative to the coefficient base: m_R/m_R² alone would include coefficient directions. For Λ a complete DVR and R=Λ, the relative tangent is zero, although the absolute maximal-ideal cotangent has dimension one. A presentation of k over that same Λ has no variable directions but can still have the nonzero coefficient relation π.

All functors to sets used in the criterion are pointed deformation prefunctors with F(k) a singleton. The tangent T_F is F(k[ε]/ε²), with the k-vector-space structure supplied by the imported square-zero comparison. The distinguished zero is obtained from the unique residual object via k→k[ε]/ε². It is not an arbitrary vector-space structure placed on a set of lifts.

A principal small extension B→A is a surjective coefficient map whose kernel is a nonzero one-dimensional k-vector space annihilated by m_B. A socle extension has the same annihilation condition but allows any finite kernel dimension, including zero. Principal small extensions test smoothness, since R03.1 factors every Artinian surjection into such extensions. General socle extensions are necessary for one obstruction tensor containing all relation directions at once. An isomorphism is a socle extension with zero kernel; it is not a principal small extension.

### The imported criterion, with its quantifiers

For coefficient maps A′→A and A″→A, write P=A′×_A A″ for the actual Artinian ring pullback supplied by R03.1. The comparison is

F(P) → F(A′) ×_{F(A)} F(A″).

SchemeAndStackFoundations:SF.4 supplies these conditions in Schlessinger's conventions:

- H1: this comparison is surjective whenever A″→A is a principal small extension and A′→A is arbitrary.
- H2: this comparison is bijective whenever A=k and A″=k[ε]/ε², for every coefficient map A′→k.
- H3: the resulting tangent vector space T_F has finite k-dimension.
- H4: for every principal small extension A′→A, the self-pullback comparison F(A′×_A A′)→F(A′)×_{F(A)}F(A′) is bijective.

H1, H2 and H3 are equivalent to the existence of a hull: a complete coefficient ring R and a natural transformation h_R→F which is smooth and tangent bijective. Smooth means that every pair consisting of a point of h_R(A) and a point of F(B) compatible over F(A) has a compatible point of h_R(B), for every Artinian surjection B→A. With H4 the functor is prorepresentable, meaning h_R→F is a natural isomorphism. A hull is not required to be pointwise injective.

These are imported results, not a second construction of SF.4's functor theory. Transport must preserve the residue-labelled morphisms, the chosen dual-number object and the ring pullbacks, so that it transports the actual comparison maps as well as their truth values. The complete categories agree in the classical setting. The broader Stacks setting admits a residue-field extension and an extra map Der_Λ(k,k)→T_F. In the setting here Λ→k is surjective, so every Λ-derivation of k is zero. The extra injectivity condition of Stacks Theorem 18.2 is automatic, and its statement about miniversality on derivation orbits becomes the usual tangent-bijective hull statement.

The formal element of a hull is the compatible family of points over R/m_R^a for positive a. A transformation from h_R is determined by that family: every map R→A factors through a sufficiently deep quotient, and naturality evaluates the corresponding point. A map between hull pairs is required to carry their formal elements. Such pairs admit a compatible ring isomorphism, but it need not be unique. Two prorepresenting pairs admit a unique compatible isomorphism. Neither statement asserts that an underlying ring has no automorphisms after its formal element is forgotten.

Schlessinger, §2, Definition 2.7 and Proposition 2.9, pp. 211–212, and Theorem 2.11 with proof, pp. 212–215, give the classical distinctions. Stacks Lemma 12.2, p. 35, Theorem 15.5 and Remark 15.6, pp. 46–47, and Theorem 18.2, p. 55, give the augmented-category formulation. Source locators below identify the mathematics used by each target; the targets are organized by their dependencies, rather than by the order of any one source.

### Ownership and prerequisite boundary

| Supplier | Input used here |
| --- | --- |
| DeformationAndDerivedPatchingAlgebra:R03.1 | Labelled coefficient categories, continuous maps, actual Artinian pullbacks, quotient towers, relative cotangent/derivation duality, finite-variable series evaluation and presentation, complete quotients, positive truncations and formal smoothness |
| SchemeAndStackFoundations:SF.4 | Classical deformation functors, H1–H4, hulls, the Schlessinger criterion and the general natural obstruction interface |
| TauCetiRoadmap/ProfiniteProPGroups, Layer 0 | Closed normal quotients and compatible inverse limits of profinite groups |
| TauCetiRoadmap/ProfiniteProPGroups, Layer 3 | Maximal pro-p quotients, their characteristic kernels and factorization, and finite topological generation |
| TauCetiRoadmap/ProfiniteProPGroups, Layer 4 | The existing free profinite group on a finite set and its continuous universal property |
| Pinned Mathlib and Tau Ceti | Native power series, ideal-module quotients, tensor products, matrix units, free groups, Nakayama, Artin–Rees and derivation/dual-number lifts |

The generic continuous framed representing algebra is owned by this layer. The universal-lifting-ring target of GlobalGaloisDeformations:R04.2 consumes it and supplies the arithmetic specialization, rather than providing a prerequisite upward to this layer. Free profinite groups and maximal pro-p quotients remain with ProfiniteProPGroups. Their actual carriers and universal properties are imported; there is no second free-group roadmap hidden in the matrix construction. R03.1 continues to own the ring categories and their topology.

### Required obstruction interface

For a functor F, a complete natural obstruction theory here consists of a k-vector space O and, for every socle extension e:B→A with kernel I and every x∈F(A), an element ob(e,x)∈O⊗_k I. It must satisfy both of the following requirements:

1. ob(e,x)=0 if and only if x has a lift in F(B).
2. For every commuting square of socle extensions with upstairs map B→B′ and downstairs map A→A′, whose induced kernel map is u:I→I′, the tensor (id_O⊗u)(ob(e,x)) equals ob(e′,F(A→A′)(x)).

The induced kernel map is k-linear with the residue labels fixed. This includes quotients by k-linear subspaces of I, so it includes every nonzero contraction I→k. A theory specified only on principal small extensions, or only as a zero/nonzero detector without the tensor and kernel maps, does not provide this interface. The general interface belongs to SF.4; the relation bound below takes it as an explicit supplier input. The obstruction construction from a minimal presentation instantiates it with O=E*, where E is the relation space.

Pullback of the theory along a smooth transformation h_R→F preserves completeness. Indeed, if the image of a point R→A has a lift in F(B), smoothness produces a compatible represented lift R→B. The converse follows by applying the transformation. Naturality of the pulled-back tensor follows directly from that of the original tensor. This argument uses a specified point and its compatibility square; it cannot be replaced by the assertion that some object above A has some lift.

The targets below give the algebraic constructions, their APIs and examples. Declaration names are proposed library names in the namespace TauCeti.DeformationAlgebra. API tables give mathematical statements, while the companion suggested file gives typed signature candidates. The reader specification remains definitive.

### Target 1. Coefficient categories and the imported representability criterion

In the classical residue-field setting, the R03.1 categories Coeff.Artinian and Coeff.Complete are equivalent to the classical specializations of SF.4 ArtinLocalAlg and CompleteLocalAlg. A labelled ring map A→k becomes the corresponding surjective Λ-algebra augmentation; its kernel is m_A. The equivalences preserve small extensions, split square-zero objects, Artinian fibre products along a surjection, and positive quotient towers. Transport identifies h_R(A) with the residue-preserving Λ-algebra maps R→A, T(h_R) with Der_Λ(R,k) and with the k-dual of m_R/(m_R²+m_ΛR). Thus this relative tangent is finite for every complete coefficient object. Under this transport, SF.4 supplies H1–H4, the hull criterion H1+H2+finite tangent, the prorepresentability criterion adding H4, hull uniqueness by an isomorphism preserving the formal element, and the unique such isomorphism for prorepresenting pairs. These are imports, not additional Schlessinger theorems.

Construction and proof.

Convert a labelled quotient into an algebra augmentation by residue_algebraMap. Conversely the kernel of a surjection from a local ring to a field is its unique maximal ideal. Both composites preserve actual ring carriers and maps, giving category equivalences.

Use the universal property of the actual equalizer fibre product in R03.1, not a product of underlying functor values. Preservation of the augmentation makes the same pullback supply SF.4 comparison maps.

Transport h_R and the dual-number object. Tau Ceti derivationToDualNumberEquivLift identifies the actual fibre of the projection on algebra homomorphisms with derivations; R03.1 cotangent-dual-derivations identifies this with the relative cotangent dual. Do not substitute the absolute Mathlib CotangentSpace in mixed characteristic.

Import Schlessinger Theorem 2.11 through SF.4/schlessinger-theorem. The finite tangent hypothesis is on F; it cannot be deduced from an arbitrary functor having values in sets. Hull maps need not be injective. In the broader Stacks residue-field setting one also needs injectivity of Der_Λ(k,k)→T_F. Here Λ→k is surjective, so every Λ-derivation of k is zero and that condition is automatic.

For a prorepresenting pair, use the formal-element Yoneda correspondence and the positive Artinian quotient tower for uniqueness of the compatible map. For hulls use SF.4/hull, which only gives existence of a compatible isomorphism.

Named results: `coefficientEquivalence`, `tangentEquivRelativeDual`. Their statements are the target above.

Acceptance.

- For Λ=Z_p and R=Λ, the relative tangent is zero although m_R/m_R² has k-dimension one.
- For R=Λ[[X₁,…,X_d]], T(h_R) is k^d.
- No finite-residue-field assumption enters the criterion.
- An equivalence of coefficient categories must preserve the formal elements as well as the isomorphism class of each ring.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.1/labelled-local-algebra`, `DeformationAndDerivedPatchingAlgebra:R03.1/residue-preserving-morphism`, `DeformationAndDerivedPatchingAlgebra:R03.1/artinian-coefficient-category-and-small-extensions`, `DeformationAndDerivedPatchingAlgebra:R03.1/complete-local-coefficient-category`, `DeformationAndDerivedPatchingAlgebra:R03.1/artinian-pullback`, `DeformationAndDerivedPatchingAlgebra:R03.1/artinian-quotient-limit`, `DeformationAndDerivedPatchingAlgebra:R03.1/cotangent-dual-derivations`, `DeformationAndDerivedPatchingAlgebra:R03.1/relative-cotangent-finite`, `SchemeAndStackFoundations:SF.4/artinian-coefficient-category`, `SchemeAndStackFoundations:SF.4/deformation-functor`, `SchemeAndStackFoundations:SF.4/hull`, `SchemeAndStackFoundations:SF.4/schlessinger-theorem`, `tauceti:TauCeti.derivationToDualNumberEquivLift`.

Sources: [Schlessinger1968](https://math.uchicago.edu/~amathew/schlessingerdef.pdf), §1 pp. 208–210; §2 Notation 2.6, Definition 2.7 and Proposition 2.9 pp. 211–212; Lemma 2.10 and Theorem 2.11 with proof pp. 212–215. Classical coefficient categories, tangent identification, hulls and both representability criteria, including the compatible-isomorphism distinction. [StacksFormal](https://stacks.math.columbia.edu/download/formal-defos.pdf), §§3–4 pp. 4–13; §7 pp. 15–20; Lemma 12.2 (06IH) p. 35; Theorem 15.5 (06IX) pp. 46–47; Remark 15.6 (06IY) p. 47; Theorem 18.2 (06JM) p. 55. Augmented categories and the functor criteria in the classical specialization. Since Λ→k is surjective, Der_Λ(k,k)=0; the injectivity condition in Theorem 18.2(c) is automatic, and miniversality on derivation orbits becomes tangent bijectivity.

### Target 2. Minimal power-series presentations of hull rings

For a complete coefficient object R, put d=dim_k T(h_R). Choosing a basis of m_R/(m_R²+m_ΛR) and lifts gives a surjection q:S=Λ[[X₁,…,X_d]]→R of labelled coefficient algebras. It induces an isomorphism on relative cotangent spaces, and J=ker q is contained in m_S²+m_ΛS. Conversely a surjective map from this S is relative-tangent minimal exactly when J⊆m_S²+m_ΛS. For a hull h_R→F, d=dim_k T_F; the number of variables is determined, while q and its generators are choices. No assertion J⊆m_S² is made over a general coefficient base.

Additional hypotheses: R is a complete coefficient object; for the hull specialization the imported hull map is smooth and tangent bijective.

Construction and proof.

Use the finite relative cotangent and its dual identification from R03.1 and the preceding comparison to choose d lifts of a basis.

Apply R03.1/series-presentation to these lifts. Its actual continuous evaluation map is surjective.

Modulo m_S²+m_ΛS the classes of X_i form a k-basis. The kernel of the induced relative cotangent map is the image of J; this proves the minimality criterion.

A hull identifies its tangent with T_F, hence the same d works. Minimality is a property of the selected surjection, not a claim that every presentation has this number of variables.

API.

| Declaration | Required behavior |
| --- | --- |
| `minimalPresentation` | Given lifts of a basis of the relative cotangent of R, return the chosen labelled surjection q:Λ[[X₁,…,X_d]]→R with tangent isomorphism. |
| `minimalPresentation_X` | q(X_i) is the selected lift of the i-th relative cotangent basis vector. |
| `minimalPresentation_surjective` | The selected evaluation map q is surjective; R is isomorphic as a labelled coefficient algebra to S/ker q. |
| `minimalPresentation_ker_le` | For a surjective q:S→R, relative tangent minimality is equivalent to ker q⊆m_S²+m_ΛS. |
| `minimalPresentation_variable_count` | For a hull h_R→F, the presentation has exactly dim_k T_F variables. |

Unit tests.

- `minimalPresentation_base`: For R=Λ and its identity residue convention, d=0 and the selected q is an isomorphism.
- `minimalPresentation_residue`: For a complete DVR Λ with nonzero uniformiser π and R=k, d=0, q=ρ and J=(π); J is not contained in m_Λ².
- `minimalPresentation_extra_variable`: Over a field k, q:k[[X,Y]]→k[[X]], q(X)=X, q(Y)=0, is surjective but fails tangent minimality: its kernel contains Y∉(X,Y)².

Acceptance.

- The presentation of R=Λ uses zero variables and zero kernel.
- For R=k as a Λ-algebra, zero variables still suffice, but J=m_Λ can have nonzero linear coefficient-base part.
- The surjection Λ[[X,Y]]→Λ[[X]] killing Y is not minimal.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.2/coefficient-and-functor-comparison`, `DeformationAndDerivedPatchingAlgebra:R03.1/relative-cotangent`, `DeformationAndDerivedPatchingAlgebra:R03.1/relative-cotangent-finite`, `DeformationAndDerivedPatchingAlgebra:R03.1/series-cotangent-basis`, `DeformationAndDerivedPatchingAlgebra:R03.1/series-presentation`, `DeformationAndDerivedPatchingAlgebra:R03.1/local-series-evaluation`.

Uses: R03.2/minimal-relation-space and R03.2/relation-bound: The relations are counted in the selected tangent-minimal presentation. Khare–Wintenberger II Lemmas 4.4 and 4.6: The relative variable count and the relation count use distinct vector spaces.

Sources: [Schlessinger1968](https://math.uchicago.edu/~amathew/schlessingerdef.pdf), Notation 2.6 p. 211; proof of Theorem 2.11 pp. 213–214, initial quotient S/(m_S²+m_ΛS). The tangent-dual choice of variables and the initial minimal presentation. [KWII2009](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 4.4 pp. 41–42 and opening of Lemma 4.6 p. 43. The relative-tangent-minimal presentation used before counting relations; arithmetic computations are not imported.

### Target 3. Framed matrix equations and their representing ring

Fix d,n≥0, lifts L_i∈GL_n(Λ), i∈Fin d, and a set W of words in the native free group on Fin d such that w(ρ(L_i))=1 for every w∈W. Put S=Λ[[X_{i,a,b}]] with d n² variables. Each U_i=L_i+(X_{i,a,b}) is invertible in S. Let J_W be the ideal generated by all entries of w(U)-1 for w∈W, and R_W=S/J_W. The residual-word hypothesis implies J_W⊆m_S, so R_W is a complete coefficient object. For every Artinian coefficient object A, maps R_W→A are naturally in bijection with tuples M_i∈GL_n(A) with residue ρ(L_i) and w(M)=1 for all w∈W. The tuple is retained in its fixed basis, without dividing by conjugation. Hence this formal matrix-equation functor is prorepresented, has finite relative tangent of dimension at most d n², and has a unique compatible representing-ring isomorphism. No finiteness of W is necessary: S is Noetherian. No continuity assertion for an arbitrary profinite group follows from finite-word equations alone.

Additional hypotheses: d,n are finite natural numbers. W is a set of finite words; the chosen residual matrices satisfy every word equation.

Construction and proof.

Use the native finite-variable MvPowerSeries carrier and GL as units of the matrix ring. The determinant of U_i has constant term det L_i, a unit. The local-series unit criterion makes it invertible.

Extend U_i uniquely to a group homomorphism from FreeGroup (Fin d), using FreeGroup.lift. Generate the ideal by the entries of w(U)-1. Reduction to k kills all those entries.

Use R03.1/coefficient-power-series and complete-quotient to give S/J_W its labelled complete local structure. Noetherianity makes J_W finitely generated and closed even for infinitely many finite-word relations.

R03.1/local-series-evaluation maps the variables to M_i−L_i, whose entries lie in m_A. It factors through R_W exactly when the word equations hold. Conversely a map from the quotient supplies such matrices. Uniqueness of evaluation proves the natural bijection.

The relative cotangent of the quotient is a quotient of the d n²-dimensional series cotangent. The continuous-framed-representability node supplies closed profinite relations and the generic maximal-pro-p reduction; the Galois owners verify their arithmetic finiteness hypotheses. Finite-word relations alone do not supply a continuous profinite representing functor.

API.

| Declaration | Required behavior |
| --- | --- |
| `framedMatrixRing` | Form the quotient S/J_W with its labelled complete local coefficient structure from L and the residual-word hypothesis. |
| `framedUniversalMatrix` | U_i is the universal invertible matrix with entries L_i(a,b)+X_{i,a,b}, and its image in R_W satisfies every word equation. |
| `framedUniversalMatrix_entry` | The (a,b)-entry of U_i is C(L_i(a,b))+X_{i,a,b}. |
| `framedMatrixPointsEquiv` | Evaluation gives a natural bijection between labelled maps R_W→A and fixed-basis tuples satisfying the prescribed residual and word conditions. |
| `framedMatrixPointsEquiv_natural` | For a coefficient map A→B, the points equivalence carries composition on ring maps to entrywise transport of the matrices. |
| `framedMatrixRing_empty_relations` | For W empty, J_W=0 and R_W is labelled-isomorphic to S. |
| `framedMatrixRing_tangent_le` | The relative tangent dimension of R_W is at most d n², with equality when W is empty. |

Unit tests.

- `framedMatrixRing_free`: For W empty, the representing ring is Λ[[X_{i,a,b}]], with relative tangent dimension d n².
- `framedMatrixRing_no_generators`: For d=0 and W empty, the unique empty tuple is represented by Λ.
- `framedMatrixRing_involution_char_two`: Over a field k of characteristic 2, one scalar matrix with residue 1 and word g²=1 is represented by k[[X]]/(X²), rather than a smooth one-variable ring.
- `framedMatrixRing_involution_char_ne_two`: Over a field k of characteristic different from 2, the same scalar equation is represented by k, rather than k[[X]]/(X²).

Acceptance.

- With W empty, R_W is the full d n²-variable power-series ring.
- With d=0 and W empty, R_W is Λ.
- For n=d=1, L=1, W={g²} and Λ=k of characteristic 2, R_W=k[[X]]/(X²).
- For the same word over a field of characteristic different from 2, R_W=k since (1+X)²−1=X(2+X) and 2+X is a unit.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.1/coefficient-power-series`, `DeformationAndDerivedPatchingAlgebra:R03.1/local-series-evaluation`, `DeformationAndDerivedPatchingAlgebra:R03.1/complete-quotient`, `DeformationAndDerivedPatchingAlgebra:R03.1/series-cotangent-basis`, `DeformationAndDerivedPatchingAlgebra:R03.2/coefficient-and-functor-comparison`, `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.map`, `mathlib:FreeGroup`, `mathlib:FreeGroup.lift`, `mathlib:MvPowerSeries`, `mathlib:MvPowerSeries.X`.

Uses: Kisin Lecture 1 proof of Proposition (1.2.1)(1): Matrix coordinates with fixed basis supply the algebraic representing quotient. GlobalGaloisDeformations R04.2 and LocalGaloisDeformationRings R08.1: Consume the generic continuous-framed construction of this stage after verifying arithmetic finiteness hypotheses; its finite coordinates use this matrix algebra.

Sources: [KisinLecture1](https://people.math.harvard.edu/~kisin/notes/notes.pdf), Proposition (1.2.1)(1) and its proof p. 2; Remark (1.1.2)(1) p. 1. The fixed-basis matrix-variable construction. This node extracts its finite-word algebraic part; Kisin separately reduces continuous profinite lifts using Φ_p. [Gee2022](https://arxiv.org/pdf/2202.05818v2), Lemma 3.2 and Definition 3.3 p. 12; Exercise 3.11 and Corollary 3.12 p. 13. The framed versus conjugacy-class distinction and the use of finite tangent variables; no Galois cohomology calculation is restated.

### Target 4. Smooth transformations and coefficient-ring lifting

For a labelled coefficient map f:R→S between complete objects, the induced transformation h_S→h_R is smooth in SF.4 exactly when f is FormallySmooth in the small-Artinian-diagram sense of R03.1. Equivalently S is a finite-variable power-series algebra over R, by a labelled R-algebra isomorphism commuting with f. The number of variables is dim_k m_S/(m_S²+f(m_R)S). If h_R→F is a hull, F takes all Artinian surjections to surjections exactly when Λ→R is formally smooth; then R is a d-variable power-series ring over Λ, d=dim_k T_F. The chosen power-series isomorphism is not canonical.

Construction and proof.

Expand smoothness of h_S→h_R: the elements and their compatibility are precisely the two coefficient maps in a lifting square for f. Artinian-target maps are continuous automatically.

Use the R03.1 factorization into small extensions to compare all-surjection and small-surjection lifting. This is an equivalence of two existing predicates, not a new formal-smoothness definition.

Apply R03.1/continuous-formally-smooth-series, which supplies an R-algebra power-series comparison; compute its relative variable count using series-cotangent-basis.

For a hull, its smoothness and pointwise surjectivity permit smoothness of F→h_Λ to be compared with h_R→h_Λ by Schlessinger Proposition 2.5(ii),(iii). Apply the represented comparison.

Named results: `smooth_prorep_iff`, `unobstructed_hull_iff`. Their statements are the target above.

Acceptance.

- h_{R[[Y]]}→h_R is smooth with one relative variable.
- h_{k[[X]]/(X²)}→h_k fails the lifting test at k[t]/(t³)→k[t]/(t²).
- For a complete DVR Λ, h_k→h_Λ is not smooth, although T(h_k)=0.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.2/coefficient-and-functor-comparison`, `DeformationAndDerivedPatchingAlgebra:R03.1/continuous-formal-smoothness`, `DeformationAndDerivedPatchingAlgebra:R03.1/surjection-small-factorization`, `DeformationAndDerivedPatchingAlgebra:R03.1/continuous-formally-smooth-series`, `DeformationAndDerivedPatchingAlgebra:R03.1/series-cotangent-basis`, `SchemeAndStackFoundations:SF.4/hull`.

Sources: [Schlessinger1968](https://math.uchicago.edu/~amathew/schlessingerdef.pdf), Definition 2.2 and Remark 2.3 pp. 210–211; Proposition 2.5 p. 211; Remark 2.10 p. 212. Smooth functor transformations, power-series morphisms, and unobstructed hulls. [StacksFormal](https://stacks.math.columbia.edu/download/formal-defos.pdf), Definition 8.1 (06HG) p. 20; Lemma 8.2 (06HH) pp. 20–21; Lemma 8.7 (06HM) pp. 22–23; Definition 9.1 (06HP), Remark 9.2 (06HQ) and Lemma 9.3 (0DYL) p. 24; Lemma 9.4 (0DZK) pp. 24–25. Small-extension testing, smoothness composition and the represented ring criterion in the classical case.

### Target 5. The minimal relation space

For a chosen surjection q:S=Λ[[X₁,…,X_d]]→R with J=ker q and maximal ideal m=m_S, define E(q)=J/mJ, where mJ is the S-submodule m•J inside the module J. The S-action factors through S/m and the specified residue isomorphism S/m≅k supplies its k-vector-space structure. E is finite dimensional. Its dimension is the minimal number of generators of the ideal J. For every k-vector space I, regarded as an S-module through the residue, restriction gives a natural equivalence Hom_k(E,I)≅Hom_S(J,I). This is not the conormal R-module J/J². The relation space belongs to a chosen presentation; minimality is needed only for its obstruction interpretation.

Additional hypotheses: q is a surjective labelled coefficient map from a finite-variable power-series ring S.

Construction and proof.

Use the actual Submodule.Quotient of the ideal J by m•⊤ inside J. Every element of m acts as zero, so descend the S-action to S/m and transport it through the labelled residue isomorphism.

Noetherianity of S makes J a finite S-module. Its quotient is a finite S/m-module and hence a finite k-vector space.

An S-linear map J→I kills mJ; the quotient universal property supplies the displayed k-linear map. Conversely compose with the quotient map. These operations are inverse and natural in I.

Nakayama identifies a tuple generating J with a tuple spanning E when J is finite. Lifts of a k-basis generate J, and every generating tuple spans E; this proves the minimal-generator formula.

API.

| Declaration | Required behavior |
| --- | --- |
| `RelationSpace` | The actual quotient J/(m_S•⊤ inside J), with its labelled k-action. |
| `relationClass` | The S-linear quotient map J→E(q). |
| `relationClass_eq_zero` | The class of j∈J is zero exactly when j∈m_S J. |
| `relationLinearEquiv` | Hom_k(E(q),I) is naturally equivalent to Hom_S(J,I) for I acted on through the residue. |
| `relationSpace_finite` | E(q) is a finite k-vector space. |
| `relation_basis_generates` | Lifts in J of a basis of E(q) generate the ideal J; conversely every ideal generating tuple spans E(q). |

Unit tests.

- `RelationSpace_zero`: J=0 has zero-dimensional relation space.
- `RelationSpace_square`: For S=k[[X]], J=(X²), the class of X² is a basis of E and its finrank is one.
- `RelationSpace_square_maximal`: For S=k[[X,Y]], J=(X,Y)², the classes of X²,XY,Y² are a basis of E and its finrank is three.
- `RelationSpace_nonminimal`: The presentation k[[Y]]→k killing Y has finrank E=1, so relation rank is not an invariant of the functor under arbitrary presentations.

Acceptance.

- For J=0, E=0.
- For J=(X²) in k[[X]], E has dimension one although J/J² is a nontrivial module over k[[X]]/(X²).
- For J=(X²,XY,Y²) in k[[X,Y]], E has dimension three.
- The nonminimal presentation k[[Y]]→k has one relation even though h_k is unobstructed.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.2/minimal-deformation-presentation`, `mathlib:Submodule.hasQuotient`, `mathlib:Submodule.exists_injOn_mkQ_image_span_eq_of_span_eq_map_mkQ_of_le_jacobson_bot`, `DeformationAndDerivedPatchingAlgebra:R03.1/coefficient-power-series`.

Uses: R03.2/canonical-presentation-obstructions: Evaluation of relations is a map from E to the extension kernel. R03.2/relation-bound; Khare–Wintenberger II Lemma 4.6: Its dual injects into the supplied obstruction space, giving a bound on ideal generators.

Sources: [KWII2009](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.2, immediately before Lemma 4.6 p. 43; final paragraph after its proof p. 45. The relation count is dim_k J/mJ and basis lifts generate J. [Gee2022](https://arxiv.org/pdf/2202.05818v2), Lemma 3.13 p. 13 and its preceding power-series presentation. Uses the dual of the same minimal relation space, not J/J².

### Target 6. Obstructions obtained by evaluating minimal relations

Let q:S→R be a relative-tangent-minimal presentation, E=J/m_SJ. For an Artinian coefficient surjection e:B→A with kernel I killed by m_B, and a labelled point f:R→A, choose lifts in m_B of the images of the X_i. Evaluate S→B at these lifts. Its restriction to J lands in I, kills m_SJ, and defines a k-linear map E→I. This map is independent of the chosen variable lifts. Under the finite-dimensional duality Hom_k(E,I)≅E*⊗_k I it is the canonical obstruction ob_q(e,f). It vanishes exactly when f lifts to R→B. For every commuting square of such extensions the obstruction transports by the induced k-linear map of kernels. Thus E* supplies the full socle-extension obstruction theory requested from SF.4. This construction never evaluates an Artinian-only functor at a non-Artinian quotient.

Additional hypotheses: q is the chosen relative-tangent-minimal presentation. Kernels I may have any finite k-dimension, including zero.

Construction and proof.

Use R03.1/local-series-evaluation and surjectivity of e to choose and evaluate variable lifts. Since e∘evaluation=f∘q, evaluation sends J into I.

The socle condition m_BI=0 makes evaluation kill m_SJ and makes restriction linear over the labelled k. It therefore descends to E.

Two choices differ by elements of I in the variables. For any relation in m_S²+m_ΛS, every change term is a product of such a difference with an element of m_B, or with an image of m_Λ. These products are zero. This proves independence, including the coefficient-base term.

The obstruction is zero iff every element of J evaluates to zero iff the series evaluation factors through R. This proves both directions of the lifting criterion.

Entrywise transport of the selected lifts in a commuting extension square proves kernel naturality; independence removes the choices. Finite-dimensional tensor-dual evaluation converts the Hom-valued obstruction to the supplier tensor convention.

API.

| Declaration | Required behavior |
| --- | --- |
| `presentationObstruction` | Return the k-linear map E→I from any lifts of the variables; the resulting map is choice independent for a minimal presentation. |
| `presentationObstruction_apply` | For j∈J, ob sends its relation class to the evaluation of j in B, regarded in ker e. |
| `presentationObstruction_independent` | Any two choices of variable lifts give the same map E→I. |
| `presentationObstruction_zero_iff` | The obstruction vanishes exactly when the specified point R→A admits a labelled lift to B. |
| `presentationObstruction_natural` | In a commuting square of socle extensions, composition with the kernel map carries the first obstruction to the second. |
| `presentationObstruction_tensor` | The tensor obstruction in E*⊗I corresponds to the relation-evaluation linear map under finite-dimensional duality. |

Unit tests.

- `presentationObstruction_zero_relations`: For J=0 the map E→I is zero.
- `presentationObstruction_square`: The point X↦t for the quadratic relation and k[t]/t³→k[t]/t² has nonzero obstruction X²↦t².
- `presentationObstruction_uniformiser`: For Λ complete DVR, R=k, the extension Λ/(π²)→k has obstruction π↦π mod π².
- `presentationObstruction_nonminimal`: For q:k[[Y]]→k, evaluation of Y depends on whether its lift to dual numbers is zero or the square-zero generator.

Acceptance.

- For J=0, every canonical obstruction is zero and all socle-extension lifts exist.
- For R=k[[X]]/(X²), A=k[t]/(t²), B=k[t]/(t³), f(X)=t, evaluation sends the basis relation to t²≠0.
- For a complete DVR Λ, R=k and B=Λ/(π²)→A=k, the obstruction sends the class of π to π≠0.
- For the nonminimal presentation k[[Y]]→k, choices Y=0 and Y=t in k[t]/(t²) give different evaluations of the linear relation Y; minimality cannot be omitted.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.2/minimal-deformation-presentation`, `DeformationAndDerivedPatchingAlgebra:R03.2/minimal-relation-space`, `DeformationAndDerivedPatchingAlgebra:R03.1/local-series-evaluation`, `SchemeAndStackFoundations:SF.4/obstruction-theory`, `SchemeAndStackFoundations:SF.4`, `mathlib:TensorProduct`.

Uses: R03.2/universal-artinian-test-extension: On the selected finite universal extension the obstruction is id_E. R03.2/relation-bound: It proves that every nonzero contraction of the universal extension is obstructed.

Sources: [StacksObstructions](https://stacks.math.columbia.edu/tag/07YG), Definition 98.22.1 (tag 07YG) and Example 98.22.4 (tag 07YI), online section 98.22, accessed 2026-10-10. Tensor-valued natural obstruction theories and relation evaluation; the local completed presentation with minimality is the specialization proved here. [Gee2022](https://arxiv.org/pdf/2202.05818v2), Lemma 3.13 p. 13. The dual relation-space obstruction map; the statement cites the classical construction rather than giving its proof.

### Target 7. A finite Artinian extension detecting every relation

For a minimal presentation q:S→R with kernel J and E=J/m_SJ, choose N≥1 with J∩m_S^N⊆m_SJ. Such N exists by Artin–Rees. Put B_N=S/(m_SJ+m_S^N), A_N=S/(J+m_S^N), and let e_N:B_N→A_N be the quotient map. These are actual Artinian coefficient objects and ker e_N is naturally E, killed by m_B. The induced point f_N:R→A_N has presentation obstruction id_E. For every nonzero λ:E→k, pushing out e_N along λ gives a principal small extension and f_N has no lift to it. The extension e_N itself need not be principal; when E=0 it is an isomorphism. Larger admissible N give compatible extensions with identity kernel map.

Additional hypotheses: q is minimal. N is any positive integer satisfying the stated Artin–Rees inclusion.

Construction and proof.

Apply Ideal.exists_pow_inf_eq_pow_smul to the submodule J⊆S and the ideal m_S. Once the exponent exceeds its Artin–Rees constant by one, the intersection is inside m_SJ.

The quotients by ideals containing m_S^N are Artinian by R03.1/positive-truncation and quotient permanence. The residue convention is preserved because both ideals lie in m_S.

The kernel is (J+m_S^N)/(m_SJ+m_S^N); the third isomorphism theorem and the Artin–Rees inclusion identify it with J/m_SJ, with the labelled k-action. Multiplication by m_S kills this kernel.

The images of X_i in B_N give selected lifts of the point f_N. Evaluating j sends its class to itself in E, so canonical obstruction equals id_E.

Push out along λ by quotienting B_N by the inverse image of ker λ in its socle kernel. A nonzero λ is surjective onto k, so the resulting kernel is one-dimensional and gives a principal small extension. Naturality makes its canonical obstruction λ, which is nonzero; the point does not lift.

For N′≥N, quotient reduction gives a commuting square of extensions and induces id_E on kernels.

API.

| Declaration | Required behavior |
| --- | --- |
| `relationTestExponent_exists` | There is N≥1 with J∩m_S^N⊆m_SJ. |
| `relationTestExtension` | The two finite quotients and their actual surjective labelled map form the selected socle extension. |
| `relationTestKernelEquiv` | Its kernel is k-linearly equivalent to E, compatibly with the quotient of j∈J. |
| `relationTestExtension_obstruction` | The canonical obstruction of f_N is the identity of E under the kernel equivalence. |
| `relationTestPushout` | For λ:E→k, quotient by ker λ gives the kernel pushout; for nonzero λ it is a principal small extension. |
| `relationTestPushout_no_lift` | For nonzero λ, f_N has no lift to the pushout extension. |
| `relationTestExtension_cofinal` | If N′≥N are admissible, reduction is a commuting extension square inducing the identity on E. |

Unit tests.

- `relationTestExtension_zero`: For J=0 its kernel is zero and the quotient map is bijective.
- `relationTestExtension_quadratic`: For J=(X²) and N=3 the selected extension is the cubic-to-quadratic truncated power-series quotient.
- `relationTestExtension_three_relations`: For J=(X,Y)² and N=3 the kernel has dimension three, so this extension is socle but not principal small.
- `relationTestExtension_nonminimal`: For J=(Y), N=2, the extension k[t]/t²→k has a coefficient-algebra section, unlike a nonzero pushout of a minimal presentation.

Acceptance.

- J=0 gives E=0 and e_N an isomorphism, not a principal small extension.
- For S=k[[X]], J=(X²), N=3, e_N is k[t]/t³→k[t]/t².
- For S=k[[X,Y]], J=(X,Y)², N=3, the kernel has k-dimension three and e_N is not principal small.
- For the nonminimal J=(Y) in k[[Y]], the same construction at N=2 splits; the nonliftability clause applies only to minimal presentations.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.2/minimal-deformation-presentation`, `DeformationAndDerivedPatchingAlgebra:R03.2/minimal-relation-space`, `DeformationAndDerivedPatchingAlgebra:R03.2/canonical-presentation-obstructions`, `DeformationAndDerivedPatchingAlgebra:R03.1/positive-truncation`, `DeformationAndDerivedPatchingAlgebra:R03.1/complete-quotient`, `DeformationAndDerivedPatchingAlgebra:R03.1/small-extension`, `mathlib:Ideal.exists_pow_inf_eq_pow_smul`, `SchemeAndStackFoundations:SF.4`.

Uses: R03.2/relation-bound: A single tensor obstruction on this finite extension supplies the linear injection E*→O.

Sources: [KWII2009](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 4.6, construction pp. 43–44 and injectivity argument pp. 44–45. The extension with kernel J/mJ and its one-dimensional pushouts. The node supplies a finite Artinian realization of this method. [Schlessinger1968](https://math.uchicago.edu/~amathew/schlessingerdef.pdf), Definition 1.2 p. 209 and proof of Theorem 2.11 pp. 213–214. Principal small extensions and truncation limits; the Artin–Rees truncation here is an explicit additional algebraic argument.

### Target 8. The obstruction-space bound on minimal relations

Let h_R→F be a hull in the imported classical coefficient category, with chosen minimal presentation q:S=Λ[[X₁,…,X_d]]→R and E=ker(q)/m_Sker(q). Suppose F has a complete natural tensor-valued obstruction theory with finite k-vector space O for all Artinian socle extensions, including naturality for arbitrary k-linear kernel pushouts. Then there is an injective k-linear map E*→O; consequently dim_k E≤dim_k O. Lifting a basis of E gives ideal generators f₁,…,f_r of ker q with r≤dim_k O, hence R≅Λ[[X₁,…,X_d]]/(f₁,…,f_r) and d=dim_k T_F. If O=0 the hull is a power-series ring and F is unobstructed. A merely nonzero chosen obstruction space does not imply F is obstructed. The statement bounds a minimal presentation; it is false for arbitrary presentations.

Additional hypotheses: F has H1,H2 and finite tangent, and the supplied hull is smooth and tangent bijective. The obstruction theory has actual values in O⊗_k ker e, zero iff the specified point lifts, and naturality for commuting squares of finite socle extensions. This is the requested enlargement of SF.4/obstruction-theory, not its current principal-only detector.

Construction and proof.

Pull the supplied obstruction theory back along the smooth hull map h_R→F. Completeness holds: a lift of the image of a represented point can be pulled back to a lift of that point by smoothness. Naturality is inherited.

Take the universal Artinian extension e_N and the point f_N of the preceding construction. Its obstruction is ω∈O⊗E. Contraction λ↦(id_O⊗λ)(ω) is a k-linear map E*→O.

For nonzero λ, the kernel pushout point has no lift by relationTestPushout_no_lift. Completeness makes its obstruction nonzero; naturality identifies it with the contraction of ω. Thus the contraction has zero kernel and is injective.

Use finite-dimensional linear algebra for the dimension bound. Use relation_basis_generates to lift a basis of E to a generating tuple for ker q, giving the presentation.

If O=0 then E=0 and Nakayama forces J=0; the imported smooth hull comparison proves unobstructedness. The zero- versus nonzero-space distinction follows since any unobstructed functor admits the identically zero theory with a larger O.

Named results: `relationDualInjection`, `relation_bound`, `zero_obstruction_hull_series`. Their statements are the target above.

Acceptance.

- For F=h_{k[[X]]/(X²)}, canonical O=k gives r=1=d.
- For F=h_Λ, canonical O=0 gives d=r=0.
- For h_k over a DVR Λ, d=0 but r=1; relative tangent dimension alone does not bound relations.
- The nonminimal presentation k[[Y]]→k has one relation although O=0 is a complete theory for h_k over k.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.2/minimal-deformation-presentation`, `DeformationAndDerivedPatchingAlgebra:R03.2/minimal-relation-space`, `DeformationAndDerivedPatchingAlgebra:R03.2/canonical-presentation-obstructions`, `DeformationAndDerivedPatchingAlgebra:R03.2/universal-artinian-test-extension`, `DeformationAndDerivedPatchingAlgebra:R03.2/smooth-functor-ring-comparison`, `SchemeAndStackFoundations:SF.4/hull`, `SchemeAndStackFoundations:SF.4/obstruction-theory`, `SchemeAndStackFoundations:SF.4`.

Sources: [KWII2009](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 4.6 pp. 43–45. Linear relation-dual map and nonzero-pushout nonsplitting; the Galois pairing is not reproduced. [Gee2022](https://arxiv.org/pdf/2202.05818v2), Lemma 3.13 p. 13; Proposition 3.24(2) p. 18. Relation bounds for universal deformation presentations. Its arithmetic obstruction calculation is supplied by the Galois owners. [StacksObstructions](https://stacks.math.columbia.edu/tag/07YG), Definition 98.22.1 (tag 07YG). The complete natural tensor obstruction interface used by the abstract argument.

### Target 9. An explicit hull whose functor is not prorepresentable

Over a field k, let F(A)=m_A/(1+m_A) under multiplication by principal units, for Artinian local k-algebras with residue k. The natural map h_{k[[X]]}(A)=m_A→F(A) is smooth and induces a tangent isomorphism, hence is a hull. It is not a prorepresenting pair and F has no prorepresenting object. For A=k[t]/t³→B=k[t]/t², a principal small extension, the two classes of (t,t) and (t,t+t²) in F(A×_B A) are distinct, but have the same image in F(A)×_{F(B)}F(A). Thus H4 fails. The nonidentity ring automorphism X↦X+X² preserves the formal element in F, so compatible hull isomorphisms need not be unique. This example has finite one-dimensional tangent and distinguishes the two criteria without any Galois-cohomological input.

Additional hypotheses: Λ=k is a field; use the residue-labelled Artinian coefficient category. The orbit relation is x∼y iff y=u x for a unit u with residue 1; it is transported by coefficient maps.

Construction and proof.

A lifting problem for m→F can be solved by choosing a representative upstairs and lifting the correcting principal unit from A to B. Artinian-surjection unit lifting gives smoothness.

On dual numbers principal-unit multiplication fixes every element of the maximal ideal, so the tangent map is an isomorphism onto k.

In P=A×_B A a principal unit has equal t-coefficients in its two components. Multiplying (t,t) by it changes the t² coefficients by the same scalar; it cannot give (t,t+t²). Componentwise, the second coordinate is obtained by multiplying t by 1+t. This proves the H4 comparison is not injective.

Apply the imported prorepresentability criterion to exclude any representing pair. The hull exists from the explicit smooth tangent-bijective map.

The substitution X↦X+X² has invertible linear term and hence is a continuous automorphism. At every point x∈m_A, x+x²=(1+x)x lies in its principal-unit orbit, so the hull formal element is fixed.

API.

| Declaration | Required behavior |
| --- | --- |
| `principalUnitOrbitFunctor` | The covariant functor A↦m_A/(1+m_A), with transport induced by coefficient maps. |
| `principalUnitOrbitMap` | The natural orbit map h_{k[[X]]}→F sends the series point X↦x to the orbit of x. |
| `principalUnitOrbit_hull` | The orbit map is smooth and tangent bijective, so is a hull. |
| `principalUnitOrbit_not_prorep` | The explicit self-pullback pair proves H4 fails; F is not prorepresentable. |

Unit tests.

- `principalUnitOrbit_zero`: Over k the maximal ideal is zero and F(k) is a singleton.
- `principalUnitOrbit_dual`: On k[ε], principal-unit orbits of aε are singletons, so the tangent map is the identity of k.
- `principalUnitOrbit_pullback`: In k[t]/t³×_{k[t]/t²}k[t]/t³ the orbits of (t,t) and (t,t+t²) are distinct even though both component orbits agree.

Acceptance.

- The tangent is k and its dimension is one in every characteristic.
- The self-pullback is A×_B A, rather than A×_k A.
- The displayed two orbits coincide componentwise but not in the pullback.
- Hull automorphisms can preserve the formal element without being the identity.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.2/coefficient-and-functor-comparison`, `DeformationAndDerivedPatchingAlgebra:R03.1/artinian-pullback`, `DeformationAndDerivedPatchingAlgebra:R03.1/coefficient-power-series`, `DeformationAndDerivedPatchingAlgebra:R03.1/local-series-evaluation`, `SchemeAndStackFoundations:SF.4/deformation-functor`, `SchemeAndStackFoundations:SF.4/hull`, `SchemeAndStackFoundations:SF.4/schlessinger-theorem`.

Uses: R03.2/coefficient-and-functor-comparison; Schlessinger Theorem 2.11: Tests H4, smooth tangent-bijective hulls and the difference between compatible existence and compatible uniqueness.

Sources: [Schlessinger1968](https://math.uchicago.edu/~amathew/schlessingerdef.pdf), Proposition 2.9 pp. 211–212; Theorem 2.11 pp. 212–213; Remark 2.15 pp. 213–214. The hull/prorepresenting distinction and stabilizers obstructing the self-pullback axiom. The explicit principal-unit example here is independently computed, rather than attributed to the paper.

### Target 10. The continuous framed matrix construction

Assume k is finite of characteristic p, Γ is profinite and a continuous residual representation ρ̄:Γ→GL_n(k) is fixed in a basis. If Γ has d topological generators, the functor of continuous fixed-basis lifts ρ_A:Γ→GL_n(A) on Artinian coefficient objects is prorepresented by a labelled complete Noetherian local quotient of Λ[[d n² variables]]. To construct it choose a surjection P=freeProfiniteGroup(Fin d)→Γ and lifts L_i of the residual generator matrices. The universal matrices define a continuous representation U:P→GL_n(S), with S the series ring, using the inverse limit of finite matrix groups over S/m_S^a. Quotient S by the ideal of entries U(w)−1 for every w in the closed kernel P→Γ. The resulting R□ carries a universal continuous representation and its evaluation equivalence is natural in A. The same conclusion holds without finite generation of Γ if the maximal pro-p quotient of ker ρ̄ is topologically finitely generated: every lift factors through Γ/H, where H is the image of the pro-p kernel of ker ρ̄. This quotient is topologically finitely generated. This is the generic algebraic supplier to the Galois deformation roadmaps; their arithmetic finiteness conditions and cohomology remain there.

Additional hypotheses: k is finite with prime characteristic p. Γ is a profinite group and ρ̄ is continuous. For the direct construction Γ is topologically finitely generated. For the extended conclusion it suffices that the maximal pro-p quotient of ker ρ̄ is topologically finitely generated.

Construction and proof.

Lift each residual matrix to GL_n(Λ): arbitrary entry lifts have unit determinant because the residual determinant is nonzero. Use the finite matrix coordinates and invertibility proof of framed-matrix-equations.

A complete coefficient object over finite k has finite positive Artinian quotients: each successive maximal-ideal layer is a finite k-vector space. The coefficient quotient-limit theorem identifies GL_n(S) with the compatible inverse limit of finite GL_n(S/m^a), with its adic matrix topology.

Apply ProfiniteProPGroups Layer 4, free-profinite universal property, at each finite matrix quotient to extend the chosen generator matrices. Uniqueness makes these extensions compatible. The quotient-limit comparison gives U and its continuity.

Generate J by every entry U(w)−1 for w in the actual closed kernel, including profinite relators. Residual compatibility gives J⊆m_S. R03.1/complete-quotient supplies R□. Continuity and the quotient universal property descend U to Γ.

For a continuous lift on A, series evaluation from the generator coordinates takes every profinite relation to zero. Conversely any map R□→A supplies the descended continuous representation. Generator uniqueness makes the two operations inverse and proves naturality. The finite tangent bound follows from the series cotangent.

For the extended conclusion, filter the finite congruence kernel GL_n(A)→GL_n(k) by powers of m_A. Successive quotients are additive matrix spaces in characteristic p, so the kernel is a finite p-group. The maximal-pro-p universal property kills H in every lift. The pro-p kernel is characteristic in ker ρ̄, so H is closed normal in Γ. The quotient Γ/H is an extension of the finite residual image by the finitely generated maximal pro-p quotient; lift finite kernel generators and finite quotient generators to obtain a finite topological generating set. Apply the direct construction.

API.

| Declaration | Required behavior |
| --- | --- |
| `continuousFramedRing` | Construct the labelled complete coefficient ring for a finite topological generating tuple and chosen residual lifts. |
| `continuousFramedUniversal` | The universal continuous fixed-basis lift Γ→GL_n(R□). |
| `continuousFramedPointsEquiv` | Labelled maps R□→A are naturally equivalent to actual continuous representations Γ→GL_n(A) reducing to ρ̄. |
| `continuousFramedPointsEquiv_natural` | Coefficient transport of matrices agrees with composition of maps out of R□. |
| `continuousFramedRing_tangent_le` | Its relative tangent dimension is at most d n². |
| `continuousFramedRing_choice_iso` | Two representing constructions admit a unique labelled ring isomorphism carrying one universal representation to the other. |
| `continuousFramed_proP_reduction` | Every lift kills the image of the pro-p kernel of ker ρ̄; if its maximal pro-p quotient is finitely generated, this reduces to the finite-generator construction. |

Unit tests.

- `continuousFramedRing_trivial`: For Γ trivial, the ring is labelled-isomorphic to Λ.
- `continuousFramedRing_free`: For Γ the free profinite group on d generators, the ring is the full series ring with d n² variables, agreeing with the empty-word matrix construction.
- `continuousFramedRing_involution`: For Γ=C₂, Λ=k of characteristic 2, n=1 and residual value 1, the ring is k[[X]]/(X²), with its nonzero quadratic obstruction.

Acceptance.

- For Γ trivial, R□ is Λ and the universal representation is trivial.
- For the free profinite group on d generators with a prescribed residual tuple, R□ is the full d n²-variable series ring.
- For Γ cyclic of order two, n=1, ρ̄=1 and Λ=k of characteristic two, R□ is k[[X]]/(X²).
- Finite-word relations alone cannot detect an arbitrary closed profinite kernel; the construction uses all its elements.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.2/framed-matrix-equations`, `DeformationAndDerivedPatchingAlgebra:R03.2/coefficient-and-functor-comparison`, `DeformationAndDerivedPatchingAlgebra:R03.1/artinian-quotient-limit`, `DeformationAndDerivedPatchingAlgebra:R03.1/positive-truncation`, `DeformationAndDerivedPatchingAlgebra:R03.1/complete-quotient`, `DeformationAndDerivedPatchingAlgebra:R03.1/relative-cotangent-finite`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets`.

Uses: GlobalGaloisDeformations:R04.2/universal-lifting-ring; LocalGaloisDeformationRings:R08.1: The generic representing algebra is supplied here; those owners establish their arithmetic finite-generation hypotheses and identify cohomological tangents.

Sources: [KisinLecture1](https://people.math.harvard.edu/~kisin/notes/notes.pdf), Proposition (1.2.1)(1), proof p. 2; Remark (1.1.2)(1) p. 1. The congruence-kernel reduction and fixed-basis matrix quotient. The node states the closed-profinite-relator and finite-quotient steps explicitly. [Schlessinger1968](https://math.uchicago.edu/~amathew/schlessingerdef.pdf), Proposition 2.9 pp. 211–212; Theorem 2.11(2) p. 213. Uniqueness of a prorepresenting pair and its distinction from a hull.

### What the relation bound measures

The variable count d and relation count r arise from different modules. The relative cotangent of R determines d. The finite ideal module J inside a chosen series ring determines E=J/m_SJ and r=dim_k E. Neither the conormal module J/J² nor the absolute cotangent m_R/m_R² may replace these modules. In particular, a uniformiser relation over a DVR can contribute to r without contributing to d.

The canonical presentation obstruction evaluates a relation after lifting variables. Minimality kills its change under altering those lifts. An arbitrary presentation lacks that independence: for k[[Y]]→k, the relation Y evaluates differently at two dual-number lifts even though the represented functor has no obstruction. The test extension packages all minimal relations in one finite socle kernel E. The supplied tensor on that kernel gives a linear map E*→O. Separate nonzero-obstruction assertions for unrelated one-dimensional extensions would not, by themselves, construct that linear map or prove a dimension bound.

The injective map can depend on the presentation, the admissible truncation exponent and the supplied obstruction theory. The conclusion is a bound and a generating presentation; it does not identify O with a canonical minimal obstruction space. Conversely, E* is a canonical obstruction space relative to the chosen minimal presentation. An unobstructed functor can be assigned a nonzero vector space with the identically zero obstruction assignment. Thus the implication O=0 gives smoothness, but the converse “O nonzero gives obstructedness” is false.

### Acceptance of the layer

The layer's central objects are the minimal deformation presentation, the minimal relation space, presentation obstructions, the obstruction relation bound, the hull with automorphisms, and the continuous framed representing ring. These are its six atlas planets. The finite-word matrix construction and finite Artinian relation test supply the proof and computation interfaces behind those objects.

A completed development must recover every displayed Artinian functor naturally, preserve the labelled residue in all isomorphisms, and make the distinction between a principal extension and a general socle extension explicit. It must pass the quadratic and uniformiser obstruction tests, count three relations for the square of the two-variable maximal ideal, and reject the nonminimal variable presentation. It must show that the principal-unit orbit functor has a hull and fails H4 on the actual cubic-to-quadratic self-pullback. It must recover the full series ring for the free profinite group and the quadratic quotient for the scalar involution in characteristic two.

These requirements use only R03.1, SF.4, the specified ProfiniteProPGroups layers and native library algebra. The generic profinite construction must handle its closed kernel, not merely a list of finite words. Arithmetic finiteness and cohomology are inputs to its Galois applications and remain with those owners.

### Checked library baseline

The baseline for the signature candidates is Mathlib commit 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti commit f790474821cf4256814db967cb154e7af3d0c369. An occurrence in the declaration index alone is insufficient: the declarations below supply only the indicated native pieces, with their actual enclosing binders. No native representability criterion is inferred from a name search.

- `mathlib:FreeGroup` (Mathlib/GroupTheory/FreeGroup/Basic.lean): The native free group carrier on a type of generator labels; finite words are distinguished from elements of the free profinite completion.
- `mathlib:FreeGroup.lift` (Mathlib/GroupTheory/FreeGroup/Basic.lean): The equivalence between generator-image functions α→G and group homomorphisms FreeGroup α→G; it provides existence and uniqueness of word evaluation.
- `mathlib:Ideal.exists_pow_inf_eq_pow_smul` (Mathlib/RingTheory/Filtration.lean): Artin–Rees equality for a finite module over a Noetherian ring and a submodule.
- `mathlib:Matrix.GeneralLinearGroup` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): The group of units of the square matrix ring over a commutative coefficient ring; matrix size is an arbitrary finite type, not a chosen GL presentation.
- `mathlib:Matrix.GeneralLinearGroup.map` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): The group homomorphism induced by a unital ring homomorphism, obtained by mapping every matrix entry and then mapping units.
- `mathlib:MvPowerSeries` (Mathlib/RingTheory/MvPowerSeries/Basic.lean): The native coefficient-function carrier (σ→₀ℕ)→R with its power-series commutative-ring structure; complete local structures are imported from R03.1.
- `mathlib:MvPowerSeries.X` (Mathlib/RingTheory/MvPowerSeries/Basic.lean): The series with coefficient one on the singleton degree at a specified variable and zero elsewhere; used for the matrix-entry variables.
- `mathlib:Submodule.exists_injOn_mkQ_image_span_eq_of_span_eq_map_mkQ_of_le_jacobson_bot` (Mathlib/RingTheory/Nakayama.lean): Nakayama basis-lifting theorem for a finite submodule over a commutative ring, under a Jacobson-ideal hypothesis.
- `mathlib:Submodule.hasQuotient` (Mathlib/LinearAlgebra/Quotient/Defs.lean): Actual module quotient carrier; the relation-space action is additionally descended and transported through the labelled residue.
- `mathlib:TensorProduct` (Mathlib/LinearAlgebra/TensorProduct/Defs.lean): The native balanced tensor-product carrier for modules over a commutative semiring.
- `tauceti:TauCeti.derivationToDualNumberEquivLift` (TauCeti/RingTheory/Derivation/DualNumber.lean): The equivalence between derivations and algebra-map lifts to actual dual numbers with fixed first projection.

The category suppliers follow Mathlib’s extension-based design. [Mathlib PR 37940](https://github.com/leanprover-community/mathlib4/pull/37940), read at commit 6fa3d6e048f5dbcbab6648d673f0520eae6e2e06, proposes LocExtCat and its Artinian full subcategory BaseCat. Its morphisms preserve the residue augmentation. Its small-extension class also includes isomorphisms, so the nonzero principal-small convention here adds the one-dimensional-kernel requirement. R03.1 and SF.4 supply this category interface; adopting the native design changes their implementation boundary, not the presentation mathematics specified here. This proposal is outside the pinned baseline and supplies no representability criterion.

### Source register and corrected conventions

All mathematical statements above are restated in our own words. The references identify the exact results read, and the hashes fix the public copies used. Dates and hashes describe source provenance, not additional hypotheses. No source file or source passage is included in the roadmap.

- **Schlessinger1968**: Michael Schlessinger, [Functors of Artin rings](https://math.uchicago.edu/~amathew/schlessingerdef.pdf). Transactions of the AMS 130 (1968), 208–222; published scan. Accessed 2026-10-10. Read: §1 pp. 208–210; §2 pp. 210–216, including the full proof of Theorem 2.11. SHA-256: `50ea5b237d015270d9e1805cb9b56d433e416182e62415b3de301ec06159e1c2`.
- **StacksFormal**: The Stacks Project authors, [Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf). Chapter PDF compiled 14 July 2026, version ed88ff78, retrieved 2026-10-10. Accessed 2026-10-10. Read: §§3–4 pp. 4–13 (coefficient categories); §7 pp. 15–20 (formal elements); §8 pp. 20–24 and §9 pp. 24–26 (smoothness); §10 pp. 26–32 (conditions); §11 pp. 32–34 and §12 pp. 34–37 (tangents); §§13–15 pp. 37–48 (versal objects and hulls); §18 pp. 54–55 (prorepresentability), especially Lemma 12.2, Theorem 15.5, Remark 15.6 and Theorem 18.2. SHA-256: `f6549caab0fa380254eb316265ce14357794224c0e01c517bb0365c708a4c2ea`.
- **StacksObstructions**: The Stacks Project authors, [Artin’s Axioms, obstruction theories](https://stacks.math.columbia.edu/tag/07YG). Online §98.22 retrieved 2026-10-10. Accessed 2026-10-10. Read: Definition 98.22.1, tag 07YG; Example 98.22.4, tag 07YI; online locators have no stable PDF page number.
- **KisinLecture1**: Mark Kisin, [Lectures on deformations of Galois representations, Lecture 1](https://people.math.harvard.edu/~kisin/notes/notes.pdf). Four-page author lecture-note PDF. Accessed 2026-10-10. Read: Lecture 1 pp. 1–4, especially Proposition (1.2.1)(1) and proof p. 2. SHA-256: `9f3698a791b6a96318b8eded26962f2da7d3f34628ab47d855df7e36cd5712c6`.
- **Gee2022**: Toby Gee, [Modularity lifting theorems](https://arxiv.org/pdf/2202.05818v2). arXiv:2202.05818v2 (2022). Accessed 2026-10-10. Read: §3 pp. 11–18, Lemma 3.13 and Proposition 3.24(2). SHA-256: `878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5`.
- **KWII2009**: Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Author final copy, 30 May 2009, 98 pages. Accessed 2026-10-10. Read: §4.1.5, Lemma 4.4 pp. 41–42; §4.2, Lemma 4.6 and complete proof pp. 43–45. SHA-256: `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4`.

Two corrections in Kisin's four-page author lecture notes affect the conventions used here. In §1.2, p. 1, the alternative finiteness condition must test continuous Hom(G′,F_p) for every open subgroup G′, as Exercise 1 on p. 4 already does. Testing G alone is insufficient: for odd p, the profinite semidirect product (∏ C_p)⋊C₂, with inversion action, has no nonzero continuous character to F_p, while its open index-two subgroup has infinitely many independent coordinate characters. The present generic construction assumes finite generation of the relevant maximal pro-p quotient directly; arithmetic Φ_p statements retain the all-open-subgroup quantifier.

In the proof of Proposition (1.2.1)(1), p. 2, each of the two matrix-entry indices must range from 1 to n. Their pairs give n² variables per topological generator. Letting each index run to n² would produce n⁴ variables and fail to describe the displayed n by n matrix. The targets here use d n² coordinates. These corrections concern this author lecture-note copy; they do not assert an error in a version of record. The author PDF, its final exercise, and the author's Harvard homepage and preprint listing were checked on 2026-10-10; no separate correction for the index range was found.

In Schlessinger’s Remark 2.10, p. 212, the composition argument points to item 2.6(ii),(iii). The required statements are Proposition 2.5(ii),(iii), p. 211; item 2.6 only introduces tangent notation. The smoothness comparison above uses Proposition 2.5. This is a cross-reference correction, with no change to the result. The published scan and a public erratum search were checked on 2026-10-10; no separate correction was found.
