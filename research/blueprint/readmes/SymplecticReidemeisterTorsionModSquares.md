# Symplectic Reidemeister torsion mod squares and the étale Chern class

This roadmap constructs an invariant of a local system by comparing two volumes in its determinant line: a cellular volume, and a square-root volume supplied by Poincaré duality. In dimension three its normalized value is the evaluation of an étale second Chern class. The comparison applies over every coefficient field of characteristic different from two, and extends to normal finite-type coefficient rings as an equality of μ₂-torsor classes.

For a closed smooth oriented three-manifold M and a symplectic local system ρ of rank 2r, put χ₁/₂(M,ρ)=dim H⁰(M,ρ)−dim H¹(M,ρ). The targets include its evenness and the formula

**N(M,ρ) = [(−1)^{χ₁/₂(M,ρ)/2}] RT(M,ρ) = ⟨ρ*c_et,[M]⟩.**

Three further conclusions matter to consumers: normalized torsion of the boundary of a compact oriented 4j-manifold is trivial; the spinor norm on the first cohomology of a surface is the Chern evaluation on its mapping torus; and the real degree-three Chern component vanishes on the full mod-two homology of the discrete symplectic group. The surface statement includes odd finite coefficient fields. A chosen intertwiner of the coefficient system is part of its data.

The construction is not restricted to acyclic local systems. All manifold targets here use compact **smooth** manifolds, with the boundary orientation when relevant. Extending the scope to arbitrary topological manifolds would require additional triangulation or cellular arguments. The arithmetic central-value theorem and the geometry of Hurwitz/PEL spaces belong to SymplecticLFunctionsModSquares; this roadmap supplies their topological input.

## Conventions and build boundary

Cochains have increasing integer degrees. R[k] is in degree −k; the differential on C[1] is −d. The dual differential on (C∨)^q=(C^{−q})* is (−1)^{q+1}(d^{−q−1})*. The cone of f:C→D is D⊕C[1], with differential (y,x)↦(d_Dy+fx,−d_Cx). Tensor symmetry is the Koszul sign (−1)^{pq}. A dimension-n pairing is C⊗C→R[−n]. Shifting once changes the symmetry sign and decreases dimension by two.

The graded determinant category and its exact-triangle coherence are imported. A line inverse reverses tensor order; evaluation is right-ordered. Double inverse on a line of parity a acts by (−1)^a. On a vector space of dimension n the dual determinant uses the **reversed dual wedge**, differing from standard wedge duality by (−1)^{n(n−1)/2}. The shift comparison is fixed by the cone of the identity, not by an independently chosen scalar. These choices govern every volume below.

Write scalar square classes multiplicatively in the mathematics: 1 means a square. Tau Ceti's `SquareClassGroup` is additive, so its identity is 0; `squareClassHom` lands in its multiplicative wrapper. A square class in a line has no origin until a nonzero reference vector is chosen. Over a normal domain the correct target is H¹_et(R,μ₂), allowing a nontrivial two-torsion root line, rather than only Rˣ/Rˣ².

`disc(V)` always means the **unsigned Gram determinant** modulo squares. It does not include (−1)^{n(n−1)/2}. A generalized eigenspace means the stable kernel of a sufficiently high power; a fixed space is only the ordinary kernel. They cannot be interchanged in a discriminant formula.

The transformation's source is **H₃(BSp_{2r}(R);ℤ)/2**. It is not silently replaced by H₃(BSp_{2r}(R);F₂). Over finite fields the imported odd-order H₂ result removes the UCT correction; over general rings this replacement is unjustified. The real c₃₁ conclusion deliberately has the stronger full-mod-two domain and has a separate proof.

## Existing work and imported interfaces

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Declaration statements were read at these revisions. All eight distinct source files behind the thirteen baseline declarations were independently read at the pins and compared byte for byte with the shared build. The current upstream roadmap checkout and current Tau Ceti library were inspected separately to avoid planning work added after the atlas snapshot.

The reviewed audits AUDIT-29 and AUDIT-30 in `data/library-coverage.json` identify the relevant higher K-theory, determinant and étale Chern targets as absent or only partly built. Their partial results are retained as imports. The current AlgebraicTopology and OrthogonalSpinGroups readers were used as style and ownership references; relevant Suggested files and the GeometricTopology, Chebotarev and LieGroups supplier scopes were inspected. In particular, this roadmap does **not** construct a second spinor norm or a second general determinant functor.

| Existing owner | Exact imported nodes or interface | Boundary |
| --- | --- | --- |
| KTheoryLowDegrees Z.3 | `graded-line-groupoid`, `graded-line-tensor`, `graded-line-inverse` | Integer grading, Picard category, Koszul tensor and inverse |
| KTheoryLowDegrees Z.6 | `determinant-triangle`, `bounded-complex-det` | Coherent determinant of perfect/bounded complexes; owned here are AV's parity, shift and reverse-wedge adapters |
| KTheoryFiniteLocalFields L.1 | `finite-rank-symplectic-h3-mod-two`, `finite-classical-h3-coefficient-comparison`, `finite-rank-symplectic-etale-isomorphism`, `finite-field-transfer-formulas` | Odd finite fields, actual finite-rank H₃ and its Chern map; H₂ is only required to have odd order, including SL₂(F₉) |
| K3BlochGroups V.2 | `number-field-stable-hurewicz-equivalence` | Number-field indecomposable K₃ and stable integral SL homology |
| K3BlochGroups V.4 | Explicit request below | Hutchinson–Tao unstable H₃(SL₂) surjectivity |
| MotivicEtaleKTheory M.1 | `etale-kummer-sequences`, plus requested line-pair/gluing interface | Kummer coefficients and μ₂-torsors |
| MotivicEtaleKTheory M.7–M.8 | Explicit requests below | The precise dyadic number-field surjection, universal normal-ring Chern classes and real Bockstein components |
| StableHomotopyKTheory H.1 | `classifying-space-of-group`, `bar-complex-comparison` | BG and natural comparison with group homology; plus-construction inputs are already encapsulated by the imported K₃ comparisons |
| Upstream AlgebraicTopology | Stages 2,4,5,6, with exact IDs below | Local coefficients, finite cellular comparison, Wang triangle and Poincaré–Lefschetz duality |
| Upstream GeometricTopology | Layers 6 and 11, with the smooth comparison request below | The geometric bordism category and simple cellular changes; labelled bordism and low-degree comparison are targets here |
| Upstream Chebotarev | Layers 7,11,13 | Auxiliary cyclotomic disjointness, weighted tail estimates and weighted natural Frobenius density |
| Pinned Tau Ceti | `CliffordAlgebra.spinorNorm`, square-class functoriality | Reused directly; the star-norm versus reflection-value convention is compared only where needed on SO |

The current AnalyticNumberTheory AN.4 scope does not supply Chebotarev for arbitrary finite-type normal arithmetic schemes. RT.5 records this as a genuine producer/primary-proof gap and proposes an AnalyticNumberTheory Part II. This dependency is not replaced by the number-field theorem.

## Two sign calculations to retain during implementation

### Specialization and the normalized root line

Raw torsion extends uniquely from a fraction field to a normal coefficient ring under the stated self-duality and volume hypotheses. In this generality its value can change sign at a cohomology jump. Shift the dimension-three complex by one to a symmetric dimension-1 complex D. Locally strictify and add paired, canonically trivialized contractible summands until all term ranks are even. Let

s = Σ_{q≤0}(−1)^q rank D^q, and L=σ≥1 D.

The local torsor representing the normalized invariant is **[(−1)^{s/2}] e_D/ν_L**. In a field fibre let h=χ≤0(D). The alternating middle differential has rank s−h=2r. Splitting into a hyperbolic cohomology part and an acyclic middle part gives ν_L=(−1)^rν_upperH. Therefore the displayed local value is (−1)^{h/2}RT. It uses term ranks and line data, so it commutes with specialization even when h changes. Undoing the shift gives h=−χ₁/₂(M,ρ), with the same half-sign. Normality glues the local torsors through their fixed generic identification; it is not used to pretend that a specialization induces an inclusion of fraction fields.

A regression model uses the orthogonal circle over Q[s]_(s), form H⊕H and monodromy diag(1+s,(1+s)⁻¹)⊕I₂. The generic fixed-space dimension is two, while the special dimension is four. Generic raw torsion is [−(1+s)] and special raw torsion is 1. Their normalized values are [1+s] and 1. This makes the failure of raw base change visible without assuming the final Chern comparison. The three-dimensional symplectic family theorem uses the same strict shifted-complex calculation, together with the separately established evenness theorem. The circle is a counterexample to the broad base-change assertion in §2.3.3, p. 13; it does not establish a geometric three-dimensional symplectic counterexample to the narrower B.10 discussion.

### The circle in every odd characteristic

For A∈SO(V,B) with dim V=n even, first suppose 1+A invertible. The circle model is strict with cross pairing P=B((1+A)/2−,−). The form P(x,(1−A)y)=B((A−A⁻¹)x/2,y) is alternating, so n−h=2r, h=dim ker(1−A). Relative to the based cellular generator e, the upper-term root has class (−1)^{n/2}det P, and its ratio with the upper-cohomology root is (−1)^r. Hence

**(−1)^{h/2}RT_based = disc(B) det((1+A)/2).**

For general A, decompose into the generalized −1 block V₋ and its orthogonal complement U. Both dimensions are even; on V₋ the circle differential is invertible with determinant 2^{dim V₋}, a square. Apply the strict calculation on U, retaining disc(B|U). If the total discriminant is square, disc(B|U)=disc(B|V₋) modulo squares. Jouve–Rodriguez Villegas, Theorem 5.1, identifies this with θ(A). No logarithm, Jacobson–Morozov argument or lifting of a finite-field representation is required.

For a useful test over F₃, let B be hyperbolic of dimension four and A=diag(U,U⁻ᵀ), U=[[1,1],[0,1]]. The fixed space has dimension two, normalized torsion is 1 and raw torsion is [−1]. This exercises a nonsemisimple finite-characteristic case and the normalization simultaneously.

## Layer specifications

Every target below has its own packet node. The displayed statements, proof contracts, planning API and tests are the specification. Smaller proof steps remain inside their target rather than becoming a second declaration hierarchy. A dependency written as a supplier stage has an explicit contract in the supplier register. All implementation statuses remain unchecked.


## RT.0. Symmetric complexes and algebraic boundaries

Signed cochain conventions; ε-symmetric and strict Poincaré complexes; explicit algebraic boundary; semicharacteristic parity and local constancy; local strictification and field splitting; cellular manifold pairings.

**Layer inputs:** `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

### Cochain, shift, dual and cone conventions — `cochain-conventions`

Use bounded cochain complexes of finite projective R-modules, R commutative and 2 invertible. R[k] is in degree −k; C[1]^q=C^{q+1} with differential −d. The dual has (C∨)^q=(C^{−q})*, differential (−1)^{q+1}(d^{−q−1})*. Tensor symmetry on degrees p,q is (−1)^{pq}. Cone(f)^q=D^q⊕C^{q+1}, d(y,x)=(d_D y+f x,−d_C x). The comparison (C[1])∨≃C∨[−1] multiplies degree q by (−1)^q, and cone-duality uses the corresponding signed summand interchange.

**Construction/proof contract.**

1. Express these as identifications on the existing cochain carrier, rather than a second complex structure.

2. Check the chain-map equations degree by degree; derive cone-duality from the displayed differential and the Koszul evaluation.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `mathlib:CochainComplex`.

**Sources:** AV-v1, Appendix A.1–A.2, (A.1)–(A.5), pp. 61–63: These are the conventions used for all subsequent signs.

### Symmetric Poincaré complexes — `symmetric-complex`

For such C, n∈ℤ and ε∈{1,−1}, an ε-symmetric dimension-n structure is a degree-zero chain map T:C⊗C→R[−n] satisfying T(x,y)=ε(−1)^{pq}T(y,x) on x∈C^p,y∈C^q. Its adjoint f:C→C∨[−n] uses the evaluation convention of cochain-conventions. It is Poincaré when f is a quasi-isomorphism and strict when f is an isomorphism. These are distinct predicates on the same pairing data.

**Construction/proof contract.**

1. Construct the adjoint using the signed evaluation and prove its chain-map law.

2. Show that shifting once changes (ε,n) to (−ε,n−2).



**Planning API.**

- `SymmetricComplex.pairing` (data): Recover the bilinear degree-n pairing and its symmetry and closedness laws.

- `SymmetricComplex.adjoint` (projection): The associated cochain map C→C∨[−n].

- `SymmetricComplex.shift` (compatibility): Shift by one changes dimension by −2 and symmetry sign by −1.

- `SymmetricComplex.isStrict_iff` (characterisation): Strictness is equivalent to every component of the adjoint being an isomorphism.



**Uses.** RT.0 algebraic-boundary: Its adjoint is the cone map.; RT.1 Lagrangian volume: Strictness supplies a termwise exact orthogonal quotient.

**Checks.**

- `SymmetricComplex.hyperbolic` (computation): L⊕L∨[−n] with evaluation cross terms is strict.

- `SymmetricComplex.acyclic_zero_pairing` (non-example): A nonzero contractible complex with zero pairing is Poincaré but is not strict.

- `SymmetricComplex.shift_sign` (compatibility): A skew dimension-3 structure becomes symmetric of dimension 1 after one shift.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/cochain-conventions`, `mathlib:HomologicalComplex.homology`.

**Sources:** AV-v1, Appendix A.3, (A.6)–(A.7) and Remark A.1, pp. 63–64: Pairs a complex with its shifted dual and distinguishes derived from termwise nondegeneracy.

### The algebraic boundary — `algebraic-boundary`

Given an ε-symmetric dimension-n C with adjoint f, put ∂alg C=Cone(f). It has a canonical strict ε-symmetric structure of dimension n−1, with Lagrangian C∨[−n] and quotient C[1]. In degree q write (α,x)∈(C^{n−q})*⊕C^{q+1}; for p=n−1−q set T∂((α,x),(β,y))=(−1)^q α(y)+ε(−1)^{qp+p}β(x). The cone differential is the one fixed above.

**Construction/proof contract.**

1. Check closedness using symmetry of f and the signed dual differential.

2. The cross-term matrix is invertible with unit signs, independently of whether f is a quasi-isomorphism.

3. Identify the adjoint of the first summand with the projection to its shifted dual.



**Planning API.**

- `AlgebraicBoundary.of` (constructor): Construct the boundary with the displayed signed cross pairing.

- `AlgebraicBoundary.isStrict` (structure): Its adjoint is an isomorphism.

- `AlgebraicBoundary.lagrangian` (projection): The inclusion C∨[−n]→∂alg C has quotient C[1].

- `AlgebraicBoundary.map` (functoriality): Isometries of C induce isometries of its boundary.



**Uses.** RT.2 boundary-volumes: Compare its cone Lagrangian with brutal and cohomological Lagrangians.; RT.2 bordism: Model boundary cochains of a manifold.

**Checks.**

- `AlgebraicBoundary.zero` (degenerate): The boundary of the zero complex is zero.

- `AlgebraicBoundary.scalar` (computation): For C=R in degree zero and symmetric f=(a), the boundary is R→a R in degrees −1,0 with the prescribed hyperbolic cross pairing, even when a=0.

- `AlgebraicBoundary.not_original_lagrangian` (non-example): The kernel summand is C∨[−n], not C; its degree agrees with the cone inclusion.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/symmetric-complex`.

**Sources:** AV-v1, Appendix A.5, diagram (A.9), p. 65: The cone provides a strict boundary even when the original pairing is degenerate.

### Semicharacteristic — `semicharacteristic`

For a bounded cochain complex C of finite-dimensional K-vector spaces and a cutoff m, define χ≤m(C)=Σ_{q≤m}(−1)^q dim_K H^q(C); the sum is finite. For dimension 2m+1 Poincaré complexes use χ₁/₂=χ≤m. For a local coefficient system on a closed 3-manifold this is dim H⁰−dim H¹. Over rings only the fibrewise value modulo two is initially defined.

**Construction/proof contract.**

1. Take the finite sum on any support interval; show independence of that interval.

2. Transport under cohomology isomorphisms, keeping the integer value rather than only parity.



**Planning API.**

- `Semicharacteristic.of` (data): Return the finite alternating cohomology sum at a cutoff.

- `Semicharacteristic.quasiIso` (functoriality): Quasi-isomorphic complexes have the same value at every cutoff.

- `Semicharacteristic.directSum` (compatibility): The integer is additive under finite direct sums.

- `Semicharacteristic.three` (characterisation): For support [0,3] the midpoint value is dim H⁰−dim H¹.



**Uses.** RT.2 bordism: Normalizes the boundary torsion.; RT.3 normalized-family: Explains the specialization sign at jumps.

**Checks.**

- `Semicharacteristic.zero` (degenerate): The zero complex has semicharacteristic zero.

- `Semicharacteristic.sphere3_rank2` (computation): The degree-zero/degree-three rank-two cohomology of S³ has χ₁/₂=2.

- `Semicharacteristic.degree1` (computation): K concentrated in degree 1 has χ≤1=−1, so omitting the alternating sign fails.



**Direct dependencies:** `mathlib:CochainComplex`, `mathlib:HomologicalComplex.homology`.

**Sources:** AV-v1, Appendix A.6, (A.10), pp. 65–66; §2.3.4, p. 13: Defines the integer whose half controls the torsion sign.

### Parity and local constancy — `strict-parity`

For a strict symmetric dimension-1 complex over a field of characteristic ≠2, χ≤0(C)≡Σ_{q≤0}dim C^q (mod 2). For a finite projective symmetric Poincaré complex over a ring with 2 invertible, this fibrewise parity is locally constant. Shift to obtain the analogous statement in dimension 2m+1 with symmetry (−1)^m.

**Construction/proof contract.**

1. The form (x,y)↦T(d⁰x,y) on C⁰ is alternating with radical ker d⁰; hence rank d⁰ is even. The relevant quotient is C⁰/ker d⁰, not coker d⁰.

2. Euler cancellation below degree zero gives Σ_{q≤0}(−1)^q(dim C^q−dim H^q)=rank d⁰.

3. Use local strictification and locally constant ranks of finite projectives.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/semicharacteristic`, `SymplecticReidemeisterTorsionModSquares:RT.0/local-strictification`.

**Sources:** AV-v1, Appendix A.6, (A.11)–(A.12), pp. 65–66: The parity claim is retained with its middle-differential argument corrected.

### Local strictification — `local-strictification`

For a bounded finite projective ε-symmetric Poincaré complex over a commutative ring R with 2 invertible, every prime has a Zariski neighbourhood on which it admits a finite free strict model related by a pairing-preserving quasi-isomorphism up to chain homotopy.

