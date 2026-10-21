# Exponential sums, decoupling and the circle method, Part II

This roadmap constructs the geometric circle method for polynomial maps to a smooth affine hypersurface. Its first endpoint is a finite spectral sequence whose columns are signed configuration-space cohomology. Its second endpoint compares that sequence with compact-support cohomology of the polynomial mapping scheme in a conservative range. The mapping-space degeneration argument is conditional on a topology comparison and a trace-pairing conjecture.

The source is Browning–Sawin, *A geometric version of the circle method*, Annals **191** (2020), 893–948. The target inventory follows all 83 items of the paper’s `GeometricCircleMethodAndMappingSpaces` route. Two additional targets expose the finite-grid degree input and the finite localization-filtration adapter. The independent review accepts this complete target-level pass, with four named gaps (G3–G6); no target is claimed implemented or proved by this submission. The document is definitive. The suggested file only states the small portion expressible on carriers at the pinned libraries.

## Conventions and endpoints

Fix a field K, n≥3 and k≥3, and a degree-k polynomial f in n variables. Write f₀ for its degree-k part, X={f=0}⊂Aⁿ, and Z={f₀=0}⊂Pⁿ⁻¹. Require X and Z smooth when invoking the cohomological theorems. Fix a **nonzero vector** x with f₀(x)=0, as well as the projective point P=[x:0]. The prescribed polynomial tuple has g_j=x_jTᵈ+Σ_(i<d)a_(i,j)Tⁱ. Individual coordinates can have degree below d; the tuple has degree d. There is no quotient by scalars or reparametrizations.

For the main estimates put L=kd, D=d(n−k), t=floor(d/(k−1)) and δ=n/2ᵏ−k+1, with d≥k−1≥2 and n>2ᵏ(k−1). In finite characteristic require p>k, ℓ≠p and even multiplicative order of ℓ modulo p. Fourier constructions use E=Q_ℓ(μ_p) and a specified nontrivial additive character. A Q_ℓ-valued Artin–Schreier character is not silently substituted. Finite coefficient extension is explicit. Over a general field the spreading construction gives vector-space statements; finite-field Frobenius equivariance is asserted only where constructed.

Use cohomological shifts Hⁱ(C[a])=Hⁱ⁺ᵃ(C), RΓ_c(Aʳ,E)=E[−2r](−r), and geometric Frobenius qᵃ on E(−a). Invariants under S_m are exact over E because it has characteristic zero, including when ℓ divides m!. Tensor symmetry on complexes includes Koszul signs. The configuration input PConf_m is the **ordered** configuration space in A¹; PConf₀ is a point. Its generic theory belongs to AlgebraicTopologyPartII.

The normalized first page is

    E₁^(m,s) = (H_c^(s+mn)(PConf_m,E) ⊗ V^⊗m ⊗ sgn^(n−1))^(S_m)
                 (kd−m−n(d−m)),       V=H_c^(n−1)(X,E), 0≤m≤d.

It is zero outside these columns, has d_r of degree (r,1−r), and has odd differentials zero subject to the monodromy input. The zero column is E(−D) in total degree zero. Its geometric abutment identifies with H_c^(i+2D)(Mor,E) for

    i > −4(tδ−(k−1)).

The supporting minor-arc bound is H_cᵃ(Aᴸ∖A_d,S)=0 for a>2dn+4(k−1)−4tδ. The remainder calculation is B(m)=2dn−4qδ+4(r+1) for m=(k−1)q+r and 0≤r≤k−2. The published sharper +4 bound and range i>−4(tδ−1) are open targets. The supported irreducibility condition is **tδ>k−1**. Even a proof of the printed sharp comparison would require tδ>1 to reach total degree zero; its equality endpoint needs another argument.

For degree geometry use geometric total degree, the sum of the projective degrees of all reduced geometric irreducible components, unless a target explicitly assumes irreducibility. A top-dimensional degree alone cannot bound arbitrarily many isolated components. The strict polynomial height |a|<qʰ is degree(a)<h for nonzero a. At h≤0 only the zero polynomial vector remains. Arcs are described by determinantal equations; when using set-theoretic nesting, dimensions and locally closed strata, take their associated reduced closed schemes. The minors themselves remain the functorial scheme model before reduction.

## Ownership and build order

GCM.0 (dimension/degree geometry), GCM.1 (polynomial boxes), and GCM.2 (prime choices) are independent prefixes. None imports ES.0–5, the mapping-space suffix, monodromy or configuration cohomology. The parent’s polar-dimension and polynomial-count estimates consume GCM.0–1. GCM.9 then imports the parent’s ES.0–1 arithmetic estimates. The `parent` and roadmap-level prerequisite lists describe lineage and the union of interfaces; **only the stage/node edges specify execution**. A whole-roadmap import in both directions, or ES.5→ES.0, would create a cycle.

The parent owns polarization, function-field lattices, shrinking and the numerical polar count. This roadmap owns their geometric cohomology application. Existing SchemeAndStackFoundations and EtaleDualityAndPerverseSheaves own schemes and six operations. FiniteFieldsAndCharacterSums owns Artin–Schreier/Fourier and Lang–Weil inputs. Current AlgebraicTopology owns CW/cofibration, product/finite-cover and relative-homotopy infrastructure; the circle fundamental group and compact-open currying already exist in the pinned libraries.

Universal hypersurface monodromy still has a pending companion, LefschetzPencilsAndVanishingCyclesPartII, routed through LPV.5 with its unfulfilled extension contract (G4). Configuration/rational-loop theory already has a complete 75-node AlgebraicTopologyPartII packet. Its exact exports are imported below; that companion remains unreviewed and its original-source closure is qualified by G5. Current AlgebraicTopology supplies CW homotopy extension and higher Hurewicz, while the parameterized mapping-restriction fibration and degree-one Hurewicz/abelianization consequence are explicit extension requests. Current Stage 6 supplies universal coefficients. FoundationsAndLibraryIntegration LI.3 is replaced by the actual Mathlib spectral-object carrier plus GCM.7’s missing finite localization/abutment adapter.

The topology is material. In the compact-open interpretation an escaping Fermat loop has nonzero end winding, so neither the proposed double-loop equivalence nor the degree-one trace comparison holds. A fixed-radius weighted collar can be straightened continuously. A global stronger-germ topology, compact-family control, polynomial inclusion continuity and comparison with fixed collars remain G6. Conjectures 1.3 and 7.1 are propositions under explicit hypotheses, never axioms or typeclass instances.

## Library and source audit

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`. Every baseline declaration below was read at its pin. The reviewed ES.0–5 audit has finite Fourier fragments, not geometric arc/cohomology constructions. The current library and all nine post-snapshot roadmap directions were also searched. Current AlgebraicTopology was read and imported; no geometric-circle-method duplicate was found. Current source commits inspected: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Coherent or ordinary sheaf cohomology, and étalé spaces, do not by themselves supply the required ℓ-adic compact-support theory.

The full published BS20 text and BV15 Lemma 2.8/proof were read. A direct finite-grid proof, adapted from the coordinate-slicing argument in Lachaud–Rolland arXiv:1405.3027v2, resolves G1 with explicit constant Δ and no coordinate-height issue. Only the affine hyperplane-section degree inequality is used; its overstated equality is corrected as E49. The exact accepted FF.2 one-modulus input resolves G2 by Fourier inversion in place of the unread Katz book. Stacks tags 05F9, 012K and 0BK5 support the specified adapters. The original Katz–Sarnak, Broughton, Hilton, Sullivan and arrangement proofs were not independently verified here; the applicable monodromy and companion source qualifications remain G4 and G5. No source passage is reproduced.

| Baseline declaration | Existing export used |
| --- | --- |
| `mathlib:MvPolynomial.eval₂Hom` | Evaluation of multivariate polynomials through a coefficient ring homomorphism and assigned variables; read declaration at pin. Module: `Mathlib/Algebra/MvPolynomial/Eval.lean`. |
| `mathlib:Matrix.rank` | Natural-valued matrix rank over a field, defined through the associated linear map; not a determinantal scheme. Module: `Mathlib/LinearAlgebra/Matrix/Rank.lean`. |
| `mathlib:LaurentSeries` | Existing Hahn-series carrier with integer exponents; coefficient operations suffice for the finite residue expressions. Module: `Mathlib/RingTheory/LaurentSeries.lean`. |
| `mathlib:RatFunc.inftyValuation` | Valuation at infinity on rational functions: nonzero f/g has exp(deg f−deg g); its completion is already available in the same module. Module: `Mathlib/FieldTheory/RatFunc/Valuation.lean`. |
| `mathlib:Ideal.height_le_spanRank` | In a commutative Noetherian ring, a proper ideal has height at most its span rank. The geometric componentwise dimension translation remains GCM.0. Module: `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean`. |
| `mathlib:Nat.forall_exists_prime_gt_and_modEq` | For coprime residue and modulus, there is a prime above any bound in the prescribed class. Read the quantified theorem at the pin. Module: `Mathlib/NumberTheory/LSeries/PrimesInAP.lean`. |
| `mathlib:legendreSym.quadratic_reciprocity` | For distinct odd primes the product of the two Legendre symbols is the usual parity sign; p≡1 mod4 removes it. Module: `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean`. |
| `mathlib:legendreSym.at_two` | For an odd prime p, the Legendre symbol of 2 is the character χ₈(p). Module: `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean`. |
| `mathlib:CategoryTheory.Abelian.SpectralObject` | Spectral object in an abelian category with functorial connecting maps and exactness. It is a carrier; a finite localization filtration with its abutment is not supplied by this declaration. Module: `Mathlib/Algebra/Homology/SpectralObject/Basic.lean`. |
| `mathlib:ContinuousMap.curry` | Curries a continuous map X×Y→Z to a continuous map X→C(Y,Z) with the compact-open topology. Module: `Mathlib/Topology/CompactOpen.lean`. |
| `mathlib:nonempty_inter_closedPoints` | A nonempty locally closed subset of a Jacobson space meets the closed points. Module: `Mathlib/Topology/JacobsonSpace.lean`. |
| `mathlib:AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace` | A locally finite-type scheme over a Jacobson scheme is Jacobson. Module: `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean`. |
| `tauceti:UnitAddCircle.fundamentalGroupMulEquiv` | The based fundamental group of the unit additive circle is multiplicatively equivalent to Z, with deck-endpoint convention fixed by the covering construction. Module: `TauCeti/AlgebraicTopology/UniversalCover/Circle/FundamentalGroup.lean`. |

The [independent review](../reviews/REV-DESIGN-ExponentialSumsAndCircleMethodPartII.md) records every node verdict and all corrections. It confirms all 13 pinned baseline declarations. Acceptance concerns this planning pass; all 14 layers remain planned and open.


## Layer targets, APIs and checks

All declarations have implementation status `unchecked`. The following text is synchronized from the packet: every target, direct prerequisite, proof step, source match, API item and discriminating test is included. Proposed names are planning API names.

| Layer | Targets | Planets | Coverage |
| --- | ---: | ---: | --- |
| [GCM.0](#gcm-0) — Affine dimension and degree geometry | 3 | 2 | planned |
| [GCM.1](#gcm-1) — Polynomial boxes over a function field | 1 | 1 | planned |
| [GCM.2](#gcm-2) — Admissible coefficient and residue primes | 2 | 2 | planned |
| [GCM.3](#gcm-3) — Polynomial maps and compact-support Fourier transform | 6 | 5 | planned |
| [GCM.4](#gcm-4) — Hankel rank arcs and rational approximation | 7 | 4 | planned |
| [GCM.5](#gcm-5) — Major-arc complexes and signed configuration descent | 14 | 6 | planned |
| [GCM.6](#gcm-6) — Universal pairs and monodromy parity | 6 | 2 | planned |
| [GCM.7](#gcm-7) — Finite arc filtration and the first page | 5 | 5 | planned |
| [GCM.8](#gcm-8) — Geometric Weyl differencing | 6 | 3 | planned |
| [GCM.9](#gcm-9) — Minor arcs with a controlled remainder | 5 | 4 | planned |
| [GCM.10](#gcm-10) — Comparison, spreading and irreducible mapping schemes | 10 | 6 | planned |
| [GCM.11](#gcm-11) — Infinity germs and the compact-open obstruction | 12 | 6 | planned |
| [GCM.12](#gcm-12) — Controlled collars and the topology gate | 5 | 5 | planned |
| [GCM.13](#gcm-13) — Trace comparison and conditional degeneration | 3 | 3 | planned |

<a id="gcm-0"></a>

## GCM.0. Affine dimension and degree geometry

Apply the existing SF.0 dimension and constructibility interfaces to affine intersections and Weyl fibre strata. Prove the finite-grid cumulative-degree bound by coordinate-hyperplane slicing, without a change of coordinates or coefficient-height assumption. This geometry prefix has no parent arithmetic, configuration or mapping-space dependency.

**Inputs:** `SchemeAndStackFoundations:SF.0`

### Affine dimension theorem for intersections

`ExponentialSumsAndCircleMethodPartII:GCM.0/rev-affine-dimension-theorem-for-intersections` · theorem · proof-plan

Over an algebraically closed field, if irreducible closed Y,Z⊂A^M meet, each component C of Y∩Z has dim C≥dim Y+dim Z−M. For a closed V whose every component meets Z, dim(V∩Z)≤0 implies dim V≤M−dim Z. Independently, every component of the nonempty zero locus of r polynomials in A^M has dimension at least M−r.

**Planet:** Affine intersection dimension.

**Dependencies:** `SchemeAndStackFoundations:SF.0`, `mathlib:Ideal.height_le_spanRank`, `SchemeAndStackFoundations:SF.0/algebraic-scheme-dimension`.

**Construction/proof plan:**

1. Use the diagonal in A^M×A^M to express the intersection by M equations in Y×Z.
2. For each minimal prime P over the ideal of the intersection equations, localize at P. The localized ideal has unique minimal prime P, so Ideal.height_le_spanRank bounds that prime height by the number of equations. Translate back by the catenary dimension formula for finite-type domains; an unlocalized bound on the minimum height of the ideal is insufficient.
3. For the consequence choose a maximal-dimensional component of V; do not infer nonempty intersection from a dimension inequality.

**Sources and matches:**

- BS20, §6, proof of Proposition 6.2, p. 939. Over an algebraically closed field, if irreducible closed Y,Z⊂A^M meet, each component C of Y∩Z has dim C≥dim Y+dim Z−M. For a closed V whose every component meets Z, dim(V∩Z)≤0 implies dim V≤M−dim Z. Independently, every component of the nonempty zero locus of r polynomials in A^M has dimension at least M−r.

**Check:** Two coordinate planes in A³ meet in a line and attain the bound. Disjoint parallel lines do not satisfy the nonempty-intersection hypothesis. For a cone, justify that every irreducible component contains the vertex before using the diagonal argument.

### Degree bound for a finite Cartesian grid

`ExponentialSumsAndCircleMethodPartII:GCM.0/finite-projection-degree` · theorem · proof-plan

Let V⊂A^N_K be a nonempty closed algebraic set over any field K. Write V_i for its reduced geometric irreducible components, e_i=dim V_i, Δ_i=deg V_i, e=max_i e_i and Δ=Σ_i Δ_i. For every nonempty finite S⊂K, #(V(K)∩S^N)≤Σ_i Δ_i|S|^(e_i)≤Δ|S|^e. The empty set contributes zero; nilpotents do not change the count. No change of coordinates, field-size restriction or coefficient-height bound is required.

**Planet:** Finite grid degree bound.

**Dependencies:** `SchemeAndStackFoundations:SF.0`, `ExponentialSumsAndCircleMethodPartII:GCM.0/rev-affine-dimension-theorem-for-intersections`.

**Construction/proof plan:**

1. Base change to an algebraic closure and bound the union by the sum over its geometric irreducible components; the components need not descend to K.
2. Induct on the dimension of one component W. In dimension zero its number of geometric points is at most deg W.
3. If dim W=e>0, choose a coordinate x_j nonconstant on W. For a∈S, x_j=a does not contain W. Its nonempty section has pure dimension e−1 by the componentwise principal ideal theorem and finite-type dimension formula. The projective closure meets that hyperplane in a projective degree-deg W section with scheme multiplicities; deleting the part at infinity and passing to reduced components gives cumulative degree at most deg W. This is the degree-one case of LR14v2 Theorem 1.1.
4. Apply the induction hypothesis to each section, viewed in the remaining N−1 coordinates. Sum the disjoint slices over a∈S to obtain deg W·|S|^e, then sum the components. This adapts the affine coordinate-slicing proof of LR14v2 Proposition 2.3 from F_q to an arbitrary finite S.
5. Only the inequality for affine hyperplane-section degree is used. LR14v2 Lemma 2.6 states an equality that can fail when the projective intersection has points at infinity; E49 records the correction.

**Sources and matches:**

- LR14v2, §1, Theorem 1.1, p.3; §2.1, Proposition 2.3 and its affine proof, pp.4–5. Own extension of the coordinate-hyperplane induction from a finite field grid to any finite subset of any field. The published finite-field point bound is not being quoted as an arbitrary-grid theorem; only the cumulative-degree hyperplane inequality and the slicing argument are imported.
- BV15, §2.5, Lemma 2.8 and proof, arXiv pp.12–13. The original polynomial-box application motivates this adapter. The new slicing proof avoids its unrecorded coordinate-height issue.

**Check:** A coordinate e-plane attains |S|^e with degree one. A parabola y=x² has degree two but its section x=0 has degree one; an equality for every affine section is unnecessary. A line together with arbitrarily many isolated points requires cumulative degree, not just the degree of its top-dimensional component. The hyperbola xy=1 causes no exceptional-projection problem: the proof slices in the original coordinates.

### Fibre-dimension strata for geometric Weyl differencing

`ExponentialSumsAndCircleMethodPartII:GCM.0/rev-fibre-dimension-stratification` · theorem · proof-plan

For a finite-type morphism φ:V→Y between finite-type schemes over a field, use the SF.0 constructibility and dimension exports to choose a finite partition of Y into irreducible locally closed W_j with constant fibre dimension e_j∈Z∪{−∞}. For e_j≥0, dim φ⁻¹(W_j)=dim W_j+e_j; the pieces with e_j=−∞ have empty inverse image. This is the finite stratification adapter used to maximize base dimension plus fibre cohomological degree in GCM.8.

**Dependencies:** `SchemeAndStackFoundations:SF.0/generic-fibre-spreading`, `SchemeAndStackFoundations:SF.0/fibre-dimension-formula`.

**Construction/proof plan:**

1. Import the constructibility of fibre-dimension level sets from SF.0/generic-fibre-spreading(c), whose dimension case is Stacks 05F9. Noetherian quasi-compactness makes these loci constructible, and finite refinement gives irreducible locally closed pieces.
2. Apply SF.0/fibre-dimension-formula to the finitely many components over each piece. Constant nonempty fibre dimension gives the maximum total dimension dim W_j+e_j; empty fibres are kept separate.

**Sources and matches:**

- STACKS, Lemma 37.30.3, tag 05F9; BS20 Proposition 5.5 proof, p.931. Application adapter for BS20 Proposition 5.5: Stacks supplies local constructibility, not by itself the dimension equality; the latter is imported from the exact SF.0 dimension-formula node.

**Check:** The projection of a union of a horizontal and a vertical line has distinct fibre-dimension strata. A point outside the image has dimension −∞, not zero.

<a id="gcm-1"></a>

## GCM.1. Polynomial boxes over a function field

Specialize the finite-grid bound to strict-height polynomial boxes over F_q(T), with explicit constant the geometric cumulative degree Δ. Treat empty and zero-dimensional sets and nonpositive height. This independent prefix exports polynomialbox to the parent arithmetic counts; no finite-projection audit remains.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.0`

### Degree-uniform polynomial point bound

`ExponentialSumsAndCircleMethodPartII:GCM.1/polynomialbox` · theorem · proof-plan

Let V⊂A^N over F_q(T) be nonempty, of dimension e≥0 and geometric cumulative degree Δ. For each integer h≥1, the number of u∈V(F_q[T]) with max_j |u_j|<q^h is at most Δq^(he), where |0|=0 and |a|=q^(deg a) for a≠0. Empty V contributes zero. For h≤0 only the zero vector can occur, and it contributes exactly when it belongs to V. All constants are independent of q and of coefficient heights.

**Planet:** Polynomial box bound.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.0/finite-projection-degree`, `mathlib:RatFunc.inftyValuation`.

**Construction/proof plan:**

1. For h≥1 take S={a∈F_q[T]:deg a<h}, including zero, so |S|=q^h.
2. Apply finite-projection-degree in the original coordinates with the explicit constant Δ; its proof uses no projection or coordinate change.
3. For h≤0 the strict ball contains only zero. In BV15 the inclusive height bound q^N corresponds to the present h=N+1; the boundary conventions therefore agree.

**Sources and matches:**

- BV15, §2.5, Lemma 2.8, arXiv pp.12–13; BS20 Proposition 6.2 proof, p.939. BV15 states the inclusive-height polynomial bound. This target uses the strict-height convention and an independent finite-grid proof, rather than treating BV15’s projection paragraph as the proof of height uniformity.
- LR14v2, §1, Theorem 1.1, p.3; §2.1, affine proof of Proposition 2.3, pp.4–5. Own arbitrary-finite-grid adaptation, established in the prerequisite, yields the strict-height statement and the explicit cumulative-degree constant.

**Check:** A coordinate affine e-plane has exactly q^(he) points in the strict positive-height box. At h=0 nonzero constants are excluded; the count is zero or one. A zero-dimensional variety has at most its degree many rational points regardless of h.

<a id="gcm-2"></a>

## GCM.2. Admissible coefficient and residue primes

Choose arbitrarily large coefficient primes of order two modulo a fixed odd characteristic. For a fixed coefficient prime choose arbitrarily large good residue characteristics in which it is a nonsquare and has even order, avoiding a prescribed finite bad set. Use the pinned Dirichlet and reciprocity theorems; no late geometric or arithmetic estimates enter.

**Inputs:** Independent prefix.

### Choose a coefficient prime for fixed odd characteristic

`ExponentialSumsAndCircleMethodPartII:GCM.2/fix-coefficient-prime-for-fixed-characteristic` · theorem · proof-plan

For each odd prime p and bound B there is a prime ℓ>max(B,p) with ℓ≡−1 mod p; hence ℓ≠p and the order of its residue in F_p× is exactly two. The assertion is independent of f,n,d.

**Planet:** Admissible coefficient prime.

**Dependencies:** `mathlib:Nat.forall_exists_prime_gt_and_modEq`.

**Construction/proof plan:**

1. Apply the pinned primes-in-arithmetic-progressions theorem to the unit residue −1 modulo p.
2. Since p is odd, −1≠1 and (−1)²=1. Enlarge the bound rather than choosing a possibly forbidden prime.

**Sources and matches:**

- BS20, Implicit input to published Corollary 2.9 and proof pp.907–908. For each odd prime p and bound B there is a prime ℓ>max(B,p) with ℓ≡−1 mod p; hence ℓ≠p and the order of its residue in F_p× is exactly two. The assertion is independent of f,n,d.

**Check:** For p=5 the residue 4 has order two. Exclude p=2, where −1 has order one. The chosen prime exceeds both B and p, so equality of coefficient and residue characteristic cannot occur.

### Choose good residue characteristics for fixed coefficient prime

`ExponentialSumsAndCircleMethodPartII:GCM.2/fix-good-characteristic-for-fixed-coefficient-prime` · theorem · proof-plan

For a fixed prime ℓ, integers B,k and finite bad-prime set S, there are arbitrarily large primes p>max(B,k,ℓ), p∉S, for which ℓ is a nonsquare modulo p and therefore has even multiplicative order. For odd ℓ choose a nonzero quadratic nonresidue a mod ℓ and the CRT residue p≡a mod ℓ, p≡1 mod4; for ℓ=2 use p≡5 mod8.

**Planet:** Good residue characteristics.

**Dependencies:** `mathlib:Nat.forall_exists_prime_gt_and_modEq`, `mathlib:legendreSym.quadratic_reciprocity`, `mathlib:legendreSym.at_two`.

**Construction/proof plan:**

1. Choose the CRT unit class and use Dirichlet above every member of S.
2. For odd ℓ, quadratic reciprocity has positive sign because p≡1 mod4. For ℓ=2 use the supplementary law.
3. In a cyclic finite field unit group, an odd-order element is a square; conclude even order.

**Sources and matches:**

- BS20, Published spreading-out proof pp.906–907. For a fixed prime ℓ, integers B,k and finite bad-prime set S, there are arbitrarily large primes p>max(B,k,ℓ), p∉S, for which ℓ is a nonsquare modulo p and therefore has even multiplicative order. For odd ℓ choose a nonzero quadratic nonresidue a mod ℓ and the CRT residue p≡a mod ℓ, p≡1 mod4; for ℓ=2 use p≡5 mod8.

**Check:** The class 5 mod8 makes 2 a nonsquare. For odd ℓ, a must be nonzero so the CRT class is a unit. Avoidance is uniform over any prescribed finite set, not a single ad hoc characteristic.

<a id="gcm-3"></a>

## GCM.3. Polynomial maps and compact-support Fourier transform

Represent fixed-leading-vector polynomial maps as a coefficient scheme, obtain the component dimension lower bound, prove smoothness and geometric irreducibility of the projective closure, and construct the residue phase and its Artin–Schreier compact-support transform. Identify the mapping-scheme cohomology by Fourier orthogonality, with coefficient extension, shift and twist fixed.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.0`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `FiniteFieldsAndCharacterSums:FF.2`

### Polynomial mapping scheme with a fixed leading vector

`ExponentialSumsAndCircleMethodPartII:GCM.3/mapping` · definition · proof-plan

Fix a field K, n≥2, k≥3, f∈K[x₁,…,x_n] of degree k, and a nonzero vector x with f₀(x)=0, where f₀ is the degree-k part. For d≥1 put g_j=x_jT^d+Σ_{0≤i<d}a_{i,j}T^i. Mor_{d,x}(A¹,X) is the closed coefficient scheme in A^(dn) cut out by all coefficients of f(g); its top coefficient is already zero, so kd equations suffice. The tuple has degree exactly d, though an individual coordinate can have smaller degree. Fix x itself, with no quotient by reparametrization or scalar rescaling.

**Planet:** Polynomial mapping scheme.

**Dependencies:** `SchemeAndStackFoundations:SF.0`, `mathlib:MvPolynomial.eval₂Hom`.

**Construction/proof plan:**

1. Use polynomial evaluation to construct the coefficient equations functorially in K-algebras.
2. The leading coefficient is f₀(x); prove its vanishing before dropping that equation.
3. Identify R-points with the prescribed polynomial tuples and retain the representing-scheme structure, including nilpotents.

**Sources and matches:**

- BS20, §1, p.893; §2, eq. (2.1), p.899. Fix a field K, n≥2, k≥3, f∈K[x₁,…,x_n] of degree k, and a nonzero vector x with f₀(x)=0, where f₀ is the degree-k part. For d≥1 put g_j=x_jT^d+Σ_{0≤i<d}a_{i,j}T^i. Mor_{d,x}(A¹,X) is the closed coefficient scheme in A^(dn) cut out by all coefficients of f(g); its top coefficient is already zero, so kd equations suffice. The tuple has degree exactly d, though an individual coordinate can have smaller degree. Fix x itself, with no quotient by reparametrization or scalar rescaling.

**Check:** Fix a field K, n≥2, k≥3, f∈K[x₁,…,x_n] of degree k, and a nonzero vector x with f₀(x)=0, where f₀ is the degree-k part. For d≥1 put g_j=x_jT^d+Σ_{0≤i<d}a_{i,j}T^i. Mor_{d,x}(A¹,X) is the closed coefficient scheme in A^(dn) cut out by all coefficients of f(g); its top coefficient is already zero, so kd equations suffice. The tuple has degree exactly d, though an individual coordinate can have smaller degree. Fix x itself, with no quotient by reparametrization or scalar rescaling.

**Planning API:**

