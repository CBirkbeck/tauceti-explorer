# K3 surfaces, Mukai moduli and holomorphic symplectic boundedness

The purpose is to turn the integral geometry of K3 surfaces into reusable moduli and boundedness theorems, and then into arithmetic applications. The first route constructs symplectic moduli spaces from Mukai vectors, uses periods and Kuga–Satake theory to control their Néron–Severi lattices, and constructs twisted K3 partners with growing discriminants. Its geometric contradictions feed the finite-field divisor Tate theorem. The second route places a number-field K3 in an orthogonal Shimura variety, turns special-divisor intersections into Picard-rank jumps, and applies the Li–Liedtke lifting argument to rational curves.

The final targets are Charles’s birational Matsusaka theorem (Theorem 3.3, pp.507–510), the K3-specific geometric inputs to his Theorems 1.3–1.4 (pp.489–490, proofs pp.520–523), and the K3 Picard-jump and rational-curve applications of Shankar–Shankar–Tang–Tayou (Theorem 1.1 and Corollary 1.3, pp.2–3, proofs pp.44–45). Each theorem below carries its characteristic, integral, deformation and model requirements. In particular, the all-characteristic fixed-square argument needs the characteristic-two birationality lemma; the growing-degree argument needs nonsuperspecialness for infinitely many partners; and the special-endomorphism argument needs a special-fiber divisor comparison. These are required proof targets, not assumptions to erase.

## Conventions and existing interfaces

A K3 surface is smooth, projective and geometrically integral, with trivial canonical sheaf and H¹(O)=0. Its ample line bundle need not be primitive. Write NS for the numerical divisor lattice, and distinguish arithmetic NS(X) from geometric NS(X_kbar). The completed cycle map is NS⊗Z_ℓ→H²_et(Z_ℓ(1)); saturation never means that the raw group map Pic→H²_et has torsion-free abelian cokernel. For complex K3 surfaces use the even unimodular Betti lattice of signature (3,19) and its ordinary determinant square class −1.

The Mukai pairing is (r,D,s)·(r′,D′,s′)=D·D′−rs′−r′s, and the sheaf vector is (rk,c₁,χ−rk). The last numerical generator is formal of degree one; it does not choose a degree-one point over an arbitrary field. For K3^[n]-type manifolds the Beauville–Bogomolov normalization is ∫α^(2n)=(2n)!q(α)^n/(n!2^n). An arbitrary IHS deformation type has its own Fujiki constant.

Use exp(+B) for the rational B-field action and the gerbe of class −[α_n] for B=α/ℓ^n. The integral twisted lattice is an explicit span, not the inverse image of the integral untwisted numerical lattice. Arithmetic transcendental cohomology is taken inside Frobenius invariants; it is distinct from the full geometric transcendental complement. Exact geometric Brauer order is a separate condition.

For the arithmetic orthogonal datum use the quadratic function Q_T(x)=−(x,x)_cup/2, with polar bilinear form −cup and Clifford relation x²=Q_T(x). Its signature is (b,2), b=20−ρ. An isometric special-endomorphism comparison therefore converts Q_T(s)=m into cup square −2m before clearing denominators. This specifies the factor of two independently of the source’s use of Q. “Hodge-generic” in SSTT means that the point avoids every special divisor (footnote 3, p.4). It does not assert maximal Mumford–Tate group.

The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Reuse `TauCeti.IntegralLattice`, with its rational ambient space and integral symmetric form; `TauCeti.Hodge.HodgeStructureOn`, with its decreasing exhaustive opposed filtration; and `LinearMap.BilinForm`. IntegralLattices and Completed/HodgeStructures supply their surrounding abstract theories. General lattice and Hodge carriers are not reconstructed here.

## Boundaries and prerequisites

General intersection/cohomology belongs to SchemeAndStackFoundations and MotivesAndAlgebraicCycles; generic relative moduli and deformation belong to AlgebraicModuliForArithmeticGeometry. Its Part II, AlgebraicModuliStableTwistedSheaves, supplies general stable/twisted sheaf stacks, gerbes and stable-map machinery. The K3 Ext calculation, symplectic forms, twisted partner geometry and Mukai comparison stay here.

ShimuraVarieties and its Part II OrthogonalIntegralModelsAndKugaSatake supply generic and integral orthogonal models, Clifford tensors, KS abelian schemes and special divisors. GrossZagierAndArithmeticHeights and its Part II GSpinSpecialDivisorHeights supply the arithmetic special-divisor infinitude theorem. GeometryOfNumbersAndQuadraticArithmetic supplies primitive embeddings, local unit norms and integral-lattice finiteness. The current Chebotarev and NumberFieldArithmetic roadmaps supply simultaneous splitting primes and canonical local completion maps.

MotivesAndAlgebraicCycles must expose early Lefschetz (1,1), Tate–Brauer and rational trace-descent interfaces separately from its late K3 Tate theorem register. The geometric partner contradiction does not import the Tate conclusion it is meant to support. Special-fiber divisor algebraicity in K3.10 can use an independently established finite-field K3 divisor theorem; it is not a consequence of generic Lefschetz (1,1) alone.

| Layer | Targets |
| --- | --- |
| K3.0 | K3 surfaces and integral cohomology |
| K3.1 | Mukai lattices and K3 moduli inputs |
| K3.2 | Symplectic moduli and integral Mukai comparisons |
| K3.3 | Zarhin’s trick for K3 surfaces |
| K3.4 | K3 linear series and finite fields |
| K3.5 | IHS deformations and arithmetic periods |
| K3.6 | Complex symplectic birational boundedness |
| K3.7 | Strong admissibility and finite NS lattices |
| K3.8 | Signed B-fields and twisted K3 partners |
| K3.9 | Arithmetic partner sequences and geometric Tate inputs |
| K3.10 | K3 arithmetic orthogonal data |
| K3.11 | Picard jumps and rational curves |

## Sources