**Construction/proof contract.**

1. Over a local ring cancel differential entries that are units, obtaining a finite minimal free complex.

2. On its residue-field reduction the differential is zero; the Poincaré adjoint is then an isomorphism in each degree. Nakayama makes the adjoint invertible after localization.

3. Transfer the pairing through the contraction and average it with its signed transpose using 1/2; shrink to a finite free neighbourhood.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/symmetric-complex`.

**Sources:** AV-v1, Appendix A.6.2, p. 66: Reduces ring-valued sign calculations to strict complexes locally.

### Splitting a strict symmetric complex — `strict-splitting`

Over a field of characteristic ≠2, a strict symmetric dimension-1 complex splits isometrically as Q⊕Q∨[−1]⊕E, where Q is quasi-isomorphic to τ≤0 C and E is acyclic, supported in degrees 0,1, with invertible alternating middle differential after dual identification.

**Construction/proof contract.**

1. Choose complements to boundaries in cycles and to cycles in terms.

2. Pair complementary degrees by strict duality; absorb off-diagonal terms using 1/2.

3. The residual acyclic pair has terms in degrees 0 and 1. Its middle map has even rank.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/symmetric-complex`.

**Sources:** AV-v1, Appendix A.7, pp. 66–67: The orthogonal splitting isolates the acyclic sign contribution, with the degree table shifted to its correct positions.

### Cellular Poincaré pairing — `manifold-pairing`

For a compact smooth oriented n-manifold X with boundary and a finite projective locally constant ε-self-dual R-system ρ, construct a finite cellular cochain model and the Poincaré–Lefschetz adjoint C*(X,∂X;ρ)→C*(X;ρ)∨[−n]. For closed X, transfer from a compatible dual cellulation and symmetrize to obtain an ε-symmetric Poincaré complex. Its pairing is well defined up to pairing-preserving homotopy equivalence.

**Construction/proof contract.**

1. Import finite smooth triangulations and dual cells with boundary, rather than assuming arbitrary topological manifolds triangulable.

2. Use local-coefficient cap product and orientation; compare dual and primal cellular complexes.

3. Average the transferred pairing with its signed transpose. Record the relative triangle compatible with restriction to ∂X.



**Planning API.**

- `ManifoldPairing.closed` (constructor): The pairing on a closed oriented cellular model.

- `ManifoldPairing.lefschetz` (compatibility): The absolute/relative adjoint realizes Poincaré–Lefschetz duality.

- `ManifoldPairing.boundaryCone` (compatibility): The algebraic boundary of the compactly supported/relative pairing models boundary cochains with the boundary orientation.



**Uses.** RT.2 cellular-volume: Carries the duality comparison of distinguished volumes.; RT.2 bordism: Identifies the algebraic boundary with geometric boundary cochains.

**Checks.**

- `ManifoldPairing.point` (computation): On an oriented point the pairing is the original fibre pairing.

- `ManifoldPairing.reverse` (compatibility): Reversing the fundamental orientation negates the pairing.

- `ManifoldPairing.boundary` (compatibility): For an interval the cone comparison gives its two endpoints with opposite orientations.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/symmetric-complex`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-11-triangulations-pl-structures-and-collapse`.

**Sources:** AV-v1, Appendix A.4–A.5, pp. 64–65: Builds the chain-level pairing used by the determinant calculation.

**Layer acceptance and remaining work.** Discharge the explicit upstream local-coefficient, Poincaré–Lefschetz and smooth finite-cell supplier contracts.

## RT.1. Determinant signs and Lagrangian volumes

Import graded lines and the coherent determinant functor. Specify parity reduction, line square classes, reverse-wedge duality, shifts, strongly even termwise comparisons, cohomology determinants and Lagrangian square classes.

**Layer inputs:** `SymplecticReidemeisterTorsionModSquares:RT.0`, `KTheoryLowDegrees:Z.3`, `KTheoryLowDegrees:Z.6`.

### Parity and inverse conventions for graded lines — `graded-line-adapter`

Import the integer-graded Picard groupoid of KTheoryLowDegrees and reduce the grading modulo two. Keep the Koszul commutor (−1)^{ab}, the inverse of a product in reversed order, and right-ordered evaluation. Under the resulting identification the double inverse on a line of parity a acts by (−1)^a. Do not replace the inverse by an ungraded dual identification.

**Construction/proof contract.**

1. Descend the commutor through parity since (−1)^{ab} depends only on residues modulo two.

2. Compute double inverse using evaluation and the commutor on a homogeneous line.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `KTheoryLowDegrees:Z.3/graded-line-groupoid`, `KTheoryLowDegrees:Z.3/graded-line-tensor`, `KTheoryLowDegrees:Z.3/graded-line-inverse`.

**Sources:** AV-v1, Appendix B.1, (B.1)–(B.2), pp. 68–69: Only the AV parity and inverse convention adapter is owned here; the underlying category is imported.

### Square classes in a determinant line — `line-square-class`

For a one-dimensional K-vector space L, let Sq(L)=(nonzero vectors of L)/Kˣ². It is a torsor under Multiplicative(TauCeti.SquareClassGroup K), without a preferred element. Every L⊗L has a canonical square class represented by l⊗l. A chosen nonzero e∈L turns a root identification A⊗A≃L into the scalar square class e/ν_A. Carry parity when tensoring graded root lines.

**Construction/proof contract.**

1. Construct the quotient relation and prove independence of a nonzero generator of A.

2. Transport along line isomorphisms; retain the commutor sign when rearranging two root squares.



**Planning API.**

- `LineSquareClass.mk` (constructor): The class of a nonzero vector in a line.

- `LineSquareClass.square` (constructor): The canonical class of A⊗A.

- `LineSquareClass.ratio` (projection): The ratio of two classes in the same line is a scalar square class.

- `LineSquareClass.tensorSwap` (compatibility): Moving two root lines of parities a,b past one another multiplies the resulting square class by [(-1)^{ab}].



**Uses.** RT.1 Lagrangian-volume: An intrinsic square is transported into det C.; RT.2 torsion: Divide the cellular class by the cohomological root class.

**Checks.**

- `LineSquareClass.rescale` (characterisation): e and u²e define the same class, while over Q, e and 2e do not.

- `LineSquareClass.no_origin` (non-example): Changing the reference e to 2e changes scalar coordinates by [2].

- `LineSquareClass.odd_swap` (computation): Two odd root lines introduce [−1] on swapping their middle factors; two even root lines introduce 1.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.1/graded-line-adapter`, `tauceti:TauCeti.SquareClassGroup`, `tauceti:TauCeti.squareClassHom`.

**Sources:** AV-v1, Appendix B.1.1, (B.3)–(B.4), p. 69: Square classes are intrinsic to lines before a cellular volume makes them scalar.

### Reverse-wedge determinant duality — `exotic-duality`

For finite-dimensional V, equip det(V∨)≃det(V)^{-1} with the reverse-wedge convention: on a basis v₁,…,vₙ use reversed dual wedge. Its scalar difference from standard wedge duality is exoticSign(n)=(−1)^{n(n−1)/2}. Extend this normalization through the imported determinant functor and its exact-sequence coherence; the shift map det(C[1])≃det(C)^{-1} is the one induced by Cone(id_C).

**Construction/proof contract.**

1. The number of transpositions reversing n entries is n(n−1)/2.

2. Use the exact-sequence determinant coherence to extend to bounded complexes.

3. Check that duality and the Cone(id) shift commute in the signed diagram, rather than independently choosing a shift scalar.



**Planning API.**

- `exoticSign` (data): The unit (−1)^{n(n−1)/2} over a field.

- `Determinant.exoticDuality` (equivalence): The determinant-dual line equivalence with this normalization.

- `Determinant.shiftDuality` (compatibility): The duality/shift square is commutative with the signed double-inverse identification.

- `exoticSign_add` (compatibility): ExoticSign(m+n)=ExoticSign(m)ExoticSign(n)(−1)^{mn}.



**Uses.** RT.1 Lagrangian-volume: Identifies the dual quotient determinant.; RT.2 PD-volume: Explains the factor (−1)^{dχ(X)}.

**Checks.**

- `ExoticSign.small` (computation): For dimensions 0,1,2,3,4 the signs are 1,1,−1,−1,1.

- `ExoticDuality.rank2` (compatibility): In rank two reverse-wedge duality is the negative of the standard duality.

- `ExoticDuality.rank1sum` (non-example): The direct sum of two rank-one lines has an extra −1, so ungraded multiplicativity fails.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.1/graded-line-adapter`, `KTheoryLowDegrees:Z.6/determinant-triangle`, `KTheoryLowDegrees:Z.6/bounded-complex-det`.

**Sources:** AV-v1, Appendix B.2–B.3.1, (B.6)–(B.12), pp. 70–73: The duality normalization is the source of the boundary sign and differs from the usual wedge convention.

### Strongly even complexes — `strongly-even`

A finite projective complex is strongly even when every term has locally constant even rank. Over a field this means Even(dim C^q) for every integer q. For bounded complexes this implies even Euler characteristic. It is independent of requiring every cohomology group to have even dimension: neither condition implies the other.

**Construction/proof contract.**

1. Use the rank predicate on each term; over a general ring impose it at every prime.

2. Show invariance under termwise isomorphism, shifts, duality and finite direct sums, but do not claim invariance under arbitrary quasi-isomorphism.



**Planning API.**

- `StronglyEven` (data): Every term has even rank.

- `StronglyEven.shift` (compatibility): Every integer shift of a strongly even complex is strongly even.

- `StronglyEven.dual` (compatibility): The dual has the same parity condition.

- `StronglyEven.directSum` (compatibility): A direct sum of strongly even complexes is strongly even.

- `StronglyEven.euler_even` (compatibility): The Euler characteristic of a bounded strongly even complex is even, over each field fibre.



**Uses.** RT.1 termwise-determinant: Eliminates the signs from permuting degree factors.; RT.3 even-strict-model: Supplies local models for normalized specialization.

**Checks.**

- `StronglyEven.zero` (degenerate): The zero complex is strongly even.

- `StronglyEven.odd_contractible` (non-example): K→id K is acyclic with Euler characteristic zero but is not strongly even.

- `StronglyEven.rank2` (computation): Any complex whose nonzero terms are K² is strongly even, independently of its differential.

- `StronglyEven.odd_cohomology` (computation): The complex K²→K² in degrees zero and one with differential diag(1,0) is strongly even, but both cohomology groups have dimension one.



**Direct dependencies:** `mathlib:CochainComplex`.

**Sources:** AV-v1, Appendix B.4.1, pp. 73–75: The rank condition removes termwise Koszul commutation signs.

### Termwise determinants of strongly even complexes — `termwise-determinant`

For a strongly even bounded complex, the canonical ordered tensor identification det C≃⊗_q(det C^q)^{(-1)^q} is compatible with degreewise split exact sequences, the Cone(id) shift and reverse-wedge duality. Use increasing degree order and the corrected brutal-truncation exact sequence σ≥r C→σ≥r−1 C→C^{r−1}[1−r].

**Construction/proof contract.**

1. Filter by brutal truncations and apply the imported exact-triangle determinant.

2. Every term determinant has even grading, so the rearrangements have sign one.

3. Compare dual and shifted filtrations with the fixed reverse-wedge and Cone(id) conventions.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.1/strongly-even`, `SymplecticReidemeisterTorsionModSquares:RT.1/exotic-duality`, `KTheoryLowDegrees:Z.6/bounded-complex-det`.

**Sources:** AV-v1, Appendix B.4.1, (B.13)–(B.14), pp. 73–75: Gives the explicit comparison used in cellular volume and boundary calculations.

### Determinant versus cohomology — `cohomology-determinant`

For a bounded finite-dimensional cochain complex over a field, construct the natural isomorphism det C≃det H*(C) by the two exact sequences B→Z→H and Z→C→B[1], cancelling the boundary factors with the fixed shift evaluation. It agrees with identity for zero differential, the canonical acyclic determinant for acyclic C, and respects shifts, reverse-wedge duality and split exact sequences.

**Construction/proof contract.**

1. Apply the determinant exact-sequence isomorphisms in the stated order.

2. Cancel B with B[1] using the prescribed shift map.

3. Verify injection/cone compatibility using the octahedral coherence of the imported determinant. Do not assert naive compatibility for every nonsplit cohomology sequence without its exact-sequence torsion signs.



**Planning API.**

- `Determinant.cohomology` (equivalence): The determinant isomorphism from C to its graded cohomology.

- `Determinant.cohomology_natural` (functoriality): Naturality for quasi-isomorphisms.

- `Determinant.cohomology_dual` (compatibility): Compatibility with the chosen duality and shift.

- `Determinant.cohomology_cone` (compatibility): For an injection A→B, identify the cone determinant with the quotient determinant using the exact triangle and shift.



**Uses.** RT.2 torsion: Transports the cellular volume to cohomology.; RT.2 boundary-volumes: Compares brutal and cohomological Lagrangians.

**Checks.**

- `Determinant.cohomology_zero_d` (computation): For zero differential the comparison is the identity on the ordered determinant tensor.

- `Determinant.cohomology_scalar` (computation): For K→a K, a≠0, the acyclic comparison records a or its inverse according to the fixed determinant ratio, hence the square class [a].

- `Determinant.cohomology_shift` (compatibility): Shifting K→a K inverts its determinant scalar; it must not leave the ungraded determinant unchanged.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.1/exotic-duality`, `KTheoryLowDegrees:Z.6/determinant-triangle`, `mathlib:HomologicalComplex.homology`.

**Sources:** AV-v1, Appendix B.4.2–B.4.3, (B.15)–(B.17), pp. 75–76: Fixes the cohomological identification used to define torsion.

### Lagrangian subcomplexes — `lagrangian`

For a strict ε-symmetric dimension-n complex C, a Lagrangian is a finite projective subcomplex ι:L→C for which the adjoint quotient gives a degreewise split exact sequence 0→L→C→L∨[−n]→0. This includes isotropy and L=L⊥. The vector-space case has n=0. For odd n the determinant has a square-root identification from L.

**Construction/proof contract.**

1. Form the adjoint quotient by restricting the pairing to L.

2. Require the exact sequence and its pairing compatibility, rather than defining a Lagrangian by dimension alone.



**Planning API.**

- `Lagrangian.inclusion` (projection): The isotropic inclusion into C.

- `Lagrangian.quotient` (universal-property): The quotient is the prescribed shifted dual of L.

- `Lagrangian.hyperbolic` (constructor): The first summand of L⊕L∨[−n] is Lagrangian.

- `Lagrangian.upper` (constructor): For strict odd-dimensional C, its upper brutal truncation is Lagrangian.



**Uses.** RT.1 Lagrangian-volume: Provides the exact determinant factorization.; RT.2 boundary-volumes: Identifies the three competing square roots.

**Checks.**

- `Lagrangian.hyperbolic` (computation): The coordinate K in a two-dimensional hyperbolic plane is Lagrangian.

- `Lagrangian.zero` (degenerate): The zero subcomplex is Lagrangian only if C is zero.

- `Lagrangian.nonisotropic` (non-example): Over Q, the line spanned by (1,1) in the form diag(1,1) has half dimension but is not Lagrangian.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/symmetric-complex`.

**Sources:** AV-v1, Appendix B.5, (B.18), pp. 76–77: The exact quotient is the input needed by determinant volumes.

### The square class of a Lagrangian — `lagrangian-volume`

For odd n, a Lagrangian L in a strict ε-symmetric C induces det C≃det L⊗det(L∨[−n])≃(det L)² using the exact sequence, reverse-wedge duality and the fixed shifts. Transport the canonical square to ν_L∈Sq(det C). Direct sums obey ν_{L₁⊕L₂}=(−1)^{χ(L₁)χ(L₂)}ν_{L₁}ν_{L₂}; the sign is one if both Lagrangians are strongly even. In degree zero the analogous vector-space volume is independent of L for a symplectic form, and in the orthogonal case depends only on its Grassmannian component.

**Construction/proof contract.**

1. Apply the imported determinant exact-sequence isomorphism, then the signed dual and odd shift.

2. The tensor-square class is independent of the root generator.

3. Compute the direct-sum permutation once; for symplectic vector spaces compare Darboux bases.



**Planning API.**

- `Lagrangian.volume` (constructor): The distinguished square class in det C.

- `Lagrangian.volume_isometry` (functoriality): Isometries carrying L to L′ carry their classes to one another.

- `Lagrangian.volume_sum` (compatibility): The direct-sum formula includes (−1)^{χ(L₁)χ(L₂)}.

- `Lagrangian.volume_termwise` (characterisation): For strongly even L, it is the product of the paired-degree vector-space volumes.



**Uses.** RT.2 torsion: The upper cohomology Lagrangian defines its denominator.; RT.3 normalized-family: The upper brutal Lagrangian gives a root line over the base ring.

**Checks.**

- `Lagrangian.volume_generator` (characterisation): Rescaling a root determinant generator by u multiplies its image by u², leaving ν_L unchanged.

- `Lagrangian.volume_odd_sum` (computation): Two odd root determinant lines produce a minus sign in the direct-sum class.

- `Lagrangian.volume_symplectic_plane` (compatibility): The two coordinate Lagrangians in a symplectic plane give the same volume, using the signed dual identification.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.1/lagrangian`, `SymplecticReidemeisterTorsionModSquares:RT.1/line-square-class`, `SymplecticReidemeisterTorsionModSquares:RT.1/exotic-duality`, `SymplecticReidemeisterTorsionModSquares:RT.1/termwise-determinant`.

**Sources:** AV-v1, Appendix B.5, (B.18)–(B.19), pp. 76–78: Constructs the distinguished class and makes its multiplicative sign explicit.

**Layer acceptance and remaining work.** Realize the imported KTheoryLowDegrees graded-line and determinant nodes; formalize the reviewed reverse-wedge and shift diagrams.

## RT.2. Cellular torsion and bordism signs

Construct symplectic and cellular volumes, prove invariance under elementary cellular changes and subdivision, compare duality volumes, define torsion in odd dimensions and compute its orientation and boundary signs. Prove normalized boundary torsion is trivial in dimension 4j−1.

