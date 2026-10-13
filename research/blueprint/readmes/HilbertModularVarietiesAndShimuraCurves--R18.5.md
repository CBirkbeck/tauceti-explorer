# Hilbert modular varieties and Shimura curves: bad-prime uniformisation

This part constructs the local geometry used to uniformise compact quaternionic Shimura curves at a division prime. The half-plane, its formal model and special formal-module interpretation lead to the maximal-level formal theorem, the rigid tower theorem and the arithmetic description of special-fibre graphs. The geometric output is designed for cohomology, level change and monodromy. It does not supply modularity lifting, potential modularity or local–global compatibility.

R18.5 owns these arithmetic identifications. It imports the Bruhat–Tits tree from `ReductiveGroupsPartII:RG2.2`, generic formal/rigid machinery from `AdicSpacesPartII:R2`, generic curve and model theory from StableReduction, and generic Jacobian character/monodromy theory from `NeronModelsAndSemistableAbelianVarieties:R11.4`. A quaternionic quotient is an application of those theories, not a second construction of them. R18.6 is an export index: it introduces no object, theorem or planet.

The twelve underlying R18.5 targets belong to the [R18.2 specification](HilbertModularVarietiesAndShimuraCurves--R18.2.md). They are restated below to make the mathematical specification readable on its own; their IDs and ownership remain there. This continuation owns exactly nine refinements: `PelHeightLattice`, `VeryFreeChartAction`, `VeryFreeChartAction.smallTameLevel` (added by the independent review), `VeryFreeDrinfeldQuotient`, `AuxiliaryPelLocalFactors`, `QuaternionicPelUniformisationTransfer`, `SplitPlaceDescentBoundary`, `DrinfeldLevelStructureComparison` and `WeightedArithmeticQuotientGraph`. Each target below distinguishes its owner. The division-prime transfer route supplies the source-specific refinement of the existing totally-real theorem. It does not assume the split-place comparison.

## Conventions and common hypotheses

Let K be a finite extension of Q_p, O its ring of integers, π a uniformizer, k its residue field and q=|k|. Write Ǩ for the completed maximal unramified extension and C for the completed algebraic closure. Valuations are normalized by ord_K(π)=1. Formal schemes are π-adic and the moduli functors are evaluated on π-nilpotent bases. Rigid scalar extension from K to C leaves the removed rational set P¹(K) fixed. It does not turn the half-plane into P¹_C minus P¹(C).

The local division quaternion algebra is D/K, with maximal order O_D and division uniformizer Π; Π² is a unit times π. The unramified quadratic order O₂ is embedded in O_D. A strict O-module has structural O action on its Lie algebra. Relative O-height is used throughout; absolute p-height multiplies it by [K:Q_p]. The chosen framing arrow follows Boutot–Zink: a special-fibre quasi-isogeny from the variable object to the fixed object. Boutot–Carayol reverses that arrow. Comparisons invert it and change height signs accordingly.

Globally, F is totally real, B/F is split at exactly one real place τ and division at v|p. Its invariant exchange B̌ is definite at every real place and split at v, and agrees with B elsewhere. We use the fixed local and away-v identifications of the sources. The reflex field is E=τ(F), and the relevant completion E_ν is identified with F_v. The distinguished local level for the formal theorem is O_B,v×, and statements with these hypotheses do not quantify over other levels at v. At the other places p_i over p the quaternionic levels are arbitrary open compact subgroups of the units of the chosen maximal orders (Boutot–Zink p.3 and (6.29), p.46), and the auxiliary PEL level is built from them in the form (4.6), with multiplier groups O^×_{F,p_i}, as in (6.31), p.46.

All quotient group actions in the geometry are effective. Central scalars act trivially on P¹ and on the tree; they are removed before testing vertex freeness or chart separation. A dual graph is a multigraph with branches: distinct edges and loops are retained. An edge fixed by reversal in a finite arithmetic quotient is treated by Kurihara's deletion operation, not turned into a loop. Choose one orientation per retained unoriented edge when writing a cycle pairing.

For Frobenius, τ_c=Spf(τ⁻¹) is the inverse base automorphism used in Boutot–Zink. Arithmetic descent on the quaternionic quotient includes right multiplication by Π⁻¹ on its finite-adelic factor. This is separate from the normalized PGL₂ action on the height-zero local space. No assertion below replaces the completed maximal unramified field by a finite extension.

## R18.5 — targets and proof routes

The order below is a construction order. Local objects precede quotient geometry; the division-prime PEL transfer precedes the tower comparison. The chart-separation predicate only needs a given group action on the tree. It does not require the quotient theorem it helps prove. The level-structure comparison does not assume the all-level uniformisation theorem: it is the input that makes that theorem a statement about one compatible tower.


### 1. Drinfeld upper half-plane — `DrinfeldHalfPlane`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-half-plane`. **Owner:** the R18.2 specification; imported here.

**Statement.** The Drinfeld half-plane Ω_K is the rigid analytic open P¹_K\P¹(K), formed by removing the K-rational analytic points. Ω_K(C)=P¹(C)\P¹(K)=C\K in the affine chart with infinity removed. PGL₂(K) acts by homographies. This is not the algebraic complement of a Zariski-closed subscheme P¹(K). The affinoid exhaustion supplies its actual analytic open structure.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Prerequisites.** `AdicSpacesPartII:R2/generic-fibre-functor-d`, `ReductiveGroupsPartII:RG2.2`.

**Construction or proof.**

1. Construct the standard rational affinoids in P¹ using the imported analytic geometry.
2. Glue their increasing open union and prove its C-point description.
3. Use homographies to transport rational affinoids and descend the centre-trivial GL₂ action.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part I §§1–2, pp.49–53. Analytic structure from the Bruhat–Tits norm map.