- `mappingPolynomial` (constructor): Construct g_j=x_jT^d+Σ_(i<d)a_(i,j)T^i over every K-algebra.
- `mappingPolynomial_coeff` (simp): For i<d the coefficient is a_(i,j); at d it is x_j; above d it is zero.
- `morPointsEquiv` (universal-property): R-points of Mor are exactly prescribed tuples satisfying f(g)=0, naturally in K-algebra R.
- `mor_baseChange` (compatibility): Coefficient extension gives the base change of the representing scheme, including nilpotents.
- `mappingPolynomial_ext` (extensionality): Equality of all lower coefficients is equivalent to equality of tuples with the same fixed x.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.3/orthogonality`: The phase coefficient zero scheme must equal Mor.
- `ExponentialSumsAndCircleMethodPartII:GCM.11/rev-analytic-polynomial-map-inclusion-into`: The fixed leading vector controls the infinity germ.

**Discriminating tests:**

- **individual-degree** (degenerate): For d=2,x=(1,0), the second coordinate has degree ≤1 while the tuple has degree two.
- **coefficient-index** (computation): With d=3, lower coefficients (a0,a1,a2) produce xT³+a2T²+a1T+a0.
- **fixed-representative** (non-example): Replacing x by 2x in characteristic zero changes the prescribed leading-coefficient functor; scalar reparametrization is not quotiented out.
- **ring-points** (compatibility): The equations are evaluated over K[ε]/(ε²), not only over field-valued points; the representing scheme must preserve these nilpotent directions.

### Expected dimension lower bound

`ExponentialSumsAndCircleMethodPartII:GCM.3/dimensionlower` · theorem · proof-plan

Every irreducible component of a nonempty Mor_{d,x} has dimension at least D=d(n−k). No nonemptiness or equidimensionality assertion is implicit.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `ExponentialSumsAndCircleMethodPartII:GCM.0/rev-affine-dimension-theorem-for-intersections`.

**Construction/proof plan:**

1. There are dn coefficient variables and at most kd coefficient equations.
2. Apply the componentwise codimension bound of GCM.0.

**Sources and matches:**

- BS20, §1, p.893 (expected dimension); §2, proof of Corollary 2.9, p.907. Every irreducible component of a nonempty Mor_{d,x} has dimension at least D=d(n−k). No nonemptiness or equidimensionality assertion is implicit.

**Check:** The bound is componentwise, so it can combine with top cohomology to exclude smaller components. When the scheme is empty, no component or dimension equality is inferred.

### Smooth projective closure of X and its irreducibility

`ExponentialSumsAndCircleMethodPartII:GCM.3/rev-smooth-projective-closure-of-x` · theorem · proof-plan

Assume X={f=0}⊂A^n is smooth and the degree-k hypersurface Z={f₀=0}⊂P^(n−1) is smooth. The homogenization defines a smooth projective X̄⊂P^n with boundary Z and X=X̄∖Z. For n≥2, X̄ is geometrically connected and geometrically irreducible of dimension n−1; its nonempty affine open X is geometrically irreducible.

**Planet:** Smooth projective closure.

**Dependencies:** `SchemeAndStackFoundations:SF.0`, `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`.

**Construction/proof plan:**

1. On the affine chart use smoothness of X; at infinity use a nonzero tangential derivative of f₀ on Z.
2. Use connectedness of a positive-dimensional projective hypersurface, and the disjointness of components of a smooth scheme, to obtain geometric irreducibility.
3. The boundary is a proper divisor, so the affine open is nonempty.

**Sources and matches:**

- BS20, §3, Lemma 3.7 (hypothesis) p.917, proof of Lemma 3.11 pp.919–920; §4, Lemma 4.2 pp.922–923. Assume X={f=0}⊂A^n is smooth and the degree-k hypersurface Z={f₀=0}⊂P^(n−1) is smooth. The homogenization defines a smooth projective X̄⊂P^n with boundary Z and X=X̄∖Z. For n≥2, X̄ is geometrically connected and geometrically irreducible of dimension n−1; its nonempty affine open X is geometrically irreducible.

**Check:** Do not infer geometric irreducibility from affine smoothness alone. At a boundary point the derivative test must use the leading form, not an affine chart with x₀≠0.

### Residue-coefficient phase

`ExponentialSumsAndCircleMethodPartII:GCM.3/phase` · definition · proof-plan

Set L=kd and α=Σ_{r=1}^L b_r T^(−r). On A^(dn)×A^L define e(a,b)=[T^(−1)]α f(g)=Σ_{r=1}^L b_r [T^(r−1)]f(g). This is a regular polynomial, linear in b and of degree at most k in a; its degree-k part uses f₀, while its lower-degree terms still use all of f.

**Planet:** Residue phase.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `mathlib:MvPolynomial.eval₂Hom`.

**Construction/proof plan:**

1. Expand the finite coefficient convolution; the top coefficient f₀(x) vanishes.
2. Separate the degree-k homogeneous part in the a-variables from the complete phase.

**Sources and matches:**

- BS20, §2, pp.899–900. Set L=kd and α=Σ_{r=1}^L b_r T^(−r). On A^(dn)×A^L define e(a,b)=[T^(−1)]α f(g)=Σ_{r=1}^L b_r [T^(r−1)]f(g). This is a regular polynomial, linear in b and of degree at most k in a; its degree-k part uses f₀, while its lower-degree terms still use all of f.

**Check:** Set L=kd and α=Σ_{r=1}^L b_r T^(−r). On A^(dn)×A^L define e(a,b)=[T^(−1)]α f(g)=Σ_{r=1}^L b_r [T^(r−1)]f(g). This is a regular polynomial, linear in b and of degree at most k in a; its degree-k part uses f₀, while its lower-degree terms still use all of f.

**Planning API:**

- `residuePhase` (constructor): Define the finite coefficient sum Σ_(r=1)^L b_r coeff(f(g),r−1).
- `residuePhase_linear_right` (structure): For fixed a the phase is a linear functional of b.
- `residuePhase_laurent` (compatibility): This coefficient sum equals [T^(−1)]αf(g) in the Laurent-series carrier.
- `residuePhase_top` (characterisation): Its homogeneous degree-k part in a is the parent ES.1 top-phase polynomial, not generally the entire phase.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.3/fouriercomplex`: Pull back the Artin–Schreier sheaf along this regular map.
- `ExponentialSumsAndCircleMethodPartII:GCM.9/ddminor`: Only its top degree enters polarization.

**Discriminating tests:**

- **zero-frequency** (computation): b=0 gives e(a,0)=0.
- **constant-term** (computation): Replacing f by f+1 changes e by b₁; it cannot leave the whole phase unchanged.
- **cubic-convolution** (computation): For f=Y₁³−Y₂³+1, d=1, x=(1,1), lower coefficients (a,c), e=b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c).

### Geometric exponential-sum complex

`ExponentialSumsAndCircleMethodPartII:GCM.3/fouriercomplex` · definition · proof-plan

Over F_q of characteristic p>k choose ℓ≠p, E=Q_ℓ(μ_p), and a nontrivial additive character ψ:F_p→E×. With π₂:A^(dn)×A^L→A^L define S_{d,f}=Rπ₂! e*L_ψ in the existing bounded constructible E-complex category. Its geometric stalk at b is RΓ_c(A^(dn),L_ψ(e(−,b))). No descent from E to Q_ℓ is assumed.

**Planet:** Circle-method Fourier complex.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/phase`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Pull back the rank-one Artin–Schreier sheaf along e and apply the supplied compact-support direct image.
2. Use exceptional base change to identify geometric stalks; distinguish a complex from its trace function.

**Sources and matches:**

- BS20, §2, p.901. Over F_q of characteristic p>k choose ℓ≠p, E=Q_ℓ(μ_p), and a nontrivial additive character ψ:F_p→E×. With π₂:A^(dn)×A^L→A^L define S_{d,f}=Rπ₂! e*L_ψ in the existing bounded constructible E-complex category. Its geometric stalk at b is RΓ_c(A^(dn),L_ψ(e(−,b))). No descent from E to Q_ℓ is assumed.

**Check:** Over F_q of characteristic p>k choose ℓ≠p, E=Q_ℓ(μ_p), and a nontrivial additive character ψ:F_p→E×. With π₂:A^(dn)×A^L→A^L define S_{d,f}=Rπ₂! e*L_ψ in the existing bounded constructible E-complex category. Its geometric stalk at b is RΓ_c(A^(dn),L_ψ(e(−,b))). No descent from E to Q_ℓ is assumed.

**Planning API:**

- `circleFourierComplex` (constructor): Apply the supplied Rπ₂! to e*L_ψ with coefficients E.
- `circleFourierComplex_stalk` (characterisation): The geometric stalk is RΓ_c(A^(dn),L_ψ(e_b)).
- `circleFourierComplex_coeffExtension` (compatibility): Finite E→E′ commutes with the construction via derived tensor.
- `circleFourierComplex_zero` (simp): At b=0 its stalk is E[−2dn](−dn).

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.3/orthogonality`: Integrating over all frequencies recovers mapping cohomology.
- `ExponentialSumsAndCircleMethodPartII:GCM.9/stalkminor`: The stalk is the complex whose cohomological degree Weyl estimates.

**Discriminating tests:**

- **zero-stalk** (computation): At zero frequency the top nonzero degree is 2dn with Tate twist −dn.
- **nontrivial-extension** (compatibility): For k=3, p=5 and ℓ=2 use E=Q₂(μ₅). The order of 2 modulo 5 is four, and Q₂ itself has no nontrivial fifth-root-valued additive character.
- **linear-cancellation** (non-example): A fibre whose phase is a nonzero linear functional has zero compact-support complex, although its source affine space is nonempty.

### Cohomological Fourier orthogonality

`ExponentialSumsAndCircleMethodPartII:GCM.3/orthogonality` · theorem · proof-plan

With the preceding finite-field data, RΓ_c(Mor_{d,x},E)≅RΓ_c(A^L,S_{d,f})[2L](L). Thus H_c^i(Mor,E)≅H_c^(i+2L)(A^L,S)(L), compatibly with geometric Frobenius and extension of E.

**Planet:** Cohomological orthogonality.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/fouriercomplex`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/character-sheaf-cohomology-vanishes`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`, `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`.

**Construction/proof plan:**

1. First integrate the phase over b. A nonzero coefficient vector gives an acyclic nontrivial linear Artin–Schreier sheaf.
2. On the zero coefficient scheme the fibre is RΓ_c(A^L,E)=E[−2L](−L). Apply base change and Fubini to retain the scheme-theoretic zero locus.

**Sources and matches:**

- BS20, §2, Lemma 2.1, p.901; proof pp.901–902, citing [16, Lemma 13] = Katz, 'Sums of Betti numbers'. With the preceding finite-field data, RΓ_c(Mor_{d,x},E)≅RΓ_c(A^L,S_{d,f})[2L](L). Thus H_c^i(Mor,E)≅H_c^(i+2L)(A^L,S)(L), compatibly with geometric Frobenius and extension of E.

**Check:** At b=0 the phase is zero; linear-character cancellation cannot be applied there. The recovered mapping cohomology has shift +2kd and twist +kd.

<a id="gcm-4"></a>

## GCM.4. Hankel rank arcs and rational approximation

Define the saturated rank-Hankel filtration, prove closedness, nesting and the ceiling threshold at odd kd, and establish existence and uniqueness of reduced Padé data on exact strata. Construct the good-arc chart and its regular inverse and prove the dimension bound.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.0`, `ExponentialSumsAndCircleMethodPartII:GCM.3`

### Hankel-rank geometric major arcs

`ExponentialSumsAndCircleMethodPartII:GCM.4/hankel` · definition · proof-plan

For L≥0 and 0≤m≤L form the (L−m)×(m+1) matrix H_m(b)=(b_{i+j−1}) with 1≤i≤L−m, 1≤j≤m+1. Let D_m^L be the determinantal closed scheme defined by its (m+1)-minors, and let A_m^L be its associated reduced closed scheme. Both have field-valued locus rank H_m≤m. Set A_(−1)=∅ and saturate A_m=A^L for m>L. The minors give the base-change-compatible scheme model; nesting, dimensions and strata refer to the reduced loci. Reduction is not asserted to commute with arbitrary field extension.

**Planet:** Hankel rank arcs.

**Dependencies:** `SchemeAndStackFoundations:SF.0`, `mathlib:Matrix.rank`.

**Construction/proof plan:**

1. Use the actual Matrix carrier and determinantal ideals, not a predicate standing in for a scheme.
2. Make all out-of-range cases explicit; natural subtraction alone does not define the intended negative stage.

**Sources and matches:**

- BS20, §2, Definition 2.3, p.903. For L≥0 and 0≤m≤L form the (L−m)×(m+1) matrix H_m(b)=(b_{i+j−1}) with 1≤i≤L−m, 1≤j≤m+1. Let D_m^L be the determinantal closed scheme defined by its (m+1)-minors, and let A_m^L be its associated reduced closed scheme. Both have field-valued locus rank H_m≤m. Set A_(−1)=∅ and saturate A_m=A^L for m>L. The minors give the base-change-compatible scheme model; nesting, dimensions and strata refer to the reduced loci. Reduction is not asserted to commute with arbitrary field extension.

**Check:** For L≥0 and 0≤m≤L form the (L−m)×(m+1) matrix H_m(b)=(b_{i+j−1}) with 1≤i≤L−m, 1≤j≤m+1. Let D_m^L be the determinantal closed scheme defined by its (m+1)-minors, and let A_m^L be its associated reduced closed scheme. Both have field-valued locus rank H_m≤m. Set A_(−1)=∅ and saturate A_m=A^L for m>L. The minors give the base-change-compatible scheme model; nesting, dimensions and strata refer to the reduced loci. Reduction is not asserted to commute with arbitrary field extension.

**Planning API:**

- `hankelMatrix` (constructor): Build H_m with Fin(L−m) rows, Fin(m+1) columns and entry b_(i+j+1) in zero-based indexing.
- `rankArc` (constructor): Construct D_m from minors and A_m as its associated reduced closed scheme, with the common field-point rank characterization.
- `rankArc_saturated` (simp): A_(−1)=∅; for m>L the stage is A^L.
- `rankArc_baseChange` (compatibility): The determinantal model D_m defined by minors commutes with field extension; take reduction after the chosen extension when forming reduced strata.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.4/padeexist`: Its kernel is the denominator recurrence.
- `ExponentialSumsAndCircleMethodPartII:GCM.9/minorcover`: The closed nesting supplies the finite filtration.

**Discriminating tests:**

- **zero-stage** (computation): For L=3,m=0, rank≤0 forces b₁=b₂=b₃=0.
- **odd-antiidentity** (computation): For L=9,b₅=1 and all other b=0, H₄ is the 5×5 anti-identity and rank five.
- **zero-rows** (degenerate): For m=L, H_m has zero rows and A_L=A^L; for m>L the scheme is saturated explicitly.

### Closedness and nesting of major arcs

`ExponentialSumsAndCircleMethodPartII:GCM.4/arcsclosed` · theorem · proof-plan

The reduced rank arcs are closed and nested, A_(m−1)⊂A_m. A₀ consists of the zero coefficient vector. These assertions use the Hankel relation between successive matrices, rather than an arbitrary rectangular matrix rank comparison.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.4/hankel`.

**Construction/proof plan:**

1. Closedness follows from the determinantal model.
2. Extend a kernel recurrence by one degree, or use the Padé recurrence argument directly, to obtain field-point nesting without assuming every matrix is square; pass to reduced closed loci to obtain the closed immersion.

**Sources and matches:**

- BS20, §2, Lemma 2.4(1)–(2), p.903; proof pp.903–904. The reduced rank arcs are closed and nested, A_(m−1)⊂A_m. A₀ consists of the zero coefficient vector. These assertions use the Hankel relation between successive matrices, rather than an arbitrary rectangular matrix rank comparison.

**Check:** For L=3, A₀ has all three coefficients zero. Test a geometric progression, which lies in A₁.

### Exact automatic-full range

`ExponentialSumsAndCircleMethodPartII:GCM.4/arcsfull` · theorem · proof-plan

If m≥ceil(L/2), A_m^L=A^L. The preceding threshold cannot in general be replaced by floor(L/2): for L=9 the vector with b₅=1 and all other entries zero has rank H₄=5.

**Planet:** Full-arc threshold.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.4/hankel`.

**Construction/proof plan:**

1. At the ceiling threshold the number L−m of rows is at most m.
2. For the odd-length test compute the anti-identity matrix of size five.

**Sources and matches:**

- BS20, §2, Lemma 2.4(3), p.903; corrected use in §5, proof of Proposition 2.6, p.934. If m≥ceil(L/2), A_m^L=A^L. The preceding threshold cannot in general be replaced by floor(L/2): for L=9 the vector with b₅=1 and all other entries zero has rank H₄=5.

**Check:** L=9,m=4 is not full. L=9,m=5 is full. L=0 has a full zero-dimensional coefficient space.

### Hankel rank and Padé approximation

`ExponentialSumsAndCircleMethodPartII:GCM.4/padeexist` · theorem · proof-plan

For 0≤m≤L, b∈A_m^L exactly when there are 0≤m′≤m, a monic h₂ of degree m′, and h₁ of degree <m′, for which α=h₁/h₂+O(T^(−L−1+m−m′)). The formal O condition means every error exponent is at most the indicated integer; for m′=0 the numerator is zero.

**Planet:** Padé description of rank arcs.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.4/hankel`, `mathlib:LaurentSeries`.

**Construction/proof plan:**

1. Translate a nonzero vector in ker H_m into a polynomial denominator.
2. Separate its actual degree m′, clear the denominator and compare the consecutive Laurent coefficients.
3. Conversely these coefficient equalities give the Hankel kernel vector.

**Sources and matches:**

- BS20, §2, Lemma 2.4(4), p.903; proof p.904. For 0≤m≤L, b∈A_m^L exactly when there are 0≤m′≤m, a monic h₂ of degree m′, and h₁ of degree <m′, for which α=h₁/h₂+O(T^(−L−1+m−m′)). The formal O condition means every error exponent is at most the indicated integer; for m′=0 the numerator is zero.

**Check:** For α=0 one may take h₂=1,h₁=0. Actual denominator degree can be smaller than m. The error bound changes by m−m′; replacing it by a fixed exact rational identity is wrong.

### Unique reduced approximation on a rank stratum

`ExponentialSumsAndCircleMethodPartII:GCM.4/padeunique` · theorem · proof-plan

If 0≤m≤L/2 and b∈A_m∖A_(m−1), the Padé triple (m′,h₁,h₂) is unique, with h₂ monic and gcd(h₁,h₂)=1. When m′<m the coefficient of T^(−L−1+m−m′) in the error is nonzero.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.4/padeexist`, `ExponentialSumsAndCircleMethodPartII:GCM.4/arcsclosed`.

**Construction/proof plan:**

1. Compare two approximants by the degree of their cross-product numerator and the long Laurent agreement.
2. Cancel any common factor; failure of coprimality or of the stated leading-error condition would put b in A_(m−1).

**Sources and matches:**

- BS20, §2, Lemma 2.4(5), p.903; proof pp.904–905. If 0≤m≤L/2 and b∈A_m∖A_(m−1), the Padé triple (m′,h₁,h₂) is unique, with h₂ monic and gcd(h₁,h₂)=1. When m′<m the coefficient of T^(−L−1+m−m′) in the error is nonzero.

**Check:** Monicity removes scalar ambiguity. Uniqueness is asserted on the exact rank stratum and only in the stated m-range.

### Exact-denominator major-arc open

`ExponentialSumsAndCircleMethodPartII:GCM.4/goodarc` · definition · proof-plan

For 0≤m≤L/2 let U_m be the points of A_m∖A_(m−1) whose reduced Padé denominator has degree exactly m. Equivalently α agrees through T^(−L) with h₁/h₂, where h₂ is monic of degree m, deg h₁<m and the pair is coprime. At m=0 the sole pair is (0,1).

**Planet:** Good-arc chart.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.4/padeunique`.

**Construction/proof plan:**

1. Use unique Padé data to define the full-denominator open chart.
2. Identify its inverse by the finite list of Laurent coefficients.

**Sources and matches:**

- BS20, §3, p.908. For 0≤m≤L/2 let U_m be the points of A_m∖A_(m−1) whose reduced Padé denominator has degree exactly m. Equivalently α agrees through T^(−L) with h₁/h₂, where h₂ is monic of degree m, deg h₁<m and the pair is coprime. At m=0 the sole pair is (0,1).

**Check:** For 0≤m≤L/2 let U_m be the points of A_m∖A_(m−1) whose reduced Padé denominator has degree exactly m. Equivalently α agrees through T^(−L) with h₁/h₂, where h₂ is monic of degree m, deg h₁<m and the pair is coprime. At m=0 the sole pair is (0,1).

**Planning API:**

- `goodArc` (constructor): Select exact-stratum points whose unique reduced denominator has degree m.
- `goodArc_pairEquiv` (equivalence): Identify U_m with monic degree-m denominator/coprime numerator pairs.
- `goodArc_laurentCoefficients` (compatibility): The forward chart map is the first L negative Laurent coefficients of h₁/h₂.
- `goodArc_open` (structure): The chart and its inverse are regular on the resultant-open pair space.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.5/boundarycancel`: The complement in the exact stratum has zero S restriction.
- `ExponentialSumsAndCircleMethodPartII:GCM.5/remainder`: Monic division is performed over this chart.

**Discriminating tests:**

- **m-zero** (degenerate): U₀ is the single pair (h₁,h₂)=(0,1).
- **simple-pole** (computation): For m=1, h₁=c≠0,h₂=T−a gives b_r=c a^(r−1).
- **common-factor** (non-example): The pair h₁=T−a,h₂=(T−a)(T−b) is excluded by coprimality and reduces to a smaller denominator.

### Polynomial-pair model of the good arc

`ExponentialSumsAndCircleMethodPartII:GCM.4/goodarciso` · theorem · proof-plan

The coefficient expansion (h₁,h₂)↦([T^(−r)]h₁/h₂)_(1≤r≤L) identifies the open coprime-pair scheme in A^(2m) with U_m; the inverse is regular. Moreover dim A_m≤2m for m≤L/2, including the lower-denominator boundary.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.4/goodarc`, `ExponentialSumsAndCircleMethodPartII:GCM.4/padeexist`, `ExponentialSumsAndCircleMethodPartII:GCM.0/rev-fibre-dimension-stratification`.

**Construction/proof plan:**

1. Use the relevant nonzero Hankel minor to solve the recurrence regularly on a cover.
2. For each m′≤m count m′ numerator and m′ denominator parameters and m−m′ possible error coefficients: at most m+m′≤2m.
3. Do not infer the full dimension bound from the open chart alone unless density has also been proved.

**Sources and matches:**

- BS20, §3, Lemma 3.1, pp.908–909; proof pp.909–910; dimension use in §5, proof of Proposition 2.6, p.934. The coefficient expansion (h₁,h₂)↦([T^(−r)]h₁/h₂)_(1≤r≤L) identifies the open coprime-pair scheme in A^(2m) with U_m; the inverse is regular. Moreover dim A_m≤2m for m≤L/2, including the lower-denominator boundary.

**Check:** m=0 gives a point. m=1 uses a nonzero constant numerator. The lower-denominator strata are included in the dimension bound.

<a id="gcm-5"></a>

## GCM.5. Major-arc complexes and signed configuration descent

Cancel bad arcs and repeated denominators, divide polynomials by a monic denominator, compute the affine-fibre shift, and factor the reduced phase by CRT. Identify the one-root complex with trace-reduced hypersurface cohomology and descend along the ordered-root torsor. Prove concentration in degree n−1 and the exact signed, twisted stratum formula for 0≤m≤d.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.3`, `ExponentialSumsAndCircleMethodPartII:GCM.4`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.4`, `FiniteFieldsAndCharacterSums:FF.2`, `AlgebraicTopologyPartII:AT2.1`

### Lower-denominator boundary cancellation

`ExponentialSumsAndCircleMethodPartII:GCM.5/boundarycancel` · theorem · proof-plan

For 0≤m≤d, the restriction of S_{d,f} to (A_m∖A_(m−1))∖U_m is zero. At a point of denominator degree m′<m, a nonzero coordinate of ∇f₀(x) gives an additive translation of the polynomial tuple whose phase has nontrivial linear variation.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/fouriercomplex`, `ExponentialSumsAndCircleMethodPartII:GCM.4/padeunique`, `ExponentialSumsAndCircleMethodPartII:GCM.4/goodarc`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/translation-cancellation`.

**Construction/proof plan:**

1. Choose a coordinate with nonzero leading gradient and translate it by λT^(d−m)h₂.
2. The exact Padé error term makes the phase variation a nonzero multiple of λ.
3. Apply the supplied equivariant additive-character cancellation after base change to every geometric point.

**Sources and matches:**

- BS20, §3, Lemma 3.3, p.911; proof pp.911–912. For 0≤m≤d, the restriction of S_{d,f} to (A_m∖A_(m−1))∖U_m is zero. At a point of denominator degree m′<m, a nonzero coordinate of ∇f₀(x) gives an additive translation of the polynomial tuple whose phase has nontrivial linear variation.

**Check:** The exponent d−m must be nonnegative. At m′=m the argument does not cancel the good chart.

### Remainder fibration on the good arc

`ExponentialSumsAndCircleMethodPartII:GCM.5/remainder` · construction · proof-plan

For m≤d and a monic denominator h₂ of degree m, divide each g_j by h₂. Over U_m this gives ρ:A^(dn)×U_m→A^(mn)×U_m, sending g to the remainders of degree <m. It is a trivial affine bundle of rank n(d−m), with the quotient’s leading term fixed by x. The residue phase descends to the remainder variables.

**Planet:** Monic remainder bundle.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `ExponentialSumsAndCircleMethodPartII:GCM.3/phase`, `ExponentialSumsAndCircleMethodPartII:GCM.4/goodarc`.

**Construction/proof plan:**

1. Use monic division over arbitrary coefficient algebras to obtain regular quotient and remainder maps.
2. After multiplying the quotient part by h₂, its contribution to the residue is polynomial in T and hence zero.

**Sources and matches:**

- BS20, §3, pp.912–913, and proof of Lemma 3.4, p.913. For m≤d and a monic denominator h₂ of degree m, divide each g_j by h₂. Over U_m this gives ρ:A^(dn)×U_m→A^(mn)×U_m, sending g to the remainders of degree <m. It is a trivial affine bundle of rank n(d−m), with the quotient’s leading term fixed by x. The residue phase descends to the remainder variables.

**Check:** For m≤d and a monic denominator h₂ of degree m, divide each g_j by h₂. Over U_m this gives ρ:A^(dn)×U_m→A^(mn)×U_m, sending g to the remainders of degree <m. It is a trivial affine bundle of rank n(d−m), with the quotient’s leading term fixed by x. The residue phase descends to the remainder variables.

**Planning API:**

- `remainderBundle` (constructor): Construct quotient and remainder maps by monic division over the full pair base.
- `remainderBundle_trivialization` (equivalence): Identify the fibres with A^(n(d−m)), preserving the fixed quotient leading term.
- `phase_factors_remainder` (compatibility): The residue phase equals the reduced phase pulled back through ρ.
- `remainderBundle_baseChange` (functoriality): The quotient/remainder formulas commute with K-algebra maps.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.5/remaindershift`: Its actual relative rank determines the shift and twist.
- `ExponentialSumsAndCircleMethodPartII:GCM.5/smallcomplex`: Defines the phase on remainder coordinates.

**Discriminating tests:**

- **equal-degrees** (degenerate): m=d gives a rank-zero affine bundle, not a positive-dimensional fibre.
- **linear-division** (computation): Dividing xT²+a₁T+a₀ by T−b gives remainder xb²+a₁b+a₀ and quotient with leading coefficient x.
- **monic-required** (non-example): Division by a polynomial with a nonunit leading coefficient over a general coefficient algebra is not this trivial bundle.

### Residue-class exponential complex

`ExponentialSumsAndCircleMethodPartII:GCM.5/smallcomplex` · definition · proof-plan

Let B_m be the affine scheme of monic degree-m polynomials. On coprime pairs (h₁,h₂) and n remainders modulo h₂ define ē by the coefficient of T^(−1) in h₁f(remainders)/h₂. Integrate ē*L_ψ first over the mn remainder coordinates and then over h₁ coprime to h₂; the resulting constructible complex on B_m is S̄_m.

**Planet:** Denominator complex.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/remainder`, `EtaleDualityAndPerverseSheaves:EDC.0`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Construct the phase by monic division and finite Laurent expansion.
2. Name the two direct-image maps, so the complex on U_m is not confused with its pushforward on B_m.

**Sources and matches:**

- BS20, §3, p.913. Let B_m be the affine scheme of monic degree-m polynomials. On coprime pairs (h₁,h₂) and n remainders modulo h₂ define ē by the coefficient of T^(−1) in h₁f(remainders)/h₂. Integrate ē*L_ψ first over the mn remainder coordinates and then over h₁ coprime to h₂; the resulting constructible complex on B_m is S̄_m.