**Layer inputs:** `SymplecticReidemeisterTorsionModSquares:RT.0`, `SymplecticReidemeisterTorsionModSquares:RT.1`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-11-triangulations-pl-structures-and-collapse`.

### The symplectic determinant volume — `symplectic-volume`

A finite projective R-module of rank 2r with perfect alternating form has a canonical trivialization of its determinant line. Locally choose a symplectic basis (e₁,f₁,…,e_r,f_r) with ω(e_i,f_i)=1 and use their ordered wedge. The local generators glue because every symplectic change of basis has determinant one. This is the Pfaffian volume normalization; do not divide ω^r by r! in positive characteristic.

**Construction/proof contract.**

1. Construct symplectic bases over local rings by splitting a hyperbolic plane and induction, then shrink to neighbourhoods.

2. Use the existing all-rank determinant-one theorem on transitions and glue the determinant trivializations.

3. Compare with the Lagrangian volume convention in a standard symplectic basis.



**Planning API.**

- `SymplecticVolume.of` (constructor): The canonical determinant generator for a finite projective symplectic module.

- `SymplecticVolume.isometry` (functoriality): Symplectic isometries preserve the generator.

- `SymplecticVolume.baseChange` (compatibility): The generator commutes with extension of scalars.

- `SymplecticVolume.lagrangian` (compatibility): The associated square class agrees with the vector-space Lagrangian construction.



**Uses.** RT.2 cellular-volume: Choose a volume in each cell fibre.; RT.3 normalized-family: Supply a volume for projective coefficient systems.

**Checks.**

- `SymplecticVolume.plane` (computation): For ω(e,f)=1 the generator is e∧f with the stated order.

- `SymplecticVolume.rank0` (degenerate): In rank zero the generator is 1∈R.

- `SymplecticVolume.char3` (non-example): In rank six over F₃ the volume remains nonzero even though 3! vanishes, so a formula requiring division by 3! is invalid.



**Direct dependencies:** `mathlib:SymplecticGroup.det_eq_one`, `SymplecticReidemeisterTorsionModSquares:RT.1/exotic-duality`.

**Sources:** AV-v1, §2.3, pp. 11–12; Appendix B.5 and B.7, pp. 76–78, 80: Even rank and the canonical symplectic volume remove cellular orientation and ordering ambiguities.

### The Reidemeister cellular volume — `cellular-volume`

For a finite cell pair (X,A) and an even-rank self-dual local system ρ, choose a symplectic volume on fibres, or in the orthogonal case a specified self-dual determinant generator for standard wedge duality. The ordered tensor of the oriented cell-fibre generators defines e_{X,A}∈det C*(X,A;ρ). Even rank makes this independent of cell orientations, cell ordering and compatible fibre trivializations. It respects the absolute/relative exact sequence.

**Construction/proof contract.**

1. Use the finite-cell decomposition of each cochain term.

2. Changing a cell orientation gives (−1)^{rank ρ}=1; swapping blocks gives the same even-rank sign; monodromy preserves the given volume.

3. Use the determinant exact-sequence map in the fixed cell order to identify e_X=e_{X,A}e_A.



**Planning API.**

- `CellularVolume.relative` (constructor): The determinant generator of the relative cochain model.

- `CellularVolume.changeCells` (compatibility): Orientation, ordering and volume-preserving cell trivializations leave the generator unchanged.

- `CellularVolume.pair` (compatibility): For A⊂X, the absolute generator factors as the relative generator followed by the generator of A.

- `CellularVolume.baseChange` (functoriality): The determinant generator commutes with base change of the coefficient system.



**Uses.** RT.2 torsion: Its image in det H* is divided by the Poincaré root class.; RT.2 bordism: Absolute and relative volumes determine the boundary volume.

**Checks.**

- `CellularVolume.point` (computation): For one zero-cell the generator is the fibre volume.

- `CellularVolume.reverse_edge` (compatibility): Reversing one edge in even rank does not change its determinant generator.

- `CellularVolume.odd_rank` (non-example): For a rank-one system over Q, reversing a cell orientation changes its generator by −1; the even-rank hypothesis is necessary.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.2/symplectic-volume`, `SymplecticReidemeisterTorsionModSquares:RT.1/termwise-determinant`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources:** AV-v1, §2.3, pp. 11–12; Appendix B.7, p. 80: Constructs the numerator of torsion before using Poincaré duality.

### Subdivision and simple cellular invariance — `cellular-invariance`

For compact smooth manifolds with compatible finite triangulations, the determinant quasi-isomorphism induced by an elementary cellular expansion/collapse with volume-preserving even-rank coefficients carries e to e. Hence the scalar torsion square class is independent of triangulation, using common subdivisions and elementary simple changes. An arbitrary quasi-isomorphism alone does not preserve a chosen cellular volume.

**Construction/proof contract.**

1. Compute the two-term acyclic cell pair of an elementary expansion: its attaching matrix is a signed monodromy matrix of determinant one in even rank.

2. Apply determinant multiplicativity to its cancellation.

3. Use compatible subdivisions and simple comparison maps for smooth finite triangulations; transport Poincaré duality with them.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.2/cellular-volume`, `SymplecticReidemeisterTorsionModSquares:RT.1/cohomology-determinant`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-11-triangulations-pl-structures-and-collapse`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources:** AV-v1, §2.3, pp. 11–12; Appendix B.7, p. 80: Makes the asserted triangulation independence a separate proof contract rather than a consequence of determinant quasi-isomorphism invariance.

### Poincaré duality and cellular volumes — `duality-volume`

For a compact oriented n-manifold X and rank-2d symplectic ρ, the determinant Poincaré–Lefschetz map det C_X→det(C_{X,∂X}∨[−n])→(det C_{X,∂X})^{(-1)^{n+1}} sends e_X to (−1)^{dχ(X)}e_{X,∂X}^{(-1)^{n+1}} under reverse-wedge duality. In the orthogonal case track the specified standard self-dual volume and its conversion to reverse-wedge duality explicitly.

**Construction/proof contract.**

1. Compute on a pair of oriented primal and dual cells using the fibre pairing.

2. In rank 2d the reverse-wedge/standard-duality correction is (−1)^d. The alternating product over cells contributes (−1)^{dχ(X)}.

3. Check the relative orientation convention against the boundary triangle.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/manifold-pairing`, `SymplecticReidemeisterTorsionModSquares:RT.2/cellular-volume`, `SymplecticReidemeisterTorsionModSquares:RT.2/cellular-invariance`, `SymplecticReidemeisterTorsionModSquares:RT.1/exotic-duality`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Sources:** AV-v1, Appendix B.7.1, (B.24)–(B.27), pp. 80–81: Tracks the duality scalar needed for the bordism sign.

### Reidemeister torsion modulo squares — `torsion`

Let X be a closed smooth oriented (2m+1)-manifold and K a field of characteristic ≠2. Let ρ have even rank and a perfect locally constant (−1)^m-symmetric pairing: symplectic if m is odd; orthogonal with a specified standard self-dual volume if m is even. Transport e_X through det C≃det H*(X;ρ). The upper cohomology truncation H^{>m} is Lagrangian for Poincaré duality. Define RT(X,ρ)=e_X/ν_{H^{>m}} in Kˣ/Kˣ². No acyclicity is required.

**Construction/proof contract.**

1. Construct the cohomological root class using the induced perfect pairing.

2. Use cellular invariance and pairing-compatible comparison maps to show independence of choices.

3. In the acyclic case the denominator is the canonical acyclic determinant class.



**Planning API.**

- `ReidemeisterTorsion.of` (constructor): The scalar square class e_X/ν_{H^{>m}}.

- `ReidemeisterTorsion.isometry` (functoriality): Oriented homeomorphisms with compatible smooth cell models and local-system isometries preserve RT.

- `ReidemeisterTorsion.disjointUnion` (compatibility): For even-rank manifold systems the class multiplies under disjoint union.

- `ReidemeisterTorsion.acyclic` (characterisation): For acyclic coefficients RT agrees with the cellular determinant torsion with these fixed sign conventions.



**Uses.** RT.3 normalized-transformation: Defines the value on a labelled three-manifold.; RT.4 Gaussian-example: Produces a nonsquare witness for the density argument.

**Checks.**

- `ReidemeisterTorsion.empty` (degenerate): The empty manifold has torsion 1.

- `ReidemeisterTorsion.sphere3_rank2` (computation): For the constant symplectic K²-system on S³, RT=[−1], and its normalized class is 1.

- `ReidemeisterTorsion.circle_rotation` (computation): For S¹ over Q, Gram matrix I₂ and rotation A=[[0,−1],[1,0]], RT=[2].



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.1/lagrangian-volume`, `SymplecticReidemeisterTorsionModSquares:RT.1/cohomology-determinant`, `SymplecticReidemeisterTorsionModSquares:RT.0/manifold-pairing`, `SymplecticReidemeisterTorsionModSquares:RT.2/cellular-invariance`.

**Sources:** AV-v1, §2.1, (2.1), p. 10; §2.3, pp. 11–13; Appendix B.7, pp. 80–81: Defines torsion through the fixed signed determinant comparisons.

### Orientation reversal — `orientation`

Under the hypotheses of torsion, RT(X with reversed orientation,ρ)=[(−1)^{χ₁/₂(X,ρ)}]RT(X,ρ), where χ₁/₂=Σ_{q≤m}(−1)^q dim H^q. In particular it is unchanged for the dimension-three symplectic systems once their semicharacteristic evenness is proved.

**Construction/proof contract.**

1. The cellular volume does not use the global orientation; Poincaré pairing changes sign.

2. Compute the determinant of −1 on the lower half of cohomology in the Lagrangian root identification.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.2/torsion`, `SymplecticReidemeisterTorsionModSquares:RT.0/semicharacteristic`.

**Sources:** AV-v1, §1.5, (1.13), p. 8; §2.3.4, (2.6), p. 13: The orientation dependence is an explicit scalar square class.

### Three volumes on an algebraic boundary — `boundary-volumes`

Let C be a strongly even skew-symmetric dimension-4j complex over K, j≥1, and D=∂alg C. On det D compare a from C∨[−4j]⊂D, b from σ≥2j D, and c from upper cohomology via det D≃det H*D. Then a=b=(−1)^r c, with r≡(χ(C)+χ₁/₂(D))/2 (mod 2). In particular χ₁/₂(D) is even. Only the parity of r is asserted by this formula; the actual acyclic middle rank is 2r after the splitting.

**Construction/proof contract.**

1. Shift by 2j−1 to the strict symmetric dimension-1 case. Compare a and b degree by degree using strongly even Lagrangians.

2. Apply strict-splitting: Q and its dual give the same classes, while the acyclic alternating block of rank 2r has square determinant and reverse-wedge scalar (−1)^r.

3. With dim D^i=dim C^{4j−i}+dim C^{i+1}, perform the Euler count modulo four to obtain the displayed parity.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/algebraic-boundary`, `SymplecticReidemeisterTorsionModSquares:RT.0/strict-parity`, `SymplecticReidemeisterTorsionModSquares:RT.0/strict-splitting`, `SymplecticReidemeisterTorsionModSquares:RT.1/lagrangian-volume`, `SymplecticReidemeisterTorsionModSquares:RT.1/termwise-determinant`, `SymplecticReidemeisterTorsionModSquares:RT.1/cohomology-determinant`.

**Sources:** AV-v1, Appendix B.6, (B.20)–(B.23), pp. 78–80: Corrects the cone Lagrangian and labels, retaining every sign in the boundary comparison.

### Normalized boundary torsion — `bordism`

If N is compact smooth oriented of dimension 4j, j≥1, and ρ is a symplectic K-local system, then its oriented boundary M satisfies χ₁/₂(M,ρ) even and RT(M,ρ)=[(−1)^{χ₁/₂(M,ρ)/2}]. Equivalently [(−1)^{χ₁/₂/2}]RT(M,ρ)=1. The dimension parameter j is independent of half the coefficient rank.

**Construction/proof contract.**

1. Use the relative pairing on N and the boundary-cone comparison. All cellular term ranks are even.

2. Factor e_N into relative and boundary generators. Use duality-volume to compute the cone-Lagrangian class on the boundary.

3. Apply boundary-volumes; the Euler-characteristic sign cancels the duality-volume factor, leaving the semicharacteristic half-sign.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.2/boundary-volumes`, `SymplecticReidemeisterTorsionModSquares:RT.2/duality-volume`, `SymplecticReidemeisterTorsionModSquares:RT.2/torsion`, `SymplecticReidemeisterTorsionModSquares:RT.0/manifold-pairing`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Sources:** AV-v1, §2.4, Theorem 2.2, pp. 14–15; Appendix B.8, p. 81: Proves bordism invariance in the precise dimensions required.

**Layer acceptance and remaining work.** Discharge smooth/simple cellular comparison and chain-level boundary duality supplier contracts; verify all boundary-volume signs during implementation.

## RT.3. Families, semicharacteristics and characteristic classes

Extend the generic torsion over normal rings; prove base change for the normalized class using even strict models. Construct labelled bordism, its low-degree homology comparison and the normalized transformation on integral H₃ modulo two. Prove evenness in dimension three without using the final comparison, and specify the étale Chern transformation.

**Layer inputs:** `SymplecticReidemeisterTorsionModSquares:RT.2`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-6-knot-concordance-and-4d-cobordism-owned-here`, `StableHomotopyKTheory:H.1`, `MotivicEtaleKTheory:M.1`, `MotivicEtaleKTheory:M.8`, `KTheoryFiniteLocalFields:L.1`.

### Even strict models — `even-strict-model`

For a symmetric dimension-1 finite projective Poincaré complex over R with 2 invertible and even fibre semicharacteristic on a connected neighbourhood, Zariski locally there is a pairing-compatible strict free model whose every term has even rank, after adjoining canonically trivialized symmetric contractible summands. The determinant comparison preserves any given determinant volume.

**Construction/proof contract.**

1. First strictify locally. Work from the outermost degrees inward: a contractible free rank-one pair together with its shifted dual adjusts two adjacent term parities and their reflected partners.

2. Continue until only degrees 0,1 can have odd rank. Their parity is the lower-half rank sum, equal to χ≤0 modulo two, hence is even.

3. Use the canonical acyclic determinant trivializations to transport the volume. This stabilization argument is part of the theorem, not an assumed property of all strict models.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/local-strictification`, `SymplecticReidemeisterTorsionModSquares:RT.0/strict-parity`, `SymplecticReidemeisterTorsionModSquares:RT.1/strongly-even`.

**Sources:** AV-v1, Appendix A.6–A.7, pp. 65–67; Appendix B.10, pp. 85–86: An explicit stabilization refinement of the strictification is needed for a term-rank formula compatible with specialization.

### Torsion over normal rings — `normal-ring-torsion`

For a normal integral R with 2 invertible, a closed smooth oriented odd-dimensional X and a finite projective self-dual R-local system satisfying the parity and volume hypotheses of torsion, the generic RT over Frac(R) is the restriction of a unique class RT_R(X,ρ)∈H¹_et(R,μ₂). This raw extension need not commute with a map to another normal domain when cohomology jumps.

**Construction/proof contract.**

1. Locally strictify and form the determinant root line from upper brutal truncation. Over the fraction field its class differs from RT by a sign; extend that constant unit sign on the neighbourhood.

2. Classify the resulting determinant line with square trivialization by a μ₂-torsor.

3. Generic isomorphisms between finite étale torsors already defined over a normal integral R extend uniquely. Glue the local torsors and use injectivity H¹(R,μ₂)→H¹(Frac R,μ₂); no extension of an arbitrary ramified generic torsor is asserted.



**Planning API.**

- `NormalRingTorsion.of` (constructor): The unique extension of generic torsion to H¹(R,μ₂).

- `NormalRingTorsion.generic` (characterisation): Restriction to the fraction field is the field-valued torsion.

- `NormalRingTorsion.local` (compatibility): Restriction to a localization agrees with the same generic extension.

- `NormalRingTorsion.rootLine` (compatibility): A strict model represents it by its root line with the generic acyclic sign correction.



**Uses.** RT.3 normalized-family: Normalize the generic class to obtain genuine base change.; RT.7 comparison: The target over normal rings is a μ₂-torsor class.

**Checks.**

- `NormalRingTorsion.field` (compatibility): For R a field it agrees with torsion through the Kummer square-class isomorphism.

- `NormalRingTorsion.nonfree_root` (non-example): A nontrivial two-torsion root line need not be represented by a global unit; use H¹(R,μ₂), not only Rˣ/Rˣ².

- `NormalRingTorsion.jump` (computation): For the orthogonal circle family over Q[s]_(s) with monodromy diag(1+s,(1+s)⁻¹)⊕I₂, generic RT=[−(1+s)] while special RT=1.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.2/torsion`, `SymplecticReidemeisterTorsionModSquares:RT.0/local-strictification`, `SymplecticReidemeisterTorsionModSquares:RT.1/lagrangian-volume`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `MotivicEtaleKTheory:M.1`.

**Sources:** AV-v1, §2.3.3, p. 13; Appendix B.10, (B.38)–(B.39), pp. 85–86: Separates extension and uniqueness from the broad raw base-change assertion of §2.3.3. The orthogonal circle disproves that broad assertion; it is not a geometric three-dimensional symplectic counterexample to B.10.

### Normalized torsion in families — `normalized-family`

For a closed smooth oriented three-manifold with a symplectic finite projective R-local system, R normal integral with 2 invertible, define N_R=[(−1)^{χ₁/₂(generic)/2}]RT_R. It commutes with every ring map R→S between such domains, including specialization where cohomology jumps. On a local strongly even strict symmetric dimension-1 model D of C*(M;ρ)[1], with s=Σ_{q≤0}(−1)^q rank D^q and L=σ≥1 D, its root-line representative is [(−1)^{s/2}] e_D/ν_L. Every field fibre F has value [(−1)^{χ₁/₂(M,ρ_F)/2}]RT(M,ρ_F).

**Construction/proof contract.**

1. After strictification and even stabilization use the displayed expression, which uses ranks and line-pairing data and therefore commutes with arbitrary base change.

2. For a field fibre let h=χ≤0(D_F). The middle alternating differential has rank s−h=2r, and ν_L=(−1)^rν_upperH. Thus (−1)^{s/2}e_D/ν_L=(−1)^{h/2}RT(D_F).

3. Undo the shift: h=−χ₁/₂(M,ρ_F), which has the same half-sign modulo two. Gluing uses the generic torsor and normality; base change uses the local formula, not an unjustified injection between generic fields.



**Planning API.**

- `NormalizedTorsion.of` (constructor): The normalized μ₂-torsor class over R.

- `NormalizedTorsion.fibre` (characterisation): The field-fibre value includes its own semicharacteristic half-sign.

- `NormalizedTorsion.baseChange` (functoriality): Every map of normal domains preserves the normalized class.

- `NormalizedTorsion.localFormula` (compatibility): On a strongly even strict shifted model use the lower-half term rank s.



**Uses.** RT.3 normalized-transformation: Ensures naturality on the category of normal domains.; RT.5 transfer: Allows comparison at finite residue fields of one ring.

