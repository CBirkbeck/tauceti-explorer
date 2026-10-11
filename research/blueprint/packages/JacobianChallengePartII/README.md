# Roadmap: the Jacobian challenge, Part II — relative Jacobians, theta bundles and universal differences

The first Jacobian challenge constructs the Jacobian of a pointed smooth curve over a field and its Abel–Jacobi universal property. This roadmap extends that construction to families without a chosen point. It develops the degree torsors of the relative Picard scheme, their section-free Abel map, the canonical principal polarization of the relative Jacobian, and the normalized line bundles used in arithmetic applications. Its geometric outputs are the curve difference morphism, the Faltings–Zhang morphisms on fibre powers, their shifted versions, and the comparison between the Hodge bundles of a stable curve and its generalized Jacobian.

## Scope and ownership

The distinction between a Jacobian and its degree-one torsor is essential. A family can have a Jacobian with an identity section while the curve and its degree-one Picard torsor have no section. The curve then maps canonically to that torsor. Subtracting two such images gives a map to the Jacobian without choosing an origin on the curve. A degree-one line bundle supplies a translation to the Jacobian when one is specified; it is additional input rather than part of the curve-family data.

The arithmetic motivations are Yuan's algebraic theta constructions and shifted-family morphisms, and the universal differences used by Dimitrov–Gao–Habegger. The roadmap states the underlying algebraic results. Adelic metrics, admissible pairings, arithmetic intersection theory, height inequalities and nondegeneracy belong to their respective arithmetic roadmaps. A variation hypothesis is needed by some of those applications, but not by the algebraic difference morphism itself.

Suggested library home: `TauCeti/AlgebraicGeometry/Jacobian/Relative/`. General tensor, dual, determinant, descent, Picard and abelian-scheme infrastructure uses its existing library namespaces. In particular, the name refers to Jacobian varieties and schemes; the Jacobian coordinate chart of a Weierstrass equation is a different object.

The [algebraic vector bundles roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicVectorBundles) owns general sheaf tensor/dual/determinant operations. The [stable reduction roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction) owns the nodal dualizing and coherent-curve theory. Neither is reconstructed in the Hodge comparison. The fine-level moduli supplier already consumes the generic Jacobian construction; therefore its use here is confined to Layer 7 and cannot enter Layers 0–5.

## Conventions

For Layers 0–5, except where a target explicitly gives different hypotheses, let S be a noetherian scheme and let π:X→S be smooth and projective of relative dimension one, with geometrically connected fibres of constant genus g>0. The construction works componentwise when S is disconnected. No section of π is assumed. Base-change comparisons are required for every T→S, including nonreduced T. A pullback of a family defined over a noetherian base retains the constructed objects and their comparison maps even when T is not noetherian; this assertion does not replace a new representability proof for every arbitrary-base family.

For a scheme Y, Pic(Y) means actual isomorphism classes of invertible O_Y-modules with tensor product as group law. For a family Y→S, Pic_{Y/S} means the fppf sheafification of the presheaf T↦Pic(Y_T)/Pic(T). An element of the sheaf need not have an actual global line-bundle representative. A trivial class means that a trivialization exists; a rigidified bundle additionally carries specified trivializations and their compatibility. These three levels of information remain distinct in every comparison.

The fibre degree is deg(L)=χ(L)−χ(O), equal to the residue-field-weighted divisor degree. Degree on a disconnected test scheme is locally constant, rather than a single integer. Picᵈ denotes the fixed-degree subfunctor, and J=Pic⁰_{X/S}. Addition in J is tensor product, negation is dualization, and the difference of two elements L,M of the same degree torsor is M−L. Thus j(x,y)=[y]−[x]. In point formulas [x] denotes the relative divisor class of the graph of x, with its test base understood.

The dual abelian scheme J∨ carries an evaluation-normalized universal bundle U on J×_S J∨: its restriction over b∈J∨ represents b. Fix φ_L(a)=t_a*L⊗L⁻¹ and the positive principal polarization λ_X. The self-Poincaré bundle used here is P=(id,−λ_X)*U. Its addition formula has class −m*L+p₁*L+p₂*L on a field fibre. The canonical positive twice-theta bundle is Θ=Δ_J*(P∨). Every rigidified comparison includes the origin-fibre normalization; a Picard-class equality over a field alone supplies no preferred scalar isomorphism.

In Layer 3's field identities, K is any field, C/K is smooth projective geometrically connected of genus g>0, and α is a divisor of degree one. It need not be effective and need not be a rational point. The associated theta divisor is not assumed symmetric. In particular no hypothesis (2g−2)α=ω_C is inserted into the curve-square identity. The degree-d Abel map exists for every integer d; its finiteness theorem assumes d≠0. Multiplication remains finite when the characteristic divides d and need not be étale.

Layer 4 also uses actual Picard subgroups. Pic⁰(Y/S) consists of actual classes algebraically trivial on every geometric fibre. On a product, Pic⁰⁰ requires that condition along both projections. Pic⁻ is instead the intersection of the kernels of the two restrictions to specified pointed axes. Classes pulled from the base remain in the actual groups. The obstruction groups are H²_fppf(−,G_m); an identification with Azumaya Brauer groups is not part of the comparison.

Layer 6 changes the curve hypotheses: S is integral and noetherian, and X/S is a proper flat finitely presented stable connected nodal curve of constant arithmetic genus g>1. Its generalized Jacobian is a smooth separated semi-abelian group, which can fail to be proper. Layer 7 uses g≥2 and a full symplectic level ℓ≥3 invertible on the base. Fix the pairing component over Z[1/ℓ,ζ_ℓ]. It treats arbitrary pullbacks of the smooth universal curve in that component, rather than full-level structures on nodal curves.

## Exact supplier contracts

The [Jacobian challenge](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/JacobianChallenge) is the first prerequisite. Its Layers A–F provide, respectively, actual line bundles/divisors/degree; field curve cohomology and duality; relative cohomology, Cartier divisors and symmetric powers; the field Picard scheme; abelian varieties and classical theta; and the pointed Abel–Jacobi map and its universal property. This roadmap consumes those field and pointed results and specifies the family and torsor extensions beyond them.

The following supplier contracts determine the remaining boundaries. They are mathematical inputs; citing a supplier does not identify a specification with a library implementation.

| Supplier layer | Contract consumed here |
| --- | --- |
| AlgebraicModuliForArithmeticGeometry:A0-extension | The fppf relative Picard sheaf, its restriction under arbitrary base change, its actual-to-relative class map, its base-class kernel, and splitting when a section exists. |
| AlgebraicModuliForArithmeticGeometry:R09.2 | Relative Hilbert/Div representability and the projective curve Picard quotient construction. Flatness of the universal family alone does not imply flatness of its parameter scheme. |
| AlgebraicModuliForArithmeticGeometry:R09.3 | Effective fppf descent of represented Picard objects, invertible sheaves, closed immersions and finite morphisms, with descent of classes distinguished from descent of bundles. |
| AbelianSchemesAndArithmeticModuli:A1 | Abelian schemes, products, translation, all-test-scheme rigidity, the square/cube theorems and homomorphism descent. Field abelian varieties alone do not supply this arbitrary-base contract. |
| AbelianSchemesAndArithmeticModuli:A2 | Dual abelian schemes, normalized universal Poincaré bundle, biduality, polarization conventions, translation invariance on Pic⁰ and normalized seesaw. |
| AbelianSchemesAndArithmeticModuli:A3 | Scheme-theoretic torsion, Weil pairing and finite locally free multiplication by every nonzero integer; étaleness is restricted to integers invertible on the base. |
| NeronModelsAndSemistableAbelianVarieties:R11.4 | The smooth separated semi-abelian Picard identity component for a stable nodal curve, with invariant-differential and Lie interfaces. |
| StableReduction, Layer 2 | Nodal Gorenstein duality, rank-g cohomology, their canonical base-change maps and the proper-family geometric-fibre criterion for relative ampleness. |
| StableReductionPartII:MC.4 | The full-level datum and the smooth quasi-projective fine curve scheme with its smooth projective universal curve, in the specified cyclotomic pairing component. Used only by Layer 7. |
| AlgebraicVectorBundles:L0B–L0C | Finite locally free duals and determinants with coherent pullback comparisons, applied to Layer 6's rank-g sheaves. |

### Existing library vocabulary

The names in this document are relative to the Lean namespace
`TauCetiRoadmap.JacobianChallengePartII`. For example,
`RelativeJacobian.UniversalShift` in the suggested file has that namespace as
its prefix. The file states the available group-scheme companions; the
relative Picard identifications still require the supplier contracts above.

Use Mathlib's schemes, slice category Over(S), native morphism properties and fppf topology. Tau Ceti's `InvertibleSheaf`, `InvertibleSheaf.tensorProduct`, `SchemeWeilDivisor.relativeDegree`, `Scheme.Modules.Cohomology` and field `AbelianVariety` supply the initial objects. Abstract module-sheaf cohomology supplies neither proper pushforward nor relative duality. Mathlib's `CommRing.Pic` concerns invertible modules over a ring and does not supply a relative Picard scheme.

Tau Ceti's [`LineBundle.Class`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/LineBundle/Class.lean) supplies the actual class group `LineBundleClass`, with tensor multiplication and dual inversion. Use `LineBundleClass.mk_eq_mk_iff`, `mk_surjective`, `mk_tensorProduct`, `inv_mk` and `mk_eq_one_iff` for representatives, tensor, duals and the trivial class. These operations are imported; the relative fppf comparison and geometric-fibre algebraic-equivalence subgroups are the additional constructions here. The section-dependent [`rigidifiedPicardFunctor`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean#L66) supplies pullback of rigidified classes after choosing a section. The section-free sheafification, torsors and relative representability in Layers 0–2 need the separate supplier contracts above.

The coordinate constructions in Layer 5 use native morphisms in Over(S). Mathlib's `CategoryTheory.Hom.group`, `CategoryTheory.MonObj.comp_mul`, `CategoryTheory.GrpObj.comp_div` and `CategoryTheory.GrpObj.comp_zpow` give the group law and its compatibility with precomposition. The finite products `piObj`, `Pi.π` and `Pi.lift` express actual fibre powers. Arbitrary base change uses the comparison isomorphisms `PreservesLimitPair.iso` and `PreservesProduct.iso`, with the pulled-back group object supplied by `Functor.grpObjObj`. Their represented points include infinitesimal test schemes.

## How to read the build

Layers 0 and 1 construct the degree components, their torsor action, the relative Jacobian and its principal polarization. Layer 2 builds Abel maps without choosing a section and recovers curve differences by subtraction in a degree torsor. Layer 3 fixes the Poincaré sign and constructs the canonical twice-theta bundle; Layer 4 compares actual Picard classes with relative sections and with the pointed axis-normalized subgroups. Layer 5 assembles fibre powers and shifted differences, then factors the shifted canonical power through triangular coordinates and a tail isogeny. Layer 6 compares the Hodge bundles of stable curves and generalized Jacobians. Layer 7 applies the earlier construction to the fine-level universal curve. Each equality of morphisms is natural on every test scheme, including nonreduced schemes; geometric-point checks alone do not establish it. Names are relative to `TauCetiRoadmap.JacobianChallengePartII`.

## Layer 0: Relative Picard degree components and torsors

Begin with the relative Picard sheaf supplied by A0-extension. The degree condition descends from actual line bundles and is local for the fppf topology. Prove local constancy before cutting out degree components. Representability then transports the tensor group law to schemes; the degree-d pieces are torsors under the degree-zero piece, without a chosen S-point.

The representability argument uses the Hilbert/relative-divisor and quotient machinery of R09.2 and effective descent in R09.3. In the curve case it also uses H²=0 and the identity-component degree criterion. These inputs supply the mathematical reason for smoothness and component identification; a generic representability label alone supplies neither. For locally varying degree on a disconnected test scheme, identify the relative Picard sheaf with the coproduct sheaf of the fixed-degree pieces: its sections may land in different pieces on different open-and-closed components.

### 0.1 Local constancy of relative degree