**Source.** [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §1.2, pp.12–13. Actual analytic complement, not a scheme complement.

**Uses.**

- `Čerednik–Drinfeld uniformisation`: The analytic local factor of the quaternionic curve.
- `CDN20 §§1.2,5.2`: Provides the actual local geometry and its tower.

**API.**

| Name | Contract |
| --- | --- |
| `DrinfeldHalfPlane.points` | Its C-points are P¹(C) minus P¹(K). |
| `DrinfeldHalfPlane.homography` | PGL₂(K) acts through the usual fractional linear formula. |
| `DrinfeldHalfPlane.affineChart` | The affine chart identifies the C-points with C minus K. |
| `DrinfeldHalfPlane.baseChange` | Scalar extension identifies the Ω_K affinoid exhaustion with its C-exhaustion; it does not replace the removed set by P¹(C). |

**Unit tests.**

- `DrinfeldHalfPlane.infinity` (degenerate): The point infinity is excluded.
- `DrinfeldHalfPlane.quadraticPoint` (example): For z∈K₂\K in a quadratic extension, z lies in Ω_K(C).
- `DrinfeldHalfPlane.scalarAction` (compatibility): Every central scalar in GL₂(K) acts trivially.
- `DrinfeldHalfPlane.algebraicComplement` (non-example): Removing finitely many K-rational points is insufficient: all P¹(K) must be excluded.

**Check.** For K=Q_p, infinity and every z in Q_p are removed, whereas any z in an unramified quadratic extension outside Q_p remains. A scalar matrix acts as the identity on that z. A finite collection of excluded points gives a different analytic space: another rational point survives. The algebraic Zariski closure of the removed infinite set is all of P¹, so a scheme-theoretic complement is not this definition.

**Acceptance.**

- Infinity is a K-rational point and is excluded.
- A point in a quadratic extension not in K belongs to Ω.

### 2. Affinoid exhaustion and tree reduction — `DrinfeldExhaustion`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction`. **Owner:** the R18.2 specification; imported here.

**Statement.** For n≥1, set P_n=P¹(O_K/π^n) and U_n=P¹_C minus the union of open balls centered at P_n of radius |π|^n in the standard projective metric. These affinoids increase to Ω_C. The norm-class reduction r:Ω_C→|T_K| is PGL₂(K)-equivariant, and U_n is the inverse image of the closed tree ball of radius n about the standard vertex. Tree vertices are homothety classes of rank-two lattices; adjacent representatives satisfy πL⊊L′⊊L.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-half-plane`, `ReductiveGroupsPartII:RG2.2`.

**Construction or proof.**

1. Import the GL₂ Bruhat–Tits tree specialization, including the norm-class realization.
2. Compute vertex/edge affinoids using the two adjacent lattice bases.
3. Identify the finite-ball inverse images and prove increasing exhaustive union.

**Source.** [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §1.2, p.12. Explicit affinoids and equivariant reduction.

**Uses.**

- `CDN20 §1.2`: Controls explicit affinoids and integral functions.
- `R18.5 graph identification`: Provides the tree indexing of components and nodes.

**API.**

| Name | Contract |
| --- | --- |
| `DrinfeldExhaustion.affinoid` | Each U_n descends from an affinoid over K. |
| `DrinfeldExhaustion.increasing` | U_n⊂U_{n+1} and their union is Ω_C. |
| `DrinfeldExhaustion.treeBall` | U_n=r⁻¹ of the radius-n tree ball. |
| `DrinfeldExhaustion.equivariant` | r(gz)=g r(z) for g∈PGL₂(K). |

**Unit tests.**

- `DrinfeldExhaustion.residueTwo` (computation): For q=2 a vertex has 3 incident edges.
- `DrinfeldExhaustion.firstSphere` (computation): The radius-one tree ball has q+2 vertices.
- `DrinfeldExhaustion.centralScalar` (compatibility): Scaling a lattice changes neither its vertex nor the reduction class.

**Check.** The projective residue set has (q+1)q^(n−1) elements for n≥1: the primitive pairs modulo π^n, divided by the unit action. For n=1 this is q+1, matching the outward branches from the standard vertex. The radius-one tree ball has the central vertex and these q+1 neighbours, hence q+2 vertices. At q=2 this gives three branches and four vertices. Changing the base lattice moves the finite-radius affinoids but preserves the full union and the equivariant reduction map. The finite affine charts must not be confused with the whole tree-indexed model.

**Acceptance.**

- Every tree vertex has q+1 incident edges, in bijection with P¹(k).
- U_n depends on the chosen central vertex; Ω and its full group action do not.

### 3. Standard Drinfeld formal model — `DrinfeldFormalModel`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`. **Owner:** the R18.2 specification; imported here.

**Statement.** Start with X₀=P¹_O_K and form X_n by blowing up every smooth k-rational special-fibre point of X_{n−1}; take the π-adic completions. Remove the smooth k-rational points from X_n to form the formal open Ũ_n. Then Ũ_n⊂Ũ_{n+1}, its generic fibre is U_n,K, and Ω̂=⋃Ũ_n is a flat regular semistable formal model of Ω_K. Its components are P¹_k indexed by tree vertices and its nodes by tree edges, locally xy=π. The full GL₂(K) action factors through PGL₂(K).

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction`, `AdicSpacesPartII:R2/admissible-blow-up`, `AdicSpacesPartII:R2/generic-fibre-inverts-admissible-blow-ups`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Construction or proof.**

1. Use the existing admissible blow-up and generic-fibre-invariance API.
2. Compute the exceptional and strict-transform components and edge charts.
3. Glue formal opens, not an inverse limit of the projective blow-up models; extend the group action through lattice charts.

**Source.** [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §1.2, pp.12–13. Iterated blow-ups and union of formal opens.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part I §3, pp.53–56. Lattice/edge charts for the standard model.

**Uses.**

- `Boutot–Carayol II §8 and BZ Theorem 6.7`: Represents local moduli and uniformizes integral curves.
- `CDN20 §1.2`: Actual formal model underlying its reduction/exhaustion.

**API.**

| Name | Contract |
| --- | --- |
| `DrinfeldFormalModel.genericFibre` | The generic fibre of Ω̂ is Ω_K. |
| `DrinfeldFormalModel.nodeChart` | At an edge the completed local equation is xy=π. |
| `DrinfeldFormalModel.components` | Special-fibre components and nodes identify with tree vertices and edges. |
| `DrinfeldFormalModel.action` | The PGL₂(K) action extends the analytic homography action. |

**Unit tests.**

- `DrinfeldFormalModel.centralComponent` (compatibility): The initial vertex component is P¹_k with its q+1 rational attaching points.
- `DrinfeldFormalModel.qTwo` (computation): For q=2 each component meets three branches in the full model.
- `DrinfeldFormalModel.ramifiedNode` (non-example): For e=2, xy=π′² is a singular total-space local ring; regularity is not preserved.

**Check.** An ordinary edge chart has completed equation xy=π. Its special fibre has two smooth branches meeting once, and its total space is regular. After a ramified extension of index e, the equation is xy=uπ_L^e for a unit u. For e>1 the maximal ideal has three independent generators modulo its square in a two-dimensional total local ring, so regularity fails. The reduced nodal special fibre alone cannot establish regularity of the model. At finite radius the boundary components have not acquired every branch; q+1 valence applies to the full open union. Use the existing blow-up and node APIs; only the tree-indexed arithmetic specialization is a target here.

**Acceptance.**

- At finite radius the outermost components have smaller valence; only the full tree has valence q+1 everywhere.
- The node xy=π is regular; ramified base change gives xy=π′^e and is not regular for e>1.

### 4. Special formal quaternionic moduli — `SpecialFormalModuli`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli`. **Owner:** the R18.2 specification; imported here.

**Statement.** Let D/K be the local division quaternion algebra, O_D its maximal order containing the unramified quadratic order O₂. A strict special formal O_D-module X over a π-nilpotent O_Ǩ-scheme has O_K-height 4 and Lie(X) locally free of rank one over O₂⊗O_K O_S (hence rank two over O_S), with strict O_K action. Fix a framing Φ over kbar. The functor M_Dr(0) classifies (X,ρ) where ρ:X_Sbar→Φ_Sbar is an O_D-linear quasi-isogeny of relative height zero, modulo compatible isomorphism. M̃ allows heights 2m, m∈Z. BC uses the inverse framing arrow; invert it when comparing conventions.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- The strict formal-module and relative height carriers are supplied by R07.1–R07.2.

**Prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Construction or proof.**

1. Specialize the generic p-divisible/Cartier-module carrier with the O_D action and special Lie condition.
2. Form the isomorphism-class functor with height-zero framing.
3. Check base change, arrow reversal and the locally constant relative-height components.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part II §§2, 5.16, Definition 8.1, pp.79–84, 97–98, 107. Local functor and BC framing direction.

**Source.** [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), §5, pp.38–39, (5.18)–(5.20). Relative height and framing direction used here.

**Uses.**

- `Drinfeld representability and BZ §5`: Determines the true local moduli problem and the component action.
- `R18.2 integral-pdiv`: Supplies the division-prime deformation interpretation.

**API.**

| Name | Contract |
| --- | --- |
| `SpecialFormalModuli.specialLie` | Lie is rank one over O₂⊗O_S. |
| `SpecialFormalModuli.baseChange` | Pull back X and its special-fibre framing along every nilpotent-base map. |
| `SpecialFormalModuli.framingAction` | A framing quasi-isogeny δ acts by δ∘ρ. |
| `SpecialFormalModuli.heightComponents` | The arbitrary-height functor decomposes into the height-2m components. |

**Unit tests.**

- `SpecialFormalModuli.heightZero` (degenerate): The framing object with identity ρ lies in M_Dr(0).
- `SpecialFormalModuli.absoluteHeight` (computation): When [K:Q_p]=2 the absolute p-height is 8.
- `SpecialFormalModuli.wrongLie` (non-example): An O_D-module whose Lie O₂ action has ranks (2,0) is not special.

**Check.** The framing object with its identity arrow has relative height zero. The underlying p-divisible group has absolute p-height 4[K:Q_p]; it has height eight when [K:Q_p]=2. Over a base splitting O₂, the two Lie eigenspaces have ranks (1,1). An object with ranks (2,0) is not special, although its total Lie rank is two. Thus neither total dimension nor an unstructured p-divisible-group carrier determines the moduli functor. The source's strictness, action, frame and relative-height conditions are all required.

**Acceptance.**

- Absolute p-height is 4[K:Q_p], not 4 for ramified or higher-degree K.
- Dropping the special Lie condition gives the wrong moduli problem.

### 5. Drinfeld representability theorem — `DrinfeldRepresentability`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`. **Owner:** the R18.2 specification; imported here.

**Statement.** The special formal O_D-module functor M_Dr(0) is represented by Ω̂⊗O_K O_Ǩ. The equivalence is functorial on π-nilpotent bases, not just a bijection on geometric points, and identifies the universal special formal module. The group of framing quasi-isogenies is GL₂(K); on height zero the normalized action factors through PGL₂(K).

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Strict special modules, fixed frame and arrow convention as above.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Construction or proof.**

1. Use Dieudonné–Cartier theory to construct the rank-two lattice/sheaf data and its critical-index filtration.
2. Compare with the lattice-chart functor representing Ω̂, using BC II §§5–8.
3. Prove both natural transformations inverse on nilpotent bases and match the universal object/actions.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part II Theorems 8.2,8.4, pp.107–109. Actual functorial local theorem.

**Check.** The universal special module must pull back to each nilpotent-base object, and an isomorphism between objects must produce the same moduli point. It is insufficient to classify objects over the algebraic closure of k. The raw framing group acts on all height components; the height-zero action uses the correction explained in `HeightAndDescent`. The current generic algebraic-scheme carrier does not provide a formal representing object or its universal module.

**Acceptance.**

- A geometric point classification alone does not prove representability.
- The central scalar action on height zero must be normalized before factoring through PGL₂.

### 6. Height action and Frobenius descent — `HeightAndDescent`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/height-and-descent`. **Owner:** the R18.2 specification; imported here.

**Statement.** Normalize arbitrary-height M̃_Dr≅M_Dr(0)×Z by a division uniformizer Π and its Hecke shift h(Π). Under BZ §5.9, δ∈GL₂(K) acts by (ω,m)↦(pr(δ)ω,m+ord_K det δ), where pr(δ)=h(Π)^{−ord det δ}δ on height zero. The product identification is independent of Π. For arithmetic descent use τ_c=Spf τ⁻¹ and the separate right Π⁻¹ Hecke translation in Theorem 6.7; do not conflate this translation with the normalized PGL₂ action.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`.

**Construction or proof.**

1. Identify each height component with height zero using h(Π).
2. Compute the valuation shift and central scalar correction.
3. Compare the Frobenius twist diagram with BZ 6.7 using contravariance of Spf.

**Source.** [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), Proposition 5.9, p.39; Theorem 6.7, p.49. Separate height and Weil descent actions.

**Check.** A scalar πI has determinant valuation two. It shifts the integer component by two and has trivial normalized action on Ω̂. A division uniformizer's Hecke shift changes the component index by one, corresponding to relative height two of the special formal-module quasi-isogeny. Changing Π must give the same product identification in Proposition 5.9. The separate Π⁻¹ in the Weil datum must survive this independence; it cannot be replaced by Π by appealing to the central-trivial projective action.

**Acceptance.**

- A scalar πI has determinant valuation 2 and shifts the height index by 2 even though its normalized Ω action is trivial.
- Replacing Π⁻¹ by Π reverses the displayed descent convention.

### 7. Auxiliary PEL height lattice — `PelHeightLattice`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/pel-height-lattice`. **Owner:** this continuation.

**Statement.** The height labels of the distinguished auxiliary PEL local factor form Lambda = {(a,b) in Z squared : 2 divides a+b}, with componentwise addition. Quaternionic height m embeds as (m,m). The difference character (a,b) maps to (a-b)/2; its kernel in Lambda is the diagonal and it identifies Lambda modulo the diagonal with Z. Both coordinates are half the corresponding relative quasi-isogeny heights, in the conventions of BZ (5.13) and (5.23).

**Hypotheses.**

- K is a finite extension of Q_p, with integers O, uniformizer pi, residue field k of size q, and completed maximal unramified extension Kcheck. Formal and rigid carriers are imported, not supplied by an algebraic scheme carrier.
- Use the polarized paired q0 and conjugate-q0 factors of BZ, with the BZ framing arrow Y_bar to X_bar. These two integer labels are not absolute p-heights.

**Prerequisites.** `mathlib:AddSubgroup`, `HilbertModularVarietiesAndShimuraCurves:R18.5/height-and-descent`.

**Construction or proof.**

1. Use the polarization relation to impose parity of the two half-heights.
2. Apply the height translations in BZ (5.15) to identify the components with the height-zero component times Lambda.
3. Check the diagonal embedding in (6.39). For the quotient description, use a-b even; (r,-r) maps to r and zero difference forces a=b.

**Source.** [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), §5, (5.10) and (5.12), pp.36–37; (5.13), (5.15), (5.23), Proposition 5.11, pp.37–40; §6, (6.39), p.48. (5.10) labels the open and closed pieces RZ(a,b) by half the relative heights of the two quasi-isogeny components, (5.12) shows a+b is even, (5.23) writes RZ as RZ(0,0) times Lambda, and (6.39) maps the quaternionic heights diagonally into Lambda; the difference-character quotient is an elementary consequence.

**Uses.**

- `BZ Proposition 5.11 and (6.39)`: Separates auxiliary PEL components from the diagonal quaternionic subspace.
- `HilbertModularVarietiesAndShimuraCurves:R18.5/auxiliary-pel-local-factors`: Pins the source and target labels and the corrected Frobenius translation.

**API.**

| Name | Contract |
| --- | --- |
| `PelHeightLattice.mem` | A pair (a,b) is in Lambda exactly when 2 divides a+b. |
| `PelHeightLattice.add` | Lambda is closed under componentwise addition, contains zero and is closed under negation, agreeing with the existing additive-subgroup vocabulary. |
| `PelHeightLattice.diagonal` | For every m in Z, (m,m) is in Lambda; the map is injective and additive. |
| `PelHeightLattice.difference` | On Lambda the integer (a-b)/2 is additive, surjective and has kernel the diagonal. |

**Unit tests.**

- `PelHeightLattice.oddPair` (non-example): (1,0) is not a permitted label; using all of Z squared fails.
- `PelHeightLattice.oppositePair` (example): (1,-1) is permitted and has difference character 1; using only the diagonal fails.
- `PelHeightLattice.negativeDiagonal` (example): (-1,-1) is permitted and has difference zero; using nonnegative heights fails.
- `PelHeightLattice.translation` (compatibility): Adding (1,1) preserves Lambda and the difference character; changing only one coordinate by 1 does not preserve Lambda.

**Check.** Parity of a+b equals parity of a−b, so the displayed difference is an integer on Λ. For addition it is the ordinary additive difference divided by two, hence additive on Λ. For any r, (r,−r) is in Λ and maps to r; its kernel consists of pairs (m,m). This proves the quotient description without identifying Λ with just the diagonal. The pair (1,−1) has difference one; adding the descent shift (1,1) gives (2,0), also of difference one. Adding only (1,0) would give (2,−1), whose odd sum is forbidden. Negative diagonal labels are essential, because quasi-isogenies need not have nonnegative height.

**Signature correspondence.** The suggested file gives Λ as Mathlib's additive subgroup of ℤ×ℤ (an `AddSubgroup` with its closure proofs written out), its diagonal map and integer-division difference. Its terminal `difference_contract` groups the additive, surjective, kernel and diagonal assertions. It does not construct a PEL moduli carrier. The additive-subgroup API is imported from Mathlib rather than reconstructed.

**Acceptance.**

- (1,0) is excluded; (1,-1) is included.
- The diagonal contains negative heights and is a proper subgroup of Lambda.

### 8. Local factors of the auxiliary quaternionic PEL space — `AuxiliaryPelLocalFactors`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/auxiliary-pel-local-factors`. **Owner:** this continuation.

**Statement.** For the precise BZ auxiliary PEL datum and chosen compatible framing object, the distinguished local RZ functor is OmegaHat_K over O_Kcheck times Lambda. The other p_i local RZ functors, with their prescribed rigidifications, are constant sheaves Gbullet_pi/Kbullet_pi, after the choice (5.7). Thus the global local factor is the product of the distinguished factor and these discrete coset factors. On (omega,(a,b)), a framing quasi-isogeny (delta1,delta2) acts by (pr(delta1)omega,(a+ord det delta1,b+ord det delta2)), with scalar-product constraint delta1 delta2 in K times. The corrected Weil datum in BZ Theorem 6.3 translates the distinguished labels by (1,1); its conversion to the theorem’s inverse base automorphism is right multiplication by Pi inverse on the finite-adelic factor.

**Hypotheses.**

- K is a finite extension of Q_p, with integers O, uniformizer pi, residue field k of size q, and completed maximal unramified extension Kcheck. Formal and rigid carriers are imported, not supplied by an algebraic scheme carrier.
- F is totally real; B is split at exactly one real place tau and division at v above p. Bcheck exchanges the invariants at tau and v and agrees elsewhere. Use the BZ auxiliary CM extension, hermitian datum, embeddings and local levels (6.29)–(6.31), p.46: maximal level O_B,v^× at v, arbitrary open compact levels at the other places over p, and the PEL level of the form (4.6) with multiplier groups O^× there, not an arbitrary PEL datum.
- Distinguished level is maximal and its multiplier subgroup is O_K units; other local factors obey BZ (4.6) and (6.31). Preserve the polarization classes and rigidifications in Definitions 5.3 and 5.6.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/pel-height-lattice`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`, `HilbertModularVarietiesAndShimuraCurves:R18.5/height-and-descent`, `PELModuli:M2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Construction or proof.**

1. Use the strict special-formal-module representability already owned by /drinfeld-representability. Apply BZ Lemma 5.10 and Proposition 5.11 to the distinguished polarized factor; label it with /pel-height-lattice.
2. For each other p_i, transport the rigidification to the chosen constant etale framing group and its multiplicative dual; BZ Proposition 5.4 identifies the functor with its coset sheaf.
3. Compute both heights after the central correction in (6.16), as in Theorem 6.3. Keep this arithmetic datum separate from the normalized framing-group action.

**Source.** [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), §5, Definitions 5.3 and 5.6, Proposition 5.4, Lemma 5.10, Proposition 5.11, pp.35–40; Theorem 6.3 proof, pp.44–45. The polarized local-factor decomposition, its action and the corrected height translation.

**Check.** Polarization constrains two distinguished labels but does not collapse them to one: (1,−1) is an allowed auxiliary component outside the quaternionic diagonal. For δ₁δ₂ scalar, the two determinant valuations have even sum, so their translation preserves Λ. On the quaternionic subspace the two shifts agree. At any other prime p_i over p, the source's étale framing and multiplicative dual yield a constant coset factor only after the prescribed rigidification. Omitting these factors for a field with several primes over p changes both the arithmetic quotient and the descent action. The degree-(1,1) corrected Weil datum is computed before the inverse base convention is transported to the quaternionic adelic formula.

**Acceptance.**

- The auxiliary factor is not just OmegaHat times one height integer.
- The discrete other-prime factors cannot be omitted when F has several primes above p.
- Switching BC and BZ framing arrows inverts the quasi-isogeny; do not carry the same height sign across both conventions.

### 9. Very free action on Drinfeld charts — `VeryFreeChartAction`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-chart-action`. **Owner:** this continuation.

**Statement.** For the effective projective arithmetic group Gamma acting on the imported Bruhat–Tits tree T, call the action very free when every gamma different from 1 and every vertex x satisfy d_T(x,gamma x)>2, where d_T counts edges. The light predicate also makes sense for an actual group action on a set equipped with a specified integer-valued distance. In the geometric use this distance must be the tree distance. This is a sufficient chart-separation condition, stronger than an action free on vertices.

**Hypotheses.**

- K is a finite extension of Q_p, with integers O, uniformizer pi, residue field k of size q, and completed maximal unramified extension Kcheck. Formal and rigid carriers are imported, not supplied by an algebraic scheme carrier.
- Gamma is the image in PGL2(K), after removing the scalar kernel, of the determinant-valuation-zero arithmetic stabilizer. In the geometric theorem Gamma is discrete and cocompact.

**Prerequisites.** `mathlib:MulAction`, `ReductiveGroupsPartII:RG2.2`.

**Construction or proof.**

1. Import the tree, its action and edge-count distance from ReductiveGroupsPartII:RG2.2.
2. Apply BC Part III 5.3.1 to the effective arithmetic group and retain the strict bound greater than 2.
3. Small tame level produces this condition for the arithmetic groups of /arithmetic-quotient; that is the separate theorem /very-free-small-level, not part of this definition or of the quotient theorem.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §5.3.1, pp.141–142. Strict displacement greater than two allows standard formal vertex charts to descend and glue.

**Uses.**

- `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-drinfeld-quotient`: Provides formal vertex charts with embedded radius-one neighbourhoods.
- `BC Part III §5.3.1`: Justifies a concrete gluing construction of the sufficiently small arithmetic quotient.
- `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-small-level`: the property that sufficiently small tame level achieves for every projected arithmetic stabilizer.

**API.**

| Name | Contract |
| --- | --- |
| `VeryFreeChartAction.distance` | For an actual group action, the condition is the universal strict displacement bound greater than 2. |
| `VeryFreeChartAction.free` | If d(x,x)=0, the condition excludes every nonidentity vertex stabilizer. |
| `VeryFreeChartAction.subgroup` | Restriction to a subgroup preserves the condition with the induced action and the same distance. |
| `VeryFreeChartAction.conjugation` | Conjugating Gamma by a tree isometry preserves the condition; the distance is transported by that isometry. |

**Unit tests.**

- `VeryFreeChartAction.trivialGroup` (degenerate): The trivial group satisfies the predicate for every vertex set; requiring the bound for the identity would fail.
- `VeryFreeChartAction.translationThree` (example): On the integer line with edge distance |x-y|, n acts by x maps to x+3n; every nonzero n has displacement at least 3.
- `VeryFreeChartAction.translationTwo` (non-example): The free action n:x maps to x+2n fails: n=1 has displacement 2.
- `VeryFreeChartAction.fixedVertex` (non-example): An action with a nonidentity element fixing a vertex fails even if other orbits have long displacement.

**Check.** On the integer line, n acts by x↦x+3n and d(x,y)=|x−y|. A nonzero n moves every vertex by at least three, so the predicate holds. Translation by 2 has no nonidentity vertex stabilizer but fails the strict bound for n=1. An action fixing a vertex fails immediately. The trivial group satisfies the condition because only nonidentity elements are tested. These are elementary predicate checks, not examples of cocompact lattices in a (q+1)-regular tree. In geometric applications the supplied map is the actual group action and the distance is tree edge distance; an arbitrary map or arbitrary distance cannot invoke the quotient theorem.

**Signature correspondence.** The suggested predicate takes the action map explicitly, allowing these concrete checks on existing carriers. The `distance` theorem relates it to Mathlib's actual group action. Subgroup and equivariant-isometry transport preserve the same condition; no new general group-action theory is developed.

**Acceptance.**

- A translation by 2 on an integer line acts freely but fails this condition.
- Central scalars must be removed before imposing this condition.

### 10. Very free arithmetic stabilizers at small tame level — `VeryFreeChartAction.smallTameLevel`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-small-level`. **Owner:** this continuation (added by the independent review).

**Statement.** In the setting of /arithmetic-quotient (B/F with B_v division, Bcheck totally definite and split at v, U_v = O_B,v^×), fix a tame level U^v_0. There is an open compact U^v_1 ⊂ U^v_0 such that for every open compact U^v ⊂ U^v_1 and every g in the finite adelic group away from v, the image in PGL2(F_v) of Γ_g = {b in Bcheck^× ∩ gU^v g^{-1} : ord_v Nrd b = 0} acts very freely on the Bruhat–Tits tree: every nonidentity element moves every vertex a distance greater than 2. Since ord_v Nrd b = 0, these displacements are even, so the condition says that no nonidentity element has displacement 0 or 2.

**Hypotheses.**

- F totally real; B/F split at exactly one real place and division at v above p; B̌ exchanges the invariants at that real place and at v; the fixed away-v identification of B̌ with B.
- Γ_g is projected to PGL₂(F_v) after removing the central kernel; the tree is the imported Bruhat–Tits tree of PGL₂(F_v) with edge-count distance.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-chart-action`, `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`, `ReductiveGroupsPartII:RG2.2`.

**Construction or proof.**

1. Let J be the adjoint group of B̌. It is anisotropic at every real place, so J(F) is discrete in J(A_F,f), and the image of each Γ_g in J(F_v) is discrete and cocompact (BZ, proof of Proposition 6.6, p.48).
2. For the finitely many double-coset representatives at level U^v_0 and a finite set of vertex representatives modulo each image, the elements moving some representative vertex by at most 2 lie in a compact subset of J(F_v), hence form a finite set S by discreteness.
3. Every nonidentity element of S is nontrivial in J(A^v_F,f), because J(F) → J(A^v_F,f) is injective; choose U^v_1 normal in U^v_0 whose images avoid the finitely many elements of S other than 1. Every double coset at a smaller level U^v ⊂ U^v_1 is represented by δgk with δ ∈ B̌^×, g a representative at level U^v_0 and k ∈ U^v_0; Γ_{gk} at level U^v lies in Γ_g at level U^v_1 because U^v_1 is normal in U^v_0, and conjugation by δ is an isometry of the tree, so the bound persists for all of them.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §5.3.1, pp.141–142. Asserts that the stabilizers act very freely on the tree once the tame level is small enough, and uses this to glue the standard vertex charts.

**Source.** [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), §6, proof of Proposition 6.6, p.48. The discreteness and smallness argument, there given for fixed-point-free action of the projected groups on the building; the same argument with displacement at most 2 gives very freeness.

**Check.** Elements of determinant valuation zero preserve the parity of vertices, so every displacement is even: a free action excludes displacement 0, and very freeness additionally excludes displacement 2. The bound is about the projected groups; central elements of B̌^× act trivially on the tree and are discarded before testing it.

**Acceptance.**

- For every sufficiently small tame level, every projected Γ_g satisfies /very-free-chart-action.
- The statement is about the projected groups after the scalar kernel is removed; central elements of B̌^× act trivially on the tree and are not counted.
- Freeness on vertices (no nonidentity element with displacement 0) is weaker and is the condition used in BZ's proof of Proposition 6.6; very freeness additionally excludes displacement 2.

### 11. Separated Drinfeld quotient charts — `VeryFreeDrinfeldQuotient`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-drinfeld-quotient`. **Owner:** this continuation.

**Statement.** Let Gamma be a discrete cocompact subgroup of PGL2(K) acting very freely on T. The standard Drinfeld vertex charts descend to the quotient formal curve Gamma backslash OmegaHat and glue with their original edge overlap charts. Its special fibre has one P1_k for each vertex orbit and one ordinary node of thickness 1 for each unoriented edge orbit. The quotient map is injective on each radius-one vertex neighbourhood in the tree. There is a proper algebraic curve model whose completion is this formal quotient, with smooth rigid generic fibre Gamma backslash Omega; regularity and semistability follow from the original charts. Each normalized rational component has q+1 distinct attaching points, so the special fibre is stable.

**Hypotheses.**

- K is a finite extension of Q_p, with integers O, uniformizer pi, residue field k of size q, and completed maximal unramified extension Kcheck. Formal and rigid carriers are imported, not supplied by an algebraic scheme carrier.
- The effective Gamma action satisfies VeryFreeChartAction; import the formal quotient gluing from the requested AdicSpacesPartII extension and Grothendieck's algebraization theorem from AdicSpacesPartII:F0/grothendieck-algebraization. This theorem uses no general finite-stabilizer quotient assertion.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-chart-action`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:F0/grothendieck-algebraization`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Construction or proof.**

1. If two vertices in one radius-one ball were identified, a nonidentity translate would move a vertex by at most two. Use very freeness to rule this out.
2. Glue the actual BC Part I charts along edge charts, then take a finite fundamental domain for cocompactness to obtain a proper formal curve over O. Algebraize it with Grothendieck's algebraization theorem (AdicSpacesPartII:F0/grothendieck-algebraization), given a line bundle whose reduction to the special fibre is ample; producing that line bundle on the quotient is part of the requested AdicSpacesPartII extension.
3. Read the local equations xy=pi, identify component and node orbits, and count the q+1 distinct branches on each normalized P1. Since q is at least 2, every rational component has at least three special points.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part I §§2–3, pp.51–56; Part III §5.3.1, pp.141–142. Standard vertex and edge charts and the sufficient smallness condition for gluing their quotient.

**Source.** [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §1.2, pp.12–13. The blow-up union has reduced tree-indexed rational components and original node charts.

**Check.** If two vertices in a radius-one neighbourhood were identified, the triangle inequality would give a nonidentity displacement at most two. Strict separation therefore preserves every attaching branch of a vertex chart. There are q+1≥3 distinct attaching points on each normalized rational component, which proves stability. This condition also prevents short cycles in this particular quotient; it is sufficient and is not a classification of every stable Mumford curve. The model is regular over the unramified coefficient ring where its charts are xy=π. Ramified base change requires the node-resolution supplier. Algebraisation uses Grothendieck's algebraization theorem (AdicSpacesPartII:F0/grothendieck-algebraization) once the quotient and a line bundle with ample reduction on it are supplied; those two inputs are the requested extension, not a consequence of naming a generic-fibre functor.

**Acceptance.**

- The chart theorem is sufficient under very freeness; mere vertex freeness is not used as the chart hypothesis.
- No assertion of regularity survives arbitrary ramified base change: xy=pi becomes xy=u times pi_L^e.
- The unramified local charts have thickness one.

### 12. Arithmetic Drinfeld quotient — `ArithmeticDrinfeldQuotient`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`. **Owner:** the R18.2 specification; imported here.

**Statement.** For B/F division split at τ only and division at v, let B̌ exchange invariants at {τ,v}, so it is totally definite and split at v. For compact level U with U_v=O_B,v× and small U^v, form B̌×\[(Ω̂⊗O_Fv O_Fv̌)×B_f×/U], using fixed away-v identifications; B̌_v× acts by homography and the local valuation component ord_v Nrd. Its finite component decomposition uses Γ_g={b∈B̌×∩gU^v g⁻¹:ord_v det b=0}, projected to PGL₂(F_v). These projected groups are discrete cocompact and become torsion-free with sufficiently small tame level.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Global B/F, τ,v and level as stated; effective central quotient and finite component representatives fixed.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/height-and-descent`, `AdelicAlgebraicGroups:AA.3`, `AdelicAlgebraicGroups:AA.4`, `AdicSpacesPartII:R2`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Construction or proof.**

1. Apply adelic finiteness and approximation for the definite exchange algebra.
2. Compute the valuation-zero stabilisers and their effective projective images.
3. Construct separated proper formal quotients by the free cocompact action using edge charts; algebraize via the generic proper formal-curve theorem.

**Source.** [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), §1, pp.1–3; §6, pp.45–50. Totally real arithmetic quotient and fixed-point-free level.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §§5.1–5.3, pp.139–142. Rational-field component decomposition and small-level fence.

**Uses.**

- `BZ Theorem 6.7 and BC III Theorem 5.2`: Builds the arithmetic local object before asserting canonical-curve identification.

**API.**

| Name | Contract |
| --- | --- |
| `ArithmeticDrinfeldQuotient.components` | Connected pieces are the specified projective Γ_g quotients after unramified base change. |
| `ArithmeticDrinfeldQuotient.cocompact` | Each effective Γ_g is discrete and cocompact in PGL₂(F_v). |
| `ArithmeticDrinfeldQuotient.changeLevel` | Nested tame levels give the corresponding finite quotient maps. |
| `ArithmeticDrinfeldQuotient.algebraisation` | At sufficiently small level the proper formal curve algebraizes with the same generic fibre. |

**Unit tests.**

- `ArithmeticDrinfeldQuotient.scalar` (compatibility): Central scalar homographies are ineffective; their valuation effect is retained separately.
- `ArithmeticDrinfeldQuotient.node` (computation): At free level an edge orbit has node chart xy=π.
- `ArithmeticDrinfeldQuotient.nonfree` (non-example): A quotient with a nontrivial effective vertex stabiliser cannot use the free-action regularity argument.

**Check.** The adelic factor includes the valuation component at the division prime even at maximal level. A representative g and its determinant-valuation-zero stabilizer produce one connected component over the completed unramified base; this is not a replacement for the entire B̌× quotient. For a sufficiently small tame level, remove the scalar kernel and strengthen smallness to the very-free condition when using the direct chart gluing theorem. For nonsmall levels use the effective finite quotient and weighted-graph theorem. Neither regularity nor a descended universal formal module follows automatically at coarse level.

**Acceptance.**

- The quotient by full B̌× includes the valuation component; a single Γ_g quotient is only one component after the specified unramified base change.
- Removing the tame-smallness hypothesis yields a coarse finite quotient and loses automatic regularity.

### 13. Quaternionic transfer from basic PEL uniformisation — `QuaternionicPelUniformisationTransfer`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/quaternionic-pel-uniformisation-transfer`. **Owner:** this continuation.

**Statement.** At maximal division-prime level and the other p-adic levels of BZ (6.31), the formal quaternionic uniformisation map factors through the selected open-and-closed quaternionic components of the auxiliary PEL model of Definition 6.5 and is an isomorphism onto those components. The inclusion on local labels is m maps to (m,m). The rational automorphism group inclusion is controlled by the exact central sequence 1 to F times to Bcheck times times L times to I(Q) to 1, where L/F is the auxiliary CM extension, with kernel c maps to (c,c inverse). After a cofinal tame shrinking, the induced quotient inclusion is open and closed and hits every selected component. Transporting the PEL uniformisation and its corrected twist gives the quaternionic formal completion with right Pi-inverse descent, compatibly with the Hecke operators of B^×(A_f) for varying levels of the permitted form (BZ Theorem 6.7). This division-prime proof route does not use Carayol's split-place connected comparison.

**Hypotheses.**

- K is a finite extension of Q_p, with integers O, uniformizer pi, residue field k of size q, and completed maximal unramified extension Kcheck. Formal and rigid carriers are imported, not supplied by an algebraic scheme carrier.
- F is totally real; B is split at exactly one real place tau and division at v above p. Bcheck exchanges the invariants at tau and v and agrees elsewhere. Use the BZ auxiliary CM extension, hermitian datum, embeddings and local levels (6.29)–(6.31), p.46: maximal level O_B,v^× at v, arbitrary open compact levels at the other places over p, and the PEL level of the form (4.6) with multiplier groups O^× there, not an arbitrary PEL datum.
- Choose auxiliary CM/tame levels as in BZ Definition 6.5 and (6.31). Retain the central kernel and all components of the selected canonical quaternionic tower.
- The basic PEL uniformisation of BZ Proposition 6.2, including deformation-theoretic etaleness, polarized Hasse-principle surjectivity and Weil equivariance, is a supplier contract, not a consequence of PEL representability or complex uniformisation.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/auxiliary-pel-local-factors`, `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum`, `PELModuli:M2`, `PELModuli:M4`, `AdicSpacesPartII:R2`, `mathlib:DoubleCoset.Quotient`, `mathlib:DoubleCoset.eq`, `mathlib:groupCohomology.H1ofAutOnUnitsUnique`, `mathlib:groupCohomology.exists_div_of_norm_eq_one`.

**Construction or proof.**

1. Identify Bcheck using (6.22) and compute the central exact sequence (6.34). Its sequence of rational points is exact by Hilbert 90 for the CM extension L/F: for x in I(Q) with x'x = f in F^×, the element f/Nrd(x) of L^× has norm 1 to F because Nrd(x')Nrd(x) = f², so it equals σ(k)/k for some k in L^× (mathlib:groupCohomology.exists_div_of_norm_eq_one), and then x k^{-1} lies in Bcheck^×. In Proposition 6.6 the torus L times/F times is anisotropic at infinity; shrink the auxiliary level using the finite relevant unit classes and the congruence argument so that no extra CM translate identifies two quaternionic points.
2. Insert /auxiliary-pel-local-factors into Proposition 6.2, then use the diagonal height embedding (6.39) and Proposition 6.6 to obtain an open-and-closed immersion of the arithmetic formal quotients.
3. Follow the proof of Theorem 6.7: take compatible special-fibre points over a cofinal system of levels, use properness to choose a compatible framing, and use Hecke transitivity to meet every selected component. Open-and-closed immersion plus surjectivity gives the isomorphism.
4. Convert the corrected PEL Weil datum using Theorem 6.3; the quaternionic formula is id on OmegaHat and right multiplication by Pi inverse on the adelic quotient, together with tau_c=Spf(tau inverse).

**Source.** [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), §6, Proposition 6.2 and Theorem 6.3, pp.43–45; (6.22), p.45; (6.29)–(6.31), p.46; Definition 6.5, Proposition 6.6 and Theorem 6.7 with its proof, pp.47–51. Source-specific quaternionic inclusion, central-kernel injectivity, complete component coverage, and descent transport.

**Source.** [Stephen Kudla, Michael Rapoport and Thomas Zink, On the p-adic uniformization of unitary Shimura curves](https://arxiv.org/pdf/2007.05211v1), Proposition 7.1.11 and proof, pp.115–116; Lemma 7.3.1, p.120; Proposition 7.3.2, p.121 (arXiv v1). The cited polarized Hasse-principle and Weil-descent arguments underlying BZ Proposition 6.2; transferring them to BZ's actual group remains part of the explicit PEL supplier contract.

**Check.** The central kernel is c↦(c,c⁻¹). A bare injection B̌×→I(Q) does not rule out an auxiliary CM element identifying two quaternionic points. The torus L×/F× is anisotropic at infinity; the relevant global unit classes are finite, and the cofinal congruence shrinking in Proposition 6.6 excludes their unwanted images. This is the actual injectivity argument. It must be paired with the compatible framing/Hecke argument for surjectivity over every selected component. An isomorphism of one geometric connected component proves neither the canonical tower statement nor the Weil datum.

**Assembly contract.** This is the division-prime proof input for `TotallyRealUniformisation`, replacing a reliance on an unspecified integral connected comparison in that proof route. It imports the source-specific auxiliary canonical model and basic uniformisation; it does not import `SplitPlaceDescentBoundary`. The ramified Yuan–Zhang determinant/tensor cancellation conditions remain attached to their integral PEL targets, and are not an extra hypothesis of Boutot–Zink's division-prime theorem.

**Acceptance.**

- A geometric component isomorphism alone does not prove surjectivity onto all canonical components.
- A raw inclusion of Bcheck times in I(Q) is insufficient without the inverse-diagonal central kernel.
- The division-prime theorem is independent of the unresolved arbitrary-ramification YZ determinant repair.

### 14. Čerednik–Drinfeld uniformisation — `TotallyRealUniformisation`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`. **Owner:** the R18.2 specification; imported here.

**Statement.** For totally real F, B division split only at τ, v with B_v division, U_v=O_B,v× and the other p-adic factors and tame level as in BZ (6.31), the completion of the canonical integral Shimura curve over O_Eν identifies with B̌×\[(Ω̂_Fv⊗O_Fv O_Eν̌)×B_f×/U]. Here E=τ(F), E_ν=F_v. It is compatible with level transitions and Hecke operators at the permitted levels. With τ_c=Spf τ⁻¹, natural descent corresponds on the quotient to id_Ω×|Π⁻¹×τ_c. For small tame level the model is regular semistable and stable.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- All local factors match BZ (6.31); sufficiently small U^v for the final stable/regular claim.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-reflex-dimension`, `PELModuli:M2`.

**Construction or proof.**

1. Use the shared PEL/Rapoport–Zink basic uniformisation theorem with its Hasse-principle/surjectivity hypotheses.
2. Identify the local RZ factor with Drinfeld moduli, and transfer from the auxiliary PEL curve via the open-and-closed component comparison.
3. Apply BZ Theorem 6.7 and check the Π⁻¹ Frobenius diagram; obtain regular/stable geometry from Corollary 6.8.

**Source.** [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), Theorem 6.7 and Corollary 6.8, pp.49–50. Totally real theorem with exact level and descent data.

**Check.** Boutot–Zink Theorem 6.7 and Corollary 6.8 are on printed pp.49–50. The auxiliary levels are fixed in (6.29)–(6.31) on p.46, and the proof's framing/component argument continues through pp.50–51. Its formal base and inverse Frobenius convention are part of the statement. The canonical quotient must hit every chosen component. Smallness is required for the stable regular model; coarse finite quotients are handled by the weighted graph target. Boutot–Carayol Part III alone is a source for F=Q, not for arbitrary totally real F.

**Acceptance.**

- This is over the completed maximal unramified local field, not a finite extension substituted for it.
- BC III proves the arithmetic theorem over Q; it is not the citation for arbitrary F.

### 15. Rational-field comparison — `RationalUniformisation`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation`. **Owner:** the R18.2 specification; imported here.

**Statement.** For F=Q, a division quaternion algebra ramified at p and split at infinity, and maximal p-level with sufficiently small tame U^p, specialize the uniformisation to BC III Theorem 5.2. Match its left/right actions via the chosen algebra anti-isomorphism and its Frobenius–determinant twist with the BZ convention. The isomorphism also compares the universal special formal O_D modules. The split B=M₂(Q) modular curve is outside this division-prime assertion.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `ModularCurvesPartII:R12.2`.

**Construction or proof.**

1. Apply the totally real theorem with F=Q.
2. Identify the invariant-swapped definite algebra and BC’s level component set.
3. Match anti-isomorphism, determinant-valuation descent and universal formal module.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III Theorem 5.2 and comments, pp.140–142. Primary rational-field arithmetic theorem and action conventions.

**Check.** In the rational specialization the global arithmetic base is Q_p, although Parts I–II of Boutot–Carayol build the local half-plane and moduli for general K. The arithmetic algebra is division at p and split at the real place. B=M₂(Q) fails this division-prime hypothesis; modular-curve compactification is supplied by ModularCurves, not by this theorem. At fine tame level compare the actual universal special formal modules as well as the formal curves. The anti-isomorphism used to switch source conventions must also switch the associated left/right group actions.

**Acceptance.**

- The arithmetic base is Q_p here; BC’s local Parts I–II permit general K.
- The rational split modular curve uses the ModularCurves supplier, not this compact theorem.

### 16. Split-place comparison and its finite-level fields — `SplitPlaceDescentBoundary`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/split-place-descent-boundary`. **Owner:** this continuation.

**Statement.** For Carayol's split finite-place quaternionic and auxiliary PEL towers, with the fixed neutral-component identifications and sufficiently small compatible tame levels, Proposition 4.4.3 gives an isomorphism of level-zero neutral components and their O_p-linear p-divisible groups over F_p^nr, equivariant for the indicated inclusion of effective extension groups Delta0/SL2(O_p) into Delta0-prime/SL2(O_p). Section 4.5.1 lifts it to the unions of p-power level structures above these level-zero components over F_p^nr. For each finite n, Section 4.5.5 compares the chosen neutral connected components over F_p^n, the abelian extension of F_p^nr inside F_p^ab that corresponds under local class field theory to the group U_p^n of units congruent to 1 modulo p^n (Carayol's notations, p.155); U_p^0 is all units, so F_p^0 = F_p^nr. The compatible auxiliary tame level can depend on n. Comparison of a full union over F_p^nr and comparison of one selected component over F_p^n are different contracts. No division-prime or all-n common-tame conclusion follows from these split-place statements.

**Hypotheses.**

- B at p is M2(F_p); use the Carayol determinant, reciprocity and right-Galois-action conventions, and the coefficient-free connected towers.
- The finite torsion component field F_p^n corresponds by local class field theory to U_p^n; use Carayol's geometric-Frobenius normalization. Completing the comparison field gives the corresponding completed-field statement, not a descent to a smaller field.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-component-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`.

**Construction or proof.**

1. Use the equivariant geometric connected comparison of §4.2 and compare the two extension groups in §§4.3–4.4. The inertia quotient identifies the descent to F_p^nr.
2. Retain the O_p-linear p-divisible comparison in Proposition 4.4.3. Pass to compatible torsion-trivialization spaces above the neutral level-zero component as in §4.5.1.
3. Apply the norm-one/tame quotient in §4.5.2 and the neutral-component conclusion of §4.5.5 over its stated F_p^n. Distinguish field of definition from a theorem of minimality of that field, which is not asserted here.

**Source.** [Henri Carayol, Sur la mauvaise réduction des courbes de Shimura](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf), Notations, pp.155–156; §§4.2–4.5, especially Proposition 4.4.3, p.188, and §4.5.1–4.5.5, pp.188–189. Unramified descent at level zero, torsion-level unions and the explicitly larger fields of selected finite-level components.

**Check.** The level-zero comparison is over F_p^nr. A union of finite-level torsion trivializations above that base is still defined there. A selected connected component is a different assertion: its natural field is F_p^n, determined by the corresponding local units congruent to one modulo π^n. For K=Q₃ at the first nontrivial unit-congruence level the residue-unit quotient has order two, so its selected component field is a ramified degree-two extension of K^nr. It cannot silently be replaced by K^nr. The source permits the auxiliary tame level H′ to depend on n. The comparison is at a split finite place, and proves no division-prime theorem. These distinctions are needed when combining the existing finite-component and p-divisible-tower interfaces.

An equality of geometric component sets, such as the superspecial indexing in Yuan–Zhang §8.3, does not specify these arithmetic fields or the p-divisible-group equivariance. Carayol's effective extension groups and indicated subgroup inclusion must be retained.

**Acceptance.**

- The theorem never assumes B_p division.
- F_p^0 is F_p^nr; for n positive F_p^n can be ramified over it.
- The statement gives an auxiliary level for each fixed n, not one small tame level working uniformly at all n.
- This node is the source-pinned form of the split-place comparisons R18.2/connected-pel-comparison and R18.2/finite-pel-comparison; at assembly those targets take its fields (F_p^nr at level zero and for the union of level structures, F_p^n for a selected level-n component), so the comparison keeps one owner. It also supplies, at split places, the descent field left open by the H0 gap on Yuan–Zhang Proposition 4.4.

### 17. Compatible Drinfeld level structures on the uniformized tower — `DrinfeldLevelStructureComparison`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-level-structure-comparison`. **Owner:** this continuation.

**Statement.** For sufficiently small tame level in the CDN20 global division-prime setup, pullback of the quaternionic special formal O_D-module under uniformisation agrees, with its action and framing convention, with the universal Drinfeld module. Therefore its finite generic-fibre torsion-level functors are the Drinfeld covers M_n in the CDN congruence convention, and the quotient identifies the entire inverse system Sh_n(U)^an with Bcheck times backslash [M_n times Bcheck(A_f^v) times/U] for n at least 1. These identifications commute with forgetting local level, shrinking tame level and away-v Hecke correspondences. This contract refers to an actual module comparison; unrelated isomorphisms of the base curves do not induce it. It makes no semistability or regularity assertion for all integral higher-level covers.

**Hypotheses.**

- K is a finite extension of Q_p, with integers O, uniformizer pi, residue field k of size q, and completed maximal unramified extension Kcheck. Formal and rigid carriers are imported, not supplied by an algebraic scheme carrier.
- F is totally real; B is split at exactly one real place tau and division at v above p. Bcheck exchanges the invariants at tau and v and agrees elsewhere. Use the BZ auxiliary CM extension, hermitian datum, embeddings and local levels (6.29)–(6.31), p.46: maximal level O_B,v^× at v, arbitrary open compact levels at the other places over p, and the PEL level of the form (4.6) with multiplier groups O^× there, not an arbitrary PEL datum.
- Translate CDN's B (definite) to this document's Bcheck, CDN's Bcheck (indefinite) to B, and CDN's local F to K. Use its exact division congruence subgroup Gcheck_n=1+varpi_D^n O_D for n at least 1, where varpi_D is a division-algebra uniformizer.
- At each actual finite moduli level take a fine tame cover on which the universal special formal module exists. Quotient equivariance of this module is part of the theorem, not assumed from a coarse universal family.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/quaternionic-pel-uniformisation-transfer`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

**Construction or proof.**

1. Use the uniformisation with the universal special formal module in BC Part III Theorem 5.2 and the BZ moduli-compatible construction (6.2)–(6.7), transported to the quaternionic selected components.
2. Identify the canonical-model tower at v with torsion-level spaces of the generic p-divisible group H of R18.2/quaternion-pdiv-tower. Its ideal-indexed levels U_p(n) = 1 + nO_B,p give, at v, only the levels 1 + π^m O_D = 1 + Π^{2m} O_D; the odd division levels Gcheck_{2m+1} need the Π-torsion X[Π^{2m+1}] of the module itself.
3. Apply the same finite torsion-level functor on both actual modules and the exact Gcheck_n division congruence convention. The forgetful maps commute because they are restrictions of compatible trivializations.
4. Descend along the effective arithmetic action and compare with CDN Proposition 5.4. Keep rigid generic fibres throughout the higher-level conclusion.

**Source.** [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §4.1, p.34 (division congruence convention); §5.2.1–5.2.2, Proposition 5.4 and Remark 5.5, pp.40–43. Congruence-level rigid tower and simultaneous transition compatibility.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III Theorem (5.2), pp.140–141, §5.3.2, p.142, Theorem (5.5), p.146. Module-compatible rational uniformisation and the loss of a natural universal module at a nonsmall coarse quotient.

**Source.** [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), §6, (6.2)–(6.7), pp.40–42; Theorem 6.7, pp.50–51. The uniformisation morphism is constructed from the actual p-divisible group, not just the underlying formal curve.

**Check.** Work at fine tame level and identify the v-part of the quaternionic p-divisible group with the pullback of the universal special O_D-module, equivariantly under the quotient action and the Weil datum. A finite-level point is a torsion-level structure on that actual module. Pullback of the module therefore identifies the level functors and commutes with forgetting part of the structure. Passing to generic fibres gives the rigid tower comparison. The maximal-level isomorphism of curves alone does not supply this identification.

The division congruence group is 1+Π^n O_D for n≥1, as fixed in CDN §4.1, p.34. Powers of a central π have even division valuation and define a different filtration. A coarse quotient need not carry a natural universal module; Boutot–Carayol §5.3.2, p.142 explicitly distinguishes this issue. No theorem here asserts semistability of all high-level integral covers.

**Acceptance.**

- Confusing powers of the central uniformizer with powers of the division uniformizer changes the level.
- The assertion is functorial in n and U, not merely levelwise existence.
- Dropping smallness can remove the natural universal formal-module datum on a coarse quotient.

### 18. All-level Drinfeld tower uniformisation — `TowerUniformisation`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`. **Owner:** the R18.2 specification; imported here.

**Statement.** In CDN20 §5.2.1, E is totally real with E_𝔭=K; B̌ is split only at ∞₀ and division at 𝔭; B exchanges these invariants and is definite. With the fixed identifications of local and away-𝔭 groups, sufficiently small tame U and the exact congruence subgroups Ǧ_n at 𝔭, there are rigid isomorphisms Sh_n(U)^an≅B×\[M_n×B(A_f^𝔭)×/U] for every n≥1, compatible in n,U. M_n is the corresponding Drinfeld cover defined by the universal special formal module’s level structure. The theorem is on rigid generic fibres; it does not assert every high-level integral cover is semistable without alteration.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Exact CDN20 tower convention Ǧ_n retained; U sufficiently small.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `PELModuli:M2`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`.

**Construction or proof.**

1. Construct the generic Drinfeld covers from the universal formal module and matching local congruence levels.
2. Use the basic Rapoport–Zink uniformisation of the auxiliary PEL family with p-level structures on the rigid generic fibre (PELModuli:M2 request), transported through the open-and-closed component comparison; it identifies the v-part of the quaternionic p-divisible group with the pullback of the universal special formal module, so the level-n covers on both sides are the same torsors of level structures. The maximal-level theorem alone does not give the tower.
3. Apply CDN Proposition 5.4 and verify the commuting transitions and away-level actions.

**Source.** [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §5.2.1–5.2.2, pp.40–43, Proposition 5.4. Tower theorem with explicit global setup.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §5.5, Théorème (5.5), p.146. The rational-field all-level statement; the totally real case is CDN20 Proposition 5.4.

**Check.** CDN uses the opposite global letter convention: its curve algebra B̌ is indefinite and division at the distinguished prime, while its quotient algebra B is definite and split there. This is the same invariant exchange after translation of notation. Every n≥1 uses the precise division congruence group and the same underlying module comparison. The squares for forgetting level n+1 to n and for changing U commute. Independent choices of isomorphisms at each level do not meet the target. The formal maximal-level result and rigid higher-level result have different integral claims.

**Acceptance.**

- The n-level source and target use the same local congruence subgroup.
- Compatibility in n is part of the theorem, not a consequence of unrelated levelwise isomorphisms.

### 19. Kurihara graph with lengths for arithmetic quotients — `WeightedArithmeticQuotientGraph`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/weighted-arithmetic-quotient-graph`. **Owner:** this continuation.

**Statement.** Let Gamma be a discrete cocompact subgroup of PGL2(K). Form the formal/algebraic Mumford quotient by first using a normal finite-index Schottky subgroup and then its effective finite quotient. Its dual graph with lengths is (Gamma backslash T)*: take orbits of vertices and oriented edges, delete the edge orbits fixed by reversal, and retain loops and repeated edges among the rest. The length of a retained edge is the order of the stabilizer in Gamma of any lifted oriented edge. The algebraic model is normal, proper and flat, its generic fibre is smooth of genus 1 + #edges − #vertices of (Gamma backslash T)* (Kurihara Proposition 3-2, p.286), and its reduced connected special fibre has split ordinary nodes and rational normalizations of components. At an edge of length m the completed local equation is xy=pi^m. Resolution replaces it by a path of m unit-length edges; it preserves cycle homology and the weighted cycle pairing. For positive generic genus, obtaining the minimal regular model also successively contracts rational components of valence one, as in Kurihara Proposition 3-4; valence-two components are not contracted merely for failing stability.

**Hypotheses.**

- K is a finite extension of Q_p, with integers O, uniformizer pi, residue field k of size q, and completed maximal unramified extension Kcheck. Formal and rigid carriers are imported, not supplied by an algebraic scheme carrier.
- Gamma acts effectively in PGL2(K); all oriented-edge stabilizers are finite. Construct the quotient using the actual Drinfeld/Mumford model and a finite-index normal Schottky subgroup. Minimal regular-model statements require generic genus greater than zero.
- This is an arithmetic quotient comparison; the generic graph-with-lengths, resolution, Jacobian character lattice and monodromy theorem belong to StableReduction and R11.4.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`, `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:F0/grothendieck-algebraization`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`, `NeronModelsAndSemistableAbelianVarieties:R11.4/graph-monodromy`, `mathlib:LinearMap`.

**Construction or proof.**

1. Construct the Mumford quotient by a finite-index normal Schottky subgroup Γ1 with det Γ1 trivial modulo squares (Kurihara §3, p.284), algebraize it with AdicSpacesPartII:F0/grothendieck-algebraization, and divide by the finite group Γ/Γ1, which acts effectively on the projective model (Kurihara p.285).
2. Use Kurihara Proposition 3-2 to identify components, split branches, length and the local ring. Edge inversions identify two branches and remove that node; BC Part III §5.4.3 explains the deletion.
3. Use Kurihara Lemma 3-3 for the local finite quotient and the subsequent blow-up description on p.288. A thickness-m edge subdivides to m unit edges after resolving the xy=pi^m singularity.
4. Apply the existing normalization and regular-model suppliers, then the R11.4 graph/character-lattice theorem. Under subdivision a cycle has the same coefficient on every new segment, hence contributes m times the original edge coefficient product. The generic weighted extension is a recorded supplier gap, not re-owned here.

**Source.** [Akira Kurihara, On some examples of equations defining Shimura curves and the Mumford uniformization](https://repository.dl.itc.u-tokyo.ac.jp/record/39680/files/jfs250303.pdf), §3, Definition 3-1, pp.285–286; Proposition 3-2, pp.286–287; Lemma 3-3 and blow-up discussion, p.288; Proposition 3-4, p.289. Arithmetic quotient graph including inversions, edge stabilizer lengths, node local rings and regularization.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §§5.4.1–5.4.4, pp.144–146. The arithmetic quotient graph deletes fixed reversals; stabilizers produce thicker node equations and descent acts on the graph.

**Check.** In the branch-preserving tame cyclic toy chart, let m be prime to p and μ_m lie in the coefficient ring. From xy=π and ζ·(x,y)=(ζx,ζ⁻¹y), the invariants X=x^m, Y=y^m satisfy XY=π^m. This explains the thickness in this toy case; Kurihara's local quotient theorem supplies the general arithmetic statement, including cases this tame calculation does not cover. A branch-swapping edge stabilizer instead removes that node from the quotient graph, as encoded by deletion of reversal-fixed edge orbits. A retained loop has two branches and must not be deleted by that rule.

Resolving thickness m replaces one edge by m unit segments. A cycle coefficient a on the old edge has coefficient a on each segment, so its self-pairing contribution is ma². The cycle rank is unchanged. For positive genus, minimal regular reduction successively contracts valence-one rational components (Kurihara Proposition 3-4, p.289). A valence-two rational component can have self-intersection −2; contracting it would make a singular model, so stable contraction and minimal regular reduction cannot be identified.

**Acceptance.**

- If Gamma is Schottky, there are no reversed fixed edge orbits, stabilizers are trivial and every length is one, recovering /tree-dual-graph.
- An inverted edge must disappear; treating it as a retained loop is wrong.
- A node of thickness m>1 is not regular and cannot be fed to an unweighted regular-model formula without resolution.
- Genus check: the generic genus is the first Betti number of (Gamma backslash T)*, so a quotient whose reduced graph is a tree has genus zero and no minimal regular model statement applies.

### 20. Quaternionic dual graph identification — `TreeDualGraph`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph`. **Owner:** the R18.2 specification; imported here.

**Statement.** At small maximal division-prime level, the geometric special-fibre dual graph is the finite disjoint union of Γ_g\T_K corresponding to the arithmetic quotient components. Vertices index rational components and edges index nodes, with loops and repeated edges retained in the quotient graph. The graph carries the Frobenius permutation induced by the Π⁻¹ descent, and Hecke/level maps are the transported adelic correspondences on vertex/edge orbits.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Tame level sufficiently small for free local charts; generic dual multigraph supplied by StableReduction.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Construction or proof.**

1. Read the quotient’s local semistable charts and index its components and intersections.
2. Apply the generic normalization/dual-graph API with branch incidence, including loops.
3. Transport descent, Hecke and level correspondences through uniformisation.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §5.4, pp.144–146 (graph); generic monodromy imported from R11.4. Dual-graph quotient and arithmetic descent.

**Source.** [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §8.3, ‘Multiplicity function: the superspecial case’, pp.619–620. Lattice class indexing of quaternionic special-fibre components.

**Check.** A quotient of a tree can have cycles, loops and repeated edges. Record its branch incidence and every arithmetic component before computing homology. The original tree has H₁=0, whereas a finite quotient can have positive first Betti number. A torsion-free quotient uses thickness one; nonsmall effective arithmetic quotients use the preceding weighted theorem and deletion of inversions. Frobenius can permute components or reverse a cycle orientation. The Π⁻¹ descent formula determines that action, and an abstract isomorphism of unoriented graphs does not determine it. Hecke maps can be correspondences rather than a single map of graphs; retain both legs.

**Acceptance.**

- The quotient graph need not be a tree although T_K is a tree.
- Over an unramified base every node has thickness 1.

### 21. Quaternionic character lattice and monodromy — `CharacterMonodromy`

**Target:** `HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy`. **Owner:** the R18.2 specification; imported here.

**Statement.** For the Jacobian of a small-level semistable uniformized curve, identify the toric character lattice with H₁(Γ_g\T_K,Z), compatibly with Hecke and descent. Under the generic semistable-Jacobian monodromy theorem the pairing is the oriented cycle edge pairing Σ_e thickness(e)a_e b_e. At the unramified regular maximal-level model thickness is 1. Its cokernel presents the geometric component group using the dual lattice; Frobenius descent determines the arithmetic group.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Generic semistable Jacobian/Néron and graph monodromy theorem supplied; connected component handled separately.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph`, `NeronModelsAndSemistableAbelianVarieties:R11.4`, `tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion`, `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

**Construction or proof.**

1. Apply the supplied character-lattice theorem to the identified nodal graph.
2. Compute all edge lengths from xy=π charts.
3. Transport Hecke/Frobenius action and distinguish geometric component-group cokernel from its descended points.

**Source.** [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §5.4, pp.144–146 (graph); generic monodromy imported from R11.4. Graph identification; monodromy theorem is a separate supplier, not attributed to these pages.

**Check.** For a cycle of r unit edges, a generator c has pairing ⟨c,c⟩=r. Its map to the dual lattice is multiplication by r and the geometric component group is Z/rZ. With three edge thicknesses 2,3,4, the value is 9; subdividing produces nine unit segments with the same value. Using the unweighted three-edge graph gives the wrong component group Z/3Z. These are checks of the generic graph calculation, without asserting that every toy graph is realized by the very-free arithmetic quotient theorem.

For the graph with two vertices and three parallel unit edges, cycles c₁=e₁−e₃ and c₂=e₂−e₃ give Gram matrix [[2,1],[1,2]], determinant three and component group Z/3Z. This checks repeated edges and the dual-lattice cokernel. This graph has a short cycle and lies outside the very-free chart theorem; it is a valid test of the more general free-quotient graph interface. Counting both edge orientations would double the pairing incorrectly. If Frobenius acts by −1 on the cyclic Z/3Z component group, its rational invariant subgroup is zero, despite the geometric group having order three. Hecke and Frobenius actions are transported before taking those invariants.

**Acceptance.**

- A graph with one cycle of r edges of thickness 1 gives pairing value r on its cycle generator.
- Replacing the quotient graph by the universal tree would falsely give zero toric rank.

## R18.6 — geometric outputs used by modularity

This layer is the interface to consumers. Its references have direction: R18 supplies geometry and finite modules, while the consumers prove their automorphic/Galois conclusions. No R19, R20, R22, R23, R31 or S5 result is a prerequisite of the construction above. The generic monodromy supplier R11.4 is a prerequisite; the arithmetic applications exported to R11.6 are not.

The following contracts retain all conditions of their supplying targets. An export does not certify the outstanding integral pairing, Ihara or local-realization assertions. In particular, the definite and indefinite coefficient modules cannot be identified merely because both admit Hecke actions.


### Export 1: `AutomorphicGaloisRepresentations:R19.2`

**Supplied by:** `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension`, `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv`, `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems`, `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-purity`.

Actual canonical proper curves, discriminant-qualified regular models, local systems, commuting Hecke/G_F action and conditional R34-purity. Constructing ρ_π and its local–global compatibility is R19 work.

### Export 2: `GL2ModularityLifting:R22.1`, `GL2ModularityLifting:R22.2`, `GL2ModularityLifting:R22.6`

**Supplied by:** `HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change`, `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing`, `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level`, `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-freeness`, `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control`, `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-norm-twist`, `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-hecke-twist`, `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy`.

Finite integral modules with all smallness, coefficient pairing, residual vanishing, distinct-root, isotropy-exponent and Ihara hypotheses visible. R22 chooses Q and applies patching; the indefinite integral Ihara gap is not advertised as proved.

### Export 3: `SerreWeightAndLevelOptimisation:R20.6`, `PotentialModularityAndCompatibleSystems:R23.3`

**Supplied by:** `HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change`, `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing`.

Reduction-surjectivity and pairing under verified neatness hypotheses, with the Khare Lemma 2.2 exact-statement gap retained; no modularity imported upstream.

### Export 4: `SerreWeightAndLevelOptimisation:R20.4`, `NeronModelsAndSemistableAbelianVarieties:R11.6`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.1`

**Supplied by:** `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph`, `HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy`.

Exact division-prime maximal-level formal theorem and Frobenius descent, all-level rigid tower maps, arithmetic dual graphs and supplier-based monodromy.

### Export 5: `PerfectoidShimuraVarieties:S5`

**Supplied by:** `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`.

Effective canonical finite-level tower and its actual normal integral models. Perfectoid limits and Hodge–Tate maps are proved by the consumer, independently of finite-level modularity.

### Export 6: `PotentialModularityAndCompatibleSystems:R23.1`, `PotentialModularityAndCompatibleSystems:R23.2`

**Supplied by:** `HilbertModularVarietiesAndShimuraCurves:H6/moret-bailly-input-export`.

H6 supplies paired Hilbert and Allen elliptic torsion twists, component descent and prescribed local-open targets. The Taylor structured-realization and Allen finite-local pairing gaps remain conditions on this export. R23.1–R23.2 proves Moret–Bailly and potential modularity; it does not construct these moduli inputs.

### Export 7: `SerreWeightAndLevelOptimisation:R20.2`

**Supplied by:** `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/weighted-arithmetic-quotient-graph`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph`, `HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy`.

For the Shimura curve over Q of discriminant pq with Γ0(M)-type level, at each of p and q: the formal completion of the integral model as the arithmetic quotient at that (not necessarily small) tame level, the Kurihara graph with lengths giving an admissible model with rational components (so the Jacobian's reduction is a torus extended by a finite component group), the character group as H_1 of the reduced quotient graph, and the transported Hecke and Frobenius actions. Ribet's exact sequences are proved by the consumer (SerreWeightAndLevelOptimisation:R20.2/ribet-exact-sequence, whose request names this layer); the atlas's stage link from R18.6 to that roadmap is to R20.1.

**Consumer check.** Khare–Wintenberger §7, author pp.57–60, defines definite quaternionic coefficient modules with central-character compatibility and computes them as stabilizer-invariant summands. Lemma 7.1, p.60, controls the kernel of the definite degeneracy map at non-Eisenstein ideals. The neatness use in the proof surrounding Lemma 8.3, p.73, and the coefficient pairing/control use on p.77 are genuine extra conditions of the R18.3 exports. They are not consequences of Drinfeld uniformisation and give no indefinite integral Ihara theorem. H6's paired torsion-twist moduli and local opens are supplied to the Moret–Bailly consumer; uniformisation alone cannot produce those inputs.

**Acceptance.** A consumer must name a supplying target, verify its level and coefficient hypotheses, and preserve its Hecke and descent actions. A geometric component-group computation must pass to Frobenius invariants before claiming an arithmetic component group. An n-level theorem must carry the same torsion-level convention on both sides and commute with transition maps. A reader must be able to distinguish the formal maximal-level output from the rigid all-level output.

## Dependency closure and required supplier extensions

The roadmap is at upstream tier 14. The PEL, formal/rigid, strict-group, building, weight and Néron suppliers are lower-tier inputs. Existing generic targets stay with those owners. Source-specific arithmetic comparisons stay here. In particular, the extensions below add the missing contracts in their existing directions rather than make this part a second general theory.


### `AdicSpacesPartII:R2`

Extend as Part II with the separated quotient of the locally finite-type semistable formal Drinfeld curve by a discrete cocompact effective arithmetic group (gluing of the standard charts under very freeness, and the quotient by a finite group acting on a Schottky quotient), and with a line bundle on the resulting proper formal curve whose reduction is ample (lifting from the special fibre, whose obstructions lie in H² of coherent sheaves on a curve and vanish). Grothendieck's algebraization theorem itself is imported from `AdicSpacesPartII:F0/grothendieck-algebraization`; the generic-fibre comparison for a proper model is imported from R2.

Required by `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-drinfeld-quotient`, `HilbertModularVarietiesAndShimuraCurves:R18.5/weighted-arithmetic-quotient-graph`.

### `PELModuli:M2`

Extend as PELModuli Part II with BZ Proposition 6.2 for the actual basic auxiliary datum, framed polarized quasi-isogeny quotient, Serre–Tate local etaleness, Hasse-principle surjectivity and Weil compatibility. Retain the p-adic local-level restrictions. A generic PEL moduli carrier is not a basic uniformisation theorem.

Required by `HilbertModularVarietiesAndShimuraCurves:R18.5/auxiliary-pel-local-factors`, `HilbertModularVarietiesAndShimuraCurves:R18.5/quaternionic-pel-uniformisation-transfer`.

### `PELModuli:M4`

Supply the compatible selected open-and-closed canonical-model embedding and closure used by BZ Definition 6.5 and Proposition 6.6, with the inverse-diagonal central quotient and cofinal auxiliary levels; no assertion that generic component comparison alone supplies integral descent.

Required by `HilbertModularVarietiesAndShimuraCurves:R18.5/quaternionic-pel-uniformisation-transfer`.

### `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`

Supply strict special formal O_D-modules, their relative heights, framed quasi-isogeny moduli, actual finite torsion-level functors and the equivariant universal module on fine levels. Absolute p-height is relative height times [K:Q_p].

Required by `HilbertModularVarietiesAndShimuraCurves:R18.5/auxiliary-pel-local-factors`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-level-structure-comparison`.

### `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

Supply structured Dieudonne/Cartier and Serre–Tate deformation compatibility for the paired polarized auxiliary factor, with strict relative ranks; no raw tau-quotient exactness assumption.

Required by `HilbertModularVarietiesAndShimuraCurves:R18.5/auxiliary-pel-local-factors`.

### `ReductiveGroupsPartII:RG2.2`

Import the lattice/norm-class Bruhat–Tits tree, PGL2 action, edge-count distance and q+1 valence. The graph and building are not redefined by R18.5.

Required by `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-chart-action`.

### `NeronModelsAndSemistableAbelianVarieties:R11.4`

Import exact character/monodromy/cokernel nodes; extend the recorded thickness-resolution gap as Part II so that arithmetic quotient xy=pi^m charts can be resolved and weighted pairings compared. Do not assert the existing regular-model theorem already handles arbitrary thickness.

Required by `HilbertModularVarietiesAndShimuraCurves:R18.5/weighted-arithmetic-quotient-graph`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`

Import the existing upstream layer, read in the current read-only roadmap checkout: nodes/branches, node blow-ups or regular/minimal-model machinery as its title specifies. No new target is owned here in that generic direction.

Required by `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-drinfeld-quotient`, `HilbertModularVarietiesAndShimuraCurves:R18.5/weighted-arithmetic-quotient-graph`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

Import the existing upstream layer, read in the current read-only roadmap checkout: nodes/branches, node blow-ups or regular/minimal-model machinery as its title specifies. No new target is owned here in that generic direction.

Required by `HilbertModularVarietiesAndShimuraCurves:R18.5/weighted-arithmetic-quotient-graph`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`

Import the existing upstream layer, read in the current read-only roadmap checkout: nodes/branches, node blow-ups or regular/minimal-model machinery as its title specifies. No new target is owned here in that generic direction.

Required by `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-drinfeld-quotient`, `HilbertModularVarietiesAndShimuraCurves:R18.5/weighted-arithmetic-quotient-graph`.

### Conditions that remain to be established

Each target has a route to an existing declaration, an imported target, a requested supplier contract or the explicit condition below. The target-level pass is complete; mathematical closure is conditional on these six items. Neither a source theorem in an unavailable formal carrier nor elaboration of an elementary signature resolves them.


1. **Formal arithmetic quotient and ample line bundle for algebraisation.** AdicSpacesPartII supplies formal schemes, generic fibres and Grothendieck's algebraization theorem (AdicSpacesPartII:F0/grothendieck-algebraization, under the hypothesis of a line bundle with ample reduction), but no target constructs the separated quotient of the formal Drinfeld curve by a discrete arithmetic group, the effective finite quotient used at nonsmall levels, or the line bundle with ample reduction on that quotient. Add these to AdicSpacesPartII Part II; do not infer algebraisation from Raynaud equivalence alone. Needed by `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-drinfeld-quotient`, `HilbertModularVarietiesAndShimuraCurves:R18.5/weighted-arithmetic-quotient-graph`.

2. **Basic PEL uniformisation carrier and hypotheses.** PELModuli:M2 does not currently supply basic RZ uniformisation. Its Part II extension must state BZ Proposition 6.2 for the actual quaternionic auxiliary datum and polarized quasi-isogeny group, including Serre–Tate deformation etaleness, Hasse-principle coverage of all special-fibre points and Weil equivariance. KRZ provides the cited argument in its own unitary setting; no automatic equivalence of that setting with BZ is claimed. Rapoport–Zink Period Spaces, Theorem 6.30, is cited by those sources but was not independently read; it is not in the cleared library. Needed by `HilbertModularVarietiesAndShimuraCurves:R18.5/auxiliary-pel-local-factors`, `HilbertModularVarietiesAndShimuraCurves:R18.5/quaternionic-pel-uniformisation-transfer`.

3. **Compatible universal module at fine levels.** The actual quaternionic universal special formal module and its quotient descent need supplier carriers and the BZ-to-Drinfeld comparison. The target /drinfeld-level-structure-comparison spells out what is needed. One must prove this comparison before deducing higher-level covers from the maximal-level curve theorem; a coarse universal family is not substituted. Needed by `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-level-structure-comparison`.

4. **Weighted graph monodromy extension.** R11.4/graph-monodromy handles regular semistable models and records G-thickness-resolution for the nonregular weighted version. Import its resolution/subdivision extension, or apply the regular theorem after the explicit node resolutions. This packet plans only the arithmetic identification and records the extension as R11 Part II, without duplicate generic monodromy nodes. Needed by `HilbertModularVarietiesAndShimuraCurves:R18.5/weighted-arithmetic-quotient-graph`.

5. **Cross-part finite-component descent reconciliation.** Carayol Proposition 4.4.3 and §§4.5.1–4.5.5 have now been collated at a split place. The older R18.2/finite-pel-comparison must distinguish a union of level structures over F_p^nr from a selected connected component over F_p^n. Its all-n uniform tame or division-place interpretation is unsupported. The prior broader connected-comparison gap is narrowed by this source boundary but not marked solved in another packet. YZ ramified determinant and integral transfer repairs remain owned by R18.2 and are not prerequisites of the BZ division theorem. Needed by `HilbertModularVarietiesAndShimuraCurves:R18.5/split-place-descent-boundary`.

6. **Typed formal and moduli signatures.** The pins have no Bruhat–Tits tree, quaternionic adelic quotient, formal Drinfeld scheme, strict special quaternionic moduli, auxiliary PEL universal family or tower carriers. The suggested file contains only the height-label additive subgroup, light chart-action predicate and their statable terminal properties/examples. Every unavailable target is stated fully in the reader. Compilation does not elaborate any uniformisation theorem. Needed by `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-small-level`, `HilbertModularVarietiesAndShimuraCurves:R18.5/auxiliary-pel-local-factors`, `HilbertModularVarietiesAndShimuraCurves:R18.5/quaternionic-pel-uniformisation-transfer`, `HilbertModularVarietiesAndShimuraCurves:R18.5/very-free-drinfeld-quotient`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-level-structure-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.5/weighted-arithmetic-quotient-graph`.

**Incoming requests that remain follow-ups of this stage.** Two requests from consumers name this layer and are not planned by any R18 target. AutomorphicGaloisRepresentations:R19.2/carayol-local-fundamental-representation asks for the supersingular locus of Carayol's curves at a split prime through Drinfeld's height-2 formal O_p-modules with level structure (Carayol §§7–9) and Brylinski's identification of the vanishing cycles. GrossZagierAndArithmeticHeights:GZ.0 and HeegnerPointEulerSystems:HE.0 ask for the fixed points of a CM torus on the Drinfeld half-plane, their reduction to the tree and the CM specialization with the Frobenius and Atkin–Lehner convention. Both are recorded in this stage's remaining list: they are planned as follow-ups here or rerouted to their consumers, and no target above claims them.

### Baseline and existing upstream material

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The individual declaration statements below were read at the Mathlib pin. They supply existing carriers or equality criteria, not formal quaternionic geometry.

| Declaration | Existing input |
| --- | --- |
| `mathlib:DoubleCoset.Quotient` | Existing double-coset quotient; specialized, never reconstructed. Module: `Mathlib/GroupTheory/DoubleCoset.lean`. |
| `mathlib:DoubleCoset.eq` | Equality is witnessed by left and right subgroup multiplication. Module: `Mathlib/GroupTheory/DoubleCoset.lean`. |
| `mathlib:LinearMap` | Actual linear maps on integer cycle lattices, imported for monodromy and its cokernel. Module: `Mathlib/Algebra/Module/LinearMap/Defs.lean`. |
| `mathlib:AddSubgroup` | Existing additive-subgroup carrier and closure fields; no new general subgroup theory is planned. Module: `Mathlib/Algebra/Group/Subgroup/Defs.lean`. |
| `mathlib:MulAction` | Actual monoid/group actions, including identity and multiplication laws; used by the chart predicate. Module: `Mathlib/Algebra/Group/Action/Defs.lean`. |
| `mathlib:groupCohomology.H1ofAutOnUnitsUnique` | For a finite field extension L/K, H1 of its automorphism group acting on L units is unique; for the auxiliary CM quadratic extension this is Hilbert 90, used to obtain rational-point surjectivity of the central quotient. Module: `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean`. |
| `mathlib:groupCohomology.exists_div_of_norm_eq_one` | Hilbert 90 in norm form for a finite cyclic Galois extension with a chosen generator: an element of norm 1 is y/g(y) for a unit y. Applied to the CM extension L/F it gives the surjectivity of B̌^× × L^× → I(Q) in BZ (6.34). Module: `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean`. |

The current read-only upstream StableReduction roadmap supplies node charts, normalization/dual graphs, node blow-ups and regular/minimal models. The current Tau Ceti node algebra has the actual statements `TauCeti.NodeAlgebra.flat_spec`, `locallyOfFinitePresentation_spec`, `fiberIso` and `pureRelativeDimension_spec`. They are existing generic geometry, not new targets in this part. AdicSpacesPartII F0 already plans Grothendieck's algebraization theorem (`AdicSpacesPartII:F0/grothendieck-algebraization`); it does not supply the separated arithmetic quotient or the line bundle with ample reduction on it. ReductiveGroupsPartII supplies `BTTree.Vertex`, adjacency, the tree theorem and q+1 valence. The nine newer upstream roadmaps were checked for overlapping targets; none supplies the arithmetic Drinfeld or special-formal-module comparisons owned here.

The suggested file is a representative set of statements, not an exhaustive declaration checklist. It contains the height labels as a Mathlib additive subgroup of ℤ×ℤ, diagonal/difference maps, the chart-action predicate, terminal elementary properties and discriminating examples. The formal scheme, universal special module, PEL and tower carriers needed for the other targets are not available at the pins, so those targets are specified in this document rather than represented by arbitrary proposition-valued data. Elaborating the suggested file establishes no uniformisation theorem.

## Planets

R18.5 has six planets across its two owning specifications: Drinfeld upper half-plane, Drinfeld affinoid exhaustion, Drinfeld formal model, Special formal quaternionic moduli, Čerednik–Drinfeld uniformisation, and Kurihara graph with lengths. The first five retain their existing target ownership; only the sixth is added here. R18.6 has none. The additional comparisons and elementary label API remain targets without duplicating planets.

## Source versions and routing

Locators use printed pagination unless explicitly described as author pagination. Source statements have been expressed in our own words. The reading scope is the mathematics needed by R18.5 and the R18.6 interface. The wider source catalogue's routes remain assigned to H0–H6, R18.1–R18.4 and the external suppliers: an inherited route is not a claim that this part replans or rereads all the routed mathematics.

Carayol's curve notation, Yuan–Zhang's PEL integral towers and p-divisible sheaves, the R18.3 definite spaces used by the 2023 factorisation paper, and Allen et al.'s paired elliptic torsion twists retain those owners. The two CDN20 items assigned to R18.5 are the explicit half-plane/model and Proposition 5.4 tower comparison. Yuan–Zhang's R18.5 input is the superspecial lattice indexing; no averaged Colmez or height formula is planned here. Khare's neatness lemma and the KW definite coefficient modules remain R18.3 inputs. This distinguishes the source routes from prerequisites of a uniformisation proof.


### carayol

[Henri Carayol, Sur la mauvaise réduction des courbes de Shimura](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf). Version: Compositio Mathematica 59 (1986), 151–230; published scan. Read 13 October 2026.

Reading scope: Notations, pp.155–156; §§4.2–4.5, pp.184–189; page images pp.188–189 checked for the descent-field notation.

File SHA-256: `22c01e577504a9963168e78373286d8ecac6ecc8178db64262cf8d473b91b3b3`.

### yz

[Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Version: Annals of Mathematics 187 (2018), 533–638; version of record. Read 13 October 2026.

Reading scope: §8.3, superspecial uniformisation and lattice indexing, pp.619–620; other routed results are imported from the accepted H0 and R18.2 packets.

File SHA-256: `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507`.

### bc

[Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf). Version: Astérisque 196–197 (1991), article pp.45–158; full-volume PDF. Read 13 October 2026.

Reading scope: Part I §§1–3, pp.49–56; Part II §§7.4–8.4, pp.105–109; Part III §§5.2–5.5, pp.140–146; existing formal-module contracts retained from the accepted R18.2 packet.

File SHA-256: `2a9aa0b0a046cb37e4d6b6ccc06dfaa00f10d90223ac9d2cb94918d069295119`.

### bz

[Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1). Version: arXiv:2212.06886v1, 13 December 2022 (text dated 15 December). Read 13 October 2026.

Reading scope: §5.2–5.11, pp.34–40; §6.1–6.8, pp.40–51; source-specific levels (6.29)–(6.31), p.46; §4, (4.1)–(4.6), pp.17–18, and Lemma 2.1, p.6, checked by the review; inverse descent convention in §7, p.52.

File SHA-256: `89efb1ef16c2f7704d7f375f7aca4a2a5bcf81053211035b8c09d037545060dd`.

### kw

[Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Version: Author copy proofs.pdf, 98 pages, dated 30 May 2009; published Inventiones 178 (2009), 505–586. Read 13 October 2026.

Reading scope: §7 opening, author pp.57–60; §§8.2,8.4, author pp.73,77, checked only for the R18.6 export boundary; full mathematics already owned by R18.3/R18.4 and their consumers.

File SHA-256: `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4`.

### cdn20

[Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2). Version: arXiv:1704.08928v2, 7 June 2018; source for JAMS 33 (2020), 311–362. Read 13 October 2026.

Reading scope: §1.2–1.3.1, pp.12–14; §4.1, p.34; §5.2.1–5.2.2, pp.40–43, Proposition 5.4 and Remark 5.5.

File SHA-256: `15e4868f5b11ad113e2806b5e9884d7b100f529e67c6cd6030f24cf8e3ae9073`.

### kurihara

[Akira Kurihara, On some examples of equations defining Shimura curves and the Mumford uniformization](https://repository.dl.itc.u-tokyo.ac.jp/record/39680/files/jfs250303.pdf). Version: Journal of the Faculty of Science, University of Tokyo, Section IA 25 (1979), 277–300; published scan. Read 13 October 2026.

Reading scope: §3, Definition 3-1, Proposition 3-2, Lemma 3-3 and Proposition 3-4, pp.284–289; scan read directly on page images.

File SHA-256: `6ed841261ef5e0a8a792d9bec2eeb2704d62711ba885775ea8403be94ce2f7e0`.

### krz

[Stephen Kudla, Michael Rapoport and Thomas Zink, On the p-adic uniformization of unitary Shimura curves](https://arxiv.org/pdf/2007.05211v1). Version: arXiv:2007.05211v1 (10 July 2020), explicitly this preprint version. Read 13 October 2026.

Reading scope: Proposition 7.1.11 and proof, pp.115–116; Lemma 7.3.1, p.120; Proposition 7.3.2 and Theorem 7.3.3, p.121; the generic RZ theorem cited there is a supplier obligation.

File SHA-256: `a290c15734beb918b552ac1caa89069bc8ccb2569ac881b54120df10598c6ef7`.

Rapoport–Zink, *Period Spaces for p-divisible Groups*, Theorem 6.30, is cited by the uniformisation sources but was not independently read: that book is not in the cleared source list. The public Kudla–Rapoport–Zink preprint was read for the indicated polarized Hasse and descent arguments. It does not automatically supply Boutot–Zink's source-specific auxiliary group or all the hypotheses of a generic RZ uniformisation theorem. Those obligations are explicitly assigned to PELModuli Part II.

The independent review recorded one misprint in Boutot–Zink: the proof of Theorem 6.7 on p.51 cites Proposition 6.6 three times as 'Lemma 6.6'; the intended result is clear and nothing is affected. The finite-component field distinction follows Carayol's actual statement and repairs the interpretation of an imported roadmap interface; it is not an accusation against the paper. The inherited Yuan–Zhang integral determinant concerns remain attached to their owning targets.
