# Explicit K₀, layer Z.5: vector bundles and curves

This document is the plan of layer `KTheoryLowDegrees:Z.5` of the roadmap *Explicit K₀: projectives,
rank and determinant* (Part II of Tau Ceti's GrothendieckEulerForms). It follows the plan that
`KTheoryLowDegrees--Z.3.json` wrote for this layer and its review accepted on 7 October 2026. That
plan was written against the pinned libraries (Mathlib `082e2d3`, Tau Ceti `f790474`). Since then,
TauCetiRoadmap has merged two roadmaps that own most of the general vector-bundle material Z.5 had
to build:

- **AlgebraicVectorBundles**, whose layers L0A–L0C supply the monoidal structure on `X.Modules`, finite
  locally free sheaves, their rank, the affine comparison with finite projective modules, exterior
  powers and the determinant line;
- **SchemeAndStackFoundations**, whose §5.7 defines `K₀` and `G₀` of a scheme, the determinant on
  `K₀`, the map `K₀ → G₀` and its bijectivity on regular schemes with the resolution property. Its
  §3.3 supplies degrees of vector bundles on curves and its §3.4 the affine Picard comparison.

Tau Ceti `main` (`a91d3aa`, newer than the pin) has also added the group law on line-bundle classes,
`Cl(X) ≅ Pic(X)` for regular curves, the skyscraper sheaf of a residue field and the residue sequence
`0 → 𝒪_X(D) → 𝒪_X(D + y) → κ(y)_y → 0`.

A layer never re-plans what a Tau Ceti roadmap owns. So this follow-up does three things:

1. **It imports.** Each of the 40 earlier Z.5 nodes gets a disposition in the routing map (§7). Twelve
   become imports and one is removed. Five are narrowed to their comparison with this roadmap's
   ring-level objects. Thirteen keep their statements with new prerequisites, and nine are unchanged.
2. **It closes what was left open.** The Picard group, requested from JacobianChallenge layer A, now
   exists in Tau Ceti `main`. The inherited stage edges are settled as the red team asked.
3. **It plans what was still missing.** The first new node is an ample family of divisor line bundles
   on every regular noetherian curve. It gives the resolution property without separatedness and
   without the higher K-theory roadmap. The second is the *exact degree comparison* that the
   roadmap's handoff contract asks of Z.5: on a proper regular curve,
   `χ = rank·χ(𝒪_X) + deg ∘ det` on `K₀`, a point class has Euler characteristic equal to its
   residue degree, and the image of `(rank, deg ∘ det)` is `ℤ ⊕ δℤ`, with `δ` the index of the curve.

The layer's end theorem is unchanged:

```math
K_0(X)\xrightarrow{\ (\mathrm{rank},\,\det)\ }\mathbb Z\oplus \mathrm{Pic}(X)\qquad
\text{an isomorphism for every connected regular noetherian } X \text{ of dimension} \le 1,
```

with inverse `(n, L) ↦ (n − 1)[𝒪_X] + [L]`. Here `X` need not be separated, proper, or defined over
a field. Spectra of Dedekind domains, `Spec 𝒪_{F,S}`, `ℙ¹` over any field and the affine line with
doubled origin are all instances.

## 1. Scope and ownership

**Owned here.** After routing, Z.5 owns the following:

- the comparisons between the upstream sheaf-level objects on `Spec R` and this roadmap's ring-level
  `K₀`, rank, determinant, scalar extension and product (layers Z.1–Z.3);
- the determinant identities no upstream roadmap states: the exterior filtration of an extension, the
  canonical isomorphism `det E′ ⊗ det E″ ≅ det E` and `det(E ⊗ F) ≅ (det E)^{rank F} ⊗ (det F)^{rank E}`;
- powers of line-bundle classes by locally constant integers;
- Weibel's ring map `rank ⊕ det : K₀(X) → H⁰(X; ℤ) ⊕ Pic(X)` into the square-zero extension;
- the regular-curve package with its ample family, resolution property and length-one resolutions;
- the K/G isomorphism for regular curves, with the inverse formula;
- the class formulas for skyscrapers, effective and principal divisors and the generic rank;
- the point-class map, the rank–determinant theorem and its ring structure;
- the Dedekind and doubled-line cases;
- the degree comparison.

**Imported.**

| What | Owner |
| --- | --- |
| finite locally free sheaves, rank, rank loci, rank one = invertible, pullback, tensor, the equivalence with finite projective modules on `Spec R` | AlgebraicVectorBundles L0B; Tau Ceti `main` (`FiniteLocallyFreeSheaf`, `FiniteLocallyFreeSheaf.rank`, `finiteProjectiveEquiv`) |
| exterior powers, the determinant `determinantObj` for locally constant rank, the fixed-rank determinant functor | AlgebraicVectorBundles L0C; Tau Ceti `main` (`SheafOfModules.exteriorPower`) |
| strong symmetric monoidal pullback, duals | AlgebraicVectorBundles L0A–L0B |
| `Chow.K0`, `Chow.G0`, the exact structures, the ring structure, `K0.pullback`, `K0.rank`, `Chow.K0.det`, `Chow.K0.toG0`, `K0.toG0_bijective`, `Chow.HasResolutionProperty`, the localisation sequence of `G₀`, the pushforward `f_!` | SchemeAndStackFoundations §5.7 (atlas stage `SchemeAndStackFoundations:SF.5`) |
| the degree of vector bundles on proper curves; `Pic(Spec R) ≅ Pic(R)` | SchemeAndStackFoundations §§3.3–3.4 (`SchemeAndStackFoundations:SF.3`) |
| `Pic(X)` as a group, duals and pullback of line-bundle classes, `Cl(X) ≅ Pic(X)` on regular curves | JacobianChallenge layer A; Tau Ceti `main` (`CommGroup (LineBundleClass X)`, `SchemeWeilDivisor.classGroupAddEquivLineBundleClass`) |
| finite-dimensional coherent cohomology on proper curves | JacobianChallenge layer B |
| the skyscraper sheaf `κ(y)_y` and the residue sequence | Tau Ceti `main` (`Scheme.skyscraperResidueField`, `SchemeWeilDivisor.residueShortComplex_shortExact`) |
| exact and abelian Grothendieck groups and their universal properties | GrothendieckEulerForms layers 0–2; Tau Ceti `ExactK0`, `AbelianK0` (pinned) |
| ring-level `K₀`, rank, determinant, Dedekind classification | this roadmap, layers Z.1–Z.4 |

**Exported.**

- EllipticKTheory E.2 builds `K₀(E) ≅ ℤ² ⊕ E(F)` for an elliptic curve with a rational origin on
  Z.5's theorem and degree comparison.
- Z.6 tests Z.5's maps and compares them with `π₀` of the K-theory spectrum.
- SchemeKTheoryOperations KU-operations aggregates the result.

**Not here.**

- The origin-dependent elliptic formula is E.2's (RS-18). Z.5 keeps the gate that a genus-one curve
  without a rational point does not split the degree.
- The comparison with `π₀` of SchemeKTheoryOperations S.2's spectra is Z.6's.
- Higher K-groups, λ-operations and Adams operations belong to the S and K roadmaps.

## 2. Conventions

The 27 retained nodes of `KTheoryLowDegrees--Z.3.json` keep their statements. Their symbols are read
through the carrier substitution below, which is the `carrierSubstitution` list of the packet's
routing entry.

| In the earlier Z.5 nodes | Read as | Owner |
| --- | --- | --- |
| isVectorBundle X, Vect(X) (KTheoryLowDegrees:Z.5/vector-bundle) | AlgebraicGeometry.Scheme.Modules.isFiniteLocallyFree X and TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf X | AlgebraicVectorBundles L0B; Tau Ceti main a91d3aa, TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean |
| rank_x(E) | FiniteLocallyFreeSheaf.rank E x (a LocallyConstant X ℕ) | AlgebraicVectorBundles L0B; Tau Ceti main a91d3aa, VectorBundle/Rank.lean |
| vectorBundleExactStructure X | Chow.finiteLocallyFreeExact X (ambient short exact sequences with finite locally free terms) | SchemeAndStackFoundations §5.7 |
| K₀(Vect X) := ExactK0 (vectorBundleExactStructure X) | Chow.K0 X := ExactK0 (Chow.finiteLocallyFreeExact X), with the ⊗-ring structure, K0.pullback and K0.rank | SchemeAndStackFoundations §5.7 |
| G₀(X) (coherent sheaves) and the vector-bundle Cartan map c_X | Chow.G0 X and Chow.K0.toG0 X | SchemeAndStackFoundations §5.7 |
| ΛⁿE (KTheoryLowDegrees:Z.5/sheaf-exterior-power) | exteriorPowerModules X n, and exteriorPower X n on FiniteLocallyFreeSheaf X | AlgebraicVectorBundles L0C; Tau Ceti main a91d3aa, TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean (SheafOfModules.exteriorPower) |
| det E (KTheoryLowDegrees:Z.5/determinant-bundle) | determinantObj E : InvertibleSheaf X (and the fixed-rank functor determinant X r) | AlgebraicVectorBundles L0C |
| det : K₀(Vect X) → Pic(X) (KTheoryLowDegrees:Z.5/vector-bundle-determinant) | Chow.K0.det X : Chow.K0 X →+ Additive (LineBundleClass X) | SchemeAndStackFoundations §5.7 |
| Pic(X), formerly the units of the monoid LineBundleClass X | LineBundleClass X with its CommGroup instance (inverse = LineBundleClass.dual, LineBundleClass.inv_mk), pullback LineBundleClass.pullback | JacobianChallenge layer A; Tau Ceti main a91d3aa, LineBundle/Class.lean, Dual.lean, Functoriality.lean |
| O_y := coker(O(−y) → O_X) | Scheme.skyscraperResidueField y, with SchemeWeilDivisor.residueShortComplex at D = −y (residueShortComplex_shortExact) | Tau Ceti main a91d3aa, Modules/Skyscraper.lean and WeilDivisor/Scheme/ResidueSequence.lean |
| the resolution property (SchemeKTheoryOperations:S.1/resolution-property) | Chow.HasResolutionProperty X (every finitely presented module is a quotient of a finite locally free one) | SchemeAndStackFoundations §5.7 |
| Cl(X) ≅ Pic(X) on a regular curve (KTheoryLowDegrees:Z.5/line-bundle-divisorial) | SchemeWeilDivisor.classGroupAddEquivLineBundleClass X | JacobianChallenge layer A; Tau Ceti main a91d3aa, WeilDivisor/Scheme/Picard.lean |
| CommRing.Pic R ≃ Pic(Spec R) | Picard.lineBundleClass_spec_equiv_pic R, realised by the monoidal tilde equivalence of finite projective modules with finite locally free sheaves | SchemeAndStackFoundations §3.4; AlgebraicVectorBundles L0B (Tau Ceti main a91d3aa, VectorBundle/Affine/Basic.lean and Affine/Monoidal.lean) |

Further conventions, all as in the earlier plan:

- Modules are `𝒪_X`-modules in Mathlib's `X.Modules`.
- A *curve* here is a connected regular noetherian scheme of dimension ≤ 1. It need not be separated.
  By `Z.5/regular-curve-integral` such a scheme is integral, its generic stalk is the function field
  `K`, and its local rings at codimension-one points are discrete valuation rings. Together these are
  the *regular-curve package*: `IsIntegral X`, `IsNoetherian X`, `coheight x ≤ 1` for every `x`, and
  DVR stalks at `CodimensionOnePoint X`. These are exactly the hypotheses of Tau Ceti's
  `SchemeWeilDivisor.toLineBundleClass`.
- The determinant is an additive homomorphism `K₀(X) → Additive (Pic X)`, with `⊗` as the group law
  on `Pic`. The only ring structure on `ℤ ⊕ Pic(X)` is the square-zero one,
  `(a, L)(b, M) = (ab, L^b ⊗ M^a)`.
- Degrees on a proper curve over `k` are weighted by residue degrees: `deg_k 𝒪_X(y) = [κ(y) : k]`.

## 3. Vector-bundle K₀ and its comparison with ring K₀

**Imported.** The carrier is `FiniteLocallyFreeSheaf X` of AlgebraicVectorBundles L0B. Its objects
are the locally free, finitely presented `𝒪_X`-modules; equivalently, the modules with finite local
bases (Tau Ceti `main`, `SheafOfModules.isFiniteLocallyFree_iff_exists_isLocallyFreeData_isFiniteType`).
The rank is a `LocallyConstant X ℕ` that is additive on biproducts, multiplicative on tensor products
and preserved by pullback. The invertible sheaves are exactly the sheaves of constant rank one.

`Chow.K0 X` is `TauCeti.ExactK0` of the exact structure `Chow.finiteLocallyFreeExact X`, whose
conflations are the ambient short exact sequences of finite locally free sheaves; these split locally
but not always globally. It is a commutative ring under `⊗` with unit `[𝒪_X]`. `K0.pullback` is a ring
map, `K0.rank` is the rank, and `Chow.K0.det` sends `[E]` to the class of AlgebraicVectorBundles L0C's
`determinantObj E` (SchemeAndStackFoundations §5.7). The earlier nodes `Z.5/vector-bundle`,
`Z.5/vector-bundle-extension-closed`, `Z.5/vector-bundle-essentially-small` and
`Z.5/vector-bundle-k-zero` therefore leave the layer. So do the constructions inside
`Z.5/vector-bundle-k-zero-pullback`, `Z.5/vector-bundle-k-zero-ring` and `Z.5/vector-bundle-rank`.
Their unit tests become checks of the import:

- the zero sheaf has rank `0`;
- `𝒪_X^{⊕3}` has rank `3`;
- an infinite free sheaf and a skyscraper at a closed point of a curve are not finite locally free;
- `Chow.K0 ∅ = 0`;
- on `ℙ¹_F` the Euler sequence gives `[𝒪(−2)] + [𝒪] = 2[𝒪(−1)]`, a relation that the split K₀ of
  `FiniteLocallyFreeSheaf` does not have.

**Owned here: comparisons on `Spec R`.** Let `R` be a commutative ring. AlgebraicVectorBundles' equivalence
`tildeFiniteProjectiveEquiv R` between finitely generated projective `R`-modules and finite locally
free sheaves on `Spec R` sends split sequences to split conflations. So `ExactK0.mapEquiv` and
`Z.1/ring-k0-exact` give an isomorphism

```math
\mathrm{RingK0}\,R \;\cong\; \mathrm{Chow.K0}(\operatorname{Spec} R),\qquad [P]\mapsto[\widetilde P].
```

This is `Z.5/vector-bundle-affine-comparison`, narrowed. The narrowed nodes `Z.5/vector-bundle-rank`,
`Z.5/vector-bundle-k-zero-pullback`, `Z.5/vector-bundle-k-zero-ring` and
`Z.5/picard-affine-comparison` keep the following compatibilities of this isomorphism:

- `K0.rank [P~] = RingK0.rank [P]` (`rank_affine`);
- `K0.pullback` along `Spec S → Spec R` is scalar extension `Z.1/ring-k0-map` (`pullback_spec`);
- it is a ring isomorphism for the product of `Z.3/finite-projective-monoidal` (`affineRingEquiv`);
- `determinantObj (P~) ≅ (detProjective P)~`, naturally in isomorphisms (`det_tilde`);
- `Chow.K0.det` corresponds to `Z.3/determinant-hom` under the tilde realisation of
  `Picard.lineBundleClass_spec_equiv_pic` (`det_affine`).

`Z.5/vector-bundle-rank` also keeps two things SchemeAndStackFoundations does not state. The first is
the split surjection of the rank (Weibel II.8.1): the classes `[𝒪^f] − [𝒪^g]` of componentwise free
sheaves form a subring mapped isomorphically onto `LocallyConstant X ℤ`. The second is the reduced
ideal `K̃₀(X) = ker rank`.

*Checks.*

- For a field `F`, `Chow.K0 (Spec F) ≅ RingK0 F ≅ ℤ` by dimension (`Z.2/division-ring-k0`).
- On `Spec(F × F)` the rank takes the values `(1, 0)` and `(0, 1)`; a rank collapsed to one integer
  fails this test.
- For `R = ℤ[√−5]` and `I = (2, 1 + √−5)`, `[I~] − [𝒪]` has rank `0` and determinant the class of
  `I`, which has order two.

## 4. Determinants and the Picard group

**Imported.** `Pic(X)` is Tau Ceti's `LineBundleClass X`. In Tau Ceti `main` it is a commutative group,
with inverse the dual (`LineBundleClass.inv_mk`, `InvertibleSheaf.dual`, `InvertibleSheaf.tensorDualIso`)
and with pullback `LineBundleClass.pullback` satisfying `pullback_id` and `pullback_comp`. This
supplies the group structure that `KTheoryLowDegrees--Z.3.json` requested from JacobianChallenge
layer A. Its prototype carrier, the units `(LineBundleClass X)ˣ`, is retired. Multiplicativity of
Picard pullback comes from AlgebraicVectorBundles L0A's strong symmetric monoidal pullback
(`pullbackTensorIso`) and L0B's `pullbackDualIso`. Exterior powers and `determinantObj` are
AlgebraicVectorBundles L0C's.

**Owned here.** These nodes are not stated upstream and keep their statements.

- `Z.5/exterior-power-extension-filtration`. Let `0 → E′ → E → E″ → 0` be a conflation of finite
  locally free sheaves. Then `ΛⁿE` has a canonical filtration whose graded pieces are
  `ΛⁱE′ ⊗ Λⁿ⁻ⁱE″`, natural in morphisms of sequences and compatible with pullback. Hence
  `[ΛⁿE] = Σᵢ [ΛⁱE′ ⊗ Λⁿ⁻ⁱE″]` in `Chow.K0 X`. The sequence `0 → ℤ → ℤ → ℤ/2 → 0` on `Spec ℤ`
  shows that the vector-bundle hypothesis is needed.
- `Z.5/determinant-bundle-extension`. For such a sequence there is a canonical isomorphism
  `det E′ ⊗ det E″ ≅ det E`, given by wedging with local lifts (Stacks 0B38). This is the identity
  that makes `Chow.K0.det` well defined. SchemeAndStackFoundations leaves that as an obligation, and
  §11 passes it on.
- `Z.5/determinant-bundle-tensor`. If `E` and `F` have constant ranks `m` and `n`, then
  `det(E ⊗ F) ≅ (det E)^{⊗n} ⊗ (det F)^{⊗m}` (Weibel Ex. II.8.5). The proof checks transition matrices
  with `Matrix.det_kronecker`; it uses no splitting principle and no reducedness.
- `Z.5/pic-disjoint-cover-ext`, `Z.5/pic-locally-constant-module`,
  `Z.5/pic-locally-constant-pullback` and `Z.5/pic-locally-constant-affine`. These make
  `Additive (Pic X)` a module over `LocallyConstant X ℤ`, with `L^a` defined fibrewise on the clopen
  sets `a⁻¹(n)`. Pullback is semilinear for `a ↦ a ∘ f`, and on `Spec R` the operation agrees with
  `Z.3/pic-locally-constant-power`. The only change is that negative powers use Tau Ceti `main`'s dual.
- `Z.5/rank-determinant-surjective`. `rank ⊕ det : Chow.K0 X → TrivSqZeroExt(LocallyConstant X ℤ, Additive (Pic X))`
  is a surjective ring homomorphism (Weibel Theorem II.8.1 with Ex. II.8.5). `SK₀(X)` is its kernel.

## 5. Regular curves and the K/G comparison

`Z.5/regular-curve-integral` (unchanged). Let `X` be locally noetherian with regular local rings of
dimension ≤ 1. Then `X` is the disjoint union of integral normal schemes, and if `X` is connected and
noetherian it satisfies the regular-curve package.

### New: `Z.5/regular-curve-ample-family`

*Statement.* Let `X` satisfy the regular-curve package.

- **(a)** For every nonempty open `U ⊆ X`, the complement `X ∖ U` is a finite set of closed points,
  each of coheight one.
- **(b)** Consider the boundary divisor `D_U = Σ_{z ∉ U} z`. It has coefficient `1` at the
  codimension-one points outside `U` and `0` at those of `U`. Its sheaf `𝒪_X(D_U)` is invertible.
  The rational function `1` is a global section `s_U` of `𝒪_X(D_U)`, and `s_U` generates the stalk
  exactly at the points of `U`, so `X_{s_U} = U`.
- **(c)** Let `U₁, …, U_m` be nonempty affine opens covering `X`. Then the sheaves `𝒪_X(D_{U_i})`
  with the sections `s_{U_i}` form an ample family of invertible modules (Stacks 0FXR, exponent one).

No separatedness or affine-diagonal hypothesis is used. A noetherian scheme with regular local rings
of dimension ≤ 1 inherits such a family componentwise.

*Proof sketch.*

- **(a)** `U` contains the generic point. A point outside `U` has coheight one, and is therefore closed
  (Tau Ceti's `isClosed_singleton_of_forall_coheight_le_one_of_coheight_eq_one`). The closed set
  `X ∖ U` has finitely many irreducible components, and each is such a point.
- **(b)** Every Weil divisor here is locally principal (`isLocallyPrincipal_of_forall_coheight_le_one`),
  so `SchemeWeilDivisor.sheaf D_U` is invertible (`toInvertibleSheaf`). The section `1` is allowed
  because `D_U ≥ 0`. On `U` the sheaf is `𝒪_U` (`unitIsoSheafZero`). At `z ∉ U` the stalk is
  `π_z⁻¹𝒪_{X,z}`, and `1 = π_z·π_z⁻¹` does not generate it.
- **(c)** Each `U_i = X_{s_{U_i}}` is affine and they cover `X`. In general Stacks 0GML needs an affine
  diagonal to make complements of affine opens into Cartier divisors; in dimension one, (a) does
  this.
- **Use.** Let `F` be coherent and let the `t_{ij}` generate `F|_{U_i}`. By Stacks 01PW, `s_{U_i}^n t_{ij}`
  extends to a global section of `F(nD_{U_i})`, that is, to a map `𝒪_X(−nD_{U_i}) → F`. The sum of
  these maps is onto (Stacks 0GMM).

*Checks.*

- On `ℙ¹_k` with `U = 𝔸¹`, `D_U = ∞` and `𝒪(D_U) = 𝒪(1)`.
- On `Spec 𝒪_F` with `U = X ∖ {𝔭}`, `𝒪(D_U) = 𝔭⁻¹`.
- On the affine line with doubled origin, the charts give `{𝒪(0″), 𝒪(0′)}`, an ample family. That
  scheme has no ample invertible sheaf, since a scheme with one is separated (Stacks 01PY); Stacks
  Remark 0FXT gives the same family as its example of a non-separated scheme with an ample family.
- On the doubled plane, the complement of a chart is a point of codimension two, which supports no
  Cartier divisor, and the resolution property fails (SchemeAndStackFoundations §5.7 Check).

*Prerequisites.* `Z.5/regular-curve-integral`; pinned Tau Ceti `CodimensionOnePoint`,
`SchemeWeilDivisor`, `WeilDivisor.ofPoint`, `WeilDivisor.coeff`, `SchemeWeilDivisor.sheaf`,
`unitIsoSheafZero`, `isLocallyPrincipal_of_forall_coheight_le_one`, `toInvertibleSheaf` and
`isClosed_singleton_of_forall_coheight_le_one_of_coheight_eq_one`; Mathlib `IsAffineOpen`,
`IsNoetherian`, `IsIntegral` and `Order.coheight`.

*Lean.*

- `TauCeti.AlgebraicGeometry.KTheory.compl_finite_of_coheight_le_one` gives (a), finiteness.
- `…KTheory.coheight_eq_one_and_isClosed_of_not_mem` gives (a), the points.
- `…KTheory.exists_boundaryDivisor` gives (b), the coefficients.
- The family itself and `X_{s_U}` have no pinned carrier and stay README targets.

### Rerouted: the resolution property, finite resolutions and the K/G isomorphism

- `Z.5/regular-curve-resolution-property` (rerouted). Every regular noetherian scheme of dimension
  ≤ 1 satisfies `Chow.HasResolutionProperty`: every finitely presented (equivalently, coherent) module
  is a quotient of a finite locally free one. The proof is the ample family above with Stacks 0GMM;
  the earlier route through Stacks 0F8A and `SchemeKTheoryOperations:S.1/resolution-property` is
  dropped. Separatedness is not needed. The suggested file states this at the pins as
  `TauCeti.AlgebraicGeometry.KTheory.hasResolutionProperty_of_regular_coheight_le_one`, with
  SchemeAndStackFoundations' predicate written out.
- `Z.5/regular-curve-finite-resolution` (rerouted). For every surjection `E₀ → F` from a finite locally
  free sheaf onto a coherent sheaf, the kernel is finite locally free (Stacks 0CC4: on an integral
  regular scheme of dimension ≤ 1 a coherent torsion-free module is finite locally free). So `F` has
  a resolution `0 → E₁ → E₀ → F → 0`. On `Spec ℤ`, `0 → ℤ →(n) ℤ → ℤ/n → 0` for `n ≠ 0`.
- `Z.5/regular-curve-cartan-iso` (rerouted; planet *Cartan isomorphism for regular curves*). For
  every regular noetherian scheme of dimension ≤ 1, `c_X = Chow.K0.toG0 X : Chow.K0 X → Chow.G0 X`
  is an isomorphism, with inverse `[F] ↦ [E₀] − [E₁]` for any resolution as above. Bijectivity is
  SchemeAndStackFoundations §5.7's `K0.toG0_bijective` (noetherian, regular stalks, resolution
  property). The identification of `c_X` with `π₀` of the Poincaré-duality equivalence `K(X) ≃ G(X)`
  of SchemeKTheoryOperations S.2 moves to Z.6. With this, Z.5 no longer depends on any layer of the
  higher K-theory roadmaps.

## 6. Class formulas, the rank–determinant theorem and the degree comparison

The skyscraper at a closed point `y` is Tau Ceti `main`'s `Scheme.skyscraperResidueField y`, written
`κ(y)_y`. The sequence `0 → 𝒪_X(−y) → 𝒪_X → κ(y)_y → 0` is `SchemeWeilDivisor.residueShortComplex`
at `D = −y` (`residueShortComplex_shortExact`). The earlier nodes `Z.5/point-ideal-sheaf`,
`Z.5/point-skyscraper-exact-sequence` and `Z.5/point-divisor-line-inverse` are imports. The divisor
dictionary `Cl(X) ≅ Pic(X)` is Tau Ceti `main`'s `SchemeWeilDivisor.classGroupAddEquivLineBundleClass`,
whose hypotheses are exactly the regular-curve package, so `Z.5/line-bundle-divisorial` is an import
too.

The following nodes are kept or rerouted, with their statements unchanged.

- `Z.5/skyscraper-class`. `c_X⁻¹[κ(y)_y] = [𝒪_X] − [𝒪_X(−y)]`, of rank `0` and determinant `𝒪_X(y)`.
- `Z.5/effective-divisor-class`. For `D = Σ n_y y` with `n_y ≥ 0`:
  `c_X⁻¹[𝒪_D] = [𝒪_X] − [𝒪_X(−D)] = Σ n_y([𝒪_X] − [𝒪_X(−y)])`, of rank `0` and determinant
  `𝒪_X(D)`. The proof now iterates the residue sequences.
- `Z.5/principal-divisor-class-vanishes`. `Σ_y ord_y(g)[κ(y)_y] = 0` in `G₀(X)` for `g ∈ K^×`. Stacks
  0FDS (the proof of Lemma 42.23.4) prints the quotient-class difference with the opposite sign (source issue `KTheoryLowDegrees/E27`
  of the earlier packet).
- `Z.5/generic-rank-kernel` (rerouted). The generic rank `G₀(X) → ℤ` is onto, and its kernel is
  generated by the classes `[κ(y)_y]`. New proof:
  - Take a nonempty affine open `U = Spec A`. By `Z.5/regular-curve-ample-family` (a), `Z = X ∖ U` is
    finite.
  - Use the degree-zero localisation sequence `G₀(Z) → G₀(X) → G₀(U) → 0` of SchemeAndStackFoundations
    §5.7.
  - `G₀(Z)` is generated by skyscrapers (dévissage, Weibel Theorem II.6.3).
  - `G₀(U) ≅ RingK0 A ≅ ℤ ⊕ Pic(A)` by `K0.toG0_bijective`, `Z.5/vector-bundle-affine-comparison` and
    `Z.4/rank-pic-equivalence`, and `Pic(A)` is generated by the classes `[A/𝔭]`.

  This is Weibel's argument for Proposition II.8.2.1 with an arbitrary affine open in place of the
  complement of one point, as source issue `KTheoryLowDegrees/E19` requires. It replaces the higher
  localisation sequence of `SchemeKTheoryOperations:S.3`.
- `Z.5/point-class-map`. `cl : Cl(X) → Chow.K0 X`, `D ↦ Σ n_y([𝒪_X] − [𝒪_X(−y)])`, lands in
  `K̃₀(X)`, satisfies `c_X(cl D) = Σ n_y [κ(y)_y]`, and `det ∘ cl = classGroupToLineBundleClass`.
- `Z.5/curve-rank-determinant-equivalence` (planet *K₀ of a nonsingular curve*). Let `X` be a connected
  regular noetherian scheme of dimension ≤ 1. Then `(rank, det) : Chow.K0 X ≃ ℤ × Additive (Pic X)`,
  with inverse `(n, L) ↦ (n − 1)[𝒪_X] + [L]`. Equivalently `SK₀(X) = 0` and
  `K̃₀(X) ≅ Pic(X) ≅ Cl(X)`. The class formulas are `[𝒪_X] ↦ (1, 𝒪_X)`, `[L] ↦ (1, L)`,
  `c_X⁻¹[κ(y)_y] ↦ (0, 𝒪_X(y))` and `cl[D] ↦ (0, 𝒪_X(D))`. The connectedness and rational-point
  gates are kept.
- `Z.5/curve-k-zero-ring`. Under the theorem, the product is `(a, L)(b, M) = (ab, L^b ⊗ M^a)`, so
  `K̃₀(X)² = 0`. This is not the product ring `ℤ × Pic(X)`.
- `Z.5/dedekind-curve-comparison`. For `X = Spec A` with `A` a Dedekind domain, the theorem is
  `Z.4/rank-pic-equivalence`, and the skyscraper at `𝔭` maps to `(0, [𝔭]⁻¹)`.
- `Z.5/doubled-line-example`. For the affine line with doubled origin, `Pic(X) ≅ ℤ` and
  `Chow.K0 X ≅ ℤ² ≅ Chow.G0 X`; the class `c_X⁻¹[κ(0′)]` is nonzero but vanishes on both charts. The
  resolution property now comes from the ample family. Stacks Remark 0FXT, on the scheme of Stacks
  Example 01JD, constructs the invertible sheaves trivial on both charts that give this family.

### New: `Z.5/point-class-degree-comparison` (planet *Euler characteristic and degree on K₀ of a curve*)

*Setting.* Let `k` be a field and `X` a connected regular noetherian scheme of dimension ≤ 1, proper
over `k`, with structure map `f`. Put `χ_k = f_! ∘ Chow.K0.toG0 : Chow.K0 X → ℤ`, where `f_!` is §5.7's
pushforward `[F] ↦ Σ(−1)^i [R^i f_* F]` to `G₀(Spec k) = ℤ`, and `deg_k L = χ(L) − χ(𝒪_X)` on
`Pic(X) = LineBundleClass X`.

*Statement.*

- **(a)** For every `x ∈ Chow.K0 X`, `χ_k(x) = rank(x)·χ(𝒪_X) + deg_k(det x)`. In particular `deg_k`
  is a homomorphism.
- **(b)** For a closed point `y`, `χ_k(c_X⁻¹[κ(y)_y]) = [κ(y) : k] = deg_k 𝒪_X(y)`. For a Weil
  divisor `D = Σ n_y y`,
  `χ_k(cl D) = deg_k 𝒪_X(D) = Σ n_y [κ(y) : k] = SchemeWeilDivisor.relativeDegree f D`.
- **(c)** `(rank, deg_k ∘ det) : Chow.K0 X → ℤ²` has image `ℤ ⊕ δ_X ℤ`, where `δ_X` is the greatest
  common divisor of the residue degrees of the closed points (the index). It is onto exactly when
  `δ_X = 1`, for instance when `X` has a `k`-rational point.

*Proof sketch.*

- `χ_k` is additive, because `f_!` is (§5.7, with the finiteness of JacobianChallenge layer B).
- **(a)** Write `x = (n − 1)[𝒪_X] + [L]` by the rank–determinant theorem. Then
  `χ_k(x) = nχ(𝒪_X) + deg_k L`. Taking `x = [L] + [M] − 2[𝒪_X]` shows `deg_k` is additive.
- **(b)** `H⁰(κ(y)_y) = κ(y)` (Tau Ceti `main`'s `finrank_cohomology_zero_skyscraperResidueField`) and
  the skyscraper is flasque. Combine this with `Z.5/skyscraper-class` and additivity of `cl`.
- **(c)** Every line bundle is `𝒪_X(D)`, so `deg_k(Pic X)` is the image of `relativeDegree f`.

For classes of vector bundles, (a) is SchemeAndStackFoundations §3.3's definition of
`vectorBundleDegree` combined with its `_det` law (Stacks 0AYR and 0DJ5). The node supplies the `K₀`
form and the comparison with the point-class map, which the roadmap's handoff contract asks of Z.5.

*Checks.*

- On `ℙ¹_k`, `χ_k[𝒪(n)] = n + 1`, and `(rank, deg ∘ det)` is an isomorphism onto `ℤ²`.
- On `ℙ¹_ℚ`, the point `t² + 1 = 0` has `χ(cl y) = 2` and `𝒪(y) ≅ 𝒪(2)`; counting points would give
  `1`.
- The conic `x² + y² + z² = 0` over `ℝ` has `δ = 2` and `χ(𝒪_C) = 1`. The image is `ℤ ⊕ 2ℤ` although
  `Pic(C) ≅ ℤ`. Line bundles over the base, not the `ℝ`-points of the Picard scheme, are what count
  (`Z.6/pointless-conic-test`).
- An elliptic curve with a rational origin has `χ(𝒪_E) = 0` and `δ = 1`, which EllipticKTheory E.2
  uses.
- For `Spec K` with `[K : k] = d`, `χ_k[𝒪] = d`, so the factor `χ(𝒪_X)` cannot be replaced by `1`.

*Prerequisites.* `Z.5/curve-rank-determinant-equivalence`, `Z.5/skyscraper-class`, `Z.5/point-class-map`,
`Z.5/regular-curve-cartan-iso`, `Z.5/regular-curve-integral`; `SchemeAndStackFoundations:SF.5` (§5.7) and
`SchemeAndStackFoundations:SF.3` (§3.3); JacobianChallenge layers A and B; pinned Tau Ceti
`SchemeWeilDivisor.relativeDegree`, `relativeDegree_ofPoint` and `Scheme.Modules.eulerCharBelow`;
Mathlib `Scheme.Hom.residueDegree` and `IsProper`.

*Lean.* The `K₀` carriers are not at the pins, so the statement is a README target. The suggested file
states the divisor-level part of (c) at the pins:
`TauCeti.AlgebraicGeometry.KTheory.range_relativeDegree` identifies the range of `relativeDegree f` with
the subgroup generated by the residue degrees.

## 7. Routing map of the earlier Z.5 nodes
Each node of `KTheoryLowDegrees--Z.3.json` in layer Z.5 has one row. The rows are the `map` of the packet's restructure entry *Rebase Z.5 on the merged upstream suppliers*. They are applied in the KTheoryLowDegrees package (or a revision of KTheoryLowDegrees--Z.3.json); this job may not edit that file.

### Imported (leave Z.5) — 12

- **`Z.5/vector-bundle`**. AlgebraicVectorBundles L0B packages exactly this object (locally free and finitely presented, equivalently finite local bases), its isomorphism closure, free sheaves, the rank as a locally constant function, its biproduct, tensor and pullback laws, and rank one = InvertibleSheaf; Tau Ceti main implements it. The node's unit tests (zero sheaf, O^3 of rank 3, invertible sheaves, an infinite free sheaf and a skyscraper as non-examples) become checks of the import in the reader.
  - *Replaced by:* AlgebraicVectorBundles L0B; Tau Ceti main a91d3aa: AlgebraicGeometry.Scheme.Modules.isFiniteLocallyFree, TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf, FiniteLocallyFreeSheaf.free, FiniteLocallyFreeSheaf.rank, rankLocus, rank_eq_of_iso, rank_free_apply, rank_biprod_apply, rank_tensor_apply, rank_pullback_apply, isInvertible_iff_forall_rank_eq_one, SheafOfModules.isFiniteLocallyFree_iff_exists_isLocallyFreeData_isFiniteType.
- **`Z.5/vector-bundle-extension-closed`**. SchemeAndStackFoundations §5.7 defines Chow.finiteLocallyFreeExact as the exact structure induced on the extension-closed full subcategory of finite locally free sheaves, conflations being the ambient short exact sequences; extension-closedness is its proof obligation. The node's local-splitting proof is passed to the upstream owner (upstreamNotes).
  - *Replaced by:* SchemeAndStackFoundations §5.7 (Chow.finiteLocallyFreeExact); AlgebraicVectorBundles L0B (containsZero and finite-product closure).
- **`Z.5/vector-bundle-essentially-small`**. Chow.K0 is ExactK0 of FiniteLocallyFreeSheaf X, which requires essential smallness in the universe of X; this is part of SchemeAndStackFoundations §5.7's definition. The node's gluing-data proof is passed upstream (upstreamNotes).
  - *Replaced by:* SchemeAndStackFoundations §5.7 (Chow.K0).
- **`Z.5/vector-bundle-k-zero`**. Chow.K0 X = ExactK0 (Chow.finiteLocallyFreeExact X) is the same group; its API (of, of_conflation, of_biprod, lift, hom_ext, induction_on) is the pinned ExactK0 API. The planet 'K₀ of vector bundles' leaves Z.5. Its tests (empty scheme, free sheaves, Spec of a field, the Euler sequence on P¹, a non-split conflation) become checks of the import.
  - *Replaced by:* SchemeAndStackFoundations §5.7 (Chow.K0).
  - *Consumers to rewire:* Z.6/vector-bundle-k-zero-pi-zero: cite Chow.K0 through SchemeAndStackFoundations:SF.5.
- **`Z.5/sheaf-exterior-power`**. AlgebraicVectorBundles L0C constructs the exterior powers of O_X-modules with their affine and pullback compatibilities; Tau Ceti main has SheafOfModules.exteriorPower with exteriorPowerIso, exteriorPower_map, exteriorPowerZeroIso and exteriorPowerOneIso.
  - *Replaced by:* AlgebraicVectorBundles L0C (exteriorPowerModules); Tau Ceti main a91d3aa: SheafOfModules.exteriorPower.
- **`Z.5/exterior-power-vector-bundle`**. AlgebraicVectorBundles L0C gives exteriorPower X n as an endofunctor of FiniteLocallyFreeSheaf X with its rank formula and pullback comparison pullbackExteriorPowerIso.
  - *Replaced by:* AlgebraicVectorBundles L0C (exteriorPower, exteriorPowerObjIso, pullbackExteriorPowerIso).
- **`Z.5/determinant-bundle`**. AlgebraicVectorBundles L0C defines determinantObj for locally constant rank and the fixed-rank determinant functor, with pullback comparisons. The affine comparison det(P~) ≅ (detProjective P)~ (API item det_tilde) moves to the narrowed KTheoryLowDegrees:Z.5/picard-affine-comparison. The planet 'Determinant line bundle' leaves Z.5.
  - *Replaced by:* AlgebraicVectorBundles L0C (determinantObj, determinant, determinantObjIso, determinantFixedRankObjIso).
- **`Z.5/vector-bundle-determinant`**. SchemeAndStackFoundations §5.7 defines Chow.K0.det X : Chow.K0 X →+ Additive (LineBundleClass X), [E] ↦ [determinantObj E]; the group law on LineBundleClass X is in Tau Ceti main. The comparison with KTheoryLowDegrees:Z.3/determinant-hom on Spec R (API item det_affine) moves to the narrowed KTheoryLowDegrees:Z.5/picard-affine-comparison.
  - *Replaced by:* SchemeAndStackFoundations §5.7 (Chow.K0.det).
  - *Consumers to rewire:* Z.6/graded-det-pi-zero: cite Chow.K0.det through SchemeAndStackFoundations:SF.5.
- **`Z.5/line-bundle-divisorial`**. Tau Ceti main proves Cl(X) ≃+ Pic(X) for exactly the regular-curve package (IsIntegral, IsNoetherian, coheight ≤ 1, DVR codimension-one stalks): SchemeWeilDivisor.classGroupAddEquivLineBundleClass, with toLineBundleClass_surjective and classGroupToLineBundleClass_surjective. JacobianChallenge layer A owns the dictionary (RS-18 owners row), and SchemeAndStackFoundations §3.4 compares it with picardToClassGroup. The planet 'Pic = Cl for regular curves' leaves Z.5.
  - *Replaced by:* JacobianChallenge layer A (Tau Ceti main a91d3aa: SchemeWeilDivisor.classGroupAddEquivLineBundleClass); SchemeAndStackFoundations §3.4.
  - *Consumers to rewire:* Z.5/curve-rank-determinant-equivalence; Z.5/doubled-line-example; Z.6/pointless-conic-test; Z.6/projective-line-regular-curve; EllipticKTheory:E.2/picard-group-is-the-divisor-class-group.
- **`Z.5/point-ideal-sheaf`**. The ideal sheaf of a closed codimension-one point is the divisor sheaf O(−y) ⊆ O_X (pinned SchemeWeilDivisor.sheaf, sheafHomOfLE, unitIsoSheafZero), and Tau Ceti main identifies it as the kernel of the residue map (SchemeWeilDivisor.toSkyscraperResidueField_app_eq_zero_iff).
  - *Replaced by:* Tau Ceti main a91d3aa: SchemeWeilDivisor.toSkyscraperResidueField, toSkyscraperResidueField_app_eq_zero_iff.
- **`Z.5/point-skyscraper-exact-sequence`**. Tau Ceti main proves 0 → O(D) → O(D + y) → κ(y)_y → 0 for every Weil divisor D and closed codimension-one y (SchemeWeilDivisor.residueShortComplex_shortExact); D = −y is the node.
  - *Replaced by:* Tau Ceti main a91d3aa: SchemeWeilDivisor.residueShortComplex_shortExact, Scheme.skyscraperResidueField.
- **`Z.5/point-divisor-line-inverse`**. Immediate from the pinned toLineBundleClass_add and toLineBundleClass_zero; with Tau Ceti main's group law it is classGroupToLineBundleClass_neg.
  - *Replaced by:* tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toLineBundleClass_add (pinned); Tau Ceti main a91d3aa: SchemeWeilDivisor.classGroupToLineBundleClass_neg.

### Removed — 1

- **`Z.5/curve-ample-line-bundle`**. No node of any packet cites it. The separated case of the resolution property is SchemeAndStackFoundations §5.7's resolutionProperty_of_quasiProjective (Stacks 09NZ with 0F87), and Z.5 now uses the ample family of KTheoryLowDegrees:Z.5/regular-curve-ample-family for every regular curve.

### Narrowed — 5

- **`Z.5/vector-bundle-affine-comparison`**. The category equivalence is now AlgebraicVectorBundles L0B's tildeFiniteProjectiveEquiv (Tau Ceti main FiniteLocallyFreeSheaf.finiteProjectiveEquiv, isFiniteLocallyFree_tilde_iff, rank_apply_eq_rankAtStalk). What no upstream roadmap states is the comparison with this roadmap's ring K₀, which stays here.
  - *Keeps:* RingK0 R ≃+ Chow.K0 (Spec R), [P] ↦ [P~], obtained by ExactK0.mapEquiv from the equivalence above (conflations on both sides split, TauCeti.finiteProjectiveModulesExactStructure_eq_split) and composed with KTheoryLowDegrees:Z.1/ring-k0-exact; and rank[P~] = RingK0.rank [P] (KTheoryLowDegrees:Z.2/rank-hom).
  - *Add prerequisites:* SchemeAndStackFoundations:SF.5.
  - *Drop prerequisites:* mathlib:AlgebraicGeometry.tildeEquiv (used only through the upstream equivalence).
  - *Consumers to rewire:* Z.6/cartan-map-comparison; Z.6/field-product-test; Z.6/field-test; Z.6/vector-bundle-k-zero-pi-zero.
- **`Z.5/vector-bundle-k-zero-pullback`**. SchemeAndStackFoundations §5.7 owns K0.pullback (a ring map) with identity and composition laws, built on AlgebraicVectorBundles L0B's pullbackFiniteLocallyFree, pullbackIdIso and pullbackCompIso (Tau Ceti main FiniteLocallyFreeSheaf.pullback).
  - *Keeps:* pullback_spec: under KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison, K0.pullback along Spec S → Spec R is the scalar extension RingK0.map of KTheoryLowDegrees:Z.1/ring-k0-map.
  - *Replaced by:* SchemeAndStackFoundations §5.7 (K0.pullback); AlgebraicVectorBundles L0B.
  - *Consumers to rewire:* Z.6/localisation-projective-class; Z.6/vector-bundle-k-zero-pi-zero.
- **`Z.5/vector-bundle-k-zero-ring`**. SchemeAndStackFoundations §5.7 makes Chow.K0 X a commutative ring under ⊗ with [O_X] = 1 and K0.pullback a ring map, using AlgebraicVectorBundles L0B's symmetric monoidal FiniteLocallyFreeSheaf X. Exactness of ⊗ in each variable on conflations is that construction's obligation (upstreamNotes).
  - *Keeps:* affineRingEquiv: RingK0 R ≃+* Chow.K0 (Spec R) for KTheoryLowDegrees:Z.3/finite-projective-monoidal, from the monoidal tilde equivalence (Tau Ceti main VectorBundle/Affine/Monoidal.lean).
  - *Replaced by:* SchemeAndStackFoundations §5.7 (ring structure); AlgebraicVectorBundles L0B.
  - *Consumers to rewire:* Z.6/vector-bundle-k-zero-pi-zero.
- **`Z.5/vector-bundle-rank`**. SchemeAndStackFoundations §5.7 owns K0.rank : Chow.K0 X → LocallyConstant X ℤ, multiplicative by Tau Ceti main's rank_tensor_apply. The split surjection by componentwise free sheaves (Weibel II.8.1) and the comparison with the ring rank are not stated upstream.
  - *Keeps:* rankSection (the classes [O^f] − [O^g] of componentwise free sheaves form a subring mapped isomorphically onto LocallyConstant X ℤ), the reduced ideal K̃₀ = ker rank, and rank_affine (agreement with KTheoryLowDegrees:Z.2/rank-hom on Spec R).
  - *Replaced by:* SchemeAndStackFoundations §5.7 (K0.rank); AlgebraicVectorBundles L0B (rank).
  - *Consumers to rewire:* Z.6/field-product-test.
- **`Z.5/picard-affine-comparison`**. The group isomorphism CommRing.Pic R ≃ LineBundleClass (Spec R) is SchemeAndStackFoundations §3.4's lineBundleClass_spec_equiv_pic, realised by AlgebraicVectorBundles L0B's monoidal tilde equivalence restricted to rank one (Tau Ceti main VectorBundle/Affine). The comparison with this roadmap's ring-level determinant is not stated upstream.
  - *Keeps:* det_tilde: determinantObj (P~) ≅ (detProjective P)~ naturally in isomorphisms (KTheoryLowDegrees:Z.3/determinant-projective), and det_affine: under KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison and the tilde Picard comparison, Chow.K0.det on Spec R is KTheoryLowDegrees:Z.3/determinant-hom.
  - *Add prerequisites:* SchemeAndStackFoundations:SF.3; SchemeAndStackFoundations:SF.5; Z.3/determinant-projective.

### Rerouted (statement kept, prerequisites changed) — 13

- **`Z.5/pic-disjoint-cover-ext`**. The group Pic(X) now exists: Tau Ceti main's CommGroup (LineBundleClass X). The node keeps its statement; the JacobianChallenge layer A request for inverses is fulfilled.
  - *Add prerequisites:* JacobianChallenge layer A (fulfilled by Tau Ceti main a91d3aa: CommGroup (LineBundleClass X), LineBundleClass.inv_mk).
- **`Z.5/pic-locally-constant-module`**. Negative powers use Tau Ceti main's InvertibleSheaf.dual and InvertibleSheaf.tensorDualIso; the module structure on Additive (LineBundleClass X) is otherwise unchanged and still owned here.
  - *Add prerequisites:* JacobianChallenge layer A (Tau Ceti main a91d3aa: InvertibleSheaf.dual, InvertibleSheaf.tensorDualIso).
- **`Z.5/pic-locally-constant-pullback`**. Picard pullback is Tau Ceti main's LineBundleClass.pullback with pullback_id, pullback_comp and pullback_one; its compatibility with ⊗ and duals is AlgebraicVectorBundles L0A's strong symmetric monoidal pullback (pullbackTensorIso) and L0B's pullbackDualIso. Tau Ceti main does not yet prove multiplicativity of LineBundleClass.pullback, so the node cites the upstream plan for it.
  - *Add prerequisites:* JacobianChallenge layer A (Tau Ceti main a91d3aa: LineBundleClass.pullback); AlgebraicVectorBundles L0A (pullbackTensorIso); AlgebraicVectorBundles L0B (pullbackDualIso).
- **`Z.5/pic-locally-constant-affine`**. The comparison e : Pic(R) ≃ Pic(Spec R) is SchemeAndStackFoundations §3.4's lineBundleClass_spec_equiv_pic, realised by the monoidal tilde equivalence of AlgebraicVectorBundles L0B; the node's statement about locally constant powers stays here.
  - *Add prerequisites:* SchemeAndStackFoundations:SF.3; AlgebraicVectorBundles L0B.
- **`Z.5/rank-determinant-surjective`**. rank and det are SchemeAndStackFoundations §5.7's K0.rank and Chow.K0.det; the section is the kept part of KTheoryLowDegrees:Z.5/vector-bundle-rank. Weibel's Theorem II.8.1 in the ring form TrivSqZeroExt is not stated upstream and stays here.
  - *Add prerequisites:* SchemeAndStackFoundations:SF.5.
  - *Drop prerequisites:* Z.5/vector-bundle-determinant (now Chow.K0.det through SF.5).
- **`Z.5/regular-curve-resolution-property`**. The predicate becomes SchemeAndStackFoundations §5.7's Chow.HasResolutionProperty. The proof uses the ample family of KTheoryLowDegrees:Z.5/regular-curve-ample-family and Stacks 0GMM, made explicit by Stacks 01PW, instead of the affine-diagonal route through Stacks 0F8A. This removes the dependence on SchemeKTheoryOperations:S.1, a layer of the higher K-theory roadmap.
  - *Add prerequisites:* Z.5/regular-curve-ample-family; SchemeAndStackFoundations:SF.5.
  - *Drop prerequisites:* Z.5/curve-affine-diagonal; SchemeKTheoryOperations:S.1/resolution-property.
  - *Consumers to rewire:* Z.6/vector-bundle-k-zero-pi-zero.
- **`Z.5/regular-curve-finite-resolution`**. The kernel of a surjection from a vector bundle is finite locally free by Stacks 0CC4 (a coherent torsion-free module on an integral regular scheme of dimension ≤ 1 is finite locally free), applied componentwise; the existence of the surjection is the rerouted resolution property.
  - *Drop prerequisites:* SchemeKTheoryOperations:S.1/resolution-property.
- **`Z.5/regular-curve-cartan-iso`**. c_X is SchemeAndStackFoundations §5.7's Chow.K0.toG0 X and G₀(X) its Chow.G0 X. Bijectivity is §5.7's K0.toG0_bijective (noetherian, regular stalks, Chow.HasResolutionProperty from the rerouted KTheoryLowDegrees:Z.5/regular-curve-resolution-property); the inverse formula [F] ↦ [E₀] − [E₁] still comes from KTheoryLowDegrees:Z.5/regular-curve-finite-resolution. The identification of c_X with π₀ of SchemeKTheoryOperations S.2's Poincaré-duality equivalence moves to Z.6, whose stage owns π₀ comparisons. This is the degree-zero K/G comparison RS-18 asks Z.5 to use, now from its upstream owner. The planet stays.
  - *Add prerequisites:* SchemeAndStackFoundations:SF.5.
  - *Drop prerequisites:* SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison; SchemeKTheoryOperations:S.2/cartan-equivalence; SchemeKTheoryOperations:S.2/cartan-map; SchemeKTheoryOperations:S.2/g-theory-of-a-scheme; SchemeKTheoryOperations:S.2/k-zero-of-a-scheme; GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0.
  - *Consumers to rewire:* Z.6/cartan-map-comparison (takes over the π₀ comparison); Z.6/projective-line-rank-pic; Z.5/point-class-degree-comparison.
- **`Z.5/skyscraper-class`**. O_y is Tau Ceti main's Scheme.skyscraperResidueField y, and the short exact sequence is SchemeWeilDivisor.residueShortComplex at D = −y (residueShortComplex_shortExact, y closed). The statement is unchanged.
  - *Add prerequisites:* JacobianChallenge layer A (Tau Ceti main a91d3aa: Scheme.skyscraperResidueField, SchemeWeilDivisor.residueShortComplex_shortExact).
  - *Drop prerequisites:* Z.5/point-skyscraper-exact-sequence; Z.5/point-divisor-line-inverse.
  - *Consumers to rewire:* Z.6/elliptic-test; Z.6/integers-test; Z.6/nonprincipal-ideal-test; Z.6/pointless-conic-test; Z.6/projective-line-change-of-basis; Z.6/projective-line-rank-pic.
- **`Z.5/effective-divisor-class`**. Iterating the residue sequences 0 → O(D′) → O(D′ + y) → κ(y)_y → 0 from D′ = −D up to 0 gives [O_X] − [O_X(−D)] = Σ_y n_y [κ(y)_y] directly in Chow.G0 X; the length filtration of O_D remains as the description of the quotient. Statement unchanged.
  - *Add prerequisites:* JacobianChallenge layer A (Tau Ceti main a91d3aa: SchemeWeilDivisor.residueShortComplex_shortExact).
- **`Z.5/generic-rank-kernel`**. Replace the higher localisation sequence of SchemeKTheoryOperations S.3 by the degree-zero one of SchemeAndStackFoundations §5.7 (G0.localization_sequence). Take a nonempty affine open U = Spec A, A a Dedekind domain or a field; Z = X ∖ U is a finite set of closed points (KTheoryLowDegrees:Z.5/regular-curve-ample-family (a)); G₀(Z) is generated by the classes [κ(z)_z] (dévissage, Weibel Theorem II.6.3); G₀(U) ≅ Chow.K0 U (§5.7 K0.toG0_bijective; affine schemes have the resolution property) ≅ RingK0 A (KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison) ≅ ℤ ⊕ Pic(A) (KTheoryLowDegrees:Z.4/rank-pic-equivalence), and Pic(A) = Cl(A) is generated by the classes [A] − [𝔭] = [A/𝔭], images of skyscrapers at points of U. A class of generic rank zero therefore differs from a sum of skyscraper classes of points of U by an element of the image of G₀(Z). This is Weibel's argument for Proposition II.8.2.1 with an arbitrary affine open in place of the complement of one point, which is what source issue KTheoryLowDegrees/E19 requires.
  - *Add prerequisites:* Z.5/regular-curve-ample-family; SchemeAndStackFoundations:SF.5; Z.5/vector-bundle-affine-comparison; Z.4/rank-pic-equivalence.
  - *Drop prerequisites:* SchemeKTheoryOperations:S.3/one-dimensional-localisation-sequence.
- **`Z.5/point-class-map`**. det is Chow.K0.det and c_X is Chow.K0.toG0; classGroupToLineBundleClass is pinned. Statement unchanged.
  - *Add prerequisites:* SchemeAndStackFoundations:SF.5.
  - *Consumers to rewire:* Z.6/pointless-conic-test; Z.5/point-class-degree-comparison.
- **`Z.5/curve-rank-determinant-equivalence`**. The main theorem of Z.5 stays. Its inputs are read through the substitution: rank = K0.rank, det = Chow.K0.det, c_X = Chow.K0.toG0, and the surjectivity of Cl(X) → Pic(X) from Tau Ceti main via JacobianChallenge layer A.
  - *Add prerequisites:* JacobianChallenge layer A; SchemeAndStackFoundations:SF.5.
  - *Drop prerequisites:* Z.5/line-bundle-divisorial; Z.5/vector-bundle-determinant.
  - *Consumers to rewire:* Z.6/elliptic-test; Z.6/field-product-test; Z.6/field-test; Z.6/integers-test; Z.6/pointless-conic-test; Z.6/projective-line-change-of-basis; Z.6/projective-line-rank-pic; Z.5/point-class-degree-comparison; EllipticKTheory:E.2/K0-of-a-curve.

### Kept — 9

- **`Z.5/exterior-power-extension-filtration`**. The canonical filtration of ΛⁿE attached to an extension is not stated by AlgebraicVectorBundles or SchemeAndStackFoundations. Read with the carrier substitution (exteriorPower of L0C, conflations of Chow.finiteLocallyFreeExact).
  - *Consumers to rewire:* Z.5/determinant-bundle-extension; Z.6/projective-line-rank-pic.
- **`Z.5/determinant-bundle-extension`**. The canonical isomorphism det E′ ⊗ det E″ ≅ det E (Stacks 0B38) is what SchemeAndStackFoundations §5.7 needs for Chow.K0.det to be well defined; neither upstream roadmap states it (upstreamNotes). Read with determinantObj for det.
  - *Consumers to rewire:* Z.5/vector-bundle-determinant (imported: the upstream K0.det).
- **`Z.5/determinant-bundle-tensor`**. det(E ⊗ F) ≅ (det E)^{rank F} ⊗ (det F)^{rank E} (Weibel Ex. II.8.5) is not stated upstream. Read with determinantObj and the ⊗ of FiniteLocallyFreeSheaf X.
  - *Consumers to rewire:* Z.5/rank-determinant-surjective.
- **`Z.5/regular-curve-integral`**. Unchanged. Tau Ceti's pinned irreducibleSpace_of_connected_of_isDomain_stalk, which SchemeAndStackFoundations also cites, may be added as a prerequisite for the irreducibility step.
  - *Add prerequisites:* tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk.
- **`Z.5/principal-divisor-class-vanishes`**. Unchanged; the pinned SchemeWeilDivisor.toLineBundleClass_principalDivisor is an alternative input for the determinant side.
- **`Z.5/curve-k-zero-ring`**. Unchanged; the ring structure it transports is SchemeAndStackFoundations §5.7's.
  - *Consumers to rewire:* Z.6/projective-line-rank-pic; EllipticKTheory:E.2/ring-structure-of-K0-of-a-curve.
- **`Z.5/dedekind-curve-comparison`**. Unchanged; it now rests on the narrowed affine comparisons.
- **`Z.5/doubled-line-example`**. Unchanged statement. Its resolution property now comes from KTheoryLowDegrees:Z.5/regular-curve-ample-family (charts U′, U″, divisors 0″, 0′). Stacks Remark 0FXT (on the scheme of Stacks Example 01JD with n = 1) gives the same family: invertible sheaves trivial on both charts with sections whose non-vanishing loci are the charts; it is an additional source. Pic(X) ≅ ℤ uses Tau Ceti main's Cl ≅ Pic.
  - *Add prerequisites:* Z.5/regular-curve-ample-family; JacobianChallenge layer A.
  - *Drop prerequisites:* Z.5/line-bundle-divisorial.
- **`Z.5/curve-affine-diagonal`**. Kept as a fact about the doubled line (acceptance); it no longer lies on the resolution-property route.

## 8. Dependencies

**Inside the roadmap.**

- Z.1: ring K₀, its exact form, scalar extension.
- Z.2: rank, division rings, local rings.
- Z.3: monoidal ring structure, the componentwise determinant `detProjective`, `determinant-hom`,
  exterior base change and the exterior filtration of modules, locally constant Picard powers.
- Z.4: the Dedekind classification `rank-pic-equivalence`.

All of these are earlier layers. Z.5 is consumed by Z.6.

**Across roadmaps, after routing.**

- `SchemeAndStackFoundations:SF.5`, for §5.7.
- `SchemeAndStackFoundations:SF.3`, for §§3.3–3.4.
- `tauceti:TauCetiRoadmap/JacobianChallenge` layers A and B.
- `tauceti:TauCetiRoadmap/AlgebraicCurves` layer 12, for the comparison contracts of the earlier
  nodes on projective function-field models.
- `tauceti:TauCetiRoadmap/GrothendieckEulerForms` layers 0–2, through the pinned `ExactK0`.
- AlgebraicVectorBundles L0A–L0C. This roadmap is not an atlas stage; it is recorded as
  `upstreamImports` in the packet and as an input of SchemeAndStackFoundations §5.7.

**Consumers.**

- EllipticKTheory E.2, E.3 and KU-curvek.
- KTheoryLowDegrees Z.6.
- SchemeKTheoryOperations KU-operations.

**Edges.** The inherited edge `SchemeKTheoryOperations:S.6 → Z.5` is unused and should be removed
(RT-AREA-ktheory-2/41). Once the routing map is applied, `S.2 → Z.5` is unused too; the comparison
with S.2's spectra belongs to Z.6, which keeps S.2. The split of Z.5 into a vector-bundle sub-layer
and a curve sub-layer, proposed by the earlier packet so that SchemeKTheoryOperations could cite the
vector-bundle nodes, is withdrawn. Those objects are upstream now, and SchemeKTheoryOperations S.1,
S.2, S.6 and S.7 should cite AlgebraicVectorBundles and SchemeAndStackFoundations §5.7 directly.

**Latent cycle.** In the graph of all packets, promoted or not, Z.5 reaches
`SchemeAndStackFoundations:SF.0` through a long chain. The chain runs from EllipticKTheory E.2
through the p-adic Hodge, Galois-representation and patching roadmaps, and ends with
`SchemeAndStackFoundations:SF.0/excellent-ring` citing `DeformationAndDerivedPatchingAlgebra:R03.3/catenary`.
That citation points up a tier. The merged SchemeAndStackFoundations README owns the catenary package
itself, and `upstream/CaraianiNewton.md` already lists the citation as a move-down. Removing it
removes every path from Z.5 to SF.0, SF.3 and SF.5. The dry assembly of the promoted packets shows
no cycle and no skipped link.

## 9. Acceptance tests for the layer

1. **Fields, `ℤ`, `Spec 𝒪_{F,S}`.**
   - `Chow.K0 (Spec F) ≅ ℤ`.
   - `Chow.K0 (Spec ℤ) ≅ ℤ`, and the skyscraper at `(p)` has class `[ℤ] − [pℤ] = 0`.
   - For a Dedekind `A`, the theorem is Z.4's classification.
2. **The nonprincipal ideal.** For `A = ℤ[√−5]` and `I = (2, 1 + √−5)`, `[I~] − [𝒪]` is a nonzero
   class of rank `0` and determinant of order two. An implementation that keeps only the rank fails.
3. **Disconnected spectra.** On `Spec(F × F)` the rank is `(1, 0)` and `(0, 1)` on the factors, and
   the locally constant power `L^a` uses independent exponents.
4. **The projective line.**
   - `K₀(ℙ¹_k) ≅ ℤ²` by `(rank, deg ∘ det)`.
   - `[𝒪(−1)]` has coordinates `(1, −1)`, and `(1 − [𝒪(−1)])² = 0`.
   - `χ[𝒪(n)] = n + 1`.
   - The Euler sequence is a non-split conflation.
5. **Residue degrees.** A closed point of degree `d` on `ℙ¹_k` has `cl[y] ↦ (0, 𝒪(d))` and
   `χ = d`.
6. **The pointless conic.** `Pic(C) ≅ ℤ`, `δ = 2`, and the image of `(rank, deg ∘ det)` is `ℤ ⊕ 2ℤ`.
   The elliptic splitting `ℤ² ⊕ E(F)` of E.2 needs a rational origin.
7. **Non-separated curves.**
   - On the affine line with doubled origin, `K₀ = G₀ = ℤ²` and the ample family is `{𝒪(0′), 𝒪(0″)}`.
   - On the affine plane with doubled origin, `K₀VB = ℤ` and `G₀ = ℤ²`, and the resolution property
     fails. This is a test of dimension two and not an instance of Z.5.
8. **Determinant is not a ring map.** In `K₀(ℙ¹)`, `([𝒪(1)] − 1)² = 0`, while each factor has rank `0`
   and determinant `𝒪(1)`. Under `(rank, det)` this is `(0, 𝒪(1))·(0, 𝒪(1)) = (0, 𝒪)` in the
   square-zero product `(a, L)(b, M) = (ab, L^b ⊗ M^a)`. A rule `(0, L)(0, M) = (0, L ⊗ M)` would give
   `(0, 𝒪(2)) ≠ 0` and is not compatible with the product on `K₀`.

## 10. Red-team findings handed to this job

- **RT-AREA-ktheory-1/31** (a false acceptance test in `GeneralAlgebraicKTheory:K.3/resolution-theorem`).
  For the affine line with doubled origin, `K₀VB` is `ℤ²`, not `ℤ`. Weibel's Remark V.3.4.2 says "line"
  where its sources treat the plane. `Z.5/doubled-line-example` already states the line correctly
  (`K₀ = G₀ = ℤ²`) and contrasts it with the plane (`K₀VB = ℤ`, `G₀ = ℤ²`). This follow-up adds that
  the line has the resolution property through an explicit ample family although it has no ample
  line bundle. The correction of the K.3 test belongs to the GeneralAlgebraicKTheory packet, which
  this job may not edit; it is routed in the packet's interface entry. The misprint is recorded as
  `SchemeKTheoryOperations/E1`.
- **RT-AREA-ktheory-2/41** (unused inherited edges). No Z.5 node cites S.6, and Z.5 never used λ- or
  Adams operations. The earlier packet already used Z.3's determinant, which gives the edge
  `Z.3 → Z.5`. After routing, Z.5 also stops using S.1–S.3: its degree-zero K/G comparison,
  resolution property and localisation sequence come from SchemeAndStackFoundations §5.7. The packet
  proposes removing `S.6 → Z.5` now and `S.2 → Z.5` once the map is applied. `S.7 → Z.6` is for the
  Z.6 job.

## 11. Notes for the upstream owners

- **The determinant of an extension.** SchemeAndStackFoundations §5.7's `Chow.K0.det` needs the
  canonical isomorphism `det E′ ⊗ det E″ ≅ det E` for conflations (Stacks 0B38) to be well defined.
  AlgebraicVectorBundles L0C does not state it, and neither does §5.7. The atlas plans it as
  `Z.5/determinant-bundle-extension`.
- **The construction of `Chow.K0`.** It needs three things §5.7 leaves implicit:
  - extension-closedness of finite locally free sheaves;
  - essential smallness of `FiniteLocallyFreeSheaf X` in the universe of `X`;
  - exactness of `⊗` in each variable on conflations.

  The superseded nodes `Z.5/vector-bundle-extension-closed`, `Z.5/vector-bundle-essentially-small`
  and `Z.5/vector-bundle-k-zero-ring` contain proofs.
- **A Check for the doubled line.** §5.7's `K0.toG0_bijective` applies to the affine line with doubled
  origin, which is not separated. A Check there would separate it from the doubled plane, which §5.7
  already rejects.

## 12. Sources

- Charles A. Weibel, *The K-book: an introduction to algebraic K-theory*, author-hosted draft of
  29 August 2013, <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf> (PDF page = book page + 8):
  - II.6, Theorem 6.3 (dévissage) and Application 6.4.2;
  - V.3, Remark 3.4.2 (PDF p. 395), the doubled-line misprint;
  - II.8, Theorem 8.1, Definition 8.1.1, Theorem 8.2, Proposition 8.2.1 with its proof, Examples
    8.2.2–8.2.4, Exercises 8.2 and 8.5.
- The Stacks project, online tags read 19 October 2026:
  - Properties of Schemes: 01PW, 01PY;
  - Morphisms of Schemes: 0FXR, 0FXT;
  - Divisors: 0AXT, 0CC4, 0GML;
  - Varieties: 0AYR, 0DJ5, 0AYY, 09NZ;
  - Derived Categories of Schemes: 0F87, 0GMM, 0F8A;
  - Schemes: 01JD;
  - Sheaves of Modules: 0BCI, 01CW, 0B38;
  - Chow Homology: 0FDS (proof of Lemma 42.23.4);
  - More on Algebra: 0AUW.
- TauCetiRoadmap `main` at `34dcf0e`: the README.md and Suggested.lean of SchemeAndStackFoundations
  (§§3.3, 3.4, 5.7), AlgebraicVectorBundles (L0A–L0C) and JacobianChallenge (layers A, B).
- Tau Ceti library `main` at `a91d3aa`:
  - VectorBundle/*, LineBundle/{Class, Dual, Pullback, Functoriality};
  - WeilDivisor/Scheme/{Picard, ResidueSequence}, CartierDivisor/ClassGroup;
  - Modules/Skyscraper, Cohomology/Skyscraper;
  - Algebra/Category/ModuleCat/Sheaf/ExteriorPower.

  None of the declarations cited from `main` exists at the pinned commit `f790474`.

No new mistake in a source was found in this pass; the packet's `sourceIssues` list is empty. The
earlier packet records E19 (the affine complement in Weibel's proof of II.8.2.1, which the rerouted
`Z.5/generic-rank-kernel` avoids) and E27 (a sign in the proof of Stacks Lemma 42.23.4, tag 0FDS).