For an invertible L on X_T, the function t↦deg(L_t)=χ(L_t)−χ(O_{X_t}) is locally constant on T and unchanged after any base extension of residue fields. (Bosch–Lütkebohmert–Raynaud, §9.3 Theorem 1 proof p. 252, invoking §9.1/2.)

Apply constancy of Euler characteristics to the proper flat finitely presented family and its invertible sheaf. Subtract the structure-sheaf Euler characteristic and apply the parent divisor-degree comparison on fibres.

*Needs:* JacobianChallenge, Layer A; JacobianChallenge, Layer B; JacobianChallenge, Layer C.

### 0.2 Relative degree components

For every d∈ℤ, Picᵈ_{X/S} is the sub-fppf-sheaf of the imported Pic_{X/S} whose geometric-fibre classes have degree d. A locally varying integer degree gives the disjoint union of these constant-degree pieces, not a single globally constant integer on disconnected T. (Bosch–Lütkebohmert–Raynaud, §9.3 Theorem 1 and proof p. 252; [Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 p. 24.)

Use the parent degree on each geometric fibre. Use cohomology and base change to make degree locally constant. Fppf descent of this condition gives the sub-sheaf; do not replace sheafification by actual global representatives.

`RelativeJacobian.RelativeDegreeComponents` exposes membership, tensor degree, inverse degree and restriction to a new base. These properties locate the later Abel classes in the correct component:

- `RelativeJacobian.RelativeDegreeComponents.mem`: A class lies in Picᵈ(T) iff its degree is d on every geometric fibre.
- `RelativeJacobian.RelativeDegreeComponents.tensor`: Tensor product sends Picᵈ×Picᵉ to Picᵈ⁺ᵉ.
- `RelativeJacobian.RelativeDegreeComponents.baseChange`: Picᵈ_{X/S} restricted to Sch/T identifies with Picᵈ_{X_T/T}.
- `RelativeJacobian.RelativeDegreeComponents.inverse`: Inversion of line classes sends Picᵈ to Pic⁻ᵈ and carries the structure-sheaf class to itself.

**Checks.**

- `RelativeJacobian.RelativeDegreeComponents.test_elliptic` (computation): For an elliptic curve E/k, O_E(e) lies in Pic¹ and O_E lies in Pic⁰.
- `RelativeJacobian.RelativeDegreeComponents.test_disconnected` (non-example): On a disconnected T, a bundle of degrees 0 and 1 belongs to the whole Picard sheaf but neither constant-degree piece.
- `RelativeJacobian.RelativeDegreeComponents.test_field` (compatibility): Over Spec k the component is the parent degree-d Picard scheme, and is not the degree-d divisor set.

*Needs:* AlgebraicModuliForArithmeticGeometry:A0-extension (relative-picard-sheaf); JacobianChallenge, Layer A; JacobianChallenge, Layer C; §0.1.

### 0.3 Relative curve Picard scheme

Pic_{X/S} is represented by a smooth separated S-group scheme, with open-and-closed quasi-projective pieces Picᵈ_{X/S} for d∈ℤ. Its degree-zero piece is the identity component. Representability commutes with arbitrary change of base. (Bosch–Lütkebohmert–Raynaud, §9.3 Theorem 1 and proof p. 252.)

Apply the relative-curve representability theorem to projective flat finitely presented X/S with geometrically reduced irreducible fibres. Use vanishing of H² on curves for smoothness. Use local constancy of degree and the fibre identity-component criterion. Transfer the group law and base change through Yoneda; smoothness of the Hilbert parameter scheme is not inferred from flatness of its universal family.

*Needs:* §0.2; JacobianChallenge, Layer C; AlgebraicModuliForArithmeticGeometry:R09.2; AlgebraicModuliForArithmeticGeometry:R09.3.

### 0.4 Picard degree torsors

Tensoring by degree-zero classes makes Picᵈ_{X/S} an fppf torsor under Pic⁰_{X/S}; Picᵈ need not have an S-point. Its difference morphism Picᵈ×_S Picᵈ→Pic⁰ sends (L,M) to M⊗L⁻¹. (Bosch–Lütkebohmert–Raynaud, §9.3 Theorem 1 and proof p. 252.)

Obtain local sections after an fppf cover of S using relative degree-d divisors (negative d uses inverses). Translate Pic⁰ to Picᵈ using that section. Descend the torsor action and difference, defined intrinsically by tensor product.

`RelativeJacobian.PicardTorsors` exposes the action and the intrinsic difference. A change of origin becomes a translation comparison:

- `RelativeJacobian.PicardTorsors.action`: J×Picᵈ→Picᵈ is tensor product.
- `RelativeJacobian.PicardTorsors.difference`: δ(L,M)=M⊗L⁻¹ belongs to J and is independent of local origins.
- `RelativeJacobian.PicardTorsors.translation`: A chosen β∈Picᵈ(T) identifies Picᵈ_T with J_T by L↦L⊗β⁻¹.
- `RelativeJacobian.PicardTorsors.action_difference`: For L,M∈Picᵈ(T), δ(L,M)⊗L=M; tensor action has identity and associativity, and δ(L,L)=0.

**Checks.**

- `RelativeJacobian.PicardTorsors.test_zero` (degenerate): Pic⁰ is the trivial J-torsor with the structure-sheaf origin.
- `RelativeJacobian.PicardTorsors.test_genusOne` (non-example): A genus-one curve of period>1 has no k-point of Pic¹; a global origin cannot be inserted in the torsor definition.
- `RelativeJacobian.PicardTorsors.test_swap` (computation): δ(M,L)=−δ(L,M), whereas δ(L,L)=0.

*Needs:* §0.3.

### Examples

For an elliptic curve E/k, O_E(e) has degree one and O_E has degree zero. Over a disconnected test scheme, a line bundle with these two degrees has a relative Picard class but lies in neither fixed-degree subfunctor. A genus-one curve of period greater than one gives a nontrivial Pic¹ torsor: its difference map exists even though no rational origin does. The checks in §0.2 and §0.4 detect each of these distinctions.

### Dependencies

JacobianChallenge Layers A–C supply actual degrees, Euler characteristics and relative curve divisors/cohomology. AlgebraicModuliForArithmeticGeometry A0-extension supplies the relative Picard sheaf, R09.2 its Hilbert/divisor representability inputs, and R09.3 effective descent. Degree constancy precedes degree components; those components precede representability and torsors.

## Layer 1: Relative Jacobians and principal polarization

Properness is established before calling the degree-zero Picard scheme an abelian scheme. Its tensor law is already commutative. The tangent/cohomology comparison on geometric curve fibres gives relative dimension g; the abelian-scheme and descent infrastructure belongs to A1. Restriction of the Picard sheaf under base change identifies these objects even on nilpotent test bases.

The principal polarization is obtained after an fppf cover on which a degree-one bundle is available. Translation independence gives the overlap comparison and the descent cocycle. The descended polarization is canonical although the local theta bundle used to construct it is not. The general dual abelian scheme and polarization API is supplied by A2.

### 1.1 Properness of the relative Jacobian

For smooth projective geometrically connected X/S, Pic⁰_{X/S}→S is proper. Consequently it is projective locally over S and the canonical relatively ample twice-theta bundle of Layer 3 will make it projective over S. (Bosch–Lütkebohmert–Raynaud, §9.4 Proposition 4 and proof p. 260, invoking §8.4/3.)

Apply the smooth-curve identity-component properness criterion, including its valuative separatedness argument. Do not infer properness from algebraic-space representability.

*Needs:* §0.3; JacobianChallenge, Layer D; AbelianSchemesAndArithmeticModuli:A1.

### 1.2 Relative Jacobian

J(X/S):=Pic⁰_{X/S}, with the tensor group law, is an abelian scheme of relative dimension g. No section of X/S is part of its data. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29; Bosch–Lütkebohmert–Raynaud, §9.4 Proposition 4 p. 260.)

Use the identity-component representability of Layer 0. Prove properness of the identity component of a smooth proper curve Picard scheme. Apply the abelian-scheme definition and the tangent/cohomology dimension comparison.

The interface of `RelativeJacobian.RelativeJacobian` identifies its test-scheme points, base change and field specialization while preserving the group law:

- `RelativeJacobian.RelativeJacobian.points`: J(T)=Pic⁰_{X/S}(T), with its fppf sheaf interpretation.
- `RelativeJacobian.RelativeJacobian.baseChange`: J(X/S)×_S T≅J(X_T/T), with the group law preserved.
- `RelativeJacobian.RelativeJacobian.field`: At every field-valued base the result is the parent Jacobian, as an abelian variety.
- `RelativeJacobian.RelativeJacobian.groupLaw`: Under J(T)=Pic⁰_{X/S}(T), the identity is [O] and addition/inverse are tensor product/dual.

**Checks.**

- `RelativeJacobian.RelativeJacobian.test_elliptic` (compatibility): For an elliptic curve E with identity, J(E/k)≅E identifies the origins and group laws.
- `RelativeJacobian.RelativeJacobian.test_unpointed` (non-example): A genus-one torsor C/k has J(C/k) even when C(k)=∅.
- `RelativeJacobian.RelativeJacobian.test_singular` (non-example): For an irreducible one-nodal curve the generalized Pic⁰ has a torus and is not an abelian scheme; it is not in this smooth definition.

*Needs:* §0.3; AbelianSchemesAndArithmeticModuli:A1; JacobianChallenge, Layer E; §1.1.

### 1.3 Base change of the relative Jacobian

