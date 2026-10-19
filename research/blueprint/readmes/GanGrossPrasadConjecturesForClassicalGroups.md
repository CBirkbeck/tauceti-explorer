# The Gan–Gross–Prasad conjectures for classical groups: relevant pairs, Vogan packets, Bessel models and periods

This roadmap supplies the shared language of classical Gan–Gross–Prasad problems and the automorphic statements that use it. A nonzero global period must satisfy local distinction, coherence and automorphic occurrence; these conditions must be kept distinct. The local packet-count theorems, normalized period factors, spectral conductor comparison and arithmetic graph periods share the same relevant inclusions and dual conventions.

The local and global fields have characteristic zero. Hermitian forms and inner products are linear in the first argument. GN.2 uses the opposite hermitian convention, so its form is conjugated on import. A bilinear model for π⊠σ branches into σ∨; the sesquilinear branching period on π and σ has tensor parameter π×σ∨. Pure inner forms retain the complementary space, and even special orthogonal packets retain the supplied outer-orbit ambiguity. Completed L-values contain all archimedean factors; the removed-place notation always displays its removed set. The refined unitary constant uses the unquotiented sign group.

GGP.0–GGP.4 establish the framework, GGP.5–GGP.7 connect classical spectral geometry with distinguished spectra and anisotropic automorphic families, and GGP.8 gives definite and conjectural arithmetic endpoints. The local nonarchimedean generic and archimedean tempered ranges are stated precisely. The SO₃/SO₂ weighted-mean correction is retained, while the Weyl law and unrestricted weak-subconvex endpoint have their own scopes.

The source set comprises Gan–Gross–Prasad, Jiang–Zhang, Beuzart-Plessis, Gan–Ichino, Mœglin–Waldspurger, Luo, Harris, BPLZZ, BCZ, Nelson–Venkatesh and Liu–Tian–Xiao–Zhang–Zhu, with version-specific theorem and page locators below. This is a target-level plan, not a claim of formalization. Known global unitary proofs are supplied by JacquetRallisRelativeTraceComparison; quantitative operator calculus, relative-character sums and limit states by QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups; unitary Shimura models by their PEL extension. Those proposed suppliers need precise registered theorem exports, as recorded in the packet contracts.

The roadmap does not rebuild classical groups, compact branching, local/global Arthur classification, general automorphic or tensor-L-function theory, the global Jacquet–Rallis comparison, the quantitative orbit calculus, integral unitary moduli or cycle theories. It does not assert the general global or arithmetic conjectures, a real nontempered local theorem, an archimedean positivity theorem absent from the stated inputs, or Abel–Jacobi nonvanishing from Chow nonvanishing alone. Fourier–Jacobi models have no routed consumer in this pass and require their own oscillator-data extension when that scope is requested.

## Layers and proof order

| Layer | Targets |
| --- | --- |
| GGP.0 | Relevant pairs and Bessel models |
| GGP.1 | Packets, Hermitian parameters and base change |
| GGP.2 | Local GGP propositions and known ranges |
| GGP.3 | Global Bessel periods and GGP propositions |
| GGP.4 | Local normalization and the unitary refinement |
| GGP.5 | Classical spectral invariants and conductor dropping |
| GGP.6 | The distinguished tempered spectrum |
| GGP.7 | Automorphic families, means and weak subconvexity |
| GGP.8 | Definite and arithmetic diagonal periods |

The within-packet dependency graph is acyclic. GGP.0 supplies models to GGP.1–GGP.4; GGP.5 and GGP.6 supply the spectral interfaces for GGP.7; GGP.8 uses the global period statement and the returned known unitary theorem. Each target below names its exact prerequisite interfaces. Incoming proof contracts are listed after the targets.

## Proven and conjectural ranges

| Assertion | Status and scope |
| --- | --- |
| Individual Bessel uniqueness | All local characteristic-zero irreducible admissible representations; archimedean Hom is continuous. |
| Unitary local packet count | Tempered nonarchimedean and real nonsplit pairs; generic nonarchimedean pairs. Discrete-series real cases are included in the tempered theorem. |
| Orthogonal local packet count | Generic nonarchimedean and tempered archimedean pairs, with supplied classification and even-SO conventions. |
| Global packet GGP | A proposition in general. Stable and endoscopic Hermitian codimension-one unitary cases are known through BPLZZ/BCZ, with proof supplied by the comparison owner. |
| Unitary Ichino–Ikeda | A proposition with known truth for cuspidal everywhere-tempered σ in the BCZ Hermitian setting; global proof imported. |
| General Jiang–Zhang descent implications | Theorem 5.7 gives period-to-central nonvanishing in its generic cuspidal setting; Theorem 6.10 gives the converse under its residual Fourier-coefficient Conjecture 6.8. The period/dual convention must be transported explicitly. Proofs belong to TwistedAutomorphicDescents. |
| Weighted automorphic mean | The orbit-method theorem with an extra non-self-twist hypothesis in SO₃/SO₂; Weyl counting and weak subconvexity have the distinct scopes below. |
| Definite arithmetic endpoint | Central nonvanishing gives an integral finite diagonal period, LTX Lemma 8.2.1. |
| Weak arithmetic GGP | Conjectural derivative-to-Chow nonvanishing, LTX Conjecture 8.3.1; no Abel–Jacobi conclusion. |

## Conventions that distinguish the targets

For the raw local form, α(v₁,v₂;u₁,u₂)=∫⟨π(h)v₁,v₂⟩⟨u₁,σ(h)u₂⟩dh. Since the inner products are linear first, its sesquilinear form on π⊗σ∨ satisfies B(v₁⊗bar(u₁),v₂⊗bar(u₂))=α(v₁,v₂;u₂,u₁). The exchanged slots are part of the interface. For the global branching coefficient the period is ∫v·overline(u), and its square is compared with this B. The bilinear global unitary period instead uses σ itself on the product group; converting between them dualizes that factor.

A local packet is not a global automorphic realization. A coherent global family of forms need not satisfy the automorphic multiplicity formula. A generic parameter need not have every member generic. A total packet multiplicity of one does not require every inner form to have a distinguished member. These distinctions are exercised by the tests.

## GGP.0. Relevant pairs and Bessel models

Define odd-complement orthogonal and unitary inclusions, their relevant pure inner twists, flag characters and Bessel functionals in the correct local categories. Relate smooth models to twisted Jacquet modules and prove individual-model uniqueness, including split GL restriction.

### Relevant Bessel pairs

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-pair` (definition).

Let F be a local field or number field of characteristic zero. Let E=F in the quadratic case, or let E/F be quadratic étale with involution c in the hermitian case. A relevant Bessel pair consists of nondegenerate spaces W⊂V, an integer ℓ≥0, and an isometry W⊥≃𝕳^ℓ⊕Ee with ⟨e,e⟩≠0. Thus dim_E V−dim_E W=2ℓ+1, and W⊥ has maximal Witt index ℓ. Put G=SO(V), H=SO(W) in the quadratic case and G=U(V), H=U(W) in the hermitian case; H acts trivially on W⊥. Retain the inclusion of spaces and the isometry class of the complement as data. For ℓ=0 and split E this includes GL_{m+1}⊃GL_m. Hermitian forms here are linear in their first argument; transport to GN.2 by conjugating its first-argument-antilinear convention.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space`; `tauceti:TauCeti.QuadraticMap.specialOrthogonalGroup`.

Uses: Jiang–Zhang, Conjecture 3.1: Fixes which inner-form pairs enter the packet sum. BCZ, §1.1.2: Specializes to h⊂h⊕h₀, h₀=the norm line. Nelson–Venkatesh, §13.2: Provides the standard representations used by spectral invariants.

API:

- `RelevantBesselPair.ofDecomposition` (constructor): An isometry V≃W⊥(𝕳^ℓ⊕Ee) supplies the pair and its inclusion.
- `RelevantBesselPair.embedding` (projection): The induced injective homomorphism H(F)→G(F) acts as the identity on W⊥.
- `RelevantBesselPair.transport` (functoriality): An isometry of inclusions transports the pair and intertwines its group embeddings; identity and composition are respected.
- `RelevantBesselPair.codimension` (simp): dim V=dim W+2ℓ+1 and the complement has Witt index ℓ.

Checks that distinguish the definition:

- `RelevantBesselPair.unitaryLine` (computation): For W=E^m with any nondegenerate hermitian form, V=W⊕⟨1⟩ has ℓ=0 and H=U(W).
- `RelevantBesselPair.zeroSmallSpace` (degenerate): W=0,V=Ee has trivial H and ℓ=0.
- `RelevantBesselPair.evenComplementExcluded` (non-example): An inclusion with a two-dimensional hyperbolic complement is not a Bessel pair of this type.

Proof route:

1. Import the form and isometry-group carriers; construct only the embedding by extension by the identity on W⊥.
2. Use a hyperbolic decomposition to retain the anisotropic line, including its norm class.

Acceptance checks: For a norm-one line, U(W)→U(W⊕E) sends h to h⊕1. In the quadratic case use SO, including determinant one; do not replace it by O.