**Checks.**

- `NormalizedTorsion.sphere3` (computation): The constant rank-two symplectic system on S³ has normalized class 1 over every such R.

- `NormalizedTorsion.jump_sign` (compatibility): In the orthogonal circle regression family, normalized generic [1+s] specializes to normalized special 1 although raw torsion changes by [−1]. This tests the same dimension-one model formula.

- `NormalizedTorsion.root_basis` (characterisation): Changing a local basis of the root line changes its scalar by a square and cannot change the torsor.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.3/normal-ring-torsion`, `SymplecticReidemeisterTorsionModSquares:RT.3/even-strict-model`, `SymplecticReidemeisterTorsionModSquares:RT.3/semicharacteristic-three`, `SymplecticReidemeisterTorsionModSquares:RT.0/strict-splitting`, `SymplecticReidemeisterTorsionModSquares:RT.1/lagrangian-volume`.

**Sources:** AV-v1, §2.4–§2.6, pp. 14–16; Appendix B.10, pp. 85–86: Supplies the normalized three-dimensional base-change theorem by a term-rank calculation. The circle test checks the same shifted-complex sign, without asserting a three-dimensional symplectic counterexample.

### Labelled oriented bordism — `labelled-bordism`

For a CW space Y and d≥0, define Ω_d^SO(Y) from compact smooth closed oriented d-manifolds with continuous maps to Y, modulo compact smooth oriented bordisms over Y. Addition is disjoint union and inverse reverses orientation. For a discrete group G use Y=BG; a symplectic representation/local system is the corresponding label. The fundamental-class map sends [M,f] to f_*[M]∈H_d(Y;ℤ).

**Construction/proof contract.**

1. Use the imported geometric bordism relation, collars and gluing. Quotient labelled cycles by the induced relation.

2. Show disjoint union, opposite orientation and cylinders make an abelian group.

3. Naturality of fundamental classes and the boundary exact sequence make the homology map well defined.



**Planning API.**

- `OrientedBordism.cycle` (constructor): A compact oriented labelled manifold defines a class.

- `OrientedBordism.map` (functoriality): A map Y→Z pushes labels forward.

- `OrientedBordism.fundamental` (projection): The natural map Ω_d^SO(Y)→H_d(Y;ℤ).

- `OrientedBordism.boundary` (relation): A labelled oriented boundary represents zero.



**Uses.** RT.3 low-bordism: Compare labelled manifolds with homology in degrees at most three.; RT.3 normalized-transformation: Make N independent of the manifold representative.

**Checks.**

- `OrientedBordism.point0` (computation): Ω₀^SO(point)=ℤ by signed point count.

- `OrientedBordism.circle` (computation): The constant-labelled oriented circle is zero in Ω₁^SO(point).

- `OrientedBordism.BZ` (non-example): The identity-labelled circle in Bℤ has fundamental class 1∈H₁(Bℤ;ℤ), hence is not zero.



**Direct dependencies:** `tauceti:TauCetiRoadmap/GeometricTopology#layer-6-knot-concordance-and-4d-cobordism-owned-here`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `StableHomotopyKTheory:H.1/classifying-space-of-group`, `StableHomotopyKTheory:H.1/bar-complex-comparison`.

**Sources:** AV-v1, §2.3.4–§2.4, pp. 13–15: Owns the labelled bordism group used by the torsion proof, while importing the geometric category.

### Low-dimensional oriented bordism and homology — `low-bordism`

For every CW space Y and 0≤d≤3, the fundamental-class map Ω_d^SO(Y)→H_d(Y;ℤ) is an isomorphism, natural in Y.

**Construction/proof contract.**

1. Use Thom IV.13: Ω₀^SO(point)=ℤ and Ω₁,Ω₂,Ω₃ vanish.

2. Apply the relative skeletal filtration of labelled bordism: excision, collars and transversality identify the relative group of a p-cell with the shifted coefficient group.

3. In total degrees at most three only the degree-zero coefficient row survives; comparison with cellular integral chains yields the fundamental-class isomorphism. Prove the relative filtration statement as part of this target, without assuming a pre-existing bordism spectrum or a spectral sequence not imported.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.3/labelled-bordism`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-6-knot-concordance-and-4d-cobordism-owned-here`.

**Sources:** AV-v1, §2.3.4–§2.4, pp. 13–15; Thom, Chapter IV §8, Theorem IV.13, p. 81: AV needs a labelled comparison; the primary source directly supplies its coefficient calculation.; Thom, Chapter IV §8, Theorem IV.13, p. 81: Computes the oriented bordism coefficients needed by the skeletal argument.

### Evenness in dimension three — `semicharacteristic-three`

For every closed smooth oriented three-manifold and symplectic finite-dimensional local system over any field of characteristic ≠2, χ₁/₂=dim H⁰−dim H¹ is even. For finite projective coefficient families over a connected normal domain with 2 invertible, fibre parity is the same even value.

**Construction/proof contract.**

1. Boundary parity vanishes by boundary-volumes, so parity is a natural homomorphism H₃(BSp_{2r}(K);ℤ)→F₂. This uses no torsion–Chern equality.

2. For F_q→F_{q²}, finite-field K₃ restriction is multiplication by q²+1 on the cyclic target index, hence zero modulo two. The finite-rank comparison and odd-order H₂ give zero on H₃ with F₂ coefficients. Naturality forces parity over F_q to vanish.

3. Spread finitely many monodromy matrices to a connected normal finite-type Z[1/2]-domain, use local constancy, and specialize to a finite residue field.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/strict-parity`, `SymplecticReidemeisterTorsionModSquares:RT.2/bordism`, `SymplecticReidemeisterTorsionModSquares:RT.3/low-bordism`, `KTheoryFiniteLocalFields:L.1/finite-classical-h3-coefficient-comparison`, `KTheoryFiniteLocalFields:L.1/finite-field-transfer-formulas`, `KTheoryFiniteLocalFields:L.1/finite-rank-symplectic-h3-mod-two`.

**Sources:** AV-v1, §2.3.4, pp. 13–14; §2.7, pp. 16–18: Makes the normalization meaningful without assuming the final comparison.

### The étale Chern transformation — `etale-transgression`

For rank 2r and a normal integral Z[1/2]-algebra R, evaluate the standard symplectic representation’s universal étale c₂ in degree (3,1) to obtain c_et:H₃(BSp_{2r}(R);ℤ)/2→H¹_et(R,μ₂). Use μ₂^{⊗2}≃μ₂ with its unique nontrivial geometric element to compare coefficients. Require naturality in all such R and stabilization in r. This is an evaluation adapter to the Chern-class supplier, not a second construction of Chern classes.

**Construction/proof contract.**

1. Import the universal equivariant finite-coefficient c₂ with its normalization for the standard representation and slant it with integral degree-three cycles.

2. The target is killed by two, so factor through integral H₃ modulo two.

3. Compare at finite fields with the existing finite-rank étale isomorphism, and keep the integral quotient distinct from full H₃(−;F₂).



**Planning API.**

- `EtaleTransgression.of` (constructor): The homomorphism from integral H₃ modulo two.

- `EtaleTransgression.natural` (functoriality): It commutes with maps of normal Z[1/2]-domains.

- `EtaleTransgression.finite` (compatibility): For every odd finite field it is the finite-rank K-theoretic isomorphism.

- `EtaleTransgression.stabilize` (compatibility): Block inclusion of symplectic groups preserves the evaluated class.



**Uses.** RT.5 transfer: Defines liftable classes and goodness.; RT.7 comparison: Is the arithmetic target of normalized torsion.

**Checks.**

- `EtaleTransgression.zero` (degenerate): The zero integral cycle maps to the trivial torsor.

- `EtaleTransgression.finite_nonzero` (characterisation): The nonzero element of H₃(Sp₂(F₃);ℤ)/2 maps to its nonsquare class.

- `EtaleTransgression.coefficients` (non-example): Do not identify integral H₃/2 with H₃(F₂) over a general ring; the UCT H₂[2] term need not vanish.



**Direct dependencies:** `MotivicEtaleKTheory:M.8`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `StableHomotopyKTheory:H.1/bar-complex-comparison`, `KTheoryFiniteLocalFields:L.1/finite-rank-symplectic-etale-isomorphism`.

**Sources:** AV-v1, §2.5–§2.7, (2.7)–(2.9), pp. 15–18: Specifies the precise universal Chern interface that is stronger than a regular-scheme K-group Chern map.

### The normalized torsion transformation — `normalized-transformation`

For each rank 2r and normal integral Z[1/2]-algebra R, define B_r(R)=H₃(BSp_{2r}(R);ℤ)/2 and N_R:B_r(R)→H¹(R,μ₂) by a labelled manifold representative and normalized torsion. It is a homomorphism natural in R and compatible with block stabilization. For ρ on M, N_R(ρ_*[M])=[(−1)^{χ₁/₂(M,ρ)/2}]RT_R(M,ρ).

**Construction/proof contract.**

1. Use low-bordism to choose a smooth labelled representative for every integral H₃ class.

2. Bordism invariance and orientation reversal make the value independent of that choice and additive.

3. Since H¹(R,μ₂) has exponent two the homomorphism factors through B_r; use normalized-family for naturality.



**Planning API.**

- `NormalizedTransformation.of` (constructor): The homomorphism N_R on B_r(R).

- `NormalizedTransformation.manifold` (characterisation): Its value on a labelled manifold is the normalized torsion.

- `NormalizedTransformation.natural` (functoriality): Every map of normal domains commutes with N.

- `NormalizedTransformation.stabilize` (compatibility): Adding a constant symplectic summand preserves N, since its normalized torsion is trivial.



**Uses.** RT.5 good-field: Compare N with the finite-field Chern isomorphism.; RT.7 topological-theorem: Recover the manifold identity from the transformation comparison.

**Checks.**

- `NormalizedTransformation.boundary` (characterisation): Every labelled boundary maps to 1.

- `NormalizedTransformation.double` (computation): Twice any integral homology class maps to 1.

- `NormalizedTransformation.constant` (degenerate): A constant label factors through H₃(point;ℤ)=0 and maps to 1, including the S³ rank-two example with raw RT=[−1].



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.3/normalized-family`, `SymplecticReidemeisterTorsionModSquares:RT.3/low-bordism`, `SymplecticReidemeisterTorsionModSquares:RT.2/bordism`, `SymplecticReidemeisterTorsionModSquares:RT.2/orientation`, `StableHomotopyKTheory:H.1/bar-complex-comparison`.

**Sources:** AV-v1, §2.4–§2.6, (2.8), pp. 14–16: Constructs the natural transformation that the arithmetic argument identifies.

**Layer acceptance and remaining work.** Discharge geometric bordism, Kummer line-pair, universal Chern and cellular supplier contracts; formalize the reviewed even stabilization and normalized root-line formula.

## RT.4. Circle formula and explicit mapping tori

Compare the pinned spinor norm with the bilinear convention; prove the Zassenhaus and circle formulas in every odd characteristic using the alternating cross pairing P(x,(1−A)y); compute mapping-torus torsion, a genus-two cocycle model and the nonsquare Gaussian example.

**Layer inputs:** `SymplecticReidemeisterTorsionModSquares:RT.2`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

### Spinor norm convention comparison — `spinor-convention`

Let K have characteristic ≠2 and V be finite dimensional with nondegenerate symmetric bilinear form B. Its classical spinor norm θ sends reflection in v to [B(v,v)]. On SO(B), identify θ with the existing CliffordAlgebra.spinorNorm of the associated quadratic form. The baseline orthogonal map uses [−Q(v)] on a reflection; the sign difference and any polar-factor convention cancel in a product of an even number of reflections.

**Construction/proof contract.**

1. Use the baseline Cartan–Dieudonné construction underlying the existing map.

2. On determinant one, reflection word length is even, so the negative sign and a possible common factor two contribute a square.

3. Keep the comparison restricted to SO; do not identify the two maps on all O.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `tauceti:CliffordAlgebra.spinorNorm`, `tauceti:CliffordAlgebra.spinorNorm_apply`, `tauceti:CliffordAlgebra.orthogonalSpinorNorm_reflectionOrthogonal`.

**Sources:** AV-v1, §1.1, (1.6), p. 3; Appendix B.9.1, pp. 82–83: Reuses the pinned spinor norm and specifies the convention bridge.

### Zassenhaus determinant formula — `zassenhaus`

For every finite-dimensional nondegenerate symmetric (V,B) over a field of characteristic ≠2 and isometry A, let V₋=ker(A+1)^N and U=im(A+1)^N for sufficiently large N. They are nondegenerate orthogonal complements and θ(A)=disc(V₋)·det((1+A)/2|U) in Kˣ/Kˣ², where disc is the unsigned Gram determinant. If A∈SO and dim V is even of square discriminant, then generalized ±1 blocks and their fixed spaces are even dimensional. Equivalently θ(A)=disc(V₊)det(1−A|V₊⊥), V₊ the generalized +1 block.

**Construction/proof contract.**

1. Use the orthogonal primary decomposition and Zassenhaus’s determinant homomorphism in Jouve–Rodriguez Villegas Theorem 5.1.

2. On U the determinant of (A−A⁻¹) paired with B is a skew determinant; comparing its square class gives the equivalent plus-one formula.

3. On each generalized ±1 block, the skew middle map associated to 1∓A and the invertible 1±A has even rank; determinant one and reciprocal eigenvalue pairing give even block dimension and hence even fixed dimension.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.4/spinor-convention`.

**Sources:** AV-v1, Appendix B.9.1, (B.31), pp. 82–83: The equivalent minus-one formula avoids logarithms and works in every odd characteristic.; JRV, §5, Theorem 5.1 and formula (5.1), pp. 16–17; §6, Lemma 6.1, p. 18: States the minus-one primary decomposition and determinant formula without a characteristic-zero assumption.

### The circle Poincaré complex — `circle-complex`

For an isometry A of a symmetric (V,B), the circle complex is V→(1−A)V in degrees 0,1, with cross pairings P₀₁(x,y)=B((1+A)x/2,y) and P₁₀(y,x)=B((1+A⁻¹)y/2,x). It is symmetric Poincaré of dimension 1, and strict exactly when 1+A is invertible. With a fixed volume on V the two cellular determinant factors cancel to a canonical based generator e.

**Construction/proof contract.**

1. Check closedness by expanding (1+A)(1−A)=1−A² and using the isometry law.

2. The induced pairing on kernel/cokernel is perfect, even when the cochain pairing is not termwise invertible.

3. Compute the adjoint cross blocks; each is invertible exactly when 1+A is.



**Planning API.**

- `CircleComplex.of` (constructor): The two-term complex and its signed pairing.

- `CircleComplex.strict_iff` (characterisation): Strictness is equivalent to invertibility of 1+A.

- `CircleComplex.cohomology` (compatibility): H⁰=ker(1−A), H¹=coker(1−A), naturally paired by B.

- `CircleComplex.volume` (projection): The same basis in both degrees gives the based generator independently of basis.



**Uses.** RT.4 circle-formula: Computes the normalized torsion algebraically.; RT.4 mapping-torus: The Wang cone reduces to the shifted circle complex.

**Checks.**

- `CircleComplex.identity` (computation): For A=1 the differential is zero and the cross pairing is B.

- `CircleComplex.minusIdentity` (computation): For A=−1 the differential is 2 and the cross pairing is zero: it is Poincaré and acyclic but not strict.

- `CircleComplex.rotation` (computation): For A=[[0,−1],[1,0]] over Q, det(1−A)=det(1+A)=2.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.0/symmetric-complex`, `SymplecticReidemeisterTorsionModSquares:RT.2/cellular-volume`.

**Sources:** AV-v1, Appendix A.4, (A.8), p. 64; Appendix B.9, pp. 82–85: The elementary circle model is the bridge from determinant signs to spinor norm.

### The strict two-term sign calculation — `strict-circle-calculation`

Let dim V=n be even, A∈SO(V,B), 1+A invertible and h=dim ker(1−A). Use the based circle generator e, without requiring disc(B)=1 in this intermediate calculation. Then h is even and (−1)^{h/2}RT_based(Circle(A,B))=disc(B)det((1+A)/2). The based ratio is defined by e and the upper-cohomology root even when the orthogonal volume is not self-dual.

**Construction/proof contract.**

1. Write P=B((1+A)/2−,−), an invertible cross pairing. The form P(x,(1−A)y)=B((A−A⁻¹)x/2,y) is alternating. Its right radical is ker(1−A), so n−h=2r.

2. The upper-term root class divided by e is (−1)^{n/2}det(P) modulo squares; the inverse determinant gives the same square class.

3. By strict-splitting, upper-term versus upper-cohomology root contributes (−1)^r. Multiply the normalization (−1)^{h/2}; the total sign is (−1)^{h/2+n/2+r}=1.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

- `StrictCircle.argument_position` (computation): Over Q with B=I₂ and A=[[0,−1],[1,0]], P(e₁,(1−A)e₁)=0 whereas P((1−A)e₁,e₁)=1. The differential must act in the second argument of this P.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.4/circle-complex`, `SymplecticReidemeisterTorsionModSquares:RT.0/strict-splitting`, `SymplecticReidemeisterTorsionModSquares:RT.1/cohomology-determinant`, `SymplecticReidemeisterTorsionModSquares:RT.1/lagrangian-volume`.

**Sources:** AV-v1, Appendix B.5–B.6, pp. 76–80; B.9, (B.30), pp. 82–85: This explicit determinant calculation replaces the characteristic-zero Jordan-block argument.

### The circle formula in odd characteristic — `circle-formula`

Let K have characteristic ≠2, V have even dimension and nondegenerate symmetric form of square unsigned discriminant, choose a standard self-dual volume, and let A∈SO(V). Then h=dim V^{A=1} is even and (−1)^{h/2}RT(S¹,A)=θ(A). No semisimplicity, lifting or characteristic-zero assumption is imposed.

**Construction/proof contract.**

1. Split V=V₋⊥U at the generalized −1 block. Both blocks have even dimension, and 1+A is invertible on U.

2. On V₋ the circle is acyclic and det(1−A)=2^{dim V₋}, a square. On U use strict-circle-calculation, retaining disc(B|U).

3. Since the total discriminant is square, disc(B|U)=disc(B|V₋) modulo squares. Multiply the even-block determinant classes and apply the minus-one Zassenhaus formula. This proves the finite-characteristic case without Jacobson–Morozov or a logarithm.



**Checks.**

- `CircleFormula.identity2` (computation): Over Q with B=I₂ and A=1, raw RT=[−1], h=2 and normalized RT=θ(1)=1.

- `CircleFormula.unipotent3` (computation): Over F₃ take B hyperbolic of dimension four and A=diag(U,U⁻ᵀ), U=[[1,1],[0,1]]. Then h=2, θ(A)=1 and raw RT=[−1]; this detects both the sign and a characteristic-zero-only proof.

- `CircleFormula.minusIdentity` (computation): For an even-dimensional square-discriminant form and A=−1, h=0 and both sides equal 1.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.4/strict-circle-calculation`, `SymplecticReidemeisterTorsionModSquares:RT.4/zassenhaus`, `SymplecticReidemeisterTorsionModSquares:RT.2/torsion`.