For every T→S, the Picard-sheaf base-change isomorphism restricts to a group-scheme isomorphism J(X/S)_T≅J(X_T/T), including infinitesimal base changes. ([Milne](https://www.jmilne.org/math/xnotes/JVs.pdf), §8 Theorem 8.1 p. 27 and following paragraph p. 28.)

Restrict the represented fppf sheaves to Sch/T. Identify degree-zero components by the geometric degree condition. Use Yoneda on all test schemes for the group-scheme isomorphism.

*Needs:* §1.2; AlgebraicModuliForArithmeticGeometry:A0-extension (relative-picard-base-change); §0.2.

### 1.4 Canonical principal polarization

There is a canonical principal polarization λ_X:J→J∨, functorial in base change, defined without a global degree-one bundle on X. After an fppf cover with a degree-one bundle it agrees with the classical theta polarization, with Yuan’s Poincaré sign convention pinned in Layer 3. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29, citing MFK §6.1 Proposition 6.9; Bosch–Lütkebohmert–Raynaud, §9.4 Proposition 4 proof pp. 260–261.)

Construct the local theta polarization after the cover acquiring a section. Compare two local origins by translation invariance of the associated polarization homomorphism. Descend the actual morphism and its inverse, with a cocycle verified on all test schemes; fibre equality alone is insufficient over nonreduced S.

For `RelativeJacobian.PrincipalPolarization`, the family construction must give an isomorphism and agree with the field theta convention after every base change:

- `RelativeJacobian.PrincipalPolarization.isIso`: λ_X is an isomorphism of abelian schemes.
- `RelativeJacobian.PrincipalPolarization.baseChange`: λ_{X_T} is the base change of λ_X under the canonical J and dual comparisons.
- `RelativeJacobian.PrincipalPolarization.theta`: The classical theta bundle on a field fibre induces λ_X with the specified polarization sign convention.

**Checks.**

- `RelativeJacobian.PrincipalPolarization.test_elliptic` (computation): For genus one, λ_X is the usual degree-one elliptic principal polarization.
- `RelativeJacobian.PrincipalPolarization.test_noTheta` (non-example): The construction exists when X has no global degree-one bundle; it cannot require a global theta divisor.
- `RelativeJacobian.PrincipalPolarization.test_dualNumbers` (characterisation): For S=Spec(k[ε]/ε²), overlap comparisons are equal as S-morphisms, not just on the reduced fibre.

*Needs:* §1.2; §1.3; AbelianSchemesAndArithmeticModuli:A2; JacobianChallenge, Layer E.

### Examples

An elliptic curve with its identity gives J(E/k)≅E as a group, with the usual principal polarization. Removing the chosen point from a genus-one torsor does not remove its Jacobian or its polarization. A one-nodal curve has a torus in its generalized Jacobian and fails the smooth-curve hypotheses of this layer. Pullback to Spec(k[ε]/ε²) tests the equality of polarization comparisons as morphisms rather than only on the reduced fibre (§1.1 and §1.4).

### Dependencies

Layer 0 supplies the represented degree-zero group. JacobianChallenge Layers D–E supply the field Picard and theta comparisons. AbelianSchemesAndArithmeticModuli A1 supplies the relative abelian-scheme carrier and rigidity, and A2 supplies duality and normalized seesaw. AlgebraicModuliForArithmeticGeometry R09.3 supplies descent. The ampleness result in §3.13 later strengthens properness to a global projective presentation.

## Layer 2: Abel maps and section-free differences

The graph of a test-scheme point is a relative effective Cartier divisor on the pulled-back smooth curve. Its line class defines a natural transformation to Pic¹. Representability turns that transformation into the section-free Abel morphism. A specified actual degree-d bundle allows multiplication and subtraction in the Picard functor, producing i_α.

After a section-acquiring fppf cover, i_α is multiplication by d on the pointed Abel map followed by translation. Prove the relative pointed Abel closed-immersion theorem and descend it; a list of fibrewise closed immersions alone is insufficient. Finite locally free multiplication from A3 then gives finiteness for d≠0, including negative d and inseparable multiplication. The difference map needs neither α nor a section and retains the order y−x throughout.

### 2.1 Section-free Abel map

The diagonal relative effective Cartier divisor on X×_S X defines a canonical S-morphism a₁:X→Pic¹_{X/S}, taking a T-point x to O_{X_T}(Γ_x). It commutes with arbitrary base change and needs no section of π. ([Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 p. 24, paragraph defining the Faltings–Zhang morphism.)

Use smooth relative dimension one to make Γ_x a relative effective Cartier divisor. Take its invertible sheaf and map to the relative Picard sheaf. Use representability for the S-morphism and the pullback law of the diagonal.

`RelativeJacobian.SectionFreeAbelMap` supplies the graph-class formula and its base change. A specified point yields the comparison with the pointed construction:

- `RelativeJacobian.SectionFreeAbelMap.value`: a₁(x)=[O(Γ_x)] in Pic¹(T).
- `RelativeJacobian.SectionFreeAbelMap.baseChange`: The Abel map of X_T is the base change of a₁.
- `RelativeJacobian.SectionFreeAbelMap.pointed`: If x₀ is chosen, subtracting a₁(x₀) gives the parent pointed Abel–Jacobi map.

**Checks.**

- `RelativeJacobian.SectionFreeAbelMap.test_ellipticTorsor` (compatibility): For a genus-one curve C, a₁:C→Pic¹_C is an isomorphism of torsors, including when C(k)=∅.
- `RelativeJacobian.SectionFreeAbelMap.test_degree` (computation): A geometric point gives degree1, not degree0.
- `RelativeJacobian.SectionFreeAbelMap.test_noOrigin` (non-example): Without an origin the codomain is Pic¹, not J; translating requires a specified relative degree-one class.

*Needs:* §0.4; JacobianChallenge, Layer C.

### 2.2 Degree-d Abel–Jacobi morphism

For an actual invertible α on X of constant relative degree d∈ℤ, i_α:X→J sends x to [O(dΓ_x)⊗α_T⁻¹]. The morphism exists for every d, including 0 and negative d. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29.)

Multiply the Picard-sheaf class a₁(x) by d and subtract α. The degree becomes d−d=0. Represent the resulting natural transformation by a scheme morphism.

The properties of `RelativeJacobian.DegreeAbelMap` make the degree-d class explicit and record how it changes with the normalizing bundle:

- `RelativeJacobian.DegreeAbelMap.value`: i_α(x)=[dΓ_x−α_T].
- `RelativeJacobian.DegreeAbelMap.baseChange`: i_{α_T} is the base change of i_α.
- `RelativeJacobian.DegreeAbelMap.originChange`: For α,β of the same degree, i_β=t_{α−β}∘i_α.
- `RelativeJacobian.DegreeAbelMap.pointed`: For α=O(x₀) and d=1, i_α is the parent pointed Abel–Jacobi morphism.

**Checks.**

- `RelativeJacobian.DegreeAbelMap.test_zero` (degenerate): For d=0 the map is the constant section −[α]; it is not finite on a nonempty positive-dimensional curve fibre.
- `RelativeJacobian.DegreeAbelMap.test_one` (compatibility): For d=1 and α=O(x₀), i_α(x₀)=0.
- `RelativeJacobian.DegreeAbelMap.test_inseparable` (non-example): For d=p in characteristic p, no étaleness of [p] is assumed in defining i_α.

*Needs:* §2.1; §0.4; §1.2.

### 2.3 Local pointed factorization

After any base change with a section x₀:X_T/T, i_α=t_β∘[d]∘i_{O(x₀)}, where β=[dO(x₀)−α_T]∈J(T). The equality holds as T-morphisms. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29; Proposition 2.6 proof p. 31.)

Evaluate both maps on arbitrary U→T using the relative Picard group law. Apply Yoneda, retaining nonreduced U.

*Needs:* §2.2; JacobianChallenge, Layer F; AbelianSchemesAndArithmeticModuli:A1.

### 2.4 Degree-one Abel immersion

If d=1, i_α:X→J is a closed immersion over every noetherian S in the standing scope. No global section of X/S is required. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3 p. 109; §2.2.1 p. 29.)

On a cover acquiring a section identify the map with a translation of the pointed Abel immersion. Verify the fibre immersion by the parent curve theory and tangent/cohomology test. Descend the closed immersion; establish the relative pointed-immersion bridge before descent.

**Checks.**

- For genus one it is an isomorphism X≅J when α exists. Works in characteristic2; no separability or perfectness premise is inserted.

*Needs:* §2.2; §2.3; JacobianChallenge, Layer F; AlgebraicModuliForArithmeticGeometry:R09.3.

### 2.5 Finiteness of nonzero-degree Abel maps

For d≠0, i_α:X→J is finite over S. The statement allows negative d and characteristic dividing d. The degree-zero map is constant and is not finite on a nonempty curve fibre. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29; Proposition 2.6 proof p. 31.)

Use the pointed factorization on a cover acquiring a degree-one bundle. Compose a closed immersion, finite locally free [d], and translation. Descend finiteness under the faithfully flat cover.

**Checks.**

- For d=−1 obtain a closed immersion followed by inversion. For d=p in characteristic p finiteness survives inseparability.

*Needs:* §2.3; §2.4; AbelianSchemesAndArithmeticModuli:A3; AlgebraicModuliForArithmeticGeometry:R09.3.

### 2.6 Curve difference morphism

j:X×_S X→J is δ∘(a₁,a₁), with j(x,y)=[O(Γ_y−Γ_x)]; it is defined without a section. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Theorem 2.10(2) p. 37; proof pp. 38–39; [Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 pp. 24–25.)

Use the Pic¹ torsor difference with the order (x,y). Represent the natural transformation and check diagonal, swap and base change.

`RelativeJacobian.CurveDifference` records the point formula, diagonal, swapping and triangle relation. These identities fix the order of subtraction in the later fibre powers:

- `RelativeJacobian.CurveDifference.value`: j(x,y)=[y]−[x].
- `RelativeJacobian.CurveDifference.diagonal`: j∘Δ_X=e∘π.
- `RelativeJacobian.CurveDifference.baseChange`: The morphism commutes with arbitrary T→S.
- `RelativeJacobian.CurveDifference.pointed`: With a degree-one α, j(x,y)=i_α(y)−i_α(x).
- `RelativeJacobian.CurveDifference.cocycle`: On X³, j(x,z)=j(x,y)+j(y,z) on every test scheme.

**Checks.**

- `RelativeJacobian.CurveDifference.test_equal` (degenerate): j(x,x)=0 on every test scheme.
- `RelativeJacobian.CurveDifference.test_sign` (computation): For an elliptic curve with identity, j(0,y)=y and j(y,0)=−y.
- `RelativeJacobian.CurveDifference.test_noSection` (non-example): The construction applies to a nontrivial genus-one torsor and must not choose a point of it.
- `RelativeJacobian.CurveDifference.test_triangle` (computation): For three points x,y,z, j(x,y)+j(y,z)=j(x,z); replacing the order in just one difference fails this identity.

For the pointed comparison, specialize Mathlib's group
object A over S to J, and let a:X→A be the degree-one Abel morphism supplied
by §2.2. Write `RelativeJacobian.CurveDifference.pointedMap` for
p₂;a / p₁;a, using the native group structure on scheme morphisms into A.
Multiplicative notation in that API expresses the additive difference
a(y)−a(x). This is the pointed comparison of j; the section-free construction
still comes from the Pic¹ torsor in §0.4 and §2.1. Its equality with j is
proved on every test scheme, including nonreduced ones. In particular the
pointed comparison alone does not supply an Abel morphism for a nontrivial
genus-one torsor.