Sources: [ggp12](#ggp12), §2, pp. 5–7; §12, pp. 43–45: Odd split complements determine the restriction problem and its Bessel subgroup. [jz20](#jz20), §3.1, pp. 760–761: The classical-group relevance condition is phrased using a nondegenerate subspace and its split odd complement. [nv21](#nv21), §13.2, p. 92: The codimension-one specialization includes orthogonal, unitary and split general linear pairs.

### Relevant pure inner forms

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-inner-forms` (construction).

For a fixed relevant pair W⊂V=W⊕C over F, form the groupoid of pairs Wᵅ⊂Vᵅ=Wᵅ⊕C obtained by twisting the inclusion by a class α∈H¹(F,H). In the hermitian case Wᵅ ranges over forms of the same rank; in the quadratic case it ranges over forms of the same rank and discriminant, with oriented twisting data retained. This is the image of H¹(F,H) in the twisting data for G×H. Tag each pair by its form data, rather than taking all independent products of pure inner forms or identifying different twists merely because their point groups are abstractly isomorphic.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-pair`; `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-space-classification`; `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

Uses: Local packet multiplicity sum, GGP.2: Indexes its summands without including irrelevant products. Global coherent packets, GGP.1: Tests whether local forms come from a global inclusion.

API:

- `RelevantInnerForm.twist` (constructor): A cocycle in H yields a twisted pair and descent isomorphisms over F̄.
- `RelevantInnerForm.complement` (projection): The complement of Wᵅ in Vᵅ is isometric to C.
- `RelevantInnerForm.isometry_iff` (characterisation): Two tagged twists agree exactly under an isometry of inclusions respecting the retained twisting equivalence.
- `RelevantInnerForm.localize` (functoriality): Localization of a global twisted pair agrees with the corresponding local twist.

Checks that distinguish the definition:

- `RelevantInnerForm.neutral` (degenerate): The neutral cocycle gives the original pair.
- `RelevantInnerForm.realUnitary` (computation): Twisting U(p,q)⊂U(p+1,q) with fixed positive norm line permits U(a,b)⊂U(a+1,b), a+b=p+q.
- `RelevantInnerForm.wrongComplement` (non-example): The pairs U(1,0)⊂U(2,0) and U(1,0)⊂U(1,1) have different complementary norm lines and are not relevant twists with the same C.

Proof route:

1. Apply twisting to the embedding, using the cohomological machinery of ET.0.
2. Identify the resulting forms through the isometry classification, retaining C and the SO orientation convention.

Acceptance checks: At a nonarchimedean nonsplit unitary place with positive smaller rank there are two relevant form classes. No universal assertion that every low-rank orthogonal case has four independent forms is used.

Sources: [ggp12](#ggp12), Lemma 2.1 and §2, pp. 6–7: Pure inner forms of U and SO are described by forms; relevance preserves the complementary space. [bp20](#bp20), Introduction, pp. 1–2: The disjoint packet union is indexed by H¹(F,H) with Vα=Wα⊕W⊥.

Exact incoming or proof-refinement contracts: P1.

### Bessel subgroup and character

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-datum` (construction).

For a relevant pair with V=W⊕(X⊕X*⊕Ee), dim X=ℓ, choose a complete isotropic flag 0⊂X₁⊂⋯⊂Xℓ=X and a nontrivial additive character ψ_F of F. Let P be its stabilizer in G and N its unipotent radical. The standard simple-root coordinates of N consist of the ℓ−1 adjacent flag coordinates and the final coordinate obtained by pairing n(e) with the last dual flag vector. Compose their sum with ψ_F, using the trace to F in the hermitian case and the fixed form normalization, to get ψ_N. The diagonal H fixes ψ_N; set R=H⋉N and ψ_R(hn)=ψ_N(n). At ℓ=0 set N=1 and ψ_R=1. The attached partition is [(2ℓ+1),1^(dim V−2ℓ−1)]. Auxiliary choices give conjugate model data for the fixed inclusion, with the character transported along that conjugacy.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-pair`; `SmoothRepresentationsOfLocalGroups:SR.2`.

Uses: Jiang–Zhang, §3.2 and (4.7): Defines both local Bessel models and the Fourier coefficient in the global period.

API:

- `BesselDatum.subgroup` (projection): R maps injectively into G×H by (hn,h); the N component acts only through G.
- `BesselDatum.character_mul` (structure): ψ_R(rr′)=ψ_R(r)ψ_R(r′) and |ψ_R(r)|=1.
- `BesselDatum.character_on_H` (simp): ψ_R(h)=1 on the diagonal H.
- `BesselDatum.conjugateEquiv` (equivalence): Conjugation transporting the flag and character gives an equivalence of model Hom spaces.

Checks that distinguish the definition:

- `BesselDatum.codimOne` (degenerate): If ℓ=0, R is the diagonal copy of H and ψ_R is trivial.
- `BesselDatum.whittakerBoundary` (compatibility): If W=0, R=N and its specified character is the generic character on the maximal unipotent determined by the flag.
- `BesselDatum.partitionDimension` (computation): For dim V=7,dim W=2,ℓ=2 the partition is [5,1,1], not [5,1,1,1,1].

Proof route:

1. Import parabolic and unipotent-radical structure. Check that the displayed coordinate sum factors through the appropriate abelianization of N.
2. Verify H-invariance and the semidirect-product character law; transport under changes of flag and nonzero scalar choices by conjugation.

Acceptance checks: The character is trivial on H and nontrivial in every prescribed simple-root coordinate. The partition parts sum to dim V, including ℓ=0.

Sources: [ggp12](#ggp12), §12, pp. 43–45, explicit flag-coordinate construction: The Bessel character combines adjacent flag entries with the last entry against the nonisotropic vector. [jz20](#jz20), §3.2, p. 762: Identifies the stabilizer, semidirect product and Bessel partition; the corrected exponent preserves total dimension.

### Local Bessel functionals

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-functional` (definition).

For a local field F of characteristic zero, Bessel data (R,ψ_R) and irreducible admissible representations π of G(F), σ of H(F), define B(π,σ)=Hom_R(π⊗σ,ℂ_{ψ_R}), so ℓ((π(g)⊗σ(h))v)=ψ_R(g,h)ℓ(v). Over a nonarchimedean field use the algebraic tensor product of smooth representations. Archimedeanly use Casselman–Wallach smooth globalizations, the completed projective tensor product and continuous linear maps. Its finite dimension m(π,σ) is the Bessel multiplicity. The light algebraic predicate IsBesselFunctional(ρ,χ,L) means ∀r v,L(ρ(r)v)=χ(r)L(v), on an existing representation carrier; it does not assert continuity. For ℓ=0, B(π,σ) identifies with Hom_H(π,σ∨), with the appropriate smooth or continuous dual convention.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-datum`; `mathlib:Representation.IntertwiningMap`; `mathlib:Representation.dual`; `AutomorphicSpectralTheory:AS.0/projective-tensor`; `AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization`.

Uses: Local GGP proposition, GGP.2: Supplies the summand m(π,σ). Global period local necessity, GGP.3: The global functional yields local model functionals.

API:

- `IsBesselFunctional` (characterisation): For an existing complex representation ρ of R and χ:R→*ℂ, the predicate is exactly L(ρ(r)v)=χ(r)L(v).
- `IsBesselFunctional.zero` (simp): The zero linear map satisfies the predicate.
- `IsBesselFunctional.smul` (structure): Scalar multiples of a Bessel functional are Bessel functionals.
- `IsBesselFunctional.trivial_iff` (characterisation): For χ=1 the condition is invariance L(ρ(r)v)=L(v).
- `IsBesselFunctional.trivialCharacter_ne` (characterisation): On the trivial one-dimensional representation, the identity functional satisfies the condition iff χ=1.
- `BesselFunctional.transport` (functoriality): Intertwining isomorphisms of both representations induce linear equivalences of B spaces.
- `BesselFunctional.codimOne` (equivalence): At ℓ=0 the space is Hom_H(π,σ∨), with continuity in the archimedean case.

Checks that distinguish the definition:

- `IsBesselFunctional.test_zero` (degenerate): The zero map is Bessel-equivariant for any ρ and χ.
- `IsBesselFunctional.test_trivial_id` (computation): For ρ=1 on ℂ and χ=1, LinearMap.id is Bessel-equivariant.
- `IsBesselFunctional.test_nontrivial` (non-example): If χ≠1, LinearMap.id on the trivial representation of R on ℂ is not Bessel-equivariant.

Proof route:

1. Use the imported intertwining-map space rather than introducing a second abstract Hom construction.
2. For the topological version impose continuity on the completed tensor carrier. For codimension one curry the bilinear functional into the smooth contragredient.

Acceptance checks: Bilinear σ corresponds to σ∨ in branching; replacing σ by σ∨ changes the tensor parameter. The algebraic predicate alone never supplies an archimedean model.

Sources: [ggp12](#ggp12), §14, pp. 55–56; §15, pp. 58–59: Specifies the representation categories, tensor topology and model Hom spaces. [jz20](#jz20), §3.2, pp. 762–763: Bessel uniqueness and the conjecture use this Hom space.

### Twisted Jacquet realization

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/twisted-jacquet-comparison` (comparison).

Over a nonarchimedean local field of characteristic zero let π be smooth and put J_{N,ψ}(π)=π/span{π(n)v−ψ_N(n)v}. H acts on this quotient because it normalizes (N,ψ_N). There is a natural linear isomorphism B(π,σ)≃Hom_H(J_{N,ψ}(π),σ∨). Use unnormalized twisted coinvariants; no modulus character is inserted. The analogous archimedean algebraic quotient is not substituted for continuous Bessel functionals.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-functional`; `SmoothRepresentationsOfLocalGroups:SR.2`.

Proof route:

1. Apply the universal property of the quotient to curry an R-equivariant bilinear functional.
2. H-invariance of ψ makes the H-action well-defined; uncurry for the inverse.

Acceptance checks: For N=1 this is ordinary restriction and Hom_H(π,σ∨). For a one-dimensional N-character θ≠ψ the quotient is zero.

Sources: [jz20](#jz20), §3.2, pp. 762–763: Expresses the local model by twisted Jacquet modules. [ggp12](#ggp12), §15, pp. 58–62: Uses the character-equivariant quotient and induction to compare Bessel multiplicities.

### Uniqueness of Bessel models

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-uniqueness` (theorem).

For every relevant orthogonal or unitary Bessel pair over a local field of characteristic zero and irreducible admissible π,σ, m(π,σ)≤1. At archimedean places representations are Casselman–Wallach and functionals continuous. In codimension one this also holds for split GL_{m+1}⊃GL_m: dim Hom_H(π,σ)≤1. No genericity or temperedness is required for this individual-pair bound.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-functional`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/twisted-jacquet-comparison`; `SmoothRepresentationsOfLocalGroups:SR.2`; `AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization`.

Proof route:

1. For codimension one apply the invariant-distribution multiplicity-one criteria of AGRS (nonarchimedean) and Sun–Zhu (archimedean); the exact distribution inputs are recorded as gap L1 rather than assumed to follow from Schur’s lemma.
2. For ℓ>0 use GGP Theorem 15.1 with an auxiliary supercuspidal representation outside the finitely many forbidden Bernstein supports; use its archimedean counterpart for continuous models.
3. The resulting Hom identification transfers the codimension-one bound.

Acceptance checks: For compact U(2)⊃U(1), each weight in an irreducible restriction has multiplicity one, agreeing with the existing Classical Groups branching theorem. A zero Hom space is allowed; multiplicity one does not assert nonvanishing.

Sources: [ggp12](#ggp12), Theorems 14.1 and 15.1, pp. 56–59; Corollary 15.3 and following remark, p. 62: Codimension-one multiplicity one and induction reduce general odd-codimension Bessel models to that case. [jz20](#jz20), §3.2, p. 763: Records the uniqueness theorem in all local characteristic-zero cases. [nv21](#nv21), Remark 18.2, p. 122: Uses the codimension-one statement to obtain a one-dimensional line of invariant forms.

Exact incoming or proof-refinement contracts: L1.

Planets: Relevant Bessel pairs, Relevant pure inner forms, Bessel data, Bessel multiplicity, Uniqueness of Bessel models.

## GGP.1. Packets, Hermitian parameters and base change

Specialize supplied local and global packet classifications to relevant form pairs. Retain coherence, actual automorphic realizations, even-SO orbit conventions and generic-discrete cuspidality. Define Hermitian isobaric parameters, the unquotiented sign group and split-almost-everywhere weak base change, and compare the latter with strong base change only in its proven range.

### Local relevant Vogan packets

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/local-relevant-packet` (definition).

Fix a quasi-split relevant pair, Whittaker normalization, and a pair φ=(φ_G,φ_H) of local Langlands parameters for its L-groups. Assume the packet correspondences of ML.4 for the indicated inner forms. Define the relevant Vogan packet as the tagged disjoint union of Π_{φ_G}(Gᵅ)×Π_{φ_H}(Hᵅ) over the relevant pure inner forms of GGP.0; an individual packet can be empty for an inner form to which φ is not relevant. Use actual irreducible representations with their form tags. A generic parameter means its quasi-split packet contains a Whittaker-generic representation, not that every member is generic. Tempered means bounded Weil-group image. When an even-SO supplier gives only outer-conjugacy orbits, retain those orbits and formulate any sharper labeling conditionally on a full normalization; do not select representatives canonically.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-inner-forms`; `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`; `ModularityAndLanglandsExtensions:ML.4/kmsw-inner-forms`; `ModularityAndLanglandsExtensions:ML.4/vogan-packets-so-v`.

Uses: Jiang–Zhang, Conjecture 3.1: Provides the index set of the multiplicity sum. Nelson–Venkatesh, Lemma 24.1: Packet uniqueness prevents two distinguished representations from sharing one induction parameter.

API:

- `RelevantVoganPacket.mk` (constructor): A relevant twist and members of its two packets give a tagged member.
- `RelevantVoganPacket.form` (projection): Each member returns the common relevant form pair.
- `RelevantVoganPacket.mem_iff` (characterisation): Membership is precisely relevance together with membership in both supplied packets.
- `RelevantVoganPacket.equivalence` (functoriality): Compatible normalized isomorphisms of input data induce bijections, preserving Bessel multiplicity.

Checks that distinguish the definition:

- `RelevantVoganPacket.emptyForm` (degenerate): If one component packet on a twist is empty, that twist contributes no members.
- `RelevantVoganPacket.splitGL` (compatibility): For split unitary pairs the individual GL packets are singletons and there is no additional pure inner form from E/F.
- `RelevantVoganPacket.irrelevantProduct` (non-example): A π on U(a,b) and σ on U(c,d) with no inclusion having the fixed complement do not form a member even if both individual parameters match.

Proof route:

1. Import each individual packet and relevance test from ML.4, including all its classification hypotheses.
2. Take the disjoint union over twists of the inclusion rather than the Cartesian product of two unrestricted Vogan unions.

Acceptance checks: The packet sum counts the same representation on different retained form data separately only when the twisting equivalence requires it. No global parameter is required for the local definition.

Sources: [jz20](#jz20), §3.1–3.2, (3.4), pp. 760–763: Forms the relevant packet union for localizations of generic global parameters. [ggp12](#ggp12), §17, pp. 65–69: States packet multiplicity and its dependence on a fixed local parametrization.

Exact incoming or proof-refinement contracts: P1.

### Coherent global Vogan packets

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/global-coherent-packet` (definition).

For a number field F and generic discrete global parameters φ_G,φ_H, use their localizations and supplied unramified distinguished vectors to form restricted tensor products of members of the local relevant packets. Call such data coherent when there is one global relevant inclusion W⊂V whose localizations are the specified form pairs. The coherent global packet consists of these data together with the global group; its cuspidal automorphic subset further requires an actual cuspidal realization. Local membership does not assert coherence or automorphic occurrence. The latter is tested by the appropriate global multiplicity formula, retaining even-SO outer information and the classification assumptions of ML.4.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/local-relevant-packet`; `AutomorphicFormsOnReductiveGroups:AF.2/restricted-tensor-product`; `ModularityAndLanglandsExtensions:ML.4/global-arthur-parameter`; `ModularityAndLanglandsExtensions:ML.4/arthur-multiplicity-formula`; `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`; `ModularityAndLanglandsExtensions:ML.4/kmsw-inner-forms`.

Uses: Global GGP packet proposition, GGP.3: Makes its existence quantifier range over actual global groups and cusp forms. Gan–Gross–Prasad, Conjecture 26.1: Separates coherence and multiplicity from central nonvanishing.

API:

- `CoherentVoganPacket.local` (projection): Localization gives a member of the local relevant packet at every place.
- `CoherentVoganPacket.ofGlobalForm` (constructor): A global relevant form pair and a restricted family of local members give coherent data.
- `CoherentVoganPacket.cuspidalMember` (projection): A cuspidal member includes its chosen automorphic realization, not only an abstract tensor product.
- `CoherentVoganPacket.transport` (functoriality): A global isometry of inclusions transports the packet and periods compatibly.

Checks that distinguish the definition:

- `CoherentVoganPacket.actualGlobal` (compatibility): Localizations of any global relevant pair satisfy the same global form invariants and are coherent.
- `CoherentVoganPacket.badProductFormula` (non-example): Local hermitian forms whose determinant invariants violate the global product formula are excluded even if each local packet is nonempty.
- `CoherentVoganPacket.nonAutomorphic` (non-example): A coherent restricted tensor product with the wrong global component character is not an automorphic packet member.

Proof route:

1. Take restricted tensor products with spherical choices at almost all places.
2. Apply local-to-global form classification for coherence, then the separate global packet multiplicity criterion for occurrence.

Acceptance checks: A global central sign condition is necessary but cannot replace the full multiplicity formula. Generic discrete automorphic members are used as cuspidal only with the precise supplied cuspidality theorem (gap P2).

Sources: [ggp12](#ggp12), §25, pp. 91–96; §26, pp. 97–100: Distinguishes an unrestricted local tensor product, coherence of forms and the automorphic multiplicity condition. [jz20](#jz20), §6.2, pp. 802–804: Uses cuspidal members with generic global Arthur parameters.

Exact incoming or proof-refinement contracts: P1.

### Hermitian generic discrete parameters

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/hermitian-isobaric-parameter` (definition).

For a quadratic extension E/F of number fields and N≥1, a Hermitian generic discrete parameter of rank N is the imported isobaric sum Π=⊞_{i=1}^r Π_i, ΣN_i=N, of pairwise nonisomorphic unitary conjugate-self-dual cuspidal Π_i on GL_{N_i}(𝔸_E), each of sign (−1)^{N−1}. Analytically require L(s,Π_i,As^{(−1)^{N+1}}) to have a pole at s=1. Equivalently its opposite-parity Asai factor As^{(−1)^N} is regular there, using the conjugate-self-dual cuspidal Asai dichotomy (gap F1). The parity uses total N. The associated representation is full normalized induction in the unitary isobaric case. This is a generic discrete Arthur parameter, with all SL₂ multiplicities one, not a general Arthur parameter.

Prerequisites: `AutomorphicSpectralTheory:AS.2/isobaric-sum`; `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles`; `AutomorphicLFunctionsAndLocalFactors:AL.4`; `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Uses: BCZ, Theorems 1.1.5.1 and 1.1.6.1: Specifies the endoscopic unitary parameters in the global and refined assertions. BPLZZ, Theorem 1.8: Its stable case has one constituent in each factor.

API:

- `HermitianParameter.constituents` (data): Returns the unordered distinct cuspidal multiset with ranks and sign evidence.
- `HermitianParameter.isobaric` (coercion): The underlying representation is the AS.2 isobaric sum.
- `HermitianParameter.ext` (extensionality): Equality up to isomorphism is equivalent to equality of the constituent multisets.
- `HermitianParameter.asaiParity` (characterisation): Pole for parity (−1)^{N+1} is equivalent to regularity for parity (−1)^N, under the Asai dichotomy.

Checks that distinguish the definition:

- `HermitianParameter.cuspidal` (degenerate): For r=1, the component is a conjugate-self-dual cusp form of total-rank sign (−1)^{N−1}.
- `HermitianParameter.totalParity` (computation): For N=3 and a rank-two constituent, the required pole is As⁺, irrespective of the constituent’s even rank.
- `HermitianParameter.repetitionExcluded` (non-example): Π₀⊞Π₀ is excluded by distinctness.

Proof route:

1. Import isobaric sums from AS.2, not a duplicate induction construction.
2. Filter the unique multiset of constituents by distinctness, conjugate self-duality and total-rank sign; compare the two parity descriptions via the Asai dichotomy.

Acceptance checks: For r=1 this recovers the stable cuspidal situation. A repeated constituent is excluded even when the induced representation is irreducible.

Sources: [bplzz21](#bplzz21), Definition 1.5, p. 3: Uses distinct conjugate-self-dual cuspidal constituents and regularity of the opposite-parity Asai factor. [bcz22](#bcz22), §1.1.3 and Remark 1.1.3.1, pp. 184–185: Uses the pole parity and full induced representation for generic discrete Hermitian parameters.

Exact incoming or proof-refinement contracts: F1.

### The component group used in period constants

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/ii-component-group` (definition).

For a Hermitian generic discrete parameter with r distinct cuspidal constituents, define S_Π=(ℤ/2ℤ)^r, canonically the signs on the constituent set. For Π=Π_n⊠Π_{n+1} use S_Π=S_{Π_n}×S_{Π_{n+1}}. This is the unquotiented component group of the conjugate-self-dual parameter centralizer used by BCZ’s period formula; do not substitute the quotient by a diagonal central sign from a different Arthur notation.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/hermitian-isobaric-parameter`.

Uses: Refined unitary GGP, GGP.4: Supplies the denominator in the global square-period identity.

API:

- `IIComponentGroup.sign` (projection): Evaluates a sign at a constituent.
- `IIComponentGroup.card` (simp): A rank-r constituent index set gives cardinality 2^r.
- `IIComponentGroup.product` (equivalence): The group for Π_n⊠Π_{n+1} is the product of the two sign groups.
- `IIComponentGroup.reindex` (functoriality): A constituent bijection induces the corresponding group isomorphism.

Checks that distinguish the definition:

- `IIComponentGroup.stablePair` (computation): If both parameters are cuspidal, |S_Π|=4.
- `IIComponentGroup.endoscopicPair` (computation): Two constituents in Π_n and one in Π_{n+1} give |S_Π|=8.
- `IIComponentGroup.centralQuotientExcluded` (non-example): Dividing the stable-pair group by a diagonal sign would give 2 and is not this normalization.

Proof route:

1. The centralizer acts by independent signs on the multiplicity-one self-dual blocks.
2. Keep the canonical indexed sign group; reordering constituents transports it by a permutation isomorphism.

Acceptance checks: |S_Π|=2^(r_n+r_{n+1}). This numerical convention must be checked before comparing an alternative component-group normalization.

Sources: [bcz22](#bcz22), §1.1.3, pp. 184–185; Theorem 1.1.6.1, pp. 187–188: Defines the sign groups and uses their product order in the refined constant.

### Weak unitary base change

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/weak-base-change` (definition).

Let π be an irreducible admissible representation of U(V)(𝔸_F) for E/F quadratic, and Π an isobaric automorphic representation on GL_N(𝔸_E). Say Π is a weak base change of π if, at almost every finite place v of F split in E, Π_v equals the split local base change of π_v. With E_v=F_v×F_v this is the pair (π_v,π_v∨), with the two factors interchanged when the chosen place over v is interchanged. The definition alone gives neither existence nor cuspidality of π or Π. For the global period statements restrict Π to a Hermitian parameter and π to a cuspidal realization.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/hermitian-isobaric-parameter`; `AutomorphicFormsOnReductiveGroups:AF.2/restricted-tensor-product`; `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`.

Uses: BPLZZ, Theorem 1.8 and Remark 4.17: Labels global period realizations by their GL transfers. BCZ, §1.1.4: Lets the main identities be stated without assuming the full classification.

API:

- `WeakBaseChange.split_ae` (projection): Returns the split local equalities outside a finite exceptional set.
- `WeakBaseChange.congr` (functoriality): Isomorphic source or target representations preserve the relation.
- `WeakBaseChange.finiteChange` (characterisation): Enlarging the exceptional finite set gives the same relation.
- `WeakBaseChange.ofStrong` (compatibility): All-place parameter-compatible base change implies weak base change.

Checks that distinguish the definition:

- `WeakBaseChange.splitDual` (computation): At E_v=F_v×F_v the two target factors are ρ and ρ∨, not two copies of a non-self-dual ρ.
- `WeakBaseChange.finiteException` (compatibility): Removing one additional split place leaves the definition unchanged.
- `WeakBaseChange.noExistence` (non-example): The predicate on π and Π does not assign a Π to an arbitrary admissible π.

Proof route:

1. Use the split isomorphism U(V)(F_v)≃GL_N(F_v) and the conjugate-self-dual standard embedding.
2. State the almost-everywhere relation on isomorphism classes; strong all-place compatibility is a separate classification-dependent theorem.

Acceptance checks: Changing finitely many tested places does not change the condition. No existence assertion for a merely admissible adelic representation follows from Remark 1.7.

Sources: [bplzz21](#bplzz21), Definition 1.6, pp. 3–4; Remark 1.7, p. 4; Theorem 4.14, pp. 39–40: Defines the split-almost-everywhere condition; the existence theorem requires cuspidal automorphy. [bcz22](#bcz22), §1.1.4 and Remark 1.1.4.1, p. 185: Retains weak base change while explaining comparison to strong base change via classification.

### Uniqueness of weak base change

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/weak-base-change-unique` (theorem).

For E/F quadratic and fixed π, two isobaric automorphic representations Π and Π′ of GL_N(𝔸_E) that are weak base changes of π are isomorphic. Agreement at the split places of F is enough because these are the relative-degree-one places of E/F, and E/F is a normal extension. This conclusion is uniqueness, not existence. Whenever the classification supplies a strong base change, it is this unique weak one.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/weak-base-change`; `AutomorphicLFunctionsAndLocalFactors:AL.3/ramakrishnan-degree-one`.

Proof route:

1. At every split v outside the union of the two finite exceptional sets the two target representations agree at both places over v.
2. Apply AL.3/ramakrishnan-degree-one to the normal quadratic extension, with the isobaric hypothesis checked.

Acceptance checks: For rank one the argument compares characters on degree-one primes; it is not the unsupported claim that agreement on any positive-density set implies equality.

Sources: [bplzz21](#bplzz21), Remark 1.7, p. 4: Cites degree-one strong multiplicity one for the uniqueness assertion. [bcz22](#bcz22), Remark 1.1.4.1, p. 185: Explains uniqueness and comparison of weak with classified base change.

### The quasi-split unitary pair

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/quasi-split-unitary-pair` (theorem).

For a quadratic extension E/F of local or number fields of characteristic zero, a fixed positive rank n and fixed nonzero norm line C, there is exactly one isometry class of rank-n hermitian W such that both U(W) and U(W⊕C) are quasi-split over F. For a number field the resulting pair is quasi-split at every place and has compatible unramified forms away from the ramification of E/F and finitely many chosen integral-model places. This uniqueness is of the spaces with the fixed complement, not just of the abstract unitary groups.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-inner-forms`; `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-space-classification`.

Proof route:

1. At each place classify hermitian forms by rank and determinant/signature. In consecutive ranks the even-rank quasi-split form fixes the determinant, which fixes its odd-rank companion with complement C.
2. Use the global form-classification and product formula in the number-field case to glue the compatible local choices; P1 retains any absent local-global form input.

Acceptance checks: Over ℝ with C positive, for n=1 the pair is U(0,1)⊂U(1,1); taking a positive smaller line would give non-quasi-split U(2). Two isomorphic abstract U(1) groups need not give the same relevant pair.

Sources: [bplzz21](#bplzz21), §4.4, proof of Theorem 1.9, p. 42: Identifies the unique quasi-split pair among relevant unitary forms and its unramified localizations. [ggp12](#ggp12), §2, pp. 5–7: Uses the fixed complement to distinguish relevant form pairs.

Exact incoming or proof-refinement contracts: P1.

### Weak and strong unitary base change

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/weak-strong-base-change` (comparison).

Let σ be a cuspidal automorphic representation of U(W) or of the codimension-one unitary product, with a Hermitian generic discrete weak base change Π. Under the Mok–KMSW global/local classification assumptions carried by ML.4, σ has parameter-compatible base change at every place, and that strong base change equals Π. The proof uses uniqueness of the isobaric weak transfer. Separately, without invoking classification, BPLZZ Theorem 4.14(1) supplies weak base-change existence for a cuspidal π having generic components at infinitely many split places; (2) supplies a cuspidal Hermitian transfer if some split component is supercuspidal. These existence proofs are inputs J1, not a theorem for arbitrary admissible π.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/weak-base-change-unique`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/hermitian-isobaric-parameter`; `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`; `ModularityAndLanglandsExtensions:ML.4/kmsw-inner-forms`.

Proof route:

1. Use the supplied global classification to attach the all-place transfer with the same almost-everywhere split data.
2. Apply weak-transfer uniqueness to identify it with Π, then read off every local compatibility.
3. Record the separate BPLZZ existence ranges with their actual cuspidality and split-place hypotheses in J1.

Acceptance checks: Weak transfer alone does not determine arbitrary ramified components without the classification-dependent existence of a strong transfer.

Sources: [bcz22](#bcz22), Remark 1.1.4.1, p. 185: Compares all-place classified base change with its weak formulation using uniqueness. [bplzz21](#bplzz21), Theorem 4.14(1)–(2) and Remark 4.15, pp. 39–40: The classification-independent existence statements explicitly require a cuspidal automorphic source.

Exact incoming or proof-refinement contracts: J1.

### Cuspidality of generic discrete packet members

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/generic-discrete-members-cuspidal` (theorem).

For a generic discrete global Arthur parameter φ of an orthogonal or unitary group, every member of the coherent global Vogan packet which occurs in the discrete automorphic spectrum of a relevant pure inner form is cuspidal, under the applicable global classification and residual-spectrum theorem. This assertion concerns actual discrete automorphic members; it does not assert automorphy of all coherent restricted tensor products. Retain the even-SO outer-orbit convention and every classification condition of the supplier.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/global-coherent-packet`; `AutomorphicSpectralTheory:AS.4/residual-spectrum`; `ModularityAndLanglandsExtensions:ML.4/arthur-multiplicity-formula`; `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`; `ModularityAndLanglandsExtensions:ML.4/kmsw-inner-forms`.

Proof route:

1. Use the supplied classification to identify the discrete parameter of the automorphic member.
2. A noncuspidal discrete member is residual. Apply the residual-parameter exclusion contract P2: a residual discrete classical representation has a nontrivial Arthur SL₂ block and cannot have a generic discrete parameter.
3. The direct cited Jiang–Liu proof has not been independently read here; P2 records that source/closure obligation instead of treating this argument as an already available theorem.

Acceptance checks: A residual representation with a nontrivial SL₂ factor does not satisfy the generic-parameter hypothesis. A coherent nonautomorphic tensor is outside the statement.

Sources: [jz20](#jz20), §6.3, p. 803, statement citing Jiang–Liu §3: Uses cuspidality of discrete automorphic members of a generic parameter before constructing the opposite global GGP implication.

Exact incoming or proof-refinement contracts: P2.

Planets: Relevant Vogan packets, Coherent global packets, Hermitian parameters, Weak base change.

## GGP.2. Local GGP propositions and known ranges

Formulate the packet-count proposition and its unique-member equivalence. Establish the tempered nonarchimedean and real unitary, generic nonarchimedean orthogonal and unitary, and tempered archimedean orthogonal cases with their classification and analytic assumptions. Derive injectivity of transfer on the distinguished locus.

### The local GGP proposition

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/local-ggp-proposition` (definition).

For a generic pair of local parameters φ and the normalized relevant Vogan packet of GGP.1, define LocalGGP(φ) to be the proposition Σ_{(α,π,σ)∈Π^rel_φ} m(π,σ)=1. The sum is over the finite relevant packet, including all relevant pure inner forms. With individual-model uniqueness, this is equivalent to existence of exactly one tagged pair with a nonzero Bessel model. This definition is not an axiom or an assertion for arbitrary nongeneric Arthur parameters. For an even-SO orbit-valued correspondence use the matched formulation of the supplier; the sharper representation-valued version requires the refined labeling input P1.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-uniqueness`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/local-relevant-packet`.

Uses: BPLZZ, proof of Lemma 4.9: Gives injectivity of transfer on distinguished tempered representations. BCZ, §10.3.5: Eliminates all but one term in a packet contribution.

API:

- `LocalGGP.iff_unique` (characterisation): Under m≤1, LocalGGP is equivalent to a unique packet member with m=1.
- `LocalGGP.transport` (functoriality): A packet bijection preserving m preserves LocalGGP.
- `LocalGGP.atMostOneOnForm` (relation): LocalGGP implies at most one distinguished member on any fixed relevant form pair.
- `LocalGGP.ofSingleton` (simp): On a singleton relevant packet the proposition is m=1 for its member.

Checks that distinguish the definition:

- `LocalGGP.singleton` (degenerate): For a singleton packet with multiplicity one the proposition holds.
- `LocalGGP.twoDistinguished` (non-example): A two-element packet with multiplicities (1,1) fails LocalGGP despite individual uniqueness.
- `LocalGGP.emptyPacket` (non-example): An empty packet has sum zero and fails the proposition.

Proof route:

1. Construct a proposition from the finite packet and the already defined multiplicity.
2. Use nonnegative integral multiplicities bounded by one to prove the unique-member reformulation.

Acceptance checks: No particular inner form is asserted to contain the distinguished pair. No epsilon-character formula is silently included in the weaker packet-count proposition.

Sources: [jz20](#jz20), Conjecture 3.1 and Theorem 3.2, p. 763: The conjecture is the total multiplicity-one identity, followed by the specific known ranges. [ggp12](#ggp12), Conjecture 17.1, pp. 65–66: Predicts one distinguished representation across relevant forms.

### Tempered local GGP for unitary pairs

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/unitary-tempered` (theorem).

Let F be nonarchimedean of characteristic zero or F=ℝ, E/F a quadratic field extension, and W⊂V a relevant hermitian Bessel pair. For every tempered parameter pair, LocalGGP holds across the relevant pure inner forms. Smooth vectors carry their usual admissible or Casselman–Wallach topology and Hom means continuous archimedeanly. This is the packet-count theorem; no stronger epsilon-label theorem is attributed to Astérisque 418 alone. In split unitary cases use the corresponding GL restriction theorem and Rankin–Selberg model separately.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/local-ggp-proposition`; `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`; `ModularityAndLanglandsExtensions:ML.4/kmsw-inner-forms`; `EndoscopicTransferAndUnitaryTraceComparison:ET.1`.

Proof route:

1. Use the local relative trace and multiplicity formula of BP20; its exact analytic closure is registered in L2.
2. Apply the endoscopic character identities from ML.4 and transfer from ET.1 to the geometric multiplicities. Cancellation leaves the single quasi-split regular contribution, equal to one.
3. Combine total mass one with individual uniqueness.

Acceptance checks: For a codimension-one pair the invariant character is trivial. For compact real unitary groups, the distinguished member agrees with the existing interlacing branching rule.

Sources: [bp20](#bp20), Theorem 1, pp. 1–2; Theorems 11.4.2 and 12.4.1, pp. 247, 264–265: The multiplicity formula gives a total mass of one for the relevant tempered packet union. [jz20](#jz20), Theorem 3.2, p. 763: Includes tempered p-adic and real unitary cases.

Exact incoming or proof-refinement contracts: L2.

### Generic local GGP for p-adic orthogonal pairs

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/orthogonal-generic-nonarch` (theorem).

Let F be nonarchimedean of characteristic zero and W⊂V a relevant quadratic Bessel pair. For generic local parameter pairs, the normalized local Gross–Prasad multiplicity theorem of Mœglin–Waldspurger gives LocalGGP, using the packet and endoscopic classification hypotheses explicitly carried by ML.4. The even-SO assertion uses its retained outer-conjugacy convention; a fully labeled strengthening requires P1. The theorem is not an extension to nongeneric Arthur packets.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/local-ggp-proposition`; `ModularityAndLanglandsExtensions:ML.4/generic-packets-standard-modules`; `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`; `ModularityAndLanglandsExtensions:ML.4/vogan-packets-so-v`; `SmoothRepresentationsOfLocalGroups:SR.2`; `EndoscopicTransferAndUnitaryTraceComparison:ET.1`.

Proof route:

1. For tempered packets use Waldspurger’s local multiplicity formula and endoscopic comparison (analytic input L2).
2. Import irreducibility of standard modules for generic packets from ML.4, retaining its own dependency gate.
3. Use the induction invariance of multiplicity, MW Proposition 1.3, to remove positive exponents and reduce to the tempered pair; the supercuspidal-support avoidance is not an arbitrary induction equivalence.

Acceptance checks: Tempered parameter pairs are included. Even orthogonal packet labels are not chosen from an outer orbit without additional data.

Sources: [mw-generic](#mw-generic), Introduction, theorem and classification qualifications, pp. 1–4; proposition of §1.3, p. 6; §3, pp. 39–41: Reduction of generic standard modules to tempered multiplicities, with classification assumptions and even-SO qualifications stated in the source. [jz20](#jz20), Theorem 3.2, p. 763: Lists the orthogonal nonarchimedean generic range.

Exact incoming or proof-refinement contracts: L2, L3.

### Tempered local GGP for archimedean orthogonal pairs

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/orthogonal-tempered-arch` (theorem).

For F=ℝ or ℂ, a relevant quadratic Bessel pair and tempered Langlands parameter pair, the orthogonal packet-count theorem LocalGGP holds, with continuous Hom on Casselman–Wallach globalizations and normalized packets as above. This is the tempered range of Luo’s local trace formula; the theorem here makes no claim about generic nontempered real parameters.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/local-ggp-proposition`; `AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization`; `EndoscopicTransferAndUnitaryTraceComparison:ET.1`; `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`.

Proof route:

1. Use the real local trace formula, nilpotent-germ comparison and packet cancellation from Luo §§4–8 (L2).
2. Verify the orientation and even-SO conventions against the supplied packet correspondence before taking the sum.

Acceptance checks: The compact SO(3)⊃SO(2) restriction agrees with multiplicity one for the weights −j,…,j. No nonarchimedean algebraic Jacquet-quotient argument is used as an archimedean continuity proof.

Sources: [luo20](#luo20), §1, pp. 2–4; Theorem 8.3.2, p. 62: Establishes the packet-count theorem for tempered orthogonal parameters, new at archimedean places. [jz20](#jz20), Theorem 3.2, p. 763: Records the archimedean orthogonal tempered case.

Exact incoming or proof-refinement contracts: L2.

### Generic local GGP for p-adic unitary pairs

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/unitary-generic-nonarch` (theorem).

For a nonarchimedean local field F of characteristic zero, a quadratic field extension E/F and a relevant unitary Bessel pair U(V_n)⊂U(V_{n+2k+1}), LocalGGP holds for every generic parameter pair, with the standard fixed base-change and Whittaker normalizations. This is the Bessel assertion of Gan–Ichino, Proposition 9.3; no real generic extension is deduced from that proposition.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/unitary-tempered`; `ModularityAndLanglandsExtensions:ML.4/generic-packets-standard-modules`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.2a`.

Proof route:

1. Express generic-packet members as irreducible standard modules using ML.4.
2. Use Gan–Ichino Proposition 9.4 with ordered nonnegative real induction exponents to identify the Bessel multiplicity with that of the two tempered cores. Its proof uses the geometric lemma, second adjointness and meromorphic continuation; these are the precise local reduction input L3.
3. Apply tempered unitary GGP and the packet parametrization compatibility.

Acceptance checks: The case of no positive exponent is exactly the tempered theorem. The theorem covers odd codimension, not only U(n)⊂U(n+1).

Sources: [gi16](#gi16), §9.3, Propositions 9.3–9.4, pp. 50–52 (arXiv v2): Standard-module irreducibility and equality of multiplicities with the tempered cores give the generic Bessel theorem. [jz20](#jz20), Theorem 3.2, p. 763: Records the generic p-adic unitary case.

Exact incoming or proof-refinement contracts: L3.

### Injectivity on the distinguished tempered locus

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/distinguished-transfer-injective` (comparison).

For a nonarchimedean or real codimension-one unitary pair, fix a tempered π of the larger group and fix its parameter. If two tempered representations σ,σ′ of the smaller group, each distinguished relative to π, have the same stable transfer to the corresponding quasi-split group (equivalently the same local parameter under the supplied classification), then their tagged relevant pairs are equal and σ≃σ′. Equivalently the map sending a distinguished tempered pair to its pair of stable parameters is injective on the relevant union. There is no injectivity claim on all tempered representations.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/unitary-tempered`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/local-relevant-packet`.

Proof route:

1. Equal stable transfers put both distinguished pairs in the same relevant packet.
2. Its total multiplicity is one, so the two tagged members agree.

Acceptance checks: Two different members of one packet can have the same stable transfer; distinction is essential.

Sources: [bplzz21](#bplzz21), Proof of Lemma 4.9, p. 36: Uses tempered local GGP to make the relevant Jacquet–Langlands map injective. [bcz22](#bcz22), §10.3.5, p. 325: Uses the same local packet uniqueness to isolate one distinguished term.

Planets: Local GGP proposition, Tempered unitary GGP, Generic orthogonal GGP.

## GGP.3. Global Bessel periods and GGP propositions

Construct the fixed Bessel Fourier coefficient and the bilinear global period, establish convergence with one cuspidal factor and local necessity, and distinguish fixed-realization from coherent-packet global GGP. Record the exact proven unitary and conditional descent ranges without reproducing their proof machinery.

### Global Bessel Fourier coefficients

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/bessel-fourier-coefficient` (construction).

For a number field F, global Bessel data and ψ_F:F\𝔸_F→S¹, define F^{ψ}(f)(h)=∫_{N(F)\N(𝔸_F)} f(nh)ψ_N(n)^{-1}dn, with the unipotent quotient of volume one. For a smooth automorphic form f of moderate growth the integral is defined over a compact quotient and transforms as an automorphic function on H. At ℓ=0 it is restriction f|_{H(𝔸_F)}. This construction concerns Bessel coefficients for the fixed relevant pair, not all nilpotent Fourier coefficients or automorphic descent.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-datum`; `AutomorphicFormsOnReductiveGroups:AF.3/unipotent-quotient-compact`; `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-form`.

Uses: Global Bessel period, GGP.3: Provides its first factor. Jiang–Zhang, §4: The same coefficient appears in global zeta integrals; those integrals are owned by descent and L-function roadmaps.

API:

- `BesselFourier.linear` (structure): f↦F^ψ(f) is complex-linear.
- `BesselFourier.rationalInvariant` (relation): F^ψ(f)(γh)=F^ψ(f)(h) for γ∈H(F).
- `BesselFourier.rightTranslate` (functoriality): Right translation by H commutes with the coefficient.
- `BesselFourier.codimOne` (simp): For N=1 this is f restricted to H.

Checks that distinguish the definition:

- `BesselFourier.codimOneTest` (degenerate): At ℓ=0, F^ψ(f)(h)=f(h).
- `BesselFourier.constantCharacter` (computation): A constant function on N(F)\N(𝔸_F) integrates to zero against a nontrivial ψ_N.
- `BesselFourier.inverseCharacter` (characterisation): Replacing ψ_N by ψ_N^{-1} conjugates the character in the integral, so the ψ_N-equivariance sign is reversed.

Proof route:

1. Use the compact unipotent quotient and its probability Haar measure from AF.3.
2. Check left H(F)-invariance by conjugating N and using H-invariance of ψ_N. Differentiate under the compact integral for smoothness.

Acceptance checks: Moderate growth and rapid decay on H require estimates beyond compactness alone; these are included in the next convergence target.

Sources: [jz20](#jz20), §2.2, (2.9), pp. 752–753; §4.1, (4.7), p. 766: The Bessel period uses the character Fourier coefficient along the specified unipotent radical. [ggp12](#ggp12), §23, pp. 83–85: Introduces the global model using a character trivial on rational points.

### Global Bessel periods

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-bessel-period` (definition).

For global Bessel data and automorphic forms f on G(𝔸_F), g on H(𝔸_F) for which the following integral is absolutely convergent, set P_ψ(f,g)=∫_[H] F^ψ(f)(h)g(h)dh. Use quotient Haar measure on [H]=H(F)\H(𝔸_F); impose compatible central quotients when the center is noncompact. This is a complex-bilinear period. The sesquilinear branching convention is P^br_ψ(f,g)=P_ψ(f,conj(g)); its tensor parameter is π×σ∨. In the codimension-one unitary case this is the diagonal period ∫_[U(W)]f(h,h)dh on the product group. Exclude split SO₂ from unquotiented finite-volume formulations unless a central quotient or convergence hypothesis is supplied.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/bessel-fourier-coefficient`; `AdelicAlgebraicGroups:AA.2/automorphic-quotient-measure`; `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`.

Uses: Global GGP propositions, GGP.3: The nonvanishing side of the central-value criterion. Refined identity, GGP.4: Its squared absolute value is compared with normalized local periods. LTXZZ, Lemma 8.2.1: At definite infinity the diagonal integral becomes a finite diagonal sum.

API:

- `GlobalBesselPeriod.bilinear` (structure): The period is linear separately in f and g.
- `GlobalBesselPeriod.invariant` (relation): It is equivariant for R(𝔸_F) with character ψ_R in the local-model convention.
- `GlobalBesselPeriod.conjugateSecond` (compatibility): The branching convention equals the bilinear period evaluated on the conjugate second cusp form.
- `GlobalBesselPeriod.measureScale` (functoriality): Multiplying dh by c>0 multiplies P by c; the character-quotient measure on N stays fixed.

Checks that distinguish the definition:

- `GlobalBesselPeriod.diagonal` (compatibility): For ℓ=0, the period is the ordinary diagonal H integral.
- `GlobalBesselPeriod.zeroVector` (degenerate): If either input is zero the period is zero.
- `GlobalBesselPeriod.dualConvention` (non-example): Replacing g by conj(g) conjugates its scalar dependence and changes the tensor parameter to σ∨; the result is not bilinear in the original pair.

Proof route:

1. Apply quotient integration to the product, with absolute integrability as data until the convergence theorem is invoked.
2. For the sesquilinear convention compose the second factor with complex conjugation and identify its representation with the contragredient for unitary automorphic realizations.

Acceptance checks: A nonzero period means some pair of vectors has nonzero value, not every vector.

Sources: [jz20](#jz20), §4.1, (4.7)–(4.8), p. 766; §5.2, (5.6), p. 785: Uses a bilinear displayed period in §4.1 and a Petersson-style convention in §5.2; the dual must be tracked. [ggp12](#ggp12), §23, pp. 83–85; Conjecture 24.1, pp. 87–88: Defines the global functional with finite-volume restrictions in the orthogonal low ranks. [bcz22](#bcz22), §1.1.2 and §1.1.5, pp. 184–186: Uses the diagonal unitary period and quotient Haar measures.

### Absolute convergence with one cuspidal input

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-period-convergence` (theorem).

In the global Bessel setting, with compatible central quotients and finite-volume assumptions as above, P_ψ(f,g) converges absolutely if f and g are smooth automorphic forms of uniform moderate growth and at least one is cuspidal. More precisely the Fourier coefficient has moderate growth on H; when f is cuspidal it is rapidly decreasing on the relevant H-Siegel sets. When g is cuspidal, use its rapid decay against the moderate coefficient. The statement requires the Bessel-subgroup restriction estimates and is not an automatic consequence of rapid decay on a G-Siegel set.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-bessel-period`; `AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay`; `AutomorphicFormsOnReductiveGroups:AF.3`.

Proof route:

1. Supply the Bessel-specific restriction estimates C1 for the Fourier coefficient on H-Siegel sets.
2. Use AF.3 cusp decay to dominate the remaining polynomial growth, with reduction theory and central normalizations fixed.
3. Integrate the resulting rapidly decreasing bound over a finite collection of H-Siegel sets.

Acceptance checks: On an anisotropic H quotient, boundedness on the compact quotient already gives convergence. No absolute convergence assertion is made for a pair of general noncuspidal forms.

Sources: [jz20](#jz20), Immediately after (4.7), p. 766: Specifies moderate-growth and rapid-decay properties on the character stabilizer as the convergence argument. [ggp12](#ggp12), §23, pp. 83–85: Uses cuspidal rapid decay to define the period.

Exact incoming or proof-refinement contracts: C1.

### A global period forces local distinction

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/nonzero-implies-local` (theorem).

Let π,σ be cuspidal automorphic representations with fixed restricted-tensor-product realizations. If the convergent bilinear Bessel period is nonzero on π⊗σ, then B(π_v,σ_v)≠0 for every place v. With local uniqueness, fixing nonzero local model forms identifies the restriction of the global period to a decomposable tensor with a scalar times their restricted product whenever the almost-everywhere normalizations are supplied; uniqueness alone does not compute that scalar.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-period-convergence`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-functional`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-uniqueness`; `AutomorphicFormsOnReductiveGroups:AF.2/flath-factorization`.

Proof route:

1. Fix all but one local tensor factor in a decomposable vector on which the period is nonzero.
2. Equivariance gives a nonzero continuous local functional; density of decomposable smooth vectors justifies this archimedeanly.
3. Apply one-dimensionality to compare choices, without identifying the global scalar with an L-value.

Acceptance checks: If any local Bessel space vanishes then the global period vanishes identically. Local nonvanishing at every place is not by itself sufficient for a nonzero global period.

Sources: [ggp12](#ggp12), §24, pp. 87–88: Uses local Hom nonvanishing as a necessary condition for global nonvanishing. [jz20](#jz20), (4.11)–(4.13), p. 767: Explains the local functional line and the uncomputed global proportionality scalar.

### Fixed-representation global GGP

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-fixed-proposition` (definition).

For a global relevant pair with finite-volume quotients and an irreducible tempered cuspidal automorphic representation π⊗σ occurring with multiplicity one, define GlobalFixedGGP(π,σ) as the equivalence: the bilinear Bessel period is nonzero on its chosen realization if and only if B(π_v,σ_v)≠0 for all v and the completed central tensor L-value L(1/2,φ_π×φ_σ) is nonzero. For split unitary/GL data the GGP standard tensor factor may contain the dual conjugate factor as well; its central nonvanishing is compared with the Rankin–Selberg factor only after the split identification. This is a proposition to be proved in specified ranges.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/nonzero-implies-local`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/global-coherent-packet`.

Uses: Gan–Gross–Prasad, Conjecture 24.1: The fixed-representation formulation is distinguished from the packet formulation. Refined period identity, GGP.4: A refinement implies the expected nonvanishing after checking local factors.

API:

- `GlobalFixedGGP.forward` (projection): Under this proposition, nonzero period implies the local conditions and central nonvanishing.
- `GlobalFixedGGP.reverse` (projection): Under this proposition, the local conditions together with central nonvanishing imply a nonzero period.
- `GlobalFixedGGP.transport` (functoriality): An isometry and an isomorphism of the specified automorphic realizations preserve the proposition.

Checks that distinguish the definition:

- `GlobalFixedGGP.badLocal` (characterisation): If one local model vanishes, the conjectured RHS is false and the period is identically zero by the preceding theorem.
- `GlobalFixedGGP.zeroCentral` (characterisation): Under GlobalFixedGGP, a zero completed central value forces the period to vanish even if every local model exists.
- `GlobalFixedGGP.fixedForm` (non-example): An existential nonzero period on another inner form does not prove this fixed-form proposition.

Proof route:

1. Package the displayed equivalence as a proposition.
2. Export the already proved local necessity independently from the conjectural L-value implications.

Acceptance checks: A central value alone does not select a fixed inner form.

Sources: [ggp12](#ggp12), Conjecture 24.1, pp. 87–88: The fixed tempered multiplicity-one assertion includes all local Hom conditions as well as the completed central value.

### Global GGP over coherent packets

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-packet-proposition` (definition).

For generic discrete global parameters φ_G,φ_H, define GlobalPacketGGP(φ_G,φ_H) as: there exists a coherent global relevant pair and a cuspidal automorphic member with a nonzero bilinear Bessel period if and only if the completed tensor L-value L(1/2,φ_G×φ_H) is nonzero. Genericity is a parameter condition, not temperedness at every place. Use actual cuspidal members of GGP.1. In the unitary codimension-one specialization label members by weak base change to a pair of Hermitian parameters. This is a conjectural framework definition; the unitary stable and endoscopic proofs are owned by JacquetRallisRelativeTraceComparison, and Jiang–Zhang’s descent implications by TwistedAutomorphicDescents.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/global-coherent-packet`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/weak-base-change`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-bessel-period`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`.

Uses: TwistedAutomorphicDescents, proposed consumer: Its descent statements prove the two implications with their actual assumptions. JacquetRallisRelativeTraceComparison, proposed consumer: The proven stable and endoscopic unitary cases instantiate this proposition. LTXZZ, Lemma 8.2.1: Uses the stable unitary central-to-period implication with archimedean and hyperspecial control.

API:

- `GlobalPacketGGP.centralToPeriod` (projection): Assuming the proposition, nonzero central value supplies some coherent cuspidal realization with nonzero period.
- `GlobalPacketGGP.periodToCentral` (projection): Assuming the proposition, a nonzero period in that packet implies central nonvanishing.
- `GlobalPacketGGP.unitarySpecialization` (compatibility): For norm-one codimension-one unitary pairs this is the weak-base-change period formulation of BCZ.

Checks that distinguish the definition:

- `GlobalPacketGGP.existential` (characterisation): A single coherent cuspidal realization with nonzero period satisfies the existential side.
- `GlobalPacketGGP.incoherentExcluded` (non-example): A locally distinguished but incoherent tensor product cannot witness the existential side.
- `GlobalPacketGGP.cuspRequired` (non-example): A residual or merely admissible representation with the same weak split data is not an allowed witness.

Proof route:

1. Construct the proposition using coherent cuspidal members; do not choose local packet members independently and declare the result automorphic.
2. Record the unitary proven ranges as incoming theorem contracts J1, avoiding a reciprocal dependency on the theorem proving roadmap.
3. Leave the general global converse conjectural, and record Jiang–Zhang’s precise conditional direction in the status ledger.

Acceptance checks: The parameter is invariant under reordering its imported isobaric constituents. No unconditional theorem of the global orthogonal generic conjecture is asserted here.

Sources: [jz20](#jz20), §6.3, pp. 803–805; Theorem 6.10, p. 805: Uses existence of a cuspidal packet member with nonzero Bessel period. [ggp12](#ggp12), Conjecture 26.1, pp. 99–100: The local distinguished tensor must also satisfy coherence and global automorphic occurrence. [bplzz21](#bplzz21), Theorem 1.8, p. 4; Theorem 4.14, pp. 39–40; Remark 4.17, p. 42: The stable unitary result and local refinements are supplier theorems, with cuspidality in the base-change existence hypothesis. [bcz22](#bcz22), Theorem 1.1.5.1, p. 186: Proves the unitary endoscopic assertion; proof ownership stays with the comparison roadmap.

Exact incoming or proof-refinement contracts: J1.

Planets: Bessel Fourier coefficients, Global Bessel periods, Fixed-representation global GGP, Packet global GGP.

## GGP.4. Local normalization and the unitary refinement

Define the completed shifted L-quotient, the four-vector local branching form and its correctly dualized tensor form. Prove tempered convergence and the unramified calculation. Define normalized local periods and the unitary Ichino–Ikeda proposition, with Tamagawa measures and the actual component-group denominator.

### The unitary Ichino–Ikeda L-quotient

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/normalized-l-quotient` (definition).

Let E/F be quadratic with quadratic idèle character η, let U_h=U(V_n)×U(V_n⊕⟨1⟩), and let σ be cuspidal, tempered everywhere, with parameter-compatible base change Π=Π_n⊠Π_{n+1}. Define the completed meromorphic quotient 𝓛(s,σ)=[∏_{i=1}^{n+1}L_F(s+i−1/2,η^i)] L_E(s,Π_n×Π_{n+1})/L_F(s+1/2,σ,Ad). Here Ad is the direct sum of the two group adjoint representations through the specified local parameters, so its L-factor is the product of the two adjoint factors. Define 𝓛_v by the same local formula. At s=1/2 the prefactor is Δ_{n+1}=∏_{i=1}^{n+1}L_F(i,η^i). All archimedean factors are included. Define partial quotients only with a displayed removed set and an explicit local-factor comparison.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/hermitian-isobaric-parameter`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/weak-base-change`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`; `AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/weak-strong-base-change`; `AutomorphicLFunctionsAndLocalFactors:AL.4`; `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Uses: Normalized local period, GGP.4: Divides each raw local period by 𝓛_v(1/2). Unitary refined proposition, GGP.4: Supplies the global scalar.

API:

- `IILQuotient.local` (projection): Returns the quotient of local factors with the same shifts.
- `IILQuotient.central` (simp): At s=1/2 the numerator multiplier is Δ_{n+1} and the denominator is L_F(1,σ,Ad).
- `IILQuotient.factorization` (compatibility): In a common convergence region the global quotient factors into the local quotients, and continuation preserves the identity.
- `IILQuotient.removePlaces` (relation): For a finite S, 𝓛(s,σ)=𝓛^S(s,σ)∏_{v∈S}𝓛_v(s,σ_v) as meromorphic functions.

Checks that distinguish the definition:

- `IILQuotient.shift` (computation): For n=1 the central prefactor is L_F(1,η)L_F(2,1), and the adjoint denominator is at 1.
- `IILQuotient.twoAdjoints` (compatibility): The product-group adjoint denominator equals the product of its two unitary adjoint factors.
- `IILQuotient.completed` (non-example): Deleting an archimedean gamma factor without replacing it in a local term does not preserve 𝓛.

Proof route:

1. Import tensor-product L-functions. Construct the adjoint and Asai specializations only through actual supplied parameters, using the precise factor-extension contract F1.
2. Check the shifts by substituting s=1/2 and compare global and local products where absolutely convergent, then meromorphically.

Acceptance checks: The denominator is evaluated at 1 at the central point. A claim about a completed value cannot be replaced by a partial one if removed factors might have a zero or pole.

Sources: [bcz22](#bcz22), §1.1.6, pp. 186–187: Gives the completed quotient, local factors and adjoint normalization. [harris14](#harris14), §1, Conjecture 1.3, pp. 3–4 (arXiv v2); §2.2, pp. 22–23: Gives the unitary refinement and the unramified quotient in that version’s numbering.

Exact incoming or proof-refinement contracts: F1.

### The local branching period

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/local-raw-period` (definition).

For a codimension-one GGP pair G⊃H over a local field F of characteristic zero, irreducible tempered unitary π of G and σ of H, smooth vectors v₁,v₂,u₁,u₂ and Haar dh on H, define α_{π,σ}(v₁,v₂;u₁,u₂)=∫_H⟨π(h)v₁,v₂⟩⟨u₁,σ(h)u₂⟩dh whenever integrable. Inner products here are linear in the first variable, so α is linear in v₁,u₁ and conjugate-linear in v₂,u₂. Its associated sesquilinear form on π⊗σ∨ evaluates (v₁⊗bar(u₁),v₂⊗bar(u₂)) as α(v₁,v₂;u₂,u₁). This swap is required by the conjugate-dual identification. The bilinear-period convention for π⊠τ uses τ=σ∨ and the product-representation matrix coefficient.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-pair`; `AdelicAlgebraicGroups:AA.2/quotient-integral-integrable`; `AutomorphicFormsOnReductiveGroups:AF.1/tempered-square-integrable`.

Uses: Nelson–Venkatesh, §18: The relative character sums this form over an orthonormal basis; that sum is owned by the orbit-method roadmap. BCZ, §1.1.6: The unitary period is normalized by the local L-quotient.

API:

- `LocalBranchPeriod.sesquilinear` (structure): The displayed four-variable form has the specified linear and conjugate-linear slots.
- `LocalBranchPeriod.haarScale` (functoriality): Replacing dh by c dh multiplies α by c.
- `LocalBranchPeriod.invariant` (relation): The form B(v₁⊗bar(u₁),v₂⊗bar(u₂))=α(v₁,v₂;u₂,u₁) on π⊗σ∨ is invariant under H in either argument.
- `LocalBranchPeriod.dualConvention` (compatibility): The π⊠τ product coefficient with τ=σ∨ equals B under the unitary conjugate-dual identification, including the exchanged u-slots.

Checks that distinguish the definition:

- `LocalBranchPeriod.trivialCompact` (computation): If π=σ=1 and H is compact of volume one, α(1,1;1,1)=1.
- `LocalBranchPeriod.compactCharacters` (computation): For compact abelian H of volume one and characters χ,ν, α(1,1;1,1)=1 if χ=ν and 0 otherwise.
- `LocalBranchPeriod.dualSign` (non-example): For the bilinear product χ⊠ν on compact H the integral is nonzero when ν=χ^{-1}, not when ν=χ unless χ²=1.

Proof route:

1. Use the existing Haar integral of the scalar coefficient product.
2. Distinguish the two tensor conventions by conjugating the second representation, then derive separate-variable invariance by left or right translation once convergence is known.

Acceptance checks: Absolute convergence is the next theorem, not a default property of all smooth representations.

Sources: [nv21](#nv21), §18, (18.1)–(18.2), p. 121; §25.4, p. 168: Uses the product of two oppositely ordered coefficients as the local branching form. [bcz22](#bcz22), §1.1.6, p. 187: Uses the equivalent bilinear-product convention for unitary normalized periods.

### Tempered local absolute convergence

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/local-period-convergence` (theorem).

For all codimension-one orthogonal, unitary and split general-linear GGP pairs over a local field of characteristic zero, ∫_H Ξ_G(h)Ξ_H(h)dh is finite. Consequently the raw period α of GGP.4 is absolutely convergent for smooth vectors in irreducible tempered unitary representations and is continuous in those vectors in their smooth representation topologies. The full proof uses estimates with the required polynomial norm factors as well as the bare Ξ-integrability assertion.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/local-raw-period`; `AutomorphicFormsOnReductiveGroups:AF.1/tempered-square-integrable`; `SmoothRepresentationsOfLocalGroups:SR.3`.

Proof route:

1. Bound tempered coefficients by Ξ times controlled polynomial norms using AF.1 and SR.3.
2. Use relative Cartan chambers; compare the half-modulus characters to obtain a strictly decaying exponential in each noncompact chamber direction, with the necessary polynomial weights.
3. For the split case divide chambers according to where the extra eigenvalue 1 occurs; compact directions contribute finite volume. Orthogonal exponents are supplied by L4.
4. Use smooth seminorm bounds in the same dominating integrals for continuity.

Acceptance checks: For compact H the integrability is immediate. The theorem is not applied to arbitrary nontempered representations.

Sources: [nv21](#nv21), §18, (18.1), p. 121: States the integrability property and smooth-vector continuity for all three pair types. [harris14](#harris14), Proposition 2.1 and proof, pp. 5–7 (arXiv v2): Reduces unitary and split GL cases to chamber integrals using matrix-coefficient bounds and modulus exponents.

Exact incoming or proof-refinement contracts: L4.

### Normalized unitary local periods

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/normalized-local-period` (definition).

In the everywhere-tempered unitary setting, with strong parameter-compatible local base change and the finite nonzero local central quotient 𝓛_v(1/2,σ_v), set P_v♮(x,y)=𝓛_v(1/2,σ_v)^{-1}∫_{U(V_n)(F_v)}⟨σ_v(h)x,y⟩_v dh. Use the bilinear product representation σ_v on U(V_n)×U(V_{n+1}); decomposable vectors recover the raw-period convention after dualizing its second factor. The inner product and Haar measure are explicit data. For a global restricted tensor, the product of ratios P_v♮(x_v,x_v)/⟨x_v,x_v⟩_v is defined after the unramified normalization makes almost every ratio one.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/normalized-l-quotient`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/local-period-convergence`; `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Uses: Refined unitary proposition, GGP.4: Supplies the local factors in the product formula.

API:

- `NormalizedLocalPeriod.raw` (relation): 𝓛_v(1/2)P_v♮ is the raw product-representation period.
- `NormalizedLocalPeriod.metricScale` (functoriality): Rescaling the metric multiplies numerator and denominator equally.
- `NormalizedLocalPeriod.haarScale` (functoriality): Rescaling dh_v multiplies P_v♮ by the same factor.
- `NormalizedLocalPeriod.sesquilinear` (structure): P_v♮ is a sesquilinear H-invariant form, linear in its first variable.

Checks that distinguish the definition:

- `NormalizedLocalPeriod.metricRatio` (compatibility): For a positive scalar c the normalized ratio using c⟨,⟩ equals the original ratio.
- `NormalizedLocalPeriod.haarRatio` (computation): Replacing dh_v by 2 dh_v doubles the normalized ratio.
- `NormalizedLocalPeriod.zeroVector` (degenerate): P_v♮(0,y)=0, while its ratio to ⟨0,0⟩ is not used.

Proof route:

1. Check finiteness and nonvanishing of the local L-quotient by the actual tempered local-factor theorem F1.
2. Divide the convergent raw form by that nonzero number; establish the restricted product only after the next unramified computation.

Acceptance checks: A rescaling of the local invariant metric cancels in P_v♮(x_v,x_v)/⟨x_v,x_v⟩_v.

Sources: [bcz22](#bcz22), §1.1.6, p. 187, including (1.1.6.1): Defines the local normalization and states the local nonvanishing and unramified comparison. [harris14](#harris14), §1, pp. 2–4; Theorem 2.12, p. 23: Computes the same quotient at unramified places.

Exact incoming or proof-refinement contracts: F1.

### The unramified local calculation

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/unramified-period` (theorem).

At an unramified place v for E/F, the unitary form pair, and the tempered representations with compatible unramified base change, choose hyperspecial K_n⊂K_{n+1} and nonzero spherical vector x_v. Then P_v♮(x_v,x_v)=vol(U(V_n)(𝒪_v))⟨x_v,x_v⟩_v. In particular the ratio is one when the smaller hyperspecial subgroup has volume one. This includes split and inert unramified places with their respective local factors. It is not a formula for arbitrary ramified fixed vectors.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/normalized-local-period`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`.

Proof route:

1. Use the normalized spherical matrix coefficients and the spherical integral computation of Harris, with the precise unramified integration contract L4.
2. Identify its Satake factors with 𝓛_v(1/2) and retain the smaller hyperspecial Haar volume.

Acceptance checks: With unit spherical vectors and volume-one hyperspecial H, the value is 1. At a split place both conjugate-dual tensor factors occur in the E-local L-function.

Sources: [harris14](#harris14), Theorem 2.12, pp. 22–23; §§2.1–2.2: Evaluates the spherical integral as the L-value quotient, treating nonsplit and split places. [bcz22](#bcz22), (1.1.6.1), p. 187: States the unramified normalized period with its Haar volume factor.

Exact incoming or proof-refinement contracts: L4.

### The unitary Ichino–Ikeda proposition

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/unitary-refined-proposition` (definition).

For a cuspidal σ on U_h with Hermitian generic discrete base change Π and tempered at every place, define UnitaryIchinoIkeda(σ) to assert, for every nonzero factorizable smooth x=⊗′x_v, |P_h(x)|²/⟨x,x⟩_Pet=|S_Π|^{-1}𝓛(1/2,σ)∏_v[P_v♮(x_v,x_v)/⟨x_v,x_v⟩_v]. Global measures are Tamagawa measures, local Haar factors are a compatible restricted product with its convergence factors, and the global Petersson metric is the stated quotient integral. Almost all smaller hyperspecial volumes are one. Its truth is a theorem in the everywhere-tempered unitary range of BCZ, but that proof belongs to JacquetRallisRelativeTraceComparison. The definition introduces no axiom.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-bessel-period`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/ii-component-group`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/normalized-l-quotient`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/normalized-local-period`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/unramified-period`.

Uses: BCZ, Theorem 1.1.6.1: This roadmap owns the shared statement; the comparison roadmap owns its proof. Nelson–Venkatesh, Conjecture 25.1: After dualizing the second factor and removing R-factors it gives the corresponding branching normalization where hypotheses agree.

API:

- `UnitaryIchinoIkeda.evaluate` (projection): An instance gives the equality on every nonzero factorizable vector.
- `UnitaryIchinoIkeda.vectorScale` (compatibility): Scaling x by a nonzero complex scalar leaves both normalized sides unchanged.
- `UnitaryIchinoIkeda.metricIndependent` (compatibility): Independent positive rescalings of the local metrics leave the ratios unchanged.
- `UnitaryIchinoIkeda.measureTransport` (functoriality): A compatible refactorization of the same global Haar measure leaves the product identity unchanged.

Checks that distinguish the definition:

- `UnitaryIchinoIkeda.stableConstant` (computation): For two cuspidal base-change factors the coefficient is 1/4.
- `UnitaryIchinoIkeda.sphericalTail` (compatibility): If x_v is normalized spherical and H(𝒪_v) has volume one outside S, the product equals its finite product over S.
- `UnitaryIchinoIkeda.noArbitraryMeasures` (non-example): Doubling just one local H measure without compensating the global factor changes the RHS and is not a permitted refactorization.

Proof route:

1. Package the normalized equality as a proposition with the global and local metrics and measures retained.
2. Use the unramified calculation to define a finite nontrivial product; no infinite unnormalized product is used.
3. The theorem contract J1 supplies the proof in the stated range without moving the trace-comparison argument here.

Acceptance checks: For a stable pair the denominator |S_Π| is 4. The equality is invariant under rescaling a local metric and under rescaling x.

Sources: [bcz22](#bcz22), Theorem 1.1.6.1 and footnote 3, pp. 187–188: Gives the tempered endoscopic formula and the compatible Tamagawa/local measure convention. [bplzz21](#bplzz21), Theorem 1.10, pp. 4–5: The stable tempered case is an earlier proven specialization.

Exact incoming or proof-refinement contracts: J1.

Planets: Ichino–Ikeda L-quotient, Local branching periods, Tempered period convergence, Normalized local periods, Unitary Ichino–Ikeda identity.

## GGP.5. Classical spectral invariants and conductor dropping

Define the adjusted eigenvalue multiset, retaining the even-SO Pfaffian. Prove isotropic eigenvector, regularity and geometric sphericity statements. Relate real Langlands parameters to infinitesimal character and tensor gamma weights; import spectral stability to identify the zero-weight obstruction to full conductor growth.

### Eigenvalue invariants for standard representations

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/eigenvalue-invariant` (definition).

For a codimension-one GGP pair over a characteristic-zero field k, extend to an algebraic closure. In the unitary case split k₁⊗k̄=k̄×k̄ and write V=V⁺⊕V⁻ with the perfect pairing between its two factors; in the orthogonal case put V⁺=V⁻=V. For skew-adjoint x∈𝔤 let ev(x) be the multiset of eigenvalues on V⁺, deleting exactly one forced zero if G is odd orthogonal. It depends only on the adjoint-quotient class. For even SO, retain the Pfaffian coordinate as well: ev alone does not distinguish the two regular semisimple SO classes exchanged by an orientation-reversing orthogonal conjugation. Choose the orientation/volume normalization needed to define pf.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-pair`; `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.

Uses: Nelson–Venkatesh, Lemmas 13.1–13.2: Detects isotropic eigenvectors and regularity. Nelson–Venkatesh, Lemma 15.3: Computes the weights of the standard tensor L-representation.

API:

- `GGPEigenvalues.conjugate` (relation): ev(gxg^{-1})=ev(x).
- `GGPEigenvalues.neg` (simp): ev(−x) is obtained by negating every entry, with the same multiplicities.
- `GGPEigenvalues.scalarExtension` (functoriality): Compatible algebraic closures preserve the multiset under the induced scalar map.
- `GGPEigenvalues.adjointQuotient` (characterisation): ev determines an adjoint-quotient point except for even SO, where the additional pf coordinate is required.

Checks that distinguish the definition:

- `GGPEigenvalues.oddZero` (computation): For x∈so₃ with eigenvalues {0,a,−a}, ev(x)={a,−a}; at x=0 it is {0,0}.
- `GGPEigenvalues.soOne` (degenerate): For so₁, ev(0) is empty.
- `GGPEigenvalues.evenPfaffian` (non-example): In so₄, torus parameters (a,b) and (−a,b) with ab≠0 have the same ev and opposite Pfaffians, so ev alone is insufficient.

Proof route:

1. Compute eigenvalues after scalar extension; skew-adjointness gives opposite eigenvalues on V⁻.
2. Use characteristic-polynomial invariance under conjugation, with the classical adjoint quotient supplied by geometry contract O1.
3. For odd SO remove one zero with its known multiplicity; for even SO keep the independent Pfaffian sign.

Acceptance checks: The multiset size is 2⌊dim V/2⌋ in the orthogonal case and dim_E V in the unitary case.

Sources: [nv21](#nv21), §13.3–13.4.1, pp. 92–93: Defines V⁺, V⁻ and ev, including the forced zero and the even-orthogonal Pfaffian exception.

Exact incoming or proof-refinement contracts: O1.

### Eigenvalues detected by isotropic vectors

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/isotropic-eigenvectors` (lemma).

Over an algebraically closed characteristic-zero field in the preceding notation, c∈ev(x) if and only if there is a nonzero isotropic eigenvector of x in V⁺ with eigenvalue c, equivalently a nonzero isotropic eigenvector in V⁻ with eigenvalue −c. In the split unitary case the factors V⁺ and V⁻ are themselves isotropic. In the odd-orthogonal case removing one forced zero is essential to the zero-eigenvalue equivalence.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/eigenvalue-invariant`.

Proof route:

1. For c≠0 skew-adjointness gives 2c⟨v,v⟩=0, hence isotropy.
2. For c=0 in the quadratic case use the Jordan decomposition at zero: an excess zero beyond the forced odd-dimensional line yields an isotropic eigenvector; conversely such a vector forces the adjusted characteristic polynomial to vanish at zero.
3. For the unitary split factors use the perfect dual pairing to compare opposite eigenvalues.

Acceptance checks: For so₁ at x=0 there is no isotropic nonzero vector and ev is empty. For so₃ at x=0 the adjusted spectrum contains zero and an isotropic line exists over the algebraic closure.

Sources: [nv21](#nv21), Lemma 13.1, p. 93: Relates the adjusted spectrum to isotropic eigenvectors on the two standard factors.

### A regularity criterion for GGP Lie algebras

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/regularity-criterion` (lemma).

Over an algebraically closed characteristic-zero field, suppose every isotropic subspace of V⁺ on which x∈𝔤 acts by a scalar has dimension at most one; in the orthogonal case also suppose dim ker x≤2. Then x is regular, meaning dim Z_𝔤(x)=rank G. This asserts regularity, not regular semisimplicity.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/isotropic-eigenvectors`.

Proof route:

1. Decompose V into generalized eigenspaces and pair the c and −c pieces. The scalar-isotropic-space hypothesis forces at most one Jordan chain for each nonzero eigenvalue.
2. On the zero generalized eigenspace use the permitted orthogonal Jordan types and the kernel bound; compare the resulting centralizer dimension with rank. The Jordan/centralizer contract O1 retains the nilpotent cases.

Acceptance checks: Over the algebraic closure the unitary rank-two case is gl₂: a single nilpotent Jordan block satisfies the hypotheses and is regular but not semisimple. For x=0 on an orthogonal space of dimension at least five the isotropic scalar-space bound fails.

Sources: [nv21](#nv21), Lemma 13.2, pp. 94–95: Reduces the regularity assertion to Jordan blocks, with the extra orthogonal kernel condition.

Exact incoming or proof-refinement contracts: O1.

### The geometric spherical orbit

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/sphericity` (theorem).

For a codimension-one orthogonal, unitary or split-GL GGP pair over characteristic zero, the diagonal algebraic H has a geometric open orbit with trivial stabilizer on the product of complete flag varieties Flag(G)×Flag(H), after extending scalars to an algebraic closure. This is a statement about the full algebraic groups attached to the forms; it neither replaces SO by its real identity component nor asserts an open orbit on all real points.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-pair`; `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.

Proof route:

1. Over the algebraic closure choose two transverse flags so that any common stabilizer fixes successive pairings with the distinguished vector e.
2. In the split GL case successive flag-line comparisons make the stabilizer the identity. In the orthogonal case the same argument uses the isotropic flag and orientation, not a lost determinant sign.
3. Verify dim H=dim Flag(G)+dim Flag(H); the constructed free orbit is therefore open. The explicit flag construction and orthogonal extension are the specialized geometry input O1.

Acceptance checks: For GL₂⊃GL₁ the generic line in ℙ¹ has trivial stabilizer under t↦diag(t,1). The result is algebraic over k̄, so multiple rational or real open orbits cause no contradiction.

Sources: [nv21](#nv21), Lemma 13.3, p. 95: States the open flag orbit with trivial stabilizer. [bp20](#bp20), §6.4, Proposition 6.4.1(i), pp. 134–136: Constructs good minimal parabolics in the unitary model; after scalar extension this yields the flag-orbit calculation.

Exact incoming or proof-refinement contracts: O1.

### Archimedean parameter and infinitesimal character

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/infinitesimal-parameter` (comparison).

For an irreducible admissible representation π of a real classical group in the codimension-one GGP setting, write the complex-torus restriction of its Langlands parameter as φ_π(e^t)=exp(tλ_π+t̄μ_π). Under the standard trace-pairing identification between the dual-group adjoint quotient and [𝔤*_ℂ], λ_π maps to π’s Harish–Chandra infinitesimal character. If π is tempered then μ_π=−conj(λ_π). Use the normalized induction convention and the Harish–Chandra ρ shift of AF.1.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/eigenvalue-invariant`; `AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character`; `AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification`; `AutomorphicFormsOnReductiveGroups:AF.1/normalized-real-parabolic-induction`; `ModularityAndLanglandsExtensions:ML.4/kmsw-inner-forms`; `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`.

Proof route:

1. Reduce by normalized parabolic induction to discrete series and compact torus data.
2. Compare highest weights and the ρ shift with the local Langlands normalization; the necessary real classical correspondence remains within P1.

Acceptance checks: The trivial finite-dimensional representation has infinitesimal character ρ under AF.1’s convention; it is not normalized to zero.

Sources: [nv21](#nv21), Lemma 15.2, pp. 104–105: Checks the parameter-to-infinitesimal-character comparison by normalized induction, discrete series and tori.

Exact incoming or proof-refinement contracts: P1.

### Standard tensor weights at a real place

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/rankin-selberg-weights` (comparison).

For a real codimension-one GGP pair and λ,μ the infinitesimal parameters, the infinitesimal weights of the standard Rankin–Selberg L-representation are the multiset ev(λ)+ev(μ) in the orthogonal case, and that multiset together with its negatives in the unitary case. Here + is the pairwise multiset sum with multiplicity. For tempered π,σ the real local factor has form ∏_i Γ_ℝ(s+a_i⁺+ε_i), where a_i are these weights, a⁺=|Re a|+i Im a, and ε_i∈{0,1} is determined by the W_ℝ action, not by ev alone. Contragredience in the branching convention replaces μ by −μ.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/infinitesimal-parameter`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`; `AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison`; `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Proof route:

1. Use the standard representations of the dual classical groups and the trace-form comparison to write their eigenvalue multisets.
2. Tensor products add infinitesimal weights. Restriction of scalars in the unitary case contributes the conjugate-dual weights as well.
3. Apply the imported real Weil-group local-factor formula with its parity data.

Acceptance checks: For SO₃⊃SO₂ both adjusted multisets have size two, giving four tensor weights. For U₂⊃U₁ the two pairwise sums and their negatives give four real gamma weights.

Sources: [nv21](#nv21), Lemma 15.3, pp. 105–106: Computes dual standard-representation weights and the archimedean gamma factors, including the unitary ± duplication.

Exact incoming or proof-refinement contracts: F1.

### Stability and the zero-weight obstruction

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/stability-and-conductor` (comparison).

Using spectral stability from the orbit-method owner, a pair (λ,μ) is stable exactly when ev(λ)∩ev(μ)=∅; the geometric GGP stability theorem identifies this with H-stability of an element restricting to those parameters. For real π,σ this is equivalent to zero being absent from the infinitesimal Satake weights of the tensor parameter π×σ∨. Thus on a compact stable rescaled parameter set the archimedean conductor has the full predicted power of the scaling parameter. This is a zero-weight obstruction statement, not a claim that every nonstable pair has zero period.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/rankin-selberg-weights`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/isotropic-eigenvectors`.

Proof route:

1. Import the geometric stable-locus theorem from the orbit-method owner through O1; do not redevelop GIT stability here.
2. By the weight comparison, zero occurs in ev(λ)−ev(μ) exactly when the two adjusted spectra meet.
3. On a compact stable set all these differences are uniformly bounded away from zero, giving uniform conductor scaling.

Acceptance checks: For SO₃⊃SO₂ with parameters {±a} and {±b}, spectral stability means a≠±b. The compactness hypothesis is necessary for a uniform lower bound on the weight differences.

Sources: [nv21](#nv21), Theorem 14.2 and Definition 14.3, p. 97; Lemma 15.4, p. 107: Disjoint adjusted spectra characterize stability and become absence of zero tensor weights after dualizing.

Exact incoming or proof-refinement contracts: O1.

Planets: GGP eigenvalue invariants, Spherical GGP flag orbit.

## GGP.6. The distinguished tempered spectrum

Specify the smooth distinguished locus, period support, nonarchimedean positivity and phase normalization of branching maps. Establish injection of induction parameters and the explicit torus-component topology, with continuity and finite good-level truncations. Specialize existing compact decomposition to realize finite spectral weights.

### The distinguished tempered spectrum

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/distinguished-tempered-dual` (definition).

For a codimension-one GGP pair over a local field of characteristic zero and a fixed irreducible tempered unitary π of G, let Ω_π={σ∈Ĥ_temp:Hom_H(π^∞,σ^∞)≠0}. Take isomorphism classes of σ, using smooth maps in the nonarchimedean setting and continuous maps of smooth globalizations at archimedean places. This is a subset of the supplied tempered dual, not a new construction of that dual. The branching convention is Hom_H(π,σ), hence the bilinear local Bessel model uses σ∨.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-functional`; `AutomorphicFormsOnReductiveGroups:AF.1/tempered-square-integrable`; `SmoothRepresentationsOfLocalGroups:SR.3`.

Uses: Nelson–Venkatesh, Lemmas 24.1–24.2: Restricts induction parameters to a multiplicity-free distinguished locus. Automorphic families, GGP.7: Constrains the auxiliary local components of Σ.

API:

- `DistinguishedTemperedDual.mem` (characterisation): σ∈Ω_π iff σ is tempered and there is a nonzero smooth H-intertwiner π→σ.
- `DistinguishedTemperedDual.iso` (functoriality): Equivalent π and σ preserve membership.
- `DistinguishedTemperedDual.bessel` (equivalence): Membership equals nonvanishing of B(π,σ∨) in codimension one.
- `DistinguishedTemperedDual.multiplicity` (relation): Each member has a one-dimensional intertwining space by Bessel uniqueness.

Checks that distinguish the definition:

- `DistinguishedTemperedDual.compactTrivial` (degenerate): For compact G,H and π=1, Ω_π consists of the trivial representation of H.
- `DistinguishedTemperedDual.uTwo` (computation): For the standard representation of compact U(2), restricted along diag(z,1), Ω_π consists of the U(1) characters z↦z and 1.
- `DistinguishedTemperedDual.excludesWrongWeight` (non-example): For that U(2) representation the U(1) character z↦z² is absent.

Proof route:

1. Form the subset using the supplied representation category and Hom space.
2. Keep the smooth topology in the Hom predicate; neither an algebraic Hom nor a Hilbert-bounded map replaces it.

Acceptance checks: A compact branching constituent belongs precisely when its existing Classical Groups branching multiplicity is one.

Sources: [nv21](#nv21), §20, p. 142; §24, p. 157: Defines the distinguished tempered dual and uses it as the spectral support of the relative character.

### Support of the tempered local period

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/local-period-support` (theorem).

For a nonarchimedean characteristic-zero codimension-one GGP pair of orthogonal, unitary or split GL type and tempered irreducible π,σ, the convergent raw local form B on π⊗σ∨ is nonzero iff Hom_H(π,σ)≠0. Equivalently the relative character H_σ supplied by the orbit-method roadmap is nonzero iff σ∈Ω_π. The same nonvanishing equivalence holds for the real unitary pairs covered by BP20. This last extension alone does not assert positivity at real places.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/distinguished-tempered-dual`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/local-period-convergence`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-uniqueness`.

Proof route:

1. Invariance shows a nonzero raw form gives a nonzero model functional.
2. For the converse use the tempered model nonvanishing theorem, through local analytic contract L4; in codimension one its regularized integral is the ordinary convergent integral.
3. The relative-character expansion has the same support, using the basis and positivity contracts of its owner.

Acceptance checks: For compact H, integration projects onto the matching representation and detects exactly the existing branching constituent. No nontempered integral is asserted convergent.

Sources: [bp20](#bp20), Introduction, Theorem 5, p. 8; Theorem 7.2.1, pp. 162–163: Proves that the unitary tempered model functional is nonzero exactly when its multiplicity is nonzero, over both nonarchimedean and real fields. [nv21](#nv21), §20, p. 142; §21.1, p. 146: Records the nonarchimedean support theorem and the real unitary extension; the printed Waldspurger reference is corrected in sourceIssues.

Exact incoming or proof-refinement contracts: L4, O2.

### Positivity of nonarchimedean GGP periods

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/nonarchimedean-positivity` (theorem).

For tempered irreducible unitary π,σ of a nonarchimedean characteristic-zero codimension-one GGP pair, B(x,x)≥0 for every smooth x∈π⊗σ∨, and the supplied relative character satisfies H_σ(v,v)≥0. In particular α(v,v;u,u)≥0. Positivity is a theorem in this range; at archimedean places it remains an explicit condition wherever the chosen sources have not established it. This is positivity of the integrated form, not pointwise positivity of the integrand.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/local-period-convergence`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/local-period-support`.

Proof route:

1. Apply the supplied positive spectral/model factorization L4/O2 for this nonarchimedean spherical pair.
2. Evaluate the rank-one positive form on decomposable tensors and then sum the diagonal terms in the relative-character expansion; absolute convergence permits the sum.

Acceptance checks: For compact H this is the nonnegative orthogonal projection norm. A unitary coefficient may take negative or nonreal pointwise values, so positivity is not obtained by pointwise comparison.

Sources: [nv21](#nv21), Remark 18.2, p. 122; §20, p. 142: Records the nonarchimedean positivity theorem and distinguishes the expected archimedean assertion.

Exact incoming or proof-refinement contracts: L4.

### Phase normalization of distinguished intertwiners

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/phase-normalized-intertwiner` (construction).

Assume the supplied relative character H_σ on π^∞ is a continuous positive semidefinite Hermitian form, with its local period factorization, and that Hom_H(π^∞,σ^∞) has dimension at most one. If H_σ≠0, choose ℓ_σ:π^∞→σ^∞ so that H_σ(v₁,v₂)=⟨ℓ_σ(v₁),ℓ_σ(v₂)⟩ and B(v₁⊗bar(u₁),v₂⊗bar(u₂))=⟨ℓ_σ(v₁),u₁⟩overline(⟨ℓ_σ(v₂),u₂⟩). The choice is unique up to a unit complex scalar. Set ℓ_σ=0 when H_σ=0. The positive factorization and smooth-target existence are inputs O2/L4; a general GNS construction alone does not identify that target with σ. Positivity is known in the nonarchimedean range; at other places it is an explicit hypothesis.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/local-period-support`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/nonarchimedean-positivity`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-uniqueness`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/local-raw-period`.

Uses: Nelson–Venkatesh, §20 and Part V: Interprets relative-character values as squared norms and then as global branching strengths.

API:

- `PhaseIntertwiner.equivariant` (structure): ℓ_σ(π(h)v)=σ(h)ℓ_σ(v).
- `PhaseIntertwiner.norm` (relation): ‖ℓ_σ(v)‖²=H_σ(v,v).
- `PhaseIntertwiner.phase` (characterisation): Any two normalized nonzero choices differ by c∈ℂ with |c|=1.
- `PhaseIntertwiner.zero` (simp): When H_σ=0 the chosen map is zero.

Checks that distinguish the definition:

- `PhaseIntertwiner.unitPhase` (compatibility): Multiplying a normalized ℓ by i leaves H_σ unchanged.
- `PhaseIntertwiner.wrongScale` (non-example): If H_σ≠0 then 2ℓ is not normalized to the same H_σ.
- `PhaseIntertwiner.zeroCharacter` (degenerate): If H_σ=0, every squared norm of the chosen map is zero and the chosen map is zero.

Proof route:

1. Use the supplied positive rank-one period factorization and the one-dimensional Hom space.
2. Scale any nonzero intertwiner by the positive square root of its scalar ratio to H_σ; retain its residual unit phase.
3. Use the smooth-target continuity supplied by O2, not an unsupported claim that the operator is bounded on Hilbert completions.

Acceptance checks: The normalization of a nonzero ℓ_σ fixes its norm but never chooses a preferred phase.

Sources: [nv21](#nv21), Remark 18.2, p. 122; (20.1), p. 142: Normalizes the multiplicity-one intertwiner by the positive relative character and retains phase ambiguity.

Exact incoming or proof-refinement contracts: L4, O2.

### Multiplicity one for induction parameters

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/induction-parameter-injective` (theorem).

Over a nonarchimedean field, let 𝒟_H be the tempered induction-parameter space of conjugacy classes of square-integrable data (M,τ), modulo the finite equivalence relation for normalized unitary induction, and l:Ĥ_temp→𝒟_H its supplied map. Its restriction l|Ω_π is injective. Equivalently any full normalized induction of a square-integrable representation of a Levi of H has at most one π-distinguished irreducible summand, and that summand occurs with branching multiplicity one. Use the precise full-induction multiplicity statement, not only individual irreducible uniqueness.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/distinguished-tempered-dual`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/unitary-tempered`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/orthogonal-generic-nonarch`; `SmoothRepresentationsOfLocalGroups:SR.2a`; `SmoothRepresentationsOfLocalGroups:SR.3`.

Proof route:

1. The R-group/tempered induction contract S1 puts each fiber of l in a single tempered L-packet.
2. Apply the relevant-packet GGP multiplicity-one theorem, retaining its local classification conditions and even-SO convention.
3. Alternatively the direct full-induction theorem cited in the source supplies the same conclusion through L2/S1; it must not be inferred from irreducible multiplicity one alone.

Acceptance checks: For compact H each irreducible is its own inducing datum, and the restricted injection is immediate. No injection on all of Ĥ_temp is claimed.

Sources: [nv21](#nv21), Lemma 24.1 and following discussion, pp. 157–158: Separates the injection on the distinguished locus from the possible noninjectivity on the whole tempered dual and names the full-induction input.

Exact incoming or proof-refinement contracts: L2, S1.

### Topology of the distinguished nonarchimedean spectrum

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/distinguished-spectrum-topology` (theorem).

With the supplied tempered induction-parameter topology, l(Ω_π) is a union of whole l-components. Each component is a finite quotient of a compact real torus of unitary unramified twists. Transporting this topology along the preceding injection makes Ω_π a disjoint union of those quotients; the relative characters H_σ vary continuously there, and Ω_π→Spec(Bernstein center of H) is continuous. For a sufficiently small good compact open J, Ω_π^J is a finite union of such components. No equality with the Fell-subspace topology is asserted.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/induction-parameter-injective`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/local-period-support`; `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.3a`.

Proof route:

1. Use the full-induction formula for H_σ and smoothness of test vectors to prove continuity in each unitary unramified twist parameter (contract S1/O2).
2. Upper semicontinuity of multiplicity makes the distinguished subset closed, while local nonvanishing of the continuously varying character makes it open.
3. The connected torus quotient is therefore entirely in or out; transport its topology and the Bernstein-center map.
4. Uniform admissibility for good J bounds the number of components meeting J-fixed vectors.

Acceptance checks: A compact H gives a discrete distinguished spectrum; every singleton component is open. The topology used for auxiliary spectral windows is this explicit l-topology.

Sources: [nv21](#nv21), Lemma 24.2, (24.1)–(24.2), pp. 158–159: Uses upper semicontinuity of distinction and continuity of the full-induction relative character to obtain entire components and their topology.

Exact incoming or proof-refinement contracts: O2, S1.

### Finite spectral weights for a compact subgroup

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/compact-spectral-realization` (theorem).

When H is compact, every finitely supported k:Ω_π→ℂ is realized by a finite-rank smooth tensor T∈π⊗bar(π) with H_σ(T)=k(σ) for all irreducible σ of H, extended by zero off Ω_π. If k≥0, T can be chosen positive semidefinite. Its normalization uses the specified Haar measure and relative character. This is a specialization of the supplied compact decomposition and character, not a second Peter–Weyl theorem.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/distinguished-tempered-dual`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-uniqueness`; `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`.

Proof route:

1. Apply the existing compact isotypic decomposition and GGP multiplicity one.
2. In each of the finitely many selected isotypic summands choose smooth vectors and normalize their rank-one character value to one.
3. Sum the resulting tensors with coefficients k(σ); nonnegative coefficients give a positive semidefinite tensor.

Acceptance checks: For the standard U(2) restricted to U(1), weights on characters 1 and z are realized by a diagonal 2×2 operator.

Sources: [nv21](#nv21), §21, p. 144; §20, pp. 142–143: Uses the compact multiplicity-free restriction to realize finite spectral weights by smooth finite-rank tensors.

Exact incoming or proof-refinement contracts: O2.

Planets: Distinguished tempered spectrum, Tempered period support, Positivity of GGP periods, Phase-normalized branching maps, Distinguished induction parameters, Topology of distinguished spectra.

## GGP.7. Automorphic families, means and weak subconvexity

Specify actual automorphic embeddings and admissible spectral windows for anisotropic unitary and orthogonal pairs. Define the global branching coefficient and removed-place refinement. Prove the corrected weighted limit, family Weyl law, conductor–cardinality comparison, mean coefficient theorem and little-o subconvexity endpoint using the orbit-method supplier.

### Anisotropic automorphic branching data

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/automorphic-branching-data` (definition).

Fix a number field F and a codimension-one pair (G,H)=(U_{n+1},U_n), n≥1, or (SO_{n+1},SO_n), n≥2, both anisotropic over F. Choose an archimedean q where G(F_q) is quasi-split, with G(F_v) compact at every other archimedean v. Choose finite R containing all archimedean and bad places, compatible smooth integral models and hyperspecial K_v⊃J_v outside R, and G(F)G_RK=G(𝔸), H(F)H_RJ=H(𝔸). Factor Tamagawa measures with vol(K)=vol(J)=1. Fix an actual square-integrable automorphic embedding Π⊂L²([G]), unramified outside R, such that Π_R=π⊗π′ is tempered and π=Π_q is generic. Use all actual automorphic copies Σ⊂L²([H]) unramified outside R when summing. The geometric setup has τ(G)=τ(H)=2; the group-specific volume theorem A1 is retained as an input.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-pair`; `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-form`; `AutomorphicFormsOnReductiveGroups:AF.2/restricted-tensor-product`; `AutomorphicSpectralTheory:AS.6/compact-trace-specialization`; `AdelicAlgebraicGroups:AA.2/tamagawa-measure`; `AdelicAlgebraicGroups:AA.2/tamagawa-number`; `AdelicAlgebraicGroups:AA.2`.

Uses: Nelson–Venkatesh, Theorem 31.11: Fixes the ambient quotient, local distinguished spectra and normalization for its families.

API:

- `AutomorphicBranchingData.local` (projection): Π_R factors isometrically as π⊗π′ on the given actual automorphic subspace.
- `AutomorphicBranchingData.compact` (relation): [G] and [H] are compact.
- `AutomorphicBranchingData.volume` (relation): The quotient volumes are the stated Tamagawa numbers, both 2.
- `AutomorphicBranchingData.copies` (characterisation): A spectral sum counts distinct copies in L²([H]), including global multiplicity.

Checks that distinguish the definition:

- `AutomorphicBranchingData.quadraticField` (computation): For F=ℚ(√5), G=SO(x₁²+x₂²+(1−√5)(x₃²+x₄²)) and H fixing x₄, the second real place is definite and q has split signatures (2,2) and (2,1).
- `AutomorphicBranchingData.splitExcluded` (non-example): GL₂⊃GL₁ over ℚ does not satisfy the anisotropy hypothesis.
- `AutomorphicBranchingData.unramifiedLine` (compatibility): Outside R the K_v- and J_v-fixed spaces of the chosen irreducible unramified factors are one-dimensional.

Proof route:

1. Package the existing adelic quotient, restricted tensor product and chosen automorphic embedding, retaining the integral models and measures.
2. Use anisotropy for compactness and the group-specific Tamagawa theorem for the value 2; neither compactness nor the numerical volume is automatic from the Haar construction alone.

Acceptance checks: The split GL pair is a local comparison case but is excluded from this anisotropic global setup.

Sources: [nv21](#nv21), §§25.1–25.7, pp. 167–172: Specifies compact quotients, actual automorphic realizations, local metric choices, a privileged real place and the generic tempered hypothesis.

Exact incoming or proof-refinement contracts: A1.

### Global branching coefficients

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/global-branching-coefficient` (definition).

For the preceding data and an actual Σ with Π_R,Σ_R tempered and distinguished, let p(v,bar(u))=∫_[H]v(h)overline(u(h))dh. It gives P(x,y)=p(x)overline(p(y)) on smooth Π_R⊗Σ_R∨. Let B_R be the convergent product-representation local form on this tensor carrier, using the slot exchange in GGP.4. When B_R is nonzero and positive semidefinite, multiplicity one gives a unique scalar L_R(Π,Σ)≥0 such that P=L_R(Π,Σ)B_R. If distinction fails, set L_R=0. In the remaining distinguished case the coefficient is defined only after the nonzero positive form has been supplied; its existence is an explicit local input in the family theorems. It depends on R, the fixed global embedding, and the compatible metrics and measures.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/automorphic-branching-data`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-uniqueness`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/local-raw-period`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/local-period-convergence`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/phase-normalized-intertwiner`.

Uses: Nelson–Venkatesh, Corollary 31.8 and Theorem 31.11: The averaged nonnegative quantities are these period coefficients, before any L-value conjecture is imposed.

API:

- `BranchingCoefficient.factorization` (characterisation): P=L_R B_R determines L_R whenever B_R≠0.
- `BranchingCoefficient.nonneg` (relation): Positive B_R implies L_R≥0.
- `BranchingCoefficient.periodZero` (characterisation): For B_R≠0, L_R=0 iff p=0.
- `BranchingCoefficient.metricTransport` (functoriality): Changing the local metric by c>0 changes B_R by c and L_R by c^{-1}, with the global functional held fixed.

Checks that distinguish the definition:

- `BranchingCoefficient.scalarQuotient` (computation): For any x with B_R(x,x)>0, L_R=|p(x)|²/B_R(x,x).
- `BranchingCoefficient.zeroPeriod` (degenerate): The zero global period gives L_R=0 whenever B_R≠0.
- `BranchingCoefficient.metricScale` (compatibility): Doubling B_R while fixing P halves L_R; omitting this change would give the wrong definition.

Proof route:

1. Integrate the global smooth vectors on the compact [H].
2. Use the one-dimensional local invariant-functional space to compare the two Hermitian forms. Positivity makes the scalar nonnegative and nonvanishing makes it unique.
3. Keep the chosen automorphic copy: an abstract representation with two embeddings need not have the same period.

Acceptance checks: If the global period vanishes while B_R≠0, the coefficient is zero.

Sources: [nv21](#nv21), §25.4, (25.1)–(25.3), pp. 168–169: Defines the coefficient by comparing the squared global period with the local invariant form; the nonzero local-form hypothesis is visible.

Exact incoming or proof-refinement contracts: O2.

### The refined proposition with R-factors removed

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/removed-place-refined-proposition` (definition).

For tempered distinguished Π_R,Σ_R in GGP.7, define RemovedPlaceRefinement(Π,Σ,R) to assert that B_R is nonzero positive and that L_R(Π,Σ)=2^{-β(Π,Σ)}Δ_G^{(R)}L^{(R)}(1/2,Π×Σ∨)/L^{(R)}(1,Ad,Π×Σ∨). Here 2^β is the order of the Arthur-parameter centralizer component group in the convention of the refined period identity, the denominator is the product adjoint factor, and Δ_G^{(R)} has almost-everywhere local factor q_v^{dim G}/#G(𝔽_v). All factors at R are removed, including archimedean factors. This is a proposition, not an assumed theorem. In unitary everywhere-tempered cases its truth follows from the supplied Ichino–Ikeda theorem after reconciling Haar and dual conventions. No universal equality 2^β=τ(G)τ(H) is asserted.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/global-branching-coefficient`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/unitary-refined-proposition`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/ii-component-group`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`; `AdelicAlgebraicGroups:AA.2/weil-volume-formula`; `AdelicAlgebraicGroups:AA.2/convergence-factors`.

Uses: Nelson–Venkatesh, (31.4), p. 204: Converts the mean branching coefficient into a normalized mean of partial central values.

API:

- `RemovedPlaceRefinement.evaluate` (projection): Returns the displayed partial-L-value equality.
- `RemovedPlaceRefinement.localNonzero` (projection): Supplies B_R≠0 and positivity.
- `RemovedPlaceRefinement.unitary` (compatibility): The completed unitary formula gives this identity with matching factors and measures.

Checks that distinguish the definition:

- `RemovedPlaceRefinement.stable` (computation): For two single-constituent unitary parameters, 2^{-β}=1/4.
- `RemovedPlaceRefinement.endoscopic` (non-example): For three total unitary constituents, replacing 2^{-β}=1/8 by 1/(τGτH)=1/4 is wrong.
- `RemovedPlaceRefinement.removedArchimedean` (compatibility): Because R contains every archimedean place, L^{(R)} contains no archimedean gamma factor.

Proof route:

1. Package the removed-place identity with its local nonvanishing and positivity conditions.
2. For the known unitary comparison, dualize Σ, remove the R-factors from the completed formula and compare the same global measure and automorphic metric.
3. Use the actual component group order, including endoscopic constituents; do not replace it by a generic volume prediction.

Acceptance checks: For a stable unitary pair the group order is 4; an endoscopic pair with three total constituents has order 8.

Sources: [nv21](#nv21), Conjecture 25.1 and Remark 25.2, pp. 169–170: Separates the precise component-group normalization from a generic expectation involving Tamagawa volumes.

### Admissible automorphic branching families

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/admissible-family` (definition).

For GGP.7 let 𝒪 be the nonempty regular-nilpotent limit orbit set of the generic π, with stable restriction image X=[𝔥^]∩image(𝒪_stab) supplied by the orbit-method owner. Choose nonempty open precompact U⊂X of zero-boundary affine measure, and nonempty open precompact U′⊂Ω_{π′} of zero-boundary Plancherel measure in the supplied distinguished topology. At every finite v∈R the projection of U′ must lie in a union of allowable l-components, in the exact two positive approximation senses of NV Definition 24.3. Define ℱ_h, for h>0, to be the actual automorphic copies Σ unramified outside R whose σ=Σ_q and σ′=Σ_{R\{q}} are tempered, whose local orbit-intersection 𝒪_{π,σ} is nonempty, with hλ_σ∈U and σ′∈U′. The measures have full support on these loci; retain vol(U)vol(U′)>0 for division in the mean theorem. Let d be the complex dimension of a Borel of (Res_{F_q/ℝ}H)_ℂ. For real q this is the usual absolute Borel dimension; for complex q it is twice that dimension. It is not the flag-variety dimension.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/automorphic-branching-data`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/distinguished-spectrum-topology`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/stability-and-conductor`.

Uses: Nelson–Venkatesh, Corollary 31.8 and Lemma 31.9: Sets the common family in the weighted and unweighted asymptotics.

API:

- `AdmissibleFamily.mem` (characterisation): Membership is exactly the unramified, tempered, orbit, rescaled-window and auxiliary-window conditions above.
- `AdmissibleFamily.finite` (relation): ℱ_h is finite for each positive h.
- `AdmissibleFamily.windowMono` (functoriality): Enlarging U and U′ within the admissible class enlarges ℱ_h.
- `AdmissibleFamily.measure` (data): The two positive finite volumes use the compatible affine and Plancherel normalizations.

Checks that distinguish the definition:

- `AdmissibleFamily.emptyWindow` (degenerate): If either window is empty the corresponding unqualified family is empty; the mean theorem therefore requires nonempty windows.
- `AdmissibleFamily.boundary` (non-example): A precompact set with positive-measure boundary does not satisfy admissibility by that condition alone.
- `AdmissibleFamily.allowability` (compatibility): A finite-place component of supercuspidal inducing type is allowable by the orbit-method supplier theorem; arbitrary components are not all declared allowable.

Proof route:

1. Import stable orbits, affine quotient measure and allowable approximation classes through O1–O3; keep these definitions with their existing owner.
2. Form the spectral subset with all four restrictions, then use compact-quotient spectral discreteness and precompact windows to obtain finiteness.
3. Use full-support affine/Plancherel measures for positivity of volumes, rather than assuming every nonempty measurable set has positive measure.

Acceptance checks: For H=U(1), d=1; for H=SO(2), d=1. Both tori have zero-dimensional flag varieties, so substituting that dimension changes the asymptotic.

Sources: [nv21](#nv21), Definitions 24.3, 31.1, 31.5 and 31.7, pp. 159, 200–201: Defines the positive local approximation condition and the precise open spectral windows and orbit-distinguished automorphic family.

Exact incoming or proof-refinement contracts: O1, O2.

### The weighted automorphic period limit

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/weighted-period-limit` (theorem).

For the anisotropic data and admissible family of GGP.7, with the supplied nonzero positive local forms and quantitative orbit-method inputs O1–O3, h^d∑_{Σ∈ℱ_h}L_R(Π,Σ) tends to [τ(H)/τ(G)]vol(U)vol(U′) as h→0⁺. In the exceptional pair (SO₃,SO₂), write K=F(√(−disc V_H)) and χ=η_{K/F}∘θ using the spinor norm θ; impose Π≄Π⊗χ. This is the correction to the source’s stated weighted theorem recorded as E1. The theorem does not use the refined L-value proposition.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/admissible-family`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/global-branching-coefficient`; `AutomorphicSpectralTheory:AS.6/compact-trace-specialization`; `AdelicAlgebraicGroups:AA.2`.

Proof route:

1. Apply the supplier’s limit-state equidistribution theorem to smooth archimedean symbols and allowable auxiliary weights, with the non-self-twist correction in the rank-one orthogonal exception.
2. Use the two positive approximation bounds at finite places and smooth approximation of zero-boundary windows.
3. Control both upper and lower errors by their small affine/Plancherel integrals, obtaining the displayed sharp-window limit.

Acceptance checks: In the stated setup τ(H)/τ(G)=1, so the limit is the product of the two window volumes. The dihedral self-twist case is excluded from this equality, rather than silently counted with the same constant.

Sources: [nv21](#nv21), Theorem 30.1, Corollaries 31.4 and 31.8, pp. 199, 201–202; §27, p. 182: Transfers limit-state equidistribution through positive approximation to unweighted windows; the SO₃/SO₂ condition repairs the identified obstruction.

Exact incoming or proof-refinement contracts: O3, A1.

### The family Weyl law

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/family-weyl-law` (theorem).

For the same anisotropic data and admissible windows, h^d|ℱ_h|→τ(H)vol(U)vol(U′)>0 as h→0⁺. This counting theorem does not require Π≄Π⊗χ in the SO₃/SO₂ case. It counts actual automorphic copies and uses the stated Tamagawa normalization.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/admissible-family`; `AutomorphicSpectralTheory:AS.6/compact-trace-specialization`; `AdelicAlgebraicGroups:AA.2`.

Proof route:

1. Use the supplier’s local smooth spectral approximation and the compact trace specialization of AS.6.
2. At the distinguished real place shrink geometric support so that only the identity contributes. Evaluate that contribution with quotient volume τ(H).
3. Apply the zero-boundary approximation to pass to ℱ_h; retain positivity to obtain eventual nonemptiness.

Acceptance checks: The ratio |ℱ_h|h^d/[vol(U)vol(U′)] tends to 2 in this setup. The SO₃/SO₂ self-twist does not change this counting normalization.

Sources: [nv21](#nv21), Lemma 31.9, p. 202: Obtains the count from the compact trace formula, with the identity geometric term dominating the shrinking test support.

Exact incoming or proof-refinement contracts: O3, A1.

### Analytic conductor and family size

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/conductor-family-size` (comparison).

Uniformly for Σ∈ℱ_h as h→0⁺, the analytic conductor of L(s,Π×Σ∨) at s=1/2 satisfies C(Π,Σ)≍h^{-4d}≍|ℱ_h|⁴. For real q, the exponent at the distinguished place is εm_Gm_H, where (ε,m_G,m_H,d) equals (2,n+1,n,n(n+1)/2) for U_{n+1}/U_n; (1,2n+2,2n,n(n+1)) for SO_{2n+2}/SO_{2n+1}; and (1,2n,2n,n²) for SO_{2n+1}/SO_{2n}. In every displayed real case εm_Gm_H=4d. For complex q, restriction of scalars doubles both d and the gamma-weight count, so the exponent remains 4d; the complex local-factor comparison is part of F1. Contributions away from q stay bounded above and below by the fixed auxiliary windows and unramified conditions.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/family-weyl-law`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/rankin-selberg-weights`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/stability-and-conductor`; `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Proof route:

1. Apply the real local-factor weight description on the compact closure of the stable window to obtain a positive lower bound for every rescaled tensor weight.
2. Multiply all gamma-weight sizes and bound the fixed auxiliary-place conductor factors.
3. Compute the three displayed exponent identities and insert the family Weyl law.

Acceptance checks: For U₂/U₁ and SO₃/SO₂ one has d=1 and C≍h^{-4}. Allowing the window to meet the zero-weight locus can drop the conductor exponent.

Sources: [nv21](#nv21), Lemma 31.10 and Table 1, pp. 202–203; (15.3), p. 107: Uses uniform stable weight separation and the Borel-dimension identity to compare conductor with the fourth power of family cardinality.

Exact incoming or proof-refinement contracts: F1.

### The mean branching coefficient theorem

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/mean-period-theorem` (theorem).

Under the hypotheses of the corrected weighted-period limit, |ℱ_h|^{-1}∑_{Σ∈ℱ_h}L_R(Π,Σ)→1/τ(G)=1/2. If RemovedPlaceRefinement holds for the family, then |ℱ_h|^{-1}∑_{Σ∈ℱ_h}[τ(G)τ(H)/2^{β(Π,Σ)}]Δ_G^{(R)}L^{(R)}(1/2,Π×Σ∨)/L^{(R)}(1,Ad,Π×Σ∨)→τ(H)=2. The component-group factor remains inside the sum when it varies with Σ.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/weighted-period-limit`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/family-weyl-law`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/removed-place-refined-proposition`; `AdelicAlgebraicGroups:AA.2`.

Proof route:

1. Divide the two limits using the strictly positive window-volume product.
2. Under the refined proposition substitute its equality termwise, retaining the actual β(Π,Σ), and multiply by τ(G)τ(H).

Acceptance checks: The mean period coefficient is 1/2; it is not 2. The latter is the differently normalized L-value mean.

Sources: [nv21](#nv21), Theorem 31.11, (31.3)–(31.4), pp. 203–204: Divides the weighted asymptotic by the family count, and conditionally rewrites it using the refined period identity.

Exact incoming or proof-refinement contracts: A1.

### Weak subconvexity for branching coefficients

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/weak-subconvexity` (theorem).

In the anisotropic setup of GGP.7, for tempered orbit-distinguished Σ with auxiliary components in fixed allowable compact windows and rescaled distinguished parameters in a fixed compact stable set, L_R(Π,Σ)=o(C(Π,Σ)^{1/4}) as C→∞. This endpoint also holds in the SO₃/SO₂ self-twist case, using the corrected proof’s uniform factor-two bound in place of the false weighted equality. Translating this assertion into an L-value bound additionally requires the removed-place refined proposition and the stated adjoint/component factors. No fixed power saving is asserted.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/conductor-family-size`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/global-branching-coefficient`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/removed-place-refined-proposition`.

Proof route:

1. Use nonnegativity to bound an individual coefficient by a sum over a small window containing its limiting stable parameters.
2. The uniform positive-window estimate supplied by O3 bounds that sum by h^{-d} times its arbitrarily small volume; in the SO₃/SO₂ exception a bounded factor 2 suffices.
3. First take the semiclassical limit with the window fixed, then shrink its volume; compactness gives a subsequence argument for the uniform little-o statement.
4. Use C^{1/4}≍h^{-d}. A single fixed-window mean alone would give only a bounded ratio.

Acceptance checks: The claimed ratio L_R/C^{1/4} tends to zero along every such sequence. This gives no explicit δ>0 in a bound C^{1/4−δ}.

Sources: [nv21](#nv21), Introduction, (1.4), p. 4; §§27.1 and 31.2–31.6, pp. 177–182, 201–204: Uses positive local windows and equidistribution to obtain a little-o improvement over the convexity-size period bound; E1 records the correction required in the self-twist exception.

Exact incoming or proof-refinement contracts: O3.

Planets: Global branching coefficients, Refined branching identity, Admissible branching families, Branching-family Weyl law, Mean branching coefficient theorem, Weak subconvexity of periods.

## GGP.8. Definite and arithmetic diagonal periods

Specify the common relevant arithmetic unitary data. Define the finite graph-sum period, compare it with the compact global integral with the correct stabilizer weights, and prove the central-value definite nonvanishing endpoint. Define the derivative-to-Chow nonvanishing proposition while keeping it conjectural and separate from Abel–Jacobi nonvanishing.

### Arithmetic unitary period data

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/arithmetic-period-data` (definition).

Let E/F be a CM extension with F totally real and a chosen complex embedding over a real place τ∞. Fix n≥2, the even and odd members n₀=2r₀,n₁=2r₁+1 of {n,n+1}, with r₀,r₁≥1 and n=r₀+r₁. For α=0,1 let Π_α be a conjugate-self-dual cuspidal representation of GL_{nα}(𝔸_E) whose component at each complex place is the irreducible normalized principal series with characters arg^{1−nα},arg^{3−nα},…,arg^{nα−1}, arg(z)=z/|z|. Retain the supplied strong coefficient field L⊂ℂ, its integer ring 𝒪_L, the finite set S_min of ramified and bad places from the two representations and E/F, and the unramified Hecke characters φ_{Πα}:𝕋_{nα}^{S_min}→𝒪_L. A standard definite hermitian space has signature (N,0) at every real place; a standard indefinite one has signature (N−1,1) at τ∞ and (N,0) elsewhere. Write V_{n+1}=V_n⊕E with the fixed positive norm line, and use the supplied neat level pairs K_n⊂K_{n+1}∩U(V_n)(𝔸_f) and their map sh↑. These arithmetic realizations are supplied by the unitary Shimura owner U1, not constructed again here.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/hermitian-isobaric-parameter`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-pair`; `ShimuraVarieties:V0/plan/neat-sublevels`; `ShimuraVarieties:V8/plan/datum-functoriality`.

Uses: Liu–Tian–Xiao–Zhang–Zhu, Lemma 8.2.1 and Conjecture 8.3.1: Supplies their common setup without importing their Euler-system or residual-Galois hypotheses into the period statement.

API:

- `ArithmeticGGPData.ranks` (projection): {n₀,n₁}={n,n+1}, n₀ even, n₁ odd, and n=r₀+r₁.
- `ArithmeticGGPData.archimedean` (projection): Returns the full multiset of specified argument-character exponents.
- `ArithmeticGGPData.hecke` (projection): The two Hecke eigencharacters have values in 𝒪_L outside S_min.
- `ArithmeticGGPData.normLine` (compatibility): Adding the fixed positive norm line preserves definiteness and changes signature (n−1,1) to (n,1) at τ∞.

Checks that distinguish the definition:

- `ArithmeticGGPData.rankTwo` (computation): For n=2, (n₀,n₁,r₀,r₁)=(2,3,1,1); the two exponent multisets are {−1,1} and {−2,0,2}.
- `ArithmeticGGPData.indefiniteDimension` (computation): For standard indefinite consecutive spaces, the Shimura dimensions are n−1 and n, so the product has dimension 2n−1.
- `ArithmeticGGPData.nontrivialWeights` (non-example): An arbitrary regular algebraic Π with different archimedean weights does not satisfy these data, even if it is conjugate-self-dual.

Proof route:

1. Specialize the supplied automorphic and Hecke data to the displayed weights and consecutive ranks.
2. Use the norm-line inclusion from GGP.0; import the arithmetic quotient, strong coefficient field and neat-level map rather than giving alternate moduli definitions.

Acceptance checks: The adjective relevant for Π here means the displayed regular algebraic cuspidal condition; it is distinct from relevance of a pair of spaces.

Sources: [ltx22](#ltx22), Definition 1.1.3 and Remark 1.1.4, p. 110; Definitions 3.1.11, 3.2.1 and 3.2.5, pp. 143–145; §7.1, p. 286: Fixes the particular relevant archimedean weights, rank parity, coefficient field, form signatures and compatible arithmetic levels used by the two endpoints.

Exact incoming or proof-refinement contracts: U1.

### Finite diagonal periods

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/finite-diagonal-period` (definition).

For finite sets S,T, a map ι:S→T and a function f:S×T→ℂ define DiagonalPeriod(ι,f)=∑_{s∈S}f(s,ι(s)). Over a coefficient ring replace ℂ by that ring. On standard definite unitary Shimura sets take S=Sh(V_n,K_n), T=Sh(V_{n+1},K_{n+1}), and ι=sh↑. If n₀=n+1 rather than n, swap the two factors when evaluating a function on Sh(V_{n₀})×Sh(V_{n₁}). The finite-sum definition uses existing finite carriers and sums; it does not define a Shimura set.

Prerequisites: `mathlib:Finset.prod`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/arithmetic-period-data`.

Uses: Definite diagonal nonvanishing, GGP.8: Expresses the algebraic period furnished by the global GGP theorem.

API:

- `diagonalPeriod` (constructor): Returns the displayed finite graph sum over existing finite types.
- `diagonalPeriod_add` (structure): The period of f+g is the sum of their periods.
- `diagonalPeriod_smul` (structure): The period of c·f is c times the period of f.
- `diagonalPeriod_reindex` (functoriality): A bijection e:S′≃S gives ∑_{s′}f(e(s′),ι(e(s′)))=DiagonalPeriod(ι,f).
- `diagonalPeriod_one` (simp): The period of the constant function 1 is #S.
- `diagonalPeriod_indicator` (characterisation): For f supported at one point (s₀,t₀), with value 1 there, the period is 1 iff ι(s₀)=t₀, and otherwise 0.

Checks that distinguish the definition:

- `diagonalPeriod_empty` (degenerate): For S=∅ the period is zero.
- `diagonalPeriod_two` (computation): For S=T=Fin 2, ι=id and f(i,j)=if i=j then 1 else 0, the period is 2.
- `diagonalPeriod_offGraph` (non-example): For S=T=Fin 2, ι=id and f(i,j)=if i≠j then 1 else 0, the period is zero.

Proof route:

1. Use the finite sum over S and composition with its graph map; prove the API with the existing sum laws.
2. For Shimura sets import finiteness and sh↑ from U1 and explicitly transport the factor order.

Acceptance checks: For pure tensors f(s,t)=a(s)b(t) this is ∑_s a(s)b(ι(s)), with no complex conjugation.

Sources: [ltx22](#ltx22), Lemma 8.2.1, p. 308: Uses a sum along the graph of the finite-set inclusion, with an integral Hecke-isotypic function on the two factors.

### Definite periods as finite graph sums

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/definite-integral-comparison` (comparison).

For standard definite V_n⊂V_{n+1} and the supplied neat level pair, the global bilinear unitary period on level-fixed functions is c_K times the finite diagonal period, with a single nonzero positive real volume c_K depending on the quotient measure and level. For general non-neat levels the correct sum instead has weights 1/|Γ_s|, where Γ_s is the finite arithmetic stabilizer; an unweighted sum is not asserted there. At neat level all Γ_s are trivial, giving the common volume. Therefore nonvanishing of the global period is equivalent to nonvanishing of the finite sum at these levels.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/finite-diagonal-period`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-bessel-period`; `AdelicAlgebraicGroups:AA.2/automorphic-quotient-measure`; `AdelicAlgebraicGroups:AA.2/compact-open-volume`; `AdelicAlgebraicGroups:AA.4/quotient-volume-decomposition`.

Proof route:

1. Decompose U(V_n)(F)\U(V_n)(𝔸) into its finitely many level double cosets.
2. Integrate the constant value of the level-fixed function over each piece; its volume is a common positive factor divided by the finite stabilizer order.
3. Apply neatness to remove stabilizers and identify the bilinear product with the graph evaluation in the correct rank order.

Acceptance checks: A singleton neat Shimura set has period c_K times the one graph value. Unequal stabilizer orders at non-neat levels require weights.

Sources: [ltx22](#ltx22), §3.2, pp. 144–145; Lemma 8.2.1 and proof, p. 308: Passes from a compact definite unitary period to a finite Shimura-set graph sum at its prescribed levels.

Exact incoming or proof-refinement contracts: U1.

### Central values and definite diagonal periods

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/definite-diagonal-nonvanishing` (theorem).

For the arithmetic data of GGP.8, if the completed Rankin–Selberg value L(1/2,Π₀×Π₁) is nonzero, there exist a standard definite rank-n space V_n°, a self-dual lattice Λ_n° away from S_min and infinity, V_{n+1}°=V_n°⊕E and Λ_{n+1}°=Λ_n°⊕𝒪_E, and a supplied neat compatible level pair with K_{nα}° hyperspecial equal to U(Λ_{nα}°)(𝒪_v) outside S_min, such that DiagonalPeriod(sh↑,f)≠0 for some f in 𝒪_L[Sh(V_{n₀}°,K_{n₀}°)][ker φ_{Π₀}]⊗_{𝒪_L}𝒪_L[Sh(V_{n₁}°,K_{n₁}°)][ker φ_{Π₁}]. The bracket denotes the Hecke eigenspace annihilated by the indicated kernel. At bad finite places the compact open factors are chosen as part of the conclusion. This is the period endpoint of LTX Lemma 8.2.1, without its subsequent Selmer-group applications.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/arithmetic-period-data`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/definite-integral-comparison`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-packet-proposition`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/unitary-tempered`; `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/unramified-period`.

Proof route:

1. Apply the stable cuspidal global GGP theorem J1 to the Hermitian pair Π₀⊠Π₁, using its actual cuspidal hypotheses.
2. At every real place the unique distinguished local pair for these weights is the trivial representation of the compact unitary pair, so the global forms are standard definite.
3. Use the unramified refinement to obtain self-dual lattices and hyperspecial fixed vectors outside S_min. Choose sufficiently small compatible neat levels at the remaining places.
4. Identify the compact global period with the finite graph sum and clear coefficient-field denominators within its Hecke eigenspace; the nonzero sum survives.

Acceptance checks: For n=2 the endpoint is a nonzero finite diagonal sum for ranks 2 and 3, not a cycle on a positive-dimensional definite variety. The lattice and hyperspecial conditions outside S_min are part of the conclusion.

Sources: [ltx22](#ltx22), Lemma 8.2.1 and proof, p. 308: Derives the definite graph-sum nonvanishing from the stable global unitary GGP theorem and its unramified-level refinement. [bplzz21](#bplzz21), Theorem 1.8, pp. 3–4; Remark 4.17, p. 42: Provides the stable cuspidal realization with nonzero period and permits the stated unramified local choices.

Exact incoming or proof-refinement contracts: J1, U1.

### The weak arithmetic GGP proposition

Target `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/weak-arithmetic-proposition` (definition).

For the same arithmetic Π₀,Π₁ define WeakArithmeticGGP(Π₀,Π₁) to be the following implication: if L(1/2,Π₀×Π₁)=0 and L′(1/2,Π₀×Π₁)≠0, there exist a standard indefinite V_n, its fixed positive-line extension V_{n+1}, self-dual lattices away from S_min and infinity, and a neat compatible level pair hyperspecial there, such that the graph of sh↑ is nonzero in CH^n(Sh(V_{n₀},K_{n₀})×_E Sh(V_{n₁},K_{n₁}))_L/(ker φ_{Π₀},ker φ_{Π₁}). The notation is the quotient by the sum of the two Hecke-kernel actions, not a choice of an idempotent when none is supplied. The Shimura product has dimension 2n−1 and the graph dimension n−1, hence graph codimension n. Its graph class is imported from MotivesAndAlgebraicCycles and U1. The proposition asserts Chow nonvanishing, and does not assert nonvanishing of an Abel–Jacobi realization. No λ appears in this coefficient-field Chow assertion.

Prerequisites: `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/arithmetic-period-data`; `ShimuraVarieties:V8/plan/datum-functoriality`; `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`.

Uses: Liu–Tian–Xiao–Zhang–Zhu, §8.3: Names the shared conjectural arithmetic endpoint while the Euler-system roadmap treats Selmer conclusions under the stronger Abel–Jacobi hypothesis.

API:

- `WeakArithmeticGGP.apply` (projection): The two central-value hypotheses imply the stated existence and Chow nonvanishing.
- `WeakArithmeticGGP.codimension` (compatibility): The graph is in codimension n because (2n−1)−(n−1)=n.
- `WeakArithmeticGGP.coefficientExtension` (functoriality): A faithfully flat coefficient-field extension transports the Hecke quotient and nonzero class when the supplied Chow base-change comparison applies.

Checks that distinguish the definition:

- `WeakArithmeticGGP.rankTwo` (computation): For n=2 the target quotient is a quotient of CH² of a threefold.
- `WeakArithmeticGGP.simpleZero` (characterisation): The antecedent requires a simple zero at the central point; a double zero does not meet it.
- `WeakArithmeticGGP.noLambda` (compatibility): Changing an auxiliary finite prime λ of L leaves this L-coefficient Chow proposition unchanged, because λ is absent from both its group and class.

Proof route:

1. Use the supplied standard indefinite Shimura varieties, their dimension theorem and level map.
2. Import the graph correspondence, regard it in codimension n, and form the stated Hecke quotient with coefficient field L.
3. Package the implication as a proposition. Its proof remains conjectural; no arithmetic GGP theorem or Abel–Jacobi injectivity is assumed.

Acceptance checks: For n=2 the graph has dimension one in a three-dimensional product and belongs to CH². A nonzero Chow class need not have nonzero Abel–Jacobi image without an additional theorem.

Sources: [ltx22](#ltx22), Conjecture 8.3.1 and discussion before Theorem 8.3.2, p. 315: States the derivative-to-Chow-class conjecture; the subsequent Abel–Jacobi nonvanishing hypothesis is a separate condition.

Exact incoming or proof-refinement contracts: U1.

Planets: Arithmetic unitary period data, Finite diagonal periods, Definite diagonal nonvanishing, Weak arithmetic GGP conjecture.

## Worked comparisons

1. **Dual sign in compact branching.** Restrict the standard representation of U(2) along z↦diag(z,1). The branching targets are the U(1) characters z and 1. The bilinear models pair those constituents with z⁻¹ and 1. A definition that forgets the dual fails the wrong-weight and character-integral tests.
2. **Even orthogonal orientation.** In so₄, torus entries (a,b) and (−a,b), with ab≠0, give the same multiset {a,−a,b,−b}. Their Pfaffians differ by sign. Keeping ev without pf loses the SO adjoint-quotient coordinate.
3. **Endoscopy changes the period constant.** A stable U(n)×U(n+1) parameter has one cuspidal constituent in each factor and sign group of order 4. An endoscopic pair with two and one constituents has order 8. Replacing both by τ(G)τ(H)=4 doubles the latter proposed period.
4. **Borel versus flag dimension.** For real q and H=U(1) or SO(2), d=1 although its flag variety is a point. The family has cardinality comparable to h⁻¹ and conductor comparable to h⁻⁴. A zero exponent would destroy both comparisons. At a complex distinguished place, use restriction of scalars and double both the Borel dimension and weight count.
5. **Arithmetic codimension.** For n=2 the indefinite Shimura factors have dimensions 1 and 2. Their graph has dimension 1 in a product of dimension 3, hence is a CH² class. A central derivative predicts its nonzero class in the Hecke quotient; it does not furnish an Abel–Jacobi detector.
6. **Finite graph period.** On S=T=Fin 2 with ι=id, the diagonal indicator has period 2, while the off-diagonal indicator has period 0. This tests the graph evaluation itself, rather than the sum over all four pairs.

## Supplier and closure contracts

Every layer is planned at target level. The following contracts keep the plan honest about proof-source decomposition and supplier precision; the packet is complete, not closed. The proposed orbit-method, comparison and unitary-model roadmaps are named as owners here without inventing unavailable prerequisite identifiers.

### L1: Invariant-distribution uniqueness inputs

Supply the distribution criterion and its classical anti-involution calculation: for each codimension-one pair and irreducible admissible π,σ, transpose-invariance of the appropriate invariant distributions implies dim Hom_H(π,σ)≤1; prove the AGRS nonarchimedean and Sun–Zhu archimedean cases, and the induction comparison of GGP Theorem 15.1 in the stated continuous category. These nontrivial distribution results are not supplied by Schur’s lemma or by the basic representation category. The original AGRS/Sun–Zhu proofs have not been read in this pass; decomposition into their exact key inputs is a follow-up.

Owner: This roadmap, local analytic proof refinement.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/bessel-uniqueness`.

### L2: Local relative trace and multiplicity formula closure

For the tempered unitary and orthogonal Bessel models, supply the geometric multiplicity integral m_geom(π), including nilpotent-germ coefficients, its convergence and the identity m(π)=m_geom(π); prove the strongly cuspidal local relative trace equality and packet cancellation with normalized endoscopic transfer, so that the total relevant packet multiplicity is one. BP20 Theorems 11.4.1–11.4.2 and 12.4.1, Luo Theorem 8.3.2 and the Waldspurger tempered formula give the exact endpoints. The full analytic proof decomposition and the orthogonal original source audit remain required; ordinary endoscopic transfer alone does not prove this relative trace formula.

Owner: This roadmap, local relative-trace refinement; imports ET and ML rather than global Jacquet–Rallis.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/unitary-tempered`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/orthogonal-generic-nonarch`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/orthogonal-tempered-arch`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/induction-parameter-injective`.

### L3: Generic standard-module multiplicity reduction

Supply the model-preserving reduction from the two irreducible generic standard modules to their tempered cores in every odd Bessel codimension: normalized induction, ordered real exponents, geometric-lemma filtrations, second adjointness, avoidance of forbidden supercuspidal supports and continuation must yield equality of Bessel multiplicities. Audit Gan–Ichino Proposition 9.4 and Mœglin–Waldspurger Proposition 1.3 proofs, not only the quoted statements. ML.4 supplies standard-module irreducibility; it does not already prove this equality of model multiplicities.

Owner: This roadmap, generic local reduction.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/orthogonal-generic-nonarch`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.2/unitary-generic-nonarch`.

### L4: Tempered period estimates, support and positive factorization

Supply polynomially weighted relative Ξ estimates for the orthogonal, unitary and split GL codimension-one pairs, smooth seminorm bounds for continuity, the spherical integral calculation in both split and inert unramified cases, and the nonarchimedean model nonvanishing and positive rank-one factorization. For real unitary models BP20 Theorem 7.2.1 supplies nonvanishing but not by itself positivity. A factorization used to produce ℓ:π∞→σ∞ must prove that the target is the stated smooth σ, beyond the abstract GNS quotient. Harris Proposition 2.1 and Theorem 2.12 were read; orthogonal and Sakellaridis–Venkatesh original proof decomposition remains an obligation.

Owner: This roadmap, local period analysis.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/local-period-convergence`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/unramified-period`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/local-period-support`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/nonarchimedean-positivity`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/phase-normalized-intertwiner`.

### P1: Pure twisting and refined packet conventions

Complete the pure H¹(F,H) twisting of an inclusion and its orientation-sensitive SO form classification, global coherence obstruction, and any representation-valued even-SO packet labels beyond the supplied outer-orbit correspondence. The unique quasi-split unitary pair must be glued by the actual global form-existence theorem. Import ordinary inner twists and parameter classification from ET.0/ML.4 but do not identify H¹(F,G_ad) with pure H¹(F,G), or a stable transfer with an individual representation. Stronger packet labels are conditional until that refinement is supplied.

Owner: ET.0 and ML.4 extensions; relevant-inclusion specialization here.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.0/relevant-inner-forms`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/local-relevant-packet`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/global-coherent-packet`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/quasi-split-unitary-pair`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/infinitesimal-parameter`.

### P2: Generic discrete residual exclusion

Prove that a noncuspidal representation in the discrete classical automorphic spectrum cannot have a generic discrete Arthur parameter: identify a nontrivial Arthur SL₂ block in every such residual parameter under the applicable inner-form classification. Read the Jiang–Liu §3 proof cited by Jiang–Zhang §6.3 p. 803 and reconcile it with the exact supplier ranges. The target is explicitly present; the citation in Jiang–Zhang alone is not a completed proof audit.

Owner: This roadmap target; residual classification imported from automorphic spectral and ML owners.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/generic-discrete-members-cuspidal`.

### F1: Asai, adjoint and local classical-factor extension

Extend the existing tensor L-function API to the exact Asai and adjoint factors of these unitary parameters: conjugate-self-dual cuspidal Asai dichotomy with total-rank parity, all-place compatibility of the adjoint factors, finite nonzero tempered local central quotient, and completed versus removed-place factorizations. Include the complex distinguished-place gamma formula by restriction of scalars, doubling its Borel dimension and gamma-weight count. A Rankin–Selberg tensor factor alone does not supply these assertions.

Owner: AutomorphicLFunctionsAndLocalFactors AL.3–AL.4 extension.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/hermitian-isobaric-parameter`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/normalized-l-quotient`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/normalized-local-period`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/rankin-selberg-weights`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/conductor-family-size`.

### C1: Restriction decay for global Bessel coefficients

For a smooth automorphic form of uniform moderate growth, its Bessel coefficient has moderate growth on stabilizer Siegel sets; if the first form is cuspidal the coefficient is rapidly decreasing there, with sufficient uniform seminorm bounds to pair against a moderate-growth second factor. Together with rapid decay of a cuspidal second factor and polynomial quotient-volume bounds, prove absolute period convergence when either factor is cuspidal. The source citations in Jiang–Zhang §4.1 p. 766 must be followed through; rapid decay on an ambient group alone is not a proof after restriction.

Owner: AutomorphicFormsOnReductiveGroups restriction-decay extension, specialized here.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-period-convergence`.

### O1: Stable orbit and adjoint-quotient interface

The proposed QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups owns stable coadjoint loci, stable fibres, affine quotient measures and limit orbits. Supply the spectral stability criterion ev(λ)∩ev(μ)=∅, stable-fibre torsor geometry and the specified affine measure on [h∧]∩image(𝒪_stab). General Chevalley/adjoint-quotient, Jordan centralizer and affine GIT results remain with the LieHighestWeight/Reductive Groups extensions; the present roadmap only owns their GGP spectral specialization and the explicit free flag orbit. These proposed owners are not registered dependencies, so this is an exact incoming contract rather than a fabricated node ID.

Owner: QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, importing general Lie and GIT owners.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/eigenvalue-invariant`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/regularity-criterion`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/sphericity`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.5/stability-and-conductor`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/admissible-family`.

### O2: Relative characters and allowable approximation

Supply H_σ as the convergent orthonormal-basis sum of the local four-vector period, with its trace/tensor evaluation, smooth factorization, continuity on unitary induction tori and compact spectral specialization. Supply NV Definition 24.3’s two positive approximation conditions for allowable components, Theorem 24.4’s supercuspidal-type case and Theorem 24.5’s approximation; do not replace allowability by mere compact support. This roadmap imports that definition and never introduces a competing H_σ.

Owner: QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/local-period-support`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/phase-normalized-intertwiner`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/distinguished-spectrum-topology`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/compact-spectral-realization`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/global-branching-coefficient`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/admissible-family`.

### O3: Quantitative limit-state theorem with the orthogonal correction

Supply NV’s local semiclassical positive test operators, relative-character asymptotics, truncated spectral expansion and limit-state equidistribution, with uniform error bounds sufficient for positive approximation and small-window arguments. The weighted equality in SO₃/SO₂ requires Π≄Π⊗(η_{K/F}∘θ), K=F(√(−disc V_H)); the unrestricted weak-subconvex endpoint uses a bounded factor-two estimate in its self-twist case. Reconcile the proof with the existing atlas-confirmed E1 correction before exporting the exact limit theorem. Weyl counting uses compact trace and local approximation, without that extra hypothesis.

Owner: QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/weighted-period-limit`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/family-weyl-law`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/weak-subconvexity`.

### S1: Tempered induction parameters and full-induction distinction

Supply Harish–Chandra tempered induction parameters, unitary unramified-twist compact tori and their finite Weyl/R-group equivalences, fibers inside the normalized tempered packets, and the smooth full-induction model-character formula. Include upper semicontinuity of distinction and good-level finiteness. Irreducible multiplicity one alone does not bound the sum across reducible induction; the exact full-induction statement is required for the injection in NV Lemma 24.1. These are representation-theoretic extensions of SR.2a/SR.3, not a second construction of the GGP distinguished subset.

Owner: SmoothRepresentationsOfLocalGroups Part II extension.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/induction-parameter-injective`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.6/distinguished-spectrum-topology`.

### A1: Tamagawa number two for the anisotropic pairs

Supply τ(U(V))=2 and τ(SO(V))=2 for the nontrivial anisotropic unitary and special orthogonal groups in NV §25.7, including the anisotropic SO₂ torus. Use the actual Tamagawa measures and quotient conventions. The general construction of a Tamagawa measure and compactness of the quotient do not compute its volume. NV points to Weil and Ono; their numerical-volume proof has not been read in this pass.

Owner: AdelicAlgebraicGroups arithmetic-volume extension.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/automorphic-branching-data`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/weighted-period-limit`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/family-weyl-law`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.7/mean-period-theorem`.

### J1: Known unitary global and refined theorem exports

The proposed JacquetRallisRelativeTraceComparison imports this roadmap’s propositions and supplies: stable cuspidal global GGP (BPLZZ Theorem 1.8), unramified choices (Remark 4.17), endoscopic Hermitian global GGP (BCZ Theorem 1.1.5.1), everywhere-tempered refined identity (BCZ Theorem 1.1.6.1), and the precise cuspidal weak-base-change existence ranges of BPLZZ Theorem 4.14(1)–(2). Its smooth transfer, relative trace comparison and spectral isolation proofs stay there. This framework must precede that consumer; its arithmetic application uses the returned theorem. Registration/package scheduling must split the forward framework export from the returned proof import to avoid a coarse roadmap cycle.

Owner: JacquetRallisRelativeTraceComparison, proposed Part II of EndoscopicTransferAndUnitaryTraceComparison.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.1/weak-strong-base-change`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.3/global-packet-proposition`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.4/unitary-refined-proposition`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/definite-diagonal-nonvanishing`.

### U1: Arithmetic unitary models and level maps

The proposed UnitaryRapoportZinkSpacesAndRSZModels owns standard definite unitary Shimura sets, standard indefinite Shimura varieties of dimension N−1, compatible neat level pairs and sh↑, hyperspecial lattices, the strong coefficient-field/Hecke-eigencharacter interface, and the projective graph map over its reflex field. Supply finite double-coset sets and the stabilizer-weight formula, plus the indefinite graph’s dimension. General neat sublevels and canonical datum functoriality come from ShimuraVarieties; cycle/graph carriers come from MotivesAndAlgebraicCycles. A nonabelian definite double-coset set is not supplied by the zero-dimensional torus Shimura theorem alone.

Owner: UnitaryRapoportZinkSpacesAndRSZModels with ShimuraVarieties and MotivesAndAlgebraicCycles.

Needed by: `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/arithmetic-period-data`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/definite-integral-comparison`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/definite-diagonal-nonvanishing`, `GanGrossPrasadConjecturesForClassicalGroups:GGP.8/weak-arithmetic-proposition`.

### Registered stage requests

- `AutomorphicLFunctionsAndLocalFactors:AL.3`: Part II extension requested by F1: the conjugate-self-dual cuspidal Asai pole/regularity dichotomy with total-rank parity, and completed global Asai/adjoint factors. AL.3/rs-global-poles supplies the tensor-factor base; it does not already assert this dichotomy.
- `AutomorphicLFunctionsAndLocalFactors:AL.4`: Part II extension requested by F1: all-place Asai and adjoint parameter compatibility, finite nonzero tempered central quotients, and the complex-place gamma/conductor comparison. Import AL.4/local-parameter-comparison as the existing GL tensor-factor base.
- `AutomorphicFormsOnReductiveGroups:AF.3`: Part II extension requested by C1: uniform restriction estimates for Bessel Fourier coefficients on stabilizer Siegel sets, proving absolute period convergence when either form is cuspidal. The ambient cusp-form-rapid-decay node supplies a base estimate but not this restriction theorem.
- `AdelicAlgebraicGroups:AA.2`: Part II extension requested by A1: the numerical Tamagawa value two for the stated nontrivial anisotropic unitary and special orthogonal groups, including the anisotropic SO₂ torus. AA.2/tamagawa-number defines the volume but does not compute it.
- `SmoothRepresentationsOfLocalGroups:SR.2`: Smooth admissible representations of the local classical groups, restriction to Bessel subgroups, parabolic/unipotent structure, and unnormalized ψ-twisted coinvariants with their quotient universal property; retain the full odd-codimension Bessel setting.
- `SmoothRepresentationsOfLocalGroups:SR.2a`: Normalized parabolic induction, geometric lemma and second adjointness for the precise model-preserving standard-module reduction; tempered full-induction fibers and unramified-twist continuity require the extra S1 contract.
- `SmoothRepresentationsOfLocalGroups:SR.3`: Tempered matrix-coefficient estimates and the Bernstein-center map for the distinguished locus; extend by the exact compact-torus/R-group and full-induction statement S1, beyond basic admissibility or a single irreducible Hom bound.
- `SmoothRepresentationsOfLocalGroups:SR.3a`: Uniform admissibility/good compact-open finiteness sufficient to make Ω_π^J a finite union of unitary induction components; name the hypotheses on J explicitly.
- `EndoscopicTransferAndUnitaryTraceComparison:ET.0`: Nonabelian cohomology and descent for pure H¹(F,H) twists of an inclusion, separate from ordinary adjoint inner twists; P1 records the extra orientation and coherence data.
- `EndoscopicTransferAndUnitaryTraceComparison:ET.1`: Normalized local transfer and matching nilpotent germs used in tempered packet cancellation, with Whittaker normalizations compatible with ML.4. The relative multiplicity formula itself is L2, not a consequence of ordinary transfer.
- `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`: Use existing U, SO and split GL standard representations and form-preserving embeddings; import their carriers rather than restating the classical-group development.
- `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`: Use the existing compact isotypic decomposition to select finitely many smooth H-types and their projections; only the relative-character weight realization is new here.

### Proposed extensions of existing directions

These proposals implement the Part II rule; they do not change another job’s files or claim that its current nodes already supply the extra results.

The existing tensor-factor and local-parameter nodes do not include the Asai/adjoint extensions F1 needed here. Add an extension titled Automorphic L-functions and local factors, Part II: Asai and adjoint factors, with AutomorphicLFunctionsAndLocalFactors as its first prerequisite. It starts from AL.3 tensor factors and AL.4 compatibility, and supplies exactly F1; GGP imports the output and does not develop general factor theory.

Ambient cusp decay does not itself provide the restriction estimates C1. Add Automorphic forms on reductive groups, Part II: Relative restriction estimates, with AutomorphicFormsOnReductiveGroups as its first prerequisite. It extends AF.3 by the stabilizer-Siegel-set bounds of C1; the Bessel model and period definitions remain GGP.0 and GGP.3.

The existing Tamagawa number definition and finiteness theorem do not compute the arithmetic volume A1. Add Adelic algebraic groups, Part II: Classical Tamagawa numbers, with AdelicAlgebraicGroups as its first prerequisite. It starts after the existing measure, quotient and finiteness API and supplies the numerical theorem A1, without redefining the measure.

## Source corrections used

These are existing atlas findings carried into the statements. Each is paraphrased, with no copied source passage; none is a new independent erratum verdict.

- **E1**, NV21, published Lemma 27.3 proof p. 182; consequences in Corollary 31.8 and Theorem 31.11 pp. 202–204. Impose Π≄Π⊗(η_{K/F}∘θ) for the weighted equality in SO₃/SO₂, K=F(√(−disc V_H)); use the factor-two upper bound for unrestricted weak subconvexity. The higher-rank global repair is distinct from the false local real-definite surjectivity claim. Existing record: PAPER-NELSON-VENKATESH-21/E1; confirmed by REV-RT-PAPER-NELSON-VENKATESH-21 and its fixes ledger.

- **E2**, JZ20, published §3.2 p. 762, partition immediately before (3.5). Use [(2ℓ+1),1^(dim V−2ℓ−1)]. Existing record: PAPER-JIANG-ZHANG-20/E1; existing reviewed extraction.

- **E3**, JZ20, published §2.1 p. 750, final paragraph. A pure inner twist of G* is indexed by H¹(F,G*); relevant simultaneous twists use H¹(F,H*) and its image for the inclusion. Existing record: PAPER-JIANG-ZHANG-20/E10; existing reviewed extraction.

- **E4**, BPLZZ21, arXiv v3 Remark 1.7 p. 4 and Theorem 4.14(4) p. 39. Retain cuspidal automorphy, as required by Theorem 4.14(1)–(2) and the proof of (4). Do not assert existence or strong compatibility for arbitrary admissible adelic representations. Existing record: PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/E11 and /E45; existing independent review.

- **E5**, NV21, published §20 p. 142, nonvanishing citation. Use Waldspurger, Astérisque 346 (2012), Proposition 5.7, as confirmed also by BP20 Theorem 7.2.1 discussion p. 163. Existing record: PAPER-NELSON-VENKATESH-21/E7; existing reviewed extraction.

- **E6**, LTX22, published Conjecture 8.3.1 p. 315. Omit the unused λ quantifier in the coefficient-field Chow proposition. Keep the separately stated Abel–Jacobi nonvanishing condition separate. Existing record: PAPER-LIU-ETAL-22/E108; existing independently reviewed errata.

## Baseline and ownership audit

Current TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27 and current TauCeti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 audited read-only; ClassicalGroups and CompactGroups read in full, relevant OrthogonalSpinGroups, SmoothRepresentations and ReductiveGroups Part II interfaces inspected. Nine newer roadmaps checked for overlap. Pinned declaration statements were checked separately.

The pinned baseline contains algebraic representations, their native intertwiners and dual, finite sums, and Tau Ceti’s determinant-one orthogonal subgroup. It does not thereby contain Bessel models, automorphic packets or the analytic period theorems. The suggested Lean file uses only the existing algebraic carriers for a light equivariance predicate and a finite graph sum. Topological representations, packets, local fields with their classifications and Shimura objects remain full targets in this reader. No proxy carrier or empty proposition stands for them.

Current upstream classical-group and compact-group roadmaps supply the standard representations, compact branching and Peter–Weyl decomposition. OrthogonalSpinGroups supplies its existing quadratic-group material. No such theory is planned a second time. Tau Ceti’s nine post-snapshot roadmap additions were checked against these targets.

## Sources and versions read

Locators refer to printed pages unless the entry explicitly says arXiv or author PDF. The recorded sections are the actual reading scope, not a claim that every cited monograph or every proof was read in full. Source files and passages from the cleared library are not reproduced.

<a id="ggp12"></a>
### ggp12

Wee Teck Gan, Benedict H. Gross, Dipendra Prasad, [Symplectic local root numbers, central critical L-values, and restriction problems in the representation theory of classical groups](https://numdam.org/item/AST_2012__346__1_0.pdf). Astérisque 346 (2012), 1–109; published Numdam copy.

Read on 2026-10-19: §2 pp. 5–7; §12 pp. 43–45; §§14–15 pp. 55–62; Selected packet statements in §17 pp. 65–69; §§23–24 pp. 83–88; selected §§25–26 pp. 91–100.

SHA-256: `bbabe7bf4a53eacc9123d63751e211dab6f000e7bed1009096ea4b2132beb022`.

<a id="jz20"></a>
### jz20

Dihua Jiang, Lei Zhang, [Arthur parameters and cuspidal automorphic modules of classical groups](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p02-s.pdf). Annals of Mathematics 191 (2020), 739–827; published copy.

Read on 2026-10-19: Selected §§2–3 pp. 748–763, including the full model and local conjecture statements; §4.1 pp. 765–766; selected §§5–6 pp. 780–805, including §6.3 pp. 803–805.

SHA-256: `c016d9729f7f0cdca451e14a62015bd85cde861a9e07d3135e8feff071d0b15f`.

<a id="bplzz21"></a>
### bplzz21

Raphaël Beuzart-Plessis, Yifeng Liu, Wei Zhang, Xinwen Zhu, [Isolation of cuspidal spectrum, with application to the Gan–Gross–Prasad conjecture](https://arxiv.org/pdf/1912.07169v3). arXiv:1912.07169v3 (2021), 48 pages; locators refer to this version, not journal pagination.

Read on 2026-10-19: Definitions 1.5–1.6 and Remark 1.7 pp. 3–4; Theorems 1.8–1.10 pp. 4–5; Lemma 4.9 and its proof pp. 35–36; Theorem 4.14 pp. 39–40; selected §4.4 pp. 41–43, including Remark 4.17 p. 42.

SHA-256: `f2834146d4fee02b38c4849ee9a7ef76a3dbc1131e7eef799e6f95b0f0d0ac13`.

<a id="bcz22"></a>
### bcz22

Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf). Publications Mathématiques de l’IHÉS 135 (2022), 183–336; published copy.

Read on 2026-10-19: §§1.1.2–1.1.6 pp. 184–188; §10.3.5 p. 325.

SHA-256: `a07a6143d3e71f1eca31b6ba9b774bec325a7de07c7417b7796486a77df13794`.

<a id="nv21"></a>
### nv21

Paul D. Nelson, Akshay Venkatesh, [The orbit method and analysis of automorphic forms](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf). Acta Mathematica 226 (2021), 1–209; published copy.

Read on 2026-10-19: §13 pp. 91–95; Theorem 14.2 and Definition 14.3 p. 97; §15 pp. 103–107; §18 pp. 121–122; §§20–21 selected pp. 142–146; §24.1–24.3 pp. 157–160; §25 pp. 167–172; Lemma 27.3 original proof p. 182; selected §30 and §31 pp. 199–204; existing atlas verification of E1 also consulted.

SHA-256: `85e14654d2b367f4b0d4a21c9555576f6def6649c8b6707afc78e1dfbdaea76e`.

<a id="bp20"></a>
### bp20

Raphaël Beuzart-Plessis, [A local trace formula for the Gan–Gross–Prasad conjecture for unitary groups: the Archimedean case](https://smf.emath.fr/system/files/filepdf/smf_ast_418.pdf). Astérisque 418 (2020); published SMF copy.

Read on 2026-10-19: Introduction pp. 1–8; Proposition 6.4.1 and proof pp. 134–136; §7.2 pp. 162–164; Theorems 11.4.1–11.4.3 pp. 247–248; §12.4 and Proposition 12.5.1 pp. 264–265. The full trace-formula proof was not read end to end; L2 records its decomposition obligation..

SHA-256: `43573980c2f76b3289158a62fe2c90b90ee5c9bba85aa6f976a2e291667f37c4`.

<a id="gi16"></a>
### gi16

Wee Teck Gan, Atsushi Ichino, [The Gross–Prasad conjecture and local theta correspondence](https://arxiv.org/pdf/1409.6824). arXiv:1409.6824, served v2 (header 17 July 2015; text dated 8 October 2018); published Inventiones 206 (2016).

Read on 2026-10-19: Introduction; §9.3, Propositions 9.3–9.4 pp. 50–52. The full induction-reduction proof is the explicit L3 obligation..

SHA-256: `4aaf7bd6281dd8726cdfca2de32b6f515924a8277865684fc9e011770ec0be5e`.

<a id="mw-generic"></a>
### mw-generic

Colette Mœglin, Jean-Loup Waldspurger, [La conjecture locale de Gross–Prasad pour les groupes spéciaux orthogonaux: le cas général](https://webusers.imj-prg.fr/~jean-loup.waldspurger/GPIII-01022010.pdf). Author PDF GPIII-01022010, 1 February 2010, 43 pages; published Astérisque 347 (2012).

Read on 2026-10-19: Introduction theorem and classification qualifications pp. 1–4; proposition of §1.3 p. 6; §3 pp. 39–41. These statements and the §3 reduction were read; the complete §1 induction proof remains in L3, and the tempered analytic input in L2..

SHA-256: `d1db7bd4d86714fb239ba68499401f36614854ea61c17143c9b1bd8b13470a8a`.

<a id="luo20"></a>
### luo20

Zhilin Luo, [A local trace formula for the local Gan–Gross–Prasad conjecture for special orthogonal groups](https://arxiv.org/pdf/2009.13947). arXiv:2009.13947, 99-page version read.

Read on 2026-10-19: Introduction pp. 2–5; Theorem 8.3.2 p. 62. The local trace-formula proof is not claimed as fully read; L2 records the analytic closure..

SHA-256: `2823cf8569d96808c419277ef641cdaff2a9c0764fbefc861f08617a9407877d`.

<a id="harris14"></a>
### harris14

R. Neal Harris, [The refined Gross–Prasad conjecture for unitary groups](https://arxiv.org/pdf/1201.0518). arXiv:1201.0518v2, 56 pages; locators and conjecture numbering refer to this copy.

Read on 2026-10-19: Introduction and Conjecture 1.3 pp. 2–4; Proposition 2.1 and proof pp. 5–7; Theorem 2.12 pp. 22–23.

SHA-256: `49e9d1de592aa24a425d1d0659e2389186cc2bb07ae54031b8c39b5ae1226b39`.

<a id="ltx22"></a>
### ltx22

Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Inventiones Mathematicae 228 (2022), 107–375; maintainer-cleared published copy read in place.

Read on 2026-10-19: Definition 1.1.3 and Remark 1.1.4 p. 110; forms p. 140; Definitions 3.1.11 and 3.2.1 pp. 143–144; coefficient data p. 145; §7.1 setup p. 286; Lemma 8.2.1 and proof p. 308; Conjecture 8.3.1 and the separate Abel–Jacobi condition p. 315.

SHA-256: `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97`.

## Routed target ledger

All 44 items in the five coalesced briefs have target-level coverage. An imported isobaric sum is a prerequisite of the Hermitian specialization, rather than a second isobaric-sum development. Known theorem proofs keep the supplier ownership described above.

| Routed item | Targets |
| --- | --- |
| `PAPER-JIANG-ZHANG-20/relevant-pairs` | `GGP.0/relevant-pair`, `GGP.0/relevant-inner-forms` |
| `PAPER-JIANG-ZHANG-20/vogan-packets` | `GGP.1/local-relevant-packet`, `GGP.1/global-coherent-packet` |
| `PAPER-JIANG-ZHANG-20/local-bessel-functionals` | `GGP.0/bessel-datum`, `GGP.0/bessel-functional`, `GGP.0/twisted-jacquet-comparison` |
| `PAPER-JIANG-ZHANG-20/bessel-uniqueness` | `GGP.0/bessel-uniqueness` |
| `PAPER-JIANG-ZHANG-20/local-ggp` | `GGP.2/local-ggp-proposition` |
| `PAPER-JIANG-ZHANG-20/local-ggp-known` | `GGP.2/unitary-tempered`, `GGP.2/orthogonal-generic-nonarch`, `GGP.2/orthogonal-tempered-arch`, `GGP.2/unitary-generic-nonarch` |
| `PAPER-JIANG-ZHANG-20/bessel-periods` | `GGP.3/bessel-fourier-coefficient`, `GGP.3/global-bessel-period`, `GGP.3/global-period-convergence` |
| `PAPER-JIANG-ZHANG-20/global-ggp` | `GGP.3/global-fixed-proposition`, `GGP.3/global-packet-proposition` |
| `PAPER-JIANG-ZHANG-20/rev-automorphic-members-of-generic-global` | `GGP.1/generic-discrete-members-cuspidal` |
| `PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/3` | `GGP.1/hermitian-isobaric-parameter` |
| `PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/4` | `GGP.1/weak-base-change`, `GGP.1/weak-base-change-unique`, `GGP.1/weak-strong-base-change` |
| `PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/8` | `GGP.4/unitary-refined-proposition` |
| `PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/9` | `GGP.2/unitary-tempered`, `GGP.2/distinguished-transfer-injective` |
| `PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/isobaric-automorphic-representation` | `GGP.1/hermitian-isobaric-parameter` |
| `PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/pure-inner-forms-of-unitary-groups` | `GGP.0/relevant-inner-forms` |
| `PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/unique-quasi-split-pair-V-star` | `GGP.1/quasi-split-unitary-pair` |
| `PAPER-LIU-ETAL-22/lemma-8-2-1` | `GGP.8/definite-diagonal-nonvanishing` |
| `PAPER-LIU-ETAL-22/conjecture-8-3-1` | `GGP.8/weak-arithmetic-proposition` |
| `PAPER-LIU-ETAL-22/cited-BPLZZ-ggp` | `GGP.3/global-packet-proposition`, `GGP.8/definite-diagonal-nonvanishing` |
| `PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/1` | `GGP.0/relevant-pair`, `GGP.0/relevant-inner-forms` |
| `PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/2` | `GGP.1/hermitian-isobaric-parameter`, `GGP.1/ii-component-group` |
| `PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/3` | `GGP.1/weak-base-change`, `GGP.1/weak-strong-base-change` |
| `PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/4` | `GGP.4/normalized-l-quotient`, `GGP.4/normalized-local-period`, `GGP.4/unramified-period` |
| `PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/104` | `GGP.2/unitary-tempered`, `GGP.2/distinguished-transfer-injective` |
| `PAPER-NELSON-VENKATESH-21/42` | `GGP.0/relevant-pair` |
| `PAPER-NELSON-VENKATESH-21/43` | `GGP.5/eigenvalue-invariant` |
| `PAPER-NELSON-VENKATESH-21/44` | `GGP.5/isotropic-eigenvectors`, `GGP.5/regularity-criterion` |
| `PAPER-NELSON-VENKATESH-21/45` | `GGP.5/sphericity` |
| `PAPER-NELSON-VENKATESH-21/49` | `GGP.5/infinitesimal-parameter` |
| `PAPER-NELSON-VENKATESH-21/50` | `GGP.5/rankin-selberg-weights` |
| `PAPER-NELSON-VENKATESH-21/51` | `GGP.5/stability-and-conductor` |
| `PAPER-NELSON-VENKATESH-21/60` | `GGP.6/nonarchimedean-positivity` |
| `PAPER-NELSON-VENKATESH-21/66` | `GGP.6/distinguished-tempered-dual`, `GGP.6/phase-normalized-intertwiner`, `GGP.6/compact-spectral-realization` |
| `PAPER-NELSON-VENKATESH-21/74` | `GGP.6/induction-parameter-injective`, `GGP.6/distinguished-spectrum-topology` |
| `PAPER-NELSON-VENKATESH-21/79` | `GGP.7/automorphic-branching-data` |
| `PAPER-NELSON-VENKATESH-21/80` | `GGP.7/global-branching-coefficient` |
| `PAPER-NELSON-VENKATESH-21/81` | `GGP.7/removed-place-refined-proposition` |
| `PAPER-NELSON-VENKATESH-21/95` | `GGP.7/admissible-family`, `GGP.7/weighted-period-limit` |
| `PAPER-NELSON-VENKATESH-21/96` | `GGP.7/family-weyl-law` |
| `PAPER-NELSON-VENKATESH-21/97` | `GGP.7/conductor-family-size` |
| `PAPER-NELSON-VENKATESH-21/98` | `GGP.7/mean-period-theorem` |
| `PAPER-NELSON-VENKATESH-21/99` | `GGP.7/weak-subconvexity` |
| `PAPER-NELSON-VENKATESH-21/101` | `GGP.4/local-raw-period`, `GGP.4/local-period-convergence` |
| `PAPER-NELSON-VENKATESH-21/104` | `GGP.0/bessel-uniqueness` |