**Sources:** AV-v1, Appendix B.9, (B.30), pp. 82–85; §2.3.2, p. 13: Strengthens the source’s characteristic-zero proof to exactly the odd-characteristic statement required downstream.

### The orthogonal cohomology of a surface — `surface-orthogonal-space`

For a closed smooth oriented genus-g surface Σ, symplectic rank-2r local system over K of characteristic ≠2 and H⁰(Σ;ρ)=0, the cup-product/fibre pairing makes V=H¹(Σ;ρ) nondegenerate symmetric, of dimension 4r(g−1) and square unsigned discriminant. A chosen symplectic intertwiner for an orientation-preserving diffeomorphism induces T∈SO(V).

**Construction/proof contract.**

1. Poincaré duality gives H²=0 and the symmetric perfect H¹ pairing. Cellular Euler characteristic gives the dimension, divisible by four.

2. The cellular volume and its duality comparison have scalar (−1)^{rχ(Σ)}=1. Transport through det C≃(det H¹)⁻¹; the reverse-wedge correction in dimension divisible by four is one. Hence the Gram determinant is square.

3. The diffeomorphism and chosen symplectic intertwiner preserve the cellular volume. Since only H¹ remains, their determinant on H¹ is one. This is a determinant argument in any odd characteristic, rather than a lift of the representation.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `SymplecticReidemeisterTorsionModSquares:RT.2/duality-volume`, `SymplecticReidemeisterTorsionModSquares:RT.2/cellular-invariance`, `SymplecticReidemeisterTorsionModSquares:RT.1/cohomology-determinant`.

**Sources:** AV-v1, Appendix C.2, Lemma C.2.1, pp. 87–88; B.7.1, pp. 80–81: Supplies the determinant and discriminant hypotheses required by the all-odd circle formula.

### Torsion of a mapping torus — `mapping-torus-torsion`

With Σ,ρ as above, an orientation-preserving diffeomorphism f and a specified symplectic intertwiner f*ρ≃ρ define ρ_f on M_f and T on H¹(Σ;ρ). For every field of characteristic ≠2, h=dim ker(1−T)=dim H¹(M_f;ρ_f) is even and (−1)^{h/2}RT(M_f,ρ_f)=θ(T). Also θ(T)=det(1−T|V₊⊥)disc(V₊), where V₊ is the generalized 1-eigenspace, not merely the fixed space.

**Construction/proof contract.**

1. Use the two-cylinder Mayer–Vietoris model or the Wang triangle C*(M_f)→V[−1]→(1−T)V[−1].

2. Track the cellular numerator through the cylinder decompositions; identical unknown transport determinants occur twice and cancel modulo squares. Track Poincaré pairings with the fixed shift.

3. Apply the circle formula to V and T, then the equivalent plus-one Zassenhaus formula. The Wang sequence gives H⁰(M_f)=0 and H¹(M_f)=ker(1−T).



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.4/surface-orthogonal-space`, `SymplecticReidemeisterTorsionModSquares:RT.4/circle-formula`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `SymplecticReidemeisterTorsionModSquares:RT.2/cellular-volume`.

**Sources:** AV-v1, Appendix C.2, Lemma C.2.1, (C.1)–(C.4), pp. 87–88: Repairs the finite-characteristic input and the generalized-eigenspace discriminant.

### A genus-two cocycle model — `genus-two-cocycles`

For π=⟨a₁,b₁,a₂,b₂ | [a₁,b₁][a₂,b₂]=1⟩ and a representation on V with ρ(b₁)−1 invertible, evaluate a crossed homomorphism by φ(gh)=ρ(g)φ(h)+φ(g) and φ(g⁻¹)=−ρ(g)⁻¹φ(g). The single relator determines φ(a₁) from the other three values. Thus H¹(Σ;ρ)=coker(ι:V→V³), ι(v)=((b₁−1)v,(a₂−1)v,(b₂−1)v). An automorphism t and intertwiner M induce T̃(φ)=M⁻¹φ∘t, descending to T on this cokernel. If 1−M⁻¹ is invertible, det(1−T)=det(1−T̃)/det(1−M⁻¹).

**Construction/proof contract.**

1. Use cellular degree-one cochains of the surface presentation and expand the relator by the crossed-homomorphism rule; its a₁ coefficient is 1−ρ(a₁b₁a₁⁻¹), invertible by hypothesis.

2. The principal crossed homomorphisms give exactly ι, which is injective because b₁−1 is.

3. Check T̃ι=ιM⁻¹, then apply determinant multiplicativity to the short exact sequence. Acyclicity of 1−T is unnecessary for the polynomial identity, but is needed to use a nonzero determinant as torsion.



**Planning API.**

- `GenusTwoCocycles.evaluate` (constructor): Evaluate a crossed homomorphism on a word from its generator values.

- `GenusTwoCocycles.cokernel` (equivalence): The quotient by principal cocycles is the stated V³/ι(V).

- `GenusTwoCocycles.monodromy` (data): The action is M⁻¹φ∘t and preserves ι(V).

- `GenusTwoCocycles.determinant` (compatibility): The quotient determinant identity follows from the equivariant short exact sequence.



**Uses.** RT.4 Gaussian-example: Compute both mapping-torus examples exactly.; RT.6 good-rational-primes: The nonsquare normalized witness seeds the density argument.

**Checks.**

- `GenusTwoCocycles.inverse` (computation): φ(g⁻¹)=−ρ(g)⁻¹φ(g); dropping either factor fails the relator expansion.

- `GenusTwoCocycles.principal` (compatibility): The cocycle φ_v(g)=ρ(g)v−v is sent by T̃ to φ_{M⁻¹v}.

- `GenusTwoCocycles.rank` (characterisation): For rank-two coefficients satisfying the hypothesis, dim V³/ι(V)=4, matching the genus-two Euler calculation.



**Direct dependencies:** `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `SymplecticReidemeisterTorsionModSquares:RT.4/surface-orthogonal-space`.

**Sources:** AV-v1, Appendix C.1, C.3, (C.5)–(C.9), pp. 86–89: The concrete model supports reproducible exact computations.

### A nonsquare Gaussian torsion class — `gaussian-example`

Let i²=−1. On a genus-two surface use a₁=diag(−i,i), b₁=a₂=−I, b₂=1/2[[-1−i,−1−i],[1−i,−1+i]]. Take the twists T₁:b₁↦b₁a₁⁻¹, T₂:a₁↦a₁b₁, T₃:(b₁,b₂)↦(a₁⁻¹a₂⁻¹b₁,a₂⁻¹a₁⁻¹b₂), T₄:b₂↦b₂a₂⁻¹, T₅:a₂↦a₂b₂, with unspecified generators fixed. Apply T₄,T₄,T₂,T₃,T₁ in that order. The intertwiner is M=[[0,−1],[1,0]]. Then char_T(x)=x⁴+1, det(1−T̃)=4, det(1−M⁻¹)=2, h=0 and N=RT=[2]=[i]≠1 in Q(i)ˣ/Q(i)ˣ². The second C.4.2 system with a₁=b₁=[[0,1],[−1,0]], a₂=I, b₂=diag(i,−i), twists T₅,T₅,T₄,T₅,T₅ and the same M gives determinants 8 and 2, hence RT=[4]=1.

**Construction/proof contract.**

1. Verify the surface relator and the intertwining relation on all four generators by exact arithmetic in Q(i).

2. Build the relator derivative matrix by the cocycle rule, solve for φ(a₁), and compute T̃ on the six remaining coordinates. Check its invariant two-dimensional principal-cocycle subspace and the quotient characteristic polynomial.

3. Compute determinants 4/2 and 8/2. The identity 2=(1−i)²i identifies the first square class; if (a+bi)²=i with rational a,b, then a=±b and 2a²=±1, impossible.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.4/genus-two-cocycles`, `SymplecticReidemeisterTorsionModSquares:RT.4/mapping-torus-torsion`.

**Sources:** AV-v1, Appendix C.4.1–C.4.2, pp. 89–90: The explicit nonzero normalized torsion class is the arithmetic seed. Twist composition order is fixed to reproduce the matrices.

**Layer acceptance and remaining work.** Discharge topology supplier contracts and formalize the reviewed all-odd-characteristic strict-circle proof with the corrected alternating form; both Gaussian examples were independently recomputed exactly.

## RT.5. Transfer and controlling extensions

Define goodness using normalized torsion, Chern-liftability and controlling extensions with upper-density-zero exceptional sets. Prove the transfer lemma, the number-field rank bound, controlling torsion witnesses, composita and intermediate-field descent.

**Layer inputs:** `SymplecticReidemeisterTorsionModSquares:RT.3`, `SymplecticReidemeisterTorsionModSquares:RT.4`, `K3BlochGroups:V.2`, `K3BlochGroups:V.4`, `MotivicEtaleKTheory:M.7`, `tauceti:TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions`, `tauceti:TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c`.

### Good finite fields — `good-field`

An odd finite field k is good if N_k=c_et on B_r(k)=H₃(Sp_{2r}(k);ℤ)/2 for every r≥1. The finite-rank comparison makes these groups cyclic of order two and stabilization an isomorphism. Thus it suffices at one rank to find x with normalized torsion N_k(x)≠1. A nonsquare raw RT witness is sufficient only after also accounting for its semicharacteristic half-sign.

**Construction/proof contract.**

1. Define the predicate by equality of homomorphisms.

2. Use the finite-field étale isomorphism and rank stabilization to characterize goodness by a nonzero normalized value.



**Planning API.**

- `GoodFiniteField` (data): The predicate N=c_et on the finite-field integral quotient.

- `GoodFiniteField.nonzero_iff` (characterisation): Goodness is equivalent to existence of a nonzero normalized value.

- `GoodFiniteField.rank_independent` (compatibility): The criterion is independent of positive symplectic rank.



**Uses.** RT.5 transfer: Propagate the predicate between two finite residue fields.; RT.6 density: Define good places by their residue field.

**Checks.**

- `GoodFiniteField.order2` (characterisation): On a cyclic two-element source and target, the zero homomorphism fails the criterion and the isomorphism satisfies it.

- `GoodFiniteField.raw_sphere` (non-example): A constant rank-two system on S³ over F₃ has raw nonsquare RT=[−1] but normalized value 1, so it cannot be the nonzero witness.

- `GoodFiniteField.stable_rank` (compatibility): A nonzero witness at Sp₂ remains nonzero under every standard stabilization.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.3/normalized-transformation`, `SymplecticReidemeisterTorsionModSquares:RT.3/etale-transgression`, `KTheoryFiniteLocalFields:L.1/finite-rank-symplectic-h3-mod-two`, `KTheoryFiniteLocalFields:L.1/finite-rank-symplectic-etale-isomorphism`.

**Sources:** AV-v1, §2.7, Definition 2.7.1 and preceding discussion, pp. 16–18: Goodness is measured by the normalized transformation, not an unnormalized witness.

### Chern-liftable square classes — `liftable`

For a normal integral Z[1/2]-algebra R, a∈H¹(R,μ₂) is c_et-liftable when it is c_et(x) for some x∈B_r(R), allowing stabilization in finite rank. Over a field use the Kummer square-class identification. Liftable classes form an F₂-subspace, functorial under scalar extension and under field automorphisms.

**Construction/proof contract.**

1. Take the image of the stabilized Chern homomorphism. Finite sums have representatives in a common finite symplectic rank.

2. Use functoriality to transport witnesses.



**Planning API.**

- `ChernLiftable` (data): Membership in the image of c_et.

- `ChernLiftable.witness` (projection): A class with this predicate has a finite-rank integral homology witness modulo two.

- `ChernLiftable.add` (structure): The liftable classes form an F₂-subspace.

- `ChernLiftable.map` (functoriality): Ring maps send liftable classes to liftable classes.



**Uses.** RT.5 transfer: A common lift connects two nonsquare specializations.; RT.6 multiquadratic-control: A finite subspace defines a controlling extension.

**Checks.**

- `ChernLiftable.zero` (degenerate): The trivial torsor is liftable by the zero cycle.

- `ChernLiftable.finite` (compatibility): Every square class over an odd finite field is liftable by the finite-field isomorphism.

- `ChernLiftable.sum` (characterisation): The product of classes represented by x and y is represented by x+y after stabilization, rather than by multiplying bar cycles.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.3/etale-transgression`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`.

**Sources:** AV-v1, §2.9–§2.10, pp. 18–20: The proof needs liftability under c_et before knowing N=c_et.

### The transfer lemma — `transfer`

Let S be a normal integral finite-type Z[1/2]-algebra with maps to odd finite fields k₀,k₁. If a=c_et(x)∈H¹(S,μ₂) specializes nontrivially at both maps, then k₀ is good if and only if k₁ is good.

**Construction/proof contract.**

1. Put b=N_S(x). At every finite closed-point specialization with a=0, the finite-field Chern isomorphism forces x=0 and then b=0.

2. Quadratic-cover Frobenius detection implies b lies in the F₂-span of a: otherwise there is a closed point where a=0 but b≠0.

3. If k₀ is good, b specializes there to the nonzero a, so b=a globally. Its nonzero specialization at k₁ proves goodness there; reverse the roles for the converse.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.5/good-field`, `SymplecticReidemeisterTorsionModSquares:RT.5/liftable`, `SymplecticReidemeisterTorsionModSquares:RT.3/normalized-transformation`, `KTheoryFiniteLocalFields:L.1/finite-rank-symplectic-etale-isomorphism`, `SymplecticReidemeisterTorsionModSquares:RT.5/quadratic-cover-detection`.

**Sources:** AV-v1, §2.9, Lemma 2.9.1, pp. 18–19: Connects finite fields through a common normal-domain lift.

### Many liftable classes over number fields — `liftable-rank`

For every number field F, the image of c_et:H₃(SL₂(F);ℤ)→Fˣ/Fˣ² has F₂-dimension at least r₂(F). The same bound holds for the stabilized symplectic group via SL₂=Sp₂.

**Construction/proof contract.**

1. Import the number-field stable Hurewicz equivalence K₃^ind(F)≃H₃(SL(F);ℤ) and the Hutchinson–Tao surjection from H₃(SL₂(F);ℤ).

2. Use the supplier’s precise dyadic degree-three Chern surjection K₃^ind(F)→H¹(F,ℤ₂(2))/2, with compatibility with the standard representation.

3. The latter group has at least r₂(F) independent mod-two classes, and coefficient reduction injects it into H¹(F,μ₂). Keep the real-place corrections rather than applying odd-prime Quillen–Lichtenbaum blindly at 2.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.5/liftable`, `K3BlochGroups:V.2/number-field-stable-hurewicz-equivalence`, `K3BlochGroups:V.4`, `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.8`.

**Sources:** AV-v1, §2.10, Lemma 2.10.1, pp. 19–20: Specifies the unstable homology and dyadic Chern inputs required for the rank bound.

### Weighted density and controlling extensions — `controlling`

For a set P of finite places of a number field L set w_P(X)=X⁻¹Σ_{v∈P,Nv≤X}log Nv. Record both lower and upper limits. A controlling pair (E/L,S) consists of a finite Galois extension and a nonempty conjugacy-invariant subset S⊂Gal(E/L) such that the bad unramified places with Frobenius in S have upper weighted density zero, equivalently w_bad(X)→0. A place is good when its odd residue field is good. Finite exceptional places and residue degree greater than one have weight tending to zero.

**Construction/proof contract.**

1. Define the counting functions and exceptional-set condition with an actual zero limit.

2. Import weighted Chebotarev for conjugacy subsets and the prime-power/residue-degree tail estimates from the current upstream roadmap.

3. Allow an empty controlling subset only as a formal input to the compositum operation when its output subset is nonempty.



**Planning API.**

- `WeightedDensity.count` (data): The logarithmically weighted counting function divided by X.

- `ControllingExtension` (constructor): A finite Galois extension, a nonempty conjugacy subset and a zero upper-density bad set.

- `ControllingExtension.lowerBound` (characterisation): The lower density of good places is at least |S|/|Gal(E/L)|.

- `ControllingExtension.finiteChange` (compatibility): Changing finitely many places leaves the condition unchanged.



**Uses.** RT.6 density-improvement: Quantify the new good Frobenius classes.; RT.7 characteristic-zero: Turn density-one good primes into quadratic-cover detection.

**Checks.**

- `ControllingExtension.empty` (non-example): The empty subset is not a controlling witness for a field extension.

- `WeightedDensity.degree2` (computation): Places of residue degree at least two have weight O(X⁻¹/² log X), hence limit zero.

- `WeightedDensity.union` (characterisation): A finite union of upper-density-zero sets has upper density zero; two sets of lower density zero need not have a zero-density union.



**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.5/good-field`, `tauceti:TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions`, `tauceti:TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c`.

**Sources:** AV-v1, §2.11, Definition 2.11.1, p. 20: Strengthens the source’s liminf-zero exceptional-set wording to the form needed by unions and descent.

### A torsion witness gives a controlling extension — `torsion-control`

Let L be a number field and α≠1 the normalized torsion class N_L(x) of a labelled oriented three-manifold. Then L(√α)/L with its nonidentity Frobenius class is controlling, with only finitely many exceptional places. In particular a nonsquare raw torsion witness is sufficient when its normalization sign is square, as over Q(i).

**Construction/proof contract.**

1. Spread the representation, pairing and its finite bar cycle to an S-integer ring with 2 invertible.

2. At any unramified place where α is nonsquare, naturality makes N nonzero, hence the residue field good.

3. Discard only finitely many denominator and ramified places.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.5/controlling`, `SymplecticReidemeisterTorsionModSquares:RT.3/normalized-family`, `SymplecticReidemeisterTorsionModSquares:RT.5/good-field`.

**Sources:** AV-v1, §2.11, Lemma 2.11.1, pp. 20–21: Uses normalized torsion to repair the proof’s identification of its generic value.

### Composita of controlling extensions — `composita`

Inside a fixed algebraic closure of L, suppose (E_i/L,S_i) are controlling for i=1,2, allowing one S_i empty. If the union S of the two inverse images in Gal(E₁E₂/L) is nonempty, then (E₁E₂/L,S) is controlling. Only the individual restriction projections are asserted surjective; the map to Gal(E₁/L)×Gal(E₂/L) need not be surjective.