The native difference has the following companion properties. They use Mathlib's native
Hom group operations, binary fibre products and their canonical comparisons
under pullback, together with the earlier Abel morphism as a typed input.
The translation and additive-order cocycle identities use commutativity of
A; evaluation, diagonal, swapping and naturality use its group structure.
The source for the point formula is [Yuan, arXiv v4](https://arxiv.org/pdf/2108.05625v4),
§2.2.1 p. 29 and Theorem 2.10(2), pp. 37–38. The following identities follow
from that formula and the group law; its algebraic comparison does not
require the metric, variation or genus-greater-than-one assumptions of the
arithmetic theorem.

- `RelativeJacobian.CurveDifference.pointedMap_value`: on any test scheme T,
  pointedMap(a)(x,y)=a(y)/a(x).
- `RelativeJacobian.CurveDifference.pointedMap_diagonal`: the small diagonal
  followed by pointedMap(a) is the identity-valued morphism X→A.
- `RelativeJacobian.CurveDifference.pointedMap_swap`: swapping the two
  factors gives the inverse morphism.
- `RelativeJacobian.CurveDifference.pointedMap_cocycle`: for every x,y,z:T→X,
  pointedMap(a)(x,y)·pointedMap(a)(y,z)=pointedMap(a)(x,z).
- `RelativeJacobian.CurveDifference.pointedMap_translate`: translating a by
  a base section b:S→A leaves pointedMap(a) unchanged. This is the comparison
  needed when degree-one normalizations change.
- `RelativeJacobian.CurveDifference.pointedMap_natural`: precomposition
  U→T commutes with evaluation at the two T-valued points.
- `RelativeJacobian.CurveDifference.pointedMap_baseChange`: for any f:S′→S,
  pulling back pointedMap(a) equals the binary fibre-product comparison
  followed by pointedMap(f*a). There is no flatness or reducedness condition
  on f.

**Checks for the native difference.**

- `RelativeJacobian.CurveDifference.pointedMap.test_equal`: two identical
  T-valued points have identity-valued difference.
- `RelativeJacobian.CurveDifference.pointedMap.test_sign`: for a=id_A,
  the pairs (1,y) and (y,1) give y and y⁻¹, respectively. Reversing the
  difference convention fails this test.
- `RelativeJacobian.CurveDifference.pointedMap.test_triangle`: for a=id_A,
  the differences of (x,y) and (y,z) multiply to the difference of (x,z).
- `RelativeJacobian.CurveDifference.pointedMap.test_translation`: every
  base-section translate of a gives the same difference on every pair of
  T-valued points.

*Needs:* §2.1; §0.4.

### 2.7 Difference as the Abel map over X

View X×_S X over the first X-factor. Its diagonal is a section and its Jacobian is X×_S J. The Abel map for O(Δ_X) is (x,y)↦(x,j(x,y)); forgetting the first coordinate gives j. ([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of Theorem 2.10(2) p. 38.)

Base change J along X→S. Apply the degree-one Abel map to the diagonal relative divisor. Compare on all test schemes, using the degree-one point formula.

*Needs:* §2.6; §2.2; §1.3; JacobianChallenge, Layer C.

### Examples

If α=O(x₀), then i_α(x₀)=0 and j(x₀,y)=i_α(y). A degree-zero α gives the constant morphism −[α], so it fails the nonzero-degree finiteness assertion. In characteristic p, degree p gives a finite Abel morphism although its multiplication factor may be inseparable. The identities j(x,x)=0, j(y,x)=−j(x,y) and j(x,y)+j(y,z)=j(x,z) fix the sign of every later difference (§2.2–§2.6).

### Dependencies

Layers 0 and 1 supply torsors, Jacobians and arbitrary-base-change comparisons. JacobianChallenge Layers A, C and F supply Cartier graph divisors and the pointed Abel map. AbelianSchemesAndArithmeticModuli A3 supplies nonzero finite multiplication. Native curve-difference companions use Mathlib’s `CategoryTheory.Hom.group` and `CategoryTheory.GrpObj.comp_div`; the identification with the geometric j uses the earlier Abel construction.

## Layer 3: Poincaré normalization and twice-theta

Construct P with the evaluation and polarization conventions in the introduction, and construct Θ by dualizing P before taking its diagonal pullback. The field theta divisor is used to calculate these canonical family objects, rather than to choose a theta divisor on every family. Its symmetric-power Cartier structure comes from the parent theta construction.

The translated-theta calculation is required for every degree-one divisor α. The curve-square comparison must include the arbitrary-α computation, not only the special case in which α is a canonical root. Use the square/cube theorem for the nonsymmetric doubling relation and normalized seesaw for the Poincaré comparison. The general seesaw, biextension and cube theories remain with A1–A2.

The geometric-fibre class of Θ is twice the principal theta class. Prove its relative ampleness using properness from Layer 1 and the actual-line-bundle fibrewise criterion from StableReduction Layer 2. Symmetry and zero rigidification are separate identities over S; the fibre calculation does not replace their all-test-scheme proofs.

### 3.1 Normalized Jacobian Poincaré bundle

Let U on J×_S J∨ be the normalized universal bundle with U|_{J×{b}} representing b. Fix the supplier convention φ_L(a)=t_a*L⊗L⁻¹ and the positive canonical theta polarization λ_X. Define P_X=(id_J,−λ_X)*U on J×_S J. Thus on a field fibre with theta line L its Picard class is m*L⁻¹⊗p₁*L⊗p₂*L, Yuan’s negative addition convention. Both zero axes are rigidified. The comparison with the supplier evaluation and φ_L conventions is required on all test schemes, including nonreduced ones. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 30; §A.4 Theorem A.3(2) p. 109 and proof p. 110.)

Import J∨ and the normalized universal U, with evaluation U_b=b. Use the specified −λ_X in the second factor; compare φ_L with U to obtain the negative addition class, including the fibre-at-zero factor for a rigidified isomorphism. Pull back both compatible axis rigidifications and the biextension identities. Verify the signed convention comparison after every base change.

The interface of `RelativeJacobian.JacobianPoincare` records both axis rigidifications, arbitrary base change and the comparison that fixes the negative addition sign:

- `RelativeJacobian.JacobianPoincare.axes`: Both zero-axis pullbacks are canonically trivial with compatible unit trivializations.
- `RelativeJacobian.JacobianPoincare.baseChange`: The normalized bundle and rigidifications commute with base change.
- `RelativeJacobian.JacobianPoincare.thetaSign`: With U_b=b and φ_L(a)=t_a*L⊗L⁻¹, P_X=(id,−λ_X)*U has class m*L⁻¹+p₁*L+p₂*L; the rigidified comparison also normalizes L at zero.

**Checks.**

- `RelativeJacobian.JacobianPoincare.test_zero` (degenerate): P restricted to either zero axis is trivial.
- `RelativeJacobian.JacobianPoincare.test_elliptic` (computation): For a genus-one pointed curve, (i,i)*P has class Δ−p₁*0−p₂*0, fixing the sign.
- `RelativeJacobian.JacobianPoincare.test_baseTwist` (non-example): Twisting by a nontrivial line pulled from S fails the specified zero-axis rigidifications.

*Needs:* §1.4; AbelianSchemesAndArithmeticModuli:A2.

### 3.2 Theta divisor with a degree-one class

Over a field K, for a smooth projective geometrically connected C of genus g>0 and an actual degree-one divisor α, θ_α is the image of Sym^{g−1}C→J, D↦[D−(g−1)α], with its effective Cartier divisor structure. For g=1 the symmetric power is Spec K and θ_α is the origin. This translates the parent theta construction to arbitrary degree-one α, which need not be effective or a rational point. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3 p. 109.)

Here K is any field; C is smooth projective geometrically connected of genus g>0; α is a divisor of degree1.

Import the parent symmetric power and theta-divisor theorem. Translate its degree-(g−1) Picard component by −(g−1)α. Retain the Cartier multiplicity, not just the set-theoretic image.

`RelativeJacobian.DegreeOneTheta` exposes the translated effective locus, its change under a new degree-one divisor and its comparison with the pointed theta divisor:

- `RelativeJacobian.DegreeOneTheta.image`: The support is the effective degree-(g−1) locus translated by −(g−1)α.
- `RelativeJacobian.DegreeOneTheta.originChange`: For α′=α+c with c∈Pic⁰(C), θ_{α′} is the translate of θ_α by −(g−1)c.
- `RelativeJacobian.DegreeOneTheta.parent`: For α=O(x₀), this is the parent pointed theta divisor with its Cartier structure.

**Checks.**

- `RelativeJacobian.DegreeOneTheta.test_genusOne` (degenerate): For g=1 θ_α is the origin divisor on the elliptic Jacobian.
- `RelativeJacobian.DegreeOneTheta.test_genusTwo` (computation): For g=2 θ_α is the Abel image of C.
- `RelativeJacobian.DegreeOneTheta.test_notSymmetric` (non-example): An arbitrary θ_α is not assumed symmetric; inversion changes it unless the relevant canonical-class condition holds.

*Needs:* §2.2; JacobianChallenge, Layer C; JacobianChallenge, Layer E.

### 3.3 Canonical twice-theta bundle

Define Θ_X:=Δ_J*(P_X∨), an actual invertible sheaf on J with the induced zero rigidification. This is defined without a degree-one bundle on X; it is not a chosen theta divisor. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Definition 2.4 p. 30.)

Use the dual of the imported invertible sheaf P_X. Pull back along the diagonal morphism. Transport the zero-axis trivializations to the identity section.

`RelativeJacobian.TwiceTheta` records the dual diagonal construction and the inherited rigidification. Its base-change comparison is needed before calculating geometric fibres:

- `RelativeJacobian.TwiceTheta.diagonal`: Θ=Δ_J*(P∨), with the dual, not Δ_J*P.
- `RelativeJacobian.TwiceTheta.baseChange`: Θ_{X_T} identifies with Θ_X pulled to J_T, respecting rigidification.
- `RelativeJacobian.TwiceTheta.normalization`: e*Θ≅O_S with the specified trivialization.

**Checks.**

- `RelativeJacobian.TwiceTheta.test_elliptic` (computation): On a pointed elliptic curve the class of Θ is 2[0], of degree2.
- `RelativeJacobian.TwiceTheta.test_negative` (non-example): Δ_J*P has negative degree on an elliptic fibre and is not the ample bundle Θ.
- `RelativeJacobian.TwiceTheta.test_noDegreeOne` (non-example): Θ exists without a global degree-one class; no arbitrary theta divisor is part of its definition.

*Needs:* §3.1; `TauCeti.AlgebraicGeometry.InvertibleSheaf`.

### 3.4 Pullback of inverse theta

i_α*O_J([-1]*θ_α)≅O_C(gα). ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3(1) first identity p. 109; proof p. 110.)

Here K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Apply the translated theta pullback formula with c=0. Preserve the degree-one divisor hypothesis over K; a rational base point is not substituted.

**Checks.**

- For g=1 this is the degree-one α class. For g=2 the degree is2.

*Needs:* §3.2; §2.2; JacobianChallenge, Layer B.

### 3.5 Pullback of theta

i_α*O_J(θ_α)≅ω_{C/K}⊗O_C((2−g)α). ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3(1) second identity p. 109; proof p. 110.)

Here K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Combine the inverse-theta pullback with the theta/inversion translation formula. Prove the translated-theta identity used in this calculation for arbitrary degree-one α.

**Checks.**

- For g=2 the answer is ω_C, independently of α. The degree is g, not 2g−2.

*Needs:* §3.2; §3.4; JacobianChallenge, Layer B.

### 3.6 Poincaré addition identity

In Pic(J×J), P=m*O_J(−θ_α)⊗p₁*O_J(θ_α)⊗p₂*O_J(θ_α). As a rigidified isomorphism, include the constant fibre normalization of O_J(θ_α) at the origin; the displayed formula alone is a class equality over the field. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3(2) p. 109; proof p. 110.)

Here K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Use the normalized Poincaré universal property and the theta polarization. Compare the zero-axis restrictions; a one-dimensional K-vector-space factor is trivial as a Picard class but has no unchosen canonical trivialization.

*Needs:* §3.1; §3.2; AbelianSchemesAndArithmeticModuli:A1; AbelianSchemesAndArithmeticModuli:A2.

### 3.7 Poincaré pullback on the curve square

In Pic(C×C), (i_α,i_α)*P=O(Δ_C)⊗p₁*O_C(−α)⊗p₂*O_C(−α). There is no assumption (2g−2)α=ω_C. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3(3) p. 109; proof p. 110.)

Here K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Compare the two families of degree-zero line classes by the Poincaré universal property. Compute their translated-theta restrictions with arbitrary α. Use normalized seesaw to remove the axis terms; prove the extra computation for arbitrary α beyond the canonical-root case.

**Checks.**

- For genus2 with arbitrary α, the formula still holds without 2α=ω_C. The diagonal has positive sign.

*Needs:* §3.6; §3.4; §3.5; JacobianChallenge, Layer F; AbelianSchemesAndArithmeticModuli:A2.

### 3.8 Theta doubling formula

[2]*O_J(θ_α)≅O_J(3θ_α+[-1]*θ_α) as a Picard class over K. ([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of §A.4 Theorem A.3(4) p. 110.)

Here K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Apply the theorem of the cube recurrence to the theta line. Keep the nonsymmetric inversion term instead of replacing it by θ_α.

**Checks.**

- For a symmetric theta line this specializes to [2]*L≅L⁴.

*Needs:* §3.2; AbelianSchemesAndArithmeticModuli:A1.

### 3.9 Poincaré diagonal identity

Δ_J*P≅O_J(−θ_α−[-1]*θ_α). ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.4 Theorem A.3(4) and proof p. 110.)

Here K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of Layers 2–3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.

Pull the addition identity back to the diagonal, obtaining [2]*O(−θ)+O(2θ). Substitute the doubling formula and cancel the theta classes.

**Checks.**

- Dualizing gives the positive twice-theta class.

*Needs:* §3.6; §3.8.

### 3.10 Geometric fibre twice-theta class

For every geometric point s of S, Θ_s is algebraically equivalent to twice a theta divisor on J_s. With a chosen degree-one α over the algebraically closed residue field, its Picard class is θ_α+[-1]*θ_α. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Definition 2.4 and following paragraph p. 30; §A.4 Theorem A.3(4) p. 110.)

Base change the normalized Poincaré bundle. Choose α on the geometric fibre only. Dualize the diagonal identity; inversion acts trivially on the Néron–Severi class.

*Needs:* §3.3; §3.9; §1.3; AbelianSchemesAndArithmeticModuli:A1.

### 3.11 Symmetry of twice-theta

[-1]*Θ_X≅Θ_X as zero-rigidified bundles over S, not merely on geometric fibres. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Definition 2.4 and following paragraph p. 30.)

Use simultaneous inversion invariance of the normalized biextension P. Pull the rigidified identity through Δ_J and dualization.

*Needs:* §3.3; §3.1; AbelianSchemesAndArithmeticModuli:A2.

### 3.12 Zero rigidification of twice-theta

The zero-axis trivializations of P induce e*Θ_X≅O_S, compatible with base change. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Definition 2.4 and following paragraph p. 30.)

Factor the zero diagonal through either zero axis. Dualize the trivialization and check the agreement at the unit.

*Needs:* §3.3; §3.1.