**Check:** Let B_m be the affine scheme of monic degree-m polynomials. On coprime pairs (h₁,h₂) and n remainders modulo h₂ define ē by the coefficient of T^(−1) in h₁f(remainders)/h₂. Integrate ē*L_ψ first over the mn remainder coordinates and then over h₁ coprime to h₂; the resulting constructible complex on B_m is S̄_m.

**Planning API:**

- `smallDenominatorComplex` (constructor): Integrate the reduced phase over remainders and the coprime-numerator fibre to get a complex on B_m.
- `smallDenominatorComplex_stalk` (characterisation): At h₂ the stalk integrates exactly all h₁ with deg<h₂ and gcd(h₁,h₂)=1, together with the n remainder classes.
- `smallDenominatorComplex_crt` (compatibility): Coprime factorization pulls it back to the external tensor product.
- `smallDenominatorComplex_base` (projection): Distinguish its B_m base from the U_m complex before the numerator pushforward.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.5/repeatedcancel`: Non-squarefree denominators have zero stalk.
- `ExponentialSumsAndCircleMethodPartII:GCM.5/configdescent`: Its squarefree restriction descends from ordered roots.

**Discriminating tests:**

- **one-root** (computation): For h₂=T−a the numerator is a nonzero constant h and the phase is h f(g(a)).
- **empty-denominator** (degenerate): At m=0 the only numerator-denominator pair is (0,1); the complex is E.
- **noncoprime-numerator** (non-example): The zero numerator for a positive-degree denominator is not in the coprime integration domain.

### Affine-fibre shift and twist

`ExponentialSumsAndCircleMethodPartII:GCM.5/remaindershift` · theorem · proof-plan

For 0≤m≤d, integrating the quotient coordinates gives Rρ!E=E[−2n(d−m)](−n(d−m)). Consequently RΓ_c(U_m,S)≅RΓ_c(B_m,S̄_m)[−2n(d−m)](−n(d−m)).

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/remainder`, `ExponentialSumsAndCircleMethodPartII:GCM.5/smallcomplex`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`, `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`.

**Construction/proof plan:**

1. Use the trace normalization of compact cohomology of affine space.
2. Apply projection formula to the descended phase; then compose the two compact-support integrations.

**Sources and matches:**

- BS20, §3, Lemma 3.4, p.913; proof pp.913–914. For 0≤m≤d, integrating the quotient coordinates gives Rρ!E=E[−2n(d−m)](−n(d−m)). Consequently RΓ_c(U_m,S)≅RΓ_c(B_m,S̄_m)[−2n(d−m)](−n(d−m)).

**Check:** At m=d the shift and twist are zero. For a single quotient coordinate the shift is −2, never +2.

### Coprime multiplicativity

`ExponentialSumsAndCircleMethodPartII:GCM.5/crtproduct` · theorem · proof-plan

On the open locus of coprime monic factors l₁,l₂ of degrees m₁,m₂, multiplication pulls S̄_(m₁+m₂) back to S̄_m₁⊠S̄_m₂. The numerator correspondence is h=h₁l₂+h₂l₁, and the remainder correspondence is the Chinese remainder isomorphism modulo l₁l₂. Interchanging factors uses the derived tensor symmetry.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/smallcomplex`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Use the Bézout identity to make both CRT and numerator changes regular on the resultant-open locus.
2. The rational phase is the sum h₁f/l₁+h₂f/l₂ modulo polynomials.
3. Apply Künneth including its Koszul commutativity constraint.

**Sources and matches:**

- BS20, §3, Lemma 3.5, p.914; proof pp.914–915. On the open locus of coprime monic factors l₁,l₂ of degrees m₁,m₂, multiplication pulls S̄_(m₁+m₂) back to S̄_m₁⊠S̄_m₂. The numerator correspondence is h=h₁l₂+h₂l₁, and the remainder correspondence is the Chinese remainder isomorphism modulo l₁l₂. Interchanging factors uses the derived tensor symmetry.

**Check:** Two distinct linear factors recover a tensor square. Do not multiply the numerator names in place of l₁l₂.

### Nonsquarefree-modulus cancellation

`ExponentialSumsAndCircleMethodPartII:GCM.5/repeatedcancel` · theorem · proof-plan

If h₂ is not squarefree, the stalk of S̄_m at h₂ vanishes. After CRT reduction to (T−a)^r with r≥2, translate a remainder coordinate when ∇f is nonzero; when ∇f is zero, smoothness of X forces f≠0 and a numerator translation supplies the nontrivial character.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/crtproduct`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/translation-cancellation`.

**Construction/proof plan:**

1. Reduce by CRT to a repeated local factor.
2. Partition according to the gradient and use the two distinct translations.
3. Apply compact-support additive cancellation in each case; do not assume every point lies on X.

**Sources and matches:**

- BS20, §3, Lemma 3.6, p.916; proof pp.916–917. If h₂ is not squarefree, the stalk of S̄_m at h₂ vanishes. After CRT reduction to (T−a)^r with r≥2, translate a remainder coordinate when ∇f is nonzero; when ∇f is zero, smoothness of X forces f≠0 and a numerator translation supplies the nontrivial character.

**Check:** A double root is excluded from the support. The f≠0 branch is essential at critical points away from X.

### Reduced compact cohomology via trace fibre

`ExponentialSumsAndCircleMethodPartII:GCM.5/reduced` · definition · proof-plan

For smooth geometrically irreducible X of dimension n−1 define RΓ_(c,red)(X,E) as the homotopy fibre of the trace RΓ_c(X,E)→E[−2(n−1)](−(n−1)). This removes top compact cohomology; it is not ordinary reduced cohomology formed by a basepoint.

**Planet:** Trace-reduced cohomology.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/rev-smooth-projective-closure-of-x`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`, `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`.

**Construction/proof plan:**

1. Use the existing trace and fibre in the enhanced constructible-complex formalism.
2. Fix fibre, shift and twist by its distinguished triangle rather than by a dimension-only characterization.

**Sources and matches:**

- BS20, §3, p.917. For smooth geometrically irreducible X of dimension n−1 define RΓ_(c,red)(X,E) as the homotopy fibre of the trace RΓ_c(X,E)→E[−2(n−1)](−(n−1)). This removes top compact cohomology; it is not ordinary reduced cohomology formed by a basepoint.

**Check:** For smooth geometrically irreducible X of dimension n−1 define RΓ_(c,red)(X,E) as the homotopy fibre of the trace RΓ_c(X,E)→E[−2(n−1)](−(n−1)). This removes top compact cohomology; it is not ordinary reduced cohomology formed by a basepoint.

**Planning API:**

- `traceReducedComplex` (constructor): Take the homotopy fibre of the degree-2(n−1) trace.
- `traceReducedComplex_triangle` (characterisation): Give the fibre→RΓ_c(X)→E[−2(n−1)](−(n−1)) distinguished triangle.
- `traceReducedComplex_top` (simp): When top trace is an isomorphism, the fibre has no top cohomology.
- `traceReducedComplex_coeffExtension` (compatibility): The fibre and trace commute with finite coefficient extension.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.5/singleexponential`: Identifies the one-root exponential complex.
- `ExponentialSumsAndCircleMethodPartII:GCM.5/middleconcentrated`: The remaining degree is n−1.

**Discriminating tests:**

- **affine-space** (compatibility): For X=A^(n−1) the trace is an isomorphism and the reduced complex is zero.
- **top-twist** (computation): The removed object is E[−2(n−1)](−(n−1)), not E in degree zero.
- **disconnected-test** (non-example): For two disjoint copies of A^(n−1), the trace fibre retains one top-dimensional class; irreducibility cannot be omitted from top-isomorphism use.

### One-parameter exponential cohomology

`ExponentialSumsAndCircleMethodPartII:GCM.5/singleexponential` · theorem · proof-plan-with-reviewed-supplier

For the standing smooth affine hypersurface and smooth leading boundary, RΓ_c(G_m×A^n,L_ψ(hf(a)))≅RΓ_(c,red)(X,E)[−2](−1). This is a complex isomorphism compatible with trace, not just an equality of exponential sums.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/reduced`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/fourier-input-for-one-modulus`, `FiniteFieldsAndCharacterSums:FF.2/fourier-deligne-inversion`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`, `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`.

**Construction/proof plan:**

1. Integrate over h∈A¹ first and use Artin–Schreier orthogonality. Excision of h=0 gives a triangle whose second and third terms are RΓ_c(X,E)[−2](−1) and E[−2n](−n). The third term is concentrated in degree 2n.
2. To prove that its top connecting map is nonzero, choose a coordinate in which f is nonconstant on the generic line. Over the open set of the other n−1 coordinates where its degree is between 1 and k<p, import FF.2/fourier-input-for-one-modulus: the G_m×A¹ fibre has cohomological degree at most two. On the exceptional locus, of dimension at most n−2, the elementary dimension bound is at most four. The total cohomological degree is therefore at most 2n in both pieces.
3. The long exact sequence now makes H_c^(2n−2)(X,E)(−1)→E(−n) surjective. Smooth geometric irreducibility makes its source rank one. Identify this nonzero scalar multiple of the trace and normalize it; taking its fibre gives the trace-reduced complex with shift −2 and twist −1. No equality of numerical trace functions substitutes for this argument.
4. The accepted FF.2 supplier proves its one-modulus input by Fourier–Deligne inversion and the absence of constant summands in a connected polynomial cover. This is a public-source replacement of the unavailable Katz citation, not a claim to have read that book.

**Sources and matches:**

- BS20, §3, Lemma 3.7, p.917; proof pp.917–918, citing [15, 8.2.5(2)] = Katz, GKSM. Lemma 3.7 and the generic-line proof give the target and the top-map reduction. The unread Katz step is replaced by the exact accepted FF.2 one-modulus input; the open/exceptional-locus cohomological bound is spelled out here.

**Check:** The h-parameter is nonzero. The affine h-integral contributes shift −2 and twist −1.

### Linear-modulus constant complex

`ExponentialSumsAndCircleMethodPartII:GCM.5/singlecomplex` · theorem · proof-plan

S̄₁ is the constant complex on B₁≅A¹ with value RΓ_(c,red)(X,E)[−2](−1). Translation of the unique denominator root makes the identification independent of that root.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/smallcomplex`, `ExponentialSumsAndCircleMethodPartII:GCM.5/singleexponential`.

**Construction/proof plan:**

1. For h₂=T−a, evaluation of the remainder identifies the phase with h f(g(a)).
2. Translate a and apply singleexponential with its trace compatibility.

**Sources and matches:**

- BS20, §3, Lemma 3.8, p.918. S̄₁ is the constant complex on B₁≅A¹ with value RΓ_(c,red)(X,E)[−2](−1). Translation of the unique denominator root makes the identification independent of that root.

**Check:** S̄₁ is the constant complex on B₁≅A¹ with value RΓ_(c,red)(X,E)[−2](−1). Translation of the unique denominator root makes the identification independent of that root.

### Configuration-space descent for all moduli

`ExponentialSumsAndCircleMethodPartII:GCM.5/configdescent` · theorem · proof-plan

For each m≥0, RΓ_c(B_m,S̄_m)≅(RΓ_c(PConf_m(A¹),E)⊗RΓ_(c,red)(X,E)^⊗m)^(S_m)[−2m](−m). Here PConf₀ is a point, and the ordered-root torsor lies over squarefree monic polynomials. Invariants are exact because E has characteristic zero, even when ℓ divides m!.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/repeatedcancel`, `ExponentialSumsAndCircleMethodPartII:GCM.5/singlecomplex`, `ExponentialSumsAndCircleMethodPartII:GCM.5/crtproduct`, `EtaleDualityAndPerverseSheaves:EDC.0`, `AlgebraicTopologyPartII:AT2.1/configurations`, `AlgebraicTopologyPartII:AT2.1/configuration-torsor`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Use repeatedcancel to restrict to squarefree denominators.
2. Pull back along the supplied finite étale root-ordering S_m-torsor and apply CRT repeatedly.
3. Descend the derived complex using the full symmetric action, including tensor permutations.

**Sources and matches:**

- BS20, §3, Lemma 3.9, p.918; proof p.919. For each m≥0, RΓ_c(B_m,S̄_m)≅(RΓ_c(PConf_m(A¹),E)⊗RΓ_(c,red)(X,E)^⊗m)^(S_m)[−2m](−m). Here PConf₀ is a point, and the ordered-root torsor lies over squarefree monic polynomials. Invariants are exact because E has characteristic zero, even when ℓ divides m!.

**Check:** m=0 gives E. m=1 has no nontrivial symmetric action. ℓ∣m! does not invalidate invariants over Q_ℓ.

### Major-arc stratum complex

`ExponentialSumsAndCircleMethodPartII:GCM.5/stratumcomplex` · theorem · proof-plan

For 0≤m≤d, RΓ_c(A_m∖A_(m−1),S)≅(RΓ_c(PConf_m,E)⊗RΓ_(c,red)(X,E)^⊗m)^(S_m)[−2m−2n(d−m)](−m−n(d−m)).

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/boundarycancel`, `ExponentialSumsAndCircleMethodPartII:GCM.5/remaindershift`, `ExponentialSumsAndCircleMethodPartII:GCM.5/configdescent`.

**Construction/proof plan:**

1. Excision and boundarycancel replace the exact stratum by U_m.
2. Compose remaindershift with configdescent without discarding the affine quotient contribution.

**Sources and matches:**

- BS20, §3, Corollary 3.10, p.919. For 0≤m≤d, RΓ_c(A_m∖A_(m−1),S)≅(RΓ_c(PConf_m,E)⊗RΓ_(c,red)(X,E)^⊗m)^(S_m)[−2m−2n(d−m)](−m−n(d−m)).

**Check:** At m=0 the value is E[−2nd](−nd). The result is not asserted for m>d.

### Reduced cohomology concentrated in the middle

`ExponentialSumsAndCircleMethodPartII:GCM.5/middleconcentrated` · theorem · proof-plan

For n≥3, smooth X and smooth leading boundary, RΓ_(c,red)(X,E) has cohomology only in degree n−1, equal to V=H_c^(n−1)(X,E). The trace is an isomorphism in degree 2(n−1).

**Planet:** Middle-degree concentration.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/reduced`, `ExponentialSumsAndCircleMethodPartII:GCM.3/rev-smooth-projective-closure-of-x`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`, `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`.

**Construction/proof plan:**

1. Apply affine Artin vanishing below n−1.
2. Use the closure/boundary localization sequence, weak Lefschetz and duality above the middle degree.
3. Remove precisely the top trace summand using geometric irreducibility.

**Sources and matches:**

- BS20, §3, Lemma 3.11, p.919; proof pp.919–920. For n≥3, smooth X and smooth leading boundary, RΓ_(c,red)(X,E) has cohomology only in degree n−1, equal to V=H_c^(n−1)(X,E). The trace is an isomorphism in degree 2(n−1).

**Check:** Projective hyperplane classes belong to X̄, not to affine X. The reduced complex removes top cohomology rather than degree zero.

### Middle compact cohomology and parity-twisted tensors

`ExponentialSumsAndCircleMethodPartII:GCM.5/hypersurfmiddle` · definition · proof-plan

Write V=H_c^(n−1)(X,E). Define W_m=(V^⊗m⊗sgn^(n−1))^(S_m), with the S_m-action coming from place permutations and the Koszul sign of degree n−1. W₀=E. In stratum formulas take invariants only after tensoring with the configuration cohomology; replacing that diagonal action by W_m alone loses information.

**Planet:** Signed middle tensor powers.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/middleconcentrated`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Use the coefficient category’s tensor permutation and sign representation.
2. Identify the action after replacing the reduced complex by V placed in degree n−1.

**Sources and matches:**

- BS20, §1, Theorem 1.1, p.894; §3, Corollary 3.12 and its proof, p.920. Write V=H_c^(n−1)(X,E). Define W_m=(V^⊗m⊗sgn^(n−1))^(S_m), with the S_m-action coming from place permutations and the Koszul sign of degree n−1. W₀=E. In stratum formulas take invariants only after tensoring with the configuration cohomology; replacing that diagonal action by W_m alone loses information.

**Check:** Write V=H_c^(n−1)(X,E). Define W_m=(V^⊗m⊗sgn^(n−1))^(S_m), with the S_m-action coming from place permutations and the Koszul sign of degree n−1. W₀=E. In stratum formulas take invariants only after tensoring with the configuration cohomology; replacing that diagonal action by W_m alone loses information.

**Planning API:**

- `middleCohomology` (data): V is the actual H_c^(n−1)(X,E).
- `signedTensorInvariant` (constructor): Form W_m=(V^⊗m⊗sgn^(n−1))^(S_m).
- `signedTensorInvariant_zero` (simp): The tensor unit and the trivial S₀-action give W₀=E.
- `signedTensor_koszul` (compatibility): The transposition sign agrees with symmetry on complexes concentrated in degree n−1.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.5/stratumformula`: The diagonal configuration/tensor invariants carry the Koszul action.
- `ExponentialSumsAndCircleMethodPartII:GCM.6/minusone`: Column m has the m-th tensor eigenvalue.

**Discriminating tests:**

- **zero-tensor** (degenerate): m=0 yields E, not the zero vector space.
- **one-tensor** (computation): m=1 yields V.
- **parity** (computation): Over characteristic-zero coefficients, m=2 gives exterior-square invariants for n even and symmetric-square invariants for n odd; omitting sgn reverses this distinction.

### Explicit cohomology of each major-arc stratum

`ExponentialSumsAndCircleMethodPartII:GCM.5/stratumformula` · theorem · proof-plan

For 0≤m≤d and every integer a, H_c^a(A_m∖A_(m−1),S)≅(H_c^(a+m(n−1)−2nd)(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m)(−m−n(d−m)).

**Planet:** Major-stratum cohomology.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.5/stratumcomplex`, `ExponentialSumsAndCircleMethodPartII:GCM.5/hypersurfmiddle`.

**Construction/proof plan:**

1. Insert the middle-degree concentration into stratumcomplex.
2. Move the m factors of degree n−1 past one another, retaining their Koszul sign.
3. Compute cohomological degree and twist independently.

**Sources and matches:**