**Construction/proof contract.**

1. Use compatibility of Frobenius under restriction.

2. Every bad place for the union belongs to one of the two exceptional sets; apply subadditivity of upper weighted density.

3. Discard the finite ramification set.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.5/controlling`.

**Sources:** AV-v1, §2.11, Lemma 2.11.2, p. 21: Corrects the product-surjectivity notation and uses a union-stable exceptional-set definition.

### Controlling extensions and intermediate fields — `intermediate-field`

Let E/L be finite Galois, L⊂M⊂E, S_M⊂Gal(E/M) nonempty and invariant under conjugation by Gal(E/M), and S_L its conjugacy closure in Gal(E/L). Then (E/L,S_L) is controlling if and only if (E/M,S_M) is controlling.

**Construction/proof contract.**

1. Remove places with residue degree greater than one over the rational prime in either field; their weighted contribution tends to zero.

2. Use the Frobenius orbit criterion: a class in the conjugacy closure meets Gal(E/M) exactly when there is a residue-degree-one place of M with that Frobenius class.

3. Goodness agrees because the residue fields then agree. Bound the number of primes lying over a prime by [M:L] and preserve the zero upper-density condition in both directions.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.5/controlling`, `tauceti:TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions`.

**Sources:** AV-v1, §2.11, Lemma 2.11.3, pp. 21–22: Descent is a residue-degree-one argument, not unrestricted density invariance under extension.

### Quadratic covers detected by closed points — `quadratic-cover-detection`

For S normal integral and finite type over Z[1/2], Frobenius conjugacy classes at closed points detect every nonzero H¹(S,μ₂) class, and detect independent pairs of such classes with any specified nonzero character pattern. In characteristic zero, for every connected nontrivial étale double cover, the weighted count of its nonsplit closed points of norm ≤Q is bounded below by cQ^d for some c>0, d=dim S. Combined with a bound O(q^{d−1}) for the number of closed points of residue order q, any o(Q^d)-weight exceptional set cannot contain all nonsplit points. In positive characteristic only Frobenius density, without an unqualified norm-asymptotic limit, is required.

**Construction/proof contract.**

1. Use arithmetic-scheme Chebotarev on the finite étale Galois cover associated to one or two quadratic characters.

2. Use the quantitative characteristic-zero version only for the comparison over finite-type characteristic-zero rings. Normality identifies a torsor with its generic cover.

3. This is a consumer contract for an arithmetic-scheme supplier. The current AnalyticNumberTheory:AN.4 and upstream number-field Chebotarev layers do not provide it; the ownership and primary-proof gap is recorded explicitly.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `MotivicEtaleKTheory:M.1`.

**Sources:** AV-v1, §2.8, p. 18; §2.14, pp. 25–26: Records exactly the arithmetic-scheme theorem used twice, without treating number-field Chebotarev as sufficient.

**Layer acceptance and remaining work.** Resolve the arithmetic-scheme Chebotarev Part II ownership/primary-proof gap and the explicit dyadic Chern and unstable Hurewicz supplier requests.

## RT.6. The density-one argument

Propagate goodness through independent liftable classes and multiquadratic extensions. Build a disjoint totally imaginary cyclic extension and a finite Galois-stable liftable subspace; prove the cubic density improvement and density one for good rational primes.

**Layer inputs:** `SymplecticReidemeisterTorsionModSquares:RT.5`, `tauceti:TauCetiRoadmap/Chebotarev#layer-7-the-auxiliary-prime-and-the-crossing-data`, `tauceti:TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c`.

### Independent liftable classes propagate goodness — `independent-classes`

Let α,β be linearly independent classes in Lˣ/Lˣ², with β Chern-liftable. Suppose L(√α)/L is controlling for a nonempty subset of its two-element Galois group. Then, outside a finite set, every place where β is nonsquare is good.

**Construction/proof contract.**

1. Spread β and its finite-rank lift to an S-integer ring.

2. Independence gives a biquadratic extension and a positive-density Frobenius class where β is nonsquare and α has the controlling value. Choose a good place outside its zero-density exceptional set.

3. Use this place and any other nonsquare specialization of β in the transfer lemma. Only finitely many excluded denominators remain.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.5/transfer`, `SymplecticReidemeisterTorsionModSquares:RT.5/liftable`, `SymplecticReidemeisterTorsionModSquares:RT.5/controlling`, `tauceti:TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c`.

**Sources:** AV-v1, §2.12, Lemma 2.12.1, p. 22: Turns one controlling quadratic extension into uniform goodness on another liftable nonsquare locus.

### Multiquadratic controlling extensions — `multiquadratic`

Let α≠1 define a controlling quadratic extension of L. Let W be a finite-dimensional Chern-liftable F₂-subspace of Lˣ/Lˣ² with dim W≥1 and W≠⟨α⟩. Then L(√W)/L, with group W* and subset W* minus its identity, is controlling with finitely many exceptional places.

**Construction/proof contract.**

1. Choose a basis of W whose members are independent of α: if α∈W, replace one basis vector by its sum with another, using dim W≥2.

2. Apply independent-classes to each basis witness, and union the finitely many exceptional sets.

3. Any nonidentity element of W* detects at least one basis class. The dim W≥1 condition ensures the controlling subset is nonempty.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.6/independent-classes`, `SymplecticReidemeisterTorsionModSquares:RT.5/liftable`, `SymplecticReidemeisterTorsionModSquares:RT.5/composita`.

**Sources:** AV-v1, §2.12, Lemma 2.12.2, pp. 22–23: Makes the nonempty-subset edge condition explicit.

### A disjoint totally imaginary cyclic extension — `auxiliary-cyclic`

For a number field K, a fixed finite Galois E/K and every even h≥4, there is a cyclic extension L/K of degree h, linearly disjoint from E, with L totally imaginary. One may choose a sufficiently large rational prime r≡1+h (mod 2h), unramified in E and K, and take the degree-h cyclic subextension of K(ζ_r)/K.

**Construction/proof contract.**

1. Use the coprime congruence class 1+h modulo 2h to choose r avoiding finitely many primes.

2. The cyclotomic extension is totally ramified at r, while E and K are unramified there; obtain the degree and disjointness.

3. Because (r−1)/h is odd, complex conjugation has nontrivial image in the cyclic quotient, so every real embedding becomes complex.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `tauceti:TauCetiRoadmap/Chebotarev#layer-7-the-auxiliary-prime-and-the-crossing-data`, `tauceti:TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c`.

**Sources:** AV-v1, §2.12, proof of Lemma 2.12.3, pp. 23–24: Provides the independent cyclic quotient required by the density count.

### The cubic density improvement — `density-improvement`

Given a controlling (E/K,S) containing a fixed controlling quadratic subextension, put δ=1−|S|/|Gal(E/K)|. If 0<δ≤1/2, construct a controlling (E′/K,S′), E⊂E′, with δ′≤δ−δ³/16. Iteration gives lower weighted density one for good places of K.

**Construction/proof contract.**

1. Take the least even h≥4 with 2^{−h/4}≤δ/2 and a disjoint totally imaginary cyclic L/K of degree h. The controlling quadratic class remains nonsquare in L.

2. Choose a finite Galois-stable liftable subspace W over L of dimension N≥h/2, by taking the orbit span of finitely many independent classes. Let L̃=L(√W), so Gal(L̃/L)=W*. Descend its nonidentity controlling subset to K and combine it with E.

3. Write Γ=Gal(EL̃/K). The projection Γ→Gal(E/K)×Gal(L/K) is surjective, but no surjection to Gal(E/K)×Gal(L̃/K) is assumed. The fraction outside S and over identity in Gal(L/K) is δ/h; at most 1/(h2^N) also maps to identity in Gal(L̃/K). New good fraction is at least (δ−2^{−N})/h.

4. Minimality of h gives h⁻¹≥δ²/8 and 2^{−N}≤δ/2; hence the cubic decrease. A positive limiting δ contradicts the recurrence.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.6/auxiliary-cyclic`, `SymplecticReidemeisterTorsionModSquares:RT.6/multiquadratic`, `SymplecticReidemeisterTorsionModSquares:RT.5/liftable-rank`, `SymplecticReidemeisterTorsionModSquares:RT.5/composita`, `SymplecticReidemeisterTorsionModSquares:RT.5/intermediate-field`, `tauceti:TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c`.

**Sources:** AV-v1, §2.12, Lemma 2.12.3 and its proof, pp. 23–25: The count uses precisely the independent smaller quotient and a union bound.

### Density one for good rational primes — `good-rational-primes`

The set of rational primes p with F_p good has weighted counting function X⁻¹Σ_{p≤X, F_p good}log p tending to 1. Consequently its complement has upper weighted density zero.

**Construction/proof contract.**

1. Over Q(i) the Gaussian witness has nontrivial normalized class, so it gives a controlling quadratic extension and density-one good places of Q(i).

2. Then Q(i)/Q with identity Frobenius subset is controlling by residue-degree-one descent; the exceptional set is zero in upper density.

3. Apply density-improvement over Q with its fixed quadratic class −1.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.4/gaussian-example`, `SymplecticReidemeisterTorsionModSquares:RT.5/torsion-control`, `SymplecticReidemeisterTorsionModSquares:RT.6/density-improvement`, `SymplecticReidemeisterTorsionModSquares:RT.5/intermediate-field`, `tauceti:TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c`.

**Sources:** AV-v1, §2.13, p. 25: Converts the explicit topological example into the arithmetic density input.

**Layer acceptance and remaining work.** Discharge the RT.5 arithmetic and Chern suppliers before implementing the density induction; the finite group count and recurrence are specified.

## RT.7. Comparison over rings and fields

Use arithmetic-scheme quadratic-cover detection to prove the comparison in characteristic zero; lift mod-two integral homology from finite fields through Sylow subgroups and Witt vectors; pass to characteristic p and filtered colimits. Deduce the topological theorem and the all-odd-characteristic mapping-class identity.

**Layer inputs:** `SymplecticReidemeisterTorsionModSquares:RT.6`, `SymplecticReidemeisterTorsionModSquares:RT.3`, `SymplecticReidemeisterTorsionModSquares:RT.4`.

### Comparison in characteristic zero — `characteristic-zero`

For every normal integral finite-type Z[1/2]-algebra S of characteristic zero and each positive symplectic rank, N_S=c_et on H₃(BSp_{2r}(S);ℤ)/2.

**Construction/proof contract.**

1. For fixed x, the difference a=N_S(x)−c_et(x) is a μ₂-torsor split at every closed point with good residue field.

2. For d=dim S, use #closed points of order q=O(q^{d−1}). Bad degree-one prime powers have total logarithmic weight o(Q); higher powers have O(Q^{1/2}log²Q), so the bad closed-point weight is o(Q^d).

3. A nontrivial double cover has nonsplit closed points of positive Q^d-order weight by quadratic-cover-detection, contradicting that bound. No assertion that Q^{−d} times the count of all closed points tends to 1 is needed.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.6/good-rational-primes`, `SymplecticReidemeisterTorsionModSquares:RT.5/quadratic-cover-detection`, `SymplecticReidemeisterTorsionModSquares:RT.3/normalized-transformation`, `SymplecticReidemeisterTorsionModSquares:RT.3/etale-transgression`, `tauceti:TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions`.

**Sources:** AV-v1, §2.14, pp. 25–26: Uses the density input with a corrected higher-dimensional counting normalization.

### Lifting finite-field homology through Witt vectors — `sylow-witt-lift`

For every odd finite field k, r≥1 and x∈H₃(Sp_{2r}(k);ℤ)/2, there is a normal integral finite-type Z[1/2]-domain S⊂W(k), a reduction map S→k and a class x_S∈H₃(Sp_{2r}(S);ℤ)/2 mapping to x. No integral surjectivity of a Sylow inclusion is claimed.

**Construction/proof contract.**

1. For a Sylow 2-subgroup Q, transfer followed by inclusion is multiplication by the odd index, hence inclusion H₃(Q;ℤ)/2→H₃(Sp(k);ℤ)/2 is surjective.

2. Lift Q→Sp(k) through Sp(W_n(k)). Each congruence kernel is a k-Lie algebra of odd characteristic, whose positive-degree Q-cohomology vanishes by averaging since |Q| is invertible; obstruction classes vanish and compatible lifts exist.

3. Take the finite-type subring of W(k) generated by lifted matrix coefficients, form coefficients, inverses and 1/2. Normalize in its fraction field: finite-type Z-algebras are excellent, so normalization is finite; W(k) is integrally closed, so reduction extends. The finite bar cycle descends.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `mathlib:Sylow`, `KTheoryFiniteLocalFields:L.1`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `mathlib:groupHomology`.

**Sources:** AV-v1, §2.15, p. 26: Makes the Sylow transfer and smooth-congruence lifting obligations explicit.

### Every odd finite field is good — `all-finite-fields`

For every finite field k of odd characteristic and every symplectic rank r≥1, N_k=c_et on H₃(Sp_{2r}(k);ℤ)/2.

**Construction/proof contract.**

1. Lift any x through a normal characteristic-zero S by sylow-witt-lift.

2. Apply the characteristic-zero equality over S and reduce it along S→k using naturality of both transformations.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.7/sylow-witt-lift`, `SymplecticReidemeisterTorsionModSquares:RT.7/characteristic-zero`, `SymplecticReidemeisterTorsionModSquares:RT.3/normalized-transformation`, `SymplecticReidemeisterTorsionModSquares:RT.3/etale-transgression`.

**Sources:** AV-v1, §2.15, p. 26: Passes from density-one prime fields to every finite field.

### The transformation comparison — `all-rings-fields`

For all normal integral finite-type Z[1/2]-algebras R and all fields K of characteristic ≠2, N=c_et on H₃(BSp_{2r}(−);ℤ)/2, for each r≥1 and after stabilization.

**Construction/proof contract.**

1. In characteristic p, a difference torsor is split at every finite closed point by all-finite-fields. Frobenius detection makes it trivial.

2. Every field of characteristic ≠2 is a filtered union of finite-type domains with 2 invertible and their finite normalizations inside the field.

3. Integral bar cycles and their relations use finitely many group elements, and finite étale torsors and Chern constructions descend along filtered colimits. Transport equality to all fields without assuming a particular field embeds in characteristic zero.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.7/all-finite-fields`, `SymplecticReidemeisterTorsionModSquares:RT.7/characteristic-zero`, `SymplecticReidemeisterTorsionModSquares:RT.5/quadratic-cover-detection`, `SymplecticReidemeisterTorsionModSquares:RT.3/normalized-transformation`, `SymplecticReidemeisterTorsionModSquares:RT.3/etale-transgression`, `MotivicEtaleKTheory:M.8`.

**Sources:** AV-v1, §2.6, (2.9), p. 16; §2.16, p. 26: Completes the ring-valued comparison and its field extension.

### The topological torsion theorem — `topological-theorem`

Let M be a closed smooth oriented three-manifold and ρ a symplectic rank-2r local system over any field K with characteristic ≠2. Then χ₁/₂(M,ρ)=dim H⁰−dim H¹ is even and [(−1)^{χ₁/₂/2}]RT(M,ρ)=⟨ρ*c_et,[M]⟩ in Kˣ/Kˣ². The evaluation is on the integral fundamental cycle reduced modulo two.

**Construction/proof contract.**

1. Apply the transformation equality to the image of the oriented fundamental class in integral group homology modulo two.

2. Use normalized-transformation.manifold and Kummer comparison to identify the two sides.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.7/all-rings-fields`, `SymplecticReidemeisterTorsionModSquares:RT.3/normalized-transformation`, `SymplecticReidemeisterTorsionModSquares:RT.3/semicharacteristic-three`.

**Sources:** AV-v1, §2.1, Theorem 2.1, (2.2), p. 10; §1.1, (1.7), p. 3: The principal topological theorem with its exact sign and coefficient domain.

### The mapping-class spinor identity — `mapping-class-identity`

For any closed smooth oriented surface Σ, field K of characteristic ≠2, symplectic local system ρ with H⁰(Σ;ρ)=0, orientation-preserving diffeomorphism f and specified symplectic isomorphism f*ρ≃ρ, let T on H¹ and ρ_f on M_f be induced by that choice. Then θ(T)=⟨ρ_f*c_et,[M_f]⟩. This includes all odd finite coefficient fields.

**Construction/proof contract.**

1. The Wang sequence gives χ₁/₂(M_f)=−h, h=dim ker(1−T), so its half-sign agrees with (−1)^{h/2}.

2. Combine the all-odd mapping-torus formula with the topological theorem. Keep the chosen intertwiner as part of the data: f*ρ≃ρ without a choice does not specify T or ρ_f.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.4/mapping-torus-torsion`, `SymplecticReidemeisterTorsionModSquares:RT.7/topological-theorem`.

**Sources:** AV-v1, §1.1, (1.5), p. 3; Appendix C.2, Lemma C.2.1, pp. 87–88: Supplies the finite-characteristic result that the arithmetic Part II needs.

**Layer acceptance and remaining work.** Resolve the arithmetic-scheme detection gap and Witt congruence-lifting supplier request, then implement the ring/field comparison.

## RT.8. The real Chern class

Identify the real degree-two Chern component with the metaplectic extension; use a lift through the universal integral cover and Bockstein compatibility to prove c₃₁ vanishes on the full mod-two homology of the discrete real symplectic group.

**Layer inputs:** `SymplecticReidemeisterTorsionModSquares:RT.3`, `MotivicEtaleKTheory:M.8`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-5-simply-connected-covers-and-the-enveloping-algebra`.

### The real Chern component and the metaplectic cover — `metaplectic-component`

For G=Sp_{2r}(R) considered as a discrete group, r≥1, identify the degree-(2,2) component c₂₂ of the standard representation’s mod-two étale c₂ with the pullback of its topological metaplectic double-cover class in H²(G;F₂). The latter is the reduction modulo two of the integral class of the universal covering group, whose central kernel is ℤ. Its coefficient Bockstein to H³(G;F₂) therefore vanishes.

**Construction/proof contract.**

1. Import the universal Chern class and its real comparison, with the standard-representation normalization.

2. Use the universal symplectic covering group with kernel ℤ; push out by ℤ→ℤ/4→ℤ/2. This lifts the metaplectic extension to a ℤ/4-extension.