### 3.13 Relative ampleness of twice-theta

Θ_X is relatively ample for J→S; hence J→S is projective. The proof uses properness and the fibrewise ampleness criterion over noetherian S. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Definition 2.4 and following paragraph p. 30.)

Twice the principal theta class is ample on every geometric fibre. Apply the relative ampleness criterion for an actual invertible sheaf on a proper finitely presented morphism; algebraic equivalence preserves ampleness on these fibres.

*Needs:* §3.10; §1.1; AbelianSchemesAndArithmeticModuli:A2; AlgebraicModuliForArithmeticGeometry:R09.2; StableReduction, Layer 2.

### Examples

For an elliptic Jacobian, the positive canonical Θ has degree two, while Δ*P has degree minus two. For genus two, the pullback of θ_α is ω_C independently of the choice of degree-one α. A translated theta divisor can fail symmetry; its doubling formula must keep both θ_α and [−1]*θ_α. Twisting P by a nontrivial base bundle fails the specified rigidifications. These checks distinguish the signs, the actual line-bundle classes and the chosen normalizations (§3.1–§3.9).

### Dependencies

Layers 1 and 2 supply the polarized Jacobian and Abel maps. JacobianChallenge Layers B, E and F supply field duality and theta. AbelianSchemesAndArithmeticModuli A1–A2 supply square/cube, normalized Poincaré and seesaw. AlgebraicModuliForArithmeticGeometry R09.2 and StableReduction Layer 2 supply the proper-family fibre criterion used for relative ampleness. Tau Ceti’s invertible-sheaf operations supply the dual in Θ=Δ*(P∨).

## Layer 4: Actual Picard groups and autoduality pullbacks

Work first with actual line-bundle classes and their two projection conditions. Algebraic triviality on a geometric fibre means that the class is algebraically equivalent to the trivial class in the fibre Picard theory. Its tensor, inverse and pullback closure and its agreement with the Picard identity component are required in the actual-to-relative comparison. This is not a degree-zero condition on higher-dimensional varieties.

The universal-global-functions hypothesis permits the low-degree fppf Leray sequence. A section of J/S removes the Brauer obstruction on J; it does not create a section of X/S. Compare degree-d Abel pullback to multiplication by d through relative autoduality on all test schemes. When lifting an actual class, absorb any difference pulled from S by a corresponding base twist on J.

For the bi-zero statement, lift along one factor and then the other. Each lift must preserve algebraic triviality along the remaining projection; the one-variable torsion-cokernel assertion alone does not prove this. The pointed field comparison instead uses the two actual axis kernels and the Albanese universal property with normalized seesaw. Its algebraic statement makes sense over any field, independently of the complete-valued-field application.

### 4.1 Actual fibrewise Picard subgroup

For a projective flat Y→S, Pic⁰(Y/S) is the subgroup of the actual Pic(Y) formed by line-bundle classes algebraically trivial on every geometric fibre. It is not Pic⁰_{Y/S}(S); comparison to that sheaf group requires a separate obstruction statement. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof p. 31.)

Define the subgroup by the fibre algebraic-triviality predicate. Use tensor, dual and pullback stability of algebraic equivalence.

The properties of `RelativeJacobian.ActualPicardZero` distinguish actual membership from a relative section and keep the kernel condition explicit:

- `RelativeJacobian.ActualPicardZero.mem`: Membership means algebraic triviality on every geometric fibre, not degree zero for higher-dimensional Y.
- `RelativeJacobian.ActualPicardZero.pullback`: An S-morphism Y′→Y pulls these actual classes to fibrewise algebraically trivial classes.
- `RelativeJacobian.ActualPicardZero.relativeClass`: The class map lands in Pic⁰_{Y/S}(S), with kernel the base classes under universal global-functions hypotheses.

**Checks.**

- `RelativeJacobian.ActualPicardZero.test_base` (degenerate): For Y=S, every class in Pic(S) belongs to this subgroup.
- `RelativeJacobian.ActualPicardZero.test_curve` (compatibility): For a smooth projective curve over a field, membership is equivalent to degree0.
- `RelativeJacobian.ActualPicardZero.test_brauer` (non-example): An obstructed point of the relative Picard sheaf is not an actual line-bundle class in this subgroup.

*Needs:* JacobianChallenge, Layer A; AlgebraicModuliForArithmeticGeometry:A0-extension (relative-picard-sheaf); AbelianSchemesAndArithmeticModuli:A2.

### 4.2 Picard subgroup along both projections

For projective flat Y₁,Y₂ over S, Pic⁰⁰(Y₁×_S Y₂) consists of actual line classes whose restrictions to every geometric fibre of each projection to Y₁ and to Y₂ are algebraically trivial. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof p. 31.)

Intersect the two fibrewise algebraic-triviality subgroups. Check that tensor and inverse preserve both conditions.

`RelativeJacobian.ActualPicardBizero` records both projection conditions, their pullback compatibility and the base classes that remain in the actual group:

- `RelativeJacobian.ActualPicardBizero.mem`: Both projection-fibre conditions are required.
- `RelativeJacobian.ActualPicardBizero.pullback`: Products of S-morphisms preserve the two fibre conditions.
- `RelativeJacobian.ActualPicardBizero.baseTwist`: Classes pulled from S lie in Pic⁰⁰; they are not quotiented out of the definition.

**Checks.**

- `RelativeJacobian.ActualPicardBizero.test_trivial` (degenerate): The structure sheaf and every base pullback lie in Pic⁰⁰.
- `RelativeJacobian.ActualPicardBizero.test_oneAxis` (non-example): On C×C, p₁*L of positive degree fails one projection condition, despite being trivial along the other projection fibres.
- `RelativeJacobian.ActualPicardBizero.test_poincare` (compatibility): A normalized Poincaré bundle on J×J belongs to Pic⁰⁰ because its restrictions are degree-zero Picard classes.

*Needs:* §4.1; JacobianChallenge, Layer A.

### 4.3 Relative curve autoduality

There is a canonical base-change-compatible identification u:Pic⁰_{J/S}≅Pic⁰_{X/S} such that, for the actual degree-d α, i_α*= [d]∘u as morphisms of fppf group sheaves. The sign of u is characterized by degree-one Abel pullback. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof p. 31.)

Over a cover with a section use the parent Abel pullback autoduality. Translation has trivial pullback action on Pic⁰ of an abelian scheme. Use the degree-d factorization and dual multiplication. Descend the natural identity on all T-points; an equality on geometric fibres is not used as a proof over nilpotent bases.

**Checks.**

- For d=0 this morphism is zero. For d=−1 it is −u.

*Needs:* §1.2; §1.4; §2.2; JacobianChallenge, Layer F; AbelianSchemesAndArithmeticModuli:A2.

### 4.4 Actual Picard classes and the Brauer obstruction

For proper flat Y/S with O_S≅f_*O_Y universally, 0→Pic(S)→Pic(Y)→Pic_{Y/S}(S)→H²_fppf(S,G_m)→H²_fppf(Y,G_m) is exact. These are the cohomological Brauer groups, not an unproved identification with Azumaya classes; the boundary is the Leray differential d₂^{0,1}. For J/S its identity section kills the obstruction, so Pic⁰(J/S)/Pic(S)≅Pic⁰_{J/S}(S). For X/S the same map is only injective without a section. (Bosch–Lütkebohmert–Raynaud, §8.1 Leray discussion p. 203 and Proposition 4 pp. 204–205.)

Here Y→S is proper, flat and finitely presented, with O_T≅(f_T)_*O_{Y_T} for every T→S. For the Pic⁰ restrictions, use the smooth geometrically connected curve X/S and its abelian-scheme Jacobian J/S in the standing scope.

Apply BLR’s Leray low-degree sequence in the fppf topology under the universal global-functions hypothesis. Restrict to the algebraically trivial components. Use the identity section of J for surjectivity; do not use it as a section of X.

**Checks.**

- For a sectionless genus-one curve a relative class may have nonzero Brauer obstruction.

*Needs:* AlgebraicModuliForArithmeticGeometry:A0-extension (relative-picard-kernel); AlgebraicModuliForArithmeticGeometry:A0-extension (section-picard-split); §4.1; §1.2; JacobianChallenge, Layer C.

### 4.5 Actual Picard pullback torsion cokernel

Let S be a normal integral quasi-projective scheme flat over ℤ or over a field, and let α have relative degree d>0. Every L∈Pic⁰(X/S) has a positive tensor power in the image of i_α*:Pic⁰(J/S)→Pic⁰(X/S). In particular the cokernel is a torsion group. No integral surjectivity is asserted. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof p. 31.)

View the class of L in Pic⁰_{X/S}(S). Use u⁻¹ to obtain a relative class on J, and the identity section to represent it by an actual M. The relative equality i_α*[M]=d[L] says that i_α*M−dL is a base pullback. Absorb this base pullback in M using J→S, proving the actual-class statement, with the necessary global-functions and fibre-triviality checks.

**Checks.**

- For d=1 the argument gives surjectivity under the stated comparison hypotheses. For d>1, torsion cokernel does not mean [d] is surjective on S-points.

*Needs:* §4.3; §4.4; §4.1.

### 4.6 Lift preserving both fibre conditions

In the arithmetic normal-base scope and for positive-degree i_α, every Pic⁰⁰ class on X×_S X has a positive power lifted through id_X×i_α to a class on X×_S J lying in Pic⁰⁰. The corresponding assertion through i_α×id_J lifts Pic⁰⁰(X×J) to Pic⁰⁰(J×J). ([Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof pp. 31–32.)

Here the arithmetic normal-base scope means S is normal, integral, quasi-projective and flat over Z or over a field, the standing smooth curve hypotheses hold, α is an actual relative degree-d line bundle, and d>0.

Apply the actual Picard pullback statement to the curve after base change to the other factor. Check that the lift retains algebraic triviality along the second projection, correcting any base pullback. The second condition is a separate lifting obligation; a surjection on unrestricted Pic⁰ groups does not imply it.

**Checks.**

- A lift that acquires a positive-degree restriction on the other axis fails this lemma.

*Needs:* §4.5; §4.2; §1.3; AbelianSchemesAndArithmeticModuli:A2.

### 4.7 Bi-Picard pullback torsion cokernel

Under the same S, X, α and d>0 hypotheses, (i_α,i_α)*:Pic⁰⁰(J×_S J)→Pic⁰⁰(X×_S X) has torsion cokernel. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Proposition 2.6 proof pp. 31–32.)

Here the arithmetic normal-base scope means S is normal, integral, quasi-projective and flat over Z or over a field, the standing smooth curve hypotheses hold, α is an actual relative degree-d line bundle, and d>0.

Factor the pullback through X×_S J. Use the two one-factor lifting assertions and multiply their class-dependent exponents. Do not assume a uniform exponent without verifying its separate proof.

*Needs:* §4.6; §4.2.

### 4.8 Axis-normalized Picard subgroup

Over a field K, with a rational x₀∈C(K), Pic⁻(C²) is the subgroup of actual Pic(C²) whose restrictions to C×{x₀} and {x₀}×C are trivial; Pic⁻(J²) uses the two zero axes. These are classes with trivial restrictions, not chosen rigidifications and not the larger Pic⁰⁰ subgroup. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.3 p. 108, axis-normalized subgroups.)

Here K is a field; C/K is smooth projective geometrically connected of genus>0; x₀∈C(K). Its nonarchimedean application additionally assumes K complete nontrivially nonarchimedean.

Take the intersection of the kernels of the two actual restriction maps. Retain the distinction between existence of a trivialization and a specified trivialization.

`RelativeJacobian.AxisNormalizedPicard` records the two actual restriction kernels and pointed pullback. The Poincaré comparison includes its additional rigidification:

- `RelativeJacobian.AxisNormalizedPicard.mem`: Both actual axis restrictions have the trivial Picard class.
- `RelativeJacobian.AxisNormalizedPicard.pullback`: Pointed product morphisms pull back axis-normalized classes.
- `RelativeJacobian.AxisNormalizedPicard.biextension`: The normalized Poincaré class belongs to Pic⁻(J²), with an additional rigidification available from its construction.

**Checks.**