- BS20, §3, Corollary 3.12, p.920. For 0≤m≤d and every integer a, H_c^a(A_m∖A_(m−1),S)≅(H_c^(a+m(n−1)−2nd)(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m)(−m−n(d−m)).

**Check:** m=0 is supported only in degree 2nd. A transposition acts with sign (−1)^(n−1) on the shifted tensor factors.

<a id="gcm-6"></a>

## GCM.6. Universal pairs and monodromy parity

Construct the universal smooth polynomial/nonzero boundary-vector parameter space and its lisse middle cohomology extension. Prove the relevant fundamental-group surjections and specialize the companion universal-monodromy theorem to an element with eigenvalues −1, retaining the two cubic exceptions. Compute relative stratum cohomology for m≤d.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.5`, `EtaleDualityAndPerverseSheaves:EDC.4`, `LefschetzPencilsAndVanishingCycles:LPV.5`

### Universal smooth polynomial and boundary-point family

`ExponentialSumsAndCircleMethodPartII:GCM.6/universalpair` · definition · proof-plan

M_(n,k) is the open parameter scheme of pairs (f,x), where f has degree k, {f=0} is smooth, its leading hypersurface is smooth, and x∈A^n∖{0} lies on that leading cone. Construct the universal affine hypersurface, projective closure and boundary, together with maps h_n and h_(n−1) to the two smooth projective hypersurface parameter spaces. Keep x as a vector, including its scalar direction.

**Planet:** Universal hypersurface pair.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `ExponentialSumsAndCircleMethodPartII:GCM.3/rev-smooth-projective-closure-of-x`, `SchemeAndStackFoundations:SF.0`.

**Construction/proof plan:**

1. Use incidence equations f₀(x)=0 and the smoothness open conditions.
2. Construct homogenization and leading-form maps universally and verify smoothness of the two projective families.
3. Prove the parameter scheme is irreducible via the incidence bundle/open description.

**Sources and matches:**

- BS20, §4, p.922. M_(n,k) is the open parameter scheme of pairs (f,x), where f has degree k, {f=0} is smooth, its leading hypersurface is smooth, and x∈A^n∖{0} lies on that leading cone. Construct the universal affine hypersurface, projective closure and boundary, together with maps h_n and h_(n−1) to the two smooth projective hypersurface parameter spaces. Keep x as a vector, including its scalar direction.

**Check:** M_(n,k) is the open parameter scheme of pairs (f,x), where f has degree k, {f=0} is smooth, its leading hypersurface is smooth, and x∈A^n∖{0} lies on that leading cone. Construct the universal affine hypersurface, projective closure and boundary, together with maps h_n and h_(n−1) to the two smooth projective hypersurface parameter spaces. Keep x as a vector, including its scalar direction.

**Planning API:**

- `universalPairScheme` (constructor): Construct the incidence open M_(n,k) retaining the nonzero boundary vector.
- `universalPair_fibre` (universal-property): Its geometric fibres supply exactly the fixed f,x data used in the mapping construction.
- `universalPair_projectiveMaps` (projection): Construct h_n by homogenization and h_(n−1) by the leading form.
- `universalPair_baseChange` (functoriality): The incidence, smoothness opens and universal families commute with base change.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.6/primitiveextension`: Pulls back the two primitive local systems.
- `ExponentialSumsAndCircleMethodPartII:GCM.7/rev-relative-major-arc-spectral-sequence`: Supplies the base for monodromy-equivariant filtration.

**Discriminating tests:**

- **nonzero-vector** (non-example): x=0 is excluded even though every homogeneous form vanishes there.
- **scalar-fibre** (degenerate): Distinct nonzero scalar representatives remain distinct points of M; they are not quotiented to P^(n−1).
- **fermat-point** (computation): For ΣY_j^k−1 and x=(1,ζ,0,…), both smoothness opens and the incidence equation hold.

### Universal affine compact-cohomology support

`ExponentialSumsAndCircleMethodPartII:GCM.6/universalcohom` · theorem · proof-plan

For the universal affine hypersurface family over M_(n,k), the compact-support cohomology sheaves vanish outside degrees n−1 and 2(n−1), are lisse in those degrees, and the top sheaf is E(−(n−1)). This is the relative version with geometric stalks fixed by the preceding conventions.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.6/universalpair`, `ExponentialSumsAndCircleMethodPartII:GCM.5/middleconcentrated`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`, `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`.

**Construction/proof plan:**

1. Use the relative compactification and smooth proper base change on closure and boundary.
2. Apply their localization sequence and the fibrewise middle-concentration theorem; identify the top trace relatively.

**Sources and matches:**

- BS20, §4, Lemma 4.2(1),(3), pp.922–923; proof p.923. For the universal affine hypersurface family over M_(n,k), the compact-support cohomology sheaves vanish outside degrees n−1 and 2(n−1), are lisse in those degrees, and the top sheaf is E(−(n−1)). This is the relative version with geometric stalks fixed by the preceding conventions.

**Check:** The relative top trace has negative Tate exponent. Fibrewise dimension constancy alone is not a proof of lissity.

### Extension by boundary and projective primitives

`ExponentialSumsAndCircleMethodPartII:GCM.6/primitiveextension` · theorem · proof-plan

Let 𝒱=R^(n−1)π!E for the universal affine family. Put Prim(Z)=H^(n−2)(Z,E) modulo the middle hyperplane class when n−2 is even, and Prim(X̄)=H^(n−1)(X̄,E) modulo that class when n−1 is even; in odd middle degree use the whole middle group. Over E these quotients identify with the corresponding primitive kernels using the nonzero hypersurface degree. There is a short exact sequence 0→h_(n−1)*Prim(Z)→𝒱→h_n*Prim(X̄)→0. The boundary term has no extra Tate twist. No canonical splitting of this extension is asserted.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.6/universalcohom`, `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`.

**Construction/proof plan:**

1. Apply the localization sequence RΓ_c(X)→RΓ(X̄)→RΓ(Z) for the universal smooth pair.
2. Import the exact complete-intersection cohomology calculation: the cokernel in degree n−2 is the boundary primitive quotient and the kernel in degree n−1 is the projective primitive part. Identify the kernel with its primitive quotient over E by the nonzero hyperplane self-intersection; do not introduce a Gysin Tate twist into this restriction sequence.
3. Use proper smooth base change to make both primitive terms lisse and export the exact sequence of monodromy representations. The sequence itself need not split canonically.

**Sources and matches:**

- BS20, §4, Lemma 4.2(2), p.923; proof p.923. Lemma 4.2(2) uses the boundary primitive in degree n−2 and the homogenized primitive in degree n−1. The localization sequence fixes the absence of an extra twist; the parity-dependent quotient is now explicit.

**Check:** An eigenvalue statement for an extension does not make its action scalar. The even-dimensional hyperplane class must be removed before invoking primitive monodromy.

### Monodromy pullback along the universal pair maps

`ExponentialSumsAndCircleMethodPartII:GCM.6/fundamentalsurject` · theorem · proof-plan

For the parameter maps used in the two-factor monodromy argument, prove surjectivity on geometric étale fundamental groups by smoothness, connected geometric generic fibre and normal connected target. Verify each fibre description, including the nonzero vector/scalar factors, rather than importing a topological surjection.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.6/universalpair`, `SchemeAndStackFoundations:SF.2`, `LefschetzPencilsAndVanishingCycles:LPV.5`.

**Construction/proof plan:**

1. Describe the fibres of the relevant universal-pair parameter projections.
2. Apply the algebraic connected-generic-fibre fundamental-group criterion on the required open parameter spaces.

**Sources and matches:**

- BS20, §4, proof of Lemma 4.3, p.924. For the parameter maps used in the two-factor monodromy argument, prove surjectivity on geometric étale fundamental groups by smoothness, connected geometric generic fibre and normal connected target. Verify each fibre description, including the nonzero vector/scalar factors, rather than importing a topological surjection.

**Check:** The removed zero vector is not silently restored. The target must satisfy the normality hypothesis.

### A monodromy element with only eigenvalue minus one

`ExponentialSumsAndCircleMethodPartII:GCM.6/minusone` · theorem · companion-supplier-gap

For k≥3,n≥3 except (k,n)=(3,3),(3,4), the geometric monodromy of 𝒱 contains an element all of whose eigenvalues are −1. This need not act as −Id on the nonsplit primitive extension. Import the companion’s universal orthogonal/symplectic monodromy and closed algebraic-group Goursat result, with the small cubic cases retained as exceptions. Here geometric monodromy means the Zariski closure of the geometric fundamental-group image; membership in that closure is sufficient for equivariant maps.

**Planet:** Minus-one monodromy.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.6/primitiveextension`, `ExponentialSumsAndCircleMethodPartII:GCM.6/fundamentalsurject`, `LefschetzPencilsAndVanishingCycles:LPV.5`.

**Construction/proof plan:**

1. Use fundamentalsurject to obtain the two primitive monodromy images.
2. Apply the companion product-group argument with its exceptional low ranks, then lift to the extension.
3. Read off eigenvalues on the two graded pieces; no semisimplicity is inferred for the extension.

**Sources and matches:**

- BS20, §4, Lemma 4.3, p.923; proof pp.924–925. For k≥3,n≥3 except (k,n)=(3,3),(3,4), the geometric monodromy of 𝒱 contains an element all of whose eigenvalues are −1. This need not act as −Id on the nonsplit primitive extension. Import the companion’s universal orthogonal/symplectic monodromy and closed algebraic-group Goursat result, with the small cubic cases retained as exceptions.

**Check:** The two cubic exceptions are excluded even in a standalone proposition. A nontrivial Jordan extension may have only eigenvalue −1 without equalling −Id.

### Relative stratum formula and lissity

`ExponentialSumsAndCircleMethodPartII:GCM.6/relativestratum` · theorem · proof-plan

For 0≤m≤d the compact-support direct image of the m-th universal exact arc stratum is lisse in each degree and has the formula of stratumformula with V replaced by 𝒱. The configuration factor is constant and the entire expression is compatible with geometric stalks and monodromy.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.6/universalcohom`, `ExponentialSumsAndCircleMethodPartII:GCM.5/stratumformula`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Repeat each major-arc isomorphism relatively, including trace and CRT symmetry.
2. Use universalcohom and exact invariants to obtain lissity.

**Sources and matches:**

- BS20, §4, Lemma 4.4, p.925; proof pp.925–926. For 0≤m≤d the compact-support direct image of the m-th universal exact arc stratum is lisse in each degree and has the formula of stratumformula with V replaced by 𝒱. The configuration factor is constant and the entire expression is compatible with geometric stalks and monodromy.

**Check:** Require m≤d. Monodromy acts diagonally on all m copies of 𝒱.

<a id="gcm-7"></a>

## GCM.7. Finite arc filtration and the first page

Adapt the existing Mathlib spectral-object carrier to a finite localization filtration, including its abutment and functoriality. Construct absolute and relative major-arc spectral sequences, with differential degree (r,1−r). Derive odd-page vanishing from relative monodromy and give the normalized first page including every shift, Tate twist and symmetric-group sign.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.5`, `ExponentialSumsAndCircleMethodPartII:GCM.6`, `EtaleDualityAndPerverseSheaves:EDC.0`

### Finite localization filtration

`ExponentialSumsAndCircleMethodPartII:GCM.7/finite-localization-filtration` · construction · proof-plan

For a finite filtration Y_(−1)=∅⊂Y₀⊂⋯⊂Y_d=Y by closed subsets and a bounded constructible complex K, construct the compact-support spectral sequence E₁^(m,s)=H_c^(m+s)(Y_m∖Y_(m−1),K)⇒H_c^(m+s)(Y,K), with d_r of bidegree (r,1−r). Give its finite filtration on the abutment, naturality, coefficient extension and the relative sheaf version. Reuse Mathlib’s SpectralObject; the missing finite localization-to-spectral-object/abutment adapter is this target, not an assumed LI.3 theorem.

**Planet:** Finite localization spectral sequence.

**Dependencies:** `EtaleDualityAndPerverseSheaves:EDC.0`, `mathlib:CategoryTheory.Abelian.SpectralObject`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Apply localization triangles to complementary open steps and their relative pairs.
2. Construct the functorial spectral object in the existing carrier and identify its first page.
3. Finite length gives boundedness and identifies E∞ with associated graded abutment; check indexing against Stacks 12.24.2 and 12.24.13.

**Sources and matches:**

- STACKS, §12.24, Lemma 12.24.2, tag 012K; Lemma 12.24.13, tag 0BK5; BS20 Proposition 2.5 proof pp.921–922. For a finite filtration Y_(−1)=∅⊂Y₀⊂⋯⊂Y_d=Y by closed subsets and a bounded constructible complex K, construct the compact-support spectral sequence E₁^(m,s)=H_c^(m+s)(Y_m∖Y_(m−1),K)⇒H_c^(m+s)(Y,K), with d_r of bidegree (r,1−r). Give its finite filtration on the abutment, naturality, coefficient extension and the relative sheaf version. Reuse Mathlib’s SpectralObject; the missing finite localization-to-spectral-object/abutment adapter is this target, not an assumed LI.3 theorem.

**Check:** For a finite filtration Y_(−1)=∅⊂Y₀⊂⋯⊂Y_d=Y by closed subsets and a bounded constructible complex K, construct the compact-support spectral sequence E₁^(m,s)=H_c^(m+s)(Y_m∖Y_(m−1),K)⇒H_c^(m+s)(Y,K), with d_r of bidegree (r,1−r). Give its finite filtration on the abutment, naturality, coefficient extension and the relative sheaf version. Reuse Mathlib’s SpectralObject; the missing finite localization-to-spectral-object/abutment adapter is this target, not an assumed LI.3 theorem.

**Planning API:**

- `finiteLocalizationSpectralObject` (constructor): Construct a Mathlib spectral object from the finite localization triangles.
- `finiteLocalization_firstPage` (characterisation): E₁^(m,s)=H_c^(m+s)(Y_m∖Y_(m−1),K).
- `finiteLocalization_abutment` (structure): Identify E∞ with the associated graded of the finite filtration on H_c(Y,K).
- `finiteLocalization_naturality` (functoriality): Compatible maps of filtered spaces/complexes give maps on every page and on the abutment.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.7/majorE1`: Builds the absolute arc sequence.
- `ExponentialSumsAndCircleMethodPartII:GCM.7/rev-relative-major-arc-spectral-sequence`: Builds the family sequence before taking stalks.

**Discriminating tests:**

- **one-stage** (degenerate): A filtration with a single nonempty stratum has E₁=E∞ and the expected cohomology.
- **boundary-degree** (compatibility): For two stages the d₁ is the localization boundary with bidegree (1,0).
- **finite-not-first-quadrant** (non-example): Negative cohomological s is allowed; convergence follows from finite column length, not from a false first-quadrant assertion.

### Major-arc first page before the global shift

`ExponentialSumsAndCircleMethodPartII:GCM.7/majorE1` · theorem · proof-plan

For d≥k−1≥2 and n>2^k(k−1), filter A_d by its exact rank strata. The unnormalized spectral sequence has E₁^(m,s)=(H_c^(s+mn−2nd)(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m)(−m−n(d−m)) for 0≤m≤d, zero otherwise, and abuts to H_c^(m+s)(A_d,S).

**Planet:** Major-arc first page.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.7/finite-localization-filtration`, `ExponentialSumsAndCircleMethodPartII:GCM.5/stratumformula`.

**Construction/proof plan:**

1. Apply finite-localization-filtration and substitute stratumformula with a=m+s.
2. Check the m=0 column directly before normalizing.

**Sources and matches:**

- BS20, §2, Proposition 2.5(1)–(2), p.905; proof completed in §3, pp.921–922. For d≥k−1≥2 and n>2^k(k−1), filter A_d by its exact rank strata. The unnormalized spectral sequence has E₁^(m,s)=(H_c^(s+mn−2nd)(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m)(−m−n(d−m)) for 0≤m≤d, zero otherwise, and abuts to H_c^(m+s)(A_d,S).

**Check:** The unnormalized zero column is in total degree 2nd. There are d+1 columns, not infinitely many.

### Relative major-arc spectral sequence over the universal pair

`ExponentialSumsAndCircleMethodPartII:GCM.7/rev-relative-major-arc-spectral-sequence` · construction · proof-plan

The universal phase on M_(n,k)×A^(dn)×A^L gives a relative S and a finite arc-filtration spectral sequence of constructible sheaves on M_(n,k), whose geometric stalks equal majorE1. Its E₁ terms are the lisse sheaves in relativestratum. Every subsequent page is lisse and every differential commutes with geometric fundamental-group action.

**Planet:** Relative arc spectral sequence.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.6/universalpair`, `ExponentialSumsAndCircleMethodPartII:GCM.6/relativestratum`, `ExponentialSumsAndCircleMethodPartII:GCM.7/finite-localization-filtration`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Use relative compact-support base change for the universal phase.
2. Apply the relative finite filtration. Kernels and cokernels of maps of lisse E-sheaves remain lisse.
3. Identify stalk sequences before applying monodromy.

**Sources and matches:**

- BS20, §4, p.922 (relative S_{d,f}, pr_{M,m}) and proof of Proposition 4.1, pp.926–927. The universal phase on M_(n,k)×A^(dn)×A^L gives a relative S and a finite arc-filtration spectral sequence of constructible sheaves on M_(n,k), whose geometric stalks equal majorE1. Its E₁ terms are the lisse sheaves in relativestratum. Every subsequent page is lisse and every differential commutes with geometric fundamental-group action.

**Check:** The universal phase on M_(n,k)×A^(dn)×A^L gives a relative S and a finite arc-filtration spectral sequence of constructible sheaves on M_(n,k), whose geometric stalks equal majorE1. Its E₁ terms are the lisse sheaves in relativestratum. Every subsequent page is lisse and every differential commutes with geometric fundamental-group action.

**Planning API:**

- `relativeArcSequence` (constructor): Apply the relative compact-support filtration over M_(n,k).
- `relativeArcSequence_stalk` (compatibility): Every geometric stalk is the absolute arc spectral sequence with the same indices.
- `relativeArcSequence_equivariant` (structure): Differentials are equivariant for the geometric fundamental group and its Zariski monodromy closure.
- `relativeArcSequence_lisse` (characterisation): All pages are kernels/cokernels in the category of lisse E-sheaves.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.7/oddpages`: Equivariance rules out maps between opposite generalized eigenvalues.

**Discriminating tests:**

- **geometric-fibre** (compatibility): At a Fermat parameter point the first page equals the fixed-fibre stratum formula.
- **zero-column** (computation): The m=0 term is the constant E[−2nd](−nd) before normalization.
- **odd-map** (non-example): An equivariant odd-page differential between sole eigenvalues +1 and −1 must vanish; lissity alone would not imply this.

### Odd-page differential vanishing in the verified parameter range

`ExponentialSumsAndCircleMethodPartII:GCM.7/oddpages` · theorem · proof-plan

Under the main finite-field hypotheses p>k, even order of ℓ mod p, and outside the two small cubic monodromy exceptions, every d_r with r odd is zero. The element of minusone has sole generalized eigenvalue (−1)^m on column m, whereas an odd-r target has the opposite eigenvalue.

**Planet:** Odd-page vanishing.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.6/minusone`, `ExponentialSumsAndCircleMethodPartII:GCM.7/rev-relative-major-arc-spectral-sequence`.

**Construction/proof plan:**

1. Apply minusone to the relative spectral sequence, then take geometric stalks.
2. The generalized eigenspaces with eigenvalues 1 and −1 admit no nonzero equivariant map over E.
3. Propagate the column eigenvalue property to subquotients on subsequent pages.

**Sources and matches:**

- BS20, §4, Proposition 4.1, p.922, proof pp.926–927; §2, Proposition 2.5(3), p.905. Under the main finite-field hypotheses p>k, even order of ℓ mod p, and outside the two small cubic monodromy exceptions, every d_r with r odd is zero. The element of minusone has sole generalized eigenvalue (−1)^m on column m, whereas an odd-r target has the opposite eigenvalue.

**Check:** Odd-page vanishing alone says nothing about d₂. The main n-range excludes the small cubic cases automatically; the standalone theorem must still list them.

### Shifted finite-field E1 formula

`ExponentialSumsAndCircleMethodPartII:GCM.7/shiftE1` · theorem · proof-plan

After shifting the abutment by [2dn] and twisting by (L), E₁^(m,s)=(H_c^(s+mn)(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m)(L−m−n(d−m)), 0≤m≤d, and zero otherwise. It abuts to H_c^(m+s+2dn)(A_d,S)(L), with differential degree (r,1−r) and odd differentials zero under oddpages.

**Planet:** Normalized circle-method first page.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.7/majorE1`, `ExponentialSumsAndCircleMethodPartII:GCM.7/oddpages`.

**Construction/proof plan:**

1. Reindex majorE1 by s↦s+2dn and add the same Tate twist L to every term.
2. Keep the major-arc abutment separate from the mapping-scheme comparison, which requires a minor-arc bound.

**Sources and matches:**

- BS20, §2, Theorem 2.7(1),(2), pp. 905–906. After shifting the abutment by [2dn] and twisting by (L), E₁^(m,s)=(H_c^(s+mn)(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m)(L−m−n(d−m)), 0≤m≤d, and zero otherwise. It abuts to H_c^(m+s+2dn)(A_d,S)(L), with differential degree (r,1−r) and odd differentials zero under oddpages.

**Check:** At (m,s)=(0,0) the term is E(−D). At m=1 the configuration exponent is s+n.

<a id="gcm-8"></a>

## GCM.8. Geometric Weyl differencing

Define k-indexed differencing loci and extended cohomological degree. Use coefficient-field conjugation, Künneth, finite-type fibre-dimension strata and detection at all closed points to prove the geometric Weyl inequality. Retain k as data when the actual polynomial degree drops, and retain minus infinity for acyclic complexes.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.0`, `ExponentialSumsAndCircleMethodPartII:GCM.2`, `ExponentialSumsAndCircleMethodPartII:GCM.3`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `FiniteFieldsAndCharacterSums:FF.2`

### Finite-difference constancy locus with an explicit order

`ExponentialSumsAndCircleMethodPartII:GCM.8/difference` · definition · proof-plan

For G∈F_q[a₁,…,a_N] and an integer k≥1 with deg G≤k, define V_k(G)⊂(A^N)^(k−1) by requiring Δ_(y₁)⋯Δ_(y_(k−1))G(a) to be independent of a, where Δ_yG(a)=G(a)−G(a+y). Define dd_k(G)=dim V_k(G), with empty locus dimension −∞. Keep k as a parameter even for a specialization of smaller actual degree.

**Planet:** Geometric differencing locus.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/phase`, `SchemeAndStackFoundations:SF.0`.

**Construction/proof plan:**

1. Expand the iterated finite difference; its a-dependent coefficients are polynomial equations in the y-variables.
2. For k=1 there are no y-variables, so V₁ is a point for constant G and empty for a nonconstant linear G.

**Sources and matches:**

- BS20, §5, Definition 5.1 and (5.1), p. 927. For G∈F_q[a₁,…,a_N] and an integer k≥1 with deg G≤k, define V_k(G)⊂(A^N)^(k−1) by requiring Δ_(y₁)⋯Δ_(y_(k−1))G(a) to be independent of a, where Δ_yG(a)=G(a)−G(a+y). Define dd_k(G)=dim V_k(G), with empty locus dimension −∞. Keep k as a parameter even for a specialization of smaller actual degree.

**Check:** For G∈F_q[a₁,…,a_N] and an integer k≥1 with deg G≤k, define V_k(G)⊂(A^N)^(k−1) by requiring Δ_(y₁)⋯Δ_(y_(k−1))G(a) to be independent of a, where Δ_yG(a)=G(a)−G(a+y). Define dd_k(G)=dim V_k(G), with empty locus dimension −∞. Keep k as a parameter even for a specialization of smaller actual degree.

**Planning API:**

- `differenceLocus` (constructor): Define the closed locus by the a-dependent coefficients of the (k−1)-fold difference.
- `differenceLocus_mem` (characterisation): Membership is equivalent to independence of the original a-variables.
- `differencingDimension` (projection): Return the extended dimension with empty value −∞.
- `differenceLocus_specialization` (compatibility): Base change retains k, even when the actual polynomial degree falls.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.8/cohweyl`: Its fibres are the k−1-indexed loci for first differences.
- `ExponentialSumsAndCircleMethodPartII:GCM.9/ddminor`: Polarization identifies the equations of the phase differencing locus.

**Discriminating tests:**

- **linear-start** (degenerate): For k=1, a constant has a point as locus; a nonconstant linear form has the empty locus.
- **quadratic-index-two** (computation): In characteristic ≠2, G=a₁² and k=2 gives y₁=0, hence dimension N−1.
- **quadratic-index-three** (computation): For the same G and k=3 all pairs of y lie in the locus, giving dimension 2N; k cannot be recomputed from actual degree.

### Exponential compact-cohomological degree

`ExponentialSumsAndCircleMethodPartII:GCM.8/cohdegree` · definition · proof-plan

For a polynomial G on A^N over F_q define cd_ψ(G)=sup{i∈Z : H_c^i(A^N_(F̄_q),L_ψ(G))≠0}, taking −∞ when the complex is acyclic. This extended degree is invariant under finite coefficient extension and polynomial coordinate isomorphism. All maxima and addition involving −∞ use extended-integer conventions.

**Planet:** Cohomological degree.

**Dependencies:** `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/character-sheaf-cohomology-vanishes`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`, `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`.

**Construction/proof plan:**

1. Use finite cohomological amplitude of the existing compact-support functor.
2. Define support degree from its actual cohomology objects, not from exponential-sum size.

**Sources and matches:**

- BS20, §5, Definition 5.2, p. 928; used in the proof of Proposition 5.5, pp. 930–932. For a polynomial G on A^N over F_q define cd_ψ(G)=sup{i∈Z : H_c^i(A^N_(F̄_q),L_ψ(G))≠0}, taking −∞ when the complex is acyclic. This extended degree is invariant under finite coefficient extension and polynomial coordinate isomorphism. All maxima and addition involving −∞ use extended-integer conventions.

**Check:** For a polynomial G on A^N over F_q define cd_ψ(G)=sup{i∈Z : H_c^i(A^N_(F̄_q),L_ψ(G))≠0}, taking −∞ when the complex is acyclic. This extended degree is invariant under finite coefficient extension and polynomial coordinate isomorphism. All maxima and addition involving −∞ use extended-integer conventions.

**Planning API:**

- `cohomologicalDegree` (constructor): Take the maximum nonzero compact-support cohomology degree or −∞ if none.
- `cohomologicalDegree_eq_bot` (characterisation): The degree is −∞ exactly when the exponential complex is acyclic.
- `cohomologicalDegree_coeffExtension` (compatibility): A finite field extension of E leaves the degree unchanged.
- `cohomologicalDegree_coordinateIso` (functoriality): Polynomial coordinate isomorphisms preserve the degree.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.8/differencekun`: Künneth adds extended degrees.
- `ExponentialSumsAndCircleMethodPartII:GCM.9/stalkminor`: Turns the Weyl inequality into a sheaf-cohomology bound.

**Discriminating tests:**

- **constant-phase** (computation): A constant polynomial on A^N has degree 2N geometrically.
- **linear-phase** (non-example): A nonzero linear polynomial has degree −∞, not zero.
- **artin-schreier-trivial** (compatibility): For G=H^p−H the Artin–Schreier sheaf is geometrically constant and has degree 2N, despite G possibly being nonconstant.

### Sign reversal by coefficient conjugation

`ExponentialSumsAndCircleMethodPartII:GCM.8/signconjugacy` · theorem · proof-plan

If ℓ has even multiplicative order modulo p, then cd_ψ(G)=cd_ψ(−G). More precisely, an automorphism of E=Q_ℓ(μ_p) sends every p-th root of unity to its inverse and yields semilinear isomorphisms on all relevant compact-support cohomology groups.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.8/cohdegree`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. In the cyclic subgroup generated by ℓ mod p, the half-order power is −1.
2. Use the corresponding unramified coefficient-field automorphism and compatibility of compact cohomology with coefficient change.

**Sources and matches:**

- BS20, §5, Lemma 5.3 and proof, pp. 928–929. If ℓ has even multiplicative order modulo p, then cd_ψ(G)=cd_ψ(−G). More precisely, an automorphism of E=Q_ℓ(μ_p) sends every p-th root of unity to its inverse and yields semilinear isomorphisms on all relevant compact-support cohomology groups.

**Check:** This is semilinear over E, not a canonical E-linear self-map. Odd order does not give the required inversion.

### Tensor-product and difference identities for cohomological degree

`ExponentialSumsAndCircleMethodPartII:GCM.8/differencekun` · theorem · proof-plan

With N variables in each block, cd_ψ(G)+cd_ψ(−G)=cd_ψ(G(a)−G(b))=cd_ψ(G(a)−G(a+y)). The last equality is induced by the polynomial coordinate isomorphism (a,y)↦(a,a+y); the first uses derived Künneth and is valid also when one complex is acyclic.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.8/cohdegree`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Tensor the two compact-support complexes using the additive-character product formula.
2. Nonzero top cohomology tensors to a nonzero vector space over E; handle the acyclic case separately.
3. Change variables by an actual affine automorphism.

**Sources and matches:**

- BS20, §5, Lemma 5.4 and proof, p. 929. With N variables in each block, cd_ψ(G)+cd_ψ(−G)=cd_ψ(G(a)−G(b))=cd_ψ(G(a)−G(a+y)). The last equality is induced by the polynomial coordinate isomorphism (a,y)↦(a,a+y); the first uses derived Künneth and is valid also when one complex is acyclic.

**Check:** Do not replace extended addition with a natural-number maximum. No Jacobian or measure normalization is involved.

### Closed points detect constructible supports over a finite field

`ExponentialSumsAndCircleMethodPartII:GCM.8/rev-closed-points-detect-constructible-supports` · theorem · proof-plan

For a bounded constructible E-complex K on a finite-type F_q-scheme, if the geometric stalk of H^i(K) vanishes at every F_(q^r)-point for every r≥1, then H^i(K)=0. A finite constructible stratification of its support reduces this to the existence of a closed point in every nonempty locally closed subset of a Jacobson space.

**Dependencies:** `EtaleDualityAndPerverseSheaves:EDC.0`, `mathlib:nonempty_inter_closedPoints`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Import the pinned Jacobson and locally closed closed-point lemmas.
2. Request constructibility of the support from the constructible coefficient owner.
3. A closed point has a finite residue-field extension of F_q; it need not be F_q-rational.

**Sources and matches:**

- BS20, §5, proof of Proposition 5.8, p. 934, and the proof of Proposition 5.5, p. 931. For a bounded constructible E-complex K on a finite-type F_q-scheme, if the geometric stalk of H^i(K) vanishes at every F_(q^r)-point for every r≥1, then H^i(K)=0. A finite constructible stratification of its support reduces this to the existence of a closed point in every nonempty locally closed subset of a Jacobson space.

**Check:** Vanishing only at F_q-points is insufficient. An empty constructible support has zero sheaf. No topological result alone establishes constructibility of a sheaf support.

### Geometric Weyl-differencing bound

`ExponentialSumsAndCircleMethodPartII:GCM.8/cohweyl` · theorem · proof-plan

For deg G≤k, k≥2, p>k, and ℓ of even order modulo p, cd_ψ(G)≤[dd_k(G)+N(2^(k−1)−(k−1))]/2^(k−2). For k=1 use cd≤2N for a constant polynomial and cd=−∞ for a nonconstant linear polynomial; this agrees with the same formula interpreted rationally. An empty differencing locus yields the acyclic conclusion.

**Planet:** Geometric Weyl inequality.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.8/difference`, `ExponentialSumsAndCircleMethodPartII:GCM.8/signconjugacy`, `ExponentialSumsAndCircleMethodPartII:GCM.8/differencekun`, `ExponentialSumsAndCircleMethodPartII:GCM.0/rev-fibre-dimension-stratification`, `ExponentialSumsAndCircleMethodPartII:GCM.8/rev-closed-points-detect-constructible-supports`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`, `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`.

**Construction/proof plan:**

1. Apply signconjugacy and differencekun to express twice the degree via G(a)−G(a+y).
2. Stratify the y-space by the dimension of the fibre of V_k(G); keep the induction index k−1 when the actual degree drops.
3. Use fibrewise induction, the support bound 2 dim W on a stratum W and closed-point detection.
4. Optimize over the stratum dimension between 0 and N to obtain the displayed bound.

**Sources and matches:**

- BS20, §5, Proposition 5.5, p. 930; proof pp. 930–932. For deg G≤k, k≥2, p>k, and ℓ of even order modulo p, cd_ψ(G)≤[dd_k(G)+N(2^(k−1)−(k−1))]/2^(k−2). For k=1 use cd≤2N for a constant polynomial and cd=−∞ for a nonconstant linear polynomial; this agrees with the same formula interpreted rationally. An empty differencing locus yields the acyclic conclusion.

**Check:** For constant G, dd_k=N(k−1) and the right side is 2N. For G=a₁² and k=3 the third-degree parameter remains 3; replacing it by the actual degree invalidates induction. Every empty fibre contributes −∞ rather than zero.

<a id="gcm-9"></a>

## GCM.9. Minor arcs with a controlled remainder

Import the parent ES.0–1 polarization, shrinking and all-extension polynomial count. Deduce differencing-dimension and stalk bounds, cover the minor arcs through ceil(kd/2)−1, and retain the remainder in division by k−1. Prove conservative vanishing above 2dn+4(k−1)−4 floor(d/(k−1))(n/2^k−k+1). Keep the printed +4 bound as an open target.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.1`, `ExponentialSumsAndCircleMethodPartII:GCM.4`, `ExponentialSumsAndCircleMethodPartII:GCM.8`, `ExponentialSumsAndCircleMethod:ES.0`, `ExponentialSumsAndCircleMethod:ES.1`, `FiniteFieldsAndCharacterSums:FF.2`

### Differencing-dimension bound outside a rank arc

`ExponentialSumsAndCircleMethodPartII:GCM.9/ddminor` · theorem · proof-plan

Let d≥k−1≥2, d≤m≤kd/2, p>k, and suppose f₀ defines a smooth projective hypersurface. For b∉A_m^L the phase polynomial G_b in dn coefficient variables satisfies dd_k(G_b)≤dn(k−1)−n floor(m/(k−1)).

**Planet:** Minor-arc differencing dimension.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.8/difference`, `ExponentialSumsAndCircleMethodPartII:GCM.3/phase`, `ExponentialSumsAndCircleMethod:ES.0/polar-forms`, `ExponentialSumsAndCircleMethod:ES.0/multivariate-polarization`, `ExponentialSumsAndCircleMethod:ES.0/polar-zero-locus`, `ExponentialSumsAndCircleMethod:ES.0/polar-dimension-bound`, `ExponentialSumsAndCircleMethod:ES.0/iterated-function-field-shrinking`, `ExponentialSumsAndCircleMethod:ES.0/short-polar-values-zero`, `ExponentialSumsAndCircleMethod:ES.1/function-field-top-phase`, `ExponentialSumsAndCircleMethod:ES.1/function-field-polar-count`, `ExponentialSumsAndCircleMethod:ES.1/function-field-count-identity`, `ExponentialSumsAndCircleMethod:ES.1/uniform-function-field-minor-count`, `FiniteFieldsAndCharacterSums:FF.2/dimension-from-point-counts`.

**Construction/proof plan:**

1. Import the exact top-phase polarization and all-extension count from ES.0–1; do not identify the entire phase with its degree-k part.
2. Use the count bound over every extension F_(q^r), with a constant independent of r, and the requested Lang–Weil dimension criterion.
3. Transfer the resulting dimension estimate to the k-indexed differencing locus.

**Sources and matches:**

- BS20, §5, Proposition 5.7, p. 933; proof completed in §6 after Proposition 6.2, p. 937. Let d≥k−1≥2, d≤m≤kd/2, p>k, and suppose f₀ defines a smooth projective hypersurface. For b∉A_m^L the phase polynomial G_b in dn coefficient variables satisfies dd_k(G_b)≤dn(k−1)−n floor(m/(k−1)).

**Check:** The imported constant depends only on (d,k,n), not the extension degree. The parent’s geometric polar bound must import GCM.0; the parent’s polynomial count must import GCM.1, with no late-stage edge.

### Stalk cohomology supported on a major arc

`ExponentialSumsAndCircleMethodPartII:GCM.9/stalkminor` · theorem · proof-plan

Under d≥k−1≥2, p>k, smooth f₀ and even order of ℓ mod p, for m≥d the sheaf H^a(S) on A^L∖A_m is zero whenever a>n(2d−floor(m/(k−1))/2^(k−2)). For m≥ceil(L/2) the open set is empty.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.9/ddminor`, `ExponentialSumsAndCircleMethodPartII:GCM.8/cohweyl`, `ExponentialSumsAndCircleMethodPartII:GCM.3/fouriercomplex`, `ExponentialSumsAndCircleMethodPartII:GCM.4/arcsfull`, `ExponentialSumsAndCircleMethodPartII:GCM.8/rev-closed-points-detect-constructible-supports`.

**Construction/proof plan:**

1. For d≤m<L/2 combine ddminor, cohweyl and the geometric-stalk formula.
2. Apply the argument over every finite extension and use closed-point detection.
3. Treat the saturated full-arc case separately.

**Sources and matches:**

- BS20, §5, Proposition 5.8 and proof, pp. 933–934. Under d≥k−1≥2, p>k, smooth f₀ and even order of ℓ mod p, for m≥d the sheaf H^a(S) on A^L∖A_m is zero whenever a>n(2d−floor(m/(k−1))/2^(k−2)). For m≥ceil(L/2) the open set is empty.

**Check:** The inequality is strict in the cohomological degree. The last odd-L stratum lies below L/2 and is covered by the estimate.

### Correct finite stratification of the minor arcs

`ExponentialSumsAndCircleMethodPartII:GCM.9/minorcover` · theorem · proof-plan

For L=kd and d≥k−1≥2, A^L∖A_d is the disjoint union of A_(m+1)∖A_m over d≤m≤ceil(L/2)−1. The ceiling is required at odd L.

**Planet:** Complete minor-arc cover.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.4/arcsclosed`, `ExponentialSumsAndCircleMethodPartII:GCM.4/arcsfull`.

**Construction/proof plan:**

1. Telescope the nested closed filtration up to its first guaranteed full stage.
2. Test the top missing stratum at L=9 rather than assuming floor(L/2) is full.

**Sources and matches:**

- BS20, §5, proof of Proposition 2.6 (end of §5), p. 934; corrected (print has m_0 = ⌊kd/2⌋ − 1; E1). For L=kd and d≥k−1≥2, A^L∖A_d is the disjoint union of A_(m+1)∖A_m over d≤m≤ceil(L/2)−1. The ceiling is required at odd L.

**Check:** For L=9 the cover includes m=4. For L=12 it ends at m=5.

### Conservative minor-arc vanishing with rounding retained

`ExponentialSumsAndCircleMethodPartII:GCM.9/minorsafe` · theorem · proof-plan

Write t=floor(d/(k−1)), δ=n/2^k−k+1>0. Under the main finite-field hypotheses, H_c^a(A^L∖A_d,S)=0 for a>2dn+4(k−1)−4tδ. This is the conservative bound supported by the corrected stratification argument.

**Planet:** Conservative minor-arc vanishing.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.9/stalkminor`, `ExponentialSumsAndCircleMethodPartII:GCM.4/goodarciso`, `ExponentialSumsAndCircleMethodPartII:GCM.9/minorcover`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`, `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`.

**Construction/proof plan:**

1. On the m-th minor stratum add its dimension bound 2 dim≤4(m+1) to stalkminor. If m+1≤L/2 use goodarciso. At the last odd-L stratum m+1=ceil(L/2), instead use ambient dimension L≤2(m+1).
2. Write m=(k−1)q+r, 0≤r≤k−2. The resulting bound is B(m)=2dn−4qδ+4(r+1).
3. Since q≥t and δ>0, B(m)≤2dn−4tδ+4(k−1). Apply finite excision over minorcover.

**Sources and matches:**

- BS20, §2, Proposition 2.6, p. 905; proof at the end of §5, p. 934; conservative repair. Write t=floor(d/(k−1)), δ=n/2^k−k+1>0. Under the main finite-field hypotheses, H_c^a(A^L∖A_d,S)=0 for a>2dn+4(k−1)−4tδ. This is the conservative bound supported by the corrected stratification argument.

**Check:** Keep the remainder term 4(r+1). For k=3,d=4,n=24, B(5)=192 while the printed sharper cutoff is 188. At equality with the conservative cutoff the proof gives no vanishing.

### Unclosed sharp minor-arc target

`ExponentialSumsAndCircleMethodPartII:GCM.9/minorsharpgate` · theorem · open-sharp-bound

Open target: strengthen minorsafe to H_c^a(A^L∖A_d,S)=0 for a>2dn+4−4tδ. The published substitution that drops the remainder does not prove this; a new geometric estimate or another proof is required. The target is not an axiom or an established vanishing theorem.

**Planet:** Sharp minor-arc target.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.9/minorsafe`.

**Construction/proof plan:**

1. Identify the remainder term in B(m) and retain the corrected odd-L cover.
2. Seek an improvement beyond the separate stratum dimension and stalk bounds; a numerical monotonicity assertion cannot supply it.

**Sources and matches:**

- BS20, §2, Proposition 2.6, p. 905; printed proof p. 934. Open target: strengthen minorsafe to H_c^a(A^L∖A_d,S)=0 for a>2dn+4−4tδ. The published substitution that drops the remainder does not prove this; a new geometric estimate or another proof is required. The target is not an axiom or an established vanishing theorem.

**Check:** A table of numerical cutoffs is not a proof of vanishing. No conservative theorem may cite this node as a proved input.

<a id="gcm-10"></a>

## GCM.10. Comparison, spreading and irreducible mapping schemes

Compare the normalized major-arc complex with mapping cohomology in the conservative strict range. Spread the entire pair (f,x), retaining prescribed admissible coefficients and choosing a good closed fibre with a common lisse open. Compute first-page and abutment support, the automatic high-degree degeneration range, and irreducibility when tδ>k−1. Record the sharper printed range and unconditional E1 degeneration as distinct unproved targets.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.2`, `ExponentialSumsAndCircleMethodPartII:GCM.3`, `ExponentialSumsAndCircleMethodPartII:GCM.7`, `ExponentialSumsAndCircleMethodPartII:GCM.9`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.6`, `SchemeAndStackFoundations:SF.0`, `AlgebraicTopologyPartII:AT2.2`

### Spreading out the pair and cohomology

`ExponentialSumsAndCircleMethodPartII:GCM.10/spread` · construction · proof-plan

For a general field K of characteristic zero or >k, spread f and its fixed nonzero vector x to an integral finitely generated subring R⊂K. After localization preserve degree, x≠0 and both smoothness conditions; choose a common lisse open for the finitely many compact-cohomology sheaves and maps in the finite filtration. In characteristic zero, for a prescribed ℓ choose a good closed finite-field fibre with p>k and even order of ℓ modulo p. In characteristic p>k retain any prescribed admissible ℓ; choosing a new ℓ is allowed only for a coefficient-independent geometric conclusion. Transport ranks, signs and spectral-sequence maps by specialization. Spec K lies over the generic point of Spec R and need not be that point.

**Planet:** Spreading the full pair.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.2/fix-coefficient-prime-for-fixed-characteristic`, `ExponentialSumsAndCircleMethodPartII:GCM.2/fix-good-characteristic-for-fixed-coefficient-prime`, `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `SchemeAndStackFoundations:SF.0/spreading-out-models`, `SchemeAndStackFoundations:SF.0/generic-fibre-spreading`.

**Construction/proof plan:**

1. Include every coordinate of x in R and invert a chosen nonzero coordinate.
2. Use constructibility and generic lissity for all complexes and maps in the finite filtration, not just a single cohomology group.
3. In characteristic zero use the fixed-ℓ good-characteristic adapter, together with constructibility of the nonempty generic image over Spec Z, to obtain closed points over all sufficiently large primes. In positive characteristic retain admissible ℓ; use the fixed-p coefficient-prime adapter only if the conclusion permits choosing ℓ.
4. Only noncanonical vector-space comparisons are asserted over general K. Frobenius equivariance belongs to the finite-field version.

**Sources and matches:**

- BS20, §2, spreading-out paragraph after the proof of Theorem 2.7 (the proof of Theorem 1.1), pp. 906–907. The source spreads the finite-field construction. The local adapter explicitly spreads the full pair and keeps a prescribed admissible coefficient prime, separating that issue from coefficient-independent irreducibility.

**Check:** The model includes the actual vector, not just its projective line or the coefficients of f. For a statement with prescribed coefficients in positive characteristic, the coefficient prime is retained. Comparisons over general K are noncanonical vector-space comparisons; finite-field Frobenius equivariance is asserted only where constructed.

**Planning API:**

- `spreadPair` (constructor): Choose an integral finitely generated model containing both f coefficients and x coordinates.
- `spreadPair_goodOpen` (structure): Localize to preserve degree, x≠0 and the two smoothness hypotheses.
- `spreadPair_commonLisseOpen` (compatibility): Restrict to a common open for all finitely many complexes and maps used in comparison.
- `spreadPair_goodClosedFibre` (constructor): Choose a closed finite-field fibre satisfying the residue/coefficient prime conditions.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.10/comparisonsafe`: Transfers the finite-field construction to general K without claiming canonical Galois equivariance.

**Discriminating tests:**

- **transcendental-vector** (non-example): If x has a coordinate transcendental over the coefficient ring of f, that ring alone is not a model of the pair.
- **nonzero-after-reduction** (degenerate): Invert a nonzero coordinate before choosing a closed point, so the boundary vector cannot specialize to zero.
- **prime-quantifiers** (compatibility): Holding ℓ fixed uses the good-residue-characteristic adapter; holding p fixed uses the coefficient-prime adapter.

### Conservative cohomology comparison range

`ExponentialSumsAndCircleMethodPartII:GCM.10/comparisonsafe` · theorem · proof-plan

Let d≥k−1≥2, n>2^k(k−1), X and its leading boundary be smooth, and D=d(n−k), t=floor(d/(k−1)), δ=n/2^k−k+1. In finite characteristic require p>k and ℓ of even order mod p. The normalized major-arc abutment in total degree i identifies with H_c^(i+2D)(Mor,E) for i>−4(tδ−(k−1)). Over finite fields the comparison is Frobenius-equivariant; over general K use spread and assert an E-vector-space spectral sequence without a canonical Galois comparison.

**Planet:** Conservative cohomology comparison.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.7/shiftE1`, `ExponentialSumsAndCircleMethodPartII:GCM.9/minorsafe`, `ExponentialSumsAndCircleMethodPartII:GCM.3/orthogonality`, `ExponentialSumsAndCircleMethodPartII:GCM.10/spread`.

**Construction/proof plan:**

1. For U=A^L∖A_d, the compact-support triangle is RΓ_c(U,S)→RΓ_c(A^L,S)→RΓ_c(A_d,S)→RΓ_c(U,S)[1]. At degree j use vanishing of H_c^j(U,S) and H_c^(j+1)(U,S); both follow from the strict minor cutoff j>2dn+4(k−1)−4tδ.
2. Apply orthogonality and the [2dn](L) normalization, noting 2dn−2L=2D.
3. Use spread for the general-field endpoint; do not silently descend the Artin–Schreier sheaf to Q_ℓ.

**Sources and matches:**

- BS20, §2, Theorem 2.7(3) and proof, p. 906; §1, Theorem 1.1, p. 894; conservative repaired range. Let d≥k−1≥2, n>2^k(k−1), X and its leading boundary be smooth, and D=d(n−k), t=floor(d/(k−1)), δ=n/2^k−k+1. In finite characteristic require p>k and ℓ of even order mod p. The normalized major-arc abutment in total degree i identifies with H_c^(i+2D)(Mor,E) for i>−4(tδ−(k−1)). Over finite fields the comparison is Frobenius-equivariant; over general K use spread and assert an E-vector-space spectral sequence without a canonical Galois comparison.

**Check:** The comparison range is strict. At k=3,d=2,n=40 it is i>−4. Tate twists are retained over finite fields; dimension statements alone do not recover Frobenius.

### Original sharp comparison target, explicitly gated

`ExponentialSumsAndCircleMethodPartII:GCM.10/comparisonsharpgate` · theorem · conditional-on-sharp-bound

Conditional target: if minorsharpgate is proved with the required localization comparison in adjacent degrees, replace the conservative range by i>−4(tδ−1). This is the range printed in Theorem 1.1, not a consequence of the current conservative proof.

**Planet:** Sharp comparison target.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.10/comparisonsafe`, `ExponentialSumsAndCircleMethodPartII:GCM.9/minorsharpgate`.

**Construction/proof plan:**

1. Repeat comparisonsafe with the improved minor cutoff.
2. Keep the improvement as an explicit hypothesis until G3 is solved.

**Sources and matches:**

- BS20, §1, Theorem 1.1, p. 894; §2, Theorem 2.7(3) and (2.3), p. 906. Conditional target: if minorsharpgate is proved with the required localization comparison in adjacent degrees, replace the conservative range by i>−4(tδ−1). This is the range printed in Theorem 1.1, not a consequence of the current conservative proof.

**Check:** Conditional target: if minorsharpgate is proved with the required localization comparison in adjacent degrees, replace the conservative range by i>−4(tδ−1). This is the range printed in Theorem 1.1, not a consequence of the current conservative proof.

### E1 support region

`ExponentialSumsAndCircleMethodPartII:GCM.10/E1support` · theorem · proof-plan

The normalized first page can be nonzero only at (m,s)=(0,0), or at 1≤m≤d with −m(n−1)+1≤s≤−m(n−2). The configuration input is H_c^a(PConf_m)=0 outside m+1≤a≤2m for m≥1.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.7/shiftE1`, `AlgebraicTopologyPartII:AT2.2/arrangement-cohomology`.

**Construction/proof plan:**

1. Import the companion’s configuration cohomology range, including the translation factor A¹.
2. Insert a=s+mn into shiftE1.

**Sources and matches:**

- BS20, §2, Lemma 2.8, p. 907; also (1.3), p. 895. The normalized first page can be nonzero only at (m,s)=(0,0), or at 1≤m≤d with −m(n−1)+1≤s≤−m(n−2). The configuration input is H_c^a(PConf_m)=0 outside m+1≤a≤2m for m≥1.

**Check:** For m=1 the only configuration degree is 2. PConf_m has dimension m; its translation quotient has dimension m−1.

### Compact cohomology vanishing bands

`ExponentialSumsAndCircleMethodPartII:GCM.10/cohsupport` · theorem · proof-plan

Within the conservative comparison range, H_c^(i+2D)(Mor,E) can be nonzero only if i=0 or for some 1≤m≤d, 1−m(n−2)≤i≤−m(n−3). In particular it vanishes for i>0 in that range.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.10/comparisonsafe`, `ExponentialSumsAndCircleMethodPartII:GCM.10/E1support`.

**Construction/proof plan:**

1. Add m to the two bounds in E1support.
2. A finite spectral sequence cannot create support outside the union of its first-page total degrees.
3. Use comparisonsafe only inside its stated range.

**Sources and matches:**

- BS20, §1, Corollary 1.2, p. 895; repaired range. Within the conservative comparison range, H_c^(i+2D)(Mor,E) can be nonzero only if i=0 or for some 1≤m≤d, 1−m(n−2)≤i≤−m(n−3). In particular it vanishes for i>0 in that range.

**Check:** The support statement does not automatically extend to the printed sharper range. For n=40 the total degree −1 lies in none of the bands.

### Automatic E1 degeneration near the top

`ExponentialSumsAndCircleMethodPartII:GCM.10/topdegeneration` · theorem · proof-plan

For m+s>1−2(n−2)(n−3), the major-arc spectral sequence has E∞^(m,s)=E₁^(m,s). To identify this with mapping cohomology also require the conservative comparison range, or an independently proved sharper comparison.

**Planet:** Automatic high-degree degeneration.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.10/E1support`, `ExponentialSumsAndCircleMethodPartII:GCM.7/oddpages`.

**Construction/proof plan:**

1. Use E1support and the bidegree to show a potentially nonzero r≥2 differential forces a sufficiently large column, m≥r(n−3)+2.
2. Use oddpages for r=1 and the support inequalities for incoming as well as outgoing differentials.

**Sources and matches:**

- BS20, §1, paragraph after Conjecture 1.3, p. 898. For m+s>1−2(n−2)(n−3), the major-arc spectral sequence has E∞^(m,s)=E₁^(m,s). To identify this with mapping cohomology also require the conservative comparison range, or an independently proved sharper comparison.

**Check:** Intersect this range with comparisonsafe before counting known mapping-space groups. Odd-page vanishing alone does not prove the whole spectral sequence degenerates.

### Componentwise criterion for irreducible mapping schemes

`ExponentialSumsAndCircleMethodPartII:GCM.10/rev-top-compact-cohomology-and-top` · theorem · proof-plan

Let M be a separated finite-type scheme over an algebraically closed field and D≥0. Assume every irreducible component of M has dimension at least D, H_c^j(M,E)=0 for j>2D, and dim_E H_c^(2D)(M,E)=1. Then M is irreducible of dimension D. The general top-cohomology formula is imported from EDC, not planned again here.

**Dependencies:** `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Import EDC.2:trace-purity/top-degree-compact-cohomology at finite levels and EDC.6 adic/rational transport: for a=dim M the top group is one E(−a) per a-dimensional component, and groups above 2a vanish. No trace isomorphism on a singular or nonreduced scheme is assumed.
2. If a>D, that nonzero top group contradicts vanishing above 2D. The componentwise lower bound and rank-one group imply nonemptiness and a=D.
3. All components now have dimension D, and the rank-one top group counts them, giving one component.

**Sources and matches:**

- BS20, §2, proof of Corollary 2.9, pp.907–908. The source applies top cohomology to irreducibility. The reusable top-component theorem already belongs to EDC; this node retains only the componentwise criterion needed by the mapping-scheme application.

**Check:** A disjoint line and point has top cohomology rank one but is reducible. The lower bound on every component is necessary.

### Conservative irreducibility and expected dimension

`ExponentialSumsAndCircleMethodPartII:GCM.10/irreduciblesafe` · theorem · proof-plan

Under the main geometric hypotheses in characteristic zero or >k, if tδ>k−1 then Mor_{d,x} is geometrically irreducible and has dimension D=d(n−k). The strict inequality guarantees that i=0 belongs to comparisonsafe. The paper’s endpoint tδ≥1 is not certified.

**Planet:** Irreducibility in the conservative range.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.10/comparisonsafe`, `ExponentialSumsAndCircleMethodPartII:GCM.10/cohsupport`, `ExponentialSumsAndCircleMethodPartII:GCM.3/dimensionlower`, `ExponentialSumsAndCircleMethodPartII:GCM.10/rev-top-compact-cohomology-and-top`.

**Construction/proof plan:**

1. At i=0 only the zero column contributes, giving rank-one H_c^(2D); cohsupport gives vanishing above it.
2. Apply the general top-component theorem and dimensionlower after base change to an algebraic closure.

**Sources and matches:**

- BS20, §1, Corollary 1.4, p. 898; §2, Corollary 2.9 and proof, pp. 907–908; conservative sufficient hypothesis. Under the main geometric hypotheses in characteristic zero or >k, if tδ>k−1 then Mor_{d,x} is geometrically irreducible and has dimension D=d(n−k). The strict inequality guarantees that i=0 belongs to comparisonsafe. The paper’s endpoint tδ≥1 is not certified.

**Check:** The equality tδ=k−1 does not reach i=0. Even with the printed sharp range, equality tδ=1 would not reach i=0.

### Small-degree excess-dimension example

`ExponentialSumsAndCircleMethodPartII:GCM.10/smallcounter` · theorem · proof-plan

For k≥3,n≥3 and 1≤d<k−1 over an algebraically closed field of characteristic zero or >k, take f=x₁^(k−1)x₂+x₂^k+Σ_(j≥3)x_j^k+1 and leading vector (1,0,…,0). Its affine hypersurface and leading projective hypersurface are smooth, while the locus g₂=0 in Mor contains a nonempty family of dimension at least D−d+k−1>D. Thus the degree restriction d≥k−1 cannot be discarded from the dimension theorem.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `ExponentialSumsAndCircleMethodPartII:GCM.0/rev-affine-dimension-theorem-for-intersections`.

**Construction/proof plan:**

1. Check the gradient equations for affine and leading smoothness.
2. With g₂=0, g₁ has d free coefficients and the remaining coordinates have degree ≤d−1 and satisfy Σg_j^k+1=0.
3. Choose constant solutions to establish nonemptiness before using variables-minus-equations.

**Sources and matches:**

- BS20, §1, Remark 1.5, pp. 898–899. For k≥3,n≥3 and 1≤d<k−1 over an algebraically closed field of characteristic zero or >k, take f=x₁^(k−1)x₂+x₂^k+Σ_(j≥3)x_j^k+1 and leading vector (1,0,…,0). Its affine hypersurface and leading projective hypersurface are smooth, while the locus g₂=0 in Mor contains a nonempty family of dimension at least D−d+k−1>D. Thus the degree restriction d≥k−1 cannot be discarded from the dimension theorem.

**Check:** At n=2 the displayed restricted equation is 1=0, so this construction needs n≥3. Zero leading coordinates do not define a zero projective point.

### Unproved E1-degeneration proposition

`ExponentialSumsAndCircleMethodPartII:GCM.10/degenerationconjecture` · definition · conjecture

Define the unproved proposition DegenerationConjecture(d,f,x,E): for every i>−4(tδ−1), H_c^(i+2D)(Mor,E) is isomorphic as an E-vector space to the direct sum over m≥0 of (H_c^(i+m(n−1))(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m). The main geometric, degree and characteristic hypotheses are part of the proposition’s parameters. No canonical splitting, Frobenius-compatible splitting or proof is supplied. Distinguish this from E₁ degeneration of the actual spectral sequence, whose abutment comparison is only known in the conservative range.

**Planet:** E₁ degeneration conjecture.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `ExponentialSumsAndCircleMethodPartII:GCM.5/hypersurfmiddle`, `ExponentialSumsAndCircleMethodPartII:GCM.10/E1support`.

**Construction/proof plan:**

1. Package Conjecture 1.3 as a proposition with quantified integer degree and strict range.
2. Use configuration support to show terms with m>d vanish in that range.
3. State restriction and consequence APIs as implications from an explicit proof of the proposition.

**Sources and matches:**

- BS20, §1, Conjecture 1.3, p. 897. Define the unproved proposition DegenerationConjecture(d,f,x,E): for every i>−4(tδ−1), H_c^(i+2D)(Mor,E) is isomorphic as an E-vector space to the direct sum over m≥0 of (H_c^(i+m(n−1))(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m). The main geometric, degree and characteristic hypotheses are part of the proposition’s parameters. No canonical splitting, Frobenius-compatible splitting or proof is supplied. Distinguish this from E₁ degeneration of the actual spectral sequence, whose abutment comparison is only known in the conservative range.

**Check:** Define the unproved proposition DegenerationConjecture(d,f,x,E): for every i>−4(tδ−1), H_c^(i+2D)(Mor,E) is isomorphic as an E-vector space to the direct sum over m≥0 of (H_c^(i+m(n−1))(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m). The main geometric, degree and characteristic hypotheses are part of the proposition’s parameters. No canonical splitting, Frobenius-compatible splitting or proof is supplied. Distinguish this from E₁ degeneration of the actual spectral sequence, whose abutment comparison is only known in the conservative range.

**Planning API:**

- `degenerationConjecture` (constructor): Form a proposition quantifying vector-space isomorphisms in the stated strict range.
- `degenerationConjecture_restrict` (relation): A proof restricts to any subset of its integer-degree range.
- `degenerationConjecture_dimension` (relation): A proof implies the finite sum of first-page dimensions equals the mapping cohomology dimension.
- `degenerationConjecture_truncate` (compatibility): Configuration support permits truncation to m≤d in the conjectured interval.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration`: Its conclusion remains conditional on topology, pairing and comparison inputs.

**Discriminating tests:**

- **strict-boundary** (degenerate): The equality i=−4(tδ−1), when integral, is excluded.
- **even-differential** (non-example): A spectral sequence with d₁=d₃=0 and d₂≠0 does not satisfy E₁ degeneration.
- **zero-column** (computation): At i=0 the proposed sum is the one-dimensional m=0 term; positive m have no total degree zero when n>3.

<a id="gcm-11"></a>

## GCM.11. Infinity germs and the compact-open obstruction

Define the prescribed pointwise infinity germ and its compact-open topology, and prove continuity of polynomial-map inclusion in that topology. Build a shrinking phase, a smooth Fermat reference and an escaping loop. Construct the end-winding homomorphism using uniform projective charts on compact families; prove it is onto Z and obstructs the proposed compact-open double-loop comparison.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.3`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `AlgebraicTopologyPartII:AT2.5`

### Continuous mapping space with prescribed infinity germ

`ExponentialSumsAndCircleMethodPartII:GCM.11/localgerm` · definition · proof-plan

Over C fix the same leading vector x, P=[x:0] and d≥1. A prescribed-germ map is a continuous F:P¹(C)→X̄ with F(∞)=P, F(C)⊂X, and a local homogeneous lift [x₁+O(|z|):⋯:x_n+O(|z|):z^d+O(|z|^(d+1))] for z=1/T near zero. The radius and constants in this condition are allowed to depend on F. This defines the set of maps; a topology and a rule for compact families are additional data.

**Planet:** Prescribed infinity germ.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/rev-smooth-projective-closure-of-x`.

**Construction/proof plan:**

1. Use local product coordinates for the smooth boundary to express an invariant germ condition with its leading normal coefficient fixed by x.
2. Separate membership of an individual map from uniform bounds for a family of maps.

**Sources and matches:**

- BS20, §7, definition of Hom_{d,P}(C,X) and (7.1), p. 940. Over C fix the same leading vector x, P=[x:0] and d≥1. A prescribed-germ map is a continuous F:P¹(C)→X̄ with F(∞)=P, F(C)⊂X, and a local homogeneous lift [x₁+O(|z|):⋯:x_n+O(|z|):z^d+O(|z|^(d+1))] for z=1/T near zero. The radius and constants in this condition are allowed to depend on F. This defines the set of maps; a topology and a rule for compact families are additional data.

**Check:** Over C fix the same leading vector x, P=[x:0] and d≥1. A prescribed-germ map is a continuous F:P¹(C)→X̄ with F(∞)=P, F(C)⊂X, and a local homogeneous lift [x₁+O(|z|):⋯:x_n+O(|z|):z^d+O(|z|^(d+1))] for z=1/T near zero. The radius and constants in this condition are allowed to depend on F. This defines the set of maps; a topology and a rule for compact families are additional data.

**Planning API:**

- `prescribedInfinityGerm` (constructor): Specify the pointwise local homogeneous asymptotic condition with the fixed leading vector.
- `prescribedInfinityGerm_normal` (characterisation): In normalized product coordinates u=O(|z|) and v/z^d=1+O(|z|).
- `prescribedInfinityGerm_polynomial` (example): Every polynomial tuple with prescribed leading vector satisfies this germ.
- `prescribedInfinityGerm_chartChange` (compatibility): A normalized smooth boundary-chart change preserves the condition, with its leading normal coefficient transported explicitly.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.11/compacthom`: Defines the underlying set before a topology is chosen.
- `ExponentialSumsAndCircleMethodPartII:GCM.12/weightedcollar`: Strengthens the pointwise estimate to a fixed-radius controlled model.

**Discriminating tests:**

- **polynomial-germ** (computation): For g=(T^d,ζT^d,1,0,…,0), the local homogeneous lift is [1:ζ:z^d:0:…:0:z^d], with the last coordinate the homogenizing coordinate.
- **wrong-normal-order** (non-example): A normal coordinate z^(d+1) is not the prescribed order-d germ.
- **wrong-leading-normal** (non-example): The normal coordinate 2z^d is excluded after fixing the normalized leading coefficient one.

### Compact-open prescribed-germ mapping space

`ExponentialSumsAndCircleMethodPartII:GCM.11/compacthom` · definition · proof-plan

Hco is the set of prescribed-germ maps equipped with the subspace compact-open topology from C(P¹(C),X̄(C)). Germ radii and constants are pointwise data and are not locally uniform by definition. A parameter family is continuous exactly when its map to the ambient compact-open space is continuous and every member satisfies the germ condition.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.11/localgerm`, `mathlib:ContinuousMap.curry`.

**Construction/proof plan:**

1. Construct the subtype of the existing continuous-map carrier with its induced topology.
2. Use compact-open adjunction for continuous families; add no uniform normalized-germ condition to this topology.

**Sources and matches:**

- BS20, §7, equation (7.1) and Lemma 7.2, pp.940–941; topology specified here as a test interpretation. Hco is the set of prescribed-germ maps equipped with the subspace compact-open topology from C(P¹(C),X̄(C)). Germ radii and constants are pointwise data and are not locally uniform by definition. A parameter family is continuous exactly when its map to the ambient compact-open space is continuous and every member satisfies the germ condition.

**Check:** Hco is the set of prescribed-germ maps equipped with the subspace compact-open topology from C(P¹(C),X̄(C)). Germ radii and constants are pointwise data and are not locally uniform by definition. A parameter family is continuous exactly when its map to the ambient compact-open space is continuous and every member satisfies the germ condition.

**Planning API:**

- `compactOpenGermSpace` (constructor): Use the subtype topology on the prescribed-germ subset of C(P¹,X̄).
- `compactOpenGermSpace_coe` (coercion): The inclusion into the existing compact-open continuous-map space is continuous.
- `compactOpenGermSpace_family` (characterisation): A family is continuous if its ambient adjoint is continuous and each member satisfies the germ condition.
- `compactOpenGermSpace_evaluation` (compatibility): Evaluation is the restriction of existing compact-open evaluation.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.11/escapingloop`: Its adjoint is continuous despite lack of uniform normalized germ control.
- `ExponentialSumsAndCircleMethodPartII:GCM.11/compactchart`: Compact families still admit a common projective chart.

**Discriminating tests:**

- **reference-member** (computation): The explicit Fermat polynomial extension is an element.
- **escaping-continuity** (compatibility): The escaping phase family defines a continuous circle map into Hco.
- **no-uniform-control** (non-example): A compact family need not satisfy |v/z^d−1|<1/2 on a common tail; the escaping loop violates it at a moving parameter.

### Analytic polynomial-map inclusion into the germ mapping space

`ExponentialSumsAndCircleMethodPartII:GCM.11/rev-analytic-polynomial-map-inclusion-into` · construction · proof-plan

The map ι:Mor_{d,x}(C)^an→Hco sends g to [g(T):1] at finite T and to P at infinity. It is continuous: in z-coordinates it is [x+O(z):z^d], and the coefficient bounds are locally uniform on the coefficient space. This proves compact-open continuity only; continuity for a proposed stronger global germ topology must be proved for that topology.

**Planet:** Polynomial-map inclusion.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `ExponentialSumsAndCircleMethodPartII:GCM.11/compacthom`, `mathlib:ContinuousMap.curry`.

**Construction/proof plan:**

1. Extend the evaluation map across infinity using the fixed leading vector.
2. Prove joint continuity on Mor^an×P¹, with a coefficient neighbourhood giving a common bound near infinity.
3. Curry into the existing compact-open mapping space and factor through the prescribed-germ subtype.

**Sources and matches:**

- BS20, §7, sentence after (7.1), p. 940. The map ι:Mor_{d,x}(C)^an→Hco sends g to [g(T):1] at finite T and to P at infinity. It is continuous: in z-coordinates it is [x+O(z):z^d], and the coefficient bounds are locally uniform on the coefficient space. This proves compact-open continuity only; continuity for a proposed stronger global germ topology must be proved for that topology.

**Check:** The map ι:Mor_{d,x}(C)^an→Hco sends g to [g(T):1] at finite T and to P at infinity. It is continuous: in z-coordinates it is [x+O(z):z^d], and the coefficient bounds are locally uniform on the coefficient space. This proves compact-open continuity only; continuity for a proposed stronger global germ topology must be proved for that topology.

**Planning API:**

- `polynomialMapInclusion` (constructor): Extend [g(T):1] at infinity by P.
- `polynomialMapInclusion_evaluate` (simp): Evaluation at finite T agrees with polynomial evaluation in the affine chart.
- `polynomialMapInclusion_continuous` (structure): The map from the analytic coefficient scheme to Hco is continuous.
- `polynomialMapInclusion_normal` (compatibility): The normalized normal coordinate has leading term z^d fixed by the leading vector.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.13/tracepairingconjecture`: Pulls ordinary classes back before compact-support cup product.
- `ExponentialSumsAndCircleMethodPartII:GCM.12/stronggermgate`: A new continuity proof is required for a stronger topology.

**Discriminating tests:**

- **fermat-basepoint** (computation): The Fermat tuple is sent to the chosen basepoint g of Hco.
- **coefficient-neighbourhood** (compatibility): A bounded neighbourhood of coefficients provides one asymptotic bound for all its members.
- **fixed-leading-required** (non-example): If the leading vector is allowed to approach zero, the asserted joint extension at infinity need not hold.

### Shrinking phase

`ExponentialSumsAndCircleMethodPartII:GCM.11/shrinkingphase` · definition · proof-plan

For 0≤s≤1 and 0<r≤1/4 put h(s,r)=max(0,min(1,(s−r)/r)) and σ(s,r)=exp(2πi h(s,r)). Since h(0,r)=0 and h(1,r)=1, σ descends from the interval to its circle quotient. The radius parameter is strictly positive.

**Planet:** Shrinking phase.

**Dependencies:** `mathlib:ContinuousMap.curry`.

**Construction/proof plan:**

1. Define the clamped real function and compose with the usual complex exponential.
2. Use equality of the two endpoint phases to descend to the standard based circle.

**Sources and matches:**

- BS20, Own counterexample construction for §7, Lemma 7.2, pp.940–941. For 0≤s≤1 and 0<r≤1/4 put h(s,r)=max(0,min(1,(s−r)/r)) and σ(s,r)=exp(2πi h(s,r)). Since h(0,r)=0 and h(1,r)=1, σ descends from the interval to its circle quotient. The radius parameter is strictly positive.

**Check:** For 0≤s≤1 and 0<r≤1/4 put h(s,r)=max(0,min(1,(s−r)/r)) and σ(s,r)=exp(2πi h(s,r)). Since h(0,r)=0 and h(1,r)=1, σ descends from the interval to its circle quotient. The radius parameter is strictly positive.

**Planning API:**

- `clampedPhaseLift` (constructor): Define h=max(0,min(1,(s−r)/r)) for positive r.
- `shrinkingPhase` (constructor): Define σ=exp(2πi h).
- `shrinkingPhase_endpoints` (simp): σ(0,r)=σ(1,r)=1 for 0<r≤1/4.
- `shrinkingPhase_circle` (universal-property): Descend the interval map to its based circle quotient.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.11/escapingloop`: Moves a full turn into a shrinking parameter interval.
- `ExponentialSumsAndCircleMethodPartII:GCM.11/phasefacts`: The lift computes degree and the moving midpoint.

**Discriminating tests:**

- **before-transition** (computation): For s≤r, h=0 and σ=1.
- **mid-transition** (computation): At s=3r/2, h=1/2 and σ=−1.
- **after-transition** (computation): For s≥2r, h=1 and σ=1; the lift endpoint remains one, preserving degree.

### Pointwise eventual constancy does not imply uniform germ control

`ExponentialSumsAndCircleMethodPartII:GCM.11/phasefacts` · theorem · proof-plan

σ is jointly continuous for positive r. For each fixed s, σ(s,r)=1 for all sufficiently small positive r, while for each fixed r its circle map has degree +1. At s=3r/2 one has σ=−1. Thus eventual pointwise constancy as r→0 does not imply uniform constancy in s.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.11/shrinkingphase`, `tauceti:UnitAddCircle.fundamentalGroupMulEquiv`.

**Construction/proof plan:**

1. Check the clamped function on its three intervals and the endpoint values.
2. Its real lift increases from zero to one, giving degree +1 under the pinned circle-cover convention.
3. Use the moving parameter s=3r/2 to disprove uniformity.

**Sources and matches:**

- BS20, extraction's own construction, not in the paper; it concerns §7, (7.1) and Lemma 7.2 with its proof, pp. 940–941. σ is jointly continuous for positive r. For each fixed s, σ(s,r)=1 for all sufficiently small positive r, while for each fixed r its circle map has degree +1. At s=3r/2 one has σ=−1. Thus eventual pointwise constancy as r→0 does not imply uniform constancy in s.

**Check:** The circle degree is +1, not zero. The midpoint phase is −1 even at arbitrarily small radii.

### Fermat hypersurface and polynomial reference map

`ExponentialSumsAndCircleMethodPartII:GCM.11/fermatreference` · construction · proof-plan

For k≥3,n≥3,d≥1 choose ζ∈C with ζ^k=−1 and let X={Σx_j^k=1}. Its closure {Σx_j^k=x₀^k} and boundary are smooth. With x=(1,ζ,0,…,0), P=[x:0], the tuple g=(T^d,ζT^d,1,0,…,0) belongs to Mor_{d,x}, and its extension gives a specified basepoint of Hco.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `ExponentialSumsAndCircleMethodPartII:GCM.11/compacthom`.

**Construction/proof plan:**

1. The first two k-th powers cancel and the third contributes one.
2. Check smoothness by the simultaneous vanishing of all relevant partial derivatives.
3. At infinity divide homogeneous coordinates by T^d.

**Sources and matches:**

- BS20, Own example for §7, equation (7.1), p.940. For k≥3,n≥3,d≥1 choose ζ∈C with ζ^k=−1 and let X={Σx_j^k=1}. Its closure {Σx_j^k=x₀^k} and boundary are smooth. With x=(1,ζ,0,…,0), P=[x:0], the tuple g=(T^d,ζT^d,1,0,…,0) belongs to Mor_{d,x}, and its extension gives a specified basepoint of Hco.

**Check:** For k≥3,n≥3,d≥1 choose ζ∈C with ζ^k=−1 and let X={Σx_j^k=1}. Its closure {Σx_j^k=x₀^k} and boundary are smooth. With x=(1,ζ,0,…,0), P=[x:0], the tuple g=(T^d,ζT^d,1,0,…,0) belongs to Mor_{d,x}, and its extension gives a specified basepoint of Hco.

**Planning API:**

- `fermatReferenceTuple` (constructor): Build (T^d,ζT^d,1,0,…).
- `fermatReference_equation` (characterisation): The k-th power sum equals one and the leading vector is (1,ζ,0,…).
- `fermatReference_smooth` (structure): Verify smoothness of both closure and leading boundary.
- `fermatReference_infinity` (compatibility): Its extension is a based prescribed-germ map at P.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.11/escapingloop`: Provides the basepoint and nonemptiness witness.
- `ExponentialSumsAndCircleMethodPartII:GCM.11/compactcounter`: Avoids an empty-space obstruction argument.

**Discriminating tests:**

- **constant-coordinate** (computation): The third coordinate equals one; dropping it would give power sum zero.
- **infinity-point** (computation): Dividing by T^d gives limit [1:ζ:0:…:0] with last homogeneous coordinate zero.
- **dimension-restriction** (degenerate): The construction needs n≥3 to supply its constant third coordinate.

### Continuous loop with an escaping phase transition

`ExponentialSumsAndCircleMethodPartII:GCM.11/escapingloop` · construction · proof-plan

For finite T set r(T)=1/(4(1+|T|)), a_s(T)=T^d σ(s,r(T)), and F_s(T)=(a_s(T),ζa_s(T),1,0,…,0). Put F_s(∞)=P. This is a based loop in Hco at the Fermat reference g. For each fixed s it agrees with g on a sufficiently far tail, but the agreement is not uniform over the whole circle of parameters.

**Planet:** Escaping loop.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.11/fermatreference`, `ExponentialSumsAndCircleMethodPartII:GCM.11/shrinkingphase`, `ExponentialSumsAndCircleMethodPartII:GCM.11/phasefacts`, `mathlib:ContinuousMap.curry`.

**Construction/proof plan:**

1. The Fermat equation holds identically by cancellation.
2. Use |a_s(T)|=|T|^d for uniform projective convergence to P, hence joint continuity at infinity.
3. For each fixed s the phase is eventually one; use compact-open currying to obtain the based loop.

**Sources and matches:**

- BS20, Own counterexample for §7, Lemma 7.2, pp.940–941. For finite T set r(T)=1/(4(1+|T|)), a_s(T)=T^d σ(s,r(T)), and F_s(T)=(a_s(T),ζa_s(T),1,0,…,0). Put F_s(∞)=P. This is a based loop in Hco at the Fermat reference g. For each fixed s it agrees with g on a sufficiently far tail, but the agreement is not uniform over the whole circle of parameters.

**Check:** For finite T set r(T)=1/(4(1+|T|)), a_s(T)=T^d σ(s,r(T)), and F_s(T)=(a_s(T),ζa_s(T),1,0,…,0). Put F_s(∞)=P. This is a based loop in Hco at the Fermat reference g. For each fixed s it agrees with g on a sufficiently far tail, but the agreement is not uniform over the whole circle of parameters.

**Planning API:**

- `escapingPhaseLoop` (constructor): Use a_s(T)=T^d σ(s,1/(4(1+|T|))) in the Fermat tuple.
- `escapingPhaseLoop_based` (simp): At s=0 and s=1 the map is the reference g.
- `escapingPhaseLoop_continuous` (structure): The family extends jointly continuously over parameter circle times P¹.
- `escapingPhaseLoop_pointwiseTail` (characterisation): For each fixed parameter it equals g on some tail, with no uniform tail over the parameter circle.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.11/windingnonzero`: Its inverse normal phase has winding −1.
- `ExponentialSumsAndCircleMethodPartII:GCM.11/compactcounter`: Witnesses a nontrivial fundamental-group class.

**Discriminating tests:**

- **norm-control** (computation): For every s,T, |a_s(T)|=|T|^d.
- **midpoint-failure** (non-example): For large R and s=3r(R)/2, a_s(R)=−R^d, so normalized normals are not uniformly near one.
- **tail-at-fixed-s** (degenerate): For any fixed s>0 choose r<s/2; then the phase is one. At s=0 it is always one.

### A compact parameter family has a common projective chart at infinity

`ExponentialSumsAndCircleMethodPartII:GCM.11/compactchart` · theorem · proof-plan

If K is compact and K→Hco is continuous, there is a common sufficiently small neighbourhood of infinity on which every map lies in a fixed projective chart containing P. For the Fermat reference use x₁≠0 and v=x₀/x₁. At finite T in that tail, v never vanishes. This does not provide a uniform estimate for v/z^d−1.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.11/compacthom`.

**Construction/proof plan:**

1. Use compact-open evaluation and the tube lemma at K×{∞}.
2. Finite points map into X, where x₀≠0, so the chart coordinate v is nonzero.

**Sources and matches:**

- BS20, extraction's own construction, not in the paper; it concerns §7, (7.1) and Lemma 7.2 with its proof, pp. 940–941. If K is compact and K→Hco is continuous, there is a common sufficiently small neighbourhood of infinity on which every map lies in a fixed projective chart containing P. For the Fermat reference use x₁≠0 and v=x₀/x₁. At finite T in that tail, v never vanishes. This does not provide a uniform estimate for v/z^d−1.

**Check:** Apply this to K=S¹ and K=I×S¹. A common projective chart is weaker than a common normalized germ bound.

### Winding of a mapping-space loop at infinity

`ExponentialSumsAndCircleMethodPartII:GCM.11/endwinding` · construction · proof-plan

For a based loop γ in the Fermat Hco and sufficiently large positive real R, evaluate v(γ_s(R))/v(g(R))∈C× and take its positively oriented circle winding number. This defines endWind:π₁(Hco,g)→Z once radius- and homotopy-independence are proved. Use the existing oriented circle-cover computation, rather than a new fundamental-group object.

**Planet:** End winding.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.11/compactchart`, `tauceti:UnitAddCircle.fundamentalGroupMulEquiv`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction/proof plan:**

1. Use compactchart for the loop to choose R and normalize at its basepoint.
2. Retract C× radially to the unit circle and apply the existing integer deck-translation invariant.

**Sources and matches:**

- BS20, Own obstruction invariant for §7, Lemma 7.2, pp.940–941. For a based loop γ in the Fermat Hco and sufficiently large positive real R, evaluate v(γ_s(R))/v(g(R))∈C× and take its positively oriented circle winding number. This defines endWind:π₁(Hco,g)→Z once radius- and homotopy-independence are proved. Use the existing oriented circle-cover computation, rather than a new fundamental-group object.

**Check:** For a based loop γ in the Fermat Hco and sufficiently large positive real R, evaluate v(γ_s(R))/v(g(R))∈C× and take its positively oriented circle winding number. This defines endWind:π₁(Hco,g)→Z once radius- and homotopy-independence are proved. Use the existing oriented circle-cover computation, rather than a new fundamental-group object.

**Planning API:**

- `endWindingAtRadius` (constructor): Evaluate the nonzero normalized normal coordinate at a sufficiently large positive R and take oriented winding.
- `endWinding_radius` (compatibility): Changing R within a common tail leaves the integer unchanged.
- `endWinding` (structure): Descend to a group homomorphism π₁(Hco,g)→Z.
- `endWinding_escaping` (example): The escaping-loop class maps to −1 with the chosen positive circle orientation.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.11/windingwell`: Proves independence of choices and homotopy invariance.
- `ExponentialSumsAndCircleMethodPartII:GCM.13/rev-conjecture-7-1-fails-for`: Produces a nonzero rational degree-one class.

**Discriminating tests:**

- **constant-loop** (computation): The constant loop has winding zero.
- **inverse-phase** (computation): The escaping loop has value −1 because v=1/a_s.
- **concatenation** (compatibility): Concatenating the escaping loop with itself has value −2; concatenating it with its reverse has value zero.

### End winding is independent of radius and based homotopy

`ExponentialSumsAndCircleMethodPartII:GCM.11/windingwell` · theorem · proof-plan

The integer defining endWind is independent of sufficiently large R, invariant under based homotopy, and additive under concatenation. It therefore gives a group homomorphism on π₁.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.11/endwinding`, `ExponentialSumsAndCircleMethodPartII:GCM.11/compactchart`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction/proof plan:**

1. Vary R within the common tail to get a homotopy of nonzero evaluation loops.
2. For a based homotopy use compactchart with compact parameter I×S¹.
3. Concatenation commutes with evaluation and winding is additive.

**Sources and matches:**

- BS20, extraction's own construction, not in the paper; it concerns §7, (7.1) and Lemma 7.2 with its proof, pp. 940–941. The integer defining endWind is independent of sufficiently large R, invariant under based homotopy, and additive under concatenation. It therefore gives a group homomorphism on π₁.

**Check:** A radius chosen separately for each member of a homotopy is insufficient. The constant loop has winding zero.

### Infinite-order loop in the compact-open germ space

`ExponentialSumsAndCircleMethodPartII:GCM.11/windingnonzero` · theorem · proof-plan

For the escaping loop, v(F_s(R))/v(g(R))=σ(s,r(R))^(−1), so endWind([F])=−1. Hence endWind is onto Z, [F] has infinite order, and this loop has no filling disc in Hco.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.11/escapingloop`, `ExponentialSumsAndCircleMethodPartII:GCM.11/phasefacts`, `ExponentialSumsAndCircleMethodPartII:GCM.11/windingwell`.

**Construction/proof plan:**

1. Compute v=1/a_s in the chart, then use phasefacts and windingwell.
2. A filling disc would make its winding zero, contradicting the explicit value.

**Sources and matches:**

- BS20, extraction's own construction, not in the paper; it concerns §7, (7.1) and Lemma 7.2 with its proof, pp. 940–941. For the escaping loop, v(F_s(R))/v(g(R))=σ(s,r(R))^(−1), so endWind([F])=−1. Hence endWind is onto Z, [F] has infinite order, and this loop has no filling disc in Hco.

**Check:** The reciprocal normal coordinate reverses the sign. Surjectivity follows from the value −1 and the group law.

### Compact-open interpretation of Lemma7.2 fails in the main range

`ExponentialSumsAndCircleMethodPartII:GCM.11/compactcounter` · theorem · companion-connectivity-input

For the cubic Fermat hypersurface in C^40 and d=2, the nonempty compact-open space Hco has π₁ surjecting onto Z. The companion Fermat/Milnor calculation gives X≃a finite bouquet of S³⁹, so Ω²X is connected and simply connected. Thus Hco is not homotopy equivalent, or weakly equivalent, to Ω²X. This disproves the compact-open interpretation of Lemma 7.2.

**Planet:** Compact-open obstruction.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.11/windingnonzero`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `AlgebraicTopologyPartII:AT2.5/fermat-loop-connectivity`.

**Construction/proof plan:**

1. Use fermatreference and windingnonzero for the left side.
2. Import the companion’s Fermat bouquet/connectivity result; π₂X=π₃X=0 gives the double-loop connectivity.
3. Compare fundamental groups, without assuming the disputed germ straightening.

**Sources and matches:**

- BS20, §7, Lemma 7.2 pp.940–941; Lemma 7.6 p.944 supplies the cited bouquet route; explicit counterexample constructed here. For the cubic Fermat hypersurface in C^40 and d=2, the nonempty compact-open space Hco has π₁ surjecting onto Z. The companion Fermat/Milnor calculation gives X≃a finite bouquet of S³⁹, so Ω²X is connected and simply connected. Thus Hco is not homotopy equivalent, or weakly equivalent, to Ω²X. This disproves the compact-open interpretation of Lemma 7.2.

**Check:** Nonemptiness is witnessed by a polynomial map. The obstruction concerns the specified compact-open topology.

<a id="gcm-12"></a>

## GCM.12. Controlled collars and the topology gate

Define a fixed-radius weighted collar with normal coordinate divided by z^d uniformly close to one. Straighten on an inner disc without creating zeros and without claiming a strong deformation retract. Request the parameterized mapping-restriction consequence of the existing CW cofibration HEP and specialize it to fixed-boundary extension spaces. State the missing global stronger-germ topology, algebraic inclusion continuity and double-loop equivalence as an explicit gate.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.11`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`

### A chart with uniform control of the normalized germ

`ExponentialSumsAndCircleMethodPartII:GCM.12/weightedcollar` · definition · proof-plan

Fix a product chart (u,v) at P with boundary v=0 and normal coordinate normalized to have prescribed leading coefficient one. Fix ε>0, a convex tangential ball around zero, and a normal disc large enough for |v|<(3/2)ε^d. A controlled tail on 0<|z|≤ε has u=O(|z|), w=v/z^d=1+O(|z|), u in that ball, and |w−1|<1/2. Topologize it by the weighted sup distances sup||Δu||/|z| and sup|Δw|/|z|, combined with compact-open topology off the tail. The fixed radius is part of the object.

**Planet:** Controlled infinity collar.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.11/localgerm`, `ExponentialSumsAndCircleMethodPartII:GCM.11/compacthom`.

**Construction/proof plan:**

1. Use the local product chart for a smooth divisor and fix the leading normal normalization.
2. The O conditions make the weighted distances finite; the bound on w keeps v nonzero on the punctured disc.
3. Glue this fixed-radius chart model to the outside continuous map with matching boundary.

**Sources and matches:**

- BS20, Own repaired local model for §7, Lemma 7.2 proof, pp.940–941. Fix a product chart (u,v) at P with boundary v=0 and normal coordinate normalized to have prescribed leading coefficient one. Fix ε>0, a convex tangential ball around zero, and a normal disc large enough for |v|<(3/2)ε^d. A controlled tail on 0<|z|≤ε has u=O(|z|), w=v/z^d=1+O(|z|), u in that ball, and |w−1|<1/2. Topologize it by the weighted sup distances sup||Δu||/|z| and sup|Δw|/|z|, combined with compact-open topology off the tail. The fixed radius is part of the object.

**Check:** Fix a product chart (u,v) at P with boundary v=0 and normal coordinate normalized to have prescribed leading coefficient one. Fix ε>0, a convex tangential ball around zero, and a normal disc large enough for |v|<(3/2)ε^d. A controlled tail on 0<|z|≤ε has u=O(|z|), w=v/z^d=1+O(|z|), u in that ball, and |w−1|<1/2. Topologize it by the weighted sup distances sup||Δu||/|z| and sup|Δw|/|z|, combined with compact-open topology off the tail. The fixed radius is part of the object.

**Planning API:**

- `controlledCollar` (constructor): Record the fixed chart, radius, convex balls and weighted-bounded tail functions.
- `controlledCollar_nonzero` (characterisation): The bound |w−1|<1/2 implies v=z^d w≠0 for z≠0.
- `controlledCollar_weightedTopology` (structure): Use the two weighted supremum distances and compact-open control outside.
- `controlledCollar_restrict` (functoriality): Restriction to a smaller positive radius preserves the bounds and is continuous.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.12/collarstraightening`: Convexity prevents the normal zeros that invalidate unbounded-family straightening.
- `ExponentialSumsAndCircleMethodPartII:GCM.12/stronggermgate`: Provides only a fixed-radius model for a proposed global topology.

**Discriminating tests:**

- **standard-collar** (computation): u=0,w=1 has weighted distance zero from the standard model.
- **constant-offset** (non-example): w=1.1 satisfies the half-disc bound but fails w−1=O(|z|), so is excluded.
- **opposite-normal** (non-example): w=−1 is nonzero but violates |w−1|<1/2 and cannot be straightened by the stated convex formula.

### Cutoff straightening within a fixed controlled collar

`ExponentialSumsAndCircleMethodPartII:GCM.12/collarstraightening` · construction · proof-plan

Choose a radial cutoff χ equal to one on an inner disc and zero near |z|=ε. For a controlled collar define u_t=(1−tχ)u and v_t=z^d[1+(1−tχ)(w−1)]. This is a continuous homotopy in the fixed-radius controlled model, leaves the outer collar fixed, and at t=1 is standard on the inner disc. The bracket stays within distance 1/2 of one, so no punctured-disc zero appears. Do not call this a strong deformation retract onto maps already standard on the inner disc: their annular region can move.

**Planet:** Controlled collar straightening.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.12/weightedcollar`.

**Construction/proof plan:**

1. Use convexity of the tangential ball and of the normal disc about one.
2. Estimate the two weighted differences uniformly in t and in the collar data.
3. For comparison with a chosen reference collar replace zero and one by its normalized pair and use the same convex bound.

**Sources and matches:**

- BS20, Corrected local construction prompted by §7, Lemma 7.2 proof, pp.940–941. Choose a radial cutoff χ equal to one on an inner disc and zero near |z|=ε. For a controlled collar define u_t=(1−tχ)u and v_t=z^d[1+(1−tχ)(w−1)]. This is a continuous homotopy in the fixed-radius controlled model, leaves the outer collar fixed, and at t=1 is standard on the inner disc. The bracket stays within distance 1/2 of one, so no punctured-disc zero appears. Do not call this a strong deformation retract onto maps already standard on the inner disc: their annular region can move.

**Check:** Choose a radial cutoff χ equal to one on an inner disc and zero near |z|=ε. For a controlled collar define u_t=(1−tχ)u and v_t=z^d[1+(1−tχ)(w−1)]. This is a continuous homotopy in the fixed-radius controlled model, leaves the outer collar fixed, and at t=1 is standard on the inner disc. The bracket stays within distance 1/2 of one, so no punctured-disc zero appears. Do not call this a strong deformation retract onto maps already standard on the inner disc: their annular region can move.

**Planning API:**

- `straightenControlledCollar` (constructor): Apply the cutoff convex formulas for u_t and w_t.
- `straightenControlledCollar_outer` (simp): Where χ=0, the map is unchanged for every t.
- `straightenControlledCollar_inner` (simp): At t=1 where χ=1 the normalized tail is (0,1).
- `straightenControlledCollar_continuous` (compatibility): The homotopy is jointly continuous in t and in the weighted topology.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.12/stronggermgate`: A global comparison must supply compact-family access to these controlled models.

**Discriminating tests:**

- **time-zero** (computation): At t=0 the original collar is recovered.
- **zero-prevention** (compatibility): If |w−1|<1/2 then |1+(1−tχ)(w−1)|>1/2 for all t,χ∈[0,1].
- **annulus-moves** (non-example): A collar already standard on the inner disc may have nonstandard transition annulus, which this homotopy changes; it is not fixed pointwise as an SDR would require.

### Fixed-collar extension-space comparison contract

`ExponentialSumsAndCircleMethodPartII:GCM.12/fixedcollarloops` · theorem · proof-plan

Let β:S¹→X be a based loop and choose an extension β̃:D²→X. Its compact-open extension space Ext(β) is homotopy equivalent to Ω²X after choosing that reference extension. The based restriction Map_*(D²,X)→Map_*(S¹,X) is a Hurewicz fibration by the CW boundary cofibration; its total space contracts by a disc contraction fixing the boundary basepoint. This uses the requested mapping-restriction extension of current CW homotopy-extension theory and asserts no equivalence for Hco.

**Planet:** Fixed-boundary extension space.

**Dependencies:** `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `mathlib:ContinuousMap.curry`.

**Construction/proof plan:**

1. Import the existing Stage 4 boundary cofibration and homotopy-extension property. Request its parameterized compact-open mapping-restriction consequence explicitly: for a compact CW pair (A,B), based restriction Map_*(A,X)→Map_*(B,X) is a Hurewicz fibration. Current Stage 5 does not already state this export.
2. Contract the disc to its chosen boundary basepoint, so the total based mapping space is contractible.
3. Use the reference nullhomotopy to compare the fibre over β with the fibre over the constant boundary.

**Sources and matches:**

- BS20, Own specialization of the CW mapping-space argument for §7, Lemma 7.2, pp.940–941. Own specialization of the CW homotopy-extension argument to a compact disc pair. The needed mapping-restriction fibration is an explicit extension request, rather than an existing Stage 5 declaration or the invalid compact-open infinity-germ comparison.

**Check:** A chosen extension is a hypothesis, not a consequence of any boundary loop. For contractible X and constant β the extension space is contractible. The basepoint remains fixed during the disc contraction.

### Unclosed stronger-germ comparison

`ExponentialSumsAndCircleMethodPartII:GCM.12/stronggermgate` · theorem · open-global-topology

Open global target: specify a stronger topology on the prescribed-germ set for which compact parameter families admit uniform normalized collar bounds; prove polynomial-map inclusion continuous; prove comparison with a fixed-collar model and hence with Ω²X when a reference map exists. Include the compact-generation/colimit argument that justifies uniform straightening in families. The fixed-radius construction does not by itself solve this target, and the resulting space cannot be weakly equivalent to Hco in the Fermat example.

**Planet:** Strong-germ comparison target.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.12/collarstraightening`, `ExponentialSumsAndCircleMethodPartII:GCM.12/fixedcollarloops`, `ExponentialSumsAndCircleMethodPartII:GCM.11/rev-analytic-polynomial-map-inclusion-into`, `ExponentialSumsAndCircleMethodPartII:GCM.11/compactcounter`.

**Construction/proof plan:**

1. Choose an explicit topology, not merely the phrase germ topology.
2. Prove the compact-family control statement, coordinate-chart compatibility and continuity of the algebraic inclusion.
3. Build and compare the fixed-collar models using collarstraightening and fixedcollarloops, with all choices and homotopies continuous.

**Sources and matches:**

- BS20, extraction's own construction, not in the paper; it concerns §7, (7.1) and Lemma 7.2 with its proof, pp. 940–941. Open global target: specify a stronger topology on the prescribed-germ set for which compact parameter families admit uniform normalized collar bounds; prove polynomial-map inclusion continuous; prove comparison with a fixed-collar model and hence with Ω²X when a reference map exists. Include the compact-generation/colimit argument that justifies uniform straightening in families. The fixed-radius construction does not by itself solve this target, and the resulting space cannot be weakly equivalent to Hco in the Fermat example.

**Check:** Pointwise O-bounds do not imply uniform family bounds. An unspecified direct-limit topology does not establish the compact-family property.

### Continuous mapping space versus the double loop space

`ExponentialSumsAndCircleMethodPartII:GCM.12/homloops` · theorem · conditional-on-topology-gate

Conditional repair of Lemma 7.2: if the topology, uniform-family control, continuous polynomial inclusion and fixed-collar comparison required by stronggermgate are proved, then the nonempty prescribed-germ space is homotopy equivalent to Ω²X after choosing a reference map. For Hco the asserted equivalence is false.

**Planet:** Conditional double-loop comparison.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.12/stronggermgate`, `ExponentialSumsAndCircleMethodPartII:GCM.12/fixedcollarloops`.

**Construction/proof plan:**

1. Apply the proved global comparison to a fixed-collar extension space.
2. Use fixedcollarloops with the reference extension; retain its dependence on a chosen basepoint/reference.

**Sources and matches:**

- BS20, §7, Lemma 7.2 and its proof, pp. 940–941. Conditional repair of Lemma 7.2: if the topology, uniform-family control, continuous polynomial inclusion and fixed-collar comparison required by stronggermgate are proved, then the nonempty prescribed-germ space is homotopy equivalent to Ω²X after choosing a reference map. For Hco the asserted equivalence is false.

**Check:** Conditional repair of Lemma 7.2: if the topology, uniform-family control, continuous polynomial inclusion and fixed-collar comparison required by stronggermgate are proved, then the nonempty prescribed-germ space is homotopy equivalent to Ω²X after choosing a reference map. For Hco the asserted equivalence is false.

<a id="gcm-13"></a>

## GCM.13. Trace comparison and conditional degeneration

Define the trace-pairing conjecture for a specified topology and continuous algebraic inclusion. Disprove its compact-open interpretation in the cubic forty-variable example. Assuming the stronger-topology comparison and the trace conjecture, import configuration/rational-loop dimension formulas to obtain the conditional E1-degeneration argument. Separate negative-degree dimension equality from the range where an actual abutment comparison is known.

**Inputs:** `ExponentialSumsAndCircleMethodPartII:GCM.10`, `ExponentialSumsAndCircleMethodPartII:GCM.12`, `EtaleDualityAndPerverseSheaves:EDC.6`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `AlgebraicTopologyPartII:AT2.3`, `AlgebraicTopologyPartII:AT2.4`, `AlgebraicTopologyPartII:AT2.5`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`

### Unproved algebraic-to-continuous trace comparison

`ExponentialSumsAndCircleMethodPartII:GCM.13/tracepairingconjecture` · definition · conjecture-dependent-on-topology

For K=C and the main degree/geometric hypotheses, fix a topology H on the prescribed-germ set, a continuous ι:Mor^an→H, and the geometrically defined degree-2D trace τ (available from irreduciblesafe; outside that range its geometric justification is part of G3). Define the pairing H_c^(2D−j)(Mor,Q)⊗H^j(H,Q)→Q by pullback along ι, compact-support cup product and τ. TraceComparisonConjecture(H,ι,τ) is the unproved proposition that this pairing is perfect for every 0≤j<4(tδ−1). Its content depends on H. The compact-open instance is false in the Fermat example.

**Planet:** Trace comparison conjecture.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `ExponentialSumsAndCircleMethodPartII:GCM.11/localgerm`, `ExponentialSumsAndCircleMethodPartII:GCM.11/rev-analytic-polynomial-map-inclusion-into`, `ExponentialSumsAndCircleMethodPartII:GCM.10/irreduciblesafe`, `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`, `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`.

**Construction/proof plan:**

1. Use the analytic comparison preserving compact supports, cup product and trace.
2. Form the pairing from the specified maps and state perfection as a proposition, never as an instance or axiom.
3. Keep the original range separate from the conservative range used to establish the trace geometrically.

**Sources and matches:**

- BS20, §7, Conjecture 7.1, p. 940. For K=C and the main degree/geometric hypotheses, fix a topology H on the prescribed-germ set, a continuous ι:Mor^an→H, and the geometrically defined degree-2D trace τ (available from irreduciblesafe; outside that range its geometric justification is part of G3). Define the pairing H_c^(2D−j)(Mor,Q)⊗H^j(H,Q)→Q by pullback along ι, compact-support cup product and τ. TraceComparisonConjecture(H,ι,τ) is the unproved proposition that this pairing is perfect for every 0≤j<4(tδ−1). Its content depends on H. The compact-open instance is false in the Fermat example.

**Check:** For K=C and the main degree/geometric hypotheses, fix a topology H on the prescribed-germ set, a continuous ι:Mor^an→H, and the geometrically defined degree-2D trace τ (available from irreduciblesafe; outside that range its geometric justification is part of G3). Define the pairing H_c^(2D−j)(Mor,Q)⊗H^j(H,Q)→Q by pullback along ι, compact-support cup product and τ. TraceComparisonConjecture(H,ι,τ) is the unproved proposition that this pairing is perfect for every 0≤j<4(tδ−1). Its content depends on H. The compact-open instance is false in the Fermat example.

**Planning API:**

- `mappingTracePairing` (constructor): Pull back H^j(H,Q), cup with H_c^(2D−j)(Mor,Q), and apply the specified geometric trace.
- `traceComparisonConjecture` (constructor): Define perfection for all integer j with 0≤j<4(tδ−1) as a proposition.
- `traceComparison_dimension` (relation): A proof gives dim H_c^(2D−j)(Mor,Q)=dim H^j(H,Q).
- `traceComparison_topology` (compatibility): A homeomorphism respecting the algebraic inclusion transports the proposition; a set bijection alone does not.

**Uses:**

- `ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration`: Perfection yields the conditional negative-degree dimension equality.
- `ExponentialSumsAndCircleMethodPartII:GCM.13/rev-conjecture-7-1-fails-for`: The compact-open version fails at j=1.

**Discriminating tests:**

- **degree-zero** (computation): When the supported irreducibility theorem applies and H is connected, j=0 uses the one-dimensional trace class.
- **strict-top-end** (degenerate): j=4(tδ−1), when integral, is excluded.
- **compact-open-failure** (non-example): For the cubic forty-variable example, the algebraic factor at j=1 is zero but H¹(Hco,Q) is nonzero, so perfection fails.

### Conjecture 7.1 fails for the compact-open germ space in the Fermat example

`ExponentialSumsAndCircleMethodPartII:GCM.13/rev-conjecture-7-1-fails-for` · theorem · proof-plan

For X={Σ_(j=1)^40 x_j³=1}, d=2 and the compact-open Hco, D=74 and tδ=3. End winding implies H¹(Hco,Q)≠0, whereas cohsupport in the conservative range i>−4 gives H_c^147(Mor,Q)=0. Since j=1 lies in 0≤j<8, the pairing demanded by the compact-open reading of Conjecture 7.1 is not perfect.

**Planet:** Compact-open trace obstruction.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.11/windingnonzero`, `ExponentialSumsAndCircleMethodPartII:GCM.10/cohsupport`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`, `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Construction/proof plan:**

1. The surjection π₁→Z factors through H₁, and the rational universal coefficient theorem gives a nonzero H¹ class.
2. Check that i=−1 lies in the conservative range and in none of the support bands.
3. Compare the two factors of the proposed perfect pairing at j=1.

**Sources and matches:**

- BS20, §7, Conjecture 7.1 and (7.1), p. 940; reviewer's addition. For X={Σ_(j=1)^40 x_j³=1}, d=2 and the compact-open Hco, D=74 and tδ=3. End winding implies H¹(Hco,Q)≠0, whereas cohsupport in the conservative range i>−4 gives H_c^147(Mor,Q)=0. Since j=1 lies in 0≤j<8, the pairing demanded by the compact-open reading of Conjecture 7.1 is not perfect.

**Check:** This example has tδ>k−1, so its trace and irreducibility are within the supported range. The failure occurs strictly inside the conjectural interval.

### Conditional implication from the comparison conjecture

`ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration` · theorem · conditional-with-companion-inputs

Assume K=C, d≥k−1≥2, n>2^k(k−1), a single specified topology H with continuous ι and H≃Ω²X as required by homloops, and TraceComparisonConjecture(H,ι,τ). For −4(tδ−1)<i≤0 the pairing gives dim H_c^(i+2D)(Mor,Q)=dim H^(−i)(Ω²X,Q). Import the companion configuration-diagonal and rational-loop formulas (n≥4) to identify this with the sum of the normalized E₁ dimensions. In every degree where the actual abutment comparison also holds, this forces all differentials entering or leaving that total degree to vanish. For i>0 use cohsupport in the conservative range; extending to the printed sharp range additionally requires comparisonsharpgate. No unconditional E₁ degeneration follows.

**Planet:** Conditional E₁ degeneration.

**Dependencies:** `ExponentialSumsAndCircleMethodPartII:GCM.13/tracepairingconjecture`, `ExponentialSumsAndCircleMethodPartII:GCM.12/homloops`, `ExponentialSumsAndCircleMethodPartII:GCM.10/cohsupport`, `ExponentialSumsAndCircleMethodPartII:GCM.10/comparisonsafe`, `ExponentialSumsAndCircleMethodPartII:GCM.10/comparisonsharpgate`, `ExponentialSumsAndCircleMethodPartII:GCM.10/degenerationconjecture`, `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`, `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`, `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`, `AlgebraicTopologyPartII:AT2.3/stable-diagonal`, `AlgebraicTopologyPartII:AT2.4/tame-polynomial`, `AlgebraicTopologyPartII:AT2.4/tame-bouquet`, `AlgebraicTopologyPartII:AT2.5/double-loop-betti`.

**Construction/proof plan:**

1. Use perfection of the explicitly assumed pairing for the negative-degree dimension identity.
2. Import the configuration/rational-homotopy identity with j=−i<4(tδ−1)≤d(n−3), and compare singular and étale cohomology.
3. Where comparison is known, equality between the sum of E₁ dimensions and the abutment dimension forbids any loss on subsequent pages.
4. Treat i>0 by the support theorem, and state the sharp-range requirement separately.

**Sources and matches:**

- BS20, §7, the argument before Theorem 7.7 and Theorem 7.7, pp. 945–946. Assume K=C, d≥k−1≥2, n>2^k(k−1), a single specified topology H with continuous ι and H≃Ω²X as required by homloops, and TraceComparisonConjecture(H,ι,τ). For −4(tδ−1)<i≤0 the pairing gives dim H_c^(i+2D)(Mor,Q)=dim H^(−i)(Ω²X,Q). Import the companion configuration-diagonal and rational-loop formulas (n≥4) to identify this with the sum of the normalized E₁ dimensions. In every degree where the actual abutment comparison also holds, this forces all differentials entering or leaving that total degree to vanish. For i>0 use cohsupport in the conservative range; extending to the printed sharp range additionally requires comparisonsharpgate. No unconditional E₁ degeneration follows.

**Check:** Use compact-support cohomology on the algebraic side. Use n≥4 for the connected full double-loop space; the cubic n=3 case has multiple components. The desired E₁ dimension equality is a conclusion of the companion formulas, not an assumption obtained from the conjectured degeneration.

## Supplier contracts and remaining work

Exact existing node imports are distinguished from requested extensions. An upstream stage citation is a planning interface, not an implemented library result. Finite-torsion EDC exports require the stated adic/rational and finite-E transports.

### Parent integration note

Parent integration note, outside this review’s editable scope: ExponentialSumsAndCircleMethod:ES.0/vmv-weyl-bound imports ES.2/vinogradov-main-bound, while ES.2 imports Fourier-counting nodes in ES.1 and ES.1 imports ES.0. Its exact 206-node graph is acyclic, but collapsing all its targets to these stages gives a pre-existing stage-placement cycle. The ten exact ES.0–1 function-field inputs used by GCM.9 do not use that VMV branch. Preserve exact node execution and ask the parent owner to move the VMV corollary or refine the stage interfaces; never add an ES.5→ES.0 edge.

### R1: `SchemeAndStackFoundations:SF.0`

Import SF.0/algebraic-scheme-dimension, fibre-dimension-formula, generic-fibre-spreading and spreading-out-models at the exact node contracts cited below. Use existing scheme/morphism carriers, affine zero schemes, regular monic division and smooth projective hypersurface geometry. The only additional degree interface required is cumulative degree under a proper coordinate-hyperplane section: pure dimension drops by one and cumulative degree does not increase. LR14v2 Theorem 1.1, p.3 supplies the degree inequality; GCM proves the finite-grid application. SF.0 is itself under review; this request does not promote it to an accepted or implemented supplier.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.0/rev-affine-dimension-theorem-for-intersections`, `ExponentialSumsAndCircleMethodPartII:GCM.0/finite-projection-degree`, `ExponentialSumsAndCircleMethodPartII:GCM.0/rev-fibre-dimension-stratification`, `ExponentialSumsAndCircleMethodPartII:GCM.3/mapping`, `ExponentialSumsAndCircleMethodPartII:GCM.3/rev-smooth-projective-closure-of-x`, `ExponentialSumsAndCircleMethodPartII:GCM.6/universalpair`.

### R2: `SchemeAndStackFoundations:SF.2`

Requested étale extension: connected-geometric-generic-fibre surjectivity for étale π₁, constructibility and generic lissity for the finitely many compact-support E-complexes and maps used here, and smooth/proper base change. Current SF.2 coherent duality is not an ℓ-adic six-operation implementation. Spreading of the polynomial pair instead imports SF.0/spreading-out-models. The CohomologicalPointCounting/EtaleFoundations routes are future supplier contracts.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.3/fouriercomplex`, `ExponentialSumsAndCircleMethodPartII:GCM.6/fundamentalsurject`, `ExponentialSumsAndCircleMethodPartII:GCM.10/spread`.

### R3: `EtaleDualityAndPerverseSheaves:EDC.0`

Use the exact EDC.0/enhanced-compact-pushforward finite-torsion export, EDC.6/operation-reduction-comparisons and EDC.6/coefficient-extension-duality-and-classes. Required finite-E extension contract: bounded constructible compact direct image with exceptional base change, localization, projection formula, Künneth with Koszul symmetry, constructible supports and their cohomological dimension bounds, together with coherent filtered/enhanced models. The torsion export alone does not provide this finite-E package. GCM.7 constructs only its finite localization-filtration application, over the Mathlib spectral-object carrier.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.3/fouriercomplex`, `ExponentialSumsAndCircleMethodPartII:GCM.3/orthogonality`, `ExponentialSumsAndCircleMethodPartII:GCM.5/smallcomplex`, `ExponentialSumsAndCircleMethodPartII:GCM.5/reduced`, `ExponentialSumsAndCircleMethodPartII:GCM.7/finite-localization-filtration`, `ExponentialSumsAndCircleMethodPartII:GCM.8/rev-closed-points-detect-constructible-supports`, `ExponentialSumsAndCircleMethodPartII:GCM.8/cohweyl`, `ExponentialSumsAndCircleMethodPartII:GCM.10/spread`.

### R4: `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`

Import EDC.2:trace-purity/affine-space-trace, top-degree-compact-cohomology and EDC.2:pairings/adic-and-rational-poincare-duality, with EDC.6/adic-transport-of-duality-and-classes and coefficient-extension-duality-and-classes for finite E. Preserve products/base change and the geometric-Frobenius convention. GCM.10 uses the existing nonsmooth top-component formula only to prove its componentwise irreducibility criterion; it does not duplicate that formula or assume a trace isomorphism for an arbitrary singular scheme.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.3/orthogonality`, `ExponentialSumsAndCircleMethodPartII:GCM.5/remaindershift`, `ExponentialSumsAndCircleMethodPartII:GCM.5/reduced`, `ExponentialSumsAndCircleMethodPartII:GCM.5/middleconcentrated`, `ExponentialSumsAndCircleMethodPartII:GCM.6/universalcohom`, `ExponentialSumsAndCircleMethodPartII:GCM.10/rev-top-compact-cohomology-and-top`.

### R5: `EtaleDualityAndPerverseSheaves:EDC.4`

Import EDC.4/compact-support-vanishing-smooth-affine and EDC.4/complete-intersection-cohomology with finite-E coefficient extension. The needed outputs are compact Artin vanishing, the non-middle hyperplane-class calculation, the middle primitive kernel/quotient and its lissity in smooth proper families. These exact exports replace a generic weak-Lefschetz stage promise.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.3/rev-smooth-projective-closure-of-x`, `ExponentialSumsAndCircleMethodPartII:GCM.5/middleconcentrated`, `ExponentialSumsAndCircleMethodPartII:GCM.6/primitiveextension`.

### R6: `EtaleDualityAndPerverseSheaves:EDC.6`

Import EDC.6/complex-analytic-comparison, trace-orientation-comparison and coefficient-extension-duality-and-classes. Apply compact-support comparison to the possibly singular mapping scheme; obtain the top trace through the component/dense-smooth-open identification and the complex orientation on that open, rather than by applying smooth purity to the whole scheme. Preserve cup products and the specified finite coefficient extension.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.13/tracepairingconjecture`, `ExponentialSumsAndCircleMethodPartII:GCM.13/rev-conjecture-7-1-fails-for`, `ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration`.

### R7: `FiniteFieldsAndCharacterSums:FF.2`

Import the accepted FF.2/artin-schreier-sheaf, character-sheaf-cohomology-vanishes, translation-cancellation and dimension-from-point-counts contracts. The exact FF.2/fourier-input-for-one-modulus, proved via fourier-deligne-inversion, replaces the unavailable Katz step in BS20 Lemma 3.7. Its hypothesis is nonconstant one-variable degree D with 1≤D<p and nontrivial ψ; the conclusion is vanishing above degree two on G_m×A¹. This removes G2 without claiming the Katz book was read.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.3/fouriercomplex`, `ExponentialSumsAndCircleMethodPartII:GCM.3/orthogonality`, `ExponentialSumsAndCircleMethodPartII:GCM.5/boundarycancel`, `ExponentialSumsAndCircleMethodPartII:GCM.5/repeatedcancel`, `ExponentialSumsAndCircleMethodPartII:GCM.5/singleexponential`, `ExponentialSumsAndCircleMethodPartII:GCM.9/ddminor`.

### R8: `LefschetzPencilsAndVanishingCycles:LPV.5`

Requested extension owned by pending LefschetzPencilsAndVanishingCyclesPartII, route UniversalHypersurfaceMonodromy: universal degree-k primitive monodromy, its orthogonal/symplectic images, the two cubic exceptions, and closed algebraic-group Goursat/quotient classification needed by BS20 Lemma 4.3. Existing LPV.5 supplies pencil monodromy but does not already establish this extension. Replace this routing request by precise companion node ids once available; G4 remains open.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.6/fundamentalsurject`, `ExponentialSumsAndCircleMethodPartII:GCM.6/minusone`.

### R9: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`

Import current AlgebraicTopology Stage 4 CW boundary cofibration S¹↪D² and its based homotopy-extension property. Requested extension: parameterized compact-open restriction Map_*(A,X)→Map_*(B,X) is a Hurewicz fibration for a compact CW pair (A,B), with lifting natural in compact parameter spaces. This follows from the cofibration HEP and the compact-open exponential law but is not currently an explicit upstream target; GCM.12 only specializes it to the disc pair. This additional generic mapping-space export belongs to AlgebraicTopologyPartII; the current-stage reference routes the request until that companion has an exact target.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.12/fixedcollarloops`.

### R10: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`

Import current AlgebraicTopology Stage 8 homotopy/fibre comparison. Requested degree-one extension: for any path component, H₁(−,Z)≅π₁(−)^ab, naturally, with no simple-connectivity hypothesis; rationalize and combine with Stage 6 universal coefficients. Stage 8 currently states the higher Hurewicz theorem only for n≥2. GCM uses this extension to carry the end-winding quotient to nonzero H₁ and H¹; no new π₁ or loop-space carrier is planned. The missing generic degree-one export belongs to AlgebraicTopologyPartII; the current-stage reference routes that extension and does not claim it is already planned there.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.11/endwinding`, `ExponentialSumsAndCircleMethodPartII:GCM.11/compactcounter`, `ExponentialSumsAndCircleMethodPartII:GCM.12/fixedcollarloops`, `ExponentialSumsAndCircleMethodPartII:GCM.13/rev-conjecture-7-1-fails-for`, `ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration`.

### R11: `ExponentialSumsAndCircleMethod:ES.0`

Use the existing parent target nodes polar-forms, multivariate-polarization, polar-zero-locus, polar-dimension-bound, iterated-function-field-shrinking and short-polar-values-zero. Integration must point the parent geometric-dimension/counting inputs only to GCM.0–1, without any GCM.3–13 or whole-roadmap edge. The nonarchimedean lattice/shrinking source audit remains with its arithmetic owner.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.9/ddminor`.

### R12: `ExponentialSumsAndCircleMethod:ES.1`

Use the existing parent function-field-top-phase, function-field-polar-count, function-field-count-identity and uniform-function-field-minor-count targets, with constant independent of every finite extension degree. Wire its polynomial-box input to GCM.1, separately from the ES.5 application; never import ES.5 into ES.0.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.9/ddminor`.

### R13: `AlgebraicTopologyPartII:AT2.1`

Existing unreviewed companion nodes AT2.1/configurations and configuration-torsor supply the ordered configuration scheme, discriminant complement and finite étale S_m torsor in every characteristic; no averaging by m! in the base field is used. Exact E-coefficient invariants are legitimate in characteristic zero. Source closure of the companion remains G5.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.5/configdescent`.

### R14: `AlgebraicTopologyPartII:AT2.2`

Import the existing AT2.2/arrangement-cohomology contract with its full S_m action, ordinary Frobenius purity q^a and compact-support range m+1…2m for m>0, with m=0 a point. The packet is complete but unreviewed, so the original arrangement-source debt remains G5.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.10/E1support`.

### R15: `AlgebraicTopologyPartII:AT2.3`

Import AT2.3/stable-diagonal, including its weighted coefficient operation and d(n−3)≥j condition. Its Euler-product and character calculations remain with this existing owner; GCM has no direct FA.5 Euler-product dependency. Source closure remains G5.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration`.

### R16: `AlgebraicTopologyPartII:AT2.4`

Import AT2.4/tame-polynomial and tame-bouquet for a smooth leading form, plus the finite-type rational-loop framework used by the companion AT2.5/double-loop-betti. The Broughton/Hilton/Sullivan originals have not been independently read in this review, so G5 remains source-qualified.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration`.

### R17: `AlgebraicTopologyPartII:AT2.5`

Import AT2.5/fermat-loop-connectivity (n≥5) for the explicit compact-open obstruction, and double-loop-betti (n≥4) for the conditional general comparison. The existing companion supplies the Fermat retraction/connectivity chain and the connected full-double-loop formula. Its review/source closure remains G5.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.11/compactcounter`, `ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration`.

### R18: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`

Use the current cohomological universal-coefficient theorem to identify H¹ of a path component over Q with Hom(H₁,Q), after the explicitly requested degree-one Hurewicz/abelianization extension. The Ext term from H₀ vanishes. This does not require the whole germ space to be path connected.

Consumed by: `ExponentialSumsAndCircleMethodPartII:GCM.13/rev-conjecture-7-1-fails-for`.

### Coverage

Every layer remains `planned`, with the following implementation/interface work. None is `closed`.

**GCM.0:**

- Connect the componentwise intersection and finite-grid applications to the exact SF.0 dimension/degree interfaces; the coordinate-slicing proof resolves the former G1.

**GCM.1:**

- Formalize the finite-grid specialization with constant Δ, strict height and all boundary cases; no projection or coefficient-height audit remains.

**GCM.2:**

- Discharge the two quantified prime adapters against the pinned Dirichlet, CRT and reciprocity APIs, including the coefficient-prime-two case and finite bad-set avoidance.

**GCM.3:**

- Supply the coefficient scheme and Artin–Schreier compact-support interfaces, then verify orthogonality on the scheme-theoretic zero locus with shift +2kd and twist +kd.

**GCM.4:**

- Implement the determinantal/reduced distinction and regular inverse on good arcs; verify saturation and the odd-length ceiling threshold.

**GCM.5:**

- G5: Review and source closure of the existing configuration/loop companion
- Instantiate exceptional base change, CRT factorization, the reviewed FF.2 one-modulus input, trace normalization and exact ordered-root descent with their stated shifts.

**GCM.6:**

- G4: Universal monodromy companion and source closure
- Obtain the companion universal-monodromy exports at G4; verify primitive extension lissity, fundamental-group surjections and both cubic exceptions.

**GCM.7:**

- G4: Universal monodromy companion and source closure
- Build the finite-localization/abutment adapter over the existing spectral-object carrier and import G4 before claiming monodromy-equivariant odd-page vanishing.

**GCM.8:**

- Instantiate the extended cohomological-degree rules and all-extension closed-point detection, with N-variable indexing and coefficient conjugation kept explicit.

**GCM.9:**

- G3: Sharper minor arcs, comparison and endpoint geometry
- Formalize the imported all-extension count and conservative remainder estimate; retain the final odd-length stratum. The independent finite-grid proof resolves G1.

**GCM.10:**

- G3: Sharper minor arcs, comparison and endpoint geometry
- G5: Review and source closure of the existing configuration/loop companion
- Verify spreading of the full pair and common lisse open; close G3 for the sharp range, equality endpoint and geometric trace outside conservative irreducibility.

**GCM.11:**

- G5: Review and source closure of the existing configuration/loop companion
- Import the exact Fermat connectivity export at G5 and verify the compact-family chart and end-winding constructions; the compact-open obstruction must be retained.
- Use the explicit degree-one Hurewicz/abelianization extension; current Stage 8 only states higher Hurewicz.

**GCM.12:**

- G6: Global stronger-germ topology and algebraic inclusion
- Close the global topology, compact-family control, polynomial-inclusion continuity and fixed-collar comparison target G6; the local weighted straightening alone is insufficient.
- Obtain the stated mapping-restriction fibration extension from the Stage 4 cofibration HEP.

**GCM.13:**

- G3: Sharper minor arcs, comparison and endpoint geometry
- G5: Review and source closure of the existing configuration/loop companion
- G6: Global stronger-germ topology and algebraic inclusion
- Close the source/interface debts G3, G5 and G6 and prove or explicitly assume the stated trace conjecture; the degeneration conclusion must remain conditional.

### Open gaps

Former G1 is resolved by the finite-grid coordinate-slicing proof; former G2 is resolved by the accepted exact Fourier supplier. The following four gates remain open.

**G3: Sharper minor arcs, comparison and endpoint geometry.** The paper’s proof does not imply +4 after dropping the remainder. Current targets prove only +4(k−1), i>−4(tδ−(k−1)) and irreducibility for tδ>k−1. A new sharp estimate would give the printed strict comparison but still would not prove irreducibility at tδ=1. The geometric degree-2D trace outside the supported irreducibility range needs its own dimension/fundamental-class justification. Nothing here asserts the printed sharp theorem or equality endpoint.

Affected targets: `ExponentialSumsAndCircleMethodPartII:GCM.9/minorsharpgate`, `ExponentialSumsAndCircleMethodPartII:GCM.10/comparisonsharpgate`, `ExponentialSumsAndCircleMethodPartII:GCM.10/irreduciblesafe`, `ExponentialSumsAndCircleMethodPartII:GCM.13/tracepairingconjecture`, `ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration`.

**G4: Universal monodromy companion and source closure.** The companion LefschetzPencilsAndVanishingCyclesPartII has no packet/node ids at this snapshot. Existing LPV.5 is a routing owner, not a proof of the required universal orthogonal/symplectic product statement. Verify Katz–Sarnak 11.4.9 and the subsidiary SGA 7/Deligne–Illusie and closed algebraic-group quotient inputs there, then replace the request with exact exports. No unavailable original book was read or substituted here.

Affected targets: `ExponentialSumsAndCircleMethodPartII:GCM.6/minusone`, `ExponentialSumsAndCircleMethodPartII:GCM.7/oddpages`, `ExponentialSumsAndCircleMethodPartII:GCM.7/shiftE1`.

**G5: Review and source closure of the existing configuration/loop companion.** AlgebraicTopologyPartII already has a complete 75-node packet, with exact configuration-torsor, arrangement-cohomology, stable-diagonal, tame-bouquet, double-loop-betti and Fermat connectivity exports. Those statements and their dependency interfaces were read here and match the local uses; the packet has no independent review yet. Its arrangement, Broughton, Hilton and Sullivan original-source proofs were not independently verified in this run. Obtain that companion review/source closure, preserving n≥4 for the full connected loop formula, the n≥5 Fermat connectivity use and all actions/signs. This is a supplier qualification, not a missing-packet or missing-node claim.

Affected targets: `ExponentialSumsAndCircleMethodPartII:GCM.5/configdescent`, `ExponentialSumsAndCircleMethodPartII:GCM.10/E1support`, `ExponentialSumsAndCircleMethodPartII:GCM.11/compactcounter`, `ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration`.

**G6: Global stronger-germ topology and algebraic inclusion.** The compact-open comparison and its trace conjecture are obstructed explicitly. The fixed-radius weighted collar is sufficient only locally. Specify a global topology, prove compact-family control and coordinate compatibility, prove continuity of the polynomial inclusion, and compare with fixed collars. Neither an unspecified colimit nor pointwise O-bounds proves these assertions. The corrected trace comparison remains a conjecture even after this gate is solved.

Affected targets: `ExponentialSumsAndCircleMethodPartII:GCM.12/stronggermgate`, `ExponentialSumsAndCircleMethodPartII:GCM.12/homloops`, `ExponentialSumsAndCircleMethodPartII:GCM.13/tracepairingconjecture`, `ExponentialSumsAndCircleMethodPartII:GCM.13/conditionaldegeneration`.

## Source receipts and corrections

- **BS20**: Tim Browning and Will Sawin, *A geometric version of the circle method*, Annals of Mathematics 191 (2020), no.3, pp.893–948; DOI 10.4007/annals.2020.191.3.4. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf). Read 2026-10-19. Entire published article, §§1–7 and references, pp.893–948; formula images additionally checked at pp.893–894,898,901,903,915,920–921,934,942–943. Primary proof source. Topology counterexamples and corrected conservative bounds are explicitly identified as additions rather than attributed theorems.
  SHA-256: `f20c87e337c054e42134bf2daf577203ce4b391e0d22ff59b9425d1249c33c53`.
- **BV15**: Tim Browning and Pankaj Vishe, *Rational points on cubic hypersurfaces over F_q(t)*, Geometric and Functional Analysis 25 (2015), pp.671–732; public preprint arXiv:1502.00772. [Public source](https://arxiv.org/pdf/1502.00772). Read 2026-10-19. §2.5, Lemma 2.8 and its proof, arXiv pp.12–13. Inclusive-height statement and its projection proof read. The strict-height target is justified instead by the independent finite-grid slicing argument.
  SHA-256: `91eb60cd3ff2448581893e19824bb2f3f2e726f283d6e8335fa4821611421e3c`.
- **STACKS**: The Stacks Project Authors, *The Stacks Project: fibre dimensions and finite filtered complexes*, Online stable tags, accessed 2026-10-19. [Public source](https://stacks.math.columbia.edu). Read 2026-10-19. Lemma 37.30.3, tag 05F9, statement and proof. §12.24, tag 012K, Lemma 12.24.2; Lemma 12.24.13, tag 0BK5, statement and proof. Public replacements for the constructibility input and finite-filtration convergence. Other geometric dependencies are requested explicitly from their owners.
- **LR14v2**: Gilles Lachaud and Robert Rolland, *On the number of points of algebraic sets over finite fields*, Public preprint arXiv:1405.3027v2, 25 July 2014; the page locators refer to this version, not the later journal pagination. [Public source](https://arxiv.org/pdf/1405.3027v2). Read 2026-10-19. §1, cumulative degree and Theorem 1.1, pp.2–3; §2.1, Theorem 2.1 and affine proof of Proposition 2.3, pp.3–5. Cumulative-degree hyperplane inequality and coordinate-slicing proof. GCM adapts the latter to arbitrary finite grids in its own words and uses an inequality in place of the affine equality in Lemma 2.6 (E49). The references cited for the general Bezout theorem were not separately read; the required degree inequality is an explicit SF.0 supplier contract.
  SHA-256: `48b30c8820389dc4190c29e3cd9eba2121135daa57426308e78b7ece1c23e034`.

All 46 inherited source candidates E1–E45 and E47 have independent verdicts; E46 was not an active extraction finding. E13 and E31 are rejected for the reasons below. New findings E48 (CRT label) and E49 (affine section degree) bring the inventory to 48 candidates: 46 confirmed and two rejected. The listed source-version/erratum searches establish no priority claim. These are our own descriptions, not source excerpts.

**E1 — confirmed** (error; affects the proof), Published BS20, §5, proof of Proposition 2.6, p.934.
The minor-arc union ends one stratum too early for odd kd. End it at ceil(kd/2)−1. Independent check: For odd L=9, the coefficient vector supported at b₅ gives H₄ rank five. The displayed union ending before the last ceiling-indexed stratum misses it. This confirms a cover error independently of any numerical estimate.

**E2 — confirmed** (gap; affects a stated result), Published BS20, §2, Proposition 2.6, p.905; §5, proof, p.934.
The final minor-arc estimate replaces m by a multiple of k−1 in the wrong direction. Retain m=(k−1)q+r: B(m)=2dn−4qδ+4(r+1). This gives the conservative +4(k−1) bound; the printed +4 bound is open. Independent check: Writing m=(k−1)q+r in the stratum cutoff gives 2dn−4qδ+4(r+1). At k=3,d=4,n=24,m=5 this is 192, above the proposed global cutoff 188. The argument therefore does not establish the sharper theorem; this is a proof gap, not a counterexample to that theorem.

**E3 — confirmed** (gap; affects a stated result), Published BS20, §1, Corollary 1.4, p.898; §2, Corollary 2.9 and proof, pp.907–908.
The irreducibility argument treats the boundary value tδ=1 as inside a strict comparison range. The sharp comparison would require tδ>1 to reach i=0; the supported conservative comparison requires tδ>k−1. Independent check: The printed comparison is strict: at tδ=1 it requires i>0. Corollary 2.9 uses i=0 to obtain the component count. Its equality endpoint is not justified by that comparison; the conservative comparison needs tδ>k−1.

**E4 — confirmed** (error; affects a stated result), Published BS20, §7, Lemma 7.6, pp.944–945.
The full double-loop cohomology product is stated in a range including n=2 and n=3. Require n≥4 for this connected full-loop formula, or specify a component and supply another argument. Independent check: The standalone lemma includes n=3. For a smooth cubic Fermat fibre in three variables, the bouquet has eight 2-spheres, so π₀(Ω²X)=Z⁸ and degree-zero cohomology cannot be one-dimensional. The full connected-space formula needs n≥4.

**E5 — confirmed** (error; affects the proof), Published BS20, §7, proof of Corollary 7.5, equation (7.3), pp.943–944.
The generating-function calculation identifies an entire two-variable series with a selected weighted diagonal. Define the weighted coefficient/diagonal operation explicitly and apply the identity only to it. Independent check: Equation (7.3) removes the weighted coefficient extraction while retaining a two-variable generating series. For n=4,N=1,j=0, the full expression 1−qU differs from its selected value one. The stable diagonal statement can survive after keeping the extraction operation.

**E6 — confirmed** (misprint; affects nothing), Published BS20, §7, proof of Lemma 7.4, p.942.
The first two character sums in the configuration trace calculation are written with compact support. Use ordinary cohomology in those two sums, and invoke duality explicitly for compact support. Independent check: The page-942 image has compact-support subscripts in the two sums that use ordinary-cohomology purity. At m=1, ordinary H⁰(A¹)=E whereas compact H²(A¹)=E(−1); their traces differ by q. Duality must be inserted before switching supports.

**E7 — confirmed** (misprint; affects nothing), Published BS20, §7, last line of proof of Lemma 7.4, p.943.
The final Euler-product expression loses the exponents contributed by the Lie multiplicities. Retain the exponent −e_r on the corresponding factors. Independent check: The last product on p.943 drops the powers determined by the Lie multiplicities. Those powers occur in the preceding character product and cannot disappear under the stated substitution.

**E8 — confirmed** (misprint; affects nothing), Published BS20, §7, argument before Theorem 7.7, p.945.
The final conditional argument uses ordinary cohomology on the algebraic mapping side and invokes the desired equality too early. Use H_c throughout that side and derive the dimension identity from the configuration and loop formulas. Independent check: On p.945 the algebraic factor is written without compact supports despite the preceding conjectural pairing. The same paragraph treats the desired first-page equality as already available. The local conditional argument derives it from the two independent supplier formulas instead.

**E9 — confirmed** (misprint; affects nothing), Published BS20, §2, proof of Lemma 2.4(4), p.903.
A Hankel-kernel coefficient sum omits its last column. Sum through m+1. Independent check: The kernel vector in Lemma 2.4(4) has m+1 entries. The page-903 displayed sum stops at m; multiplying the stated matrix by that vector requires the final entry as well.

**E10 — confirmed** (misprint; affects nothing), Published BS20, §2, proof of Lemma 2.8, p.907.
The dimension of ordered configurations is assigned the value of its translation quotient. PConf_m has dimension m; the quotient by simultaneous additive translation has dimension m−1. Independent check: The proof on p.907 assigns dimension m−1 to the ordered configuration space before taking the translation quotient. PConf₁=A¹ already distinguishes the two dimensions.

**E11 — confirmed** (misprint; affects nothing), Published BS20, §3, proof of Lemma 3.2, p.910.
A localization calculation has the wrong cohomological index in its affine-line tensor factor. Use H_c^(i+2), with the corresponding twist, at that point of the argument. Independent check: The affine-line compact complex is E[−2](−1). After removing that tensor factor the corresponding cohomological index increases by two; the displayed decrease on p.910 has the opposite sign. The vanishing conclusion is unaffected.

**E12 — confirmed** (misprint; affects nothing), Published BS20, §3, proof of Lemma 3.4, p.913.
The quotient-bundle pushforward is assigned a positive cohomological shift. Rρ!E=E[−2n(d−m)](−n(d−m)). Independent check: The page-913 pushforward writes a positive shift for an affine fibre of dimension n(d−m). Its compact complex has shift −2n(d−m) and twist −n(d−m), as the lemma’s final formula itself requires.

**E13 — rejected** (misprint; affects nothing), Published BS20, §3, final paragraph of proof of Lemma 3.5, p.915.
Inherited reported claim: A final CRT denominator uses numerator names. Independent assessment: The page-915 formula image already has denominator l₁l₂. The reported numerator-name denominator is absent from the published version. A different label slip in the following sentence is recorded separately as E48. No denominator correction is warranted in the published version. See E48 for the separate label slip.

**E14 — confirmed** (misprint; affects nothing), Published BS20, §3, proof of Lemma 3.6, p.917.
The simple-pole reduction omits the pole from a congruence of rational functions. Keep λ f(g(a))/(T−a) modulo polynomials. Independent check: A congruence modulo polynomials that controls the residue must retain the factor (T−a)⁻¹. Its omission from the displayed reduction on p.917 gives a polynomial with zero residue and does not express the intended phase.

**E15 — confirmed** (misprint; affects nothing), Published BS20, §3, proof of Lemma 3.7, pp.917–918.
The generic-coordinate list in the one-root argument stops one coordinate early. Use a₂,…,a_n. Independent check: After isolating a₁, the remaining generic parameter space has coordinates a₂,…,a_n and dimension n−1. The displayed generic-coordinate lists stop at a_(n−1), while the subsequent dimension argument uses n−1 parameters.

**E16 — confirmed** (gap; affects a stated result), Published BS20, §3, Corollary 3.10, p.919.
The stratum-complex corollary omits the degree condition on its arc index. State 0≤m≤d. Independent check: Corollary 3.10 is stated without m≤d, but its use of Lemma 3.4 requires the division bundle of rank n(d−m). For m>d that construction and its shift are unavailable. The intended finite major-arc range is 0≤m≤d.

**E17 — confirmed** (misprint; affects nothing), Published BS20, §3, Figure 2, p.921 and its explanation p.920.
A diagram assigns a pushforward complex to its pre-pushforward base. Keep the U_m complex and its B_m direct image separately typed. Independent check: Figure 2 places the direct image associated with the numerator-forgetting projection on the good-arc source instead of the monic-denominator base. The source and target displayed for π₂ distinguish the two types.

**E18 — confirmed** (misprint; affects nothing), Published BS20, §4, proof of Lemma 4.3, p.924.
Two orthogonal/symplectic low-rank dimension pairs are reversed. Use (3,2) and (5,4) in the stated order. Independent check: The low-rank coincidences in the product-monodromy argument are orthogonal/symplectic dimension pairs (3,2) and (5,4). The page-924 order reverses the two group dimensions. This is a label correction, not a replacement proof of the unverified monodromy input.

**E19 — confirmed** (misprint; affects nothing), Published BS20, §4, proof of Lemma 4.4, p.925.
A relative top-cohomology identification uses the opposite Tate exponent. Use E(−(n−1)). Independent check: The relative family has smooth affine fibres of dimension n−1. Its top trace is E(−(n−1)); the positive twist on p.925 gives the opposite geometric-Frobenius weight.

**E20 — confirmed** (error; affects nothing), Published BS20, §6, opening phase calculation, p.935.
The polar calculation writes the leading homogeneous contribution as if it were the entire phase. Assert equality only for the degree-k part; retain lower-degree terms of f in e. Independent check: The opening degree-k polar computation on p.935 writes an equality with the full residue phase. Replacing f by f+1 changes that phase by b₁ while leaving all polar degree-k terms fixed. Only the top homogeneous part satisfies the displayed formula.

**E21 — confirmed** (misprint; affects nothing), Published BS20, §6, Proposition 6.2, p.936.
A coefficient-variety ambient dimension is replaced by the phase-variable dimension. The frequency ambient space is A^(kd), distinct from A^N with N=dn. Independent check: Proposition 6.2 refers to a locus in the b-coefficients, which number kd. Its ambient affine space is therefore A^(kd), whereas N=dn counts the distinct phase variables a.

**E22 — confirmed** (misprint; affects nothing), Published BS20, §6, proof of Lemma 6.4, p.938.
The shrunken counting expression changes the precision parameter with the wrong sign. Use N_(γ,a−s,c+s). Independent check: After shortening each polynomial vector by q^s, the error precision changes from c to c+s. The displayed c−s on p.938 disagrees with this substitution and with the surrounding shrinking calculation.

**E23 — confirmed** (gap; affects a stated result), Published BS20, §2, Proposition 2.5(3), p.905; §4, Proposition 4.1 p.922 and Lemma 4.3 p.923.
Standalone odd-page statements omit the cubic exceptions in the monodromy lemma. Retain (k,n)=(3,3),(3,4) as exclusions; the main n-range already excludes them. Independent check: The proof of odd-page vanishing imports Lemma 4.3, which explicitly excludes the two cubic pairs. The standalone propositions omit those exclusions. The main n>2^k(k−1) range excludes both pairs, so its use is unaffected.

**E24 — confirmed** (gap; affects the proof), Published BS20, §2, spreading argument, pp.906–907.
The spreading paragraph models coefficients of f without fully recording the fixed boundary vector. Adjoin x as well; preserve nonzero x and use a common lisse open. Spec K lies over the generic point and need not equal it. Independent check: The fixed vector determines the affine leading-coefficient constraints. A coefficient ring for f alone need not contain that vector, and Spec K can be a field extension of the generic residue field. The spreading paragraph must include the vector and the maps in the finite filtration.

**E25 — confirmed** (misprint; affects nothing), Published BS20, §2, proof of Corollary 2.9, p.908.
The top compact-cohomology argument appears to count all irreducible components from a smooth top-dimensional open. It first counts only maximal-dimensional components; use the independent componentwise lower bound to exclude lower-dimensional ones. Independent check: The smooth dense open used on p.908 counts only components of maximal dimension. A line disjoint from a point disproves the literal all-components inference. The mapping-scheme componentwise lower bound supplies the necessary final step.

**E26 — confirmed** (misprint; affects nothing), Published BS20, §6, paragraph preceding Lemma 6.4, p.937.
A polynomial lattice is placed in the wrong number of coordinates. Use F_q[T]^N in that calculation. Independent check: The polynomial lattice in the paragraph before Lemma 6.4 has one coordinate for each of the N phase variables. Its displayed n-coordinate ambient module does not match that indexing.

**E27 — confirmed** (misprint; affects nothing), Published BS20, §2, Definition 2.3, p.903.
The Hankel formula is extended to m>L without defining its row range. Define it for 0≤m≤L and explicitly saturate larger stages. Independent check: Definition 2.3 allows all m≥0 but writes a matrix with L−m rows. For m>L the literal integer shape is undefined. A finite range plus explicit saturation resolves this encoding omission; no rank claim inside 0≤m≤L is refuted.

**E28 — confirmed** (gap; affects a stated result), Published BS20, §7, equation (7.1), Lemma 7.2 and proof, pp.940–941.
The germ-space argument does not specify a topology and uses a family-uniform straightening step that fails for compact-open topology. The compact-open reading is false. Specify a stronger topology and prove the compact-family and inclusion-continuity requirements. Independent check: Equation (7.1) gives a pointwise germ condition, without topology or compact-family uniformity. The explicit escaping Fermat loop satisfies it individually but has end winding −1 in the compact-open subspace, whereas the comparison target is simply connected for n≥5. This rejects that topology interpretation, not every possible stronger topology.

**E29 — confirmed** (error; affects a stated result), Published BS20, §1, paragraph following Conjecture 1.3, p.898.
The advertised number of computed top cohomology groups uses the degeneration interval without intersecting the comparison interval. Intersect automatic degeneration with the applicable mapping comparison range. Independent check: Even granting the printed sharp comparison, k=3,d=2,n=24 gives tδ=1 and no nonpositive total degree in its strict range. The introductory count of computed top groups cannot follow from the automatic-degeneration interval without intersecting the comparison interval.

**E30 — confirmed** (gap; affects a stated result), Published BS20, §4, Lemma 4.4, p.925.
The relative stratum formula omits its upper bound on m. Require 0≤m≤d. Independent check: The relative stratum computation uses the same degree-d division bundle as the absolute formula. Lemma 4.4 therefore also needs m≤d; its statement on p.925 does not record this upper bound.

**E31 — rejected** (gap; affects the proof), Published BS20, §3, Lemmas 3.7–3.11 and Corollaries 3.10,3.12, pp.917–920.
Inherited reported claim: The middle-concentration proof uses geometric irreducibility and smooth projective closure without spelling out their derivation. Independent assessment: The standing hypotheses include smooth affine X and smooth leading projective boundary. The proof of Lemma 3.11 explicitly notes that the closure and boundary are smooth. Jacobian smoothness at infinity and connectedness of a positive-dimensional projective hypersurface give the required geometric irreducibility. Spelling out this standard consequence is useful for a formal plan, but its omission is not a source gap under the stated hypotheses. No correction to the published hypotheses is required; retain the explicit closure/irreducibility adapter as formalization detail.

**E32 — confirmed** (misprint; affects nothing), Published BS20, §3, proof of Lemma 3.11, p.920.
A hyperplane-class cohomology assertion is written for affine X where projective X̄ is intended. Use X̄ in that sentence. Independent check: The page-920 image places the affine X in the sentence assigning non-middle projective hyperplane-class cohomology. The calculation and restriction map require X̄. Affine cohomology does not have those high-degree classes.

**E33 — confirmed** (misprint; affects nothing), Published BS20, §3, Figure 2 and explanation, pp.920–921.
Two diagram arrow numbers are interchanged relative to their explanatory list. Reconcile labels 6 and 7 so the trace arrow matches its description. Independent check: In the page-921 diagram, arrow 6 is the finite-cover trace/invariants step and arrow 7 is the complex identification, opposite to the numbered prose. Their domains and codomains resolve the swap.

**E34 — confirmed** (misprint; affects nothing), Published BS20, §2, proof of Lemma 2.1, p.901.
The coefficient formula for g_j uses the coordinate index as the exponent of T. Use exponent i in a_(i,j)T^i. Independent check: The page-901 coefficient display uses T^j while summing over coefficient index i. The fixed-leading polynomial definition requires T^i, or all lower coefficients would occur at one coordinate-dependent exponent.

**E35 — confirmed** (misprint; affects nothing), Published BS20, §1, discussion of Conjecture 1.3, p.897.
The introduction points to the wrong section for the candidate continuous mapping space. Refer to §7. Independent check: The introductory reference points to §6 for the continuous mapping-space candidate, which is defined by equation (7.1) in §7. Section 6 is the arithmetic minor-arc bound.

**E36 — confirmed** (misprint; affects nothing), Published BS20, §3, proof of Lemma 3.3 p.911; §4, proofs of Lemmas 4.2,4.4 and Proposition 4.1, pp.923,925–926.
Several references and parameter-space subscripts use inconsistent labels. Use Lemma 2.4 and M_(n,k) in the affected references. Independent check: The rank-arc result invoked in Lemma 3.3 is Lemma 2.4, not a proposition. The universal pair space introduced in §4 is M_(n,k), so its other subscript variants in the cited proofs are typographical slips.

**E37 — confirmed** (misprint; affects nothing), Published BS20, §1, Figure 1 caption, p.896.
The first-page figure caption reverses its two coordinates. Use the displayed (m,s) order, including (1,−(n−2)). Independent check: The plotted first-page column is m and the second coordinate is s. The caption reverses this order at its cited point; the configuration exponent in Theorem 1.1 fixes (m,s).

**E38 — confirmed** (misprint; affects nothing), Published BS20, §1, Remark 1.5, p.898.
The small-degree example describes a tuple of zero leading entries as if it were a projective point. Describe the remaining polynomials as having degree ≤d−1. Independent check: Remark 1.5 uses a tuple of zero leading entries in projective-point notation. Such a tuple represents no projective point; the intended condition is simply that those remaining polynomials have degree at most d−1.

**E39 — confirmed** (misprint; affects nothing), Published BS20, §5, proof of Proposition 5.5, pp.930–931.
The Weyl proof sometimes uses n where the phase has N variables. Use N throughout that general argument. Independent check: Proposition 5.5 concerns a polynomial in N variables. The induction and base dimension in its proof must use N; the later application takes N=dn, so substituting n changes the bound.

**E40 — confirmed** (misprint; affects nothing), Published BS20, §5, Definition 5.1 p.927 and Proposition 5.5 proof pp.930–931.
The differencing argument treats degree k as if it stayed the exact degree after every specialization. Define V_k(G) and dd_k(G) for degree at most k and retain k in the recursion. Independent check: Specialized differences can lower the exact degree. The inductive construction must retain the upper degree parameter k: for G=a₁² the k=2 first-difference locus imposes a condition whereas its k=3 two-difference nonconstant part vanishes. This is an indexing clarification needed by the recursion.

**E41 — confirmed** (misprint; affects nothing), Published BS20, §6, proof of Lemma 6.1, p.936.
One calculation reuses the same index for a lattice block and a polynomial coefficient. Use separate block and coefficient indices. Independent check: The page-936 polarization expansion uses one index both for a vector block and for a polynomial coefficient; they have different ranges. Separate indices recover the intended coefficient sum.

**E42 — confirmed** (misprint; affects nothing), Published BS20, §6, pp.936–938.
The function-field indeterminate changes case in the lattice calculation. Use T consistently. Independent check: The lattice proof changes the case of the fixed indeterminate between displayed formulas. Its surrounding valuation and polynomial-ring notation use T; there is no independently introduced lower-case parameter.

**E43 — confirmed** (gap; affects the proof), Published BS20, §1, Remark 1.5, pp.898–899.
The small-degree dimension count applies variables-minus-equations before showing the restricted family is nonempty. Restrict the small-degree example to n≥3 (or explicitly retain the large-n hypothesis), and exhibit a constant kth root of −1 in the third coordinate to establish nonemptiness before applying the componentwise dimension bound. Independent check: The printed ambient assumption is n≥2 on p.893. For n=2 the restricted family in Remark 1.5, pp.898–899, has equation 1=0 and is empty, so its variables-minus-equations count supplies no nonempty counterexample. For n≥3 a constant kth root of −1 in the third coordinate gives the missing witness; the corrected local target states that restriction. This finding concerns the omitted qualification in the example, not the large-n corollary.

**E44 — confirmed** (misprint; affects nothing), Published BS20, §7, proof of Lemma 7.6, p.944.
The topological hypersurface model is denoted by a smash where a bouquet is intended. Use a wedge of spheres. Independent check: The p.944 model has the homology of a bouquet of spheres, and the following Hilton calculation uses its free Lie algebra. A smash has different degree and rank, so the displayed operation is a notation slip.

**E45 — confirmed** (misprint; affects nothing), Published BS20, §7, end of proof of Lemma 7.6, p.945.
The rational double-loop cohomology sentence omits its target and blurs the relation between generators and homotopy. Write Ω²X, use generators dual to rational homotopy, and require the connected full-loop situation. Independent check: The final rational-cohomology sentence needs the double-loop space as its target and the dual rational-homotopy generators. Its conclusion also presupposes the connected full-loop case, which is why the local import keeps n≥4.

**E47 — confirmed** (gap; affects nothing), Published BS20, §2, spreading pp.906–907 and Corollary 2.9 proof pp.907–908.
The finite-field and spreading arguments leave two different admissible-prime choices implicit. Separate fixed p→choice of ℓ from fixed ℓ→choice of good p, using Dirichlet and reciprocity. Independent check: The spreading argument needs arbitrarily large admissible residue characteristics for a fixed ℓ, rather than only a choice of ℓ for fixed p. Dirichlet plus reciprocity gives the missing quantified input, including ℓ=2 and finite bad-set avoidance. This records an unstated proof input, not a false prime-existence assertion.

**E48 — confirmed** (misprint; affects nothing), Published BS20, §3, final sentence of proof of Lemma 3.5, p.915.
The final symmetry instruction names h₁,h₂ although the coprime denominator factors in this proof are l₁,l₂. Interchange l₁,l₂ and the associated local numerator/remainder data. Keep the already correct denominator l₁l₂. Independent check: The page-915 formula image confirms l₁l₂ in the denominator and the following sentence switches to h₁,h₂. Only the final label instruction needs correction.

**E49 — confirmed** (error; affects the proof), arXiv:1405.3027v2, §2.1, Lemma 2.6 and the affine proof of Proposition 2.3, p.5.
Every nonempty proper affine hyperplane section is assigned the same degree as the original nondegenerate variety. Use cumulative degree of the reduced affine section at most deg X. The projective hyperplane section has degree deg X with multiplicities, and deleting its part at infinity can lower the affine degree. Independent check: This parabola satisfies the affine hypotheses of Lemma 2.6 over an algebraic closure. The strict degree loss refutes the stated equality. The inequality from Theorem 1.1 suffices for the point-bound induction, so the finite-field bound itself is not refuted.

## Suggested file and implementation boundary

The 271-line suggested file uses existing polynomial, matrix, finite-field, real/complex and continuous-map carriers. Its light definitions have real bodies: fixed-leading polynomial tuples, the finite residue sum, rank-Hankel sets, arithmetic cutoffs, shrinking phases and scalar collar interpolation. It develops no scheme, ℓ-adic complex, universal monodromy, spectral sequence or global germ-space carrier. Such targets remain in this document. The 44 theorem/example proof placeholders are honest `sorry`s; neither conjecture is installed as an axiom.

The planned module split is `TauCeti/NumberTheory/CircleMethod/Geometric/{MappingScheme,MajorArcs,MonodromyParity,CohomologicalWeyl,Comparison,InfinityGerm}.lean`, reusing the existing owners of generic geometry, cohomology and topology. The independent review records checker, graph, route, API/test, planet and elaboration results. The suggested file elaborated at the pinned build with only 44 `sorry` warnings. No proof implementation or closure of G3–G6 follows from that check.