3. Apply the exact coefficient sequence to conclude its Bockstein is zero, also after forgetting topology. The real Chern/metaplectic identification is a supplier request, not a consequence of the integral H₃/2 comparison.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `MotivicEtaleKTheory:M.8`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-5-simply-connected-covers-and-the-enveloping-algebra`.

**Sources:** AV-v1, §1.3.3, p. 6, argument following (1.10): Isolates the geometric and Chern-component inputs to the stronger real vanishing claim.

### Vanishing of the real degree-three Chern component — `real-vanishing`

For G=Sp_{2r}(R) discrete, c₃₁:H₃(G;F₂)→H¹_et(R,F₂) is zero on the full mod-two homology group, for every r≥1. In particular its restriction to integral H₃(G;ℤ)/2 is zero.

**Construction/proof contract.**

1. Use the coefficient Bockstein compatibility of the universal étale c₂: after evaluating cycles, β_et c₃₁ is obtained from the group Bockstein of c₂₂.

2. That group Bockstein is zero by metaplectic-component.

3. For Gal(C/R)=C₂, the connecting map β_et:H¹(R,F₂)→H²(R,F₂) is an isomorphism, as the generator squares nontrivially. Hence c₃₁=0. Do not infer this stronger domain statement solely from integral H₃ modulo two.



**Check.** Establish the stated result with its displayed conventions and all hypotheses; check the proof contracts named below.

**Direct dependencies:** `SymplecticReidemeisterTorsionModSquares:RT.8/metaplectic-component`, `MotivicEtaleKTheory:M.8`.

**Sources:** AV-v1, §1.3.3, (1.10), p. 6: The real vanishing result needed by the arithmetic Part II has a separate Bockstein proof.

**Layer acceptance and remaining work.** Discharge the real Chern/metaplectic comparison, Bockstein and specific symplectic universal-cover supplier requests; full mod-two domain is required.

## Worked computational witness

The genus-two computation is reproducible without importing a matrix from the paper as an oracle. Represent free-group words by signed generator letters. Evaluate a word's representation by multiplying its generator matrices. Evaluate a cocycle by accumulating the prefix representation times each generator value; an inverse letter contributes the negative inverse-representation factor. Expand the surface relator once to solve for φ(a₁), using invertibility of 1−ρ(a₁b₁a₁⁻¹). This yields six coordinates for rank-two systems.

For the nonsquare example in RT.4, substitute the five twists in the stated order and verify all four intertwining equations with M. Construct T̃ from M⁻¹φ∘t on the remaining b₁,a₂,b₂ coordinates. Check T̃ι=ιM⁻¹ before taking a quotient. Its six-dimensional characteristic polynomial divided by that of M⁻¹ is x⁴+1. The two determinants are 4 and 2, so det(1−T)=2 and there are no fixed vectors. Thus the normalization sign is 1 and the witness is N=[2]=[i]≠1. The second example instead gives quotient characteristic polynomial (x²+1)² and determinants 8 and 2, hence the trivial class [4]. Both computations were independently performed with exact rational-complex arithmetic in this design pass.

For a norm-class check, if (a+bi)²=i with a,b rational, then a²=b² and 2ab=1. This forces a rational square to equal ±1/2, impossible. The equality 2=(1−i)²i identifies the two nontrivial classes used above.

## Density and arithmetic-scheme boundary

All exceptional sets in controlling extensions have **upper** logarithmically weighted density zero. This property survives finite unions and the bounded-multiplicity comparisons of residue-degree-one primes. A lower-limit-zero definition would not justify these operations. The construction produces finite exceptional sets in its initial propagation steps and zero upper-density sets in its iteration.

At the induction step put Γ=Gal(EL̃/K), Δ=Gal(E/K), H=Gal(L/K) and N=dim W. Independence gives Γ→Δ×H surjective. The projection to Gal(L̃/K) is also surjective, but the map to Δ×Gal(L̃/K) need not be. If δ is the old bad proportion and |H|=h, the proportion outside the old good subset and over identity in H is δ/h. At most 1/(h2^N) also has identity image in Gal(L̃/K). Hence the new good fraction is at least (δ−2^{−N})/h. Taking the least even h≥4 with 2^{−h/4}≤δ/2 and N≥h/2 gives δ_next≤δ−δ³/16. This uses a union bound, not an unjustified independence of the larger quotients.

Over a characteristic-zero finite-type domain of dimension d, the final double-cover argument needs an o(Q^d) bound for bad closed points and a positive-order Q^d bound for nonsplit points of a nontrivial cover. It does not need the normalization Q^{−d}Σ log q to have total limit 1. For Spec Z[t], the degree-one count already has main term Q²/2. In positive characteristic Frobenius detection suffices; norm-counting limits can have constant-field periodicity, so no unqualified real-limit assertion is made there.

## Supplier contracts and open leaf


### S1. `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`

For a connected CW pair and a locally constant finite projective R-system (equivalently a functor from its fundamental groupoid to R-modules), provide natural twisted cochain models, relative exact sequences and coefficient pullbacks; in degree one compare cellular cocycles of a presentation with crossed homomorphisms modulo principal ones.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.0/manifold-pairing`, `SymplecticReidemeisterTorsionModSquares:RT.4/genus-two-cocycles`.

### S2. `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`

Provide finite cellular models of finite CW pairs, cellular/singular local-coefficient comparison, Euler characteristic with constant fibre rank, and naturality of these comparisons under subdivisions and maps. The smooth finite triangulation input is requested separately.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.0/manifold-pairing`, `SymplecticReidemeisterTorsionModSquares:RT.2/cellular-volume`, `SymplecticReidemeisterTorsionModSquares:RT.2/cellular-invariance`, `SymplecticReidemeisterTorsionModSquares:RT.4/genus-two-cocycles`.

### S3. `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`

Provide the local-coefficient Wang/Mayer–Vietoris cone model for a mapping torus with a chosen coefficient intertwiner, compatible with restriction and the cellular determinant exact sequence. Also provide finite-cover homology transfer with inclusion-transfer multiplication by the subgroup index, over integral homology reduced modulo two.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.4/mapping-torus-torsion`, `SymplecticReidemeisterTorsionModSquares:RT.7/sylow-witt-lift`.

### S4. `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`

Provide cochain-level Poincaré–Lefschetz duality for compact smooth oriented manifolds and finite projective self-dual local systems, its relative exact triangle and boundary-orientation compatibility, so that the algebraic cone of the relative adjoint identifies with boundary cochains as a symmetric Poincaré complex. A homology-group duality alone is insufficient.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.0/manifold-pairing`, `SymplecticReidemeisterTorsionModSquares:RT.2/duality-volume`, `SymplecticReidemeisterTorsionModSquares:RT.2/bordism`, `SymplecticReidemeisterTorsionModSquares:RT.4/surface-orthogonal-space`.

### S5. `tauceti:TauCetiRoadmap/GeometricTopology#layer-11-triangulations-pl-structures-and-collapse`

Supply finite triangulations of compact smooth manifolds with compatible boundary and dual cells, common smooth-compatible subdivisions, and elementary simple comparison maps preserving the cellular local-system volume. The present Layer 11 principally supplies PL triangulations/collapse; the current document locates the smooth comparison in its further smoothing direction. This request requires that comparison as an explicit GeometricTopology extension and does not assert triangulability of arbitrary topological manifolds.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.0/manifold-pairing`, `SymplecticReidemeisterTorsionModSquares:RT.2/cellular-invariance`.

### S6. `tauceti:TauCetiRoadmap/GeometricTopology#layer-6-knot-concordance-and-4d-cobordism-owned-here`

Supply the geometric oriented bordism category in all finite dimensions with collars, gluing, orientation reversal and relative/excision operations on maps to CW spaces. The labelled group and the low-dimensional Thom comparison are owned here; the existing geometric category is imported.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.3/labelled-bordism`, `SymplecticReidemeisterTorsionModSquares:RT.3/low-bordism`.

### S7. `MotivicEtaleKTheory:M.1`

Classify μ₂-torsors over schemes with 2 invertible by an invertible line with a square trivialization; provide normal-domain injectivity into the generic fibre and extension of generic isomorphisms between finite étale covers. The existing étale-kummer-sequences node gives the cohomology exact sequence but not this complete line-pair/gluing interface.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.3/normal-ring-torsion`, `SymplecticReidemeisterTorsionModSquares:RT.5/quadratic-cover-detection`.

### S8. `MotivicEtaleKTheory:M.8`

Provide universal equivariant finite-coefficient c₂ for the standard representation of discrete Sp_{2r}(R), for normal R with 2 invertible (not only the regular schemes in finite-etale-chern), with pullback, rank stabilization, Kummer and finite-field K₃ normalization, filtered-colimit compatibility, real components c₂₂ and c₃₁, and coefficient-Bockstein compatibility.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.3/etale-transgression`, `SymplecticReidemeisterTorsionModSquares:RT.5/liftable-rank`, `SymplecticReidemeisterTorsionModSquares:RT.7/all-rings-fields`, `SymplecticReidemeisterTorsionModSquares:RT.8/metaplectic-component`, `SymplecticReidemeisterTorsionModSquares:RT.8/real-vanishing`.

### S9. `MotivicEtaleKTheory:M.8`

Identify the real standard-representation component c₂₂ with the discrete pullback of the topological metaplectic cover, including its normalization. AV §1.3.3 cites Soulé IV.3.1 and Weibel Proposition 2.8; those primary comparison arguments were not inspected in this run, so this remains a supplier proof obligation.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.8/metaplectic-component`.

### S10. `MotivicEtaleKTheory:M.7`

For every number field F, supply the Chern surjection K₃^ind(F)→H¹(F,Z₂(2))/2, rank of the torsion-free quotient at least r₂(F), and injectivity of coefficient reduction H¹(F,Z₂(2))/2→H¹(F,μ₂), with the real-place/dyadic corrections and compatibility with standard-representation c₂. arithmetic-adic-degrees excludes the uncorrected dyadic real case and alone does not suffice.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.5/liftable-rank`.

### S11. `K3BlochGroups:V.4`

For an infinite field F, supply the natural Hutchinson–Tao surjection H₃(SL₂(F);Z)→K₃^ind(F), compatible after stabilization with the number-field stable Hurewicz equivalence. AV §2.10 invokes Hutchinson–Tao Lemma 5.1. The existing V.2 number-field Hurewicz node is used directly, so it is not requested again.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.5/liftable-rank`.

### S12. `KTheoryFiniteLocalFields:L.1`

In the finite-field setting k of odd characteristic, provide the mixed-characteristic Witt congruence lift of a Sylow 2-subgroup representation Q→Sp(k) to Q→Sp(W(k)). This needs smooth symplectic congruence kernels and vanishing of positive Q-cohomology on their odd-characteristic additive modules by averaging; ordinary finite-field K₃ calculations alone do not supply it.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.7/sylow-witt-lift`.

### S13. `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-5-simply-connected-covers-and-the-enveloping-algebra`

Specialize the universal covering Lie group to connected Sp_{2r}(R), identify its kernel with Z and its quotient by 2Z with the metaplectic cover. Supply the fundamental-group calculation, for example by deformation retraction to U(r) and its determinant fibration. The general connected-cover target gives kernel π₁(G), not the specific identification π₁(Sp)=Z.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.8/metaplectic-component`.

### S14. `tauceti:TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions`

Use the existing upstream weighted prime-sum estimates: finite exceptional places have zero logarithmically weighted density, and places of residue degree at least two have weight O(X^{1/2}log X). These inputs are imported, not replanned.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.5/controlling`, `SymplecticReidemeisterTorsionModSquares:RT.5/intermediate-field`, `SymplecticReidemeisterTorsionModSquares:RT.7/characteristic-zero`.

### S15. `tauceti:TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c`

Use weighted natural Chebotarev: for a finite Galois number-field extension and conjugacy-invariant subset S, X^{-1}Σ_{Nv≤X,Frob_v∈S}log Nv→|S|/|G|. In particular a nonempty Frobenius subset has positive weighted density. This is the current theta/prime-counting layer, rather than Dirichlet density alone.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.5/controlling`, `SymplecticReidemeisterTorsionModSquares:RT.6/independent-classes`, `SymplecticReidemeisterTorsionModSquares:RT.6/auxiliary-cyclic`, `SymplecticReidemeisterTorsionModSquares:RT.6/density-improvement`, `SymplecticReidemeisterTorsionModSquares:RT.6/good-rational-primes`.

### S16. `tauceti:TauCetiRoadmap/Chebotarev#layer-7-the-auxiliary-prime-and-the-crossing-data`

Use the existing auxiliary cyclotomic-prime and total-ramification argument: a sufficiently large prime unramified in a fixed finite extension produces a cyclotomic extension disjoint from it; combine with the prescribed reduced congruence class from weighted Chebotarev.

**Consumers:** `SymplecticReidemeisterTorsionModSquares:RT.6/auxiliary-cyclic`.

### Arithmetic-scheme Chebotarev supplier

AV §2.8 and §2.14 invoke Serre, Lectures on N_X(p), §9, Theorems 9.1 and 9.11, and Pink Appendix B. The cited book is not cleared in the supplied library and was not read. The current AnalyticNumberTheory:AN.4 is the analytic Hecke/Dedekind/Artin interface, not the finite-type scheme theorem; no exact existing producer node was found. Supply the quadratic-cover Frobenius detection and quantitative characteristic-zero lower bound stated in RT.5/quadratic-cover-detection through an AnalyticNumberTheory Part II, with primary accessible proof and the correct counting normalization. This remains an explicit leaf, not an asserted library result.

**Consumer:** `SymplecticReidemeisterTorsionModSquares:RT.5/quadratic-cover-detection`.

The restructuring proposal assigns this general arithmetic-scheme direction to an AnalyticNumberTheory Part II. The current layers and other packets are unchanged. It must provide a primary accessible proof and attach exact producer IDs before the dependent layers can be closed.

## Suggested Lean boundary

The associated suggested file uses only existing pinned carriers. It contains real definitions of `exoticSign`, `StronglyEven`, the degree-three `semicharacteristicThree`, and the scalar adapter `normalizeSquareClass`. The last takes an actual square-class input and applies the half-sign; it does not assert that an unknown torsion construction exists. It includes sign and dimension examples, the scalar base-change law, the alternating-rank milestone, a no-minus-one Zassenhaus statement against `CliffordAlgebra.spinorNorm`, fixed-space parity and the cubic-decrease limit. The general cohomological semicharacteristic in the reader is broader than its degree-three specialization in this file.

The following carrier families and dependent declarations remain specified exclusively in this reader because they are not supplied at the pins:

- Symmetric Poincaré structures, their signed algebraic boundary, strictification with pairing and Lagrangian subcomplexes: RT.0 and the corresponding RT.1 volume construction.
- The imported coherent graded determinant category, determinant-line square-class torsors and their reverse-wedge/shift comparisons: the non-scalar RT.1 targets, together with the supplier nodes Z.3 and Z.6.
- Finite cellular local-coefficient models with duality and distinguished determinant volumes, manifold torsion, its boundary comparison and the associated geometric data: RT.2 and the circle/mapping-torus torsion statements in RT.4.
- μ₂ root-line pairs over general coefficient schemes, compatible family models, labelled bordism and its fundamental-class comparison, universal étale Chern evaluation and the two transformations: RT.3.
- The full concrete surface-cocycle and twist-action package and exact local-system data of the Gaussian examples: RT.4. Only the existing spinor-norm/linear-algebra milestones are stated in Lean.
- Higher K-theory/Chern comparison carriers, controlling-extension data tied to actual goodness, weighted prime-counting interfaces, arithmetic-scheme Frobenius and torsor detection, Witt representation lifts and the full ring/field comparison: RT.5–RT.7. The real recurrence milestone is stated independently of those missing carriers.
- The compatible universal real Chern components and metaplectic/universal-cover comparison needed for RT.8.

No empty predicate is used to stand in for any of these. The Markdown targets remain required and testable; elaboration of the compact file is a signature check, not formalisation of this roadmap.

## Sources and version discipline