- `RelativeJacobian.AxisNormalizedPicard.test_unit` (degenerate): The trivial line class lies in Pic⁻.
- `RelativeJacobian.AxisNormalizedPicard.test_positiveBase` (non-example): On C², p₁*L for a nontrivial degree-zero L fails one axis restriction despite belonging to Pic⁰⁰.
- `RelativeJacobian.AxisNormalizedPicard.test_elliptic` (compatibility): With C=J an elliptic curve and x₀=0 the two axis-normalized groups are literally the same.

*Needs:* §4.1; §4.2; JacobianChallenge, Layer A.

### 4.9 Pointed square Picard comparison

With x₀ as above and i=i_{O(x₀)}, (i,i)*:Pic⁻(J²)→Pic⁻(C²) is an isomorphism. The application over complete nonarchimedean K uses only this algebraic assertion here; its metrics belong to the Arakelov owner. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §A.3 p. 108, citing Zhang Lemmas2.2.1–2.2.3.)

Here K is a field; C/K is smooth projective geometrically connected of genus g>0; x₀∈C(K), and i=i_{O(x₀)}. No complete-valued-field assumption is used by the algebraic comparison.

Identify an axis-normalized line class with its pointed Picard-valued family. Use the parent Albanese universal property to extend it uniquely from C to J in each variable. Apply normalized seesaw to recover the original actual class; prove the two-variable pointed Picard comparison used in this step.

**Checks.**

- For C elliptic and x₀ its identity the map is the identity. The rational point x₀ is required; this statement does not choose a rational point on an arbitrary curve.

*Needs:* §4.8; §2.2; JacobianChallenge, Layer F; AbelianSchemesAndArithmeticModuli:A2; §4.3.

### Examples

A base pullback lies in the actual fibrewise Picard subgroup, although it maps to zero in the relative sheaf. A positive-degree pullback from one factor of C×C fails the other projection’s algebraic-triviality condition. A nontrivial degree-zero pullback from one factor can lie in Pic⁰⁰ while failing triviality on its pointed axis. These are three different tests; quotienting by Pic(S), requiring algebraic triviality and imposing axis trivializations must not be interchanged (§4.1, §4.2 and §4.8).

### Dependencies

Layers 1–3 supply the relative Jacobian, degree-d Abel map and Poincaré normalization. JacobianChallenge Layers A and F supply actual Picard classes and pointed universal properties. AlgebraicModuliForArithmeticGeometry A0-extension supplies actual-to-relative comparison; AbelianSchemesAndArithmeticModuli A2 supplies duality and seesaw. The obstruction sequence and the lift preserving the other projection are separate prerequisites for the torsion-cokernel assertions.

## Layer 5: Fibre powers and shifted Faltings–Zhang maps

The canonical bundle has degree 2g−2, so for g>1 it gives a finite canonical Abel map without a choice of degree-one bundle. Addition with a free Jacobian coordinate gives the universal shift. Repeated use of the section-free difference defines the Faltings–Zhang map on every positive fibre power.

Keep the first shifted canonical coordinate separate from the unscaled tail differences. The triangular coordinate equivalence is natural on represented points for any group object, including noncommutative ones. In the Jacobian application the group is commutative and these coordinate formulas assemble to an isomorphism of fibre-power schemes by Yoneda. Only the tail-isogeny factorization uses multiplication by 2g−2. Nondegeneracy, maximal variation and numerical height estimates are arithmetic consumers of these maps, rather than hypotheses of their definition.

### 5.1 Canonical-bundle Abel morphism

For g>1, ω_{X/S} has relative degree 2g−2, so i_ω(x)=[(2g−2)Γ_x−ω_{X/S}] is a finite S-morphism X→J. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Theorem 2.10(1) p. 37; §2.2.1 p. 29.)

Assume g>1; in the fibre-power assertions m≥1.

Use the fibre canonical degree and dualizing base change. Apply the nonzero-degree finiteness theorem.

*Needs:* §2.2; §2.5; JacobianChallenge, Layer B; JacobianChallenge, Layer C.

### 5.2 Universal shifted canonical morphism

For g>1, τ:J×_S X→J×_S J is (y,x)↦(y,y+i_ω(x)); it is a morphism over the first J-factor and has no global-section hypothesis. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Theorem 2.10(3) p. 37.)

Assume g>1; in the fibre-power assertions m≥1.

Take id_J×i_ω and apply addition in the second J coordinate. Verify the first projection is unchanged.

For the native signature, take A and X in Over(S), a group object on A, and an S-morphism c:X→A. Define `UniversalShift c` by its projections p₁ and p₁·(p₂∘c). In the geometric application A=J and c=i_ω from §5.1. The signature takes that morphism as an input; the canonical bundle and its degree remain part of the earlier construction. The product comparison identifies a pulled-back shift with the shift of the pulled-back c. These are morphism equalities over the new base. The same algebraic operation with c=0 gives (y,x)↦(y,y); this group-law check supplements the geometric genus-one test below, whose canonical-bundle identification belongs to §5.1. See also [Yuan, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4), §2.2.1 p. 29 and Theorem 2.10(3) p. 37.

The coordinate properties of `RelativeJacobian.UniversalShift` preserve its first Jacobian factor and commute with arbitrary base change:

- `RelativeJacobian.UniversalShift.value`: τ(y,x)=(y,y+(2g−2)[x]−ω).
- `RelativeJacobian.UniversalShift.overJ`: q₁∘τ=p₁.
- `RelativeJacobian.UniversalShift.baseChange`: τ commutes with arbitrary T→S.

**Checks.**

- `RelativeJacobian.UniversalShift.test_zeroShift` (computation): τ(0,x)=(0,i_ω(x)).
- `RelativeJacobian.UniversalShift.test_genusOne` (non-example): The asserted finite canonical Abel map uses g>1; in genus1 its degree is0 and it is constant.
- `RelativeJacobian.UniversalShift.test_firstCoordinate` (characterisation): Changing x leaves the first coordinate y fixed on every test scheme.

*Needs:* §5.1; AbelianSchemesAndArithmeticModuli:A1.

### 5.3 Faltings–Zhang morphism

For m≥1, FZ_m:X^{m+1}_S→J^m_S sends (x₀,…,x_m) to (j(x₀,x₁),…,j(x₀,x_m)). It is defined without a section and without a maximal-variation hypothesis. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §4.6.2 pp. 96–97 and Theorem 4.17 proof p. 98; [Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 equation(6.3) and paragraph after(6.5) p. 25.)

Use the actual fibre-power projections and form each difference coordinate. Use the product universal property to assemble the morphism. Check base change through the fibre-power comparisons.

The native definition takes the section-free difference d:X×_S X→A as its input and uses `Fin (m+1)` for the source and `Fin m` for the target. Coordinate i of the target uses source coordinates 0 and i.succ, in that order. The pointed comparison assumes d(x,y)=a(y)−a(x) and a(P)=0 for the supplied pointed Abel morphism a. The origin-change check uses the same difference identity for every degree-one Abel morphism; choosing an origin is unnecessary in the definition. A base extension transports d through the inverse binary-product comparison before forming the new tuple. For properness, apply Mathlib's `AlgebraicGeometry.IsProper.of_comp` to the target structure morphism: properness of the source over S and separatedness of A^m over S are the precise native inputs. The construction and comparison are also described in [Yuan, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4), §4.6.2 pp. 96–98; DGH's §6.1 p. 25 gives the proper arbitrary-base-change map.

`RelativeJacobian.FaltingsZhang` records every difference coordinate, its base change and the specialization obtained by fixing the first point:

- `RelativeJacobian.FaltingsZhang.coordinate`: The r-th coordinate is [x_r]−[x₀], for 1≤r≤m.
- `RelativeJacobian.FaltingsZhang.baseChange`: The morphism pulls back to FZ_m of X_T/T.
- `RelativeJacobian.FaltingsZhang.pointed`: Fixing x₀=P₀ on a fibre gives the m-fold product of the pointed Abel embedding C−P₀.
- `RelativeJacobian.FaltingsZhang.proper`: FZ_m is proper: its source is proper over S and J^m is separated over S, so the graph factorization is proper.

**Checks.**

- `RelativeJacobian.FaltingsZhang.test_one` (computation): FZ₁(x₀,x₁)=j(x₀,x₁).
- `RelativeJacobian.FaltingsZhang.test_diagonal` (degenerate): The small diagonal maps to the zero tuple.
- `RelativeJacobian.FaltingsZhang.test_originChange` (characterisation): With any degree-one α, all coordinates equal i_α(x_r)−i_α(x₀), independent of α.

*Needs:* §2.6; AbelianSchemesAndArithmeticModuli:A1.

### 5.4 Shifted Faltings–Zhang morphism