- **Charles16.** François Charles, [Birational boundedness for holomorphic symplectic varieties, Zarhin’s trick for K3 surfaces, and the Tate conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Annals of Mathematics 184 (2016), 487–526. Full published paper, §§1–4, pp.487–523; bibliography pp.523–526.
- **SSTT22.** Ananth N. Shankar, Arul Shankar, Yunqing Tang, Salim Tayou, [Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields](https://doi.org/10.1017/fmp.2022.14), Forum of Mathematics, Pi 10 (2022), e21. Introduction §§1.1–1.5, pp.2–5; orthogonal datum and special divisors, §2 opening and §2.1, pp.7–8; integral models and special-endomorphism definitions, §§2.4–2.5, pp.10–11; §9.1, pp.44–45. The height proof is imported, not claimed read in full.
- **LMS14.** Max Lieblich, Davesh Maulik, Andrew Snowden, [Finiteness of K3 surfaces and the Tate conjecture](https://www.numdam.org/item/10.24033/asens.2215.pdf), Annales scientifiques de l’École Normale Supérieure 47 (2014), 285–308. Proposition 2.1.2–2.1.3, pp.287–288; §2.3 and Proposition 2.4.1 with proof, pp.291–293; §§3.1–3.5, pp.293–305, in particular Definitions 3.3.1–3.3.6, Proposition 3.4.2, Lemmas 3.5.1–3.5.2 and Proposition 3.5.6.
- **Andre96.** Yves André, [On the Shafarevich and Tate conjectures for hyper-Kähler varieties](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0305/LOG_0026.pdf), Mathematische Annalen 305 (1996), 205–248; GDZ scans split by article section. §1, pp.205–210, including Main Lemma 1.7.1; §9, pp.240–244, including Lemma 9.3.1, read in the second GDZ segment.
- **LL12v2.** Jun Li, Christian Liedtke, [Rational curves on K3 surfaces](https://arxiv.org/pdf/1012.3777v2), arXiv:1012.3777v2; published Inventiones Mathematicae 188 (2012), 713–727. §3 Proposition 3.2 and Theorem 3.3 with proof, pp.9–11 in the acquired v2; published §4 numbering cited by SSTT has not been reconciled.

The sources determine the mathematical interfaces below. The source-proof obligations at the end distinguish the theorem to build from the additional hypotheses or comparisons needed by a cited proof. The version-specific Li–Liedtke numbering is retained explicitly.

## K3.0 — K3 surfaces and integral cohomology

K3 surfaces with arbitrary ample polarizations, numerical/arithmetic/geometric NS conventions, primitive integral first Chern classes and the even unimodular K3 Betti lattice; lifting at most ten divisor classes, with ramified-Witt and unramified-Witt lifts distinguished.

<a id="K3-0-k3-surface"></a>

### K3.0/k3-surface — K3 surfaces

**Definition.** Over a field k, a K3 surface is a smooth projective geometrically integral surface X/k with ω_X ≅ O_X and H¹(X,O_X)=0. A polarization is an ample invertible sheaf H; it need not be primitive. Base change is part of the structure interface, not a chosen equation for X.

**Prerequisites:** `SchemeAndStackFoundations:SF.2`.

**Construction or proof.**

1. Specialize smooth projective surface geometry and coherent cohomology to these two conditions.
2. Transport canonical sheaf and cohomology through field extension using proper base change.

**API.**

- `K3Surface.baseChange` (functoriality): Field extension preserves K3 surfaces, with identity and composition comparisons.
- `K3Surface.canonicalTrivial` (projection): The canonical invertible sheaf admits a trivialization.
- `K3Surface.h1_zero` (projection): H¹(O_X)=0; prove Pic⁰ is trivial as a consequence, rather than identifying Pic with a numerical quotient by definition.
- `K3Polarization.tensorPower` (constructor): Every positive tensor power of an ample polarization is allowed.

**Uses.** Charles16 Theorems 2.4 and 2.10: Admits nonprimitive input polarizations and moduli after field extension.; K3SurfacesAndSymplecticBoundedness:K3.0/ns-lattice: The numerical and geometric néron–severi lattices target uses this k3 surfaces interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.1/hilbert-points: The hilbert schemes of points on k3 surfaces target uses this k3 surfaces interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.7/superspecial: The superspecial k3 surfaces target uses this k3 surfaces interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.11/rational-curves-criterion: The the li–liedtke lifting criterion target uses this k3 surfaces interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. A smooth quartic in P³ has ω=O and H¹(O)=0 by adjunction and the hypersurface sequence.
2. An abelian surface has trivial ω but H¹(O) of dimension two, and is excluded.
3. For an ample H on a K3, H² as a tensor square is still a polarization even when its class is divisible by two.

**Acceptance:** Dimension is two; geometric integrality is required.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §§1–2.1, pp.487–493.

<a id="K3-0-ns-lattice"></a>

### K3.0/ns-lattice — Numerical and geometric Néron–Severi lattices

**Definition.** Define NS_num(X) as divisor classes modulo numerical equivalence with their integral intersection pairing; distinguish it from NS_num(X_kbar). For K3 surfaces identify Pic(X) with NS_num(X), and use the torsion-free geometric Picard group for its geometric lattice. The comparison to TauCeti.IntegralLattice uses rationalization of this finite-rank group as ambient space.

**Prerequisites:** [K3.0/k3-surface](#K3-0-k3-surface), `SchemeAndStackFoundations:SF.5`, `tauceti:TauCeti.IntegralLattice`.

**Construction or proof.**

1. Use Pic⁰=0, K3 Riemann–Roch and Hodge index to identify the numerical kernel.
2. Place the lattice in its own rational span, preserving the integral bilinear form.

**API.**

- `K3.nsBaseChange` (data): The injective pullback NS(X)→NS(X_kbar) preserves intersection.
- `K3.picEquivNS` (equivalence): Pic(X) agrees with the numerical lattice for a K3 surface.
- `K3.nsIntegralLattice` (compatibility): Its rational ambient lattice has the same carrier and integral form as TauCeti.IntegralLattice.
- `K3.nsSignature` (characterisation): For projective geometric X the real signature is (1,ρ−1).

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.0/cycle-lattice: The primitive cycle classes and the k3 cohomology lattice target uses this numerical and geometric néron–severi lattices interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.4/nef-linear-series: The k3 positive classes and linear series target uses this numerical and geometric néron–severi lattices interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.7/admissible: The admissible symplectic triples target uses this numerical and geometric néron–severi lattices interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.10/transcendental-datum: The the transcendental orthogonal datum of a k3 target uses this numerical and geometric néron–severi lattices interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. A geometric rank-one lattice generated by H with H²=2d has Gram matrix [2d].
2. Replacing X by X_kbar is not an equality of arithmetic Picard groups without a descent hypothesis.
3. The lattice realization evaluates on c₁(L),c₁(M) as the intersection number L·M, including negative root squares −2.

**Acceptance:** Arithmetic and geometric ranks are separate invariants.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §2.1, p.492.

<a id="K3-0-cycle-lattice"></a>

### K3.0/cycle-lattice — Primitive cycle classes and the K3 cohomology lattice

**Theorem.** For a K3 surface and ℓ invertible in k, geometric H²_et(X_kbar,Z_ℓ(1)) is free of rank 22, has perfect cup pairing, and Pic(X_kbar)⊗Z_ℓ embeds with torsion-free cokernel. Pic is torsion-free. Over C the integral Betti lattice is even unimodular of signature (3,19), hence has plain determinant square class −1. The arithmetic H² is not identified with geometric H².

**Prerequisites:** [K3.0/ns-lattice](#K3-0-ns-lattice), `SchemeAndStackFoundations:SF.2`, `MotivesAndAlgebraicCycles:MC.2`, `ComplexComparisonPartII:C5`, `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, `ComplexComparisonPartII:C5/proper-pure-hodge`.

**Construction or proof.**

1. Use Kummer and torsion-freeness to obtain the saturated completed first-Chern map.
2. Use the K3 Betti computation and comparison for rank and pairing; determinant sign is (−1)^19.

**Acceptance:** Use Pic⊗Z_ℓ, not the raw Pic→Z_ℓ-module cokernel. Check determinant convention is the ordinary Gram determinant.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §2.1, p.492; §2.4 proof; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Huybrechts author draft, Chapter1 §3, pp16–18, Proposition3.5 and Remark3.7; LMS Lemma3.5.2 p302; [SSTT22](https://doi.org/10.1017/fmp.2022.14), §9.1, p.44.

<a id="K3-0-picard-lift"></a>

### K3.0/picard-lift — Lifting Picard data

**Theorem.** A K3 surface over an algebraically closed field of characteristic p>0 with at most ten line bundles, one ample, admits a projective characteristic-zero lift over a finite flat extension of its Witt ring carrying all those line bundles. A finite-height K3 admits a Picard-preserving lift in the Lieblich–Maulik scope. A finite ramified Witt extension is not replaced by W itself.

**Prerequisites:** [K3.0/cycle-lattice](#K3-0-cycle-lattice), `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Construction or proof.**

1. For finite height request the Picard-lifting theorem.
2. For infinite height use the polarized deformation space of dimension 19; imposing s−1 more line bundles cuts by at most s−1 equations. The infinite-height locus has dimension 9, so s≤10 gives a finite-height deformation.
3. Algebraize with the ample bundle and apply the finite-height case.

**Acceptance:** The ample class is counted among the ten. W-lifting used in K3.3 is a stronger separate hypothesis.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 1.5, p.491; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 1.5 proof; Lieblich–Maulik 2014 Cor.4.2; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 1.5 proof; Artin 1974.

## K3.1 — Mukai lattices and K3 moduli inputs

The algebraic and prime-to-characteristic Mukai lattices, vector (rk,c₁,χ−rk), Riemann–Roch, condition (C), coprimality implying Gieseker stability, IHS manifolds and Hilbert schemes of K3 points.

<a id="K3-1-mukai-lattice"></a>

### K3.1/mukai-lattice — Mukai lattices

**Definition.** For a K3 surface define H̃_ℓ=H⁰_et⊕H²_et(1)⊕H⁴_et(2), with pairing (a,b,c)·(a′,b′,c′)=b·b′−ac′−a′c. Define the integral algebraic lattice N(X)=Z⊕NS_num(X)⊕Zω using a formal numerical top-degree generator ω of degree one. This notation does not assert the existence of a degree-one closed point or zero-cycle over arbitrary k.

**Prerequisites:** [K3.0/cycle-lattice](#K3-0-cycle-lattice), `tauceti:TauCeti.IntegralLattice`, `mathlib:LinearMap.BilinForm`.

**Construction or proof.**

1. Form the orthogonal sum of the NS lattice and the hyperbolic plane with cross pairing −1.
2. Use the normalized trace to compare its ℓ-adic algebraic realization.

**API.**

- `Mukai.mk` (constructor): Create the triple (r,D,s); equality is componentwise.
- `Mukai.pair` (data): The displayed integral symmetric pairing is bilinear.
- `Mukai.baseChange` (functoriality): Pullback fixes the rank and numerical top generator and pulls back D.
- `Mukai.hyperbolic` (compatibility): The rank/top summand has Gram matrix [[0,−1],[−1,0]] in that ordered basis.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.1/mukai-vector: The mukai vectors of sheaves target uses this mukai lattices interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.1/condition-c: The condition (c) target uses this mukai lattices interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.2/theta: The mukai comparison maps target uses this mukai lattices interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.3/rank-two-plane: The primitive norm-two plane target uses this mukai lattices interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.8/exponential: The rational mukai exponentials target uses this mukai lattices interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. (1,0,0)·(0,0,1)=−1 and both individual squares are zero.
2. (1,0,−1)²=2; (1,0,1)²=−2.
3. (0,H,0)²=2d whenever H²=2d; this is the NS inclusion as an isometry.

**Acceptance:** Coefficient Tate twists are explicit.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Definition 2.1(i), p.492; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Definition 2.1(ii), pp.492–493.

<a id="K3-1-mukai-vector"></a>

### K3.1/mukai-vector — Mukai vectors of sheaves

**Construction.** For a coherent sheaf F on a K3 surface set v(F)=(rk F,c₁(F),χ(F)−rk F). Extend additively to K₀ and compare with ch(F)√td_X. For an invertible sheaf D tensoring acts by exp(D):(r,c,s)↦(r,c+rD,s+c·D+rD²/2). This integral formula uses the even K3 intersection form.

**Prerequisites:** [K3.1/mukai-lattice](#K3-1-mukai-lattice), `SchemeAndStackFoundations:SF.5`.

**Construction or proof.**

1. Compute td_X=1+2ω and its square root, using surface Riemann–Roch.
2. Chern characters make exact-sequence additivity and tensor compatibility explicit.

**API.**

- `K3.mukaiVector` (data): Assign the numerical triple to a coherent sheaf or K₀ class.
- `K3.mukaiVector_exact` (relation): A short exact sequence gives an additive identity.
- `K3.mukaiVector_tensor` (compatibility): Tensor by O(D) agrees with the integral exponential action.
- `K3.mukaiVector_ideal` (simp): For a length-n ideal sheaf I_Z, v(I_Z)=(1,0,1−n).

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.1/mukai-rr: The mukai riemann–roch target uses this mukai vectors of sheaves interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. v(O_X)=(1,0,1), of square −2.
2. v(k(x))=(0,0,deg x); geometric length-one points give (0,0,1).
3. v(I_Z)²=2n−2, so length two gives norm two and the empty subscheme gives norm −2.

**Acceptance:** The third component is χ−rk, not χ.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Definition 2.1(iii), p.493.

<a id="K3-1-mukai-rr"></a>

### K3.1/mukai-rr — Mukai Riemann–Roch

**Theorem.** For coherent sheaves F,G on a K3 surface, Σ_i(−1)^i dim Ext^i(F,G)=−v(F)·v(G). Extend to perfect complexes by additivity.

**Prerequisites:** [K3.1/mukai-vector](#K3-1-mukai-vector), `SchemeAndStackFoundations:SF.5`.

**Construction or proof.**

1. Apply surface Grothendieck–Riemann–Roch to RHom and use the dual Chern character.

**Acceptance:** χ(O_X,O_X)=2 while v(O_X)²=−2.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 2.2, p.493.

<a id="K3-1-condition-c"></a>

### K3.1/condition-c — Condition (C)

**Definition.** For a polarized K3 (X,H), condition (C) on v=(r,D,s) means v is primitive in N(X), r>0, v²>0, and gcd(r,D·H,s)=1. Primitivity refers to the whole numerical Mukai lattice; H need not be primitive.

**Prerequisites:** [K3.1/mukai-lattice](#K3-1-mukai-lattice).

**Construction or proof.**

1. Combine the four arithmetic and positivity predicates on an actual lattice vector.

**API.**

- `Mukai.ConditionC` (characterisation): The four displayed conditions are jointly necessary and sufficient.
- `Mukai.ConditionC.primitive` (projection): No integer >1 divides all components in N(X).
- `Mukai.ConditionC.baseChange` (compatibility): Transport requires primitivity and the same coprimality data on the extended lattice; it is not automatic for arbitrary nonprimitive lattice embeddings.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.1/coprime-stability: The no strictly semistable sheaves target uses this condition (c) interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. (1,0,−1) satisfies (C) for every polarization.
2. (1,0,0) fails the positive-square condition despite rank and gcd being one.
3. (2,0,−2) has positive square but is not primitive and has gcd two.

**Acceptance:** Positivity and coprimality are distinct requirements.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Definition 2.3, p.493.

<a id="K3-1-coprime-stability"></a>

### K3.1/coprime-stability — No strictly semistable sheaves

**Theorem.** If v satisfies (C), every H-Gieseker-semistable torsion-free sheaf with vector v is stable, including after algebraic closure when (C) holds geometrically.

**Prerequisites:** [K3.1/condition-c](#K3-1-condition-c), `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Construction or proof.**

1. Equality of reduced Hilbert polynomials forces proportional rank, linear and constant coefficients.
2. The gcd condition forces the rank of a destabilizing equal-polynomial subsheaf to be a multiple of r, contradicting properness.

**Acceptance:** Use the actual Hilbert polynomial, not slope stability.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.4 proof, p.494.

<a id="K3-1-ihs"></a>

### K3.1/ihs — Irreducible holomorphic symplectic manifolds

**Definition.** An IHS manifold is a compact simply connected Kähler complex manifold X with H⁰(X,Ω²_X) one-dimensional, generated by an everywhere nondegenerate holomorphic two-form. Its dimension is 2n with n≥1. Projectivity is an additional property, not part of this definition.

**Prerequisites:** `tauceti:TauCeti.Hodge.HodgeStructureOn`, `ComplexComparisonPartII:C5`, `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, `ComplexComparisonPartII:C5/kaehler-hodge-decomposition`.

**Construction or proof.**

1. Use the existing complex-manifold, differential-form and Hodge carriers through their owners; impose the geometric conditions.

**API.**

- `IHS.dimension_even` (structure): A nondegenerate holomorphic two-form forces even complex dimension.
- `IHS.symplecticLine` (data): The space H⁰(Ω²) is a line, independent of a generator.
- `IHS.isomorphismInvariant` (functoriality): Biholomorphism preserves IHS structure.
- `IHS.hodgeStructure` (compatibility): H² receives the existing pure weight-two HodgeStructureOn; the geometry supplies the filtration.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.1/hilbert-points: The hilbert schemes of points on k3 surfaces target uses this irreducible holomorphic symplectic manifolds interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.2/bb-form: The beauville–bogomolov forms target uses this irreducible holomorphic symplectic manifolds interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.5/positive-projectivity: The positive classes and ihs projectivity target uses this irreducible holomorphic symplectic manifolds interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.6/birational-transport: The picard and section transport target uses this irreducible holomorphic symplectic manifolds interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.7/admissible: The admissible symplectic triples target uses this irreducible holomorphic symplectic manifolds interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. A complex K3 surface is IHS with n=1.
2. A complex two-dimensional torus has a symplectic form but fails simple connectedness.
3. A product of two K3 surfaces has at least two independent holomorphic two-forms and is excluded.

**Acceptance:** An arbitrary symplectic variety is not an IHS manifold.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §1.1 p.488; §3.2.

<a id="K3-1-hilbert-points"></a>

### K3.1/hilbert-points — Hilbert schemes of points on K3 surfaces

**Construction.** For n≥1, construct X^[n] representing finite flat length-n subschemes of a K3 surface. It is smooth projective of dimension 2n, with the Hilbert–Chow morphism to SymⁿX. Over C it is IHS; describe the open locus with at most one double point and its exceptional divisor. Import general Hilbert representability.

**Prerequisites:** [K3.0/k3-surface](#K3-0-k3-surface), [K3.1/ihs](#K3-1-ihs), `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Construction or proof.**

1. Apply the surface Hilbert-scheme theorem and its symplectic construction.
2. Compute low-degree integral cohomology through the Hilbert–Chow open stratum; the blowup quotient describes only that stratum.

**API.**

- `K3.hilbertPoints` (constructor): The scheme represents length-n finite flat subschemes with universal family.
- `K3.hilbertChow` (data): Send a subscheme to its support cycle with lengths.
- `K3.hilbertPoints_baseChange` (functoriality): Hilbert points and their universal family commute with field extension.
- `K3.hilbertPoints_one` (equivalence): X^[1]≅X.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.2/stable-moduli: The stable-sheaf moduli on k3 surfaces target uses this hilbert schemes of points on k3 surfaces interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.2/hodge-moduli: The low-degree hodge and crystalline control target uses this hilbert schemes of points on k3 surfaces interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.8/isotropic-partner: The isotropic twisted k3 partners target uses this hilbert schemes of points on k3 surfaces interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. n=1 gives X and an identity Hilbert–Chow map.
2. Two distinct geometric points give a single point over their symmetric cycle.
3. At a doubled point for n=2 the Hilbert–Chow fiber is P¹, so the map is not an isomorphism.

**Acceptance:** For n≥2, H²_Betti is torsion-free and H³_Betti=0.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.4; Proposition 2.6 proof, pp.494–498; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 2.6 proof, p.498; Beauville 1983 §6.

## K3.2 — Symplectic moduli and integral Mukai comparisons

Smooth projective geometrically irreducible stable-sheaf moduli of dimension v²+2, Hilbert-scheme deformation type, normalized BB form and Fujiki identity, integral cohomological/algebraic θ, p-primary cokernel, low-degree Hodge/crystalline control, saturated specialization and the rational-factor discriminant formula.

<a id="K3-2-stable-moduli"></a>

### K3.2/stable-moduli — Stable-sheaf moduli on K3 surfaces

**Theorem.** For a polarized K3 (X,H) and v satisfying (C), the coarse moduli space M_H(v) is smooth projective geometrically irreducible of dimension v²+2, has a nondegenerate algebraic two-form, and after suitable characteristic-zero lifting is deformation equivalent to a Hilbert scheme of points on a K3 surface. In characteristic zero its complex fibers are IHS. This does not say that every such moduli space is birational to a Hilbert scheme.

**Prerequisites:** [K3.1/coprime-stability](#K3-1-coprime-stability), [K3.1/mukai-rr](#K3-1-mukai-rr), [K3.0/picard-lift](#K3-0-picard-lift), [K3.1/hilbert-points](#K3-1-hilbert-points), `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Construction or proof.**

1. Import projectivity, boundedness and relative stable-sheaf construction from the moduli owner.
2. Use Ext² trace and Serre duality to identify the obstruction-free tangent space and symplectic pairing.
3. Lift the required determinant/polarization data and apply the K3 moduli nonemptiness and deformation theorem.

**Acceptance:** For v=(1,0,1−n), recover X^[n] for n≥2. The form belongs to Ω² of the moduli space, not of X.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.4(i), pp.493–495; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.4(i),(ii), pp.493–495.

<a id="K3-2-bb-form"></a>

### K3.2/bb-form — Beauville–Bogomolov forms

**Construction.** For a K3^[n]-type moduli space M_H(v) of dimension 2n, construct the prime-to-p integral Beauville–Bogomolov quadratic form q, normalized by (2n)!q(α)^n=n!2^n∫_M α^(2n), with the positive sign on ample classes. It restricts to an ℓ-independent form on NS(M) valued in Z[1/p] when char k=p>0, and in Z in characteristic zero. For general complex IHS use its integral Beauville–Bogomolov form and its own positive Fujiki constant; the displayed constant is specific to K3^[n] type.

**Prerequisites:** [K3.2/stable-moduli](#K3-2-stable-moduli), [K3.1/ihs](#K3-1-ihs), `tauceti:TauCeti.IntegralLattice`, `MotivesAndAlgebraicCycles:MC.2`.

**Construction or proof.**

1. Normalize on Hilbert schemes, transport through smooth proper deformation and compare ℓ-adic cup powers.
2. Descent of the numerical form follows from compatible cycle classes.

**API.**

- `K3Moduli.bbForm` (data): A quadratic form on H² with its associated symmetric pairing.
- `K3Moduli.fujiki` (characterisation): The top-power identity and positivity specify the normalization on K3^[n] type.
- `K3Moduli.bbNS` (compatibility): The numerical NS form realizes in each prime-to-p cohomology theory.
- `IHS.bbBirational` (functoriality): The integral form is invariant under the H² isomorphism of birational IHS manifolds.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.2/theta: The mukai comparison maps target uses this beauville–bogomolov forms interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.3/descent-refinement: The prime-to-n classes and descent exponents target uses this beauville–bogomolov forms interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.5/positive-projectivity: The positive classes and ihs projectivity target uses this beauville–bogomolov forms interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.6/birational-transport: The picard and section transport target uses this beauville–bogomolov forms interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.7/admissible: The admissible symplectic triples target uses this beauville–bogomolov forms interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. For n=1 the identity gives q(α)=∫α².
2. For n=2 one has ∫α⁴=3q(α)², detecting a factor-of-two normalization error.
3. In X^[n] for n≥2 the half-exceptional class δ has q(δ)=−2(n−1), not the square of the full exceptional divisor.

**Acceptance:** Do not impose the Hilbert-scheme Fujiki constant on arbitrary IHS deformation types.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.4(iii), equation (2.1), pp.493–495; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.4(iv); Definition 2.5, pp.493–497.

<a id="K3-2-theta"></a>

### K3.2/theta — Mukai comparison maps

**Construction.** For v satisfying (C), construct a canonical Galois-equivariant ℤ_ℓ-isometry θ_v:v^⊥→H²_et(M_H(v)_kbar,Z_ℓ(1)) for ℓ≠p. Over finite or algebraically closed k, construct the integral algebraic injection v^⊥∩N(X)→NS(M_H(v)) with p-primary cokernel in characteristic p and zero cokernel in characteristic zero. An arbitrary base field retains the geometric map and the stated descent restrictions.

**Prerequisites:** [K3.2/bb-form](#K3-2-bb-form), [K3.1/mukai-lattice](#K3-1-mukai-lattice), `MotivesAndAlgebraicCycles:MC.0`, `MotivesAndAlgebraicCycles:MC.2`.

**Construction or proof.**

1. Use a quasi-universal sheaf with similitude ρ and the degree-two component of its normalized Chern correspondence.
2. Prove independence after restriction to v^⊥; divide by ρ rationally first, then prove integrality by the geometric Mukai theorem.
3. Use completed Chern-class saturation and Br(k)=0 for finite fields for algebraic descent. For the dual correspondence use H^(4n−2)(2n−1), with the hard-Lefschetz cup power of an ample class.

**API.**

- `Mukai.theta` (data): The integral cohomological isometry on v^⊥.
- `Mukai.theta_algebraic` (compatibility): The integral algebraic map commutes with completed first Chern classes.
- `Mukai.theta_galois` (functoriality): θ commutes with geometric Galois action and eligible base change.
- `Mukai.theta_cokernel` (characterisation): Only p-primary algebraic cokernel remains in characteristic p; in characteristic zero it vanishes.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.2/theta-specialization: The saturation under specialization target uses this mukai comparison maps interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.2/mukai-discriminant: The corrected mukai discriminant relation target uses this mukai comparison maps interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.3/zarhin: The zarhin’s trick for k3 surfaces target uses this mukai comparison maps interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.3/descent-refinement: The prime-to-n classes and descent exponents target uses this mukai comparison maps interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.7/line-lift: The lifting the auxiliary moduli line bundle target uses this mukai comparison maps interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.8/isotropic-theta: The isotropic mukai quotient comparisons target uses this mukai comparison maps interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. For v=(1,0,−1), the domain contains NS(X) and (1,0,1) of square −2.
2. The image of every x has q(θ(x))=x², including the negative exceptional direction.
3. A rational normalized correspondence does not count as this integral construction until its denominators are removed.

**Acceptance:** A quasi-universal sheaf alone does not justify integral division.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.4(v), pp.494–497; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.4(vi), pp.494–497; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.4(vii), pp.494–497; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.4(vi),(vii) proof, pp.495–497.

<a id="K3-2-hodge-moduli"></a>

### K3.2/hodge-moduli — Low-degree Hodge and crystalline control

**Theorem.** If a K3 sheaf moduli space of dimension 2n lifts over W(k), then Hodge–de Rham degenerates at E₁ when p>2n. In the source low-degree regimes h¹⁰=h⁰¹=0 for p>2 and, for n≥2 and p>3, h²⁰=h⁰²=1 and h¹¹=21. Establish freeness of H²_crys and H³_crys in precisely the small-degree unramified lifting range used by the comparison; do not infer it from rational comparison.

**Prerequisites:** [K3.2/stable-moduli](#K3-2-stable-moduli), [K3.1/hilbert-points](#K3-1-hilbert-points), `CrystallineCohomology:CR.2`, `CrystallineCohomology:CR.3`, `CohomologyComparisons:CP.5`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

**Construction or proof.**

1. Use integral H² and H³ of the complex Hilbert scheme, smooth proper transport and unramified small-weight comparison.
2. The unrestricted Fontaine–Laffaille range is [0,p−2]; state the degree-two/three torsion-freeness input separately if p=3 or an endpoint is used.
3. Degeneration in a low total degree is a separate conclusion from full E₁ degeneration in all degrees.

**Acceptance:** Keep n=1 out of h¹¹=21 (a K3 has h¹¹=20). p>dimension is not silently weakened for full degeneration.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 2.6 first conclusion, p.498; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 2.6(1), p.498; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 2.6 proof; Fontaine–Messing 1987; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 2.6(2), p.498.

<a id="K3-2-theta-specialization"></a>

### K3.2/theta-specialization — Saturation under specialization

**Theorem.** For a W-lifted K3 moduli space in the hypotheses of Charles Corollary 2.7 (p>2), identify the integral generic algebraic Mukai map with the special one and prove the completed NS specialization has torsion-free cokernel. This target requires the integral specialization theorem and its exact torsion hypotheses.

**Prerequisites:** [K3.2/theta](#K3-2-theta), [K3.2/hodge-moduli](#K3-2-hodge-moduli), `CohomologyComparisons:CP.5`.

**Construction or proof.**

1. Compare the generic integral θ with the special θ via smooth proper base change.
2. Apply the source-qualified specialization theorem; it cannot be replaced by injectivity after tensoring Q_ℓ.

**Acceptance:** No claim that an arbitrary Pic→ℓ-adic module map has torsion-free cokernel.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Corollary 2.7, p.499.

<a id="K3-2-mukai-discriminant"></a>

### K3.2/mukai-discriminant — Corrected Mukai discriminant relation

**Theorem.** Let K=v^⊥∩N(X), I=[N(X):Zv⊕K], and J=[NS(M_H(v)):θ(K)] in the finite/algebraically closed scope. Then I divides v², J=p^a in characteristic p (J=1 in characteristic zero), and |disc NS(X)|=J²(v²/I²)|disc NS(M_H(v))|. The factor v²/I² is positive rational and at most v²; it need not be integral.

**Prerequisites:** [K3.2/theta](#K3-2-theta), `tauceti:TauCeti.IntegralLattice`.

**Construction or proof.**

1. Use the finite-index identity disc(Zv⊕K)=I²disc N(X).
2. Use disc K=J²disc NS(M) and |disc N(X)|=|disc NS(X)|.
3. Pairing with primitive v shows the index divides v².

**Acceptance:** For v=(1,0,−1), I=2, v²=2, and the factor is 1/2. For p odd and v²=2, the rational factor is a p-adic unit.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Corollary 2.8, pp.499–500, corrected by its index proof; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Corollary 2.8 literal statement, p.499; index calculation.

## K3.3 — Zarhin’s trick for K3 surfaces

For d>0 construct uniform r,N,a,b and fourfold Mukai moduli for H²=2md under the congruence and square-residue conditions. Include primitive norm-two plane, positive class, prime-to-n ample refinements, arbitrary-field Chern descent and the W-lifting refinement. Keep the sixfold descent variant distinct.

<a id="K3-3-rank-two-plane"></a>

### K3.3/rank-two-plane — Primitive norm-two plane

**Theorem.** In Λ_2d=⟨2d⟩⊕U with (e,f)=1, let v=e+f and w=kh+e, where k≥1 and d≥1. Their span is primitive, has positive-definite Gram matrix [[2,1],[1,2dk²]], and l=2w−v lies in v^⊥ with l²=2(4dk²−1). If an odd integer n divides k then l² is prime to n.

**Prerequisites:** [K3.1/mukai-lattice](#K3-1-mukai-lattice), `GeometryOfNumbersAndQuadraticArithmetic:GN.2`.

**Construction or proof.**

1. Compute all pairings and the minor-one primitivity certificate in the coordinates (h,e,f).
2. The determinant 4dk²−1 is positive; l is orthogonal by its definition.

**Acceptance:** For d=k=1 the determinant is 3 and l²=6. No nonprimitive rank-two lattice is fed into the embedding theorem.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.10 proof, p.503.

<a id="K3-3-zarhin"></a>

### K3.3/zarhin — Zarhin’s trick for K3 surfaces

**Theorem.** For every positive integer d there exist positive integers r,N and nonzero integers a,b such that, for any field k and polarized K3 (X,H) with H²=2md, m>0, m≡1 mod N, gcd(m,ab)=1, and a,b squares modulo m, there exists v satisfying (C) with c₁(v) rationally proportional to H, dim M_H(v)=4, and a line bundle L on M_H(v) with L⁴=r and q(L)>0. The constants depend on d, not on k,X,H,m.

**Prerequisites:** [K3.3/rank-two-plane](#K3-3-rank-two-plane), [K3.2/theta](#K3-2-theta), [K3.2/stable-moduli](#K3-2-stable-moduli), `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, [K3.3/descent-refinement](#K3-3-descent-refinement).

**Construction or proof.**

1. Request the primitive rank-two embedding theorem into Λ_2md, with the corrected primitivity assumption and all small-prime exclusions absorbed in N.
2. Transport v,w,l; arrange positive rank by a Mukai-lattice automorphism. The pairing v·w=1 gives the gcd and primitivity conditions.
3. Use integral θ in the finite/algebraically closed case and the descent exponent in the arbitrary-field case.

**Acceptance:** Positive square of L is not ampleness of L. r is uniform but may change when the prime-to-n refinement is chosen.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.10(i)–(iii), pp.502–504; Theorem 1.1.

<a id="K3-3-descent-refinement"></a>

### K3.3/descent-refinement — Prime-to-n classes and descent exponents

**Theorem.** For the Zarhin construction and any n with gcd(n,6)=1 over arbitrary k, one can require q(L) integral and prime to n and construct an ample A with integral q(A) prime to n. Over finite or algebraically closed k it suffices that n is odd. In the arbitrary-field fourfold case use that a geometric line bundle has its 324th power descend, with 324=∫c₄(M); this explains the excluded factor three. The six-dimensional variant uses ∫c₆=3200 and has different dimension and exclusions.

**Prerequisites:** [K3.3/rank-two-plane](#K3-3-rank-two-plane), [K3.2/theta](#K3-2-theta), [K3.2/bb-form](#K3-2-bb-form), `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Construction or proof.**

1. Take k in the plane calculation divisible by n to obtain l² prime to n.
2. Choose an ample class in a congruence class preserving the desired norm modulo n.
3. Use the top-Chern zero-cycle to kill the descent obstruction; do not identify geometric and arithmetic Pic without that step.

**Acceptance:** The sixfold construction is not advertised as a fourfold theorem. The descent exponent changes q by its square.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.10 additional conclusion, pp.502–504; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.10 proof, p.504; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Remark 2.11, p.504.

<a id="K3-3-zarhin-witt"></a>

### K3.3/zarhin-witt — Witt lifting of the Zarhin triple

**Theorem.** If char k=p>2 and (X_kbar,H) lifts over W(kbar), the choices in the refined Zarhin construction may be made so that (M_H(v)_kbar,L,A) lifts over W(kbar). A lift only over a ramified extension does not meet this hypothesis.

**Prerequisites:** [K3.3/zarhin](#K3-3-zarhin), [K3.3/descent-refinement](#K3-3-descent-refinement), [K3.2/theta-specialization](#K3-2-theta-specialization).

**Construction or proof.**

1. Spread the stable moduli construction over the given W-lift and lift the required determinant classes.
2. Use the integral generic map and saturated specialization for L; construct A in a liftable class.

**Acceptance:** Retain the polarization in the lift.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.10 last conclusion, pp.502–504.

## K3.4 — K3 linear series and finite fields

Reflect positive K3 classes into the nef cone, analyze fixed components and bounded birational linear series, descend geometric NS over a uniform extension, and obtain finite geometric classes at fixed square and finite arithmetic forms in odd characteristic. Retain the characteristic-two nonreduced-curve proof gate.

<a id="K3-4-nef-linear-series"></a>

### K3.4/nef-linear-series — K3 positive classes and linear series

**Theorem.** For a geometric projective K3 and a class of square r>0, change its sign and apply reflections in effective (−2)-curves to obtain a big nef class of the same square. Its complete linear system has the K3 fixed-component alternatives: either no fixed part, or the genus-one-pencil configuration mE+Γ with E²=0, Γ²=−2, E·Γ=1. Use K3 Riemann–Roch and the source vanishing/base-point-freeness theorems for the resulting multiples.

**Prerequisites:** [K3.0/ns-lattice](#K3-0-ns-lattice), `SchemeAndStackFoundations:SF.5`.

**Construction or proof.**

1. Riemann–Roch chooses an effective sign. Reflection reduces intersection with a chosen ample class until nef.
2. Apply the K3 linear-series classification with its characteristic restrictions and treat the pencil/fixed-root case separately.

**Acceptance:** Reflections preserve r; they need not preserve the original ample chamber. A positive-square line bundle itself need not be ample.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 3.1 proof, p.505; Ogus 1.10, Huybrechts Ch.8; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 3.1 proof, pp.505–506; Saint-Donat §§2,8.

<a id="K3-4-k3-boundedness"></a>

### K3.4/k3-boundedness — Birational boundedness of K3 surfaces

**Theorem.** For each integer r>0 there exist bounds N(r),d(r) such that a K3 surface with a line bundle of square r admits some line bundle L′ whose complete linear system is birational to an image in P^N of degree at most d. In the repaired bookkeeping one may use the generous bounds N=128r+2 and d=256r after the allowed replacements. The characteristic-two nonreduced-member birationality leaf is an explicit proof gate; the all-characteristic target is conditional on that leaf.

**Prerequisites:** [K3.4/nef-linear-series](#K3-4-nef-linear-series), `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Construction or proof.**

1. Make a positive class nef, remove the fixed-component case, and replace by the prescribed small tensor multiples.
2. Separate tangent/separability and degree-one assertions for reduced and nonreduced general members, using the source jet-separation calculation.
3. Correct the final calculation: if the last bundle is 4L with L²=s, then (4L)²=16s and h⁰(4L)=8s+2; include every preceding replacement.

**Acceptance:** Do not use the printed final constants. In the nonreduced branch C=2C_red, positivity and K3 parity force C²≥8, so the inequality 3C²−4>C² applies.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 3.1, pp.504–506.

<a id="K3-4-ns-descent"></a>

### K3.4/ns-descent — Uniform NS descent over finite fields

**Theorem.** For a K3 surface over a finite field, an extension of degree 6983776800 suffices to trivialize the Galois action on its geometric NS lattice; over that extension every invariant geometric line bundle descends since the Brauer group of a finite field vanishes. The degree is a uniform multiple, not the asserted minimum for each surface.

**Prerequisites:** [K3.0/cycle-lattice](#K3-0-cycle-lattice), `AlgebraicModuliForArithmeticGeometry:R09.5`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Construction or proof.**

1. The finite Frobenius action on the rank≤22 integral NS lattice fixes an ample class. Every other cyclotomic factor therefore has degree at most 21. The least common multiple of integers m with φ(m)≤21 is 6983776800, so this power acts trivially.
2. Apply the Picard descent exact sequence and finite-field Brauer vanishing.

**Acceptance:** Keep trivial NS action distinct from descent over a general field.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Corollary 3.2 proof; LMS §2.3, extension degree 6983776800.

<a id="K3-4-finite-k3"></a>

### K3.4/finite-k3 — Finite K3 surfaces at fixed geometric square

**Theorem.** Over a fixed finite field k, for r>0 there are finitely many geometric isomorphism classes of K3 surfaces defined over k carrying a geometric line bundle of square r. In odd characteristic there are finitely many k-isomorphism classes as well. The all-characteristic geometric conclusion carries the characteristic-two gate of K3 birational boundedness.

**Prerequisites:** [K3.4/k3-boundedness](#K3-4-k3-boundedness), [K3.4/ns-descent](#K3-4-ns-descent), `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Construction or proof.**

1. Descend the bounded linear series to the common finite extension. Bounded-degree cycles in fixed projective space over a finite field form a finite set of rational points of the relevant Chow parameter spaces.
2. A birational map of smooth projective K3 surfaces is an isomorphism by minimal surface theory.
3. In odd characteristic use LMS Proposition 2.4.1: the cone-theorem finite-index automorphism image and the finite nonabelian H¹ argument bound forms.

**Acceptance:** Finite geometric classes and finite forms are separate steps. No even-characteristic form-finiteness assertion is imported from the odd-characteristic cone theorem.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Corollary 3.2, pp.506–507; bars restored from source convention; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Corollary 3.2; LMS Prop.2.4.1 and Lieblich–Maulik cone theorem; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Corollary 3.2 second conclusion, pp.506–507; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Corollary 3.2 proof, pp.506–507; [LMS14](https://www.numdam.org/item/10.24033/asens.2215.pdf), Proposition 2.4.1 and its proof, pp.291–293.

## K3.5 — IHS deformations and arithmetic periods

Positive-class projectivity with corrected Huybrechts theorem, local Torelli rank-one deformations and finite ample representatives; the extendable-stabilizer period datum, arithmetic polarized monodromy, algebraic family period maps and global Torelli in parallel-transport scope.

<a id="K3-5-positive-projectivity"></a>

### K3.5/positive-projectivity — Positive classes and IHS projectivity

**Theorem.** For a complex IHS manifold X, an integral (1,1) class l with q(l)>0 implies X is projective; after choosing the positive sign it is big. In a small deformation keeping l algebraic, one can arrange Picard rank one, where that sign is ample. Use Huybrechts’ projectivity theorem with its 2003 correction.

**Prerequisites:** [K3.1/ihs](#K3-1-ihs), [K3.2/bb-form](#K3-2-bb-form), `MotivesAndAlgebraicCycles:MC.7`, `ComplexComparisonPartII:C5`, `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, `ComplexComparisonPartII:C5/relative-de-rham-betti`.

**Construction or proof.**

1. Identify the positive cone and choose its component.
2. Local Torelli identifies the deformation locus preserving l with a period hyperplane; avoid the countable proper hyperplanes for additional integral classes.
3. Apply the corrected projectivity theorem and the rank-one ample-cone conclusion.

**Acceptance:** A negative-square integral (1,1) class does not satisfy this criterion.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §1.1 p.488; Lemma 3.5 proof; Huybrechts 1999 with 2003 erratum; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Lemma 3.5 proof, p.507; Beauville Th.5.

<a id="K3-5-deformation-representatives"></a>

### K3.5/deformation-representatives — Finite ample deformation representatives

**Theorem.** For fixed n,r>0, finitely many ample pairs (X_i,L_i) of complex IHS manifolds of dimension 2n and L_i^(2n)=r suffice: every IHS pair (X,L) with q(L)>0 and L^(2n)=r is deformation equivalent to one of them after replacing L by its inverse if necessary. Deformation bases here may be complex manifolds rather than projective schemes.

**Prerequisites:** [K3.5/positive-projectivity](#K3-5-positive-projectivity), `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Construction or proof.**

1. Deform to Picard rank one, choose the ample sign, and apply Kollár–Matsusaka boundedness with K_X=0 and fixed top power.
2. A finite-type polarized parameter space has finitely many relevant connected deformation components.

**Acceptance:** This is finiteness of representatives for a fixed numerical bound, not finiteness of all IHS deformation types.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Lemma 3.5, pp.507–508.

<a id="K3-5-period-datum"></a>

### K3.5/period-datum — Polarized IHS period data

**Construction.** For a fixed deformation representative with BB lattice Λ and positive integral class l=c₁(L), form D={ [σ]∈P(l^⊥⊗C): (σ,σ)=0, (σ,bar σ)>0 }. The integral l need not itself be primitive. Use the subgroup of O(l^⊥) extending to O(Λ) and fixing l, retaining the chosen connected period component and markings compatible with parallel transport. This is a specialization of the existing Hodge period-domain API.

**Prerequisites:** [K3.5/deformation-representatives](#K3-5-deformation-representatives), `tauceti:TauCeti.Hodge.HodgeStructureOn`, `tauceti:TauCeti.IntegralLattice`, `ShimuraVarieties:V0`.

**Construction or proof.**

1. Specialize the existing polarized weight-two Hodge domain, using −cup for the polarization convention when required.
2. Keep the ambient-lattice extension condition instead of enlarging to all isometries of l^⊥.

**API.**

- `IHS.periodPoint` (constructor): A marking sends the H²⁰ line into D.
- `IHS.periodPoint_rescale` (characterisation): Rescaling a generator of H²⁰ does not change the projective point.
- `IHS.periodAction` (functoriality): An extending integral isometry acts on marked periods, with identity and composition laws.
- `IHS.periodDomainComparison` (compatibility): Identify this domain with the existing weight-two polarized Hodge period domain under the fixed sign convention.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.5/monodromy-arithmetic: The arithmetic polarized monodromy target uses this polarized ihs period data interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.5/torelli: The global torelli with parallel transport target uses this polarized ihs period data interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. A generator σ has (σ,σ)=0 and positive (σ,bar σ); rescaling by c≠0 multiplies the latter by |c|².
2. A real nonzero isotropic line has (σ,bar σ)=0 and is excluded.
3. The domain only uses lines in l^⊥; replacing a marking by an extending isometry transports both the line and its polarization class.

**Acceptance:** The Hodge structure is supplied by geometry, not chosen arbitrarily.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 3.3 proof, pp.508–509.

<a id="K3-5-monodromy-arithmetic"></a>

### K3.5/monodromy-arithmetic — Arithmetic polarized monodromy

**Theorem.** The monodromy subgroup for the fixed IHS pair has finite index in the extendable stabilizer of l. Choose Γ of finite index contained in monodromy and a torsion-free arithmetic subgroup. Then Γ\D has the quasi-projective algebraization given by Baily–Borel.

**Prerequisites:** [K3.5/period-datum](#K3-5-period-datum), `ShimuraVarieties:V0`, `ShimuraVarieties:V2`.

**Construction or proof.**

1. Use Sullivan’s unpolarized finite-index theorem and Markman’s passage to the stabilizer of the polarization.
2. Intersect with a torsion-free finite-index arithmetic subgroup before forming the effective quotient.

**Acceptance:** Arithmeticity does not say every abstract Hodge isometry is parallel transport.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 3.3 proof p.508; Sullivan, Markman Prop.1.9.

<a id="K3-5-period-map"></a>

### K3.5/period-map — Algebraic family period maps

**Theorem.** For a smooth projective family of polarized IHS manifolds with its level/marking data modulo Γ, the analytic period map to Γ\D is algebraic. Its pullbacks agree with the weight-two Hodge variation and its monodromy representation lies in Γ after the stated finite cover.

**Prerequisites:** [K3.5/monodromy-arithmetic](#K3-5-monodromy-arithmetic), `ComplexComparisonPartII:C5`, `ShimuraVarieties:V3`, `AlgebraicModuliForArithmeticGeometry:R09.6`, `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, `ComplexComparisonPartII:C5/relative-de-rham-betti`.

**Construction or proof.**

1. Construct the actual Gauss–Manin local system and polarized Hodge filtration.
2. Apply Borel algebraicity with the torsion-free arithmetic target, algebraic source and valid compactification hypotheses.

**Acceptance:** A set-theoretic assignment of period points is insufficient.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 3.3 proof p.509.

<a id="K3-5-torelli"></a>

### K3.5/torelli — Global Torelli with parallel transport

**Theorem.** If two complex IHS manifolds in the fixed deformation class admit a Hodge isometry of H² induced by parallel transport, the global Torelli criterion supplies the birational comparison in the period-map argument. For an isomorphism retain the additional Kähler-cone condition. No conclusion is asserted from an arbitrary unqualified Hodge isometry.

**Prerequisites:** [K3.5/period-datum](#K3-5-period-datum), [K3.5/monodromy-arithmetic](#K3-5-monodromy-arithmetic).

**Construction or proof.**

1. Apply Verbitsky’s Torelli theorem with the Markman parallel-transport formulation.
2. The Γ-level choice makes the required comparison operator belong to the permitted monodromy group.

**Acceptance:** Isomorphic periods give a birational conclusion; equality of abstract lattices alone gives neither.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 3.3 proof p.509; Verbitsky, Markman Th.1.10/Prop.1.9.

## K3.6 — Complex symplectic birational boundedness

Finite algebraic period-covering families, codimension-two Picard/section transport, uniform birational bounds after replacement of L by L′ of the same top power, and a finite-type projective family containing birational representatives. Uniformity is for the replacement, as in Charles Theorem 3.3.

<a id="K3-6-period-cover"></a>

### K3.6/period-cover — Finite algebraic period-covering families

**Theorem.** For the fixed IHS deformation representative, construct finitely many algebraic parameter spaces with smooth projective polarized IHS families whose period images cover Γ\D and whose line bundles are fiberwise big, of top power r. Use stratification and finite covers so that every needed period has a fiber with a parallel-transport-compatible marking.

**Prerequisites:** [K3.5/period-map](#K3-5-period-map), [K3.5/torelli](#K3-5-torelli), [K3.5/positive-projectivity](#K3-5-positive-projectivity), `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Construction or proof.**

1. Start at very general periods of minimal Picard rank, deform locally, and algebraize with a relatively ample auxiliary polarization.
2. Use surjectivity of the global period map, stratify the period image, and repeat on the smaller closed complement.
3. Resolve/algebraize the source in the source-qualified scope; use finite Γ covers to retain marking data.

**Acceptance:** Local Torelli by itself is not an algebraic finite-type covering theorem.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 3.3 proof pp.509–510; Huybrechts Th.8.1.

<a id="K3-6-birational-transport"></a>

### K3.6/birational-transport — Picard and section transport

**Theorem.** A birational map between smooth projective complex IHS manifolds is an isomorphism away from codimension-at-least-two subsets. Strict transform identifies Picard groups, all spaces H⁰(X,L^a), top intersection through the BB/Fujiki relation, and the BB form.

**Prerequisites:** [K3.1/ihs](#K3-1-ihs), [K3.2/bb-form](#K3-2-bb-form), [K3.5/torelli](#K3-5-torelli).

**Construction or proof.**

1. Use the symplectic minimal-model codimension-one isomorphism theorem.
2. Normality extends sections across codimension two; the H² identification is the BB isometry.

**Acceptance:** No claim that every intersection product of arbitrary divisors is birationally preserved without the BB/Fujiki argument.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 3.3 proof p.510.

<a id="K3-6-ihs-boundedness"></a>

### K3.6/ihs-boundedness — Birational Matsusaka theorem for IHS manifolds

**Theorem.** For n,r>0 there are a,N,d>0 such that any complex IHS X of dimension 2n and invertible sheaf L with q(L)>0 and ∫c₁(L)^(2n)=r admits an invertible sheaf L′ with the same top power r, h⁰(X,(L′)^a)≤N, and |(L′)^a| birational onto an image of degree≤d. The bundle L′ may differ from L.

**Prerequisites:** [K3.5/deformation-representatives](#K3-5-deformation-representatives), [K3.6/period-cover](#K3-6-period-cover), [K3.6/birational-transport](#K3-6-birational-transport), `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Construction or proof.**

1. Use finitely many deformation representatives and their algebraic period covers.
2. Apply the uniform birational linear-series theorem for a fiberwise big line bundle on each noetherian projective family (Charles Lemma 3.6), including its noetherian-induction proof.
3. Transport the fiber bundle birationally to X, preserving sections and top power.

**Acceptance:** Uniformity for the original L is not asserted. All constants depend only on n,r.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 3.3 first conclusion p.507.

<a id="K3-6-ihs-family"></a>

### K3.6/ihs-family — Birationally bounded IHS families

**Theorem.** For fixed n,r as above, there is a scheme S of finite type over C and a projective morphism Y→S such that each admissible X is birational to some fiber Y_s. The parameter space records bounded-degree images; its fibers are not asserted all smooth IHS manifolds.

**Prerequisites:** [K3.6/ihs-boundedness](#K3-6-ihs-boundedness), `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Construction or proof.**

1. Use the uniform projective embedding dimension and image degree to bound Hilbert/Chow data.
2. Take the universal projective family of these images.

**Acceptance:** Birational boundedness does not identify the original polarized pairs with fibers.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 1.2; Theorem 3.3 second conclusion.

## K3.7 — Strong admissibility and finite NS lattices

Actual W-family witnesses for admissible/strongly admissible triples in p≥5, superspecial versus supersingular K3s, polarized deformations and corrected obstruction modules, strongly admissible Zarhin fourfolds, primitive NS–special-endomorphism comparison, finite integral NS lattices and finiteness of underlying K3s for eligible varying degrees.

<a id="K3-7-admissible"></a>

### K3.7/admissible — Admissible symplectic triples

**Definition.** For perfect k of p>3, W=W(k), K=Frac(W) with a fixed embedding K→C, an admissible triple (M₀,H₀,L₀) is witnessed by a smooth irreducible W-scheme T, a smooth projective family M→T, a k-point 0, and H,L extending H₀,L₀: H is relatively ample, the complex fibers are IHS, q(L)>0, H²_Betti and H³_Betti are torsion-free, and the BB form on the integral primitive complement Λ_l remains nondegenerate modulo p. All these are conditions on a genuine family, not free axioms on a bare triple.

**Prerequisites:** [K3.1/ihs](#K3-1-ihs), [K3.2/bb-form](#K3-2-bb-form), [K3.0/ns-lattice](#K3-0-ns-lattice), `CrystallineCohomology:CR.3`, `CohomologyComparisons:CP.2`.

**Construction or proof.**

1. Package the witness data of Charles Setup 3.3 and retain its integral lattice along the family.

**API.**

- `AdmissibleTriple.family` (projection): Retrieve the W-family, point and line bundles.
- `AdmissibleTriple.primitiveLattice` (data): Return Λ_l with its mod-p nondegenerate pairing.
- `AdmissibleTriple.baseChange` (functoriality): Eligible perfect-field/Witt base change transports the witness and its comparison data.
- `AdmissibleTriple.forget` (coercion): Forget to the special-fiber polarized projective variety with positive L.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.7/strong-admissible: The strong admissibility target uses this admissible symplectic triples interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.7/admissible-hodge: The low-degree admissible hodge–de rham control target uses this admissible symplectic triples interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. A ramified-DVR lift alone does not give the required smooth W-family.
2. A primitive complement with determinant divisible by p fails admissibility even when the generic family is IHS.
3. Changing the lattice marking by an integral isometry fixing l does not change admissibility or mod-p nondegeneracy.

**Acceptance:** The primitive complement is perpendicular to L.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Setup and Definition 3.8, pp.511–512.

<a id="K3-7-strong-admissible"></a>

### K3.7/strong-admissible — Strong admissibility

**Definition.** An admissible triple is strongly admissible if a witness can be chosen whose geometric generic special fiber is ordinary in degree two (H²_crys free and Newton=Hodge polygons) and whose NS⊗Q is spanned by the restrictions of H and L. Ordinarity is a geometric generic special-fiber condition, not a condition on every fiber.

**Prerequisites:** [K3.7/admissible](#K3-7-admissible), `CrystallineCohomology:CR.4`.

**Construction or proof.**

1. Add the two conditions to an actual admissibility witness and keep its forgetful map.

**API.**

- `StronglyAdmissible.toAdmissible` (coercion): Forget ordinarity and minimal generic NS span.
- `StronglyAdmissible.ordinaryGeneric` (projection): The generic special-fiber H² crystal is ordinary.
- `StronglyAdmissible.nsGeneric` (characterisation): Every rational NS class of that fiber is a rational combination of H,L.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.7/strong-zarhin: The strongly admissible zarhin fourfolds target uses this strong admissibility interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.7/ns-special-endomorphisms: The primitive divisors as special endomorphisms target uses this strong admissibility interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. A generic special fiber with all Newton slopes one and Hodge slopes including zero and two fails ordinarity, regardless of its complex fibers.
2. A special generic fiber with a third independent divisor fails the span condition.
3. When H and L are proportional, the span condition means generic Picard rank one, not exactly two.

**Acceptance:** The rational NS span permits H,L to be dependent.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Definition 3.8 continuation, p.512.

<a id="K3-7-superspecial"></a>

### K3.7/superspecial — Superspecial K3 surfaces

**Definition.** For a K3 in characteristic p≥5, write F²⊂F¹⊂H²_dR for the Hodge filtration and C₀⊂C₁⊂H²_dR for the increasing conjugate filtration, with respective proper-step dimensions one and twenty-one. Superspecial means F²=C₀ and F¹=C₁; by cup-product duality either equality determines the other. This is distinct from supersingularity, which concerns the slope-one crystalline isocrystal. Test the equality after geometric base change.

**Prerequisites:** [K3.0/k3-surface](#K3-0-k3-surface), `CrystallineCohomology:CR.2`, `CrystallineCohomology:CR.4`.

**Construction or proof.**

1. Specialize the Hodge/conjugate filtration comparison and define equality of the filtered subspaces.

**API.**

- `K3.isSuperspecial` (characterisation): Equality of the two specified filtrations is the criterion.
- `K3.superspecial_baseChange` (functoriality): Perfect algebraically closed field extension preserves the criterion.
- `K3.superspecial_implies_supersingular` (relation): For p≥5, superspecial implies infinite height and a slope-one H² crystalline isocrystal. Do not substitute Picard rank 22 using the Tate theorem that this argument is meant to prove.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.7/polarized-deformation: The nonsuperspecial polarized deformations target uses this superspecial k3 surfaces interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.9/superspecial-transfer: The superspecial deformation transfer target uses this superspecial k3 surfaces interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. An ordinary K3 with slopes 0,1,2 is not superspecial.
2. Equality is tested on the filtration subspaces, not only their dimensions (all K3 have the same relevant Hodge dimensions).
3. A supersingular K3 outside the superspecial locus is not declared superspecial merely because all slopes are one.

**Acceptance:** Never infer nonsuperspecialness of a partner from that of X without a theorem.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §3.3, p.512; Ogus Ex.1.10.

<a id="K3-7-polarized-deformation"></a>

### K3.7/polarized-deformation — Nonsuperspecial polarized deformations

**Theorem.** For a nonsuperspecial polarized K3 in the hypotheses used by Charles Proposition 3.10, the polarized deformation ring over W has a smooth 19-variable description and a geometric generic special fiber that is ordinary with minimal rational Picard span. Preserve every primitivity/nonvanishing condition on the polarization’s de Rham Chern class required by the Ogus deformation theorem.

**Prerequisites:** [K3.7/superspecial](#K3-7-superspecial), [K3.0/picard-lift](#K3-0-picard-lift), `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Construction or proof.**

1. Use the crystalline/de Rham local deformation calculation to obtain the smooth polarized deformation.
2. Use the generic ordinary locus and avoid additional NS conditions, then algebraize.

**Acceptance:** Nonsuperspecialness alone does not erase the polarization hypotheses of the chosen deformation theorem.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 3.10 proof, pp.512–513; Ogus.

<a id="K3-7-line-lift"></a>

### K3.7/line-lift — Lifting the auxiliary moduli line bundle

**Theorem.** In the polarized formal K3 deformation used for the Zarhin fourfold, the auxiliary class L on the special moduli fiber lifts through all infinitesimal thickenings and algebraizes. The obstruction is in H²(M_P,O)⊗ I^(j+1)/I^(j+2), with I=(t₁,…,t₁₉); only the first factor has rank one, while the graded quotient has rank binomial(j+19,18).

**Prerequisites:** [K3.7/polarized-deformation](#K3-7-polarized-deformation), [K3.3/zarhin-witt](#K3-3-zarhin-witt), [K3.2/hodge-moduli](#K3-2-hodge-moduli), `AlgebraicModuliForArithmeticGeometry:R09.6`, [K3.2/theta](#K3-2-theta).

**Construction or proof.**

1. Use the relative Mukai/determinant correspondence to show that one positive tensor power of the auxiliary L lifts over the entire polarized formal base. This global power-lifting assertion is part of the relative-moduli proof contract.
2. For I=(t₁,…,t₁₉), the obstruction to the next I-adic thickening lies in H²(O_M_P)⊗ I^(j+1)/I^(j+2). Both factors are finite free over W; multiplication by the positive power exponent is injective, so the obstruction vanishes.
3. H¹(O)=0 gives compatibility and uniqueness of the lifts. Apply formal effectivity with the ample auxiliary bundle to algebraize. No rank-one assertion about the whole obstruction module is used.

**Acceptance:** A rank-one obstruction-space argument is invalid in 19 variables.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 3.10 proof, pp.512–513.

<a id="K3-7-strong-zarhin"></a>

### K3.7/strong-zarhin — Strongly admissible Zarhin fourfolds

**Theorem.** For a nonsuperspecial polarized K3 over perfect k of p≥5 in the chosen prime-to-p degree scope, the Zarhin fourfold and its ample/positive line bundles may be chosen strongly admissible as in Proposition 3.10. Retain the chosen good primitive BB lattice modulo p.

**Prerequisites:** [K3.7/line-lift](#K3-7-line-lift), [K3.7/strong-admissible](#K3-7-strong-admissible), [K3.3/zarhin](#K3-3-zarhin), [K3.2/hodge-moduli](#K3-2-hodge-moduli).

**Construction or proof.**

1. Take the smooth polarized deformation; lift the moduli and auxiliary bundle.
2. Use the generic ordinary K3 and the Mukai comparison to obtain degree-two ordinarity and the stated generic NS span.
3. Choose the prime-to-p lattice constants before applying integral Kuga–Satake.

**Acceptance:** Do not extend the result from p≥5 to p=3 by notation.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 3.10, pp.512–513.

<a id="K3-7-admissible-hodge"></a>

### K3.7/admissible-hodge — Low-degree admissible Hodge–de Rham control

**Theorem.** For an admissible family in p>3, establish E₁ degeneration in total degrees one and two and h²⁰=h⁰²=1 on the relevant fibers, under the torsion-free comparison data of the witness. This is the low-degree statement of Remark 3.9, not unrestricted full E₁ degeneration when dimension≥p.

**Prerequisites:** [K3.7/admissible](#K3-7-admissible), `CohomologyComparisons:CP.5`, `CrystallineCohomology:CR.2`.

**Construction or proof.**

1. Use free H²,H³ and their integral comparison to control low-degree Hodge ranks.
2. Apply the source low-degree Hodge–de Rham argument fiberwise.

**Acceptance:** Test a witness of dimension at least p: no full spectral-sequence claim is implied.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Remark 3.9, p. 512.

<a id="K3-7-ns-special-endomorphisms"></a>

### K3.7/ns-special-endomorphisms — Primitive divisors as special endomorphisms

**Theorem.** For a strongly admissible triple in the source good-prime Kuga–Satake scope, identify NS(M₀)∩L₀^⊥ with End(A₀) intersected with the image of primitive H²_crys(M₀/W)(1) in End H¹_crys(A₀/W). Preserve the quadratic form and its Tate twist. This uses an ordinary lift, integral crystalline comparison, and the early Lefschetz (1,1) theorem.

**Prerequisites:** [K3.7/strong-admissible](#K3-7-strong-admissible), [K3.7/admissible-hodge](#K3-7-admissible-hodge), `MotivesAndAlgebraicCycles:MC.7`, `ShimuraVarieties:V6`, `CohomologyComparisons:CP.2`, `CohomologyComparisons:CP.5`.

**Construction or proof.**

1. Import good-prime integral KS models and their primitive twisted tensor.
2. Lift the endomorphism in the ordinary deformation, identify its Hodge class with a divisor by the early (1,1) theorem, and descend the integral class.
3. Use the lattice saturation argument; rational agreement is not enough for the integral intersection.

**Acceptance:** The crystalline embedding is primitive H²(1), not un-twisted full H².

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Lemma 3.15, pp.515–516; Charles 2013 Prop.22 and erratum context.

<a id="K3-7-finite-ns"></a>

### K3.7/finite-ns — Finite NS lattices of admissible varieties

**Theorem.** For a fixed finite k of p≥5 and fixed dimension 2n and positive top power r, only finitely many geometric NS lattices occur among the strongly admissible triples of the source scope. Their integral BB forms, not merely rational quadratic spaces, are bounded.

**Prerequisites:** [K3.7/ns-special-endomorphisms](#K3-7-ns-special-endomorphisms), `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `ShimuraVarieties:V6`, `AlgebraicModuliForArithmeticGeometry:R09.5`, [K3.5/deformation-representatives](#K3-5-deformation-representatives).

**Construction or proof.**

1. Choose level at least three prime to p after a uniformly bounded finite extension.
2. The fixed good primitive lattice bounds the polarized KS abelian varieties over the finite field.
3. Recover primitive NS as the intersection with the integral special-endomorphism lattice; use the generic NS span to control the remaining directions.

**Acceptance:** Correct the source’s reversed level inequality. A finite set of rational forms does not by itself bound integral lattices.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 3.16, pp.516–517.

<a id="K3-7-unpolarized-finiteness"></a>

### K3.7/unpolarized-finiteness — Finiteness with varying polarization degrees

**Theorem.** Fix a finite field k of p≥5, d>0 and t₀≥0. There exist N>0 and a,b≠0 such that the underlying nonsuperspecial K3 surfaces X/k admitting an ample H with H²=2md, m≡1 mod N, gcd(m,ab)=1, a,b squares modulo m, and v_p(|disc NS(X_kbar)|)≤t₀, form a finite set of k-isomorphism classes. Polarized pairs (X,H) are not claimed finite.

**Prerequisites:** [K3.7/strong-zarhin](#K3-7-strong-zarhin), [K3.7/finite-ns](#K3-7-finite-ns), [K3.2/mukai-discriminant](#K3-2-mukai-discriminant), [K3.4/finite-k3](#K3-4-finite-k3), `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Construction or proof.**

1. Use the Zarhin construction and finite admissible NS lattices to bound the prime-to-p discriminant of NS(X).
2. The prescribed p-valuation bound completes the discriminant bound. Fixed rank/signature and bounded determinant give finitely many integral lattices and a uniformly bounded positive represented square.
3. Apply fixed-square K3 finiteness.

**Acceptance:** On one surface the powers H^(ℓ^j) can give infinitely many eligible polarized pairs with unchanged NS.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 3.17 proof, pp.517–518, corrected conclusion; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 3.17 literal statement p.517; elementary counterexample.

## K3.8 — Signed B-fields and twisted K3 partners

Arithmetic transcendental lattices and B-fields, rational exp(B), the explicit integral signed-gerbe twisted Mukai lattice, twisted RR, exact-geometric-rank-order isotropic partner gerbes and FM equivalences, coprime gerbe killing, integral isotropic quotient maps and partner discriminant formula.

<a id="K3-8-arithmetic-transcendental"></a>

### K3.8/arithmetic-transcendental — Arithmetic transcendental lattices

**Definition.** For a K3 surface over a finite field k and ℓ≠char k, let P be the image of Pic(X)⊗Z_ℓ in arithmetic H²_et(X,Z_ℓ(1)), identified with geometric Frobenius invariants in this degree. Define T(X,Z_ℓ)=P^⊥ inside this arithmetic group. It is not the orthogonal complement inside all geometric H². Separately retain the geometric transcendental lattice for geometric Brauer-order tests.

**Prerequisites:** [K3.0/cycle-lattice](#K3-0-cycle-lattice), `SchemeAndStackFoundations:SF.2`, `MotivesAndAlgebraicCycles:MC.7`.

**Construction or proof.**

1. Use Hochschild–Serre, the K3 H¹ vanishing and Kummer to identify the arithmetic degree-two group.
2. Restrict the cup pairing to the invariant lattice before taking the complement.

**API.**

- `K3.arithmeticTranscendental` (data): The integral orthogonal complement of the arithmetic Picard image in invariant H².
- `K3.transcendental_pair_zero` (characterisation): Membership means orthogonality to every arithmetic divisor.
- `K3.transcendental_baseExtension` (functoriality): Compare invariant lattices under a finite field extension, retaining the changed Frobenius power.
- `K3.transcendental_geometric` (compatibility): The inclusion into geometric H² is injective; no surjectivity to its full complement is asserted.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.8/b-field: The ℓ-adic b-fields target uses this arithmetic transcendental lattices interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.9/frobenius-brauer: The frobenius and infinite brauer input target uses this arithmetic transcendental lattices interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. When the rational Tate theorem holds over k, T⊗Q_ℓ=0.
2. For geometric Picard rank one, the rank-21 geometric complement is not automatically the arithmetic T.
3. If all geometric divisors are defined over k, the arithmetic T is the Frobenius-fixed part of their geometric orthogonal complement, with the actual integral intersection.

**Acceptance:** T may be zero even though the full geometric orthogonal complement has positive rank.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.2 p.520; LMS §3.2.

<a id="K3-8-b-field"></a>

### K3.8/b-field — ℓ-adic B-fields

**Definition.** An ℓ-adic B-field is B∈H²_et(X,Q_ℓ(1)). A presentation B=α/ℓ^n uses an integral numerator α and the Kummer class [α_n]∈Br(X)[ℓ^n]. A primitive numerator does not by itself assert exact geometric Brauer order ℓ^n. For the twisted-vector convention exp(+B), use the gerbe class −[α_n].

**Prerequisites:** [K3.8/arithmetic-transcendental](#K3-8-arithmetic-transcendental), `SchemeAndStackFoundations:SF.2`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Construction or proof.**

1. Use coefficient reduction followed by the Kummer boundary.
2. Track the sign from the gerbe to its twisted Chern character.

**API.**

- `K3.BField.brauerClass` (data): Send α/ℓ^n to [α_n], invariant under changing the integral presentation.
- `K3.BField.transition` (relation): ℓ^a[α_(n+a)]=[α_n].
- `K3.BField.add` (compatibility): Addition of B-fields maps to addition of Brauer classes.
- `K3.BField.geometricOrder` (characterisation): Compute order after geometric base change; impose exact order as an extra hypothesis for rank-order moduli.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.8/exponential: The rational mukai exponentials target uses this ℓ-adic b-fields interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. An integral B-field gives zero Brauer class.
2. A primitive algebraic Chern class divided by ℓ has trivial Brauer class, so primitivity is insufficient.
3. Changing B by an integral class leaves its Brauer image unchanged; reversing B reverses the class.

**Acceptance:** Presentations and their associated Brauer class have compatible transition maps.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.1 p.518; LMS §§3.1–3.3; [LMS14](https://www.numdam.org/item/10.24033/asens.2215.pdf), Definitions 3.2.1–3.2.3 and Lemma 3.2.4, p.294.

<a id="K3-8-exponential"></a>

### K3.8/exponential — Rational Mukai exponentials

**Construction.** On the rational ℓ-adic Mukai space define exp(B)(a,b,c)=(a,b+aB,c+B·b+aB²/2). It is an isometry, exp(B+C)=exp(B)exp(C), and its inverse is exp(−B). It is not generally an automorphism of the untwisted integral Mukai lattice.

**Prerequisites:** [K3.1/mukai-lattice](#K3-1-mukai-lattice), [K3.8/b-field](#K3-8-b-field).

**Construction or proof.**

1. Expand the bilinear pairing; mixed terms cancel using symmetry.
2. Composition is the quadratic binomial identity.

**API.**

- `Mukai.expB` (data): Apply the displayed three-coordinate formula.
- `Mukai.expB_comp` (functoriality): The B-field additive group acts on the rational space.
- `Mukai.expB_isometry` (compatibility): The action preserves the Mukai form.
- `Mukai.expB_inverse` (equivalence): exp(−B) is a two-sided inverse.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.8/twisted-lattice: The integral twisted mukai lattices target uses this rational mukai exponentials interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. exp(B)(1,0,0)=(1,B,B²/2).
2. exp(0) fixes every triple.
3. For B=α/r with r>1 and α primitive, exp(B)(1,0,0) has a nonintegral middle component, so integrality is not automatic.

**Acceptance:** Rational denominators are retained.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.1 pp.518–519; LMS §3.3.

<a id="K3-8-twisted-lattice"></a>

### K3.8/twisted-lattice — Integral twisted Mukai lattices

**Definition.** For B=α/r with r=ℓ^n, α orthogonal to NS and α² an even rational integer, in the exact-geometric-Brauer-order-r scope define N_B(X) directly as the Z-span of (r,α,0), (0,D,0) for D∈NS(X), and (0,0,1). Its ℓ-adic realization agrees with the intersection of integral geometric Mukai cohomology and exp(B)(N(X)⊗Q_ℓ) under the stated saturation/order hypotheses. Do not define it as exp(−B)⁻¹(N(X)).

**Prerequisites:** [K3.8/exponential](#K3-8-exponential), [K3.0/cycle-lattice](#K3-0-cycle-lattice), `tauceti:TauCeti.IntegralLattice`.

**Construction or proof.**

1. Use the coefficient basis and pairings to construct the integral lattice.
2. The exact geometric order forces the rank coordinate to be divisible by r in the ℓ-adic intersection; saturation supplies the NS component.
3. Compare with the signed-gerbe twisted Chern vector from the moduli supplier.

**API.**

- `TwistedMukai.mk` (constructor): Represent an element uniquely as (ar,D+aα,c), a,c∈Z and D∈NS(X).
- `TwistedMukai.pair` (data): Restrict the Mukai pairing; it is integral and even under α²∈2Z.
- `TwistedMukai.adicComparison` (compatibility): Scalar extension agrees with the specified rational algebraic preimage/intersection, not the preimage of integral N.
- `TwistedMukai.zeroTwist` (equivalence): For r=1 and trivial twist compare with N(X) via integral exp(α), assuming α integral with even square.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.8/twisted-vector: The twisted mukai vectors and riemann–roch target uses this integral twisted mukai lattices interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.8/isotropic-theta: The isotropic mukai quotient comparisons target uses this integral twisted mukai lattices interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.8/partner-discriminant: The discriminants of twisted partners target uses this integral twisted mukai lattices interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. The rank projection of N_B has image rZ.
2. If r=1 and α=0, the lattice is precisely Z⊕NS⊕Z.
3. If α²=−2d and D⊥α, exp(−α/r)(r,α+D,0)=(r,D,d/r), which need not lie in integral N(X), although the original vector is in N_B.

**Acceptance:** The sign −[α_n] is fixed before importing twisted sheaves.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Equation (4.1) with LMS §3.3/Lemma 3.3.3 correction; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.1 p.519; comparison with LMS §3.3; [LMS14](https://www.numdam.org/item/10.24033/asens.2215.pdf), Definition 3.3.2 and Lemma 3.3.3, pp.296–297; gerbe convention p.297.

<a id="K3-8-twisted-vector"></a>

### K3.8/twisted-vector — Twisted Mukai vectors and Riemann–Roch

**Theorem.** For weight-one perfect complexes on the μ_r-gerbe of class −[α_n], the convention v_B(P)=exp(B)ch_gerbe(P)√td_X lands in N_B(X) in the specified finite-field/saturation/order scope, and χ(P,Q)=−v_B(P)·v_B(Q). The twisted Chern-character construction itself belongs to the general twisted-sheaf supplier.

**Prerequisites:** [K3.8/twisted-lattice](#K3-8-twisted-lattice), [K3.1/mukai-rr](#K3-1-mukai-rr), `AlgebraicModuliForArithmeticGeometry:R09.4`, `SchemeAndStackFoundations:SF.5`.

**Construction or proof.**

1. Import the splitting-principle twisted Chern character and its GRR theorem.
2. Use the determinant-preserving deformation of twisted sheaves and K3 characteristic-zero integrality; track the exact gerbe sign.

**Acceptance:** For B=0 recover the untwisted Mukai formula.

**Sources:** [LMS14](https://www.numdam.org/item/10.24033/asens.2215.pdf), Definitions 3.3.4 and 3.3.6, Remark 3.3.5, Lemma 3.3.7, pp.297–299.

<a id="K3-8-isotropic-partner"></a>

### K3.8/isotropic-partner — Isotropic twisted K3 partners

**Theorem.** Let r=ℓ^n with ℓ≠p, let the geometric Brauer class of the signed gerbe have exact order r, and let v∈N_B(X) be primitive isotropic of rank r. The fixed-determinant stack of simple twisted sheaves of vector v is a μ_r-gerbe over a K3 surface M(v). The universal kernel on the two gerbes gives D_tw(X-gerbe)≃D_−tw(M-gerbe). Without a determinant isomorphism the scalar inertia is G_m. Nonemptiness and projectivity use the K3 twisted-moduli theorem and its source hypotheses.

**Prerequisites:** [K3.8/twisted-vector](#K3-8-twisted-vector), [K3.1/hilbert-points](#K3-1-hilbert-points), `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Construction or proof.**

1. Exact geometric rank-order divisibility makes proper positive-rank subsheaves impossible in rank r, giving the automatic-stability input.
2. Use the K3 deformation to characteristic zero for nonemptiness, properness and the surface invariants.
3. Verify Fourier–Mukai adjunction kernels on the product gerbes rather than treating a universal coarse sheaf as given.

**Acceptance:** Primitive arithmetic B-field data alone is not the rank-order condition.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.1; LMS Prop.3.4.2(1) arXiv v5 = cited published Prop.3.4.1; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), LMS Prop.3.4.2(2), used by Charles §4.1; [LMS14](https://www.numdam.org/item/10.24033/asens.2215.pdf), Definition 3.4.1, Proposition 3.4.2(1)–(2) and proof, pp.299–300.

<a id="K3-8-fine-partner"></a>

### K3.8/fine-partner — Coprime pairing kills the partner gerbe

**Theorem.** Over a finite field, in the isotropic-partner setup, if u∈N_B(X) has gcd(u·v,ℓ)=1 then the Brauer class of the partner gerbe is zero. The derived equivalence therefore has an untwisted K3 target. The numerical K₀ realization used here requires period-index/rank-r twisted-sheaf existence and degree-one zero-cycles over finite fields.

**Prerequisites:** [K3.8/isotropic-partner](#K3-8-isotropic-partner), [K3.8/twisted-vector](#K3-8-twisted-vector), `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Construction or proof.**

1. Import LMS Lemma 3.4.3 K₀ realization, including its period-index theorem and finite-field zero-cycle proof.
2. Transform a realizing perfect complex; its rank is −u·v, so the gerbe class is killed by u·v as well as by r.

**Acceptance:** Do not infer rank-r sheaf existence from the Brauer period alone.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), LMS Prop.3.4.2(3), arXiv v5; Charles §4.2 partner construction; [LMS14](https://www.numdam.org/item/10.24033/asens.2215.pdf), Proposition 3.4.2(3), Lemma 3.4.3 and Remark 3.4.4, pp.299–301.

<a id="K3-8-isotropic-theta"></a>

### K3.8/isotropic-theta — Isotropic Mukai quotient comparisons

**Construction.** For a primitive isotropic rank-r vector v and its K3 partner M, construct a Galois-equivariant isometry v^⊥/Z_ℓv≅H²_et(M_kbar,Z_ℓ(1)) for ℓ≠p using the integral twisted Mukai realization. Construct the integral numerical injection (v^⊥∩N_B(X))/Zv→NS(M), with p-primary cokernel in characteristic p and zero cokernel in characteristic zero, in the finite/algebraically closed field scope.

**Prerequisites:** [K3.8/isotropic-partner](#K3-8-isotropic-partner), [K3.8/twisted-lattice](#K3-8-twisted-lattice), [K3.2/theta](#K3-2-theta), `MotivesAndAlgebraicCycles:MC.2`.

**Construction or proof.**

1. Construct the universal twisted Chern correspondence on the gerbes and show v is its radical direction.
2. Use the integral twisted Mukai theorem for the cohomology quotient, then descend the completed algebraic image with the same saturation conditions as the nonisotropic case.

**API.**

- `TwistedMukai.thetaQuotient` (data): The integral prime-to-p isometry on the quotient.
- `TwistedMukai.thetaQuotient_wellDefined` (characterisation): Changing a representative by a multiple of v has zero effect.
- `TwistedMukai.thetaQuotient_cycles` (compatibility): The numerical injection and completed cycle classes commute.
- `TwistedMukai.thetaQuotient_baseChange` (functoriality): Compare all maps under eligible field extension and gerbe pullback.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.8/partner-discriminant: The discriminants of twisted partners target uses this isotropic mukai quotient comparisons interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.9/fixed-positive-square: The fixed positive squares in picard rank at least two target uses this isotropic mukai quotient comparisons interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.9/growing-ample-square: The growing-square ample partner classes target uses this isotropic mukai quotient comparisons interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. At B=0,v=(1,0,0), the quotient v^⊥/Zv is NS(X) on the algebraic side.
2. The class of v is zero; a definition keeping its nonzero radical is rejected.
3. The square of a quotient class is the square of any representative in v^⊥, independent of adding v.

**Acceptance:** The quotient by Zv, not just v^⊥, has the partner H² rank.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.1 pp.519–520; Yoshioka Th.3.19(ii); [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Equation (4.2), p.519.

<a id="K3-8-partner-discriminant"></a>

### K3.8/partner-discriminant — Discriminants of twisted partners

**Theorem.** The integral twisted lattice has |disc N_B(X)|=r²|disc NS(X)|. If ν_v>0 generates the ideal v·N_B(X), then for the K3 partner M there is t≥0 with ν_v² p^t |disc NS(M)|=r²|disc NS(X)| in characteristic p. In characteristic zero set p^t=1. Keep the absolute determinant convention throughout.

**Prerequisites:** [K3.8/twisted-lattice](#K3-8-twisted-lattice), [K3.8/isotropic-theta](#K3-8-isotropic-theta), `tauceti:TauCeti.IntegralLattice`.

**Construction or proof.**

1. Compute the determinant in the basis (r,α,0), NS basis, (0,0,1); the rank/top block has determinant −r² independently of α².
2. For a primitive isotropic vector the quotient determinant changes by ν_v².
3. Account for the square of the p-primary index of the numerical θ injection.

**Acceptance:** ν_v is a divisibility ideal generator, not an arbitrary bounded denominator.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Lemma 4.2, p.519; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 4.3, pp.519–520.

## K3.9 — Arithmetic partner sequences and geometric Tate inputs

Early Tate–Brauer/trace interface, Frobenius and infinite arithmetic Brauer input, conditional original-field norm lemma and safe p≥5 simultaneous splitting-prime/norm theorem. Construct partners with growing ℓ-discriminants, fixed or growing positive squares, conditional nonsuperspecial finiteness and superspecial starting-surface transfer. Export geometric contradictions to late MC.7; preserve the small-characteristic and partner gates.

<a id="K3-9-brauer-tate-interface"></a>

### K3.9/brauer-tate-interface — Early Tate–Brauer and descent interface

**Comparison.** Import the rational divisor Tate–Brauer equivalence over finite fields: surjectivity of Pic(X)⊗Q_ℓ→H²_et(X_kbar,Q_ℓ(1))^F is equivalent to finiteness of Br(X), with its all-ℓ comparison and characteristic-two qualification. Import rational Tate descent along finite field extensions via trace. After rational Tate, the saturated K3 Chern lattice yields integral ℓ-adic surjectivity onto invariants. These are early cycle-owner interfaces, not an invocation of the final K3 Tate theorem.

**Prerequisites:** [K3.0/cycle-lattice](#K3-0-cycle-lattice), `MotivesAndAlgebraicCycles:MC.0`, `MotivesAndAlgebraicCycles:MC.2`, `MotivesAndAlgebraicCycles:MC.7`.

**Construction or proof.**

1. Separate the Kummer exact sequences, trace descent and coefficient-independence implications from the geometric contradiction.
2. For integral descent use the saturated first-Chern image after rational equality; do not average integrally by dividing the field degree.

**Acceptance:** There is no dependency from an early input back to Charles Theorem 1.3 or 1.4.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4 opening; Lemma 4.5 proof; Tate 1995 and Milne 1975; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 4.4 p.520; LMS main theorem; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.2 finite-extension reduction p.520; LMS §2.3.

<a id="K3-9-frobenius-brauer"></a>

### K3.9/frobenius-brauer — Frobenius and infinite Brauer input

**Theorem.** For a K3 over a finite field of characteristic p≥5, untwisted geometric H² has an integer Frobenius polynomial independent of ℓ; its Tate-twisted normalization has rational coefficients, possibly with p-denominators. Frobenius is semisimple in the LMS input. If Br(X) is infinite, the arithmetic transcendental T is nonzero; away from finitely many primes it is unimodular. T⊗Q_ℓ/Z_ℓ maps onto the B-field Brauer subgroup with kernel killed by the ℓ-primary part of the Picard discriminant. Extensions to p=2,3 are separate proof contracts.

**Prerequisites:** [K3.8/arithmetic-transcendental](#K3-8-arithmetic-transcendental), [K3.9/brauer-tate-interface](#K3-9-brauer-tate-interface), `SchemeAndStackFoundations:SF.2`.

**Construction or proof.**

1. Use the pairing-compatible Frobenius statement (the similarity factor before Tate twisting must be q^w).
2. Apply the Kummer inverse-limit and integral lattice decomposition argument of LMS §3.2.
3. State the exact p≥5 or other separately sourced semisimplicity branch; no unsupported p=2/3 assertion is consumed.

**Acceptance:** An infinite geometric Brauer group is not the premise; Br(X) is arithmetic.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), LMS Prop.2.1.3; Charles Lemma 4.5 input; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Lemma 4.5 proof; LMS Lemma 3.2.7, Prop.3.2.8; [LMS14](https://www.numdam.org/item/10.24033/asens.2215.pdf), Proposition 2.1.3, p.288; Lemma 3.2.7 and Proposition 3.2.8, pp.295–296.

<a id="K3-9-conditional-norm"></a>

### K3.9/conditional-norm — Corrected original-field norm lemma

**Theorem.** Conditional norm-one target: first pass to a finite extension killing all root-of-unity eigenvalues other than 1 on H²(1), assume semisimplicity on the 1-part and the integral invariant-lattice control. If g is the Frobenius polynomial on the noninvariant complement, then disc T has square class c=−g(1)g(−1)disc NS(X). At sufficiently large ℓ where c and −1 are squares and the lattice is unimodular, nonzero T represents 1. The original-field claim without these conditions is not supplied.

**Prerequisites:** [K3.9/frobenius-brauer](#K3-9-frobenius-brauer), `GeometryOfNumbersAndQuadraticArithmetic:GN.2`.

**Construction or proof.**

1. The Cayley transform (F−1)(F+1)⁻¹ on the noninvariant complement is defined only after removing the −1 eigenvalue. Its skew-adjoint determinant gives disc complement ≡g(1)g(−1).
2. Divide the geometric determinant square class −1 by this and by disc NS to obtain c.
3. Rank one uses the discriminant square; rank≥2 uses unit representation with ℓ odd.

**Acceptance:** This conditional theorem is not the prime-choice input of the unconditional p≥5 branch.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Lemma 4.5, pp. 520–521, corrected (E8).

<a id="K3-9-simultaneous-norm"></a>

### K3.9/simultaneous-norm — Simultaneous primes and prescribed norms

**Theorem.** Let k have characteristic p≥5, enlarge to k₀ where all geometric divisors are defined and then to its quadratic extension k₁, and suppose rational Tate fails (hence Br remains infinite by rational descent). For fixed nonzero d₀∈Q, N>0 and a,b≠0, there are infinitely many odd primes ℓ away from all fixed denominators/discriminants and p such that ℓ≡1 mod N, a,b and 2 are squares modulo every ℓ-power, and a primitive γ∈T(X_k₁,Z_ℓ) has γ²=d₀. The same prime works for all partner indices n.

**Prerequisites:** [K3.9/frobenius-brauer](#K3-9-frobenius-brauer), [K3.9/brauer-tate-interface](#K3-9-brauer-tate-interface), `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Construction or proof.**

1. Take one finite Galois compositum containing the splitting field of the k₀-Frobenius polynomial, i, square roots of d₀, disc NS, 2,a,b, and ζ_N.
2. Import identity-class Chebotarev infinitude and canonical completions at split places: all eigenvalues and square roots then lie in Q_ℓ.
3. Apply the reciprocal-eigenvalue discriminant identity to F², where its ±1 eigenspaces correspond to the old ±1 eigenspaces. In rank one this makes the invariant and transcendental discriminants squares; rank≥2 unimodular lattices represent every unit. Discard numerator/denominator primes so d₀ is a unit and γ primitive.
4. Hensel lifting at odd ℓ lifts the nonzero square residues to all ℓ-powers.

**Acceptance:** Use one common compositum, not separate unrelated infinite prime sets. A rank-two unimodular lattice need not represent every nonunit; unit representation suffices.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), LMS Lemma 3.5.2, arXiv v5, substitute for Charles Lemma 4.5; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), LMS §3.5, published p302; Charles §4.2 pp520–522; simultaneous splitting-field refinement; [LMS14](https://www.numdam.org/item/10.24033/asens.2215.pdf), Lemmas 3.5.1–3.5.2, p.302.

<a id="K3-9-partner-sequence"></a>

### K3.9/partner-sequence — The growing-discriminant partner sequence

**Theorem.** After the simultaneous prime choice take D∈NS(X) with D²=2d≠0, γ⊥NS with γ²=−2d, and v_n=(ℓ^n,γ+D,0) in N_(γ/ℓ^n). For ℓ∤2d·disc NS and primitive D, v_n is primitive isotropic of rank ℓ^n, its geometric Brauer order is ℓ^n, and its partner X_n is a fine K3 surface. The divisibility ν_n divides 2d, so v_ℓ(disc NS(X_n))=2n+v_ℓ(disc NS(X)), whereas v_p(disc NS(X_n))≤v_p(disc NS(X)).

**Prerequisites:** [K3.9/simultaneous-norm](#K3-9-simultaneous-norm), [K3.8/fine-partner](#K3-8-fine-partner), [K3.8/partner-discriminant](#K3-8-partner-discriminant), [K3.0/cycle-lattice](#K3-0-cycle-lattice).

**Construction or proof.**

1. Compute v_n²=γ²+D²=0 and v_n·(0,D,0)=+2d.
2. The ℓ-unit norm of γ makes its geometric transcendental reduction primitive. With ℓ∤disc NS, saturation proves exact geometric Brauer order ℓ^n.
3. The vector (0,D,0) gives the coprime pairing killing the partner gerbe.
4. Apply the discriminant identity. Since ν_n divides 2d, its ℓ-valuation is zero and its p-contribution only lowers the partner p-valuation.

**Acceptance:** The sign of v_n·(0,D,0) is positive. Exact geometric Brauer order is proved before automatic stability is used.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.2 p.521; LMS Prop.3.5.6 arXiv v5; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.2 pp.521–522; LMS Prop.3.5.6; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.2 pp.522–523; Proposition 4.3.

<a id="K3-9-fixed-positive-square"></a>

### K3.9/fixed-positive-square — Fixed positive squares in Picard rank at least two

**Theorem.** If the geometric NS rank is at least two and all its classes are defined over the finite base field, choose a primitive D with D²=2d<0 and B⊥D with B²=2e>0. Run the partner sequence using γ²=−2d>0. The class (0,B,0) lies in v_n^⊥ and maps to B_n∈NS(X_n) with B_n²=2e. Thus the X_n have one fixed positive square despite unbounded ℓ-discriminants.

**Prerequisites:** [K3.9/partner-sequence](#K3-9-partner-sequence), [K3.8/isotropic-theta](#K3-8-isotropic-theta), `GeometryOfNumbersAndQuadraticArithmetic:GN.2`.

**Construction or proof.**

1. Use the signature (1,ρ−1) to choose rational orthogonal negative/positive directions and clear denominators, then primitive-normalize D.
2. Orthogonality to γ follows from γ⊥NS; evaluate the Mukai square and use integral θ.

**Acceptance:** The resulting B_n is a divisor on X_n, not on the original X.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proof of Theorem 1.4 p.522; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proof of Theorem 1.4 p.522, correcting X to X_n.

<a id="K3-9-growing-ample-square"></a>

### K3.9/growing-ample-square — Growing-square ample partner classes

**Theorem.** For D ample with D²=2d>0, h_n=(ℓ^(2n),ℓ^nγ,−2d) lies in v_n^⊥ and has h_n²=2dℓ^(2n). It gives H_n on X_n; a sign is ample when the source projective rank-one generic deformation exists, with the rational class of the lifted h_n proportional to a relative ample bundle. Generic ampleness alone is insufficient for special-fiber ampleness.

**Prerequisites:** [K3.9/partner-sequence](#K3-9-partner-sequence), [K3.8/isotropic-theta](#K3-8-isotropic-theta), `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Construction or proof.**

1. Compute h_n·v_n=0 and the displayed positive square.
2. Construct the determinant-preserving relative partner with generic Picard rank one and lift h_n.
3. Choose a relative ample A; generic rational proportionality extends across the smooth proper family using Picard specialization, so an appropriate tensor power of ±H_n agrees with a positive power of A on the special fiber.

**Acceptance:** Do not infer specialization of ampleness from openness in the reverse direction.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proof of Theorem 1.3 p.522; [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Expanded inference for Theorem 1.3 p.522, conditional on the required family.

<a id="K3-9-partner-admissibility-gate"></a>

### K3.9/partner-admissibility-gate — Conditional nonsuperspecial partner finiteness

**Theorem.** For the growing-square sequence in p≥5, assume infinitely many indices n satisfy both ℓ^(2n)≡1 mod N and nonsuperspecialness of X_n, as well as the relative ampleness hypotheses just stated. Then corrected Proposition 3.17 applies to these underlying X_n, contradicting their unbounded ℓ-discriminants. Nonsuperspecialness of X alone does not establish the assumption.

**Prerequisites:** [K3.9/growing-ample-square](#K3-9-growing-ample-square), [K3.7/unpolarized-finiteness](#K3-7-unpolarized-finiteness).

**Construction or proof.**

1. Take the infinite eligible subsequence, whose p-discriminants are bounded by the original surface.
2. The prime choice makes a,b squares modulo every ℓ-power; the congruence condition is met by multiples of the finite order of ℓ² modulo N.
3. Use finiteness of the underlying surfaces and the discriminant-growth contradiction.

**Acceptance:** This is an explicitly conditional geometric export, not an unconditional proof of the K3 Tate endpoint.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proof of Theorem 1.3, pp. 522–523.

<a id="K3-9-superspecial-transfer"></a>

### K3.9/superspecial-transfer — Superspecial deformation transfer

**Theorem.** For the source p≥5 route, superspecial K3 surfaces admit the indicated supersingular deformation to nonsuperspecial fibers; Artin’s constancy theorem supplies the divisor-rank transfer needed to reduce the late Tate endpoint to those fibers. The construction does not establish nonsuperspecialness of independently constructed partners.

**Prerequisites:** [K3.7/superspecial](#K3-7-superspecial), `AlgebraicModuliForArithmeticGeometry:R09.6`, `MotivesAndAlgebraicCycles:MC.7`.

**Construction or proof.**

1. Import Ogus’ supersingular deformation and Artin’s rank constancy in their exact scopes.
2. Use them only for the starting surface reduction.

**Acceptance:** Do not reuse this reduction as a proof of the separate partner gate.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proof of Theorem 1.3 p.522.

<a id="K3-9-geometric-exports"></a>

### K3.9/geometric-exports — Geometric inputs for the K3 Tate register

**Application.** Export to the late MC.7 theorem register: (i) the rank≥2 fixed-positive-square contradiction, conditional on the prescribed-norm and fixed-square-boundedness inputs in the chosen characteristic; (ii) the p≥5 growing-ample-square contradiction, conditional on the nonsuperspecial-partner gate. MC.7 owns Charles Theorems 1.3/1.4 and the finiteness↔Tate implications. This roadmap supplies their geometric proof data, without duplicating those endpoint theorems.

**Prerequisites:** [K3.9/fixed-positive-square](#K3-9-fixed-positive-square), [K3.4/finite-k3](#K3-4-finite-k3), [K3.9/partner-admissibility-gate](#K3-9-partner-admissibility-gate), [K3.9/superspecial-transfer](#K3-9-superspecial-transfer), [K3.9/brauer-tate-interface](#K3-9-brauer-tate-interface).

**Construction or proof.**

1. Compose the separately stated partner classes with fixed-square or admissible finiteness.
2. Keep characteristic-two birationality and characteristic-two/three norm/comparison source audits as separate gates on the rank≥2 route.
3. Send the contradiction to the cycle owner only after those gates are discharged.

**Acceptance:** No final K3 Tate theorem appears as a prerequisite of its own geometric proof.

**Sources:** [Charles16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorems 1.3–1.4, pp.489–490; proofs pp.520–523.

## K3.10 — K3 arithmetic orthogonal data

The signed transcendental K3 datum with b=20−ρ, André’s arithmetic rational Clifford comparison and potential good KS reduction, extension to the all-prime orthogonal model, and the separate special-endomorphism-to-divisor specialization/normalization theorem. Genericity means avoiding special divisors.

<a id="K3-10-transcendental-datum"></a>

### K3.10/transcendental-datum — The transcendental orthogonal datum of a K3

**Construction.** Let X/K be a K3 over a number field with all geometric Picard classes defined over K, and σ:K→C. In H²_Betti(X_σ,Z), Pic embeds primitively with signature (1,ρ−1); its rational orthogonal T has signature (2,20−ρ). Set Q_T(x)=−(x,x)_cup/2, so its polar bilinear form is −cup and the Clifford relation is x²=Q_T(x). Choose a lattice L maximal among lattices of T on which Q_T is integral; its signed signature is (b,2), b=20−ρ. Compare the genera for different σ and maximal choices through local realizations, retaining the required dyadic qualifications. The associated period avoids every rational special divisor by Lefschetz (1,1); no maximal Mumford–Tate-group assertion is made.

**Prerequisites:** [K3.0/cycle-lattice](#K3-0-cycle-lattice), [K3.0/ns-lattice](#K3-0-ns-lattice), `tauceti:TauCeti.IntegralLattice`, `tauceti:TauCeti.Hodge.HodgeStructureOn`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `MotivesAndAlgebraicCycles:MC.7`, `ShimuraVarieties:V6`.

**Construction or proof.**

1. Apply the K3 Hodge index/signature calculation and primitive embedding.
2. Take a maximal integral over-lattice in the rational complement using the integral quadratic-lattice supplier; compare local invariants at finite and real places.
3. A rational vector orthogonal to the period plane would be a rational (1,1) class orthogonal to all of Pic, hence zero.

**API.**

- `K3.transcendentalDatum` (constructor): Produce the rational orthogonal space, maximal integral lattice and signed Hodge line.
- `K3.transcendentalSignature` (characterisation): The signed signature is (20−ρ,2).
- `K3.transcendentalGenus` (compatibility): Compare allowed maximal lattices and embeddings in the source-qualified local genus.
- `K3.noSpecialDivisor` (relation): The period has no nonzero rational vector of special Hodge type in this complement.

**Uses.** K3SurfacesAndSymplecticBoundedness:K3.10/andre-descent: The andré’s arithmetic kuga–satake comparison target uses this the transcendental orthogonal datum of a k3 interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.10/integral-point: The the integral orthogonal point target uses this the transcendental orthogonal datum of a k3 interface with the stated normalization and base-change conditions.; K3SurfacesAndSymplecticBoundedness:K3.11/picard-jump-low-dimension: The low-dimensional picard-jump input target uses this the transcendental orthogonal datum of a k3 interface with the stated normalization and base-change conditions..

**Checks and worked examples.**

1. For geometric Picard rank one the rational complement has rank 21 and signed signature (19,2).
2. For geometric Picard rank twenty its signed signature is (0,2); the b≥3 height theorem cannot be applied.
3. A CM K3 period can have a smaller Mumford–Tate group and still avoid every special divisor of this transcendental datum.

**Acceptance:** For ρ=1 obtain b=19; for ρ=20 obtain b=0.

**Sources:** [SSTT22](https://doi.org/10.1017/fmp.2022.14), §9.1, p.44.

<a id="K3-10-andre-descent"></a>

### K3.10/andre-descent — André’s arithmetic Kuga–Satake comparison

**Theorem.** After a finite extension of K, the Kuga–Satake abelian variety of the polarized K3 Hodge structure is defined over K, and André’s comparison identifies the even Clifford algebra of primitive rational H²(1) with the endomorphisms of H¹ commuting with the Clifford action, equivariantly for Galois and the stated involutions. With the orthogonal supplier’s level and lattice data this yields the required point x∈M(K). André Main Lemma 1.7.1 alone does not supply an integral special-fiber divisor correspondence.

**Prerequisites:** [K3.10/transcendental-datum](#K3-10-transcendental-datum), `ShimuraVarieties:V6`, `MotivesAndAlgebraicCycles:MC.2`.

**Construction or proof.**

1. Apply the absolute-Hodge-cycle descent of the primitive Clifford comparison.
2. Pass to the finite extension defining the abelian variety, Clifford action, polarization and auxiliary level.
3. Use the orthogonal canonical-model moduli interpretation to compare the chosen maximal transcendental datum with the polarized KS construction.

**Acceptance:** The generic Galois-equivariant even-Clifford comparison, including the integral modules in André’s stated scope, is distinguished from a theorem about divisors on a special fiber.

**Sources:** [SSTT22](https://doi.org/10.1017/fmp.2022.14), §9.1, pp.44–45; [Andre96](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0305/LOG_0026.pdf), §1.7, Main Lemma 1.7.1, p.210.

<a id="K3-10-andre-good-reduction"></a>

### K3.10/andre-good-reduction — Potential good reduction of the KS variety

**Theorem.** If X/K has good reduction at every finite place, then after a finite extension its KS abelian variety has good reduction everywhere. The conclusion is potential good reduction before choosing one common extension, not unramifiedness of every auxiliary level field.

**Prerequisites:** [K3.10/andre-descent](#K3-10-andre-descent), `SchemeAndStackFoundations:SF.2`, `ShimuraVarieties:V6`.

**Construction or proof.**

1. Smooth proper base change makes the primitive H² Galois representation unramified at a good place.
2. The Clifford comparison constrains H¹ inertia to the central subgroup; after an extension giving semistable reduction and sufficiently fine level, unipotent central inertia is trivial.
3. Apply Néron–Ogg–Shafarevich and choose a finite extension handling the finitely many initially bad abelian places.

**Acceptance:** Use potential good reduction, not an unsupported integral canonical-model extension by generic properness.

**Sources:** [SSTT22](https://doi.org/10.1017/fmp.2022.14), §9.1, pp.44–45; [Andre96](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0305/LOG_0026.pdf), §9.1, p.240; Lemma 9.3.1 and proof, pp.241–242.

<a id="K3-10-integral-point"></a>

### K3.10/integral-point — The integral orthogonal point

**Theorem.** Under SSTT Theorem 1.1’s smooth projective O_K-model hypothesis after finite extension, the K3 KS point extends, after further finite extension, to Y∈M(O_K) for the all-prime integral orthogonal model. The generic point avoids all special divisors in the precise SSTT sense.

**Prerequisites:** [K3.10/andre-good-reduction](#K3-10-andre-good-reduction), [K3.10/transcendental-datum](#K3-10-transcendental-datum), `ShimuraVarieties:V6`.

**Construction or proof.**

1. Import the all-prime model’s extension property (SSTT Proposition 2.1(4)), with the required maximal lattice and KS moduli data.
2. Use the abelian scheme of good reduction and the level/tensor extension theorem, rather than invoking properness of M.

**Acceptance:** Only avoiding special divisors is required; full Mumford–Tate genericity is not assumed.

**Sources:** [SSTT22](https://doi.org/10.1017/fmp.2022.14), §9.1, pp.44–45; [SSTT22](https://doi.org/10.1017/fmp.2022.14), Proposition 2.1(4), p.10; §9.1, pp.44–45.

<a id="K3-10-specialization-correspondence"></a>

### K3.10/specialization-correspondence — Special endomorphisms and new divisor classes

**Comparison.** For a good reduction of the K3 KS datum with Q_T=−cup/2, a nonzero special endomorphism s with s²=[m], m>0, gives a nonzero rational divisor class on the geometric K3 reduction, orthogonal to specialized Pic(X_Kbar), with negative cup square. After clearing a positive denominator it gives an integral divisor. An isometric identification of the quadratic realizations would give cup square −2m before clearing denominators, and −2N²m after multiplication by N. The exact isometry and integral lattice comparison are separate requirements; they are not inferred merely from André Main Lemma 1.7.1.

**Prerequisites:** [K3.10/integral-point](#K3-10-integral-point), [K3.0/cycle-lattice](#K3-0-cycle-lattice), `MotivesAndAlgebraicCycles:MC.7`, `ShimuraVarieties:V6`, `CohomologyComparisons:CP.2`, `CohomologyComparisons:CP.5`.

**Construction or proof.**

1. Import the integral special-endomorphism realization with its primitive/crystalline and étale comparisons and good-reduction compatibility.
2. Identify the rational special (1,1)/Tate class with a divisor using the appropriate K3 special-fiber theorem supplied independently; audit that this input does not invoke the Picard-jump endpoint.
3. Use Q_T=−cup/2 and the Clifford relation s²=[Q_T(s)] consistently. Prove the rational class is nonzero and negative, then clear denominators; an exact integral norm requires its own lattice comparison.

**Acceptance:** André’s cited lemma compares generic-fiber Clifford realizations; special-fiber divisor algebraicity and normalization need their own proof interface. Negative square and orthogonality already suffice for the rank-jump deduction.

**Sources:** [SSTT22](https://doi.org/10.1017/fmp.2022.14), §9.1, pp.44–45; [Andre96](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0305/LOG_0026.pdf), Main Lemma 1.7.1(ii), p.210, compared with SSTT §9.1, pp.44–45.

## K3.11 — Picard jumps and rational curves

SSTT Theorem 1.1 in its potential smooth projective model scope, split between b≥3 height input and separately sourced b≤2 cases; the Li–Liedtke bounded-degree/rigidifier lifting criterion; and Corollary 1.3, infinitely many rational curves or infinitely many unirational supersingular reductions, with the model and rigidity inputs explicit.

<a id="K3-11-picard-jump-high-dimension"></a>

### K3.11/picard-jump-high-dimension — Picard jumps from special-divisor intersections

**Theorem.** Let X/K satisfy SSTT Theorem 1.1’s smooth projective O_K-model hypothesis after finite extension and let geometric Picard rank ρ≤17, so b=20−ρ≥3. There are infinitely many finite places with strictly larger geometric Picard rank. This target consumes the integral-point, special-divisor infinitude, and specialization-correspondence inputs with all their recorded proof gates.

**Prerequisites:** [K3.10/integral-point](#K3-10-integral-point), [K3.10/specialization-correspondence](#K3-10-specialization-correspondence), `GrossZagierAndArithmeticHeights:GZ.6`.

**Construction or proof.**

1. Import SSTT Theorem 1.8 for the all-prime model and a generic point avoiding every special divisor.
2. At each supplied place choose a nonzero special endomorphism and its new divisor class.
3. A nonzero negative class orthogonal to the nondegenerate specialized generic NS cannot lie in its rational span, so the geometric rank strictly increases.
4. Infinitely many places over a finite extension map to infinitely many places of K, whose geometric fibers have the same ranks.

**Acceptance:** The height theorem is used only for b≥3.

**Sources:** [SSTT22](https://doi.org/10.1017/fmp.2022.14), Theorem 1.1, p.2; proof, §9.1, pp.44–45.

<a id="K3-11-picard-jump-low-dimension"></a>

### K3.11/picard-jump-low-dimension — Low-dimensional Picard-jump input

**Theorem.** For K3 surfaces over number fields of geometric Picard rank 18,19 or20, supply the infinitely-many-rank-jumps conclusion by the separate b≤2 arithmetic arguments cited by SSTT (Charles 2018 and Shankar–Tang 2019), and the rank constraints in the b=0 case. State and prove the b=2, b=1 and b=0 cases separately; the b≥3 height theorem does not apply to them.

**Prerequisites:** [K3.10/transcendental-datum](#K3-10-transcendental-datum), [K3.0/cycle-lattice](#K3-0-cycle-lattice).

**Construction or proof.**

1. Separate b=2, b=1 and b=0. Use the exact exceptional-isogeny/arithmetic-intersection theorem needed in each case.
2. Compare that statement’s finite-extension and reduction hypotheses to the K3 datum; prove the Picard-rank translation as for the high-dimensional case.

**Acceptance:** The low-dimensional arguments must include their exact reduction and field-extension hypotheses.

**Sources:** [SSTT22](https://doi.org/10.1017/fmp.2022.14), Theorem 1.1, p.2; proof, §9.1, pp.44–45.

<a id="K3-11-picard-jump"></a>

### K3.11/picard-jump — Picard-rank jump theorem

**Theorem.** For a K3 surface X over a number field K admitting a smooth projective model over O_K after a finite extension, infinitely many finite places 𝔭 of K satisfy ρ(X_𝔭bar)>ρ(X_Kbar). The complete theorem combines the b≥3 and b≤2 cases; its proof is conditional on the explicitly requested specialization and low-dimensional inputs, rather than on an unmentioned stronger good-reduction theorem.

**Prerequisites:** [K3.11/picard-jump-high-dimension](#K3-11-picard-jump-high-dimension), [K3.11/picard-jump-low-dimension](#K3-11-picard-jump-low-dimension).

**Construction or proof.**

1. Split by geometric Picard rank at 18 and apply the corresponding preceding theorem.
2. Descend infinitude through the finite field-of-definition extension without asserting equality of arithmetic Picard groups.

**Acceptance:** Potentially good reduction is retained in the precise model form of Theorem 1.1.

**Sources:** [SSTT22](https://doi.org/10.1017/fmp.2022.14), Theorem 1.1, p.2; proof, §9.1, pp.44–45.

<a id="K3-11-rational-curves-criterion"></a>

### K3.11/rational-curves-criterion — The Li–Liedtke lifting criterion

**Theorem.** For a polarized K3 X over a number field with geometric Picard classes defined over that field, infinitely many smooth rank-jumping reductions outside a finite set of unirational reductions yield integral rational curves on X_Kbar of arbitrarily large H-degree by the Li–Liedtke strategy, subject to its rigidity and stable-map deformation inputs. The odd-Picard-rank assumption in the original proposition supplies jumps there; SSTT replaces that source of jumps with its theorem, rather than using the odd-rank theorem for every X.

**Prerequisites:** [K3.0/k3-surface](#K3-0-k3-surface), [K3.0/cycle-lattice](#K3-0-cycle-lattice), `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Construction or proof.**

1. Use the new divisor class at a rank jump and the Bogomolov–Mumford rational decomposition to obtain a rational component outside the specialized generic NS.
2. Bounded-degree maps P¹→X form a finite-type scheme. Infinitely many low-degree new reductions would lift a generic rational curve whose class was already in the generic NS; therefore the new curves have unbounded degree.
3. Spread the curve in the polarized K3 deformation space, use the horizontal divisor on which its class lifts, and choose a surface with a rigidifier.
4. Add a rigidifier and use properness and dimension estimates of genus-zero stable maps; connected fibers/Stein factorization and rigidity recover a generic rational component of at least the chosen degree.

**Acceptance:** Use the actual stable-map proof; infinite reduced rank jumps alone is not taken as a formal axiom for lifting curves. A published/author-version numbering comparison and the non-unirational rigidity branch remain explicit source gates.

**Sources:** [SSTT22](https://doi.org/10.1017/fmp.2022.14), Proof of Corollary 1.3, p.45; [LL12v2](https://arxiv.org/pdf/1012.3777v2), §3, Proposition 3.2 and Theorem 3.3 with proof, pp.9–11 in arXiv v2.

<a id="K3-11-rational-curves"></a>

### K3.11/rational-curves — Rational curves or unirational reductions

**Theorem.** Let X be a K3 surface over a number field with potentially good reduction everywhere. Then either X_Kbar contains infinitely many integral rational curves or X has infinitely many unirational, hence supersingular, geometric reductions. This is SSTT Corollary 1.3 in its stated scope.

**Prerequisites:** [K3.11/picard-jump](#K3-11-picard-jump), [K3.11/rational-curves-criterion](#K3-11-rational-curves-criterion).

**Construction or proof.**

1. If unirational reductions are infinite, the second alternative holds; import the K3 unirational⇒supersingular implication.
2. Otherwise remove that finite set and apply the rank-jump theorem and the Li–Liedtke lifting criterion to obtain unbounded degrees, hence infinitely many rational curves.
3. Audit the comparison between local potential good reduction and the globally polarized smooth-model hypothesis used in the rank-jump theorem; retain it as a gate if the chosen model theorem is not available.

**Acceptance:** Everywhere potentially good reduction is not silently replaced by a weaker condition.

**Sources:** [SSTT22](https://doi.org/10.1017/fmp.2022.14), Corollary 1.3, p.3; proof, §9.1, p.45.

## Required supplier interfaces

Each interface below is a direct dependency of named targets. A parent-stage reference for a Part II denotes a required extension in that owner’s direction; its generic scope alone does not prove the stronger statement.

### SchemeAndStackFoundations:SF.2

Proper/smooth base change, Kummer and Hochschild–Serre with integral ℓ-adic coefficients, coherent cohomology for proper smooth surfaces, Serre duality, and completed cycle-class compatibility. Require ℓ invertible and use geometric versus arithmetic cohomology explicitly.

**Consumers:** [K3.0/k3-surface](#K3-0-k3-surface), [K3.0/cycle-lattice](#K3-0-cycle-lattice), [K3.8/arithmetic-transcendental](#K3-8-arithmetic-transcendental), [K3.8/b-field](#K3-8-b-field), [K3.9/frobenius-brauer](#K3-9-frobenius-brauer), [K3.10/andre-good-reduction](#K3-10-andre-good-reduction).

### SchemeAndStackFoundations:SF.5

Surface Riemann–Roch, adjunction, Chern character/Todd class, trace/cup and intersection, Hodge index for N¹_R, and the K3 linear-series vanishing inputs with their characteristic restrictions. Supply one shared intersection theory, not a private K3 copy.

**Consumers:** [K3.0/ns-lattice](#K3-0-ns-lattice), [K3.1/mukai-vector](#K3-1-mukai-vector), [K3.1/mukai-rr](#K3-1-mukai-rr), [K3.4/nef-linear-series](#K3-4-nef-linear-series), [K3.8/twisted-vector](#K3-8-twisted-vector).

### MotivesAndAlgebraicCycles:MC.2

Integral first Chern classes with Tate twists, cup/trace and correspondence realization, and compatibility of Betti, de Rham, crystalline and prime-to-p étale maps in the scopes supplied by their comparison owners.

**Consumers:** [K3.0/cycle-lattice](#K3-0-cycle-lattice), [K3.2/bb-form](#K3-2-bb-form), [K3.2/theta](#K3-2-theta), [K3.8/isotropic-theta](#K3-8-isotropic-theta), [K3.9/brauer-tate-interface](#K3-9-brauer-tate-interface), [K3.10/andre-descent](#K3-10-andre-descent).

### ComplexComparisonPartII:C5

Supply multiplicative cup/trace/first-Chern compatibility of the concrete proper de Rham–Betti and pure-Hodge maps already referenced, plus the analytic family/local-system comparisons used by the IHS period map. No new Hodge-structure carrier is requested.

**Consumers:** [K3.0/cycle-lattice](#K3-0-cycle-lattice), [K3.1/ihs](#K3-1-ihs), [K3.5/positive-projectivity](#K3-5-positive-projectivity), [K3.5/period-map](#K3-5-period-map).

### AlgebraicModuliForArithmeticGeometry:R09.6

Polarized K3 formal deformation and Picard obstruction/representability machinery, smooth W-algebraization with ample bundle, Grothendieck existence for twisted sheaves, and the projective rank-one relative partner family. Supply the relative determinant-line correspondence that lifts a positive power of the auxiliary line bundle over the entire polarized formal base. K3-specific calculations remain in this roadmap. Formal representability and effectivity must be proved, not assumed.

**Consumers:** [K3.0/picard-lift](#K3-0-picard-lift), [K3.5/period-map](#K3-5-period-map), [K3.6/period-cover](#K3-6-period-cover), [K3.7/polarized-deformation](#K3-7-polarized-deformation), [K3.7/line-lift](#K3-7-line-lift), [K3.8/isotropic-partner](#K3-8-isotropic-partner), [K3.9/growing-ample-square](#K3-9-growing-ample-square), [K3.9/superspecial-transfer](#K3-9-superspecial-transfer), [K3.11/rational-curves-criterion](#K3-11-rational-curves-criterion).

### AlgebraicModuliForArithmeticGeometry:R09.4

Hilbert/Quot and Chow parameter spaces, bounded-degree maps and Hilbert data, stackification and explicit relative stable-map stacks. The additional stable/twisted-sheaf and stable-map proof contracts exceed the current restricted elliptic/abelian scope and require the Part II extension recorded in gaps; the stage alone does not certify them.

**Consumers:** [K3.1/coprime-stability](#K3-1-coprime-stability), [K3.1/hilbert-points](#K3-1-hilbert-points), [K3.2/stable-moduli](#K3-2-stable-moduli), [K3.4/k3-boundedness](#K3-4-k3-boundedness), [K3.4/finite-k3](#K3-4-finite-k3), [K3.5/deformation-representatives](#K3-5-deformation-representatives), [K3.6/period-cover](#K3-6-period-cover), [K3.6/ihs-boundedness](#K3-6-ihs-boundedness), [K3.6/ihs-family](#K3-6-ihs-family), [K3.8/b-field](#K3-8-b-field), [K3.8/twisted-vector](#K3-8-twisted-vector), [K3.8/isotropic-partner](#K3-8-isotropic-partner), [K3.8/fine-partner](#K3-8-fine-partner), [K3.11/rational-curves-criterion](#K3-11-rational-curves-criterion).

### AlgebraicModuliForArithmeticGeometry:R09.5

Coarse moduli, rigidification, quasi-universal sheaves and descent obstructions, finite-field Br=0 and line-bundle descent. Stable/twisted-sheaf gerbes are the requested Part II extension, not objects already supplied by this stage.

**Consumers:** [K3.2/stable-moduli](#K3-2-stable-moduli), [K3.3/descent-refinement](#K3-3-descent-refinement), [K3.4/ns-descent](#K3-4-ns-descent), [K3.4/finite-k3](#K3-4-finite-k3), [K3.7/finite-ns](#K3-7-finite-ns), [K3.8/isotropic-partner](#K3-8-isotropic-partner).

### MotivesAndAlgebraicCycles:MC.0

Correspondence composition, trace/norm along finite field extension and push-pull identities needed by θ and rational Tate descent. Use the shared Chow/realization owner.

**Consumers:** [K3.2/theta](#K3-2-theta), [K3.9/brauer-tate-interface](#K3-9-brauer-tate-interface).

### CrystallineCohomology:CR.2

Smooth-lift crystalline–de Rham identification, filtration/base-change maps and the Hodge/conjugate comparison for degree-two K3 cohomology.

**Consumers:** [K3.2/hodge-moduli](#K3-2-hodge-moduli), [K3.7/superspecial](#K3-7-superspecial), [K3.7/admissible-hodge](#K3-7-admissible-hodge).

### CrystallineCohomology:CR.3

Proper smooth finite crystalline complexes and their derived reductions with Frobenius; free individual H²/H³ is a separate K3/moduli theorem and is not assumed from perfectness.

**Consumers:** [K3.2/hodge-moduli](#K3-2-hodge-moduli), [K3.7/admissible](#K3-7-admissible).

### CohomologyComparisons:CP.5

Integral lattice recovery with free adjacent degrees and the actual comparison maps. Supply the source-qualified saturation theorem needed for Corollary 2.7 and primitive special-endomorphism intersections; no integral conclusion from rational comparison alone.

**Consumers:** [K3.2/hodge-moduli](#K3-2-hodge-moduli), [K3.2/theta-specialization](#K3-2-theta-specialization), [K3.7/admissible-hodge](#K3-7-admissible-hodge), [K3.7/ns-special-endomorphisms](#K3-7-ns-special-endomorphisms), [K3.10/specialization-correspondence](#K3-10-specialization-correspondence).

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3

Unramified small-weight comparison and torsion-freeness in low cohomological degree, with filtration interval [0,p−2] after a common shift; prove separately any p=3 or weight-(p−1) endpoint needed by the source. The p≥5 degree-two use lies in the safe range.

**Consumers:** [K3.2/hodge-moduli](#K3-2-hodge-moduli).

### GeometryOfNumbersAndQuadraticArithmetic:GN.2

Extend beyond the existing generic lattice/localization nodes: Charles Proposition 2.9 primitive positive rank-two embeddings Λ⊂⟨2d⟩⊕U transported to ⟨2md⟩⊕U with m≡1 mod N and a,b square residues, preserving primitivity; absorb primes dividing (2d)! into N. Also supply odd-ℓ unimodular rank≥2 representation of every unit, the rank-one square-discriminant case, primitive isotropic quotient determinant and maximal-lattice local genus comparisons (including dyadic distinctions).

**Consumers:** [K3.3/rank-two-plane](#K3-3-rank-two-plane), [K3.3/zarhin](#K3-3-zarhin), [K3.9/conditional-norm](#K3-9-conditional-norm), [K3.9/simultaneous-norm](#K3-9-simultaneous-norm), [K3.9/fixed-positive-square](#K3-9-fixed-positive-square), [K3.10/transcendental-datum](#K3-10-transcendental-datum).

### GeometryOfNumbersAndQuadraticArithmetic:GN.3

Supply integral lattice finiteness at bounded rank/signature and nonzero absolute determinant, a bounded positive represented square for each of the finitely many hyperbolic classes, and the uniform finite-order integral-automorphism exponent in rank≤22. Existing mass/theta nodes are not these finiteness theorems.

**Consumers:** [K3.4/ns-descent](#K3-4-ns-descent), [K3.7/finite-ns](#K3-7-finite-ns), [K3.7/unpolarized-finiteness](#K3-7-unpolarized-finiteness).

### MotivesAndAlgebraicCycles:MC.7

Expose early independent leaves for the integral Lefschetz (1,1) theorem, Tate–Brauer equivalence over finite fields (including the dyadic qualification), and rational Tate finite-field descent via MC.0/MC.2 trace. Keep Charles Theorems 1.3/1.4 as late consumers of this roadmap. The broad known-cases register is not an acyclic substitute for the early leaves. For K3.10 special-fiber algebraicity choose an independently sourced K3 divisor theorem with no dependency on Picard jumps, or follow the late K3.9→MC.7→K3.10 route after discharging the K3.9 gates. This late input must not feed the partner contradiction.

**Consumers:** [K3.5/positive-projectivity](#K3-5-positive-projectivity), [K3.7/ns-special-endomorphisms](#K3-7-ns-special-endomorphisms), [K3.8/arithmetic-transcendental](#K3-8-arithmetic-transcendental), [K3.9/brauer-tate-interface](#K3-9-brauer-tate-interface), [K3.9/superspecial-transfer](#K3-9-superspecial-transfer), [K3.10/transcendental-datum](#K3-10-transcendental-datum), [K3.10/specialization-correspondence](#K3-10-specialization-correspondence).

### ShimuraVarieties:V0

Arithmetic orthogonal quotients and torsion-free finite-index subgroups, applied to the extendable IHS polarization stabilizer; IHS monodromy finite index remains a local target.

**Consumers:** [K3.5/period-datum](#K3-5-period-datum), [K3.5/monodromy-arithmetic](#K3-5-monodromy-arithmetic).

### ShimuraVarieties:V2

Baily–Borel algebraization of the arithmetic orthogonal period quotient with the actual group/action and component hypotheses.

**Consumers:** [K3.5/monodromy-arithmetic](#K3-5-monodromy-arithmetic).

### ShimuraVarieties:V3

Borel algebraicity for the family period map with its algebraic-source compactification and torsion-free target hypotheses.

**Consumers:** [K3.5/period-map](#K3-5-period-map).

### CohomologyComparisons:CP.2

Rational crystalline/étale comparison compatible with cup, Chern classes, Galois, Frobenius and Tate twist (1) for good-reduction K3 and KS families.

**Consumers:** [K3.7/admissible](#K3-7-admissible), [K3.7/ns-special-endomorphisms](#K3-7-ns-special-endomorphisms), [K3.10/specialization-correspondence](#K3-10-specialization-correspondence).

### CrystallineCohomology:CR.4

Degree-two ordinary crystals, Newton/Hodge polygons and conjugate filtrations; the relevant K3 ordinary/deformation implications retain Ogus hypotheses.

**Consumers:** [K3.7/strong-admissible](#K3-7-strong-admissible), [K3.7/superspecial](#K3-7-superspecial).

### ShimuraVarieties:V6

The generic orthogonal Hodge-type canonical model. The good-prime KS and all-prime GSpin integral models, primitive H²(1) tensor, finite unramified KS map, finite images over a fixed abelian fiber, special-endomorphism lattice and extension property are requested as OrthogonalIntegralModelsAndKugaSatake, a Part II of this owner, currently absent. This generic stage alone does not provide those integral theorems.

**Consumers:** [K3.7/ns-special-endomorphisms](#K3-7-ns-special-endomorphisms), [K3.7/finite-ns](#K3-7-finite-ns), [K3.10/transcendental-datum](#K3-10-transcendental-datum), [K3.10/andre-descent](#K3-10-andre-descent), [K3.10/andre-good-reduction](#K3-10-andre-good-reduction), [K3.10/integral-point](#K3-10-integral-point), [K3.10/specialization-correspondence](#K3-10-specialization-correspondence).

### tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

Import the current upstream Layer 10 identity-class positive Dirichlet density and hence infinitude of rational primes splitting completely in one prescribed finite Galois extension, after deleting any finite exceptional set. hasDirichletDensity_splitCompletely is the current suggested theorem, not a baseline implementation claim.

**Consumers:** [K3.9/simultaneous-norm](#K3-9-simultaneous-norm).

### tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places

Import current upstream Layer 5 canonical continuous completion maps and the degree-one completion identification at split rational primes, supplying embeddings of every element of the common splitting field into Q_ℓ. Arbitrary abstract Q_ℓ embeddings are not substituted.

**Consumers:** [K3.9/simultaneous-norm](#K3-9-simultaneous-norm).

### GrossZagierAndArithmeticHeights:GZ.6

Extend the curve-level arithmetic generating-series scope as GSpinSpecialDivisorHeights, currently absent: for b≥3, a maximal integral lattice of signature (b,2), and Y∈M(O_K) avoiding every special divisor generically, infinitely many finite places meet some Z(m), m>0 (SSTT Theorem 1.8). Retain the source corrections routed to that supplier; no GSpin height theory is duplicated here.

**Consumers:** [K3.11/picard-jump-high-dimension](#K3-11-picard-jump-high-dimension).

## Required proof interfaces and endpoint restrictions

The theorem statements above must be proved with the following inputs. They also specify exactly when the conditional finite-field and arithmetic arguments yield their endpoints.

### 1. K3 classical geometry and coherent foundations

Establish the finite-rank even Picard lattice, K3 minimality, the finite-height Picard lift (Lieblich–Maulik Corollary 4.2), Artin’s dimension-nine infinite-height locus, and the K3 fixed-component/linear-series theorems. These are K3 specializations of the shared surface, coherent-cohomology and deformation interfaces.

**Targets:** [K3.0/ns-lattice](#K3-0-ns-lattice), [K3.0/cycle-lattice](#K3-0-cycle-lattice), [K3.0/picard-lift](#K3-0-picard-lift), [K3.4/nef-linear-series](#K3-4-nef-linear-series), [K3.4/finite-k3](#K3-4-finite-k3).

### 2. Stable and twisted sheaf moduli Part II

The general moduli Part II must provide Langer’s relative projective stable-sheaf theorem, fixed-determinant μ_r-gerbes, twisted Chern characters and GRR, period-index rank-r existence, and the K₀ realization in LMS Lemma 3.4.3, pp.300–301. The K3-specific nonemptiness, dimension, symplecticity, FM and θ targets remain in K3.2/K3.8.

**Targets:** [K3.2/stable-moduli](#K3-2-stable-moduli), [K3.2/theta](#K3-2-theta), [K3.8/twisted-vector](#K3-8-twisted-vector), [K3.8/isotropic-partner](#K3-8-isotropic-partner), [K3.8/fine-partner](#K3-8-fine-partner).

### 3. Mukai and Hilbert geometric comparison proof leaves

Supply the Mukai/Yoshioka integral comparison and Beauville Hilbert-scheme geometry used in Charles Theorem 2.4, pp.493–497. Prove integral θ normalization despite quasi-universal similitudes, use only the Hilbert–Chow open stratum in Proposition 2.6, p.498, and verify the needed degree-two/three cohomology. Deformation equivalence does not imply birationality.

**Targets:** [K3.1/hilbert-points](#K3-1-hilbert-points), [K3.2/stable-moduli](#K3-2-stable-moduli), [K3.2/bb-form](#K3-2-bb-form), [K3.2/theta](#K3-2-theta), [K3.8/isotropic-theta](#K3-8-isotropic-theta).

### 4. Small-weight and specialization endpoints

Supply Fontaine–Messing low-degree freeness and the precise Elsenhans–Jahnel specialization theorem used in Charles Proposition 2.6 and Corollary 2.7, pp.498–499. Distinguish W-lifts from ramified lifts, low-degree from full Hodge degeneration, and the [0,p−2] comparison range from endpoint claims. Retain p=3 explicitly.

**Targets:** [K3.2/hodge-moduli](#K3-2-hodge-moduli), [K3.2/theta-specialization](#K3-2-theta-specialization), [K3.3/zarhin-witt](#K3-3-zarhin-witt), [K3.7/admissible-hodge](#K3-7-admissible-hodge).

### 5. Primitive embedding and bounded integral lattice supplier

GN.2/GN.3 must supply Charles Proposition 2.9, pp.500–502, with primitive input embedding, the A_(2md) discriminant group, and exclusion of primes dividing (2d)!. They also supply finite integral lattice classes with bounded rank/signature/determinant and the odd-prime unit-norm theorem. These are shared lattice targets.

**Targets:** [K3.3/rank-two-plane](#K3-3-rank-two-plane), [K3.3/zarhin](#K3-3-zarhin), [K3.4/ns-descent](#K3-4-ns-descent), [K3.7/unpolarized-finiteness](#K3-7-unpolarized-finiteness), [K3.9/simultaneous-norm](#K3-9-simultaneous-norm), [K3.10/transcendental-datum](#K3-10-transcendental-datum).

### 6. Characteristic-two birationality leaf

For Charles Proposition 3.1, p.506, prove jet separation and degree-one/separability for the map on a nonreduced general member in characteristic two, or give a replacement birational linear-series theorem. In the branch C=2C_red, positivity gives C²≥8; the small-degree inequality is not the unresolved point.

**Targets:** [K3.4/k3-boundedness](#K3-4-k3-boundedness), [K3.4/finite-k3](#K3-4-finite-k3), [K3.9/geometric-exports](#K3-9-geometric-exports).

### 7. IHS projectivity, period and birational proof leaves

Use Huybrechts 1999 Theorem 3.11 with its 2003 erratum, Beauville local Torelli, Sullivan/Markman arithmeticity and the Verbitsky/Markman parallel-transport Torelli theorem. The finite algebraic period-cover construction must prove global coverage, not infer it from local analytic openness. Kollár–Matsusaka and family birational bounds are general-moduli inputs; Baily–Borel/Borel belong to the Shimura owner.

**Targets:** [K3.5/positive-projectivity](#K3-5-positive-projectivity), [K3.5/deformation-representatives](#K3-5-deformation-representatives), [K3.5/monodromy-arithmetic](#K3-5-monodromy-arithmetic), [K3.5/torelli](#K3-5-torelli), [K3.6/period-cover](#K3-6-period-cover), [K3.6/ihs-boundedness](#K3-6-ihs-boundedness).

### 8. Orthogonal integral models Part II

The orthogonal Part II must provide both the p≥5 nondegenerate primitive-lattice KS finiteness theorem used in Charles Lemma 3.12, p.514, and the all-prime maximal-lattice model, special cycles and extension property of SSTT Proposition 2.1, p.10. Good-prime smoothness alone does not give the all-prime normal model.

**Targets:** [K3.7/ns-special-endomorphisms](#K3-7-ns-special-endomorphisms), [K3.7/finite-ns](#K3-7-finite-ns), [K3.10/andre-descent](#K3-10-andre-descent), [K3.10/integral-point](#K3-10-integral-point), [K3.10/specialization-correspondence](#K3-10-specialization-correspondence).

### 9. Early and late MC.7 interfaces need separation

Separate early Lefschetz (1,1), Tate–Brauer and trace descent from the late K3 Tate register. The special-fiber divisor theorem for K3.10 must have an independent proof or follow the late K3.9→MC.7 route; it must not feed back into the partner contradiction. Include characteristic-two qualifications.

**Targets:** [K3.5/positive-projectivity](#K3-5-positive-projectivity), [K3.7/ns-special-endomorphisms](#K3-7-ns-special-endomorphisms), [K3.9/brauer-tate-interface](#K3-9-brauer-tate-interface), [K3.9/frobenius-brauer](#K3-9-frobenius-brauer), [K3.10/transcendental-datum](#K3-10-transcendental-datum).

### 10. Strong admissibility deformation proof

Establish the exact Ogus polarized deformation and ordinary-lift hypotheses, including de Rham Chern-class nonvanishing, and Artin’s supersingular rank constancy. Prove global power-lifting of L over the full formal base. Use the finite free obstruction module with rank-binomial symmetric-power factor, rather than asserting its rank is one.

**Targets:** [K3.7/polarized-deformation](#K3-7-polarized-deformation), [K3.7/line-lift](#K3-7-line-lift), [K3.7/strong-zarhin](#K3-7-strong-zarhin), [K3.7/ns-special-endomorphisms](#K3-7-ns-special-endomorphisms), [K3.9/superspecial-transfer](#K3-9-superspecial-transfer).

### 11. Original-field norm and small-characteristic audit

The original-field norm route requires the corrected Frobenius and discriminant hypotheses. The LMS quadratic-extension proof in p≥5 gives a separate sufficient route. For the all-characteristic rank≥2 export, supply characteristic-two/three norm, moduli and integral quotient comparisons independently.

**Targets:** [K3.9/conditional-norm](#K3-9-conditional-norm), [K3.9/geometric-exports](#K3-9-geometric-exports).

### 12. Infinitely many nonsuperspecial partners

In the growing-degree argument, prove infinitely many eligible X_n nonsuperspecial, or prove a superspecial-partner finiteness theorem compatible with their growing discriminants. Reducing the starting X to the nonsuperspecial case does not establish this property for its partners (Charles Theorem 1.3 proof, pp.522–523).

**Targets:** [K3.9/partner-admissibility-gate](#K3-9-partner-admissibility-gate), [K3.9/geometric-exports](#K3-9-geometric-exports).

### 13. Relative partner ampleness

Construct the projective rank-one generic relative partner with a lift of h_n. Compare that class to a relative ample bundle and extend their rational proportionality to the special fiber. Openness of ampleness alone does not give special-fiber ampleness (Charles p.522).

**Targets:** [K3.9/growing-ample-square](#K3-9-growing-ample-square), [K3.9/partner-admissibility-gate](#K3-9-partner-admissibility-gate).

### 14. All-prime special-endomorphism algebraicity and normalization

Supply an all-prime K3 special-fiber divisor-algebraicity theorem compatible with the KS comparison, and compare its quadratic realization with Q_T=−cup/2. André Main Lemma 1.7.1, p.210, is a generic Clifford comparison; the rational negative divisor and its denominator control are separate inputs to the SSTT p.45 argument.

**Targets:** [K3.10/specialization-correspondence](#K3-10-specialization-correspondence), [K3.11/picard-jump-high-dimension](#K3-11-picard-jump-high-dimension).

### 15. GSpin height Part II

The GSpin height Part II supplies SSTT Theorem 1.8, p.4, for b≥3 and integral points avoiding all special divisors. It includes the uniformity required in the odd-b coefficient estimate. K3.11 consumes the special-divisor infinitude conclusion rather than reproducing its height proof.

**Targets:** [K3.11/picard-jump-high-dimension](#K3-11-picard-jump-high-dimension).

### 16. Low-dimensional exceptional-reduction sources

Prove the separate b=2 and b=1 exceptional-reduction inputs cited from Charles 2018 and Shankar–Tang 2019, and the b=0/ρ=20 rank argument. Match their finite-extension and good-reduction hypotheses. SSTT footnote 1, p.4, excludes these cases from the b≥3 theorem.

**Targets:** [K3.11/picard-jump-low-dimension](#K3-11-picard-jump-low-dimension), [K3.11/picard-jump](#K3-11-picard-jump).

### 17. Li–Liedtke version, rigidity and stable-map leaves

Identify published Li–Liedtke Proposition 4.2/Theorem 4.3 with the corresponding accessible v2 Proposition 3.2/Theorem 3.3, pp.9–11. Supply genus-zero stable-map properness, the rigidifier theorem (v2 Theorem 2.9), deformation dimensions and the horizontal divisor argument. Prove that the finite-unirational-exception hypothesis suffices for the rigidity branch used in the K3 application.

**Targets:** [K3.11/rational-curves-criterion](#K3-11-rational-curves-criterion), [K3.11/rational-curves](#K3-11-rational-curves).

### 18. Potential-good-reduction model comparison

Pass from everywhere local potential good reduction to the simultaneous polarized smooth projective model required by SSTT Theorem 1.1 after one finite extension. Prove the K3 unirational⇒supersingular implication. Smooth proper algebraic-space models and globally projective schemes must not be identified without the model theorem.

**Targets:** [K3.11/rational-curves](#K3-11-rational-curves).

## Suggested statement file

The companion `.lean` file states rational Mukai-pairing and positive B-field identities on Mathlib’s existing product, module and bilinear-form carriers, together with small sign and discriminant checks. The reader supplies the geometric definitions and all 74 targets. Geometry must first construct its schemes, moduli spaces, cohomology and comparison maps; no placeholder carrier is used to state an endpoint prematurely. The rational isometry theorem does not imply preservation of an integral lattice.