- **AV-v1**: Amina Abdurrahman and Akshay Venkatesh, *Symplectic L-functions and symplectic Reidemeister torsion (mod squares)*, arXiv:2303.13436v1, 23 March 2023; all AV page and statement numbers in this plan refer to these 98 pages. [Text read](https://arxiv.org/pdf/2303.13436v1); accessed 2026-10-18. SHA-256 `3e2736beea70ba3467ad30a24b518d82cf589d9ddd4a06f6b0684c7bfd7d6306`. Read: §1.1, pp. 1–4; §1.3.3, p. 6; §2, pp. 10–26; Appendices A–C, pp. 61–90; TeX source consulted for signs and matrices; SHA-256 e18e82663000a365452b439e971bb49d05a7ea6ce03201309166120e30a44c9e. Arithmetic §§3–6 and Appendix D are outside this roadmap.

- **JRV**: Florent Jouve and Fernando Rodriguez Villegas, *On the bilinear structure associated to Bezoutians*, arXiv:1004.4208v3, 12 September 2013. [Text read](https://arxiv.org/pdf/1004.4208v3); accessed 2026-10-18. SHA-256 `974292033622656f55a7aa39bf622cc745d672b5ceb43f99706fa1c2fa3e1011`. Read: Theorem 5.1 and its proof, pp. 16–17; Lemma 6.1, p. 18. Only the Zassenhaus determinant formula is used.

- **Thom**: René Thom, *Quelques propriétés globales des variétés différentiables*, Commentarii Mathematici Helvetici 28 (1954), 17–86. [Text read](https://www.maths.ed.ac.uk/~v1ranick/papers/thomcob.pdf); accessed 2026-10-18. SHA-256 `3129a3e78fc854b2dd26e1b195335a7d1043e7d911206320c54bbd73b74aaac3`. Read: Chapter IV §8, Theorem IV.13, p. 81: Ω₀^SO = ℤ and Ω₁^SO = Ω₂^SO = Ω₃^SO = 0. The extension to labelled CW complexes is a target proved by skeletal induction here, rather than attributed directly to this coefficient calculation.



The published AV article is Inventiones Mathematicae 241 (2025), 717–839, DOI [10.1007/s00222-025-01349-6](https://doi.org/10.1007/s00222-025-01349-6). Its 123-page full text was not read. The independent review on 2026-10-19 reread all cited public-preprint passages, verified the three PDF hashes, and repeated the version-history and correction searches; it did not inspect the published passages or repeat the original author-PDF comparison. All AV locators and findings below concern the identified 98-page arXiv v1. The author PDF was compared for the relevant B.9/B.10 passages; its SHA-256 is `4bc8373b4252837b98a3c90a9adf8d75408a7a5ff7b39cd7ef39bdfcc7e0d4c8`. No claim is made about whether the version of record corrects these points. The JRV finding is similarly confined to arXiv v3. Sources cited only inside AV, including Serre’s book and the real Chern comparison references, have not been promoted to sources read here.

## Source findings and independent verdicts

All 20 findings were checked at the identified public-preprint locators. E2 and E18 are rejected; the other 18 are confirmed with the scope below. The packet retains the version and correction-search records. All descriptions are in our own words.

### E1 — AV-v1, §1.5, p. 8 (arXiv v1)

**Review: confirmed.** The symplectic basis uses a genus index for rank 2r and assigns self-pairing one to the two basis families. **Resolution:** Index e_i,f_i by 1≤i≤r and set the pairings within each basis family to zero; the cross pairings remain δ_ij. **Review reason:** Confirmed on p. 8, including a missed error within the original finding: internal pairings of the e and f families must be zero, not one. The form matrix fixes the intended alternating form.

### E2 — AV-v1, §2.4, Theorem 2.2, p. 14 (arXiv v1)

**Review: rejected.** The theorem writes the bordism dimension as 4r, reusing a letter that denotes half the coefficient rank elsewhere. **Resolution:** No source correction is required: the dimension parameter is locally bound. This plan calls it j to keep it distinct from half the coefficient rank. **Review reason:** Rejected: Theorem 2.2 locally binds its dimension parameter. Reusing a letter is harmless; the theorem does not relate the manifold dimension to the coefficient rank. The plan may use j for clarity.

### E3 — AV-v1, §2.7, proof of Lemma 2.7.1, pp. 16–17 (arXiv v1)

**Review: confirmed.** The proof treats integral H₂ of the finite symplectic and special linear groups as always zero for odd q. **Resolution:** Use that H₂ has odd order; in rank two over F₉ the multiplier is Z/3. The UCT mod-two comparison remains an isomorphism. **Review reason:** Confirmed as an overstatement of the integral multiplier. The finite-classical-h2-no-two-torsion supplier retains the SL₂(F₉) order-three exception. Odd order, not vanishing, is what the mod-two UCT step needs.

### E12 — AV-v1, Appendix A.6.1, proof of (A.11), p. 66 (arXiv v1)

**Review: confirmed.** The argument assigns the perfect skew form to the cokernel of the middle differential. **Resolution:** It is the quotient C⁰/ker d⁰, isomorphic to im d⁰, that has the induced perfect alternating form, hence even dimension. **Review reason:** Confirmed: the induced alternating form has radical ker d⁰ and is perfect on C⁰/ker d⁰. Thus rank d⁰ is even; the cokernel assertion does not supply that argument.

### E13 — AV-v1, Appendix A.7, pp. 66–67 (arXiv v1)

**Review: confirmed.** The displayed splitting table places the middle acyclic terms a degree too high relative to its labels. **Resolution:** Place E₀,Z₀ in degree zero, B₁,E₁ in degree one, C⁻¹ in degree −1 and C² in degree two. **Review reason:** Confirmed by comparing the displayed arrows with the labelled degrees: the residual pair belongs in degrees zero and one, with the adjacent terms in degrees minus one and two.

### E14 — AV-v1, Appendix B.3 and B.4.1, pp. 70–71, 74 (arXiv v1)

**Review: confirmed.** Several iteration, basis-size and brutal-truncation indices disagree with their constructions. **Resolution:** Use inverse iteration for n≤−1; index a basis by its own dimension; the quotient of σ≥r−1 by σ≥r is C^{r−1}[1−r]; the compatibility statement refers to the three entries of that exact sequence. **Review reason:** Confirmed by the inverse shift iteration, the size of each chosen basis and the degreewise quotient of brutal truncations. The corrected quotient is concentrated in degree r−1.

### E15 — AV-v1, Appendix B.6, (B.20)–(B.23), pp. 78–80 (arXiv v1)

**Review: confirmed.** The cone Lagrangian is named C, the splitting summands are interchanged, and the cone rank formula omits a degree shift. **Resolution:** The cone Lagrangian is C∨[−n]. Use a=b=(−1)^r c; label the acyclic and hyperbolic summands consistently, and dim D^i=dim C^{n−i}+dim C^{i+1}. The formula for the sign determines r modulo two. **Review reason:** Confirmed from Cone(C→C∨[−n])=C∨[−n]⊕C[1]. This fixes the Lagrangian, rank shift and summand labels. The exponent formula specifies parity, not an exact acyclic rank.

### E16 — AV-v1, Appendix B.7–B.8, p. 81 (arXiv v1)

**Review: confirmed.** The torsion definition and its use refer to nearby labels that do not contain the needed construction. **Resolution:** Refer to class (c) of B.6 for the cohomological square root and B.7 for the definition of RT. **Review reason:** Confirmed: B.6 defines class (c), while B.7 is the torsion section. The cited nearby subsection/formula does not define the required object.

### E17 — AV-v1, Appendix B.9.2, (B.33)–(B.36), pp. 83–84 (arXiv v1)

**Review: confirmed.** The Jordan-block acyclic map has an unshifted target chain; a terminal wedge uses the wrong block index, and B.36 uses the wrong second vector. **Resolution:** Use target Ne_j through N^{m_j}e_j, terminal N^{m₂−1}e₂ for the second block, and −⟨M^{m−1}e,Mf⟩ in B.36. The diagonal matrix with determinant v₁v₂ in B.35 is already correct. **Review reason:** Confirmed only for the three specific chain/vector index slips now recorded. The printed B.35 diagonal pairing matrix is already correct; the earlier correction overreached on that point.

### E18 — AV-v1, Appendix B.9, preceding (B.37), p. 85 (arXiv v1)

**Review: rejected.** The paragraph refers to the quantity on the left side of B.30 when concluding bordism invariance. **Resolution:** No correction is needed. The left side of B.30 already includes (−1)^{h/2}RT and is the spinor norm. **Review reason:** Rejected: the paragraph explicitly uses the left side of B.30, which already contains the normalization sign. It does not identify raw torsion as the bordism invariant.

### E19 — AV-v1, §2.3.3, p. 13; Appendix B.10, pp. 85–86 (arXiv v1)

**Review: confirmed.** The general discussion asserts arbitrary normal-domain base change for raw RT. The B.10 strict-model argument also omits the fibre-dependent acyclic sign when identifying the raw class. **Resolution:** Prove functoriality of N=(−1)^{χ₁/₂/2}RT for three-dimensional symplectic families using term ranks. Where normalization is defined, raw fibre values differ from transported raw generic values by (−1)^{(χ_special−χ_generic)/2}. The orthogonal circle counterexample concerns the broader §2.3.3 assertion. **Review reason:** Confirmed with narrowed scope: the circle disproves the broad §2.3.3 assertion, and the strict splitting requires the acyclic sign. It supplies no geometric three-dimensional symplectic counterexample to B.10. The normalized family theorem is justified independently by its local term-rank formula.

### E20 — AV-v1, Appendix C.2, (C.2), p. 87 (arXiv v1)

**Review: confirmed.** The discriminant factor is assigned to the fixed subspace of T. **Resolution:** Take the nondegenerate generalized 1-eigenspace instead. **Review reason:** Confirmed: an ordinary fixed subspace can have a radical for a nontrivial unipotent orthogonal map. The nondegenerate primary component is the generalized eigenspace required by JRV Theorem 5.1.

### E21 — AV-v1, Appendix C.3–C.4, (C.8)–(C.9), pp. 89–90 (arXiv v1)

**Review: confirmed.** The cocycle diagram composes with the induced cohomology operator and the no-fixed-vector condition is attached to the mapping torus rather than the surface; the twist composition convention is unstated. **Resolution:** Use T̃φ=M⁻¹φ∘t, with T acting on H¹ of the surface. Apply the printed twist words leftmost factor first. **Review reason:** Confirmed for the typed source/target slips in C.8–C.9. Independently recomputed the relator, four intertwiners, invariant principal subspace, quotient characteristic polynomials and both determinant ratios using exact rational Gaussian arithmetic. The twist order is an explicit convention, not itself a theorem error.

### E25 — AV-v1, §2.3.2, p. 13; Appendix B.9.1, pp. 82–83; Lemma C.2.1, p. 87; (1.5), p. 3 (arXiv v1)

**Review: confirmed.** The circle and mapping-torus formulas are proved using characteristic-zero Jordan/logarithm arguments, although their use requires odd finite fields. **Resolution:** Prove the circle formula in all characteristics other than two. RT.4 gives a proof using the generalized −1 component, the strict cross pairing on its complement and Zassenhaus Theorem 5.1. **Review reason:** Confirmed as a proof-range gap, not a counterexample to the characteristic-zero statements. B.9 and C.2 use characteristic-zero tools; the finite-field mapping-class application needs the all-odd-characteristic proof supplied by RT.4, with its argument position corrected in this review.

### E26 — AV-v1, §2.7, p. 17; §2.11, Lemma 2.11.1, pp. 20–21 (arXiv v1)

**Review: confirmed.** A nonsquare raw torsion class is used as if it were a nonzero value of N. **Resolution:** Require a nonsquare normalized torsion value, or a square normalization sign. The Q(i) witness satisfies this requirement. **Review reason:** Confirmed: nonsquare raw torsion alone need not make N nonzero. The constant rank-two S³ system gives raw [−1] and normalized 1. The independently recomputed Q(i) witness has h=0 and avoids this problem.

### E27 — AV-v1, §2.11, Definition 2.11.1 and Lemma 2.11.2, pp. 20–21 (arXiv v1)

**Review: confirmed.** Exceptional sets are assigned zero density using a liminf definition, and the proof then unions them. **Resolution:** Require their upper weighted density to be zero, equivalently their weighted counting ratio tends to zero. **Review reason:** Confirmed: lower density zero is not stable under finite unions. The strengthened upper-density-zero condition is preserved by every compositum and descent step used here.

### E28 — AV-v1, §2.11, Lemma 2.11.2, p. 21 (arXiv v1)

**Review: confirmed.** The restriction map from a compositum Galois group is displayed as surjective onto the product. **Resolution:** Only the individual projections are surjective; the product map has its usual fibre-product image unless the extensions are disjoint. **Review reason:** Confirmed: equal nontrivial quadratic extensions already contradict product surjectivity. Only the two individual projections are required; the density proof uses a product solely for its separately proved disjoint quotient.

### E29 — AV-v1, §2.12, Lemma 2.12.2, pp. 22–23 (arXiv v1)

**Review: confirmed.** The subspace hypothesis excludes ⟨α⟩ but does not exclude W=0. **Resolution:** Require dim W≥1 as well. **Review reason:** Confirmed: W=0 has no nonidentity characters and cannot give the required nonempty controlling subset. The added positive-dimension condition removes this unused degenerate case.

### E30 — AV-v1, §2.14, pp. 25–26 (arXiv v1)

**Review: confirmed.** With normalization Q^{−d}, the total logarithmically weighted count of closed points is asserted to tend to 1 in dimension d. **Resolution:** Use the correct normalization from the scheme prime-counting theorem, or only the positive-order lower bound required by the proof. For Spec Z[t], d=2, the displayed normalization tends to 1/2. **Review reason:** Confirmed at pp. 25–26: for Spec Z[t], the degree-one contribution has normalized limit 1/2 and higher residue degrees are lower order. The comparison only requires the positive lower bound now isolated as a supplier gap.

### E31 — JRV, arXiv:1004.4208v3, §5, paragraph preceding Theorem 5.1, p. 16

**Review: confirmed.** The preliminary discussion says the orthogonal spinor norm is surjective as soon as the quadratic space has dimension at least two. **Resolution:** Do not use this surjectivity assertion without further hypotheses, such as an appropriate isotropy or value-representation condition. Only Theorem 5.1 is imported here. **Review reason:** Confirmed in arXiv v3 §5. A positive-definite real plane has only positive reflection values, so its classical spinor image is trivial. No such unrestricted surjectivity is used in the imported Zassenhaus theorem.

## Pinned declaration evidence

- `mathlib:CochainComplex` in `Mathlib/Algebra/Homology/HomologicalComplex.lean`: Cochain complexes are HomologicalComplex objects of shape up, with differentials and square-zero laws.

- `mathlib:HomologicalComplex.homology` in `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean`: Homology object of the associated short complex at an index; over ModuleCat a cochain complex has these objects in every degree.

- `mathlib:groupHomology` in `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`: Homology of inhomogeneous chains of a linear representation; integral coefficients modulo two must be distinguished from homology with F₂ coefficients.

- `mathlib:Sylow` in `Mathlib/GroupTheory/Sylow.lean`: A Sylow p-subgroup is a maximal p-subgroup of a group; transfer and congruence-lifting statements are additional inputs below.

- `mathlib:SymplecticGroup.det_eq_one` in `Mathlib/LinearAlgebra/SymplecticGroup.lean`: Every matrix in symplecticGroup l R over a commutative ring has determinant one, in all finite ranks.

- `tauceti:TauCeti.SquareClassGroup` in `TauCeti/FieldTheory/SquareClassGroup/Basic.lean`: The additive quotient of Kˣ by squares, with its F₂-module structure.

- `tauceti:TauCeti.squareClassHom` in `TauCeti/FieldTheory/SquareClassGroup/Basic.lean`: Multiplicative quotient homomorphism Kˣ → Multiplicative (SquareClassGroup K).

- `tauceti:TauCeti.squareClass_eq_zero_iff` in `TauCeti/FieldTheory/SquareClassGroup/Basic.lean`: The square class of a unit vanishes exactly when the unit is a square.

- `tauceti:RingHom.squareClassMap` in `TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean`: Field homomorphisms act on additive square classes; multiplicativeSquareClassMap is the multiplicative variant.

- `tauceti:CliffordAlgebra.orthogonalSpinorNorm` in `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean`: The orthogonal-group homomorphism defined by Clifford star norm for a nondegenerate finite-dimensional quadratic form with two invertible.

- `tauceti:CliffordAlgebra.orthogonalSpinorNorm_reflectionOrthogonal` in `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean`: On reflection in v the star-norm convention gives the square class of −Q(v), with Q(v) invertible.

- `tauceti:CliffordAlgebra.spinorNorm` in `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean`: The restriction of the existing orthogonal spinor norm to the special orthogonal group; do not reconstruct it.

- `tauceti:CliffordAlgebra.spinorNorm_apply` in `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean`: The special orthogonal spinor norm equals the orthogonal map evaluated on the inclusion.



## Route coverage and layer status

All 41 items assigned by the reviewed AV extraction to this new roadmap are represented below. Generic ingredients already owned by other roadmaps are imported through the direct dependencies of these targets. Every RT layer is **planned**, with the precise remaining supplier or proof-review work recorded at its end. No stage is marked closed and no result is claimed implemented.

| Extraction item | Target node |
| --- | --- |
| 9 | `SymplecticReidemeisterTorsionModSquares:RT.2/torsion` |
| 10 | `SymplecticReidemeisterTorsionModSquares:RT.3/normal-ring-torsion` |
| 11 | `SymplecticReidemeisterTorsionModSquares:RT.2/orientation` |
| 12 | `SymplecticReidemeisterTorsionModSquares:RT.3/semicharacteristic-three` |
| 13 | `SymplecticReidemeisterTorsionModSquares:RT.4/circle-formula` |
| 14 | `SymplecticReidemeisterTorsionModSquares:RT.2/bordism` |
| 15 | `SymplecticReidemeisterTorsionModSquares:RT.3/low-bordism` |
| 16 | `SymplecticReidemeisterTorsionModSquares:RT.3/normalized-transformation` |
| 19 | `SymplecticReidemeisterTorsionModSquares:RT.5/good-field` |
| 21 | `SymplecticReidemeisterTorsionModSquares:RT.5/transfer` |
| 24 | `SymplecticReidemeisterTorsionModSquares:RT.5/liftable-rank` |
| 25 | `SymplecticReidemeisterTorsionModSquares:RT.5/controlling` |
| 26 | `SymplecticReidemeisterTorsionModSquares:RT.5/torsion-control` |
| 27 | `SymplecticReidemeisterTorsionModSquares:RT.5/composita` |
| 28 | `SymplecticReidemeisterTorsionModSquares:RT.5/intermediate-field` |
| 29 | `SymplecticReidemeisterTorsionModSquares:RT.6/independent-classes` |
| 30 | `SymplecticReidemeisterTorsionModSquares:RT.6/multiquadratic` |
| 31 | `SymplecticReidemeisterTorsionModSquares:RT.6/density-improvement` |
| 32 | `SymplecticReidemeisterTorsionModSquares:RT.6/good-rational-primes` |
| 33 | `SymplecticReidemeisterTorsionModSquares:RT.7/characteristic-zero` |
| 34 | `SymplecticReidemeisterTorsionModSquares:RT.7/all-finite-fields` |
| 35 | `SymplecticReidemeisterTorsionModSquares:RT.7/all-rings-fields` |
| 36 | `SymplecticReidemeisterTorsionModSquares:RT.7/topological-theorem` |
| 37 | `SymplecticReidemeisterTorsionModSquares:RT.8/real-vanishing` |
| 74 | `SymplecticReidemeisterTorsionModSquares:RT.0/symmetric-complex` |
| 75 | `SymplecticReidemeisterTorsionModSquares:RT.0/manifold-pairing` |
| 76 | `SymplecticReidemeisterTorsionModSquares:RT.0/algebraic-boundary` |
| 77 | `SymplecticReidemeisterTorsionModSquares:RT.0/strict-parity` |
| 78 | `SymplecticReidemeisterTorsionModSquares:RT.0/strict-splitting` |
| 79 | `SymplecticReidemeisterTorsionModSquares:RT.1/line-square-class` |
| 80 | `SymplecticReidemeisterTorsionModSquares:RT.1/exotic-duality` |
| 81 | `SymplecticReidemeisterTorsionModSquares:RT.1/termwise-determinant` |
| 82 | `SymplecticReidemeisterTorsionModSquares:RT.1/cohomology-determinant` |
| 83 | `SymplecticReidemeisterTorsionModSquares:RT.1/lagrangian-volume` |
| 84 | `SymplecticReidemeisterTorsionModSquares:RT.2/boundary-volumes` |
| 85 | `SymplecticReidemeisterTorsionModSquares:RT.2/duality-volume` |
| 86 | `SymplecticReidemeisterTorsionModSquares:RT.4/zassenhaus` |
| 87 | `SymplecticReidemeisterTorsionModSquares:RT.4/mapping-torus-torsion` |
| 88 | `SymplecticReidemeisterTorsionModSquares:RT.7/mapping-class-identity` |
| 89 | `SymplecticReidemeisterTorsionModSquares:RT.4/genus-two-cocycles` |
| 90 | `SymplecticReidemeisterTorsionModSquares:RT.4/gaussian-example` |