For g>1 and m≥1, τ_m:X^m_S×_S J→J^m_S sends (x₁,…,x_m,y) to (i_ω(x₁)+y,j(x₁,x₂),…,j(x₁,x_m)). The source order, first shift and unscaled remaining differences are part of the definition. ([Yuan](https://arxiv.org/pdf/2108.05625v4), §4.6.2 pp. 96–97 and Theorem 4.17 proof p. 98.)

Assume g>1; in the fibre-power assertions m≥1.

Assemble the first coordinate from addition and i_ω. Assemble the remaining coordinates from j and use the product universal property.

Write m=n+1 in the native signature, so the first coordinate exists without a separate nonempty-index proof. The source is the binary product of the X fibre power with A. With c=i_ω and d=j supplied by §5.1 and §2.6, its head is c(x₁)+y and coordinate r>1 is d(x₁,x_r). The base-change equality includes both the binary-product comparison for X^m×A and the finite-product comparison for X^m; it preserves this source order and compares the maps over the whole new base. The one-factor, two-factor sign and diagonal tests below have native forms for these inputs. See also [Yuan, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4), §4.6.2, definition preceding Theorem 4.17 p. 97 and proof p. 98.

The interface of `RelativeJacobian.ShiftedFaltingsZhang` distinguishes the shifted head from each unscaled tail and preserves this order under base change:

- `RelativeJacobian.ShiftedFaltingsZhang.first`: The first coordinate is (2g−2)[x₁]−ω+y.
- `RelativeJacobian.ShiftedFaltingsZhang.tail`: Coordinate r>1 is [x_r]−[x₁], with no factor 2g−2.
- `RelativeJacobian.ShiftedFaltingsZhang.baseChange`: The shifted morphism commutes with T→S.

**Checks.**

- `RelativeJacobian.ShiftedFaltingsZhang.test_one` (degenerate): For m=1 the map is i_ω(x₁)+y; there is no tail coordinate.
- `RelativeJacobian.ShiftedFaltingsZhang.test_sign` (computation): For m=2 the second coordinate is x₂−x₁, not x₁−x₂.
- `RelativeJacobian.ShiftedFaltingsZhang.test_diagonal` (characterisation): If all x_r=x₁, every tail coordinate is0 and the first remains i_ω(x₁)+y.

*Needs:* §5.2; §5.3; §2.6.

### 5.5 Triangular change on represented points

For any scheme S, any group object A of Over(S), any T∈Over(S), and n≥0, there is a natural equivalence of (n+1)-tuples of T-valued points of A: R(q)₀=q₀, R(q)_r=q_r q₀⁻¹ for r≠0. Its inverse sends r to (r₀,r₁r₀,…,r_nr₀). Multiplicative notation is Mathlib’s notation for group objects; on the Jacobian it means subtraction and addition. The construction uses actual morphisms T→A, not an abstract point-set replacement for A. ([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of Theorem 4.17(5) p. 98.)

Here S is a scheme, A is a group object in Over(S), T is an object of Over(S), n is a natural number. Commutativity is not needed for this equivalence.

Define the two coordinate operations on the native Hom group. Use group cancellation to check both inverse composites. Precomposition preserves products and inverses, so the equivalence is natural in every test scheme.

Represent the same coordinate change on the actual fibre power A^{n+1}_S. Its forward morphism has first projection p₀ and remaining projections p_r p₀⁻¹; its inverse has first projection p₀ and remaining projections p_r p₀. Assemble both maps with the product universal property. Composition with each projection reduces both inverse identities to group cancellation, and the product extensionality theorem gives their equality with the identity S-morphism. This argument also works for a noncommutative group scheme; the right-hand position of p₀ in the inverse is essential.

`RelativeJacobian.TriangularCoordinateEquivalence.schemeIso` names this isomorphism of fibre-power schemes. Its `schemeIso_hom_coordinates` and `schemeIso_inv_coordinates` lemmas identify the induced maps on every Hom(T,A^{n+1}_S) with the forward and inverse represented-point equivalence. Use Mathlib's `CategoryTheory.Limits.piObj`, `Pi.π`, `Pi.lift` and `Pi.hom_ext` for these products and maps. Its `schemeIso_baseChange` lemma states that arbitrary base extension carries this morphism to the corresponding morphism on the pulled-back group scheme, conjugated by the canonical product comparison `PreservesProduct.iso`. This is an equality of morphisms over the new base. A fibre power in Over(S) retains the common structure morphism to S; an unrestricted product of the underlying point sets would lose that condition.

The scheme form passes three further checks: for n=0 it is the identity isomorphism of the one-factor fibre power; its inverse takes the pair of actual T-morphisms (f,g/f) to (f,g); and the small diagonal takes f to f in the head and the identity section in each tail. These identities hold for arbitrary test schemes T, including nonreduced ones.

`RelativeJacobian.TriangularCoordinateEquivalence.schemeIso_baseChangeIso` compares the complete isomorphisms after arbitrary base extension, using `Functor.mapIso` and the same finite-product comparison. If F is pullback along S′→S and C identifies F(A^{n+1}_S) with (F(A))^{n+1}_{S′}, the equality is F(R)≫C=C≫R′ as isomorphisms. Taking inverses also gives C⁻¹≫F(R⁻¹)=R′⁻¹≫C⁻¹. Thus the inverse coordinate change has the same base-change compatibility as the forward morphism. This follows from the coordinate construction above, the product universal property and the uniqueness of the inverse; it uses no commutativity hypothesis. ([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of Theorem 4.17(5), p. 98, for the Jacobian coordinate change; the extension to arbitrary group objects is the group-cancellation argument above.)

The companion check `RelativeJacobian.TriangularCoordinateEquivalence.test_schemeNoncommutingInverse` retains the noncommutative distinction explicitly: for actual T-valued points a,b with ab≠ba, R⁻¹(a,b)=(a,ba) differs from (a,ab). Projection to the second factor detects the difference. For GL₂ over F₂, take a with rows (1,1),(0,1) and b with rows (1,0),(1,1). Then ab has rows (0,1),(1,1), while ba has rows (1,1),(1,0). These are distinct rational points of the same group scheme. This rules out restoring the head on the left in a purported inverse of the stated right-quotient coordinate map.

The properties of `RelativeJacobian.TriangularCoordinateEquivalence` fix each forward and inverse coordinate and prove naturality of both directions:

- `RelativeJacobian.TriangularCoordinateEquivalence.first`: R(q)₀=q₀.
- `RelativeJacobian.TriangularCoordinateEquivalence.tail`: R(q)_r=q_r/q₀ for r≠0.
- `RelativeJacobian.TriangularCoordinateEquivalence.inverse`: R⁻¹(r)_i is r₀ for i=0 and r_i*r₀ otherwise.
- `RelativeJacobian.TriangularCoordinateEquivalence.natural`: For h:U→T, R(i↦h∘q_i)=i↦h∘R(q)_i.
- `RelativeJacobian.TriangularCoordinateEquivalence.inverse_natural`: For h:U→T, precomposition commutes with R⁻¹ as well as R; no commutativity of the group object is needed.

**Checks.**

- `RelativeJacobian.TriangularCoordinateEquivalence.test_lengthOne` (degenerate): For n=0 the equivalence on one-coordinate tuples is identity.
- `RelativeJacobian.TriangularCoordinateEquivalence.test_lengthTwo` (computation): R⁻¹ applied to the pair (f,g/f) is the pair (f,g) of actual T-valued points.
- `RelativeJacobian.TriangularCoordinateEquivalence.test_constant` (computation): A constant tuple f transforms to f in coordinate0 and the identity point in every tail coordinate.

*Needs:* `CategoryTheory.Hom.group`; `CategoryTheory.GrpObj.comp_div`.

### 5.6 Shifted-power factorization

Let B_m(x₁,…,x_m,y)=(i_ω(x₁)+y,…,i_ω(x_m)+y). After the triangular change R on J^m, R∘B_m=D∘τ_m, where D fixes the first coordinate and multiplies each tail by 2g−2. This equality holds as S-morphisms; D is a finite locally free isogeny for g>1. ([Yuan](https://arxiv.org/pdf/2108.05625v4), proof of Theorem 4.17(5) p. 98.)

Assume g>1; in the fibre-power assertions m≥1.

Evaluate the triangular map on every test scheme. Subtract the common first coordinate: i_ω(x_r)−i_ω(x₁)=(2g−2)j(x₁,x_r). Apply the nonzero multiplication theorem to the tail factors. Do not identify τ_m itself with the tuple of all shifted canonical Abel coordinates.

`ShiftedCanonicalPower n c` gives B_{n+1} and `TailMultiplication n e` gives D on the actual fibre powers. In Mathlib's multiplicative notation, the earlier difference identity is (p₂∘c)/(p₁∘c)=d^e in Hom(X×_S X,A). With this equality as an explicit input, `shifted_power_factorization` states B≫R=τ≫D as a morphism in Over(S). Substituting c=i_ω, d=j and e=2g−2 gives the displayed geometric identity. Projection to the head preserves c(x₁)+y; projection to a tail cancels the common y and applies the supplied difference identity. The positive scaling is retained in D.

The native finite, flat, locally finitely presented and surjective signatures for D each assume the corresponding property of [e]:A→A. These are transfers to products, with the abelian-scheme theorem supplying the hypotheses at e=2g−2≠0. They do not assert a multiplication-isogeny theorem for an arbitrary group object. The helper maps are checked on a single factor, a zero translation and a diagonal tuple; D is also checked at e=1 and e=0, where the latter kills its tails. In the Jacobian application A is commutative, so D preserves the group law; finite locally free multiplication gives the required isogeny without an invertibility assumption on e. See also [Yuan, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4), proof of Theorem 4.17(5) p. 98.

The product transfer must identify the schemes and their morphisms. Separate the head to obtain H:A^{n+1}_S≅A×_S A^n_S. Its forward map sends (a₀,…,a_n) to (a₀,(a₁,…,a_n)); its inverse reassembles that tuple, in order. Then D≫H=H≫(id_A×[e]^n). This is an equality of S-morphisms. Stability under products and invariance under isomorphism transfer each geometric property of [e] to D. For n=0 the tail fibre power is the terminal object over S, and D is identity without any multiplication hypothesis.

The represented-point map D_T is a group homomorphism on (Hom_S(T,A))^{n+1} when A is commutative. Keep that hypothesis on the group-homomorphism interface: powering an arbitrary noncommutative group does not preserve multiplication. These are actual test-scheme morphisms, and the homomorphisms commute with precomposition T′→T. For every S′→S, transport D through the canonical finite-product base-change comparison; it is then exactly the tail multiplication on A_{S′}. Neither naturality statement is restricted to reduced bases.

The named properties of `RelativeJacobian.TailMultiplication.headTailIso` identify the head and tail factors and make the product transfer explicit:

- `RelativeJacobian.TailMultiplication.headTailIso`: The S-scheme isomorphism H just described, including its inverse.
- `RelativeJacobian.TailMultiplication.headTailIso_first`: Projection to A after H is the original coordinate 0.
- `RelativeJacobian.TailMultiplication.headTailIso_tail`: Tail coordinate i after H is original coordinate i+1.
- `RelativeJacobian.TailMultiplication.headTailIso_inverse`: Reassembling a:T→A and a tail tuple q gives the tuple with head a and tail q.
- `RelativeJacobian.TailMultiplication.split`: The identity D≫H=H≫(id_A×[e]^n) on the actual fibre powers.

**Checks for the product decomposition.**

- `RelativeJacobian.TailMultiplication.headTailIso.test_singleton` (degenerate): H maps a one-coordinate tuple (a) to (a,()) with its terminal empty tail.
- `RelativeJacobian.TailMultiplication.headTailIso.test_pair` (computation): H sends (a,b) to (a,(b)), preserving the coordinate order and doing no integer scaling.
- `RelativeJacobian.TailMultiplication.headTailIso.test_inversePair` (compatibility): H⁻¹ sends (a,(b)) back to (a,b), with the maps interpreted on every test scheme.

The represented-point homomorphism records its coordinate action, compatibility with the scheme morphism and precomposition, and arbitrary base change:

- `RelativeJacobian.TailMultiplication.points`: For commutative A, the homomorphism D_T fixes the head and sends each tail to its e-th power; its bundled homomorphism laws give preservation of the identity and multiplication.
- `RelativeJacobian.TailMultiplication.represented`: The morphism D represents D_T: the tuple q followed by D is the tuple D_T(q).
- `RelativeJacobian.TailMultiplication.natural`: D_{T′}(h*q)=h*D_T(q) for every h:T′→T, where h* means precomposition in each coordinate.
- `RelativeJacobian.TailMultiplication.baseChange`: The image of D under S′→S agrees with the D of A_{S′} after the canonical finite-product comparison.

**Checks for the represented-point homomorphism.**

- `RelativeJacobian.TailMultiplication.points.test_double` (computation): At e=2, D_T(a,b)=(a,b²); the head is not squared.
- `RelativeJacobian.TailMultiplication.points.test_negative` (computation): At e=−1, D_T fixes the head and inverts every tail.
- `RelativeJacobian.TailMultiplication.points.test_zero` (degenerate): At e=0, D_T fixes the head and replaces every tail by the identity; zero multiplication is not treated as a general isogeny.

**Checks.**

- For m=1 D is identity. In characteristic dividing 2g−2, D is finite but need not be étale.

*Needs:* §5.5; §5.4; §2.2; AbelianSchemesAndArithmeticModuli:A3.

### Examples

For m=1, the shifted Faltings–Zhang map is its single canonical-shift coordinate. For m=2, its tail is j(x₁,x₂), with no 2g−2 factor. The triangular change on the full shifted canonical power introduces that factor only through D. A one-factor triangular change is identity, and an empty tail makes D identity for every integer exponent. The represented-point checks include e=−1, 0 and 1; e=0 collapses a nonempty tail. The two-factor inverse restores (f,g/f) to (f,g), fixing the right-hand multiplication order (§5.2–§5.6).

### Dependencies

Layer 2 supplies the degree-d Abel map and curve difference; Layers 1 and 3 supply their base-change comparisons and canonical normalization. AbelianSchemesAndArithmeticModuli A1 supplies relative products and A3 finite locally free nonzero multiplication. Mathlib’s group objects and finite products give the native companions. The factorization uses the explicit canonical-Abel difference identity before transferring properties of multiplication to tail powers.

## Layer 6: Stable Hodge bundles and determinant lines

Use the stable connected nodal hypotheses stated in the introduction. R11.4 supplies the semi-abelian Picard identity component G. StableReduction Layer 2 supplies the nodal Gorenstein dualizing sheaf and coherent-curve base change. The infinitesimal Picard calculation identifies Lie(G/S) with R¹π_*O_X. Dualizing it identifies the curve Hodge bundle with invariant differentials at the identity of G.

Both sheaves have rank g. Apply the determinant functor and its coherent pullback comparisons from AlgebraicVectorBundles L0C to the actual rank-g comparison isomorphism. A determinant-line comparison without that specified vector-bundle map would lose its canonicity. The semi-abelian degeneration is allowed: properness of G is not a hypothesis.

### 6.1 Picard Lie algebra and coherent cohomology

For an integral noetherian S and a stable connected nodal genus-g>1 family π:X→S, let G=Pic⁰_{X/S} be the smooth separated semi-abelian group supplied by Néron R11.4. There is a canonical O_S-linear isomorphism Lie(G/S)≅R¹π_*O_X, compatible with base change. (Bosch–Lütkebohmert–Raynaud, §8.4 Theorem 1(a) and proof pp. 231–232; §9.4 Theorem 1 p. 259; [Yuan](https://arxiv.org/pdf/2108.05625v4), Lemma 3.4 proof p. 44.)

Here S is integral and noetherian; π:X→S is a proper flat finitely presented stable connected nodal curve of constant arithmetic genus g>1. G=Pic⁰_{X/S} is the smooth separated semi-abelian generalized Jacobian, and the relative-duality/base-change isomorphisms of Layer 6 are fixed.

Verify O_S≅π_*O_X universally for the stable connected reduced fibres. For the dual-number extension use 1+εO_X to identify the infinitesimal Picard kernel with H¹(O_X). Apply BLR8.4/1 to the represented Picard space and restrict to its open identity component.

**Checks.**

- An irreducible one-node fibre has the Lie algebra of its semi-abelian generalized Jacobian, not of an abelian scheme.

*Needs:* NeronModelsAndSemistableAbelianVarieties:R11.4; JacobianChallenge, Layer C; `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`; StableReduction, Layer 2.

### 6.2 Curve and Jacobian Hodge bundles

Under the hypotheses of the Picard Lie comparison, relative duality gives π_*ω_{X/S}≅e*Ω¹_{G/S}. Both are locally free of rank g and commute with the allowed base changes; the right side uses invariant differentials of the semi-abelian G. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Lemma 3.4 and proof pp. 43–44.)

Here S is integral and noetherian; π:X→S is a proper flat finitely presented stable connected nodal curve of constant arithmetic genus g>1. G=Pic⁰_{X/S} is the smooth separated semi-abelian generalized Jacobian, and the relative-duality/base-change isomorphisms of Layer 6 are fixed.

Dualize the Lie/cohomology isomorphism. Apply relative Serre duality for the stable Gorenstein curve to identify (R¹π_*O_X)∨ with π_*ω_{X/S}. Identify the dual Lie sheaf with invariant differentials at e.

*Needs:* §6.1; JacobianChallenge, Layer C; NeronModelsAndSemistableAbelianVarieties:R11.4; StableReduction, Layer 2; AlgebraicVectorBundles:L0B.

### 6.3 Curve–Jacobian Hodge line isomorphism

For the same stable family, λ_X:=det(π_*ω_{X/S}) is canonically isomorphic to det(e*Ω¹_{G/S}); the isomorphism is the determinant of the vector-bundle comparison and is compatible with its base-change isomorphisms. ([Yuan](https://arxiv.org/pdf/2108.05625v4), Lemma 3.4 and proof pp. 43–44.)

Here S is integral and noetherian; π:X→S is a proper flat finitely presented stable connected nodal curve of constant arithmetic genus g>1. G=Pic⁰_{X/S} is the smooth separated semi-abelian generalized Jacobian, and the relative-duality/base-change isomorphisms of Layer 6 are fixed.

Take the determinant of the identified rank-g locally free sheaves. Use functoriality of determinant on the actual comparison map. Keep the analytic metric equality outside this algebraic roadmap.

**Checks.**

- For a smooth fibre this recovers the abelian Jacobian Hodge line. For a one-nodal stable fibre G is semi-abelian and the determinant still has rank-g input.

Pulling back the determinant isomorphism agrees with taking the determinant after pulling back the rank-g isomorphism.

*Needs:* §6.2; AlgebraicVectorBundles:L0C.

### Examples

A smooth fibre recovers the usual abelian Jacobian Hodge bundle. For an irreducible one-nodal fibre, the generalized Jacobian has a torus and the invariant-differential comparison still has rank equal to arithmetic genus. For a compact-type reducible fibre, the toric rank is zero and the Hodge comparison is still the prescribed rank-g comparison before taking determinants. These cases test why this layer uses the semi-abelian carrier (§6.1–§6.3).

### Dependencies

NeronModelsAndSemistableAbelianVarieties R11.4 supplies the smooth separated semi-abelian Picard identity component. JacobianChallenge Layer C and StableReduction Layer 2 supply nodal coherent cohomology, Gorenstein duality and base change. AlgebraicVectorBundles L0B–L0C supply finite locally free duals and determinants. Tau Ceti’s module-sheaf cohomology supplies the cohomological vocabulary. The rank-g comparison precedes its determinant.

## Layer 7: Universal level applications

Fix g≥2, ℓ≥3 and the full symplectic component over Z[1/ℓ,ζ_ℓ]. MC.4 supplies a smooth quasi-projective fine curve scheme of relative dimension 3g−3 with its smooth projective universal curve. Its chosen root and pairing convention determine the component and the level on the Jacobian. The rational characteristic-zero instance in DGH is a specialization of this input; it does not itself prove the integral fine-level representability statement.

Apply Layers 0–3 on this noetherian universal base, then pull back to arbitrary S mapping to it. This order permits arbitrary nonnoetherian pullbacks while retaining the exact noetherian scope of the original family theorem. Since MC.4 constructs level using the generic Jacobian, its dependency enters only this final application. Every Faltings–Zhang coordinate is inherited from Layer 5; the choice of a field point is needed only for the pointed fibre specialization.

### 7.1 Universal Jacobian with full level

Fix g≥2, ℓ≥3 invertible on the base, and the same pairing component and cyclotomic convention as the imported fine-level curve scheme. Apply Layers 0–3 to its smooth projective universal curve: obtain Pic=⨆_d Picᵈ, the principally polarized J, its induced full symplectic level-ℓ structure, and the section-free C→Pic¹ morphism. ([Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 pp. 23–24, universal relative Jacobian and equation(6.1).)

Use the exact base, pairing component and level flavour of StableReductionPartII MC.4/full-level and fine-level-scheme.

Read the full-level datum as an identification of the curve Jacobian ℓ-torsion with the fixed standard paired group. Apply the relative Jacobian and polarization with the same flavour of Weil pairing. Keep the fine-level curve scheme as a downstream application, so its existing need for curve Jacobians cannot produce an earlier-stage cycle.

**Checks.**

- A universal family is pulled from the fine scheme, not inserted on an arbitrary coarse space. For ℓ noninvertible this étale full-level application is not asserted.

*Needs:* §1.2; §1.4; §2.1; AbelianSchemesAndArithmeticModuli:A3; StableReductionPartII:MC.4 (fine-level-scheme); StableReductionPartII:MC.4 (full-level).

### 7.2 Faltings–Zhang for the universal curve

For every S→M_g[ℓ] in the chosen level convention and m≥1, base change the universal curve and its Jacobian. FZ_m:C_S^{m+1}→J_S^m is a morphism over S. On a field fibre with P₀∈C(k), fixing its first coordinate gives the m-fold pointed Abel embedding C−P₀. ([Dimitrov–Gao–Habegger](https://arxiv.org/pdf/2001.10276v3), §6.1 equation(6.3) and base change equation(6.5) p. 25.)

Assume g≥2, ℓ≥3 invertible on the base, and the fixed symplectic component over ℤ[1/ℓ,ζ_ℓ] of the imported fine-level curve scheme; S→M_g[ℓ] is arbitrary and m≥1. The smooth universal curve and its Jacobian are pulled back to S; S need not be noetherian.

Use the arbitrary-base-change comparisons of the generic construction. Apply the coordinate formula with the chosen field point only in the fibre specialization.

*Needs:* §7.1; §5.3; §1.3.

### Examples

On a field fibre with a specified P₀, fixing the first coordinate of FZ_m gives the tuple of pointed Abel images relative to P₀. Before choosing P₀, the section-free universal difference still exists. Pulling the family back to a nonnoetherian or nonreduced S uses the already constructed base-change comparisons. A noninvertible level, or a full similitude datum with a varying pairing component, fails the fine-level hypotheses (§7.1–§7.2).

### Dependencies

Layers 0–3 supply the section-free principally polarized relative Jacobian; Layer 5 supplies Faltings–Zhang and its base change. AbelianSchemesAndArithmeticModuli A3 supplies torsion and the pairing interface. StableReductionPartII MC.4/full-level and fine-level-scheme supply the exact cyclotomic symplectic component and universal curve. This dependency is confined to the final application.

## Worked examples

A genus-one torsor without a rational point must still admit its canonical C→Pic¹_C map. A pointed genus-one curve identifies its Jacobian with the elliptic curve and j(x,y) with y−x; changing the sign of one difference breaks the triangle relation. An actual degree-zero bundle produces a constant degree-zero Abel map, so the finite-map theorem must retain d≠0. Characteristic-p multiplication can be inseparable while remaining finite.

On the elliptic Jacobian the positive canonical Θ has degree two, whereas Δ*P has negative degree. Twisting P by a nontrivial bundle from S must fail its specified axis normalization. An arbitrary translated theta divisor remains nonsymmetric: the doubling formula keeps both θ and its inverse pullback. The identities must survive dual-number base change as morphism or rigidified-bundle identities, not merely as equalities on the underlying geometric fibre.

A class pulled from S remains present in the actual Picard subgroups. It disappears only in the separately stated quotient comparison. In a square C×C, a positive-degree pullback from one factor fails the other projection's algebraic-triviality condition. A nontrivial degree-zero class pulled from one factor can lie in Pic⁰⁰ while failing an axis-normalized condition. These examples distinguish the three Picard notions used in Layer 4.

For m=1 the shifted Faltings–Zhang map has only its first canonical-shift coordinate. For m=2 its tail is x₂−x₁ without a 2g−2 factor. Applying triangular coordinates to the tuple of all shifted canonical Abel images introduces that factor only in the tail-isogeny D. The coordinate change and its inverse commute with precomposition of actual test-scheme morphisms.

In a stable nodal family, invariant differentials use the generalized semi-abelian Jacobian and the rank equals arithmetic genus. The Hodge-line comparison is the determinant of the prescribed rank-g comparison. In the fine-level application keep the root, exact Weil pairing and component fixed throughout pullback. The full similitude functor obtained by forgetting the root is a different moduli problem.

## Downstream consumers

The conclusion of Layers 0–5 is a base-change-compatible construction of relative Jacobians, their degree torsors and normalized geometric morphisms. Layer 6 compares stable-family Hodge objects using the existing nodal and vector-bundle owners. Layer 7 applies the construction to a fine-level universal curve supplied elsewhere. The generic construction uses no curve-moduli scheme. The named arithmetic papers supply the geometric identities and applications motivating these targets; the arithmetic metric and nondegeneracy theorems require their own hypotheses and developments.

## References

- Xinyi Yuan, [*Arithmetic bigness and a uniform Bogomolov-type result*, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4), dated 30 April 2024, 125 pages. All Yuan locators above refer to this version: §2.2.1–2.2.2, pp. 29–32; Theorem 2.10 and proof, pp. 37–39; Lemma 3.4 and proof, pp. 43–44; §4.6.2, pp. 96–98; §A.3, p. 108; §A.4, Theorem A.3 and proof, pp. 109–110. Published as [Annals of Mathematics 203 (2026), 15–119](https://annals.math.princeton.edu/2026/203-1/p02); these arXiv page numbers are not publisher page numbers.
- Vesselin Dimitrov, Ziyang Gao and Philipp Habegger, [*Uniformity in Mordell–Lang for curves*, arXiv:2001.10276v3](https://arxiv.org/pdf/2001.10276v3), §6.1, pp. 23–25, especially (6.3) and (6.5). These locators use the 49-page arXiv version.
- Siegfried Bosch, Werner Lütkebohmert and Michel Raynaud, *Néron Models*, Springer, 1990. Locators use printed pages: §8.1, pp. 202–205 (Leray and Proposition 4); §8.4, Theorem 1 and proof, pp. 231–232; §9.3, Theorem 1 and proof, p. 252; §9.4, Theorem 1, p. 259 and Proposition 4, pp. 260–261. The relative representability/properness route uses the auxiliary results cited by those proofs.
- J. S. Milne, [*Jacobian Varieties*, notes dated 12 June 2021](https://www.jmilne.org/math/xnotes/JVs.pdf), §8, Theorem 8.1 and the family/base-change discussion, pp. 27–28. This gives the family context and the distinction between actual classes and relative sections. Use the exact supplier scope for every family theorem above.
